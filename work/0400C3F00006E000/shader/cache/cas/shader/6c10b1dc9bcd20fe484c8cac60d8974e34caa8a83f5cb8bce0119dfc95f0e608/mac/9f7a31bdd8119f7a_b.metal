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
    constant _16* vp_c12 [[id(5)]];
    constant _16* vp_c4 [[id(6)]];
    texture2d_array<float> vp_t_tcb_A [[id(7)]];
    sampler vp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> vp_t_tcb_8 [[id(9)]];
    sampler vp_t_tcb_8Smplr [[id(10)]];
    sampler vp_t_tcb_ASmplr_w [[id(11)]];
    sampler vp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
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
    bool _1156 = false;
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
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _73 = _67 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_64, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _89 = fma(_71, _58, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _91 = _73 == 80;
    float _93 = as_type<float>(gl_BaseInstance);
    if (_77)
    {
        _93 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _95 = _93;
    float _97 = -_87;
    float _99 = _97 + _89;
    bool _101 = _73 == 96;
    float _103 = fma(_99, _60, _87);
    float _105 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _107 = 0.0;
    float _109 = _95;
    if (_77)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _111 = _107;
    float _113 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _115 = _103 + _113;
    float _117 = _111;
    if (_79)
    {
        _109 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _119 = _109;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _123 = _105 + _121;
    float _125 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _127 = _115 * _115;
    bool _129 = _73 == 112;
    float _131 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _133 = _125 + _131;
    float _135 = fma(_123, _123, _127);
    float _137 = _119;
    if (_79)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _117;
    float _141 = _139;
    if (_81)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = fma(_133, _133, _135);
    bool _147 = _73 == 128;
    float _149 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = rsqrt(_145);
    float _155 = _151;
    if (_83)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _157 = _149;
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
    float _175 = _173;
    if (_91)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _171;
    bool _179 = _73 == 176;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _185 = _175;
    bool _187 = _73 == 192;
    float _189 = _185;
    if (_101)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _183;
    float _193 = log2(_181);
    float _195 = _191;
    if (_101)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _197 = _189;
    float _199 = _197;
    if (_129)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _201 = _195;
    bool _203 = _73 == 208;
    float _205 = _201;
    if (_129)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _207 = _199;
    float _209 = _207;
    if (_147)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _211 = _205;
    bool _213 = _73 == 224;
    float _215 = _211;
    if (_147)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_159)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _215;
    float _223 = _193 + 1.2999999523162841796875;
    bool _225 = _73 == 240;
    float _227 = _221;
    if (_159)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _229 = _219;
    float _231 = _229;
    if (_169)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _233 = _227;
    float _235 = trunc(_223);
    int _237 = int(_235);
    bool _239 = _73 == 256;
    float _241 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _243 = _231;
    float _245 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _247 = _241;
    bool _249 = _73 == 272;
    float _251 = _247;
    if (_179)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_187)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _257 = _251;
    bool _259 = _73 == 288;
    float _261 = _257;
    if (_187)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _255;
    int _265 = min(_237, 15);
    bool _267 = _73 == 304;
    float _269 = _263;
    if (_203)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _271 = _261;
    float _273 = float(_265);
    float _275 = _271;
    if (_203)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _277 = _269;
    int _279 = _265 << 4;
    int _281 = _279 + 4288;
    float _283 = _277;
    if (_213)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _285 = _275;
    bool _287 = _73 == 320;
    float _289 = -_273;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _293 = _285;
    if (_213)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _295 = _283;
    float _297 = _295;
    if (_225)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _299 = _293;
    float _301 = _291 + 1.0;
    bool _303 = _73 == 336;
    float _305 = _299;
    if (_225)
    {
        _297 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _307 = _297;
    float _309 = _307;
    if (_239)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _311 = _305;
    float _313 = exp2(_301);
    bool _315 = _73 == 352;
    float _317 = _311;
    if (_239)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _319 = _309;
    float _321 = _319;
    if (_249)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _323 = _317;
    bool _325 = _73 == 368;
    float _327 = _323;
    if (_249)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _329 = _321;
    float _331 = _329;
    if (_259)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _333 = _327;
    bool _335 = _73 == 384;
    float _337 = _333;
    if (_259)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _339 = _331;
    float _341 = 1.0 / _313;
    float _343 = _339;
    if (_267)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _345 = _337;
    bool _347 = _73 == 400;
    float _349 = _345;
    if (_267)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _351 = _343;
    bool _353 = _73 == 416;
    float _355 = _351;
    if (_287)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _357 = _349;
    float _359 = _357;
    if (_287)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _361 = _355;
    float _363 = _361;
    if (_303)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _365 = _359;
    bool _367 = _73 == 432;
    float _369 = _365;
    if (_303)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _371 = _363;
    float _373 = _371;
    if (_315)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _375 = _369;
    bool _377 = _73 == 448;
    float _379 = _375;
    if (_315)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _381 = _373;
    float _383 = _381;
    if (_325)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _385 = _379;
    bool _387 = _73 == 464;
    float _389 = _385;
    if (_325)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _391 = _383;
    float _393 = _391;
    if (_335)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _395 = _389;
    bool _397 = _73 == 480;
    float _399 = _395;
    if (_335)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _401 = _393;
    float _403 = _401;
    if (_347)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _405 = _399;
    bool _407 = _73 == 496;
    float _409 = _405;
    if (_347)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _411 = _403;
    float _413 = _411;
    if (_353)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _415 = _409;
    bool _417 = _73 == 512;
    float _419 = _415;
    if (_353)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _421 = _413;
    bool _423 = _73 == 528;
    float _425 = _421;
    if (_367)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _427 = _419;
    float _429 = _427;
    if (_367)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _431 = _425;
    float _433 = _431;
    if (_377)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _435 = _429;
    bool _437 = _73 == 544;
    float _439 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _441 = _433;
    float _443 = _441;
    if (_387)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _445 = _439;
    bool _447 = _73 == 560;
    float _449 = _445;
    if (_387)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _451 = _443;
    float _453 = _451;
    if (_397)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _455 = _449;
    bool _457 = _73 == 576;
    float _459 = _455;
    if (_397)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _461 = _453;
    float _463 = _461;
    if (_407)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _465 = _459;
    bool _467 = _73 == 592;
    float _469 = _465;
    if (_407)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _471 = _463;
    float _473 = _471;
    if (_417)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _475 = _469;
    bool _477 = _73 == 608;
    float _479 = _475;
    if (_417)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _481 = _473;
    float _483 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _485 = _479;
    bool _487 = _73 == 624;
    float _489 = _485;
    if (_423)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _491 = _483;
    bool _493 = _73 == 640;
    float _495 = _491;
    if (_437)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _497 = _489;
    float _499 = _497;
    if (_437)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _501 = _495;
    float _503 = _501;
    if (_447)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _505 = _499;
    bool _507 = _73 == 656;
    float _509 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _511 = _503;
    float _513 = _511;
    if (_457)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _515 = _509;
    bool _517 = _73 == 672;
    float _519 = _515;
    if (_457)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _521 = _513;
    float _523 = _521;
    if (_467)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _525 = _519;
    bool _527 = _73 == 688;
    float _529 = _525;
    if (_467)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _531 = _523;
    float _533 = _531;
    if (_477)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _535 = _529;
    bool _537 = _73 == 704;
    float _539 = _535;
    if (_477)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _541 = _533;
    float _543 = _541;
    if (_487)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _545 = _539;
    bool _547 = _73 == 720;
    float _549 = _545;
    if (_487)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _551 = _543;
    float _553 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _555 = _549;
    bool _557 = _73 == 736;
    float _559 = _555;
    if (_493)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _561 = _553;
    bool _563 = _73 == 752;
    float _565 = _561;
    if (_507)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _567 = _559;
    float _569 = _567;
    if (_517)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _571 = _569;
    float _573 = _571;
    if (_527)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _575 = _573;
    float _577 = _575;
    if (_537)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_547)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_557)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_563)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _591 = _589;
    float _593 = _341 * _591;
    if (_507)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _595 = _565;
    float _597 = _595;
    if (_517)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _599 = _597;
    float _601 = _593 * _58;
    float _603 = _593 * _60;
    float _605 = _599;
    if (_527)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _607 = _605;
    float _609 = floor(_601);
    float _611 = _607;
    if (_537)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _613 = _611;
    float _615 = _613;
    if (_547)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _617 = _615;
    float _619 = _617;
    if (_557)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_563)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _625 = _623;
    float _627 = floor(_603);
    float _629 = _313 * _625;
    float _631 = -_609;
    float _633 = _601 + _631;
    float _635 = _633 * 2.0;
    float _637 = -_633;
    float _639 = fma(_629, _637, _58);
    int _641 = _281 + 8;
    uint _644 = uint(int(uint(_641) >> uint(2)));
    uint _646 = uint(int(uint(int(_644)) >> uint(2)));
    int _648 = int(_644) & 3;
    float _650 = (*spvDescriptorSet0.vp_c14)._m0[int(_646)][_648];
    int _652 = int(_644) + 1;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    int _656 = _652 & 3;
    float _658 = (*spvDescriptorSet0.vp_c14)._m0[int(_654)][_656];
    float _660 = -_627;
    float _662 = _603 + _660;
    float _664 = floor(_635);
    float _666 = _662 * 2.0;
    float _668 = -_662;
    float _670 = fma(_629, _668, _60);
    float _672 = floor(_666);
    float _674 = _629 * _664;
    float _676 = _674 * 0.5;
    float _678 = _676 + _639;
    float _680 = fma(_64, _678, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _682 = _629 * _672;
    float _684 = _682 * 0.5;
    float _686 = fma(_71, _678, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _690 = _684 + _670;
    float _692 = -_680;
    float _694 = _692 + _686;
    float _696 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _698 = _688 + _696;
    float _700 = fma(_690, _694, _680);
    float _702 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _704 = _700 + _702;
    float _706 = fma(_690, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _708 = _704 * _704;
    float _710 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _712 = _706 + _710;
    float _714 = fma(_698, _698, _708);
    float _716 = fma(_712, _712, _714);
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _720 = sqrt(_716);
    int _722 = _718 + 76;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c6)._m0[int(_726)][_728];
    uint _732 = uint(int(uint(_718) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.vp_c6)._m0[int(_734)][_736];
    float _740 = -_658;
    float _742 = fma(_720, _650, _740);
    float _744 = precise::clamp(_742, 0.0, 1.0);
    float _746 = -_676;
    float _748 = fma(_746, _744, _678);
    float _750 = -_684;
    float _752 = fma(_750, _744, _690);
    float _754 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _756 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _758 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _760 = _754 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _764 = _756 + _762;
    float _766 = abs(_760);
    float _768 = abs(_764);
    float _770 = precise::max(_766, _768);
    float _772 = _730 + 8.0;
    float _774 = _772 + _770;
    float _776 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _780 = _774 * _738;
    float _782 = _780 * 4.0;
    float _784 = precise::max(_782, 1.0);
    float _786 = log2(_784);
    float _788 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _790 = _754 + _788;
    float _792 = trunc(_786);
    int _794 = int(_792);
    float _796 = floor(_786);
    int _798 = min(_794, 4);
    int _800 = _798 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _802 = _800 << 4;
    float _804 = _796 + 1.0;
    float _806 = rint(_796);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    uint _812 = clamp(_810, 0u, 65535u);
    float _814 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _816 = _756 + _814;
    uint _818 = uint(int(uint(_802) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c6)._m0[int(_820)][_822];
    float _826 = rint(_804);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    int _834 = _802 + 16;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c6)._m0[int(_838)][_840];
    float _844 = fma(_816, _824, 0.5);
    float _846 = fma(_790, _824, 0.5);
    float _848 = fma(_816, _842, 0.5);
    float _850 = fma(_790, _842, 0.5);
    float _852 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
    float _854 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _778);
    float3 _2576 = float3(_846, _844, float(int(_812)));
    float3 _2580 = select(_2576, float3(0.0), isnan(_2576));
    float3 _858 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2580.xy, uint(rint(_2580.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2580.xy, uint(rint(_2580.z)), level(0.0)).xyz;
    float _860 = _858.x;
    float _862 = _858.y;
    float _864 = _858.z;
    float3 _2595 = float3(_850, _848, float(int(_832)));
    float3 _2597 = select(_2595, float3(0.0), isnan(_2595));
    float3 _866 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2597.xy, uint(rint(_2597.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2597.xy, uint(rint(_2597.z)), level(0.0)).xyz;
    float _868 = _866.x;
    float _870 = _866.y;
    float _872 = _866.z;
    float2 _2610 = float2(_852, _854);
    float _874 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2610, float2(0.0), isnan(_2610)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2610, float2(0.0), isnan(_2610)), level(0.0)).x;
    float _876 = _754 * 0.00012500000593718141317367553710938;
    float _878 = _756 * 0.00012500000593718141317367553710938;
    float _880 = -_796;
    float _882 = _786 + _880;
    float _884 = abs(_876);
    float _886 = abs(_878);
    float _888 = precise::max(_884, _886);
    float _890 = fma(_882, 5.42372894287109375, -4.338983058929443359375);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = fma(_888, 20.0, -19.0);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = -_896;
    float _900 = _898 + 1.0;
    float _902 = -_864;
    float _904 = _902 + _872;
    float _906 = -_860;
    float _908 = _906 + _868;
    float _910 = -_862;
    float _912 = _910 + _870;
    float _914 = fma(_892, _904, _864);
    float _916 = fma(_892, _908, _860);
    float _918 = fma(_892, _912, _862);
    float _920 = fma(_900, _914, _756);
    float _922 = fma(_900, _916, _754);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _926 = _920 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _930 = _922 + _928;
    float _932 = fma(_874, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _934 = _926 * _926;
    float _936 = fma(_900, _918, _932);
    float _938 = fma(_930, _930, _934);
    bool _940 = _938 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _942 = isnan(_938);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _948 = _944 || _946;
    float _950 = _862;
    float _952 = _934;
    float _954 = _938;
    float _956 = _936;
    if (!_948)
    {
        _950 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _958 = _950;
    float _960 = _958;
    if (!_948)
    {
        float _962 = -_938;
        float _964 = _962 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _952 = _964;
    }
    float _966 = _952;
    float _968 = _966;
    if (!_948)
    {
        float _970 = -_966;
        float _972 = fma(_970, _958, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _974;
    if (!_948)
    {
        float _978 = _938 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _960 = _978;
    }
    float _980 = _960;
    if (!_948)
    {
        float _982 = precise::min(_936, _974);
        _976 = _982;
    }
    float _984 = _976;
    if (!_948)
    {
        float _986 = -_984;
        float _988 = _936 + _986;
        _954 = _988;
    }
    float _990 = _954;
    if (!_948)
    {
        float _992 = fma(_980, _990, _984);
        _956 = _992;
    }
    float _994 = _956;
    bool _996 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _998 = _994 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1000 = _994 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1002 = _994 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1004 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[0].x, _998);
    float _1006 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1000);
    float _1008 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1002);
    float _1010 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1004);
    float _1012 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1006);
    float _1014 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1020 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1022 = _1014;
    float _1024 = _1012;
    int _1148;
    int _1150;
    int _1152;
    int _1154;
    if (!_996)
    {
        float _1026 = _926 * _926;
        float _1028 = fma(_930, _930, _1026);
        float _1030 = sqrt(_1028);
        bool _1032 = _1030 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1034 = _1026;
        if (!_1032)
        {
            _1022 = _1020;
        }
        float _1036 = _1022;
        float _1038 = _1036;
        if (!_1032)
        {
            _1024 = _1018;
        }
        float _1040 = _1024;
        float _1042 = _1040;
        if (!_1032)
        {
            _1034 = _1016;
        }
        float _1044 = _1034;
        bool _1046 = !_1032;
        float _1048 = _1044;
        if (!_1046)
        {
            float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _1054 = _1030 + _1052;
            float _1056 = _994 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1058 = rsqrt(_1028);
            float _1060 = _1054 * _1050;
            float _1062 = _1060 * 0.15915493667125701904296875;
            float _1064 = _1062 * 6.283185482025146484375;
            float _1066 = cos(_1064);
            float _1068 = _1062 * 6.283185482025146484375;
            float _1070 = sin(_1068);
            float _1072 = _1066 + (-1.0);
            float _1074 = fma(_1070, _1056, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1078 = _1058 * _1074;
            float _1080 = fma(_1066, _994, _1076);
            float _1082 = fma(_930, _1078, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _1084 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _1086 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _1088 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _1090 = fma(_926, _1078, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1084);
            float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1086);
            float _1096 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1088);
            float _1098 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1092);
            float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1094);
            float _1102 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1096);
            float _1104 = _1098 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _1106 = _1100 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _1108 = _1102 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _1042 = _1106;
            _1048 = _1104;
            _1038 = _1108;
        }
        float _1110 = _1042;
        float _1112 = _1048;
        float _1114 = _1038;
        float _1116 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _1118 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _1120 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _1122 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _1124 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1116);
        float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1118);
        float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1120);
        float _1130 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1122);
        float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1124);
        float _1134 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1126);
        float _1136 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1128);
        float _1138 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1130);
        float _1140 = _1132 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _1142 = _1134 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _1144 = _1136 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _1146 = _1138 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _1148 = as_type<int>(_1140);
        _1150 = as_type<int>(_1142);
        _1152 = as_type<int>(_1144);
        _1154 = as_type<int>(_1146);
        _1156 = true;
    }
    else
    {
        float _1158 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _1160 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _1162 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _1164 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _1166 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1158);
        float _1168 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1160);
        float _1170 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1162);
        float _1172 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1164);
        float _1174 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1166);
        float _1176 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1168);
        float _1178 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1170);
        float _1180 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1172);
        float _1182 = _1174 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _1184 = _1176 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _1186 = _1178 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _1188 = _1180 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _1148 = as_type<int>(_1182);
        _1150 = as_type<int>(_1184);
        _1152 = as_type<int>(_1186);
        _1154 = as_type<int>(_1188);
    }
    _1156 = false;
    int _1190 = _1148;
    int _1192 = _1150;
    int _1194 = _1152;
    int _1196 = _1154;
    float _3206 = as_type<float>(_1190);
    out.gl_Position.x = _3206;
    float _3209 = as_type<float>(_1192);
    out.gl_Position.y = _3209;
    float _3212 = as_type<float>(_1194);
    out.gl_Position.z = _3212;
    float _3215 = as_type<float>(_1196);
    out.gl_Position.w = _3215;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    bool _1156 = false;
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
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _73 = _67 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_64, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _89 = fma(_71, _58, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _91 = _73 == 80;
    float _93 = as_type<float>(gl_BaseInstance);
    if (_77)
    {
        _93 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _95 = _93;
    float _97 = -_87;
    float _99 = _97 + _89;
    bool _101 = _73 == 96;
    float _103 = fma(_99, _60, _87);
    float _105 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _107 = 0.0;
    float _109 = _95;
    if (_77)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _111 = _107;
    float _113 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _115 = _103 + _113;
    float _117 = _111;
    if (_79)
    {
        _109 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _119 = _109;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _123 = _105 + _121;
    float _125 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _127 = _115 * _115;
    bool _129 = _73 == 112;
    float _131 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _133 = _125 + _131;
    float _135 = fma(_123, _123, _127);
    float _137 = _119;
    if (_79)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _117;
    float _141 = _139;
    if (_81)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = fma(_133, _133, _135);
    bool _147 = _73 == 128;
    float _149 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = rsqrt(_145);
    float _155 = _151;
    if (_83)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _157 = _149;
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
    float _175 = _173;
    if (_91)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _171;
    bool _179 = _73 == 176;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _185 = _175;
    bool _187 = _73 == 192;
    float _189 = _185;
    if (_101)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _183;
    float _193 = log2(_181);
    float _195 = _191;
    if (_101)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _197 = _189;
    float _199 = _197;
    if (_129)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _201 = _195;
    bool _203 = _73 == 208;
    float _205 = _201;
    if (_129)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _207 = _199;
    float _209 = _207;
    if (_147)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _211 = _205;
    bool _213 = _73 == 224;
    float _215 = _211;
    if (_147)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_159)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _215;
    float _223 = _193 + 1.2999999523162841796875;
    bool _225 = _73 == 240;
    float _227 = _221;
    if (_159)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _229 = _219;
    float _231 = _229;
    if (_169)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _233 = _227;
    float _235 = trunc(_223);
    int _237 = int(_235);
    bool _239 = _73 == 256;
    float _241 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _243 = _231;
    float _245 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _247 = _241;
    bool _249 = _73 == 272;
    float _251 = _247;
    if (_179)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_187)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _257 = _251;
    bool _259 = _73 == 288;
    float _261 = _257;
    if (_187)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _255;
    int _265 = min(_237, 15);
    bool _267 = _73 == 304;
    float _269 = _263;
    if (_203)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _271 = _261;
    float _273 = float(_265);
    float _275 = _271;
    if (_203)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _277 = _269;
    int _279 = _265 << 4;
    int _281 = _279 + 4288;
    float _283 = _277;
    if (_213)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _285 = _275;
    bool _287 = _73 == 320;
    float _289 = -_273;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _293 = _285;
    if (_213)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _295 = _283;
    float _297 = _295;
    if (_225)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _299 = _293;
    float _301 = _291 + 1.0;
    bool _303 = _73 == 336;
    float _305 = _299;
    if (_225)
    {
        _297 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _307 = _297;
    float _309 = _307;
    if (_239)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _311 = _305;
    float _313 = exp2(_301);
    bool _315 = _73 == 352;
    float _317 = _311;
    if (_239)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _319 = _309;
    float _321 = _319;
    if (_249)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _323 = _317;
    bool _325 = _73 == 368;
    float _327 = _323;
    if (_249)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _329 = _321;
    float _331 = _329;
    if (_259)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _333 = _327;
    bool _335 = _73 == 384;
    float _337 = _333;
    if (_259)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _339 = _331;
    float _341 = 1.0 / _313;
    float _343 = _339;
    if (_267)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _345 = _337;
    bool _347 = _73 == 400;
    float _349 = _345;
    if (_267)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _351 = _343;
    bool _353 = _73 == 416;
    float _355 = _351;
    if (_287)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _357 = _349;
    float _359 = _357;
    if (_287)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _361 = _355;
    float _363 = _361;
    if (_303)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _365 = _359;
    bool _367 = _73 == 432;
    float _369 = _365;
    if (_303)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _371 = _363;
    float _373 = _371;
    if (_315)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _375 = _369;
    bool _377 = _73 == 448;
    float _379 = _375;
    if (_315)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _381 = _373;
    float _383 = _381;
    if (_325)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _385 = _379;
    bool _387 = _73 == 464;
    float _389 = _385;
    if (_325)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _391 = _383;
    float _393 = _391;
    if (_335)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _395 = _389;
    bool _397 = _73 == 480;
    float _399 = _395;
    if (_335)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _401 = _393;
    float _403 = _401;
    if (_347)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _405 = _399;
    bool _407 = _73 == 496;
    float _409 = _405;
    if (_347)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _411 = _403;
    float _413 = _411;
    if (_353)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _415 = _409;
    bool _417 = _73 == 512;
    float _419 = _415;
    if (_353)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _421 = _413;
    bool _423 = _73 == 528;
    float _425 = _421;
    if (_367)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _427 = _419;
    float _429 = _427;
    if (_367)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _431 = _425;
    float _433 = _431;
    if (_377)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _435 = _429;
    bool _437 = _73 == 544;
    float _439 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _441 = _433;
    float _443 = _441;
    if (_387)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _445 = _439;
    bool _447 = _73 == 560;
    float _449 = _445;
    if (_387)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _451 = _443;
    float _453 = _451;
    if (_397)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _455 = _449;
    bool _457 = _73 == 576;
    float _459 = _455;
    if (_397)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _461 = _453;
    float _463 = _461;
    if (_407)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _465 = _459;
    bool _467 = _73 == 592;
    float _469 = _465;
    if (_407)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _471 = _463;
    float _473 = _471;
    if (_417)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _475 = _469;
    bool _477 = _73 == 608;
    float _479 = _475;
    if (_417)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _481 = _473;
    float _483 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _485 = _479;
    bool _487 = _73 == 624;
    float _489 = _485;
    if (_423)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _491 = _483;
    bool _493 = _73 == 640;
    float _495 = _491;
    if (_437)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _497 = _489;
    float _499 = _497;
    if (_437)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _501 = _495;
    float _503 = _501;
    if (_447)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _505 = _499;
    bool _507 = _73 == 656;
    float _509 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _511 = _503;
    float _513 = _511;
    if (_457)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _515 = _509;
    bool _517 = _73 == 672;
    float _519 = _515;
    if (_457)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _521 = _513;
    float _523 = _521;
    if (_467)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _525 = _519;
    bool _527 = _73 == 688;
    float _529 = _525;
    if (_467)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _531 = _523;
    float _533 = _531;
    if (_477)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _535 = _529;
    bool _537 = _73 == 704;
    float _539 = _535;
    if (_477)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _541 = _533;
    float _543 = _541;
    if (_487)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _545 = _539;
    bool _547 = _73 == 720;
    float _549 = _545;
    if (_487)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _551 = _543;
    float _553 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _555 = _549;
    bool _557 = _73 == 736;
    float _559 = _555;
    if (_493)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _561 = _553;
    bool _563 = _73 == 752;
    float _565 = _561;
    if (_507)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _567 = _559;
    float _569 = _567;
    if (_517)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _571 = _569;
    float _573 = _571;
    if (_527)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _575 = _573;
    float _577 = _575;
    if (_537)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_547)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_557)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_563)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _591 = _589;
    float _593 = _341 * _591;
    if (_507)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _595 = _565;
    float _597 = _595;
    if (_517)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _599 = _597;
    float _601 = _593 * _58;
    float _603 = _593 * _60;
    float _605 = _599;
    if (_527)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _607 = _605;
    float _609 = floor(_601);
    float _611 = _607;
    if (_537)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _613 = _611;
    float _615 = _613;
    if (_547)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _617 = _615;
    float _619 = _617;
    if (_557)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_563)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _625 = _623;
    float _627 = floor(_603);
    float _629 = _313 * _625;
    float _631 = -_609;
    float _633 = _601 + _631;
    float _635 = _633 * 2.0;
    float _637 = -_633;
    float _639 = fma(_629, _637, _58);
    int _641 = _281 + 8;
    uint _644 = uint(int(uint(_641) >> uint(2)));
    uint _646 = uint(int(uint(int(_644)) >> uint(2)));
    int _648 = int(_644) & 3;
    float _650 = (*spvDescriptorSet0.vp_c14)._m0[int(_646)][_648];
    int _652 = int(_644) + 1;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    int _656 = _652 & 3;
    float _658 = (*spvDescriptorSet0.vp_c14)._m0[int(_654)][_656];
    float _660 = -_627;
    float _662 = _603 + _660;
    float _664 = floor(_635);
    float _666 = _662 * 2.0;
    float _668 = -_662;
    float _670 = fma(_629, _668, _60);
    float _672 = floor(_666);
    float _674 = _629 * _664;
    float _676 = _674 * 0.5;
    float _678 = _676 + _639;
    float _680 = fma(_64, _678, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _682 = _629 * _672;
    float _684 = _682 * 0.5;
    float _686 = fma(_71, _678, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _690 = _684 + _670;
    float _692 = -_680;
    float _694 = _692 + _686;
    float _696 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _698 = _688 + _696;
    float _700 = fma(_690, _694, _680);
    float _702 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _704 = _700 + _702;
    float _706 = fma(_690, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _708 = _704 * _704;
    float _710 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _712 = _706 + _710;
    float _714 = fma(_698, _698, _708);
    float _716 = fma(_712, _712, _714);
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _720 = sqrt(_716);
    int _722 = _718 + 76;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c6)._m0[int(_726)][_728];
    uint _732 = uint(int(uint(_718) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.vp_c6)._m0[int(_734)][_736];
    float _740 = -_658;
    float _742 = fma(_720, _650, _740);
    float _744 = precise::clamp(_742, 0.0, 1.0);
    float _746 = -_676;
    float _748 = fma(_746, _744, _678);
    float _750 = -_684;
    float _752 = fma(_750, _744, _690);
    float _754 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _756 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _758 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _760 = _754 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _764 = _756 + _762;
    float _766 = abs(_760);
    float _768 = abs(_764);
    float _770 = precise::max(_766, _768);
    float _772 = _730 + 8.0;
    float _774 = _772 + _770;
    float _776 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _780 = _774 * _738;
    float _782 = _780 * 4.0;
    float _784 = precise::max(_782, 1.0);
    float _786 = log2(_784);
    float _788 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _790 = _754 + _788;
    float _792 = trunc(_786);
    int _794 = int(_792);
    float _796 = floor(_786);
    int _798 = min(_794, 4);
    int _800 = _798 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _802 = _800 << 4;
    float _804 = _796 + 1.0;
    float _806 = rint(_796);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    uint _812 = clamp(_810, 0u, 65535u);
    float _814 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _816 = _756 + _814;
    uint _818 = uint(int(uint(_802) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c6)._m0[int(_820)][_822];
    float _826 = rint(_804);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    int _834 = _802 + 16;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c6)._m0[int(_838)][_840];
    float _844 = fma(_816, _824, 0.5);
    float _846 = fma(_790, _824, 0.5);
    float _848 = fma(_816, _842, 0.5);
    float _850 = fma(_790, _842, 0.5);
    float _852 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
    float _854 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _778);
    float3 _2576 = float3(_846, _844, float(int(_812)));
    float3 _2580 = select(_2576, float3(0.0), isnan(_2576));
    float3 _858 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2580.xy, uint(rint(_2580.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2580.xy, uint(rint(_2580.z)), level(0.0)).xyz;
    float _860 = _858.x;
    float _862 = _858.y;
    float _864 = _858.z;
    float3 _2595 = float3(_850, _848, float(int(_832)));
    float3 _2597 = select(_2595, float3(0.0), isnan(_2595));
    float3 _866 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2597.xy, uint(rint(_2597.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2597.xy, uint(rint(_2597.z)), level(0.0)).xyz;
    float _868 = _866.x;
    float _870 = _866.y;
    float _872 = _866.z;
    float2 _2610 = float2(_852, _854);
    float _874 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2610, float2(0.0), isnan(_2610)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2610, float2(0.0), isnan(_2610)), level(0.0)).x;
    float _876 = _754 * 0.00012500000593718141317367553710938;
    float _878 = _756 * 0.00012500000593718141317367553710938;
    float _880 = -_796;
    float _882 = _786 + _880;
    float _884 = abs(_876);
    float _886 = abs(_878);
    float _888 = precise::max(_884, _886);
    float _890 = fma(_882, 5.42372894287109375, -4.338983058929443359375);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = fma(_888, 20.0, -19.0);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = -_896;
    float _900 = _898 + 1.0;
    float _902 = -_864;
    float _904 = _902 + _872;
    float _906 = -_860;
    float _908 = _906 + _868;
    float _910 = -_862;
    float _912 = _910 + _870;
    float _914 = fma(_892, _904, _864);
    float _916 = fma(_892, _908, _860);
    float _918 = fma(_892, _912, _862);
    float _920 = fma(_900, _914, _756);
    float _922 = fma(_900, _916, _754);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _926 = _920 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _930 = _922 + _928;
    float _932 = fma(_874, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _934 = _926 * _926;
    float _936 = fma(_900, _918, _932);
    float _938 = fma(_930, _930, _934);
    bool _940 = _938 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _942 = isnan(_938);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _948 = _944 || _946;
    float _950 = _862;
    float _952 = _934;
    float _954 = _938;
    float _956 = _936;
    if (!_948)
    {
        _950 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _958 = _950;
    float _960 = _958;
    if (!_948)
    {
        float _962 = -_938;
        float _964 = _962 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _952 = _964;
    }
    float _966 = _952;
    float _968 = _966;
    if (!_948)
    {
        float _970 = -_966;
        float _972 = fma(_970, _958, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _974;
    if (!_948)
    {
        float _978 = _938 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _960 = _978;
    }
    float _980 = _960;
    if (!_948)
    {
        float _982 = precise::min(_936, _974);
        _976 = _982;
    }
    float _984 = _976;
    if (!_948)
    {
        float _986 = -_984;
        float _988 = _936 + _986;
        _954 = _988;
    }
    float _990 = _954;
    if (!_948)
    {
        float _992 = fma(_980, _990, _984);
        _956 = _992;
    }
    float _994 = _956;
    bool _996 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _998 = _994 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1000 = _994 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1002 = _994 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1004 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[0].x, _998);
    float _1006 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1000);
    float _1008 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1002);
    float _1010 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1004);
    float _1012 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1006);
    float _1014 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1020 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1022 = _1014;
    float _1024 = _1012;
    int _1148;
    int _1150;
    int _1152;
    int _1154;
    if (!_996)
    {
        float _1026 = _926 * _926;
        float _1028 = fma(_930, _930, _1026);
        float _1030 = sqrt(_1028);
        bool _1032 = _1030 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1034 = _1026;
        if (!_1032)
        {
            _1022 = _1020;
        }
        float _1036 = _1022;
        float _1038 = _1036;
        if (!_1032)
        {
            _1024 = _1018;
        }
        float _1040 = _1024;
        float _1042 = _1040;
        if (!_1032)
        {
            _1034 = _1016;
        }
        float _1044 = _1034;
        bool _1046 = !_1032;
        float _1048 = _1044;
        if (!_1046)
        {
            float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _1054 = _1030 + _1052;
            float _1056 = _994 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1058 = rsqrt(_1028);
            float _1060 = _1054 * _1050;
            float _1062 = _1060 * 0.15915493667125701904296875;
            float _1064 = _1062 * 6.283185482025146484375;
            float _1066 = cos(_1064);
            float _1068 = _1062 * 6.283185482025146484375;
            float _1070 = sin(_1068);
            float _1072 = _1066 + (-1.0);
            float _1074 = fma(_1070, _1056, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1078 = _1058 * _1074;
            float _1080 = fma(_1066, _994, _1076);
            float _1082 = fma(_930, _1078, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _1084 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _1086 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _1088 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _1090 = fma(_926, _1078, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1084);
            float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1086);
            float _1096 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1088);
            float _1098 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1092);
            float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1094);
            float _1102 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1096);
            float _1104 = _1098 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _1106 = _1100 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _1108 = _1102 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _1042 = _1106;
            _1048 = _1104;
            _1038 = _1108;
        }
        float _1110 = _1042;
        float _1112 = _1048;
        float _1114 = _1038;
        float _1116 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _1118 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _1120 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _1122 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _1124 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1116);
        float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1118);
        float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1120);
        float _1130 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1122);
        float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1124);
        float _1134 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1126);
        float _1136 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1128);
        float _1138 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1130);
        float _1140 = _1132 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _1142 = _1134 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _1144 = _1136 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _1146 = _1138 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _1148 = as_type<int>(_1140);
        _1150 = as_type<int>(_1142);
        _1152 = as_type<int>(_1144);
        _1154 = as_type<int>(_1146);
        _1156 = true;
    }
    else
    {
        float _1158 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _1160 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _1162 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _1164 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _1166 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1158);
        float _1168 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1160);
        float _1170 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1162);
        float _1172 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1164);
        float _1174 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1166);
        float _1176 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1168);
        float _1178 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1170);
        float _1180 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1172);
        float _1182 = _1174 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _1184 = _1176 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _1186 = _1178 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _1188 = _1180 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _1148 = as_type<int>(_1182);
        _1150 = as_type<int>(_1184);
        _1152 = as_type<int>(_1186);
        _1154 = as_type<int>(_1188);
    }
    _1156 = false;
    int _1190 = _1148;
    int _1192 = _1150;
    int _1194 = _1152;
    int _1196 = _1154;
    float _3206 = as_type<float>(_1190);
    out.gl_Position.x = _3206;
    float _3209 = as_type<float>(_1192);
    out.gl_Position.y = _3209;
    float _3212 = as_type<float>(_1194);
    out.gl_Position.z = _3212;
    float _3215 = as_type<float>(_1196);
    out.gl_Position.w = _3215;
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
    bool _1156 = false;
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
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _73 = _67 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_64, _58, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _89 = fma(_71, _58, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _91 = _73 == 80;
    float _93 = as_type<float>(gl_BaseInstance);
    if (_77)
    {
        _93 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _95 = _93;
    float _97 = -_87;
    float _99 = _97 + _89;
    bool _101 = _73 == 96;
    float _103 = fma(_99, _60, _87);
    float _105 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _107 = 0.0;
    float _109 = _95;
    if (_77)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _111 = _107;
    float _113 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _115 = _103 + _113;
    float _117 = _111;
    if (_79)
    {
        _109 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _119 = _109;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _123 = _105 + _121;
    float _125 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _127 = _115 * _115;
    bool _129 = _73 == 112;
    float _131 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _133 = _125 + _131;
    float _135 = fma(_123, _123, _127);
    float _137 = _119;
    if (_79)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _117;
    float _141 = _139;
    if (_81)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _143 = _137;
    float _145 = fma(_133, _133, _135);
    bool _147 = _73 == 128;
    float _149 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _151 = _141;
    float _153 = rsqrt(_145);
    float _155 = _151;
    if (_83)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _157 = _149;
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
    float _175 = _173;
    if (_91)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _177 = _171;
    bool _179 = _73 == 176;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _185 = _175;
    bool _187 = _73 == 192;
    float _189 = _185;
    if (_101)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _191 = _183;
    float _193 = log2(_181);
    float _195 = _191;
    if (_101)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _197 = _189;
    float _199 = _197;
    if (_129)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _201 = _195;
    bool _203 = _73 == 208;
    float _205 = _201;
    if (_129)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _207 = _199;
    float _209 = _207;
    if (_147)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _211 = _205;
    bool _213 = _73 == 224;
    float _215 = _211;
    if (_147)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_159)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _221 = _215;
    float _223 = _193 + 1.2999999523162841796875;
    bool _225 = _73 == 240;
    float _227 = _221;
    if (_159)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _229 = _219;
    float _231 = _229;
    if (_169)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _233 = _227;
    float _235 = trunc(_223);
    int _237 = int(_235);
    bool _239 = _73 == 256;
    float _241 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _243 = _231;
    float _245 = _243;
    if (_179)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _247 = _241;
    bool _249 = _73 == 272;
    float _251 = _247;
    if (_179)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_187)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _257 = _251;
    bool _259 = _73 == 288;
    float _261 = _257;
    if (_187)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _263 = _255;
    int _265 = min(_237, 15);
    bool _267 = _73 == 304;
    float _269 = _263;
    if (_203)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _271 = _261;
    float _273 = float(_265);
    float _275 = _271;
    if (_203)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _277 = _269;
    int _279 = _265 << 4;
    int _281 = _279 + 4288;
    float _283 = _277;
    if (_213)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _285 = _275;
    bool _287 = _73 == 320;
    float _289 = -_273;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _293 = _285;
    if (_213)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _295 = _283;
    float _297 = _295;
    if (_225)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _299 = _293;
    float _301 = _291 + 1.0;
    bool _303 = _73 == 336;
    float _305 = _299;
    if (_225)
    {
        _297 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _307 = _297;
    float _309 = _307;
    if (_239)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _311 = _305;
    float _313 = exp2(_301);
    bool _315 = _73 == 352;
    float _317 = _311;
    if (_239)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _319 = _309;
    float _321 = _319;
    if (_249)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _323 = _317;
    bool _325 = _73 == 368;
    float _327 = _323;
    if (_249)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _329 = _321;
    float _331 = _329;
    if (_259)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _333 = _327;
    bool _335 = _73 == 384;
    float _337 = _333;
    if (_259)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _339 = _331;
    float _341 = 1.0 / _313;
    float _343 = _339;
    if (_267)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _345 = _337;
    bool _347 = _73 == 400;
    float _349 = _345;
    if (_267)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _351 = _343;
    bool _353 = _73 == 416;
    float _355 = _351;
    if (_287)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _357 = _349;
    float _359 = _357;
    if (_287)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _361 = _355;
    float _363 = _361;
    if (_303)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _365 = _359;
    bool _367 = _73 == 432;
    float _369 = _365;
    if (_303)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _371 = _363;
    float _373 = _371;
    if (_315)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _375 = _369;
    bool _377 = _73 == 448;
    float _379 = _375;
    if (_315)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _381 = _373;
    float _383 = _381;
    if (_325)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _385 = _379;
    bool _387 = _73 == 464;
    float _389 = _385;
    if (_325)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _391 = _383;
    float _393 = _391;
    if (_335)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _395 = _389;
    bool _397 = _73 == 480;
    float _399 = _395;
    if (_335)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _401 = _393;
    float _403 = _401;
    if (_347)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _405 = _399;
    bool _407 = _73 == 496;
    float _409 = _405;
    if (_347)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _411 = _403;
    float _413 = _411;
    if (_353)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _415 = _409;
    bool _417 = _73 == 512;
    float _419 = _415;
    if (_353)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _421 = _413;
    bool _423 = _73 == 528;
    float _425 = _421;
    if (_367)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _427 = _419;
    float _429 = _427;
    if (_367)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _431 = _425;
    float _433 = _431;
    if (_377)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _435 = _429;
    bool _437 = _73 == 544;
    float _439 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _441 = _433;
    float _443 = _441;
    if (_387)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _445 = _439;
    bool _447 = _73 == 560;
    float _449 = _445;
    if (_387)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _451 = _443;
    float _453 = _451;
    if (_397)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _455 = _449;
    bool _457 = _73 == 576;
    float _459 = _455;
    if (_397)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _461 = _453;
    float _463 = _461;
    if (_407)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _465 = _459;
    bool _467 = _73 == 592;
    float _469 = _465;
    if (_407)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _471 = _463;
    float _473 = _471;
    if (_417)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _475 = _469;
    bool _477 = _73 == 608;
    float _479 = _475;
    if (_417)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _481 = _473;
    float _483 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _485 = _479;
    bool _487 = _73 == 624;
    float _489 = _485;
    if (_423)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _491 = _483;
    bool _493 = _73 == 640;
    float _495 = _491;
    if (_437)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _497 = _489;
    float _499 = _497;
    if (_437)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _501 = _495;
    float _503 = _501;
    if (_447)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _505 = _499;
    bool _507 = _73 == 656;
    float _509 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _511 = _503;
    float _513 = _511;
    if (_457)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _515 = _509;
    bool _517 = _73 == 672;
    float _519 = _515;
    if (_457)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _521 = _513;
    float _523 = _521;
    if (_467)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _525 = _519;
    bool _527 = _73 == 688;
    float _529 = _525;
    if (_467)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _531 = _523;
    float _533 = _531;
    if (_477)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _535 = _529;
    bool _537 = _73 == 704;
    float _539 = _535;
    if (_477)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _541 = _533;
    float _543 = _541;
    if (_487)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _545 = _539;
    bool _547 = _73 == 720;
    float _549 = _545;
    if (_487)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _551 = _543;
    float _553 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _555 = _549;
    bool _557 = _73 == 736;
    float _559 = _555;
    if (_493)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _561 = _553;
    bool _563 = _73 == 752;
    float _565 = _561;
    if (_507)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _567 = _559;
    float _569 = _567;
    if (_517)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _571 = _569;
    float _573 = _571;
    if (_527)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _575 = _573;
    float _577 = _575;
    if (_537)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_547)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_557)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_563)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _591 = _589;
    float _593 = _341 * _591;
    if (_507)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _595 = _565;
    float _597 = _595;
    if (_517)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _599 = _597;
    float _601 = _593 * _58;
    float _603 = _593 * _60;
    float _605 = _599;
    if (_527)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _607 = _605;
    float _609 = floor(_601);
    float _611 = _607;
    if (_537)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _613 = _611;
    float _615 = _613;
    if (_547)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _617 = _615;
    float _619 = _617;
    if (_557)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_563)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _625 = _623;
    float _627 = floor(_603);
    float _629 = _313 * _625;
    float _631 = -_609;
    float _633 = _601 + _631;
    float _635 = _633 * 2.0;
    float _637 = -_633;
    float _639 = fma(_629, _637, _58);
    int _641 = _281 + 8;
    uint _644 = uint(int(uint(_641) >> uint(2)));
    uint _646 = uint(int(uint(int(_644)) >> uint(2)));
    int _648 = int(_644) & 3;
    float _650 = (*spvDescriptorSet0.vp_c14)._m0[int(_646)][_648];
    int _652 = int(_644) + 1;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    int _656 = _652 & 3;
    float _658 = (*spvDescriptorSet0.vp_c14)._m0[int(_654)][_656];
    float _660 = -_627;
    float _662 = _603 + _660;
    float _664 = floor(_635);
    float _666 = _662 * 2.0;
    float _668 = -_662;
    float _670 = fma(_629, _668, _60);
    float _672 = floor(_666);
    float _674 = _629 * _664;
    float _676 = _674 * 0.5;
    float _678 = _676 + _639;
    float _680 = fma(_64, _678, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _682 = _629 * _672;
    float _684 = _682 * 0.5;
    float _686 = fma(_71, _678, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _690 = _684 + _670;
    float _692 = -_680;
    float _694 = _692 + _686;
    float _696 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _698 = _688 + _696;
    float _700 = fma(_690, _694, _680);
    float _702 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _704 = _700 + _702;
    float _706 = fma(_690, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _708 = _704 * _704;
    float _710 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _712 = _706 + _710;
    float _714 = fma(_698, _698, _708);
    float _716 = fma(_712, _712, _714);
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _720 = sqrt(_716);
    int _722 = _718 + 76;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c6)._m0[int(_726)][_728];
    uint _732 = uint(int(uint(_718) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.vp_c6)._m0[int(_734)][_736];
    float _740 = -_658;
    float _742 = fma(_720, _650, _740);
    float _744 = precise::clamp(_742, 0.0, 1.0);
    float _746 = -_676;
    float _748 = fma(_746, _744, _678);
    float _750 = -_684;
    float _752 = fma(_750, _744, _690);
    float _754 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _756 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _758 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _760 = _754 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _764 = _756 + _762;
    float _766 = abs(_760);
    float _768 = abs(_764);
    float _770 = precise::max(_766, _768);
    float _772 = _730 + 8.0;
    float _774 = _772 + _770;
    float _776 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _780 = _774 * _738;
    float _782 = _780 * 4.0;
    float _784 = precise::max(_782, 1.0);
    float _786 = log2(_784);
    float _788 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _790 = _754 + _788;
    float _792 = trunc(_786);
    int _794 = int(_792);
    float _796 = floor(_786);
    int _798 = min(_794, 4);
    int _800 = _798 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _802 = _800 << 4;
    float _804 = _796 + 1.0;
    float _806 = rint(_796);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    uint _812 = clamp(_810, 0u, 65535u);
    float _814 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _816 = _756 + _814;
    uint _818 = uint(int(uint(_802) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c6)._m0[int(_820)][_822];
    float _826 = rint(_804);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    uint _832 = clamp(_830, 0u, 65535u);
    int _834 = _802 + 16;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c6)._m0[int(_838)][_840];
    float _844 = fma(_816, _824, 0.5);
    float _846 = fma(_790, _824, 0.5);
    float _848 = fma(_816, _842, 0.5);
    float _850 = fma(_790, _842, 0.5);
    float _852 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
    float _854 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _778);
    float3 _2576 = float3(_846, _844, float(int(_812)));
    float3 _2580 = select(_2576, float3(0.0), isnan(_2576));
    float3 _858 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2580.xy, uint(rint(_2580.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2580.xy, uint(rint(_2580.z)), level(0.0)).xyz;
    float _860 = _858.x;
    float _862 = _858.y;
    float _864 = _858.z;
    float3 _2595 = float3(_850, _848, float(int(_832)));
    float3 _2597 = select(_2595, float3(0.0), isnan(_2595));
    float3 _866 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2597.xy, uint(rint(_2597.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2597.xy, uint(rint(_2597.z)), level(0.0)).xyz;
    float _868 = _866.x;
    float _870 = _866.y;
    float _872 = _866.z;
    float2 _2610 = float2(_852, _854);
    float _874 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2610, float2(0.0), isnan(_2610)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2610, float2(0.0), isnan(_2610)), level(0.0)).x;
    float _876 = _754 * 0.00012500000593718141317367553710938;
    float _878 = _756 * 0.00012500000593718141317367553710938;
    float _880 = -_796;
    float _882 = _786 + _880;
    float _884 = abs(_876);
    float _886 = abs(_878);
    float _888 = precise::max(_884, _886);
    float _890 = fma(_882, 5.42372894287109375, -4.338983058929443359375);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = fma(_888, 20.0, -19.0);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = -_896;
    float _900 = _898 + 1.0;
    float _902 = -_864;
    float _904 = _902 + _872;
    float _906 = -_860;
    float _908 = _906 + _868;
    float _910 = -_862;
    float _912 = _910 + _870;
    float _914 = fma(_892, _904, _864);
    float _916 = fma(_892, _908, _860);
    float _918 = fma(_892, _912, _862);
    float _920 = fma(_900, _914, _756);
    float _922 = fma(_900, _916, _754);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _926 = _920 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _930 = _922 + _928;
    float _932 = fma(_874, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _934 = _926 * _926;
    float _936 = fma(_900, _918, _932);
    float _938 = fma(_930, _930, _934);
    bool _940 = _938 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _942 = isnan(_938);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _948 = _944 || _946;
    float _950 = _862;
    float _952 = _934;
    float _954 = _938;
    float _956 = _936;
    if (!_948)
    {
        _950 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _958 = _950;
    float _960 = _958;
    if (!_948)
    {
        float _962 = -_938;
        float _964 = _962 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _952 = _964;
    }
    float _966 = _952;
    float _968 = _966;
    if (!_948)
    {
        float _970 = -_966;
        float _972 = fma(_970, _958, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _974;
    if (!_948)
    {
        float _978 = _938 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _960 = _978;
    }
    float _980 = _960;
    if (!_948)
    {
        float _982 = precise::min(_936, _974);
        _976 = _982;
    }
    float _984 = _976;
    if (!_948)
    {
        float _986 = -_984;
        float _988 = _936 + _986;
        _954 = _988;
    }
    float _990 = _954;
    if (!_948)
    {
        float _992 = fma(_980, _990, _984);
        _956 = _992;
    }
    float _994 = _956;
    bool _996 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _998 = _994 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1000 = _994 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1002 = _994 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1004 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[0].x, _998);
    float _1006 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1000);
    float _1008 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1002);
    float _1010 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1004);
    float _1012 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1006);
    float _1014 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1020 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1022 = _1014;
    float _1024 = _1012;
    int _1148;
    int _1150;
    int _1152;
    int _1154;
    if (!_996)
    {
        float _1026 = _926 * _926;
        float _1028 = fma(_930, _930, _1026);
        float _1030 = sqrt(_1028);
        bool _1032 = _1030 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1034 = _1026;
        if (!_1032)
        {
            _1022 = _1020;
        }
        float _1036 = _1022;
        float _1038 = _1036;
        if (!_1032)
        {
            _1024 = _1018;
        }
        float _1040 = _1024;
        float _1042 = _1040;
        if (!_1032)
        {
            _1034 = _1016;
        }
        float _1044 = _1034;
        bool _1046 = !_1032;
        float _1048 = _1044;
        if (!_1046)
        {
            float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _1054 = _1030 + _1052;
            float _1056 = _994 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1058 = rsqrt(_1028);
            float _1060 = _1054 * _1050;
            float _1062 = _1060 * 0.15915493667125701904296875;
            float _1064 = _1062 * 6.283185482025146484375;
            float _1066 = cos(_1064);
            float _1068 = _1062 * 6.283185482025146484375;
            float _1070 = sin(_1068);
            float _1072 = _1066 + (-1.0);
            float _1074 = fma(_1070, _1056, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _1078 = _1058 * _1074;
            float _1080 = fma(_1066, _994, _1076);
            float _1082 = fma(_930, _1078, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _1084 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _1086 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _1088 = _1080 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _1090 = fma(_926, _1078, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1084);
            float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1086);
            float _1096 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1088);
            float _1098 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1092);
            float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1094);
            float _1102 = fma(_1090, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1096);
            float _1104 = _1098 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _1106 = _1100 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _1108 = _1102 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _1042 = _1106;
            _1048 = _1104;
            _1038 = _1108;
        }
        float _1110 = _1042;
        float _1112 = _1048;
        float _1114 = _1038;
        float _1116 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _1118 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _1120 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _1122 = _1110 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _1124 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1116);
        float _1126 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1118);
        float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1120);
        float _1130 = fma(_1112, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1122);
        float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1124);
        float _1134 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1126);
        float _1136 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1128);
        float _1138 = fma(_1114, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1130);
        float _1140 = _1132 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _1142 = _1134 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _1144 = _1136 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _1146 = _1138 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _1148 = as_type<int>(_1140);
        _1150 = as_type<int>(_1142);
        _1152 = as_type<int>(_1144);
        _1154 = as_type<int>(_1146);
        _1156 = true;
    }
    else
    {
        float _1158 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _1160 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _1162 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _1164 = _1018 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _1166 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1158);
        float _1168 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1160);
        float _1170 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1162);
        float _1172 = fma(_1016, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1164);
        float _1174 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1166);
        float _1176 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1168);
        float _1178 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1170);
        float _1180 = fma(_1020, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1172);
        float _1182 = _1174 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _1184 = _1176 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _1186 = _1178 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _1188 = _1180 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _1148 = as_type<int>(_1182);
        _1150 = as_type<int>(_1184);
        _1152 = as_type<int>(_1186);
        _1154 = as_type<int>(_1188);
    }
    _1156 = false;
    int _1190 = _1148;
    int _1192 = _1150;
    int _1194 = _1152;
    int _1196 = _1154;
    float _3206 = as_type<float>(_1190);
    out.gl_Position.x = _3206;
    float _3209 = as_type<float>(_1192);
    out.gl_Position.y = _3209;
    float _3212 = as_type<float>(_1194);
    out.gl_Position.z = _3212;
    float _3215 = as_type<float>(_1196);
    out.gl_Position.w = _3215;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

