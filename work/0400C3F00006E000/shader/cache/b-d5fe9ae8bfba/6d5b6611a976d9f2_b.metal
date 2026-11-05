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
    float _103 = _58;
    if (_77)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _105 = _101;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _109 = _87 + _107;
    float _111 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _113 = _73 == 96;
    float _115 = _109 * _109;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _119 = _111 + _117;
    float _121 = 0.0;
    float _123 = _105;
    if (_77)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _121;
    float _127 = fma(_71, _71, _115);
    float _129 = _125;
    if (_79)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _123;
    bool _133 = _73 == 112;
    float _135 = fma(_119, _119, _127);
    float _137 = _131;
    if (_79)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
    float _141 = _139;
    if (_81)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = rsqrt(_135);
    bool _147 = _73 == 128;
    float _149 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_83)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _73 == 144;
    float _159 = _155;
    if (_83)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_85)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _73 == 160;
    float _169 = _165;
    if (_85)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _145 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _175 = _171;
    if (_89)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _169;
    bool _179 = _73 == 176;
    float _181 = _177;
    if (_89)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _175;
    float _185 = log2(_173);
    bool _187 = _73 == 192;
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
    bool _201 = _73 == 208;
    float _203 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_147)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _73 == 224;
    float _213 = _185 + 1.2999999523162841796875;
    float _215 = _209;
    if (_147)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _217 = _207;
    float _219 = _217;
    if (_157)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _215;
    bool _223 = _73 == 240;
    float _225 = trunc(_213);
    int _227 = int(_225);
    float _229 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _219;
    float _233 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _229;
    bool _237 = _73 == 256;
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
    bool _247 = _73 == 272;
    float _249 = _245;
    if (_179)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    int _257 = min(_227, 15);
    bool _259 = _73 == 288;
    float _261 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    float _265 = float(_257);
    bool _267 = _73 == 304;
    int _269 = _257 << 4;
    int _271 = _269 + 4288;
    float _273 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _275 = _261;
    float _277 = _275;
    if (_201)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _279 = _273;
    float _281 = -_265;
    float _283 = _281 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _285 = _279;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _277;
    int _289 = _271 + 8;
    uint _292 = uint(int(uint(_289) >> uint(2)));
    uint _294 = uint(int(uint(int(_292)) >> uint(2)));
    int _296 = int(_292) & 3;
    float _298 = (*spvDescriptorSet0.vp_c14)._m0[int(_294)][_296];
    int _300 = int(_292) + 1;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    int _304 = _300 & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    bool _308 = _73 == 320;
    float _310 = _283 + 1.0;
    float _312 = _287;
    if (_211)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _314 = _285;
    float _316 = _314;
    if (_223)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _318 = _312;
    bool _320 = _73 == 336;
    float _322 = exp2(_310);
    float _324 = _318;
    if (_223)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _326 = _316;
    float _328 = _326;
    if (_237)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _330 = _324;
    bool _332 = _73 == 352;
    float _334 = _330;
    if (_237)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_247)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _340 = _334;
    bool _342 = _73 == 368;
    float _344 = _340;
    if (_247)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _346 = _338;
    float _348 = _346;
    if (_259)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _350 = _344;
    float _352 = 1.0 / _322;
    bool _354 = _73 == 384;
    float _356 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _358 = _348;
    float _360 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _362 = _356;
    bool _364 = _73 == 400;
    float _366 = _362;
    if (_267)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _368 = _360;
    bool _370 = _73 == 416;
    float _372 = _368;
    if (_308)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _374 = _366;
    float _376 = _374;
    if (_308)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _378 = _372;
    float _380 = _378;
    if (_320)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _382 = _376;
    bool _384 = _73 == 432;
    float _386 = _382;
    if (_320)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _392 = _386;
    bool _394 = _73 == 448;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _402 = _396;
    bool _404 = _73 == 464;
    float _406 = _402;
    if (_342)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_354)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _412 = _406;
    bool _414 = _73 == 480;
    float _416 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _422 = _416;
    bool _424 = _73 == 496;
    float _426 = _422;
    if (_364)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _428 = _420;
    float _430 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _432 = _426;
    bool _434 = _73 == 512;
    float _436 = _432;
    if (_370)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _438 = _430;
    bool _440 = _73 == 528;
    float _442 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _444 = _436;
    float _446 = _444;
    if (_384)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _448 = _442;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _452 = _446;
    bool _454 = _73 == 544;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _462 = _456;
    bool _464 = _73 == 560;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _472 = _466;
    bool _474 = _73 == 576;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _482 = _476;
    bool _484 = _73 == 592;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _492 = _486;
    bool _494 = _73 == 608;
    float _496 = _492;
    if (_434)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _498 = _490;
    float _500 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _502 = _496;
    bool _504 = _73 == 624;
    float _506 = _502;
    if (_440)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _508 = _500;
    bool _510 = _73 == 640;
    float _512 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _514 = _506;
    float _516 = _514;
    if (_454)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _518 = _512;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _522 = _516;
    bool _524 = _73 == 656;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _532 = _526;
    bool _534 = _73 == 672;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _542 = _536;
    bool _544 = _73 == 688;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _552 = _546;
    bool _554 = _73 == 704;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _562 = _556;
    bool _564 = _73 == 720;
    float _566 = _562;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _568 = _560;
    float _570 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _572 = _566;
    bool _574 = _73 == 736;
    float _576 = _572;
    if (_510)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _578 = _570;
    bool _580 = _73 == 752;
    float _582 = _578;
    if (_524)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _584 = _576;
    float _586 = _584;
    if (_534)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _588 = _586;
    float _590 = _588;
    if (_544)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_554)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_564)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_574)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_580)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _608 = _606;
    float _610 = _352 * _608;
    if (_524)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _612 = _582;
    float _614 = _612;
    if (_534)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _616 = _614;
    float _618 = _610 * _60;
    float _620 = _616;
    if (_544)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_554)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _626 = _624;
    float _628 = floor(_618);
    float _630 = _626;
    if (_564)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _632 = _630;
    float _634 = _632;
    if (_574)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_580)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _640 = _638;
    float _642 = -_628;
    float _644 = _618 + _642;
    float _646 = _322 * _640;
    float _648 = _644 * 2.0;
    float _650 = -_644;
    float _652 = fma(_646, _650, _60);
    float _654 = floor(_648);
    float _656 = _646 * _654;
    float _658 = _656 * 0.5;
    float _660 = _658 + _652;
    float _662 = fma(_64, _660, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _664 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _666 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _668 = _662 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _672 = _664 + _670;
    float _674 = _668 * _668;
    float _676 = fma(_71, _71, _674);
    float _678 = fma(_672, _672, _676);
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    int _682 = _680 + 76;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.vp_c6)._m0[int(_686)][_688];
    float _692 = sqrt(_678);
    uint _694 = uint(int(uint(_680) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.vp_c6)._m0[int(_696)][_698];
    float _702 = -_306;
    float _704 = fma(_692, _298, _702);
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = -_658;
    float _710 = fma(_708, _706, _660);
    float _712 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _714 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _712;
    float _716 = _690 + 8.0;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _720 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _722 = _718 + _720;
    float _724 = abs(_714);
    float _726 = abs(_722);
    float _728 = precise::max(_724, _726);
    float _730 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _732 = _718 + _730;
    float _734 = _716 + _728;
    float _736 = _728;
    if (!_99)
    {
        _736 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _738 = _736;
    float _740 = _734 * _700;
    float _742 = _740 * 4.0;
    float _744 = precise::max(_742, 1.0);
    float _746 = log2(_744);
    float _748 = trunc(_746);
    int _750 = int(_748);
    float _752 = floor(_746);
    int _754 = min(_750, 4);
    int _756 = _754 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _758 = _756 << 4;
    float _760 = _752 + 1.0;
    float _762 = as_type<float>(_756);
    float _764 = _744;
    float _766 = _700;
    if (!_99)
    {
        _762 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _768 = _762;
    float _770 = rint(_752);
    float _772 = precise::max(_770, 0.0);
    uint _774 = uint(_772);
    uint _776 = clamp(_774, 0u, 65535u);
    uint _778 = uint(int(uint(_758) >> uint(2)));
    uint _780 = uint(int(uint(int(_778)) >> uint(2)));
    int _782 = int(_778) & 3;
    float _784 = (*spvDescriptorSet0.vp_c6)._m0[int(_780)][_782];
    float _786 = _768;
    if (!_99)
    {
        float _788 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _768, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _764 = _788;
    }
    float _790 = _764;
    float _792 = _790;
    if (!_99)
    {
        float _794 = fma(_718, _768, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _786 = _794;
    }
    float _796 = _786;
    float _798 = rint(_760);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    uint _804 = clamp(_802, 0u, 65535u);
    int _806 = _758 + 16;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    uint _810 = uint(int(uint(int(_808)) >> uint(2)));
    int _812 = int(_808) & 3;
    float _814 = (*spvDescriptorSet0.vp_c6)._m0[int(_810)][_812];
    float _816 = _796;
    if (!_99)
    {
        float _818 = fma(_790, _738, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _792 = _818;
    }
    float _820 = _792;
    float _822 = _820;
    if (!_99)
    {
        float _824 = fma(_796, _738, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _816 = _824;
    }
    float _826 = _816;
    float _828 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _830 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _828;
    float _832 = _826;
    if (!_99)
    {
        float _834 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _820);
        _822 = _834;
    }
    float _836 = _822;
    float _838 = _836;
    if (!_99)
    {
        float _840 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _826);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = _842;
    if (!_99)
    {
        float2 _2569 = float2(_836, _842);
        float2 _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2569, float2(0.0), isnan(_2569)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2569, float2(0.0), isnan(_2569)), level(0.0)).xw;
        float _850 = _848.x;
        float _852 = _848.y;
        _838 = _850;
        _844 = _852;
    }
    float _854 = _838;
    float _856 = _844;
    float _858 = fma(_732, _784, 0.5);
    float _860 = fma(_830, _784, 0.5);
    float _862 = fma(_732, _814, 0.5);
    float _864 = fma(_830, _814, 0.5);
    float3 _2603 = float3(_860, _858, float(int(_776)));
    float3 _2607 = select(_2603, float3(0.0), isnan(_2603));
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2607.xy, uint(rint(_2607.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2607.xy, uint(rint(_2607.z)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float3 _2622 = float3(_864, _862, float(int(_804)));
    float3 _2624 = select(_2622, float3(0.0), isnan(_2622));
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2624.xy, uint(rint(_2624.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2624.xy, uint(rint(_2624.z)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    if (_99)
    {
        _766 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _884 = _766;
    float _886 = 0.0;
    float _888 = _884;
    if (_99)
    {
        _886 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _890 = _886;
    if (_99)
    {
        float _892 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _884, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _103 = _892;
    }
    float _894 = _103;
    float _896 = _894;
    if (_99)
    {
        float _898 = fma(_718, _884, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _888 = _898;
    }
    float _900 = _888;
    float _902 = _900;
    if (_99)
    {
        float _904 = fma(_894, _890, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _896 = _904;
    }
    float _906 = _896;
    float _908 = _906;
    if (_99)
    {
        float _910 = fma(_900, _890, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _902 = _910;
    }
    float _912 = _902;
    float _914 = _912;
    if (_99)
    {
        float _916 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _906);
        _908 = _916;
    }
    float _918 = _908;
    float _920 = _918;
    if (_99)
    {
        float _922 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _912);
        _914 = _922;
    }
    float _924 = _914;
    float _926 = _854;
    float _928 = _856;
    if (_99)
    {
        float2 _2718 = float2(_918, _924);
        float2 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2718, float2(0.0), isnan(_2718)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2718, float2(0.0), isnan(_2718)), level(0.0)).xw;
        float _932 = _930.x;
        float _934 = _930.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _942 = _718 * 0.00012500000593718141317367553710938;
    float _944 = -_752;
    float _946 = _746 + _944;
    float _948 = abs(_940);
    float _950 = abs(_942);
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
    float _984 = fma(_964, _978, _718);
    float _986 = fma(_964, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _990 = _984 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _994 = _986 + _992;
    float _996 = _990 * _990;
    float _998 = _990 * _990;
    float _1000 = fma(_994, _994, _996);
    float _1002 = fma(_994, _994, _998);
    bool _1004 = _1000 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1006 = isnan(_1000);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1012 = _1008 || _1010;
    float _1014 = fma(_936, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1016 = fma(_964, _982, _1014);
    float _1018 = sqrt(_1002);
    float _1020 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _1022 = _998;
    float _1024 = _964;
    float _1026 = _1016;
    if (!_1012)
    {
        _920 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1028 = _920;
    if (!_1012)
    {
        float _1030 = -_1000;
        float _1032 = _1030 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1020 = _1032;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (!_1012)
    {
        float _1038 = _1000 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1022 = _1038;
    }
    float _1040 = _1022;
    if (!_1012)
    {
        float _1042 = -_1034;
        float _1044 = fma(_1042, _1028, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1036 = _1044;
    }
    float _1046 = _1036;
    float _1048 = _1046;
    if (!_1012)
    {
        float _1050 = precise::min(_1016, _1046);
        _1024 = _1050;
    }
    float _1052 = _1024;
    if (_1012)
    {
        _1048 = _1016;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (!_1012)
    {
        float _1058 = -_1052;
        float _1060 = _1016 + _1058;
        _1026 = _1060;
    }
    float _1062 = _1026;
    if (!_1012)
    {
        float _1064 = fma(_1040, _1062, _1052);
        _1056 = _1064;
    }
    float _1066 = _1056;
    bool _1068 = _1018 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1070 = _1066 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1072 = fma(_938, 255.99609375, 7.629510946571826934814453125e-06);
    float _1074 = fma(_986, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1070);
    float _1076 = floor(_1072);
    float _1078 = fma(_984, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1074);
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1082 = 255.99609375;
    float _1084 = _1078;
    float _1086 = _1066;
    float _1088 = _1080;
    if (!_1068)
    {
        _1082 = _986;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    if (!_1068)
    {
        _1084 = _984;
    }
    float _1094 = _1084;
    bool _1096 = !_1068;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1104 = _1018 + _1102;
        float _1106 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1108 = _1104 * _1100;
        float _1110 = rsqrt(_1002);
        float _1112 = _1108 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1128 = fma(_1116, _1066, _1124);
        float _1130 = _1110 * _1126;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1134 = fma(_994, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1136 = fma(_990, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1138 = fma(_1134, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1132);
        float _1140 = fma(_1136, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1138);
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1086 = _1128;
        _1092 = _1134;
        _1098 = _1136;
        _1088 = _1142;
    }
    float _1144 = _1086;
    float _1146 = _1092;
    float _1148 = _1098;
    float _1150 = _1088;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1154 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1156 = -_1076;
    float _1158 = _1072 + _1156;
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
    float _3213 = as_type<float>(_1208);
    out.gl_Position.z = _3213;
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
    float _103 = _58;
    if (_77)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _105 = _101;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _109 = _87 + _107;
    float _111 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _113 = _73 == 96;
    float _115 = _109 * _109;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _119 = _111 + _117;
    float _121 = 0.0;
    float _123 = _105;
    if (_77)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _121;
    float _127 = fma(_71, _71, _115);
    float _129 = _125;
    if (_79)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _123;
    bool _133 = _73 == 112;
    float _135 = fma(_119, _119, _127);
    float _137 = _131;
    if (_79)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
    float _141 = _139;
    if (_81)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = rsqrt(_135);
    bool _147 = _73 == 128;
    float _149 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_83)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _73 == 144;
    float _159 = _155;
    if (_83)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_85)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _73 == 160;
    float _169 = _165;
    if (_85)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _145 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _175 = _171;
    if (_89)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _169;
    bool _179 = _73 == 176;
    float _181 = _177;
    if (_89)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _175;
    float _185 = log2(_173);
    bool _187 = _73 == 192;
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
    bool _201 = _73 == 208;
    float _203 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_147)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _73 == 224;
    float _213 = _185 + 1.2999999523162841796875;
    float _215 = _209;
    if (_147)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _217 = _207;
    float _219 = _217;
    if (_157)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _215;
    bool _223 = _73 == 240;
    float _225 = trunc(_213);
    int _227 = int(_225);
    float _229 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _219;
    float _233 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _229;
    bool _237 = _73 == 256;
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
    bool _247 = _73 == 272;
    float _249 = _245;
    if (_179)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    int _257 = min(_227, 15);
    bool _259 = _73 == 288;
    float _261 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    float _265 = float(_257);
    bool _267 = _73 == 304;
    int _269 = _257 << 4;
    int _271 = _269 + 4288;
    float _273 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _275 = _261;
    float _277 = _275;
    if (_201)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _279 = _273;
    float _281 = -_265;
    float _283 = _281 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _285 = _279;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _277;
    int _289 = _271 + 8;
    uint _292 = uint(int(uint(_289) >> uint(2)));
    uint _294 = uint(int(uint(int(_292)) >> uint(2)));
    int _296 = int(_292) & 3;
    float _298 = (*spvDescriptorSet0.vp_c14)._m0[int(_294)][_296];
    int _300 = int(_292) + 1;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    int _304 = _300 & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    bool _308 = _73 == 320;
    float _310 = _283 + 1.0;
    float _312 = _287;
    if (_211)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _314 = _285;
    float _316 = _314;
    if (_223)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _318 = _312;
    bool _320 = _73 == 336;
    float _322 = exp2(_310);
    float _324 = _318;
    if (_223)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _326 = _316;
    float _328 = _326;
    if (_237)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _330 = _324;
    bool _332 = _73 == 352;
    float _334 = _330;
    if (_237)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_247)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _340 = _334;
    bool _342 = _73 == 368;
    float _344 = _340;
    if (_247)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _346 = _338;
    float _348 = _346;
    if (_259)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _350 = _344;
    float _352 = 1.0 / _322;
    bool _354 = _73 == 384;
    float _356 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _358 = _348;
    float _360 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _362 = _356;
    bool _364 = _73 == 400;
    float _366 = _362;
    if (_267)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _368 = _360;
    bool _370 = _73 == 416;
    float _372 = _368;
    if (_308)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _374 = _366;
    float _376 = _374;
    if (_308)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _378 = _372;
    float _380 = _378;
    if (_320)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _382 = _376;
    bool _384 = _73 == 432;
    float _386 = _382;
    if (_320)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _392 = _386;
    bool _394 = _73 == 448;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _402 = _396;
    bool _404 = _73 == 464;
    float _406 = _402;
    if (_342)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_354)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _412 = _406;
    bool _414 = _73 == 480;
    float _416 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _422 = _416;
    bool _424 = _73 == 496;
    float _426 = _422;
    if (_364)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _428 = _420;
    float _430 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _432 = _426;
    bool _434 = _73 == 512;
    float _436 = _432;
    if (_370)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _438 = _430;
    bool _440 = _73 == 528;
    float _442 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _444 = _436;
    float _446 = _444;
    if (_384)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _448 = _442;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _452 = _446;
    bool _454 = _73 == 544;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _462 = _456;
    bool _464 = _73 == 560;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _472 = _466;
    bool _474 = _73 == 576;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _482 = _476;
    bool _484 = _73 == 592;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _492 = _486;
    bool _494 = _73 == 608;
    float _496 = _492;
    if (_434)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _498 = _490;
    float _500 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _502 = _496;
    bool _504 = _73 == 624;
    float _506 = _502;
    if (_440)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _508 = _500;
    bool _510 = _73 == 640;
    float _512 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _514 = _506;
    float _516 = _514;
    if (_454)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _518 = _512;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _522 = _516;
    bool _524 = _73 == 656;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _532 = _526;
    bool _534 = _73 == 672;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _542 = _536;
    bool _544 = _73 == 688;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _552 = _546;
    bool _554 = _73 == 704;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _562 = _556;
    bool _564 = _73 == 720;
    float _566 = _562;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _568 = _560;
    float _570 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _572 = _566;
    bool _574 = _73 == 736;
    float _576 = _572;
    if (_510)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _578 = _570;
    bool _580 = _73 == 752;
    float _582 = _578;
    if (_524)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _584 = _576;
    float _586 = _584;
    if (_534)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _588 = _586;
    float _590 = _588;
    if (_544)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_554)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_564)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_574)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_580)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _608 = _606;
    float _610 = _352 * _608;
    if (_524)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _612 = _582;
    float _614 = _612;
    if (_534)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _616 = _614;
    float _618 = _610 * _60;
    float _620 = _616;
    if (_544)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_554)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _626 = _624;
    float _628 = floor(_618);
    float _630 = _626;
    if (_564)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _632 = _630;
    float _634 = _632;
    if (_574)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_580)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _640 = _638;
    float _642 = -_628;
    float _644 = _618 + _642;
    float _646 = _322 * _640;
    float _648 = _644 * 2.0;
    float _650 = -_644;
    float _652 = fma(_646, _650, _60);
    float _654 = floor(_648);
    float _656 = _646 * _654;
    float _658 = _656 * 0.5;
    float _660 = _658 + _652;
    float _662 = fma(_64, _660, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _664 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _666 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _668 = _662 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _672 = _664 + _670;
    float _674 = _668 * _668;
    float _676 = fma(_71, _71, _674);
    float _678 = fma(_672, _672, _676);
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    int _682 = _680 + 76;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.vp_c6)._m0[int(_686)][_688];
    float _692 = sqrt(_678);
    uint _694 = uint(int(uint(_680) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.vp_c6)._m0[int(_696)][_698];
    float _702 = -_306;
    float _704 = fma(_692, _298, _702);
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = -_658;
    float _710 = fma(_708, _706, _660);
    float _712 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _714 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _712;
    float _716 = _690 + 8.0;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _720 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _722 = _718 + _720;
    float _724 = abs(_714);
    float _726 = abs(_722);
    float _728 = precise::max(_724, _726);
    float _730 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _732 = _718 + _730;
    float _734 = _716 + _728;
    float _736 = _728;
    if (!_99)
    {
        _736 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _738 = _736;
    float _740 = _734 * _700;
    float _742 = _740 * 4.0;
    float _744 = precise::max(_742, 1.0);
    float _746 = log2(_744);
    float _748 = trunc(_746);
    int _750 = int(_748);
    float _752 = floor(_746);
    int _754 = min(_750, 4);
    int _756 = _754 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _758 = _756 << 4;
    float _760 = _752 + 1.0;
    float _762 = as_type<float>(_756);
    float _764 = _744;
    float _766 = _700;
    if (!_99)
    {
        _762 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _768 = _762;
    float _770 = rint(_752);
    float _772 = precise::max(_770, 0.0);
    uint _774 = uint(_772);
    uint _776 = clamp(_774, 0u, 65535u);
    uint _778 = uint(int(uint(_758) >> uint(2)));
    uint _780 = uint(int(uint(int(_778)) >> uint(2)));
    int _782 = int(_778) & 3;
    float _784 = (*spvDescriptorSet0.vp_c6)._m0[int(_780)][_782];
    float _786 = _768;
    if (!_99)
    {
        float _788 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _768, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _764 = _788;
    }
    float _790 = _764;
    float _792 = _790;
    if (!_99)
    {
        float _794 = fma(_718, _768, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _786 = _794;
    }
    float _796 = _786;
    float _798 = rint(_760);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    uint _804 = clamp(_802, 0u, 65535u);
    int _806 = _758 + 16;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    uint _810 = uint(int(uint(int(_808)) >> uint(2)));
    int _812 = int(_808) & 3;
    float _814 = (*spvDescriptorSet0.vp_c6)._m0[int(_810)][_812];
    float _816 = _796;
    if (!_99)
    {
        float _818 = fma(_790, _738, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _792 = _818;
    }
    float _820 = _792;
    float _822 = _820;
    if (!_99)
    {
        float _824 = fma(_796, _738, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _816 = _824;
    }
    float _826 = _816;
    float _828 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _830 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _828;
    float _832 = _826;
    if (!_99)
    {
        float _834 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _820);
        _822 = _834;
    }
    float _836 = _822;
    float _838 = _836;
    if (!_99)
    {
        float _840 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _826);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = _842;
    if (!_99)
    {
        float2 _2569 = float2(_836, _842);
        float2 _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2569, float2(0.0), isnan(_2569)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2569, float2(0.0), isnan(_2569)), level(0.0)).xw;
        float _850 = _848.x;
        float _852 = _848.y;
        _838 = _850;
        _844 = _852;
    }
    float _854 = _838;
    float _856 = _844;
    float _858 = fma(_732, _784, 0.5);
    float _860 = fma(_830, _784, 0.5);
    float _862 = fma(_732, _814, 0.5);
    float _864 = fma(_830, _814, 0.5);
    float3 _2603 = float3(_860, _858, float(int(_776)));
    float3 _2607 = select(_2603, float3(0.0), isnan(_2603));
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2607.xy, uint(rint(_2607.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2607.xy, uint(rint(_2607.z)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float3 _2622 = float3(_864, _862, float(int(_804)));
    float3 _2624 = select(_2622, float3(0.0), isnan(_2622));
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2624.xy, uint(rint(_2624.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2624.xy, uint(rint(_2624.z)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    if (_99)
    {
        _766 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _884 = _766;
    float _886 = 0.0;
    float _888 = _884;
    if (_99)
    {
        _886 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _890 = _886;
    if (_99)
    {
        float _892 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _884, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _103 = _892;
    }
    float _894 = _103;
    float _896 = _894;
    if (_99)
    {
        float _898 = fma(_718, _884, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _888 = _898;
    }
    float _900 = _888;
    float _902 = _900;
    if (_99)
    {
        float _904 = fma(_894, _890, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _896 = _904;
    }
    float _906 = _896;
    float _908 = _906;
    if (_99)
    {
        float _910 = fma(_900, _890, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _902 = _910;
    }
    float _912 = _902;
    float _914 = _912;
    if (_99)
    {
        float _916 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _906);
        _908 = _916;
    }
    float _918 = _908;
    float _920 = _918;
    if (_99)
    {
        float _922 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _912);
        _914 = _922;
    }
    float _924 = _914;
    float _926 = _854;
    float _928 = _856;
    if (_99)
    {
        float2 _2718 = float2(_918, _924);
        float2 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2718, float2(0.0), isnan(_2718)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2718, float2(0.0), isnan(_2718)), level(0.0)).xw;
        float _932 = _930.x;
        float _934 = _930.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _942 = _718 * 0.00012500000593718141317367553710938;
    float _944 = -_752;
    float _946 = _746 + _944;
    float _948 = abs(_940);
    float _950 = abs(_942);
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
    float _984 = fma(_964, _978, _718);
    float _986 = fma(_964, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _990 = _984 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _994 = _986 + _992;
    float _996 = _990 * _990;
    float _998 = _990 * _990;
    float _1000 = fma(_994, _994, _996);
    float _1002 = fma(_994, _994, _998);
    bool _1004 = _1000 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1006 = isnan(_1000);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1012 = _1008 || _1010;
    float _1014 = fma(_936, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1016 = fma(_964, _982, _1014);
    float _1018 = sqrt(_1002);
    float _1020 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _1022 = _998;
    float _1024 = _964;
    float _1026 = _1016;
    if (!_1012)
    {
        _920 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1028 = _920;
    if (!_1012)
    {
        float _1030 = -_1000;
        float _1032 = _1030 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1020 = _1032;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (!_1012)
    {
        float _1038 = _1000 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1022 = _1038;
    }
    float _1040 = _1022;
    if (!_1012)
    {
        float _1042 = -_1034;
        float _1044 = fma(_1042, _1028, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1036 = _1044;
    }
    float _1046 = _1036;
    float _1048 = _1046;
    if (!_1012)
    {
        float _1050 = precise::min(_1016, _1046);
        _1024 = _1050;
    }
    float _1052 = _1024;
    if (_1012)
    {
        _1048 = _1016;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (!_1012)
    {
        float _1058 = -_1052;
        float _1060 = _1016 + _1058;
        _1026 = _1060;
    }
    float _1062 = _1026;
    if (!_1012)
    {
        float _1064 = fma(_1040, _1062, _1052);
        _1056 = _1064;
    }
    float _1066 = _1056;
    bool _1068 = _1018 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1070 = _1066 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1072 = fma(_938, 255.99609375, 7.629510946571826934814453125e-06);
    float _1074 = fma(_986, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1070);
    float _1076 = floor(_1072);
    float _1078 = fma(_984, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1074);
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1082 = 255.99609375;
    float _1084 = _1078;
    float _1086 = _1066;
    float _1088 = _1080;
    if (!_1068)
    {
        _1082 = _986;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    if (!_1068)
    {
        _1084 = _984;
    }
    float _1094 = _1084;
    bool _1096 = !_1068;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1104 = _1018 + _1102;
        float _1106 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1108 = _1104 * _1100;
        float _1110 = rsqrt(_1002);
        float _1112 = _1108 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1128 = fma(_1116, _1066, _1124);
        float _1130 = _1110 * _1126;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1134 = fma(_994, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1136 = fma(_990, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1138 = fma(_1134, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1132);
        float _1140 = fma(_1136, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1138);
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1086 = _1128;
        _1092 = _1134;
        _1098 = _1136;
        _1088 = _1142;
    }
    float _1144 = _1086;
    float _1146 = _1092;
    float _1148 = _1098;
    float _1150 = _1088;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1154 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1156 = -_1076;
    float _1158 = _1072 + _1156;
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
    float _3213 = as_type<float>(_1208);
    out.gl_Position.z = _3213;
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
    float _103 = _58;
    if (_77)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _105 = _101;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _109 = _87 + _107;
    float _111 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _113 = _73 == 96;
    float _115 = _109 * _109;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _119 = _111 + _117;
    float _121 = 0.0;
    float _123 = _105;
    if (_77)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _121;
    float _127 = fma(_71, _71, _115);
    float _129 = _125;
    if (_79)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _123;
    bool _133 = _73 == 112;
    float _135 = fma(_119, _119, _127);
    float _137 = _131;
    if (_79)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
    float _141 = _139;
    if (_81)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = rsqrt(_135);
    bool _147 = _73 == 128;
    float _149 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_83)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _73 == 144;
    float _159 = _155;
    if (_83)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_85)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _73 == 160;
    float _169 = _165;
    if (_85)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _145 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _175 = _171;
    if (_89)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _169;
    bool _179 = _73 == 176;
    float _181 = _177;
    if (_89)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _175;
    float _185 = log2(_173);
    bool _187 = _73 == 192;
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
    bool _201 = _73 == 208;
    float _203 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_147)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _73 == 224;
    float _213 = _185 + 1.2999999523162841796875;
    float _215 = _209;
    if (_147)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _217 = _207;
    float _219 = _217;
    if (_157)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _215;
    bool _223 = _73 == 240;
    float _225 = trunc(_213);
    int _227 = int(_225);
    float _229 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _219;
    float _233 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _229;
    bool _237 = _73 == 256;
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
    bool _247 = _73 == 272;
    float _249 = _245;
    if (_179)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    int _257 = min(_227, 15);
    bool _259 = _73 == 288;
    float _261 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    float _265 = float(_257);
    bool _267 = _73 == 304;
    int _269 = _257 << 4;
    int _271 = _269 + 4288;
    float _273 = _263;
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _275 = _261;
    float _277 = _275;
    if (_201)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _279 = _273;
    float _281 = -_265;
    float _283 = _281 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _285 = _279;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _277;
    int _289 = _271 + 8;
    uint _292 = uint(int(uint(_289) >> uint(2)));
    uint _294 = uint(int(uint(int(_292)) >> uint(2)));
    int _296 = int(_292) & 3;
    float _298 = (*spvDescriptorSet0.vp_c14)._m0[int(_294)][_296];
    int _300 = int(_292) + 1;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    int _304 = _300 & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    bool _308 = _73 == 320;
    float _310 = _283 + 1.0;
    float _312 = _287;
    if (_211)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _314 = _285;
    float _316 = _314;
    if (_223)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _318 = _312;
    bool _320 = _73 == 336;
    float _322 = exp2(_310);
    float _324 = _318;
    if (_223)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _326 = _316;
    float _328 = _326;
    if (_237)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _330 = _324;
    bool _332 = _73 == 352;
    float _334 = _330;
    if (_237)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_247)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _340 = _334;
    bool _342 = _73 == 368;
    float _344 = _340;
    if (_247)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _346 = _338;
    float _348 = _346;
    if (_259)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _350 = _344;
    float _352 = 1.0 / _322;
    bool _354 = _73 == 384;
    float _356 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _358 = _348;
    float _360 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _362 = _356;
    bool _364 = _73 == 400;
    float _366 = _362;
    if (_267)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _368 = _360;
    bool _370 = _73 == 416;
    float _372 = _368;
    if (_308)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _374 = _366;
    float _376 = _374;
    if (_308)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _378 = _372;
    float _380 = _378;
    if (_320)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _382 = _376;
    bool _384 = _73 == 432;
    float _386 = _382;
    if (_320)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _392 = _386;
    bool _394 = _73 == 448;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _402 = _396;
    bool _404 = _73 == 464;
    float _406 = _402;
    if (_342)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_354)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _412 = _406;
    bool _414 = _73 == 480;
    float _416 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _422 = _416;
    bool _424 = _73 == 496;
    float _426 = _422;
    if (_364)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _428 = _420;
    float _430 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _432 = _426;
    bool _434 = _73 == 512;
    float _436 = _432;
    if (_370)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _438 = _430;
    bool _440 = _73 == 528;
    float _442 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _444 = _436;
    float _446 = _444;
    if (_384)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _448 = _442;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _452 = _446;
    bool _454 = _73 == 544;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _462 = _456;
    bool _464 = _73 == 560;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _472 = _466;
    bool _474 = _73 == 576;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _482 = _476;
    bool _484 = _73 == 592;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _492 = _486;
    bool _494 = _73 == 608;
    float _496 = _492;
    if (_434)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _498 = _490;
    float _500 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _502 = _496;
    bool _504 = _73 == 624;
    float _506 = _502;
    if (_440)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _508 = _500;
    bool _510 = _73 == 640;
    float _512 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _514 = _506;
    float _516 = _514;
    if (_454)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _518 = _512;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _522 = _516;
    bool _524 = _73 == 656;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _532 = _526;
    bool _534 = _73 == 672;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _542 = _536;
    bool _544 = _73 == 688;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _552 = _546;
    bool _554 = _73 == 704;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _562 = _556;
    bool _564 = _73 == 720;
    float _566 = _562;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _568 = _560;
    float _570 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _572 = _566;
    bool _574 = _73 == 736;
    float _576 = _572;
    if (_510)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _578 = _570;
    bool _580 = _73 == 752;
    float _582 = _578;
    if (_524)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _584 = _576;
    float _586 = _584;
    if (_534)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _588 = _586;
    float _590 = _588;
    if (_544)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_554)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_564)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_574)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_580)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _608 = _606;
    float _610 = _352 * _608;
    if (_524)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _612 = _582;
    float _614 = _612;
    if (_534)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _616 = _614;
    float _618 = _610 * _60;
    float _620 = _616;
    if (_544)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_554)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _626 = _624;
    float _628 = floor(_618);
    float _630 = _626;
    if (_564)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _632 = _630;
    float _634 = _632;
    if (_574)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_580)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _640 = _638;
    float _642 = -_628;
    float _644 = _618 + _642;
    float _646 = _322 * _640;
    float _648 = _644 * 2.0;
    float _650 = -_644;
    float _652 = fma(_646, _650, _60);
    float _654 = floor(_648);
    float _656 = _646 * _654;
    float _658 = _656 * 0.5;
    float _660 = _658 + _652;
    float _662 = fma(_64, _660, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _664 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _666 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _668 = _662 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _672 = _664 + _670;
    float _674 = _668 * _668;
    float _676 = fma(_71, _71, _674);
    float _678 = fma(_672, _672, _676);
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    int _682 = _680 + 76;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.vp_c6)._m0[int(_686)][_688];
    float _692 = sqrt(_678);
    uint _694 = uint(int(uint(_680) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.vp_c6)._m0[int(_696)][_698];
    float _702 = -_306;
    float _704 = fma(_692, _298, _702);
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = -_658;
    float _710 = fma(_708, _706, _660);
    float _712 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _714 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _712;
    float _716 = _690 + 8.0;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _720 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _722 = _718 + _720;
    float _724 = abs(_714);
    float _726 = abs(_722);
    float _728 = precise::max(_724, _726);
    float _730 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _732 = _718 + _730;
    float _734 = _716 + _728;
    float _736 = _728;
    if (!_99)
    {
        _736 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _738 = _736;
    float _740 = _734 * _700;
    float _742 = _740 * 4.0;
    float _744 = precise::max(_742, 1.0);
    float _746 = log2(_744);
    float _748 = trunc(_746);
    int _750 = int(_748);
    float _752 = floor(_746);
    int _754 = min(_750, 4);
    int _756 = _754 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _758 = _756 << 4;
    float _760 = _752 + 1.0;
    float _762 = as_type<float>(_756);
    float _764 = _744;
    float _766 = _700;
    if (!_99)
    {
        _762 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _768 = _762;
    float _770 = rint(_752);
    float _772 = precise::max(_770, 0.0);
    uint _774 = uint(_772);
    uint _776 = clamp(_774, 0u, 65535u);
    uint _778 = uint(int(uint(_758) >> uint(2)));
    uint _780 = uint(int(uint(int(_778)) >> uint(2)));
    int _782 = int(_778) & 3;
    float _784 = (*spvDescriptorSet0.vp_c6)._m0[int(_780)][_782];
    float _786 = _768;
    if (!_99)
    {
        float _788 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _768, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _764 = _788;
    }
    float _790 = _764;
    float _792 = _790;
    if (!_99)
    {
        float _794 = fma(_718, _768, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _786 = _794;
    }
    float _796 = _786;
    float _798 = rint(_760);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    uint _804 = clamp(_802, 0u, 65535u);
    int _806 = _758 + 16;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    uint _810 = uint(int(uint(int(_808)) >> uint(2)));
    int _812 = int(_808) & 3;
    float _814 = (*spvDescriptorSet0.vp_c6)._m0[int(_810)][_812];
    float _816 = _796;
    if (!_99)
    {
        float _818 = fma(_790, _738, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _792 = _818;
    }
    float _820 = _792;
    float _822 = _820;
    if (!_99)
    {
        float _824 = fma(_796, _738, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _816 = _824;
    }
    float _826 = _816;
    float _828 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _830 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _828;
    float _832 = _826;
    if (!_99)
    {
        float _834 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _820);
        _822 = _834;
    }
    float _836 = _822;
    float _838 = _836;
    if (!_99)
    {
        float _840 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _826);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = _842;
    if (!_99)
    {
        float2 _2569 = float2(_836, _842);
        float2 _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2569, float2(0.0), isnan(_2569)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2569, float2(0.0), isnan(_2569)), level(0.0)).xw;
        float _850 = _848.x;
        float _852 = _848.y;
        _838 = _850;
        _844 = _852;
    }
    float _854 = _838;
    float _856 = _844;
    float _858 = fma(_732, _784, 0.5);
    float _860 = fma(_830, _784, 0.5);
    float _862 = fma(_732, _814, 0.5);
    float _864 = fma(_830, _814, 0.5);
    float3 _2603 = float3(_860, _858, float(int(_776)));
    float3 _2607 = select(_2603, float3(0.0), isnan(_2603));
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2607.xy, uint(rint(_2607.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2607.xy, uint(rint(_2607.z)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float3 _2622 = float3(_864, _862, float(int(_804)));
    float3 _2624 = select(_2622, float3(0.0), isnan(_2622));
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2624.xy, uint(rint(_2624.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2624.xy, uint(rint(_2624.z)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    if (_99)
    {
        _766 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _884 = _766;
    float _886 = 0.0;
    float _888 = _884;
    if (_99)
    {
        _886 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _890 = _886;
    if (_99)
    {
        float _892 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _884, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _103 = _892;
    }
    float _894 = _103;
    float _896 = _894;
    if (_99)
    {
        float _898 = fma(_718, _884, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _888 = _898;
    }
    float _900 = _888;
    float _902 = _900;
    if (_99)
    {
        float _904 = fma(_894, _890, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _896 = _904;
    }
    float _906 = _896;
    float _908 = _906;
    if (_99)
    {
        float _910 = fma(_900, _890, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _902 = _910;
    }
    float _912 = _902;
    float _914 = _912;
    if (_99)
    {
        float _916 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _906);
        _908 = _916;
    }
    float _918 = _908;
    float _920 = _918;
    if (_99)
    {
        float _922 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _912);
        _914 = _922;
    }
    float _924 = _914;
    float _926 = _854;
    float _928 = _856;
    if (_99)
    {
        float2 _2718 = float2(_918, _924);
        float2 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2718, float2(0.0), isnan(_2718)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2718, float2(0.0), isnan(_2718)), level(0.0)).xw;
        float _932 = _930.x;
        float _934 = _930.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = (*spvDescriptorSet0.vp_c15)._m0[0].z * 0.00012500000593718141317367553710938;
    float _942 = _718 * 0.00012500000593718141317367553710938;
    float _944 = -_752;
    float _946 = _746 + _944;
    float _948 = abs(_940);
    float _950 = abs(_942);
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
    float _984 = fma(_964, _978, _718);
    float _986 = fma(_964, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _990 = _984 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _994 = _986 + _992;
    float _996 = _990 * _990;
    float _998 = _990 * _990;
    float _1000 = fma(_994, _994, _996);
    float _1002 = fma(_994, _994, _998);
    bool _1004 = _1000 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1006 = isnan(_1000);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1012 = _1008 || _1010;
    float _1014 = fma(_936, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1016 = fma(_964, _982, _1014);
    float _1018 = sqrt(_1002);
    float _1020 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _1022 = _998;
    float _1024 = _964;
    float _1026 = _1016;
    if (!_1012)
    {
        _920 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1028 = _920;
    if (!_1012)
    {
        float _1030 = -_1000;
        float _1032 = _1030 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1020 = _1032;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (!_1012)
    {
        float _1038 = _1000 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1022 = _1038;
    }
    float _1040 = _1022;
    if (!_1012)
    {
        float _1042 = -_1034;
        float _1044 = fma(_1042, _1028, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1036 = _1044;
    }
    float _1046 = _1036;
    float _1048 = _1046;
    if (!_1012)
    {
        float _1050 = precise::min(_1016, _1046);
        _1024 = _1050;
    }
    float _1052 = _1024;
    if (_1012)
    {
        _1048 = _1016;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (!_1012)
    {
        float _1058 = -_1052;
        float _1060 = _1016 + _1058;
        _1026 = _1060;
    }
    float _1062 = _1026;
    if (!_1012)
    {
        float _1064 = fma(_1040, _1062, _1052);
        _1056 = _1064;
    }
    float _1066 = _1056;
    bool _1068 = _1018 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1070 = _1066 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1072 = fma(_938, 255.99609375, 7.629510946571826934814453125e-06);
    float _1074 = fma(_986, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1070);
    float _1076 = floor(_1072);
    float _1078 = fma(_984, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1074);
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1082 = 255.99609375;
    float _1084 = _1078;
    float _1086 = _1066;
    float _1088 = _1080;
    if (!_1068)
    {
        _1082 = _986;
    }
    float _1090 = _1082;
    float _1092 = _1090;
    if (!_1068)
    {
        _1084 = _984;
    }
    float _1094 = _1084;
    bool _1096 = !_1068;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1104 = _1018 + _1102;
        float _1106 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1108 = _1104 * _1100;
        float _1110 = rsqrt(_1002);
        float _1112 = _1108 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1128 = fma(_1116, _1066, _1124);
        float _1130 = _1110 * _1126;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1134 = fma(_994, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1136 = fma(_990, _1130, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1138 = fma(_1134, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1132);
        float _1140 = fma(_1136, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1138);
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1086 = _1128;
        _1092 = _1134;
        _1098 = _1136;
        _1088 = _1142;
    }
    float _1144 = _1086;
    float _1146 = _1092;
    float _1148 = _1098;
    float _1150 = _1088;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1154 = _1144 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1156 = -_1076;
    float _1158 = _1072 + _1156;
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
    float _3213 = as_type<float>(_1208);
    out.gl_Position.z = _3213;
    out.gl_Position.w = _1204;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

