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
    float4 m_45 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
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
    bool _919 = false;
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
        float2 _2428 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2428, float2(0.0), isnan(_2428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2428, float2(0.0), isnan(_2428)), level(0.0)).x;
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
    if (_104)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_104)
    {
        float2 _2521 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2521, float2(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2521, float2(0.0), isnan(_2521)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _789 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _793 = _791 != 0;
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _797 = _795 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _799 = _795 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _801 = _795 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].x, _797);
    float _805 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].x, _799);
    float _807 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].x, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _805);
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
    float _815 = _809 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _817 = _811 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _821 = _815 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _825 = _815 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _827 = _815 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _829 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[7].x, _821);
    float _831 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[8].x, _823);
    float _833 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[9].x, _825);
    float _835 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[10].x, _827);
    float _837 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[7].z, _829);
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[8].z, _831);
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[9].z, _833);
    float _843 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[10].z, _835);
    float _845 = _837 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _847 = _839 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _853 = !_793;
    float _855;
    float _857;
    float _859;
    int _861;
    int _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
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
    float _917;
    if (!_853)
    {
        _855 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _877 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _917 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _919 = true;
    }
    else
    {
        float _921 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _923 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2785 = float3(_921, _923, float(0));
        float3 _2789 = select(_2785, float3(0.0), isnan(_2785));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2789.xy, uint(rint(_2789.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2789.xy, uint(rint(_2789.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2804 = float3(_921, _923, float(1));
        float3 _2806 = select(_2804, float3(0.0), isnan(_2804));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2806.xy, uint(rint(_2806.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2806.xy, uint(rint(_2806.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2821 = float3(_921, _923, float(2));
        float3 _2823 = select(_2821, float3(0.0), isnan(_2821));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2823.xy, uint(rint(_2823.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2823.xy, uint(rint(_2823.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2838 = float3(_921, _923, float(3));
        float3 _2840 = select(_2838, float3(0.0), isnan(_2838));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2840.xy, uint(rint(_2840.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2840.xy, uint(rint(_2840.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2855 = float3(_921, _923, float(4));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2857.xy, uint(rint(_2857.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2857.xy, uint(rint(_2857.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        float3 _2872 = float3(_921, _923, float(5));
        float3 _2874 = select(_2872, float3(0.0), isnan(_2872));
        float4 _976 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2874.xy, uint(rint(_2874.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2874.xy, uint(rint(_2874.z)), level(0.0)).xyzw;
        float _978 = _976.x;
        float _980 = _976.y;
        float _982 = _976.z;
        float _984 = _976.w;
        float3 _2889 = float3(_921, _923, float(6));
        float3 _2891 = select(_2889, float3(0.0), isnan(_2889));
        float4 _986 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2891.xy, uint(rint(_2891.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2891.xy, uint(rint(_2891.z)), level(0.0)).xyzw;
        float _988 = _986.x;
        float _990 = _986.y;
        float _992 = _986.z;
        float _994 = _986.w;
        float3 _2906 = float3(_921, _923, float(7));
        float3 _2908 = select(_2906, float3(0.0), isnan(_2906));
        float4 _996 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2908.xy, uint(rint(_2908.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2908.xy, uint(rint(_2908.z)), level(0.0)).xyzw;
        float _998 = _996.x;
        float _1000 = _996.y;
        float _1002 = _996.z;
        float _1004 = _996.w;
        _855 = _962;
        _857 = _958;
        _859 = _960;
        _861 = as_type<int>(_964);
        _863 = as_type<int>(_968);
        _865 = as_type<int>(_970);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_978);
        _873 = as_type<int>(_980);
        _875 = as_type<int>(_984);
        _877 = _990;
        _879 = _1000;
        _881 = _940;
        _883 = _934;
        _885 = _988;
        _887 = _998;
        _889 = _938;
        _891 = _932;
        _893 = _992;
        _895 = _1002;
        _897 = _928;
        _899 = _930;
        _901 = _994;
        _903 = _1004;
        _905 = _948;
        _907 = _942;
        _909 = _944;
        _911 = as_type<int>(_982);
        _913 = _954;
        _915 = _950;
        _917 = _952;
    }
    _919 = false;
    float _1006 = _855;
    float _1008 = _857;
    float _1010 = _859;
    int _1012 = _861;
    int _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
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
    float _1068 = _917;
    float _1070 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1072 = _795 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1076 = _709 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1078;
    float _1082 = _1006 * 0.88622701168060302734375;
    float _1084 = _1072 * _1072;
    out.gl_Position.x = _845;
    out.gl_Position.y = _847;
    out.gl_Position.z = _849;
    out.gl_Position.w = _851;
    float _1086 = _1008 * 0.88622701168060302734375;
    float _1088 = _1010 * 0.88622701168060302734375;
    float _1090 = fma(_1076, _1076, _1084);
    float _1092 = _793 ? as_type<float>(_1012) : 0.0;
    out.m_45.x = _709;
    out.m_45.y = _795;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1094 = _793 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1080, _1080, _1090);
    float _1098 = _793 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _789;
    out.m_47.w = _787;
    float _1100 = _793 ? _1086 : 0.0;
    float _1102 = _793 ? _1088 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _793 ? _1082 : 0.0;
    float _1108 = _793 ? as_type<float>(_1018) : 0.0;
    float _1110 = _793 ? as_type<float>(_1020) : 0.0;
    float _1112 = _793 ? as_type<float>(_1022) : 0.0;
    float _1114 = _793 ? as_type<float>(_1024) : 0.0;
    float _1116 = _793 ? as_type<float>(_1026) : 0.0;
    float _1118 = _1104 * 1.02332699298858642578125;
    float _1120 = _1080 * _1104;
    float _1122 = _1072 * _1118;
    float _1124 = _1120 * (-1.02332699298858642578125);
    float _1126 = _1076 * _1118;
    float _1128 = _1122 * _1028;
    float _1130 = _1122 * _1030;
    float _1132 = _1122 * _1032;
    float _1134 = _1122 * _1034;
    float _1136 = fma(_1036, 0.88622701168060302734375, _1128);
    float _1138 = fma(_1038, 0.88622701168060302734375, _1130);
    float _1140 = _1122 * _1040;
    float _1142 = fma(_1042, 0.88622701168060302734375, _1132);
    float _1144 = fma(_1124, _1044, _1136);
    float _1146 = fma(_1124, _1046, _1138);
    float _1148 = fma(_1048, 0.88622701168060302734375, _1134);
    float _1150 = fma(_1050, 0.88622701168060302734375, _1140);
    float _1152 = fma(_1126, _1052, _1144);
    float _1154 = fma(_1126, _1054, _1146);
    float _1156 = fma(_1092, _1122, _1100);
    float _1158 = fma(_1094, _1122, _1102);
    float _1160 = fma(_1098, _1122, _1106);
    float _1162 = precise::max(0.0, _1152);
    float _1164 = fma(_1124, _1056, _1142);
    float _1166 = precise::max(0.0, _1154);
    float _1168 = fma(_1124, _1058, _1148);
    float _1170 = fma(_1124, _1060, _1150);
    float _1172 = _1162 * 0.31830990314483642578125;
    float _1174 = precise::clamp(_1172, 0.0, 1.0);
    float _1176 = fma(_1108, _1124, _1156);
    float _1178 = _1166 * 0.31830990314483642578125;
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = fma(_1110, _1124, _1158);
    float _1184 = fma(_1112, _1124, _1160);
    float _1186 = _793 ? as_type<float>(_1062) : 0.0;
    float _1188 = fma(_1126, _1064, _1164);
    float _1190 = fma(_1126, _1066, _1168);
    float _1192 = fma(_1126, _1068, _1170);
    float _1194 = _1174 * 0.88622701168060302734375;
    float _1196 = -_1180;
    float _1198 = _1196 + 1.0;
    float _1200 = fma(_1114, _1126, _1176);
    float _1202 = fma(_1186, _1126, _1182);
    float _1204 = fma(_1116, _1126, _1184);
    float _1206 = precise::max(0.0, _1188);
    float _1208 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1180);
    float _1210 = precise::max(0.0, _1190);
    float _1212 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1214 = precise::max(0.0, _1192);
    float _1216 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1218 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1220 = precise::max(0.0, _1200);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1212);
    float _1224 = precise::max(0.0, _1202);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1216);
    float _1228 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1218);
    float _1232 = precise::max(0.0, _1204);
    float _1234 = fma(_1220, _1228, _1226);
    float _1236 = fma(_1224, _1228, _1230);
    float _1238 = fma(_1232, _1228, _1222);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1234;
    out.m_51.y = _1236;
    out.m_51.z = _1238;
    out.m_51.w = _819;
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
    bool _919 = false;
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
        float2 _2428 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2428, float2(0.0), isnan(_2428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2428, float2(0.0), isnan(_2428)), level(0.0)).x;
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
    if (_104)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_104)
    {
        float2 _2521 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2521, float2(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2521, float2(0.0), isnan(_2521)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _789 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _793 = _791 != 0;
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _797 = _795 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _799 = _795 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _801 = _795 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].x, _797);
    float _805 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].x, _799);
    float _807 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].x, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _805);
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
    float _815 = _809 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _817 = _811 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _821 = _815 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _825 = _815 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _827 = _815 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _829 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[7].x, _821);
    float _831 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[8].x, _823);
    float _833 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[9].x, _825);
    float _835 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[10].x, _827);
    float _837 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[7].z, _829);
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[8].z, _831);
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[9].z, _833);
    float _843 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[10].z, _835);
    float _845 = _837 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _847 = _839 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _853 = !_793;
    float _855;
    float _857;
    float _859;
    int _861;
    int _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
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
    float _917;
    if (!_853)
    {
        _855 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _877 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _917 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _919 = true;
    }
    else
    {
        float _921 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _923 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2785 = float3(_921, _923, float(0));
        float3 _2789 = select(_2785, float3(0.0), isnan(_2785));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2789.xy, uint(rint(_2789.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2789.xy, uint(rint(_2789.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2804 = float3(_921, _923, float(1));
        float3 _2806 = select(_2804, float3(0.0), isnan(_2804));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2806.xy, uint(rint(_2806.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2806.xy, uint(rint(_2806.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2821 = float3(_921, _923, float(2));
        float3 _2823 = select(_2821, float3(0.0), isnan(_2821));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2823.xy, uint(rint(_2823.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2823.xy, uint(rint(_2823.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2838 = float3(_921, _923, float(3));
        float3 _2840 = select(_2838, float3(0.0), isnan(_2838));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2840.xy, uint(rint(_2840.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2840.xy, uint(rint(_2840.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2855 = float3(_921, _923, float(4));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2857.xy, uint(rint(_2857.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2857.xy, uint(rint(_2857.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        float3 _2872 = float3(_921, _923, float(5));
        float3 _2874 = select(_2872, float3(0.0), isnan(_2872));
        float4 _976 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2874.xy, uint(rint(_2874.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2874.xy, uint(rint(_2874.z)), level(0.0)).xyzw;
        float _978 = _976.x;
        float _980 = _976.y;
        float _982 = _976.z;
        float _984 = _976.w;
        float3 _2889 = float3(_921, _923, float(6));
        float3 _2891 = select(_2889, float3(0.0), isnan(_2889));
        float4 _986 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2891.xy, uint(rint(_2891.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2891.xy, uint(rint(_2891.z)), level(0.0)).xyzw;
        float _988 = _986.x;
        float _990 = _986.y;
        float _992 = _986.z;
        float _994 = _986.w;
        float3 _2906 = float3(_921, _923, float(7));
        float3 _2908 = select(_2906, float3(0.0), isnan(_2906));
        float4 _996 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2908.xy, uint(rint(_2908.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2908.xy, uint(rint(_2908.z)), level(0.0)).xyzw;
        float _998 = _996.x;
        float _1000 = _996.y;
        float _1002 = _996.z;
        float _1004 = _996.w;
        _855 = _962;
        _857 = _958;
        _859 = _960;
        _861 = as_type<int>(_964);
        _863 = as_type<int>(_968);
        _865 = as_type<int>(_970);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_978);
        _873 = as_type<int>(_980);
        _875 = as_type<int>(_984);
        _877 = _990;
        _879 = _1000;
        _881 = _940;
        _883 = _934;
        _885 = _988;
        _887 = _998;
        _889 = _938;
        _891 = _932;
        _893 = _992;
        _895 = _1002;
        _897 = _928;
        _899 = _930;
        _901 = _994;
        _903 = _1004;
        _905 = _948;
        _907 = _942;
        _909 = _944;
        _911 = as_type<int>(_982);
        _913 = _954;
        _915 = _950;
        _917 = _952;
    }
    _919 = false;
    float _1006 = _855;
    float _1008 = _857;
    float _1010 = _859;
    int _1012 = _861;
    int _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
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
    float _1068 = _917;
    float _1070 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1072 = _795 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1076 = _709 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1078;
    float _1082 = _1006 * 0.88622701168060302734375;
    float _1084 = _1072 * _1072;
    out.gl_Position.x = _845;
    out.gl_Position.y = _847;
    out.gl_Position.z = _849;
    out.gl_Position.w = _851;
    float _1086 = _1008 * 0.88622701168060302734375;
    float _1088 = _1010 * 0.88622701168060302734375;
    float _1090 = fma(_1076, _1076, _1084);
    float _1092 = _793 ? as_type<float>(_1012) : 0.0;
    out.m_45.x = _709;
    out.m_45.y = _795;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1094 = _793 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1080, _1080, _1090);
    float _1098 = _793 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _789;
    out.m_47.w = _787;
    float _1100 = _793 ? _1086 : 0.0;
    float _1102 = _793 ? _1088 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _793 ? _1082 : 0.0;
    float _1108 = _793 ? as_type<float>(_1018) : 0.0;
    float _1110 = _793 ? as_type<float>(_1020) : 0.0;
    float _1112 = _793 ? as_type<float>(_1022) : 0.0;
    float _1114 = _793 ? as_type<float>(_1024) : 0.0;
    float _1116 = _793 ? as_type<float>(_1026) : 0.0;
    float _1118 = _1104 * 1.02332699298858642578125;
    float _1120 = _1080 * _1104;
    float _1122 = _1072 * _1118;
    float _1124 = _1120 * (-1.02332699298858642578125);
    float _1126 = _1076 * _1118;
    float _1128 = _1122 * _1028;
    float _1130 = _1122 * _1030;
    float _1132 = _1122 * _1032;
    float _1134 = _1122 * _1034;
    float _1136 = fma(_1036, 0.88622701168060302734375, _1128);
    float _1138 = fma(_1038, 0.88622701168060302734375, _1130);
    float _1140 = _1122 * _1040;
    float _1142 = fma(_1042, 0.88622701168060302734375, _1132);
    float _1144 = fma(_1124, _1044, _1136);
    float _1146 = fma(_1124, _1046, _1138);
    float _1148 = fma(_1048, 0.88622701168060302734375, _1134);
    float _1150 = fma(_1050, 0.88622701168060302734375, _1140);
    float _1152 = fma(_1126, _1052, _1144);
    float _1154 = fma(_1126, _1054, _1146);
    float _1156 = fma(_1092, _1122, _1100);
    float _1158 = fma(_1094, _1122, _1102);
    float _1160 = fma(_1098, _1122, _1106);
    float _1162 = precise::max(0.0, _1152);
    float _1164 = fma(_1124, _1056, _1142);
    float _1166 = precise::max(0.0, _1154);
    float _1168 = fma(_1124, _1058, _1148);
    float _1170 = fma(_1124, _1060, _1150);
    float _1172 = _1162 * 0.31830990314483642578125;
    float _1174 = precise::clamp(_1172, 0.0, 1.0);
    float _1176 = fma(_1108, _1124, _1156);
    float _1178 = _1166 * 0.31830990314483642578125;
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = fma(_1110, _1124, _1158);
    float _1184 = fma(_1112, _1124, _1160);
    float _1186 = _793 ? as_type<float>(_1062) : 0.0;
    float _1188 = fma(_1126, _1064, _1164);
    float _1190 = fma(_1126, _1066, _1168);
    float _1192 = fma(_1126, _1068, _1170);
    float _1194 = _1174 * 0.88622701168060302734375;
    float _1196 = -_1180;
    float _1198 = _1196 + 1.0;
    float _1200 = fma(_1114, _1126, _1176);
    float _1202 = fma(_1186, _1126, _1182);
    float _1204 = fma(_1116, _1126, _1184);
    float _1206 = precise::max(0.0, _1188);
    float _1208 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1180);
    float _1210 = precise::max(0.0, _1190);
    float _1212 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1214 = precise::max(0.0, _1192);
    float _1216 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1218 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1220 = precise::max(0.0, _1200);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1212);
    float _1224 = precise::max(0.0, _1202);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1216);
    float _1228 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1218);
    float _1232 = precise::max(0.0, _1204);
    float _1234 = fma(_1220, _1228, _1226);
    float _1236 = fma(_1224, _1228, _1230);
    float _1238 = fma(_1232, _1228, _1222);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1234;
    out.m_51.y = _1236;
    out.m_51.z = _1238;
    out.m_51.w = _819;
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
    bool _919 = false;
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
        float2 _2428 = float2(_737, _733);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2428, float2(0.0), isnan(_2428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2428, float2(0.0), isnan(_2428)), level(0.0)).x;
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
    if (_104)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_104)
    {
        float2 _2521 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2521, float2(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2521, float2(0.0), isnan(_2521)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _789 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _793 = _791 != 0;
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _797 = _795 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _799 = _795 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _801 = _795 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].x, _797);
    float _805 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].x, _799);
    float _807 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].x, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _805);
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
    float _815 = _809 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _817 = _811 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _821 = _815 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _825 = _815 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _827 = _815 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _829 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[7].x, _821);
    float _831 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[8].x, _823);
    float _833 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[9].x, _825);
    float _835 = fma(_817, (*spvDescriptorSet0.vp_c4)._m0[10].x, _827);
    float _837 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[7].z, _829);
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[8].z, _831);
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[9].z, _833);
    float _843 = fma(_819, (*spvDescriptorSet0.vp_c4)._m0[10].z, _835);
    float _845 = _837 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _847 = _839 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _853 = !_793;
    float _855;
    float _857;
    float _859;
    int _861;
    int _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
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
    float _917;
    if (!_853)
    {
        _855 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _877 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _917 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _919 = true;
    }
    else
    {
        float _921 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _923 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2785 = float3(_921, _923, float(0));
        float3 _2789 = select(_2785, float3(0.0), isnan(_2785));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2789.xy, uint(rint(_2789.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2789.xy, uint(rint(_2789.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2804 = float3(_921, _923, float(1));
        float3 _2806 = select(_2804, float3(0.0), isnan(_2804));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2806.xy, uint(rint(_2806.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2806.xy, uint(rint(_2806.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2821 = float3(_921, _923, float(2));
        float3 _2823 = select(_2821, float3(0.0), isnan(_2821));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2823.xy, uint(rint(_2823.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2823.xy, uint(rint(_2823.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2838 = float3(_921, _923, float(3));
        float3 _2840 = select(_2838, float3(0.0), isnan(_2838));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2840.xy, uint(rint(_2840.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2840.xy, uint(rint(_2840.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2855 = float3(_921, _923, float(4));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2857.xy, uint(rint(_2857.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2857.xy, uint(rint(_2857.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        float3 _2872 = float3(_921, _923, float(5));
        float3 _2874 = select(_2872, float3(0.0), isnan(_2872));
        float4 _976 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2874.xy, uint(rint(_2874.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2874.xy, uint(rint(_2874.z)), level(0.0)).xyzw;
        float _978 = _976.x;
        float _980 = _976.y;
        float _982 = _976.z;
        float _984 = _976.w;
        float3 _2889 = float3(_921, _923, float(6));
        float3 _2891 = select(_2889, float3(0.0), isnan(_2889));
        float4 _986 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2891.xy, uint(rint(_2891.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2891.xy, uint(rint(_2891.z)), level(0.0)).xyzw;
        float _988 = _986.x;
        float _990 = _986.y;
        float _992 = _986.z;
        float _994 = _986.w;
        float3 _2906 = float3(_921, _923, float(7));
        float3 _2908 = select(_2906, float3(0.0), isnan(_2906));
        float4 _996 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2908.xy, uint(rint(_2908.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2908.xy, uint(rint(_2908.z)), level(0.0)).xyzw;
        float _998 = _996.x;
        float _1000 = _996.y;
        float _1002 = _996.z;
        float _1004 = _996.w;
        _855 = _962;
        _857 = _958;
        _859 = _960;
        _861 = as_type<int>(_964);
        _863 = as_type<int>(_968);
        _865 = as_type<int>(_970);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_978);
        _873 = as_type<int>(_980);
        _875 = as_type<int>(_984);
        _877 = _990;
        _879 = _1000;
        _881 = _940;
        _883 = _934;
        _885 = _988;
        _887 = _998;
        _889 = _938;
        _891 = _932;
        _893 = _992;
        _895 = _1002;
        _897 = _928;
        _899 = _930;
        _901 = _994;
        _903 = _1004;
        _905 = _948;
        _907 = _942;
        _909 = _944;
        _911 = as_type<int>(_982);
        _913 = _954;
        _915 = _950;
        _917 = _952;
    }
    _919 = false;
    float _1006 = _855;
    float _1008 = _857;
    float _1010 = _859;
    int _1012 = _861;
    int _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
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
    float _1068 = _917;
    float _1070 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1072 = _795 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1076 = _709 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1078;
    float _1082 = _1006 * 0.88622701168060302734375;
    float _1084 = _1072 * _1072;
    out.gl_Position.x = _845;
    out.gl_Position.y = _847;
    out.gl_Position.z = _849;
    out.gl_Position.w = _851;
    float _1086 = _1008 * 0.88622701168060302734375;
    float _1088 = _1010 * 0.88622701168060302734375;
    float _1090 = fma(_1076, _1076, _1084);
    float _1092 = _793 ? as_type<float>(_1012) : 0.0;
    out.m_45.x = _709;
    out.m_45.y = _795;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1094 = _793 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1080, _1080, _1090);
    float _1098 = _793 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _789;
    out.m_47.w = _787;
    float _1100 = _793 ? _1086 : 0.0;
    float _1102 = _793 ? _1088 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _793 ? _1082 : 0.0;
    float _1108 = _793 ? as_type<float>(_1018) : 0.0;
    float _1110 = _793 ? as_type<float>(_1020) : 0.0;
    float _1112 = _793 ? as_type<float>(_1022) : 0.0;
    float _1114 = _793 ? as_type<float>(_1024) : 0.0;
    float _1116 = _793 ? as_type<float>(_1026) : 0.0;
    float _1118 = _1104 * 1.02332699298858642578125;
    float _1120 = _1080 * _1104;
    float _1122 = _1072 * _1118;
    float _1124 = _1120 * (-1.02332699298858642578125);
    float _1126 = _1076 * _1118;
    float _1128 = _1122 * _1028;
    float _1130 = _1122 * _1030;
    float _1132 = _1122 * _1032;
    float _1134 = _1122 * _1034;
    float _1136 = fma(_1036, 0.88622701168060302734375, _1128);
    float _1138 = fma(_1038, 0.88622701168060302734375, _1130);
    float _1140 = _1122 * _1040;
    float _1142 = fma(_1042, 0.88622701168060302734375, _1132);
    float _1144 = fma(_1124, _1044, _1136);
    float _1146 = fma(_1124, _1046, _1138);
    float _1148 = fma(_1048, 0.88622701168060302734375, _1134);
    float _1150 = fma(_1050, 0.88622701168060302734375, _1140);
    float _1152 = fma(_1126, _1052, _1144);
    float _1154 = fma(_1126, _1054, _1146);
    float _1156 = fma(_1092, _1122, _1100);
    float _1158 = fma(_1094, _1122, _1102);
    float _1160 = fma(_1098, _1122, _1106);
    float _1162 = precise::max(0.0, _1152);
    float _1164 = fma(_1124, _1056, _1142);
    float _1166 = precise::max(0.0, _1154);
    float _1168 = fma(_1124, _1058, _1148);
    float _1170 = fma(_1124, _1060, _1150);
    float _1172 = _1162 * 0.31830990314483642578125;
    float _1174 = precise::clamp(_1172, 0.0, 1.0);
    float _1176 = fma(_1108, _1124, _1156);
    float _1178 = _1166 * 0.31830990314483642578125;
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = fma(_1110, _1124, _1158);
    float _1184 = fma(_1112, _1124, _1160);
    float _1186 = _793 ? as_type<float>(_1062) : 0.0;
    float _1188 = fma(_1126, _1064, _1164);
    float _1190 = fma(_1126, _1066, _1168);
    float _1192 = fma(_1126, _1068, _1170);
    float _1194 = _1174 * 0.88622701168060302734375;
    float _1196 = -_1180;
    float _1198 = _1196 + 1.0;
    float _1200 = fma(_1114, _1126, _1176);
    float _1202 = fma(_1186, _1126, _1182);
    float _1204 = fma(_1116, _1126, _1184);
    float _1206 = precise::max(0.0, _1188);
    float _1208 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1180);
    float _1210 = precise::max(0.0, _1190);
    float _1212 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1214 = precise::max(0.0, _1192);
    float _1216 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1218 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1220 = precise::max(0.0, _1200);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1212);
    float _1224 = precise::max(0.0, _1202);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1216);
    float _1228 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1218);
    float _1232 = precise::max(0.0, _1204);
    float _1234 = fma(_1220, _1228, _1226);
    float _1236 = fma(_1224, _1228, _1230);
    float _1238 = fma(_1232, _1228, _1222);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1234;
    out.m_51.y = _1236;
    out.m_51.z = _1238;
    out.m_51.w = _819;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

