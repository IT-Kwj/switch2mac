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
    float4 m_54 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5585 = false;
    bool _2437 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_51.x;
    float _80 = in.m_51.y;
    float _82 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _84 = _82 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _87 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _89 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _91 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _89;
    int _93 = _87 << 4;
    bool _97 = _93 == 0;
    bool _99 = _93 == 16;
    bool _101 = _93 == 32;
    bool _103 = _93 == 48;
    bool _105 = _93 == 64;
    float _107 = fma(_84, _80, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _109 = _93 == 80;
    bool _111 = _78 >= 0.5;
    bool _113 = isnan(_78);
    bool _115 = _111 || _113;
    bool _117 = isnan(0.5);
    bool _119 = _115 || _117;
    float _121 = as_type<float>(gl_BaseInstance);
    float _123 = _80;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_97)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _127 = _121;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _131 = _107 + _129;
    float _133 = fma(_80, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _135 = _93 == 96;
    float _137 = _131 * _131;
    float _139 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _141 = _133 + _139;
    float _143 = 0.0;
    float _145 = _127;
    if (_97)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _147 = _143;
    float _149 = fma(_91, _91, _137);
    float _151 = _147;
    if (_99)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _153 = _145;
    bool _155 = _93 == 112;
    float _157 = fma(_141, _141, _149);
    float _159 = _153;
    if (_99)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _161 = _151;
    float _163 = _161;
    if (_101)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _165 = _159;
    float _167 = rsqrt(_157);
    bool _169 = _93 == 128;
    float _171 = _165;
    if (_101)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _173 = _163;
    float _175 = _173;
    if (_103)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _177 = _171;
    bool _179 = _93 == 144;
    float _181 = _177;
    if (_103)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _183 = _175;
    float _185 = _183;
    if (_105)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _187 = _181;
    bool _189 = _93 == 160;
    float _191 = _187;
    if (_105)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _193 = _185;
    float _195 = _167 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _197 = _193;
    if (_109)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _199 = _191;
    bool _201 = _93 == 176;
    float _203 = _199;
    if (_109)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _205 = _197;
    float _207 = log2(_195);
    bool _209 = _93 == 192;
    float _211 = _205;
    if (_135)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _213 = _203;
    float _215 = _213;
    if (_135)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _217 = _211;
    float _219 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _221 = _215;
    bool _223 = _93 == 208;
    float _225 = _221;
    if (_155)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _227 = _219;
    float _229 = _227;
    if (_169)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _231 = _225;
    bool _233 = _93 == 224;
    float _235 = _207 + 1.2999999523162841796875;
    float _237 = _231;
    if (_169)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _239 = _229;
    float _241 = _239;
    if (_179)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _243 = _237;
    bool _245 = _93 == 240;
    float _247 = trunc(_235);
    int _249 = int(_247);
    float _251 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _253 = _241;
    float _255 = _253;
    if (_189)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _257 = _251;
    bool _259 = _93 == 256;
    float _261 = _257;
    if (_189)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _267 = _261;
    bool _269 = _93 == 272;
    float _271 = _267;
    if (_201)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _273 = _265;
    float _275 = _273;
    if (_209)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _277 = _271;
    int _279 = min(_249, 15);
    bool _281 = _93 == 288;
    float _283 = _277;
    if (_209)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _285 = _275;
    float _287 = float(_279);
    bool _289 = _93 == 304;
    int _291 = _279 << 4;
    int _293 = _291 + 4288;
    float _295 = _285;
    float _297 = as_type<float>(_293);
    if (_223)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _299 = _283;
    float _301 = _299;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _303 = _295;
    float _305 = -_287;
    float _307 = _305 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _309 = _303;
    if (_233)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _311 = _301;
    int _313 = _293 + 8;
    uint _316 = uint(int(uint(_313) >> uint(2)));
    uint _318 = uint(int(uint(int(_316)) >> uint(2)));
    int _320 = int(_316) & 3;
    float _322 = (*spvDescriptorSet0.vp_c14)._m0[int(_318)][_320];
    int _324 = int(_316) + 1;
    uint _326 = uint(int(uint(_324) >> uint(2)));
    int _328 = _324 & 3;
    float _330 = (*spvDescriptorSet0.vp_c14)._m0[int(_326)][_328];
    bool _332 = _93 == 320;
    float _334 = _307 + 1.0;
    float _336 = _311;
    if (_233)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _338 = _309;
    float _340 = _338;
    if (_245)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _342 = _336;
    bool _344 = _93 == 336;
    float _346 = exp2(_334);
    float _348 = _342;
    if (_245)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _350 = _340;
    float _352 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _354 = _348;
    bool _356 = _93 == 352;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_269)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _364 = _358;
    bool _366 = _93 == 368;
    float _368 = _364;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _370 = _362;
    float _372 = _370;
    if (_281)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _374 = _368;
    float _376 = 1.0 / _346;
    bool _378 = _93 == 384;
    float _380 = _374;
    if (_281)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _382 = _372;
    float _384 = _382;
    if (_289)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _386 = _380;
    bool _388 = _93 == 400;
    float _390 = _386;
    if (_289)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _392 = _384;
    bool _394 = _93 == 416;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _398 = _390;
    float _400 = _398;
    if (_332)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _402 = _396;
    float _404 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _406 = _400;
    bool _408 = _93 == 432;
    float _410 = _406;
    if (_344)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_356)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _416 = _410;
    bool _418 = _93 == 448;
    float _420 = _416;
    if (_356)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_366)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _426 = _420;
    bool _428 = _93 == 464;
    float _430 = _426;
    if (_366)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_378)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _436 = _430;
    bool _438 = _93 == 480;
    float _440 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _442 = _434;
    float _444 = _442;
    if (_388)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _446 = _440;
    bool _448 = _93 == 496;
    float _450 = _446;
    if (_388)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _452 = _444;
    float _454 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _456 = _450;
    bool _458 = _93 == 512;
    float _460 = _456;
    if (_394)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _462 = _454;
    bool _464 = _93 == 528;
    float _466 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _468 = _460;
    float _470 = _468;
    if (_408)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _472 = _466;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _476 = _470;
    bool _478 = _93 == 544;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _486 = _480;
    bool _488 = _93 == 560;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _496 = _490;
    bool _498 = _93 == 576;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_448)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _506 = _500;
    bool _508 = _93 == 592;
    float _510 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _512 = _504;
    float _514 = _512;
    if (_458)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _516 = _510;
    bool _518 = _93 == 608;
    float _520 = _516;
    if (_458)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _522 = _514;
    float _524 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _526 = _520;
    bool _528 = _93 == 624;
    float _530 = _526;
    if (_464)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _532 = _524;
    bool _534 = _93 == 640;
    float _536 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _538 = _530;
    float _540 = _538;
    if (_478)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _542 = _536;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _546 = _540;
    bool _548 = _93 == 656;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _556 = _550;
    bool _558 = _93 == 672;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _566 = _560;
    bool _568 = _93 == 688;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_518)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _576 = _570;
    bool _578 = _93 == 704;
    float _580 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _582 = _574;
    float _584 = _582;
    if (_528)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _586 = _580;
    bool _588 = _93 == 720;
    float _590 = _586;
    if (_528)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _592 = _584;
    float _594 = _592;
    if (_534)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _596 = _590;
    bool _598 = _93 == 736;
    float _600 = _596;
    if (_534)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _602 = _594;
    bool _604 = _93 == 752;
    float _606 = _602;
    if (_548)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _608 = _600;
    float _610 = _608;
    if (_558)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_568)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_578)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _620 = _618;
    float _622 = _620;
    if (_588)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _624 = _622;
    float _626 = _624;
    if (_598)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _628 = _626;
    float _630 = _628;
    if (_604)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _632 = _630;
    float _634 = _376 * _632;
    if (_548)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _636 = _606;
    float _638 = _636;
    if (_558)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _640 = _638;
    float _642 = _634 * _80;
    float _644 = _640;
    if (_568)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_578)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _650 = _648;
    float _652 = floor(_642);
    float _654 = _650;
    if (_588)
    {
        _654 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _656 = _654;
    float _658 = _656;
    if (_598)
    {
        _658 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _660 = _658;
    float _662 = _660;
    if (_604)
    {
        _662 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _664 = _662;
    float _666 = _346 * _664;
    float _668 = -_652;
    float _670 = _642 + _668;
    float _672 = _670 * 2.0;
    float _674 = -_670;
    float _676 = fma(_666, _674, _80);
    float _678 = floor(_672);
    float _680 = _666 * _678;
    float _682 = _680 * 0.5;
    float _684 = _682 + _676;
    float _686 = fma(_84, _684, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _688 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _692 = _686 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _696 = _688 + _694;
    float _698 = _692 * _692;
    float _700 = fma(_91, _91, _698);
    float _702 = fma(_696, _696, _700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _706 = sqrt(_702);
    int _708 = _704 + 76;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c6)._m0[int(_712)][_714];
    float _718 = -_330;
    float _720 = fma(_706, _322, _718);
    float _722 = precise::clamp(_720, 0.0, 1.0);
    uint _724 = uint(int(uint(_704) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c6)._m0[int(_726)][_728];
    float _732 = -_682;
    float _734 = fma(_732, _722, _684);
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _738 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _740 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _738;
    float _742 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _744 = _736 + _742;
    float _746 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _748 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _750 = _736 + _748;
    float _752 = abs(_740);
    float _754 = abs(_744);
    float _756 = precise::max(_752, _754);
    float _758 = _716 + 8.0;
    float _760 = _682;
    float _762 = _322;
    float _764 = _684;
    float _766 = _756;
    float _768 = _750;
    float _770 = _746;
    if (!_119)
    {
        float _772 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _760 = _772;
    }
    float _774 = _760;
    float _776 = _758 + _756;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _780 = _776 * _730;
    float _782 = _780 * 4.0;
    float _784 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _786 = _774;
    if (!_119)
    {
        float _788 = _774 + _778;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = precise::max(_782, 1.0);
    float _794 = _790;
    if (!_119)
    {
        float _796 = fma(_784, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _762 = _796;
    }
    float _798 = _762;
    float _800 = log2(_792);
    float _802 = _798;
    if (!_119)
    {
        float _804 = _798 + _778;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _808;
    float _812 = trunc(_800);
    int _814 = int(_812);
    float _816 = floor(_800);
    int _818 = min(_814, 4);
    int _820 = _818 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _822 = _820 << 4;
    float _824 = _816 + 1.0;
    float _826 = rint(_816);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    uint _834 = uint(int(uint(_822) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c6)._m0[int(_836)][_838];
    float _842 = rint(_824);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    uint _848 = clamp(_846, 0u, 65535u);
    int _850 = _822 + 16;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.vp_c6)._m0[int(_854)][_856];
    float _860 = fma(_750, _840, 0.5);
    float _862 = fma(_810, _840, 0.5);
    float _864 = fma(_750, _858, 0.5);
    float _866 = fma(_810, _858, 0.5);
    float _868 = _864;
    float _870 = _824;
    float _872 = _806;
    if (!_119)
    {
        float2 _7249 = float2(_806, _790);
        float4 _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7249, float2(0.0), isnan(_7249)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7249, float2(0.0), isnan(_7249)), level(0.0)).xyzw;
        float _877 = _875.x;
        float _879 = _875.y;
        float _881 = _875.z;
        float _883 = _875.w;
        _764 = _877;
        _766 = _879;
        _768 = _881;
        _297 = _883;
    }
    float _885 = _764;
    float _887 = _766;
    float _889 = _768;
    float _891 = _297;
    float3 _7279 = float3(_862, _860, float(int(_832)));
    float3 _7283 = select(_7279, float3(0.0), isnan(_7279));
    float3 _895 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7283.xy, uint(rint(_7283.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7283.xy, uint(rint(_7283.z)), level(0.0)).xyz;
    float _897 = _895.x;
    float _899 = _895.y;
    float _901 = _895.z;
    float3 _7298 = float3(_866, _864, float(int(_848)));
    float3 _7300 = select(_7298, float3(0.0), isnan(_7298));
    float3 _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7300.xy, uint(rint(_7300.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7300.xy, uint(rint(_7300.z)), level(0.0)).xyz;
    float _905 = _903.x;
    float _907 = _903.y;
    float _909 = _903.z;
    float _911 = (*spvDescriptorSet0.vp_c15)._m0[0].z + 1.953125;
    float _913 = _911;
    if (_119)
    {
        _123 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _915 = _123;
    float _917 = _736 + 1.953125;
    float _919 = 0.0;
    float _921 = _915;
    if (_119)
    {
        _919 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _923 = _919;
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (_119)
    {
        float _927 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _915, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _913 = _927;
    }
    float _929 = _913;
    if (_119)
    {
        float _931 = fma(_736, _915, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _921 = _931;
    }
    float _933 = _921;
    float _935 = fma(_917, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _937 = _933;
    if (_119)
    {
        float _939 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _746, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _868 = _939;
    }
    float _941 = _868;
    if (_119)
    {
        float _943 = fma(_929, _923, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _870 = _943;
    }
    float _945 = _870;
    float _947 = _945;
    if (_119)
    {
        float _949 = fma(_933, _923, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _937 = _949;
    }
    float _951 = _937;
    float _953 = fma(_925, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_119)
    {
        float _955 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _784, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _125 = _955;
    }
    float _957 = _125;
    if (_119)
    {
        float _959 = _945 + _778;
        _947 = _959;
    }
    float _961 = _947;
    if (_119)
    {
        float _963 = _951 + _778;
        _770 = _963;
    }
    float _965 = _770;
    float _967 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    if (_119)
    {
        float _969 = _778 + _941;
        _794 = _969;
    }
    float _971 = _794;
    float _973 = _953 + _778;
    float _975 = _885;
    float _977 = _887;
    float _979 = _889;
    float _981 = _891;
    if (_119)
    {
        float2 _7455 = float2(_961, _965);
        float4 _983 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7455, float2(0.0), isnan(_7455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7455, float2(0.0), isnan(_7455)), level(0.0)).xyzw;
        float _985 = _983.x;
        float _987 = _983.y;
        float _989 = _983.z;
        float _991 = _983.w;
        _975 = _985;
        _977 = _987;
        _979 = _989;
        _981 = _991;
    }
    float _993 = _975;
    float _995 = _977;
    float _997 = _979;
    float _999 = _981;
    float _1001 = _967 + _778;
    if (_119)
    {
        float _1003 = _778 + _957;
        _872 = _1003;
    }
    float _1005 = _872;
    float2 _7491 = float2(_973, _971);
    float _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7491, float2(0.0), isnan(_7491)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7491, float2(0.0), isnan(_7491)), level(0.0)).x;
    float2 _7499 = float2(_1005, _1001);
    float _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7499, float2(0.0), isnan(_7499)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7499, float2(0.0), isnan(_7499)), level(0.0)).x;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _1013 = _736 * 0.00012500000593718141317367553710938;
    float _1015 = -_816;
    float _1017 = _800 + _1015;
    float _1019 = abs(_1011);
    float _1021 = abs(_1013);
    float _1023 = precise::max(_1019, _1021);
    float _1025 = fma(_1017, 5.42372894287109375, -4.338983058929443359375);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_1023, 20.0, -19.0);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = -_1031;
    float _1035 = _1033 + 1.0;
    float _1037 = -_901;
    float _1039 = _1037 + _909;
    float _1041 = -_897;
    float _1043 = _1041 + _905;
    float _1045 = -_899;
    float _1047 = _1045 + _907;
    float _1049 = fma(_1027, _1039, _901);
    float _1051 = fma(_1027, _1043, _897);
    float _1053 = fma(_1027, _1047, _899);
    float _1055 = fma(_1035, _1049, _736);
    float _1057 = fma(_1035, _1051, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _1059 = fma(_736, 0.008000000379979610443115234375, 64.0);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1063 = _1055 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1067 = _1057 + _1065;
    float _1069 = precise::max(0.0, _1059);
    float _1071 = _1063 * _1063;
    float _1073 = precise::min(_1069, 127.0);
    float _1075 = fma(_1067, _1067, _1071);
    float _1077 = fma(0.008000000379979610443115234375, (*spvDescriptorSet0.vp_c15)._m0[0].z, 64.0);
    float _1079 = fma(_993, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1081 = trunc(_1073);
    int _1083 = int(_1081);
    bool _1085 = _1075 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1087 = isnan(_1075);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1093 = _1089 || _1091;
    float _1095 = precise::max(0.0, _1077);
    float _1097 = fma(_1035, _1053, _1079);
    float _1099 = precise::min(_1095, 127.0);
    float _1101 = _1063 * _1063;
    float _1103 = trunc(_1099);
    int _1105 = int(_1103);
    float _1107 = fma(_1067, _1067, _1101);
    float _1109 = 64.0;
    float _1111 = _1101;
    float _1113 = _1069;
    float _1115 = _993;
    float _1117 = _1097;
    float _1119 = _1075;
    if (!_1093)
    {
        _1109 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_1093)
    {
        float _1125 = -_1075;
        float _1127 = _1125 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1111 = _1127;
    }
    float _1129 = _1111;
    float _1131 = _1129;
    if (!_1093)
    {
        float _1133 = _1075 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1113 = _1133;
    }
    float _1135 = _1113;
    if (!_1093)
    {
        float _1137 = -_1129;
        float _1139 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = sqrt(_1107);
    float _1145 = _1141;
    if (!_1093)
    {
        float _1147 = precise::min(_1097, _1141);
        _1145 = _1147;
    }
    float _1149 = _1145;
    if (!_1093)
    {
        float _1151 = -_1149;
        float _1153 = _1097 + _1151;
        _1115 = _1153;
    }
    float _1155 = _1115;
    float _1157 = _1155;
    if (!_1093)
    {
        float _1159 = fma(_1135, _1155, _1149);
        _1117 = _1159;
    }
    float _1161 = _1117;
    int _1163 = _1083 << 7;
    int _1165 = _1163 + _1105;
    bool _1167 = _1143 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1169 = _1161 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    int _1171 = _1165 << 4;
    float _1173 = fma(_1057, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1169);
    int _1175 = _1171 + 8;
    float _1177 = fma(_1055, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1173);
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1181 = as_type<float>(_1165);
    if (!_1167)
    {
        _1123 = _1057;
    }
    float _1183 = _1123;
    float _1185 = _1183;
    if (!_1167)
    {
        _1157 = _1055;
    }
    float _1187 = _1157;
    float _1189 = _1187;
    if (!_1167)
    {
        _1119 = _1161;
    }
    float _1191 = _1119;
    float _1193 = _1191;
    if (!_1167)
    {
        _1181 = _1179;
    }
    float _1195 = _1181;
    bool _1197 = !_1167;
    float _1199 = _1195;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1205 = _1143 + _1203;
        float _1207 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1209 = _1205 * _1201;
        float _1211 = rsqrt(_1107);
        float _1213 = _1209 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1221, _1207, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1227 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1229 = _1211 * _1225;
        float _1231 = fma(_1217, _1161, _1227);
        float _1233 = fma(_1067, _1229, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1235 = _1231 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1237 = fma(_1063, _1229, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1239 = fma(_1233, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1235);
        float _1241 = fma(_1237, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1239);
        float _1243 = _1241 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1193 = _1231;
        _1185 = _1233;
        _1189 = _1237;
        _1199 = _1243;
    }
    float _1245 = _1193;
    float _1247 = _1185;
    float _1249 = _1189;
    float _1251 = _1199;
    uint _1253 = uint(int(uint(_1175) >> uint(2)));
    float _1255 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1253)]);
    float _1257 = floor(_1099);
    int _1259 = _1171 + 12;
    uint _1261 = uint(int(uint(_1171) >> uint(2)));
    float _1263 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1261)]);
    uint _1265 = uint(int(uint(_1259) >> uint(2)));
    float _1267 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1265)]);
    float _1269 = floor(_1073);
    float _1271 = -_1257;
    float _1273 = _1099 + _1271;
    float _1275 = -_1269;
    float _1277 = _1073 + _1275;
    int _1279 = _1171 + 4;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    float _1283 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1281)]);
    float _1285 = _1255 + _1273;
    float _1287 = precise::clamp(_1285, 0.0, 1.0);
    float _1289 = _1255 + _1277;
    float _1291 = precise::clamp(_1289, 0.0, 1.0);
    bool _1293 = _1287 >= 1.0;
    bool _1295 = isnan(_1287);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(1.0);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    bool _1305 = _1291 >= 1.0;
    bool _1307 = isnan(_1291);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(1.0);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = trunc(_1303);
    int _1319 = int(_1317);
    float _1321 = trunc(_1315);
    int _1323 = int(_1321);
    int _1325 = _1105 + _1319;
    int _1327 = _1083 << 7;
    int _1329 = _1327 + _1325;
    int _1331 = _1083 + _1323;
    int _1333 = _1331 << 7;
    int _1335 = _1333 + _1105;
    int _1337 = _1331 << 7;
    int _1339 = _1337 + _1325;
    int _1341 = _1335 << 4;
    int _1343 = _1339 << 4;
    int _1345 = _1329 << 4;
    uint _1347 = uint(int(uint(_1341) >> uint(2)));
    float _1349 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1347)]);
    int _1351 = _1341 + 12;
    int _1353 = _1343 + 12;
    uint _1355 = uint(int(uint(_1343) >> uint(2)));
    float _1357 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1355)]);
    int _1359 = _1345 + 12;
    uint _1361 = uint(int(uint(_1351) >> uint(2)));
    float _1363 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1361)]);
    uint _1365 = uint(int(uint(_1353) >> uint(2)));
    float _1367 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1365)]);
    uint _1369 = uint(int(uint(_1359) >> uint(2)));
    float _1371 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1369)]);
    uint _1373 = uint(int(uint(_1345) >> uint(2)));
    float _1375 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1373)]);
    float _1377 = fma(_1007, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1379 = fma(_1009, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1381 = -_1079;
    float _1383 = _1381 + _1377;
    float _1385 = -_1079;
    float _1387 = _1385 + _1379;
    float _1389 = floor(_1287);
    float _1391 = fma(_999, 255.99609375, 7.629510946571826934814453125e-06);
    float _1393 = floor(_1291);
    float _1395 = _1267 * _1273;
    float _1397 = _1383 * 1.953125;
    float _1399 = _1283 * _1273;
    float _1401 = _1283 * _1277;
    float _1403 = _1387 * 1.953125;
    float _1405 = -_1389;
    float _1407 = _1287 + _1405;
    float _1409 = _1267 * _1277;
    float _1411 = floor(_1399);
    float _1413 = _1267 * _1407;
    float _1415 = -_1393;
    float _1417 = _1291 + _1415;
    float _1419 = floor(_1401);
    float _1421 = _1267 * _1417;
    float _1423 = floor(_1409);
    float _1425 = floor(_1395);
    float _1427 = _1411 + _1419;
    float _1429 = floor(_1421);
    float _1431 = fma(_995, 200.0, -100.0);
    float _1433 = floor(_1413);
    float _1435 = fma(_997, 200.0, -100.0);
    float _1437 = 1.0 / _1267;
    float _1439 = _1245 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1441 = _1245 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1443 = fma(_1397, _1397, 14.55191516876220703125);
    float _1445 = floor(_1391);
    float _1447 = fma(_1247, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1439);
    float _1449 = fma(_1267, _1423, _1425);
    float _1451 = fma(_1247, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1441);
    float _1453 = fma(_1403, _1403, _1443);
    float _1455 = trunc(_1427);
    int _1457 = int(_1455);
    float _1459 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1451);
    float _1461 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1447);
    float _1463 = _1459 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1465 = rsqrt(_1453);
    float _1467 = -_1445;
    float _1469 = _1391 + _1467;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1475 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1477 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1479 = trunc(_1449);
    int _1481 = int(_1479);
    int _1483 = _1457 & 1;
    bool _1485 = _1483 != 0;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    bool _1489 = _1469 > 0.499000012874603271484375;
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1473);
    float _1493 = -_1411;
    float _1495 = _1399 + _1493;
    float _1497 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1475);
    float _1499 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1477);
    float _1501 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1487);
    float _1503 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1491);
    float _1505 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1497);
    float _1507 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1499);
    float _1509 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1501);
    float _1511 = _1397 * _1465;
    float _1513 = _1435 * _1435;
    float _1515 = _1503 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1517 = -_1419;
    float _1519 = _1401 + _1517;
    float _1521 = fma(_1431, _1431, _1513);
    int _1523 = as_type<int>(_1263) + _1481;
    float _1525 = _1403 * _1465;
    float _1527 = _1465 * 3.814697265625;
    float _1529 = _1505 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1531 = _1507 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1533 = _1509 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1535 = !_1489;
    int _1537 = _1535 ? as_type<int>(_1515) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    float _1539 = fma(_1363, _1429, _1425);
    float _1541 = _1363 * _1437;
    float _1543 = fma(_1429, _1367, _1433);
    float _1545 = _1367 * _1437;
    float _1547 = fma(_1423, _1371, _1433);
    float _1549 = _1371 * _1437;
    float _1551 = _1545 * _1543;
    float _1553 = _1541 * _1539;
    float _1555 = _1549 * _1547;
    float _1557 = trunc(_1553);
    int _1559 = int(_1557);
    float _1561 = trunc(_1555);
    int _1563 = int(_1561);
    float _1565 = trunc(_1551);
    int _1567 = int(_1565);
    int _1569 = as_type<int>(_1349) + _1559;
    int _1571 = as_type<int>(_1375) + _1563;
    int _1573 = as_type<int>(_1357) + _1567;
    float _2373;
    float _2375;
    float _2377;
    float _2379;
    float _2381;
    float _2383;
    float _2385;
    float _2387;
    float _2389;
    float _2391;
    float _2393;
    float _2395;
    float _2397;
    float _2399;
    float _2401;
    float _2403;
    float _2405;
    float _2407;
    float _2409;
    float _2411;
    float _2413;
    float _2415;
    float _2417;
    float _2419;
    float _2421;
    float _2423;
    float _2425;
    float _2427;
    float _2429;
    float _2431;
    float _2433;
    float _2435;
    if (!_1485)
    {
        float _1575 = fma(_1519, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1577 = fma(_1495, -0.707106769084930419921875, _1575);
        bool _1579 = _1577 >= 0.0;
        bool _1581 = !_1579;
        if (!_1581)
        {
            int _1583 = _1571 * 656;
            int _1585 = _1583 + 262144;
            int _1587 = _1583 + 262192;
            int _1589 = _1583 + 262160;
            uint _1591 = uint(int(uint(_1585) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1591)];
            float _1593 = as_type<float>(_dmw0.x);
            int _1595 = _1585 + 4;
            uint _1597 = uint(int(uint(_1595) >> uint(2)));
            float _1599 = as_type<float>(_dmw0.y);
            int _1601 = _1585 + 8;
            uint _1603 = uint(int(uint(_1601) >> uint(2)));
            float _1605 = as_type<float>(_dmw0.z);
            int _1607 = _1585 + 12;
            uint _1609 = uint(int(uint(_1607) >> uint(2)));
            float _1611 = as_type<float>(_dmw0.w);
            int _1613 = _1583 + 262208;
            uint _1615 = uint(int(uint(_1587) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1615)];
            float _1617 = as_type<float>(_dmw3.x);
            int _1619 = _1587 + 4;
            uint _1621 = uint(int(uint(_1619) >> uint(2)));
            float _1623 = as_type<float>(_dmw3.y);
            int _1625 = _1587 + 8;
            uint _1627 = uint(int(uint(_1625) >> uint(2)));
            float _1629 = as_type<float>(_dmw3.z);
            int _1631 = _1587 + 12;
            uint _1633 = uint(int(uint(_1631) >> uint(2)));
            float _1635 = as_type<float>(_dmw3.w);
            int _1637 = _1583 + 262224;
            int _1639 = _1583 + 262240;
            uint _1641 = uint(int(uint(_1589) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1641)];
            float _1643 = as_type<float>(_dmw1.x);
            int _1645 = _1589 + 4;
            uint _1647 = uint(int(uint(_1645) >> uint(2)));
            float _1649 = as_type<float>(_dmw1.y);
            int _1651 = _1589 + 8;
            uint _1653 = uint(int(uint(_1651) >> uint(2)));
            float _1655 = as_type<float>(_dmw1.z);
            int _1657 = _1589 + 12;
            uint _1659 = uint(int(uint(_1657) >> uint(2)));
            float _1661 = as_type<float>(_dmw1.w);
            int _1663 = _1583 + 262176;
            int _1665 = _1523 * 656;
            int _1667 = _1583 + 262256;
            uint _1669 = uint(int(uint(_1613) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1669)];
            float _1671 = as_type<float>(_dmw4.x);
            int _1673 = _1613 + 4;
            uint _1675 = uint(int(uint(_1673) >> uint(2)));
            float _1677 = as_type<float>(_dmw4.y);
            int _1679 = _1613 + 8;
            uint _1681 = uint(int(uint(_1679) >> uint(2)));
            float _1683 = as_type<float>(_dmw4.z);
            int _1685 = _1613 + 12;
            uint _1687 = uint(int(uint(_1685) >> uint(2)));
            float _1689 = as_type<float>(_dmw4.w);
            uint _1691 = uint(int(uint(_1637) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1691)];
            float _1693 = as_type<float>(_dmw5.x);
            int _1695 = _1637 + 4;
            uint _1697 = uint(int(uint(_1695) >> uint(2)));
            float _1699 = as_type<float>(_dmw5.y);
            int _1701 = _1637 + 8;
            uint _1703 = uint(int(uint(_1701) >> uint(2)));
            float _1705 = as_type<float>(_dmw5.z);
            int _1707 = _1637 + 12;
            uint _1709 = uint(int(uint(_1707) >> uint(2)));
            float _1711 = as_type<float>(_dmw5.w);
            uint _1713 = uint(int(uint(_1639) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1713)];
            float _1715 = as_type<float>(_dmw6.x);
            int _1717 = _1639 + 4;
            uint _1719 = uint(int(uint(_1717) >> uint(2)));
            float _1721 = as_type<float>(_dmw6.y);
            int _1723 = _1639 + 8;
            uint _1725 = uint(int(uint(_1723) >> uint(2)));
            float _1727 = as_type<float>(_dmw6.z);
            int _1729 = _1639 + 12;
            uint _1731 = uint(int(uint(_1729) >> uint(2)));
            float _1733 = as_type<float>(_dmw6.w);
            int _1735 = _1569 * 656;
            uint _1737 = uint(int(uint(_1663) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1737)];
            float _1739 = as_type<float>(_dmw2.x);
            int _1741 = _1663 + 4;
            uint _1743 = uint(int(uint(_1741) >> uint(2)));
            float _1745 = as_type<float>(_dmw2.y);
            int _1747 = _1663 + 8;
            uint _1749 = uint(int(uint(_1747) >> uint(2)));
            float _1751 = as_type<float>(_dmw2.z);
            int _1753 = _1663 + 12;
            uint _1755 = uint(int(uint(_1753) >> uint(2)));
            float _1757 = as_type<float>(_dmw2.w);
            int _1759 = _1665 + 262144;
            int _1761 = _1665 + 262192;
            uint _1763 = uint(int(uint(_1667) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1763)];
            float _1765 = as_type<float>(_dmw7.x);
            int _1767 = _1667 + 4;
            uint _1769 = uint(int(uint(_1767) >> uint(2)));
            float _1771 = as_type<float>(_dmw7.y);
            int _1773 = _1667 + 8;
            uint _1775 = uint(int(uint(_1773) >> uint(2)));
            float _1777 = as_type<float>(_dmw7.z);
            int _1779 = _1667 + 12;
            uint _1781 = uint(int(uint(_1779) >> uint(2)));
            float _1783 = as_type<float>(_dmw7.w);
            int _1785 = _1665 + 262160;
            int _1787 = _1665 + 262208;
            uint _1789 = uint(int(uint(_1759) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1789)];
            float _1791 = as_type<float>(_dmw8.x);
            int _1793 = _1759 + 4;
            uint _1795 = uint(int(uint(_1793) >> uint(2)));
            float _1797 = as_type<float>(_dmw8.y);
            int _1799 = _1759 + 8;
            uint _1801 = uint(int(uint(_1799) >> uint(2)));
            float _1803 = as_type<float>(_dmw8.z);
            int _1805 = _1759 + 12;
            uint _1807 = uint(int(uint(_1805) >> uint(2)));
            float _1809 = as_type<float>(_dmw8.w);
            int _1811 = _1665 + 262176;
            int _1813 = _1665 + 262224;
            uint _1815 = uint(int(uint(_1761) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1815)];
            float _1817 = as_type<float>(_dmw11.x);
            int _1819 = _1761 + 4;
            uint _1821 = uint(int(uint(_1819) >> uint(2)));
            float _1823 = as_type<float>(_dmw11.y);
            int _1825 = _1761 + 8;
            uint _1827 = uint(int(uint(_1825) >> uint(2)));
            float _1829 = as_type<float>(_dmw11.z);
            int _1831 = _1761 + 12;
            uint _1833 = uint(int(uint(_1831) >> uint(2)));
            float _1835 = as_type<float>(_dmw11.w);
            int _1837 = _1665 + 262240;
            int _1839 = _1665 + 262256;
            uint _1841 = uint(int(uint(_1785) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1841)];
            float _1843 = as_type<float>(_dmw9.x);
            int _1845 = _1785 + 4;
            uint _1847 = uint(int(uint(_1845) >> uint(2)));
            float _1849 = as_type<float>(_dmw9.y);
            int _1851 = _1785 + 8;
            uint _1853 = uint(int(uint(_1851) >> uint(2)));
            float _1855 = as_type<float>(_dmw9.z);
            int _1857 = _1785 + 12;
            uint _1859 = uint(int(uint(_1857) >> uint(2)));
            float _1861 = as_type<float>(_dmw9.w);
            int _1863 = _1735 + 262144;
            int _1865 = _1735 + 262192;
            uint _1867 = uint(int(uint(_1787) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1867)];
            float _1869 = as_type<float>(_dmw12.x);
            int _1871 = _1787 + 4;
            uint _1873 = uint(int(uint(_1871) >> uint(2)));
            float _1875 = as_type<float>(_dmw12.y);
            int _1877 = _1787 + 8;
            uint _1879 = uint(int(uint(_1877) >> uint(2)));
            float _1881 = as_type<float>(_dmw12.z);
            int _1883 = _1787 + 12;
            uint _1885 = uint(int(uint(_1883) >> uint(2)));
            float _1887 = as_type<float>(_dmw12.w);
            int _1889 = _1735 + 262160;
            int _1891 = _1735 + 262208;
            uint _1893 = uint(int(uint(_1811) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1893)];
            float _1895 = as_type<float>(_dmw10.x);
            int _1897 = _1811 + 4;
            uint _1899 = uint(int(uint(_1897) >> uint(2)));
            float _1901 = as_type<float>(_dmw10.y);
            int _1903 = _1811 + 8;
            uint _1905 = uint(int(uint(_1903) >> uint(2)));
            float _1907 = as_type<float>(_dmw10.z);
            int _1909 = _1811 + 12;
            uint _1911 = uint(int(uint(_1909) >> uint(2)));
            float _1913 = as_type<float>(_dmw10.w);
            int _1915 = _1735 + 262176;
            int _1917 = _1735 + 262224;
            uint _1919 = uint(int(uint(_1813) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1919)];
            float _1921 = as_type<float>(_dmw13.x);
            int _1923 = _1813 + 4;
            uint _1925 = uint(int(uint(_1923) >> uint(2)));
            float _1927 = as_type<float>(_dmw13.y);
            int _1929 = _1813 + 8;
            uint _1931 = uint(int(uint(_1929) >> uint(2)));
            float _1933 = as_type<float>(_dmw13.z);
            int _1935 = _1813 + 12;
            uint _1937 = uint(int(uint(_1935) >> uint(2)));
            float _1939 = as_type<float>(_dmw13.w);
            int _1941 = _1735 + 262240;
            int _1943 = _1735 + 262256;
            uint _1945 = uint(int(uint(_1837) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1945)];
            float _1947 = as_type<float>(_dmw14.x);
            int _1949 = _1837 + 4;
            uint _1951 = uint(int(uint(_1949) >> uint(2)));
            float _1953 = as_type<float>(_dmw14.y);
            int _1955 = _1837 + 8;
            uint _1957 = uint(int(uint(_1955) >> uint(2)));
            float _1959 = as_type<float>(_dmw14.z);
            int _1961 = _1837 + 12;
            uint _1963 = uint(int(uint(_1961) >> uint(2)));
            float _1965 = as_type<float>(_dmw14.w);
            uint _1967 = uint(int(uint(_1839) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1967)];
            float _1969 = as_type<float>(_dmw15.x);
            int _1971 = _1839 + 4;
            uint _1973 = uint(int(uint(_1971) >> uint(2)));
            float _1975 = as_type<float>(_dmw15.y);
            int _1977 = _1839 + 8;
            uint _1979 = uint(int(uint(_1977) >> uint(2)));
            float _1981 = as_type<float>(_dmw15.z);
            int _1983 = _1839 + 12;
            uint _1985 = uint(int(uint(_1983) >> uint(2)));
            float _1987 = as_type<float>(_dmw15.w);
            uint _1989 = uint(int(uint(_1863) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1989)];
            float _1991 = as_type<float>(_dmw16.x);
            int _1993 = _1863 + 4;
            uint _1995 = uint(int(uint(_1993) >> uint(2)));
            float _1997 = as_type<float>(_dmw16.y);
            int _1999 = _1863 + 8;
            uint _2001 = uint(int(uint(_1999) >> uint(2)));
            float _2003 = as_type<float>(_dmw16.z);
            int _2005 = _1863 + 12;
            uint _2007 = uint(int(uint(_2005) >> uint(2)));
            float _2009 = as_type<float>(_dmw16.w);
            uint _2011 = uint(int(uint(_1865) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2011)];
            float _2013 = as_type<float>(_dmw19.x);
            int _2015 = _1865 + 4;
            uint _2017 = uint(int(uint(_2015) >> uint(2)));
            float _2019 = as_type<float>(_dmw19.y);
            int _2021 = _1865 + 8;
            uint _2023 = uint(int(uint(_2021) >> uint(2)));
            float _2025 = as_type<float>(_dmw19.z);
            int _2027 = _1865 + 12;
            uint _2029 = uint(int(uint(_2027) >> uint(2)));
            float _2031 = as_type<float>(_dmw19.w);
            uint _2033 = uint(int(uint(_1889) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2033)];
            float _2035 = as_type<float>(_dmw17.x);
            int _2037 = _1889 + 4;
            uint _2039 = uint(int(uint(_2037) >> uint(2)));
            float _2041 = as_type<float>(_dmw17.y);
            int _2043 = _1889 + 8;
            uint _2045 = uint(int(uint(_2043) >> uint(2)));
            float _2047 = as_type<float>(_dmw17.z);
            int _2049 = _1889 + 12;
            uint _2051 = uint(int(uint(_2049) >> uint(2)));
            float _2053 = as_type<float>(_dmw17.w);
            uint _2055 = uint(int(uint(_1891) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2055)];
            float _2057 = as_type<float>(_dmw20.x);
            int _2059 = _1891 + 4;
            uint _2061 = uint(int(uint(_2059) >> uint(2)));
            float _2063 = as_type<float>(_dmw20.y);
            int _2065 = _1891 + 8;
            uint _2067 = uint(int(uint(_2065) >> uint(2)));
            float _2069 = as_type<float>(_dmw20.z);
            int _2071 = _1891 + 12;
            uint _2073 = uint(int(uint(_2071) >> uint(2)));
            float _2075 = as_type<float>(_dmw20.w);
            uint _2077 = uint(int(uint(_1915) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2077)];
            float _2079 = as_type<float>(_dmw18.x);
            int _2081 = _1915 + 4;
            uint _2083 = uint(int(uint(_2081) >> uint(2)));
            float _2085 = as_type<float>(_dmw18.y);
            int _2087 = _1915 + 8;
            uint _2089 = uint(int(uint(_2087) >> uint(2)));
            float _2091 = as_type<float>(_dmw18.z);
            int _2093 = _1915 + 12;
            uint _2095 = uint(int(uint(_2093) >> uint(2)));
            float _2097 = as_type<float>(_dmw18.w);
            uint _2099 = uint(int(uint(_1917) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2099)];
            float _2101 = as_type<float>(_dmw21.x);
            int _2103 = _1917 + 4;
            uint _2105 = uint(int(uint(_2103) >> uint(2)));
            float _2107 = as_type<float>(_dmw21.y);
            int _2109 = _1917 + 8;
            uint _2111 = uint(int(uint(_2109) >> uint(2)));
            float _2113 = as_type<float>(_dmw21.z);
            int _2115 = _1917 + 12;
            uint _2117 = uint(int(uint(_2115) >> uint(2)));
            float _2119 = as_type<float>(_dmw21.w);
            uint _2121 = uint(int(uint(_1941) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2121)];
            float _2123 = as_type<float>(_dmw22.x);
            int _2125 = _1941 + 4;
            uint _2127 = uint(int(uint(_2125) >> uint(2)));
            float _2129 = as_type<float>(_dmw22.y);
            int _2131 = _1941 + 8;
            uint _2133 = uint(int(uint(_2131) >> uint(2)));
            float _2135 = as_type<float>(_dmw22.z);
            int _2137 = _1941 + 12;
            uint _2139 = uint(int(uint(_2137) >> uint(2)));
            float _2141 = as_type<float>(_dmw22.w);
            uint _2143 = uint(int(uint(_1943) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2143)];
            float _2145 = as_type<float>(_dmw23.x);
            int _2147 = _1943 + 4;
            uint _2149 = uint(int(uint(_2147) >> uint(2)));
            float _2151 = as_type<float>(_dmw23.y);
            int _2153 = _1943 + 8;
            uint _2155 = uint(int(uint(_2153) >> uint(2)));
            float _2157 = as_type<float>(_dmw23.z);
            int _2159 = _1943 + 12;
            uint _2161 = uint(int(uint(_2159) >> uint(2)));
            float _2163 = as_type<float>(_dmw23.w);
            float _2165 = _1519 + (-1.0);
            float _2167 = -_1495;
            float _2169 = -_2165;
            float _2171 = _2167 + _2169;
            float _2173 = -_2171;
            float _2175 = _2173 + 1.0;
            float _2177 = _1495 * _1593;
            float _2179 = _1495 * _1599;
            float _2181 = _1495 * _1605;
            float _2183 = _1495 * _1611;
            float _2185 = _1495 * _1617;
            float _2187 = _1495 * _1623;
            float _2189 = _1495 * _1629;
            float _2191 = _1495 * _1635;
            float _2193 = _1495 * _1643;
            float _2195 = _1495 * _1649;
            float _2197 = _1495 * _1655;
            float _2199 = _1495 * _1661;
            float _2201 = _1495 * _1671;
            float _2203 = _1495 * _1677;
            float _2205 = _1495 * _1683;
            float _2207 = _1495 * _1699;
            float _2209 = _1495 * _1705;
            float _2211 = _1495 * _1711;
            float _2213 = _1495 * _1689;
            float _2215 = _1495 * _1715;
            float _2217 = _1495 * _1721;
            float _2219 = _1495 * _1727;
            float _2221 = _1495 * _1739;
            float _2223 = _1495 * _1745;
            float _2225 = _1495 * _1751;
            float _2227 = _1495 * _1733;
            float _2229 = _1495 * _1757;
            float _2231 = _1495 * _1765;
            float _2233 = _1495 * _1693;
            float _2235 = _1495 * _1771;
            float _2237 = _1495 * _1777;
            float _2239 = -_1495;
            float _2241 = _2239 + _2175;
            float _2243 = _1495 * _1783;
            float _2245 = fma(_2171, _1791, _2177);
            float _2247 = fma(_2171, _1797, _2179);
            float _2249 = fma(_2171, _1803, _2181);
            float _2251 = fma(_2171, _1809, _2183);
            float _2253 = fma(_2171, _1817, _2185);
            float _2255 = fma(_2171, _1823, _2187);
            float _2257 = fma(_2171, _1829, _2189);
            float _2259 = fma(_2171, _1835, _2191);
            float _2261 = fma(_2171, _1843, _2193);
            float _2263 = fma(_2171, _1849, _2195);
            float _2265 = fma(_2171, _1855, _2197);
            float _2267 = fma(_2171, _1861, _2199);
            float _2269 = fma(_2171, _1869, _2201);
            float _2271 = fma(_2171, _1875, _2203);
            float _2273 = fma(_2171, _1881, _2205);
            float _2275 = fma(_2171, _1887, _2213);
            float _2277 = fma(_2171, _1895, _2221);
            float _2279 = fma(_2171, _1901, _2223);
            float _2281 = fma(_2171, _1907, _2225);
            float _2283 = fma(_2171, _1913, _2229);
            float _2285 = fma(_2171, _1921, _2233);
            float _2287 = fma(_2171, _1927, _2207);
            float _2289 = fma(_2171, _1933, _2209);
            float _2291 = fma(_2171, _1939, _2211);
            float _2293 = fma(_2171, _1947, _2215);
            float _2295 = fma(_2171, _1953, _2217);
            float _2297 = fma(_2171, _1959, _2219);
            float _2299 = fma(_2171, _1965, _2227);
            float _2301 = fma(_2171, _1969, _2231);
            float _2303 = fma(_2171, _1975, _2235);
            float _2305 = fma(_2171, _1981, _2237);
            float _2307 = fma(_2171, _1987, _2243);
            float _2309 = fma(_2241, _1991, _2245);
            float _2311 = fma(_2241, _1997, _2247);
            float _2313 = fma(_2241, _2003, _2249);
            float _2315 = fma(_2241, _2009, _2251);
            float _2317 = fma(_2241, _2013, _2253);
            float _2319 = fma(_2241, _2019, _2255);
            float _2321 = fma(_2241, _2025, _2257);
            float _2323 = fma(_2241, _2031, _2259);
            float _2325 = fma(_2241, _2035, _2261);
            float _2327 = fma(_2241, _2041, _2263);
            float _2329 = fma(_2241, _2047, _2265);
            float _2331 = fma(_2241, _2053, _2267);
            float _2333 = fma(_2241, _2057, _2269);
            float _2335 = fma(_2241, _2063, _2271);
            float _2337 = fma(_2241, _2069, _2273);
            float _2339 = fma(_2241, _2075, _2275);
            float _2341 = fma(_2241, _2079, _2277);
            float _2343 = fma(_2241, _2085, _2279);
            float _2345 = fma(_2241, _2091, _2281);
            float _2347 = fma(_2241, _2097, _2283);
            float _2349 = fma(_2241, _2101, _2285);
            float _2351 = fma(_2241, _2107, _2287);
            float _2353 = fma(_2241, _2113, _2289);
            float _2355 = fma(_2241, _2119, _2291);
            float _2357 = fma(_2241, _2123, _2293);
            float _2359 = fma(_2241, _2129, _2295);
            float _2361 = fma(_2241, _2135, _2297);
            float _2363 = fma(_2241, _2141, _2299);
            float _2365 = fma(_2241, _2145, _2301);
            float _2367 = fma(_2241, _2151, _2303);
            float _2369 = fma(_2241, _2157, _2305);
            float _2371 = fma(_2241, _2163, _2307);
            _2373 = _2323;
            _2375 = _2319;
            _2377 = _2351;
            _2379 = _2333;
            _2381 = _2317;
            _2383 = _2337;
            _2385 = _2353;
            _2387 = _2335;
            _2389 = _2339;
            _2391 = _2355;
            _2393 = _2321;
            _2395 = _2349;
            _2397 = _2367;
            _2399 = _2315;
            _2401 = _2365;
            _2403 = _2325;
            _2405 = _2327;
            _2407 = _2359;
            _2409 = _2309;
            _2411 = _2311;
            _2413 = _2313;
            _2415 = _2357;
            _2417 = _2369;
            _2419 = _2331;
            _2421 = _2341;
            _2423 = _2361;
            _2425 = _2371;
            _2427 = _2345;
            _2429 = _2347;
            _2431 = _2363;
            _2433 = _2329;
            _2435 = _2343;
            _2437 = true;
        }
        else
        {
            int _2439 = _1569 * 656;
            int _2441 = _2439 + 262144;
            int _2443 = _2439 + 262192;
            int _2445 = _2439 + 262160;
            uint _2447 = uint(int(uint(_2441) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2447)];
            float _2449 = as_type<float>(_dmw24.x);
            int _2451 = _2441 + 4;
            uint _2453 = uint(int(uint(_2451) >> uint(2)));
            float _2455 = as_type<float>(_dmw24.y);
            int _2457 = _2441 + 8;
            uint _2459 = uint(int(uint(_2457) >> uint(2)));
            float _2461 = as_type<float>(_dmw24.z);
            int _2463 = _2441 + 12;
            uint _2465 = uint(int(uint(_2463) >> uint(2)));
            float _2467 = as_type<float>(_dmw24.w);
            int _2469 = _2439 + 262208;
            uint _2471 = uint(int(uint(_2443) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2471)];
            float _2473 = as_type<float>(_dmw27.x);
            int _2475 = _2443 + 4;
            uint _2477 = uint(int(uint(_2475) >> uint(2)));
            float _2479 = as_type<float>(_dmw27.y);
            int _2481 = _2443 + 8;
            uint _2483 = uint(int(uint(_2481) >> uint(2)));
            float _2485 = as_type<float>(_dmw27.z);
            int _2487 = _2443 + 12;
            uint _2489 = uint(int(uint(_2487) >> uint(2)));
            float _2491 = as_type<float>(_dmw27.w);
            int _2493 = _2439 + 262176;
            uint _2495 = uint(int(uint(_2445) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2495)];
            float _2497 = as_type<float>(_dmw25.x);
            int _2499 = _2445 + 4;
            uint _2501 = uint(int(uint(_2499) >> uint(2)));
            float _2503 = as_type<float>(_dmw25.y);
            int _2505 = _2445 + 8;
            uint _2507 = uint(int(uint(_2505) >> uint(2)));
            float _2509 = as_type<float>(_dmw25.z);
            int _2511 = _2445 + 12;
            uint _2513 = uint(int(uint(_2511) >> uint(2)));
            float _2515 = as_type<float>(_dmw25.w);
            int _2517 = _2439 + 262224;
            uint _2519 = uint(int(uint(_2469) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2519)];
            float _2521 = as_type<float>(_dmw28.x);
            int _2523 = _2469 + 4;
            uint _2525 = uint(int(uint(_2523) >> uint(2)));
            float _2527 = as_type<float>(_dmw28.y);
            int _2529 = _2469 + 8;
            uint _2531 = uint(int(uint(_2529) >> uint(2)));
            float _2533 = as_type<float>(_dmw28.z);
            int _2535 = _2469 + 12;
            uint _2537 = uint(int(uint(_2535) >> uint(2)));
            float _2539 = as_type<float>(_dmw28.w);
            int _2541 = _2439 + 262240;
            uint _2543 = uint(int(uint(_2493) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2543)];
            float _2545 = as_type<float>(_dmw26.x);
            int _2547 = _2493 + 4;
            uint _2549 = uint(int(uint(_2547) >> uint(2)));
            float _2551 = as_type<float>(_dmw26.y);
            int _2553 = _2493 + 8;
            uint _2555 = uint(int(uint(_2553) >> uint(2)));
            float _2557 = as_type<float>(_dmw26.z);
            int _2559 = _2493 + 12;
            uint _2561 = uint(int(uint(_2559) >> uint(2)));
            float _2563 = as_type<float>(_dmw26.w);
            int _2565 = _2439 + 262256;
            uint _2567 = uint(int(uint(_2517) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2567)];
            float _2569 = as_type<float>(_dmw29.x);
            int _2571 = _2517 + 4;
            uint _2573 = uint(int(uint(_2571) >> uint(2)));
            float _2575 = as_type<float>(_dmw29.y);
            int _2577 = _2517 + 8;
            uint _2579 = uint(int(uint(_2577) >> uint(2)));
            float _2581 = as_type<float>(_dmw29.z);
            int _2583 = _2517 + 12;
            uint _2585 = uint(int(uint(_2583) >> uint(2)));
            float _2587 = as_type<float>(_dmw29.w);
            int _2589 = _1571 * 656;
            uint _2591 = uint(int(uint(_2541) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2591)];
            float _2593 = as_type<float>(_dmw30.x);
            int _2595 = _2541 + 4;
            uint _2597 = uint(int(uint(_2595) >> uint(2)));
            float _2599 = as_type<float>(_dmw30.y);
            int _2601 = _2541 + 8;
            uint _2603 = uint(int(uint(_2601) >> uint(2)));
            float _2605 = as_type<float>(_dmw30.z);
            int _2607 = _2541 + 12;
            uint _2609 = uint(int(uint(_2607) >> uint(2)));
            float _2611 = as_type<float>(_dmw30.w);
            int _2613 = _1573 * 656;
            int _2615 = _2589 + 262144;
            uint _2617 = uint(int(uint(_2565) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2617)];
            float _2619 = as_type<float>(_dmw31.x);
            int _2621 = _2565 + 4;
            uint _2623 = uint(int(uint(_2621) >> uint(2)));
            float _2625 = as_type<float>(_dmw31.y);
            int _2627 = _2565 + 8;
            uint _2629 = uint(int(uint(_2627) >> uint(2)));
            float _2631 = as_type<float>(_dmw31.z);
            int _2633 = _2565 + 12;
            uint _2635 = uint(int(uint(_2633) >> uint(2)));
            float _2637 = as_type<float>(_dmw31.w);
            int _2639 = _2589 + 262192;
            int _2641 = _2589 + 262160;
            uint _2643 = uint(int(uint(_2615) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2643)];
            float _2645 = as_type<float>(_dmw32.x);
            int _2647 = _2615 + 4;
            uint _2649 = uint(int(uint(_2647) >> uint(2)));
            float _2651 = as_type<float>(_dmw32.y);
            int _2653 = _2615 + 8;
            uint _2655 = uint(int(uint(_2653) >> uint(2)));
            float _2657 = as_type<float>(_dmw32.z);
            int _2659 = _2615 + 12;
            uint _2661 = uint(int(uint(_2659) >> uint(2)));
            float _2663 = as_type<float>(_dmw32.w);
            int _2665 = _2589 + 262208;
            int _2667 = _2589 + 262176;
            uint _2669 = uint(int(uint(_2639) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2669)];
            float _2671 = as_type<float>(_dmw35.x);
            int _2673 = _2639 + 4;
            uint _2675 = uint(int(uint(_2673) >> uint(2)));
            float _2677 = as_type<float>(_dmw35.y);
            int _2679 = _2639 + 8;
            uint _2681 = uint(int(uint(_2679) >> uint(2)));
            float _2683 = as_type<float>(_dmw35.z);
            int _2685 = _2639 + 12;
            uint _2687 = uint(int(uint(_2685) >> uint(2)));
            float _2689 = as_type<float>(_dmw35.w);
            int _2691 = _2589 + 262224;
            int _2693 = _2589 + 262240;
            uint _2695 = uint(int(uint(_2641) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2695)];
            float _2697 = as_type<float>(_dmw33.x);
            int _2699 = _2641 + 4;
            uint _2701 = uint(int(uint(_2699) >> uint(2)));
            float _2703 = as_type<float>(_dmw33.y);
            int _2705 = _2641 + 8;
            uint _2707 = uint(int(uint(_2705) >> uint(2)));
            float _2709 = as_type<float>(_dmw33.z);
            int _2711 = _2641 + 12;
            uint _2713 = uint(int(uint(_2711) >> uint(2)));
            float _2715 = as_type<float>(_dmw33.w);
            int _2717 = _2589 + 262256;
            int _2719 = _2613 + 262144;
            uint _2721 = uint(int(uint(_2665) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2721)];
            float _2723 = as_type<float>(_dmw36.x);
            int _2725 = _2665 + 4;
            uint _2727 = uint(int(uint(_2725) >> uint(2)));
            float _2729 = as_type<float>(_dmw36.y);
            int _2731 = _2665 + 8;
            uint _2733 = uint(int(uint(_2731) >> uint(2)));
            float _2735 = as_type<float>(_dmw36.z);
            int _2737 = _2665 + 12;
            uint _2739 = uint(int(uint(_2737) >> uint(2)));
            float _2741 = as_type<float>(_dmw36.w);
            int _2743 = _2613 + 262192;
            int _2745 = _2613 + 262160;
            uint _2747 = uint(int(uint(_2667) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2747)];
            float _2749 = as_type<float>(_dmw34.x);
            int _2751 = _2667 + 4;
            uint _2753 = uint(int(uint(_2751) >> uint(2)));
            float _2755 = as_type<float>(_dmw34.y);
            int _2757 = _2667 + 8;
            uint _2759 = uint(int(uint(_2757) >> uint(2)));
            float _2761 = as_type<float>(_dmw34.z);
            int _2763 = _2667 + 12;
            uint _2765 = uint(int(uint(_2763) >> uint(2)));
            float _2767 = as_type<float>(_dmw34.w);
            int _2769 = _2613 + 262208;
            int _2771 = _2613 + 262176;
            uint _2773 = uint(int(uint(_2691) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2773)];
            float _2775 = as_type<float>(_dmw37.x);
            int _2777 = _2691 + 4;
            uint _2779 = uint(int(uint(_2777) >> uint(2)));
            float _2781 = as_type<float>(_dmw37.y);
            int _2783 = _2691 + 8;
            uint _2785 = uint(int(uint(_2783) >> uint(2)));
            float _2787 = as_type<float>(_dmw37.z);
            int _2789 = _2691 + 12;
            uint _2791 = uint(int(uint(_2789) >> uint(2)));
            float _2793 = as_type<float>(_dmw37.w);
            int _2795 = _2613 + 262224;
            int _2797 = _2613 + 262240;
            uint _2799 = uint(int(uint(_2693) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2799)];
            float _2801 = as_type<float>(_dmw38.x);
            int _2803 = _2693 + 4;
            uint _2805 = uint(int(uint(_2803) >> uint(2)));
            float _2807 = as_type<float>(_dmw38.y);
            int _2809 = _2693 + 8;
            uint _2811 = uint(int(uint(_2809) >> uint(2)));
            float _2813 = as_type<float>(_dmw38.z);
            int _2815 = _2693 + 12;
            uint _2817 = uint(int(uint(_2815) >> uint(2)));
            float _2819 = as_type<float>(_dmw38.w);
            int _2821 = _2613 + 262256;
            uint _2823 = uint(int(uint(_2717) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2823)];
            float _2825 = as_type<float>(_dmw39.x);
            int _2827 = _2717 + 4;
            uint _2829 = uint(int(uint(_2827) >> uint(2)));
            float _2831 = as_type<float>(_dmw39.y);
            int _2833 = _2717 + 8;
            uint _2835 = uint(int(uint(_2833) >> uint(2)));
            float _2837 = as_type<float>(_dmw39.z);
            int _2839 = _2717 + 12;
            uint _2841 = uint(int(uint(_2839) >> uint(2)));
            float _2843 = as_type<float>(_dmw39.w);
            uint _2845 = uint(int(uint(_2719) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2845)];
            float _2847 = as_type<float>(_dmw40.x);
            int _2849 = _2719 + 4;
            uint _2851 = uint(int(uint(_2849) >> uint(2)));
            float _2853 = as_type<float>(_dmw40.y);
            int _2855 = _2719 + 8;
            uint _2857 = uint(int(uint(_2855) >> uint(2)));
            float _2859 = as_type<float>(_dmw40.z);
            int _2861 = _2719 + 12;
            uint _2863 = uint(int(uint(_2861) >> uint(2)));
            float _2865 = as_type<float>(_dmw40.w);
            uint _2867 = uint(int(uint(_2743) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2867)];
            float _2869 = as_type<float>(_dmw43.x);
            int _2871 = _2743 + 4;
            uint _2873 = uint(int(uint(_2871) >> uint(2)));
            float _2875 = as_type<float>(_dmw43.y);
            int _2877 = _2743 + 8;
            uint _2879 = uint(int(uint(_2877) >> uint(2)));
            float _2881 = as_type<float>(_dmw43.z);
            int _2883 = _2743 + 12;
            uint _2885 = uint(int(uint(_2883) >> uint(2)));
            float _2887 = as_type<float>(_dmw43.w);
            uint _2889 = uint(int(uint(_2745) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2889)];
            float _2891 = as_type<float>(_dmw41.x);
            int _2893 = _2745 + 4;
            uint _2895 = uint(int(uint(_2893) >> uint(2)));
            float _2897 = as_type<float>(_dmw41.y);
            int _2899 = _2745 + 8;
            uint _2901 = uint(int(uint(_2899) >> uint(2)));
            float _2903 = as_type<float>(_dmw41.z);
            int _2905 = _2745 + 12;
            uint _2907 = uint(int(uint(_2905) >> uint(2)));
            float _2909 = as_type<float>(_dmw41.w);
            uint _2911 = uint(int(uint(_2769) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2911)];
            float _2913 = as_type<float>(_dmw44.x);
            int _2915 = _2769 + 4;
            uint _2917 = uint(int(uint(_2915) >> uint(2)));
            float _2919 = as_type<float>(_dmw44.y);
            int _2921 = _2769 + 8;
            uint _2923 = uint(int(uint(_2921) >> uint(2)));
            float _2925 = as_type<float>(_dmw44.z);
            int _2927 = _2769 + 12;
            uint _2929 = uint(int(uint(_2927) >> uint(2)));
            float _2931 = as_type<float>(_dmw44.w);
            uint _2933 = uint(int(uint(_2771) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2933)];
            float _2935 = as_type<float>(_dmw42.x);
            int _2937 = _2771 + 4;
            uint _2939 = uint(int(uint(_2937) >> uint(2)));
            float _2941 = as_type<float>(_dmw42.y);
            int _2943 = _2771 + 8;
            uint _2945 = uint(int(uint(_2943) >> uint(2)));
            float _2947 = as_type<float>(_dmw42.z);
            int _2949 = _2771 + 12;
            uint _2951 = uint(int(uint(_2949) >> uint(2)));
            float _2953 = as_type<float>(_dmw42.w);
            uint _2955 = uint(int(uint(_2795) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2955)];
            float _2957 = as_type<float>(_dmw45.x);
            int _2959 = _2795 + 4;
            uint _2961 = uint(int(uint(_2959) >> uint(2)));
            float _2963 = as_type<float>(_dmw45.y);
            int _2965 = _2795 + 8;
            uint _2967 = uint(int(uint(_2965) >> uint(2)));
            float _2969 = as_type<float>(_dmw45.z);
            int _2971 = _2795 + 12;
            uint _2973 = uint(int(uint(_2971) >> uint(2)));
            float _2975 = as_type<float>(_dmw45.w);
            uint _2977 = uint(int(uint(_2797) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2977)];
            float _2979 = as_type<float>(_dmw46.x);
            int _2981 = _2797 + 4;
            uint _2983 = uint(int(uint(_2981) >> uint(2)));
            float _2985 = as_type<float>(_dmw46.y);
            int _2987 = _2797 + 8;
            uint _2989 = uint(int(uint(_2987) >> uint(2)));
            float _2991 = as_type<float>(_dmw46.z);
            int _2993 = _2797 + 12;
            uint _2995 = uint(int(uint(_2993) >> uint(2)));
            float _2997 = as_type<float>(_dmw46.w);
            uint _2999 = uint(int(uint(_2821) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2999)];
            float _3001 = as_type<float>(_dmw47.x);
            int _3003 = _2821 + 4;
            uint _3005 = uint(int(uint(_3003) >> uint(2)));
            float _3007 = as_type<float>(_dmw47.y);
            int _3009 = _2821 + 8;
            uint _3011 = uint(int(uint(_3009) >> uint(2)));
            float _3013 = as_type<float>(_dmw47.z);
            int _3015 = _2821 + 12;
            uint _3017 = uint(int(uint(_3015) >> uint(2)));
            float _3019 = as_type<float>(_dmw47.w);
            float _3021 = _1495 + (-1.0);
            float _3023 = _1519 + (-1.0);
            float _3025 = _1519 + _3021;
            float _3027 = -_3021;
            float _3029 = _2449 * _3027;
            float _3031 = -_3021;
            float _3033 = _2455 * _3031;
            float _3035 = -_3021;
            float _3037 = _2461 * _3035;
            float _3039 = -_3021;
            float _3041 = _2467 * _3039;
            float _3043 = -_3021;
            float _3045 = _2473 * _3043;
            float _3047 = -_3021;
            float _3049 = _2479 * _3047;
            float _3051 = -_3021;
            float _3053 = _2485 * _3051;
            float _3055 = -_3021;
            float _3057 = _2491 * _3055;
            float _3059 = -_3021;
            float _3061 = _2497 * _3059;
            float _3063 = -_3021;
            float _3065 = _2503 * _3063;
            float _3067 = -_3021;
            float _3069 = _2509 * _3067;
            float _3071 = -_3021;
            float _3073 = _2515 * _3071;
            float _3075 = -_3021;
            float _3077 = _2521 * _3075;
            float _3079 = -_3021;
            float _3081 = _2527 * _3079;
            float _3083 = -_3021;
            float _3085 = _2533 * _3083;
            float _3087 = -_3021;
            float _3089 = _2539 * _3087;
            float _3091 = -_3021;
            float _3093 = _2545 * _3091;
            float _3095 = -_3021;
            float _3097 = _2551 * _3095;
            float _3099 = -_3021;
            float _3101 = _2557 * _3099;
            float _3103 = -_3021;
            float _3105 = _2563 * _3103;
            float _3107 = -_3021;
            float _3109 = _2569 * _3107;
            float _3111 = -_3021;
            float _3113 = _2575 * _3111;
            float _3115 = -_3021;
            float _3117 = _2581 * _3115;
            float _3119 = -_3021;
            float _3121 = _2587 * _3119;
            float _3123 = -_3021;
            float _3125 = _2593 * _3123;
            float _3127 = -_3021;
            float _3129 = _2599 * _3127;
            float _3131 = -_3021;
            float _3133 = _2605 * _3131;
            float _3135 = -_3021;
            float _3137 = _2611 * _3135;
            float _3139 = -_3021;
            float _3141 = _2619 * _3139;
            float _3143 = -_3021;
            float _3145 = _2625 * _3143;
            float _3147 = -_3021;
            float _3149 = _2631 * _3147;
            float _3151 = -_3021;
            float _3153 = _2637 * _3151;
            float _3155 = -_3023;
            float _3157 = fma(_3155, _2645, _3029);
            float _3159 = -_3023;
            float _3161 = fma(_3159, _2651, _3033);
            float _3163 = -_3023;
            float _3165 = fma(_3163, _2657, _3037);
            float _3167 = -_3023;
            float _3169 = fma(_3167, _2663, _3041);
            float _3171 = -_3023;
            float _3173 = fma(_3171, _2671, _3045);
            float _3175 = -_3023;
            float _3177 = fma(_3175, _2677, _3049);
            float _3179 = -_3023;
            float _3181 = fma(_3179, _2683, _3053);
            float _3183 = -_3023;
            float _3185 = fma(_3183, _2689, _3057);
            float _3187 = -_3023;
            float _3189 = fma(_3187, _2697, _3061);
            float _3191 = -_3023;
            float _3193 = fma(_3191, _2703, _3065);
            float _3195 = -_3023;
            float _3197 = fma(_3195, _2709, _3069);
            float _3199 = -_3023;
            float _3201 = fma(_3199, _2715, _3073);
            float _3203 = -_3023;
            float _3205 = fma(_3203, _2723, _3077);
            float _3207 = -_3023;
            float _3209 = fma(_3207, _2729, _3081);
            float _3211 = -_3023;
            float _3213 = fma(_3211, _2735, _3085);
            float _3215 = -_3023;
            float _3217 = fma(_3215, _2741, _3089);
            float _3219 = -_3023;
            float _3221 = fma(_3219, _2749, _3093);
            float _3223 = -_3023;
            float _3225 = fma(_3223, _2755, _3097);
            float _3227 = -_3023;
            float _3229 = fma(_3227, _2761, _3101);
            float _3231 = -_3023;
            float _3233 = fma(_3231, _2767, _3105);
            float _3235 = -_3023;
            float _3237 = fma(_3235, _2775, _3109);
            float _3239 = -_3023;
            float _3241 = fma(_3239, _2781, _3113);
            float _3243 = -_3023;
            float _3245 = fma(_3243, _2787, _3117);
            float _3247 = -_3023;
            float _3249 = fma(_3247, _2793, _3121);
            float _3251 = -_3023;
            float _3253 = fma(_3251, _2801, _3125);
            float _3255 = -_3023;
            float _3257 = fma(_3255, _2807, _3129);
            float _3259 = -_3023;
            float _3261 = fma(_3259, _2813, _3133);
            float _3263 = -_3023;
            float _3265 = fma(_3263, _2819, _3137);
            float _3267 = -_3023;
            float _3269 = fma(_3267, _2825, _3141);
            float _3271 = -_3023;
            float _3273 = fma(_3271, _2831, _3145);
            float _3275 = -_3023;
            float _3277 = fma(_3275, _2837, _3149);
            float _3279 = -_3023;
            float _3281 = fma(_3279, _2843, _3153);
            float _3283 = fma(_3025, _2847, _3157);
            float _3285 = fma(_3025, _2853, _3161);
            float _3287 = fma(_3025, _2859, _3165);
            float _3289 = fma(_3025, _2865, _3169);
            float _3291 = fma(_3025, _2869, _3173);
            float _3293 = fma(_3025, _2875, _3177);
            float _3295 = fma(_3025, _2881, _3181);
            float _3297 = fma(_3025, _2887, _3185);
            float _3299 = fma(_3025, _2891, _3189);
            float _3301 = fma(_3025, _2897, _3193);
            float _3303 = fma(_3025, _2903, _3197);
            float _3305 = fma(_3025, _2909, _3201);
            float _3307 = fma(_3025, _2913, _3205);
            float _3309 = fma(_3025, _2919, _3209);
            float _3311 = fma(_3025, _2925, _3213);
            float _3313 = fma(_3025, _2931, _3217);
            float _3315 = fma(_3025, _2935, _3221);
            float _3317 = fma(_3025, _2941, _3225);
            float _3319 = fma(_3025, _2947, _3229);
            float _3321 = fma(_3025, _2953, _3233);
            float _3323 = fma(_3025, _2957, _3237);
            float _3325 = fma(_3025, _2963, _3241);
            float _3327 = fma(_3025, _2969, _3245);
            float _3329 = fma(_3025, _2975, _3249);
            float _3331 = fma(_3025, _2979, _3253);
            float _3333 = fma(_3025, _2985, _3257);
            float _3335 = fma(_3025, _2991, _3261);
            float _3337 = fma(_3025, _2997, _3265);
            float _3339 = fma(_3025, _3001, _3269);
            float _3341 = fma(_3025, _3007, _3273);
            float _3343 = fma(_3025, _3013, _3277);
            float _3345 = fma(_3025, _3019, _3281);
            _2373 = _3297;
            _2375 = _3293;
            _2377 = _3325;
            _2379 = _3307;
            _2381 = _3291;
            _2383 = _3311;
            _2385 = _3327;
            _2387 = _3309;
            _2389 = _3313;
            _2391 = _3329;
            _2393 = _3295;
            _2395 = _3323;
            _2397 = _3341;
            _2399 = _3289;
            _2401 = _3339;
            _2403 = _3299;
            _2405 = _3301;
            _2407 = _3333;
            _2409 = _3283;
            _2411 = _3285;
            _2413 = _3287;
            _2415 = _3331;
            _2417 = _3343;
            _2419 = _3305;
            _2421 = _3315;
            _2423 = _3335;
            _2425 = _3345;
            _2427 = _3319;
            _2429 = _3321;
            _2431 = _3337;
            _2433 = _3303;
            _2435 = _3317;
            _2437 = true;
        }
    }
    else
    {
        float _3347 = _1519 * (-0.707106769084930419921875);
        float _3349 = _1495 + (-1.0);
        float _3351 = _1519 + (-1.0);
        float _3353 = fma(_1495, 0.707106769084930419921875, _3347);
        bool _3355 = _3353 >= 0.0;
        bool _3357 = !_3355;
        if (!_3357)
        {
            int _3359 = _1571 * 656;
            int _3361 = _3359 + 262144;
            int _3363 = _3359 + 262192;
            int _3365 = _3359 + 262160;
            uint _3367 = uint(int(uint(_3361) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3367)];
            float _3369 = as_type<float>(_dmw48.x);
            int _3371 = _3361 + 4;
            uint _3373 = uint(int(uint(_3371) >> uint(2)));
            float _3375 = as_type<float>(_dmw48.y);
            int _3377 = _3361 + 8;
            uint _3379 = uint(int(uint(_3377) >> uint(2)));
            float _3381 = as_type<float>(_dmw48.z);
            int _3383 = _3361 + 12;
            uint _3385 = uint(int(uint(_3383) >> uint(2)));
            float _3387 = as_type<float>(_dmw48.w);
            int _3389 = _3359 + 262208;
            uint _3391 = uint(int(uint(_3363) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3391)];
            float _3393 = as_type<float>(_dmw51.x);
            int _3395 = _3363 + 4;
            uint _3397 = uint(int(uint(_3395) >> uint(2)));
            float _3399 = as_type<float>(_dmw51.y);
            int _3401 = _3363 + 8;
            uint _3403 = uint(int(uint(_3401) >> uint(2)));
            float _3405 = as_type<float>(_dmw51.z);
            int _3407 = _3363 + 12;
            uint _3409 = uint(int(uint(_3407) >> uint(2)));
            float _3411 = as_type<float>(_dmw51.w);
            int _3413 = _3359 + 262176;
            uint _3415 = uint(int(uint(_3365) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3415)];
            float _3417 = as_type<float>(_dmw49.x);
            int _3419 = _3365 + 4;
            uint _3421 = uint(int(uint(_3419) >> uint(2)));
            float _3423 = as_type<float>(_dmw49.y);
            int _3425 = _3365 + 8;
            uint _3427 = uint(int(uint(_3425) >> uint(2)));
            float _3429 = as_type<float>(_dmw49.z);
            int _3431 = _3365 + 12;
            uint _3433 = uint(int(uint(_3431) >> uint(2)));
            float _3435 = as_type<float>(_dmw49.w);
            int _3437 = _3359 + 262224;
            uint _3439 = uint(int(uint(_3389) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3439)];
            float _3441 = as_type<float>(_dmw52.x);
            int _3443 = _3389 + 4;
            uint _3445 = uint(int(uint(_3443) >> uint(2)));
            float _3447 = as_type<float>(_dmw52.y);
            int _3449 = _3389 + 8;
            uint _3451 = uint(int(uint(_3449) >> uint(2)));
            float _3453 = as_type<float>(_dmw52.z);
            int _3455 = _3389 + 12;
            uint _3457 = uint(int(uint(_3455) >> uint(2)));
            float _3459 = as_type<float>(_dmw52.w);
            int _3461 = _3359 + 262240;
            uint _3463 = uint(int(uint(_3413) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3463)];
            float _3465 = as_type<float>(_dmw50.x);
            int _3467 = _3413 + 4;
            uint _3469 = uint(int(uint(_3467) >> uint(2)));
            float _3471 = as_type<float>(_dmw50.y);
            int _3473 = _3413 + 8;
            uint _3475 = uint(int(uint(_3473) >> uint(2)));
            float _3477 = as_type<float>(_dmw50.z);
            int _3479 = _3413 + 12;
            uint _3481 = uint(int(uint(_3479) >> uint(2)));
            float _3483 = as_type<float>(_dmw50.w);
            int _3485 = _3359 + 262256;
            uint _3487 = uint(int(uint(_3437) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3487)];
            float _3489 = as_type<float>(_dmw53.x);
            int _3491 = _3437 + 4;
            uint _3493 = uint(int(uint(_3491) >> uint(2)));
            float _3495 = as_type<float>(_dmw53.y);
            int _3497 = _3437 + 8;
            uint _3499 = uint(int(uint(_3497) >> uint(2)));
            float _3501 = as_type<float>(_dmw53.z);
            int _3503 = _3437 + 12;
            uint _3505 = uint(int(uint(_3503) >> uint(2)));
            float _3507 = as_type<float>(_dmw53.w);
            int _3509 = _1523 * 656;
            uint _3511 = uint(int(uint(_3461) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3511)];
            float _3513 = as_type<float>(_dmw54.x);
            int _3515 = _3461 + 4;
            uint _3517 = uint(int(uint(_3515) >> uint(2)));
            float _3519 = as_type<float>(_dmw54.y);
            int _3521 = _3461 + 8;
            uint _3523 = uint(int(uint(_3521) >> uint(2)));
            float _3525 = as_type<float>(_dmw54.z);
            int _3527 = _3461 + 12;
            uint _3529 = uint(int(uint(_3527) >> uint(2)));
            float _3531 = as_type<float>(_dmw54.w);
            int _3533 = _1573 * 656;
            int _3535 = _3509 + 262144;
            uint _3537 = uint(int(uint(_3485) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3537)];
            float _3539 = as_type<float>(_dmw55.x);
            int _3541 = _3485 + 4;
            uint _3543 = uint(int(uint(_3541) >> uint(2)));
            float _3545 = as_type<float>(_dmw55.y);
            int _3547 = _3485 + 8;
            uint _3549 = uint(int(uint(_3547) >> uint(2)));
            float _3551 = as_type<float>(_dmw55.z);
            int _3553 = _3485 + 12;
            uint _3555 = uint(int(uint(_3553) >> uint(2)));
            float _3557 = as_type<float>(_dmw55.w);
            int _3559 = _3509 + 262192;
            int _3561 = _3509 + 262160;
            uint _3563 = uint(int(uint(_3535) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3563)];
            float _3565 = as_type<float>(_dmw56.x);
            int _3567 = _3535 + 4;
            uint _3569 = uint(int(uint(_3567) >> uint(2)));
            float _3571 = as_type<float>(_dmw56.y);
            int _3573 = _3535 + 8;
            uint _3575 = uint(int(uint(_3573) >> uint(2)));
            float _3577 = as_type<float>(_dmw56.z);
            int _3579 = _3535 + 12;
            uint _3581 = uint(int(uint(_3579) >> uint(2)));
            float _3583 = as_type<float>(_dmw56.w);
            int _3585 = _3509 + 262208;
            int _3587 = _3509 + 262176;
            uint _3589 = uint(int(uint(_3559) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3589)];
            float _3591 = as_type<float>(_dmw59.x);
            int _3593 = _3559 + 4;
            uint _3595 = uint(int(uint(_3593) >> uint(2)));
            float _3597 = as_type<float>(_dmw59.y);
            int _3599 = _3559 + 8;
            uint _3601 = uint(int(uint(_3599) >> uint(2)));
            float _3603 = as_type<float>(_dmw59.z);
            int _3605 = _3559 + 12;
            uint _3607 = uint(int(uint(_3605) >> uint(2)));
            float _3609 = as_type<float>(_dmw59.w);
            int _3611 = _3509 + 262224;
            int _3613 = _3509 + 262240;
            uint _3615 = uint(int(uint(_3561) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3615)];
            float _3617 = as_type<float>(_dmw57.x);
            int _3619 = _3561 + 4;
            uint _3621 = uint(int(uint(_3619) >> uint(2)));
            float _3623 = as_type<float>(_dmw57.y);
            int _3625 = _3561 + 8;
            uint _3627 = uint(int(uint(_3625) >> uint(2)));
            float _3629 = as_type<float>(_dmw57.z);
            int _3631 = _3561 + 12;
            uint _3633 = uint(int(uint(_3631) >> uint(2)));
            float _3635 = as_type<float>(_dmw57.w);
            int _3637 = _3509 + 262256;
            int _3639 = _3533 + 262144;
            uint _3641 = uint(int(uint(_3585) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3641)];
            float _3643 = as_type<float>(_dmw60.x);
            int _3645 = _3585 + 4;
            uint _3647 = uint(int(uint(_3645) >> uint(2)));
            float _3649 = as_type<float>(_dmw60.y);
            int _3651 = _3585 + 8;
            uint _3653 = uint(int(uint(_3651) >> uint(2)));
            float _3655 = as_type<float>(_dmw60.z);
            int _3657 = _3585 + 12;
            uint _3659 = uint(int(uint(_3657) >> uint(2)));
            float _3661 = as_type<float>(_dmw60.w);
            int _3663 = _3533 + 262192;
            int _3665 = _3533 + 262160;
            uint _3667 = uint(int(uint(_3587) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3667)];
            float _3669 = as_type<float>(_dmw58.x);
            int _3671 = _3587 + 4;
            uint _3673 = uint(int(uint(_3671) >> uint(2)));
            float _3675 = as_type<float>(_dmw58.y);
            int _3677 = _3587 + 8;
            uint _3679 = uint(int(uint(_3677) >> uint(2)));
            float _3681 = as_type<float>(_dmw58.z);
            int _3683 = _3587 + 12;
            uint _3685 = uint(int(uint(_3683) >> uint(2)));
            float _3687 = as_type<float>(_dmw58.w);
            int _3689 = _3533 + 262208;
            int _3691 = _3533 + 262176;
            uint _3693 = uint(int(uint(_3611) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3693)];
            float _3695 = as_type<float>(_dmw61.x);
            int _3697 = _3611 + 4;
            uint _3699 = uint(int(uint(_3697) >> uint(2)));
            float _3701 = as_type<float>(_dmw61.y);
            int _3703 = _3611 + 8;
            uint _3705 = uint(int(uint(_3703) >> uint(2)));
            float _3707 = as_type<float>(_dmw61.z);
            int _3709 = _3611 + 12;
            uint _3711 = uint(int(uint(_3709) >> uint(2)));
            float _3713 = as_type<float>(_dmw61.w);
            int _3715 = _3533 + 262224;
            int _3717 = _3533 + 262240;
            uint _3719 = uint(int(uint(_3613) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3719)];
            float _3721 = as_type<float>(_dmw62.x);
            int _3723 = _3613 + 4;
            uint _3725 = uint(int(uint(_3723) >> uint(2)));
            float _3727 = as_type<float>(_dmw62.y);
            int _3729 = _3613 + 8;
            uint _3731 = uint(int(uint(_3729) >> uint(2)));
            float _3733 = as_type<float>(_dmw62.z);
            int _3735 = _3613 + 12;
            uint _3737 = uint(int(uint(_3735) >> uint(2)));
            float _3739 = as_type<float>(_dmw62.w);
            int _3741 = _3533 + 262256;
            uint _3743 = uint(int(uint(_3637) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3743)];
            float _3745 = as_type<float>(_dmw63.x);
            int _3747 = _3637 + 4;
            uint _3749 = uint(int(uint(_3747) >> uint(2)));
            float _3751 = as_type<float>(_dmw63.y);
            int _3753 = _3637 + 8;
            uint _3755 = uint(int(uint(_3753) >> uint(2)));
            float _3757 = as_type<float>(_dmw63.z);
            int _3759 = _3637 + 12;
            uint _3761 = uint(int(uint(_3759) >> uint(2)));
            float _3763 = as_type<float>(_dmw63.w);
            uint _3765 = uint(int(uint(_3639) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3765)];
            float _3767 = as_type<float>(_dmw64.x);
            int _3769 = _3639 + 4;
            uint _3771 = uint(int(uint(_3769) >> uint(2)));
            float _3773 = as_type<float>(_dmw64.y);
            int _3775 = _3639 + 8;
            uint _3777 = uint(int(uint(_3775) >> uint(2)));
            float _3779 = as_type<float>(_dmw64.z);
            int _3781 = _3639 + 12;
            uint _3783 = uint(int(uint(_3781) >> uint(2)));
            float _3785 = as_type<float>(_dmw64.w);
            uint _3787 = uint(int(uint(_3663) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3787)];
            float _3789 = as_type<float>(_dmw67.x);
            int _3791 = _3663 + 4;
            uint _3793 = uint(int(uint(_3791) >> uint(2)));
            float _3795 = as_type<float>(_dmw67.y);
            int _3797 = _3663 + 8;
            uint _3799 = uint(int(uint(_3797) >> uint(2)));
            float _3801 = as_type<float>(_dmw67.z);
            int _3803 = _3663 + 12;
            uint _3805 = uint(int(uint(_3803) >> uint(2)));
            float _3807 = as_type<float>(_dmw67.w);
            uint _3809 = uint(int(uint(_3665) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3809)];
            float _3811 = as_type<float>(_dmw65.x);
            int _3813 = _3665 + 4;
            uint _3815 = uint(int(uint(_3813) >> uint(2)));
            float _3817 = as_type<float>(_dmw65.y);
            int _3819 = _3665 + 8;
            uint _3821 = uint(int(uint(_3819) >> uint(2)));
            float _3823 = as_type<float>(_dmw65.z);
            int _3825 = _3665 + 12;
            uint _3827 = uint(int(uint(_3825) >> uint(2)));
            float _3829 = as_type<float>(_dmw65.w);
            uint _3831 = uint(int(uint(_3689) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3831)];
            float _3833 = as_type<float>(_dmw68.x);
            int _3835 = _3689 + 4;
            uint _3837 = uint(int(uint(_3835) >> uint(2)));
            float _3839 = as_type<float>(_dmw68.y);
            int _3841 = _3689 + 8;
            uint _3843 = uint(int(uint(_3841) >> uint(2)));
            float _3845 = as_type<float>(_dmw68.z);
            int _3847 = _3689 + 12;
            uint _3849 = uint(int(uint(_3847) >> uint(2)));
            float _3851 = as_type<float>(_dmw68.w);
            uint _3853 = uint(int(uint(_3691) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3853)];
            float _3855 = as_type<float>(_dmw66.x);
            int _3857 = _3691 + 4;
            uint _3859 = uint(int(uint(_3857) >> uint(2)));
            float _3861 = as_type<float>(_dmw66.y);
            int _3863 = _3691 + 8;
            uint _3865 = uint(int(uint(_3863) >> uint(2)));
            float _3867 = as_type<float>(_dmw66.z);
            int _3869 = _3691 + 12;
            uint _3871 = uint(int(uint(_3869) >> uint(2)));
            float _3873 = as_type<float>(_dmw66.w);
            uint _3875 = uint(int(uint(_3715) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3875)];
            float _3877 = as_type<float>(_dmw69.x);
            int _3879 = _3715 + 4;
            uint _3881 = uint(int(uint(_3879) >> uint(2)));
            float _3883 = as_type<float>(_dmw69.y);
            int _3885 = _3715 + 8;
            uint _3887 = uint(int(uint(_3885) >> uint(2)));
            float _3889 = as_type<float>(_dmw69.z);
            int _3891 = _3715 + 12;
            uint _3893 = uint(int(uint(_3891) >> uint(2)));
            float _3895 = as_type<float>(_dmw69.w);
            uint _3897 = uint(int(uint(_3717) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3897)];
            float _3899 = as_type<float>(_dmw70.x);
            int _3901 = _3717 + 4;
            uint _3903 = uint(int(uint(_3901) >> uint(2)));
            float _3905 = as_type<float>(_dmw70.y);
            int _3907 = _3717 + 8;
            uint _3909 = uint(int(uint(_3907) >> uint(2)));
            float _3911 = as_type<float>(_dmw70.z);
            int _3913 = _3717 + 12;
            uint _3915 = uint(int(uint(_3913) >> uint(2)));
            float _3917 = as_type<float>(_dmw70.w);
            uint _3919 = uint(int(uint(_3741) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3919)];
            float _3921 = as_type<float>(_dmw71.x);
            int _3923 = _3741 + 4;
            uint _3925 = uint(int(uint(_3923) >> uint(2)));
            float _3927 = as_type<float>(_dmw71.y);
            int _3929 = _3741 + 8;
            uint _3931 = uint(int(uint(_3929) >> uint(2)));
            float _3933 = as_type<float>(_dmw71.z);
            int _3935 = _3741 + 12;
            uint _3937 = uint(int(uint(_3935) >> uint(2)));
            float _3939 = as_type<float>(_dmw71.w);
            float _3941 = -_3351;
            float _3943 = _3349 + _3941;
            float _3945 = -_3943;
            float _3947 = _1495 + _3945;
            float _3949 = _3369 * _3943;
            float _3951 = _3375 * _3943;
            float _3953 = _3381 * _3943;
            float _3955 = _3387 * _3943;
            float _3957 = _3393 * _3943;
            float _3959 = _3399 * _3943;
            float _3961 = _3405 * _3943;
            float _3963 = _3411 * _3943;
            float _3965 = _3417 * _3943;
            float _3967 = _3423 * _3943;
            float _3969 = _3429 * _3943;
            float _3971 = _3435 * _3943;
            float _3973 = _3441 * _3943;
            float _3975 = _3447 * _3943;
            float _3977 = _3453 * _3943;
            float _3979 = _3459 * _3943;
            float _3981 = _3465 * _3943;
            float _3983 = _3471 * _3943;
            float _3985 = _3477 * _3943;
            float _3987 = _3483 * _3943;
            float _3989 = _3489 * _3943;
            float _3991 = _3495 * _3943;
            float _3993 = _3501 * _3943;
            float _3995 = _3507 * _3943;
            float _3997 = _3513 * _3943;
            float _3999 = _3519 * _3943;
            float _4001 = _3525 * _3943;
            float _4003 = _3531 * _3943;
            float _4005 = _3539 * _3943;
            float _4007 = _3545 * _3943;
            float _4009 = _3551 * _3943;
            float _4011 = _3557 * _3943;
            float _4013 = -_3349;
            float _4015 = fma(_3565, _4013, _3949);
            float _4017 = -_3349;
            float _4019 = fma(_3571, _4017, _3951);
            float _4021 = -_3349;
            float _4023 = fma(_3577, _4021, _3953);
            float _4025 = -_3349;
            float _4027 = fma(_3583, _4025, _3955);
            float _4029 = -_3349;
            float _4031 = fma(_3591, _4029, _3957);
            float _4033 = -_3349;
            float _4035 = fma(_3597, _4033, _3959);
            float _4037 = -_3349;
            float _4039 = fma(_3603, _4037, _3961);
            float _4041 = -_3349;
            float _4043 = fma(_3609, _4041, _3963);
            float _4045 = -_3349;
            float _4047 = fma(_3617, _4045, _3965);
            float _4049 = -_3349;
            float _4051 = fma(_3623, _4049, _3967);
            float _4053 = -_3349;
            float _4055 = fma(_3629, _4053, _3969);
            float _4057 = -_3349;
            float _4059 = fma(_3635, _4057, _3971);
            float _4061 = -_3349;
            float _4063 = fma(_3643, _4061, _3973);
            float _4065 = -_3349;
            float _4067 = fma(_3649, _4065, _3975);
            float _4069 = -_3349;
            float _4071 = fma(_3655, _4069, _3977);
            float _4073 = -_3349;
            float _4075 = fma(_3661, _4073, _3979);
            float _4077 = -_3349;
            float _4079 = fma(_3669, _4077, _3981);
            float _4081 = -_3349;
            float _4083 = fma(_3675, _4081, _3983);
            float _4085 = -_3349;
            float _4087 = fma(_3681, _4085, _3985);
            float _4089 = -_3349;
            float _4091 = fma(_3687, _4089, _3987);
            float _4093 = -_3349;
            float _4095 = fma(_3695, _4093, _3989);
            float _4097 = -_3349;
            float _4099 = fma(_3701, _4097, _3991);
            float _4101 = -_3349;
            float _4103 = fma(_3707, _4101, _3993);
            float _4105 = -_3349;
            float _4107 = fma(_3713, _4105, _3995);
            float _4109 = -_3349;
            float _4111 = fma(_3721, _4109, _3997);
            float _4113 = -_3349;
            float _4115 = fma(_3727, _4113, _3999);
            float _4117 = -_3349;
            float _4119 = fma(_3733, _4117, _4001);
            float _4121 = -_3349;
            float _4123 = fma(_3739, _4121, _4003);
            float _4125 = -_3349;
            float _4127 = fma(_3745, _4125, _4005);
            float _4129 = -_3349;
            float _4131 = fma(_3751, _4129, _4007);
            float _4133 = -_3349;
            float _4135 = fma(_3757, _4133, _4009);
            float _4137 = -_3349;
            float _4139 = fma(_3763, _4137, _4011);
            float _4141 = fma(_3767, _3947, _4015);
            float _4143 = fma(_3773, _3947, _4019);
            float _4145 = fma(_3779, _3947, _4023);
            float _4147 = fma(_3785, _3947, _4027);
            float _4149 = fma(_3789, _3947, _4031);
            float _4151 = fma(_3795, _3947, _4035);
            float _4153 = fma(_3801, _3947, _4039);
            float _4155 = fma(_3807, _3947, _4043);
            float _4157 = fma(_3811, _3947, _4047);
            float _4159 = fma(_3817, _3947, _4051);
            float _4161 = fma(_3823, _3947, _4055);
            float _4163 = fma(_3829, _3947, _4059);
            float _4165 = fma(_3833, _3947, _4063);
            float _4167 = fma(_3839, _3947, _4067);
            float _4169 = fma(_3845, _3947, _4071);
            float _4171 = fma(_3851, _3947, _4075);
            float _4173 = fma(_3855, _3947, _4079);
            float _4175 = fma(_3861, _3947, _4083);
            float _4177 = fma(_3867, _3947, _4087);
            float _4179 = fma(_3873, _3947, _4091);
            float _4181 = fma(_3877, _3947, _4095);
            float _4183 = fma(_3883, _3947, _4099);
            float _4185 = fma(_3889, _3947, _4103);
            float _4187 = fma(_3895, _3947, _4107);
            float _4189 = fma(_3899, _3947, _4111);
            float _4191 = fma(_3905, _3947, _4115);
            float _4193 = fma(_3911, _3947, _4119);
            float _4195 = fma(_3917, _3947, _4123);
            float _4197 = fma(_3921, _3947, _4127);
            float _4199 = fma(_3927, _3947, _4131);
            float _4201 = fma(_3933, _3947, _4135);
            float _4203 = fma(_3939, _3947, _4139);
            _2373 = _4155;
            _2375 = _4151;
            _2377 = _4183;
            _2379 = _4165;
            _2381 = _4149;
            _2383 = _4169;
            _2385 = _4185;
            _2387 = _4167;
            _2389 = _4171;
            _2391 = _4187;
            _2393 = _4153;
            _2395 = _4181;
            _2397 = _4199;
            _2399 = _4147;
            _2401 = _4197;
            _2403 = _4157;
            _2405 = _4159;
            _2407 = _4191;
            _2409 = _4141;
            _2411 = _4143;
            _2413 = _4145;
            _2415 = _4189;
            _2417 = _4201;
            _2419 = _4163;
            _2421 = _4173;
            _2423 = _4193;
            _2425 = _4203;
            _2427 = _4177;
            _2429 = _4179;
            _2431 = _4195;
            _2433 = _4161;
            _2435 = _4175;
            _2437 = true;
        }
        else
        {
            int _4205 = _1569 * 656;
            int _4207 = _4205 + 262144;
            int _4209 = _4205 + 262192;
            int _4211 = _4205 + 262160;
            uint _4213 = uint(int(uint(_4207) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4213)];
            float _4215 = as_type<float>(_dmw72.x);
            int _4217 = _4207 + 4;
            uint _4219 = uint(int(uint(_4217) >> uint(2)));
            float _4221 = as_type<float>(_dmw72.y);
            int _4223 = _4207 + 8;
            uint _4225 = uint(int(uint(_4223) >> uint(2)));
            float _4227 = as_type<float>(_dmw72.z);
            int _4229 = _4207 + 12;
            uint _4231 = uint(int(uint(_4229) >> uint(2)));
            float _4233 = as_type<float>(_dmw72.w);
            int _4235 = _4205 + 262208;
            uint _4237 = uint(int(uint(_4209) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4237)];
            float _4239 = as_type<float>(_dmw75.x);
            int _4241 = _4209 + 4;
            uint _4243 = uint(int(uint(_4241) >> uint(2)));
            float _4245 = as_type<float>(_dmw75.y);
            int _4247 = _4209 + 8;
            uint _4249 = uint(int(uint(_4247) >> uint(2)));
            float _4251 = as_type<float>(_dmw75.z);
            int _4253 = _4209 + 12;
            uint _4255 = uint(int(uint(_4253) >> uint(2)));
            float _4257 = as_type<float>(_dmw75.w);
            int _4259 = _4205 + 262176;
            uint _4261 = uint(int(uint(_4211) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4261)];
            float _4263 = as_type<float>(_dmw73.x);
            int _4265 = _4211 + 4;
            uint _4267 = uint(int(uint(_4265) >> uint(2)));
            float _4269 = as_type<float>(_dmw73.y);
            int _4271 = _4211 + 8;
            uint _4273 = uint(int(uint(_4271) >> uint(2)));
            float _4275 = as_type<float>(_dmw73.z);
            int _4277 = _4211 + 12;
            uint _4279 = uint(int(uint(_4277) >> uint(2)));
            float _4281 = as_type<float>(_dmw73.w);
            int _4283 = _4205 + 262224;
            uint _4285 = uint(int(uint(_4235) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4285)];
            float _4287 = as_type<float>(_dmw76.x);
            int _4289 = _4235 + 4;
            uint _4291 = uint(int(uint(_4289) >> uint(2)));
            float _4293 = as_type<float>(_dmw76.y);
            int _4295 = _4235 + 8;
            uint _4297 = uint(int(uint(_4295) >> uint(2)));
            float _4299 = as_type<float>(_dmw76.z);
            int _4301 = _4235 + 12;
            uint _4303 = uint(int(uint(_4301) >> uint(2)));
            float _4305 = as_type<float>(_dmw76.w);
            int _4307 = _4205 + 262240;
            uint _4309 = uint(int(uint(_4259) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4309)];
            float _4311 = as_type<float>(_dmw74.x);
            int _4313 = _4259 + 4;
            uint _4315 = uint(int(uint(_4313) >> uint(2)));
            float _4317 = as_type<float>(_dmw74.y);
            int _4319 = _4259 + 8;
            uint _4321 = uint(int(uint(_4319) >> uint(2)));
            float _4323 = as_type<float>(_dmw74.z);
            int _4325 = _4259 + 12;
            uint _4327 = uint(int(uint(_4325) >> uint(2)));
            float _4329 = as_type<float>(_dmw74.w);
            int _4331 = _4205 + 262256;
            uint _4333 = uint(int(uint(_4283) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4333)];
            float _4335 = as_type<float>(_dmw77.x);
            int _4337 = _4283 + 4;
            uint _4339 = uint(int(uint(_4337) >> uint(2)));
            float _4341 = as_type<float>(_dmw77.y);
            int _4343 = _4283 + 8;
            uint _4345 = uint(int(uint(_4343) >> uint(2)));
            float _4347 = as_type<float>(_dmw77.z);
            int _4349 = _4283 + 12;
            uint _4351 = uint(int(uint(_4349) >> uint(2)));
            float _4353 = as_type<float>(_dmw77.w);
            int _4355 = _1523 * 656;
            uint _4357 = uint(int(uint(_4307) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4357)];
            float _4359 = as_type<float>(_dmw78.x);
            int _4361 = _4307 + 4;
            uint _4363 = uint(int(uint(_4361) >> uint(2)));
            float _4365 = as_type<float>(_dmw78.y);
            int _4367 = _4307 + 8;
            uint _4369 = uint(int(uint(_4367) >> uint(2)));
            float _4371 = as_type<float>(_dmw78.z);
            int _4373 = _4307 + 12;
            uint _4375 = uint(int(uint(_4373) >> uint(2)));
            float _4377 = as_type<float>(_dmw78.w);
            int _4379 = _1573 * 656;
            int _4381 = _4355 + 262144;
            uint _4383 = uint(int(uint(_4331) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4383)];
            float _4385 = as_type<float>(_dmw79.x);
            int _4387 = _4331 + 4;
            uint _4389 = uint(int(uint(_4387) >> uint(2)));
            float _4391 = as_type<float>(_dmw79.y);
            int _4393 = _4331 + 8;
            uint _4395 = uint(int(uint(_4393) >> uint(2)));
            float _4397 = as_type<float>(_dmw79.z);
            int _4399 = _4331 + 12;
            uint _4401 = uint(int(uint(_4399) >> uint(2)));
            float _4403 = as_type<float>(_dmw79.w);
            int _4405 = _4355 + 262192;
            int _4407 = _4355 + 262160;
            uint _4409 = uint(int(uint(_4381) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4409)];
            float _4411 = as_type<float>(_dmw80.x);
            int _4413 = _4381 + 4;
            uint _4415 = uint(int(uint(_4413) >> uint(2)));
            float _4417 = as_type<float>(_dmw80.y);
            int _4419 = _4381 + 8;
            uint _4421 = uint(int(uint(_4419) >> uint(2)));
            float _4423 = as_type<float>(_dmw80.z);
            int _4425 = _4381 + 12;
            uint _4427 = uint(int(uint(_4425) >> uint(2)));
            float _4429 = as_type<float>(_dmw80.w);
            int _4431 = _4355 + 262208;
            int _4433 = _4355 + 262176;
            uint _4435 = uint(int(uint(_4405) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4435)];
            float _4437 = as_type<float>(_dmw83.x);
            int _4439 = _4405 + 4;
            uint _4441 = uint(int(uint(_4439) >> uint(2)));
            float _4443 = as_type<float>(_dmw83.y);
            int _4445 = _4405 + 8;
            uint _4447 = uint(int(uint(_4445) >> uint(2)));
            float _4449 = as_type<float>(_dmw83.z);
            int _4451 = _4405 + 12;
            uint _4453 = uint(int(uint(_4451) >> uint(2)));
            float _4455 = as_type<float>(_dmw83.w);
            int _4457 = _4355 + 262224;
            int _4459 = _4355 + 262240;
            uint _4461 = uint(int(uint(_4407) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4461)];
            float _4463 = as_type<float>(_dmw81.x);
            int _4465 = _4407 + 4;
            uint _4467 = uint(int(uint(_4465) >> uint(2)));
            float _4469 = as_type<float>(_dmw81.y);
            int _4471 = _4407 + 8;
            uint _4473 = uint(int(uint(_4471) >> uint(2)));
            float _4475 = as_type<float>(_dmw81.z);
            int _4477 = _4407 + 12;
            uint _4479 = uint(int(uint(_4477) >> uint(2)));
            float _4481 = as_type<float>(_dmw81.w);
            int _4483 = _4355 + 262256;
            int _4485 = _4379 + 262144;
            uint _4487 = uint(int(uint(_4431) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4487)];
            float _4489 = as_type<float>(_dmw84.x);
            int _4491 = _4431 + 4;
            uint _4493 = uint(int(uint(_4491) >> uint(2)));
            float _4495 = as_type<float>(_dmw84.y);
            int _4497 = _4431 + 8;
            uint _4499 = uint(int(uint(_4497) >> uint(2)));
            float _4501 = as_type<float>(_dmw84.z);
            int _4503 = _4431 + 12;
            uint _4505 = uint(int(uint(_4503) >> uint(2)));
            float _4507 = as_type<float>(_dmw84.w);
            int _4509 = _4379 + 262192;
            int _4511 = _4379 + 262160;
            uint _4513 = uint(int(uint(_4433) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4513)];
            float _4515 = as_type<float>(_dmw82.x);
            int _4517 = _4433 + 4;
            uint _4519 = uint(int(uint(_4517) >> uint(2)));
            float _4521 = as_type<float>(_dmw82.y);
            int _4523 = _4433 + 8;
            uint _4525 = uint(int(uint(_4523) >> uint(2)));
            float _4527 = as_type<float>(_dmw82.z);
            int _4529 = _4433 + 12;
            uint _4531 = uint(int(uint(_4529) >> uint(2)));
            float _4533 = as_type<float>(_dmw82.w);
            int _4535 = _4379 + 262208;
            int _4537 = _4379 + 262176;
            uint _4539 = uint(int(uint(_4457) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4539)];
            float _4541 = as_type<float>(_dmw85.x);
            int _4543 = _4457 + 4;
            uint _4545 = uint(int(uint(_4543) >> uint(2)));
            float _4547 = as_type<float>(_dmw85.y);
            int _4549 = _4457 + 8;
            uint _4551 = uint(int(uint(_4549) >> uint(2)));
            float _4553 = as_type<float>(_dmw85.z);
            int _4555 = _4457 + 12;
            uint _4557 = uint(int(uint(_4555) >> uint(2)));
            float _4559 = as_type<float>(_dmw85.w);
            int _4561 = _4379 + 262224;
            int _4563 = _4379 + 262240;
            uint _4565 = uint(int(uint(_4459) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4565)];
            float _4567 = as_type<float>(_dmw86.x);
            int _4569 = _4459 + 4;
            uint _4571 = uint(int(uint(_4569) >> uint(2)));
            float _4573 = as_type<float>(_dmw86.y);
            int _4575 = _4459 + 8;
            uint _4577 = uint(int(uint(_4575) >> uint(2)));
            float _4579 = as_type<float>(_dmw86.z);
            int _4581 = _4459 + 12;
            uint _4583 = uint(int(uint(_4581) >> uint(2)));
            float _4585 = as_type<float>(_dmw86.w);
            int _4587 = _4379 + 262256;
            uint _4589 = uint(int(uint(_4483) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4589)];
            float _4591 = as_type<float>(_dmw87.x);
            int _4593 = _4483 + 4;
            uint _4595 = uint(int(uint(_4593) >> uint(2)));
            float _4597 = as_type<float>(_dmw87.y);
            int _4599 = _4483 + 8;
            uint _4601 = uint(int(uint(_4599) >> uint(2)));
            float _4603 = as_type<float>(_dmw87.z);
            int _4605 = _4483 + 12;
            uint _4607 = uint(int(uint(_4605) >> uint(2)));
            float _4609 = as_type<float>(_dmw87.w);
            uint _4611 = uint(int(uint(_4485) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4611)];
            float _4613 = as_type<float>(_dmw88.x);
            int _4615 = _4485 + 4;
            uint _4617 = uint(int(uint(_4615) >> uint(2)));
            float _4619 = as_type<float>(_dmw88.y);
            int _4621 = _4485 + 8;
            uint _4623 = uint(int(uint(_4621) >> uint(2)));
            float _4625 = as_type<float>(_dmw88.z);
            int _4627 = _4485 + 12;
            uint _4629 = uint(int(uint(_4627) >> uint(2)));
            float _4631 = as_type<float>(_dmw88.w);
            uint _4633 = uint(int(uint(_4509) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4633)];
            float _4635 = as_type<float>(_dmw91.x);
            int _4637 = _4509 + 4;
            uint _4639 = uint(int(uint(_4637) >> uint(2)));
            float _4641 = as_type<float>(_dmw91.y);
            int _4643 = _4509 + 8;
            uint _4645 = uint(int(uint(_4643) >> uint(2)));
            float _4647 = as_type<float>(_dmw91.z);
            int _4649 = _4509 + 12;
            uint _4651 = uint(int(uint(_4649) >> uint(2)));
            float _4653 = as_type<float>(_dmw91.w);
            uint _4655 = uint(int(uint(_4511) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4655)];
            float _4657 = as_type<float>(_dmw89.x);
            int _4659 = _4511 + 4;
            uint _4661 = uint(int(uint(_4659) >> uint(2)));
            float _4663 = as_type<float>(_dmw89.y);
            int _4665 = _4511 + 8;
            uint _4667 = uint(int(uint(_4665) >> uint(2)));
            float _4669 = as_type<float>(_dmw89.z);
            int _4671 = _4511 + 12;
            uint _4673 = uint(int(uint(_4671) >> uint(2)));
            float _4675 = as_type<float>(_dmw89.w);
            uint _4677 = uint(int(uint(_4535) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4677)];
            float _4679 = as_type<float>(_dmw92.x);
            int _4681 = _4535 + 4;
            uint _4683 = uint(int(uint(_4681) >> uint(2)));
            float _4685 = as_type<float>(_dmw92.y);
            int _4687 = _4535 + 8;
            uint _4689 = uint(int(uint(_4687) >> uint(2)));
            float _4691 = as_type<float>(_dmw92.z);
            int _4693 = _4535 + 12;
            uint _4695 = uint(int(uint(_4693) >> uint(2)));
            float _4697 = as_type<float>(_dmw92.w);
            uint _4699 = uint(int(uint(_4537) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4699)];
            float _4701 = as_type<float>(_dmw90.x);
            int _4703 = _4537 + 4;
            uint _4705 = uint(int(uint(_4703) >> uint(2)));
            float _4707 = as_type<float>(_dmw90.y);
            int _4709 = _4537 + 8;
            uint _4711 = uint(int(uint(_4709) >> uint(2)));
            float _4713 = as_type<float>(_dmw90.z);
            int _4715 = _4537 + 12;
            uint _4717 = uint(int(uint(_4715) >> uint(2)));
            float _4719 = as_type<float>(_dmw90.w);
            uint _4721 = uint(int(uint(_4561) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4721)];
            float _4723 = as_type<float>(_dmw93.x);
            int _4725 = _4561 + 4;
            uint _4727 = uint(int(uint(_4725) >> uint(2)));
            float _4729 = as_type<float>(_dmw93.y);
            int _4731 = _4561 + 8;
            uint _4733 = uint(int(uint(_4731) >> uint(2)));
            float _4735 = as_type<float>(_dmw93.z);
            int _4737 = _4561 + 12;
            uint _4739 = uint(int(uint(_4737) >> uint(2)));
            float _4741 = as_type<float>(_dmw93.w);
            uint _4743 = uint(int(uint(_4563) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4743)];
            float _4745 = as_type<float>(_dmw94.x);
            int _4747 = _4563 + 4;
            uint _4749 = uint(int(uint(_4747) >> uint(2)));
            float _4751 = as_type<float>(_dmw94.y);
            int _4753 = _4563 + 8;
            uint _4755 = uint(int(uint(_4753) >> uint(2)));
            float _4757 = as_type<float>(_dmw94.z);
            int _4759 = _4563 + 12;
            uint _4761 = uint(int(uint(_4759) >> uint(2)));
            float _4763 = as_type<float>(_dmw94.w);
            uint _4765 = uint(int(uint(_4587) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4765)];
            float _4767 = as_type<float>(_dmw95.x);
            int _4769 = _4587 + 4;
            uint _4771 = uint(int(uint(_4769) >> uint(2)));
            float _4773 = as_type<float>(_dmw95.y);
            int _4775 = _4587 + 8;
            uint _4777 = uint(int(uint(_4775) >> uint(2)));
            float _4779 = as_type<float>(_dmw95.z);
            int _4781 = _4587 + 12;
            uint _4783 = uint(int(uint(_4781) >> uint(2)));
            float _4785 = as_type<float>(_dmw95.w);
            float _4787 = -_3349;
            float _4789 = _4787 + _3351;
            float _4791 = -_4789;
            float _4793 = _1519 + _4791;
            float _4795 = _4215 * _4789;
            float _4797 = _4221 * _4789;
            float _4799 = _4227 * _4789;
            float _4801 = _4233 * _4789;
            float _4803 = _4239 * _4789;
            float _4805 = _4245 * _4789;
            float _4807 = _4251 * _4789;
            float _4809 = _4257 * _4789;
            float _4811 = _4263 * _4789;
            float _4813 = _4269 * _4789;
            float _4815 = _4275 * _4789;
            float _4817 = _4281 * _4789;
            float _4819 = _4287 * _4789;
            float _4821 = _4293 * _4789;
            float _4823 = _4299 * _4789;
            float _4825 = _4305 * _4789;
            float _4827 = _4311 * _4789;
            float _4829 = _4317 * _4789;
            float _4831 = _4323 * _4789;
            float _4833 = _4329 * _4789;
            float _4835 = _4335 * _4789;
            float _4837 = _4341 * _4789;
            float _4839 = _4347 * _4789;
            float _4841 = _4353 * _4789;
            float _4843 = _4359 * _4789;
            float _4845 = _4365 * _4789;
            float _4847 = _4371 * _4789;
            float _4849 = _4377 * _4789;
            float _4851 = _4385 * _4789;
            float _4853 = _4391 * _4789;
            float _4855 = _4397 * _4789;
            float _4857 = _4403 * _4789;
            float _4859 = -_3351;
            float _4861 = fma(_4411, _4859, _4795);
            float _4863 = -_3351;
            float _4865 = fma(_4417, _4863, _4797);
            float _4867 = -_3351;
            float _4869 = fma(_4423, _4867, _4799);
            float _4871 = -_3351;
            float _4873 = fma(_4429, _4871, _4801);
            float _4875 = -_3351;
            float _4877 = fma(_4437, _4875, _4803);
            float _4879 = -_3351;
            float _4881 = fma(_4443, _4879, _4805);
            float _4883 = -_3351;
            float _4885 = fma(_4449, _4883, _4807);
            float _4887 = -_3351;
            float _4889 = fma(_4455, _4887, _4809);
            float _4891 = -_3351;
            float _4893 = fma(_4463, _4891, _4811);
            float _4895 = -_3351;
            float _4897 = fma(_4469, _4895, _4813);
            float _4899 = -_3351;
            float _4901 = fma(_4475, _4899, _4815);
            float _4903 = -_3351;
            float _4905 = fma(_4481, _4903, _4817);
            float _4907 = -_3351;
            float _4909 = fma(_4489, _4907, _4819);
            float _4911 = -_3351;
            float _4913 = fma(_4495, _4911, _4821);
            float _4915 = -_3351;
            float _4917 = fma(_4501, _4915, _4823);
            float _4919 = -_3351;
            float _4921 = fma(_4507, _4919, _4825);
            float _4923 = -_3351;
            float _4925 = fma(_4515, _4923, _4827);
            float _4927 = -_3351;
            float _4929 = fma(_4521, _4927, _4829);
            float _4931 = -_3351;
            float _4933 = fma(_4527, _4931, _4831);
            float _4935 = -_3351;
            float _4937 = fma(_4533, _4935, _4833);
            float _4939 = -_3351;
            float _4941 = fma(_4541, _4939, _4835);
            float _4943 = -_3351;
            float _4945 = fma(_4547, _4943, _4837);
            float _4947 = -_3351;
            float _4949 = fma(_4553, _4947, _4839);
            float _4951 = -_3351;
            float _4953 = fma(_4559, _4951, _4841);
            float _4955 = -_3351;
            float _4957 = fma(_4567, _4955, _4843);
            float _4959 = -_3351;
            float _4961 = fma(_4573, _4959, _4845);
            float _4963 = -_3351;
            float _4965 = fma(_4579, _4963, _4847);
            float _4967 = -_3351;
            float _4969 = fma(_4585, _4967, _4849);
            float _4971 = -_3351;
            float _4973 = fma(_4591, _4971, _4851);
            float _4975 = -_3351;
            float _4977 = fma(_4597, _4975, _4853);
            float _4979 = -_3351;
            float _4981 = fma(_4603, _4979, _4855);
            float _4983 = -_3351;
            float _4985 = fma(_4609, _4983, _4857);
            float _4987 = fma(_4613, _4793, _4861);
            float _4989 = fma(_4619, _4793, _4865);
            float _4991 = fma(_4625, _4793, _4869);
            float _4993 = fma(_4631, _4793, _4873);
            float _4995 = fma(_4635, _4793, _4877);
            float _4997 = fma(_4641, _4793, _4881);
            float _4999 = fma(_4647, _4793, _4885);
            float _5001 = fma(_4653, _4793, _4889);
            float _5003 = fma(_4657, _4793, _4893);
            float _5005 = fma(_4663, _4793, _4897);
            float _5007 = fma(_4669, _4793, _4901);
            float _5009 = fma(_4675, _4793, _4905);
            float _5011 = fma(_4679, _4793, _4909);
            float _5013 = fma(_4685, _4793, _4913);
            float _5015 = fma(_4691, _4793, _4917);
            float _5017 = fma(_4697, _4793, _4921);
            float _5019 = fma(_4701, _4793, _4925);
            float _5021 = fma(_4707, _4793, _4929);
            float _5023 = fma(_4713, _4793, _4933);
            float _5025 = fma(_4719, _4793, _4937);
            float _5027 = fma(_4723, _4793, _4941);
            float _5029 = fma(_4729, _4793, _4945);
            float _5031 = fma(_4735, _4793, _4949);
            float _5033 = fma(_4741, _4793, _4953);
            float _5035 = fma(_4745, _4793, _4957);
            float _5037 = fma(_4751, _4793, _4961);
            float _5039 = fma(_4757, _4793, _4965);
            float _5041 = fma(_4763, _4793, _4969);
            float _5043 = fma(_4767, _4793, _4973);
            float _5045 = fma(_4773, _4793, _4977);
            float _5047 = fma(_4779, _4793, _4981);
            float _5049 = fma(_4785, _4793, _4985);
            _2373 = _5001;
            _2375 = _4997;
            _2377 = _5029;
            _2379 = _5011;
            _2381 = _4995;
            _2383 = _5015;
            _2385 = _5031;
            _2387 = _5013;
            _2389 = _5017;
            _2391 = _5033;
            _2393 = _4999;
            _2395 = _5027;
            _2397 = _5045;
            _2399 = _4993;
            _2401 = _5043;
            _2403 = _5003;
            _2405 = _5005;
            _2407 = _5037;
            _2409 = _4987;
            _2411 = _4989;
            _2413 = _4991;
            _2415 = _5035;
            _2417 = _5047;
            _2419 = _5009;
            _2421 = _5019;
            _2423 = _5039;
            _2425 = _5049;
            _2427 = _5023;
            _2429 = _5025;
            _2431 = _5041;
            _2433 = _5007;
            _2435 = _5021;
        }
    }
    _2437 = false;
    float _5051 = _2373;
    float _5053 = _2375;
    float _5055 = _2377;
    float _5057 = _2379;
    float _5059 = _2381;
    float _5061 = _2383;
    float _5063 = _2385;
    float _5065 = _2387;
    float _5067 = _2389;
    float _5069 = _2391;
    float _5071 = _2393;
    float _5073 = _2395;
    float _5075 = _2397;
    float _5077 = _2399;
    float _5079 = _2401;
    float _5081 = _2403;
    float _5083 = _2405;
    float _5085 = _2407;
    float _5087 = _2409;
    float _5089 = _2411;
    float _5091 = _2413;
    float _5093 = _2415;
    float _5095 = _2417;
    float _5097 = _2419;
    float _5099 = _2421;
    float _5101 = _2423;
    float _5103 = _2425;
    float _5105 = _2427;
    float _5107 = _2429;
    float _5109 = _2431;
    float _5111 = _2433;
    float _5113 = _2435;
    float _5115 = _5051 * 0.511664927005767822265625;
    float _5117 = _5053 * 0.88622760772705078125;
    float _5119 = _5055 * 0.511664927005767822265625;
    float _5121 = _5057 * 0.511664927005767822265625;
    float _5123 = _5115 * _5115;
    float _5125 = _5059 * 0.88622760772705078125;
    float _5127 = _5061 * 0.511664927005767822265625;
    float _5129 = precise::max(_5117, 0.00999999977648258209228515625);
    float _5131 = fma(_5119, _5119, _5123);
    float _5133 = _5063 * 0.511664927005767822265625;
    float _5135 = _5121 * _5121;
    float _5137 = _5065 * 0.511664927005767822265625;
    float _5139 = precise::max(_5125, 0.00999999977648258209228515625);
    float _5141 = fma(_5127, _5127, _5131);
    float _5143 = 1.0 / _5129;
    float _5145 = _5067 * 0.511664927005767822265625;
    float _5147 = fma(_5133, _5133, _5135);
    float _5149 = _5069 * 0.511664927005767822265625;
    float _5151 = _5071 * 0.88622760772705078125;
    float _5153 = _5073 * 0.511664927005767822265625;
    float _5155 = 1.0 / _5139;
    float _5157 = _5137 * _5137;
    float _5159 = precise::max(_5151, 0.00999999977648258209228515625);
    float _5161 = fma(_1465, 1.9073486328125, 0.5);
    float _5163 = fma(_5149, _5149, _5157);
    float _5165 = sqrt(_5141);
    float _5167 = fma(_5145, _5145, _5147);
    float _5169 = fma(_5153, _5153, _5163);
    float _5171 = _1465 * 3.903682708740234375;
    float _5173 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5175 = _5173 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5177 = _5171 * _5075;
    float _5179 = sqrt(_5167);
    float _5181 = _5171 * _5077;
    float _5183 = fma(_5079, 0.88622701168060302734375, _5177);
    float _5185 = _5171 * _5081;
    float _5187 = _5171 * _5083;
    float _5189 = _5171 * _5085;
    float _5191 = fma(_5087, 0.88622701168060302734375, _5181);
    float _5193 = 1.0 / _5159;
    float _5195 = precise::max(_5165, 0.00999999977648258209228515625);
    float _5197 = fma(_5089, 0.88622701168060302734375, _5185);
    float _5199 = fma(_5091, 0.88622701168060302734375, _5187);
    float _5201 = fma(_5093, 0.88622701168060302734375, _5189);
    float _5203 = sqrt(_5169);
    float _5205 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5207 = _5205 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5209 = precise::max(_5179, 0.00999999977648258209228515625);
    int _5211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5213 = _5211 != 0;
    float _5215 = fma(_5161, _5207, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5217 = 1.0 / _5195;
    float _5219 = _5209 * _5143;
    float _5221 = precise::clamp(_5219, 0.0, 1.0);
    float _5223 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5225 = _5223 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5227 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5229 = _5227 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5231 = fma(_5161, _5225, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5233 = precise::max(_5203, 0.00999999977648258209228515625);
    float _5235 = 1.0 / _5209;
    float _5237 = fma(_5161, _5229, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5239 = _5231 * 0.715200006961822509765625;
    float _5241 = _5195 * _5155;
    float _5243 = precise::clamp(_5241, 0.0, 1.0);
    float _5245 = _5233 * _5193;
    float _5247 = precise::clamp(_5245, 0.0, 1.0);
    float _5249 = _5221 + 1.0;
    float _5251 = fma(_5215, 0.2125999927520751953125, _5239);
    float _5253 = _5119 * _5217;
    float _5255 = 1.0 / _5233;
    float _5257 = _5115 * _5217;
    float _5259 = fma(_5237, 0.072200000286102294921875, _5251);
    float _5261 = _5243 + 1.0;
    float _5263 = 1.0 / _5259;
    float _5265 = _5121 * _5235;
    float _5267 = _5127 * _5217;
    float _5269 = _5133 * _5235;
    float _5271 = _5145 * _5235;
    float _5273 = _1527 * _5265;
    float _5275 = _5137 * _5255;
    float _5277 = _1527 * _5257;
    float _5279 = _5149 * _5255;
    float _5281 = -_1511;
    float _5283 = fma(_5281, _5269, _5273);
    float _5285 = _1527 * _5275;
    float _5287 = -_1511;
    float _5289 = fma(_5287, _5253, _5277);
    float _5291 = _5153 * _5255;
    float _5293 = -_1525;
    float _5295 = fma(_5293, _5271, _5283);
    float _5297 = -_1511;
    float _5299 = fma(_5297, _5279, _5285);
    float _5301 = -_1525;
    float _5303 = fma(_5301, _5267, _5289);
    float _5305 = _5247 + 1.0;
    float _5307 = fma(_5295, 0.5, 0.5);
    float _5309 = -_1525;
    float _5311 = fma(_5309, _5291, _5299);
    float _5313 = fma(_5303, 0.5, 0.5);
    float _5315 = 1.0 / _5305;
    float _5317 = fma(_5311, 0.5, 0.5);
    float _5319 = _5263 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5321 = precise::clamp(_5319, 0.0, 1.0);
    float _5323 = _1525 * (-1.02332699298858642578125);
    float _5325 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5327 = _5325 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5329 = fma(_5321, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5331 = abs(_5313);
    float _5333 = log2(_5331);
    float _5335 = fma(_5161, _5175, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5337 = fma(_5323, _5095, _5183);
    float _5339 = fma(_5161, _5327, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5341 = fma(_5323, _5097, _5197);
    float _5343 = fma(_5323, _5099, _5199);
    float _5345 = fma(_5323, _5101, _5201);
    float _5347 = _5231 * _5329;
    float _5349 = abs(_5307);
    float _5351 = log2(_5349);
    float _5353 = _1511 * (-1.02332699298858642578125);
    float _5355 = fma(_5353, _5103, _5337);
    float _5357 = fma(_5353, _5105, _5341);
    float _5359 = fma(_5353, _5107, _5343);
    float _5361 = abs(_5317);
    float _5363 = log2(_5361);
    float _5365 = fma(_5353, _5109, _5345);
    float _5367 = precise::max(0.0, _5355);
    float _5369 = precise::max(0.0, _5357);
    float _5371 = precise::max(0.0, _5359);
    float _5373 = _5367 * 0.31830990314483642578125;
    float _5375 = precise::clamp(_5373, 0.0, 1.0);
    float _5377 = 1.0 / _5249;
    float _5379 = precise::max(0.0, _5365);
    float _5381 = _5369 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5383 = -_5375;
    float _5385 = _5383 + 1.0;
    float _5387 = _5371 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5389 = _5379 * 0.31830990314483642578125;
    float _5391 = precise::clamp(_5389, 0.0, 1.0);
    float _5393 = fma(_5385, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5375);
    float _5395 = 1.0 / _5261;
    float _5397 = fma(_5243, 2.0, 1.0);
    float _5399 = _5237 * _5329;
    float _5401 = precise::max(_5381, _5347);
    float _5403 = _5391 * 0.88622701168060302734375;
    float _5405 = _5397 * _5333;
    float _5407 = fma(_5221, 2.0, 1.0);
    float _5409 = precise::max(_5387, _5399);
    float _5411 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5401);
    float _5413 = _5407 * _5351;
    float _5415 = fma(_5247, 2.0, 1.0);
    float _5417 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5409);
    float _5419 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5421 = _5419 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5423 = _5415 * _5363;
    float _5425 = exp2(_5413);
    float _5427 = -_5243;
    float _5429 = _5427 + 1.0;
    float _5431 = fma(_5161, _5421, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5433 = fma(_5243, 2.0, 2.0);
    float _5435 = -_5221;
    float _5437 = _5435 + 1.0;
    float _5439 = fma(_5221, 2.0, 2.0);
    float _5441 = fma(_5323, _5111, _5191);
    float _5443 = _5429 * _5395;
    float _5445 = exp2(_5405);
    float _5447 = _5437 * _5377;
    float _5449 = fma(_5353, _5113, _5441);
    float _5451 = precise::max(0.0, _5449);
    float _5453 = exp2(_5423);
    float _5455 = fma(_5247, 2.0, 2.0);
    float _5457 = -_5247;
    float _5459 = _5457 + 1.0;
    float _5461 = _5439 * _5425;
    float _5463 = _5451 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5465 = _5459 * _5315;
    float _5467 = _5215 * _5329;
    float _5469 = _5433 * _5445;
    float _5471 = -_5461;
    float _5473 = _5471 + 1.0;
    float _5475 = -_5469;
    float _5477 = _5475 + 1.0;
    float _5479 = fma(_5447, _5473, _5461);
    float _5481 = precise::max(_5463, _5467);
    float _5483 = _5455 * _5453;
    float _5485 = fma(_5443, _5477, _5469);
    float _5487 = _5117 * _5479;
    float _5489 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5481);
    float _5491 = -_5483;
    float _5493 = _5491 + 1.0;
    float _5495 = _5125 * _5485;
    float _5497 = fma(_5465, _5493, _5483);
    float _5499 = _5495 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5501 = _5487 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5503 = _5151 * _5497;
    float _5505 = precise::max(_5499, _5339);
    float _5507 = _5503 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5509 = precise::max(_5501, _5431);
    float _5511 = fma(_5505, _5393, _5489);
    float _5513 = precise::max(_5507, _5335);
    float _5515 = fma(_5509, _5393, _5411);
    float _5517 = fma(_5513, _5393, _5417);
    bool _5519 = !_5213;
    float _5521;
    float _5523;
    float _5525;
    float _5527;
    float _5529;
    float _5531;
    float _5533;
    float _5535;
    float _5537;
    float _5539;
    int _5541;
    float _5543;
    float _5545;
    float _5547;
    float _5549;
    float _5551;
    float _5553;
    float _5555;
    int _5557;
    float _5559;
    int _5561;
    float _5563;
    int _5565;
    int _5567;
    int _5569;
    float _5571;
    float _5573;
    int _5575;
    float _5577;
    int _5579;
    int _5581;
    float _5583;
    if (!_5519)
    {
        _5521 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5523 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5525 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5527 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5529 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5531 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5533 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5535 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5537 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5539 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5543 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5545 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5547 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5549 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5551 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5553 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5555 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5559 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5563 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5571 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5573 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5577 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5583 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5585 = true;
    }
    else
    {
        float _5587 = fma(_1057, 6.2500002968590706586837768554688e-05, 0.5);
        float _5589 = fma(_1055, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14865 = float3(_5587, _5589, float(0));
        float3 _14867 = select(_14865, float3(0.0), isnan(_14865));
        float4 _5591 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14867.xy, uint(rint(_14867.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14867.xy, uint(rint(_14867.z)), level(0.0)).xyzw;
        float _5593 = _5591.x;
        float _5595 = _5591.y;
        float _5597 = _5591.z;
        float _5599 = _5591.w;
        float3 _14882 = float3(_5587, _5589, float(1));
        float3 _14884 = select(_14882, float3(0.0), isnan(_14882));
        float4 _5601 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14884.xy, uint(rint(_14884.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14884.xy, uint(rint(_14884.z)), level(0.0)).xyzw;
        float _5603 = _5601.x;
        float _5605 = _5601.y;
        float _5607 = _5601.z;
        float _5609 = _5601.w;
        float3 _14899 = float3(_5587, _5589, float(2));
        float3 _14901 = select(_14899, float3(0.0), isnan(_14899));
        float4 _5611 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14901.xy, uint(rint(_14901.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14901.xy, uint(rint(_14901.z)), level(0.0)).xyzw;
        float _5613 = _5611.x;
        float _5615 = _5611.y;
        float _5617 = _5611.z;
        float _5619 = _5611.w;
        float3 _14916 = float3(_5587, _5589, float(3));
        float3 _14918 = select(_14916, float3(0.0), isnan(_14916));
        float4 _5621 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14918.xy, uint(rint(_14918.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14918.xy, uint(rint(_14918.z)), level(0.0)).xyzw;
        float _5623 = _5621.x;
        float _5625 = _5621.y;
        float _5627 = _5621.z;
        float _5629 = _5621.w;
        float3 _14933 = float3(_5587, _5589, float(4));
        float3 _14935 = select(_14933, float3(0.0), isnan(_14933));
        float4 _5631 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14935.xy, uint(rint(_14935.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14935.xy, uint(rint(_14935.z)), level(0.0)).xyzw;
        float _5633 = _5631.x;
        float _5635 = _5631.y;
        float _5637 = _5631.z;
        float _5639 = _5631.w;
        float3 _14950 = float3(_5587, _5589, float(5));
        float3 _14952 = select(_14950, float3(0.0), isnan(_14950));
        float4 _5641 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14952.xy, uint(rint(_14952.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14952.xy, uint(rint(_14952.z)), level(0.0)).xyzw;
        float _5643 = _5641.x;
        float _5645 = _5641.y;
        float _5647 = _5641.z;
        float _5649 = _5641.w;
        float3 _14967 = float3(_5587, _5589, float(6));
        float3 _14969 = select(_14967, float3(0.0), isnan(_14967));
        float4 _5651 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14969.xy, uint(rint(_14969.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14969.xy, uint(rint(_14969.z)), level(0.0)).xyzw;
        float _5653 = _5651.x;
        float _5655 = _5651.y;
        float _5657 = _5651.z;
        float _5659 = _5651.w;
        float3 _14984 = float3(_5587, _5589, float(7));
        float3 _14986 = select(_14984, float3(0.0), isnan(_14984));
        float4 _5661 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14986.xy, uint(rint(_14986.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14986.xy, uint(rint(_14986.z)), level(0.0)).xyzw;
        float _5663 = _5661.x;
        float _5665 = _5661.y;
        float _5667 = _5661.z;
        float _5669 = _5661.w;
        _5521 = _5655;
        _5523 = _5665;
        _5525 = _5623;
        _5527 = _5625;
        _5529 = _5653;
        _5531 = _5663;
        _5533 = _5599;
        _5535 = _5657;
        _5537 = _5627;
        _5539 = _5667;
        _5541 = as_type<int>(_5629);
        _5543 = _5659;
        _5545 = _5593;
        _5547 = _5603;
        _5549 = _5605;
        _5551 = _5669;
        _5553 = _5595;
        _5555 = _5597;
        _5557 = as_type<int>(_5635);
        _5559 = _5609;
        _5561 = as_type<int>(_5633);
        _5563 = _5607;
        _5565 = as_type<int>(_5637);
        _5567 = as_type<int>(_5639);
        _5569 = as_type<int>(_5643);
        _5571 = _5615;
        _5573 = _5613;
        _5575 = as_type<int>(_5645);
        _5577 = _5617;
        _5579 = as_type<int>(_5649);
        _5581 = as_type<int>(_5647);
        _5583 = _5619;
    }
    _5585 = false;
    float _5671 = _5521;
    float _5673 = _5523;
    float _5675 = _5525;
    float _5677 = _5527;
    float _5679 = _5529;
    float _5681 = _5531;
    float _5683 = _5533;
    float _5685 = _5535;
    float _5687 = _5537;
    float _5689 = _5539;
    int _5691 = _5541;
    float _5693 = _5543;
    float _5695 = _5545;
    float _5697 = _5547;
    float _5699 = _5549;
    float _5701 = _5551;
    float _5703 = _5553;
    float _5705 = _5555;
    int _5707 = _5557;
    float _5709 = _5559;
    int _5711 = _5561;
    float _5713 = _5563;
    int _5715 = _5565;
    int _5717 = _5567;
    int _5719 = _5569;
    float _5721 = _5571;
    float _5723 = _5573;
    int _5725 = _5575;
    float _5727 = _5577;
    int _5729 = _5579;
    int _5731 = _5581;
    float _5733 = _5583;
    float _5735 = _5171 * _5671;
    float _5737 = _5171 * _5673;
    float _5739 = _5675 * 0.88622701168060302734375;
    float _5741 = _5677 * 0.88622701168060302734375;
    float _5743 = fma(_5679, 0.88622701168060302734375, _5735);
    float _5745 = fma(_5681, 0.88622701168060302734375, _5737);
    float _5747 = _5171 * _5683;
    out.m_54.x = _1431;
    out.m_54.y = _1435;
    float _5749 = fma(_5323, _5685, _5743);
    float _5751 = _5687 * 0.88622701168060302734375;
    float _5753 = fma(_5323, _5689, _5745);
    float _5755 = _5213 ? as_type<float>(_5691) : 0.0;
    float _5757 = fma(_5353, _5693, _5749);
    out.m_56.x = _1057;
    out.m_56.y = _1161;
    out.m_56.z = _1055;
    float _5759 = fma(_5695, 0.88622701168060302734375, _5747);
    float _5761 = _5171 * _5697;
    float _5763 = _5171 * _5699;
    float _5765 = _5213 ? _5739 : 0.0;
    float _5767 = fma(_5353, _5701, _5753);
    float _5769 = _5213 ? _5741 : 0.0;
    float _5771 = fma(_5703, 0.88622701168060302734375, _5761);
    float _5773 = precise::max(0.0, _5757);
    float _5775 = fma(_5705, 0.88622701168060302734375, _5763);
    float _5777 = _5213 ? as_type<float>(_5707) : 0.0;
    float _5779 = fma(_5323, _5709, _5771);
    float _5781 = _5213 ? as_type<float>(_5711) : 0.0;
    float _5783 = fma(_5171, _5755, _5765);
    float _5785 = _5213 ? _5751 : 0.0;
    float _5787 = fma(_5323, _5713, _5759);
    float _5789 = _5213 ? as_type<float>(_5715) : 0.0;
    float _5791 = fma(_5171, _5781, _5769);
    float _5793 = _5213 ? as_type<float>(_5717) : 0.0;
    float _5795 = _5773 * 0.31830990314483642578125;
    float _5797 = precise::clamp(_5795, 0.0, 1.0);
    float _5799 = _5213 ? as_type<float>(_5719) : 0.0;
    float _5801 = fma(_5171, _5777, _5785);
    float _5803 = precise::max(0.0, _5767);
    float _5805 = fma(_5353, _5721, _5787);
    float _5807 = fma(_5323, _5723, _5775);
    out.m_58.z = _736;
    float _5809 = _5797 * 0.88622701168060302734375;
    float _5811 = fma(_5323, _5793, _5791);
    float _5813 = fma(_5323, _5799, _5801);
    float _5815 = _5803 * 0.31830990314483642578125;
    float _5817 = precise::clamp(_5815, 0.0, 1.0);
    float _5819 = _5213 ? as_type<float>(_5725) : 0.0;
    float _5821 = fma(_5353, _5727, _5779);
    float _5823 = _5213 ? as_type<float>(_5729) : 0.0;
    float _5825 = fma(_5323, _5789, _5783);
    float _5827 = _5213 ? as_type<float>(_5731) : 0.0;
    float _5829 = fma(_5353, _5733, _5807);
    float _5831 = precise::max(0.0, _5805);
    float _5833 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    out.gl_Position.x = _1529;
    out.gl_Position.y = _1531;
    float _15254 = as_type<float>(_1537);
    out.gl_Position.z = _15254;
    out.gl_Position.w = _1533;
    float _5835 = -_5817;
    float _5837 = _5835 + 1.0;
    float _5839 = fma(_5353, _5819, _5825);
    float _5841 = fma(_5353, _5827, _5811);
    float _5843 = fma(_5353, _5823, _5813);
    float _5845 = fma(_5831, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5833);
    float _5847 = precise::max(0.0, _5821);
    float _5849 = fma(_5837, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5817);
    float _5851 = precise::max(0.0, _5829);
    float _5853 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5855 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5857 = precise::max(0.0, _5839);
    float _5859 = -_1511;
    float _5861 = (-0.0) + _5859;
    float _5863 = precise::max(0.0, _5841);
    float _5865 = sqrt(_1521);
    float _5867 = precise::max(0.0, _5843);
    float _5869 = _5849 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5871 = fma(_5847, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5853);
    float _5873 = fma(_5851, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5855);
    float _5875 = -_1525;
    float _5877 = (-0.0) + _5875;
    float _5879 = fma(_5857, _5869, _5845);
    float _5881 = fma(_5863, _5869, _5871);
    float _5883 = -_1179;
    float _5885 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _5887 = _5883 + _5885;
    float _5889 = fma(_5867, _5869, _5873);
    out.m_60.x = _5511;
    out.m_60.y = _5515;
    out.m_60.z = _5517;
    float _5891 = _5887 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_58.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_62.w = _1179;
    out.m_64.x = _5861;
    out.m_64.y = _1527;
    out.m_64.z = _5877;
    out.m_58.w = _5865;
    out.m_64.w = _5891;
    out.m_62.x = _5879;
    out.m_62.y = _5881;
    out.m_62.z = _5889;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5585 = false;
    bool _2437 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_51.x;
    float _80 = in.m_51.y;
    float _82 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _84 = _82 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _87 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _89 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _91 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _89;
    int _93 = _87 << 4;
    bool _97 = _93 == 0;
    bool _99 = _93 == 16;
    bool _101 = _93 == 32;
    bool _103 = _93 == 48;
    bool _105 = _93 == 64;
    float _107 = fma(_84, _80, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _109 = _93 == 80;
    bool _111 = _78 >= 0.5;
    bool _113 = isnan(_78);
    bool _115 = _111 || _113;
    bool _117 = isnan(0.5);
    bool _119 = _115 || _117;
    float _121 = as_type<float>(gl_BaseInstance);
    float _123 = _80;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_97)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _127 = _121;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _131 = _107 + _129;
    float _133 = fma(_80, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _135 = _93 == 96;
    float _137 = _131 * _131;
    float _139 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _141 = _133 + _139;
    float _143 = 0.0;
    float _145 = _127;
    if (_97)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _147 = _143;
    float _149 = fma(_91, _91, _137);
    float _151 = _147;
    if (_99)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _153 = _145;
    bool _155 = _93 == 112;
    float _157 = fma(_141, _141, _149);
    float _159 = _153;
    if (_99)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _161 = _151;
    float _163 = _161;
    if (_101)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _165 = _159;
    float _167 = rsqrt(_157);
    bool _169 = _93 == 128;
    float _171 = _165;
    if (_101)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _173 = _163;
    float _175 = _173;
    if (_103)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _177 = _171;
    bool _179 = _93 == 144;
    float _181 = _177;
    if (_103)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _183 = _175;
    float _185 = _183;
    if (_105)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _187 = _181;
    bool _189 = _93 == 160;
    float _191 = _187;
    if (_105)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _193 = _185;
    float _195 = _167 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _197 = _193;
    if (_109)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _199 = _191;
    bool _201 = _93 == 176;
    float _203 = _199;
    if (_109)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _205 = _197;
    float _207 = log2(_195);
    bool _209 = _93 == 192;
    float _211 = _205;
    if (_135)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _213 = _203;
    float _215 = _213;
    if (_135)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _217 = _211;
    float _219 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _221 = _215;
    bool _223 = _93 == 208;
    float _225 = _221;
    if (_155)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _227 = _219;
    float _229 = _227;
    if (_169)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _231 = _225;
    bool _233 = _93 == 224;
    float _235 = _207 + 1.2999999523162841796875;
    float _237 = _231;
    if (_169)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _239 = _229;
    float _241 = _239;
    if (_179)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _243 = _237;
    bool _245 = _93 == 240;
    float _247 = trunc(_235);
    int _249 = int(_247);
    float _251 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _253 = _241;
    float _255 = _253;
    if (_189)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _257 = _251;
    bool _259 = _93 == 256;
    float _261 = _257;
    if (_189)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _267 = _261;
    bool _269 = _93 == 272;
    float _271 = _267;
    if (_201)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _273 = _265;
    float _275 = _273;
    if (_209)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _277 = _271;
    int _279 = min(_249, 15);
    bool _281 = _93 == 288;
    float _283 = _277;
    if (_209)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _285 = _275;
    float _287 = float(_279);
    bool _289 = _93 == 304;
    int _291 = _279 << 4;
    int _293 = _291 + 4288;
    float _295 = _285;
    float _297 = as_type<float>(_293);
    if (_223)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _299 = _283;
    float _301 = _299;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _303 = _295;
    float _305 = -_287;
    float _307 = _305 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _309 = _303;
    if (_233)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _311 = _301;
    int _313 = _293 + 8;
    uint _316 = uint(int(uint(_313) >> uint(2)));
    uint _318 = uint(int(uint(int(_316)) >> uint(2)));
    int _320 = int(_316) & 3;
    float _322 = (*spvDescriptorSet0.vp_c14)._m0[int(_318)][_320];
    int _324 = int(_316) + 1;
    uint _326 = uint(int(uint(_324) >> uint(2)));
    int _328 = _324 & 3;
    float _330 = (*spvDescriptorSet0.vp_c14)._m0[int(_326)][_328];
    bool _332 = _93 == 320;
    float _334 = _307 + 1.0;
    float _336 = _311;
    if (_233)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _338 = _309;
    float _340 = _338;
    if (_245)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _342 = _336;
    bool _344 = _93 == 336;
    float _346 = exp2(_334);
    float _348 = _342;
    if (_245)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _350 = _340;
    float _352 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _354 = _348;
    bool _356 = _93 == 352;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_269)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _364 = _358;
    bool _366 = _93 == 368;
    float _368 = _364;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _370 = _362;
    float _372 = _370;
    if (_281)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _374 = _368;
    float _376 = 1.0 / _346;
    bool _378 = _93 == 384;
    float _380 = _374;
    if (_281)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _382 = _372;
    float _384 = _382;
    if (_289)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _386 = _380;
    bool _388 = _93 == 400;
    float _390 = _386;
    if (_289)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _392 = _384;
    bool _394 = _93 == 416;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _398 = _390;
    float _400 = _398;
    if (_332)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _402 = _396;
    float _404 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _406 = _400;
    bool _408 = _93 == 432;
    float _410 = _406;
    if (_344)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_356)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _416 = _410;
    bool _418 = _93 == 448;
    float _420 = _416;
    if (_356)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_366)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _426 = _420;
    bool _428 = _93 == 464;
    float _430 = _426;
    if (_366)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_378)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _436 = _430;
    bool _438 = _93 == 480;
    float _440 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _442 = _434;
    float _444 = _442;
    if (_388)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _446 = _440;
    bool _448 = _93 == 496;
    float _450 = _446;
    if (_388)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _452 = _444;
    float _454 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _456 = _450;
    bool _458 = _93 == 512;
    float _460 = _456;
    if (_394)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _462 = _454;
    bool _464 = _93 == 528;
    float _466 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _468 = _460;
    float _470 = _468;
    if (_408)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _472 = _466;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _476 = _470;
    bool _478 = _93 == 544;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _486 = _480;
    bool _488 = _93 == 560;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _496 = _490;
    bool _498 = _93 == 576;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_448)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _506 = _500;
    bool _508 = _93 == 592;
    float _510 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _512 = _504;
    float _514 = _512;
    if (_458)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _516 = _510;
    bool _518 = _93 == 608;
    float _520 = _516;
    if (_458)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _522 = _514;
    float _524 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _526 = _520;
    bool _528 = _93 == 624;
    float _530 = _526;
    if (_464)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _532 = _524;
    bool _534 = _93 == 640;
    float _536 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _538 = _530;
    float _540 = _538;
    if (_478)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _542 = _536;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _546 = _540;
    bool _548 = _93 == 656;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _556 = _550;
    bool _558 = _93 == 672;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _566 = _560;
    bool _568 = _93 == 688;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_518)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _576 = _570;
    bool _578 = _93 == 704;
    float _580 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _582 = _574;
    float _584 = _582;
    if (_528)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _586 = _580;
    bool _588 = _93 == 720;
    float _590 = _586;
    if (_528)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _592 = _584;
    float _594 = _592;
    if (_534)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _596 = _590;
    bool _598 = _93 == 736;
    float _600 = _596;
    if (_534)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _602 = _594;
    bool _604 = _93 == 752;
    float _606 = _602;
    if (_548)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _608 = _600;
    float _610 = _608;
    if (_558)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_568)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_578)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _620 = _618;
    float _622 = _620;
    if (_588)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _624 = _622;
    float _626 = _624;
    if (_598)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _628 = _626;
    float _630 = _628;
    if (_604)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _632 = _630;
    float _634 = _376 * _632;
    if (_548)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _636 = _606;
    float _638 = _636;
    if (_558)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _640 = _638;
    float _642 = _634 * _80;
    float _644 = _640;
    if (_568)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_578)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _650 = _648;
    float _652 = floor(_642);
    float _654 = _650;
    if (_588)
    {
        _654 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _656 = _654;
    float _658 = _656;
    if (_598)
    {
        _658 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _660 = _658;
    float _662 = _660;
    if (_604)
    {
        _662 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _664 = _662;
    float _666 = _346 * _664;
    float _668 = -_652;
    float _670 = _642 + _668;
    float _672 = _670 * 2.0;
    float _674 = -_670;
    float _676 = fma(_666, _674, _80);
    float _678 = floor(_672);
    float _680 = _666 * _678;
    float _682 = _680 * 0.5;
    float _684 = _682 + _676;
    float _686 = fma(_84, _684, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _688 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _692 = _686 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _696 = _688 + _694;
    float _698 = _692 * _692;
    float _700 = fma(_91, _91, _698);
    float _702 = fma(_696, _696, _700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _706 = sqrt(_702);
    int _708 = _704 + 76;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c6)._m0[int(_712)][_714];
    float _718 = -_330;
    float _720 = fma(_706, _322, _718);
    float _722 = precise::clamp(_720, 0.0, 1.0);
    uint _724 = uint(int(uint(_704) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c6)._m0[int(_726)][_728];
    float _732 = -_682;
    float _734 = fma(_732, _722, _684);
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _738 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _740 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _738;
    float _742 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _744 = _736 + _742;
    float _746 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _748 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _750 = _736 + _748;
    float _752 = abs(_740);
    float _754 = abs(_744);
    float _756 = precise::max(_752, _754);
    float _758 = _716 + 8.0;
    float _760 = _682;
    float _762 = _322;
    float _764 = _684;
    float _766 = _756;
    float _768 = _750;
    float _770 = _746;
    if (!_119)
    {
        float _772 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _760 = _772;
    }
    float _774 = _760;
    float _776 = _758 + _756;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _780 = _776 * _730;
    float _782 = _780 * 4.0;
    float _784 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _786 = _774;
    if (!_119)
    {
        float _788 = _774 + _778;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = precise::max(_782, 1.0);
    float _794 = _790;
    if (!_119)
    {
        float _796 = fma(_784, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _762 = _796;
    }
    float _798 = _762;
    float _800 = log2(_792);
    float _802 = _798;
    if (!_119)
    {
        float _804 = _798 + _778;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _808;
    float _812 = trunc(_800);
    int _814 = int(_812);
    float _816 = floor(_800);
    int _818 = min(_814, 4);
    int _820 = _818 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _822 = _820 << 4;
    float _824 = _816 + 1.0;
    float _826 = rint(_816);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    uint _834 = uint(int(uint(_822) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c6)._m0[int(_836)][_838];
    float _842 = rint(_824);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    uint _848 = clamp(_846, 0u, 65535u);
    int _850 = _822 + 16;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.vp_c6)._m0[int(_854)][_856];
    float _860 = fma(_750, _840, 0.5);
    float _862 = fma(_810, _840, 0.5);
    float _864 = fma(_750, _858, 0.5);
    float _866 = fma(_810, _858, 0.5);
    float _868 = _864;
    float _870 = _824;
    float _872 = _806;
    if (!_119)
    {
        float2 _7249 = float2(_806, _790);
        float4 _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7249, float2(0.0), isnan(_7249)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7249, float2(0.0), isnan(_7249)), level(0.0)).xyzw;
        float _877 = _875.x;
        float _879 = _875.y;
        float _881 = _875.z;
        float _883 = _875.w;
        _764 = _877;
        _766 = _879;
        _768 = _881;
        _297 = _883;
    }
    float _885 = _764;
    float _887 = _766;
    float _889 = _768;
    float _891 = _297;
    float3 _7279 = float3(_862, _860, float(int(_832)));
    float3 _7283 = select(_7279, float3(0.0), isnan(_7279));
    float3 _895 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7283.xy, uint(rint(_7283.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7283.xy, uint(rint(_7283.z)), level(0.0)).xyz;
    float _897 = _895.x;
    float _899 = _895.y;
    float _901 = _895.z;
    float3 _7298 = float3(_866, _864, float(int(_848)));
    float3 _7300 = select(_7298, float3(0.0), isnan(_7298));
    float3 _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7300.xy, uint(rint(_7300.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7300.xy, uint(rint(_7300.z)), level(0.0)).xyz;
    float _905 = _903.x;
    float _907 = _903.y;
    float _909 = _903.z;
    float _911 = (*spvDescriptorSet0.vp_c15)._m0[0].z + 1.953125;
    float _913 = _911;
    if (_119)
    {
        _123 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _915 = _123;
    float _917 = _736 + 1.953125;
    float _919 = 0.0;
    float _921 = _915;
    if (_119)
    {
        _919 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _923 = _919;
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (_119)
    {
        float _927 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _915, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _913 = _927;
    }
    float _929 = _913;
    if (_119)
    {
        float _931 = fma(_736, _915, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _921 = _931;
    }
    float _933 = _921;
    float _935 = fma(_917, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _937 = _933;
    if (_119)
    {
        float _939 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _746, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _868 = _939;
    }
    float _941 = _868;
    if (_119)
    {
        float _943 = fma(_929, _923, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _870 = _943;
    }
    float _945 = _870;
    float _947 = _945;
    if (_119)
    {
        float _949 = fma(_933, _923, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _937 = _949;
    }
    float _951 = _937;
    float _953 = fma(_925, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_119)
    {
        float _955 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _784, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _125 = _955;
    }
    float _957 = _125;
    if (_119)
    {
        float _959 = _945 + _778;
        _947 = _959;
    }
    float _961 = _947;
    if (_119)
    {
        float _963 = _951 + _778;
        _770 = _963;
    }
    float _965 = _770;
    float _967 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    if (_119)
    {
        float _969 = _778 + _941;
        _794 = _969;
    }
    float _971 = _794;
    float _973 = _953 + _778;
    float _975 = _885;
    float _977 = _887;
    float _979 = _889;
    float _981 = _891;
    if (_119)
    {
        float2 _7455 = float2(_961, _965);
        float4 _983 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7455, float2(0.0), isnan(_7455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7455, float2(0.0), isnan(_7455)), level(0.0)).xyzw;
        float _985 = _983.x;
        float _987 = _983.y;
        float _989 = _983.z;
        float _991 = _983.w;
        _975 = _985;
        _977 = _987;
        _979 = _989;
        _981 = _991;
    }
    float _993 = _975;
    float _995 = _977;
    float _997 = _979;
    float _999 = _981;
    float _1001 = _967 + _778;
    if (_119)
    {
        float _1003 = _778 + _957;
        _872 = _1003;
    }
    float _1005 = _872;
    float2 _7491 = float2(_973, _971);
    float _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7491, float2(0.0), isnan(_7491)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7491, float2(0.0), isnan(_7491)), level(0.0)).x;
    float2 _7499 = float2(_1005, _1001);
    float _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7499, float2(0.0), isnan(_7499)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7499, float2(0.0), isnan(_7499)), level(0.0)).x;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _1013 = _736 * 0.00012500000593718141317367553710938;
    float _1015 = -_816;
    float _1017 = _800 + _1015;
    float _1019 = abs(_1011);
    float _1021 = abs(_1013);
    float _1023 = precise::max(_1019, _1021);
    float _1025 = fma(_1017, 5.42372894287109375, -4.338983058929443359375);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_1023, 20.0, -19.0);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = -_1031;
    float _1035 = _1033 + 1.0;
    float _1037 = -_901;
    float _1039 = _1037 + _909;
    float _1041 = -_897;
    float _1043 = _1041 + _905;
    float _1045 = -_899;
    float _1047 = _1045 + _907;
    float _1049 = fma(_1027, _1039, _901);
    float _1051 = fma(_1027, _1043, _897);
    float _1053 = fma(_1027, _1047, _899);
    float _1055 = fma(_1035, _1049, _736);
    float _1057 = fma(_1035, _1051, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _1059 = fma(_736, 0.008000000379979610443115234375, 64.0);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1063 = _1055 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1067 = _1057 + _1065;
    float _1069 = precise::max(0.0, _1059);
    float _1071 = _1063 * _1063;
    float _1073 = precise::min(_1069, 127.0);
    float _1075 = fma(_1067, _1067, _1071);
    float _1077 = fma(0.008000000379979610443115234375, (*spvDescriptorSet0.vp_c15)._m0[0].z, 64.0);
    float _1079 = fma(_993, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1081 = trunc(_1073);
    int _1083 = int(_1081);
    bool _1085 = _1075 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1087 = isnan(_1075);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1093 = _1089 || _1091;
    float _1095 = precise::max(0.0, _1077);
    float _1097 = fma(_1035, _1053, _1079);
    float _1099 = precise::min(_1095, 127.0);
    float _1101 = _1063 * _1063;
    float _1103 = trunc(_1099);
    int _1105 = int(_1103);
    float _1107 = fma(_1067, _1067, _1101);
    float _1109 = 64.0;
    float _1111 = _1101;
    float _1113 = _1069;
    float _1115 = _993;
    float _1117 = _1097;
    float _1119 = _1075;
    if (!_1093)
    {
        _1109 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_1093)
    {
        float _1125 = -_1075;
        float _1127 = _1125 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1111 = _1127;
    }
    float _1129 = _1111;
    float _1131 = _1129;
    if (!_1093)
    {
        float _1133 = _1075 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1113 = _1133;
    }
    float _1135 = _1113;
    if (!_1093)
    {
        float _1137 = -_1129;
        float _1139 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = sqrt(_1107);
    float _1145 = _1141;
    if (!_1093)
    {
        float _1147 = precise::min(_1097, _1141);
        _1145 = _1147;
    }
    float _1149 = _1145;
    if (!_1093)
    {
        float _1151 = -_1149;
        float _1153 = _1097 + _1151;
        _1115 = _1153;
    }
    float _1155 = _1115;
    float _1157 = _1155;
    if (!_1093)
    {
        float _1159 = fma(_1135, _1155, _1149);
        _1117 = _1159;
    }
    float _1161 = _1117;
    int _1163 = _1083 << 7;
    int _1165 = _1163 + _1105;
    bool _1167 = _1143 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1169 = _1161 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    int _1171 = _1165 << 4;
    float _1173 = fma(_1057, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1169);
    int _1175 = _1171 + 8;
    float _1177 = fma(_1055, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1173);
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1181 = as_type<float>(_1165);
    if (!_1167)
    {
        _1123 = _1057;
    }
    float _1183 = _1123;
    float _1185 = _1183;
    if (!_1167)
    {
        _1157 = _1055;
    }
    float _1187 = _1157;
    float _1189 = _1187;
    if (!_1167)
    {
        _1119 = _1161;
    }
    float _1191 = _1119;
    float _1193 = _1191;
    if (!_1167)
    {
        _1181 = _1179;
    }
    float _1195 = _1181;
    bool _1197 = !_1167;
    float _1199 = _1195;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1205 = _1143 + _1203;
        float _1207 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1209 = _1205 * _1201;
        float _1211 = rsqrt(_1107);
        float _1213 = _1209 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1221, _1207, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1227 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1229 = _1211 * _1225;
        float _1231 = fma(_1217, _1161, _1227);
        float _1233 = fma(_1067, _1229, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1235 = _1231 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1237 = fma(_1063, _1229, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1239 = fma(_1233, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1235);
        float _1241 = fma(_1237, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1239);
        float _1243 = _1241 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1193 = _1231;
        _1185 = _1233;
        _1189 = _1237;
        _1199 = _1243;
    }
    float _1245 = _1193;
    float _1247 = _1185;
    float _1249 = _1189;
    float _1251 = _1199;
    uint _1253 = uint(int(uint(_1175) >> uint(2)));
    float _1255 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1253)]);
    float _1257 = floor(_1099);
    int _1259 = _1171 + 12;
    uint _1261 = uint(int(uint(_1171) >> uint(2)));
    float _1263 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1261)]);
    uint _1265 = uint(int(uint(_1259) >> uint(2)));
    float _1267 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1265)]);
    float _1269 = floor(_1073);
    float _1271 = -_1257;
    float _1273 = _1099 + _1271;
    float _1275 = -_1269;
    float _1277 = _1073 + _1275;
    int _1279 = _1171 + 4;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    float _1283 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1281)]);
    float _1285 = _1255 + _1273;
    float _1287 = precise::clamp(_1285, 0.0, 1.0);
    float _1289 = _1255 + _1277;
    float _1291 = precise::clamp(_1289, 0.0, 1.0);
    bool _1293 = _1287 >= 1.0;
    bool _1295 = isnan(_1287);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(1.0);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    bool _1305 = _1291 >= 1.0;
    bool _1307 = isnan(_1291);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(1.0);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = trunc(_1303);
    int _1319 = int(_1317);
    float _1321 = trunc(_1315);
    int _1323 = int(_1321);
    int _1325 = _1105 + _1319;
    int _1327 = _1083 << 7;
    int _1329 = _1327 + _1325;
    int _1331 = _1083 + _1323;
    int _1333 = _1331 << 7;
    int _1335 = _1333 + _1105;
    int _1337 = _1331 << 7;
    int _1339 = _1337 + _1325;
    int _1341 = _1335 << 4;
    int _1343 = _1339 << 4;
    int _1345 = _1329 << 4;
    uint _1347 = uint(int(uint(_1341) >> uint(2)));
    float _1349 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1347)]);
    int _1351 = _1341 + 12;
    int _1353 = _1343 + 12;
    uint _1355 = uint(int(uint(_1343) >> uint(2)));
    float _1357 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1355)]);
    int _1359 = _1345 + 12;
    uint _1361 = uint(int(uint(_1351) >> uint(2)));
    float _1363 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1361)]);
    uint _1365 = uint(int(uint(_1353) >> uint(2)));
    float _1367 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1365)]);
    uint _1369 = uint(int(uint(_1359) >> uint(2)));
    float _1371 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1369)]);
    uint _1373 = uint(int(uint(_1345) >> uint(2)));
    float _1375 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1373)]);
    float _1377 = fma(_1007, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1379 = fma(_1009, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1381 = -_1079;
    float _1383 = _1381 + _1377;
    float _1385 = -_1079;
    float _1387 = _1385 + _1379;
    float _1389 = floor(_1287);
    float _1391 = fma(_999, 255.99609375, 7.629510946571826934814453125e-06);
    float _1393 = floor(_1291);
    float _1395 = _1267 * _1273;
    float _1397 = _1383 * 1.953125;
    float _1399 = _1283 * _1273;
    float _1401 = _1283 * _1277;
    float _1403 = _1387 * 1.953125;
    float _1405 = -_1389;
    float _1407 = _1287 + _1405;
    float _1409 = _1267 * _1277;
    float _1411 = floor(_1399);
    float _1413 = _1267 * _1407;
    float _1415 = -_1393;
    float _1417 = _1291 + _1415;
    float _1419 = floor(_1401);
    float _1421 = _1267 * _1417;
    float _1423 = floor(_1409);
    float _1425 = floor(_1395);
    float _1427 = _1411 + _1419;
    float _1429 = floor(_1421);
    float _1431 = fma(_995, 200.0, -100.0);
    float _1433 = floor(_1413);
    float _1435 = fma(_997, 200.0, -100.0);
    float _1437 = 1.0 / _1267;
    float _1439 = _1245 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1441 = _1245 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1443 = fma(_1397, _1397, 14.55191516876220703125);
    float _1445 = floor(_1391);
    float _1447 = fma(_1247, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1439);
    float _1449 = fma(_1267, _1423, _1425);
    float _1451 = fma(_1247, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1441);
    float _1453 = fma(_1403, _1403, _1443);
    float _1455 = trunc(_1427);
    int _1457 = int(_1455);
    float _1459 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1451);
    float _1461 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1447);
    float _1463 = _1459 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1465 = rsqrt(_1453);
    float _1467 = -_1445;
    float _1469 = _1391 + _1467;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1475 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1477 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1479 = trunc(_1449);
    int _1481 = int(_1479);
    int _1483 = _1457 & 1;
    bool _1485 = _1483 != 0;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    bool _1489 = _1469 > 0.499000012874603271484375;
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1473);
    float _1493 = -_1411;
    float _1495 = _1399 + _1493;
    float _1497 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1475);
    float _1499 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1477);
    float _1501 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1487);
    float _1503 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1491);
    float _1505 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1497);
    float _1507 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1499);
    float _1509 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1501);
    float _1511 = _1397 * _1465;
    float _1513 = _1435 * _1435;
    float _1515 = _1503 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1517 = -_1419;
    float _1519 = _1401 + _1517;
    float _1521 = fma(_1431, _1431, _1513);
    int _1523 = as_type<int>(_1263) + _1481;
    float _1525 = _1403 * _1465;
    float _1527 = _1465 * 3.814697265625;
    float _1529 = _1505 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1531 = _1507 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1533 = _1509 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1535 = !_1489;
    int _1537 = _1535 ? as_type<int>(_1515) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    float _1539 = fma(_1363, _1429, _1425);
    float _1541 = _1363 * _1437;
    float _1543 = fma(_1429, _1367, _1433);
    float _1545 = _1367 * _1437;
    float _1547 = fma(_1423, _1371, _1433);
    float _1549 = _1371 * _1437;
    float _1551 = _1545 * _1543;
    float _1553 = _1541 * _1539;
    float _1555 = _1549 * _1547;
    float _1557 = trunc(_1553);
    int _1559 = int(_1557);
    float _1561 = trunc(_1555);
    int _1563 = int(_1561);
    float _1565 = trunc(_1551);
    int _1567 = int(_1565);
    int _1569 = as_type<int>(_1349) + _1559;
    int _1571 = as_type<int>(_1375) + _1563;
    int _1573 = as_type<int>(_1357) + _1567;
    float _2373;
    float _2375;
    float _2377;
    float _2379;
    float _2381;
    float _2383;
    float _2385;
    float _2387;
    float _2389;
    float _2391;
    float _2393;
    float _2395;
    float _2397;
    float _2399;
    float _2401;
    float _2403;
    float _2405;
    float _2407;
    float _2409;
    float _2411;
    float _2413;
    float _2415;
    float _2417;
    float _2419;
    float _2421;
    float _2423;
    float _2425;
    float _2427;
    float _2429;
    float _2431;
    float _2433;
    float _2435;
    if (!_1485)
    {
        float _1575 = fma(_1519, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1577 = fma(_1495, -0.707106769084930419921875, _1575);
        bool _1579 = _1577 >= 0.0;
        bool _1581 = !_1579;
        if (!_1581)
        {
            int _1583 = _1571 * 656;
            int _1585 = _1583 + 262144;
            int _1587 = _1583 + 262192;
            int _1589 = _1583 + 262160;
            uint _1591 = uint(int(uint(_1585) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1591)];
            float _1593 = as_type<float>(_dmw0.x);
            int _1595 = _1585 + 4;
            uint _1597 = uint(int(uint(_1595) >> uint(2)));
            float _1599 = as_type<float>(_dmw0.y);
            int _1601 = _1585 + 8;
            uint _1603 = uint(int(uint(_1601) >> uint(2)));
            float _1605 = as_type<float>(_dmw0.z);
            int _1607 = _1585 + 12;
            uint _1609 = uint(int(uint(_1607) >> uint(2)));
            float _1611 = as_type<float>(_dmw0.w);
            int _1613 = _1583 + 262208;
            uint _1615 = uint(int(uint(_1587) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1615)];
            float _1617 = as_type<float>(_dmw3.x);
            int _1619 = _1587 + 4;
            uint _1621 = uint(int(uint(_1619) >> uint(2)));
            float _1623 = as_type<float>(_dmw3.y);
            int _1625 = _1587 + 8;
            uint _1627 = uint(int(uint(_1625) >> uint(2)));
            float _1629 = as_type<float>(_dmw3.z);
            int _1631 = _1587 + 12;
            uint _1633 = uint(int(uint(_1631) >> uint(2)));
            float _1635 = as_type<float>(_dmw3.w);
            int _1637 = _1583 + 262224;
            int _1639 = _1583 + 262240;
            uint _1641 = uint(int(uint(_1589) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1641)];
            float _1643 = as_type<float>(_dmw1.x);
            int _1645 = _1589 + 4;
            uint _1647 = uint(int(uint(_1645) >> uint(2)));
            float _1649 = as_type<float>(_dmw1.y);
            int _1651 = _1589 + 8;
            uint _1653 = uint(int(uint(_1651) >> uint(2)));
            float _1655 = as_type<float>(_dmw1.z);
            int _1657 = _1589 + 12;
            uint _1659 = uint(int(uint(_1657) >> uint(2)));
            float _1661 = as_type<float>(_dmw1.w);
            int _1663 = _1583 + 262176;
            int _1665 = _1523 * 656;
            int _1667 = _1583 + 262256;
            uint _1669 = uint(int(uint(_1613) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1669)];
            float _1671 = as_type<float>(_dmw4.x);
            int _1673 = _1613 + 4;
            uint _1675 = uint(int(uint(_1673) >> uint(2)));
            float _1677 = as_type<float>(_dmw4.y);
            int _1679 = _1613 + 8;
            uint _1681 = uint(int(uint(_1679) >> uint(2)));
            float _1683 = as_type<float>(_dmw4.z);
            int _1685 = _1613 + 12;
            uint _1687 = uint(int(uint(_1685) >> uint(2)));
            float _1689 = as_type<float>(_dmw4.w);
            uint _1691 = uint(int(uint(_1637) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1691)];
            float _1693 = as_type<float>(_dmw5.x);
            int _1695 = _1637 + 4;
            uint _1697 = uint(int(uint(_1695) >> uint(2)));
            float _1699 = as_type<float>(_dmw5.y);
            int _1701 = _1637 + 8;
            uint _1703 = uint(int(uint(_1701) >> uint(2)));
            float _1705 = as_type<float>(_dmw5.z);
            int _1707 = _1637 + 12;
            uint _1709 = uint(int(uint(_1707) >> uint(2)));
            float _1711 = as_type<float>(_dmw5.w);
            uint _1713 = uint(int(uint(_1639) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1713)];
            float _1715 = as_type<float>(_dmw6.x);
            int _1717 = _1639 + 4;
            uint _1719 = uint(int(uint(_1717) >> uint(2)));
            float _1721 = as_type<float>(_dmw6.y);
            int _1723 = _1639 + 8;
            uint _1725 = uint(int(uint(_1723) >> uint(2)));
            float _1727 = as_type<float>(_dmw6.z);
            int _1729 = _1639 + 12;
            uint _1731 = uint(int(uint(_1729) >> uint(2)));
            float _1733 = as_type<float>(_dmw6.w);
            int _1735 = _1569 * 656;
            uint _1737 = uint(int(uint(_1663) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1737)];
            float _1739 = as_type<float>(_dmw2.x);
            int _1741 = _1663 + 4;
            uint _1743 = uint(int(uint(_1741) >> uint(2)));
            float _1745 = as_type<float>(_dmw2.y);
            int _1747 = _1663 + 8;
            uint _1749 = uint(int(uint(_1747) >> uint(2)));
            float _1751 = as_type<float>(_dmw2.z);
            int _1753 = _1663 + 12;
            uint _1755 = uint(int(uint(_1753) >> uint(2)));
            float _1757 = as_type<float>(_dmw2.w);
            int _1759 = _1665 + 262144;
            int _1761 = _1665 + 262192;
            uint _1763 = uint(int(uint(_1667) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1763)];
            float _1765 = as_type<float>(_dmw7.x);
            int _1767 = _1667 + 4;
            uint _1769 = uint(int(uint(_1767) >> uint(2)));
            float _1771 = as_type<float>(_dmw7.y);
            int _1773 = _1667 + 8;
            uint _1775 = uint(int(uint(_1773) >> uint(2)));
            float _1777 = as_type<float>(_dmw7.z);
            int _1779 = _1667 + 12;
            uint _1781 = uint(int(uint(_1779) >> uint(2)));
            float _1783 = as_type<float>(_dmw7.w);
            int _1785 = _1665 + 262160;
            int _1787 = _1665 + 262208;
            uint _1789 = uint(int(uint(_1759) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1789)];
            float _1791 = as_type<float>(_dmw8.x);
            int _1793 = _1759 + 4;
            uint _1795 = uint(int(uint(_1793) >> uint(2)));
            float _1797 = as_type<float>(_dmw8.y);
            int _1799 = _1759 + 8;
            uint _1801 = uint(int(uint(_1799) >> uint(2)));
            float _1803 = as_type<float>(_dmw8.z);
            int _1805 = _1759 + 12;
            uint _1807 = uint(int(uint(_1805) >> uint(2)));
            float _1809 = as_type<float>(_dmw8.w);
            int _1811 = _1665 + 262176;
            int _1813 = _1665 + 262224;
            uint _1815 = uint(int(uint(_1761) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1815)];
            float _1817 = as_type<float>(_dmw11.x);
            int _1819 = _1761 + 4;
            uint _1821 = uint(int(uint(_1819) >> uint(2)));
            float _1823 = as_type<float>(_dmw11.y);
            int _1825 = _1761 + 8;
            uint _1827 = uint(int(uint(_1825) >> uint(2)));
            float _1829 = as_type<float>(_dmw11.z);
            int _1831 = _1761 + 12;
            uint _1833 = uint(int(uint(_1831) >> uint(2)));
            float _1835 = as_type<float>(_dmw11.w);
            int _1837 = _1665 + 262240;
            int _1839 = _1665 + 262256;
            uint _1841 = uint(int(uint(_1785) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1841)];
            float _1843 = as_type<float>(_dmw9.x);
            int _1845 = _1785 + 4;
            uint _1847 = uint(int(uint(_1845) >> uint(2)));
            float _1849 = as_type<float>(_dmw9.y);
            int _1851 = _1785 + 8;
            uint _1853 = uint(int(uint(_1851) >> uint(2)));
            float _1855 = as_type<float>(_dmw9.z);
            int _1857 = _1785 + 12;
            uint _1859 = uint(int(uint(_1857) >> uint(2)));
            float _1861 = as_type<float>(_dmw9.w);
            int _1863 = _1735 + 262144;
            int _1865 = _1735 + 262192;
            uint _1867 = uint(int(uint(_1787) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1867)];
            float _1869 = as_type<float>(_dmw12.x);
            int _1871 = _1787 + 4;
            uint _1873 = uint(int(uint(_1871) >> uint(2)));
            float _1875 = as_type<float>(_dmw12.y);
            int _1877 = _1787 + 8;
            uint _1879 = uint(int(uint(_1877) >> uint(2)));
            float _1881 = as_type<float>(_dmw12.z);
            int _1883 = _1787 + 12;
            uint _1885 = uint(int(uint(_1883) >> uint(2)));
            float _1887 = as_type<float>(_dmw12.w);
            int _1889 = _1735 + 262160;
            int _1891 = _1735 + 262208;
            uint _1893 = uint(int(uint(_1811) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1893)];
            float _1895 = as_type<float>(_dmw10.x);
            int _1897 = _1811 + 4;
            uint _1899 = uint(int(uint(_1897) >> uint(2)));
            float _1901 = as_type<float>(_dmw10.y);
            int _1903 = _1811 + 8;
            uint _1905 = uint(int(uint(_1903) >> uint(2)));
            float _1907 = as_type<float>(_dmw10.z);
            int _1909 = _1811 + 12;
            uint _1911 = uint(int(uint(_1909) >> uint(2)));
            float _1913 = as_type<float>(_dmw10.w);
            int _1915 = _1735 + 262176;
            int _1917 = _1735 + 262224;
            uint _1919 = uint(int(uint(_1813) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1919)];
            float _1921 = as_type<float>(_dmw13.x);
            int _1923 = _1813 + 4;
            uint _1925 = uint(int(uint(_1923) >> uint(2)));
            float _1927 = as_type<float>(_dmw13.y);
            int _1929 = _1813 + 8;
            uint _1931 = uint(int(uint(_1929) >> uint(2)));
            float _1933 = as_type<float>(_dmw13.z);
            int _1935 = _1813 + 12;
            uint _1937 = uint(int(uint(_1935) >> uint(2)));
            float _1939 = as_type<float>(_dmw13.w);
            int _1941 = _1735 + 262240;
            int _1943 = _1735 + 262256;
            uint _1945 = uint(int(uint(_1837) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1945)];
            float _1947 = as_type<float>(_dmw14.x);
            int _1949 = _1837 + 4;
            uint _1951 = uint(int(uint(_1949) >> uint(2)));
            float _1953 = as_type<float>(_dmw14.y);
            int _1955 = _1837 + 8;
            uint _1957 = uint(int(uint(_1955) >> uint(2)));
            float _1959 = as_type<float>(_dmw14.z);
            int _1961 = _1837 + 12;
            uint _1963 = uint(int(uint(_1961) >> uint(2)));
            float _1965 = as_type<float>(_dmw14.w);
            uint _1967 = uint(int(uint(_1839) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1967)];
            float _1969 = as_type<float>(_dmw15.x);
            int _1971 = _1839 + 4;
            uint _1973 = uint(int(uint(_1971) >> uint(2)));
            float _1975 = as_type<float>(_dmw15.y);
            int _1977 = _1839 + 8;
            uint _1979 = uint(int(uint(_1977) >> uint(2)));
            float _1981 = as_type<float>(_dmw15.z);
            int _1983 = _1839 + 12;
            uint _1985 = uint(int(uint(_1983) >> uint(2)));
            float _1987 = as_type<float>(_dmw15.w);
            uint _1989 = uint(int(uint(_1863) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1989)];
            float _1991 = as_type<float>(_dmw16.x);
            int _1993 = _1863 + 4;
            uint _1995 = uint(int(uint(_1993) >> uint(2)));
            float _1997 = as_type<float>(_dmw16.y);
            int _1999 = _1863 + 8;
            uint _2001 = uint(int(uint(_1999) >> uint(2)));
            float _2003 = as_type<float>(_dmw16.z);
            int _2005 = _1863 + 12;
            uint _2007 = uint(int(uint(_2005) >> uint(2)));
            float _2009 = as_type<float>(_dmw16.w);
            uint _2011 = uint(int(uint(_1865) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2011)];
            float _2013 = as_type<float>(_dmw19.x);
            int _2015 = _1865 + 4;
            uint _2017 = uint(int(uint(_2015) >> uint(2)));
            float _2019 = as_type<float>(_dmw19.y);
            int _2021 = _1865 + 8;
            uint _2023 = uint(int(uint(_2021) >> uint(2)));
            float _2025 = as_type<float>(_dmw19.z);
            int _2027 = _1865 + 12;
            uint _2029 = uint(int(uint(_2027) >> uint(2)));
            float _2031 = as_type<float>(_dmw19.w);
            uint _2033 = uint(int(uint(_1889) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2033)];
            float _2035 = as_type<float>(_dmw17.x);
            int _2037 = _1889 + 4;
            uint _2039 = uint(int(uint(_2037) >> uint(2)));
            float _2041 = as_type<float>(_dmw17.y);
            int _2043 = _1889 + 8;
            uint _2045 = uint(int(uint(_2043) >> uint(2)));
            float _2047 = as_type<float>(_dmw17.z);
            int _2049 = _1889 + 12;
            uint _2051 = uint(int(uint(_2049) >> uint(2)));
            float _2053 = as_type<float>(_dmw17.w);
            uint _2055 = uint(int(uint(_1891) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2055)];
            float _2057 = as_type<float>(_dmw20.x);
            int _2059 = _1891 + 4;
            uint _2061 = uint(int(uint(_2059) >> uint(2)));
            float _2063 = as_type<float>(_dmw20.y);
            int _2065 = _1891 + 8;
            uint _2067 = uint(int(uint(_2065) >> uint(2)));
            float _2069 = as_type<float>(_dmw20.z);
            int _2071 = _1891 + 12;
            uint _2073 = uint(int(uint(_2071) >> uint(2)));
            float _2075 = as_type<float>(_dmw20.w);
            uint _2077 = uint(int(uint(_1915) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2077)];
            float _2079 = as_type<float>(_dmw18.x);
            int _2081 = _1915 + 4;
            uint _2083 = uint(int(uint(_2081) >> uint(2)));
            float _2085 = as_type<float>(_dmw18.y);
            int _2087 = _1915 + 8;
            uint _2089 = uint(int(uint(_2087) >> uint(2)));
            float _2091 = as_type<float>(_dmw18.z);
            int _2093 = _1915 + 12;
            uint _2095 = uint(int(uint(_2093) >> uint(2)));
            float _2097 = as_type<float>(_dmw18.w);
            uint _2099 = uint(int(uint(_1917) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2099)];
            float _2101 = as_type<float>(_dmw21.x);
            int _2103 = _1917 + 4;
            uint _2105 = uint(int(uint(_2103) >> uint(2)));
            float _2107 = as_type<float>(_dmw21.y);
            int _2109 = _1917 + 8;
            uint _2111 = uint(int(uint(_2109) >> uint(2)));
            float _2113 = as_type<float>(_dmw21.z);
            int _2115 = _1917 + 12;
            uint _2117 = uint(int(uint(_2115) >> uint(2)));
            float _2119 = as_type<float>(_dmw21.w);
            uint _2121 = uint(int(uint(_1941) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2121)];
            float _2123 = as_type<float>(_dmw22.x);
            int _2125 = _1941 + 4;
            uint _2127 = uint(int(uint(_2125) >> uint(2)));
            float _2129 = as_type<float>(_dmw22.y);
            int _2131 = _1941 + 8;
            uint _2133 = uint(int(uint(_2131) >> uint(2)));
            float _2135 = as_type<float>(_dmw22.z);
            int _2137 = _1941 + 12;
            uint _2139 = uint(int(uint(_2137) >> uint(2)));
            float _2141 = as_type<float>(_dmw22.w);
            uint _2143 = uint(int(uint(_1943) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2143)];
            float _2145 = as_type<float>(_dmw23.x);
            int _2147 = _1943 + 4;
            uint _2149 = uint(int(uint(_2147) >> uint(2)));
            float _2151 = as_type<float>(_dmw23.y);
            int _2153 = _1943 + 8;
            uint _2155 = uint(int(uint(_2153) >> uint(2)));
            float _2157 = as_type<float>(_dmw23.z);
            int _2159 = _1943 + 12;
            uint _2161 = uint(int(uint(_2159) >> uint(2)));
            float _2163 = as_type<float>(_dmw23.w);
            float _2165 = _1519 + (-1.0);
            float _2167 = -_1495;
            float _2169 = -_2165;
            float _2171 = _2167 + _2169;
            float _2173 = -_2171;
            float _2175 = _2173 + 1.0;
            float _2177 = _1495 * _1593;
            float _2179 = _1495 * _1599;
            float _2181 = _1495 * _1605;
            float _2183 = _1495 * _1611;
            float _2185 = _1495 * _1617;
            float _2187 = _1495 * _1623;
            float _2189 = _1495 * _1629;
            float _2191 = _1495 * _1635;
            float _2193 = _1495 * _1643;
            float _2195 = _1495 * _1649;
            float _2197 = _1495 * _1655;
            float _2199 = _1495 * _1661;
            float _2201 = _1495 * _1671;
            float _2203 = _1495 * _1677;
            float _2205 = _1495 * _1683;
            float _2207 = _1495 * _1699;
            float _2209 = _1495 * _1705;
            float _2211 = _1495 * _1711;
            float _2213 = _1495 * _1689;
            float _2215 = _1495 * _1715;
            float _2217 = _1495 * _1721;
            float _2219 = _1495 * _1727;
            float _2221 = _1495 * _1739;
            float _2223 = _1495 * _1745;
            float _2225 = _1495 * _1751;
            float _2227 = _1495 * _1733;
            float _2229 = _1495 * _1757;
            float _2231 = _1495 * _1765;
            float _2233 = _1495 * _1693;
            float _2235 = _1495 * _1771;
            float _2237 = _1495 * _1777;
            float _2239 = -_1495;
            float _2241 = _2239 + _2175;
            float _2243 = _1495 * _1783;
            float _2245 = fma(_2171, _1791, _2177);
            float _2247 = fma(_2171, _1797, _2179);
            float _2249 = fma(_2171, _1803, _2181);
            float _2251 = fma(_2171, _1809, _2183);
            float _2253 = fma(_2171, _1817, _2185);
            float _2255 = fma(_2171, _1823, _2187);
            float _2257 = fma(_2171, _1829, _2189);
            float _2259 = fma(_2171, _1835, _2191);
            float _2261 = fma(_2171, _1843, _2193);
            float _2263 = fma(_2171, _1849, _2195);
            float _2265 = fma(_2171, _1855, _2197);
            float _2267 = fma(_2171, _1861, _2199);
            float _2269 = fma(_2171, _1869, _2201);
            float _2271 = fma(_2171, _1875, _2203);
            float _2273 = fma(_2171, _1881, _2205);
            float _2275 = fma(_2171, _1887, _2213);
            float _2277 = fma(_2171, _1895, _2221);
            float _2279 = fma(_2171, _1901, _2223);
            float _2281 = fma(_2171, _1907, _2225);
            float _2283 = fma(_2171, _1913, _2229);
            float _2285 = fma(_2171, _1921, _2233);
            float _2287 = fma(_2171, _1927, _2207);
            float _2289 = fma(_2171, _1933, _2209);
            float _2291 = fma(_2171, _1939, _2211);
            float _2293 = fma(_2171, _1947, _2215);
            float _2295 = fma(_2171, _1953, _2217);
            float _2297 = fma(_2171, _1959, _2219);
            float _2299 = fma(_2171, _1965, _2227);
            float _2301 = fma(_2171, _1969, _2231);
            float _2303 = fma(_2171, _1975, _2235);
            float _2305 = fma(_2171, _1981, _2237);
            float _2307 = fma(_2171, _1987, _2243);
            float _2309 = fma(_2241, _1991, _2245);
            float _2311 = fma(_2241, _1997, _2247);
            float _2313 = fma(_2241, _2003, _2249);
            float _2315 = fma(_2241, _2009, _2251);
            float _2317 = fma(_2241, _2013, _2253);
            float _2319 = fma(_2241, _2019, _2255);
            float _2321 = fma(_2241, _2025, _2257);
            float _2323 = fma(_2241, _2031, _2259);
            float _2325 = fma(_2241, _2035, _2261);
            float _2327 = fma(_2241, _2041, _2263);
            float _2329 = fma(_2241, _2047, _2265);
            float _2331 = fma(_2241, _2053, _2267);
            float _2333 = fma(_2241, _2057, _2269);
            float _2335 = fma(_2241, _2063, _2271);
            float _2337 = fma(_2241, _2069, _2273);
            float _2339 = fma(_2241, _2075, _2275);
            float _2341 = fma(_2241, _2079, _2277);
            float _2343 = fma(_2241, _2085, _2279);
            float _2345 = fma(_2241, _2091, _2281);
            float _2347 = fma(_2241, _2097, _2283);
            float _2349 = fma(_2241, _2101, _2285);
            float _2351 = fma(_2241, _2107, _2287);
            float _2353 = fma(_2241, _2113, _2289);
            float _2355 = fma(_2241, _2119, _2291);
            float _2357 = fma(_2241, _2123, _2293);
            float _2359 = fma(_2241, _2129, _2295);
            float _2361 = fma(_2241, _2135, _2297);
            float _2363 = fma(_2241, _2141, _2299);
            float _2365 = fma(_2241, _2145, _2301);
            float _2367 = fma(_2241, _2151, _2303);
            float _2369 = fma(_2241, _2157, _2305);
            float _2371 = fma(_2241, _2163, _2307);
            _2373 = _2323;
            _2375 = _2319;
            _2377 = _2351;
            _2379 = _2333;
            _2381 = _2317;
            _2383 = _2337;
            _2385 = _2353;
            _2387 = _2335;
            _2389 = _2339;
            _2391 = _2355;
            _2393 = _2321;
            _2395 = _2349;
            _2397 = _2367;
            _2399 = _2315;
            _2401 = _2365;
            _2403 = _2325;
            _2405 = _2327;
            _2407 = _2359;
            _2409 = _2309;
            _2411 = _2311;
            _2413 = _2313;
            _2415 = _2357;
            _2417 = _2369;
            _2419 = _2331;
            _2421 = _2341;
            _2423 = _2361;
            _2425 = _2371;
            _2427 = _2345;
            _2429 = _2347;
            _2431 = _2363;
            _2433 = _2329;
            _2435 = _2343;
            _2437 = true;
        }
        else
        {
            int _2439 = _1569 * 656;
            int _2441 = _2439 + 262144;
            int _2443 = _2439 + 262192;
            int _2445 = _2439 + 262160;
            uint _2447 = uint(int(uint(_2441) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2447)];
            float _2449 = as_type<float>(_dmw24.x);
            int _2451 = _2441 + 4;
            uint _2453 = uint(int(uint(_2451) >> uint(2)));
            float _2455 = as_type<float>(_dmw24.y);
            int _2457 = _2441 + 8;
            uint _2459 = uint(int(uint(_2457) >> uint(2)));
            float _2461 = as_type<float>(_dmw24.z);
            int _2463 = _2441 + 12;
            uint _2465 = uint(int(uint(_2463) >> uint(2)));
            float _2467 = as_type<float>(_dmw24.w);
            int _2469 = _2439 + 262208;
            uint _2471 = uint(int(uint(_2443) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2471)];
            float _2473 = as_type<float>(_dmw27.x);
            int _2475 = _2443 + 4;
            uint _2477 = uint(int(uint(_2475) >> uint(2)));
            float _2479 = as_type<float>(_dmw27.y);
            int _2481 = _2443 + 8;
            uint _2483 = uint(int(uint(_2481) >> uint(2)));
            float _2485 = as_type<float>(_dmw27.z);
            int _2487 = _2443 + 12;
            uint _2489 = uint(int(uint(_2487) >> uint(2)));
            float _2491 = as_type<float>(_dmw27.w);
            int _2493 = _2439 + 262176;
            uint _2495 = uint(int(uint(_2445) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2495)];
            float _2497 = as_type<float>(_dmw25.x);
            int _2499 = _2445 + 4;
            uint _2501 = uint(int(uint(_2499) >> uint(2)));
            float _2503 = as_type<float>(_dmw25.y);
            int _2505 = _2445 + 8;
            uint _2507 = uint(int(uint(_2505) >> uint(2)));
            float _2509 = as_type<float>(_dmw25.z);
            int _2511 = _2445 + 12;
            uint _2513 = uint(int(uint(_2511) >> uint(2)));
            float _2515 = as_type<float>(_dmw25.w);
            int _2517 = _2439 + 262224;
            uint _2519 = uint(int(uint(_2469) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2519)];
            float _2521 = as_type<float>(_dmw28.x);
            int _2523 = _2469 + 4;
            uint _2525 = uint(int(uint(_2523) >> uint(2)));
            float _2527 = as_type<float>(_dmw28.y);
            int _2529 = _2469 + 8;
            uint _2531 = uint(int(uint(_2529) >> uint(2)));
            float _2533 = as_type<float>(_dmw28.z);
            int _2535 = _2469 + 12;
            uint _2537 = uint(int(uint(_2535) >> uint(2)));
            float _2539 = as_type<float>(_dmw28.w);
            int _2541 = _2439 + 262240;
            uint _2543 = uint(int(uint(_2493) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2543)];
            float _2545 = as_type<float>(_dmw26.x);
            int _2547 = _2493 + 4;
            uint _2549 = uint(int(uint(_2547) >> uint(2)));
            float _2551 = as_type<float>(_dmw26.y);
            int _2553 = _2493 + 8;
            uint _2555 = uint(int(uint(_2553) >> uint(2)));
            float _2557 = as_type<float>(_dmw26.z);
            int _2559 = _2493 + 12;
            uint _2561 = uint(int(uint(_2559) >> uint(2)));
            float _2563 = as_type<float>(_dmw26.w);
            int _2565 = _2439 + 262256;
            uint _2567 = uint(int(uint(_2517) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2567)];
            float _2569 = as_type<float>(_dmw29.x);
            int _2571 = _2517 + 4;
            uint _2573 = uint(int(uint(_2571) >> uint(2)));
            float _2575 = as_type<float>(_dmw29.y);
            int _2577 = _2517 + 8;
            uint _2579 = uint(int(uint(_2577) >> uint(2)));
            float _2581 = as_type<float>(_dmw29.z);
            int _2583 = _2517 + 12;
            uint _2585 = uint(int(uint(_2583) >> uint(2)));
            float _2587 = as_type<float>(_dmw29.w);
            int _2589 = _1571 * 656;
            uint _2591 = uint(int(uint(_2541) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2591)];
            float _2593 = as_type<float>(_dmw30.x);
            int _2595 = _2541 + 4;
            uint _2597 = uint(int(uint(_2595) >> uint(2)));
            float _2599 = as_type<float>(_dmw30.y);
            int _2601 = _2541 + 8;
            uint _2603 = uint(int(uint(_2601) >> uint(2)));
            float _2605 = as_type<float>(_dmw30.z);
            int _2607 = _2541 + 12;
            uint _2609 = uint(int(uint(_2607) >> uint(2)));
            float _2611 = as_type<float>(_dmw30.w);
            int _2613 = _1573 * 656;
            int _2615 = _2589 + 262144;
            uint _2617 = uint(int(uint(_2565) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2617)];
            float _2619 = as_type<float>(_dmw31.x);
            int _2621 = _2565 + 4;
            uint _2623 = uint(int(uint(_2621) >> uint(2)));
            float _2625 = as_type<float>(_dmw31.y);
            int _2627 = _2565 + 8;
            uint _2629 = uint(int(uint(_2627) >> uint(2)));
            float _2631 = as_type<float>(_dmw31.z);
            int _2633 = _2565 + 12;
            uint _2635 = uint(int(uint(_2633) >> uint(2)));
            float _2637 = as_type<float>(_dmw31.w);
            int _2639 = _2589 + 262192;
            int _2641 = _2589 + 262160;
            uint _2643 = uint(int(uint(_2615) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2643)];
            float _2645 = as_type<float>(_dmw32.x);
            int _2647 = _2615 + 4;
            uint _2649 = uint(int(uint(_2647) >> uint(2)));
            float _2651 = as_type<float>(_dmw32.y);
            int _2653 = _2615 + 8;
            uint _2655 = uint(int(uint(_2653) >> uint(2)));
            float _2657 = as_type<float>(_dmw32.z);
            int _2659 = _2615 + 12;
            uint _2661 = uint(int(uint(_2659) >> uint(2)));
            float _2663 = as_type<float>(_dmw32.w);
            int _2665 = _2589 + 262208;
            int _2667 = _2589 + 262176;
            uint _2669 = uint(int(uint(_2639) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2669)];
            float _2671 = as_type<float>(_dmw35.x);
            int _2673 = _2639 + 4;
            uint _2675 = uint(int(uint(_2673) >> uint(2)));
            float _2677 = as_type<float>(_dmw35.y);
            int _2679 = _2639 + 8;
            uint _2681 = uint(int(uint(_2679) >> uint(2)));
            float _2683 = as_type<float>(_dmw35.z);
            int _2685 = _2639 + 12;
            uint _2687 = uint(int(uint(_2685) >> uint(2)));
            float _2689 = as_type<float>(_dmw35.w);
            int _2691 = _2589 + 262224;
            int _2693 = _2589 + 262240;
            uint _2695 = uint(int(uint(_2641) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2695)];
            float _2697 = as_type<float>(_dmw33.x);
            int _2699 = _2641 + 4;
            uint _2701 = uint(int(uint(_2699) >> uint(2)));
            float _2703 = as_type<float>(_dmw33.y);
            int _2705 = _2641 + 8;
            uint _2707 = uint(int(uint(_2705) >> uint(2)));
            float _2709 = as_type<float>(_dmw33.z);
            int _2711 = _2641 + 12;
            uint _2713 = uint(int(uint(_2711) >> uint(2)));
            float _2715 = as_type<float>(_dmw33.w);
            int _2717 = _2589 + 262256;
            int _2719 = _2613 + 262144;
            uint _2721 = uint(int(uint(_2665) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2721)];
            float _2723 = as_type<float>(_dmw36.x);
            int _2725 = _2665 + 4;
            uint _2727 = uint(int(uint(_2725) >> uint(2)));
            float _2729 = as_type<float>(_dmw36.y);
            int _2731 = _2665 + 8;
            uint _2733 = uint(int(uint(_2731) >> uint(2)));
            float _2735 = as_type<float>(_dmw36.z);
            int _2737 = _2665 + 12;
            uint _2739 = uint(int(uint(_2737) >> uint(2)));
            float _2741 = as_type<float>(_dmw36.w);
            int _2743 = _2613 + 262192;
            int _2745 = _2613 + 262160;
            uint _2747 = uint(int(uint(_2667) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2747)];
            float _2749 = as_type<float>(_dmw34.x);
            int _2751 = _2667 + 4;
            uint _2753 = uint(int(uint(_2751) >> uint(2)));
            float _2755 = as_type<float>(_dmw34.y);
            int _2757 = _2667 + 8;
            uint _2759 = uint(int(uint(_2757) >> uint(2)));
            float _2761 = as_type<float>(_dmw34.z);
            int _2763 = _2667 + 12;
            uint _2765 = uint(int(uint(_2763) >> uint(2)));
            float _2767 = as_type<float>(_dmw34.w);
            int _2769 = _2613 + 262208;
            int _2771 = _2613 + 262176;
            uint _2773 = uint(int(uint(_2691) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2773)];
            float _2775 = as_type<float>(_dmw37.x);
            int _2777 = _2691 + 4;
            uint _2779 = uint(int(uint(_2777) >> uint(2)));
            float _2781 = as_type<float>(_dmw37.y);
            int _2783 = _2691 + 8;
            uint _2785 = uint(int(uint(_2783) >> uint(2)));
            float _2787 = as_type<float>(_dmw37.z);
            int _2789 = _2691 + 12;
            uint _2791 = uint(int(uint(_2789) >> uint(2)));
            float _2793 = as_type<float>(_dmw37.w);
            int _2795 = _2613 + 262224;
            int _2797 = _2613 + 262240;
            uint _2799 = uint(int(uint(_2693) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2799)];
            float _2801 = as_type<float>(_dmw38.x);
            int _2803 = _2693 + 4;
            uint _2805 = uint(int(uint(_2803) >> uint(2)));
            float _2807 = as_type<float>(_dmw38.y);
            int _2809 = _2693 + 8;
            uint _2811 = uint(int(uint(_2809) >> uint(2)));
            float _2813 = as_type<float>(_dmw38.z);
            int _2815 = _2693 + 12;
            uint _2817 = uint(int(uint(_2815) >> uint(2)));
            float _2819 = as_type<float>(_dmw38.w);
            int _2821 = _2613 + 262256;
            uint _2823 = uint(int(uint(_2717) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2823)];
            float _2825 = as_type<float>(_dmw39.x);
            int _2827 = _2717 + 4;
            uint _2829 = uint(int(uint(_2827) >> uint(2)));
            float _2831 = as_type<float>(_dmw39.y);
            int _2833 = _2717 + 8;
            uint _2835 = uint(int(uint(_2833) >> uint(2)));
            float _2837 = as_type<float>(_dmw39.z);
            int _2839 = _2717 + 12;
            uint _2841 = uint(int(uint(_2839) >> uint(2)));
            float _2843 = as_type<float>(_dmw39.w);
            uint _2845 = uint(int(uint(_2719) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2845)];
            float _2847 = as_type<float>(_dmw40.x);
            int _2849 = _2719 + 4;
            uint _2851 = uint(int(uint(_2849) >> uint(2)));
            float _2853 = as_type<float>(_dmw40.y);
            int _2855 = _2719 + 8;
            uint _2857 = uint(int(uint(_2855) >> uint(2)));
            float _2859 = as_type<float>(_dmw40.z);
            int _2861 = _2719 + 12;
            uint _2863 = uint(int(uint(_2861) >> uint(2)));
            float _2865 = as_type<float>(_dmw40.w);
            uint _2867 = uint(int(uint(_2743) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2867)];
            float _2869 = as_type<float>(_dmw43.x);
            int _2871 = _2743 + 4;
            uint _2873 = uint(int(uint(_2871) >> uint(2)));
            float _2875 = as_type<float>(_dmw43.y);
            int _2877 = _2743 + 8;
            uint _2879 = uint(int(uint(_2877) >> uint(2)));
            float _2881 = as_type<float>(_dmw43.z);
            int _2883 = _2743 + 12;
            uint _2885 = uint(int(uint(_2883) >> uint(2)));
            float _2887 = as_type<float>(_dmw43.w);
            uint _2889 = uint(int(uint(_2745) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2889)];
            float _2891 = as_type<float>(_dmw41.x);
            int _2893 = _2745 + 4;
            uint _2895 = uint(int(uint(_2893) >> uint(2)));
            float _2897 = as_type<float>(_dmw41.y);
            int _2899 = _2745 + 8;
            uint _2901 = uint(int(uint(_2899) >> uint(2)));
            float _2903 = as_type<float>(_dmw41.z);
            int _2905 = _2745 + 12;
            uint _2907 = uint(int(uint(_2905) >> uint(2)));
            float _2909 = as_type<float>(_dmw41.w);
            uint _2911 = uint(int(uint(_2769) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2911)];
            float _2913 = as_type<float>(_dmw44.x);
            int _2915 = _2769 + 4;
            uint _2917 = uint(int(uint(_2915) >> uint(2)));
            float _2919 = as_type<float>(_dmw44.y);
            int _2921 = _2769 + 8;
            uint _2923 = uint(int(uint(_2921) >> uint(2)));
            float _2925 = as_type<float>(_dmw44.z);
            int _2927 = _2769 + 12;
            uint _2929 = uint(int(uint(_2927) >> uint(2)));
            float _2931 = as_type<float>(_dmw44.w);
            uint _2933 = uint(int(uint(_2771) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2933)];
            float _2935 = as_type<float>(_dmw42.x);
            int _2937 = _2771 + 4;
            uint _2939 = uint(int(uint(_2937) >> uint(2)));
            float _2941 = as_type<float>(_dmw42.y);
            int _2943 = _2771 + 8;
            uint _2945 = uint(int(uint(_2943) >> uint(2)));
            float _2947 = as_type<float>(_dmw42.z);
            int _2949 = _2771 + 12;
            uint _2951 = uint(int(uint(_2949) >> uint(2)));
            float _2953 = as_type<float>(_dmw42.w);
            uint _2955 = uint(int(uint(_2795) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2955)];
            float _2957 = as_type<float>(_dmw45.x);
            int _2959 = _2795 + 4;
            uint _2961 = uint(int(uint(_2959) >> uint(2)));
            float _2963 = as_type<float>(_dmw45.y);
            int _2965 = _2795 + 8;
            uint _2967 = uint(int(uint(_2965) >> uint(2)));
            float _2969 = as_type<float>(_dmw45.z);
            int _2971 = _2795 + 12;
            uint _2973 = uint(int(uint(_2971) >> uint(2)));
            float _2975 = as_type<float>(_dmw45.w);
            uint _2977 = uint(int(uint(_2797) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2977)];
            float _2979 = as_type<float>(_dmw46.x);
            int _2981 = _2797 + 4;
            uint _2983 = uint(int(uint(_2981) >> uint(2)));
            float _2985 = as_type<float>(_dmw46.y);
            int _2987 = _2797 + 8;
            uint _2989 = uint(int(uint(_2987) >> uint(2)));
            float _2991 = as_type<float>(_dmw46.z);
            int _2993 = _2797 + 12;
            uint _2995 = uint(int(uint(_2993) >> uint(2)));
            float _2997 = as_type<float>(_dmw46.w);
            uint _2999 = uint(int(uint(_2821) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2999)];
            float _3001 = as_type<float>(_dmw47.x);
            int _3003 = _2821 + 4;
            uint _3005 = uint(int(uint(_3003) >> uint(2)));
            float _3007 = as_type<float>(_dmw47.y);
            int _3009 = _2821 + 8;
            uint _3011 = uint(int(uint(_3009) >> uint(2)));
            float _3013 = as_type<float>(_dmw47.z);
            int _3015 = _2821 + 12;
            uint _3017 = uint(int(uint(_3015) >> uint(2)));
            float _3019 = as_type<float>(_dmw47.w);
            float _3021 = _1495 + (-1.0);
            float _3023 = _1519 + (-1.0);
            float _3025 = _1519 + _3021;
            float _3027 = -_3021;
            float _3029 = _2449 * _3027;
            float _3031 = -_3021;
            float _3033 = _2455 * _3031;
            float _3035 = -_3021;
            float _3037 = _2461 * _3035;
            float _3039 = -_3021;
            float _3041 = _2467 * _3039;
            float _3043 = -_3021;
            float _3045 = _2473 * _3043;
            float _3047 = -_3021;
            float _3049 = _2479 * _3047;
            float _3051 = -_3021;
            float _3053 = _2485 * _3051;
            float _3055 = -_3021;
            float _3057 = _2491 * _3055;
            float _3059 = -_3021;
            float _3061 = _2497 * _3059;
            float _3063 = -_3021;
            float _3065 = _2503 * _3063;
            float _3067 = -_3021;
            float _3069 = _2509 * _3067;
            float _3071 = -_3021;
            float _3073 = _2515 * _3071;
            float _3075 = -_3021;
            float _3077 = _2521 * _3075;
            float _3079 = -_3021;
            float _3081 = _2527 * _3079;
            float _3083 = -_3021;
            float _3085 = _2533 * _3083;
            float _3087 = -_3021;
            float _3089 = _2539 * _3087;
            float _3091 = -_3021;
            float _3093 = _2545 * _3091;
            float _3095 = -_3021;
            float _3097 = _2551 * _3095;
            float _3099 = -_3021;
            float _3101 = _2557 * _3099;
            float _3103 = -_3021;
            float _3105 = _2563 * _3103;
            float _3107 = -_3021;
            float _3109 = _2569 * _3107;
            float _3111 = -_3021;
            float _3113 = _2575 * _3111;
            float _3115 = -_3021;
            float _3117 = _2581 * _3115;
            float _3119 = -_3021;
            float _3121 = _2587 * _3119;
            float _3123 = -_3021;
            float _3125 = _2593 * _3123;
            float _3127 = -_3021;
            float _3129 = _2599 * _3127;
            float _3131 = -_3021;
            float _3133 = _2605 * _3131;
            float _3135 = -_3021;
            float _3137 = _2611 * _3135;
            float _3139 = -_3021;
            float _3141 = _2619 * _3139;
            float _3143 = -_3021;
            float _3145 = _2625 * _3143;
            float _3147 = -_3021;
            float _3149 = _2631 * _3147;
            float _3151 = -_3021;
            float _3153 = _2637 * _3151;
            float _3155 = -_3023;
            float _3157 = fma(_3155, _2645, _3029);
            float _3159 = -_3023;
            float _3161 = fma(_3159, _2651, _3033);
            float _3163 = -_3023;
            float _3165 = fma(_3163, _2657, _3037);
            float _3167 = -_3023;
            float _3169 = fma(_3167, _2663, _3041);
            float _3171 = -_3023;
            float _3173 = fma(_3171, _2671, _3045);
            float _3175 = -_3023;
            float _3177 = fma(_3175, _2677, _3049);
            float _3179 = -_3023;
            float _3181 = fma(_3179, _2683, _3053);
            float _3183 = -_3023;
            float _3185 = fma(_3183, _2689, _3057);
            float _3187 = -_3023;
            float _3189 = fma(_3187, _2697, _3061);
            float _3191 = -_3023;
            float _3193 = fma(_3191, _2703, _3065);
            float _3195 = -_3023;
            float _3197 = fma(_3195, _2709, _3069);
            float _3199 = -_3023;
            float _3201 = fma(_3199, _2715, _3073);
            float _3203 = -_3023;
            float _3205 = fma(_3203, _2723, _3077);
            float _3207 = -_3023;
            float _3209 = fma(_3207, _2729, _3081);
            float _3211 = -_3023;
            float _3213 = fma(_3211, _2735, _3085);
            float _3215 = -_3023;
            float _3217 = fma(_3215, _2741, _3089);
            float _3219 = -_3023;
            float _3221 = fma(_3219, _2749, _3093);
            float _3223 = -_3023;
            float _3225 = fma(_3223, _2755, _3097);
            float _3227 = -_3023;
            float _3229 = fma(_3227, _2761, _3101);
            float _3231 = -_3023;
            float _3233 = fma(_3231, _2767, _3105);
            float _3235 = -_3023;
            float _3237 = fma(_3235, _2775, _3109);
            float _3239 = -_3023;
            float _3241 = fma(_3239, _2781, _3113);
            float _3243 = -_3023;
            float _3245 = fma(_3243, _2787, _3117);
            float _3247 = -_3023;
            float _3249 = fma(_3247, _2793, _3121);
            float _3251 = -_3023;
            float _3253 = fma(_3251, _2801, _3125);
            float _3255 = -_3023;
            float _3257 = fma(_3255, _2807, _3129);
            float _3259 = -_3023;
            float _3261 = fma(_3259, _2813, _3133);
            float _3263 = -_3023;
            float _3265 = fma(_3263, _2819, _3137);
            float _3267 = -_3023;
            float _3269 = fma(_3267, _2825, _3141);
            float _3271 = -_3023;
            float _3273 = fma(_3271, _2831, _3145);
            float _3275 = -_3023;
            float _3277 = fma(_3275, _2837, _3149);
            float _3279 = -_3023;
            float _3281 = fma(_3279, _2843, _3153);
            float _3283 = fma(_3025, _2847, _3157);
            float _3285 = fma(_3025, _2853, _3161);
            float _3287 = fma(_3025, _2859, _3165);
            float _3289 = fma(_3025, _2865, _3169);
            float _3291 = fma(_3025, _2869, _3173);
            float _3293 = fma(_3025, _2875, _3177);
            float _3295 = fma(_3025, _2881, _3181);
            float _3297 = fma(_3025, _2887, _3185);
            float _3299 = fma(_3025, _2891, _3189);
            float _3301 = fma(_3025, _2897, _3193);
            float _3303 = fma(_3025, _2903, _3197);
            float _3305 = fma(_3025, _2909, _3201);
            float _3307 = fma(_3025, _2913, _3205);
            float _3309 = fma(_3025, _2919, _3209);
            float _3311 = fma(_3025, _2925, _3213);
            float _3313 = fma(_3025, _2931, _3217);
            float _3315 = fma(_3025, _2935, _3221);
            float _3317 = fma(_3025, _2941, _3225);
            float _3319 = fma(_3025, _2947, _3229);
            float _3321 = fma(_3025, _2953, _3233);
            float _3323 = fma(_3025, _2957, _3237);
            float _3325 = fma(_3025, _2963, _3241);
            float _3327 = fma(_3025, _2969, _3245);
            float _3329 = fma(_3025, _2975, _3249);
            float _3331 = fma(_3025, _2979, _3253);
            float _3333 = fma(_3025, _2985, _3257);
            float _3335 = fma(_3025, _2991, _3261);
            float _3337 = fma(_3025, _2997, _3265);
            float _3339 = fma(_3025, _3001, _3269);
            float _3341 = fma(_3025, _3007, _3273);
            float _3343 = fma(_3025, _3013, _3277);
            float _3345 = fma(_3025, _3019, _3281);
            _2373 = _3297;
            _2375 = _3293;
            _2377 = _3325;
            _2379 = _3307;
            _2381 = _3291;
            _2383 = _3311;
            _2385 = _3327;
            _2387 = _3309;
            _2389 = _3313;
            _2391 = _3329;
            _2393 = _3295;
            _2395 = _3323;
            _2397 = _3341;
            _2399 = _3289;
            _2401 = _3339;
            _2403 = _3299;
            _2405 = _3301;
            _2407 = _3333;
            _2409 = _3283;
            _2411 = _3285;
            _2413 = _3287;
            _2415 = _3331;
            _2417 = _3343;
            _2419 = _3305;
            _2421 = _3315;
            _2423 = _3335;
            _2425 = _3345;
            _2427 = _3319;
            _2429 = _3321;
            _2431 = _3337;
            _2433 = _3303;
            _2435 = _3317;
            _2437 = true;
        }
    }
    else
    {
        float _3347 = _1519 * (-0.707106769084930419921875);
        float _3349 = _1495 + (-1.0);
        float _3351 = _1519 + (-1.0);
        float _3353 = fma(_1495, 0.707106769084930419921875, _3347);
        bool _3355 = _3353 >= 0.0;
        bool _3357 = !_3355;
        if (!_3357)
        {
            int _3359 = _1571 * 656;
            int _3361 = _3359 + 262144;
            int _3363 = _3359 + 262192;
            int _3365 = _3359 + 262160;
            uint _3367 = uint(int(uint(_3361) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3367)];
            float _3369 = as_type<float>(_dmw48.x);
            int _3371 = _3361 + 4;
            uint _3373 = uint(int(uint(_3371) >> uint(2)));
            float _3375 = as_type<float>(_dmw48.y);
            int _3377 = _3361 + 8;
            uint _3379 = uint(int(uint(_3377) >> uint(2)));
            float _3381 = as_type<float>(_dmw48.z);
            int _3383 = _3361 + 12;
            uint _3385 = uint(int(uint(_3383) >> uint(2)));
            float _3387 = as_type<float>(_dmw48.w);
            int _3389 = _3359 + 262208;
            uint _3391 = uint(int(uint(_3363) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3391)];
            float _3393 = as_type<float>(_dmw51.x);
            int _3395 = _3363 + 4;
            uint _3397 = uint(int(uint(_3395) >> uint(2)));
            float _3399 = as_type<float>(_dmw51.y);
            int _3401 = _3363 + 8;
            uint _3403 = uint(int(uint(_3401) >> uint(2)));
            float _3405 = as_type<float>(_dmw51.z);
            int _3407 = _3363 + 12;
            uint _3409 = uint(int(uint(_3407) >> uint(2)));
            float _3411 = as_type<float>(_dmw51.w);
            int _3413 = _3359 + 262176;
            uint _3415 = uint(int(uint(_3365) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3415)];
            float _3417 = as_type<float>(_dmw49.x);
            int _3419 = _3365 + 4;
            uint _3421 = uint(int(uint(_3419) >> uint(2)));
            float _3423 = as_type<float>(_dmw49.y);
            int _3425 = _3365 + 8;
            uint _3427 = uint(int(uint(_3425) >> uint(2)));
            float _3429 = as_type<float>(_dmw49.z);
            int _3431 = _3365 + 12;
            uint _3433 = uint(int(uint(_3431) >> uint(2)));
            float _3435 = as_type<float>(_dmw49.w);
            int _3437 = _3359 + 262224;
            uint _3439 = uint(int(uint(_3389) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3439)];
            float _3441 = as_type<float>(_dmw52.x);
            int _3443 = _3389 + 4;
            uint _3445 = uint(int(uint(_3443) >> uint(2)));
            float _3447 = as_type<float>(_dmw52.y);
            int _3449 = _3389 + 8;
            uint _3451 = uint(int(uint(_3449) >> uint(2)));
            float _3453 = as_type<float>(_dmw52.z);
            int _3455 = _3389 + 12;
            uint _3457 = uint(int(uint(_3455) >> uint(2)));
            float _3459 = as_type<float>(_dmw52.w);
            int _3461 = _3359 + 262240;
            uint _3463 = uint(int(uint(_3413) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3463)];
            float _3465 = as_type<float>(_dmw50.x);
            int _3467 = _3413 + 4;
            uint _3469 = uint(int(uint(_3467) >> uint(2)));
            float _3471 = as_type<float>(_dmw50.y);
            int _3473 = _3413 + 8;
            uint _3475 = uint(int(uint(_3473) >> uint(2)));
            float _3477 = as_type<float>(_dmw50.z);
            int _3479 = _3413 + 12;
            uint _3481 = uint(int(uint(_3479) >> uint(2)));
            float _3483 = as_type<float>(_dmw50.w);
            int _3485 = _3359 + 262256;
            uint _3487 = uint(int(uint(_3437) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3487)];
            float _3489 = as_type<float>(_dmw53.x);
            int _3491 = _3437 + 4;
            uint _3493 = uint(int(uint(_3491) >> uint(2)));
            float _3495 = as_type<float>(_dmw53.y);
            int _3497 = _3437 + 8;
            uint _3499 = uint(int(uint(_3497) >> uint(2)));
            float _3501 = as_type<float>(_dmw53.z);
            int _3503 = _3437 + 12;
            uint _3505 = uint(int(uint(_3503) >> uint(2)));
            float _3507 = as_type<float>(_dmw53.w);
            int _3509 = _1523 * 656;
            uint _3511 = uint(int(uint(_3461) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3511)];
            float _3513 = as_type<float>(_dmw54.x);
            int _3515 = _3461 + 4;
            uint _3517 = uint(int(uint(_3515) >> uint(2)));
            float _3519 = as_type<float>(_dmw54.y);
            int _3521 = _3461 + 8;
            uint _3523 = uint(int(uint(_3521) >> uint(2)));
            float _3525 = as_type<float>(_dmw54.z);
            int _3527 = _3461 + 12;
            uint _3529 = uint(int(uint(_3527) >> uint(2)));
            float _3531 = as_type<float>(_dmw54.w);
            int _3533 = _1573 * 656;
            int _3535 = _3509 + 262144;
            uint _3537 = uint(int(uint(_3485) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3537)];
            float _3539 = as_type<float>(_dmw55.x);
            int _3541 = _3485 + 4;
            uint _3543 = uint(int(uint(_3541) >> uint(2)));
            float _3545 = as_type<float>(_dmw55.y);
            int _3547 = _3485 + 8;
            uint _3549 = uint(int(uint(_3547) >> uint(2)));
            float _3551 = as_type<float>(_dmw55.z);
            int _3553 = _3485 + 12;
            uint _3555 = uint(int(uint(_3553) >> uint(2)));
            float _3557 = as_type<float>(_dmw55.w);
            int _3559 = _3509 + 262192;
            int _3561 = _3509 + 262160;
            uint _3563 = uint(int(uint(_3535) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3563)];
            float _3565 = as_type<float>(_dmw56.x);
            int _3567 = _3535 + 4;
            uint _3569 = uint(int(uint(_3567) >> uint(2)));
            float _3571 = as_type<float>(_dmw56.y);
            int _3573 = _3535 + 8;
            uint _3575 = uint(int(uint(_3573) >> uint(2)));
            float _3577 = as_type<float>(_dmw56.z);
            int _3579 = _3535 + 12;
            uint _3581 = uint(int(uint(_3579) >> uint(2)));
            float _3583 = as_type<float>(_dmw56.w);
            int _3585 = _3509 + 262208;
            int _3587 = _3509 + 262176;
            uint _3589 = uint(int(uint(_3559) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3589)];
            float _3591 = as_type<float>(_dmw59.x);
            int _3593 = _3559 + 4;
            uint _3595 = uint(int(uint(_3593) >> uint(2)));
            float _3597 = as_type<float>(_dmw59.y);
            int _3599 = _3559 + 8;
            uint _3601 = uint(int(uint(_3599) >> uint(2)));
            float _3603 = as_type<float>(_dmw59.z);
            int _3605 = _3559 + 12;
            uint _3607 = uint(int(uint(_3605) >> uint(2)));
            float _3609 = as_type<float>(_dmw59.w);
            int _3611 = _3509 + 262224;
            int _3613 = _3509 + 262240;
            uint _3615 = uint(int(uint(_3561) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3615)];
            float _3617 = as_type<float>(_dmw57.x);
            int _3619 = _3561 + 4;
            uint _3621 = uint(int(uint(_3619) >> uint(2)));
            float _3623 = as_type<float>(_dmw57.y);
            int _3625 = _3561 + 8;
            uint _3627 = uint(int(uint(_3625) >> uint(2)));
            float _3629 = as_type<float>(_dmw57.z);
            int _3631 = _3561 + 12;
            uint _3633 = uint(int(uint(_3631) >> uint(2)));
            float _3635 = as_type<float>(_dmw57.w);
            int _3637 = _3509 + 262256;
            int _3639 = _3533 + 262144;
            uint _3641 = uint(int(uint(_3585) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3641)];
            float _3643 = as_type<float>(_dmw60.x);
            int _3645 = _3585 + 4;
            uint _3647 = uint(int(uint(_3645) >> uint(2)));
            float _3649 = as_type<float>(_dmw60.y);
            int _3651 = _3585 + 8;
            uint _3653 = uint(int(uint(_3651) >> uint(2)));
            float _3655 = as_type<float>(_dmw60.z);
            int _3657 = _3585 + 12;
            uint _3659 = uint(int(uint(_3657) >> uint(2)));
            float _3661 = as_type<float>(_dmw60.w);
            int _3663 = _3533 + 262192;
            int _3665 = _3533 + 262160;
            uint _3667 = uint(int(uint(_3587) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3667)];
            float _3669 = as_type<float>(_dmw58.x);
            int _3671 = _3587 + 4;
            uint _3673 = uint(int(uint(_3671) >> uint(2)));
            float _3675 = as_type<float>(_dmw58.y);
            int _3677 = _3587 + 8;
            uint _3679 = uint(int(uint(_3677) >> uint(2)));
            float _3681 = as_type<float>(_dmw58.z);
            int _3683 = _3587 + 12;
            uint _3685 = uint(int(uint(_3683) >> uint(2)));
            float _3687 = as_type<float>(_dmw58.w);
            int _3689 = _3533 + 262208;
            int _3691 = _3533 + 262176;
            uint _3693 = uint(int(uint(_3611) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3693)];
            float _3695 = as_type<float>(_dmw61.x);
            int _3697 = _3611 + 4;
            uint _3699 = uint(int(uint(_3697) >> uint(2)));
            float _3701 = as_type<float>(_dmw61.y);
            int _3703 = _3611 + 8;
            uint _3705 = uint(int(uint(_3703) >> uint(2)));
            float _3707 = as_type<float>(_dmw61.z);
            int _3709 = _3611 + 12;
            uint _3711 = uint(int(uint(_3709) >> uint(2)));
            float _3713 = as_type<float>(_dmw61.w);
            int _3715 = _3533 + 262224;
            int _3717 = _3533 + 262240;
            uint _3719 = uint(int(uint(_3613) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3719)];
            float _3721 = as_type<float>(_dmw62.x);
            int _3723 = _3613 + 4;
            uint _3725 = uint(int(uint(_3723) >> uint(2)));
            float _3727 = as_type<float>(_dmw62.y);
            int _3729 = _3613 + 8;
            uint _3731 = uint(int(uint(_3729) >> uint(2)));
            float _3733 = as_type<float>(_dmw62.z);
            int _3735 = _3613 + 12;
            uint _3737 = uint(int(uint(_3735) >> uint(2)));
            float _3739 = as_type<float>(_dmw62.w);
            int _3741 = _3533 + 262256;
            uint _3743 = uint(int(uint(_3637) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3743)];
            float _3745 = as_type<float>(_dmw63.x);
            int _3747 = _3637 + 4;
            uint _3749 = uint(int(uint(_3747) >> uint(2)));
            float _3751 = as_type<float>(_dmw63.y);
            int _3753 = _3637 + 8;
            uint _3755 = uint(int(uint(_3753) >> uint(2)));
            float _3757 = as_type<float>(_dmw63.z);
            int _3759 = _3637 + 12;
            uint _3761 = uint(int(uint(_3759) >> uint(2)));
            float _3763 = as_type<float>(_dmw63.w);
            uint _3765 = uint(int(uint(_3639) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3765)];
            float _3767 = as_type<float>(_dmw64.x);
            int _3769 = _3639 + 4;
            uint _3771 = uint(int(uint(_3769) >> uint(2)));
            float _3773 = as_type<float>(_dmw64.y);
            int _3775 = _3639 + 8;
            uint _3777 = uint(int(uint(_3775) >> uint(2)));
            float _3779 = as_type<float>(_dmw64.z);
            int _3781 = _3639 + 12;
            uint _3783 = uint(int(uint(_3781) >> uint(2)));
            float _3785 = as_type<float>(_dmw64.w);
            uint _3787 = uint(int(uint(_3663) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3787)];
            float _3789 = as_type<float>(_dmw67.x);
            int _3791 = _3663 + 4;
            uint _3793 = uint(int(uint(_3791) >> uint(2)));
            float _3795 = as_type<float>(_dmw67.y);
            int _3797 = _3663 + 8;
            uint _3799 = uint(int(uint(_3797) >> uint(2)));
            float _3801 = as_type<float>(_dmw67.z);
            int _3803 = _3663 + 12;
            uint _3805 = uint(int(uint(_3803) >> uint(2)));
            float _3807 = as_type<float>(_dmw67.w);
            uint _3809 = uint(int(uint(_3665) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3809)];
            float _3811 = as_type<float>(_dmw65.x);
            int _3813 = _3665 + 4;
            uint _3815 = uint(int(uint(_3813) >> uint(2)));
            float _3817 = as_type<float>(_dmw65.y);
            int _3819 = _3665 + 8;
            uint _3821 = uint(int(uint(_3819) >> uint(2)));
            float _3823 = as_type<float>(_dmw65.z);
            int _3825 = _3665 + 12;
            uint _3827 = uint(int(uint(_3825) >> uint(2)));
            float _3829 = as_type<float>(_dmw65.w);
            uint _3831 = uint(int(uint(_3689) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3831)];
            float _3833 = as_type<float>(_dmw68.x);
            int _3835 = _3689 + 4;
            uint _3837 = uint(int(uint(_3835) >> uint(2)));
            float _3839 = as_type<float>(_dmw68.y);
            int _3841 = _3689 + 8;
            uint _3843 = uint(int(uint(_3841) >> uint(2)));
            float _3845 = as_type<float>(_dmw68.z);
            int _3847 = _3689 + 12;
            uint _3849 = uint(int(uint(_3847) >> uint(2)));
            float _3851 = as_type<float>(_dmw68.w);
            uint _3853 = uint(int(uint(_3691) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3853)];
            float _3855 = as_type<float>(_dmw66.x);
            int _3857 = _3691 + 4;
            uint _3859 = uint(int(uint(_3857) >> uint(2)));
            float _3861 = as_type<float>(_dmw66.y);
            int _3863 = _3691 + 8;
            uint _3865 = uint(int(uint(_3863) >> uint(2)));
            float _3867 = as_type<float>(_dmw66.z);
            int _3869 = _3691 + 12;
            uint _3871 = uint(int(uint(_3869) >> uint(2)));
            float _3873 = as_type<float>(_dmw66.w);
            uint _3875 = uint(int(uint(_3715) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3875)];
            float _3877 = as_type<float>(_dmw69.x);
            int _3879 = _3715 + 4;
            uint _3881 = uint(int(uint(_3879) >> uint(2)));
            float _3883 = as_type<float>(_dmw69.y);
            int _3885 = _3715 + 8;
            uint _3887 = uint(int(uint(_3885) >> uint(2)));
            float _3889 = as_type<float>(_dmw69.z);
            int _3891 = _3715 + 12;
            uint _3893 = uint(int(uint(_3891) >> uint(2)));
            float _3895 = as_type<float>(_dmw69.w);
            uint _3897 = uint(int(uint(_3717) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3897)];
            float _3899 = as_type<float>(_dmw70.x);
            int _3901 = _3717 + 4;
            uint _3903 = uint(int(uint(_3901) >> uint(2)));
            float _3905 = as_type<float>(_dmw70.y);
            int _3907 = _3717 + 8;
            uint _3909 = uint(int(uint(_3907) >> uint(2)));
            float _3911 = as_type<float>(_dmw70.z);
            int _3913 = _3717 + 12;
            uint _3915 = uint(int(uint(_3913) >> uint(2)));
            float _3917 = as_type<float>(_dmw70.w);
            uint _3919 = uint(int(uint(_3741) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3919)];
            float _3921 = as_type<float>(_dmw71.x);
            int _3923 = _3741 + 4;
            uint _3925 = uint(int(uint(_3923) >> uint(2)));
            float _3927 = as_type<float>(_dmw71.y);
            int _3929 = _3741 + 8;
            uint _3931 = uint(int(uint(_3929) >> uint(2)));
            float _3933 = as_type<float>(_dmw71.z);
            int _3935 = _3741 + 12;
            uint _3937 = uint(int(uint(_3935) >> uint(2)));
            float _3939 = as_type<float>(_dmw71.w);
            float _3941 = -_3351;
            float _3943 = _3349 + _3941;
            float _3945 = -_3943;
            float _3947 = _1495 + _3945;
            float _3949 = _3369 * _3943;
            float _3951 = _3375 * _3943;
            float _3953 = _3381 * _3943;
            float _3955 = _3387 * _3943;
            float _3957 = _3393 * _3943;
            float _3959 = _3399 * _3943;
            float _3961 = _3405 * _3943;
            float _3963 = _3411 * _3943;
            float _3965 = _3417 * _3943;
            float _3967 = _3423 * _3943;
            float _3969 = _3429 * _3943;
            float _3971 = _3435 * _3943;
            float _3973 = _3441 * _3943;
            float _3975 = _3447 * _3943;
            float _3977 = _3453 * _3943;
            float _3979 = _3459 * _3943;
            float _3981 = _3465 * _3943;
            float _3983 = _3471 * _3943;
            float _3985 = _3477 * _3943;
            float _3987 = _3483 * _3943;
            float _3989 = _3489 * _3943;
            float _3991 = _3495 * _3943;
            float _3993 = _3501 * _3943;
            float _3995 = _3507 * _3943;
            float _3997 = _3513 * _3943;
            float _3999 = _3519 * _3943;
            float _4001 = _3525 * _3943;
            float _4003 = _3531 * _3943;
            float _4005 = _3539 * _3943;
            float _4007 = _3545 * _3943;
            float _4009 = _3551 * _3943;
            float _4011 = _3557 * _3943;
            float _4013 = -_3349;
            float _4015 = fma(_3565, _4013, _3949);
            float _4017 = -_3349;
            float _4019 = fma(_3571, _4017, _3951);
            float _4021 = -_3349;
            float _4023 = fma(_3577, _4021, _3953);
            float _4025 = -_3349;
            float _4027 = fma(_3583, _4025, _3955);
            float _4029 = -_3349;
            float _4031 = fma(_3591, _4029, _3957);
            float _4033 = -_3349;
            float _4035 = fma(_3597, _4033, _3959);
            float _4037 = -_3349;
            float _4039 = fma(_3603, _4037, _3961);
            float _4041 = -_3349;
            float _4043 = fma(_3609, _4041, _3963);
            float _4045 = -_3349;
            float _4047 = fma(_3617, _4045, _3965);
            float _4049 = -_3349;
            float _4051 = fma(_3623, _4049, _3967);
            float _4053 = -_3349;
            float _4055 = fma(_3629, _4053, _3969);
            float _4057 = -_3349;
            float _4059 = fma(_3635, _4057, _3971);
            float _4061 = -_3349;
            float _4063 = fma(_3643, _4061, _3973);
            float _4065 = -_3349;
            float _4067 = fma(_3649, _4065, _3975);
            float _4069 = -_3349;
            float _4071 = fma(_3655, _4069, _3977);
            float _4073 = -_3349;
            float _4075 = fma(_3661, _4073, _3979);
            float _4077 = -_3349;
            float _4079 = fma(_3669, _4077, _3981);
            float _4081 = -_3349;
            float _4083 = fma(_3675, _4081, _3983);
            float _4085 = -_3349;
            float _4087 = fma(_3681, _4085, _3985);
            float _4089 = -_3349;
            float _4091 = fma(_3687, _4089, _3987);
            float _4093 = -_3349;
            float _4095 = fma(_3695, _4093, _3989);
            float _4097 = -_3349;
            float _4099 = fma(_3701, _4097, _3991);
            float _4101 = -_3349;
            float _4103 = fma(_3707, _4101, _3993);
            float _4105 = -_3349;
            float _4107 = fma(_3713, _4105, _3995);
            float _4109 = -_3349;
            float _4111 = fma(_3721, _4109, _3997);
            float _4113 = -_3349;
            float _4115 = fma(_3727, _4113, _3999);
            float _4117 = -_3349;
            float _4119 = fma(_3733, _4117, _4001);
            float _4121 = -_3349;
            float _4123 = fma(_3739, _4121, _4003);
            float _4125 = -_3349;
            float _4127 = fma(_3745, _4125, _4005);
            float _4129 = -_3349;
            float _4131 = fma(_3751, _4129, _4007);
            float _4133 = -_3349;
            float _4135 = fma(_3757, _4133, _4009);
            float _4137 = -_3349;
            float _4139 = fma(_3763, _4137, _4011);
            float _4141 = fma(_3767, _3947, _4015);
            float _4143 = fma(_3773, _3947, _4019);
            float _4145 = fma(_3779, _3947, _4023);
            float _4147 = fma(_3785, _3947, _4027);
            float _4149 = fma(_3789, _3947, _4031);
            float _4151 = fma(_3795, _3947, _4035);
            float _4153 = fma(_3801, _3947, _4039);
            float _4155 = fma(_3807, _3947, _4043);
            float _4157 = fma(_3811, _3947, _4047);
            float _4159 = fma(_3817, _3947, _4051);
            float _4161 = fma(_3823, _3947, _4055);
            float _4163 = fma(_3829, _3947, _4059);
            float _4165 = fma(_3833, _3947, _4063);
            float _4167 = fma(_3839, _3947, _4067);
            float _4169 = fma(_3845, _3947, _4071);
            float _4171 = fma(_3851, _3947, _4075);
            float _4173 = fma(_3855, _3947, _4079);
            float _4175 = fma(_3861, _3947, _4083);
            float _4177 = fma(_3867, _3947, _4087);
            float _4179 = fma(_3873, _3947, _4091);
            float _4181 = fma(_3877, _3947, _4095);
            float _4183 = fma(_3883, _3947, _4099);
            float _4185 = fma(_3889, _3947, _4103);
            float _4187 = fma(_3895, _3947, _4107);
            float _4189 = fma(_3899, _3947, _4111);
            float _4191 = fma(_3905, _3947, _4115);
            float _4193 = fma(_3911, _3947, _4119);
            float _4195 = fma(_3917, _3947, _4123);
            float _4197 = fma(_3921, _3947, _4127);
            float _4199 = fma(_3927, _3947, _4131);
            float _4201 = fma(_3933, _3947, _4135);
            float _4203 = fma(_3939, _3947, _4139);
            _2373 = _4155;
            _2375 = _4151;
            _2377 = _4183;
            _2379 = _4165;
            _2381 = _4149;
            _2383 = _4169;
            _2385 = _4185;
            _2387 = _4167;
            _2389 = _4171;
            _2391 = _4187;
            _2393 = _4153;
            _2395 = _4181;
            _2397 = _4199;
            _2399 = _4147;
            _2401 = _4197;
            _2403 = _4157;
            _2405 = _4159;
            _2407 = _4191;
            _2409 = _4141;
            _2411 = _4143;
            _2413 = _4145;
            _2415 = _4189;
            _2417 = _4201;
            _2419 = _4163;
            _2421 = _4173;
            _2423 = _4193;
            _2425 = _4203;
            _2427 = _4177;
            _2429 = _4179;
            _2431 = _4195;
            _2433 = _4161;
            _2435 = _4175;
            _2437 = true;
        }
        else
        {
            int _4205 = _1569 * 656;
            int _4207 = _4205 + 262144;
            int _4209 = _4205 + 262192;
            int _4211 = _4205 + 262160;
            uint _4213 = uint(int(uint(_4207) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4213)];
            float _4215 = as_type<float>(_dmw72.x);
            int _4217 = _4207 + 4;
            uint _4219 = uint(int(uint(_4217) >> uint(2)));
            float _4221 = as_type<float>(_dmw72.y);
            int _4223 = _4207 + 8;
            uint _4225 = uint(int(uint(_4223) >> uint(2)));
            float _4227 = as_type<float>(_dmw72.z);
            int _4229 = _4207 + 12;
            uint _4231 = uint(int(uint(_4229) >> uint(2)));
            float _4233 = as_type<float>(_dmw72.w);
            int _4235 = _4205 + 262208;
            uint _4237 = uint(int(uint(_4209) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4237)];
            float _4239 = as_type<float>(_dmw75.x);
            int _4241 = _4209 + 4;
            uint _4243 = uint(int(uint(_4241) >> uint(2)));
            float _4245 = as_type<float>(_dmw75.y);
            int _4247 = _4209 + 8;
            uint _4249 = uint(int(uint(_4247) >> uint(2)));
            float _4251 = as_type<float>(_dmw75.z);
            int _4253 = _4209 + 12;
            uint _4255 = uint(int(uint(_4253) >> uint(2)));
            float _4257 = as_type<float>(_dmw75.w);
            int _4259 = _4205 + 262176;
            uint _4261 = uint(int(uint(_4211) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4261)];
            float _4263 = as_type<float>(_dmw73.x);
            int _4265 = _4211 + 4;
            uint _4267 = uint(int(uint(_4265) >> uint(2)));
            float _4269 = as_type<float>(_dmw73.y);
            int _4271 = _4211 + 8;
            uint _4273 = uint(int(uint(_4271) >> uint(2)));
            float _4275 = as_type<float>(_dmw73.z);
            int _4277 = _4211 + 12;
            uint _4279 = uint(int(uint(_4277) >> uint(2)));
            float _4281 = as_type<float>(_dmw73.w);
            int _4283 = _4205 + 262224;
            uint _4285 = uint(int(uint(_4235) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4285)];
            float _4287 = as_type<float>(_dmw76.x);
            int _4289 = _4235 + 4;
            uint _4291 = uint(int(uint(_4289) >> uint(2)));
            float _4293 = as_type<float>(_dmw76.y);
            int _4295 = _4235 + 8;
            uint _4297 = uint(int(uint(_4295) >> uint(2)));
            float _4299 = as_type<float>(_dmw76.z);
            int _4301 = _4235 + 12;
            uint _4303 = uint(int(uint(_4301) >> uint(2)));
            float _4305 = as_type<float>(_dmw76.w);
            int _4307 = _4205 + 262240;
            uint _4309 = uint(int(uint(_4259) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4309)];
            float _4311 = as_type<float>(_dmw74.x);
            int _4313 = _4259 + 4;
            uint _4315 = uint(int(uint(_4313) >> uint(2)));
            float _4317 = as_type<float>(_dmw74.y);
            int _4319 = _4259 + 8;
            uint _4321 = uint(int(uint(_4319) >> uint(2)));
            float _4323 = as_type<float>(_dmw74.z);
            int _4325 = _4259 + 12;
            uint _4327 = uint(int(uint(_4325) >> uint(2)));
            float _4329 = as_type<float>(_dmw74.w);
            int _4331 = _4205 + 262256;
            uint _4333 = uint(int(uint(_4283) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4333)];
            float _4335 = as_type<float>(_dmw77.x);
            int _4337 = _4283 + 4;
            uint _4339 = uint(int(uint(_4337) >> uint(2)));
            float _4341 = as_type<float>(_dmw77.y);
            int _4343 = _4283 + 8;
            uint _4345 = uint(int(uint(_4343) >> uint(2)));
            float _4347 = as_type<float>(_dmw77.z);
            int _4349 = _4283 + 12;
            uint _4351 = uint(int(uint(_4349) >> uint(2)));
            float _4353 = as_type<float>(_dmw77.w);
            int _4355 = _1523 * 656;
            uint _4357 = uint(int(uint(_4307) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4357)];
            float _4359 = as_type<float>(_dmw78.x);
            int _4361 = _4307 + 4;
            uint _4363 = uint(int(uint(_4361) >> uint(2)));
            float _4365 = as_type<float>(_dmw78.y);
            int _4367 = _4307 + 8;
            uint _4369 = uint(int(uint(_4367) >> uint(2)));
            float _4371 = as_type<float>(_dmw78.z);
            int _4373 = _4307 + 12;
            uint _4375 = uint(int(uint(_4373) >> uint(2)));
            float _4377 = as_type<float>(_dmw78.w);
            int _4379 = _1573 * 656;
            int _4381 = _4355 + 262144;
            uint _4383 = uint(int(uint(_4331) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4383)];
            float _4385 = as_type<float>(_dmw79.x);
            int _4387 = _4331 + 4;
            uint _4389 = uint(int(uint(_4387) >> uint(2)));
            float _4391 = as_type<float>(_dmw79.y);
            int _4393 = _4331 + 8;
            uint _4395 = uint(int(uint(_4393) >> uint(2)));
            float _4397 = as_type<float>(_dmw79.z);
            int _4399 = _4331 + 12;
            uint _4401 = uint(int(uint(_4399) >> uint(2)));
            float _4403 = as_type<float>(_dmw79.w);
            int _4405 = _4355 + 262192;
            int _4407 = _4355 + 262160;
            uint _4409 = uint(int(uint(_4381) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4409)];
            float _4411 = as_type<float>(_dmw80.x);
            int _4413 = _4381 + 4;
            uint _4415 = uint(int(uint(_4413) >> uint(2)));
            float _4417 = as_type<float>(_dmw80.y);
            int _4419 = _4381 + 8;
            uint _4421 = uint(int(uint(_4419) >> uint(2)));
            float _4423 = as_type<float>(_dmw80.z);
            int _4425 = _4381 + 12;
            uint _4427 = uint(int(uint(_4425) >> uint(2)));
            float _4429 = as_type<float>(_dmw80.w);
            int _4431 = _4355 + 262208;
            int _4433 = _4355 + 262176;
            uint _4435 = uint(int(uint(_4405) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4435)];
            float _4437 = as_type<float>(_dmw83.x);
            int _4439 = _4405 + 4;
            uint _4441 = uint(int(uint(_4439) >> uint(2)));
            float _4443 = as_type<float>(_dmw83.y);
            int _4445 = _4405 + 8;
            uint _4447 = uint(int(uint(_4445) >> uint(2)));
            float _4449 = as_type<float>(_dmw83.z);
            int _4451 = _4405 + 12;
            uint _4453 = uint(int(uint(_4451) >> uint(2)));
            float _4455 = as_type<float>(_dmw83.w);
            int _4457 = _4355 + 262224;
            int _4459 = _4355 + 262240;
            uint _4461 = uint(int(uint(_4407) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4461)];
            float _4463 = as_type<float>(_dmw81.x);
            int _4465 = _4407 + 4;
            uint _4467 = uint(int(uint(_4465) >> uint(2)));
            float _4469 = as_type<float>(_dmw81.y);
            int _4471 = _4407 + 8;
            uint _4473 = uint(int(uint(_4471) >> uint(2)));
            float _4475 = as_type<float>(_dmw81.z);
            int _4477 = _4407 + 12;
            uint _4479 = uint(int(uint(_4477) >> uint(2)));
            float _4481 = as_type<float>(_dmw81.w);
            int _4483 = _4355 + 262256;
            int _4485 = _4379 + 262144;
            uint _4487 = uint(int(uint(_4431) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4487)];
            float _4489 = as_type<float>(_dmw84.x);
            int _4491 = _4431 + 4;
            uint _4493 = uint(int(uint(_4491) >> uint(2)));
            float _4495 = as_type<float>(_dmw84.y);
            int _4497 = _4431 + 8;
            uint _4499 = uint(int(uint(_4497) >> uint(2)));
            float _4501 = as_type<float>(_dmw84.z);
            int _4503 = _4431 + 12;
            uint _4505 = uint(int(uint(_4503) >> uint(2)));
            float _4507 = as_type<float>(_dmw84.w);
            int _4509 = _4379 + 262192;
            int _4511 = _4379 + 262160;
            uint _4513 = uint(int(uint(_4433) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4513)];
            float _4515 = as_type<float>(_dmw82.x);
            int _4517 = _4433 + 4;
            uint _4519 = uint(int(uint(_4517) >> uint(2)));
            float _4521 = as_type<float>(_dmw82.y);
            int _4523 = _4433 + 8;
            uint _4525 = uint(int(uint(_4523) >> uint(2)));
            float _4527 = as_type<float>(_dmw82.z);
            int _4529 = _4433 + 12;
            uint _4531 = uint(int(uint(_4529) >> uint(2)));
            float _4533 = as_type<float>(_dmw82.w);
            int _4535 = _4379 + 262208;
            int _4537 = _4379 + 262176;
            uint _4539 = uint(int(uint(_4457) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4539)];
            float _4541 = as_type<float>(_dmw85.x);
            int _4543 = _4457 + 4;
            uint _4545 = uint(int(uint(_4543) >> uint(2)));
            float _4547 = as_type<float>(_dmw85.y);
            int _4549 = _4457 + 8;
            uint _4551 = uint(int(uint(_4549) >> uint(2)));
            float _4553 = as_type<float>(_dmw85.z);
            int _4555 = _4457 + 12;
            uint _4557 = uint(int(uint(_4555) >> uint(2)));
            float _4559 = as_type<float>(_dmw85.w);
            int _4561 = _4379 + 262224;
            int _4563 = _4379 + 262240;
            uint _4565 = uint(int(uint(_4459) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4565)];
            float _4567 = as_type<float>(_dmw86.x);
            int _4569 = _4459 + 4;
            uint _4571 = uint(int(uint(_4569) >> uint(2)));
            float _4573 = as_type<float>(_dmw86.y);
            int _4575 = _4459 + 8;
            uint _4577 = uint(int(uint(_4575) >> uint(2)));
            float _4579 = as_type<float>(_dmw86.z);
            int _4581 = _4459 + 12;
            uint _4583 = uint(int(uint(_4581) >> uint(2)));
            float _4585 = as_type<float>(_dmw86.w);
            int _4587 = _4379 + 262256;
            uint _4589 = uint(int(uint(_4483) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4589)];
            float _4591 = as_type<float>(_dmw87.x);
            int _4593 = _4483 + 4;
            uint _4595 = uint(int(uint(_4593) >> uint(2)));
            float _4597 = as_type<float>(_dmw87.y);
            int _4599 = _4483 + 8;
            uint _4601 = uint(int(uint(_4599) >> uint(2)));
            float _4603 = as_type<float>(_dmw87.z);
            int _4605 = _4483 + 12;
            uint _4607 = uint(int(uint(_4605) >> uint(2)));
            float _4609 = as_type<float>(_dmw87.w);
            uint _4611 = uint(int(uint(_4485) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4611)];
            float _4613 = as_type<float>(_dmw88.x);
            int _4615 = _4485 + 4;
            uint _4617 = uint(int(uint(_4615) >> uint(2)));
            float _4619 = as_type<float>(_dmw88.y);
            int _4621 = _4485 + 8;
            uint _4623 = uint(int(uint(_4621) >> uint(2)));
            float _4625 = as_type<float>(_dmw88.z);
            int _4627 = _4485 + 12;
            uint _4629 = uint(int(uint(_4627) >> uint(2)));
            float _4631 = as_type<float>(_dmw88.w);
            uint _4633 = uint(int(uint(_4509) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4633)];
            float _4635 = as_type<float>(_dmw91.x);
            int _4637 = _4509 + 4;
            uint _4639 = uint(int(uint(_4637) >> uint(2)));
            float _4641 = as_type<float>(_dmw91.y);
            int _4643 = _4509 + 8;
            uint _4645 = uint(int(uint(_4643) >> uint(2)));
            float _4647 = as_type<float>(_dmw91.z);
            int _4649 = _4509 + 12;
            uint _4651 = uint(int(uint(_4649) >> uint(2)));
            float _4653 = as_type<float>(_dmw91.w);
            uint _4655 = uint(int(uint(_4511) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4655)];
            float _4657 = as_type<float>(_dmw89.x);
            int _4659 = _4511 + 4;
            uint _4661 = uint(int(uint(_4659) >> uint(2)));
            float _4663 = as_type<float>(_dmw89.y);
            int _4665 = _4511 + 8;
            uint _4667 = uint(int(uint(_4665) >> uint(2)));
            float _4669 = as_type<float>(_dmw89.z);
            int _4671 = _4511 + 12;
            uint _4673 = uint(int(uint(_4671) >> uint(2)));
            float _4675 = as_type<float>(_dmw89.w);
            uint _4677 = uint(int(uint(_4535) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4677)];
            float _4679 = as_type<float>(_dmw92.x);
            int _4681 = _4535 + 4;
            uint _4683 = uint(int(uint(_4681) >> uint(2)));
            float _4685 = as_type<float>(_dmw92.y);
            int _4687 = _4535 + 8;
            uint _4689 = uint(int(uint(_4687) >> uint(2)));
            float _4691 = as_type<float>(_dmw92.z);
            int _4693 = _4535 + 12;
            uint _4695 = uint(int(uint(_4693) >> uint(2)));
            float _4697 = as_type<float>(_dmw92.w);
            uint _4699 = uint(int(uint(_4537) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4699)];
            float _4701 = as_type<float>(_dmw90.x);
            int _4703 = _4537 + 4;
            uint _4705 = uint(int(uint(_4703) >> uint(2)));
            float _4707 = as_type<float>(_dmw90.y);
            int _4709 = _4537 + 8;
            uint _4711 = uint(int(uint(_4709) >> uint(2)));
            float _4713 = as_type<float>(_dmw90.z);
            int _4715 = _4537 + 12;
            uint _4717 = uint(int(uint(_4715) >> uint(2)));
            float _4719 = as_type<float>(_dmw90.w);
            uint _4721 = uint(int(uint(_4561) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4721)];
            float _4723 = as_type<float>(_dmw93.x);
            int _4725 = _4561 + 4;
            uint _4727 = uint(int(uint(_4725) >> uint(2)));
            float _4729 = as_type<float>(_dmw93.y);
            int _4731 = _4561 + 8;
            uint _4733 = uint(int(uint(_4731) >> uint(2)));
            float _4735 = as_type<float>(_dmw93.z);
            int _4737 = _4561 + 12;
            uint _4739 = uint(int(uint(_4737) >> uint(2)));
            float _4741 = as_type<float>(_dmw93.w);
            uint _4743 = uint(int(uint(_4563) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4743)];
            float _4745 = as_type<float>(_dmw94.x);
            int _4747 = _4563 + 4;
            uint _4749 = uint(int(uint(_4747) >> uint(2)));
            float _4751 = as_type<float>(_dmw94.y);
            int _4753 = _4563 + 8;
            uint _4755 = uint(int(uint(_4753) >> uint(2)));
            float _4757 = as_type<float>(_dmw94.z);
            int _4759 = _4563 + 12;
            uint _4761 = uint(int(uint(_4759) >> uint(2)));
            float _4763 = as_type<float>(_dmw94.w);
            uint _4765 = uint(int(uint(_4587) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4765)];
            float _4767 = as_type<float>(_dmw95.x);
            int _4769 = _4587 + 4;
            uint _4771 = uint(int(uint(_4769) >> uint(2)));
            float _4773 = as_type<float>(_dmw95.y);
            int _4775 = _4587 + 8;
            uint _4777 = uint(int(uint(_4775) >> uint(2)));
            float _4779 = as_type<float>(_dmw95.z);
            int _4781 = _4587 + 12;
            uint _4783 = uint(int(uint(_4781) >> uint(2)));
            float _4785 = as_type<float>(_dmw95.w);
            float _4787 = -_3349;
            float _4789 = _4787 + _3351;
            float _4791 = -_4789;
            float _4793 = _1519 + _4791;
            float _4795 = _4215 * _4789;
            float _4797 = _4221 * _4789;
            float _4799 = _4227 * _4789;
            float _4801 = _4233 * _4789;
            float _4803 = _4239 * _4789;
            float _4805 = _4245 * _4789;
            float _4807 = _4251 * _4789;
            float _4809 = _4257 * _4789;
            float _4811 = _4263 * _4789;
            float _4813 = _4269 * _4789;
            float _4815 = _4275 * _4789;
            float _4817 = _4281 * _4789;
            float _4819 = _4287 * _4789;
            float _4821 = _4293 * _4789;
            float _4823 = _4299 * _4789;
            float _4825 = _4305 * _4789;
            float _4827 = _4311 * _4789;
            float _4829 = _4317 * _4789;
            float _4831 = _4323 * _4789;
            float _4833 = _4329 * _4789;
            float _4835 = _4335 * _4789;
            float _4837 = _4341 * _4789;
            float _4839 = _4347 * _4789;
            float _4841 = _4353 * _4789;
            float _4843 = _4359 * _4789;
            float _4845 = _4365 * _4789;
            float _4847 = _4371 * _4789;
            float _4849 = _4377 * _4789;
            float _4851 = _4385 * _4789;
            float _4853 = _4391 * _4789;
            float _4855 = _4397 * _4789;
            float _4857 = _4403 * _4789;
            float _4859 = -_3351;
            float _4861 = fma(_4411, _4859, _4795);
            float _4863 = -_3351;
            float _4865 = fma(_4417, _4863, _4797);
            float _4867 = -_3351;
            float _4869 = fma(_4423, _4867, _4799);
            float _4871 = -_3351;
            float _4873 = fma(_4429, _4871, _4801);
            float _4875 = -_3351;
            float _4877 = fma(_4437, _4875, _4803);
            float _4879 = -_3351;
            float _4881 = fma(_4443, _4879, _4805);
            float _4883 = -_3351;
            float _4885 = fma(_4449, _4883, _4807);
            float _4887 = -_3351;
            float _4889 = fma(_4455, _4887, _4809);
            float _4891 = -_3351;
            float _4893 = fma(_4463, _4891, _4811);
            float _4895 = -_3351;
            float _4897 = fma(_4469, _4895, _4813);
            float _4899 = -_3351;
            float _4901 = fma(_4475, _4899, _4815);
            float _4903 = -_3351;
            float _4905 = fma(_4481, _4903, _4817);
            float _4907 = -_3351;
            float _4909 = fma(_4489, _4907, _4819);
            float _4911 = -_3351;
            float _4913 = fma(_4495, _4911, _4821);
            float _4915 = -_3351;
            float _4917 = fma(_4501, _4915, _4823);
            float _4919 = -_3351;
            float _4921 = fma(_4507, _4919, _4825);
            float _4923 = -_3351;
            float _4925 = fma(_4515, _4923, _4827);
            float _4927 = -_3351;
            float _4929 = fma(_4521, _4927, _4829);
            float _4931 = -_3351;
            float _4933 = fma(_4527, _4931, _4831);
            float _4935 = -_3351;
            float _4937 = fma(_4533, _4935, _4833);
            float _4939 = -_3351;
            float _4941 = fma(_4541, _4939, _4835);
            float _4943 = -_3351;
            float _4945 = fma(_4547, _4943, _4837);
            float _4947 = -_3351;
            float _4949 = fma(_4553, _4947, _4839);
            float _4951 = -_3351;
            float _4953 = fma(_4559, _4951, _4841);
            float _4955 = -_3351;
            float _4957 = fma(_4567, _4955, _4843);
            float _4959 = -_3351;
            float _4961 = fma(_4573, _4959, _4845);
            float _4963 = -_3351;
            float _4965 = fma(_4579, _4963, _4847);
            float _4967 = -_3351;
            float _4969 = fma(_4585, _4967, _4849);
            float _4971 = -_3351;
            float _4973 = fma(_4591, _4971, _4851);
            float _4975 = -_3351;
            float _4977 = fma(_4597, _4975, _4853);
            float _4979 = -_3351;
            float _4981 = fma(_4603, _4979, _4855);
            float _4983 = -_3351;
            float _4985 = fma(_4609, _4983, _4857);
            float _4987 = fma(_4613, _4793, _4861);
            float _4989 = fma(_4619, _4793, _4865);
            float _4991 = fma(_4625, _4793, _4869);
            float _4993 = fma(_4631, _4793, _4873);
            float _4995 = fma(_4635, _4793, _4877);
            float _4997 = fma(_4641, _4793, _4881);
            float _4999 = fma(_4647, _4793, _4885);
            float _5001 = fma(_4653, _4793, _4889);
            float _5003 = fma(_4657, _4793, _4893);
            float _5005 = fma(_4663, _4793, _4897);
            float _5007 = fma(_4669, _4793, _4901);
            float _5009 = fma(_4675, _4793, _4905);
            float _5011 = fma(_4679, _4793, _4909);
            float _5013 = fma(_4685, _4793, _4913);
            float _5015 = fma(_4691, _4793, _4917);
            float _5017 = fma(_4697, _4793, _4921);
            float _5019 = fma(_4701, _4793, _4925);
            float _5021 = fma(_4707, _4793, _4929);
            float _5023 = fma(_4713, _4793, _4933);
            float _5025 = fma(_4719, _4793, _4937);
            float _5027 = fma(_4723, _4793, _4941);
            float _5029 = fma(_4729, _4793, _4945);
            float _5031 = fma(_4735, _4793, _4949);
            float _5033 = fma(_4741, _4793, _4953);
            float _5035 = fma(_4745, _4793, _4957);
            float _5037 = fma(_4751, _4793, _4961);
            float _5039 = fma(_4757, _4793, _4965);
            float _5041 = fma(_4763, _4793, _4969);
            float _5043 = fma(_4767, _4793, _4973);
            float _5045 = fma(_4773, _4793, _4977);
            float _5047 = fma(_4779, _4793, _4981);
            float _5049 = fma(_4785, _4793, _4985);
            _2373 = _5001;
            _2375 = _4997;
            _2377 = _5029;
            _2379 = _5011;
            _2381 = _4995;
            _2383 = _5015;
            _2385 = _5031;
            _2387 = _5013;
            _2389 = _5017;
            _2391 = _5033;
            _2393 = _4999;
            _2395 = _5027;
            _2397 = _5045;
            _2399 = _4993;
            _2401 = _5043;
            _2403 = _5003;
            _2405 = _5005;
            _2407 = _5037;
            _2409 = _4987;
            _2411 = _4989;
            _2413 = _4991;
            _2415 = _5035;
            _2417 = _5047;
            _2419 = _5009;
            _2421 = _5019;
            _2423 = _5039;
            _2425 = _5049;
            _2427 = _5023;
            _2429 = _5025;
            _2431 = _5041;
            _2433 = _5007;
            _2435 = _5021;
        }
    }
    _2437 = false;
    float _5051 = _2373;
    float _5053 = _2375;
    float _5055 = _2377;
    float _5057 = _2379;
    float _5059 = _2381;
    float _5061 = _2383;
    float _5063 = _2385;
    float _5065 = _2387;
    float _5067 = _2389;
    float _5069 = _2391;
    float _5071 = _2393;
    float _5073 = _2395;
    float _5075 = _2397;
    float _5077 = _2399;
    float _5079 = _2401;
    float _5081 = _2403;
    float _5083 = _2405;
    float _5085 = _2407;
    float _5087 = _2409;
    float _5089 = _2411;
    float _5091 = _2413;
    float _5093 = _2415;
    float _5095 = _2417;
    float _5097 = _2419;
    float _5099 = _2421;
    float _5101 = _2423;
    float _5103 = _2425;
    float _5105 = _2427;
    float _5107 = _2429;
    float _5109 = _2431;
    float _5111 = _2433;
    float _5113 = _2435;
    float _5115 = _5051 * 0.511664927005767822265625;
    float _5117 = _5053 * 0.88622760772705078125;
    float _5119 = _5055 * 0.511664927005767822265625;
    float _5121 = _5057 * 0.511664927005767822265625;
    float _5123 = _5115 * _5115;
    float _5125 = _5059 * 0.88622760772705078125;
    float _5127 = _5061 * 0.511664927005767822265625;
    float _5129 = precise::max(_5117, 0.00999999977648258209228515625);
    float _5131 = fma(_5119, _5119, _5123);
    float _5133 = _5063 * 0.511664927005767822265625;
    float _5135 = _5121 * _5121;
    float _5137 = _5065 * 0.511664927005767822265625;
    float _5139 = precise::max(_5125, 0.00999999977648258209228515625);
    float _5141 = fma(_5127, _5127, _5131);
    float _5143 = 1.0 / _5129;
    float _5145 = _5067 * 0.511664927005767822265625;
    float _5147 = fma(_5133, _5133, _5135);
    float _5149 = _5069 * 0.511664927005767822265625;
    float _5151 = _5071 * 0.88622760772705078125;
    float _5153 = _5073 * 0.511664927005767822265625;
    float _5155 = 1.0 / _5139;
    float _5157 = _5137 * _5137;
    float _5159 = precise::max(_5151, 0.00999999977648258209228515625);
    float _5161 = fma(_1465, 1.9073486328125, 0.5);
    float _5163 = fma(_5149, _5149, _5157);
    float _5165 = sqrt(_5141);
    float _5167 = fma(_5145, _5145, _5147);
    float _5169 = fma(_5153, _5153, _5163);
    float _5171 = _1465 * 3.903682708740234375;
    float _5173 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5175 = _5173 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5177 = _5171 * _5075;
    float _5179 = sqrt(_5167);
    float _5181 = _5171 * _5077;
    float _5183 = fma(_5079, 0.88622701168060302734375, _5177);
    float _5185 = _5171 * _5081;
    float _5187 = _5171 * _5083;
    float _5189 = _5171 * _5085;
    float _5191 = fma(_5087, 0.88622701168060302734375, _5181);
    float _5193 = 1.0 / _5159;
    float _5195 = precise::max(_5165, 0.00999999977648258209228515625);
    float _5197 = fma(_5089, 0.88622701168060302734375, _5185);
    float _5199 = fma(_5091, 0.88622701168060302734375, _5187);
    float _5201 = fma(_5093, 0.88622701168060302734375, _5189);
    float _5203 = sqrt(_5169);
    float _5205 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5207 = _5205 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5209 = precise::max(_5179, 0.00999999977648258209228515625);
    int _5211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5213 = _5211 != 0;
    float _5215 = fma(_5161, _5207, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5217 = 1.0 / _5195;
    float _5219 = _5209 * _5143;
    float _5221 = precise::clamp(_5219, 0.0, 1.0);
    float _5223 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5225 = _5223 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5227 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5229 = _5227 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5231 = fma(_5161, _5225, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5233 = precise::max(_5203, 0.00999999977648258209228515625);
    float _5235 = 1.0 / _5209;
    float _5237 = fma(_5161, _5229, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5239 = _5231 * 0.715200006961822509765625;
    float _5241 = _5195 * _5155;
    float _5243 = precise::clamp(_5241, 0.0, 1.0);
    float _5245 = _5233 * _5193;
    float _5247 = precise::clamp(_5245, 0.0, 1.0);
    float _5249 = _5221 + 1.0;
    float _5251 = fma(_5215, 0.2125999927520751953125, _5239);
    float _5253 = _5119 * _5217;
    float _5255 = 1.0 / _5233;
    float _5257 = _5115 * _5217;
    float _5259 = fma(_5237, 0.072200000286102294921875, _5251);
    float _5261 = _5243 + 1.0;
    float _5263 = 1.0 / _5259;
    float _5265 = _5121 * _5235;
    float _5267 = _5127 * _5217;
    float _5269 = _5133 * _5235;
    float _5271 = _5145 * _5235;
    float _5273 = _1527 * _5265;
    float _5275 = _5137 * _5255;
    float _5277 = _1527 * _5257;
    float _5279 = _5149 * _5255;
    float _5281 = -_1511;
    float _5283 = fma(_5281, _5269, _5273);
    float _5285 = _1527 * _5275;
    float _5287 = -_1511;
    float _5289 = fma(_5287, _5253, _5277);
    float _5291 = _5153 * _5255;
    float _5293 = -_1525;
    float _5295 = fma(_5293, _5271, _5283);
    float _5297 = -_1511;
    float _5299 = fma(_5297, _5279, _5285);
    float _5301 = -_1525;
    float _5303 = fma(_5301, _5267, _5289);
    float _5305 = _5247 + 1.0;
    float _5307 = fma(_5295, 0.5, 0.5);
    float _5309 = -_1525;
    float _5311 = fma(_5309, _5291, _5299);
    float _5313 = fma(_5303, 0.5, 0.5);
    float _5315 = 1.0 / _5305;
    float _5317 = fma(_5311, 0.5, 0.5);
    float _5319 = _5263 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5321 = precise::clamp(_5319, 0.0, 1.0);
    float _5323 = _1525 * (-1.02332699298858642578125);
    float _5325 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5327 = _5325 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5329 = fma(_5321, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5331 = abs(_5313);
    float _5333 = log2(_5331);
    float _5335 = fma(_5161, _5175, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5337 = fma(_5323, _5095, _5183);
    float _5339 = fma(_5161, _5327, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5341 = fma(_5323, _5097, _5197);
    float _5343 = fma(_5323, _5099, _5199);
    float _5345 = fma(_5323, _5101, _5201);
    float _5347 = _5231 * _5329;
    float _5349 = abs(_5307);
    float _5351 = log2(_5349);
    float _5353 = _1511 * (-1.02332699298858642578125);
    float _5355 = fma(_5353, _5103, _5337);
    float _5357 = fma(_5353, _5105, _5341);
    float _5359 = fma(_5353, _5107, _5343);
    float _5361 = abs(_5317);
    float _5363 = log2(_5361);
    float _5365 = fma(_5353, _5109, _5345);
    float _5367 = precise::max(0.0, _5355);
    float _5369 = precise::max(0.0, _5357);
    float _5371 = precise::max(0.0, _5359);
    float _5373 = _5367 * 0.31830990314483642578125;
    float _5375 = precise::clamp(_5373, 0.0, 1.0);
    float _5377 = 1.0 / _5249;
    float _5379 = precise::max(0.0, _5365);
    float _5381 = _5369 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5383 = -_5375;
    float _5385 = _5383 + 1.0;
    float _5387 = _5371 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5389 = _5379 * 0.31830990314483642578125;
    float _5391 = precise::clamp(_5389, 0.0, 1.0);
    float _5393 = fma(_5385, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5375);
    float _5395 = 1.0 / _5261;
    float _5397 = fma(_5243, 2.0, 1.0);
    float _5399 = _5237 * _5329;
    float _5401 = precise::max(_5381, _5347);
    float _5403 = _5391 * 0.88622701168060302734375;
    float _5405 = _5397 * _5333;
    float _5407 = fma(_5221, 2.0, 1.0);
    float _5409 = precise::max(_5387, _5399);
    float _5411 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5401);
    float _5413 = _5407 * _5351;
    float _5415 = fma(_5247, 2.0, 1.0);
    float _5417 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5409);
    float _5419 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5421 = _5419 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5423 = _5415 * _5363;
    float _5425 = exp2(_5413);
    float _5427 = -_5243;
    float _5429 = _5427 + 1.0;
    float _5431 = fma(_5161, _5421, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5433 = fma(_5243, 2.0, 2.0);
    float _5435 = -_5221;
    float _5437 = _5435 + 1.0;
    float _5439 = fma(_5221, 2.0, 2.0);
    float _5441 = fma(_5323, _5111, _5191);
    float _5443 = _5429 * _5395;
    float _5445 = exp2(_5405);
    float _5447 = _5437 * _5377;
    float _5449 = fma(_5353, _5113, _5441);
    float _5451 = precise::max(0.0, _5449);
    float _5453 = exp2(_5423);
    float _5455 = fma(_5247, 2.0, 2.0);
    float _5457 = -_5247;
    float _5459 = _5457 + 1.0;
    float _5461 = _5439 * _5425;
    float _5463 = _5451 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5465 = _5459 * _5315;
    float _5467 = _5215 * _5329;
    float _5469 = _5433 * _5445;
    float _5471 = -_5461;
    float _5473 = _5471 + 1.0;
    float _5475 = -_5469;
    float _5477 = _5475 + 1.0;
    float _5479 = fma(_5447, _5473, _5461);
    float _5481 = precise::max(_5463, _5467);
    float _5483 = _5455 * _5453;
    float _5485 = fma(_5443, _5477, _5469);
    float _5487 = _5117 * _5479;
    float _5489 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5481);
    float _5491 = -_5483;
    float _5493 = _5491 + 1.0;
    float _5495 = _5125 * _5485;
    float _5497 = fma(_5465, _5493, _5483);
    float _5499 = _5495 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5501 = _5487 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5503 = _5151 * _5497;
    float _5505 = precise::max(_5499, _5339);
    float _5507 = _5503 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5509 = precise::max(_5501, _5431);
    float _5511 = fma(_5505, _5393, _5489);
    float _5513 = precise::max(_5507, _5335);
    float _5515 = fma(_5509, _5393, _5411);
    float _5517 = fma(_5513, _5393, _5417);
    bool _5519 = !_5213;
    float _5521;
    float _5523;
    float _5525;
    float _5527;
    float _5529;
    float _5531;
    float _5533;
    float _5535;
    float _5537;
    float _5539;
    int _5541;
    float _5543;
    float _5545;
    float _5547;
    float _5549;
    float _5551;
    float _5553;
    float _5555;
    int _5557;
    float _5559;
    int _5561;
    float _5563;
    int _5565;
    int _5567;
    int _5569;
    float _5571;
    float _5573;
    int _5575;
    float _5577;
    int _5579;
    int _5581;
    float _5583;
    if (!_5519)
    {
        _5521 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5523 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5525 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5527 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5529 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5531 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5533 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5535 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5537 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5539 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5543 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5545 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5547 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5549 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5551 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5553 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5555 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5559 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5563 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5571 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5573 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5577 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5583 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5585 = true;
    }
    else
    {
        float _5587 = fma(_1057, 6.2500002968590706586837768554688e-05, 0.5);
        float _5589 = fma(_1055, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14865 = float3(_5587, _5589, float(0));
        float3 _14867 = select(_14865, float3(0.0), isnan(_14865));
        float4 _5591 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14867.xy, uint(rint(_14867.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14867.xy, uint(rint(_14867.z)), level(0.0)).xyzw;
        float _5593 = _5591.x;
        float _5595 = _5591.y;
        float _5597 = _5591.z;
        float _5599 = _5591.w;
        float3 _14882 = float3(_5587, _5589, float(1));
        float3 _14884 = select(_14882, float3(0.0), isnan(_14882));
        float4 _5601 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14884.xy, uint(rint(_14884.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14884.xy, uint(rint(_14884.z)), level(0.0)).xyzw;
        float _5603 = _5601.x;
        float _5605 = _5601.y;
        float _5607 = _5601.z;
        float _5609 = _5601.w;
        float3 _14899 = float3(_5587, _5589, float(2));
        float3 _14901 = select(_14899, float3(0.0), isnan(_14899));
        float4 _5611 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14901.xy, uint(rint(_14901.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14901.xy, uint(rint(_14901.z)), level(0.0)).xyzw;
        float _5613 = _5611.x;
        float _5615 = _5611.y;
        float _5617 = _5611.z;
        float _5619 = _5611.w;
        float3 _14916 = float3(_5587, _5589, float(3));
        float3 _14918 = select(_14916, float3(0.0), isnan(_14916));
        float4 _5621 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14918.xy, uint(rint(_14918.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14918.xy, uint(rint(_14918.z)), level(0.0)).xyzw;
        float _5623 = _5621.x;
        float _5625 = _5621.y;
        float _5627 = _5621.z;
        float _5629 = _5621.w;
        float3 _14933 = float3(_5587, _5589, float(4));
        float3 _14935 = select(_14933, float3(0.0), isnan(_14933));
        float4 _5631 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14935.xy, uint(rint(_14935.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14935.xy, uint(rint(_14935.z)), level(0.0)).xyzw;
        float _5633 = _5631.x;
        float _5635 = _5631.y;
        float _5637 = _5631.z;
        float _5639 = _5631.w;
        float3 _14950 = float3(_5587, _5589, float(5));
        float3 _14952 = select(_14950, float3(0.0), isnan(_14950));
        float4 _5641 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14952.xy, uint(rint(_14952.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14952.xy, uint(rint(_14952.z)), level(0.0)).xyzw;
        float _5643 = _5641.x;
        float _5645 = _5641.y;
        float _5647 = _5641.z;
        float _5649 = _5641.w;
        float3 _14967 = float3(_5587, _5589, float(6));
        float3 _14969 = select(_14967, float3(0.0), isnan(_14967));
        float4 _5651 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14969.xy, uint(rint(_14969.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14969.xy, uint(rint(_14969.z)), level(0.0)).xyzw;
        float _5653 = _5651.x;
        float _5655 = _5651.y;
        float _5657 = _5651.z;
        float _5659 = _5651.w;
        float3 _14984 = float3(_5587, _5589, float(7));
        float3 _14986 = select(_14984, float3(0.0), isnan(_14984));
        float4 _5661 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14986.xy, uint(rint(_14986.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14986.xy, uint(rint(_14986.z)), level(0.0)).xyzw;
        float _5663 = _5661.x;
        float _5665 = _5661.y;
        float _5667 = _5661.z;
        float _5669 = _5661.w;
        _5521 = _5655;
        _5523 = _5665;
        _5525 = _5623;
        _5527 = _5625;
        _5529 = _5653;
        _5531 = _5663;
        _5533 = _5599;
        _5535 = _5657;
        _5537 = _5627;
        _5539 = _5667;
        _5541 = as_type<int>(_5629);
        _5543 = _5659;
        _5545 = _5593;
        _5547 = _5603;
        _5549 = _5605;
        _5551 = _5669;
        _5553 = _5595;
        _5555 = _5597;
        _5557 = as_type<int>(_5635);
        _5559 = _5609;
        _5561 = as_type<int>(_5633);
        _5563 = _5607;
        _5565 = as_type<int>(_5637);
        _5567 = as_type<int>(_5639);
        _5569 = as_type<int>(_5643);
        _5571 = _5615;
        _5573 = _5613;
        _5575 = as_type<int>(_5645);
        _5577 = _5617;
        _5579 = as_type<int>(_5649);
        _5581 = as_type<int>(_5647);
        _5583 = _5619;
    }
    _5585 = false;
    float _5671 = _5521;
    float _5673 = _5523;
    float _5675 = _5525;
    float _5677 = _5527;
    float _5679 = _5529;
    float _5681 = _5531;
    float _5683 = _5533;
    float _5685 = _5535;
    float _5687 = _5537;
    float _5689 = _5539;
    int _5691 = _5541;
    float _5693 = _5543;
    float _5695 = _5545;
    float _5697 = _5547;
    float _5699 = _5549;
    float _5701 = _5551;
    float _5703 = _5553;
    float _5705 = _5555;
    int _5707 = _5557;
    float _5709 = _5559;
    int _5711 = _5561;
    float _5713 = _5563;
    int _5715 = _5565;
    int _5717 = _5567;
    int _5719 = _5569;
    float _5721 = _5571;
    float _5723 = _5573;
    int _5725 = _5575;
    float _5727 = _5577;
    int _5729 = _5579;
    int _5731 = _5581;
    float _5733 = _5583;
    float _5735 = _5171 * _5671;
    float _5737 = _5171 * _5673;
    float _5739 = _5675 * 0.88622701168060302734375;
    float _5741 = _5677 * 0.88622701168060302734375;
    float _5743 = fma(_5679, 0.88622701168060302734375, _5735);
    float _5745 = fma(_5681, 0.88622701168060302734375, _5737);
    float _5747 = _5171 * _5683;
    out.m_54.x = _1431;
    out.m_54.y = _1435;
    float _5749 = fma(_5323, _5685, _5743);
    float _5751 = _5687 * 0.88622701168060302734375;
    float _5753 = fma(_5323, _5689, _5745);
    float _5755 = _5213 ? as_type<float>(_5691) : 0.0;
    float _5757 = fma(_5353, _5693, _5749);
    out.m_56.x = _1057;
    out.m_56.y = _1161;
    out.m_56.z = _1055;
    float _5759 = fma(_5695, 0.88622701168060302734375, _5747);
    float _5761 = _5171 * _5697;
    float _5763 = _5171 * _5699;
    float _5765 = _5213 ? _5739 : 0.0;
    float _5767 = fma(_5353, _5701, _5753);
    float _5769 = _5213 ? _5741 : 0.0;
    float _5771 = fma(_5703, 0.88622701168060302734375, _5761);
    float _5773 = precise::max(0.0, _5757);
    float _5775 = fma(_5705, 0.88622701168060302734375, _5763);
    float _5777 = _5213 ? as_type<float>(_5707) : 0.0;
    float _5779 = fma(_5323, _5709, _5771);
    float _5781 = _5213 ? as_type<float>(_5711) : 0.0;
    float _5783 = fma(_5171, _5755, _5765);
    float _5785 = _5213 ? _5751 : 0.0;
    float _5787 = fma(_5323, _5713, _5759);
    float _5789 = _5213 ? as_type<float>(_5715) : 0.0;
    float _5791 = fma(_5171, _5781, _5769);
    float _5793 = _5213 ? as_type<float>(_5717) : 0.0;
    float _5795 = _5773 * 0.31830990314483642578125;
    float _5797 = precise::clamp(_5795, 0.0, 1.0);
    float _5799 = _5213 ? as_type<float>(_5719) : 0.0;
    float _5801 = fma(_5171, _5777, _5785);
    float _5803 = precise::max(0.0, _5767);
    float _5805 = fma(_5353, _5721, _5787);
    float _5807 = fma(_5323, _5723, _5775);
    out.m_58.z = _736;
    float _5809 = _5797 * 0.88622701168060302734375;
    float _5811 = fma(_5323, _5793, _5791);
    float _5813 = fma(_5323, _5799, _5801);
    float _5815 = _5803 * 0.31830990314483642578125;
    float _5817 = precise::clamp(_5815, 0.0, 1.0);
    float _5819 = _5213 ? as_type<float>(_5725) : 0.0;
    float _5821 = fma(_5353, _5727, _5779);
    float _5823 = _5213 ? as_type<float>(_5729) : 0.0;
    float _5825 = fma(_5323, _5789, _5783);
    float _5827 = _5213 ? as_type<float>(_5731) : 0.0;
    float _5829 = fma(_5353, _5733, _5807);
    float _5831 = precise::max(0.0, _5805);
    float _5833 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    out.gl_Position.x = _1529;
    out.gl_Position.y = _1531;
    float _15254 = as_type<float>(_1537);
    out.gl_Position.z = _15254;
    out.gl_Position.w = _1533;
    float _5835 = -_5817;
    float _5837 = _5835 + 1.0;
    float _5839 = fma(_5353, _5819, _5825);
    float _5841 = fma(_5353, _5827, _5811);
    float _5843 = fma(_5353, _5823, _5813);
    float _5845 = fma(_5831, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5833);
    float _5847 = precise::max(0.0, _5821);
    float _5849 = fma(_5837, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5817);
    float _5851 = precise::max(0.0, _5829);
    float _5853 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5855 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5857 = precise::max(0.0, _5839);
    float _5859 = -_1511;
    float _5861 = (-0.0) + _5859;
    float _5863 = precise::max(0.0, _5841);
    float _5865 = sqrt(_1521);
    float _5867 = precise::max(0.0, _5843);
    float _5869 = _5849 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5871 = fma(_5847, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5853);
    float _5873 = fma(_5851, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5855);
    float _5875 = -_1525;
    float _5877 = (-0.0) + _5875;
    float _5879 = fma(_5857, _5869, _5845);
    float _5881 = fma(_5863, _5869, _5871);
    float _5883 = -_1179;
    float _5885 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _5887 = _5883 + _5885;
    float _5889 = fma(_5867, _5869, _5873);
    out.m_60.x = _5511;
    out.m_60.y = _5515;
    out.m_60.z = _5517;
    float _5891 = _5887 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_58.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_62.w = _1179;
    out.m_64.x = _5861;
    out.m_64.y = _1527;
    out.m_64.z = _5877;
    out.m_58.w = _5865;
    out.m_64.w = _5891;
    out.m_62.x = _5879;
    out.m_62.y = _5881;
    out.m_62.z = _5889;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5585 = false;
    bool _2437 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_51.x;
    float _80 = in.m_51.y;
    float _82 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _84 = _82 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _87 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _89 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _91 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _89;
    int _93 = _87 << 4;
    bool _97 = _93 == 0;
    bool _99 = _93 == 16;
    bool _101 = _93 == 32;
    bool _103 = _93 == 48;
    bool _105 = _93 == 64;
    float _107 = fma(_84, _80, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _109 = _93 == 80;
    bool _111 = _78 >= 0.5;
    bool _113 = isnan(_78);
    bool _115 = _111 || _113;
    bool _117 = isnan(0.5);
    bool _119 = _115 || _117;
    float _121 = as_type<float>(gl_BaseInstance);
    float _123 = _80;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_97)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _127 = _121;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _131 = _107 + _129;
    float _133 = fma(_80, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _135 = _93 == 96;
    float _137 = _131 * _131;
    float _139 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _141 = _133 + _139;
    float _143 = 0.0;
    float _145 = _127;
    if (_97)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _147 = _143;
    float _149 = fma(_91, _91, _137);
    float _151 = _147;
    if (_99)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _153 = _145;
    bool _155 = _93 == 112;
    float _157 = fma(_141, _141, _149);
    float _159 = _153;
    if (_99)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _161 = _151;
    float _163 = _161;
    if (_101)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _165 = _159;
    float _167 = rsqrt(_157);
    bool _169 = _93 == 128;
    float _171 = _165;
    if (_101)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _173 = _163;
    float _175 = _173;
    if (_103)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _177 = _171;
    bool _179 = _93 == 144;
    float _181 = _177;
    if (_103)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _183 = _175;
    float _185 = _183;
    if (_105)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _187 = _181;
    bool _189 = _93 == 160;
    float _191 = _187;
    if (_105)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _193 = _185;
    float _195 = _167 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _197 = _193;
    if (_109)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _199 = _191;
    bool _201 = _93 == 176;
    float _203 = _199;
    if (_109)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _205 = _197;
    float _207 = log2(_195);
    bool _209 = _93 == 192;
    float _211 = _205;
    if (_135)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _213 = _203;
    float _215 = _213;
    if (_135)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _217 = _211;
    float _219 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _221 = _215;
    bool _223 = _93 == 208;
    float _225 = _221;
    if (_155)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _227 = _219;
    float _229 = _227;
    if (_169)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _231 = _225;
    bool _233 = _93 == 224;
    float _235 = _207 + 1.2999999523162841796875;
    float _237 = _231;
    if (_169)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _239 = _229;
    float _241 = _239;
    if (_179)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _243 = _237;
    bool _245 = _93 == 240;
    float _247 = trunc(_235);
    int _249 = int(_247);
    float _251 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _253 = _241;
    float _255 = _253;
    if (_189)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _257 = _251;
    bool _259 = _93 == 256;
    float _261 = _257;
    if (_189)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _267 = _261;
    bool _269 = _93 == 272;
    float _271 = _267;
    if (_201)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _273 = _265;
    float _275 = _273;
    if (_209)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _277 = _271;
    int _279 = min(_249, 15);
    bool _281 = _93 == 288;
    float _283 = _277;
    if (_209)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _285 = _275;
    float _287 = float(_279);
    bool _289 = _93 == 304;
    int _291 = _279 << 4;
    int _293 = _291 + 4288;
    float _295 = _285;
    float _297 = as_type<float>(_293);
    if (_223)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _299 = _283;
    float _301 = _299;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _303 = _295;
    float _305 = -_287;
    float _307 = _305 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _309 = _303;
    if (_233)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _311 = _301;
    int _313 = _293 + 8;
    uint _316 = uint(int(uint(_313) >> uint(2)));
    uint _318 = uint(int(uint(int(_316)) >> uint(2)));
    int _320 = int(_316) & 3;
    float _322 = (*spvDescriptorSet0.vp_c14)._m0[int(_318)][_320];
    int _324 = int(_316) + 1;
    uint _326 = uint(int(uint(_324) >> uint(2)));
    int _328 = _324 & 3;
    float _330 = (*spvDescriptorSet0.vp_c14)._m0[int(_326)][_328];
    bool _332 = _93 == 320;
    float _334 = _307 + 1.0;
    float _336 = _311;
    if (_233)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _338 = _309;
    float _340 = _338;
    if (_245)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _342 = _336;
    bool _344 = _93 == 336;
    float _346 = exp2(_334);
    float _348 = _342;
    if (_245)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _350 = _340;
    float _352 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _354 = _348;
    bool _356 = _93 == 352;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_269)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _364 = _358;
    bool _366 = _93 == 368;
    float _368 = _364;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _370 = _362;
    float _372 = _370;
    if (_281)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _374 = _368;
    float _376 = 1.0 / _346;
    bool _378 = _93 == 384;
    float _380 = _374;
    if (_281)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _382 = _372;
    float _384 = _382;
    if (_289)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _386 = _380;
    bool _388 = _93 == 400;
    float _390 = _386;
    if (_289)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _392 = _384;
    bool _394 = _93 == 416;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _398 = _390;
    float _400 = _398;
    if (_332)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _402 = _396;
    float _404 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _406 = _400;
    bool _408 = _93 == 432;
    float _410 = _406;
    if (_344)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_356)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _416 = _410;
    bool _418 = _93 == 448;
    float _420 = _416;
    if (_356)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_366)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _426 = _420;
    bool _428 = _93 == 464;
    float _430 = _426;
    if (_366)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_378)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _436 = _430;
    bool _438 = _93 == 480;
    float _440 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _442 = _434;
    float _444 = _442;
    if (_388)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _446 = _440;
    bool _448 = _93 == 496;
    float _450 = _446;
    if (_388)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _452 = _444;
    float _454 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _456 = _450;
    bool _458 = _93 == 512;
    float _460 = _456;
    if (_394)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _462 = _454;
    bool _464 = _93 == 528;
    float _466 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _468 = _460;
    float _470 = _468;
    if (_408)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _472 = _466;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _476 = _470;
    bool _478 = _93 == 544;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _486 = _480;
    bool _488 = _93 == 560;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _496 = _490;
    bool _498 = _93 == 576;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_448)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _506 = _500;
    bool _508 = _93 == 592;
    float _510 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _512 = _504;
    float _514 = _512;
    if (_458)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _516 = _510;
    bool _518 = _93 == 608;
    float _520 = _516;
    if (_458)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _522 = _514;
    float _524 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _526 = _520;
    bool _528 = _93 == 624;
    float _530 = _526;
    if (_464)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _532 = _524;
    bool _534 = _93 == 640;
    float _536 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _538 = _530;
    float _540 = _538;
    if (_478)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _542 = _536;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _546 = _540;
    bool _548 = _93 == 656;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _556 = _550;
    bool _558 = _93 == 672;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _566 = _560;
    bool _568 = _93 == 688;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_518)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _576 = _570;
    bool _578 = _93 == 704;
    float _580 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _582 = _574;
    float _584 = _582;
    if (_528)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _586 = _580;
    bool _588 = _93 == 720;
    float _590 = _586;
    if (_528)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _592 = _584;
    float _594 = _592;
    if (_534)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _596 = _590;
    bool _598 = _93 == 736;
    float _600 = _596;
    if (_534)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _602 = _594;
    bool _604 = _93 == 752;
    float _606 = _602;
    if (_548)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _608 = _600;
    float _610 = _608;
    if (_558)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_568)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_578)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _620 = _618;
    float _622 = _620;
    if (_588)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _624 = _622;
    float _626 = _624;
    if (_598)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _628 = _626;
    float _630 = _628;
    if (_604)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _632 = _630;
    float _634 = _376 * _632;
    if (_548)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _636 = _606;
    float _638 = _636;
    if (_558)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _640 = _638;
    float _642 = _634 * _80;
    float _644 = _640;
    if (_568)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_578)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _650 = _648;
    float _652 = floor(_642);
    float _654 = _650;
    if (_588)
    {
        _654 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _656 = _654;
    float _658 = _656;
    if (_598)
    {
        _658 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _660 = _658;
    float _662 = _660;
    if (_604)
    {
        _662 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _664 = _662;
    float _666 = _346 * _664;
    float _668 = -_652;
    float _670 = _642 + _668;
    float _672 = _670 * 2.0;
    float _674 = -_670;
    float _676 = fma(_666, _674, _80);
    float _678 = floor(_672);
    float _680 = _666 * _678;
    float _682 = _680 * 0.5;
    float _684 = _682 + _676;
    float _686 = fma(_84, _684, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _688 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _692 = _686 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _696 = _688 + _694;
    float _698 = _692 * _692;
    float _700 = fma(_91, _91, _698);
    float _702 = fma(_696, _696, _700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _706 = sqrt(_702);
    int _708 = _704 + 76;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c6)._m0[int(_712)][_714];
    float _718 = -_330;
    float _720 = fma(_706, _322, _718);
    float _722 = precise::clamp(_720, 0.0, 1.0);
    uint _724 = uint(int(uint(_704) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c6)._m0[int(_726)][_728];
    float _732 = -_682;
    float _734 = fma(_732, _722, _684);
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _738 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _740 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _738;
    float _742 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _744 = _736 + _742;
    float _746 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _748 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _750 = _736 + _748;
    float _752 = abs(_740);
    float _754 = abs(_744);
    float _756 = precise::max(_752, _754);
    float _758 = _716 + 8.0;
    float _760 = _682;
    float _762 = _322;
    float _764 = _684;
    float _766 = _756;
    float _768 = _750;
    float _770 = _746;
    if (!_119)
    {
        float _772 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _760 = _772;
    }
    float _774 = _760;
    float _776 = _758 + _756;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _780 = _776 * _730;
    float _782 = _780 * 4.0;
    float _784 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _786 = _774;
    if (!_119)
    {
        float _788 = _774 + _778;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = precise::max(_782, 1.0);
    float _794 = _790;
    if (!_119)
    {
        float _796 = fma(_784, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _762 = _796;
    }
    float _798 = _762;
    float _800 = log2(_792);
    float _802 = _798;
    if (!_119)
    {
        float _804 = _798 + _778;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _808;
    float _812 = trunc(_800);
    int _814 = int(_812);
    float _816 = floor(_800);
    int _818 = min(_814, 4);
    int _820 = _818 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _822 = _820 << 4;
    float _824 = _816 + 1.0;
    float _826 = rint(_816);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    uint _834 = uint(int(uint(_822) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c6)._m0[int(_836)][_838];
    float _842 = rint(_824);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    uint _848 = clamp(_846, 0u, 65535u);
    int _850 = _822 + 16;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.vp_c6)._m0[int(_854)][_856];
    float _860 = fma(_750, _840, 0.5);
    float _862 = fma(_810, _840, 0.5);
    float _864 = fma(_750, _858, 0.5);
    float _866 = fma(_810, _858, 0.5);
    float _868 = _864;
    float _870 = _824;
    float _872 = _806;
    if (!_119)
    {
        float2 _7249 = float2(_806, _790);
        float4 _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7249, float2(0.0), isnan(_7249)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7249, float2(0.0), isnan(_7249)), level(0.0)).xyzw;
        float _877 = _875.x;
        float _879 = _875.y;
        float _881 = _875.z;
        float _883 = _875.w;
        _764 = _877;
        _766 = _879;
        _768 = _881;
        _297 = _883;
    }
    float _885 = _764;
    float _887 = _766;
    float _889 = _768;
    float _891 = _297;
    float3 _7279 = float3(_862, _860, float(int(_832)));
    float3 _7283 = select(_7279, float3(0.0), isnan(_7279));
    float3 _895 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7283.xy, uint(rint(_7283.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7283.xy, uint(rint(_7283.z)), level(0.0)).xyz;
    float _897 = _895.x;
    float _899 = _895.y;
    float _901 = _895.z;
    float3 _7298 = float3(_866, _864, float(int(_848)));
    float3 _7300 = select(_7298, float3(0.0), isnan(_7298));
    float3 _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7300.xy, uint(rint(_7300.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7300.xy, uint(rint(_7300.z)), level(0.0)).xyz;
    float _905 = _903.x;
    float _907 = _903.y;
    float _909 = _903.z;
    float _911 = (*spvDescriptorSet0.vp_c15)._m0[0].z + 1.953125;
    float _913 = _911;
    if (_119)
    {
        _123 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _915 = _123;
    float _917 = _736 + 1.953125;
    float _919 = 0.0;
    float _921 = _915;
    if (_119)
    {
        _919 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _923 = _919;
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (_119)
    {
        float _927 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _915, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _913 = _927;
    }
    float _929 = _913;
    if (_119)
    {
        float _931 = fma(_736, _915, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _921 = _931;
    }
    float _933 = _921;
    float _935 = fma(_917, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _937 = _933;
    if (_119)
    {
        float _939 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _746, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _868 = _939;
    }
    float _941 = _868;
    if (_119)
    {
        float _943 = fma(_929, _923, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _870 = _943;
    }
    float _945 = _870;
    float _947 = _945;
    if (_119)
    {
        float _949 = fma(_933, _923, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _937 = _949;
    }
    float _951 = _937;
    float _953 = fma(_925, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_119)
    {
        float _955 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _784, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _125 = _955;
    }
    float _957 = _125;
    if (_119)
    {
        float _959 = _945 + _778;
        _947 = _959;
    }
    float _961 = _947;
    if (_119)
    {
        float _963 = _951 + _778;
        _770 = _963;
    }
    float _965 = _770;
    float _967 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    if (_119)
    {
        float _969 = _778 + _941;
        _794 = _969;
    }
    float _971 = _794;
    float _973 = _953 + _778;
    float _975 = _885;
    float _977 = _887;
    float _979 = _889;
    float _981 = _891;
    if (_119)
    {
        float2 _7455 = float2(_961, _965);
        float4 _983 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7455, float2(0.0), isnan(_7455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7455, float2(0.0), isnan(_7455)), level(0.0)).xyzw;
        float _985 = _983.x;
        float _987 = _983.y;
        float _989 = _983.z;
        float _991 = _983.w;
        _975 = _985;
        _977 = _987;
        _979 = _989;
        _981 = _991;
    }
    float _993 = _975;
    float _995 = _977;
    float _997 = _979;
    float _999 = _981;
    float _1001 = _967 + _778;
    if (_119)
    {
        float _1003 = _778 + _957;
        _872 = _1003;
    }
    float _1005 = _872;
    float2 _7491 = float2(_973, _971);
    float _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7491, float2(0.0), isnan(_7491)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7491, float2(0.0), isnan(_7491)), level(0.0)).x;
    float2 _7499 = float2(_1005, _1001);
    float _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7499, float2(0.0), isnan(_7499)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7499, float2(0.0), isnan(_7499)), level(0.0)).x;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _1013 = _736 * 0.00012500000593718141317367553710938;
    float _1015 = -_816;
    float _1017 = _800 + _1015;
    float _1019 = abs(_1011);
    float _1021 = abs(_1013);
    float _1023 = precise::max(_1019, _1021);
    float _1025 = fma(_1017, 5.42372894287109375, -4.338983058929443359375);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_1023, 20.0, -19.0);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = -_1031;
    float _1035 = _1033 + 1.0;
    float _1037 = -_901;
    float _1039 = _1037 + _909;
    float _1041 = -_897;
    float _1043 = _1041 + _905;
    float _1045 = -_899;
    float _1047 = _1045 + _907;
    float _1049 = fma(_1027, _1039, _901);
    float _1051 = fma(_1027, _1043, _897);
    float _1053 = fma(_1027, _1047, _899);
    float _1055 = fma(_1035, _1049, _736);
    float _1057 = fma(_1035, _1051, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _1059 = fma(_736, 0.008000000379979610443115234375, 64.0);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1063 = _1055 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1067 = _1057 + _1065;
    float _1069 = precise::max(0.0, _1059);
    float _1071 = _1063 * _1063;
    float _1073 = precise::min(_1069, 127.0);
    float _1075 = fma(_1067, _1067, _1071);
    float _1077 = fma(0.008000000379979610443115234375, (*spvDescriptorSet0.vp_c15)._m0[0].z, 64.0);
    float _1079 = fma(_993, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1081 = trunc(_1073);
    int _1083 = int(_1081);
    bool _1085 = _1075 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1087 = isnan(_1075);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1093 = _1089 || _1091;
    float _1095 = precise::max(0.0, _1077);
    float _1097 = fma(_1035, _1053, _1079);
    float _1099 = precise::min(_1095, 127.0);
    float _1101 = _1063 * _1063;
    float _1103 = trunc(_1099);
    int _1105 = int(_1103);
    float _1107 = fma(_1067, _1067, _1101);
    float _1109 = 64.0;
    float _1111 = _1101;
    float _1113 = _1069;
    float _1115 = _993;
    float _1117 = _1097;
    float _1119 = _1075;
    if (!_1093)
    {
        _1109 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_1093)
    {
        float _1125 = -_1075;
        float _1127 = _1125 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1111 = _1127;
    }
    float _1129 = _1111;
    float _1131 = _1129;
    if (!_1093)
    {
        float _1133 = _1075 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1113 = _1133;
    }
    float _1135 = _1113;
    if (!_1093)
    {
        float _1137 = -_1129;
        float _1139 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = sqrt(_1107);
    float _1145 = _1141;
    if (!_1093)
    {
        float _1147 = precise::min(_1097, _1141);
        _1145 = _1147;
    }
    float _1149 = _1145;
    if (!_1093)
    {
        float _1151 = -_1149;
        float _1153 = _1097 + _1151;
        _1115 = _1153;
    }
    float _1155 = _1115;
    float _1157 = _1155;
    if (!_1093)
    {
        float _1159 = fma(_1135, _1155, _1149);
        _1117 = _1159;
    }
    float _1161 = _1117;
    int _1163 = _1083 << 7;
    int _1165 = _1163 + _1105;
    bool _1167 = _1143 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1169 = _1161 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    int _1171 = _1165 << 4;
    float _1173 = fma(_1057, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1169);
    int _1175 = _1171 + 8;
    float _1177 = fma(_1055, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1173);
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1181 = as_type<float>(_1165);
    if (!_1167)
    {
        _1123 = _1057;
    }
    float _1183 = _1123;
    float _1185 = _1183;
    if (!_1167)
    {
        _1157 = _1055;
    }
    float _1187 = _1157;
    float _1189 = _1187;
    if (!_1167)
    {
        _1119 = _1161;
    }
    float _1191 = _1119;
    float _1193 = _1191;
    if (!_1167)
    {
        _1181 = _1179;
    }
    float _1195 = _1181;
    bool _1197 = !_1167;
    float _1199 = _1195;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1205 = _1143 + _1203;
        float _1207 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1209 = _1205 * _1201;
        float _1211 = rsqrt(_1107);
        float _1213 = _1209 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1221, _1207, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1227 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1229 = _1211 * _1225;
        float _1231 = fma(_1217, _1161, _1227);
        float _1233 = fma(_1067, _1229, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1235 = _1231 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1237 = fma(_1063, _1229, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1239 = fma(_1233, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1235);
        float _1241 = fma(_1237, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1239);
        float _1243 = _1241 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1193 = _1231;
        _1185 = _1233;
        _1189 = _1237;
        _1199 = _1243;
    }
    float _1245 = _1193;
    float _1247 = _1185;
    float _1249 = _1189;
    float _1251 = _1199;
    uint _1253 = uint(int(uint(_1175) >> uint(2)));
    float _1255 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1253)]);
    float _1257 = floor(_1099);
    int _1259 = _1171 + 12;
    uint _1261 = uint(int(uint(_1171) >> uint(2)));
    float _1263 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1261)]);
    uint _1265 = uint(int(uint(_1259) >> uint(2)));
    float _1267 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1265)]);
    float _1269 = floor(_1073);
    float _1271 = -_1257;
    float _1273 = _1099 + _1271;
    float _1275 = -_1269;
    float _1277 = _1073 + _1275;
    int _1279 = _1171 + 4;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    float _1283 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1281)]);
    float _1285 = _1255 + _1273;
    float _1287 = precise::clamp(_1285, 0.0, 1.0);
    float _1289 = _1255 + _1277;
    float _1291 = precise::clamp(_1289, 0.0, 1.0);
    bool _1293 = _1287 >= 1.0;
    bool _1295 = isnan(_1287);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(1.0);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    bool _1305 = _1291 >= 1.0;
    bool _1307 = isnan(_1291);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(1.0);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = trunc(_1303);
    int _1319 = int(_1317);
    float _1321 = trunc(_1315);
    int _1323 = int(_1321);
    int _1325 = _1105 + _1319;
    int _1327 = _1083 << 7;
    int _1329 = _1327 + _1325;
    int _1331 = _1083 + _1323;
    int _1333 = _1331 << 7;
    int _1335 = _1333 + _1105;
    int _1337 = _1331 << 7;
    int _1339 = _1337 + _1325;
    int _1341 = _1335 << 4;
    int _1343 = _1339 << 4;
    int _1345 = _1329 << 4;
    uint _1347 = uint(int(uint(_1341) >> uint(2)));
    float _1349 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1347)]);
    int _1351 = _1341 + 12;
    int _1353 = _1343 + 12;
    uint _1355 = uint(int(uint(_1343) >> uint(2)));
    float _1357 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1355)]);
    int _1359 = _1345 + 12;
    uint _1361 = uint(int(uint(_1351) >> uint(2)));
    float _1363 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1361)]);
    uint _1365 = uint(int(uint(_1353) >> uint(2)));
    float _1367 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1365)]);
    uint _1369 = uint(int(uint(_1359) >> uint(2)));
    float _1371 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1369)]);
    uint _1373 = uint(int(uint(_1345) >> uint(2)));
    float _1375 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1373)]);
    float _1377 = fma(_1007, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1379 = fma(_1009, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1381 = -_1079;
    float _1383 = _1381 + _1377;
    float _1385 = -_1079;
    float _1387 = _1385 + _1379;
    float _1389 = floor(_1287);
    float _1391 = fma(_999, 255.99609375, 7.629510946571826934814453125e-06);
    float _1393 = floor(_1291);
    float _1395 = _1267 * _1273;
    float _1397 = _1383 * 1.953125;
    float _1399 = _1283 * _1273;
    float _1401 = _1283 * _1277;
    float _1403 = _1387 * 1.953125;
    float _1405 = -_1389;
    float _1407 = _1287 + _1405;
    float _1409 = _1267 * _1277;
    float _1411 = floor(_1399);
    float _1413 = _1267 * _1407;
    float _1415 = -_1393;
    float _1417 = _1291 + _1415;
    float _1419 = floor(_1401);
    float _1421 = _1267 * _1417;
    float _1423 = floor(_1409);
    float _1425 = floor(_1395);
    float _1427 = _1411 + _1419;
    float _1429 = floor(_1421);
    float _1431 = fma(_995, 200.0, -100.0);
    float _1433 = floor(_1413);
    float _1435 = fma(_997, 200.0, -100.0);
    float _1437 = 1.0 / _1267;
    float _1439 = _1245 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1441 = _1245 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1443 = fma(_1397, _1397, 14.55191516876220703125);
    float _1445 = floor(_1391);
    float _1447 = fma(_1247, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1439);
    float _1449 = fma(_1267, _1423, _1425);
    float _1451 = fma(_1247, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1441);
    float _1453 = fma(_1403, _1403, _1443);
    float _1455 = trunc(_1427);
    int _1457 = int(_1455);
    float _1459 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1451);
    float _1461 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1447);
    float _1463 = _1459 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1465 = rsqrt(_1453);
    float _1467 = -_1445;
    float _1469 = _1391 + _1467;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1475 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1477 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1479 = trunc(_1449);
    int _1481 = int(_1479);
    int _1483 = _1457 & 1;
    bool _1485 = _1483 != 0;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    bool _1489 = _1469 > 0.499000012874603271484375;
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1473);
    float _1493 = -_1411;
    float _1495 = _1399 + _1493;
    float _1497 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1475);
    float _1499 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1477);
    float _1501 = fma(_1471, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1487);
    float _1503 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1491);
    float _1505 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1497);
    float _1507 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1499);
    float _1509 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1501);
    float _1511 = _1397 * _1465;
    float _1513 = _1435 * _1435;
    float _1515 = _1503 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1517 = -_1419;
    float _1519 = _1401 + _1517;
    float _1521 = fma(_1431, _1431, _1513);
    int _1523 = as_type<int>(_1263) + _1481;
    float _1525 = _1403 * _1465;
    float _1527 = _1465 * 3.814697265625;
    float _1529 = _1505 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1531 = _1507 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1533 = _1509 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1535 = !_1489;
    int _1537 = _1535 ? as_type<int>(_1515) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    float _1539 = fma(_1363, _1429, _1425);
    float _1541 = _1363 * _1437;
    float _1543 = fma(_1429, _1367, _1433);
    float _1545 = _1367 * _1437;
    float _1547 = fma(_1423, _1371, _1433);
    float _1549 = _1371 * _1437;
    float _1551 = _1545 * _1543;
    float _1553 = _1541 * _1539;
    float _1555 = _1549 * _1547;
    float _1557 = trunc(_1553);
    int _1559 = int(_1557);
    float _1561 = trunc(_1555);
    int _1563 = int(_1561);
    float _1565 = trunc(_1551);
    int _1567 = int(_1565);
    int _1569 = as_type<int>(_1349) + _1559;
    int _1571 = as_type<int>(_1375) + _1563;
    int _1573 = as_type<int>(_1357) + _1567;
    float _2373;
    float _2375;
    float _2377;
    float _2379;
    float _2381;
    float _2383;
    float _2385;
    float _2387;
    float _2389;
    float _2391;
    float _2393;
    float _2395;
    float _2397;
    float _2399;
    float _2401;
    float _2403;
    float _2405;
    float _2407;
    float _2409;
    float _2411;
    float _2413;
    float _2415;
    float _2417;
    float _2419;
    float _2421;
    float _2423;
    float _2425;
    float _2427;
    float _2429;
    float _2431;
    float _2433;
    float _2435;
    if (!_1485)
    {
        float _1575 = fma(_1519, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1577 = fma(_1495, -0.707106769084930419921875, _1575);
        bool _1579 = _1577 >= 0.0;
        bool _1581 = !_1579;
        if (!_1581)
        {
            int _1583 = _1571 * 656;
            int _1585 = _1583 + 262144;
            int _1587 = _1583 + 262192;
            int _1589 = _1583 + 262160;
            uint _1591 = uint(int(uint(_1585) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1591)];
            float _1593 = as_type<float>(_dmw0.x);
            int _1595 = _1585 + 4;
            uint _1597 = uint(int(uint(_1595) >> uint(2)));
            float _1599 = as_type<float>(_dmw0.y);
            int _1601 = _1585 + 8;
            uint _1603 = uint(int(uint(_1601) >> uint(2)));
            float _1605 = as_type<float>(_dmw0.z);
            int _1607 = _1585 + 12;
            uint _1609 = uint(int(uint(_1607) >> uint(2)));
            float _1611 = as_type<float>(_dmw0.w);
            int _1613 = _1583 + 262208;
            uint _1615 = uint(int(uint(_1587) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1615)];
            float _1617 = as_type<float>(_dmw3.x);
            int _1619 = _1587 + 4;
            uint _1621 = uint(int(uint(_1619) >> uint(2)));
            float _1623 = as_type<float>(_dmw3.y);
            int _1625 = _1587 + 8;
            uint _1627 = uint(int(uint(_1625) >> uint(2)));
            float _1629 = as_type<float>(_dmw3.z);
            int _1631 = _1587 + 12;
            uint _1633 = uint(int(uint(_1631) >> uint(2)));
            float _1635 = as_type<float>(_dmw3.w);
            int _1637 = _1583 + 262224;
            int _1639 = _1583 + 262240;
            uint _1641 = uint(int(uint(_1589) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1641)];
            float _1643 = as_type<float>(_dmw1.x);
            int _1645 = _1589 + 4;
            uint _1647 = uint(int(uint(_1645) >> uint(2)));
            float _1649 = as_type<float>(_dmw1.y);
            int _1651 = _1589 + 8;
            uint _1653 = uint(int(uint(_1651) >> uint(2)));
            float _1655 = as_type<float>(_dmw1.z);
            int _1657 = _1589 + 12;
            uint _1659 = uint(int(uint(_1657) >> uint(2)));
            float _1661 = as_type<float>(_dmw1.w);
            int _1663 = _1583 + 262176;
            int _1665 = _1523 * 656;
            int _1667 = _1583 + 262256;
            uint _1669 = uint(int(uint(_1613) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1669)];
            float _1671 = as_type<float>(_dmw4.x);
            int _1673 = _1613 + 4;
            uint _1675 = uint(int(uint(_1673) >> uint(2)));
            float _1677 = as_type<float>(_dmw4.y);
            int _1679 = _1613 + 8;
            uint _1681 = uint(int(uint(_1679) >> uint(2)));
            float _1683 = as_type<float>(_dmw4.z);
            int _1685 = _1613 + 12;
            uint _1687 = uint(int(uint(_1685) >> uint(2)));
            float _1689 = as_type<float>(_dmw4.w);
            uint _1691 = uint(int(uint(_1637) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1691)];
            float _1693 = as_type<float>(_dmw5.x);
            int _1695 = _1637 + 4;
            uint _1697 = uint(int(uint(_1695) >> uint(2)));
            float _1699 = as_type<float>(_dmw5.y);
            int _1701 = _1637 + 8;
            uint _1703 = uint(int(uint(_1701) >> uint(2)));
            float _1705 = as_type<float>(_dmw5.z);
            int _1707 = _1637 + 12;
            uint _1709 = uint(int(uint(_1707) >> uint(2)));
            float _1711 = as_type<float>(_dmw5.w);
            uint _1713 = uint(int(uint(_1639) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1713)];
            float _1715 = as_type<float>(_dmw6.x);
            int _1717 = _1639 + 4;
            uint _1719 = uint(int(uint(_1717) >> uint(2)));
            float _1721 = as_type<float>(_dmw6.y);
            int _1723 = _1639 + 8;
            uint _1725 = uint(int(uint(_1723) >> uint(2)));
            float _1727 = as_type<float>(_dmw6.z);
            int _1729 = _1639 + 12;
            uint _1731 = uint(int(uint(_1729) >> uint(2)));
            float _1733 = as_type<float>(_dmw6.w);
            int _1735 = _1569 * 656;
            uint _1737 = uint(int(uint(_1663) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1737)];
            float _1739 = as_type<float>(_dmw2.x);
            int _1741 = _1663 + 4;
            uint _1743 = uint(int(uint(_1741) >> uint(2)));
            float _1745 = as_type<float>(_dmw2.y);
            int _1747 = _1663 + 8;
            uint _1749 = uint(int(uint(_1747) >> uint(2)));
            float _1751 = as_type<float>(_dmw2.z);
            int _1753 = _1663 + 12;
            uint _1755 = uint(int(uint(_1753) >> uint(2)));
            float _1757 = as_type<float>(_dmw2.w);
            int _1759 = _1665 + 262144;
            int _1761 = _1665 + 262192;
            uint _1763 = uint(int(uint(_1667) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1763)];
            float _1765 = as_type<float>(_dmw7.x);
            int _1767 = _1667 + 4;
            uint _1769 = uint(int(uint(_1767) >> uint(2)));
            float _1771 = as_type<float>(_dmw7.y);
            int _1773 = _1667 + 8;
            uint _1775 = uint(int(uint(_1773) >> uint(2)));
            float _1777 = as_type<float>(_dmw7.z);
            int _1779 = _1667 + 12;
            uint _1781 = uint(int(uint(_1779) >> uint(2)));
            float _1783 = as_type<float>(_dmw7.w);
            int _1785 = _1665 + 262160;
            int _1787 = _1665 + 262208;
            uint _1789 = uint(int(uint(_1759) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1789)];
            float _1791 = as_type<float>(_dmw8.x);
            int _1793 = _1759 + 4;
            uint _1795 = uint(int(uint(_1793) >> uint(2)));
            float _1797 = as_type<float>(_dmw8.y);
            int _1799 = _1759 + 8;
            uint _1801 = uint(int(uint(_1799) >> uint(2)));
            float _1803 = as_type<float>(_dmw8.z);
            int _1805 = _1759 + 12;
            uint _1807 = uint(int(uint(_1805) >> uint(2)));
            float _1809 = as_type<float>(_dmw8.w);
            int _1811 = _1665 + 262176;
            int _1813 = _1665 + 262224;
            uint _1815 = uint(int(uint(_1761) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1815)];
            float _1817 = as_type<float>(_dmw11.x);
            int _1819 = _1761 + 4;
            uint _1821 = uint(int(uint(_1819) >> uint(2)));
            float _1823 = as_type<float>(_dmw11.y);
            int _1825 = _1761 + 8;
            uint _1827 = uint(int(uint(_1825) >> uint(2)));
            float _1829 = as_type<float>(_dmw11.z);
            int _1831 = _1761 + 12;
            uint _1833 = uint(int(uint(_1831) >> uint(2)));
            float _1835 = as_type<float>(_dmw11.w);
            int _1837 = _1665 + 262240;
            int _1839 = _1665 + 262256;
            uint _1841 = uint(int(uint(_1785) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1841)];
            float _1843 = as_type<float>(_dmw9.x);
            int _1845 = _1785 + 4;
            uint _1847 = uint(int(uint(_1845) >> uint(2)));
            float _1849 = as_type<float>(_dmw9.y);
            int _1851 = _1785 + 8;
            uint _1853 = uint(int(uint(_1851) >> uint(2)));
            float _1855 = as_type<float>(_dmw9.z);
            int _1857 = _1785 + 12;
            uint _1859 = uint(int(uint(_1857) >> uint(2)));
            float _1861 = as_type<float>(_dmw9.w);
            int _1863 = _1735 + 262144;
            int _1865 = _1735 + 262192;
            uint _1867 = uint(int(uint(_1787) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1867)];
            float _1869 = as_type<float>(_dmw12.x);
            int _1871 = _1787 + 4;
            uint _1873 = uint(int(uint(_1871) >> uint(2)));
            float _1875 = as_type<float>(_dmw12.y);
            int _1877 = _1787 + 8;
            uint _1879 = uint(int(uint(_1877) >> uint(2)));
            float _1881 = as_type<float>(_dmw12.z);
            int _1883 = _1787 + 12;
            uint _1885 = uint(int(uint(_1883) >> uint(2)));
            float _1887 = as_type<float>(_dmw12.w);
            int _1889 = _1735 + 262160;
            int _1891 = _1735 + 262208;
            uint _1893 = uint(int(uint(_1811) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1893)];
            float _1895 = as_type<float>(_dmw10.x);
            int _1897 = _1811 + 4;
            uint _1899 = uint(int(uint(_1897) >> uint(2)));
            float _1901 = as_type<float>(_dmw10.y);
            int _1903 = _1811 + 8;
            uint _1905 = uint(int(uint(_1903) >> uint(2)));
            float _1907 = as_type<float>(_dmw10.z);
            int _1909 = _1811 + 12;
            uint _1911 = uint(int(uint(_1909) >> uint(2)));
            float _1913 = as_type<float>(_dmw10.w);
            int _1915 = _1735 + 262176;
            int _1917 = _1735 + 262224;
            uint _1919 = uint(int(uint(_1813) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1919)];
            float _1921 = as_type<float>(_dmw13.x);
            int _1923 = _1813 + 4;
            uint _1925 = uint(int(uint(_1923) >> uint(2)));
            float _1927 = as_type<float>(_dmw13.y);
            int _1929 = _1813 + 8;
            uint _1931 = uint(int(uint(_1929) >> uint(2)));
            float _1933 = as_type<float>(_dmw13.z);
            int _1935 = _1813 + 12;
            uint _1937 = uint(int(uint(_1935) >> uint(2)));
            float _1939 = as_type<float>(_dmw13.w);
            int _1941 = _1735 + 262240;
            int _1943 = _1735 + 262256;
            uint _1945 = uint(int(uint(_1837) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1945)];
            float _1947 = as_type<float>(_dmw14.x);
            int _1949 = _1837 + 4;
            uint _1951 = uint(int(uint(_1949) >> uint(2)));
            float _1953 = as_type<float>(_dmw14.y);
            int _1955 = _1837 + 8;
            uint _1957 = uint(int(uint(_1955) >> uint(2)));
            float _1959 = as_type<float>(_dmw14.z);
            int _1961 = _1837 + 12;
            uint _1963 = uint(int(uint(_1961) >> uint(2)));
            float _1965 = as_type<float>(_dmw14.w);
            uint _1967 = uint(int(uint(_1839) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1967)];
            float _1969 = as_type<float>(_dmw15.x);
            int _1971 = _1839 + 4;
            uint _1973 = uint(int(uint(_1971) >> uint(2)));
            float _1975 = as_type<float>(_dmw15.y);
            int _1977 = _1839 + 8;
            uint _1979 = uint(int(uint(_1977) >> uint(2)));
            float _1981 = as_type<float>(_dmw15.z);
            int _1983 = _1839 + 12;
            uint _1985 = uint(int(uint(_1983) >> uint(2)));
            float _1987 = as_type<float>(_dmw15.w);
            uint _1989 = uint(int(uint(_1863) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1989)];
            float _1991 = as_type<float>(_dmw16.x);
            int _1993 = _1863 + 4;
            uint _1995 = uint(int(uint(_1993) >> uint(2)));
            float _1997 = as_type<float>(_dmw16.y);
            int _1999 = _1863 + 8;
            uint _2001 = uint(int(uint(_1999) >> uint(2)));
            float _2003 = as_type<float>(_dmw16.z);
            int _2005 = _1863 + 12;
            uint _2007 = uint(int(uint(_2005) >> uint(2)));
            float _2009 = as_type<float>(_dmw16.w);
            uint _2011 = uint(int(uint(_1865) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2011)];
            float _2013 = as_type<float>(_dmw19.x);
            int _2015 = _1865 + 4;
            uint _2017 = uint(int(uint(_2015) >> uint(2)));
            float _2019 = as_type<float>(_dmw19.y);
            int _2021 = _1865 + 8;
            uint _2023 = uint(int(uint(_2021) >> uint(2)));
            float _2025 = as_type<float>(_dmw19.z);
            int _2027 = _1865 + 12;
            uint _2029 = uint(int(uint(_2027) >> uint(2)));
            float _2031 = as_type<float>(_dmw19.w);
            uint _2033 = uint(int(uint(_1889) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2033)];
            float _2035 = as_type<float>(_dmw17.x);
            int _2037 = _1889 + 4;
            uint _2039 = uint(int(uint(_2037) >> uint(2)));
            float _2041 = as_type<float>(_dmw17.y);
            int _2043 = _1889 + 8;
            uint _2045 = uint(int(uint(_2043) >> uint(2)));
            float _2047 = as_type<float>(_dmw17.z);
            int _2049 = _1889 + 12;
            uint _2051 = uint(int(uint(_2049) >> uint(2)));
            float _2053 = as_type<float>(_dmw17.w);
            uint _2055 = uint(int(uint(_1891) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2055)];
            float _2057 = as_type<float>(_dmw20.x);
            int _2059 = _1891 + 4;
            uint _2061 = uint(int(uint(_2059) >> uint(2)));
            float _2063 = as_type<float>(_dmw20.y);
            int _2065 = _1891 + 8;
            uint _2067 = uint(int(uint(_2065) >> uint(2)));
            float _2069 = as_type<float>(_dmw20.z);
            int _2071 = _1891 + 12;
            uint _2073 = uint(int(uint(_2071) >> uint(2)));
            float _2075 = as_type<float>(_dmw20.w);
            uint _2077 = uint(int(uint(_1915) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2077)];
            float _2079 = as_type<float>(_dmw18.x);
            int _2081 = _1915 + 4;
            uint _2083 = uint(int(uint(_2081) >> uint(2)));
            float _2085 = as_type<float>(_dmw18.y);
            int _2087 = _1915 + 8;
            uint _2089 = uint(int(uint(_2087) >> uint(2)));
            float _2091 = as_type<float>(_dmw18.z);
            int _2093 = _1915 + 12;
            uint _2095 = uint(int(uint(_2093) >> uint(2)));
            float _2097 = as_type<float>(_dmw18.w);
            uint _2099 = uint(int(uint(_1917) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2099)];
            float _2101 = as_type<float>(_dmw21.x);
            int _2103 = _1917 + 4;
            uint _2105 = uint(int(uint(_2103) >> uint(2)));
            float _2107 = as_type<float>(_dmw21.y);
            int _2109 = _1917 + 8;
            uint _2111 = uint(int(uint(_2109) >> uint(2)));
            float _2113 = as_type<float>(_dmw21.z);
            int _2115 = _1917 + 12;
            uint _2117 = uint(int(uint(_2115) >> uint(2)));
            float _2119 = as_type<float>(_dmw21.w);
            uint _2121 = uint(int(uint(_1941) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2121)];
            float _2123 = as_type<float>(_dmw22.x);
            int _2125 = _1941 + 4;
            uint _2127 = uint(int(uint(_2125) >> uint(2)));
            float _2129 = as_type<float>(_dmw22.y);
            int _2131 = _1941 + 8;
            uint _2133 = uint(int(uint(_2131) >> uint(2)));
            float _2135 = as_type<float>(_dmw22.z);
            int _2137 = _1941 + 12;
            uint _2139 = uint(int(uint(_2137) >> uint(2)));
            float _2141 = as_type<float>(_dmw22.w);
            uint _2143 = uint(int(uint(_1943) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2143)];
            float _2145 = as_type<float>(_dmw23.x);
            int _2147 = _1943 + 4;
            uint _2149 = uint(int(uint(_2147) >> uint(2)));
            float _2151 = as_type<float>(_dmw23.y);
            int _2153 = _1943 + 8;
            uint _2155 = uint(int(uint(_2153) >> uint(2)));
            float _2157 = as_type<float>(_dmw23.z);
            int _2159 = _1943 + 12;
            uint _2161 = uint(int(uint(_2159) >> uint(2)));
            float _2163 = as_type<float>(_dmw23.w);
            float _2165 = _1519 + (-1.0);
            float _2167 = -_1495;
            float _2169 = -_2165;
            float _2171 = _2167 + _2169;
            float _2173 = -_2171;
            float _2175 = _2173 + 1.0;
            float _2177 = _1495 * _1593;
            float _2179 = _1495 * _1599;
            float _2181 = _1495 * _1605;
            float _2183 = _1495 * _1611;
            float _2185 = _1495 * _1617;
            float _2187 = _1495 * _1623;
            float _2189 = _1495 * _1629;
            float _2191 = _1495 * _1635;
            float _2193 = _1495 * _1643;
            float _2195 = _1495 * _1649;
            float _2197 = _1495 * _1655;
            float _2199 = _1495 * _1661;
            float _2201 = _1495 * _1671;
            float _2203 = _1495 * _1677;
            float _2205 = _1495 * _1683;
            float _2207 = _1495 * _1699;
            float _2209 = _1495 * _1705;
            float _2211 = _1495 * _1711;
            float _2213 = _1495 * _1689;
            float _2215 = _1495 * _1715;
            float _2217 = _1495 * _1721;
            float _2219 = _1495 * _1727;
            float _2221 = _1495 * _1739;
            float _2223 = _1495 * _1745;
            float _2225 = _1495 * _1751;
            float _2227 = _1495 * _1733;
            float _2229 = _1495 * _1757;
            float _2231 = _1495 * _1765;
            float _2233 = _1495 * _1693;
            float _2235 = _1495 * _1771;
            float _2237 = _1495 * _1777;
            float _2239 = -_1495;
            float _2241 = _2239 + _2175;
            float _2243 = _1495 * _1783;
            float _2245 = fma(_2171, _1791, _2177);
            float _2247 = fma(_2171, _1797, _2179);
            float _2249 = fma(_2171, _1803, _2181);
            float _2251 = fma(_2171, _1809, _2183);
            float _2253 = fma(_2171, _1817, _2185);
            float _2255 = fma(_2171, _1823, _2187);
            float _2257 = fma(_2171, _1829, _2189);
            float _2259 = fma(_2171, _1835, _2191);
            float _2261 = fma(_2171, _1843, _2193);
            float _2263 = fma(_2171, _1849, _2195);
            float _2265 = fma(_2171, _1855, _2197);
            float _2267 = fma(_2171, _1861, _2199);
            float _2269 = fma(_2171, _1869, _2201);
            float _2271 = fma(_2171, _1875, _2203);
            float _2273 = fma(_2171, _1881, _2205);
            float _2275 = fma(_2171, _1887, _2213);
            float _2277 = fma(_2171, _1895, _2221);
            float _2279 = fma(_2171, _1901, _2223);
            float _2281 = fma(_2171, _1907, _2225);
            float _2283 = fma(_2171, _1913, _2229);
            float _2285 = fma(_2171, _1921, _2233);
            float _2287 = fma(_2171, _1927, _2207);
            float _2289 = fma(_2171, _1933, _2209);
            float _2291 = fma(_2171, _1939, _2211);
            float _2293 = fma(_2171, _1947, _2215);
            float _2295 = fma(_2171, _1953, _2217);
            float _2297 = fma(_2171, _1959, _2219);
            float _2299 = fma(_2171, _1965, _2227);
            float _2301 = fma(_2171, _1969, _2231);
            float _2303 = fma(_2171, _1975, _2235);
            float _2305 = fma(_2171, _1981, _2237);
            float _2307 = fma(_2171, _1987, _2243);
            float _2309 = fma(_2241, _1991, _2245);
            float _2311 = fma(_2241, _1997, _2247);
            float _2313 = fma(_2241, _2003, _2249);
            float _2315 = fma(_2241, _2009, _2251);
            float _2317 = fma(_2241, _2013, _2253);
            float _2319 = fma(_2241, _2019, _2255);
            float _2321 = fma(_2241, _2025, _2257);
            float _2323 = fma(_2241, _2031, _2259);
            float _2325 = fma(_2241, _2035, _2261);
            float _2327 = fma(_2241, _2041, _2263);
            float _2329 = fma(_2241, _2047, _2265);
            float _2331 = fma(_2241, _2053, _2267);
            float _2333 = fma(_2241, _2057, _2269);
            float _2335 = fma(_2241, _2063, _2271);
            float _2337 = fma(_2241, _2069, _2273);
            float _2339 = fma(_2241, _2075, _2275);
            float _2341 = fma(_2241, _2079, _2277);
            float _2343 = fma(_2241, _2085, _2279);
            float _2345 = fma(_2241, _2091, _2281);
            float _2347 = fma(_2241, _2097, _2283);
            float _2349 = fma(_2241, _2101, _2285);
            float _2351 = fma(_2241, _2107, _2287);
            float _2353 = fma(_2241, _2113, _2289);
            float _2355 = fma(_2241, _2119, _2291);
            float _2357 = fma(_2241, _2123, _2293);
            float _2359 = fma(_2241, _2129, _2295);
            float _2361 = fma(_2241, _2135, _2297);
            float _2363 = fma(_2241, _2141, _2299);
            float _2365 = fma(_2241, _2145, _2301);
            float _2367 = fma(_2241, _2151, _2303);
            float _2369 = fma(_2241, _2157, _2305);
            float _2371 = fma(_2241, _2163, _2307);
            _2373 = _2323;
            _2375 = _2319;
            _2377 = _2351;
            _2379 = _2333;
            _2381 = _2317;
            _2383 = _2337;
            _2385 = _2353;
            _2387 = _2335;
            _2389 = _2339;
            _2391 = _2355;
            _2393 = _2321;
            _2395 = _2349;
            _2397 = _2367;
            _2399 = _2315;
            _2401 = _2365;
            _2403 = _2325;
            _2405 = _2327;
            _2407 = _2359;
            _2409 = _2309;
            _2411 = _2311;
            _2413 = _2313;
            _2415 = _2357;
            _2417 = _2369;
            _2419 = _2331;
            _2421 = _2341;
            _2423 = _2361;
            _2425 = _2371;
            _2427 = _2345;
            _2429 = _2347;
            _2431 = _2363;
            _2433 = _2329;
            _2435 = _2343;
            _2437 = true;
        }
        else
        {
            int _2439 = _1569 * 656;
            int _2441 = _2439 + 262144;
            int _2443 = _2439 + 262192;
            int _2445 = _2439 + 262160;
            uint _2447 = uint(int(uint(_2441) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2447)];
            float _2449 = as_type<float>(_dmw24.x);
            int _2451 = _2441 + 4;
            uint _2453 = uint(int(uint(_2451) >> uint(2)));
            float _2455 = as_type<float>(_dmw24.y);
            int _2457 = _2441 + 8;
            uint _2459 = uint(int(uint(_2457) >> uint(2)));
            float _2461 = as_type<float>(_dmw24.z);
            int _2463 = _2441 + 12;
            uint _2465 = uint(int(uint(_2463) >> uint(2)));
            float _2467 = as_type<float>(_dmw24.w);
            int _2469 = _2439 + 262208;
            uint _2471 = uint(int(uint(_2443) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2471)];
            float _2473 = as_type<float>(_dmw27.x);
            int _2475 = _2443 + 4;
            uint _2477 = uint(int(uint(_2475) >> uint(2)));
            float _2479 = as_type<float>(_dmw27.y);
            int _2481 = _2443 + 8;
            uint _2483 = uint(int(uint(_2481) >> uint(2)));
            float _2485 = as_type<float>(_dmw27.z);
            int _2487 = _2443 + 12;
            uint _2489 = uint(int(uint(_2487) >> uint(2)));
            float _2491 = as_type<float>(_dmw27.w);
            int _2493 = _2439 + 262176;
            uint _2495 = uint(int(uint(_2445) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2495)];
            float _2497 = as_type<float>(_dmw25.x);
            int _2499 = _2445 + 4;
            uint _2501 = uint(int(uint(_2499) >> uint(2)));
            float _2503 = as_type<float>(_dmw25.y);
            int _2505 = _2445 + 8;
            uint _2507 = uint(int(uint(_2505) >> uint(2)));
            float _2509 = as_type<float>(_dmw25.z);
            int _2511 = _2445 + 12;
            uint _2513 = uint(int(uint(_2511) >> uint(2)));
            float _2515 = as_type<float>(_dmw25.w);
            int _2517 = _2439 + 262224;
            uint _2519 = uint(int(uint(_2469) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2519)];
            float _2521 = as_type<float>(_dmw28.x);
            int _2523 = _2469 + 4;
            uint _2525 = uint(int(uint(_2523) >> uint(2)));
            float _2527 = as_type<float>(_dmw28.y);
            int _2529 = _2469 + 8;
            uint _2531 = uint(int(uint(_2529) >> uint(2)));
            float _2533 = as_type<float>(_dmw28.z);
            int _2535 = _2469 + 12;
            uint _2537 = uint(int(uint(_2535) >> uint(2)));
            float _2539 = as_type<float>(_dmw28.w);
            int _2541 = _2439 + 262240;
            uint _2543 = uint(int(uint(_2493) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2543)];
            float _2545 = as_type<float>(_dmw26.x);
            int _2547 = _2493 + 4;
            uint _2549 = uint(int(uint(_2547) >> uint(2)));
            float _2551 = as_type<float>(_dmw26.y);
            int _2553 = _2493 + 8;
            uint _2555 = uint(int(uint(_2553) >> uint(2)));
            float _2557 = as_type<float>(_dmw26.z);
            int _2559 = _2493 + 12;
            uint _2561 = uint(int(uint(_2559) >> uint(2)));
            float _2563 = as_type<float>(_dmw26.w);
            int _2565 = _2439 + 262256;
            uint _2567 = uint(int(uint(_2517) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2567)];
            float _2569 = as_type<float>(_dmw29.x);
            int _2571 = _2517 + 4;
            uint _2573 = uint(int(uint(_2571) >> uint(2)));
            float _2575 = as_type<float>(_dmw29.y);
            int _2577 = _2517 + 8;
            uint _2579 = uint(int(uint(_2577) >> uint(2)));
            float _2581 = as_type<float>(_dmw29.z);
            int _2583 = _2517 + 12;
            uint _2585 = uint(int(uint(_2583) >> uint(2)));
            float _2587 = as_type<float>(_dmw29.w);
            int _2589 = _1571 * 656;
            uint _2591 = uint(int(uint(_2541) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2591)];
            float _2593 = as_type<float>(_dmw30.x);
            int _2595 = _2541 + 4;
            uint _2597 = uint(int(uint(_2595) >> uint(2)));
            float _2599 = as_type<float>(_dmw30.y);
            int _2601 = _2541 + 8;
            uint _2603 = uint(int(uint(_2601) >> uint(2)));
            float _2605 = as_type<float>(_dmw30.z);
            int _2607 = _2541 + 12;
            uint _2609 = uint(int(uint(_2607) >> uint(2)));
            float _2611 = as_type<float>(_dmw30.w);
            int _2613 = _1573 * 656;
            int _2615 = _2589 + 262144;
            uint _2617 = uint(int(uint(_2565) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2617)];
            float _2619 = as_type<float>(_dmw31.x);
            int _2621 = _2565 + 4;
            uint _2623 = uint(int(uint(_2621) >> uint(2)));
            float _2625 = as_type<float>(_dmw31.y);
            int _2627 = _2565 + 8;
            uint _2629 = uint(int(uint(_2627) >> uint(2)));
            float _2631 = as_type<float>(_dmw31.z);
            int _2633 = _2565 + 12;
            uint _2635 = uint(int(uint(_2633) >> uint(2)));
            float _2637 = as_type<float>(_dmw31.w);
            int _2639 = _2589 + 262192;
            int _2641 = _2589 + 262160;
            uint _2643 = uint(int(uint(_2615) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2643)];
            float _2645 = as_type<float>(_dmw32.x);
            int _2647 = _2615 + 4;
            uint _2649 = uint(int(uint(_2647) >> uint(2)));
            float _2651 = as_type<float>(_dmw32.y);
            int _2653 = _2615 + 8;
            uint _2655 = uint(int(uint(_2653) >> uint(2)));
            float _2657 = as_type<float>(_dmw32.z);
            int _2659 = _2615 + 12;
            uint _2661 = uint(int(uint(_2659) >> uint(2)));
            float _2663 = as_type<float>(_dmw32.w);
            int _2665 = _2589 + 262208;
            int _2667 = _2589 + 262176;
            uint _2669 = uint(int(uint(_2639) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2669)];
            float _2671 = as_type<float>(_dmw35.x);
            int _2673 = _2639 + 4;
            uint _2675 = uint(int(uint(_2673) >> uint(2)));
            float _2677 = as_type<float>(_dmw35.y);
            int _2679 = _2639 + 8;
            uint _2681 = uint(int(uint(_2679) >> uint(2)));
            float _2683 = as_type<float>(_dmw35.z);
            int _2685 = _2639 + 12;
            uint _2687 = uint(int(uint(_2685) >> uint(2)));
            float _2689 = as_type<float>(_dmw35.w);
            int _2691 = _2589 + 262224;
            int _2693 = _2589 + 262240;
            uint _2695 = uint(int(uint(_2641) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2695)];
            float _2697 = as_type<float>(_dmw33.x);
            int _2699 = _2641 + 4;
            uint _2701 = uint(int(uint(_2699) >> uint(2)));
            float _2703 = as_type<float>(_dmw33.y);
            int _2705 = _2641 + 8;
            uint _2707 = uint(int(uint(_2705) >> uint(2)));
            float _2709 = as_type<float>(_dmw33.z);
            int _2711 = _2641 + 12;
            uint _2713 = uint(int(uint(_2711) >> uint(2)));
            float _2715 = as_type<float>(_dmw33.w);
            int _2717 = _2589 + 262256;
            int _2719 = _2613 + 262144;
            uint _2721 = uint(int(uint(_2665) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2721)];
            float _2723 = as_type<float>(_dmw36.x);
            int _2725 = _2665 + 4;
            uint _2727 = uint(int(uint(_2725) >> uint(2)));
            float _2729 = as_type<float>(_dmw36.y);
            int _2731 = _2665 + 8;
            uint _2733 = uint(int(uint(_2731) >> uint(2)));
            float _2735 = as_type<float>(_dmw36.z);
            int _2737 = _2665 + 12;
            uint _2739 = uint(int(uint(_2737) >> uint(2)));
            float _2741 = as_type<float>(_dmw36.w);
            int _2743 = _2613 + 262192;
            int _2745 = _2613 + 262160;
            uint _2747 = uint(int(uint(_2667) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2747)];
            float _2749 = as_type<float>(_dmw34.x);
            int _2751 = _2667 + 4;
            uint _2753 = uint(int(uint(_2751) >> uint(2)));
            float _2755 = as_type<float>(_dmw34.y);
            int _2757 = _2667 + 8;
            uint _2759 = uint(int(uint(_2757) >> uint(2)));
            float _2761 = as_type<float>(_dmw34.z);
            int _2763 = _2667 + 12;
            uint _2765 = uint(int(uint(_2763) >> uint(2)));
            float _2767 = as_type<float>(_dmw34.w);
            int _2769 = _2613 + 262208;
            int _2771 = _2613 + 262176;
            uint _2773 = uint(int(uint(_2691) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2773)];
            float _2775 = as_type<float>(_dmw37.x);
            int _2777 = _2691 + 4;
            uint _2779 = uint(int(uint(_2777) >> uint(2)));
            float _2781 = as_type<float>(_dmw37.y);
            int _2783 = _2691 + 8;
            uint _2785 = uint(int(uint(_2783) >> uint(2)));
            float _2787 = as_type<float>(_dmw37.z);
            int _2789 = _2691 + 12;
            uint _2791 = uint(int(uint(_2789) >> uint(2)));
            float _2793 = as_type<float>(_dmw37.w);
            int _2795 = _2613 + 262224;
            int _2797 = _2613 + 262240;
            uint _2799 = uint(int(uint(_2693) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2799)];
            float _2801 = as_type<float>(_dmw38.x);
            int _2803 = _2693 + 4;
            uint _2805 = uint(int(uint(_2803) >> uint(2)));
            float _2807 = as_type<float>(_dmw38.y);
            int _2809 = _2693 + 8;
            uint _2811 = uint(int(uint(_2809) >> uint(2)));
            float _2813 = as_type<float>(_dmw38.z);
            int _2815 = _2693 + 12;
            uint _2817 = uint(int(uint(_2815) >> uint(2)));
            float _2819 = as_type<float>(_dmw38.w);
            int _2821 = _2613 + 262256;
            uint _2823 = uint(int(uint(_2717) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2823)];
            float _2825 = as_type<float>(_dmw39.x);
            int _2827 = _2717 + 4;
            uint _2829 = uint(int(uint(_2827) >> uint(2)));
            float _2831 = as_type<float>(_dmw39.y);
            int _2833 = _2717 + 8;
            uint _2835 = uint(int(uint(_2833) >> uint(2)));
            float _2837 = as_type<float>(_dmw39.z);
            int _2839 = _2717 + 12;
            uint _2841 = uint(int(uint(_2839) >> uint(2)));
            float _2843 = as_type<float>(_dmw39.w);
            uint _2845 = uint(int(uint(_2719) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2845)];
            float _2847 = as_type<float>(_dmw40.x);
            int _2849 = _2719 + 4;
            uint _2851 = uint(int(uint(_2849) >> uint(2)));
            float _2853 = as_type<float>(_dmw40.y);
            int _2855 = _2719 + 8;
            uint _2857 = uint(int(uint(_2855) >> uint(2)));
            float _2859 = as_type<float>(_dmw40.z);
            int _2861 = _2719 + 12;
            uint _2863 = uint(int(uint(_2861) >> uint(2)));
            float _2865 = as_type<float>(_dmw40.w);
            uint _2867 = uint(int(uint(_2743) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2867)];
            float _2869 = as_type<float>(_dmw43.x);
            int _2871 = _2743 + 4;
            uint _2873 = uint(int(uint(_2871) >> uint(2)));
            float _2875 = as_type<float>(_dmw43.y);
            int _2877 = _2743 + 8;
            uint _2879 = uint(int(uint(_2877) >> uint(2)));
            float _2881 = as_type<float>(_dmw43.z);
            int _2883 = _2743 + 12;
            uint _2885 = uint(int(uint(_2883) >> uint(2)));
            float _2887 = as_type<float>(_dmw43.w);
            uint _2889 = uint(int(uint(_2745) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2889)];
            float _2891 = as_type<float>(_dmw41.x);
            int _2893 = _2745 + 4;
            uint _2895 = uint(int(uint(_2893) >> uint(2)));
            float _2897 = as_type<float>(_dmw41.y);
            int _2899 = _2745 + 8;
            uint _2901 = uint(int(uint(_2899) >> uint(2)));
            float _2903 = as_type<float>(_dmw41.z);
            int _2905 = _2745 + 12;
            uint _2907 = uint(int(uint(_2905) >> uint(2)));
            float _2909 = as_type<float>(_dmw41.w);
            uint _2911 = uint(int(uint(_2769) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2911)];
            float _2913 = as_type<float>(_dmw44.x);
            int _2915 = _2769 + 4;
            uint _2917 = uint(int(uint(_2915) >> uint(2)));
            float _2919 = as_type<float>(_dmw44.y);
            int _2921 = _2769 + 8;
            uint _2923 = uint(int(uint(_2921) >> uint(2)));
            float _2925 = as_type<float>(_dmw44.z);
            int _2927 = _2769 + 12;
            uint _2929 = uint(int(uint(_2927) >> uint(2)));
            float _2931 = as_type<float>(_dmw44.w);
            uint _2933 = uint(int(uint(_2771) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2933)];
            float _2935 = as_type<float>(_dmw42.x);
            int _2937 = _2771 + 4;
            uint _2939 = uint(int(uint(_2937) >> uint(2)));
            float _2941 = as_type<float>(_dmw42.y);
            int _2943 = _2771 + 8;
            uint _2945 = uint(int(uint(_2943) >> uint(2)));
            float _2947 = as_type<float>(_dmw42.z);
            int _2949 = _2771 + 12;
            uint _2951 = uint(int(uint(_2949) >> uint(2)));
            float _2953 = as_type<float>(_dmw42.w);
            uint _2955 = uint(int(uint(_2795) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2955)];
            float _2957 = as_type<float>(_dmw45.x);
            int _2959 = _2795 + 4;
            uint _2961 = uint(int(uint(_2959) >> uint(2)));
            float _2963 = as_type<float>(_dmw45.y);
            int _2965 = _2795 + 8;
            uint _2967 = uint(int(uint(_2965) >> uint(2)));
            float _2969 = as_type<float>(_dmw45.z);
            int _2971 = _2795 + 12;
            uint _2973 = uint(int(uint(_2971) >> uint(2)));
            float _2975 = as_type<float>(_dmw45.w);
            uint _2977 = uint(int(uint(_2797) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2977)];
            float _2979 = as_type<float>(_dmw46.x);
            int _2981 = _2797 + 4;
            uint _2983 = uint(int(uint(_2981) >> uint(2)));
            float _2985 = as_type<float>(_dmw46.y);
            int _2987 = _2797 + 8;
            uint _2989 = uint(int(uint(_2987) >> uint(2)));
            float _2991 = as_type<float>(_dmw46.z);
            int _2993 = _2797 + 12;
            uint _2995 = uint(int(uint(_2993) >> uint(2)));
            float _2997 = as_type<float>(_dmw46.w);
            uint _2999 = uint(int(uint(_2821) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2999)];
            float _3001 = as_type<float>(_dmw47.x);
            int _3003 = _2821 + 4;
            uint _3005 = uint(int(uint(_3003) >> uint(2)));
            float _3007 = as_type<float>(_dmw47.y);
            int _3009 = _2821 + 8;
            uint _3011 = uint(int(uint(_3009) >> uint(2)));
            float _3013 = as_type<float>(_dmw47.z);
            int _3015 = _2821 + 12;
            uint _3017 = uint(int(uint(_3015) >> uint(2)));
            float _3019 = as_type<float>(_dmw47.w);
            float _3021 = _1495 + (-1.0);
            float _3023 = _1519 + (-1.0);
            float _3025 = _1519 + _3021;
            float _3027 = -_3021;
            float _3029 = _2449 * _3027;
            float _3031 = -_3021;
            float _3033 = _2455 * _3031;
            float _3035 = -_3021;
            float _3037 = _2461 * _3035;
            float _3039 = -_3021;
            float _3041 = _2467 * _3039;
            float _3043 = -_3021;
            float _3045 = _2473 * _3043;
            float _3047 = -_3021;
            float _3049 = _2479 * _3047;
            float _3051 = -_3021;
            float _3053 = _2485 * _3051;
            float _3055 = -_3021;
            float _3057 = _2491 * _3055;
            float _3059 = -_3021;
            float _3061 = _2497 * _3059;
            float _3063 = -_3021;
            float _3065 = _2503 * _3063;
            float _3067 = -_3021;
            float _3069 = _2509 * _3067;
            float _3071 = -_3021;
            float _3073 = _2515 * _3071;
            float _3075 = -_3021;
            float _3077 = _2521 * _3075;
            float _3079 = -_3021;
            float _3081 = _2527 * _3079;
            float _3083 = -_3021;
            float _3085 = _2533 * _3083;
            float _3087 = -_3021;
            float _3089 = _2539 * _3087;
            float _3091 = -_3021;
            float _3093 = _2545 * _3091;
            float _3095 = -_3021;
            float _3097 = _2551 * _3095;
            float _3099 = -_3021;
            float _3101 = _2557 * _3099;
            float _3103 = -_3021;
            float _3105 = _2563 * _3103;
            float _3107 = -_3021;
            float _3109 = _2569 * _3107;
            float _3111 = -_3021;
            float _3113 = _2575 * _3111;
            float _3115 = -_3021;
            float _3117 = _2581 * _3115;
            float _3119 = -_3021;
            float _3121 = _2587 * _3119;
            float _3123 = -_3021;
            float _3125 = _2593 * _3123;
            float _3127 = -_3021;
            float _3129 = _2599 * _3127;
            float _3131 = -_3021;
            float _3133 = _2605 * _3131;
            float _3135 = -_3021;
            float _3137 = _2611 * _3135;
            float _3139 = -_3021;
            float _3141 = _2619 * _3139;
            float _3143 = -_3021;
            float _3145 = _2625 * _3143;
            float _3147 = -_3021;
            float _3149 = _2631 * _3147;
            float _3151 = -_3021;
            float _3153 = _2637 * _3151;
            float _3155 = -_3023;
            float _3157 = fma(_3155, _2645, _3029);
            float _3159 = -_3023;
            float _3161 = fma(_3159, _2651, _3033);
            float _3163 = -_3023;
            float _3165 = fma(_3163, _2657, _3037);
            float _3167 = -_3023;
            float _3169 = fma(_3167, _2663, _3041);
            float _3171 = -_3023;
            float _3173 = fma(_3171, _2671, _3045);
            float _3175 = -_3023;
            float _3177 = fma(_3175, _2677, _3049);
            float _3179 = -_3023;
            float _3181 = fma(_3179, _2683, _3053);
            float _3183 = -_3023;
            float _3185 = fma(_3183, _2689, _3057);
            float _3187 = -_3023;
            float _3189 = fma(_3187, _2697, _3061);
            float _3191 = -_3023;
            float _3193 = fma(_3191, _2703, _3065);
            float _3195 = -_3023;
            float _3197 = fma(_3195, _2709, _3069);
            float _3199 = -_3023;
            float _3201 = fma(_3199, _2715, _3073);
            float _3203 = -_3023;
            float _3205 = fma(_3203, _2723, _3077);
            float _3207 = -_3023;
            float _3209 = fma(_3207, _2729, _3081);
            float _3211 = -_3023;
            float _3213 = fma(_3211, _2735, _3085);
            float _3215 = -_3023;
            float _3217 = fma(_3215, _2741, _3089);
            float _3219 = -_3023;
            float _3221 = fma(_3219, _2749, _3093);
            float _3223 = -_3023;
            float _3225 = fma(_3223, _2755, _3097);
            float _3227 = -_3023;
            float _3229 = fma(_3227, _2761, _3101);
            float _3231 = -_3023;
            float _3233 = fma(_3231, _2767, _3105);
            float _3235 = -_3023;
            float _3237 = fma(_3235, _2775, _3109);
            float _3239 = -_3023;
            float _3241 = fma(_3239, _2781, _3113);
            float _3243 = -_3023;
            float _3245 = fma(_3243, _2787, _3117);
            float _3247 = -_3023;
            float _3249 = fma(_3247, _2793, _3121);
            float _3251 = -_3023;
            float _3253 = fma(_3251, _2801, _3125);
            float _3255 = -_3023;
            float _3257 = fma(_3255, _2807, _3129);
            float _3259 = -_3023;
            float _3261 = fma(_3259, _2813, _3133);
            float _3263 = -_3023;
            float _3265 = fma(_3263, _2819, _3137);
            float _3267 = -_3023;
            float _3269 = fma(_3267, _2825, _3141);
            float _3271 = -_3023;
            float _3273 = fma(_3271, _2831, _3145);
            float _3275 = -_3023;
            float _3277 = fma(_3275, _2837, _3149);
            float _3279 = -_3023;
            float _3281 = fma(_3279, _2843, _3153);
            float _3283 = fma(_3025, _2847, _3157);
            float _3285 = fma(_3025, _2853, _3161);
            float _3287 = fma(_3025, _2859, _3165);
            float _3289 = fma(_3025, _2865, _3169);
            float _3291 = fma(_3025, _2869, _3173);
            float _3293 = fma(_3025, _2875, _3177);
            float _3295 = fma(_3025, _2881, _3181);
            float _3297 = fma(_3025, _2887, _3185);
            float _3299 = fma(_3025, _2891, _3189);
            float _3301 = fma(_3025, _2897, _3193);
            float _3303 = fma(_3025, _2903, _3197);
            float _3305 = fma(_3025, _2909, _3201);
            float _3307 = fma(_3025, _2913, _3205);
            float _3309 = fma(_3025, _2919, _3209);
            float _3311 = fma(_3025, _2925, _3213);
            float _3313 = fma(_3025, _2931, _3217);
            float _3315 = fma(_3025, _2935, _3221);
            float _3317 = fma(_3025, _2941, _3225);
            float _3319 = fma(_3025, _2947, _3229);
            float _3321 = fma(_3025, _2953, _3233);
            float _3323 = fma(_3025, _2957, _3237);
            float _3325 = fma(_3025, _2963, _3241);
            float _3327 = fma(_3025, _2969, _3245);
            float _3329 = fma(_3025, _2975, _3249);
            float _3331 = fma(_3025, _2979, _3253);
            float _3333 = fma(_3025, _2985, _3257);
            float _3335 = fma(_3025, _2991, _3261);
            float _3337 = fma(_3025, _2997, _3265);
            float _3339 = fma(_3025, _3001, _3269);
            float _3341 = fma(_3025, _3007, _3273);
            float _3343 = fma(_3025, _3013, _3277);
            float _3345 = fma(_3025, _3019, _3281);
            _2373 = _3297;
            _2375 = _3293;
            _2377 = _3325;
            _2379 = _3307;
            _2381 = _3291;
            _2383 = _3311;
            _2385 = _3327;
            _2387 = _3309;
            _2389 = _3313;
            _2391 = _3329;
            _2393 = _3295;
            _2395 = _3323;
            _2397 = _3341;
            _2399 = _3289;
            _2401 = _3339;
            _2403 = _3299;
            _2405 = _3301;
            _2407 = _3333;
            _2409 = _3283;
            _2411 = _3285;
            _2413 = _3287;
            _2415 = _3331;
            _2417 = _3343;
            _2419 = _3305;
            _2421 = _3315;
            _2423 = _3335;
            _2425 = _3345;
            _2427 = _3319;
            _2429 = _3321;
            _2431 = _3337;
            _2433 = _3303;
            _2435 = _3317;
            _2437 = true;
        }
    }
    else
    {
        float _3347 = _1519 * (-0.707106769084930419921875);
        float _3349 = _1495 + (-1.0);
        float _3351 = _1519 + (-1.0);
        float _3353 = fma(_1495, 0.707106769084930419921875, _3347);
        bool _3355 = _3353 >= 0.0;
        bool _3357 = !_3355;
        if (!_3357)
        {
            int _3359 = _1571 * 656;
            int _3361 = _3359 + 262144;
            int _3363 = _3359 + 262192;
            int _3365 = _3359 + 262160;
            uint _3367 = uint(int(uint(_3361) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3367)];
            float _3369 = as_type<float>(_dmw48.x);
            int _3371 = _3361 + 4;
            uint _3373 = uint(int(uint(_3371) >> uint(2)));
            float _3375 = as_type<float>(_dmw48.y);
            int _3377 = _3361 + 8;
            uint _3379 = uint(int(uint(_3377) >> uint(2)));
            float _3381 = as_type<float>(_dmw48.z);
            int _3383 = _3361 + 12;
            uint _3385 = uint(int(uint(_3383) >> uint(2)));
            float _3387 = as_type<float>(_dmw48.w);
            int _3389 = _3359 + 262208;
            uint _3391 = uint(int(uint(_3363) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3391)];
            float _3393 = as_type<float>(_dmw51.x);
            int _3395 = _3363 + 4;
            uint _3397 = uint(int(uint(_3395) >> uint(2)));
            float _3399 = as_type<float>(_dmw51.y);
            int _3401 = _3363 + 8;
            uint _3403 = uint(int(uint(_3401) >> uint(2)));
            float _3405 = as_type<float>(_dmw51.z);
            int _3407 = _3363 + 12;
            uint _3409 = uint(int(uint(_3407) >> uint(2)));
            float _3411 = as_type<float>(_dmw51.w);
            int _3413 = _3359 + 262176;
            uint _3415 = uint(int(uint(_3365) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3415)];
            float _3417 = as_type<float>(_dmw49.x);
            int _3419 = _3365 + 4;
            uint _3421 = uint(int(uint(_3419) >> uint(2)));
            float _3423 = as_type<float>(_dmw49.y);
            int _3425 = _3365 + 8;
            uint _3427 = uint(int(uint(_3425) >> uint(2)));
            float _3429 = as_type<float>(_dmw49.z);
            int _3431 = _3365 + 12;
            uint _3433 = uint(int(uint(_3431) >> uint(2)));
            float _3435 = as_type<float>(_dmw49.w);
            int _3437 = _3359 + 262224;
            uint _3439 = uint(int(uint(_3389) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3439)];
            float _3441 = as_type<float>(_dmw52.x);
            int _3443 = _3389 + 4;
            uint _3445 = uint(int(uint(_3443) >> uint(2)));
            float _3447 = as_type<float>(_dmw52.y);
            int _3449 = _3389 + 8;
            uint _3451 = uint(int(uint(_3449) >> uint(2)));
            float _3453 = as_type<float>(_dmw52.z);
            int _3455 = _3389 + 12;
            uint _3457 = uint(int(uint(_3455) >> uint(2)));
            float _3459 = as_type<float>(_dmw52.w);
            int _3461 = _3359 + 262240;
            uint _3463 = uint(int(uint(_3413) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3463)];
            float _3465 = as_type<float>(_dmw50.x);
            int _3467 = _3413 + 4;
            uint _3469 = uint(int(uint(_3467) >> uint(2)));
            float _3471 = as_type<float>(_dmw50.y);
            int _3473 = _3413 + 8;
            uint _3475 = uint(int(uint(_3473) >> uint(2)));
            float _3477 = as_type<float>(_dmw50.z);
            int _3479 = _3413 + 12;
            uint _3481 = uint(int(uint(_3479) >> uint(2)));
            float _3483 = as_type<float>(_dmw50.w);
            int _3485 = _3359 + 262256;
            uint _3487 = uint(int(uint(_3437) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3487)];
            float _3489 = as_type<float>(_dmw53.x);
            int _3491 = _3437 + 4;
            uint _3493 = uint(int(uint(_3491) >> uint(2)));
            float _3495 = as_type<float>(_dmw53.y);
            int _3497 = _3437 + 8;
            uint _3499 = uint(int(uint(_3497) >> uint(2)));
            float _3501 = as_type<float>(_dmw53.z);
            int _3503 = _3437 + 12;
            uint _3505 = uint(int(uint(_3503) >> uint(2)));
            float _3507 = as_type<float>(_dmw53.w);
            int _3509 = _1523 * 656;
            uint _3511 = uint(int(uint(_3461) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3511)];
            float _3513 = as_type<float>(_dmw54.x);
            int _3515 = _3461 + 4;
            uint _3517 = uint(int(uint(_3515) >> uint(2)));
            float _3519 = as_type<float>(_dmw54.y);
            int _3521 = _3461 + 8;
            uint _3523 = uint(int(uint(_3521) >> uint(2)));
            float _3525 = as_type<float>(_dmw54.z);
            int _3527 = _3461 + 12;
            uint _3529 = uint(int(uint(_3527) >> uint(2)));
            float _3531 = as_type<float>(_dmw54.w);
            int _3533 = _1573 * 656;
            int _3535 = _3509 + 262144;
            uint _3537 = uint(int(uint(_3485) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3537)];
            float _3539 = as_type<float>(_dmw55.x);
            int _3541 = _3485 + 4;
            uint _3543 = uint(int(uint(_3541) >> uint(2)));
            float _3545 = as_type<float>(_dmw55.y);
            int _3547 = _3485 + 8;
            uint _3549 = uint(int(uint(_3547) >> uint(2)));
            float _3551 = as_type<float>(_dmw55.z);
            int _3553 = _3485 + 12;
            uint _3555 = uint(int(uint(_3553) >> uint(2)));
            float _3557 = as_type<float>(_dmw55.w);
            int _3559 = _3509 + 262192;
            int _3561 = _3509 + 262160;
            uint _3563 = uint(int(uint(_3535) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3563)];
            float _3565 = as_type<float>(_dmw56.x);
            int _3567 = _3535 + 4;
            uint _3569 = uint(int(uint(_3567) >> uint(2)));
            float _3571 = as_type<float>(_dmw56.y);
            int _3573 = _3535 + 8;
            uint _3575 = uint(int(uint(_3573) >> uint(2)));
            float _3577 = as_type<float>(_dmw56.z);
            int _3579 = _3535 + 12;
            uint _3581 = uint(int(uint(_3579) >> uint(2)));
            float _3583 = as_type<float>(_dmw56.w);
            int _3585 = _3509 + 262208;
            int _3587 = _3509 + 262176;
            uint _3589 = uint(int(uint(_3559) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3589)];
            float _3591 = as_type<float>(_dmw59.x);
            int _3593 = _3559 + 4;
            uint _3595 = uint(int(uint(_3593) >> uint(2)));
            float _3597 = as_type<float>(_dmw59.y);
            int _3599 = _3559 + 8;
            uint _3601 = uint(int(uint(_3599) >> uint(2)));
            float _3603 = as_type<float>(_dmw59.z);
            int _3605 = _3559 + 12;
            uint _3607 = uint(int(uint(_3605) >> uint(2)));
            float _3609 = as_type<float>(_dmw59.w);
            int _3611 = _3509 + 262224;
            int _3613 = _3509 + 262240;
            uint _3615 = uint(int(uint(_3561) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3615)];
            float _3617 = as_type<float>(_dmw57.x);
            int _3619 = _3561 + 4;
            uint _3621 = uint(int(uint(_3619) >> uint(2)));
            float _3623 = as_type<float>(_dmw57.y);
            int _3625 = _3561 + 8;
            uint _3627 = uint(int(uint(_3625) >> uint(2)));
            float _3629 = as_type<float>(_dmw57.z);
            int _3631 = _3561 + 12;
            uint _3633 = uint(int(uint(_3631) >> uint(2)));
            float _3635 = as_type<float>(_dmw57.w);
            int _3637 = _3509 + 262256;
            int _3639 = _3533 + 262144;
            uint _3641 = uint(int(uint(_3585) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3641)];
            float _3643 = as_type<float>(_dmw60.x);
            int _3645 = _3585 + 4;
            uint _3647 = uint(int(uint(_3645) >> uint(2)));
            float _3649 = as_type<float>(_dmw60.y);
            int _3651 = _3585 + 8;
            uint _3653 = uint(int(uint(_3651) >> uint(2)));
            float _3655 = as_type<float>(_dmw60.z);
            int _3657 = _3585 + 12;
            uint _3659 = uint(int(uint(_3657) >> uint(2)));
            float _3661 = as_type<float>(_dmw60.w);
            int _3663 = _3533 + 262192;
            int _3665 = _3533 + 262160;
            uint _3667 = uint(int(uint(_3587) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3667)];
            float _3669 = as_type<float>(_dmw58.x);
            int _3671 = _3587 + 4;
            uint _3673 = uint(int(uint(_3671) >> uint(2)));
            float _3675 = as_type<float>(_dmw58.y);
            int _3677 = _3587 + 8;
            uint _3679 = uint(int(uint(_3677) >> uint(2)));
            float _3681 = as_type<float>(_dmw58.z);
            int _3683 = _3587 + 12;
            uint _3685 = uint(int(uint(_3683) >> uint(2)));
            float _3687 = as_type<float>(_dmw58.w);
            int _3689 = _3533 + 262208;
            int _3691 = _3533 + 262176;
            uint _3693 = uint(int(uint(_3611) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3693)];
            float _3695 = as_type<float>(_dmw61.x);
            int _3697 = _3611 + 4;
            uint _3699 = uint(int(uint(_3697) >> uint(2)));
            float _3701 = as_type<float>(_dmw61.y);
            int _3703 = _3611 + 8;
            uint _3705 = uint(int(uint(_3703) >> uint(2)));
            float _3707 = as_type<float>(_dmw61.z);
            int _3709 = _3611 + 12;
            uint _3711 = uint(int(uint(_3709) >> uint(2)));
            float _3713 = as_type<float>(_dmw61.w);
            int _3715 = _3533 + 262224;
            int _3717 = _3533 + 262240;
            uint _3719 = uint(int(uint(_3613) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3719)];
            float _3721 = as_type<float>(_dmw62.x);
            int _3723 = _3613 + 4;
            uint _3725 = uint(int(uint(_3723) >> uint(2)));
            float _3727 = as_type<float>(_dmw62.y);
            int _3729 = _3613 + 8;
            uint _3731 = uint(int(uint(_3729) >> uint(2)));
            float _3733 = as_type<float>(_dmw62.z);
            int _3735 = _3613 + 12;
            uint _3737 = uint(int(uint(_3735) >> uint(2)));
            float _3739 = as_type<float>(_dmw62.w);
            int _3741 = _3533 + 262256;
            uint _3743 = uint(int(uint(_3637) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3743)];
            float _3745 = as_type<float>(_dmw63.x);
            int _3747 = _3637 + 4;
            uint _3749 = uint(int(uint(_3747) >> uint(2)));
            float _3751 = as_type<float>(_dmw63.y);
            int _3753 = _3637 + 8;
            uint _3755 = uint(int(uint(_3753) >> uint(2)));
            float _3757 = as_type<float>(_dmw63.z);
            int _3759 = _3637 + 12;
            uint _3761 = uint(int(uint(_3759) >> uint(2)));
            float _3763 = as_type<float>(_dmw63.w);
            uint _3765 = uint(int(uint(_3639) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3765)];
            float _3767 = as_type<float>(_dmw64.x);
            int _3769 = _3639 + 4;
            uint _3771 = uint(int(uint(_3769) >> uint(2)));
            float _3773 = as_type<float>(_dmw64.y);
            int _3775 = _3639 + 8;
            uint _3777 = uint(int(uint(_3775) >> uint(2)));
            float _3779 = as_type<float>(_dmw64.z);
            int _3781 = _3639 + 12;
            uint _3783 = uint(int(uint(_3781) >> uint(2)));
            float _3785 = as_type<float>(_dmw64.w);
            uint _3787 = uint(int(uint(_3663) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3787)];
            float _3789 = as_type<float>(_dmw67.x);
            int _3791 = _3663 + 4;
            uint _3793 = uint(int(uint(_3791) >> uint(2)));
            float _3795 = as_type<float>(_dmw67.y);
            int _3797 = _3663 + 8;
            uint _3799 = uint(int(uint(_3797) >> uint(2)));
            float _3801 = as_type<float>(_dmw67.z);
            int _3803 = _3663 + 12;
            uint _3805 = uint(int(uint(_3803) >> uint(2)));
            float _3807 = as_type<float>(_dmw67.w);
            uint _3809 = uint(int(uint(_3665) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3809)];
            float _3811 = as_type<float>(_dmw65.x);
            int _3813 = _3665 + 4;
            uint _3815 = uint(int(uint(_3813) >> uint(2)));
            float _3817 = as_type<float>(_dmw65.y);
            int _3819 = _3665 + 8;
            uint _3821 = uint(int(uint(_3819) >> uint(2)));
            float _3823 = as_type<float>(_dmw65.z);
            int _3825 = _3665 + 12;
            uint _3827 = uint(int(uint(_3825) >> uint(2)));
            float _3829 = as_type<float>(_dmw65.w);
            uint _3831 = uint(int(uint(_3689) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3831)];
            float _3833 = as_type<float>(_dmw68.x);
            int _3835 = _3689 + 4;
            uint _3837 = uint(int(uint(_3835) >> uint(2)));
            float _3839 = as_type<float>(_dmw68.y);
            int _3841 = _3689 + 8;
            uint _3843 = uint(int(uint(_3841) >> uint(2)));
            float _3845 = as_type<float>(_dmw68.z);
            int _3847 = _3689 + 12;
            uint _3849 = uint(int(uint(_3847) >> uint(2)));
            float _3851 = as_type<float>(_dmw68.w);
            uint _3853 = uint(int(uint(_3691) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3853)];
            float _3855 = as_type<float>(_dmw66.x);
            int _3857 = _3691 + 4;
            uint _3859 = uint(int(uint(_3857) >> uint(2)));
            float _3861 = as_type<float>(_dmw66.y);
            int _3863 = _3691 + 8;
            uint _3865 = uint(int(uint(_3863) >> uint(2)));
            float _3867 = as_type<float>(_dmw66.z);
            int _3869 = _3691 + 12;
            uint _3871 = uint(int(uint(_3869) >> uint(2)));
            float _3873 = as_type<float>(_dmw66.w);
            uint _3875 = uint(int(uint(_3715) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3875)];
            float _3877 = as_type<float>(_dmw69.x);
            int _3879 = _3715 + 4;
            uint _3881 = uint(int(uint(_3879) >> uint(2)));
            float _3883 = as_type<float>(_dmw69.y);
            int _3885 = _3715 + 8;
            uint _3887 = uint(int(uint(_3885) >> uint(2)));
            float _3889 = as_type<float>(_dmw69.z);
            int _3891 = _3715 + 12;
            uint _3893 = uint(int(uint(_3891) >> uint(2)));
            float _3895 = as_type<float>(_dmw69.w);
            uint _3897 = uint(int(uint(_3717) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3897)];
            float _3899 = as_type<float>(_dmw70.x);
            int _3901 = _3717 + 4;
            uint _3903 = uint(int(uint(_3901) >> uint(2)));
            float _3905 = as_type<float>(_dmw70.y);
            int _3907 = _3717 + 8;
            uint _3909 = uint(int(uint(_3907) >> uint(2)));
            float _3911 = as_type<float>(_dmw70.z);
            int _3913 = _3717 + 12;
            uint _3915 = uint(int(uint(_3913) >> uint(2)));
            float _3917 = as_type<float>(_dmw70.w);
            uint _3919 = uint(int(uint(_3741) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3919)];
            float _3921 = as_type<float>(_dmw71.x);
            int _3923 = _3741 + 4;
            uint _3925 = uint(int(uint(_3923) >> uint(2)));
            float _3927 = as_type<float>(_dmw71.y);
            int _3929 = _3741 + 8;
            uint _3931 = uint(int(uint(_3929) >> uint(2)));
            float _3933 = as_type<float>(_dmw71.z);
            int _3935 = _3741 + 12;
            uint _3937 = uint(int(uint(_3935) >> uint(2)));
            float _3939 = as_type<float>(_dmw71.w);
            float _3941 = -_3351;
            float _3943 = _3349 + _3941;
            float _3945 = -_3943;
            float _3947 = _1495 + _3945;
            float _3949 = _3369 * _3943;
            float _3951 = _3375 * _3943;
            float _3953 = _3381 * _3943;
            float _3955 = _3387 * _3943;
            float _3957 = _3393 * _3943;
            float _3959 = _3399 * _3943;
            float _3961 = _3405 * _3943;
            float _3963 = _3411 * _3943;
            float _3965 = _3417 * _3943;
            float _3967 = _3423 * _3943;
            float _3969 = _3429 * _3943;
            float _3971 = _3435 * _3943;
            float _3973 = _3441 * _3943;
            float _3975 = _3447 * _3943;
            float _3977 = _3453 * _3943;
            float _3979 = _3459 * _3943;
            float _3981 = _3465 * _3943;
            float _3983 = _3471 * _3943;
            float _3985 = _3477 * _3943;
            float _3987 = _3483 * _3943;
            float _3989 = _3489 * _3943;
            float _3991 = _3495 * _3943;
            float _3993 = _3501 * _3943;
            float _3995 = _3507 * _3943;
            float _3997 = _3513 * _3943;
            float _3999 = _3519 * _3943;
            float _4001 = _3525 * _3943;
            float _4003 = _3531 * _3943;
            float _4005 = _3539 * _3943;
            float _4007 = _3545 * _3943;
            float _4009 = _3551 * _3943;
            float _4011 = _3557 * _3943;
            float _4013 = -_3349;
            float _4015 = fma(_3565, _4013, _3949);
            float _4017 = -_3349;
            float _4019 = fma(_3571, _4017, _3951);
            float _4021 = -_3349;
            float _4023 = fma(_3577, _4021, _3953);
            float _4025 = -_3349;
            float _4027 = fma(_3583, _4025, _3955);
            float _4029 = -_3349;
            float _4031 = fma(_3591, _4029, _3957);
            float _4033 = -_3349;
            float _4035 = fma(_3597, _4033, _3959);
            float _4037 = -_3349;
            float _4039 = fma(_3603, _4037, _3961);
            float _4041 = -_3349;
            float _4043 = fma(_3609, _4041, _3963);
            float _4045 = -_3349;
            float _4047 = fma(_3617, _4045, _3965);
            float _4049 = -_3349;
            float _4051 = fma(_3623, _4049, _3967);
            float _4053 = -_3349;
            float _4055 = fma(_3629, _4053, _3969);
            float _4057 = -_3349;
            float _4059 = fma(_3635, _4057, _3971);
            float _4061 = -_3349;
            float _4063 = fma(_3643, _4061, _3973);
            float _4065 = -_3349;
            float _4067 = fma(_3649, _4065, _3975);
            float _4069 = -_3349;
            float _4071 = fma(_3655, _4069, _3977);
            float _4073 = -_3349;
            float _4075 = fma(_3661, _4073, _3979);
            float _4077 = -_3349;
            float _4079 = fma(_3669, _4077, _3981);
            float _4081 = -_3349;
            float _4083 = fma(_3675, _4081, _3983);
            float _4085 = -_3349;
            float _4087 = fma(_3681, _4085, _3985);
            float _4089 = -_3349;
            float _4091 = fma(_3687, _4089, _3987);
            float _4093 = -_3349;
            float _4095 = fma(_3695, _4093, _3989);
            float _4097 = -_3349;
            float _4099 = fma(_3701, _4097, _3991);
            float _4101 = -_3349;
            float _4103 = fma(_3707, _4101, _3993);
            float _4105 = -_3349;
            float _4107 = fma(_3713, _4105, _3995);
            float _4109 = -_3349;
            float _4111 = fma(_3721, _4109, _3997);
            float _4113 = -_3349;
            float _4115 = fma(_3727, _4113, _3999);
            float _4117 = -_3349;
            float _4119 = fma(_3733, _4117, _4001);
            float _4121 = -_3349;
            float _4123 = fma(_3739, _4121, _4003);
            float _4125 = -_3349;
            float _4127 = fma(_3745, _4125, _4005);
            float _4129 = -_3349;
            float _4131 = fma(_3751, _4129, _4007);
            float _4133 = -_3349;
            float _4135 = fma(_3757, _4133, _4009);
            float _4137 = -_3349;
            float _4139 = fma(_3763, _4137, _4011);
            float _4141 = fma(_3767, _3947, _4015);
            float _4143 = fma(_3773, _3947, _4019);
            float _4145 = fma(_3779, _3947, _4023);
            float _4147 = fma(_3785, _3947, _4027);
            float _4149 = fma(_3789, _3947, _4031);
            float _4151 = fma(_3795, _3947, _4035);
            float _4153 = fma(_3801, _3947, _4039);
            float _4155 = fma(_3807, _3947, _4043);
            float _4157 = fma(_3811, _3947, _4047);
            float _4159 = fma(_3817, _3947, _4051);
            float _4161 = fma(_3823, _3947, _4055);
            float _4163 = fma(_3829, _3947, _4059);
            float _4165 = fma(_3833, _3947, _4063);
            float _4167 = fma(_3839, _3947, _4067);
            float _4169 = fma(_3845, _3947, _4071);
            float _4171 = fma(_3851, _3947, _4075);
            float _4173 = fma(_3855, _3947, _4079);
            float _4175 = fma(_3861, _3947, _4083);
            float _4177 = fma(_3867, _3947, _4087);
            float _4179 = fma(_3873, _3947, _4091);
            float _4181 = fma(_3877, _3947, _4095);
            float _4183 = fma(_3883, _3947, _4099);
            float _4185 = fma(_3889, _3947, _4103);
            float _4187 = fma(_3895, _3947, _4107);
            float _4189 = fma(_3899, _3947, _4111);
            float _4191 = fma(_3905, _3947, _4115);
            float _4193 = fma(_3911, _3947, _4119);
            float _4195 = fma(_3917, _3947, _4123);
            float _4197 = fma(_3921, _3947, _4127);
            float _4199 = fma(_3927, _3947, _4131);
            float _4201 = fma(_3933, _3947, _4135);
            float _4203 = fma(_3939, _3947, _4139);
            _2373 = _4155;
            _2375 = _4151;
            _2377 = _4183;
            _2379 = _4165;
            _2381 = _4149;
            _2383 = _4169;
            _2385 = _4185;
            _2387 = _4167;
            _2389 = _4171;
            _2391 = _4187;
            _2393 = _4153;
            _2395 = _4181;
            _2397 = _4199;
            _2399 = _4147;
            _2401 = _4197;
            _2403 = _4157;
            _2405 = _4159;
            _2407 = _4191;
            _2409 = _4141;
            _2411 = _4143;
            _2413 = _4145;
            _2415 = _4189;
            _2417 = _4201;
            _2419 = _4163;
            _2421 = _4173;
            _2423 = _4193;
            _2425 = _4203;
            _2427 = _4177;
            _2429 = _4179;
            _2431 = _4195;
            _2433 = _4161;
            _2435 = _4175;
            _2437 = true;
        }
        else
        {
            int _4205 = _1569 * 656;
            int _4207 = _4205 + 262144;
            int _4209 = _4205 + 262192;
            int _4211 = _4205 + 262160;
            uint _4213 = uint(int(uint(_4207) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4213)];
            float _4215 = as_type<float>(_dmw72.x);
            int _4217 = _4207 + 4;
            uint _4219 = uint(int(uint(_4217) >> uint(2)));
            float _4221 = as_type<float>(_dmw72.y);
            int _4223 = _4207 + 8;
            uint _4225 = uint(int(uint(_4223) >> uint(2)));
            float _4227 = as_type<float>(_dmw72.z);
            int _4229 = _4207 + 12;
            uint _4231 = uint(int(uint(_4229) >> uint(2)));
            float _4233 = as_type<float>(_dmw72.w);
            int _4235 = _4205 + 262208;
            uint _4237 = uint(int(uint(_4209) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4237)];
            float _4239 = as_type<float>(_dmw75.x);
            int _4241 = _4209 + 4;
            uint _4243 = uint(int(uint(_4241) >> uint(2)));
            float _4245 = as_type<float>(_dmw75.y);
            int _4247 = _4209 + 8;
            uint _4249 = uint(int(uint(_4247) >> uint(2)));
            float _4251 = as_type<float>(_dmw75.z);
            int _4253 = _4209 + 12;
            uint _4255 = uint(int(uint(_4253) >> uint(2)));
            float _4257 = as_type<float>(_dmw75.w);
            int _4259 = _4205 + 262176;
            uint _4261 = uint(int(uint(_4211) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4261)];
            float _4263 = as_type<float>(_dmw73.x);
            int _4265 = _4211 + 4;
            uint _4267 = uint(int(uint(_4265) >> uint(2)));
            float _4269 = as_type<float>(_dmw73.y);
            int _4271 = _4211 + 8;
            uint _4273 = uint(int(uint(_4271) >> uint(2)));
            float _4275 = as_type<float>(_dmw73.z);
            int _4277 = _4211 + 12;
            uint _4279 = uint(int(uint(_4277) >> uint(2)));
            float _4281 = as_type<float>(_dmw73.w);
            int _4283 = _4205 + 262224;
            uint _4285 = uint(int(uint(_4235) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4285)];
            float _4287 = as_type<float>(_dmw76.x);
            int _4289 = _4235 + 4;
            uint _4291 = uint(int(uint(_4289) >> uint(2)));
            float _4293 = as_type<float>(_dmw76.y);
            int _4295 = _4235 + 8;
            uint _4297 = uint(int(uint(_4295) >> uint(2)));
            float _4299 = as_type<float>(_dmw76.z);
            int _4301 = _4235 + 12;
            uint _4303 = uint(int(uint(_4301) >> uint(2)));
            float _4305 = as_type<float>(_dmw76.w);
            int _4307 = _4205 + 262240;
            uint _4309 = uint(int(uint(_4259) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4309)];
            float _4311 = as_type<float>(_dmw74.x);
            int _4313 = _4259 + 4;
            uint _4315 = uint(int(uint(_4313) >> uint(2)));
            float _4317 = as_type<float>(_dmw74.y);
            int _4319 = _4259 + 8;
            uint _4321 = uint(int(uint(_4319) >> uint(2)));
            float _4323 = as_type<float>(_dmw74.z);
            int _4325 = _4259 + 12;
            uint _4327 = uint(int(uint(_4325) >> uint(2)));
            float _4329 = as_type<float>(_dmw74.w);
            int _4331 = _4205 + 262256;
            uint _4333 = uint(int(uint(_4283) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4333)];
            float _4335 = as_type<float>(_dmw77.x);
            int _4337 = _4283 + 4;
            uint _4339 = uint(int(uint(_4337) >> uint(2)));
            float _4341 = as_type<float>(_dmw77.y);
            int _4343 = _4283 + 8;
            uint _4345 = uint(int(uint(_4343) >> uint(2)));
            float _4347 = as_type<float>(_dmw77.z);
            int _4349 = _4283 + 12;
            uint _4351 = uint(int(uint(_4349) >> uint(2)));
            float _4353 = as_type<float>(_dmw77.w);
            int _4355 = _1523 * 656;
            uint _4357 = uint(int(uint(_4307) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4357)];
            float _4359 = as_type<float>(_dmw78.x);
            int _4361 = _4307 + 4;
            uint _4363 = uint(int(uint(_4361) >> uint(2)));
            float _4365 = as_type<float>(_dmw78.y);
            int _4367 = _4307 + 8;
            uint _4369 = uint(int(uint(_4367) >> uint(2)));
            float _4371 = as_type<float>(_dmw78.z);
            int _4373 = _4307 + 12;
            uint _4375 = uint(int(uint(_4373) >> uint(2)));
            float _4377 = as_type<float>(_dmw78.w);
            int _4379 = _1573 * 656;
            int _4381 = _4355 + 262144;
            uint _4383 = uint(int(uint(_4331) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4383)];
            float _4385 = as_type<float>(_dmw79.x);
            int _4387 = _4331 + 4;
            uint _4389 = uint(int(uint(_4387) >> uint(2)));
            float _4391 = as_type<float>(_dmw79.y);
            int _4393 = _4331 + 8;
            uint _4395 = uint(int(uint(_4393) >> uint(2)));
            float _4397 = as_type<float>(_dmw79.z);
            int _4399 = _4331 + 12;
            uint _4401 = uint(int(uint(_4399) >> uint(2)));
            float _4403 = as_type<float>(_dmw79.w);
            int _4405 = _4355 + 262192;
            int _4407 = _4355 + 262160;
            uint _4409 = uint(int(uint(_4381) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4409)];
            float _4411 = as_type<float>(_dmw80.x);
            int _4413 = _4381 + 4;
            uint _4415 = uint(int(uint(_4413) >> uint(2)));
            float _4417 = as_type<float>(_dmw80.y);
            int _4419 = _4381 + 8;
            uint _4421 = uint(int(uint(_4419) >> uint(2)));
            float _4423 = as_type<float>(_dmw80.z);
            int _4425 = _4381 + 12;
            uint _4427 = uint(int(uint(_4425) >> uint(2)));
            float _4429 = as_type<float>(_dmw80.w);
            int _4431 = _4355 + 262208;
            int _4433 = _4355 + 262176;
            uint _4435 = uint(int(uint(_4405) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4435)];
            float _4437 = as_type<float>(_dmw83.x);
            int _4439 = _4405 + 4;
            uint _4441 = uint(int(uint(_4439) >> uint(2)));
            float _4443 = as_type<float>(_dmw83.y);
            int _4445 = _4405 + 8;
            uint _4447 = uint(int(uint(_4445) >> uint(2)));
            float _4449 = as_type<float>(_dmw83.z);
            int _4451 = _4405 + 12;
            uint _4453 = uint(int(uint(_4451) >> uint(2)));
            float _4455 = as_type<float>(_dmw83.w);
            int _4457 = _4355 + 262224;
            int _4459 = _4355 + 262240;
            uint _4461 = uint(int(uint(_4407) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4461)];
            float _4463 = as_type<float>(_dmw81.x);
            int _4465 = _4407 + 4;
            uint _4467 = uint(int(uint(_4465) >> uint(2)));
            float _4469 = as_type<float>(_dmw81.y);
            int _4471 = _4407 + 8;
            uint _4473 = uint(int(uint(_4471) >> uint(2)));
            float _4475 = as_type<float>(_dmw81.z);
            int _4477 = _4407 + 12;
            uint _4479 = uint(int(uint(_4477) >> uint(2)));
            float _4481 = as_type<float>(_dmw81.w);
            int _4483 = _4355 + 262256;
            int _4485 = _4379 + 262144;
            uint _4487 = uint(int(uint(_4431) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4487)];
            float _4489 = as_type<float>(_dmw84.x);
            int _4491 = _4431 + 4;
            uint _4493 = uint(int(uint(_4491) >> uint(2)));
            float _4495 = as_type<float>(_dmw84.y);
            int _4497 = _4431 + 8;
            uint _4499 = uint(int(uint(_4497) >> uint(2)));
            float _4501 = as_type<float>(_dmw84.z);
            int _4503 = _4431 + 12;
            uint _4505 = uint(int(uint(_4503) >> uint(2)));
            float _4507 = as_type<float>(_dmw84.w);
            int _4509 = _4379 + 262192;
            int _4511 = _4379 + 262160;
            uint _4513 = uint(int(uint(_4433) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4513)];
            float _4515 = as_type<float>(_dmw82.x);
            int _4517 = _4433 + 4;
            uint _4519 = uint(int(uint(_4517) >> uint(2)));
            float _4521 = as_type<float>(_dmw82.y);
            int _4523 = _4433 + 8;
            uint _4525 = uint(int(uint(_4523) >> uint(2)));
            float _4527 = as_type<float>(_dmw82.z);
            int _4529 = _4433 + 12;
            uint _4531 = uint(int(uint(_4529) >> uint(2)));
            float _4533 = as_type<float>(_dmw82.w);
            int _4535 = _4379 + 262208;
            int _4537 = _4379 + 262176;
            uint _4539 = uint(int(uint(_4457) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4539)];
            float _4541 = as_type<float>(_dmw85.x);
            int _4543 = _4457 + 4;
            uint _4545 = uint(int(uint(_4543) >> uint(2)));
            float _4547 = as_type<float>(_dmw85.y);
            int _4549 = _4457 + 8;
            uint _4551 = uint(int(uint(_4549) >> uint(2)));
            float _4553 = as_type<float>(_dmw85.z);
            int _4555 = _4457 + 12;
            uint _4557 = uint(int(uint(_4555) >> uint(2)));
            float _4559 = as_type<float>(_dmw85.w);
            int _4561 = _4379 + 262224;
            int _4563 = _4379 + 262240;
            uint _4565 = uint(int(uint(_4459) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4565)];
            float _4567 = as_type<float>(_dmw86.x);
            int _4569 = _4459 + 4;
            uint _4571 = uint(int(uint(_4569) >> uint(2)));
            float _4573 = as_type<float>(_dmw86.y);
            int _4575 = _4459 + 8;
            uint _4577 = uint(int(uint(_4575) >> uint(2)));
            float _4579 = as_type<float>(_dmw86.z);
            int _4581 = _4459 + 12;
            uint _4583 = uint(int(uint(_4581) >> uint(2)));
            float _4585 = as_type<float>(_dmw86.w);
            int _4587 = _4379 + 262256;
            uint _4589 = uint(int(uint(_4483) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4589)];
            float _4591 = as_type<float>(_dmw87.x);
            int _4593 = _4483 + 4;
            uint _4595 = uint(int(uint(_4593) >> uint(2)));
            float _4597 = as_type<float>(_dmw87.y);
            int _4599 = _4483 + 8;
            uint _4601 = uint(int(uint(_4599) >> uint(2)));
            float _4603 = as_type<float>(_dmw87.z);
            int _4605 = _4483 + 12;
            uint _4607 = uint(int(uint(_4605) >> uint(2)));
            float _4609 = as_type<float>(_dmw87.w);
            uint _4611 = uint(int(uint(_4485) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4611)];
            float _4613 = as_type<float>(_dmw88.x);
            int _4615 = _4485 + 4;
            uint _4617 = uint(int(uint(_4615) >> uint(2)));
            float _4619 = as_type<float>(_dmw88.y);
            int _4621 = _4485 + 8;
            uint _4623 = uint(int(uint(_4621) >> uint(2)));
            float _4625 = as_type<float>(_dmw88.z);
            int _4627 = _4485 + 12;
            uint _4629 = uint(int(uint(_4627) >> uint(2)));
            float _4631 = as_type<float>(_dmw88.w);
            uint _4633 = uint(int(uint(_4509) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4633)];
            float _4635 = as_type<float>(_dmw91.x);
            int _4637 = _4509 + 4;
            uint _4639 = uint(int(uint(_4637) >> uint(2)));
            float _4641 = as_type<float>(_dmw91.y);
            int _4643 = _4509 + 8;
            uint _4645 = uint(int(uint(_4643) >> uint(2)));
            float _4647 = as_type<float>(_dmw91.z);
            int _4649 = _4509 + 12;
            uint _4651 = uint(int(uint(_4649) >> uint(2)));
            float _4653 = as_type<float>(_dmw91.w);
            uint _4655 = uint(int(uint(_4511) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4655)];
            float _4657 = as_type<float>(_dmw89.x);
            int _4659 = _4511 + 4;
            uint _4661 = uint(int(uint(_4659) >> uint(2)));
            float _4663 = as_type<float>(_dmw89.y);
            int _4665 = _4511 + 8;
            uint _4667 = uint(int(uint(_4665) >> uint(2)));
            float _4669 = as_type<float>(_dmw89.z);
            int _4671 = _4511 + 12;
            uint _4673 = uint(int(uint(_4671) >> uint(2)));
            float _4675 = as_type<float>(_dmw89.w);
            uint _4677 = uint(int(uint(_4535) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4677)];
            float _4679 = as_type<float>(_dmw92.x);
            int _4681 = _4535 + 4;
            uint _4683 = uint(int(uint(_4681) >> uint(2)));
            float _4685 = as_type<float>(_dmw92.y);
            int _4687 = _4535 + 8;
            uint _4689 = uint(int(uint(_4687) >> uint(2)));
            float _4691 = as_type<float>(_dmw92.z);
            int _4693 = _4535 + 12;
            uint _4695 = uint(int(uint(_4693) >> uint(2)));
            float _4697 = as_type<float>(_dmw92.w);
            uint _4699 = uint(int(uint(_4537) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4699)];
            float _4701 = as_type<float>(_dmw90.x);
            int _4703 = _4537 + 4;
            uint _4705 = uint(int(uint(_4703) >> uint(2)));
            float _4707 = as_type<float>(_dmw90.y);
            int _4709 = _4537 + 8;
            uint _4711 = uint(int(uint(_4709) >> uint(2)));
            float _4713 = as_type<float>(_dmw90.z);
            int _4715 = _4537 + 12;
            uint _4717 = uint(int(uint(_4715) >> uint(2)));
            float _4719 = as_type<float>(_dmw90.w);
            uint _4721 = uint(int(uint(_4561) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4721)];
            float _4723 = as_type<float>(_dmw93.x);
            int _4725 = _4561 + 4;
            uint _4727 = uint(int(uint(_4725) >> uint(2)));
            float _4729 = as_type<float>(_dmw93.y);
            int _4731 = _4561 + 8;
            uint _4733 = uint(int(uint(_4731) >> uint(2)));
            float _4735 = as_type<float>(_dmw93.z);
            int _4737 = _4561 + 12;
            uint _4739 = uint(int(uint(_4737) >> uint(2)));
            float _4741 = as_type<float>(_dmw93.w);
            uint _4743 = uint(int(uint(_4563) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4743)];
            float _4745 = as_type<float>(_dmw94.x);
            int _4747 = _4563 + 4;
            uint _4749 = uint(int(uint(_4747) >> uint(2)));
            float _4751 = as_type<float>(_dmw94.y);
            int _4753 = _4563 + 8;
            uint _4755 = uint(int(uint(_4753) >> uint(2)));
            float _4757 = as_type<float>(_dmw94.z);
            int _4759 = _4563 + 12;
            uint _4761 = uint(int(uint(_4759) >> uint(2)));
            float _4763 = as_type<float>(_dmw94.w);
            uint _4765 = uint(int(uint(_4587) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4765)];
            float _4767 = as_type<float>(_dmw95.x);
            int _4769 = _4587 + 4;
            uint _4771 = uint(int(uint(_4769) >> uint(2)));
            float _4773 = as_type<float>(_dmw95.y);
            int _4775 = _4587 + 8;
            uint _4777 = uint(int(uint(_4775) >> uint(2)));
            float _4779 = as_type<float>(_dmw95.z);
            int _4781 = _4587 + 12;
            uint _4783 = uint(int(uint(_4781) >> uint(2)));
            float _4785 = as_type<float>(_dmw95.w);
            float _4787 = -_3349;
            float _4789 = _4787 + _3351;
            float _4791 = -_4789;
            float _4793 = _1519 + _4791;
            float _4795 = _4215 * _4789;
            float _4797 = _4221 * _4789;
            float _4799 = _4227 * _4789;
            float _4801 = _4233 * _4789;
            float _4803 = _4239 * _4789;
            float _4805 = _4245 * _4789;
            float _4807 = _4251 * _4789;
            float _4809 = _4257 * _4789;
            float _4811 = _4263 * _4789;
            float _4813 = _4269 * _4789;
            float _4815 = _4275 * _4789;
            float _4817 = _4281 * _4789;
            float _4819 = _4287 * _4789;
            float _4821 = _4293 * _4789;
            float _4823 = _4299 * _4789;
            float _4825 = _4305 * _4789;
            float _4827 = _4311 * _4789;
            float _4829 = _4317 * _4789;
            float _4831 = _4323 * _4789;
            float _4833 = _4329 * _4789;
            float _4835 = _4335 * _4789;
            float _4837 = _4341 * _4789;
            float _4839 = _4347 * _4789;
            float _4841 = _4353 * _4789;
            float _4843 = _4359 * _4789;
            float _4845 = _4365 * _4789;
            float _4847 = _4371 * _4789;
            float _4849 = _4377 * _4789;
            float _4851 = _4385 * _4789;
            float _4853 = _4391 * _4789;
            float _4855 = _4397 * _4789;
            float _4857 = _4403 * _4789;
            float _4859 = -_3351;
            float _4861 = fma(_4411, _4859, _4795);
            float _4863 = -_3351;
            float _4865 = fma(_4417, _4863, _4797);
            float _4867 = -_3351;
            float _4869 = fma(_4423, _4867, _4799);
            float _4871 = -_3351;
            float _4873 = fma(_4429, _4871, _4801);
            float _4875 = -_3351;
            float _4877 = fma(_4437, _4875, _4803);
            float _4879 = -_3351;
            float _4881 = fma(_4443, _4879, _4805);
            float _4883 = -_3351;
            float _4885 = fma(_4449, _4883, _4807);
            float _4887 = -_3351;
            float _4889 = fma(_4455, _4887, _4809);
            float _4891 = -_3351;
            float _4893 = fma(_4463, _4891, _4811);
            float _4895 = -_3351;
            float _4897 = fma(_4469, _4895, _4813);
            float _4899 = -_3351;
            float _4901 = fma(_4475, _4899, _4815);
            float _4903 = -_3351;
            float _4905 = fma(_4481, _4903, _4817);
            float _4907 = -_3351;
            float _4909 = fma(_4489, _4907, _4819);
            float _4911 = -_3351;
            float _4913 = fma(_4495, _4911, _4821);
            float _4915 = -_3351;
            float _4917 = fma(_4501, _4915, _4823);
            float _4919 = -_3351;
            float _4921 = fma(_4507, _4919, _4825);
            float _4923 = -_3351;
            float _4925 = fma(_4515, _4923, _4827);
            float _4927 = -_3351;
            float _4929 = fma(_4521, _4927, _4829);
            float _4931 = -_3351;
            float _4933 = fma(_4527, _4931, _4831);
            float _4935 = -_3351;
            float _4937 = fma(_4533, _4935, _4833);
            float _4939 = -_3351;
            float _4941 = fma(_4541, _4939, _4835);
            float _4943 = -_3351;
            float _4945 = fma(_4547, _4943, _4837);
            float _4947 = -_3351;
            float _4949 = fma(_4553, _4947, _4839);
            float _4951 = -_3351;
            float _4953 = fma(_4559, _4951, _4841);
            float _4955 = -_3351;
            float _4957 = fma(_4567, _4955, _4843);
            float _4959 = -_3351;
            float _4961 = fma(_4573, _4959, _4845);
            float _4963 = -_3351;
            float _4965 = fma(_4579, _4963, _4847);
            float _4967 = -_3351;
            float _4969 = fma(_4585, _4967, _4849);
            float _4971 = -_3351;
            float _4973 = fma(_4591, _4971, _4851);
            float _4975 = -_3351;
            float _4977 = fma(_4597, _4975, _4853);
            float _4979 = -_3351;
            float _4981 = fma(_4603, _4979, _4855);
            float _4983 = -_3351;
            float _4985 = fma(_4609, _4983, _4857);
            float _4987 = fma(_4613, _4793, _4861);
            float _4989 = fma(_4619, _4793, _4865);
            float _4991 = fma(_4625, _4793, _4869);
            float _4993 = fma(_4631, _4793, _4873);
            float _4995 = fma(_4635, _4793, _4877);
            float _4997 = fma(_4641, _4793, _4881);
            float _4999 = fma(_4647, _4793, _4885);
            float _5001 = fma(_4653, _4793, _4889);
            float _5003 = fma(_4657, _4793, _4893);
            float _5005 = fma(_4663, _4793, _4897);
            float _5007 = fma(_4669, _4793, _4901);
            float _5009 = fma(_4675, _4793, _4905);
            float _5011 = fma(_4679, _4793, _4909);
            float _5013 = fma(_4685, _4793, _4913);
            float _5015 = fma(_4691, _4793, _4917);
            float _5017 = fma(_4697, _4793, _4921);
            float _5019 = fma(_4701, _4793, _4925);
            float _5021 = fma(_4707, _4793, _4929);
            float _5023 = fma(_4713, _4793, _4933);
            float _5025 = fma(_4719, _4793, _4937);
            float _5027 = fma(_4723, _4793, _4941);
            float _5029 = fma(_4729, _4793, _4945);
            float _5031 = fma(_4735, _4793, _4949);
            float _5033 = fma(_4741, _4793, _4953);
            float _5035 = fma(_4745, _4793, _4957);
            float _5037 = fma(_4751, _4793, _4961);
            float _5039 = fma(_4757, _4793, _4965);
            float _5041 = fma(_4763, _4793, _4969);
            float _5043 = fma(_4767, _4793, _4973);
            float _5045 = fma(_4773, _4793, _4977);
            float _5047 = fma(_4779, _4793, _4981);
            float _5049 = fma(_4785, _4793, _4985);
            _2373 = _5001;
            _2375 = _4997;
            _2377 = _5029;
            _2379 = _5011;
            _2381 = _4995;
            _2383 = _5015;
            _2385 = _5031;
            _2387 = _5013;
            _2389 = _5017;
            _2391 = _5033;
            _2393 = _4999;
            _2395 = _5027;
            _2397 = _5045;
            _2399 = _4993;
            _2401 = _5043;
            _2403 = _5003;
            _2405 = _5005;
            _2407 = _5037;
            _2409 = _4987;
            _2411 = _4989;
            _2413 = _4991;
            _2415 = _5035;
            _2417 = _5047;
            _2419 = _5009;
            _2421 = _5019;
            _2423 = _5039;
            _2425 = _5049;
            _2427 = _5023;
            _2429 = _5025;
            _2431 = _5041;
            _2433 = _5007;
            _2435 = _5021;
        }
    }
    _2437 = false;
    float _5051 = _2373;
    float _5053 = _2375;
    float _5055 = _2377;
    float _5057 = _2379;
    float _5059 = _2381;
    float _5061 = _2383;
    float _5063 = _2385;
    float _5065 = _2387;
    float _5067 = _2389;
    float _5069 = _2391;
    float _5071 = _2393;
    float _5073 = _2395;
    float _5075 = _2397;
    float _5077 = _2399;
    float _5079 = _2401;
    float _5081 = _2403;
    float _5083 = _2405;
    float _5085 = _2407;
    float _5087 = _2409;
    float _5089 = _2411;
    float _5091 = _2413;
    float _5093 = _2415;
    float _5095 = _2417;
    float _5097 = _2419;
    float _5099 = _2421;
    float _5101 = _2423;
    float _5103 = _2425;
    float _5105 = _2427;
    float _5107 = _2429;
    float _5109 = _2431;
    float _5111 = _2433;
    float _5113 = _2435;
    float _5115 = _5051 * 0.511664927005767822265625;
    float _5117 = _5053 * 0.88622760772705078125;
    float _5119 = _5055 * 0.511664927005767822265625;
    float _5121 = _5057 * 0.511664927005767822265625;
    float _5123 = _5115 * _5115;
    float _5125 = _5059 * 0.88622760772705078125;
    float _5127 = _5061 * 0.511664927005767822265625;
    float _5129 = precise::max(_5117, 0.00999999977648258209228515625);
    float _5131 = fma(_5119, _5119, _5123);
    float _5133 = _5063 * 0.511664927005767822265625;
    float _5135 = _5121 * _5121;
    float _5137 = _5065 * 0.511664927005767822265625;
    float _5139 = precise::max(_5125, 0.00999999977648258209228515625);
    float _5141 = fma(_5127, _5127, _5131);
    float _5143 = 1.0 / _5129;
    float _5145 = _5067 * 0.511664927005767822265625;
    float _5147 = fma(_5133, _5133, _5135);
    float _5149 = _5069 * 0.511664927005767822265625;
    float _5151 = _5071 * 0.88622760772705078125;
    float _5153 = _5073 * 0.511664927005767822265625;
    float _5155 = 1.0 / _5139;
    float _5157 = _5137 * _5137;
    float _5159 = precise::max(_5151, 0.00999999977648258209228515625);
    float _5161 = fma(_1465, 1.9073486328125, 0.5);
    float _5163 = fma(_5149, _5149, _5157);
    float _5165 = sqrt(_5141);
    float _5167 = fma(_5145, _5145, _5147);
    float _5169 = fma(_5153, _5153, _5163);
    float _5171 = _1465 * 3.903682708740234375;
    float _5173 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5175 = _5173 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5177 = _5171 * _5075;
    float _5179 = sqrt(_5167);
    float _5181 = _5171 * _5077;
    float _5183 = fma(_5079, 0.88622701168060302734375, _5177);
    float _5185 = _5171 * _5081;
    float _5187 = _5171 * _5083;
    float _5189 = _5171 * _5085;
    float _5191 = fma(_5087, 0.88622701168060302734375, _5181);
    float _5193 = 1.0 / _5159;
    float _5195 = precise::max(_5165, 0.00999999977648258209228515625);
    float _5197 = fma(_5089, 0.88622701168060302734375, _5185);
    float _5199 = fma(_5091, 0.88622701168060302734375, _5187);
    float _5201 = fma(_5093, 0.88622701168060302734375, _5189);
    float _5203 = sqrt(_5169);
    float _5205 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5207 = _5205 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5209 = precise::max(_5179, 0.00999999977648258209228515625);
    int _5211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5213 = _5211 != 0;
    float _5215 = fma(_5161, _5207, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5217 = 1.0 / _5195;
    float _5219 = _5209 * _5143;
    float _5221 = precise::clamp(_5219, 0.0, 1.0);
    float _5223 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5225 = _5223 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5227 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5229 = _5227 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5231 = fma(_5161, _5225, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5233 = precise::max(_5203, 0.00999999977648258209228515625);
    float _5235 = 1.0 / _5209;
    float _5237 = fma(_5161, _5229, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5239 = _5231 * 0.715200006961822509765625;
    float _5241 = _5195 * _5155;
    float _5243 = precise::clamp(_5241, 0.0, 1.0);
    float _5245 = _5233 * _5193;
    float _5247 = precise::clamp(_5245, 0.0, 1.0);
    float _5249 = _5221 + 1.0;
    float _5251 = fma(_5215, 0.2125999927520751953125, _5239);
    float _5253 = _5119 * _5217;
    float _5255 = 1.0 / _5233;
    float _5257 = _5115 * _5217;
    float _5259 = fma(_5237, 0.072200000286102294921875, _5251);
    float _5261 = _5243 + 1.0;
    float _5263 = 1.0 / _5259;
    float _5265 = _5121 * _5235;
    float _5267 = _5127 * _5217;
    float _5269 = _5133 * _5235;
    float _5271 = _5145 * _5235;
    float _5273 = _1527 * _5265;
    float _5275 = _5137 * _5255;
    float _5277 = _1527 * _5257;
    float _5279 = _5149 * _5255;
    float _5281 = -_1511;
    float _5283 = fma(_5281, _5269, _5273);
    float _5285 = _1527 * _5275;
    float _5287 = -_1511;
    float _5289 = fma(_5287, _5253, _5277);
    float _5291 = _5153 * _5255;
    float _5293 = -_1525;
    float _5295 = fma(_5293, _5271, _5283);
    float _5297 = -_1511;
    float _5299 = fma(_5297, _5279, _5285);
    float _5301 = -_1525;
    float _5303 = fma(_5301, _5267, _5289);
    float _5305 = _5247 + 1.0;
    float _5307 = fma(_5295, 0.5, 0.5);
    float _5309 = -_1525;
    float _5311 = fma(_5309, _5291, _5299);
    float _5313 = fma(_5303, 0.5, 0.5);
    float _5315 = 1.0 / _5305;
    float _5317 = fma(_5311, 0.5, 0.5);
    float _5319 = _5263 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5321 = precise::clamp(_5319, 0.0, 1.0);
    float _5323 = _1525 * (-1.02332699298858642578125);
    float _5325 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5327 = _5325 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5329 = fma(_5321, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5331 = abs(_5313);
    float _5333 = log2(_5331);
    float _5335 = fma(_5161, _5175, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5337 = fma(_5323, _5095, _5183);
    float _5339 = fma(_5161, _5327, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5341 = fma(_5323, _5097, _5197);
    float _5343 = fma(_5323, _5099, _5199);
    float _5345 = fma(_5323, _5101, _5201);
    float _5347 = _5231 * _5329;
    float _5349 = abs(_5307);
    float _5351 = log2(_5349);
    float _5353 = _1511 * (-1.02332699298858642578125);
    float _5355 = fma(_5353, _5103, _5337);
    float _5357 = fma(_5353, _5105, _5341);
    float _5359 = fma(_5353, _5107, _5343);
    float _5361 = abs(_5317);
    float _5363 = log2(_5361);
    float _5365 = fma(_5353, _5109, _5345);
    float _5367 = precise::max(0.0, _5355);
    float _5369 = precise::max(0.0, _5357);
    float _5371 = precise::max(0.0, _5359);
    float _5373 = _5367 * 0.31830990314483642578125;
    float _5375 = precise::clamp(_5373, 0.0, 1.0);
    float _5377 = 1.0 / _5249;
    float _5379 = precise::max(0.0, _5365);
    float _5381 = _5369 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5383 = -_5375;
    float _5385 = _5383 + 1.0;
    float _5387 = _5371 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5389 = _5379 * 0.31830990314483642578125;
    float _5391 = precise::clamp(_5389, 0.0, 1.0);
    float _5393 = fma(_5385, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5375);
    float _5395 = 1.0 / _5261;
    float _5397 = fma(_5243, 2.0, 1.0);
    float _5399 = _5237 * _5329;
    float _5401 = precise::max(_5381, _5347);
    float _5403 = _5391 * 0.88622701168060302734375;
    float _5405 = _5397 * _5333;
    float _5407 = fma(_5221, 2.0, 1.0);
    float _5409 = precise::max(_5387, _5399);
    float _5411 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5401);
    float _5413 = _5407 * _5351;
    float _5415 = fma(_5247, 2.0, 1.0);
    float _5417 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5409);
    float _5419 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5421 = _5419 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5423 = _5415 * _5363;
    float _5425 = exp2(_5413);
    float _5427 = -_5243;
    float _5429 = _5427 + 1.0;
    float _5431 = fma(_5161, _5421, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5433 = fma(_5243, 2.0, 2.0);
    float _5435 = -_5221;
    float _5437 = _5435 + 1.0;
    float _5439 = fma(_5221, 2.0, 2.0);
    float _5441 = fma(_5323, _5111, _5191);
    float _5443 = _5429 * _5395;
    float _5445 = exp2(_5405);
    float _5447 = _5437 * _5377;
    float _5449 = fma(_5353, _5113, _5441);
    float _5451 = precise::max(0.0, _5449);
    float _5453 = exp2(_5423);
    float _5455 = fma(_5247, 2.0, 2.0);
    float _5457 = -_5247;
    float _5459 = _5457 + 1.0;
    float _5461 = _5439 * _5425;
    float _5463 = _5451 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5465 = _5459 * _5315;
    float _5467 = _5215 * _5329;
    float _5469 = _5433 * _5445;
    float _5471 = -_5461;
    float _5473 = _5471 + 1.0;
    float _5475 = -_5469;
    float _5477 = _5475 + 1.0;
    float _5479 = fma(_5447, _5473, _5461);
    float _5481 = precise::max(_5463, _5467);
    float _5483 = _5455 * _5453;
    float _5485 = fma(_5443, _5477, _5469);
    float _5487 = _5117 * _5479;
    float _5489 = fma(_5403, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5481);
    float _5491 = -_5483;
    float _5493 = _5491 + 1.0;
    float _5495 = _5125 * _5485;
    float _5497 = fma(_5465, _5493, _5483);
    float _5499 = _5495 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5501 = _5487 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5503 = _5151 * _5497;
    float _5505 = precise::max(_5499, _5339);
    float _5507 = _5503 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5509 = precise::max(_5501, _5431);
    float _5511 = fma(_5505, _5393, _5489);
    float _5513 = precise::max(_5507, _5335);
    float _5515 = fma(_5509, _5393, _5411);
    float _5517 = fma(_5513, _5393, _5417);
    bool _5519 = !_5213;
    float _5521;
    float _5523;
    float _5525;
    float _5527;
    float _5529;
    float _5531;
    float _5533;
    float _5535;
    float _5537;
    float _5539;
    int _5541;
    float _5543;
    float _5545;
    float _5547;
    float _5549;
    float _5551;
    float _5553;
    float _5555;
    int _5557;
    float _5559;
    int _5561;
    float _5563;
    int _5565;
    int _5567;
    int _5569;
    float _5571;
    float _5573;
    int _5575;
    float _5577;
    int _5579;
    int _5581;
    float _5583;
    if (!_5519)
    {
        _5521 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5523 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5525 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5527 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5529 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5531 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5533 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5535 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5537 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5539 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5543 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5545 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5547 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5549 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5551 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5553 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5555 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5559 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5563 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5571 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5573 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5577 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5583 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5585 = true;
    }
    else
    {
        float _5587 = fma(_1057, 6.2500002968590706586837768554688e-05, 0.5);
        float _5589 = fma(_1055, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14865 = float3(_5587, _5589, float(0));
        float3 _14867 = select(_14865, float3(0.0), isnan(_14865));
        float4 _5591 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14867.xy, uint(rint(_14867.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14867.xy, uint(rint(_14867.z)), level(0.0)).xyzw;
        float _5593 = _5591.x;
        float _5595 = _5591.y;
        float _5597 = _5591.z;
        float _5599 = _5591.w;
        float3 _14882 = float3(_5587, _5589, float(1));
        float3 _14884 = select(_14882, float3(0.0), isnan(_14882));
        float4 _5601 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14884.xy, uint(rint(_14884.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14884.xy, uint(rint(_14884.z)), level(0.0)).xyzw;
        float _5603 = _5601.x;
        float _5605 = _5601.y;
        float _5607 = _5601.z;
        float _5609 = _5601.w;
        float3 _14899 = float3(_5587, _5589, float(2));
        float3 _14901 = select(_14899, float3(0.0), isnan(_14899));
        float4 _5611 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14901.xy, uint(rint(_14901.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14901.xy, uint(rint(_14901.z)), level(0.0)).xyzw;
        float _5613 = _5611.x;
        float _5615 = _5611.y;
        float _5617 = _5611.z;
        float _5619 = _5611.w;
        float3 _14916 = float3(_5587, _5589, float(3));
        float3 _14918 = select(_14916, float3(0.0), isnan(_14916));
        float4 _5621 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14918.xy, uint(rint(_14918.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14918.xy, uint(rint(_14918.z)), level(0.0)).xyzw;
        float _5623 = _5621.x;
        float _5625 = _5621.y;
        float _5627 = _5621.z;
        float _5629 = _5621.w;
        float3 _14933 = float3(_5587, _5589, float(4));
        float3 _14935 = select(_14933, float3(0.0), isnan(_14933));
        float4 _5631 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14935.xy, uint(rint(_14935.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14935.xy, uint(rint(_14935.z)), level(0.0)).xyzw;
        float _5633 = _5631.x;
        float _5635 = _5631.y;
        float _5637 = _5631.z;
        float _5639 = _5631.w;
        float3 _14950 = float3(_5587, _5589, float(5));
        float3 _14952 = select(_14950, float3(0.0), isnan(_14950));
        float4 _5641 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14952.xy, uint(rint(_14952.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14952.xy, uint(rint(_14952.z)), level(0.0)).xyzw;
        float _5643 = _5641.x;
        float _5645 = _5641.y;
        float _5647 = _5641.z;
        float _5649 = _5641.w;
        float3 _14967 = float3(_5587, _5589, float(6));
        float3 _14969 = select(_14967, float3(0.0), isnan(_14967));
        float4 _5651 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14969.xy, uint(rint(_14969.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14969.xy, uint(rint(_14969.z)), level(0.0)).xyzw;
        float _5653 = _5651.x;
        float _5655 = _5651.y;
        float _5657 = _5651.z;
        float _5659 = _5651.w;
        float3 _14984 = float3(_5587, _5589, float(7));
        float3 _14986 = select(_14984, float3(0.0), isnan(_14984));
        float4 _5661 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14986.xy, uint(rint(_14986.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14986.xy, uint(rint(_14986.z)), level(0.0)).xyzw;
        float _5663 = _5661.x;
        float _5665 = _5661.y;
        float _5667 = _5661.z;
        float _5669 = _5661.w;
        _5521 = _5655;
        _5523 = _5665;
        _5525 = _5623;
        _5527 = _5625;
        _5529 = _5653;
        _5531 = _5663;
        _5533 = _5599;
        _5535 = _5657;
        _5537 = _5627;
        _5539 = _5667;
        _5541 = as_type<int>(_5629);
        _5543 = _5659;
        _5545 = _5593;
        _5547 = _5603;
        _5549 = _5605;
        _5551 = _5669;
        _5553 = _5595;
        _5555 = _5597;
        _5557 = as_type<int>(_5635);
        _5559 = _5609;
        _5561 = as_type<int>(_5633);
        _5563 = _5607;
        _5565 = as_type<int>(_5637);
        _5567 = as_type<int>(_5639);
        _5569 = as_type<int>(_5643);
        _5571 = _5615;
        _5573 = _5613;
        _5575 = as_type<int>(_5645);
        _5577 = _5617;
        _5579 = as_type<int>(_5649);
        _5581 = as_type<int>(_5647);
        _5583 = _5619;
    }
    _5585 = false;
    float _5671 = _5521;
    float _5673 = _5523;
    float _5675 = _5525;
    float _5677 = _5527;
    float _5679 = _5529;
    float _5681 = _5531;
    float _5683 = _5533;
    float _5685 = _5535;
    float _5687 = _5537;
    float _5689 = _5539;
    int _5691 = _5541;
    float _5693 = _5543;
    float _5695 = _5545;
    float _5697 = _5547;
    float _5699 = _5549;
    float _5701 = _5551;
    float _5703 = _5553;
    float _5705 = _5555;
    int _5707 = _5557;
    float _5709 = _5559;
    int _5711 = _5561;
    float _5713 = _5563;
    int _5715 = _5565;
    int _5717 = _5567;
    int _5719 = _5569;
    float _5721 = _5571;
    float _5723 = _5573;
    int _5725 = _5575;
    float _5727 = _5577;
    int _5729 = _5579;
    int _5731 = _5581;
    float _5733 = _5583;
    float _5735 = _5171 * _5671;
    float _5737 = _5171 * _5673;
    float _5739 = _5675 * 0.88622701168060302734375;
    float _5741 = _5677 * 0.88622701168060302734375;
    float _5743 = fma(_5679, 0.88622701168060302734375, _5735);
    float _5745 = fma(_5681, 0.88622701168060302734375, _5737);
    float _5747 = _5171 * _5683;
    out.m_54.x = _1431;
    out.m_54.y = _1435;
    float _5749 = fma(_5323, _5685, _5743);
    float _5751 = _5687 * 0.88622701168060302734375;
    float _5753 = fma(_5323, _5689, _5745);
    float _5755 = _5213 ? as_type<float>(_5691) : 0.0;
    float _5757 = fma(_5353, _5693, _5749);
    out.m_56.x = _1057;
    out.m_56.y = _1161;
    out.m_56.z = _1055;
    float _5759 = fma(_5695, 0.88622701168060302734375, _5747);
    float _5761 = _5171 * _5697;
    float _5763 = _5171 * _5699;
    float _5765 = _5213 ? _5739 : 0.0;
    float _5767 = fma(_5353, _5701, _5753);
    float _5769 = _5213 ? _5741 : 0.0;
    float _5771 = fma(_5703, 0.88622701168060302734375, _5761);
    float _5773 = precise::max(0.0, _5757);
    float _5775 = fma(_5705, 0.88622701168060302734375, _5763);
    float _5777 = _5213 ? as_type<float>(_5707) : 0.0;
    float _5779 = fma(_5323, _5709, _5771);
    float _5781 = _5213 ? as_type<float>(_5711) : 0.0;
    float _5783 = fma(_5171, _5755, _5765);
    float _5785 = _5213 ? _5751 : 0.0;
    float _5787 = fma(_5323, _5713, _5759);
    float _5789 = _5213 ? as_type<float>(_5715) : 0.0;
    float _5791 = fma(_5171, _5781, _5769);
    float _5793 = _5213 ? as_type<float>(_5717) : 0.0;
    float _5795 = _5773 * 0.31830990314483642578125;
    float _5797 = precise::clamp(_5795, 0.0, 1.0);
    float _5799 = _5213 ? as_type<float>(_5719) : 0.0;
    float _5801 = fma(_5171, _5777, _5785);
    float _5803 = precise::max(0.0, _5767);
    float _5805 = fma(_5353, _5721, _5787);
    float _5807 = fma(_5323, _5723, _5775);
    out.m_58.z = _736;
    float _5809 = _5797 * 0.88622701168060302734375;
    float _5811 = fma(_5323, _5793, _5791);
    float _5813 = fma(_5323, _5799, _5801);
    float _5815 = _5803 * 0.31830990314483642578125;
    float _5817 = precise::clamp(_5815, 0.0, 1.0);
    float _5819 = _5213 ? as_type<float>(_5725) : 0.0;
    float _5821 = fma(_5353, _5727, _5779);
    float _5823 = _5213 ? as_type<float>(_5729) : 0.0;
    float _5825 = fma(_5323, _5789, _5783);
    float _5827 = _5213 ? as_type<float>(_5731) : 0.0;
    float _5829 = fma(_5353, _5733, _5807);
    float _5831 = precise::max(0.0, _5805);
    float _5833 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    out.gl_Position.x = _1529;
    out.gl_Position.y = _1531;
    float _15254 = as_type<float>(_1537);
    out.gl_Position.z = _15254;
    out.gl_Position.w = _1533;
    float _5835 = -_5817;
    float _5837 = _5835 + 1.0;
    float _5839 = fma(_5353, _5819, _5825);
    float _5841 = fma(_5353, _5827, _5811);
    float _5843 = fma(_5353, _5823, _5813);
    float _5845 = fma(_5831, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5833);
    float _5847 = precise::max(0.0, _5821);
    float _5849 = fma(_5837, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5817);
    float _5851 = precise::max(0.0, _5829);
    float _5853 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5855 = _5809 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5857 = precise::max(0.0, _5839);
    float _5859 = -_1511;
    float _5861 = (-0.0) + _5859;
    float _5863 = precise::max(0.0, _5841);
    float _5865 = sqrt(_1521);
    float _5867 = precise::max(0.0, _5843);
    float _5869 = _5849 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5871 = fma(_5847, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5853);
    float _5873 = fma(_5851, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5855);
    float _5875 = -_1525;
    float _5877 = (-0.0) + _5875;
    float _5879 = fma(_5857, _5869, _5845);
    float _5881 = fma(_5863, _5869, _5871);
    float _5883 = -_1179;
    float _5885 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _5887 = _5883 + _5885;
    float _5889 = fma(_5867, _5869, _5873);
    out.m_60.x = _5511;
    out.m_60.y = _5515;
    out.m_60.z = _5517;
    float _5891 = _5887 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_58.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_62.w = _1179;
    out.m_64.x = _5861;
    out.m_64.y = _1527;
    out.m_64.z = _5877;
    out.m_58.w = _5865;
    out.m_64.w = _5891;
    out.m_62.x = _5879;
    out.m_62.y = _5881;
    out.m_62.z = _5889;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

