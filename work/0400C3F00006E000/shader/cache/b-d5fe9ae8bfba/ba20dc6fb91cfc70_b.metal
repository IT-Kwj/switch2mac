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
    sampler vp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_40 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_35.x;
    float _62 = in.m_35.y;
    float _64 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _66 = _64 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _69 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _71 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _75 = _69 << 4;
    bool _79 = _75 == 0;
    bool _81 = _75 == 16;
    bool _83 = _75 == 32;
    bool _85 = _75 == 48;
    bool _87 = _75 == 64;
    float _89 = fma(_66, _60, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _91 = fma(_73, _60, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _93 = _75 == 80;
    float _95 = as_type<float>(gl_BaseInstance);
    if (_79)
    {
        _95 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _97 = _95;
    float _99 = -_89;
    float _101 = _99 + _91;
    bool _103 = _75 == 96;
    float _105 = fma(_101, _62, _89);
    float _107 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _109 = 0.0;
    float _111 = _97;
    if (_79)
    {
        _109 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _113 = _109;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _105 + _115;
    float _119 = _113;
    if (_81)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _121 = _111;
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _125 = _107 + _123;
    float _127 = fma(_62, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _129 = _117 * _117;
    bool _131 = _75 == 112;
    float _133 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _135 = _127 + _133;
    float _137 = fma(_125, _125, _129);
    float _139 = _121;
    if (_81)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _141 = _119;
    float _143 = _141;
    if (_83)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _145 = _139;
    float _147 = fma(_135, _135, _137);
    bool _149 = _75 == 128;
    float _151 = _145;
    if (_83)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _153 = _143;
    float _155 = rsqrt(_147);
    float _157 = _153;
    if (_85)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _151;
    bool _161 = _75 == 144;
    float _163 = _159;
    if (_85)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_87)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _75 == 160;
    float _173 = _169;
    if (_87)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    bool _181 = _75 == 176;
    float _183 = _155 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _185 = _179;
    if (_93)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _75 == 192;
    float _191 = _187;
    if (_103)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _193 = _185;
    float _195 = log2(_183);
    float _197 = _193;
    if (_103)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _191;
    float _201 = _199;
    if (_131)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _75 == 208;
    float _207 = _203;
    if (_131)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_149)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _75 == 224;
    float _217 = _213;
    if (_149)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _211;
    float _221 = _219;
    if (_161)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _223 = _217;
    float _225 = _195 + 1.2999999523162841796875;
    bool _227 = _75 == 240;
    float _229 = _223;
    if (_161)
    {
        _221 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _221;
    float _233 = _231;
    if (_171)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _229;
    float _237 = trunc(_225);
    int _239 = int(_237);
    bool _241 = _75 == 256;
    float _243 = _235;
    if (_171)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _245 = _233;
    float _247 = _245;
    if (_181)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _249 = _243;
    bool _251 = _75 == 272;
    float _253 = _249;
    if (_181)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    bool _261 = _75 == 288;
    float _263 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _265 = _257;
    int _267 = min(_239, 15);
    bool _269 = _75 == 304;
    float _271 = _265;
    if (_205)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _273 = _263;
    float _275 = float(_267);
    float _277 = _273;
    if (_205)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _279 = _271;
    int _281 = _267 << 4;
    int _283 = _281 + 4288;
    float _285 = _279;
    if (_215)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _277;
    bool _289 = _75 == 320;
    float _291 = -_275;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _295 = _287;
    if (_215)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _297 = _285;
    float _299 = _297;
    if (_227)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _301 = _295;
    float _303 = _293 + 1.0;
    bool _305 = _75 == 336;
    float _307 = _301;
    if (_227)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _309 = _299;
    float _311 = _309;
    if (_241)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _313 = _307;
    float _315 = exp2(_303);
    bool _317 = _75 == 352;
    float _319 = _313;
    if (_241)
    {
        _311 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _321 = _311;
    float _323 = _321;
    if (_251)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _325 = _319;
    bool _327 = _75 == 368;
    float _329 = _325;
    if (_251)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _331 = _323;
    float _333 = _331;
    if (_261)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _335 = _329;
    bool _337 = _75 == 384;
    float _339 = _335;
    if (_261)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _341 = _333;
    float _343 = 1.0 / _315;
    float _345 = _341;
    if (_269)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _347 = _339;
    bool _349 = _75 == 400;
    float _351 = _347;
    if (_269)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _353 = _345;
    bool _355 = _75 == 416;
    float _357 = _353;
    if (_289)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _359 = _351;
    float _361 = _359;
    if (_289)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _363 = _357;
    float _365 = _363;
    if (_305)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _367 = _361;
    bool _369 = _75 == 432;
    float _371 = _367;
    if (_305)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _373 = _365;
    float _375 = _373;
    if (_317)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _377 = _371;
    bool _379 = _75 == 448;
    float _381 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _383 = _375;
    float _385 = _383;
    if (_327)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _387 = _381;
    bool _389 = _75 == 464;
    float _391 = _387;
    if (_327)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _393 = _385;
    float _395 = _393;
    if (_337)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _397 = _391;
    bool _399 = _75 == 480;
    float _401 = _397;
    if (_337)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _403 = _395;
    float _405 = _403;
    if (_349)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _407 = _401;
    bool _409 = _75 == 496;
    float _411 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _413 = _405;
    float _415 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _417 = _411;
    bool _419 = _75 == 512;
    float _421 = _417;
    if (_355)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _423 = _415;
    bool _425 = _75 == 528;
    float _427 = _423;
    if (_369)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _429 = _421;
    float _431 = _429;
    if (_369)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _433 = _427;
    float _435 = _433;
    if (_379)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _437 = _431;
    bool _439 = _75 == 544;
    float _441 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _443 = _435;
    float _445 = _443;
    if (_389)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _447 = _441;
    bool _449 = _75 == 560;
    float _451 = _447;
    if (_389)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _453 = _445;
    float _455 = _453;
    if (_399)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _457 = _451;
    bool _459 = _75 == 576;
    float _461 = _457;
    if (_399)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _463 = _455;
    float _465 = _463;
    if (_409)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _467 = _461;
    bool _469 = _75 == 592;
    float _471 = _467;
    if (_409)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _473 = _465;
    float _475 = _473;
    if (_419)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _477 = _471;
    bool _479 = _75 == 608;
    float _481 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _483 = _475;
    float _485 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _487 = _481;
    bool _489 = _75 == 624;
    float _491 = _487;
    if (_425)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _493 = _485;
    bool _495 = _75 == 640;
    float _497 = _493;
    if (_439)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _499 = _491;
    float _501 = _499;
    if (_439)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _503 = _497;
    float _505 = _503;
    if (_449)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _507 = _501;
    bool _509 = _75 == 656;
    float _511 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _513 = _505;
    float _515 = _513;
    if (_459)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _517 = _511;
    bool _519 = _75 == 672;
    float _521 = _517;
    if (_459)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _523 = _515;
    float _525 = _523;
    if (_469)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _527 = _521;
    bool _529 = _75 == 688;
    float _531 = _527;
    if (_469)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _533 = _525;
    float _535 = _533;
    if (_479)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _537 = _531;
    bool _539 = _75 == 704;
    float _541 = _537;
    if (_479)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _543 = _535;
    float _545 = _543;
    if (_489)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _547 = _541;
    bool _549 = _75 == 720;
    float _551 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _553 = _545;
    float _555 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _557 = _551;
    bool _559 = _75 == 736;
    float _561 = _557;
    if (_495)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _563 = _555;
    bool _565 = _75 == 752;
    float _567 = _563;
    if (_509)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _569 = _561;
    float _571 = _569;
    if (_519)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _573 = _571;
    float _575 = _573;
    if (_529)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _577 = _575;
    float _579 = _577;
    if (_539)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _581 = _579;
    float _583 = _581;
    if (_549)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_559)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_565)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _593 = _591;
    float _595 = _343 * _593;
    if (_509)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _597 = _567;
    float _599 = _597;
    if (_519)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _601 = _599;
    float _603 = _595 * _60;
    float _605 = _595 * _62;
    float _607 = _601;
    if (_529)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _609 = _607;
    float _611 = floor(_603);
    float _613 = _609;
    if (_539)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _615 = _613;
    float _617 = _615;
    if (_549)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_559)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _623 = _621;
    float _625 = _623;
    if (_565)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _627 = _625;
    float _629 = floor(_605);
    float _631 = _315 * _627;
    float _633 = -_611;
    float _635 = _603 + _633;
    float _637 = _635 * 2.0;
    float _639 = -_635;
    float _641 = fma(_631, _639, _60);
    int _643 = _283 + 8;
    uint _646 = uint(int(uint(_643) >> uint(2)));
    uint _648 = uint(int(uint(int(_646)) >> uint(2)));
    int _650 = int(_646) & 3;
    float _652 = (*spvDescriptorSet0.vp_c14)._m0[int(_648)][_650];
    int _654 = int(_646) + 1;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    int _658 = _654 & 3;
    float _660 = (*spvDescriptorSet0.vp_c14)._m0[int(_656)][_658];
    float _662 = -_629;
    float _664 = _605 + _662;
    float _666 = floor(_637);
    float _668 = _664 * 2.0;
    float _670 = -_664;
    float _672 = fma(_631, _670, _62);
    float _674 = floor(_668);
    float _676 = _631 * _666;
    float _678 = _676 * 0.5;
    float _680 = _678 + _641;
    float _682 = fma(_66, _680, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _684 = _631 * _674;
    float _686 = _684 * 0.5;
    float _688 = fma(_73, _680, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _692 = _686 + _672;
    float _694 = -_682;
    float _696 = _694 + _688;
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _700 = _690 + _698;
    float _702 = fma(_692, _696, _682);
    float _704 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _706 = _702 + _704;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _710 = _706 * _706;
    float _712 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _714 = _708 + _712;
    float _716 = fma(_700, _700, _710);
    float _718 = fma(_714, _714, _716);
    float _720 = sqrt(_718);
    float _722 = -_660;
    float _724 = fma(_720, _652, _722);
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = -_686;
    float _730 = fma(_728, _726, _692);
    float _732 = -_678;
    float _734 = fma(_732, _726, _680);
    float _736 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _738 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
    float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _738);
    float2 _2171 = float2(_742, _740);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2171, float2(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2171, float2(0.0), isnan(_2171)), level(0.0)).x;
    float _746 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _752 = _746 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _756 = _748 + _754;
    float _758 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _760 = _752 * _752;
    float _762 = fma(_756, _756, _760);
    out.m_38.y = _758;
    float _764 = sqrt(_762);
    bool _766 = _764 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _770 = _764 + _768;
    float _772 = as_type<float>(_283);
    float _774 = _770;
    float _776 = _720;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[8].x;
    float _780 = _762;
    if (_766)
    {
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _772 = _782;
    }
    float _784 = _772;
    if (_766)
    {
        float _786 = _770 * _784;
        _774 = _786;
    }
    float _788 = _774;
    float _790 = _788;
    if (_766)
    {
        float _792 = _788 * 0.15915493667125701904296875;
        _776 = _792;
    }
    float _794 = _776;
    float _796 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _798 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _800 = _794;
    if (_766)
    {
        float _802 = _794 * 6.283185482025146484375;
        float _804 = sin(_802);
        _790 = _804;
    }
    float _806 = _790;
    float _808 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_40.z = _796;
    out.m_40.w = _798;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    if (_766)
    {
        float _812 = _794 * 6.283185482025146484375;
        float _814 = cos(_812);
        _810 = _814;
    }
    float _816 = _810;
    out.m_38.x = _808;
    float _818 = _742;
    if (_766)
    {
        float _820 = rsqrt(_762);
        _818 = _820;
    }
    float _822 = _818;
    float _824 = _816;
    if (_766)
    {
        float _826 = _816 + (-1.0);
        _778 = _826;
    }
    float _828 = _778;
    if (_766)
    {
        float _830 = _828 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _800 = _830;
    }
    float _832 = _800;
    float _834 = fma(_744, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _836 = _744;
    if (_766)
    {
        float _838 = _834 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _836 = _838;
    }
    float _840 = _836;
    out.m_42.x = _748;
    out.m_42.y = _834;
    out.m_42.z = _746;
    float _842 = _840;
    if (_766)
    {
        float _844 = fma(_806, _840, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _842 = _844;
    }
    float _846 = _842;
    float _848 = _834 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _850 = _846;
    float _852 = _822;
    float _854 = _848;
    if (_766)
    {
        float _856 = _822 * _846;
        _780 = _856;
    }
    float _858 = _780;
    if (!_766)
    {
        _850 = _834;
    }
    float _860 = _850;
    float _862 = _860;
    if (_766)
    {
        float _864 = fma(_834, _816, _832);
        _862 = _864;
    }
    float _866 = _862;
    if (!_766)
    {
        _852 = _748;
    }
    float _868 = _852;
    float _870 = _868;
    if (_766)
    {
        float _872 = fma(_756, _858, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _870 = _872;
    }
    float _874 = _870;
    float _876 = fma(_748, (*spvDescriptorSet0.vp_c4)._m0[2].x, _848);
    float _878 = _866 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_766)
    {
        _854 = _746;
    }
    float _880 = _854;
    float _882 = _880;
    if (_766)
    {
        float _884 = _866 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _824 = _884;
    }
    float _886 = _824;
    float _888 = _886;
    if (_766)
    {
        float _890 = fma(_752, _858, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _882 = _890;
    }
    float _892 = _882;
    float _894 = _866 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[1].x, _878);
    float _898 = fma(_746, (*spvDescriptorSet0.vp_c4)._m0[2].z, _876);
    float _900 = _894;
    if (_766)
    {
        float _902 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[2].x, _886);
        _888 = _902;
    }
    float _904 = _888;
    float _906 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[0].x, _894);
    float _908 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _896);
    float _910 = _898 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _912 = _904;
    if (_766)
    {
        float _914 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[2].z, _904);
        _912 = _914;
    }
    float _916 = _912;
    float _918 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _906);
    float _920 = _908 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_766)
    {
        _900 = _910;
    }
    float _922 = _900;
    float _924 = _918 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _926 = _920 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _928 = _920 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _930 = _920 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _932 = _920 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _934 = _922;
    if (_766)
    {
        float _936 = _916 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].x, _926);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].x, _928);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].x, _930);
    float _946 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].x, _932);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[9].z, _940);
    float _950 = -_910;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _954 = _950 + _952;
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[7].z, _942);
    float _958 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[8].z, _944);
    float _960 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[10].z, _946);
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _964 = _956 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _968 = _948 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _970 = _960 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_38.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_44.w = _910;
    out.m_46.w = _962;
    out.gl_Position.x = _964;
    out.gl_Position.y = _966;
    out.gl_Position.z = _968;
    out.gl_Position.w = _970;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_35.x;
    float _62 = in.m_35.y;
    float _64 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _66 = _64 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _69 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _71 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _75 = _69 << 4;
    bool _79 = _75 == 0;
    bool _81 = _75 == 16;
    bool _83 = _75 == 32;
    bool _85 = _75 == 48;
    bool _87 = _75 == 64;
    float _89 = fma(_66, _60, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _91 = fma(_73, _60, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _93 = _75 == 80;
    float _95 = as_type<float>(gl_BaseInstance);
    if (_79)
    {
        _95 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _97 = _95;
    float _99 = -_89;
    float _101 = _99 + _91;
    bool _103 = _75 == 96;
    float _105 = fma(_101, _62, _89);
    float _107 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _109 = 0.0;
    float _111 = _97;
    if (_79)
    {
        _109 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _113 = _109;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _105 + _115;
    float _119 = _113;
    if (_81)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _121 = _111;
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _125 = _107 + _123;
    float _127 = fma(_62, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _129 = _117 * _117;
    bool _131 = _75 == 112;
    float _133 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _135 = _127 + _133;
    float _137 = fma(_125, _125, _129);
    float _139 = _121;
    if (_81)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _141 = _119;
    float _143 = _141;
    if (_83)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _145 = _139;
    float _147 = fma(_135, _135, _137);
    bool _149 = _75 == 128;
    float _151 = _145;
    if (_83)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _153 = _143;
    float _155 = rsqrt(_147);
    float _157 = _153;
    if (_85)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _151;
    bool _161 = _75 == 144;
    float _163 = _159;
    if (_85)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_87)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _75 == 160;
    float _173 = _169;
    if (_87)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    bool _181 = _75 == 176;
    float _183 = _155 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _185 = _179;
    if (_93)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _75 == 192;
    float _191 = _187;
    if (_103)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _193 = _185;
    float _195 = log2(_183);
    float _197 = _193;
    if (_103)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _191;
    float _201 = _199;
    if (_131)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _75 == 208;
    float _207 = _203;
    if (_131)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_149)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _75 == 224;
    float _217 = _213;
    if (_149)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _211;
    float _221 = _219;
    if (_161)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _223 = _217;
    float _225 = _195 + 1.2999999523162841796875;
    bool _227 = _75 == 240;
    float _229 = _223;
    if (_161)
    {
        _221 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _221;
    float _233 = _231;
    if (_171)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _229;
    float _237 = trunc(_225);
    int _239 = int(_237);
    bool _241 = _75 == 256;
    float _243 = _235;
    if (_171)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _245 = _233;
    float _247 = _245;
    if (_181)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _249 = _243;
    bool _251 = _75 == 272;
    float _253 = _249;
    if (_181)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    bool _261 = _75 == 288;
    float _263 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _265 = _257;
    int _267 = min(_239, 15);
    bool _269 = _75 == 304;
    float _271 = _265;
    if (_205)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _273 = _263;
    float _275 = float(_267);
    float _277 = _273;
    if (_205)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _279 = _271;
    int _281 = _267 << 4;
    int _283 = _281 + 4288;
    float _285 = _279;
    if (_215)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _277;
    bool _289 = _75 == 320;
    float _291 = -_275;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _295 = _287;
    if (_215)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _297 = _285;
    float _299 = _297;
    if (_227)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _301 = _295;
    float _303 = _293 + 1.0;
    bool _305 = _75 == 336;
    float _307 = _301;
    if (_227)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _309 = _299;
    float _311 = _309;
    if (_241)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _313 = _307;
    float _315 = exp2(_303);
    bool _317 = _75 == 352;
    float _319 = _313;
    if (_241)
    {
        _311 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _321 = _311;
    float _323 = _321;
    if (_251)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _325 = _319;
    bool _327 = _75 == 368;
    float _329 = _325;
    if (_251)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _331 = _323;
    float _333 = _331;
    if (_261)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _335 = _329;
    bool _337 = _75 == 384;
    float _339 = _335;
    if (_261)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _341 = _333;
    float _343 = 1.0 / _315;
    float _345 = _341;
    if (_269)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _347 = _339;
    bool _349 = _75 == 400;
    float _351 = _347;
    if (_269)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _353 = _345;
    bool _355 = _75 == 416;
    float _357 = _353;
    if (_289)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _359 = _351;
    float _361 = _359;
    if (_289)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _363 = _357;
    float _365 = _363;
    if (_305)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _367 = _361;
    bool _369 = _75 == 432;
    float _371 = _367;
    if (_305)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _373 = _365;
    float _375 = _373;
    if (_317)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _377 = _371;
    bool _379 = _75 == 448;
    float _381 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _383 = _375;
    float _385 = _383;
    if (_327)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _387 = _381;
    bool _389 = _75 == 464;
    float _391 = _387;
    if (_327)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _393 = _385;
    float _395 = _393;
    if (_337)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _397 = _391;
    bool _399 = _75 == 480;
    float _401 = _397;
    if (_337)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _403 = _395;
    float _405 = _403;
    if (_349)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _407 = _401;
    bool _409 = _75 == 496;
    float _411 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _413 = _405;
    float _415 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _417 = _411;
    bool _419 = _75 == 512;
    float _421 = _417;
    if (_355)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _423 = _415;
    bool _425 = _75 == 528;
    float _427 = _423;
    if (_369)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _429 = _421;
    float _431 = _429;
    if (_369)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _433 = _427;
    float _435 = _433;
    if (_379)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _437 = _431;
    bool _439 = _75 == 544;
    float _441 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _443 = _435;
    float _445 = _443;
    if (_389)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _447 = _441;
    bool _449 = _75 == 560;
    float _451 = _447;
    if (_389)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _453 = _445;
    float _455 = _453;
    if (_399)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _457 = _451;
    bool _459 = _75 == 576;
    float _461 = _457;
    if (_399)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _463 = _455;
    float _465 = _463;
    if (_409)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _467 = _461;
    bool _469 = _75 == 592;
    float _471 = _467;
    if (_409)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _473 = _465;
    float _475 = _473;
    if (_419)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _477 = _471;
    bool _479 = _75 == 608;
    float _481 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _483 = _475;
    float _485 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _487 = _481;
    bool _489 = _75 == 624;
    float _491 = _487;
    if (_425)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _493 = _485;
    bool _495 = _75 == 640;
    float _497 = _493;
    if (_439)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _499 = _491;
    float _501 = _499;
    if (_439)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _503 = _497;
    float _505 = _503;
    if (_449)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _507 = _501;
    bool _509 = _75 == 656;
    float _511 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _513 = _505;
    float _515 = _513;
    if (_459)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _517 = _511;
    bool _519 = _75 == 672;
    float _521 = _517;
    if (_459)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _523 = _515;
    float _525 = _523;
    if (_469)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _527 = _521;
    bool _529 = _75 == 688;
    float _531 = _527;
    if (_469)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _533 = _525;
    float _535 = _533;
    if (_479)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _537 = _531;
    bool _539 = _75 == 704;
    float _541 = _537;
    if (_479)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _543 = _535;
    float _545 = _543;
    if (_489)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _547 = _541;
    bool _549 = _75 == 720;
    float _551 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _553 = _545;
    float _555 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _557 = _551;
    bool _559 = _75 == 736;
    float _561 = _557;
    if (_495)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _563 = _555;
    bool _565 = _75 == 752;
    float _567 = _563;
    if (_509)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _569 = _561;
    float _571 = _569;
    if (_519)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _573 = _571;
    float _575 = _573;
    if (_529)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _577 = _575;
    float _579 = _577;
    if (_539)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _581 = _579;
    float _583 = _581;
    if (_549)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_559)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_565)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _593 = _591;
    float _595 = _343 * _593;
    if (_509)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _597 = _567;
    float _599 = _597;
    if (_519)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _601 = _599;
    float _603 = _595 * _60;
    float _605 = _595 * _62;
    float _607 = _601;
    if (_529)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _609 = _607;
    float _611 = floor(_603);
    float _613 = _609;
    if (_539)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _615 = _613;
    float _617 = _615;
    if (_549)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_559)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _623 = _621;
    float _625 = _623;
    if (_565)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _627 = _625;
    float _629 = floor(_605);
    float _631 = _315 * _627;
    float _633 = -_611;
    float _635 = _603 + _633;
    float _637 = _635 * 2.0;
    float _639 = -_635;
    float _641 = fma(_631, _639, _60);
    int _643 = _283 + 8;
    uint _646 = uint(int(uint(_643) >> uint(2)));
    uint _648 = uint(int(uint(int(_646)) >> uint(2)));
    int _650 = int(_646) & 3;
    float _652 = (*spvDescriptorSet0.vp_c14)._m0[int(_648)][_650];
    int _654 = int(_646) + 1;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    int _658 = _654 & 3;
    float _660 = (*spvDescriptorSet0.vp_c14)._m0[int(_656)][_658];
    float _662 = -_629;
    float _664 = _605 + _662;
    float _666 = floor(_637);
    float _668 = _664 * 2.0;
    float _670 = -_664;
    float _672 = fma(_631, _670, _62);
    float _674 = floor(_668);
    float _676 = _631 * _666;
    float _678 = _676 * 0.5;
    float _680 = _678 + _641;
    float _682 = fma(_66, _680, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _684 = _631 * _674;
    float _686 = _684 * 0.5;
    float _688 = fma(_73, _680, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _692 = _686 + _672;
    float _694 = -_682;
    float _696 = _694 + _688;
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _700 = _690 + _698;
    float _702 = fma(_692, _696, _682);
    float _704 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _706 = _702 + _704;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _710 = _706 * _706;
    float _712 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _714 = _708 + _712;
    float _716 = fma(_700, _700, _710);
    float _718 = fma(_714, _714, _716);
    float _720 = sqrt(_718);
    float _722 = -_660;
    float _724 = fma(_720, _652, _722);
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = -_686;
    float _730 = fma(_728, _726, _692);
    float _732 = -_678;
    float _734 = fma(_732, _726, _680);
    float _736 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _738 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
    float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _738);
    float2 _2171 = float2(_742, _740);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2171, float2(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2171, float2(0.0), isnan(_2171)), level(0.0)).x;
    float _746 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _752 = _746 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _756 = _748 + _754;
    float _758 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _760 = _752 * _752;
    float _762 = fma(_756, _756, _760);
    out.m_38.y = _758;
    float _764 = sqrt(_762);
    bool _766 = _764 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _770 = _764 + _768;
    float _772 = as_type<float>(_283);
    float _774 = _770;
    float _776 = _720;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[8].x;
    float _780 = _762;
    if (_766)
    {
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _772 = _782;
    }
    float _784 = _772;
    if (_766)
    {
        float _786 = _770 * _784;
        _774 = _786;
    }
    float _788 = _774;
    float _790 = _788;
    if (_766)
    {
        float _792 = _788 * 0.15915493667125701904296875;
        _776 = _792;
    }
    float _794 = _776;
    float _796 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _798 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _800 = _794;
    if (_766)
    {
        float _802 = _794 * 6.283185482025146484375;
        float _804 = sin(_802);
        _790 = _804;
    }
    float _806 = _790;
    float _808 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_40.z = _796;
    out.m_40.w = _798;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    if (_766)
    {
        float _812 = _794 * 6.283185482025146484375;
        float _814 = cos(_812);
        _810 = _814;
    }
    float _816 = _810;
    out.m_38.x = _808;
    float _818 = _742;
    if (_766)
    {
        float _820 = rsqrt(_762);
        _818 = _820;
    }
    float _822 = _818;
    float _824 = _816;
    if (_766)
    {
        float _826 = _816 + (-1.0);
        _778 = _826;
    }
    float _828 = _778;
    if (_766)
    {
        float _830 = _828 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _800 = _830;
    }
    float _832 = _800;
    float _834 = fma(_744, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _836 = _744;
    if (_766)
    {
        float _838 = _834 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _836 = _838;
    }
    float _840 = _836;
    out.m_42.x = _748;
    out.m_42.y = _834;
    out.m_42.z = _746;
    float _842 = _840;
    if (_766)
    {
        float _844 = fma(_806, _840, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _842 = _844;
    }
    float _846 = _842;
    float _848 = _834 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _850 = _846;
    float _852 = _822;
    float _854 = _848;
    if (_766)
    {
        float _856 = _822 * _846;
        _780 = _856;
    }
    float _858 = _780;
    if (!_766)
    {
        _850 = _834;
    }
    float _860 = _850;
    float _862 = _860;
    if (_766)
    {
        float _864 = fma(_834, _816, _832);
        _862 = _864;
    }
    float _866 = _862;
    if (!_766)
    {
        _852 = _748;
    }
    float _868 = _852;
    float _870 = _868;
    if (_766)
    {
        float _872 = fma(_756, _858, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _870 = _872;
    }
    float _874 = _870;
    float _876 = fma(_748, (*spvDescriptorSet0.vp_c4)._m0[2].x, _848);
    float _878 = _866 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_766)
    {
        _854 = _746;
    }
    float _880 = _854;
    float _882 = _880;
    if (_766)
    {
        float _884 = _866 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _824 = _884;
    }
    float _886 = _824;
    float _888 = _886;
    if (_766)
    {
        float _890 = fma(_752, _858, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _882 = _890;
    }
    float _892 = _882;
    float _894 = _866 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[1].x, _878);
    float _898 = fma(_746, (*spvDescriptorSet0.vp_c4)._m0[2].z, _876);
    float _900 = _894;
    if (_766)
    {
        float _902 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[2].x, _886);
        _888 = _902;
    }
    float _904 = _888;
    float _906 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[0].x, _894);
    float _908 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _896);
    float _910 = _898 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _912 = _904;
    if (_766)
    {
        float _914 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[2].z, _904);
        _912 = _914;
    }
    float _916 = _912;
    float _918 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _906);
    float _920 = _908 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_766)
    {
        _900 = _910;
    }
    float _922 = _900;
    float _924 = _918 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _926 = _920 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _928 = _920 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _930 = _920 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _932 = _920 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _934 = _922;
    if (_766)
    {
        float _936 = _916 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].x, _926);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].x, _928);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].x, _930);
    float _946 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].x, _932);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[9].z, _940);
    float _950 = -_910;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _954 = _950 + _952;
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[7].z, _942);
    float _958 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[8].z, _944);
    float _960 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[10].z, _946);
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _964 = _956 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _968 = _948 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _970 = _960 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_38.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_44.w = _910;
    out.m_46.w = _962;
    out.gl_Position.x = _964;
    out.gl_Position.y = _966;
    out.gl_Position.z = _968;
    out.gl_Position.w = _970;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_35.x;
    float _62 = in.m_35.y;
    float _64 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _66 = _64 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _69 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _71 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _75 = _69 << 4;
    bool _79 = _75 == 0;
    bool _81 = _75 == 16;
    bool _83 = _75 == 32;
    bool _85 = _75 == 48;
    bool _87 = _75 == 64;
    float _89 = fma(_66, _60, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _91 = fma(_73, _60, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _93 = _75 == 80;
    float _95 = as_type<float>(gl_BaseInstance);
    if (_79)
    {
        _95 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _97 = _95;
    float _99 = -_89;
    float _101 = _99 + _91;
    bool _103 = _75 == 96;
    float _105 = fma(_101, _62, _89);
    float _107 = fma(_60, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _109 = 0.0;
    float _111 = _97;
    if (_79)
    {
        _109 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _113 = _109;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _105 + _115;
    float _119 = _113;
    if (_81)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _121 = _111;
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _125 = _107 + _123;
    float _127 = fma(_62, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _129 = _117 * _117;
    bool _131 = _75 == 112;
    float _133 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _135 = _127 + _133;
    float _137 = fma(_125, _125, _129);
    float _139 = _121;
    if (_81)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _141 = _119;
    float _143 = _141;
    if (_83)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _145 = _139;
    float _147 = fma(_135, _135, _137);
    bool _149 = _75 == 128;
    float _151 = _145;
    if (_83)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _153 = _143;
    float _155 = rsqrt(_147);
    float _157 = _153;
    if (_85)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _151;
    bool _161 = _75 == 144;
    float _163 = _159;
    if (_85)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_87)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _75 == 160;
    float _173 = _169;
    if (_87)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    bool _181 = _75 == 176;
    float _183 = _155 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _185 = _179;
    if (_93)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _75 == 192;
    float _191 = _187;
    if (_103)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _193 = _185;
    float _195 = log2(_183);
    float _197 = _193;
    if (_103)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _191;
    float _201 = _199;
    if (_131)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _75 == 208;
    float _207 = _203;
    if (_131)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_149)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _75 == 224;
    float _217 = _213;
    if (_149)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _211;
    float _221 = _219;
    if (_161)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _223 = _217;
    float _225 = _195 + 1.2999999523162841796875;
    bool _227 = _75 == 240;
    float _229 = _223;
    if (_161)
    {
        _221 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _221;
    float _233 = _231;
    if (_171)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _235 = _229;
    float _237 = trunc(_225);
    int _239 = int(_237);
    bool _241 = _75 == 256;
    float _243 = _235;
    if (_171)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _245 = _233;
    float _247 = _245;
    if (_181)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _249 = _243;
    bool _251 = _75 == 272;
    float _253 = _249;
    if (_181)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    bool _261 = _75 == 288;
    float _263 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _265 = _257;
    int _267 = min(_239, 15);
    bool _269 = _75 == 304;
    float _271 = _265;
    if (_205)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _273 = _263;
    float _275 = float(_267);
    float _277 = _273;
    if (_205)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _279 = _271;
    int _281 = _267 << 4;
    int _283 = _281 + 4288;
    float _285 = _279;
    if (_215)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _277;
    bool _289 = _75 == 320;
    float _291 = -_275;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _295 = _287;
    if (_215)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _297 = _285;
    float _299 = _297;
    if (_227)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _301 = _295;
    float _303 = _293 + 1.0;
    bool _305 = _75 == 336;
    float _307 = _301;
    if (_227)
    {
        _299 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _309 = _299;
    float _311 = _309;
    if (_241)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _313 = _307;
    float _315 = exp2(_303);
    bool _317 = _75 == 352;
    float _319 = _313;
    if (_241)
    {
        _311 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _321 = _311;
    float _323 = _321;
    if (_251)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _325 = _319;
    bool _327 = _75 == 368;
    float _329 = _325;
    if (_251)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _331 = _323;
    float _333 = _331;
    if (_261)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _335 = _329;
    bool _337 = _75 == 384;
    float _339 = _335;
    if (_261)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _341 = _333;
    float _343 = 1.0 / _315;
    float _345 = _341;
    if (_269)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _347 = _339;
    bool _349 = _75 == 400;
    float _351 = _347;
    if (_269)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _353 = _345;
    bool _355 = _75 == 416;
    float _357 = _353;
    if (_289)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _359 = _351;
    float _361 = _359;
    if (_289)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _363 = _357;
    float _365 = _363;
    if (_305)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _367 = _361;
    bool _369 = _75 == 432;
    float _371 = _367;
    if (_305)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _373 = _365;
    float _375 = _373;
    if (_317)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _377 = _371;
    bool _379 = _75 == 448;
    float _381 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _383 = _375;
    float _385 = _383;
    if (_327)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _387 = _381;
    bool _389 = _75 == 464;
    float _391 = _387;
    if (_327)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _393 = _385;
    float _395 = _393;
    if (_337)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _397 = _391;
    bool _399 = _75 == 480;
    float _401 = _397;
    if (_337)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _403 = _395;
    float _405 = _403;
    if (_349)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _407 = _401;
    bool _409 = _75 == 496;
    float _411 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _413 = _405;
    float _415 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _417 = _411;
    bool _419 = _75 == 512;
    float _421 = _417;
    if (_355)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _423 = _415;
    bool _425 = _75 == 528;
    float _427 = _423;
    if (_369)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _429 = _421;
    float _431 = _429;
    if (_369)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _433 = _427;
    float _435 = _433;
    if (_379)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _437 = _431;
    bool _439 = _75 == 544;
    float _441 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _443 = _435;
    float _445 = _443;
    if (_389)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _447 = _441;
    bool _449 = _75 == 560;
    float _451 = _447;
    if (_389)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _453 = _445;
    float _455 = _453;
    if (_399)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _457 = _451;
    bool _459 = _75 == 576;
    float _461 = _457;
    if (_399)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _463 = _455;
    float _465 = _463;
    if (_409)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _467 = _461;
    bool _469 = _75 == 592;
    float _471 = _467;
    if (_409)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _473 = _465;
    float _475 = _473;
    if (_419)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _477 = _471;
    bool _479 = _75 == 608;
    float _481 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _483 = _475;
    float _485 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _487 = _481;
    bool _489 = _75 == 624;
    float _491 = _487;
    if (_425)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _493 = _485;
    bool _495 = _75 == 640;
    float _497 = _493;
    if (_439)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _499 = _491;
    float _501 = _499;
    if (_439)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _503 = _497;
    float _505 = _503;
    if (_449)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _507 = _501;
    bool _509 = _75 == 656;
    float _511 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _513 = _505;
    float _515 = _513;
    if (_459)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _517 = _511;
    bool _519 = _75 == 672;
    float _521 = _517;
    if (_459)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _523 = _515;
    float _525 = _523;
    if (_469)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _527 = _521;
    bool _529 = _75 == 688;
    float _531 = _527;
    if (_469)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _533 = _525;
    float _535 = _533;
    if (_479)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _537 = _531;
    bool _539 = _75 == 704;
    float _541 = _537;
    if (_479)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _543 = _535;
    float _545 = _543;
    if (_489)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _547 = _541;
    bool _549 = _75 == 720;
    float _551 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _553 = _545;
    float _555 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _557 = _551;
    bool _559 = _75 == 736;
    float _561 = _557;
    if (_495)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _563 = _555;
    bool _565 = _75 == 752;
    float _567 = _563;
    if (_509)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _569 = _561;
    float _571 = _569;
    if (_519)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _573 = _571;
    float _575 = _573;
    if (_529)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _577 = _575;
    float _579 = _577;
    if (_539)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _581 = _579;
    float _583 = _581;
    if (_549)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_559)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_565)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _593 = _591;
    float _595 = _343 * _593;
    if (_509)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _597 = _567;
    float _599 = _597;
    if (_519)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _601 = _599;
    float _603 = _595 * _60;
    float _605 = _595 * _62;
    float _607 = _601;
    if (_529)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _609 = _607;
    float _611 = floor(_603);
    float _613 = _609;
    if (_539)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _615 = _613;
    float _617 = _615;
    if (_549)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_559)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _623 = _621;
    float _625 = _623;
    if (_565)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _627 = _625;
    float _629 = floor(_605);
    float _631 = _315 * _627;
    float _633 = -_611;
    float _635 = _603 + _633;
    float _637 = _635 * 2.0;
    float _639 = -_635;
    float _641 = fma(_631, _639, _60);
    int _643 = _283 + 8;
    uint _646 = uint(int(uint(_643) >> uint(2)));
    uint _648 = uint(int(uint(int(_646)) >> uint(2)));
    int _650 = int(_646) & 3;
    float _652 = (*spvDescriptorSet0.vp_c14)._m0[int(_648)][_650];
    int _654 = int(_646) + 1;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    int _658 = _654 & 3;
    float _660 = (*spvDescriptorSet0.vp_c14)._m0[int(_656)][_658];
    float _662 = -_629;
    float _664 = _605 + _662;
    float _666 = floor(_637);
    float _668 = _664 * 2.0;
    float _670 = -_664;
    float _672 = fma(_631, _670, _62);
    float _674 = floor(_668);
    float _676 = _631 * _666;
    float _678 = _676 * 0.5;
    float _680 = _678 + _641;
    float _682 = fma(_66, _680, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _684 = _631 * _674;
    float _686 = _684 * 0.5;
    float _688 = fma(_73, _680, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _692 = _686 + _672;
    float _694 = -_682;
    float _696 = _694 + _688;
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _700 = _690 + _698;
    float _702 = fma(_692, _696, _682);
    float _704 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _706 = _702 + _704;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _710 = _706 * _706;
    float _712 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _714 = _708 + _712;
    float _716 = fma(_700, _700, _710);
    float _718 = fma(_714, _714, _716);
    float _720 = sqrt(_718);
    float _722 = -_660;
    float _724 = fma(_720, _652, _722);
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = -_686;
    float _730 = fma(_728, _726, _692);
    float _732 = -_678;
    float _734 = fma(_732, _726, _680);
    float _736 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _738 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
    float _742 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _738);
    float2 _2171 = float2(_742, _740);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2171, float2(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2171, float2(0.0), isnan(_2171)), level(0.0)).x;
    float _746 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _752 = _746 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _756 = _748 + _754;
    float _758 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _760 = _752 * _752;
    float _762 = fma(_756, _756, _760);
    out.m_38.y = _758;
    float _764 = sqrt(_762);
    bool _766 = _764 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _770 = _764 + _768;
    float _772 = as_type<float>(_283);
    float _774 = _770;
    float _776 = _720;
    float _778 = (*spvDescriptorSet0.vp_c15)._m0[8].x;
    float _780 = _762;
    if (_766)
    {
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _772 = _782;
    }
    float _784 = _772;
    if (_766)
    {
        float _786 = _770 * _784;
        _774 = _786;
    }
    float _788 = _774;
    float _790 = _788;
    if (_766)
    {
        float _792 = _788 * 0.15915493667125701904296875;
        _776 = _792;
    }
    float _794 = _776;
    float _796 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _798 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _800 = _794;
    if (_766)
    {
        float _802 = _794 * 6.283185482025146484375;
        float _804 = sin(_802);
        _790 = _804;
    }
    float _806 = _790;
    float _808 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    out.m_40.z = _796;
    out.m_40.w = _798;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    if (_766)
    {
        float _812 = _794 * 6.283185482025146484375;
        float _814 = cos(_812);
        _810 = _814;
    }
    float _816 = _810;
    out.m_38.x = _808;
    float _818 = _742;
    if (_766)
    {
        float _820 = rsqrt(_762);
        _818 = _820;
    }
    float _822 = _818;
    float _824 = _816;
    if (_766)
    {
        float _826 = _816 + (-1.0);
        _778 = _826;
    }
    float _828 = _778;
    if (_766)
    {
        float _830 = _828 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _800 = _830;
    }
    float _832 = _800;
    float _834 = fma(_744, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _836 = _744;
    if (_766)
    {
        float _838 = _834 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _836 = _838;
    }
    float _840 = _836;
    out.m_42.x = _748;
    out.m_42.y = _834;
    out.m_42.z = _746;
    float _842 = _840;
    if (_766)
    {
        float _844 = fma(_806, _840, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _842 = _844;
    }
    float _846 = _842;
    float _848 = _834 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _850 = _846;
    float _852 = _822;
    float _854 = _848;
    if (_766)
    {
        float _856 = _822 * _846;
        _780 = _856;
    }
    float _858 = _780;
    if (!_766)
    {
        _850 = _834;
    }
    float _860 = _850;
    float _862 = _860;
    if (_766)
    {
        float _864 = fma(_834, _816, _832);
        _862 = _864;
    }
    float _866 = _862;
    if (!_766)
    {
        _852 = _748;
    }
    float _868 = _852;
    float _870 = _868;
    if (_766)
    {
        float _872 = fma(_756, _858, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _870 = _872;
    }
    float _874 = _870;
    float _876 = fma(_748, (*spvDescriptorSet0.vp_c4)._m0[2].x, _848);
    float _878 = _866 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_766)
    {
        _854 = _746;
    }
    float _880 = _854;
    float _882 = _880;
    if (_766)
    {
        float _884 = _866 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _824 = _884;
    }
    float _886 = _824;
    float _888 = _886;
    if (_766)
    {
        float _890 = fma(_752, _858, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _882 = _890;
    }
    float _892 = _882;
    float _894 = _866 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[1].x, _878);
    float _898 = fma(_746, (*spvDescriptorSet0.vp_c4)._m0[2].z, _876);
    float _900 = _894;
    if (_766)
    {
        float _902 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[2].x, _886);
        _888 = _902;
    }
    float _904 = _888;
    float _906 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[0].x, _894);
    float _908 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _896);
    float _910 = _898 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _912 = _904;
    if (_766)
    {
        float _914 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[2].z, _904);
        _912 = _914;
    }
    float _916 = _912;
    float _918 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _906);
    float _920 = _908 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_766)
    {
        _900 = _910;
    }
    float _922 = _900;
    float _924 = _918 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _926 = _920 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _928 = _920 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _930 = _920 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _932 = _920 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _934 = _922;
    if (_766)
    {
        float _936 = _916 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].x, _926);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].x, _928);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].x, _930);
    float _946 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].x, _932);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[9].z, _940);
    float _950 = -_910;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _954 = _950 + _952;
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[7].z, _942);
    float _958 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[8].z, _944);
    float _960 = fma(_938, (*spvDescriptorSet0.vp_c4)._m0[10].z, _946);
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _964 = _956 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _968 = _948 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _970 = _960 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_38.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_44.w = _910;
    out.m_46.w = _962;
    out.gl_Position.x = _964;
    out.gl_Position.y = _966;
    out.gl_Position.z = _968;
    out.gl_Position.w = _970;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

