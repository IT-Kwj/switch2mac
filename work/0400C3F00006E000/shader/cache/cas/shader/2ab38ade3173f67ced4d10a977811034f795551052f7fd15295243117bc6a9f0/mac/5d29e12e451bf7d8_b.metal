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
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c4 [[id(5)]];
    texture2d<float> vp_t_tcb_8 [[id(6)]];
    sampler vp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> vp_t_tcb_A [[id(10)]];
    sampler vp_t_tcb_ASmplr [[id(11)]];
    sampler vp_t_tcb_8Smplr_w [[id(12)]];
    sampler vp_t_tcb_CSmplr_w [[id(13)]];
    sampler vp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_44.x;
    float _60 = in.m_44.y;
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
    float _109 = _60;
    if (_73)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _111 = _107;
    float _113 = _101 * _101;
    bool _115 = _69 == 96;
    float _117 = 0.0;
    float _119 = _111;
    if (_73)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _121 = _117;
    float _123 = fma(_105, _105, _113);
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _125;
    float _129 = _121;
    if (_75)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _119;
    bool _133 = _69 == 112;
    float _135 = fma(_127, _127, _123);
    float _137 = _131;
    if (_75)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
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
    if (_115)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _181;
    float _193 = _191;
    if (_115)
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
    float _334 = _332;
    if (!_97)
    {
        _279 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _336 = _279;
    bool _338 = _69 == 352;
    if (_237)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _340 = _330;
    float _342 = _340;
    if (_247)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _344 = _334;
    float _346 = _344;
    if (!_97)
    {
        float _348 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _336, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _109 = _348;
    }
    float _350 = _109;
    bool _352 = _69 == 368;
    float _354 = _350;
    if (_247)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _356 = _342;
    float _358 = _356;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _360 = _346;
    bool _362 = _69 == 384;
    float _364 = 1.0 / _328;
    float _366 = _360;
    if (_257)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _368 = _358;
    float _370 = _368;
    if (_265)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _372 = _366;
    bool _374 = _69 == 400;
    float _376 = _372;
    if (_265)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _378 = _370;
    bool _380 = _69 == 416;
    float _382 = _378;
    if (_291)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _384 = _376;
    float _386 = _384;
    if (_291)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _388 = _382;
    float _390 = _388;
    if (_322)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _392 = _386;
    bool _394 = _69 == 432;
    float _396 = _392;
    if (_322)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _402 = _396;
    bool _404 = _69 == 448;
    float _406 = _402;
    if (_338)
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
    bool _414 = _69 == 464;
    float _416 = _412;
    if (_352)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_362)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _422 = _416;
    bool _424 = _69 == 480;
    float _426 = _422;
    if (_362)
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
    bool _434 = _69 == 496;
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
    bool _444 = _69 == 512;
    float _446 = _442;
    if (_380)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _448 = _440;
    bool _450 = _69 == 528;
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
    bool _464 = _69 == 544;
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
    bool _474 = _69 == 560;
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
    bool _484 = _69 == 576;
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
    bool _494 = _69 == 592;
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
    bool _504 = _69 == 608;
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
    bool _514 = _69 == 624;
    float _516 = _512;
    if (_450)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _518 = _510;
    bool _520 = _69 == 640;
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
    bool _534 = _69 == 656;
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
    bool _544 = _69 == 672;
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
    bool _554 = _69 == 688;
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
    bool _564 = _69 == 704;
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
    bool _574 = _69 == 720;
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
    bool _584 = _69 == 736;
    float _586 = _582;
    if (_520)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _588 = _580;
    bool _590 = _69 == 752;
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
    float _620 = _364 * _618;
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
    float _628 = _620 * _58;
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
    float _656 = _328 * _650;
    float _658 = _654 * 2.0;
    float _660 = -_654;
    float _662 = fma(_656, _660, _58);
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _666 = floor(_658);
    int _668 = _664 + 76;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    uint _672 = uint(int(uint(int(_670)) >> uint(2)));
    int _674 = int(_670) & 3;
    float _676 = (*spvDescriptorSet0.vp_c6)._m0[int(_672)][_674];
    uint _678 = uint(int(uint(_664) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c6)._m0[int(_680)][_682];
    float _686 = _656 * _666;
    float _688 = _686 * 0.5;
    float _690 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _690;
    float _694 = as_type<float>(_664);
    if (!_97)
    {
        _694 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _696 = _694;
    float _698 = _688 + _662;
    if (!_97)
    {
        float _700 = fma(_350, _696, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _354 = _700;
    }
    float _702 = _354;
    float _704 = fma(_64, _698, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _708 = _702;
    if (!_97)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _702);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _716 = _704 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _720 = _706 + _718;
    float _722 = _716 * _716;
    float _724 = fma(_720, _720, _722);
    float _726 = fma(_127, _127, _724);
    float _728 = sqrt(_726);
    float _730 = -_310;
    float _732 = fma(_728, _302, _730);
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = -_688;
    float _738 = fma(_736, _734, _698);
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _742 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _744 = _740 + _742;
    float _746 = abs(_744);
    float _748 = abs(_692);
    float _750 = precise::max(_746, _748);
    float _752 = _676 + 8.0;
    float _754 = _752 + _750;
    float _756 = _754 * _684;
    float _758 = _756 * 4.0;
    float _760 = precise::max(_758, 1.0);
    float _762 = log2(_760);
    float _764 = _760;
    float _766 = _712;
    float _768 = _676;
    float _770 = _684;
    if (!_97)
    {
        float _772 = fma(_740, _336, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _764 = _772;
    }
    float _774 = _764;
    float _776 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _778 = _740 + _776;
    float _780 = _774;
    if (!_97)
    {
        float _782 = fma(_774, _696, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _780 = _782;
    }
    float _784 = _780;
    float _786 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _786;
    float _790 = trunc(_762);
    int _792 = int(_790);
    float _794 = _784;
    if (!_97)
    {
        float _796 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _784);
        _794 = _796;
    }
    float _798 = _794;
    float _800 = floor(_762);
    int _802 = min(_792, 4);
    int _804 = _802 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _806 = _804 << 4;
    float _808 = _800 + 1.0;
    float _810 = rint(_800);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    uint _816 = clamp(_814, 0u, 65535u);
    uint _818 = uint(int(uint(_806) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c6)._m0[int(_820)][_822];
    float _826 = rint(_808);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    int _834 = _806 + 16;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c6)._m0[int(_838)][_840];
    float _844 = _798;
    if (!_97)
    {
        float2 _2570 = float2(_798, _712);
        float2 _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2570, float2(0.0), isnan(_2570)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2570, float2(0.0), isnan(_2570)), level(0.0)).xw;
        float _850 = _848.x;
        float _852 = _848.y;
        _844 = _850;
        _766 = _852;
    }
    float _854 = _844;
    float _856 = _766;
    float _858 = fma(_788, _824, 0.5);
    float _860 = fma(_778, _824, 0.5);
    float _862 = fma(_788, _842, 0.5);
    float _864 = fma(_778, _842, 0.5);
    float3 _2604 = float3(_860, _858, float(int(_816)));
    float3 _2608 = select(_2604, float3(0.0), isnan(_2604));
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2608.xy, uint(rint(_2608.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2608.xy, uint(rint(_2608.z)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float3 _2623 = float3(_864, _862, float(int(_832)));
    float3 _2625 = select(_2623, float3(0.0), isnan(_2623));
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2625.xy, uint(rint(_2625.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2625.xy, uint(rint(_2625.z)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    float _884 = _872;
    if (_97)
    {
        _768 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _886 = _768;
    float _888 = 0.0;
    float _890 = _886;
    if (_97)
    {
        _888 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _892 = _888;
    if (_97)
    {
        float _894 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _886, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _770 = _894;
    }
    float _896 = _770;
    float _898 = _896;
    if (_97)
    {
        float _900 = fma(_740, _886, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _890 = _900;
    }
    float _902 = _890;
    float _904 = _902;
    if (_97)
    {
        float _906 = fma(_896, _892, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _898 = _906;
    }
    float _908 = _898;
    float _910 = _908;
    if (_97)
    {
        float _912 = fma(_902, _892, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _904 = _912;
    }
    float _914 = _904;
    float _916 = _914;
    if (_97)
    {
        float _918 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _908);
        _910 = _918;
    }
    float _920 = _910;
    if (_97)
    {
        float _922 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _914);
        _916 = _922;
    }
    float _924 = _916;
    float _926 = _854;
    float _928 = _856;
    if (_97)
    {
        float2 _2719 = float2(_924, _920);
        float2 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2719, float2(0.0), isnan(_2719)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2719, float2(0.0), isnan(_2719)), level(0.0)).xw;
        float _932 = _930.x;
        float _934 = _930.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = (*spvDescriptorSet0.vp_c15)._m0[0].w * 0.00012500000593718141317367553710938;
    float _942 = _740 * 0.00012500000593718141317367553710938;
    float _944 = -_800;
    float _946 = _762 + _944;
    float _948 = abs(_942);
    float _950 = abs(_940);
    float _952 = precise::max(_948, _950);
    float _954 = fma(_946, 5.42372894287109375, -4.338983058929443359375);
    float _956 = precise::clamp(_954, 0.0, 1.0);
    float _958 = fma(_952, 20.0, -19.0);
    float _960 = precise::clamp(_958, 0.0, 1.0);
    float _962 = -_960;
    float _964 = _962 + 1.0;
    float _966 = -_874;
    float _968 = _966 + _882;
    float _970 = -_870;
    float _972 = _970 + _878;
    float _974 = -_872;
    float _976 = _974 + _880;
    float _978 = fma(_956, _968, _874);
    float _980 = fma(_956, _972, _870);
    float _982 = fma(_956, _976, _872);
    float _984 = fma(_964, _978, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _986 = fma(_964, _980, _740);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _990 = _984 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _994 = _986 + _992;
    float _996 = _990 * _990;
    float _998 = fma(_994, _994, _996);
    bool _1000 = _998 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1002 = isnan(_998);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1008 = _1004 || _1006;
    float _1010 = fma(_936, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1012 = _990 * _990;
    float _1014 = fma(_964, _982, _1010);
    float _1016 = fma(_994, _994, _1012);
    float _1018 = _960;
    float _1020 = _1012;
    float _1022 = _1010;
    float _1024 = _1014;
    float _1026 = _938;
    if (!_1008)
    {
        _884 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1028 = _884;
    if (!_1008)
    {
        float _1030 = -_998;
        float _1032 = _1030 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1018 = _1032;
    }
    float _1034 = _1018;
    float _1036 = _1034;
    if (!_1008)
    {
        float _1038 = _998 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1020 = _1038;
    }
    float _1040 = _1020;
    if (!_1008)
    {
        float _1042 = -_1034;
        float _1044 = fma(_1042, _1028, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1036 = _1044;
    }
    float _1046 = _1036;
    float _1048 = sqrt(_1016);
    float _1050 = _1046;
    if (!_1008)
    {
        float _1052 = precise::min(_1014, _1046);
        _1050 = _1052;
    }
    float _1054 = _1050;
    if (!_1008)
    {
        float _1056 = -_1054;
        float _1058 = _1014 + _1056;
        _1022 = _1058;
    }
    float _1060 = _1022;
    if (!_1008)
    {
        float _1062 = fma(_1040, _1060, _1054);
        _1024 = _1062;
    }
    float _1064 = _1024;
    bool _1066 = _1048 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1068 = _1064 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1070 = fma(_938, 255.99609375, 7.629510946571826934814453125e-06);
    float _1072 = fma(_986, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1068);
    float _1074 = floor(_1070);
    float _1076 = fma(_984, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1072);
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1080 = 255.99609375;
    float _1082 = _1076;
    float _1084 = _1078;
    if (!_1066)
    {
        _1080 = _986;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    if (!_1066)
    {
        _1082 = _984;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    if (!_1066)
    {
        _1026 = _1064;
    }
    float _1094 = _1026;
    bool _1096 = !_1066;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1104 = _1048 + _1102;
        float _1106 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1108 = _1104 * _1100;
        float _1110 = rsqrt(_1016);
        float _1112 = _1108 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1128 = fma(_1116, _1064, _1124);
        float _1130 = _1110 * _1126;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1134 = fma(_994, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1136 = fma(_990, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1138 = fma(_1134, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1132);
        float _1140 = fma(_1136, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1138);
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1098 = _1128;
        _1088 = _1134;
        _1092 = _1136;
        _1084 = _1142;
    }
    float _1144 = _1098;
    float _1146 = _1088;
    float _1148 = _1092;
    float _1150 = _1084;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1154 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1156 = -_1074;
    float _1158 = _1070 + _1156;
    float _1160 = fma(_1146, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1152);
    float _1162 = fma(_1146, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1154);
    bool _1164 = _1158 > 0.499000012874603271484375;
    float _1166 = fma(_1148, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1160);
    float _1168 = fma(_1148, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1162);
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1182 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1174);
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1176);
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1178);
    float _1188 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1180);
    float _1190 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1182);
    float _1192 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1184);
    float _1194 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1186);
    float _1196 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1188);
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1200 = _1194 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1206 = !_1164;
    int _1208 = _1206 ? as_type<int>(_1198) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    out.gl_Position.x = _1200;
    out.gl_Position.y = _1202;
    float _3214 = as_type<float>(_1208);
    out.gl_Position.z = _3214;
    out.gl_Position.w = _1204;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_44.x;
    float _60 = in.m_44.y;
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
    float _109 = _60;
    if (_73)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _111 = _107;
    float _113 = _101 * _101;
    bool _115 = _69 == 96;
    float _117 = 0.0;
    float _119 = _111;
    if (_73)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _121 = _117;
    float _123 = fma(_105, _105, _113);
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _125;
    float _129 = _121;
    if (_75)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _119;
    bool _133 = _69 == 112;
    float _135 = fma(_127, _127, _123);
    float _137 = _131;
    if (_75)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
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
    if (_115)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _181;
    float _193 = _191;
    if (_115)
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
    float _334 = _332;
    if (!_97)
    {
        _279 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _336 = _279;
    bool _338 = _69 == 352;
    if (_237)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _340 = _330;
    float _342 = _340;
    if (_247)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _344 = _334;
    float _346 = _344;
    if (!_97)
    {
        float _348 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _336, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _109 = _348;
    }
    float _350 = _109;
    bool _352 = _69 == 368;
    float _354 = _350;
    if (_247)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _356 = _342;
    float _358 = _356;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _360 = _346;
    bool _362 = _69 == 384;
    float _364 = 1.0 / _328;
    float _366 = _360;
    if (_257)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _368 = _358;
    float _370 = _368;
    if (_265)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _372 = _366;
    bool _374 = _69 == 400;
    float _376 = _372;
    if (_265)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _378 = _370;
    bool _380 = _69 == 416;
    float _382 = _378;
    if (_291)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _384 = _376;
    float _386 = _384;
    if (_291)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _388 = _382;
    float _390 = _388;
    if (_322)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _392 = _386;
    bool _394 = _69 == 432;
    float _396 = _392;
    if (_322)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _402 = _396;
    bool _404 = _69 == 448;
    float _406 = _402;
    if (_338)
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
    bool _414 = _69 == 464;
    float _416 = _412;
    if (_352)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_362)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _422 = _416;
    bool _424 = _69 == 480;
    float _426 = _422;
    if (_362)
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
    bool _434 = _69 == 496;
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
    bool _444 = _69 == 512;
    float _446 = _442;
    if (_380)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _448 = _440;
    bool _450 = _69 == 528;
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
    bool _464 = _69 == 544;
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
    bool _474 = _69 == 560;
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
    bool _484 = _69 == 576;
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
    bool _494 = _69 == 592;
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
    bool _504 = _69 == 608;
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
    bool _514 = _69 == 624;
    float _516 = _512;
    if (_450)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _518 = _510;
    bool _520 = _69 == 640;
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
    bool _534 = _69 == 656;
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
    bool _544 = _69 == 672;
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
    bool _554 = _69 == 688;
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
    bool _564 = _69 == 704;
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
    bool _574 = _69 == 720;
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
    bool _584 = _69 == 736;
    float _586 = _582;
    if (_520)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _588 = _580;
    bool _590 = _69 == 752;
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
    float _620 = _364 * _618;
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
    float _628 = _620 * _58;
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
    float _656 = _328 * _650;
    float _658 = _654 * 2.0;
    float _660 = -_654;
    float _662 = fma(_656, _660, _58);
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _666 = floor(_658);
    int _668 = _664 + 76;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    uint _672 = uint(int(uint(int(_670)) >> uint(2)));
    int _674 = int(_670) & 3;
    float _676 = (*spvDescriptorSet0.vp_c6)._m0[int(_672)][_674];
    uint _678 = uint(int(uint(_664) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c6)._m0[int(_680)][_682];
    float _686 = _656 * _666;
    float _688 = _686 * 0.5;
    float _690 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _690;
    float _694 = as_type<float>(_664);
    if (!_97)
    {
        _694 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _696 = _694;
    float _698 = _688 + _662;
    if (!_97)
    {
        float _700 = fma(_350, _696, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _354 = _700;
    }
    float _702 = _354;
    float _704 = fma(_64, _698, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _708 = _702;
    if (!_97)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _702);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _716 = _704 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _720 = _706 + _718;
    float _722 = _716 * _716;
    float _724 = fma(_720, _720, _722);
    float _726 = fma(_127, _127, _724);
    float _728 = sqrt(_726);
    float _730 = -_310;
    float _732 = fma(_728, _302, _730);
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = -_688;
    float _738 = fma(_736, _734, _698);
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _742 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _744 = _740 + _742;
    float _746 = abs(_744);
    float _748 = abs(_692);
    float _750 = precise::max(_746, _748);
    float _752 = _676 + 8.0;
    float _754 = _752 + _750;
    float _756 = _754 * _684;
    float _758 = _756 * 4.0;
    float _760 = precise::max(_758, 1.0);
    float _762 = log2(_760);
    float _764 = _760;
    float _766 = _712;
    float _768 = _676;
    float _770 = _684;
    if (!_97)
    {
        float _772 = fma(_740, _336, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _764 = _772;
    }
    float _774 = _764;
    float _776 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _778 = _740 + _776;
    float _780 = _774;
    if (!_97)
    {
        float _782 = fma(_774, _696, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _780 = _782;
    }
    float _784 = _780;
    float _786 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _786;
    float _790 = trunc(_762);
    int _792 = int(_790);
    float _794 = _784;
    if (!_97)
    {
        float _796 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _784);
        _794 = _796;
    }
    float _798 = _794;
    float _800 = floor(_762);
    int _802 = min(_792, 4);
    int _804 = _802 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _806 = _804 << 4;
    float _808 = _800 + 1.0;
    float _810 = rint(_800);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    uint _816 = clamp(_814, 0u, 65535u);
    uint _818 = uint(int(uint(_806) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c6)._m0[int(_820)][_822];
    float _826 = rint(_808);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    int _834 = _806 + 16;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c6)._m0[int(_838)][_840];
    float _844 = _798;
    if (!_97)
    {
        float2 _2570 = float2(_798, _712);
        float2 _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2570, float2(0.0), isnan(_2570)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2570, float2(0.0), isnan(_2570)), level(0.0)).xw;
        float _850 = _848.x;
        float _852 = _848.y;
        _844 = _850;
        _766 = _852;
    }
    float _854 = _844;
    float _856 = _766;
    float _858 = fma(_788, _824, 0.5);
    float _860 = fma(_778, _824, 0.5);
    float _862 = fma(_788, _842, 0.5);
    float _864 = fma(_778, _842, 0.5);
    float3 _2604 = float3(_860, _858, float(int(_816)));
    float3 _2608 = select(_2604, float3(0.0), isnan(_2604));
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2608.xy, uint(rint(_2608.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2608.xy, uint(rint(_2608.z)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float3 _2623 = float3(_864, _862, float(int(_832)));
    float3 _2625 = select(_2623, float3(0.0), isnan(_2623));
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2625.xy, uint(rint(_2625.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2625.xy, uint(rint(_2625.z)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    float _884 = _872;
    if (_97)
    {
        _768 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _886 = _768;
    float _888 = 0.0;
    float _890 = _886;
    if (_97)
    {
        _888 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _892 = _888;
    if (_97)
    {
        float _894 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _886, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _770 = _894;
    }
    float _896 = _770;
    float _898 = _896;
    if (_97)
    {
        float _900 = fma(_740, _886, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _890 = _900;
    }
    float _902 = _890;
    float _904 = _902;
    if (_97)
    {
        float _906 = fma(_896, _892, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _898 = _906;
    }
    float _908 = _898;
    float _910 = _908;
    if (_97)
    {
        float _912 = fma(_902, _892, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _904 = _912;
    }
    float _914 = _904;
    float _916 = _914;
    if (_97)
    {
        float _918 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _908);
        _910 = _918;
    }
    float _920 = _910;
    if (_97)
    {
        float _922 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _914);
        _916 = _922;
    }
    float _924 = _916;
    float _926 = _854;
    float _928 = _856;
    if (_97)
    {
        float2 _2719 = float2(_924, _920);
        float2 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2719, float2(0.0), isnan(_2719)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2719, float2(0.0), isnan(_2719)), level(0.0)).xw;
        float _932 = _930.x;
        float _934 = _930.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = (*spvDescriptorSet0.vp_c15)._m0[0].w * 0.00012500000593718141317367553710938;
    float _942 = _740 * 0.00012500000593718141317367553710938;
    float _944 = -_800;
    float _946 = _762 + _944;
    float _948 = abs(_942);
    float _950 = abs(_940);
    float _952 = precise::max(_948, _950);
    float _954 = fma(_946, 5.42372894287109375, -4.338983058929443359375);
    float _956 = precise::clamp(_954, 0.0, 1.0);
    float _958 = fma(_952, 20.0, -19.0);
    float _960 = precise::clamp(_958, 0.0, 1.0);
    float _962 = -_960;
    float _964 = _962 + 1.0;
    float _966 = -_874;
    float _968 = _966 + _882;
    float _970 = -_870;
    float _972 = _970 + _878;
    float _974 = -_872;
    float _976 = _974 + _880;
    float _978 = fma(_956, _968, _874);
    float _980 = fma(_956, _972, _870);
    float _982 = fma(_956, _976, _872);
    float _984 = fma(_964, _978, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _986 = fma(_964, _980, _740);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _990 = _984 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _994 = _986 + _992;
    float _996 = _990 * _990;
    float _998 = fma(_994, _994, _996);
    bool _1000 = _998 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1002 = isnan(_998);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1008 = _1004 || _1006;
    float _1010 = fma(_936, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1012 = _990 * _990;
    float _1014 = fma(_964, _982, _1010);
    float _1016 = fma(_994, _994, _1012);
    float _1018 = _960;
    float _1020 = _1012;
    float _1022 = _1010;
    float _1024 = _1014;
    float _1026 = _938;
    if (!_1008)
    {
        _884 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1028 = _884;
    if (!_1008)
    {
        float _1030 = -_998;
        float _1032 = _1030 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1018 = _1032;
    }
    float _1034 = _1018;
    float _1036 = _1034;
    if (!_1008)
    {
        float _1038 = _998 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1020 = _1038;
    }
    float _1040 = _1020;
    if (!_1008)
    {
        float _1042 = -_1034;
        float _1044 = fma(_1042, _1028, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1036 = _1044;
    }
    float _1046 = _1036;
    float _1048 = sqrt(_1016);
    float _1050 = _1046;
    if (!_1008)
    {
        float _1052 = precise::min(_1014, _1046);
        _1050 = _1052;
    }
    float _1054 = _1050;
    if (!_1008)
    {
        float _1056 = -_1054;
        float _1058 = _1014 + _1056;
        _1022 = _1058;
    }
    float _1060 = _1022;
    if (!_1008)
    {
        float _1062 = fma(_1040, _1060, _1054);
        _1024 = _1062;
    }
    float _1064 = _1024;
    bool _1066 = _1048 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1068 = _1064 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1070 = fma(_938, 255.99609375, 7.629510946571826934814453125e-06);
    float _1072 = fma(_986, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1068);
    float _1074 = floor(_1070);
    float _1076 = fma(_984, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1072);
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1080 = 255.99609375;
    float _1082 = _1076;
    float _1084 = _1078;
    if (!_1066)
    {
        _1080 = _986;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    if (!_1066)
    {
        _1082 = _984;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    if (!_1066)
    {
        _1026 = _1064;
    }
    float _1094 = _1026;
    bool _1096 = !_1066;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1104 = _1048 + _1102;
        float _1106 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1108 = _1104 * _1100;
        float _1110 = rsqrt(_1016);
        float _1112 = _1108 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1128 = fma(_1116, _1064, _1124);
        float _1130 = _1110 * _1126;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1134 = fma(_994, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1136 = fma(_990, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1138 = fma(_1134, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1132);
        float _1140 = fma(_1136, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1138);
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1098 = _1128;
        _1088 = _1134;
        _1092 = _1136;
        _1084 = _1142;
    }
    float _1144 = _1098;
    float _1146 = _1088;
    float _1148 = _1092;
    float _1150 = _1084;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1154 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1156 = -_1074;
    float _1158 = _1070 + _1156;
    float _1160 = fma(_1146, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1152);
    float _1162 = fma(_1146, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1154);
    bool _1164 = _1158 > 0.499000012874603271484375;
    float _1166 = fma(_1148, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1160);
    float _1168 = fma(_1148, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1162);
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1182 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1174);
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1176);
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1178);
    float _1188 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1180);
    float _1190 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1182);
    float _1192 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1184);
    float _1194 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1186);
    float _1196 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1188);
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1200 = _1194 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1206 = !_1164;
    int _1208 = _1206 ? as_type<int>(_1198) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    out.gl_Position.x = _1200;
    out.gl_Position.y = _1202;
    float _3214 = as_type<float>(_1208);
    out.gl_Position.z = _3214;
    out.gl_Position.w = _1204;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_44.x;
    float _60 = in.m_44.y;
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
    float _109 = _60;
    if (_73)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _111 = _107;
    float _113 = _101 * _101;
    bool _115 = _69 == 96;
    float _117 = 0.0;
    float _119 = _111;
    if (_73)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _121 = _117;
    float _123 = fma(_105, _105, _113);
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _125;
    float _129 = _121;
    if (_75)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _119;
    bool _133 = _69 == 112;
    float _135 = fma(_127, _127, _123);
    float _137 = _131;
    if (_75)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
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
    if (_115)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _181;
    float _193 = _191;
    if (_115)
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
    float _334 = _332;
    if (!_97)
    {
        _279 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _336 = _279;
    bool _338 = _69 == 352;
    if (_237)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _340 = _330;
    float _342 = _340;
    if (_247)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _344 = _334;
    float _346 = _344;
    if (!_97)
    {
        float _348 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _336, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _109 = _348;
    }
    float _350 = _109;
    bool _352 = _69 == 368;
    float _354 = _350;
    if (_247)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _356 = _342;
    float _358 = _356;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _360 = _346;
    bool _362 = _69 == 384;
    float _364 = 1.0 / _328;
    float _366 = _360;
    if (_257)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _368 = _358;
    float _370 = _368;
    if (_265)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _372 = _366;
    bool _374 = _69 == 400;
    float _376 = _372;
    if (_265)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _378 = _370;
    bool _380 = _69 == 416;
    float _382 = _378;
    if (_291)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _384 = _376;
    float _386 = _384;
    if (_291)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _388 = _382;
    float _390 = _388;
    if (_322)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _392 = _386;
    bool _394 = _69 == 432;
    float _396 = _392;
    if (_322)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _402 = _396;
    bool _404 = _69 == 448;
    float _406 = _402;
    if (_338)
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
    bool _414 = _69 == 464;
    float _416 = _412;
    if (_352)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_362)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _422 = _416;
    bool _424 = _69 == 480;
    float _426 = _422;
    if (_362)
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
    bool _434 = _69 == 496;
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
    bool _444 = _69 == 512;
    float _446 = _442;
    if (_380)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _448 = _440;
    bool _450 = _69 == 528;
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
    bool _464 = _69 == 544;
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
    bool _474 = _69 == 560;
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
    bool _484 = _69 == 576;
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
    bool _494 = _69 == 592;
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
    bool _504 = _69 == 608;
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
    bool _514 = _69 == 624;
    float _516 = _512;
    if (_450)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _518 = _510;
    bool _520 = _69 == 640;
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
    bool _534 = _69 == 656;
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
    bool _544 = _69 == 672;
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
    bool _554 = _69 == 688;
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
    bool _564 = _69 == 704;
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
    bool _574 = _69 == 720;
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
    bool _584 = _69 == 736;
    float _586 = _582;
    if (_520)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _588 = _580;
    bool _590 = _69 == 752;
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
    float _620 = _364 * _618;
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
    float _628 = _620 * _58;
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
    float _656 = _328 * _650;
    float _658 = _654 * 2.0;
    float _660 = -_654;
    float _662 = fma(_656, _660, _58);
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _666 = floor(_658);
    int _668 = _664 + 76;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    uint _672 = uint(int(uint(int(_670)) >> uint(2)));
    int _674 = int(_670) & 3;
    float _676 = (*spvDescriptorSet0.vp_c6)._m0[int(_672)][_674];
    uint _678 = uint(int(uint(_664) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c6)._m0[int(_680)][_682];
    float _686 = _656 * _666;
    float _688 = _686 * 0.5;
    float _690 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _690;
    float _694 = as_type<float>(_664);
    if (!_97)
    {
        _694 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _696 = _694;
    float _698 = _688 + _662;
    if (!_97)
    {
        float _700 = fma(_350, _696, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _354 = _700;
    }
    float _702 = _354;
    float _704 = fma(_64, _698, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _708 = _702;
    if (!_97)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _702);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _716 = _704 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _720 = _706 + _718;
    float _722 = _716 * _716;
    float _724 = fma(_720, _720, _722);
    float _726 = fma(_127, _127, _724);
    float _728 = sqrt(_726);
    float _730 = -_310;
    float _732 = fma(_728, _302, _730);
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = -_688;
    float _738 = fma(_736, _734, _698);
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _742 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _744 = _740 + _742;
    float _746 = abs(_744);
    float _748 = abs(_692);
    float _750 = precise::max(_746, _748);
    float _752 = _676 + 8.0;
    float _754 = _752 + _750;
    float _756 = _754 * _684;
    float _758 = _756 * 4.0;
    float _760 = precise::max(_758, 1.0);
    float _762 = log2(_760);
    float _764 = _760;
    float _766 = _712;
    float _768 = _676;
    float _770 = _684;
    if (!_97)
    {
        float _772 = fma(_740, _336, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _764 = _772;
    }
    float _774 = _764;
    float _776 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _778 = _740 + _776;
    float _780 = _774;
    if (!_97)
    {
        float _782 = fma(_774, _696, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _780 = _782;
    }
    float _784 = _780;
    float _786 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _786;
    float _790 = trunc(_762);
    int _792 = int(_790);
    float _794 = _784;
    if (!_97)
    {
        float _796 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _784);
        _794 = _796;
    }
    float _798 = _794;
    float _800 = floor(_762);
    int _802 = min(_792, 4);
    int _804 = _802 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _806 = _804 << 4;
    float _808 = _800 + 1.0;
    float _810 = rint(_800);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    uint _816 = clamp(_814, 0u, 65535u);
    uint _818 = uint(int(uint(_806) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c6)._m0[int(_820)][_822];
    float _826 = rint(_808);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    int _834 = _806 + 16;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c6)._m0[int(_838)][_840];
    float _844 = _798;
    if (!_97)
    {
        float2 _2570 = float2(_798, _712);
        float2 _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2570, float2(0.0), isnan(_2570)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2570, float2(0.0), isnan(_2570)), level(0.0)).xw;
        float _850 = _848.x;
        float _852 = _848.y;
        _844 = _850;
        _766 = _852;
    }
    float _854 = _844;
    float _856 = _766;
    float _858 = fma(_788, _824, 0.5);
    float _860 = fma(_778, _824, 0.5);
    float _862 = fma(_788, _842, 0.5);
    float _864 = fma(_778, _842, 0.5);
    float3 _2604 = float3(_860, _858, float(int(_816)));
    float3 _2608 = select(_2604, float3(0.0), isnan(_2604));
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2608.xy, uint(rint(_2608.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2608.xy, uint(rint(_2608.z)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float3 _2623 = float3(_864, _862, float(int(_832)));
    float3 _2625 = select(_2623, float3(0.0), isnan(_2623));
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2625.xy, uint(rint(_2625.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2625.xy, uint(rint(_2625.z)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    float _884 = _872;
    if (_97)
    {
        _768 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _886 = _768;
    float _888 = 0.0;
    float _890 = _886;
    if (_97)
    {
        _888 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _892 = _888;
    if (_97)
    {
        float _894 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _886, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _770 = _894;
    }
    float _896 = _770;
    float _898 = _896;
    if (_97)
    {
        float _900 = fma(_740, _886, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _890 = _900;
    }
    float _902 = _890;
    float _904 = _902;
    if (_97)
    {
        float _906 = fma(_896, _892, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _898 = _906;
    }
    float _908 = _898;
    float _910 = _908;
    if (_97)
    {
        float _912 = fma(_902, _892, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _904 = _912;
    }
    float _914 = _904;
    float _916 = _914;
    if (_97)
    {
        float _918 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _908);
        _910 = _918;
    }
    float _920 = _910;
    if (_97)
    {
        float _922 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _914);
        _916 = _922;
    }
    float _924 = _916;
    float _926 = _854;
    float _928 = _856;
    if (_97)
    {
        float2 _2719 = float2(_924, _920);
        float2 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2719, float2(0.0), isnan(_2719)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2719, float2(0.0), isnan(_2719)), level(0.0)).xw;
        float _932 = _930.x;
        float _934 = _930.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = (*spvDescriptorSet0.vp_c15)._m0[0].w * 0.00012500000593718141317367553710938;
    float _942 = _740 * 0.00012500000593718141317367553710938;
    float _944 = -_800;
    float _946 = _762 + _944;
    float _948 = abs(_942);
    float _950 = abs(_940);
    float _952 = precise::max(_948, _950);
    float _954 = fma(_946, 5.42372894287109375, -4.338983058929443359375);
    float _956 = precise::clamp(_954, 0.0, 1.0);
    float _958 = fma(_952, 20.0, -19.0);
    float _960 = precise::clamp(_958, 0.0, 1.0);
    float _962 = -_960;
    float _964 = _962 + 1.0;
    float _966 = -_874;
    float _968 = _966 + _882;
    float _970 = -_870;
    float _972 = _970 + _878;
    float _974 = -_872;
    float _976 = _974 + _880;
    float _978 = fma(_956, _968, _874);
    float _980 = fma(_956, _972, _870);
    float _982 = fma(_956, _976, _872);
    float _984 = fma(_964, _978, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _986 = fma(_964, _980, _740);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _990 = _984 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _994 = _986 + _992;
    float _996 = _990 * _990;
    float _998 = fma(_994, _994, _996);
    bool _1000 = _998 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1002 = isnan(_998);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1008 = _1004 || _1006;
    float _1010 = fma(_936, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1012 = _990 * _990;
    float _1014 = fma(_964, _982, _1010);
    float _1016 = fma(_994, _994, _1012);
    float _1018 = _960;
    float _1020 = _1012;
    float _1022 = _1010;
    float _1024 = _1014;
    float _1026 = _938;
    if (!_1008)
    {
        _884 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1028 = _884;
    if (!_1008)
    {
        float _1030 = -_998;
        float _1032 = _1030 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1018 = _1032;
    }
    float _1034 = _1018;
    float _1036 = _1034;
    if (!_1008)
    {
        float _1038 = _998 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1020 = _1038;
    }
    float _1040 = _1020;
    if (!_1008)
    {
        float _1042 = -_1034;
        float _1044 = fma(_1042, _1028, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1036 = _1044;
    }
    float _1046 = _1036;
    float _1048 = sqrt(_1016);
    float _1050 = _1046;
    if (!_1008)
    {
        float _1052 = precise::min(_1014, _1046);
        _1050 = _1052;
    }
    float _1054 = _1050;
    if (!_1008)
    {
        float _1056 = -_1054;
        float _1058 = _1014 + _1056;
        _1022 = _1058;
    }
    float _1060 = _1022;
    if (!_1008)
    {
        float _1062 = fma(_1040, _1060, _1054);
        _1024 = _1062;
    }
    float _1064 = _1024;
    bool _1066 = _1048 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1068 = _1064 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1070 = fma(_938, 255.99609375, 7.629510946571826934814453125e-06);
    float _1072 = fma(_986, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1068);
    float _1074 = floor(_1070);
    float _1076 = fma(_984, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1072);
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1080 = 255.99609375;
    float _1082 = _1076;
    float _1084 = _1078;
    if (!_1066)
    {
        _1080 = _986;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    if (!_1066)
    {
        _1082 = _984;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    if (!_1066)
    {
        _1026 = _1064;
    }
    float _1094 = _1026;
    bool _1096 = !_1066;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1104 = _1048 + _1102;
        float _1106 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1108 = _1104 * _1100;
        float _1110 = rsqrt(_1016);
        float _1112 = _1108 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1128 = fma(_1116, _1064, _1124);
        float _1130 = _1110 * _1126;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1134 = fma(_994, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1136 = fma(_990, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1138 = fma(_1134, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1132);
        float _1140 = fma(_1136, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1138);
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1098 = _1128;
        _1088 = _1134;
        _1092 = _1136;
        _1084 = _1142;
    }
    float _1144 = _1098;
    float _1146 = _1088;
    float _1148 = _1092;
    float _1150 = _1084;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1154 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1156 = -_1074;
    float _1158 = _1070 + _1156;
    float _1160 = fma(_1146, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1152);
    float _1162 = fma(_1146, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1154);
    bool _1164 = _1158 > 0.499000012874603271484375;
    float _1166 = fma(_1148, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1160);
    float _1168 = fma(_1148, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1162);
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1182 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1174);
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1176);
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1178);
    float _1188 = fma(_1172, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1180);
    float _1190 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1182);
    float _1192 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1184);
    float _1194 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1186);
    float _1196 = fma(_1150, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1188);
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1200 = _1194 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1206 = !_1164;
    int _1208 = _1206 ? as_type<int>(_1198) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    out.gl_Position.x = _1200;
    out.gl_Position.y = _1202;
    float _3214 = as_type<float>(_1208);
    out.gl_Position.z = _3214;
    out.gl_Position.w = _1204;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

