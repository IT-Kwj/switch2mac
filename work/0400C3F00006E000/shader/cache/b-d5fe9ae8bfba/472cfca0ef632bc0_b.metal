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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c0 [[id(0)]];
    constant _16* vp_c14 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c4 [[id(5)]];
    const device _31* vp_s0 [[id(6)]];
    texture2d<float> vp_t_tcb_8 [[id(7)]];
    sampler vp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_C [[id(9)]];
    sampler vp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> vp_t_tcb_A [[id(11)]];
    sampler vp_t_tcb_ASmplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_E [[id(13)]];
    sampler vp_t_tcb_ESmplr [[id(14)]];
    sampler vp_t_tcb_8Smplr_w [[id(15)]];
    sampler vp_t_tcb_CSmplr_w [[id(16)]];
    sampler vp_t_tcb_ASmplr_w [[id(17)]];
    sampler vp_t_tcb_ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_56 [[user(locn4)]];
    float4 m_60 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
    float4 m_58 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5464 = false;
    bool _2316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_51.x;
    float _76 = in.m_51.y;
    float _78 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _80 = _78 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _83 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _85 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _87 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _85;
    int _89 = _83 << 4;
    bool _93 = _89 == 0;
    bool _95 = _89 == 16;
    bool _97 = _89 == 32;
    bool _99 = _89 == 48;
    bool _101 = _89 == 64;
    float _103 = fma(_80, _76, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _105 = _89 == 80;
    float _107 = as_type<float>(gl_BaseInstance);
    float _109 = _76;
    float _111 = _74;
    if (_93)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _107;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _103 + _115;
    float _119 = fma(_76, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _121 = _89 == 96;
    float _123 = _117 * _117;
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = _119 + _125;
    float _129 = 0.0;
    float _131 = _113;
    if (_93)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _133 = _129;
    float _135 = fma(_87, _87, _123);
    float _137 = _133;
    if (_95)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _139 = _131;
    bool _141 = _89 == 112;
    float _143 = fma(_127, _127, _135);
    float _145 = _139;
    if (_95)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _137;
    float _149 = _147;
    if (_97)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = rsqrt(_143);
    bool _155 = _89 == 128;
    float _157 = _151;
    if (_97)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_99)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _163 = _157;
    bool _165 = _89 == 144;
    float _167 = _163;
    if (_99)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_101)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _173 = _167;
    bool _175 = _89 == 160;
    float _177 = _173;
    if (_101)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _179 = _171;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _179;
    if (_105)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _177;
    bool _187 = _89 == 176;
    float _189 = _185;
    if (_105)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _191 = _183;
    float _193 = log2(_181);
    bool _195 = _89 == 192;
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
    bool _209 = _89 == 208;
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
    bool _219 = _89 == 224;
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
    bool _231 = _89 == 240;
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
    bool _245 = _89 == 256;
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
    bool _255 = _89 == 272;
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
    bool _267 = _89 == 288;
    float _269 = _263;
    if (_195)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _261;
    float _273 = float(_265);
    bool _275 = _89 == 304;
    int _277 = _265 << 4;
    int _279 = _277 + 4288;
    float _281 = _271;
    if (_209)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _283 = _269;
    float _285 = _283;
    if (_209)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _287 = _281;
    float _289 = -_273;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _293 = _287;
    if (_219)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _295 = _285;
    int _297 = _279 + 8;
    uint _300 = uint(int(uint(_297) >> uint(2)));
    uint _302 = uint(int(uint(int(_300)) >> uint(2)));
    int _304 = int(_300) & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    int _308 = int(_300) + 1;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    int _312 = _308 & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    bool _316 = _89 == 320;
    float _318 = _291 + 1.0;
    float _320 = _295;
    if (_219)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _322 = _293;
    float _324 = _322;
    if (_231)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _326 = _320;
    bool _328 = _89 == 336;
    float _330 = exp2(_318);
    float _332 = _326;
    if (_231)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _334 = _324;
    float _336 = _334;
    if (_245)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _338 = _332;
    bool _340 = _89 == 352;
    float _342 = _338;
    if (_245)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_255)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _348 = _342;
    bool _350 = _89 == 368;
    float _352 = _348;
    if (_255)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _354 = _346;
    float _356 = _354;
    if (_267)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _358 = _352;
    float _360 = 1.0 / _330;
    bool _362 = _89 == 384;
    float _364 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _356;
    float _368 = _366;
    if (_275)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _364;
    bool _372 = _89 == 400;
    float _374 = _370;
    if (_275)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _89 == 416;
    float _380 = _376;
    if (_316)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_316)
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
    bool _392 = _89 == 432;
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
    bool _402 = _89 == 448;
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
    bool _412 = _89 == 464;
    float _414 = _410;
    if (_350)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_362)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _89 == 480;
    float _424 = _420;
    if (_362)
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
    bool _432 = _89 == 496;
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
    bool _442 = _89 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _89 == 528;
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
    bool _462 = _89 == 544;
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
    bool _472 = _89 == 560;
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
    bool _482 = _89 == 576;
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
    bool _492 = _89 == 592;
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
    bool _502 = _89 == 608;
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
    bool _512 = _89 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _89 == 640;
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
    bool _532 = _89 == 656;
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
    bool _542 = _89 == 672;
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
    bool _552 = _89 == 688;
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
    bool _562 = _89 == 704;
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
    bool _572 = _89 == 720;
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
    bool _582 = _89 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _89 == 752;
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
    float _626 = _618 * _76;
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
    float _650 = _330 * _648;
    float _652 = -_636;
    float _654 = _626 + _652;
    float _656 = _654 * 2.0;
    float _658 = -_654;
    float _660 = fma(_650, _658, _76);
    float _662 = floor(_656);
    float _664 = _650 * _662;
    float _666 = _664 * 0.5;
    float _668 = _666 + _660;
    float _670 = fma(_80, _668, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _670 + _672;
    float _676 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _678 = _674 * _674;
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _682 = _676 + _680;
    float _684 = fma(_87, _87, _678);
    float _686 = fma(_682, _682, _684);
    float _688 = fma(0.008000000379979610443115234375, (*spvDescriptorSet0.vp_c15)._m0[0].z, 64.0);
    float _690 = sqrt(_686);
    float _692 = precise::max(0.0, _688);
    float _694 = precise::min(_692, 127.0);
    float _696 = trunc(_694);
    int _698 = int(_696);
    float _700 = -_314;
    float _702 = fma(_690, _306, _700);
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = -_666;
    float _708 = fma(_706, _704, _668);
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = fma(_710, 0.008000000379979610443115234375, 64.0);
    float _714 = precise::max(0.0, _712);
    float _716 = precise::min(_714, 127.0);
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _720 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _722 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _720;
    float _724 = trunc(_716);
    int _726 = int(_724);
    int _728 = _718 + 76;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c6)._m0[int(_732)][_734];
    uint _738 = uint(int(uint(_718) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c6)._m0[int(_740)][_742];
    int _746 = _726 << 7;
    int _748 = _746 + _698;
    int _750 = _748 << 4;
    float _752 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _754 = _710 + _752;
    int _756 = _750 + 8;
    float _758 = abs(_722);
    float _760 = abs(_754);
    float _762 = precise::max(_758, _760);
    float _764 = _736 + 8.0;
    uint _766 = uint(int(uint(_756) >> uint(2)));
    float _768 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_766)]);
    bool _770 = _74 >= 0.5;
    bool _772 = isnan(_74);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    float _780 = _764 + _762;
    float _782 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _784 = _710 + _782;
    float _786 = _780 * _744;
    float _788 = _786 * 4.0;
    float _790 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _792 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _796 = precise::max(_788, 1.0);
    float _798 = _790;
    float _800 = as_type<float>(_750);
    if (!_778)
    {
        float _802 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _109 = _802;
    }
    float _804 = _109;
    float _806 = log2(_796);
    float _808 = _804;
    if (!_778)
    {
        float _810 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _111 = _810;
    }
    float _812 = _111;
    float _814 = _812;
    if (!_778)
    {
        float _816 = _804 + _794;
        _808 = _816;
    }
    float _818 = _808;
    float _820 = _818;
    if (!_778)
    {
        float _822 = _812 + _794;
        _814 = _822;
    }
    float _824 = _814;
    float _826 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _826;
    float _830 = trunc(_806);
    int _832 = int(_830);
    float _834 = floor(_806);
    int _836 = min(_832, 4);
    int _838 = _836 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _840 = _838 << 4;
    float _842 = _834 + 1.0;
    float _844 = rint(_834);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    uint _850 = clamp(_848, 0u, 65535u);
    uint _852 = uint(int(uint(_840) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.vp_c6)._m0[int(_854)][_856];
    float _860 = rint(_842);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    uint _866 = clamp(_864, 0u, 65535u);
    int _868 = _840 + 16;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    uint _872 = uint(int(uint(int(_870)) >> uint(2)));
    int _874 = int(_870) & 3;
    float _876 = (*spvDescriptorSet0.vp_c6)._m0[int(_872)][_874];
    float _878 = fma(_784, _858, 0.5);
    float _880 = fma(_828, _858, 0.5);
    float _882 = fma(_784, _876, 0.5);
    float _884 = fma(_828, _876, 0.5);
    float _886 = as_type<float>(_840);
    float _888 = _828;
    float _890 = _824;
    if (!_778)
    {
        float2 _7156 = float2(_818, _824);
        float2 _894 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7156, float2(0.0), isnan(_7156)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7156, float2(0.0), isnan(_7156)), level(0.0)).xw;
        float _896 = _894.x;
        float _898 = _894.y;
        _886 = _896;
        _888 = _898;
    }
    float _900 = _886;
    float _902 = _888;
    float3 _7178 = float3(_880, _878, float(int(_850)));
    float3 _7182 = select(_7178, float3(0.0), isnan(_7178));
    float3 _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7182.xy, uint(rint(_7182.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7182.xy, uint(rint(_7182.z)), level(0.0)).xyz;
    float _908 = _906.x;
    float _910 = _906.y;
    float _912 = _906.z;
    float3 _7197 = float3(_884, _882, float(int(_866)));
    float3 _7199 = select(_7197, float3(0.0), isnan(_7197));
    float3 _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7199.xy, uint(rint(_7199.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7199.xy, uint(rint(_7199.z)), level(0.0)).xyz;
    float _916 = _914.x;
    float _918 = _914.y;
    float _920 = _914.z;
    float _922 = floor(_694);
    int _924 = _750 + 12;
    uint _926 = uint(int(uint(_750) >> uint(2)));
    float _928 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_926)]);
    uint _930 = uint(int(uint(_924) >> uint(2)));
    float _932 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_930)]);
    float _934 = floor(_716);
    float _936 = -_922;
    float _938 = _694 + _936;
    float _940 = -_934;
    float _942 = _716 + _940;
    float _944 = 0.0;
    float _946 = _910;
    if (_778)
    {
        _944 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _948 = _944;
    float _950 = 0.0;
    if (_778)
    {
        float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _790, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _950 = _952;
    }
    float _954 = _950;
    if (_778)
    {
        float _956 = _794 + _954;
        _820 = _956;
    }
    float _958 = _820;
    float _960 = _768 + _938;
    float _962 = precise::clamp(_960, 0.0, 1.0);
    float _964 = _768 + _942;
    float _966 = precise::clamp(_964, 0.0, 1.0);
    bool _968 = _962 >= 1.0;
    bool _970 = isnan(_962);
    bool _972 = _968 || _970;
    bool _974 = isnan(1.0);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    bool _980 = _966 >= 1.0;
    bool _982 = isnan(_966);
    bool _984 = _980 || _982;
    bool _986 = isnan(1.0);
    bool _988 = _984 || _986;
    float _990 = float(_988);
    float _992 = trunc(_978);
    int _994 = int(_992);
    float _996 = trunc(_990);
    int _998 = int(_996);
    int _1000 = _698 + _994;
    int _1002 = _726 << 7;
    int _1004 = _1002 + _1000;
    int _1006 = _726 + _998;
    int _1008 = _1006 << 7;
    int _1010 = _1008 + _1000;
    int _1012 = _1004 << 4;
    int _1014 = _1010 << 4;
    int _1016 = _1006 << 7;
    int _1018 = _1016 + _698;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[0].z + 1.953125;
    int _1022 = _1012 + 12;
    uint _1024 = uint(int(uint(_1012) >> uint(2)));
    float _1026 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1024)]);
    int _1028 = _1014 + 12;
    int _1030 = _1018 << 4;
    uint _1032 = uint(int(uint(_1014) >> uint(2)));
    float _1034 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1032)]);
    uint _1036 = uint(int(uint(_1022) >> uint(2)));
    float _1038 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1036)]);
    uint _1040 = uint(int(uint(_1028) >> uint(2)));
    float _1042 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1040)]);
    int _1044 = _1030 + 12;
    int _1046 = _750 + 4;
    uint _1048 = uint(int(uint(_1030) >> uint(2)));
    float _1050 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1048)]);
    uint _1052 = uint(int(uint(_1044) >> uint(2)));
    float _1054 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1052)]);
    uint _1056 = uint(int(uint(_1046) >> uint(2)));
    float _1058 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1056)]);
    float _1060 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _1062 = _710 + 1.953125;
    float _1064 = _1020;
    float _1066 = as_type<float>(_1044);
    float _1068 = as_type<float>(_1046);
    float _1070 = _1062;
    if (_778)
    {
        float _1072 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _948, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _1064 = _1072;
    }
    float _1074 = _1064;
    if (_778)
    {
        _1066 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _1076 = _1066;
    if (_778)
    {
        float _1078 = fma(_710, _948, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _1068 = _1078;
    }
    float _1080 = _1068;
    float _1082 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _1084 = _1080;
    if (_778)
    {
        float _1086 = fma(_1074, _1076, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _1070 = _1086;
    }
    float _1088 = _1070;
    float _1090 = _1088;
    if (_778)
    {
        float _1092 = fma(_1080, _1076, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _1084 = _1092;
    }
    float _1094 = _1084;
    if (_778)
    {
        float _1096 = _1088 + _794;
        _1090 = _1096;
    }
    float _1098 = _1090;
    if (_778)
    {
        float _1100 = _1094 + _794;
        _798 = _1100;
    }
    float _1102 = _798;
    float _1104 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_778)
    {
        float _1106 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _792, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _800 = _1106;
    }
    float _1108 = _800;
    float _1110 = _900;
    float _1112 = _902;
    if (_778)
    {
        float2 _7516 = float2(_1098, _1102);
        float2 _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7516, float2(0.0), isnan(_7516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7516, float2(0.0), isnan(_7516)), level(0.0)).xw;
        float _1116 = _1114.x;
        float _1118 = _1114.y;
        _1110 = _1116;
        _1112 = _1118;
    }
    float _1120 = _1110;
    float _1122 = _1112;
    float _1124 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _1126 = _1104 + _794;
    if (_778)
    {
        float _1128 = _794 + _1108;
        _890 = _1128;
    }
    float _1130 = _890;
    float _1132 = _1124 + _794;
    float2 _7553 = float2(_1126, _1130);
    float _1134 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7553, float2(0.0), isnan(_7553)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7553, float2(0.0), isnan(_7553)), level(0.0)).x;
    float2 _7561 = float2(_958, _1132);
    float _1136 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7561, float2(0.0), isnan(_7561)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7561, float2(0.0), isnan(_7561)), level(0.0)).x;
    float _1138 = floor(_962);
    float _1140 = floor(_966);
    float _1142 = -_1138;
    float _1144 = _962 + _1142;
    float _1146 = _932 * _1144;
    float _1148 = -_1140;
    float _1150 = _966 + _1148;
    float _1152 = _932 * _942;
    float _1154 = _932 * _1150;
    float _1156 = floor(_1146);
    float _1158 = _932 * _938;
    float _1160 = floor(_1152);
    float _1162 = floor(_1154);
    float _1164 = 1.0 / _932;
    float _1166 = floor(_1158);
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _1170 = -_834;
    float _1172 = _806 + _1170;
    float _1174 = -_912;
    float _1176 = _1174 + _920;
    float _1178 = fma(_1172, 5.42372894287109375, -4.338983058929443359375);
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = fma(_932, _1160, _1166);
    float _1184 = trunc(_1182);
    int _1186 = int(_1184);
    float _1188 = -_908;
    float _1190 = _1188 + _916;
    float _1192 = fma(_1180, _1176, _912);
    float _1194 = fma(_1180, _1190, _908);
    int _1196 = as_type<int>(_928) + _1186;
    float _1198 = fma(_1160, _1038, _1156);
    float _1200 = _1038 * _1164;
    float _1202 = fma(_1162, _1042, _1156);
    float _1204 = _1042 * _1164;
    float _1206 = _1200 * _1198;
    float _1208 = _710 * 0.00012500000593718141317367553710938;
    float _1210 = _1204 * _1202;
    float _1212 = fma(_1054, _1162, _1166);
    float _1214 = _1054 * _1164;
    float _1216 = abs(_1168);
    float _1218 = abs(_1208);
    float _1220 = precise::max(_1216, _1218);
    float _1222 = trunc(_1210);
    int _1224 = int(_1222);
    float _1226 = _1214 * _1212;
    float _1228 = fma(_1220, 20.0, -19.0);
    float _1230 = precise::clamp(_1228, 0.0, 1.0);
    float _1232 = trunc(_1226);
    int _1234 = int(_1232);
    float _1236 = -_1230;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_1238, _1192, _710);
    int _1242 = as_type<int>(_1034) + _1224;
    float _1244 = fma(_1238, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1248 = _1240 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1252 = _1244 + _1250;
    float _1254 = _1248 * _1248;
    float _1256 = _1058 * _938;
    int _1258 = as_type<int>(_1050) + _1234;
    float _1260 = _1058 * _942;
    float _1262 = fma(_1252, _1252, _1254);
    float _1264 = floor(_1256);
    bool _1266 = _1262 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1268 = isnan(_1262);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1274 = _1270 || _1272;
    float _1276 = floor(_1260);
    float _1278 = -_910;
    float _1280 = _1278 + _918;
    float _1282 = fma(_1180, _1280, _910);
    float _1284 = fma(_1120, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1286 = _1140;
    float _1288 = _1136;
    float _1290 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_1274)
    {
        _1286 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1292 = _1286;
    if (!_1274)
    {
        float _1294 = -_1262;
        float _1296 = _1294 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _946 = _1296;
    }
    float _1298 = _946;
    float _1300 = fma(_1238, _1282, _1284);
    float _1302 = fma(_1122, 255.99609375, 7.629510946571826934814453125e-06);
    float _1304 = -_1276;
    float _1306 = _1260 + _1304;
    float _1308 = _1264 + _1276;
    float _1310 = _1298;
    float _1312 = _1300;
    if (!_1274)
    {
        float _1314 = -_1298;
        float _1316 = fma(_1314, _1292, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = floor(_1302);
    float _1322 = _1318;
    if (!_1274)
    {
        float _1324 = precise::min(_1300, _1318);
        _1322 = _1324;
    }
    float _1326 = _1322;
    float _1328 = trunc(_1308);
    int _1330 = int(_1328);
    float _1332 = fma(_1134, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1334 = fma(_1136, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (!_1274)
    {
        float _1336 = _1262 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1288 = _1336;
    }
    float _1338 = _1288;
    if (!_1274)
    {
        float _1340 = -_1326;
        float _1342 = _1300 + _1340;
        _1290 = _1342;
    }
    float _1344 = _1290;
    if (!_1274)
    {
        float _1346 = fma(_1338, _1344, _1326);
        _1312 = _1346;
    }
    float _1348 = _1312;
    float _1350 = -_1284;
    float _1352 = _1350 + _1332;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1356 = -_1284;
    float _1358 = _1356 + _1334;
    float _1360 = _1352 * 1.953125;
    int _1362 = _1330 & 1;
    bool _1364 = _1362 != 0;
    float _1366 = -_1320;
    float _1368 = _1302 + _1366;
    float _1370 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1372 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1354);
    float _1374 = _1358 * 1.953125;
    float _1376 = fma(_1360, _1360, 14.55191516876220703125);
    float _1378 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1380 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1370);
    float _1382 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1372);
    float _1384 = fma(_1374, _1374, _1376);
    float _1386 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1378);
    float _1388 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1380);
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1392 = rsqrt(_1384);
    float _1394 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1386);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1400 = -_1264;
    float _1402 = _1256 + _1400;
    bool _1404 = _1368 > 0.499000012874603271484375;
    float _1406 = trunc(_1206);
    int _1408 = int(_1406);
    float _1410 = _1394 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1412 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1416 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1398);
    float _1418 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1420 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1412);
    float _1422 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1414);
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1416);
    float _1426 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1418);
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1420);
    float _1430 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1434 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1426);
    float _1436 = _1374 * _1392;
    float _1438 = _1360 * _1392;
    int _1440 = as_type<int>(_1026) + _1408;
    float _1442 = _1392 * 3.814697265625;
    float _1444 = _1428 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1446 = _1430 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1448 = _1434 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1450 = !_1404;
    int _1452 = _1450 ? as_type<int>(_1432) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    float _2252;
    float _2254;
    float _2256;
    float _2258;
    float _2260;
    float _2262;
    float _2264;
    float _2266;
    float _2268;
    float _2270;
    float _2272;
    float _2274;
    float _2276;
    float _2278;
    float _2280;
    float _2282;
    float _2284;
    float _2286;
    float _2288;
    float _2290;
    float _2292;
    float _2294;
    float _2296;
    float _2298;
    float _2300;
    float _2302;
    float _2304;
    float _2306;
    float _2308;
    float _2310;
    float _2312;
    float _2314;
    if (!_1364)
    {
        float _1454 = fma(_1306, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1456 = fma(_1402, -0.707106769084930419921875, _1454);
        bool _1458 = _1456 >= 0.0;
        bool _1460 = !_1458;
        if (!_1460)
        {
            int _1462 = _1440 * 656;
            int _1464 = _1462 + 262144;
            int _1466 = _1462 + 262192;
            int _1468 = _1462 + 262160;
            uint _1470 = uint(int(uint(_1464) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1470)];
            float _1472 = as_type<float>(_dmw0.x);
            int _1474 = _1464 + 4;
            uint _1476 = uint(int(uint(_1474) >> uint(2)));
            float _1478 = as_type<float>(_dmw0.y);
            int _1480 = _1464 + 8;
            uint _1482 = uint(int(uint(_1480) >> uint(2)));
            float _1484 = as_type<float>(_dmw0.z);
            int _1486 = _1464 + 12;
            uint _1488 = uint(int(uint(_1486) >> uint(2)));
            float _1490 = as_type<float>(_dmw0.w);
            int _1492 = _1462 + 262208;
            int _1494 = _1462 + 262176;
            uint _1496 = uint(int(uint(_1466) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1496)];
            float _1498 = as_type<float>(_dmw3.x);
            int _1500 = _1466 + 4;
            uint _1502 = uint(int(uint(_1500) >> uint(2)));
            float _1504 = as_type<float>(_dmw3.y);
            int _1506 = _1466 + 8;
            uint _1508 = uint(int(uint(_1506) >> uint(2)));
            float _1510 = as_type<float>(_dmw3.z);
            int _1512 = _1466 + 12;
            uint _1514 = uint(int(uint(_1512) >> uint(2)));
            float _1516 = as_type<float>(_dmw3.w);
            int _1518 = _1462 + 262224;
            uint _1520 = uint(int(uint(_1468) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1520)];
            float _1522 = as_type<float>(_dmw1.x);
            int _1524 = _1468 + 4;
            uint _1526 = uint(int(uint(_1524) >> uint(2)));
            float _1528 = as_type<float>(_dmw1.y);
            int _1530 = _1468 + 8;
            uint _1532 = uint(int(uint(_1530) >> uint(2)));
            float _1534 = as_type<float>(_dmw1.z);
            int _1536 = _1468 + 12;
            uint _1538 = uint(int(uint(_1536) >> uint(2)));
            float _1540 = as_type<float>(_dmw1.w);
            int _1542 = _1462 + 262240;
            uint _1544 = uint(int(uint(_1492) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1544)];
            float _1546 = as_type<float>(_dmw4.x);
            int _1548 = _1492 + 4;
            uint _1550 = uint(int(uint(_1548) >> uint(2)));
            float _1552 = as_type<float>(_dmw4.y);
            int _1554 = _1492 + 8;
            uint _1556 = uint(int(uint(_1554) >> uint(2)));
            float _1558 = as_type<float>(_dmw4.z);
            int _1560 = _1492 + 12;
            uint _1562 = uint(int(uint(_1560) >> uint(2)));
            float _1564 = as_type<float>(_dmw4.w);
            int _1566 = _1462 + 262256;
            int _1568 = _1196 * 656;
            uint _1570 = uint(int(uint(_1494) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1570)];
            float _1572 = as_type<float>(_dmw2.x);
            int _1574 = _1494 + 4;
            uint _1576 = uint(int(uint(_1574) >> uint(2)));
            float _1578 = as_type<float>(_dmw2.y);
            int _1580 = _1494 + 8;
            uint _1582 = uint(int(uint(_1580) >> uint(2)));
            float _1584 = as_type<float>(_dmw2.z);
            int _1586 = _1494 + 12;
            uint _1588 = uint(int(uint(_1586) >> uint(2)));
            float _1590 = as_type<float>(_dmw2.w);
            int _1592 = _1258 * 656;
            uint _1594 = uint(int(uint(_1518) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1594)];
            float _1596 = as_type<float>(_dmw5.x);
            int _1598 = _1518 + 4;
            uint _1600 = uint(int(uint(_1598) >> uint(2)));
            float _1602 = as_type<float>(_dmw5.y);
            int _1604 = _1518 + 8;
            uint _1606 = uint(int(uint(_1604) >> uint(2)));
            float _1608 = as_type<float>(_dmw5.z);
            int _1610 = _1518 + 12;
            uint _1612 = uint(int(uint(_1610) >> uint(2)));
            float _1614 = as_type<float>(_dmw5.w);
            int _1616 = _1568 + 262144;
            uint _1618 = uint(int(uint(_1542) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1618)];
            float _1620 = as_type<float>(_dmw6.x);
            int _1622 = _1542 + 4;
            uint _1624 = uint(int(uint(_1622) >> uint(2)));
            float _1626 = as_type<float>(_dmw6.y);
            int _1628 = _1542 + 8;
            uint _1630 = uint(int(uint(_1628) >> uint(2)));
            float _1632 = as_type<float>(_dmw6.z);
            int _1634 = _1542 + 12;
            uint _1636 = uint(int(uint(_1634) >> uint(2)));
            float _1638 = as_type<float>(_dmw6.w);
            int _1640 = _1568 + 262192;
            int _1642 = _1568 + 262160;
            uint _1644 = uint(int(uint(_1566) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1644)];
            float _1646 = as_type<float>(_dmw7.x);
            int _1648 = _1566 + 4;
            uint _1650 = uint(int(uint(_1648) >> uint(2)));
            float _1652 = as_type<float>(_dmw7.y);
            int _1654 = _1566 + 8;
            uint _1656 = uint(int(uint(_1654) >> uint(2)));
            float _1658 = as_type<float>(_dmw7.z);
            int _1660 = _1566 + 12;
            uint _1662 = uint(int(uint(_1660) >> uint(2)));
            float _1664 = as_type<float>(_dmw7.w);
            int _1666 = _1568 + 262208;
            int _1668 = _1568 + 262176;
            uint _1670 = uint(int(uint(_1616) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1670)];
            float _1672 = as_type<float>(_dmw8.x);
            int _1674 = _1616 + 4;
            uint _1676 = uint(int(uint(_1674) >> uint(2)));
            float _1678 = as_type<float>(_dmw8.y);
            int _1680 = _1616 + 8;
            uint _1682 = uint(int(uint(_1680) >> uint(2)));
            float _1684 = as_type<float>(_dmw8.z);
            int _1686 = _1616 + 12;
            uint _1688 = uint(int(uint(_1686) >> uint(2)));
            float _1690 = as_type<float>(_dmw8.w);
            int _1692 = _1568 + 262224;
            int _1694 = _1568 + 262240;
            uint _1696 = uint(int(uint(_1640) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1696)];
            float _1698 = as_type<float>(_dmw11.x);
            int _1700 = _1640 + 4;
            uint _1702 = uint(int(uint(_1700) >> uint(2)));
            float _1704 = as_type<float>(_dmw11.y);
            int _1706 = _1640 + 8;
            uint _1708 = uint(int(uint(_1706) >> uint(2)));
            float _1710 = as_type<float>(_dmw11.z);
            int _1712 = _1640 + 12;
            uint _1714 = uint(int(uint(_1712) >> uint(2)));
            float _1716 = as_type<float>(_dmw11.w);
            int _1718 = _1568 + 262256;
            int _1720 = _1592 + 262144;
            uint _1722 = uint(int(uint(_1642) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1722)];
            float _1724 = as_type<float>(_dmw9.x);
            int _1726 = _1642 + 4;
            uint _1728 = uint(int(uint(_1726) >> uint(2)));
            float _1730 = as_type<float>(_dmw9.y);
            int _1732 = _1642 + 8;
            uint _1734 = uint(int(uint(_1732) >> uint(2)));
            float _1736 = as_type<float>(_dmw9.z);
            int _1738 = _1642 + 12;
            uint _1740 = uint(int(uint(_1738) >> uint(2)));
            float _1742 = as_type<float>(_dmw9.w);
            int _1744 = _1592 + 262192;
            int _1746 = _1592 + 262160;
            uint _1748 = uint(int(uint(_1666) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1748)];
            float _1750 = as_type<float>(_dmw12.x);
            int _1752 = _1666 + 4;
            uint _1754 = uint(int(uint(_1752) >> uint(2)));
            float _1756 = as_type<float>(_dmw12.y);
            int _1758 = _1666 + 8;
            uint _1760 = uint(int(uint(_1758) >> uint(2)));
            float _1762 = as_type<float>(_dmw12.z);
            int _1764 = _1666 + 12;
            uint _1766 = uint(int(uint(_1764) >> uint(2)));
            float _1768 = as_type<float>(_dmw12.w);
            int _1770 = _1592 + 262208;
            int _1772 = _1592 + 262176;
            uint _1774 = uint(int(uint(_1668) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1774)];
            float _1776 = as_type<float>(_dmw10.x);
            int _1778 = _1668 + 4;
            uint _1780 = uint(int(uint(_1778) >> uint(2)));
            float _1782 = as_type<float>(_dmw10.y);
            int _1784 = _1668 + 8;
            uint _1786 = uint(int(uint(_1784) >> uint(2)));
            float _1788 = as_type<float>(_dmw10.z);
            int _1790 = _1668 + 12;
            uint _1792 = uint(int(uint(_1790) >> uint(2)));
            float _1794 = as_type<float>(_dmw10.w);
            int _1796 = _1592 + 262224;
            int _1798 = _1592 + 262240;
            uint _1800 = uint(int(uint(_1692) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1800)];
            float _1802 = as_type<float>(_dmw13.x);
            int _1804 = _1692 + 4;
            uint _1806 = uint(int(uint(_1804) >> uint(2)));
            float _1808 = as_type<float>(_dmw13.y);
            int _1810 = _1692 + 8;
            uint _1812 = uint(int(uint(_1810) >> uint(2)));
            float _1814 = as_type<float>(_dmw13.z);
            int _1816 = _1692 + 12;
            uint _1818 = uint(int(uint(_1816) >> uint(2)));
            float _1820 = as_type<float>(_dmw13.w);
            int _1822 = _1592 + 262256;
            uint _1824 = uint(int(uint(_1694) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1824)];
            float _1826 = as_type<float>(_dmw14.x);
            int _1828 = _1694 + 4;
            uint _1830 = uint(int(uint(_1828) >> uint(2)));
            float _1832 = as_type<float>(_dmw14.y);
            int _1834 = _1694 + 8;
            uint _1836 = uint(int(uint(_1834) >> uint(2)));
            float _1838 = as_type<float>(_dmw14.z);
            int _1840 = _1694 + 12;
            uint _1842 = uint(int(uint(_1840) >> uint(2)));
            float _1844 = as_type<float>(_dmw14.w);
            uint _1846 = uint(int(uint(_1718) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1846)];
            float _1848 = as_type<float>(_dmw15.x);
            int _1850 = _1718 + 4;
            uint _1852 = uint(int(uint(_1850) >> uint(2)));
            float _1854 = as_type<float>(_dmw15.y);
            int _1856 = _1718 + 8;
            uint _1858 = uint(int(uint(_1856) >> uint(2)));
            float _1860 = as_type<float>(_dmw15.z);
            int _1862 = _1718 + 12;
            uint _1864 = uint(int(uint(_1862) >> uint(2)));
            float _1866 = as_type<float>(_dmw15.w);
            uint _1868 = uint(int(uint(_1720) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1868)];
            float _1870 = as_type<float>(_dmw16.x);
            int _1872 = _1720 + 4;
            uint _1874 = uint(int(uint(_1872) >> uint(2)));
            float _1876 = as_type<float>(_dmw16.y);
            int _1878 = _1720 + 8;
            uint _1880 = uint(int(uint(_1878) >> uint(2)));
            float _1882 = as_type<float>(_dmw16.z);
            int _1884 = _1720 + 12;
            uint _1886 = uint(int(uint(_1884) >> uint(2)));
            float _1888 = as_type<float>(_dmw16.w);
            uint _1890 = uint(int(uint(_1744) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1890)];
            float _1892 = as_type<float>(_dmw19.x);
            int _1894 = _1744 + 4;
            uint _1896 = uint(int(uint(_1894) >> uint(2)));
            float _1898 = as_type<float>(_dmw19.y);
            int _1900 = _1744 + 8;
            uint _1902 = uint(int(uint(_1900) >> uint(2)));
            float _1904 = as_type<float>(_dmw19.z);
            int _1906 = _1744 + 12;
            uint _1908 = uint(int(uint(_1906) >> uint(2)));
            float _1910 = as_type<float>(_dmw19.w);
            uint _1912 = uint(int(uint(_1746) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1912)];
            float _1914 = as_type<float>(_dmw17.x);
            int _1916 = _1746 + 4;
            uint _1918 = uint(int(uint(_1916) >> uint(2)));
            float _1920 = as_type<float>(_dmw17.y);
            int _1922 = _1746 + 8;
            uint _1924 = uint(int(uint(_1922) >> uint(2)));
            float _1926 = as_type<float>(_dmw17.z);
            int _1928 = _1746 + 12;
            uint _1930 = uint(int(uint(_1928) >> uint(2)));
            float _1932 = as_type<float>(_dmw17.w);
            uint _1934 = uint(int(uint(_1770) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1934)];
            float _1936 = as_type<float>(_dmw20.x);
            int _1938 = _1770 + 4;
            uint _1940 = uint(int(uint(_1938) >> uint(2)));
            float _1942 = as_type<float>(_dmw20.y);
            int _1944 = _1770 + 8;
            uint _1946 = uint(int(uint(_1944) >> uint(2)));
            float _1948 = as_type<float>(_dmw20.z);
            int _1950 = _1770 + 12;
            uint _1952 = uint(int(uint(_1950) >> uint(2)));
            float _1954 = as_type<float>(_dmw20.w);
            uint _1956 = uint(int(uint(_1772) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1956)];
            float _1958 = as_type<float>(_dmw18.x);
            int _1960 = _1772 + 4;
            uint _1962 = uint(int(uint(_1960) >> uint(2)));
            float _1964 = as_type<float>(_dmw18.y);
            int _1966 = _1772 + 8;
            uint _1968 = uint(int(uint(_1966) >> uint(2)));
            float _1970 = as_type<float>(_dmw18.z);
            int _1972 = _1772 + 12;
            uint _1974 = uint(int(uint(_1972) >> uint(2)));
            float _1976 = as_type<float>(_dmw18.w);
            uint _1978 = uint(int(uint(_1796) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1978)];
            float _1980 = as_type<float>(_dmw21.x);
            int _1982 = _1796 + 4;
            uint _1984 = uint(int(uint(_1982) >> uint(2)));
            float _1986 = as_type<float>(_dmw21.y);
            int _1988 = _1796 + 8;
            uint _1990 = uint(int(uint(_1988) >> uint(2)));
            float _1992 = as_type<float>(_dmw21.z);
            int _1994 = _1796 + 12;
            uint _1996 = uint(int(uint(_1994) >> uint(2)));
            float _1998 = as_type<float>(_dmw21.w);
            uint _2000 = uint(int(uint(_1798) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2000)];
            float _2002 = as_type<float>(_dmw22.x);
            int _2004 = _1798 + 4;
            uint _2006 = uint(int(uint(_2004) >> uint(2)));
            float _2008 = as_type<float>(_dmw22.y);
            int _2010 = _1798 + 8;
            uint _2012 = uint(int(uint(_2010) >> uint(2)));
            float _2014 = as_type<float>(_dmw22.z);
            int _2016 = _1798 + 12;
            uint _2018 = uint(int(uint(_2016) >> uint(2)));
            float _2020 = as_type<float>(_dmw22.w);
            uint _2022 = uint(int(uint(_1822) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2022)];
            float _2024 = as_type<float>(_dmw23.x);
            int _2026 = _1822 + 4;
            uint _2028 = uint(int(uint(_2026) >> uint(2)));
            float _2030 = as_type<float>(_dmw23.y);
            int _2032 = _1822 + 8;
            uint _2034 = uint(int(uint(_2032) >> uint(2)));
            float _2036 = as_type<float>(_dmw23.z);
            int _2038 = _1822 + 12;
            uint _2040 = uint(int(uint(_2038) >> uint(2)));
            float _2042 = as_type<float>(_dmw23.w);
            float _2044 = _1306 + (-1.0);
            float _2046 = -_1402;
            float _2048 = -_2044;
            float _2050 = _2046 + _2048;
            float _2052 = -_2050;
            float _2054 = _2052 + 1.0;
            float _2056 = -_1402;
            float _2058 = _2056 + _2054;
            float _2060 = _1402 * _1472;
            float _2062 = _1402 * _1478;
            float _2064 = _1402 * _1484;
            float _2066 = _1402 * _1490;
            float _2068 = _1402 * _1498;
            float _2070 = _1402 * _1504;
            float _2072 = _1402 * _1510;
            float _2074 = _1402 * _1516;
            float _2076 = _1402 * _1522;
            float _2078 = _1402 * _1528;
            float _2080 = _1402 * _1534;
            float _2082 = _1402 * _1540;
            float _2084 = _1402 * _1546;
            float _2086 = _1402 * _1552;
            float _2088 = _1402 * _1558;
            float _2090 = _1402 * _1564;
            float _2092 = _1402 * _1572;
            float _2094 = _1402 * _1578;
            float _2096 = _1402 * _1584;
            float _2098 = _1402 * _1590;
            float _2100 = _1402 * _1596;
            float _2102 = _1402 * _1602;
            float _2104 = _1402 * _1608;
            float _2106 = _1402 * _1614;
            float _2108 = _1402 * _1620;
            float _2110 = _1402 * _1626;
            float _2112 = _1402 * _1632;
            float _2114 = _1402 * _1638;
            float _2116 = _1402 * _1646;
            float _2118 = _1402 * _1652;
            float _2120 = _1402 * _1658;
            float _2122 = _1402 * _1664;
            float _2124 = fma(_2050, _1672, _2060);
            float _2126 = fma(_2050, _1678, _2062);
            float _2128 = fma(_2050, _1684, _2064);
            float _2130 = fma(_2050, _1690, _2066);
            float _2132 = fma(_2050, _1698, _2068);
            float _2134 = fma(_2050, _1704, _2070);
            float _2136 = fma(_2050, _1710, _2072);
            float _2138 = fma(_2050, _1716, _2074);
            float _2140 = fma(_2050, _1724, _2076);
            float _2142 = fma(_2050, _1730, _2078);
            float _2144 = fma(_2050, _1736, _2080);
            float _2146 = fma(_2050, _1742, _2082);
            float _2148 = fma(_2050, _1750, _2084);
            float _2150 = fma(_2050, _1756, _2086);
            float _2152 = fma(_2050, _1762, _2088);
            float _2154 = fma(_2050, _1768, _2090);
            float _2156 = fma(_2050, _1776, _2092);
            float _2158 = fma(_2050, _1782, _2094);
            float _2160 = fma(_2050, _1788, _2096);
            float _2162 = fma(_2050, _1794, _2098);
            float _2164 = fma(_2050, _1802, _2100);
            float _2166 = fma(_2050, _1808, _2102);
            float _2168 = fma(_2050, _1814, _2104);
            float _2170 = fma(_2050, _1820, _2106);
            float _2172 = fma(_2050, _1826, _2108);
            float _2174 = fma(_2050, _1832, _2110);
            float _2176 = fma(_2050, _1838, _2112);
            float _2178 = fma(_2050, _1844, _2114);
            float _2180 = fma(_2050, _1848, _2116);
            float _2182 = fma(_2050, _1854, _2118);
            float _2184 = fma(_2050, _1860, _2120);
            float _2186 = fma(_2050, _1866, _2122);
            float _2188 = fma(_2058, _1870, _2124);
            float _2190 = fma(_2058, _1876, _2126);
            float _2192 = fma(_2058, _1882, _2128);
            float _2194 = fma(_2058, _1888, _2130);
            float _2196 = fma(_2058, _1892, _2132);
            float _2198 = fma(_2058, _1898, _2134);
            float _2200 = fma(_2058, _1904, _2136);
            float _2202 = fma(_2058, _1910, _2138);
            float _2204 = fma(_2058, _1914, _2140);
            float _2206 = fma(_2058, _1920, _2142);
            float _2208 = fma(_2058, _1926, _2144);
            float _2210 = fma(_2058, _1932, _2146);
            float _2212 = fma(_2058, _1936, _2148);
            float _2214 = fma(_2058, _1942, _2150);
            float _2216 = fma(_2058, _1948, _2152);
            float _2218 = fma(_2058, _1954, _2154);
            float _2220 = fma(_2058, _1958, _2156);
            float _2222 = fma(_2058, _1964, _2158);
            float _2224 = fma(_2058, _1970, _2160);
            float _2226 = fma(_2058, _1976, _2162);
            float _2228 = fma(_2058, _1980, _2164);
            float _2230 = fma(_2058, _1986, _2166);
            float _2232 = fma(_2058, _1992, _2168);
            float _2234 = fma(_2058, _1998, _2170);
            float _2236 = fma(_2058, _2002, _2172);
            float _2238 = fma(_2058, _2008, _2174);
            float _2240 = fma(_2058, _2014, _2176);
            float _2242 = fma(_2058, _2020, _2178);
            float _2244 = fma(_2058, _2024, _2180);
            float _2246 = fma(_2058, _2030, _2182);
            float _2248 = fma(_2058, _2036, _2184);
            float _2250 = fma(_2058, _2042, _2186);
            _2252 = _2198;
            _2254 = _2202;
            _2256 = _2212;
            _2258 = _2196;
            _2260 = _2230;
            _2262 = _2232;
            _2264 = _2214;
            _2266 = _2218;
            _2268 = _2234;
            _2270 = _2228;
            _2272 = _2216;
            _2274 = _2200;
            _2276 = _2246;
            _2278 = _2244;
            _2280 = _2194;
            _2282 = _2204;
            _2284 = _2206;
            _2286 = _2238;
            _2288 = _2188;
            _2290 = _2190;
            _2292 = _2192;
            _2294 = _2236;
            _2296 = _2248;
            _2298 = _2208;
            _2300 = _2210;
            _2302 = _2220;
            _2304 = _2240;
            _2306 = _2250;
            _2308 = _2222;
            _2310 = _2224;
            _2312 = _2226;
            _2314 = _2242;
            _2316 = true;
        }
        else
        {
            int _2318 = _1258 * 656;
            int _2320 = _2318 + 262144;
            int _2322 = _2318 + 262192;
            int _2324 = _2318 + 262160;
            uint _2326 = uint(int(uint(_2320) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2326)];
            float _2328 = as_type<float>(_dmw24.x);
            int _2330 = _2320 + 4;
            uint _2332 = uint(int(uint(_2330) >> uint(2)));
            float _2334 = as_type<float>(_dmw24.y);
            int _2336 = _2320 + 8;
            uint _2338 = uint(int(uint(_2336) >> uint(2)));
            float _2340 = as_type<float>(_dmw24.z);
            int _2342 = _2320 + 12;
            uint _2344 = uint(int(uint(_2342) >> uint(2)));
            float _2346 = as_type<float>(_dmw24.w);
            int _2348 = _2318 + 262208;
            int _2350 = _2318 + 262176;
            uint _2352 = uint(int(uint(_2322) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2352)];
            float _2354 = as_type<float>(_dmw27.x);
            int _2356 = _2322 + 4;
            uint _2358 = uint(int(uint(_2356) >> uint(2)));
            float _2360 = as_type<float>(_dmw27.y);
            int _2362 = _2322 + 8;
            uint _2364 = uint(int(uint(_2362) >> uint(2)));
            float _2366 = as_type<float>(_dmw27.z);
            int _2368 = _2322 + 12;
            uint _2370 = uint(int(uint(_2368) >> uint(2)));
            float _2372 = as_type<float>(_dmw27.w);
            int _2374 = _2318 + 262224;
            uint _2376 = uint(int(uint(_2324) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2376)];
            float _2378 = as_type<float>(_dmw25.x);
            int _2380 = _2324 + 4;
            uint _2382 = uint(int(uint(_2380) >> uint(2)));
            float _2384 = as_type<float>(_dmw25.y);
            int _2386 = _2324 + 8;
            uint _2388 = uint(int(uint(_2386) >> uint(2)));
            float _2390 = as_type<float>(_dmw25.z);
            int _2392 = _2324 + 12;
            uint _2394 = uint(int(uint(_2392) >> uint(2)));
            float _2396 = as_type<float>(_dmw25.w);
            int _2398 = _2318 + 262240;
            uint _2400 = uint(int(uint(_2348) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2400)];
            float _2402 = as_type<float>(_dmw28.x);
            int _2404 = _2348 + 4;
            uint _2406 = uint(int(uint(_2404) >> uint(2)));
            float _2408 = as_type<float>(_dmw28.y);
            int _2410 = _2348 + 8;
            uint _2412 = uint(int(uint(_2410) >> uint(2)));
            float _2414 = as_type<float>(_dmw28.z);
            int _2416 = _2348 + 12;
            uint _2418 = uint(int(uint(_2416) >> uint(2)));
            float _2420 = as_type<float>(_dmw28.w);
            int _2422 = _2318 + 262256;
            int _2424 = _1440 * 656;
            uint _2426 = uint(int(uint(_2350) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2426)];
            float _2428 = as_type<float>(_dmw26.x);
            int _2430 = _2350 + 4;
            uint _2432 = uint(int(uint(_2430) >> uint(2)));
            float _2434 = as_type<float>(_dmw26.y);
            int _2436 = _2350 + 8;
            uint _2438 = uint(int(uint(_2436) >> uint(2)));
            float _2440 = as_type<float>(_dmw26.z);
            int _2442 = _2350 + 12;
            uint _2444 = uint(int(uint(_2442) >> uint(2)));
            float _2446 = as_type<float>(_dmw26.w);
            uint _2448 = uint(int(uint(_2374) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2448)];
            float _2450 = as_type<float>(_dmw29.x);
            int _2452 = _2374 + 4;
            uint _2454 = uint(int(uint(_2452) >> uint(2)));
            float _2456 = as_type<float>(_dmw29.y);
            int _2458 = _2374 + 8;
            uint _2460 = uint(int(uint(_2458) >> uint(2)));
            float _2462 = as_type<float>(_dmw29.z);
            int _2464 = _2374 + 12;
            uint _2466 = uint(int(uint(_2464) >> uint(2)));
            float _2468 = as_type<float>(_dmw29.w);
            int _2470 = _1242 * 656;
            uint _2472 = uint(int(uint(_2398) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2472)];
            float _2474 = as_type<float>(_dmw30.x);
            int _2476 = _2398 + 4;
            uint _2478 = uint(int(uint(_2476) >> uint(2)));
            float _2480 = as_type<float>(_dmw30.y);
            int _2482 = _2398 + 8;
            uint _2484 = uint(int(uint(_2482) >> uint(2)));
            float _2486 = as_type<float>(_dmw30.z);
            int _2488 = _2398 + 12;
            uint _2490 = uint(int(uint(_2488) >> uint(2)));
            float _2492 = as_type<float>(_dmw30.w);
            int _2494 = _2424 + 262144;
            int _2496 = _2424 + 262192;
            uint _2498 = uint(int(uint(_2422) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2498)];
            float _2500 = as_type<float>(_dmw31.x);
            int _2502 = _2422 + 4;
            uint _2504 = uint(int(uint(_2502) >> uint(2)));
            float _2506 = as_type<float>(_dmw31.y);
            int _2508 = _2422 + 8;
            uint _2510 = uint(int(uint(_2508) >> uint(2)));
            float _2512 = as_type<float>(_dmw31.z);
            int _2514 = _2422 + 12;
            uint _2516 = uint(int(uint(_2514) >> uint(2)));
            float _2518 = as_type<float>(_dmw31.w);
            int _2520 = _2424 + 262160;
            int _2522 = _2424 + 262208;
            uint _2524 = uint(int(uint(_2494) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2524)];
            float _2526 = as_type<float>(_dmw32.x);
            int _2528 = _2494 + 4;
            uint _2530 = uint(int(uint(_2528) >> uint(2)));
            float _2532 = as_type<float>(_dmw32.y);
            int _2534 = _2494 + 8;
            uint _2536 = uint(int(uint(_2534) >> uint(2)));
            float _2538 = as_type<float>(_dmw32.z);
            int _2540 = _2494 + 12;
            uint _2542 = uint(int(uint(_2540) >> uint(2)));
            float _2544 = as_type<float>(_dmw32.w);
            int _2546 = _2424 + 262176;
            int _2548 = _2424 + 262224;
            uint _2550 = uint(int(uint(_2496) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2550)];
            float _2552 = as_type<float>(_dmw35.x);
            int _2554 = _2496 + 4;
            uint _2556 = uint(int(uint(_2554) >> uint(2)));
            float _2558 = as_type<float>(_dmw35.y);
            int _2560 = _2496 + 8;
            uint _2562 = uint(int(uint(_2560) >> uint(2)));
            float _2564 = as_type<float>(_dmw35.z);
            int _2566 = _2496 + 12;
            uint _2568 = uint(int(uint(_2566) >> uint(2)));
            float _2570 = as_type<float>(_dmw35.w);
            int _2572 = _2424 + 262240;
            int _2574 = _2424 + 262256;
            uint _2576 = uint(int(uint(_2520) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2576)];
            float _2578 = as_type<float>(_dmw33.x);
            int _2580 = _2520 + 4;
            uint _2582 = uint(int(uint(_2580) >> uint(2)));
            float _2584 = as_type<float>(_dmw33.y);
            int _2586 = _2520 + 8;
            uint _2588 = uint(int(uint(_2586) >> uint(2)));
            float _2590 = as_type<float>(_dmw33.z);
            int _2592 = _2520 + 12;
            uint _2594 = uint(int(uint(_2592) >> uint(2)));
            float _2596 = as_type<float>(_dmw33.w);
            int _2598 = _2470 + 262144;
            int _2600 = _2470 + 262192;
            uint _2602 = uint(int(uint(_2522) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2602)];
            float _2604 = as_type<float>(_dmw36.x);
            int _2606 = _2522 + 4;
            uint _2608 = uint(int(uint(_2606) >> uint(2)));
            float _2610 = as_type<float>(_dmw36.y);
            int _2612 = _2522 + 8;
            uint _2614 = uint(int(uint(_2612) >> uint(2)));
            float _2616 = as_type<float>(_dmw36.z);
            int _2618 = _2522 + 12;
            uint _2620 = uint(int(uint(_2618) >> uint(2)));
            float _2622 = as_type<float>(_dmw36.w);
            int _2624 = _2470 + 262160;
            int _2626 = _2470 + 262208;
            uint _2628 = uint(int(uint(_2546) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2628)];
            float _2630 = as_type<float>(_dmw34.x);
            int _2632 = _2546 + 4;
            uint _2634 = uint(int(uint(_2632) >> uint(2)));
            float _2636 = as_type<float>(_dmw34.y);
            int _2638 = _2546 + 8;
            uint _2640 = uint(int(uint(_2638) >> uint(2)));
            float _2642 = as_type<float>(_dmw34.z);
            int _2644 = _2546 + 12;
            uint _2646 = uint(int(uint(_2644) >> uint(2)));
            float _2648 = as_type<float>(_dmw34.w);
            int _2650 = _2470 + 262176;
            int _2652 = _2470 + 262224;
            uint _2654 = uint(int(uint(_2548) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2654)];
            float _2656 = as_type<float>(_dmw37.x);
            int _2658 = _2548 + 4;
            uint _2660 = uint(int(uint(_2658) >> uint(2)));
            float _2662 = as_type<float>(_dmw37.y);
            int _2664 = _2548 + 8;
            uint _2666 = uint(int(uint(_2664) >> uint(2)));
            float _2668 = as_type<float>(_dmw37.z);
            int _2670 = _2548 + 12;
            uint _2672 = uint(int(uint(_2670) >> uint(2)));
            float _2674 = as_type<float>(_dmw37.w);
            int _2676 = _2470 + 262240;
            int _2678 = _2470 + 262256;
            uint _2680 = uint(int(uint(_2572) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2680)];
            float _2682 = as_type<float>(_dmw38.x);
            int _2684 = _2572 + 4;
            uint _2686 = uint(int(uint(_2684) >> uint(2)));
            float _2688 = as_type<float>(_dmw38.y);
            int _2690 = _2572 + 8;
            uint _2692 = uint(int(uint(_2690) >> uint(2)));
            float _2694 = as_type<float>(_dmw38.z);
            int _2696 = _2572 + 12;
            uint _2698 = uint(int(uint(_2696) >> uint(2)));
            float _2700 = as_type<float>(_dmw38.w);
            uint _2702 = uint(int(uint(_2574) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2702)];
            float _2704 = as_type<float>(_dmw39.x);
            int _2706 = _2574 + 4;
            uint _2708 = uint(int(uint(_2706) >> uint(2)));
            float _2710 = as_type<float>(_dmw39.y);
            int _2712 = _2574 + 8;
            uint _2714 = uint(int(uint(_2712) >> uint(2)));
            float _2716 = as_type<float>(_dmw39.z);
            int _2718 = _2574 + 12;
            uint _2720 = uint(int(uint(_2718) >> uint(2)));
            float _2722 = as_type<float>(_dmw39.w);
            uint _2724 = uint(int(uint(_2598) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2724)];
            float _2726 = as_type<float>(_dmw40.x);
            int _2728 = _2598 + 4;
            uint _2730 = uint(int(uint(_2728) >> uint(2)));
            float _2732 = as_type<float>(_dmw40.y);
            int _2734 = _2598 + 8;
            uint _2736 = uint(int(uint(_2734) >> uint(2)));
            float _2738 = as_type<float>(_dmw40.z);
            int _2740 = _2598 + 12;
            uint _2742 = uint(int(uint(_2740) >> uint(2)));
            float _2744 = as_type<float>(_dmw40.w);
            uint _2746 = uint(int(uint(_2600) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2746)];
            float _2748 = as_type<float>(_dmw43.x);
            int _2750 = _2600 + 4;
            uint _2752 = uint(int(uint(_2750) >> uint(2)));
            float _2754 = as_type<float>(_dmw43.y);
            int _2756 = _2600 + 8;
            uint _2758 = uint(int(uint(_2756) >> uint(2)));
            float _2760 = as_type<float>(_dmw43.z);
            int _2762 = _2600 + 12;
            uint _2764 = uint(int(uint(_2762) >> uint(2)));
            float _2766 = as_type<float>(_dmw43.w);
            uint _2768 = uint(int(uint(_2624) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2768)];
            float _2770 = as_type<float>(_dmw41.x);
            int _2772 = _2624 + 4;
            uint _2774 = uint(int(uint(_2772) >> uint(2)));
            float _2776 = as_type<float>(_dmw41.y);
            int _2778 = _2624 + 8;
            uint _2780 = uint(int(uint(_2778) >> uint(2)));
            float _2782 = as_type<float>(_dmw41.z);
            int _2784 = _2624 + 12;
            uint _2786 = uint(int(uint(_2784) >> uint(2)));
            float _2788 = as_type<float>(_dmw41.w);
            uint _2790 = uint(int(uint(_2626) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2790)];
            float _2792 = as_type<float>(_dmw44.x);
            int _2794 = _2626 + 4;
            uint _2796 = uint(int(uint(_2794) >> uint(2)));
            float _2798 = as_type<float>(_dmw44.y);
            int _2800 = _2626 + 8;
            uint _2802 = uint(int(uint(_2800) >> uint(2)));
            float _2804 = as_type<float>(_dmw44.z);
            int _2806 = _2626 + 12;
            uint _2808 = uint(int(uint(_2806) >> uint(2)));
            float _2810 = as_type<float>(_dmw44.w);
            uint _2812 = uint(int(uint(_2650) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2812)];
            float _2814 = as_type<float>(_dmw42.x);
            int _2816 = _2650 + 4;
            uint _2818 = uint(int(uint(_2816) >> uint(2)));
            float _2820 = as_type<float>(_dmw42.y);
            int _2822 = _2650 + 8;
            uint _2824 = uint(int(uint(_2822) >> uint(2)));
            float _2826 = as_type<float>(_dmw42.z);
            int _2828 = _2650 + 12;
            uint _2830 = uint(int(uint(_2828) >> uint(2)));
            float _2832 = as_type<float>(_dmw42.w);
            uint _2834 = uint(int(uint(_2652) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2834)];
            float _2836 = as_type<float>(_dmw45.x);
            int _2838 = _2652 + 4;
            uint _2840 = uint(int(uint(_2838) >> uint(2)));
            float _2842 = as_type<float>(_dmw45.y);
            int _2844 = _2652 + 8;
            uint _2846 = uint(int(uint(_2844) >> uint(2)));
            float _2848 = as_type<float>(_dmw45.z);
            int _2850 = _2652 + 12;
            uint _2852 = uint(int(uint(_2850) >> uint(2)));
            float _2854 = as_type<float>(_dmw45.w);
            uint _2856 = uint(int(uint(_2676) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2856)];
            float _2858 = as_type<float>(_dmw46.x);
            int _2860 = _2676 + 4;
            uint _2862 = uint(int(uint(_2860) >> uint(2)));
            float _2864 = as_type<float>(_dmw46.y);
            int _2866 = _2676 + 8;
            uint _2868 = uint(int(uint(_2866) >> uint(2)));
            float _2870 = as_type<float>(_dmw46.z);
            int _2872 = _2676 + 12;
            uint _2874 = uint(int(uint(_2872) >> uint(2)));
            float _2876 = as_type<float>(_dmw46.w);
            uint _2878 = uint(int(uint(_2678) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2878)];
            float _2880 = as_type<float>(_dmw47.x);
            int _2882 = _2678 + 4;
            uint _2884 = uint(int(uint(_2882) >> uint(2)));
            float _2886 = as_type<float>(_dmw47.y);
            int _2888 = _2678 + 8;
            uint _2890 = uint(int(uint(_2888) >> uint(2)));
            float _2892 = as_type<float>(_dmw47.z);
            int _2894 = _2678 + 12;
            uint _2896 = uint(int(uint(_2894) >> uint(2)));
            float _2898 = as_type<float>(_dmw47.w);
            float _2900 = _1402 + (-1.0);
            float _2902 = -_2900;
            float _2904 = _2328 * _2902;
            float _2906 = -_2900;
            float _2908 = _2346 * _2906;
            float _2910 = -_2900;
            float _2912 = _2334 * _2910;
            float _2914 = -_2900;
            float _2916 = _2340 * _2914;
            float _2918 = -_2900;
            float _2920 = _2354 * _2918;
            float _2922 = -_2900;
            float _2924 = _2372 * _2922;
            float _2926 = -_2900;
            float _2928 = _2360 * _2926;
            float _2930 = -_2900;
            float _2932 = _2366 * _2930;
            float _2934 = -_2900;
            float _2936 = _2378 * _2934;
            float _2938 = -_2900;
            float _2940 = _2396 * _2938;
            float _2942 = -_2900;
            float _2944 = _2384 * _2942;
            float _2946 = -_2900;
            float _2948 = _2390 * _2946;
            float _2950 = -_2900;
            float _2952 = _2402 * _2950;
            float _2954 = -_2900;
            float _2956 = _2420 * _2954;
            float _2958 = -_2900;
            float _2960 = _2408 * _2958;
            float _2962 = -_2900;
            float _2964 = _2414 * _2962;
            float _2966 = -_2900;
            float _2968 = _2428 * _2966;
            float _2970 = -_2900;
            float _2972 = _2446 * _2970;
            float _2974 = -_2900;
            float _2976 = _2434 * _2974;
            float _2978 = -_2900;
            float _2980 = _2440 * _2978;
            float _2982 = -_2900;
            float _2984 = _2450 * _2982;
            float _2986 = -_2900;
            float _2988 = _2468 * _2986;
            float _2990 = -_2900;
            float _2992 = _2456 * _2990;
            float _2994 = -_2900;
            float _2996 = _2462 * _2994;
            float _2998 = -_2900;
            float _3000 = _2474 * _2998;
            float _3002 = -_2900;
            float _3004 = _2492 * _3002;
            float _3006 = -_2900;
            float _3008 = _2480 * _3006;
            float _3010 = -_2900;
            float _3012 = _2486 * _3010;
            float _3014 = -_2900;
            float _3016 = _2500 * _3014;
            float _3018 = -_2900;
            float _3020 = _2506 * _3018;
            float _3022 = -_2900;
            float _3024 = _2512 * _3022;
            float _3026 = _1306 + (-1.0);
            float _3028 = -_2900;
            float _3030 = _2518 * _3028;
            float _3032 = _1306 + _2900;
            float _3034 = -_3026;
            float _3036 = fma(_3034, _2526, _2904);
            float _3038 = -_3026;
            float _3040 = fma(_3038, _2532, _2912);
            float _3042 = -_3026;
            float _3044 = fma(_3042, _2538, _2916);
            float _3046 = -_3026;
            float _3048 = fma(_3046, _2544, _2908);
            float _3050 = -_3026;
            float _3052 = fma(_3050, _2552, _2920);
            float _3054 = -_3026;
            float _3056 = fma(_3054, _2558, _2928);
            float _3058 = -_3026;
            float _3060 = fma(_3058, _2564, _2932);
            float _3062 = -_3026;
            float _3064 = fma(_3062, _2570, _2924);
            float _3066 = -_3026;
            float _3068 = fma(_3066, _2578, _2936);
            float _3070 = -_3026;
            float _3072 = fma(_3070, _2584, _2944);
            float _3074 = -_3026;
            float _3076 = fma(_3074, _2590, _2948);
            float _3078 = -_3026;
            float _3080 = fma(_3078, _2596, _2940);
            float _3082 = -_3026;
            float _3084 = fma(_3082, _2604, _2952);
            float _3086 = -_3026;
            float _3088 = fma(_3086, _2610, _2960);
            float _3090 = -_3026;
            float _3092 = fma(_3090, _2616, _2964);
            float _3094 = -_3026;
            float _3096 = fma(_3094, _2622, _2956);
            float _3098 = -_3026;
            float _3100 = fma(_3098, _2630, _2968);
            float _3102 = -_3026;
            float _3104 = fma(_3102, _2636, _2976);
            float _3106 = -_3026;
            float _3108 = fma(_3106, _2642, _2980);
            float _3110 = -_3026;
            float _3112 = fma(_3110, _2648, _2972);
            float _3114 = -_3026;
            float _3116 = fma(_3114, _2656, _2984);
            float _3118 = -_3026;
            float _3120 = fma(_3118, _2662, _2992);
            float _3122 = -_3026;
            float _3124 = fma(_3122, _2668, _2996);
            float _3126 = -_3026;
            float _3128 = fma(_3126, _2674, _2988);
            float _3130 = -_3026;
            float _3132 = fma(_3130, _2682, _3000);
            float _3134 = -_3026;
            float _3136 = fma(_3134, _2688, _3008);
            float _3138 = -_3026;
            float _3140 = fma(_3138, _2694, _3012);
            float _3142 = -_3026;
            float _3144 = fma(_3142, _2700, _3004);
            float _3146 = -_3026;
            float _3148 = fma(_3146, _2704, _3016);
            float _3150 = -_3026;
            float _3152 = fma(_3150, _2710, _3020);
            float _3154 = -_3026;
            float _3156 = fma(_3154, _2716, _3024);
            float _3158 = -_3026;
            float _3160 = fma(_3158, _2722, _3030);
            float _3162 = fma(_3032, _2726, _3036);
            float _3164 = fma(_3032, _2732, _3040);
            float _3166 = fma(_3032, _2738, _3044);
            float _3168 = fma(_3032, _2744, _3048);
            float _3170 = fma(_3032, _2748, _3052);
            float _3172 = fma(_3032, _2754, _3056);
            float _3174 = fma(_3032, _2760, _3060);
            float _3176 = fma(_3032, _2766, _3064);
            float _3178 = fma(_3032, _2770, _3068);
            float _3180 = fma(_3032, _2776, _3072);
            float _3182 = fma(_3032, _2782, _3076);
            float _3184 = fma(_3032, _2788, _3080);
            float _3186 = fma(_3032, _2792, _3084);
            float _3188 = fma(_3032, _2798, _3088);
            float _3190 = fma(_3032, _2804, _3092);
            float _3192 = fma(_3032, _2810, _3096);
            float _3194 = fma(_3032, _2814, _3100);
            float _3196 = fma(_3032, _2820, _3104);
            float _3198 = fma(_3032, _2826, _3108);
            float _3200 = fma(_3032, _2832, _3112);
            float _3202 = fma(_3032, _2836, _3116);
            float _3204 = fma(_3032, _2842, _3120);
            float _3206 = fma(_3032, _2848, _3124);
            float _3208 = fma(_3032, _2854, _3128);
            float _3210 = fma(_3032, _2858, _3132);
            float _3212 = fma(_3032, _2864, _3136);
            float _3214 = fma(_3032, _2870, _3140);
            float _3216 = fma(_3032, _2876, _3144);
            float _3218 = fma(_3032, _2880, _3148);
            float _3220 = fma(_3032, _2886, _3152);
            float _3222 = fma(_3032, _2892, _3156);
            float _3224 = fma(_3032, _2898, _3160);
            _2252 = _3172;
            _2254 = _3176;
            _2256 = _3186;
            _2258 = _3170;
            _2260 = _3204;
            _2262 = _3206;
            _2264 = _3188;
            _2266 = _3192;
            _2268 = _3208;
            _2270 = _3202;
            _2272 = _3190;
            _2274 = _3174;
            _2276 = _3220;
            _2278 = _3218;
            _2280 = _3168;
            _2282 = _3178;
            _2284 = _3180;
            _2286 = _3212;
            _2288 = _3162;
            _2290 = _3164;
            _2292 = _3166;
            _2294 = _3210;
            _2296 = _3222;
            _2298 = _3182;
            _2300 = _3184;
            _2302 = _3194;
            _2304 = _3214;
            _2306 = _3224;
            _2308 = _3196;
            _2310 = _3198;
            _2312 = _3200;
            _2314 = _3216;
            _2316 = true;
        }
    }
    else
    {
        float _3226 = _1306 * (-0.707106769084930419921875);
        float _3228 = _1402 + (-1.0);
        float _3230 = fma(_1402, 0.707106769084930419921875, _3226);
        bool _3232 = _3230 >= 0.0;
        float _3234 = _1306 + (-1.0);
        bool _3236 = !_3232;
        if (!_3236)
        {
            int _3238 = _1440 * 656;
            int _3240 = _3238 + 262144;
            int _3242 = _3238 + 262192;
            int _3244 = _3238 + 262160;
            uint _3246 = uint(int(uint(_3240) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3246)];
            float _3248 = as_type<float>(_dmw48.x);
            int _3250 = _3240 + 4;
            uint _3252 = uint(int(uint(_3250) >> uint(2)));
            float _3254 = as_type<float>(_dmw48.y);
            int _3256 = _3240 + 8;
            uint _3258 = uint(int(uint(_3256) >> uint(2)));
            float _3260 = as_type<float>(_dmw48.z);
            int _3262 = _3240 + 12;
            uint _3264 = uint(int(uint(_3262) >> uint(2)));
            float _3266 = as_type<float>(_dmw48.w);
            int _3268 = _3238 + 262208;
            int _3270 = _3238 + 262176;
            uint _3272 = uint(int(uint(_3242) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3272)];
            float _3274 = as_type<float>(_dmw51.x);
            int _3276 = _3242 + 4;
            uint _3278 = uint(int(uint(_3276) >> uint(2)));
            float _3280 = as_type<float>(_dmw51.y);
            int _3282 = _3242 + 8;
            uint _3284 = uint(int(uint(_3282) >> uint(2)));
            float _3286 = as_type<float>(_dmw51.z);
            int _3288 = _3242 + 12;
            uint _3290 = uint(int(uint(_3288) >> uint(2)));
            float _3292 = as_type<float>(_dmw51.w);
            int _3294 = _3238 + 262224;
            uint _3296 = uint(int(uint(_3244) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3296)];
            float _3298 = as_type<float>(_dmw49.x);
            int _3300 = _3244 + 4;
            uint _3302 = uint(int(uint(_3300) >> uint(2)));
            float _3304 = as_type<float>(_dmw49.y);
            int _3306 = _3244 + 8;
            uint _3308 = uint(int(uint(_3306) >> uint(2)));
            float _3310 = as_type<float>(_dmw49.z);
            int _3312 = _3244 + 12;
            uint _3314 = uint(int(uint(_3312) >> uint(2)));
            float _3316 = as_type<float>(_dmw49.w);
            int _3318 = _3238 + 262240;
            int _3320 = _1196 * 656;
            uint _3322 = uint(int(uint(_3268) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3322)];
            float _3324 = as_type<float>(_dmw52.x);
            int _3326 = _3268 + 4;
            uint _3328 = uint(int(uint(_3326) >> uint(2)));
            float _3330 = as_type<float>(_dmw52.y);
            int _3332 = _3268 + 8;
            uint _3334 = uint(int(uint(_3332) >> uint(2)));
            float _3336 = as_type<float>(_dmw52.z);
            int _3338 = _3268 + 12;
            uint _3340 = uint(int(uint(_3338) >> uint(2)));
            float _3342 = as_type<float>(_dmw52.w);
            int _3344 = _3238 + 262256;
            uint _3346 = uint(int(uint(_3270) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3346)];
            float _3348 = as_type<float>(_dmw50.x);
            int _3350 = _3270 + 4;
            uint _3352 = uint(int(uint(_3350) >> uint(2)));
            float _3354 = as_type<float>(_dmw50.y);
            int _3356 = _3270 + 8;
            uint _3358 = uint(int(uint(_3356) >> uint(2)));
            float _3360 = as_type<float>(_dmw50.z);
            int _3362 = _3270 + 12;
            uint _3364 = uint(int(uint(_3362) >> uint(2)));
            float _3366 = as_type<float>(_dmw50.w);
            int _3368 = _1242 * 656;
            uint _3370 = uint(int(uint(_3294) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3370)];
            float _3372 = as_type<float>(_dmw53.x);
            int _3374 = _3294 + 4;
            uint _3376 = uint(int(uint(_3374) >> uint(2)));
            float _3378 = as_type<float>(_dmw53.y);
            int _3380 = _3294 + 8;
            uint _3382 = uint(int(uint(_3380) >> uint(2)));
            float _3384 = as_type<float>(_dmw53.z);
            int _3386 = _3294 + 12;
            uint _3388 = uint(int(uint(_3386) >> uint(2)));
            float _3390 = as_type<float>(_dmw53.w);
            int _3392 = _3320 + 262144;
            int _3394 = _3320 + 262192;
            uint _3396 = uint(int(uint(_3318) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3396)];
            float _3398 = as_type<float>(_dmw54.x);
            int _3400 = _3318 + 4;
            uint _3402 = uint(int(uint(_3400) >> uint(2)));
            float _3404 = as_type<float>(_dmw54.y);
            int _3406 = _3318 + 8;
            uint _3408 = uint(int(uint(_3406) >> uint(2)));
            float _3410 = as_type<float>(_dmw54.z);
            int _3412 = _3318 + 12;
            uint _3414 = uint(int(uint(_3412) >> uint(2)));
            float _3416 = as_type<float>(_dmw54.w);
            int _3418 = _3320 + 262160;
            int _3420 = _3320 + 262208;
            uint _3422 = uint(int(uint(_3344) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3422)];
            float _3424 = as_type<float>(_dmw55.x);
            int _3426 = _3344 + 4;
            uint _3428 = uint(int(uint(_3426) >> uint(2)));
            float _3430 = as_type<float>(_dmw55.y);
            int _3432 = _3344 + 8;
            uint _3434 = uint(int(uint(_3432) >> uint(2)));
            float _3436 = as_type<float>(_dmw55.z);
            int _3438 = _3344 + 12;
            uint _3440 = uint(int(uint(_3438) >> uint(2)));
            float _3442 = as_type<float>(_dmw55.w);
            int _3444 = _3320 + 262176;
            int _3446 = _3320 + 262224;
            uint _3448 = uint(int(uint(_3392) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3448)];
            float _3450 = as_type<float>(_dmw56.x);
            int _3452 = _3392 + 4;
            uint _3454 = uint(int(uint(_3452) >> uint(2)));
            float _3456 = as_type<float>(_dmw56.y);
            int _3458 = _3392 + 8;
            uint _3460 = uint(int(uint(_3458) >> uint(2)));
            float _3462 = as_type<float>(_dmw56.z);
            int _3464 = _3392 + 12;
            uint _3466 = uint(int(uint(_3464) >> uint(2)));
            float _3468 = as_type<float>(_dmw56.w);
            int _3470 = _3320 + 262240;
            int _3472 = _3320 + 262256;
            uint _3474 = uint(int(uint(_3394) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3474)];
            float _3476 = as_type<float>(_dmw59.x);
            int _3478 = _3394 + 4;
            uint _3480 = uint(int(uint(_3478) >> uint(2)));
            float _3482 = as_type<float>(_dmw59.y);
            int _3484 = _3394 + 8;
            uint _3486 = uint(int(uint(_3484) >> uint(2)));
            float _3488 = as_type<float>(_dmw59.z);
            int _3490 = _3394 + 12;
            uint _3492 = uint(int(uint(_3490) >> uint(2)));
            float _3494 = as_type<float>(_dmw59.w);
            int _3496 = _3368 + 262144;
            int _3498 = _3368 + 262192;
            uint _3500 = uint(int(uint(_3418) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3500)];
            float _3502 = as_type<float>(_dmw57.x);
            int _3504 = _3418 + 4;
            uint _3506 = uint(int(uint(_3504) >> uint(2)));
            float _3508 = as_type<float>(_dmw57.y);
            int _3510 = _3418 + 8;
            uint _3512 = uint(int(uint(_3510) >> uint(2)));
            float _3514 = as_type<float>(_dmw57.z);
            int _3516 = _3418 + 12;
            uint _3518 = uint(int(uint(_3516) >> uint(2)));
            float _3520 = as_type<float>(_dmw57.w);
            int _3522 = _3368 + 262160;
            int _3524 = _3368 + 262208;
            uint _3526 = uint(int(uint(_3420) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3526)];
            float _3528 = as_type<float>(_dmw60.x);
            int _3530 = _3420 + 4;
            uint _3532 = uint(int(uint(_3530) >> uint(2)));
            float _3534 = as_type<float>(_dmw60.y);
            int _3536 = _3420 + 8;
            uint _3538 = uint(int(uint(_3536) >> uint(2)));
            float _3540 = as_type<float>(_dmw60.z);
            int _3542 = _3420 + 12;
            uint _3544 = uint(int(uint(_3542) >> uint(2)));
            float _3546 = as_type<float>(_dmw60.w);
            int _3548 = _3368 + 262176;
            int _3550 = _3368 + 262224;
            uint _3552 = uint(int(uint(_3444) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3552)];
            float _3554 = as_type<float>(_dmw58.x);
            int _3556 = _3444 + 4;
            uint _3558 = uint(int(uint(_3556) >> uint(2)));
            float _3560 = as_type<float>(_dmw58.y);
            int _3562 = _3444 + 8;
            uint _3564 = uint(int(uint(_3562) >> uint(2)));
            float _3566 = as_type<float>(_dmw58.z);
            int _3568 = _3444 + 12;
            uint _3570 = uint(int(uint(_3568) >> uint(2)));
            float _3572 = as_type<float>(_dmw58.w);
            int _3574 = _3368 + 262240;
            int _3576 = _3368 + 262256;
            uint _3578 = uint(int(uint(_3446) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3578)];
            float _3580 = as_type<float>(_dmw61.x);
            int _3582 = _3446 + 4;
            uint _3584 = uint(int(uint(_3582) >> uint(2)));
            float _3586 = as_type<float>(_dmw61.y);
            int _3588 = _3446 + 8;
            uint _3590 = uint(int(uint(_3588) >> uint(2)));
            float _3592 = as_type<float>(_dmw61.z);
            int _3594 = _3446 + 12;
            uint _3596 = uint(int(uint(_3594) >> uint(2)));
            float _3598 = as_type<float>(_dmw61.w);
            uint _3600 = uint(int(uint(_3470) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3600)];
            float _3602 = as_type<float>(_dmw62.x);
            int _3604 = _3470 + 4;
            uint _3606 = uint(int(uint(_3604) >> uint(2)));
            float _3608 = as_type<float>(_dmw62.y);
            int _3610 = _3470 + 8;
            uint _3612 = uint(int(uint(_3610) >> uint(2)));
            float _3614 = as_type<float>(_dmw62.z);
            int _3616 = _3470 + 12;
            uint _3618 = uint(int(uint(_3616) >> uint(2)));
            float _3620 = as_type<float>(_dmw62.w);
            uint _3622 = uint(int(uint(_3472) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3622)];
            float _3624 = as_type<float>(_dmw63.x);
            int _3626 = _3472 + 4;
            uint _3628 = uint(int(uint(_3626) >> uint(2)));
            float _3630 = as_type<float>(_dmw63.y);
            int _3632 = _3472 + 8;
            uint _3634 = uint(int(uint(_3632) >> uint(2)));
            float _3636 = as_type<float>(_dmw63.z);
            int _3638 = _3472 + 12;
            uint _3640 = uint(int(uint(_3638) >> uint(2)));
            float _3642 = as_type<float>(_dmw63.w);
            uint _3644 = uint(int(uint(_3496) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3644)];
            float _3646 = as_type<float>(_dmw64.x);
            int _3648 = _3496 + 4;
            uint _3650 = uint(int(uint(_3648) >> uint(2)));
            float _3652 = as_type<float>(_dmw64.y);
            int _3654 = _3496 + 8;
            uint _3656 = uint(int(uint(_3654) >> uint(2)));
            float _3658 = as_type<float>(_dmw64.z);
            int _3660 = _3496 + 12;
            uint _3662 = uint(int(uint(_3660) >> uint(2)));
            float _3664 = as_type<float>(_dmw64.w);
            uint _3666 = uint(int(uint(_3498) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3666)];
            float _3668 = as_type<float>(_dmw67.x);
            int _3670 = _3498 + 4;
            uint _3672 = uint(int(uint(_3670) >> uint(2)));
            float _3674 = as_type<float>(_dmw67.y);
            int _3676 = _3498 + 8;
            uint _3678 = uint(int(uint(_3676) >> uint(2)));
            float _3680 = as_type<float>(_dmw67.z);
            int _3682 = _3498 + 12;
            uint _3684 = uint(int(uint(_3682) >> uint(2)));
            float _3686 = as_type<float>(_dmw67.w);
            uint _3688 = uint(int(uint(_3522) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3688)];
            float _3690 = as_type<float>(_dmw65.x);
            int _3692 = _3522 + 4;
            uint _3694 = uint(int(uint(_3692) >> uint(2)));
            float _3696 = as_type<float>(_dmw65.y);
            int _3698 = _3522 + 8;
            uint _3700 = uint(int(uint(_3698) >> uint(2)));
            float _3702 = as_type<float>(_dmw65.z);
            int _3704 = _3522 + 12;
            uint _3706 = uint(int(uint(_3704) >> uint(2)));
            float _3708 = as_type<float>(_dmw65.w);
            uint _3710 = uint(int(uint(_3524) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3710)];
            float _3712 = as_type<float>(_dmw68.x);
            int _3714 = _3524 + 4;
            uint _3716 = uint(int(uint(_3714) >> uint(2)));
            float _3718 = as_type<float>(_dmw68.y);
            int _3720 = _3524 + 8;
            uint _3722 = uint(int(uint(_3720) >> uint(2)));
            float _3724 = as_type<float>(_dmw68.z);
            int _3726 = _3524 + 12;
            uint _3728 = uint(int(uint(_3726) >> uint(2)));
            float _3730 = as_type<float>(_dmw68.w);
            uint _3732 = uint(int(uint(_3548) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3732)];
            float _3734 = as_type<float>(_dmw66.x);
            int _3736 = _3548 + 4;
            uint _3738 = uint(int(uint(_3736) >> uint(2)));
            float _3740 = as_type<float>(_dmw66.y);
            int _3742 = _3548 + 8;
            uint _3744 = uint(int(uint(_3742) >> uint(2)));
            float _3746 = as_type<float>(_dmw66.z);
            int _3748 = _3548 + 12;
            uint _3750 = uint(int(uint(_3748) >> uint(2)));
            float _3752 = as_type<float>(_dmw66.w);
            uint _3754 = uint(int(uint(_3550) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3754)];
            float _3756 = as_type<float>(_dmw69.x);
            int _3758 = _3550 + 4;
            uint _3760 = uint(int(uint(_3758) >> uint(2)));
            float _3762 = as_type<float>(_dmw69.y);
            int _3764 = _3550 + 8;
            uint _3766 = uint(int(uint(_3764) >> uint(2)));
            float _3768 = as_type<float>(_dmw69.z);
            int _3770 = _3550 + 12;
            uint _3772 = uint(int(uint(_3770) >> uint(2)));
            float _3774 = as_type<float>(_dmw69.w);
            uint _3776 = uint(int(uint(_3574) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3776)];
            float _3778 = as_type<float>(_dmw70.x);
            int _3780 = _3574 + 4;
            uint _3782 = uint(int(uint(_3780) >> uint(2)));
            float _3784 = as_type<float>(_dmw70.y);
            int _3786 = _3574 + 8;
            uint _3788 = uint(int(uint(_3786) >> uint(2)));
            float _3790 = as_type<float>(_dmw70.z);
            int _3792 = _3574 + 12;
            uint _3794 = uint(int(uint(_3792) >> uint(2)));
            float _3796 = as_type<float>(_dmw70.w);
            uint _3798 = uint(int(uint(_3576) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3798)];
            float _3800 = as_type<float>(_dmw71.x);
            int _3802 = _3576 + 4;
            uint _3804 = uint(int(uint(_3802) >> uint(2)));
            float _3806 = as_type<float>(_dmw71.y);
            int _3808 = _3576 + 8;
            uint _3810 = uint(int(uint(_3808) >> uint(2)));
            float _3812 = as_type<float>(_dmw71.z);
            int _3814 = _3576 + 12;
            uint _3816 = uint(int(uint(_3814) >> uint(2)));
            float _3818 = as_type<float>(_dmw71.w);
            float _3820 = -_3234;
            float _3822 = _3228 + _3820;
            float _3824 = -_3822;
            float _3826 = _1402 + _3824;
            float _3828 = _3248 * _3822;
            float _3830 = _3254 * _3822;
            float _3832 = _3260 * _3822;
            float _3834 = _3266 * _3822;
            float _3836 = _3274 * _3822;
            float _3838 = _3280 * _3822;
            float _3840 = _3286 * _3822;
            float _3842 = _3292 * _3822;
            float _3844 = _3298 * _3822;
            float _3846 = _3304 * _3822;
            float _3848 = _3310 * _3822;
            float _3850 = _3316 * _3822;
            float _3852 = _3324 * _3822;
            float _3854 = _3330 * _3822;
            float _3856 = _3336 * _3822;
            float _3858 = _3342 * _3822;
            float _3860 = _3348 * _3822;
            float _3862 = _3354 * _3822;
            float _3864 = _3360 * _3822;
            float _3866 = _3366 * _3822;
            float _3868 = _3372 * _3822;
            float _3870 = _3378 * _3822;
            float _3872 = _3384 * _3822;
            float _3874 = _3390 * _3822;
            float _3876 = _3398 * _3822;
            float _3878 = _3404 * _3822;
            float _3880 = _3410 * _3822;
            float _3882 = _3416 * _3822;
            float _3884 = _3424 * _3822;
            float _3886 = _3430 * _3822;
            float _3888 = _3436 * _3822;
            float _3890 = _3442 * _3822;
            float _3892 = -_3228;
            float _3894 = fma(_3450, _3892, _3828);
            float _3896 = -_3228;
            float _3898 = fma(_3456, _3896, _3830);
            float _3900 = -_3228;
            float _3902 = fma(_3462, _3900, _3832);
            float _3904 = -_3228;
            float _3906 = fma(_3468, _3904, _3834);
            float _3908 = -_3228;
            float _3910 = fma(_3476, _3908, _3836);
            float _3912 = -_3228;
            float _3914 = fma(_3482, _3912, _3838);
            float _3916 = -_3228;
            float _3918 = fma(_3488, _3916, _3840);
            float _3920 = -_3228;
            float _3922 = fma(_3494, _3920, _3842);
            float _3924 = -_3228;
            float _3926 = fma(_3502, _3924, _3844);
            float _3928 = -_3228;
            float _3930 = fma(_3508, _3928, _3846);
            float _3932 = -_3228;
            float _3934 = fma(_3514, _3932, _3848);
            float _3936 = -_3228;
            float _3938 = fma(_3520, _3936, _3850);
            float _3940 = -_3228;
            float _3942 = fma(_3528, _3940, _3852);
            float _3944 = -_3228;
            float _3946 = fma(_3534, _3944, _3854);
            float _3948 = -_3228;
            float _3950 = fma(_3540, _3948, _3856);
            float _3952 = -_3228;
            float _3954 = fma(_3546, _3952, _3858);
            float _3956 = -_3228;
            float _3958 = fma(_3554, _3956, _3860);
            float _3960 = -_3228;
            float _3962 = fma(_3560, _3960, _3862);
            float _3964 = -_3228;
            float _3966 = fma(_3566, _3964, _3864);
            float _3968 = -_3228;
            float _3970 = fma(_3572, _3968, _3866);
            float _3972 = -_3228;
            float _3974 = fma(_3580, _3972, _3868);
            float _3976 = -_3228;
            float _3978 = fma(_3586, _3976, _3870);
            float _3980 = -_3228;
            float _3982 = fma(_3592, _3980, _3872);
            float _3984 = -_3228;
            float _3986 = fma(_3598, _3984, _3874);
            float _3988 = -_3228;
            float _3990 = fma(_3602, _3988, _3876);
            float _3992 = -_3228;
            float _3994 = fma(_3608, _3992, _3878);
            float _3996 = -_3228;
            float _3998 = fma(_3614, _3996, _3880);
            float _4000 = -_3228;
            float _4002 = fma(_3620, _4000, _3882);
            float _4004 = -_3228;
            float _4006 = fma(_3624, _4004, _3884);
            float _4008 = -_3228;
            float _4010 = fma(_3630, _4008, _3886);
            float _4012 = -_3228;
            float _4014 = fma(_3636, _4012, _3888);
            float _4016 = -_3228;
            float _4018 = fma(_3642, _4016, _3890);
            float _4020 = fma(_3646, _3826, _3894);
            float _4022 = fma(_3652, _3826, _3898);
            float _4024 = fma(_3658, _3826, _3902);
            float _4026 = fma(_3664, _3826, _3906);
            float _4028 = fma(_3668, _3826, _3910);
            float _4030 = fma(_3674, _3826, _3914);
            float _4032 = fma(_3680, _3826, _3918);
            float _4034 = fma(_3686, _3826, _3922);
            float _4036 = fma(_3690, _3826, _3926);
            float _4038 = fma(_3696, _3826, _3930);
            float _4040 = fma(_3702, _3826, _3934);
            float _4042 = fma(_3708, _3826, _3938);
            float _4044 = fma(_3712, _3826, _3942);
            float _4046 = fma(_3718, _3826, _3946);
            float _4048 = fma(_3724, _3826, _3950);
            float _4050 = fma(_3730, _3826, _3954);
            float _4052 = fma(_3734, _3826, _3958);
            float _4054 = fma(_3740, _3826, _3962);
            float _4056 = fma(_3746, _3826, _3966);
            float _4058 = fma(_3752, _3826, _3970);
            float _4060 = fma(_3756, _3826, _3974);
            float _4062 = fma(_3762, _3826, _3978);
            float _4064 = fma(_3768, _3826, _3982);
            float _4066 = fma(_3774, _3826, _3986);
            float _4068 = fma(_3778, _3826, _3990);
            float _4070 = fma(_3784, _3826, _3994);
            float _4072 = fma(_3790, _3826, _3998);
            float _4074 = fma(_3796, _3826, _4002);
            float _4076 = fma(_3800, _3826, _4006);
            float _4078 = fma(_3806, _3826, _4010);
            float _4080 = fma(_3812, _3826, _4014);
            float _4082 = fma(_3818, _3826, _4018);
            _2252 = _4030;
            _2254 = _4034;
            _2256 = _4044;
            _2258 = _4028;
            _2260 = _4062;
            _2262 = _4064;
            _2264 = _4046;
            _2266 = _4050;
            _2268 = _4066;
            _2270 = _4060;
            _2272 = _4048;
            _2274 = _4032;
            _2276 = _4078;
            _2278 = _4076;
            _2280 = _4026;
            _2282 = _4036;
            _2284 = _4038;
            _2286 = _4070;
            _2288 = _4020;
            _2290 = _4022;
            _2292 = _4024;
            _2294 = _4068;
            _2296 = _4080;
            _2298 = _4040;
            _2300 = _4042;
            _2302 = _4052;
            _2304 = _4072;
            _2306 = _4082;
            _2308 = _4054;
            _2310 = _4056;
            _2312 = _4058;
            _2314 = _4074;
            _2316 = true;
        }
        else
        {
            int _4084 = _1258 * 656;
            int _4086 = _4084 + 262144;
            int _4088 = _4084 + 262192;
            int _4090 = _4084 + 262160;
            uint _4092 = uint(int(uint(_4086) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4092)];
            float _4094 = as_type<float>(_dmw72.x);
            int _4096 = _4086 + 4;
            uint _4098 = uint(int(uint(_4096) >> uint(2)));
            float _4100 = as_type<float>(_dmw72.y);
            int _4102 = _4086 + 8;
            uint _4104 = uint(int(uint(_4102) >> uint(2)));
            float _4106 = as_type<float>(_dmw72.z);
            int _4108 = _4086 + 12;
            uint _4110 = uint(int(uint(_4108) >> uint(2)));
            float _4112 = as_type<float>(_dmw72.w);
            int _4114 = _4084 + 262208;
            int _4116 = _4084 + 262176;
            uint _4118 = uint(int(uint(_4088) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4118)];
            float _4120 = as_type<float>(_dmw75.x);
            int _4122 = _4088 + 4;
            uint _4124 = uint(int(uint(_4122) >> uint(2)));
            float _4126 = as_type<float>(_dmw75.y);
            int _4128 = _4088 + 8;
            uint _4130 = uint(int(uint(_4128) >> uint(2)));
            float _4132 = as_type<float>(_dmw75.z);
            int _4134 = _4088 + 12;
            uint _4136 = uint(int(uint(_4134) >> uint(2)));
            float _4138 = as_type<float>(_dmw75.w);
            int _4140 = _4084 + 262224;
            uint _4142 = uint(int(uint(_4090) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4142)];
            float _4144 = as_type<float>(_dmw73.x);
            int _4146 = _4090 + 4;
            uint _4148 = uint(int(uint(_4146) >> uint(2)));
            float _4150 = as_type<float>(_dmw73.y);
            int _4152 = _4090 + 8;
            uint _4154 = uint(int(uint(_4152) >> uint(2)));
            float _4156 = as_type<float>(_dmw73.z);
            int _4158 = _4090 + 12;
            uint _4160 = uint(int(uint(_4158) >> uint(2)));
            float _4162 = as_type<float>(_dmw73.w);
            int _4164 = _4084 + 262240;
            int _4166 = _1196 * 656;
            uint _4168 = uint(int(uint(_4114) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4168)];
            float _4170 = as_type<float>(_dmw76.x);
            int _4172 = _4114 + 4;
            uint _4174 = uint(int(uint(_4172) >> uint(2)));
            float _4176 = as_type<float>(_dmw76.y);
            int _4178 = _4114 + 8;
            uint _4180 = uint(int(uint(_4178) >> uint(2)));
            float _4182 = as_type<float>(_dmw76.z);
            int _4184 = _4114 + 12;
            uint _4186 = uint(int(uint(_4184) >> uint(2)));
            float _4188 = as_type<float>(_dmw76.w);
            int _4190 = _4084 + 262256;
            uint _4192 = uint(int(uint(_4116) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4192)];
            float _4194 = as_type<float>(_dmw74.x);
            int _4196 = _4116 + 4;
            uint _4198 = uint(int(uint(_4196) >> uint(2)));
            float _4200 = as_type<float>(_dmw74.y);
            int _4202 = _4116 + 8;
            uint _4204 = uint(int(uint(_4202) >> uint(2)));
            float _4206 = as_type<float>(_dmw74.z);
            int _4208 = _4116 + 12;
            uint _4210 = uint(int(uint(_4208) >> uint(2)));
            float _4212 = as_type<float>(_dmw74.w);
            int _4214 = _1242 * 656;
            uint _4216 = uint(int(uint(_4140) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4216)];
            float _4218 = as_type<float>(_dmw77.x);
            int _4220 = _4140 + 4;
            uint _4222 = uint(int(uint(_4220) >> uint(2)));
            float _4224 = as_type<float>(_dmw77.y);
            int _4226 = _4140 + 8;
            uint _4228 = uint(int(uint(_4226) >> uint(2)));
            float _4230 = as_type<float>(_dmw77.z);
            int _4232 = _4140 + 12;
            uint _4234 = uint(int(uint(_4232) >> uint(2)));
            float _4236 = as_type<float>(_dmw77.w);
            int _4238 = _4166 + 262144;
            int _4240 = _4166 + 262192;
            uint _4242 = uint(int(uint(_4164) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4242)];
            float _4244 = as_type<float>(_dmw78.x);
            int _4246 = _4164 + 4;
            uint _4248 = uint(int(uint(_4246) >> uint(2)));
            float _4250 = as_type<float>(_dmw78.y);
            int _4252 = _4164 + 8;
            uint _4254 = uint(int(uint(_4252) >> uint(2)));
            float _4256 = as_type<float>(_dmw78.z);
            int _4258 = _4164 + 12;
            uint _4260 = uint(int(uint(_4258) >> uint(2)));
            float _4262 = as_type<float>(_dmw78.w);
            int _4264 = _4166 + 262160;
            int _4266 = _4166 + 262208;
            uint _4268 = uint(int(uint(_4190) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4268)];
            float _4270 = as_type<float>(_dmw79.x);
            int _4272 = _4190 + 4;
            uint _4274 = uint(int(uint(_4272) >> uint(2)));
            float _4276 = as_type<float>(_dmw79.y);
            int _4278 = _4190 + 8;
            uint _4280 = uint(int(uint(_4278) >> uint(2)));
            float _4282 = as_type<float>(_dmw79.z);
            int _4284 = _4190 + 12;
            uint _4286 = uint(int(uint(_4284) >> uint(2)));
            float _4288 = as_type<float>(_dmw79.w);
            int _4290 = _4166 + 262176;
            int _4292 = _4166 + 262224;
            uint _4294 = uint(int(uint(_4238) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4294)];
            float _4296 = as_type<float>(_dmw80.x);
            int _4298 = _4238 + 4;
            uint _4300 = uint(int(uint(_4298) >> uint(2)));
            float _4302 = as_type<float>(_dmw80.y);
            int _4304 = _4238 + 8;
            uint _4306 = uint(int(uint(_4304) >> uint(2)));
            float _4308 = as_type<float>(_dmw80.z);
            int _4310 = _4238 + 12;
            uint _4312 = uint(int(uint(_4310) >> uint(2)));
            float _4314 = as_type<float>(_dmw80.w);
            int _4316 = _4166 + 262240;
            int _4318 = _4166 + 262256;
            uint _4320 = uint(int(uint(_4240) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4320)];
            float _4322 = as_type<float>(_dmw83.x);
            int _4324 = _4240 + 4;
            uint _4326 = uint(int(uint(_4324) >> uint(2)));
            float _4328 = as_type<float>(_dmw83.y);
            int _4330 = _4240 + 8;
            uint _4332 = uint(int(uint(_4330) >> uint(2)));
            float _4334 = as_type<float>(_dmw83.z);
            int _4336 = _4240 + 12;
            uint _4338 = uint(int(uint(_4336) >> uint(2)));
            float _4340 = as_type<float>(_dmw83.w);
            int _4342 = _4214 + 262144;
            int _4344 = _4214 + 262192;
            uint _4346 = uint(int(uint(_4264) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4346)];
            float _4348 = as_type<float>(_dmw81.x);
            int _4350 = _4264 + 4;
            uint _4352 = uint(int(uint(_4350) >> uint(2)));
            float _4354 = as_type<float>(_dmw81.y);
            int _4356 = _4264 + 8;
            uint _4358 = uint(int(uint(_4356) >> uint(2)));
            float _4360 = as_type<float>(_dmw81.z);
            int _4362 = _4264 + 12;
            uint _4364 = uint(int(uint(_4362) >> uint(2)));
            float _4366 = as_type<float>(_dmw81.w);
            int _4368 = _4214 + 262160;
            int _4370 = _4214 + 262208;
            uint _4372 = uint(int(uint(_4266) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4372)];
            float _4374 = as_type<float>(_dmw84.x);
            int _4376 = _4266 + 4;
            uint _4378 = uint(int(uint(_4376) >> uint(2)));
            float _4380 = as_type<float>(_dmw84.y);
            int _4382 = _4266 + 8;
            uint _4384 = uint(int(uint(_4382) >> uint(2)));
            float _4386 = as_type<float>(_dmw84.z);
            int _4388 = _4266 + 12;
            uint _4390 = uint(int(uint(_4388) >> uint(2)));
            float _4392 = as_type<float>(_dmw84.w);
            int _4394 = _4214 + 262176;
            int _4396 = _4214 + 262224;
            uint _4398 = uint(int(uint(_4290) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4398)];
            float _4400 = as_type<float>(_dmw82.x);
            int _4402 = _4290 + 4;
            uint _4404 = uint(int(uint(_4402) >> uint(2)));
            float _4406 = as_type<float>(_dmw82.y);
            int _4408 = _4290 + 8;
            uint _4410 = uint(int(uint(_4408) >> uint(2)));
            float _4412 = as_type<float>(_dmw82.z);
            int _4414 = _4290 + 12;
            uint _4416 = uint(int(uint(_4414) >> uint(2)));
            float _4418 = as_type<float>(_dmw82.w);
            int _4420 = _4214 + 262240;
            int _4422 = _4214 + 262256;
            uint _4424 = uint(int(uint(_4292) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4424)];
            float _4426 = as_type<float>(_dmw85.x);
            int _4428 = _4292 + 4;
            uint _4430 = uint(int(uint(_4428) >> uint(2)));
            float _4432 = as_type<float>(_dmw85.y);
            int _4434 = _4292 + 8;
            uint _4436 = uint(int(uint(_4434) >> uint(2)));
            float _4438 = as_type<float>(_dmw85.z);
            int _4440 = _4292 + 12;
            uint _4442 = uint(int(uint(_4440) >> uint(2)));
            float _4444 = as_type<float>(_dmw85.w);
            uint _4446 = uint(int(uint(_4316) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4446)];
            float _4448 = as_type<float>(_dmw86.x);
            int _4450 = _4316 + 4;
            uint _4452 = uint(int(uint(_4450) >> uint(2)));
            float _4454 = as_type<float>(_dmw86.y);
            int _4456 = _4316 + 8;
            uint _4458 = uint(int(uint(_4456) >> uint(2)));
            float _4460 = as_type<float>(_dmw86.z);
            int _4462 = _4316 + 12;
            uint _4464 = uint(int(uint(_4462) >> uint(2)));
            float _4466 = as_type<float>(_dmw86.w);
            uint _4468 = uint(int(uint(_4318) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4468)];
            float _4470 = as_type<float>(_dmw87.x);
            int _4472 = _4318 + 4;
            uint _4474 = uint(int(uint(_4472) >> uint(2)));
            float _4476 = as_type<float>(_dmw87.y);
            int _4478 = _4318 + 8;
            uint _4480 = uint(int(uint(_4478) >> uint(2)));
            float _4482 = as_type<float>(_dmw87.z);
            int _4484 = _4318 + 12;
            uint _4486 = uint(int(uint(_4484) >> uint(2)));
            float _4488 = as_type<float>(_dmw87.w);
            uint _4490 = uint(int(uint(_4342) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4490)];
            float _4492 = as_type<float>(_dmw88.x);
            int _4494 = _4342 + 4;
            uint _4496 = uint(int(uint(_4494) >> uint(2)));
            float _4498 = as_type<float>(_dmw88.y);
            int _4500 = _4342 + 8;
            uint _4502 = uint(int(uint(_4500) >> uint(2)));
            float _4504 = as_type<float>(_dmw88.z);
            int _4506 = _4342 + 12;
            uint _4508 = uint(int(uint(_4506) >> uint(2)));
            float _4510 = as_type<float>(_dmw88.w);
            uint _4512 = uint(int(uint(_4344) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4512)];
            float _4514 = as_type<float>(_dmw91.x);
            int _4516 = _4344 + 4;
            uint _4518 = uint(int(uint(_4516) >> uint(2)));
            float _4520 = as_type<float>(_dmw91.y);
            int _4522 = _4344 + 8;
            uint _4524 = uint(int(uint(_4522) >> uint(2)));
            float _4526 = as_type<float>(_dmw91.z);
            int _4528 = _4344 + 12;
            uint _4530 = uint(int(uint(_4528) >> uint(2)));
            float _4532 = as_type<float>(_dmw91.w);
            uint _4534 = uint(int(uint(_4368) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4534)];
            float _4536 = as_type<float>(_dmw89.x);
            int _4538 = _4368 + 4;
            uint _4540 = uint(int(uint(_4538) >> uint(2)));
            float _4542 = as_type<float>(_dmw89.y);
            int _4544 = _4368 + 8;
            uint _4546 = uint(int(uint(_4544) >> uint(2)));
            float _4548 = as_type<float>(_dmw89.z);
            int _4550 = _4368 + 12;
            uint _4552 = uint(int(uint(_4550) >> uint(2)));
            float _4554 = as_type<float>(_dmw89.w);
            uint _4556 = uint(int(uint(_4370) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4556)];
            float _4558 = as_type<float>(_dmw92.x);
            int _4560 = _4370 + 4;
            uint _4562 = uint(int(uint(_4560) >> uint(2)));
            float _4564 = as_type<float>(_dmw92.y);
            int _4566 = _4370 + 8;
            uint _4568 = uint(int(uint(_4566) >> uint(2)));
            float _4570 = as_type<float>(_dmw92.z);
            int _4572 = _4370 + 12;
            uint _4574 = uint(int(uint(_4572) >> uint(2)));
            float _4576 = as_type<float>(_dmw92.w);
            uint _4578 = uint(int(uint(_4394) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4578)];
            float _4580 = as_type<float>(_dmw90.x);
            int _4582 = _4394 + 4;
            uint _4584 = uint(int(uint(_4582) >> uint(2)));
            float _4586 = as_type<float>(_dmw90.y);
            int _4588 = _4394 + 8;
            uint _4590 = uint(int(uint(_4588) >> uint(2)));
            float _4592 = as_type<float>(_dmw90.z);
            int _4594 = _4394 + 12;
            uint _4596 = uint(int(uint(_4594) >> uint(2)));
            float _4598 = as_type<float>(_dmw90.w);
            uint _4600 = uint(int(uint(_4396) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4600)];
            float _4602 = as_type<float>(_dmw93.x);
            int _4604 = _4396 + 4;
            uint _4606 = uint(int(uint(_4604) >> uint(2)));
            float _4608 = as_type<float>(_dmw93.y);
            int _4610 = _4396 + 8;
            uint _4612 = uint(int(uint(_4610) >> uint(2)));
            float _4614 = as_type<float>(_dmw93.z);
            int _4616 = _4396 + 12;
            uint _4618 = uint(int(uint(_4616) >> uint(2)));
            float _4620 = as_type<float>(_dmw93.w);
            uint _4622 = uint(int(uint(_4420) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4622)];
            float _4624 = as_type<float>(_dmw94.x);
            int _4626 = _4420 + 4;
            uint _4628 = uint(int(uint(_4626) >> uint(2)));
            float _4630 = as_type<float>(_dmw94.y);
            int _4632 = _4420 + 8;
            uint _4634 = uint(int(uint(_4632) >> uint(2)));
            float _4636 = as_type<float>(_dmw94.z);
            int _4638 = _4420 + 12;
            uint _4640 = uint(int(uint(_4638) >> uint(2)));
            float _4642 = as_type<float>(_dmw94.w);
            uint _4644 = uint(int(uint(_4422) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4644)];
            float _4646 = as_type<float>(_dmw95.x);
            int _4648 = _4422 + 4;
            uint _4650 = uint(int(uint(_4648) >> uint(2)));
            float _4652 = as_type<float>(_dmw95.y);
            int _4654 = _4422 + 8;
            uint _4656 = uint(int(uint(_4654) >> uint(2)));
            float _4658 = as_type<float>(_dmw95.z);
            int _4660 = _4422 + 12;
            uint _4662 = uint(int(uint(_4660) >> uint(2)));
            float _4664 = as_type<float>(_dmw95.w);
            float _4666 = -_3228;
            float _4668 = _4666 + _3234;
            float _4670 = -_4668;
            float _4672 = _1306 + _4670;
            float _4674 = _4094 * _4668;
            float _4676 = _4100 * _4668;
            float _4678 = _4106 * _4668;
            float _4680 = _4112 * _4668;
            float _4682 = _4120 * _4668;
            float _4684 = _4126 * _4668;
            float _4686 = _4132 * _4668;
            float _4688 = _4138 * _4668;
            float _4690 = _4144 * _4668;
            float _4692 = _4150 * _4668;
            float _4694 = _4156 * _4668;
            float _4696 = _4162 * _4668;
            float _4698 = _4170 * _4668;
            float _4700 = _4176 * _4668;
            float _4702 = _4182 * _4668;
            float _4704 = _4188 * _4668;
            float _4706 = _4194 * _4668;
            float _4708 = _4200 * _4668;
            float _4710 = _4206 * _4668;
            float _4712 = _4212 * _4668;
            float _4714 = _4218 * _4668;
            float _4716 = _4224 * _4668;
            float _4718 = _4230 * _4668;
            float _4720 = _4236 * _4668;
            float _4722 = _4244 * _4668;
            float _4724 = _4250 * _4668;
            float _4726 = _4256 * _4668;
            float _4728 = _4262 * _4668;
            float _4730 = _4270 * _4668;
            float _4732 = _4276 * _4668;
            float _4734 = _4282 * _4668;
            float _4736 = _4288 * _4668;
            float _4738 = -_3234;
            float _4740 = fma(_4296, _4738, _4674);
            float _4742 = -_3234;
            float _4744 = fma(_4302, _4742, _4676);
            float _4746 = -_3234;
            float _4748 = fma(_4308, _4746, _4678);
            float _4750 = -_3234;
            float _4752 = fma(_4314, _4750, _4680);
            float _4754 = -_3234;
            float _4756 = fma(_4322, _4754, _4682);
            float _4758 = -_3234;
            float _4760 = fma(_4328, _4758, _4684);
            float _4762 = -_3234;
            float _4764 = fma(_4334, _4762, _4686);
            float _4766 = -_3234;
            float _4768 = fma(_4340, _4766, _4688);
            float _4770 = -_3234;
            float _4772 = fma(_4348, _4770, _4690);
            float _4774 = -_3234;
            float _4776 = fma(_4354, _4774, _4692);
            float _4778 = -_3234;
            float _4780 = fma(_4360, _4778, _4694);
            float _4782 = -_3234;
            float _4784 = fma(_4366, _4782, _4696);
            float _4786 = -_3234;
            float _4788 = fma(_4374, _4786, _4698);
            float _4790 = -_3234;
            float _4792 = fma(_4380, _4790, _4700);
            float _4794 = -_3234;
            float _4796 = fma(_4386, _4794, _4702);
            float _4798 = -_3234;
            float _4800 = fma(_4392, _4798, _4704);
            float _4802 = -_3234;
            float _4804 = fma(_4400, _4802, _4706);
            float _4806 = -_3234;
            float _4808 = fma(_4406, _4806, _4708);
            float _4810 = -_3234;
            float _4812 = fma(_4412, _4810, _4710);
            float _4814 = -_3234;
            float _4816 = fma(_4418, _4814, _4712);
            float _4818 = -_3234;
            float _4820 = fma(_4426, _4818, _4714);
            float _4822 = -_3234;
            float _4824 = fma(_4432, _4822, _4716);
            float _4826 = -_3234;
            float _4828 = fma(_4438, _4826, _4718);
            float _4830 = -_3234;
            float _4832 = fma(_4444, _4830, _4720);
            float _4834 = -_3234;
            float _4836 = fma(_4448, _4834, _4722);
            float _4838 = -_3234;
            float _4840 = fma(_4454, _4838, _4724);
            float _4842 = -_3234;
            float _4844 = fma(_4460, _4842, _4726);
            float _4846 = -_3234;
            float _4848 = fma(_4466, _4846, _4728);
            float _4850 = -_3234;
            float _4852 = fma(_4470, _4850, _4730);
            float _4854 = -_3234;
            float _4856 = fma(_4476, _4854, _4732);
            float _4858 = -_3234;
            float _4860 = fma(_4482, _4858, _4734);
            float _4862 = -_3234;
            float _4864 = fma(_4488, _4862, _4736);
            float _4866 = fma(_4492, _4672, _4740);
            float _4868 = fma(_4498, _4672, _4744);
            float _4870 = fma(_4504, _4672, _4748);
            float _4872 = fma(_4510, _4672, _4752);
            float _4874 = fma(_4514, _4672, _4756);
            float _4876 = fma(_4520, _4672, _4760);
            float _4878 = fma(_4526, _4672, _4764);
            float _4880 = fma(_4532, _4672, _4768);
            float _4882 = fma(_4536, _4672, _4772);
            float _4884 = fma(_4542, _4672, _4776);
            float _4886 = fma(_4548, _4672, _4780);
            float _4888 = fma(_4554, _4672, _4784);
            float _4890 = fma(_4558, _4672, _4788);
            float _4892 = fma(_4564, _4672, _4792);
            float _4894 = fma(_4570, _4672, _4796);
            float _4896 = fma(_4576, _4672, _4800);
            float _4898 = fma(_4580, _4672, _4804);
            float _4900 = fma(_4586, _4672, _4808);
            float _4902 = fma(_4592, _4672, _4812);
            float _4904 = fma(_4598, _4672, _4816);
            float _4906 = fma(_4602, _4672, _4820);
            float _4908 = fma(_4608, _4672, _4824);
            float _4910 = fma(_4614, _4672, _4828);
            float _4912 = fma(_4620, _4672, _4832);
            float _4914 = fma(_4624, _4672, _4836);
            float _4916 = fma(_4630, _4672, _4840);
            float _4918 = fma(_4636, _4672, _4844);
            float _4920 = fma(_4642, _4672, _4848);
            float _4922 = fma(_4646, _4672, _4852);
            float _4924 = fma(_4652, _4672, _4856);
            float _4926 = fma(_4658, _4672, _4860);
            float _4928 = fma(_4664, _4672, _4864);
            _2252 = _4876;
            _2254 = _4880;
            _2256 = _4890;
            _2258 = _4874;
            _2260 = _4908;
            _2262 = _4910;
            _2264 = _4892;
            _2266 = _4896;
            _2268 = _4912;
            _2270 = _4906;
            _2272 = _4894;
            _2274 = _4878;
            _2276 = _4924;
            _2278 = _4922;
            _2280 = _4872;
            _2282 = _4882;
            _2284 = _4884;
            _2286 = _4916;
            _2288 = _4866;
            _2290 = _4868;
            _2292 = _4870;
            _2294 = _4914;
            _2296 = _4926;
            _2298 = _4886;
            _2300 = _4888;
            _2302 = _4898;
            _2304 = _4918;
            _2306 = _4928;
            _2308 = _4900;
            _2310 = _4902;
            _2312 = _4904;
            _2314 = _4920;
        }
    }
    _2316 = false;
    float _4930 = _2252;
    float _4932 = _2254;
    float _4934 = _2256;
    float _4936 = _2258;
    float _4938 = _2260;
    float _4940 = _2262;
    float _4942 = _2264;
    float _4944 = _2266;
    float _4946 = _2268;
    float _4948 = _2270;
    float _4950 = _2272;
    float _4952 = _2274;
    float _4954 = _2276;
    float _4956 = _2278;
    float _4958 = _2280;
    float _4960 = _2282;
    float _4962 = _2284;
    float _4964 = _2286;
    float _4966 = _2288;
    float _4968 = _2290;
    float _4970 = _2292;
    float _4972 = _2294;
    float _4974 = _2296;
    float _4976 = _2298;
    float _4978 = _2300;
    float _4980 = _2302;
    float _4982 = _2304;
    float _4984 = _2306;
    float _4986 = _2308;
    float _4988 = _2310;
    float _4990 = _2312;
    float _4992 = _2314;
    float _4994 = _4930 * 0.88622760772705078125;
    float _4996 = _4932 * 0.511664927005767822265625;
    float _4998 = _4934 * 0.511664927005767822265625;
    float _5000 = _4936 * 0.88622760772705078125;
    float _5002 = _4938 * 0.511664927005767822265625;
    float _5004 = _4996 * _4996;
    float _5006 = precise::max(_4994, 0.00999999977648258209228515625);
    float _5008 = _4940 * 0.511664927005767822265625;
    float _5010 = _4998 * _4998;
    float _5012 = _4942 * 0.511664927005767822265625;
    float _5014 = precise::max(_5000, 0.00999999977648258209228515625);
    float _5016 = fma(_5002, _5002, _5004);
    float _5018 = 1.0 / _5006;
    float _5020 = _4944 * 0.511664927005767822265625;
    float _5022 = fma(_5008, _5008, _5010);
    float _5024 = _4946 * 0.511664927005767822265625;
    float _5026 = _4948 * 0.511664927005767822265625;
    float _5028 = _4950 * 0.511664927005767822265625;
    float _5030 = _4952 * 0.88622760772705078125;
    float _5032 = 1.0 / _5014;
    float _5034 = _5012 * _5012;
    float _5036 = fma(_5028, _5028, _5016);
    float _5038 = precise::max(_5030, 0.00999999977648258209228515625);
    float _5040 = fma(_1392, 1.9073486328125, 0.5);
    float _5042 = fma(_5024, _5024, _5034);
    float _5044 = sqrt(_5036);
    float _5046 = fma(_5020, _5020, _5022);
    float _5048 = fma(_5026, _5026, _5042);
    float _5050 = _1392 * 3.903682708740234375;
    float _5052 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5054 = _5052 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5056 = _5050 * _4954;
    float _5058 = sqrt(_5046);
    float _5060 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5062 = _5060 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5064 = fma(_4956, 0.88622701168060302734375, _5056);
    float _5066 = _5050 * _4958;
    float _5068 = _5050 * _4960;
    float _5070 = _5050 * _4962;
    float _5072 = _5050 * _4964;
    float _5074 = sqrt(_5048);
    float _5076 = fma(_4966, 0.88622701168060302734375, _5066);
    float _5078 = fma(_4968, 0.88622701168060302734375, _5068);
    float _5080 = fma(_4970, 0.88622701168060302734375, _5070);
    float _5082 = fma(_4972, 0.88622701168060302734375, _5072);
    float _5084 = precise::max(_5058, 0.00999999977648258209228515625);
    float _5086 = 1.0 / _5038;
    float _5088 = fma(_5040, _5062, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5090 = precise::max(_5074, 0.00999999977648258209228515625);
    float _5092 = 1.0 / _5084;
    int _5094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5096 = _5094 != 0;
    float _5098 = precise::max(_5044, 0.00999999977648258209228515625);
    float _5100 = 1.0 / _5090;
    float _5102 = fma(_5040, _5054, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5104 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5106 = _5104 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5108 = _5102 * 0.715200006961822509765625;
    float _5110 = fma(_5040, _5106, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5112 = _5090 * _5086;
    float _5114 = precise::clamp(_5112, 0.0, 1.0);
    float _5116 = 1.0 / _5098;
    float _5118 = fma(_5088, 0.2125999927520751953125, _5108);
    float _5120 = _4998 * _5092;
    float _5122 = _5098 * _5032;
    float _5124 = precise::clamp(_5122, 0.0, 1.0);
    float _5126 = _5020 * _5092;
    float _5128 = fma(_5110, 0.072200000286102294921875, _5118);
    float _5130 = _1442 * _5120;
    float _5132 = _5084 * _5018;
    float _5134 = precise::clamp(_5132, 0.0, 1.0);
    float _5136 = _5012 * _5100;
    float _5138 = _5008 * _5092;
    float _5140 = _5124 + 1.0;
    float _5142 = _5024 * _5100;
    float _5144 = _1442 * _5136;
    float _5146 = -_1438;
    float _5148 = fma(_5146, _5138, _5130);
    float _5150 = 1.0 / _5140;
    float _5152 = _5026 * _5100;
    float _5154 = _4996 * _5116;
    float _5156 = _5002 * _5116;
    float _5158 = _5028 * _5116;
    float _5160 = _1442 * _5154;
    float _5162 = -_1438;
    float _5164 = fma(_5162, _5142, _5144);
    float _5166 = -_1436;
    float _5168 = fma(_5166, _5126, _5148);
    float _5170 = _5114 + 1.0;
    float _5172 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5174 = _5172 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5176 = -_1438;
    float _5178 = fma(_5176, _5156, _5160);
    float _5180 = -_1436;
    float _5182 = fma(_5180, _5152, _5164);
    float _5184 = 1.0 / _5170;
    float _5186 = fma(_5040, _5174, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5188 = -_1436;
    float _5190 = fma(_5188, _5158, _5178);
    float _5192 = fma(_5182, 0.5, 0.5);
    float _5194 = _1436 * (-1.02332699298858642578125);
    float _5196 = fma(_5190, 0.5, 0.5);
    float _5198 = 1.0 / _5128;
    float _5200 = fma(_5168, 0.5, 0.5);
    float _5202 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5204 = _5202 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5206 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5208 = _5206 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5210 = fma(_5194, _4974, _5064);
    float _5212 = fma(_5040, _5204, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5214 = fma(_5124, 2.0, 1.0);
    float _5216 = abs(_5200);
    float _5218 = log2(_5216);
    float _5220 = _5134 + 1.0;
    float _5222 = fma(_5040, _5208, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5224 = fma(_5194, _4976, _5076);
    float _5226 = fma(_5194, _4978, _5078);
    float _5228 = fma(_5194, _4980, _5080);
    float _5230 = fma(_5194, _4982, _5082);
    float _5232 = abs(_5192);
    float _5234 = log2(_5232);
    float _5236 = fma(_5134, 2.0, 1.0);
    float _5238 = _5198 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5240 = precise::clamp(_5238, 0.0, 1.0);
    float _5242 = fma(_5240, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5244 = 1.0 / _5220;
    float _5246 = _5236 * _5218;
    float _5248 = fma(_5114, 2.0, 1.0);
    float _5250 = _5102 * _5242;
    float _5252 = abs(_5196);
    float _5254 = log2(_5252);
    float _5256 = _5248 * _5234;
    float _5258 = -_5124;
    float _5260 = _5258 + 1.0;
    float _5262 = fma(_5114, 2.0, 2.0);
    float _5264 = -_5114;
    float _5266 = _5264 + 1.0;
    float _5268 = _5260 * _5150;
    float _5270 = _5088 * _5242;
    float _5272 = exp2(_5246);
    float _5274 = _1438 * (-1.02332699298858642578125);
    float _5276 = _5266 * _5184;
    float _5278 = fma(_5274, _4984, _5210);
    float _5280 = fma(_5274, _4986, _5224);
    float _5282 = fma(_5274, _4988, _5226);
    float _5284 = _5214 * _5254;
    float _5286 = exp2(_5256);
    float _5288 = precise::max(0.0, _5278);
    float _5290 = fma(_5274, _4990, _5228);
    float _5292 = fma(_5274, _4992, _5230);
    float _5294 = precise::max(0.0, _5280);
    float _5296 = _5288 * 0.31830990314483642578125;
    float _5298 = precise::clamp(_5296, 0.0, 1.0);
    float _5300 = precise::max(0.0, _5282);
    float _5302 = exp2(_5284);
    float _5304 = precise::max(0.0, _5290);
    float _5306 = -_5298;
    float _5308 = _5306 + 1.0;
    float _5310 = precise::max(0.0, _5292);
    float _5312 = _5294 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5314 = _5300 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5316 = fma(_5308, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5298);
    float _5318 = _5110 * _5242;
    float _5320 = _5262 * _5286;
    float _5322 = fma(_5124, 2.0, 2.0);
    float _5324 = -_5134;
    float _5326 = _5324 + 1.0;
    float _5328 = fma(_5134, 2.0, 2.0);
    float _5330 = -_5320;
    float _5332 = _5330 + 1.0;
    float _5334 = _5304 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5336 = _5326 * _5244;
    float _5338 = _5328 * _5272;
    float _5340 = _5322 * _5302;
    float _5342 = fma(_5276, _5332, _5320);
    float _5344 = _5310 * 0.31830990314483642578125;
    float _5346 = precise::clamp(_5344, 0.0, 1.0);
    float _5348 = -_5338;
    float _5350 = _5348 + 1.0;
    float _5352 = -_5340;
    float _5354 = _5352 + 1.0;
    float _5356 = _5030 * _5342;
    float _5358 = precise::max(_5312, _5270);
    float _5360 = fma(_5336, _5350, _5338);
    float _5362 = fma(_5268, _5354, _5340);
    float _5364 = _5356 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5366 = precise::max(_5314, _5250);
    float _5368 = _4994 * _5360;
    float _5370 = _5000 * _5362;
    float _5372 = precise::max(_5334, _5318);
    float _5374 = _5346 * 0.88622701168060302734375;
    float _5376 = _5368 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5378 = _5370 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5380 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5358);
    float _5382 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5366);
    float _5384 = precise::max(_5376, _5186);
    float _5386 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5372);
    float _5388 = precise::max(_5378, _5212);
    float _5390 = precise::max(_5364, _5222);
    float _5392 = fma(_5384, _5316, _5382);
    float _5394 = fma(_5388, _5316, _5380);
    float _5396 = fma(_5390, _5316, _5386);
    bool _5398 = !_5096;
    float _5400;
    float _5402;
    float _5404;
    float _5406;
    float _5408;
    float _5410;
    float _5412;
    float _5414;
    float _5416;
    float _5418;
    int _5420;
    float _5422;
    int _5424;
    float _5426;
    int _5428;
    float _5430;
    float _5432;
    float _5434;
    float _5436;
    float _5438;
    float _5440;
    int _5442;
    int _5444;
    float _5446;
    int _5448;
    float _5450;
    float _5452;
    int _5454;
    int _5456;
    float _5458;
    int _5460;
    float _5462;
    if (!_5398)
    {
        _5400 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5402 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5404 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5406 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5408 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5410 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5412 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5414 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5416 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5418 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5422 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5426 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5430 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5432 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5434 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5436 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5438 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5440 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5446 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5450 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5452 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5458 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5462 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5464 = true;
    }
    else
    {
        float _5466 = fma(_1244, 6.2500002968590706586837768554688e-05, 0.5);
        float _5468 = fma(_1240, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14567 = float3(_5466, _5468, float(0));
        float3 _14569 = select(_14567, float3(0.0), isnan(_14567));
        float4 _5471 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14569.xy, uint(rint(_14569.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14569.xy, uint(rint(_14569.z)), level(0.0)).xyzw;
        float _5473 = _5471.x;
        float _5475 = _5471.y;
        float _5477 = _5471.z;
        float _5479 = _5471.w;
        float3 _14584 = float3(_5466, _5468, float(1));
        float3 _14586 = select(_14584, float3(0.0), isnan(_14584));
        float4 _5481 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14586.xy, uint(rint(_14586.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14586.xy, uint(rint(_14586.z)), level(0.0)).xyzw;
        float _5483 = _5481.x;
        float _5485 = _5481.y;
        float _5487 = _5481.z;
        float _5489 = _5481.w;
        float3 _14601 = float3(_5466, _5468, float(2));
        float3 _14603 = select(_14601, float3(0.0), isnan(_14601));
        float4 _5491 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14603.xy, uint(rint(_14603.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14603.xy, uint(rint(_14603.z)), level(0.0)).xyzw;
        float _5493 = _5491.x;
        float _5495 = _5491.y;
        float _5497 = _5491.z;
        float _5499 = _5491.w;
        float3 _14618 = float3(_5466, _5468, float(3));
        float3 _14620 = select(_14618, float3(0.0), isnan(_14618));
        float4 _5501 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14620.xy, uint(rint(_14620.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14620.xy, uint(rint(_14620.z)), level(0.0)).xyzw;
        float _5503 = _5501.x;
        float _5505 = _5501.y;
        float _5507 = _5501.z;
        float _5509 = _5501.w;
        float3 _14635 = float3(_5466, _5468, float(4));
        float3 _14637 = select(_14635, float3(0.0), isnan(_14635));
        float4 _5511 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14637.xy, uint(rint(_14637.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14637.xy, uint(rint(_14637.z)), level(0.0)).xyzw;
        float _5513 = _5511.x;
        float _5515 = _5511.y;
        float _5517 = _5511.z;
        float _5519 = _5511.w;
        float3 _14652 = float3(_5466, _5468, float(5));
        float3 _14654 = select(_14652, float3(0.0), isnan(_14652));
        float4 _5521 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14654.xy, uint(rint(_14654.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14654.xy, uint(rint(_14654.z)), level(0.0)).xyzw;
        float _5523 = _5521.x;
        float _5525 = _5521.y;
        float _5527 = _5521.z;
        float _5529 = _5521.w;
        float3 _14669 = float3(_5466, _5468, float(6));
        float3 _14671 = select(_14669, float3(0.0), isnan(_14669));
        float4 _5531 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14671.xy, uint(rint(_14671.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14671.xy, uint(rint(_14671.z)), level(0.0)).xyzw;
        float _5533 = _5531.x;
        float _5535 = _5531.y;
        float _5537 = _5531.z;
        float _5539 = _5531.w;
        float3 _14686 = float3(_5466, _5468, float(7));
        float3 _14688 = select(_14686, float3(0.0), isnan(_14686));
        float4 _5541 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14688.xy, uint(rint(_14688.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14688.xy, uint(rint(_14688.z)), level(0.0)).xyzw;
        float _5543 = _5541.x;
        float _5545 = _5541.y;
        float _5547 = _5541.z;
        float _5549 = _5541.w;
        _5400 = _5535;
        _5402 = _5545;
        _5404 = _5503;
        _5406 = _5505;
        _5408 = _5533;
        _5410 = _5543;
        _5412 = _5507;
        _5414 = _5479;
        _5416 = _5537;
        _5418 = _5547;
        _5420 = as_type<int>(_5513);
        _5422 = _5539;
        _5424 = as_type<int>(_5515);
        _5426 = _5549;
        _5428 = as_type<int>(_5509);
        _5430 = _5483;
        _5432 = _5473;
        _5434 = _5485;
        _5436 = _5475;
        _5438 = _5487;
        _5440 = _5477;
        _5442 = as_type<int>(_5517);
        _5444 = as_type<int>(_5519);
        _5446 = _5489;
        _5448 = as_type<int>(_5523);
        _5450 = _5495;
        _5452 = _5493;
        _5454 = as_type<int>(_5525);
        _5456 = as_type<int>(_5527);
        _5458 = _5497;
        _5460 = as_type<int>(_5529);
        _5462 = _5499;
    }
    _5464 = false;
    float _5551 = _5400;
    float _5553 = _5402;
    float _5555 = _5404;
    float _5557 = _5406;
    float _5559 = _5408;
    float _5561 = _5410;
    float _5563 = _5412;
    float _5565 = _5414;
    float _5567 = _5416;
    float _5569 = _5418;
    int _5571 = _5420;
    float _5573 = _5422;
    int _5575 = _5424;
    float _5577 = _5426;
    int _5579 = _5428;
    float _5581 = _5430;
    float _5583 = _5432;
    float _5585 = _5434;
    float _5587 = _5436;
    float _5589 = _5438;
    float _5591 = _5440;
    int _5593 = _5442;
    int _5595 = _5444;
    float _5597 = _5446;
    int _5599 = _5448;
    float _5601 = _5450;
    float _5603 = _5452;
    int _5605 = _5454;
    int _5607 = _5456;
    float _5609 = _5458;
    int _5611 = _5460;
    float _5613 = _5462;
    float _5615 = _5050 * _5551;
    float _5617 = _5050 * _5553;
    float _5619 = _5555 * 0.88622701168060302734375;
    float _5621 = _5557 * 0.88622701168060302734375;
    float _5623 = fma(_5559, 0.88622701168060302734375, _5615);
    float _5625 = fma(_5561, 0.88622701168060302734375, _5617);
    float _5627 = _5563 * 0.88622701168060302734375;
    float _5629 = _5050 * _5565;
    float _5631 = fma(_5194, _5567, _5623);
    float _5633 = fma(_5194, _5569, _5625);
    out.m_54.x = _1244;
    out.m_54.y = _1348;
    out.m_54.z = _1240;
    float _5635 = _5096 ? as_type<float>(_5571) : 0.0;
    float _5637 = fma(_5274, _5573, _5631);
    float _5639 = _5096 ? as_type<float>(_5575) : 0.0;
    float _5641 = fma(_5274, _5577, _5633);
    float _5643 = _5096 ? as_type<float>(_5579) : 0.0;
    float _5645 = _5050 * _5581;
    float _5647 = _5096 ? _5627 : 0.0;
    float _5649 = fma(_5583, 0.88622701168060302734375, _5629);
    float _5651 = _5050 * _5585;
    float _5653 = precise::max(0.0, _5637);
    float _5655 = fma(_5587, 0.88622701168060302734375, _5645);
    float _5657 = _5096 ? _5619 : 0.0;
    float _5659 = fma(_5050, _5639, _5647);
    float _5661 = _5096 ? _5621 : 0.0;
    float _5663 = fma(_5194, _5589, _5649);
    float _5665 = precise::max(0.0, _5641);
    float _5667 = fma(_5050, _5643, _5657);
    float _5669 = fma(_5591, 0.88622701168060302734375, _5651);
    float _5671 = fma(_5050, _5635, _5661);
    float _5673 = _5096 ? as_type<float>(_5593) : 0.0;
    float _5675 = _5653 * 0.31830990314483642578125;
    float _5677 = precise::clamp(_5675, 0.0, 1.0);
    float _5679 = _5096 ? as_type<float>(_5595) : 0.0;
    float _5681 = fma(_5194, _5597, _5655);
    float _5683 = _5096 ? as_type<float>(_5599) : 0.0;
    float _5685 = fma(_5274, _5601, _5663);
    float _5687 = fma(_5194, _5603, _5669);
    float _5689 = _5665 * 0.31830990314483642578125;
    float _5691 = precise::clamp(_5689, 0.0, 1.0);
    float _5693 = fma(_5194, _5673, _5667);
    float _5695 = fma(_5194, _5679, _5671);
    float _5697 = fma(_5194, _5683, _5659);
    float _5699 = _5096 ? as_type<float>(_5605) : 0.0;
    float _5701 = _5677 * 0.88622701168060302734375;
    float _5703 = _5096 ? as_type<float>(_5607) : 0.0;
    float _5705 = fma(_5274, _5609, _5681);
    float _5707 = _5096 ? as_type<float>(_5611) : 0.0;
    float _5709 = fma(_5274, _5613, _5687);
    float _5711 = precise::max(0.0, _5685);
    float _5713 = -_5691;
    float _5715 = _5713 + 1.0;
    float _5717 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _5719 = fma(_5274, _5699, _5693);
    float _5721 = fma(_5274, _5703, _5695);
    float _5723 = fma(_5274, _5707, _5697);
    float _5725 = fma(_5715, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5691);
    float _5727 = precise::max(0.0, _5705);
    float _5729 = fma(_5711, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5717);
    float _5731 = precise::max(0.0, _5709);
    float _5733 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5735 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5737 = precise::max(0.0, _5719);
    float _5739 = _5725 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5741 = precise::max(0.0, _5721);
    float _5743 = fma(_5727, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5733);
    float _5745 = precise::max(0.0, _5723);
    float _5747 = fma(_5731, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5735);
    float _5749 = fma(_5737, _5739, _5729);
    float _5751 = fma(_5741, _5739, _5743);
    float _5753 = -_1436;
    float _5755 = (-0.0) + _5753;
    float _5757 = -_1438;
    float _5759 = (-0.0) + _5757;
    float _5761 = fma(_5745, _5739, _5747);
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1446;
    float _15029 = as_type<float>(_1452);
    out.gl_Position.z = _15029;
    out.gl_Position.w = _1448;
    out.m_56.x = _5394;
    out.m_56.y = _5392;
    out.m_56.z = _5396;
    out.m_58.w = _1410;
    out.m_60.x = _5759;
    out.m_60.y = _1442;
    out.m_60.z = _5755;
    out.m_58.x = _5749;
    out.m_58.y = _5751;
    out.m_58.z = _5761;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5464 = false;
    bool _2316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_51.x;
    float _76 = in.m_51.y;
    float _78 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _80 = _78 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _83 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _85 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _87 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _85;
    int _89 = _83 << 4;
    bool _93 = _89 == 0;
    bool _95 = _89 == 16;
    bool _97 = _89 == 32;
    bool _99 = _89 == 48;
    bool _101 = _89 == 64;
    float _103 = fma(_80, _76, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _105 = _89 == 80;
    float _107 = as_type<float>(gl_BaseInstance);
    float _109 = _76;
    float _111 = _74;
    if (_93)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _107;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _103 + _115;
    float _119 = fma(_76, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _121 = _89 == 96;
    float _123 = _117 * _117;
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = _119 + _125;
    float _129 = 0.0;
    float _131 = _113;
    if (_93)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _133 = _129;
    float _135 = fma(_87, _87, _123);
    float _137 = _133;
    if (_95)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _139 = _131;
    bool _141 = _89 == 112;
    float _143 = fma(_127, _127, _135);
    float _145 = _139;
    if (_95)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _137;
    float _149 = _147;
    if (_97)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = rsqrt(_143);
    bool _155 = _89 == 128;
    float _157 = _151;
    if (_97)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_99)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _163 = _157;
    bool _165 = _89 == 144;
    float _167 = _163;
    if (_99)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_101)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _173 = _167;
    bool _175 = _89 == 160;
    float _177 = _173;
    if (_101)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _179 = _171;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _179;
    if (_105)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _177;
    bool _187 = _89 == 176;
    float _189 = _185;
    if (_105)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _191 = _183;
    float _193 = log2(_181);
    bool _195 = _89 == 192;
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
    bool _209 = _89 == 208;
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
    bool _219 = _89 == 224;
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
    bool _231 = _89 == 240;
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
    bool _245 = _89 == 256;
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
    bool _255 = _89 == 272;
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
    bool _267 = _89 == 288;
    float _269 = _263;
    if (_195)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _261;
    float _273 = float(_265);
    bool _275 = _89 == 304;
    int _277 = _265 << 4;
    int _279 = _277 + 4288;
    float _281 = _271;
    if (_209)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _283 = _269;
    float _285 = _283;
    if (_209)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _287 = _281;
    float _289 = -_273;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _293 = _287;
    if (_219)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _295 = _285;
    int _297 = _279 + 8;
    uint _300 = uint(int(uint(_297) >> uint(2)));
    uint _302 = uint(int(uint(int(_300)) >> uint(2)));
    int _304 = int(_300) & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    int _308 = int(_300) + 1;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    int _312 = _308 & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    bool _316 = _89 == 320;
    float _318 = _291 + 1.0;
    float _320 = _295;
    if (_219)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _322 = _293;
    float _324 = _322;
    if (_231)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _326 = _320;
    bool _328 = _89 == 336;
    float _330 = exp2(_318);
    float _332 = _326;
    if (_231)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _334 = _324;
    float _336 = _334;
    if (_245)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _338 = _332;
    bool _340 = _89 == 352;
    float _342 = _338;
    if (_245)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_255)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _348 = _342;
    bool _350 = _89 == 368;
    float _352 = _348;
    if (_255)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _354 = _346;
    float _356 = _354;
    if (_267)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _358 = _352;
    float _360 = 1.0 / _330;
    bool _362 = _89 == 384;
    float _364 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _356;
    float _368 = _366;
    if (_275)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _364;
    bool _372 = _89 == 400;
    float _374 = _370;
    if (_275)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _89 == 416;
    float _380 = _376;
    if (_316)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_316)
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
    bool _392 = _89 == 432;
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
    bool _402 = _89 == 448;
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
    bool _412 = _89 == 464;
    float _414 = _410;
    if (_350)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_362)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _89 == 480;
    float _424 = _420;
    if (_362)
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
    bool _432 = _89 == 496;
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
    bool _442 = _89 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _89 == 528;
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
    bool _462 = _89 == 544;
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
    bool _472 = _89 == 560;
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
    bool _482 = _89 == 576;
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
    bool _492 = _89 == 592;
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
    bool _502 = _89 == 608;
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
    bool _512 = _89 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _89 == 640;
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
    bool _532 = _89 == 656;
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
    bool _542 = _89 == 672;
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
    bool _552 = _89 == 688;
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
    bool _562 = _89 == 704;
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
    bool _572 = _89 == 720;
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
    bool _582 = _89 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _89 == 752;
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
    float _626 = _618 * _76;
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
    float _650 = _330 * _648;
    float _652 = -_636;
    float _654 = _626 + _652;
    float _656 = _654 * 2.0;
    float _658 = -_654;
    float _660 = fma(_650, _658, _76);
    float _662 = floor(_656);
    float _664 = _650 * _662;
    float _666 = _664 * 0.5;
    float _668 = _666 + _660;
    float _670 = fma(_80, _668, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _670 + _672;
    float _676 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _678 = _674 * _674;
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _682 = _676 + _680;
    float _684 = fma(_87, _87, _678);
    float _686 = fma(_682, _682, _684);
    float _688 = fma(0.008000000379979610443115234375, (*spvDescriptorSet0.vp_c15)._m0[0].z, 64.0);
    float _690 = sqrt(_686);
    float _692 = precise::max(0.0, _688);
    float _694 = precise::min(_692, 127.0);
    float _696 = trunc(_694);
    int _698 = int(_696);
    float _700 = -_314;
    float _702 = fma(_690, _306, _700);
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = -_666;
    float _708 = fma(_706, _704, _668);
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = fma(_710, 0.008000000379979610443115234375, 64.0);
    float _714 = precise::max(0.0, _712);
    float _716 = precise::min(_714, 127.0);
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _720 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _722 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _720;
    float _724 = trunc(_716);
    int _726 = int(_724);
    int _728 = _718 + 76;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c6)._m0[int(_732)][_734];
    uint _738 = uint(int(uint(_718) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c6)._m0[int(_740)][_742];
    int _746 = _726 << 7;
    int _748 = _746 + _698;
    int _750 = _748 << 4;
    float _752 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _754 = _710 + _752;
    int _756 = _750 + 8;
    float _758 = abs(_722);
    float _760 = abs(_754);
    float _762 = precise::max(_758, _760);
    float _764 = _736 + 8.0;
    uint _766 = uint(int(uint(_756) >> uint(2)));
    float _768 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_766)]);
    bool _770 = _74 >= 0.5;
    bool _772 = isnan(_74);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    float _780 = _764 + _762;
    float _782 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _784 = _710 + _782;
    float _786 = _780 * _744;
    float _788 = _786 * 4.0;
    float _790 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _792 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _796 = precise::max(_788, 1.0);
    float _798 = _790;
    float _800 = as_type<float>(_750);
    if (!_778)
    {
        float _802 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _109 = _802;
    }
    float _804 = _109;
    float _806 = log2(_796);
    float _808 = _804;
    if (!_778)
    {
        float _810 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _111 = _810;
    }
    float _812 = _111;
    float _814 = _812;
    if (!_778)
    {
        float _816 = _804 + _794;
        _808 = _816;
    }
    float _818 = _808;
    float _820 = _818;
    if (!_778)
    {
        float _822 = _812 + _794;
        _814 = _822;
    }
    float _824 = _814;
    float _826 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _826;
    float _830 = trunc(_806);
    int _832 = int(_830);
    float _834 = floor(_806);
    int _836 = min(_832, 4);
    int _838 = _836 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _840 = _838 << 4;
    float _842 = _834 + 1.0;
    float _844 = rint(_834);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    uint _850 = clamp(_848, 0u, 65535u);
    uint _852 = uint(int(uint(_840) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.vp_c6)._m0[int(_854)][_856];
    float _860 = rint(_842);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    uint _866 = clamp(_864, 0u, 65535u);
    int _868 = _840 + 16;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    uint _872 = uint(int(uint(int(_870)) >> uint(2)));
    int _874 = int(_870) & 3;
    float _876 = (*spvDescriptorSet0.vp_c6)._m0[int(_872)][_874];
    float _878 = fma(_784, _858, 0.5);
    float _880 = fma(_828, _858, 0.5);
    float _882 = fma(_784, _876, 0.5);
    float _884 = fma(_828, _876, 0.5);
    float _886 = as_type<float>(_840);
    float _888 = _828;
    float _890 = _824;
    if (!_778)
    {
        float2 _7156 = float2(_818, _824);
        float2 _894 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7156, float2(0.0), isnan(_7156)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7156, float2(0.0), isnan(_7156)), level(0.0)).xw;
        float _896 = _894.x;
        float _898 = _894.y;
        _886 = _896;
        _888 = _898;
    }
    float _900 = _886;
    float _902 = _888;
    float3 _7178 = float3(_880, _878, float(int(_850)));
    float3 _7182 = select(_7178, float3(0.0), isnan(_7178));
    float3 _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7182.xy, uint(rint(_7182.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7182.xy, uint(rint(_7182.z)), level(0.0)).xyz;
    float _908 = _906.x;
    float _910 = _906.y;
    float _912 = _906.z;
    float3 _7197 = float3(_884, _882, float(int(_866)));
    float3 _7199 = select(_7197, float3(0.0), isnan(_7197));
    float3 _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7199.xy, uint(rint(_7199.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7199.xy, uint(rint(_7199.z)), level(0.0)).xyz;
    float _916 = _914.x;
    float _918 = _914.y;
    float _920 = _914.z;
    float _922 = floor(_694);
    int _924 = _750 + 12;
    uint _926 = uint(int(uint(_750) >> uint(2)));
    float _928 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_926)]);
    uint _930 = uint(int(uint(_924) >> uint(2)));
    float _932 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_930)]);
    float _934 = floor(_716);
    float _936 = -_922;
    float _938 = _694 + _936;
    float _940 = -_934;
    float _942 = _716 + _940;
    float _944 = 0.0;
    float _946 = _910;
    if (_778)
    {
        _944 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _948 = _944;
    float _950 = 0.0;
    if (_778)
    {
        float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _790, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _950 = _952;
    }
    float _954 = _950;
    if (_778)
    {
        float _956 = _794 + _954;
        _820 = _956;
    }
    float _958 = _820;
    float _960 = _768 + _938;
    float _962 = precise::clamp(_960, 0.0, 1.0);
    float _964 = _768 + _942;
    float _966 = precise::clamp(_964, 0.0, 1.0);
    bool _968 = _962 >= 1.0;
    bool _970 = isnan(_962);
    bool _972 = _968 || _970;
    bool _974 = isnan(1.0);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    bool _980 = _966 >= 1.0;
    bool _982 = isnan(_966);
    bool _984 = _980 || _982;
    bool _986 = isnan(1.0);
    bool _988 = _984 || _986;
    float _990 = float(_988);
    float _992 = trunc(_978);
    int _994 = int(_992);
    float _996 = trunc(_990);
    int _998 = int(_996);
    int _1000 = _698 + _994;
    int _1002 = _726 << 7;
    int _1004 = _1002 + _1000;
    int _1006 = _726 + _998;
    int _1008 = _1006 << 7;
    int _1010 = _1008 + _1000;
    int _1012 = _1004 << 4;
    int _1014 = _1010 << 4;
    int _1016 = _1006 << 7;
    int _1018 = _1016 + _698;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[0].z + 1.953125;
    int _1022 = _1012 + 12;
    uint _1024 = uint(int(uint(_1012) >> uint(2)));
    float _1026 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1024)]);
    int _1028 = _1014 + 12;
    int _1030 = _1018 << 4;
    uint _1032 = uint(int(uint(_1014) >> uint(2)));
    float _1034 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1032)]);
    uint _1036 = uint(int(uint(_1022) >> uint(2)));
    float _1038 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1036)]);
    uint _1040 = uint(int(uint(_1028) >> uint(2)));
    float _1042 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1040)]);
    int _1044 = _1030 + 12;
    int _1046 = _750 + 4;
    uint _1048 = uint(int(uint(_1030) >> uint(2)));
    float _1050 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1048)]);
    uint _1052 = uint(int(uint(_1044) >> uint(2)));
    float _1054 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1052)]);
    uint _1056 = uint(int(uint(_1046) >> uint(2)));
    float _1058 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1056)]);
    float _1060 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _1062 = _710 + 1.953125;
    float _1064 = _1020;
    float _1066 = as_type<float>(_1044);
    float _1068 = as_type<float>(_1046);
    float _1070 = _1062;
    if (_778)
    {
        float _1072 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _948, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _1064 = _1072;
    }
    float _1074 = _1064;
    if (_778)
    {
        _1066 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _1076 = _1066;
    if (_778)
    {
        float _1078 = fma(_710, _948, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _1068 = _1078;
    }
    float _1080 = _1068;
    float _1082 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _1084 = _1080;
    if (_778)
    {
        float _1086 = fma(_1074, _1076, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _1070 = _1086;
    }
    float _1088 = _1070;
    float _1090 = _1088;
    if (_778)
    {
        float _1092 = fma(_1080, _1076, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _1084 = _1092;
    }
    float _1094 = _1084;
    if (_778)
    {
        float _1096 = _1088 + _794;
        _1090 = _1096;
    }
    float _1098 = _1090;
    if (_778)
    {
        float _1100 = _1094 + _794;
        _798 = _1100;
    }
    float _1102 = _798;
    float _1104 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_778)
    {
        float _1106 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _792, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _800 = _1106;
    }
    float _1108 = _800;
    float _1110 = _900;
    float _1112 = _902;
    if (_778)
    {
        float2 _7516 = float2(_1098, _1102);
        float2 _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7516, float2(0.0), isnan(_7516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7516, float2(0.0), isnan(_7516)), level(0.0)).xw;
        float _1116 = _1114.x;
        float _1118 = _1114.y;
        _1110 = _1116;
        _1112 = _1118;
    }
    float _1120 = _1110;
    float _1122 = _1112;
    float _1124 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _1126 = _1104 + _794;
    if (_778)
    {
        float _1128 = _794 + _1108;
        _890 = _1128;
    }
    float _1130 = _890;
    float _1132 = _1124 + _794;
    float2 _7553 = float2(_1126, _1130);
    float _1134 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7553, float2(0.0), isnan(_7553)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7553, float2(0.0), isnan(_7553)), level(0.0)).x;
    float2 _7561 = float2(_958, _1132);
    float _1136 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7561, float2(0.0), isnan(_7561)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7561, float2(0.0), isnan(_7561)), level(0.0)).x;
    float _1138 = floor(_962);
    float _1140 = floor(_966);
    float _1142 = -_1138;
    float _1144 = _962 + _1142;
    float _1146 = _932 * _1144;
    float _1148 = -_1140;
    float _1150 = _966 + _1148;
    float _1152 = _932 * _942;
    float _1154 = _932 * _1150;
    float _1156 = floor(_1146);
    float _1158 = _932 * _938;
    float _1160 = floor(_1152);
    float _1162 = floor(_1154);
    float _1164 = 1.0 / _932;
    float _1166 = floor(_1158);
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _1170 = -_834;
    float _1172 = _806 + _1170;
    float _1174 = -_912;
    float _1176 = _1174 + _920;
    float _1178 = fma(_1172, 5.42372894287109375, -4.338983058929443359375);
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = fma(_932, _1160, _1166);
    float _1184 = trunc(_1182);
    int _1186 = int(_1184);
    float _1188 = -_908;
    float _1190 = _1188 + _916;
    float _1192 = fma(_1180, _1176, _912);
    float _1194 = fma(_1180, _1190, _908);
    int _1196 = as_type<int>(_928) + _1186;
    float _1198 = fma(_1160, _1038, _1156);
    float _1200 = _1038 * _1164;
    float _1202 = fma(_1162, _1042, _1156);
    float _1204 = _1042 * _1164;
    float _1206 = _1200 * _1198;
    float _1208 = _710 * 0.00012500000593718141317367553710938;
    float _1210 = _1204 * _1202;
    float _1212 = fma(_1054, _1162, _1166);
    float _1214 = _1054 * _1164;
    float _1216 = abs(_1168);
    float _1218 = abs(_1208);
    float _1220 = precise::max(_1216, _1218);
    float _1222 = trunc(_1210);
    int _1224 = int(_1222);
    float _1226 = _1214 * _1212;
    float _1228 = fma(_1220, 20.0, -19.0);
    float _1230 = precise::clamp(_1228, 0.0, 1.0);
    float _1232 = trunc(_1226);
    int _1234 = int(_1232);
    float _1236 = -_1230;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_1238, _1192, _710);
    int _1242 = as_type<int>(_1034) + _1224;
    float _1244 = fma(_1238, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1248 = _1240 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1252 = _1244 + _1250;
    float _1254 = _1248 * _1248;
    float _1256 = _1058 * _938;
    int _1258 = as_type<int>(_1050) + _1234;
    float _1260 = _1058 * _942;
    float _1262 = fma(_1252, _1252, _1254);
    float _1264 = floor(_1256);
    bool _1266 = _1262 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1268 = isnan(_1262);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1274 = _1270 || _1272;
    float _1276 = floor(_1260);
    float _1278 = -_910;
    float _1280 = _1278 + _918;
    float _1282 = fma(_1180, _1280, _910);
    float _1284 = fma(_1120, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1286 = _1140;
    float _1288 = _1136;
    float _1290 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_1274)
    {
        _1286 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1292 = _1286;
    if (!_1274)
    {
        float _1294 = -_1262;
        float _1296 = _1294 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _946 = _1296;
    }
    float _1298 = _946;
    float _1300 = fma(_1238, _1282, _1284);
    float _1302 = fma(_1122, 255.99609375, 7.629510946571826934814453125e-06);
    float _1304 = -_1276;
    float _1306 = _1260 + _1304;
    float _1308 = _1264 + _1276;
    float _1310 = _1298;
    float _1312 = _1300;
    if (!_1274)
    {
        float _1314 = -_1298;
        float _1316 = fma(_1314, _1292, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = floor(_1302);
    float _1322 = _1318;
    if (!_1274)
    {
        float _1324 = precise::min(_1300, _1318);
        _1322 = _1324;
    }
    float _1326 = _1322;
    float _1328 = trunc(_1308);
    int _1330 = int(_1328);
    float _1332 = fma(_1134, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1334 = fma(_1136, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (!_1274)
    {
        float _1336 = _1262 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1288 = _1336;
    }
    float _1338 = _1288;
    if (!_1274)
    {
        float _1340 = -_1326;
        float _1342 = _1300 + _1340;
        _1290 = _1342;
    }
    float _1344 = _1290;
    if (!_1274)
    {
        float _1346 = fma(_1338, _1344, _1326);
        _1312 = _1346;
    }
    float _1348 = _1312;
    float _1350 = -_1284;
    float _1352 = _1350 + _1332;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1356 = -_1284;
    float _1358 = _1356 + _1334;
    float _1360 = _1352 * 1.953125;
    int _1362 = _1330 & 1;
    bool _1364 = _1362 != 0;
    float _1366 = -_1320;
    float _1368 = _1302 + _1366;
    float _1370 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1372 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1354);
    float _1374 = _1358 * 1.953125;
    float _1376 = fma(_1360, _1360, 14.55191516876220703125);
    float _1378 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1380 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1370);
    float _1382 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1372);
    float _1384 = fma(_1374, _1374, _1376);
    float _1386 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1378);
    float _1388 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1380);
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1392 = rsqrt(_1384);
    float _1394 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1386);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1400 = -_1264;
    float _1402 = _1256 + _1400;
    bool _1404 = _1368 > 0.499000012874603271484375;
    float _1406 = trunc(_1206);
    int _1408 = int(_1406);
    float _1410 = _1394 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1412 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1416 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1398);
    float _1418 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1420 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1412);
    float _1422 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1414);
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1416);
    float _1426 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1418);
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1420);
    float _1430 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1434 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1426);
    float _1436 = _1374 * _1392;
    float _1438 = _1360 * _1392;
    int _1440 = as_type<int>(_1026) + _1408;
    float _1442 = _1392 * 3.814697265625;
    float _1444 = _1428 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1446 = _1430 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1448 = _1434 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1450 = !_1404;
    int _1452 = _1450 ? as_type<int>(_1432) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    float _2252;
    float _2254;
    float _2256;
    float _2258;
    float _2260;
    float _2262;
    float _2264;
    float _2266;
    float _2268;
    float _2270;
    float _2272;
    float _2274;
    float _2276;
    float _2278;
    float _2280;
    float _2282;
    float _2284;
    float _2286;
    float _2288;
    float _2290;
    float _2292;
    float _2294;
    float _2296;
    float _2298;
    float _2300;
    float _2302;
    float _2304;
    float _2306;
    float _2308;
    float _2310;
    float _2312;
    float _2314;
    if (!_1364)
    {
        float _1454 = fma(_1306, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1456 = fma(_1402, -0.707106769084930419921875, _1454);
        bool _1458 = _1456 >= 0.0;
        bool _1460 = !_1458;
        if (!_1460)
        {
            int _1462 = _1440 * 656;
            int _1464 = _1462 + 262144;
            int _1466 = _1462 + 262192;
            int _1468 = _1462 + 262160;
            uint _1470 = uint(int(uint(_1464) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1470)];
            float _1472 = as_type<float>(_dmw0.x);
            int _1474 = _1464 + 4;
            uint _1476 = uint(int(uint(_1474) >> uint(2)));
            float _1478 = as_type<float>(_dmw0.y);
            int _1480 = _1464 + 8;
            uint _1482 = uint(int(uint(_1480) >> uint(2)));
            float _1484 = as_type<float>(_dmw0.z);
            int _1486 = _1464 + 12;
            uint _1488 = uint(int(uint(_1486) >> uint(2)));
            float _1490 = as_type<float>(_dmw0.w);
            int _1492 = _1462 + 262208;
            int _1494 = _1462 + 262176;
            uint _1496 = uint(int(uint(_1466) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1496)];
            float _1498 = as_type<float>(_dmw3.x);
            int _1500 = _1466 + 4;
            uint _1502 = uint(int(uint(_1500) >> uint(2)));
            float _1504 = as_type<float>(_dmw3.y);
            int _1506 = _1466 + 8;
            uint _1508 = uint(int(uint(_1506) >> uint(2)));
            float _1510 = as_type<float>(_dmw3.z);
            int _1512 = _1466 + 12;
            uint _1514 = uint(int(uint(_1512) >> uint(2)));
            float _1516 = as_type<float>(_dmw3.w);
            int _1518 = _1462 + 262224;
            uint _1520 = uint(int(uint(_1468) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1520)];
            float _1522 = as_type<float>(_dmw1.x);
            int _1524 = _1468 + 4;
            uint _1526 = uint(int(uint(_1524) >> uint(2)));
            float _1528 = as_type<float>(_dmw1.y);
            int _1530 = _1468 + 8;
            uint _1532 = uint(int(uint(_1530) >> uint(2)));
            float _1534 = as_type<float>(_dmw1.z);
            int _1536 = _1468 + 12;
            uint _1538 = uint(int(uint(_1536) >> uint(2)));
            float _1540 = as_type<float>(_dmw1.w);
            int _1542 = _1462 + 262240;
            uint _1544 = uint(int(uint(_1492) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1544)];
            float _1546 = as_type<float>(_dmw4.x);
            int _1548 = _1492 + 4;
            uint _1550 = uint(int(uint(_1548) >> uint(2)));
            float _1552 = as_type<float>(_dmw4.y);
            int _1554 = _1492 + 8;
            uint _1556 = uint(int(uint(_1554) >> uint(2)));
            float _1558 = as_type<float>(_dmw4.z);
            int _1560 = _1492 + 12;
            uint _1562 = uint(int(uint(_1560) >> uint(2)));
            float _1564 = as_type<float>(_dmw4.w);
            int _1566 = _1462 + 262256;
            int _1568 = _1196 * 656;
            uint _1570 = uint(int(uint(_1494) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1570)];
            float _1572 = as_type<float>(_dmw2.x);
            int _1574 = _1494 + 4;
            uint _1576 = uint(int(uint(_1574) >> uint(2)));
            float _1578 = as_type<float>(_dmw2.y);
            int _1580 = _1494 + 8;
            uint _1582 = uint(int(uint(_1580) >> uint(2)));
            float _1584 = as_type<float>(_dmw2.z);
            int _1586 = _1494 + 12;
            uint _1588 = uint(int(uint(_1586) >> uint(2)));
            float _1590 = as_type<float>(_dmw2.w);
            int _1592 = _1258 * 656;
            uint _1594 = uint(int(uint(_1518) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1594)];
            float _1596 = as_type<float>(_dmw5.x);
            int _1598 = _1518 + 4;
            uint _1600 = uint(int(uint(_1598) >> uint(2)));
            float _1602 = as_type<float>(_dmw5.y);
            int _1604 = _1518 + 8;
            uint _1606 = uint(int(uint(_1604) >> uint(2)));
            float _1608 = as_type<float>(_dmw5.z);
            int _1610 = _1518 + 12;
            uint _1612 = uint(int(uint(_1610) >> uint(2)));
            float _1614 = as_type<float>(_dmw5.w);
            int _1616 = _1568 + 262144;
            uint _1618 = uint(int(uint(_1542) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1618)];
            float _1620 = as_type<float>(_dmw6.x);
            int _1622 = _1542 + 4;
            uint _1624 = uint(int(uint(_1622) >> uint(2)));
            float _1626 = as_type<float>(_dmw6.y);
            int _1628 = _1542 + 8;
            uint _1630 = uint(int(uint(_1628) >> uint(2)));
            float _1632 = as_type<float>(_dmw6.z);
            int _1634 = _1542 + 12;
            uint _1636 = uint(int(uint(_1634) >> uint(2)));
            float _1638 = as_type<float>(_dmw6.w);
            int _1640 = _1568 + 262192;
            int _1642 = _1568 + 262160;
            uint _1644 = uint(int(uint(_1566) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1644)];
            float _1646 = as_type<float>(_dmw7.x);
            int _1648 = _1566 + 4;
            uint _1650 = uint(int(uint(_1648) >> uint(2)));
            float _1652 = as_type<float>(_dmw7.y);
            int _1654 = _1566 + 8;
            uint _1656 = uint(int(uint(_1654) >> uint(2)));
            float _1658 = as_type<float>(_dmw7.z);
            int _1660 = _1566 + 12;
            uint _1662 = uint(int(uint(_1660) >> uint(2)));
            float _1664 = as_type<float>(_dmw7.w);
            int _1666 = _1568 + 262208;
            int _1668 = _1568 + 262176;
            uint _1670 = uint(int(uint(_1616) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1670)];
            float _1672 = as_type<float>(_dmw8.x);
            int _1674 = _1616 + 4;
            uint _1676 = uint(int(uint(_1674) >> uint(2)));
            float _1678 = as_type<float>(_dmw8.y);
            int _1680 = _1616 + 8;
            uint _1682 = uint(int(uint(_1680) >> uint(2)));
            float _1684 = as_type<float>(_dmw8.z);
            int _1686 = _1616 + 12;
            uint _1688 = uint(int(uint(_1686) >> uint(2)));
            float _1690 = as_type<float>(_dmw8.w);
            int _1692 = _1568 + 262224;
            int _1694 = _1568 + 262240;
            uint _1696 = uint(int(uint(_1640) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1696)];
            float _1698 = as_type<float>(_dmw11.x);
            int _1700 = _1640 + 4;
            uint _1702 = uint(int(uint(_1700) >> uint(2)));
            float _1704 = as_type<float>(_dmw11.y);
            int _1706 = _1640 + 8;
            uint _1708 = uint(int(uint(_1706) >> uint(2)));
            float _1710 = as_type<float>(_dmw11.z);
            int _1712 = _1640 + 12;
            uint _1714 = uint(int(uint(_1712) >> uint(2)));
            float _1716 = as_type<float>(_dmw11.w);
            int _1718 = _1568 + 262256;
            int _1720 = _1592 + 262144;
            uint _1722 = uint(int(uint(_1642) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1722)];
            float _1724 = as_type<float>(_dmw9.x);
            int _1726 = _1642 + 4;
            uint _1728 = uint(int(uint(_1726) >> uint(2)));
            float _1730 = as_type<float>(_dmw9.y);
            int _1732 = _1642 + 8;
            uint _1734 = uint(int(uint(_1732) >> uint(2)));
            float _1736 = as_type<float>(_dmw9.z);
            int _1738 = _1642 + 12;
            uint _1740 = uint(int(uint(_1738) >> uint(2)));
            float _1742 = as_type<float>(_dmw9.w);
            int _1744 = _1592 + 262192;
            int _1746 = _1592 + 262160;
            uint _1748 = uint(int(uint(_1666) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1748)];
            float _1750 = as_type<float>(_dmw12.x);
            int _1752 = _1666 + 4;
            uint _1754 = uint(int(uint(_1752) >> uint(2)));
            float _1756 = as_type<float>(_dmw12.y);
            int _1758 = _1666 + 8;
            uint _1760 = uint(int(uint(_1758) >> uint(2)));
            float _1762 = as_type<float>(_dmw12.z);
            int _1764 = _1666 + 12;
            uint _1766 = uint(int(uint(_1764) >> uint(2)));
            float _1768 = as_type<float>(_dmw12.w);
            int _1770 = _1592 + 262208;
            int _1772 = _1592 + 262176;
            uint _1774 = uint(int(uint(_1668) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1774)];
            float _1776 = as_type<float>(_dmw10.x);
            int _1778 = _1668 + 4;
            uint _1780 = uint(int(uint(_1778) >> uint(2)));
            float _1782 = as_type<float>(_dmw10.y);
            int _1784 = _1668 + 8;
            uint _1786 = uint(int(uint(_1784) >> uint(2)));
            float _1788 = as_type<float>(_dmw10.z);
            int _1790 = _1668 + 12;
            uint _1792 = uint(int(uint(_1790) >> uint(2)));
            float _1794 = as_type<float>(_dmw10.w);
            int _1796 = _1592 + 262224;
            int _1798 = _1592 + 262240;
            uint _1800 = uint(int(uint(_1692) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1800)];
            float _1802 = as_type<float>(_dmw13.x);
            int _1804 = _1692 + 4;
            uint _1806 = uint(int(uint(_1804) >> uint(2)));
            float _1808 = as_type<float>(_dmw13.y);
            int _1810 = _1692 + 8;
            uint _1812 = uint(int(uint(_1810) >> uint(2)));
            float _1814 = as_type<float>(_dmw13.z);
            int _1816 = _1692 + 12;
            uint _1818 = uint(int(uint(_1816) >> uint(2)));
            float _1820 = as_type<float>(_dmw13.w);
            int _1822 = _1592 + 262256;
            uint _1824 = uint(int(uint(_1694) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1824)];
            float _1826 = as_type<float>(_dmw14.x);
            int _1828 = _1694 + 4;
            uint _1830 = uint(int(uint(_1828) >> uint(2)));
            float _1832 = as_type<float>(_dmw14.y);
            int _1834 = _1694 + 8;
            uint _1836 = uint(int(uint(_1834) >> uint(2)));
            float _1838 = as_type<float>(_dmw14.z);
            int _1840 = _1694 + 12;
            uint _1842 = uint(int(uint(_1840) >> uint(2)));
            float _1844 = as_type<float>(_dmw14.w);
            uint _1846 = uint(int(uint(_1718) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1846)];
            float _1848 = as_type<float>(_dmw15.x);
            int _1850 = _1718 + 4;
            uint _1852 = uint(int(uint(_1850) >> uint(2)));
            float _1854 = as_type<float>(_dmw15.y);
            int _1856 = _1718 + 8;
            uint _1858 = uint(int(uint(_1856) >> uint(2)));
            float _1860 = as_type<float>(_dmw15.z);
            int _1862 = _1718 + 12;
            uint _1864 = uint(int(uint(_1862) >> uint(2)));
            float _1866 = as_type<float>(_dmw15.w);
            uint _1868 = uint(int(uint(_1720) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1868)];
            float _1870 = as_type<float>(_dmw16.x);
            int _1872 = _1720 + 4;
            uint _1874 = uint(int(uint(_1872) >> uint(2)));
            float _1876 = as_type<float>(_dmw16.y);
            int _1878 = _1720 + 8;
            uint _1880 = uint(int(uint(_1878) >> uint(2)));
            float _1882 = as_type<float>(_dmw16.z);
            int _1884 = _1720 + 12;
            uint _1886 = uint(int(uint(_1884) >> uint(2)));
            float _1888 = as_type<float>(_dmw16.w);
            uint _1890 = uint(int(uint(_1744) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1890)];
            float _1892 = as_type<float>(_dmw19.x);
            int _1894 = _1744 + 4;
            uint _1896 = uint(int(uint(_1894) >> uint(2)));
            float _1898 = as_type<float>(_dmw19.y);
            int _1900 = _1744 + 8;
            uint _1902 = uint(int(uint(_1900) >> uint(2)));
            float _1904 = as_type<float>(_dmw19.z);
            int _1906 = _1744 + 12;
            uint _1908 = uint(int(uint(_1906) >> uint(2)));
            float _1910 = as_type<float>(_dmw19.w);
            uint _1912 = uint(int(uint(_1746) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1912)];
            float _1914 = as_type<float>(_dmw17.x);
            int _1916 = _1746 + 4;
            uint _1918 = uint(int(uint(_1916) >> uint(2)));
            float _1920 = as_type<float>(_dmw17.y);
            int _1922 = _1746 + 8;
            uint _1924 = uint(int(uint(_1922) >> uint(2)));
            float _1926 = as_type<float>(_dmw17.z);
            int _1928 = _1746 + 12;
            uint _1930 = uint(int(uint(_1928) >> uint(2)));
            float _1932 = as_type<float>(_dmw17.w);
            uint _1934 = uint(int(uint(_1770) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1934)];
            float _1936 = as_type<float>(_dmw20.x);
            int _1938 = _1770 + 4;
            uint _1940 = uint(int(uint(_1938) >> uint(2)));
            float _1942 = as_type<float>(_dmw20.y);
            int _1944 = _1770 + 8;
            uint _1946 = uint(int(uint(_1944) >> uint(2)));
            float _1948 = as_type<float>(_dmw20.z);
            int _1950 = _1770 + 12;
            uint _1952 = uint(int(uint(_1950) >> uint(2)));
            float _1954 = as_type<float>(_dmw20.w);
            uint _1956 = uint(int(uint(_1772) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1956)];
            float _1958 = as_type<float>(_dmw18.x);
            int _1960 = _1772 + 4;
            uint _1962 = uint(int(uint(_1960) >> uint(2)));
            float _1964 = as_type<float>(_dmw18.y);
            int _1966 = _1772 + 8;
            uint _1968 = uint(int(uint(_1966) >> uint(2)));
            float _1970 = as_type<float>(_dmw18.z);
            int _1972 = _1772 + 12;
            uint _1974 = uint(int(uint(_1972) >> uint(2)));
            float _1976 = as_type<float>(_dmw18.w);
            uint _1978 = uint(int(uint(_1796) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1978)];
            float _1980 = as_type<float>(_dmw21.x);
            int _1982 = _1796 + 4;
            uint _1984 = uint(int(uint(_1982) >> uint(2)));
            float _1986 = as_type<float>(_dmw21.y);
            int _1988 = _1796 + 8;
            uint _1990 = uint(int(uint(_1988) >> uint(2)));
            float _1992 = as_type<float>(_dmw21.z);
            int _1994 = _1796 + 12;
            uint _1996 = uint(int(uint(_1994) >> uint(2)));
            float _1998 = as_type<float>(_dmw21.w);
            uint _2000 = uint(int(uint(_1798) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2000)];
            float _2002 = as_type<float>(_dmw22.x);
            int _2004 = _1798 + 4;
            uint _2006 = uint(int(uint(_2004) >> uint(2)));
            float _2008 = as_type<float>(_dmw22.y);
            int _2010 = _1798 + 8;
            uint _2012 = uint(int(uint(_2010) >> uint(2)));
            float _2014 = as_type<float>(_dmw22.z);
            int _2016 = _1798 + 12;
            uint _2018 = uint(int(uint(_2016) >> uint(2)));
            float _2020 = as_type<float>(_dmw22.w);
            uint _2022 = uint(int(uint(_1822) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2022)];
            float _2024 = as_type<float>(_dmw23.x);
            int _2026 = _1822 + 4;
            uint _2028 = uint(int(uint(_2026) >> uint(2)));
            float _2030 = as_type<float>(_dmw23.y);
            int _2032 = _1822 + 8;
            uint _2034 = uint(int(uint(_2032) >> uint(2)));
            float _2036 = as_type<float>(_dmw23.z);
            int _2038 = _1822 + 12;
            uint _2040 = uint(int(uint(_2038) >> uint(2)));
            float _2042 = as_type<float>(_dmw23.w);
            float _2044 = _1306 + (-1.0);
            float _2046 = -_1402;
            float _2048 = -_2044;
            float _2050 = _2046 + _2048;
            float _2052 = -_2050;
            float _2054 = _2052 + 1.0;
            float _2056 = -_1402;
            float _2058 = _2056 + _2054;
            float _2060 = _1402 * _1472;
            float _2062 = _1402 * _1478;
            float _2064 = _1402 * _1484;
            float _2066 = _1402 * _1490;
            float _2068 = _1402 * _1498;
            float _2070 = _1402 * _1504;
            float _2072 = _1402 * _1510;
            float _2074 = _1402 * _1516;
            float _2076 = _1402 * _1522;
            float _2078 = _1402 * _1528;
            float _2080 = _1402 * _1534;
            float _2082 = _1402 * _1540;
            float _2084 = _1402 * _1546;
            float _2086 = _1402 * _1552;
            float _2088 = _1402 * _1558;
            float _2090 = _1402 * _1564;
            float _2092 = _1402 * _1572;
            float _2094 = _1402 * _1578;
            float _2096 = _1402 * _1584;
            float _2098 = _1402 * _1590;
            float _2100 = _1402 * _1596;
            float _2102 = _1402 * _1602;
            float _2104 = _1402 * _1608;
            float _2106 = _1402 * _1614;
            float _2108 = _1402 * _1620;
            float _2110 = _1402 * _1626;
            float _2112 = _1402 * _1632;
            float _2114 = _1402 * _1638;
            float _2116 = _1402 * _1646;
            float _2118 = _1402 * _1652;
            float _2120 = _1402 * _1658;
            float _2122 = _1402 * _1664;
            float _2124 = fma(_2050, _1672, _2060);
            float _2126 = fma(_2050, _1678, _2062);
            float _2128 = fma(_2050, _1684, _2064);
            float _2130 = fma(_2050, _1690, _2066);
            float _2132 = fma(_2050, _1698, _2068);
            float _2134 = fma(_2050, _1704, _2070);
            float _2136 = fma(_2050, _1710, _2072);
            float _2138 = fma(_2050, _1716, _2074);
            float _2140 = fma(_2050, _1724, _2076);
            float _2142 = fma(_2050, _1730, _2078);
            float _2144 = fma(_2050, _1736, _2080);
            float _2146 = fma(_2050, _1742, _2082);
            float _2148 = fma(_2050, _1750, _2084);
            float _2150 = fma(_2050, _1756, _2086);
            float _2152 = fma(_2050, _1762, _2088);
            float _2154 = fma(_2050, _1768, _2090);
            float _2156 = fma(_2050, _1776, _2092);
            float _2158 = fma(_2050, _1782, _2094);
            float _2160 = fma(_2050, _1788, _2096);
            float _2162 = fma(_2050, _1794, _2098);
            float _2164 = fma(_2050, _1802, _2100);
            float _2166 = fma(_2050, _1808, _2102);
            float _2168 = fma(_2050, _1814, _2104);
            float _2170 = fma(_2050, _1820, _2106);
            float _2172 = fma(_2050, _1826, _2108);
            float _2174 = fma(_2050, _1832, _2110);
            float _2176 = fma(_2050, _1838, _2112);
            float _2178 = fma(_2050, _1844, _2114);
            float _2180 = fma(_2050, _1848, _2116);
            float _2182 = fma(_2050, _1854, _2118);
            float _2184 = fma(_2050, _1860, _2120);
            float _2186 = fma(_2050, _1866, _2122);
            float _2188 = fma(_2058, _1870, _2124);
            float _2190 = fma(_2058, _1876, _2126);
            float _2192 = fma(_2058, _1882, _2128);
            float _2194 = fma(_2058, _1888, _2130);
            float _2196 = fma(_2058, _1892, _2132);
            float _2198 = fma(_2058, _1898, _2134);
            float _2200 = fma(_2058, _1904, _2136);
            float _2202 = fma(_2058, _1910, _2138);
            float _2204 = fma(_2058, _1914, _2140);
            float _2206 = fma(_2058, _1920, _2142);
            float _2208 = fma(_2058, _1926, _2144);
            float _2210 = fma(_2058, _1932, _2146);
            float _2212 = fma(_2058, _1936, _2148);
            float _2214 = fma(_2058, _1942, _2150);
            float _2216 = fma(_2058, _1948, _2152);
            float _2218 = fma(_2058, _1954, _2154);
            float _2220 = fma(_2058, _1958, _2156);
            float _2222 = fma(_2058, _1964, _2158);
            float _2224 = fma(_2058, _1970, _2160);
            float _2226 = fma(_2058, _1976, _2162);
            float _2228 = fma(_2058, _1980, _2164);
            float _2230 = fma(_2058, _1986, _2166);
            float _2232 = fma(_2058, _1992, _2168);
            float _2234 = fma(_2058, _1998, _2170);
            float _2236 = fma(_2058, _2002, _2172);
            float _2238 = fma(_2058, _2008, _2174);
            float _2240 = fma(_2058, _2014, _2176);
            float _2242 = fma(_2058, _2020, _2178);
            float _2244 = fma(_2058, _2024, _2180);
            float _2246 = fma(_2058, _2030, _2182);
            float _2248 = fma(_2058, _2036, _2184);
            float _2250 = fma(_2058, _2042, _2186);
            _2252 = _2198;
            _2254 = _2202;
            _2256 = _2212;
            _2258 = _2196;
            _2260 = _2230;
            _2262 = _2232;
            _2264 = _2214;
            _2266 = _2218;
            _2268 = _2234;
            _2270 = _2228;
            _2272 = _2216;
            _2274 = _2200;
            _2276 = _2246;
            _2278 = _2244;
            _2280 = _2194;
            _2282 = _2204;
            _2284 = _2206;
            _2286 = _2238;
            _2288 = _2188;
            _2290 = _2190;
            _2292 = _2192;
            _2294 = _2236;
            _2296 = _2248;
            _2298 = _2208;
            _2300 = _2210;
            _2302 = _2220;
            _2304 = _2240;
            _2306 = _2250;
            _2308 = _2222;
            _2310 = _2224;
            _2312 = _2226;
            _2314 = _2242;
            _2316 = true;
        }
        else
        {
            int _2318 = _1258 * 656;
            int _2320 = _2318 + 262144;
            int _2322 = _2318 + 262192;
            int _2324 = _2318 + 262160;
            uint _2326 = uint(int(uint(_2320) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2326)];
            float _2328 = as_type<float>(_dmw24.x);
            int _2330 = _2320 + 4;
            uint _2332 = uint(int(uint(_2330) >> uint(2)));
            float _2334 = as_type<float>(_dmw24.y);
            int _2336 = _2320 + 8;
            uint _2338 = uint(int(uint(_2336) >> uint(2)));
            float _2340 = as_type<float>(_dmw24.z);
            int _2342 = _2320 + 12;
            uint _2344 = uint(int(uint(_2342) >> uint(2)));
            float _2346 = as_type<float>(_dmw24.w);
            int _2348 = _2318 + 262208;
            int _2350 = _2318 + 262176;
            uint _2352 = uint(int(uint(_2322) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2352)];
            float _2354 = as_type<float>(_dmw27.x);
            int _2356 = _2322 + 4;
            uint _2358 = uint(int(uint(_2356) >> uint(2)));
            float _2360 = as_type<float>(_dmw27.y);
            int _2362 = _2322 + 8;
            uint _2364 = uint(int(uint(_2362) >> uint(2)));
            float _2366 = as_type<float>(_dmw27.z);
            int _2368 = _2322 + 12;
            uint _2370 = uint(int(uint(_2368) >> uint(2)));
            float _2372 = as_type<float>(_dmw27.w);
            int _2374 = _2318 + 262224;
            uint _2376 = uint(int(uint(_2324) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2376)];
            float _2378 = as_type<float>(_dmw25.x);
            int _2380 = _2324 + 4;
            uint _2382 = uint(int(uint(_2380) >> uint(2)));
            float _2384 = as_type<float>(_dmw25.y);
            int _2386 = _2324 + 8;
            uint _2388 = uint(int(uint(_2386) >> uint(2)));
            float _2390 = as_type<float>(_dmw25.z);
            int _2392 = _2324 + 12;
            uint _2394 = uint(int(uint(_2392) >> uint(2)));
            float _2396 = as_type<float>(_dmw25.w);
            int _2398 = _2318 + 262240;
            uint _2400 = uint(int(uint(_2348) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2400)];
            float _2402 = as_type<float>(_dmw28.x);
            int _2404 = _2348 + 4;
            uint _2406 = uint(int(uint(_2404) >> uint(2)));
            float _2408 = as_type<float>(_dmw28.y);
            int _2410 = _2348 + 8;
            uint _2412 = uint(int(uint(_2410) >> uint(2)));
            float _2414 = as_type<float>(_dmw28.z);
            int _2416 = _2348 + 12;
            uint _2418 = uint(int(uint(_2416) >> uint(2)));
            float _2420 = as_type<float>(_dmw28.w);
            int _2422 = _2318 + 262256;
            int _2424 = _1440 * 656;
            uint _2426 = uint(int(uint(_2350) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2426)];
            float _2428 = as_type<float>(_dmw26.x);
            int _2430 = _2350 + 4;
            uint _2432 = uint(int(uint(_2430) >> uint(2)));
            float _2434 = as_type<float>(_dmw26.y);
            int _2436 = _2350 + 8;
            uint _2438 = uint(int(uint(_2436) >> uint(2)));
            float _2440 = as_type<float>(_dmw26.z);
            int _2442 = _2350 + 12;
            uint _2444 = uint(int(uint(_2442) >> uint(2)));
            float _2446 = as_type<float>(_dmw26.w);
            uint _2448 = uint(int(uint(_2374) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2448)];
            float _2450 = as_type<float>(_dmw29.x);
            int _2452 = _2374 + 4;
            uint _2454 = uint(int(uint(_2452) >> uint(2)));
            float _2456 = as_type<float>(_dmw29.y);
            int _2458 = _2374 + 8;
            uint _2460 = uint(int(uint(_2458) >> uint(2)));
            float _2462 = as_type<float>(_dmw29.z);
            int _2464 = _2374 + 12;
            uint _2466 = uint(int(uint(_2464) >> uint(2)));
            float _2468 = as_type<float>(_dmw29.w);
            int _2470 = _1242 * 656;
            uint _2472 = uint(int(uint(_2398) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2472)];
            float _2474 = as_type<float>(_dmw30.x);
            int _2476 = _2398 + 4;
            uint _2478 = uint(int(uint(_2476) >> uint(2)));
            float _2480 = as_type<float>(_dmw30.y);
            int _2482 = _2398 + 8;
            uint _2484 = uint(int(uint(_2482) >> uint(2)));
            float _2486 = as_type<float>(_dmw30.z);
            int _2488 = _2398 + 12;
            uint _2490 = uint(int(uint(_2488) >> uint(2)));
            float _2492 = as_type<float>(_dmw30.w);
            int _2494 = _2424 + 262144;
            int _2496 = _2424 + 262192;
            uint _2498 = uint(int(uint(_2422) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2498)];
            float _2500 = as_type<float>(_dmw31.x);
            int _2502 = _2422 + 4;
            uint _2504 = uint(int(uint(_2502) >> uint(2)));
            float _2506 = as_type<float>(_dmw31.y);
            int _2508 = _2422 + 8;
            uint _2510 = uint(int(uint(_2508) >> uint(2)));
            float _2512 = as_type<float>(_dmw31.z);
            int _2514 = _2422 + 12;
            uint _2516 = uint(int(uint(_2514) >> uint(2)));
            float _2518 = as_type<float>(_dmw31.w);
            int _2520 = _2424 + 262160;
            int _2522 = _2424 + 262208;
            uint _2524 = uint(int(uint(_2494) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2524)];
            float _2526 = as_type<float>(_dmw32.x);
            int _2528 = _2494 + 4;
            uint _2530 = uint(int(uint(_2528) >> uint(2)));
            float _2532 = as_type<float>(_dmw32.y);
            int _2534 = _2494 + 8;
            uint _2536 = uint(int(uint(_2534) >> uint(2)));
            float _2538 = as_type<float>(_dmw32.z);
            int _2540 = _2494 + 12;
            uint _2542 = uint(int(uint(_2540) >> uint(2)));
            float _2544 = as_type<float>(_dmw32.w);
            int _2546 = _2424 + 262176;
            int _2548 = _2424 + 262224;
            uint _2550 = uint(int(uint(_2496) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2550)];
            float _2552 = as_type<float>(_dmw35.x);
            int _2554 = _2496 + 4;
            uint _2556 = uint(int(uint(_2554) >> uint(2)));
            float _2558 = as_type<float>(_dmw35.y);
            int _2560 = _2496 + 8;
            uint _2562 = uint(int(uint(_2560) >> uint(2)));
            float _2564 = as_type<float>(_dmw35.z);
            int _2566 = _2496 + 12;
            uint _2568 = uint(int(uint(_2566) >> uint(2)));
            float _2570 = as_type<float>(_dmw35.w);
            int _2572 = _2424 + 262240;
            int _2574 = _2424 + 262256;
            uint _2576 = uint(int(uint(_2520) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2576)];
            float _2578 = as_type<float>(_dmw33.x);
            int _2580 = _2520 + 4;
            uint _2582 = uint(int(uint(_2580) >> uint(2)));
            float _2584 = as_type<float>(_dmw33.y);
            int _2586 = _2520 + 8;
            uint _2588 = uint(int(uint(_2586) >> uint(2)));
            float _2590 = as_type<float>(_dmw33.z);
            int _2592 = _2520 + 12;
            uint _2594 = uint(int(uint(_2592) >> uint(2)));
            float _2596 = as_type<float>(_dmw33.w);
            int _2598 = _2470 + 262144;
            int _2600 = _2470 + 262192;
            uint _2602 = uint(int(uint(_2522) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2602)];
            float _2604 = as_type<float>(_dmw36.x);
            int _2606 = _2522 + 4;
            uint _2608 = uint(int(uint(_2606) >> uint(2)));
            float _2610 = as_type<float>(_dmw36.y);
            int _2612 = _2522 + 8;
            uint _2614 = uint(int(uint(_2612) >> uint(2)));
            float _2616 = as_type<float>(_dmw36.z);
            int _2618 = _2522 + 12;
            uint _2620 = uint(int(uint(_2618) >> uint(2)));
            float _2622 = as_type<float>(_dmw36.w);
            int _2624 = _2470 + 262160;
            int _2626 = _2470 + 262208;
            uint _2628 = uint(int(uint(_2546) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2628)];
            float _2630 = as_type<float>(_dmw34.x);
            int _2632 = _2546 + 4;
            uint _2634 = uint(int(uint(_2632) >> uint(2)));
            float _2636 = as_type<float>(_dmw34.y);
            int _2638 = _2546 + 8;
            uint _2640 = uint(int(uint(_2638) >> uint(2)));
            float _2642 = as_type<float>(_dmw34.z);
            int _2644 = _2546 + 12;
            uint _2646 = uint(int(uint(_2644) >> uint(2)));
            float _2648 = as_type<float>(_dmw34.w);
            int _2650 = _2470 + 262176;
            int _2652 = _2470 + 262224;
            uint _2654 = uint(int(uint(_2548) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2654)];
            float _2656 = as_type<float>(_dmw37.x);
            int _2658 = _2548 + 4;
            uint _2660 = uint(int(uint(_2658) >> uint(2)));
            float _2662 = as_type<float>(_dmw37.y);
            int _2664 = _2548 + 8;
            uint _2666 = uint(int(uint(_2664) >> uint(2)));
            float _2668 = as_type<float>(_dmw37.z);
            int _2670 = _2548 + 12;
            uint _2672 = uint(int(uint(_2670) >> uint(2)));
            float _2674 = as_type<float>(_dmw37.w);
            int _2676 = _2470 + 262240;
            int _2678 = _2470 + 262256;
            uint _2680 = uint(int(uint(_2572) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2680)];
            float _2682 = as_type<float>(_dmw38.x);
            int _2684 = _2572 + 4;
            uint _2686 = uint(int(uint(_2684) >> uint(2)));
            float _2688 = as_type<float>(_dmw38.y);
            int _2690 = _2572 + 8;
            uint _2692 = uint(int(uint(_2690) >> uint(2)));
            float _2694 = as_type<float>(_dmw38.z);
            int _2696 = _2572 + 12;
            uint _2698 = uint(int(uint(_2696) >> uint(2)));
            float _2700 = as_type<float>(_dmw38.w);
            uint _2702 = uint(int(uint(_2574) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2702)];
            float _2704 = as_type<float>(_dmw39.x);
            int _2706 = _2574 + 4;
            uint _2708 = uint(int(uint(_2706) >> uint(2)));
            float _2710 = as_type<float>(_dmw39.y);
            int _2712 = _2574 + 8;
            uint _2714 = uint(int(uint(_2712) >> uint(2)));
            float _2716 = as_type<float>(_dmw39.z);
            int _2718 = _2574 + 12;
            uint _2720 = uint(int(uint(_2718) >> uint(2)));
            float _2722 = as_type<float>(_dmw39.w);
            uint _2724 = uint(int(uint(_2598) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2724)];
            float _2726 = as_type<float>(_dmw40.x);
            int _2728 = _2598 + 4;
            uint _2730 = uint(int(uint(_2728) >> uint(2)));
            float _2732 = as_type<float>(_dmw40.y);
            int _2734 = _2598 + 8;
            uint _2736 = uint(int(uint(_2734) >> uint(2)));
            float _2738 = as_type<float>(_dmw40.z);
            int _2740 = _2598 + 12;
            uint _2742 = uint(int(uint(_2740) >> uint(2)));
            float _2744 = as_type<float>(_dmw40.w);
            uint _2746 = uint(int(uint(_2600) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2746)];
            float _2748 = as_type<float>(_dmw43.x);
            int _2750 = _2600 + 4;
            uint _2752 = uint(int(uint(_2750) >> uint(2)));
            float _2754 = as_type<float>(_dmw43.y);
            int _2756 = _2600 + 8;
            uint _2758 = uint(int(uint(_2756) >> uint(2)));
            float _2760 = as_type<float>(_dmw43.z);
            int _2762 = _2600 + 12;
            uint _2764 = uint(int(uint(_2762) >> uint(2)));
            float _2766 = as_type<float>(_dmw43.w);
            uint _2768 = uint(int(uint(_2624) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2768)];
            float _2770 = as_type<float>(_dmw41.x);
            int _2772 = _2624 + 4;
            uint _2774 = uint(int(uint(_2772) >> uint(2)));
            float _2776 = as_type<float>(_dmw41.y);
            int _2778 = _2624 + 8;
            uint _2780 = uint(int(uint(_2778) >> uint(2)));
            float _2782 = as_type<float>(_dmw41.z);
            int _2784 = _2624 + 12;
            uint _2786 = uint(int(uint(_2784) >> uint(2)));
            float _2788 = as_type<float>(_dmw41.w);
            uint _2790 = uint(int(uint(_2626) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2790)];
            float _2792 = as_type<float>(_dmw44.x);
            int _2794 = _2626 + 4;
            uint _2796 = uint(int(uint(_2794) >> uint(2)));
            float _2798 = as_type<float>(_dmw44.y);
            int _2800 = _2626 + 8;
            uint _2802 = uint(int(uint(_2800) >> uint(2)));
            float _2804 = as_type<float>(_dmw44.z);
            int _2806 = _2626 + 12;
            uint _2808 = uint(int(uint(_2806) >> uint(2)));
            float _2810 = as_type<float>(_dmw44.w);
            uint _2812 = uint(int(uint(_2650) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2812)];
            float _2814 = as_type<float>(_dmw42.x);
            int _2816 = _2650 + 4;
            uint _2818 = uint(int(uint(_2816) >> uint(2)));
            float _2820 = as_type<float>(_dmw42.y);
            int _2822 = _2650 + 8;
            uint _2824 = uint(int(uint(_2822) >> uint(2)));
            float _2826 = as_type<float>(_dmw42.z);
            int _2828 = _2650 + 12;
            uint _2830 = uint(int(uint(_2828) >> uint(2)));
            float _2832 = as_type<float>(_dmw42.w);
            uint _2834 = uint(int(uint(_2652) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2834)];
            float _2836 = as_type<float>(_dmw45.x);
            int _2838 = _2652 + 4;
            uint _2840 = uint(int(uint(_2838) >> uint(2)));
            float _2842 = as_type<float>(_dmw45.y);
            int _2844 = _2652 + 8;
            uint _2846 = uint(int(uint(_2844) >> uint(2)));
            float _2848 = as_type<float>(_dmw45.z);
            int _2850 = _2652 + 12;
            uint _2852 = uint(int(uint(_2850) >> uint(2)));
            float _2854 = as_type<float>(_dmw45.w);
            uint _2856 = uint(int(uint(_2676) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2856)];
            float _2858 = as_type<float>(_dmw46.x);
            int _2860 = _2676 + 4;
            uint _2862 = uint(int(uint(_2860) >> uint(2)));
            float _2864 = as_type<float>(_dmw46.y);
            int _2866 = _2676 + 8;
            uint _2868 = uint(int(uint(_2866) >> uint(2)));
            float _2870 = as_type<float>(_dmw46.z);
            int _2872 = _2676 + 12;
            uint _2874 = uint(int(uint(_2872) >> uint(2)));
            float _2876 = as_type<float>(_dmw46.w);
            uint _2878 = uint(int(uint(_2678) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2878)];
            float _2880 = as_type<float>(_dmw47.x);
            int _2882 = _2678 + 4;
            uint _2884 = uint(int(uint(_2882) >> uint(2)));
            float _2886 = as_type<float>(_dmw47.y);
            int _2888 = _2678 + 8;
            uint _2890 = uint(int(uint(_2888) >> uint(2)));
            float _2892 = as_type<float>(_dmw47.z);
            int _2894 = _2678 + 12;
            uint _2896 = uint(int(uint(_2894) >> uint(2)));
            float _2898 = as_type<float>(_dmw47.w);
            float _2900 = _1402 + (-1.0);
            float _2902 = -_2900;
            float _2904 = _2328 * _2902;
            float _2906 = -_2900;
            float _2908 = _2346 * _2906;
            float _2910 = -_2900;
            float _2912 = _2334 * _2910;
            float _2914 = -_2900;
            float _2916 = _2340 * _2914;
            float _2918 = -_2900;
            float _2920 = _2354 * _2918;
            float _2922 = -_2900;
            float _2924 = _2372 * _2922;
            float _2926 = -_2900;
            float _2928 = _2360 * _2926;
            float _2930 = -_2900;
            float _2932 = _2366 * _2930;
            float _2934 = -_2900;
            float _2936 = _2378 * _2934;
            float _2938 = -_2900;
            float _2940 = _2396 * _2938;
            float _2942 = -_2900;
            float _2944 = _2384 * _2942;
            float _2946 = -_2900;
            float _2948 = _2390 * _2946;
            float _2950 = -_2900;
            float _2952 = _2402 * _2950;
            float _2954 = -_2900;
            float _2956 = _2420 * _2954;
            float _2958 = -_2900;
            float _2960 = _2408 * _2958;
            float _2962 = -_2900;
            float _2964 = _2414 * _2962;
            float _2966 = -_2900;
            float _2968 = _2428 * _2966;
            float _2970 = -_2900;
            float _2972 = _2446 * _2970;
            float _2974 = -_2900;
            float _2976 = _2434 * _2974;
            float _2978 = -_2900;
            float _2980 = _2440 * _2978;
            float _2982 = -_2900;
            float _2984 = _2450 * _2982;
            float _2986 = -_2900;
            float _2988 = _2468 * _2986;
            float _2990 = -_2900;
            float _2992 = _2456 * _2990;
            float _2994 = -_2900;
            float _2996 = _2462 * _2994;
            float _2998 = -_2900;
            float _3000 = _2474 * _2998;
            float _3002 = -_2900;
            float _3004 = _2492 * _3002;
            float _3006 = -_2900;
            float _3008 = _2480 * _3006;
            float _3010 = -_2900;
            float _3012 = _2486 * _3010;
            float _3014 = -_2900;
            float _3016 = _2500 * _3014;
            float _3018 = -_2900;
            float _3020 = _2506 * _3018;
            float _3022 = -_2900;
            float _3024 = _2512 * _3022;
            float _3026 = _1306 + (-1.0);
            float _3028 = -_2900;
            float _3030 = _2518 * _3028;
            float _3032 = _1306 + _2900;
            float _3034 = -_3026;
            float _3036 = fma(_3034, _2526, _2904);
            float _3038 = -_3026;
            float _3040 = fma(_3038, _2532, _2912);
            float _3042 = -_3026;
            float _3044 = fma(_3042, _2538, _2916);
            float _3046 = -_3026;
            float _3048 = fma(_3046, _2544, _2908);
            float _3050 = -_3026;
            float _3052 = fma(_3050, _2552, _2920);
            float _3054 = -_3026;
            float _3056 = fma(_3054, _2558, _2928);
            float _3058 = -_3026;
            float _3060 = fma(_3058, _2564, _2932);
            float _3062 = -_3026;
            float _3064 = fma(_3062, _2570, _2924);
            float _3066 = -_3026;
            float _3068 = fma(_3066, _2578, _2936);
            float _3070 = -_3026;
            float _3072 = fma(_3070, _2584, _2944);
            float _3074 = -_3026;
            float _3076 = fma(_3074, _2590, _2948);
            float _3078 = -_3026;
            float _3080 = fma(_3078, _2596, _2940);
            float _3082 = -_3026;
            float _3084 = fma(_3082, _2604, _2952);
            float _3086 = -_3026;
            float _3088 = fma(_3086, _2610, _2960);
            float _3090 = -_3026;
            float _3092 = fma(_3090, _2616, _2964);
            float _3094 = -_3026;
            float _3096 = fma(_3094, _2622, _2956);
            float _3098 = -_3026;
            float _3100 = fma(_3098, _2630, _2968);
            float _3102 = -_3026;
            float _3104 = fma(_3102, _2636, _2976);
            float _3106 = -_3026;
            float _3108 = fma(_3106, _2642, _2980);
            float _3110 = -_3026;
            float _3112 = fma(_3110, _2648, _2972);
            float _3114 = -_3026;
            float _3116 = fma(_3114, _2656, _2984);
            float _3118 = -_3026;
            float _3120 = fma(_3118, _2662, _2992);
            float _3122 = -_3026;
            float _3124 = fma(_3122, _2668, _2996);
            float _3126 = -_3026;
            float _3128 = fma(_3126, _2674, _2988);
            float _3130 = -_3026;
            float _3132 = fma(_3130, _2682, _3000);
            float _3134 = -_3026;
            float _3136 = fma(_3134, _2688, _3008);
            float _3138 = -_3026;
            float _3140 = fma(_3138, _2694, _3012);
            float _3142 = -_3026;
            float _3144 = fma(_3142, _2700, _3004);
            float _3146 = -_3026;
            float _3148 = fma(_3146, _2704, _3016);
            float _3150 = -_3026;
            float _3152 = fma(_3150, _2710, _3020);
            float _3154 = -_3026;
            float _3156 = fma(_3154, _2716, _3024);
            float _3158 = -_3026;
            float _3160 = fma(_3158, _2722, _3030);
            float _3162 = fma(_3032, _2726, _3036);
            float _3164 = fma(_3032, _2732, _3040);
            float _3166 = fma(_3032, _2738, _3044);
            float _3168 = fma(_3032, _2744, _3048);
            float _3170 = fma(_3032, _2748, _3052);
            float _3172 = fma(_3032, _2754, _3056);
            float _3174 = fma(_3032, _2760, _3060);
            float _3176 = fma(_3032, _2766, _3064);
            float _3178 = fma(_3032, _2770, _3068);
            float _3180 = fma(_3032, _2776, _3072);
            float _3182 = fma(_3032, _2782, _3076);
            float _3184 = fma(_3032, _2788, _3080);
            float _3186 = fma(_3032, _2792, _3084);
            float _3188 = fma(_3032, _2798, _3088);
            float _3190 = fma(_3032, _2804, _3092);
            float _3192 = fma(_3032, _2810, _3096);
            float _3194 = fma(_3032, _2814, _3100);
            float _3196 = fma(_3032, _2820, _3104);
            float _3198 = fma(_3032, _2826, _3108);
            float _3200 = fma(_3032, _2832, _3112);
            float _3202 = fma(_3032, _2836, _3116);
            float _3204 = fma(_3032, _2842, _3120);
            float _3206 = fma(_3032, _2848, _3124);
            float _3208 = fma(_3032, _2854, _3128);
            float _3210 = fma(_3032, _2858, _3132);
            float _3212 = fma(_3032, _2864, _3136);
            float _3214 = fma(_3032, _2870, _3140);
            float _3216 = fma(_3032, _2876, _3144);
            float _3218 = fma(_3032, _2880, _3148);
            float _3220 = fma(_3032, _2886, _3152);
            float _3222 = fma(_3032, _2892, _3156);
            float _3224 = fma(_3032, _2898, _3160);
            _2252 = _3172;
            _2254 = _3176;
            _2256 = _3186;
            _2258 = _3170;
            _2260 = _3204;
            _2262 = _3206;
            _2264 = _3188;
            _2266 = _3192;
            _2268 = _3208;
            _2270 = _3202;
            _2272 = _3190;
            _2274 = _3174;
            _2276 = _3220;
            _2278 = _3218;
            _2280 = _3168;
            _2282 = _3178;
            _2284 = _3180;
            _2286 = _3212;
            _2288 = _3162;
            _2290 = _3164;
            _2292 = _3166;
            _2294 = _3210;
            _2296 = _3222;
            _2298 = _3182;
            _2300 = _3184;
            _2302 = _3194;
            _2304 = _3214;
            _2306 = _3224;
            _2308 = _3196;
            _2310 = _3198;
            _2312 = _3200;
            _2314 = _3216;
            _2316 = true;
        }
    }
    else
    {
        float _3226 = _1306 * (-0.707106769084930419921875);
        float _3228 = _1402 + (-1.0);
        float _3230 = fma(_1402, 0.707106769084930419921875, _3226);
        bool _3232 = _3230 >= 0.0;
        float _3234 = _1306 + (-1.0);
        bool _3236 = !_3232;
        if (!_3236)
        {
            int _3238 = _1440 * 656;
            int _3240 = _3238 + 262144;
            int _3242 = _3238 + 262192;
            int _3244 = _3238 + 262160;
            uint _3246 = uint(int(uint(_3240) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3246)];
            float _3248 = as_type<float>(_dmw48.x);
            int _3250 = _3240 + 4;
            uint _3252 = uint(int(uint(_3250) >> uint(2)));
            float _3254 = as_type<float>(_dmw48.y);
            int _3256 = _3240 + 8;
            uint _3258 = uint(int(uint(_3256) >> uint(2)));
            float _3260 = as_type<float>(_dmw48.z);
            int _3262 = _3240 + 12;
            uint _3264 = uint(int(uint(_3262) >> uint(2)));
            float _3266 = as_type<float>(_dmw48.w);
            int _3268 = _3238 + 262208;
            int _3270 = _3238 + 262176;
            uint _3272 = uint(int(uint(_3242) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3272)];
            float _3274 = as_type<float>(_dmw51.x);
            int _3276 = _3242 + 4;
            uint _3278 = uint(int(uint(_3276) >> uint(2)));
            float _3280 = as_type<float>(_dmw51.y);
            int _3282 = _3242 + 8;
            uint _3284 = uint(int(uint(_3282) >> uint(2)));
            float _3286 = as_type<float>(_dmw51.z);
            int _3288 = _3242 + 12;
            uint _3290 = uint(int(uint(_3288) >> uint(2)));
            float _3292 = as_type<float>(_dmw51.w);
            int _3294 = _3238 + 262224;
            uint _3296 = uint(int(uint(_3244) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3296)];
            float _3298 = as_type<float>(_dmw49.x);
            int _3300 = _3244 + 4;
            uint _3302 = uint(int(uint(_3300) >> uint(2)));
            float _3304 = as_type<float>(_dmw49.y);
            int _3306 = _3244 + 8;
            uint _3308 = uint(int(uint(_3306) >> uint(2)));
            float _3310 = as_type<float>(_dmw49.z);
            int _3312 = _3244 + 12;
            uint _3314 = uint(int(uint(_3312) >> uint(2)));
            float _3316 = as_type<float>(_dmw49.w);
            int _3318 = _3238 + 262240;
            int _3320 = _1196 * 656;
            uint _3322 = uint(int(uint(_3268) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3322)];
            float _3324 = as_type<float>(_dmw52.x);
            int _3326 = _3268 + 4;
            uint _3328 = uint(int(uint(_3326) >> uint(2)));
            float _3330 = as_type<float>(_dmw52.y);
            int _3332 = _3268 + 8;
            uint _3334 = uint(int(uint(_3332) >> uint(2)));
            float _3336 = as_type<float>(_dmw52.z);
            int _3338 = _3268 + 12;
            uint _3340 = uint(int(uint(_3338) >> uint(2)));
            float _3342 = as_type<float>(_dmw52.w);
            int _3344 = _3238 + 262256;
            uint _3346 = uint(int(uint(_3270) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3346)];
            float _3348 = as_type<float>(_dmw50.x);
            int _3350 = _3270 + 4;
            uint _3352 = uint(int(uint(_3350) >> uint(2)));
            float _3354 = as_type<float>(_dmw50.y);
            int _3356 = _3270 + 8;
            uint _3358 = uint(int(uint(_3356) >> uint(2)));
            float _3360 = as_type<float>(_dmw50.z);
            int _3362 = _3270 + 12;
            uint _3364 = uint(int(uint(_3362) >> uint(2)));
            float _3366 = as_type<float>(_dmw50.w);
            int _3368 = _1242 * 656;
            uint _3370 = uint(int(uint(_3294) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3370)];
            float _3372 = as_type<float>(_dmw53.x);
            int _3374 = _3294 + 4;
            uint _3376 = uint(int(uint(_3374) >> uint(2)));
            float _3378 = as_type<float>(_dmw53.y);
            int _3380 = _3294 + 8;
            uint _3382 = uint(int(uint(_3380) >> uint(2)));
            float _3384 = as_type<float>(_dmw53.z);
            int _3386 = _3294 + 12;
            uint _3388 = uint(int(uint(_3386) >> uint(2)));
            float _3390 = as_type<float>(_dmw53.w);
            int _3392 = _3320 + 262144;
            int _3394 = _3320 + 262192;
            uint _3396 = uint(int(uint(_3318) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3396)];
            float _3398 = as_type<float>(_dmw54.x);
            int _3400 = _3318 + 4;
            uint _3402 = uint(int(uint(_3400) >> uint(2)));
            float _3404 = as_type<float>(_dmw54.y);
            int _3406 = _3318 + 8;
            uint _3408 = uint(int(uint(_3406) >> uint(2)));
            float _3410 = as_type<float>(_dmw54.z);
            int _3412 = _3318 + 12;
            uint _3414 = uint(int(uint(_3412) >> uint(2)));
            float _3416 = as_type<float>(_dmw54.w);
            int _3418 = _3320 + 262160;
            int _3420 = _3320 + 262208;
            uint _3422 = uint(int(uint(_3344) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3422)];
            float _3424 = as_type<float>(_dmw55.x);
            int _3426 = _3344 + 4;
            uint _3428 = uint(int(uint(_3426) >> uint(2)));
            float _3430 = as_type<float>(_dmw55.y);
            int _3432 = _3344 + 8;
            uint _3434 = uint(int(uint(_3432) >> uint(2)));
            float _3436 = as_type<float>(_dmw55.z);
            int _3438 = _3344 + 12;
            uint _3440 = uint(int(uint(_3438) >> uint(2)));
            float _3442 = as_type<float>(_dmw55.w);
            int _3444 = _3320 + 262176;
            int _3446 = _3320 + 262224;
            uint _3448 = uint(int(uint(_3392) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3448)];
            float _3450 = as_type<float>(_dmw56.x);
            int _3452 = _3392 + 4;
            uint _3454 = uint(int(uint(_3452) >> uint(2)));
            float _3456 = as_type<float>(_dmw56.y);
            int _3458 = _3392 + 8;
            uint _3460 = uint(int(uint(_3458) >> uint(2)));
            float _3462 = as_type<float>(_dmw56.z);
            int _3464 = _3392 + 12;
            uint _3466 = uint(int(uint(_3464) >> uint(2)));
            float _3468 = as_type<float>(_dmw56.w);
            int _3470 = _3320 + 262240;
            int _3472 = _3320 + 262256;
            uint _3474 = uint(int(uint(_3394) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3474)];
            float _3476 = as_type<float>(_dmw59.x);
            int _3478 = _3394 + 4;
            uint _3480 = uint(int(uint(_3478) >> uint(2)));
            float _3482 = as_type<float>(_dmw59.y);
            int _3484 = _3394 + 8;
            uint _3486 = uint(int(uint(_3484) >> uint(2)));
            float _3488 = as_type<float>(_dmw59.z);
            int _3490 = _3394 + 12;
            uint _3492 = uint(int(uint(_3490) >> uint(2)));
            float _3494 = as_type<float>(_dmw59.w);
            int _3496 = _3368 + 262144;
            int _3498 = _3368 + 262192;
            uint _3500 = uint(int(uint(_3418) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3500)];
            float _3502 = as_type<float>(_dmw57.x);
            int _3504 = _3418 + 4;
            uint _3506 = uint(int(uint(_3504) >> uint(2)));
            float _3508 = as_type<float>(_dmw57.y);
            int _3510 = _3418 + 8;
            uint _3512 = uint(int(uint(_3510) >> uint(2)));
            float _3514 = as_type<float>(_dmw57.z);
            int _3516 = _3418 + 12;
            uint _3518 = uint(int(uint(_3516) >> uint(2)));
            float _3520 = as_type<float>(_dmw57.w);
            int _3522 = _3368 + 262160;
            int _3524 = _3368 + 262208;
            uint _3526 = uint(int(uint(_3420) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3526)];
            float _3528 = as_type<float>(_dmw60.x);
            int _3530 = _3420 + 4;
            uint _3532 = uint(int(uint(_3530) >> uint(2)));
            float _3534 = as_type<float>(_dmw60.y);
            int _3536 = _3420 + 8;
            uint _3538 = uint(int(uint(_3536) >> uint(2)));
            float _3540 = as_type<float>(_dmw60.z);
            int _3542 = _3420 + 12;
            uint _3544 = uint(int(uint(_3542) >> uint(2)));
            float _3546 = as_type<float>(_dmw60.w);
            int _3548 = _3368 + 262176;
            int _3550 = _3368 + 262224;
            uint _3552 = uint(int(uint(_3444) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3552)];
            float _3554 = as_type<float>(_dmw58.x);
            int _3556 = _3444 + 4;
            uint _3558 = uint(int(uint(_3556) >> uint(2)));
            float _3560 = as_type<float>(_dmw58.y);
            int _3562 = _3444 + 8;
            uint _3564 = uint(int(uint(_3562) >> uint(2)));
            float _3566 = as_type<float>(_dmw58.z);
            int _3568 = _3444 + 12;
            uint _3570 = uint(int(uint(_3568) >> uint(2)));
            float _3572 = as_type<float>(_dmw58.w);
            int _3574 = _3368 + 262240;
            int _3576 = _3368 + 262256;
            uint _3578 = uint(int(uint(_3446) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3578)];
            float _3580 = as_type<float>(_dmw61.x);
            int _3582 = _3446 + 4;
            uint _3584 = uint(int(uint(_3582) >> uint(2)));
            float _3586 = as_type<float>(_dmw61.y);
            int _3588 = _3446 + 8;
            uint _3590 = uint(int(uint(_3588) >> uint(2)));
            float _3592 = as_type<float>(_dmw61.z);
            int _3594 = _3446 + 12;
            uint _3596 = uint(int(uint(_3594) >> uint(2)));
            float _3598 = as_type<float>(_dmw61.w);
            uint _3600 = uint(int(uint(_3470) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3600)];
            float _3602 = as_type<float>(_dmw62.x);
            int _3604 = _3470 + 4;
            uint _3606 = uint(int(uint(_3604) >> uint(2)));
            float _3608 = as_type<float>(_dmw62.y);
            int _3610 = _3470 + 8;
            uint _3612 = uint(int(uint(_3610) >> uint(2)));
            float _3614 = as_type<float>(_dmw62.z);
            int _3616 = _3470 + 12;
            uint _3618 = uint(int(uint(_3616) >> uint(2)));
            float _3620 = as_type<float>(_dmw62.w);
            uint _3622 = uint(int(uint(_3472) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3622)];
            float _3624 = as_type<float>(_dmw63.x);
            int _3626 = _3472 + 4;
            uint _3628 = uint(int(uint(_3626) >> uint(2)));
            float _3630 = as_type<float>(_dmw63.y);
            int _3632 = _3472 + 8;
            uint _3634 = uint(int(uint(_3632) >> uint(2)));
            float _3636 = as_type<float>(_dmw63.z);
            int _3638 = _3472 + 12;
            uint _3640 = uint(int(uint(_3638) >> uint(2)));
            float _3642 = as_type<float>(_dmw63.w);
            uint _3644 = uint(int(uint(_3496) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3644)];
            float _3646 = as_type<float>(_dmw64.x);
            int _3648 = _3496 + 4;
            uint _3650 = uint(int(uint(_3648) >> uint(2)));
            float _3652 = as_type<float>(_dmw64.y);
            int _3654 = _3496 + 8;
            uint _3656 = uint(int(uint(_3654) >> uint(2)));
            float _3658 = as_type<float>(_dmw64.z);
            int _3660 = _3496 + 12;
            uint _3662 = uint(int(uint(_3660) >> uint(2)));
            float _3664 = as_type<float>(_dmw64.w);
            uint _3666 = uint(int(uint(_3498) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3666)];
            float _3668 = as_type<float>(_dmw67.x);
            int _3670 = _3498 + 4;
            uint _3672 = uint(int(uint(_3670) >> uint(2)));
            float _3674 = as_type<float>(_dmw67.y);
            int _3676 = _3498 + 8;
            uint _3678 = uint(int(uint(_3676) >> uint(2)));
            float _3680 = as_type<float>(_dmw67.z);
            int _3682 = _3498 + 12;
            uint _3684 = uint(int(uint(_3682) >> uint(2)));
            float _3686 = as_type<float>(_dmw67.w);
            uint _3688 = uint(int(uint(_3522) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3688)];
            float _3690 = as_type<float>(_dmw65.x);
            int _3692 = _3522 + 4;
            uint _3694 = uint(int(uint(_3692) >> uint(2)));
            float _3696 = as_type<float>(_dmw65.y);
            int _3698 = _3522 + 8;
            uint _3700 = uint(int(uint(_3698) >> uint(2)));
            float _3702 = as_type<float>(_dmw65.z);
            int _3704 = _3522 + 12;
            uint _3706 = uint(int(uint(_3704) >> uint(2)));
            float _3708 = as_type<float>(_dmw65.w);
            uint _3710 = uint(int(uint(_3524) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3710)];
            float _3712 = as_type<float>(_dmw68.x);
            int _3714 = _3524 + 4;
            uint _3716 = uint(int(uint(_3714) >> uint(2)));
            float _3718 = as_type<float>(_dmw68.y);
            int _3720 = _3524 + 8;
            uint _3722 = uint(int(uint(_3720) >> uint(2)));
            float _3724 = as_type<float>(_dmw68.z);
            int _3726 = _3524 + 12;
            uint _3728 = uint(int(uint(_3726) >> uint(2)));
            float _3730 = as_type<float>(_dmw68.w);
            uint _3732 = uint(int(uint(_3548) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3732)];
            float _3734 = as_type<float>(_dmw66.x);
            int _3736 = _3548 + 4;
            uint _3738 = uint(int(uint(_3736) >> uint(2)));
            float _3740 = as_type<float>(_dmw66.y);
            int _3742 = _3548 + 8;
            uint _3744 = uint(int(uint(_3742) >> uint(2)));
            float _3746 = as_type<float>(_dmw66.z);
            int _3748 = _3548 + 12;
            uint _3750 = uint(int(uint(_3748) >> uint(2)));
            float _3752 = as_type<float>(_dmw66.w);
            uint _3754 = uint(int(uint(_3550) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3754)];
            float _3756 = as_type<float>(_dmw69.x);
            int _3758 = _3550 + 4;
            uint _3760 = uint(int(uint(_3758) >> uint(2)));
            float _3762 = as_type<float>(_dmw69.y);
            int _3764 = _3550 + 8;
            uint _3766 = uint(int(uint(_3764) >> uint(2)));
            float _3768 = as_type<float>(_dmw69.z);
            int _3770 = _3550 + 12;
            uint _3772 = uint(int(uint(_3770) >> uint(2)));
            float _3774 = as_type<float>(_dmw69.w);
            uint _3776 = uint(int(uint(_3574) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3776)];
            float _3778 = as_type<float>(_dmw70.x);
            int _3780 = _3574 + 4;
            uint _3782 = uint(int(uint(_3780) >> uint(2)));
            float _3784 = as_type<float>(_dmw70.y);
            int _3786 = _3574 + 8;
            uint _3788 = uint(int(uint(_3786) >> uint(2)));
            float _3790 = as_type<float>(_dmw70.z);
            int _3792 = _3574 + 12;
            uint _3794 = uint(int(uint(_3792) >> uint(2)));
            float _3796 = as_type<float>(_dmw70.w);
            uint _3798 = uint(int(uint(_3576) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3798)];
            float _3800 = as_type<float>(_dmw71.x);
            int _3802 = _3576 + 4;
            uint _3804 = uint(int(uint(_3802) >> uint(2)));
            float _3806 = as_type<float>(_dmw71.y);
            int _3808 = _3576 + 8;
            uint _3810 = uint(int(uint(_3808) >> uint(2)));
            float _3812 = as_type<float>(_dmw71.z);
            int _3814 = _3576 + 12;
            uint _3816 = uint(int(uint(_3814) >> uint(2)));
            float _3818 = as_type<float>(_dmw71.w);
            float _3820 = -_3234;
            float _3822 = _3228 + _3820;
            float _3824 = -_3822;
            float _3826 = _1402 + _3824;
            float _3828 = _3248 * _3822;
            float _3830 = _3254 * _3822;
            float _3832 = _3260 * _3822;
            float _3834 = _3266 * _3822;
            float _3836 = _3274 * _3822;
            float _3838 = _3280 * _3822;
            float _3840 = _3286 * _3822;
            float _3842 = _3292 * _3822;
            float _3844 = _3298 * _3822;
            float _3846 = _3304 * _3822;
            float _3848 = _3310 * _3822;
            float _3850 = _3316 * _3822;
            float _3852 = _3324 * _3822;
            float _3854 = _3330 * _3822;
            float _3856 = _3336 * _3822;
            float _3858 = _3342 * _3822;
            float _3860 = _3348 * _3822;
            float _3862 = _3354 * _3822;
            float _3864 = _3360 * _3822;
            float _3866 = _3366 * _3822;
            float _3868 = _3372 * _3822;
            float _3870 = _3378 * _3822;
            float _3872 = _3384 * _3822;
            float _3874 = _3390 * _3822;
            float _3876 = _3398 * _3822;
            float _3878 = _3404 * _3822;
            float _3880 = _3410 * _3822;
            float _3882 = _3416 * _3822;
            float _3884 = _3424 * _3822;
            float _3886 = _3430 * _3822;
            float _3888 = _3436 * _3822;
            float _3890 = _3442 * _3822;
            float _3892 = -_3228;
            float _3894 = fma(_3450, _3892, _3828);
            float _3896 = -_3228;
            float _3898 = fma(_3456, _3896, _3830);
            float _3900 = -_3228;
            float _3902 = fma(_3462, _3900, _3832);
            float _3904 = -_3228;
            float _3906 = fma(_3468, _3904, _3834);
            float _3908 = -_3228;
            float _3910 = fma(_3476, _3908, _3836);
            float _3912 = -_3228;
            float _3914 = fma(_3482, _3912, _3838);
            float _3916 = -_3228;
            float _3918 = fma(_3488, _3916, _3840);
            float _3920 = -_3228;
            float _3922 = fma(_3494, _3920, _3842);
            float _3924 = -_3228;
            float _3926 = fma(_3502, _3924, _3844);
            float _3928 = -_3228;
            float _3930 = fma(_3508, _3928, _3846);
            float _3932 = -_3228;
            float _3934 = fma(_3514, _3932, _3848);
            float _3936 = -_3228;
            float _3938 = fma(_3520, _3936, _3850);
            float _3940 = -_3228;
            float _3942 = fma(_3528, _3940, _3852);
            float _3944 = -_3228;
            float _3946 = fma(_3534, _3944, _3854);
            float _3948 = -_3228;
            float _3950 = fma(_3540, _3948, _3856);
            float _3952 = -_3228;
            float _3954 = fma(_3546, _3952, _3858);
            float _3956 = -_3228;
            float _3958 = fma(_3554, _3956, _3860);
            float _3960 = -_3228;
            float _3962 = fma(_3560, _3960, _3862);
            float _3964 = -_3228;
            float _3966 = fma(_3566, _3964, _3864);
            float _3968 = -_3228;
            float _3970 = fma(_3572, _3968, _3866);
            float _3972 = -_3228;
            float _3974 = fma(_3580, _3972, _3868);
            float _3976 = -_3228;
            float _3978 = fma(_3586, _3976, _3870);
            float _3980 = -_3228;
            float _3982 = fma(_3592, _3980, _3872);
            float _3984 = -_3228;
            float _3986 = fma(_3598, _3984, _3874);
            float _3988 = -_3228;
            float _3990 = fma(_3602, _3988, _3876);
            float _3992 = -_3228;
            float _3994 = fma(_3608, _3992, _3878);
            float _3996 = -_3228;
            float _3998 = fma(_3614, _3996, _3880);
            float _4000 = -_3228;
            float _4002 = fma(_3620, _4000, _3882);
            float _4004 = -_3228;
            float _4006 = fma(_3624, _4004, _3884);
            float _4008 = -_3228;
            float _4010 = fma(_3630, _4008, _3886);
            float _4012 = -_3228;
            float _4014 = fma(_3636, _4012, _3888);
            float _4016 = -_3228;
            float _4018 = fma(_3642, _4016, _3890);
            float _4020 = fma(_3646, _3826, _3894);
            float _4022 = fma(_3652, _3826, _3898);
            float _4024 = fma(_3658, _3826, _3902);
            float _4026 = fma(_3664, _3826, _3906);
            float _4028 = fma(_3668, _3826, _3910);
            float _4030 = fma(_3674, _3826, _3914);
            float _4032 = fma(_3680, _3826, _3918);
            float _4034 = fma(_3686, _3826, _3922);
            float _4036 = fma(_3690, _3826, _3926);
            float _4038 = fma(_3696, _3826, _3930);
            float _4040 = fma(_3702, _3826, _3934);
            float _4042 = fma(_3708, _3826, _3938);
            float _4044 = fma(_3712, _3826, _3942);
            float _4046 = fma(_3718, _3826, _3946);
            float _4048 = fma(_3724, _3826, _3950);
            float _4050 = fma(_3730, _3826, _3954);
            float _4052 = fma(_3734, _3826, _3958);
            float _4054 = fma(_3740, _3826, _3962);
            float _4056 = fma(_3746, _3826, _3966);
            float _4058 = fma(_3752, _3826, _3970);
            float _4060 = fma(_3756, _3826, _3974);
            float _4062 = fma(_3762, _3826, _3978);
            float _4064 = fma(_3768, _3826, _3982);
            float _4066 = fma(_3774, _3826, _3986);
            float _4068 = fma(_3778, _3826, _3990);
            float _4070 = fma(_3784, _3826, _3994);
            float _4072 = fma(_3790, _3826, _3998);
            float _4074 = fma(_3796, _3826, _4002);
            float _4076 = fma(_3800, _3826, _4006);
            float _4078 = fma(_3806, _3826, _4010);
            float _4080 = fma(_3812, _3826, _4014);
            float _4082 = fma(_3818, _3826, _4018);
            _2252 = _4030;
            _2254 = _4034;
            _2256 = _4044;
            _2258 = _4028;
            _2260 = _4062;
            _2262 = _4064;
            _2264 = _4046;
            _2266 = _4050;
            _2268 = _4066;
            _2270 = _4060;
            _2272 = _4048;
            _2274 = _4032;
            _2276 = _4078;
            _2278 = _4076;
            _2280 = _4026;
            _2282 = _4036;
            _2284 = _4038;
            _2286 = _4070;
            _2288 = _4020;
            _2290 = _4022;
            _2292 = _4024;
            _2294 = _4068;
            _2296 = _4080;
            _2298 = _4040;
            _2300 = _4042;
            _2302 = _4052;
            _2304 = _4072;
            _2306 = _4082;
            _2308 = _4054;
            _2310 = _4056;
            _2312 = _4058;
            _2314 = _4074;
            _2316 = true;
        }
        else
        {
            int _4084 = _1258 * 656;
            int _4086 = _4084 + 262144;
            int _4088 = _4084 + 262192;
            int _4090 = _4084 + 262160;
            uint _4092 = uint(int(uint(_4086) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4092)];
            float _4094 = as_type<float>(_dmw72.x);
            int _4096 = _4086 + 4;
            uint _4098 = uint(int(uint(_4096) >> uint(2)));
            float _4100 = as_type<float>(_dmw72.y);
            int _4102 = _4086 + 8;
            uint _4104 = uint(int(uint(_4102) >> uint(2)));
            float _4106 = as_type<float>(_dmw72.z);
            int _4108 = _4086 + 12;
            uint _4110 = uint(int(uint(_4108) >> uint(2)));
            float _4112 = as_type<float>(_dmw72.w);
            int _4114 = _4084 + 262208;
            int _4116 = _4084 + 262176;
            uint _4118 = uint(int(uint(_4088) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4118)];
            float _4120 = as_type<float>(_dmw75.x);
            int _4122 = _4088 + 4;
            uint _4124 = uint(int(uint(_4122) >> uint(2)));
            float _4126 = as_type<float>(_dmw75.y);
            int _4128 = _4088 + 8;
            uint _4130 = uint(int(uint(_4128) >> uint(2)));
            float _4132 = as_type<float>(_dmw75.z);
            int _4134 = _4088 + 12;
            uint _4136 = uint(int(uint(_4134) >> uint(2)));
            float _4138 = as_type<float>(_dmw75.w);
            int _4140 = _4084 + 262224;
            uint _4142 = uint(int(uint(_4090) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4142)];
            float _4144 = as_type<float>(_dmw73.x);
            int _4146 = _4090 + 4;
            uint _4148 = uint(int(uint(_4146) >> uint(2)));
            float _4150 = as_type<float>(_dmw73.y);
            int _4152 = _4090 + 8;
            uint _4154 = uint(int(uint(_4152) >> uint(2)));
            float _4156 = as_type<float>(_dmw73.z);
            int _4158 = _4090 + 12;
            uint _4160 = uint(int(uint(_4158) >> uint(2)));
            float _4162 = as_type<float>(_dmw73.w);
            int _4164 = _4084 + 262240;
            int _4166 = _1196 * 656;
            uint _4168 = uint(int(uint(_4114) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4168)];
            float _4170 = as_type<float>(_dmw76.x);
            int _4172 = _4114 + 4;
            uint _4174 = uint(int(uint(_4172) >> uint(2)));
            float _4176 = as_type<float>(_dmw76.y);
            int _4178 = _4114 + 8;
            uint _4180 = uint(int(uint(_4178) >> uint(2)));
            float _4182 = as_type<float>(_dmw76.z);
            int _4184 = _4114 + 12;
            uint _4186 = uint(int(uint(_4184) >> uint(2)));
            float _4188 = as_type<float>(_dmw76.w);
            int _4190 = _4084 + 262256;
            uint _4192 = uint(int(uint(_4116) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4192)];
            float _4194 = as_type<float>(_dmw74.x);
            int _4196 = _4116 + 4;
            uint _4198 = uint(int(uint(_4196) >> uint(2)));
            float _4200 = as_type<float>(_dmw74.y);
            int _4202 = _4116 + 8;
            uint _4204 = uint(int(uint(_4202) >> uint(2)));
            float _4206 = as_type<float>(_dmw74.z);
            int _4208 = _4116 + 12;
            uint _4210 = uint(int(uint(_4208) >> uint(2)));
            float _4212 = as_type<float>(_dmw74.w);
            int _4214 = _1242 * 656;
            uint _4216 = uint(int(uint(_4140) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4216)];
            float _4218 = as_type<float>(_dmw77.x);
            int _4220 = _4140 + 4;
            uint _4222 = uint(int(uint(_4220) >> uint(2)));
            float _4224 = as_type<float>(_dmw77.y);
            int _4226 = _4140 + 8;
            uint _4228 = uint(int(uint(_4226) >> uint(2)));
            float _4230 = as_type<float>(_dmw77.z);
            int _4232 = _4140 + 12;
            uint _4234 = uint(int(uint(_4232) >> uint(2)));
            float _4236 = as_type<float>(_dmw77.w);
            int _4238 = _4166 + 262144;
            int _4240 = _4166 + 262192;
            uint _4242 = uint(int(uint(_4164) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4242)];
            float _4244 = as_type<float>(_dmw78.x);
            int _4246 = _4164 + 4;
            uint _4248 = uint(int(uint(_4246) >> uint(2)));
            float _4250 = as_type<float>(_dmw78.y);
            int _4252 = _4164 + 8;
            uint _4254 = uint(int(uint(_4252) >> uint(2)));
            float _4256 = as_type<float>(_dmw78.z);
            int _4258 = _4164 + 12;
            uint _4260 = uint(int(uint(_4258) >> uint(2)));
            float _4262 = as_type<float>(_dmw78.w);
            int _4264 = _4166 + 262160;
            int _4266 = _4166 + 262208;
            uint _4268 = uint(int(uint(_4190) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4268)];
            float _4270 = as_type<float>(_dmw79.x);
            int _4272 = _4190 + 4;
            uint _4274 = uint(int(uint(_4272) >> uint(2)));
            float _4276 = as_type<float>(_dmw79.y);
            int _4278 = _4190 + 8;
            uint _4280 = uint(int(uint(_4278) >> uint(2)));
            float _4282 = as_type<float>(_dmw79.z);
            int _4284 = _4190 + 12;
            uint _4286 = uint(int(uint(_4284) >> uint(2)));
            float _4288 = as_type<float>(_dmw79.w);
            int _4290 = _4166 + 262176;
            int _4292 = _4166 + 262224;
            uint _4294 = uint(int(uint(_4238) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4294)];
            float _4296 = as_type<float>(_dmw80.x);
            int _4298 = _4238 + 4;
            uint _4300 = uint(int(uint(_4298) >> uint(2)));
            float _4302 = as_type<float>(_dmw80.y);
            int _4304 = _4238 + 8;
            uint _4306 = uint(int(uint(_4304) >> uint(2)));
            float _4308 = as_type<float>(_dmw80.z);
            int _4310 = _4238 + 12;
            uint _4312 = uint(int(uint(_4310) >> uint(2)));
            float _4314 = as_type<float>(_dmw80.w);
            int _4316 = _4166 + 262240;
            int _4318 = _4166 + 262256;
            uint _4320 = uint(int(uint(_4240) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4320)];
            float _4322 = as_type<float>(_dmw83.x);
            int _4324 = _4240 + 4;
            uint _4326 = uint(int(uint(_4324) >> uint(2)));
            float _4328 = as_type<float>(_dmw83.y);
            int _4330 = _4240 + 8;
            uint _4332 = uint(int(uint(_4330) >> uint(2)));
            float _4334 = as_type<float>(_dmw83.z);
            int _4336 = _4240 + 12;
            uint _4338 = uint(int(uint(_4336) >> uint(2)));
            float _4340 = as_type<float>(_dmw83.w);
            int _4342 = _4214 + 262144;
            int _4344 = _4214 + 262192;
            uint _4346 = uint(int(uint(_4264) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4346)];
            float _4348 = as_type<float>(_dmw81.x);
            int _4350 = _4264 + 4;
            uint _4352 = uint(int(uint(_4350) >> uint(2)));
            float _4354 = as_type<float>(_dmw81.y);
            int _4356 = _4264 + 8;
            uint _4358 = uint(int(uint(_4356) >> uint(2)));
            float _4360 = as_type<float>(_dmw81.z);
            int _4362 = _4264 + 12;
            uint _4364 = uint(int(uint(_4362) >> uint(2)));
            float _4366 = as_type<float>(_dmw81.w);
            int _4368 = _4214 + 262160;
            int _4370 = _4214 + 262208;
            uint _4372 = uint(int(uint(_4266) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4372)];
            float _4374 = as_type<float>(_dmw84.x);
            int _4376 = _4266 + 4;
            uint _4378 = uint(int(uint(_4376) >> uint(2)));
            float _4380 = as_type<float>(_dmw84.y);
            int _4382 = _4266 + 8;
            uint _4384 = uint(int(uint(_4382) >> uint(2)));
            float _4386 = as_type<float>(_dmw84.z);
            int _4388 = _4266 + 12;
            uint _4390 = uint(int(uint(_4388) >> uint(2)));
            float _4392 = as_type<float>(_dmw84.w);
            int _4394 = _4214 + 262176;
            int _4396 = _4214 + 262224;
            uint _4398 = uint(int(uint(_4290) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4398)];
            float _4400 = as_type<float>(_dmw82.x);
            int _4402 = _4290 + 4;
            uint _4404 = uint(int(uint(_4402) >> uint(2)));
            float _4406 = as_type<float>(_dmw82.y);
            int _4408 = _4290 + 8;
            uint _4410 = uint(int(uint(_4408) >> uint(2)));
            float _4412 = as_type<float>(_dmw82.z);
            int _4414 = _4290 + 12;
            uint _4416 = uint(int(uint(_4414) >> uint(2)));
            float _4418 = as_type<float>(_dmw82.w);
            int _4420 = _4214 + 262240;
            int _4422 = _4214 + 262256;
            uint _4424 = uint(int(uint(_4292) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4424)];
            float _4426 = as_type<float>(_dmw85.x);
            int _4428 = _4292 + 4;
            uint _4430 = uint(int(uint(_4428) >> uint(2)));
            float _4432 = as_type<float>(_dmw85.y);
            int _4434 = _4292 + 8;
            uint _4436 = uint(int(uint(_4434) >> uint(2)));
            float _4438 = as_type<float>(_dmw85.z);
            int _4440 = _4292 + 12;
            uint _4442 = uint(int(uint(_4440) >> uint(2)));
            float _4444 = as_type<float>(_dmw85.w);
            uint _4446 = uint(int(uint(_4316) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4446)];
            float _4448 = as_type<float>(_dmw86.x);
            int _4450 = _4316 + 4;
            uint _4452 = uint(int(uint(_4450) >> uint(2)));
            float _4454 = as_type<float>(_dmw86.y);
            int _4456 = _4316 + 8;
            uint _4458 = uint(int(uint(_4456) >> uint(2)));
            float _4460 = as_type<float>(_dmw86.z);
            int _4462 = _4316 + 12;
            uint _4464 = uint(int(uint(_4462) >> uint(2)));
            float _4466 = as_type<float>(_dmw86.w);
            uint _4468 = uint(int(uint(_4318) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4468)];
            float _4470 = as_type<float>(_dmw87.x);
            int _4472 = _4318 + 4;
            uint _4474 = uint(int(uint(_4472) >> uint(2)));
            float _4476 = as_type<float>(_dmw87.y);
            int _4478 = _4318 + 8;
            uint _4480 = uint(int(uint(_4478) >> uint(2)));
            float _4482 = as_type<float>(_dmw87.z);
            int _4484 = _4318 + 12;
            uint _4486 = uint(int(uint(_4484) >> uint(2)));
            float _4488 = as_type<float>(_dmw87.w);
            uint _4490 = uint(int(uint(_4342) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4490)];
            float _4492 = as_type<float>(_dmw88.x);
            int _4494 = _4342 + 4;
            uint _4496 = uint(int(uint(_4494) >> uint(2)));
            float _4498 = as_type<float>(_dmw88.y);
            int _4500 = _4342 + 8;
            uint _4502 = uint(int(uint(_4500) >> uint(2)));
            float _4504 = as_type<float>(_dmw88.z);
            int _4506 = _4342 + 12;
            uint _4508 = uint(int(uint(_4506) >> uint(2)));
            float _4510 = as_type<float>(_dmw88.w);
            uint _4512 = uint(int(uint(_4344) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4512)];
            float _4514 = as_type<float>(_dmw91.x);
            int _4516 = _4344 + 4;
            uint _4518 = uint(int(uint(_4516) >> uint(2)));
            float _4520 = as_type<float>(_dmw91.y);
            int _4522 = _4344 + 8;
            uint _4524 = uint(int(uint(_4522) >> uint(2)));
            float _4526 = as_type<float>(_dmw91.z);
            int _4528 = _4344 + 12;
            uint _4530 = uint(int(uint(_4528) >> uint(2)));
            float _4532 = as_type<float>(_dmw91.w);
            uint _4534 = uint(int(uint(_4368) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4534)];
            float _4536 = as_type<float>(_dmw89.x);
            int _4538 = _4368 + 4;
            uint _4540 = uint(int(uint(_4538) >> uint(2)));
            float _4542 = as_type<float>(_dmw89.y);
            int _4544 = _4368 + 8;
            uint _4546 = uint(int(uint(_4544) >> uint(2)));
            float _4548 = as_type<float>(_dmw89.z);
            int _4550 = _4368 + 12;
            uint _4552 = uint(int(uint(_4550) >> uint(2)));
            float _4554 = as_type<float>(_dmw89.w);
            uint _4556 = uint(int(uint(_4370) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4556)];
            float _4558 = as_type<float>(_dmw92.x);
            int _4560 = _4370 + 4;
            uint _4562 = uint(int(uint(_4560) >> uint(2)));
            float _4564 = as_type<float>(_dmw92.y);
            int _4566 = _4370 + 8;
            uint _4568 = uint(int(uint(_4566) >> uint(2)));
            float _4570 = as_type<float>(_dmw92.z);
            int _4572 = _4370 + 12;
            uint _4574 = uint(int(uint(_4572) >> uint(2)));
            float _4576 = as_type<float>(_dmw92.w);
            uint _4578 = uint(int(uint(_4394) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4578)];
            float _4580 = as_type<float>(_dmw90.x);
            int _4582 = _4394 + 4;
            uint _4584 = uint(int(uint(_4582) >> uint(2)));
            float _4586 = as_type<float>(_dmw90.y);
            int _4588 = _4394 + 8;
            uint _4590 = uint(int(uint(_4588) >> uint(2)));
            float _4592 = as_type<float>(_dmw90.z);
            int _4594 = _4394 + 12;
            uint _4596 = uint(int(uint(_4594) >> uint(2)));
            float _4598 = as_type<float>(_dmw90.w);
            uint _4600 = uint(int(uint(_4396) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4600)];
            float _4602 = as_type<float>(_dmw93.x);
            int _4604 = _4396 + 4;
            uint _4606 = uint(int(uint(_4604) >> uint(2)));
            float _4608 = as_type<float>(_dmw93.y);
            int _4610 = _4396 + 8;
            uint _4612 = uint(int(uint(_4610) >> uint(2)));
            float _4614 = as_type<float>(_dmw93.z);
            int _4616 = _4396 + 12;
            uint _4618 = uint(int(uint(_4616) >> uint(2)));
            float _4620 = as_type<float>(_dmw93.w);
            uint _4622 = uint(int(uint(_4420) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4622)];
            float _4624 = as_type<float>(_dmw94.x);
            int _4626 = _4420 + 4;
            uint _4628 = uint(int(uint(_4626) >> uint(2)));
            float _4630 = as_type<float>(_dmw94.y);
            int _4632 = _4420 + 8;
            uint _4634 = uint(int(uint(_4632) >> uint(2)));
            float _4636 = as_type<float>(_dmw94.z);
            int _4638 = _4420 + 12;
            uint _4640 = uint(int(uint(_4638) >> uint(2)));
            float _4642 = as_type<float>(_dmw94.w);
            uint _4644 = uint(int(uint(_4422) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4644)];
            float _4646 = as_type<float>(_dmw95.x);
            int _4648 = _4422 + 4;
            uint _4650 = uint(int(uint(_4648) >> uint(2)));
            float _4652 = as_type<float>(_dmw95.y);
            int _4654 = _4422 + 8;
            uint _4656 = uint(int(uint(_4654) >> uint(2)));
            float _4658 = as_type<float>(_dmw95.z);
            int _4660 = _4422 + 12;
            uint _4662 = uint(int(uint(_4660) >> uint(2)));
            float _4664 = as_type<float>(_dmw95.w);
            float _4666 = -_3228;
            float _4668 = _4666 + _3234;
            float _4670 = -_4668;
            float _4672 = _1306 + _4670;
            float _4674 = _4094 * _4668;
            float _4676 = _4100 * _4668;
            float _4678 = _4106 * _4668;
            float _4680 = _4112 * _4668;
            float _4682 = _4120 * _4668;
            float _4684 = _4126 * _4668;
            float _4686 = _4132 * _4668;
            float _4688 = _4138 * _4668;
            float _4690 = _4144 * _4668;
            float _4692 = _4150 * _4668;
            float _4694 = _4156 * _4668;
            float _4696 = _4162 * _4668;
            float _4698 = _4170 * _4668;
            float _4700 = _4176 * _4668;
            float _4702 = _4182 * _4668;
            float _4704 = _4188 * _4668;
            float _4706 = _4194 * _4668;
            float _4708 = _4200 * _4668;
            float _4710 = _4206 * _4668;
            float _4712 = _4212 * _4668;
            float _4714 = _4218 * _4668;
            float _4716 = _4224 * _4668;
            float _4718 = _4230 * _4668;
            float _4720 = _4236 * _4668;
            float _4722 = _4244 * _4668;
            float _4724 = _4250 * _4668;
            float _4726 = _4256 * _4668;
            float _4728 = _4262 * _4668;
            float _4730 = _4270 * _4668;
            float _4732 = _4276 * _4668;
            float _4734 = _4282 * _4668;
            float _4736 = _4288 * _4668;
            float _4738 = -_3234;
            float _4740 = fma(_4296, _4738, _4674);
            float _4742 = -_3234;
            float _4744 = fma(_4302, _4742, _4676);
            float _4746 = -_3234;
            float _4748 = fma(_4308, _4746, _4678);
            float _4750 = -_3234;
            float _4752 = fma(_4314, _4750, _4680);
            float _4754 = -_3234;
            float _4756 = fma(_4322, _4754, _4682);
            float _4758 = -_3234;
            float _4760 = fma(_4328, _4758, _4684);
            float _4762 = -_3234;
            float _4764 = fma(_4334, _4762, _4686);
            float _4766 = -_3234;
            float _4768 = fma(_4340, _4766, _4688);
            float _4770 = -_3234;
            float _4772 = fma(_4348, _4770, _4690);
            float _4774 = -_3234;
            float _4776 = fma(_4354, _4774, _4692);
            float _4778 = -_3234;
            float _4780 = fma(_4360, _4778, _4694);
            float _4782 = -_3234;
            float _4784 = fma(_4366, _4782, _4696);
            float _4786 = -_3234;
            float _4788 = fma(_4374, _4786, _4698);
            float _4790 = -_3234;
            float _4792 = fma(_4380, _4790, _4700);
            float _4794 = -_3234;
            float _4796 = fma(_4386, _4794, _4702);
            float _4798 = -_3234;
            float _4800 = fma(_4392, _4798, _4704);
            float _4802 = -_3234;
            float _4804 = fma(_4400, _4802, _4706);
            float _4806 = -_3234;
            float _4808 = fma(_4406, _4806, _4708);
            float _4810 = -_3234;
            float _4812 = fma(_4412, _4810, _4710);
            float _4814 = -_3234;
            float _4816 = fma(_4418, _4814, _4712);
            float _4818 = -_3234;
            float _4820 = fma(_4426, _4818, _4714);
            float _4822 = -_3234;
            float _4824 = fma(_4432, _4822, _4716);
            float _4826 = -_3234;
            float _4828 = fma(_4438, _4826, _4718);
            float _4830 = -_3234;
            float _4832 = fma(_4444, _4830, _4720);
            float _4834 = -_3234;
            float _4836 = fma(_4448, _4834, _4722);
            float _4838 = -_3234;
            float _4840 = fma(_4454, _4838, _4724);
            float _4842 = -_3234;
            float _4844 = fma(_4460, _4842, _4726);
            float _4846 = -_3234;
            float _4848 = fma(_4466, _4846, _4728);
            float _4850 = -_3234;
            float _4852 = fma(_4470, _4850, _4730);
            float _4854 = -_3234;
            float _4856 = fma(_4476, _4854, _4732);
            float _4858 = -_3234;
            float _4860 = fma(_4482, _4858, _4734);
            float _4862 = -_3234;
            float _4864 = fma(_4488, _4862, _4736);
            float _4866 = fma(_4492, _4672, _4740);
            float _4868 = fma(_4498, _4672, _4744);
            float _4870 = fma(_4504, _4672, _4748);
            float _4872 = fma(_4510, _4672, _4752);
            float _4874 = fma(_4514, _4672, _4756);
            float _4876 = fma(_4520, _4672, _4760);
            float _4878 = fma(_4526, _4672, _4764);
            float _4880 = fma(_4532, _4672, _4768);
            float _4882 = fma(_4536, _4672, _4772);
            float _4884 = fma(_4542, _4672, _4776);
            float _4886 = fma(_4548, _4672, _4780);
            float _4888 = fma(_4554, _4672, _4784);
            float _4890 = fma(_4558, _4672, _4788);
            float _4892 = fma(_4564, _4672, _4792);
            float _4894 = fma(_4570, _4672, _4796);
            float _4896 = fma(_4576, _4672, _4800);
            float _4898 = fma(_4580, _4672, _4804);
            float _4900 = fma(_4586, _4672, _4808);
            float _4902 = fma(_4592, _4672, _4812);
            float _4904 = fma(_4598, _4672, _4816);
            float _4906 = fma(_4602, _4672, _4820);
            float _4908 = fma(_4608, _4672, _4824);
            float _4910 = fma(_4614, _4672, _4828);
            float _4912 = fma(_4620, _4672, _4832);
            float _4914 = fma(_4624, _4672, _4836);
            float _4916 = fma(_4630, _4672, _4840);
            float _4918 = fma(_4636, _4672, _4844);
            float _4920 = fma(_4642, _4672, _4848);
            float _4922 = fma(_4646, _4672, _4852);
            float _4924 = fma(_4652, _4672, _4856);
            float _4926 = fma(_4658, _4672, _4860);
            float _4928 = fma(_4664, _4672, _4864);
            _2252 = _4876;
            _2254 = _4880;
            _2256 = _4890;
            _2258 = _4874;
            _2260 = _4908;
            _2262 = _4910;
            _2264 = _4892;
            _2266 = _4896;
            _2268 = _4912;
            _2270 = _4906;
            _2272 = _4894;
            _2274 = _4878;
            _2276 = _4924;
            _2278 = _4922;
            _2280 = _4872;
            _2282 = _4882;
            _2284 = _4884;
            _2286 = _4916;
            _2288 = _4866;
            _2290 = _4868;
            _2292 = _4870;
            _2294 = _4914;
            _2296 = _4926;
            _2298 = _4886;
            _2300 = _4888;
            _2302 = _4898;
            _2304 = _4918;
            _2306 = _4928;
            _2308 = _4900;
            _2310 = _4902;
            _2312 = _4904;
            _2314 = _4920;
        }
    }
    _2316 = false;
    float _4930 = _2252;
    float _4932 = _2254;
    float _4934 = _2256;
    float _4936 = _2258;
    float _4938 = _2260;
    float _4940 = _2262;
    float _4942 = _2264;
    float _4944 = _2266;
    float _4946 = _2268;
    float _4948 = _2270;
    float _4950 = _2272;
    float _4952 = _2274;
    float _4954 = _2276;
    float _4956 = _2278;
    float _4958 = _2280;
    float _4960 = _2282;
    float _4962 = _2284;
    float _4964 = _2286;
    float _4966 = _2288;
    float _4968 = _2290;
    float _4970 = _2292;
    float _4972 = _2294;
    float _4974 = _2296;
    float _4976 = _2298;
    float _4978 = _2300;
    float _4980 = _2302;
    float _4982 = _2304;
    float _4984 = _2306;
    float _4986 = _2308;
    float _4988 = _2310;
    float _4990 = _2312;
    float _4992 = _2314;
    float _4994 = _4930 * 0.88622760772705078125;
    float _4996 = _4932 * 0.511664927005767822265625;
    float _4998 = _4934 * 0.511664927005767822265625;
    float _5000 = _4936 * 0.88622760772705078125;
    float _5002 = _4938 * 0.511664927005767822265625;
    float _5004 = _4996 * _4996;
    float _5006 = precise::max(_4994, 0.00999999977648258209228515625);
    float _5008 = _4940 * 0.511664927005767822265625;
    float _5010 = _4998 * _4998;
    float _5012 = _4942 * 0.511664927005767822265625;
    float _5014 = precise::max(_5000, 0.00999999977648258209228515625);
    float _5016 = fma(_5002, _5002, _5004);
    float _5018 = 1.0 / _5006;
    float _5020 = _4944 * 0.511664927005767822265625;
    float _5022 = fma(_5008, _5008, _5010);
    float _5024 = _4946 * 0.511664927005767822265625;
    float _5026 = _4948 * 0.511664927005767822265625;
    float _5028 = _4950 * 0.511664927005767822265625;
    float _5030 = _4952 * 0.88622760772705078125;
    float _5032 = 1.0 / _5014;
    float _5034 = _5012 * _5012;
    float _5036 = fma(_5028, _5028, _5016);
    float _5038 = precise::max(_5030, 0.00999999977648258209228515625);
    float _5040 = fma(_1392, 1.9073486328125, 0.5);
    float _5042 = fma(_5024, _5024, _5034);
    float _5044 = sqrt(_5036);
    float _5046 = fma(_5020, _5020, _5022);
    float _5048 = fma(_5026, _5026, _5042);
    float _5050 = _1392 * 3.903682708740234375;
    float _5052 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5054 = _5052 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5056 = _5050 * _4954;
    float _5058 = sqrt(_5046);
    float _5060 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5062 = _5060 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5064 = fma(_4956, 0.88622701168060302734375, _5056);
    float _5066 = _5050 * _4958;
    float _5068 = _5050 * _4960;
    float _5070 = _5050 * _4962;
    float _5072 = _5050 * _4964;
    float _5074 = sqrt(_5048);
    float _5076 = fma(_4966, 0.88622701168060302734375, _5066);
    float _5078 = fma(_4968, 0.88622701168060302734375, _5068);
    float _5080 = fma(_4970, 0.88622701168060302734375, _5070);
    float _5082 = fma(_4972, 0.88622701168060302734375, _5072);
    float _5084 = precise::max(_5058, 0.00999999977648258209228515625);
    float _5086 = 1.0 / _5038;
    float _5088 = fma(_5040, _5062, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5090 = precise::max(_5074, 0.00999999977648258209228515625);
    float _5092 = 1.0 / _5084;
    int _5094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5096 = _5094 != 0;
    float _5098 = precise::max(_5044, 0.00999999977648258209228515625);
    float _5100 = 1.0 / _5090;
    float _5102 = fma(_5040, _5054, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5104 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5106 = _5104 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5108 = _5102 * 0.715200006961822509765625;
    float _5110 = fma(_5040, _5106, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5112 = _5090 * _5086;
    float _5114 = precise::clamp(_5112, 0.0, 1.0);
    float _5116 = 1.0 / _5098;
    float _5118 = fma(_5088, 0.2125999927520751953125, _5108);
    float _5120 = _4998 * _5092;
    float _5122 = _5098 * _5032;
    float _5124 = precise::clamp(_5122, 0.0, 1.0);
    float _5126 = _5020 * _5092;
    float _5128 = fma(_5110, 0.072200000286102294921875, _5118);
    float _5130 = _1442 * _5120;
    float _5132 = _5084 * _5018;
    float _5134 = precise::clamp(_5132, 0.0, 1.0);
    float _5136 = _5012 * _5100;
    float _5138 = _5008 * _5092;
    float _5140 = _5124 + 1.0;
    float _5142 = _5024 * _5100;
    float _5144 = _1442 * _5136;
    float _5146 = -_1438;
    float _5148 = fma(_5146, _5138, _5130);
    float _5150 = 1.0 / _5140;
    float _5152 = _5026 * _5100;
    float _5154 = _4996 * _5116;
    float _5156 = _5002 * _5116;
    float _5158 = _5028 * _5116;
    float _5160 = _1442 * _5154;
    float _5162 = -_1438;
    float _5164 = fma(_5162, _5142, _5144);
    float _5166 = -_1436;
    float _5168 = fma(_5166, _5126, _5148);
    float _5170 = _5114 + 1.0;
    float _5172 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5174 = _5172 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5176 = -_1438;
    float _5178 = fma(_5176, _5156, _5160);
    float _5180 = -_1436;
    float _5182 = fma(_5180, _5152, _5164);
    float _5184 = 1.0 / _5170;
    float _5186 = fma(_5040, _5174, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5188 = -_1436;
    float _5190 = fma(_5188, _5158, _5178);
    float _5192 = fma(_5182, 0.5, 0.5);
    float _5194 = _1436 * (-1.02332699298858642578125);
    float _5196 = fma(_5190, 0.5, 0.5);
    float _5198 = 1.0 / _5128;
    float _5200 = fma(_5168, 0.5, 0.5);
    float _5202 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5204 = _5202 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5206 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5208 = _5206 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5210 = fma(_5194, _4974, _5064);
    float _5212 = fma(_5040, _5204, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5214 = fma(_5124, 2.0, 1.0);
    float _5216 = abs(_5200);
    float _5218 = log2(_5216);
    float _5220 = _5134 + 1.0;
    float _5222 = fma(_5040, _5208, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5224 = fma(_5194, _4976, _5076);
    float _5226 = fma(_5194, _4978, _5078);
    float _5228 = fma(_5194, _4980, _5080);
    float _5230 = fma(_5194, _4982, _5082);
    float _5232 = abs(_5192);
    float _5234 = log2(_5232);
    float _5236 = fma(_5134, 2.0, 1.0);
    float _5238 = _5198 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5240 = precise::clamp(_5238, 0.0, 1.0);
    float _5242 = fma(_5240, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5244 = 1.0 / _5220;
    float _5246 = _5236 * _5218;
    float _5248 = fma(_5114, 2.0, 1.0);
    float _5250 = _5102 * _5242;
    float _5252 = abs(_5196);
    float _5254 = log2(_5252);
    float _5256 = _5248 * _5234;
    float _5258 = -_5124;
    float _5260 = _5258 + 1.0;
    float _5262 = fma(_5114, 2.0, 2.0);
    float _5264 = -_5114;
    float _5266 = _5264 + 1.0;
    float _5268 = _5260 * _5150;
    float _5270 = _5088 * _5242;
    float _5272 = exp2(_5246);
    float _5274 = _1438 * (-1.02332699298858642578125);
    float _5276 = _5266 * _5184;
    float _5278 = fma(_5274, _4984, _5210);
    float _5280 = fma(_5274, _4986, _5224);
    float _5282 = fma(_5274, _4988, _5226);
    float _5284 = _5214 * _5254;
    float _5286 = exp2(_5256);
    float _5288 = precise::max(0.0, _5278);
    float _5290 = fma(_5274, _4990, _5228);
    float _5292 = fma(_5274, _4992, _5230);
    float _5294 = precise::max(0.0, _5280);
    float _5296 = _5288 * 0.31830990314483642578125;
    float _5298 = precise::clamp(_5296, 0.0, 1.0);
    float _5300 = precise::max(0.0, _5282);
    float _5302 = exp2(_5284);
    float _5304 = precise::max(0.0, _5290);
    float _5306 = -_5298;
    float _5308 = _5306 + 1.0;
    float _5310 = precise::max(0.0, _5292);
    float _5312 = _5294 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5314 = _5300 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5316 = fma(_5308, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5298);
    float _5318 = _5110 * _5242;
    float _5320 = _5262 * _5286;
    float _5322 = fma(_5124, 2.0, 2.0);
    float _5324 = -_5134;
    float _5326 = _5324 + 1.0;
    float _5328 = fma(_5134, 2.0, 2.0);
    float _5330 = -_5320;
    float _5332 = _5330 + 1.0;
    float _5334 = _5304 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5336 = _5326 * _5244;
    float _5338 = _5328 * _5272;
    float _5340 = _5322 * _5302;
    float _5342 = fma(_5276, _5332, _5320);
    float _5344 = _5310 * 0.31830990314483642578125;
    float _5346 = precise::clamp(_5344, 0.0, 1.0);
    float _5348 = -_5338;
    float _5350 = _5348 + 1.0;
    float _5352 = -_5340;
    float _5354 = _5352 + 1.0;
    float _5356 = _5030 * _5342;
    float _5358 = precise::max(_5312, _5270);
    float _5360 = fma(_5336, _5350, _5338);
    float _5362 = fma(_5268, _5354, _5340);
    float _5364 = _5356 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5366 = precise::max(_5314, _5250);
    float _5368 = _4994 * _5360;
    float _5370 = _5000 * _5362;
    float _5372 = precise::max(_5334, _5318);
    float _5374 = _5346 * 0.88622701168060302734375;
    float _5376 = _5368 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5378 = _5370 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5380 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5358);
    float _5382 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5366);
    float _5384 = precise::max(_5376, _5186);
    float _5386 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5372);
    float _5388 = precise::max(_5378, _5212);
    float _5390 = precise::max(_5364, _5222);
    float _5392 = fma(_5384, _5316, _5382);
    float _5394 = fma(_5388, _5316, _5380);
    float _5396 = fma(_5390, _5316, _5386);
    bool _5398 = !_5096;
    float _5400;
    float _5402;
    float _5404;
    float _5406;
    float _5408;
    float _5410;
    float _5412;
    float _5414;
    float _5416;
    float _5418;
    int _5420;
    float _5422;
    int _5424;
    float _5426;
    int _5428;
    float _5430;
    float _5432;
    float _5434;
    float _5436;
    float _5438;
    float _5440;
    int _5442;
    int _5444;
    float _5446;
    int _5448;
    float _5450;
    float _5452;
    int _5454;
    int _5456;
    float _5458;
    int _5460;
    float _5462;
    if (!_5398)
    {
        _5400 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5402 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5404 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5406 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5408 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5410 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5412 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5414 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5416 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5418 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5422 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5426 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5430 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5432 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5434 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5436 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5438 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5440 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5446 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5450 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5452 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5458 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5462 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5464 = true;
    }
    else
    {
        float _5466 = fma(_1244, 6.2500002968590706586837768554688e-05, 0.5);
        float _5468 = fma(_1240, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14567 = float3(_5466, _5468, float(0));
        float3 _14569 = select(_14567, float3(0.0), isnan(_14567));
        float4 _5471 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14569.xy, uint(rint(_14569.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14569.xy, uint(rint(_14569.z)), level(0.0)).xyzw;
        float _5473 = _5471.x;
        float _5475 = _5471.y;
        float _5477 = _5471.z;
        float _5479 = _5471.w;
        float3 _14584 = float3(_5466, _5468, float(1));
        float3 _14586 = select(_14584, float3(0.0), isnan(_14584));
        float4 _5481 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14586.xy, uint(rint(_14586.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14586.xy, uint(rint(_14586.z)), level(0.0)).xyzw;
        float _5483 = _5481.x;
        float _5485 = _5481.y;
        float _5487 = _5481.z;
        float _5489 = _5481.w;
        float3 _14601 = float3(_5466, _5468, float(2));
        float3 _14603 = select(_14601, float3(0.0), isnan(_14601));
        float4 _5491 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14603.xy, uint(rint(_14603.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14603.xy, uint(rint(_14603.z)), level(0.0)).xyzw;
        float _5493 = _5491.x;
        float _5495 = _5491.y;
        float _5497 = _5491.z;
        float _5499 = _5491.w;
        float3 _14618 = float3(_5466, _5468, float(3));
        float3 _14620 = select(_14618, float3(0.0), isnan(_14618));
        float4 _5501 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14620.xy, uint(rint(_14620.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14620.xy, uint(rint(_14620.z)), level(0.0)).xyzw;
        float _5503 = _5501.x;
        float _5505 = _5501.y;
        float _5507 = _5501.z;
        float _5509 = _5501.w;
        float3 _14635 = float3(_5466, _5468, float(4));
        float3 _14637 = select(_14635, float3(0.0), isnan(_14635));
        float4 _5511 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14637.xy, uint(rint(_14637.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14637.xy, uint(rint(_14637.z)), level(0.0)).xyzw;
        float _5513 = _5511.x;
        float _5515 = _5511.y;
        float _5517 = _5511.z;
        float _5519 = _5511.w;
        float3 _14652 = float3(_5466, _5468, float(5));
        float3 _14654 = select(_14652, float3(0.0), isnan(_14652));
        float4 _5521 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14654.xy, uint(rint(_14654.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14654.xy, uint(rint(_14654.z)), level(0.0)).xyzw;
        float _5523 = _5521.x;
        float _5525 = _5521.y;
        float _5527 = _5521.z;
        float _5529 = _5521.w;
        float3 _14669 = float3(_5466, _5468, float(6));
        float3 _14671 = select(_14669, float3(0.0), isnan(_14669));
        float4 _5531 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14671.xy, uint(rint(_14671.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14671.xy, uint(rint(_14671.z)), level(0.0)).xyzw;
        float _5533 = _5531.x;
        float _5535 = _5531.y;
        float _5537 = _5531.z;
        float _5539 = _5531.w;
        float3 _14686 = float3(_5466, _5468, float(7));
        float3 _14688 = select(_14686, float3(0.0), isnan(_14686));
        float4 _5541 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14688.xy, uint(rint(_14688.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14688.xy, uint(rint(_14688.z)), level(0.0)).xyzw;
        float _5543 = _5541.x;
        float _5545 = _5541.y;
        float _5547 = _5541.z;
        float _5549 = _5541.w;
        _5400 = _5535;
        _5402 = _5545;
        _5404 = _5503;
        _5406 = _5505;
        _5408 = _5533;
        _5410 = _5543;
        _5412 = _5507;
        _5414 = _5479;
        _5416 = _5537;
        _5418 = _5547;
        _5420 = as_type<int>(_5513);
        _5422 = _5539;
        _5424 = as_type<int>(_5515);
        _5426 = _5549;
        _5428 = as_type<int>(_5509);
        _5430 = _5483;
        _5432 = _5473;
        _5434 = _5485;
        _5436 = _5475;
        _5438 = _5487;
        _5440 = _5477;
        _5442 = as_type<int>(_5517);
        _5444 = as_type<int>(_5519);
        _5446 = _5489;
        _5448 = as_type<int>(_5523);
        _5450 = _5495;
        _5452 = _5493;
        _5454 = as_type<int>(_5525);
        _5456 = as_type<int>(_5527);
        _5458 = _5497;
        _5460 = as_type<int>(_5529);
        _5462 = _5499;
    }
    _5464 = false;
    float _5551 = _5400;
    float _5553 = _5402;
    float _5555 = _5404;
    float _5557 = _5406;
    float _5559 = _5408;
    float _5561 = _5410;
    float _5563 = _5412;
    float _5565 = _5414;
    float _5567 = _5416;
    float _5569 = _5418;
    int _5571 = _5420;
    float _5573 = _5422;
    int _5575 = _5424;
    float _5577 = _5426;
    int _5579 = _5428;
    float _5581 = _5430;
    float _5583 = _5432;
    float _5585 = _5434;
    float _5587 = _5436;
    float _5589 = _5438;
    float _5591 = _5440;
    int _5593 = _5442;
    int _5595 = _5444;
    float _5597 = _5446;
    int _5599 = _5448;
    float _5601 = _5450;
    float _5603 = _5452;
    int _5605 = _5454;
    int _5607 = _5456;
    float _5609 = _5458;
    int _5611 = _5460;
    float _5613 = _5462;
    float _5615 = _5050 * _5551;
    float _5617 = _5050 * _5553;
    float _5619 = _5555 * 0.88622701168060302734375;
    float _5621 = _5557 * 0.88622701168060302734375;
    float _5623 = fma(_5559, 0.88622701168060302734375, _5615);
    float _5625 = fma(_5561, 0.88622701168060302734375, _5617);
    float _5627 = _5563 * 0.88622701168060302734375;
    float _5629 = _5050 * _5565;
    float _5631 = fma(_5194, _5567, _5623);
    float _5633 = fma(_5194, _5569, _5625);
    out.m_54.x = _1244;
    out.m_54.y = _1348;
    out.m_54.z = _1240;
    float _5635 = _5096 ? as_type<float>(_5571) : 0.0;
    float _5637 = fma(_5274, _5573, _5631);
    float _5639 = _5096 ? as_type<float>(_5575) : 0.0;
    float _5641 = fma(_5274, _5577, _5633);
    float _5643 = _5096 ? as_type<float>(_5579) : 0.0;
    float _5645 = _5050 * _5581;
    float _5647 = _5096 ? _5627 : 0.0;
    float _5649 = fma(_5583, 0.88622701168060302734375, _5629);
    float _5651 = _5050 * _5585;
    float _5653 = precise::max(0.0, _5637);
    float _5655 = fma(_5587, 0.88622701168060302734375, _5645);
    float _5657 = _5096 ? _5619 : 0.0;
    float _5659 = fma(_5050, _5639, _5647);
    float _5661 = _5096 ? _5621 : 0.0;
    float _5663 = fma(_5194, _5589, _5649);
    float _5665 = precise::max(0.0, _5641);
    float _5667 = fma(_5050, _5643, _5657);
    float _5669 = fma(_5591, 0.88622701168060302734375, _5651);
    float _5671 = fma(_5050, _5635, _5661);
    float _5673 = _5096 ? as_type<float>(_5593) : 0.0;
    float _5675 = _5653 * 0.31830990314483642578125;
    float _5677 = precise::clamp(_5675, 0.0, 1.0);
    float _5679 = _5096 ? as_type<float>(_5595) : 0.0;
    float _5681 = fma(_5194, _5597, _5655);
    float _5683 = _5096 ? as_type<float>(_5599) : 0.0;
    float _5685 = fma(_5274, _5601, _5663);
    float _5687 = fma(_5194, _5603, _5669);
    float _5689 = _5665 * 0.31830990314483642578125;
    float _5691 = precise::clamp(_5689, 0.0, 1.0);
    float _5693 = fma(_5194, _5673, _5667);
    float _5695 = fma(_5194, _5679, _5671);
    float _5697 = fma(_5194, _5683, _5659);
    float _5699 = _5096 ? as_type<float>(_5605) : 0.0;
    float _5701 = _5677 * 0.88622701168060302734375;
    float _5703 = _5096 ? as_type<float>(_5607) : 0.0;
    float _5705 = fma(_5274, _5609, _5681);
    float _5707 = _5096 ? as_type<float>(_5611) : 0.0;
    float _5709 = fma(_5274, _5613, _5687);
    float _5711 = precise::max(0.0, _5685);
    float _5713 = -_5691;
    float _5715 = _5713 + 1.0;
    float _5717 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _5719 = fma(_5274, _5699, _5693);
    float _5721 = fma(_5274, _5703, _5695);
    float _5723 = fma(_5274, _5707, _5697);
    float _5725 = fma(_5715, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5691);
    float _5727 = precise::max(0.0, _5705);
    float _5729 = fma(_5711, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5717);
    float _5731 = precise::max(0.0, _5709);
    float _5733 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5735 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5737 = precise::max(0.0, _5719);
    float _5739 = _5725 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5741 = precise::max(0.0, _5721);
    float _5743 = fma(_5727, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5733);
    float _5745 = precise::max(0.0, _5723);
    float _5747 = fma(_5731, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5735);
    float _5749 = fma(_5737, _5739, _5729);
    float _5751 = fma(_5741, _5739, _5743);
    float _5753 = -_1436;
    float _5755 = (-0.0) + _5753;
    float _5757 = -_1438;
    float _5759 = (-0.0) + _5757;
    float _5761 = fma(_5745, _5739, _5747);
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1446;
    float _15029 = as_type<float>(_1452);
    out.gl_Position.z = _15029;
    out.gl_Position.w = _1448;
    out.m_56.x = _5394;
    out.m_56.y = _5392;
    out.m_56.z = _5396;
    out.m_58.w = _1410;
    out.m_60.x = _5759;
    out.m_60.y = _1442;
    out.m_60.z = _5755;
    out.m_58.x = _5749;
    out.m_58.y = _5751;
    out.m_58.z = _5761;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5464 = false;
    bool _2316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_51.x;
    float _76 = in.m_51.y;
    float _78 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _80 = _78 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _83 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _85 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _87 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _85;
    int _89 = _83 << 4;
    bool _93 = _89 == 0;
    bool _95 = _89 == 16;
    bool _97 = _89 == 32;
    bool _99 = _89 == 48;
    bool _101 = _89 == 64;
    float _103 = fma(_80, _76, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _105 = _89 == 80;
    float _107 = as_type<float>(gl_BaseInstance);
    float _109 = _76;
    float _111 = _74;
    if (_93)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _107;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _103 + _115;
    float _119 = fma(_76, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _121 = _89 == 96;
    float _123 = _117 * _117;
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = _119 + _125;
    float _129 = 0.0;
    float _131 = _113;
    if (_93)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _133 = _129;
    float _135 = fma(_87, _87, _123);
    float _137 = _133;
    if (_95)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _139 = _131;
    bool _141 = _89 == 112;
    float _143 = fma(_127, _127, _135);
    float _145 = _139;
    if (_95)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _137;
    float _149 = _147;
    if (_97)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = rsqrt(_143);
    bool _155 = _89 == 128;
    float _157 = _151;
    if (_97)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_99)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _163 = _157;
    bool _165 = _89 == 144;
    float _167 = _163;
    if (_99)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_101)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _173 = _167;
    bool _175 = _89 == 160;
    float _177 = _173;
    if (_101)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _179 = _171;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _179;
    if (_105)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _177;
    bool _187 = _89 == 176;
    float _189 = _185;
    if (_105)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _191 = _183;
    float _193 = log2(_181);
    bool _195 = _89 == 192;
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
    bool _209 = _89 == 208;
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
    bool _219 = _89 == 224;
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
    bool _231 = _89 == 240;
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
    bool _245 = _89 == 256;
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
    bool _255 = _89 == 272;
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
    bool _267 = _89 == 288;
    float _269 = _263;
    if (_195)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _261;
    float _273 = float(_265);
    bool _275 = _89 == 304;
    int _277 = _265 << 4;
    int _279 = _277 + 4288;
    float _281 = _271;
    if (_209)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _283 = _269;
    float _285 = _283;
    if (_209)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _287 = _281;
    float _289 = -_273;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _293 = _287;
    if (_219)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _295 = _285;
    int _297 = _279 + 8;
    uint _300 = uint(int(uint(_297) >> uint(2)));
    uint _302 = uint(int(uint(int(_300)) >> uint(2)));
    int _304 = int(_300) & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    int _308 = int(_300) + 1;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    int _312 = _308 & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    bool _316 = _89 == 320;
    float _318 = _291 + 1.0;
    float _320 = _295;
    if (_219)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _322 = _293;
    float _324 = _322;
    if (_231)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _326 = _320;
    bool _328 = _89 == 336;
    float _330 = exp2(_318);
    float _332 = _326;
    if (_231)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _334 = _324;
    float _336 = _334;
    if (_245)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _338 = _332;
    bool _340 = _89 == 352;
    float _342 = _338;
    if (_245)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_255)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _348 = _342;
    bool _350 = _89 == 368;
    float _352 = _348;
    if (_255)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _354 = _346;
    float _356 = _354;
    if (_267)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _358 = _352;
    float _360 = 1.0 / _330;
    bool _362 = _89 == 384;
    float _364 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _356;
    float _368 = _366;
    if (_275)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _364;
    bool _372 = _89 == 400;
    float _374 = _370;
    if (_275)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _89 == 416;
    float _380 = _376;
    if (_316)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_316)
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
    bool _392 = _89 == 432;
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
    bool _402 = _89 == 448;
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
    bool _412 = _89 == 464;
    float _414 = _410;
    if (_350)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_362)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _89 == 480;
    float _424 = _420;
    if (_362)
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
    bool _432 = _89 == 496;
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
    bool _442 = _89 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _89 == 528;
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
    bool _462 = _89 == 544;
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
    bool _472 = _89 == 560;
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
    bool _482 = _89 == 576;
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
    bool _492 = _89 == 592;
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
    bool _502 = _89 == 608;
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
    bool _512 = _89 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _89 == 640;
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
    bool _532 = _89 == 656;
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
    bool _542 = _89 == 672;
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
    bool _552 = _89 == 688;
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
    bool _562 = _89 == 704;
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
    bool _572 = _89 == 720;
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
    bool _582 = _89 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _89 == 752;
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
    float _626 = _618 * _76;
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
    float _650 = _330 * _648;
    float _652 = -_636;
    float _654 = _626 + _652;
    float _656 = _654 * 2.0;
    float _658 = -_654;
    float _660 = fma(_650, _658, _76);
    float _662 = floor(_656);
    float _664 = _650 * _662;
    float _666 = _664 * 0.5;
    float _668 = _666 + _660;
    float _670 = fma(_80, _668, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _670 + _672;
    float _676 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _678 = _674 * _674;
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _682 = _676 + _680;
    float _684 = fma(_87, _87, _678);
    float _686 = fma(_682, _682, _684);
    float _688 = fma(0.008000000379979610443115234375, (*spvDescriptorSet0.vp_c15)._m0[0].z, 64.0);
    float _690 = sqrt(_686);
    float _692 = precise::max(0.0, _688);
    float _694 = precise::min(_692, 127.0);
    float _696 = trunc(_694);
    int _698 = int(_696);
    float _700 = -_314;
    float _702 = fma(_690, _306, _700);
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = -_666;
    float _708 = fma(_706, _704, _668);
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = fma(_710, 0.008000000379979610443115234375, 64.0);
    float _714 = precise::max(0.0, _712);
    float _716 = precise::min(_714, 127.0);
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _720 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _722 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _720;
    float _724 = trunc(_716);
    int _726 = int(_724);
    int _728 = _718 + 76;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c6)._m0[int(_732)][_734];
    uint _738 = uint(int(uint(_718) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c6)._m0[int(_740)][_742];
    int _746 = _726 << 7;
    int _748 = _746 + _698;
    int _750 = _748 << 4;
    float _752 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _754 = _710 + _752;
    int _756 = _750 + 8;
    float _758 = abs(_722);
    float _760 = abs(_754);
    float _762 = precise::max(_758, _760);
    float _764 = _736 + 8.0;
    uint _766 = uint(int(uint(_756) >> uint(2)));
    float _768 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_766)]);
    bool _770 = _74 >= 0.5;
    bool _772 = isnan(_74);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    float _780 = _764 + _762;
    float _782 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _784 = _710 + _782;
    float _786 = _780 * _744;
    float _788 = _786 * 4.0;
    float _790 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _792 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _796 = precise::max(_788, 1.0);
    float _798 = _790;
    float _800 = as_type<float>(_750);
    if (!_778)
    {
        float _802 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _109 = _802;
    }
    float _804 = _109;
    float _806 = log2(_796);
    float _808 = _804;
    if (!_778)
    {
        float _810 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _111 = _810;
    }
    float _812 = _111;
    float _814 = _812;
    if (!_778)
    {
        float _816 = _804 + _794;
        _808 = _816;
    }
    float _818 = _808;
    float _820 = _818;
    if (!_778)
    {
        float _822 = _812 + _794;
        _814 = _822;
    }
    float _824 = _814;
    float _826 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _826;
    float _830 = trunc(_806);
    int _832 = int(_830);
    float _834 = floor(_806);
    int _836 = min(_832, 4);
    int _838 = _836 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _840 = _838 << 4;
    float _842 = _834 + 1.0;
    float _844 = rint(_834);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    uint _850 = clamp(_848, 0u, 65535u);
    uint _852 = uint(int(uint(_840) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.vp_c6)._m0[int(_854)][_856];
    float _860 = rint(_842);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    uint _866 = clamp(_864, 0u, 65535u);
    int _868 = _840 + 16;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    uint _872 = uint(int(uint(int(_870)) >> uint(2)));
    int _874 = int(_870) & 3;
    float _876 = (*spvDescriptorSet0.vp_c6)._m0[int(_872)][_874];
    float _878 = fma(_784, _858, 0.5);
    float _880 = fma(_828, _858, 0.5);
    float _882 = fma(_784, _876, 0.5);
    float _884 = fma(_828, _876, 0.5);
    float _886 = as_type<float>(_840);
    float _888 = _828;
    float _890 = _824;
    if (!_778)
    {
        float2 _7156 = float2(_818, _824);
        float2 _894 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7156, float2(0.0), isnan(_7156)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7156, float2(0.0), isnan(_7156)), level(0.0)).xw;
        float _896 = _894.x;
        float _898 = _894.y;
        _886 = _896;
        _888 = _898;
    }
    float _900 = _886;
    float _902 = _888;
    float3 _7178 = float3(_880, _878, float(int(_850)));
    float3 _7182 = select(_7178, float3(0.0), isnan(_7178));
    float3 _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7182.xy, uint(rint(_7182.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7182.xy, uint(rint(_7182.z)), level(0.0)).xyz;
    float _908 = _906.x;
    float _910 = _906.y;
    float _912 = _906.z;
    float3 _7197 = float3(_884, _882, float(int(_866)));
    float3 _7199 = select(_7197, float3(0.0), isnan(_7197));
    float3 _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7199.xy, uint(rint(_7199.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7199.xy, uint(rint(_7199.z)), level(0.0)).xyz;
    float _916 = _914.x;
    float _918 = _914.y;
    float _920 = _914.z;
    float _922 = floor(_694);
    int _924 = _750 + 12;
    uint _926 = uint(int(uint(_750) >> uint(2)));
    float _928 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_926)]);
    uint _930 = uint(int(uint(_924) >> uint(2)));
    float _932 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_930)]);
    float _934 = floor(_716);
    float _936 = -_922;
    float _938 = _694 + _936;
    float _940 = -_934;
    float _942 = _716 + _940;
    float _944 = 0.0;
    float _946 = _910;
    if (_778)
    {
        _944 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _948 = _944;
    float _950 = 0.0;
    if (_778)
    {
        float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _790, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _950 = _952;
    }
    float _954 = _950;
    if (_778)
    {
        float _956 = _794 + _954;
        _820 = _956;
    }
    float _958 = _820;
    float _960 = _768 + _938;
    float _962 = precise::clamp(_960, 0.0, 1.0);
    float _964 = _768 + _942;
    float _966 = precise::clamp(_964, 0.0, 1.0);
    bool _968 = _962 >= 1.0;
    bool _970 = isnan(_962);
    bool _972 = _968 || _970;
    bool _974 = isnan(1.0);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    bool _980 = _966 >= 1.0;
    bool _982 = isnan(_966);
    bool _984 = _980 || _982;
    bool _986 = isnan(1.0);
    bool _988 = _984 || _986;
    float _990 = float(_988);
    float _992 = trunc(_978);
    int _994 = int(_992);
    float _996 = trunc(_990);
    int _998 = int(_996);
    int _1000 = _698 + _994;
    int _1002 = _726 << 7;
    int _1004 = _1002 + _1000;
    int _1006 = _726 + _998;
    int _1008 = _1006 << 7;
    int _1010 = _1008 + _1000;
    int _1012 = _1004 << 4;
    int _1014 = _1010 << 4;
    int _1016 = _1006 << 7;
    int _1018 = _1016 + _698;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[0].z + 1.953125;
    int _1022 = _1012 + 12;
    uint _1024 = uint(int(uint(_1012) >> uint(2)));
    float _1026 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1024)]);
    int _1028 = _1014 + 12;
    int _1030 = _1018 << 4;
    uint _1032 = uint(int(uint(_1014) >> uint(2)));
    float _1034 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1032)]);
    uint _1036 = uint(int(uint(_1022) >> uint(2)));
    float _1038 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1036)]);
    uint _1040 = uint(int(uint(_1028) >> uint(2)));
    float _1042 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1040)]);
    int _1044 = _1030 + 12;
    int _1046 = _750 + 4;
    uint _1048 = uint(int(uint(_1030) >> uint(2)));
    float _1050 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1048)]);
    uint _1052 = uint(int(uint(_1044) >> uint(2)));
    float _1054 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1052)]);
    uint _1056 = uint(int(uint(_1046) >> uint(2)));
    float _1058 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1056)]);
    float _1060 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _1062 = _710 + 1.953125;
    float _1064 = _1020;
    float _1066 = as_type<float>(_1044);
    float _1068 = as_type<float>(_1046);
    float _1070 = _1062;
    if (_778)
    {
        float _1072 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _948, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _1064 = _1072;
    }
    float _1074 = _1064;
    if (_778)
    {
        _1066 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _1076 = _1066;
    if (_778)
    {
        float _1078 = fma(_710, _948, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _1068 = _1078;
    }
    float _1080 = _1068;
    float _1082 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _1084 = _1080;
    if (_778)
    {
        float _1086 = fma(_1074, _1076, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _1070 = _1086;
    }
    float _1088 = _1070;
    float _1090 = _1088;
    if (_778)
    {
        float _1092 = fma(_1080, _1076, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _1084 = _1092;
    }
    float _1094 = _1084;
    if (_778)
    {
        float _1096 = _1088 + _794;
        _1090 = _1096;
    }
    float _1098 = _1090;
    if (_778)
    {
        float _1100 = _1094 + _794;
        _798 = _1100;
    }
    float _1102 = _798;
    float _1104 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_778)
    {
        float _1106 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _792, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _800 = _1106;
    }
    float _1108 = _800;
    float _1110 = _900;
    float _1112 = _902;
    if (_778)
    {
        float2 _7516 = float2(_1098, _1102);
        float2 _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7516, float2(0.0), isnan(_7516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7516, float2(0.0), isnan(_7516)), level(0.0)).xw;
        float _1116 = _1114.x;
        float _1118 = _1114.y;
        _1110 = _1116;
        _1112 = _1118;
    }
    float _1120 = _1110;
    float _1122 = _1112;
    float _1124 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _1126 = _1104 + _794;
    if (_778)
    {
        float _1128 = _794 + _1108;
        _890 = _1128;
    }
    float _1130 = _890;
    float _1132 = _1124 + _794;
    float2 _7553 = float2(_1126, _1130);
    float _1134 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7553, float2(0.0), isnan(_7553)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7553, float2(0.0), isnan(_7553)), level(0.0)).x;
    float2 _7561 = float2(_958, _1132);
    float _1136 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7561, float2(0.0), isnan(_7561)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7561, float2(0.0), isnan(_7561)), level(0.0)).x;
    float _1138 = floor(_962);
    float _1140 = floor(_966);
    float _1142 = -_1138;
    float _1144 = _962 + _1142;
    float _1146 = _932 * _1144;
    float _1148 = -_1140;
    float _1150 = _966 + _1148;
    float _1152 = _932 * _942;
    float _1154 = _932 * _1150;
    float _1156 = floor(_1146);
    float _1158 = _932 * _938;
    float _1160 = floor(_1152);
    float _1162 = floor(_1154);
    float _1164 = 1.0 / _932;
    float _1166 = floor(_1158);
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _1170 = -_834;
    float _1172 = _806 + _1170;
    float _1174 = -_912;
    float _1176 = _1174 + _920;
    float _1178 = fma(_1172, 5.42372894287109375, -4.338983058929443359375);
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = fma(_932, _1160, _1166);
    float _1184 = trunc(_1182);
    int _1186 = int(_1184);
    float _1188 = -_908;
    float _1190 = _1188 + _916;
    float _1192 = fma(_1180, _1176, _912);
    float _1194 = fma(_1180, _1190, _908);
    int _1196 = as_type<int>(_928) + _1186;
    float _1198 = fma(_1160, _1038, _1156);
    float _1200 = _1038 * _1164;
    float _1202 = fma(_1162, _1042, _1156);
    float _1204 = _1042 * _1164;
    float _1206 = _1200 * _1198;
    float _1208 = _710 * 0.00012500000593718141317367553710938;
    float _1210 = _1204 * _1202;
    float _1212 = fma(_1054, _1162, _1166);
    float _1214 = _1054 * _1164;
    float _1216 = abs(_1168);
    float _1218 = abs(_1208);
    float _1220 = precise::max(_1216, _1218);
    float _1222 = trunc(_1210);
    int _1224 = int(_1222);
    float _1226 = _1214 * _1212;
    float _1228 = fma(_1220, 20.0, -19.0);
    float _1230 = precise::clamp(_1228, 0.0, 1.0);
    float _1232 = trunc(_1226);
    int _1234 = int(_1232);
    float _1236 = -_1230;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_1238, _1192, _710);
    int _1242 = as_type<int>(_1034) + _1224;
    float _1244 = fma(_1238, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1248 = _1240 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1252 = _1244 + _1250;
    float _1254 = _1248 * _1248;
    float _1256 = _1058 * _938;
    int _1258 = as_type<int>(_1050) + _1234;
    float _1260 = _1058 * _942;
    float _1262 = fma(_1252, _1252, _1254);
    float _1264 = floor(_1256);
    bool _1266 = _1262 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1268 = isnan(_1262);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1274 = _1270 || _1272;
    float _1276 = floor(_1260);
    float _1278 = -_910;
    float _1280 = _1278 + _918;
    float _1282 = fma(_1180, _1280, _910);
    float _1284 = fma(_1120, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1286 = _1140;
    float _1288 = _1136;
    float _1290 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_1274)
    {
        _1286 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1292 = _1286;
    if (!_1274)
    {
        float _1294 = -_1262;
        float _1296 = _1294 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _946 = _1296;
    }
    float _1298 = _946;
    float _1300 = fma(_1238, _1282, _1284);
    float _1302 = fma(_1122, 255.99609375, 7.629510946571826934814453125e-06);
    float _1304 = -_1276;
    float _1306 = _1260 + _1304;
    float _1308 = _1264 + _1276;
    float _1310 = _1298;
    float _1312 = _1300;
    if (!_1274)
    {
        float _1314 = -_1298;
        float _1316 = fma(_1314, _1292, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = floor(_1302);
    float _1322 = _1318;
    if (!_1274)
    {
        float _1324 = precise::min(_1300, _1318);
        _1322 = _1324;
    }
    float _1326 = _1322;
    float _1328 = trunc(_1308);
    int _1330 = int(_1328);
    float _1332 = fma(_1134, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1334 = fma(_1136, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (!_1274)
    {
        float _1336 = _1262 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1288 = _1336;
    }
    float _1338 = _1288;
    if (!_1274)
    {
        float _1340 = -_1326;
        float _1342 = _1300 + _1340;
        _1290 = _1342;
    }
    float _1344 = _1290;
    if (!_1274)
    {
        float _1346 = fma(_1338, _1344, _1326);
        _1312 = _1346;
    }
    float _1348 = _1312;
    float _1350 = -_1284;
    float _1352 = _1350 + _1332;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1356 = -_1284;
    float _1358 = _1356 + _1334;
    float _1360 = _1352 * 1.953125;
    int _1362 = _1330 & 1;
    bool _1364 = _1362 != 0;
    float _1366 = -_1320;
    float _1368 = _1302 + _1366;
    float _1370 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1372 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1354);
    float _1374 = _1358 * 1.953125;
    float _1376 = fma(_1360, _1360, 14.55191516876220703125);
    float _1378 = _1348 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1380 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1370);
    float _1382 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1372);
    float _1384 = fma(_1374, _1374, _1376);
    float _1386 = fma(_1244, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1378);
    float _1388 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1380);
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1392 = rsqrt(_1384);
    float _1394 = fma(_1240, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1386);
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1400 = -_1264;
    float _1402 = _1256 + _1400;
    bool _1404 = _1368 > 0.499000012874603271484375;
    float _1406 = trunc(_1206);
    int _1408 = int(_1406);
    float _1410 = _1394 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1412 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1416 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1398);
    float _1418 = _1390 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1420 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1412);
    float _1422 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1414);
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1416);
    float _1426 = fma(_1396, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1418);
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1420);
    float _1430 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1434 = fma(_1410, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1426);
    float _1436 = _1374 * _1392;
    float _1438 = _1360 * _1392;
    int _1440 = as_type<int>(_1026) + _1408;
    float _1442 = _1392 * 3.814697265625;
    float _1444 = _1428 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1446 = _1430 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1448 = _1434 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1450 = !_1404;
    int _1452 = _1450 ? as_type<int>(_1432) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    float _2252;
    float _2254;
    float _2256;
    float _2258;
    float _2260;
    float _2262;
    float _2264;
    float _2266;
    float _2268;
    float _2270;
    float _2272;
    float _2274;
    float _2276;
    float _2278;
    float _2280;
    float _2282;
    float _2284;
    float _2286;
    float _2288;
    float _2290;
    float _2292;
    float _2294;
    float _2296;
    float _2298;
    float _2300;
    float _2302;
    float _2304;
    float _2306;
    float _2308;
    float _2310;
    float _2312;
    float _2314;
    if (!_1364)
    {
        float _1454 = fma(_1306, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1456 = fma(_1402, -0.707106769084930419921875, _1454);
        bool _1458 = _1456 >= 0.0;
        bool _1460 = !_1458;
        if (!_1460)
        {
            int _1462 = _1440 * 656;
            int _1464 = _1462 + 262144;
            int _1466 = _1462 + 262192;
            int _1468 = _1462 + 262160;
            uint _1470 = uint(int(uint(_1464) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1470)];
            float _1472 = as_type<float>(_dmw0.x);
            int _1474 = _1464 + 4;
            uint _1476 = uint(int(uint(_1474) >> uint(2)));
            float _1478 = as_type<float>(_dmw0.y);
            int _1480 = _1464 + 8;
            uint _1482 = uint(int(uint(_1480) >> uint(2)));
            float _1484 = as_type<float>(_dmw0.z);
            int _1486 = _1464 + 12;
            uint _1488 = uint(int(uint(_1486) >> uint(2)));
            float _1490 = as_type<float>(_dmw0.w);
            int _1492 = _1462 + 262208;
            int _1494 = _1462 + 262176;
            uint _1496 = uint(int(uint(_1466) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1496)];
            float _1498 = as_type<float>(_dmw3.x);
            int _1500 = _1466 + 4;
            uint _1502 = uint(int(uint(_1500) >> uint(2)));
            float _1504 = as_type<float>(_dmw3.y);
            int _1506 = _1466 + 8;
            uint _1508 = uint(int(uint(_1506) >> uint(2)));
            float _1510 = as_type<float>(_dmw3.z);
            int _1512 = _1466 + 12;
            uint _1514 = uint(int(uint(_1512) >> uint(2)));
            float _1516 = as_type<float>(_dmw3.w);
            int _1518 = _1462 + 262224;
            uint _1520 = uint(int(uint(_1468) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1520)];
            float _1522 = as_type<float>(_dmw1.x);
            int _1524 = _1468 + 4;
            uint _1526 = uint(int(uint(_1524) >> uint(2)));
            float _1528 = as_type<float>(_dmw1.y);
            int _1530 = _1468 + 8;
            uint _1532 = uint(int(uint(_1530) >> uint(2)));
            float _1534 = as_type<float>(_dmw1.z);
            int _1536 = _1468 + 12;
            uint _1538 = uint(int(uint(_1536) >> uint(2)));
            float _1540 = as_type<float>(_dmw1.w);
            int _1542 = _1462 + 262240;
            uint _1544 = uint(int(uint(_1492) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1544)];
            float _1546 = as_type<float>(_dmw4.x);
            int _1548 = _1492 + 4;
            uint _1550 = uint(int(uint(_1548) >> uint(2)));
            float _1552 = as_type<float>(_dmw4.y);
            int _1554 = _1492 + 8;
            uint _1556 = uint(int(uint(_1554) >> uint(2)));
            float _1558 = as_type<float>(_dmw4.z);
            int _1560 = _1492 + 12;
            uint _1562 = uint(int(uint(_1560) >> uint(2)));
            float _1564 = as_type<float>(_dmw4.w);
            int _1566 = _1462 + 262256;
            int _1568 = _1196 * 656;
            uint _1570 = uint(int(uint(_1494) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1570)];
            float _1572 = as_type<float>(_dmw2.x);
            int _1574 = _1494 + 4;
            uint _1576 = uint(int(uint(_1574) >> uint(2)));
            float _1578 = as_type<float>(_dmw2.y);
            int _1580 = _1494 + 8;
            uint _1582 = uint(int(uint(_1580) >> uint(2)));
            float _1584 = as_type<float>(_dmw2.z);
            int _1586 = _1494 + 12;
            uint _1588 = uint(int(uint(_1586) >> uint(2)));
            float _1590 = as_type<float>(_dmw2.w);
            int _1592 = _1258 * 656;
            uint _1594 = uint(int(uint(_1518) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1594)];
            float _1596 = as_type<float>(_dmw5.x);
            int _1598 = _1518 + 4;
            uint _1600 = uint(int(uint(_1598) >> uint(2)));
            float _1602 = as_type<float>(_dmw5.y);
            int _1604 = _1518 + 8;
            uint _1606 = uint(int(uint(_1604) >> uint(2)));
            float _1608 = as_type<float>(_dmw5.z);
            int _1610 = _1518 + 12;
            uint _1612 = uint(int(uint(_1610) >> uint(2)));
            float _1614 = as_type<float>(_dmw5.w);
            int _1616 = _1568 + 262144;
            uint _1618 = uint(int(uint(_1542) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1618)];
            float _1620 = as_type<float>(_dmw6.x);
            int _1622 = _1542 + 4;
            uint _1624 = uint(int(uint(_1622) >> uint(2)));
            float _1626 = as_type<float>(_dmw6.y);
            int _1628 = _1542 + 8;
            uint _1630 = uint(int(uint(_1628) >> uint(2)));
            float _1632 = as_type<float>(_dmw6.z);
            int _1634 = _1542 + 12;
            uint _1636 = uint(int(uint(_1634) >> uint(2)));
            float _1638 = as_type<float>(_dmw6.w);
            int _1640 = _1568 + 262192;
            int _1642 = _1568 + 262160;
            uint _1644 = uint(int(uint(_1566) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1644)];
            float _1646 = as_type<float>(_dmw7.x);
            int _1648 = _1566 + 4;
            uint _1650 = uint(int(uint(_1648) >> uint(2)));
            float _1652 = as_type<float>(_dmw7.y);
            int _1654 = _1566 + 8;
            uint _1656 = uint(int(uint(_1654) >> uint(2)));
            float _1658 = as_type<float>(_dmw7.z);
            int _1660 = _1566 + 12;
            uint _1662 = uint(int(uint(_1660) >> uint(2)));
            float _1664 = as_type<float>(_dmw7.w);
            int _1666 = _1568 + 262208;
            int _1668 = _1568 + 262176;
            uint _1670 = uint(int(uint(_1616) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1670)];
            float _1672 = as_type<float>(_dmw8.x);
            int _1674 = _1616 + 4;
            uint _1676 = uint(int(uint(_1674) >> uint(2)));
            float _1678 = as_type<float>(_dmw8.y);
            int _1680 = _1616 + 8;
            uint _1682 = uint(int(uint(_1680) >> uint(2)));
            float _1684 = as_type<float>(_dmw8.z);
            int _1686 = _1616 + 12;
            uint _1688 = uint(int(uint(_1686) >> uint(2)));
            float _1690 = as_type<float>(_dmw8.w);
            int _1692 = _1568 + 262224;
            int _1694 = _1568 + 262240;
            uint _1696 = uint(int(uint(_1640) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1696)];
            float _1698 = as_type<float>(_dmw11.x);
            int _1700 = _1640 + 4;
            uint _1702 = uint(int(uint(_1700) >> uint(2)));
            float _1704 = as_type<float>(_dmw11.y);
            int _1706 = _1640 + 8;
            uint _1708 = uint(int(uint(_1706) >> uint(2)));
            float _1710 = as_type<float>(_dmw11.z);
            int _1712 = _1640 + 12;
            uint _1714 = uint(int(uint(_1712) >> uint(2)));
            float _1716 = as_type<float>(_dmw11.w);
            int _1718 = _1568 + 262256;
            int _1720 = _1592 + 262144;
            uint _1722 = uint(int(uint(_1642) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1722)];
            float _1724 = as_type<float>(_dmw9.x);
            int _1726 = _1642 + 4;
            uint _1728 = uint(int(uint(_1726) >> uint(2)));
            float _1730 = as_type<float>(_dmw9.y);
            int _1732 = _1642 + 8;
            uint _1734 = uint(int(uint(_1732) >> uint(2)));
            float _1736 = as_type<float>(_dmw9.z);
            int _1738 = _1642 + 12;
            uint _1740 = uint(int(uint(_1738) >> uint(2)));
            float _1742 = as_type<float>(_dmw9.w);
            int _1744 = _1592 + 262192;
            int _1746 = _1592 + 262160;
            uint _1748 = uint(int(uint(_1666) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1748)];
            float _1750 = as_type<float>(_dmw12.x);
            int _1752 = _1666 + 4;
            uint _1754 = uint(int(uint(_1752) >> uint(2)));
            float _1756 = as_type<float>(_dmw12.y);
            int _1758 = _1666 + 8;
            uint _1760 = uint(int(uint(_1758) >> uint(2)));
            float _1762 = as_type<float>(_dmw12.z);
            int _1764 = _1666 + 12;
            uint _1766 = uint(int(uint(_1764) >> uint(2)));
            float _1768 = as_type<float>(_dmw12.w);
            int _1770 = _1592 + 262208;
            int _1772 = _1592 + 262176;
            uint _1774 = uint(int(uint(_1668) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1774)];
            float _1776 = as_type<float>(_dmw10.x);
            int _1778 = _1668 + 4;
            uint _1780 = uint(int(uint(_1778) >> uint(2)));
            float _1782 = as_type<float>(_dmw10.y);
            int _1784 = _1668 + 8;
            uint _1786 = uint(int(uint(_1784) >> uint(2)));
            float _1788 = as_type<float>(_dmw10.z);
            int _1790 = _1668 + 12;
            uint _1792 = uint(int(uint(_1790) >> uint(2)));
            float _1794 = as_type<float>(_dmw10.w);
            int _1796 = _1592 + 262224;
            int _1798 = _1592 + 262240;
            uint _1800 = uint(int(uint(_1692) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1800)];
            float _1802 = as_type<float>(_dmw13.x);
            int _1804 = _1692 + 4;
            uint _1806 = uint(int(uint(_1804) >> uint(2)));
            float _1808 = as_type<float>(_dmw13.y);
            int _1810 = _1692 + 8;
            uint _1812 = uint(int(uint(_1810) >> uint(2)));
            float _1814 = as_type<float>(_dmw13.z);
            int _1816 = _1692 + 12;
            uint _1818 = uint(int(uint(_1816) >> uint(2)));
            float _1820 = as_type<float>(_dmw13.w);
            int _1822 = _1592 + 262256;
            uint _1824 = uint(int(uint(_1694) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1824)];
            float _1826 = as_type<float>(_dmw14.x);
            int _1828 = _1694 + 4;
            uint _1830 = uint(int(uint(_1828) >> uint(2)));
            float _1832 = as_type<float>(_dmw14.y);
            int _1834 = _1694 + 8;
            uint _1836 = uint(int(uint(_1834) >> uint(2)));
            float _1838 = as_type<float>(_dmw14.z);
            int _1840 = _1694 + 12;
            uint _1842 = uint(int(uint(_1840) >> uint(2)));
            float _1844 = as_type<float>(_dmw14.w);
            uint _1846 = uint(int(uint(_1718) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1846)];
            float _1848 = as_type<float>(_dmw15.x);
            int _1850 = _1718 + 4;
            uint _1852 = uint(int(uint(_1850) >> uint(2)));
            float _1854 = as_type<float>(_dmw15.y);
            int _1856 = _1718 + 8;
            uint _1858 = uint(int(uint(_1856) >> uint(2)));
            float _1860 = as_type<float>(_dmw15.z);
            int _1862 = _1718 + 12;
            uint _1864 = uint(int(uint(_1862) >> uint(2)));
            float _1866 = as_type<float>(_dmw15.w);
            uint _1868 = uint(int(uint(_1720) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1868)];
            float _1870 = as_type<float>(_dmw16.x);
            int _1872 = _1720 + 4;
            uint _1874 = uint(int(uint(_1872) >> uint(2)));
            float _1876 = as_type<float>(_dmw16.y);
            int _1878 = _1720 + 8;
            uint _1880 = uint(int(uint(_1878) >> uint(2)));
            float _1882 = as_type<float>(_dmw16.z);
            int _1884 = _1720 + 12;
            uint _1886 = uint(int(uint(_1884) >> uint(2)));
            float _1888 = as_type<float>(_dmw16.w);
            uint _1890 = uint(int(uint(_1744) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1890)];
            float _1892 = as_type<float>(_dmw19.x);
            int _1894 = _1744 + 4;
            uint _1896 = uint(int(uint(_1894) >> uint(2)));
            float _1898 = as_type<float>(_dmw19.y);
            int _1900 = _1744 + 8;
            uint _1902 = uint(int(uint(_1900) >> uint(2)));
            float _1904 = as_type<float>(_dmw19.z);
            int _1906 = _1744 + 12;
            uint _1908 = uint(int(uint(_1906) >> uint(2)));
            float _1910 = as_type<float>(_dmw19.w);
            uint _1912 = uint(int(uint(_1746) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1912)];
            float _1914 = as_type<float>(_dmw17.x);
            int _1916 = _1746 + 4;
            uint _1918 = uint(int(uint(_1916) >> uint(2)));
            float _1920 = as_type<float>(_dmw17.y);
            int _1922 = _1746 + 8;
            uint _1924 = uint(int(uint(_1922) >> uint(2)));
            float _1926 = as_type<float>(_dmw17.z);
            int _1928 = _1746 + 12;
            uint _1930 = uint(int(uint(_1928) >> uint(2)));
            float _1932 = as_type<float>(_dmw17.w);
            uint _1934 = uint(int(uint(_1770) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1934)];
            float _1936 = as_type<float>(_dmw20.x);
            int _1938 = _1770 + 4;
            uint _1940 = uint(int(uint(_1938) >> uint(2)));
            float _1942 = as_type<float>(_dmw20.y);
            int _1944 = _1770 + 8;
            uint _1946 = uint(int(uint(_1944) >> uint(2)));
            float _1948 = as_type<float>(_dmw20.z);
            int _1950 = _1770 + 12;
            uint _1952 = uint(int(uint(_1950) >> uint(2)));
            float _1954 = as_type<float>(_dmw20.w);
            uint _1956 = uint(int(uint(_1772) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1956)];
            float _1958 = as_type<float>(_dmw18.x);
            int _1960 = _1772 + 4;
            uint _1962 = uint(int(uint(_1960) >> uint(2)));
            float _1964 = as_type<float>(_dmw18.y);
            int _1966 = _1772 + 8;
            uint _1968 = uint(int(uint(_1966) >> uint(2)));
            float _1970 = as_type<float>(_dmw18.z);
            int _1972 = _1772 + 12;
            uint _1974 = uint(int(uint(_1972) >> uint(2)));
            float _1976 = as_type<float>(_dmw18.w);
            uint _1978 = uint(int(uint(_1796) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1978)];
            float _1980 = as_type<float>(_dmw21.x);
            int _1982 = _1796 + 4;
            uint _1984 = uint(int(uint(_1982) >> uint(2)));
            float _1986 = as_type<float>(_dmw21.y);
            int _1988 = _1796 + 8;
            uint _1990 = uint(int(uint(_1988) >> uint(2)));
            float _1992 = as_type<float>(_dmw21.z);
            int _1994 = _1796 + 12;
            uint _1996 = uint(int(uint(_1994) >> uint(2)));
            float _1998 = as_type<float>(_dmw21.w);
            uint _2000 = uint(int(uint(_1798) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2000)];
            float _2002 = as_type<float>(_dmw22.x);
            int _2004 = _1798 + 4;
            uint _2006 = uint(int(uint(_2004) >> uint(2)));
            float _2008 = as_type<float>(_dmw22.y);
            int _2010 = _1798 + 8;
            uint _2012 = uint(int(uint(_2010) >> uint(2)));
            float _2014 = as_type<float>(_dmw22.z);
            int _2016 = _1798 + 12;
            uint _2018 = uint(int(uint(_2016) >> uint(2)));
            float _2020 = as_type<float>(_dmw22.w);
            uint _2022 = uint(int(uint(_1822) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2022)];
            float _2024 = as_type<float>(_dmw23.x);
            int _2026 = _1822 + 4;
            uint _2028 = uint(int(uint(_2026) >> uint(2)));
            float _2030 = as_type<float>(_dmw23.y);
            int _2032 = _1822 + 8;
            uint _2034 = uint(int(uint(_2032) >> uint(2)));
            float _2036 = as_type<float>(_dmw23.z);
            int _2038 = _1822 + 12;
            uint _2040 = uint(int(uint(_2038) >> uint(2)));
            float _2042 = as_type<float>(_dmw23.w);
            float _2044 = _1306 + (-1.0);
            float _2046 = -_1402;
            float _2048 = -_2044;
            float _2050 = _2046 + _2048;
            float _2052 = -_2050;
            float _2054 = _2052 + 1.0;
            float _2056 = -_1402;
            float _2058 = _2056 + _2054;
            float _2060 = _1402 * _1472;
            float _2062 = _1402 * _1478;
            float _2064 = _1402 * _1484;
            float _2066 = _1402 * _1490;
            float _2068 = _1402 * _1498;
            float _2070 = _1402 * _1504;
            float _2072 = _1402 * _1510;
            float _2074 = _1402 * _1516;
            float _2076 = _1402 * _1522;
            float _2078 = _1402 * _1528;
            float _2080 = _1402 * _1534;
            float _2082 = _1402 * _1540;
            float _2084 = _1402 * _1546;
            float _2086 = _1402 * _1552;
            float _2088 = _1402 * _1558;
            float _2090 = _1402 * _1564;
            float _2092 = _1402 * _1572;
            float _2094 = _1402 * _1578;
            float _2096 = _1402 * _1584;
            float _2098 = _1402 * _1590;
            float _2100 = _1402 * _1596;
            float _2102 = _1402 * _1602;
            float _2104 = _1402 * _1608;
            float _2106 = _1402 * _1614;
            float _2108 = _1402 * _1620;
            float _2110 = _1402 * _1626;
            float _2112 = _1402 * _1632;
            float _2114 = _1402 * _1638;
            float _2116 = _1402 * _1646;
            float _2118 = _1402 * _1652;
            float _2120 = _1402 * _1658;
            float _2122 = _1402 * _1664;
            float _2124 = fma(_2050, _1672, _2060);
            float _2126 = fma(_2050, _1678, _2062);
            float _2128 = fma(_2050, _1684, _2064);
            float _2130 = fma(_2050, _1690, _2066);
            float _2132 = fma(_2050, _1698, _2068);
            float _2134 = fma(_2050, _1704, _2070);
            float _2136 = fma(_2050, _1710, _2072);
            float _2138 = fma(_2050, _1716, _2074);
            float _2140 = fma(_2050, _1724, _2076);
            float _2142 = fma(_2050, _1730, _2078);
            float _2144 = fma(_2050, _1736, _2080);
            float _2146 = fma(_2050, _1742, _2082);
            float _2148 = fma(_2050, _1750, _2084);
            float _2150 = fma(_2050, _1756, _2086);
            float _2152 = fma(_2050, _1762, _2088);
            float _2154 = fma(_2050, _1768, _2090);
            float _2156 = fma(_2050, _1776, _2092);
            float _2158 = fma(_2050, _1782, _2094);
            float _2160 = fma(_2050, _1788, _2096);
            float _2162 = fma(_2050, _1794, _2098);
            float _2164 = fma(_2050, _1802, _2100);
            float _2166 = fma(_2050, _1808, _2102);
            float _2168 = fma(_2050, _1814, _2104);
            float _2170 = fma(_2050, _1820, _2106);
            float _2172 = fma(_2050, _1826, _2108);
            float _2174 = fma(_2050, _1832, _2110);
            float _2176 = fma(_2050, _1838, _2112);
            float _2178 = fma(_2050, _1844, _2114);
            float _2180 = fma(_2050, _1848, _2116);
            float _2182 = fma(_2050, _1854, _2118);
            float _2184 = fma(_2050, _1860, _2120);
            float _2186 = fma(_2050, _1866, _2122);
            float _2188 = fma(_2058, _1870, _2124);
            float _2190 = fma(_2058, _1876, _2126);
            float _2192 = fma(_2058, _1882, _2128);
            float _2194 = fma(_2058, _1888, _2130);
            float _2196 = fma(_2058, _1892, _2132);
            float _2198 = fma(_2058, _1898, _2134);
            float _2200 = fma(_2058, _1904, _2136);
            float _2202 = fma(_2058, _1910, _2138);
            float _2204 = fma(_2058, _1914, _2140);
            float _2206 = fma(_2058, _1920, _2142);
            float _2208 = fma(_2058, _1926, _2144);
            float _2210 = fma(_2058, _1932, _2146);
            float _2212 = fma(_2058, _1936, _2148);
            float _2214 = fma(_2058, _1942, _2150);
            float _2216 = fma(_2058, _1948, _2152);
            float _2218 = fma(_2058, _1954, _2154);
            float _2220 = fma(_2058, _1958, _2156);
            float _2222 = fma(_2058, _1964, _2158);
            float _2224 = fma(_2058, _1970, _2160);
            float _2226 = fma(_2058, _1976, _2162);
            float _2228 = fma(_2058, _1980, _2164);
            float _2230 = fma(_2058, _1986, _2166);
            float _2232 = fma(_2058, _1992, _2168);
            float _2234 = fma(_2058, _1998, _2170);
            float _2236 = fma(_2058, _2002, _2172);
            float _2238 = fma(_2058, _2008, _2174);
            float _2240 = fma(_2058, _2014, _2176);
            float _2242 = fma(_2058, _2020, _2178);
            float _2244 = fma(_2058, _2024, _2180);
            float _2246 = fma(_2058, _2030, _2182);
            float _2248 = fma(_2058, _2036, _2184);
            float _2250 = fma(_2058, _2042, _2186);
            _2252 = _2198;
            _2254 = _2202;
            _2256 = _2212;
            _2258 = _2196;
            _2260 = _2230;
            _2262 = _2232;
            _2264 = _2214;
            _2266 = _2218;
            _2268 = _2234;
            _2270 = _2228;
            _2272 = _2216;
            _2274 = _2200;
            _2276 = _2246;
            _2278 = _2244;
            _2280 = _2194;
            _2282 = _2204;
            _2284 = _2206;
            _2286 = _2238;
            _2288 = _2188;
            _2290 = _2190;
            _2292 = _2192;
            _2294 = _2236;
            _2296 = _2248;
            _2298 = _2208;
            _2300 = _2210;
            _2302 = _2220;
            _2304 = _2240;
            _2306 = _2250;
            _2308 = _2222;
            _2310 = _2224;
            _2312 = _2226;
            _2314 = _2242;
            _2316 = true;
        }
        else
        {
            int _2318 = _1258 * 656;
            int _2320 = _2318 + 262144;
            int _2322 = _2318 + 262192;
            int _2324 = _2318 + 262160;
            uint _2326 = uint(int(uint(_2320) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2326)];
            float _2328 = as_type<float>(_dmw24.x);
            int _2330 = _2320 + 4;
            uint _2332 = uint(int(uint(_2330) >> uint(2)));
            float _2334 = as_type<float>(_dmw24.y);
            int _2336 = _2320 + 8;
            uint _2338 = uint(int(uint(_2336) >> uint(2)));
            float _2340 = as_type<float>(_dmw24.z);
            int _2342 = _2320 + 12;
            uint _2344 = uint(int(uint(_2342) >> uint(2)));
            float _2346 = as_type<float>(_dmw24.w);
            int _2348 = _2318 + 262208;
            int _2350 = _2318 + 262176;
            uint _2352 = uint(int(uint(_2322) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2352)];
            float _2354 = as_type<float>(_dmw27.x);
            int _2356 = _2322 + 4;
            uint _2358 = uint(int(uint(_2356) >> uint(2)));
            float _2360 = as_type<float>(_dmw27.y);
            int _2362 = _2322 + 8;
            uint _2364 = uint(int(uint(_2362) >> uint(2)));
            float _2366 = as_type<float>(_dmw27.z);
            int _2368 = _2322 + 12;
            uint _2370 = uint(int(uint(_2368) >> uint(2)));
            float _2372 = as_type<float>(_dmw27.w);
            int _2374 = _2318 + 262224;
            uint _2376 = uint(int(uint(_2324) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2376)];
            float _2378 = as_type<float>(_dmw25.x);
            int _2380 = _2324 + 4;
            uint _2382 = uint(int(uint(_2380) >> uint(2)));
            float _2384 = as_type<float>(_dmw25.y);
            int _2386 = _2324 + 8;
            uint _2388 = uint(int(uint(_2386) >> uint(2)));
            float _2390 = as_type<float>(_dmw25.z);
            int _2392 = _2324 + 12;
            uint _2394 = uint(int(uint(_2392) >> uint(2)));
            float _2396 = as_type<float>(_dmw25.w);
            int _2398 = _2318 + 262240;
            uint _2400 = uint(int(uint(_2348) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2400)];
            float _2402 = as_type<float>(_dmw28.x);
            int _2404 = _2348 + 4;
            uint _2406 = uint(int(uint(_2404) >> uint(2)));
            float _2408 = as_type<float>(_dmw28.y);
            int _2410 = _2348 + 8;
            uint _2412 = uint(int(uint(_2410) >> uint(2)));
            float _2414 = as_type<float>(_dmw28.z);
            int _2416 = _2348 + 12;
            uint _2418 = uint(int(uint(_2416) >> uint(2)));
            float _2420 = as_type<float>(_dmw28.w);
            int _2422 = _2318 + 262256;
            int _2424 = _1440 * 656;
            uint _2426 = uint(int(uint(_2350) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2426)];
            float _2428 = as_type<float>(_dmw26.x);
            int _2430 = _2350 + 4;
            uint _2432 = uint(int(uint(_2430) >> uint(2)));
            float _2434 = as_type<float>(_dmw26.y);
            int _2436 = _2350 + 8;
            uint _2438 = uint(int(uint(_2436) >> uint(2)));
            float _2440 = as_type<float>(_dmw26.z);
            int _2442 = _2350 + 12;
            uint _2444 = uint(int(uint(_2442) >> uint(2)));
            float _2446 = as_type<float>(_dmw26.w);
            uint _2448 = uint(int(uint(_2374) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2448)];
            float _2450 = as_type<float>(_dmw29.x);
            int _2452 = _2374 + 4;
            uint _2454 = uint(int(uint(_2452) >> uint(2)));
            float _2456 = as_type<float>(_dmw29.y);
            int _2458 = _2374 + 8;
            uint _2460 = uint(int(uint(_2458) >> uint(2)));
            float _2462 = as_type<float>(_dmw29.z);
            int _2464 = _2374 + 12;
            uint _2466 = uint(int(uint(_2464) >> uint(2)));
            float _2468 = as_type<float>(_dmw29.w);
            int _2470 = _1242 * 656;
            uint _2472 = uint(int(uint(_2398) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2472)];
            float _2474 = as_type<float>(_dmw30.x);
            int _2476 = _2398 + 4;
            uint _2478 = uint(int(uint(_2476) >> uint(2)));
            float _2480 = as_type<float>(_dmw30.y);
            int _2482 = _2398 + 8;
            uint _2484 = uint(int(uint(_2482) >> uint(2)));
            float _2486 = as_type<float>(_dmw30.z);
            int _2488 = _2398 + 12;
            uint _2490 = uint(int(uint(_2488) >> uint(2)));
            float _2492 = as_type<float>(_dmw30.w);
            int _2494 = _2424 + 262144;
            int _2496 = _2424 + 262192;
            uint _2498 = uint(int(uint(_2422) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2498)];
            float _2500 = as_type<float>(_dmw31.x);
            int _2502 = _2422 + 4;
            uint _2504 = uint(int(uint(_2502) >> uint(2)));
            float _2506 = as_type<float>(_dmw31.y);
            int _2508 = _2422 + 8;
            uint _2510 = uint(int(uint(_2508) >> uint(2)));
            float _2512 = as_type<float>(_dmw31.z);
            int _2514 = _2422 + 12;
            uint _2516 = uint(int(uint(_2514) >> uint(2)));
            float _2518 = as_type<float>(_dmw31.w);
            int _2520 = _2424 + 262160;
            int _2522 = _2424 + 262208;
            uint _2524 = uint(int(uint(_2494) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2524)];
            float _2526 = as_type<float>(_dmw32.x);
            int _2528 = _2494 + 4;
            uint _2530 = uint(int(uint(_2528) >> uint(2)));
            float _2532 = as_type<float>(_dmw32.y);
            int _2534 = _2494 + 8;
            uint _2536 = uint(int(uint(_2534) >> uint(2)));
            float _2538 = as_type<float>(_dmw32.z);
            int _2540 = _2494 + 12;
            uint _2542 = uint(int(uint(_2540) >> uint(2)));
            float _2544 = as_type<float>(_dmw32.w);
            int _2546 = _2424 + 262176;
            int _2548 = _2424 + 262224;
            uint _2550 = uint(int(uint(_2496) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2550)];
            float _2552 = as_type<float>(_dmw35.x);
            int _2554 = _2496 + 4;
            uint _2556 = uint(int(uint(_2554) >> uint(2)));
            float _2558 = as_type<float>(_dmw35.y);
            int _2560 = _2496 + 8;
            uint _2562 = uint(int(uint(_2560) >> uint(2)));
            float _2564 = as_type<float>(_dmw35.z);
            int _2566 = _2496 + 12;
            uint _2568 = uint(int(uint(_2566) >> uint(2)));
            float _2570 = as_type<float>(_dmw35.w);
            int _2572 = _2424 + 262240;
            int _2574 = _2424 + 262256;
            uint _2576 = uint(int(uint(_2520) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2576)];
            float _2578 = as_type<float>(_dmw33.x);
            int _2580 = _2520 + 4;
            uint _2582 = uint(int(uint(_2580) >> uint(2)));
            float _2584 = as_type<float>(_dmw33.y);
            int _2586 = _2520 + 8;
            uint _2588 = uint(int(uint(_2586) >> uint(2)));
            float _2590 = as_type<float>(_dmw33.z);
            int _2592 = _2520 + 12;
            uint _2594 = uint(int(uint(_2592) >> uint(2)));
            float _2596 = as_type<float>(_dmw33.w);
            int _2598 = _2470 + 262144;
            int _2600 = _2470 + 262192;
            uint _2602 = uint(int(uint(_2522) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2602)];
            float _2604 = as_type<float>(_dmw36.x);
            int _2606 = _2522 + 4;
            uint _2608 = uint(int(uint(_2606) >> uint(2)));
            float _2610 = as_type<float>(_dmw36.y);
            int _2612 = _2522 + 8;
            uint _2614 = uint(int(uint(_2612) >> uint(2)));
            float _2616 = as_type<float>(_dmw36.z);
            int _2618 = _2522 + 12;
            uint _2620 = uint(int(uint(_2618) >> uint(2)));
            float _2622 = as_type<float>(_dmw36.w);
            int _2624 = _2470 + 262160;
            int _2626 = _2470 + 262208;
            uint _2628 = uint(int(uint(_2546) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2628)];
            float _2630 = as_type<float>(_dmw34.x);
            int _2632 = _2546 + 4;
            uint _2634 = uint(int(uint(_2632) >> uint(2)));
            float _2636 = as_type<float>(_dmw34.y);
            int _2638 = _2546 + 8;
            uint _2640 = uint(int(uint(_2638) >> uint(2)));
            float _2642 = as_type<float>(_dmw34.z);
            int _2644 = _2546 + 12;
            uint _2646 = uint(int(uint(_2644) >> uint(2)));
            float _2648 = as_type<float>(_dmw34.w);
            int _2650 = _2470 + 262176;
            int _2652 = _2470 + 262224;
            uint _2654 = uint(int(uint(_2548) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2654)];
            float _2656 = as_type<float>(_dmw37.x);
            int _2658 = _2548 + 4;
            uint _2660 = uint(int(uint(_2658) >> uint(2)));
            float _2662 = as_type<float>(_dmw37.y);
            int _2664 = _2548 + 8;
            uint _2666 = uint(int(uint(_2664) >> uint(2)));
            float _2668 = as_type<float>(_dmw37.z);
            int _2670 = _2548 + 12;
            uint _2672 = uint(int(uint(_2670) >> uint(2)));
            float _2674 = as_type<float>(_dmw37.w);
            int _2676 = _2470 + 262240;
            int _2678 = _2470 + 262256;
            uint _2680 = uint(int(uint(_2572) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2680)];
            float _2682 = as_type<float>(_dmw38.x);
            int _2684 = _2572 + 4;
            uint _2686 = uint(int(uint(_2684) >> uint(2)));
            float _2688 = as_type<float>(_dmw38.y);
            int _2690 = _2572 + 8;
            uint _2692 = uint(int(uint(_2690) >> uint(2)));
            float _2694 = as_type<float>(_dmw38.z);
            int _2696 = _2572 + 12;
            uint _2698 = uint(int(uint(_2696) >> uint(2)));
            float _2700 = as_type<float>(_dmw38.w);
            uint _2702 = uint(int(uint(_2574) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2702)];
            float _2704 = as_type<float>(_dmw39.x);
            int _2706 = _2574 + 4;
            uint _2708 = uint(int(uint(_2706) >> uint(2)));
            float _2710 = as_type<float>(_dmw39.y);
            int _2712 = _2574 + 8;
            uint _2714 = uint(int(uint(_2712) >> uint(2)));
            float _2716 = as_type<float>(_dmw39.z);
            int _2718 = _2574 + 12;
            uint _2720 = uint(int(uint(_2718) >> uint(2)));
            float _2722 = as_type<float>(_dmw39.w);
            uint _2724 = uint(int(uint(_2598) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2724)];
            float _2726 = as_type<float>(_dmw40.x);
            int _2728 = _2598 + 4;
            uint _2730 = uint(int(uint(_2728) >> uint(2)));
            float _2732 = as_type<float>(_dmw40.y);
            int _2734 = _2598 + 8;
            uint _2736 = uint(int(uint(_2734) >> uint(2)));
            float _2738 = as_type<float>(_dmw40.z);
            int _2740 = _2598 + 12;
            uint _2742 = uint(int(uint(_2740) >> uint(2)));
            float _2744 = as_type<float>(_dmw40.w);
            uint _2746 = uint(int(uint(_2600) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2746)];
            float _2748 = as_type<float>(_dmw43.x);
            int _2750 = _2600 + 4;
            uint _2752 = uint(int(uint(_2750) >> uint(2)));
            float _2754 = as_type<float>(_dmw43.y);
            int _2756 = _2600 + 8;
            uint _2758 = uint(int(uint(_2756) >> uint(2)));
            float _2760 = as_type<float>(_dmw43.z);
            int _2762 = _2600 + 12;
            uint _2764 = uint(int(uint(_2762) >> uint(2)));
            float _2766 = as_type<float>(_dmw43.w);
            uint _2768 = uint(int(uint(_2624) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2768)];
            float _2770 = as_type<float>(_dmw41.x);
            int _2772 = _2624 + 4;
            uint _2774 = uint(int(uint(_2772) >> uint(2)));
            float _2776 = as_type<float>(_dmw41.y);
            int _2778 = _2624 + 8;
            uint _2780 = uint(int(uint(_2778) >> uint(2)));
            float _2782 = as_type<float>(_dmw41.z);
            int _2784 = _2624 + 12;
            uint _2786 = uint(int(uint(_2784) >> uint(2)));
            float _2788 = as_type<float>(_dmw41.w);
            uint _2790 = uint(int(uint(_2626) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2790)];
            float _2792 = as_type<float>(_dmw44.x);
            int _2794 = _2626 + 4;
            uint _2796 = uint(int(uint(_2794) >> uint(2)));
            float _2798 = as_type<float>(_dmw44.y);
            int _2800 = _2626 + 8;
            uint _2802 = uint(int(uint(_2800) >> uint(2)));
            float _2804 = as_type<float>(_dmw44.z);
            int _2806 = _2626 + 12;
            uint _2808 = uint(int(uint(_2806) >> uint(2)));
            float _2810 = as_type<float>(_dmw44.w);
            uint _2812 = uint(int(uint(_2650) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2812)];
            float _2814 = as_type<float>(_dmw42.x);
            int _2816 = _2650 + 4;
            uint _2818 = uint(int(uint(_2816) >> uint(2)));
            float _2820 = as_type<float>(_dmw42.y);
            int _2822 = _2650 + 8;
            uint _2824 = uint(int(uint(_2822) >> uint(2)));
            float _2826 = as_type<float>(_dmw42.z);
            int _2828 = _2650 + 12;
            uint _2830 = uint(int(uint(_2828) >> uint(2)));
            float _2832 = as_type<float>(_dmw42.w);
            uint _2834 = uint(int(uint(_2652) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2834)];
            float _2836 = as_type<float>(_dmw45.x);
            int _2838 = _2652 + 4;
            uint _2840 = uint(int(uint(_2838) >> uint(2)));
            float _2842 = as_type<float>(_dmw45.y);
            int _2844 = _2652 + 8;
            uint _2846 = uint(int(uint(_2844) >> uint(2)));
            float _2848 = as_type<float>(_dmw45.z);
            int _2850 = _2652 + 12;
            uint _2852 = uint(int(uint(_2850) >> uint(2)));
            float _2854 = as_type<float>(_dmw45.w);
            uint _2856 = uint(int(uint(_2676) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2856)];
            float _2858 = as_type<float>(_dmw46.x);
            int _2860 = _2676 + 4;
            uint _2862 = uint(int(uint(_2860) >> uint(2)));
            float _2864 = as_type<float>(_dmw46.y);
            int _2866 = _2676 + 8;
            uint _2868 = uint(int(uint(_2866) >> uint(2)));
            float _2870 = as_type<float>(_dmw46.z);
            int _2872 = _2676 + 12;
            uint _2874 = uint(int(uint(_2872) >> uint(2)));
            float _2876 = as_type<float>(_dmw46.w);
            uint _2878 = uint(int(uint(_2678) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2878)];
            float _2880 = as_type<float>(_dmw47.x);
            int _2882 = _2678 + 4;
            uint _2884 = uint(int(uint(_2882) >> uint(2)));
            float _2886 = as_type<float>(_dmw47.y);
            int _2888 = _2678 + 8;
            uint _2890 = uint(int(uint(_2888) >> uint(2)));
            float _2892 = as_type<float>(_dmw47.z);
            int _2894 = _2678 + 12;
            uint _2896 = uint(int(uint(_2894) >> uint(2)));
            float _2898 = as_type<float>(_dmw47.w);
            float _2900 = _1402 + (-1.0);
            float _2902 = -_2900;
            float _2904 = _2328 * _2902;
            float _2906 = -_2900;
            float _2908 = _2346 * _2906;
            float _2910 = -_2900;
            float _2912 = _2334 * _2910;
            float _2914 = -_2900;
            float _2916 = _2340 * _2914;
            float _2918 = -_2900;
            float _2920 = _2354 * _2918;
            float _2922 = -_2900;
            float _2924 = _2372 * _2922;
            float _2926 = -_2900;
            float _2928 = _2360 * _2926;
            float _2930 = -_2900;
            float _2932 = _2366 * _2930;
            float _2934 = -_2900;
            float _2936 = _2378 * _2934;
            float _2938 = -_2900;
            float _2940 = _2396 * _2938;
            float _2942 = -_2900;
            float _2944 = _2384 * _2942;
            float _2946 = -_2900;
            float _2948 = _2390 * _2946;
            float _2950 = -_2900;
            float _2952 = _2402 * _2950;
            float _2954 = -_2900;
            float _2956 = _2420 * _2954;
            float _2958 = -_2900;
            float _2960 = _2408 * _2958;
            float _2962 = -_2900;
            float _2964 = _2414 * _2962;
            float _2966 = -_2900;
            float _2968 = _2428 * _2966;
            float _2970 = -_2900;
            float _2972 = _2446 * _2970;
            float _2974 = -_2900;
            float _2976 = _2434 * _2974;
            float _2978 = -_2900;
            float _2980 = _2440 * _2978;
            float _2982 = -_2900;
            float _2984 = _2450 * _2982;
            float _2986 = -_2900;
            float _2988 = _2468 * _2986;
            float _2990 = -_2900;
            float _2992 = _2456 * _2990;
            float _2994 = -_2900;
            float _2996 = _2462 * _2994;
            float _2998 = -_2900;
            float _3000 = _2474 * _2998;
            float _3002 = -_2900;
            float _3004 = _2492 * _3002;
            float _3006 = -_2900;
            float _3008 = _2480 * _3006;
            float _3010 = -_2900;
            float _3012 = _2486 * _3010;
            float _3014 = -_2900;
            float _3016 = _2500 * _3014;
            float _3018 = -_2900;
            float _3020 = _2506 * _3018;
            float _3022 = -_2900;
            float _3024 = _2512 * _3022;
            float _3026 = _1306 + (-1.0);
            float _3028 = -_2900;
            float _3030 = _2518 * _3028;
            float _3032 = _1306 + _2900;
            float _3034 = -_3026;
            float _3036 = fma(_3034, _2526, _2904);
            float _3038 = -_3026;
            float _3040 = fma(_3038, _2532, _2912);
            float _3042 = -_3026;
            float _3044 = fma(_3042, _2538, _2916);
            float _3046 = -_3026;
            float _3048 = fma(_3046, _2544, _2908);
            float _3050 = -_3026;
            float _3052 = fma(_3050, _2552, _2920);
            float _3054 = -_3026;
            float _3056 = fma(_3054, _2558, _2928);
            float _3058 = -_3026;
            float _3060 = fma(_3058, _2564, _2932);
            float _3062 = -_3026;
            float _3064 = fma(_3062, _2570, _2924);
            float _3066 = -_3026;
            float _3068 = fma(_3066, _2578, _2936);
            float _3070 = -_3026;
            float _3072 = fma(_3070, _2584, _2944);
            float _3074 = -_3026;
            float _3076 = fma(_3074, _2590, _2948);
            float _3078 = -_3026;
            float _3080 = fma(_3078, _2596, _2940);
            float _3082 = -_3026;
            float _3084 = fma(_3082, _2604, _2952);
            float _3086 = -_3026;
            float _3088 = fma(_3086, _2610, _2960);
            float _3090 = -_3026;
            float _3092 = fma(_3090, _2616, _2964);
            float _3094 = -_3026;
            float _3096 = fma(_3094, _2622, _2956);
            float _3098 = -_3026;
            float _3100 = fma(_3098, _2630, _2968);
            float _3102 = -_3026;
            float _3104 = fma(_3102, _2636, _2976);
            float _3106 = -_3026;
            float _3108 = fma(_3106, _2642, _2980);
            float _3110 = -_3026;
            float _3112 = fma(_3110, _2648, _2972);
            float _3114 = -_3026;
            float _3116 = fma(_3114, _2656, _2984);
            float _3118 = -_3026;
            float _3120 = fma(_3118, _2662, _2992);
            float _3122 = -_3026;
            float _3124 = fma(_3122, _2668, _2996);
            float _3126 = -_3026;
            float _3128 = fma(_3126, _2674, _2988);
            float _3130 = -_3026;
            float _3132 = fma(_3130, _2682, _3000);
            float _3134 = -_3026;
            float _3136 = fma(_3134, _2688, _3008);
            float _3138 = -_3026;
            float _3140 = fma(_3138, _2694, _3012);
            float _3142 = -_3026;
            float _3144 = fma(_3142, _2700, _3004);
            float _3146 = -_3026;
            float _3148 = fma(_3146, _2704, _3016);
            float _3150 = -_3026;
            float _3152 = fma(_3150, _2710, _3020);
            float _3154 = -_3026;
            float _3156 = fma(_3154, _2716, _3024);
            float _3158 = -_3026;
            float _3160 = fma(_3158, _2722, _3030);
            float _3162 = fma(_3032, _2726, _3036);
            float _3164 = fma(_3032, _2732, _3040);
            float _3166 = fma(_3032, _2738, _3044);
            float _3168 = fma(_3032, _2744, _3048);
            float _3170 = fma(_3032, _2748, _3052);
            float _3172 = fma(_3032, _2754, _3056);
            float _3174 = fma(_3032, _2760, _3060);
            float _3176 = fma(_3032, _2766, _3064);
            float _3178 = fma(_3032, _2770, _3068);
            float _3180 = fma(_3032, _2776, _3072);
            float _3182 = fma(_3032, _2782, _3076);
            float _3184 = fma(_3032, _2788, _3080);
            float _3186 = fma(_3032, _2792, _3084);
            float _3188 = fma(_3032, _2798, _3088);
            float _3190 = fma(_3032, _2804, _3092);
            float _3192 = fma(_3032, _2810, _3096);
            float _3194 = fma(_3032, _2814, _3100);
            float _3196 = fma(_3032, _2820, _3104);
            float _3198 = fma(_3032, _2826, _3108);
            float _3200 = fma(_3032, _2832, _3112);
            float _3202 = fma(_3032, _2836, _3116);
            float _3204 = fma(_3032, _2842, _3120);
            float _3206 = fma(_3032, _2848, _3124);
            float _3208 = fma(_3032, _2854, _3128);
            float _3210 = fma(_3032, _2858, _3132);
            float _3212 = fma(_3032, _2864, _3136);
            float _3214 = fma(_3032, _2870, _3140);
            float _3216 = fma(_3032, _2876, _3144);
            float _3218 = fma(_3032, _2880, _3148);
            float _3220 = fma(_3032, _2886, _3152);
            float _3222 = fma(_3032, _2892, _3156);
            float _3224 = fma(_3032, _2898, _3160);
            _2252 = _3172;
            _2254 = _3176;
            _2256 = _3186;
            _2258 = _3170;
            _2260 = _3204;
            _2262 = _3206;
            _2264 = _3188;
            _2266 = _3192;
            _2268 = _3208;
            _2270 = _3202;
            _2272 = _3190;
            _2274 = _3174;
            _2276 = _3220;
            _2278 = _3218;
            _2280 = _3168;
            _2282 = _3178;
            _2284 = _3180;
            _2286 = _3212;
            _2288 = _3162;
            _2290 = _3164;
            _2292 = _3166;
            _2294 = _3210;
            _2296 = _3222;
            _2298 = _3182;
            _2300 = _3184;
            _2302 = _3194;
            _2304 = _3214;
            _2306 = _3224;
            _2308 = _3196;
            _2310 = _3198;
            _2312 = _3200;
            _2314 = _3216;
            _2316 = true;
        }
    }
    else
    {
        float _3226 = _1306 * (-0.707106769084930419921875);
        float _3228 = _1402 + (-1.0);
        float _3230 = fma(_1402, 0.707106769084930419921875, _3226);
        bool _3232 = _3230 >= 0.0;
        float _3234 = _1306 + (-1.0);
        bool _3236 = !_3232;
        if (!_3236)
        {
            int _3238 = _1440 * 656;
            int _3240 = _3238 + 262144;
            int _3242 = _3238 + 262192;
            int _3244 = _3238 + 262160;
            uint _3246 = uint(int(uint(_3240) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3246)];
            float _3248 = as_type<float>(_dmw48.x);
            int _3250 = _3240 + 4;
            uint _3252 = uint(int(uint(_3250) >> uint(2)));
            float _3254 = as_type<float>(_dmw48.y);
            int _3256 = _3240 + 8;
            uint _3258 = uint(int(uint(_3256) >> uint(2)));
            float _3260 = as_type<float>(_dmw48.z);
            int _3262 = _3240 + 12;
            uint _3264 = uint(int(uint(_3262) >> uint(2)));
            float _3266 = as_type<float>(_dmw48.w);
            int _3268 = _3238 + 262208;
            int _3270 = _3238 + 262176;
            uint _3272 = uint(int(uint(_3242) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3272)];
            float _3274 = as_type<float>(_dmw51.x);
            int _3276 = _3242 + 4;
            uint _3278 = uint(int(uint(_3276) >> uint(2)));
            float _3280 = as_type<float>(_dmw51.y);
            int _3282 = _3242 + 8;
            uint _3284 = uint(int(uint(_3282) >> uint(2)));
            float _3286 = as_type<float>(_dmw51.z);
            int _3288 = _3242 + 12;
            uint _3290 = uint(int(uint(_3288) >> uint(2)));
            float _3292 = as_type<float>(_dmw51.w);
            int _3294 = _3238 + 262224;
            uint _3296 = uint(int(uint(_3244) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3296)];
            float _3298 = as_type<float>(_dmw49.x);
            int _3300 = _3244 + 4;
            uint _3302 = uint(int(uint(_3300) >> uint(2)));
            float _3304 = as_type<float>(_dmw49.y);
            int _3306 = _3244 + 8;
            uint _3308 = uint(int(uint(_3306) >> uint(2)));
            float _3310 = as_type<float>(_dmw49.z);
            int _3312 = _3244 + 12;
            uint _3314 = uint(int(uint(_3312) >> uint(2)));
            float _3316 = as_type<float>(_dmw49.w);
            int _3318 = _3238 + 262240;
            int _3320 = _1196 * 656;
            uint _3322 = uint(int(uint(_3268) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3322)];
            float _3324 = as_type<float>(_dmw52.x);
            int _3326 = _3268 + 4;
            uint _3328 = uint(int(uint(_3326) >> uint(2)));
            float _3330 = as_type<float>(_dmw52.y);
            int _3332 = _3268 + 8;
            uint _3334 = uint(int(uint(_3332) >> uint(2)));
            float _3336 = as_type<float>(_dmw52.z);
            int _3338 = _3268 + 12;
            uint _3340 = uint(int(uint(_3338) >> uint(2)));
            float _3342 = as_type<float>(_dmw52.w);
            int _3344 = _3238 + 262256;
            uint _3346 = uint(int(uint(_3270) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3346)];
            float _3348 = as_type<float>(_dmw50.x);
            int _3350 = _3270 + 4;
            uint _3352 = uint(int(uint(_3350) >> uint(2)));
            float _3354 = as_type<float>(_dmw50.y);
            int _3356 = _3270 + 8;
            uint _3358 = uint(int(uint(_3356) >> uint(2)));
            float _3360 = as_type<float>(_dmw50.z);
            int _3362 = _3270 + 12;
            uint _3364 = uint(int(uint(_3362) >> uint(2)));
            float _3366 = as_type<float>(_dmw50.w);
            int _3368 = _1242 * 656;
            uint _3370 = uint(int(uint(_3294) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3370)];
            float _3372 = as_type<float>(_dmw53.x);
            int _3374 = _3294 + 4;
            uint _3376 = uint(int(uint(_3374) >> uint(2)));
            float _3378 = as_type<float>(_dmw53.y);
            int _3380 = _3294 + 8;
            uint _3382 = uint(int(uint(_3380) >> uint(2)));
            float _3384 = as_type<float>(_dmw53.z);
            int _3386 = _3294 + 12;
            uint _3388 = uint(int(uint(_3386) >> uint(2)));
            float _3390 = as_type<float>(_dmw53.w);
            int _3392 = _3320 + 262144;
            int _3394 = _3320 + 262192;
            uint _3396 = uint(int(uint(_3318) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3396)];
            float _3398 = as_type<float>(_dmw54.x);
            int _3400 = _3318 + 4;
            uint _3402 = uint(int(uint(_3400) >> uint(2)));
            float _3404 = as_type<float>(_dmw54.y);
            int _3406 = _3318 + 8;
            uint _3408 = uint(int(uint(_3406) >> uint(2)));
            float _3410 = as_type<float>(_dmw54.z);
            int _3412 = _3318 + 12;
            uint _3414 = uint(int(uint(_3412) >> uint(2)));
            float _3416 = as_type<float>(_dmw54.w);
            int _3418 = _3320 + 262160;
            int _3420 = _3320 + 262208;
            uint _3422 = uint(int(uint(_3344) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3422)];
            float _3424 = as_type<float>(_dmw55.x);
            int _3426 = _3344 + 4;
            uint _3428 = uint(int(uint(_3426) >> uint(2)));
            float _3430 = as_type<float>(_dmw55.y);
            int _3432 = _3344 + 8;
            uint _3434 = uint(int(uint(_3432) >> uint(2)));
            float _3436 = as_type<float>(_dmw55.z);
            int _3438 = _3344 + 12;
            uint _3440 = uint(int(uint(_3438) >> uint(2)));
            float _3442 = as_type<float>(_dmw55.w);
            int _3444 = _3320 + 262176;
            int _3446 = _3320 + 262224;
            uint _3448 = uint(int(uint(_3392) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3448)];
            float _3450 = as_type<float>(_dmw56.x);
            int _3452 = _3392 + 4;
            uint _3454 = uint(int(uint(_3452) >> uint(2)));
            float _3456 = as_type<float>(_dmw56.y);
            int _3458 = _3392 + 8;
            uint _3460 = uint(int(uint(_3458) >> uint(2)));
            float _3462 = as_type<float>(_dmw56.z);
            int _3464 = _3392 + 12;
            uint _3466 = uint(int(uint(_3464) >> uint(2)));
            float _3468 = as_type<float>(_dmw56.w);
            int _3470 = _3320 + 262240;
            int _3472 = _3320 + 262256;
            uint _3474 = uint(int(uint(_3394) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3474)];
            float _3476 = as_type<float>(_dmw59.x);
            int _3478 = _3394 + 4;
            uint _3480 = uint(int(uint(_3478) >> uint(2)));
            float _3482 = as_type<float>(_dmw59.y);
            int _3484 = _3394 + 8;
            uint _3486 = uint(int(uint(_3484) >> uint(2)));
            float _3488 = as_type<float>(_dmw59.z);
            int _3490 = _3394 + 12;
            uint _3492 = uint(int(uint(_3490) >> uint(2)));
            float _3494 = as_type<float>(_dmw59.w);
            int _3496 = _3368 + 262144;
            int _3498 = _3368 + 262192;
            uint _3500 = uint(int(uint(_3418) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3500)];
            float _3502 = as_type<float>(_dmw57.x);
            int _3504 = _3418 + 4;
            uint _3506 = uint(int(uint(_3504) >> uint(2)));
            float _3508 = as_type<float>(_dmw57.y);
            int _3510 = _3418 + 8;
            uint _3512 = uint(int(uint(_3510) >> uint(2)));
            float _3514 = as_type<float>(_dmw57.z);
            int _3516 = _3418 + 12;
            uint _3518 = uint(int(uint(_3516) >> uint(2)));
            float _3520 = as_type<float>(_dmw57.w);
            int _3522 = _3368 + 262160;
            int _3524 = _3368 + 262208;
            uint _3526 = uint(int(uint(_3420) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3526)];
            float _3528 = as_type<float>(_dmw60.x);
            int _3530 = _3420 + 4;
            uint _3532 = uint(int(uint(_3530) >> uint(2)));
            float _3534 = as_type<float>(_dmw60.y);
            int _3536 = _3420 + 8;
            uint _3538 = uint(int(uint(_3536) >> uint(2)));
            float _3540 = as_type<float>(_dmw60.z);
            int _3542 = _3420 + 12;
            uint _3544 = uint(int(uint(_3542) >> uint(2)));
            float _3546 = as_type<float>(_dmw60.w);
            int _3548 = _3368 + 262176;
            int _3550 = _3368 + 262224;
            uint _3552 = uint(int(uint(_3444) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3552)];
            float _3554 = as_type<float>(_dmw58.x);
            int _3556 = _3444 + 4;
            uint _3558 = uint(int(uint(_3556) >> uint(2)));
            float _3560 = as_type<float>(_dmw58.y);
            int _3562 = _3444 + 8;
            uint _3564 = uint(int(uint(_3562) >> uint(2)));
            float _3566 = as_type<float>(_dmw58.z);
            int _3568 = _3444 + 12;
            uint _3570 = uint(int(uint(_3568) >> uint(2)));
            float _3572 = as_type<float>(_dmw58.w);
            int _3574 = _3368 + 262240;
            int _3576 = _3368 + 262256;
            uint _3578 = uint(int(uint(_3446) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3578)];
            float _3580 = as_type<float>(_dmw61.x);
            int _3582 = _3446 + 4;
            uint _3584 = uint(int(uint(_3582) >> uint(2)));
            float _3586 = as_type<float>(_dmw61.y);
            int _3588 = _3446 + 8;
            uint _3590 = uint(int(uint(_3588) >> uint(2)));
            float _3592 = as_type<float>(_dmw61.z);
            int _3594 = _3446 + 12;
            uint _3596 = uint(int(uint(_3594) >> uint(2)));
            float _3598 = as_type<float>(_dmw61.w);
            uint _3600 = uint(int(uint(_3470) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3600)];
            float _3602 = as_type<float>(_dmw62.x);
            int _3604 = _3470 + 4;
            uint _3606 = uint(int(uint(_3604) >> uint(2)));
            float _3608 = as_type<float>(_dmw62.y);
            int _3610 = _3470 + 8;
            uint _3612 = uint(int(uint(_3610) >> uint(2)));
            float _3614 = as_type<float>(_dmw62.z);
            int _3616 = _3470 + 12;
            uint _3618 = uint(int(uint(_3616) >> uint(2)));
            float _3620 = as_type<float>(_dmw62.w);
            uint _3622 = uint(int(uint(_3472) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3622)];
            float _3624 = as_type<float>(_dmw63.x);
            int _3626 = _3472 + 4;
            uint _3628 = uint(int(uint(_3626) >> uint(2)));
            float _3630 = as_type<float>(_dmw63.y);
            int _3632 = _3472 + 8;
            uint _3634 = uint(int(uint(_3632) >> uint(2)));
            float _3636 = as_type<float>(_dmw63.z);
            int _3638 = _3472 + 12;
            uint _3640 = uint(int(uint(_3638) >> uint(2)));
            float _3642 = as_type<float>(_dmw63.w);
            uint _3644 = uint(int(uint(_3496) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3644)];
            float _3646 = as_type<float>(_dmw64.x);
            int _3648 = _3496 + 4;
            uint _3650 = uint(int(uint(_3648) >> uint(2)));
            float _3652 = as_type<float>(_dmw64.y);
            int _3654 = _3496 + 8;
            uint _3656 = uint(int(uint(_3654) >> uint(2)));
            float _3658 = as_type<float>(_dmw64.z);
            int _3660 = _3496 + 12;
            uint _3662 = uint(int(uint(_3660) >> uint(2)));
            float _3664 = as_type<float>(_dmw64.w);
            uint _3666 = uint(int(uint(_3498) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3666)];
            float _3668 = as_type<float>(_dmw67.x);
            int _3670 = _3498 + 4;
            uint _3672 = uint(int(uint(_3670) >> uint(2)));
            float _3674 = as_type<float>(_dmw67.y);
            int _3676 = _3498 + 8;
            uint _3678 = uint(int(uint(_3676) >> uint(2)));
            float _3680 = as_type<float>(_dmw67.z);
            int _3682 = _3498 + 12;
            uint _3684 = uint(int(uint(_3682) >> uint(2)));
            float _3686 = as_type<float>(_dmw67.w);
            uint _3688 = uint(int(uint(_3522) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3688)];
            float _3690 = as_type<float>(_dmw65.x);
            int _3692 = _3522 + 4;
            uint _3694 = uint(int(uint(_3692) >> uint(2)));
            float _3696 = as_type<float>(_dmw65.y);
            int _3698 = _3522 + 8;
            uint _3700 = uint(int(uint(_3698) >> uint(2)));
            float _3702 = as_type<float>(_dmw65.z);
            int _3704 = _3522 + 12;
            uint _3706 = uint(int(uint(_3704) >> uint(2)));
            float _3708 = as_type<float>(_dmw65.w);
            uint _3710 = uint(int(uint(_3524) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3710)];
            float _3712 = as_type<float>(_dmw68.x);
            int _3714 = _3524 + 4;
            uint _3716 = uint(int(uint(_3714) >> uint(2)));
            float _3718 = as_type<float>(_dmw68.y);
            int _3720 = _3524 + 8;
            uint _3722 = uint(int(uint(_3720) >> uint(2)));
            float _3724 = as_type<float>(_dmw68.z);
            int _3726 = _3524 + 12;
            uint _3728 = uint(int(uint(_3726) >> uint(2)));
            float _3730 = as_type<float>(_dmw68.w);
            uint _3732 = uint(int(uint(_3548) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3732)];
            float _3734 = as_type<float>(_dmw66.x);
            int _3736 = _3548 + 4;
            uint _3738 = uint(int(uint(_3736) >> uint(2)));
            float _3740 = as_type<float>(_dmw66.y);
            int _3742 = _3548 + 8;
            uint _3744 = uint(int(uint(_3742) >> uint(2)));
            float _3746 = as_type<float>(_dmw66.z);
            int _3748 = _3548 + 12;
            uint _3750 = uint(int(uint(_3748) >> uint(2)));
            float _3752 = as_type<float>(_dmw66.w);
            uint _3754 = uint(int(uint(_3550) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3754)];
            float _3756 = as_type<float>(_dmw69.x);
            int _3758 = _3550 + 4;
            uint _3760 = uint(int(uint(_3758) >> uint(2)));
            float _3762 = as_type<float>(_dmw69.y);
            int _3764 = _3550 + 8;
            uint _3766 = uint(int(uint(_3764) >> uint(2)));
            float _3768 = as_type<float>(_dmw69.z);
            int _3770 = _3550 + 12;
            uint _3772 = uint(int(uint(_3770) >> uint(2)));
            float _3774 = as_type<float>(_dmw69.w);
            uint _3776 = uint(int(uint(_3574) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3776)];
            float _3778 = as_type<float>(_dmw70.x);
            int _3780 = _3574 + 4;
            uint _3782 = uint(int(uint(_3780) >> uint(2)));
            float _3784 = as_type<float>(_dmw70.y);
            int _3786 = _3574 + 8;
            uint _3788 = uint(int(uint(_3786) >> uint(2)));
            float _3790 = as_type<float>(_dmw70.z);
            int _3792 = _3574 + 12;
            uint _3794 = uint(int(uint(_3792) >> uint(2)));
            float _3796 = as_type<float>(_dmw70.w);
            uint _3798 = uint(int(uint(_3576) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3798)];
            float _3800 = as_type<float>(_dmw71.x);
            int _3802 = _3576 + 4;
            uint _3804 = uint(int(uint(_3802) >> uint(2)));
            float _3806 = as_type<float>(_dmw71.y);
            int _3808 = _3576 + 8;
            uint _3810 = uint(int(uint(_3808) >> uint(2)));
            float _3812 = as_type<float>(_dmw71.z);
            int _3814 = _3576 + 12;
            uint _3816 = uint(int(uint(_3814) >> uint(2)));
            float _3818 = as_type<float>(_dmw71.w);
            float _3820 = -_3234;
            float _3822 = _3228 + _3820;
            float _3824 = -_3822;
            float _3826 = _1402 + _3824;
            float _3828 = _3248 * _3822;
            float _3830 = _3254 * _3822;
            float _3832 = _3260 * _3822;
            float _3834 = _3266 * _3822;
            float _3836 = _3274 * _3822;
            float _3838 = _3280 * _3822;
            float _3840 = _3286 * _3822;
            float _3842 = _3292 * _3822;
            float _3844 = _3298 * _3822;
            float _3846 = _3304 * _3822;
            float _3848 = _3310 * _3822;
            float _3850 = _3316 * _3822;
            float _3852 = _3324 * _3822;
            float _3854 = _3330 * _3822;
            float _3856 = _3336 * _3822;
            float _3858 = _3342 * _3822;
            float _3860 = _3348 * _3822;
            float _3862 = _3354 * _3822;
            float _3864 = _3360 * _3822;
            float _3866 = _3366 * _3822;
            float _3868 = _3372 * _3822;
            float _3870 = _3378 * _3822;
            float _3872 = _3384 * _3822;
            float _3874 = _3390 * _3822;
            float _3876 = _3398 * _3822;
            float _3878 = _3404 * _3822;
            float _3880 = _3410 * _3822;
            float _3882 = _3416 * _3822;
            float _3884 = _3424 * _3822;
            float _3886 = _3430 * _3822;
            float _3888 = _3436 * _3822;
            float _3890 = _3442 * _3822;
            float _3892 = -_3228;
            float _3894 = fma(_3450, _3892, _3828);
            float _3896 = -_3228;
            float _3898 = fma(_3456, _3896, _3830);
            float _3900 = -_3228;
            float _3902 = fma(_3462, _3900, _3832);
            float _3904 = -_3228;
            float _3906 = fma(_3468, _3904, _3834);
            float _3908 = -_3228;
            float _3910 = fma(_3476, _3908, _3836);
            float _3912 = -_3228;
            float _3914 = fma(_3482, _3912, _3838);
            float _3916 = -_3228;
            float _3918 = fma(_3488, _3916, _3840);
            float _3920 = -_3228;
            float _3922 = fma(_3494, _3920, _3842);
            float _3924 = -_3228;
            float _3926 = fma(_3502, _3924, _3844);
            float _3928 = -_3228;
            float _3930 = fma(_3508, _3928, _3846);
            float _3932 = -_3228;
            float _3934 = fma(_3514, _3932, _3848);
            float _3936 = -_3228;
            float _3938 = fma(_3520, _3936, _3850);
            float _3940 = -_3228;
            float _3942 = fma(_3528, _3940, _3852);
            float _3944 = -_3228;
            float _3946 = fma(_3534, _3944, _3854);
            float _3948 = -_3228;
            float _3950 = fma(_3540, _3948, _3856);
            float _3952 = -_3228;
            float _3954 = fma(_3546, _3952, _3858);
            float _3956 = -_3228;
            float _3958 = fma(_3554, _3956, _3860);
            float _3960 = -_3228;
            float _3962 = fma(_3560, _3960, _3862);
            float _3964 = -_3228;
            float _3966 = fma(_3566, _3964, _3864);
            float _3968 = -_3228;
            float _3970 = fma(_3572, _3968, _3866);
            float _3972 = -_3228;
            float _3974 = fma(_3580, _3972, _3868);
            float _3976 = -_3228;
            float _3978 = fma(_3586, _3976, _3870);
            float _3980 = -_3228;
            float _3982 = fma(_3592, _3980, _3872);
            float _3984 = -_3228;
            float _3986 = fma(_3598, _3984, _3874);
            float _3988 = -_3228;
            float _3990 = fma(_3602, _3988, _3876);
            float _3992 = -_3228;
            float _3994 = fma(_3608, _3992, _3878);
            float _3996 = -_3228;
            float _3998 = fma(_3614, _3996, _3880);
            float _4000 = -_3228;
            float _4002 = fma(_3620, _4000, _3882);
            float _4004 = -_3228;
            float _4006 = fma(_3624, _4004, _3884);
            float _4008 = -_3228;
            float _4010 = fma(_3630, _4008, _3886);
            float _4012 = -_3228;
            float _4014 = fma(_3636, _4012, _3888);
            float _4016 = -_3228;
            float _4018 = fma(_3642, _4016, _3890);
            float _4020 = fma(_3646, _3826, _3894);
            float _4022 = fma(_3652, _3826, _3898);
            float _4024 = fma(_3658, _3826, _3902);
            float _4026 = fma(_3664, _3826, _3906);
            float _4028 = fma(_3668, _3826, _3910);
            float _4030 = fma(_3674, _3826, _3914);
            float _4032 = fma(_3680, _3826, _3918);
            float _4034 = fma(_3686, _3826, _3922);
            float _4036 = fma(_3690, _3826, _3926);
            float _4038 = fma(_3696, _3826, _3930);
            float _4040 = fma(_3702, _3826, _3934);
            float _4042 = fma(_3708, _3826, _3938);
            float _4044 = fma(_3712, _3826, _3942);
            float _4046 = fma(_3718, _3826, _3946);
            float _4048 = fma(_3724, _3826, _3950);
            float _4050 = fma(_3730, _3826, _3954);
            float _4052 = fma(_3734, _3826, _3958);
            float _4054 = fma(_3740, _3826, _3962);
            float _4056 = fma(_3746, _3826, _3966);
            float _4058 = fma(_3752, _3826, _3970);
            float _4060 = fma(_3756, _3826, _3974);
            float _4062 = fma(_3762, _3826, _3978);
            float _4064 = fma(_3768, _3826, _3982);
            float _4066 = fma(_3774, _3826, _3986);
            float _4068 = fma(_3778, _3826, _3990);
            float _4070 = fma(_3784, _3826, _3994);
            float _4072 = fma(_3790, _3826, _3998);
            float _4074 = fma(_3796, _3826, _4002);
            float _4076 = fma(_3800, _3826, _4006);
            float _4078 = fma(_3806, _3826, _4010);
            float _4080 = fma(_3812, _3826, _4014);
            float _4082 = fma(_3818, _3826, _4018);
            _2252 = _4030;
            _2254 = _4034;
            _2256 = _4044;
            _2258 = _4028;
            _2260 = _4062;
            _2262 = _4064;
            _2264 = _4046;
            _2266 = _4050;
            _2268 = _4066;
            _2270 = _4060;
            _2272 = _4048;
            _2274 = _4032;
            _2276 = _4078;
            _2278 = _4076;
            _2280 = _4026;
            _2282 = _4036;
            _2284 = _4038;
            _2286 = _4070;
            _2288 = _4020;
            _2290 = _4022;
            _2292 = _4024;
            _2294 = _4068;
            _2296 = _4080;
            _2298 = _4040;
            _2300 = _4042;
            _2302 = _4052;
            _2304 = _4072;
            _2306 = _4082;
            _2308 = _4054;
            _2310 = _4056;
            _2312 = _4058;
            _2314 = _4074;
            _2316 = true;
        }
        else
        {
            int _4084 = _1258 * 656;
            int _4086 = _4084 + 262144;
            int _4088 = _4084 + 262192;
            int _4090 = _4084 + 262160;
            uint _4092 = uint(int(uint(_4086) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4092)];
            float _4094 = as_type<float>(_dmw72.x);
            int _4096 = _4086 + 4;
            uint _4098 = uint(int(uint(_4096) >> uint(2)));
            float _4100 = as_type<float>(_dmw72.y);
            int _4102 = _4086 + 8;
            uint _4104 = uint(int(uint(_4102) >> uint(2)));
            float _4106 = as_type<float>(_dmw72.z);
            int _4108 = _4086 + 12;
            uint _4110 = uint(int(uint(_4108) >> uint(2)));
            float _4112 = as_type<float>(_dmw72.w);
            int _4114 = _4084 + 262208;
            int _4116 = _4084 + 262176;
            uint _4118 = uint(int(uint(_4088) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4118)];
            float _4120 = as_type<float>(_dmw75.x);
            int _4122 = _4088 + 4;
            uint _4124 = uint(int(uint(_4122) >> uint(2)));
            float _4126 = as_type<float>(_dmw75.y);
            int _4128 = _4088 + 8;
            uint _4130 = uint(int(uint(_4128) >> uint(2)));
            float _4132 = as_type<float>(_dmw75.z);
            int _4134 = _4088 + 12;
            uint _4136 = uint(int(uint(_4134) >> uint(2)));
            float _4138 = as_type<float>(_dmw75.w);
            int _4140 = _4084 + 262224;
            uint _4142 = uint(int(uint(_4090) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4142)];
            float _4144 = as_type<float>(_dmw73.x);
            int _4146 = _4090 + 4;
            uint _4148 = uint(int(uint(_4146) >> uint(2)));
            float _4150 = as_type<float>(_dmw73.y);
            int _4152 = _4090 + 8;
            uint _4154 = uint(int(uint(_4152) >> uint(2)));
            float _4156 = as_type<float>(_dmw73.z);
            int _4158 = _4090 + 12;
            uint _4160 = uint(int(uint(_4158) >> uint(2)));
            float _4162 = as_type<float>(_dmw73.w);
            int _4164 = _4084 + 262240;
            int _4166 = _1196 * 656;
            uint _4168 = uint(int(uint(_4114) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4168)];
            float _4170 = as_type<float>(_dmw76.x);
            int _4172 = _4114 + 4;
            uint _4174 = uint(int(uint(_4172) >> uint(2)));
            float _4176 = as_type<float>(_dmw76.y);
            int _4178 = _4114 + 8;
            uint _4180 = uint(int(uint(_4178) >> uint(2)));
            float _4182 = as_type<float>(_dmw76.z);
            int _4184 = _4114 + 12;
            uint _4186 = uint(int(uint(_4184) >> uint(2)));
            float _4188 = as_type<float>(_dmw76.w);
            int _4190 = _4084 + 262256;
            uint _4192 = uint(int(uint(_4116) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4192)];
            float _4194 = as_type<float>(_dmw74.x);
            int _4196 = _4116 + 4;
            uint _4198 = uint(int(uint(_4196) >> uint(2)));
            float _4200 = as_type<float>(_dmw74.y);
            int _4202 = _4116 + 8;
            uint _4204 = uint(int(uint(_4202) >> uint(2)));
            float _4206 = as_type<float>(_dmw74.z);
            int _4208 = _4116 + 12;
            uint _4210 = uint(int(uint(_4208) >> uint(2)));
            float _4212 = as_type<float>(_dmw74.w);
            int _4214 = _1242 * 656;
            uint _4216 = uint(int(uint(_4140) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4216)];
            float _4218 = as_type<float>(_dmw77.x);
            int _4220 = _4140 + 4;
            uint _4222 = uint(int(uint(_4220) >> uint(2)));
            float _4224 = as_type<float>(_dmw77.y);
            int _4226 = _4140 + 8;
            uint _4228 = uint(int(uint(_4226) >> uint(2)));
            float _4230 = as_type<float>(_dmw77.z);
            int _4232 = _4140 + 12;
            uint _4234 = uint(int(uint(_4232) >> uint(2)));
            float _4236 = as_type<float>(_dmw77.w);
            int _4238 = _4166 + 262144;
            int _4240 = _4166 + 262192;
            uint _4242 = uint(int(uint(_4164) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4242)];
            float _4244 = as_type<float>(_dmw78.x);
            int _4246 = _4164 + 4;
            uint _4248 = uint(int(uint(_4246) >> uint(2)));
            float _4250 = as_type<float>(_dmw78.y);
            int _4252 = _4164 + 8;
            uint _4254 = uint(int(uint(_4252) >> uint(2)));
            float _4256 = as_type<float>(_dmw78.z);
            int _4258 = _4164 + 12;
            uint _4260 = uint(int(uint(_4258) >> uint(2)));
            float _4262 = as_type<float>(_dmw78.w);
            int _4264 = _4166 + 262160;
            int _4266 = _4166 + 262208;
            uint _4268 = uint(int(uint(_4190) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4268)];
            float _4270 = as_type<float>(_dmw79.x);
            int _4272 = _4190 + 4;
            uint _4274 = uint(int(uint(_4272) >> uint(2)));
            float _4276 = as_type<float>(_dmw79.y);
            int _4278 = _4190 + 8;
            uint _4280 = uint(int(uint(_4278) >> uint(2)));
            float _4282 = as_type<float>(_dmw79.z);
            int _4284 = _4190 + 12;
            uint _4286 = uint(int(uint(_4284) >> uint(2)));
            float _4288 = as_type<float>(_dmw79.w);
            int _4290 = _4166 + 262176;
            int _4292 = _4166 + 262224;
            uint _4294 = uint(int(uint(_4238) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4294)];
            float _4296 = as_type<float>(_dmw80.x);
            int _4298 = _4238 + 4;
            uint _4300 = uint(int(uint(_4298) >> uint(2)));
            float _4302 = as_type<float>(_dmw80.y);
            int _4304 = _4238 + 8;
            uint _4306 = uint(int(uint(_4304) >> uint(2)));
            float _4308 = as_type<float>(_dmw80.z);
            int _4310 = _4238 + 12;
            uint _4312 = uint(int(uint(_4310) >> uint(2)));
            float _4314 = as_type<float>(_dmw80.w);
            int _4316 = _4166 + 262240;
            int _4318 = _4166 + 262256;
            uint _4320 = uint(int(uint(_4240) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4320)];
            float _4322 = as_type<float>(_dmw83.x);
            int _4324 = _4240 + 4;
            uint _4326 = uint(int(uint(_4324) >> uint(2)));
            float _4328 = as_type<float>(_dmw83.y);
            int _4330 = _4240 + 8;
            uint _4332 = uint(int(uint(_4330) >> uint(2)));
            float _4334 = as_type<float>(_dmw83.z);
            int _4336 = _4240 + 12;
            uint _4338 = uint(int(uint(_4336) >> uint(2)));
            float _4340 = as_type<float>(_dmw83.w);
            int _4342 = _4214 + 262144;
            int _4344 = _4214 + 262192;
            uint _4346 = uint(int(uint(_4264) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4346)];
            float _4348 = as_type<float>(_dmw81.x);
            int _4350 = _4264 + 4;
            uint _4352 = uint(int(uint(_4350) >> uint(2)));
            float _4354 = as_type<float>(_dmw81.y);
            int _4356 = _4264 + 8;
            uint _4358 = uint(int(uint(_4356) >> uint(2)));
            float _4360 = as_type<float>(_dmw81.z);
            int _4362 = _4264 + 12;
            uint _4364 = uint(int(uint(_4362) >> uint(2)));
            float _4366 = as_type<float>(_dmw81.w);
            int _4368 = _4214 + 262160;
            int _4370 = _4214 + 262208;
            uint _4372 = uint(int(uint(_4266) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4372)];
            float _4374 = as_type<float>(_dmw84.x);
            int _4376 = _4266 + 4;
            uint _4378 = uint(int(uint(_4376) >> uint(2)));
            float _4380 = as_type<float>(_dmw84.y);
            int _4382 = _4266 + 8;
            uint _4384 = uint(int(uint(_4382) >> uint(2)));
            float _4386 = as_type<float>(_dmw84.z);
            int _4388 = _4266 + 12;
            uint _4390 = uint(int(uint(_4388) >> uint(2)));
            float _4392 = as_type<float>(_dmw84.w);
            int _4394 = _4214 + 262176;
            int _4396 = _4214 + 262224;
            uint _4398 = uint(int(uint(_4290) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4398)];
            float _4400 = as_type<float>(_dmw82.x);
            int _4402 = _4290 + 4;
            uint _4404 = uint(int(uint(_4402) >> uint(2)));
            float _4406 = as_type<float>(_dmw82.y);
            int _4408 = _4290 + 8;
            uint _4410 = uint(int(uint(_4408) >> uint(2)));
            float _4412 = as_type<float>(_dmw82.z);
            int _4414 = _4290 + 12;
            uint _4416 = uint(int(uint(_4414) >> uint(2)));
            float _4418 = as_type<float>(_dmw82.w);
            int _4420 = _4214 + 262240;
            int _4422 = _4214 + 262256;
            uint _4424 = uint(int(uint(_4292) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4424)];
            float _4426 = as_type<float>(_dmw85.x);
            int _4428 = _4292 + 4;
            uint _4430 = uint(int(uint(_4428) >> uint(2)));
            float _4432 = as_type<float>(_dmw85.y);
            int _4434 = _4292 + 8;
            uint _4436 = uint(int(uint(_4434) >> uint(2)));
            float _4438 = as_type<float>(_dmw85.z);
            int _4440 = _4292 + 12;
            uint _4442 = uint(int(uint(_4440) >> uint(2)));
            float _4444 = as_type<float>(_dmw85.w);
            uint _4446 = uint(int(uint(_4316) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4446)];
            float _4448 = as_type<float>(_dmw86.x);
            int _4450 = _4316 + 4;
            uint _4452 = uint(int(uint(_4450) >> uint(2)));
            float _4454 = as_type<float>(_dmw86.y);
            int _4456 = _4316 + 8;
            uint _4458 = uint(int(uint(_4456) >> uint(2)));
            float _4460 = as_type<float>(_dmw86.z);
            int _4462 = _4316 + 12;
            uint _4464 = uint(int(uint(_4462) >> uint(2)));
            float _4466 = as_type<float>(_dmw86.w);
            uint _4468 = uint(int(uint(_4318) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4468)];
            float _4470 = as_type<float>(_dmw87.x);
            int _4472 = _4318 + 4;
            uint _4474 = uint(int(uint(_4472) >> uint(2)));
            float _4476 = as_type<float>(_dmw87.y);
            int _4478 = _4318 + 8;
            uint _4480 = uint(int(uint(_4478) >> uint(2)));
            float _4482 = as_type<float>(_dmw87.z);
            int _4484 = _4318 + 12;
            uint _4486 = uint(int(uint(_4484) >> uint(2)));
            float _4488 = as_type<float>(_dmw87.w);
            uint _4490 = uint(int(uint(_4342) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4490)];
            float _4492 = as_type<float>(_dmw88.x);
            int _4494 = _4342 + 4;
            uint _4496 = uint(int(uint(_4494) >> uint(2)));
            float _4498 = as_type<float>(_dmw88.y);
            int _4500 = _4342 + 8;
            uint _4502 = uint(int(uint(_4500) >> uint(2)));
            float _4504 = as_type<float>(_dmw88.z);
            int _4506 = _4342 + 12;
            uint _4508 = uint(int(uint(_4506) >> uint(2)));
            float _4510 = as_type<float>(_dmw88.w);
            uint _4512 = uint(int(uint(_4344) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4512)];
            float _4514 = as_type<float>(_dmw91.x);
            int _4516 = _4344 + 4;
            uint _4518 = uint(int(uint(_4516) >> uint(2)));
            float _4520 = as_type<float>(_dmw91.y);
            int _4522 = _4344 + 8;
            uint _4524 = uint(int(uint(_4522) >> uint(2)));
            float _4526 = as_type<float>(_dmw91.z);
            int _4528 = _4344 + 12;
            uint _4530 = uint(int(uint(_4528) >> uint(2)));
            float _4532 = as_type<float>(_dmw91.w);
            uint _4534 = uint(int(uint(_4368) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4534)];
            float _4536 = as_type<float>(_dmw89.x);
            int _4538 = _4368 + 4;
            uint _4540 = uint(int(uint(_4538) >> uint(2)));
            float _4542 = as_type<float>(_dmw89.y);
            int _4544 = _4368 + 8;
            uint _4546 = uint(int(uint(_4544) >> uint(2)));
            float _4548 = as_type<float>(_dmw89.z);
            int _4550 = _4368 + 12;
            uint _4552 = uint(int(uint(_4550) >> uint(2)));
            float _4554 = as_type<float>(_dmw89.w);
            uint _4556 = uint(int(uint(_4370) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4556)];
            float _4558 = as_type<float>(_dmw92.x);
            int _4560 = _4370 + 4;
            uint _4562 = uint(int(uint(_4560) >> uint(2)));
            float _4564 = as_type<float>(_dmw92.y);
            int _4566 = _4370 + 8;
            uint _4568 = uint(int(uint(_4566) >> uint(2)));
            float _4570 = as_type<float>(_dmw92.z);
            int _4572 = _4370 + 12;
            uint _4574 = uint(int(uint(_4572) >> uint(2)));
            float _4576 = as_type<float>(_dmw92.w);
            uint _4578 = uint(int(uint(_4394) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4578)];
            float _4580 = as_type<float>(_dmw90.x);
            int _4582 = _4394 + 4;
            uint _4584 = uint(int(uint(_4582) >> uint(2)));
            float _4586 = as_type<float>(_dmw90.y);
            int _4588 = _4394 + 8;
            uint _4590 = uint(int(uint(_4588) >> uint(2)));
            float _4592 = as_type<float>(_dmw90.z);
            int _4594 = _4394 + 12;
            uint _4596 = uint(int(uint(_4594) >> uint(2)));
            float _4598 = as_type<float>(_dmw90.w);
            uint _4600 = uint(int(uint(_4396) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4600)];
            float _4602 = as_type<float>(_dmw93.x);
            int _4604 = _4396 + 4;
            uint _4606 = uint(int(uint(_4604) >> uint(2)));
            float _4608 = as_type<float>(_dmw93.y);
            int _4610 = _4396 + 8;
            uint _4612 = uint(int(uint(_4610) >> uint(2)));
            float _4614 = as_type<float>(_dmw93.z);
            int _4616 = _4396 + 12;
            uint _4618 = uint(int(uint(_4616) >> uint(2)));
            float _4620 = as_type<float>(_dmw93.w);
            uint _4622 = uint(int(uint(_4420) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4622)];
            float _4624 = as_type<float>(_dmw94.x);
            int _4626 = _4420 + 4;
            uint _4628 = uint(int(uint(_4626) >> uint(2)));
            float _4630 = as_type<float>(_dmw94.y);
            int _4632 = _4420 + 8;
            uint _4634 = uint(int(uint(_4632) >> uint(2)));
            float _4636 = as_type<float>(_dmw94.z);
            int _4638 = _4420 + 12;
            uint _4640 = uint(int(uint(_4638) >> uint(2)));
            float _4642 = as_type<float>(_dmw94.w);
            uint _4644 = uint(int(uint(_4422) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4644)];
            float _4646 = as_type<float>(_dmw95.x);
            int _4648 = _4422 + 4;
            uint _4650 = uint(int(uint(_4648) >> uint(2)));
            float _4652 = as_type<float>(_dmw95.y);
            int _4654 = _4422 + 8;
            uint _4656 = uint(int(uint(_4654) >> uint(2)));
            float _4658 = as_type<float>(_dmw95.z);
            int _4660 = _4422 + 12;
            uint _4662 = uint(int(uint(_4660) >> uint(2)));
            float _4664 = as_type<float>(_dmw95.w);
            float _4666 = -_3228;
            float _4668 = _4666 + _3234;
            float _4670 = -_4668;
            float _4672 = _1306 + _4670;
            float _4674 = _4094 * _4668;
            float _4676 = _4100 * _4668;
            float _4678 = _4106 * _4668;
            float _4680 = _4112 * _4668;
            float _4682 = _4120 * _4668;
            float _4684 = _4126 * _4668;
            float _4686 = _4132 * _4668;
            float _4688 = _4138 * _4668;
            float _4690 = _4144 * _4668;
            float _4692 = _4150 * _4668;
            float _4694 = _4156 * _4668;
            float _4696 = _4162 * _4668;
            float _4698 = _4170 * _4668;
            float _4700 = _4176 * _4668;
            float _4702 = _4182 * _4668;
            float _4704 = _4188 * _4668;
            float _4706 = _4194 * _4668;
            float _4708 = _4200 * _4668;
            float _4710 = _4206 * _4668;
            float _4712 = _4212 * _4668;
            float _4714 = _4218 * _4668;
            float _4716 = _4224 * _4668;
            float _4718 = _4230 * _4668;
            float _4720 = _4236 * _4668;
            float _4722 = _4244 * _4668;
            float _4724 = _4250 * _4668;
            float _4726 = _4256 * _4668;
            float _4728 = _4262 * _4668;
            float _4730 = _4270 * _4668;
            float _4732 = _4276 * _4668;
            float _4734 = _4282 * _4668;
            float _4736 = _4288 * _4668;
            float _4738 = -_3234;
            float _4740 = fma(_4296, _4738, _4674);
            float _4742 = -_3234;
            float _4744 = fma(_4302, _4742, _4676);
            float _4746 = -_3234;
            float _4748 = fma(_4308, _4746, _4678);
            float _4750 = -_3234;
            float _4752 = fma(_4314, _4750, _4680);
            float _4754 = -_3234;
            float _4756 = fma(_4322, _4754, _4682);
            float _4758 = -_3234;
            float _4760 = fma(_4328, _4758, _4684);
            float _4762 = -_3234;
            float _4764 = fma(_4334, _4762, _4686);
            float _4766 = -_3234;
            float _4768 = fma(_4340, _4766, _4688);
            float _4770 = -_3234;
            float _4772 = fma(_4348, _4770, _4690);
            float _4774 = -_3234;
            float _4776 = fma(_4354, _4774, _4692);
            float _4778 = -_3234;
            float _4780 = fma(_4360, _4778, _4694);
            float _4782 = -_3234;
            float _4784 = fma(_4366, _4782, _4696);
            float _4786 = -_3234;
            float _4788 = fma(_4374, _4786, _4698);
            float _4790 = -_3234;
            float _4792 = fma(_4380, _4790, _4700);
            float _4794 = -_3234;
            float _4796 = fma(_4386, _4794, _4702);
            float _4798 = -_3234;
            float _4800 = fma(_4392, _4798, _4704);
            float _4802 = -_3234;
            float _4804 = fma(_4400, _4802, _4706);
            float _4806 = -_3234;
            float _4808 = fma(_4406, _4806, _4708);
            float _4810 = -_3234;
            float _4812 = fma(_4412, _4810, _4710);
            float _4814 = -_3234;
            float _4816 = fma(_4418, _4814, _4712);
            float _4818 = -_3234;
            float _4820 = fma(_4426, _4818, _4714);
            float _4822 = -_3234;
            float _4824 = fma(_4432, _4822, _4716);
            float _4826 = -_3234;
            float _4828 = fma(_4438, _4826, _4718);
            float _4830 = -_3234;
            float _4832 = fma(_4444, _4830, _4720);
            float _4834 = -_3234;
            float _4836 = fma(_4448, _4834, _4722);
            float _4838 = -_3234;
            float _4840 = fma(_4454, _4838, _4724);
            float _4842 = -_3234;
            float _4844 = fma(_4460, _4842, _4726);
            float _4846 = -_3234;
            float _4848 = fma(_4466, _4846, _4728);
            float _4850 = -_3234;
            float _4852 = fma(_4470, _4850, _4730);
            float _4854 = -_3234;
            float _4856 = fma(_4476, _4854, _4732);
            float _4858 = -_3234;
            float _4860 = fma(_4482, _4858, _4734);
            float _4862 = -_3234;
            float _4864 = fma(_4488, _4862, _4736);
            float _4866 = fma(_4492, _4672, _4740);
            float _4868 = fma(_4498, _4672, _4744);
            float _4870 = fma(_4504, _4672, _4748);
            float _4872 = fma(_4510, _4672, _4752);
            float _4874 = fma(_4514, _4672, _4756);
            float _4876 = fma(_4520, _4672, _4760);
            float _4878 = fma(_4526, _4672, _4764);
            float _4880 = fma(_4532, _4672, _4768);
            float _4882 = fma(_4536, _4672, _4772);
            float _4884 = fma(_4542, _4672, _4776);
            float _4886 = fma(_4548, _4672, _4780);
            float _4888 = fma(_4554, _4672, _4784);
            float _4890 = fma(_4558, _4672, _4788);
            float _4892 = fma(_4564, _4672, _4792);
            float _4894 = fma(_4570, _4672, _4796);
            float _4896 = fma(_4576, _4672, _4800);
            float _4898 = fma(_4580, _4672, _4804);
            float _4900 = fma(_4586, _4672, _4808);
            float _4902 = fma(_4592, _4672, _4812);
            float _4904 = fma(_4598, _4672, _4816);
            float _4906 = fma(_4602, _4672, _4820);
            float _4908 = fma(_4608, _4672, _4824);
            float _4910 = fma(_4614, _4672, _4828);
            float _4912 = fma(_4620, _4672, _4832);
            float _4914 = fma(_4624, _4672, _4836);
            float _4916 = fma(_4630, _4672, _4840);
            float _4918 = fma(_4636, _4672, _4844);
            float _4920 = fma(_4642, _4672, _4848);
            float _4922 = fma(_4646, _4672, _4852);
            float _4924 = fma(_4652, _4672, _4856);
            float _4926 = fma(_4658, _4672, _4860);
            float _4928 = fma(_4664, _4672, _4864);
            _2252 = _4876;
            _2254 = _4880;
            _2256 = _4890;
            _2258 = _4874;
            _2260 = _4908;
            _2262 = _4910;
            _2264 = _4892;
            _2266 = _4896;
            _2268 = _4912;
            _2270 = _4906;
            _2272 = _4894;
            _2274 = _4878;
            _2276 = _4924;
            _2278 = _4922;
            _2280 = _4872;
            _2282 = _4882;
            _2284 = _4884;
            _2286 = _4916;
            _2288 = _4866;
            _2290 = _4868;
            _2292 = _4870;
            _2294 = _4914;
            _2296 = _4926;
            _2298 = _4886;
            _2300 = _4888;
            _2302 = _4898;
            _2304 = _4918;
            _2306 = _4928;
            _2308 = _4900;
            _2310 = _4902;
            _2312 = _4904;
            _2314 = _4920;
        }
    }
    _2316 = false;
    float _4930 = _2252;
    float _4932 = _2254;
    float _4934 = _2256;
    float _4936 = _2258;
    float _4938 = _2260;
    float _4940 = _2262;
    float _4942 = _2264;
    float _4944 = _2266;
    float _4946 = _2268;
    float _4948 = _2270;
    float _4950 = _2272;
    float _4952 = _2274;
    float _4954 = _2276;
    float _4956 = _2278;
    float _4958 = _2280;
    float _4960 = _2282;
    float _4962 = _2284;
    float _4964 = _2286;
    float _4966 = _2288;
    float _4968 = _2290;
    float _4970 = _2292;
    float _4972 = _2294;
    float _4974 = _2296;
    float _4976 = _2298;
    float _4978 = _2300;
    float _4980 = _2302;
    float _4982 = _2304;
    float _4984 = _2306;
    float _4986 = _2308;
    float _4988 = _2310;
    float _4990 = _2312;
    float _4992 = _2314;
    float _4994 = _4930 * 0.88622760772705078125;
    float _4996 = _4932 * 0.511664927005767822265625;
    float _4998 = _4934 * 0.511664927005767822265625;
    float _5000 = _4936 * 0.88622760772705078125;
    float _5002 = _4938 * 0.511664927005767822265625;
    float _5004 = _4996 * _4996;
    float _5006 = precise::max(_4994, 0.00999999977648258209228515625);
    float _5008 = _4940 * 0.511664927005767822265625;
    float _5010 = _4998 * _4998;
    float _5012 = _4942 * 0.511664927005767822265625;
    float _5014 = precise::max(_5000, 0.00999999977648258209228515625);
    float _5016 = fma(_5002, _5002, _5004);
    float _5018 = 1.0 / _5006;
    float _5020 = _4944 * 0.511664927005767822265625;
    float _5022 = fma(_5008, _5008, _5010);
    float _5024 = _4946 * 0.511664927005767822265625;
    float _5026 = _4948 * 0.511664927005767822265625;
    float _5028 = _4950 * 0.511664927005767822265625;
    float _5030 = _4952 * 0.88622760772705078125;
    float _5032 = 1.0 / _5014;
    float _5034 = _5012 * _5012;
    float _5036 = fma(_5028, _5028, _5016);
    float _5038 = precise::max(_5030, 0.00999999977648258209228515625);
    float _5040 = fma(_1392, 1.9073486328125, 0.5);
    float _5042 = fma(_5024, _5024, _5034);
    float _5044 = sqrt(_5036);
    float _5046 = fma(_5020, _5020, _5022);
    float _5048 = fma(_5026, _5026, _5042);
    float _5050 = _1392 * 3.903682708740234375;
    float _5052 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5054 = _5052 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5056 = _5050 * _4954;
    float _5058 = sqrt(_5046);
    float _5060 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5062 = _5060 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5064 = fma(_4956, 0.88622701168060302734375, _5056);
    float _5066 = _5050 * _4958;
    float _5068 = _5050 * _4960;
    float _5070 = _5050 * _4962;
    float _5072 = _5050 * _4964;
    float _5074 = sqrt(_5048);
    float _5076 = fma(_4966, 0.88622701168060302734375, _5066);
    float _5078 = fma(_4968, 0.88622701168060302734375, _5068);
    float _5080 = fma(_4970, 0.88622701168060302734375, _5070);
    float _5082 = fma(_4972, 0.88622701168060302734375, _5072);
    float _5084 = precise::max(_5058, 0.00999999977648258209228515625);
    float _5086 = 1.0 / _5038;
    float _5088 = fma(_5040, _5062, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5090 = precise::max(_5074, 0.00999999977648258209228515625);
    float _5092 = 1.0 / _5084;
    int _5094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5096 = _5094 != 0;
    float _5098 = precise::max(_5044, 0.00999999977648258209228515625);
    float _5100 = 1.0 / _5090;
    float _5102 = fma(_5040, _5054, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5104 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5106 = _5104 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5108 = _5102 * 0.715200006961822509765625;
    float _5110 = fma(_5040, _5106, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5112 = _5090 * _5086;
    float _5114 = precise::clamp(_5112, 0.0, 1.0);
    float _5116 = 1.0 / _5098;
    float _5118 = fma(_5088, 0.2125999927520751953125, _5108);
    float _5120 = _4998 * _5092;
    float _5122 = _5098 * _5032;
    float _5124 = precise::clamp(_5122, 0.0, 1.0);
    float _5126 = _5020 * _5092;
    float _5128 = fma(_5110, 0.072200000286102294921875, _5118);
    float _5130 = _1442 * _5120;
    float _5132 = _5084 * _5018;
    float _5134 = precise::clamp(_5132, 0.0, 1.0);
    float _5136 = _5012 * _5100;
    float _5138 = _5008 * _5092;
    float _5140 = _5124 + 1.0;
    float _5142 = _5024 * _5100;
    float _5144 = _1442 * _5136;
    float _5146 = -_1438;
    float _5148 = fma(_5146, _5138, _5130);
    float _5150 = 1.0 / _5140;
    float _5152 = _5026 * _5100;
    float _5154 = _4996 * _5116;
    float _5156 = _5002 * _5116;
    float _5158 = _5028 * _5116;
    float _5160 = _1442 * _5154;
    float _5162 = -_1438;
    float _5164 = fma(_5162, _5142, _5144);
    float _5166 = -_1436;
    float _5168 = fma(_5166, _5126, _5148);
    float _5170 = _5114 + 1.0;
    float _5172 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5174 = _5172 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5176 = -_1438;
    float _5178 = fma(_5176, _5156, _5160);
    float _5180 = -_1436;
    float _5182 = fma(_5180, _5152, _5164);
    float _5184 = 1.0 / _5170;
    float _5186 = fma(_5040, _5174, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5188 = -_1436;
    float _5190 = fma(_5188, _5158, _5178);
    float _5192 = fma(_5182, 0.5, 0.5);
    float _5194 = _1436 * (-1.02332699298858642578125);
    float _5196 = fma(_5190, 0.5, 0.5);
    float _5198 = 1.0 / _5128;
    float _5200 = fma(_5168, 0.5, 0.5);
    float _5202 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5204 = _5202 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5206 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5208 = _5206 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5210 = fma(_5194, _4974, _5064);
    float _5212 = fma(_5040, _5204, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5214 = fma(_5124, 2.0, 1.0);
    float _5216 = abs(_5200);
    float _5218 = log2(_5216);
    float _5220 = _5134 + 1.0;
    float _5222 = fma(_5040, _5208, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5224 = fma(_5194, _4976, _5076);
    float _5226 = fma(_5194, _4978, _5078);
    float _5228 = fma(_5194, _4980, _5080);
    float _5230 = fma(_5194, _4982, _5082);
    float _5232 = abs(_5192);
    float _5234 = log2(_5232);
    float _5236 = fma(_5134, 2.0, 1.0);
    float _5238 = _5198 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5240 = precise::clamp(_5238, 0.0, 1.0);
    float _5242 = fma(_5240, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5244 = 1.0 / _5220;
    float _5246 = _5236 * _5218;
    float _5248 = fma(_5114, 2.0, 1.0);
    float _5250 = _5102 * _5242;
    float _5252 = abs(_5196);
    float _5254 = log2(_5252);
    float _5256 = _5248 * _5234;
    float _5258 = -_5124;
    float _5260 = _5258 + 1.0;
    float _5262 = fma(_5114, 2.0, 2.0);
    float _5264 = -_5114;
    float _5266 = _5264 + 1.0;
    float _5268 = _5260 * _5150;
    float _5270 = _5088 * _5242;
    float _5272 = exp2(_5246);
    float _5274 = _1438 * (-1.02332699298858642578125);
    float _5276 = _5266 * _5184;
    float _5278 = fma(_5274, _4984, _5210);
    float _5280 = fma(_5274, _4986, _5224);
    float _5282 = fma(_5274, _4988, _5226);
    float _5284 = _5214 * _5254;
    float _5286 = exp2(_5256);
    float _5288 = precise::max(0.0, _5278);
    float _5290 = fma(_5274, _4990, _5228);
    float _5292 = fma(_5274, _4992, _5230);
    float _5294 = precise::max(0.0, _5280);
    float _5296 = _5288 * 0.31830990314483642578125;
    float _5298 = precise::clamp(_5296, 0.0, 1.0);
    float _5300 = precise::max(0.0, _5282);
    float _5302 = exp2(_5284);
    float _5304 = precise::max(0.0, _5290);
    float _5306 = -_5298;
    float _5308 = _5306 + 1.0;
    float _5310 = precise::max(0.0, _5292);
    float _5312 = _5294 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5314 = _5300 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5316 = fma(_5308, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5298);
    float _5318 = _5110 * _5242;
    float _5320 = _5262 * _5286;
    float _5322 = fma(_5124, 2.0, 2.0);
    float _5324 = -_5134;
    float _5326 = _5324 + 1.0;
    float _5328 = fma(_5134, 2.0, 2.0);
    float _5330 = -_5320;
    float _5332 = _5330 + 1.0;
    float _5334 = _5304 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5336 = _5326 * _5244;
    float _5338 = _5328 * _5272;
    float _5340 = _5322 * _5302;
    float _5342 = fma(_5276, _5332, _5320);
    float _5344 = _5310 * 0.31830990314483642578125;
    float _5346 = precise::clamp(_5344, 0.0, 1.0);
    float _5348 = -_5338;
    float _5350 = _5348 + 1.0;
    float _5352 = -_5340;
    float _5354 = _5352 + 1.0;
    float _5356 = _5030 * _5342;
    float _5358 = precise::max(_5312, _5270);
    float _5360 = fma(_5336, _5350, _5338);
    float _5362 = fma(_5268, _5354, _5340);
    float _5364 = _5356 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5366 = precise::max(_5314, _5250);
    float _5368 = _4994 * _5360;
    float _5370 = _5000 * _5362;
    float _5372 = precise::max(_5334, _5318);
    float _5374 = _5346 * 0.88622701168060302734375;
    float _5376 = _5368 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5378 = _5370 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5380 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5358);
    float _5382 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5366);
    float _5384 = precise::max(_5376, _5186);
    float _5386 = fma(_5374, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5372);
    float _5388 = precise::max(_5378, _5212);
    float _5390 = precise::max(_5364, _5222);
    float _5392 = fma(_5384, _5316, _5382);
    float _5394 = fma(_5388, _5316, _5380);
    float _5396 = fma(_5390, _5316, _5386);
    bool _5398 = !_5096;
    float _5400;
    float _5402;
    float _5404;
    float _5406;
    float _5408;
    float _5410;
    float _5412;
    float _5414;
    float _5416;
    float _5418;
    int _5420;
    float _5422;
    int _5424;
    float _5426;
    int _5428;
    float _5430;
    float _5432;
    float _5434;
    float _5436;
    float _5438;
    float _5440;
    int _5442;
    int _5444;
    float _5446;
    int _5448;
    float _5450;
    float _5452;
    int _5454;
    int _5456;
    float _5458;
    int _5460;
    float _5462;
    if (!_5398)
    {
        _5400 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5402 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5404 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5406 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5408 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5410 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5412 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5414 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5416 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5418 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5422 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5426 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5430 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5432 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5434 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5436 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5438 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5440 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5446 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5450 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5452 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5458 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5462 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5464 = true;
    }
    else
    {
        float _5466 = fma(_1244, 6.2500002968590706586837768554688e-05, 0.5);
        float _5468 = fma(_1240, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14567 = float3(_5466, _5468, float(0));
        float3 _14569 = select(_14567, float3(0.0), isnan(_14567));
        float4 _5471 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14569.xy, uint(rint(_14569.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14569.xy, uint(rint(_14569.z)), level(0.0)).xyzw;
        float _5473 = _5471.x;
        float _5475 = _5471.y;
        float _5477 = _5471.z;
        float _5479 = _5471.w;
        float3 _14584 = float3(_5466, _5468, float(1));
        float3 _14586 = select(_14584, float3(0.0), isnan(_14584));
        float4 _5481 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14586.xy, uint(rint(_14586.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14586.xy, uint(rint(_14586.z)), level(0.0)).xyzw;
        float _5483 = _5481.x;
        float _5485 = _5481.y;
        float _5487 = _5481.z;
        float _5489 = _5481.w;
        float3 _14601 = float3(_5466, _5468, float(2));
        float3 _14603 = select(_14601, float3(0.0), isnan(_14601));
        float4 _5491 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14603.xy, uint(rint(_14603.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14603.xy, uint(rint(_14603.z)), level(0.0)).xyzw;
        float _5493 = _5491.x;
        float _5495 = _5491.y;
        float _5497 = _5491.z;
        float _5499 = _5491.w;
        float3 _14618 = float3(_5466, _5468, float(3));
        float3 _14620 = select(_14618, float3(0.0), isnan(_14618));
        float4 _5501 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14620.xy, uint(rint(_14620.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14620.xy, uint(rint(_14620.z)), level(0.0)).xyzw;
        float _5503 = _5501.x;
        float _5505 = _5501.y;
        float _5507 = _5501.z;
        float _5509 = _5501.w;
        float3 _14635 = float3(_5466, _5468, float(4));
        float3 _14637 = select(_14635, float3(0.0), isnan(_14635));
        float4 _5511 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14637.xy, uint(rint(_14637.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14637.xy, uint(rint(_14637.z)), level(0.0)).xyzw;
        float _5513 = _5511.x;
        float _5515 = _5511.y;
        float _5517 = _5511.z;
        float _5519 = _5511.w;
        float3 _14652 = float3(_5466, _5468, float(5));
        float3 _14654 = select(_14652, float3(0.0), isnan(_14652));
        float4 _5521 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14654.xy, uint(rint(_14654.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14654.xy, uint(rint(_14654.z)), level(0.0)).xyzw;
        float _5523 = _5521.x;
        float _5525 = _5521.y;
        float _5527 = _5521.z;
        float _5529 = _5521.w;
        float3 _14669 = float3(_5466, _5468, float(6));
        float3 _14671 = select(_14669, float3(0.0), isnan(_14669));
        float4 _5531 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14671.xy, uint(rint(_14671.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14671.xy, uint(rint(_14671.z)), level(0.0)).xyzw;
        float _5533 = _5531.x;
        float _5535 = _5531.y;
        float _5537 = _5531.z;
        float _5539 = _5531.w;
        float3 _14686 = float3(_5466, _5468, float(7));
        float3 _14688 = select(_14686, float3(0.0), isnan(_14686));
        float4 _5541 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14688.xy, uint(rint(_14688.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14688.xy, uint(rint(_14688.z)), level(0.0)).xyzw;
        float _5543 = _5541.x;
        float _5545 = _5541.y;
        float _5547 = _5541.z;
        float _5549 = _5541.w;
        _5400 = _5535;
        _5402 = _5545;
        _5404 = _5503;
        _5406 = _5505;
        _5408 = _5533;
        _5410 = _5543;
        _5412 = _5507;
        _5414 = _5479;
        _5416 = _5537;
        _5418 = _5547;
        _5420 = as_type<int>(_5513);
        _5422 = _5539;
        _5424 = as_type<int>(_5515);
        _5426 = _5549;
        _5428 = as_type<int>(_5509);
        _5430 = _5483;
        _5432 = _5473;
        _5434 = _5485;
        _5436 = _5475;
        _5438 = _5487;
        _5440 = _5477;
        _5442 = as_type<int>(_5517);
        _5444 = as_type<int>(_5519);
        _5446 = _5489;
        _5448 = as_type<int>(_5523);
        _5450 = _5495;
        _5452 = _5493;
        _5454 = as_type<int>(_5525);
        _5456 = as_type<int>(_5527);
        _5458 = _5497;
        _5460 = as_type<int>(_5529);
        _5462 = _5499;
    }
    _5464 = false;
    float _5551 = _5400;
    float _5553 = _5402;
    float _5555 = _5404;
    float _5557 = _5406;
    float _5559 = _5408;
    float _5561 = _5410;
    float _5563 = _5412;
    float _5565 = _5414;
    float _5567 = _5416;
    float _5569 = _5418;
    int _5571 = _5420;
    float _5573 = _5422;
    int _5575 = _5424;
    float _5577 = _5426;
    int _5579 = _5428;
    float _5581 = _5430;
    float _5583 = _5432;
    float _5585 = _5434;
    float _5587 = _5436;
    float _5589 = _5438;
    float _5591 = _5440;
    int _5593 = _5442;
    int _5595 = _5444;
    float _5597 = _5446;
    int _5599 = _5448;
    float _5601 = _5450;
    float _5603 = _5452;
    int _5605 = _5454;
    int _5607 = _5456;
    float _5609 = _5458;
    int _5611 = _5460;
    float _5613 = _5462;
    float _5615 = _5050 * _5551;
    float _5617 = _5050 * _5553;
    float _5619 = _5555 * 0.88622701168060302734375;
    float _5621 = _5557 * 0.88622701168060302734375;
    float _5623 = fma(_5559, 0.88622701168060302734375, _5615);
    float _5625 = fma(_5561, 0.88622701168060302734375, _5617);
    float _5627 = _5563 * 0.88622701168060302734375;
    float _5629 = _5050 * _5565;
    float _5631 = fma(_5194, _5567, _5623);
    float _5633 = fma(_5194, _5569, _5625);
    out.m_54.x = _1244;
    out.m_54.y = _1348;
    out.m_54.z = _1240;
    float _5635 = _5096 ? as_type<float>(_5571) : 0.0;
    float _5637 = fma(_5274, _5573, _5631);
    float _5639 = _5096 ? as_type<float>(_5575) : 0.0;
    float _5641 = fma(_5274, _5577, _5633);
    float _5643 = _5096 ? as_type<float>(_5579) : 0.0;
    float _5645 = _5050 * _5581;
    float _5647 = _5096 ? _5627 : 0.0;
    float _5649 = fma(_5583, 0.88622701168060302734375, _5629);
    float _5651 = _5050 * _5585;
    float _5653 = precise::max(0.0, _5637);
    float _5655 = fma(_5587, 0.88622701168060302734375, _5645);
    float _5657 = _5096 ? _5619 : 0.0;
    float _5659 = fma(_5050, _5639, _5647);
    float _5661 = _5096 ? _5621 : 0.0;
    float _5663 = fma(_5194, _5589, _5649);
    float _5665 = precise::max(0.0, _5641);
    float _5667 = fma(_5050, _5643, _5657);
    float _5669 = fma(_5591, 0.88622701168060302734375, _5651);
    float _5671 = fma(_5050, _5635, _5661);
    float _5673 = _5096 ? as_type<float>(_5593) : 0.0;
    float _5675 = _5653 * 0.31830990314483642578125;
    float _5677 = precise::clamp(_5675, 0.0, 1.0);
    float _5679 = _5096 ? as_type<float>(_5595) : 0.0;
    float _5681 = fma(_5194, _5597, _5655);
    float _5683 = _5096 ? as_type<float>(_5599) : 0.0;
    float _5685 = fma(_5274, _5601, _5663);
    float _5687 = fma(_5194, _5603, _5669);
    float _5689 = _5665 * 0.31830990314483642578125;
    float _5691 = precise::clamp(_5689, 0.0, 1.0);
    float _5693 = fma(_5194, _5673, _5667);
    float _5695 = fma(_5194, _5679, _5671);
    float _5697 = fma(_5194, _5683, _5659);
    float _5699 = _5096 ? as_type<float>(_5605) : 0.0;
    float _5701 = _5677 * 0.88622701168060302734375;
    float _5703 = _5096 ? as_type<float>(_5607) : 0.0;
    float _5705 = fma(_5274, _5609, _5681);
    float _5707 = _5096 ? as_type<float>(_5611) : 0.0;
    float _5709 = fma(_5274, _5613, _5687);
    float _5711 = precise::max(0.0, _5685);
    float _5713 = -_5691;
    float _5715 = _5713 + 1.0;
    float _5717 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _5719 = fma(_5274, _5699, _5693);
    float _5721 = fma(_5274, _5703, _5695);
    float _5723 = fma(_5274, _5707, _5697);
    float _5725 = fma(_5715, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5691);
    float _5727 = precise::max(0.0, _5705);
    float _5729 = fma(_5711, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5717);
    float _5731 = precise::max(0.0, _5709);
    float _5733 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5735 = _5701 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5737 = precise::max(0.0, _5719);
    float _5739 = _5725 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5741 = precise::max(0.0, _5721);
    float _5743 = fma(_5727, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5733);
    float _5745 = precise::max(0.0, _5723);
    float _5747 = fma(_5731, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5735);
    float _5749 = fma(_5737, _5739, _5729);
    float _5751 = fma(_5741, _5739, _5743);
    float _5753 = -_1436;
    float _5755 = (-0.0) + _5753;
    float _5757 = -_1438;
    float _5759 = (-0.0) + _5757;
    float _5761 = fma(_5745, _5739, _5747);
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1446;
    float _15029 = as_type<float>(_1452);
    out.gl_Position.z = _15029;
    out.gl_Position.w = _1448;
    out.m_56.x = _5394;
    out.m_56.y = _5392;
    out.m_56.z = _5396;
    out.m_58.w = _1410;
    out.m_60.x = _5759;
    out.m_60.y = _1442;
    out.m_60.z = _5755;
    out.m_58.x = _5749;
    out.m_58.y = _5751;
    out.m_58.z = _5761;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

