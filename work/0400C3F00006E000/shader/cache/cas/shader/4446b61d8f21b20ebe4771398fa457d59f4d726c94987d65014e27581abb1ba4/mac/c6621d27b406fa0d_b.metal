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
    bool _5587 = false;
    bool _2439 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_51.x;
    float _80 = in.m_51.y;
    float _82 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _84 = _82 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _87 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _89 = _87 << 4;
    bool _93 = _89 == 0;
    bool _95 = _89 == 16;
    bool _97 = _89 == 32;
    bool _99 = _89 == 48;
    bool _101 = _89 == 64;
    float _103 = fma(_84, _78, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _105 = fma(_78, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _107 = _89 == 80;
    bool _109 = _80 >= 0.5;
    bool _111 = isnan(_80);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.5);
    bool _117 = _113 || _115;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _121 = _103 + _119;
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _125 = _105 + _123;
    float _127 = as_type<float>(gl_BaseInstance);
    if (_93)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _129 = _127;
    float _131 = _121 * _121;
    bool _133 = _89 == 96;
    float _135 = 0.0;
    float _137 = _129;
    float _139 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (_93)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _141 = _135;
    float _143 = fma(_125, _125, _131);
    float _145 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _147 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _145;
    float _149 = _141;
    if (_95)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _151 = _137;
    bool _153 = _89 == 112;
    float _155 = fma(_147, _147, _143);
    float _157 = _151;
    if (_95)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_97)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _163 = _157;
    float _165 = rsqrt(_155);
    bool _167 = _89 == 128;
    float _169 = _163;
    if (_97)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _171 = _161;
    float _173 = _171;
    if (_99)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _175 = _169;
    bool _177 = _89 == 144;
    float _179 = _175;
    if (_99)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _181 = _173;
    float _183 = _181;
    if (_101)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _185 = _179;
    bool _187 = _89 == 160;
    float _189 = _185;
    if (_101)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _191 = _183;
    float _193 = _165 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _195 = _191;
    if (_107)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _197 = _189;
    bool _199 = _89 == 176;
    float _201 = _197;
    if (_107)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _203 = _195;
    float _205 = log2(_193);
    bool _207 = _89 == 192;
    float _209 = _203;
    if (_133)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _211 = _201;
    float _213 = _211;
    if (_133)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _215 = _209;
    float _217 = _215;
    if (_153)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _219 = _213;
    bool _221 = _89 == 208;
    float _223 = _219;
    if (_153)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _225 = _217;
    float _227 = _225;
    if (_167)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _229 = _223;
    bool _231 = _89 == 224;
    float _233 = _205 + 1.2999999523162841796875;
    float _235 = _229;
    if (_167)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _237 = _227;
    float _239 = _237;
    if (_177)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _241 = _235;
    bool _243 = _89 == 240;
    float _245 = trunc(_233);
    int _247 = int(_245);
    float _249 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _251 = _239;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _255 = _249;
    bool _257 = _89 == 256;
    float _259 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_199)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _265 = _259;
    bool _267 = _89 == 272;
    float _269 = _265;
    if (_199)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _271 = _263;
    float _273 = _271;
    if (_207)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _275 = _269;
    int _277 = min(_247, 15);
    bool _279 = _89 == 288;
    float _281 = _275;
    if (_207)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _283 = _273;
    float _285 = float(_277);
    bool _287 = _89 == 304;
    int _289 = _277 << 4;
    int _291 = _289 + 4288;
    float _293 = _283;
    float _295 = as_type<float>(_291);
    if (_221)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _297 = _281;
    float _299 = _297;
    if (_221)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _301 = _293;
    float _303 = -_285;
    float _305 = _303 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _307 = _301;
    if (_231)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _309 = _299;
    int _311 = _291 + 8;
    uint _314 = uint(int(uint(_311) >> uint(2)));
    uint _316 = uint(int(uint(int(_314)) >> uint(2)));
    int _318 = int(_314) & 3;
    float _320 = (*spvDescriptorSet0.vp_c14)._m0[int(_316)][_318];
    int _322 = int(_314) + 1;
    uint _324 = uint(int(uint(_322) >> uint(2)));
    int _326 = _322 & 3;
    float _328 = (*spvDescriptorSet0.vp_c14)._m0[int(_324)][_326];
    bool _330 = _89 == 320;
    float _332 = _305 + 1.0;
    float _334 = _309;
    if (_231)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _336 = _307;
    float _338 = _336;
    if (_243)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _340 = _334;
    bool _342 = _89 == 336;
    float _344 = exp2(_332);
    float _346 = _340;
    if (_243)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _348 = _338;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _352 = _346;
    bool _354 = _89 == 352;
    float _356 = _352;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _358 = _350;
    float _360 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _362 = _356;
    bool _364 = _89 == 368;
    float _366 = _362;
    if (_267)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _368 = _360;
    float _370 = _368;
    if (_279)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _372 = _366;
    float _374 = 1.0 / _344;
    bool _376 = _89 == 384;
    float _378 = _372;
    if (_279)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _380 = _370;
    float _382 = _380;
    if (_287)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _384 = _378;
    bool _386 = _89 == 400;
    float _388 = _384;
    if (_287)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _390 = _382;
    bool _392 = _89 == 416;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _396 = _388;
    float _398 = _396;
    if (_330)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _400 = _394;
    float _402 = _400;
    if (_342)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _404 = _398;
    bool _406 = _89 == 432;
    float _408 = _404;
    if (_342)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_354)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _414 = _408;
    bool _416 = _89 == 448;
    float _418 = _414;
    if (_354)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_364)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _424 = _418;
    bool _426 = _89 == 464;
    float _428 = _424;
    if (_364)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_376)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _434 = _428;
    bool _436 = _89 == 480;
    float _438 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _440 = _432;
    float _442 = _440;
    if (_386)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _444 = _438;
    bool _446 = _89 == 496;
    float _448 = _444;
    if (_386)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _450 = _442;
    float _452 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _454 = _448;
    bool _456 = _89 == 512;
    float _458 = _454;
    if (_392)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _460 = _452;
    bool _462 = _89 == 528;
    float _464 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _466 = _458;
    float _468 = _466;
    if (_406)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _470 = _464;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _474 = _468;
    bool _476 = _89 == 544;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _484 = _478;
    bool _486 = _89 == 560;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _494 = _488;
    bool _496 = _89 == 576;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_446)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _504 = _498;
    bool _506 = _89 == 592;
    float _508 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _510 = _502;
    float _512 = _510;
    if (_456)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _514 = _508;
    bool _516 = _89 == 608;
    float _518 = _514;
    if (_456)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _520 = _512;
    float _522 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _524 = _518;
    bool _526 = _89 == 624;
    float _528 = _524;
    if (_462)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _530 = _522;
    bool _532 = _89 == 640;
    float _534 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _536 = _528;
    float _538 = _536;
    if (_476)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _540 = _534;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _544 = _538;
    bool _546 = _89 == 656;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _554 = _548;
    bool _556 = _89 == 672;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _564 = _558;
    bool _566 = _89 == 688;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_516)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _574 = _568;
    bool _576 = _89 == 704;
    float _578 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _580 = _572;
    float _582 = _580;
    if (_526)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _584 = _578;
    bool _586 = _89 == 720;
    float _588 = _584;
    if (_526)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _590 = _582;
    float _592 = _590;
    if (_532)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _594 = _588;
    bool _596 = _89 == 736;
    float _598 = _594;
    if (_532)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _600 = _592;
    bool _602 = _89 == 752;
    float _604 = _600;
    if (_546)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _606 = _598;
    float _608 = _606;
    if (_556)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_566)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_576)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _618 = _616;
    float _620 = _618;
    if (_586)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _622 = _620;
    float _624 = _622;
    if (_596)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _626 = _624;
    float _628 = _626;
    if (_602)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _630 = _628;
    float _632 = _374 * _630;
    if (_546)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _634 = _604;
    float _636 = _634;
    if (_556)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _638 = _636;
    float _640 = _632 * _78;
    float _642 = _638;
    if (_566)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_576)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _648 = _646;
    float _650 = floor(_640);
    float _652 = _648;
    if (_586)
    {
        _652 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _654 = _652;
    float _656 = _654;
    if (_596)
    {
        _656 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _658 = _656;
    float _660 = _658;
    if (_602)
    {
        _660 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _662 = _660;
    float _664 = -_650;
    float _666 = _640 + _664;
    float _668 = _344 * _662;
    float _670 = _666 * 2.0;
    float _672 = -_666;
    float _674 = fma(_668, _672, _78);
    float _676 = floor(_670);
    float _678 = _668 * _676;
    float _680 = _678 * 0.5;
    float _682 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _684 = _680 + _674;
    float _686 = fma(_84, _684, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _688 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _692 = _686 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _696 = _688 + _694;
    float _698 = _692 * _692;
    float _700 = fma(_696, _696, _698);
    float _702 = fma(_147, _147, _700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _706 = sqrt(_702);
    int _708 = _704 + 76;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c6)._m0[int(_712)][_714];
    uint _718 = uint(int(uint(_704) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.vp_c6)._m0[int(_720)][_722];
    float _726 = -_328;
    float _728 = fma(_706, _320, _726);
    float _730 = precise::clamp(_728, 0.0, 1.0);
    float _732 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _732;
    float _736 = -_680;
    float _738 = fma(_736, _730, _684);
    float _740 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _742 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _740;
    float _744 = fma(_738, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _746 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _748 = _744 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _752 = _744 + _750;
    float _754 = abs(_748);
    float _756 = abs(_742);
    float _758 = precise::max(_754, _756);
    float _760 = _716 + 8.0;
    float _762 = _760 + _758;
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _766 = _762 * _724;
    float _768 = _766 * 4.0;
    float _770 = _716;
    float _772 = _734;
    float _774 = _752;
    float _776 = _320;
    float _778 = _682;
    if (!_117)
    {
        float _780 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _770 = _780;
    }
    float _782 = _770;
    float _784 = precise::max(_768, 1.0);
    float _786 = log2(_784);
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _790 = _782;
    if (!_117)
    {
        float _792 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _139 = _792;
    }
    float _794 = _139;
    float _796 = _794;
    if (!_117)
    {
        float _798 = _782 + _788;
        _790 = _798;
    }
    float _800 = _790;
    float _802 = _800;
    if (!_117)
    {
        float _804 = _794 + _788;
        _796 = _804;
    }
    float _806 = _796;
    float _808 = trunc(_786);
    int _810 = int(_808);
    float _812 = floor(_786);
    int _814 = min(_810, 4);
    int _816 = _814 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _818 = _816 << 4;
    float _820 = _812 + 1.0;
    float _822 = rint(_812);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    uint _828 = clamp(_826, 0u, 65535u);
    uint _830 = uint(int(uint(_818) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.vp_c6)._m0[int(_832)][_834];
    float _838 = rint(_820);
    float _840 = precise::max(_838, 0.0);
    uint _842 = uint(_840);
    uint _844 = clamp(_842, 0u, 65535u);
    int _846 = _818 + 16;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c6)._m0[int(_850)][_852];
    float _856 = fma(_734, _836, 0.5);
    float _858 = fma(_752, _836, 0.5);
    float _860 = fma(_734, _854, 0.5);
    float _862 = fma(_752, _854, 0.5);
    float _864 = as_type<float>(_818);
    float _866 = _820;
    float _868 = _860;
    float _870 = _806;
    if (!_117)
    {
        float2 _7251 = float2(_800, _806);
        float4 _873 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7251, float2(0.0), isnan(_7251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7251, float2(0.0), isnan(_7251)), level(0.0)).xyzw;
        float _875 = _873.x;
        float _877 = _873.y;
        float _879 = _873.z;
        float _881 = _873.w;
        _772 = _875;
        _295 = _877;
        _864 = _879;
        _774 = _881;
    }
    float _883 = _772;
    float _885 = _295;
    float _887 = _864;
    float _889 = _774;
    float3 _7281 = float3(_858, _856, float(int(_828)));
    float3 _7285 = select(_7281, float3(0.0), isnan(_7281));
    float3 _893 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7285.xy, uint(rint(_7285.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7285.xy, uint(rint(_7285.z)), level(0.0)).xyz;
    float _895 = _893.x;
    float _897 = _893.y;
    float _899 = _893.z;
    float3 _7300 = float3(_862, _860, float(int(_844)));
    float3 _7302 = select(_7300, float3(0.0), isnan(_7300));
    float3 _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7302.xy, uint(rint(_7302.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7302.xy, uint(rint(_7302.z)), level(0.0)).xyz;
    float _903 = _901.x;
    float _905 = _901.y;
    float _907 = _901.z;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[0].w + 1.953125;
    float _911 = _909;
    if (_117)
    {
        _776 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _913 = _776;
    float _915 = 0.0;
    if (_117)
    {
        float _917 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _764, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _915 = _917;
    }
    float _919 = _915;
    float _921 = 0.0;
    if (_117)
    {
        _921 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _923 = _921;
    float _925 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _927 = 0.0;
    if (_117)
    {
        float _929 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _913, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _927 = _929;
    }
    float _931 = _927;
    if (_117)
    {
        float _933 = fma(_744, _913, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _911 = _933;
    }
    float _935 = _911;
    float _937 = _744 + 1.953125;
    float _939 = _935;
    if (_117)
    {
        float _941 = fma(_931, _923, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _866 = _941;
    }
    float _943 = _866;
    if (_117)
    {
        float _945 = fma(_935, _923, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _939 = _945;
    }
    float _947 = _939;
    float _949 = _947;
    if (_117)
    {
        float _951 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _682, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _868 = _951;
    }
    float _953 = _868;
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (_117)
    {
        float _957 = _943 + _788;
        _778 = _957;
    }
    float _959 = _778;
    if (_117)
    {
        float _961 = _947 + _788;
        _949 = _961;
    }
    float _963 = _949;
    float _965 = fma(_925, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_117)
    {
        float _969 = _788 + _953;
        _870 = _969;
    }
    float _971 = _870;
    float _973 = _883;
    float _975 = _885;
    float _977 = _887;
    float _979 = _889;
    if (_117)
    {
        float2 _7453 = float2(_963, _959);
        float4 _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7453, float2(0.0), isnan(_7453)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7453, float2(0.0), isnan(_7453)), level(0.0)).xyzw;
        float _983 = _981.x;
        float _985 = _981.y;
        float _987 = _981.z;
        float _989 = _981.w;
        _973 = _983;
        _975 = _985;
        _977 = _987;
        _979 = _989;
    }
    float _991 = _973;
    float _993 = _975;
    float _995 = _977;
    float _997 = _979;
    float _999 = _965 + _788;
    float _1001 = _967 + _788;
    if (_117)
    {
        float _1003 = _788 + _919;
        _802 = _1003;
    }
    float _1005 = _802;
    float2 _7492 = float2(_1001, _971);
    float _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7492, float2(0.0), isnan(_7492)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7492, float2(0.0), isnan(_7492)), level(0.0)).x;
    float2 _7500 = float2(_1005, _999);
    float _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7500, float2(0.0), isnan(_7500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7500, float2(0.0), isnan(_7500)), level(0.0)).x;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[0].w * 0.00012500000593718141317367553710938;
    float _1013 = _744 * 0.00012500000593718141317367553710938;
    float _1015 = -_812;
    float _1017 = _786 + _1015;
    float _1019 = abs(_1013);
    float _1021 = abs(_1011);
    float _1023 = precise::max(_1019, _1021);
    float _1025 = fma(_1017, 5.42372894287109375, -4.338983058929443359375);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_1023, 20.0, -19.0);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = -_1031;
    float _1035 = _1033 + 1.0;
    float _1037 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 0.008000000379979610443115234375, 64.0);
    float _1039 = fma(_744, 0.008000000379979610443115234375, 64.0);
    float _1041 = precise::max(0.0, _1037);
    float _1043 = precise::max(0.0, _1039);
    float _1045 = precise::min(_1041, 127.0);
    float _1047 = -_899;
    float _1049 = _1047 + _907;
    float _1051 = -_895;
    float _1053 = _1051 + _903;
    float _1055 = -_897;
    float _1057 = _1055 + _905;
    float _1059 = fma(_1027, _1049, _899);
    float _1061 = fma(_1027, _1053, _895);
    float _1063 = fma(_1027, _1057, _897);
    float _1065 = precise::min(_1043, 127.0);
    float _1067 = fma(_1035, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _1069 = fma(_1035, _1061, _744);
    float _1071 = trunc(_1045);
    int _1073 = int(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1077 = _1067 + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1081 = _1069 + _1079;
    float _1083 = _1077 * _1077;
    float _1085 = trunc(_1065);
    int _1087 = int(_1085);
    float _1089 = fma(_1081, _1081, _1083);
    float _1091 = fma(_1081, _1081, _1083);
    bool _1093 = _1089 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1095 = isnan(_1089);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1101 = _1097 || _1099;
    float _1103 = fma(_991, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1105 = sqrt(_1091);
    float _1107 = fma(_1035, _1063, _1103);
    float _1109 = _1083;
    float _1111 = _1041;
    float _1113 = _1035;
    float _1115 = _991;
    float _1117 = _1089;
    float _1119 = _1043;
    if (!_1101)
    {
        _1109 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_1101)
    {
        float _1125 = -_1089;
        float _1127 = _1125 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1111 = _1127;
    }
    float _1129 = _1111;
    float _1131 = _1129;
    if (!_1101)
    {
        float _1133 = _1089 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1113 = _1133;
    }
    float _1135 = _1113;
    if (!_1101)
    {
        float _1137 = -_1129;
        float _1139 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = _1141;
    if (_1101)
    {
        _1123 = _1107;
    }
    float _1145 = _1123;
    float _1147 = _1145;
    if (!_1101)
    {
        float _1149 = precise::min(_1107, _1141);
        _1143 = _1149;
    }
    float _1151 = _1143;
    if (!_1101)
    {
        float _1153 = -_1151;
        float _1155 = _1107 + _1153;
        _1115 = _1155;
    }
    float _1157 = _1115;
    float _1159 = _1157;
    if (!_1101)
    {
        float _1161 = fma(_1135, _1157, _1151);
        _1147 = _1161;
    }
    float _1163 = _1147;
    bool _1165 = _1105 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    int _1167 = _1073 << 7;
    int _1169 = _1167 + _1087;
    float _1171 = _1163 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    int _1173 = _1169 << 4;
    float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1171);
    int _1177 = _1173 + 8;
    float _1179 = fma(_1067, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1175);
    float _1181 = as_type<float>(_1169);
    if (!_1165)
    {
        _1117 = _1069;
    }
    float _1183 = _1117;
    float _1185 = _1179 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1187 = _1183;
    if (!_1165)
    {
        _1159 = _1067;
    }
    float _1189 = _1159;
    float _1191 = _1189;
    if (!_1165)
    {
        _1119 = _1163;
    }
    float _1193 = _1119;
    float _1195 = _1193;
    if (!_1165)
    {
        _1181 = _1185;
    }
    float _1197 = _1181;
    bool _1199 = !_1165;
    float _1201 = _1197;
    if (!_1199)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1207 = _1105 + _1205;
        float _1209 = rsqrt(_1091);
        float _1211 = _1207 * _1203;
        float _1213 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1215 = _1211 * 0.15915493667125701904296875;
        float _1217 = _1215 * 6.283185482025146484375;
        float _1219 = cos(_1217);
        float _1221 = _1215 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = _1219 + (-1.0);
        float _1227 = fma(_1223, _1213, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1229 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1231 = _1209 * _1227;
        float _1233 = fma(_1219, _1163, _1229);
        float _1235 = fma(_1081, _1231, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1237 = _1233 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1239 = fma(_1077, _1231, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1241 = fma(_1235, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1237);
        float _1243 = fma(_1239, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1241);
        float _1245 = _1243 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1195 = _1233;
        _1187 = _1235;
        _1191 = _1239;
        _1201 = _1245;
    }
    float _1247 = _1195;
    float _1249 = _1187;
    float _1251 = _1191;
    float _1253 = _1201;
    uint _1255 = uint(int(uint(_1177) >> uint(2)));
    float _1257 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1255)]);
    float _1259 = floor(_1065);
    int _1261 = _1173 + 12;
    uint _1263 = uint(int(uint(_1173) >> uint(2)));
    float _1265 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1263)]);
    uint _1267 = uint(int(uint(_1261) >> uint(2)));
    float _1269 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1267)]);
    float _1271 = floor(_1045);
    float _1273 = -_1259;
    float _1275 = _1065 + _1273;
    float _1277 = -_1271;
    float _1279 = _1045 + _1277;
    int _1281 = _1173 + 4;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    float _1285 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1283)]);
    float _1287 = _1257 + _1275;
    float _1289 = precise::clamp(_1287, 0.0, 1.0);
    float _1291 = _1257 + _1279;
    float _1293 = precise::clamp(_1291, 0.0, 1.0);
    bool _1295 = _1289 >= 1.0;
    bool _1297 = isnan(_1289);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(1.0);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    bool _1307 = _1293 >= 1.0;
    bool _1309 = isnan(_1293);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan(1.0);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = trunc(_1305);
    int _1321 = int(_1319);
    float _1323 = trunc(_1317);
    int _1325 = int(_1323);
    int _1327 = _1087 + _1321;
    int _1329 = _1073 << 7;
    int _1331 = _1329 + _1327;
    int _1333 = _1073 + _1325;
    int _1335 = _1333 << 7;
    int _1337 = _1335 + _1327;
    int _1339 = _1333 << 7;
    int _1341 = _1339 + _1087;
    int _1343 = _1337 << 4;
    int _1345 = _1331 << 4;
    int _1347 = _1341 << 4;
    uint _1349 = uint(int(uint(_1343) >> uint(2)));
    float _1351 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1349)]);
    int _1353 = _1343 + 12;
    int _1355 = _1345 + 12;
    uint _1357 = uint(int(uint(_1345) >> uint(2)));
    float _1359 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1357)]);
    int _1361 = _1347 + 12;
    uint _1363 = uint(int(uint(_1353) >> uint(2)));
    float _1365 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1363)]);
    uint _1367 = uint(int(uint(_1355) >> uint(2)));
    float _1369 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1367)]);
    uint _1371 = uint(int(uint(_1361) >> uint(2)));
    float _1373 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1371)]);
    uint _1375 = uint(int(uint(_1347) >> uint(2)));
    float _1377 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1375)]);
    float _1379 = fma(_1007, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1381 = fma(_1009, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1383 = -_1103;
    float _1385 = _1383 + _1379;
    float _1387 = -_1103;
    float _1389 = _1387 + _1381;
    float _1391 = _1385 * 1.953125;
    float _1393 = _1389 * 1.953125;
    float _1395 = floor(_1289);
    float _1397 = floor(_1293);
    float _1399 = fma(_997, 255.99609375, 7.629510946571826934814453125e-06);
    float _1401 = _1269 * _1275;
    float _1403 = _1285 * _1275;
    float _1405 = _1285 * _1279;
    float _1407 = floor(_1403);
    float _1409 = -_1395;
    float _1411 = _1289 + _1409;
    float _1413 = floor(_1405);
    float _1415 = -_1397;
    float _1417 = _1293 + _1415;
    float _1419 = _1269 * _1411;
    float _1421 = _1269 * _1417;
    float _1423 = _1269 * _1279;
    float _1425 = floor(_1419);
    float _1427 = floor(_1421);
    float _1429 = _1407 + _1413;
    float _1431 = 1.0 / _1269;
    float _1433 = floor(_1423);
    float _1435 = floor(_1401);
    float _1437 = fma(_993, 200.0, -100.0);
    float _1439 = fma(_995, 200.0, -100.0);
    float _1441 = _1247 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1443 = _1247 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1445 = fma(_1391, _1391, 14.55191516876220703125);
    float _1447 = floor(_1399);
    float _1449 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1441);
    float _1451 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1443);
    float _1453 = fma(_1393, _1393, _1445);
    float _1455 = trunc(_1429);
    int _1457 = int(_1455);
    float _1459 = fma(_1269, _1433, _1435);
    float _1461 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1451);
    float _1463 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1449);
    float _1465 = _1461 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1467 = rsqrt(_1453);
    float _1469 = -_1447;
    float _1471 = _1399 + _1469;
    float _1473 = _1463 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1477 = -_1413;
    float _1479 = _1405 + _1477;
    float _1481 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    bool _1483 = _1471 > 0.499000012874603271484375;
    float _1485 = trunc(_1459);
    int _1487 = int(_1485);
    int _1489 = _1457 & 1;
    bool _1491 = _1489 != 0;
    float _1493 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1495 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1475);
    float _1497 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1495);
    float _1499 = -_1407;
    float _1501 = _1403 + _1499;
    int _1503 = as_type<int>(_1265) + _1487;
    float _1505 = fma(_1427, _1365, _1425);
    float _1507 = _1365 * _1431;
    float _1509 = fma(_1433, _1369, _1425);
    float _1511 = _1369 * _1431;
    float _1513 = fma(_1373, _1427, _1435);
    float _1515 = _1373 * _1431;
    float _1517 = _1507 * _1505;
    float _1519 = _1511 * _1509;
    float _1521 = _1515 * _1513;
    float _1523 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1525 = trunc(_1519);
    int _1527 = int(_1525);
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1481);
    float _1531 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1523);
    float _1533 = trunc(_1521);
    int _1535 = int(_1533);
    float _1537 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1493);
    float _1539 = trunc(_1517);
    int _1541 = int(_1539);
    float _1543 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1531);
    float _1545 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1529);
    float _1547 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1537);
    float _1549 = _1391 * _1467;
    float _1551 = _1439 * _1439;
    float _1553 = _1497 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    int _1555 = as_type<int>(_1359) + _1527;
    float _1557 = _1393 * _1467;
    float _1559 = fma(_1437, _1437, _1551);
    int _1561 = as_type<int>(_1377) + _1535;
    float _1563 = _1467 * 3.814697265625;
    float _1565 = _1543 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1567 = _1545 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1569 = _1547 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1571 = !_1483;
    int _1573 = _1571 ? as_type<int>(_1553) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    int _1575 = as_type<int>(_1351) + _1541;
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
    float _2437;
    if (!_1491)
    {
        float _1577 = fma(_1479, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1579 = fma(_1501, -0.707106769084930419921875, _1577);
        bool _1581 = _1579 >= 0.0;
        bool _1583 = !_1581;
        if (!_1583)
        {
            int _1585 = _1555 * 656;
            int _1587 = _1585 + 262144;
            int _1589 = _1585 + 262192;
            int _1591 = _1585 + 262160;
            uint _1593 = uint(int(uint(_1587) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1593)];
            float _1595 = as_type<float>(_dmw0.x);
            int _1597 = _1587 + 4;
            uint _1599 = uint(int(uint(_1597) >> uint(2)));
            float _1601 = as_type<float>(_dmw0.y);
            int _1603 = _1587 + 8;
            uint _1605 = uint(int(uint(_1603) >> uint(2)));
            float _1607 = as_type<float>(_dmw0.z);
            int _1609 = _1587 + 12;
            uint _1611 = uint(int(uint(_1609) >> uint(2)));
            float _1613 = as_type<float>(_dmw0.w);
            int _1615 = _1585 + 262208;
            uint _1617 = uint(int(uint(_1589) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1617)];
            float _1619 = as_type<float>(_dmw3.x);
            int _1621 = _1589 + 4;
            uint _1623 = uint(int(uint(_1621) >> uint(2)));
            float _1625 = as_type<float>(_dmw3.y);
            int _1627 = _1589 + 8;
            uint _1629 = uint(int(uint(_1627) >> uint(2)));
            float _1631 = as_type<float>(_dmw3.z);
            int _1633 = _1589 + 12;
            uint _1635 = uint(int(uint(_1633) >> uint(2)));
            float _1637 = as_type<float>(_dmw3.w);
            int _1639 = _1585 + 262224;
            int _1641 = _1585 + 262240;
            uint _1643 = uint(int(uint(_1591) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1643)];
            float _1645 = as_type<float>(_dmw1.x);
            int _1647 = _1591 + 4;
            uint _1649 = uint(int(uint(_1647) >> uint(2)));
            float _1651 = as_type<float>(_dmw1.y);
            int _1653 = _1591 + 8;
            uint _1655 = uint(int(uint(_1653) >> uint(2)));
            float _1657 = as_type<float>(_dmw1.z);
            int _1659 = _1591 + 12;
            uint _1661 = uint(int(uint(_1659) >> uint(2)));
            float _1663 = as_type<float>(_dmw1.w);
            int _1665 = _1585 + 262176;
            int _1667 = _1503 * 656;
            int _1669 = _1585 + 262256;
            uint _1671 = uint(int(uint(_1615) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1671)];
            float _1673 = as_type<float>(_dmw4.x);
            int _1675 = _1615 + 4;
            uint _1677 = uint(int(uint(_1675) >> uint(2)));
            float _1679 = as_type<float>(_dmw4.y);
            int _1681 = _1615 + 8;
            uint _1683 = uint(int(uint(_1681) >> uint(2)));
            float _1685 = as_type<float>(_dmw4.z);
            int _1687 = _1615 + 12;
            uint _1689 = uint(int(uint(_1687) >> uint(2)));
            float _1691 = as_type<float>(_dmw4.w);
            uint _1693 = uint(int(uint(_1639) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1693)];
            float _1695 = as_type<float>(_dmw5.x);
            int _1697 = _1639 + 4;
            uint _1699 = uint(int(uint(_1697) >> uint(2)));
            float _1701 = as_type<float>(_dmw5.y);
            int _1703 = _1639 + 8;
            uint _1705 = uint(int(uint(_1703) >> uint(2)));
            float _1707 = as_type<float>(_dmw5.z);
            int _1709 = _1639 + 12;
            uint _1711 = uint(int(uint(_1709) >> uint(2)));
            float _1713 = as_type<float>(_dmw5.w);
            uint _1715 = uint(int(uint(_1641) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1715)];
            float _1717 = as_type<float>(_dmw6.x);
            int _1719 = _1641 + 4;
            uint _1721 = uint(int(uint(_1719) >> uint(2)));
            float _1723 = as_type<float>(_dmw6.y);
            int _1725 = _1641 + 8;
            uint _1727 = uint(int(uint(_1725) >> uint(2)));
            float _1729 = as_type<float>(_dmw6.z);
            int _1731 = _1641 + 12;
            uint _1733 = uint(int(uint(_1731) >> uint(2)));
            float _1735 = as_type<float>(_dmw6.w);
            int _1737 = _1561 * 656;
            uint _1739 = uint(int(uint(_1665) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1739)];
            float _1741 = as_type<float>(_dmw2.x);
            int _1743 = _1665 + 4;
            uint _1745 = uint(int(uint(_1743) >> uint(2)));
            float _1747 = as_type<float>(_dmw2.y);
            int _1749 = _1665 + 8;
            uint _1751 = uint(int(uint(_1749) >> uint(2)));
            float _1753 = as_type<float>(_dmw2.z);
            int _1755 = _1665 + 12;
            uint _1757 = uint(int(uint(_1755) >> uint(2)));
            float _1759 = as_type<float>(_dmw2.w);
            int _1761 = _1667 + 262144;
            int _1763 = _1667 + 262192;
            uint _1765 = uint(int(uint(_1669) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1765)];
            float _1767 = as_type<float>(_dmw7.x);
            int _1769 = _1669 + 4;
            uint _1771 = uint(int(uint(_1769) >> uint(2)));
            float _1773 = as_type<float>(_dmw7.y);
            int _1775 = _1669 + 8;
            uint _1777 = uint(int(uint(_1775) >> uint(2)));
            float _1779 = as_type<float>(_dmw7.z);
            int _1781 = _1669 + 12;
            uint _1783 = uint(int(uint(_1781) >> uint(2)));
            float _1785 = as_type<float>(_dmw7.w);
            int _1787 = _1667 + 262160;
            int _1789 = _1667 + 262208;
            uint _1791 = uint(int(uint(_1761) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1791)];
            float _1793 = as_type<float>(_dmw8.x);
            int _1795 = _1761 + 4;
            uint _1797 = uint(int(uint(_1795) >> uint(2)));
            float _1799 = as_type<float>(_dmw8.y);
            int _1801 = _1761 + 8;
            uint _1803 = uint(int(uint(_1801) >> uint(2)));
            float _1805 = as_type<float>(_dmw8.z);
            int _1807 = _1761 + 12;
            uint _1809 = uint(int(uint(_1807) >> uint(2)));
            float _1811 = as_type<float>(_dmw8.w);
            int _1813 = _1667 + 262176;
            int _1815 = _1667 + 262224;
            uint _1817 = uint(int(uint(_1763) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1817)];
            float _1819 = as_type<float>(_dmw11.x);
            int _1821 = _1763 + 4;
            uint _1823 = uint(int(uint(_1821) >> uint(2)));
            float _1825 = as_type<float>(_dmw11.y);
            int _1827 = _1763 + 8;
            uint _1829 = uint(int(uint(_1827) >> uint(2)));
            float _1831 = as_type<float>(_dmw11.z);
            int _1833 = _1763 + 12;
            uint _1835 = uint(int(uint(_1833) >> uint(2)));
            float _1837 = as_type<float>(_dmw11.w);
            int _1839 = _1667 + 262240;
            int _1841 = _1667 + 262256;
            uint _1843 = uint(int(uint(_1787) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1843)];
            float _1845 = as_type<float>(_dmw9.x);
            int _1847 = _1787 + 4;
            uint _1849 = uint(int(uint(_1847) >> uint(2)));
            float _1851 = as_type<float>(_dmw9.y);
            int _1853 = _1787 + 8;
            uint _1855 = uint(int(uint(_1853) >> uint(2)));
            float _1857 = as_type<float>(_dmw9.z);
            int _1859 = _1787 + 12;
            uint _1861 = uint(int(uint(_1859) >> uint(2)));
            float _1863 = as_type<float>(_dmw9.w);
            int _1865 = _1737 + 262144;
            int _1867 = _1737 + 262192;
            uint _1869 = uint(int(uint(_1789) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1869)];
            float _1871 = as_type<float>(_dmw12.x);
            int _1873 = _1789 + 4;
            uint _1875 = uint(int(uint(_1873) >> uint(2)));
            float _1877 = as_type<float>(_dmw12.y);
            int _1879 = _1789 + 8;
            uint _1881 = uint(int(uint(_1879) >> uint(2)));
            float _1883 = as_type<float>(_dmw12.z);
            int _1885 = _1789 + 12;
            uint _1887 = uint(int(uint(_1885) >> uint(2)));
            float _1889 = as_type<float>(_dmw12.w);
            int _1891 = _1737 + 262160;
            int _1893 = _1737 + 262208;
            uint _1895 = uint(int(uint(_1813) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1895)];
            float _1897 = as_type<float>(_dmw10.x);
            int _1899 = _1813 + 4;
            uint _1901 = uint(int(uint(_1899) >> uint(2)));
            float _1903 = as_type<float>(_dmw10.y);
            int _1905 = _1813 + 8;
            uint _1907 = uint(int(uint(_1905) >> uint(2)));
            float _1909 = as_type<float>(_dmw10.z);
            int _1911 = _1813 + 12;
            uint _1913 = uint(int(uint(_1911) >> uint(2)));
            float _1915 = as_type<float>(_dmw10.w);
            int _1917 = _1737 + 262176;
            int _1919 = _1737 + 262224;
            uint _1921 = uint(int(uint(_1815) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1921)];
            float _1923 = as_type<float>(_dmw13.x);
            int _1925 = _1815 + 4;
            uint _1927 = uint(int(uint(_1925) >> uint(2)));
            float _1929 = as_type<float>(_dmw13.y);
            int _1931 = _1815 + 8;
            uint _1933 = uint(int(uint(_1931) >> uint(2)));
            float _1935 = as_type<float>(_dmw13.z);
            int _1937 = _1815 + 12;
            uint _1939 = uint(int(uint(_1937) >> uint(2)));
            float _1941 = as_type<float>(_dmw13.w);
            int _1943 = _1737 + 262240;
            int _1945 = _1737 + 262256;
            uint _1947 = uint(int(uint(_1839) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1947)];
            float _1949 = as_type<float>(_dmw14.x);
            int _1951 = _1839 + 4;
            uint _1953 = uint(int(uint(_1951) >> uint(2)));
            float _1955 = as_type<float>(_dmw14.y);
            int _1957 = _1839 + 8;
            uint _1959 = uint(int(uint(_1957) >> uint(2)));
            float _1961 = as_type<float>(_dmw14.z);
            int _1963 = _1839 + 12;
            uint _1965 = uint(int(uint(_1963) >> uint(2)));
            float _1967 = as_type<float>(_dmw14.w);
            uint _1969 = uint(int(uint(_1841) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1969)];
            float _1971 = as_type<float>(_dmw15.x);
            int _1973 = _1841 + 4;
            uint _1975 = uint(int(uint(_1973) >> uint(2)));
            float _1977 = as_type<float>(_dmw15.y);
            int _1979 = _1841 + 8;
            uint _1981 = uint(int(uint(_1979) >> uint(2)));
            float _1983 = as_type<float>(_dmw15.z);
            int _1985 = _1841 + 12;
            uint _1987 = uint(int(uint(_1985) >> uint(2)));
            float _1989 = as_type<float>(_dmw15.w);
            uint _1991 = uint(int(uint(_1865) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1991)];
            float _1993 = as_type<float>(_dmw16.x);
            int _1995 = _1865 + 4;
            uint _1997 = uint(int(uint(_1995) >> uint(2)));
            float _1999 = as_type<float>(_dmw16.y);
            int _2001 = _1865 + 8;
            uint _2003 = uint(int(uint(_2001) >> uint(2)));
            float _2005 = as_type<float>(_dmw16.z);
            int _2007 = _1865 + 12;
            uint _2009 = uint(int(uint(_2007) >> uint(2)));
            float _2011 = as_type<float>(_dmw16.w);
            uint _2013 = uint(int(uint(_1867) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2013)];
            float _2015 = as_type<float>(_dmw19.x);
            int _2017 = _1867 + 4;
            uint _2019 = uint(int(uint(_2017) >> uint(2)));
            float _2021 = as_type<float>(_dmw19.y);
            int _2023 = _1867 + 8;
            uint _2025 = uint(int(uint(_2023) >> uint(2)));
            float _2027 = as_type<float>(_dmw19.z);
            int _2029 = _1867 + 12;
            uint _2031 = uint(int(uint(_2029) >> uint(2)));
            float _2033 = as_type<float>(_dmw19.w);
            uint _2035 = uint(int(uint(_1891) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2035)];
            float _2037 = as_type<float>(_dmw17.x);
            int _2039 = _1891 + 4;
            uint _2041 = uint(int(uint(_2039) >> uint(2)));
            float _2043 = as_type<float>(_dmw17.y);
            int _2045 = _1891 + 8;
            uint _2047 = uint(int(uint(_2045) >> uint(2)));
            float _2049 = as_type<float>(_dmw17.z);
            int _2051 = _1891 + 12;
            uint _2053 = uint(int(uint(_2051) >> uint(2)));
            float _2055 = as_type<float>(_dmw17.w);
            uint _2057 = uint(int(uint(_1893) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2057)];
            float _2059 = as_type<float>(_dmw20.x);
            int _2061 = _1893 + 4;
            uint _2063 = uint(int(uint(_2061) >> uint(2)));
            float _2065 = as_type<float>(_dmw20.y);
            int _2067 = _1893 + 8;
            uint _2069 = uint(int(uint(_2067) >> uint(2)));
            float _2071 = as_type<float>(_dmw20.z);
            int _2073 = _1893 + 12;
            uint _2075 = uint(int(uint(_2073) >> uint(2)));
            float _2077 = as_type<float>(_dmw20.w);
            uint _2079 = uint(int(uint(_1917) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2079)];
            float _2081 = as_type<float>(_dmw18.x);
            int _2083 = _1917 + 4;
            uint _2085 = uint(int(uint(_2083) >> uint(2)));
            float _2087 = as_type<float>(_dmw18.y);
            int _2089 = _1917 + 8;
            uint _2091 = uint(int(uint(_2089) >> uint(2)));
            float _2093 = as_type<float>(_dmw18.z);
            int _2095 = _1917 + 12;
            uint _2097 = uint(int(uint(_2095) >> uint(2)));
            float _2099 = as_type<float>(_dmw18.w);
            uint _2101 = uint(int(uint(_1919) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2101)];
            float _2103 = as_type<float>(_dmw21.x);
            int _2105 = _1919 + 4;
            uint _2107 = uint(int(uint(_2105) >> uint(2)));
            float _2109 = as_type<float>(_dmw21.y);
            int _2111 = _1919 + 8;
            uint _2113 = uint(int(uint(_2111) >> uint(2)));
            float _2115 = as_type<float>(_dmw21.z);
            int _2117 = _1919 + 12;
            uint _2119 = uint(int(uint(_2117) >> uint(2)));
            float _2121 = as_type<float>(_dmw21.w);
            uint _2123 = uint(int(uint(_1943) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2123)];
            float _2125 = as_type<float>(_dmw22.x);
            int _2127 = _1943 + 4;
            uint _2129 = uint(int(uint(_2127) >> uint(2)));
            float _2131 = as_type<float>(_dmw22.y);
            int _2133 = _1943 + 8;
            uint _2135 = uint(int(uint(_2133) >> uint(2)));
            float _2137 = as_type<float>(_dmw22.z);
            int _2139 = _1943 + 12;
            uint _2141 = uint(int(uint(_2139) >> uint(2)));
            float _2143 = as_type<float>(_dmw22.w);
            uint _2145 = uint(int(uint(_1945) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2145)];
            float _2147 = as_type<float>(_dmw23.x);
            int _2149 = _1945 + 4;
            uint _2151 = uint(int(uint(_2149) >> uint(2)));
            float _2153 = as_type<float>(_dmw23.y);
            int _2155 = _1945 + 8;
            uint _2157 = uint(int(uint(_2155) >> uint(2)));
            float _2159 = as_type<float>(_dmw23.z);
            int _2161 = _1945 + 12;
            uint _2163 = uint(int(uint(_2161) >> uint(2)));
            float _2165 = as_type<float>(_dmw23.w);
            float _2167 = _1479 + (-1.0);
            float _2169 = -_1501;
            float _2171 = -_2167;
            float _2173 = _2169 + _2171;
            float _2175 = -_2173;
            float _2177 = _2175 + 1.0;
            float _2179 = _1501 * _1595;
            float _2181 = _1501 * _1601;
            float _2183 = _1501 * _1607;
            float _2185 = _1501 * _1613;
            float _2187 = _1501 * _1619;
            float _2189 = _1501 * _1625;
            float _2191 = _1501 * _1631;
            float _2193 = _1501 * _1637;
            float _2195 = _1501 * _1645;
            float _2197 = _1501 * _1651;
            float _2199 = _1501 * _1657;
            float _2201 = _1501 * _1663;
            float _2203 = _1501 * _1673;
            float _2205 = _1501 * _1679;
            float _2207 = _1501 * _1685;
            float _2209 = _1501 * _1701;
            float _2211 = _1501 * _1707;
            float _2213 = _1501 * _1713;
            float _2215 = _1501 * _1691;
            float _2217 = _1501 * _1717;
            float _2219 = _1501 * _1723;
            float _2221 = _1501 * _1729;
            float _2223 = _1501 * _1741;
            float _2225 = _1501 * _1747;
            float _2227 = _1501 * _1753;
            float _2229 = _1501 * _1735;
            float _2231 = _1501 * _1759;
            float _2233 = _1501 * _1767;
            float _2235 = _1501 * _1695;
            float _2237 = _1501 * _1773;
            float _2239 = _1501 * _1779;
            float _2241 = -_1501;
            float _2243 = _2241 + _2177;
            float _2245 = _1501 * _1785;
            float _2247 = fma(_2173, _1793, _2179);
            float _2249 = fma(_2173, _1799, _2181);
            float _2251 = fma(_2173, _1805, _2183);
            float _2253 = fma(_2173, _1811, _2185);
            float _2255 = fma(_2173, _1819, _2187);
            float _2257 = fma(_2173, _1825, _2189);
            float _2259 = fma(_2173, _1831, _2191);
            float _2261 = fma(_2173, _1837, _2193);
            float _2263 = fma(_2173, _1845, _2195);
            float _2265 = fma(_2173, _1851, _2197);
            float _2267 = fma(_2173, _1857, _2199);
            float _2269 = fma(_2173, _1863, _2201);
            float _2271 = fma(_2173, _1871, _2203);
            float _2273 = fma(_2173, _1877, _2205);
            float _2275 = fma(_2173, _1883, _2207);
            float _2277 = fma(_2173, _1889, _2215);
            float _2279 = fma(_2173, _1897, _2223);
            float _2281 = fma(_2173, _1903, _2225);
            float _2283 = fma(_2173, _1909, _2227);
            float _2285 = fma(_2173, _1915, _2231);
            float _2287 = fma(_2173, _1923, _2235);
            float _2289 = fma(_2173, _1929, _2209);
            float _2291 = fma(_2173, _1935, _2211);
            float _2293 = fma(_2173, _1941, _2213);
            float _2295 = fma(_2173, _1949, _2217);
            float _2297 = fma(_2173, _1955, _2219);
            float _2299 = fma(_2173, _1961, _2221);
            float _2301 = fma(_2173, _1967, _2229);
            float _2303 = fma(_2173, _1971, _2233);
            float _2305 = fma(_2173, _1977, _2237);
            float _2307 = fma(_2173, _1983, _2239);
            float _2309 = fma(_2173, _1989, _2245);
            float _2311 = fma(_2243, _1993, _2247);
            float _2313 = fma(_2243, _1999, _2249);
            float _2315 = fma(_2243, _2005, _2251);
            float _2317 = fma(_2243, _2011, _2253);
            float _2319 = fma(_2243, _2015, _2255);
            float _2321 = fma(_2243, _2021, _2257);
            float _2323 = fma(_2243, _2027, _2259);
            float _2325 = fma(_2243, _2033, _2261);
            float _2327 = fma(_2243, _2037, _2263);
            float _2329 = fma(_2243, _2043, _2265);
            float _2331 = fma(_2243, _2049, _2267);
            float _2333 = fma(_2243, _2055, _2269);
            float _2335 = fma(_2243, _2059, _2271);
            float _2337 = fma(_2243, _2065, _2273);
            float _2339 = fma(_2243, _2071, _2275);
            float _2341 = fma(_2243, _2077, _2277);
            float _2343 = fma(_2243, _2081, _2279);
            float _2345 = fma(_2243, _2087, _2281);
            float _2347 = fma(_2243, _2093, _2283);
            float _2349 = fma(_2243, _2099, _2285);
            float _2351 = fma(_2243, _2103, _2287);
            float _2353 = fma(_2243, _2109, _2289);
            float _2355 = fma(_2243, _2115, _2291);
            float _2357 = fma(_2243, _2121, _2293);
            float _2359 = fma(_2243, _2125, _2295);
            float _2361 = fma(_2243, _2131, _2297);
            float _2363 = fma(_2243, _2137, _2299);
            float _2365 = fma(_2243, _2143, _2301);
            float _2367 = fma(_2243, _2147, _2303);
            float _2369 = fma(_2243, _2153, _2305);
            float _2371 = fma(_2243, _2159, _2307);
            float _2373 = fma(_2243, _2165, _2309);
            _2375 = _2325;
            _2377 = _2321;
            _2379 = _2353;
            _2381 = _2335;
            _2383 = _2319;
            _2385 = _2339;
            _2387 = _2355;
            _2389 = _2337;
            _2391 = _2341;
            _2393 = _2357;
            _2395 = _2323;
            _2397 = _2351;
            _2399 = _2369;
            _2401 = _2317;
            _2403 = _2367;
            _2405 = _2327;
            _2407 = _2329;
            _2409 = _2361;
            _2411 = _2311;
            _2413 = _2313;
            _2415 = _2315;
            _2417 = _2359;
            _2419 = _2371;
            _2421 = _2333;
            _2423 = _2343;
            _2425 = _2363;
            _2427 = _2373;
            _2429 = _2347;
            _2431 = _2349;
            _2433 = _2365;
            _2435 = _2331;
            _2437 = _2345;
            _2439 = true;
        }
        else
        {
            int _2441 = _1561 * 656;
            int _2443 = _2441 + 262144;
            int _2445 = _2441 + 262192;
            int _2447 = _2441 + 262160;
            uint _2449 = uint(int(uint(_2443) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2449)];
            float _2451 = as_type<float>(_dmw24.x);
            int _2453 = _2443 + 4;
            uint _2455 = uint(int(uint(_2453) >> uint(2)));
            float _2457 = as_type<float>(_dmw24.y);
            int _2459 = _2443 + 8;
            uint _2461 = uint(int(uint(_2459) >> uint(2)));
            float _2463 = as_type<float>(_dmw24.z);
            int _2465 = _2443 + 12;
            uint _2467 = uint(int(uint(_2465) >> uint(2)));
            float _2469 = as_type<float>(_dmw24.w);
            int _2471 = _2441 + 262208;
            uint _2473 = uint(int(uint(_2445) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2473)];
            float _2475 = as_type<float>(_dmw27.x);
            int _2477 = _2445 + 4;
            uint _2479 = uint(int(uint(_2477) >> uint(2)));
            float _2481 = as_type<float>(_dmw27.y);
            int _2483 = _2445 + 8;
            uint _2485 = uint(int(uint(_2483) >> uint(2)));
            float _2487 = as_type<float>(_dmw27.z);
            int _2489 = _2445 + 12;
            uint _2491 = uint(int(uint(_2489) >> uint(2)));
            float _2493 = as_type<float>(_dmw27.w);
            int _2495 = _2441 + 262176;
            uint _2497 = uint(int(uint(_2447) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2497)];
            float _2499 = as_type<float>(_dmw25.x);
            int _2501 = _2447 + 4;
            uint _2503 = uint(int(uint(_2501) >> uint(2)));
            float _2505 = as_type<float>(_dmw25.y);
            int _2507 = _2447 + 8;
            uint _2509 = uint(int(uint(_2507) >> uint(2)));
            float _2511 = as_type<float>(_dmw25.z);
            int _2513 = _2447 + 12;
            uint _2515 = uint(int(uint(_2513) >> uint(2)));
            float _2517 = as_type<float>(_dmw25.w);
            int _2519 = _2441 + 262224;
            uint _2521 = uint(int(uint(_2471) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2521)];
            float _2523 = as_type<float>(_dmw28.x);
            int _2525 = _2471 + 4;
            uint _2527 = uint(int(uint(_2525) >> uint(2)));
            float _2529 = as_type<float>(_dmw28.y);
            int _2531 = _2471 + 8;
            uint _2533 = uint(int(uint(_2531) >> uint(2)));
            float _2535 = as_type<float>(_dmw28.z);
            int _2537 = _2471 + 12;
            uint _2539 = uint(int(uint(_2537) >> uint(2)));
            float _2541 = as_type<float>(_dmw28.w);
            int _2543 = _2441 + 262240;
            uint _2545 = uint(int(uint(_2495) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2545)];
            float _2547 = as_type<float>(_dmw26.x);
            int _2549 = _2495 + 4;
            uint _2551 = uint(int(uint(_2549) >> uint(2)));
            float _2553 = as_type<float>(_dmw26.y);
            int _2555 = _2495 + 8;
            uint _2557 = uint(int(uint(_2555) >> uint(2)));
            float _2559 = as_type<float>(_dmw26.z);
            int _2561 = _2495 + 12;
            uint _2563 = uint(int(uint(_2561) >> uint(2)));
            float _2565 = as_type<float>(_dmw26.w);
            int _2567 = _2441 + 262256;
            uint _2569 = uint(int(uint(_2519) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2569)];
            float _2571 = as_type<float>(_dmw29.x);
            int _2573 = _2519 + 4;
            uint _2575 = uint(int(uint(_2573) >> uint(2)));
            float _2577 = as_type<float>(_dmw29.y);
            int _2579 = _2519 + 8;
            uint _2581 = uint(int(uint(_2579) >> uint(2)));
            float _2583 = as_type<float>(_dmw29.z);
            int _2585 = _2519 + 12;
            uint _2587 = uint(int(uint(_2585) >> uint(2)));
            float _2589 = as_type<float>(_dmw29.w);
            int _2591 = _1555 * 656;
            uint _2593 = uint(int(uint(_2543) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2593)];
            float _2595 = as_type<float>(_dmw30.x);
            int _2597 = _2543 + 4;
            uint _2599 = uint(int(uint(_2597) >> uint(2)));
            float _2601 = as_type<float>(_dmw30.y);
            int _2603 = _2543 + 8;
            uint _2605 = uint(int(uint(_2603) >> uint(2)));
            float _2607 = as_type<float>(_dmw30.z);
            int _2609 = _2543 + 12;
            uint _2611 = uint(int(uint(_2609) >> uint(2)));
            float _2613 = as_type<float>(_dmw30.w);
            int _2615 = _1575 * 656;
            int _2617 = _2591 + 262144;
            uint _2619 = uint(int(uint(_2567) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2619)];
            float _2621 = as_type<float>(_dmw31.x);
            int _2623 = _2567 + 4;
            uint _2625 = uint(int(uint(_2623) >> uint(2)));
            float _2627 = as_type<float>(_dmw31.y);
            int _2629 = _2567 + 8;
            uint _2631 = uint(int(uint(_2629) >> uint(2)));
            float _2633 = as_type<float>(_dmw31.z);
            int _2635 = _2567 + 12;
            uint _2637 = uint(int(uint(_2635) >> uint(2)));
            float _2639 = as_type<float>(_dmw31.w);
            int _2641 = _2591 + 262192;
            int _2643 = _2591 + 262160;
            uint _2645 = uint(int(uint(_2617) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2645)];
            float _2647 = as_type<float>(_dmw32.x);
            int _2649 = _2617 + 4;
            uint _2651 = uint(int(uint(_2649) >> uint(2)));
            float _2653 = as_type<float>(_dmw32.y);
            int _2655 = _2617 + 8;
            uint _2657 = uint(int(uint(_2655) >> uint(2)));
            float _2659 = as_type<float>(_dmw32.z);
            int _2661 = _2617 + 12;
            uint _2663 = uint(int(uint(_2661) >> uint(2)));
            float _2665 = as_type<float>(_dmw32.w);
            int _2667 = _2591 + 262208;
            int _2669 = _2591 + 262176;
            uint _2671 = uint(int(uint(_2641) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2671)];
            float _2673 = as_type<float>(_dmw35.x);
            int _2675 = _2641 + 4;
            uint _2677 = uint(int(uint(_2675) >> uint(2)));
            float _2679 = as_type<float>(_dmw35.y);
            int _2681 = _2641 + 8;
            uint _2683 = uint(int(uint(_2681) >> uint(2)));
            float _2685 = as_type<float>(_dmw35.z);
            int _2687 = _2641 + 12;
            uint _2689 = uint(int(uint(_2687) >> uint(2)));
            float _2691 = as_type<float>(_dmw35.w);
            int _2693 = _2591 + 262224;
            int _2695 = _2591 + 262240;
            uint _2697 = uint(int(uint(_2643) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2697)];
            float _2699 = as_type<float>(_dmw33.x);
            int _2701 = _2643 + 4;
            uint _2703 = uint(int(uint(_2701) >> uint(2)));
            float _2705 = as_type<float>(_dmw33.y);
            int _2707 = _2643 + 8;
            uint _2709 = uint(int(uint(_2707) >> uint(2)));
            float _2711 = as_type<float>(_dmw33.z);
            int _2713 = _2643 + 12;
            uint _2715 = uint(int(uint(_2713) >> uint(2)));
            float _2717 = as_type<float>(_dmw33.w);
            int _2719 = _2591 + 262256;
            int _2721 = _2615 + 262144;
            uint _2723 = uint(int(uint(_2667) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2723)];
            float _2725 = as_type<float>(_dmw36.x);
            int _2727 = _2667 + 4;
            uint _2729 = uint(int(uint(_2727) >> uint(2)));
            float _2731 = as_type<float>(_dmw36.y);
            int _2733 = _2667 + 8;
            uint _2735 = uint(int(uint(_2733) >> uint(2)));
            float _2737 = as_type<float>(_dmw36.z);
            int _2739 = _2667 + 12;
            uint _2741 = uint(int(uint(_2739) >> uint(2)));
            float _2743 = as_type<float>(_dmw36.w);
            int _2745 = _2615 + 262192;
            int _2747 = _2615 + 262160;
            uint _2749 = uint(int(uint(_2669) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2749)];
            float _2751 = as_type<float>(_dmw34.x);
            int _2753 = _2669 + 4;
            uint _2755 = uint(int(uint(_2753) >> uint(2)));
            float _2757 = as_type<float>(_dmw34.y);
            int _2759 = _2669 + 8;
            uint _2761 = uint(int(uint(_2759) >> uint(2)));
            float _2763 = as_type<float>(_dmw34.z);
            int _2765 = _2669 + 12;
            uint _2767 = uint(int(uint(_2765) >> uint(2)));
            float _2769 = as_type<float>(_dmw34.w);
            int _2771 = _2615 + 262208;
            int _2773 = _2615 + 262176;
            uint _2775 = uint(int(uint(_2693) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
            float _2777 = as_type<float>(_dmw37.x);
            int _2779 = _2693 + 4;
            uint _2781 = uint(int(uint(_2779) >> uint(2)));
            float _2783 = as_type<float>(_dmw37.y);
            int _2785 = _2693 + 8;
            uint _2787 = uint(int(uint(_2785) >> uint(2)));
            float _2789 = as_type<float>(_dmw37.z);
            int _2791 = _2693 + 12;
            uint _2793 = uint(int(uint(_2791) >> uint(2)));
            float _2795 = as_type<float>(_dmw37.w);
            int _2797 = _2615 + 262224;
            int _2799 = _2615 + 262240;
            uint _2801 = uint(int(uint(_2695) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2801)];
            float _2803 = as_type<float>(_dmw38.x);
            int _2805 = _2695 + 4;
            uint _2807 = uint(int(uint(_2805) >> uint(2)));
            float _2809 = as_type<float>(_dmw38.y);
            int _2811 = _2695 + 8;
            uint _2813 = uint(int(uint(_2811) >> uint(2)));
            float _2815 = as_type<float>(_dmw38.z);
            int _2817 = _2695 + 12;
            uint _2819 = uint(int(uint(_2817) >> uint(2)));
            float _2821 = as_type<float>(_dmw38.w);
            int _2823 = _2615 + 262256;
            uint _2825 = uint(int(uint(_2719) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2825)];
            float _2827 = as_type<float>(_dmw39.x);
            int _2829 = _2719 + 4;
            uint _2831 = uint(int(uint(_2829) >> uint(2)));
            float _2833 = as_type<float>(_dmw39.y);
            int _2835 = _2719 + 8;
            uint _2837 = uint(int(uint(_2835) >> uint(2)));
            float _2839 = as_type<float>(_dmw39.z);
            int _2841 = _2719 + 12;
            uint _2843 = uint(int(uint(_2841) >> uint(2)));
            float _2845 = as_type<float>(_dmw39.w);
            uint _2847 = uint(int(uint(_2721) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2847)];
            float _2849 = as_type<float>(_dmw40.x);
            int _2851 = _2721 + 4;
            uint _2853 = uint(int(uint(_2851) >> uint(2)));
            float _2855 = as_type<float>(_dmw40.y);
            int _2857 = _2721 + 8;
            uint _2859 = uint(int(uint(_2857) >> uint(2)));
            float _2861 = as_type<float>(_dmw40.z);
            int _2863 = _2721 + 12;
            uint _2865 = uint(int(uint(_2863) >> uint(2)));
            float _2867 = as_type<float>(_dmw40.w);
            uint _2869 = uint(int(uint(_2745) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2869)];
            float _2871 = as_type<float>(_dmw43.x);
            int _2873 = _2745 + 4;
            uint _2875 = uint(int(uint(_2873) >> uint(2)));
            float _2877 = as_type<float>(_dmw43.y);
            int _2879 = _2745 + 8;
            uint _2881 = uint(int(uint(_2879) >> uint(2)));
            float _2883 = as_type<float>(_dmw43.z);
            int _2885 = _2745 + 12;
            uint _2887 = uint(int(uint(_2885) >> uint(2)));
            float _2889 = as_type<float>(_dmw43.w);
            uint _2891 = uint(int(uint(_2747) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2891)];
            float _2893 = as_type<float>(_dmw41.x);
            int _2895 = _2747 + 4;
            uint _2897 = uint(int(uint(_2895) >> uint(2)));
            float _2899 = as_type<float>(_dmw41.y);
            int _2901 = _2747 + 8;
            uint _2903 = uint(int(uint(_2901) >> uint(2)));
            float _2905 = as_type<float>(_dmw41.z);
            int _2907 = _2747 + 12;
            uint _2909 = uint(int(uint(_2907) >> uint(2)));
            float _2911 = as_type<float>(_dmw41.w);
            uint _2913 = uint(int(uint(_2771) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2913)];
            float _2915 = as_type<float>(_dmw44.x);
            int _2917 = _2771 + 4;
            uint _2919 = uint(int(uint(_2917) >> uint(2)));
            float _2921 = as_type<float>(_dmw44.y);
            int _2923 = _2771 + 8;
            uint _2925 = uint(int(uint(_2923) >> uint(2)));
            float _2927 = as_type<float>(_dmw44.z);
            int _2929 = _2771 + 12;
            uint _2931 = uint(int(uint(_2929) >> uint(2)));
            float _2933 = as_type<float>(_dmw44.w);
            uint _2935 = uint(int(uint(_2773) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2935)];
            float _2937 = as_type<float>(_dmw42.x);
            int _2939 = _2773 + 4;
            uint _2941 = uint(int(uint(_2939) >> uint(2)));
            float _2943 = as_type<float>(_dmw42.y);
            int _2945 = _2773 + 8;
            uint _2947 = uint(int(uint(_2945) >> uint(2)));
            float _2949 = as_type<float>(_dmw42.z);
            int _2951 = _2773 + 12;
            uint _2953 = uint(int(uint(_2951) >> uint(2)));
            float _2955 = as_type<float>(_dmw42.w);
            uint _2957 = uint(int(uint(_2797) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2957)];
            float _2959 = as_type<float>(_dmw45.x);
            int _2961 = _2797 + 4;
            uint _2963 = uint(int(uint(_2961) >> uint(2)));
            float _2965 = as_type<float>(_dmw45.y);
            int _2967 = _2797 + 8;
            uint _2969 = uint(int(uint(_2967) >> uint(2)));
            float _2971 = as_type<float>(_dmw45.z);
            int _2973 = _2797 + 12;
            uint _2975 = uint(int(uint(_2973) >> uint(2)));
            float _2977 = as_type<float>(_dmw45.w);
            uint _2979 = uint(int(uint(_2799) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2979)];
            float _2981 = as_type<float>(_dmw46.x);
            int _2983 = _2799 + 4;
            uint _2985 = uint(int(uint(_2983) >> uint(2)));
            float _2987 = as_type<float>(_dmw46.y);
            int _2989 = _2799 + 8;
            uint _2991 = uint(int(uint(_2989) >> uint(2)));
            float _2993 = as_type<float>(_dmw46.z);
            int _2995 = _2799 + 12;
            uint _2997 = uint(int(uint(_2995) >> uint(2)));
            float _2999 = as_type<float>(_dmw46.w);
            uint _3001 = uint(int(uint(_2823) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3001)];
            float _3003 = as_type<float>(_dmw47.x);
            int _3005 = _2823 + 4;
            uint _3007 = uint(int(uint(_3005) >> uint(2)));
            float _3009 = as_type<float>(_dmw47.y);
            int _3011 = _2823 + 8;
            uint _3013 = uint(int(uint(_3011) >> uint(2)));
            float _3015 = as_type<float>(_dmw47.z);
            int _3017 = _2823 + 12;
            uint _3019 = uint(int(uint(_3017) >> uint(2)));
            float _3021 = as_type<float>(_dmw47.w);
            float _3023 = _1501 + (-1.0);
            float _3025 = _1479 + (-1.0);
            float _3027 = _1479 + _3023;
            float _3029 = -_3023;
            float _3031 = _2451 * _3029;
            float _3033 = -_3023;
            float _3035 = _2457 * _3033;
            float _3037 = -_3023;
            float _3039 = _2463 * _3037;
            float _3041 = -_3023;
            float _3043 = _2469 * _3041;
            float _3045 = -_3023;
            float _3047 = _2475 * _3045;
            float _3049 = -_3023;
            float _3051 = _2481 * _3049;
            float _3053 = -_3023;
            float _3055 = _2487 * _3053;
            float _3057 = -_3023;
            float _3059 = _2493 * _3057;
            float _3061 = -_3023;
            float _3063 = _2499 * _3061;
            float _3065 = -_3023;
            float _3067 = _2505 * _3065;
            float _3069 = -_3023;
            float _3071 = _2511 * _3069;
            float _3073 = -_3023;
            float _3075 = _2517 * _3073;
            float _3077 = -_3023;
            float _3079 = _2523 * _3077;
            float _3081 = -_3023;
            float _3083 = _2529 * _3081;
            float _3085 = -_3023;
            float _3087 = _2535 * _3085;
            float _3089 = -_3023;
            float _3091 = _2541 * _3089;
            float _3093 = -_3023;
            float _3095 = _2547 * _3093;
            float _3097 = -_3023;
            float _3099 = _2553 * _3097;
            float _3101 = -_3023;
            float _3103 = _2559 * _3101;
            float _3105 = -_3023;
            float _3107 = _2565 * _3105;
            float _3109 = -_3023;
            float _3111 = _2571 * _3109;
            float _3113 = -_3023;
            float _3115 = _2577 * _3113;
            float _3117 = -_3023;
            float _3119 = _2583 * _3117;
            float _3121 = -_3023;
            float _3123 = _2589 * _3121;
            float _3125 = -_3023;
            float _3127 = _2595 * _3125;
            float _3129 = -_3023;
            float _3131 = _2601 * _3129;
            float _3133 = -_3023;
            float _3135 = _2607 * _3133;
            float _3137 = -_3023;
            float _3139 = _2613 * _3137;
            float _3141 = -_3023;
            float _3143 = _2621 * _3141;
            float _3145 = -_3023;
            float _3147 = _2627 * _3145;
            float _3149 = -_3023;
            float _3151 = _2633 * _3149;
            float _3153 = -_3023;
            float _3155 = _2639 * _3153;
            float _3157 = -_3025;
            float _3159 = fma(_3157, _2647, _3031);
            float _3161 = -_3025;
            float _3163 = fma(_3161, _2653, _3035);
            float _3165 = -_3025;
            float _3167 = fma(_3165, _2659, _3039);
            float _3169 = -_3025;
            float _3171 = fma(_3169, _2665, _3043);
            float _3173 = -_3025;
            float _3175 = fma(_3173, _2673, _3047);
            float _3177 = -_3025;
            float _3179 = fma(_3177, _2679, _3051);
            float _3181 = -_3025;
            float _3183 = fma(_3181, _2685, _3055);
            float _3185 = -_3025;
            float _3187 = fma(_3185, _2691, _3059);
            float _3189 = -_3025;
            float _3191 = fma(_3189, _2699, _3063);
            float _3193 = -_3025;
            float _3195 = fma(_3193, _2705, _3067);
            float _3197 = -_3025;
            float _3199 = fma(_3197, _2711, _3071);
            float _3201 = -_3025;
            float _3203 = fma(_3201, _2717, _3075);
            float _3205 = -_3025;
            float _3207 = fma(_3205, _2725, _3079);
            float _3209 = -_3025;
            float _3211 = fma(_3209, _2731, _3083);
            float _3213 = -_3025;
            float _3215 = fma(_3213, _2737, _3087);
            float _3217 = -_3025;
            float _3219 = fma(_3217, _2743, _3091);
            float _3221 = -_3025;
            float _3223 = fma(_3221, _2751, _3095);
            float _3225 = -_3025;
            float _3227 = fma(_3225, _2757, _3099);
            float _3229 = -_3025;
            float _3231 = fma(_3229, _2763, _3103);
            float _3233 = -_3025;
            float _3235 = fma(_3233, _2769, _3107);
            float _3237 = -_3025;
            float _3239 = fma(_3237, _2777, _3111);
            float _3241 = -_3025;
            float _3243 = fma(_3241, _2783, _3115);
            float _3245 = -_3025;
            float _3247 = fma(_3245, _2789, _3119);
            float _3249 = -_3025;
            float _3251 = fma(_3249, _2795, _3123);
            float _3253 = -_3025;
            float _3255 = fma(_3253, _2803, _3127);
            float _3257 = -_3025;
            float _3259 = fma(_3257, _2809, _3131);
            float _3261 = -_3025;
            float _3263 = fma(_3261, _2815, _3135);
            float _3265 = -_3025;
            float _3267 = fma(_3265, _2821, _3139);
            float _3269 = -_3025;
            float _3271 = fma(_3269, _2827, _3143);
            float _3273 = -_3025;
            float _3275 = fma(_3273, _2833, _3147);
            float _3277 = -_3025;
            float _3279 = fma(_3277, _2839, _3151);
            float _3281 = -_3025;
            float _3283 = fma(_3281, _2845, _3155);
            float _3285 = fma(_3027, _2849, _3159);
            float _3287 = fma(_3027, _2855, _3163);
            float _3289 = fma(_3027, _2861, _3167);
            float _3291 = fma(_3027, _2867, _3171);
            float _3293 = fma(_3027, _2871, _3175);
            float _3295 = fma(_3027, _2877, _3179);
            float _3297 = fma(_3027, _2883, _3183);
            float _3299 = fma(_3027, _2889, _3187);
            float _3301 = fma(_3027, _2893, _3191);
            float _3303 = fma(_3027, _2899, _3195);
            float _3305 = fma(_3027, _2905, _3199);
            float _3307 = fma(_3027, _2911, _3203);
            float _3309 = fma(_3027, _2915, _3207);
            float _3311 = fma(_3027, _2921, _3211);
            float _3313 = fma(_3027, _2927, _3215);
            float _3315 = fma(_3027, _2933, _3219);
            float _3317 = fma(_3027, _2937, _3223);
            float _3319 = fma(_3027, _2943, _3227);
            float _3321 = fma(_3027, _2949, _3231);
            float _3323 = fma(_3027, _2955, _3235);
            float _3325 = fma(_3027, _2959, _3239);
            float _3327 = fma(_3027, _2965, _3243);
            float _3329 = fma(_3027, _2971, _3247);
            float _3331 = fma(_3027, _2977, _3251);
            float _3333 = fma(_3027, _2981, _3255);
            float _3335 = fma(_3027, _2987, _3259);
            float _3337 = fma(_3027, _2993, _3263);
            float _3339 = fma(_3027, _2999, _3267);
            float _3341 = fma(_3027, _3003, _3271);
            float _3343 = fma(_3027, _3009, _3275);
            float _3345 = fma(_3027, _3015, _3279);
            float _3347 = fma(_3027, _3021, _3283);
            _2375 = _3299;
            _2377 = _3295;
            _2379 = _3327;
            _2381 = _3309;
            _2383 = _3293;
            _2385 = _3313;
            _2387 = _3329;
            _2389 = _3311;
            _2391 = _3315;
            _2393 = _3331;
            _2395 = _3297;
            _2397 = _3325;
            _2399 = _3343;
            _2401 = _3291;
            _2403 = _3341;
            _2405 = _3301;
            _2407 = _3303;
            _2409 = _3335;
            _2411 = _3285;
            _2413 = _3287;
            _2415 = _3289;
            _2417 = _3333;
            _2419 = _3345;
            _2421 = _3307;
            _2423 = _3317;
            _2425 = _3337;
            _2427 = _3347;
            _2429 = _3321;
            _2431 = _3323;
            _2433 = _3339;
            _2435 = _3305;
            _2437 = _3319;
            _2439 = true;
        }
    }
    else
    {
        float _3349 = _1479 * (-0.707106769084930419921875);
        float _3351 = _1501 + (-1.0);
        float _3353 = _1479 + (-1.0);
        float _3355 = fma(_1501, 0.707106769084930419921875, _3349);
        bool _3357 = _3355 >= 0.0;
        bool _3359 = !_3357;
        if (!_3359)
        {
            int _3361 = _1555 * 656;
            int _3363 = _3361 + 262144;
            int _3365 = _3361 + 262192;
            int _3367 = _3361 + 262160;
            uint _3369 = uint(int(uint(_3363) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3369)];
            float _3371 = as_type<float>(_dmw48.x);
            int _3373 = _3363 + 4;
            uint _3375 = uint(int(uint(_3373) >> uint(2)));
            float _3377 = as_type<float>(_dmw48.y);
            int _3379 = _3363 + 8;
            uint _3381 = uint(int(uint(_3379) >> uint(2)));
            float _3383 = as_type<float>(_dmw48.z);
            int _3385 = _3363 + 12;
            uint _3387 = uint(int(uint(_3385) >> uint(2)));
            float _3389 = as_type<float>(_dmw48.w);
            int _3391 = _3361 + 262208;
            uint _3393 = uint(int(uint(_3365) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3393)];
            float _3395 = as_type<float>(_dmw51.x);
            int _3397 = _3365 + 4;
            uint _3399 = uint(int(uint(_3397) >> uint(2)));
            float _3401 = as_type<float>(_dmw51.y);
            int _3403 = _3365 + 8;
            uint _3405 = uint(int(uint(_3403) >> uint(2)));
            float _3407 = as_type<float>(_dmw51.z);
            int _3409 = _3365 + 12;
            uint _3411 = uint(int(uint(_3409) >> uint(2)));
            float _3413 = as_type<float>(_dmw51.w);
            int _3415 = _3361 + 262176;
            uint _3417 = uint(int(uint(_3367) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3417)];
            float _3419 = as_type<float>(_dmw49.x);
            int _3421 = _3367 + 4;
            uint _3423 = uint(int(uint(_3421) >> uint(2)));
            float _3425 = as_type<float>(_dmw49.y);
            int _3427 = _3367 + 8;
            uint _3429 = uint(int(uint(_3427) >> uint(2)));
            float _3431 = as_type<float>(_dmw49.z);
            int _3433 = _3367 + 12;
            uint _3435 = uint(int(uint(_3433) >> uint(2)));
            float _3437 = as_type<float>(_dmw49.w);
            int _3439 = _3361 + 262224;
            uint _3441 = uint(int(uint(_3391) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3441)];
            float _3443 = as_type<float>(_dmw52.x);
            int _3445 = _3391 + 4;
            uint _3447 = uint(int(uint(_3445) >> uint(2)));
            float _3449 = as_type<float>(_dmw52.y);
            int _3451 = _3391 + 8;
            uint _3453 = uint(int(uint(_3451) >> uint(2)));
            float _3455 = as_type<float>(_dmw52.z);
            int _3457 = _3391 + 12;
            uint _3459 = uint(int(uint(_3457) >> uint(2)));
            float _3461 = as_type<float>(_dmw52.w);
            int _3463 = _3361 + 262240;
            uint _3465 = uint(int(uint(_3415) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3465)];
            float _3467 = as_type<float>(_dmw50.x);
            int _3469 = _3415 + 4;
            uint _3471 = uint(int(uint(_3469) >> uint(2)));
            float _3473 = as_type<float>(_dmw50.y);
            int _3475 = _3415 + 8;
            uint _3477 = uint(int(uint(_3475) >> uint(2)));
            float _3479 = as_type<float>(_dmw50.z);
            int _3481 = _3415 + 12;
            uint _3483 = uint(int(uint(_3481) >> uint(2)));
            float _3485 = as_type<float>(_dmw50.w);
            int _3487 = _3361 + 262256;
            uint _3489 = uint(int(uint(_3439) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3489)];
            float _3491 = as_type<float>(_dmw53.x);
            int _3493 = _3439 + 4;
            uint _3495 = uint(int(uint(_3493) >> uint(2)));
            float _3497 = as_type<float>(_dmw53.y);
            int _3499 = _3439 + 8;
            uint _3501 = uint(int(uint(_3499) >> uint(2)));
            float _3503 = as_type<float>(_dmw53.z);
            int _3505 = _3439 + 12;
            uint _3507 = uint(int(uint(_3505) >> uint(2)));
            float _3509 = as_type<float>(_dmw53.w);
            int _3511 = _1503 * 656;
            uint _3513 = uint(int(uint(_3463) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3513)];
            float _3515 = as_type<float>(_dmw54.x);
            int _3517 = _3463 + 4;
            uint _3519 = uint(int(uint(_3517) >> uint(2)));
            float _3521 = as_type<float>(_dmw54.y);
            int _3523 = _3463 + 8;
            uint _3525 = uint(int(uint(_3523) >> uint(2)));
            float _3527 = as_type<float>(_dmw54.z);
            int _3529 = _3463 + 12;
            uint _3531 = uint(int(uint(_3529) >> uint(2)));
            float _3533 = as_type<float>(_dmw54.w);
            int _3535 = _1575 * 656;
            int _3537 = _3511 + 262144;
            uint _3539 = uint(int(uint(_3487) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3539)];
            float _3541 = as_type<float>(_dmw55.x);
            int _3543 = _3487 + 4;
            uint _3545 = uint(int(uint(_3543) >> uint(2)));
            float _3547 = as_type<float>(_dmw55.y);
            int _3549 = _3487 + 8;
            uint _3551 = uint(int(uint(_3549) >> uint(2)));
            float _3553 = as_type<float>(_dmw55.z);
            int _3555 = _3487 + 12;
            uint _3557 = uint(int(uint(_3555) >> uint(2)));
            float _3559 = as_type<float>(_dmw55.w);
            int _3561 = _3511 + 262192;
            int _3563 = _3511 + 262160;
            uint _3565 = uint(int(uint(_3537) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3565)];
            float _3567 = as_type<float>(_dmw56.x);
            int _3569 = _3537 + 4;
            uint _3571 = uint(int(uint(_3569) >> uint(2)));
            float _3573 = as_type<float>(_dmw56.y);
            int _3575 = _3537 + 8;
            uint _3577 = uint(int(uint(_3575) >> uint(2)));
            float _3579 = as_type<float>(_dmw56.z);
            int _3581 = _3537 + 12;
            uint _3583 = uint(int(uint(_3581) >> uint(2)));
            float _3585 = as_type<float>(_dmw56.w);
            int _3587 = _3511 + 262208;
            int _3589 = _3511 + 262176;
            uint _3591 = uint(int(uint(_3561) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3591)];
            float _3593 = as_type<float>(_dmw59.x);
            int _3595 = _3561 + 4;
            uint _3597 = uint(int(uint(_3595) >> uint(2)));
            float _3599 = as_type<float>(_dmw59.y);
            int _3601 = _3561 + 8;
            uint _3603 = uint(int(uint(_3601) >> uint(2)));
            float _3605 = as_type<float>(_dmw59.z);
            int _3607 = _3561 + 12;
            uint _3609 = uint(int(uint(_3607) >> uint(2)));
            float _3611 = as_type<float>(_dmw59.w);
            int _3613 = _3511 + 262224;
            int _3615 = _3511 + 262240;
            uint _3617 = uint(int(uint(_3563) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3617)];
            float _3619 = as_type<float>(_dmw57.x);
            int _3621 = _3563 + 4;
            uint _3623 = uint(int(uint(_3621) >> uint(2)));
            float _3625 = as_type<float>(_dmw57.y);
            int _3627 = _3563 + 8;
            uint _3629 = uint(int(uint(_3627) >> uint(2)));
            float _3631 = as_type<float>(_dmw57.z);
            int _3633 = _3563 + 12;
            uint _3635 = uint(int(uint(_3633) >> uint(2)));
            float _3637 = as_type<float>(_dmw57.w);
            int _3639 = _3511 + 262256;
            int _3641 = _3535 + 262144;
            uint _3643 = uint(int(uint(_3587) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3643)];
            float _3645 = as_type<float>(_dmw60.x);
            int _3647 = _3587 + 4;
            uint _3649 = uint(int(uint(_3647) >> uint(2)));
            float _3651 = as_type<float>(_dmw60.y);
            int _3653 = _3587 + 8;
            uint _3655 = uint(int(uint(_3653) >> uint(2)));
            float _3657 = as_type<float>(_dmw60.z);
            int _3659 = _3587 + 12;
            uint _3661 = uint(int(uint(_3659) >> uint(2)));
            float _3663 = as_type<float>(_dmw60.w);
            int _3665 = _3535 + 262192;
            int _3667 = _3535 + 262160;
            uint _3669 = uint(int(uint(_3589) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3669)];
            float _3671 = as_type<float>(_dmw58.x);
            int _3673 = _3589 + 4;
            uint _3675 = uint(int(uint(_3673) >> uint(2)));
            float _3677 = as_type<float>(_dmw58.y);
            int _3679 = _3589 + 8;
            uint _3681 = uint(int(uint(_3679) >> uint(2)));
            float _3683 = as_type<float>(_dmw58.z);
            int _3685 = _3589 + 12;
            uint _3687 = uint(int(uint(_3685) >> uint(2)));
            float _3689 = as_type<float>(_dmw58.w);
            int _3691 = _3535 + 262208;
            int _3693 = _3535 + 262176;
            uint _3695 = uint(int(uint(_3613) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3695)];
            float _3697 = as_type<float>(_dmw61.x);
            int _3699 = _3613 + 4;
            uint _3701 = uint(int(uint(_3699) >> uint(2)));
            float _3703 = as_type<float>(_dmw61.y);
            int _3705 = _3613 + 8;
            uint _3707 = uint(int(uint(_3705) >> uint(2)));
            float _3709 = as_type<float>(_dmw61.z);
            int _3711 = _3613 + 12;
            uint _3713 = uint(int(uint(_3711) >> uint(2)));
            float _3715 = as_type<float>(_dmw61.w);
            int _3717 = _3535 + 262224;
            int _3719 = _3535 + 262240;
            uint _3721 = uint(int(uint(_3615) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3721)];
            float _3723 = as_type<float>(_dmw62.x);
            int _3725 = _3615 + 4;
            uint _3727 = uint(int(uint(_3725) >> uint(2)));
            float _3729 = as_type<float>(_dmw62.y);
            int _3731 = _3615 + 8;
            uint _3733 = uint(int(uint(_3731) >> uint(2)));
            float _3735 = as_type<float>(_dmw62.z);
            int _3737 = _3615 + 12;
            uint _3739 = uint(int(uint(_3737) >> uint(2)));
            float _3741 = as_type<float>(_dmw62.w);
            int _3743 = _3535 + 262256;
            uint _3745 = uint(int(uint(_3639) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3745)];
            float _3747 = as_type<float>(_dmw63.x);
            int _3749 = _3639 + 4;
            uint _3751 = uint(int(uint(_3749) >> uint(2)));
            float _3753 = as_type<float>(_dmw63.y);
            int _3755 = _3639 + 8;
            uint _3757 = uint(int(uint(_3755) >> uint(2)));
            float _3759 = as_type<float>(_dmw63.z);
            int _3761 = _3639 + 12;
            uint _3763 = uint(int(uint(_3761) >> uint(2)));
            float _3765 = as_type<float>(_dmw63.w);
            uint _3767 = uint(int(uint(_3641) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3767)];
            float _3769 = as_type<float>(_dmw64.x);
            int _3771 = _3641 + 4;
            uint _3773 = uint(int(uint(_3771) >> uint(2)));
            float _3775 = as_type<float>(_dmw64.y);
            int _3777 = _3641 + 8;
            uint _3779 = uint(int(uint(_3777) >> uint(2)));
            float _3781 = as_type<float>(_dmw64.z);
            int _3783 = _3641 + 12;
            uint _3785 = uint(int(uint(_3783) >> uint(2)));
            float _3787 = as_type<float>(_dmw64.w);
            uint _3789 = uint(int(uint(_3665) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3789)];
            float _3791 = as_type<float>(_dmw67.x);
            int _3793 = _3665 + 4;
            uint _3795 = uint(int(uint(_3793) >> uint(2)));
            float _3797 = as_type<float>(_dmw67.y);
            int _3799 = _3665 + 8;
            uint _3801 = uint(int(uint(_3799) >> uint(2)));
            float _3803 = as_type<float>(_dmw67.z);
            int _3805 = _3665 + 12;
            uint _3807 = uint(int(uint(_3805) >> uint(2)));
            float _3809 = as_type<float>(_dmw67.w);
            uint _3811 = uint(int(uint(_3667) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3811)];
            float _3813 = as_type<float>(_dmw65.x);
            int _3815 = _3667 + 4;
            uint _3817 = uint(int(uint(_3815) >> uint(2)));
            float _3819 = as_type<float>(_dmw65.y);
            int _3821 = _3667 + 8;
            uint _3823 = uint(int(uint(_3821) >> uint(2)));
            float _3825 = as_type<float>(_dmw65.z);
            int _3827 = _3667 + 12;
            uint _3829 = uint(int(uint(_3827) >> uint(2)));
            float _3831 = as_type<float>(_dmw65.w);
            uint _3833 = uint(int(uint(_3691) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3833)];
            float _3835 = as_type<float>(_dmw68.x);
            int _3837 = _3691 + 4;
            uint _3839 = uint(int(uint(_3837) >> uint(2)));
            float _3841 = as_type<float>(_dmw68.y);
            int _3843 = _3691 + 8;
            uint _3845 = uint(int(uint(_3843) >> uint(2)));
            float _3847 = as_type<float>(_dmw68.z);
            int _3849 = _3691 + 12;
            uint _3851 = uint(int(uint(_3849) >> uint(2)));
            float _3853 = as_type<float>(_dmw68.w);
            uint _3855 = uint(int(uint(_3693) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3855)];
            float _3857 = as_type<float>(_dmw66.x);
            int _3859 = _3693 + 4;
            uint _3861 = uint(int(uint(_3859) >> uint(2)));
            float _3863 = as_type<float>(_dmw66.y);
            int _3865 = _3693 + 8;
            uint _3867 = uint(int(uint(_3865) >> uint(2)));
            float _3869 = as_type<float>(_dmw66.z);
            int _3871 = _3693 + 12;
            uint _3873 = uint(int(uint(_3871) >> uint(2)));
            float _3875 = as_type<float>(_dmw66.w);
            uint _3877 = uint(int(uint(_3717) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3877)];
            float _3879 = as_type<float>(_dmw69.x);
            int _3881 = _3717 + 4;
            uint _3883 = uint(int(uint(_3881) >> uint(2)));
            float _3885 = as_type<float>(_dmw69.y);
            int _3887 = _3717 + 8;
            uint _3889 = uint(int(uint(_3887) >> uint(2)));
            float _3891 = as_type<float>(_dmw69.z);
            int _3893 = _3717 + 12;
            uint _3895 = uint(int(uint(_3893) >> uint(2)));
            float _3897 = as_type<float>(_dmw69.w);
            uint _3899 = uint(int(uint(_3719) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3899)];
            float _3901 = as_type<float>(_dmw70.x);
            int _3903 = _3719 + 4;
            uint _3905 = uint(int(uint(_3903) >> uint(2)));
            float _3907 = as_type<float>(_dmw70.y);
            int _3909 = _3719 + 8;
            uint _3911 = uint(int(uint(_3909) >> uint(2)));
            float _3913 = as_type<float>(_dmw70.z);
            int _3915 = _3719 + 12;
            uint _3917 = uint(int(uint(_3915) >> uint(2)));
            float _3919 = as_type<float>(_dmw70.w);
            uint _3921 = uint(int(uint(_3743) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3921)];
            float _3923 = as_type<float>(_dmw71.x);
            int _3925 = _3743 + 4;
            uint _3927 = uint(int(uint(_3925) >> uint(2)));
            float _3929 = as_type<float>(_dmw71.y);
            int _3931 = _3743 + 8;
            uint _3933 = uint(int(uint(_3931) >> uint(2)));
            float _3935 = as_type<float>(_dmw71.z);
            int _3937 = _3743 + 12;
            uint _3939 = uint(int(uint(_3937) >> uint(2)));
            float _3941 = as_type<float>(_dmw71.w);
            float _3943 = -_3353;
            float _3945 = _3351 + _3943;
            float _3947 = -_3945;
            float _3949 = _1501 + _3947;
            float _3951 = _3371 * _3945;
            float _3953 = _3377 * _3945;
            float _3955 = _3383 * _3945;
            float _3957 = _3389 * _3945;
            float _3959 = _3395 * _3945;
            float _3961 = _3401 * _3945;
            float _3963 = _3407 * _3945;
            float _3965 = _3413 * _3945;
            float _3967 = _3419 * _3945;
            float _3969 = _3425 * _3945;
            float _3971 = _3431 * _3945;
            float _3973 = _3437 * _3945;
            float _3975 = _3443 * _3945;
            float _3977 = _3449 * _3945;
            float _3979 = _3455 * _3945;
            float _3981 = _3461 * _3945;
            float _3983 = _3467 * _3945;
            float _3985 = _3473 * _3945;
            float _3987 = _3479 * _3945;
            float _3989 = _3485 * _3945;
            float _3991 = _3491 * _3945;
            float _3993 = _3497 * _3945;
            float _3995 = _3503 * _3945;
            float _3997 = _3509 * _3945;
            float _3999 = _3515 * _3945;
            float _4001 = _3521 * _3945;
            float _4003 = _3527 * _3945;
            float _4005 = _3533 * _3945;
            float _4007 = _3541 * _3945;
            float _4009 = _3547 * _3945;
            float _4011 = _3553 * _3945;
            float _4013 = _3559 * _3945;
            float _4015 = -_3351;
            float _4017 = fma(_3567, _4015, _3951);
            float _4019 = -_3351;
            float _4021 = fma(_3573, _4019, _3953);
            float _4023 = -_3351;
            float _4025 = fma(_3579, _4023, _3955);
            float _4027 = -_3351;
            float _4029 = fma(_3585, _4027, _3957);
            float _4031 = -_3351;
            float _4033 = fma(_3593, _4031, _3959);
            float _4035 = -_3351;
            float _4037 = fma(_3599, _4035, _3961);
            float _4039 = -_3351;
            float _4041 = fma(_3605, _4039, _3963);
            float _4043 = -_3351;
            float _4045 = fma(_3611, _4043, _3965);
            float _4047 = -_3351;
            float _4049 = fma(_3619, _4047, _3967);
            float _4051 = -_3351;
            float _4053 = fma(_3625, _4051, _3969);
            float _4055 = -_3351;
            float _4057 = fma(_3631, _4055, _3971);
            float _4059 = -_3351;
            float _4061 = fma(_3637, _4059, _3973);
            float _4063 = -_3351;
            float _4065 = fma(_3645, _4063, _3975);
            float _4067 = -_3351;
            float _4069 = fma(_3651, _4067, _3977);
            float _4071 = -_3351;
            float _4073 = fma(_3657, _4071, _3979);
            float _4075 = -_3351;
            float _4077 = fma(_3663, _4075, _3981);
            float _4079 = -_3351;
            float _4081 = fma(_3671, _4079, _3983);
            float _4083 = -_3351;
            float _4085 = fma(_3677, _4083, _3985);
            float _4087 = -_3351;
            float _4089 = fma(_3683, _4087, _3987);
            float _4091 = -_3351;
            float _4093 = fma(_3689, _4091, _3989);
            float _4095 = -_3351;
            float _4097 = fma(_3697, _4095, _3991);
            float _4099 = -_3351;
            float _4101 = fma(_3703, _4099, _3993);
            float _4103 = -_3351;
            float _4105 = fma(_3709, _4103, _3995);
            float _4107 = -_3351;
            float _4109 = fma(_3715, _4107, _3997);
            float _4111 = -_3351;
            float _4113 = fma(_3723, _4111, _3999);
            float _4115 = -_3351;
            float _4117 = fma(_3729, _4115, _4001);
            float _4119 = -_3351;
            float _4121 = fma(_3735, _4119, _4003);
            float _4123 = -_3351;
            float _4125 = fma(_3741, _4123, _4005);
            float _4127 = -_3351;
            float _4129 = fma(_3747, _4127, _4007);
            float _4131 = -_3351;
            float _4133 = fma(_3753, _4131, _4009);
            float _4135 = -_3351;
            float _4137 = fma(_3759, _4135, _4011);
            float _4139 = -_3351;
            float _4141 = fma(_3765, _4139, _4013);
            float _4143 = fma(_3769, _3949, _4017);
            float _4145 = fma(_3775, _3949, _4021);
            float _4147 = fma(_3781, _3949, _4025);
            float _4149 = fma(_3787, _3949, _4029);
            float _4151 = fma(_3791, _3949, _4033);
            float _4153 = fma(_3797, _3949, _4037);
            float _4155 = fma(_3803, _3949, _4041);
            float _4157 = fma(_3809, _3949, _4045);
            float _4159 = fma(_3813, _3949, _4049);
            float _4161 = fma(_3819, _3949, _4053);
            float _4163 = fma(_3825, _3949, _4057);
            float _4165 = fma(_3831, _3949, _4061);
            float _4167 = fma(_3835, _3949, _4065);
            float _4169 = fma(_3841, _3949, _4069);
            float _4171 = fma(_3847, _3949, _4073);
            float _4173 = fma(_3853, _3949, _4077);
            float _4175 = fma(_3857, _3949, _4081);
            float _4177 = fma(_3863, _3949, _4085);
            float _4179 = fma(_3869, _3949, _4089);
            float _4181 = fma(_3875, _3949, _4093);
            float _4183 = fma(_3879, _3949, _4097);
            float _4185 = fma(_3885, _3949, _4101);
            float _4187 = fma(_3891, _3949, _4105);
            float _4189 = fma(_3897, _3949, _4109);
            float _4191 = fma(_3901, _3949, _4113);
            float _4193 = fma(_3907, _3949, _4117);
            float _4195 = fma(_3913, _3949, _4121);
            float _4197 = fma(_3919, _3949, _4125);
            float _4199 = fma(_3923, _3949, _4129);
            float _4201 = fma(_3929, _3949, _4133);
            float _4203 = fma(_3935, _3949, _4137);
            float _4205 = fma(_3941, _3949, _4141);
            _2375 = _4157;
            _2377 = _4153;
            _2379 = _4185;
            _2381 = _4167;
            _2383 = _4151;
            _2385 = _4171;
            _2387 = _4187;
            _2389 = _4169;
            _2391 = _4173;
            _2393 = _4189;
            _2395 = _4155;
            _2397 = _4183;
            _2399 = _4201;
            _2401 = _4149;
            _2403 = _4199;
            _2405 = _4159;
            _2407 = _4161;
            _2409 = _4193;
            _2411 = _4143;
            _2413 = _4145;
            _2415 = _4147;
            _2417 = _4191;
            _2419 = _4203;
            _2421 = _4165;
            _2423 = _4175;
            _2425 = _4195;
            _2427 = _4205;
            _2429 = _4179;
            _2431 = _4181;
            _2433 = _4197;
            _2435 = _4163;
            _2437 = _4177;
            _2439 = true;
        }
        else
        {
            int _4207 = _1561 * 656;
            int _4209 = _4207 + 262144;
            int _4211 = _4207 + 262192;
            int _4213 = _4207 + 262160;
            uint _4215 = uint(int(uint(_4209) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4215)];
            float _4217 = as_type<float>(_dmw72.x);
            int _4219 = _4209 + 4;
            uint _4221 = uint(int(uint(_4219) >> uint(2)));
            float _4223 = as_type<float>(_dmw72.y);
            int _4225 = _4209 + 8;
            uint _4227 = uint(int(uint(_4225) >> uint(2)));
            float _4229 = as_type<float>(_dmw72.z);
            int _4231 = _4209 + 12;
            uint _4233 = uint(int(uint(_4231) >> uint(2)));
            float _4235 = as_type<float>(_dmw72.w);
            int _4237 = _4207 + 262208;
            uint _4239 = uint(int(uint(_4211) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4239)];
            float _4241 = as_type<float>(_dmw75.x);
            int _4243 = _4211 + 4;
            uint _4245 = uint(int(uint(_4243) >> uint(2)));
            float _4247 = as_type<float>(_dmw75.y);
            int _4249 = _4211 + 8;
            uint _4251 = uint(int(uint(_4249) >> uint(2)));
            float _4253 = as_type<float>(_dmw75.z);
            int _4255 = _4211 + 12;
            uint _4257 = uint(int(uint(_4255) >> uint(2)));
            float _4259 = as_type<float>(_dmw75.w);
            int _4261 = _4207 + 262176;
            uint _4263 = uint(int(uint(_4213) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4263)];
            float _4265 = as_type<float>(_dmw73.x);
            int _4267 = _4213 + 4;
            uint _4269 = uint(int(uint(_4267) >> uint(2)));
            float _4271 = as_type<float>(_dmw73.y);
            int _4273 = _4213 + 8;
            uint _4275 = uint(int(uint(_4273) >> uint(2)));
            float _4277 = as_type<float>(_dmw73.z);
            int _4279 = _4213 + 12;
            uint _4281 = uint(int(uint(_4279) >> uint(2)));
            float _4283 = as_type<float>(_dmw73.w);
            int _4285 = _4207 + 262224;
            uint _4287 = uint(int(uint(_4237) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4287)];
            float _4289 = as_type<float>(_dmw76.x);
            int _4291 = _4237 + 4;
            uint _4293 = uint(int(uint(_4291) >> uint(2)));
            float _4295 = as_type<float>(_dmw76.y);
            int _4297 = _4237 + 8;
            uint _4299 = uint(int(uint(_4297) >> uint(2)));
            float _4301 = as_type<float>(_dmw76.z);
            int _4303 = _4237 + 12;
            uint _4305 = uint(int(uint(_4303) >> uint(2)));
            float _4307 = as_type<float>(_dmw76.w);
            int _4309 = _4207 + 262240;
            uint _4311 = uint(int(uint(_4261) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4311)];
            float _4313 = as_type<float>(_dmw74.x);
            int _4315 = _4261 + 4;
            uint _4317 = uint(int(uint(_4315) >> uint(2)));
            float _4319 = as_type<float>(_dmw74.y);
            int _4321 = _4261 + 8;
            uint _4323 = uint(int(uint(_4321) >> uint(2)));
            float _4325 = as_type<float>(_dmw74.z);
            int _4327 = _4261 + 12;
            uint _4329 = uint(int(uint(_4327) >> uint(2)));
            float _4331 = as_type<float>(_dmw74.w);
            int _4333 = _4207 + 262256;
            uint _4335 = uint(int(uint(_4285) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4335)];
            float _4337 = as_type<float>(_dmw77.x);
            int _4339 = _4285 + 4;
            uint _4341 = uint(int(uint(_4339) >> uint(2)));
            float _4343 = as_type<float>(_dmw77.y);
            int _4345 = _4285 + 8;
            uint _4347 = uint(int(uint(_4345) >> uint(2)));
            float _4349 = as_type<float>(_dmw77.z);
            int _4351 = _4285 + 12;
            uint _4353 = uint(int(uint(_4351) >> uint(2)));
            float _4355 = as_type<float>(_dmw77.w);
            int _4357 = _1503 * 656;
            uint _4359 = uint(int(uint(_4309) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4359)];
            float _4361 = as_type<float>(_dmw78.x);
            int _4363 = _4309 + 4;
            uint _4365 = uint(int(uint(_4363) >> uint(2)));
            float _4367 = as_type<float>(_dmw78.y);
            int _4369 = _4309 + 8;
            uint _4371 = uint(int(uint(_4369) >> uint(2)));
            float _4373 = as_type<float>(_dmw78.z);
            int _4375 = _4309 + 12;
            uint _4377 = uint(int(uint(_4375) >> uint(2)));
            float _4379 = as_type<float>(_dmw78.w);
            int _4381 = _1575 * 656;
            int _4383 = _4357 + 262144;
            uint _4385 = uint(int(uint(_4333) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4385)];
            float _4387 = as_type<float>(_dmw79.x);
            int _4389 = _4333 + 4;
            uint _4391 = uint(int(uint(_4389) >> uint(2)));
            float _4393 = as_type<float>(_dmw79.y);
            int _4395 = _4333 + 8;
            uint _4397 = uint(int(uint(_4395) >> uint(2)));
            float _4399 = as_type<float>(_dmw79.z);
            int _4401 = _4333 + 12;
            uint _4403 = uint(int(uint(_4401) >> uint(2)));
            float _4405 = as_type<float>(_dmw79.w);
            int _4407 = _4357 + 262192;
            int _4409 = _4357 + 262160;
            uint _4411 = uint(int(uint(_4383) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4411)];
            float _4413 = as_type<float>(_dmw80.x);
            int _4415 = _4383 + 4;
            uint _4417 = uint(int(uint(_4415) >> uint(2)));
            float _4419 = as_type<float>(_dmw80.y);
            int _4421 = _4383 + 8;
            uint _4423 = uint(int(uint(_4421) >> uint(2)));
            float _4425 = as_type<float>(_dmw80.z);
            int _4427 = _4383 + 12;
            uint _4429 = uint(int(uint(_4427) >> uint(2)));
            float _4431 = as_type<float>(_dmw80.w);
            int _4433 = _4357 + 262208;
            int _4435 = _4357 + 262176;
            uint _4437 = uint(int(uint(_4407) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4437)];
            float _4439 = as_type<float>(_dmw83.x);
            int _4441 = _4407 + 4;
            uint _4443 = uint(int(uint(_4441) >> uint(2)));
            float _4445 = as_type<float>(_dmw83.y);
            int _4447 = _4407 + 8;
            uint _4449 = uint(int(uint(_4447) >> uint(2)));
            float _4451 = as_type<float>(_dmw83.z);
            int _4453 = _4407 + 12;
            uint _4455 = uint(int(uint(_4453) >> uint(2)));
            float _4457 = as_type<float>(_dmw83.w);
            int _4459 = _4357 + 262224;
            int _4461 = _4357 + 262240;
            uint _4463 = uint(int(uint(_4409) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4463)];
            float _4465 = as_type<float>(_dmw81.x);
            int _4467 = _4409 + 4;
            uint _4469 = uint(int(uint(_4467) >> uint(2)));
            float _4471 = as_type<float>(_dmw81.y);
            int _4473 = _4409 + 8;
            uint _4475 = uint(int(uint(_4473) >> uint(2)));
            float _4477 = as_type<float>(_dmw81.z);
            int _4479 = _4409 + 12;
            uint _4481 = uint(int(uint(_4479) >> uint(2)));
            float _4483 = as_type<float>(_dmw81.w);
            int _4485 = _4357 + 262256;
            int _4487 = _4381 + 262144;
            uint _4489 = uint(int(uint(_4433) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4489)];
            float _4491 = as_type<float>(_dmw84.x);
            int _4493 = _4433 + 4;
            uint _4495 = uint(int(uint(_4493) >> uint(2)));
            float _4497 = as_type<float>(_dmw84.y);
            int _4499 = _4433 + 8;
            uint _4501 = uint(int(uint(_4499) >> uint(2)));
            float _4503 = as_type<float>(_dmw84.z);
            int _4505 = _4433 + 12;
            uint _4507 = uint(int(uint(_4505) >> uint(2)));
            float _4509 = as_type<float>(_dmw84.w);
            int _4511 = _4381 + 262192;
            int _4513 = _4381 + 262160;
            uint _4515 = uint(int(uint(_4435) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4515)];
            float _4517 = as_type<float>(_dmw82.x);
            int _4519 = _4435 + 4;
            uint _4521 = uint(int(uint(_4519) >> uint(2)));
            float _4523 = as_type<float>(_dmw82.y);
            int _4525 = _4435 + 8;
            uint _4527 = uint(int(uint(_4525) >> uint(2)));
            float _4529 = as_type<float>(_dmw82.z);
            int _4531 = _4435 + 12;
            uint _4533 = uint(int(uint(_4531) >> uint(2)));
            float _4535 = as_type<float>(_dmw82.w);
            int _4537 = _4381 + 262208;
            int _4539 = _4381 + 262176;
            uint _4541 = uint(int(uint(_4459) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4541)];
            float _4543 = as_type<float>(_dmw85.x);
            int _4545 = _4459 + 4;
            uint _4547 = uint(int(uint(_4545) >> uint(2)));
            float _4549 = as_type<float>(_dmw85.y);
            int _4551 = _4459 + 8;
            uint _4553 = uint(int(uint(_4551) >> uint(2)));
            float _4555 = as_type<float>(_dmw85.z);
            int _4557 = _4459 + 12;
            uint _4559 = uint(int(uint(_4557) >> uint(2)));
            float _4561 = as_type<float>(_dmw85.w);
            int _4563 = _4381 + 262224;
            int _4565 = _4381 + 262240;
            uint _4567 = uint(int(uint(_4461) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4567)];
            float _4569 = as_type<float>(_dmw86.x);
            int _4571 = _4461 + 4;
            uint _4573 = uint(int(uint(_4571) >> uint(2)));
            float _4575 = as_type<float>(_dmw86.y);
            int _4577 = _4461 + 8;
            uint _4579 = uint(int(uint(_4577) >> uint(2)));
            float _4581 = as_type<float>(_dmw86.z);
            int _4583 = _4461 + 12;
            uint _4585 = uint(int(uint(_4583) >> uint(2)));
            float _4587 = as_type<float>(_dmw86.w);
            int _4589 = _4381 + 262256;
            uint _4591 = uint(int(uint(_4485) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4591)];
            float _4593 = as_type<float>(_dmw87.x);
            int _4595 = _4485 + 4;
            uint _4597 = uint(int(uint(_4595) >> uint(2)));
            float _4599 = as_type<float>(_dmw87.y);
            int _4601 = _4485 + 8;
            uint _4603 = uint(int(uint(_4601) >> uint(2)));
            float _4605 = as_type<float>(_dmw87.z);
            int _4607 = _4485 + 12;
            uint _4609 = uint(int(uint(_4607) >> uint(2)));
            float _4611 = as_type<float>(_dmw87.w);
            uint _4613 = uint(int(uint(_4487) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4613)];
            float _4615 = as_type<float>(_dmw88.x);
            int _4617 = _4487 + 4;
            uint _4619 = uint(int(uint(_4617) >> uint(2)));
            float _4621 = as_type<float>(_dmw88.y);
            int _4623 = _4487 + 8;
            uint _4625 = uint(int(uint(_4623) >> uint(2)));
            float _4627 = as_type<float>(_dmw88.z);
            int _4629 = _4487 + 12;
            uint _4631 = uint(int(uint(_4629) >> uint(2)));
            float _4633 = as_type<float>(_dmw88.w);
            uint _4635 = uint(int(uint(_4511) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4635)];
            float _4637 = as_type<float>(_dmw91.x);
            int _4639 = _4511 + 4;
            uint _4641 = uint(int(uint(_4639) >> uint(2)));
            float _4643 = as_type<float>(_dmw91.y);
            int _4645 = _4511 + 8;
            uint _4647 = uint(int(uint(_4645) >> uint(2)));
            float _4649 = as_type<float>(_dmw91.z);
            int _4651 = _4511 + 12;
            uint _4653 = uint(int(uint(_4651) >> uint(2)));
            float _4655 = as_type<float>(_dmw91.w);
            uint _4657 = uint(int(uint(_4513) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4657)];
            float _4659 = as_type<float>(_dmw89.x);
            int _4661 = _4513 + 4;
            uint _4663 = uint(int(uint(_4661) >> uint(2)));
            float _4665 = as_type<float>(_dmw89.y);
            int _4667 = _4513 + 8;
            uint _4669 = uint(int(uint(_4667) >> uint(2)));
            float _4671 = as_type<float>(_dmw89.z);
            int _4673 = _4513 + 12;
            uint _4675 = uint(int(uint(_4673) >> uint(2)));
            float _4677 = as_type<float>(_dmw89.w);
            uint _4679 = uint(int(uint(_4537) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4679)];
            float _4681 = as_type<float>(_dmw92.x);
            int _4683 = _4537 + 4;
            uint _4685 = uint(int(uint(_4683) >> uint(2)));
            float _4687 = as_type<float>(_dmw92.y);
            int _4689 = _4537 + 8;
            uint _4691 = uint(int(uint(_4689) >> uint(2)));
            float _4693 = as_type<float>(_dmw92.z);
            int _4695 = _4537 + 12;
            uint _4697 = uint(int(uint(_4695) >> uint(2)));
            float _4699 = as_type<float>(_dmw92.w);
            uint _4701 = uint(int(uint(_4539) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4701)];
            float _4703 = as_type<float>(_dmw90.x);
            int _4705 = _4539 + 4;
            uint _4707 = uint(int(uint(_4705) >> uint(2)));
            float _4709 = as_type<float>(_dmw90.y);
            int _4711 = _4539 + 8;
            uint _4713 = uint(int(uint(_4711) >> uint(2)));
            float _4715 = as_type<float>(_dmw90.z);
            int _4717 = _4539 + 12;
            uint _4719 = uint(int(uint(_4717) >> uint(2)));
            float _4721 = as_type<float>(_dmw90.w);
            uint _4723 = uint(int(uint(_4563) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4723)];
            float _4725 = as_type<float>(_dmw93.x);
            int _4727 = _4563 + 4;
            uint _4729 = uint(int(uint(_4727) >> uint(2)));
            float _4731 = as_type<float>(_dmw93.y);
            int _4733 = _4563 + 8;
            uint _4735 = uint(int(uint(_4733) >> uint(2)));
            float _4737 = as_type<float>(_dmw93.z);
            int _4739 = _4563 + 12;
            uint _4741 = uint(int(uint(_4739) >> uint(2)));
            float _4743 = as_type<float>(_dmw93.w);
            uint _4745 = uint(int(uint(_4565) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4745)];
            float _4747 = as_type<float>(_dmw94.x);
            int _4749 = _4565 + 4;
            uint _4751 = uint(int(uint(_4749) >> uint(2)));
            float _4753 = as_type<float>(_dmw94.y);
            int _4755 = _4565 + 8;
            uint _4757 = uint(int(uint(_4755) >> uint(2)));
            float _4759 = as_type<float>(_dmw94.z);
            int _4761 = _4565 + 12;
            uint _4763 = uint(int(uint(_4761) >> uint(2)));
            float _4765 = as_type<float>(_dmw94.w);
            uint _4767 = uint(int(uint(_4589) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4767)];
            float _4769 = as_type<float>(_dmw95.x);
            int _4771 = _4589 + 4;
            uint _4773 = uint(int(uint(_4771) >> uint(2)));
            float _4775 = as_type<float>(_dmw95.y);
            int _4777 = _4589 + 8;
            uint _4779 = uint(int(uint(_4777) >> uint(2)));
            float _4781 = as_type<float>(_dmw95.z);
            int _4783 = _4589 + 12;
            uint _4785 = uint(int(uint(_4783) >> uint(2)));
            float _4787 = as_type<float>(_dmw95.w);
            float _4789 = -_3351;
            float _4791 = _4789 + _3353;
            float _4793 = -_4791;
            float _4795 = _1479 + _4793;
            float _4797 = _4217 * _4791;
            float _4799 = _4223 * _4791;
            float _4801 = _4229 * _4791;
            float _4803 = _4235 * _4791;
            float _4805 = _4241 * _4791;
            float _4807 = _4247 * _4791;
            float _4809 = _4253 * _4791;
            float _4811 = _4259 * _4791;
            float _4813 = _4265 * _4791;
            float _4815 = _4271 * _4791;
            float _4817 = _4277 * _4791;
            float _4819 = _4283 * _4791;
            float _4821 = _4289 * _4791;
            float _4823 = _4295 * _4791;
            float _4825 = _4301 * _4791;
            float _4827 = _4307 * _4791;
            float _4829 = _4313 * _4791;
            float _4831 = _4319 * _4791;
            float _4833 = _4325 * _4791;
            float _4835 = _4331 * _4791;
            float _4837 = _4337 * _4791;
            float _4839 = _4343 * _4791;
            float _4841 = _4349 * _4791;
            float _4843 = _4355 * _4791;
            float _4845 = _4361 * _4791;
            float _4847 = _4367 * _4791;
            float _4849 = _4373 * _4791;
            float _4851 = _4379 * _4791;
            float _4853 = _4387 * _4791;
            float _4855 = _4393 * _4791;
            float _4857 = _4399 * _4791;
            float _4859 = _4405 * _4791;
            float _4861 = -_3353;
            float _4863 = fma(_4413, _4861, _4797);
            float _4865 = -_3353;
            float _4867 = fma(_4419, _4865, _4799);
            float _4869 = -_3353;
            float _4871 = fma(_4425, _4869, _4801);
            float _4873 = -_3353;
            float _4875 = fma(_4431, _4873, _4803);
            float _4877 = -_3353;
            float _4879 = fma(_4439, _4877, _4805);
            float _4881 = -_3353;
            float _4883 = fma(_4445, _4881, _4807);
            float _4885 = -_3353;
            float _4887 = fma(_4451, _4885, _4809);
            float _4889 = -_3353;
            float _4891 = fma(_4457, _4889, _4811);
            float _4893 = -_3353;
            float _4895 = fma(_4465, _4893, _4813);
            float _4897 = -_3353;
            float _4899 = fma(_4471, _4897, _4815);
            float _4901 = -_3353;
            float _4903 = fma(_4477, _4901, _4817);
            float _4905 = -_3353;
            float _4907 = fma(_4483, _4905, _4819);
            float _4909 = -_3353;
            float _4911 = fma(_4491, _4909, _4821);
            float _4913 = -_3353;
            float _4915 = fma(_4497, _4913, _4823);
            float _4917 = -_3353;
            float _4919 = fma(_4503, _4917, _4825);
            float _4921 = -_3353;
            float _4923 = fma(_4509, _4921, _4827);
            float _4925 = -_3353;
            float _4927 = fma(_4517, _4925, _4829);
            float _4929 = -_3353;
            float _4931 = fma(_4523, _4929, _4831);
            float _4933 = -_3353;
            float _4935 = fma(_4529, _4933, _4833);
            float _4937 = -_3353;
            float _4939 = fma(_4535, _4937, _4835);
            float _4941 = -_3353;
            float _4943 = fma(_4543, _4941, _4837);
            float _4945 = -_3353;
            float _4947 = fma(_4549, _4945, _4839);
            float _4949 = -_3353;
            float _4951 = fma(_4555, _4949, _4841);
            float _4953 = -_3353;
            float _4955 = fma(_4561, _4953, _4843);
            float _4957 = -_3353;
            float _4959 = fma(_4569, _4957, _4845);
            float _4961 = -_3353;
            float _4963 = fma(_4575, _4961, _4847);
            float _4965 = -_3353;
            float _4967 = fma(_4581, _4965, _4849);
            float _4969 = -_3353;
            float _4971 = fma(_4587, _4969, _4851);
            float _4973 = -_3353;
            float _4975 = fma(_4593, _4973, _4853);
            float _4977 = -_3353;
            float _4979 = fma(_4599, _4977, _4855);
            float _4981 = -_3353;
            float _4983 = fma(_4605, _4981, _4857);
            float _4985 = -_3353;
            float _4987 = fma(_4611, _4985, _4859);
            float _4989 = fma(_4615, _4795, _4863);
            float _4991 = fma(_4621, _4795, _4867);
            float _4993 = fma(_4627, _4795, _4871);
            float _4995 = fma(_4633, _4795, _4875);
            float _4997 = fma(_4637, _4795, _4879);
            float _4999 = fma(_4643, _4795, _4883);
            float _5001 = fma(_4649, _4795, _4887);
            float _5003 = fma(_4655, _4795, _4891);
            float _5005 = fma(_4659, _4795, _4895);
            float _5007 = fma(_4665, _4795, _4899);
            float _5009 = fma(_4671, _4795, _4903);
            float _5011 = fma(_4677, _4795, _4907);
            float _5013 = fma(_4681, _4795, _4911);
            float _5015 = fma(_4687, _4795, _4915);
            float _5017 = fma(_4693, _4795, _4919);
            float _5019 = fma(_4699, _4795, _4923);
            float _5021 = fma(_4703, _4795, _4927);
            float _5023 = fma(_4709, _4795, _4931);
            float _5025 = fma(_4715, _4795, _4935);
            float _5027 = fma(_4721, _4795, _4939);
            float _5029 = fma(_4725, _4795, _4943);
            float _5031 = fma(_4731, _4795, _4947);
            float _5033 = fma(_4737, _4795, _4951);
            float _5035 = fma(_4743, _4795, _4955);
            float _5037 = fma(_4747, _4795, _4959);
            float _5039 = fma(_4753, _4795, _4963);
            float _5041 = fma(_4759, _4795, _4967);
            float _5043 = fma(_4765, _4795, _4971);
            float _5045 = fma(_4769, _4795, _4975);
            float _5047 = fma(_4775, _4795, _4979);
            float _5049 = fma(_4781, _4795, _4983);
            float _5051 = fma(_4787, _4795, _4987);
            _2375 = _5003;
            _2377 = _4999;
            _2379 = _5031;
            _2381 = _5013;
            _2383 = _4997;
            _2385 = _5017;
            _2387 = _5033;
            _2389 = _5015;
            _2391 = _5019;
            _2393 = _5035;
            _2395 = _5001;
            _2397 = _5029;
            _2399 = _5047;
            _2401 = _4995;
            _2403 = _5045;
            _2405 = _5005;
            _2407 = _5007;
            _2409 = _5039;
            _2411 = _4989;
            _2413 = _4991;
            _2415 = _4993;
            _2417 = _5037;
            _2419 = _5049;
            _2421 = _5011;
            _2423 = _5021;
            _2425 = _5041;
            _2427 = _5051;
            _2429 = _5025;
            _2431 = _5027;
            _2433 = _5043;
            _2435 = _5009;
            _2437 = _5023;
        }
    }
    _2439 = false;
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
    float _5115 = _2437;
    float _5117 = _5053 * 0.511664927005767822265625;
    float _5119 = _5055 * 0.88622760772705078125;
    float _5121 = _5057 * 0.511664927005767822265625;
    float _5123 = _5059 * 0.511664927005767822265625;
    float _5125 = _5117 * _5117;
    float _5127 = _5061 * 0.88622760772705078125;
    float _5129 = _5063 * 0.511664927005767822265625;
    float _5131 = precise::max(_5119, 0.00999999977648258209228515625);
    float _5133 = fma(_5121, _5121, _5125);
    float _5135 = _5065 * 0.511664927005767822265625;
    float _5137 = _5123 * _5123;
    float _5139 = _5067 * 0.511664927005767822265625;
    float _5141 = precise::max(_5127, 0.00999999977648258209228515625);
    float _5143 = fma(_5129, _5129, _5133);
    float _5145 = 1.0 / _5131;
    float _5147 = _5069 * 0.511664927005767822265625;
    float _5149 = fma(_5135, _5135, _5137);
    float _5151 = _5071 * 0.511664927005767822265625;
    float _5153 = _5073 * 0.88622760772705078125;
    float _5155 = _5075 * 0.511664927005767822265625;
    float _5157 = 1.0 / _5141;
    float _5159 = _5139 * _5139;
    float _5161 = precise::max(_5153, 0.00999999977648258209228515625);
    float _5163 = fma(_1467, 1.9073486328125, 0.5);
    float _5165 = fma(_5151, _5151, _5159);
    float _5167 = sqrt(_5143);
    float _5169 = fma(_5147, _5147, _5149);
    float _5171 = fma(_5155, _5155, _5165);
    float _5173 = _1467 * 3.903682708740234375;
    float _5175 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5177 = _5175 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5179 = _5173 * _5077;
    float _5181 = sqrt(_5169);
    float _5183 = _5173 * _5079;
    float _5185 = fma(_5081, 0.88622701168060302734375, _5179);
    float _5187 = _5173 * _5083;
    float _5189 = _5173 * _5085;
    float _5191 = _5173 * _5087;
    float _5193 = fma(_5089, 0.88622701168060302734375, _5183);
    float _5195 = 1.0 / _5161;
    float _5197 = precise::max(_5167, 0.00999999977648258209228515625);
    float _5199 = fma(_5091, 0.88622701168060302734375, _5187);
    float _5201 = fma(_5093, 0.88622701168060302734375, _5189);
    float _5203 = fma(_5095, 0.88622701168060302734375, _5191);
    float _5205 = sqrt(_5171);
    float _5207 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5209 = _5207 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5211 = precise::max(_5181, 0.00999999977648258209228515625);
    int _5213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5215 = _5213 != 0;
    float _5217 = fma(_5163, _5209, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5219 = 1.0 / _5197;
    float _5221 = _5211 * _5145;
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5227 = _5225 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5229 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5231 = _5229 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5233 = fma(_5163, _5227, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5235 = precise::max(_5205, 0.00999999977648258209228515625);
    float _5237 = 1.0 / _5211;
    float _5239 = fma(_5163, _5231, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5241 = _5233 * 0.715200006961822509765625;
    float _5243 = _5197 * _5157;
    float _5245 = precise::clamp(_5243, 0.0, 1.0);
    float _5247 = _5235 * _5195;
    float _5249 = precise::clamp(_5247, 0.0, 1.0);
    float _5251 = _5223 + 1.0;
    float _5253 = fma(_5217, 0.2125999927520751953125, _5241);
    float _5255 = _5121 * _5219;
    float _5257 = 1.0 / _5235;
    float _5259 = _5117 * _5219;
    float _5261 = fma(_5239, 0.072200000286102294921875, _5253);
    float _5263 = _5245 + 1.0;
    float _5265 = 1.0 / _5261;
    float _5267 = _5123 * _5237;
    float _5269 = _5129 * _5219;
    float _5271 = _5135 * _5237;
    float _5273 = _5147 * _5237;
    float _5275 = _1563 * _5267;
    float _5277 = _5139 * _5257;
    float _5279 = _1563 * _5259;
    float _5281 = _5151 * _5257;
    float _5283 = -_1549;
    float _5285 = fma(_5283, _5271, _5275);
    float _5287 = _1563 * _5277;
    float _5289 = -_1549;
    float _5291 = fma(_5289, _5255, _5279);
    float _5293 = _5155 * _5257;
    float _5295 = -_1557;
    float _5297 = fma(_5295, _5273, _5285);
    float _5299 = -_1549;
    float _5301 = fma(_5299, _5281, _5287);
    float _5303 = -_1557;
    float _5305 = fma(_5303, _5269, _5291);
    float _5307 = _5249 + 1.0;
    float _5309 = fma(_5297, 0.5, 0.5);
    float _5311 = -_1557;
    float _5313 = fma(_5311, _5293, _5301);
    float _5315 = fma(_5305, 0.5, 0.5);
    float _5317 = 1.0 / _5307;
    float _5319 = fma(_5313, 0.5, 0.5);
    float _5321 = _5265 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5323 = precise::clamp(_5321, 0.0, 1.0);
    float _5325 = _1557 * (-1.02332699298858642578125);
    float _5327 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5329 = _5327 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5331 = fma(_5323, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5333 = abs(_5315);
    float _5335 = log2(_5333);
    float _5337 = fma(_5163, _5177, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5339 = fma(_5325, _5097, _5185);
    float _5341 = fma(_5163, _5329, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5343 = fma(_5325, _5099, _5199);
    float _5345 = fma(_5325, _5101, _5201);
    float _5347 = fma(_5325, _5103, _5203);
    float _5349 = _5233 * _5331;
    float _5351 = abs(_5309);
    float _5353 = log2(_5351);
    float _5355 = _1549 * (-1.02332699298858642578125);
    float _5357 = fma(_5355, _5105, _5339);
    float _5359 = fma(_5355, _5107, _5343);
    float _5361 = fma(_5355, _5109, _5345);
    float _5363 = abs(_5319);
    float _5365 = log2(_5363);
    float _5367 = fma(_5355, _5111, _5347);
    float _5369 = precise::max(0.0, _5357);
    float _5371 = precise::max(0.0, _5359);
    float _5373 = precise::max(0.0, _5361);
    float _5375 = _5369 * 0.31830990314483642578125;
    float _5377 = precise::clamp(_5375, 0.0, 1.0);
    float _5379 = 1.0 / _5251;
    float _5381 = precise::max(0.0, _5367);
    float _5383 = _5371 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5385 = -_5377;
    float _5387 = _5385 + 1.0;
    float _5389 = _5373 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5391 = _5381 * 0.31830990314483642578125;
    float _5393 = precise::clamp(_5391, 0.0, 1.0);
    float _5395 = fma(_5387, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5377);
    float _5397 = 1.0 / _5263;
    float _5399 = fma(_5245, 2.0, 1.0);
    float _5401 = _5239 * _5331;
    float _5403 = precise::max(_5383, _5349);
    float _5405 = _5393 * 0.88622701168060302734375;
    float _5407 = _5399 * _5335;
    float _5409 = fma(_5223, 2.0, 1.0);
    float _5411 = precise::max(_5389, _5401);
    float _5413 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5403);
    float _5415 = _5409 * _5353;
    float _5417 = fma(_5249, 2.0, 1.0);
    float _5419 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5411);
    float _5421 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5423 = _5421 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5425 = _5417 * _5365;
    float _5427 = exp2(_5415);
    float _5429 = -_5245;
    float _5431 = _5429 + 1.0;
    float _5433 = fma(_5163, _5423, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5435 = fma(_5245, 2.0, 2.0);
    float _5437 = -_5223;
    float _5439 = _5437 + 1.0;
    float _5441 = fma(_5223, 2.0, 2.0);
    float _5443 = fma(_5325, _5113, _5193);
    float _5445 = _5431 * _5397;
    float _5447 = exp2(_5407);
    float _5449 = _5439 * _5379;
    float _5451 = fma(_5355, _5115, _5443);
    float _5453 = precise::max(0.0, _5451);
    float _5455 = exp2(_5425);
    float _5457 = fma(_5249, 2.0, 2.0);
    float _5459 = -_5249;
    float _5461 = _5459 + 1.0;
    float _5463 = _5441 * _5427;
    float _5465 = _5453 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5467 = _5461 * _5317;
    float _5469 = _5217 * _5331;
    float _5471 = _5435 * _5447;
    float _5473 = -_5463;
    float _5475 = _5473 + 1.0;
    float _5477 = -_5471;
    float _5479 = _5477 + 1.0;
    float _5481 = fma(_5449, _5475, _5463);
    float _5483 = precise::max(_5465, _5469);
    float _5485 = _5457 * _5455;
    float _5487 = fma(_5445, _5479, _5471);
    float _5489 = _5119 * _5481;
    float _5491 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5483);
    float _5493 = -_5485;
    float _5495 = _5493 + 1.0;
    float _5497 = _5127 * _5487;
    float _5499 = fma(_5467, _5495, _5485);
    float _5501 = _5497 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5503 = _5489 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5505 = _5153 * _5499;
    float _5507 = precise::max(_5501, _5341);
    float _5509 = _5505 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5511 = precise::max(_5503, _5433);
    float _5513 = fma(_5507, _5395, _5491);
    float _5515 = precise::max(_5509, _5337);
    float _5517 = fma(_5511, _5395, _5413);
    float _5519 = fma(_5515, _5395, _5419);
    bool _5521 = !_5215;
    float _5523;
    float _5525;
    float _5527;
    float _5529;
    float _5531;
    float _5533;
    float _5535;
    float _5537;
    float _5539;
    float _5541;
    int _5543;
    float _5545;
    float _5547;
    float _5549;
    float _5551;
    float _5553;
    float _5555;
    float _5557;
    int _5559;
    float _5561;
    int _5563;
    float _5565;
    int _5567;
    int _5569;
    int _5571;
    float _5573;
    float _5575;
    int _5577;
    float _5579;
    int _5581;
    int _5583;
    float _5585;
    if (!_5521)
    {
        _5523 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5525 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5527 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5529 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5531 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5533 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5535 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5537 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5539 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5541 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5545 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5547 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5549 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5551 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5553 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5555 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5557 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5561 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5565 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5573 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5575 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5579 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5585 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5587 = true;
    }
    else
    {
        float _5589 = fma(_1069, 6.2500002968590706586837768554688e-05, 0.5);
        float _5591 = fma(_1067, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14870 = float3(_5589, _5591, float(0));
        float3 _14872 = select(_14870, float3(0.0), isnan(_14870));
        float4 _5593 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14872.xy, uint(rint(_14872.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14872.xy, uint(rint(_14872.z)), level(0.0)).xyzw;
        float _5595 = _5593.x;
        float _5597 = _5593.y;
        float _5599 = _5593.z;
        float _5601 = _5593.w;
        float3 _14887 = float3(_5589, _5591, float(1));
        float3 _14889 = select(_14887, float3(0.0), isnan(_14887));
        float4 _5603 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14889.xy, uint(rint(_14889.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14889.xy, uint(rint(_14889.z)), level(0.0)).xyzw;
        float _5605 = _5603.x;
        float _5607 = _5603.y;
        float _5609 = _5603.z;
        float _5611 = _5603.w;
        float3 _14904 = float3(_5589, _5591, float(2));
        float3 _14906 = select(_14904, float3(0.0), isnan(_14904));
        float4 _5613 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14906.xy, uint(rint(_14906.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14906.xy, uint(rint(_14906.z)), level(0.0)).xyzw;
        float _5615 = _5613.x;
        float _5617 = _5613.y;
        float _5619 = _5613.z;
        float _5621 = _5613.w;
        float3 _14921 = float3(_5589, _5591, float(3));
        float3 _14923 = select(_14921, float3(0.0), isnan(_14921));
        float4 _5623 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14923.xy, uint(rint(_14923.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14923.xy, uint(rint(_14923.z)), level(0.0)).xyzw;
        float _5625 = _5623.x;
        float _5627 = _5623.y;
        float _5629 = _5623.z;
        float _5631 = _5623.w;
        float3 _14938 = float3(_5589, _5591, float(4));
        float3 _14940 = select(_14938, float3(0.0), isnan(_14938));
        float4 _5633 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14940.xy, uint(rint(_14940.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14940.xy, uint(rint(_14940.z)), level(0.0)).xyzw;
        float _5635 = _5633.x;
        float _5637 = _5633.y;
        float _5639 = _5633.z;
        float _5641 = _5633.w;
        float3 _14955 = float3(_5589, _5591, float(5));
        float3 _14957 = select(_14955, float3(0.0), isnan(_14955));
        float4 _5643 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14957.xy, uint(rint(_14957.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14957.xy, uint(rint(_14957.z)), level(0.0)).xyzw;
        float _5645 = _5643.x;
        float _5647 = _5643.y;
        float _5649 = _5643.z;
        float _5651 = _5643.w;
        float3 _14972 = float3(_5589, _5591, float(6));
        float3 _14974 = select(_14972, float3(0.0), isnan(_14972));
        float4 _5653 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14974.xy, uint(rint(_14974.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14974.xy, uint(rint(_14974.z)), level(0.0)).xyzw;
        float _5655 = _5653.x;
        float _5657 = _5653.y;
        float _5659 = _5653.z;
        float _5661 = _5653.w;
        float3 _14989 = float3(_5589, _5591, float(7));
        float3 _14991 = select(_14989, float3(0.0), isnan(_14989));
        float4 _5663 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14991.xy, uint(rint(_14991.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14991.xy, uint(rint(_14991.z)), level(0.0)).xyzw;
        float _5665 = _5663.x;
        float _5667 = _5663.y;
        float _5669 = _5663.z;
        float _5671 = _5663.w;
        _5523 = _5657;
        _5525 = _5667;
        _5527 = _5625;
        _5529 = _5627;
        _5531 = _5655;
        _5533 = _5665;
        _5535 = _5601;
        _5537 = _5659;
        _5539 = _5629;
        _5541 = _5669;
        _5543 = as_type<int>(_5631);
        _5545 = _5661;
        _5547 = _5595;
        _5549 = _5605;
        _5551 = _5607;
        _5553 = _5671;
        _5555 = _5597;
        _5557 = _5599;
        _5559 = as_type<int>(_5637);
        _5561 = _5611;
        _5563 = as_type<int>(_5635);
        _5565 = _5609;
        _5567 = as_type<int>(_5639);
        _5569 = as_type<int>(_5641);
        _5571 = as_type<int>(_5645);
        _5573 = _5617;
        _5575 = _5615;
        _5577 = as_type<int>(_5647);
        _5579 = _5619;
        _5581 = as_type<int>(_5651);
        _5583 = as_type<int>(_5649);
        _5585 = _5621;
    }
    _5587 = false;
    float _5673 = _5523;
    float _5675 = _5525;
    float _5677 = _5527;
    float _5679 = _5529;
    float _5681 = _5531;
    float _5683 = _5533;
    float _5685 = _5535;
    float _5687 = _5537;
    float _5689 = _5539;
    float _5691 = _5541;
    int _5693 = _5543;
    float _5695 = _5545;
    float _5697 = _5547;
    float _5699 = _5549;
    float _5701 = _5551;
    float _5703 = _5553;
    float _5705 = _5555;
    float _5707 = _5557;
    int _5709 = _5559;
    float _5711 = _5561;
    int _5713 = _5563;
    float _5715 = _5565;
    int _5717 = _5567;
    int _5719 = _5569;
    int _5721 = _5571;
    float _5723 = _5573;
    float _5725 = _5575;
    int _5727 = _5577;
    float _5729 = _5579;
    int _5731 = _5581;
    int _5733 = _5583;
    float _5735 = _5585;
    float _5737 = _5173 * _5673;
    float _5739 = _5173 * _5675;
    float _5741 = _5677 * 0.88622701168060302734375;
    float _5743 = _5679 * 0.88622701168060302734375;
    float _5745 = fma(_5681, 0.88622701168060302734375, _5737);
    float _5747 = fma(_5683, 0.88622701168060302734375, _5739);
    float _5749 = _5173 * _5685;
    out.m_54.x = _1437;
    out.m_54.y = _1439;
    float _5751 = fma(_5325, _5687, _5745);
    float _5753 = _5689 * 0.88622701168060302734375;
    float _5755 = fma(_5325, _5691, _5747);
    float _5757 = _5215 ? as_type<float>(_5693) : 0.0;
    float _5759 = fma(_5355, _5695, _5751);
    out.m_56.x = _1069;
    out.m_56.y = _1163;
    out.m_56.z = _1067;
    float _5761 = fma(_5697, 0.88622701168060302734375, _5749);
    float _5763 = _5173 * _5699;
    float _5765 = _5173 * _5701;
    float _5767 = _5215 ? _5741 : 0.0;
    float _5769 = fma(_5355, _5703, _5755);
    float _5771 = _5215 ? _5743 : 0.0;
    float _5773 = fma(_5705, 0.88622701168060302734375, _5763);
    float _5775 = precise::max(0.0, _5759);
    float _5777 = fma(_5707, 0.88622701168060302734375, _5765);
    float _5779 = _5215 ? as_type<float>(_5709) : 0.0;
    float _5781 = fma(_5325, _5711, _5773);
    float _5783 = _5215 ? as_type<float>(_5713) : 0.0;
    float _5785 = fma(_5173, _5757, _5767);
    float _5787 = _5215 ? _5753 : 0.0;
    float _5789 = fma(_5325, _5715, _5761);
    float _5791 = _5215 ? as_type<float>(_5717) : 0.0;
    float _5793 = fma(_5173, _5783, _5771);
    float _5795 = _5215 ? as_type<float>(_5719) : 0.0;
    float _5797 = _5775 * 0.31830990314483642578125;
    float _5799 = precise::clamp(_5797, 0.0, 1.0);
    float _5801 = _5215 ? as_type<float>(_5721) : 0.0;
    float _5803 = fma(_5173, _5779, _5787);
    float _5805 = precise::max(0.0, _5769);
    float _5807 = fma(_5355, _5723, _5789);
    float _5809 = fma(_5325, _5725, _5777);
    out.m_58.x = _744;
    float _5811 = _5799 * 0.88622701168060302734375;
    float _5813 = fma(_5325, _5795, _5793);
    float _5815 = fma(_5325, _5801, _5803);
    float _5817 = _5805 * 0.31830990314483642578125;
    float _5819 = precise::clamp(_5817, 0.0, 1.0);
    float _5821 = _5215 ? as_type<float>(_5727) : 0.0;
    float _5823 = fma(_5355, _5729, _5781);
    float _5825 = _5215 ? as_type<float>(_5731) : 0.0;
    float _5827 = fma(_5325, _5791, _5785);
    float _5829 = _5215 ? as_type<float>(_5733) : 0.0;
    float _5831 = fma(_5355, _5735, _5809);
    float _5833 = precise::max(0.0, _5807);
    float _5835 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    out.gl_Position.x = _1565;
    out.gl_Position.y = _1567;
    float _15259 = as_type<float>(_1573);
    out.gl_Position.z = _15259;
    out.gl_Position.w = _1569;
    float _5837 = -_5819;
    float _5839 = _5837 + 1.0;
    float _5841 = fma(_5355, _5821, _5827);
    float _5843 = fma(_5355, _5829, _5813);
    float _5845 = fma(_5355, _5825, _5815);
    float _5847 = fma(_5833, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5835);
    float _5849 = precise::max(0.0, _5823);
    float _5851 = fma(_5839, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5819);
    float _5853 = precise::max(0.0, _5831);
    float _5855 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5857 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5859 = precise::max(0.0, _5841);
    float _5861 = -_1549;
    float _5863 = (-0.0) + _5861;
    float _5865 = precise::max(0.0, _5843);
    float _5867 = sqrt(_1559);
    float _5869 = precise::max(0.0, _5845);
    float _5871 = _5851 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5873 = fma(_5849, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5855);
    float _5875 = fma(_5853, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5857);
    float _5877 = -_1557;
    float _5879 = (-0.0) + _5877;
    float _5881 = fma(_5859, _5871, _5847);
    float _5883 = fma(_5865, _5871, _5873);
    float _5885 = -_1185;
    float _5887 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _5889 = _5885 + _5887;
    float _5891 = fma(_5869, _5871, _5875);
    out.m_60.x = _5513;
    out.m_60.y = _5517;
    out.m_60.z = _5519;
    float _5893 = _5889 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_58.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    out.m_62.w = _1185;
    out.m_64.x = _5863;
    out.m_64.y = _1563;
    out.m_64.z = _5879;
    out.m_58.w = _5867;
    out.m_64.w = _5893;
    out.m_62.x = _5881;
    out.m_62.y = _5883;
    out.m_62.z = _5891;
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
    bool _5587 = false;
    bool _2439 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_51.x;
    float _80 = in.m_51.y;
    float _82 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _84 = _82 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _87 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _89 = _87 << 4;
    bool _93 = _89 == 0;
    bool _95 = _89 == 16;
    bool _97 = _89 == 32;
    bool _99 = _89 == 48;
    bool _101 = _89 == 64;
    float _103 = fma(_84, _78, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _105 = fma(_78, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _107 = _89 == 80;
    bool _109 = _80 >= 0.5;
    bool _111 = isnan(_80);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.5);
    bool _117 = _113 || _115;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _121 = _103 + _119;
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _125 = _105 + _123;
    float _127 = as_type<float>(gl_BaseInstance);
    if (_93)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _129 = _127;
    float _131 = _121 * _121;
    bool _133 = _89 == 96;
    float _135 = 0.0;
    float _137 = _129;
    float _139 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (_93)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _141 = _135;
    float _143 = fma(_125, _125, _131);
    float _145 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _147 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _145;
    float _149 = _141;
    if (_95)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _151 = _137;
    bool _153 = _89 == 112;
    float _155 = fma(_147, _147, _143);
    float _157 = _151;
    if (_95)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_97)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _163 = _157;
    float _165 = rsqrt(_155);
    bool _167 = _89 == 128;
    float _169 = _163;
    if (_97)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _171 = _161;
    float _173 = _171;
    if (_99)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _175 = _169;
    bool _177 = _89 == 144;
    float _179 = _175;
    if (_99)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _181 = _173;
    float _183 = _181;
    if (_101)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _185 = _179;
    bool _187 = _89 == 160;
    float _189 = _185;
    if (_101)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _191 = _183;
    float _193 = _165 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _195 = _191;
    if (_107)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _197 = _189;
    bool _199 = _89 == 176;
    float _201 = _197;
    if (_107)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _203 = _195;
    float _205 = log2(_193);
    bool _207 = _89 == 192;
    float _209 = _203;
    if (_133)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _211 = _201;
    float _213 = _211;
    if (_133)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _215 = _209;
    float _217 = _215;
    if (_153)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _219 = _213;
    bool _221 = _89 == 208;
    float _223 = _219;
    if (_153)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _225 = _217;
    float _227 = _225;
    if (_167)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _229 = _223;
    bool _231 = _89 == 224;
    float _233 = _205 + 1.2999999523162841796875;
    float _235 = _229;
    if (_167)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _237 = _227;
    float _239 = _237;
    if (_177)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _241 = _235;
    bool _243 = _89 == 240;
    float _245 = trunc(_233);
    int _247 = int(_245);
    float _249 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _251 = _239;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _255 = _249;
    bool _257 = _89 == 256;
    float _259 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_199)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _265 = _259;
    bool _267 = _89 == 272;
    float _269 = _265;
    if (_199)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _271 = _263;
    float _273 = _271;
    if (_207)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _275 = _269;
    int _277 = min(_247, 15);
    bool _279 = _89 == 288;
    float _281 = _275;
    if (_207)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _283 = _273;
    float _285 = float(_277);
    bool _287 = _89 == 304;
    int _289 = _277 << 4;
    int _291 = _289 + 4288;
    float _293 = _283;
    float _295 = as_type<float>(_291);
    if (_221)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _297 = _281;
    float _299 = _297;
    if (_221)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _301 = _293;
    float _303 = -_285;
    float _305 = _303 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _307 = _301;
    if (_231)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _309 = _299;
    int _311 = _291 + 8;
    uint _314 = uint(int(uint(_311) >> uint(2)));
    uint _316 = uint(int(uint(int(_314)) >> uint(2)));
    int _318 = int(_314) & 3;
    float _320 = (*spvDescriptorSet0.vp_c14)._m0[int(_316)][_318];
    int _322 = int(_314) + 1;
    uint _324 = uint(int(uint(_322) >> uint(2)));
    int _326 = _322 & 3;
    float _328 = (*spvDescriptorSet0.vp_c14)._m0[int(_324)][_326];
    bool _330 = _89 == 320;
    float _332 = _305 + 1.0;
    float _334 = _309;
    if (_231)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _336 = _307;
    float _338 = _336;
    if (_243)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _340 = _334;
    bool _342 = _89 == 336;
    float _344 = exp2(_332);
    float _346 = _340;
    if (_243)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _348 = _338;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _352 = _346;
    bool _354 = _89 == 352;
    float _356 = _352;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _358 = _350;
    float _360 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _362 = _356;
    bool _364 = _89 == 368;
    float _366 = _362;
    if (_267)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _368 = _360;
    float _370 = _368;
    if (_279)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _372 = _366;
    float _374 = 1.0 / _344;
    bool _376 = _89 == 384;
    float _378 = _372;
    if (_279)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _380 = _370;
    float _382 = _380;
    if (_287)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _384 = _378;
    bool _386 = _89 == 400;
    float _388 = _384;
    if (_287)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _390 = _382;
    bool _392 = _89 == 416;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _396 = _388;
    float _398 = _396;
    if (_330)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _400 = _394;
    float _402 = _400;
    if (_342)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _404 = _398;
    bool _406 = _89 == 432;
    float _408 = _404;
    if (_342)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_354)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _414 = _408;
    bool _416 = _89 == 448;
    float _418 = _414;
    if (_354)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_364)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _424 = _418;
    bool _426 = _89 == 464;
    float _428 = _424;
    if (_364)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_376)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _434 = _428;
    bool _436 = _89 == 480;
    float _438 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _440 = _432;
    float _442 = _440;
    if (_386)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _444 = _438;
    bool _446 = _89 == 496;
    float _448 = _444;
    if (_386)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _450 = _442;
    float _452 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _454 = _448;
    bool _456 = _89 == 512;
    float _458 = _454;
    if (_392)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _460 = _452;
    bool _462 = _89 == 528;
    float _464 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _466 = _458;
    float _468 = _466;
    if (_406)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _470 = _464;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _474 = _468;
    bool _476 = _89 == 544;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _484 = _478;
    bool _486 = _89 == 560;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _494 = _488;
    bool _496 = _89 == 576;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_446)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _504 = _498;
    bool _506 = _89 == 592;
    float _508 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _510 = _502;
    float _512 = _510;
    if (_456)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _514 = _508;
    bool _516 = _89 == 608;
    float _518 = _514;
    if (_456)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _520 = _512;
    float _522 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _524 = _518;
    bool _526 = _89 == 624;
    float _528 = _524;
    if (_462)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _530 = _522;
    bool _532 = _89 == 640;
    float _534 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _536 = _528;
    float _538 = _536;
    if (_476)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _540 = _534;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _544 = _538;
    bool _546 = _89 == 656;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _554 = _548;
    bool _556 = _89 == 672;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _564 = _558;
    bool _566 = _89 == 688;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_516)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _574 = _568;
    bool _576 = _89 == 704;
    float _578 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _580 = _572;
    float _582 = _580;
    if (_526)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _584 = _578;
    bool _586 = _89 == 720;
    float _588 = _584;
    if (_526)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _590 = _582;
    float _592 = _590;
    if (_532)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _594 = _588;
    bool _596 = _89 == 736;
    float _598 = _594;
    if (_532)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _600 = _592;
    bool _602 = _89 == 752;
    float _604 = _600;
    if (_546)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _606 = _598;
    float _608 = _606;
    if (_556)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_566)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_576)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _618 = _616;
    float _620 = _618;
    if (_586)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _622 = _620;
    float _624 = _622;
    if (_596)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _626 = _624;
    float _628 = _626;
    if (_602)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _630 = _628;
    float _632 = _374 * _630;
    if (_546)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _634 = _604;
    float _636 = _634;
    if (_556)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _638 = _636;
    float _640 = _632 * _78;
    float _642 = _638;
    if (_566)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_576)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _648 = _646;
    float _650 = floor(_640);
    float _652 = _648;
    if (_586)
    {
        _652 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _654 = _652;
    float _656 = _654;
    if (_596)
    {
        _656 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _658 = _656;
    float _660 = _658;
    if (_602)
    {
        _660 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _662 = _660;
    float _664 = -_650;
    float _666 = _640 + _664;
    float _668 = _344 * _662;
    float _670 = _666 * 2.0;
    float _672 = -_666;
    float _674 = fma(_668, _672, _78);
    float _676 = floor(_670);
    float _678 = _668 * _676;
    float _680 = _678 * 0.5;
    float _682 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _684 = _680 + _674;
    float _686 = fma(_84, _684, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _688 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _692 = _686 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _696 = _688 + _694;
    float _698 = _692 * _692;
    float _700 = fma(_696, _696, _698);
    float _702 = fma(_147, _147, _700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _706 = sqrt(_702);
    int _708 = _704 + 76;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c6)._m0[int(_712)][_714];
    uint _718 = uint(int(uint(_704) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.vp_c6)._m0[int(_720)][_722];
    float _726 = -_328;
    float _728 = fma(_706, _320, _726);
    float _730 = precise::clamp(_728, 0.0, 1.0);
    float _732 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _732;
    float _736 = -_680;
    float _738 = fma(_736, _730, _684);
    float _740 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _742 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _740;
    float _744 = fma(_738, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _746 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _748 = _744 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _752 = _744 + _750;
    float _754 = abs(_748);
    float _756 = abs(_742);
    float _758 = precise::max(_754, _756);
    float _760 = _716 + 8.0;
    float _762 = _760 + _758;
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _766 = _762 * _724;
    float _768 = _766 * 4.0;
    float _770 = _716;
    float _772 = _734;
    float _774 = _752;
    float _776 = _320;
    float _778 = _682;
    if (!_117)
    {
        float _780 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _770 = _780;
    }
    float _782 = _770;
    float _784 = precise::max(_768, 1.0);
    float _786 = log2(_784);
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _790 = _782;
    if (!_117)
    {
        float _792 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _139 = _792;
    }
    float _794 = _139;
    float _796 = _794;
    if (!_117)
    {
        float _798 = _782 + _788;
        _790 = _798;
    }
    float _800 = _790;
    float _802 = _800;
    if (!_117)
    {
        float _804 = _794 + _788;
        _796 = _804;
    }
    float _806 = _796;
    float _808 = trunc(_786);
    int _810 = int(_808);
    float _812 = floor(_786);
    int _814 = min(_810, 4);
    int _816 = _814 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _818 = _816 << 4;
    float _820 = _812 + 1.0;
    float _822 = rint(_812);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    uint _828 = clamp(_826, 0u, 65535u);
    uint _830 = uint(int(uint(_818) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.vp_c6)._m0[int(_832)][_834];
    float _838 = rint(_820);
    float _840 = precise::max(_838, 0.0);
    uint _842 = uint(_840);
    uint _844 = clamp(_842, 0u, 65535u);
    int _846 = _818 + 16;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c6)._m0[int(_850)][_852];
    float _856 = fma(_734, _836, 0.5);
    float _858 = fma(_752, _836, 0.5);
    float _860 = fma(_734, _854, 0.5);
    float _862 = fma(_752, _854, 0.5);
    float _864 = as_type<float>(_818);
    float _866 = _820;
    float _868 = _860;
    float _870 = _806;
    if (!_117)
    {
        float2 _7251 = float2(_800, _806);
        float4 _873 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7251, float2(0.0), isnan(_7251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7251, float2(0.0), isnan(_7251)), level(0.0)).xyzw;
        float _875 = _873.x;
        float _877 = _873.y;
        float _879 = _873.z;
        float _881 = _873.w;
        _772 = _875;
        _295 = _877;
        _864 = _879;
        _774 = _881;
    }
    float _883 = _772;
    float _885 = _295;
    float _887 = _864;
    float _889 = _774;
    float3 _7281 = float3(_858, _856, float(int(_828)));
    float3 _7285 = select(_7281, float3(0.0), isnan(_7281));
    float3 _893 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7285.xy, uint(rint(_7285.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7285.xy, uint(rint(_7285.z)), level(0.0)).xyz;
    float _895 = _893.x;
    float _897 = _893.y;
    float _899 = _893.z;
    float3 _7300 = float3(_862, _860, float(int(_844)));
    float3 _7302 = select(_7300, float3(0.0), isnan(_7300));
    float3 _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7302.xy, uint(rint(_7302.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7302.xy, uint(rint(_7302.z)), level(0.0)).xyz;
    float _903 = _901.x;
    float _905 = _901.y;
    float _907 = _901.z;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[0].w + 1.953125;
    float _911 = _909;
    if (_117)
    {
        _776 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _913 = _776;
    float _915 = 0.0;
    if (_117)
    {
        float _917 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _764, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _915 = _917;
    }
    float _919 = _915;
    float _921 = 0.0;
    if (_117)
    {
        _921 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _923 = _921;
    float _925 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _927 = 0.0;
    if (_117)
    {
        float _929 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _913, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _927 = _929;
    }
    float _931 = _927;
    if (_117)
    {
        float _933 = fma(_744, _913, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _911 = _933;
    }
    float _935 = _911;
    float _937 = _744 + 1.953125;
    float _939 = _935;
    if (_117)
    {
        float _941 = fma(_931, _923, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _866 = _941;
    }
    float _943 = _866;
    if (_117)
    {
        float _945 = fma(_935, _923, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _939 = _945;
    }
    float _947 = _939;
    float _949 = _947;
    if (_117)
    {
        float _951 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _682, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _868 = _951;
    }
    float _953 = _868;
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (_117)
    {
        float _957 = _943 + _788;
        _778 = _957;
    }
    float _959 = _778;
    if (_117)
    {
        float _961 = _947 + _788;
        _949 = _961;
    }
    float _963 = _949;
    float _965 = fma(_925, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_117)
    {
        float _969 = _788 + _953;
        _870 = _969;
    }
    float _971 = _870;
    float _973 = _883;
    float _975 = _885;
    float _977 = _887;
    float _979 = _889;
    if (_117)
    {
        float2 _7453 = float2(_963, _959);
        float4 _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7453, float2(0.0), isnan(_7453)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7453, float2(0.0), isnan(_7453)), level(0.0)).xyzw;
        float _983 = _981.x;
        float _985 = _981.y;
        float _987 = _981.z;
        float _989 = _981.w;
        _973 = _983;
        _975 = _985;
        _977 = _987;
        _979 = _989;
    }
    float _991 = _973;
    float _993 = _975;
    float _995 = _977;
    float _997 = _979;
    float _999 = _965 + _788;
    float _1001 = _967 + _788;
    if (_117)
    {
        float _1003 = _788 + _919;
        _802 = _1003;
    }
    float _1005 = _802;
    float2 _7492 = float2(_1001, _971);
    float _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7492, float2(0.0), isnan(_7492)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7492, float2(0.0), isnan(_7492)), level(0.0)).x;
    float2 _7500 = float2(_1005, _999);
    float _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7500, float2(0.0), isnan(_7500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7500, float2(0.0), isnan(_7500)), level(0.0)).x;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[0].w * 0.00012500000593718141317367553710938;
    float _1013 = _744 * 0.00012500000593718141317367553710938;
    float _1015 = -_812;
    float _1017 = _786 + _1015;
    float _1019 = abs(_1013);
    float _1021 = abs(_1011);
    float _1023 = precise::max(_1019, _1021);
    float _1025 = fma(_1017, 5.42372894287109375, -4.338983058929443359375);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_1023, 20.0, -19.0);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = -_1031;
    float _1035 = _1033 + 1.0;
    float _1037 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 0.008000000379979610443115234375, 64.0);
    float _1039 = fma(_744, 0.008000000379979610443115234375, 64.0);
    float _1041 = precise::max(0.0, _1037);
    float _1043 = precise::max(0.0, _1039);
    float _1045 = precise::min(_1041, 127.0);
    float _1047 = -_899;
    float _1049 = _1047 + _907;
    float _1051 = -_895;
    float _1053 = _1051 + _903;
    float _1055 = -_897;
    float _1057 = _1055 + _905;
    float _1059 = fma(_1027, _1049, _899);
    float _1061 = fma(_1027, _1053, _895);
    float _1063 = fma(_1027, _1057, _897);
    float _1065 = precise::min(_1043, 127.0);
    float _1067 = fma(_1035, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _1069 = fma(_1035, _1061, _744);
    float _1071 = trunc(_1045);
    int _1073 = int(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1077 = _1067 + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1081 = _1069 + _1079;
    float _1083 = _1077 * _1077;
    float _1085 = trunc(_1065);
    int _1087 = int(_1085);
    float _1089 = fma(_1081, _1081, _1083);
    float _1091 = fma(_1081, _1081, _1083);
    bool _1093 = _1089 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1095 = isnan(_1089);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1101 = _1097 || _1099;
    float _1103 = fma(_991, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1105 = sqrt(_1091);
    float _1107 = fma(_1035, _1063, _1103);
    float _1109 = _1083;
    float _1111 = _1041;
    float _1113 = _1035;
    float _1115 = _991;
    float _1117 = _1089;
    float _1119 = _1043;
    if (!_1101)
    {
        _1109 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_1101)
    {
        float _1125 = -_1089;
        float _1127 = _1125 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1111 = _1127;
    }
    float _1129 = _1111;
    float _1131 = _1129;
    if (!_1101)
    {
        float _1133 = _1089 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1113 = _1133;
    }
    float _1135 = _1113;
    if (!_1101)
    {
        float _1137 = -_1129;
        float _1139 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = _1141;
    if (_1101)
    {
        _1123 = _1107;
    }
    float _1145 = _1123;
    float _1147 = _1145;
    if (!_1101)
    {
        float _1149 = precise::min(_1107, _1141);
        _1143 = _1149;
    }
    float _1151 = _1143;
    if (!_1101)
    {
        float _1153 = -_1151;
        float _1155 = _1107 + _1153;
        _1115 = _1155;
    }
    float _1157 = _1115;
    float _1159 = _1157;
    if (!_1101)
    {
        float _1161 = fma(_1135, _1157, _1151);
        _1147 = _1161;
    }
    float _1163 = _1147;
    bool _1165 = _1105 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    int _1167 = _1073 << 7;
    int _1169 = _1167 + _1087;
    float _1171 = _1163 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    int _1173 = _1169 << 4;
    float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1171);
    int _1177 = _1173 + 8;
    float _1179 = fma(_1067, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1175);
    float _1181 = as_type<float>(_1169);
    if (!_1165)
    {
        _1117 = _1069;
    }
    float _1183 = _1117;
    float _1185 = _1179 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1187 = _1183;
    if (!_1165)
    {
        _1159 = _1067;
    }
    float _1189 = _1159;
    float _1191 = _1189;
    if (!_1165)
    {
        _1119 = _1163;
    }
    float _1193 = _1119;
    float _1195 = _1193;
    if (!_1165)
    {
        _1181 = _1185;
    }
    float _1197 = _1181;
    bool _1199 = !_1165;
    float _1201 = _1197;
    if (!_1199)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1207 = _1105 + _1205;
        float _1209 = rsqrt(_1091);
        float _1211 = _1207 * _1203;
        float _1213 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1215 = _1211 * 0.15915493667125701904296875;
        float _1217 = _1215 * 6.283185482025146484375;
        float _1219 = cos(_1217);
        float _1221 = _1215 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = _1219 + (-1.0);
        float _1227 = fma(_1223, _1213, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1229 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1231 = _1209 * _1227;
        float _1233 = fma(_1219, _1163, _1229);
        float _1235 = fma(_1081, _1231, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1237 = _1233 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1239 = fma(_1077, _1231, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1241 = fma(_1235, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1237);
        float _1243 = fma(_1239, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1241);
        float _1245 = _1243 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1195 = _1233;
        _1187 = _1235;
        _1191 = _1239;
        _1201 = _1245;
    }
    float _1247 = _1195;
    float _1249 = _1187;
    float _1251 = _1191;
    float _1253 = _1201;
    uint _1255 = uint(int(uint(_1177) >> uint(2)));
    float _1257 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1255)]);
    float _1259 = floor(_1065);
    int _1261 = _1173 + 12;
    uint _1263 = uint(int(uint(_1173) >> uint(2)));
    float _1265 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1263)]);
    uint _1267 = uint(int(uint(_1261) >> uint(2)));
    float _1269 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1267)]);
    float _1271 = floor(_1045);
    float _1273 = -_1259;
    float _1275 = _1065 + _1273;
    float _1277 = -_1271;
    float _1279 = _1045 + _1277;
    int _1281 = _1173 + 4;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    float _1285 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1283)]);
    float _1287 = _1257 + _1275;
    float _1289 = precise::clamp(_1287, 0.0, 1.0);
    float _1291 = _1257 + _1279;
    float _1293 = precise::clamp(_1291, 0.0, 1.0);
    bool _1295 = _1289 >= 1.0;
    bool _1297 = isnan(_1289);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(1.0);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    bool _1307 = _1293 >= 1.0;
    bool _1309 = isnan(_1293);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan(1.0);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = trunc(_1305);
    int _1321 = int(_1319);
    float _1323 = trunc(_1317);
    int _1325 = int(_1323);
    int _1327 = _1087 + _1321;
    int _1329 = _1073 << 7;
    int _1331 = _1329 + _1327;
    int _1333 = _1073 + _1325;
    int _1335 = _1333 << 7;
    int _1337 = _1335 + _1327;
    int _1339 = _1333 << 7;
    int _1341 = _1339 + _1087;
    int _1343 = _1337 << 4;
    int _1345 = _1331 << 4;
    int _1347 = _1341 << 4;
    uint _1349 = uint(int(uint(_1343) >> uint(2)));
    float _1351 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1349)]);
    int _1353 = _1343 + 12;
    int _1355 = _1345 + 12;
    uint _1357 = uint(int(uint(_1345) >> uint(2)));
    float _1359 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1357)]);
    int _1361 = _1347 + 12;
    uint _1363 = uint(int(uint(_1353) >> uint(2)));
    float _1365 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1363)]);
    uint _1367 = uint(int(uint(_1355) >> uint(2)));
    float _1369 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1367)]);
    uint _1371 = uint(int(uint(_1361) >> uint(2)));
    float _1373 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1371)]);
    uint _1375 = uint(int(uint(_1347) >> uint(2)));
    float _1377 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1375)]);
    float _1379 = fma(_1007, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1381 = fma(_1009, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1383 = -_1103;
    float _1385 = _1383 + _1379;
    float _1387 = -_1103;
    float _1389 = _1387 + _1381;
    float _1391 = _1385 * 1.953125;
    float _1393 = _1389 * 1.953125;
    float _1395 = floor(_1289);
    float _1397 = floor(_1293);
    float _1399 = fma(_997, 255.99609375, 7.629510946571826934814453125e-06);
    float _1401 = _1269 * _1275;
    float _1403 = _1285 * _1275;
    float _1405 = _1285 * _1279;
    float _1407 = floor(_1403);
    float _1409 = -_1395;
    float _1411 = _1289 + _1409;
    float _1413 = floor(_1405);
    float _1415 = -_1397;
    float _1417 = _1293 + _1415;
    float _1419 = _1269 * _1411;
    float _1421 = _1269 * _1417;
    float _1423 = _1269 * _1279;
    float _1425 = floor(_1419);
    float _1427 = floor(_1421);
    float _1429 = _1407 + _1413;
    float _1431 = 1.0 / _1269;
    float _1433 = floor(_1423);
    float _1435 = floor(_1401);
    float _1437 = fma(_993, 200.0, -100.0);
    float _1439 = fma(_995, 200.0, -100.0);
    float _1441 = _1247 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1443 = _1247 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1445 = fma(_1391, _1391, 14.55191516876220703125);
    float _1447 = floor(_1399);
    float _1449 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1441);
    float _1451 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1443);
    float _1453 = fma(_1393, _1393, _1445);
    float _1455 = trunc(_1429);
    int _1457 = int(_1455);
    float _1459 = fma(_1269, _1433, _1435);
    float _1461 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1451);
    float _1463 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1449);
    float _1465 = _1461 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1467 = rsqrt(_1453);
    float _1469 = -_1447;
    float _1471 = _1399 + _1469;
    float _1473 = _1463 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1477 = -_1413;
    float _1479 = _1405 + _1477;
    float _1481 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    bool _1483 = _1471 > 0.499000012874603271484375;
    float _1485 = trunc(_1459);
    int _1487 = int(_1485);
    int _1489 = _1457 & 1;
    bool _1491 = _1489 != 0;
    float _1493 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1495 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1475);
    float _1497 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1495);
    float _1499 = -_1407;
    float _1501 = _1403 + _1499;
    int _1503 = as_type<int>(_1265) + _1487;
    float _1505 = fma(_1427, _1365, _1425);
    float _1507 = _1365 * _1431;
    float _1509 = fma(_1433, _1369, _1425);
    float _1511 = _1369 * _1431;
    float _1513 = fma(_1373, _1427, _1435);
    float _1515 = _1373 * _1431;
    float _1517 = _1507 * _1505;
    float _1519 = _1511 * _1509;
    float _1521 = _1515 * _1513;
    float _1523 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1525 = trunc(_1519);
    int _1527 = int(_1525);
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1481);
    float _1531 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1523);
    float _1533 = trunc(_1521);
    int _1535 = int(_1533);
    float _1537 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1493);
    float _1539 = trunc(_1517);
    int _1541 = int(_1539);
    float _1543 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1531);
    float _1545 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1529);
    float _1547 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1537);
    float _1549 = _1391 * _1467;
    float _1551 = _1439 * _1439;
    float _1553 = _1497 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    int _1555 = as_type<int>(_1359) + _1527;
    float _1557 = _1393 * _1467;
    float _1559 = fma(_1437, _1437, _1551);
    int _1561 = as_type<int>(_1377) + _1535;
    float _1563 = _1467 * 3.814697265625;
    float _1565 = _1543 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1567 = _1545 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1569 = _1547 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1571 = !_1483;
    int _1573 = _1571 ? as_type<int>(_1553) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    int _1575 = as_type<int>(_1351) + _1541;
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
    float _2437;
    if (!_1491)
    {
        float _1577 = fma(_1479, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1579 = fma(_1501, -0.707106769084930419921875, _1577);
        bool _1581 = _1579 >= 0.0;
        bool _1583 = !_1581;
        if (!_1583)
        {
            int _1585 = _1555 * 656;
            int _1587 = _1585 + 262144;
            int _1589 = _1585 + 262192;
            int _1591 = _1585 + 262160;
            uint _1593 = uint(int(uint(_1587) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1593)];
            float _1595 = as_type<float>(_dmw0.x);
            int _1597 = _1587 + 4;
            uint _1599 = uint(int(uint(_1597) >> uint(2)));
            float _1601 = as_type<float>(_dmw0.y);
            int _1603 = _1587 + 8;
            uint _1605 = uint(int(uint(_1603) >> uint(2)));
            float _1607 = as_type<float>(_dmw0.z);
            int _1609 = _1587 + 12;
            uint _1611 = uint(int(uint(_1609) >> uint(2)));
            float _1613 = as_type<float>(_dmw0.w);
            int _1615 = _1585 + 262208;
            uint _1617 = uint(int(uint(_1589) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1617)];
            float _1619 = as_type<float>(_dmw3.x);
            int _1621 = _1589 + 4;
            uint _1623 = uint(int(uint(_1621) >> uint(2)));
            float _1625 = as_type<float>(_dmw3.y);
            int _1627 = _1589 + 8;
            uint _1629 = uint(int(uint(_1627) >> uint(2)));
            float _1631 = as_type<float>(_dmw3.z);
            int _1633 = _1589 + 12;
            uint _1635 = uint(int(uint(_1633) >> uint(2)));
            float _1637 = as_type<float>(_dmw3.w);
            int _1639 = _1585 + 262224;
            int _1641 = _1585 + 262240;
            uint _1643 = uint(int(uint(_1591) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1643)];
            float _1645 = as_type<float>(_dmw1.x);
            int _1647 = _1591 + 4;
            uint _1649 = uint(int(uint(_1647) >> uint(2)));
            float _1651 = as_type<float>(_dmw1.y);
            int _1653 = _1591 + 8;
            uint _1655 = uint(int(uint(_1653) >> uint(2)));
            float _1657 = as_type<float>(_dmw1.z);
            int _1659 = _1591 + 12;
            uint _1661 = uint(int(uint(_1659) >> uint(2)));
            float _1663 = as_type<float>(_dmw1.w);
            int _1665 = _1585 + 262176;
            int _1667 = _1503 * 656;
            int _1669 = _1585 + 262256;
            uint _1671 = uint(int(uint(_1615) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1671)];
            float _1673 = as_type<float>(_dmw4.x);
            int _1675 = _1615 + 4;
            uint _1677 = uint(int(uint(_1675) >> uint(2)));
            float _1679 = as_type<float>(_dmw4.y);
            int _1681 = _1615 + 8;
            uint _1683 = uint(int(uint(_1681) >> uint(2)));
            float _1685 = as_type<float>(_dmw4.z);
            int _1687 = _1615 + 12;
            uint _1689 = uint(int(uint(_1687) >> uint(2)));
            float _1691 = as_type<float>(_dmw4.w);
            uint _1693 = uint(int(uint(_1639) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1693)];
            float _1695 = as_type<float>(_dmw5.x);
            int _1697 = _1639 + 4;
            uint _1699 = uint(int(uint(_1697) >> uint(2)));
            float _1701 = as_type<float>(_dmw5.y);
            int _1703 = _1639 + 8;
            uint _1705 = uint(int(uint(_1703) >> uint(2)));
            float _1707 = as_type<float>(_dmw5.z);
            int _1709 = _1639 + 12;
            uint _1711 = uint(int(uint(_1709) >> uint(2)));
            float _1713 = as_type<float>(_dmw5.w);
            uint _1715 = uint(int(uint(_1641) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1715)];
            float _1717 = as_type<float>(_dmw6.x);
            int _1719 = _1641 + 4;
            uint _1721 = uint(int(uint(_1719) >> uint(2)));
            float _1723 = as_type<float>(_dmw6.y);
            int _1725 = _1641 + 8;
            uint _1727 = uint(int(uint(_1725) >> uint(2)));
            float _1729 = as_type<float>(_dmw6.z);
            int _1731 = _1641 + 12;
            uint _1733 = uint(int(uint(_1731) >> uint(2)));
            float _1735 = as_type<float>(_dmw6.w);
            int _1737 = _1561 * 656;
            uint _1739 = uint(int(uint(_1665) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1739)];
            float _1741 = as_type<float>(_dmw2.x);
            int _1743 = _1665 + 4;
            uint _1745 = uint(int(uint(_1743) >> uint(2)));
            float _1747 = as_type<float>(_dmw2.y);
            int _1749 = _1665 + 8;
            uint _1751 = uint(int(uint(_1749) >> uint(2)));
            float _1753 = as_type<float>(_dmw2.z);
            int _1755 = _1665 + 12;
            uint _1757 = uint(int(uint(_1755) >> uint(2)));
            float _1759 = as_type<float>(_dmw2.w);
            int _1761 = _1667 + 262144;
            int _1763 = _1667 + 262192;
            uint _1765 = uint(int(uint(_1669) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1765)];
            float _1767 = as_type<float>(_dmw7.x);
            int _1769 = _1669 + 4;
            uint _1771 = uint(int(uint(_1769) >> uint(2)));
            float _1773 = as_type<float>(_dmw7.y);
            int _1775 = _1669 + 8;
            uint _1777 = uint(int(uint(_1775) >> uint(2)));
            float _1779 = as_type<float>(_dmw7.z);
            int _1781 = _1669 + 12;
            uint _1783 = uint(int(uint(_1781) >> uint(2)));
            float _1785 = as_type<float>(_dmw7.w);
            int _1787 = _1667 + 262160;
            int _1789 = _1667 + 262208;
            uint _1791 = uint(int(uint(_1761) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1791)];
            float _1793 = as_type<float>(_dmw8.x);
            int _1795 = _1761 + 4;
            uint _1797 = uint(int(uint(_1795) >> uint(2)));
            float _1799 = as_type<float>(_dmw8.y);
            int _1801 = _1761 + 8;
            uint _1803 = uint(int(uint(_1801) >> uint(2)));
            float _1805 = as_type<float>(_dmw8.z);
            int _1807 = _1761 + 12;
            uint _1809 = uint(int(uint(_1807) >> uint(2)));
            float _1811 = as_type<float>(_dmw8.w);
            int _1813 = _1667 + 262176;
            int _1815 = _1667 + 262224;
            uint _1817 = uint(int(uint(_1763) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1817)];
            float _1819 = as_type<float>(_dmw11.x);
            int _1821 = _1763 + 4;
            uint _1823 = uint(int(uint(_1821) >> uint(2)));
            float _1825 = as_type<float>(_dmw11.y);
            int _1827 = _1763 + 8;
            uint _1829 = uint(int(uint(_1827) >> uint(2)));
            float _1831 = as_type<float>(_dmw11.z);
            int _1833 = _1763 + 12;
            uint _1835 = uint(int(uint(_1833) >> uint(2)));
            float _1837 = as_type<float>(_dmw11.w);
            int _1839 = _1667 + 262240;
            int _1841 = _1667 + 262256;
            uint _1843 = uint(int(uint(_1787) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1843)];
            float _1845 = as_type<float>(_dmw9.x);
            int _1847 = _1787 + 4;
            uint _1849 = uint(int(uint(_1847) >> uint(2)));
            float _1851 = as_type<float>(_dmw9.y);
            int _1853 = _1787 + 8;
            uint _1855 = uint(int(uint(_1853) >> uint(2)));
            float _1857 = as_type<float>(_dmw9.z);
            int _1859 = _1787 + 12;
            uint _1861 = uint(int(uint(_1859) >> uint(2)));
            float _1863 = as_type<float>(_dmw9.w);
            int _1865 = _1737 + 262144;
            int _1867 = _1737 + 262192;
            uint _1869 = uint(int(uint(_1789) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1869)];
            float _1871 = as_type<float>(_dmw12.x);
            int _1873 = _1789 + 4;
            uint _1875 = uint(int(uint(_1873) >> uint(2)));
            float _1877 = as_type<float>(_dmw12.y);
            int _1879 = _1789 + 8;
            uint _1881 = uint(int(uint(_1879) >> uint(2)));
            float _1883 = as_type<float>(_dmw12.z);
            int _1885 = _1789 + 12;
            uint _1887 = uint(int(uint(_1885) >> uint(2)));
            float _1889 = as_type<float>(_dmw12.w);
            int _1891 = _1737 + 262160;
            int _1893 = _1737 + 262208;
            uint _1895 = uint(int(uint(_1813) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1895)];
            float _1897 = as_type<float>(_dmw10.x);
            int _1899 = _1813 + 4;
            uint _1901 = uint(int(uint(_1899) >> uint(2)));
            float _1903 = as_type<float>(_dmw10.y);
            int _1905 = _1813 + 8;
            uint _1907 = uint(int(uint(_1905) >> uint(2)));
            float _1909 = as_type<float>(_dmw10.z);
            int _1911 = _1813 + 12;
            uint _1913 = uint(int(uint(_1911) >> uint(2)));
            float _1915 = as_type<float>(_dmw10.w);
            int _1917 = _1737 + 262176;
            int _1919 = _1737 + 262224;
            uint _1921 = uint(int(uint(_1815) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1921)];
            float _1923 = as_type<float>(_dmw13.x);
            int _1925 = _1815 + 4;
            uint _1927 = uint(int(uint(_1925) >> uint(2)));
            float _1929 = as_type<float>(_dmw13.y);
            int _1931 = _1815 + 8;
            uint _1933 = uint(int(uint(_1931) >> uint(2)));
            float _1935 = as_type<float>(_dmw13.z);
            int _1937 = _1815 + 12;
            uint _1939 = uint(int(uint(_1937) >> uint(2)));
            float _1941 = as_type<float>(_dmw13.w);
            int _1943 = _1737 + 262240;
            int _1945 = _1737 + 262256;
            uint _1947 = uint(int(uint(_1839) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1947)];
            float _1949 = as_type<float>(_dmw14.x);
            int _1951 = _1839 + 4;
            uint _1953 = uint(int(uint(_1951) >> uint(2)));
            float _1955 = as_type<float>(_dmw14.y);
            int _1957 = _1839 + 8;
            uint _1959 = uint(int(uint(_1957) >> uint(2)));
            float _1961 = as_type<float>(_dmw14.z);
            int _1963 = _1839 + 12;
            uint _1965 = uint(int(uint(_1963) >> uint(2)));
            float _1967 = as_type<float>(_dmw14.w);
            uint _1969 = uint(int(uint(_1841) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1969)];
            float _1971 = as_type<float>(_dmw15.x);
            int _1973 = _1841 + 4;
            uint _1975 = uint(int(uint(_1973) >> uint(2)));
            float _1977 = as_type<float>(_dmw15.y);
            int _1979 = _1841 + 8;
            uint _1981 = uint(int(uint(_1979) >> uint(2)));
            float _1983 = as_type<float>(_dmw15.z);
            int _1985 = _1841 + 12;
            uint _1987 = uint(int(uint(_1985) >> uint(2)));
            float _1989 = as_type<float>(_dmw15.w);
            uint _1991 = uint(int(uint(_1865) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1991)];
            float _1993 = as_type<float>(_dmw16.x);
            int _1995 = _1865 + 4;
            uint _1997 = uint(int(uint(_1995) >> uint(2)));
            float _1999 = as_type<float>(_dmw16.y);
            int _2001 = _1865 + 8;
            uint _2003 = uint(int(uint(_2001) >> uint(2)));
            float _2005 = as_type<float>(_dmw16.z);
            int _2007 = _1865 + 12;
            uint _2009 = uint(int(uint(_2007) >> uint(2)));
            float _2011 = as_type<float>(_dmw16.w);
            uint _2013 = uint(int(uint(_1867) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2013)];
            float _2015 = as_type<float>(_dmw19.x);
            int _2017 = _1867 + 4;
            uint _2019 = uint(int(uint(_2017) >> uint(2)));
            float _2021 = as_type<float>(_dmw19.y);
            int _2023 = _1867 + 8;
            uint _2025 = uint(int(uint(_2023) >> uint(2)));
            float _2027 = as_type<float>(_dmw19.z);
            int _2029 = _1867 + 12;
            uint _2031 = uint(int(uint(_2029) >> uint(2)));
            float _2033 = as_type<float>(_dmw19.w);
            uint _2035 = uint(int(uint(_1891) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2035)];
            float _2037 = as_type<float>(_dmw17.x);
            int _2039 = _1891 + 4;
            uint _2041 = uint(int(uint(_2039) >> uint(2)));
            float _2043 = as_type<float>(_dmw17.y);
            int _2045 = _1891 + 8;
            uint _2047 = uint(int(uint(_2045) >> uint(2)));
            float _2049 = as_type<float>(_dmw17.z);
            int _2051 = _1891 + 12;
            uint _2053 = uint(int(uint(_2051) >> uint(2)));
            float _2055 = as_type<float>(_dmw17.w);
            uint _2057 = uint(int(uint(_1893) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2057)];
            float _2059 = as_type<float>(_dmw20.x);
            int _2061 = _1893 + 4;
            uint _2063 = uint(int(uint(_2061) >> uint(2)));
            float _2065 = as_type<float>(_dmw20.y);
            int _2067 = _1893 + 8;
            uint _2069 = uint(int(uint(_2067) >> uint(2)));
            float _2071 = as_type<float>(_dmw20.z);
            int _2073 = _1893 + 12;
            uint _2075 = uint(int(uint(_2073) >> uint(2)));
            float _2077 = as_type<float>(_dmw20.w);
            uint _2079 = uint(int(uint(_1917) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2079)];
            float _2081 = as_type<float>(_dmw18.x);
            int _2083 = _1917 + 4;
            uint _2085 = uint(int(uint(_2083) >> uint(2)));
            float _2087 = as_type<float>(_dmw18.y);
            int _2089 = _1917 + 8;
            uint _2091 = uint(int(uint(_2089) >> uint(2)));
            float _2093 = as_type<float>(_dmw18.z);
            int _2095 = _1917 + 12;
            uint _2097 = uint(int(uint(_2095) >> uint(2)));
            float _2099 = as_type<float>(_dmw18.w);
            uint _2101 = uint(int(uint(_1919) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2101)];
            float _2103 = as_type<float>(_dmw21.x);
            int _2105 = _1919 + 4;
            uint _2107 = uint(int(uint(_2105) >> uint(2)));
            float _2109 = as_type<float>(_dmw21.y);
            int _2111 = _1919 + 8;
            uint _2113 = uint(int(uint(_2111) >> uint(2)));
            float _2115 = as_type<float>(_dmw21.z);
            int _2117 = _1919 + 12;
            uint _2119 = uint(int(uint(_2117) >> uint(2)));
            float _2121 = as_type<float>(_dmw21.w);
            uint _2123 = uint(int(uint(_1943) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2123)];
            float _2125 = as_type<float>(_dmw22.x);
            int _2127 = _1943 + 4;
            uint _2129 = uint(int(uint(_2127) >> uint(2)));
            float _2131 = as_type<float>(_dmw22.y);
            int _2133 = _1943 + 8;
            uint _2135 = uint(int(uint(_2133) >> uint(2)));
            float _2137 = as_type<float>(_dmw22.z);
            int _2139 = _1943 + 12;
            uint _2141 = uint(int(uint(_2139) >> uint(2)));
            float _2143 = as_type<float>(_dmw22.w);
            uint _2145 = uint(int(uint(_1945) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2145)];
            float _2147 = as_type<float>(_dmw23.x);
            int _2149 = _1945 + 4;
            uint _2151 = uint(int(uint(_2149) >> uint(2)));
            float _2153 = as_type<float>(_dmw23.y);
            int _2155 = _1945 + 8;
            uint _2157 = uint(int(uint(_2155) >> uint(2)));
            float _2159 = as_type<float>(_dmw23.z);
            int _2161 = _1945 + 12;
            uint _2163 = uint(int(uint(_2161) >> uint(2)));
            float _2165 = as_type<float>(_dmw23.w);
            float _2167 = _1479 + (-1.0);
            float _2169 = -_1501;
            float _2171 = -_2167;
            float _2173 = _2169 + _2171;
            float _2175 = -_2173;
            float _2177 = _2175 + 1.0;
            float _2179 = _1501 * _1595;
            float _2181 = _1501 * _1601;
            float _2183 = _1501 * _1607;
            float _2185 = _1501 * _1613;
            float _2187 = _1501 * _1619;
            float _2189 = _1501 * _1625;
            float _2191 = _1501 * _1631;
            float _2193 = _1501 * _1637;
            float _2195 = _1501 * _1645;
            float _2197 = _1501 * _1651;
            float _2199 = _1501 * _1657;
            float _2201 = _1501 * _1663;
            float _2203 = _1501 * _1673;
            float _2205 = _1501 * _1679;
            float _2207 = _1501 * _1685;
            float _2209 = _1501 * _1701;
            float _2211 = _1501 * _1707;
            float _2213 = _1501 * _1713;
            float _2215 = _1501 * _1691;
            float _2217 = _1501 * _1717;
            float _2219 = _1501 * _1723;
            float _2221 = _1501 * _1729;
            float _2223 = _1501 * _1741;
            float _2225 = _1501 * _1747;
            float _2227 = _1501 * _1753;
            float _2229 = _1501 * _1735;
            float _2231 = _1501 * _1759;
            float _2233 = _1501 * _1767;
            float _2235 = _1501 * _1695;
            float _2237 = _1501 * _1773;
            float _2239 = _1501 * _1779;
            float _2241 = -_1501;
            float _2243 = _2241 + _2177;
            float _2245 = _1501 * _1785;
            float _2247 = fma(_2173, _1793, _2179);
            float _2249 = fma(_2173, _1799, _2181);
            float _2251 = fma(_2173, _1805, _2183);
            float _2253 = fma(_2173, _1811, _2185);
            float _2255 = fma(_2173, _1819, _2187);
            float _2257 = fma(_2173, _1825, _2189);
            float _2259 = fma(_2173, _1831, _2191);
            float _2261 = fma(_2173, _1837, _2193);
            float _2263 = fma(_2173, _1845, _2195);
            float _2265 = fma(_2173, _1851, _2197);
            float _2267 = fma(_2173, _1857, _2199);
            float _2269 = fma(_2173, _1863, _2201);
            float _2271 = fma(_2173, _1871, _2203);
            float _2273 = fma(_2173, _1877, _2205);
            float _2275 = fma(_2173, _1883, _2207);
            float _2277 = fma(_2173, _1889, _2215);
            float _2279 = fma(_2173, _1897, _2223);
            float _2281 = fma(_2173, _1903, _2225);
            float _2283 = fma(_2173, _1909, _2227);
            float _2285 = fma(_2173, _1915, _2231);
            float _2287 = fma(_2173, _1923, _2235);
            float _2289 = fma(_2173, _1929, _2209);
            float _2291 = fma(_2173, _1935, _2211);
            float _2293 = fma(_2173, _1941, _2213);
            float _2295 = fma(_2173, _1949, _2217);
            float _2297 = fma(_2173, _1955, _2219);
            float _2299 = fma(_2173, _1961, _2221);
            float _2301 = fma(_2173, _1967, _2229);
            float _2303 = fma(_2173, _1971, _2233);
            float _2305 = fma(_2173, _1977, _2237);
            float _2307 = fma(_2173, _1983, _2239);
            float _2309 = fma(_2173, _1989, _2245);
            float _2311 = fma(_2243, _1993, _2247);
            float _2313 = fma(_2243, _1999, _2249);
            float _2315 = fma(_2243, _2005, _2251);
            float _2317 = fma(_2243, _2011, _2253);
            float _2319 = fma(_2243, _2015, _2255);
            float _2321 = fma(_2243, _2021, _2257);
            float _2323 = fma(_2243, _2027, _2259);
            float _2325 = fma(_2243, _2033, _2261);
            float _2327 = fma(_2243, _2037, _2263);
            float _2329 = fma(_2243, _2043, _2265);
            float _2331 = fma(_2243, _2049, _2267);
            float _2333 = fma(_2243, _2055, _2269);
            float _2335 = fma(_2243, _2059, _2271);
            float _2337 = fma(_2243, _2065, _2273);
            float _2339 = fma(_2243, _2071, _2275);
            float _2341 = fma(_2243, _2077, _2277);
            float _2343 = fma(_2243, _2081, _2279);
            float _2345 = fma(_2243, _2087, _2281);
            float _2347 = fma(_2243, _2093, _2283);
            float _2349 = fma(_2243, _2099, _2285);
            float _2351 = fma(_2243, _2103, _2287);
            float _2353 = fma(_2243, _2109, _2289);
            float _2355 = fma(_2243, _2115, _2291);
            float _2357 = fma(_2243, _2121, _2293);
            float _2359 = fma(_2243, _2125, _2295);
            float _2361 = fma(_2243, _2131, _2297);
            float _2363 = fma(_2243, _2137, _2299);
            float _2365 = fma(_2243, _2143, _2301);
            float _2367 = fma(_2243, _2147, _2303);
            float _2369 = fma(_2243, _2153, _2305);
            float _2371 = fma(_2243, _2159, _2307);
            float _2373 = fma(_2243, _2165, _2309);
            _2375 = _2325;
            _2377 = _2321;
            _2379 = _2353;
            _2381 = _2335;
            _2383 = _2319;
            _2385 = _2339;
            _2387 = _2355;
            _2389 = _2337;
            _2391 = _2341;
            _2393 = _2357;
            _2395 = _2323;
            _2397 = _2351;
            _2399 = _2369;
            _2401 = _2317;
            _2403 = _2367;
            _2405 = _2327;
            _2407 = _2329;
            _2409 = _2361;
            _2411 = _2311;
            _2413 = _2313;
            _2415 = _2315;
            _2417 = _2359;
            _2419 = _2371;
            _2421 = _2333;
            _2423 = _2343;
            _2425 = _2363;
            _2427 = _2373;
            _2429 = _2347;
            _2431 = _2349;
            _2433 = _2365;
            _2435 = _2331;
            _2437 = _2345;
            _2439 = true;
        }
        else
        {
            int _2441 = _1561 * 656;
            int _2443 = _2441 + 262144;
            int _2445 = _2441 + 262192;
            int _2447 = _2441 + 262160;
            uint _2449 = uint(int(uint(_2443) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2449)];
            float _2451 = as_type<float>(_dmw24.x);
            int _2453 = _2443 + 4;
            uint _2455 = uint(int(uint(_2453) >> uint(2)));
            float _2457 = as_type<float>(_dmw24.y);
            int _2459 = _2443 + 8;
            uint _2461 = uint(int(uint(_2459) >> uint(2)));
            float _2463 = as_type<float>(_dmw24.z);
            int _2465 = _2443 + 12;
            uint _2467 = uint(int(uint(_2465) >> uint(2)));
            float _2469 = as_type<float>(_dmw24.w);
            int _2471 = _2441 + 262208;
            uint _2473 = uint(int(uint(_2445) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2473)];
            float _2475 = as_type<float>(_dmw27.x);
            int _2477 = _2445 + 4;
            uint _2479 = uint(int(uint(_2477) >> uint(2)));
            float _2481 = as_type<float>(_dmw27.y);
            int _2483 = _2445 + 8;
            uint _2485 = uint(int(uint(_2483) >> uint(2)));
            float _2487 = as_type<float>(_dmw27.z);
            int _2489 = _2445 + 12;
            uint _2491 = uint(int(uint(_2489) >> uint(2)));
            float _2493 = as_type<float>(_dmw27.w);
            int _2495 = _2441 + 262176;
            uint _2497 = uint(int(uint(_2447) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2497)];
            float _2499 = as_type<float>(_dmw25.x);
            int _2501 = _2447 + 4;
            uint _2503 = uint(int(uint(_2501) >> uint(2)));
            float _2505 = as_type<float>(_dmw25.y);
            int _2507 = _2447 + 8;
            uint _2509 = uint(int(uint(_2507) >> uint(2)));
            float _2511 = as_type<float>(_dmw25.z);
            int _2513 = _2447 + 12;
            uint _2515 = uint(int(uint(_2513) >> uint(2)));
            float _2517 = as_type<float>(_dmw25.w);
            int _2519 = _2441 + 262224;
            uint _2521 = uint(int(uint(_2471) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2521)];
            float _2523 = as_type<float>(_dmw28.x);
            int _2525 = _2471 + 4;
            uint _2527 = uint(int(uint(_2525) >> uint(2)));
            float _2529 = as_type<float>(_dmw28.y);
            int _2531 = _2471 + 8;
            uint _2533 = uint(int(uint(_2531) >> uint(2)));
            float _2535 = as_type<float>(_dmw28.z);
            int _2537 = _2471 + 12;
            uint _2539 = uint(int(uint(_2537) >> uint(2)));
            float _2541 = as_type<float>(_dmw28.w);
            int _2543 = _2441 + 262240;
            uint _2545 = uint(int(uint(_2495) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2545)];
            float _2547 = as_type<float>(_dmw26.x);
            int _2549 = _2495 + 4;
            uint _2551 = uint(int(uint(_2549) >> uint(2)));
            float _2553 = as_type<float>(_dmw26.y);
            int _2555 = _2495 + 8;
            uint _2557 = uint(int(uint(_2555) >> uint(2)));
            float _2559 = as_type<float>(_dmw26.z);
            int _2561 = _2495 + 12;
            uint _2563 = uint(int(uint(_2561) >> uint(2)));
            float _2565 = as_type<float>(_dmw26.w);
            int _2567 = _2441 + 262256;
            uint _2569 = uint(int(uint(_2519) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2569)];
            float _2571 = as_type<float>(_dmw29.x);
            int _2573 = _2519 + 4;
            uint _2575 = uint(int(uint(_2573) >> uint(2)));
            float _2577 = as_type<float>(_dmw29.y);
            int _2579 = _2519 + 8;
            uint _2581 = uint(int(uint(_2579) >> uint(2)));
            float _2583 = as_type<float>(_dmw29.z);
            int _2585 = _2519 + 12;
            uint _2587 = uint(int(uint(_2585) >> uint(2)));
            float _2589 = as_type<float>(_dmw29.w);
            int _2591 = _1555 * 656;
            uint _2593 = uint(int(uint(_2543) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2593)];
            float _2595 = as_type<float>(_dmw30.x);
            int _2597 = _2543 + 4;
            uint _2599 = uint(int(uint(_2597) >> uint(2)));
            float _2601 = as_type<float>(_dmw30.y);
            int _2603 = _2543 + 8;
            uint _2605 = uint(int(uint(_2603) >> uint(2)));
            float _2607 = as_type<float>(_dmw30.z);
            int _2609 = _2543 + 12;
            uint _2611 = uint(int(uint(_2609) >> uint(2)));
            float _2613 = as_type<float>(_dmw30.w);
            int _2615 = _1575 * 656;
            int _2617 = _2591 + 262144;
            uint _2619 = uint(int(uint(_2567) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2619)];
            float _2621 = as_type<float>(_dmw31.x);
            int _2623 = _2567 + 4;
            uint _2625 = uint(int(uint(_2623) >> uint(2)));
            float _2627 = as_type<float>(_dmw31.y);
            int _2629 = _2567 + 8;
            uint _2631 = uint(int(uint(_2629) >> uint(2)));
            float _2633 = as_type<float>(_dmw31.z);
            int _2635 = _2567 + 12;
            uint _2637 = uint(int(uint(_2635) >> uint(2)));
            float _2639 = as_type<float>(_dmw31.w);
            int _2641 = _2591 + 262192;
            int _2643 = _2591 + 262160;
            uint _2645 = uint(int(uint(_2617) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2645)];
            float _2647 = as_type<float>(_dmw32.x);
            int _2649 = _2617 + 4;
            uint _2651 = uint(int(uint(_2649) >> uint(2)));
            float _2653 = as_type<float>(_dmw32.y);
            int _2655 = _2617 + 8;
            uint _2657 = uint(int(uint(_2655) >> uint(2)));
            float _2659 = as_type<float>(_dmw32.z);
            int _2661 = _2617 + 12;
            uint _2663 = uint(int(uint(_2661) >> uint(2)));
            float _2665 = as_type<float>(_dmw32.w);
            int _2667 = _2591 + 262208;
            int _2669 = _2591 + 262176;
            uint _2671 = uint(int(uint(_2641) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2671)];
            float _2673 = as_type<float>(_dmw35.x);
            int _2675 = _2641 + 4;
            uint _2677 = uint(int(uint(_2675) >> uint(2)));
            float _2679 = as_type<float>(_dmw35.y);
            int _2681 = _2641 + 8;
            uint _2683 = uint(int(uint(_2681) >> uint(2)));
            float _2685 = as_type<float>(_dmw35.z);
            int _2687 = _2641 + 12;
            uint _2689 = uint(int(uint(_2687) >> uint(2)));
            float _2691 = as_type<float>(_dmw35.w);
            int _2693 = _2591 + 262224;
            int _2695 = _2591 + 262240;
            uint _2697 = uint(int(uint(_2643) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2697)];
            float _2699 = as_type<float>(_dmw33.x);
            int _2701 = _2643 + 4;
            uint _2703 = uint(int(uint(_2701) >> uint(2)));
            float _2705 = as_type<float>(_dmw33.y);
            int _2707 = _2643 + 8;
            uint _2709 = uint(int(uint(_2707) >> uint(2)));
            float _2711 = as_type<float>(_dmw33.z);
            int _2713 = _2643 + 12;
            uint _2715 = uint(int(uint(_2713) >> uint(2)));
            float _2717 = as_type<float>(_dmw33.w);
            int _2719 = _2591 + 262256;
            int _2721 = _2615 + 262144;
            uint _2723 = uint(int(uint(_2667) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2723)];
            float _2725 = as_type<float>(_dmw36.x);
            int _2727 = _2667 + 4;
            uint _2729 = uint(int(uint(_2727) >> uint(2)));
            float _2731 = as_type<float>(_dmw36.y);
            int _2733 = _2667 + 8;
            uint _2735 = uint(int(uint(_2733) >> uint(2)));
            float _2737 = as_type<float>(_dmw36.z);
            int _2739 = _2667 + 12;
            uint _2741 = uint(int(uint(_2739) >> uint(2)));
            float _2743 = as_type<float>(_dmw36.w);
            int _2745 = _2615 + 262192;
            int _2747 = _2615 + 262160;
            uint _2749 = uint(int(uint(_2669) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2749)];
            float _2751 = as_type<float>(_dmw34.x);
            int _2753 = _2669 + 4;
            uint _2755 = uint(int(uint(_2753) >> uint(2)));
            float _2757 = as_type<float>(_dmw34.y);
            int _2759 = _2669 + 8;
            uint _2761 = uint(int(uint(_2759) >> uint(2)));
            float _2763 = as_type<float>(_dmw34.z);
            int _2765 = _2669 + 12;
            uint _2767 = uint(int(uint(_2765) >> uint(2)));
            float _2769 = as_type<float>(_dmw34.w);
            int _2771 = _2615 + 262208;
            int _2773 = _2615 + 262176;
            uint _2775 = uint(int(uint(_2693) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
            float _2777 = as_type<float>(_dmw37.x);
            int _2779 = _2693 + 4;
            uint _2781 = uint(int(uint(_2779) >> uint(2)));
            float _2783 = as_type<float>(_dmw37.y);
            int _2785 = _2693 + 8;
            uint _2787 = uint(int(uint(_2785) >> uint(2)));
            float _2789 = as_type<float>(_dmw37.z);
            int _2791 = _2693 + 12;
            uint _2793 = uint(int(uint(_2791) >> uint(2)));
            float _2795 = as_type<float>(_dmw37.w);
            int _2797 = _2615 + 262224;
            int _2799 = _2615 + 262240;
            uint _2801 = uint(int(uint(_2695) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2801)];
            float _2803 = as_type<float>(_dmw38.x);
            int _2805 = _2695 + 4;
            uint _2807 = uint(int(uint(_2805) >> uint(2)));
            float _2809 = as_type<float>(_dmw38.y);
            int _2811 = _2695 + 8;
            uint _2813 = uint(int(uint(_2811) >> uint(2)));
            float _2815 = as_type<float>(_dmw38.z);
            int _2817 = _2695 + 12;
            uint _2819 = uint(int(uint(_2817) >> uint(2)));
            float _2821 = as_type<float>(_dmw38.w);
            int _2823 = _2615 + 262256;
            uint _2825 = uint(int(uint(_2719) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2825)];
            float _2827 = as_type<float>(_dmw39.x);
            int _2829 = _2719 + 4;
            uint _2831 = uint(int(uint(_2829) >> uint(2)));
            float _2833 = as_type<float>(_dmw39.y);
            int _2835 = _2719 + 8;
            uint _2837 = uint(int(uint(_2835) >> uint(2)));
            float _2839 = as_type<float>(_dmw39.z);
            int _2841 = _2719 + 12;
            uint _2843 = uint(int(uint(_2841) >> uint(2)));
            float _2845 = as_type<float>(_dmw39.w);
            uint _2847 = uint(int(uint(_2721) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2847)];
            float _2849 = as_type<float>(_dmw40.x);
            int _2851 = _2721 + 4;
            uint _2853 = uint(int(uint(_2851) >> uint(2)));
            float _2855 = as_type<float>(_dmw40.y);
            int _2857 = _2721 + 8;
            uint _2859 = uint(int(uint(_2857) >> uint(2)));
            float _2861 = as_type<float>(_dmw40.z);
            int _2863 = _2721 + 12;
            uint _2865 = uint(int(uint(_2863) >> uint(2)));
            float _2867 = as_type<float>(_dmw40.w);
            uint _2869 = uint(int(uint(_2745) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2869)];
            float _2871 = as_type<float>(_dmw43.x);
            int _2873 = _2745 + 4;
            uint _2875 = uint(int(uint(_2873) >> uint(2)));
            float _2877 = as_type<float>(_dmw43.y);
            int _2879 = _2745 + 8;
            uint _2881 = uint(int(uint(_2879) >> uint(2)));
            float _2883 = as_type<float>(_dmw43.z);
            int _2885 = _2745 + 12;
            uint _2887 = uint(int(uint(_2885) >> uint(2)));
            float _2889 = as_type<float>(_dmw43.w);
            uint _2891 = uint(int(uint(_2747) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2891)];
            float _2893 = as_type<float>(_dmw41.x);
            int _2895 = _2747 + 4;
            uint _2897 = uint(int(uint(_2895) >> uint(2)));
            float _2899 = as_type<float>(_dmw41.y);
            int _2901 = _2747 + 8;
            uint _2903 = uint(int(uint(_2901) >> uint(2)));
            float _2905 = as_type<float>(_dmw41.z);
            int _2907 = _2747 + 12;
            uint _2909 = uint(int(uint(_2907) >> uint(2)));
            float _2911 = as_type<float>(_dmw41.w);
            uint _2913 = uint(int(uint(_2771) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2913)];
            float _2915 = as_type<float>(_dmw44.x);
            int _2917 = _2771 + 4;
            uint _2919 = uint(int(uint(_2917) >> uint(2)));
            float _2921 = as_type<float>(_dmw44.y);
            int _2923 = _2771 + 8;
            uint _2925 = uint(int(uint(_2923) >> uint(2)));
            float _2927 = as_type<float>(_dmw44.z);
            int _2929 = _2771 + 12;
            uint _2931 = uint(int(uint(_2929) >> uint(2)));
            float _2933 = as_type<float>(_dmw44.w);
            uint _2935 = uint(int(uint(_2773) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2935)];
            float _2937 = as_type<float>(_dmw42.x);
            int _2939 = _2773 + 4;
            uint _2941 = uint(int(uint(_2939) >> uint(2)));
            float _2943 = as_type<float>(_dmw42.y);
            int _2945 = _2773 + 8;
            uint _2947 = uint(int(uint(_2945) >> uint(2)));
            float _2949 = as_type<float>(_dmw42.z);
            int _2951 = _2773 + 12;
            uint _2953 = uint(int(uint(_2951) >> uint(2)));
            float _2955 = as_type<float>(_dmw42.w);
            uint _2957 = uint(int(uint(_2797) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2957)];
            float _2959 = as_type<float>(_dmw45.x);
            int _2961 = _2797 + 4;
            uint _2963 = uint(int(uint(_2961) >> uint(2)));
            float _2965 = as_type<float>(_dmw45.y);
            int _2967 = _2797 + 8;
            uint _2969 = uint(int(uint(_2967) >> uint(2)));
            float _2971 = as_type<float>(_dmw45.z);
            int _2973 = _2797 + 12;
            uint _2975 = uint(int(uint(_2973) >> uint(2)));
            float _2977 = as_type<float>(_dmw45.w);
            uint _2979 = uint(int(uint(_2799) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2979)];
            float _2981 = as_type<float>(_dmw46.x);
            int _2983 = _2799 + 4;
            uint _2985 = uint(int(uint(_2983) >> uint(2)));
            float _2987 = as_type<float>(_dmw46.y);
            int _2989 = _2799 + 8;
            uint _2991 = uint(int(uint(_2989) >> uint(2)));
            float _2993 = as_type<float>(_dmw46.z);
            int _2995 = _2799 + 12;
            uint _2997 = uint(int(uint(_2995) >> uint(2)));
            float _2999 = as_type<float>(_dmw46.w);
            uint _3001 = uint(int(uint(_2823) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3001)];
            float _3003 = as_type<float>(_dmw47.x);
            int _3005 = _2823 + 4;
            uint _3007 = uint(int(uint(_3005) >> uint(2)));
            float _3009 = as_type<float>(_dmw47.y);
            int _3011 = _2823 + 8;
            uint _3013 = uint(int(uint(_3011) >> uint(2)));
            float _3015 = as_type<float>(_dmw47.z);
            int _3017 = _2823 + 12;
            uint _3019 = uint(int(uint(_3017) >> uint(2)));
            float _3021 = as_type<float>(_dmw47.w);
            float _3023 = _1501 + (-1.0);
            float _3025 = _1479 + (-1.0);
            float _3027 = _1479 + _3023;
            float _3029 = -_3023;
            float _3031 = _2451 * _3029;
            float _3033 = -_3023;
            float _3035 = _2457 * _3033;
            float _3037 = -_3023;
            float _3039 = _2463 * _3037;
            float _3041 = -_3023;
            float _3043 = _2469 * _3041;
            float _3045 = -_3023;
            float _3047 = _2475 * _3045;
            float _3049 = -_3023;
            float _3051 = _2481 * _3049;
            float _3053 = -_3023;
            float _3055 = _2487 * _3053;
            float _3057 = -_3023;
            float _3059 = _2493 * _3057;
            float _3061 = -_3023;
            float _3063 = _2499 * _3061;
            float _3065 = -_3023;
            float _3067 = _2505 * _3065;
            float _3069 = -_3023;
            float _3071 = _2511 * _3069;
            float _3073 = -_3023;
            float _3075 = _2517 * _3073;
            float _3077 = -_3023;
            float _3079 = _2523 * _3077;
            float _3081 = -_3023;
            float _3083 = _2529 * _3081;
            float _3085 = -_3023;
            float _3087 = _2535 * _3085;
            float _3089 = -_3023;
            float _3091 = _2541 * _3089;
            float _3093 = -_3023;
            float _3095 = _2547 * _3093;
            float _3097 = -_3023;
            float _3099 = _2553 * _3097;
            float _3101 = -_3023;
            float _3103 = _2559 * _3101;
            float _3105 = -_3023;
            float _3107 = _2565 * _3105;
            float _3109 = -_3023;
            float _3111 = _2571 * _3109;
            float _3113 = -_3023;
            float _3115 = _2577 * _3113;
            float _3117 = -_3023;
            float _3119 = _2583 * _3117;
            float _3121 = -_3023;
            float _3123 = _2589 * _3121;
            float _3125 = -_3023;
            float _3127 = _2595 * _3125;
            float _3129 = -_3023;
            float _3131 = _2601 * _3129;
            float _3133 = -_3023;
            float _3135 = _2607 * _3133;
            float _3137 = -_3023;
            float _3139 = _2613 * _3137;
            float _3141 = -_3023;
            float _3143 = _2621 * _3141;
            float _3145 = -_3023;
            float _3147 = _2627 * _3145;
            float _3149 = -_3023;
            float _3151 = _2633 * _3149;
            float _3153 = -_3023;
            float _3155 = _2639 * _3153;
            float _3157 = -_3025;
            float _3159 = fma(_3157, _2647, _3031);
            float _3161 = -_3025;
            float _3163 = fma(_3161, _2653, _3035);
            float _3165 = -_3025;
            float _3167 = fma(_3165, _2659, _3039);
            float _3169 = -_3025;
            float _3171 = fma(_3169, _2665, _3043);
            float _3173 = -_3025;
            float _3175 = fma(_3173, _2673, _3047);
            float _3177 = -_3025;
            float _3179 = fma(_3177, _2679, _3051);
            float _3181 = -_3025;
            float _3183 = fma(_3181, _2685, _3055);
            float _3185 = -_3025;
            float _3187 = fma(_3185, _2691, _3059);
            float _3189 = -_3025;
            float _3191 = fma(_3189, _2699, _3063);
            float _3193 = -_3025;
            float _3195 = fma(_3193, _2705, _3067);
            float _3197 = -_3025;
            float _3199 = fma(_3197, _2711, _3071);
            float _3201 = -_3025;
            float _3203 = fma(_3201, _2717, _3075);
            float _3205 = -_3025;
            float _3207 = fma(_3205, _2725, _3079);
            float _3209 = -_3025;
            float _3211 = fma(_3209, _2731, _3083);
            float _3213 = -_3025;
            float _3215 = fma(_3213, _2737, _3087);
            float _3217 = -_3025;
            float _3219 = fma(_3217, _2743, _3091);
            float _3221 = -_3025;
            float _3223 = fma(_3221, _2751, _3095);
            float _3225 = -_3025;
            float _3227 = fma(_3225, _2757, _3099);
            float _3229 = -_3025;
            float _3231 = fma(_3229, _2763, _3103);
            float _3233 = -_3025;
            float _3235 = fma(_3233, _2769, _3107);
            float _3237 = -_3025;
            float _3239 = fma(_3237, _2777, _3111);
            float _3241 = -_3025;
            float _3243 = fma(_3241, _2783, _3115);
            float _3245 = -_3025;
            float _3247 = fma(_3245, _2789, _3119);
            float _3249 = -_3025;
            float _3251 = fma(_3249, _2795, _3123);
            float _3253 = -_3025;
            float _3255 = fma(_3253, _2803, _3127);
            float _3257 = -_3025;
            float _3259 = fma(_3257, _2809, _3131);
            float _3261 = -_3025;
            float _3263 = fma(_3261, _2815, _3135);
            float _3265 = -_3025;
            float _3267 = fma(_3265, _2821, _3139);
            float _3269 = -_3025;
            float _3271 = fma(_3269, _2827, _3143);
            float _3273 = -_3025;
            float _3275 = fma(_3273, _2833, _3147);
            float _3277 = -_3025;
            float _3279 = fma(_3277, _2839, _3151);
            float _3281 = -_3025;
            float _3283 = fma(_3281, _2845, _3155);
            float _3285 = fma(_3027, _2849, _3159);
            float _3287 = fma(_3027, _2855, _3163);
            float _3289 = fma(_3027, _2861, _3167);
            float _3291 = fma(_3027, _2867, _3171);
            float _3293 = fma(_3027, _2871, _3175);
            float _3295 = fma(_3027, _2877, _3179);
            float _3297 = fma(_3027, _2883, _3183);
            float _3299 = fma(_3027, _2889, _3187);
            float _3301 = fma(_3027, _2893, _3191);
            float _3303 = fma(_3027, _2899, _3195);
            float _3305 = fma(_3027, _2905, _3199);
            float _3307 = fma(_3027, _2911, _3203);
            float _3309 = fma(_3027, _2915, _3207);
            float _3311 = fma(_3027, _2921, _3211);
            float _3313 = fma(_3027, _2927, _3215);
            float _3315 = fma(_3027, _2933, _3219);
            float _3317 = fma(_3027, _2937, _3223);
            float _3319 = fma(_3027, _2943, _3227);
            float _3321 = fma(_3027, _2949, _3231);
            float _3323 = fma(_3027, _2955, _3235);
            float _3325 = fma(_3027, _2959, _3239);
            float _3327 = fma(_3027, _2965, _3243);
            float _3329 = fma(_3027, _2971, _3247);
            float _3331 = fma(_3027, _2977, _3251);
            float _3333 = fma(_3027, _2981, _3255);
            float _3335 = fma(_3027, _2987, _3259);
            float _3337 = fma(_3027, _2993, _3263);
            float _3339 = fma(_3027, _2999, _3267);
            float _3341 = fma(_3027, _3003, _3271);
            float _3343 = fma(_3027, _3009, _3275);
            float _3345 = fma(_3027, _3015, _3279);
            float _3347 = fma(_3027, _3021, _3283);
            _2375 = _3299;
            _2377 = _3295;
            _2379 = _3327;
            _2381 = _3309;
            _2383 = _3293;
            _2385 = _3313;
            _2387 = _3329;
            _2389 = _3311;
            _2391 = _3315;
            _2393 = _3331;
            _2395 = _3297;
            _2397 = _3325;
            _2399 = _3343;
            _2401 = _3291;
            _2403 = _3341;
            _2405 = _3301;
            _2407 = _3303;
            _2409 = _3335;
            _2411 = _3285;
            _2413 = _3287;
            _2415 = _3289;
            _2417 = _3333;
            _2419 = _3345;
            _2421 = _3307;
            _2423 = _3317;
            _2425 = _3337;
            _2427 = _3347;
            _2429 = _3321;
            _2431 = _3323;
            _2433 = _3339;
            _2435 = _3305;
            _2437 = _3319;
            _2439 = true;
        }
    }
    else
    {
        float _3349 = _1479 * (-0.707106769084930419921875);
        float _3351 = _1501 + (-1.0);
        float _3353 = _1479 + (-1.0);
        float _3355 = fma(_1501, 0.707106769084930419921875, _3349);
        bool _3357 = _3355 >= 0.0;
        bool _3359 = !_3357;
        if (!_3359)
        {
            int _3361 = _1555 * 656;
            int _3363 = _3361 + 262144;
            int _3365 = _3361 + 262192;
            int _3367 = _3361 + 262160;
            uint _3369 = uint(int(uint(_3363) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3369)];
            float _3371 = as_type<float>(_dmw48.x);
            int _3373 = _3363 + 4;
            uint _3375 = uint(int(uint(_3373) >> uint(2)));
            float _3377 = as_type<float>(_dmw48.y);
            int _3379 = _3363 + 8;
            uint _3381 = uint(int(uint(_3379) >> uint(2)));
            float _3383 = as_type<float>(_dmw48.z);
            int _3385 = _3363 + 12;
            uint _3387 = uint(int(uint(_3385) >> uint(2)));
            float _3389 = as_type<float>(_dmw48.w);
            int _3391 = _3361 + 262208;
            uint _3393 = uint(int(uint(_3365) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3393)];
            float _3395 = as_type<float>(_dmw51.x);
            int _3397 = _3365 + 4;
            uint _3399 = uint(int(uint(_3397) >> uint(2)));
            float _3401 = as_type<float>(_dmw51.y);
            int _3403 = _3365 + 8;
            uint _3405 = uint(int(uint(_3403) >> uint(2)));
            float _3407 = as_type<float>(_dmw51.z);
            int _3409 = _3365 + 12;
            uint _3411 = uint(int(uint(_3409) >> uint(2)));
            float _3413 = as_type<float>(_dmw51.w);
            int _3415 = _3361 + 262176;
            uint _3417 = uint(int(uint(_3367) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3417)];
            float _3419 = as_type<float>(_dmw49.x);
            int _3421 = _3367 + 4;
            uint _3423 = uint(int(uint(_3421) >> uint(2)));
            float _3425 = as_type<float>(_dmw49.y);
            int _3427 = _3367 + 8;
            uint _3429 = uint(int(uint(_3427) >> uint(2)));
            float _3431 = as_type<float>(_dmw49.z);
            int _3433 = _3367 + 12;
            uint _3435 = uint(int(uint(_3433) >> uint(2)));
            float _3437 = as_type<float>(_dmw49.w);
            int _3439 = _3361 + 262224;
            uint _3441 = uint(int(uint(_3391) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3441)];
            float _3443 = as_type<float>(_dmw52.x);
            int _3445 = _3391 + 4;
            uint _3447 = uint(int(uint(_3445) >> uint(2)));
            float _3449 = as_type<float>(_dmw52.y);
            int _3451 = _3391 + 8;
            uint _3453 = uint(int(uint(_3451) >> uint(2)));
            float _3455 = as_type<float>(_dmw52.z);
            int _3457 = _3391 + 12;
            uint _3459 = uint(int(uint(_3457) >> uint(2)));
            float _3461 = as_type<float>(_dmw52.w);
            int _3463 = _3361 + 262240;
            uint _3465 = uint(int(uint(_3415) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3465)];
            float _3467 = as_type<float>(_dmw50.x);
            int _3469 = _3415 + 4;
            uint _3471 = uint(int(uint(_3469) >> uint(2)));
            float _3473 = as_type<float>(_dmw50.y);
            int _3475 = _3415 + 8;
            uint _3477 = uint(int(uint(_3475) >> uint(2)));
            float _3479 = as_type<float>(_dmw50.z);
            int _3481 = _3415 + 12;
            uint _3483 = uint(int(uint(_3481) >> uint(2)));
            float _3485 = as_type<float>(_dmw50.w);
            int _3487 = _3361 + 262256;
            uint _3489 = uint(int(uint(_3439) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3489)];
            float _3491 = as_type<float>(_dmw53.x);
            int _3493 = _3439 + 4;
            uint _3495 = uint(int(uint(_3493) >> uint(2)));
            float _3497 = as_type<float>(_dmw53.y);
            int _3499 = _3439 + 8;
            uint _3501 = uint(int(uint(_3499) >> uint(2)));
            float _3503 = as_type<float>(_dmw53.z);
            int _3505 = _3439 + 12;
            uint _3507 = uint(int(uint(_3505) >> uint(2)));
            float _3509 = as_type<float>(_dmw53.w);
            int _3511 = _1503 * 656;
            uint _3513 = uint(int(uint(_3463) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3513)];
            float _3515 = as_type<float>(_dmw54.x);
            int _3517 = _3463 + 4;
            uint _3519 = uint(int(uint(_3517) >> uint(2)));
            float _3521 = as_type<float>(_dmw54.y);
            int _3523 = _3463 + 8;
            uint _3525 = uint(int(uint(_3523) >> uint(2)));
            float _3527 = as_type<float>(_dmw54.z);
            int _3529 = _3463 + 12;
            uint _3531 = uint(int(uint(_3529) >> uint(2)));
            float _3533 = as_type<float>(_dmw54.w);
            int _3535 = _1575 * 656;
            int _3537 = _3511 + 262144;
            uint _3539 = uint(int(uint(_3487) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3539)];
            float _3541 = as_type<float>(_dmw55.x);
            int _3543 = _3487 + 4;
            uint _3545 = uint(int(uint(_3543) >> uint(2)));
            float _3547 = as_type<float>(_dmw55.y);
            int _3549 = _3487 + 8;
            uint _3551 = uint(int(uint(_3549) >> uint(2)));
            float _3553 = as_type<float>(_dmw55.z);
            int _3555 = _3487 + 12;
            uint _3557 = uint(int(uint(_3555) >> uint(2)));
            float _3559 = as_type<float>(_dmw55.w);
            int _3561 = _3511 + 262192;
            int _3563 = _3511 + 262160;
            uint _3565 = uint(int(uint(_3537) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3565)];
            float _3567 = as_type<float>(_dmw56.x);
            int _3569 = _3537 + 4;
            uint _3571 = uint(int(uint(_3569) >> uint(2)));
            float _3573 = as_type<float>(_dmw56.y);
            int _3575 = _3537 + 8;
            uint _3577 = uint(int(uint(_3575) >> uint(2)));
            float _3579 = as_type<float>(_dmw56.z);
            int _3581 = _3537 + 12;
            uint _3583 = uint(int(uint(_3581) >> uint(2)));
            float _3585 = as_type<float>(_dmw56.w);
            int _3587 = _3511 + 262208;
            int _3589 = _3511 + 262176;
            uint _3591 = uint(int(uint(_3561) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3591)];
            float _3593 = as_type<float>(_dmw59.x);
            int _3595 = _3561 + 4;
            uint _3597 = uint(int(uint(_3595) >> uint(2)));
            float _3599 = as_type<float>(_dmw59.y);
            int _3601 = _3561 + 8;
            uint _3603 = uint(int(uint(_3601) >> uint(2)));
            float _3605 = as_type<float>(_dmw59.z);
            int _3607 = _3561 + 12;
            uint _3609 = uint(int(uint(_3607) >> uint(2)));
            float _3611 = as_type<float>(_dmw59.w);
            int _3613 = _3511 + 262224;
            int _3615 = _3511 + 262240;
            uint _3617 = uint(int(uint(_3563) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3617)];
            float _3619 = as_type<float>(_dmw57.x);
            int _3621 = _3563 + 4;
            uint _3623 = uint(int(uint(_3621) >> uint(2)));
            float _3625 = as_type<float>(_dmw57.y);
            int _3627 = _3563 + 8;
            uint _3629 = uint(int(uint(_3627) >> uint(2)));
            float _3631 = as_type<float>(_dmw57.z);
            int _3633 = _3563 + 12;
            uint _3635 = uint(int(uint(_3633) >> uint(2)));
            float _3637 = as_type<float>(_dmw57.w);
            int _3639 = _3511 + 262256;
            int _3641 = _3535 + 262144;
            uint _3643 = uint(int(uint(_3587) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3643)];
            float _3645 = as_type<float>(_dmw60.x);
            int _3647 = _3587 + 4;
            uint _3649 = uint(int(uint(_3647) >> uint(2)));
            float _3651 = as_type<float>(_dmw60.y);
            int _3653 = _3587 + 8;
            uint _3655 = uint(int(uint(_3653) >> uint(2)));
            float _3657 = as_type<float>(_dmw60.z);
            int _3659 = _3587 + 12;
            uint _3661 = uint(int(uint(_3659) >> uint(2)));
            float _3663 = as_type<float>(_dmw60.w);
            int _3665 = _3535 + 262192;
            int _3667 = _3535 + 262160;
            uint _3669 = uint(int(uint(_3589) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3669)];
            float _3671 = as_type<float>(_dmw58.x);
            int _3673 = _3589 + 4;
            uint _3675 = uint(int(uint(_3673) >> uint(2)));
            float _3677 = as_type<float>(_dmw58.y);
            int _3679 = _3589 + 8;
            uint _3681 = uint(int(uint(_3679) >> uint(2)));
            float _3683 = as_type<float>(_dmw58.z);
            int _3685 = _3589 + 12;
            uint _3687 = uint(int(uint(_3685) >> uint(2)));
            float _3689 = as_type<float>(_dmw58.w);
            int _3691 = _3535 + 262208;
            int _3693 = _3535 + 262176;
            uint _3695 = uint(int(uint(_3613) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3695)];
            float _3697 = as_type<float>(_dmw61.x);
            int _3699 = _3613 + 4;
            uint _3701 = uint(int(uint(_3699) >> uint(2)));
            float _3703 = as_type<float>(_dmw61.y);
            int _3705 = _3613 + 8;
            uint _3707 = uint(int(uint(_3705) >> uint(2)));
            float _3709 = as_type<float>(_dmw61.z);
            int _3711 = _3613 + 12;
            uint _3713 = uint(int(uint(_3711) >> uint(2)));
            float _3715 = as_type<float>(_dmw61.w);
            int _3717 = _3535 + 262224;
            int _3719 = _3535 + 262240;
            uint _3721 = uint(int(uint(_3615) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3721)];
            float _3723 = as_type<float>(_dmw62.x);
            int _3725 = _3615 + 4;
            uint _3727 = uint(int(uint(_3725) >> uint(2)));
            float _3729 = as_type<float>(_dmw62.y);
            int _3731 = _3615 + 8;
            uint _3733 = uint(int(uint(_3731) >> uint(2)));
            float _3735 = as_type<float>(_dmw62.z);
            int _3737 = _3615 + 12;
            uint _3739 = uint(int(uint(_3737) >> uint(2)));
            float _3741 = as_type<float>(_dmw62.w);
            int _3743 = _3535 + 262256;
            uint _3745 = uint(int(uint(_3639) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3745)];
            float _3747 = as_type<float>(_dmw63.x);
            int _3749 = _3639 + 4;
            uint _3751 = uint(int(uint(_3749) >> uint(2)));
            float _3753 = as_type<float>(_dmw63.y);
            int _3755 = _3639 + 8;
            uint _3757 = uint(int(uint(_3755) >> uint(2)));
            float _3759 = as_type<float>(_dmw63.z);
            int _3761 = _3639 + 12;
            uint _3763 = uint(int(uint(_3761) >> uint(2)));
            float _3765 = as_type<float>(_dmw63.w);
            uint _3767 = uint(int(uint(_3641) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3767)];
            float _3769 = as_type<float>(_dmw64.x);
            int _3771 = _3641 + 4;
            uint _3773 = uint(int(uint(_3771) >> uint(2)));
            float _3775 = as_type<float>(_dmw64.y);
            int _3777 = _3641 + 8;
            uint _3779 = uint(int(uint(_3777) >> uint(2)));
            float _3781 = as_type<float>(_dmw64.z);
            int _3783 = _3641 + 12;
            uint _3785 = uint(int(uint(_3783) >> uint(2)));
            float _3787 = as_type<float>(_dmw64.w);
            uint _3789 = uint(int(uint(_3665) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3789)];
            float _3791 = as_type<float>(_dmw67.x);
            int _3793 = _3665 + 4;
            uint _3795 = uint(int(uint(_3793) >> uint(2)));
            float _3797 = as_type<float>(_dmw67.y);
            int _3799 = _3665 + 8;
            uint _3801 = uint(int(uint(_3799) >> uint(2)));
            float _3803 = as_type<float>(_dmw67.z);
            int _3805 = _3665 + 12;
            uint _3807 = uint(int(uint(_3805) >> uint(2)));
            float _3809 = as_type<float>(_dmw67.w);
            uint _3811 = uint(int(uint(_3667) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3811)];
            float _3813 = as_type<float>(_dmw65.x);
            int _3815 = _3667 + 4;
            uint _3817 = uint(int(uint(_3815) >> uint(2)));
            float _3819 = as_type<float>(_dmw65.y);
            int _3821 = _3667 + 8;
            uint _3823 = uint(int(uint(_3821) >> uint(2)));
            float _3825 = as_type<float>(_dmw65.z);
            int _3827 = _3667 + 12;
            uint _3829 = uint(int(uint(_3827) >> uint(2)));
            float _3831 = as_type<float>(_dmw65.w);
            uint _3833 = uint(int(uint(_3691) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3833)];
            float _3835 = as_type<float>(_dmw68.x);
            int _3837 = _3691 + 4;
            uint _3839 = uint(int(uint(_3837) >> uint(2)));
            float _3841 = as_type<float>(_dmw68.y);
            int _3843 = _3691 + 8;
            uint _3845 = uint(int(uint(_3843) >> uint(2)));
            float _3847 = as_type<float>(_dmw68.z);
            int _3849 = _3691 + 12;
            uint _3851 = uint(int(uint(_3849) >> uint(2)));
            float _3853 = as_type<float>(_dmw68.w);
            uint _3855 = uint(int(uint(_3693) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3855)];
            float _3857 = as_type<float>(_dmw66.x);
            int _3859 = _3693 + 4;
            uint _3861 = uint(int(uint(_3859) >> uint(2)));
            float _3863 = as_type<float>(_dmw66.y);
            int _3865 = _3693 + 8;
            uint _3867 = uint(int(uint(_3865) >> uint(2)));
            float _3869 = as_type<float>(_dmw66.z);
            int _3871 = _3693 + 12;
            uint _3873 = uint(int(uint(_3871) >> uint(2)));
            float _3875 = as_type<float>(_dmw66.w);
            uint _3877 = uint(int(uint(_3717) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3877)];
            float _3879 = as_type<float>(_dmw69.x);
            int _3881 = _3717 + 4;
            uint _3883 = uint(int(uint(_3881) >> uint(2)));
            float _3885 = as_type<float>(_dmw69.y);
            int _3887 = _3717 + 8;
            uint _3889 = uint(int(uint(_3887) >> uint(2)));
            float _3891 = as_type<float>(_dmw69.z);
            int _3893 = _3717 + 12;
            uint _3895 = uint(int(uint(_3893) >> uint(2)));
            float _3897 = as_type<float>(_dmw69.w);
            uint _3899 = uint(int(uint(_3719) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3899)];
            float _3901 = as_type<float>(_dmw70.x);
            int _3903 = _3719 + 4;
            uint _3905 = uint(int(uint(_3903) >> uint(2)));
            float _3907 = as_type<float>(_dmw70.y);
            int _3909 = _3719 + 8;
            uint _3911 = uint(int(uint(_3909) >> uint(2)));
            float _3913 = as_type<float>(_dmw70.z);
            int _3915 = _3719 + 12;
            uint _3917 = uint(int(uint(_3915) >> uint(2)));
            float _3919 = as_type<float>(_dmw70.w);
            uint _3921 = uint(int(uint(_3743) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3921)];
            float _3923 = as_type<float>(_dmw71.x);
            int _3925 = _3743 + 4;
            uint _3927 = uint(int(uint(_3925) >> uint(2)));
            float _3929 = as_type<float>(_dmw71.y);
            int _3931 = _3743 + 8;
            uint _3933 = uint(int(uint(_3931) >> uint(2)));
            float _3935 = as_type<float>(_dmw71.z);
            int _3937 = _3743 + 12;
            uint _3939 = uint(int(uint(_3937) >> uint(2)));
            float _3941 = as_type<float>(_dmw71.w);
            float _3943 = -_3353;
            float _3945 = _3351 + _3943;
            float _3947 = -_3945;
            float _3949 = _1501 + _3947;
            float _3951 = _3371 * _3945;
            float _3953 = _3377 * _3945;
            float _3955 = _3383 * _3945;
            float _3957 = _3389 * _3945;
            float _3959 = _3395 * _3945;
            float _3961 = _3401 * _3945;
            float _3963 = _3407 * _3945;
            float _3965 = _3413 * _3945;
            float _3967 = _3419 * _3945;
            float _3969 = _3425 * _3945;
            float _3971 = _3431 * _3945;
            float _3973 = _3437 * _3945;
            float _3975 = _3443 * _3945;
            float _3977 = _3449 * _3945;
            float _3979 = _3455 * _3945;
            float _3981 = _3461 * _3945;
            float _3983 = _3467 * _3945;
            float _3985 = _3473 * _3945;
            float _3987 = _3479 * _3945;
            float _3989 = _3485 * _3945;
            float _3991 = _3491 * _3945;
            float _3993 = _3497 * _3945;
            float _3995 = _3503 * _3945;
            float _3997 = _3509 * _3945;
            float _3999 = _3515 * _3945;
            float _4001 = _3521 * _3945;
            float _4003 = _3527 * _3945;
            float _4005 = _3533 * _3945;
            float _4007 = _3541 * _3945;
            float _4009 = _3547 * _3945;
            float _4011 = _3553 * _3945;
            float _4013 = _3559 * _3945;
            float _4015 = -_3351;
            float _4017 = fma(_3567, _4015, _3951);
            float _4019 = -_3351;
            float _4021 = fma(_3573, _4019, _3953);
            float _4023 = -_3351;
            float _4025 = fma(_3579, _4023, _3955);
            float _4027 = -_3351;
            float _4029 = fma(_3585, _4027, _3957);
            float _4031 = -_3351;
            float _4033 = fma(_3593, _4031, _3959);
            float _4035 = -_3351;
            float _4037 = fma(_3599, _4035, _3961);
            float _4039 = -_3351;
            float _4041 = fma(_3605, _4039, _3963);
            float _4043 = -_3351;
            float _4045 = fma(_3611, _4043, _3965);
            float _4047 = -_3351;
            float _4049 = fma(_3619, _4047, _3967);
            float _4051 = -_3351;
            float _4053 = fma(_3625, _4051, _3969);
            float _4055 = -_3351;
            float _4057 = fma(_3631, _4055, _3971);
            float _4059 = -_3351;
            float _4061 = fma(_3637, _4059, _3973);
            float _4063 = -_3351;
            float _4065 = fma(_3645, _4063, _3975);
            float _4067 = -_3351;
            float _4069 = fma(_3651, _4067, _3977);
            float _4071 = -_3351;
            float _4073 = fma(_3657, _4071, _3979);
            float _4075 = -_3351;
            float _4077 = fma(_3663, _4075, _3981);
            float _4079 = -_3351;
            float _4081 = fma(_3671, _4079, _3983);
            float _4083 = -_3351;
            float _4085 = fma(_3677, _4083, _3985);
            float _4087 = -_3351;
            float _4089 = fma(_3683, _4087, _3987);
            float _4091 = -_3351;
            float _4093 = fma(_3689, _4091, _3989);
            float _4095 = -_3351;
            float _4097 = fma(_3697, _4095, _3991);
            float _4099 = -_3351;
            float _4101 = fma(_3703, _4099, _3993);
            float _4103 = -_3351;
            float _4105 = fma(_3709, _4103, _3995);
            float _4107 = -_3351;
            float _4109 = fma(_3715, _4107, _3997);
            float _4111 = -_3351;
            float _4113 = fma(_3723, _4111, _3999);
            float _4115 = -_3351;
            float _4117 = fma(_3729, _4115, _4001);
            float _4119 = -_3351;
            float _4121 = fma(_3735, _4119, _4003);
            float _4123 = -_3351;
            float _4125 = fma(_3741, _4123, _4005);
            float _4127 = -_3351;
            float _4129 = fma(_3747, _4127, _4007);
            float _4131 = -_3351;
            float _4133 = fma(_3753, _4131, _4009);
            float _4135 = -_3351;
            float _4137 = fma(_3759, _4135, _4011);
            float _4139 = -_3351;
            float _4141 = fma(_3765, _4139, _4013);
            float _4143 = fma(_3769, _3949, _4017);
            float _4145 = fma(_3775, _3949, _4021);
            float _4147 = fma(_3781, _3949, _4025);
            float _4149 = fma(_3787, _3949, _4029);
            float _4151 = fma(_3791, _3949, _4033);
            float _4153 = fma(_3797, _3949, _4037);
            float _4155 = fma(_3803, _3949, _4041);
            float _4157 = fma(_3809, _3949, _4045);
            float _4159 = fma(_3813, _3949, _4049);
            float _4161 = fma(_3819, _3949, _4053);
            float _4163 = fma(_3825, _3949, _4057);
            float _4165 = fma(_3831, _3949, _4061);
            float _4167 = fma(_3835, _3949, _4065);
            float _4169 = fma(_3841, _3949, _4069);
            float _4171 = fma(_3847, _3949, _4073);
            float _4173 = fma(_3853, _3949, _4077);
            float _4175 = fma(_3857, _3949, _4081);
            float _4177 = fma(_3863, _3949, _4085);
            float _4179 = fma(_3869, _3949, _4089);
            float _4181 = fma(_3875, _3949, _4093);
            float _4183 = fma(_3879, _3949, _4097);
            float _4185 = fma(_3885, _3949, _4101);
            float _4187 = fma(_3891, _3949, _4105);
            float _4189 = fma(_3897, _3949, _4109);
            float _4191 = fma(_3901, _3949, _4113);
            float _4193 = fma(_3907, _3949, _4117);
            float _4195 = fma(_3913, _3949, _4121);
            float _4197 = fma(_3919, _3949, _4125);
            float _4199 = fma(_3923, _3949, _4129);
            float _4201 = fma(_3929, _3949, _4133);
            float _4203 = fma(_3935, _3949, _4137);
            float _4205 = fma(_3941, _3949, _4141);
            _2375 = _4157;
            _2377 = _4153;
            _2379 = _4185;
            _2381 = _4167;
            _2383 = _4151;
            _2385 = _4171;
            _2387 = _4187;
            _2389 = _4169;
            _2391 = _4173;
            _2393 = _4189;
            _2395 = _4155;
            _2397 = _4183;
            _2399 = _4201;
            _2401 = _4149;
            _2403 = _4199;
            _2405 = _4159;
            _2407 = _4161;
            _2409 = _4193;
            _2411 = _4143;
            _2413 = _4145;
            _2415 = _4147;
            _2417 = _4191;
            _2419 = _4203;
            _2421 = _4165;
            _2423 = _4175;
            _2425 = _4195;
            _2427 = _4205;
            _2429 = _4179;
            _2431 = _4181;
            _2433 = _4197;
            _2435 = _4163;
            _2437 = _4177;
            _2439 = true;
        }
        else
        {
            int _4207 = _1561 * 656;
            int _4209 = _4207 + 262144;
            int _4211 = _4207 + 262192;
            int _4213 = _4207 + 262160;
            uint _4215 = uint(int(uint(_4209) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4215)];
            float _4217 = as_type<float>(_dmw72.x);
            int _4219 = _4209 + 4;
            uint _4221 = uint(int(uint(_4219) >> uint(2)));
            float _4223 = as_type<float>(_dmw72.y);
            int _4225 = _4209 + 8;
            uint _4227 = uint(int(uint(_4225) >> uint(2)));
            float _4229 = as_type<float>(_dmw72.z);
            int _4231 = _4209 + 12;
            uint _4233 = uint(int(uint(_4231) >> uint(2)));
            float _4235 = as_type<float>(_dmw72.w);
            int _4237 = _4207 + 262208;
            uint _4239 = uint(int(uint(_4211) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4239)];
            float _4241 = as_type<float>(_dmw75.x);
            int _4243 = _4211 + 4;
            uint _4245 = uint(int(uint(_4243) >> uint(2)));
            float _4247 = as_type<float>(_dmw75.y);
            int _4249 = _4211 + 8;
            uint _4251 = uint(int(uint(_4249) >> uint(2)));
            float _4253 = as_type<float>(_dmw75.z);
            int _4255 = _4211 + 12;
            uint _4257 = uint(int(uint(_4255) >> uint(2)));
            float _4259 = as_type<float>(_dmw75.w);
            int _4261 = _4207 + 262176;
            uint _4263 = uint(int(uint(_4213) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4263)];
            float _4265 = as_type<float>(_dmw73.x);
            int _4267 = _4213 + 4;
            uint _4269 = uint(int(uint(_4267) >> uint(2)));
            float _4271 = as_type<float>(_dmw73.y);
            int _4273 = _4213 + 8;
            uint _4275 = uint(int(uint(_4273) >> uint(2)));
            float _4277 = as_type<float>(_dmw73.z);
            int _4279 = _4213 + 12;
            uint _4281 = uint(int(uint(_4279) >> uint(2)));
            float _4283 = as_type<float>(_dmw73.w);
            int _4285 = _4207 + 262224;
            uint _4287 = uint(int(uint(_4237) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4287)];
            float _4289 = as_type<float>(_dmw76.x);
            int _4291 = _4237 + 4;
            uint _4293 = uint(int(uint(_4291) >> uint(2)));
            float _4295 = as_type<float>(_dmw76.y);
            int _4297 = _4237 + 8;
            uint _4299 = uint(int(uint(_4297) >> uint(2)));
            float _4301 = as_type<float>(_dmw76.z);
            int _4303 = _4237 + 12;
            uint _4305 = uint(int(uint(_4303) >> uint(2)));
            float _4307 = as_type<float>(_dmw76.w);
            int _4309 = _4207 + 262240;
            uint _4311 = uint(int(uint(_4261) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4311)];
            float _4313 = as_type<float>(_dmw74.x);
            int _4315 = _4261 + 4;
            uint _4317 = uint(int(uint(_4315) >> uint(2)));
            float _4319 = as_type<float>(_dmw74.y);
            int _4321 = _4261 + 8;
            uint _4323 = uint(int(uint(_4321) >> uint(2)));
            float _4325 = as_type<float>(_dmw74.z);
            int _4327 = _4261 + 12;
            uint _4329 = uint(int(uint(_4327) >> uint(2)));
            float _4331 = as_type<float>(_dmw74.w);
            int _4333 = _4207 + 262256;
            uint _4335 = uint(int(uint(_4285) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4335)];
            float _4337 = as_type<float>(_dmw77.x);
            int _4339 = _4285 + 4;
            uint _4341 = uint(int(uint(_4339) >> uint(2)));
            float _4343 = as_type<float>(_dmw77.y);
            int _4345 = _4285 + 8;
            uint _4347 = uint(int(uint(_4345) >> uint(2)));
            float _4349 = as_type<float>(_dmw77.z);
            int _4351 = _4285 + 12;
            uint _4353 = uint(int(uint(_4351) >> uint(2)));
            float _4355 = as_type<float>(_dmw77.w);
            int _4357 = _1503 * 656;
            uint _4359 = uint(int(uint(_4309) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4359)];
            float _4361 = as_type<float>(_dmw78.x);
            int _4363 = _4309 + 4;
            uint _4365 = uint(int(uint(_4363) >> uint(2)));
            float _4367 = as_type<float>(_dmw78.y);
            int _4369 = _4309 + 8;
            uint _4371 = uint(int(uint(_4369) >> uint(2)));
            float _4373 = as_type<float>(_dmw78.z);
            int _4375 = _4309 + 12;
            uint _4377 = uint(int(uint(_4375) >> uint(2)));
            float _4379 = as_type<float>(_dmw78.w);
            int _4381 = _1575 * 656;
            int _4383 = _4357 + 262144;
            uint _4385 = uint(int(uint(_4333) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4385)];
            float _4387 = as_type<float>(_dmw79.x);
            int _4389 = _4333 + 4;
            uint _4391 = uint(int(uint(_4389) >> uint(2)));
            float _4393 = as_type<float>(_dmw79.y);
            int _4395 = _4333 + 8;
            uint _4397 = uint(int(uint(_4395) >> uint(2)));
            float _4399 = as_type<float>(_dmw79.z);
            int _4401 = _4333 + 12;
            uint _4403 = uint(int(uint(_4401) >> uint(2)));
            float _4405 = as_type<float>(_dmw79.w);
            int _4407 = _4357 + 262192;
            int _4409 = _4357 + 262160;
            uint _4411 = uint(int(uint(_4383) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4411)];
            float _4413 = as_type<float>(_dmw80.x);
            int _4415 = _4383 + 4;
            uint _4417 = uint(int(uint(_4415) >> uint(2)));
            float _4419 = as_type<float>(_dmw80.y);
            int _4421 = _4383 + 8;
            uint _4423 = uint(int(uint(_4421) >> uint(2)));
            float _4425 = as_type<float>(_dmw80.z);
            int _4427 = _4383 + 12;
            uint _4429 = uint(int(uint(_4427) >> uint(2)));
            float _4431 = as_type<float>(_dmw80.w);
            int _4433 = _4357 + 262208;
            int _4435 = _4357 + 262176;
            uint _4437 = uint(int(uint(_4407) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4437)];
            float _4439 = as_type<float>(_dmw83.x);
            int _4441 = _4407 + 4;
            uint _4443 = uint(int(uint(_4441) >> uint(2)));
            float _4445 = as_type<float>(_dmw83.y);
            int _4447 = _4407 + 8;
            uint _4449 = uint(int(uint(_4447) >> uint(2)));
            float _4451 = as_type<float>(_dmw83.z);
            int _4453 = _4407 + 12;
            uint _4455 = uint(int(uint(_4453) >> uint(2)));
            float _4457 = as_type<float>(_dmw83.w);
            int _4459 = _4357 + 262224;
            int _4461 = _4357 + 262240;
            uint _4463 = uint(int(uint(_4409) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4463)];
            float _4465 = as_type<float>(_dmw81.x);
            int _4467 = _4409 + 4;
            uint _4469 = uint(int(uint(_4467) >> uint(2)));
            float _4471 = as_type<float>(_dmw81.y);
            int _4473 = _4409 + 8;
            uint _4475 = uint(int(uint(_4473) >> uint(2)));
            float _4477 = as_type<float>(_dmw81.z);
            int _4479 = _4409 + 12;
            uint _4481 = uint(int(uint(_4479) >> uint(2)));
            float _4483 = as_type<float>(_dmw81.w);
            int _4485 = _4357 + 262256;
            int _4487 = _4381 + 262144;
            uint _4489 = uint(int(uint(_4433) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4489)];
            float _4491 = as_type<float>(_dmw84.x);
            int _4493 = _4433 + 4;
            uint _4495 = uint(int(uint(_4493) >> uint(2)));
            float _4497 = as_type<float>(_dmw84.y);
            int _4499 = _4433 + 8;
            uint _4501 = uint(int(uint(_4499) >> uint(2)));
            float _4503 = as_type<float>(_dmw84.z);
            int _4505 = _4433 + 12;
            uint _4507 = uint(int(uint(_4505) >> uint(2)));
            float _4509 = as_type<float>(_dmw84.w);
            int _4511 = _4381 + 262192;
            int _4513 = _4381 + 262160;
            uint _4515 = uint(int(uint(_4435) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4515)];
            float _4517 = as_type<float>(_dmw82.x);
            int _4519 = _4435 + 4;
            uint _4521 = uint(int(uint(_4519) >> uint(2)));
            float _4523 = as_type<float>(_dmw82.y);
            int _4525 = _4435 + 8;
            uint _4527 = uint(int(uint(_4525) >> uint(2)));
            float _4529 = as_type<float>(_dmw82.z);
            int _4531 = _4435 + 12;
            uint _4533 = uint(int(uint(_4531) >> uint(2)));
            float _4535 = as_type<float>(_dmw82.w);
            int _4537 = _4381 + 262208;
            int _4539 = _4381 + 262176;
            uint _4541 = uint(int(uint(_4459) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4541)];
            float _4543 = as_type<float>(_dmw85.x);
            int _4545 = _4459 + 4;
            uint _4547 = uint(int(uint(_4545) >> uint(2)));
            float _4549 = as_type<float>(_dmw85.y);
            int _4551 = _4459 + 8;
            uint _4553 = uint(int(uint(_4551) >> uint(2)));
            float _4555 = as_type<float>(_dmw85.z);
            int _4557 = _4459 + 12;
            uint _4559 = uint(int(uint(_4557) >> uint(2)));
            float _4561 = as_type<float>(_dmw85.w);
            int _4563 = _4381 + 262224;
            int _4565 = _4381 + 262240;
            uint _4567 = uint(int(uint(_4461) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4567)];
            float _4569 = as_type<float>(_dmw86.x);
            int _4571 = _4461 + 4;
            uint _4573 = uint(int(uint(_4571) >> uint(2)));
            float _4575 = as_type<float>(_dmw86.y);
            int _4577 = _4461 + 8;
            uint _4579 = uint(int(uint(_4577) >> uint(2)));
            float _4581 = as_type<float>(_dmw86.z);
            int _4583 = _4461 + 12;
            uint _4585 = uint(int(uint(_4583) >> uint(2)));
            float _4587 = as_type<float>(_dmw86.w);
            int _4589 = _4381 + 262256;
            uint _4591 = uint(int(uint(_4485) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4591)];
            float _4593 = as_type<float>(_dmw87.x);
            int _4595 = _4485 + 4;
            uint _4597 = uint(int(uint(_4595) >> uint(2)));
            float _4599 = as_type<float>(_dmw87.y);
            int _4601 = _4485 + 8;
            uint _4603 = uint(int(uint(_4601) >> uint(2)));
            float _4605 = as_type<float>(_dmw87.z);
            int _4607 = _4485 + 12;
            uint _4609 = uint(int(uint(_4607) >> uint(2)));
            float _4611 = as_type<float>(_dmw87.w);
            uint _4613 = uint(int(uint(_4487) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4613)];
            float _4615 = as_type<float>(_dmw88.x);
            int _4617 = _4487 + 4;
            uint _4619 = uint(int(uint(_4617) >> uint(2)));
            float _4621 = as_type<float>(_dmw88.y);
            int _4623 = _4487 + 8;
            uint _4625 = uint(int(uint(_4623) >> uint(2)));
            float _4627 = as_type<float>(_dmw88.z);
            int _4629 = _4487 + 12;
            uint _4631 = uint(int(uint(_4629) >> uint(2)));
            float _4633 = as_type<float>(_dmw88.w);
            uint _4635 = uint(int(uint(_4511) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4635)];
            float _4637 = as_type<float>(_dmw91.x);
            int _4639 = _4511 + 4;
            uint _4641 = uint(int(uint(_4639) >> uint(2)));
            float _4643 = as_type<float>(_dmw91.y);
            int _4645 = _4511 + 8;
            uint _4647 = uint(int(uint(_4645) >> uint(2)));
            float _4649 = as_type<float>(_dmw91.z);
            int _4651 = _4511 + 12;
            uint _4653 = uint(int(uint(_4651) >> uint(2)));
            float _4655 = as_type<float>(_dmw91.w);
            uint _4657 = uint(int(uint(_4513) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4657)];
            float _4659 = as_type<float>(_dmw89.x);
            int _4661 = _4513 + 4;
            uint _4663 = uint(int(uint(_4661) >> uint(2)));
            float _4665 = as_type<float>(_dmw89.y);
            int _4667 = _4513 + 8;
            uint _4669 = uint(int(uint(_4667) >> uint(2)));
            float _4671 = as_type<float>(_dmw89.z);
            int _4673 = _4513 + 12;
            uint _4675 = uint(int(uint(_4673) >> uint(2)));
            float _4677 = as_type<float>(_dmw89.w);
            uint _4679 = uint(int(uint(_4537) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4679)];
            float _4681 = as_type<float>(_dmw92.x);
            int _4683 = _4537 + 4;
            uint _4685 = uint(int(uint(_4683) >> uint(2)));
            float _4687 = as_type<float>(_dmw92.y);
            int _4689 = _4537 + 8;
            uint _4691 = uint(int(uint(_4689) >> uint(2)));
            float _4693 = as_type<float>(_dmw92.z);
            int _4695 = _4537 + 12;
            uint _4697 = uint(int(uint(_4695) >> uint(2)));
            float _4699 = as_type<float>(_dmw92.w);
            uint _4701 = uint(int(uint(_4539) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4701)];
            float _4703 = as_type<float>(_dmw90.x);
            int _4705 = _4539 + 4;
            uint _4707 = uint(int(uint(_4705) >> uint(2)));
            float _4709 = as_type<float>(_dmw90.y);
            int _4711 = _4539 + 8;
            uint _4713 = uint(int(uint(_4711) >> uint(2)));
            float _4715 = as_type<float>(_dmw90.z);
            int _4717 = _4539 + 12;
            uint _4719 = uint(int(uint(_4717) >> uint(2)));
            float _4721 = as_type<float>(_dmw90.w);
            uint _4723 = uint(int(uint(_4563) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4723)];
            float _4725 = as_type<float>(_dmw93.x);
            int _4727 = _4563 + 4;
            uint _4729 = uint(int(uint(_4727) >> uint(2)));
            float _4731 = as_type<float>(_dmw93.y);
            int _4733 = _4563 + 8;
            uint _4735 = uint(int(uint(_4733) >> uint(2)));
            float _4737 = as_type<float>(_dmw93.z);
            int _4739 = _4563 + 12;
            uint _4741 = uint(int(uint(_4739) >> uint(2)));
            float _4743 = as_type<float>(_dmw93.w);
            uint _4745 = uint(int(uint(_4565) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4745)];
            float _4747 = as_type<float>(_dmw94.x);
            int _4749 = _4565 + 4;
            uint _4751 = uint(int(uint(_4749) >> uint(2)));
            float _4753 = as_type<float>(_dmw94.y);
            int _4755 = _4565 + 8;
            uint _4757 = uint(int(uint(_4755) >> uint(2)));
            float _4759 = as_type<float>(_dmw94.z);
            int _4761 = _4565 + 12;
            uint _4763 = uint(int(uint(_4761) >> uint(2)));
            float _4765 = as_type<float>(_dmw94.w);
            uint _4767 = uint(int(uint(_4589) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4767)];
            float _4769 = as_type<float>(_dmw95.x);
            int _4771 = _4589 + 4;
            uint _4773 = uint(int(uint(_4771) >> uint(2)));
            float _4775 = as_type<float>(_dmw95.y);
            int _4777 = _4589 + 8;
            uint _4779 = uint(int(uint(_4777) >> uint(2)));
            float _4781 = as_type<float>(_dmw95.z);
            int _4783 = _4589 + 12;
            uint _4785 = uint(int(uint(_4783) >> uint(2)));
            float _4787 = as_type<float>(_dmw95.w);
            float _4789 = -_3351;
            float _4791 = _4789 + _3353;
            float _4793 = -_4791;
            float _4795 = _1479 + _4793;
            float _4797 = _4217 * _4791;
            float _4799 = _4223 * _4791;
            float _4801 = _4229 * _4791;
            float _4803 = _4235 * _4791;
            float _4805 = _4241 * _4791;
            float _4807 = _4247 * _4791;
            float _4809 = _4253 * _4791;
            float _4811 = _4259 * _4791;
            float _4813 = _4265 * _4791;
            float _4815 = _4271 * _4791;
            float _4817 = _4277 * _4791;
            float _4819 = _4283 * _4791;
            float _4821 = _4289 * _4791;
            float _4823 = _4295 * _4791;
            float _4825 = _4301 * _4791;
            float _4827 = _4307 * _4791;
            float _4829 = _4313 * _4791;
            float _4831 = _4319 * _4791;
            float _4833 = _4325 * _4791;
            float _4835 = _4331 * _4791;
            float _4837 = _4337 * _4791;
            float _4839 = _4343 * _4791;
            float _4841 = _4349 * _4791;
            float _4843 = _4355 * _4791;
            float _4845 = _4361 * _4791;
            float _4847 = _4367 * _4791;
            float _4849 = _4373 * _4791;
            float _4851 = _4379 * _4791;
            float _4853 = _4387 * _4791;
            float _4855 = _4393 * _4791;
            float _4857 = _4399 * _4791;
            float _4859 = _4405 * _4791;
            float _4861 = -_3353;
            float _4863 = fma(_4413, _4861, _4797);
            float _4865 = -_3353;
            float _4867 = fma(_4419, _4865, _4799);
            float _4869 = -_3353;
            float _4871 = fma(_4425, _4869, _4801);
            float _4873 = -_3353;
            float _4875 = fma(_4431, _4873, _4803);
            float _4877 = -_3353;
            float _4879 = fma(_4439, _4877, _4805);
            float _4881 = -_3353;
            float _4883 = fma(_4445, _4881, _4807);
            float _4885 = -_3353;
            float _4887 = fma(_4451, _4885, _4809);
            float _4889 = -_3353;
            float _4891 = fma(_4457, _4889, _4811);
            float _4893 = -_3353;
            float _4895 = fma(_4465, _4893, _4813);
            float _4897 = -_3353;
            float _4899 = fma(_4471, _4897, _4815);
            float _4901 = -_3353;
            float _4903 = fma(_4477, _4901, _4817);
            float _4905 = -_3353;
            float _4907 = fma(_4483, _4905, _4819);
            float _4909 = -_3353;
            float _4911 = fma(_4491, _4909, _4821);
            float _4913 = -_3353;
            float _4915 = fma(_4497, _4913, _4823);
            float _4917 = -_3353;
            float _4919 = fma(_4503, _4917, _4825);
            float _4921 = -_3353;
            float _4923 = fma(_4509, _4921, _4827);
            float _4925 = -_3353;
            float _4927 = fma(_4517, _4925, _4829);
            float _4929 = -_3353;
            float _4931 = fma(_4523, _4929, _4831);
            float _4933 = -_3353;
            float _4935 = fma(_4529, _4933, _4833);
            float _4937 = -_3353;
            float _4939 = fma(_4535, _4937, _4835);
            float _4941 = -_3353;
            float _4943 = fma(_4543, _4941, _4837);
            float _4945 = -_3353;
            float _4947 = fma(_4549, _4945, _4839);
            float _4949 = -_3353;
            float _4951 = fma(_4555, _4949, _4841);
            float _4953 = -_3353;
            float _4955 = fma(_4561, _4953, _4843);
            float _4957 = -_3353;
            float _4959 = fma(_4569, _4957, _4845);
            float _4961 = -_3353;
            float _4963 = fma(_4575, _4961, _4847);
            float _4965 = -_3353;
            float _4967 = fma(_4581, _4965, _4849);
            float _4969 = -_3353;
            float _4971 = fma(_4587, _4969, _4851);
            float _4973 = -_3353;
            float _4975 = fma(_4593, _4973, _4853);
            float _4977 = -_3353;
            float _4979 = fma(_4599, _4977, _4855);
            float _4981 = -_3353;
            float _4983 = fma(_4605, _4981, _4857);
            float _4985 = -_3353;
            float _4987 = fma(_4611, _4985, _4859);
            float _4989 = fma(_4615, _4795, _4863);
            float _4991 = fma(_4621, _4795, _4867);
            float _4993 = fma(_4627, _4795, _4871);
            float _4995 = fma(_4633, _4795, _4875);
            float _4997 = fma(_4637, _4795, _4879);
            float _4999 = fma(_4643, _4795, _4883);
            float _5001 = fma(_4649, _4795, _4887);
            float _5003 = fma(_4655, _4795, _4891);
            float _5005 = fma(_4659, _4795, _4895);
            float _5007 = fma(_4665, _4795, _4899);
            float _5009 = fma(_4671, _4795, _4903);
            float _5011 = fma(_4677, _4795, _4907);
            float _5013 = fma(_4681, _4795, _4911);
            float _5015 = fma(_4687, _4795, _4915);
            float _5017 = fma(_4693, _4795, _4919);
            float _5019 = fma(_4699, _4795, _4923);
            float _5021 = fma(_4703, _4795, _4927);
            float _5023 = fma(_4709, _4795, _4931);
            float _5025 = fma(_4715, _4795, _4935);
            float _5027 = fma(_4721, _4795, _4939);
            float _5029 = fma(_4725, _4795, _4943);
            float _5031 = fma(_4731, _4795, _4947);
            float _5033 = fma(_4737, _4795, _4951);
            float _5035 = fma(_4743, _4795, _4955);
            float _5037 = fma(_4747, _4795, _4959);
            float _5039 = fma(_4753, _4795, _4963);
            float _5041 = fma(_4759, _4795, _4967);
            float _5043 = fma(_4765, _4795, _4971);
            float _5045 = fma(_4769, _4795, _4975);
            float _5047 = fma(_4775, _4795, _4979);
            float _5049 = fma(_4781, _4795, _4983);
            float _5051 = fma(_4787, _4795, _4987);
            _2375 = _5003;
            _2377 = _4999;
            _2379 = _5031;
            _2381 = _5013;
            _2383 = _4997;
            _2385 = _5017;
            _2387 = _5033;
            _2389 = _5015;
            _2391 = _5019;
            _2393 = _5035;
            _2395 = _5001;
            _2397 = _5029;
            _2399 = _5047;
            _2401 = _4995;
            _2403 = _5045;
            _2405 = _5005;
            _2407 = _5007;
            _2409 = _5039;
            _2411 = _4989;
            _2413 = _4991;
            _2415 = _4993;
            _2417 = _5037;
            _2419 = _5049;
            _2421 = _5011;
            _2423 = _5021;
            _2425 = _5041;
            _2427 = _5051;
            _2429 = _5025;
            _2431 = _5027;
            _2433 = _5043;
            _2435 = _5009;
            _2437 = _5023;
        }
    }
    _2439 = false;
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
    float _5115 = _2437;
    float _5117 = _5053 * 0.511664927005767822265625;
    float _5119 = _5055 * 0.88622760772705078125;
    float _5121 = _5057 * 0.511664927005767822265625;
    float _5123 = _5059 * 0.511664927005767822265625;
    float _5125 = _5117 * _5117;
    float _5127 = _5061 * 0.88622760772705078125;
    float _5129 = _5063 * 0.511664927005767822265625;
    float _5131 = precise::max(_5119, 0.00999999977648258209228515625);
    float _5133 = fma(_5121, _5121, _5125);
    float _5135 = _5065 * 0.511664927005767822265625;
    float _5137 = _5123 * _5123;
    float _5139 = _5067 * 0.511664927005767822265625;
    float _5141 = precise::max(_5127, 0.00999999977648258209228515625);
    float _5143 = fma(_5129, _5129, _5133);
    float _5145 = 1.0 / _5131;
    float _5147 = _5069 * 0.511664927005767822265625;
    float _5149 = fma(_5135, _5135, _5137);
    float _5151 = _5071 * 0.511664927005767822265625;
    float _5153 = _5073 * 0.88622760772705078125;
    float _5155 = _5075 * 0.511664927005767822265625;
    float _5157 = 1.0 / _5141;
    float _5159 = _5139 * _5139;
    float _5161 = precise::max(_5153, 0.00999999977648258209228515625);
    float _5163 = fma(_1467, 1.9073486328125, 0.5);
    float _5165 = fma(_5151, _5151, _5159);
    float _5167 = sqrt(_5143);
    float _5169 = fma(_5147, _5147, _5149);
    float _5171 = fma(_5155, _5155, _5165);
    float _5173 = _1467 * 3.903682708740234375;
    float _5175 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5177 = _5175 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5179 = _5173 * _5077;
    float _5181 = sqrt(_5169);
    float _5183 = _5173 * _5079;
    float _5185 = fma(_5081, 0.88622701168060302734375, _5179);
    float _5187 = _5173 * _5083;
    float _5189 = _5173 * _5085;
    float _5191 = _5173 * _5087;
    float _5193 = fma(_5089, 0.88622701168060302734375, _5183);
    float _5195 = 1.0 / _5161;
    float _5197 = precise::max(_5167, 0.00999999977648258209228515625);
    float _5199 = fma(_5091, 0.88622701168060302734375, _5187);
    float _5201 = fma(_5093, 0.88622701168060302734375, _5189);
    float _5203 = fma(_5095, 0.88622701168060302734375, _5191);
    float _5205 = sqrt(_5171);
    float _5207 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5209 = _5207 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5211 = precise::max(_5181, 0.00999999977648258209228515625);
    int _5213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5215 = _5213 != 0;
    float _5217 = fma(_5163, _5209, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5219 = 1.0 / _5197;
    float _5221 = _5211 * _5145;
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5227 = _5225 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5229 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5231 = _5229 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5233 = fma(_5163, _5227, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5235 = precise::max(_5205, 0.00999999977648258209228515625);
    float _5237 = 1.0 / _5211;
    float _5239 = fma(_5163, _5231, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5241 = _5233 * 0.715200006961822509765625;
    float _5243 = _5197 * _5157;
    float _5245 = precise::clamp(_5243, 0.0, 1.0);
    float _5247 = _5235 * _5195;
    float _5249 = precise::clamp(_5247, 0.0, 1.0);
    float _5251 = _5223 + 1.0;
    float _5253 = fma(_5217, 0.2125999927520751953125, _5241);
    float _5255 = _5121 * _5219;
    float _5257 = 1.0 / _5235;
    float _5259 = _5117 * _5219;
    float _5261 = fma(_5239, 0.072200000286102294921875, _5253);
    float _5263 = _5245 + 1.0;
    float _5265 = 1.0 / _5261;
    float _5267 = _5123 * _5237;
    float _5269 = _5129 * _5219;
    float _5271 = _5135 * _5237;
    float _5273 = _5147 * _5237;
    float _5275 = _1563 * _5267;
    float _5277 = _5139 * _5257;
    float _5279 = _1563 * _5259;
    float _5281 = _5151 * _5257;
    float _5283 = -_1549;
    float _5285 = fma(_5283, _5271, _5275);
    float _5287 = _1563 * _5277;
    float _5289 = -_1549;
    float _5291 = fma(_5289, _5255, _5279);
    float _5293 = _5155 * _5257;
    float _5295 = -_1557;
    float _5297 = fma(_5295, _5273, _5285);
    float _5299 = -_1549;
    float _5301 = fma(_5299, _5281, _5287);
    float _5303 = -_1557;
    float _5305 = fma(_5303, _5269, _5291);
    float _5307 = _5249 + 1.0;
    float _5309 = fma(_5297, 0.5, 0.5);
    float _5311 = -_1557;
    float _5313 = fma(_5311, _5293, _5301);
    float _5315 = fma(_5305, 0.5, 0.5);
    float _5317 = 1.0 / _5307;
    float _5319 = fma(_5313, 0.5, 0.5);
    float _5321 = _5265 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5323 = precise::clamp(_5321, 0.0, 1.0);
    float _5325 = _1557 * (-1.02332699298858642578125);
    float _5327 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5329 = _5327 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5331 = fma(_5323, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5333 = abs(_5315);
    float _5335 = log2(_5333);
    float _5337 = fma(_5163, _5177, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5339 = fma(_5325, _5097, _5185);
    float _5341 = fma(_5163, _5329, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5343 = fma(_5325, _5099, _5199);
    float _5345 = fma(_5325, _5101, _5201);
    float _5347 = fma(_5325, _5103, _5203);
    float _5349 = _5233 * _5331;
    float _5351 = abs(_5309);
    float _5353 = log2(_5351);
    float _5355 = _1549 * (-1.02332699298858642578125);
    float _5357 = fma(_5355, _5105, _5339);
    float _5359 = fma(_5355, _5107, _5343);
    float _5361 = fma(_5355, _5109, _5345);
    float _5363 = abs(_5319);
    float _5365 = log2(_5363);
    float _5367 = fma(_5355, _5111, _5347);
    float _5369 = precise::max(0.0, _5357);
    float _5371 = precise::max(0.0, _5359);
    float _5373 = precise::max(0.0, _5361);
    float _5375 = _5369 * 0.31830990314483642578125;
    float _5377 = precise::clamp(_5375, 0.0, 1.0);
    float _5379 = 1.0 / _5251;
    float _5381 = precise::max(0.0, _5367);
    float _5383 = _5371 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5385 = -_5377;
    float _5387 = _5385 + 1.0;
    float _5389 = _5373 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5391 = _5381 * 0.31830990314483642578125;
    float _5393 = precise::clamp(_5391, 0.0, 1.0);
    float _5395 = fma(_5387, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5377);
    float _5397 = 1.0 / _5263;
    float _5399 = fma(_5245, 2.0, 1.0);
    float _5401 = _5239 * _5331;
    float _5403 = precise::max(_5383, _5349);
    float _5405 = _5393 * 0.88622701168060302734375;
    float _5407 = _5399 * _5335;
    float _5409 = fma(_5223, 2.0, 1.0);
    float _5411 = precise::max(_5389, _5401);
    float _5413 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5403);
    float _5415 = _5409 * _5353;
    float _5417 = fma(_5249, 2.0, 1.0);
    float _5419 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5411);
    float _5421 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5423 = _5421 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5425 = _5417 * _5365;
    float _5427 = exp2(_5415);
    float _5429 = -_5245;
    float _5431 = _5429 + 1.0;
    float _5433 = fma(_5163, _5423, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5435 = fma(_5245, 2.0, 2.0);
    float _5437 = -_5223;
    float _5439 = _5437 + 1.0;
    float _5441 = fma(_5223, 2.0, 2.0);
    float _5443 = fma(_5325, _5113, _5193);
    float _5445 = _5431 * _5397;
    float _5447 = exp2(_5407);
    float _5449 = _5439 * _5379;
    float _5451 = fma(_5355, _5115, _5443);
    float _5453 = precise::max(0.0, _5451);
    float _5455 = exp2(_5425);
    float _5457 = fma(_5249, 2.0, 2.0);
    float _5459 = -_5249;
    float _5461 = _5459 + 1.0;
    float _5463 = _5441 * _5427;
    float _5465 = _5453 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5467 = _5461 * _5317;
    float _5469 = _5217 * _5331;
    float _5471 = _5435 * _5447;
    float _5473 = -_5463;
    float _5475 = _5473 + 1.0;
    float _5477 = -_5471;
    float _5479 = _5477 + 1.0;
    float _5481 = fma(_5449, _5475, _5463);
    float _5483 = precise::max(_5465, _5469);
    float _5485 = _5457 * _5455;
    float _5487 = fma(_5445, _5479, _5471);
    float _5489 = _5119 * _5481;
    float _5491 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5483);
    float _5493 = -_5485;
    float _5495 = _5493 + 1.0;
    float _5497 = _5127 * _5487;
    float _5499 = fma(_5467, _5495, _5485);
    float _5501 = _5497 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5503 = _5489 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5505 = _5153 * _5499;
    float _5507 = precise::max(_5501, _5341);
    float _5509 = _5505 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5511 = precise::max(_5503, _5433);
    float _5513 = fma(_5507, _5395, _5491);
    float _5515 = precise::max(_5509, _5337);
    float _5517 = fma(_5511, _5395, _5413);
    float _5519 = fma(_5515, _5395, _5419);
    bool _5521 = !_5215;
    float _5523;
    float _5525;
    float _5527;
    float _5529;
    float _5531;
    float _5533;
    float _5535;
    float _5537;
    float _5539;
    float _5541;
    int _5543;
    float _5545;
    float _5547;
    float _5549;
    float _5551;
    float _5553;
    float _5555;
    float _5557;
    int _5559;
    float _5561;
    int _5563;
    float _5565;
    int _5567;
    int _5569;
    int _5571;
    float _5573;
    float _5575;
    int _5577;
    float _5579;
    int _5581;
    int _5583;
    float _5585;
    if (!_5521)
    {
        _5523 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5525 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5527 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5529 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5531 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5533 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5535 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5537 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5539 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5541 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5545 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5547 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5549 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5551 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5553 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5555 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5557 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5561 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5565 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5573 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5575 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5579 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5585 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5587 = true;
    }
    else
    {
        float _5589 = fma(_1069, 6.2500002968590706586837768554688e-05, 0.5);
        float _5591 = fma(_1067, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14870 = float3(_5589, _5591, float(0));
        float3 _14872 = select(_14870, float3(0.0), isnan(_14870));
        float4 _5593 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14872.xy, uint(rint(_14872.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14872.xy, uint(rint(_14872.z)), level(0.0)).xyzw;
        float _5595 = _5593.x;
        float _5597 = _5593.y;
        float _5599 = _5593.z;
        float _5601 = _5593.w;
        float3 _14887 = float3(_5589, _5591, float(1));
        float3 _14889 = select(_14887, float3(0.0), isnan(_14887));
        float4 _5603 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14889.xy, uint(rint(_14889.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14889.xy, uint(rint(_14889.z)), level(0.0)).xyzw;
        float _5605 = _5603.x;
        float _5607 = _5603.y;
        float _5609 = _5603.z;
        float _5611 = _5603.w;
        float3 _14904 = float3(_5589, _5591, float(2));
        float3 _14906 = select(_14904, float3(0.0), isnan(_14904));
        float4 _5613 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14906.xy, uint(rint(_14906.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14906.xy, uint(rint(_14906.z)), level(0.0)).xyzw;
        float _5615 = _5613.x;
        float _5617 = _5613.y;
        float _5619 = _5613.z;
        float _5621 = _5613.w;
        float3 _14921 = float3(_5589, _5591, float(3));
        float3 _14923 = select(_14921, float3(0.0), isnan(_14921));
        float4 _5623 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14923.xy, uint(rint(_14923.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14923.xy, uint(rint(_14923.z)), level(0.0)).xyzw;
        float _5625 = _5623.x;
        float _5627 = _5623.y;
        float _5629 = _5623.z;
        float _5631 = _5623.w;
        float3 _14938 = float3(_5589, _5591, float(4));
        float3 _14940 = select(_14938, float3(0.0), isnan(_14938));
        float4 _5633 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14940.xy, uint(rint(_14940.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14940.xy, uint(rint(_14940.z)), level(0.0)).xyzw;
        float _5635 = _5633.x;
        float _5637 = _5633.y;
        float _5639 = _5633.z;
        float _5641 = _5633.w;
        float3 _14955 = float3(_5589, _5591, float(5));
        float3 _14957 = select(_14955, float3(0.0), isnan(_14955));
        float4 _5643 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14957.xy, uint(rint(_14957.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14957.xy, uint(rint(_14957.z)), level(0.0)).xyzw;
        float _5645 = _5643.x;
        float _5647 = _5643.y;
        float _5649 = _5643.z;
        float _5651 = _5643.w;
        float3 _14972 = float3(_5589, _5591, float(6));
        float3 _14974 = select(_14972, float3(0.0), isnan(_14972));
        float4 _5653 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14974.xy, uint(rint(_14974.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14974.xy, uint(rint(_14974.z)), level(0.0)).xyzw;
        float _5655 = _5653.x;
        float _5657 = _5653.y;
        float _5659 = _5653.z;
        float _5661 = _5653.w;
        float3 _14989 = float3(_5589, _5591, float(7));
        float3 _14991 = select(_14989, float3(0.0), isnan(_14989));
        float4 _5663 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14991.xy, uint(rint(_14991.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14991.xy, uint(rint(_14991.z)), level(0.0)).xyzw;
        float _5665 = _5663.x;
        float _5667 = _5663.y;
        float _5669 = _5663.z;
        float _5671 = _5663.w;
        _5523 = _5657;
        _5525 = _5667;
        _5527 = _5625;
        _5529 = _5627;
        _5531 = _5655;
        _5533 = _5665;
        _5535 = _5601;
        _5537 = _5659;
        _5539 = _5629;
        _5541 = _5669;
        _5543 = as_type<int>(_5631);
        _5545 = _5661;
        _5547 = _5595;
        _5549 = _5605;
        _5551 = _5607;
        _5553 = _5671;
        _5555 = _5597;
        _5557 = _5599;
        _5559 = as_type<int>(_5637);
        _5561 = _5611;
        _5563 = as_type<int>(_5635);
        _5565 = _5609;
        _5567 = as_type<int>(_5639);
        _5569 = as_type<int>(_5641);
        _5571 = as_type<int>(_5645);
        _5573 = _5617;
        _5575 = _5615;
        _5577 = as_type<int>(_5647);
        _5579 = _5619;
        _5581 = as_type<int>(_5651);
        _5583 = as_type<int>(_5649);
        _5585 = _5621;
    }
    _5587 = false;
    float _5673 = _5523;
    float _5675 = _5525;
    float _5677 = _5527;
    float _5679 = _5529;
    float _5681 = _5531;
    float _5683 = _5533;
    float _5685 = _5535;
    float _5687 = _5537;
    float _5689 = _5539;
    float _5691 = _5541;
    int _5693 = _5543;
    float _5695 = _5545;
    float _5697 = _5547;
    float _5699 = _5549;
    float _5701 = _5551;
    float _5703 = _5553;
    float _5705 = _5555;
    float _5707 = _5557;
    int _5709 = _5559;
    float _5711 = _5561;
    int _5713 = _5563;
    float _5715 = _5565;
    int _5717 = _5567;
    int _5719 = _5569;
    int _5721 = _5571;
    float _5723 = _5573;
    float _5725 = _5575;
    int _5727 = _5577;
    float _5729 = _5579;
    int _5731 = _5581;
    int _5733 = _5583;
    float _5735 = _5585;
    float _5737 = _5173 * _5673;
    float _5739 = _5173 * _5675;
    float _5741 = _5677 * 0.88622701168060302734375;
    float _5743 = _5679 * 0.88622701168060302734375;
    float _5745 = fma(_5681, 0.88622701168060302734375, _5737);
    float _5747 = fma(_5683, 0.88622701168060302734375, _5739);
    float _5749 = _5173 * _5685;
    out.m_54.x = _1437;
    out.m_54.y = _1439;
    float _5751 = fma(_5325, _5687, _5745);
    float _5753 = _5689 * 0.88622701168060302734375;
    float _5755 = fma(_5325, _5691, _5747);
    float _5757 = _5215 ? as_type<float>(_5693) : 0.0;
    float _5759 = fma(_5355, _5695, _5751);
    out.m_56.x = _1069;
    out.m_56.y = _1163;
    out.m_56.z = _1067;
    float _5761 = fma(_5697, 0.88622701168060302734375, _5749);
    float _5763 = _5173 * _5699;
    float _5765 = _5173 * _5701;
    float _5767 = _5215 ? _5741 : 0.0;
    float _5769 = fma(_5355, _5703, _5755);
    float _5771 = _5215 ? _5743 : 0.0;
    float _5773 = fma(_5705, 0.88622701168060302734375, _5763);
    float _5775 = precise::max(0.0, _5759);
    float _5777 = fma(_5707, 0.88622701168060302734375, _5765);
    float _5779 = _5215 ? as_type<float>(_5709) : 0.0;
    float _5781 = fma(_5325, _5711, _5773);
    float _5783 = _5215 ? as_type<float>(_5713) : 0.0;
    float _5785 = fma(_5173, _5757, _5767);
    float _5787 = _5215 ? _5753 : 0.0;
    float _5789 = fma(_5325, _5715, _5761);
    float _5791 = _5215 ? as_type<float>(_5717) : 0.0;
    float _5793 = fma(_5173, _5783, _5771);
    float _5795 = _5215 ? as_type<float>(_5719) : 0.0;
    float _5797 = _5775 * 0.31830990314483642578125;
    float _5799 = precise::clamp(_5797, 0.0, 1.0);
    float _5801 = _5215 ? as_type<float>(_5721) : 0.0;
    float _5803 = fma(_5173, _5779, _5787);
    float _5805 = precise::max(0.0, _5769);
    float _5807 = fma(_5355, _5723, _5789);
    float _5809 = fma(_5325, _5725, _5777);
    out.m_58.x = _744;
    float _5811 = _5799 * 0.88622701168060302734375;
    float _5813 = fma(_5325, _5795, _5793);
    float _5815 = fma(_5325, _5801, _5803);
    float _5817 = _5805 * 0.31830990314483642578125;
    float _5819 = precise::clamp(_5817, 0.0, 1.0);
    float _5821 = _5215 ? as_type<float>(_5727) : 0.0;
    float _5823 = fma(_5355, _5729, _5781);
    float _5825 = _5215 ? as_type<float>(_5731) : 0.0;
    float _5827 = fma(_5325, _5791, _5785);
    float _5829 = _5215 ? as_type<float>(_5733) : 0.0;
    float _5831 = fma(_5355, _5735, _5809);
    float _5833 = precise::max(0.0, _5807);
    float _5835 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    out.gl_Position.x = _1565;
    out.gl_Position.y = _1567;
    float _15259 = as_type<float>(_1573);
    out.gl_Position.z = _15259;
    out.gl_Position.w = _1569;
    float _5837 = -_5819;
    float _5839 = _5837 + 1.0;
    float _5841 = fma(_5355, _5821, _5827);
    float _5843 = fma(_5355, _5829, _5813);
    float _5845 = fma(_5355, _5825, _5815);
    float _5847 = fma(_5833, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5835);
    float _5849 = precise::max(0.0, _5823);
    float _5851 = fma(_5839, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5819);
    float _5853 = precise::max(0.0, _5831);
    float _5855 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5857 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5859 = precise::max(0.0, _5841);
    float _5861 = -_1549;
    float _5863 = (-0.0) + _5861;
    float _5865 = precise::max(0.0, _5843);
    float _5867 = sqrt(_1559);
    float _5869 = precise::max(0.0, _5845);
    float _5871 = _5851 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5873 = fma(_5849, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5855);
    float _5875 = fma(_5853, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5857);
    float _5877 = -_1557;
    float _5879 = (-0.0) + _5877;
    float _5881 = fma(_5859, _5871, _5847);
    float _5883 = fma(_5865, _5871, _5873);
    float _5885 = -_1185;
    float _5887 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _5889 = _5885 + _5887;
    float _5891 = fma(_5869, _5871, _5875);
    out.m_60.x = _5513;
    out.m_60.y = _5517;
    out.m_60.z = _5519;
    float _5893 = _5889 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_58.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    out.m_62.w = _1185;
    out.m_64.x = _5863;
    out.m_64.y = _1563;
    out.m_64.z = _5879;
    out.m_58.w = _5867;
    out.m_64.w = _5893;
    out.m_62.x = _5881;
    out.m_62.y = _5883;
    out.m_62.z = _5891;
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
    bool _5587 = false;
    bool _2439 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_51.x;
    float _80 = in.m_51.y;
    float _82 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _84 = _82 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _87 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _89 = _87 << 4;
    bool _93 = _89 == 0;
    bool _95 = _89 == 16;
    bool _97 = _89 == 32;
    bool _99 = _89 == 48;
    bool _101 = _89 == 64;
    float _103 = fma(_84, _78, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _105 = fma(_78, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _107 = _89 == 80;
    bool _109 = _80 >= 0.5;
    bool _111 = isnan(_80);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.5);
    bool _117 = _113 || _115;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _121 = _103 + _119;
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _125 = _105 + _123;
    float _127 = as_type<float>(gl_BaseInstance);
    if (_93)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _129 = _127;
    float _131 = _121 * _121;
    bool _133 = _89 == 96;
    float _135 = 0.0;
    float _137 = _129;
    float _139 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (_93)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _141 = _135;
    float _143 = fma(_125, _125, _131);
    float _145 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _147 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _145;
    float _149 = _141;
    if (_95)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _151 = _137;
    bool _153 = _89 == 112;
    float _155 = fma(_147, _147, _143);
    float _157 = _151;
    if (_95)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_97)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _163 = _157;
    float _165 = rsqrt(_155);
    bool _167 = _89 == 128;
    float _169 = _163;
    if (_97)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _171 = _161;
    float _173 = _171;
    if (_99)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _175 = _169;
    bool _177 = _89 == 144;
    float _179 = _175;
    if (_99)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _181 = _173;
    float _183 = _181;
    if (_101)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _185 = _179;
    bool _187 = _89 == 160;
    float _189 = _185;
    if (_101)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _191 = _183;
    float _193 = _165 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _195 = _191;
    if (_107)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _197 = _189;
    bool _199 = _89 == 176;
    float _201 = _197;
    if (_107)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _203 = _195;
    float _205 = log2(_193);
    bool _207 = _89 == 192;
    float _209 = _203;
    if (_133)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _211 = _201;
    float _213 = _211;
    if (_133)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _215 = _209;
    float _217 = _215;
    if (_153)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _219 = _213;
    bool _221 = _89 == 208;
    float _223 = _219;
    if (_153)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _225 = _217;
    float _227 = _225;
    if (_167)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _229 = _223;
    bool _231 = _89 == 224;
    float _233 = _205 + 1.2999999523162841796875;
    float _235 = _229;
    if (_167)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _237 = _227;
    float _239 = _237;
    if (_177)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _241 = _235;
    bool _243 = _89 == 240;
    float _245 = trunc(_233);
    int _247 = int(_245);
    float _249 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _251 = _239;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _255 = _249;
    bool _257 = _89 == 256;
    float _259 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_199)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _265 = _259;
    bool _267 = _89 == 272;
    float _269 = _265;
    if (_199)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _271 = _263;
    float _273 = _271;
    if (_207)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _275 = _269;
    int _277 = min(_247, 15);
    bool _279 = _89 == 288;
    float _281 = _275;
    if (_207)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _283 = _273;
    float _285 = float(_277);
    bool _287 = _89 == 304;
    int _289 = _277 << 4;
    int _291 = _289 + 4288;
    float _293 = _283;
    float _295 = as_type<float>(_291);
    if (_221)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _297 = _281;
    float _299 = _297;
    if (_221)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _301 = _293;
    float _303 = -_285;
    float _305 = _303 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _307 = _301;
    if (_231)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _309 = _299;
    int _311 = _291 + 8;
    uint _314 = uint(int(uint(_311) >> uint(2)));
    uint _316 = uint(int(uint(int(_314)) >> uint(2)));
    int _318 = int(_314) & 3;
    float _320 = (*spvDescriptorSet0.vp_c14)._m0[int(_316)][_318];
    int _322 = int(_314) + 1;
    uint _324 = uint(int(uint(_322) >> uint(2)));
    int _326 = _322 & 3;
    float _328 = (*spvDescriptorSet0.vp_c14)._m0[int(_324)][_326];
    bool _330 = _89 == 320;
    float _332 = _305 + 1.0;
    float _334 = _309;
    if (_231)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _336 = _307;
    float _338 = _336;
    if (_243)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _340 = _334;
    bool _342 = _89 == 336;
    float _344 = exp2(_332);
    float _346 = _340;
    if (_243)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _348 = _338;
    float _350 = _348;
    if (_257)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _352 = _346;
    bool _354 = _89 == 352;
    float _356 = _352;
    if (_257)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _358 = _350;
    float _360 = _358;
    if (_267)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _362 = _356;
    bool _364 = _89 == 368;
    float _366 = _362;
    if (_267)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _368 = _360;
    float _370 = _368;
    if (_279)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _372 = _366;
    float _374 = 1.0 / _344;
    bool _376 = _89 == 384;
    float _378 = _372;
    if (_279)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _380 = _370;
    float _382 = _380;
    if (_287)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _384 = _378;
    bool _386 = _89 == 400;
    float _388 = _384;
    if (_287)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _390 = _382;
    bool _392 = _89 == 416;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _396 = _388;
    float _398 = _396;
    if (_330)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _400 = _394;
    float _402 = _400;
    if (_342)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _404 = _398;
    bool _406 = _89 == 432;
    float _408 = _404;
    if (_342)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _410 = _402;
    float _412 = _410;
    if (_354)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _414 = _408;
    bool _416 = _89 == 448;
    float _418 = _414;
    if (_354)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _420 = _412;
    float _422 = _420;
    if (_364)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _424 = _418;
    bool _426 = _89 == 464;
    float _428 = _424;
    if (_364)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _430 = _422;
    float _432 = _430;
    if (_376)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _434 = _428;
    bool _436 = _89 == 480;
    float _438 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _440 = _432;
    float _442 = _440;
    if (_386)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _444 = _438;
    bool _446 = _89 == 496;
    float _448 = _444;
    if (_386)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _450 = _442;
    float _452 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _454 = _448;
    bool _456 = _89 == 512;
    float _458 = _454;
    if (_392)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _460 = _452;
    bool _462 = _89 == 528;
    float _464 = _460;
    if (_406)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _466 = _458;
    float _468 = _466;
    if (_406)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _470 = _464;
    float _472 = _470;
    if (_416)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _474 = _468;
    bool _476 = _89 == 544;
    float _478 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _480 = _472;
    float _482 = _480;
    if (_426)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _484 = _478;
    bool _486 = _89 == 560;
    float _488 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _490 = _482;
    float _492 = _490;
    if (_436)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _494 = _488;
    bool _496 = _89 == 576;
    float _498 = _494;
    if (_436)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _500 = _492;
    float _502 = _500;
    if (_446)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _504 = _498;
    bool _506 = _89 == 592;
    float _508 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _510 = _502;
    float _512 = _510;
    if (_456)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _514 = _508;
    bool _516 = _89 == 608;
    float _518 = _514;
    if (_456)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _520 = _512;
    float _522 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _524 = _518;
    bool _526 = _89 == 624;
    float _528 = _524;
    if (_462)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _530 = _522;
    bool _532 = _89 == 640;
    float _534 = _530;
    if (_476)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _536 = _528;
    float _538 = _536;
    if (_476)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _540 = _534;
    float _542 = _540;
    if (_486)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _544 = _538;
    bool _546 = _89 == 656;
    float _548 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _550 = _542;
    float _552 = _550;
    if (_496)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _554 = _548;
    bool _556 = _89 == 672;
    float _558 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _560 = _552;
    float _562 = _560;
    if (_506)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _564 = _558;
    bool _566 = _89 == 688;
    float _568 = _564;
    if (_506)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _570 = _562;
    float _572 = _570;
    if (_516)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _574 = _568;
    bool _576 = _89 == 704;
    float _578 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _580 = _572;
    float _582 = _580;
    if (_526)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _584 = _578;
    bool _586 = _89 == 720;
    float _588 = _584;
    if (_526)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _590 = _582;
    float _592 = _590;
    if (_532)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _594 = _588;
    bool _596 = _89 == 736;
    float _598 = _594;
    if (_532)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _600 = _592;
    bool _602 = _89 == 752;
    float _604 = _600;
    if (_546)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _606 = _598;
    float _608 = _606;
    if (_556)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_566)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_576)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _618 = _616;
    float _620 = _618;
    if (_586)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _622 = _620;
    float _624 = _622;
    if (_596)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _626 = _624;
    float _628 = _626;
    if (_602)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _630 = _628;
    float _632 = _374 * _630;
    if (_546)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _634 = _604;
    float _636 = _634;
    if (_556)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _638 = _636;
    float _640 = _632 * _78;
    float _642 = _638;
    if (_566)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_576)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _648 = _646;
    float _650 = floor(_640);
    float _652 = _648;
    if (_586)
    {
        _652 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _654 = _652;
    float _656 = _654;
    if (_596)
    {
        _656 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _658 = _656;
    float _660 = _658;
    if (_602)
    {
        _660 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _662 = _660;
    float _664 = -_650;
    float _666 = _640 + _664;
    float _668 = _344 * _662;
    float _670 = _666 * 2.0;
    float _672 = -_666;
    float _674 = fma(_668, _672, _78);
    float _676 = floor(_670);
    float _678 = _668 * _676;
    float _680 = _678 * 0.5;
    float _682 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _684 = _680 + _674;
    float _686 = fma(_84, _684, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _688 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _692 = _686 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _696 = _688 + _694;
    float _698 = _692 * _692;
    float _700 = fma(_696, _696, _698);
    float _702 = fma(_147, _147, _700);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _706 = sqrt(_702);
    int _708 = _704 + 76;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c6)._m0[int(_712)][_714];
    uint _718 = uint(int(uint(_704) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.vp_c6)._m0[int(_720)][_722];
    float _726 = -_328;
    float _728 = fma(_706, _320, _726);
    float _730 = precise::clamp(_728, 0.0, 1.0);
    float _732 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _732;
    float _736 = -_680;
    float _738 = fma(_736, _730, _684);
    float _740 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _742 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _740;
    float _744 = fma(_738, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _746 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _748 = _744 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _752 = _744 + _750;
    float _754 = abs(_748);
    float _756 = abs(_742);
    float _758 = precise::max(_754, _756);
    float _760 = _716 + 8.0;
    float _762 = _760 + _758;
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _766 = _762 * _724;
    float _768 = _766 * 4.0;
    float _770 = _716;
    float _772 = _734;
    float _774 = _752;
    float _776 = _320;
    float _778 = _682;
    if (!_117)
    {
        float _780 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _770 = _780;
    }
    float _782 = _770;
    float _784 = precise::max(_768, 1.0);
    float _786 = log2(_784);
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[4].x * 0.5;
    float _790 = _782;
    if (!_117)
    {
        float _792 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _139 = _792;
    }
    float _794 = _139;
    float _796 = _794;
    if (!_117)
    {
        float _798 = _782 + _788;
        _790 = _798;
    }
    float _800 = _790;
    float _802 = _800;
    if (!_117)
    {
        float _804 = _794 + _788;
        _796 = _804;
    }
    float _806 = _796;
    float _808 = trunc(_786);
    int _810 = int(_808);
    float _812 = floor(_786);
    int _814 = min(_810, 4);
    int _816 = _814 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _818 = _816 << 4;
    float _820 = _812 + 1.0;
    float _822 = rint(_812);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    uint _828 = clamp(_826, 0u, 65535u);
    uint _830 = uint(int(uint(_818) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.vp_c6)._m0[int(_832)][_834];
    float _838 = rint(_820);
    float _840 = precise::max(_838, 0.0);
    uint _842 = uint(_840);
    uint _844 = clamp(_842, 0u, 65535u);
    int _846 = _818 + 16;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c6)._m0[int(_850)][_852];
    float _856 = fma(_734, _836, 0.5);
    float _858 = fma(_752, _836, 0.5);
    float _860 = fma(_734, _854, 0.5);
    float _862 = fma(_752, _854, 0.5);
    float _864 = as_type<float>(_818);
    float _866 = _820;
    float _868 = _860;
    float _870 = _806;
    if (!_117)
    {
        float2 _7251 = float2(_800, _806);
        float4 _873 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7251, float2(0.0), isnan(_7251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7251, float2(0.0), isnan(_7251)), level(0.0)).xyzw;
        float _875 = _873.x;
        float _877 = _873.y;
        float _879 = _873.z;
        float _881 = _873.w;
        _772 = _875;
        _295 = _877;
        _864 = _879;
        _774 = _881;
    }
    float _883 = _772;
    float _885 = _295;
    float _887 = _864;
    float _889 = _774;
    float3 _7281 = float3(_858, _856, float(int(_828)));
    float3 _7285 = select(_7281, float3(0.0), isnan(_7281));
    float3 _893 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7285.xy, uint(rint(_7285.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7285.xy, uint(rint(_7285.z)), level(0.0)).xyz;
    float _895 = _893.x;
    float _897 = _893.y;
    float _899 = _893.z;
    float3 _7300 = float3(_862, _860, float(int(_844)));
    float3 _7302 = select(_7300, float3(0.0), isnan(_7300));
    float3 _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _7302.xy, uint(rint(_7302.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _7302.xy, uint(rint(_7302.z)), level(0.0)).xyz;
    float _903 = _901.x;
    float _905 = _901.y;
    float _907 = _901.z;
    float _909 = (*spvDescriptorSet0.vp_c15)._m0[0].w + 1.953125;
    float _911 = _909;
    if (_117)
    {
        _776 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _913 = _776;
    float _915 = 0.0;
    if (_117)
    {
        float _917 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _764, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _915 = _917;
    }
    float _919 = _915;
    float _921 = 0.0;
    if (_117)
    {
        _921 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _923 = _921;
    float _925 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _927 = 0.0;
    if (_117)
    {
        float _929 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _913, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _927 = _929;
    }
    float _931 = _927;
    if (_117)
    {
        float _933 = fma(_744, _913, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _911 = _933;
    }
    float _935 = _911;
    float _937 = _744 + 1.953125;
    float _939 = _935;
    if (_117)
    {
        float _941 = fma(_931, _923, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _866 = _941;
    }
    float _943 = _866;
    if (_117)
    {
        float _945 = fma(_935, _923, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _939 = _945;
    }
    float _947 = _939;
    float _949 = _947;
    if (_117)
    {
        float _951 = fma((*spvDescriptorSet0.vp_c15)._m0[6].x, _682, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _868 = _951;
    }
    float _953 = _868;
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (_117)
    {
        float _957 = _943 + _788;
        _778 = _957;
    }
    float _959 = _778;
    if (_117)
    {
        float _961 = _947 + _788;
        _949 = _961;
    }
    float _963 = _949;
    float _965 = fma(_925, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    if (_117)
    {
        float _969 = _788 + _953;
        _870 = _969;
    }
    float _971 = _870;
    float _973 = _883;
    float _975 = _885;
    float _977 = _887;
    float _979 = _889;
    if (_117)
    {
        float2 _7453 = float2(_963, _959);
        float4 _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_7453, float2(0.0), isnan(_7453)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_7453, float2(0.0), isnan(_7453)), level(0.0)).xyzw;
        float _983 = _981.x;
        float _985 = _981.y;
        float _987 = _981.z;
        float _989 = _981.w;
        _973 = _983;
        _975 = _985;
        _977 = _987;
        _979 = _989;
    }
    float _991 = _973;
    float _993 = _975;
    float _995 = _977;
    float _997 = _979;
    float _999 = _965 + _788;
    float _1001 = _967 + _788;
    if (_117)
    {
        float _1003 = _788 + _919;
        _802 = _1003;
    }
    float _1005 = _802;
    float2 _7492 = float2(_1001, _971);
    float _1007 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7492, float2(0.0), isnan(_7492)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7492, float2(0.0), isnan(_7492)), level(0.0)).x;
    float2 _7500 = float2(_1005, _999);
    float _1009 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_7500, float2(0.0), isnan(_7500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_7500, float2(0.0), isnan(_7500)), level(0.0)).x;
    float _1011 = (*spvDescriptorSet0.vp_c15)._m0[0].w * 0.00012500000593718141317367553710938;
    float _1013 = _744 * 0.00012500000593718141317367553710938;
    float _1015 = -_812;
    float _1017 = _786 + _1015;
    float _1019 = abs(_1013);
    float _1021 = abs(_1011);
    float _1023 = precise::max(_1019, _1021);
    float _1025 = fma(_1017, 5.42372894287109375, -4.338983058929443359375);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_1023, 20.0, -19.0);
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = -_1031;
    float _1035 = _1033 + 1.0;
    float _1037 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 0.008000000379979610443115234375, 64.0);
    float _1039 = fma(_744, 0.008000000379979610443115234375, 64.0);
    float _1041 = precise::max(0.0, _1037);
    float _1043 = precise::max(0.0, _1039);
    float _1045 = precise::min(_1041, 127.0);
    float _1047 = -_899;
    float _1049 = _1047 + _907;
    float _1051 = -_895;
    float _1053 = _1051 + _903;
    float _1055 = -_897;
    float _1057 = _1055 + _905;
    float _1059 = fma(_1027, _1049, _899);
    float _1061 = fma(_1027, _1053, _895);
    float _1063 = fma(_1027, _1057, _897);
    float _1065 = precise::min(_1043, 127.0);
    float _1067 = fma(_1035, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _1069 = fma(_1035, _1061, _744);
    float _1071 = trunc(_1045);
    int _1073 = int(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _1077 = _1067 + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _1081 = _1069 + _1079;
    float _1083 = _1077 * _1077;
    float _1085 = trunc(_1065);
    int _1087 = int(_1085);
    float _1089 = fma(_1081, _1081, _1083);
    float _1091 = fma(_1081, _1081, _1083);
    bool _1093 = _1089 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _1095 = isnan(_1089);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _1101 = _1097 || _1099;
    float _1103 = fma(_991, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1105 = sqrt(_1091);
    float _1107 = fma(_1035, _1063, _1103);
    float _1109 = _1083;
    float _1111 = _1041;
    float _1113 = _1035;
    float _1115 = _991;
    float _1117 = _1089;
    float _1119 = _1043;
    if (!_1101)
    {
        _1109 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_1101)
    {
        float _1125 = -_1089;
        float _1127 = _1125 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _1111 = _1127;
    }
    float _1129 = _1111;
    float _1131 = _1129;
    if (!_1101)
    {
        float _1133 = _1089 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _1113 = _1133;
    }
    float _1135 = _1113;
    if (!_1101)
    {
        float _1137 = -_1129;
        float _1139 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = _1141;
    if (_1101)
    {
        _1123 = _1107;
    }
    float _1145 = _1123;
    float _1147 = _1145;
    if (!_1101)
    {
        float _1149 = precise::min(_1107, _1141);
        _1143 = _1149;
    }
    float _1151 = _1143;
    if (!_1101)
    {
        float _1153 = -_1151;
        float _1155 = _1107 + _1153;
        _1115 = _1155;
    }
    float _1157 = _1115;
    float _1159 = _1157;
    if (!_1101)
    {
        float _1161 = fma(_1135, _1157, _1151);
        _1147 = _1161;
    }
    float _1163 = _1147;
    bool _1165 = _1105 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    int _1167 = _1073 << 7;
    int _1169 = _1167 + _1087;
    float _1171 = _1163 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    int _1173 = _1169 << 4;
    float _1175 = fma(_1069, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1171);
    int _1177 = _1173 + 8;
    float _1179 = fma(_1067, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1175);
    float _1181 = as_type<float>(_1169);
    if (!_1165)
    {
        _1117 = _1069;
    }
    float _1183 = _1117;
    float _1185 = _1179 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1187 = _1183;
    if (!_1165)
    {
        _1159 = _1067;
    }
    float _1189 = _1159;
    float _1191 = _1189;
    if (!_1165)
    {
        _1119 = _1163;
    }
    float _1193 = _1119;
    float _1195 = _1193;
    if (!_1165)
    {
        _1181 = _1185;
    }
    float _1197 = _1181;
    bool _1199 = !_1165;
    float _1201 = _1197;
    if (!_1199)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1207 = _1105 + _1205;
        float _1209 = rsqrt(_1091);
        float _1211 = _1207 * _1203;
        float _1213 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1215 = _1211 * 0.15915493667125701904296875;
        float _1217 = _1215 * 6.283185482025146484375;
        float _1219 = cos(_1217);
        float _1221 = _1215 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = _1219 + (-1.0);
        float _1227 = fma(_1223, _1213, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1229 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1231 = _1209 * _1227;
        float _1233 = fma(_1219, _1163, _1229);
        float _1235 = fma(_1081, _1231, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1237 = _1233 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1239 = fma(_1077, _1231, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1241 = fma(_1235, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1237);
        float _1243 = fma(_1239, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1241);
        float _1245 = _1243 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1195 = _1233;
        _1187 = _1235;
        _1191 = _1239;
        _1201 = _1245;
    }
    float _1247 = _1195;
    float _1249 = _1187;
    float _1251 = _1191;
    float _1253 = _1201;
    uint _1255 = uint(int(uint(_1177) >> uint(2)));
    float _1257 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1255)]);
    float _1259 = floor(_1065);
    int _1261 = _1173 + 12;
    uint _1263 = uint(int(uint(_1173) >> uint(2)));
    float _1265 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1263)]);
    uint _1267 = uint(int(uint(_1261) >> uint(2)));
    float _1269 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1267)]);
    float _1271 = floor(_1045);
    float _1273 = -_1259;
    float _1275 = _1065 + _1273;
    float _1277 = -_1271;
    float _1279 = _1045 + _1277;
    int _1281 = _1173 + 4;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    float _1285 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1283)]);
    float _1287 = _1257 + _1275;
    float _1289 = precise::clamp(_1287, 0.0, 1.0);
    float _1291 = _1257 + _1279;
    float _1293 = precise::clamp(_1291, 0.0, 1.0);
    bool _1295 = _1289 >= 1.0;
    bool _1297 = isnan(_1289);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(1.0);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    bool _1307 = _1293 >= 1.0;
    bool _1309 = isnan(_1293);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan(1.0);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = trunc(_1305);
    int _1321 = int(_1319);
    float _1323 = trunc(_1317);
    int _1325 = int(_1323);
    int _1327 = _1087 + _1321;
    int _1329 = _1073 << 7;
    int _1331 = _1329 + _1327;
    int _1333 = _1073 + _1325;
    int _1335 = _1333 << 7;
    int _1337 = _1335 + _1327;
    int _1339 = _1333 << 7;
    int _1341 = _1339 + _1087;
    int _1343 = _1337 << 4;
    int _1345 = _1331 << 4;
    int _1347 = _1341 << 4;
    uint _1349 = uint(int(uint(_1343) >> uint(2)));
    float _1351 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1349)]);
    int _1353 = _1343 + 12;
    int _1355 = _1345 + 12;
    uint _1357 = uint(int(uint(_1345) >> uint(2)));
    float _1359 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1357)]);
    int _1361 = _1347 + 12;
    uint _1363 = uint(int(uint(_1353) >> uint(2)));
    float _1365 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1363)]);
    uint _1367 = uint(int(uint(_1355) >> uint(2)));
    float _1369 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1367)]);
    uint _1371 = uint(int(uint(_1361) >> uint(2)));
    float _1373 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1371)]);
    uint _1375 = uint(int(uint(_1347) >> uint(2)));
    float _1377 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1375)]);
    float _1379 = fma(_1007, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1381 = fma(_1009, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _1383 = -_1103;
    float _1385 = _1383 + _1379;
    float _1387 = -_1103;
    float _1389 = _1387 + _1381;
    float _1391 = _1385 * 1.953125;
    float _1393 = _1389 * 1.953125;
    float _1395 = floor(_1289);
    float _1397 = floor(_1293);
    float _1399 = fma(_997, 255.99609375, 7.629510946571826934814453125e-06);
    float _1401 = _1269 * _1275;
    float _1403 = _1285 * _1275;
    float _1405 = _1285 * _1279;
    float _1407 = floor(_1403);
    float _1409 = -_1395;
    float _1411 = _1289 + _1409;
    float _1413 = floor(_1405);
    float _1415 = -_1397;
    float _1417 = _1293 + _1415;
    float _1419 = _1269 * _1411;
    float _1421 = _1269 * _1417;
    float _1423 = _1269 * _1279;
    float _1425 = floor(_1419);
    float _1427 = floor(_1421);
    float _1429 = _1407 + _1413;
    float _1431 = 1.0 / _1269;
    float _1433 = floor(_1423);
    float _1435 = floor(_1401);
    float _1437 = fma(_993, 200.0, -100.0);
    float _1439 = fma(_995, 200.0, -100.0);
    float _1441 = _1247 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1443 = _1247 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1445 = fma(_1391, _1391, 14.55191516876220703125);
    float _1447 = floor(_1399);
    float _1449 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1441);
    float _1451 = fma(_1249, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1443);
    float _1453 = fma(_1393, _1393, _1445);
    float _1455 = trunc(_1429);
    int _1457 = int(_1455);
    float _1459 = fma(_1269, _1433, _1435);
    float _1461 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1451);
    float _1463 = fma(_1251, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1449);
    float _1465 = _1461 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1467 = rsqrt(_1453);
    float _1469 = -_1447;
    float _1471 = _1399 + _1469;
    float _1473 = _1463 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1477 = -_1413;
    float _1479 = _1405 + _1477;
    float _1481 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    bool _1483 = _1471 > 0.499000012874603271484375;
    float _1485 = trunc(_1459);
    int _1487 = int(_1485);
    int _1489 = _1457 & 1;
    bool _1491 = _1489 != 0;
    float _1493 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1495 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1475);
    float _1497 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1495);
    float _1499 = -_1407;
    float _1501 = _1403 + _1499;
    int _1503 = as_type<int>(_1265) + _1487;
    float _1505 = fma(_1427, _1365, _1425);
    float _1507 = _1365 * _1431;
    float _1509 = fma(_1433, _1369, _1425);
    float _1511 = _1369 * _1431;
    float _1513 = fma(_1373, _1427, _1435);
    float _1515 = _1373 * _1431;
    float _1517 = _1507 * _1505;
    float _1519 = _1511 * _1509;
    float _1521 = _1515 * _1513;
    float _1523 = _1465 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1525 = trunc(_1519);
    int _1527 = int(_1525);
    float _1529 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1481);
    float _1531 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1523);
    float _1533 = trunc(_1521);
    int _1535 = int(_1533);
    float _1537 = fma(_1473, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1493);
    float _1539 = trunc(_1517);
    int _1541 = int(_1539);
    float _1543 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1531);
    float _1545 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1529);
    float _1547 = fma(_1253, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1537);
    float _1549 = _1391 * _1467;
    float _1551 = _1439 * _1439;
    float _1553 = _1497 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    int _1555 = as_type<int>(_1359) + _1527;
    float _1557 = _1393 * _1467;
    float _1559 = fma(_1437, _1437, _1551);
    int _1561 = as_type<int>(_1377) + _1535;
    float _1563 = _1467 * 3.814697265625;
    float _1565 = _1543 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1567 = _1545 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1569 = _1547 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1571 = !_1483;
    int _1573 = _1571 ? as_type<int>(_1553) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    int _1575 = as_type<int>(_1351) + _1541;
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
    float _2437;
    if (!_1491)
    {
        float _1577 = fma(_1479, -0.707106769084930419921875, 0.707106769084930419921875);
        float _1579 = fma(_1501, -0.707106769084930419921875, _1577);
        bool _1581 = _1579 >= 0.0;
        bool _1583 = !_1581;
        if (!_1583)
        {
            int _1585 = _1555 * 656;
            int _1587 = _1585 + 262144;
            int _1589 = _1585 + 262192;
            int _1591 = _1585 + 262160;
            uint _1593 = uint(int(uint(_1587) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1593)];
            float _1595 = as_type<float>(_dmw0.x);
            int _1597 = _1587 + 4;
            uint _1599 = uint(int(uint(_1597) >> uint(2)));
            float _1601 = as_type<float>(_dmw0.y);
            int _1603 = _1587 + 8;
            uint _1605 = uint(int(uint(_1603) >> uint(2)));
            float _1607 = as_type<float>(_dmw0.z);
            int _1609 = _1587 + 12;
            uint _1611 = uint(int(uint(_1609) >> uint(2)));
            float _1613 = as_type<float>(_dmw0.w);
            int _1615 = _1585 + 262208;
            uint _1617 = uint(int(uint(_1589) >> uint(2)));
            packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1617)];
            float _1619 = as_type<float>(_dmw3.x);
            int _1621 = _1589 + 4;
            uint _1623 = uint(int(uint(_1621) >> uint(2)));
            float _1625 = as_type<float>(_dmw3.y);
            int _1627 = _1589 + 8;
            uint _1629 = uint(int(uint(_1627) >> uint(2)));
            float _1631 = as_type<float>(_dmw3.z);
            int _1633 = _1589 + 12;
            uint _1635 = uint(int(uint(_1633) >> uint(2)));
            float _1637 = as_type<float>(_dmw3.w);
            int _1639 = _1585 + 262224;
            int _1641 = _1585 + 262240;
            uint _1643 = uint(int(uint(_1591) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1643)];
            float _1645 = as_type<float>(_dmw1.x);
            int _1647 = _1591 + 4;
            uint _1649 = uint(int(uint(_1647) >> uint(2)));
            float _1651 = as_type<float>(_dmw1.y);
            int _1653 = _1591 + 8;
            uint _1655 = uint(int(uint(_1653) >> uint(2)));
            float _1657 = as_type<float>(_dmw1.z);
            int _1659 = _1591 + 12;
            uint _1661 = uint(int(uint(_1659) >> uint(2)));
            float _1663 = as_type<float>(_dmw1.w);
            int _1665 = _1585 + 262176;
            int _1667 = _1503 * 656;
            int _1669 = _1585 + 262256;
            uint _1671 = uint(int(uint(_1615) >> uint(2)));
            packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1671)];
            float _1673 = as_type<float>(_dmw4.x);
            int _1675 = _1615 + 4;
            uint _1677 = uint(int(uint(_1675) >> uint(2)));
            float _1679 = as_type<float>(_dmw4.y);
            int _1681 = _1615 + 8;
            uint _1683 = uint(int(uint(_1681) >> uint(2)));
            float _1685 = as_type<float>(_dmw4.z);
            int _1687 = _1615 + 12;
            uint _1689 = uint(int(uint(_1687) >> uint(2)));
            float _1691 = as_type<float>(_dmw4.w);
            uint _1693 = uint(int(uint(_1639) >> uint(2)));
            packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1693)];
            float _1695 = as_type<float>(_dmw5.x);
            int _1697 = _1639 + 4;
            uint _1699 = uint(int(uint(_1697) >> uint(2)));
            float _1701 = as_type<float>(_dmw5.y);
            int _1703 = _1639 + 8;
            uint _1705 = uint(int(uint(_1703) >> uint(2)));
            float _1707 = as_type<float>(_dmw5.z);
            int _1709 = _1639 + 12;
            uint _1711 = uint(int(uint(_1709) >> uint(2)));
            float _1713 = as_type<float>(_dmw5.w);
            uint _1715 = uint(int(uint(_1641) >> uint(2)));
            packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1715)];
            float _1717 = as_type<float>(_dmw6.x);
            int _1719 = _1641 + 4;
            uint _1721 = uint(int(uint(_1719) >> uint(2)));
            float _1723 = as_type<float>(_dmw6.y);
            int _1725 = _1641 + 8;
            uint _1727 = uint(int(uint(_1725) >> uint(2)));
            float _1729 = as_type<float>(_dmw6.z);
            int _1731 = _1641 + 12;
            uint _1733 = uint(int(uint(_1731) >> uint(2)));
            float _1735 = as_type<float>(_dmw6.w);
            int _1737 = _1561 * 656;
            uint _1739 = uint(int(uint(_1665) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1739)];
            float _1741 = as_type<float>(_dmw2.x);
            int _1743 = _1665 + 4;
            uint _1745 = uint(int(uint(_1743) >> uint(2)));
            float _1747 = as_type<float>(_dmw2.y);
            int _1749 = _1665 + 8;
            uint _1751 = uint(int(uint(_1749) >> uint(2)));
            float _1753 = as_type<float>(_dmw2.z);
            int _1755 = _1665 + 12;
            uint _1757 = uint(int(uint(_1755) >> uint(2)));
            float _1759 = as_type<float>(_dmw2.w);
            int _1761 = _1667 + 262144;
            int _1763 = _1667 + 262192;
            uint _1765 = uint(int(uint(_1669) >> uint(2)));
            packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1765)];
            float _1767 = as_type<float>(_dmw7.x);
            int _1769 = _1669 + 4;
            uint _1771 = uint(int(uint(_1769) >> uint(2)));
            float _1773 = as_type<float>(_dmw7.y);
            int _1775 = _1669 + 8;
            uint _1777 = uint(int(uint(_1775) >> uint(2)));
            float _1779 = as_type<float>(_dmw7.z);
            int _1781 = _1669 + 12;
            uint _1783 = uint(int(uint(_1781) >> uint(2)));
            float _1785 = as_type<float>(_dmw7.w);
            int _1787 = _1667 + 262160;
            int _1789 = _1667 + 262208;
            uint _1791 = uint(int(uint(_1761) >> uint(2)));
            packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1791)];
            float _1793 = as_type<float>(_dmw8.x);
            int _1795 = _1761 + 4;
            uint _1797 = uint(int(uint(_1795) >> uint(2)));
            float _1799 = as_type<float>(_dmw8.y);
            int _1801 = _1761 + 8;
            uint _1803 = uint(int(uint(_1801) >> uint(2)));
            float _1805 = as_type<float>(_dmw8.z);
            int _1807 = _1761 + 12;
            uint _1809 = uint(int(uint(_1807) >> uint(2)));
            float _1811 = as_type<float>(_dmw8.w);
            int _1813 = _1667 + 262176;
            int _1815 = _1667 + 262224;
            uint _1817 = uint(int(uint(_1763) >> uint(2)));
            packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1817)];
            float _1819 = as_type<float>(_dmw11.x);
            int _1821 = _1763 + 4;
            uint _1823 = uint(int(uint(_1821) >> uint(2)));
            float _1825 = as_type<float>(_dmw11.y);
            int _1827 = _1763 + 8;
            uint _1829 = uint(int(uint(_1827) >> uint(2)));
            float _1831 = as_type<float>(_dmw11.z);
            int _1833 = _1763 + 12;
            uint _1835 = uint(int(uint(_1833) >> uint(2)));
            float _1837 = as_type<float>(_dmw11.w);
            int _1839 = _1667 + 262240;
            int _1841 = _1667 + 262256;
            uint _1843 = uint(int(uint(_1787) >> uint(2)));
            packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1843)];
            float _1845 = as_type<float>(_dmw9.x);
            int _1847 = _1787 + 4;
            uint _1849 = uint(int(uint(_1847) >> uint(2)));
            float _1851 = as_type<float>(_dmw9.y);
            int _1853 = _1787 + 8;
            uint _1855 = uint(int(uint(_1853) >> uint(2)));
            float _1857 = as_type<float>(_dmw9.z);
            int _1859 = _1787 + 12;
            uint _1861 = uint(int(uint(_1859) >> uint(2)));
            float _1863 = as_type<float>(_dmw9.w);
            int _1865 = _1737 + 262144;
            int _1867 = _1737 + 262192;
            uint _1869 = uint(int(uint(_1789) >> uint(2)));
            packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1869)];
            float _1871 = as_type<float>(_dmw12.x);
            int _1873 = _1789 + 4;
            uint _1875 = uint(int(uint(_1873) >> uint(2)));
            float _1877 = as_type<float>(_dmw12.y);
            int _1879 = _1789 + 8;
            uint _1881 = uint(int(uint(_1879) >> uint(2)));
            float _1883 = as_type<float>(_dmw12.z);
            int _1885 = _1789 + 12;
            uint _1887 = uint(int(uint(_1885) >> uint(2)));
            float _1889 = as_type<float>(_dmw12.w);
            int _1891 = _1737 + 262160;
            int _1893 = _1737 + 262208;
            uint _1895 = uint(int(uint(_1813) >> uint(2)));
            packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1895)];
            float _1897 = as_type<float>(_dmw10.x);
            int _1899 = _1813 + 4;
            uint _1901 = uint(int(uint(_1899) >> uint(2)));
            float _1903 = as_type<float>(_dmw10.y);
            int _1905 = _1813 + 8;
            uint _1907 = uint(int(uint(_1905) >> uint(2)));
            float _1909 = as_type<float>(_dmw10.z);
            int _1911 = _1813 + 12;
            uint _1913 = uint(int(uint(_1911) >> uint(2)));
            float _1915 = as_type<float>(_dmw10.w);
            int _1917 = _1737 + 262176;
            int _1919 = _1737 + 262224;
            uint _1921 = uint(int(uint(_1815) >> uint(2)));
            packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1921)];
            float _1923 = as_type<float>(_dmw13.x);
            int _1925 = _1815 + 4;
            uint _1927 = uint(int(uint(_1925) >> uint(2)));
            float _1929 = as_type<float>(_dmw13.y);
            int _1931 = _1815 + 8;
            uint _1933 = uint(int(uint(_1931) >> uint(2)));
            float _1935 = as_type<float>(_dmw13.z);
            int _1937 = _1815 + 12;
            uint _1939 = uint(int(uint(_1937) >> uint(2)));
            float _1941 = as_type<float>(_dmw13.w);
            int _1943 = _1737 + 262240;
            int _1945 = _1737 + 262256;
            uint _1947 = uint(int(uint(_1839) >> uint(2)));
            packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1947)];
            float _1949 = as_type<float>(_dmw14.x);
            int _1951 = _1839 + 4;
            uint _1953 = uint(int(uint(_1951) >> uint(2)));
            float _1955 = as_type<float>(_dmw14.y);
            int _1957 = _1839 + 8;
            uint _1959 = uint(int(uint(_1957) >> uint(2)));
            float _1961 = as_type<float>(_dmw14.z);
            int _1963 = _1839 + 12;
            uint _1965 = uint(int(uint(_1963) >> uint(2)));
            float _1967 = as_type<float>(_dmw14.w);
            uint _1969 = uint(int(uint(_1841) >> uint(2)));
            packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1969)];
            float _1971 = as_type<float>(_dmw15.x);
            int _1973 = _1841 + 4;
            uint _1975 = uint(int(uint(_1973) >> uint(2)));
            float _1977 = as_type<float>(_dmw15.y);
            int _1979 = _1841 + 8;
            uint _1981 = uint(int(uint(_1979) >> uint(2)));
            float _1983 = as_type<float>(_dmw15.z);
            int _1985 = _1841 + 12;
            uint _1987 = uint(int(uint(_1985) >> uint(2)));
            float _1989 = as_type<float>(_dmw15.w);
            uint _1991 = uint(int(uint(_1865) >> uint(2)));
            packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1991)];
            float _1993 = as_type<float>(_dmw16.x);
            int _1995 = _1865 + 4;
            uint _1997 = uint(int(uint(_1995) >> uint(2)));
            float _1999 = as_type<float>(_dmw16.y);
            int _2001 = _1865 + 8;
            uint _2003 = uint(int(uint(_2001) >> uint(2)));
            float _2005 = as_type<float>(_dmw16.z);
            int _2007 = _1865 + 12;
            uint _2009 = uint(int(uint(_2007) >> uint(2)));
            float _2011 = as_type<float>(_dmw16.w);
            uint _2013 = uint(int(uint(_1867) >> uint(2)));
            packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2013)];
            float _2015 = as_type<float>(_dmw19.x);
            int _2017 = _1867 + 4;
            uint _2019 = uint(int(uint(_2017) >> uint(2)));
            float _2021 = as_type<float>(_dmw19.y);
            int _2023 = _1867 + 8;
            uint _2025 = uint(int(uint(_2023) >> uint(2)));
            float _2027 = as_type<float>(_dmw19.z);
            int _2029 = _1867 + 12;
            uint _2031 = uint(int(uint(_2029) >> uint(2)));
            float _2033 = as_type<float>(_dmw19.w);
            uint _2035 = uint(int(uint(_1891) >> uint(2)));
            packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2035)];
            float _2037 = as_type<float>(_dmw17.x);
            int _2039 = _1891 + 4;
            uint _2041 = uint(int(uint(_2039) >> uint(2)));
            float _2043 = as_type<float>(_dmw17.y);
            int _2045 = _1891 + 8;
            uint _2047 = uint(int(uint(_2045) >> uint(2)));
            float _2049 = as_type<float>(_dmw17.z);
            int _2051 = _1891 + 12;
            uint _2053 = uint(int(uint(_2051) >> uint(2)));
            float _2055 = as_type<float>(_dmw17.w);
            uint _2057 = uint(int(uint(_1893) >> uint(2)));
            packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2057)];
            float _2059 = as_type<float>(_dmw20.x);
            int _2061 = _1893 + 4;
            uint _2063 = uint(int(uint(_2061) >> uint(2)));
            float _2065 = as_type<float>(_dmw20.y);
            int _2067 = _1893 + 8;
            uint _2069 = uint(int(uint(_2067) >> uint(2)));
            float _2071 = as_type<float>(_dmw20.z);
            int _2073 = _1893 + 12;
            uint _2075 = uint(int(uint(_2073) >> uint(2)));
            float _2077 = as_type<float>(_dmw20.w);
            uint _2079 = uint(int(uint(_1917) >> uint(2)));
            packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2079)];
            float _2081 = as_type<float>(_dmw18.x);
            int _2083 = _1917 + 4;
            uint _2085 = uint(int(uint(_2083) >> uint(2)));
            float _2087 = as_type<float>(_dmw18.y);
            int _2089 = _1917 + 8;
            uint _2091 = uint(int(uint(_2089) >> uint(2)));
            float _2093 = as_type<float>(_dmw18.z);
            int _2095 = _1917 + 12;
            uint _2097 = uint(int(uint(_2095) >> uint(2)));
            float _2099 = as_type<float>(_dmw18.w);
            uint _2101 = uint(int(uint(_1919) >> uint(2)));
            packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2101)];
            float _2103 = as_type<float>(_dmw21.x);
            int _2105 = _1919 + 4;
            uint _2107 = uint(int(uint(_2105) >> uint(2)));
            float _2109 = as_type<float>(_dmw21.y);
            int _2111 = _1919 + 8;
            uint _2113 = uint(int(uint(_2111) >> uint(2)));
            float _2115 = as_type<float>(_dmw21.z);
            int _2117 = _1919 + 12;
            uint _2119 = uint(int(uint(_2117) >> uint(2)));
            float _2121 = as_type<float>(_dmw21.w);
            uint _2123 = uint(int(uint(_1943) >> uint(2)));
            packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2123)];
            float _2125 = as_type<float>(_dmw22.x);
            int _2127 = _1943 + 4;
            uint _2129 = uint(int(uint(_2127) >> uint(2)));
            float _2131 = as_type<float>(_dmw22.y);
            int _2133 = _1943 + 8;
            uint _2135 = uint(int(uint(_2133) >> uint(2)));
            float _2137 = as_type<float>(_dmw22.z);
            int _2139 = _1943 + 12;
            uint _2141 = uint(int(uint(_2139) >> uint(2)));
            float _2143 = as_type<float>(_dmw22.w);
            uint _2145 = uint(int(uint(_1945) >> uint(2)));
            packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2145)];
            float _2147 = as_type<float>(_dmw23.x);
            int _2149 = _1945 + 4;
            uint _2151 = uint(int(uint(_2149) >> uint(2)));
            float _2153 = as_type<float>(_dmw23.y);
            int _2155 = _1945 + 8;
            uint _2157 = uint(int(uint(_2155) >> uint(2)));
            float _2159 = as_type<float>(_dmw23.z);
            int _2161 = _1945 + 12;
            uint _2163 = uint(int(uint(_2161) >> uint(2)));
            float _2165 = as_type<float>(_dmw23.w);
            float _2167 = _1479 + (-1.0);
            float _2169 = -_1501;
            float _2171 = -_2167;
            float _2173 = _2169 + _2171;
            float _2175 = -_2173;
            float _2177 = _2175 + 1.0;
            float _2179 = _1501 * _1595;
            float _2181 = _1501 * _1601;
            float _2183 = _1501 * _1607;
            float _2185 = _1501 * _1613;
            float _2187 = _1501 * _1619;
            float _2189 = _1501 * _1625;
            float _2191 = _1501 * _1631;
            float _2193 = _1501 * _1637;
            float _2195 = _1501 * _1645;
            float _2197 = _1501 * _1651;
            float _2199 = _1501 * _1657;
            float _2201 = _1501 * _1663;
            float _2203 = _1501 * _1673;
            float _2205 = _1501 * _1679;
            float _2207 = _1501 * _1685;
            float _2209 = _1501 * _1701;
            float _2211 = _1501 * _1707;
            float _2213 = _1501 * _1713;
            float _2215 = _1501 * _1691;
            float _2217 = _1501 * _1717;
            float _2219 = _1501 * _1723;
            float _2221 = _1501 * _1729;
            float _2223 = _1501 * _1741;
            float _2225 = _1501 * _1747;
            float _2227 = _1501 * _1753;
            float _2229 = _1501 * _1735;
            float _2231 = _1501 * _1759;
            float _2233 = _1501 * _1767;
            float _2235 = _1501 * _1695;
            float _2237 = _1501 * _1773;
            float _2239 = _1501 * _1779;
            float _2241 = -_1501;
            float _2243 = _2241 + _2177;
            float _2245 = _1501 * _1785;
            float _2247 = fma(_2173, _1793, _2179);
            float _2249 = fma(_2173, _1799, _2181);
            float _2251 = fma(_2173, _1805, _2183);
            float _2253 = fma(_2173, _1811, _2185);
            float _2255 = fma(_2173, _1819, _2187);
            float _2257 = fma(_2173, _1825, _2189);
            float _2259 = fma(_2173, _1831, _2191);
            float _2261 = fma(_2173, _1837, _2193);
            float _2263 = fma(_2173, _1845, _2195);
            float _2265 = fma(_2173, _1851, _2197);
            float _2267 = fma(_2173, _1857, _2199);
            float _2269 = fma(_2173, _1863, _2201);
            float _2271 = fma(_2173, _1871, _2203);
            float _2273 = fma(_2173, _1877, _2205);
            float _2275 = fma(_2173, _1883, _2207);
            float _2277 = fma(_2173, _1889, _2215);
            float _2279 = fma(_2173, _1897, _2223);
            float _2281 = fma(_2173, _1903, _2225);
            float _2283 = fma(_2173, _1909, _2227);
            float _2285 = fma(_2173, _1915, _2231);
            float _2287 = fma(_2173, _1923, _2235);
            float _2289 = fma(_2173, _1929, _2209);
            float _2291 = fma(_2173, _1935, _2211);
            float _2293 = fma(_2173, _1941, _2213);
            float _2295 = fma(_2173, _1949, _2217);
            float _2297 = fma(_2173, _1955, _2219);
            float _2299 = fma(_2173, _1961, _2221);
            float _2301 = fma(_2173, _1967, _2229);
            float _2303 = fma(_2173, _1971, _2233);
            float _2305 = fma(_2173, _1977, _2237);
            float _2307 = fma(_2173, _1983, _2239);
            float _2309 = fma(_2173, _1989, _2245);
            float _2311 = fma(_2243, _1993, _2247);
            float _2313 = fma(_2243, _1999, _2249);
            float _2315 = fma(_2243, _2005, _2251);
            float _2317 = fma(_2243, _2011, _2253);
            float _2319 = fma(_2243, _2015, _2255);
            float _2321 = fma(_2243, _2021, _2257);
            float _2323 = fma(_2243, _2027, _2259);
            float _2325 = fma(_2243, _2033, _2261);
            float _2327 = fma(_2243, _2037, _2263);
            float _2329 = fma(_2243, _2043, _2265);
            float _2331 = fma(_2243, _2049, _2267);
            float _2333 = fma(_2243, _2055, _2269);
            float _2335 = fma(_2243, _2059, _2271);
            float _2337 = fma(_2243, _2065, _2273);
            float _2339 = fma(_2243, _2071, _2275);
            float _2341 = fma(_2243, _2077, _2277);
            float _2343 = fma(_2243, _2081, _2279);
            float _2345 = fma(_2243, _2087, _2281);
            float _2347 = fma(_2243, _2093, _2283);
            float _2349 = fma(_2243, _2099, _2285);
            float _2351 = fma(_2243, _2103, _2287);
            float _2353 = fma(_2243, _2109, _2289);
            float _2355 = fma(_2243, _2115, _2291);
            float _2357 = fma(_2243, _2121, _2293);
            float _2359 = fma(_2243, _2125, _2295);
            float _2361 = fma(_2243, _2131, _2297);
            float _2363 = fma(_2243, _2137, _2299);
            float _2365 = fma(_2243, _2143, _2301);
            float _2367 = fma(_2243, _2147, _2303);
            float _2369 = fma(_2243, _2153, _2305);
            float _2371 = fma(_2243, _2159, _2307);
            float _2373 = fma(_2243, _2165, _2309);
            _2375 = _2325;
            _2377 = _2321;
            _2379 = _2353;
            _2381 = _2335;
            _2383 = _2319;
            _2385 = _2339;
            _2387 = _2355;
            _2389 = _2337;
            _2391 = _2341;
            _2393 = _2357;
            _2395 = _2323;
            _2397 = _2351;
            _2399 = _2369;
            _2401 = _2317;
            _2403 = _2367;
            _2405 = _2327;
            _2407 = _2329;
            _2409 = _2361;
            _2411 = _2311;
            _2413 = _2313;
            _2415 = _2315;
            _2417 = _2359;
            _2419 = _2371;
            _2421 = _2333;
            _2423 = _2343;
            _2425 = _2363;
            _2427 = _2373;
            _2429 = _2347;
            _2431 = _2349;
            _2433 = _2365;
            _2435 = _2331;
            _2437 = _2345;
            _2439 = true;
        }
        else
        {
            int _2441 = _1561 * 656;
            int _2443 = _2441 + 262144;
            int _2445 = _2441 + 262192;
            int _2447 = _2441 + 262160;
            uint _2449 = uint(int(uint(_2443) >> uint(2)));
            packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2449)];
            float _2451 = as_type<float>(_dmw24.x);
            int _2453 = _2443 + 4;
            uint _2455 = uint(int(uint(_2453) >> uint(2)));
            float _2457 = as_type<float>(_dmw24.y);
            int _2459 = _2443 + 8;
            uint _2461 = uint(int(uint(_2459) >> uint(2)));
            float _2463 = as_type<float>(_dmw24.z);
            int _2465 = _2443 + 12;
            uint _2467 = uint(int(uint(_2465) >> uint(2)));
            float _2469 = as_type<float>(_dmw24.w);
            int _2471 = _2441 + 262208;
            uint _2473 = uint(int(uint(_2445) >> uint(2)));
            packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2473)];
            float _2475 = as_type<float>(_dmw27.x);
            int _2477 = _2445 + 4;
            uint _2479 = uint(int(uint(_2477) >> uint(2)));
            float _2481 = as_type<float>(_dmw27.y);
            int _2483 = _2445 + 8;
            uint _2485 = uint(int(uint(_2483) >> uint(2)));
            float _2487 = as_type<float>(_dmw27.z);
            int _2489 = _2445 + 12;
            uint _2491 = uint(int(uint(_2489) >> uint(2)));
            float _2493 = as_type<float>(_dmw27.w);
            int _2495 = _2441 + 262176;
            uint _2497 = uint(int(uint(_2447) >> uint(2)));
            packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2497)];
            float _2499 = as_type<float>(_dmw25.x);
            int _2501 = _2447 + 4;
            uint _2503 = uint(int(uint(_2501) >> uint(2)));
            float _2505 = as_type<float>(_dmw25.y);
            int _2507 = _2447 + 8;
            uint _2509 = uint(int(uint(_2507) >> uint(2)));
            float _2511 = as_type<float>(_dmw25.z);
            int _2513 = _2447 + 12;
            uint _2515 = uint(int(uint(_2513) >> uint(2)));
            float _2517 = as_type<float>(_dmw25.w);
            int _2519 = _2441 + 262224;
            uint _2521 = uint(int(uint(_2471) >> uint(2)));
            packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2521)];
            float _2523 = as_type<float>(_dmw28.x);
            int _2525 = _2471 + 4;
            uint _2527 = uint(int(uint(_2525) >> uint(2)));
            float _2529 = as_type<float>(_dmw28.y);
            int _2531 = _2471 + 8;
            uint _2533 = uint(int(uint(_2531) >> uint(2)));
            float _2535 = as_type<float>(_dmw28.z);
            int _2537 = _2471 + 12;
            uint _2539 = uint(int(uint(_2537) >> uint(2)));
            float _2541 = as_type<float>(_dmw28.w);
            int _2543 = _2441 + 262240;
            uint _2545 = uint(int(uint(_2495) >> uint(2)));
            packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2545)];
            float _2547 = as_type<float>(_dmw26.x);
            int _2549 = _2495 + 4;
            uint _2551 = uint(int(uint(_2549) >> uint(2)));
            float _2553 = as_type<float>(_dmw26.y);
            int _2555 = _2495 + 8;
            uint _2557 = uint(int(uint(_2555) >> uint(2)));
            float _2559 = as_type<float>(_dmw26.z);
            int _2561 = _2495 + 12;
            uint _2563 = uint(int(uint(_2561) >> uint(2)));
            float _2565 = as_type<float>(_dmw26.w);
            int _2567 = _2441 + 262256;
            uint _2569 = uint(int(uint(_2519) >> uint(2)));
            packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2569)];
            float _2571 = as_type<float>(_dmw29.x);
            int _2573 = _2519 + 4;
            uint _2575 = uint(int(uint(_2573) >> uint(2)));
            float _2577 = as_type<float>(_dmw29.y);
            int _2579 = _2519 + 8;
            uint _2581 = uint(int(uint(_2579) >> uint(2)));
            float _2583 = as_type<float>(_dmw29.z);
            int _2585 = _2519 + 12;
            uint _2587 = uint(int(uint(_2585) >> uint(2)));
            float _2589 = as_type<float>(_dmw29.w);
            int _2591 = _1555 * 656;
            uint _2593 = uint(int(uint(_2543) >> uint(2)));
            packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2593)];
            float _2595 = as_type<float>(_dmw30.x);
            int _2597 = _2543 + 4;
            uint _2599 = uint(int(uint(_2597) >> uint(2)));
            float _2601 = as_type<float>(_dmw30.y);
            int _2603 = _2543 + 8;
            uint _2605 = uint(int(uint(_2603) >> uint(2)));
            float _2607 = as_type<float>(_dmw30.z);
            int _2609 = _2543 + 12;
            uint _2611 = uint(int(uint(_2609) >> uint(2)));
            float _2613 = as_type<float>(_dmw30.w);
            int _2615 = _1575 * 656;
            int _2617 = _2591 + 262144;
            uint _2619 = uint(int(uint(_2567) >> uint(2)));
            packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2619)];
            float _2621 = as_type<float>(_dmw31.x);
            int _2623 = _2567 + 4;
            uint _2625 = uint(int(uint(_2623) >> uint(2)));
            float _2627 = as_type<float>(_dmw31.y);
            int _2629 = _2567 + 8;
            uint _2631 = uint(int(uint(_2629) >> uint(2)));
            float _2633 = as_type<float>(_dmw31.z);
            int _2635 = _2567 + 12;
            uint _2637 = uint(int(uint(_2635) >> uint(2)));
            float _2639 = as_type<float>(_dmw31.w);
            int _2641 = _2591 + 262192;
            int _2643 = _2591 + 262160;
            uint _2645 = uint(int(uint(_2617) >> uint(2)));
            packed_uint4 _dmw32 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2645)];
            float _2647 = as_type<float>(_dmw32.x);
            int _2649 = _2617 + 4;
            uint _2651 = uint(int(uint(_2649) >> uint(2)));
            float _2653 = as_type<float>(_dmw32.y);
            int _2655 = _2617 + 8;
            uint _2657 = uint(int(uint(_2655) >> uint(2)));
            float _2659 = as_type<float>(_dmw32.z);
            int _2661 = _2617 + 12;
            uint _2663 = uint(int(uint(_2661) >> uint(2)));
            float _2665 = as_type<float>(_dmw32.w);
            int _2667 = _2591 + 262208;
            int _2669 = _2591 + 262176;
            uint _2671 = uint(int(uint(_2641) >> uint(2)));
            packed_uint4 _dmw35 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2671)];
            float _2673 = as_type<float>(_dmw35.x);
            int _2675 = _2641 + 4;
            uint _2677 = uint(int(uint(_2675) >> uint(2)));
            float _2679 = as_type<float>(_dmw35.y);
            int _2681 = _2641 + 8;
            uint _2683 = uint(int(uint(_2681) >> uint(2)));
            float _2685 = as_type<float>(_dmw35.z);
            int _2687 = _2641 + 12;
            uint _2689 = uint(int(uint(_2687) >> uint(2)));
            float _2691 = as_type<float>(_dmw35.w);
            int _2693 = _2591 + 262224;
            int _2695 = _2591 + 262240;
            uint _2697 = uint(int(uint(_2643) >> uint(2)));
            packed_uint4 _dmw33 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2697)];
            float _2699 = as_type<float>(_dmw33.x);
            int _2701 = _2643 + 4;
            uint _2703 = uint(int(uint(_2701) >> uint(2)));
            float _2705 = as_type<float>(_dmw33.y);
            int _2707 = _2643 + 8;
            uint _2709 = uint(int(uint(_2707) >> uint(2)));
            float _2711 = as_type<float>(_dmw33.z);
            int _2713 = _2643 + 12;
            uint _2715 = uint(int(uint(_2713) >> uint(2)));
            float _2717 = as_type<float>(_dmw33.w);
            int _2719 = _2591 + 262256;
            int _2721 = _2615 + 262144;
            uint _2723 = uint(int(uint(_2667) >> uint(2)));
            packed_uint4 _dmw36 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2723)];
            float _2725 = as_type<float>(_dmw36.x);
            int _2727 = _2667 + 4;
            uint _2729 = uint(int(uint(_2727) >> uint(2)));
            float _2731 = as_type<float>(_dmw36.y);
            int _2733 = _2667 + 8;
            uint _2735 = uint(int(uint(_2733) >> uint(2)));
            float _2737 = as_type<float>(_dmw36.z);
            int _2739 = _2667 + 12;
            uint _2741 = uint(int(uint(_2739) >> uint(2)));
            float _2743 = as_type<float>(_dmw36.w);
            int _2745 = _2615 + 262192;
            int _2747 = _2615 + 262160;
            uint _2749 = uint(int(uint(_2669) >> uint(2)));
            packed_uint4 _dmw34 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2749)];
            float _2751 = as_type<float>(_dmw34.x);
            int _2753 = _2669 + 4;
            uint _2755 = uint(int(uint(_2753) >> uint(2)));
            float _2757 = as_type<float>(_dmw34.y);
            int _2759 = _2669 + 8;
            uint _2761 = uint(int(uint(_2759) >> uint(2)));
            float _2763 = as_type<float>(_dmw34.z);
            int _2765 = _2669 + 12;
            uint _2767 = uint(int(uint(_2765) >> uint(2)));
            float _2769 = as_type<float>(_dmw34.w);
            int _2771 = _2615 + 262208;
            int _2773 = _2615 + 262176;
            uint _2775 = uint(int(uint(_2693) >> uint(2)));
            packed_uint4 _dmw37 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
            float _2777 = as_type<float>(_dmw37.x);
            int _2779 = _2693 + 4;
            uint _2781 = uint(int(uint(_2779) >> uint(2)));
            float _2783 = as_type<float>(_dmw37.y);
            int _2785 = _2693 + 8;
            uint _2787 = uint(int(uint(_2785) >> uint(2)));
            float _2789 = as_type<float>(_dmw37.z);
            int _2791 = _2693 + 12;
            uint _2793 = uint(int(uint(_2791) >> uint(2)));
            float _2795 = as_type<float>(_dmw37.w);
            int _2797 = _2615 + 262224;
            int _2799 = _2615 + 262240;
            uint _2801 = uint(int(uint(_2695) >> uint(2)));
            packed_uint4 _dmw38 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2801)];
            float _2803 = as_type<float>(_dmw38.x);
            int _2805 = _2695 + 4;
            uint _2807 = uint(int(uint(_2805) >> uint(2)));
            float _2809 = as_type<float>(_dmw38.y);
            int _2811 = _2695 + 8;
            uint _2813 = uint(int(uint(_2811) >> uint(2)));
            float _2815 = as_type<float>(_dmw38.z);
            int _2817 = _2695 + 12;
            uint _2819 = uint(int(uint(_2817) >> uint(2)));
            float _2821 = as_type<float>(_dmw38.w);
            int _2823 = _2615 + 262256;
            uint _2825 = uint(int(uint(_2719) >> uint(2)));
            packed_uint4 _dmw39 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2825)];
            float _2827 = as_type<float>(_dmw39.x);
            int _2829 = _2719 + 4;
            uint _2831 = uint(int(uint(_2829) >> uint(2)));
            float _2833 = as_type<float>(_dmw39.y);
            int _2835 = _2719 + 8;
            uint _2837 = uint(int(uint(_2835) >> uint(2)));
            float _2839 = as_type<float>(_dmw39.z);
            int _2841 = _2719 + 12;
            uint _2843 = uint(int(uint(_2841) >> uint(2)));
            float _2845 = as_type<float>(_dmw39.w);
            uint _2847 = uint(int(uint(_2721) >> uint(2)));
            packed_uint4 _dmw40 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2847)];
            float _2849 = as_type<float>(_dmw40.x);
            int _2851 = _2721 + 4;
            uint _2853 = uint(int(uint(_2851) >> uint(2)));
            float _2855 = as_type<float>(_dmw40.y);
            int _2857 = _2721 + 8;
            uint _2859 = uint(int(uint(_2857) >> uint(2)));
            float _2861 = as_type<float>(_dmw40.z);
            int _2863 = _2721 + 12;
            uint _2865 = uint(int(uint(_2863) >> uint(2)));
            float _2867 = as_type<float>(_dmw40.w);
            uint _2869 = uint(int(uint(_2745) >> uint(2)));
            packed_uint4 _dmw43 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2869)];
            float _2871 = as_type<float>(_dmw43.x);
            int _2873 = _2745 + 4;
            uint _2875 = uint(int(uint(_2873) >> uint(2)));
            float _2877 = as_type<float>(_dmw43.y);
            int _2879 = _2745 + 8;
            uint _2881 = uint(int(uint(_2879) >> uint(2)));
            float _2883 = as_type<float>(_dmw43.z);
            int _2885 = _2745 + 12;
            uint _2887 = uint(int(uint(_2885) >> uint(2)));
            float _2889 = as_type<float>(_dmw43.w);
            uint _2891 = uint(int(uint(_2747) >> uint(2)));
            packed_uint4 _dmw41 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2891)];
            float _2893 = as_type<float>(_dmw41.x);
            int _2895 = _2747 + 4;
            uint _2897 = uint(int(uint(_2895) >> uint(2)));
            float _2899 = as_type<float>(_dmw41.y);
            int _2901 = _2747 + 8;
            uint _2903 = uint(int(uint(_2901) >> uint(2)));
            float _2905 = as_type<float>(_dmw41.z);
            int _2907 = _2747 + 12;
            uint _2909 = uint(int(uint(_2907) >> uint(2)));
            float _2911 = as_type<float>(_dmw41.w);
            uint _2913 = uint(int(uint(_2771) >> uint(2)));
            packed_uint4 _dmw44 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2913)];
            float _2915 = as_type<float>(_dmw44.x);
            int _2917 = _2771 + 4;
            uint _2919 = uint(int(uint(_2917) >> uint(2)));
            float _2921 = as_type<float>(_dmw44.y);
            int _2923 = _2771 + 8;
            uint _2925 = uint(int(uint(_2923) >> uint(2)));
            float _2927 = as_type<float>(_dmw44.z);
            int _2929 = _2771 + 12;
            uint _2931 = uint(int(uint(_2929) >> uint(2)));
            float _2933 = as_type<float>(_dmw44.w);
            uint _2935 = uint(int(uint(_2773) >> uint(2)));
            packed_uint4 _dmw42 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2935)];
            float _2937 = as_type<float>(_dmw42.x);
            int _2939 = _2773 + 4;
            uint _2941 = uint(int(uint(_2939) >> uint(2)));
            float _2943 = as_type<float>(_dmw42.y);
            int _2945 = _2773 + 8;
            uint _2947 = uint(int(uint(_2945) >> uint(2)));
            float _2949 = as_type<float>(_dmw42.z);
            int _2951 = _2773 + 12;
            uint _2953 = uint(int(uint(_2951) >> uint(2)));
            float _2955 = as_type<float>(_dmw42.w);
            uint _2957 = uint(int(uint(_2797) >> uint(2)));
            packed_uint4 _dmw45 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2957)];
            float _2959 = as_type<float>(_dmw45.x);
            int _2961 = _2797 + 4;
            uint _2963 = uint(int(uint(_2961) >> uint(2)));
            float _2965 = as_type<float>(_dmw45.y);
            int _2967 = _2797 + 8;
            uint _2969 = uint(int(uint(_2967) >> uint(2)));
            float _2971 = as_type<float>(_dmw45.z);
            int _2973 = _2797 + 12;
            uint _2975 = uint(int(uint(_2973) >> uint(2)));
            float _2977 = as_type<float>(_dmw45.w);
            uint _2979 = uint(int(uint(_2799) >> uint(2)));
            packed_uint4 _dmw46 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2979)];
            float _2981 = as_type<float>(_dmw46.x);
            int _2983 = _2799 + 4;
            uint _2985 = uint(int(uint(_2983) >> uint(2)));
            float _2987 = as_type<float>(_dmw46.y);
            int _2989 = _2799 + 8;
            uint _2991 = uint(int(uint(_2989) >> uint(2)));
            float _2993 = as_type<float>(_dmw46.z);
            int _2995 = _2799 + 12;
            uint _2997 = uint(int(uint(_2995) >> uint(2)));
            float _2999 = as_type<float>(_dmw46.w);
            uint _3001 = uint(int(uint(_2823) >> uint(2)));
            packed_uint4 _dmw47 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3001)];
            float _3003 = as_type<float>(_dmw47.x);
            int _3005 = _2823 + 4;
            uint _3007 = uint(int(uint(_3005) >> uint(2)));
            float _3009 = as_type<float>(_dmw47.y);
            int _3011 = _2823 + 8;
            uint _3013 = uint(int(uint(_3011) >> uint(2)));
            float _3015 = as_type<float>(_dmw47.z);
            int _3017 = _2823 + 12;
            uint _3019 = uint(int(uint(_3017) >> uint(2)));
            float _3021 = as_type<float>(_dmw47.w);
            float _3023 = _1501 + (-1.0);
            float _3025 = _1479 + (-1.0);
            float _3027 = _1479 + _3023;
            float _3029 = -_3023;
            float _3031 = _2451 * _3029;
            float _3033 = -_3023;
            float _3035 = _2457 * _3033;
            float _3037 = -_3023;
            float _3039 = _2463 * _3037;
            float _3041 = -_3023;
            float _3043 = _2469 * _3041;
            float _3045 = -_3023;
            float _3047 = _2475 * _3045;
            float _3049 = -_3023;
            float _3051 = _2481 * _3049;
            float _3053 = -_3023;
            float _3055 = _2487 * _3053;
            float _3057 = -_3023;
            float _3059 = _2493 * _3057;
            float _3061 = -_3023;
            float _3063 = _2499 * _3061;
            float _3065 = -_3023;
            float _3067 = _2505 * _3065;
            float _3069 = -_3023;
            float _3071 = _2511 * _3069;
            float _3073 = -_3023;
            float _3075 = _2517 * _3073;
            float _3077 = -_3023;
            float _3079 = _2523 * _3077;
            float _3081 = -_3023;
            float _3083 = _2529 * _3081;
            float _3085 = -_3023;
            float _3087 = _2535 * _3085;
            float _3089 = -_3023;
            float _3091 = _2541 * _3089;
            float _3093 = -_3023;
            float _3095 = _2547 * _3093;
            float _3097 = -_3023;
            float _3099 = _2553 * _3097;
            float _3101 = -_3023;
            float _3103 = _2559 * _3101;
            float _3105 = -_3023;
            float _3107 = _2565 * _3105;
            float _3109 = -_3023;
            float _3111 = _2571 * _3109;
            float _3113 = -_3023;
            float _3115 = _2577 * _3113;
            float _3117 = -_3023;
            float _3119 = _2583 * _3117;
            float _3121 = -_3023;
            float _3123 = _2589 * _3121;
            float _3125 = -_3023;
            float _3127 = _2595 * _3125;
            float _3129 = -_3023;
            float _3131 = _2601 * _3129;
            float _3133 = -_3023;
            float _3135 = _2607 * _3133;
            float _3137 = -_3023;
            float _3139 = _2613 * _3137;
            float _3141 = -_3023;
            float _3143 = _2621 * _3141;
            float _3145 = -_3023;
            float _3147 = _2627 * _3145;
            float _3149 = -_3023;
            float _3151 = _2633 * _3149;
            float _3153 = -_3023;
            float _3155 = _2639 * _3153;
            float _3157 = -_3025;
            float _3159 = fma(_3157, _2647, _3031);
            float _3161 = -_3025;
            float _3163 = fma(_3161, _2653, _3035);
            float _3165 = -_3025;
            float _3167 = fma(_3165, _2659, _3039);
            float _3169 = -_3025;
            float _3171 = fma(_3169, _2665, _3043);
            float _3173 = -_3025;
            float _3175 = fma(_3173, _2673, _3047);
            float _3177 = -_3025;
            float _3179 = fma(_3177, _2679, _3051);
            float _3181 = -_3025;
            float _3183 = fma(_3181, _2685, _3055);
            float _3185 = -_3025;
            float _3187 = fma(_3185, _2691, _3059);
            float _3189 = -_3025;
            float _3191 = fma(_3189, _2699, _3063);
            float _3193 = -_3025;
            float _3195 = fma(_3193, _2705, _3067);
            float _3197 = -_3025;
            float _3199 = fma(_3197, _2711, _3071);
            float _3201 = -_3025;
            float _3203 = fma(_3201, _2717, _3075);
            float _3205 = -_3025;
            float _3207 = fma(_3205, _2725, _3079);
            float _3209 = -_3025;
            float _3211 = fma(_3209, _2731, _3083);
            float _3213 = -_3025;
            float _3215 = fma(_3213, _2737, _3087);
            float _3217 = -_3025;
            float _3219 = fma(_3217, _2743, _3091);
            float _3221 = -_3025;
            float _3223 = fma(_3221, _2751, _3095);
            float _3225 = -_3025;
            float _3227 = fma(_3225, _2757, _3099);
            float _3229 = -_3025;
            float _3231 = fma(_3229, _2763, _3103);
            float _3233 = -_3025;
            float _3235 = fma(_3233, _2769, _3107);
            float _3237 = -_3025;
            float _3239 = fma(_3237, _2777, _3111);
            float _3241 = -_3025;
            float _3243 = fma(_3241, _2783, _3115);
            float _3245 = -_3025;
            float _3247 = fma(_3245, _2789, _3119);
            float _3249 = -_3025;
            float _3251 = fma(_3249, _2795, _3123);
            float _3253 = -_3025;
            float _3255 = fma(_3253, _2803, _3127);
            float _3257 = -_3025;
            float _3259 = fma(_3257, _2809, _3131);
            float _3261 = -_3025;
            float _3263 = fma(_3261, _2815, _3135);
            float _3265 = -_3025;
            float _3267 = fma(_3265, _2821, _3139);
            float _3269 = -_3025;
            float _3271 = fma(_3269, _2827, _3143);
            float _3273 = -_3025;
            float _3275 = fma(_3273, _2833, _3147);
            float _3277 = -_3025;
            float _3279 = fma(_3277, _2839, _3151);
            float _3281 = -_3025;
            float _3283 = fma(_3281, _2845, _3155);
            float _3285 = fma(_3027, _2849, _3159);
            float _3287 = fma(_3027, _2855, _3163);
            float _3289 = fma(_3027, _2861, _3167);
            float _3291 = fma(_3027, _2867, _3171);
            float _3293 = fma(_3027, _2871, _3175);
            float _3295 = fma(_3027, _2877, _3179);
            float _3297 = fma(_3027, _2883, _3183);
            float _3299 = fma(_3027, _2889, _3187);
            float _3301 = fma(_3027, _2893, _3191);
            float _3303 = fma(_3027, _2899, _3195);
            float _3305 = fma(_3027, _2905, _3199);
            float _3307 = fma(_3027, _2911, _3203);
            float _3309 = fma(_3027, _2915, _3207);
            float _3311 = fma(_3027, _2921, _3211);
            float _3313 = fma(_3027, _2927, _3215);
            float _3315 = fma(_3027, _2933, _3219);
            float _3317 = fma(_3027, _2937, _3223);
            float _3319 = fma(_3027, _2943, _3227);
            float _3321 = fma(_3027, _2949, _3231);
            float _3323 = fma(_3027, _2955, _3235);
            float _3325 = fma(_3027, _2959, _3239);
            float _3327 = fma(_3027, _2965, _3243);
            float _3329 = fma(_3027, _2971, _3247);
            float _3331 = fma(_3027, _2977, _3251);
            float _3333 = fma(_3027, _2981, _3255);
            float _3335 = fma(_3027, _2987, _3259);
            float _3337 = fma(_3027, _2993, _3263);
            float _3339 = fma(_3027, _2999, _3267);
            float _3341 = fma(_3027, _3003, _3271);
            float _3343 = fma(_3027, _3009, _3275);
            float _3345 = fma(_3027, _3015, _3279);
            float _3347 = fma(_3027, _3021, _3283);
            _2375 = _3299;
            _2377 = _3295;
            _2379 = _3327;
            _2381 = _3309;
            _2383 = _3293;
            _2385 = _3313;
            _2387 = _3329;
            _2389 = _3311;
            _2391 = _3315;
            _2393 = _3331;
            _2395 = _3297;
            _2397 = _3325;
            _2399 = _3343;
            _2401 = _3291;
            _2403 = _3341;
            _2405 = _3301;
            _2407 = _3303;
            _2409 = _3335;
            _2411 = _3285;
            _2413 = _3287;
            _2415 = _3289;
            _2417 = _3333;
            _2419 = _3345;
            _2421 = _3307;
            _2423 = _3317;
            _2425 = _3337;
            _2427 = _3347;
            _2429 = _3321;
            _2431 = _3323;
            _2433 = _3339;
            _2435 = _3305;
            _2437 = _3319;
            _2439 = true;
        }
    }
    else
    {
        float _3349 = _1479 * (-0.707106769084930419921875);
        float _3351 = _1501 + (-1.0);
        float _3353 = _1479 + (-1.0);
        float _3355 = fma(_1501, 0.707106769084930419921875, _3349);
        bool _3357 = _3355 >= 0.0;
        bool _3359 = !_3357;
        if (!_3359)
        {
            int _3361 = _1555 * 656;
            int _3363 = _3361 + 262144;
            int _3365 = _3361 + 262192;
            int _3367 = _3361 + 262160;
            uint _3369 = uint(int(uint(_3363) >> uint(2)));
            packed_uint4 _dmw48 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3369)];
            float _3371 = as_type<float>(_dmw48.x);
            int _3373 = _3363 + 4;
            uint _3375 = uint(int(uint(_3373) >> uint(2)));
            float _3377 = as_type<float>(_dmw48.y);
            int _3379 = _3363 + 8;
            uint _3381 = uint(int(uint(_3379) >> uint(2)));
            float _3383 = as_type<float>(_dmw48.z);
            int _3385 = _3363 + 12;
            uint _3387 = uint(int(uint(_3385) >> uint(2)));
            float _3389 = as_type<float>(_dmw48.w);
            int _3391 = _3361 + 262208;
            uint _3393 = uint(int(uint(_3365) >> uint(2)));
            packed_uint4 _dmw51 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3393)];
            float _3395 = as_type<float>(_dmw51.x);
            int _3397 = _3365 + 4;
            uint _3399 = uint(int(uint(_3397) >> uint(2)));
            float _3401 = as_type<float>(_dmw51.y);
            int _3403 = _3365 + 8;
            uint _3405 = uint(int(uint(_3403) >> uint(2)));
            float _3407 = as_type<float>(_dmw51.z);
            int _3409 = _3365 + 12;
            uint _3411 = uint(int(uint(_3409) >> uint(2)));
            float _3413 = as_type<float>(_dmw51.w);
            int _3415 = _3361 + 262176;
            uint _3417 = uint(int(uint(_3367) >> uint(2)));
            packed_uint4 _dmw49 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3417)];
            float _3419 = as_type<float>(_dmw49.x);
            int _3421 = _3367 + 4;
            uint _3423 = uint(int(uint(_3421) >> uint(2)));
            float _3425 = as_type<float>(_dmw49.y);
            int _3427 = _3367 + 8;
            uint _3429 = uint(int(uint(_3427) >> uint(2)));
            float _3431 = as_type<float>(_dmw49.z);
            int _3433 = _3367 + 12;
            uint _3435 = uint(int(uint(_3433) >> uint(2)));
            float _3437 = as_type<float>(_dmw49.w);
            int _3439 = _3361 + 262224;
            uint _3441 = uint(int(uint(_3391) >> uint(2)));
            packed_uint4 _dmw52 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3441)];
            float _3443 = as_type<float>(_dmw52.x);
            int _3445 = _3391 + 4;
            uint _3447 = uint(int(uint(_3445) >> uint(2)));
            float _3449 = as_type<float>(_dmw52.y);
            int _3451 = _3391 + 8;
            uint _3453 = uint(int(uint(_3451) >> uint(2)));
            float _3455 = as_type<float>(_dmw52.z);
            int _3457 = _3391 + 12;
            uint _3459 = uint(int(uint(_3457) >> uint(2)));
            float _3461 = as_type<float>(_dmw52.w);
            int _3463 = _3361 + 262240;
            uint _3465 = uint(int(uint(_3415) >> uint(2)));
            packed_uint4 _dmw50 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3465)];
            float _3467 = as_type<float>(_dmw50.x);
            int _3469 = _3415 + 4;
            uint _3471 = uint(int(uint(_3469) >> uint(2)));
            float _3473 = as_type<float>(_dmw50.y);
            int _3475 = _3415 + 8;
            uint _3477 = uint(int(uint(_3475) >> uint(2)));
            float _3479 = as_type<float>(_dmw50.z);
            int _3481 = _3415 + 12;
            uint _3483 = uint(int(uint(_3481) >> uint(2)));
            float _3485 = as_type<float>(_dmw50.w);
            int _3487 = _3361 + 262256;
            uint _3489 = uint(int(uint(_3439) >> uint(2)));
            packed_uint4 _dmw53 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3489)];
            float _3491 = as_type<float>(_dmw53.x);
            int _3493 = _3439 + 4;
            uint _3495 = uint(int(uint(_3493) >> uint(2)));
            float _3497 = as_type<float>(_dmw53.y);
            int _3499 = _3439 + 8;
            uint _3501 = uint(int(uint(_3499) >> uint(2)));
            float _3503 = as_type<float>(_dmw53.z);
            int _3505 = _3439 + 12;
            uint _3507 = uint(int(uint(_3505) >> uint(2)));
            float _3509 = as_type<float>(_dmw53.w);
            int _3511 = _1503 * 656;
            uint _3513 = uint(int(uint(_3463) >> uint(2)));
            packed_uint4 _dmw54 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3513)];
            float _3515 = as_type<float>(_dmw54.x);
            int _3517 = _3463 + 4;
            uint _3519 = uint(int(uint(_3517) >> uint(2)));
            float _3521 = as_type<float>(_dmw54.y);
            int _3523 = _3463 + 8;
            uint _3525 = uint(int(uint(_3523) >> uint(2)));
            float _3527 = as_type<float>(_dmw54.z);
            int _3529 = _3463 + 12;
            uint _3531 = uint(int(uint(_3529) >> uint(2)));
            float _3533 = as_type<float>(_dmw54.w);
            int _3535 = _1575 * 656;
            int _3537 = _3511 + 262144;
            uint _3539 = uint(int(uint(_3487) >> uint(2)));
            packed_uint4 _dmw55 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3539)];
            float _3541 = as_type<float>(_dmw55.x);
            int _3543 = _3487 + 4;
            uint _3545 = uint(int(uint(_3543) >> uint(2)));
            float _3547 = as_type<float>(_dmw55.y);
            int _3549 = _3487 + 8;
            uint _3551 = uint(int(uint(_3549) >> uint(2)));
            float _3553 = as_type<float>(_dmw55.z);
            int _3555 = _3487 + 12;
            uint _3557 = uint(int(uint(_3555) >> uint(2)));
            float _3559 = as_type<float>(_dmw55.w);
            int _3561 = _3511 + 262192;
            int _3563 = _3511 + 262160;
            uint _3565 = uint(int(uint(_3537) >> uint(2)));
            packed_uint4 _dmw56 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3565)];
            float _3567 = as_type<float>(_dmw56.x);
            int _3569 = _3537 + 4;
            uint _3571 = uint(int(uint(_3569) >> uint(2)));
            float _3573 = as_type<float>(_dmw56.y);
            int _3575 = _3537 + 8;
            uint _3577 = uint(int(uint(_3575) >> uint(2)));
            float _3579 = as_type<float>(_dmw56.z);
            int _3581 = _3537 + 12;
            uint _3583 = uint(int(uint(_3581) >> uint(2)));
            float _3585 = as_type<float>(_dmw56.w);
            int _3587 = _3511 + 262208;
            int _3589 = _3511 + 262176;
            uint _3591 = uint(int(uint(_3561) >> uint(2)));
            packed_uint4 _dmw59 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3591)];
            float _3593 = as_type<float>(_dmw59.x);
            int _3595 = _3561 + 4;
            uint _3597 = uint(int(uint(_3595) >> uint(2)));
            float _3599 = as_type<float>(_dmw59.y);
            int _3601 = _3561 + 8;
            uint _3603 = uint(int(uint(_3601) >> uint(2)));
            float _3605 = as_type<float>(_dmw59.z);
            int _3607 = _3561 + 12;
            uint _3609 = uint(int(uint(_3607) >> uint(2)));
            float _3611 = as_type<float>(_dmw59.w);
            int _3613 = _3511 + 262224;
            int _3615 = _3511 + 262240;
            uint _3617 = uint(int(uint(_3563) >> uint(2)));
            packed_uint4 _dmw57 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3617)];
            float _3619 = as_type<float>(_dmw57.x);
            int _3621 = _3563 + 4;
            uint _3623 = uint(int(uint(_3621) >> uint(2)));
            float _3625 = as_type<float>(_dmw57.y);
            int _3627 = _3563 + 8;
            uint _3629 = uint(int(uint(_3627) >> uint(2)));
            float _3631 = as_type<float>(_dmw57.z);
            int _3633 = _3563 + 12;
            uint _3635 = uint(int(uint(_3633) >> uint(2)));
            float _3637 = as_type<float>(_dmw57.w);
            int _3639 = _3511 + 262256;
            int _3641 = _3535 + 262144;
            uint _3643 = uint(int(uint(_3587) >> uint(2)));
            packed_uint4 _dmw60 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3643)];
            float _3645 = as_type<float>(_dmw60.x);
            int _3647 = _3587 + 4;
            uint _3649 = uint(int(uint(_3647) >> uint(2)));
            float _3651 = as_type<float>(_dmw60.y);
            int _3653 = _3587 + 8;
            uint _3655 = uint(int(uint(_3653) >> uint(2)));
            float _3657 = as_type<float>(_dmw60.z);
            int _3659 = _3587 + 12;
            uint _3661 = uint(int(uint(_3659) >> uint(2)));
            float _3663 = as_type<float>(_dmw60.w);
            int _3665 = _3535 + 262192;
            int _3667 = _3535 + 262160;
            uint _3669 = uint(int(uint(_3589) >> uint(2)));
            packed_uint4 _dmw58 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3669)];
            float _3671 = as_type<float>(_dmw58.x);
            int _3673 = _3589 + 4;
            uint _3675 = uint(int(uint(_3673) >> uint(2)));
            float _3677 = as_type<float>(_dmw58.y);
            int _3679 = _3589 + 8;
            uint _3681 = uint(int(uint(_3679) >> uint(2)));
            float _3683 = as_type<float>(_dmw58.z);
            int _3685 = _3589 + 12;
            uint _3687 = uint(int(uint(_3685) >> uint(2)));
            float _3689 = as_type<float>(_dmw58.w);
            int _3691 = _3535 + 262208;
            int _3693 = _3535 + 262176;
            uint _3695 = uint(int(uint(_3613) >> uint(2)));
            packed_uint4 _dmw61 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3695)];
            float _3697 = as_type<float>(_dmw61.x);
            int _3699 = _3613 + 4;
            uint _3701 = uint(int(uint(_3699) >> uint(2)));
            float _3703 = as_type<float>(_dmw61.y);
            int _3705 = _3613 + 8;
            uint _3707 = uint(int(uint(_3705) >> uint(2)));
            float _3709 = as_type<float>(_dmw61.z);
            int _3711 = _3613 + 12;
            uint _3713 = uint(int(uint(_3711) >> uint(2)));
            float _3715 = as_type<float>(_dmw61.w);
            int _3717 = _3535 + 262224;
            int _3719 = _3535 + 262240;
            uint _3721 = uint(int(uint(_3615) >> uint(2)));
            packed_uint4 _dmw62 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3721)];
            float _3723 = as_type<float>(_dmw62.x);
            int _3725 = _3615 + 4;
            uint _3727 = uint(int(uint(_3725) >> uint(2)));
            float _3729 = as_type<float>(_dmw62.y);
            int _3731 = _3615 + 8;
            uint _3733 = uint(int(uint(_3731) >> uint(2)));
            float _3735 = as_type<float>(_dmw62.z);
            int _3737 = _3615 + 12;
            uint _3739 = uint(int(uint(_3737) >> uint(2)));
            float _3741 = as_type<float>(_dmw62.w);
            int _3743 = _3535 + 262256;
            uint _3745 = uint(int(uint(_3639) >> uint(2)));
            packed_uint4 _dmw63 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3745)];
            float _3747 = as_type<float>(_dmw63.x);
            int _3749 = _3639 + 4;
            uint _3751 = uint(int(uint(_3749) >> uint(2)));
            float _3753 = as_type<float>(_dmw63.y);
            int _3755 = _3639 + 8;
            uint _3757 = uint(int(uint(_3755) >> uint(2)));
            float _3759 = as_type<float>(_dmw63.z);
            int _3761 = _3639 + 12;
            uint _3763 = uint(int(uint(_3761) >> uint(2)));
            float _3765 = as_type<float>(_dmw63.w);
            uint _3767 = uint(int(uint(_3641) >> uint(2)));
            packed_uint4 _dmw64 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3767)];
            float _3769 = as_type<float>(_dmw64.x);
            int _3771 = _3641 + 4;
            uint _3773 = uint(int(uint(_3771) >> uint(2)));
            float _3775 = as_type<float>(_dmw64.y);
            int _3777 = _3641 + 8;
            uint _3779 = uint(int(uint(_3777) >> uint(2)));
            float _3781 = as_type<float>(_dmw64.z);
            int _3783 = _3641 + 12;
            uint _3785 = uint(int(uint(_3783) >> uint(2)));
            float _3787 = as_type<float>(_dmw64.w);
            uint _3789 = uint(int(uint(_3665) >> uint(2)));
            packed_uint4 _dmw67 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3789)];
            float _3791 = as_type<float>(_dmw67.x);
            int _3793 = _3665 + 4;
            uint _3795 = uint(int(uint(_3793) >> uint(2)));
            float _3797 = as_type<float>(_dmw67.y);
            int _3799 = _3665 + 8;
            uint _3801 = uint(int(uint(_3799) >> uint(2)));
            float _3803 = as_type<float>(_dmw67.z);
            int _3805 = _3665 + 12;
            uint _3807 = uint(int(uint(_3805) >> uint(2)));
            float _3809 = as_type<float>(_dmw67.w);
            uint _3811 = uint(int(uint(_3667) >> uint(2)));
            packed_uint4 _dmw65 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3811)];
            float _3813 = as_type<float>(_dmw65.x);
            int _3815 = _3667 + 4;
            uint _3817 = uint(int(uint(_3815) >> uint(2)));
            float _3819 = as_type<float>(_dmw65.y);
            int _3821 = _3667 + 8;
            uint _3823 = uint(int(uint(_3821) >> uint(2)));
            float _3825 = as_type<float>(_dmw65.z);
            int _3827 = _3667 + 12;
            uint _3829 = uint(int(uint(_3827) >> uint(2)));
            float _3831 = as_type<float>(_dmw65.w);
            uint _3833 = uint(int(uint(_3691) >> uint(2)));
            packed_uint4 _dmw68 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3833)];
            float _3835 = as_type<float>(_dmw68.x);
            int _3837 = _3691 + 4;
            uint _3839 = uint(int(uint(_3837) >> uint(2)));
            float _3841 = as_type<float>(_dmw68.y);
            int _3843 = _3691 + 8;
            uint _3845 = uint(int(uint(_3843) >> uint(2)));
            float _3847 = as_type<float>(_dmw68.z);
            int _3849 = _3691 + 12;
            uint _3851 = uint(int(uint(_3849) >> uint(2)));
            float _3853 = as_type<float>(_dmw68.w);
            uint _3855 = uint(int(uint(_3693) >> uint(2)));
            packed_uint4 _dmw66 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3855)];
            float _3857 = as_type<float>(_dmw66.x);
            int _3859 = _3693 + 4;
            uint _3861 = uint(int(uint(_3859) >> uint(2)));
            float _3863 = as_type<float>(_dmw66.y);
            int _3865 = _3693 + 8;
            uint _3867 = uint(int(uint(_3865) >> uint(2)));
            float _3869 = as_type<float>(_dmw66.z);
            int _3871 = _3693 + 12;
            uint _3873 = uint(int(uint(_3871) >> uint(2)));
            float _3875 = as_type<float>(_dmw66.w);
            uint _3877 = uint(int(uint(_3717) >> uint(2)));
            packed_uint4 _dmw69 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3877)];
            float _3879 = as_type<float>(_dmw69.x);
            int _3881 = _3717 + 4;
            uint _3883 = uint(int(uint(_3881) >> uint(2)));
            float _3885 = as_type<float>(_dmw69.y);
            int _3887 = _3717 + 8;
            uint _3889 = uint(int(uint(_3887) >> uint(2)));
            float _3891 = as_type<float>(_dmw69.z);
            int _3893 = _3717 + 12;
            uint _3895 = uint(int(uint(_3893) >> uint(2)));
            float _3897 = as_type<float>(_dmw69.w);
            uint _3899 = uint(int(uint(_3719) >> uint(2)));
            packed_uint4 _dmw70 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3899)];
            float _3901 = as_type<float>(_dmw70.x);
            int _3903 = _3719 + 4;
            uint _3905 = uint(int(uint(_3903) >> uint(2)));
            float _3907 = as_type<float>(_dmw70.y);
            int _3909 = _3719 + 8;
            uint _3911 = uint(int(uint(_3909) >> uint(2)));
            float _3913 = as_type<float>(_dmw70.z);
            int _3915 = _3719 + 12;
            uint _3917 = uint(int(uint(_3915) >> uint(2)));
            float _3919 = as_type<float>(_dmw70.w);
            uint _3921 = uint(int(uint(_3743) >> uint(2)));
            packed_uint4 _dmw71 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3921)];
            float _3923 = as_type<float>(_dmw71.x);
            int _3925 = _3743 + 4;
            uint _3927 = uint(int(uint(_3925) >> uint(2)));
            float _3929 = as_type<float>(_dmw71.y);
            int _3931 = _3743 + 8;
            uint _3933 = uint(int(uint(_3931) >> uint(2)));
            float _3935 = as_type<float>(_dmw71.z);
            int _3937 = _3743 + 12;
            uint _3939 = uint(int(uint(_3937) >> uint(2)));
            float _3941 = as_type<float>(_dmw71.w);
            float _3943 = -_3353;
            float _3945 = _3351 + _3943;
            float _3947 = -_3945;
            float _3949 = _1501 + _3947;
            float _3951 = _3371 * _3945;
            float _3953 = _3377 * _3945;
            float _3955 = _3383 * _3945;
            float _3957 = _3389 * _3945;
            float _3959 = _3395 * _3945;
            float _3961 = _3401 * _3945;
            float _3963 = _3407 * _3945;
            float _3965 = _3413 * _3945;
            float _3967 = _3419 * _3945;
            float _3969 = _3425 * _3945;
            float _3971 = _3431 * _3945;
            float _3973 = _3437 * _3945;
            float _3975 = _3443 * _3945;
            float _3977 = _3449 * _3945;
            float _3979 = _3455 * _3945;
            float _3981 = _3461 * _3945;
            float _3983 = _3467 * _3945;
            float _3985 = _3473 * _3945;
            float _3987 = _3479 * _3945;
            float _3989 = _3485 * _3945;
            float _3991 = _3491 * _3945;
            float _3993 = _3497 * _3945;
            float _3995 = _3503 * _3945;
            float _3997 = _3509 * _3945;
            float _3999 = _3515 * _3945;
            float _4001 = _3521 * _3945;
            float _4003 = _3527 * _3945;
            float _4005 = _3533 * _3945;
            float _4007 = _3541 * _3945;
            float _4009 = _3547 * _3945;
            float _4011 = _3553 * _3945;
            float _4013 = _3559 * _3945;
            float _4015 = -_3351;
            float _4017 = fma(_3567, _4015, _3951);
            float _4019 = -_3351;
            float _4021 = fma(_3573, _4019, _3953);
            float _4023 = -_3351;
            float _4025 = fma(_3579, _4023, _3955);
            float _4027 = -_3351;
            float _4029 = fma(_3585, _4027, _3957);
            float _4031 = -_3351;
            float _4033 = fma(_3593, _4031, _3959);
            float _4035 = -_3351;
            float _4037 = fma(_3599, _4035, _3961);
            float _4039 = -_3351;
            float _4041 = fma(_3605, _4039, _3963);
            float _4043 = -_3351;
            float _4045 = fma(_3611, _4043, _3965);
            float _4047 = -_3351;
            float _4049 = fma(_3619, _4047, _3967);
            float _4051 = -_3351;
            float _4053 = fma(_3625, _4051, _3969);
            float _4055 = -_3351;
            float _4057 = fma(_3631, _4055, _3971);
            float _4059 = -_3351;
            float _4061 = fma(_3637, _4059, _3973);
            float _4063 = -_3351;
            float _4065 = fma(_3645, _4063, _3975);
            float _4067 = -_3351;
            float _4069 = fma(_3651, _4067, _3977);
            float _4071 = -_3351;
            float _4073 = fma(_3657, _4071, _3979);
            float _4075 = -_3351;
            float _4077 = fma(_3663, _4075, _3981);
            float _4079 = -_3351;
            float _4081 = fma(_3671, _4079, _3983);
            float _4083 = -_3351;
            float _4085 = fma(_3677, _4083, _3985);
            float _4087 = -_3351;
            float _4089 = fma(_3683, _4087, _3987);
            float _4091 = -_3351;
            float _4093 = fma(_3689, _4091, _3989);
            float _4095 = -_3351;
            float _4097 = fma(_3697, _4095, _3991);
            float _4099 = -_3351;
            float _4101 = fma(_3703, _4099, _3993);
            float _4103 = -_3351;
            float _4105 = fma(_3709, _4103, _3995);
            float _4107 = -_3351;
            float _4109 = fma(_3715, _4107, _3997);
            float _4111 = -_3351;
            float _4113 = fma(_3723, _4111, _3999);
            float _4115 = -_3351;
            float _4117 = fma(_3729, _4115, _4001);
            float _4119 = -_3351;
            float _4121 = fma(_3735, _4119, _4003);
            float _4123 = -_3351;
            float _4125 = fma(_3741, _4123, _4005);
            float _4127 = -_3351;
            float _4129 = fma(_3747, _4127, _4007);
            float _4131 = -_3351;
            float _4133 = fma(_3753, _4131, _4009);
            float _4135 = -_3351;
            float _4137 = fma(_3759, _4135, _4011);
            float _4139 = -_3351;
            float _4141 = fma(_3765, _4139, _4013);
            float _4143 = fma(_3769, _3949, _4017);
            float _4145 = fma(_3775, _3949, _4021);
            float _4147 = fma(_3781, _3949, _4025);
            float _4149 = fma(_3787, _3949, _4029);
            float _4151 = fma(_3791, _3949, _4033);
            float _4153 = fma(_3797, _3949, _4037);
            float _4155 = fma(_3803, _3949, _4041);
            float _4157 = fma(_3809, _3949, _4045);
            float _4159 = fma(_3813, _3949, _4049);
            float _4161 = fma(_3819, _3949, _4053);
            float _4163 = fma(_3825, _3949, _4057);
            float _4165 = fma(_3831, _3949, _4061);
            float _4167 = fma(_3835, _3949, _4065);
            float _4169 = fma(_3841, _3949, _4069);
            float _4171 = fma(_3847, _3949, _4073);
            float _4173 = fma(_3853, _3949, _4077);
            float _4175 = fma(_3857, _3949, _4081);
            float _4177 = fma(_3863, _3949, _4085);
            float _4179 = fma(_3869, _3949, _4089);
            float _4181 = fma(_3875, _3949, _4093);
            float _4183 = fma(_3879, _3949, _4097);
            float _4185 = fma(_3885, _3949, _4101);
            float _4187 = fma(_3891, _3949, _4105);
            float _4189 = fma(_3897, _3949, _4109);
            float _4191 = fma(_3901, _3949, _4113);
            float _4193 = fma(_3907, _3949, _4117);
            float _4195 = fma(_3913, _3949, _4121);
            float _4197 = fma(_3919, _3949, _4125);
            float _4199 = fma(_3923, _3949, _4129);
            float _4201 = fma(_3929, _3949, _4133);
            float _4203 = fma(_3935, _3949, _4137);
            float _4205 = fma(_3941, _3949, _4141);
            _2375 = _4157;
            _2377 = _4153;
            _2379 = _4185;
            _2381 = _4167;
            _2383 = _4151;
            _2385 = _4171;
            _2387 = _4187;
            _2389 = _4169;
            _2391 = _4173;
            _2393 = _4189;
            _2395 = _4155;
            _2397 = _4183;
            _2399 = _4201;
            _2401 = _4149;
            _2403 = _4199;
            _2405 = _4159;
            _2407 = _4161;
            _2409 = _4193;
            _2411 = _4143;
            _2413 = _4145;
            _2415 = _4147;
            _2417 = _4191;
            _2419 = _4203;
            _2421 = _4165;
            _2423 = _4175;
            _2425 = _4195;
            _2427 = _4205;
            _2429 = _4179;
            _2431 = _4181;
            _2433 = _4197;
            _2435 = _4163;
            _2437 = _4177;
            _2439 = true;
        }
        else
        {
            int _4207 = _1561 * 656;
            int _4209 = _4207 + 262144;
            int _4211 = _4207 + 262192;
            int _4213 = _4207 + 262160;
            uint _4215 = uint(int(uint(_4209) >> uint(2)));
            packed_uint4 _dmw72 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4215)];
            float _4217 = as_type<float>(_dmw72.x);
            int _4219 = _4209 + 4;
            uint _4221 = uint(int(uint(_4219) >> uint(2)));
            float _4223 = as_type<float>(_dmw72.y);
            int _4225 = _4209 + 8;
            uint _4227 = uint(int(uint(_4225) >> uint(2)));
            float _4229 = as_type<float>(_dmw72.z);
            int _4231 = _4209 + 12;
            uint _4233 = uint(int(uint(_4231) >> uint(2)));
            float _4235 = as_type<float>(_dmw72.w);
            int _4237 = _4207 + 262208;
            uint _4239 = uint(int(uint(_4211) >> uint(2)));
            packed_uint4 _dmw75 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4239)];
            float _4241 = as_type<float>(_dmw75.x);
            int _4243 = _4211 + 4;
            uint _4245 = uint(int(uint(_4243) >> uint(2)));
            float _4247 = as_type<float>(_dmw75.y);
            int _4249 = _4211 + 8;
            uint _4251 = uint(int(uint(_4249) >> uint(2)));
            float _4253 = as_type<float>(_dmw75.z);
            int _4255 = _4211 + 12;
            uint _4257 = uint(int(uint(_4255) >> uint(2)));
            float _4259 = as_type<float>(_dmw75.w);
            int _4261 = _4207 + 262176;
            uint _4263 = uint(int(uint(_4213) >> uint(2)));
            packed_uint4 _dmw73 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4263)];
            float _4265 = as_type<float>(_dmw73.x);
            int _4267 = _4213 + 4;
            uint _4269 = uint(int(uint(_4267) >> uint(2)));
            float _4271 = as_type<float>(_dmw73.y);
            int _4273 = _4213 + 8;
            uint _4275 = uint(int(uint(_4273) >> uint(2)));
            float _4277 = as_type<float>(_dmw73.z);
            int _4279 = _4213 + 12;
            uint _4281 = uint(int(uint(_4279) >> uint(2)));
            float _4283 = as_type<float>(_dmw73.w);
            int _4285 = _4207 + 262224;
            uint _4287 = uint(int(uint(_4237) >> uint(2)));
            packed_uint4 _dmw76 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4287)];
            float _4289 = as_type<float>(_dmw76.x);
            int _4291 = _4237 + 4;
            uint _4293 = uint(int(uint(_4291) >> uint(2)));
            float _4295 = as_type<float>(_dmw76.y);
            int _4297 = _4237 + 8;
            uint _4299 = uint(int(uint(_4297) >> uint(2)));
            float _4301 = as_type<float>(_dmw76.z);
            int _4303 = _4237 + 12;
            uint _4305 = uint(int(uint(_4303) >> uint(2)));
            float _4307 = as_type<float>(_dmw76.w);
            int _4309 = _4207 + 262240;
            uint _4311 = uint(int(uint(_4261) >> uint(2)));
            packed_uint4 _dmw74 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4311)];
            float _4313 = as_type<float>(_dmw74.x);
            int _4315 = _4261 + 4;
            uint _4317 = uint(int(uint(_4315) >> uint(2)));
            float _4319 = as_type<float>(_dmw74.y);
            int _4321 = _4261 + 8;
            uint _4323 = uint(int(uint(_4321) >> uint(2)));
            float _4325 = as_type<float>(_dmw74.z);
            int _4327 = _4261 + 12;
            uint _4329 = uint(int(uint(_4327) >> uint(2)));
            float _4331 = as_type<float>(_dmw74.w);
            int _4333 = _4207 + 262256;
            uint _4335 = uint(int(uint(_4285) >> uint(2)));
            packed_uint4 _dmw77 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4335)];
            float _4337 = as_type<float>(_dmw77.x);
            int _4339 = _4285 + 4;
            uint _4341 = uint(int(uint(_4339) >> uint(2)));
            float _4343 = as_type<float>(_dmw77.y);
            int _4345 = _4285 + 8;
            uint _4347 = uint(int(uint(_4345) >> uint(2)));
            float _4349 = as_type<float>(_dmw77.z);
            int _4351 = _4285 + 12;
            uint _4353 = uint(int(uint(_4351) >> uint(2)));
            float _4355 = as_type<float>(_dmw77.w);
            int _4357 = _1503 * 656;
            uint _4359 = uint(int(uint(_4309) >> uint(2)));
            packed_uint4 _dmw78 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4359)];
            float _4361 = as_type<float>(_dmw78.x);
            int _4363 = _4309 + 4;
            uint _4365 = uint(int(uint(_4363) >> uint(2)));
            float _4367 = as_type<float>(_dmw78.y);
            int _4369 = _4309 + 8;
            uint _4371 = uint(int(uint(_4369) >> uint(2)));
            float _4373 = as_type<float>(_dmw78.z);
            int _4375 = _4309 + 12;
            uint _4377 = uint(int(uint(_4375) >> uint(2)));
            float _4379 = as_type<float>(_dmw78.w);
            int _4381 = _1575 * 656;
            int _4383 = _4357 + 262144;
            uint _4385 = uint(int(uint(_4333) >> uint(2)));
            packed_uint4 _dmw79 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4385)];
            float _4387 = as_type<float>(_dmw79.x);
            int _4389 = _4333 + 4;
            uint _4391 = uint(int(uint(_4389) >> uint(2)));
            float _4393 = as_type<float>(_dmw79.y);
            int _4395 = _4333 + 8;
            uint _4397 = uint(int(uint(_4395) >> uint(2)));
            float _4399 = as_type<float>(_dmw79.z);
            int _4401 = _4333 + 12;
            uint _4403 = uint(int(uint(_4401) >> uint(2)));
            float _4405 = as_type<float>(_dmw79.w);
            int _4407 = _4357 + 262192;
            int _4409 = _4357 + 262160;
            uint _4411 = uint(int(uint(_4383) >> uint(2)));
            packed_uint4 _dmw80 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4411)];
            float _4413 = as_type<float>(_dmw80.x);
            int _4415 = _4383 + 4;
            uint _4417 = uint(int(uint(_4415) >> uint(2)));
            float _4419 = as_type<float>(_dmw80.y);
            int _4421 = _4383 + 8;
            uint _4423 = uint(int(uint(_4421) >> uint(2)));
            float _4425 = as_type<float>(_dmw80.z);
            int _4427 = _4383 + 12;
            uint _4429 = uint(int(uint(_4427) >> uint(2)));
            float _4431 = as_type<float>(_dmw80.w);
            int _4433 = _4357 + 262208;
            int _4435 = _4357 + 262176;
            uint _4437 = uint(int(uint(_4407) >> uint(2)));
            packed_uint4 _dmw83 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4437)];
            float _4439 = as_type<float>(_dmw83.x);
            int _4441 = _4407 + 4;
            uint _4443 = uint(int(uint(_4441) >> uint(2)));
            float _4445 = as_type<float>(_dmw83.y);
            int _4447 = _4407 + 8;
            uint _4449 = uint(int(uint(_4447) >> uint(2)));
            float _4451 = as_type<float>(_dmw83.z);
            int _4453 = _4407 + 12;
            uint _4455 = uint(int(uint(_4453) >> uint(2)));
            float _4457 = as_type<float>(_dmw83.w);
            int _4459 = _4357 + 262224;
            int _4461 = _4357 + 262240;
            uint _4463 = uint(int(uint(_4409) >> uint(2)));
            packed_uint4 _dmw81 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4463)];
            float _4465 = as_type<float>(_dmw81.x);
            int _4467 = _4409 + 4;
            uint _4469 = uint(int(uint(_4467) >> uint(2)));
            float _4471 = as_type<float>(_dmw81.y);
            int _4473 = _4409 + 8;
            uint _4475 = uint(int(uint(_4473) >> uint(2)));
            float _4477 = as_type<float>(_dmw81.z);
            int _4479 = _4409 + 12;
            uint _4481 = uint(int(uint(_4479) >> uint(2)));
            float _4483 = as_type<float>(_dmw81.w);
            int _4485 = _4357 + 262256;
            int _4487 = _4381 + 262144;
            uint _4489 = uint(int(uint(_4433) >> uint(2)));
            packed_uint4 _dmw84 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4489)];
            float _4491 = as_type<float>(_dmw84.x);
            int _4493 = _4433 + 4;
            uint _4495 = uint(int(uint(_4493) >> uint(2)));
            float _4497 = as_type<float>(_dmw84.y);
            int _4499 = _4433 + 8;
            uint _4501 = uint(int(uint(_4499) >> uint(2)));
            float _4503 = as_type<float>(_dmw84.z);
            int _4505 = _4433 + 12;
            uint _4507 = uint(int(uint(_4505) >> uint(2)));
            float _4509 = as_type<float>(_dmw84.w);
            int _4511 = _4381 + 262192;
            int _4513 = _4381 + 262160;
            uint _4515 = uint(int(uint(_4435) >> uint(2)));
            packed_uint4 _dmw82 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4515)];
            float _4517 = as_type<float>(_dmw82.x);
            int _4519 = _4435 + 4;
            uint _4521 = uint(int(uint(_4519) >> uint(2)));
            float _4523 = as_type<float>(_dmw82.y);
            int _4525 = _4435 + 8;
            uint _4527 = uint(int(uint(_4525) >> uint(2)));
            float _4529 = as_type<float>(_dmw82.z);
            int _4531 = _4435 + 12;
            uint _4533 = uint(int(uint(_4531) >> uint(2)));
            float _4535 = as_type<float>(_dmw82.w);
            int _4537 = _4381 + 262208;
            int _4539 = _4381 + 262176;
            uint _4541 = uint(int(uint(_4459) >> uint(2)));
            packed_uint4 _dmw85 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4541)];
            float _4543 = as_type<float>(_dmw85.x);
            int _4545 = _4459 + 4;
            uint _4547 = uint(int(uint(_4545) >> uint(2)));
            float _4549 = as_type<float>(_dmw85.y);
            int _4551 = _4459 + 8;
            uint _4553 = uint(int(uint(_4551) >> uint(2)));
            float _4555 = as_type<float>(_dmw85.z);
            int _4557 = _4459 + 12;
            uint _4559 = uint(int(uint(_4557) >> uint(2)));
            float _4561 = as_type<float>(_dmw85.w);
            int _4563 = _4381 + 262224;
            int _4565 = _4381 + 262240;
            uint _4567 = uint(int(uint(_4461) >> uint(2)));
            packed_uint4 _dmw86 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4567)];
            float _4569 = as_type<float>(_dmw86.x);
            int _4571 = _4461 + 4;
            uint _4573 = uint(int(uint(_4571) >> uint(2)));
            float _4575 = as_type<float>(_dmw86.y);
            int _4577 = _4461 + 8;
            uint _4579 = uint(int(uint(_4577) >> uint(2)));
            float _4581 = as_type<float>(_dmw86.z);
            int _4583 = _4461 + 12;
            uint _4585 = uint(int(uint(_4583) >> uint(2)));
            float _4587 = as_type<float>(_dmw86.w);
            int _4589 = _4381 + 262256;
            uint _4591 = uint(int(uint(_4485) >> uint(2)));
            packed_uint4 _dmw87 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4591)];
            float _4593 = as_type<float>(_dmw87.x);
            int _4595 = _4485 + 4;
            uint _4597 = uint(int(uint(_4595) >> uint(2)));
            float _4599 = as_type<float>(_dmw87.y);
            int _4601 = _4485 + 8;
            uint _4603 = uint(int(uint(_4601) >> uint(2)));
            float _4605 = as_type<float>(_dmw87.z);
            int _4607 = _4485 + 12;
            uint _4609 = uint(int(uint(_4607) >> uint(2)));
            float _4611 = as_type<float>(_dmw87.w);
            uint _4613 = uint(int(uint(_4487) >> uint(2)));
            packed_uint4 _dmw88 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4613)];
            float _4615 = as_type<float>(_dmw88.x);
            int _4617 = _4487 + 4;
            uint _4619 = uint(int(uint(_4617) >> uint(2)));
            float _4621 = as_type<float>(_dmw88.y);
            int _4623 = _4487 + 8;
            uint _4625 = uint(int(uint(_4623) >> uint(2)));
            float _4627 = as_type<float>(_dmw88.z);
            int _4629 = _4487 + 12;
            uint _4631 = uint(int(uint(_4629) >> uint(2)));
            float _4633 = as_type<float>(_dmw88.w);
            uint _4635 = uint(int(uint(_4511) >> uint(2)));
            packed_uint4 _dmw91 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4635)];
            float _4637 = as_type<float>(_dmw91.x);
            int _4639 = _4511 + 4;
            uint _4641 = uint(int(uint(_4639) >> uint(2)));
            float _4643 = as_type<float>(_dmw91.y);
            int _4645 = _4511 + 8;
            uint _4647 = uint(int(uint(_4645) >> uint(2)));
            float _4649 = as_type<float>(_dmw91.z);
            int _4651 = _4511 + 12;
            uint _4653 = uint(int(uint(_4651) >> uint(2)));
            float _4655 = as_type<float>(_dmw91.w);
            uint _4657 = uint(int(uint(_4513) >> uint(2)));
            packed_uint4 _dmw89 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4657)];
            float _4659 = as_type<float>(_dmw89.x);
            int _4661 = _4513 + 4;
            uint _4663 = uint(int(uint(_4661) >> uint(2)));
            float _4665 = as_type<float>(_dmw89.y);
            int _4667 = _4513 + 8;
            uint _4669 = uint(int(uint(_4667) >> uint(2)));
            float _4671 = as_type<float>(_dmw89.z);
            int _4673 = _4513 + 12;
            uint _4675 = uint(int(uint(_4673) >> uint(2)));
            float _4677 = as_type<float>(_dmw89.w);
            uint _4679 = uint(int(uint(_4537) >> uint(2)));
            packed_uint4 _dmw92 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4679)];
            float _4681 = as_type<float>(_dmw92.x);
            int _4683 = _4537 + 4;
            uint _4685 = uint(int(uint(_4683) >> uint(2)));
            float _4687 = as_type<float>(_dmw92.y);
            int _4689 = _4537 + 8;
            uint _4691 = uint(int(uint(_4689) >> uint(2)));
            float _4693 = as_type<float>(_dmw92.z);
            int _4695 = _4537 + 12;
            uint _4697 = uint(int(uint(_4695) >> uint(2)));
            float _4699 = as_type<float>(_dmw92.w);
            uint _4701 = uint(int(uint(_4539) >> uint(2)));
            packed_uint4 _dmw90 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4701)];
            float _4703 = as_type<float>(_dmw90.x);
            int _4705 = _4539 + 4;
            uint _4707 = uint(int(uint(_4705) >> uint(2)));
            float _4709 = as_type<float>(_dmw90.y);
            int _4711 = _4539 + 8;
            uint _4713 = uint(int(uint(_4711) >> uint(2)));
            float _4715 = as_type<float>(_dmw90.z);
            int _4717 = _4539 + 12;
            uint _4719 = uint(int(uint(_4717) >> uint(2)));
            float _4721 = as_type<float>(_dmw90.w);
            uint _4723 = uint(int(uint(_4563) >> uint(2)));
            packed_uint4 _dmw93 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4723)];
            float _4725 = as_type<float>(_dmw93.x);
            int _4727 = _4563 + 4;
            uint _4729 = uint(int(uint(_4727) >> uint(2)));
            float _4731 = as_type<float>(_dmw93.y);
            int _4733 = _4563 + 8;
            uint _4735 = uint(int(uint(_4733) >> uint(2)));
            float _4737 = as_type<float>(_dmw93.z);
            int _4739 = _4563 + 12;
            uint _4741 = uint(int(uint(_4739) >> uint(2)));
            float _4743 = as_type<float>(_dmw93.w);
            uint _4745 = uint(int(uint(_4565) >> uint(2)));
            packed_uint4 _dmw94 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4745)];
            float _4747 = as_type<float>(_dmw94.x);
            int _4749 = _4565 + 4;
            uint _4751 = uint(int(uint(_4749) >> uint(2)));
            float _4753 = as_type<float>(_dmw94.y);
            int _4755 = _4565 + 8;
            uint _4757 = uint(int(uint(_4755) >> uint(2)));
            float _4759 = as_type<float>(_dmw94.z);
            int _4761 = _4565 + 12;
            uint _4763 = uint(int(uint(_4761) >> uint(2)));
            float _4765 = as_type<float>(_dmw94.w);
            uint _4767 = uint(int(uint(_4589) >> uint(2)));
            packed_uint4 _dmw95 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_4767)];
            float _4769 = as_type<float>(_dmw95.x);
            int _4771 = _4589 + 4;
            uint _4773 = uint(int(uint(_4771) >> uint(2)));
            float _4775 = as_type<float>(_dmw95.y);
            int _4777 = _4589 + 8;
            uint _4779 = uint(int(uint(_4777) >> uint(2)));
            float _4781 = as_type<float>(_dmw95.z);
            int _4783 = _4589 + 12;
            uint _4785 = uint(int(uint(_4783) >> uint(2)));
            float _4787 = as_type<float>(_dmw95.w);
            float _4789 = -_3351;
            float _4791 = _4789 + _3353;
            float _4793 = -_4791;
            float _4795 = _1479 + _4793;
            float _4797 = _4217 * _4791;
            float _4799 = _4223 * _4791;
            float _4801 = _4229 * _4791;
            float _4803 = _4235 * _4791;
            float _4805 = _4241 * _4791;
            float _4807 = _4247 * _4791;
            float _4809 = _4253 * _4791;
            float _4811 = _4259 * _4791;
            float _4813 = _4265 * _4791;
            float _4815 = _4271 * _4791;
            float _4817 = _4277 * _4791;
            float _4819 = _4283 * _4791;
            float _4821 = _4289 * _4791;
            float _4823 = _4295 * _4791;
            float _4825 = _4301 * _4791;
            float _4827 = _4307 * _4791;
            float _4829 = _4313 * _4791;
            float _4831 = _4319 * _4791;
            float _4833 = _4325 * _4791;
            float _4835 = _4331 * _4791;
            float _4837 = _4337 * _4791;
            float _4839 = _4343 * _4791;
            float _4841 = _4349 * _4791;
            float _4843 = _4355 * _4791;
            float _4845 = _4361 * _4791;
            float _4847 = _4367 * _4791;
            float _4849 = _4373 * _4791;
            float _4851 = _4379 * _4791;
            float _4853 = _4387 * _4791;
            float _4855 = _4393 * _4791;
            float _4857 = _4399 * _4791;
            float _4859 = _4405 * _4791;
            float _4861 = -_3353;
            float _4863 = fma(_4413, _4861, _4797);
            float _4865 = -_3353;
            float _4867 = fma(_4419, _4865, _4799);
            float _4869 = -_3353;
            float _4871 = fma(_4425, _4869, _4801);
            float _4873 = -_3353;
            float _4875 = fma(_4431, _4873, _4803);
            float _4877 = -_3353;
            float _4879 = fma(_4439, _4877, _4805);
            float _4881 = -_3353;
            float _4883 = fma(_4445, _4881, _4807);
            float _4885 = -_3353;
            float _4887 = fma(_4451, _4885, _4809);
            float _4889 = -_3353;
            float _4891 = fma(_4457, _4889, _4811);
            float _4893 = -_3353;
            float _4895 = fma(_4465, _4893, _4813);
            float _4897 = -_3353;
            float _4899 = fma(_4471, _4897, _4815);
            float _4901 = -_3353;
            float _4903 = fma(_4477, _4901, _4817);
            float _4905 = -_3353;
            float _4907 = fma(_4483, _4905, _4819);
            float _4909 = -_3353;
            float _4911 = fma(_4491, _4909, _4821);
            float _4913 = -_3353;
            float _4915 = fma(_4497, _4913, _4823);
            float _4917 = -_3353;
            float _4919 = fma(_4503, _4917, _4825);
            float _4921 = -_3353;
            float _4923 = fma(_4509, _4921, _4827);
            float _4925 = -_3353;
            float _4927 = fma(_4517, _4925, _4829);
            float _4929 = -_3353;
            float _4931 = fma(_4523, _4929, _4831);
            float _4933 = -_3353;
            float _4935 = fma(_4529, _4933, _4833);
            float _4937 = -_3353;
            float _4939 = fma(_4535, _4937, _4835);
            float _4941 = -_3353;
            float _4943 = fma(_4543, _4941, _4837);
            float _4945 = -_3353;
            float _4947 = fma(_4549, _4945, _4839);
            float _4949 = -_3353;
            float _4951 = fma(_4555, _4949, _4841);
            float _4953 = -_3353;
            float _4955 = fma(_4561, _4953, _4843);
            float _4957 = -_3353;
            float _4959 = fma(_4569, _4957, _4845);
            float _4961 = -_3353;
            float _4963 = fma(_4575, _4961, _4847);
            float _4965 = -_3353;
            float _4967 = fma(_4581, _4965, _4849);
            float _4969 = -_3353;
            float _4971 = fma(_4587, _4969, _4851);
            float _4973 = -_3353;
            float _4975 = fma(_4593, _4973, _4853);
            float _4977 = -_3353;
            float _4979 = fma(_4599, _4977, _4855);
            float _4981 = -_3353;
            float _4983 = fma(_4605, _4981, _4857);
            float _4985 = -_3353;
            float _4987 = fma(_4611, _4985, _4859);
            float _4989 = fma(_4615, _4795, _4863);
            float _4991 = fma(_4621, _4795, _4867);
            float _4993 = fma(_4627, _4795, _4871);
            float _4995 = fma(_4633, _4795, _4875);
            float _4997 = fma(_4637, _4795, _4879);
            float _4999 = fma(_4643, _4795, _4883);
            float _5001 = fma(_4649, _4795, _4887);
            float _5003 = fma(_4655, _4795, _4891);
            float _5005 = fma(_4659, _4795, _4895);
            float _5007 = fma(_4665, _4795, _4899);
            float _5009 = fma(_4671, _4795, _4903);
            float _5011 = fma(_4677, _4795, _4907);
            float _5013 = fma(_4681, _4795, _4911);
            float _5015 = fma(_4687, _4795, _4915);
            float _5017 = fma(_4693, _4795, _4919);
            float _5019 = fma(_4699, _4795, _4923);
            float _5021 = fma(_4703, _4795, _4927);
            float _5023 = fma(_4709, _4795, _4931);
            float _5025 = fma(_4715, _4795, _4935);
            float _5027 = fma(_4721, _4795, _4939);
            float _5029 = fma(_4725, _4795, _4943);
            float _5031 = fma(_4731, _4795, _4947);
            float _5033 = fma(_4737, _4795, _4951);
            float _5035 = fma(_4743, _4795, _4955);
            float _5037 = fma(_4747, _4795, _4959);
            float _5039 = fma(_4753, _4795, _4963);
            float _5041 = fma(_4759, _4795, _4967);
            float _5043 = fma(_4765, _4795, _4971);
            float _5045 = fma(_4769, _4795, _4975);
            float _5047 = fma(_4775, _4795, _4979);
            float _5049 = fma(_4781, _4795, _4983);
            float _5051 = fma(_4787, _4795, _4987);
            _2375 = _5003;
            _2377 = _4999;
            _2379 = _5031;
            _2381 = _5013;
            _2383 = _4997;
            _2385 = _5017;
            _2387 = _5033;
            _2389 = _5015;
            _2391 = _5019;
            _2393 = _5035;
            _2395 = _5001;
            _2397 = _5029;
            _2399 = _5047;
            _2401 = _4995;
            _2403 = _5045;
            _2405 = _5005;
            _2407 = _5007;
            _2409 = _5039;
            _2411 = _4989;
            _2413 = _4991;
            _2415 = _4993;
            _2417 = _5037;
            _2419 = _5049;
            _2421 = _5011;
            _2423 = _5021;
            _2425 = _5041;
            _2427 = _5051;
            _2429 = _5025;
            _2431 = _5027;
            _2433 = _5043;
            _2435 = _5009;
            _2437 = _5023;
        }
    }
    _2439 = false;
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
    float _5115 = _2437;
    float _5117 = _5053 * 0.511664927005767822265625;
    float _5119 = _5055 * 0.88622760772705078125;
    float _5121 = _5057 * 0.511664927005767822265625;
    float _5123 = _5059 * 0.511664927005767822265625;
    float _5125 = _5117 * _5117;
    float _5127 = _5061 * 0.88622760772705078125;
    float _5129 = _5063 * 0.511664927005767822265625;
    float _5131 = precise::max(_5119, 0.00999999977648258209228515625);
    float _5133 = fma(_5121, _5121, _5125);
    float _5135 = _5065 * 0.511664927005767822265625;
    float _5137 = _5123 * _5123;
    float _5139 = _5067 * 0.511664927005767822265625;
    float _5141 = precise::max(_5127, 0.00999999977648258209228515625);
    float _5143 = fma(_5129, _5129, _5133);
    float _5145 = 1.0 / _5131;
    float _5147 = _5069 * 0.511664927005767822265625;
    float _5149 = fma(_5135, _5135, _5137);
    float _5151 = _5071 * 0.511664927005767822265625;
    float _5153 = _5073 * 0.88622760772705078125;
    float _5155 = _5075 * 0.511664927005767822265625;
    float _5157 = 1.0 / _5141;
    float _5159 = _5139 * _5139;
    float _5161 = precise::max(_5153, 0.00999999977648258209228515625);
    float _5163 = fma(_1467, 1.9073486328125, 0.5);
    float _5165 = fma(_5151, _5151, _5159);
    float _5167 = sqrt(_5143);
    float _5169 = fma(_5147, _5147, _5149);
    float _5171 = fma(_5155, _5155, _5165);
    float _5173 = _1467 * 3.903682708740234375;
    float _5175 = -(*spvDescriptorSet0.vp_c9)._m0[1001].z;
    float _5177 = _5175 + (*spvDescriptorSet0.vp_c9)._m0[1000].z;
    float _5179 = _5173 * _5077;
    float _5181 = sqrt(_5169);
    float _5183 = _5173 * _5079;
    float _5185 = fma(_5081, 0.88622701168060302734375, _5179);
    float _5187 = _5173 * _5083;
    float _5189 = _5173 * _5085;
    float _5191 = _5173 * _5087;
    float _5193 = fma(_5089, 0.88622701168060302734375, _5183);
    float _5195 = 1.0 / _5161;
    float _5197 = precise::max(_5167, 0.00999999977648258209228515625);
    float _5199 = fma(_5091, 0.88622701168060302734375, _5187);
    float _5201 = fma(_5093, 0.88622701168060302734375, _5189);
    float _5203 = fma(_5095, 0.88622701168060302734375, _5191);
    float _5205 = sqrt(_5171);
    float _5207 = -(*spvDescriptorSet0.vp_c9)._m0[1007].x;
    float _5209 = _5207 + (*spvDescriptorSet0.vp_c9)._m0[1006].x;
    float _5211 = precise::max(_5181, 0.00999999977648258209228515625);
    int _5213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _5215 = _5213 != 0;
    float _5217 = fma(_5163, _5209, (*spvDescriptorSet0.vp_c9)._m0[1007].x);
    float _5219 = 1.0 / _5197;
    float _5221 = _5211 * _5145;
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = -(*spvDescriptorSet0.vp_c9)._m0[1007].y;
    float _5227 = _5225 + (*spvDescriptorSet0.vp_c9)._m0[1006].y;
    float _5229 = -(*spvDescriptorSet0.vp_c9)._m0[1007].z;
    float _5231 = _5229 + (*spvDescriptorSet0.vp_c9)._m0[1006].z;
    float _5233 = fma(_5163, _5227, (*spvDescriptorSet0.vp_c9)._m0[1007].y);
    float _5235 = precise::max(_5205, 0.00999999977648258209228515625);
    float _5237 = 1.0 / _5211;
    float _5239 = fma(_5163, _5231, (*spvDescriptorSet0.vp_c9)._m0[1007].z);
    float _5241 = _5233 * 0.715200006961822509765625;
    float _5243 = _5197 * _5157;
    float _5245 = precise::clamp(_5243, 0.0, 1.0);
    float _5247 = _5235 * _5195;
    float _5249 = precise::clamp(_5247, 0.0, 1.0);
    float _5251 = _5223 + 1.0;
    float _5253 = fma(_5217, 0.2125999927520751953125, _5241);
    float _5255 = _5121 * _5219;
    float _5257 = 1.0 / _5235;
    float _5259 = _5117 * _5219;
    float _5261 = fma(_5239, 0.072200000286102294921875, _5253);
    float _5263 = _5245 + 1.0;
    float _5265 = 1.0 / _5261;
    float _5267 = _5123 * _5237;
    float _5269 = _5129 * _5219;
    float _5271 = _5135 * _5237;
    float _5273 = _5147 * _5237;
    float _5275 = _1563 * _5267;
    float _5277 = _5139 * _5257;
    float _5279 = _1563 * _5259;
    float _5281 = _5151 * _5257;
    float _5283 = -_1549;
    float _5285 = fma(_5283, _5271, _5275);
    float _5287 = _1563 * _5277;
    float _5289 = -_1549;
    float _5291 = fma(_5289, _5255, _5279);
    float _5293 = _5155 * _5257;
    float _5295 = -_1557;
    float _5297 = fma(_5295, _5273, _5285);
    float _5299 = -_1549;
    float _5301 = fma(_5299, _5281, _5287);
    float _5303 = -_1557;
    float _5305 = fma(_5303, _5269, _5291);
    float _5307 = _5249 + 1.0;
    float _5309 = fma(_5297, 0.5, 0.5);
    float _5311 = -_1557;
    float _5313 = fma(_5311, _5293, _5301);
    float _5315 = fma(_5305, 0.5, 0.5);
    float _5317 = 1.0 / _5307;
    float _5319 = fma(_5313, 0.5, 0.5);
    float _5321 = _5265 * (*spvDescriptorSet0.vp_c9)._m0[39].z;
    float _5323 = precise::clamp(_5321, 0.0, 1.0);
    float _5325 = _1557 * (-1.02332699298858642578125);
    float _5327 = -(*spvDescriptorSet0.vp_c9)._m0[1001].x;
    float _5329 = _5327 + (*spvDescriptorSet0.vp_c9)._m0[1000].x;
    float _5331 = fma(_5323, (*spvDescriptorSet0.vp_c9)._m0[39].y, (*spvDescriptorSet0.vp_c9)._m0[39].x);
    float _5333 = abs(_5315);
    float _5335 = log2(_5333);
    float _5337 = fma(_5163, _5177, (*spvDescriptorSet0.vp_c9)._m0[1001].z);
    float _5339 = fma(_5325, _5097, _5185);
    float _5341 = fma(_5163, _5329, (*spvDescriptorSet0.vp_c9)._m0[1001].x);
    float _5343 = fma(_5325, _5099, _5199);
    float _5345 = fma(_5325, _5101, _5201);
    float _5347 = fma(_5325, _5103, _5203);
    float _5349 = _5233 * _5331;
    float _5351 = abs(_5309);
    float _5353 = log2(_5351);
    float _5355 = _1549 * (-1.02332699298858642578125);
    float _5357 = fma(_5355, _5105, _5339);
    float _5359 = fma(_5355, _5107, _5343);
    float _5361 = fma(_5355, _5109, _5345);
    float _5363 = abs(_5319);
    float _5365 = log2(_5363);
    float _5367 = fma(_5355, _5111, _5347);
    float _5369 = precise::max(0.0, _5357);
    float _5371 = precise::max(0.0, _5359);
    float _5373 = precise::max(0.0, _5361);
    float _5375 = _5369 * 0.31830990314483642578125;
    float _5377 = precise::clamp(_5375, 0.0, 1.0);
    float _5379 = 1.0 / _5251;
    float _5381 = precise::max(0.0, _5367);
    float _5383 = _5371 * (*spvDescriptorSet0.vp_c9)._m0[68].y;
    float _5385 = -_5377;
    float _5387 = _5385 + 1.0;
    float _5389 = _5373 * (*spvDescriptorSet0.vp_c9)._m0[68].z;
    float _5391 = _5381 * 0.31830990314483642578125;
    float _5393 = precise::clamp(_5391, 0.0, 1.0);
    float _5395 = fma(_5387, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5377);
    float _5397 = 1.0 / _5263;
    float _5399 = fma(_5245, 2.0, 1.0);
    float _5401 = _5239 * _5331;
    float _5403 = precise::max(_5383, _5349);
    float _5405 = _5393 * 0.88622701168060302734375;
    float _5407 = _5399 * _5335;
    float _5409 = fma(_5223, 2.0, 1.0);
    float _5411 = precise::max(_5389, _5401);
    float _5413 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].y, _5403);
    float _5415 = _5409 * _5353;
    float _5417 = fma(_5249, 2.0, 1.0);
    float _5419 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].z, _5411);
    float _5421 = -(*spvDescriptorSet0.vp_c9)._m0[1001].y;
    float _5423 = _5421 + (*spvDescriptorSet0.vp_c9)._m0[1000].y;
    float _5425 = _5417 * _5365;
    float _5427 = exp2(_5415);
    float _5429 = -_5245;
    float _5431 = _5429 + 1.0;
    float _5433 = fma(_5163, _5423, (*spvDescriptorSet0.vp_c9)._m0[1001].y);
    float _5435 = fma(_5245, 2.0, 2.0);
    float _5437 = -_5223;
    float _5439 = _5437 + 1.0;
    float _5441 = fma(_5223, 2.0, 2.0);
    float _5443 = fma(_5325, _5113, _5193);
    float _5445 = _5431 * _5397;
    float _5447 = exp2(_5407);
    float _5449 = _5439 * _5379;
    float _5451 = fma(_5355, _5115, _5443);
    float _5453 = precise::max(0.0, _5451);
    float _5455 = exp2(_5425);
    float _5457 = fma(_5249, 2.0, 2.0);
    float _5459 = -_5249;
    float _5461 = _5459 + 1.0;
    float _5463 = _5441 * _5427;
    float _5465 = _5453 * (*spvDescriptorSet0.vp_c9)._m0[68].x;
    float _5467 = _5461 * _5317;
    float _5469 = _5217 * _5331;
    float _5471 = _5435 * _5447;
    float _5473 = -_5463;
    float _5475 = _5473 + 1.0;
    float _5477 = -_5471;
    float _5479 = _5477 + 1.0;
    float _5481 = fma(_5449, _5475, _5463);
    float _5483 = precise::max(_5465, _5469);
    float _5485 = _5457 * _5455;
    float _5487 = fma(_5445, _5479, _5471);
    float _5489 = _5119 * _5481;
    float _5491 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[991].x, _5483);
    float _5493 = -_5485;
    float _5495 = _5493 + 1.0;
    float _5497 = _5127 * _5487;
    float _5499 = fma(_5467, _5495, _5485);
    float _5501 = _5497 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5503 = _5489 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5505 = _5153 * _5499;
    float _5507 = precise::max(_5501, _5341);
    float _5509 = _5505 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5511 = precise::max(_5503, _5433);
    float _5513 = fma(_5507, _5395, _5491);
    float _5515 = precise::max(_5509, _5337);
    float _5517 = fma(_5511, _5395, _5413);
    float _5519 = fma(_5515, _5395, _5419);
    bool _5521 = !_5215;
    float _5523;
    float _5525;
    float _5527;
    float _5529;
    float _5531;
    float _5533;
    float _5535;
    float _5537;
    float _5539;
    float _5541;
    int _5543;
    float _5545;
    float _5547;
    float _5549;
    float _5551;
    float _5553;
    float _5555;
    float _5557;
    int _5559;
    float _5561;
    int _5563;
    float _5565;
    int _5567;
    int _5569;
    int _5571;
    float _5573;
    float _5575;
    int _5577;
    float _5579;
    int _5581;
    int _5583;
    float _5585;
    if (!_5521)
    {
        _5523 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _5525 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _5527 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _5529 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _5531 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _5533 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _5535 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _5537 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _5539 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _5541 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _5543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _5545 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _5547 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _5549 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _5551 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _5553 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _5555 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _5557 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _5559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _5561 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _5563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _5565 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _5567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _5569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _5571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _5573 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _5575 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _5577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _5579 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _5581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _5583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _5585 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _5587 = true;
    }
    else
    {
        float _5589 = fma(_1069, 6.2500002968590706586837768554688e-05, 0.5);
        float _5591 = fma(_1067, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _14870 = float3(_5589, _5591, float(0));
        float3 _14872 = select(_14870, float3(0.0), isnan(_14870));
        float4 _5593 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14872.xy, uint(rint(_14872.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14872.xy, uint(rint(_14872.z)), level(0.0)).xyzw;
        float _5595 = _5593.x;
        float _5597 = _5593.y;
        float _5599 = _5593.z;
        float _5601 = _5593.w;
        float3 _14887 = float3(_5589, _5591, float(1));
        float3 _14889 = select(_14887, float3(0.0), isnan(_14887));
        float4 _5603 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14889.xy, uint(rint(_14889.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14889.xy, uint(rint(_14889.z)), level(0.0)).xyzw;
        float _5605 = _5603.x;
        float _5607 = _5603.y;
        float _5609 = _5603.z;
        float _5611 = _5603.w;
        float3 _14904 = float3(_5589, _5591, float(2));
        float3 _14906 = select(_14904, float3(0.0), isnan(_14904));
        float4 _5613 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14906.xy, uint(rint(_14906.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14906.xy, uint(rint(_14906.z)), level(0.0)).xyzw;
        float _5615 = _5613.x;
        float _5617 = _5613.y;
        float _5619 = _5613.z;
        float _5621 = _5613.w;
        float3 _14921 = float3(_5589, _5591, float(3));
        float3 _14923 = select(_14921, float3(0.0), isnan(_14921));
        float4 _5623 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14923.xy, uint(rint(_14923.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14923.xy, uint(rint(_14923.z)), level(0.0)).xyzw;
        float _5625 = _5623.x;
        float _5627 = _5623.y;
        float _5629 = _5623.z;
        float _5631 = _5623.w;
        float3 _14938 = float3(_5589, _5591, float(4));
        float3 _14940 = select(_14938, float3(0.0), isnan(_14938));
        float4 _5633 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14940.xy, uint(rint(_14940.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14940.xy, uint(rint(_14940.z)), level(0.0)).xyzw;
        float _5635 = _5633.x;
        float _5637 = _5633.y;
        float _5639 = _5633.z;
        float _5641 = _5633.w;
        float3 _14955 = float3(_5589, _5591, float(5));
        float3 _14957 = select(_14955, float3(0.0), isnan(_14955));
        float4 _5643 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14957.xy, uint(rint(_14957.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14957.xy, uint(rint(_14957.z)), level(0.0)).xyzw;
        float _5645 = _5643.x;
        float _5647 = _5643.y;
        float _5649 = _5643.z;
        float _5651 = _5643.w;
        float3 _14972 = float3(_5589, _5591, float(6));
        float3 _14974 = select(_14972, float3(0.0), isnan(_14972));
        float4 _5653 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14974.xy, uint(rint(_14974.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14974.xy, uint(rint(_14974.z)), level(0.0)).xyzw;
        float _5655 = _5653.x;
        float _5657 = _5653.y;
        float _5659 = _5653.z;
        float _5661 = _5653.w;
        float3 _14989 = float3(_5589, _5591, float(7));
        float3 _14991 = select(_14989, float3(0.0), isnan(_14989));
        float4 _5663 = dm_bs(spvDescriptorSet0.vp_t_tcb_E.sample(spvDescriptorSet0.vp_t_tcb_ESmplr, _14991.xy, uint(rint(_14991.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_E, spvDescriptorSet0.vp_t_tcb_ESmplr_w, _14991.xy, uint(rint(_14991.z)), level(0.0)).xyzw;
        float _5665 = _5663.x;
        float _5667 = _5663.y;
        float _5669 = _5663.z;
        float _5671 = _5663.w;
        _5523 = _5657;
        _5525 = _5667;
        _5527 = _5625;
        _5529 = _5627;
        _5531 = _5655;
        _5533 = _5665;
        _5535 = _5601;
        _5537 = _5659;
        _5539 = _5629;
        _5541 = _5669;
        _5543 = as_type<int>(_5631);
        _5545 = _5661;
        _5547 = _5595;
        _5549 = _5605;
        _5551 = _5607;
        _5553 = _5671;
        _5555 = _5597;
        _5557 = _5599;
        _5559 = as_type<int>(_5637);
        _5561 = _5611;
        _5563 = as_type<int>(_5635);
        _5565 = _5609;
        _5567 = as_type<int>(_5639);
        _5569 = as_type<int>(_5641);
        _5571 = as_type<int>(_5645);
        _5573 = _5617;
        _5575 = _5615;
        _5577 = as_type<int>(_5647);
        _5579 = _5619;
        _5581 = as_type<int>(_5651);
        _5583 = as_type<int>(_5649);
        _5585 = _5621;
    }
    _5587 = false;
    float _5673 = _5523;
    float _5675 = _5525;
    float _5677 = _5527;
    float _5679 = _5529;
    float _5681 = _5531;
    float _5683 = _5533;
    float _5685 = _5535;
    float _5687 = _5537;
    float _5689 = _5539;
    float _5691 = _5541;
    int _5693 = _5543;
    float _5695 = _5545;
    float _5697 = _5547;
    float _5699 = _5549;
    float _5701 = _5551;
    float _5703 = _5553;
    float _5705 = _5555;
    float _5707 = _5557;
    int _5709 = _5559;
    float _5711 = _5561;
    int _5713 = _5563;
    float _5715 = _5565;
    int _5717 = _5567;
    int _5719 = _5569;
    int _5721 = _5571;
    float _5723 = _5573;
    float _5725 = _5575;
    int _5727 = _5577;
    float _5729 = _5579;
    int _5731 = _5581;
    int _5733 = _5583;
    float _5735 = _5585;
    float _5737 = _5173 * _5673;
    float _5739 = _5173 * _5675;
    float _5741 = _5677 * 0.88622701168060302734375;
    float _5743 = _5679 * 0.88622701168060302734375;
    float _5745 = fma(_5681, 0.88622701168060302734375, _5737);
    float _5747 = fma(_5683, 0.88622701168060302734375, _5739);
    float _5749 = _5173 * _5685;
    out.m_54.x = _1437;
    out.m_54.y = _1439;
    float _5751 = fma(_5325, _5687, _5745);
    float _5753 = _5689 * 0.88622701168060302734375;
    float _5755 = fma(_5325, _5691, _5747);
    float _5757 = _5215 ? as_type<float>(_5693) : 0.0;
    float _5759 = fma(_5355, _5695, _5751);
    out.m_56.x = _1069;
    out.m_56.y = _1163;
    out.m_56.z = _1067;
    float _5761 = fma(_5697, 0.88622701168060302734375, _5749);
    float _5763 = _5173 * _5699;
    float _5765 = _5173 * _5701;
    float _5767 = _5215 ? _5741 : 0.0;
    float _5769 = fma(_5355, _5703, _5755);
    float _5771 = _5215 ? _5743 : 0.0;
    float _5773 = fma(_5705, 0.88622701168060302734375, _5763);
    float _5775 = precise::max(0.0, _5759);
    float _5777 = fma(_5707, 0.88622701168060302734375, _5765);
    float _5779 = _5215 ? as_type<float>(_5709) : 0.0;
    float _5781 = fma(_5325, _5711, _5773);
    float _5783 = _5215 ? as_type<float>(_5713) : 0.0;
    float _5785 = fma(_5173, _5757, _5767);
    float _5787 = _5215 ? _5753 : 0.0;
    float _5789 = fma(_5325, _5715, _5761);
    float _5791 = _5215 ? as_type<float>(_5717) : 0.0;
    float _5793 = fma(_5173, _5783, _5771);
    float _5795 = _5215 ? as_type<float>(_5719) : 0.0;
    float _5797 = _5775 * 0.31830990314483642578125;
    float _5799 = precise::clamp(_5797, 0.0, 1.0);
    float _5801 = _5215 ? as_type<float>(_5721) : 0.0;
    float _5803 = fma(_5173, _5779, _5787);
    float _5805 = precise::max(0.0, _5769);
    float _5807 = fma(_5355, _5723, _5789);
    float _5809 = fma(_5325, _5725, _5777);
    out.m_58.x = _744;
    float _5811 = _5799 * 0.88622701168060302734375;
    float _5813 = fma(_5325, _5795, _5793);
    float _5815 = fma(_5325, _5801, _5803);
    float _5817 = _5805 * 0.31830990314483642578125;
    float _5819 = precise::clamp(_5817, 0.0, 1.0);
    float _5821 = _5215 ? as_type<float>(_5727) : 0.0;
    float _5823 = fma(_5355, _5729, _5781);
    float _5825 = _5215 ? as_type<float>(_5731) : 0.0;
    float _5827 = fma(_5325, _5791, _5785);
    float _5829 = _5215 ? as_type<float>(_5733) : 0.0;
    float _5831 = fma(_5355, _5735, _5809);
    float _5833 = precise::max(0.0, _5807);
    float _5835 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    out.gl_Position.x = _1565;
    out.gl_Position.y = _1567;
    float _15259 = as_type<float>(_1573);
    out.gl_Position.z = _15259;
    out.gl_Position.w = _1569;
    float _5837 = -_5819;
    float _5839 = _5837 + 1.0;
    float _5841 = fma(_5355, _5821, _5827);
    float _5843 = fma(_5355, _5829, _5813);
    float _5845 = fma(_5355, _5825, _5815);
    float _5847 = fma(_5833, (*spvDescriptorSet0.vp_c9)._m0[68].x, _5835);
    float _5849 = precise::max(0.0, _5823);
    float _5851 = fma(_5839, (*spvDescriptorSet0.vp_c9)._m0[37].y, _5819);
    float _5853 = precise::max(0.0, _5831);
    float _5855 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _5857 = _5811 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _5859 = precise::max(0.0, _5841);
    float _5861 = -_1549;
    float _5863 = (-0.0) + _5861;
    float _5865 = precise::max(0.0, _5843);
    float _5867 = sqrt(_1559);
    float _5869 = precise::max(0.0, _5845);
    float _5871 = _5851 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _5873 = fma(_5849, (*spvDescriptorSet0.vp_c9)._m0[68].y, _5855);
    float _5875 = fma(_5853, (*spvDescriptorSet0.vp_c9)._m0[68].z, _5857);
    float _5877 = -_1557;
    float _5879 = (-0.0) + _5877;
    float _5881 = fma(_5859, _5871, _5847);
    float _5883 = fma(_5865, _5871, _5873);
    float _5885 = -_1185;
    float _5887 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _5889 = _5885 + _5887;
    float _5891 = fma(_5869, _5871, _5875);
    out.m_60.x = _5513;
    out.m_60.y = _5517;
    out.m_60.z = _5519;
    float _5893 = _5889 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_58.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    out.m_62.w = _1185;
    out.m_64.x = _5863;
    out.m_64.y = _1563;
    out.m_64.z = _5879;
    out.m_58.w = _5867;
    out.m_64.w = _5893;
    out.m_62.x = _5881;
    out.m_62.y = _5883;
    out.m_62.z = _5891;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

