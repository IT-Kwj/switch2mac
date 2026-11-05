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
    float4 m_45 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
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
    bool _917 = false;
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
        float2 _2426 = float2(_735, _731);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2426, float2(0.0), isnan(_2426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2426, float2(0.0), isnan(_2426)), level(0.0)).x;
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
    if (_102)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739;
    if (_102)
    {
        float2 _2519 = float2(_777, _773);
        float _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2519, float2(0.0), isnan(_2519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2519, float2(0.0), isnan(_2519)), level(0.0)).x;
        _779 = _781;
    }
    float _783 = _779;
    float _785 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _787 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _795 = _793 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _797 = _793 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _801 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[1].x, _795);
    float _803 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[0].x, _797);
    float _805 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].x, _799);
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _805);
    float _813 = _807 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _815 = _809 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _817 = _811 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _819 = _813 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _821 = _813 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _823 = _813 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _825 = _813 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _827 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[7].x, _819);
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[8].x, _821);
    float _831 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[9].x, _823);
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[10].x, _825);
    float _835 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[7].z, _827);
    float _837 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[8].z, _829);
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[9].z, _831);
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[10].z, _833);
    float _843 = _835 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _845 = _837 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _847 = _839 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _851 = !_791;
    float _853;
    float _855;
    float _857;
    int _859;
    int _861;
    int _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    float _875;
    float _877;
    float _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    float _893;
    float _895;
    float _897;
    float _899;
    float _901;
    float _903;
    float _905;
    float _907;
    float _909;
    int _911;
    float _913;
    float _915;
    if (!_851)
    {
        _853 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _875 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _877 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _917 = true;
    }
    else
    {
        float _919 = fma(_707, 6.2500002968590706586837768554688e-05, 0.5);
        float _921 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2783 = float3(_919, _921, float(0));
        float3 _2787 = select(_2783, float3(0.0), isnan(_2783));
        float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2787.xy, uint(rint(_2787.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2787.xy, uint(rint(_2787.z)), level(0.0)).xyzw;
        float _926 = _924.x;
        float _928 = _924.y;
        float _930 = _924.z;
        float _932 = _924.w;
        float3 _2802 = float3(_919, _921, float(1));
        float3 _2804 = select(_2802, float3(0.0), isnan(_2802));
        float4 _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _936 = _934.x;
        float _938 = _934.y;
        float _940 = _934.z;
        float _942 = _934.w;
        float3 _2819 = float3(_919, _921, float(2));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _946 = _944.x;
        float _948 = _944.y;
        float _950 = _944.z;
        float _952 = _944.w;
        float3 _2836 = float3(_919, _921, float(3));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _956 = _954.x;
        float _958 = _954.y;
        float _960 = _954.z;
        float _962 = _954.w;
        float3 _2853 = float3(_919, _921, float(4));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _964 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _966 = _964.x;
        float _968 = _964.y;
        float _970 = _964.z;
        float _972 = _964.w;
        float3 _2870 = float3(_919, _921, float(5));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _976 = _974.x;
        float _978 = _974.y;
        float _980 = _974.z;
        float _982 = _974.w;
        float3 _2887 = float3(_919, _921, float(6));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _986 = _984.x;
        float _988 = _984.y;
        float _990 = _984.z;
        float _992 = _984.w;
        float3 _2904 = float3(_919, _921, float(7));
        float3 _2906 = select(_2904, float3(0.0), isnan(_2904));
        float4 _994 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2906.xy, uint(rint(_2906.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2906.xy, uint(rint(_2906.z)), level(0.0)).xyzw;
        float _996 = _994.x;
        float _998 = _994.y;
        float _1000 = _994.z;
        float _1002 = _994.w;
        _853 = _960;
        _855 = _956;
        _857 = _958;
        _859 = as_type<int>(_962);
        _861 = as_type<int>(_966);
        _863 = as_type<int>(_968);
        _865 = as_type<int>(_970);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_976);
        _871 = as_type<int>(_978);
        _873 = as_type<int>(_982);
        _875 = _988;
        _877 = _998;
        _879 = _932;
        _881 = _936;
        _883 = _986;
        _885 = _996;
        _887 = _926;
        _889 = _938;
        _891 = _990;
        _893 = _1000;
        _895 = _940;
        _897 = _928;
        _899 = _992;
        _901 = _1002;
        _903 = _930;
        _905 = _948;
        _907 = _942;
        _909 = _946;
        _911 = as_type<int>(_980);
        _913 = _950;
        _915 = _952;
    }
    _917 = false;
    float _1004 = _853;
    float _1006 = _855;
    float _1008 = _857;
    int _1010 = _859;
    int _1012 = _861;
    int _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    float _1026 = _875;
    float _1028 = _877;
    float _1030 = _879;
    float _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = _889;
    float _1042 = _891;
    float _1044 = _893;
    float _1046 = _895;
    float _1048 = _897;
    float _1050 = _899;
    float _1052 = _901;
    float _1054 = _903;
    float _1056 = _905;
    float _1058 = _907;
    float _1060 = _909;
    int _1062 = _911;
    float _1064 = _913;
    float _1066 = _915;
    float _1068 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1070 = _793 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1074 = _707 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1076;
    float _1080 = _1004 * 0.88622701168060302734375;
    float _1082 = _1070 * _1070;
    float _1084 = _1006 * 0.88622701168060302734375;
    float _1086 = _1008 * 0.88622701168060302734375;
    float _1088 = _791 ? as_type<float>(_1010) : 0.0;
    float _1090 = fma(_1074, _1074, _1082);
    float _1092 = _791 ? as_type<float>(_1012) : 0.0;
    out.gl_Position.x = _843;
    out.gl_Position.y = _845;
    out.gl_Position.z = _847;
    out.gl_Position.w = _849;
    float _1094 = _791 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1078, _1078, _1090);
    float _1098 = _791 ? _1084 : 0.0;
    out.m_45.x = _707;
    out.m_45.y = _793;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1100 = _791 ? _1086 : 0.0;
    float _1102 = _791 ? _1080 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _791 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _787;
    out.m_47.w = _785;
    float _1108 = _791 ? as_type<float>(_1018) : 0.0;
    float _1110 = _791 ? as_type<float>(_1020) : 0.0;
    float _1112 = _791 ? as_type<float>(_1022) : 0.0;
    float _1114 = _791 ? as_type<float>(_1024) : 0.0;
    float _1116 = _1104 * 1.02332699298858642578125;
    float _1118 = _1078 * _1104;
    float _1120 = _1070 * _1116;
    float _1122 = _1118 * (-1.02332699298858642578125);
    float _1124 = _1074 * _1116;
    float _1126 = _1120 * _1026;
    float _1128 = _1120 * _1028;
    float _1130 = _1120 * _1030;
    float _1132 = _1120 * _1032;
    float _1134 = fma(_1034, 0.88622701168060302734375, _1126);
    float _1136 = fma(_1036, 0.88622701168060302734375, _1128);
    float _1138 = fma(_1038, 0.88622701168060302734375, _1130);
    float _1140 = _1120 * _1040;
    float _1142 = fma(_1122, _1042, _1134);
    float _1144 = fma(_1122, _1044, _1136);
    float _1146 = fma(_1122, _1046, _1138);
    float _1148 = fma(_1048, 0.88622701168060302734375, _1132);
    float _1150 = fma(_1124, _1050, _1142);
    float _1152 = fma(_1124, _1052, _1144);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1140);
    float _1156 = fma(_1088, _1120, _1098);
    float _1158 = fma(_1092, _1120, _1100);
    float _1160 = precise::max(0.0, _1150);
    float _1162 = fma(_1094, _1120, _1102);
    float _1164 = precise::max(0.0, _1152);
    float _1166 = fma(_1124, _1056, _1146);
    float _1168 = fma(_1122, _1058, _1148);
    float _1170 = _1160 * 0.31830990314483642578125;
    float _1172 = precise::clamp(_1170, 0.0, 1.0);
    float _1174 = fma(_1122, _1060, _1154);
    float _1176 = fma(_1106, _1122, _1156);
    float _1178 = fma(_1108, _1122, _1158);
    float _1180 = _1172 * 0.88622701168060302734375;
    float _1182 = fma(_1110, _1122, _1162);
    float _1184 = _1164 * 0.31830990314483642578125;
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = _791 ? as_type<float>(_1062) : 0.0;
    float _1190 = fma(_1124, _1064, _1168);
    float _1192 = precise::max(0.0, _1166);
    float _1194 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1196 = fma(_1124, _1066, _1174);
    float _1198 = -_1186;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_1188, _1124, _1178);
    float _1204 = fma(_1112, _1124, _1176);
    float _1206 = fma(_1114, _1124, _1182);
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1194);
    float _1210 = precise::max(0.0, _1190);
    float _1212 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1186);
    float _1214 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1216 = precise::max(0.0, _1196);
    float _1218 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1220 = precise::max(0.0, _1202);
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1224 = precise::max(0.0, _1204);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1214);
    float _1228 = precise::max(0.0, _1206);
    float _1230 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1218);
    float _1232 = fma(_1220, _1222, _1226);
    float _1234 = fma(_1224, _1222, _1208);
    float _1236 = fma(_1228, _1222, _1230);
    out.m_49.x = _1234;
    out.m_49.y = _1232;
    out.m_49.z = _1236;
    out.m_49.w = _817;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _917 = false;
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
        float2 _2426 = float2(_735, _731);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2426, float2(0.0), isnan(_2426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2426, float2(0.0), isnan(_2426)), level(0.0)).x;
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
    if (_102)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739;
    if (_102)
    {
        float2 _2519 = float2(_777, _773);
        float _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2519, float2(0.0), isnan(_2519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2519, float2(0.0), isnan(_2519)), level(0.0)).x;
        _779 = _781;
    }
    float _783 = _779;
    float _785 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _787 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _795 = _793 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _797 = _793 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _801 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[1].x, _795);
    float _803 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[0].x, _797);
    float _805 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].x, _799);
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _805);
    float _813 = _807 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _815 = _809 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _817 = _811 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _819 = _813 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _821 = _813 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _823 = _813 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _825 = _813 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _827 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[7].x, _819);
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[8].x, _821);
    float _831 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[9].x, _823);
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[10].x, _825);
    float _835 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[7].z, _827);
    float _837 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[8].z, _829);
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[9].z, _831);
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[10].z, _833);
    float _843 = _835 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _845 = _837 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _847 = _839 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _851 = !_791;
    float _853;
    float _855;
    float _857;
    int _859;
    int _861;
    int _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    float _875;
    float _877;
    float _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    float _893;
    float _895;
    float _897;
    float _899;
    float _901;
    float _903;
    float _905;
    float _907;
    float _909;
    int _911;
    float _913;
    float _915;
    if (!_851)
    {
        _853 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _875 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _877 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _917 = true;
    }
    else
    {
        float _919 = fma(_707, 6.2500002968590706586837768554688e-05, 0.5);
        float _921 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2783 = float3(_919, _921, float(0));
        float3 _2787 = select(_2783, float3(0.0), isnan(_2783));
        float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2787.xy, uint(rint(_2787.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2787.xy, uint(rint(_2787.z)), level(0.0)).xyzw;
        float _926 = _924.x;
        float _928 = _924.y;
        float _930 = _924.z;
        float _932 = _924.w;
        float3 _2802 = float3(_919, _921, float(1));
        float3 _2804 = select(_2802, float3(0.0), isnan(_2802));
        float4 _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _936 = _934.x;
        float _938 = _934.y;
        float _940 = _934.z;
        float _942 = _934.w;
        float3 _2819 = float3(_919, _921, float(2));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _946 = _944.x;
        float _948 = _944.y;
        float _950 = _944.z;
        float _952 = _944.w;
        float3 _2836 = float3(_919, _921, float(3));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _956 = _954.x;
        float _958 = _954.y;
        float _960 = _954.z;
        float _962 = _954.w;
        float3 _2853 = float3(_919, _921, float(4));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _964 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _966 = _964.x;
        float _968 = _964.y;
        float _970 = _964.z;
        float _972 = _964.w;
        float3 _2870 = float3(_919, _921, float(5));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _976 = _974.x;
        float _978 = _974.y;
        float _980 = _974.z;
        float _982 = _974.w;
        float3 _2887 = float3(_919, _921, float(6));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _986 = _984.x;
        float _988 = _984.y;
        float _990 = _984.z;
        float _992 = _984.w;
        float3 _2904 = float3(_919, _921, float(7));
        float3 _2906 = select(_2904, float3(0.0), isnan(_2904));
        float4 _994 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2906.xy, uint(rint(_2906.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2906.xy, uint(rint(_2906.z)), level(0.0)).xyzw;
        float _996 = _994.x;
        float _998 = _994.y;
        float _1000 = _994.z;
        float _1002 = _994.w;
        _853 = _960;
        _855 = _956;
        _857 = _958;
        _859 = as_type<int>(_962);
        _861 = as_type<int>(_966);
        _863 = as_type<int>(_968);
        _865 = as_type<int>(_970);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_976);
        _871 = as_type<int>(_978);
        _873 = as_type<int>(_982);
        _875 = _988;
        _877 = _998;
        _879 = _932;
        _881 = _936;
        _883 = _986;
        _885 = _996;
        _887 = _926;
        _889 = _938;
        _891 = _990;
        _893 = _1000;
        _895 = _940;
        _897 = _928;
        _899 = _992;
        _901 = _1002;
        _903 = _930;
        _905 = _948;
        _907 = _942;
        _909 = _946;
        _911 = as_type<int>(_980);
        _913 = _950;
        _915 = _952;
    }
    _917 = false;
    float _1004 = _853;
    float _1006 = _855;
    float _1008 = _857;
    int _1010 = _859;
    int _1012 = _861;
    int _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    float _1026 = _875;
    float _1028 = _877;
    float _1030 = _879;
    float _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = _889;
    float _1042 = _891;
    float _1044 = _893;
    float _1046 = _895;
    float _1048 = _897;
    float _1050 = _899;
    float _1052 = _901;
    float _1054 = _903;
    float _1056 = _905;
    float _1058 = _907;
    float _1060 = _909;
    int _1062 = _911;
    float _1064 = _913;
    float _1066 = _915;
    float _1068 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1070 = _793 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1074 = _707 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1076;
    float _1080 = _1004 * 0.88622701168060302734375;
    float _1082 = _1070 * _1070;
    float _1084 = _1006 * 0.88622701168060302734375;
    float _1086 = _1008 * 0.88622701168060302734375;
    float _1088 = _791 ? as_type<float>(_1010) : 0.0;
    float _1090 = fma(_1074, _1074, _1082);
    float _1092 = _791 ? as_type<float>(_1012) : 0.0;
    out.gl_Position.x = _843;
    out.gl_Position.y = _845;
    out.gl_Position.z = _847;
    out.gl_Position.w = _849;
    float _1094 = _791 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1078, _1078, _1090);
    float _1098 = _791 ? _1084 : 0.0;
    out.m_45.x = _707;
    out.m_45.y = _793;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1100 = _791 ? _1086 : 0.0;
    float _1102 = _791 ? _1080 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _791 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _787;
    out.m_47.w = _785;
    float _1108 = _791 ? as_type<float>(_1018) : 0.0;
    float _1110 = _791 ? as_type<float>(_1020) : 0.0;
    float _1112 = _791 ? as_type<float>(_1022) : 0.0;
    float _1114 = _791 ? as_type<float>(_1024) : 0.0;
    float _1116 = _1104 * 1.02332699298858642578125;
    float _1118 = _1078 * _1104;
    float _1120 = _1070 * _1116;
    float _1122 = _1118 * (-1.02332699298858642578125);
    float _1124 = _1074 * _1116;
    float _1126 = _1120 * _1026;
    float _1128 = _1120 * _1028;
    float _1130 = _1120 * _1030;
    float _1132 = _1120 * _1032;
    float _1134 = fma(_1034, 0.88622701168060302734375, _1126);
    float _1136 = fma(_1036, 0.88622701168060302734375, _1128);
    float _1138 = fma(_1038, 0.88622701168060302734375, _1130);
    float _1140 = _1120 * _1040;
    float _1142 = fma(_1122, _1042, _1134);
    float _1144 = fma(_1122, _1044, _1136);
    float _1146 = fma(_1122, _1046, _1138);
    float _1148 = fma(_1048, 0.88622701168060302734375, _1132);
    float _1150 = fma(_1124, _1050, _1142);
    float _1152 = fma(_1124, _1052, _1144);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1140);
    float _1156 = fma(_1088, _1120, _1098);
    float _1158 = fma(_1092, _1120, _1100);
    float _1160 = precise::max(0.0, _1150);
    float _1162 = fma(_1094, _1120, _1102);
    float _1164 = precise::max(0.0, _1152);
    float _1166 = fma(_1124, _1056, _1146);
    float _1168 = fma(_1122, _1058, _1148);
    float _1170 = _1160 * 0.31830990314483642578125;
    float _1172 = precise::clamp(_1170, 0.0, 1.0);
    float _1174 = fma(_1122, _1060, _1154);
    float _1176 = fma(_1106, _1122, _1156);
    float _1178 = fma(_1108, _1122, _1158);
    float _1180 = _1172 * 0.88622701168060302734375;
    float _1182 = fma(_1110, _1122, _1162);
    float _1184 = _1164 * 0.31830990314483642578125;
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = _791 ? as_type<float>(_1062) : 0.0;
    float _1190 = fma(_1124, _1064, _1168);
    float _1192 = precise::max(0.0, _1166);
    float _1194 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1196 = fma(_1124, _1066, _1174);
    float _1198 = -_1186;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_1188, _1124, _1178);
    float _1204 = fma(_1112, _1124, _1176);
    float _1206 = fma(_1114, _1124, _1182);
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1194);
    float _1210 = precise::max(0.0, _1190);
    float _1212 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1186);
    float _1214 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1216 = precise::max(0.0, _1196);
    float _1218 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1220 = precise::max(0.0, _1202);
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1224 = precise::max(0.0, _1204);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1214);
    float _1228 = precise::max(0.0, _1206);
    float _1230 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1218);
    float _1232 = fma(_1220, _1222, _1226);
    float _1234 = fma(_1224, _1222, _1208);
    float _1236 = fma(_1228, _1222, _1230);
    out.m_49.x = _1234;
    out.m_49.y = _1232;
    out.m_49.z = _1236;
    out.m_49.w = _817;
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
    bool _917 = false;
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
        float2 _2426 = float2(_735, _731);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2426, float2(0.0), isnan(_2426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2426, float2(0.0), isnan(_2426)), level(0.0)).x;
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
    if (_102)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739;
    if (_102)
    {
        float2 _2519 = float2(_777, _773);
        float _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2519, float2(0.0), isnan(_2519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2519, float2(0.0), isnan(_2519)), level(0.0)).x;
        _779 = _781;
    }
    float _783 = _779;
    float _785 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _787 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _795 = _793 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _797 = _793 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _801 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[1].x, _795);
    float _803 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[0].x, _797);
    float _805 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].x, _799);
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _805);
    float _813 = _807 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _815 = _809 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _817 = _811 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _819 = _813 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _821 = _813 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _823 = _813 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _825 = _813 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _827 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[7].x, _819);
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[8].x, _821);
    float _831 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[9].x, _823);
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c4)._m0[10].x, _825);
    float _835 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[7].z, _827);
    float _837 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[8].z, _829);
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[9].z, _831);
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[10].z, _833);
    float _843 = _835 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _845 = _837 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _847 = _839 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _851 = !_791;
    float _853;
    float _855;
    float _857;
    int _859;
    int _861;
    int _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    float _875;
    float _877;
    float _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    float _893;
    float _895;
    float _897;
    float _899;
    float _901;
    float _903;
    float _905;
    float _907;
    float _909;
    int _911;
    float _913;
    float _915;
    if (!_851)
    {
        _853 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _875 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _877 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _917 = true;
    }
    else
    {
        float _919 = fma(_707, 6.2500002968590706586837768554688e-05, 0.5);
        float _921 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2783 = float3(_919, _921, float(0));
        float3 _2787 = select(_2783, float3(0.0), isnan(_2783));
        float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2787.xy, uint(rint(_2787.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2787.xy, uint(rint(_2787.z)), level(0.0)).xyzw;
        float _926 = _924.x;
        float _928 = _924.y;
        float _930 = _924.z;
        float _932 = _924.w;
        float3 _2802 = float3(_919, _921, float(1));
        float3 _2804 = select(_2802, float3(0.0), isnan(_2802));
        float4 _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _936 = _934.x;
        float _938 = _934.y;
        float _940 = _934.z;
        float _942 = _934.w;
        float3 _2819 = float3(_919, _921, float(2));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _946 = _944.x;
        float _948 = _944.y;
        float _950 = _944.z;
        float _952 = _944.w;
        float3 _2836 = float3(_919, _921, float(3));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _956 = _954.x;
        float _958 = _954.y;
        float _960 = _954.z;
        float _962 = _954.w;
        float3 _2853 = float3(_919, _921, float(4));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _964 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _966 = _964.x;
        float _968 = _964.y;
        float _970 = _964.z;
        float _972 = _964.w;
        float3 _2870 = float3(_919, _921, float(5));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _976 = _974.x;
        float _978 = _974.y;
        float _980 = _974.z;
        float _982 = _974.w;
        float3 _2887 = float3(_919, _921, float(6));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _986 = _984.x;
        float _988 = _984.y;
        float _990 = _984.z;
        float _992 = _984.w;
        float3 _2904 = float3(_919, _921, float(7));
        float3 _2906 = select(_2904, float3(0.0), isnan(_2904));
        float4 _994 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2906.xy, uint(rint(_2906.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2906.xy, uint(rint(_2906.z)), level(0.0)).xyzw;
        float _996 = _994.x;
        float _998 = _994.y;
        float _1000 = _994.z;
        float _1002 = _994.w;
        _853 = _960;
        _855 = _956;
        _857 = _958;
        _859 = as_type<int>(_962);
        _861 = as_type<int>(_966);
        _863 = as_type<int>(_968);
        _865 = as_type<int>(_970);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_976);
        _871 = as_type<int>(_978);
        _873 = as_type<int>(_982);
        _875 = _988;
        _877 = _998;
        _879 = _932;
        _881 = _936;
        _883 = _986;
        _885 = _996;
        _887 = _926;
        _889 = _938;
        _891 = _990;
        _893 = _1000;
        _895 = _940;
        _897 = _928;
        _899 = _992;
        _901 = _1002;
        _903 = _930;
        _905 = _948;
        _907 = _942;
        _909 = _946;
        _911 = as_type<int>(_980);
        _913 = _950;
        _915 = _952;
    }
    _917 = false;
    float _1004 = _853;
    float _1006 = _855;
    float _1008 = _857;
    int _1010 = _859;
    int _1012 = _861;
    int _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    float _1026 = _875;
    float _1028 = _877;
    float _1030 = _879;
    float _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = _889;
    float _1042 = _891;
    float _1044 = _893;
    float _1046 = _895;
    float _1048 = _897;
    float _1050 = _899;
    float _1052 = _901;
    float _1054 = _903;
    float _1056 = _905;
    float _1058 = _907;
    float _1060 = _909;
    int _1062 = _911;
    float _1064 = _913;
    float _1066 = _915;
    float _1068 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1070 = _793 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1074 = _707 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1076;
    float _1080 = _1004 * 0.88622701168060302734375;
    float _1082 = _1070 * _1070;
    float _1084 = _1006 * 0.88622701168060302734375;
    float _1086 = _1008 * 0.88622701168060302734375;
    float _1088 = _791 ? as_type<float>(_1010) : 0.0;
    float _1090 = fma(_1074, _1074, _1082);
    float _1092 = _791 ? as_type<float>(_1012) : 0.0;
    out.gl_Position.x = _843;
    out.gl_Position.y = _845;
    out.gl_Position.z = _847;
    out.gl_Position.w = _849;
    float _1094 = _791 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1078, _1078, _1090);
    float _1098 = _791 ? _1084 : 0.0;
    out.m_45.x = _707;
    out.m_45.y = _793;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1100 = _791 ? _1086 : 0.0;
    float _1102 = _791 ? _1080 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _791 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _787;
    out.m_47.w = _785;
    float _1108 = _791 ? as_type<float>(_1018) : 0.0;
    float _1110 = _791 ? as_type<float>(_1020) : 0.0;
    float _1112 = _791 ? as_type<float>(_1022) : 0.0;
    float _1114 = _791 ? as_type<float>(_1024) : 0.0;
    float _1116 = _1104 * 1.02332699298858642578125;
    float _1118 = _1078 * _1104;
    float _1120 = _1070 * _1116;
    float _1122 = _1118 * (-1.02332699298858642578125);
    float _1124 = _1074 * _1116;
    float _1126 = _1120 * _1026;
    float _1128 = _1120 * _1028;
    float _1130 = _1120 * _1030;
    float _1132 = _1120 * _1032;
    float _1134 = fma(_1034, 0.88622701168060302734375, _1126);
    float _1136 = fma(_1036, 0.88622701168060302734375, _1128);
    float _1138 = fma(_1038, 0.88622701168060302734375, _1130);
    float _1140 = _1120 * _1040;
    float _1142 = fma(_1122, _1042, _1134);
    float _1144 = fma(_1122, _1044, _1136);
    float _1146 = fma(_1122, _1046, _1138);
    float _1148 = fma(_1048, 0.88622701168060302734375, _1132);
    float _1150 = fma(_1124, _1050, _1142);
    float _1152 = fma(_1124, _1052, _1144);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1140);
    float _1156 = fma(_1088, _1120, _1098);
    float _1158 = fma(_1092, _1120, _1100);
    float _1160 = precise::max(0.0, _1150);
    float _1162 = fma(_1094, _1120, _1102);
    float _1164 = precise::max(0.0, _1152);
    float _1166 = fma(_1124, _1056, _1146);
    float _1168 = fma(_1122, _1058, _1148);
    float _1170 = _1160 * 0.31830990314483642578125;
    float _1172 = precise::clamp(_1170, 0.0, 1.0);
    float _1174 = fma(_1122, _1060, _1154);
    float _1176 = fma(_1106, _1122, _1156);
    float _1178 = fma(_1108, _1122, _1158);
    float _1180 = _1172 * 0.88622701168060302734375;
    float _1182 = fma(_1110, _1122, _1162);
    float _1184 = _1164 * 0.31830990314483642578125;
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = _791 ? as_type<float>(_1062) : 0.0;
    float _1190 = fma(_1124, _1064, _1168);
    float _1192 = precise::max(0.0, _1166);
    float _1194 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1196 = fma(_1124, _1066, _1174);
    float _1198 = -_1186;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_1188, _1124, _1178);
    float _1204 = fma(_1112, _1124, _1176);
    float _1206 = fma(_1114, _1124, _1182);
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1194);
    float _1210 = precise::max(0.0, _1190);
    float _1212 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1186);
    float _1214 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1216 = precise::max(0.0, _1196);
    float _1218 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1220 = precise::max(0.0, _1202);
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1224 = precise::max(0.0, _1204);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1214);
    float _1228 = precise::max(0.0, _1206);
    float _1230 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1218);
    float _1232 = fma(_1220, _1222, _1226);
    float _1234 = fma(_1224, _1222, _1208);
    float _1236 = fma(_1228, _1222, _1230);
    out.m_49.x = _1234;
    out.m_49.y = _1232;
    out.m_49.z = _1236;
    out.m_49.w = _817;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

