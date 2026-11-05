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
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1013 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _76 = _74 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _94 = _76 == 80;
    bool _96 = _67 >= 0.5;
    bool _98 = isnan(_67);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _90 + _106;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _112 = _92 + _110;
    float _114 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _116 = _114;
    float _118 = _108 * _108;
    bool _120 = _76 == 96;
    float _122 = 0.0;
    float _124 = _116;
    float _126 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _128 = _122;
    float _130 = fma(_112, _112, _118);
    float _132 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _134 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _132;
    float _136 = _128;
    float _138 = _134;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _124;
    bool _142 = _76 == 112;
    float _144 = fma(_134, _134, _130);
    float _146 = _140;
    if (_82)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _136;
    float _150 = _148;
    if (_84)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    bool _154 = _76 == 128;
    float _156 = rsqrt(_144);
    float _158 = _152;
    if (_84)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _76 == 144;
    float _168 = _164;
    if (_86)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _76 == 160;
    float _178 = _174;
    if (_88)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _178;
    float _186 = _156 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _188 = _76 == 176;
    float _190 = _184;
    if (_94)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _182;
    bool _194 = _76 == 192;
    float _196 = log2(_186);
    float _198 = _192;
    if (_120)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_120)
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
    bool _210 = _76 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_154)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _76 == 224;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _216;
    float _226 = _196 + 1.2999999523162841796875;
    float _228 = _224;
    if (_166)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _222;
    bool _232 = _76 == 240;
    float _234 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _228;
    float _238 = trunc(_226);
    int _240 = int(_238);
    float _242 = _236;
    if (_176)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _234;
    bool _246 = _76 == 256;
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
    bool _256 = _76 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_194)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    bool _266 = _76 == 288;
    int _268 = min(_240, 15);
    float _270 = _264;
    if (_194)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    bool _274 = _76 == 304;
    float _276 = float(_268);
    float _278 = _272;
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _280 = _270;
    int _282 = _268 << 4;
    int _284 = _282 + 4288;
    float _286 = _280;
    float _288 = as_type<float>(_284);
    if (_210)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _290 = _278;
    float _292 = _290;
    if (_220)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _294 = _286;
    float _296 = -_276;
    float _298 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _300 = _76 == 320;
    int _302 = _284 + 8;
    uint _305 = uint(int(uint(_302) >> uint(2)));
    uint _307 = uint(int(uint(int(_305)) >> uint(2)));
    int _309 = int(_305) & 3;
    float _311 = (*spvDescriptorSet0.vp_c14)._m0[int(_307)][_309];
    int _313 = int(_305) + 1;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    int _317 = _313 & 3;
    float _319 = (*spvDescriptorSet0.vp_c14)._m0[int(_315)][_317];
    float _321 = _294;
    if (_220)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _323 = _292;
    float _325 = _298 + 1.0;
    float _327 = _323;
    if (_232)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _329 = _321;
    bool _331 = _76 == 336;
    float _333 = _329;
    if (_232)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _335 = _327;
    float _337 = exp2(_325);
    float _339 = _335;
    if (_246)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _341 = _333;
    bool _343 = _76 == 352;
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
    bool _353 = _76 == 368;
    float _355 = _351;
    if (_256)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _357 = _349;
    float _359 = _357;
    if (_266)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _361 = _355;
    bool _363 = _76 == 384;
    float _365 = 1.0 / _337;
    float _367 = _361;
    float _369 = _337;
    if (_266)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _371 = _359;
    float _373 = _371;
    if (_274)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _375 = _367;
    bool _377 = _76 == 400;
    float _379 = _375;
    if (_274)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _381 = _373;
    bool _383 = _76 == 416;
    float _385 = _381;
    if (_300)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _387 = _379;
    float _389 = _387;
    if (_300)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _391 = _385;
    float _393 = _391;
    if (_331)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _395 = _389;
    bool _397 = _76 == 432;
    float _399 = _395;
    if (_331)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _401 = _393;
    float _403 = _401;
    if (_343)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _405 = _399;
    bool _407 = _76 == 448;
    float _409 = _405;
    if (_343)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _411 = _403;
    float _413 = _411;
    if (_353)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _415 = _409;
    bool _417 = _76 == 464;
    float _419 = _415;
    if (_353)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _421 = _413;
    float _423 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _425 = _419;
    bool _427 = _76 == 480;
    float _429 = _425;
    if (_363)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _431 = _423;
    float _433 = _431;
    if (_377)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _435 = _429;
    bool _437 = _76 == 496;
    float _439 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _441 = _433;
    float _443 = _441;
    if (_383)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _445 = _439;
    bool _447 = _76 == 512;
    float _449 = _445;
    if (_383)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _451 = _443;
    bool _453 = _76 == 528;
    float _455 = _451;
    if (_397)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _457 = _449;
    float _459 = _457;
    if (_397)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _461 = _455;
    float _463 = _461;
    if (_407)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _465 = _459;
    bool _467 = _76 == 544;
    float _469 = _465;
    if (_407)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _471 = _463;
    float _473 = _471;
    if (_417)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _475 = _469;
    bool _477 = _76 == 560;
    float _479 = _475;
    if (_417)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _481 = _473;
    float _483 = _481;
    if (_427)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _485 = _479;
    bool _487 = _76 == 576;
    float _489 = _485;
    if (_427)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _491 = _483;
    float _493 = _491;
    if (_437)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _495 = _489;
    bool _497 = _76 == 592;
    float _499 = _495;
    if (_437)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _501 = _493;
    float _503 = _501;
    if (_447)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _505 = _499;
    bool _507 = _76 == 608;
    float _509 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _511 = _503;
    float _513 = _511;
    if (_453)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _515 = _509;
    bool _517 = _76 == 624;
    float _519 = _515;
    if (_453)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _521 = _513;
    bool _523 = _76 == 640;
    float _525 = _521;
    if (_467)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _527 = _519;
    float _529 = _527;
    if (_467)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _531 = _525;
    float _533 = _531;
    if (_477)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _535 = _529;
    bool _537 = _76 == 656;
    float _539 = _535;
    if (_477)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _541 = _533;
    float _543 = _541;
    if (_487)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _545 = _539;
    bool _547 = _76 == 672;
    float _549 = _545;
    if (_487)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _551 = _543;
    float _553 = _551;
    if (_497)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _555 = _549;
    bool _557 = _76 == 688;
    float _559 = _555;
    if (_497)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _561 = _553;
    float _563 = _561;
    if (_507)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _565 = _559;
    bool _567 = _76 == 704;
    float _569 = _565;
    if (_507)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _571 = _563;
    float _573 = _571;
    if (_517)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _575 = _569;
    bool _577 = _76 == 720;
    float _579 = _575;
    if (_517)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _581 = _573;
    float _583 = _581;
    if (_523)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _585 = _579;
    bool _587 = _76 == 736;
    float _589 = _585;
    if (_523)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _591 = _583;
    bool _593 = _76 == 752;
    float _595 = _591;
    if (_537)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _597 = _589;
    float _599 = _597;
    if (_547)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_557)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_567)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _609 = _607;
    float _611 = _609;
    if (_577)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _613 = _611;
    float _615 = _613;
    if (_587)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _617 = _615;
    float _619 = _617;
    if (_593)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _621 = _619;
    float _623 = _365 * _621;
    if (_537)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _625 = _595;
    float _627 = _625;
    if (_547)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _629 = _627;
    float _631 = _623 * _65;
    float _633 = _629;
    if (_557)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _635 = _633;
    float _637 = _635;
    if (_567)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _639 = _637;
    float _641 = floor(_631);
    float _643 = _639;
    if (_577)
    {
        _643 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _645 = _643;
    float _647 = _645;
    if (_587)
    {
        _647 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _649 = _647;
    float _651 = _649;
    if (_593)
    {
        _651 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _653 = _651;
    float _655 = -_641;
    float _657 = _631 + _655;
    float _659 = _337 * _653;
    float _661 = _657;
    if (!_104)
    {
        _369 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _663 = _369;
    float _665 = _657 * 2.0;
    float _667 = -_657;
    float _669 = fma(_659, _667, _65);
    float _671 = floor(_665);
    float _673 = _659 * _671;
    float _675 = _673 * 0.5;
    float _677 = _675 + _669;
    float _679 = fma(_71, _677, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _681 = fma(_677, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _683 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _685 = _679 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _689 = _681 + _687;
    float _691 = _685 * _685;
    float _693 = fma(_689, _689, _691);
    float _695 = fma(_134, _134, _693);
    float _697 = sqrt(_695);
    float _699 = -_319;
    float _701 = fma(_697, _311, _699);
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = -_675;
    float _707 = fma(_705, _703, _677);
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _711 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _713 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _715 = _695;
    float _717 = _663;
    if (!_104)
    {
        float _719 = fma(_711, _663, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _138 = _719;
    }
    float _721 = _138;
    float _723 = _721;
    if (!_104)
    {
        float _725 = fma(_713, _663, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _126 = _725;
    }
    float _727 = _126;
    float _729 = _727;
    if (!_104)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _721);
        _723 = _731;
    }
    float _733 = _723;
    if (!_104)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _715 = _735;
    }
    float _737 = _715;
    if (!_104)
    {
        float2 _2522 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2522, float2(0.0), isnan(_2522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2522, float2(0.0), isnan(_2522)), level(0.0)).x;
        _729 = _739;
    }
    float _741 = _729;
    if (_104)
    {
        _288 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _288;
    float _745 = _743;
    if (_104)
    {
        _661 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _661;
    if (_104)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _717 = _749;
    }
    float _751 = _717;
    float _753 = _751;
    if (_104)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_104)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_104)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_104)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    float _777 = _775;
    if (_104)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _779;
    }
    float _781 = _771;
    float _783 = _741;
    float _785 = _781;
    if (_104)
    {
        float2 _2617 = float2(_781, _775);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2617, float2(0.0), isnan(_2617)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2617, float2(0.0), isnan(_2617)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = _709 + _795;
    float _799 = _793 * _793;
    float _801 = fma(_797, _797, _799);
    float _803 = sqrt(_801);
    float _805 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _807 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _809 = _803 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _811 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_809)
    {
        _785 = _709;
    }
    float _813 = _785;
    float _815 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _817 = _815 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _819 = _813;
    if (!_809)
    {
        _811 = _815;
    }
    float _821 = _811;
    float _823 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].x, _817);
    float _825 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _823);
    float _827 = _825 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _829 = _825;
    float _831 = _821;
    if (!_809)
    {
        _829 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _833 = _829;
    float _835 = _833;
    if (!_809)
    {
        _777 = _827;
    }
    float _837 = _777;
    bool _839 = !_809;
    float _841 = _837;
    if (!_839)
    {
        float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _847 = _803 + _845;
        float _849 = _815 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = rsqrt(_801);
        float _853 = _847 * _843;
        float _855 = _853 * 0.15915493667125701904296875;
        float _857 = _855 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 + (-1.0);
        float _867 = fma(_863, _849, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _869 = _865 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _871 = _851 * _867;
        float _873 = fma(_815, _859, _869);
        float _875 = fma(_797, _871, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _877 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _879 = fma(_793, _871, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _881 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _877);
        float _883 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[2].z, _881);
        float _885 = _883 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _831 = _873;
        _819 = _875;
        _835 = _879;
        _841 = _885;
    }
    float _887 = _831;
    float _889 = _819;
    float _891 = _835;
    float _893 = _841;
    float _895 = _887 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _897 = _887 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[1].x, _895);
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[0].x, _897);
    float _903 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[1].z, _899);
    float _905 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[0].z, _901);
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _909 = _907 != 0;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _915 = _911 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _917 = _911 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _921 = _911 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[7].x, _915);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[8].x, _917);
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[9].x, _919);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[10].x, _921);
    float _931 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[7].z, _923);
    float _933 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[8].z, _925);
    float _935 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[9].z, _927);
    float _937 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[10].z, _929);
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _947 = !_909;
    float _949;
    float _951;
    float _953;
    int _955;
    int _957;
    int _959;
    int _961;
    int _963;
    int _965;
    int _967;
    int _969;
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
    float _1011;
    if (!_947)
    {
        _949 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _951 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _953 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _971 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _975 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1013 = true;
    }
    else
    {
        float _1015 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _1017 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3030 = float3(_1015, _1017, float(0));
        float3 _3034 = select(_3030, float3(0.0), isnan(_3030));
        float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3034.xy, uint(rint(_3034.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3034.xy, uint(rint(_3034.z)), level(0.0)).xyzw;
        float _1022 = _1020.x;
        float _1024 = _1020.y;
        float _1026 = _1020.z;
        float _1028 = _1020.w;
        float3 _3049 = float3(_1015, _1017, float(1));
        float3 _3051 = select(_3049, float3(0.0), isnan(_3049));
        float4 _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3051.xy, uint(rint(_3051.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3051.xy, uint(rint(_3051.z)), level(0.0)).xyzw;
        float _1032 = _1030.x;
        float _1034 = _1030.y;
        float _1036 = _1030.z;
        float _1038 = _1030.w;
        float3 _3066 = float3(_1015, _1017, float(2));
        float3 _3068 = select(_3066, float3(0.0), isnan(_3066));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3068.xy, uint(rint(_3068.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3068.xy, uint(rint(_3068.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3083 = float3(_1015, _1017, float(3));
        float3 _3085 = select(_3083, float3(0.0), isnan(_3083));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3085.xy, uint(rint(_3085.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3085.xy, uint(rint(_3085.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3100 = float3(_1015, _1017, float(4));
        float3 _3102 = select(_3100, float3(0.0), isnan(_3100));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3102.xy, uint(rint(_3102.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3102.xy, uint(rint(_3102.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3117 = float3(_1015, _1017, float(5));
        float3 _3119 = select(_3117, float3(0.0), isnan(_3117));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3119.xy, uint(rint(_3119.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3119.xy, uint(rint(_3119.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3134 = float3(_1015, _1017, float(6));
        float3 _3136 = select(_3134, float3(0.0), isnan(_3134));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3136.xy, uint(rint(_3136.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3136.xy, uint(rint(_3136.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3151 = float3(_1015, _1017, float(7));
        float3 _3153 = select(_3151, float3(0.0), isnan(_3151));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3153.xy, uint(rint(_3153.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3153.xy, uint(rint(_3153.z)), level(0.0)).xyzw;
        float _1092 = _1090.x;
        float _1094 = _1090.y;
        float _1096 = _1090.z;
        float _1098 = _1090.w;
        _949 = _1056;
        _951 = _1052;
        _953 = _1054;
        _955 = as_type<int>(_1058);
        _957 = as_type<int>(_1062);
        _959 = as_type<int>(_1064);
        _961 = as_type<int>(_1066);
        _963 = as_type<int>(_1068);
        _965 = as_type<int>(_1072);
        _967 = as_type<int>(_1074);
        _969 = as_type<int>(_1078);
        _971 = _1084;
        _973 = _1094;
        _975 = _1034;
        _977 = _1028;
        _979 = _1082;
        _981 = _1092;
        _983 = _1032;
        _985 = _1026;
        _987 = _1086;
        _989 = _1096;
        _991 = _1022;
        _993 = _1024;
        _995 = _1088;
        _997 = _1098;
        _999 = _1042;
        _1001 = _1036;
        _1003 = _1038;
        _1005 = as_type<int>(_1076);
        _1007 = _1048;
        _1009 = _1044;
        _1011 = _1046;
    }
    _1013 = false;
    float _1100 = _949;
    float _1102 = _951;
    float _1104 = _953;
    int _1106 = _955;
    int _1108 = _957;
    int _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    int _1120 = _969;
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
    float _1162 = _1011;
    float _1164 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1166 = _815 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1170 = _709 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1172;
    float _1176 = _1100 * 0.88622701168060302734375;
    float _1178 = _1166 * _1166;
    out.gl_Position.x = _939;
    out.gl_Position.y = _941;
    out.gl_Position.z = _943;
    out.gl_Position.w = _945;
    float _1180 = _1102 * 0.88622701168060302734375;
    float _1182 = _1104 * 0.88622701168060302734375;
    float _1184 = fma(_1170, _1170, _1178);
    float _1186 = _909 ? as_type<float>(_1106) : 0.0;
    out.m_45.x = _709;
    out.m_45.y = _815;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1188 = _909 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1174, _1174, _1184);
    float _1192 = _909 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _807;
    out.m_47.w = _805;
    float _1194 = _909 ? _1180 : 0.0;
    float _1196 = _909 ? _1182 : 0.0;
    float _1198 = rsqrt(_1190);
    float _1200 = _909 ? _1176 : 0.0;
    float _1202 = _909 ? as_type<float>(_1112) : 0.0;
    float _1204 = _909 ? as_type<float>(_1114) : 0.0;
    float _1206 = _909 ? as_type<float>(_1116) : 0.0;
    float _1208 = _909 ? as_type<float>(_1118) : 0.0;
    float _1210 = _909 ? as_type<float>(_1120) : 0.0;
    float _1212 = _1198 * 1.02332699298858642578125;
    float _1214 = _1174 * _1198;
    float _1216 = _1166 * _1212;
    float _1218 = _1214 * (-1.02332699298858642578125);
    float _1220 = _1170 * _1212;
    float _1222 = _1216 * _1122;
    float _1224 = _1216 * _1124;
    float _1226 = _1216 * _1126;
    float _1228 = _1216 * _1128;
    float _1230 = fma(_1130, 0.88622701168060302734375, _1222);
    float _1232 = fma(_1132, 0.88622701168060302734375, _1224);
    float _1234 = _1216 * _1134;
    float _1236 = fma(_1136, 0.88622701168060302734375, _1226);
    float _1238 = fma(_1218, _1138, _1230);
    float _1240 = fma(_1218, _1140, _1232);
    float _1242 = fma(_1142, 0.88622701168060302734375, _1228);
    float _1244 = fma(_1144, 0.88622701168060302734375, _1234);
    float _1246 = fma(_1220, _1146, _1238);
    float _1248 = fma(_1220, _1148, _1240);
    float _1250 = fma(_1186, _1216, _1194);
    float _1252 = fma(_1188, _1216, _1196);
    float _1254 = fma(_1192, _1216, _1200);
    float _1256 = precise::max(0.0, _1246);
    float _1258 = fma(_1218, _1150, _1236);
    float _1260 = precise::max(0.0, _1248);
    float _1262 = fma(_1218, _1152, _1242);
    float _1264 = fma(_1218, _1154, _1244);
    float _1266 = _1256 * 0.31830990314483642578125;
    float _1268 = precise::clamp(_1266, 0.0, 1.0);
    float _1270 = fma(_1202, _1218, _1250);
    float _1272 = _1260 * 0.31830990314483642578125;
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = fma(_1204, _1218, _1252);
    float _1278 = fma(_1206, _1218, _1254);
    float _1280 = _909 ? as_type<float>(_1156) : 0.0;
    float _1282 = fma(_1220, _1158, _1258);
    float _1284 = fma(_1220, _1160, _1262);
    float _1286 = fma(_1220, _1162, _1264);
    float _1288 = _1268 * 0.88622701168060302734375;
    float _1290 = -_1274;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_1208, _1220, _1270);
    float _1296 = fma(_1280, _1220, _1276);
    float _1298 = fma(_1210, _1220, _1278);
    float _1300 = precise::max(0.0, _1282);
    float _1302 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1274);
    float _1304 = precise::max(0.0, _1284);
    float _1306 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1308 = precise::max(0.0, _1286);
    float _1310 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1312 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = precise::max(0.0, _1294);
    float _1316 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1306);
    float _1318 = precise::max(0.0, _1296);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1310);
    float _1322 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1324 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1326 = precise::max(0.0, _1298);
    float _1328 = fma(_1314, _1322, _1320);
    float _1330 = fma(_1318, _1322, _1324);
    float _1332 = fma(_1326, _1322, _1316);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1328;
    out.m_51.y = _1330;
    out.m_51.z = _1332;
    out.m_51.w = _827;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1013 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _76 = _74 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _94 = _76 == 80;
    bool _96 = _67 >= 0.5;
    bool _98 = isnan(_67);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _90 + _106;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _112 = _92 + _110;
    float _114 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _116 = _114;
    float _118 = _108 * _108;
    bool _120 = _76 == 96;
    float _122 = 0.0;
    float _124 = _116;
    float _126 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _128 = _122;
    float _130 = fma(_112, _112, _118);
    float _132 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _134 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _132;
    float _136 = _128;
    float _138 = _134;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _124;
    bool _142 = _76 == 112;
    float _144 = fma(_134, _134, _130);
    float _146 = _140;
    if (_82)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _136;
    float _150 = _148;
    if (_84)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    bool _154 = _76 == 128;
    float _156 = rsqrt(_144);
    float _158 = _152;
    if (_84)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _76 == 144;
    float _168 = _164;
    if (_86)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _76 == 160;
    float _178 = _174;
    if (_88)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _178;
    float _186 = _156 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _188 = _76 == 176;
    float _190 = _184;
    if (_94)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _182;
    bool _194 = _76 == 192;
    float _196 = log2(_186);
    float _198 = _192;
    if (_120)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_120)
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
    bool _210 = _76 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_154)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _76 == 224;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _216;
    float _226 = _196 + 1.2999999523162841796875;
    float _228 = _224;
    if (_166)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _222;
    bool _232 = _76 == 240;
    float _234 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _228;
    float _238 = trunc(_226);
    int _240 = int(_238);
    float _242 = _236;
    if (_176)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _234;
    bool _246 = _76 == 256;
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
    bool _256 = _76 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_194)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    bool _266 = _76 == 288;
    int _268 = min(_240, 15);
    float _270 = _264;
    if (_194)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    bool _274 = _76 == 304;
    float _276 = float(_268);
    float _278 = _272;
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _280 = _270;
    int _282 = _268 << 4;
    int _284 = _282 + 4288;
    float _286 = _280;
    float _288 = as_type<float>(_284);
    if (_210)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _290 = _278;
    float _292 = _290;
    if (_220)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _294 = _286;
    float _296 = -_276;
    float _298 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _300 = _76 == 320;
    int _302 = _284 + 8;
    uint _305 = uint(int(uint(_302) >> uint(2)));
    uint _307 = uint(int(uint(int(_305)) >> uint(2)));
    int _309 = int(_305) & 3;
    float _311 = (*spvDescriptorSet0.vp_c14)._m0[int(_307)][_309];
    int _313 = int(_305) + 1;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    int _317 = _313 & 3;
    float _319 = (*spvDescriptorSet0.vp_c14)._m0[int(_315)][_317];
    float _321 = _294;
    if (_220)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _323 = _292;
    float _325 = _298 + 1.0;
    float _327 = _323;
    if (_232)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _329 = _321;
    bool _331 = _76 == 336;
    float _333 = _329;
    if (_232)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _335 = _327;
    float _337 = exp2(_325);
    float _339 = _335;
    if (_246)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _341 = _333;
    bool _343 = _76 == 352;
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
    bool _353 = _76 == 368;
    float _355 = _351;
    if (_256)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _357 = _349;
    float _359 = _357;
    if (_266)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _361 = _355;
    bool _363 = _76 == 384;
    float _365 = 1.0 / _337;
    float _367 = _361;
    float _369 = _337;
    if (_266)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _371 = _359;
    float _373 = _371;
    if (_274)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _375 = _367;
    bool _377 = _76 == 400;
    float _379 = _375;
    if (_274)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _381 = _373;
    bool _383 = _76 == 416;
    float _385 = _381;
    if (_300)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _387 = _379;
    float _389 = _387;
    if (_300)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _391 = _385;
    float _393 = _391;
    if (_331)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _395 = _389;
    bool _397 = _76 == 432;
    float _399 = _395;
    if (_331)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _401 = _393;
    float _403 = _401;
    if (_343)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _405 = _399;
    bool _407 = _76 == 448;
    float _409 = _405;
    if (_343)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _411 = _403;
    float _413 = _411;
    if (_353)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _415 = _409;
    bool _417 = _76 == 464;
    float _419 = _415;
    if (_353)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _421 = _413;
    float _423 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _425 = _419;
    bool _427 = _76 == 480;
    float _429 = _425;
    if (_363)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _431 = _423;
    float _433 = _431;
    if (_377)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _435 = _429;
    bool _437 = _76 == 496;
    float _439 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _441 = _433;
    float _443 = _441;
    if (_383)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _445 = _439;
    bool _447 = _76 == 512;
    float _449 = _445;
    if (_383)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _451 = _443;
    bool _453 = _76 == 528;
    float _455 = _451;
    if (_397)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _457 = _449;
    float _459 = _457;
    if (_397)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _461 = _455;
    float _463 = _461;
    if (_407)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _465 = _459;
    bool _467 = _76 == 544;
    float _469 = _465;
    if (_407)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _471 = _463;
    float _473 = _471;
    if (_417)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _475 = _469;
    bool _477 = _76 == 560;
    float _479 = _475;
    if (_417)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _481 = _473;
    float _483 = _481;
    if (_427)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _485 = _479;
    bool _487 = _76 == 576;
    float _489 = _485;
    if (_427)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _491 = _483;
    float _493 = _491;
    if (_437)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _495 = _489;
    bool _497 = _76 == 592;
    float _499 = _495;
    if (_437)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _501 = _493;
    float _503 = _501;
    if (_447)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _505 = _499;
    bool _507 = _76 == 608;
    float _509 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _511 = _503;
    float _513 = _511;
    if (_453)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _515 = _509;
    bool _517 = _76 == 624;
    float _519 = _515;
    if (_453)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _521 = _513;
    bool _523 = _76 == 640;
    float _525 = _521;
    if (_467)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _527 = _519;
    float _529 = _527;
    if (_467)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _531 = _525;
    float _533 = _531;
    if (_477)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _535 = _529;
    bool _537 = _76 == 656;
    float _539 = _535;
    if (_477)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _541 = _533;
    float _543 = _541;
    if (_487)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _545 = _539;
    bool _547 = _76 == 672;
    float _549 = _545;
    if (_487)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _551 = _543;
    float _553 = _551;
    if (_497)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _555 = _549;
    bool _557 = _76 == 688;
    float _559 = _555;
    if (_497)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _561 = _553;
    float _563 = _561;
    if (_507)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _565 = _559;
    bool _567 = _76 == 704;
    float _569 = _565;
    if (_507)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _571 = _563;
    float _573 = _571;
    if (_517)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _575 = _569;
    bool _577 = _76 == 720;
    float _579 = _575;
    if (_517)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _581 = _573;
    float _583 = _581;
    if (_523)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _585 = _579;
    bool _587 = _76 == 736;
    float _589 = _585;
    if (_523)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _591 = _583;
    bool _593 = _76 == 752;
    float _595 = _591;
    if (_537)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _597 = _589;
    float _599 = _597;
    if (_547)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_557)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_567)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _609 = _607;
    float _611 = _609;
    if (_577)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _613 = _611;
    float _615 = _613;
    if (_587)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _617 = _615;
    float _619 = _617;
    if (_593)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _621 = _619;
    float _623 = _365 * _621;
    if (_537)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _625 = _595;
    float _627 = _625;
    if (_547)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _629 = _627;
    float _631 = _623 * _65;
    float _633 = _629;
    if (_557)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _635 = _633;
    float _637 = _635;
    if (_567)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _639 = _637;
    float _641 = floor(_631);
    float _643 = _639;
    if (_577)
    {
        _643 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _645 = _643;
    float _647 = _645;
    if (_587)
    {
        _647 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _649 = _647;
    float _651 = _649;
    if (_593)
    {
        _651 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _653 = _651;
    float _655 = -_641;
    float _657 = _631 + _655;
    float _659 = _337 * _653;
    float _661 = _657;
    if (!_104)
    {
        _369 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _663 = _369;
    float _665 = _657 * 2.0;
    float _667 = -_657;
    float _669 = fma(_659, _667, _65);
    float _671 = floor(_665);
    float _673 = _659 * _671;
    float _675 = _673 * 0.5;
    float _677 = _675 + _669;
    float _679 = fma(_71, _677, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _681 = fma(_677, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _683 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _685 = _679 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _689 = _681 + _687;
    float _691 = _685 * _685;
    float _693 = fma(_689, _689, _691);
    float _695 = fma(_134, _134, _693);
    float _697 = sqrt(_695);
    float _699 = -_319;
    float _701 = fma(_697, _311, _699);
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = -_675;
    float _707 = fma(_705, _703, _677);
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _711 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _713 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _715 = _695;
    float _717 = _663;
    if (!_104)
    {
        float _719 = fma(_711, _663, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _138 = _719;
    }
    float _721 = _138;
    float _723 = _721;
    if (!_104)
    {
        float _725 = fma(_713, _663, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _126 = _725;
    }
    float _727 = _126;
    float _729 = _727;
    if (!_104)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _721);
        _723 = _731;
    }
    float _733 = _723;
    if (!_104)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _715 = _735;
    }
    float _737 = _715;
    if (!_104)
    {
        float2 _2522 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2522, float2(0.0), isnan(_2522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2522, float2(0.0), isnan(_2522)), level(0.0)).x;
        _729 = _739;
    }
    float _741 = _729;
    if (_104)
    {
        _288 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _288;
    float _745 = _743;
    if (_104)
    {
        _661 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _661;
    if (_104)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _717 = _749;
    }
    float _751 = _717;
    float _753 = _751;
    if (_104)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_104)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_104)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_104)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    float _777 = _775;
    if (_104)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _779;
    }
    float _781 = _771;
    float _783 = _741;
    float _785 = _781;
    if (_104)
    {
        float2 _2617 = float2(_781, _775);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2617, float2(0.0), isnan(_2617)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2617, float2(0.0), isnan(_2617)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = _709 + _795;
    float _799 = _793 * _793;
    float _801 = fma(_797, _797, _799);
    float _803 = sqrt(_801);
    float _805 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _807 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _809 = _803 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _811 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_809)
    {
        _785 = _709;
    }
    float _813 = _785;
    float _815 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _817 = _815 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _819 = _813;
    if (!_809)
    {
        _811 = _815;
    }
    float _821 = _811;
    float _823 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].x, _817);
    float _825 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _823);
    float _827 = _825 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _829 = _825;
    float _831 = _821;
    if (!_809)
    {
        _829 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _833 = _829;
    float _835 = _833;
    if (!_809)
    {
        _777 = _827;
    }
    float _837 = _777;
    bool _839 = !_809;
    float _841 = _837;
    if (!_839)
    {
        float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _847 = _803 + _845;
        float _849 = _815 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = rsqrt(_801);
        float _853 = _847 * _843;
        float _855 = _853 * 0.15915493667125701904296875;
        float _857 = _855 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 + (-1.0);
        float _867 = fma(_863, _849, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _869 = _865 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _871 = _851 * _867;
        float _873 = fma(_815, _859, _869);
        float _875 = fma(_797, _871, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _877 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _879 = fma(_793, _871, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _881 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _877);
        float _883 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[2].z, _881);
        float _885 = _883 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _831 = _873;
        _819 = _875;
        _835 = _879;
        _841 = _885;
    }
    float _887 = _831;
    float _889 = _819;
    float _891 = _835;
    float _893 = _841;
    float _895 = _887 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _897 = _887 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[1].x, _895);
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[0].x, _897);
    float _903 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[1].z, _899);
    float _905 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[0].z, _901);
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _909 = _907 != 0;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _915 = _911 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _917 = _911 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _921 = _911 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[7].x, _915);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[8].x, _917);
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[9].x, _919);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[10].x, _921);
    float _931 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[7].z, _923);
    float _933 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[8].z, _925);
    float _935 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[9].z, _927);
    float _937 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[10].z, _929);
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _947 = !_909;
    float _949;
    float _951;
    float _953;
    int _955;
    int _957;
    int _959;
    int _961;
    int _963;
    int _965;
    int _967;
    int _969;
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
    float _1011;
    if (!_947)
    {
        _949 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _951 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _953 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _971 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _975 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1013 = true;
    }
    else
    {
        float _1015 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _1017 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3030 = float3(_1015, _1017, float(0));
        float3 _3034 = select(_3030, float3(0.0), isnan(_3030));
        float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3034.xy, uint(rint(_3034.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3034.xy, uint(rint(_3034.z)), level(0.0)).xyzw;
        float _1022 = _1020.x;
        float _1024 = _1020.y;
        float _1026 = _1020.z;
        float _1028 = _1020.w;
        float3 _3049 = float3(_1015, _1017, float(1));
        float3 _3051 = select(_3049, float3(0.0), isnan(_3049));
        float4 _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3051.xy, uint(rint(_3051.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3051.xy, uint(rint(_3051.z)), level(0.0)).xyzw;
        float _1032 = _1030.x;
        float _1034 = _1030.y;
        float _1036 = _1030.z;
        float _1038 = _1030.w;
        float3 _3066 = float3(_1015, _1017, float(2));
        float3 _3068 = select(_3066, float3(0.0), isnan(_3066));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3068.xy, uint(rint(_3068.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3068.xy, uint(rint(_3068.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3083 = float3(_1015, _1017, float(3));
        float3 _3085 = select(_3083, float3(0.0), isnan(_3083));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3085.xy, uint(rint(_3085.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3085.xy, uint(rint(_3085.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3100 = float3(_1015, _1017, float(4));
        float3 _3102 = select(_3100, float3(0.0), isnan(_3100));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3102.xy, uint(rint(_3102.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3102.xy, uint(rint(_3102.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3117 = float3(_1015, _1017, float(5));
        float3 _3119 = select(_3117, float3(0.0), isnan(_3117));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3119.xy, uint(rint(_3119.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3119.xy, uint(rint(_3119.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3134 = float3(_1015, _1017, float(6));
        float3 _3136 = select(_3134, float3(0.0), isnan(_3134));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3136.xy, uint(rint(_3136.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3136.xy, uint(rint(_3136.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3151 = float3(_1015, _1017, float(7));
        float3 _3153 = select(_3151, float3(0.0), isnan(_3151));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3153.xy, uint(rint(_3153.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3153.xy, uint(rint(_3153.z)), level(0.0)).xyzw;
        float _1092 = _1090.x;
        float _1094 = _1090.y;
        float _1096 = _1090.z;
        float _1098 = _1090.w;
        _949 = _1056;
        _951 = _1052;
        _953 = _1054;
        _955 = as_type<int>(_1058);
        _957 = as_type<int>(_1062);
        _959 = as_type<int>(_1064);
        _961 = as_type<int>(_1066);
        _963 = as_type<int>(_1068);
        _965 = as_type<int>(_1072);
        _967 = as_type<int>(_1074);
        _969 = as_type<int>(_1078);
        _971 = _1084;
        _973 = _1094;
        _975 = _1034;
        _977 = _1028;
        _979 = _1082;
        _981 = _1092;
        _983 = _1032;
        _985 = _1026;
        _987 = _1086;
        _989 = _1096;
        _991 = _1022;
        _993 = _1024;
        _995 = _1088;
        _997 = _1098;
        _999 = _1042;
        _1001 = _1036;
        _1003 = _1038;
        _1005 = as_type<int>(_1076);
        _1007 = _1048;
        _1009 = _1044;
        _1011 = _1046;
    }
    _1013 = false;
    float _1100 = _949;
    float _1102 = _951;
    float _1104 = _953;
    int _1106 = _955;
    int _1108 = _957;
    int _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    int _1120 = _969;
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
    float _1162 = _1011;
    float _1164 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1166 = _815 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1170 = _709 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1172;
    float _1176 = _1100 * 0.88622701168060302734375;
    float _1178 = _1166 * _1166;
    out.gl_Position.x = _939;
    out.gl_Position.y = _941;
    out.gl_Position.z = _943;
    out.gl_Position.w = _945;
    float _1180 = _1102 * 0.88622701168060302734375;
    float _1182 = _1104 * 0.88622701168060302734375;
    float _1184 = fma(_1170, _1170, _1178);
    float _1186 = _909 ? as_type<float>(_1106) : 0.0;
    out.m_45.x = _709;
    out.m_45.y = _815;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1188 = _909 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1174, _1174, _1184);
    float _1192 = _909 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _807;
    out.m_47.w = _805;
    float _1194 = _909 ? _1180 : 0.0;
    float _1196 = _909 ? _1182 : 0.0;
    float _1198 = rsqrt(_1190);
    float _1200 = _909 ? _1176 : 0.0;
    float _1202 = _909 ? as_type<float>(_1112) : 0.0;
    float _1204 = _909 ? as_type<float>(_1114) : 0.0;
    float _1206 = _909 ? as_type<float>(_1116) : 0.0;
    float _1208 = _909 ? as_type<float>(_1118) : 0.0;
    float _1210 = _909 ? as_type<float>(_1120) : 0.0;
    float _1212 = _1198 * 1.02332699298858642578125;
    float _1214 = _1174 * _1198;
    float _1216 = _1166 * _1212;
    float _1218 = _1214 * (-1.02332699298858642578125);
    float _1220 = _1170 * _1212;
    float _1222 = _1216 * _1122;
    float _1224 = _1216 * _1124;
    float _1226 = _1216 * _1126;
    float _1228 = _1216 * _1128;
    float _1230 = fma(_1130, 0.88622701168060302734375, _1222);
    float _1232 = fma(_1132, 0.88622701168060302734375, _1224);
    float _1234 = _1216 * _1134;
    float _1236 = fma(_1136, 0.88622701168060302734375, _1226);
    float _1238 = fma(_1218, _1138, _1230);
    float _1240 = fma(_1218, _1140, _1232);
    float _1242 = fma(_1142, 0.88622701168060302734375, _1228);
    float _1244 = fma(_1144, 0.88622701168060302734375, _1234);
    float _1246 = fma(_1220, _1146, _1238);
    float _1248 = fma(_1220, _1148, _1240);
    float _1250 = fma(_1186, _1216, _1194);
    float _1252 = fma(_1188, _1216, _1196);
    float _1254 = fma(_1192, _1216, _1200);
    float _1256 = precise::max(0.0, _1246);
    float _1258 = fma(_1218, _1150, _1236);
    float _1260 = precise::max(0.0, _1248);
    float _1262 = fma(_1218, _1152, _1242);
    float _1264 = fma(_1218, _1154, _1244);
    float _1266 = _1256 * 0.31830990314483642578125;
    float _1268 = precise::clamp(_1266, 0.0, 1.0);
    float _1270 = fma(_1202, _1218, _1250);
    float _1272 = _1260 * 0.31830990314483642578125;
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = fma(_1204, _1218, _1252);
    float _1278 = fma(_1206, _1218, _1254);
    float _1280 = _909 ? as_type<float>(_1156) : 0.0;
    float _1282 = fma(_1220, _1158, _1258);
    float _1284 = fma(_1220, _1160, _1262);
    float _1286 = fma(_1220, _1162, _1264);
    float _1288 = _1268 * 0.88622701168060302734375;
    float _1290 = -_1274;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_1208, _1220, _1270);
    float _1296 = fma(_1280, _1220, _1276);
    float _1298 = fma(_1210, _1220, _1278);
    float _1300 = precise::max(0.0, _1282);
    float _1302 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1274);
    float _1304 = precise::max(0.0, _1284);
    float _1306 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1308 = precise::max(0.0, _1286);
    float _1310 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1312 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = precise::max(0.0, _1294);
    float _1316 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1306);
    float _1318 = precise::max(0.0, _1296);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1310);
    float _1322 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1324 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1326 = precise::max(0.0, _1298);
    float _1328 = fma(_1314, _1322, _1320);
    float _1330 = fma(_1318, _1322, _1324);
    float _1332 = fma(_1326, _1322, _1316);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1328;
    out.m_51.y = _1330;
    out.m_51.z = _1332;
    out.m_51.w = _827;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1013 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _76 = _74 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _94 = _76 == 80;
    bool _96 = _67 >= 0.5;
    bool _98 = isnan(_67);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _90 + _106;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _112 = _92 + _110;
    float _114 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _116 = _114;
    float _118 = _108 * _108;
    bool _120 = _76 == 96;
    float _122 = 0.0;
    float _124 = _116;
    float _126 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _128 = _122;
    float _130 = fma(_112, _112, _118);
    float _132 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _134 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _132;
    float _136 = _128;
    float _138 = _134;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _124;
    bool _142 = _76 == 112;
    float _144 = fma(_134, _134, _130);
    float _146 = _140;
    if (_82)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _136;
    float _150 = _148;
    if (_84)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    bool _154 = _76 == 128;
    float _156 = rsqrt(_144);
    float _158 = _152;
    if (_84)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _76 == 144;
    float _168 = _164;
    if (_86)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _76 == 160;
    float _178 = _174;
    if (_88)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _178;
    float _186 = _156 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _188 = _76 == 176;
    float _190 = _184;
    if (_94)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _182;
    bool _194 = _76 == 192;
    float _196 = log2(_186);
    float _198 = _192;
    if (_120)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_120)
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
    bool _210 = _76 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_154)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _76 == 224;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _216;
    float _226 = _196 + 1.2999999523162841796875;
    float _228 = _224;
    if (_166)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _222;
    bool _232 = _76 == 240;
    float _234 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _228;
    float _238 = trunc(_226);
    int _240 = int(_238);
    float _242 = _236;
    if (_176)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _234;
    bool _246 = _76 == 256;
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
    bool _256 = _76 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_194)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    bool _266 = _76 == 288;
    int _268 = min(_240, 15);
    float _270 = _264;
    if (_194)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    bool _274 = _76 == 304;
    float _276 = float(_268);
    float _278 = _272;
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _280 = _270;
    int _282 = _268 << 4;
    int _284 = _282 + 4288;
    float _286 = _280;
    float _288 = as_type<float>(_284);
    if (_210)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _290 = _278;
    float _292 = _290;
    if (_220)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _294 = _286;
    float _296 = -_276;
    float _298 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _300 = _76 == 320;
    int _302 = _284 + 8;
    uint _305 = uint(int(uint(_302) >> uint(2)));
    uint _307 = uint(int(uint(int(_305)) >> uint(2)));
    int _309 = int(_305) & 3;
    float _311 = (*spvDescriptorSet0.vp_c14)._m0[int(_307)][_309];
    int _313 = int(_305) + 1;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    int _317 = _313 & 3;
    float _319 = (*spvDescriptorSet0.vp_c14)._m0[int(_315)][_317];
    float _321 = _294;
    if (_220)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _323 = _292;
    float _325 = _298 + 1.0;
    float _327 = _323;
    if (_232)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _329 = _321;
    bool _331 = _76 == 336;
    float _333 = _329;
    if (_232)
    {
        _327 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _335 = _327;
    float _337 = exp2(_325);
    float _339 = _335;
    if (_246)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _341 = _333;
    bool _343 = _76 == 352;
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
    bool _353 = _76 == 368;
    float _355 = _351;
    if (_256)
    {
        _349 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _357 = _349;
    float _359 = _357;
    if (_266)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _361 = _355;
    bool _363 = _76 == 384;
    float _365 = 1.0 / _337;
    float _367 = _361;
    float _369 = _337;
    if (_266)
    {
        _359 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _371 = _359;
    float _373 = _371;
    if (_274)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _375 = _367;
    bool _377 = _76 == 400;
    float _379 = _375;
    if (_274)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _381 = _373;
    bool _383 = _76 == 416;
    float _385 = _381;
    if (_300)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _387 = _379;
    float _389 = _387;
    if (_300)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _391 = _385;
    float _393 = _391;
    if (_331)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _395 = _389;
    bool _397 = _76 == 432;
    float _399 = _395;
    if (_331)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _401 = _393;
    float _403 = _401;
    if (_343)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _405 = _399;
    bool _407 = _76 == 448;
    float _409 = _405;
    if (_343)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _411 = _403;
    float _413 = _411;
    if (_353)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _415 = _409;
    bool _417 = _76 == 464;
    float _419 = _415;
    if (_353)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _421 = _413;
    float _423 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _425 = _419;
    bool _427 = _76 == 480;
    float _429 = _425;
    if (_363)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _431 = _423;
    float _433 = _431;
    if (_377)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _435 = _429;
    bool _437 = _76 == 496;
    float _439 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _441 = _433;
    float _443 = _441;
    if (_383)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _445 = _439;
    bool _447 = _76 == 512;
    float _449 = _445;
    if (_383)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _451 = _443;
    bool _453 = _76 == 528;
    float _455 = _451;
    if (_397)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _457 = _449;
    float _459 = _457;
    if (_397)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _461 = _455;
    float _463 = _461;
    if (_407)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _465 = _459;
    bool _467 = _76 == 544;
    float _469 = _465;
    if (_407)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _471 = _463;
    float _473 = _471;
    if (_417)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _475 = _469;
    bool _477 = _76 == 560;
    float _479 = _475;
    if (_417)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _481 = _473;
    float _483 = _481;
    if (_427)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _485 = _479;
    bool _487 = _76 == 576;
    float _489 = _485;
    if (_427)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _491 = _483;
    float _493 = _491;
    if (_437)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _495 = _489;
    bool _497 = _76 == 592;
    float _499 = _495;
    if (_437)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _501 = _493;
    float _503 = _501;
    if (_447)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _505 = _499;
    bool _507 = _76 == 608;
    float _509 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _511 = _503;
    float _513 = _511;
    if (_453)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _515 = _509;
    bool _517 = _76 == 624;
    float _519 = _515;
    if (_453)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _521 = _513;
    bool _523 = _76 == 640;
    float _525 = _521;
    if (_467)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _527 = _519;
    float _529 = _527;
    if (_467)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _531 = _525;
    float _533 = _531;
    if (_477)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _535 = _529;
    bool _537 = _76 == 656;
    float _539 = _535;
    if (_477)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _541 = _533;
    float _543 = _541;
    if (_487)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _545 = _539;
    bool _547 = _76 == 672;
    float _549 = _545;
    if (_487)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _551 = _543;
    float _553 = _551;
    if (_497)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _555 = _549;
    bool _557 = _76 == 688;
    float _559 = _555;
    if (_497)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _561 = _553;
    float _563 = _561;
    if (_507)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _565 = _559;
    bool _567 = _76 == 704;
    float _569 = _565;
    if (_507)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _571 = _563;
    float _573 = _571;
    if (_517)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _575 = _569;
    bool _577 = _76 == 720;
    float _579 = _575;
    if (_517)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _581 = _573;
    float _583 = _581;
    if (_523)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _585 = _579;
    bool _587 = _76 == 736;
    float _589 = _585;
    if (_523)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _591 = _583;
    bool _593 = _76 == 752;
    float _595 = _591;
    if (_537)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _597 = _589;
    float _599 = _597;
    if (_547)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_557)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_567)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _609 = _607;
    float _611 = _609;
    if (_577)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _613 = _611;
    float _615 = _613;
    if (_587)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _617 = _615;
    float _619 = _617;
    if (_593)
    {
        _619 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _621 = _619;
    float _623 = _365 * _621;
    if (_537)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _625 = _595;
    float _627 = _625;
    if (_547)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _629 = _627;
    float _631 = _623 * _65;
    float _633 = _629;
    if (_557)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _635 = _633;
    float _637 = _635;
    if (_567)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _639 = _637;
    float _641 = floor(_631);
    float _643 = _639;
    if (_577)
    {
        _643 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _645 = _643;
    float _647 = _645;
    if (_587)
    {
        _647 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _649 = _647;
    float _651 = _649;
    if (_593)
    {
        _651 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _653 = _651;
    float _655 = -_641;
    float _657 = _631 + _655;
    float _659 = _337 * _653;
    float _661 = _657;
    if (!_104)
    {
        _369 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _663 = _369;
    float _665 = _657 * 2.0;
    float _667 = -_657;
    float _669 = fma(_659, _667, _65);
    float _671 = floor(_665);
    float _673 = _659 * _671;
    float _675 = _673 * 0.5;
    float _677 = _675 + _669;
    float _679 = fma(_71, _677, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _681 = fma(_677, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _683 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _685 = _679 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _689 = _681 + _687;
    float _691 = _685 * _685;
    float _693 = fma(_689, _689, _691);
    float _695 = fma(_134, _134, _693);
    float _697 = sqrt(_695);
    float _699 = -_319;
    float _701 = fma(_697, _311, _699);
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = -_675;
    float _707 = fma(_705, _703, _677);
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _711 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _713 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _715 = _695;
    float _717 = _663;
    if (!_104)
    {
        float _719 = fma(_711, _663, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _138 = _719;
    }
    float _721 = _138;
    float _723 = _721;
    if (!_104)
    {
        float _725 = fma(_713, _663, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _126 = _725;
    }
    float _727 = _126;
    float _729 = _727;
    if (!_104)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _721);
        _723 = _731;
    }
    float _733 = _723;
    if (!_104)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _715 = _735;
    }
    float _737 = _715;
    if (!_104)
    {
        float2 _2522 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2522, float2(0.0), isnan(_2522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2522, float2(0.0), isnan(_2522)), level(0.0)).x;
        _729 = _739;
    }
    float _741 = _729;
    if (_104)
    {
        _288 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _288;
    float _745 = _743;
    if (_104)
    {
        _661 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _661;
    if (_104)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _717 = _749;
    }
    float _751 = _717;
    float _753 = _751;
    if (_104)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_104)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_104)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_104)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    float _777 = _775;
    if (_104)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _779;
    }
    float _781 = _771;
    float _783 = _741;
    float _785 = _781;
    if (_104)
    {
        float2 _2617 = float2(_781, _775);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2617, float2(0.0), isnan(_2617)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2617, float2(0.0), isnan(_2617)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = _709 + _795;
    float _799 = _793 * _793;
    float _801 = fma(_797, _797, _799);
    float _803 = sqrt(_801);
    float _805 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _807 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _809 = _803 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _811 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_809)
    {
        _785 = _709;
    }
    float _813 = _785;
    float _815 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _817 = _815 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _819 = _813;
    if (!_809)
    {
        _811 = _815;
    }
    float _821 = _811;
    float _823 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].x, _817);
    float _825 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _823);
    float _827 = _825 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _829 = _825;
    float _831 = _821;
    if (!_809)
    {
        _829 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _833 = _829;
    float _835 = _833;
    if (!_809)
    {
        _777 = _827;
    }
    float _837 = _777;
    bool _839 = !_809;
    float _841 = _837;
    if (!_839)
    {
        float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _847 = _803 + _845;
        float _849 = _815 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = rsqrt(_801);
        float _853 = _847 * _843;
        float _855 = _853 * 0.15915493667125701904296875;
        float _857 = _855 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 + (-1.0);
        float _867 = fma(_863, _849, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _869 = _865 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _871 = _851 * _867;
        float _873 = fma(_815, _859, _869);
        float _875 = fma(_797, _871, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _877 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _879 = fma(_793, _871, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _881 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _877);
        float _883 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[2].z, _881);
        float _885 = _883 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _831 = _873;
        _819 = _875;
        _835 = _879;
        _841 = _885;
    }
    float _887 = _831;
    float _889 = _819;
    float _891 = _835;
    float _893 = _841;
    float _895 = _887 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _897 = _887 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[1].x, _895);
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c4)._m0[0].x, _897);
    float _903 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[1].z, _899);
    float _905 = fma(_891, (*spvDescriptorSet0.vp_c4)._m0[0].z, _901);
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _909 = _907 != 0;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _915 = _911 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _917 = _911 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _921 = _911 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[7].x, _915);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[8].x, _917);
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[9].x, _919);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c4)._m0[10].x, _921);
    float _931 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[7].z, _923);
    float _933 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[8].z, _925);
    float _935 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[9].z, _927);
    float _937 = fma(_893, (*spvDescriptorSet0.vp_c4)._m0[10].z, _929);
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _945 = _937 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _947 = !_909;
    float _949;
    float _951;
    float _953;
    int _955;
    int _957;
    int _959;
    int _961;
    int _963;
    int _965;
    int _967;
    int _969;
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
    float _1011;
    if (!_947)
    {
        _949 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _951 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _953 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _971 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _975 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1013 = true;
    }
    else
    {
        float _1015 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _1017 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3030 = float3(_1015, _1017, float(0));
        float3 _3034 = select(_3030, float3(0.0), isnan(_3030));
        float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3034.xy, uint(rint(_3034.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3034.xy, uint(rint(_3034.z)), level(0.0)).xyzw;
        float _1022 = _1020.x;
        float _1024 = _1020.y;
        float _1026 = _1020.z;
        float _1028 = _1020.w;
        float3 _3049 = float3(_1015, _1017, float(1));
        float3 _3051 = select(_3049, float3(0.0), isnan(_3049));
        float4 _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3051.xy, uint(rint(_3051.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3051.xy, uint(rint(_3051.z)), level(0.0)).xyzw;
        float _1032 = _1030.x;
        float _1034 = _1030.y;
        float _1036 = _1030.z;
        float _1038 = _1030.w;
        float3 _3066 = float3(_1015, _1017, float(2));
        float3 _3068 = select(_3066, float3(0.0), isnan(_3066));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3068.xy, uint(rint(_3068.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3068.xy, uint(rint(_3068.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3083 = float3(_1015, _1017, float(3));
        float3 _3085 = select(_3083, float3(0.0), isnan(_3083));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3085.xy, uint(rint(_3085.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3085.xy, uint(rint(_3085.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3100 = float3(_1015, _1017, float(4));
        float3 _3102 = select(_3100, float3(0.0), isnan(_3100));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3102.xy, uint(rint(_3102.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3102.xy, uint(rint(_3102.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3117 = float3(_1015, _1017, float(5));
        float3 _3119 = select(_3117, float3(0.0), isnan(_3117));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3119.xy, uint(rint(_3119.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3119.xy, uint(rint(_3119.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3134 = float3(_1015, _1017, float(6));
        float3 _3136 = select(_3134, float3(0.0), isnan(_3134));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3136.xy, uint(rint(_3136.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3136.xy, uint(rint(_3136.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3151 = float3(_1015, _1017, float(7));
        float3 _3153 = select(_3151, float3(0.0), isnan(_3151));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3153.xy, uint(rint(_3153.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3153.xy, uint(rint(_3153.z)), level(0.0)).xyzw;
        float _1092 = _1090.x;
        float _1094 = _1090.y;
        float _1096 = _1090.z;
        float _1098 = _1090.w;
        _949 = _1056;
        _951 = _1052;
        _953 = _1054;
        _955 = as_type<int>(_1058);
        _957 = as_type<int>(_1062);
        _959 = as_type<int>(_1064);
        _961 = as_type<int>(_1066);
        _963 = as_type<int>(_1068);
        _965 = as_type<int>(_1072);
        _967 = as_type<int>(_1074);
        _969 = as_type<int>(_1078);
        _971 = _1084;
        _973 = _1094;
        _975 = _1034;
        _977 = _1028;
        _979 = _1082;
        _981 = _1092;
        _983 = _1032;
        _985 = _1026;
        _987 = _1086;
        _989 = _1096;
        _991 = _1022;
        _993 = _1024;
        _995 = _1088;
        _997 = _1098;
        _999 = _1042;
        _1001 = _1036;
        _1003 = _1038;
        _1005 = as_type<int>(_1076);
        _1007 = _1048;
        _1009 = _1044;
        _1011 = _1046;
    }
    _1013 = false;
    float _1100 = _949;
    float _1102 = _951;
    float _1104 = _953;
    int _1106 = _955;
    int _1108 = _957;
    int _1110 = _959;
    int _1112 = _961;
    int _1114 = _963;
    int _1116 = _965;
    int _1118 = _967;
    int _1120 = _969;
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
    float _1162 = _1011;
    float _1164 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1166 = _815 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1170 = _709 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1172;
    float _1176 = _1100 * 0.88622701168060302734375;
    float _1178 = _1166 * _1166;
    out.gl_Position.x = _939;
    out.gl_Position.y = _941;
    out.gl_Position.z = _943;
    out.gl_Position.w = _945;
    float _1180 = _1102 * 0.88622701168060302734375;
    float _1182 = _1104 * 0.88622701168060302734375;
    float _1184 = fma(_1170, _1170, _1178);
    float _1186 = _909 ? as_type<float>(_1106) : 0.0;
    out.m_45.x = _709;
    out.m_45.y = _815;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1188 = _909 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1174, _1174, _1184);
    float _1192 = _909 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _807;
    out.m_47.w = _805;
    float _1194 = _909 ? _1180 : 0.0;
    float _1196 = _909 ? _1182 : 0.0;
    float _1198 = rsqrt(_1190);
    float _1200 = _909 ? _1176 : 0.0;
    float _1202 = _909 ? as_type<float>(_1112) : 0.0;
    float _1204 = _909 ? as_type<float>(_1114) : 0.0;
    float _1206 = _909 ? as_type<float>(_1116) : 0.0;
    float _1208 = _909 ? as_type<float>(_1118) : 0.0;
    float _1210 = _909 ? as_type<float>(_1120) : 0.0;
    float _1212 = _1198 * 1.02332699298858642578125;
    float _1214 = _1174 * _1198;
    float _1216 = _1166 * _1212;
    float _1218 = _1214 * (-1.02332699298858642578125);
    float _1220 = _1170 * _1212;
    float _1222 = _1216 * _1122;
    float _1224 = _1216 * _1124;
    float _1226 = _1216 * _1126;
    float _1228 = _1216 * _1128;
    float _1230 = fma(_1130, 0.88622701168060302734375, _1222);
    float _1232 = fma(_1132, 0.88622701168060302734375, _1224);
    float _1234 = _1216 * _1134;
    float _1236 = fma(_1136, 0.88622701168060302734375, _1226);
    float _1238 = fma(_1218, _1138, _1230);
    float _1240 = fma(_1218, _1140, _1232);
    float _1242 = fma(_1142, 0.88622701168060302734375, _1228);
    float _1244 = fma(_1144, 0.88622701168060302734375, _1234);
    float _1246 = fma(_1220, _1146, _1238);
    float _1248 = fma(_1220, _1148, _1240);
    float _1250 = fma(_1186, _1216, _1194);
    float _1252 = fma(_1188, _1216, _1196);
    float _1254 = fma(_1192, _1216, _1200);
    float _1256 = precise::max(0.0, _1246);
    float _1258 = fma(_1218, _1150, _1236);
    float _1260 = precise::max(0.0, _1248);
    float _1262 = fma(_1218, _1152, _1242);
    float _1264 = fma(_1218, _1154, _1244);
    float _1266 = _1256 * 0.31830990314483642578125;
    float _1268 = precise::clamp(_1266, 0.0, 1.0);
    float _1270 = fma(_1202, _1218, _1250);
    float _1272 = _1260 * 0.31830990314483642578125;
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = fma(_1204, _1218, _1252);
    float _1278 = fma(_1206, _1218, _1254);
    float _1280 = _909 ? as_type<float>(_1156) : 0.0;
    float _1282 = fma(_1220, _1158, _1258);
    float _1284 = fma(_1220, _1160, _1262);
    float _1286 = fma(_1220, _1162, _1264);
    float _1288 = _1268 * 0.88622701168060302734375;
    float _1290 = -_1274;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_1208, _1220, _1270);
    float _1296 = fma(_1280, _1220, _1276);
    float _1298 = fma(_1210, _1220, _1278);
    float _1300 = precise::max(0.0, _1282);
    float _1302 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1274);
    float _1304 = precise::max(0.0, _1284);
    float _1306 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1308 = precise::max(0.0, _1286);
    float _1310 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1312 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = precise::max(0.0, _1294);
    float _1316 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1306);
    float _1318 = precise::max(0.0, _1296);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1310);
    float _1322 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1324 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1326 = precise::max(0.0, _1298);
    float _1328 = fma(_1314, _1322, _1320);
    float _1330 = fma(_1318, _1322, _1324);
    float _1332 = fma(_1326, _1322, _1316);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1328;
    out.m_51.y = _1330;
    out.m_51.z = _1332;
    out.m_51.w = _827;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

