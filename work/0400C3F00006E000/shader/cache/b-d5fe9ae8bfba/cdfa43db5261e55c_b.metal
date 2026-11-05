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
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _67 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _69 = _67 << 4;
    bool _73 = _69 == 0;
    bool _75 = _69 == 16;
    bool _77 = _69 == 32;
    bool _79 = _69 == 48;
    bool _81 = _69 == 64;
    float _83 = fma(_64, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _85 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _87 = _69 == 80;
    bool _89 = _60 >= 0.5;
    bool _91 = isnan(_60);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.5);
    bool _97 = _93 || _95;
    float _99 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _101 = _83 + _99;
    float _103 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _105 = _85 + _103;
    float _107 = as_type<float>(gl_BaseInstance);
    if (_73)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _107;
    float _111 = _101 * _101;
    bool _113 = _69 == 96;
    float _115 = 0.0;
    float _117 = _109;
    if (_73)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = fma(_105, _105, _111);
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _123;
    float _127 = _119;
    float _129 = _125;
    if (_75)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _117;
    bool _133 = _69 == 112;
    float _135 = fma(_125, _125, _121);
    float _137 = _131;
    if (_75)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _127;
    float _141 = _139;
    if (_77)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    bool _145 = _69 == 128;
    float _147 = rsqrt(_135);
    float _149 = _143;
    if (_77)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_79)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _69 == 144;
    float _159 = _155;
    if (_79)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_81)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _69 == 160;
    float _169 = _165;
    if (_81)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_87)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _175 = _169;
    float _177 = _147 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _179 = _69 == 176;
    float _181 = _175;
    if (_87)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _173;
    bool _185 = _69 == 192;
    float _187 = log2(_177);
    float _189 = _183;
    if (_113)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _181;
    float _193 = _191;
    if (_113)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _195 = _189;
    float _197 = _195;
    if (_133)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _199 = _193;
    bool _201 = _69 == 208;
    float _203 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_145)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _69 == 224;
    float _213 = _209;
    if (_145)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _215 = _207;
    float _217 = _187 + 1.2999999523162841796875;
    float _219 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _213;
    bool _223 = _69 == 240;
    float _225 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _227 = _219;
    float _229 = trunc(_217);
    int _231 = int(_229);
    float _233 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _225;
    bool _237 = _69 == 256;
    float _239 = _235;
    if (_167)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _241 = _233;
    float _243 = _241;
    if (_179)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _245 = _239;
    bool _247 = _69 == 272;
    float _249 = _245;
    if (_179)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    bool _257 = _69 == 288;
    int _259 = min(_231, 15);
    float _261 = _255;
    if (_185)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    bool _265 = _69 == 304;
    float _267 = float(_259);
    float _269 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _271 = _261;
    int _273 = _259 << 4;
    int _275 = _273 + 4288;
    float _277 = _271;
    float _279 = as_type<float>(_275);
    if (_201)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _281 = _269;
    float _283 = _281;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _285 = _277;
    float _287 = -_267;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _291 = _69 == 320;
    int _293 = _275 + 8;
    uint _296 = uint(int(uint(_293) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c14)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    float _312 = _285;
    if (_211)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _314 = _283;
    float _316 = _289 + 1.0;
    float _318 = _314;
    if (_223)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _320 = _312;
    bool _322 = _69 == 336;
    float _324 = _320;
    if (_223)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _326 = _318;
    float _328 = exp2(_316);
    float _330 = _326;
    if (_237)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _332 = _324;
    bool _334 = _69 == 352;
    float _336 = _332;
    if (_237)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _338 = _330;
    float _340 = _338;
    if (_247)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _342 = _336;
    bool _344 = _69 == 368;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _352 = _346;
    bool _354 = _69 == 384;
    float _356 = 1.0 / _328;
    float _358 = _352;
    float _360 = _328;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _362 = _350;
    float _364 = _362;
    if (_265)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _366 = _358;
    bool _368 = _69 == 400;
    float _370 = _366;
    if (_265)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _372 = _364;
    bool _374 = _69 == 416;
    float _376 = _372;
    if (_291)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _378 = _370;
    float _380 = _378;
    if (_291)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _382 = _376;
    float _384 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _386 = _380;
    bool _388 = _69 == 432;
    float _390 = _386;
    if (_322)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _392 = _384;
    float _394 = _392;
    if (_334)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _396 = _390;
    bool _398 = _69 == 448;
    float _400 = _396;
    if (_334)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _406 = _400;
    bool _408 = _69 == 464;
    float _410 = _406;
    if (_344)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _416 = _410;
    bool _418 = _69 == 480;
    float _420 = _416;
    if (_354)
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
    bool _428 = _69 == 496;
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
    bool _438 = _69 == 512;
    float _440 = _436;
    if (_374)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _442 = _434;
    bool _444 = _69 == 528;
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
    bool _458 = _69 == 544;
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
    bool _468 = _69 == 560;
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
    bool _478 = _69 == 576;
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
    bool _488 = _69 == 592;
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
    bool _498 = _69 == 608;
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
    bool _508 = _69 == 624;
    float _510 = _506;
    if (_444)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _512 = _504;
    bool _514 = _69 == 640;
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
    bool _528 = _69 == 656;
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
    bool _538 = _69 == 672;
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
    bool _548 = _69 == 688;
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
    bool _558 = _69 == 704;
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
    bool _568 = _69 == 720;
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
    bool _578 = _69 == 736;
    float _580 = _576;
    if (_514)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _582 = _574;
    bool _584 = _69 == 752;
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
    float _622 = _614 * _58;
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
    float _650 = _328 * _644;
    float _652 = _648 * 2.0;
    float _654 = -_648;
    float _656 = fma(_650, _654, _58);
    float _658 = floor(_652);
    float _660 = _650 * _658;
    float _662 = _660 * 0.5;
    float _664 = _662 + _656;
    float _666 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _668 = fma(_64, _664, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _670 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _668 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _678 = _670 + _676;
    float _680 = _674 * _674;
    float _682 = fma(_678, _678, _680);
    float _684 = fma(_125, _125, _682);
    float _686 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _688 = _662;
    float _690 = _648;
    if (!_97)
    {
        _129 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _692 = _129;
    float _694 = sqrt(_684);
    float _696 = _692;
    if (!_97)
    {
        float _698 = fma(_666, _692, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _279 = _698;
    }
    float _700 = _279;
    float _702 = _700;
    if (!_97)
    {
        float _704 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _700);
        _360 = _704;
    }
    float _706 = _360;
    float _708 = -_310;
    float _710 = fma(_694, _302, _708);
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = -_662;
    float _716 = fma(_714, _712, _664);
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_97)
    {
        float _722 = fma(_720, _692, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _696 = _722;
    }
    float _724 = _696;
    float _726 = _724;
    if (!_97)
    {
        float _728 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _702 = _728;
    }
    float _730 = _702;
    if (!_97)
    {
        float2 _2033 = float2(_730, _706);
        float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2033, float2(0.0), isnan(_2033)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2033, float2(0.0), isnan(_2033)), level(0.0)).x;
        _726 = _732;
    }
    float _734 = _726;
    if (_97)
    {
        _686 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _736 = _686;
    float _738 = _736;
    if (_97)
    {
        _688 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _740 = _688;
    if (_97)
    {
        float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _736, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _690 = _742;
    }
    float _744 = _690;
    float _746 = _744;
    if (_97)
    {
        float _748 = fma(_718, _736, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _738 = _748;
    }
    float _750 = _738;
    float _752 = _750;
    if (_97)
    {
        float _754 = fma(_744, _740, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _746 = _754;
    }
    float _756 = _746;
    float _758 = _756;
    if (_97)
    {
        float _760 = fma(_750, _740, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_97)
    {
        float _766 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _756);
        _758 = _766;
    }
    float _768 = _758;
    if (_97)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _770;
    }
    float _772 = _764;
    float _774 = _734;
    if (_97)
    {
        float2 _2126 = float2(_772, _768);
        float _776 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2126, float2(0.0), isnan(_2126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2126, float2(0.0), isnan(_2126)), level(0.0)).x;
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _782 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _786 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_38.y = _780;
    out.m_40.z = _784;
    out.m_40.w = _782;
    out.m_38.x = _786;
    out.m_38.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _790 = _788 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _792 = _788 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _794 = _788 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_42.x = _718;
    out.m_42.y = _788;
    out.m_42.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _796 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[1].x, _790);
    float _798 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[0].x, _792);
    float _800 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[2].x, _794);
    float _802 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _796);
    float _804 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _798);
    float _806 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _800);
    float _808 = _802 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _810 = _804 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _814 = _808 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _816 = _808 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _818 = _808 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _820 = _808 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[8].x, _814);
    float _824 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[7].x, _816);
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[9].x, _818);
    float _828 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[10].x, _820);
    float _830 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[8].z, _822);
    float _832 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[7].z, _824);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[9].z, _826);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[10].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _840 = _832 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _842 = _834 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_44.w = _812;
    out.gl_Position.x = _840;
    out.gl_Position.y = _838;
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
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _67 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _69 = _67 << 4;
    bool _73 = _69 == 0;
    bool _75 = _69 == 16;
    bool _77 = _69 == 32;
    bool _79 = _69 == 48;
    bool _81 = _69 == 64;
    float _83 = fma(_64, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _85 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _87 = _69 == 80;
    bool _89 = _60 >= 0.5;
    bool _91 = isnan(_60);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.5);
    bool _97 = _93 || _95;
    float _99 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _101 = _83 + _99;
    float _103 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _105 = _85 + _103;
    float _107 = as_type<float>(gl_BaseInstance);
    if (_73)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _107;
    float _111 = _101 * _101;
    bool _113 = _69 == 96;
    float _115 = 0.0;
    float _117 = _109;
    if (_73)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = fma(_105, _105, _111);
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _123;
    float _127 = _119;
    float _129 = _125;
    if (_75)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _117;
    bool _133 = _69 == 112;
    float _135 = fma(_125, _125, _121);
    float _137 = _131;
    if (_75)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _127;
    float _141 = _139;
    if (_77)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    bool _145 = _69 == 128;
    float _147 = rsqrt(_135);
    float _149 = _143;
    if (_77)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_79)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _69 == 144;
    float _159 = _155;
    if (_79)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_81)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _69 == 160;
    float _169 = _165;
    if (_81)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_87)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _175 = _169;
    float _177 = _147 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _179 = _69 == 176;
    float _181 = _175;
    if (_87)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _173;
    bool _185 = _69 == 192;
    float _187 = log2(_177);
    float _189 = _183;
    if (_113)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _181;
    float _193 = _191;
    if (_113)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _195 = _189;
    float _197 = _195;
    if (_133)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _199 = _193;
    bool _201 = _69 == 208;
    float _203 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_145)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _69 == 224;
    float _213 = _209;
    if (_145)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _215 = _207;
    float _217 = _187 + 1.2999999523162841796875;
    float _219 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _213;
    bool _223 = _69 == 240;
    float _225 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _227 = _219;
    float _229 = trunc(_217);
    int _231 = int(_229);
    float _233 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _225;
    bool _237 = _69 == 256;
    float _239 = _235;
    if (_167)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _241 = _233;
    float _243 = _241;
    if (_179)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _245 = _239;
    bool _247 = _69 == 272;
    float _249 = _245;
    if (_179)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    bool _257 = _69 == 288;
    int _259 = min(_231, 15);
    float _261 = _255;
    if (_185)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    bool _265 = _69 == 304;
    float _267 = float(_259);
    float _269 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _271 = _261;
    int _273 = _259 << 4;
    int _275 = _273 + 4288;
    float _277 = _271;
    float _279 = as_type<float>(_275);
    if (_201)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _281 = _269;
    float _283 = _281;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _285 = _277;
    float _287 = -_267;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _291 = _69 == 320;
    int _293 = _275 + 8;
    uint _296 = uint(int(uint(_293) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c14)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    float _312 = _285;
    if (_211)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _314 = _283;
    float _316 = _289 + 1.0;
    float _318 = _314;
    if (_223)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _320 = _312;
    bool _322 = _69 == 336;
    float _324 = _320;
    if (_223)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _326 = _318;
    float _328 = exp2(_316);
    float _330 = _326;
    if (_237)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _332 = _324;
    bool _334 = _69 == 352;
    float _336 = _332;
    if (_237)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _338 = _330;
    float _340 = _338;
    if (_247)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _342 = _336;
    bool _344 = _69 == 368;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _352 = _346;
    bool _354 = _69 == 384;
    float _356 = 1.0 / _328;
    float _358 = _352;
    float _360 = _328;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _362 = _350;
    float _364 = _362;
    if (_265)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _366 = _358;
    bool _368 = _69 == 400;
    float _370 = _366;
    if (_265)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _372 = _364;
    bool _374 = _69 == 416;
    float _376 = _372;
    if (_291)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _378 = _370;
    float _380 = _378;
    if (_291)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _382 = _376;
    float _384 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _386 = _380;
    bool _388 = _69 == 432;
    float _390 = _386;
    if (_322)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _392 = _384;
    float _394 = _392;
    if (_334)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _396 = _390;
    bool _398 = _69 == 448;
    float _400 = _396;
    if (_334)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _406 = _400;
    bool _408 = _69 == 464;
    float _410 = _406;
    if (_344)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _416 = _410;
    bool _418 = _69 == 480;
    float _420 = _416;
    if (_354)
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
    bool _428 = _69 == 496;
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
    bool _438 = _69 == 512;
    float _440 = _436;
    if (_374)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _442 = _434;
    bool _444 = _69 == 528;
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
    bool _458 = _69 == 544;
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
    bool _468 = _69 == 560;
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
    bool _478 = _69 == 576;
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
    bool _488 = _69 == 592;
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
    bool _498 = _69 == 608;
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
    bool _508 = _69 == 624;
    float _510 = _506;
    if (_444)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _512 = _504;
    bool _514 = _69 == 640;
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
    bool _528 = _69 == 656;
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
    bool _538 = _69 == 672;
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
    bool _548 = _69 == 688;
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
    bool _558 = _69 == 704;
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
    bool _568 = _69 == 720;
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
    bool _578 = _69 == 736;
    float _580 = _576;
    if (_514)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _582 = _574;
    bool _584 = _69 == 752;
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
    float _622 = _614 * _58;
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
    float _650 = _328 * _644;
    float _652 = _648 * 2.0;
    float _654 = -_648;
    float _656 = fma(_650, _654, _58);
    float _658 = floor(_652);
    float _660 = _650 * _658;
    float _662 = _660 * 0.5;
    float _664 = _662 + _656;
    float _666 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _668 = fma(_64, _664, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _670 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _668 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _678 = _670 + _676;
    float _680 = _674 * _674;
    float _682 = fma(_678, _678, _680);
    float _684 = fma(_125, _125, _682);
    float _686 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _688 = _662;
    float _690 = _648;
    if (!_97)
    {
        _129 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _692 = _129;
    float _694 = sqrt(_684);
    float _696 = _692;
    if (!_97)
    {
        float _698 = fma(_666, _692, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _279 = _698;
    }
    float _700 = _279;
    float _702 = _700;
    if (!_97)
    {
        float _704 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _700);
        _360 = _704;
    }
    float _706 = _360;
    float _708 = -_310;
    float _710 = fma(_694, _302, _708);
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = -_662;
    float _716 = fma(_714, _712, _664);
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_97)
    {
        float _722 = fma(_720, _692, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _696 = _722;
    }
    float _724 = _696;
    float _726 = _724;
    if (!_97)
    {
        float _728 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _702 = _728;
    }
    float _730 = _702;
    if (!_97)
    {
        float2 _2033 = float2(_730, _706);
        float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2033, float2(0.0), isnan(_2033)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2033, float2(0.0), isnan(_2033)), level(0.0)).x;
        _726 = _732;
    }
    float _734 = _726;
    if (_97)
    {
        _686 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _736 = _686;
    float _738 = _736;
    if (_97)
    {
        _688 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _740 = _688;
    if (_97)
    {
        float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _736, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _690 = _742;
    }
    float _744 = _690;
    float _746 = _744;
    if (_97)
    {
        float _748 = fma(_718, _736, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _738 = _748;
    }
    float _750 = _738;
    float _752 = _750;
    if (_97)
    {
        float _754 = fma(_744, _740, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _746 = _754;
    }
    float _756 = _746;
    float _758 = _756;
    if (_97)
    {
        float _760 = fma(_750, _740, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_97)
    {
        float _766 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _756);
        _758 = _766;
    }
    float _768 = _758;
    if (_97)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _770;
    }
    float _772 = _764;
    float _774 = _734;
    if (_97)
    {
        float2 _2126 = float2(_772, _768);
        float _776 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2126, float2(0.0), isnan(_2126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2126, float2(0.0), isnan(_2126)), level(0.0)).x;
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _782 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _786 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_38.y = _780;
    out.m_40.z = _784;
    out.m_40.w = _782;
    out.m_38.x = _786;
    out.m_38.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _790 = _788 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _792 = _788 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _794 = _788 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_42.x = _718;
    out.m_42.y = _788;
    out.m_42.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _796 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[1].x, _790);
    float _798 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[0].x, _792);
    float _800 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[2].x, _794);
    float _802 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _796);
    float _804 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _798);
    float _806 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _800);
    float _808 = _802 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _810 = _804 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _814 = _808 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _816 = _808 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _818 = _808 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _820 = _808 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[8].x, _814);
    float _824 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[7].x, _816);
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[9].x, _818);
    float _828 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[10].x, _820);
    float _830 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[8].z, _822);
    float _832 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[7].z, _824);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[9].z, _826);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[10].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _840 = _832 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _842 = _834 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_44.w = _812;
    out.gl_Position.x = _840;
    out.gl_Position.y = _838;
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
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _67 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _69 = _67 << 4;
    bool _73 = _69 == 0;
    bool _75 = _69 == 16;
    bool _77 = _69 == 32;
    bool _79 = _69 == 48;
    bool _81 = _69 == 64;
    float _83 = fma(_64, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _85 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _87 = _69 == 80;
    bool _89 = _60 >= 0.5;
    bool _91 = isnan(_60);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.5);
    bool _97 = _93 || _95;
    float _99 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _101 = _83 + _99;
    float _103 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _105 = _85 + _103;
    float _107 = as_type<float>(gl_BaseInstance);
    if (_73)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _107;
    float _111 = _101 * _101;
    bool _113 = _69 == 96;
    float _115 = 0.0;
    float _117 = _109;
    if (_73)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = fma(_105, _105, _111);
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _123;
    float _127 = _119;
    float _129 = _125;
    if (_75)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _117;
    bool _133 = _69 == 112;
    float _135 = fma(_125, _125, _121);
    float _137 = _131;
    if (_75)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _127;
    float _141 = _139;
    if (_77)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    bool _145 = _69 == 128;
    float _147 = rsqrt(_135);
    float _149 = _143;
    if (_77)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_79)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _69 == 144;
    float _159 = _155;
    if (_79)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_81)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _69 == 160;
    float _169 = _165;
    if (_81)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_87)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _175 = _169;
    float _177 = _147 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _179 = _69 == 176;
    float _181 = _175;
    if (_87)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _173;
    bool _185 = _69 == 192;
    float _187 = log2(_177);
    float _189 = _183;
    if (_113)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _181;
    float _193 = _191;
    if (_113)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _195 = _189;
    float _197 = _195;
    if (_133)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _199 = _193;
    bool _201 = _69 == 208;
    float _203 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_145)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _69 == 224;
    float _213 = _209;
    if (_145)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _215 = _207;
    float _217 = _187 + 1.2999999523162841796875;
    float _219 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _213;
    bool _223 = _69 == 240;
    float _225 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _227 = _219;
    float _229 = trunc(_217);
    int _231 = int(_229);
    float _233 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _225;
    bool _237 = _69 == 256;
    float _239 = _235;
    if (_167)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _241 = _233;
    float _243 = _241;
    if (_179)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _245 = _239;
    bool _247 = _69 == 272;
    float _249 = _245;
    if (_179)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    bool _257 = _69 == 288;
    int _259 = min(_231, 15);
    float _261 = _255;
    if (_185)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    bool _265 = _69 == 304;
    float _267 = float(_259);
    float _269 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _271 = _261;
    int _273 = _259 << 4;
    int _275 = _273 + 4288;
    float _277 = _271;
    float _279 = as_type<float>(_275);
    if (_201)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _281 = _269;
    float _283 = _281;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _285 = _277;
    float _287 = -_267;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _291 = _69 == 320;
    int _293 = _275 + 8;
    uint _296 = uint(int(uint(_293) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c14)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    float _312 = _285;
    if (_211)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _314 = _283;
    float _316 = _289 + 1.0;
    float _318 = _314;
    if (_223)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _320 = _312;
    bool _322 = _69 == 336;
    float _324 = _320;
    if (_223)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _326 = _318;
    float _328 = exp2(_316);
    float _330 = _326;
    if (_237)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _332 = _324;
    bool _334 = _69 == 352;
    float _336 = _332;
    if (_237)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _338 = _330;
    float _340 = _338;
    if (_247)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _342 = _336;
    bool _344 = _69 == 368;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _352 = _346;
    bool _354 = _69 == 384;
    float _356 = 1.0 / _328;
    float _358 = _352;
    float _360 = _328;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _362 = _350;
    float _364 = _362;
    if (_265)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _366 = _358;
    bool _368 = _69 == 400;
    float _370 = _366;
    if (_265)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _372 = _364;
    bool _374 = _69 == 416;
    float _376 = _372;
    if (_291)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _378 = _370;
    float _380 = _378;
    if (_291)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _382 = _376;
    float _384 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _386 = _380;
    bool _388 = _69 == 432;
    float _390 = _386;
    if (_322)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _392 = _384;
    float _394 = _392;
    if (_334)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _396 = _390;
    bool _398 = _69 == 448;
    float _400 = _396;
    if (_334)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _406 = _400;
    bool _408 = _69 == 464;
    float _410 = _406;
    if (_344)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _416 = _410;
    bool _418 = _69 == 480;
    float _420 = _416;
    if (_354)
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
    bool _428 = _69 == 496;
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
    bool _438 = _69 == 512;
    float _440 = _436;
    if (_374)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _442 = _434;
    bool _444 = _69 == 528;
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
    bool _458 = _69 == 544;
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
    bool _468 = _69 == 560;
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
    bool _478 = _69 == 576;
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
    bool _488 = _69 == 592;
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
    bool _498 = _69 == 608;
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
    bool _508 = _69 == 624;
    float _510 = _506;
    if (_444)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _512 = _504;
    bool _514 = _69 == 640;
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
    bool _528 = _69 == 656;
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
    bool _538 = _69 == 672;
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
    bool _548 = _69 == 688;
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
    bool _558 = _69 == 704;
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
    bool _568 = _69 == 720;
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
    bool _578 = _69 == 736;
    float _580 = _576;
    if (_514)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _582 = _574;
    bool _584 = _69 == 752;
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
    float _622 = _614 * _58;
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
    float _650 = _328 * _644;
    float _652 = _648 * 2.0;
    float _654 = -_648;
    float _656 = fma(_650, _654, _58);
    float _658 = floor(_652);
    float _660 = _650 * _658;
    float _662 = _660 * 0.5;
    float _664 = _662 + _656;
    float _666 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _668 = fma(_64, _664, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _670 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _668 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _678 = _670 + _676;
    float _680 = _674 * _674;
    float _682 = fma(_678, _678, _680);
    float _684 = fma(_125, _125, _682);
    float _686 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _688 = _662;
    float _690 = _648;
    if (!_97)
    {
        _129 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _692 = _129;
    float _694 = sqrt(_684);
    float _696 = _692;
    if (!_97)
    {
        float _698 = fma(_666, _692, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _279 = _698;
    }
    float _700 = _279;
    float _702 = _700;
    if (!_97)
    {
        float _704 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _700);
        _360 = _704;
    }
    float _706 = _360;
    float _708 = -_310;
    float _710 = fma(_694, _302, _708);
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = -_662;
    float _716 = fma(_714, _712, _664);
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_97)
    {
        float _722 = fma(_720, _692, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _696 = _722;
    }
    float _724 = _696;
    float _726 = _724;
    if (!_97)
    {
        float _728 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _702 = _728;
    }
    float _730 = _702;
    if (!_97)
    {
        float2 _2033 = float2(_730, _706);
        float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2033, float2(0.0), isnan(_2033)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2033, float2(0.0), isnan(_2033)), level(0.0)).x;
        _726 = _732;
    }
    float _734 = _726;
    if (_97)
    {
        _686 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _736 = _686;
    float _738 = _736;
    if (_97)
    {
        _688 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _740 = _688;
    if (_97)
    {
        float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _736, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _690 = _742;
    }
    float _744 = _690;
    float _746 = _744;
    if (_97)
    {
        float _748 = fma(_718, _736, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _738 = _748;
    }
    float _750 = _738;
    float _752 = _750;
    if (_97)
    {
        float _754 = fma(_744, _740, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _746 = _754;
    }
    float _756 = _746;
    float _758 = _756;
    if (_97)
    {
        float _760 = fma(_750, _740, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_97)
    {
        float _766 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _756);
        _758 = _766;
    }
    float _768 = _758;
    if (_97)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _770;
    }
    float _772 = _764;
    float _774 = _734;
    if (_97)
    {
        float2 _2126 = float2(_772, _768);
        float _776 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2126, float2(0.0), isnan(_2126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2126, float2(0.0), isnan(_2126)), level(0.0)).x;
        _774 = _776;
    }
    float _778 = _774;
    float _780 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _782 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _786 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_38.y = _780;
    out.m_40.z = _784;
    out.m_40.w = _782;
    out.m_38.x = _786;
    out.m_38.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _790 = _788 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _792 = _788 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _794 = _788 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_42.x = _718;
    out.m_42.y = _788;
    out.m_42.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _796 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[1].x, _790);
    float _798 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[0].x, _792);
    float _800 = fma(_718, (*spvDescriptorSet0.vp_c4)._m0[2].x, _794);
    float _802 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _796);
    float _804 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _798);
    float _806 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _800);
    float _808 = _802 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _810 = _804 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _814 = _808 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _816 = _808 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _818 = _808 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _820 = _808 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[8].x, _814);
    float _824 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[7].x, _816);
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[9].x, _818);
    float _828 = fma(_810, (*spvDescriptorSet0.vp_c4)._m0[10].x, _820);
    float _830 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[8].z, _822);
    float _832 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[7].z, _824);
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[9].z, _826);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c4)._m0[10].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _840 = _832 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _842 = _834 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_44.w = _812;
    out.gl_Position.x = _840;
    out.gl_Position.y = _838;
    out.gl_Position.z = _842;
    out.gl_Position.w = _844;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

