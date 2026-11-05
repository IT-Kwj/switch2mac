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
    float4 m_38 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_35.x;
    float _56 = in.m_35.y;
    float _58 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _60 = _58 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _63 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _65 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _67 = _65 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _69 = _63 << 4;
    bool _73 = _69 == 0;
    bool _75 = _69 == 16;
    bool _77 = _69 == 32;
    bool _79 = _69 == 48;
    bool _81 = _69 == 64;
    float _83 = fma(_60, _54, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _85 = fma(_67, _54, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _87 = _69 == 80;
    float _89 = as_type<float>(gl_BaseInstance);
    if (_73)
    {
        _89 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _91 = _89;
    float _93 = -_83;
    float _95 = _93 + _85;
    bool _97 = _69 == 96;
    float _99 = fma(_95, _56, _83);
    float _101 = fma(_54, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _103 = 0.0;
    float _105 = _91;
    if (_73)
    {
        _103 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _107 = _103;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _99 + _109;
    float _113 = _107;
    if (_75)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _115 = _105;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _119 = _101 + _117;
    float _121 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _123 = _111 * _111;
    bool _125 = _69 == 112;
    float _127 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _129 = _121 + _127;
    float _131 = fma(_119, _119, _123);
    float _133 = _115;
    if (_75)
    {
        _113 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _135 = _113;
    float _137 = _135;
    if (_77)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _139 = _133;
    float _141 = fma(_129, _129, _131);
    bool _143 = _69 == 128;
    float _145 = _139;
    if (_77)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _147 = _137;
    float _149 = rsqrt(_141);
    float _151 = _147;
    if (_79)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _153 = _145;
    bool _155 = _69 == 144;
    float _157 = _153;
    if (_79)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _159 = _151;
    float _161 = _159;
    if (_81)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _163 = _157;
    bool _165 = _69 == 160;
    float _167 = _163;
    if (_81)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_87)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _173 = _167;
    bool _175 = _69 == 176;
    float _177 = _149 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _179 = _173;
    if (_87)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _181 = _171;
    bool _183 = _69 == 192;
    float _185 = _181;
    if (_97)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _187 = _179;
    float _189 = log2(_177);
    float _191 = _187;
    if (_97)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _193 = _185;
    float _195 = _193;
    if (_125)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _197 = _191;
    bool _199 = _69 == 208;
    float _201 = _197;
    if (_125)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _203 = _195;
    float _205 = _203;
    if (_143)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _207 = _201;
    bool _209 = _69 == 224;
    float _211 = _207;
    if (_143)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _213 = _205;
    float _215 = _213;
    if (_155)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _217 = _211;
    float _219 = _189 + 1.2999999523162841796875;
    bool _221 = _69 == 240;
    float _223 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _225 = _215;
    float _227 = _225;
    if (_165)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _229 = _223;
    float _231 = trunc(_219);
    int _233 = int(_231);
    bool _235 = _69 == 256;
    float _237 = _229;
    if (_165)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _239 = _227;
    float _241 = _239;
    if (_175)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _243 = _237;
    bool _245 = _69 == 272;
    float _247 = _243;
    if (_175)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _249 = _241;
    float _251 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _253 = _247;
    bool _255 = _69 == 288;
    float _257 = _253;
    if (_183)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _259 = _251;
    int _261 = min(_233, 15);
    bool _263 = _69 == 304;
    float _265 = _259;
    if (_199)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _267 = _257;
    float _269 = float(_261);
    float _271 = _267;
    if (_199)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _273 = _265;
    int _275 = _261 << 4;
    int _277 = _275 + 4288;
    float _279 = _273;
    if (_209)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _281 = _271;
    bool _283 = _69 == 320;
    float _285 = -_269;
    float _287 = _285 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _289 = _281;
    if (_209)
    {
        _279 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _291 = _279;
    float _293 = _291;
    if (_221)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _295 = _289;
    float _297 = _287 + 1.0;
    bool _299 = _69 == 336;
    float _301 = _295;
    if (_221)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _303 = _293;
    float _305 = _303;
    if (_235)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _307 = _301;
    float _309 = exp2(_297);
    bool _311 = _69 == 352;
    float _313 = _307;
    if (_235)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _315 = _305;
    float _317 = _315;
    if (_245)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _319 = _313;
    bool _321 = _69 == 368;
    float _323 = _319;
    if (_245)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _325 = _317;
    float _327 = _325;
    if (_255)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _329 = _323;
    bool _331 = _69 == 384;
    float _333 = _329;
    if (_255)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _335 = _327;
    float _337 = 1.0 / _309;
    float _339 = _335;
    if (_263)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _341 = _333;
    bool _343 = _69 == 400;
    float _345 = _341;
    if (_263)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _347 = _339;
    bool _349 = _69 == 416;
    float _351 = _347;
    if (_283)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _353 = _345;
    float _355 = _353;
    if (_283)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _357 = _351;
    float _359 = _357;
    if (_299)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _361 = _355;
    bool _363 = _69 == 432;
    float _365 = _361;
    if (_299)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _367 = _359;
    float _369 = _367;
    if (_311)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _371 = _365;
    bool _373 = _69 == 448;
    float _375 = _371;
    if (_311)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _377 = _369;
    float _379 = _377;
    if (_321)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _381 = _375;
    bool _383 = _69 == 464;
    float _385 = _381;
    if (_321)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _387 = _379;
    float _389 = _387;
    if (_331)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _391 = _385;
    bool _393 = _69 == 480;
    float _395 = _391;
    if (_331)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_343)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _401 = _395;
    bool _403 = _69 == 496;
    float _405 = _401;
    if (_343)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _411 = _405;
    bool _413 = _69 == 512;
    float _415 = _411;
    if (_349)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _417 = _409;
    bool _419 = _69 == 528;
    float _421 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _423 = _415;
    float _425 = _423;
    if (_363)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _427 = _421;
    float _429 = _427;
    if (_373)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _431 = _425;
    bool _433 = _69 == 544;
    float _435 = _431;
    if (_373)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _437 = _429;
    float _439 = _437;
    if (_383)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _441 = _435;
    bool _443 = _69 == 560;
    float _445 = _441;
    if (_383)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _447 = _439;
    float _449 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _451 = _445;
    bool _453 = _69 == 576;
    float _455 = _451;
    if (_393)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _457 = _449;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _461 = _455;
    bool _463 = _69 == 592;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _471 = _465;
    bool _473 = _69 == 608;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _481 = _475;
    bool _483 = _69 == 624;
    float _485 = _481;
    if (_419)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _487 = _479;
    bool _489 = _69 == 640;
    float _491 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _493 = _485;
    float _495 = _493;
    if (_433)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _497 = _491;
    float _499 = _497;
    if (_443)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _501 = _495;
    bool _503 = _69 == 656;
    float _505 = _501;
    if (_443)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _507 = _499;
    float _509 = _507;
    if (_453)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _511 = _505;
    bool _513 = _69 == 672;
    float _515 = _511;
    if (_453)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _517 = _509;
    float _519 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _521 = _515;
    bool _523 = _69 == 688;
    float _525 = _521;
    if (_463)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _527 = _519;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _531 = _525;
    bool _533 = _69 == 704;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _541 = _535;
    bool _543 = _69 == 720;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _551 = _545;
    bool _553 = _69 == 736;
    float _555 = _551;
    if (_489)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _557 = _549;
    bool _559 = _69 == 752;
    float _561 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _563 = _555;
    float _565 = _563;
    if (_513)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _567 = _565;
    float _569 = _567;
    if (_523)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _571 = _569;
    float _573 = _571;
    if (_533)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _575 = _573;
    float _577 = _575;
    if (_543)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_553)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_559)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _587 = _585;
    float _589 = _337 * _587;
    if (_503)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _591 = _561;
    float _593 = _591;
    if (_513)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _595 = _593;
    float _597 = _589 * _54;
    float _599 = _589 * _56;
    float _601 = _595;
    if (_523)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _603 = _601;
    float _605 = floor(_597);
    float _607 = _603;
    if (_533)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _609 = _607;
    float _611 = _609;
    if (_543)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _613 = _611;
    float _615 = _613;
    if (_553)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _617 = _615;
    float _619 = _617;
    if (_559)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _621 = _619;
    float _623 = floor(_599);
    float _625 = _309 * _621;
    float _627 = -_605;
    float _629 = _597 + _627;
    float _631 = _629 * 2.0;
    float _633 = -_629;
    float _635 = fma(_625, _633, _54);
    int _637 = _277 + 8;
    uint _640 = uint(int(uint(_637) >> uint(2)));
    uint _642 = uint(int(uint(int(_640)) >> uint(2)));
    int _644 = int(_640) & 3;
    float _646 = (*spvDescriptorSet0.vp_c14)._m0[int(_642)][_644];
    int _648 = int(_640) + 1;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    int _652 = _648 & 3;
    float _654 = (*spvDescriptorSet0.vp_c14)._m0[int(_650)][_652];
    float _656 = -_623;
    float _658 = _599 + _656;
    float _660 = floor(_631);
    float _662 = _658 * 2.0;
    float _664 = -_658;
    float _666 = fma(_625, _664, _56);
    float _668 = floor(_662);
    float _670 = _625 * _660;
    float _672 = _670 * 0.5;
    float _674 = _672 + _635;
    float _676 = fma(_60, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = _625 * _668;
    float _680 = _678 * 0.5;
    float _682 = fma(_67, _674, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _686 = _680 + _666;
    float _688 = -_676;
    float _690 = _688 + _682;
    float _692 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _694 = _684 + _692;
    float _696 = fma(_686, _690, _676);
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _700 = _696 + _698;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _704 = _700 * _700;
    float _706 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _708 = _702 + _706;
    float _710 = fma(_694, _694, _704);
    float _712 = fma(_708, _708, _710);
    float _714 = sqrt(_712);
    float _716 = -_654;
    float _718 = fma(_714, _646, _716);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = -_672;
    float _724 = fma(_722, _720, _674);
    float _726 = -_680;
    float _728 = fma(_726, _720, _686);
    float _730 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _732 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
    float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _732);
    float2 _2149 = float2(_734, _736);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _746 = _740 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _750 = _742 + _748;
    float _752 = _746 * _746;
    float _754 = fma(_750, _750, _752);
    float _756 = sqrt(_754);
    bool _758 = _756 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _762 = _756 + _760;
    float _764 = (*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _766 = _756;
    float _768 = _714;
    float _770 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _772 = _646;
    if (_758)
    {
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _764 = _774;
    }
    float _776 = _764;
    if (_758)
    {
        float _778 = _762 * _776;
        _766 = _778;
    }
    float _780 = _766;
    if (_758)
    {
        float _782 = _780 * 0.15915493667125701904296875;
        _768 = _782;
    }
    float _784 = _768;
    float _786 = _762;
    float _788 = _784;
    if (_758)
    {
        float _790 = _784 * 6.283185482025146484375;
        float _792 = cos(_790);
        _786 = _792;
    }
    float _794 = _786;
    float _796 = _776;
    if (_758)
    {
        float _798 = _784 * 6.283185482025146484375;
        float _800 = sin(_798);
        _796 = _800;
    }
    float _802 = _796;
    float _804 = _736;
    if (_758)
    {
        float _806 = rsqrt(_754);
        _804 = _806;
    }
    float _808 = _804;
    float _810 = _794;
    if (_758)
    {
        float _812 = _794 + (-1.0);
        _770 = _812;
    }
    float _814 = _770;
    if (_758)
    {
        float _816 = _814 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _788 = _816;
    }
    float _818 = _788;
    float _820 = fma(_738, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _822 = _738;
    if (_758)
    {
        float _824 = _820 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _822 = _824;
    }
    float _826 = _822;
    out.m_38.x = _742;
    out.m_38.y = _820;
    out.m_38.z = _740;
    float _828 = _826;
    if (_758)
    {
        float _830 = fma(_802, _826, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _820 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _836 = _832;
    float _838 = _808;
    float _840 = _834;
    if (_758)
    {
        float _842 = _808 * _832;
        _772 = _842;
    }
    float _844 = _772;
    if (!_758)
    {
        _836 = _820;
    }
    float _846 = _836;
    float _848 = _846;
    if (_758)
    {
        float _850 = fma(_820, _794, _818);
        _848 = _850;
    }
    float _852 = _848;
    if (!_758)
    {
        _838 = _742;
    }
    float _854 = _838;
    float _856 = _854;
    if (_758)
    {
        float _858 = fma(_750, _844, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _856 = _858;
    }
    float _860 = _856;
    float _862 = fma(_742, (*spvDescriptorSet0.vp_c4)._m0[2].x, _834);
    float _864 = _852 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_758)
    {
        _840 = _740;
    }
    float _866 = _840;
    float _868 = _866;
    if (_758)
    {
        float _870 = _852 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _810 = _870;
    }
    float _872 = _810;
    float _874 = _872;
    if (_758)
    {
        float _876 = fma(_746, _844, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _868 = _876;
    }
    float _878 = _868;
    float _880 = _852 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[1].x, _864);
    float _884 = fma(_740, (*spvDescriptorSet0.vp_c4)._m0[2].z, _862);
    float _886 = _880;
    if (_758)
    {
        float _888 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[2].x, _872);
        _874 = _888;
    }
    float _890 = _874;
    float _892 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[0].x, _880);
    float _894 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[1].z, _882);
    float _896 = _884 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _898 = _890;
    if (_758)
    {
        float _900 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[2].z, _890);
        _898 = _900;
    }
    float _902 = _898;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[0].z, _892);
    float _906 = _894 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_758)
    {
        _886 = _896;
    }
    float _908 = _886;
    float _910 = _904 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _912 = _906 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _918 = _906 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _920 = _908;
    if (_758)
    {
        float _922 = _902 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _920 = _922;
    }
    float _924 = _920;
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _912);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _914);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _916);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _918);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].z, _926);
    float _936 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].z, _928);
    float _938 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].z, _930);
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].z, _932);
    float _942 = _934 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _938 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_40.w = _896;
    out.gl_Position.x = _944;
    out.gl_Position.y = _946;
    out.gl_Position.z = _942;
    out.gl_Position.w = _948;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_35.x;
    float _56 = in.m_35.y;
    float _58 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _60 = _58 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _63 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _65 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _67 = _65 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _69 = _63 << 4;
    bool _73 = _69 == 0;
    bool _75 = _69 == 16;
    bool _77 = _69 == 32;
    bool _79 = _69 == 48;
    bool _81 = _69 == 64;
    float _83 = fma(_60, _54, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _85 = fma(_67, _54, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _87 = _69 == 80;
    float _89 = as_type<float>(gl_BaseInstance);
    if (_73)
    {
        _89 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _91 = _89;
    float _93 = -_83;
    float _95 = _93 + _85;
    bool _97 = _69 == 96;
    float _99 = fma(_95, _56, _83);
    float _101 = fma(_54, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _103 = 0.0;
    float _105 = _91;
    if (_73)
    {
        _103 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _107 = _103;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _99 + _109;
    float _113 = _107;
    if (_75)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _115 = _105;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _119 = _101 + _117;
    float _121 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _123 = _111 * _111;
    bool _125 = _69 == 112;
    float _127 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _129 = _121 + _127;
    float _131 = fma(_119, _119, _123);
    float _133 = _115;
    if (_75)
    {
        _113 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _135 = _113;
    float _137 = _135;
    if (_77)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _139 = _133;
    float _141 = fma(_129, _129, _131);
    bool _143 = _69 == 128;
    float _145 = _139;
    if (_77)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _147 = _137;
    float _149 = rsqrt(_141);
    float _151 = _147;
    if (_79)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _153 = _145;
    bool _155 = _69 == 144;
    float _157 = _153;
    if (_79)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _159 = _151;
    float _161 = _159;
    if (_81)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _163 = _157;
    bool _165 = _69 == 160;
    float _167 = _163;
    if (_81)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_87)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _173 = _167;
    bool _175 = _69 == 176;
    float _177 = _149 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _179 = _173;
    if (_87)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _181 = _171;
    bool _183 = _69 == 192;
    float _185 = _181;
    if (_97)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _187 = _179;
    float _189 = log2(_177);
    float _191 = _187;
    if (_97)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _193 = _185;
    float _195 = _193;
    if (_125)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _197 = _191;
    bool _199 = _69 == 208;
    float _201 = _197;
    if (_125)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _203 = _195;
    float _205 = _203;
    if (_143)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _207 = _201;
    bool _209 = _69 == 224;
    float _211 = _207;
    if (_143)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _213 = _205;
    float _215 = _213;
    if (_155)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _217 = _211;
    float _219 = _189 + 1.2999999523162841796875;
    bool _221 = _69 == 240;
    float _223 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _225 = _215;
    float _227 = _225;
    if (_165)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _229 = _223;
    float _231 = trunc(_219);
    int _233 = int(_231);
    bool _235 = _69 == 256;
    float _237 = _229;
    if (_165)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _239 = _227;
    float _241 = _239;
    if (_175)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _243 = _237;
    bool _245 = _69 == 272;
    float _247 = _243;
    if (_175)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _249 = _241;
    float _251 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _253 = _247;
    bool _255 = _69 == 288;
    float _257 = _253;
    if (_183)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _259 = _251;
    int _261 = min(_233, 15);
    bool _263 = _69 == 304;
    float _265 = _259;
    if (_199)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _267 = _257;
    float _269 = float(_261);
    float _271 = _267;
    if (_199)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _273 = _265;
    int _275 = _261 << 4;
    int _277 = _275 + 4288;
    float _279 = _273;
    if (_209)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _281 = _271;
    bool _283 = _69 == 320;
    float _285 = -_269;
    float _287 = _285 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _289 = _281;
    if (_209)
    {
        _279 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _291 = _279;
    float _293 = _291;
    if (_221)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _295 = _289;
    float _297 = _287 + 1.0;
    bool _299 = _69 == 336;
    float _301 = _295;
    if (_221)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _303 = _293;
    float _305 = _303;
    if (_235)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _307 = _301;
    float _309 = exp2(_297);
    bool _311 = _69 == 352;
    float _313 = _307;
    if (_235)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _315 = _305;
    float _317 = _315;
    if (_245)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _319 = _313;
    bool _321 = _69 == 368;
    float _323 = _319;
    if (_245)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _325 = _317;
    float _327 = _325;
    if (_255)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _329 = _323;
    bool _331 = _69 == 384;
    float _333 = _329;
    if (_255)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _335 = _327;
    float _337 = 1.0 / _309;
    float _339 = _335;
    if (_263)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _341 = _333;
    bool _343 = _69 == 400;
    float _345 = _341;
    if (_263)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _347 = _339;
    bool _349 = _69 == 416;
    float _351 = _347;
    if (_283)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _353 = _345;
    float _355 = _353;
    if (_283)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _357 = _351;
    float _359 = _357;
    if (_299)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _361 = _355;
    bool _363 = _69 == 432;
    float _365 = _361;
    if (_299)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _367 = _359;
    float _369 = _367;
    if (_311)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _371 = _365;
    bool _373 = _69 == 448;
    float _375 = _371;
    if (_311)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _377 = _369;
    float _379 = _377;
    if (_321)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _381 = _375;
    bool _383 = _69 == 464;
    float _385 = _381;
    if (_321)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _387 = _379;
    float _389 = _387;
    if (_331)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _391 = _385;
    bool _393 = _69 == 480;
    float _395 = _391;
    if (_331)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_343)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _401 = _395;
    bool _403 = _69 == 496;
    float _405 = _401;
    if (_343)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _411 = _405;
    bool _413 = _69 == 512;
    float _415 = _411;
    if (_349)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _417 = _409;
    bool _419 = _69 == 528;
    float _421 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _423 = _415;
    float _425 = _423;
    if (_363)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _427 = _421;
    float _429 = _427;
    if (_373)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _431 = _425;
    bool _433 = _69 == 544;
    float _435 = _431;
    if (_373)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _437 = _429;
    float _439 = _437;
    if (_383)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _441 = _435;
    bool _443 = _69 == 560;
    float _445 = _441;
    if (_383)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _447 = _439;
    float _449 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _451 = _445;
    bool _453 = _69 == 576;
    float _455 = _451;
    if (_393)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _457 = _449;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _461 = _455;
    bool _463 = _69 == 592;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _471 = _465;
    bool _473 = _69 == 608;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _481 = _475;
    bool _483 = _69 == 624;
    float _485 = _481;
    if (_419)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _487 = _479;
    bool _489 = _69 == 640;
    float _491 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _493 = _485;
    float _495 = _493;
    if (_433)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _497 = _491;
    float _499 = _497;
    if (_443)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _501 = _495;
    bool _503 = _69 == 656;
    float _505 = _501;
    if (_443)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _507 = _499;
    float _509 = _507;
    if (_453)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _511 = _505;
    bool _513 = _69 == 672;
    float _515 = _511;
    if (_453)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _517 = _509;
    float _519 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _521 = _515;
    bool _523 = _69 == 688;
    float _525 = _521;
    if (_463)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _527 = _519;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _531 = _525;
    bool _533 = _69 == 704;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _541 = _535;
    bool _543 = _69 == 720;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _551 = _545;
    bool _553 = _69 == 736;
    float _555 = _551;
    if (_489)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _557 = _549;
    bool _559 = _69 == 752;
    float _561 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _563 = _555;
    float _565 = _563;
    if (_513)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _567 = _565;
    float _569 = _567;
    if (_523)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _571 = _569;
    float _573 = _571;
    if (_533)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _575 = _573;
    float _577 = _575;
    if (_543)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_553)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_559)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _587 = _585;
    float _589 = _337 * _587;
    if (_503)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _591 = _561;
    float _593 = _591;
    if (_513)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _595 = _593;
    float _597 = _589 * _54;
    float _599 = _589 * _56;
    float _601 = _595;
    if (_523)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _603 = _601;
    float _605 = floor(_597);
    float _607 = _603;
    if (_533)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _609 = _607;
    float _611 = _609;
    if (_543)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _613 = _611;
    float _615 = _613;
    if (_553)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _617 = _615;
    float _619 = _617;
    if (_559)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _621 = _619;
    float _623 = floor(_599);
    float _625 = _309 * _621;
    float _627 = -_605;
    float _629 = _597 + _627;
    float _631 = _629 * 2.0;
    float _633 = -_629;
    float _635 = fma(_625, _633, _54);
    int _637 = _277 + 8;
    uint _640 = uint(int(uint(_637) >> uint(2)));
    uint _642 = uint(int(uint(int(_640)) >> uint(2)));
    int _644 = int(_640) & 3;
    float _646 = (*spvDescriptorSet0.vp_c14)._m0[int(_642)][_644];
    int _648 = int(_640) + 1;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    int _652 = _648 & 3;
    float _654 = (*spvDescriptorSet0.vp_c14)._m0[int(_650)][_652];
    float _656 = -_623;
    float _658 = _599 + _656;
    float _660 = floor(_631);
    float _662 = _658 * 2.0;
    float _664 = -_658;
    float _666 = fma(_625, _664, _56);
    float _668 = floor(_662);
    float _670 = _625 * _660;
    float _672 = _670 * 0.5;
    float _674 = _672 + _635;
    float _676 = fma(_60, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = _625 * _668;
    float _680 = _678 * 0.5;
    float _682 = fma(_67, _674, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _686 = _680 + _666;
    float _688 = -_676;
    float _690 = _688 + _682;
    float _692 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _694 = _684 + _692;
    float _696 = fma(_686, _690, _676);
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _700 = _696 + _698;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _704 = _700 * _700;
    float _706 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _708 = _702 + _706;
    float _710 = fma(_694, _694, _704);
    float _712 = fma(_708, _708, _710);
    float _714 = sqrt(_712);
    float _716 = -_654;
    float _718 = fma(_714, _646, _716);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = -_672;
    float _724 = fma(_722, _720, _674);
    float _726 = -_680;
    float _728 = fma(_726, _720, _686);
    float _730 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _732 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
    float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _732);
    float2 _2149 = float2(_734, _736);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _746 = _740 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _750 = _742 + _748;
    float _752 = _746 * _746;
    float _754 = fma(_750, _750, _752);
    float _756 = sqrt(_754);
    bool _758 = _756 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _762 = _756 + _760;
    float _764 = (*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _766 = _756;
    float _768 = _714;
    float _770 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _772 = _646;
    if (_758)
    {
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _764 = _774;
    }
    float _776 = _764;
    if (_758)
    {
        float _778 = _762 * _776;
        _766 = _778;
    }
    float _780 = _766;
    if (_758)
    {
        float _782 = _780 * 0.15915493667125701904296875;
        _768 = _782;
    }
    float _784 = _768;
    float _786 = _762;
    float _788 = _784;
    if (_758)
    {
        float _790 = _784 * 6.283185482025146484375;
        float _792 = cos(_790);
        _786 = _792;
    }
    float _794 = _786;
    float _796 = _776;
    if (_758)
    {
        float _798 = _784 * 6.283185482025146484375;
        float _800 = sin(_798);
        _796 = _800;
    }
    float _802 = _796;
    float _804 = _736;
    if (_758)
    {
        float _806 = rsqrt(_754);
        _804 = _806;
    }
    float _808 = _804;
    float _810 = _794;
    if (_758)
    {
        float _812 = _794 + (-1.0);
        _770 = _812;
    }
    float _814 = _770;
    if (_758)
    {
        float _816 = _814 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _788 = _816;
    }
    float _818 = _788;
    float _820 = fma(_738, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _822 = _738;
    if (_758)
    {
        float _824 = _820 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _822 = _824;
    }
    float _826 = _822;
    out.m_38.x = _742;
    out.m_38.y = _820;
    out.m_38.z = _740;
    float _828 = _826;
    if (_758)
    {
        float _830 = fma(_802, _826, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _820 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _836 = _832;
    float _838 = _808;
    float _840 = _834;
    if (_758)
    {
        float _842 = _808 * _832;
        _772 = _842;
    }
    float _844 = _772;
    if (!_758)
    {
        _836 = _820;
    }
    float _846 = _836;
    float _848 = _846;
    if (_758)
    {
        float _850 = fma(_820, _794, _818);
        _848 = _850;
    }
    float _852 = _848;
    if (!_758)
    {
        _838 = _742;
    }
    float _854 = _838;
    float _856 = _854;
    if (_758)
    {
        float _858 = fma(_750, _844, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _856 = _858;
    }
    float _860 = _856;
    float _862 = fma(_742, (*spvDescriptorSet0.vp_c4)._m0[2].x, _834);
    float _864 = _852 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_758)
    {
        _840 = _740;
    }
    float _866 = _840;
    float _868 = _866;
    if (_758)
    {
        float _870 = _852 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _810 = _870;
    }
    float _872 = _810;
    float _874 = _872;
    if (_758)
    {
        float _876 = fma(_746, _844, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _868 = _876;
    }
    float _878 = _868;
    float _880 = _852 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[1].x, _864);
    float _884 = fma(_740, (*spvDescriptorSet0.vp_c4)._m0[2].z, _862);
    float _886 = _880;
    if (_758)
    {
        float _888 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[2].x, _872);
        _874 = _888;
    }
    float _890 = _874;
    float _892 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[0].x, _880);
    float _894 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[1].z, _882);
    float _896 = _884 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _898 = _890;
    if (_758)
    {
        float _900 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[2].z, _890);
        _898 = _900;
    }
    float _902 = _898;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[0].z, _892);
    float _906 = _894 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_758)
    {
        _886 = _896;
    }
    float _908 = _886;
    float _910 = _904 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _912 = _906 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _918 = _906 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _920 = _908;
    if (_758)
    {
        float _922 = _902 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _920 = _922;
    }
    float _924 = _920;
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _912);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _914);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _916);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _918);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].z, _926);
    float _936 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].z, _928);
    float _938 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].z, _930);
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].z, _932);
    float _942 = _934 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _938 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_40.w = _896;
    out.gl_Position.x = _944;
    out.gl_Position.y = _946;
    out.gl_Position.z = _942;
    out.gl_Position.w = _948;
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_35.x;
    float _56 = in.m_35.y;
    float _58 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _60 = _58 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _63 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _65 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _67 = _65 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _69 = _63 << 4;
    bool _73 = _69 == 0;
    bool _75 = _69 == 16;
    bool _77 = _69 == 32;
    bool _79 = _69 == 48;
    bool _81 = _69 == 64;
    float _83 = fma(_60, _54, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _85 = fma(_67, _54, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _87 = _69 == 80;
    float _89 = as_type<float>(gl_BaseInstance);
    if (_73)
    {
        _89 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _91 = _89;
    float _93 = -_83;
    float _95 = _93 + _85;
    bool _97 = _69 == 96;
    float _99 = fma(_95, _56, _83);
    float _101 = fma(_54, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _103 = 0.0;
    float _105 = _91;
    if (_73)
    {
        _103 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _107 = _103;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _99 + _109;
    float _113 = _107;
    if (_75)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _115 = _105;
    float _117 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _119 = _101 + _117;
    float _121 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _123 = _111 * _111;
    bool _125 = _69 == 112;
    float _127 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _129 = _121 + _127;
    float _131 = fma(_119, _119, _123);
    float _133 = _115;
    if (_75)
    {
        _113 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _135 = _113;
    float _137 = _135;
    if (_77)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _139 = _133;
    float _141 = fma(_129, _129, _131);
    bool _143 = _69 == 128;
    float _145 = _139;
    if (_77)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _147 = _137;
    float _149 = rsqrt(_141);
    float _151 = _147;
    if (_79)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _153 = _145;
    bool _155 = _69 == 144;
    float _157 = _153;
    if (_79)
    {
        _151 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _159 = _151;
    float _161 = _159;
    if (_81)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _163 = _157;
    bool _165 = _69 == 160;
    float _167 = _163;
    if (_81)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_87)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _173 = _167;
    bool _175 = _69 == 176;
    float _177 = _149 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _179 = _173;
    if (_87)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _181 = _171;
    bool _183 = _69 == 192;
    float _185 = _181;
    if (_97)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _187 = _179;
    float _189 = log2(_177);
    float _191 = _187;
    if (_97)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _193 = _185;
    float _195 = _193;
    if (_125)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _197 = _191;
    bool _199 = _69 == 208;
    float _201 = _197;
    if (_125)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _203 = _195;
    float _205 = _203;
    if (_143)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _207 = _201;
    bool _209 = _69 == 224;
    float _211 = _207;
    if (_143)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _213 = _205;
    float _215 = _213;
    if (_155)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _217 = _211;
    float _219 = _189 + 1.2999999523162841796875;
    bool _221 = _69 == 240;
    float _223 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _225 = _215;
    float _227 = _225;
    if (_165)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _229 = _223;
    float _231 = trunc(_219);
    int _233 = int(_231);
    bool _235 = _69 == 256;
    float _237 = _229;
    if (_165)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _239 = _227;
    float _241 = _239;
    if (_175)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _243 = _237;
    bool _245 = _69 == 272;
    float _247 = _243;
    if (_175)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _249 = _241;
    float _251 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _253 = _247;
    bool _255 = _69 == 288;
    float _257 = _253;
    if (_183)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _259 = _251;
    int _261 = min(_233, 15);
    bool _263 = _69 == 304;
    float _265 = _259;
    if (_199)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _267 = _257;
    float _269 = float(_261);
    float _271 = _267;
    if (_199)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _273 = _265;
    int _275 = _261 << 4;
    int _277 = _275 + 4288;
    float _279 = _273;
    if (_209)
    {
        _271 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _281 = _271;
    bool _283 = _69 == 320;
    float _285 = -_269;
    float _287 = _285 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _289 = _281;
    if (_209)
    {
        _279 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _291 = _279;
    float _293 = _291;
    if (_221)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _295 = _289;
    float _297 = _287 + 1.0;
    bool _299 = _69 == 336;
    float _301 = _295;
    if (_221)
    {
        _293 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _303 = _293;
    float _305 = _303;
    if (_235)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _307 = _301;
    float _309 = exp2(_297);
    bool _311 = _69 == 352;
    float _313 = _307;
    if (_235)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _315 = _305;
    float _317 = _315;
    if (_245)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _319 = _313;
    bool _321 = _69 == 368;
    float _323 = _319;
    if (_245)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _325 = _317;
    float _327 = _325;
    if (_255)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _329 = _323;
    bool _331 = _69 == 384;
    float _333 = _329;
    if (_255)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _335 = _327;
    float _337 = 1.0 / _309;
    float _339 = _335;
    if (_263)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _341 = _333;
    bool _343 = _69 == 400;
    float _345 = _341;
    if (_263)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _347 = _339;
    bool _349 = _69 == 416;
    float _351 = _347;
    if (_283)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _353 = _345;
    float _355 = _353;
    if (_283)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _357 = _351;
    float _359 = _357;
    if (_299)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _361 = _355;
    bool _363 = _69 == 432;
    float _365 = _361;
    if (_299)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _367 = _359;
    float _369 = _367;
    if (_311)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _371 = _365;
    bool _373 = _69 == 448;
    float _375 = _371;
    if (_311)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _377 = _369;
    float _379 = _377;
    if (_321)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _381 = _375;
    bool _383 = _69 == 464;
    float _385 = _381;
    if (_321)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _387 = _379;
    float _389 = _387;
    if (_331)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _391 = _385;
    bool _393 = _69 == 480;
    float _395 = _391;
    if (_331)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_343)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _401 = _395;
    bool _403 = _69 == 496;
    float _405 = _401;
    if (_343)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _411 = _405;
    bool _413 = _69 == 512;
    float _415 = _411;
    if (_349)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _417 = _409;
    bool _419 = _69 == 528;
    float _421 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _423 = _415;
    float _425 = _423;
    if (_363)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _427 = _421;
    float _429 = _427;
    if (_373)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _431 = _425;
    bool _433 = _69 == 544;
    float _435 = _431;
    if (_373)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _437 = _429;
    float _439 = _437;
    if (_383)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _441 = _435;
    bool _443 = _69 == 560;
    float _445 = _441;
    if (_383)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _447 = _439;
    float _449 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _451 = _445;
    bool _453 = _69 == 576;
    float _455 = _451;
    if (_393)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _457 = _449;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _461 = _455;
    bool _463 = _69 == 592;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _471 = _465;
    bool _473 = _69 == 608;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _481 = _475;
    bool _483 = _69 == 624;
    float _485 = _481;
    if (_419)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _487 = _479;
    bool _489 = _69 == 640;
    float _491 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _493 = _485;
    float _495 = _493;
    if (_433)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _497 = _491;
    float _499 = _497;
    if (_443)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _501 = _495;
    bool _503 = _69 == 656;
    float _505 = _501;
    if (_443)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _507 = _499;
    float _509 = _507;
    if (_453)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _511 = _505;
    bool _513 = _69 == 672;
    float _515 = _511;
    if (_453)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _517 = _509;
    float _519 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _521 = _515;
    bool _523 = _69 == 688;
    float _525 = _521;
    if (_463)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _527 = _519;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _531 = _525;
    bool _533 = _69 == 704;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _541 = _535;
    bool _543 = _69 == 720;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _551 = _545;
    bool _553 = _69 == 736;
    float _555 = _551;
    if (_489)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _557 = _549;
    bool _559 = _69 == 752;
    float _561 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _563 = _555;
    float _565 = _563;
    if (_513)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _567 = _565;
    float _569 = _567;
    if (_523)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _571 = _569;
    float _573 = _571;
    if (_533)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _575 = _573;
    float _577 = _575;
    if (_543)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_553)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_559)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _587 = _585;
    float _589 = _337 * _587;
    if (_503)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _591 = _561;
    float _593 = _591;
    if (_513)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _595 = _593;
    float _597 = _589 * _54;
    float _599 = _589 * _56;
    float _601 = _595;
    if (_523)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _603 = _601;
    float _605 = floor(_597);
    float _607 = _603;
    if (_533)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _609 = _607;
    float _611 = _609;
    if (_543)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _613 = _611;
    float _615 = _613;
    if (_553)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _617 = _615;
    float _619 = _617;
    if (_559)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _621 = _619;
    float _623 = floor(_599);
    float _625 = _309 * _621;
    float _627 = -_605;
    float _629 = _597 + _627;
    float _631 = _629 * 2.0;
    float _633 = -_629;
    float _635 = fma(_625, _633, _54);
    int _637 = _277 + 8;
    uint _640 = uint(int(uint(_637) >> uint(2)));
    uint _642 = uint(int(uint(int(_640)) >> uint(2)));
    int _644 = int(_640) & 3;
    float _646 = (*spvDescriptorSet0.vp_c14)._m0[int(_642)][_644];
    int _648 = int(_640) + 1;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    int _652 = _648 & 3;
    float _654 = (*spvDescriptorSet0.vp_c14)._m0[int(_650)][_652];
    float _656 = -_623;
    float _658 = _599 + _656;
    float _660 = floor(_631);
    float _662 = _658 * 2.0;
    float _664 = -_658;
    float _666 = fma(_625, _664, _56);
    float _668 = floor(_662);
    float _670 = _625 * _660;
    float _672 = _670 * 0.5;
    float _674 = _672 + _635;
    float _676 = fma(_60, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = _625 * _668;
    float _680 = _678 * 0.5;
    float _682 = fma(_67, _674, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _686 = _680 + _666;
    float _688 = -_676;
    float _690 = _688 + _682;
    float _692 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _694 = _684 + _692;
    float _696 = fma(_686, _690, _676);
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _700 = _696 + _698;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _704 = _700 * _700;
    float _706 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _708 = _702 + _706;
    float _710 = fma(_694, _694, _704);
    float _712 = fma(_708, _708, _710);
    float _714 = sqrt(_712);
    float _716 = -_654;
    float _718 = fma(_714, _646, _716);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = -_672;
    float _724 = fma(_722, _720, _674);
    float _726 = -_680;
    float _728 = fma(_726, _720, _686);
    float _730 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _732 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
    float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _732);
    float2 _2149 = float2(_734, _736);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _746 = _740 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _750 = _742 + _748;
    float _752 = _746 * _746;
    float _754 = fma(_750, _750, _752);
    float _756 = sqrt(_754);
    bool _758 = _756 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _762 = _756 + _760;
    float _764 = (*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _766 = _756;
    float _768 = _714;
    float _770 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _772 = _646;
    if (_758)
    {
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _764 = _774;
    }
    float _776 = _764;
    if (_758)
    {
        float _778 = _762 * _776;
        _766 = _778;
    }
    float _780 = _766;
    if (_758)
    {
        float _782 = _780 * 0.15915493667125701904296875;
        _768 = _782;
    }
    float _784 = _768;
    float _786 = _762;
    float _788 = _784;
    if (_758)
    {
        float _790 = _784 * 6.283185482025146484375;
        float _792 = cos(_790);
        _786 = _792;
    }
    float _794 = _786;
    float _796 = _776;
    if (_758)
    {
        float _798 = _784 * 6.283185482025146484375;
        float _800 = sin(_798);
        _796 = _800;
    }
    float _802 = _796;
    float _804 = _736;
    if (_758)
    {
        float _806 = rsqrt(_754);
        _804 = _806;
    }
    float _808 = _804;
    float _810 = _794;
    if (_758)
    {
        float _812 = _794 + (-1.0);
        _770 = _812;
    }
    float _814 = _770;
    if (_758)
    {
        float _816 = _814 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _788 = _816;
    }
    float _818 = _788;
    float _820 = fma(_738, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _822 = _738;
    if (_758)
    {
        float _824 = _820 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _822 = _824;
    }
    float _826 = _822;
    out.m_38.x = _742;
    out.m_38.y = _820;
    out.m_38.z = _740;
    float _828 = _826;
    if (_758)
    {
        float _830 = fma(_802, _826, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _820 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _836 = _832;
    float _838 = _808;
    float _840 = _834;
    if (_758)
    {
        float _842 = _808 * _832;
        _772 = _842;
    }
    float _844 = _772;
    if (!_758)
    {
        _836 = _820;
    }
    float _846 = _836;
    float _848 = _846;
    if (_758)
    {
        float _850 = fma(_820, _794, _818);
        _848 = _850;
    }
    float _852 = _848;
    if (!_758)
    {
        _838 = _742;
    }
    float _854 = _838;
    float _856 = _854;
    if (_758)
    {
        float _858 = fma(_750, _844, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _856 = _858;
    }
    float _860 = _856;
    float _862 = fma(_742, (*spvDescriptorSet0.vp_c4)._m0[2].x, _834);
    float _864 = _852 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_758)
    {
        _840 = _740;
    }
    float _866 = _840;
    float _868 = _866;
    if (_758)
    {
        float _870 = _852 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _810 = _870;
    }
    float _872 = _810;
    float _874 = _872;
    if (_758)
    {
        float _876 = fma(_746, _844, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _868 = _876;
    }
    float _878 = _868;
    float _880 = _852 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[1].x, _864);
    float _884 = fma(_740, (*spvDescriptorSet0.vp_c4)._m0[2].z, _862);
    float _886 = _880;
    if (_758)
    {
        float _888 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[2].x, _872);
        _874 = _888;
    }
    float _890 = _874;
    float _892 = fma(_860, (*spvDescriptorSet0.vp_c4)._m0[0].x, _880);
    float _894 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[1].z, _882);
    float _896 = _884 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _898 = _890;
    if (_758)
    {
        float _900 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[2].z, _890);
        _898 = _900;
    }
    float _902 = _898;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[0].z, _892);
    float _906 = _894 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_758)
    {
        _886 = _896;
    }
    float _908 = _886;
    float _910 = _904 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _912 = _906 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _918 = _906 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _920 = _908;
    if (_758)
    {
        float _922 = _902 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _920 = _922;
    }
    float _924 = _920;
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _912);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _914);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _916);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _918);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].z, _926);
    float _936 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].z, _928);
    float _938 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].z, _930);
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].z, _932);
    float _942 = _934 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _938 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_40.w = _896;
    out.gl_Position.x = _944;
    out.gl_Position.y = _946;
    out.gl_Position.z = _942;
    out.gl_Position.w = _948;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

