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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _113 = _81;
    if (_87)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _115 = _111;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _119 = _97 + _117;
    float _121 = fma(_70, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _123 = _83 == 96;
    float _125 = _119 * _119;
    float _127 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _129 = _121 + _127;
    float _131 = 0.0;
    float _133 = _115;
    if (_87)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _135 = _131;
    float _137 = fma(_81, _81, _125);
    float _139 = _135;
    if (_89)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _141 = _133;
    bool _143 = _83 == 112;
    float _145 = fma(_129, _129, _137);
    float _147 = _141;
    if (_89)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _149 = _139;
    float _151 = _149;
    if (_91)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _153 = _147;
    float _155 = rsqrt(_145);
    bool _157 = _83 == 128;
    float _159 = _153;
    if (_91)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _161 = _151;
    float _163 = _161;
    if (_93)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _165 = _159;
    bool _167 = _83 == 144;
    float _169 = _165;
    if (_93)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_95)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _175 = _169;
    bool _177 = _83 == 160;
    float _179 = _175;
    if (_95)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _181 = _173;
    float _183 = _155 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _185 = _181;
    if (_99)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _187 = _179;
    bool _189 = _83 == 176;
    float _191 = _187;
    if (_99)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _193 = _185;
    float _195 = log2(_183);
    bool _197 = _83 == 192;
    float _199 = _193;
    if (_123)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _201 = _191;
    float _203 = _201;
    if (_123)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _205 = _199;
    float _207 = _205;
    if (_143)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _209 = _203;
    bool _211 = _83 == 208;
    float _213 = _209;
    if (_143)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _219 = _213;
    bool _221 = _83 == 224;
    float _223 = _195 + 1.2999999523162841796875;
    float _225 = _219;
    if (_157)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _227 = _217;
    float _229 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _231 = _225;
    bool _233 = _83 == 240;
    float _235 = trunc(_223);
    int _237 = int(_235);
    float _239 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _241 = _229;
    float _243 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _245 = _239;
    bool _247 = _83 == 256;
    float _249 = _245;
    if (_177)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_189)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _255 = _249;
    bool _257 = _83 == 272;
    float _259 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_197)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _265 = _259;
    int _267 = min(_237, 15);
    bool _269 = _83 == 288;
    float _271 = _265;
    if (_197)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _273 = _263;
    float _275 = float(_267);
    bool _277 = _83 == 304;
    int _279 = _267 << 4;
    int _281 = _279 + 4288;
    float _283 = _273;
    float _285 = as_type<float>(_281);
    if (_211)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _287 = _271;
    float _289 = _287;
    if (_211)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _291 = _283;
    float _293 = -_275;
    float _295 = _293 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _297 = _291;
    if (_221)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _299 = _289;
    int _301 = _281 + 8;
    uint _304 = uint(int(uint(_301) >> uint(2)));
    uint _306 = uint(int(uint(int(_304)) >> uint(2)));
    int _308 = int(_304) & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    int _312 = int(_304) + 1;
    uint _314 = uint(int(uint(_312) >> uint(2)));
    int _316 = _312 & 3;
    float _318 = (*spvDescriptorSet0.vp_c14)._m0[int(_314)][_316];
    bool _320 = _83 == 320;
    float _322 = _295 + 1.0;
    float _324 = _299;
    if (_221)
    {
        _297 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _326 = _297;
    float _328 = _326;
    if (_233)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _330 = _324;
    bool _332 = _83 == 336;
    float _334 = exp2(_322);
    float _336 = _330;
    if (_233)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _338 = _328;
    float _340 = _338;
    if (_247)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _342 = _336;
    bool _344 = _83 == 352;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _352 = _346;
    bool _354 = _83 == 368;
    float _356 = _352;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _358 = _350;
    float _360 = _358;
    if (_269)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _362 = _356;
    float _364 = 1.0 / _334;
    bool _366 = _83 == 384;
    float _368 = _362;
    if (_269)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _370 = _360;
    float _372 = _370;
    if (_277)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _374 = _368;
    bool _376 = _83 == 400;
    float _378 = _374;
    if (_277)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _380 = _372;
    bool _382 = _83 == 416;
    float _384 = _380;
    if (_320)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _386 = _378;
    float _388 = _386;
    if (_320)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _390 = _384;
    float _392 = _390;
    if (_332)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _394 = _388;
    bool _396 = _83 == 432;
    float _398 = _394;
    if (_332)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _400 = _392;
    float _402 = _400;
    if (_344)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _404 = _398;
    bool _406 = _83 == 448;
    float _408 = _404;
    if (_344)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_354)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _414 = _408;
    bool _416 = _83 == 464;
    float _418 = _414;
    if (_354)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_366)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _424 = _418;
    bool _426 = _83 == 480;
    float _428 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_376)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _434 = _428;
    bool _436 = _83 == 496;
    float _438 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _440 = _432;
    float _442 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _444 = _438;
    bool _446 = _83 == 512;
    float _448 = _444;
    if (_382)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _450 = _442;
    bool _452 = _83 == 528;
    float _454 = _450;
    if (_396)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _456 = _448;
    float _458 = _456;
    if (_396)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _460 = _454;
    float _462 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _464 = _458;
    bool _466 = _83 == 544;
    float _468 = _464;
    if (_406)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _470 = _462;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _474 = _468;
    bool _476 = _83 == 560;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _484 = _478;
    bool _486 = _83 == 576;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _494 = _488;
    bool _496 = _83 == 592;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_446)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _504 = _498;
    bool _506 = _83 == 608;
    float _508 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _510 = _502;
    float _512 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _514 = _508;
    bool _516 = _83 == 624;
    float _518 = _514;
    if (_452)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _520 = _512;
    bool _522 = _83 == 640;
    float _524 = _520;
    if (_466)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _526 = _518;
    float _528 = _526;
    if (_466)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _530 = _524;
    float _532 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _534 = _528;
    bool _536 = _83 == 656;
    float _538 = _534;
    if (_476)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _540 = _532;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _544 = _538;
    bool _546 = _83 == 672;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _554 = _548;
    bool _556 = _83 == 688;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _564 = _558;
    bool _566 = _83 == 704;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_516)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _574 = _568;
    bool _576 = _83 == 720;
    float _578 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _580 = _572;
    float _582 = _580;
    if (_522)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _584 = _578;
    bool _586 = _83 == 736;
    float _588 = _584;
    if (_522)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _590 = _582;
    bool _592 = _83 == 752;
    float _594 = _590;
    if (_536)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _596 = _588;
    float _598 = _596;
    if (_546)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_556)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_566)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_576)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_586)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_592)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _620 = _618;
    float _622 = _364 * _620;
    if (_536)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _624 = _594;
    float _626 = _624;
    if (_546)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _628 = _626;
    float _630 = _622 * _70;
    float _632 = _628;
    if (_556)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _634 = _632;
    float _636 = _634;
    if (_566)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _638 = _636;
    float _640 = floor(_630);
    float _642 = _638;
    if (_576)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_586)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _648 = _646;
    float _650 = _648;
    if (_592)
    {
        _650 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _652 = _650;
    float _654 = -_640;
    float _656 = _630 + _654;
    float _658 = _334 * _652;
    float _660 = _656 * 2.0;
    float _662 = -_656;
    float _664 = fma(_658, _662, _70);
    float _666 = floor(_660);
    float _668 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _670 = _658 * _666;
    float _672 = _670 * 0.5;
    float _674 = _672 + _664;
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
    float _696 = -_318;
    float _698 = fma(_694, _310, _696);
    float _700 = precise::clamp(_698, 0.0, 1.0);
    float _702 = -_672;
    float _704 = fma(_702, _700, _674);
    float _706 = _674;
    float _708 = _692;
    float _710 = _666;
    float _712 = _672;
    if (!_109)
    {
        _706 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _714 = _706;
    float _716 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _718 = _714;
    float _720 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_109)
    {
        float _722 = fma(_668, _714, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _113 = _722;
    }
    float _724 = _113;
    float _726 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _728 = _724;
    if (!_109)
    {
        float _730 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _728 = _730;
    }
    float _732 = _728;
    if (!_109)
    {
        float _734 = fma(_726, _714, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _708 = _734;
    }
    float _736 = _708;
    float _738 = _736;
    if (!_109)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
        _285 = _740;
    }
    float _742 = _285;
    if (!_109)
    {
        float2 _2242 = float2(_732, _742);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _738 = _744;
    }
    float _746 = _738;
    if (_109)
    {
        _710 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _710;
    float _750 = 0.0;
    if (_109)
    {
        _750 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _752 = _750;
    float _754 = _752;
    if (_109)
    {
        float _756 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _718 = _756;
    }
    float _758 = _718;
    float _760 = _758;
    if (_109)
    {
        float _762 = fma(_716, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _712 = _762;
    }
    float _764 = _712;
    float _766 = _764;
    if (_109)
    {
        float _768 = fma(_758, _752, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_109)
    {
        float _774 = fma(_764, _752, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _766 = _774;
    }
    float _776 = _766;
    float _778 = _776;
    if (_109)
    {
        float _780 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _772 = _780;
    }
    float _782 = _772;
    float _784 = _782;
    if (_109)
    {
        float _786 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
        _778 = _786;
    }
    float _788 = _778;
    float _790 = _746;
    if (_109)
    {
        float2 _2336 = float2(_782, _788);
        float _792 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2336, float2(0.0), isnan(_2336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2336, float2(0.0), isnan(_2336)), level(0.0)).x;
        _790 = _792;
    }
    float _794 = _790;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _798 = _716 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _800;
    float _804 = _798 * _798;
    float _806 = fma(_802, _802, _804);
    float _808 = sqrt(_806);
    float _810 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _812 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _814 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _816 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _818 = _808 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _820 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_818)
    {
        _754 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _822 = _754;
    float _824 = _822;
    if (!_818)
    {
        _784 = _716;
    }
    float _826 = _784;
    float _828 = fma(_794, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _830 = _828 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _826;
    if (!_818)
    {
        _720 = _828;
    }
    float _834 = _720;
    float _836 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_818)
    {
        _820 = _840;
    }
    float _844 = _820;
    bool _846 = !_818;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _808 + _852;
        float _856 = _828 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = _854 * _850;
        float _860 = rsqrt(_806);
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
        float _882 = fma(_802, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_798, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
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
    out.m_40.z = _814;
    out.m_40.w = _816;
    float _906 = _828 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _908 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    out.m_42.x = _810;
    out.m_42.y = _812;
    float _912 = _828 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _914 = _828 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _916 = _828 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _918 = _828 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _920 = _828 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _922 = _828 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _924 = _828 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _926 = _828 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _928 = _828 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _930 = _828 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _932 = _828 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _828;
    out.m_44.z = _716;
    float _934 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[42].x, _912);
    float _936 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[43].x, _906);
    float _938 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[44].x, _914);
    float _940 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[45].x, _916);
    float _942 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[46].x, _918);
    float _944 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[47].x, _920);
    float _946 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[49].x, _930);
    float _948 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[50].x, _924);
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[51].x, _926);
    float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[52].x, _928);
    float _954 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[53].x, _932);
    float _956 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[48].x, _922);
    float _958 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _910);
    float _960 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _908);
    float _962 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[42].z, _934);
    float _964 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[43].z, _936);
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _968 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[44].z, _938);
    float _970 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[45].z, _940);
    float _972 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[48].z, _956);
    float _974 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[49].z, _946);
    float _976 = _960 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _978 = _966 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _980 = _966 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _982 = _966 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _984 = _966 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _986 = _962 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _988 = _964 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _990 = _968 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _992 = _970 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[7].x, _978);
    float _996 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[8].x, _980);
    float _998 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[9].x, _982);
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[10].x, _984);
    out.m_46.x = _986;
    out.m_46.y = _988;
    out.m_46.z = _990;
    out.m_46.w = _992;
    float _1002 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[46].z, _942);
    float _1004 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[47].z, _944);
    float _1006 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[50].z, _948);
    float _1008 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[51].z, _950);
    float _1010 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[52].z, _952);
    float _1012 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[53].z, _954);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _994);
    float _1016 = -_840;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1020 = _1016 + _1018;
    float _1022 = _972 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1024 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1026 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_48.w = _840;
    float _1030 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _996);
    float _1032 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _998);
    float _1034 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1000);
    float _1036 = _974 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _1038 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1040 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1042 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1044 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1046 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1048 = _1030 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1050 = _1032 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1052 = _1034 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_50.x = _1038;
    out.m_50.y = _1040;
    out.m_50.z = _1022;
    out.m_50.w = _1036;
    out.m_52.x = _1024;
    out.m_52.y = _1042;
    out.m_52.z = _1044;
    out.m_52.w = _1026;
    out.m_54.w = _1028;
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _113 = _81;
    if (_87)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _115 = _111;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _119 = _97 + _117;
    float _121 = fma(_70, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _123 = _83 == 96;
    float _125 = _119 * _119;
    float _127 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _129 = _121 + _127;
    float _131 = 0.0;
    float _133 = _115;
    if (_87)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _135 = _131;
    float _137 = fma(_81, _81, _125);
    float _139 = _135;
    if (_89)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _141 = _133;
    bool _143 = _83 == 112;
    float _145 = fma(_129, _129, _137);
    float _147 = _141;
    if (_89)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _149 = _139;
    float _151 = _149;
    if (_91)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _153 = _147;
    float _155 = rsqrt(_145);
    bool _157 = _83 == 128;
    float _159 = _153;
    if (_91)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _161 = _151;
    float _163 = _161;
    if (_93)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _165 = _159;
    bool _167 = _83 == 144;
    float _169 = _165;
    if (_93)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_95)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _175 = _169;
    bool _177 = _83 == 160;
    float _179 = _175;
    if (_95)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _181 = _173;
    float _183 = _155 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _185 = _181;
    if (_99)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _187 = _179;
    bool _189 = _83 == 176;
    float _191 = _187;
    if (_99)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _193 = _185;
    float _195 = log2(_183);
    bool _197 = _83 == 192;
    float _199 = _193;
    if (_123)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _201 = _191;
    float _203 = _201;
    if (_123)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _205 = _199;
    float _207 = _205;
    if (_143)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _209 = _203;
    bool _211 = _83 == 208;
    float _213 = _209;
    if (_143)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _219 = _213;
    bool _221 = _83 == 224;
    float _223 = _195 + 1.2999999523162841796875;
    float _225 = _219;
    if (_157)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _227 = _217;
    float _229 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _231 = _225;
    bool _233 = _83 == 240;
    float _235 = trunc(_223);
    int _237 = int(_235);
    float _239 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _241 = _229;
    float _243 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _245 = _239;
    bool _247 = _83 == 256;
    float _249 = _245;
    if (_177)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_189)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _255 = _249;
    bool _257 = _83 == 272;
    float _259 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_197)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _265 = _259;
    int _267 = min(_237, 15);
    bool _269 = _83 == 288;
    float _271 = _265;
    if (_197)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _273 = _263;
    float _275 = float(_267);
    bool _277 = _83 == 304;
    int _279 = _267 << 4;
    int _281 = _279 + 4288;
    float _283 = _273;
    float _285 = as_type<float>(_281);
    if (_211)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _287 = _271;
    float _289 = _287;
    if (_211)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _291 = _283;
    float _293 = -_275;
    float _295 = _293 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _297 = _291;
    if (_221)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _299 = _289;
    int _301 = _281 + 8;
    uint _304 = uint(int(uint(_301) >> uint(2)));
    uint _306 = uint(int(uint(int(_304)) >> uint(2)));
    int _308 = int(_304) & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    int _312 = int(_304) + 1;
    uint _314 = uint(int(uint(_312) >> uint(2)));
    int _316 = _312 & 3;
    float _318 = (*spvDescriptorSet0.vp_c14)._m0[int(_314)][_316];
    bool _320 = _83 == 320;
    float _322 = _295 + 1.0;
    float _324 = _299;
    if (_221)
    {
        _297 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _326 = _297;
    float _328 = _326;
    if (_233)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _330 = _324;
    bool _332 = _83 == 336;
    float _334 = exp2(_322);
    float _336 = _330;
    if (_233)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _338 = _328;
    float _340 = _338;
    if (_247)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _342 = _336;
    bool _344 = _83 == 352;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _352 = _346;
    bool _354 = _83 == 368;
    float _356 = _352;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _358 = _350;
    float _360 = _358;
    if (_269)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _362 = _356;
    float _364 = 1.0 / _334;
    bool _366 = _83 == 384;
    float _368 = _362;
    if (_269)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _370 = _360;
    float _372 = _370;
    if (_277)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _374 = _368;
    bool _376 = _83 == 400;
    float _378 = _374;
    if (_277)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _380 = _372;
    bool _382 = _83 == 416;
    float _384 = _380;
    if (_320)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _386 = _378;
    float _388 = _386;
    if (_320)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _390 = _384;
    float _392 = _390;
    if (_332)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _394 = _388;
    bool _396 = _83 == 432;
    float _398 = _394;
    if (_332)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _400 = _392;
    float _402 = _400;
    if (_344)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _404 = _398;
    bool _406 = _83 == 448;
    float _408 = _404;
    if (_344)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_354)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _414 = _408;
    bool _416 = _83 == 464;
    float _418 = _414;
    if (_354)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_366)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _424 = _418;
    bool _426 = _83 == 480;
    float _428 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_376)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _434 = _428;
    bool _436 = _83 == 496;
    float _438 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _440 = _432;
    float _442 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _444 = _438;
    bool _446 = _83 == 512;
    float _448 = _444;
    if (_382)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _450 = _442;
    bool _452 = _83 == 528;
    float _454 = _450;
    if (_396)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _456 = _448;
    float _458 = _456;
    if (_396)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _460 = _454;
    float _462 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _464 = _458;
    bool _466 = _83 == 544;
    float _468 = _464;
    if (_406)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _470 = _462;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _474 = _468;
    bool _476 = _83 == 560;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _484 = _478;
    bool _486 = _83 == 576;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _494 = _488;
    bool _496 = _83 == 592;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_446)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _504 = _498;
    bool _506 = _83 == 608;
    float _508 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _510 = _502;
    float _512 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _514 = _508;
    bool _516 = _83 == 624;
    float _518 = _514;
    if (_452)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _520 = _512;
    bool _522 = _83 == 640;
    float _524 = _520;
    if (_466)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _526 = _518;
    float _528 = _526;
    if (_466)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _530 = _524;
    float _532 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _534 = _528;
    bool _536 = _83 == 656;
    float _538 = _534;
    if (_476)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _540 = _532;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _544 = _538;
    bool _546 = _83 == 672;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _554 = _548;
    bool _556 = _83 == 688;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _564 = _558;
    bool _566 = _83 == 704;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_516)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _574 = _568;
    bool _576 = _83 == 720;
    float _578 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _580 = _572;
    float _582 = _580;
    if (_522)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _584 = _578;
    bool _586 = _83 == 736;
    float _588 = _584;
    if (_522)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _590 = _582;
    bool _592 = _83 == 752;
    float _594 = _590;
    if (_536)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _596 = _588;
    float _598 = _596;
    if (_546)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_556)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_566)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_576)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_586)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_592)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _620 = _618;
    float _622 = _364 * _620;
    if (_536)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _624 = _594;
    float _626 = _624;
    if (_546)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _628 = _626;
    float _630 = _622 * _70;
    float _632 = _628;
    if (_556)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _634 = _632;
    float _636 = _634;
    if (_566)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _638 = _636;
    float _640 = floor(_630);
    float _642 = _638;
    if (_576)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_586)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _648 = _646;
    float _650 = _648;
    if (_592)
    {
        _650 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _652 = _650;
    float _654 = -_640;
    float _656 = _630 + _654;
    float _658 = _334 * _652;
    float _660 = _656 * 2.0;
    float _662 = -_656;
    float _664 = fma(_658, _662, _70);
    float _666 = floor(_660);
    float _668 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _670 = _658 * _666;
    float _672 = _670 * 0.5;
    float _674 = _672 + _664;
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
    float _696 = -_318;
    float _698 = fma(_694, _310, _696);
    float _700 = precise::clamp(_698, 0.0, 1.0);
    float _702 = -_672;
    float _704 = fma(_702, _700, _674);
    float _706 = _674;
    float _708 = _692;
    float _710 = _666;
    float _712 = _672;
    if (!_109)
    {
        _706 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _714 = _706;
    float _716 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _718 = _714;
    float _720 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_109)
    {
        float _722 = fma(_668, _714, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _113 = _722;
    }
    float _724 = _113;
    float _726 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _728 = _724;
    if (!_109)
    {
        float _730 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _728 = _730;
    }
    float _732 = _728;
    if (!_109)
    {
        float _734 = fma(_726, _714, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _708 = _734;
    }
    float _736 = _708;
    float _738 = _736;
    if (!_109)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
        _285 = _740;
    }
    float _742 = _285;
    if (!_109)
    {
        float2 _2242 = float2(_732, _742);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _738 = _744;
    }
    float _746 = _738;
    if (_109)
    {
        _710 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _710;
    float _750 = 0.0;
    if (_109)
    {
        _750 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _752 = _750;
    float _754 = _752;
    if (_109)
    {
        float _756 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _718 = _756;
    }
    float _758 = _718;
    float _760 = _758;
    if (_109)
    {
        float _762 = fma(_716, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _712 = _762;
    }
    float _764 = _712;
    float _766 = _764;
    if (_109)
    {
        float _768 = fma(_758, _752, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_109)
    {
        float _774 = fma(_764, _752, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _766 = _774;
    }
    float _776 = _766;
    float _778 = _776;
    if (_109)
    {
        float _780 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _772 = _780;
    }
    float _782 = _772;
    float _784 = _782;
    if (_109)
    {
        float _786 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
        _778 = _786;
    }
    float _788 = _778;
    float _790 = _746;
    if (_109)
    {
        float2 _2336 = float2(_782, _788);
        float _792 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2336, float2(0.0), isnan(_2336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2336, float2(0.0), isnan(_2336)), level(0.0)).x;
        _790 = _792;
    }
    float _794 = _790;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _798 = _716 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _800;
    float _804 = _798 * _798;
    float _806 = fma(_802, _802, _804);
    float _808 = sqrt(_806);
    float _810 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _812 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _814 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _816 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _818 = _808 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _820 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_818)
    {
        _754 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _822 = _754;
    float _824 = _822;
    if (!_818)
    {
        _784 = _716;
    }
    float _826 = _784;
    float _828 = fma(_794, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _830 = _828 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _826;
    if (!_818)
    {
        _720 = _828;
    }
    float _834 = _720;
    float _836 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_818)
    {
        _820 = _840;
    }
    float _844 = _820;
    bool _846 = !_818;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _808 + _852;
        float _856 = _828 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = _854 * _850;
        float _860 = rsqrt(_806);
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
        float _882 = fma(_802, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_798, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
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
    out.m_40.z = _814;
    out.m_40.w = _816;
    float _906 = _828 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _908 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    out.m_42.x = _810;
    out.m_42.y = _812;
    float _912 = _828 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _914 = _828 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _916 = _828 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _918 = _828 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _920 = _828 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _922 = _828 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _924 = _828 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _926 = _828 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _928 = _828 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _930 = _828 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _932 = _828 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _828;
    out.m_44.z = _716;
    float _934 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[42].x, _912);
    float _936 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[43].x, _906);
    float _938 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[44].x, _914);
    float _940 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[45].x, _916);
    float _942 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[46].x, _918);
    float _944 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[47].x, _920);
    float _946 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[49].x, _930);
    float _948 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[50].x, _924);
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[51].x, _926);
    float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[52].x, _928);
    float _954 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[53].x, _932);
    float _956 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[48].x, _922);
    float _958 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _910);
    float _960 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _908);
    float _962 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[42].z, _934);
    float _964 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[43].z, _936);
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _968 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[44].z, _938);
    float _970 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[45].z, _940);
    float _972 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[48].z, _956);
    float _974 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[49].z, _946);
    float _976 = _960 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _978 = _966 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _980 = _966 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _982 = _966 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _984 = _966 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _986 = _962 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _988 = _964 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _990 = _968 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _992 = _970 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[7].x, _978);
    float _996 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[8].x, _980);
    float _998 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[9].x, _982);
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[10].x, _984);
    out.m_46.x = _986;
    out.m_46.y = _988;
    out.m_46.z = _990;
    out.m_46.w = _992;
    float _1002 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[46].z, _942);
    float _1004 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[47].z, _944);
    float _1006 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[50].z, _948);
    float _1008 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[51].z, _950);
    float _1010 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[52].z, _952);
    float _1012 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[53].z, _954);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _994);
    float _1016 = -_840;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1020 = _1016 + _1018;
    float _1022 = _972 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1024 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1026 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_48.w = _840;
    float _1030 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _996);
    float _1032 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _998);
    float _1034 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1000);
    float _1036 = _974 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _1038 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1040 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1042 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1044 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1046 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1048 = _1030 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1050 = _1032 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1052 = _1034 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_50.x = _1038;
    out.m_50.y = _1040;
    out.m_50.z = _1022;
    out.m_50.w = _1036;
    out.m_52.x = _1024;
    out.m_52.y = _1042;
    out.m_52.z = _1044;
    out.m_52.w = _1026;
    out.m_54.w = _1028;
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _113 = _81;
    if (_87)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _115 = _111;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _119 = _97 + _117;
    float _121 = fma(_70, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _123 = _83 == 96;
    float _125 = _119 * _119;
    float _127 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _129 = _121 + _127;
    float _131 = 0.0;
    float _133 = _115;
    if (_87)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _135 = _131;
    float _137 = fma(_81, _81, _125);
    float _139 = _135;
    if (_89)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _141 = _133;
    bool _143 = _83 == 112;
    float _145 = fma(_129, _129, _137);
    float _147 = _141;
    if (_89)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _149 = _139;
    float _151 = _149;
    if (_91)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _153 = _147;
    float _155 = rsqrt(_145);
    bool _157 = _83 == 128;
    float _159 = _153;
    if (_91)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _161 = _151;
    float _163 = _161;
    if (_93)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _165 = _159;
    bool _167 = _83 == 144;
    float _169 = _165;
    if (_93)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_95)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _175 = _169;
    bool _177 = _83 == 160;
    float _179 = _175;
    if (_95)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _181 = _173;
    float _183 = _155 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _185 = _181;
    if (_99)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _187 = _179;
    bool _189 = _83 == 176;
    float _191 = _187;
    if (_99)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _193 = _185;
    float _195 = log2(_183);
    bool _197 = _83 == 192;
    float _199 = _193;
    if (_123)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _201 = _191;
    float _203 = _201;
    if (_123)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _205 = _199;
    float _207 = _205;
    if (_143)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _209 = _203;
    bool _211 = _83 == 208;
    float _213 = _209;
    if (_143)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _219 = _213;
    bool _221 = _83 == 224;
    float _223 = _195 + 1.2999999523162841796875;
    float _225 = _219;
    if (_157)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _227 = _217;
    float _229 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _231 = _225;
    bool _233 = _83 == 240;
    float _235 = trunc(_223);
    int _237 = int(_235);
    float _239 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _241 = _229;
    float _243 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _245 = _239;
    bool _247 = _83 == 256;
    float _249 = _245;
    if (_177)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_189)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _255 = _249;
    bool _257 = _83 == 272;
    float _259 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_197)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _265 = _259;
    int _267 = min(_237, 15);
    bool _269 = _83 == 288;
    float _271 = _265;
    if (_197)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _273 = _263;
    float _275 = float(_267);
    bool _277 = _83 == 304;
    int _279 = _267 << 4;
    int _281 = _279 + 4288;
    float _283 = _273;
    float _285 = as_type<float>(_281);
    if (_211)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _287 = _271;
    float _289 = _287;
    if (_211)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _291 = _283;
    float _293 = -_275;
    float _295 = _293 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _297 = _291;
    if (_221)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _299 = _289;
    int _301 = _281 + 8;
    uint _304 = uint(int(uint(_301) >> uint(2)));
    uint _306 = uint(int(uint(int(_304)) >> uint(2)));
    int _308 = int(_304) & 3;
    float _310 = (*spvDescriptorSet0.vp_c14)._m0[int(_306)][_308];
    int _312 = int(_304) + 1;
    uint _314 = uint(int(uint(_312) >> uint(2)));
    int _316 = _312 & 3;
    float _318 = (*spvDescriptorSet0.vp_c14)._m0[int(_314)][_316];
    bool _320 = _83 == 320;
    float _322 = _295 + 1.0;
    float _324 = _299;
    if (_221)
    {
        _297 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _326 = _297;
    float _328 = _326;
    if (_233)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _330 = _324;
    bool _332 = _83 == 336;
    float _334 = exp2(_322);
    float _336 = _330;
    if (_233)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _338 = _328;
    float _340 = _338;
    if (_247)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _342 = _336;
    bool _344 = _83 == 352;
    float _346 = _342;
    if (_247)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _348 = _340;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _352 = _346;
    bool _354 = _83 == 368;
    float _356 = _352;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _358 = _350;
    float _360 = _358;
    if (_269)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _362 = _356;
    float _364 = 1.0 / _334;
    bool _366 = _83 == 384;
    float _368 = _362;
    if (_269)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _370 = _360;
    float _372 = _370;
    if (_277)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _374 = _368;
    bool _376 = _83 == 400;
    float _378 = _374;
    if (_277)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _380 = _372;
    bool _382 = _83 == 416;
    float _384 = _380;
    if (_320)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _386 = _378;
    float _388 = _386;
    if (_320)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _390 = _384;
    float _392 = _390;
    if (_332)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _394 = _388;
    bool _396 = _83 == 432;
    float _398 = _394;
    if (_332)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _400 = _392;
    float _402 = _400;
    if (_344)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _404 = _398;
    bool _406 = _83 == 448;
    float _408 = _404;
    if (_344)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_354)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _414 = _408;
    bool _416 = _83 == 464;
    float _418 = _414;
    if (_354)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_366)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _424 = _418;
    bool _426 = _83 == 480;
    float _428 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_376)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _434 = _428;
    bool _436 = _83 == 496;
    float _438 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _440 = _432;
    float _442 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _444 = _438;
    bool _446 = _83 == 512;
    float _448 = _444;
    if (_382)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _450 = _442;
    bool _452 = _83 == 528;
    float _454 = _450;
    if (_396)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _456 = _448;
    float _458 = _456;
    if (_396)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _460 = _454;
    float _462 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _464 = _458;
    bool _466 = _83 == 544;
    float _468 = _464;
    if (_406)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _470 = _462;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _474 = _468;
    bool _476 = _83 == 560;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _484 = _478;
    bool _486 = _83 == 576;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _494 = _488;
    bool _496 = _83 == 592;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_446)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _504 = _498;
    bool _506 = _83 == 608;
    float _508 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _510 = _502;
    float _512 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _514 = _508;
    bool _516 = _83 == 624;
    float _518 = _514;
    if (_452)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _520 = _512;
    bool _522 = _83 == 640;
    float _524 = _520;
    if (_466)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _526 = _518;
    float _528 = _526;
    if (_466)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _530 = _524;
    float _532 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _534 = _528;
    bool _536 = _83 == 656;
    float _538 = _534;
    if (_476)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _540 = _532;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _544 = _538;
    bool _546 = _83 == 672;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _554 = _548;
    bool _556 = _83 == 688;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _564 = _558;
    bool _566 = _83 == 704;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_516)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _574 = _568;
    bool _576 = _83 == 720;
    float _578 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _580 = _572;
    float _582 = _580;
    if (_522)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _584 = _578;
    bool _586 = _83 == 736;
    float _588 = _584;
    if (_522)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _590 = _582;
    bool _592 = _83 == 752;
    float _594 = _590;
    if (_536)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _596 = _588;
    float _598 = _596;
    if (_546)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_556)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_566)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_576)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_586)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_592)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _620 = _618;
    float _622 = _364 * _620;
    if (_536)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _624 = _594;
    float _626 = _624;
    if (_546)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _628 = _626;
    float _630 = _622 * _70;
    float _632 = _628;
    if (_556)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _634 = _632;
    float _636 = _634;
    if (_566)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _638 = _636;
    float _640 = floor(_630);
    float _642 = _638;
    if (_576)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_586)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _648 = _646;
    float _650 = _648;
    if (_592)
    {
        _650 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _652 = _650;
    float _654 = -_640;
    float _656 = _630 + _654;
    float _658 = _334 * _652;
    float _660 = _656 * 2.0;
    float _662 = -_656;
    float _664 = fma(_658, _662, _70);
    float _666 = floor(_660);
    float _668 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _670 = _658 * _666;
    float _672 = _670 * 0.5;
    float _674 = _672 + _664;
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
    float _696 = -_318;
    float _698 = fma(_694, _310, _696);
    float _700 = precise::clamp(_698, 0.0, 1.0);
    float _702 = -_672;
    float _704 = fma(_702, _700, _674);
    float _706 = _674;
    float _708 = _692;
    float _710 = _666;
    float _712 = _672;
    if (!_109)
    {
        _706 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _714 = _706;
    float _716 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _718 = _714;
    float _720 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_109)
    {
        float _722 = fma(_668, _714, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _113 = _722;
    }
    float _724 = _113;
    float _726 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _728 = _724;
    if (!_109)
    {
        float _730 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _724);
        _728 = _730;
    }
    float _732 = _728;
    if (!_109)
    {
        float _734 = fma(_726, _714, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _708 = _734;
    }
    float _736 = _708;
    float _738 = _736;
    if (!_109)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
        _285 = _740;
    }
    float _742 = _285;
    if (!_109)
    {
        float2 _2242 = float2(_732, _742);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _738 = _744;
    }
    float _746 = _738;
    if (_109)
    {
        _710 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _710;
    float _750 = 0.0;
    if (_109)
    {
        _750 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _752 = _750;
    float _754 = _752;
    if (_109)
    {
        float _756 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _718 = _756;
    }
    float _758 = _718;
    float _760 = _758;
    if (_109)
    {
        float _762 = fma(_716, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _712 = _762;
    }
    float _764 = _712;
    float _766 = _764;
    if (_109)
    {
        float _768 = fma(_758, _752, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_109)
    {
        float _774 = fma(_764, _752, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _766 = _774;
    }
    float _776 = _766;
    float _778 = _776;
    if (_109)
    {
        float _780 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _772 = _780;
    }
    float _782 = _772;
    float _784 = _782;
    if (_109)
    {
        float _786 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
        _778 = _786;
    }
    float _788 = _778;
    float _790 = _746;
    if (_109)
    {
        float2 _2336 = float2(_782, _788);
        float _792 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2336, float2(0.0), isnan(_2336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2336, float2(0.0), isnan(_2336)), level(0.0)).x;
        _790 = _792;
    }
    float _794 = _790;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _798 = _716 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _800;
    float _804 = _798 * _798;
    float _806 = fma(_802, _802, _804);
    float _808 = sqrt(_806);
    float _810 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _812 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _814 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _816 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _818 = _808 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _820 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_818)
    {
        _754 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _822 = _754;
    float _824 = _822;
    if (!_818)
    {
        _784 = _716;
    }
    float _826 = _784;
    float _828 = fma(_794, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _830 = _828 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _826;
    if (!_818)
    {
        _720 = _828;
    }
    float _834 = _720;
    float _836 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_818)
    {
        _820 = _840;
    }
    float _844 = _820;
    bool _846 = !_818;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _808 + _852;
        float _856 = _828 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = _854 * _850;
        float _860 = rsqrt(_806);
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
        float _882 = fma(_802, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_798, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
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
    out.m_40.z = _814;
    out.m_40.w = _816;
    float _906 = _828 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _908 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    out.m_42.x = _810;
    out.m_42.y = _812;
    float _912 = _828 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _914 = _828 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _916 = _828 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _918 = _828 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _920 = _828 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _922 = _828 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _924 = _828 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _926 = _828 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _928 = _828 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _930 = _828 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _932 = _828 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _828;
    out.m_44.z = _716;
    float _934 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[42].x, _912);
    float _936 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[43].x, _906);
    float _938 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[44].x, _914);
    float _940 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[45].x, _916);
    float _942 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[46].x, _918);
    float _944 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[47].x, _920);
    float _946 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[49].x, _930);
    float _948 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[50].x, _924);
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[51].x, _926);
    float _952 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[52].x, _928);
    float _954 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[53].x, _932);
    float _956 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[48].x, _922);
    float _958 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _910);
    float _960 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _908);
    float _962 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[42].z, _934);
    float _964 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[43].z, _936);
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _968 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[44].z, _938);
    float _970 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[45].z, _940);
    float _972 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[48].z, _956);
    float _974 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[49].z, _946);
    float _976 = _960 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _978 = _966 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _980 = _966 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _982 = _966 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _984 = _966 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _986 = _962 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _988 = _964 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _990 = _968 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _992 = _970 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[7].x, _978);
    float _996 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[8].x, _980);
    float _998 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[9].x, _982);
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c4)._m0[10].x, _984);
    out.m_46.x = _986;
    out.m_46.y = _988;
    out.m_46.z = _990;
    out.m_46.w = _992;
    float _1002 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[46].z, _942);
    float _1004 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[47].z, _944);
    float _1006 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[50].z, _948);
    float _1008 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[51].z, _950);
    float _1010 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[52].z, _952);
    float _1012 = fma(_716, (*spvDescriptorSet0.vp_c4)._m0[53].z, _954);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _994);
    float _1016 = -_840;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1020 = _1016 + _1018;
    float _1022 = _972 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1024 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1026 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_48.w = _840;
    float _1030 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _996);
    float _1032 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _998);
    float _1034 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1000);
    float _1036 = _974 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _1038 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1040 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1042 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1044 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1046 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1048 = _1030 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1050 = _1032 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1052 = _1034 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_50.x = _1038;
    out.m_50.y = _1040;
    out.m_50.z = _1022;
    out.m_50.w = _1036;
    out.m_52.x = _1024;
    out.m_52.y = _1042;
    out.m_52.z = _1044;
    out.m_52.w = _1026;
    out.m_54.w = _1028;
    out.gl_Position.x = _1046;
    out.gl_Position.y = _1048;
    out.gl_Position.z = _1050;
    out.gl_Position.w = _1052;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

