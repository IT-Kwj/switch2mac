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
    constant _16* vp_c4 [[id(3)]];
    texture2d<float> vp_t_tcb_8 [[id(4)]];
    sampler vp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    sampler vp_t_tcb_8Smplr_w [[id(8)]];
    sampler vp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_42 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_35.x;
    float _60 = in.m_35.y;
    float _62 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _67 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _69 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _71 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _69;
    int _73 = _67 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_64, _60, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _89 = _73 == 80;
    bool _91 = _58 >= 0.5;
    bool _93 = isnan(_58);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.5);
    bool _99 = _95 || _97;
    float _101 = as_type<float>(gl_BaseInstance);
    float _103 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _105 = _58;
    if (_77)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _107 = _101;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _87 + _109;
    float _113 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _115 = _73 == 96;
    float _117 = _111 * _111;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _121 = _113 + _119;
    float _123 = 0.0;
    float _125 = _107;
    if (_77)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _127 = _123;
    float _129 = fma(_71, _71, _117);
    float _131 = _127;
    if (_79)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _133 = _125;
    bool _135 = _73 == 112;
    float _137 = fma(_121, _121, _129);
    float _139 = _133;
    if (_79)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _141 = _131;
    float _143 = _141;
    if (_81)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _145 = _139;
    float _147 = rsqrt(_137);
    bool _149 = _73 == 128;
    float _151 = _145;
    if (_81)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _153 = _143;
    float _155 = _153;
    if (_83)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _157 = _151;
    bool _159 = _73 == 144;
    float _161 = _157;
    if (_83)
    {
        _155 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _163 = _155;
    float _165 = _163;
    if (_85)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _167 = _161;
    bool _169 = _73 == 160;
    float _171 = _167;
    if (_85)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _173 = _165;
    float _175 = _147 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _177 = _173;
    if (_89)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _171;
    bool _181 = _73 == 176;
    float _183 = _179;
    if (_89)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _185 = _177;
    float _187 = log2(_175);
    bool _189 = _73 == 192;
    float _191 = _185;
    if (_115)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _193 = _183;
    float _195 = _193;
    if (_115)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _197 = _191;
    float _199 = _197;
    if (_135)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _201 = _195;
    bool _203 = _73 == 208;
    float _205 = _201;
    if (_135)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _207 = _199;
    float _209 = _207;
    if (_149)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _211 = _205;
    bool _213 = _73 == 224;
    float _215 = _187 + 1.2999999523162841796875;
    float _217 = _211;
    if (_149)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _209;
    float _221 = _219;
    if (_159)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _223 = _217;
    bool _225 = _73 == 240;
    float _227 = trunc(_215);
    int _229 = int(_227);
    float _231 = _223;
    if (_159)
    {
        _221 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _233 = _221;
    float _235 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _237 = _231;
    bool _239 = _73 == 256;
    float _241 = _237;
    if (_169)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _243 = _235;
    float _245 = _243;
    if (_181)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _247 = _241;
    bool _249 = _73 == 272;
    float _251 = _247;
    if (_181)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_189)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _257 = _251;
    int _259 = min(_229, 15);
    bool _261 = _73 == 288;
    float _263 = _257;
    if (_189)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _265 = _255;
    float _267 = float(_259);
    bool _269 = _73 == 304;
    int _271 = _259 << 4;
    int _273 = _271 + 4288;
    float _275 = _265;
    float _277 = as_type<float>(_273);
    if (_203)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _279 = _263;
    float _281 = _279;
    if (_203)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _283 = _275;
    float _285 = -_267;
    float _287 = _285 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _289 = _283;
    if (_213)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _291 = _281;
    int _293 = _273 + 8;
    uint _296 = uint(int(uint(_293) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c14)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    bool _312 = _73 == 320;
    float _314 = _287 + 1.0;
    float _316 = _291;
    if (_213)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _318 = _289;
    float _320 = _318;
    if (_225)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _322 = _316;
    bool _324 = _73 == 336;
    float _326 = exp2(_314);
    float _328 = _322;
    if (_225)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _330 = _320;
    float _332 = _330;
    if (_239)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _334 = _328;
    bool _336 = _73 == 352;
    float _338 = _334;
    if (_239)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _340 = _332;
    float _342 = _340;
    if (_249)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _344 = _338;
    bool _346 = _73 == 368;
    float _348 = _344;
    if (_249)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _350 = _342;
    float _352 = _350;
    if (_261)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _354 = _348;
    float _356 = 1.0 / _326;
    bool _358 = _73 == 384;
    float _360 = _354;
    if (_261)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _362 = _352;
    float _364 = _362;
    if (_269)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _366 = _360;
    bool _368 = _73 == 400;
    float _370 = _366;
    if (_269)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _372 = _364;
    bool _374 = _73 == 416;
    float _376 = _372;
    if (_312)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _378 = _370;
    float _380 = _378;
    if (_312)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _382 = _376;
    float _384 = _382;
    if (_324)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _386 = _380;
    bool _388 = _73 == 432;
    float _390 = _386;
    if (_324)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _392 = _384;
    float _394 = _392;
    if (_336)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _396 = _390;
    bool _398 = _73 == 448;
    float _400 = _396;
    if (_336)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_346)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _406 = _400;
    bool _408 = _73 == 464;
    float _410 = _406;
    if (_346)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_358)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _416 = _410;
    bool _418 = _73 == 480;
    float _420 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_368)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _426 = _420;
    bool _428 = _73 == 496;
    float _430 = _426;
    if (_368)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _436 = _430;
    bool _438 = _73 == 512;
    float _440 = _436;
    if (_374)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _442 = _434;
    bool _444 = _73 == 528;
    float _446 = _442;
    if (_388)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _448 = _440;
    float _450 = _448;
    if (_388)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _452 = _446;
    float _454 = _452;
    if (_398)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _456 = _450;
    bool _458 = _73 == 544;
    float _460 = _456;
    if (_398)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _462 = _454;
    float _464 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _466 = _460;
    bool _468 = _73 == 560;
    float _470 = _466;
    if (_408)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _472 = _464;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _476 = _470;
    bool _478 = _73 == 576;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _486 = _480;
    bool _488 = _73 == 592;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _496 = _490;
    bool _498 = _73 == 608;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _506 = _500;
    bool _508 = _73 == 624;
    float _510 = _506;
    if (_444)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _512 = _504;
    bool _514 = _73 == 640;
    float _516 = _512;
    if (_458)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _518 = _510;
    float _520 = _518;
    if (_458)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _522 = _516;
    float _524 = _522;
    if (_468)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _526 = _520;
    bool _528 = _73 == 656;
    float _530 = _526;
    if (_468)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _532 = _524;
    float _534 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _536 = _530;
    bool _538 = _73 == 672;
    float _540 = _536;
    if (_478)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _542 = _534;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _546 = _540;
    bool _548 = _73 == 688;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _556 = _550;
    bool _558 = _73 == 704;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _566 = _560;
    bool _568 = _73 == 720;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_514)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _576 = _570;
    bool _578 = _73 == 736;
    float _580 = _576;
    if (_514)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _582 = _574;
    bool _584 = _73 == 752;
    float _586 = _582;
    if (_528)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _588 = _580;
    float _590 = _588;
    if (_538)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_548)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_558)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_568)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_578)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_584)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _612 = _610;
    float _614 = _356 * _612;
    if (_528)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _616 = _586;
    float _618 = _616;
    if (_538)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _620 = _618;
    float _622 = _614 * _60;
    float _624 = _620;
    if (_548)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_558)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _630 = _628;
    float _632 = floor(_622);
    float _634 = _630;
    if (_568)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_578)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _640 = _638;
    float _642 = _640;
    if (_584)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _644 = _642;
    float _646 = -_632;
    float _648 = _622 + _646;
    float _650 = _326 * _644;
    float _652 = _648 * 2.0;
    float _654 = -_648;
    float _656 = fma(_650, _654, _60);
    float _658 = floor(_652);
    float _660 = _650 * _658;
    float _662 = _660 * 0.5;
    float _664 = _662 + _656;
    float _666 = fma(_64, _664, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _668 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _670 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _672 = _666 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _676 = _668 + _674;
    float _678 = _672 * _672;
    float _680 = fma(_71, _71, _678);
    float _682 = fma(_676, _676, _680);
    float _684 = sqrt(_682);
    float _686 = -_310;
    float _688 = fma(_684, _302, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = -_662;
    float _694 = fma(_692, _690, _664);
    float _696 = _662;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _700 = _658;
    if (!_99)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _702 = _696;
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _706 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _708 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _710 = _702;
    if (!_99)
    {
        float _712 = fma(_706, _702, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _277 = _712;
    }
    float _714 = _277;
    float _716 = _714;
    if (!_99)
    {
        float _718 = fma(_708, _702, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _698 = _718;
    }
    float _720 = _698;
    float _722 = _720;
    if (!_99)
    {
        float _724 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _714);
        _710 = _724;
    }
    float _726 = _710;
    if (!_99)
    {
        float _728 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _720);
        _722 = _728;
    }
    float _730 = _722;
    if (!_99)
    {
        float2 _2034 = float2(_726, _730);
        float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2034, float2(0.0), isnan(_2034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2034, float2(0.0), isnan(_2034)), level(0.0)).x;
        _716 = _732;
    }
    float _734 = _716;
    float _736 = 0.0;
    if (_99)
    {
        _736 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _738 = _736;
    if (_99)
    {
        _103 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _740 = _103;
    if (_99)
    {
        float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _738, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _700 = _742;
    }
    float _744 = _700;
    float _746 = _744;
    if (_99)
    {
        float _748 = fma(_704, _738, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _105 = _748;
    }
    float _750 = _105;
    float _752 = _750;
    if (_99)
    {
        float _754 = fma(_744, _740, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _746 = _754;
    }
    float _756 = _746;
    float _758 = _756;
    if (_99)
    {
        float _760 = fma(_750, _740, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_99)
    {
        float _766 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _756);
        _758 = _766;
    }
    float _768 = _758;
    if (_99)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _770;
    }
    float _772 = _764;
    float _774 = _734;
    if (_99)
    {
        float2 _2126 = float2(_768, _772);
        float _776 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2126, float2(0.0), isnan(_2126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2126, float2(0.0), isnan(_2126)), level(0.0)).x;
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _782 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _784 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _786 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    out.m_38.x = _782;
    out.m_38.y = _780;
    out.m_40.z = _786;
    out.m_40.w = _784;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _790 = _788 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _792 = _788 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _794 = _788 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_42.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_42.y = _788;
    out.m_42.z = _704;
    float _796 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _790);
    float _798 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _792);
    float _800 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _794);
    float _802 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[1].z, _796);
    float _804 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[0].z, _798);
    float _806 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[2].z, _800);
    float _808 = _802 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _810 = _804 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _814 = _808 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _816 = _808 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _818 = _808 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _820 = _808 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[7].x, _814);
    float _824 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[8].x, _816);
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[9].x, _818);
    float _828 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[10].x, _820);
    float _830 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[7].z, _822);
    float _832 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[8].z, _824);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[9].z, _826);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[10].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _840 = _832 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _842 = _834 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_44.w = _812;
    out.gl_Position.x = _838;
    out.gl_Position.y = _840;
    out.gl_Position.z = _842;
    out.gl_Position.w = _844;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_35.x;
    float _60 = in.m_35.y;
    float _62 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _67 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _69 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _71 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _69;
    int _73 = _67 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_64, _60, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _89 = _73 == 80;
    bool _91 = _58 >= 0.5;
    bool _93 = isnan(_58);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.5);
    bool _99 = _95 || _97;
    float _101 = as_type<float>(gl_BaseInstance);
    float _103 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _105 = _58;
    if (_77)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _107 = _101;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _87 + _109;
    float _113 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _115 = _73 == 96;
    float _117 = _111 * _111;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _121 = _113 + _119;
    float _123 = 0.0;
    float _125 = _107;
    if (_77)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _127 = _123;
    float _129 = fma(_71, _71, _117);
    float _131 = _127;
    if (_79)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _133 = _125;
    bool _135 = _73 == 112;
    float _137 = fma(_121, _121, _129);
    float _139 = _133;
    if (_79)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _141 = _131;
    float _143 = _141;
    if (_81)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _145 = _139;
    float _147 = rsqrt(_137);
    bool _149 = _73 == 128;
    float _151 = _145;
    if (_81)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _153 = _143;
    float _155 = _153;
    if (_83)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _157 = _151;
    bool _159 = _73 == 144;
    float _161 = _157;
    if (_83)
    {
        _155 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _163 = _155;
    float _165 = _163;
    if (_85)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _167 = _161;
    bool _169 = _73 == 160;
    float _171 = _167;
    if (_85)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _173 = _165;
    float _175 = _147 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _177 = _173;
    if (_89)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _171;
    bool _181 = _73 == 176;
    float _183 = _179;
    if (_89)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _185 = _177;
    float _187 = log2(_175);
    bool _189 = _73 == 192;
    float _191 = _185;
    if (_115)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _193 = _183;
    float _195 = _193;
    if (_115)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _197 = _191;
    float _199 = _197;
    if (_135)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _201 = _195;
    bool _203 = _73 == 208;
    float _205 = _201;
    if (_135)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _207 = _199;
    float _209 = _207;
    if (_149)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _211 = _205;
    bool _213 = _73 == 224;
    float _215 = _187 + 1.2999999523162841796875;
    float _217 = _211;
    if (_149)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _209;
    float _221 = _219;
    if (_159)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _223 = _217;
    bool _225 = _73 == 240;
    float _227 = trunc(_215);
    int _229 = int(_227);
    float _231 = _223;
    if (_159)
    {
        _221 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _233 = _221;
    float _235 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _237 = _231;
    bool _239 = _73 == 256;
    float _241 = _237;
    if (_169)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _243 = _235;
    float _245 = _243;
    if (_181)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _247 = _241;
    bool _249 = _73 == 272;
    float _251 = _247;
    if (_181)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_189)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _257 = _251;
    int _259 = min(_229, 15);
    bool _261 = _73 == 288;
    float _263 = _257;
    if (_189)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _265 = _255;
    float _267 = float(_259);
    bool _269 = _73 == 304;
    int _271 = _259 << 4;
    int _273 = _271 + 4288;
    float _275 = _265;
    float _277 = as_type<float>(_273);
    if (_203)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _279 = _263;
    float _281 = _279;
    if (_203)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _283 = _275;
    float _285 = -_267;
    float _287 = _285 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _289 = _283;
    if (_213)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _291 = _281;
    int _293 = _273 + 8;
    uint _296 = uint(int(uint(_293) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c14)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    bool _312 = _73 == 320;
    float _314 = _287 + 1.0;
    float _316 = _291;
    if (_213)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _318 = _289;
    float _320 = _318;
    if (_225)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _322 = _316;
    bool _324 = _73 == 336;
    float _326 = exp2(_314);
    float _328 = _322;
    if (_225)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _330 = _320;
    float _332 = _330;
    if (_239)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _334 = _328;
    bool _336 = _73 == 352;
    float _338 = _334;
    if (_239)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _340 = _332;
    float _342 = _340;
    if (_249)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _344 = _338;
    bool _346 = _73 == 368;
    float _348 = _344;
    if (_249)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _350 = _342;
    float _352 = _350;
    if (_261)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _354 = _348;
    float _356 = 1.0 / _326;
    bool _358 = _73 == 384;
    float _360 = _354;
    if (_261)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _362 = _352;
    float _364 = _362;
    if (_269)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _366 = _360;
    bool _368 = _73 == 400;
    float _370 = _366;
    if (_269)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _372 = _364;
    bool _374 = _73 == 416;
    float _376 = _372;
    if (_312)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _378 = _370;
    float _380 = _378;
    if (_312)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _382 = _376;
    float _384 = _382;
    if (_324)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _386 = _380;
    bool _388 = _73 == 432;
    float _390 = _386;
    if (_324)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _392 = _384;
    float _394 = _392;
    if (_336)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _396 = _390;
    bool _398 = _73 == 448;
    float _400 = _396;
    if (_336)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_346)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _406 = _400;
    bool _408 = _73 == 464;
    float _410 = _406;
    if (_346)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_358)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _416 = _410;
    bool _418 = _73 == 480;
    float _420 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_368)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _426 = _420;
    bool _428 = _73 == 496;
    float _430 = _426;
    if (_368)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _436 = _430;
    bool _438 = _73 == 512;
    float _440 = _436;
    if (_374)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _442 = _434;
    bool _444 = _73 == 528;
    float _446 = _442;
    if (_388)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _448 = _440;
    float _450 = _448;
    if (_388)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _452 = _446;
    float _454 = _452;
    if (_398)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _456 = _450;
    bool _458 = _73 == 544;
    float _460 = _456;
    if (_398)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _462 = _454;
    float _464 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _466 = _460;
    bool _468 = _73 == 560;
    float _470 = _466;
    if (_408)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _472 = _464;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _476 = _470;
    bool _478 = _73 == 576;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _486 = _480;
    bool _488 = _73 == 592;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _496 = _490;
    bool _498 = _73 == 608;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _506 = _500;
    bool _508 = _73 == 624;
    float _510 = _506;
    if (_444)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _512 = _504;
    bool _514 = _73 == 640;
    float _516 = _512;
    if (_458)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _518 = _510;
    float _520 = _518;
    if (_458)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _522 = _516;
    float _524 = _522;
    if (_468)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _526 = _520;
    bool _528 = _73 == 656;
    float _530 = _526;
    if (_468)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _532 = _524;
    float _534 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _536 = _530;
    bool _538 = _73 == 672;
    float _540 = _536;
    if (_478)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _542 = _534;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _546 = _540;
    bool _548 = _73 == 688;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _556 = _550;
    bool _558 = _73 == 704;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _566 = _560;
    bool _568 = _73 == 720;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_514)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _576 = _570;
    bool _578 = _73 == 736;
    float _580 = _576;
    if (_514)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _582 = _574;
    bool _584 = _73 == 752;
    float _586 = _582;
    if (_528)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _588 = _580;
    float _590 = _588;
    if (_538)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_548)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_558)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_568)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_578)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_584)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _612 = _610;
    float _614 = _356 * _612;
    if (_528)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _616 = _586;
    float _618 = _616;
    if (_538)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _620 = _618;
    float _622 = _614 * _60;
    float _624 = _620;
    if (_548)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_558)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _630 = _628;
    float _632 = floor(_622);
    float _634 = _630;
    if (_568)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_578)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _640 = _638;
    float _642 = _640;
    if (_584)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _644 = _642;
    float _646 = -_632;
    float _648 = _622 + _646;
    float _650 = _326 * _644;
    float _652 = _648 * 2.0;
    float _654 = -_648;
    float _656 = fma(_650, _654, _60);
    float _658 = floor(_652);
    float _660 = _650 * _658;
    float _662 = _660 * 0.5;
    float _664 = _662 + _656;
    float _666 = fma(_64, _664, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _668 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _670 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _672 = _666 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _676 = _668 + _674;
    float _678 = _672 * _672;
    float _680 = fma(_71, _71, _678);
    float _682 = fma(_676, _676, _680);
    float _684 = sqrt(_682);
    float _686 = -_310;
    float _688 = fma(_684, _302, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = -_662;
    float _694 = fma(_692, _690, _664);
    float _696 = _662;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _700 = _658;
    if (!_99)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _702 = _696;
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _706 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _708 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _710 = _702;
    if (!_99)
    {
        float _712 = fma(_706, _702, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _277 = _712;
    }
    float _714 = _277;
    float _716 = _714;
    if (!_99)
    {
        float _718 = fma(_708, _702, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _698 = _718;
    }
    float _720 = _698;
    float _722 = _720;
    if (!_99)
    {
        float _724 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _714);
        _710 = _724;
    }
    float _726 = _710;
    if (!_99)
    {
        float _728 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _720);
        _722 = _728;
    }
    float _730 = _722;
    if (!_99)
    {
        float2 _2034 = float2(_726, _730);
        float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2034, float2(0.0), isnan(_2034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2034, float2(0.0), isnan(_2034)), level(0.0)).x;
        _716 = _732;
    }
    float _734 = _716;
    float _736 = 0.0;
    if (_99)
    {
        _736 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _738 = _736;
    if (_99)
    {
        _103 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _740 = _103;
    if (_99)
    {
        float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _738, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _700 = _742;
    }
    float _744 = _700;
    float _746 = _744;
    if (_99)
    {
        float _748 = fma(_704, _738, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _105 = _748;
    }
    float _750 = _105;
    float _752 = _750;
    if (_99)
    {
        float _754 = fma(_744, _740, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _746 = _754;
    }
    float _756 = _746;
    float _758 = _756;
    if (_99)
    {
        float _760 = fma(_750, _740, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_99)
    {
        float _766 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _756);
        _758 = _766;
    }
    float _768 = _758;
    if (_99)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _770;
    }
    float _772 = _764;
    float _774 = _734;
    if (_99)
    {
        float2 _2126 = float2(_768, _772);
        float _776 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2126, float2(0.0), isnan(_2126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2126, float2(0.0), isnan(_2126)), level(0.0)).x;
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _782 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _784 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _786 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    out.m_38.x = _782;
    out.m_38.y = _780;
    out.m_40.z = _786;
    out.m_40.w = _784;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _790 = _788 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _792 = _788 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _794 = _788 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_42.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_42.y = _788;
    out.m_42.z = _704;
    float _796 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _790);
    float _798 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _792);
    float _800 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _794);
    float _802 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[1].z, _796);
    float _804 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[0].z, _798);
    float _806 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[2].z, _800);
    float _808 = _802 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _810 = _804 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _814 = _808 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _816 = _808 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _818 = _808 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _820 = _808 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[7].x, _814);
    float _824 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[8].x, _816);
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[9].x, _818);
    float _828 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[10].x, _820);
    float _830 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[7].z, _822);
    float _832 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[8].z, _824);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[9].z, _826);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[10].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _840 = _832 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _842 = _834 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_44.w = _812;
    out.gl_Position.x = _838;
    out.gl_Position.y = _840;
    out.gl_Position.z = _842;
    out.gl_Position.w = _844;
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_35.x;
    float _60 = in.m_35.y;
    float _62 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _67 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _69 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _71 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _69;
    int _73 = _67 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_64, _60, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _89 = _73 == 80;
    bool _91 = _58 >= 0.5;
    bool _93 = isnan(_58);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.5);
    bool _99 = _95 || _97;
    float _101 = as_type<float>(gl_BaseInstance);
    float _103 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _105 = _58;
    if (_77)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _107 = _101;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _87 + _109;
    float _113 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _115 = _73 == 96;
    float _117 = _111 * _111;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _121 = _113 + _119;
    float _123 = 0.0;
    float _125 = _107;
    if (_77)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _127 = _123;
    float _129 = fma(_71, _71, _117);
    float _131 = _127;
    if (_79)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _133 = _125;
    bool _135 = _73 == 112;
    float _137 = fma(_121, _121, _129);
    float _139 = _133;
    if (_79)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _141 = _131;
    float _143 = _141;
    if (_81)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _145 = _139;
    float _147 = rsqrt(_137);
    bool _149 = _73 == 128;
    float _151 = _145;
    if (_81)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _153 = _143;
    float _155 = _153;
    if (_83)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _157 = _151;
    bool _159 = _73 == 144;
    float _161 = _157;
    if (_83)
    {
        _155 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _163 = _155;
    float _165 = _163;
    if (_85)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _167 = _161;
    bool _169 = _73 == 160;
    float _171 = _167;
    if (_85)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _173 = _165;
    float _175 = _147 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _177 = _173;
    if (_89)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _171;
    bool _181 = _73 == 176;
    float _183 = _179;
    if (_89)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _185 = _177;
    float _187 = log2(_175);
    bool _189 = _73 == 192;
    float _191 = _185;
    if (_115)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _193 = _183;
    float _195 = _193;
    if (_115)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _197 = _191;
    float _199 = _197;
    if (_135)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _201 = _195;
    bool _203 = _73 == 208;
    float _205 = _201;
    if (_135)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _207 = _199;
    float _209 = _207;
    if (_149)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _211 = _205;
    bool _213 = _73 == 224;
    float _215 = _187 + 1.2999999523162841796875;
    float _217 = _211;
    if (_149)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _209;
    float _221 = _219;
    if (_159)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _223 = _217;
    bool _225 = _73 == 240;
    float _227 = trunc(_215);
    int _229 = int(_227);
    float _231 = _223;
    if (_159)
    {
        _221 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _233 = _221;
    float _235 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _237 = _231;
    bool _239 = _73 == 256;
    float _241 = _237;
    if (_169)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _243 = _235;
    float _245 = _243;
    if (_181)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _247 = _241;
    bool _249 = _73 == 272;
    float _251 = _247;
    if (_181)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_189)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _257 = _251;
    int _259 = min(_229, 15);
    bool _261 = _73 == 288;
    float _263 = _257;
    if (_189)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _265 = _255;
    float _267 = float(_259);
    bool _269 = _73 == 304;
    int _271 = _259 << 4;
    int _273 = _271 + 4288;
    float _275 = _265;
    float _277 = as_type<float>(_273);
    if (_203)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _279 = _263;
    float _281 = _279;
    if (_203)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _283 = _275;
    float _285 = -_267;
    float _287 = _285 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _289 = _283;
    if (_213)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _291 = _281;
    int _293 = _273 + 8;
    uint _296 = uint(int(uint(_293) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c14)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    bool _312 = _73 == 320;
    float _314 = _287 + 1.0;
    float _316 = _291;
    if (_213)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _318 = _289;
    float _320 = _318;
    if (_225)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _322 = _316;
    bool _324 = _73 == 336;
    float _326 = exp2(_314);
    float _328 = _322;
    if (_225)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _330 = _320;
    float _332 = _330;
    if (_239)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _334 = _328;
    bool _336 = _73 == 352;
    float _338 = _334;
    if (_239)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _340 = _332;
    float _342 = _340;
    if (_249)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _344 = _338;
    bool _346 = _73 == 368;
    float _348 = _344;
    if (_249)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _350 = _342;
    float _352 = _350;
    if (_261)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _354 = _348;
    float _356 = 1.0 / _326;
    bool _358 = _73 == 384;
    float _360 = _354;
    if (_261)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _362 = _352;
    float _364 = _362;
    if (_269)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _366 = _360;
    bool _368 = _73 == 400;
    float _370 = _366;
    if (_269)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _372 = _364;
    bool _374 = _73 == 416;
    float _376 = _372;
    if (_312)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _378 = _370;
    float _380 = _378;
    if (_312)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _382 = _376;
    float _384 = _382;
    if (_324)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _386 = _380;
    bool _388 = _73 == 432;
    float _390 = _386;
    if (_324)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _392 = _384;
    float _394 = _392;
    if (_336)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _396 = _390;
    bool _398 = _73 == 448;
    float _400 = _396;
    if (_336)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_346)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _406 = _400;
    bool _408 = _73 == 464;
    float _410 = _406;
    if (_346)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_358)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _416 = _410;
    bool _418 = _73 == 480;
    float _420 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_368)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _426 = _420;
    bool _428 = _73 == 496;
    float _430 = _426;
    if (_368)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _436 = _430;
    bool _438 = _73 == 512;
    float _440 = _436;
    if (_374)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _442 = _434;
    bool _444 = _73 == 528;
    float _446 = _442;
    if (_388)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _448 = _440;
    float _450 = _448;
    if (_388)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _452 = _446;
    float _454 = _452;
    if (_398)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _456 = _450;
    bool _458 = _73 == 544;
    float _460 = _456;
    if (_398)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _462 = _454;
    float _464 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _466 = _460;
    bool _468 = _73 == 560;
    float _470 = _466;
    if (_408)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _472 = _464;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _476 = _470;
    bool _478 = _73 == 576;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _486 = _480;
    bool _488 = _73 == 592;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _496 = _490;
    bool _498 = _73 == 608;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _506 = _500;
    bool _508 = _73 == 624;
    float _510 = _506;
    if (_444)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _512 = _504;
    bool _514 = _73 == 640;
    float _516 = _512;
    if (_458)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _518 = _510;
    float _520 = _518;
    if (_458)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _522 = _516;
    float _524 = _522;
    if (_468)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _526 = _520;
    bool _528 = _73 == 656;
    float _530 = _526;
    if (_468)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _532 = _524;
    float _534 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _536 = _530;
    bool _538 = _73 == 672;
    float _540 = _536;
    if (_478)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _542 = _534;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _546 = _540;
    bool _548 = _73 == 688;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _556 = _550;
    bool _558 = _73 == 704;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _566 = _560;
    bool _568 = _73 == 720;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_514)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _576 = _570;
    bool _578 = _73 == 736;
    float _580 = _576;
    if (_514)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _582 = _574;
    bool _584 = _73 == 752;
    float _586 = _582;
    if (_528)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _588 = _580;
    float _590 = _588;
    if (_538)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_548)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_558)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_568)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_578)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_584)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _612 = _610;
    float _614 = _356 * _612;
    if (_528)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _616 = _586;
    float _618 = _616;
    if (_538)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _620 = _618;
    float _622 = _614 * _60;
    float _624 = _620;
    if (_548)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_558)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _630 = _628;
    float _632 = floor(_622);
    float _634 = _630;
    if (_568)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_578)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _640 = _638;
    float _642 = _640;
    if (_584)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _644 = _642;
    float _646 = -_632;
    float _648 = _622 + _646;
    float _650 = _326 * _644;
    float _652 = _648 * 2.0;
    float _654 = -_648;
    float _656 = fma(_650, _654, _60);
    float _658 = floor(_652);
    float _660 = _650 * _658;
    float _662 = _660 * 0.5;
    float _664 = _662 + _656;
    float _666 = fma(_64, _664, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _668 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _670 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _672 = _666 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _676 = _668 + _674;
    float _678 = _672 * _672;
    float _680 = fma(_71, _71, _678);
    float _682 = fma(_676, _676, _680);
    float _684 = sqrt(_682);
    float _686 = -_310;
    float _688 = fma(_684, _302, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = -_662;
    float _694 = fma(_692, _690, _664);
    float _696 = _662;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _700 = _658;
    if (!_99)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _702 = _696;
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _706 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _708 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _710 = _702;
    if (!_99)
    {
        float _712 = fma(_706, _702, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _277 = _712;
    }
    float _714 = _277;
    float _716 = _714;
    if (!_99)
    {
        float _718 = fma(_708, _702, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _698 = _718;
    }
    float _720 = _698;
    float _722 = _720;
    if (!_99)
    {
        float _724 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _714);
        _710 = _724;
    }
    float _726 = _710;
    if (!_99)
    {
        float _728 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _720);
        _722 = _728;
    }
    float _730 = _722;
    if (!_99)
    {
        float2 _2034 = float2(_726, _730);
        float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2034, float2(0.0), isnan(_2034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2034, float2(0.0), isnan(_2034)), level(0.0)).x;
        _716 = _732;
    }
    float _734 = _716;
    float _736 = 0.0;
    if (_99)
    {
        _736 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _738 = _736;
    if (_99)
    {
        _103 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _740 = _103;
    if (_99)
    {
        float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _738, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _700 = _742;
    }
    float _744 = _700;
    float _746 = _744;
    if (_99)
    {
        float _748 = fma(_704, _738, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _105 = _748;
    }
    float _750 = _105;
    float _752 = _750;
    if (_99)
    {
        float _754 = fma(_744, _740, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _746 = _754;
    }
    float _756 = _746;
    float _758 = _756;
    if (_99)
    {
        float _760 = fma(_750, _740, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_99)
    {
        float _766 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _756);
        _758 = _766;
    }
    float _768 = _758;
    if (_99)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _770;
    }
    float _772 = _764;
    float _774 = _734;
    if (_99)
    {
        float2 _2126 = float2(_768, _772);
        float _776 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2126, float2(0.0), isnan(_2126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2126, float2(0.0), isnan(_2126)), level(0.0)).x;
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _782 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _784 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _786 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    out.m_38.x = _782;
    out.m_38.y = _780;
    out.m_40.z = _786;
    out.m_40.w = _784;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _790 = _788 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _792 = _788 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _794 = _788 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_42.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_42.y = _788;
    out.m_42.z = _704;
    float _796 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _790);
    float _798 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _792);
    float _800 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _794);
    float _802 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[1].z, _796);
    float _804 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[0].z, _798);
    float _806 = fma(_704, (*spvDescriptorSet0.vp_c4)._m0[2].z, _800);
    float _808 = _802 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _810 = _804 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _814 = _808 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _816 = _808 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _818 = _808 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _820 = _808 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[7].x, _814);
    float _824 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[8].x, _816);
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[9].x, _818);
    float _828 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[10].x, _820);
    float _830 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[7].z, _822);
    float _832 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[8].z, _824);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[9].z, _826);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[10].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _840 = _832 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _842 = _834 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_44.w = _812;
    out.gl_Position.x = _838;
    out.gl_Position.y = _840;
    out.gl_Position.z = _842;
    out.gl_Position.w = _844;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

