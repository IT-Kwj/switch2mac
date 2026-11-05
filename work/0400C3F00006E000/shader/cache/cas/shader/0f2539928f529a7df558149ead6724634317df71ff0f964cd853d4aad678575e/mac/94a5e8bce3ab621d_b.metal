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
    float4 m_46 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _77 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _79 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _81 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _79;
    int _83 = _77 << 4;
    bool _87 = _83 == 0;
    bool _89 = _83 == 16;
    bool _91 = _83 == 32;
    bool _93 = _83 == 48;
    bool _95 = _83 == 64;
    float _97 = fma(_74, _70, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _99 = _83 == 80;
    bool _101 = _68 >= 0.5;
    bool _103 = isnan(_68);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.5);
    bool _109 = _105 || _107;
    float _111 = as_type<float>(gl_BaseInstance);
    float _113 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _115 = _68;
    if (_87)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _117 = _111;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _121 = _97 + _119;
    float _123 = fma(_70, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _125 = _83 == 96;
    float _127 = _121 * _121;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = _123 + _129;
    float _133 = 0.0;
    float _135 = _117;
    if (_87)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _137 = _133;
    float _139 = fma(_81, _81, _127);
    float _141 = _137;
    if (_89)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _143 = _135;
    bool _145 = _83 == 112;
    float _147 = fma(_131, _131, _139);
    float _149 = _143;
    if (_89)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_91)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _155 = _149;
    float _157 = rsqrt(_147);
    bool _159 = _83 == 128;
    float _161 = _155;
    if (_91)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _163 = _153;
    float _165 = _163;
    if (_93)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _167 = _161;
    bool _169 = _83 == 144;
    float _171 = _167;
    if (_93)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _173 = _165;
    float _175 = _173;
    if (_95)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _177 = _171;
    bool _179 = _83 == 160;
    float _181 = _177;
    if (_95)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _183 = _175;
    float _185 = _157 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _187 = _183;
    if (_99)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _189 = _181;
    bool _191 = _83 == 176;
    float _193 = _189;
    if (_99)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _195 = _187;
    float _197 = log2(_185);
    bool _199 = _83 == 192;
    float _201 = _195;
    if (_125)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _203 = _193;
    float _205 = _203;
    if (_125)
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
    bool _213 = _83 == 208;
    float _215 = _211;
    if (_145)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_159)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _221 = _215;
    bool _223 = _83 == 224;
    float _225 = _197 + 1.2999999523162841796875;
    float _227 = _221;
    if (_159)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _229 = _219;
    float _231 = _229;
    if (_169)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _233 = _227;
    bool _235 = _83 == 240;
    float _237 = trunc(_225);
    int _239 = int(_237);
    float _241 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _243 = _231;
    float _245 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _247 = _241;
    bool _249 = _83 == 256;
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
    bool _259 = _83 == 272;
    float _261 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_199)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _267 = _261;
    int _269 = min(_239, 15);
    bool _271 = _83 == 288;
    float _273 = _267;
    if (_199)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _275 = _265;
    float _277 = float(_269);
    bool _279 = _83 == 304;
    int _281 = _269 << 4;
    int _283 = _281 + 4288;
    float _285 = _275;
    float _287 = as_type<float>(_283);
    if (_213)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _289 = _273;
    float _291 = _289;
    if (_213)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _293 = _285;
    float _295 = -_277;
    float _297 = _295 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _299 = _293;
    if (_223)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _301 = _291;
    int _303 = _283 + 8;
    uint _306 = uint(int(uint(_303) >> uint(2)));
    uint _308 = uint(int(uint(int(_306)) >> uint(2)));
    int _310 = int(_306) & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    int _314 = int(_306) + 1;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    int _318 = _314 & 3;
    float _320 = (*spvDescriptorSet0.vp_c14)._m0[int(_316)][_318];
    bool _322 = _83 == 320;
    float _324 = _297 + 1.0;
    float _326 = _301;
    if (_223)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _328 = _299;
    float _330 = _328;
    if (_235)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _332 = _326;
    bool _334 = _83 == 336;
    float _336 = exp2(_324);
    float _338 = _332;
    if (_235)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _340 = _330;
    float _342 = _340;
    if (_249)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _344 = _338;
    bool _346 = _83 == 352;
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
    bool _356 = _83 == 368;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_271)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _364 = _358;
    float _366 = 1.0 / _336;
    bool _368 = _83 == 384;
    float _370 = _364;
    if (_271)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _372 = _362;
    float _374 = _372;
    if (_279)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _376 = _370;
    bool _378 = _83 == 400;
    float _380 = _376;
    if (_279)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _382 = _374;
    bool _384 = _83 == 416;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _388 = _380;
    float _390 = _388;
    if (_322)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _392 = _386;
    float _394 = _392;
    if (_334)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _396 = _390;
    bool _398 = _83 == 432;
    float _400 = _396;
    if (_334)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_346)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _406 = _400;
    bool _408 = _83 == 448;
    float _410 = _406;
    if (_346)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_356)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _416 = _410;
    bool _418 = _83 == 464;
    float _420 = _416;
    if (_356)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_368)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _426 = _420;
    bool _428 = _83 == 480;
    float _430 = _426;
    if (_368)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_378)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _436 = _430;
    bool _438 = _83 == 496;
    float _440 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _442 = _434;
    float _444 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _446 = _440;
    bool _448 = _83 == 512;
    float _450 = _446;
    if (_384)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _452 = _444;
    bool _454 = _83 == 528;
    float _456 = _452;
    if (_398)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _458 = _450;
    float _460 = _458;
    if (_398)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _462 = _456;
    float _464 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _466 = _460;
    bool _468 = _83 == 544;
    float _470 = _466;
    if (_408)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _472 = _464;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _476 = _470;
    bool _478 = _83 == 560;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _486 = _480;
    bool _488 = _83 == 576;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _496 = _490;
    bool _498 = _83 == 592;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_448)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _506 = _500;
    bool _508 = _83 == 608;
    float _510 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _512 = _504;
    float _514 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _516 = _510;
    bool _518 = _83 == 624;
    float _520 = _516;
    if (_454)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _522 = _514;
    bool _524 = _83 == 640;
    float _526 = _522;
    if (_468)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _528 = _520;
    float _530 = _528;
    if (_468)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _532 = _526;
    float _534 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _536 = _530;
    bool _538 = _83 == 656;
    float _540 = _536;
    if (_478)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _542 = _534;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _546 = _540;
    bool _548 = _83 == 672;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _556 = _550;
    bool _558 = _83 == 688;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _566 = _560;
    bool _568 = _83 == 704;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_518)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _576 = _570;
    bool _578 = _83 == 720;
    float _580 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _582 = _574;
    float _584 = _582;
    if (_524)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _586 = _580;
    bool _588 = _83 == 736;
    float _590 = _586;
    if (_524)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _592 = _584;
    bool _594 = _83 == 752;
    float _596 = _592;
    if (_538)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _598 = _590;
    float _600 = _598;
    if (_548)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_558)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_568)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_578)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_588)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _618 = _616;
    float _620 = _618;
    if (_594)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _622 = _620;
    float _624 = _366 * _622;
    if (_538)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _626 = _596;
    float _628 = _626;
    if (_548)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _630 = _628;
    float _632 = _624 * _70;
    float _634 = _630;
    if (_558)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_568)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _640 = _638;
    float _642 = floor(_632);
    float _644 = _640;
    if (_578)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_588)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _650 = _648;
    float _652 = _650;
    if (_594)
    {
        _652 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _654 = _652;
    float _656 = -_642;
    float _658 = _632 + _656;
    float _660 = _336 * _654;
    float _662 = _658 * 2.0;
    float _664 = -_658;
    float _666 = fma(_660, _664, _70);
    float _668 = floor(_662);
    float _670 = _660 * _668;
    float _672 = _670 * 0.5;
    float _674 = _672 + _666;
    float _676 = fma(_74, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_81, _81, _688);
    float _692 = fma(_686, _686, _690);
    float _694 = sqrt(_692);
    float _696 = -_320;
    float _698 = fma(_694, _312, _696);
    float _700 = precise::clamp(_698, 0.0, 1.0);
    float _702 = -_672;
    float _704 = fma(_702, _700, _674);
    float _706 = _672;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _710 = _668;
    if (!_109)
    {
        _706 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _712 = _706;
    float _714 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _716 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _718 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _720 = _712;
    if (!_109)
    {
        float _722 = fma(_716, _712, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _287 = _722;
    }
    float _724 = _287;
    float _726 = _724;
    if (!_109)
    {
        float _728 = fma(_718, _712, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _708 = _728;
    }
    float _730 = _708;
    float _732 = _730;
    if (!_109)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _720 = _734;
    }
    float _736 = _720;
    if (!_109)
    {
        float _738 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _732 = _738;
    }
    float _740 = _732;
    if (!_109)
    {
        float2 _2242 = float2(_736, _740);
        float _742 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _726 = _742;
    }
    float _744 = _726;
    float _746 = 0.0;
    if (_109)
    {
        _746 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _746;
    if (_109)
    {
        _113 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _113;
    if (_109)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _710 = _752;
    }
    float _754 = _710;
    float _756 = _754;
    if (_109)
    {
        float _758 = fma(_714, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _115 = _758;
    }
    float _760 = _115;
    float _762 = _760;
    if (_109)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_109)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_109)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    if (_109)
    {
        float _780 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _780;
    }
    float _782 = _774;
    float _784 = _744;
    if (_109)
    {
        float2 _2334 = float2(_778, _782);
        float _786 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2334, float2(0.0), isnan(_2334)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2334, float2(0.0), isnan(_2334)), level(0.0)).x;
        _784 = _786;
    }
    float _788 = _784;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _792 = _714 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _794;
    float _798 = _792 * _792;
    float _800 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _802 = fma(_796, _796, _798);
    float _804 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _806 = sqrt(_802);
    float _808 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    out.m_40.z = _800;
    out.m_40.w = _804;
    float _810 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_42.y = _808;
    out.m_42.x = _810;
    bool _812 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[8].x;
    float _816 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _818 = _810;
    if (!_812)
    {
        _814 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _820 = _814;
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _824 = _788;
    float _826 = _820;
    if (!_812)
    {
        _824 = _714;
    }
    float _828 = _824;
    float _830 = _822 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _828;
    if (!_812)
    {
        _816 = _822;
    }
    float _834 = _816;
    float _836 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_812)
    {
        _818 = _840;
    }
    float _844 = _818;
    bool _846 = !_812;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _806 + _852;
        float _856 = _822 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = rsqrt(_802);
        float _860 = _854 * _850;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _878 = _858 * _874;
        float _880 = fma(_822, _866, _876);
        float _882 = fma(_796, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_792, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _888 = fma(_882, (*spvDescriptorSet0.vp_c4)._m0[2].x, _884);
        float _890 = fma(_886, (*spvDescriptorSet0.vp_c4)._m0[2].z, _888);
        float _892 = _890 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _842 = _880;
        _826 = _882;
        _832 = _886;
        _848 = _892;
    }
    float _894 = _842;
    float _896 = _826;
    float _898 = _832;
    float _900 = _848;
    float _902 = _894 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _822;
    out.m_44.z = _714;
    float _906 = _822 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _908 = _822 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _910 = _822 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _912 = _822 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _914 = _822 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _916 = _822 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _918 = _822 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _920 = _822 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _922 = _822 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _924 = _822 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _926 = _822 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _928 = _822 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _930 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _932 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _934 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[42].x, _906);
    float _936 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[53].x, _928);
    float _938 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _930);
    float _940 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[43].x, _908);
    float _942 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[44].x, _910);
    float _944 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[45].x, _912);
    float _946 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[46].x, _914);
    float _948 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[47].x, _916);
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[48].x, _918);
    float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[49].x, _920);
    float _954 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[50].x, _922);
    float _956 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[51].x, _924);
    float _958 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[52].x, _926);
    float _960 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _932);
    float _962 = _938 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _964 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[42].z, _934);
    float _966 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[43].z, _940);
    float _968 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[44].z, _942);
    float _970 = _960 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _972 = _962 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _976 = _962 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _978 = _962 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _980 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[45].z, _944);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[7].x, _972);
    float _984 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[8].x, _974);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[9].x, _976);
    float _988 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[10].x, _978);
    float _990 = _964 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _992 = _966 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _994 = _968 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _996 = _980 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _998 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _982);
    float _1000 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _984);
    float _1002 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[46].z, _946);
    float _1004 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[47].z, _948);
    float _1006 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[48].z, _950);
    float _1008 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[49].z, _952);
    float _1010 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[50].z, _954);
    float _1012 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[51].z, _956);
    float _1014 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[52].z, _958);
    float _1016 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[53].z, _936);
    float _1018 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _986);
    float _1020 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _988);
    float _1022 = -_840;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1026 = _1022 + _1024;
    float _1028 = _998 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    float _1030 = _1000 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1032 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1034 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    out.m_46.x = _990;
    out.m_46.y = _992;
    out.m_46.z = _994;
    out.m_46.w = _996;
    float _1036 = _1016 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1038 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1040 = _1018 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1042 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1044 = _1020 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_48.w = _840;
    out.m_50.x = _1042;
    out.m_50.y = _1032;
    out.m_50.z = _1034;
    out.m_50.w = _1036;
    float _1046 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1048 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1050 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1052 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_52.w = _1038;
    out.m_54.x = _1046;
    out.m_54.y = _1048;
    out.m_54.z = _1050;
    out.m_54.w = _1052;
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1030;
    out.gl_Position.z = _1040;
    out.gl_Position.w = _1044;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _77 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _79 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _81 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _79;
    int _83 = _77 << 4;
    bool _87 = _83 == 0;
    bool _89 = _83 == 16;
    bool _91 = _83 == 32;
    bool _93 = _83 == 48;
    bool _95 = _83 == 64;
    float _97 = fma(_74, _70, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _99 = _83 == 80;
    bool _101 = _68 >= 0.5;
    bool _103 = isnan(_68);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.5);
    bool _109 = _105 || _107;
    float _111 = as_type<float>(gl_BaseInstance);
    float _113 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _115 = _68;
    if (_87)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _117 = _111;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _121 = _97 + _119;
    float _123 = fma(_70, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _125 = _83 == 96;
    float _127 = _121 * _121;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = _123 + _129;
    float _133 = 0.0;
    float _135 = _117;
    if (_87)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _137 = _133;
    float _139 = fma(_81, _81, _127);
    float _141 = _137;
    if (_89)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _143 = _135;
    bool _145 = _83 == 112;
    float _147 = fma(_131, _131, _139);
    float _149 = _143;
    if (_89)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_91)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _155 = _149;
    float _157 = rsqrt(_147);
    bool _159 = _83 == 128;
    float _161 = _155;
    if (_91)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _163 = _153;
    float _165 = _163;
    if (_93)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _167 = _161;
    bool _169 = _83 == 144;
    float _171 = _167;
    if (_93)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _173 = _165;
    float _175 = _173;
    if (_95)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _177 = _171;
    bool _179 = _83 == 160;
    float _181 = _177;
    if (_95)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _183 = _175;
    float _185 = _157 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _187 = _183;
    if (_99)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _189 = _181;
    bool _191 = _83 == 176;
    float _193 = _189;
    if (_99)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _195 = _187;
    float _197 = log2(_185);
    bool _199 = _83 == 192;
    float _201 = _195;
    if (_125)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _203 = _193;
    float _205 = _203;
    if (_125)
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
    bool _213 = _83 == 208;
    float _215 = _211;
    if (_145)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_159)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _221 = _215;
    bool _223 = _83 == 224;
    float _225 = _197 + 1.2999999523162841796875;
    float _227 = _221;
    if (_159)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _229 = _219;
    float _231 = _229;
    if (_169)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _233 = _227;
    bool _235 = _83 == 240;
    float _237 = trunc(_225);
    int _239 = int(_237);
    float _241 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _243 = _231;
    float _245 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _247 = _241;
    bool _249 = _83 == 256;
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
    bool _259 = _83 == 272;
    float _261 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_199)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _267 = _261;
    int _269 = min(_239, 15);
    bool _271 = _83 == 288;
    float _273 = _267;
    if (_199)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _275 = _265;
    float _277 = float(_269);
    bool _279 = _83 == 304;
    int _281 = _269 << 4;
    int _283 = _281 + 4288;
    float _285 = _275;
    float _287 = as_type<float>(_283);
    if (_213)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _289 = _273;
    float _291 = _289;
    if (_213)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _293 = _285;
    float _295 = -_277;
    float _297 = _295 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _299 = _293;
    if (_223)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _301 = _291;
    int _303 = _283 + 8;
    uint _306 = uint(int(uint(_303) >> uint(2)));
    uint _308 = uint(int(uint(int(_306)) >> uint(2)));
    int _310 = int(_306) & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    int _314 = int(_306) + 1;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    int _318 = _314 & 3;
    float _320 = (*spvDescriptorSet0.vp_c14)._m0[int(_316)][_318];
    bool _322 = _83 == 320;
    float _324 = _297 + 1.0;
    float _326 = _301;
    if (_223)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _328 = _299;
    float _330 = _328;
    if (_235)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _332 = _326;
    bool _334 = _83 == 336;
    float _336 = exp2(_324);
    float _338 = _332;
    if (_235)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _340 = _330;
    float _342 = _340;
    if (_249)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _344 = _338;
    bool _346 = _83 == 352;
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
    bool _356 = _83 == 368;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_271)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _364 = _358;
    float _366 = 1.0 / _336;
    bool _368 = _83 == 384;
    float _370 = _364;
    if (_271)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _372 = _362;
    float _374 = _372;
    if (_279)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _376 = _370;
    bool _378 = _83 == 400;
    float _380 = _376;
    if (_279)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _382 = _374;
    bool _384 = _83 == 416;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _388 = _380;
    float _390 = _388;
    if (_322)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _392 = _386;
    float _394 = _392;
    if (_334)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _396 = _390;
    bool _398 = _83 == 432;
    float _400 = _396;
    if (_334)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_346)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _406 = _400;
    bool _408 = _83 == 448;
    float _410 = _406;
    if (_346)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_356)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _416 = _410;
    bool _418 = _83 == 464;
    float _420 = _416;
    if (_356)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_368)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _426 = _420;
    bool _428 = _83 == 480;
    float _430 = _426;
    if (_368)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_378)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _436 = _430;
    bool _438 = _83 == 496;
    float _440 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _442 = _434;
    float _444 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _446 = _440;
    bool _448 = _83 == 512;
    float _450 = _446;
    if (_384)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _452 = _444;
    bool _454 = _83 == 528;
    float _456 = _452;
    if (_398)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _458 = _450;
    float _460 = _458;
    if (_398)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _462 = _456;
    float _464 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _466 = _460;
    bool _468 = _83 == 544;
    float _470 = _466;
    if (_408)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _472 = _464;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _476 = _470;
    bool _478 = _83 == 560;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _486 = _480;
    bool _488 = _83 == 576;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _496 = _490;
    bool _498 = _83 == 592;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_448)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _506 = _500;
    bool _508 = _83 == 608;
    float _510 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _512 = _504;
    float _514 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _516 = _510;
    bool _518 = _83 == 624;
    float _520 = _516;
    if (_454)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _522 = _514;
    bool _524 = _83 == 640;
    float _526 = _522;
    if (_468)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _528 = _520;
    float _530 = _528;
    if (_468)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _532 = _526;
    float _534 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _536 = _530;
    bool _538 = _83 == 656;
    float _540 = _536;
    if (_478)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _542 = _534;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _546 = _540;
    bool _548 = _83 == 672;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _556 = _550;
    bool _558 = _83 == 688;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _566 = _560;
    bool _568 = _83 == 704;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_518)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _576 = _570;
    bool _578 = _83 == 720;
    float _580 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _582 = _574;
    float _584 = _582;
    if (_524)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _586 = _580;
    bool _588 = _83 == 736;
    float _590 = _586;
    if (_524)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _592 = _584;
    bool _594 = _83 == 752;
    float _596 = _592;
    if (_538)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _598 = _590;
    float _600 = _598;
    if (_548)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_558)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_568)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_578)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_588)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _618 = _616;
    float _620 = _618;
    if (_594)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _622 = _620;
    float _624 = _366 * _622;
    if (_538)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _626 = _596;
    float _628 = _626;
    if (_548)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _630 = _628;
    float _632 = _624 * _70;
    float _634 = _630;
    if (_558)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_568)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _640 = _638;
    float _642 = floor(_632);
    float _644 = _640;
    if (_578)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_588)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _650 = _648;
    float _652 = _650;
    if (_594)
    {
        _652 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _654 = _652;
    float _656 = -_642;
    float _658 = _632 + _656;
    float _660 = _336 * _654;
    float _662 = _658 * 2.0;
    float _664 = -_658;
    float _666 = fma(_660, _664, _70);
    float _668 = floor(_662);
    float _670 = _660 * _668;
    float _672 = _670 * 0.5;
    float _674 = _672 + _666;
    float _676 = fma(_74, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_81, _81, _688);
    float _692 = fma(_686, _686, _690);
    float _694 = sqrt(_692);
    float _696 = -_320;
    float _698 = fma(_694, _312, _696);
    float _700 = precise::clamp(_698, 0.0, 1.0);
    float _702 = -_672;
    float _704 = fma(_702, _700, _674);
    float _706 = _672;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _710 = _668;
    if (!_109)
    {
        _706 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _712 = _706;
    float _714 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _716 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _718 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _720 = _712;
    if (!_109)
    {
        float _722 = fma(_716, _712, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _287 = _722;
    }
    float _724 = _287;
    float _726 = _724;
    if (!_109)
    {
        float _728 = fma(_718, _712, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _708 = _728;
    }
    float _730 = _708;
    float _732 = _730;
    if (!_109)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _720 = _734;
    }
    float _736 = _720;
    if (!_109)
    {
        float _738 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _732 = _738;
    }
    float _740 = _732;
    if (!_109)
    {
        float2 _2242 = float2(_736, _740);
        float _742 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _726 = _742;
    }
    float _744 = _726;
    float _746 = 0.0;
    if (_109)
    {
        _746 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _746;
    if (_109)
    {
        _113 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _113;
    if (_109)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _710 = _752;
    }
    float _754 = _710;
    float _756 = _754;
    if (_109)
    {
        float _758 = fma(_714, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _115 = _758;
    }
    float _760 = _115;
    float _762 = _760;
    if (_109)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_109)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_109)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    if (_109)
    {
        float _780 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _780;
    }
    float _782 = _774;
    float _784 = _744;
    if (_109)
    {
        float2 _2334 = float2(_778, _782);
        float _786 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2334, float2(0.0), isnan(_2334)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2334, float2(0.0), isnan(_2334)), level(0.0)).x;
        _784 = _786;
    }
    float _788 = _784;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _792 = _714 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _794;
    float _798 = _792 * _792;
    float _800 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _802 = fma(_796, _796, _798);
    float _804 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _806 = sqrt(_802);
    float _808 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    out.m_40.z = _800;
    out.m_40.w = _804;
    float _810 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_42.y = _808;
    out.m_42.x = _810;
    bool _812 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[8].x;
    float _816 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _818 = _810;
    if (!_812)
    {
        _814 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _820 = _814;
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _824 = _788;
    float _826 = _820;
    if (!_812)
    {
        _824 = _714;
    }
    float _828 = _824;
    float _830 = _822 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _828;
    if (!_812)
    {
        _816 = _822;
    }
    float _834 = _816;
    float _836 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_812)
    {
        _818 = _840;
    }
    float _844 = _818;
    bool _846 = !_812;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _806 + _852;
        float _856 = _822 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = rsqrt(_802);
        float _860 = _854 * _850;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _878 = _858 * _874;
        float _880 = fma(_822, _866, _876);
        float _882 = fma(_796, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_792, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _888 = fma(_882, (*spvDescriptorSet0.vp_c4)._m0[2].x, _884);
        float _890 = fma(_886, (*spvDescriptorSet0.vp_c4)._m0[2].z, _888);
        float _892 = _890 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _842 = _880;
        _826 = _882;
        _832 = _886;
        _848 = _892;
    }
    float _894 = _842;
    float _896 = _826;
    float _898 = _832;
    float _900 = _848;
    float _902 = _894 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _822;
    out.m_44.z = _714;
    float _906 = _822 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _908 = _822 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _910 = _822 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _912 = _822 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _914 = _822 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _916 = _822 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _918 = _822 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _920 = _822 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _922 = _822 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _924 = _822 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _926 = _822 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _928 = _822 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _930 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _932 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _934 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[42].x, _906);
    float _936 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[53].x, _928);
    float _938 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _930);
    float _940 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[43].x, _908);
    float _942 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[44].x, _910);
    float _944 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[45].x, _912);
    float _946 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[46].x, _914);
    float _948 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[47].x, _916);
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[48].x, _918);
    float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[49].x, _920);
    float _954 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[50].x, _922);
    float _956 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[51].x, _924);
    float _958 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[52].x, _926);
    float _960 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _932);
    float _962 = _938 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _964 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[42].z, _934);
    float _966 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[43].z, _940);
    float _968 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[44].z, _942);
    float _970 = _960 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _972 = _962 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _976 = _962 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _978 = _962 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _980 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[45].z, _944);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[7].x, _972);
    float _984 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[8].x, _974);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[9].x, _976);
    float _988 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[10].x, _978);
    float _990 = _964 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _992 = _966 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _994 = _968 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _996 = _980 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _998 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _982);
    float _1000 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _984);
    float _1002 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[46].z, _946);
    float _1004 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[47].z, _948);
    float _1006 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[48].z, _950);
    float _1008 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[49].z, _952);
    float _1010 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[50].z, _954);
    float _1012 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[51].z, _956);
    float _1014 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[52].z, _958);
    float _1016 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[53].z, _936);
    float _1018 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _986);
    float _1020 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _988);
    float _1022 = -_840;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1026 = _1022 + _1024;
    float _1028 = _998 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    float _1030 = _1000 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1032 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1034 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    out.m_46.x = _990;
    out.m_46.y = _992;
    out.m_46.z = _994;
    out.m_46.w = _996;
    float _1036 = _1016 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1038 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1040 = _1018 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1042 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1044 = _1020 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_48.w = _840;
    out.m_50.x = _1042;
    out.m_50.y = _1032;
    out.m_50.z = _1034;
    out.m_50.w = _1036;
    float _1046 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1048 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1050 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1052 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_52.w = _1038;
    out.m_54.x = _1046;
    out.m_54.y = _1048;
    out.m_54.z = _1050;
    out.m_54.w = _1052;
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1030;
    out.gl_Position.z = _1040;
    out.gl_Position.w = _1044;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _77 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _79 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _81 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _79;
    int _83 = _77 << 4;
    bool _87 = _83 == 0;
    bool _89 = _83 == 16;
    bool _91 = _83 == 32;
    bool _93 = _83 == 48;
    bool _95 = _83 == 64;
    float _97 = fma(_74, _70, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _99 = _83 == 80;
    bool _101 = _68 >= 0.5;
    bool _103 = isnan(_68);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.5);
    bool _109 = _105 || _107;
    float _111 = as_type<float>(gl_BaseInstance);
    float _113 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _115 = _68;
    if (_87)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _117 = _111;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _121 = _97 + _119;
    float _123 = fma(_70, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _125 = _83 == 96;
    float _127 = _121 * _121;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = _123 + _129;
    float _133 = 0.0;
    float _135 = _117;
    if (_87)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _137 = _133;
    float _139 = fma(_81, _81, _127);
    float _141 = _137;
    if (_89)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _143 = _135;
    bool _145 = _83 == 112;
    float _147 = fma(_131, _131, _139);
    float _149 = _143;
    if (_89)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _151 = _141;
    float _153 = _151;
    if (_91)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _155 = _149;
    float _157 = rsqrt(_147);
    bool _159 = _83 == 128;
    float _161 = _155;
    if (_91)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _163 = _153;
    float _165 = _163;
    if (_93)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _167 = _161;
    bool _169 = _83 == 144;
    float _171 = _167;
    if (_93)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _173 = _165;
    float _175 = _173;
    if (_95)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _177 = _171;
    bool _179 = _83 == 160;
    float _181 = _177;
    if (_95)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _183 = _175;
    float _185 = _157 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _187 = _183;
    if (_99)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _189 = _181;
    bool _191 = _83 == 176;
    float _193 = _189;
    if (_99)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _195 = _187;
    float _197 = log2(_185);
    bool _199 = _83 == 192;
    float _201 = _195;
    if (_125)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _203 = _193;
    float _205 = _203;
    if (_125)
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
    bool _213 = _83 == 208;
    float _215 = _211;
    if (_145)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_159)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _221 = _215;
    bool _223 = _83 == 224;
    float _225 = _197 + 1.2999999523162841796875;
    float _227 = _221;
    if (_159)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _229 = _219;
    float _231 = _229;
    if (_169)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _233 = _227;
    bool _235 = _83 == 240;
    float _237 = trunc(_225);
    int _239 = int(_237);
    float _241 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _243 = _231;
    float _245 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _247 = _241;
    bool _249 = _83 == 256;
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
    bool _259 = _83 == 272;
    float _261 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_199)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _267 = _261;
    int _269 = min(_239, 15);
    bool _271 = _83 == 288;
    float _273 = _267;
    if (_199)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _275 = _265;
    float _277 = float(_269);
    bool _279 = _83 == 304;
    int _281 = _269 << 4;
    int _283 = _281 + 4288;
    float _285 = _275;
    float _287 = as_type<float>(_283);
    if (_213)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _289 = _273;
    float _291 = _289;
    if (_213)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _293 = _285;
    float _295 = -_277;
    float _297 = _295 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _299 = _293;
    if (_223)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _301 = _291;
    int _303 = _283 + 8;
    uint _306 = uint(int(uint(_303) >> uint(2)));
    uint _308 = uint(int(uint(int(_306)) >> uint(2)));
    int _310 = int(_306) & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    int _314 = int(_306) + 1;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    int _318 = _314 & 3;
    float _320 = (*spvDescriptorSet0.vp_c14)._m0[int(_316)][_318];
    bool _322 = _83 == 320;
    float _324 = _297 + 1.0;
    float _326 = _301;
    if (_223)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _328 = _299;
    float _330 = _328;
    if (_235)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _332 = _326;
    bool _334 = _83 == 336;
    float _336 = exp2(_324);
    float _338 = _332;
    if (_235)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _340 = _330;
    float _342 = _340;
    if (_249)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _344 = _338;
    bool _346 = _83 == 352;
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
    bool _356 = _83 == 368;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_271)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _364 = _358;
    float _366 = 1.0 / _336;
    bool _368 = _83 == 384;
    float _370 = _364;
    if (_271)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _372 = _362;
    float _374 = _372;
    if (_279)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _376 = _370;
    bool _378 = _83 == 400;
    float _380 = _376;
    if (_279)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _382 = _374;
    bool _384 = _83 == 416;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _388 = _380;
    float _390 = _388;
    if (_322)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _392 = _386;
    float _394 = _392;
    if (_334)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _396 = _390;
    bool _398 = _83 == 432;
    float _400 = _396;
    if (_334)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _402 = _394;
    float _404 = _402;
    if (_346)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _406 = _400;
    bool _408 = _83 == 448;
    float _410 = _406;
    if (_346)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _412 = _404;
    float _414 = _412;
    if (_356)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _416 = _410;
    bool _418 = _83 == 464;
    float _420 = _416;
    if (_356)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _422 = _414;
    float _424 = _422;
    if (_368)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _426 = _420;
    bool _428 = _83 == 480;
    float _430 = _426;
    if (_368)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _432 = _424;
    float _434 = _432;
    if (_378)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _436 = _430;
    bool _438 = _83 == 496;
    float _440 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _442 = _434;
    float _444 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _446 = _440;
    bool _448 = _83 == 512;
    float _450 = _446;
    if (_384)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _452 = _444;
    bool _454 = _83 == 528;
    float _456 = _452;
    if (_398)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _458 = _450;
    float _460 = _458;
    if (_398)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _462 = _456;
    float _464 = _462;
    if (_408)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _466 = _460;
    bool _468 = _83 == 544;
    float _470 = _466;
    if (_408)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _472 = _464;
    float _474 = _472;
    if (_418)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _476 = _470;
    bool _478 = _83 == 560;
    float _480 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _482 = _474;
    float _484 = _482;
    if (_428)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _486 = _480;
    bool _488 = _83 == 576;
    float _490 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _492 = _484;
    float _494 = _492;
    if (_438)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _496 = _490;
    bool _498 = _83 == 592;
    float _500 = _496;
    if (_438)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _502 = _494;
    float _504 = _502;
    if (_448)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _506 = _500;
    bool _508 = _83 == 608;
    float _510 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _512 = _504;
    float _514 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _516 = _510;
    bool _518 = _83 == 624;
    float _520 = _516;
    if (_454)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _522 = _514;
    bool _524 = _83 == 640;
    float _526 = _522;
    if (_468)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _528 = _520;
    float _530 = _528;
    if (_468)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _532 = _526;
    float _534 = _532;
    if (_478)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _536 = _530;
    bool _538 = _83 == 656;
    float _540 = _536;
    if (_478)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _542 = _534;
    float _544 = _542;
    if (_488)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _546 = _540;
    bool _548 = _83 == 672;
    float _550 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _552 = _544;
    float _554 = _552;
    if (_498)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _556 = _550;
    bool _558 = _83 == 688;
    float _560 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _562 = _554;
    float _564 = _562;
    if (_508)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _566 = _560;
    bool _568 = _83 == 704;
    float _570 = _566;
    if (_508)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _572 = _564;
    float _574 = _572;
    if (_518)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _576 = _570;
    bool _578 = _83 == 720;
    float _580 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _582 = _574;
    float _584 = _582;
    if (_524)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _586 = _580;
    bool _588 = _83 == 736;
    float _590 = _586;
    if (_524)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _592 = _584;
    bool _594 = _83 == 752;
    float _596 = _592;
    if (_538)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _598 = _590;
    float _600 = _598;
    if (_548)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_558)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_568)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_578)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_588)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _618 = _616;
    float _620 = _618;
    if (_594)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _622 = _620;
    float _624 = _366 * _622;
    if (_538)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _626 = _596;
    float _628 = _626;
    if (_548)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _630 = _628;
    float _632 = _624 * _70;
    float _634 = _630;
    if (_558)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _636 = _634;
    float _638 = _636;
    if (_568)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _640 = _638;
    float _642 = floor(_632);
    float _644 = _640;
    if (_578)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_588)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _650 = _648;
    float _652 = _650;
    if (_594)
    {
        _652 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _654 = _652;
    float _656 = -_642;
    float _658 = _632 + _656;
    float _660 = _336 * _654;
    float _662 = _658 * 2.0;
    float _664 = -_658;
    float _666 = fma(_660, _664, _70);
    float _668 = floor(_662);
    float _670 = _660 * _668;
    float _672 = _670 * 0.5;
    float _674 = _672 + _666;
    float _676 = fma(_74, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_81, _81, _688);
    float _692 = fma(_686, _686, _690);
    float _694 = sqrt(_692);
    float _696 = -_320;
    float _698 = fma(_694, _312, _696);
    float _700 = precise::clamp(_698, 0.0, 1.0);
    float _702 = -_672;
    float _704 = fma(_702, _700, _674);
    float _706 = _672;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    float _710 = _668;
    if (!_109)
    {
        _706 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _712 = _706;
    float _714 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _716 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _718 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _720 = _712;
    if (!_109)
    {
        float _722 = fma(_716, _712, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _287 = _722;
    }
    float _724 = _287;
    float _726 = _724;
    if (!_109)
    {
        float _728 = fma(_718, _712, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _708 = _728;
    }
    float _730 = _708;
    float _732 = _730;
    if (!_109)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _720 = _734;
    }
    float _736 = _720;
    if (!_109)
    {
        float _738 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _732 = _738;
    }
    float _740 = _732;
    if (!_109)
    {
        float2 _2242 = float2(_736, _740);
        float _742 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _726 = _742;
    }
    float _744 = _726;
    float _746 = 0.0;
    if (_109)
    {
        _746 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _746;
    if (_109)
    {
        _113 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _113;
    if (_109)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _710 = _752;
    }
    float _754 = _710;
    float _756 = _754;
    if (_109)
    {
        float _758 = fma(_714, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _115 = _758;
    }
    float _760 = _115;
    float _762 = _760;
    if (_109)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_109)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_109)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    if (_109)
    {
        float _780 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _780;
    }
    float _782 = _774;
    float _784 = _744;
    if (_109)
    {
        float2 _2334 = float2(_778, _782);
        float _786 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2334, float2(0.0), isnan(_2334)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2334, float2(0.0), isnan(_2334)), level(0.0)).x;
        _784 = _786;
    }
    float _788 = _784;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _792 = _714 + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _794;
    float _798 = _792 * _792;
    float _800 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _802 = fma(_796, _796, _798);
    float _804 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _806 = sqrt(_802);
    float _808 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    out.m_40.z = _800;
    out.m_40.w = _804;
    float _810 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_42.y = _808;
    out.m_42.x = _810;
    bool _812 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[8].x;
    float _816 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _818 = _810;
    if (!_812)
    {
        _814 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _820 = _814;
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _824 = _788;
    float _826 = _820;
    if (!_812)
    {
        _824 = _714;
    }
    float _828 = _824;
    float _830 = _822 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _828;
    if (!_812)
    {
        _816 = _822;
    }
    float _834 = _816;
    float _836 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_812)
    {
        _818 = _840;
    }
    float _844 = _818;
    bool _846 = !_812;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _806 + _852;
        float _856 = _822 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = rsqrt(_802);
        float _860 = _854 * _850;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _878 = _858 * _874;
        float _880 = fma(_822, _866, _876);
        float _882 = fma(_796, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_792, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _888 = fma(_882, (*spvDescriptorSet0.vp_c4)._m0[2].x, _884);
        float _890 = fma(_886, (*spvDescriptorSet0.vp_c4)._m0[2].z, _888);
        float _892 = _890 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _842 = _880;
        _826 = _882;
        _832 = _886;
        _848 = _892;
    }
    float _894 = _842;
    float _896 = _826;
    float _898 = _832;
    float _900 = _848;
    float _902 = _894 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _822;
    out.m_44.z = _714;
    float _906 = _822 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _908 = _822 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _910 = _822 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _912 = _822 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _914 = _822 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _916 = _822 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _918 = _822 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _920 = _822 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _922 = _822 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _924 = _822 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _926 = _822 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _928 = _822 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _930 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _932 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _934 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[42].x, _906);
    float _936 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[53].x, _928);
    float _938 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _930);
    float _940 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[43].x, _908);
    float _942 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[44].x, _910);
    float _944 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[45].x, _912);
    float _946 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[46].x, _914);
    float _948 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[47].x, _916);
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[48].x, _918);
    float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[49].x, _920);
    float _954 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[50].x, _922);
    float _956 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[51].x, _924);
    float _958 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[52].x, _926);
    float _960 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _932);
    float _962 = _938 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _964 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[42].z, _934);
    float _966 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[43].z, _940);
    float _968 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[44].z, _942);
    float _970 = _960 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _972 = _962 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _976 = _962 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _978 = _962 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _980 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[45].z, _944);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[7].x, _972);
    float _984 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[8].x, _974);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[9].x, _976);
    float _988 = fma(_970, (*spvDescriptorSet0.vp_c4)._m0[10].x, _978);
    float _990 = _964 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _992 = _966 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _994 = _968 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _996 = _980 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _998 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _982);
    float _1000 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _984);
    float _1002 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[46].z, _946);
    float _1004 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[47].z, _948);
    float _1006 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[48].z, _950);
    float _1008 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[49].z, _952);
    float _1010 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[50].z, _954);
    float _1012 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[51].z, _956);
    float _1014 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[52].z, _958);
    float _1016 = fma(_714, (*spvDescriptorSet0.vp_c4)._m0[53].z, _936);
    float _1018 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _986);
    float _1020 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _988);
    float _1022 = -_840;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1026 = _1022 + _1024;
    float _1028 = _998 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    float _1030 = _1000 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1032 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1034 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    out.m_46.x = _990;
    out.m_46.y = _992;
    out.m_46.z = _994;
    out.m_46.w = _996;
    float _1036 = _1016 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1038 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1040 = _1018 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1042 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1044 = _1020 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_48.w = _840;
    out.m_50.x = _1042;
    out.m_50.y = _1032;
    out.m_50.z = _1034;
    out.m_50.w = _1036;
    float _1046 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1048 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1050 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1052 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_52.w = _1038;
    out.m_54.x = _1046;
    out.m_54.y = _1048;
    out.m_54.z = _1050;
    out.m_54.w = _1052;
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1030;
    out.gl_Position.z = _1040;
    out.gl_Position.w = _1044;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

