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
    float _104 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    if (_66)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _106 = _100;
    float _108 = _94 * _94;
    bool _110 = _62 == 96;
    float _112 = 0.0;
    float _114 = _106;
    if (_66)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _116 = _112;
    float _118 = fma(_98, _98, _108);
    float _120 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _122 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _120;
    float _124 = _116;
    float _126 = _122;
    if (_68)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _128 = _114;
    bool _130 = _62 == 112;
    float _132 = fma(_122, _122, _118);
    float _134 = _128;
    if (_68)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _136 = _124;
    float _138 = _136;
    if (_70)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _140 = _134;
    bool _142 = _62 == 128;
    float _144 = rsqrt(_132);
    float _146 = _140;
    if (_70)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _148 = _138;
    float _150 = _148;
    if (_72)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _152 = _146;
    bool _154 = _62 == 144;
    float _156 = _152;
    if (_72)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _158 = _150;
    float _160 = _158;
    if (_74)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _162 = _156;
    bool _164 = _62 == 160;
    float _166 = _162;
    if (_74)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_80)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _166;
    float _174 = _144 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _176 = _62 == 176;
    float _178 = _172;
    if (_80)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _180 = _170;
    bool _182 = _62 == 192;
    float _184 = log2(_174);
    float _186 = _180;
    if (_110)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _188 = _178;
    float _190 = _188;
    if (_110)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _192 = _186;
    float _194 = _192;
    if (_130)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _196 = _190;
    bool _198 = _62 == 208;
    float _200 = _196;
    if (_130)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_142)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _206 = _200;
    bool _208 = _62 == 224;
    float _210 = _206;
    if (_142)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _204;
    float _214 = _184 + 1.2999999523162841796875;
    float _216 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _218 = _210;
    bool _220 = _62 == 240;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _224 = _216;
    float _226 = trunc(_214);
    int _228 = int(_226);
    float _230 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _232 = _222;
    bool _234 = _62 == 256;
    float _236 = _232;
    if (_164)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _238 = _230;
    float _240 = _238;
    if (_176)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _242 = _236;
    bool _244 = _62 == 272;
    float _246 = _242;
    if (_176)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_182)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _252 = _246;
    bool _254 = _62 == 288;
    int _256 = min(_228, 15);
    float _258 = _252;
    if (_182)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _260 = _250;
    bool _262 = _62 == 304;
    float _264 = float(_256);
    float _266 = _260;
    if (_198)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _268 = _258;
    int _270 = _256 << 4;
    int _272 = _270 + 4288;
    float _274 = _268;
    float _276 = as_type<float>(_272);
    if (_198)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _278 = _266;
    float _280 = _278;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _282 = _274;
    float _284 = -_264;
    float _286 = _284 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _288 = _62 == 320;
    int _290 = _272 + 8;
    uint _293 = uint(int(uint(_290) >> uint(2)));
    uint _295 = uint(int(uint(int(_293)) >> uint(2)));
    int _297 = int(_293) & 3;
    float _299 = (*spvDescriptorSet0.vp_c14)._m0[int(_295)][_297];
    int _301 = int(_293) + 1;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    int _305 = _301 & 3;
    float _307 = (*spvDescriptorSet0.vp_c14)._m0[int(_303)][_305];
    float _309 = _282;
    if (_208)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _311 = _280;
    float _313 = _286 + 1.0;
    float _315 = _311;
    if (_220)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _317 = _309;
    bool _319 = _62 == 336;
    float _321 = _317;
    if (_220)
    {
        _315 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _323 = _315;
    float _325 = exp2(_313);
    float _327 = _323;
    if (_234)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _329 = _321;
    bool _331 = _62 == 352;
    float _333 = _329;
    if (_234)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _335 = _327;
    float _337 = _335;
    if (_244)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _339 = _333;
    bool _341 = _62 == 368;
    float _343 = _339;
    if (_244)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _345 = _337;
    float _347 = _345;
    if (_254)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _349 = _343;
    bool _351 = _62 == 384;
    float _353 = 1.0 / _325;
    float _355 = _349;
    float _357 = _325;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _359 = _347;
    float _361 = _359;
    if (_262)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _363 = _355;
    bool _365 = _62 == 400;
    float _367 = _363;
    if (_262)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _369 = _361;
    bool _371 = _62 == 416;
    float _373 = _369;
    if (_288)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _375 = _367;
    float _377 = _375;
    if (_288)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _379 = _373;
    float _381 = _379;
    if (_319)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _383 = _377;
    bool _385 = _62 == 432;
    float _387 = _383;
    if (_319)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_331)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _393 = _387;
    bool _395 = _62 == 448;
    float _397 = _393;
    if (_331)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_341)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _403 = _397;
    bool _405 = _62 == 464;
    float _407 = _403;
    if (_341)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _413 = _407;
    bool _415 = _62 == 480;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _423 = _417;
    bool _425 = _62 == 496;
    float _427 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _429 = _421;
    float _431 = _429;
    if (_371)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _433 = _427;
    bool _435 = _62 == 512;
    float _437 = _433;
    if (_371)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _439 = _431;
    bool _441 = _62 == 528;
    float _443 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _445 = _437;
    float _447 = _445;
    if (_385)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _449 = _443;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _453 = _447;
    bool _455 = _62 == 544;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _463 = _457;
    bool _465 = _62 == 560;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _473 = _467;
    bool _475 = _62 == 576;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _483 = _477;
    bool _485 = _62 == 592;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _493 = _487;
    bool _495 = _62 == 608;
    float _497 = _493;
    if (_435)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _499 = _491;
    float _501 = _499;
    if (_441)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _503 = _497;
    bool _505 = _62 == 624;
    float _507 = _503;
    if (_441)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _509 = _501;
    bool _511 = _62 == 640;
    float _513 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _515 = _507;
    float _517 = _515;
    if (_455)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _519 = _513;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _523 = _517;
    bool _525 = _62 == 656;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _533 = _527;
    bool _535 = _62 == 672;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _543 = _537;
    bool _545 = _62 == 688;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _553 = _547;
    bool _555 = _62 == 704;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _563 = _557;
    bool _565 = _62 == 720;
    float _567 = _563;
    if (_505)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _569 = _561;
    float _571 = _569;
    if (_511)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _573 = _567;
    bool _575 = _62 == 736;
    float _577 = _573;
    if (_511)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _579 = _571;
    bool _581 = _62 == 752;
    float _583 = _579;
    if (_525)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _585 = _577;
    float _587 = _585;
    if (_535)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_545)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _593 = _591;
    float _595 = _593;
    if (_555)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_565)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_575)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_581)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _609 = _607;
    float _611 = _353 * _609;
    if (_525)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _613 = _583;
    float _615 = _613;
    if (_535)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _617 = _615;
    float _619 = _611 * _51;
    float _621 = _617;
    if (_545)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _623 = _621;
    float _625 = _623;
    if (_555)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _627 = _625;
    float _629 = floor(_619);
    float _631 = _627;
    if (_565)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_575)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _637 = _635;
    float _639 = _637;
    if (_581)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _641 = _639;
    float _643 = -_629;
    float _645 = _619 + _643;
    float _647 = _325 * _641;
    float _649 = _645 * 2.0;
    float _651 = -_645;
    float _653 = fma(_647, _651, _51);
    float _655 = floor(_649);
    float _657 = _647 * _655;
    float _659 = _657 * 0.5;
    float _661 = _647;
    if (!_90)
    {
        _661 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _663 = _661;
    float _665 = _659 + _653;
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
    float _687 = fma(_122, _122, _685);
    float _689 = _669;
    float _691 = _687;
    if (!_90)
    {
        _126 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _126;
    float _695 = sqrt(_687);
    float _697 = _693;
    if (!_90)
    {
        float _699 = fma(_669, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _689 = _699;
    }
    float _701 = _689;
    float _703 = -_307;
    float _705 = fma(_695, _299, _703);
    float _707 = precise::clamp(_705, 0.0, 1.0);
    float _709 = -_659;
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
    if (!_90)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _717 = _735;
    }
    float _737 = _717;
    if (!_90)
    {
        float2 _2141 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2141, float2(0.0), isnan(_2141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2141, float2(0.0), isnan(_2141)), level(0.0)).x;
        _729 = _739;
    }
    float _741 = _729;
    if (_90)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _691;
    float _745 = _743;
    if (_90)
    {
        _357 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _357;
    float _749 = _747;
    if (_90)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _276 = _751;
    }
    float _753 = _276;
    float _755 = _753;
    if (_90)
    {
        float _757 = fma(_713, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_90)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _755 = _763;
    }
    float _765 = _755;
    if (_90)
    {
        float _767 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _761 = _767;
    }
    float _769 = _761;
    float _771 = _769;
    if (_90)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _749 = _773;
    }
    float _775 = _749;
    if (_90)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_90)
    {
        float2 _2234 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2234, float2(0.0), isnan(_2234)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2234, float2(0.0), isnan(_2234)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _793 = _713 + _791;
    float _795 = _789 * _789;
    float _797 = fma(_793, _793, _795);
    float _799 = sqrt(_797);
    bool _801 = _799 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _803 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _805 = _803 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma(_713, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _809 = _805;
    if (!_801)
    {
        _809 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _811 = _809;
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
    float _815 = _813;
    float _817 = _811;
    if (!_801)
    {
        _104 = _713;
    }
    float _819 = _104;
    float _821 = _813 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _823 = _819;
    float _825 = _821;
    if (!_801)
    {
        _815 = _803;
    }
    float _827 = _815;
    bool _829 = !_801;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _835 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _837 = _799 + _835;
        float _839 = _803 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _841 = rsqrt(_797);
        float _843 = _837 * _833;
        float _845 = _843 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = cos(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 + (-1.0);
        float _857 = _855 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _859 = fma(_853, _839, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _861 = fma(_803, _849, _857);
        float _863 = _841 * _859;
        float _865 = _861 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _867 = fma(_793, _863, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _869 = fma(_789, _863, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _871 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[2].x, _865);
        float _873 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[2].z, _871);
        float _875 = _873 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _831 = _861;
        _823 = _867;
        _817 = _869;
        _825 = _875;
    }
    float _877 = _831;
    float _879 = _823;
    float _881 = _817;
    float _883 = _825;
    float _885 = _877 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _887 = _877 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _889 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[1].x, _885);
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[0].x, _887);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[1].z, _889);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[0].z, _891);
    float _897 = _893 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _899 = _895 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _901 = _897 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _903 = _897 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _905 = _897 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _907 = _897 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _909 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[8].x, _901);
    float _911 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[7].x, _903);
    float _913 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[9].x, _905);
    float _915 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[10].x, _907);
    float _917 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[8].z, _909);
    float _919 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[7].z, _911);
    float _921 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[9].z, _913);
    float _923 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[10].z, _915);
    float _925 = _917 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _927 = _919 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _929 = _921 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _931 = _923 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _927;
    out.gl_Position.y = _925;
    out.gl_Position.z = _929;
    out.gl_Position.w = _931;
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
    float _104 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    if (_66)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _106 = _100;
    float _108 = _94 * _94;
    bool _110 = _62 == 96;
    float _112 = 0.0;
    float _114 = _106;
    if (_66)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _116 = _112;
    float _118 = fma(_98, _98, _108);
    float _120 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _122 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _120;
    float _124 = _116;
    float _126 = _122;
    if (_68)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _128 = _114;
    bool _130 = _62 == 112;
    float _132 = fma(_122, _122, _118);
    float _134 = _128;
    if (_68)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _136 = _124;
    float _138 = _136;
    if (_70)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _140 = _134;
    bool _142 = _62 == 128;
    float _144 = rsqrt(_132);
    float _146 = _140;
    if (_70)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _148 = _138;
    float _150 = _148;
    if (_72)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _152 = _146;
    bool _154 = _62 == 144;
    float _156 = _152;
    if (_72)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _158 = _150;
    float _160 = _158;
    if (_74)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _162 = _156;
    bool _164 = _62 == 160;
    float _166 = _162;
    if (_74)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_80)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _166;
    float _174 = _144 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _176 = _62 == 176;
    float _178 = _172;
    if (_80)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _180 = _170;
    bool _182 = _62 == 192;
    float _184 = log2(_174);
    float _186 = _180;
    if (_110)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _188 = _178;
    float _190 = _188;
    if (_110)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _192 = _186;
    float _194 = _192;
    if (_130)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _196 = _190;
    bool _198 = _62 == 208;
    float _200 = _196;
    if (_130)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_142)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _206 = _200;
    bool _208 = _62 == 224;
    float _210 = _206;
    if (_142)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _204;
    float _214 = _184 + 1.2999999523162841796875;
    float _216 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _218 = _210;
    bool _220 = _62 == 240;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _224 = _216;
    float _226 = trunc(_214);
    int _228 = int(_226);
    float _230 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _232 = _222;
    bool _234 = _62 == 256;
    float _236 = _232;
    if (_164)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _238 = _230;
    float _240 = _238;
    if (_176)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _242 = _236;
    bool _244 = _62 == 272;
    float _246 = _242;
    if (_176)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_182)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _252 = _246;
    bool _254 = _62 == 288;
    int _256 = min(_228, 15);
    float _258 = _252;
    if (_182)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _260 = _250;
    bool _262 = _62 == 304;
    float _264 = float(_256);
    float _266 = _260;
    if (_198)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _268 = _258;
    int _270 = _256 << 4;
    int _272 = _270 + 4288;
    float _274 = _268;
    float _276 = as_type<float>(_272);
    if (_198)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _278 = _266;
    float _280 = _278;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _282 = _274;
    float _284 = -_264;
    float _286 = _284 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _288 = _62 == 320;
    int _290 = _272 + 8;
    uint _293 = uint(int(uint(_290) >> uint(2)));
    uint _295 = uint(int(uint(int(_293)) >> uint(2)));
    int _297 = int(_293) & 3;
    float _299 = (*spvDescriptorSet0.vp_c14)._m0[int(_295)][_297];
    int _301 = int(_293) + 1;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    int _305 = _301 & 3;
    float _307 = (*spvDescriptorSet0.vp_c14)._m0[int(_303)][_305];
    float _309 = _282;
    if (_208)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _311 = _280;
    float _313 = _286 + 1.0;
    float _315 = _311;
    if (_220)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _317 = _309;
    bool _319 = _62 == 336;
    float _321 = _317;
    if (_220)
    {
        _315 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _323 = _315;
    float _325 = exp2(_313);
    float _327 = _323;
    if (_234)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _329 = _321;
    bool _331 = _62 == 352;
    float _333 = _329;
    if (_234)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _335 = _327;
    float _337 = _335;
    if (_244)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _339 = _333;
    bool _341 = _62 == 368;
    float _343 = _339;
    if (_244)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _345 = _337;
    float _347 = _345;
    if (_254)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _349 = _343;
    bool _351 = _62 == 384;
    float _353 = 1.0 / _325;
    float _355 = _349;
    float _357 = _325;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _359 = _347;
    float _361 = _359;
    if (_262)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _363 = _355;
    bool _365 = _62 == 400;
    float _367 = _363;
    if (_262)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _369 = _361;
    bool _371 = _62 == 416;
    float _373 = _369;
    if (_288)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _375 = _367;
    float _377 = _375;
    if (_288)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _379 = _373;
    float _381 = _379;
    if (_319)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _383 = _377;
    bool _385 = _62 == 432;
    float _387 = _383;
    if (_319)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_331)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _393 = _387;
    bool _395 = _62 == 448;
    float _397 = _393;
    if (_331)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_341)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _403 = _397;
    bool _405 = _62 == 464;
    float _407 = _403;
    if (_341)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _413 = _407;
    bool _415 = _62 == 480;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _423 = _417;
    bool _425 = _62 == 496;
    float _427 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _429 = _421;
    float _431 = _429;
    if (_371)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _433 = _427;
    bool _435 = _62 == 512;
    float _437 = _433;
    if (_371)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _439 = _431;
    bool _441 = _62 == 528;
    float _443 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _445 = _437;
    float _447 = _445;
    if (_385)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _449 = _443;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _453 = _447;
    bool _455 = _62 == 544;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _463 = _457;
    bool _465 = _62 == 560;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _473 = _467;
    bool _475 = _62 == 576;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _483 = _477;
    bool _485 = _62 == 592;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _493 = _487;
    bool _495 = _62 == 608;
    float _497 = _493;
    if (_435)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _499 = _491;
    float _501 = _499;
    if (_441)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _503 = _497;
    bool _505 = _62 == 624;
    float _507 = _503;
    if (_441)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _509 = _501;
    bool _511 = _62 == 640;
    float _513 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _515 = _507;
    float _517 = _515;
    if (_455)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _519 = _513;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _523 = _517;
    bool _525 = _62 == 656;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _533 = _527;
    bool _535 = _62 == 672;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _543 = _537;
    bool _545 = _62 == 688;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _553 = _547;
    bool _555 = _62 == 704;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _563 = _557;
    bool _565 = _62 == 720;
    float _567 = _563;
    if (_505)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _569 = _561;
    float _571 = _569;
    if (_511)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _573 = _567;
    bool _575 = _62 == 736;
    float _577 = _573;
    if (_511)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _579 = _571;
    bool _581 = _62 == 752;
    float _583 = _579;
    if (_525)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _585 = _577;
    float _587 = _585;
    if (_535)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_545)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _593 = _591;
    float _595 = _593;
    if (_555)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_565)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_575)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_581)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _609 = _607;
    float _611 = _353 * _609;
    if (_525)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _613 = _583;
    float _615 = _613;
    if (_535)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _617 = _615;
    float _619 = _611 * _51;
    float _621 = _617;
    if (_545)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _623 = _621;
    float _625 = _623;
    if (_555)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _627 = _625;
    float _629 = floor(_619);
    float _631 = _627;
    if (_565)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_575)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _637 = _635;
    float _639 = _637;
    if (_581)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _641 = _639;
    float _643 = -_629;
    float _645 = _619 + _643;
    float _647 = _325 * _641;
    float _649 = _645 * 2.0;
    float _651 = -_645;
    float _653 = fma(_647, _651, _51);
    float _655 = floor(_649);
    float _657 = _647 * _655;
    float _659 = _657 * 0.5;
    float _661 = _647;
    if (!_90)
    {
        _661 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _663 = _661;
    float _665 = _659 + _653;
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
    float _687 = fma(_122, _122, _685);
    float _689 = _669;
    float _691 = _687;
    if (!_90)
    {
        _126 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _126;
    float _695 = sqrt(_687);
    float _697 = _693;
    if (!_90)
    {
        float _699 = fma(_669, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _689 = _699;
    }
    float _701 = _689;
    float _703 = -_307;
    float _705 = fma(_695, _299, _703);
    float _707 = precise::clamp(_705, 0.0, 1.0);
    float _709 = -_659;
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
    if (!_90)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _717 = _735;
    }
    float _737 = _717;
    if (!_90)
    {
        float2 _2141 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2141, float2(0.0), isnan(_2141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2141, float2(0.0), isnan(_2141)), level(0.0)).x;
        _729 = _739;
    }
    float _741 = _729;
    if (_90)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _691;
    float _745 = _743;
    if (_90)
    {
        _357 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _357;
    float _749 = _747;
    if (_90)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _276 = _751;
    }
    float _753 = _276;
    float _755 = _753;
    if (_90)
    {
        float _757 = fma(_713, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_90)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _755 = _763;
    }
    float _765 = _755;
    if (_90)
    {
        float _767 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _761 = _767;
    }
    float _769 = _761;
    float _771 = _769;
    if (_90)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _749 = _773;
    }
    float _775 = _749;
    if (_90)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_90)
    {
        float2 _2234 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2234, float2(0.0), isnan(_2234)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2234, float2(0.0), isnan(_2234)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _793 = _713 + _791;
    float _795 = _789 * _789;
    float _797 = fma(_793, _793, _795);
    float _799 = sqrt(_797);
    bool _801 = _799 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _803 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _805 = _803 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma(_713, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _809 = _805;
    if (!_801)
    {
        _809 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _811 = _809;
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
    float _815 = _813;
    float _817 = _811;
    if (!_801)
    {
        _104 = _713;
    }
    float _819 = _104;
    float _821 = _813 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _823 = _819;
    float _825 = _821;
    if (!_801)
    {
        _815 = _803;
    }
    float _827 = _815;
    bool _829 = !_801;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _835 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _837 = _799 + _835;
        float _839 = _803 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _841 = rsqrt(_797);
        float _843 = _837 * _833;
        float _845 = _843 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = cos(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 + (-1.0);
        float _857 = _855 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _859 = fma(_853, _839, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _861 = fma(_803, _849, _857);
        float _863 = _841 * _859;
        float _865 = _861 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _867 = fma(_793, _863, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _869 = fma(_789, _863, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _871 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[2].x, _865);
        float _873 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[2].z, _871);
        float _875 = _873 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _831 = _861;
        _823 = _867;
        _817 = _869;
        _825 = _875;
    }
    float _877 = _831;
    float _879 = _823;
    float _881 = _817;
    float _883 = _825;
    float _885 = _877 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _887 = _877 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _889 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[1].x, _885);
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[0].x, _887);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[1].z, _889);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[0].z, _891);
    float _897 = _893 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _899 = _895 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _901 = _897 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _903 = _897 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _905 = _897 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _907 = _897 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _909 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[8].x, _901);
    float _911 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[7].x, _903);
    float _913 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[9].x, _905);
    float _915 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[10].x, _907);
    float _917 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[8].z, _909);
    float _919 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[7].z, _911);
    float _921 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[9].z, _913);
    float _923 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[10].z, _915);
    float _925 = _917 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _927 = _919 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _929 = _921 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _931 = _923 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _927;
    out.gl_Position.y = _925;
    out.gl_Position.z = _929;
    out.gl_Position.w = _931;
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
    float _104 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    if (_66)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _106 = _100;
    float _108 = _94 * _94;
    bool _110 = _62 == 96;
    float _112 = 0.0;
    float _114 = _106;
    if (_66)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _116 = _112;
    float _118 = fma(_98, _98, _108);
    float _120 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _122 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _120;
    float _124 = _116;
    float _126 = _122;
    if (_68)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _128 = _114;
    bool _130 = _62 == 112;
    float _132 = fma(_122, _122, _118);
    float _134 = _128;
    if (_68)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _136 = _124;
    float _138 = _136;
    if (_70)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _140 = _134;
    bool _142 = _62 == 128;
    float _144 = rsqrt(_132);
    float _146 = _140;
    if (_70)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _148 = _138;
    float _150 = _148;
    if (_72)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _152 = _146;
    bool _154 = _62 == 144;
    float _156 = _152;
    if (_72)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _158 = _150;
    float _160 = _158;
    if (_74)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _162 = _156;
    bool _164 = _62 == 160;
    float _166 = _162;
    if (_74)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_80)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _166;
    float _174 = _144 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _176 = _62 == 176;
    float _178 = _172;
    if (_80)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _180 = _170;
    bool _182 = _62 == 192;
    float _184 = log2(_174);
    float _186 = _180;
    if (_110)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _188 = _178;
    float _190 = _188;
    if (_110)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _192 = _186;
    float _194 = _192;
    if (_130)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _196 = _190;
    bool _198 = _62 == 208;
    float _200 = _196;
    if (_130)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_142)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _206 = _200;
    bool _208 = _62 == 224;
    float _210 = _206;
    if (_142)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _204;
    float _214 = _184 + 1.2999999523162841796875;
    float _216 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _218 = _210;
    bool _220 = _62 == 240;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _224 = _216;
    float _226 = trunc(_214);
    int _228 = int(_226);
    float _230 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _232 = _222;
    bool _234 = _62 == 256;
    float _236 = _232;
    if (_164)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _238 = _230;
    float _240 = _238;
    if (_176)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _242 = _236;
    bool _244 = _62 == 272;
    float _246 = _242;
    if (_176)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_182)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _252 = _246;
    bool _254 = _62 == 288;
    int _256 = min(_228, 15);
    float _258 = _252;
    if (_182)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _260 = _250;
    bool _262 = _62 == 304;
    float _264 = float(_256);
    float _266 = _260;
    if (_198)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _268 = _258;
    int _270 = _256 << 4;
    int _272 = _270 + 4288;
    float _274 = _268;
    float _276 = as_type<float>(_272);
    if (_198)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _278 = _266;
    float _280 = _278;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _282 = _274;
    float _284 = -_264;
    float _286 = _284 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _288 = _62 == 320;
    int _290 = _272 + 8;
    uint _293 = uint(int(uint(_290) >> uint(2)));
    uint _295 = uint(int(uint(int(_293)) >> uint(2)));
    int _297 = int(_293) & 3;
    float _299 = (*spvDescriptorSet0.vp_c14)._m0[int(_295)][_297];
    int _301 = int(_293) + 1;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    int _305 = _301 & 3;
    float _307 = (*spvDescriptorSet0.vp_c14)._m0[int(_303)][_305];
    float _309 = _282;
    if (_208)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _311 = _280;
    float _313 = _286 + 1.0;
    float _315 = _311;
    if (_220)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _317 = _309;
    bool _319 = _62 == 336;
    float _321 = _317;
    if (_220)
    {
        _315 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _323 = _315;
    float _325 = exp2(_313);
    float _327 = _323;
    if (_234)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _329 = _321;
    bool _331 = _62 == 352;
    float _333 = _329;
    if (_234)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _335 = _327;
    float _337 = _335;
    if (_244)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _339 = _333;
    bool _341 = _62 == 368;
    float _343 = _339;
    if (_244)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _345 = _337;
    float _347 = _345;
    if (_254)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _349 = _343;
    bool _351 = _62 == 384;
    float _353 = 1.0 / _325;
    float _355 = _349;
    float _357 = _325;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _359 = _347;
    float _361 = _359;
    if (_262)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _363 = _355;
    bool _365 = _62 == 400;
    float _367 = _363;
    if (_262)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _369 = _361;
    bool _371 = _62 == 416;
    float _373 = _369;
    if (_288)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _375 = _367;
    float _377 = _375;
    if (_288)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _379 = _373;
    float _381 = _379;
    if (_319)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _383 = _377;
    bool _385 = _62 == 432;
    float _387 = _383;
    if (_319)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_331)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _393 = _387;
    bool _395 = _62 == 448;
    float _397 = _393;
    if (_331)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_341)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _403 = _397;
    bool _405 = _62 == 464;
    float _407 = _403;
    if (_341)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _413 = _407;
    bool _415 = _62 == 480;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _423 = _417;
    bool _425 = _62 == 496;
    float _427 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _429 = _421;
    float _431 = _429;
    if (_371)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _433 = _427;
    bool _435 = _62 == 512;
    float _437 = _433;
    if (_371)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _439 = _431;
    bool _441 = _62 == 528;
    float _443 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _445 = _437;
    float _447 = _445;
    if (_385)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _449 = _443;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _453 = _447;
    bool _455 = _62 == 544;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _463 = _457;
    bool _465 = _62 == 560;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _473 = _467;
    bool _475 = _62 == 576;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _483 = _477;
    bool _485 = _62 == 592;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _493 = _487;
    bool _495 = _62 == 608;
    float _497 = _493;
    if (_435)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _499 = _491;
    float _501 = _499;
    if (_441)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _503 = _497;
    bool _505 = _62 == 624;
    float _507 = _503;
    if (_441)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _509 = _501;
    bool _511 = _62 == 640;
    float _513 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _515 = _507;
    float _517 = _515;
    if (_455)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _519 = _513;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _523 = _517;
    bool _525 = _62 == 656;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _533 = _527;
    bool _535 = _62 == 672;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _543 = _537;
    bool _545 = _62 == 688;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _553 = _547;
    bool _555 = _62 == 704;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _563 = _557;
    bool _565 = _62 == 720;
    float _567 = _563;
    if (_505)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _569 = _561;
    float _571 = _569;
    if (_511)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _573 = _567;
    bool _575 = _62 == 736;
    float _577 = _573;
    if (_511)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _579 = _571;
    bool _581 = _62 == 752;
    float _583 = _579;
    if (_525)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _585 = _577;
    float _587 = _585;
    if (_535)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_545)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _593 = _591;
    float _595 = _593;
    if (_555)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_565)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_575)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_581)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _609 = _607;
    float _611 = _353 * _609;
    if (_525)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _613 = _583;
    float _615 = _613;
    if (_535)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _617 = _615;
    float _619 = _611 * _51;
    float _621 = _617;
    if (_545)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _623 = _621;
    float _625 = _623;
    if (_555)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _627 = _625;
    float _629 = floor(_619);
    float _631 = _627;
    if (_565)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_575)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _637 = _635;
    float _639 = _637;
    if (_581)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _641 = _639;
    float _643 = -_629;
    float _645 = _619 + _643;
    float _647 = _325 * _641;
    float _649 = _645 * 2.0;
    float _651 = -_645;
    float _653 = fma(_647, _651, _51);
    float _655 = floor(_649);
    float _657 = _647 * _655;
    float _659 = _657 * 0.5;
    float _661 = _647;
    if (!_90)
    {
        _661 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _663 = _661;
    float _665 = _659 + _653;
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
    float _687 = fma(_122, _122, _685);
    float _689 = _669;
    float _691 = _687;
    if (!_90)
    {
        _126 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _126;
    float _695 = sqrt(_687);
    float _697 = _693;
    if (!_90)
    {
        float _699 = fma(_669, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _689 = _699;
    }
    float _701 = _689;
    float _703 = -_307;
    float _705 = fma(_695, _299, _703);
    float _707 = precise::clamp(_705, 0.0, 1.0);
    float _709 = -_659;
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
    if (!_90)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _717 = _735;
    }
    float _737 = _717;
    if (!_90)
    {
        float2 _2141 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2141, float2(0.0), isnan(_2141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2141, float2(0.0), isnan(_2141)), level(0.0)).x;
        _729 = _739;
    }
    float _741 = _729;
    if (_90)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _691;
    float _745 = _743;
    if (_90)
    {
        _357 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _357;
    float _749 = _747;
    if (_90)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _276 = _751;
    }
    float _753 = _276;
    float _755 = _753;
    if (_90)
    {
        float _757 = fma(_713, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_90)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _755 = _763;
    }
    float _765 = _755;
    if (_90)
    {
        float _767 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _761 = _767;
    }
    float _769 = _761;
    float _771 = _769;
    if (_90)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _749 = _773;
    }
    float _775 = _749;
    if (_90)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_90)
    {
        float2 _2234 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2234, float2(0.0), isnan(_2234)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2234, float2(0.0), isnan(_2234)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _793 = _713 + _791;
    float _795 = _789 * _789;
    float _797 = fma(_793, _793, _795);
    float _799 = sqrt(_797);
    bool _801 = _799 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _803 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _805 = _803 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma(_713, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _809 = _805;
    if (!_801)
    {
        _809 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _811 = _809;
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
    float _815 = _813;
    float _817 = _811;
    if (!_801)
    {
        _104 = _713;
    }
    float _819 = _104;
    float _821 = _813 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _823 = _819;
    float _825 = _821;
    if (!_801)
    {
        _815 = _803;
    }
    float _827 = _815;
    bool _829 = !_801;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _835 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _837 = _799 + _835;
        float _839 = _803 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _841 = rsqrt(_797);
        float _843 = _837 * _833;
        float _845 = _843 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = cos(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 + (-1.0);
        float _857 = _855 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _859 = fma(_853, _839, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _861 = fma(_803, _849, _857);
        float _863 = _841 * _859;
        float _865 = _861 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _867 = fma(_793, _863, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _869 = fma(_789, _863, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _871 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[2].x, _865);
        float _873 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[2].z, _871);
        float _875 = _873 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _831 = _861;
        _823 = _867;
        _817 = _869;
        _825 = _875;
    }
    float _877 = _831;
    float _879 = _823;
    float _881 = _817;
    float _883 = _825;
    float _885 = _877 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _887 = _877 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _889 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[1].x, _885);
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[0].x, _887);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[1].z, _889);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[0].z, _891);
    float _897 = _893 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _899 = _895 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _901 = _897 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _903 = _897 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _905 = _897 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _907 = _897 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _909 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[8].x, _901);
    float _911 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[7].x, _903);
    float _913 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[9].x, _905);
    float _915 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[10].x, _907);
    float _917 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[8].z, _909);
    float _919 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[7].z, _911);
    float _921 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[9].z, _913);
    float _923 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[10].z, _915);
    float _925 = _917 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _927 = _919 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _929 = _921 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _931 = _923 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _927;
    out.gl_Position.y = _925;
    out.gl_Position.z = _929;
    out.gl_Position.w = _931;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

