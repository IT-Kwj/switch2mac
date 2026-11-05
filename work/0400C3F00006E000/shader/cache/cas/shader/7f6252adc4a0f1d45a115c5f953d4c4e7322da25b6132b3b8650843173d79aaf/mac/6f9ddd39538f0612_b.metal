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
    float4 m_45 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1011 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_42.x;
    float _65 = in.m_42.y;
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _74 = _72 << 4;
    bool _78 = _74 == 0;
    bool _80 = _74 == 16;
    bool _82 = _74 == 32;
    bool _84 = _74 == 48;
    bool _86 = _74 == 64;
    float _88 = fma(_69, _63, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _90 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _92 = _74 == 80;
    bool _94 = _65 >= 0.5;
    bool _96 = isnan(_65);
    bool _98 = _94 || _96;
    bool _100 = isnan(0.5);
    bool _102 = _98 || _100;
    float _104 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _106 = _88 + _104;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _110 = _90 + _108;
    float _112 = as_type<float>(gl_BaseInstance);
    if (_78)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _112;
    float _116 = _106 * _106;
    bool _118 = _74 == 96;
    float _120 = 0.0;
    float _122 = _114;
    float _124 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_78)
    {
        _120 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _126 = _120;
    float _128 = fma(_110, _110, _116);
    float _130 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _132 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _130;
    float _134 = _126;
    float _136 = _132;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _138 = _122;
    bool _140 = _74 == 112;
    float _142 = fma(_132, _132, _128);
    float _144 = _138;
    if (_80)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _134;
    float _148 = _146;
    if (_82)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    bool _152 = _74 == 128;
    float _154 = rsqrt(_142);
    float _156 = _150;
    if (_82)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = _158;
    if (_84)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _156;
    bool _164 = _74 == 144;
    float _166 = _162;
    if (_84)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_86)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _74 == 160;
    float _176 = _172;
    if (_86)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _178;
    if (_92)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _176;
    float _184 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _186 = _74 == 176;
    float _188 = _182;
    if (_92)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _180;
    bool _192 = _74 == 192;
    float _194 = log2(_184);
    float _196 = _190;
    if (_118)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _188;
    float _200 = _198;
    if (_118)
    {
        _196 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _202 = _196;
    float _204 = _202;
    if (_140)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _200;
    bool _208 = _74 == 208;
    float _210 = _206;
    if (_140)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _74 == 224;
    float _220 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _214;
    float _224 = _194 + 1.2999999523162841796875;
    float _226 = _222;
    if (_164)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _220;
    bool _230 = _74 == 240;
    float _232 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _234 = _226;
    float _236 = trunc(_224);
    int _238 = int(_236);
    float _240 = _234;
    if (_174)
    {
        _232 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _242 = _232;
    bool _244 = _74 == 256;
    float _246 = _242;
    if (_174)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_186)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _252 = _246;
    bool _254 = _74 == 272;
    float _256 = _252;
    if (_186)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_192)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    bool _264 = _74 == 288;
    int _266 = min(_238, 15);
    float _268 = _262;
    if (_192)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _260;
    bool _272 = _74 == 304;
    float _274 = float(_266);
    float _276 = _270;
    if (_208)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _278 = _268;
    int _280 = _266 << 4;
    int _282 = _280 + 4288;
    float _284 = _278;
    float _286 = as_type<float>(_282);
    if (_208)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _292 = _284;
    float _294 = -_274;
    float _296 = _294 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _298 = _74 == 320;
    int _300 = _282 + 8;
    uint _303 = uint(int(uint(_300) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c14)._m0[int(_305)][_307];
    int _311 = int(_303) + 1;
    uint _313 = uint(int(uint(_311) >> uint(2)));
    int _315 = _311 & 3;
    float _317 = (*spvDescriptorSet0.vp_c14)._m0[int(_313)][_315];
    float _319 = _292;
    if (_218)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _321 = _290;
    float _323 = _296 + 1.0;
    float _325 = _321;
    if (_230)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _327 = _319;
    bool _329 = _74 == 336;
    float _331 = _327;
    if (_230)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _333 = _325;
    float _335 = exp2(_323);
    float _337 = _333;
    if (_244)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _339 = _331;
    bool _341 = _74 == 352;
    float _343 = _339;
    if (_244)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _345 = _337;
    float _347 = _345;
    if (_254)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _349 = _343;
    bool _351 = _74 == 368;
    float _353 = _349;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _355 = _347;
    float _357 = _355;
    if (_264)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _359 = _353;
    bool _361 = _74 == 384;
    float _363 = 1.0 / _335;
    float _365 = _359;
    float _367 = _335;
    if (_264)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _369 = _357;
    float _371 = _369;
    if (_272)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _373 = _365;
    bool _375 = _74 == 400;
    float _377 = _373;
    if (_272)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _74 == 416;
    float _383 = _379;
    if (_298)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _385 = _377;
    float _387 = _385;
    if (_298)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _389 = _383;
    float _391 = _389;
    if (_329)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _393 = _387;
    bool _395 = _74 == 432;
    float _397 = _393;
    if (_329)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_341)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _403 = _397;
    bool _405 = _74 == 448;
    float _407 = _403;
    if (_341)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _413 = _407;
    bool _415 = _74 == 464;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _423 = _417;
    bool _425 = _74 == 480;
    float _427 = _423;
    if (_361)
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
    bool _435 = _74 == 496;
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
    bool _445 = _74 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _74 == 528;
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
    bool _465 = _74 == 544;
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
    bool _475 = _74 == 560;
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
    bool _485 = _74 == 576;
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
    bool _495 = _74 == 592;
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
    bool _505 = _74 == 608;
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
    bool _515 = _74 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _74 == 640;
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
    bool _535 = _74 == 656;
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
    bool _545 = _74 == 672;
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
    bool _555 = _74 == 688;
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
    bool _565 = _74 == 704;
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
    bool _575 = _74 == 720;
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
    bool _585 = _74 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _74 == 752;
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
    float _629 = _621 * _63;
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
    float _653 = -_639;
    float _655 = _629 + _653;
    float _657 = _335 * _651;
    float _659 = _655;
    if (!_102)
    {
        _367 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _661 = _367;
    float _663 = _655 * 2.0;
    float _665 = -_655;
    float _667 = fma(_657, _665, _63);
    float _669 = floor(_663);
    float _671 = _657 * _669;
    float _673 = _671 * 0.5;
    float _675 = _673 + _667;
    float _677 = fma(_69, _675, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _679 = fma(_675, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _683 = _677 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _687 = _679 + _685;
    float _689 = _683 * _683;
    float _691 = fma(_687, _687, _689);
    float _693 = fma(_132, _132, _691);
    float _695 = sqrt(_693);
    float _697 = -_317;
    float _699 = fma(_695, _309, _697);
    float _701 = precise::clamp(_699, 0.0, 1.0);
    float _703 = -_673;
    float _705 = fma(_703, _701, _675);
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _709 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _711 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _713 = _693;
    float _715 = _661;
    if (!_102)
    {
        float _717 = fma(_709, _661, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _136 = _717;
    }
    float _719 = _136;
    float _721 = _719;
    if (!_102)
    {
        float _723 = fma(_711, _661, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _124 = _723;
    }
    float _725 = _124;
    float _727 = _725;
    if (!_102)
    {
        float _729 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _721 = _729;
    }
    float _731 = _721;
    if (!_102)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _725);
        _713 = _733;
    }
    float _735 = _713;
    if (!_102)
    {
        float2 _2520 = float2(_735, _731);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2520, float2(0.0), isnan(_2520)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2520, float2(0.0), isnan(_2520)), level(0.0)).x;
        _727 = _737;
    }
    float _739 = _727;
    if (_102)
    {
        _286 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _741 = _286;
    float _743 = _741;
    if (_102)
    {
        _659 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _745 = _659;
    if (_102)
    {
        float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _741, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _715 = _747;
    }
    float _749 = _715;
    float _751 = _749;
    if (_102)
    {
        float _753 = fma(_707, _741, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _743 = _753;
    }
    float _755 = _743;
    float _757 = _755;
    if (_102)
    {
        float _759 = fma(_749, _745, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _751 = _759;
    }
    float _761 = _751;
    float _763 = _761;
    if (_102)
    {
        float _765 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_102)
    {
        float _771 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _761);
        _763 = _771;
    }
    float _773 = _763;
    float _775 = _773;
    if (_102)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _777;
    }
    float _779 = _769;
    float _781 = _739;
    float _783 = _779;
    if (_102)
    {
        float2 _2615 = float2(_779, _773);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2615, float2(0.0), isnan(_2615)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2615, float2(0.0), isnan(_2615)), level(0.0)).x;
        _781 = _785;
    }
    float _787 = _781;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = _707 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _805 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _807 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_807)
    {
        _783 = _707;
    }
    float _811 = _783;
    float _813 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _815 = _813 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _817 = _811;
    if (!_807)
    {
        _809 = _813;
    }
    float _819 = _809;
    float _821 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].x, _815);
    float _823 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _821);
    float _825 = _823 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _827 = _823;
    float _829 = _819;
    if (!_807)
    {
        _827 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _831 = _827;
    float _833 = _831;
    if (!_807)
    {
        _775 = _825;
    }
    float _835 = _775;
    bool _837 = !_807;
    float _839 = _835;
    if (!_837)
    {
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _843 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _845 = _801 + _843;
        float _847 = _813 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _849 = rsqrt(_799);
        float _851 = _845 * _841;
        float _853 = _851 * 0.15915493667125701904296875;
        float _855 = _853 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = _853 * 6.283185482025146484375;
        float _861 = sin(_859);
        float _863 = _857 + (-1.0);
        float _865 = fma(_861, _847, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _867 = _863 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _869 = _849 * _865;
        float _871 = fma(_813, _857, _867);
        float _873 = fma(_795, _869, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _875 = _871 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _877 = fma(_791, _869, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _879 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[2].x, _875);
        float _881 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].z, _879);
        float _883 = _881 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _829 = _871;
        _817 = _873;
        _833 = _877;
        _839 = _883;
    }
    float _885 = _829;
    float _887 = _817;
    float _889 = _833;
    float _891 = _839;
    float _893 = _885 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _895 = _885 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[1].x, _893);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[0].x, _895);
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[1].z, _897);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[0].z, _899);
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _907 = _905 != 0;
    float _909 = _901 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _913 = _909 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _915 = _909 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _917 = _909 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _919 = _909 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[7].x, _913);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[8].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
    float _929 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[7].z, _921);
    float _931 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[8].z, _923);
    float _933 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
    float _935 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
    float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _945 = !_907;
    float _947;
    float _949;
    float _951;
    int _953;
    int _955;
    int _957;
    int _959;
    int _961;
    int _963;
    int _965;
    int _967;
    float _969;
    float _971;
    float _973;
    float _975;
    float _977;
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
    int _1005;
    float _1007;
    float _1009;
    if (!_945)
    {
        _947 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _949 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _951 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _969 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _975 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1011 = true;
    }
    else
    {
        float _1013 = fma(_707, 6.2500002968590706586837768554688e-05, 0.5);
        float _1015 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3028 = float3(_1013, _1015, float(0));
        float3 _3032 = select(_3028, float3(0.0), isnan(_3028));
        float4 _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3032.xy, uint(rint(_3032.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3032.xy, uint(rint(_3032.z)), level(0.0)).xyzw;
        float _1020 = _1018.x;
        float _1022 = _1018.y;
        float _1024 = _1018.z;
        float _1026 = _1018.w;
        float3 _3047 = float3(_1013, _1015, float(1));
        float3 _3049 = select(_3047, float3(0.0), isnan(_3047));
        float4 _1028 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3049.xy, uint(rint(_3049.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3049.xy, uint(rint(_3049.z)), level(0.0)).xyzw;
        float _1030 = _1028.x;
        float _1032 = _1028.y;
        float _1034 = _1028.z;
        float _1036 = _1028.w;
        float3 _3064 = float3(_1013, _1015, float(2));
        float3 _3066 = select(_3064, float3(0.0), isnan(_3064));
        float4 _1038 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3066.xy, uint(rint(_3066.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3066.xy, uint(rint(_3066.z)), level(0.0)).xyzw;
        float _1040 = _1038.x;
        float _1042 = _1038.y;
        float _1044 = _1038.z;
        float _1046 = _1038.w;
        float3 _3081 = float3(_1013, _1015, float(3));
        float3 _3083 = select(_3081, float3(0.0), isnan(_3081));
        float4 _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3083.xy, uint(rint(_3083.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3083.xy, uint(rint(_3083.z)), level(0.0)).xyzw;
        float _1050 = _1048.x;
        float _1052 = _1048.y;
        float _1054 = _1048.z;
        float _1056 = _1048.w;
        float3 _3098 = float3(_1013, _1015, float(4));
        float3 _3100 = select(_3098, float3(0.0), isnan(_3098));
        float4 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3100.xy, uint(rint(_3100.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3100.xy, uint(rint(_3100.z)), level(0.0)).xyzw;
        float _1060 = _1058.x;
        float _1062 = _1058.y;
        float _1064 = _1058.z;
        float _1066 = _1058.w;
        float3 _3115 = float3(_1013, _1015, float(5));
        float3 _3117 = select(_3115, float3(0.0), isnan(_3115));
        float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3117.xy, uint(rint(_3117.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3117.xy, uint(rint(_3117.z)), level(0.0)).xyzw;
        float _1070 = _1068.x;
        float _1072 = _1068.y;
        float _1074 = _1068.z;
        float _1076 = _1068.w;
        float3 _3132 = float3(_1013, _1015, float(6));
        float3 _3134 = select(_3132, float3(0.0), isnan(_3132));
        float4 _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3134.xy, uint(rint(_3134.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3134.xy, uint(rint(_3134.z)), level(0.0)).xyzw;
        float _1080 = _1078.x;
        float _1082 = _1078.y;
        float _1084 = _1078.z;
        float _1086 = _1078.w;
        float3 _3149 = float3(_1013, _1015, float(7));
        float3 _3151 = select(_3149, float3(0.0), isnan(_3149));
        float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3151.xy, uint(rint(_3151.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3151.xy, uint(rint(_3151.z)), level(0.0)).xyzw;
        float _1090 = _1088.x;
        float _1092 = _1088.y;
        float _1094 = _1088.z;
        float _1096 = _1088.w;
        _947 = _1054;
        _949 = _1050;
        _951 = _1052;
        _953 = as_type<int>(_1056);
        _955 = as_type<int>(_1060);
        _957 = as_type<int>(_1062);
        _959 = as_type<int>(_1064);
        _961 = as_type<int>(_1066);
        _963 = as_type<int>(_1070);
        _965 = as_type<int>(_1072);
        _967 = as_type<int>(_1076);
        _969 = _1082;
        _971 = _1092;
        _973 = _1026;
        _975 = _1030;
        _977 = _1080;
        _979 = _1090;
        _981 = _1020;
        _983 = _1032;
        _985 = _1084;
        _987 = _1094;
        _989 = _1034;
        _991 = _1022;
        _993 = _1086;
        _995 = _1096;
        _997 = _1024;
        _999 = _1042;
        _1001 = _1036;
        _1003 = _1040;
        _1005 = as_type<int>(_1074);
        _1007 = _1044;
        _1009 = _1046;
    }
    _1011 = false;
    float _1098 = _947;
    float _1100 = _949;
    float _1102 = _951;
    int _1104 = _953;
    int _1106 = _955;
    int _1108 = _957;
    int _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    float _1120 = _969;
    float _1122 = _971;
    float _1124 = _973;
    float _1126 = _975;
    float _1128 = _977;
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
    int _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1164 = _813 + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1168 = _707 + _1166;
    float _1170 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1170;
    float _1174 = _1098 * 0.88622701168060302734375;
    float _1176 = _1164 * _1164;
    float _1178 = _1100 * 0.88622701168060302734375;
    float _1180 = _1102 * 0.88622701168060302734375;
    float _1182 = _907 ? as_type<float>(_1104) : 0.0;
    float _1184 = fma(_1168, _1168, _1176);
    float _1186 = _907 ? as_type<float>(_1106) : 0.0;
    out.gl_Position.x = _937;
    out.gl_Position.y = _939;
    out.gl_Position.z = _941;
    out.gl_Position.w = _943;
    float _1188 = _907 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1172, _1172, _1184);
    float _1192 = _907 ? _1178 : 0.0;
    out.m_45.x = _707;
    out.m_45.y = _813;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1194 = _907 ? _1180 : 0.0;
    float _1196 = _907 ? _1174 : 0.0;
    float _1198 = rsqrt(_1190);
    float _1200 = _907 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _805;
    out.m_47.w = _803;
    float _1202 = _907 ? as_type<float>(_1112) : 0.0;
    float _1204 = _907 ? as_type<float>(_1114) : 0.0;
    float _1206 = _907 ? as_type<float>(_1116) : 0.0;
    float _1208 = _907 ? as_type<float>(_1118) : 0.0;
    float _1210 = _1198 * 1.02332699298858642578125;
    float _1212 = _1172 * _1198;
    float _1214 = _1164 * _1210;
    float _1216 = _1212 * (-1.02332699298858642578125);
    float _1218 = _1168 * _1210;
    float _1220 = _1214 * _1120;
    float _1222 = _1214 * _1122;
    float _1224 = _1214 * _1124;
    float _1226 = _1214 * _1126;
    float _1228 = fma(_1128, 0.88622701168060302734375, _1220);
    float _1230 = fma(_1130, 0.88622701168060302734375, _1222);
    float _1232 = fma(_1132, 0.88622701168060302734375, _1224);
    float _1234 = _1214 * _1134;
    float _1236 = fma(_1216, _1136, _1228);
    float _1238 = fma(_1216, _1138, _1230);
    float _1240 = fma(_1216, _1140, _1232);
    float _1242 = fma(_1142, 0.88622701168060302734375, _1226);
    float _1244 = fma(_1218, _1144, _1236);
    float _1246 = fma(_1218, _1146, _1238);
    float _1248 = fma(_1148, 0.88622701168060302734375, _1234);
    float _1250 = fma(_1182, _1214, _1192);
    float _1252 = fma(_1186, _1214, _1194);
    float _1254 = precise::max(0.0, _1244);
    float _1256 = fma(_1188, _1214, _1196);
    float _1258 = precise::max(0.0, _1246);
    float _1260 = fma(_1218, _1150, _1240);
    float _1262 = fma(_1216, _1152, _1242);
    float _1264 = _1254 * 0.31830990314483642578125;
    float _1266 = precise::clamp(_1264, 0.0, 1.0);
    float _1268 = fma(_1216, _1154, _1248);
    float _1270 = fma(_1200, _1216, _1250);
    float _1272 = fma(_1202, _1216, _1252);
    float _1274 = _1266 * 0.88622701168060302734375;
    float _1276 = fma(_1204, _1216, _1256);
    float _1278 = _1258 * 0.31830990314483642578125;
    float _1280 = precise::clamp(_1278, 0.0, 1.0);
    float _1282 = _907 ? as_type<float>(_1156) : 0.0;
    float _1284 = fma(_1218, _1158, _1262);
    float _1286 = precise::max(0.0, _1260);
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1290 = fma(_1218, _1160, _1268);
    float _1292 = -_1280;
    float _1294 = _1292 + 1.0;
    float _1296 = fma(_1282, _1218, _1272);
    float _1298 = fma(_1206, _1218, _1270);
    float _1300 = fma(_1208, _1218, _1276);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1288);
    float _1304 = precise::max(0.0, _1284);
    float _1306 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1280);
    float _1308 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1310 = precise::max(0.0, _1290);
    float _1312 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1314 = precise::max(0.0, _1296);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1318 = precise::max(0.0, _1298);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1308);
    float _1322 = precise::max(0.0, _1300);
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1312);
    float _1326 = fma(_1314, _1316, _1320);
    float _1328 = fma(_1318, _1316, _1302);
    float _1330 = fma(_1322, _1316, _1324);
    out.m_49.x = _1328;
    out.m_49.y = _1326;
    out.m_49.z = _1330;
    out.m_49.w = _825;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1011 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_42.x;
    float _65 = in.m_42.y;
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _74 = _72 << 4;
    bool _78 = _74 == 0;
    bool _80 = _74 == 16;
    bool _82 = _74 == 32;
    bool _84 = _74 == 48;
    bool _86 = _74 == 64;
    float _88 = fma(_69, _63, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _90 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _92 = _74 == 80;
    bool _94 = _65 >= 0.5;
    bool _96 = isnan(_65);
    bool _98 = _94 || _96;
    bool _100 = isnan(0.5);
    bool _102 = _98 || _100;
    float _104 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _106 = _88 + _104;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _110 = _90 + _108;
    float _112 = as_type<float>(gl_BaseInstance);
    if (_78)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _112;
    float _116 = _106 * _106;
    bool _118 = _74 == 96;
    float _120 = 0.0;
    float _122 = _114;
    float _124 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_78)
    {
        _120 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _126 = _120;
    float _128 = fma(_110, _110, _116);
    float _130 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _132 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _130;
    float _134 = _126;
    float _136 = _132;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _138 = _122;
    bool _140 = _74 == 112;
    float _142 = fma(_132, _132, _128);
    float _144 = _138;
    if (_80)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _134;
    float _148 = _146;
    if (_82)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    bool _152 = _74 == 128;
    float _154 = rsqrt(_142);
    float _156 = _150;
    if (_82)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = _158;
    if (_84)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _156;
    bool _164 = _74 == 144;
    float _166 = _162;
    if (_84)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_86)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _74 == 160;
    float _176 = _172;
    if (_86)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _178;
    if (_92)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _176;
    float _184 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _186 = _74 == 176;
    float _188 = _182;
    if (_92)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _180;
    bool _192 = _74 == 192;
    float _194 = log2(_184);
    float _196 = _190;
    if (_118)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _188;
    float _200 = _198;
    if (_118)
    {
        _196 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _202 = _196;
    float _204 = _202;
    if (_140)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _200;
    bool _208 = _74 == 208;
    float _210 = _206;
    if (_140)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _74 == 224;
    float _220 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _214;
    float _224 = _194 + 1.2999999523162841796875;
    float _226 = _222;
    if (_164)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _220;
    bool _230 = _74 == 240;
    float _232 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _234 = _226;
    float _236 = trunc(_224);
    int _238 = int(_236);
    float _240 = _234;
    if (_174)
    {
        _232 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _242 = _232;
    bool _244 = _74 == 256;
    float _246 = _242;
    if (_174)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_186)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _252 = _246;
    bool _254 = _74 == 272;
    float _256 = _252;
    if (_186)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_192)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    bool _264 = _74 == 288;
    int _266 = min(_238, 15);
    float _268 = _262;
    if (_192)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _260;
    bool _272 = _74 == 304;
    float _274 = float(_266);
    float _276 = _270;
    if (_208)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _278 = _268;
    int _280 = _266 << 4;
    int _282 = _280 + 4288;
    float _284 = _278;
    float _286 = as_type<float>(_282);
    if (_208)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _292 = _284;
    float _294 = -_274;
    float _296 = _294 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _298 = _74 == 320;
    int _300 = _282 + 8;
    uint _303 = uint(int(uint(_300) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c14)._m0[int(_305)][_307];
    int _311 = int(_303) + 1;
    uint _313 = uint(int(uint(_311) >> uint(2)));
    int _315 = _311 & 3;
    float _317 = (*spvDescriptorSet0.vp_c14)._m0[int(_313)][_315];
    float _319 = _292;
    if (_218)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _321 = _290;
    float _323 = _296 + 1.0;
    float _325 = _321;
    if (_230)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _327 = _319;
    bool _329 = _74 == 336;
    float _331 = _327;
    if (_230)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _333 = _325;
    float _335 = exp2(_323);
    float _337 = _333;
    if (_244)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _339 = _331;
    bool _341 = _74 == 352;
    float _343 = _339;
    if (_244)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _345 = _337;
    float _347 = _345;
    if (_254)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _349 = _343;
    bool _351 = _74 == 368;
    float _353 = _349;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _355 = _347;
    float _357 = _355;
    if (_264)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _359 = _353;
    bool _361 = _74 == 384;
    float _363 = 1.0 / _335;
    float _365 = _359;
    float _367 = _335;
    if (_264)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _369 = _357;
    float _371 = _369;
    if (_272)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _373 = _365;
    bool _375 = _74 == 400;
    float _377 = _373;
    if (_272)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _74 == 416;
    float _383 = _379;
    if (_298)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _385 = _377;
    float _387 = _385;
    if (_298)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _389 = _383;
    float _391 = _389;
    if (_329)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _393 = _387;
    bool _395 = _74 == 432;
    float _397 = _393;
    if (_329)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_341)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _403 = _397;
    bool _405 = _74 == 448;
    float _407 = _403;
    if (_341)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _413 = _407;
    bool _415 = _74 == 464;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _423 = _417;
    bool _425 = _74 == 480;
    float _427 = _423;
    if (_361)
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
    bool _435 = _74 == 496;
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
    bool _445 = _74 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _74 == 528;
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
    bool _465 = _74 == 544;
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
    bool _475 = _74 == 560;
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
    bool _485 = _74 == 576;
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
    bool _495 = _74 == 592;
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
    bool _505 = _74 == 608;
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
    bool _515 = _74 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _74 == 640;
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
    bool _535 = _74 == 656;
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
    bool _545 = _74 == 672;
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
    bool _555 = _74 == 688;
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
    bool _565 = _74 == 704;
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
    bool _575 = _74 == 720;
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
    bool _585 = _74 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _74 == 752;
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
    float _629 = _621 * _63;
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
    float _653 = -_639;
    float _655 = _629 + _653;
    float _657 = _335 * _651;
    float _659 = _655;
    if (!_102)
    {
        _367 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _661 = _367;
    float _663 = _655 * 2.0;
    float _665 = -_655;
    float _667 = fma(_657, _665, _63);
    float _669 = floor(_663);
    float _671 = _657 * _669;
    float _673 = _671 * 0.5;
    float _675 = _673 + _667;
    float _677 = fma(_69, _675, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _679 = fma(_675, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _683 = _677 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _687 = _679 + _685;
    float _689 = _683 * _683;
    float _691 = fma(_687, _687, _689);
    float _693 = fma(_132, _132, _691);
    float _695 = sqrt(_693);
    float _697 = -_317;
    float _699 = fma(_695, _309, _697);
    float _701 = precise::clamp(_699, 0.0, 1.0);
    float _703 = -_673;
    float _705 = fma(_703, _701, _675);
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _709 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _711 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _713 = _693;
    float _715 = _661;
    if (!_102)
    {
        float _717 = fma(_709, _661, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _136 = _717;
    }
    float _719 = _136;
    float _721 = _719;
    if (!_102)
    {
        float _723 = fma(_711, _661, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _124 = _723;
    }
    float _725 = _124;
    float _727 = _725;
    if (!_102)
    {
        float _729 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _721 = _729;
    }
    float _731 = _721;
    if (!_102)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _725);
        _713 = _733;
    }
    float _735 = _713;
    if (!_102)
    {
        float2 _2520 = float2(_735, _731);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2520, float2(0.0), isnan(_2520)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2520, float2(0.0), isnan(_2520)), level(0.0)).x;
        _727 = _737;
    }
    float _739 = _727;
    if (_102)
    {
        _286 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _741 = _286;
    float _743 = _741;
    if (_102)
    {
        _659 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _745 = _659;
    if (_102)
    {
        float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _741, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _715 = _747;
    }
    float _749 = _715;
    float _751 = _749;
    if (_102)
    {
        float _753 = fma(_707, _741, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _743 = _753;
    }
    float _755 = _743;
    float _757 = _755;
    if (_102)
    {
        float _759 = fma(_749, _745, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _751 = _759;
    }
    float _761 = _751;
    float _763 = _761;
    if (_102)
    {
        float _765 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_102)
    {
        float _771 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _761);
        _763 = _771;
    }
    float _773 = _763;
    float _775 = _773;
    if (_102)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _777;
    }
    float _779 = _769;
    float _781 = _739;
    float _783 = _779;
    if (_102)
    {
        float2 _2615 = float2(_779, _773);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2615, float2(0.0), isnan(_2615)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2615, float2(0.0), isnan(_2615)), level(0.0)).x;
        _781 = _785;
    }
    float _787 = _781;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = _707 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _805 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _807 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_807)
    {
        _783 = _707;
    }
    float _811 = _783;
    float _813 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _815 = _813 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _817 = _811;
    if (!_807)
    {
        _809 = _813;
    }
    float _819 = _809;
    float _821 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].x, _815);
    float _823 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _821);
    float _825 = _823 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _827 = _823;
    float _829 = _819;
    if (!_807)
    {
        _827 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _831 = _827;
    float _833 = _831;
    if (!_807)
    {
        _775 = _825;
    }
    float _835 = _775;
    bool _837 = !_807;
    float _839 = _835;
    if (!_837)
    {
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _843 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _845 = _801 + _843;
        float _847 = _813 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _849 = rsqrt(_799);
        float _851 = _845 * _841;
        float _853 = _851 * 0.15915493667125701904296875;
        float _855 = _853 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = _853 * 6.283185482025146484375;
        float _861 = sin(_859);
        float _863 = _857 + (-1.0);
        float _865 = fma(_861, _847, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _867 = _863 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _869 = _849 * _865;
        float _871 = fma(_813, _857, _867);
        float _873 = fma(_795, _869, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _875 = _871 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _877 = fma(_791, _869, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _879 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[2].x, _875);
        float _881 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].z, _879);
        float _883 = _881 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _829 = _871;
        _817 = _873;
        _833 = _877;
        _839 = _883;
    }
    float _885 = _829;
    float _887 = _817;
    float _889 = _833;
    float _891 = _839;
    float _893 = _885 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _895 = _885 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[1].x, _893);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[0].x, _895);
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[1].z, _897);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[0].z, _899);
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _907 = _905 != 0;
    float _909 = _901 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _913 = _909 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _915 = _909 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _917 = _909 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _919 = _909 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[7].x, _913);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[8].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
    float _929 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[7].z, _921);
    float _931 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[8].z, _923);
    float _933 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
    float _935 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
    float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _945 = !_907;
    float _947;
    float _949;
    float _951;
    int _953;
    int _955;
    int _957;
    int _959;
    int _961;
    int _963;
    int _965;
    int _967;
    float _969;
    float _971;
    float _973;
    float _975;
    float _977;
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
    int _1005;
    float _1007;
    float _1009;
    if (!_945)
    {
        _947 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _949 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _951 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _969 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _975 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1011 = true;
    }
    else
    {
        float _1013 = fma(_707, 6.2500002968590706586837768554688e-05, 0.5);
        float _1015 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3028 = float3(_1013, _1015, float(0));
        float3 _3032 = select(_3028, float3(0.0), isnan(_3028));
        float4 _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3032.xy, uint(rint(_3032.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3032.xy, uint(rint(_3032.z)), level(0.0)).xyzw;
        float _1020 = _1018.x;
        float _1022 = _1018.y;
        float _1024 = _1018.z;
        float _1026 = _1018.w;
        float3 _3047 = float3(_1013, _1015, float(1));
        float3 _3049 = select(_3047, float3(0.0), isnan(_3047));
        float4 _1028 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3049.xy, uint(rint(_3049.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3049.xy, uint(rint(_3049.z)), level(0.0)).xyzw;
        float _1030 = _1028.x;
        float _1032 = _1028.y;
        float _1034 = _1028.z;
        float _1036 = _1028.w;
        float3 _3064 = float3(_1013, _1015, float(2));
        float3 _3066 = select(_3064, float3(0.0), isnan(_3064));
        float4 _1038 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3066.xy, uint(rint(_3066.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3066.xy, uint(rint(_3066.z)), level(0.0)).xyzw;
        float _1040 = _1038.x;
        float _1042 = _1038.y;
        float _1044 = _1038.z;
        float _1046 = _1038.w;
        float3 _3081 = float3(_1013, _1015, float(3));
        float3 _3083 = select(_3081, float3(0.0), isnan(_3081));
        float4 _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3083.xy, uint(rint(_3083.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3083.xy, uint(rint(_3083.z)), level(0.0)).xyzw;
        float _1050 = _1048.x;
        float _1052 = _1048.y;
        float _1054 = _1048.z;
        float _1056 = _1048.w;
        float3 _3098 = float3(_1013, _1015, float(4));
        float3 _3100 = select(_3098, float3(0.0), isnan(_3098));
        float4 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3100.xy, uint(rint(_3100.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3100.xy, uint(rint(_3100.z)), level(0.0)).xyzw;
        float _1060 = _1058.x;
        float _1062 = _1058.y;
        float _1064 = _1058.z;
        float _1066 = _1058.w;
        float3 _3115 = float3(_1013, _1015, float(5));
        float3 _3117 = select(_3115, float3(0.0), isnan(_3115));
        float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3117.xy, uint(rint(_3117.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3117.xy, uint(rint(_3117.z)), level(0.0)).xyzw;
        float _1070 = _1068.x;
        float _1072 = _1068.y;
        float _1074 = _1068.z;
        float _1076 = _1068.w;
        float3 _3132 = float3(_1013, _1015, float(6));
        float3 _3134 = select(_3132, float3(0.0), isnan(_3132));
        float4 _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3134.xy, uint(rint(_3134.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3134.xy, uint(rint(_3134.z)), level(0.0)).xyzw;
        float _1080 = _1078.x;
        float _1082 = _1078.y;
        float _1084 = _1078.z;
        float _1086 = _1078.w;
        float3 _3149 = float3(_1013, _1015, float(7));
        float3 _3151 = select(_3149, float3(0.0), isnan(_3149));
        float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3151.xy, uint(rint(_3151.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3151.xy, uint(rint(_3151.z)), level(0.0)).xyzw;
        float _1090 = _1088.x;
        float _1092 = _1088.y;
        float _1094 = _1088.z;
        float _1096 = _1088.w;
        _947 = _1054;
        _949 = _1050;
        _951 = _1052;
        _953 = as_type<int>(_1056);
        _955 = as_type<int>(_1060);
        _957 = as_type<int>(_1062);
        _959 = as_type<int>(_1064);
        _961 = as_type<int>(_1066);
        _963 = as_type<int>(_1070);
        _965 = as_type<int>(_1072);
        _967 = as_type<int>(_1076);
        _969 = _1082;
        _971 = _1092;
        _973 = _1026;
        _975 = _1030;
        _977 = _1080;
        _979 = _1090;
        _981 = _1020;
        _983 = _1032;
        _985 = _1084;
        _987 = _1094;
        _989 = _1034;
        _991 = _1022;
        _993 = _1086;
        _995 = _1096;
        _997 = _1024;
        _999 = _1042;
        _1001 = _1036;
        _1003 = _1040;
        _1005 = as_type<int>(_1074);
        _1007 = _1044;
        _1009 = _1046;
    }
    _1011 = false;
    float _1098 = _947;
    float _1100 = _949;
    float _1102 = _951;
    int _1104 = _953;
    int _1106 = _955;
    int _1108 = _957;
    int _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    float _1120 = _969;
    float _1122 = _971;
    float _1124 = _973;
    float _1126 = _975;
    float _1128 = _977;
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
    int _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1164 = _813 + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1168 = _707 + _1166;
    float _1170 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1170;
    float _1174 = _1098 * 0.88622701168060302734375;
    float _1176 = _1164 * _1164;
    float _1178 = _1100 * 0.88622701168060302734375;
    float _1180 = _1102 * 0.88622701168060302734375;
    float _1182 = _907 ? as_type<float>(_1104) : 0.0;
    float _1184 = fma(_1168, _1168, _1176);
    float _1186 = _907 ? as_type<float>(_1106) : 0.0;
    out.gl_Position.x = _937;
    out.gl_Position.y = _939;
    out.gl_Position.z = _941;
    out.gl_Position.w = _943;
    float _1188 = _907 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1172, _1172, _1184);
    float _1192 = _907 ? _1178 : 0.0;
    out.m_45.x = _707;
    out.m_45.y = _813;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1194 = _907 ? _1180 : 0.0;
    float _1196 = _907 ? _1174 : 0.0;
    float _1198 = rsqrt(_1190);
    float _1200 = _907 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _805;
    out.m_47.w = _803;
    float _1202 = _907 ? as_type<float>(_1112) : 0.0;
    float _1204 = _907 ? as_type<float>(_1114) : 0.0;
    float _1206 = _907 ? as_type<float>(_1116) : 0.0;
    float _1208 = _907 ? as_type<float>(_1118) : 0.0;
    float _1210 = _1198 * 1.02332699298858642578125;
    float _1212 = _1172 * _1198;
    float _1214 = _1164 * _1210;
    float _1216 = _1212 * (-1.02332699298858642578125);
    float _1218 = _1168 * _1210;
    float _1220 = _1214 * _1120;
    float _1222 = _1214 * _1122;
    float _1224 = _1214 * _1124;
    float _1226 = _1214 * _1126;
    float _1228 = fma(_1128, 0.88622701168060302734375, _1220);
    float _1230 = fma(_1130, 0.88622701168060302734375, _1222);
    float _1232 = fma(_1132, 0.88622701168060302734375, _1224);
    float _1234 = _1214 * _1134;
    float _1236 = fma(_1216, _1136, _1228);
    float _1238 = fma(_1216, _1138, _1230);
    float _1240 = fma(_1216, _1140, _1232);
    float _1242 = fma(_1142, 0.88622701168060302734375, _1226);
    float _1244 = fma(_1218, _1144, _1236);
    float _1246 = fma(_1218, _1146, _1238);
    float _1248 = fma(_1148, 0.88622701168060302734375, _1234);
    float _1250 = fma(_1182, _1214, _1192);
    float _1252 = fma(_1186, _1214, _1194);
    float _1254 = precise::max(0.0, _1244);
    float _1256 = fma(_1188, _1214, _1196);
    float _1258 = precise::max(0.0, _1246);
    float _1260 = fma(_1218, _1150, _1240);
    float _1262 = fma(_1216, _1152, _1242);
    float _1264 = _1254 * 0.31830990314483642578125;
    float _1266 = precise::clamp(_1264, 0.0, 1.0);
    float _1268 = fma(_1216, _1154, _1248);
    float _1270 = fma(_1200, _1216, _1250);
    float _1272 = fma(_1202, _1216, _1252);
    float _1274 = _1266 * 0.88622701168060302734375;
    float _1276 = fma(_1204, _1216, _1256);
    float _1278 = _1258 * 0.31830990314483642578125;
    float _1280 = precise::clamp(_1278, 0.0, 1.0);
    float _1282 = _907 ? as_type<float>(_1156) : 0.0;
    float _1284 = fma(_1218, _1158, _1262);
    float _1286 = precise::max(0.0, _1260);
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1290 = fma(_1218, _1160, _1268);
    float _1292 = -_1280;
    float _1294 = _1292 + 1.0;
    float _1296 = fma(_1282, _1218, _1272);
    float _1298 = fma(_1206, _1218, _1270);
    float _1300 = fma(_1208, _1218, _1276);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1288);
    float _1304 = precise::max(0.0, _1284);
    float _1306 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1280);
    float _1308 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1310 = precise::max(0.0, _1290);
    float _1312 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1314 = precise::max(0.0, _1296);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1318 = precise::max(0.0, _1298);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1308);
    float _1322 = precise::max(0.0, _1300);
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1312);
    float _1326 = fma(_1314, _1316, _1320);
    float _1328 = fma(_1318, _1316, _1302);
    float _1330 = fma(_1322, _1316, _1324);
    out.m_49.x = _1328;
    out.m_49.y = _1326;
    out.m_49.z = _1330;
    out.m_49.w = _825;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1011 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_42.x;
    float _65 = in.m_42.y;
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _74 = _72 << 4;
    bool _78 = _74 == 0;
    bool _80 = _74 == 16;
    bool _82 = _74 == 32;
    bool _84 = _74 == 48;
    bool _86 = _74 == 64;
    float _88 = fma(_69, _63, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _90 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _92 = _74 == 80;
    bool _94 = _65 >= 0.5;
    bool _96 = isnan(_65);
    bool _98 = _94 || _96;
    bool _100 = isnan(0.5);
    bool _102 = _98 || _100;
    float _104 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _106 = _88 + _104;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _110 = _90 + _108;
    float _112 = as_type<float>(gl_BaseInstance);
    if (_78)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _112;
    float _116 = _106 * _106;
    bool _118 = _74 == 96;
    float _120 = 0.0;
    float _122 = _114;
    float _124 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_78)
    {
        _120 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _126 = _120;
    float _128 = fma(_110, _110, _116);
    float _130 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _132 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _130;
    float _134 = _126;
    float _136 = _132;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _138 = _122;
    bool _140 = _74 == 112;
    float _142 = fma(_132, _132, _128);
    float _144 = _138;
    if (_80)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _134;
    float _148 = _146;
    if (_82)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    bool _152 = _74 == 128;
    float _154 = rsqrt(_142);
    float _156 = _150;
    if (_82)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = _158;
    if (_84)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _156;
    bool _164 = _74 == 144;
    float _166 = _162;
    if (_84)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_86)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _74 == 160;
    float _176 = _172;
    if (_86)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _178;
    if (_92)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _176;
    float _184 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _186 = _74 == 176;
    float _188 = _182;
    if (_92)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _180;
    bool _192 = _74 == 192;
    float _194 = log2(_184);
    float _196 = _190;
    if (_118)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _188;
    float _200 = _198;
    if (_118)
    {
        _196 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _202 = _196;
    float _204 = _202;
    if (_140)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _200;
    bool _208 = _74 == 208;
    float _210 = _206;
    if (_140)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _74 == 224;
    float _220 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _214;
    float _224 = _194 + 1.2999999523162841796875;
    float _226 = _222;
    if (_164)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _220;
    bool _230 = _74 == 240;
    float _232 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _234 = _226;
    float _236 = trunc(_224);
    int _238 = int(_236);
    float _240 = _234;
    if (_174)
    {
        _232 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _242 = _232;
    bool _244 = _74 == 256;
    float _246 = _242;
    if (_174)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_186)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _252 = _246;
    bool _254 = _74 == 272;
    float _256 = _252;
    if (_186)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_192)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    bool _264 = _74 == 288;
    int _266 = min(_238, 15);
    float _268 = _262;
    if (_192)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _260;
    bool _272 = _74 == 304;
    float _274 = float(_266);
    float _276 = _270;
    if (_208)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _278 = _268;
    int _280 = _266 << 4;
    int _282 = _280 + 4288;
    float _284 = _278;
    float _286 = as_type<float>(_282);
    if (_208)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _292 = _284;
    float _294 = -_274;
    float _296 = _294 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _298 = _74 == 320;
    int _300 = _282 + 8;
    uint _303 = uint(int(uint(_300) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c14)._m0[int(_305)][_307];
    int _311 = int(_303) + 1;
    uint _313 = uint(int(uint(_311) >> uint(2)));
    int _315 = _311 & 3;
    float _317 = (*spvDescriptorSet0.vp_c14)._m0[int(_313)][_315];
    float _319 = _292;
    if (_218)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _321 = _290;
    float _323 = _296 + 1.0;
    float _325 = _321;
    if (_230)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _327 = _319;
    bool _329 = _74 == 336;
    float _331 = _327;
    if (_230)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _333 = _325;
    float _335 = exp2(_323);
    float _337 = _333;
    if (_244)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _339 = _331;
    bool _341 = _74 == 352;
    float _343 = _339;
    if (_244)
    {
        _337 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _345 = _337;
    float _347 = _345;
    if (_254)
    {
        _343 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _349 = _343;
    bool _351 = _74 == 368;
    float _353 = _349;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _355 = _347;
    float _357 = _355;
    if (_264)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _359 = _353;
    bool _361 = _74 == 384;
    float _363 = 1.0 / _335;
    float _365 = _359;
    float _367 = _335;
    if (_264)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _369 = _357;
    float _371 = _369;
    if (_272)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _373 = _365;
    bool _375 = _74 == 400;
    float _377 = _373;
    if (_272)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _74 == 416;
    float _383 = _379;
    if (_298)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _385 = _377;
    float _387 = _385;
    if (_298)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _389 = _383;
    float _391 = _389;
    if (_329)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _393 = _387;
    bool _395 = _74 == 432;
    float _397 = _393;
    if (_329)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_341)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _403 = _397;
    bool _405 = _74 == 448;
    float _407 = _403;
    if (_341)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _413 = _407;
    bool _415 = _74 == 464;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _419 = _411;
    float _421 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _423 = _417;
    bool _425 = _74 == 480;
    float _427 = _423;
    if (_361)
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
    bool _435 = _74 == 496;
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
    bool _445 = _74 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _74 == 528;
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
    bool _465 = _74 == 544;
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
    bool _475 = _74 == 560;
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
    bool _485 = _74 == 576;
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
    bool _495 = _74 == 592;
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
    bool _505 = _74 == 608;
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
    bool _515 = _74 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _74 == 640;
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
    bool _535 = _74 == 656;
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
    bool _545 = _74 == 672;
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
    bool _555 = _74 == 688;
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
    bool _565 = _74 == 704;
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
    bool _575 = _74 == 720;
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
    bool _585 = _74 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _74 == 752;
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
    float _629 = _621 * _63;
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
    float _653 = -_639;
    float _655 = _629 + _653;
    float _657 = _335 * _651;
    float _659 = _655;
    if (!_102)
    {
        _367 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _661 = _367;
    float _663 = _655 * 2.0;
    float _665 = -_655;
    float _667 = fma(_657, _665, _63);
    float _669 = floor(_663);
    float _671 = _657 * _669;
    float _673 = _671 * 0.5;
    float _675 = _673 + _667;
    float _677 = fma(_69, _675, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _679 = fma(_675, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _683 = _677 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _687 = _679 + _685;
    float _689 = _683 * _683;
    float _691 = fma(_687, _687, _689);
    float _693 = fma(_132, _132, _691);
    float _695 = sqrt(_693);
    float _697 = -_317;
    float _699 = fma(_695, _309, _697);
    float _701 = precise::clamp(_699, 0.0, 1.0);
    float _703 = -_673;
    float _705 = fma(_703, _701, _675);
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _709 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _711 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _713 = _693;
    float _715 = _661;
    if (!_102)
    {
        float _717 = fma(_709, _661, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _136 = _717;
    }
    float _719 = _136;
    float _721 = _719;
    if (!_102)
    {
        float _723 = fma(_711, _661, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _124 = _723;
    }
    float _725 = _124;
    float _727 = _725;
    if (!_102)
    {
        float _729 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _721 = _729;
    }
    float _731 = _721;
    if (!_102)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _725);
        _713 = _733;
    }
    float _735 = _713;
    if (!_102)
    {
        float2 _2520 = float2(_735, _731);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2520, float2(0.0), isnan(_2520)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2520, float2(0.0), isnan(_2520)), level(0.0)).x;
        _727 = _737;
    }
    float _739 = _727;
    if (_102)
    {
        _286 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _741 = _286;
    float _743 = _741;
    if (_102)
    {
        _659 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _745 = _659;
    if (_102)
    {
        float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _741, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _715 = _747;
    }
    float _749 = _715;
    float _751 = _749;
    if (_102)
    {
        float _753 = fma(_707, _741, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _743 = _753;
    }
    float _755 = _743;
    float _757 = _755;
    if (_102)
    {
        float _759 = fma(_749, _745, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _751 = _759;
    }
    float _761 = _751;
    float _763 = _761;
    if (_102)
    {
        float _765 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_102)
    {
        float _771 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _761);
        _763 = _771;
    }
    float _773 = _763;
    float _775 = _773;
    if (_102)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _777;
    }
    float _779 = _769;
    float _781 = _739;
    float _783 = _779;
    if (_102)
    {
        float2 _2615 = float2(_779, _773);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2615, float2(0.0), isnan(_2615)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2615, float2(0.0), isnan(_2615)), level(0.0)).x;
        _781 = _785;
    }
    float _787 = _781;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = _707 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _805 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _807 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_807)
    {
        _783 = _707;
    }
    float _811 = _783;
    float _813 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _815 = _813 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _817 = _811;
    if (!_807)
    {
        _809 = _813;
    }
    float _819 = _809;
    float _821 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].x, _815);
    float _823 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _821);
    float _825 = _823 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _827 = _823;
    float _829 = _819;
    if (!_807)
    {
        _827 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _831 = _827;
    float _833 = _831;
    if (!_807)
    {
        _775 = _825;
    }
    float _835 = _775;
    bool _837 = !_807;
    float _839 = _835;
    if (!_837)
    {
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _843 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _845 = _801 + _843;
        float _847 = _813 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _849 = rsqrt(_799);
        float _851 = _845 * _841;
        float _853 = _851 * 0.15915493667125701904296875;
        float _855 = _853 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = _853 * 6.283185482025146484375;
        float _861 = sin(_859);
        float _863 = _857 + (-1.0);
        float _865 = fma(_861, _847, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _867 = _863 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _869 = _849 * _865;
        float _871 = fma(_813, _857, _867);
        float _873 = fma(_795, _869, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _875 = _871 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _877 = fma(_791, _869, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _879 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[2].x, _875);
        float _881 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].z, _879);
        float _883 = _881 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _829 = _871;
        _817 = _873;
        _833 = _877;
        _839 = _883;
    }
    float _885 = _829;
    float _887 = _817;
    float _889 = _833;
    float _891 = _839;
    float _893 = _885 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _895 = _885 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[1].x, _893);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[0].x, _895);
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[1].z, _897);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[0].z, _899);
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _907 = _905 != 0;
    float _909 = _901 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _913 = _909 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _915 = _909 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _917 = _909 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _919 = _909 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[7].x, _913);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[8].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
    float _929 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[7].z, _921);
    float _931 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[8].z, _923);
    float _933 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
    float _935 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
    float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _945 = !_907;
    float _947;
    float _949;
    float _951;
    int _953;
    int _955;
    int _957;
    int _959;
    int _961;
    int _963;
    int _965;
    int _967;
    float _969;
    float _971;
    float _973;
    float _975;
    float _977;
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
    int _1005;
    float _1007;
    float _1009;
    if (!_945)
    {
        _947 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _949 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _951 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _969 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _975 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1011 = true;
    }
    else
    {
        float _1013 = fma(_707, 6.2500002968590706586837768554688e-05, 0.5);
        float _1015 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3028 = float3(_1013, _1015, float(0));
        float3 _3032 = select(_3028, float3(0.0), isnan(_3028));
        float4 _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3032.xy, uint(rint(_3032.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3032.xy, uint(rint(_3032.z)), level(0.0)).xyzw;
        float _1020 = _1018.x;
        float _1022 = _1018.y;
        float _1024 = _1018.z;
        float _1026 = _1018.w;
        float3 _3047 = float3(_1013, _1015, float(1));
        float3 _3049 = select(_3047, float3(0.0), isnan(_3047));
        float4 _1028 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3049.xy, uint(rint(_3049.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3049.xy, uint(rint(_3049.z)), level(0.0)).xyzw;
        float _1030 = _1028.x;
        float _1032 = _1028.y;
        float _1034 = _1028.z;
        float _1036 = _1028.w;
        float3 _3064 = float3(_1013, _1015, float(2));
        float3 _3066 = select(_3064, float3(0.0), isnan(_3064));
        float4 _1038 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3066.xy, uint(rint(_3066.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3066.xy, uint(rint(_3066.z)), level(0.0)).xyzw;
        float _1040 = _1038.x;
        float _1042 = _1038.y;
        float _1044 = _1038.z;
        float _1046 = _1038.w;
        float3 _3081 = float3(_1013, _1015, float(3));
        float3 _3083 = select(_3081, float3(0.0), isnan(_3081));
        float4 _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3083.xy, uint(rint(_3083.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3083.xy, uint(rint(_3083.z)), level(0.0)).xyzw;
        float _1050 = _1048.x;
        float _1052 = _1048.y;
        float _1054 = _1048.z;
        float _1056 = _1048.w;
        float3 _3098 = float3(_1013, _1015, float(4));
        float3 _3100 = select(_3098, float3(0.0), isnan(_3098));
        float4 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3100.xy, uint(rint(_3100.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3100.xy, uint(rint(_3100.z)), level(0.0)).xyzw;
        float _1060 = _1058.x;
        float _1062 = _1058.y;
        float _1064 = _1058.z;
        float _1066 = _1058.w;
        float3 _3115 = float3(_1013, _1015, float(5));
        float3 _3117 = select(_3115, float3(0.0), isnan(_3115));
        float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3117.xy, uint(rint(_3117.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3117.xy, uint(rint(_3117.z)), level(0.0)).xyzw;
        float _1070 = _1068.x;
        float _1072 = _1068.y;
        float _1074 = _1068.z;
        float _1076 = _1068.w;
        float3 _3132 = float3(_1013, _1015, float(6));
        float3 _3134 = select(_3132, float3(0.0), isnan(_3132));
        float4 _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3134.xy, uint(rint(_3134.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3134.xy, uint(rint(_3134.z)), level(0.0)).xyzw;
        float _1080 = _1078.x;
        float _1082 = _1078.y;
        float _1084 = _1078.z;
        float _1086 = _1078.w;
        float3 _3149 = float3(_1013, _1015, float(7));
        float3 _3151 = select(_3149, float3(0.0), isnan(_3149));
        float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3151.xy, uint(rint(_3151.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3151.xy, uint(rint(_3151.z)), level(0.0)).xyzw;
        float _1090 = _1088.x;
        float _1092 = _1088.y;
        float _1094 = _1088.z;
        float _1096 = _1088.w;
        _947 = _1054;
        _949 = _1050;
        _951 = _1052;
        _953 = as_type<int>(_1056);
        _955 = as_type<int>(_1060);
        _957 = as_type<int>(_1062);
        _959 = as_type<int>(_1064);
        _961 = as_type<int>(_1066);
        _963 = as_type<int>(_1070);
        _965 = as_type<int>(_1072);
        _967 = as_type<int>(_1076);
        _969 = _1082;
        _971 = _1092;
        _973 = _1026;
        _975 = _1030;
        _977 = _1080;
        _979 = _1090;
        _981 = _1020;
        _983 = _1032;
        _985 = _1084;
        _987 = _1094;
        _989 = _1034;
        _991 = _1022;
        _993 = _1086;
        _995 = _1096;
        _997 = _1024;
        _999 = _1042;
        _1001 = _1036;
        _1003 = _1040;
        _1005 = as_type<int>(_1074);
        _1007 = _1044;
        _1009 = _1046;
    }
    _1011 = false;
    float _1098 = _947;
    float _1100 = _949;
    float _1102 = _951;
    int _1104 = _953;
    int _1106 = _955;
    int _1108 = _957;
    int _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    float _1120 = _969;
    float _1122 = _971;
    float _1124 = _973;
    float _1126 = _975;
    float _1128 = _977;
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
    int _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1164 = _813 + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1168 = _707 + _1166;
    float _1170 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1170;
    float _1174 = _1098 * 0.88622701168060302734375;
    float _1176 = _1164 * _1164;
    float _1178 = _1100 * 0.88622701168060302734375;
    float _1180 = _1102 * 0.88622701168060302734375;
    float _1182 = _907 ? as_type<float>(_1104) : 0.0;
    float _1184 = fma(_1168, _1168, _1176);
    float _1186 = _907 ? as_type<float>(_1106) : 0.0;
    out.gl_Position.x = _937;
    out.gl_Position.y = _939;
    out.gl_Position.z = _941;
    out.gl_Position.w = _943;
    float _1188 = _907 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1172, _1172, _1184);
    float _1192 = _907 ? _1178 : 0.0;
    out.m_45.x = _707;
    out.m_45.y = _813;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1194 = _907 ? _1180 : 0.0;
    float _1196 = _907 ? _1174 : 0.0;
    float _1198 = rsqrt(_1190);
    float _1200 = _907 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _805;
    out.m_47.w = _803;
    float _1202 = _907 ? as_type<float>(_1112) : 0.0;
    float _1204 = _907 ? as_type<float>(_1114) : 0.0;
    float _1206 = _907 ? as_type<float>(_1116) : 0.0;
    float _1208 = _907 ? as_type<float>(_1118) : 0.0;
    float _1210 = _1198 * 1.02332699298858642578125;
    float _1212 = _1172 * _1198;
    float _1214 = _1164 * _1210;
    float _1216 = _1212 * (-1.02332699298858642578125);
    float _1218 = _1168 * _1210;
    float _1220 = _1214 * _1120;
    float _1222 = _1214 * _1122;
    float _1224 = _1214 * _1124;
    float _1226 = _1214 * _1126;
    float _1228 = fma(_1128, 0.88622701168060302734375, _1220);
    float _1230 = fma(_1130, 0.88622701168060302734375, _1222);
    float _1232 = fma(_1132, 0.88622701168060302734375, _1224);
    float _1234 = _1214 * _1134;
    float _1236 = fma(_1216, _1136, _1228);
    float _1238 = fma(_1216, _1138, _1230);
    float _1240 = fma(_1216, _1140, _1232);
    float _1242 = fma(_1142, 0.88622701168060302734375, _1226);
    float _1244 = fma(_1218, _1144, _1236);
    float _1246 = fma(_1218, _1146, _1238);
    float _1248 = fma(_1148, 0.88622701168060302734375, _1234);
    float _1250 = fma(_1182, _1214, _1192);
    float _1252 = fma(_1186, _1214, _1194);
    float _1254 = precise::max(0.0, _1244);
    float _1256 = fma(_1188, _1214, _1196);
    float _1258 = precise::max(0.0, _1246);
    float _1260 = fma(_1218, _1150, _1240);
    float _1262 = fma(_1216, _1152, _1242);
    float _1264 = _1254 * 0.31830990314483642578125;
    float _1266 = precise::clamp(_1264, 0.0, 1.0);
    float _1268 = fma(_1216, _1154, _1248);
    float _1270 = fma(_1200, _1216, _1250);
    float _1272 = fma(_1202, _1216, _1252);
    float _1274 = _1266 * 0.88622701168060302734375;
    float _1276 = fma(_1204, _1216, _1256);
    float _1278 = _1258 * 0.31830990314483642578125;
    float _1280 = precise::clamp(_1278, 0.0, 1.0);
    float _1282 = _907 ? as_type<float>(_1156) : 0.0;
    float _1284 = fma(_1218, _1158, _1262);
    float _1286 = precise::max(0.0, _1260);
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1290 = fma(_1218, _1160, _1268);
    float _1292 = -_1280;
    float _1294 = _1292 + 1.0;
    float _1296 = fma(_1282, _1218, _1272);
    float _1298 = fma(_1206, _1218, _1270);
    float _1300 = fma(_1208, _1218, _1276);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1288);
    float _1304 = precise::max(0.0, _1284);
    float _1306 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1280);
    float _1308 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1310 = precise::max(0.0, _1290);
    float _1312 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1314 = precise::max(0.0, _1296);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1318 = precise::max(0.0, _1298);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1308);
    float _1322 = precise::max(0.0, _1300);
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1312);
    float _1326 = fma(_1314, _1316, _1320);
    float _1328 = fma(_1318, _1316, _1302);
    float _1330 = fma(_1322, _1316, _1324);
    out.m_49.x = _1328;
    out.m_49.y = _1326;
    out.m_49.z = _1330;
    out.m_49.w = _825;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

