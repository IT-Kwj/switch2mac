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
    float4 m_38 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_35.x;
    float _68 = in.m_35.y;
    float _70 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _72 = _70 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _75 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _77 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _79 = _77 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _81 = _75 << 4;
    bool _85 = _81 == 0;
    bool _87 = _81 == 16;
    bool _89 = _81 == 32;
    bool _91 = _81 == 48;
    bool _93 = _81 == 64;
    float _95 = fma(_72, _66, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _97 = fma(_79, _66, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _99 = _81 == 80;
    float _101 = as_type<float>(gl_BaseInstance);
    if (_85)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _103 = _101;
    float _105 = -_95;
    float _107 = _105 + _97;
    bool _109 = _81 == 96;
    float _111 = fma(_107, _68, _95);
    float _113 = fma(_66, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _115 = 0.0;
    float _117 = _103;
    if (_85)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _123 = _111 + _121;
    float _125 = _119;
    if (_87)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _127 = _117;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _131 = _113 + _129;
    float _133 = fma(_68, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _135 = _123 * _123;
    bool _137 = _81 == 112;
    float _139 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _141 = _133 + _139;
    float _143 = fma(_131, _131, _135);
    float _145 = _127;
    if (_87)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _125;
    float _149 = _147;
    if (_89)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = fma(_141, _141, _143);
    bool _155 = _81 == 128;
    float _157 = _151;
    if (_89)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = rsqrt(_153);
    float _163 = _159;
    if (_91)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _165 = _157;
    bool _167 = _81 == 144;
    float _169 = _165;
    if (_91)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_93)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _175 = _169;
    bool _177 = _81 == 160;
    float _179 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _181 = _173;
    float _183 = _181;
    if (_99)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _179;
    bool _187 = _81 == 176;
    float _189 = _161 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _191 = _185;
    if (_99)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _193 = _183;
    bool _195 = _81 == 192;
    float _197 = _193;
    if (_109)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _199 = _191;
    float _201 = log2(_189);
    float _203 = _199;
    if (_109)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_137)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _209 = _203;
    bool _211 = _81 == 208;
    float _213 = _209;
    if (_137)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_155)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _219 = _213;
    bool _221 = _81 == 224;
    float _223 = _219;
    if (_155)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _225 = _217;
    float _227 = _225;
    if (_167)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _229 = _223;
    float _231 = _201 + 1.2999999523162841796875;
    bool _233 = _81 == 240;
    float _235 = _229;
    if (_167)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _237 = _227;
    float _239 = _237;
    if (_177)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _241 = _235;
    float _243 = trunc(_231);
    int _245 = int(_243);
    bool _247 = _81 == 256;
    float _249 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _251 = _239;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _255 = _249;
    bool _257 = _81 == 272;
    float _259 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_195)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _265 = _259;
    bool _267 = _81 == 288;
    float _269 = _265;
    if (_195)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _263;
    int _273 = min(_245, 15);
    bool _275 = _81 == 304;
    float _277 = _271;
    if (_211)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _279 = _269;
    float _281 = float(_273);
    float _283 = _279;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _277;
    int _287 = _273 << 4;
    int _289 = _287 + 4288;
    float _291 = _285;
    if (_221)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _293 = _283;
    bool _295 = _81 == 320;
    float _297 = -_281;
    float _299 = _297 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _301 = _293;
    if (_221)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _303 = _291;
    float _305 = _303;
    if (_233)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _307 = _301;
    float _309 = _299 + 1.0;
    bool _311 = _81 == 336;
    float _313 = _307;
    if (_233)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _315 = _305;
    float _317 = _315;
    if (_247)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _319 = _313;
    float _321 = exp2(_309);
    bool _323 = _81 == 352;
    float _325 = _319;
    if (_247)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _327 = _317;
    float _329 = _327;
    if (_257)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _331 = _325;
    bool _333 = _81 == 368;
    float _335 = _331;
    if (_257)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _337 = _329;
    float _339 = _337;
    if (_267)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _341 = _335;
    bool _343 = _81 == 384;
    float _345 = _341;
    if (_267)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _347 = _339;
    float _349 = 1.0 / _321;
    float _351 = _347;
    if (_275)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _353 = _345;
    bool _355 = _81 == 400;
    float _357 = _353;
    if (_275)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _359 = _351;
    bool _361 = _81 == 416;
    float _363 = _359;
    if (_295)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _365 = _357;
    float _367 = _365;
    if (_295)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _369 = _363;
    float _371 = _369;
    if (_311)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _373 = _367;
    bool _375 = _81 == 432;
    float _377 = _373;
    if (_311)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _379 = _371;
    float _381 = _379;
    if (_323)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _383 = _377;
    bool _385 = _81 == 448;
    float _387 = _383;
    if (_323)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_333)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _393 = _387;
    bool _395 = _81 == 464;
    float _397 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_343)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _403 = _397;
    bool _405 = _81 == 480;
    float _407 = _403;
    if (_343)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_355)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _413 = _407;
    bool _415 = _81 == 496;
    float _417 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _423 = _417;
    bool _425 = _81 == 512;
    float _427 = _423;
    if (_361)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _429 = _421;
    bool _431 = _81 == 528;
    float _433 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _435 = _427;
    float _437 = _435;
    if (_375)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _439 = _433;
    float _441 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _443 = _437;
    bool _445 = _81 == 544;
    float _447 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _449 = _441;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _453 = _447;
    bool _455 = _81 == 560;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _463 = _457;
    bool _465 = _81 == 576;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _473 = _467;
    bool _475 = _81 == 592;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _483 = _477;
    bool _485 = _81 == 608;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _493 = _487;
    bool _495 = _81 == 624;
    float _497 = _493;
    if (_431)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _499 = _491;
    bool _501 = _81 == 640;
    float _503 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _505 = _497;
    float _507 = _505;
    if (_445)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _509 = _503;
    float _511 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _513 = _507;
    bool _515 = _81 == 656;
    float _517 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _519 = _511;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _523 = _517;
    bool _525 = _81 == 672;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _533 = _527;
    bool _535 = _81 == 688;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _543 = _537;
    bool _545 = _81 == 704;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _553 = _547;
    bool _555 = _81 == 720;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _563 = _557;
    bool _565 = _81 == 736;
    float _567 = _563;
    if (_501)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _569 = _561;
    bool _571 = _81 == 752;
    float _573 = _569;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _575 = _567;
    float _577 = _575;
    if (_525)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_535)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_545)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_555)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _591 = _589;
    float _593 = _591;
    if (_565)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_571)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _599 = _597;
    float _601 = _349 * _599;
    if (_515)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _603 = _573;
    float _605 = _603;
    if (_525)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _607 = _605;
    float _609 = _601 * _66;
    float _611 = _601 * _68;
    float _613 = _607;
    if (_535)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _615 = _613;
    float _617 = floor(_609);
    float _619 = _615;
    if (_545)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_555)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _625 = _623;
    float _627 = _625;
    if (_565)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_571)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _633 = _631;
    float _635 = floor(_611);
    float _637 = _321 * _633;
    float _639 = -_617;
    float _641 = _609 + _639;
    float _643 = _641 * 2.0;
    float _645 = -_641;
    float _647 = fma(_637, _645, _66);
    int _649 = _289 + 8;
    uint _652 = uint(int(uint(_649) >> uint(2)));
    uint _654 = uint(int(uint(int(_652)) >> uint(2)));
    int _656 = int(_652) & 3;
    float _658 = (*spvDescriptorSet0.vp_c14)._m0[int(_654)][_656];
    int _660 = int(_652) + 1;
    uint _662 = uint(int(uint(_660) >> uint(2)));
    int _664 = _660 & 3;
    float _666 = (*spvDescriptorSet0.vp_c14)._m0[int(_662)][_664];
    float _668 = -_635;
    float _670 = _611 + _668;
    float _672 = floor(_643);
    float _674 = _670 * 2.0;
    float _676 = -_670;
    float _678 = fma(_637, _676, _68);
    float _680 = floor(_674);
    float _682 = _637 * _672;
    float _684 = _682 * 0.5;
    float _686 = _684 + _647;
    float _688 = fma(_72, _686, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _690 = _637 * _680;
    float _692 = _690 * 0.5;
    float _694 = fma(_79, _686, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _698 = _692 + _678;
    float _700 = -_688;
    float _702 = _700 + _694;
    float _704 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _706 = _696 + _704;
    float _708 = fma(_698, _702, _688);
    float _710 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _712 = _708 + _710;
    float _714 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _716 = _712 * _712;
    float _718 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _720 = _714 + _718;
    float _722 = fma(_706, _706, _716);
    float _724 = fma(_720, _720, _722);
    float _726 = sqrt(_724);
    float _728 = -_666;
    float _730 = fma(_726, _658, _728);
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = -_684;
    float _736 = fma(_734, _732, _686);
    float _738 = -_692;
    float _740 = fma(_738, _732, _698);
    float _742 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _744 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _746 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _742);
    float _748 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _744);
    float2 _2269 = float2(_746, _748);
    float _750 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2269, float2(0.0), isnan(_2269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2269, float2(0.0), isnan(_2269)), level(0.0)).x;
    float _752 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _758 = _752 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _762 = _754 + _760;
    float _764 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _766 = _758 * _758;
    float _768 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _772 = fma(_762, _762, _766);
    float _774 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    out.m_38.z = _764;
    out.m_38.w = _768;
    float _776 = sqrt(_772);
    out.m_40.y = _774;
    out.m_40.x = _770;
    out.m_40.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    bool _778 = _776 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _782 = _776 + _780;
    float _784 = _726;
    float _786 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _788 = _748;
    float _790 = _782;
    float _792 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _794 = _658;
    float _796 = _764;
    float _798 = _754;
    if (_778)
    {
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _784 = _800;
    }
    float _802 = _784;
    if (_778)
    {
        float _804 = rsqrt(_772);
        _786 = _804;
    }
    float _806 = _786;
    if (_778)
    {
        float _808 = _782 * _802;
        _788 = _808;
    }
    float _810 = _788;
    if (_778)
    {
        float _812 = _810 * 0.15915493667125701904296875;
        _790 = _812;
    }
    float _814 = _790;
    float _816 = _802;
    float _818 = _814;
    if (_778)
    {
        float _820 = _814 * 6.283185482025146484375;
        float _822 = cos(_820);
        _816 = _822;
    }
    float _824 = _816;
    float _826 = _810;
    if (_778)
    {
        float _828 = _814 * 6.283185482025146484375;
        float _830 = sin(_828);
        _826 = _830;
    }
    float _832 = _826;
    if (_778)
    {
        float _834 = _824 + (-1.0);
        _818 = _834;
    }
    float _836 = _818;
    float _838 = fma(_750, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _840 = _750;
    if (_778)
    {
        float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _792 = _842;
    }
    float _844 = _792;
    if (_778)
    {
        float _846 = _838 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _840 = _846;
    }
    float _848 = _840;
    float _850 = _838 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    out.m_42.x = _754;
    out.m_42.y = _838;
    out.m_42.z = _752;
    float _852 = _838 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _854 = _832;
    if (_778)
    {
        float _856 = fma(_832, _848, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _794 = _856;
    }
    float _858 = _794;
    if (!_778)
    {
        _854 = _838;
    }
    float _860 = _854;
    float _862 = _860;
    if (_778)
    {
        float _864 = fma(_838, _824, _844);
        _862 = _864;
    }
    float _866 = _862;
    float _868 = _838 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _870 = _868;
    float _872 = _866;
    if (_778)
    {
        float _874 = _806 * _858;
        _796 = _874;
    }
    float _876 = _796;
    float _878 = _838 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _880 = _838 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _882 = _838 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _884 = _838 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _886 = _838 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _888 = _838 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _890 = _838 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _892 = _838 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _894 = _838 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _896 = _838 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _898 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[44].x, _850);
    float _900 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[42].x, _868);
    float _902 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[45].x, _852);
    float _904 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[43].x, _878);
    float _906 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[46].x, _880);
    float _908 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[47].x, _882);
    float _910 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[48].x, _884);
    float _912 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[49].x, _886);
    float _914 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[50].x, _888);
    float _916 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[51].x, _890);
    float _918 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[52].x, _892);
    float _920 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[53].x, _894);
    float _922 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[2].x, _896);
    float _924 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[44].z, _898);
    float _926 = _900;
    if (_778)
    {
        float _928 = fma(_762, _876, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _798 = _928;
    }
    float _930 = _798;
    float _932 = _866 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _934 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[42].z, _900);
    if (!_778)
    {
        _870 = _752;
    }
    float _936 = _870;
    float _938 = _936;
    if (_778)
    {
        float _940 = _866 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _926 = _940;
    }
    float _942 = _926;
    float _944 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[43].z, _904);
    if (_778)
    {
        float _946 = fma(_758, _876, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _938 = _946;
    }
    float _948 = _938;
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[1].x, _932);
    float _952 = _866 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _954 = _950;
    if (_778)
    {
        float _956 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[2].x, _942);
        _872 = _956;
    }
    float _958 = _872;
    float _960 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[2].z, _922);
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[1].z, _950);
    float _964 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[0].x, _952);
    float _966 = _958;
    if (_778)
    {
        float _968 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[2].z, _958);
        _966 = _968;
    }
    float _970 = _966;
    float _972 = _960 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _974 = _962 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _976 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[0].z, _964);
    float _978 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[45].z, _902);
    float _980 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[46].z, _906);
    float _982 = _974 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _984 = _974 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _988 = _976 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _990 = _974 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    if (!_778)
    {
        _954 = _972;
    }
    float _992 = _954;
    float _994 = _992;
    if (_778)
    {
        float _996 = _970 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[7].x, _982);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[8].x, _984);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[9].x, _986);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[10].x, _990);
    float _1008 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[47].z, _908);
    float _1010 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[48].z, _910);
    float _1012 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[49].z, _912);
    float _1014 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[50].z, _914);
    float _1016 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[51].z, _916);
    float _1018 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[52].z, _918);
    float _1020 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[53].z, _920);
    float _1022 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1000);
    float _1024 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1002);
    float _1026 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1004);
    float _1028 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1006);
    float _1030 = _934 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _1032 = _944 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _1034 = _924 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _1036 = _978 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _1038 = -_972;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1042 = _1038 + _1040;
    float _1044 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1046 = _1016 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1048 = _1018 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_44.x = _1030;
    out.m_44.y = _1032;
    out.m_44.z = _1034;
    out.m_44.w = _1036;
    float _1052 = _1022 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1054 = _1020 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1056 = _1024 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1058 = _1026 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1060 = _1028 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.w = _972;
    out.m_48.x = _1044;
    out.m_48.y = _1046;
    out.m_48.z = _1048;
    out.m_48.w = _1054;
    float _1062 = _980 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1064 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1066 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1068 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_50.w = _1050;
    out.m_52.x = _1062;
    out.m_52.y = _1064;
    out.m_52.z = _1066;
    out.m_52.w = _1068;
    out.gl_Position.x = _1052;
    out.gl_Position.y = _1056;
    out.gl_Position.z = _1058;
    out.gl_Position.w = _1060;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_35.x;
    float _68 = in.m_35.y;
    float _70 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _72 = _70 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _75 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _77 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _79 = _77 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _81 = _75 << 4;
    bool _85 = _81 == 0;
    bool _87 = _81 == 16;
    bool _89 = _81 == 32;
    bool _91 = _81 == 48;
    bool _93 = _81 == 64;
    float _95 = fma(_72, _66, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _97 = fma(_79, _66, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _99 = _81 == 80;
    float _101 = as_type<float>(gl_BaseInstance);
    if (_85)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _103 = _101;
    float _105 = -_95;
    float _107 = _105 + _97;
    bool _109 = _81 == 96;
    float _111 = fma(_107, _68, _95);
    float _113 = fma(_66, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _115 = 0.0;
    float _117 = _103;
    if (_85)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _123 = _111 + _121;
    float _125 = _119;
    if (_87)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _127 = _117;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _131 = _113 + _129;
    float _133 = fma(_68, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _135 = _123 * _123;
    bool _137 = _81 == 112;
    float _139 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _141 = _133 + _139;
    float _143 = fma(_131, _131, _135);
    float _145 = _127;
    if (_87)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _125;
    float _149 = _147;
    if (_89)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = fma(_141, _141, _143);
    bool _155 = _81 == 128;
    float _157 = _151;
    if (_89)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = rsqrt(_153);
    float _163 = _159;
    if (_91)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _165 = _157;
    bool _167 = _81 == 144;
    float _169 = _165;
    if (_91)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_93)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _175 = _169;
    bool _177 = _81 == 160;
    float _179 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _181 = _173;
    float _183 = _181;
    if (_99)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _179;
    bool _187 = _81 == 176;
    float _189 = _161 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _191 = _185;
    if (_99)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _193 = _183;
    bool _195 = _81 == 192;
    float _197 = _193;
    if (_109)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _199 = _191;
    float _201 = log2(_189);
    float _203 = _199;
    if (_109)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_137)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _209 = _203;
    bool _211 = _81 == 208;
    float _213 = _209;
    if (_137)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_155)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _219 = _213;
    bool _221 = _81 == 224;
    float _223 = _219;
    if (_155)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _225 = _217;
    float _227 = _225;
    if (_167)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _229 = _223;
    float _231 = _201 + 1.2999999523162841796875;
    bool _233 = _81 == 240;
    float _235 = _229;
    if (_167)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _237 = _227;
    float _239 = _237;
    if (_177)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _241 = _235;
    float _243 = trunc(_231);
    int _245 = int(_243);
    bool _247 = _81 == 256;
    float _249 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _251 = _239;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _255 = _249;
    bool _257 = _81 == 272;
    float _259 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_195)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _265 = _259;
    bool _267 = _81 == 288;
    float _269 = _265;
    if (_195)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _263;
    int _273 = min(_245, 15);
    bool _275 = _81 == 304;
    float _277 = _271;
    if (_211)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _279 = _269;
    float _281 = float(_273);
    float _283 = _279;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _277;
    int _287 = _273 << 4;
    int _289 = _287 + 4288;
    float _291 = _285;
    if (_221)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _293 = _283;
    bool _295 = _81 == 320;
    float _297 = -_281;
    float _299 = _297 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _301 = _293;
    if (_221)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _303 = _291;
    float _305 = _303;
    if (_233)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _307 = _301;
    float _309 = _299 + 1.0;
    bool _311 = _81 == 336;
    float _313 = _307;
    if (_233)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _315 = _305;
    float _317 = _315;
    if (_247)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _319 = _313;
    float _321 = exp2(_309);
    bool _323 = _81 == 352;
    float _325 = _319;
    if (_247)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _327 = _317;
    float _329 = _327;
    if (_257)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _331 = _325;
    bool _333 = _81 == 368;
    float _335 = _331;
    if (_257)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _337 = _329;
    float _339 = _337;
    if (_267)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _341 = _335;
    bool _343 = _81 == 384;
    float _345 = _341;
    if (_267)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _347 = _339;
    float _349 = 1.0 / _321;
    float _351 = _347;
    if (_275)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _353 = _345;
    bool _355 = _81 == 400;
    float _357 = _353;
    if (_275)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _359 = _351;
    bool _361 = _81 == 416;
    float _363 = _359;
    if (_295)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _365 = _357;
    float _367 = _365;
    if (_295)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _369 = _363;
    float _371 = _369;
    if (_311)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _373 = _367;
    bool _375 = _81 == 432;
    float _377 = _373;
    if (_311)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _379 = _371;
    float _381 = _379;
    if (_323)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _383 = _377;
    bool _385 = _81 == 448;
    float _387 = _383;
    if (_323)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_333)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _393 = _387;
    bool _395 = _81 == 464;
    float _397 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_343)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _403 = _397;
    bool _405 = _81 == 480;
    float _407 = _403;
    if (_343)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_355)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _413 = _407;
    bool _415 = _81 == 496;
    float _417 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _423 = _417;
    bool _425 = _81 == 512;
    float _427 = _423;
    if (_361)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _429 = _421;
    bool _431 = _81 == 528;
    float _433 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _435 = _427;
    float _437 = _435;
    if (_375)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _439 = _433;
    float _441 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _443 = _437;
    bool _445 = _81 == 544;
    float _447 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _449 = _441;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _453 = _447;
    bool _455 = _81 == 560;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _463 = _457;
    bool _465 = _81 == 576;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _473 = _467;
    bool _475 = _81 == 592;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _483 = _477;
    bool _485 = _81 == 608;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _493 = _487;
    bool _495 = _81 == 624;
    float _497 = _493;
    if (_431)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _499 = _491;
    bool _501 = _81 == 640;
    float _503 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _505 = _497;
    float _507 = _505;
    if (_445)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _509 = _503;
    float _511 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _513 = _507;
    bool _515 = _81 == 656;
    float _517 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _519 = _511;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _523 = _517;
    bool _525 = _81 == 672;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _533 = _527;
    bool _535 = _81 == 688;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _543 = _537;
    bool _545 = _81 == 704;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _553 = _547;
    bool _555 = _81 == 720;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _563 = _557;
    bool _565 = _81 == 736;
    float _567 = _563;
    if (_501)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _569 = _561;
    bool _571 = _81 == 752;
    float _573 = _569;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _575 = _567;
    float _577 = _575;
    if (_525)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_535)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_545)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_555)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _591 = _589;
    float _593 = _591;
    if (_565)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_571)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _599 = _597;
    float _601 = _349 * _599;
    if (_515)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _603 = _573;
    float _605 = _603;
    if (_525)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _607 = _605;
    float _609 = _601 * _66;
    float _611 = _601 * _68;
    float _613 = _607;
    if (_535)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _615 = _613;
    float _617 = floor(_609);
    float _619 = _615;
    if (_545)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_555)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _625 = _623;
    float _627 = _625;
    if (_565)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_571)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _633 = _631;
    float _635 = floor(_611);
    float _637 = _321 * _633;
    float _639 = -_617;
    float _641 = _609 + _639;
    float _643 = _641 * 2.0;
    float _645 = -_641;
    float _647 = fma(_637, _645, _66);
    int _649 = _289 + 8;
    uint _652 = uint(int(uint(_649) >> uint(2)));
    uint _654 = uint(int(uint(int(_652)) >> uint(2)));
    int _656 = int(_652) & 3;
    float _658 = (*spvDescriptorSet0.vp_c14)._m0[int(_654)][_656];
    int _660 = int(_652) + 1;
    uint _662 = uint(int(uint(_660) >> uint(2)));
    int _664 = _660 & 3;
    float _666 = (*spvDescriptorSet0.vp_c14)._m0[int(_662)][_664];
    float _668 = -_635;
    float _670 = _611 + _668;
    float _672 = floor(_643);
    float _674 = _670 * 2.0;
    float _676 = -_670;
    float _678 = fma(_637, _676, _68);
    float _680 = floor(_674);
    float _682 = _637 * _672;
    float _684 = _682 * 0.5;
    float _686 = _684 + _647;
    float _688 = fma(_72, _686, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _690 = _637 * _680;
    float _692 = _690 * 0.5;
    float _694 = fma(_79, _686, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _698 = _692 + _678;
    float _700 = -_688;
    float _702 = _700 + _694;
    float _704 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _706 = _696 + _704;
    float _708 = fma(_698, _702, _688);
    float _710 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _712 = _708 + _710;
    float _714 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _716 = _712 * _712;
    float _718 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _720 = _714 + _718;
    float _722 = fma(_706, _706, _716);
    float _724 = fma(_720, _720, _722);
    float _726 = sqrt(_724);
    float _728 = -_666;
    float _730 = fma(_726, _658, _728);
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = -_684;
    float _736 = fma(_734, _732, _686);
    float _738 = -_692;
    float _740 = fma(_738, _732, _698);
    float _742 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _744 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _746 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _742);
    float _748 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _744);
    float2 _2269 = float2(_746, _748);
    float _750 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2269, float2(0.0), isnan(_2269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2269, float2(0.0), isnan(_2269)), level(0.0)).x;
    float _752 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _758 = _752 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _762 = _754 + _760;
    float _764 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _766 = _758 * _758;
    float _768 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _772 = fma(_762, _762, _766);
    float _774 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    out.m_38.z = _764;
    out.m_38.w = _768;
    float _776 = sqrt(_772);
    out.m_40.y = _774;
    out.m_40.x = _770;
    out.m_40.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    bool _778 = _776 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _782 = _776 + _780;
    float _784 = _726;
    float _786 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _788 = _748;
    float _790 = _782;
    float _792 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _794 = _658;
    float _796 = _764;
    float _798 = _754;
    if (_778)
    {
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _784 = _800;
    }
    float _802 = _784;
    if (_778)
    {
        float _804 = rsqrt(_772);
        _786 = _804;
    }
    float _806 = _786;
    if (_778)
    {
        float _808 = _782 * _802;
        _788 = _808;
    }
    float _810 = _788;
    if (_778)
    {
        float _812 = _810 * 0.15915493667125701904296875;
        _790 = _812;
    }
    float _814 = _790;
    float _816 = _802;
    float _818 = _814;
    if (_778)
    {
        float _820 = _814 * 6.283185482025146484375;
        float _822 = cos(_820);
        _816 = _822;
    }
    float _824 = _816;
    float _826 = _810;
    if (_778)
    {
        float _828 = _814 * 6.283185482025146484375;
        float _830 = sin(_828);
        _826 = _830;
    }
    float _832 = _826;
    if (_778)
    {
        float _834 = _824 + (-1.0);
        _818 = _834;
    }
    float _836 = _818;
    float _838 = fma(_750, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _840 = _750;
    if (_778)
    {
        float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _792 = _842;
    }
    float _844 = _792;
    if (_778)
    {
        float _846 = _838 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _840 = _846;
    }
    float _848 = _840;
    float _850 = _838 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    out.m_42.x = _754;
    out.m_42.y = _838;
    out.m_42.z = _752;
    float _852 = _838 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _854 = _832;
    if (_778)
    {
        float _856 = fma(_832, _848, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _794 = _856;
    }
    float _858 = _794;
    if (!_778)
    {
        _854 = _838;
    }
    float _860 = _854;
    float _862 = _860;
    if (_778)
    {
        float _864 = fma(_838, _824, _844);
        _862 = _864;
    }
    float _866 = _862;
    float _868 = _838 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _870 = _868;
    float _872 = _866;
    if (_778)
    {
        float _874 = _806 * _858;
        _796 = _874;
    }
    float _876 = _796;
    float _878 = _838 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _880 = _838 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _882 = _838 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _884 = _838 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _886 = _838 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _888 = _838 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _890 = _838 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _892 = _838 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _894 = _838 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _896 = _838 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _898 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[44].x, _850);
    float _900 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[42].x, _868);
    float _902 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[45].x, _852);
    float _904 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[43].x, _878);
    float _906 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[46].x, _880);
    float _908 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[47].x, _882);
    float _910 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[48].x, _884);
    float _912 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[49].x, _886);
    float _914 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[50].x, _888);
    float _916 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[51].x, _890);
    float _918 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[52].x, _892);
    float _920 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[53].x, _894);
    float _922 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[2].x, _896);
    float _924 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[44].z, _898);
    float _926 = _900;
    if (_778)
    {
        float _928 = fma(_762, _876, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _798 = _928;
    }
    float _930 = _798;
    float _932 = _866 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _934 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[42].z, _900);
    if (!_778)
    {
        _870 = _752;
    }
    float _936 = _870;
    float _938 = _936;
    if (_778)
    {
        float _940 = _866 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _926 = _940;
    }
    float _942 = _926;
    float _944 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[43].z, _904);
    if (_778)
    {
        float _946 = fma(_758, _876, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _938 = _946;
    }
    float _948 = _938;
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[1].x, _932);
    float _952 = _866 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _954 = _950;
    if (_778)
    {
        float _956 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[2].x, _942);
        _872 = _956;
    }
    float _958 = _872;
    float _960 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[2].z, _922);
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[1].z, _950);
    float _964 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[0].x, _952);
    float _966 = _958;
    if (_778)
    {
        float _968 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[2].z, _958);
        _966 = _968;
    }
    float _970 = _966;
    float _972 = _960 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _974 = _962 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _976 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[0].z, _964);
    float _978 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[45].z, _902);
    float _980 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[46].z, _906);
    float _982 = _974 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _984 = _974 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _988 = _976 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _990 = _974 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    if (!_778)
    {
        _954 = _972;
    }
    float _992 = _954;
    float _994 = _992;
    if (_778)
    {
        float _996 = _970 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[7].x, _982);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[8].x, _984);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[9].x, _986);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[10].x, _990);
    float _1008 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[47].z, _908);
    float _1010 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[48].z, _910);
    float _1012 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[49].z, _912);
    float _1014 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[50].z, _914);
    float _1016 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[51].z, _916);
    float _1018 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[52].z, _918);
    float _1020 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[53].z, _920);
    float _1022 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1000);
    float _1024 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1002);
    float _1026 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1004);
    float _1028 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1006);
    float _1030 = _934 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _1032 = _944 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _1034 = _924 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _1036 = _978 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _1038 = -_972;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1042 = _1038 + _1040;
    float _1044 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1046 = _1016 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1048 = _1018 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_44.x = _1030;
    out.m_44.y = _1032;
    out.m_44.z = _1034;
    out.m_44.w = _1036;
    float _1052 = _1022 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1054 = _1020 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1056 = _1024 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1058 = _1026 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1060 = _1028 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.w = _972;
    out.m_48.x = _1044;
    out.m_48.y = _1046;
    out.m_48.z = _1048;
    out.m_48.w = _1054;
    float _1062 = _980 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1064 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1066 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1068 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_50.w = _1050;
    out.m_52.x = _1062;
    out.m_52.y = _1064;
    out.m_52.z = _1066;
    out.m_52.w = _1068;
    out.gl_Position.x = _1052;
    out.gl_Position.y = _1056;
    out.gl_Position.z = _1058;
    out.gl_Position.w = _1060;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_35.x;
    float _68 = in.m_35.y;
    float _70 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _72 = _70 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _75 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _77 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _79 = _77 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _81 = _75 << 4;
    bool _85 = _81 == 0;
    bool _87 = _81 == 16;
    bool _89 = _81 == 32;
    bool _91 = _81 == 48;
    bool _93 = _81 == 64;
    float _95 = fma(_72, _66, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _97 = fma(_79, _66, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _99 = _81 == 80;
    float _101 = as_type<float>(gl_BaseInstance);
    if (_85)
    {
        _101 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _103 = _101;
    float _105 = -_95;
    float _107 = _105 + _97;
    bool _109 = _81 == 96;
    float _111 = fma(_107, _68, _95);
    float _113 = fma(_66, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _115 = 0.0;
    float _117 = _103;
    if (_85)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _123 = _111 + _121;
    float _125 = _119;
    if (_87)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _127 = _117;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _131 = _113 + _129;
    float _133 = fma(_68, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _135 = _123 * _123;
    bool _137 = _81 == 112;
    float _139 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _141 = _133 + _139;
    float _143 = fma(_131, _131, _135);
    float _145 = _127;
    if (_87)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _125;
    float _149 = _147;
    if (_89)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = fma(_141, _141, _143);
    bool _155 = _81 == 128;
    float _157 = _151;
    if (_89)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = rsqrt(_153);
    float _163 = _159;
    if (_91)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _165 = _157;
    bool _167 = _81 == 144;
    float _169 = _165;
    if (_91)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_93)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _175 = _169;
    bool _177 = _81 == 160;
    float _179 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _181 = _173;
    float _183 = _181;
    if (_99)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _179;
    bool _187 = _81 == 176;
    float _189 = _161 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _191 = _185;
    if (_99)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _193 = _183;
    bool _195 = _81 == 192;
    float _197 = _193;
    if (_109)
    {
        _191 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _199 = _191;
    float _201 = log2(_189);
    float _203 = _199;
    if (_109)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_137)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _209 = _203;
    bool _211 = _81 == 208;
    float _213 = _209;
    if (_137)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_155)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _219 = _213;
    bool _221 = _81 == 224;
    float _223 = _219;
    if (_155)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _225 = _217;
    float _227 = _225;
    if (_167)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _229 = _223;
    float _231 = _201 + 1.2999999523162841796875;
    bool _233 = _81 == 240;
    float _235 = _229;
    if (_167)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _237 = _227;
    float _239 = _237;
    if (_177)
    {
        _235 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _241 = _235;
    float _243 = trunc(_231);
    int _245 = int(_243);
    bool _247 = _81 == 256;
    float _249 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _251 = _239;
    float _253 = _251;
    if (_187)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _255 = _249;
    bool _257 = _81 == 272;
    float _259 = _255;
    if (_187)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _261 = _253;
    float _263 = _261;
    if (_195)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _265 = _259;
    bool _267 = _81 == 288;
    float _269 = _265;
    if (_195)
    {
        _263 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _263;
    int _273 = min(_245, 15);
    bool _275 = _81 == 304;
    float _277 = _271;
    if (_211)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _279 = _269;
    float _281 = float(_273);
    float _283 = _279;
    if (_211)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _277;
    int _287 = _273 << 4;
    int _289 = _287 + 4288;
    float _291 = _285;
    if (_221)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _293 = _283;
    bool _295 = _81 == 320;
    float _297 = -_281;
    float _299 = _297 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _301 = _293;
    if (_221)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _303 = _291;
    float _305 = _303;
    if (_233)
    {
        _301 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _307 = _301;
    float _309 = _299 + 1.0;
    bool _311 = _81 == 336;
    float _313 = _307;
    if (_233)
    {
        _305 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _315 = _305;
    float _317 = _315;
    if (_247)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _319 = _313;
    float _321 = exp2(_309);
    bool _323 = _81 == 352;
    float _325 = _319;
    if (_247)
    {
        _317 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _327 = _317;
    float _329 = _327;
    if (_257)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _331 = _325;
    bool _333 = _81 == 368;
    float _335 = _331;
    if (_257)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _337 = _329;
    float _339 = _337;
    if (_267)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _341 = _335;
    bool _343 = _81 == 384;
    float _345 = _341;
    if (_267)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _347 = _339;
    float _349 = 1.0 / _321;
    float _351 = _347;
    if (_275)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _353 = _345;
    bool _355 = _81 == 400;
    float _357 = _353;
    if (_275)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _359 = _351;
    bool _361 = _81 == 416;
    float _363 = _359;
    if (_295)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _365 = _357;
    float _367 = _365;
    if (_295)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _369 = _363;
    float _371 = _369;
    if (_311)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _373 = _367;
    bool _375 = _81 == 432;
    float _377 = _373;
    if (_311)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _379 = _371;
    float _381 = _379;
    if (_323)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _383 = _377;
    bool _385 = _81 == 448;
    float _387 = _383;
    if (_323)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_333)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _393 = _387;
    bool _395 = _81 == 464;
    float _397 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_343)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _403 = _397;
    bool _405 = _81 == 480;
    float _407 = _403;
    if (_343)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_355)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _413 = _407;
    bool _415 = _81 == 496;
    float _417 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _423 = _417;
    bool _425 = _81 == 512;
    float _427 = _423;
    if (_361)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _429 = _421;
    bool _431 = _81 == 528;
    float _433 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _435 = _427;
    float _437 = _435;
    if (_375)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _439 = _433;
    float _441 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _443 = _437;
    bool _445 = _81 == 544;
    float _447 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _449 = _441;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _453 = _447;
    bool _455 = _81 == 560;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _463 = _457;
    bool _465 = _81 == 576;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _473 = _467;
    bool _475 = _81 == 592;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _483 = _477;
    bool _485 = _81 == 608;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _493 = _487;
    bool _495 = _81 == 624;
    float _497 = _493;
    if (_431)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _499 = _491;
    bool _501 = _81 == 640;
    float _503 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _505 = _497;
    float _507 = _505;
    if (_445)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _509 = _503;
    float _511 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _513 = _507;
    bool _515 = _81 == 656;
    float _517 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _519 = _511;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _523 = _517;
    bool _525 = _81 == 672;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _533 = _527;
    bool _535 = _81 == 688;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _543 = _537;
    bool _545 = _81 == 704;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _553 = _547;
    bool _555 = _81 == 720;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _563 = _557;
    bool _565 = _81 == 736;
    float _567 = _563;
    if (_501)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _569 = _561;
    bool _571 = _81 == 752;
    float _573 = _569;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _575 = _567;
    float _577 = _575;
    if (_525)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _579 = _577;
    float _581 = _579;
    if (_535)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _583 = _581;
    float _585 = _583;
    if (_545)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_555)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _591 = _589;
    float _593 = _591;
    if (_565)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_571)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _599 = _597;
    float _601 = _349 * _599;
    if (_515)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _603 = _573;
    float _605 = _603;
    if (_525)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _607 = _605;
    float _609 = _601 * _66;
    float _611 = _601 * _68;
    float _613 = _607;
    if (_535)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _615 = _613;
    float _617 = floor(_609);
    float _619 = _615;
    if (_545)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_555)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _625 = _623;
    float _627 = _625;
    if (_565)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_571)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _633 = _631;
    float _635 = floor(_611);
    float _637 = _321 * _633;
    float _639 = -_617;
    float _641 = _609 + _639;
    float _643 = _641 * 2.0;
    float _645 = -_641;
    float _647 = fma(_637, _645, _66);
    int _649 = _289 + 8;
    uint _652 = uint(int(uint(_649) >> uint(2)));
    uint _654 = uint(int(uint(int(_652)) >> uint(2)));
    int _656 = int(_652) & 3;
    float _658 = (*spvDescriptorSet0.vp_c14)._m0[int(_654)][_656];
    int _660 = int(_652) + 1;
    uint _662 = uint(int(uint(_660) >> uint(2)));
    int _664 = _660 & 3;
    float _666 = (*spvDescriptorSet0.vp_c14)._m0[int(_662)][_664];
    float _668 = -_635;
    float _670 = _611 + _668;
    float _672 = floor(_643);
    float _674 = _670 * 2.0;
    float _676 = -_670;
    float _678 = fma(_637, _676, _68);
    float _680 = floor(_674);
    float _682 = _637 * _672;
    float _684 = _682 * 0.5;
    float _686 = _684 + _647;
    float _688 = fma(_72, _686, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _690 = _637 * _680;
    float _692 = _690 * 0.5;
    float _694 = fma(_79, _686, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _698 = _692 + _678;
    float _700 = -_688;
    float _702 = _700 + _694;
    float _704 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _706 = _696 + _704;
    float _708 = fma(_698, _702, _688);
    float _710 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _712 = _708 + _710;
    float _714 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _716 = _712 * _712;
    float _718 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _720 = _714 + _718;
    float _722 = fma(_706, _706, _716);
    float _724 = fma(_720, _720, _722);
    float _726 = sqrt(_724);
    float _728 = -_666;
    float _730 = fma(_726, _658, _728);
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = -_684;
    float _736 = fma(_734, _732, _686);
    float _738 = -_692;
    float _740 = fma(_738, _732, _698);
    float _742 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _744 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _746 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _742);
    float _748 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _744);
    float2 _2269 = float2(_746, _748);
    float _750 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2269, float2(0.0), isnan(_2269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2269, float2(0.0), isnan(_2269)), level(0.0)).x;
    float _752 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _758 = _752 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _762 = _754 + _760;
    float _764 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _766 = _758 * _758;
    float _768 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _772 = fma(_762, _762, _766);
    float _774 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    out.m_38.z = _764;
    out.m_38.w = _768;
    float _776 = sqrt(_772);
    out.m_40.y = _774;
    out.m_40.x = _770;
    out.m_40.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    bool _778 = _776 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _782 = _776 + _780;
    float _784 = _726;
    float _786 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _788 = _748;
    float _790 = _782;
    float _792 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _794 = _658;
    float _796 = _764;
    float _798 = _754;
    if (_778)
    {
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _784 = _800;
    }
    float _802 = _784;
    if (_778)
    {
        float _804 = rsqrt(_772);
        _786 = _804;
    }
    float _806 = _786;
    if (_778)
    {
        float _808 = _782 * _802;
        _788 = _808;
    }
    float _810 = _788;
    if (_778)
    {
        float _812 = _810 * 0.15915493667125701904296875;
        _790 = _812;
    }
    float _814 = _790;
    float _816 = _802;
    float _818 = _814;
    if (_778)
    {
        float _820 = _814 * 6.283185482025146484375;
        float _822 = cos(_820);
        _816 = _822;
    }
    float _824 = _816;
    float _826 = _810;
    if (_778)
    {
        float _828 = _814 * 6.283185482025146484375;
        float _830 = sin(_828);
        _826 = _830;
    }
    float _832 = _826;
    if (_778)
    {
        float _834 = _824 + (-1.0);
        _818 = _834;
    }
    float _836 = _818;
    float _838 = fma(_750, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _840 = _750;
    if (_778)
    {
        float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _792 = _842;
    }
    float _844 = _792;
    if (_778)
    {
        float _846 = _838 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _840 = _846;
    }
    float _848 = _840;
    float _850 = _838 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    out.m_42.x = _754;
    out.m_42.y = _838;
    out.m_42.z = _752;
    float _852 = _838 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _854 = _832;
    if (_778)
    {
        float _856 = fma(_832, _848, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _794 = _856;
    }
    float _858 = _794;
    if (!_778)
    {
        _854 = _838;
    }
    float _860 = _854;
    float _862 = _860;
    if (_778)
    {
        float _864 = fma(_838, _824, _844);
        _862 = _864;
    }
    float _866 = _862;
    float _868 = _838 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _870 = _868;
    float _872 = _866;
    if (_778)
    {
        float _874 = _806 * _858;
        _796 = _874;
    }
    float _876 = _796;
    float _878 = _838 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _880 = _838 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _882 = _838 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _884 = _838 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _886 = _838 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _888 = _838 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _890 = _838 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _892 = _838 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _894 = _838 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _896 = _838 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _898 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[44].x, _850);
    float _900 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[42].x, _868);
    float _902 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[45].x, _852);
    float _904 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[43].x, _878);
    float _906 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[46].x, _880);
    float _908 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[47].x, _882);
    float _910 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[48].x, _884);
    float _912 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[49].x, _886);
    float _914 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[50].x, _888);
    float _916 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[51].x, _890);
    float _918 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[52].x, _892);
    float _920 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[53].x, _894);
    float _922 = fma(_754, (*spvDescriptorSet0.vp_c4)._m0[2].x, _896);
    float _924 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[44].z, _898);
    float _926 = _900;
    if (_778)
    {
        float _928 = fma(_762, _876, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _798 = _928;
    }
    float _930 = _798;
    float _932 = _866 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _934 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[42].z, _900);
    if (!_778)
    {
        _870 = _752;
    }
    float _936 = _870;
    float _938 = _936;
    if (_778)
    {
        float _940 = _866 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _926 = _940;
    }
    float _942 = _926;
    float _944 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[43].z, _904);
    if (_778)
    {
        float _946 = fma(_758, _876, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _938 = _946;
    }
    float _948 = _938;
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[1].x, _932);
    float _952 = _866 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _954 = _950;
    if (_778)
    {
        float _956 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[2].x, _942);
        _872 = _956;
    }
    float _958 = _872;
    float _960 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[2].z, _922);
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[1].z, _950);
    float _964 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[0].x, _952);
    float _966 = _958;
    if (_778)
    {
        float _968 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[2].z, _958);
        _966 = _968;
    }
    float _970 = _966;
    float _972 = _960 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _974 = _962 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _976 = fma(_948, (*spvDescriptorSet0.vp_c4)._m0[0].z, _964);
    float _978 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[45].z, _902);
    float _980 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[46].z, _906);
    float _982 = _974 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _984 = _974 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _988 = _976 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _990 = _974 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    if (!_778)
    {
        _954 = _972;
    }
    float _992 = _954;
    float _994 = _992;
    if (_778)
    {
        float _996 = _970 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[7].x, _982);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[8].x, _984);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[9].x, _986);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c4)._m0[10].x, _990);
    float _1008 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[47].z, _908);
    float _1010 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[48].z, _910);
    float _1012 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[49].z, _912);
    float _1014 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[50].z, _914);
    float _1016 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[51].z, _916);
    float _1018 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[52].z, _918);
    float _1020 = fma(_752, (*spvDescriptorSet0.vp_c4)._m0[53].z, _920);
    float _1022 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1000);
    float _1024 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1002);
    float _1026 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1004);
    float _1028 = fma(_998, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1006);
    float _1030 = _934 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _1032 = _944 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _1034 = _924 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _1036 = _978 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _1038 = -_972;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1042 = _1038 + _1040;
    float _1044 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1046 = _1016 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1048 = _1018 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_44.x = _1030;
    out.m_44.y = _1032;
    out.m_44.z = _1034;
    out.m_44.w = _1036;
    float _1052 = _1022 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1054 = _1020 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _1056 = _1024 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1058 = _1026 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1060 = _1028 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.w = _972;
    out.m_48.x = _1044;
    out.m_48.y = _1046;
    out.m_48.z = _1048;
    out.m_48.w = _1054;
    float _1062 = _980 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1064 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1066 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1068 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_50.w = _1050;
    out.m_52.x = _1062;
    out.m_52.y = _1064;
    out.m_52.z = _1066;
    out.m_52.w = _1068;
    out.gl_Position.x = _1052;
    out.gl_Position.y = _1056;
    out.gl_Position.z = _1058;
    out.gl_Position.w = _1060;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

