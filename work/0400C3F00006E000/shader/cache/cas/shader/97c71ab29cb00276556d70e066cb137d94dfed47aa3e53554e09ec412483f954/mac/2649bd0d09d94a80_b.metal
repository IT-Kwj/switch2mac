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
    texture2d_array<float> vp_t_tcb_C [[id(9)]];
    sampler vp_t_tcb_CSmplr [[id(10)]];
    sampler vp_t_tcb_8Smplr_w [[id(11)]];
    sampler vp_t_tcb_ASmplr_w [[id(12)]];
    sampler vp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1019 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_42.x;
    float _69 = in.m_42.y;
    float _71 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _76 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _78 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _80 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _78;
    int _82 = _76 << 4;
    bool _86 = _82 == 0;
    bool _88 = _82 == 16;
    bool _90 = _82 == 32;
    bool _92 = _82 == 48;
    bool _94 = _82 == 64;
    float _96 = fma(_73, _69, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _98 = _82 == 80;
    bool _100 = _67 >= 0.5;
    bool _102 = isnan(_67);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.5);
    bool _108 = _104 || _106;
    float _110 = as_type<float>(gl_BaseInstance);
    float _112 = _67;
    if (_86)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _96 + _116;
    float _120 = fma(_69, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _122 = _82 == 96;
    float _124 = _118 * _118;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _128 = _120 + _126;
    float _130 = 0.0;
    float _132 = _114;
    if (_86)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _134 = _130;
    float _136 = fma(_80, _80, _124);
    float _138 = _134;
    if (_88)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _132;
    bool _142 = _82 == 112;
    float _144 = fma(_128, _128, _136);
    float _146 = _140;
    if (_88)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _138;
    float _150 = _148;
    if (_90)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    float _154 = rsqrt(_144);
    bool _156 = _82 == 128;
    float _158 = _152;
    if (_90)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_92)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _82 == 144;
    float _168 = _164;
    if (_92)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_94)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _82 == 160;
    float _178 = _174;
    if (_94)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _184 = _180;
    if (_98)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _178;
    bool _188 = _82 == 176;
    float _190 = _186;
    if (_98)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _82 == 192;
    float _198 = _192;
    if (_122)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_122)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _198;
    float _206 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _82 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_156)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _82 == 224;
    float _222 = _194 + 1.2999999523162841796875;
    float _224 = _218;
    if (_156)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _216;
    float _228 = _226;
    if (_166)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _224;
    bool _232 = _82 == 240;
    float _234 = trunc(_222);
    int _236 = int(_234);
    float _238 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _240 = _228;
    float _242 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _238;
    bool _246 = _82 == 256;
    float _248 = _244;
    if (_176)
    {
        _242 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _242;
    float _252 = _250;
    if (_188)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _82 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_196)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    int _266 = min(_236, 15);
    bool _268 = _82 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _82 == 304;
    int _278 = _266 << 4;
    int _280 = _278 + 4288;
    float _282 = _272;
    float _284 = as_type<float>(_280);
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _286 = _270;
    float _288 = _286;
    if (_210)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _290 = _282;
    float _292 = -_274;
    float _294 = _292 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _296 = _290;
    if (_220)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _298 = _288;
    int _300 = _280 + 8;
    uint _303 = uint(int(uint(_300) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c14)._m0[int(_305)][_307];
    int _311 = int(_303) + 1;
    uint _313 = uint(int(uint(_311) >> uint(2)));
    int _315 = _311 & 3;
    float _317 = (*spvDescriptorSet0.vp_c14)._m0[int(_313)][_315];
    bool _319 = _82 == 320;
    float _321 = _294 + 1.0;
    float _323 = _298;
    if (_220)
    {
        _296 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _325 = _296;
    float _327 = _325;
    if (_232)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _329 = _323;
    bool _331 = _82 == 336;
    float _333 = exp2(_321);
    float _335 = _329;
    if (_232)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _337 = _327;
    float _339 = _337;
    if (_246)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _341 = _335;
    bool _343 = _82 == 352;
    float _345 = _341;
    if (_246)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _347 = _339;
    float _349 = _347;
    if (_256)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _351 = _345;
    bool _353 = _82 == 368;
    float _355 = _351;
    if (_256)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _357 = _349;
    float _359 = _357;
    if (_268)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _361 = _355;
    float _363 = 1.0 / _333;
    bool _365 = _82 == 384;
    float _367 = _361;
    if (_268)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _369 = _359;
    float _371 = _369;
    if (_276)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _373 = _367;
    bool _375 = _82 == 400;
    float _377 = _373;
    if (_276)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _82 == 416;
    float _383 = _379;
    if (_319)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _385 = _377;
    float _387 = _385;
    if (_319)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _389 = _383;
    float _391 = _389;
    if (_331)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _393 = _387;
    bool _395 = _82 == 432;
    float _397 = _393;
    if (_331)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_343)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _403 = _397;
    bool _405 = _82 == 448;
    float _407 = _403;
    if (_343)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_353)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _413 = _407;
    bool _415 = _82 == 464;
    float _417 = _413;
    if (_353)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _423 = _417;
    bool _425 = _82 == 480;
    float _427 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _429 = _421;
    float _431 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _433 = _427;
    bool _435 = _82 == 496;
    float _437 = _433;
    if (_375)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _439 = _431;
    float _441 = _439;
    if (_381)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _443 = _437;
    bool _445 = _82 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _82 == 528;
    float _453 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _455 = _447;
    float _457 = _455;
    if (_395)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _459 = _453;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _463 = _457;
    bool _465 = _82 == 544;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _473 = _467;
    bool _475 = _82 == 560;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _483 = _477;
    bool _485 = _82 == 576;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _493 = _487;
    bool _495 = _82 == 592;
    float _497 = _493;
    if (_435)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _499 = _491;
    float _501 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _503 = _497;
    bool _505 = _82 == 608;
    float _507 = _503;
    if (_445)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _509 = _501;
    float _511 = _509;
    if (_451)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _513 = _507;
    bool _515 = _82 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _82 == 640;
    float _523 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _525 = _517;
    float _527 = _525;
    if (_465)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _529 = _523;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _533 = _527;
    bool _535 = _82 == 656;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _543 = _537;
    bool _545 = _82 == 672;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _553 = _547;
    bool _555 = _82 == 688;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _563 = _557;
    bool _565 = _82 == 704;
    float _567 = _563;
    if (_505)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _569 = _561;
    float _571 = _569;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _573 = _567;
    bool _575 = _82 == 720;
    float _577 = _573;
    if (_515)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _579 = _571;
    float _581 = _579;
    if (_521)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _583 = _577;
    bool _585 = _82 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _82 == 752;
    float _593 = _589;
    if (_535)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _595 = _587;
    float _597 = _595;
    if (_545)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_555)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_565)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_575)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_585)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _615 = _613;
    float _617 = _615;
    if (_591)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _619 = _617;
    float _621 = _363 * _619;
    if (_535)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _623 = _593;
    float _625 = _623;
    if (_545)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _627 = _625;
    float _629 = _621 * _69;
    float _631 = _627;
    if (_555)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_565)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _637 = _635;
    float _639 = floor(_629);
    float _641 = _637;
    if (_575)
    {
        _641 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _643 = _641;
    float _645 = _643;
    if (_585)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _647 = _645;
    float _649 = _647;
    if (_591)
    {
        _649 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _651 = _649;
    float _653 = _333 * _651;
    float _655 = -_639;
    float _657 = _629 + _655;
    float _659 = _657 * 2.0;
    float _661 = -_657;
    float _663 = fma(_653, _661, _69);
    float _665 = floor(_659);
    float _667 = _653 * _665;
    float _669 = _667 * 0.5;
    float _671 = _669 + _663;
    float _673 = fma(_73, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _673 + _675;
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _681 = _677 * _677;
    float _683 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _685 = _679 + _683;
    float _687 = fma(_80, _80, _681);
    float _689 = fma(_685, _685, _687);
    float _691 = sqrt(_689);
    float _693 = -_317;
    float _695 = fma(_691, _309, _693);
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = -_669;
    float _701 = fma(_699, _697, _671);
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701;
    float _707 = _669;
    float _709 = _689;
    float _711 = _671;
    if (!_108)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _713 = _705;
    float _715 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _719 = _713;
    if (!_108)
    {
        float _721 = fma(_715, _713, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _707 = _721;
    }
    float _723 = _707;
    float _725 = _723;
    if (!_108)
    {
        float _727 = fma(_717, _713, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _709 = _727;
    }
    float _729 = _709;
    float _731 = _729;
    if (!_108)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _725 = _733;
    }
    float _735 = _725;
    if (!_108)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _737;
    }
    float _739 = _731;
    if (!_108)
    {
        float2 _2535 = float2(_735, _739);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2535, float2(0.0), isnan(_2535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2535, float2(0.0), isnan(_2535)), level(0.0)).x;
        _711 = _741;
    }
    float _743 = _711;
    if (_108)
    {
        _284 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _284;
    float _747 = _745;
    if (_108)
    {
        _112 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _749 = _112;
    if (_108)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _719 = _751;
    }
    float _753 = _719;
    float _755 = _753;
    if (_108)
    {
        float _757 = fma(_703, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _747 = _757;
    }
    float _759 = _747;
    float _761 = _759;
    if (_108)
    {
        float _763 = fma(_753, _749, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_108)
    {
        float _769 = fma(_759, _749, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_108)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_108)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _743;
    float _785 = _781;
    if (_108)
    {
        float2 _2629 = float2(_777, _781);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = _703 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _795;
    float _799 = _793 * _793;
    float _801 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _803 = fma(_797, _797, _799);
    float _805 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _807 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _809 = sqrt(_803);
    float _811 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _813 = _809 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _815 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _817 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_813)
    {
        _815 = _703;
    }
    float _819 = _815;
    float _821 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _823 = _819;
    if (!_813)
    {
        _817 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _825 = _817;
    float _827 = _821 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _829 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _827);
    float _831 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[2].z, _829);
    float _833 = _831 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _835 = _831;
    float _837 = _825;
    if (!_813)
    {
        _835 = _821;
    }
    float _839 = _835;
    float _841 = _839;
    if (!_813)
    {
        _785 = _833;
    }
    float _843 = _785;
    bool _845 = !_813;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _853 = _809 + _851;
        float _855 = _821 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _857 = _853 * _849;
        float _859 = rsqrt(_803);
        float _861 = _857 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = sin(_867);
        float _871 = _865 + (-1.0);
        float _873 = fma(_869, _855, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _877 = _859 * _873;
        float _879 = fma(_821, _865, _875);
        float _881 = fma(_797, _877, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _883 = _879 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _885 = fma(_793, _877, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _887 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[2].x, _883);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        float _891 = _889 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _841 = _879;
        _837 = _881;
        _823 = _885;
        _847 = _891;
    }
    float _893 = _841;
    float _895 = _837;
    float _897 = _823;
    float _899 = _847;
    float _901 = _893 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _903 = _893 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _905 = fma(_895, (*spvDescriptorSet0.vp_c4)._m0[1].x, _901);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c4)._m0[0].x, _903);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[1].z, _905);
    float _911 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[0].z, _907);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _915 = _913 != 0;
    float _917 = _909 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _919 = _911 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _921 = _917 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _923 = _917 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _925 = _917 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _927 = _917 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[8].x, _921);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[7].x, _923);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[9].x, _925);
    float _935 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[10].x, _927);
    float _937 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[8].z, _929);
    float _939 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[7].z, _931);
    float _941 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[9].z, _933);
    float _943 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[10].z, _935);
    float _945 = _937 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _949 = _941 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _951 = _943 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _953 = !_915;
    float _955;
    float _957;
    float _959;
    int _961;
    int _963;
    int _965;
    int _967;
    int _969;
    int _971;
    int _973;
    int _975;
    int _977;
    float _979;
    float _981;
    float _983;
    float _985;
    float _987;
    float _989;
    float _991;
    float _993;
    float _995;
    float _997;
    float _999;
    float _1001;
    float _1003;
    float _1005;
    float _1007;
    float _1009;
    float _1011;
    float _1013;
    float _1015;
    float _1017;
    if (!_953)
    {
        _955 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _957 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _959 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1019 = true;
    }
    else
    {
        float _1021 = fma(_703, 6.2500002968590706586837768554688e-05, 0.5);
        float _1023 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _3056 = float3(_1023, _1021, float(0));
        float3 _3060 = select(_3056, float3(0.0), isnan(_3056));
        float4 _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3060.xy, uint(rint(_3060.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3060.xy, uint(rint(_3060.z)), level(0.0)).xyzw;
        float _1028 = _1026.x;
        float _1030 = _1026.y;
        float _1032 = _1026.z;
        float _1034 = _1026.w;
        float3 _3075 = float3(_1023, _1021, float(1));
        float3 _3077 = select(_3075, float3(0.0), isnan(_3075));
        float4 _1036 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3077.xy, uint(rint(_3077.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3077.xy, uint(rint(_3077.z)), level(0.0)).xyzw;
        float _1038 = _1036.x;
        float _1040 = _1036.y;
        float _1042 = _1036.z;
        float _1044 = _1036.w;
        float3 _3092 = float3(_1023, _1021, float(2));
        float3 _3094 = select(_3092, float3(0.0), isnan(_3092));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3094.xy, uint(rint(_3094.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3094.xy, uint(rint(_3094.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3109 = float3(_1023, _1021, float(3));
        float3 _3111 = select(_3109, float3(0.0), isnan(_3109));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3111.xy, uint(rint(_3111.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3111.xy, uint(rint(_3111.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3126 = float3(_1023, _1021, float(4));
        float3 _3128 = select(_3126, float3(0.0), isnan(_3126));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3128.xy, uint(rint(_3128.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3128.xy, uint(rint(_3128.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3143 = float3(_1023, _1021, float(5));
        float3 _3145 = select(_3143, float3(0.0), isnan(_3143));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3145.xy, uint(rint(_3145.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3145.xy, uint(rint(_3145.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3160 = float3(_1023, _1021, float(6));
        float3 _3162 = select(_3160, float3(0.0), isnan(_3160));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3162.xy, uint(rint(_3162.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3162.xy, uint(rint(_3162.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3177 = float3(_1023, _1021, float(7));
        float3 _3179 = select(_3177, float3(0.0), isnan(_3177));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3179.xy, uint(rint(_3179.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3179.xy, uint(rint(_3179.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        _955 = _1058;
        _957 = _1060;
        _959 = _1062;
        _961 = as_type<int>(_1064);
        _963 = as_type<int>(_1068);
        _965 = as_type<int>(_1070);
        _967 = as_type<int>(_1072);
        _969 = as_type<int>(_1074);
        _971 = as_type<int>(_1078);
        _973 = as_type<int>(_1080);
        _975 = as_type<int>(_1082);
        _977 = as_type<int>(_1084);
        _979 = _1090;
        _981 = _1100;
        _983 = _1034;
        _985 = _1038;
        _987 = _1088;
        _989 = _1098;
        _991 = _1040;
        _993 = _1028;
        _995 = _1092;
        _997 = _1102;
        _999 = _1030;
        _1001 = _1032;
        _1003 = _1094;
        _1005 = _1104;
        _1007 = _1042;
        _1009 = _1044;
        _1011 = _1048;
        _1013 = _1050;
        _1015 = _1052;
        _1017 = _1054;
    }
    _1019 = false;
    float _1106 = _955;
    float _1108 = _957;
    float _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    int _1120 = _969;
    int _1122 = _971;
    int _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    float _1130 = _979;
    float _1132 = _981;
    float _1134 = _983;
    float _1136 = _985;
    float _1138 = _987;
    float _1140 = _989;
    float _1142 = _991;
    float _1144 = _993;
    float _1146 = _995;
    float _1148 = _997;
    float _1150 = _999;
    float _1152 = _1001;
    float _1154 = _1003;
    float _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = _1011;
    float _1164 = _1013;
    float _1166 = _1015;
    float _1168 = _1017;
    float _1170 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1172 = _821 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1180 = _703 + _1178;
    out.gl_Position.x = _947;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    float _1182 = _1172 * _1172;
    float _1184 = _1106 * 0.88622701168060302734375;
    float _1186 = _1108 * 0.88622701168060302734375;
    float _1188 = _1110 * 0.88622701168060302734375;
    float _1190 = fma(_1176, _1176, _1182);
    float _1192 = _915 ? as_type<float>(_1112) : 0.0;
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _821;
    out.m_45.z = _703;
    float _1194 = _915 ? as_type<float>(_1114) : 0.0;
    float _1196 = fma(_1180, _1180, _1190);
    float _1198 = _915 ? _1184 : 0.0;
    out.m_47.z = _807;
    out.m_47.w = _811;
    float _1200 = _915 ? _1186 : 0.0;
    float _1202 = _915 ? as_type<float>(_1116) : 0.0;
    float _1204 = rsqrt(_1196);
    float _1206 = _915 ? _1188 : 0.0;
    out.m_49.x = _801;
    out.m_49.y = _805;
    float _1208 = _915 ? as_type<float>(_1118) : 0.0;
    float _1210 = _915 ? as_type<float>(_1120) : 0.0;
    out.m_51.w = _833;
    float _1212 = _915 ? as_type<float>(_1122) : 0.0;
    float _1214 = _915 ? as_type<float>(_1124) : 0.0;
    float _1216 = _915 ? as_type<float>(_1126) : 0.0;
    float _1218 = _915 ? as_type<float>(_1128) : 0.0;
    float _1220 = _1204 * 1.02332699298858642578125;
    float _1222 = _1180 * _1204;
    float _1224 = _1172 * _1220;
    float _1226 = _1222 * (-1.02332699298858642578125);
    float _1228 = _1176 * _1220;
    float _1230 = _1224 * _1130;
    float _1232 = _1224 * _1132;
    float _1234 = _1224 * _1134;
    float _1236 = _1224 * _1136;
    float _1238 = fma(_1138, 0.88622701168060302734375, _1230);
    float _1240 = fma(_1140, 0.88622701168060302734375, _1232);
    float _1242 = _1224 * _1142;
    float _1244 = fma(_1144, 0.88622701168060302734375, _1234);
    float _1246 = fma(_1226, _1146, _1238);
    float _1248 = fma(_1226, _1148, _1240);
    float _1250 = fma(_1150, 0.88622701168060302734375, _1236);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1242);
    float _1254 = fma(_1228, _1154, _1246);
    float _1256 = fma(_1228, _1156, _1248);
    float _1258 = fma(_1192, _1224, _1198);
    float _1260 = fma(_1194, _1224, _1200);
    float _1262 = fma(_1226, _1158, _1244);
    float _1264 = precise::max(0.0, _1254);
    float _1266 = fma(_1226, _1160, _1250);
    float _1268 = precise::max(0.0, _1256);
    float _1270 = fma(_1202, _1224, _1206);
    float _1272 = fma(_1226, _1162, _1252);
    float _1274 = _1264 * 0.31830990314483642578125;
    float _1276 = precise::clamp(_1274, 0.0, 1.0);
    float _1278 = fma(_1208, _1226, _1258);
    float _1280 = _1268 * 0.31830990314483642578125;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = fma(_1210, _1226, _1260);
    float _1286 = fma(_1228, _1164, _1262);
    float _1288 = fma(_1228, _1166, _1266);
    float _1290 = fma(_1212, _1226, _1270);
    float _1292 = fma(_1228, _1168, _1272);
    float _1294 = _1276 * 0.88622701168060302734375;
    float _1296 = -_1282;
    float _1298 = _1296 + 1.0;
    float _1300 = fma(_1214, _1228, _1278);
    float _1302 = fma(_1216, _1228, _1284);
    float _1304 = precise::max(0.0, _1286);
    float _1306 = fma(_1218, _1228, _1290);
    float _1308 = precise::max(0.0, _1288);
    float _1310 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1312 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1282);
    float _1316 = precise::max(0.0, _1292);
    float _1318 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1320 = precise::max(0.0, _1300);
    float _1322 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1310);
    float _1324 = precise::max(0.0, _1302);
    float _1326 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1330 = precise::max(0.0, _1306);
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1318);
    float _1334 = -_833;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1338 = _1334 + _1336;
    float _1340 = fma(_1320, _1328, _1322);
    float _1342 = fma(_1324, _1328, _1326);
    float _1344 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1346 = fma(_1330, _1328, _1332);
    out.m_53.w = _1344;
    out.m_51.x = _1340;
    out.m_51.y = _1342;
    out.m_51.z = _1346;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1019 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_42.x;
    float _69 = in.m_42.y;
    float _71 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _76 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _78 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _80 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _78;
    int _82 = _76 << 4;
    bool _86 = _82 == 0;
    bool _88 = _82 == 16;
    bool _90 = _82 == 32;
    bool _92 = _82 == 48;
    bool _94 = _82 == 64;
    float _96 = fma(_73, _69, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _98 = _82 == 80;
    bool _100 = _67 >= 0.5;
    bool _102 = isnan(_67);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.5);
    bool _108 = _104 || _106;
    float _110 = as_type<float>(gl_BaseInstance);
    float _112 = _67;
    if (_86)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _96 + _116;
    float _120 = fma(_69, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _122 = _82 == 96;
    float _124 = _118 * _118;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _128 = _120 + _126;
    float _130 = 0.0;
    float _132 = _114;
    if (_86)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _134 = _130;
    float _136 = fma(_80, _80, _124);
    float _138 = _134;
    if (_88)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _132;
    bool _142 = _82 == 112;
    float _144 = fma(_128, _128, _136);
    float _146 = _140;
    if (_88)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _138;
    float _150 = _148;
    if (_90)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    float _154 = rsqrt(_144);
    bool _156 = _82 == 128;
    float _158 = _152;
    if (_90)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_92)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _82 == 144;
    float _168 = _164;
    if (_92)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_94)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _82 == 160;
    float _178 = _174;
    if (_94)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _184 = _180;
    if (_98)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _178;
    bool _188 = _82 == 176;
    float _190 = _186;
    if (_98)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _82 == 192;
    float _198 = _192;
    if (_122)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_122)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _198;
    float _206 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _82 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_156)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _82 == 224;
    float _222 = _194 + 1.2999999523162841796875;
    float _224 = _218;
    if (_156)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _216;
    float _228 = _226;
    if (_166)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _224;
    bool _232 = _82 == 240;
    float _234 = trunc(_222);
    int _236 = int(_234);
    float _238 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _240 = _228;
    float _242 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _238;
    bool _246 = _82 == 256;
    float _248 = _244;
    if (_176)
    {
        _242 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _242;
    float _252 = _250;
    if (_188)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _82 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_196)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    int _266 = min(_236, 15);
    bool _268 = _82 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _82 == 304;
    int _278 = _266 << 4;
    int _280 = _278 + 4288;
    float _282 = _272;
    float _284 = as_type<float>(_280);
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _286 = _270;
    float _288 = _286;
    if (_210)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _290 = _282;
    float _292 = -_274;
    float _294 = _292 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _296 = _290;
    if (_220)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _298 = _288;
    int _300 = _280 + 8;
    uint _303 = uint(int(uint(_300) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c14)._m0[int(_305)][_307];
    int _311 = int(_303) + 1;
    uint _313 = uint(int(uint(_311) >> uint(2)));
    int _315 = _311 & 3;
    float _317 = (*spvDescriptorSet0.vp_c14)._m0[int(_313)][_315];
    bool _319 = _82 == 320;
    float _321 = _294 + 1.0;
    float _323 = _298;
    if (_220)
    {
        _296 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _325 = _296;
    float _327 = _325;
    if (_232)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _329 = _323;
    bool _331 = _82 == 336;
    float _333 = exp2(_321);
    float _335 = _329;
    if (_232)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _337 = _327;
    float _339 = _337;
    if (_246)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _341 = _335;
    bool _343 = _82 == 352;
    float _345 = _341;
    if (_246)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _347 = _339;
    float _349 = _347;
    if (_256)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _351 = _345;
    bool _353 = _82 == 368;
    float _355 = _351;
    if (_256)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _357 = _349;
    float _359 = _357;
    if (_268)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _361 = _355;
    float _363 = 1.0 / _333;
    bool _365 = _82 == 384;
    float _367 = _361;
    if (_268)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _369 = _359;
    float _371 = _369;
    if (_276)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _373 = _367;
    bool _375 = _82 == 400;
    float _377 = _373;
    if (_276)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _82 == 416;
    float _383 = _379;
    if (_319)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _385 = _377;
    float _387 = _385;
    if (_319)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _389 = _383;
    float _391 = _389;
    if (_331)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _393 = _387;
    bool _395 = _82 == 432;
    float _397 = _393;
    if (_331)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_343)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _403 = _397;
    bool _405 = _82 == 448;
    float _407 = _403;
    if (_343)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_353)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _413 = _407;
    bool _415 = _82 == 464;
    float _417 = _413;
    if (_353)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _423 = _417;
    bool _425 = _82 == 480;
    float _427 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _429 = _421;
    float _431 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _433 = _427;
    bool _435 = _82 == 496;
    float _437 = _433;
    if (_375)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _439 = _431;
    float _441 = _439;
    if (_381)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _443 = _437;
    bool _445 = _82 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _82 == 528;
    float _453 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _455 = _447;
    float _457 = _455;
    if (_395)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _459 = _453;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _463 = _457;
    bool _465 = _82 == 544;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _473 = _467;
    bool _475 = _82 == 560;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _483 = _477;
    bool _485 = _82 == 576;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _493 = _487;
    bool _495 = _82 == 592;
    float _497 = _493;
    if (_435)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _499 = _491;
    float _501 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _503 = _497;
    bool _505 = _82 == 608;
    float _507 = _503;
    if (_445)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _509 = _501;
    float _511 = _509;
    if (_451)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _513 = _507;
    bool _515 = _82 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _82 == 640;
    float _523 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _525 = _517;
    float _527 = _525;
    if (_465)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _529 = _523;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _533 = _527;
    bool _535 = _82 == 656;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _543 = _537;
    bool _545 = _82 == 672;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _553 = _547;
    bool _555 = _82 == 688;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _563 = _557;
    bool _565 = _82 == 704;
    float _567 = _563;
    if (_505)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _569 = _561;
    float _571 = _569;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _573 = _567;
    bool _575 = _82 == 720;
    float _577 = _573;
    if (_515)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _579 = _571;
    float _581 = _579;
    if (_521)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _583 = _577;
    bool _585 = _82 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _82 == 752;
    float _593 = _589;
    if (_535)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _595 = _587;
    float _597 = _595;
    if (_545)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_555)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_565)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_575)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_585)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _615 = _613;
    float _617 = _615;
    if (_591)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _619 = _617;
    float _621 = _363 * _619;
    if (_535)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _623 = _593;
    float _625 = _623;
    if (_545)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _627 = _625;
    float _629 = _621 * _69;
    float _631 = _627;
    if (_555)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_565)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _637 = _635;
    float _639 = floor(_629);
    float _641 = _637;
    if (_575)
    {
        _641 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _643 = _641;
    float _645 = _643;
    if (_585)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _647 = _645;
    float _649 = _647;
    if (_591)
    {
        _649 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _651 = _649;
    float _653 = _333 * _651;
    float _655 = -_639;
    float _657 = _629 + _655;
    float _659 = _657 * 2.0;
    float _661 = -_657;
    float _663 = fma(_653, _661, _69);
    float _665 = floor(_659);
    float _667 = _653 * _665;
    float _669 = _667 * 0.5;
    float _671 = _669 + _663;
    float _673 = fma(_73, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _673 + _675;
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _681 = _677 * _677;
    float _683 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _685 = _679 + _683;
    float _687 = fma(_80, _80, _681);
    float _689 = fma(_685, _685, _687);
    float _691 = sqrt(_689);
    float _693 = -_317;
    float _695 = fma(_691, _309, _693);
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = -_669;
    float _701 = fma(_699, _697, _671);
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701;
    float _707 = _669;
    float _709 = _689;
    float _711 = _671;
    if (!_108)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _713 = _705;
    float _715 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _719 = _713;
    if (!_108)
    {
        float _721 = fma(_715, _713, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _707 = _721;
    }
    float _723 = _707;
    float _725 = _723;
    if (!_108)
    {
        float _727 = fma(_717, _713, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _709 = _727;
    }
    float _729 = _709;
    float _731 = _729;
    if (!_108)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _725 = _733;
    }
    float _735 = _725;
    if (!_108)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _737;
    }
    float _739 = _731;
    if (!_108)
    {
        float2 _2535 = float2(_735, _739);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2535, float2(0.0), isnan(_2535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2535, float2(0.0), isnan(_2535)), level(0.0)).x;
        _711 = _741;
    }
    float _743 = _711;
    if (_108)
    {
        _284 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _284;
    float _747 = _745;
    if (_108)
    {
        _112 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _749 = _112;
    if (_108)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _719 = _751;
    }
    float _753 = _719;
    float _755 = _753;
    if (_108)
    {
        float _757 = fma(_703, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _747 = _757;
    }
    float _759 = _747;
    float _761 = _759;
    if (_108)
    {
        float _763 = fma(_753, _749, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_108)
    {
        float _769 = fma(_759, _749, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_108)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_108)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _743;
    float _785 = _781;
    if (_108)
    {
        float2 _2629 = float2(_777, _781);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = _703 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _795;
    float _799 = _793 * _793;
    float _801 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _803 = fma(_797, _797, _799);
    float _805 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _807 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _809 = sqrt(_803);
    float _811 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _813 = _809 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _815 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _817 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_813)
    {
        _815 = _703;
    }
    float _819 = _815;
    float _821 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _823 = _819;
    if (!_813)
    {
        _817 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _825 = _817;
    float _827 = _821 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _829 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _827);
    float _831 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[2].z, _829);
    float _833 = _831 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _835 = _831;
    float _837 = _825;
    if (!_813)
    {
        _835 = _821;
    }
    float _839 = _835;
    float _841 = _839;
    if (!_813)
    {
        _785 = _833;
    }
    float _843 = _785;
    bool _845 = !_813;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _853 = _809 + _851;
        float _855 = _821 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _857 = _853 * _849;
        float _859 = rsqrt(_803);
        float _861 = _857 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = sin(_867);
        float _871 = _865 + (-1.0);
        float _873 = fma(_869, _855, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _877 = _859 * _873;
        float _879 = fma(_821, _865, _875);
        float _881 = fma(_797, _877, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _883 = _879 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _885 = fma(_793, _877, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _887 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[2].x, _883);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        float _891 = _889 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _841 = _879;
        _837 = _881;
        _823 = _885;
        _847 = _891;
    }
    float _893 = _841;
    float _895 = _837;
    float _897 = _823;
    float _899 = _847;
    float _901 = _893 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _903 = _893 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _905 = fma(_895, (*spvDescriptorSet0.vp_c4)._m0[1].x, _901);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c4)._m0[0].x, _903);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[1].z, _905);
    float _911 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[0].z, _907);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _915 = _913 != 0;
    float _917 = _909 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _919 = _911 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _921 = _917 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _923 = _917 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _925 = _917 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _927 = _917 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[8].x, _921);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[7].x, _923);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[9].x, _925);
    float _935 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[10].x, _927);
    float _937 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[8].z, _929);
    float _939 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[7].z, _931);
    float _941 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[9].z, _933);
    float _943 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[10].z, _935);
    float _945 = _937 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _949 = _941 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _951 = _943 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _953 = !_915;
    float _955;
    float _957;
    float _959;
    int _961;
    int _963;
    int _965;
    int _967;
    int _969;
    int _971;
    int _973;
    int _975;
    int _977;
    float _979;
    float _981;
    float _983;
    float _985;
    float _987;
    float _989;
    float _991;
    float _993;
    float _995;
    float _997;
    float _999;
    float _1001;
    float _1003;
    float _1005;
    float _1007;
    float _1009;
    float _1011;
    float _1013;
    float _1015;
    float _1017;
    if (!_953)
    {
        _955 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _957 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _959 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1019 = true;
    }
    else
    {
        float _1021 = fma(_703, 6.2500002968590706586837768554688e-05, 0.5);
        float _1023 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _3056 = float3(_1023, _1021, float(0));
        float3 _3060 = select(_3056, float3(0.0), isnan(_3056));
        float4 _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3060.xy, uint(rint(_3060.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3060.xy, uint(rint(_3060.z)), level(0.0)).xyzw;
        float _1028 = _1026.x;
        float _1030 = _1026.y;
        float _1032 = _1026.z;
        float _1034 = _1026.w;
        float3 _3075 = float3(_1023, _1021, float(1));
        float3 _3077 = select(_3075, float3(0.0), isnan(_3075));
        float4 _1036 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3077.xy, uint(rint(_3077.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3077.xy, uint(rint(_3077.z)), level(0.0)).xyzw;
        float _1038 = _1036.x;
        float _1040 = _1036.y;
        float _1042 = _1036.z;
        float _1044 = _1036.w;
        float3 _3092 = float3(_1023, _1021, float(2));
        float3 _3094 = select(_3092, float3(0.0), isnan(_3092));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3094.xy, uint(rint(_3094.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3094.xy, uint(rint(_3094.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3109 = float3(_1023, _1021, float(3));
        float3 _3111 = select(_3109, float3(0.0), isnan(_3109));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3111.xy, uint(rint(_3111.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3111.xy, uint(rint(_3111.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3126 = float3(_1023, _1021, float(4));
        float3 _3128 = select(_3126, float3(0.0), isnan(_3126));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3128.xy, uint(rint(_3128.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3128.xy, uint(rint(_3128.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3143 = float3(_1023, _1021, float(5));
        float3 _3145 = select(_3143, float3(0.0), isnan(_3143));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3145.xy, uint(rint(_3145.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3145.xy, uint(rint(_3145.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3160 = float3(_1023, _1021, float(6));
        float3 _3162 = select(_3160, float3(0.0), isnan(_3160));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3162.xy, uint(rint(_3162.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3162.xy, uint(rint(_3162.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3177 = float3(_1023, _1021, float(7));
        float3 _3179 = select(_3177, float3(0.0), isnan(_3177));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3179.xy, uint(rint(_3179.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3179.xy, uint(rint(_3179.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        _955 = _1058;
        _957 = _1060;
        _959 = _1062;
        _961 = as_type<int>(_1064);
        _963 = as_type<int>(_1068);
        _965 = as_type<int>(_1070);
        _967 = as_type<int>(_1072);
        _969 = as_type<int>(_1074);
        _971 = as_type<int>(_1078);
        _973 = as_type<int>(_1080);
        _975 = as_type<int>(_1082);
        _977 = as_type<int>(_1084);
        _979 = _1090;
        _981 = _1100;
        _983 = _1034;
        _985 = _1038;
        _987 = _1088;
        _989 = _1098;
        _991 = _1040;
        _993 = _1028;
        _995 = _1092;
        _997 = _1102;
        _999 = _1030;
        _1001 = _1032;
        _1003 = _1094;
        _1005 = _1104;
        _1007 = _1042;
        _1009 = _1044;
        _1011 = _1048;
        _1013 = _1050;
        _1015 = _1052;
        _1017 = _1054;
    }
    _1019 = false;
    float _1106 = _955;
    float _1108 = _957;
    float _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    int _1120 = _969;
    int _1122 = _971;
    int _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    float _1130 = _979;
    float _1132 = _981;
    float _1134 = _983;
    float _1136 = _985;
    float _1138 = _987;
    float _1140 = _989;
    float _1142 = _991;
    float _1144 = _993;
    float _1146 = _995;
    float _1148 = _997;
    float _1150 = _999;
    float _1152 = _1001;
    float _1154 = _1003;
    float _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = _1011;
    float _1164 = _1013;
    float _1166 = _1015;
    float _1168 = _1017;
    float _1170 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1172 = _821 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1180 = _703 + _1178;
    out.gl_Position.x = _947;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    float _1182 = _1172 * _1172;
    float _1184 = _1106 * 0.88622701168060302734375;
    float _1186 = _1108 * 0.88622701168060302734375;
    float _1188 = _1110 * 0.88622701168060302734375;
    float _1190 = fma(_1176, _1176, _1182);
    float _1192 = _915 ? as_type<float>(_1112) : 0.0;
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _821;
    out.m_45.z = _703;
    float _1194 = _915 ? as_type<float>(_1114) : 0.0;
    float _1196 = fma(_1180, _1180, _1190);
    float _1198 = _915 ? _1184 : 0.0;
    out.m_47.z = _807;
    out.m_47.w = _811;
    float _1200 = _915 ? _1186 : 0.0;
    float _1202 = _915 ? as_type<float>(_1116) : 0.0;
    float _1204 = rsqrt(_1196);
    float _1206 = _915 ? _1188 : 0.0;
    out.m_49.x = _801;
    out.m_49.y = _805;
    float _1208 = _915 ? as_type<float>(_1118) : 0.0;
    float _1210 = _915 ? as_type<float>(_1120) : 0.0;
    out.m_51.w = _833;
    float _1212 = _915 ? as_type<float>(_1122) : 0.0;
    float _1214 = _915 ? as_type<float>(_1124) : 0.0;
    float _1216 = _915 ? as_type<float>(_1126) : 0.0;
    float _1218 = _915 ? as_type<float>(_1128) : 0.0;
    float _1220 = _1204 * 1.02332699298858642578125;
    float _1222 = _1180 * _1204;
    float _1224 = _1172 * _1220;
    float _1226 = _1222 * (-1.02332699298858642578125);
    float _1228 = _1176 * _1220;
    float _1230 = _1224 * _1130;
    float _1232 = _1224 * _1132;
    float _1234 = _1224 * _1134;
    float _1236 = _1224 * _1136;
    float _1238 = fma(_1138, 0.88622701168060302734375, _1230);
    float _1240 = fma(_1140, 0.88622701168060302734375, _1232);
    float _1242 = _1224 * _1142;
    float _1244 = fma(_1144, 0.88622701168060302734375, _1234);
    float _1246 = fma(_1226, _1146, _1238);
    float _1248 = fma(_1226, _1148, _1240);
    float _1250 = fma(_1150, 0.88622701168060302734375, _1236);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1242);
    float _1254 = fma(_1228, _1154, _1246);
    float _1256 = fma(_1228, _1156, _1248);
    float _1258 = fma(_1192, _1224, _1198);
    float _1260 = fma(_1194, _1224, _1200);
    float _1262 = fma(_1226, _1158, _1244);
    float _1264 = precise::max(0.0, _1254);
    float _1266 = fma(_1226, _1160, _1250);
    float _1268 = precise::max(0.0, _1256);
    float _1270 = fma(_1202, _1224, _1206);
    float _1272 = fma(_1226, _1162, _1252);
    float _1274 = _1264 * 0.31830990314483642578125;
    float _1276 = precise::clamp(_1274, 0.0, 1.0);
    float _1278 = fma(_1208, _1226, _1258);
    float _1280 = _1268 * 0.31830990314483642578125;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = fma(_1210, _1226, _1260);
    float _1286 = fma(_1228, _1164, _1262);
    float _1288 = fma(_1228, _1166, _1266);
    float _1290 = fma(_1212, _1226, _1270);
    float _1292 = fma(_1228, _1168, _1272);
    float _1294 = _1276 * 0.88622701168060302734375;
    float _1296 = -_1282;
    float _1298 = _1296 + 1.0;
    float _1300 = fma(_1214, _1228, _1278);
    float _1302 = fma(_1216, _1228, _1284);
    float _1304 = precise::max(0.0, _1286);
    float _1306 = fma(_1218, _1228, _1290);
    float _1308 = precise::max(0.0, _1288);
    float _1310 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1312 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1282);
    float _1316 = precise::max(0.0, _1292);
    float _1318 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1320 = precise::max(0.0, _1300);
    float _1322 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1310);
    float _1324 = precise::max(0.0, _1302);
    float _1326 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1330 = precise::max(0.0, _1306);
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1318);
    float _1334 = -_833;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1338 = _1334 + _1336;
    float _1340 = fma(_1320, _1328, _1322);
    float _1342 = fma(_1324, _1328, _1326);
    float _1344 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1346 = fma(_1330, _1328, _1332);
    out.m_53.w = _1344;
    out.m_51.x = _1340;
    out.m_51.y = _1342;
    out.m_51.z = _1346;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1019 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_42.x;
    float _69 = in.m_42.y;
    float _71 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _76 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _78 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _80 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _78;
    int _82 = _76 << 4;
    bool _86 = _82 == 0;
    bool _88 = _82 == 16;
    bool _90 = _82 == 32;
    bool _92 = _82 == 48;
    bool _94 = _82 == 64;
    float _96 = fma(_73, _69, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _98 = _82 == 80;
    bool _100 = _67 >= 0.5;
    bool _102 = isnan(_67);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.5);
    bool _108 = _104 || _106;
    float _110 = as_type<float>(gl_BaseInstance);
    float _112 = _67;
    if (_86)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _96 + _116;
    float _120 = fma(_69, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _122 = _82 == 96;
    float _124 = _118 * _118;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _128 = _120 + _126;
    float _130 = 0.0;
    float _132 = _114;
    if (_86)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _134 = _130;
    float _136 = fma(_80, _80, _124);
    float _138 = _134;
    if (_88)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _132;
    bool _142 = _82 == 112;
    float _144 = fma(_128, _128, _136);
    float _146 = _140;
    if (_88)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _138;
    float _150 = _148;
    if (_90)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    float _154 = rsqrt(_144);
    bool _156 = _82 == 128;
    float _158 = _152;
    if (_90)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_92)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _82 == 144;
    float _168 = _164;
    if (_92)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_94)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _82 == 160;
    float _178 = _174;
    if (_94)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _184 = _180;
    if (_98)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _178;
    bool _188 = _82 == 176;
    float _190 = _186;
    if (_98)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _82 == 192;
    float _198 = _192;
    if (_122)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_122)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _198;
    float _206 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _82 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_156)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _82 == 224;
    float _222 = _194 + 1.2999999523162841796875;
    float _224 = _218;
    if (_156)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _216;
    float _228 = _226;
    if (_166)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _224;
    bool _232 = _82 == 240;
    float _234 = trunc(_222);
    int _236 = int(_234);
    float _238 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _240 = _228;
    float _242 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _238;
    bool _246 = _82 == 256;
    float _248 = _244;
    if (_176)
    {
        _242 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _242;
    float _252 = _250;
    if (_188)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _82 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_196)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    int _266 = min(_236, 15);
    bool _268 = _82 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _82 == 304;
    int _278 = _266 << 4;
    int _280 = _278 + 4288;
    float _282 = _272;
    float _284 = as_type<float>(_280);
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _286 = _270;
    float _288 = _286;
    if (_210)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _290 = _282;
    float _292 = -_274;
    float _294 = _292 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _296 = _290;
    if (_220)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _298 = _288;
    int _300 = _280 + 8;
    uint _303 = uint(int(uint(_300) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c14)._m0[int(_305)][_307];
    int _311 = int(_303) + 1;
    uint _313 = uint(int(uint(_311) >> uint(2)));
    int _315 = _311 & 3;
    float _317 = (*spvDescriptorSet0.vp_c14)._m0[int(_313)][_315];
    bool _319 = _82 == 320;
    float _321 = _294 + 1.0;
    float _323 = _298;
    if (_220)
    {
        _296 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _325 = _296;
    float _327 = _325;
    if (_232)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _329 = _323;
    bool _331 = _82 == 336;
    float _333 = exp2(_321);
    float _335 = _329;
    if (_232)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _337 = _327;
    float _339 = _337;
    if (_246)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _341 = _335;
    bool _343 = _82 == 352;
    float _345 = _341;
    if (_246)
    {
        _339 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _347 = _339;
    float _349 = _347;
    if (_256)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _351 = _345;
    bool _353 = _82 == 368;
    float _355 = _351;
    if (_256)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _357 = _349;
    float _359 = _357;
    if (_268)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _361 = _355;
    float _363 = 1.0 / _333;
    bool _365 = _82 == 384;
    float _367 = _361;
    if (_268)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _369 = _359;
    float _371 = _369;
    if (_276)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _373 = _367;
    bool _375 = _82 == 400;
    float _377 = _373;
    if (_276)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _82 == 416;
    float _383 = _379;
    if (_319)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _385 = _377;
    float _387 = _385;
    if (_319)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _389 = _383;
    float _391 = _389;
    if (_331)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _393 = _387;
    bool _395 = _82 == 432;
    float _397 = _393;
    if (_331)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_343)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _403 = _397;
    bool _405 = _82 == 448;
    float _407 = _403;
    if (_343)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_353)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _413 = _407;
    bool _415 = _82 == 464;
    float _417 = _413;
    if (_353)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _423 = _417;
    bool _425 = _82 == 480;
    float _427 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _429 = _421;
    float _431 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _433 = _427;
    bool _435 = _82 == 496;
    float _437 = _433;
    if (_375)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _439 = _431;
    float _441 = _439;
    if (_381)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _443 = _437;
    bool _445 = _82 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _82 == 528;
    float _453 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _455 = _447;
    float _457 = _455;
    if (_395)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _459 = _453;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _463 = _457;
    bool _465 = _82 == 544;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _473 = _467;
    bool _475 = _82 == 560;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_425)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _483 = _477;
    bool _485 = _82 == 576;
    float _487 = _483;
    if (_425)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _489 = _481;
    float _491 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _493 = _487;
    bool _495 = _82 == 592;
    float _497 = _493;
    if (_435)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _499 = _491;
    float _501 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _503 = _497;
    bool _505 = _82 == 608;
    float _507 = _503;
    if (_445)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _509 = _501;
    float _511 = _509;
    if (_451)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _513 = _507;
    bool _515 = _82 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _82 == 640;
    float _523 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _525 = _517;
    float _527 = _525;
    if (_465)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _529 = _523;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _533 = _527;
    bool _535 = _82 == 656;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _543 = _537;
    bool _545 = _82 == 672;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_495)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _553 = _547;
    bool _555 = _82 == 688;
    float _557 = _553;
    if (_495)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _559 = _551;
    float _561 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _563 = _557;
    bool _565 = _82 == 704;
    float _567 = _563;
    if (_505)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _569 = _561;
    float _571 = _569;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _573 = _567;
    bool _575 = _82 == 720;
    float _577 = _573;
    if (_515)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _579 = _571;
    float _581 = _579;
    if (_521)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _583 = _577;
    bool _585 = _82 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _82 == 752;
    float _593 = _589;
    if (_535)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _595 = _587;
    float _597 = _595;
    if (_545)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_555)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_565)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_575)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_585)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _615 = _613;
    float _617 = _615;
    if (_591)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _619 = _617;
    float _621 = _363 * _619;
    if (_535)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _623 = _593;
    float _625 = _623;
    if (_545)
    {
        _625 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _627 = _625;
    float _629 = _621 * _69;
    float _631 = _627;
    if (_555)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_565)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _637 = _635;
    float _639 = floor(_629);
    float _641 = _637;
    if (_575)
    {
        _641 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _643 = _641;
    float _645 = _643;
    if (_585)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _647 = _645;
    float _649 = _647;
    if (_591)
    {
        _649 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _651 = _649;
    float _653 = _333 * _651;
    float _655 = -_639;
    float _657 = _629 + _655;
    float _659 = _657 * 2.0;
    float _661 = -_657;
    float _663 = fma(_653, _661, _69);
    float _665 = floor(_659);
    float _667 = _653 * _665;
    float _669 = _667 * 0.5;
    float _671 = _669 + _663;
    float _673 = fma(_73, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _673 + _675;
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _681 = _677 * _677;
    float _683 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _685 = _679 + _683;
    float _687 = fma(_80, _80, _681);
    float _689 = fma(_685, _685, _687);
    float _691 = sqrt(_689);
    float _693 = -_317;
    float _695 = fma(_691, _309, _693);
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = -_669;
    float _701 = fma(_699, _697, _671);
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701;
    float _707 = _669;
    float _709 = _689;
    float _711 = _671;
    if (!_108)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _713 = _705;
    float _715 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _719 = _713;
    if (!_108)
    {
        float _721 = fma(_715, _713, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _707 = _721;
    }
    float _723 = _707;
    float _725 = _723;
    if (!_108)
    {
        float _727 = fma(_717, _713, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _709 = _727;
    }
    float _729 = _709;
    float _731 = _729;
    if (!_108)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _725 = _733;
    }
    float _735 = _725;
    if (!_108)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _737;
    }
    float _739 = _731;
    if (!_108)
    {
        float2 _2535 = float2(_735, _739);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2535, float2(0.0), isnan(_2535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2535, float2(0.0), isnan(_2535)), level(0.0)).x;
        _711 = _741;
    }
    float _743 = _711;
    if (_108)
    {
        _284 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _284;
    float _747 = _745;
    if (_108)
    {
        _112 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _749 = _112;
    if (_108)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _719 = _751;
    }
    float _753 = _719;
    float _755 = _753;
    if (_108)
    {
        float _757 = fma(_703, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _747 = _757;
    }
    float _759 = _747;
    float _761 = _759;
    if (_108)
    {
        float _763 = fma(_753, _749, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_108)
    {
        float _769 = fma(_759, _749, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_108)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_108)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _743;
    float _785 = _781;
    if (_108)
    {
        float2 _2629 = float2(_777, _781);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2629, float2(0.0), isnan(_2629)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2629, float2(0.0), isnan(_2629)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = _703 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _795;
    float _799 = _793 * _793;
    float _801 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _803 = fma(_797, _797, _799);
    float _805 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _807 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _809 = sqrt(_803);
    float _811 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _813 = _809 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _815 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _817 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_813)
    {
        _815 = _703;
    }
    float _819 = _815;
    float _821 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _823 = _819;
    if (!_813)
    {
        _817 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _825 = _817;
    float _827 = _821 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _829 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _827);
    float _831 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[2].z, _829);
    float _833 = _831 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _835 = _831;
    float _837 = _825;
    if (!_813)
    {
        _835 = _821;
    }
    float _839 = _835;
    float _841 = _839;
    if (!_813)
    {
        _785 = _833;
    }
    float _843 = _785;
    bool _845 = !_813;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _853 = _809 + _851;
        float _855 = _821 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _857 = _853 * _849;
        float _859 = rsqrt(_803);
        float _861 = _857 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = sin(_867);
        float _871 = _865 + (-1.0);
        float _873 = fma(_869, _855, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _877 = _859 * _873;
        float _879 = fma(_821, _865, _875);
        float _881 = fma(_797, _877, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _883 = _879 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _885 = fma(_793, _877, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _887 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[2].x, _883);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        float _891 = _889 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _841 = _879;
        _837 = _881;
        _823 = _885;
        _847 = _891;
    }
    float _893 = _841;
    float _895 = _837;
    float _897 = _823;
    float _899 = _847;
    float _901 = _893 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _903 = _893 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _905 = fma(_895, (*spvDescriptorSet0.vp_c4)._m0[1].x, _901);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c4)._m0[0].x, _903);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[1].z, _905);
    float _911 = fma(_897, (*spvDescriptorSet0.vp_c4)._m0[0].z, _907);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _915 = _913 != 0;
    float _917 = _909 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _919 = _911 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _921 = _917 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _923 = _917 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _925 = _917 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _927 = _917 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[8].x, _921);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[7].x, _923);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[9].x, _925);
    float _935 = fma(_919, (*spvDescriptorSet0.vp_c4)._m0[10].x, _927);
    float _937 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[8].z, _929);
    float _939 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[7].z, _931);
    float _941 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[9].z, _933);
    float _943 = fma(_899, (*spvDescriptorSet0.vp_c4)._m0[10].z, _935);
    float _945 = _937 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _949 = _941 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _951 = _943 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _953 = !_915;
    float _955;
    float _957;
    float _959;
    int _961;
    int _963;
    int _965;
    int _967;
    int _969;
    int _971;
    int _973;
    int _975;
    int _977;
    float _979;
    float _981;
    float _983;
    float _985;
    float _987;
    float _989;
    float _991;
    float _993;
    float _995;
    float _997;
    float _999;
    float _1001;
    float _1003;
    float _1005;
    float _1007;
    float _1009;
    float _1011;
    float _1013;
    float _1015;
    float _1017;
    if (!_953)
    {
        _955 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _957 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _959 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1019 = true;
    }
    else
    {
        float _1021 = fma(_703, 6.2500002968590706586837768554688e-05, 0.5);
        float _1023 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _3056 = float3(_1023, _1021, float(0));
        float3 _3060 = select(_3056, float3(0.0), isnan(_3056));
        float4 _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3060.xy, uint(rint(_3060.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3060.xy, uint(rint(_3060.z)), level(0.0)).xyzw;
        float _1028 = _1026.x;
        float _1030 = _1026.y;
        float _1032 = _1026.z;
        float _1034 = _1026.w;
        float3 _3075 = float3(_1023, _1021, float(1));
        float3 _3077 = select(_3075, float3(0.0), isnan(_3075));
        float4 _1036 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3077.xy, uint(rint(_3077.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3077.xy, uint(rint(_3077.z)), level(0.0)).xyzw;
        float _1038 = _1036.x;
        float _1040 = _1036.y;
        float _1042 = _1036.z;
        float _1044 = _1036.w;
        float3 _3092 = float3(_1023, _1021, float(2));
        float3 _3094 = select(_3092, float3(0.0), isnan(_3092));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3094.xy, uint(rint(_3094.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3094.xy, uint(rint(_3094.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3109 = float3(_1023, _1021, float(3));
        float3 _3111 = select(_3109, float3(0.0), isnan(_3109));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3111.xy, uint(rint(_3111.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3111.xy, uint(rint(_3111.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3126 = float3(_1023, _1021, float(4));
        float3 _3128 = select(_3126, float3(0.0), isnan(_3126));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3128.xy, uint(rint(_3128.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3128.xy, uint(rint(_3128.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3143 = float3(_1023, _1021, float(5));
        float3 _3145 = select(_3143, float3(0.0), isnan(_3143));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3145.xy, uint(rint(_3145.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3145.xy, uint(rint(_3145.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3160 = float3(_1023, _1021, float(6));
        float3 _3162 = select(_3160, float3(0.0), isnan(_3160));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3162.xy, uint(rint(_3162.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3162.xy, uint(rint(_3162.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3177 = float3(_1023, _1021, float(7));
        float3 _3179 = select(_3177, float3(0.0), isnan(_3177));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3179.xy, uint(rint(_3179.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3179.xy, uint(rint(_3179.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        _955 = _1058;
        _957 = _1060;
        _959 = _1062;
        _961 = as_type<int>(_1064);
        _963 = as_type<int>(_1068);
        _965 = as_type<int>(_1070);
        _967 = as_type<int>(_1072);
        _969 = as_type<int>(_1074);
        _971 = as_type<int>(_1078);
        _973 = as_type<int>(_1080);
        _975 = as_type<int>(_1082);
        _977 = as_type<int>(_1084);
        _979 = _1090;
        _981 = _1100;
        _983 = _1034;
        _985 = _1038;
        _987 = _1088;
        _989 = _1098;
        _991 = _1040;
        _993 = _1028;
        _995 = _1092;
        _997 = _1102;
        _999 = _1030;
        _1001 = _1032;
        _1003 = _1094;
        _1005 = _1104;
        _1007 = _1042;
        _1009 = _1044;
        _1011 = _1048;
        _1013 = _1050;
        _1015 = _1052;
        _1017 = _1054;
    }
    _1019 = false;
    float _1106 = _955;
    float _1108 = _957;
    float _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    int _1120 = _969;
    int _1122 = _971;
    int _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    float _1130 = _979;
    float _1132 = _981;
    float _1134 = _983;
    float _1136 = _985;
    float _1138 = _987;
    float _1140 = _989;
    float _1142 = _991;
    float _1144 = _993;
    float _1146 = _995;
    float _1148 = _997;
    float _1150 = _999;
    float _1152 = _1001;
    float _1154 = _1003;
    float _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = _1011;
    float _1164 = _1013;
    float _1166 = _1015;
    float _1168 = _1017;
    float _1170 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1172 = _821 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1180 = _703 + _1178;
    out.gl_Position.x = _947;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    float _1182 = _1172 * _1172;
    float _1184 = _1106 * 0.88622701168060302734375;
    float _1186 = _1108 * 0.88622701168060302734375;
    float _1188 = _1110 * 0.88622701168060302734375;
    float _1190 = fma(_1176, _1176, _1182);
    float _1192 = _915 ? as_type<float>(_1112) : 0.0;
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _821;
    out.m_45.z = _703;
    float _1194 = _915 ? as_type<float>(_1114) : 0.0;
    float _1196 = fma(_1180, _1180, _1190);
    float _1198 = _915 ? _1184 : 0.0;
    out.m_47.z = _807;
    out.m_47.w = _811;
    float _1200 = _915 ? _1186 : 0.0;
    float _1202 = _915 ? as_type<float>(_1116) : 0.0;
    float _1204 = rsqrt(_1196);
    float _1206 = _915 ? _1188 : 0.0;
    out.m_49.x = _801;
    out.m_49.y = _805;
    float _1208 = _915 ? as_type<float>(_1118) : 0.0;
    float _1210 = _915 ? as_type<float>(_1120) : 0.0;
    out.m_51.w = _833;
    float _1212 = _915 ? as_type<float>(_1122) : 0.0;
    float _1214 = _915 ? as_type<float>(_1124) : 0.0;
    float _1216 = _915 ? as_type<float>(_1126) : 0.0;
    float _1218 = _915 ? as_type<float>(_1128) : 0.0;
    float _1220 = _1204 * 1.02332699298858642578125;
    float _1222 = _1180 * _1204;
    float _1224 = _1172 * _1220;
    float _1226 = _1222 * (-1.02332699298858642578125);
    float _1228 = _1176 * _1220;
    float _1230 = _1224 * _1130;
    float _1232 = _1224 * _1132;
    float _1234 = _1224 * _1134;
    float _1236 = _1224 * _1136;
    float _1238 = fma(_1138, 0.88622701168060302734375, _1230);
    float _1240 = fma(_1140, 0.88622701168060302734375, _1232);
    float _1242 = _1224 * _1142;
    float _1244 = fma(_1144, 0.88622701168060302734375, _1234);
    float _1246 = fma(_1226, _1146, _1238);
    float _1248 = fma(_1226, _1148, _1240);
    float _1250 = fma(_1150, 0.88622701168060302734375, _1236);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1242);
    float _1254 = fma(_1228, _1154, _1246);
    float _1256 = fma(_1228, _1156, _1248);
    float _1258 = fma(_1192, _1224, _1198);
    float _1260 = fma(_1194, _1224, _1200);
    float _1262 = fma(_1226, _1158, _1244);
    float _1264 = precise::max(0.0, _1254);
    float _1266 = fma(_1226, _1160, _1250);
    float _1268 = precise::max(0.0, _1256);
    float _1270 = fma(_1202, _1224, _1206);
    float _1272 = fma(_1226, _1162, _1252);
    float _1274 = _1264 * 0.31830990314483642578125;
    float _1276 = precise::clamp(_1274, 0.0, 1.0);
    float _1278 = fma(_1208, _1226, _1258);
    float _1280 = _1268 * 0.31830990314483642578125;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = fma(_1210, _1226, _1260);
    float _1286 = fma(_1228, _1164, _1262);
    float _1288 = fma(_1228, _1166, _1266);
    float _1290 = fma(_1212, _1226, _1270);
    float _1292 = fma(_1228, _1168, _1272);
    float _1294 = _1276 * 0.88622701168060302734375;
    float _1296 = -_1282;
    float _1298 = _1296 + 1.0;
    float _1300 = fma(_1214, _1228, _1278);
    float _1302 = fma(_1216, _1228, _1284);
    float _1304 = precise::max(0.0, _1286);
    float _1306 = fma(_1218, _1228, _1290);
    float _1308 = precise::max(0.0, _1288);
    float _1310 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1312 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1282);
    float _1316 = precise::max(0.0, _1292);
    float _1318 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1320 = precise::max(0.0, _1300);
    float _1322 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1310);
    float _1324 = precise::max(0.0, _1302);
    float _1326 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1330 = precise::max(0.0, _1306);
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1318);
    float _1334 = -_833;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1338 = _1334 + _1336;
    float _1340 = fma(_1320, _1328, _1322);
    float _1342 = fma(_1324, _1328, _1326);
    float _1344 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1346 = fma(_1330, _1328, _1332);
    out.m_53.w = _1344;
    out.m_51.x = _1340;
    out.m_51.y = _1342;
    out.m_51.z = _1346;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

