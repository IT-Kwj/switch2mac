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
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _74 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _76 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _74;
    int _78 = _72 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_69, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _94 = _78 == 80;
    bool _96 = _63 >= 0.5;
    bool _98 = isnan(_63);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = as_type<float>(gl_BaseInstance);
    float _108 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_82)
    {
        _106 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _110 = _106;
    float _112 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _114 = _92 + _112;
    float _116 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _118 = _78 == 96;
    float _120 = _114 * _114;
    float _122 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _124 = _116 + _122;
    float _126 = 0.0;
    float _128 = _110;
    if (_82)
    {
        _126 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _130 = _126;
    float _132 = fma(_76, _76, _120);
    float _134 = _130;
    if (_84)
    {
        _128 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _136 = _128;
    bool _138 = _78 == 112;
    float _140 = fma(_124, _124, _132);
    float _142 = _136;
    if (_84)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _144 = _134;
    float _146 = _144;
    if (_86)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _142;
    float _150 = rsqrt(_140);
    bool _152 = _78 == 128;
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _154;
    bool _162 = _78 == 144;
    float _164 = _160;
    if (_88)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_90)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _170 = _164;
    bool _172 = _78 == 160;
    float _174 = _170;
    if (_90)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _176 = _168;
    float _178 = _150 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _180 = _176;
    if (_94)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _174;
    bool _184 = _78 == 176;
    float _186 = _182;
    if (_94)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _180;
    float _190 = log2(_178);
    bool _192 = _78 == 192;
    float _194 = _188;
    if (_118)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _186;
    float _198 = _196;
    if (_118)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _194;
    float _202 = _200;
    if (_138)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _204 = _198;
    bool _206 = _78 == 208;
    float _208 = _204;
    if (_138)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _214 = _208;
    bool _216 = _78 == 224;
    float _218 = _190 + 1.2999999523162841796875;
    float _220 = _214;
    if (_152)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _212;
    float _224 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _226 = _220;
    bool _228 = _78 == 240;
    float _230 = trunc(_218);
    int _232 = int(_230);
    float _234 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _224;
    float _238 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _240 = _234;
    bool _242 = _78 == 256;
    float _244 = _240;
    if (_172)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_184)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _250 = _244;
    bool _252 = _78 == 272;
    float _254 = _250;
    if (_184)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _256 = _248;
    float _258 = _256;
    if (_192)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _260 = _254;
    int _262 = min(_232, 15);
    bool _264 = _78 == 288;
    float _266 = _260;
    if (_192)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _268 = _258;
    float _270 = float(_262);
    bool _272 = _78 == 304;
    int _274 = _262 << 4;
    int _276 = _274 + 4288;
    float _278 = _268;
    float _280 = as_type<float>(_276);
    if (_206)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _282 = _266;
    float _284 = _282;
    if (_206)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _286 = _278;
    float _288 = -_270;
    float _290 = _288 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _292 = _286;
    if (_216)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _294 = _284;
    int _296 = _276 + 8;
    uint _299 = uint(int(uint(_296) >> uint(2)));
    uint _301 = uint(int(uint(int(_299)) >> uint(2)));
    int _303 = int(_299) & 3;
    float _305 = (*spvDescriptorSet0.vp_c14)._m0[int(_301)][_303];
    int _307 = int(_299) + 1;
    uint _309 = uint(int(uint(_307) >> uint(2)));
    int _311 = _307 & 3;
    float _313 = (*spvDescriptorSet0.vp_c14)._m0[int(_309)][_311];
    bool _315 = _78 == 320;
    float _317 = _290 + 1.0;
    float _319 = _294;
    if (_216)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _321 = _292;
    float _323 = _321;
    if (_228)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _325 = _319;
    bool _327 = _78 == 336;
    float _329 = exp2(_317);
    float _331 = _325;
    if (_228)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _333 = _323;
    float _335 = _333;
    if (_242)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _337 = _331;
    bool _339 = _78 == 352;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_252)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _347 = _341;
    bool _349 = _78 == 368;
    float _351 = _347;
    if (_252)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _353 = _345;
    float _355 = _353;
    if (_264)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _357 = _351;
    float _359 = 1.0 / _329;
    bool _361 = _78 == 384;
    float _363 = _357;
    if (_264)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _365 = _355;
    float _367 = _365;
    if (_272)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _369 = _363;
    bool _371 = _78 == 400;
    float _373 = _369;
    if (_272)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _375 = _367;
    bool _377 = _78 == 416;
    float _379 = _375;
    if (_315)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _381 = _373;
    float _383 = _381;
    if (_315)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _385 = _379;
    float _387 = _385;
    if (_327)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _389 = _383;
    bool _391 = _78 == 432;
    float _393 = _389;
    if (_327)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _395 = _387;
    float _397 = _395;
    if (_339)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _399 = _393;
    bool _401 = _78 == 448;
    float _403 = _399;
    if (_339)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _405 = _397;
    float _407 = _405;
    if (_349)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _409 = _403;
    bool _411 = _78 == 464;
    float _413 = _409;
    if (_349)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _415 = _407;
    float _417 = _415;
    if (_361)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _419 = _413;
    bool _421 = _78 == 480;
    float _423 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _425 = _417;
    float _427 = _425;
    if (_371)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _429 = _423;
    bool _431 = _78 == 496;
    float _433 = _429;
    if (_371)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _435 = _427;
    float _437 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _439 = _433;
    bool _441 = _78 == 512;
    float _443 = _439;
    if (_377)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _445 = _437;
    bool _447 = _78 == 528;
    float _449 = _445;
    if (_391)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _451 = _443;
    float _453 = _451;
    if (_391)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _455 = _449;
    float _457 = _455;
    if (_401)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _459 = _453;
    bool _461 = _78 == 544;
    float _463 = _459;
    if (_401)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _465 = _457;
    float _467 = _465;
    if (_411)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _469 = _463;
    bool _471 = _78 == 560;
    float _473 = _469;
    if (_411)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _475 = _467;
    float _477 = _475;
    if (_421)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _479 = _473;
    bool _481 = _78 == 576;
    float _483 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _485 = _477;
    float _487 = _485;
    if (_431)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _489 = _483;
    bool _491 = _78 == 592;
    float _493 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _495 = _487;
    float _497 = _495;
    if (_441)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _499 = _493;
    bool _501 = _78 == 608;
    float _503 = _499;
    if (_441)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _505 = _497;
    float _507 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _509 = _503;
    bool _511 = _78 == 624;
    float _513 = _509;
    if (_447)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _515 = _507;
    bool _517 = _78 == 640;
    float _519 = _515;
    if (_461)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _521 = _513;
    float _523 = _521;
    if (_461)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _525 = _519;
    float _527 = _525;
    if (_471)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _529 = _523;
    bool _531 = _78 == 656;
    float _533 = _529;
    if (_471)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _535 = _527;
    float _537 = _535;
    if (_481)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _539 = _533;
    bool _541 = _78 == 672;
    float _543 = _539;
    if (_481)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _545 = _537;
    float _547 = _545;
    if (_491)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _549 = _543;
    bool _551 = _78 == 688;
    float _553 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _555 = _547;
    float _557 = _555;
    if (_501)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _559 = _553;
    bool _561 = _78 == 704;
    float _563 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _565 = _557;
    float _567 = _565;
    if (_511)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _569 = _563;
    bool _571 = _78 == 720;
    float _573 = _569;
    if (_511)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _575 = _567;
    float _577 = _575;
    if (_517)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _579 = _573;
    bool _581 = _78 == 736;
    float _583 = _579;
    if (_517)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _585 = _577;
    bool _587 = _78 == 752;
    float _589 = _585;
    if (_531)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _591 = _583;
    float _593 = _591;
    if (_541)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_551)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_561)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_571)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_581)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_587)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _615 = _613;
    float _617 = _359 * _615;
    if (_531)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _619 = _589;
    float _621 = _619;
    if (_541)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _623 = _621;
    float _625 = _617 * _65;
    float _627 = _623;
    if (_551)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_561)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _633 = _631;
    float _635 = floor(_625);
    float _637 = _633;
    if (_571)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _639 = _637;
    float _641 = _639;
    if (_581)
    {
        _641 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _643 = _641;
    float _645 = _643;
    if (_587)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _647 = _645;
    float _649 = _329 * _647;
    float _651 = -_635;
    float _653 = _625 + _651;
    float _655 = _653 * 2.0;
    float _657 = -_653;
    float _659 = fma(_649, _657, _65);
    float _661 = floor(_655);
    float _663 = _649 * _661;
    float _665 = _663 * 0.5;
    float _667 = _665 + _659;
    float _669 = fma(_69, _667, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _671 = fma(_667, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _673 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _675 = _669 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _679 = _671 + _677;
    float _681 = _675 * _675;
    float _683 = fma(_76, _76, _681);
    float _685 = _681;
    float _687 = _667;
    if (!_104)
    {
        _685 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _689 = _685;
    float _691 = fma(_679, _679, _683);
    float _693 = sqrt(_691);
    float _695 = -_313;
    float _697 = fma(_693, _305, _695);
    float _699 = precise::clamp(_697, 0.0, 1.0);
    float _701 = -_665;
    float _703 = fma(_701, _699, _667);
    float _705 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _707 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _709 = _703;
    float _711 = _691;
    float _713 = _689;
    if (!_104)
    {
        float _715 = fma(_705, _689, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _709 = _715;
    }
    float _717 = _709;
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _721 = _717;
    if (!_104)
    {
        float _723 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _717);
        _721 = _723;
    }
    float _725 = _721;
    if (!_104)
    {
        float _727 = fma(_719, _689, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _711 = _727;
    }
    float _729 = _711;
    float _731 = _729;
    if (!_104)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _733;
    }
    float _735 = _731;
    if (!_104)
    {
        float2 _2426 = float2(_725, _735);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2426, float2(0.0), isnan(_2426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2426, float2(0.0), isnan(_2426)), level(0.0)).x;
        _108 = _737;
    }
    float _739 = _108;
    if (_104)
    {
        _280 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _741 = _280;
    float _743 = _741;
    if (_104)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _745 = _687;
    if (_104)
    {
        float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _741, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _713 = _747;
    }
    float _749 = _713;
    float _751 = _749;
    if (_104)
    {
        float _753 = fma(_707, _741, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _743 = _753;
    }
    float _755 = _743;
    float _757 = _755;
    if (_104)
    {
        float _759 = fma(_749, _745, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _751 = _759;
    }
    float _761 = _751;
    float _763 = _761;
    if (_104)
    {
        float _765 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_104)
    {
        float _771 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _761);
        _763 = _771;
    }
    float _773 = _763;
    if (_104)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739;
    if (_104)
    {
        float2 _2519 = float2(_773, _777);
        float _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2519, float2(0.0), isnan(_2519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2519, float2(0.0), isnan(_2519)), level(0.0)).x;
        _779 = _781;
    }
    float _783 = _779;
    float _785 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _787 = fma(_719, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _795 = _793 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _797 = _793 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _801 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _795);
    float _803 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _797);
    float _805 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _799);
    float _807 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[1].z, _801);
    float _809 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[0].z, _803);
    float _811 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].z, _805);
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
        float _921 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2783 = float3(_921, _919, float(0));
        float3 _2787 = select(_2783, float3(0.0), isnan(_2783));
        float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2787.xy, uint(rint(_2787.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2787.xy, uint(rint(_2787.z)), level(0.0)).xyzw;
        float _926 = _924.x;
        float _928 = _924.y;
        float _930 = _924.z;
        float _932 = _924.w;
        float3 _2802 = float3(_921, _919, float(1));
        float3 _2804 = select(_2802, float3(0.0), isnan(_2802));
        float4 _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _936 = _934.x;
        float _938 = _934.y;
        float _940 = _934.z;
        float _942 = _934.w;
        float3 _2819 = float3(_921, _919, float(2));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _946 = _944.x;
        float _948 = _944.y;
        float _950 = _944.z;
        float _952 = _944.w;
        float3 _2836 = float3(_921, _919, float(3));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _956 = _954.x;
        float _958 = _954.y;
        float _960 = _954.z;
        float _962 = _954.w;
        float3 _2853 = float3(_921, _919, float(4));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _964 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _966 = _964.x;
        float _968 = _964.y;
        float _970 = _964.z;
        float _972 = _964.w;
        float3 _2870 = float3(_921, _919, float(5));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _976 = _974.x;
        float _978 = _974.y;
        float _980 = _974.z;
        float _982 = _974.w;
        float3 _2887 = float3(_921, _919, float(6));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _986 = _984.x;
        float _988 = _984.y;
        float _990 = _984.z;
        float _992 = _984.w;
        float3 _2904 = float3(_921, _919, float(7));
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
    float _1074 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1078 = _707 + _1076;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _793;
    out.m_45.z = _707;
    float _1100 = _791 ? _1086 : 0.0;
    float _1102 = _791 ? _1080 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _791 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _785;
    out.m_47.w = _787;
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
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _74 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _76 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _74;
    int _78 = _72 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_69, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _94 = _78 == 80;
    bool _96 = _63 >= 0.5;
    bool _98 = isnan(_63);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = as_type<float>(gl_BaseInstance);
    float _108 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_82)
    {
        _106 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _110 = _106;
    float _112 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _114 = _92 + _112;
    float _116 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _118 = _78 == 96;
    float _120 = _114 * _114;
    float _122 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _124 = _116 + _122;
    float _126 = 0.0;
    float _128 = _110;
    if (_82)
    {
        _126 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _130 = _126;
    float _132 = fma(_76, _76, _120);
    float _134 = _130;
    if (_84)
    {
        _128 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _136 = _128;
    bool _138 = _78 == 112;
    float _140 = fma(_124, _124, _132);
    float _142 = _136;
    if (_84)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _144 = _134;
    float _146 = _144;
    if (_86)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _142;
    float _150 = rsqrt(_140);
    bool _152 = _78 == 128;
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _154;
    bool _162 = _78 == 144;
    float _164 = _160;
    if (_88)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_90)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _170 = _164;
    bool _172 = _78 == 160;
    float _174 = _170;
    if (_90)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _176 = _168;
    float _178 = _150 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _180 = _176;
    if (_94)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _174;
    bool _184 = _78 == 176;
    float _186 = _182;
    if (_94)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _180;
    float _190 = log2(_178);
    bool _192 = _78 == 192;
    float _194 = _188;
    if (_118)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _186;
    float _198 = _196;
    if (_118)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _194;
    float _202 = _200;
    if (_138)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _204 = _198;
    bool _206 = _78 == 208;
    float _208 = _204;
    if (_138)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _214 = _208;
    bool _216 = _78 == 224;
    float _218 = _190 + 1.2999999523162841796875;
    float _220 = _214;
    if (_152)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _212;
    float _224 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _226 = _220;
    bool _228 = _78 == 240;
    float _230 = trunc(_218);
    int _232 = int(_230);
    float _234 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _224;
    float _238 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _240 = _234;
    bool _242 = _78 == 256;
    float _244 = _240;
    if (_172)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_184)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _250 = _244;
    bool _252 = _78 == 272;
    float _254 = _250;
    if (_184)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _256 = _248;
    float _258 = _256;
    if (_192)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _260 = _254;
    int _262 = min(_232, 15);
    bool _264 = _78 == 288;
    float _266 = _260;
    if (_192)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _268 = _258;
    float _270 = float(_262);
    bool _272 = _78 == 304;
    int _274 = _262 << 4;
    int _276 = _274 + 4288;
    float _278 = _268;
    float _280 = as_type<float>(_276);
    if (_206)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _282 = _266;
    float _284 = _282;
    if (_206)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _286 = _278;
    float _288 = -_270;
    float _290 = _288 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _292 = _286;
    if (_216)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _294 = _284;
    int _296 = _276 + 8;
    uint _299 = uint(int(uint(_296) >> uint(2)));
    uint _301 = uint(int(uint(int(_299)) >> uint(2)));
    int _303 = int(_299) & 3;
    float _305 = (*spvDescriptorSet0.vp_c14)._m0[int(_301)][_303];
    int _307 = int(_299) + 1;
    uint _309 = uint(int(uint(_307) >> uint(2)));
    int _311 = _307 & 3;
    float _313 = (*spvDescriptorSet0.vp_c14)._m0[int(_309)][_311];
    bool _315 = _78 == 320;
    float _317 = _290 + 1.0;
    float _319 = _294;
    if (_216)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _321 = _292;
    float _323 = _321;
    if (_228)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _325 = _319;
    bool _327 = _78 == 336;
    float _329 = exp2(_317);
    float _331 = _325;
    if (_228)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _333 = _323;
    float _335 = _333;
    if (_242)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _337 = _331;
    bool _339 = _78 == 352;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_252)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _347 = _341;
    bool _349 = _78 == 368;
    float _351 = _347;
    if (_252)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _353 = _345;
    float _355 = _353;
    if (_264)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _357 = _351;
    float _359 = 1.0 / _329;
    bool _361 = _78 == 384;
    float _363 = _357;
    if (_264)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _365 = _355;
    float _367 = _365;
    if (_272)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _369 = _363;
    bool _371 = _78 == 400;
    float _373 = _369;
    if (_272)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _375 = _367;
    bool _377 = _78 == 416;
    float _379 = _375;
    if (_315)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _381 = _373;
    float _383 = _381;
    if (_315)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _385 = _379;
    float _387 = _385;
    if (_327)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _389 = _383;
    bool _391 = _78 == 432;
    float _393 = _389;
    if (_327)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _395 = _387;
    float _397 = _395;
    if (_339)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _399 = _393;
    bool _401 = _78 == 448;
    float _403 = _399;
    if (_339)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _405 = _397;
    float _407 = _405;
    if (_349)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _409 = _403;
    bool _411 = _78 == 464;
    float _413 = _409;
    if (_349)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _415 = _407;
    float _417 = _415;
    if (_361)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _419 = _413;
    bool _421 = _78 == 480;
    float _423 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _425 = _417;
    float _427 = _425;
    if (_371)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _429 = _423;
    bool _431 = _78 == 496;
    float _433 = _429;
    if (_371)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _435 = _427;
    float _437 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _439 = _433;
    bool _441 = _78 == 512;
    float _443 = _439;
    if (_377)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _445 = _437;
    bool _447 = _78 == 528;
    float _449 = _445;
    if (_391)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _451 = _443;
    float _453 = _451;
    if (_391)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _455 = _449;
    float _457 = _455;
    if (_401)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _459 = _453;
    bool _461 = _78 == 544;
    float _463 = _459;
    if (_401)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _465 = _457;
    float _467 = _465;
    if (_411)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _469 = _463;
    bool _471 = _78 == 560;
    float _473 = _469;
    if (_411)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _475 = _467;
    float _477 = _475;
    if (_421)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _479 = _473;
    bool _481 = _78 == 576;
    float _483 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _485 = _477;
    float _487 = _485;
    if (_431)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _489 = _483;
    bool _491 = _78 == 592;
    float _493 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _495 = _487;
    float _497 = _495;
    if (_441)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _499 = _493;
    bool _501 = _78 == 608;
    float _503 = _499;
    if (_441)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _505 = _497;
    float _507 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _509 = _503;
    bool _511 = _78 == 624;
    float _513 = _509;
    if (_447)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _515 = _507;
    bool _517 = _78 == 640;
    float _519 = _515;
    if (_461)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _521 = _513;
    float _523 = _521;
    if (_461)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _525 = _519;
    float _527 = _525;
    if (_471)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _529 = _523;
    bool _531 = _78 == 656;
    float _533 = _529;
    if (_471)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _535 = _527;
    float _537 = _535;
    if (_481)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _539 = _533;
    bool _541 = _78 == 672;
    float _543 = _539;
    if (_481)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _545 = _537;
    float _547 = _545;
    if (_491)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _549 = _543;
    bool _551 = _78 == 688;
    float _553 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _555 = _547;
    float _557 = _555;
    if (_501)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _559 = _553;
    bool _561 = _78 == 704;
    float _563 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _565 = _557;
    float _567 = _565;
    if (_511)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _569 = _563;
    bool _571 = _78 == 720;
    float _573 = _569;
    if (_511)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _575 = _567;
    float _577 = _575;
    if (_517)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _579 = _573;
    bool _581 = _78 == 736;
    float _583 = _579;
    if (_517)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _585 = _577;
    bool _587 = _78 == 752;
    float _589 = _585;
    if (_531)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _591 = _583;
    float _593 = _591;
    if (_541)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_551)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_561)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_571)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_581)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_587)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _615 = _613;
    float _617 = _359 * _615;
    if (_531)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _619 = _589;
    float _621 = _619;
    if (_541)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _623 = _621;
    float _625 = _617 * _65;
    float _627 = _623;
    if (_551)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_561)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _633 = _631;
    float _635 = floor(_625);
    float _637 = _633;
    if (_571)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _639 = _637;
    float _641 = _639;
    if (_581)
    {
        _641 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _643 = _641;
    float _645 = _643;
    if (_587)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _647 = _645;
    float _649 = _329 * _647;
    float _651 = -_635;
    float _653 = _625 + _651;
    float _655 = _653 * 2.0;
    float _657 = -_653;
    float _659 = fma(_649, _657, _65);
    float _661 = floor(_655);
    float _663 = _649 * _661;
    float _665 = _663 * 0.5;
    float _667 = _665 + _659;
    float _669 = fma(_69, _667, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _671 = fma(_667, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _673 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _675 = _669 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _679 = _671 + _677;
    float _681 = _675 * _675;
    float _683 = fma(_76, _76, _681);
    float _685 = _681;
    float _687 = _667;
    if (!_104)
    {
        _685 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _689 = _685;
    float _691 = fma(_679, _679, _683);
    float _693 = sqrt(_691);
    float _695 = -_313;
    float _697 = fma(_693, _305, _695);
    float _699 = precise::clamp(_697, 0.0, 1.0);
    float _701 = -_665;
    float _703 = fma(_701, _699, _667);
    float _705 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _707 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _709 = _703;
    float _711 = _691;
    float _713 = _689;
    if (!_104)
    {
        float _715 = fma(_705, _689, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _709 = _715;
    }
    float _717 = _709;
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _721 = _717;
    if (!_104)
    {
        float _723 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _717);
        _721 = _723;
    }
    float _725 = _721;
    if (!_104)
    {
        float _727 = fma(_719, _689, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _711 = _727;
    }
    float _729 = _711;
    float _731 = _729;
    if (!_104)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _733;
    }
    float _735 = _731;
    if (!_104)
    {
        float2 _2426 = float2(_725, _735);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2426, float2(0.0), isnan(_2426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2426, float2(0.0), isnan(_2426)), level(0.0)).x;
        _108 = _737;
    }
    float _739 = _108;
    if (_104)
    {
        _280 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _741 = _280;
    float _743 = _741;
    if (_104)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _745 = _687;
    if (_104)
    {
        float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _741, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _713 = _747;
    }
    float _749 = _713;
    float _751 = _749;
    if (_104)
    {
        float _753 = fma(_707, _741, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _743 = _753;
    }
    float _755 = _743;
    float _757 = _755;
    if (_104)
    {
        float _759 = fma(_749, _745, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _751 = _759;
    }
    float _761 = _751;
    float _763 = _761;
    if (_104)
    {
        float _765 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_104)
    {
        float _771 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _761);
        _763 = _771;
    }
    float _773 = _763;
    if (_104)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739;
    if (_104)
    {
        float2 _2519 = float2(_773, _777);
        float _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2519, float2(0.0), isnan(_2519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2519, float2(0.0), isnan(_2519)), level(0.0)).x;
        _779 = _781;
    }
    float _783 = _779;
    float _785 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _787 = fma(_719, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _795 = _793 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _797 = _793 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _801 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _795);
    float _803 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _797);
    float _805 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _799);
    float _807 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[1].z, _801);
    float _809 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[0].z, _803);
    float _811 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].z, _805);
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
        float _921 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2783 = float3(_921, _919, float(0));
        float3 _2787 = select(_2783, float3(0.0), isnan(_2783));
        float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2787.xy, uint(rint(_2787.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2787.xy, uint(rint(_2787.z)), level(0.0)).xyzw;
        float _926 = _924.x;
        float _928 = _924.y;
        float _930 = _924.z;
        float _932 = _924.w;
        float3 _2802 = float3(_921, _919, float(1));
        float3 _2804 = select(_2802, float3(0.0), isnan(_2802));
        float4 _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _936 = _934.x;
        float _938 = _934.y;
        float _940 = _934.z;
        float _942 = _934.w;
        float3 _2819 = float3(_921, _919, float(2));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _946 = _944.x;
        float _948 = _944.y;
        float _950 = _944.z;
        float _952 = _944.w;
        float3 _2836 = float3(_921, _919, float(3));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _956 = _954.x;
        float _958 = _954.y;
        float _960 = _954.z;
        float _962 = _954.w;
        float3 _2853 = float3(_921, _919, float(4));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _964 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _966 = _964.x;
        float _968 = _964.y;
        float _970 = _964.z;
        float _972 = _964.w;
        float3 _2870 = float3(_921, _919, float(5));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _976 = _974.x;
        float _978 = _974.y;
        float _980 = _974.z;
        float _982 = _974.w;
        float3 _2887 = float3(_921, _919, float(6));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _986 = _984.x;
        float _988 = _984.y;
        float _990 = _984.z;
        float _992 = _984.w;
        float3 _2904 = float3(_921, _919, float(7));
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
    float _1074 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1078 = _707 + _1076;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _793;
    out.m_45.z = _707;
    float _1100 = _791 ? _1086 : 0.0;
    float _1102 = _791 ? _1080 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _791 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _785;
    out.m_47.w = _787;
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
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _74 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _76 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _74;
    int _78 = _72 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_69, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _94 = _78 == 80;
    bool _96 = _63 >= 0.5;
    bool _98 = isnan(_63);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = as_type<float>(gl_BaseInstance);
    float _108 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_82)
    {
        _106 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _110 = _106;
    float _112 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _114 = _92 + _112;
    float _116 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _118 = _78 == 96;
    float _120 = _114 * _114;
    float _122 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _124 = _116 + _122;
    float _126 = 0.0;
    float _128 = _110;
    if (_82)
    {
        _126 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _130 = _126;
    float _132 = fma(_76, _76, _120);
    float _134 = _130;
    if (_84)
    {
        _128 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _136 = _128;
    bool _138 = _78 == 112;
    float _140 = fma(_124, _124, _132);
    float _142 = _136;
    if (_84)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _144 = _134;
    float _146 = _144;
    if (_86)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _142;
    float _150 = rsqrt(_140);
    bool _152 = _78 == 128;
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _154;
    bool _162 = _78 == 144;
    float _164 = _160;
    if (_88)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_90)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _170 = _164;
    bool _172 = _78 == 160;
    float _174 = _170;
    if (_90)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _176 = _168;
    float _178 = _150 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _180 = _176;
    if (_94)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _174;
    bool _184 = _78 == 176;
    float _186 = _182;
    if (_94)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _180;
    float _190 = log2(_178);
    bool _192 = _78 == 192;
    float _194 = _188;
    if (_118)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _186;
    float _198 = _196;
    if (_118)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _194;
    float _202 = _200;
    if (_138)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _204 = _198;
    bool _206 = _78 == 208;
    float _208 = _204;
    if (_138)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _214 = _208;
    bool _216 = _78 == 224;
    float _218 = _190 + 1.2999999523162841796875;
    float _220 = _214;
    if (_152)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _212;
    float _224 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _226 = _220;
    bool _228 = _78 == 240;
    float _230 = trunc(_218);
    int _232 = int(_230);
    float _234 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _224;
    float _238 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _240 = _234;
    bool _242 = _78 == 256;
    float _244 = _240;
    if (_172)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_184)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _250 = _244;
    bool _252 = _78 == 272;
    float _254 = _250;
    if (_184)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _256 = _248;
    float _258 = _256;
    if (_192)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _260 = _254;
    int _262 = min(_232, 15);
    bool _264 = _78 == 288;
    float _266 = _260;
    if (_192)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _268 = _258;
    float _270 = float(_262);
    bool _272 = _78 == 304;
    int _274 = _262 << 4;
    int _276 = _274 + 4288;
    float _278 = _268;
    float _280 = as_type<float>(_276);
    if (_206)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _282 = _266;
    float _284 = _282;
    if (_206)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _286 = _278;
    float _288 = -_270;
    float _290 = _288 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _292 = _286;
    if (_216)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _294 = _284;
    int _296 = _276 + 8;
    uint _299 = uint(int(uint(_296) >> uint(2)));
    uint _301 = uint(int(uint(int(_299)) >> uint(2)));
    int _303 = int(_299) & 3;
    float _305 = (*spvDescriptorSet0.vp_c14)._m0[int(_301)][_303];
    int _307 = int(_299) + 1;
    uint _309 = uint(int(uint(_307) >> uint(2)));
    int _311 = _307 & 3;
    float _313 = (*spvDescriptorSet0.vp_c14)._m0[int(_309)][_311];
    bool _315 = _78 == 320;
    float _317 = _290 + 1.0;
    float _319 = _294;
    if (_216)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _321 = _292;
    float _323 = _321;
    if (_228)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _325 = _319;
    bool _327 = _78 == 336;
    float _329 = exp2(_317);
    float _331 = _325;
    if (_228)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _333 = _323;
    float _335 = _333;
    if (_242)
    {
        _331 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _337 = _331;
    bool _339 = _78 == 352;
    float _341 = _337;
    if (_242)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _343 = _335;
    float _345 = _343;
    if (_252)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _347 = _341;
    bool _349 = _78 == 368;
    float _351 = _347;
    if (_252)
    {
        _345 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _353 = _345;
    float _355 = _353;
    if (_264)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _357 = _351;
    float _359 = 1.0 / _329;
    bool _361 = _78 == 384;
    float _363 = _357;
    if (_264)
    {
        _355 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _365 = _355;
    float _367 = _365;
    if (_272)
    {
        _363 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _369 = _363;
    bool _371 = _78 == 400;
    float _373 = _369;
    if (_272)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _375 = _367;
    bool _377 = _78 == 416;
    float _379 = _375;
    if (_315)
    {
        _373 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _381 = _373;
    float _383 = _381;
    if (_315)
    {
        _379 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _385 = _379;
    float _387 = _385;
    if (_327)
    {
        _383 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _389 = _383;
    bool _391 = _78 == 432;
    float _393 = _389;
    if (_327)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _395 = _387;
    float _397 = _395;
    if (_339)
    {
        _393 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _399 = _393;
    bool _401 = _78 == 448;
    float _403 = _399;
    if (_339)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _405 = _397;
    float _407 = _405;
    if (_349)
    {
        _403 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _409 = _403;
    bool _411 = _78 == 464;
    float _413 = _409;
    if (_349)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _415 = _407;
    float _417 = _415;
    if (_361)
    {
        _413 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _419 = _413;
    bool _421 = _78 == 480;
    float _423 = _419;
    if (_361)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _425 = _417;
    float _427 = _425;
    if (_371)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _429 = _423;
    bool _431 = _78 == 496;
    float _433 = _429;
    if (_371)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _435 = _427;
    float _437 = _435;
    if (_377)
    {
        _433 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _439 = _433;
    bool _441 = _78 == 512;
    float _443 = _439;
    if (_377)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _445 = _437;
    bool _447 = _78 == 528;
    float _449 = _445;
    if (_391)
    {
        _443 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _451 = _443;
    float _453 = _451;
    if (_391)
    {
        _449 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _455 = _449;
    float _457 = _455;
    if (_401)
    {
        _453 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _459 = _453;
    bool _461 = _78 == 544;
    float _463 = _459;
    if (_401)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _465 = _457;
    float _467 = _465;
    if (_411)
    {
        _463 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _469 = _463;
    bool _471 = _78 == 560;
    float _473 = _469;
    if (_411)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _475 = _467;
    float _477 = _475;
    if (_421)
    {
        _473 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _479 = _473;
    bool _481 = _78 == 576;
    float _483 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _485 = _477;
    float _487 = _485;
    if (_431)
    {
        _483 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _489 = _483;
    bool _491 = _78 == 592;
    float _493 = _489;
    if (_431)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _495 = _487;
    float _497 = _495;
    if (_441)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _499 = _493;
    bool _501 = _78 == 608;
    float _503 = _499;
    if (_441)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _505 = _497;
    float _507 = _505;
    if (_447)
    {
        _503 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _509 = _503;
    bool _511 = _78 == 624;
    float _513 = _509;
    if (_447)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _515 = _507;
    bool _517 = _78 == 640;
    float _519 = _515;
    if (_461)
    {
        _513 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _521 = _513;
    float _523 = _521;
    if (_461)
    {
        _519 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _525 = _519;
    float _527 = _525;
    if (_471)
    {
        _523 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _529 = _523;
    bool _531 = _78 == 656;
    float _533 = _529;
    if (_471)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _535 = _527;
    float _537 = _535;
    if (_481)
    {
        _533 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _539 = _533;
    bool _541 = _78 == 672;
    float _543 = _539;
    if (_481)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _545 = _537;
    float _547 = _545;
    if (_491)
    {
        _543 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _549 = _543;
    bool _551 = _78 == 688;
    float _553 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _555 = _547;
    float _557 = _555;
    if (_501)
    {
        _553 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _559 = _553;
    bool _561 = _78 == 704;
    float _563 = _559;
    if (_501)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _565 = _557;
    float _567 = _565;
    if (_511)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _569 = _563;
    bool _571 = _78 == 720;
    float _573 = _569;
    if (_511)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _575 = _567;
    float _577 = _575;
    if (_517)
    {
        _573 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _579 = _573;
    bool _581 = _78 == 736;
    float _583 = _579;
    if (_517)
    {
        _577 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _585 = _577;
    bool _587 = _78 == 752;
    float _589 = _585;
    if (_531)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _591 = _583;
    float _593 = _591;
    if (_541)
    {
        _593 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _595 = _593;
    float _597 = _595;
    if (_551)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _599 = _597;
    float _601 = _599;
    if (_561)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_571)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_581)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_587)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _615 = _613;
    float _617 = _359 * _615;
    if (_531)
    {
        _589 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _619 = _589;
    float _621 = _619;
    if (_541)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _623 = _621;
    float _625 = _617 * _65;
    float _627 = _623;
    if (_551)
    {
        _627 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _629 = _627;
    float _631 = _629;
    if (_561)
    {
        _631 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _633 = _631;
    float _635 = floor(_625);
    float _637 = _633;
    if (_571)
    {
        _637 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _639 = _637;
    float _641 = _639;
    if (_581)
    {
        _641 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _643 = _641;
    float _645 = _643;
    if (_587)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _647 = _645;
    float _649 = _329 * _647;
    float _651 = -_635;
    float _653 = _625 + _651;
    float _655 = _653 * 2.0;
    float _657 = -_653;
    float _659 = fma(_649, _657, _65);
    float _661 = floor(_655);
    float _663 = _649 * _661;
    float _665 = _663 * 0.5;
    float _667 = _665 + _659;
    float _669 = fma(_69, _667, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _671 = fma(_667, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _673 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _675 = _669 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _679 = _671 + _677;
    float _681 = _675 * _675;
    float _683 = fma(_76, _76, _681);
    float _685 = _681;
    float _687 = _667;
    if (!_104)
    {
        _685 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _689 = _685;
    float _691 = fma(_679, _679, _683);
    float _693 = sqrt(_691);
    float _695 = -_313;
    float _697 = fma(_693, _305, _695);
    float _699 = precise::clamp(_697, 0.0, 1.0);
    float _701 = -_665;
    float _703 = fma(_701, _699, _667);
    float _705 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _707 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _709 = _703;
    float _711 = _691;
    float _713 = _689;
    if (!_104)
    {
        float _715 = fma(_705, _689, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _709 = _715;
    }
    float _717 = _709;
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _721 = _717;
    if (!_104)
    {
        float _723 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _717);
        _721 = _723;
    }
    float _725 = _721;
    if (!_104)
    {
        float _727 = fma(_719, _689, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _711 = _727;
    }
    float _729 = _711;
    float _731 = _729;
    if (!_104)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _733;
    }
    float _735 = _731;
    if (!_104)
    {
        float2 _2426 = float2(_725, _735);
        float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2426, float2(0.0), isnan(_2426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2426, float2(0.0), isnan(_2426)), level(0.0)).x;
        _108 = _737;
    }
    float _739 = _108;
    if (_104)
    {
        _280 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _741 = _280;
    float _743 = _741;
    if (_104)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _745 = _687;
    if (_104)
    {
        float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _741, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _713 = _747;
    }
    float _749 = _713;
    float _751 = _749;
    if (_104)
    {
        float _753 = fma(_707, _741, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _743 = _753;
    }
    float _755 = _743;
    float _757 = _755;
    if (_104)
    {
        float _759 = fma(_749, _745, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _751 = _759;
    }
    float _761 = _751;
    float _763 = _761;
    if (_104)
    {
        float _765 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_104)
    {
        float _771 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _761);
        _763 = _771;
    }
    float _773 = _763;
    if (_104)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739;
    if (_104)
    {
        float2 _2519 = float2(_773, _777);
        float _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2519, float2(0.0), isnan(_2519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2519, float2(0.0), isnan(_2519)), level(0.0)).x;
        _779 = _781;
    }
    float _783 = _779;
    float _785 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _787 = fma(_719, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _795 = _793 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _797 = _793 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _801 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _795);
    float _803 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _797);
    float _805 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _799);
    float _807 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[1].z, _801);
    float _809 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[0].z, _803);
    float _811 = fma(_707, (*spvDescriptorSet0.vp_c4)._m0[2].z, _805);
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
        float _921 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2783 = float3(_921, _919, float(0));
        float3 _2787 = select(_2783, float3(0.0), isnan(_2783));
        float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2787.xy, uint(rint(_2787.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2787.xy, uint(rint(_2787.z)), level(0.0)).xyzw;
        float _926 = _924.x;
        float _928 = _924.y;
        float _930 = _924.z;
        float _932 = _924.w;
        float3 _2802 = float3(_921, _919, float(1));
        float3 _2804 = select(_2802, float3(0.0), isnan(_2802));
        float4 _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _936 = _934.x;
        float _938 = _934.y;
        float _940 = _934.z;
        float _942 = _934.w;
        float3 _2819 = float3(_921, _919, float(2));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _946 = _944.x;
        float _948 = _944.y;
        float _950 = _944.z;
        float _952 = _944.w;
        float3 _2836 = float3(_921, _919, float(3));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _956 = _954.x;
        float _958 = _954.y;
        float _960 = _954.z;
        float _962 = _954.w;
        float3 _2853 = float3(_921, _919, float(4));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _964 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _966 = _964.x;
        float _968 = _964.y;
        float _970 = _964.z;
        float _972 = _964.w;
        float3 _2870 = float3(_921, _919, float(5));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _976 = _974.x;
        float _978 = _974.y;
        float _980 = _974.z;
        float _982 = _974.w;
        float3 _2887 = float3(_921, _919, float(6));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _986 = _984.x;
        float _988 = _984.y;
        float _990 = _984.z;
        float _992 = _984.w;
        float3 _2904 = float3(_921, _919, float(7));
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
    float _1074 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1078 = _707 + _1076;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _793;
    out.m_45.z = _707;
    float _1100 = _791 ? _1086 : 0.0;
    float _1102 = _791 ? _1080 : 0.0;
    float _1104 = rsqrt(_1096);
    float _1106 = _791 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _785;
    out.m_47.w = _787;
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

