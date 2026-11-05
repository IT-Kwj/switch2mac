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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_37.x;
    float _53 = in.m_37.y;
    float _55 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _62 = _60 << 4;
    bool _66 = _62 == 0;
    bool _68 = _62 == 16;
    bool _70 = _62 == 32;
    bool _72 = _62 == 48;
    bool _74 = _62 == 64;
    float _76 = fma(_57, _51, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _78 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _80 = _62 == 80;
    bool _82 = _53 >= 0.5;
    bool _84 = isnan(_53);
    bool _86 = _82 || _84;
    bool _88 = isnan(0.5);
    bool _90 = _86 || _88;
    float _92 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _94 = _76 + _92;
    float _96 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _98 = _78 + _96;
    float _100 = as_type<float>(gl_BaseInstance);
    float _102 = _53;
    if (_66)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _104 = _100;
    float _106 = _94 * _94;
    bool _108 = _62 == 96;
    float _110 = 0.0;
    float _112 = _104;
    if (_66)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = fma(_98, _98, _106);
    float _118 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _120 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _118;
    float _122 = _114;
    float _124 = _120;
    if (_68)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _112;
    bool _128 = _62 == 112;
    float _130 = fma(_120, _120, _116);
    float _132 = _126;
    if (_68)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _122;
    float _136 = _134;
    if (_70)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    bool _140 = _62 == 128;
    float _142 = rsqrt(_130);
    float _144 = _138;
    if (_70)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_72)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _144;
    bool _152 = _62 == 144;
    float _154 = _150;
    if (_72)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_74)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _62 == 160;
    float _164 = _160;
    if (_74)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_80)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    float _172 = _142 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _174 = _62 == 176;
    float _176 = _170;
    if (_80)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _62 == 192;
    float _182 = log2(_172);
    float _184 = _178;
    if (_108)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _176;
    float _188 = _186;
    if (_108)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _190 = _184;
    float _192 = _190;
    if (_128)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _194 = _188;
    bool _196 = _62 == 208;
    float _198 = _194;
    if (_128)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_140)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _62 == 224;
    float _208 = _204;
    if (_140)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _210 = _202;
    float _212 = _182 + 1.2999999523162841796875;
    float _214 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _208;
    bool _218 = _62 == 240;
    float _220 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _222 = _214;
    float _224 = trunc(_212);
    int _226 = int(_224);
    float _228 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _230 = _220;
    bool _232 = _62 == 256;
    float _234 = _230;
    if (_162)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _236 = _228;
    float _238 = _236;
    if (_174)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _240 = _234;
    bool _242 = _62 == 272;
    float _244 = _240;
    if (_174)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_180)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    bool _252 = _62 == 288;
    int _254 = min(_226, 15);
    float _256 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _248;
    bool _260 = _62 == 304;
    float _262 = float(_254);
    float _264 = _258;
    if (_196)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _266 = _256;
    int _268 = _254 << 4;
    int _270 = _268 + 4288;
    float _272 = _266;
    float _274 = as_type<float>(_270);
    if (_196)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _276 = _264;
    float _278 = _276;
    if (_206)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _280 = _272;
    float _282 = -_262;
    float _284 = _282 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _286 = _62 == 320;
    int _288 = _270 + 8;
    uint _291 = uint(int(uint(_288) >> uint(2)));
    uint _293 = uint(int(uint(int(_291)) >> uint(2)));
    int _295 = int(_291) & 3;
    float _297 = (*spvDescriptorSet0.vp_c14)._m0[int(_293)][_295];
    int _299 = int(_291) + 1;
    uint _301 = uint(int(uint(_299) >> uint(2)));
    int _303 = _299 & 3;
    float _305 = (*spvDescriptorSet0.vp_c14)._m0[int(_301)][_303];
    float _307 = _280;
    if (_206)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _309 = _278;
    float _311 = _284 + 1.0;
    float _313 = _309;
    if (_218)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _315 = _307;
    bool _317 = _62 == 336;
    float _319 = _315;
    if (_218)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _321 = _313;
    float _323 = exp2(_311);
    float _325 = _321;
    if (_232)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _327 = _319;
    bool _329 = _62 == 352;
    float _331 = _327;
    if (_232)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _333 = _325;
    float _335 = _333;
    if (_242)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _337 = _331;
    bool _339 = _62 == 368;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_252)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _347 = _341;
    bool _349 = _62 == 384;
    float _351 = 1.0 / _323;
    float _353 = _347;
    float _355 = _323;
    if (_252)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _357 = _345;
    float _359 = _357;
    if (_260)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _361 = _353;
    bool _363 = _62 == 400;
    float _365 = _361;
    if (_260)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _367 = _359;
    bool _369 = _62 == 416;
    float _371 = _367;
    if (_286)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _373 = _365;
    float _375 = _373;
    if (_286)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _377 = _371;
    float _379 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _381 = _375;
    bool _383 = _62 == 432;
    float _385 = _381;
    if (_317)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _387 = _379;
    float _389 = _387;
    if (_329)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _391 = _385;
    bool _393 = _62 == 448;
    float _395 = _391;
    if (_329)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_339)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _401 = _395;
    bool _403 = _62 == 464;
    float _405 = _401;
    if (_339)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _411 = _405;
    bool _413 = _62 == 480;
    float _415 = _411;
    if (_349)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _417 = _409;
    float _419 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _421 = _415;
    bool _423 = _62 == 496;
    float _425 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _427 = _419;
    float _429 = _427;
    if (_369)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _431 = _425;
    bool _433 = _62 == 512;
    float _435 = _431;
    if (_369)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _437 = _429;
    bool _439 = _62 == 528;
    float _441 = _437;
    if (_383)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _443 = _435;
    float _445 = _443;
    if (_383)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _447 = _441;
    float _449 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _451 = _445;
    bool _453 = _62 == 544;
    float _455 = _451;
    if (_393)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _457 = _449;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _461 = _455;
    bool _463 = _62 == 560;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _471 = _465;
    bool _473 = _62 == 576;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_423)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _481 = _475;
    bool _483 = _62 == 592;
    float _485 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _487 = _479;
    float _489 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _491 = _485;
    bool _493 = _62 == 608;
    float _495 = _491;
    if (_433)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _497 = _489;
    float _499 = _497;
    if (_439)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _501 = _495;
    bool _503 = _62 == 624;
    float _505 = _501;
    if (_439)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _507 = _499;
    bool _509 = _62 == 640;
    float _511 = _507;
    if (_453)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _513 = _505;
    float _515 = _513;
    if (_453)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _517 = _511;
    float _519 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _521 = _515;
    bool _523 = _62 == 656;
    float _525 = _521;
    if (_463)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _527 = _519;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _531 = _525;
    bool _533 = _62 == 672;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _541 = _535;
    bool _543 = _62 == 688;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_493)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _551 = _545;
    bool _553 = _62 == 704;
    float _555 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _557 = _549;
    float _559 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _561 = _555;
    bool _563 = _62 == 720;
    float _565 = _561;
    if (_503)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _567 = _559;
    float _569 = _567;
    if (_509)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _571 = _565;
    bool _573 = _62 == 736;
    float _575 = _571;
    if (_509)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _577 = _569;
    bool _579 = _62 == 752;
    float _581 = _577;
    if (_523)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _583 = _575;
    float _585 = _583;
    if (_533)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_543)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _591 = _589;
    float _593 = _591;
    if (_553)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_563)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_573)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_579)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _607 = _605;
    float _609 = _351 * _607;
    if (_523)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _611 = _581;
    float _613 = _611;
    if (_533)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _615 = _613;
    float _617 = _609 * _51;
    float _619 = _615;
    if (_543)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_553)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _625 = _623;
    float _627 = floor(_617);
    float _629 = _625;
    if (_563)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _631 = _629;
    float _633 = _631;
    if (_573)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _635 = _633;
    float _637 = _635;
    if (_579)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _639 = _637;
    float _641 = -_627;
    float _643 = _617 + _641;
    float _645 = _323 * _639;
    float _647 = _643 * 2.0;
    float _649 = -_643;
    float _651 = fma(_645, _649, _51);
    float _653 = floor(_647);
    float _655 = _645 * _653;
    float _657 = _655 * 0.5;
    float _659 = _645;
    float _661 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_90)
    {
        _659 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _663 = _659;
    float _665 = _657 + _651;
    if (!_90)
    {
        float _667 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _663, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _102 = _667;
    }
    float _669 = _102;
    float _671 = fma(_57, _665, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _673 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _671 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _681 = _673 + _679;
    float _683 = _677 * _677;
    float _685 = fma(_681, _681, _683);
    float _687 = fma(_120, _120, _685);
    float _689 = _669;
    float _691 = _687;
    if (!_90)
    {
        _124 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _124;
    float _695 = sqrt(_687);
    float _697 = _693;
    if (!_90)
    {
        float _699 = fma(_669, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _689 = _699;
    }
    float _701 = _689;
    float _703 = -_305;
    float _705 = fma(_695, _297, _703);
    float _707 = precise::clamp(_705, 0.0, 1.0);
    float _709 = -_657;
    float _711 = fma(_709, _707, _665);
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _715 = _711;
    float _717 = _701;
    if (!_90)
    {
        float _719 = fma(_713, _663, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _715 = _719;
    }
    float _721 = _715;
    float _723 = _721;
    if (!_90)
    {
        float _725 = fma(_721, _693, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _723 = _725;
    }
    float _727 = _723;
    float _729 = _727;
    if (!_90)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _701);
        _697 = _731;
    }
    float _733 = _697;
    float _735 = _733;
    if (!_90)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _717 = _737;
    }
    float _739 = _717;
    if (!_90)
    {
        float2 _2172 = float2(_739, _733);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2172, float2(0.0), isnan(_2172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2172, float2(0.0), isnan(_2172)), level(0.0)).x;
        _729 = _741;
    }
    float _743 = _729;
    if (_90)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _691;
    float _747 = _745;
    if (_90)
    {
        _355 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _749 = _355;
    float _751 = _749;
    if (_90)
    {
        float _753 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _274 = _753;
    }
    float _755 = _274;
    float _757 = _755;
    if (_90)
    {
        float _759 = fma(_713, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _747 = _759;
    }
    float _761 = _747;
    float _763 = _761;
    if (_90)
    {
        float _765 = fma(_755, _749, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    if (_90)
    {
        float _769 = fma(_761, _749, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _763 = _769;
    }
    float _771 = _763;
    float _773 = _771;
    if (_90)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _751 = _775;
    }
    float _777 = _751;
    if (_90)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _743;
    if (_90)
    {
        float2 _2265 = float2(_781, _777);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2265, float2(0.0), isnan(_2265)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2265, float2(0.0), isnan(_2265)), level(0.0)).x;
        _783 = _785;
    }
    float _787 = _783;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = _713 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    bool _803 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _807 = _801 + _805;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _811 = _807;
    float _813 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_803)
    {
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _809 = _815;
    }
    float _817 = _809;
    if (_803)
    {
        float _819 = rsqrt(_799);
        _735 = _819;
    }
    float _821 = _735;
    float _823 = _817;
    float _825 = _821;
    if (_803)
    {
        float _827 = _807 * _817;
        _811 = _827;
    }
    float _829 = _811;
    if (_803)
    {
        float _831 = _829 * 0.15915493667125701904296875;
        _661 = _831;
    }
    float _833 = _661;
    float _835 = _781;
    if (_803)
    {
        float _837 = _833 * 6.283185482025146484375;
        float _839 = cos(_837);
        _835 = _839;
    }
    float _841 = _835;
    float _843 = _829;
    if (_803)
    {
        float _845 = _833 * 6.283185482025146484375;
        float _847 = sin(_845);
        _843 = _847;
    }
    float _849 = _843;
    if (_803)
    {
        float _851 = _841 + (-1.0);
        _823 = _851;
    }
    float _853 = _823;
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _857 = _787;
    float _859 = _853;
    if (_803)
    {
        float _861 = _855 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _857 = _861;
    }
    float _863 = _857;
    float _865 = _863;
    float _867 = _849;
    if (_803)
    {
        float _869 = fma(_849, _863, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _813 = _869;
    }
    float _871 = _813;
    if (_803)
    {
        float _873 = _853 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _865 = _873;
    }
    float _875 = _865;
    float _877 = _875;
    if (!_803)
    {
        _867 = _855;
    }
    float _879 = _867;
    float _881 = _879;
    if (_803)
    {
        float _883 = _821 * _871;
        _825 = _883;
    }
    float _885 = _825;
    if (_803)
    {
        float _887 = fma(_855, _841, _875);
        _881 = _887;
    }
    float _889 = _881;
    if (!_803)
    {
        _859 = _713;
    }
    float _891 = _859;
    float _893 = _891;
    if (_803)
    {
        float _895 = fma(_795, _885, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _893 = _895;
    }
    float _897 = _893;
    float _899 = _889 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_803)
    {
        _877 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _901 = _877;
    float _903 = _901;
    if (_803)
    {
        float _905 = fma(_791, _885, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _903 = _905;
    }
    float _907 = _903;
    float _909 = _889 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _911 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[1].x, _899);
    float _913 = _889 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _915 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[0].x, _909);
    float _917 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[1].z, _911);
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[2].x, _913);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[0].z, _915);
    float _923 = _917 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _925 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[2].z, _919);
    float _927 = _921 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _923 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _931 = _923 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _933 = _923 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _935 = _923 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _937 = _925 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _929);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _931);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _933);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _935);
    float _947 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[8].z, _939);
    float _949 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[9].z, _943);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[10].z, _945);
    float _955 = _947 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _957 = _949 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _957;
    out.gl_Position.y = _955;
    out.gl_Position.z = _959;
    out.gl_Position.w = _961;
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
    float _51 = in.m_37.x;
    float _53 = in.m_37.y;
    float _55 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _62 = _60 << 4;
    bool _66 = _62 == 0;
    bool _68 = _62 == 16;
    bool _70 = _62 == 32;
    bool _72 = _62 == 48;
    bool _74 = _62 == 64;
    float _76 = fma(_57, _51, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _78 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _80 = _62 == 80;
    bool _82 = _53 >= 0.5;
    bool _84 = isnan(_53);
    bool _86 = _82 || _84;
    bool _88 = isnan(0.5);
    bool _90 = _86 || _88;
    float _92 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _94 = _76 + _92;
    float _96 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _98 = _78 + _96;
    float _100 = as_type<float>(gl_BaseInstance);
    float _102 = _53;
    if (_66)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _104 = _100;
    float _106 = _94 * _94;
    bool _108 = _62 == 96;
    float _110 = 0.0;
    float _112 = _104;
    if (_66)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = fma(_98, _98, _106);
    float _118 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _120 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _118;
    float _122 = _114;
    float _124 = _120;
    if (_68)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _112;
    bool _128 = _62 == 112;
    float _130 = fma(_120, _120, _116);
    float _132 = _126;
    if (_68)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _122;
    float _136 = _134;
    if (_70)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    bool _140 = _62 == 128;
    float _142 = rsqrt(_130);
    float _144 = _138;
    if (_70)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_72)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _144;
    bool _152 = _62 == 144;
    float _154 = _150;
    if (_72)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_74)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _62 == 160;
    float _164 = _160;
    if (_74)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_80)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    float _172 = _142 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _174 = _62 == 176;
    float _176 = _170;
    if (_80)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _62 == 192;
    float _182 = log2(_172);
    float _184 = _178;
    if (_108)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _176;
    float _188 = _186;
    if (_108)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _190 = _184;
    float _192 = _190;
    if (_128)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _194 = _188;
    bool _196 = _62 == 208;
    float _198 = _194;
    if (_128)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_140)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _62 == 224;
    float _208 = _204;
    if (_140)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _210 = _202;
    float _212 = _182 + 1.2999999523162841796875;
    float _214 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _208;
    bool _218 = _62 == 240;
    float _220 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _222 = _214;
    float _224 = trunc(_212);
    int _226 = int(_224);
    float _228 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _230 = _220;
    bool _232 = _62 == 256;
    float _234 = _230;
    if (_162)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _236 = _228;
    float _238 = _236;
    if (_174)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _240 = _234;
    bool _242 = _62 == 272;
    float _244 = _240;
    if (_174)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_180)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    bool _252 = _62 == 288;
    int _254 = min(_226, 15);
    float _256 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _248;
    bool _260 = _62 == 304;
    float _262 = float(_254);
    float _264 = _258;
    if (_196)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _266 = _256;
    int _268 = _254 << 4;
    int _270 = _268 + 4288;
    float _272 = _266;
    float _274 = as_type<float>(_270);
    if (_196)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _276 = _264;
    float _278 = _276;
    if (_206)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _280 = _272;
    float _282 = -_262;
    float _284 = _282 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _286 = _62 == 320;
    int _288 = _270 + 8;
    uint _291 = uint(int(uint(_288) >> uint(2)));
    uint _293 = uint(int(uint(int(_291)) >> uint(2)));
    int _295 = int(_291) & 3;
    float _297 = (*spvDescriptorSet0.vp_c14)._m0[int(_293)][_295];
    int _299 = int(_291) + 1;
    uint _301 = uint(int(uint(_299) >> uint(2)));
    int _303 = _299 & 3;
    float _305 = (*spvDescriptorSet0.vp_c14)._m0[int(_301)][_303];
    float _307 = _280;
    if (_206)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _309 = _278;
    float _311 = _284 + 1.0;
    float _313 = _309;
    if (_218)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _315 = _307;
    bool _317 = _62 == 336;
    float _319 = _315;
    if (_218)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _321 = _313;
    float _323 = exp2(_311);
    float _325 = _321;
    if (_232)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _327 = _319;
    bool _329 = _62 == 352;
    float _331 = _327;
    if (_232)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _333 = _325;
    float _335 = _333;
    if (_242)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _337 = _331;
    bool _339 = _62 == 368;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_252)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _347 = _341;
    bool _349 = _62 == 384;
    float _351 = 1.0 / _323;
    float _353 = _347;
    float _355 = _323;
    if (_252)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _357 = _345;
    float _359 = _357;
    if (_260)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _361 = _353;
    bool _363 = _62 == 400;
    float _365 = _361;
    if (_260)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _367 = _359;
    bool _369 = _62 == 416;
    float _371 = _367;
    if (_286)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _373 = _365;
    float _375 = _373;
    if (_286)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _377 = _371;
    float _379 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _381 = _375;
    bool _383 = _62 == 432;
    float _385 = _381;
    if (_317)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _387 = _379;
    float _389 = _387;
    if (_329)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _391 = _385;
    bool _393 = _62 == 448;
    float _395 = _391;
    if (_329)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_339)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _401 = _395;
    bool _403 = _62 == 464;
    float _405 = _401;
    if (_339)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _411 = _405;
    bool _413 = _62 == 480;
    float _415 = _411;
    if (_349)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _417 = _409;
    float _419 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _421 = _415;
    bool _423 = _62 == 496;
    float _425 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _427 = _419;
    float _429 = _427;
    if (_369)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _431 = _425;
    bool _433 = _62 == 512;
    float _435 = _431;
    if (_369)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _437 = _429;
    bool _439 = _62 == 528;
    float _441 = _437;
    if (_383)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _443 = _435;
    float _445 = _443;
    if (_383)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _447 = _441;
    float _449 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _451 = _445;
    bool _453 = _62 == 544;
    float _455 = _451;
    if (_393)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _457 = _449;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _461 = _455;
    bool _463 = _62 == 560;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _471 = _465;
    bool _473 = _62 == 576;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_423)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _481 = _475;
    bool _483 = _62 == 592;
    float _485 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _487 = _479;
    float _489 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _491 = _485;
    bool _493 = _62 == 608;
    float _495 = _491;
    if (_433)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _497 = _489;
    float _499 = _497;
    if (_439)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _501 = _495;
    bool _503 = _62 == 624;
    float _505 = _501;
    if (_439)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _507 = _499;
    bool _509 = _62 == 640;
    float _511 = _507;
    if (_453)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _513 = _505;
    float _515 = _513;
    if (_453)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _517 = _511;
    float _519 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _521 = _515;
    bool _523 = _62 == 656;
    float _525 = _521;
    if (_463)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _527 = _519;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _531 = _525;
    bool _533 = _62 == 672;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _541 = _535;
    bool _543 = _62 == 688;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_493)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _551 = _545;
    bool _553 = _62 == 704;
    float _555 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _557 = _549;
    float _559 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _561 = _555;
    bool _563 = _62 == 720;
    float _565 = _561;
    if (_503)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _567 = _559;
    float _569 = _567;
    if (_509)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _571 = _565;
    bool _573 = _62 == 736;
    float _575 = _571;
    if (_509)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _577 = _569;
    bool _579 = _62 == 752;
    float _581 = _577;
    if (_523)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _583 = _575;
    float _585 = _583;
    if (_533)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_543)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _591 = _589;
    float _593 = _591;
    if (_553)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_563)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_573)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_579)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _607 = _605;
    float _609 = _351 * _607;
    if (_523)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _611 = _581;
    float _613 = _611;
    if (_533)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _615 = _613;
    float _617 = _609 * _51;
    float _619 = _615;
    if (_543)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_553)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _625 = _623;
    float _627 = floor(_617);
    float _629 = _625;
    if (_563)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _631 = _629;
    float _633 = _631;
    if (_573)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _635 = _633;
    float _637 = _635;
    if (_579)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _639 = _637;
    float _641 = -_627;
    float _643 = _617 + _641;
    float _645 = _323 * _639;
    float _647 = _643 * 2.0;
    float _649 = -_643;
    float _651 = fma(_645, _649, _51);
    float _653 = floor(_647);
    float _655 = _645 * _653;
    float _657 = _655 * 0.5;
    float _659 = _645;
    float _661 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_90)
    {
        _659 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _663 = _659;
    float _665 = _657 + _651;
    if (!_90)
    {
        float _667 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _663, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _102 = _667;
    }
    float _669 = _102;
    float _671 = fma(_57, _665, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _673 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _671 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _681 = _673 + _679;
    float _683 = _677 * _677;
    float _685 = fma(_681, _681, _683);
    float _687 = fma(_120, _120, _685);
    float _689 = _669;
    float _691 = _687;
    if (!_90)
    {
        _124 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _124;
    float _695 = sqrt(_687);
    float _697 = _693;
    if (!_90)
    {
        float _699 = fma(_669, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _689 = _699;
    }
    float _701 = _689;
    float _703 = -_305;
    float _705 = fma(_695, _297, _703);
    float _707 = precise::clamp(_705, 0.0, 1.0);
    float _709 = -_657;
    float _711 = fma(_709, _707, _665);
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _715 = _711;
    float _717 = _701;
    if (!_90)
    {
        float _719 = fma(_713, _663, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _715 = _719;
    }
    float _721 = _715;
    float _723 = _721;
    if (!_90)
    {
        float _725 = fma(_721, _693, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _723 = _725;
    }
    float _727 = _723;
    float _729 = _727;
    if (!_90)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _701);
        _697 = _731;
    }
    float _733 = _697;
    float _735 = _733;
    if (!_90)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _717 = _737;
    }
    float _739 = _717;
    if (!_90)
    {
        float2 _2172 = float2(_739, _733);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2172, float2(0.0), isnan(_2172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2172, float2(0.0), isnan(_2172)), level(0.0)).x;
        _729 = _741;
    }
    float _743 = _729;
    if (_90)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _691;
    float _747 = _745;
    if (_90)
    {
        _355 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _749 = _355;
    float _751 = _749;
    if (_90)
    {
        float _753 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _274 = _753;
    }
    float _755 = _274;
    float _757 = _755;
    if (_90)
    {
        float _759 = fma(_713, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _747 = _759;
    }
    float _761 = _747;
    float _763 = _761;
    if (_90)
    {
        float _765 = fma(_755, _749, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    if (_90)
    {
        float _769 = fma(_761, _749, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _763 = _769;
    }
    float _771 = _763;
    float _773 = _771;
    if (_90)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _751 = _775;
    }
    float _777 = _751;
    if (_90)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _743;
    if (_90)
    {
        float2 _2265 = float2(_781, _777);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2265, float2(0.0), isnan(_2265)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2265, float2(0.0), isnan(_2265)), level(0.0)).x;
        _783 = _785;
    }
    float _787 = _783;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = _713 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    bool _803 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _807 = _801 + _805;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _811 = _807;
    float _813 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_803)
    {
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _809 = _815;
    }
    float _817 = _809;
    if (_803)
    {
        float _819 = rsqrt(_799);
        _735 = _819;
    }
    float _821 = _735;
    float _823 = _817;
    float _825 = _821;
    if (_803)
    {
        float _827 = _807 * _817;
        _811 = _827;
    }
    float _829 = _811;
    if (_803)
    {
        float _831 = _829 * 0.15915493667125701904296875;
        _661 = _831;
    }
    float _833 = _661;
    float _835 = _781;
    if (_803)
    {
        float _837 = _833 * 6.283185482025146484375;
        float _839 = cos(_837);
        _835 = _839;
    }
    float _841 = _835;
    float _843 = _829;
    if (_803)
    {
        float _845 = _833 * 6.283185482025146484375;
        float _847 = sin(_845);
        _843 = _847;
    }
    float _849 = _843;
    if (_803)
    {
        float _851 = _841 + (-1.0);
        _823 = _851;
    }
    float _853 = _823;
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _857 = _787;
    float _859 = _853;
    if (_803)
    {
        float _861 = _855 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _857 = _861;
    }
    float _863 = _857;
    float _865 = _863;
    float _867 = _849;
    if (_803)
    {
        float _869 = fma(_849, _863, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _813 = _869;
    }
    float _871 = _813;
    if (_803)
    {
        float _873 = _853 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _865 = _873;
    }
    float _875 = _865;
    float _877 = _875;
    if (!_803)
    {
        _867 = _855;
    }
    float _879 = _867;
    float _881 = _879;
    if (_803)
    {
        float _883 = _821 * _871;
        _825 = _883;
    }
    float _885 = _825;
    if (_803)
    {
        float _887 = fma(_855, _841, _875);
        _881 = _887;
    }
    float _889 = _881;
    if (!_803)
    {
        _859 = _713;
    }
    float _891 = _859;
    float _893 = _891;
    if (_803)
    {
        float _895 = fma(_795, _885, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _893 = _895;
    }
    float _897 = _893;
    float _899 = _889 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_803)
    {
        _877 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _901 = _877;
    float _903 = _901;
    if (_803)
    {
        float _905 = fma(_791, _885, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _903 = _905;
    }
    float _907 = _903;
    float _909 = _889 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _911 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[1].x, _899);
    float _913 = _889 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _915 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[0].x, _909);
    float _917 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[1].z, _911);
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[2].x, _913);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[0].z, _915);
    float _923 = _917 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _925 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[2].z, _919);
    float _927 = _921 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _923 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _931 = _923 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _933 = _923 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _935 = _923 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _937 = _925 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _929);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _931);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _933);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _935);
    float _947 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[8].z, _939);
    float _949 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[9].z, _943);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[10].z, _945);
    float _955 = _947 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _957 = _949 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _957;
    out.gl_Position.y = _955;
    out.gl_Position.z = _959;
    out.gl_Position.w = _961;
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
    float _51 = in.m_37.x;
    float _53 = in.m_37.y;
    float _55 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _62 = _60 << 4;
    bool _66 = _62 == 0;
    bool _68 = _62 == 16;
    bool _70 = _62 == 32;
    bool _72 = _62 == 48;
    bool _74 = _62 == 64;
    float _76 = fma(_57, _51, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _78 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _80 = _62 == 80;
    bool _82 = _53 >= 0.5;
    bool _84 = isnan(_53);
    bool _86 = _82 || _84;
    bool _88 = isnan(0.5);
    bool _90 = _86 || _88;
    float _92 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _94 = _76 + _92;
    float _96 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _98 = _78 + _96;
    float _100 = as_type<float>(gl_BaseInstance);
    float _102 = _53;
    if (_66)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _104 = _100;
    float _106 = _94 * _94;
    bool _108 = _62 == 96;
    float _110 = 0.0;
    float _112 = _104;
    if (_66)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = fma(_98, _98, _106);
    float _118 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _120 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _118;
    float _122 = _114;
    float _124 = _120;
    if (_68)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _112;
    bool _128 = _62 == 112;
    float _130 = fma(_120, _120, _116);
    float _132 = _126;
    if (_68)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _122;
    float _136 = _134;
    if (_70)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    bool _140 = _62 == 128;
    float _142 = rsqrt(_130);
    float _144 = _138;
    if (_70)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_72)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _144;
    bool _152 = _62 == 144;
    float _154 = _150;
    if (_72)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_74)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _62 == 160;
    float _164 = _160;
    if (_74)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_80)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    float _172 = _142 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _174 = _62 == 176;
    float _176 = _170;
    if (_80)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _62 == 192;
    float _182 = log2(_172);
    float _184 = _178;
    if (_108)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _176;
    float _188 = _186;
    if (_108)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _190 = _184;
    float _192 = _190;
    if (_128)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _194 = _188;
    bool _196 = _62 == 208;
    float _198 = _194;
    if (_128)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_140)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _62 == 224;
    float _208 = _204;
    if (_140)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _210 = _202;
    float _212 = _182 + 1.2999999523162841796875;
    float _214 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _208;
    bool _218 = _62 == 240;
    float _220 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _222 = _214;
    float _224 = trunc(_212);
    int _226 = int(_224);
    float _228 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _230 = _220;
    bool _232 = _62 == 256;
    float _234 = _230;
    if (_162)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _236 = _228;
    float _238 = _236;
    if (_174)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _240 = _234;
    bool _242 = _62 == 272;
    float _244 = _240;
    if (_174)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_180)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    bool _252 = _62 == 288;
    int _254 = min(_226, 15);
    float _256 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _248;
    bool _260 = _62 == 304;
    float _262 = float(_254);
    float _264 = _258;
    if (_196)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _266 = _256;
    int _268 = _254 << 4;
    int _270 = _268 + 4288;
    float _272 = _266;
    float _274 = as_type<float>(_270);
    if (_196)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _276 = _264;
    float _278 = _276;
    if (_206)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _280 = _272;
    float _282 = -_262;
    float _284 = _282 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _286 = _62 == 320;
    int _288 = _270 + 8;
    uint _291 = uint(int(uint(_288) >> uint(2)));
    uint _293 = uint(int(uint(int(_291)) >> uint(2)));
    int _295 = int(_291) & 3;
    float _297 = (*spvDescriptorSet0.vp_c14)._m0[int(_293)][_295];
    int _299 = int(_291) + 1;
    uint _301 = uint(int(uint(_299) >> uint(2)));
    int _303 = _299 & 3;
    float _305 = (*spvDescriptorSet0.vp_c14)._m0[int(_301)][_303];
    float _307 = _280;
    if (_206)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _309 = _278;
    float _311 = _284 + 1.0;
    float _313 = _309;
    if (_218)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _315 = _307;
    bool _317 = _62 == 336;
    float _319 = _315;
    if (_218)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _321 = _313;
    float _323 = exp2(_311);
    float _325 = _321;
    if (_232)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _327 = _319;
    bool _329 = _62 == 352;
    float _331 = _327;
    if (_232)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _333 = _325;
    float _335 = _333;
    if (_242)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _337 = _331;
    bool _339 = _62 == 368;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_252)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _347 = _341;
    bool _349 = _62 == 384;
    float _351 = 1.0 / _323;
    float _353 = _347;
    float _355 = _323;
    if (_252)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _357 = _345;
    float _359 = _357;
    if (_260)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _361 = _353;
    bool _363 = _62 == 400;
    float _365 = _361;
    if (_260)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _367 = _359;
    bool _369 = _62 == 416;
    float _371 = _367;
    if (_286)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _373 = _365;
    float _375 = _373;
    if (_286)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _377 = _371;
    float _379 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _381 = _375;
    bool _383 = _62 == 432;
    float _385 = _381;
    if (_317)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _387 = _379;
    float _389 = _387;
    if (_329)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _391 = _385;
    bool _393 = _62 == 448;
    float _395 = _391;
    if (_329)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_339)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _401 = _395;
    bool _403 = _62 == 464;
    float _405 = _401;
    if (_339)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_349)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _411 = _405;
    bool _413 = _62 == 480;
    float _415 = _411;
    if (_349)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _417 = _409;
    float _419 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _421 = _415;
    bool _423 = _62 == 496;
    float _425 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _427 = _419;
    float _429 = _427;
    if (_369)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _431 = _425;
    bool _433 = _62 == 512;
    float _435 = _431;
    if (_369)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _437 = _429;
    bool _439 = _62 == 528;
    float _441 = _437;
    if (_383)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _443 = _435;
    float _445 = _443;
    if (_383)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _447 = _441;
    float _449 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _451 = _445;
    bool _453 = _62 == 544;
    float _455 = _451;
    if (_393)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _457 = _449;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _461 = _455;
    bool _463 = _62 == 560;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _471 = _465;
    bool _473 = _62 == 576;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_423)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _481 = _475;
    bool _483 = _62 == 592;
    float _485 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _487 = _479;
    float _489 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _491 = _485;
    bool _493 = _62 == 608;
    float _495 = _491;
    if (_433)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _497 = _489;
    float _499 = _497;
    if (_439)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _501 = _495;
    bool _503 = _62 == 624;
    float _505 = _501;
    if (_439)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _507 = _499;
    bool _509 = _62 == 640;
    float _511 = _507;
    if (_453)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _513 = _505;
    float _515 = _513;
    if (_453)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _517 = _511;
    float _519 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _521 = _515;
    bool _523 = _62 == 656;
    float _525 = _521;
    if (_463)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _527 = _519;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _531 = _525;
    bool _533 = _62 == 672;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _541 = _535;
    bool _543 = _62 == 688;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_493)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _551 = _545;
    bool _553 = _62 == 704;
    float _555 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _557 = _549;
    float _559 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _561 = _555;
    bool _563 = _62 == 720;
    float _565 = _561;
    if (_503)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _567 = _559;
    float _569 = _567;
    if (_509)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _571 = _565;
    bool _573 = _62 == 736;
    float _575 = _571;
    if (_509)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _577 = _569;
    bool _579 = _62 == 752;
    float _581 = _577;
    if (_523)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _583 = _575;
    float _585 = _583;
    if (_533)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _587 = _585;
    float _589 = _587;
    if (_543)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _591 = _589;
    float _593 = _591;
    if (_553)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_563)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_573)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_579)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _607 = _605;
    float _609 = _351 * _607;
    if (_523)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _611 = _581;
    float _613 = _611;
    if (_533)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _615 = _613;
    float _617 = _609 * _51;
    float _619 = _615;
    if (_543)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _621 = _619;
    float _623 = _621;
    if (_553)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _625 = _623;
    float _627 = floor(_617);
    float _629 = _625;
    if (_563)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _631 = _629;
    float _633 = _631;
    if (_573)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _635 = _633;
    float _637 = _635;
    if (_579)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _639 = _637;
    float _641 = -_627;
    float _643 = _617 + _641;
    float _645 = _323 * _639;
    float _647 = _643 * 2.0;
    float _649 = -_643;
    float _651 = fma(_645, _649, _51);
    float _653 = floor(_647);
    float _655 = _645 * _653;
    float _657 = _655 * 0.5;
    float _659 = _645;
    float _661 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_90)
    {
        _659 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _663 = _659;
    float _665 = _657 + _651;
    if (!_90)
    {
        float _667 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _663, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _102 = _667;
    }
    float _669 = _102;
    float _671 = fma(_57, _665, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _673 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _671 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _681 = _673 + _679;
    float _683 = _677 * _677;
    float _685 = fma(_681, _681, _683);
    float _687 = fma(_120, _120, _685);
    float _689 = _669;
    float _691 = _687;
    if (!_90)
    {
        _124 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _124;
    float _695 = sqrt(_687);
    float _697 = _693;
    if (!_90)
    {
        float _699 = fma(_669, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _689 = _699;
    }
    float _701 = _689;
    float _703 = -_305;
    float _705 = fma(_695, _297, _703);
    float _707 = precise::clamp(_705, 0.0, 1.0);
    float _709 = -_657;
    float _711 = fma(_709, _707, _665);
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _715 = _711;
    float _717 = _701;
    if (!_90)
    {
        float _719 = fma(_713, _663, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _715 = _719;
    }
    float _721 = _715;
    float _723 = _721;
    if (!_90)
    {
        float _725 = fma(_721, _693, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _723 = _725;
    }
    float _727 = _723;
    float _729 = _727;
    if (!_90)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _701);
        _697 = _731;
    }
    float _733 = _697;
    float _735 = _733;
    if (!_90)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _717 = _737;
    }
    float _739 = _717;
    if (!_90)
    {
        float2 _2172 = float2(_739, _733);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2172, float2(0.0), isnan(_2172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2172, float2(0.0), isnan(_2172)), level(0.0)).x;
        _729 = _741;
    }
    float _743 = _729;
    if (_90)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _691;
    float _747 = _745;
    if (_90)
    {
        _355 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _749 = _355;
    float _751 = _749;
    if (_90)
    {
        float _753 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _274 = _753;
    }
    float _755 = _274;
    float _757 = _755;
    if (_90)
    {
        float _759 = fma(_713, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _747 = _759;
    }
    float _761 = _747;
    float _763 = _761;
    if (_90)
    {
        float _765 = fma(_755, _749, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    if (_90)
    {
        float _769 = fma(_761, _749, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _763 = _769;
    }
    float _771 = _763;
    float _773 = _771;
    if (_90)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _751 = _775;
    }
    float _777 = _751;
    if (_90)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _743;
    if (_90)
    {
        float2 _2265 = float2(_781, _777);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2265, float2(0.0), isnan(_2265)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2265, float2(0.0), isnan(_2265)), level(0.0)).x;
        _783 = _785;
    }
    float _787 = _783;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = _713 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    bool _803 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _807 = _801 + _805;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _811 = _807;
    float _813 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_803)
    {
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _809 = _815;
    }
    float _817 = _809;
    if (_803)
    {
        float _819 = rsqrt(_799);
        _735 = _819;
    }
    float _821 = _735;
    float _823 = _817;
    float _825 = _821;
    if (_803)
    {
        float _827 = _807 * _817;
        _811 = _827;
    }
    float _829 = _811;
    if (_803)
    {
        float _831 = _829 * 0.15915493667125701904296875;
        _661 = _831;
    }
    float _833 = _661;
    float _835 = _781;
    if (_803)
    {
        float _837 = _833 * 6.283185482025146484375;
        float _839 = cos(_837);
        _835 = _839;
    }
    float _841 = _835;
    float _843 = _829;
    if (_803)
    {
        float _845 = _833 * 6.283185482025146484375;
        float _847 = sin(_845);
        _843 = _847;
    }
    float _849 = _843;
    if (_803)
    {
        float _851 = _841 + (-1.0);
        _823 = _851;
    }
    float _853 = _823;
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _857 = _787;
    float _859 = _853;
    if (_803)
    {
        float _861 = _855 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _857 = _861;
    }
    float _863 = _857;
    float _865 = _863;
    float _867 = _849;
    if (_803)
    {
        float _869 = fma(_849, _863, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _813 = _869;
    }
    float _871 = _813;
    if (_803)
    {
        float _873 = _853 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _865 = _873;
    }
    float _875 = _865;
    float _877 = _875;
    if (!_803)
    {
        _867 = _855;
    }
    float _879 = _867;
    float _881 = _879;
    if (_803)
    {
        float _883 = _821 * _871;
        _825 = _883;
    }
    float _885 = _825;
    if (_803)
    {
        float _887 = fma(_855, _841, _875);
        _881 = _887;
    }
    float _889 = _881;
    if (!_803)
    {
        _859 = _713;
    }
    float _891 = _859;
    float _893 = _891;
    if (_803)
    {
        float _895 = fma(_795, _885, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _893 = _895;
    }
    float _897 = _893;
    float _899 = _889 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_803)
    {
        _877 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _901 = _877;
    float _903 = _901;
    if (_803)
    {
        float _905 = fma(_791, _885, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _903 = _905;
    }
    float _907 = _903;
    float _909 = _889 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _911 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[1].x, _899);
    float _913 = _889 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _915 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[0].x, _909);
    float _917 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[1].z, _911);
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[2].x, _913);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[0].z, _915);
    float _923 = _917 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _925 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[2].z, _919);
    float _927 = _921 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _923 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _931 = _923 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _933 = _923 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _935 = _923 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _937 = _925 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _929);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _931);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _933);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _935);
    float _947 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[8].z, _939);
    float _949 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[9].z, _943);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c4)._m0[10].z, _945);
    float _955 = _947 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _957 = _949 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _957;
    out.gl_Position.y = _955;
    out.gl_Position.z = _959;
    out.gl_Position.w = _961;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

