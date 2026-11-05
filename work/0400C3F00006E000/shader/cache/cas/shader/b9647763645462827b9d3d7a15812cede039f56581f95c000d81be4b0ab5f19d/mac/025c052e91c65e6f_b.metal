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
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _62 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _64 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _62;
    int _66 = _60 << 4;
    bool _70 = _66 == 0;
    bool _72 = _66 == 16;
    bool _74 = _66 == 32;
    bool _76 = _66 == 48;
    bool _78 = _66 == 64;
    float _80 = fma(_57, _53, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _82 = _66 == 80;
    bool _84 = _51 >= 0.5;
    bool _86 = isnan(_51);
    bool _88 = _84 || _86;
    bool _90 = isnan(0.5);
    bool _92 = _88 || _90;
    float _94 = as_type<float>(gl_BaseInstance);
    float _96 = _64;
    if (_70)
    {
        _94 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _98 = _94;
    float _100 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _102 = _80 + _100;
    float _104 = fma(_53, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _106 = _66 == 96;
    float _108 = _102 * _102;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _112 = _104 + _110;
    float _114 = 0.0;
    float _116 = _98;
    float _118 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (_70)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _120 = _114;
    float _122 = fma(_64, _64, _108);
    float _124 = _120;
    if (_72)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _116;
    bool _128 = _66 == 112;
    float _130 = fma(_112, _112, _122);
    float _132 = _126;
    if (_72)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _124;
    float _136 = _134;
    if (_74)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    float _140 = rsqrt(_130);
    bool _142 = _66 == 128;
    float _144 = _138;
    if (_74)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_76)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _144;
    bool _152 = _66 == 144;
    float _154 = _150;
    if (_76)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_78)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _66 == 160;
    float _164 = _160;
    if (_78)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _140 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _170 = _166;
    if (_82)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _164;
    bool _174 = _66 == 176;
    float _176 = _172;
    if (_82)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _170;
    float _180 = log2(_168);
    bool _182 = _66 == 192;
    float _184 = _178;
    if (_106)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _176;
    float _188 = _186;
    if (_106)
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
    bool _196 = _66 == 208;
    float _198 = _194;
    if (_128)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_142)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _66 == 224;
    float _208 = _180 + 1.2999999523162841796875;
    float _210 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _202;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _210;
    bool _218 = _66 == 240;
    float _220 = trunc(_208);
    int _222 = int(_220);
    float _224 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _226 = _214;
    float _228 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _230 = _224;
    bool _232 = _66 == 256;
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
    bool _242 = _66 == 272;
    float _244 = _240;
    if (_174)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_182)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    int _252 = min(_222, 15);
    bool _254 = _66 == 288;
    float _256 = _250;
    if (_182)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _248;
    float _260 = float(_252);
    bool _262 = _66 == 304;
    int _264 = _252 << 4;
    int _266 = _264 + 4288;
    float _268 = _258;
    float _270 = as_type<float>(_266);
    if (_196)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _272 = _256;
    float _274 = _272;
    if (_196)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _276 = _268;
    float _278 = -_260;
    float _280 = _278 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _282 = _276;
    if (_206)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _284 = _274;
    int _286 = _266 + 8;
    uint _289 = uint(int(uint(_286) >> uint(2)));
    uint _291 = uint(int(uint(int(_289)) >> uint(2)));
    int _293 = int(_289) & 3;
    float _295 = (*spvDescriptorSet0.vp_c14)._m0[int(_291)][_293];
    int _297 = int(_289) + 1;
    uint _299 = uint(int(uint(_297) >> uint(2)));
    int _301 = _297 & 3;
    float _303 = (*spvDescriptorSet0.vp_c14)._m0[int(_299)][_301];
    bool _305 = _66 == 320;
    float _307 = _280 + 1.0;
    float _309 = _284;
    if (_206)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _311 = _282;
    float _313 = _311;
    if (_218)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _315 = _309;
    bool _317 = _66 == 336;
    float _319 = exp2(_307);
    float _321 = _315;
    if (_218)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _323 = _313;
    float _325 = _323;
    if (_232)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _327 = _321;
    bool _329 = _66 == 352;
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
    bool _339 = _66 == 368;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_254)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _347 = _341;
    float _349 = 1.0 / _319;
    bool _351 = _66 == 384;
    float _353 = _347;
    if (_254)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _355 = _345;
    float _357 = _355;
    if (_262)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _359 = _353;
    bool _361 = _66 == 400;
    float _363 = _359;
    if (_262)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _365 = _357;
    bool _367 = _66 == 416;
    float _369 = _365;
    if (_305)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _371 = _363;
    float _373 = _371;
    if (_305)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _375 = _369;
    float _377 = _375;
    if (_317)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _379 = _373;
    bool _381 = _66 == 432;
    float _383 = _379;
    if (_317)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _385 = _377;
    float _387 = _385;
    if (_329)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _389 = _383;
    bool _391 = _66 == 448;
    float _393 = _389;
    if (_329)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _395 = _387;
    float _397 = _395;
    if (_339)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _399 = _393;
    bool _401 = _66 == 464;
    float _403 = _399;
    if (_339)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _405 = _397;
    float _407 = _405;
    if (_351)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _409 = _403;
    bool _411 = _66 == 480;
    float _413 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _415 = _407;
    float _417 = _415;
    if (_361)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _419 = _413;
    bool _421 = _66 == 496;
    float _423 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _425 = _417;
    float _427 = _425;
    if (_367)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _429 = _423;
    bool _431 = _66 == 512;
    float _433 = _429;
    if (_367)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _435 = _427;
    bool _437 = _66 == 528;
    float _439 = _435;
    if (_381)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _441 = _433;
    float _443 = _441;
    if (_381)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _445 = _439;
    float _447 = _445;
    if (_391)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _449 = _443;
    bool _451 = _66 == 544;
    float _453 = _449;
    if (_391)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _455 = _447;
    float _457 = _455;
    if (_401)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _459 = _453;
    bool _461 = _66 == 560;
    float _463 = _459;
    if (_401)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _465 = _457;
    float _467 = _465;
    if (_411)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _469 = _463;
    bool _471 = _66 == 576;
    float _473 = _469;
    if (_411)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _475 = _467;
    float _477 = _475;
    if (_421)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _479 = _473;
    bool _481 = _66 == 592;
    float _483 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _485 = _477;
    float _487 = _485;
    if (_431)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _489 = _483;
    bool _491 = _66 == 608;
    float _493 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _495 = _487;
    float _497 = _495;
    if (_437)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _499 = _493;
    bool _501 = _66 == 624;
    float _503 = _499;
    if (_437)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _505 = _497;
    bool _507 = _66 == 640;
    float _509 = _505;
    if (_451)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _511 = _503;
    float _513 = _511;
    if (_451)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _515 = _509;
    float _517 = _515;
    if (_461)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _519 = _513;
    bool _521 = _66 == 656;
    float _523 = _519;
    if (_461)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _525 = _517;
    float _527 = _525;
    if (_471)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _529 = _523;
    bool _531 = _66 == 672;
    float _533 = _529;
    if (_471)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _535 = _527;
    float _537 = _535;
    if (_481)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _539 = _533;
    bool _541 = _66 == 688;
    float _543 = _539;
    if (_481)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _545 = _537;
    float _547 = _545;
    if (_491)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _549 = _543;
    bool _551 = _66 == 704;
    float _553 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _555 = _547;
    float _557 = _555;
    if (_501)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _559 = _553;
    bool _561 = _66 == 720;
    float _563 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _565 = _557;
    float _567 = _565;
    if (_507)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _569 = _563;
    bool _571 = _66 == 736;
    float _573 = _569;
    if (_507)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _575 = _567;
    bool _577 = _66 == 752;
    float _579 = _575;
    if (_521)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _581 = _573;
    float _583 = _581;
    if (_531)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_541)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_551)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _593 = _591;
    float _595 = _593;
    if (_561)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_571)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_577)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _605 = _603;
    float _607 = _349 * _605;
    if (_521)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _609 = _579;
    float _611 = _609;
    if (_531)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _613 = _611;
    float _615 = _607 * _53;
    float _617 = _613;
    if (_541)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_551)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _623 = _621;
    float _625 = floor(_615);
    float _627 = _623;
    if (_561)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_571)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_577)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _637 = _635;
    float _639 = -_625;
    float _641 = _615 + _639;
    float _643 = _319 * _637;
    float _645 = _641 * 2.0;
    float _647 = -_641;
    float _649 = fma(_643, _647, _53);
    float _651 = floor(_645);
    float _653 = _643 * _651;
    float _655 = _653 * 0.5;
    float _657 = _655 + _649;
    float _659 = fma(_57, _657, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _661 = fma(_657, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _663 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _665 = _659 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _669 = _661 + _667;
    float _671 = _665 * _665;
    float _673 = fma(_64, _64, _671);
    float _675 = _655;
    float _677 = _657;
    if (!_92)
    {
        _96 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _679 = _96;
    float _681 = fma(_669, _669, _673);
    float _683 = sqrt(_681);
    float _685 = -_303;
    float _687 = fma(_683, _295, _685);
    float _689 = precise::clamp(_687, 0.0, 1.0);
    float _691 = -_655;
    float _693 = fma(_691, _689, _657);
    float _695 = _693;
    float _697 = _679;
    float _699 = _683;
    if (!_92)
    {
        _675 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _701 = _675;
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701;
    if (!_92)
    {
        float _707 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _679, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _695 = _707;
    }
    float _709 = _695;
    float _711 = _709;
    if (!_92)
    {
        float _713 = fma(_703, _679, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _697 = _713;
    }
    float _715 = _697;
    float _717 = _715;
    if (!_92)
    {
        float _719 = fma(_709, _701, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _719;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_92)
    {
        float _725 = fma(_715, _701, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _717 = _725;
    }
    float _727 = _717;
    float _729 = _727;
    if (!_92)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _721);
        _699 = _731;
    }
    float _733 = _699;
    if (!_92)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _729 = _735;
    }
    float _737 = _729;
    if (!_92)
    {
        float2 _2171 = float2(_733, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2171, float2(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2171, float2(0.0), isnan(_2171)), level(0.0)).x;
        _723 = _739;
    }
    float _741 = _723;
    if (_92)
    {
        _677 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _677;
    float _745 = _743;
    if (_92)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _705;
    float _749 = _747;
    if (_92)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _270 = _751;
    }
    float _753 = _270;
    float _755 = _753;
    if (_92)
    {
        float _757 = fma(_703, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_92)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_92)
    {
        float _769 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_92)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_92)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _741;
    float _785 = _781;
    if (_92)
    {
        float2 _2266 = float2(_777, _781);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2266, float2(0.0), isnan(_2266)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2266, float2(0.0), isnan(_2266)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = _703 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _795;
    float _799 = _793 * _793;
    float _801 = fma(_797, _797, _799);
    float _803 = sqrt(_801);
    bool _805 = _803 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = _803 + _807;
    float _811 = _733;
    float _813 = _803;
    float _815 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _817 = _809;
    if (_805)
    {
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _811 = _819;
    }
    float _821 = _811;
    if (_805)
    {
        float _823 = rsqrt(_801);
        _749 = _823;
    }
    float _825 = _749;
    float _827 = _825;
    if (_805)
    {
        float _829 = _809 * _821;
        _813 = _829;
    }
    float _831 = _813;
    if (_805)
    {
        float _833 = _831 * 0.15915493667125701904296875;
        _118 = _833;
    }
    float _835 = _118;
    float _837 = _831;
    if (_805)
    {
        float _839 = _835 * 6.283185482025146484375;
        float _841 = cos(_839);
        _837 = _841;
    }
    float _843 = _837;
    float _845 = _821;
    if (_805)
    {
        float _847 = _835 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _855 = _789;
    float _857 = _843;
    if (_805)
    {
        float _859 = _843 + (-1.0);
        _815 = _859;
    }
    float _861 = _815;
    if (_805)
    {
        float _863 = _853 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _855 = _863;
    }
    float _865 = _855;
    float _867 = _865;
    if (_805)
    {
        float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _785 = _869;
    }
    float _871 = _785;
    float _873 = _851;
    if (_805)
    {
        float _875 = fma(_851, _865, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _817 = _875;
    }
    float _877 = _817;
    if (!_805)
    {
        _867 = _853;
    }
    float _879 = _867;
    float _881 = _879;
    if (_805)
    {
        float _883 = fma(_853, _843, _871);
        _881 = _883;
    }
    float _885 = _881;
    if (!_805)
    {
        _873 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _887 = _873;
    float _889 = _887;
    if (_805)
    {
        float _891 = _825 * _877;
        _827 = _891;
    }
    float _893 = _827;
    if (!_805)
    {
        _857 = _703;
    }
    float _895 = _857;
    float _897 = _885 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _899 = _895;
    if (_805)
    {
        float _901 = fma(_797, _893, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _889 = _901;
    }
    float _903 = _889;
    if (_805)
    {
        float _905 = fma(_793, _893, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _899 = _905;
    }
    float _907 = _899;
    float _909 = _885 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _911 = _885 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[1].x, _897);
    float _915 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[0].x, _909);
    float _917 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[2].x, _911);
    float _919 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[1].z, _913);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[0].z, _915);
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[2].z, _917);
    float _925 = _919 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _927 = _921 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _923 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _931 = _925 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _933 = _925 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _935 = _925 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _937 = _925 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _931);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _933);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _937);
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[8].z, _939);
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[9].z, _943);
    float _953 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[10].z, _945);
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
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _62 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _64 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _62;
    int _66 = _60 << 4;
    bool _70 = _66 == 0;
    bool _72 = _66 == 16;
    bool _74 = _66 == 32;
    bool _76 = _66 == 48;
    bool _78 = _66 == 64;
    float _80 = fma(_57, _53, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _82 = _66 == 80;
    bool _84 = _51 >= 0.5;
    bool _86 = isnan(_51);
    bool _88 = _84 || _86;
    bool _90 = isnan(0.5);
    bool _92 = _88 || _90;
    float _94 = as_type<float>(gl_BaseInstance);
    float _96 = _64;
    if (_70)
    {
        _94 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _98 = _94;
    float _100 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _102 = _80 + _100;
    float _104 = fma(_53, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _106 = _66 == 96;
    float _108 = _102 * _102;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _112 = _104 + _110;
    float _114 = 0.0;
    float _116 = _98;
    float _118 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (_70)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _120 = _114;
    float _122 = fma(_64, _64, _108);
    float _124 = _120;
    if (_72)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _116;
    bool _128 = _66 == 112;
    float _130 = fma(_112, _112, _122);
    float _132 = _126;
    if (_72)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _124;
    float _136 = _134;
    if (_74)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    float _140 = rsqrt(_130);
    bool _142 = _66 == 128;
    float _144 = _138;
    if (_74)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_76)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _144;
    bool _152 = _66 == 144;
    float _154 = _150;
    if (_76)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_78)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _66 == 160;
    float _164 = _160;
    if (_78)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _140 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _170 = _166;
    if (_82)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _164;
    bool _174 = _66 == 176;
    float _176 = _172;
    if (_82)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _170;
    float _180 = log2(_168);
    bool _182 = _66 == 192;
    float _184 = _178;
    if (_106)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _176;
    float _188 = _186;
    if (_106)
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
    bool _196 = _66 == 208;
    float _198 = _194;
    if (_128)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_142)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _66 == 224;
    float _208 = _180 + 1.2999999523162841796875;
    float _210 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _202;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _210;
    bool _218 = _66 == 240;
    float _220 = trunc(_208);
    int _222 = int(_220);
    float _224 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _226 = _214;
    float _228 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _230 = _224;
    bool _232 = _66 == 256;
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
    bool _242 = _66 == 272;
    float _244 = _240;
    if (_174)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_182)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    int _252 = min(_222, 15);
    bool _254 = _66 == 288;
    float _256 = _250;
    if (_182)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _248;
    float _260 = float(_252);
    bool _262 = _66 == 304;
    int _264 = _252 << 4;
    int _266 = _264 + 4288;
    float _268 = _258;
    float _270 = as_type<float>(_266);
    if (_196)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _272 = _256;
    float _274 = _272;
    if (_196)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _276 = _268;
    float _278 = -_260;
    float _280 = _278 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _282 = _276;
    if (_206)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _284 = _274;
    int _286 = _266 + 8;
    uint _289 = uint(int(uint(_286) >> uint(2)));
    uint _291 = uint(int(uint(int(_289)) >> uint(2)));
    int _293 = int(_289) & 3;
    float _295 = (*spvDescriptorSet0.vp_c14)._m0[int(_291)][_293];
    int _297 = int(_289) + 1;
    uint _299 = uint(int(uint(_297) >> uint(2)));
    int _301 = _297 & 3;
    float _303 = (*spvDescriptorSet0.vp_c14)._m0[int(_299)][_301];
    bool _305 = _66 == 320;
    float _307 = _280 + 1.0;
    float _309 = _284;
    if (_206)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _311 = _282;
    float _313 = _311;
    if (_218)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _315 = _309;
    bool _317 = _66 == 336;
    float _319 = exp2(_307);
    float _321 = _315;
    if (_218)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _323 = _313;
    float _325 = _323;
    if (_232)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _327 = _321;
    bool _329 = _66 == 352;
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
    bool _339 = _66 == 368;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_254)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _347 = _341;
    float _349 = 1.0 / _319;
    bool _351 = _66 == 384;
    float _353 = _347;
    if (_254)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _355 = _345;
    float _357 = _355;
    if (_262)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _359 = _353;
    bool _361 = _66 == 400;
    float _363 = _359;
    if (_262)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _365 = _357;
    bool _367 = _66 == 416;
    float _369 = _365;
    if (_305)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _371 = _363;
    float _373 = _371;
    if (_305)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _375 = _369;
    float _377 = _375;
    if (_317)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _379 = _373;
    bool _381 = _66 == 432;
    float _383 = _379;
    if (_317)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _385 = _377;
    float _387 = _385;
    if (_329)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _389 = _383;
    bool _391 = _66 == 448;
    float _393 = _389;
    if (_329)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _395 = _387;
    float _397 = _395;
    if (_339)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _399 = _393;
    bool _401 = _66 == 464;
    float _403 = _399;
    if (_339)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _405 = _397;
    float _407 = _405;
    if (_351)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _409 = _403;
    bool _411 = _66 == 480;
    float _413 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _415 = _407;
    float _417 = _415;
    if (_361)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _419 = _413;
    bool _421 = _66 == 496;
    float _423 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _425 = _417;
    float _427 = _425;
    if (_367)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _429 = _423;
    bool _431 = _66 == 512;
    float _433 = _429;
    if (_367)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _435 = _427;
    bool _437 = _66 == 528;
    float _439 = _435;
    if (_381)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _441 = _433;
    float _443 = _441;
    if (_381)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _445 = _439;
    float _447 = _445;
    if (_391)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _449 = _443;
    bool _451 = _66 == 544;
    float _453 = _449;
    if (_391)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _455 = _447;
    float _457 = _455;
    if (_401)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _459 = _453;
    bool _461 = _66 == 560;
    float _463 = _459;
    if (_401)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _465 = _457;
    float _467 = _465;
    if (_411)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _469 = _463;
    bool _471 = _66 == 576;
    float _473 = _469;
    if (_411)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _475 = _467;
    float _477 = _475;
    if (_421)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _479 = _473;
    bool _481 = _66 == 592;
    float _483 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _485 = _477;
    float _487 = _485;
    if (_431)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _489 = _483;
    bool _491 = _66 == 608;
    float _493 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _495 = _487;
    float _497 = _495;
    if (_437)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _499 = _493;
    bool _501 = _66 == 624;
    float _503 = _499;
    if (_437)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _505 = _497;
    bool _507 = _66 == 640;
    float _509 = _505;
    if (_451)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _511 = _503;
    float _513 = _511;
    if (_451)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _515 = _509;
    float _517 = _515;
    if (_461)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _519 = _513;
    bool _521 = _66 == 656;
    float _523 = _519;
    if (_461)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _525 = _517;
    float _527 = _525;
    if (_471)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _529 = _523;
    bool _531 = _66 == 672;
    float _533 = _529;
    if (_471)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _535 = _527;
    float _537 = _535;
    if (_481)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _539 = _533;
    bool _541 = _66 == 688;
    float _543 = _539;
    if (_481)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _545 = _537;
    float _547 = _545;
    if (_491)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _549 = _543;
    bool _551 = _66 == 704;
    float _553 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _555 = _547;
    float _557 = _555;
    if (_501)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _559 = _553;
    bool _561 = _66 == 720;
    float _563 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _565 = _557;
    float _567 = _565;
    if (_507)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _569 = _563;
    bool _571 = _66 == 736;
    float _573 = _569;
    if (_507)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _575 = _567;
    bool _577 = _66 == 752;
    float _579 = _575;
    if (_521)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _581 = _573;
    float _583 = _581;
    if (_531)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_541)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_551)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _593 = _591;
    float _595 = _593;
    if (_561)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_571)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_577)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _605 = _603;
    float _607 = _349 * _605;
    if (_521)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _609 = _579;
    float _611 = _609;
    if (_531)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _613 = _611;
    float _615 = _607 * _53;
    float _617 = _613;
    if (_541)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_551)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _623 = _621;
    float _625 = floor(_615);
    float _627 = _623;
    if (_561)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_571)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_577)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _637 = _635;
    float _639 = -_625;
    float _641 = _615 + _639;
    float _643 = _319 * _637;
    float _645 = _641 * 2.0;
    float _647 = -_641;
    float _649 = fma(_643, _647, _53);
    float _651 = floor(_645);
    float _653 = _643 * _651;
    float _655 = _653 * 0.5;
    float _657 = _655 + _649;
    float _659 = fma(_57, _657, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _661 = fma(_657, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _663 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _665 = _659 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _669 = _661 + _667;
    float _671 = _665 * _665;
    float _673 = fma(_64, _64, _671);
    float _675 = _655;
    float _677 = _657;
    if (!_92)
    {
        _96 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _679 = _96;
    float _681 = fma(_669, _669, _673);
    float _683 = sqrt(_681);
    float _685 = -_303;
    float _687 = fma(_683, _295, _685);
    float _689 = precise::clamp(_687, 0.0, 1.0);
    float _691 = -_655;
    float _693 = fma(_691, _689, _657);
    float _695 = _693;
    float _697 = _679;
    float _699 = _683;
    if (!_92)
    {
        _675 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _701 = _675;
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701;
    if (!_92)
    {
        float _707 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _679, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _695 = _707;
    }
    float _709 = _695;
    float _711 = _709;
    if (!_92)
    {
        float _713 = fma(_703, _679, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _697 = _713;
    }
    float _715 = _697;
    float _717 = _715;
    if (!_92)
    {
        float _719 = fma(_709, _701, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _719;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_92)
    {
        float _725 = fma(_715, _701, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _717 = _725;
    }
    float _727 = _717;
    float _729 = _727;
    if (!_92)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _721);
        _699 = _731;
    }
    float _733 = _699;
    if (!_92)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _729 = _735;
    }
    float _737 = _729;
    if (!_92)
    {
        float2 _2171 = float2(_733, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2171, float2(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2171, float2(0.0), isnan(_2171)), level(0.0)).x;
        _723 = _739;
    }
    float _741 = _723;
    if (_92)
    {
        _677 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _677;
    float _745 = _743;
    if (_92)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _705;
    float _749 = _747;
    if (_92)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _270 = _751;
    }
    float _753 = _270;
    float _755 = _753;
    if (_92)
    {
        float _757 = fma(_703, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_92)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_92)
    {
        float _769 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_92)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_92)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _741;
    float _785 = _781;
    if (_92)
    {
        float2 _2266 = float2(_777, _781);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2266, float2(0.0), isnan(_2266)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2266, float2(0.0), isnan(_2266)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = _703 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _795;
    float _799 = _793 * _793;
    float _801 = fma(_797, _797, _799);
    float _803 = sqrt(_801);
    bool _805 = _803 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = _803 + _807;
    float _811 = _733;
    float _813 = _803;
    float _815 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _817 = _809;
    if (_805)
    {
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _811 = _819;
    }
    float _821 = _811;
    if (_805)
    {
        float _823 = rsqrt(_801);
        _749 = _823;
    }
    float _825 = _749;
    float _827 = _825;
    if (_805)
    {
        float _829 = _809 * _821;
        _813 = _829;
    }
    float _831 = _813;
    if (_805)
    {
        float _833 = _831 * 0.15915493667125701904296875;
        _118 = _833;
    }
    float _835 = _118;
    float _837 = _831;
    if (_805)
    {
        float _839 = _835 * 6.283185482025146484375;
        float _841 = cos(_839);
        _837 = _841;
    }
    float _843 = _837;
    float _845 = _821;
    if (_805)
    {
        float _847 = _835 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _855 = _789;
    float _857 = _843;
    if (_805)
    {
        float _859 = _843 + (-1.0);
        _815 = _859;
    }
    float _861 = _815;
    if (_805)
    {
        float _863 = _853 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _855 = _863;
    }
    float _865 = _855;
    float _867 = _865;
    if (_805)
    {
        float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _785 = _869;
    }
    float _871 = _785;
    float _873 = _851;
    if (_805)
    {
        float _875 = fma(_851, _865, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _817 = _875;
    }
    float _877 = _817;
    if (!_805)
    {
        _867 = _853;
    }
    float _879 = _867;
    float _881 = _879;
    if (_805)
    {
        float _883 = fma(_853, _843, _871);
        _881 = _883;
    }
    float _885 = _881;
    if (!_805)
    {
        _873 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _887 = _873;
    float _889 = _887;
    if (_805)
    {
        float _891 = _825 * _877;
        _827 = _891;
    }
    float _893 = _827;
    if (!_805)
    {
        _857 = _703;
    }
    float _895 = _857;
    float _897 = _885 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _899 = _895;
    if (_805)
    {
        float _901 = fma(_797, _893, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _889 = _901;
    }
    float _903 = _889;
    if (_805)
    {
        float _905 = fma(_793, _893, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _899 = _905;
    }
    float _907 = _899;
    float _909 = _885 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _911 = _885 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[1].x, _897);
    float _915 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[0].x, _909);
    float _917 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[2].x, _911);
    float _919 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[1].z, _913);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[0].z, _915);
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[2].z, _917);
    float _925 = _919 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _927 = _921 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _923 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _931 = _925 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _933 = _925 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _935 = _925 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _937 = _925 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _931);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _933);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _937);
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[8].z, _939);
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[9].z, _943);
    float _953 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[10].z, _945);
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
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _62 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _64 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _62;
    int _66 = _60 << 4;
    bool _70 = _66 == 0;
    bool _72 = _66 == 16;
    bool _74 = _66 == 32;
    bool _76 = _66 == 48;
    bool _78 = _66 == 64;
    float _80 = fma(_57, _53, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _82 = _66 == 80;
    bool _84 = _51 >= 0.5;
    bool _86 = isnan(_51);
    bool _88 = _84 || _86;
    bool _90 = isnan(0.5);
    bool _92 = _88 || _90;
    float _94 = as_type<float>(gl_BaseInstance);
    float _96 = _64;
    if (_70)
    {
        _94 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _98 = _94;
    float _100 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _102 = _80 + _100;
    float _104 = fma(_53, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _106 = _66 == 96;
    float _108 = _102 * _102;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _112 = _104 + _110;
    float _114 = 0.0;
    float _116 = _98;
    float _118 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (_70)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _120 = _114;
    float _122 = fma(_64, _64, _108);
    float _124 = _120;
    if (_72)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _116;
    bool _128 = _66 == 112;
    float _130 = fma(_112, _112, _122);
    float _132 = _126;
    if (_72)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _124;
    float _136 = _134;
    if (_74)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    float _140 = rsqrt(_130);
    bool _142 = _66 == 128;
    float _144 = _138;
    if (_74)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_76)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _144;
    bool _152 = _66 == 144;
    float _154 = _150;
    if (_76)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_78)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _66 == 160;
    float _164 = _160;
    if (_78)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _140 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _170 = _166;
    if (_82)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _164;
    bool _174 = _66 == 176;
    float _176 = _172;
    if (_82)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _170;
    float _180 = log2(_168);
    bool _182 = _66 == 192;
    float _184 = _178;
    if (_106)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _176;
    float _188 = _186;
    if (_106)
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
    bool _196 = _66 == 208;
    float _198 = _194;
    if (_128)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_142)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _66 == 224;
    float _208 = _180 + 1.2999999523162841796875;
    float _210 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _202;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _210;
    bool _218 = _66 == 240;
    float _220 = trunc(_208);
    int _222 = int(_220);
    float _224 = _216;
    if (_152)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _226 = _214;
    float _228 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _230 = _224;
    bool _232 = _66 == 256;
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
    bool _242 = _66 == 272;
    float _244 = _240;
    if (_174)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_182)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    int _252 = min(_222, 15);
    bool _254 = _66 == 288;
    float _256 = _250;
    if (_182)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _248;
    float _260 = float(_252);
    bool _262 = _66 == 304;
    int _264 = _252 << 4;
    int _266 = _264 + 4288;
    float _268 = _258;
    float _270 = as_type<float>(_266);
    if (_196)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _272 = _256;
    float _274 = _272;
    if (_196)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _276 = _268;
    float _278 = -_260;
    float _280 = _278 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _282 = _276;
    if (_206)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _284 = _274;
    int _286 = _266 + 8;
    uint _289 = uint(int(uint(_286) >> uint(2)));
    uint _291 = uint(int(uint(int(_289)) >> uint(2)));
    int _293 = int(_289) & 3;
    float _295 = (*spvDescriptorSet0.vp_c14)._m0[int(_291)][_293];
    int _297 = int(_289) + 1;
    uint _299 = uint(int(uint(_297) >> uint(2)));
    int _301 = _297 & 3;
    float _303 = (*spvDescriptorSet0.vp_c14)._m0[int(_299)][_301];
    bool _305 = _66 == 320;
    float _307 = _280 + 1.0;
    float _309 = _284;
    if (_206)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _311 = _282;
    float _313 = _311;
    if (_218)
    {
        _309 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _315 = _309;
    bool _317 = _66 == 336;
    float _319 = exp2(_307);
    float _321 = _315;
    if (_218)
    {
        _313 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _323 = _313;
    float _325 = _323;
    if (_232)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _327 = _321;
    bool _329 = _66 == 352;
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
    bool _339 = _66 == 368;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_254)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _347 = _341;
    float _349 = 1.0 / _319;
    bool _351 = _66 == 384;
    float _353 = _347;
    if (_254)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _355 = _345;
    float _357 = _355;
    if (_262)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _359 = _353;
    bool _361 = _66 == 400;
    float _363 = _359;
    if (_262)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _365 = _357;
    bool _367 = _66 == 416;
    float _369 = _365;
    if (_305)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _371 = _363;
    float _373 = _371;
    if (_305)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _375 = _369;
    float _377 = _375;
    if (_317)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _379 = _373;
    bool _381 = _66 == 432;
    float _383 = _379;
    if (_317)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _385 = _377;
    float _387 = _385;
    if (_329)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _389 = _383;
    bool _391 = _66 == 448;
    float _393 = _389;
    if (_329)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _395 = _387;
    float _397 = _395;
    if (_339)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _399 = _393;
    bool _401 = _66 == 464;
    float _403 = _399;
    if (_339)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _405 = _397;
    float _407 = _405;
    if (_351)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _409 = _403;
    bool _411 = _66 == 480;
    float _413 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _415 = _407;
    float _417 = _415;
    if (_361)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _419 = _413;
    bool _421 = _66 == 496;
    float _423 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _425 = _417;
    float _427 = _425;
    if (_367)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _429 = _423;
    bool _431 = _66 == 512;
    float _433 = _429;
    if (_367)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _435 = _427;
    bool _437 = _66 == 528;
    float _439 = _435;
    if (_381)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _441 = _433;
    float _443 = _441;
    if (_381)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _445 = _439;
    float _447 = _445;
    if (_391)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _449 = _443;
    bool _451 = _66 == 544;
    float _453 = _449;
    if (_391)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _455 = _447;
    float _457 = _455;
    if (_401)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _459 = _453;
    bool _461 = _66 == 560;
    float _463 = _459;
    if (_401)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _465 = _457;
    float _467 = _465;
    if (_411)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _469 = _463;
    bool _471 = _66 == 576;
    float _473 = _469;
    if (_411)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _475 = _467;
    float _477 = _475;
    if (_421)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _479 = _473;
    bool _481 = _66 == 592;
    float _483 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _485 = _477;
    float _487 = _485;
    if (_431)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _489 = _483;
    bool _491 = _66 == 608;
    float _493 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _495 = _487;
    float _497 = _495;
    if (_437)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _499 = _493;
    bool _501 = _66 == 624;
    float _503 = _499;
    if (_437)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _505 = _497;
    bool _507 = _66 == 640;
    float _509 = _505;
    if (_451)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _511 = _503;
    float _513 = _511;
    if (_451)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _515 = _509;
    float _517 = _515;
    if (_461)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _519 = _513;
    bool _521 = _66 == 656;
    float _523 = _519;
    if (_461)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _525 = _517;
    float _527 = _525;
    if (_471)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _529 = _523;
    bool _531 = _66 == 672;
    float _533 = _529;
    if (_471)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _535 = _527;
    float _537 = _535;
    if (_481)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _539 = _533;
    bool _541 = _66 == 688;
    float _543 = _539;
    if (_481)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _545 = _537;
    float _547 = _545;
    if (_491)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _549 = _543;
    bool _551 = _66 == 704;
    float _553 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _555 = _547;
    float _557 = _555;
    if (_501)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _559 = _553;
    bool _561 = _66 == 720;
    float _563 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _565 = _557;
    float _567 = _565;
    if (_507)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _569 = _563;
    bool _571 = _66 == 736;
    float _573 = _569;
    if (_507)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _575 = _567;
    bool _577 = _66 == 752;
    float _579 = _575;
    if (_521)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _581 = _573;
    float _583 = _581;
    if (_531)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_541)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _589 = _587;
    float _591 = _589;
    if (_551)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _593 = _591;
    float _595 = _593;
    if (_561)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_571)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_577)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _605 = _603;
    float _607 = _349 * _605;
    if (_521)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _609 = _579;
    float _611 = _609;
    if (_531)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _613 = _611;
    float _615 = _607 * _53;
    float _617 = _613;
    if (_541)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_551)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _623 = _621;
    float _625 = floor(_615);
    float _627 = _623;
    if (_561)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_571)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _633 = _631;
    float _635 = _633;
    if (_577)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _637 = _635;
    float _639 = -_625;
    float _641 = _615 + _639;
    float _643 = _319 * _637;
    float _645 = _641 * 2.0;
    float _647 = -_641;
    float _649 = fma(_643, _647, _53);
    float _651 = floor(_645);
    float _653 = _643 * _651;
    float _655 = _653 * 0.5;
    float _657 = _655 + _649;
    float _659 = fma(_57, _657, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _661 = fma(_657, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _663 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _665 = _659 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _669 = _661 + _667;
    float _671 = _665 * _665;
    float _673 = fma(_64, _64, _671);
    float _675 = _655;
    float _677 = _657;
    if (!_92)
    {
        _96 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _679 = _96;
    float _681 = fma(_669, _669, _673);
    float _683 = sqrt(_681);
    float _685 = -_303;
    float _687 = fma(_683, _295, _685);
    float _689 = precise::clamp(_687, 0.0, 1.0);
    float _691 = -_655;
    float _693 = fma(_691, _689, _657);
    float _695 = _693;
    float _697 = _679;
    float _699 = _683;
    if (!_92)
    {
        _675 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _701 = _675;
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701;
    if (!_92)
    {
        float _707 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _679, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _695 = _707;
    }
    float _709 = _695;
    float _711 = _709;
    if (!_92)
    {
        float _713 = fma(_703, _679, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _697 = _713;
    }
    float _715 = _697;
    float _717 = _715;
    if (!_92)
    {
        float _719 = fma(_709, _701, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _719;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_92)
    {
        float _725 = fma(_715, _701, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _717 = _725;
    }
    float _727 = _717;
    float _729 = _727;
    if (!_92)
    {
        float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _721);
        _699 = _731;
    }
    float _733 = _699;
    if (!_92)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
        _729 = _735;
    }
    float _737 = _729;
    if (!_92)
    {
        float2 _2171 = float2(_733, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2171, float2(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2171, float2(0.0), isnan(_2171)), level(0.0)).x;
        _723 = _739;
    }
    float _741 = _723;
    if (_92)
    {
        _677 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _677;
    float _745 = _743;
    if (_92)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _705;
    float _749 = _747;
    if (_92)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _270 = _751;
    }
    float _753 = _270;
    float _755 = _753;
    if (_92)
    {
        float _757 = fma(_703, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_92)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_92)
    {
        float _769 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_92)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_92)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _741;
    float _785 = _781;
    if (_92)
    {
        float2 _2266 = float2(_777, _781);
        float _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2266, float2(0.0), isnan(_2266)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2266, float2(0.0), isnan(_2266)), level(0.0)).x;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _793 = _703 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _795;
    float _799 = _793 * _793;
    float _801 = fma(_797, _797, _799);
    float _803 = sqrt(_801);
    bool _805 = _803 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = _803 + _807;
    float _811 = _733;
    float _813 = _803;
    float _815 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _817 = _809;
    if (_805)
    {
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _811 = _819;
    }
    float _821 = _811;
    if (_805)
    {
        float _823 = rsqrt(_801);
        _749 = _823;
    }
    float _825 = _749;
    float _827 = _825;
    if (_805)
    {
        float _829 = _809 * _821;
        _813 = _829;
    }
    float _831 = _813;
    if (_805)
    {
        float _833 = _831 * 0.15915493667125701904296875;
        _118 = _833;
    }
    float _835 = _118;
    float _837 = _831;
    if (_805)
    {
        float _839 = _835 * 6.283185482025146484375;
        float _841 = cos(_839);
        _837 = _841;
    }
    float _843 = _837;
    float _845 = _821;
    if (_805)
    {
        float _847 = _835 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = fma(_789, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _855 = _789;
    float _857 = _843;
    if (_805)
    {
        float _859 = _843 + (-1.0);
        _815 = _859;
    }
    float _861 = _815;
    if (_805)
    {
        float _863 = _853 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _855 = _863;
    }
    float _865 = _855;
    float _867 = _865;
    if (_805)
    {
        float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _785 = _869;
    }
    float _871 = _785;
    float _873 = _851;
    if (_805)
    {
        float _875 = fma(_851, _865, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _817 = _875;
    }
    float _877 = _817;
    if (!_805)
    {
        _867 = _853;
    }
    float _879 = _867;
    float _881 = _879;
    if (_805)
    {
        float _883 = fma(_853, _843, _871);
        _881 = _883;
    }
    float _885 = _881;
    if (!_805)
    {
        _873 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _887 = _873;
    float _889 = _887;
    if (_805)
    {
        float _891 = _825 * _877;
        _827 = _891;
    }
    float _893 = _827;
    if (!_805)
    {
        _857 = _703;
    }
    float _895 = _857;
    float _897 = _885 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _899 = _895;
    if (_805)
    {
        float _901 = fma(_797, _893, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _889 = _901;
    }
    float _903 = _889;
    if (_805)
    {
        float _905 = fma(_793, _893, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _899 = _905;
    }
    float _907 = _899;
    float _909 = _885 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _911 = _885 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[1].x, _897);
    float _915 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[0].x, _909);
    float _917 = fma(_903, (*spvDescriptorSet0.vp_c4)._m0[2].x, _911);
    float _919 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[1].z, _913);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[0].z, _915);
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c4)._m0[2].z, _917);
    float _925 = _919 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _927 = _921 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _923 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _931 = _925 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _933 = _925 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _935 = _925 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _937 = _925 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _931);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _933);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _937);
    float _947 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[8].z, _939);
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[9].z, _943);
    float _953 = fma(_929, (*spvDescriptorSet0.vp_c4)._m0[10].z, _945);
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

