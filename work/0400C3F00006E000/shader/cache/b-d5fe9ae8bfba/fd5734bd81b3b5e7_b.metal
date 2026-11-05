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
    bool _923 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _78 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _76;
    int _80 = _74 << 4;
    float _82 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    bool _86 = _80 == 0;
    bool _88 = _80 == 16;
    bool _90 = _80 == 32;
    bool _92 = _80 == 48;
    bool _94 = _80 == 64;
    float _96 = fma(_71, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _98 = _80 == 80;
    bool _100 = _65 >= 0.5;
    bool _102 = isnan(_65);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.5);
    bool _108 = _104 || _106;
    float _110 = as_type<float>(gl_BaseInstance);
    float _112 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_86)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _96 + _116;
    float _120 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _122 = _80 == 96;
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
    float _136 = fma(_78, _78, _124);
    float _138 = _134;
    if (_88)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _132;
    bool _142 = _80 == 112;
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
    bool _156 = _80 == 128;
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
    bool _166 = _80 == 144;
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
    bool _176 = _80 == 160;
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
    bool _188 = _80 == 176;
    float _190 = _186;
    if (_98)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _80 == 192;
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
    bool _210 = _80 == 208;
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
    bool _220 = _80 == 224;
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
    bool _232 = _80 == 240;
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
    bool _246 = _80 == 256;
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
    bool _256 = _80 == 272;
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
    bool _268 = _80 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _80 == 304;
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
    bool _319 = _80 == 320;
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
    bool _331 = _80 == 336;
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
    bool _343 = _80 == 352;
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
    bool _353 = _80 == 368;
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
    bool _365 = _80 == 384;
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
    bool _375 = _80 == 400;
    float _377 = _373;
    if (_276)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _80 == 416;
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
    bool _395 = _80 == 432;
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
    bool _405 = _80 == 448;
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
    bool _415 = _80 == 464;
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
    bool _425 = _80 == 480;
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
    bool _435 = _80 == 496;
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
    bool _445 = _80 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _80 == 528;
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
    bool _465 = _80 == 544;
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
    bool _475 = _80 == 560;
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
    bool _485 = _80 == 576;
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
    bool _495 = _80 == 592;
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
    bool _505 = _80 == 608;
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
    bool _515 = _80 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _80 == 640;
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
    bool _535 = _80 == 656;
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
    bool _545 = _80 == 672;
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
    bool _555 = _80 == 688;
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
    bool _565 = _80 == 704;
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
    bool _575 = _80 == 720;
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
    bool _585 = _80 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _80 == 752;
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
    float _629 = _621 * _67;
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
    float _663 = fma(_653, _661, _67);
    float _665 = floor(_659);
    float _667 = _653 * _665;
    float _669 = _667 * 0.5;
    float _671 = _669 + _663;
    float _673 = fma(_71, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _679 = _673 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _683 = _675 + _681;
    float _685 = _679 * _679;
    float _687 = fma(_78, _78, _685);
    float _689 = _685;
    float _691 = _671;
    if (!_108)
    {
        _689 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _689;
    float _695 = fma(_683, _683, _687);
    float _697 = sqrt(_695);
    float _699 = -_317;
    float _701 = fma(_697, _309, _699);
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = -_669;
    float _707 = fma(_705, _703, _671);
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _707;
    float _713 = _695;
    float _715 = _693;
    if (!_108)
    {
        float _717 = fma(_82, _693, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _717;
    }
    float _719 = _711;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _723 = _719;
    if (!_108)
    {
        float _725 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _723 = _725;
    }
    float _727 = _723;
    if (!_108)
    {
        float _729 = fma(_721, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _713 = _729;
    }
    float _731 = _713;
    float _733 = _731;
    if (!_108)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
        _733 = _735;
    }
    float _737 = _733;
    if (!_108)
    {
        float2 _2432 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2432, float2(0.0), isnan(_2432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2432, float2(0.0), isnan(_2432)), level(0.0)).x;
        _112 = _739;
    }
    float _741 = _112;
    if (_108)
    {
        _284 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _284;
    float _745 = _743;
    if (_108)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _691;
    if (_108)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _749;
    }
    float _751 = _715;
    float _753 = _751;
    if (_108)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_108)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_108)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_108)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_108)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_108)
    {
        float2 _2525 = float2(_775, _779);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2525, float2(0.0), isnan(_2525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2525, float2(0.0), isnan(_2525)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_82, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _789 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _791 = fma(_82, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _793 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _801 = _799 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _803 = _799 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _813 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].z, _807);
    float _815 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].z, _809);
    float _817 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _821 = _815 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _823 = _817 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _825 = _819 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[7].x, _825);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[8].x, _827);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[9].x, _829);
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[10].x, _831);
    float _841 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[7].z, _833);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[8].z, _835);
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[9].z, _837);
    float _847 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[10].z, _839);
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _857 = !_797;
    float _859;
    float _861;
    float _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
    int _877;
    int _879;
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
    float _911;
    float _913;
    float _915;
    int _917;
    float _919;
    float _921;
    if (!_857)
    {
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _881 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _911 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _913 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _919 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _921 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _923 = true;
    }
    else
    {
        float _925 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _927 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2801 = float3(_927, _925, float(0));
        float3 _2805 = select(_2801, float3(0.0), isnan(_2801));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2805.xy, uint(rint(_2805.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2805.xy, uint(rint(_2805.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2820 = float3(_927, _925, float(1));
        float3 _2822 = select(_2820, float3(0.0), isnan(_2820));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2822.xy, uint(rint(_2822.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2822.xy, uint(rint(_2822.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2837 = float3(_927, _925, float(2));
        float3 _2839 = select(_2837, float3(0.0), isnan(_2837));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2839.xy, uint(rint(_2839.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2839.xy, uint(rint(_2839.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2854 = float3(_927, _925, float(3));
        float3 _2856 = select(_2854, float3(0.0), isnan(_2854));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2856.xy, uint(rint(_2856.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2856.xy, uint(rint(_2856.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        float3 _2871 = float3(_927, _925, float(4));
        float3 _2873 = select(_2871, float3(0.0), isnan(_2871));
        float4 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2873.xy, uint(rint(_2873.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2873.xy, uint(rint(_2873.z)), level(0.0)).xyzw;
        float _972 = _970.x;
        float _974 = _970.y;
        float _976 = _970.z;
        float _978 = _970.w;
        float3 _2888 = float3(_927, _925, float(5));
        float3 _2890 = select(_2888, float3(0.0), isnan(_2888));
        float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2890.xy, uint(rint(_2890.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2890.xy, uint(rint(_2890.z)), level(0.0)).xyzw;
        float _982 = _980.x;
        float _984 = _980.y;
        float _986 = _980.z;
        float _988 = _980.w;
        float3 _2905 = float3(_927, _925, float(6));
        float3 _2907 = select(_2905, float3(0.0), isnan(_2905));
        float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2907.xy, uint(rint(_2907.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2907.xy, uint(rint(_2907.z)), level(0.0)).xyzw;
        float _992 = _990.x;
        float _994 = _990.y;
        float _996 = _990.z;
        float _998 = _990.w;
        float3 _2922 = float3(_927, _925, float(7));
        float3 _2924 = select(_2922, float3(0.0), isnan(_2922));
        float4 _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2924.xy, uint(rint(_2924.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2924.xy, uint(rint(_2924.z)), level(0.0)).xyzw;
        float _1002 = _1000.x;
        float _1004 = _1000.y;
        float _1006 = _1000.z;
        float _1008 = _1000.w;
        _859 = _966;
        _861 = _962;
        _863 = _964;
        _865 = as_type<int>(_968);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_976);
        _873 = as_type<int>(_978);
        _875 = as_type<int>(_982);
        _877 = as_type<int>(_984);
        _879 = as_type<int>(_988);
        _881 = _994;
        _883 = _1004;
        _885 = _938;
        _887 = _942;
        _889 = _992;
        _891 = _1002;
        _893 = _932;
        _895 = _944;
        _897 = _996;
        _899 = _1006;
        _901 = _946;
        _903 = _934;
        _905 = _998;
        _907 = _1008;
        _909 = _936;
        _911 = _954;
        _913 = _948;
        _915 = _952;
        _917 = as_type<int>(_986);
        _919 = _956;
        _921 = _958;
    }
    _923 = false;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
    int _1028 = _877;
    int _1030 = _879;
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
    float _1062 = _911;
    float _1064 = _913;
    float _1066 = _915;
    int _1068 = _917;
    float _1070 = _919;
    float _1072 = _921;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1076 = _799 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1084 = _709 + _1082;
    float _1086 = _1010 * 0.88622701168060302734375;
    float _1088 = _1076 * _1076;
    out.gl_Position.x = _849;
    out.gl_Position.y = _851;
    out.gl_Position.z = _853;
    out.gl_Position.w = _855;
    float _1090 = _1012 * 0.88622701168060302734375;
    float _1092 = _1014 * 0.88622701168060302734375;
    float _1094 = fma(_1080, _1080, _1088);
    float _1096 = _797 ? as_type<float>(_1016) : 0.0;
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _799;
    out.m_45.z = _709;
    float _1098 = _797 ? as_type<float>(_1018) : 0.0;
    float _1100 = fma(_1084, _1084, _1094);
    float _1102 = _797 ? as_type<float>(_1020) : 0.0;
    out.m_47.z = _791;
    out.m_47.w = _793;
    float _1104 = _797 ? _1090 : 0.0;
    float _1106 = _797 ? _1092 : 0.0;
    float _1108 = rsqrt(_1100);
    float _1110 = _797 ? _1086 : 0.0;
    out.m_49.x = _787;
    out.m_49.y = _789;
    float _1112 = _797 ? as_type<float>(_1022) : 0.0;
    float _1114 = _797 ? as_type<float>(_1024) : 0.0;
    float _1116 = _797 ? as_type<float>(_1026) : 0.0;
    float _1118 = _797 ? as_type<float>(_1028) : 0.0;
    float _1120 = _797 ? as_type<float>(_1030) : 0.0;
    float _1122 = _1108 * 1.02332699298858642578125;
    float _1124 = _1084 * _1108;
    float _1126 = _1076 * _1122;
    float _1128 = _1124 * (-1.02332699298858642578125);
    float _1130 = _1080 * _1122;
    float _1132 = _1126 * _1032;
    float _1134 = _1126 * _1034;
    float _1136 = _1126 * _1036;
    float _1138 = _1126 * _1038;
    float _1140 = fma(_1040, 0.88622701168060302734375, _1132);
    float _1142 = fma(_1042, 0.88622701168060302734375, _1134);
    float _1144 = fma(_1044, 0.88622701168060302734375, _1136);
    float _1146 = _1126 * _1046;
    float _1148 = fma(_1128, _1048, _1140);
    float _1150 = fma(_1128, _1050, _1142);
    float _1152 = fma(_1128, _1052, _1144);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1138);
    float _1156 = fma(_1130, _1056, _1148);
    float _1158 = fma(_1130, _1058, _1150);
    float _1160 = fma(_1060, 0.88622701168060302734375, _1146);
    float _1162 = fma(_1096, _1126, _1104);
    float _1164 = fma(_1098, _1126, _1106);
    float _1166 = precise::max(0.0, _1156);
    float _1168 = fma(_1102, _1126, _1110);
    float _1170 = precise::max(0.0, _1158);
    float _1172 = fma(_1130, _1062, _1152);
    float _1174 = fma(_1128, _1064, _1154);
    float _1176 = _1166 * 0.31830990314483642578125;
    float _1178 = precise::clamp(_1176, 0.0, 1.0);
    float _1180 = fma(_1128, _1066, _1160);
    float _1182 = _1170 * 0.31830990314483642578125;
    float _1184 = precise::clamp(_1182, 0.0, 1.0);
    float _1186 = fma(_1112, _1128, _1162);
    float _1188 = _1178 * 0.88622701168060302734375;
    float _1190 = fma(_1114, _1128, _1164);
    float _1192 = fma(_1116, _1128, _1168);
    float _1194 = _797 ? as_type<float>(_1068) : 0.0;
    float _1196 = fma(_1130, _1070, _1174);
    float _1198 = precise::max(0.0, _1172);
    float _1200 = fma(_1130, _1072, _1180);
    float _1202 = -_1184;
    float _1204 = _1202 + 1.0;
    float _1206 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1208 = fma(_1118, _1130, _1186);
    float _1210 = fma(_1194, _1130, _1190);
    float _1212 = fma(_1120, _1130, _1192);
    float _1214 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1184);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1206);
    float _1218 = precise::max(0.0, _1196);
    float _1220 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1222 = precise::max(0.0, _1200);
    float _1224 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1226 = precise::max(0.0, _1208);
    float _1228 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1230 = precise::max(0.0, _1210);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1220);
    float _1234 = precise::max(0.0, _1212);
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1224);
    float _1238 = fma(_1226, _1228, _1216);
    float _1240 = fma(_1230, _1228, _1232);
    float _1242 = fma(_1234, _1228, _1236);
    out.m_51.x = _1238;
    out.m_51.y = _1240;
    out.m_51.z = _1242;
    out.m_51.w = _823;
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
    bool _923 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _78 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _76;
    int _80 = _74 << 4;
    float _82 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    bool _86 = _80 == 0;
    bool _88 = _80 == 16;
    bool _90 = _80 == 32;
    bool _92 = _80 == 48;
    bool _94 = _80 == 64;
    float _96 = fma(_71, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _98 = _80 == 80;
    bool _100 = _65 >= 0.5;
    bool _102 = isnan(_65);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.5);
    bool _108 = _104 || _106;
    float _110 = as_type<float>(gl_BaseInstance);
    float _112 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_86)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _96 + _116;
    float _120 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _122 = _80 == 96;
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
    float _136 = fma(_78, _78, _124);
    float _138 = _134;
    if (_88)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _132;
    bool _142 = _80 == 112;
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
    bool _156 = _80 == 128;
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
    bool _166 = _80 == 144;
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
    bool _176 = _80 == 160;
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
    bool _188 = _80 == 176;
    float _190 = _186;
    if (_98)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _80 == 192;
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
    bool _210 = _80 == 208;
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
    bool _220 = _80 == 224;
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
    bool _232 = _80 == 240;
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
    bool _246 = _80 == 256;
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
    bool _256 = _80 == 272;
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
    bool _268 = _80 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _80 == 304;
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
    bool _319 = _80 == 320;
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
    bool _331 = _80 == 336;
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
    bool _343 = _80 == 352;
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
    bool _353 = _80 == 368;
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
    bool _365 = _80 == 384;
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
    bool _375 = _80 == 400;
    float _377 = _373;
    if (_276)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _80 == 416;
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
    bool _395 = _80 == 432;
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
    bool _405 = _80 == 448;
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
    bool _415 = _80 == 464;
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
    bool _425 = _80 == 480;
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
    bool _435 = _80 == 496;
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
    bool _445 = _80 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _80 == 528;
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
    bool _465 = _80 == 544;
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
    bool _475 = _80 == 560;
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
    bool _485 = _80 == 576;
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
    bool _495 = _80 == 592;
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
    bool _505 = _80 == 608;
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
    bool _515 = _80 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _80 == 640;
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
    bool _535 = _80 == 656;
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
    bool _545 = _80 == 672;
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
    bool _555 = _80 == 688;
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
    bool _565 = _80 == 704;
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
    bool _575 = _80 == 720;
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
    bool _585 = _80 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _80 == 752;
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
    float _629 = _621 * _67;
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
    float _663 = fma(_653, _661, _67);
    float _665 = floor(_659);
    float _667 = _653 * _665;
    float _669 = _667 * 0.5;
    float _671 = _669 + _663;
    float _673 = fma(_71, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _679 = _673 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _683 = _675 + _681;
    float _685 = _679 * _679;
    float _687 = fma(_78, _78, _685);
    float _689 = _685;
    float _691 = _671;
    if (!_108)
    {
        _689 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _689;
    float _695 = fma(_683, _683, _687);
    float _697 = sqrt(_695);
    float _699 = -_317;
    float _701 = fma(_697, _309, _699);
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = -_669;
    float _707 = fma(_705, _703, _671);
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _707;
    float _713 = _695;
    float _715 = _693;
    if (!_108)
    {
        float _717 = fma(_82, _693, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _717;
    }
    float _719 = _711;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _723 = _719;
    if (!_108)
    {
        float _725 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _723 = _725;
    }
    float _727 = _723;
    if (!_108)
    {
        float _729 = fma(_721, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _713 = _729;
    }
    float _731 = _713;
    float _733 = _731;
    if (!_108)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
        _733 = _735;
    }
    float _737 = _733;
    if (!_108)
    {
        float2 _2432 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2432, float2(0.0), isnan(_2432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2432, float2(0.0), isnan(_2432)), level(0.0)).x;
        _112 = _739;
    }
    float _741 = _112;
    if (_108)
    {
        _284 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _284;
    float _745 = _743;
    if (_108)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _691;
    if (_108)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _749;
    }
    float _751 = _715;
    float _753 = _751;
    if (_108)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_108)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_108)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_108)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_108)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_108)
    {
        float2 _2525 = float2(_775, _779);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2525, float2(0.0), isnan(_2525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2525, float2(0.0), isnan(_2525)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_82, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _789 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _791 = fma(_82, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _793 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _801 = _799 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _803 = _799 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _813 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].z, _807);
    float _815 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].z, _809);
    float _817 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _821 = _815 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _823 = _817 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _825 = _819 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[7].x, _825);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[8].x, _827);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[9].x, _829);
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[10].x, _831);
    float _841 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[7].z, _833);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[8].z, _835);
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[9].z, _837);
    float _847 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[10].z, _839);
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _857 = !_797;
    float _859;
    float _861;
    float _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
    int _877;
    int _879;
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
    float _911;
    float _913;
    float _915;
    int _917;
    float _919;
    float _921;
    if (!_857)
    {
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _881 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _911 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _913 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _919 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _921 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _923 = true;
    }
    else
    {
        float _925 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _927 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2801 = float3(_927, _925, float(0));
        float3 _2805 = select(_2801, float3(0.0), isnan(_2801));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2805.xy, uint(rint(_2805.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2805.xy, uint(rint(_2805.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2820 = float3(_927, _925, float(1));
        float3 _2822 = select(_2820, float3(0.0), isnan(_2820));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2822.xy, uint(rint(_2822.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2822.xy, uint(rint(_2822.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2837 = float3(_927, _925, float(2));
        float3 _2839 = select(_2837, float3(0.0), isnan(_2837));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2839.xy, uint(rint(_2839.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2839.xy, uint(rint(_2839.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2854 = float3(_927, _925, float(3));
        float3 _2856 = select(_2854, float3(0.0), isnan(_2854));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2856.xy, uint(rint(_2856.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2856.xy, uint(rint(_2856.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        float3 _2871 = float3(_927, _925, float(4));
        float3 _2873 = select(_2871, float3(0.0), isnan(_2871));
        float4 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2873.xy, uint(rint(_2873.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2873.xy, uint(rint(_2873.z)), level(0.0)).xyzw;
        float _972 = _970.x;
        float _974 = _970.y;
        float _976 = _970.z;
        float _978 = _970.w;
        float3 _2888 = float3(_927, _925, float(5));
        float3 _2890 = select(_2888, float3(0.0), isnan(_2888));
        float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2890.xy, uint(rint(_2890.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2890.xy, uint(rint(_2890.z)), level(0.0)).xyzw;
        float _982 = _980.x;
        float _984 = _980.y;
        float _986 = _980.z;
        float _988 = _980.w;
        float3 _2905 = float3(_927, _925, float(6));
        float3 _2907 = select(_2905, float3(0.0), isnan(_2905));
        float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2907.xy, uint(rint(_2907.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2907.xy, uint(rint(_2907.z)), level(0.0)).xyzw;
        float _992 = _990.x;
        float _994 = _990.y;
        float _996 = _990.z;
        float _998 = _990.w;
        float3 _2922 = float3(_927, _925, float(7));
        float3 _2924 = select(_2922, float3(0.0), isnan(_2922));
        float4 _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2924.xy, uint(rint(_2924.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2924.xy, uint(rint(_2924.z)), level(0.0)).xyzw;
        float _1002 = _1000.x;
        float _1004 = _1000.y;
        float _1006 = _1000.z;
        float _1008 = _1000.w;
        _859 = _966;
        _861 = _962;
        _863 = _964;
        _865 = as_type<int>(_968);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_976);
        _873 = as_type<int>(_978);
        _875 = as_type<int>(_982);
        _877 = as_type<int>(_984);
        _879 = as_type<int>(_988);
        _881 = _994;
        _883 = _1004;
        _885 = _938;
        _887 = _942;
        _889 = _992;
        _891 = _1002;
        _893 = _932;
        _895 = _944;
        _897 = _996;
        _899 = _1006;
        _901 = _946;
        _903 = _934;
        _905 = _998;
        _907 = _1008;
        _909 = _936;
        _911 = _954;
        _913 = _948;
        _915 = _952;
        _917 = as_type<int>(_986);
        _919 = _956;
        _921 = _958;
    }
    _923 = false;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
    int _1028 = _877;
    int _1030 = _879;
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
    float _1062 = _911;
    float _1064 = _913;
    float _1066 = _915;
    int _1068 = _917;
    float _1070 = _919;
    float _1072 = _921;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1076 = _799 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1084 = _709 + _1082;
    float _1086 = _1010 * 0.88622701168060302734375;
    float _1088 = _1076 * _1076;
    out.gl_Position.x = _849;
    out.gl_Position.y = _851;
    out.gl_Position.z = _853;
    out.gl_Position.w = _855;
    float _1090 = _1012 * 0.88622701168060302734375;
    float _1092 = _1014 * 0.88622701168060302734375;
    float _1094 = fma(_1080, _1080, _1088);
    float _1096 = _797 ? as_type<float>(_1016) : 0.0;
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _799;
    out.m_45.z = _709;
    float _1098 = _797 ? as_type<float>(_1018) : 0.0;
    float _1100 = fma(_1084, _1084, _1094);
    float _1102 = _797 ? as_type<float>(_1020) : 0.0;
    out.m_47.z = _791;
    out.m_47.w = _793;
    float _1104 = _797 ? _1090 : 0.0;
    float _1106 = _797 ? _1092 : 0.0;
    float _1108 = rsqrt(_1100);
    float _1110 = _797 ? _1086 : 0.0;
    out.m_49.x = _787;
    out.m_49.y = _789;
    float _1112 = _797 ? as_type<float>(_1022) : 0.0;
    float _1114 = _797 ? as_type<float>(_1024) : 0.0;
    float _1116 = _797 ? as_type<float>(_1026) : 0.0;
    float _1118 = _797 ? as_type<float>(_1028) : 0.0;
    float _1120 = _797 ? as_type<float>(_1030) : 0.0;
    float _1122 = _1108 * 1.02332699298858642578125;
    float _1124 = _1084 * _1108;
    float _1126 = _1076 * _1122;
    float _1128 = _1124 * (-1.02332699298858642578125);
    float _1130 = _1080 * _1122;
    float _1132 = _1126 * _1032;
    float _1134 = _1126 * _1034;
    float _1136 = _1126 * _1036;
    float _1138 = _1126 * _1038;
    float _1140 = fma(_1040, 0.88622701168060302734375, _1132);
    float _1142 = fma(_1042, 0.88622701168060302734375, _1134);
    float _1144 = fma(_1044, 0.88622701168060302734375, _1136);
    float _1146 = _1126 * _1046;
    float _1148 = fma(_1128, _1048, _1140);
    float _1150 = fma(_1128, _1050, _1142);
    float _1152 = fma(_1128, _1052, _1144);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1138);
    float _1156 = fma(_1130, _1056, _1148);
    float _1158 = fma(_1130, _1058, _1150);
    float _1160 = fma(_1060, 0.88622701168060302734375, _1146);
    float _1162 = fma(_1096, _1126, _1104);
    float _1164 = fma(_1098, _1126, _1106);
    float _1166 = precise::max(0.0, _1156);
    float _1168 = fma(_1102, _1126, _1110);
    float _1170 = precise::max(0.0, _1158);
    float _1172 = fma(_1130, _1062, _1152);
    float _1174 = fma(_1128, _1064, _1154);
    float _1176 = _1166 * 0.31830990314483642578125;
    float _1178 = precise::clamp(_1176, 0.0, 1.0);
    float _1180 = fma(_1128, _1066, _1160);
    float _1182 = _1170 * 0.31830990314483642578125;
    float _1184 = precise::clamp(_1182, 0.0, 1.0);
    float _1186 = fma(_1112, _1128, _1162);
    float _1188 = _1178 * 0.88622701168060302734375;
    float _1190 = fma(_1114, _1128, _1164);
    float _1192 = fma(_1116, _1128, _1168);
    float _1194 = _797 ? as_type<float>(_1068) : 0.0;
    float _1196 = fma(_1130, _1070, _1174);
    float _1198 = precise::max(0.0, _1172);
    float _1200 = fma(_1130, _1072, _1180);
    float _1202 = -_1184;
    float _1204 = _1202 + 1.0;
    float _1206 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1208 = fma(_1118, _1130, _1186);
    float _1210 = fma(_1194, _1130, _1190);
    float _1212 = fma(_1120, _1130, _1192);
    float _1214 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1184);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1206);
    float _1218 = precise::max(0.0, _1196);
    float _1220 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1222 = precise::max(0.0, _1200);
    float _1224 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1226 = precise::max(0.0, _1208);
    float _1228 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1230 = precise::max(0.0, _1210);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1220);
    float _1234 = precise::max(0.0, _1212);
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1224);
    float _1238 = fma(_1226, _1228, _1216);
    float _1240 = fma(_1230, _1228, _1232);
    float _1242 = fma(_1234, _1228, _1236);
    out.m_51.x = _1238;
    out.m_51.y = _1240;
    out.m_51.z = _1242;
    out.m_51.w = _823;
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
    bool _923 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _78 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _76;
    int _80 = _74 << 4;
    float _82 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    bool _86 = _80 == 0;
    bool _88 = _80 == 16;
    bool _90 = _80 == 32;
    bool _92 = _80 == 48;
    bool _94 = _80 == 64;
    float _96 = fma(_71, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _98 = _80 == 80;
    bool _100 = _65 >= 0.5;
    bool _102 = isnan(_65);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.5);
    bool _108 = _104 || _106;
    float _110 = as_type<float>(gl_BaseInstance);
    float _112 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_86)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _96 + _116;
    float _120 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _122 = _80 == 96;
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
    float _136 = fma(_78, _78, _124);
    float _138 = _134;
    if (_88)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _132;
    bool _142 = _80 == 112;
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
    bool _156 = _80 == 128;
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
    bool _166 = _80 == 144;
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
    bool _176 = _80 == 160;
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
    bool _188 = _80 == 176;
    float _190 = _186;
    if (_98)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _80 == 192;
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
    bool _210 = _80 == 208;
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
    bool _220 = _80 == 224;
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
    bool _232 = _80 == 240;
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
    bool _246 = _80 == 256;
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
    bool _256 = _80 == 272;
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
    bool _268 = _80 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _80 == 304;
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
    bool _319 = _80 == 320;
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
    bool _331 = _80 == 336;
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
    bool _343 = _80 == 352;
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
    bool _353 = _80 == 368;
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
    bool _365 = _80 == 384;
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
    bool _375 = _80 == 400;
    float _377 = _373;
    if (_276)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _379 = _371;
    bool _381 = _80 == 416;
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
    bool _395 = _80 == 432;
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
    bool _405 = _80 == 448;
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
    bool _415 = _80 == 464;
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
    bool _425 = _80 == 480;
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
    bool _435 = _80 == 496;
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
    bool _445 = _80 == 512;
    float _447 = _443;
    if (_381)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _449 = _441;
    bool _451 = _80 == 528;
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
    bool _465 = _80 == 544;
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
    bool _475 = _80 == 560;
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
    bool _485 = _80 == 576;
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
    bool _495 = _80 == 592;
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
    bool _505 = _80 == 608;
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
    bool _515 = _80 == 624;
    float _517 = _513;
    if (_451)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _519 = _511;
    bool _521 = _80 == 640;
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
    bool _535 = _80 == 656;
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
    bool _545 = _80 == 672;
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
    bool _555 = _80 == 688;
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
    bool _565 = _80 == 704;
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
    bool _575 = _80 == 720;
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
    bool _585 = _80 == 736;
    float _587 = _583;
    if (_521)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _589 = _581;
    bool _591 = _80 == 752;
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
    float _629 = _621 * _67;
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
    float _663 = fma(_653, _661, _67);
    float _665 = floor(_659);
    float _667 = _653 * _665;
    float _669 = _667 * 0.5;
    float _671 = _669 + _663;
    float _673 = fma(_71, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _679 = _673 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _683 = _675 + _681;
    float _685 = _679 * _679;
    float _687 = fma(_78, _78, _685);
    float _689 = _685;
    float _691 = _671;
    if (!_108)
    {
        _689 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _693 = _689;
    float _695 = fma(_683, _683, _687);
    float _697 = sqrt(_695);
    float _699 = -_317;
    float _701 = fma(_697, _309, _699);
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = -_669;
    float _707 = fma(_705, _703, _671);
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _707;
    float _713 = _695;
    float _715 = _693;
    if (!_108)
    {
        float _717 = fma(_82, _693, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _717;
    }
    float _719 = _711;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _723 = _719;
    if (!_108)
    {
        float _725 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _723 = _725;
    }
    float _727 = _723;
    if (!_108)
    {
        float _729 = fma(_721, _693, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _713 = _729;
    }
    float _731 = _713;
    float _733 = _731;
    if (!_108)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
        _733 = _735;
    }
    float _737 = _733;
    if (!_108)
    {
        float2 _2432 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2432, float2(0.0), isnan(_2432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2432, float2(0.0), isnan(_2432)), level(0.0)).x;
        _112 = _739;
    }
    float _741 = _112;
    if (_108)
    {
        _284 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _284;
    float _745 = _743;
    if (_108)
    {
        _691 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _691;
    if (_108)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _749;
    }
    float _751 = _715;
    float _753 = _751;
    if (_108)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_108)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_108)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_108)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_108)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_108)
    {
        float2 _2525 = float2(_775, _779);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2525, float2(0.0), isnan(_2525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2525, float2(0.0), isnan(_2525)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_82, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _789 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _791 = fma(_82, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _793 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _801 = _799 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _803 = _799 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _801);
    float _809 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _803);
    float _811 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _813 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].z, _807);
    float _815 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].z, _809);
    float _817 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _821 = _815 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _823 = _817 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _825 = _819 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[7].x, _825);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[8].x, _827);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[9].x, _829);
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[10].x, _831);
    float _841 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[7].z, _833);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[8].z, _835);
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[9].z, _837);
    float _847 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[10].z, _839);
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _857 = !_797;
    float _859;
    float _861;
    float _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
    int _877;
    int _879;
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
    float _911;
    float _913;
    float _915;
    int _917;
    float _919;
    float _921;
    if (!_857)
    {
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _881 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _911 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _913 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _915 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _919 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _921 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _923 = true;
    }
    else
    {
        float _925 = fma(_709, 6.2500002968590706586837768554688e-05, 0.5);
        float _927 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2801 = float3(_927, _925, float(0));
        float3 _2805 = select(_2801, float3(0.0), isnan(_2801));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2805.xy, uint(rint(_2805.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2805.xy, uint(rint(_2805.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2820 = float3(_927, _925, float(1));
        float3 _2822 = select(_2820, float3(0.0), isnan(_2820));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2822.xy, uint(rint(_2822.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2822.xy, uint(rint(_2822.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2837 = float3(_927, _925, float(2));
        float3 _2839 = select(_2837, float3(0.0), isnan(_2837));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2839.xy, uint(rint(_2839.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2839.xy, uint(rint(_2839.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2854 = float3(_927, _925, float(3));
        float3 _2856 = select(_2854, float3(0.0), isnan(_2854));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2856.xy, uint(rint(_2856.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2856.xy, uint(rint(_2856.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        float3 _2871 = float3(_927, _925, float(4));
        float3 _2873 = select(_2871, float3(0.0), isnan(_2871));
        float4 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2873.xy, uint(rint(_2873.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2873.xy, uint(rint(_2873.z)), level(0.0)).xyzw;
        float _972 = _970.x;
        float _974 = _970.y;
        float _976 = _970.z;
        float _978 = _970.w;
        float3 _2888 = float3(_927, _925, float(5));
        float3 _2890 = select(_2888, float3(0.0), isnan(_2888));
        float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2890.xy, uint(rint(_2890.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2890.xy, uint(rint(_2890.z)), level(0.0)).xyzw;
        float _982 = _980.x;
        float _984 = _980.y;
        float _986 = _980.z;
        float _988 = _980.w;
        float3 _2905 = float3(_927, _925, float(6));
        float3 _2907 = select(_2905, float3(0.0), isnan(_2905));
        float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2907.xy, uint(rint(_2907.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2907.xy, uint(rint(_2907.z)), level(0.0)).xyzw;
        float _992 = _990.x;
        float _994 = _990.y;
        float _996 = _990.z;
        float _998 = _990.w;
        float3 _2922 = float3(_927, _925, float(7));
        float3 _2924 = select(_2922, float3(0.0), isnan(_2922));
        float4 _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2924.xy, uint(rint(_2924.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2924.xy, uint(rint(_2924.z)), level(0.0)).xyzw;
        float _1002 = _1000.x;
        float _1004 = _1000.y;
        float _1006 = _1000.z;
        float _1008 = _1000.w;
        _859 = _966;
        _861 = _962;
        _863 = _964;
        _865 = as_type<int>(_968);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_976);
        _873 = as_type<int>(_978);
        _875 = as_type<int>(_982);
        _877 = as_type<int>(_984);
        _879 = as_type<int>(_988);
        _881 = _994;
        _883 = _1004;
        _885 = _938;
        _887 = _942;
        _889 = _992;
        _891 = _1002;
        _893 = _932;
        _895 = _944;
        _897 = _996;
        _899 = _1006;
        _901 = _946;
        _903 = _934;
        _905 = _998;
        _907 = _1008;
        _909 = _936;
        _911 = _954;
        _913 = _948;
        _915 = _952;
        _917 = as_type<int>(_986);
        _919 = _956;
        _921 = _958;
    }
    _923 = false;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
    int _1028 = _877;
    int _1030 = _879;
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
    float _1062 = _911;
    float _1064 = _913;
    float _1066 = _915;
    int _1068 = _917;
    float _1070 = _919;
    float _1072 = _921;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1076 = _799 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1084 = _709 + _1082;
    float _1086 = _1010 * 0.88622701168060302734375;
    float _1088 = _1076 * _1076;
    out.gl_Position.x = _849;
    out.gl_Position.y = _851;
    out.gl_Position.z = _853;
    out.gl_Position.w = _855;
    float _1090 = _1012 * 0.88622701168060302734375;
    float _1092 = _1014 * 0.88622701168060302734375;
    float _1094 = fma(_1080, _1080, _1088);
    float _1096 = _797 ? as_type<float>(_1016) : 0.0;
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _799;
    out.m_45.z = _709;
    float _1098 = _797 ? as_type<float>(_1018) : 0.0;
    float _1100 = fma(_1084, _1084, _1094);
    float _1102 = _797 ? as_type<float>(_1020) : 0.0;
    out.m_47.z = _791;
    out.m_47.w = _793;
    float _1104 = _797 ? _1090 : 0.0;
    float _1106 = _797 ? _1092 : 0.0;
    float _1108 = rsqrt(_1100);
    float _1110 = _797 ? _1086 : 0.0;
    out.m_49.x = _787;
    out.m_49.y = _789;
    float _1112 = _797 ? as_type<float>(_1022) : 0.0;
    float _1114 = _797 ? as_type<float>(_1024) : 0.0;
    float _1116 = _797 ? as_type<float>(_1026) : 0.0;
    float _1118 = _797 ? as_type<float>(_1028) : 0.0;
    float _1120 = _797 ? as_type<float>(_1030) : 0.0;
    float _1122 = _1108 * 1.02332699298858642578125;
    float _1124 = _1084 * _1108;
    float _1126 = _1076 * _1122;
    float _1128 = _1124 * (-1.02332699298858642578125);
    float _1130 = _1080 * _1122;
    float _1132 = _1126 * _1032;
    float _1134 = _1126 * _1034;
    float _1136 = _1126 * _1036;
    float _1138 = _1126 * _1038;
    float _1140 = fma(_1040, 0.88622701168060302734375, _1132);
    float _1142 = fma(_1042, 0.88622701168060302734375, _1134);
    float _1144 = fma(_1044, 0.88622701168060302734375, _1136);
    float _1146 = _1126 * _1046;
    float _1148 = fma(_1128, _1048, _1140);
    float _1150 = fma(_1128, _1050, _1142);
    float _1152 = fma(_1128, _1052, _1144);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1138);
    float _1156 = fma(_1130, _1056, _1148);
    float _1158 = fma(_1130, _1058, _1150);
    float _1160 = fma(_1060, 0.88622701168060302734375, _1146);
    float _1162 = fma(_1096, _1126, _1104);
    float _1164 = fma(_1098, _1126, _1106);
    float _1166 = precise::max(0.0, _1156);
    float _1168 = fma(_1102, _1126, _1110);
    float _1170 = precise::max(0.0, _1158);
    float _1172 = fma(_1130, _1062, _1152);
    float _1174 = fma(_1128, _1064, _1154);
    float _1176 = _1166 * 0.31830990314483642578125;
    float _1178 = precise::clamp(_1176, 0.0, 1.0);
    float _1180 = fma(_1128, _1066, _1160);
    float _1182 = _1170 * 0.31830990314483642578125;
    float _1184 = precise::clamp(_1182, 0.0, 1.0);
    float _1186 = fma(_1112, _1128, _1162);
    float _1188 = _1178 * 0.88622701168060302734375;
    float _1190 = fma(_1114, _1128, _1164);
    float _1192 = fma(_1116, _1128, _1168);
    float _1194 = _797 ? as_type<float>(_1068) : 0.0;
    float _1196 = fma(_1130, _1070, _1174);
    float _1198 = precise::max(0.0, _1172);
    float _1200 = fma(_1130, _1072, _1180);
    float _1202 = -_1184;
    float _1204 = _1202 + 1.0;
    float _1206 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1208 = fma(_1118, _1130, _1186);
    float _1210 = fma(_1194, _1130, _1190);
    float _1212 = fma(_1120, _1130, _1192);
    float _1214 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1184);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1206);
    float _1218 = precise::max(0.0, _1196);
    float _1220 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1222 = precise::max(0.0, _1200);
    float _1224 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1226 = precise::max(0.0, _1208);
    float _1228 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1230 = precise::max(0.0, _1210);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1220);
    float _1234 = precise::max(0.0, _1212);
    float _1236 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1224);
    float _1238 = fma(_1226, _1228, _1216);
    float _1240 = fma(_1230, _1228, _1232);
    float _1242 = fma(_1234, _1228, _1236);
    out.m_51.x = _1238;
    out.m_51.y = _1240;
    out.m_51.z = _1242;
    out.m_51.w = _823;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

