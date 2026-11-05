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
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _67 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _69 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _67;
    int _71 = _65 << 4;
    bool _75 = _71 == 0;
    bool _77 = _71 == 16;
    bool _79 = _71 == 32;
    bool _81 = _71 == 48;
    bool _83 = _71 == 64;
    float _85 = fma(_62, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _87 = _71 == 80;
    bool _89 = _56 >= 0.5;
    bool _91 = isnan(_56);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.5);
    bool _97 = _93 || _95;
    float _99 = as_type<float>(gl_BaseInstance);
    float _101 = _69;
    float _103 = _58;
    if (_75)
    {
        _99 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _105 = _99;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _109 = _85 + _107;
    float _111 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _113 = _71 == 96;
    float _115 = _109 * _109;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _119 = _111 + _117;
    float _121 = 0.0;
    float _123 = _105;
    if (_75)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _121;
    float _127 = fma(_69, _69, _115);
    float _129 = _125;
    if (_77)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _123;
    bool _133 = _71 == 112;
    float _135 = fma(_119, _119, _127);
    float _137 = _131;
    if (_77)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
    float _141 = _139;
    if (_79)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = rsqrt(_135);
    bool _147 = _71 == 128;
    float _149 = _143;
    if (_79)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_81)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _71 == 144;
    float _159 = _155;
    if (_81)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _71 == 160;
    float _169 = _165;
    if (_83)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _145 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _175 = _171;
    if (_87)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _169;
    bool _179 = _71 == 176;
    float _181 = _177;
    if (_87)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _175;
    float _185 = log2(_173);
    bool _187 = _71 == 192;
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
    bool _201 = _71 == 208;
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
    bool _211 = _71 == 224;
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
    bool _223 = _71 == 240;
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
    bool _237 = _71 == 256;
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
    bool _247 = _71 == 272;
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
    bool _259 = _71 == 288;
    float _261 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    float _265 = float(_257);
    bool _267 = _71 == 304;
    int _269 = _257 << 4;
    int _271 = _269 + 4288;
    float _273 = _263;
    float _275 = as_type<float>(_271);
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _277 = _261;
    float _279 = _277;
    if (_201)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _281 = _273;
    float _283 = -_265;
    float _285 = _283 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _287 = _281;
    if (_211)
    {
        _279 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _289 = _279;
    int _291 = _271 + 8;
    uint _294 = uint(int(uint(_291) >> uint(2)));
    uint _296 = uint(int(uint(int(_294)) >> uint(2)));
    int _298 = int(_294) & 3;
    float _300 = (*spvDescriptorSet0.vp_c14)._m0[int(_296)][_298];
    int _302 = int(_294) + 1;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    int _306 = _302 & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    bool _310 = _71 == 320;
    float _312 = _285 + 1.0;
    float _314 = _289;
    if (_211)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _316 = _287;
    float _318 = _316;
    if (_223)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _320 = _314;
    bool _322 = _71 == 336;
    float _324 = exp2(_312);
    float _326 = _320;
    if (_223)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _328 = _318;
    float _330 = _328;
    if (_237)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _332 = _326;
    bool _334 = _71 == 352;
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
    bool _344 = _71 == 368;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_259)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _352 = _346;
    float _354 = 1.0 / _324;
    bool _356 = _71 == 384;
    float _358 = _352;
    if (_259)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _360 = _350;
    float _362 = _360;
    if (_267)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _364 = _358;
    bool _366 = _71 == 400;
    float _368 = _364;
    if (_267)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _370 = _362;
    bool _372 = _71 == 416;
    float _374 = _370;
    if (_310)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _376 = _368;
    float _378 = _376;
    if (_310)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _380 = _374;
    float _382 = _380;
    if (_322)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _384 = _378;
    bool _386 = _71 == 432;
    float _388 = _384;
    if (_322)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _390 = _382;
    float _392 = _390;
    if (_334)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _394 = _388;
    bool _396 = _71 == 448;
    float _398 = _394;
    if (_334)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _400 = _392;
    float _402 = _400;
    if (_344)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _404 = _398;
    bool _406 = _71 == 464;
    float _408 = _404;
    if (_344)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_356)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _414 = _408;
    bool _416 = _71 == 480;
    float _418 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_366)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _424 = _418;
    bool _426 = _71 == 496;
    float _428 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _434 = _428;
    bool _436 = _71 == 512;
    float _438 = _434;
    if (_372)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _440 = _432;
    bool _442 = _71 == 528;
    float _444 = _440;
    if (_386)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _446 = _438;
    float _448 = _446;
    if (_386)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _450 = _444;
    float _452 = _450;
    if (_396)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _454 = _448;
    bool _456 = _71 == 544;
    float _458 = _454;
    if (_396)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _460 = _452;
    float _462 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _464 = _458;
    bool _466 = _71 == 560;
    float _468 = _464;
    if (_406)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _470 = _462;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _474 = _468;
    bool _476 = _71 == 576;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _484 = _478;
    bool _486 = _71 == 592;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _494 = _488;
    bool _496 = _71 == 608;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _504 = _498;
    bool _506 = _71 == 624;
    float _508 = _504;
    if (_442)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _510 = _502;
    bool _512 = _71 == 640;
    float _514 = _510;
    if (_456)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _516 = _508;
    float _518 = _516;
    if (_456)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _520 = _514;
    float _522 = _520;
    if (_466)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _524 = _518;
    bool _526 = _71 == 656;
    float _528 = _524;
    if (_466)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _530 = _522;
    float _532 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _534 = _528;
    bool _536 = _71 == 672;
    float _538 = _534;
    if (_476)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _540 = _532;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _544 = _538;
    bool _546 = _71 == 688;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _554 = _548;
    bool _556 = _71 == 704;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _564 = _558;
    bool _566 = _71 == 720;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_512)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _574 = _568;
    bool _576 = _71 == 736;
    float _578 = _574;
    if (_512)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _580 = _572;
    bool _582 = _71 == 752;
    float _584 = _580;
    if (_526)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _586 = _578;
    float _588 = _586;
    if (_536)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_546)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_556)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_566)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_576)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_582)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _610 = _608;
    float _612 = _354 * _610;
    if (_526)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _614 = _584;
    float _616 = _614;
    if (_536)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _618 = _616;
    float _620 = _612 * _58;
    float _622 = _618;
    if (_546)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_556)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _628 = _626;
    float _630 = floor(_620);
    float _632 = _628;
    if (_566)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _634 = _632;
    float _636 = _634;
    if (_576)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_582)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _642 = _640;
    float _644 = -_630;
    float _646 = _620 + _644;
    float _648 = _324 * _642;
    float _650 = _646 * 2.0;
    float _652 = -_646;
    float _654 = fma(_648, _652, _58);
    float _656 = floor(_650);
    float _658 = _648 * _656;
    float _660 = _658 * 0.5;
    float _662 = _660 + _654;
    float _664 = fma(_62, _662, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _668 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _670 = _664 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _674 = _666 + _672;
    float _676 = _670 * _670;
    float _678 = fma(_69, _69, _676);
    float _680 = fma(_674, _674, _678);
    float _682 = sqrt(_680);
    float _684 = -_308;
    float _686 = fma(_682, _300, _684);
    float _688 = precise::clamp(_686, 0.0, 1.0);
    float _690 = -_660;
    float _692 = fma(_690, _688, _662);
    float _694 = _662;
    float _696 = _660;
    float _698 = _680;
    float _700 = _656;
    if (!_97)
    {
        _694 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _702 = _694;
    float _704 = _702;
    if (!_97)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _706 = _696;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _710 = _706;
    if (!_97)
    {
        float _712 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _702, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _101 = _712;
    }
    float _714 = _101;
    float _716 = _714;
    if (!_97)
    {
        float _718 = fma(_708, _702, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _704 = _718;
    }
    float _720 = _704;
    float _722 = _720;
    if (!_97)
    {
        float _724 = fma(_714, _706, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _716 = _724;
    }
    float _726 = _716;
    float _728 = _726;
    if (!_97)
    {
        float _730 = fma(_720, _706, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_97)
    {
        float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _726);
        _728 = _736;
    }
    float _738 = _728;
    if (!_97)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _732);
        _275 = _740;
    }
    float _742 = _275;
    if (!_97)
    {
        float2 _2149 = float2(_738, _742);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
        _698 = _744;
    }
    float _746 = _698;
    if (_97)
    {
        _700 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _700;
    if (_97)
    {
        _103 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _103;
    if (_97)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _734 = _752;
    }
    float _754 = _734;
    float _756 = _754;
    if (_97)
    {
        float _758 = fma(_708, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _710 = _758;
    }
    float _760 = _710;
    float _762 = _760;
    if (_97)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_97)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_97)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    float _780 = _778;
    if (_97)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _782;
    }
    float _784 = _774;
    float _786 = _746;
    float _788 = _784;
    if (_97)
    {
        float2 _2243 = float2(_778, _784);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2243, float2(0.0), isnan(_2243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2243, float2(0.0), isnan(_2243)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = _708 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    bool _808 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _780 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _812 = _780;
    float _814 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _816 = _814 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _818 = _812;
    if (!_808)
    {
        _810 = _814;
    }
    float _820 = _810;
    float _822 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _816);
    float _824 = fma(_708, (*spvDescriptorSet0.vp_c4)._m0[2].z, _822);
    float _826 = _824 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _828 = _824;
    float _830 = _820;
    if (!_808)
    {
        _828 = _708;
    }
    float _832 = _828;
    float _834 = _832;
    if (!_808)
    {
        _788 = _826;
    }
    float _836 = _788;
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
    out.m_40.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_40.y = _814;
    out.m_40.z = _708;
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
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _67 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _69 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _67;
    int _71 = _65 << 4;
    bool _75 = _71 == 0;
    bool _77 = _71 == 16;
    bool _79 = _71 == 32;
    bool _81 = _71 == 48;
    bool _83 = _71 == 64;
    float _85 = fma(_62, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _87 = _71 == 80;
    bool _89 = _56 >= 0.5;
    bool _91 = isnan(_56);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.5);
    bool _97 = _93 || _95;
    float _99 = as_type<float>(gl_BaseInstance);
    float _101 = _69;
    float _103 = _58;
    if (_75)
    {
        _99 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _105 = _99;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _109 = _85 + _107;
    float _111 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _113 = _71 == 96;
    float _115 = _109 * _109;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _119 = _111 + _117;
    float _121 = 0.0;
    float _123 = _105;
    if (_75)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _121;
    float _127 = fma(_69, _69, _115);
    float _129 = _125;
    if (_77)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _123;
    bool _133 = _71 == 112;
    float _135 = fma(_119, _119, _127);
    float _137 = _131;
    if (_77)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
    float _141 = _139;
    if (_79)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = rsqrt(_135);
    bool _147 = _71 == 128;
    float _149 = _143;
    if (_79)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_81)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _71 == 144;
    float _159 = _155;
    if (_81)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _71 == 160;
    float _169 = _165;
    if (_83)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _145 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _175 = _171;
    if (_87)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _169;
    bool _179 = _71 == 176;
    float _181 = _177;
    if (_87)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _175;
    float _185 = log2(_173);
    bool _187 = _71 == 192;
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
    bool _201 = _71 == 208;
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
    bool _211 = _71 == 224;
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
    bool _223 = _71 == 240;
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
    bool _237 = _71 == 256;
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
    bool _247 = _71 == 272;
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
    bool _259 = _71 == 288;
    float _261 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    float _265 = float(_257);
    bool _267 = _71 == 304;
    int _269 = _257 << 4;
    int _271 = _269 + 4288;
    float _273 = _263;
    float _275 = as_type<float>(_271);
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _277 = _261;
    float _279 = _277;
    if (_201)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _281 = _273;
    float _283 = -_265;
    float _285 = _283 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _287 = _281;
    if (_211)
    {
        _279 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _289 = _279;
    int _291 = _271 + 8;
    uint _294 = uint(int(uint(_291) >> uint(2)));
    uint _296 = uint(int(uint(int(_294)) >> uint(2)));
    int _298 = int(_294) & 3;
    float _300 = (*spvDescriptorSet0.vp_c14)._m0[int(_296)][_298];
    int _302 = int(_294) + 1;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    int _306 = _302 & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    bool _310 = _71 == 320;
    float _312 = _285 + 1.0;
    float _314 = _289;
    if (_211)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _316 = _287;
    float _318 = _316;
    if (_223)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _320 = _314;
    bool _322 = _71 == 336;
    float _324 = exp2(_312);
    float _326 = _320;
    if (_223)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _328 = _318;
    float _330 = _328;
    if (_237)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _332 = _326;
    bool _334 = _71 == 352;
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
    bool _344 = _71 == 368;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_259)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _352 = _346;
    float _354 = 1.0 / _324;
    bool _356 = _71 == 384;
    float _358 = _352;
    if (_259)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _360 = _350;
    float _362 = _360;
    if (_267)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _364 = _358;
    bool _366 = _71 == 400;
    float _368 = _364;
    if (_267)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _370 = _362;
    bool _372 = _71 == 416;
    float _374 = _370;
    if (_310)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _376 = _368;
    float _378 = _376;
    if (_310)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _380 = _374;
    float _382 = _380;
    if (_322)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _384 = _378;
    bool _386 = _71 == 432;
    float _388 = _384;
    if (_322)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _390 = _382;
    float _392 = _390;
    if (_334)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _394 = _388;
    bool _396 = _71 == 448;
    float _398 = _394;
    if (_334)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _400 = _392;
    float _402 = _400;
    if (_344)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _404 = _398;
    bool _406 = _71 == 464;
    float _408 = _404;
    if (_344)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_356)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _414 = _408;
    bool _416 = _71 == 480;
    float _418 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_366)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _424 = _418;
    bool _426 = _71 == 496;
    float _428 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _434 = _428;
    bool _436 = _71 == 512;
    float _438 = _434;
    if (_372)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _440 = _432;
    bool _442 = _71 == 528;
    float _444 = _440;
    if (_386)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _446 = _438;
    float _448 = _446;
    if (_386)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _450 = _444;
    float _452 = _450;
    if (_396)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _454 = _448;
    bool _456 = _71 == 544;
    float _458 = _454;
    if (_396)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _460 = _452;
    float _462 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _464 = _458;
    bool _466 = _71 == 560;
    float _468 = _464;
    if (_406)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _470 = _462;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _474 = _468;
    bool _476 = _71 == 576;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _484 = _478;
    bool _486 = _71 == 592;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _494 = _488;
    bool _496 = _71 == 608;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _504 = _498;
    bool _506 = _71 == 624;
    float _508 = _504;
    if (_442)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _510 = _502;
    bool _512 = _71 == 640;
    float _514 = _510;
    if (_456)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _516 = _508;
    float _518 = _516;
    if (_456)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _520 = _514;
    float _522 = _520;
    if (_466)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _524 = _518;
    bool _526 = _71 == 656;
    float _528 = _524;
    if (_466)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _530 = _522;
    float _532 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _534 = _528;
    bool _536 = _71 == 672;
    float _538 = _534;
    if (_476)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _540 = _532;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _544 = _538;
    bool _546 = _71 == 688;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _554 = _548;
    bool _556 = _71 == 704;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _564 = _558;
    bool _566 = _71 == 720;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_512)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _574 = _568;
    bool _576 = _71 == 736;
    float _578 = _574;
    if (_512)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _580 = _572;
    bool _582 = _71 == 752;
    float _584 = _580;
    if (_526)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _586 = _578;
    float _588 = _586;
    if (_536)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_546)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_556)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_566)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_576)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_582)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _610 = _608;
    float _612 = _354 * _610;
    if (_526)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _614 = _584;
    float _616 = _614;
    if (_536)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _618 = _616;
    float _620 = _612 * _58;
    float _622 = _618;
    if (_546)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_556)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _628 = _626;
    float _630 = floor(_620);
    float _632 = _628;
    if (_566)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _634 = _632;
    float _636 = _634;
    if (_576)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_582)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _642 = _640;
    float _644 = -_630;
    float _646 = _620 + _644;
    float _648 = _324 * _642;
    float _650 = _646 * 2.0;
    float _652 = -_646;
    float _654 = fma(_648, _652, _58);
    float _656 = floor(_650);
    float _658 = _648 * _656;
    float _660 = _658 * 0.5;
    float _662 = _660 + _654;
    float _664 = fma(_62, _662, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _668 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _670 = _664 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _674 = _666 + _672;
    float _676 = _670 * _670;
    float _678 = fma(_69, _69, _676);
    float _680 = fma(_674, _674, _678);
    float _682 = sqrt(_680);
    float _684 = -_308;
    float _686 = fma(_682, _300, _684);
    float _688 = precise::clamp(_686, 0.0, 1.0);
    float _690 = -_660;
    float _692 = fma(_690, _688, _662);
    float _694 = _662;
    float _696 = _660;
    float _698 = _680;
    float _700 = _656;
    if (!_97)
    {
        _694 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _702 = _694;
    float _704 = _702;
    if (!_97)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _706 = _696;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _710 = _706;
    if (!_97)
    {
        float _712 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _702, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _101 = _712;
    }
    float _714 = _101;
    float _716 = _714;
    if (!_97)
    {
        float _718 = fma(_708, _702, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _704 = _718;
    }
    float _720 = _704;
    float _722 = _720;
    if (!_97)
    {
        float _724 = fma(_714, _706, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _716 = _724;
    }
    float _726 = _716;
    float _728 = _726;
    if (!_97)
    {
        float _730 = fma(_720, _706, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_97)
    {
        float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _726);
        _728 = _736;
    }
    float _738 = _728;
    if (!_97)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _732);
        _275 = _740;
    }
    float _742 = _275;
    if (!_97)
    {
        float2 _2149 = float2(_738, _742);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
        _698 = _744;
    }
    float _746 = _698;
    if (_97)
    {
        _700 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _700;
    if (_97)
    {
        _103 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _103;
    if (_97)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _734 = _752;
    }
    float _754 = _734;
    float _756 = _754;
    if (_97)
    {
        float _758 = fma(_708, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _710 = _758;
    }
    float _760 = _710;
    float _762 = _760;
    if (_97)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_97)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_97)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    float _780 = _778;
    if (_97)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _782;
    }
    float _784 = _774;
    float _786 = _746;
    float _788 = _784;
    if (_97)
    {
        float2 _2243 = float2(_778, _784);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2243, float2(0.0), isnan(_2243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2243, float2(0.0), isnan(_2243)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = _708 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    bool _808 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _780 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _812 = _780;
    float _814 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _816 = _814 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _818 = _812;
    if (!_808)
    {
        _810 = _814;
    }
    float _820 = _810;
    float _822 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _816);
    float _824 = fma(_708, (*spvDescriptorSet0.vp_c4)._m0[2].z, _822);
    float _826 = _824 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _828 = _824;
    float _830 = _820;
    if (!_808)
    {
        _828 = _708;
    }
    float _832 = _828;
    float _834 = _832;
    if (!_808)
    {
        _788 = _826;
    }
    float _836 = _788;
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
    out.m_40.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_40.y = _814;
    out.m_40.z = _708;
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
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _67 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _69 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _67;
    int _71 = _65 << 4;
    bool _75 = _71 == 0;
    bool _77 = _71 == 16;
    bool _79 = _71 == 32;
    bool _81 = _71 == 48;
    bool _83 = _71 == 64;
    float _85 = fma(_62, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _87 = _71 == 80;
    bool _89 = _56 >= 0.5;
    bool _91 = isnan(_56);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.5);
    bool _97 = _93 || _95;
    float _99 = as_type<float>(gl_BaseInstance);
    float _101 = _69;
    float _103 = _58;
    if (_75)
    {
        _99 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _105 = _99;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _109 = _85 + _107;
    float _111 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _113 = _71 == 96;
    float _115 = _109 * _109;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _119 = _111 + _117;
    float _121 = 0.0;
    float _123 = _105;
    if (_75)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _121;
    float _127 = fma(_69, _69, _115);
    float _129 = _125;
    if (_77)
    {
        _123 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _123;
    bool _133 = _71 == 112;
    float _135 = fma(_119, _119, _127);
    float _137 = _131;
    if (_77)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _129;
    float _141 = _139;
    if (_79)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = rsqrt(_135);
    bool _147 = _71 == 128;
    float _149 = _143;
    if (_79)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_81)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _149;
    bool _157 = _71 == 144;
    float _159 = _155;
    if (_81)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _71 == 160;
    float _169 = _165;
    if (_83)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _145 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _175 = _171;
    if (_87)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _169;
    bool _179 = _71 == 176;
    float _181 = _177;
    if (_87)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _175;
    float _185 = log2(_173);
    bool _187 = _71 == 192;
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
    bool _201 = _71 == 208;
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
    bool _211 = _71 == 224;
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
    bool _223 = _71 == 240;
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
    bool _237 = _71 == 256;
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
    bool _247 = _71 == 272;
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
    bool _259 = _71 == 288;
    float _261 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _253;
    float _265 = float(_257);
    bool _267 = _71 == 304;
    int _269 = _257 << 4;
    int _271 = _269 + 4288;
    float _273 = _263;
    float _275 = as_type<float>(_271);
    if (_201)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _277 = _261;
    float _279 = _277;
    if (_201)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _281 = _273;
    float _283 = -_265;
    float _285 = _283 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _287 = _281;
    if (_211)
    {
        _279 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _289 = _279;
    int _291 = _271 + 8;
    uint _294 = uint(int(uint(_291) >> uint(2)));
    uint _296 = uint(int(uint(int(_294)) >> uint(2)));
    int _298 = int(_294) & 3;
    float _300 = (*spvDescriptorSet0.vp_c14)._m0[int(_296)][_298];
    int _302 = int(_294) + 1;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    int _306 = _302 & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    bool _310 = _71 == 320;
    float _312 = _285 + 1.0;
    float _314 = _289;
    if (_211)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _316 = _287;
    float _318 = _316;
    if (_223)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _320 = _314;
    bool _322 = _71 == 336;
    float _324 = exp2(_312);
    float _326 = _320;
    if (_223)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _328 = _318;
    float _330 = _328;
    if (_237)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _332 = _326;
    bool _334 = _71 == 352;
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
    bool _344 = _71 == 368;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_259)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _352 = _346;
    float _354 = 1.0 / _324;
    bool _356 = _71 == 384;
    float _358 = _352;
    if (_259)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _360 = _350;
    float _362 = _360;
    if (_267)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _364 = _358;
    bool _366 = _71 == 400;
    float _368 = _364;
    if (_267)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _370 = _362;
    bool _372 = _71 == 416;
    float _374 = _370;
    if (_310)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _376 = _368;
    float _378 = _376;
    if (_310)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _380 = _374;
    float _382 = _380;
    if (_322)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _384 = _378;
    bool _386 = _71 == 432;
    float _388 = _384;
    if (_322)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _390 = _382;
    float _392 = _390;
    if (_334)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _394 = _388;
    bool _396 = _71 == 448;
    float _398 = _394;
    if (_334)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _400 = _392;
    float _402 = _400;
    if (_344)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _404 = _398;
    bool _406 = _71 == 464;
    float _408 = _404;
    if (_344)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_356)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _414 = _408;
    bool _416 = _71 == 480;
    float _418 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_366)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _424 = _418;
    bool _426 = _71 == 496;
    float _428 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _434 = _428;
    bool _436 = _71 == 512;
    float _438 = _434;
    if (_372)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _440 = _432;
    bool _442 = _71 == 528;
    float _444 = _440;
    if (_386)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _446 = _438;
    float _448 = _446;
    if (_386)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _450 = _444;
    float _452 = _450;
    if (_396)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _454 = _448;
    bool _456 = _71 == 544;
    float _458 = _454;
    if (_396)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _460 = _452;
    float _462 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _464 = _458;
    bool _466 = _71 == 560;
    float _468 = _464;
    if (_406)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _470 = _462;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _474 = _468;
    bool _476 = _71 == 576;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _484 = _478;
    bool _486 = _71 == 592;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _494 = _488;
    bool _496 = _71 == 608;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _504 = _498;
    bool _506 = _71 == 624;
    float _508 = _504;
    if (_442)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _510 = _502;
    bool _512 = _71 == 640;
    float _514 = _510;
    if (_456)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _516 = _508;
    float _518 = _516;
    if (_456)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _520 = _514;
    float _522 = _520;
    if (_466)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _524 = _518;
    bool _526 = _71 == 656;
    float _528 = _524;
    if (_466)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _530 = _522;
    float _532 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _534 = _528;
    bool _536 = _71 == 672;
    float _538 = _534;
    if (_476)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _540 = _532;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _544 = _538;
    bool _546 = _71 == 688;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _554 = _548;
    bool _556 = _71 == 704;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _564 = _558;
    bool _566 = _71 == 720;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_512)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _574 = _568;
    bool _576 = _71 == 736;
    float _578 = _574;
    if (_512)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _580 = _572;
    bool _582 = _71 == 752;
    float _584 = _580;
    if (_526)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _586 = _578;
    float _588 = _586;
    if (_536)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_546)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_556)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_566)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_576)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_582)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _610 = _608;
    float _612 = _354 * _610;
    if (_526)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _614 = _584;
    float _616 = _614;
    if (_536)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _618 = _616;
    float _620 = _612 * _58;
    float _622 = _618;
    if (_546)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_556)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _628 = _626;
    float _630 = floor(_620);
    float _632 = _628;
    if (_566)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _634 = _632;
    float _636 = _634;
    if (_576)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_582)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _642 = _640;
    float _644 = -_630;
    float _646 = _620 + _644;
    float _648 = _324 * _642;
    float _650 = _646 * 2.0;
    float _652 = -_646;
    float _654 = fma(_648, _652, _58);
    float _656 = floor(_650);
    float _658 = _648 * _656;
    float _660 = _658 * 0.5;
    float _662 = _660 + _654;
    float _664 = fma(_62, _662, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _668 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _670 = _664 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _674 = _666 + _672;
    float _676 = _670 * _670;
    float _678 = fma(_69, _69, _676);
    float _680 = fma(_674, _674, _678);
    float _682 = sqrt(_680);
    float _684 = -_308;
    float _686 = fma(_682, _300, _684);
    float _688 = precise::clamp(_686, 0.0, 1.0);
    float _690 = -_660;
    float _692 = fma(_690, _688, _662);
    float _694 = _662;
    float _696 = _660;
    float _698 = _680;
    float _700 = _656;
    if (!_97)
    {
        _694 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _702 = _694;
    float _704 = _702;
    if (!_97)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _706 = _696;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _710 = _706;
    if (!_97)
    {
        float _712 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _702, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _101 = _712;
    }
    float _714 = _101;
    float _716 = _714;
    if (!_97)
    {
        float _718 = fma(_708, _702, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _704 = _718;
    }
    float _720 = _704;
    float _722 = _720;
    if (!_97)
    {
        float _724 = fma(_714, _706, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _716 = _724;
    }
    float _726 = _716;
    float _728 = _726;
    if (!_97)
    {
        float _730 = fma(_720, _706, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_97)
    {
        float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _726);
        _728 = _736;
    }
    float _738 = _728;
    if (!_97)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _732);
        _275 = _740;
    }
    float _742 = _275;
    if (!_97)
    {
        float2 _2149 = float2(_738, _742);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
        _698 = _744;
    }
    float _746 = _698;
    if (_97)
    {
        _700 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _700;
    if (_97)
    {
        _103 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _103;
    if (_97)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _734 = _752;
    }
    float _754 = _734;
    float _756 = _754;
    if (_97)
    {
        float _758 = fma(_708, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _710 = _758;
    }
    float _760 = _710;
    float _762 = _760;
    if (_97)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_97)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_97)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    float _780 = _778;
    if (_97)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _782;
    }
    float _784 = _774;
    float _786 = _746;
    float _788 = _784;
    if (_97)
    {
        float2 _2243 = float2(_778, _784);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2243, float2(0.0), isnan(_2243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2243, float2(0.0), isnan(_2243)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = _708 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    bool _808 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _780 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _812 = _780;
    float _814 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _816 = _814 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _818 = _812;
    if (!_808)
    {
        _810 = _814;
    }
    float _820 = _810;
    float _822 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _816);
    float _824 = fma(_708, (*spvDescriptorSet0.vp_c4)._m0[2].z, _822);
    float _826 = _824 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _828 = _824;
    float _830 = _820;
    if (!_808)
    {
        _828 = _708;
    }
    float _832 = _828;
    float _834 = _832;
    if (!_808)
    {
        _788 = _826;
    }
    float _836 = _788;
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
    out.m_40.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_40.y = _814;
    out.m_40.z = _708;
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

