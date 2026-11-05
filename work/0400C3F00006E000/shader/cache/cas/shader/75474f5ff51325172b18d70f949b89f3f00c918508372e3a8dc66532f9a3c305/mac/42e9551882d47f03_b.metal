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
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _76 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _78 = _76 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_73, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _94 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _96 = _78 == 80;
    bool _98 = _69 >= 0.5;
    bool _100 = isnan(_69);
    bool _102 = _98 || _100;
    bool _104 = isnan(0.5);
    bool _106 = _102 || _104;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _110 = _92 + _108;
    float _112 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _114 = _94 + _112;
    float _116 = as_type<float>(gl_BaseInstance);
    if (_82)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _118 = _116;
    float _120 = _110 * _110;
    bool _122 = _78 == 96;
    float _124 = 0.0;
    float _126 = _118;
    float _128 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _130 = _124;
    float _132 = fma(_114, _114, _120);
    float _134 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _136 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _134;
    float _138 = _130;
    float _140 = _136;
    if (_84)
    {
        _126 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _142 = _126;
    bool _144 = _78 == 112;
    float _146 = fma(_136, _136, _132);
    float _148 = _142;
    if (_84)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _150 = _138;
    float _152 = _150;
    if (_86)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _154 = _148;
    bool _156 = _78 == 128;
    float _158 = rsqrt(_146);
    float _160 = _154;
    if (_86)
    {
        _152 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _162 = _152;
    float _164 = _162;
    if (_88)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _166 = _160;
    bool _168 = _78 == 144;
    float _170 = _166;
    if (_88)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _172 = _164;
    float _174 = _172;
    if (_90)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _176 = _170;
    bool _178 = _78 == 160;
    float _180 = _176;
    if (_90)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _182 = _174;
    float _184 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _180;
    float _188 = _158 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _190 = _78 == 176;
    float _192 = _186;
    if (_96)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _194 = _184;
    bool _196 = _78 == 192;
    float _198 = log2(_188);
    float _200 = _194;
    if (_122)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _202 = _192;
    float _204 = _202;
    if (_122)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _206 = _200;
    float _208 = _206;
    if (_144)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _210 = _204;
    bool _212 = _78 == 208;
    float _214 = _210;
    if (_144)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _216 = _208;
    float _218 = _216;
    if (_156)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _220 = _214;
    bool _222 = _78 == 224;
    float _224 = _220;
    if (_156)
    {
        _218 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _218;
    float _228 = _198 + 1.2999999523162841796875;
    float _230 = _226;
    if (_168)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _232 = _224;
    bool _234 = _78 == 240;
    float _236 = _232;
    if (_168)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _238 = _230;
    float _240 = trunc(_228);
    int _242 = int(_240);
    float _244 = _238;
    if (_178)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _246 = _236;
    bool _248 = _78 == 256;
    float _250 = _246;
    if (_178)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _252 = _244;
    float _254 = _252;
    if (_190)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _256 = _250;
    bool _258 = _78 == 272;
    float _260 = _256;
    if (_190)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _262 = _254;
    float _264 = _262;
    if (_196)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _266 = _260;
    bool _268 = _78 == 288;
    int _270 = min(_242, 15);
    float _272 = _266;
    if (_196)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _274 = _264;
    bool _276 = _78 == 304;
    float _278 = float(_270);
    float _280 = _274;
    if (_212)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _282 = _272;
    int _284 = _270 << 4;
    int _286 = _284 + 4288;
    float _288 = _282;
    float _290 = as_type<float>(_286);
    if (_212)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _292 = _280;
    float _294 = _292;
    if (_222)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _288;
    float _298 = -_278;
    float _300 = _298 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _302 = _78 == 320;
    int _304 = _286 + 8;
    uint _307 = uint(int(uint(_304) >> uint(2)));
    uint _309 = uint(int(uint(int(_307)) >> uint(2)));
    int _311 = int(_307) & 3;
    float _313 = (*spvDescriptorSet0.vp_c14)._m0[int(_309)][_311];
    int _315 = int(_307) + 1;
    uint _317 = uint(int(uint(_315) >> uint(2)));
    int _319 = _315 & 3;
    float _321 = (*spvDescriptorSet0.vp_c14)._m0[int(_317)][_319];
    float _323 = _296;
    if (_222)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _325 = _294;
    float _327 = _300 + 1.0;
    float _329 = _325;
    if (_234)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _331 = _323;
    bool _333 = _78 == 336;
    float _335 = _331;
    if (_234)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _337 = _329;
    float _339 = exp2(_327);
    float _341 = _337;
    if (_248)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _343 = _335;
    bool _345 = _78 == 352;
    float _347 = _343;
    if (_248)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _349 = _341;
    float _351 = _349;
    if (_258)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _353 = _347;
    bool _355 = _78 == 368;
    float _357 = _353;
    if (_258)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _359 = _351;
    float _361 = _359;
    if (_268)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _363 = _357;
    bool _365 = _78 == 384;
    float _367 = 1.0 / _339;
    float _369 = _363;
    float _371 = _339;
    if (_268)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _373 = _361;
    float _375 = _373;
    if (_276)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _377 = _369;
    bool _379 = _78 == 400;
    float _381 = _377;
    if (_276)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _383 = _375;
    bool _385 = _78 == 416;
    float _387 = _383;
    if (_302)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _389 = _381;
    float _391 = _389;
    if (_302)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _393 = _387;
    float _395 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _397 = _391;
    bool _399 = _78 == 432;
    float _401 = _397;
    if (_333)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _403 = _395;
    float _405 = _403;
    if (_345)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _407 = _401;
    bool _409 = _78 == 448;
    float _411 = _407;
    if (_345)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _413 = _405;
    float _415 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _417 = _411;
    bool _419 = _78 == 464;
    float _421 = _417;
    if (_355)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _423 = _415;
    float _425 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _427 = _421;
    bool _429 = _78 == 480;
    float _431 = _427;
    if (_365)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _433 = _425;
    float _435 = _433;
    if (_379)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _437 = _431;
    bool _439 = _78 == 496;
    float _441 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _443 = _435;
    float _445 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _447 = _441;
    bool _449 = _78 == 512;
    float _451 = _447;
    if (_385)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _453 = _445;
    bool _455 = _78 == 528;
    float _457 = _453;
    if (_399)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _459 = _451;
    float _461 = _459;
    if (_399)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _463 = _457;
    float _465 = _463;
    if (_409)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _467 = _461;
    bool _469 = _78 == 544;
    float _471 = _467;
    if (_409)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _473 = _465;
    float _475 = _473;
    if (_419)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _477 = _471;
    bool _479 = _78 == 560;
    float _481 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _483 = _475;
    float _485 = _483;
    if (_429)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _487 = _481;
    bool _489 = _78 == 576;
    float _491 = _487;
    if (_429)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _493 = _485;
    float _495 = _493;
    if (_439)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _497 = _491;
    bool _499 = _78 == 592;
    float _501 = _497;
    if (_439)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _503 = _495;
    float _505 = _503;
    if (_449)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _507 = _501;
    bool _509 = _78 == 608;
    float _511 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _513 = _505;
    float _515 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _517 = _511;
    bool _519 = _78 == 624;
    float _521 = _517;
    if (_455)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _523 = _515;
    bool _525 = _78 == 640;
    float _527 = _523;
    if (_469)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _529 = _521;
    float _531 = _529;
    if (_469)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _533 = _527;
    float _535 = _533;
    if (_479)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _537 = _531;
    bool _539 = _78 == 656;
    float _541 = _537;
    if (_479)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _543 = _535;
    float _545 = _543;
    if (_489)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _547 = _541;
    bool _549 = _78 == 672;
    float _551 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _553 = _545;
    float _555 = _553;
    if (_499)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _557 = _551;
    bool _559 = _78 == 688;
    float _561 = _557;
    if (_499)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _563 = _555;
    float _565 = _563;
    if (_509)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _567 = _561;
    bool _569 = _78 == 704;
    float _571 = _567;
    if (_509)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _573 = _565;
    float _575 = _573;
    if (_519)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _577 = _571;
    bool _579 = _78 == 720;
    float _581 = _577;
    if (_519)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _583 = _575;
    float _585 = _583;
    if (_525)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _587 = _581;
    bool _589 = _78 == 736;
    float _591 = _587;
    if (_525)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _593 = _585;
    bool _595 = _78 == 752;
    float _597 = _593;
    if (_539)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _599 = _591;
    float _601 = _599;
    if (_549)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_559)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_569)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_579)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _615 = _613;
    float _617 = _615;
    if (_589)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _619 = _617;
    float _621 = _619;
    if (_595)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _623 = _621;
    float _625 = _367 * _623;
    if (_539)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _627 = _597;
    float _629 = _627;
    if (_549)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _631 = _629;
    float _633 = _625 * _67;
    float _635 = _631;
    if (_559)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _637 = _635;
    float _639 = _637;
    if (_569)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _641 = _639;
    float _643 = floor(_633);
    float _645 = _641;
    if (_579)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _647 = _645;
    float _649 = _647;
    if (_589)
    {
        _649 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _651 = _649;
    float _653 = _651;
    if (_595)
    {
        _653 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _655 = _653;
    float _657 = -_643;
    float _659 = _633 + _657;
    float _661 = _339 * _655;
    float _663 = _659;
    if (!_106)
    {
        _371 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _665 = _371;
    float _667 = _659 * 2.0;
    float _669 = -_659;
    float _671 = fma(_661, _669, _67);
    float _673 = floor(_667);
    float _675 = _661 * _673;
    float _677 = _675 * 0.5;
    float _679 = _677 + _671;
    float _681 = fma(_73, _679, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _683 = fma(_679, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _685 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _687 = _681 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _691 = _683 + _689;
    float _693 = _687 * _687;
    float _695 = fma(_691, _691, _693);
    float _697 = fma(_136, _136, _695);
    float _699 = sqrt(_697);
    float _701 = -_321;
    float _703 = fma(_699, _313, _701);
    float _705 = precise::clamp(_703, 0.0, 1.0);
    float _707 = -_677;
    float _709 = fma(_707, _705, _679);
    float _711 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _713 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _715 = _697;
    float _717 = _665;
    float _719 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_106)
    {
        float _721 = fma(_711, _665, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _140 = _721;
    }
    float _723 = _140;
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _727 = _723;
    if (!_106)
    {
        float _729 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _727 = _729;
    }
    float _731 = _727;
    if (!_106)
    {
        float _733 = fma(_725, _665, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _128 = _733;
    }
    float _735 = _128;
    float _737 = _735;
    if (!_106)
    {
        float _739 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _735);
        _715 = _739;
    }
    float _741 = _715;
    if (!_106)
    {
        float2 _2538 = float2(_741, _731);
        float _743 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2538, float2(0.0), isnan(_2538)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2538, float2(0.0), isnan(_2538)), level(0.0)).x;
        _737 = _743;
    }
    float _745 = _737;
    if (_106)
    {
        _290 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _747 = _290;
    float _749 = _747;
    if (_106)
    {
        _663 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _751 = _663;
    if (_106)
    {
        float _753 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _747, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _717 = _753;
    }
    float _755 = _717;
    float _757 = _755;
    if (_106)
    {
        float _759 = fma(_713, _747, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _749 = _759;
    }
    float _761 = _749;
    float _763 = _761;
    if (_106)
    {
        float _765 = fma(_755, _751, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_106)
    {
        float _771 = fma(_761, _751, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _763 = _771;
    }
    float _773 = _763;
    float _775 = _773;
    if (_106)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _777;
    }
    float _779 = _769;
    float _781 = _779;
    if (_106)
    {
        float _783 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _773);
        _775 = _783;
    }
    float _785 = _775;
    float _787 = _745;
    float _789 = _785;
    if (_106)
    {
        float2 _2633 = float2(_785, _779);
        float _791 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2633, float2(0.0), isnan(_2633)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2633, float2(0.0), isnan(_2633)), level(0.0)).x;
        _787 = _791;
    }
    float _793 = _787;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _801 = _713 + _799;
    float _803 = _797 * _797;
    float _805 = fma(_801, _801, _803);
    float _807 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _809 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _811 = sqrt(_805);
    float _813 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _815 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _817 = _811 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _819 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_817)
    {
        _781 = _713;
    }
    float _821 = _781;
    float _823 = fma(_793, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _825 = _821;
    if (!_817)
    {
        _819 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _827 = _819;
    float _829 = _823 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _831 = _827;
    if (!_817)
    {
        _789 = _823;
    }
    float _833 = _789;
    float _835 = fma(_713, (*spvDescriptorSet0.vp_c4)._m0[2].x, _829);
    float _837 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _835);
    float _839 = _837 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _841 = _833;
    if (!_817)
    {
        _719 = _839;
    }
    float _843 = _719;
    bool _845 = !_817;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _853 = _811 + _851;
        float _855 = _823 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _857 = _853 * _849;
        float _859 = rsqrt(_805);
        float _861 = _857 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = sin(_867);
        float _871 = _865 + (-1.0);
        float _873 = fma(_869, _855, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _877 = _859 * _873;
        float _879 = fma(_823, _865, _875);
        float _881 = fma(_801, _877, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _883 = _879 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _885 = fma(_797, _877, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _887 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[2].x, _883);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        float _891 = _889 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _841 = _879;
        _825 = _881;
        _831 = _885;
        _847 = _891;
    }
    float _893 = _841;
    float _895 = _825;
    float _897 = _831;
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
        _955 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _957 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _959 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1019 = true;
    }
    else
    {
        float _1021 = fma(_713, 6.2500002968590706586837768554688e-05, 0.5);
        float _1023 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3057 = float3(_1021, _1023, float(0));
        float3 _3061 = select(_3057, float3(0.0), isnan(_3057));
        float4 _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3061.xy, uint(rint(_3061.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3061.xy, uint(rint(_3061.z)), level(0.0)).xyzw;
        float _1028 = _1026.x;
        float _1030 = _1026.y;
        float _1032 = _1026.z;
        float _1034 = _1026.w;
        float3 _3076 = float3(_1021, _1023, float(1));
        float3 _3078 = select(_3076, float3(0.0), isnan(_3076));
        float4 _1036 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3078.xy, uint(rint(_3078.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3078.xy, uint(rint(_3078.z)), level(0.0)).xyzw;
        float _1038 = _1036.x;
        float _1040 = _1036.y;
        float _1042 = _1036.z;
        float _1044 = _1036.w;
        float3 _3093 = float3(_1021, _1023, float(2));
        float3 _3095 = select(_3093, float3(0.0), isnan(_3093));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3095.xy, uint(rint(_3095.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3095.xy, uint(rint(_3095.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3110 = float3(_1021, _1023, float(3));
        float3 _3112 = select(_3110, float3(0.0), isnan(_3110));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3112.xy, uint(rint(_3112.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3112.xy, uint(rint(_3112.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3127 = float3(_1021, _1023, float(4));
        float3 _3129 = select(_3127, float3(0.0), isnan(_3127));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3129.xy, uint(rint(_3129.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3129.xy, uint(rint(_3129.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3144 = float3(_1021, _1023, float(5));
        float3 _3146 = select(_3144, float3(0.0), isnan(_3144));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3146.xy, uint(rint(_3146.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3146.xy, uint(rint(_3146.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3161 = float3(_1021, _1023, float(6));
        float3 _3163 = select(_3161, float3(0.0), isnan(_3161));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3163.xy, uint(rint(_3163.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3163.xy, uint(rint(_3163.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3178 = float3(_1021, _1023, float(7));
        float3 _3180 = select(_3178, float3(0.0), isnan(_3178));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3180.xy, uint(rint(_3180.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3180.xy, uint(rint(_3180.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        _955 = _1060;
        _957 = _1058;
        _959 = _1062;
        _961 = as_type<int>(_1068);
        _963 = as_type<int>(_1064);
        _965 = as_type<int>(_1070);
        _967 = as_type<int>(_1074);
        _969 = as_type<int>(_1072);
        _971 = as_type<int>(_1078);
        _973 = as_type<int>(_1082);
        _975 = as_type<int>(_1080);
        _977 = as_type<int>(_1084);
        _979 = _1090;
        _981 = _1100;
        _983 = _1038;
        _985 = _1034;
        _987 = _1088;
        _989 = _1098;
        _991 = _1040;
        _993 = _1030;
        _995 = _1092;
        _997 = _1102;
        _999 = _1028;
        _1001 = _1032;
        _1003 = _1094;
        _1005 = _1104;
        _1007 = _1044;
        _1009 = _1042;
        _1011 = _1048;
        _1013 = _1052;
        _1015 = _1050;
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
    float _1172 = _823 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1176 = _713 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1178;
    out.m_45.x = _713;
    out.m_45.y = _823;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1182 = _1172 * _1172;
    float _1184 = _1106 * 0.88622701168060302734375;
    float _1186 = _1108 * 0.88622701168060302734375;
    float _1188 = _1110 * 0.88622701168060302734375;
    float _1190 = fma(_1176, _1176, _1182);
    float _1192 = _915 ? as_type<float>(_1112) : 0.0;
    out.gl_Position.x = _947;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    float _1194 = _915 ? _1184 : 0.0;
    float _1196 = fma(_1180, _1180, _1190);
    float _1198 = _915 ? as_type<float>(_1114) : 0.0;
    out.m_47.z = _815;
    out.m_47.w = _813;
    float _1200 = _915 ? _1186 : 0.0;
    float _1202 = _915 ? as_type<float>(_1116) : 0.0;
    float _1204 = rsqrt(_1196);
    float _1206 = _915 ? _1188 : 0.0;
    out.m_49.x = _809;
    out.m_49.y = _807;
    float _1208 = _915 ? as_type<float>(_1118) : 0.0;
    float _1210 = _915 ? as_type<float>(_1120) : 0.0;
    float _1212 = -_839;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1216 = _1212 + _1214;
    float _1218 = _915 ? as_type<float>(_1122) : 0.0;
    out.m_51.w = _839;
    float _1220 = _915 ? as_type<float>(_1124) : 0.0;
    float _1222 = _915 ? as_type<float>(_1126) : 0.0;
    float _1224 = _915 ? as_type<float>(_1128) : 0.0;
    float _1226 = _1204 * 1.02332699298858642578125;
    float _1228 = _1180 * _1204;
    float _1230 = _1172 * _1226;
    float _1232 = _1228 * (-1.02332699298858642578125);
    float _1234 = _1176 * _1226;
    float _1236 = _1230 * _1130;
    float _1238 = _1230 * _1132;
    float _1240 = _1230 * _1134;
    float _1242 = _1230 * _1136;
    float _1244 = fma(_1138, 0.88622701168060302734375, _1236);
    float _1246 = fma(_1140, 0.88622701168060302734375, _1238);
    float _1248 = _1230 * _1142;
    float _1250 = fma(_1144, 0.88622701168060302734375, _1240);
    float _1252 = fma(_1232, _1146, _1244);
    float _1254 = fma(_1232, _1148, _1246);
    float _1256 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1258 = fma(_1152, 0.88622701168060302734375, _1248);
    float _1260 = fma(_1234, _1154, _1252);
    float _1262 = fma(_1234, _1156, _1254);
    float _1264 = fma(_1192, _1230, _1194);
    float _1266 = fma(_1232, _1158, _1250);
    float _1268 = fma(_1198, _1230, _1200);
    float _1270 = precise::max(0.0, _1260);
    float _1272 = fma(_1232, _1160, _1256);
    float _1274 = precise::max(0.0, _1262);
    float _1276 = fma(_1202, _1230, _1206);
    float _1278 = fma(_1232, _1162, _1258);
    float _1280 = _1270 * 0.31830990314483642578125;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = fma(_1208, _1232, _1264);
    float _1286 = _1274 * 0.31830990314483642578125;
    float _1288 = precise::clamp(_1286, 0.0, 1.0);
    float _1290 = fma(_1234, _1164, _1266);
    float _1292 = fma(_1210, _1232, _1268);
    float _1294 = fma(_1234, _1166, _1272);
    float _1296 = fma(_1218, _1232, _1276);
    float _1298 = fma(_1234, _1168, _1278);
    float _1300 = _1282 * 0.88622701168060302734375;
    float _1302 = -_1288;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1220, _1234, _1284);
    float _1308 = fma(_1222, _1234, _1292);
    float _1310 = precise::max(0.0, _1290);
    float _1312 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = precise::max(0.0, _1294);
    float _1316 = fma(_1224, _1234, _1296);
    float _1318 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1288);
    float _1320 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1322 = precise::max(0.0, _1298);
    float _1324 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1326 = precise::max(0.0, _1306);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1330 = precise::max(0.0, _1308);
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1334 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1320);
    float _1336 = precise::max(0.0, _1316);
    float _1338 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1324);
    float _1340 = fma(_1326, _1332, _1328);
    float _1342 = fma(_1330, _1332, _1334);
    float _1344 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1346 = fma(_1336, _1332, _1338);
    out.m_53.w = _1344;
    out.m_51.x = _1342;
    out.m_51.y = _1340;
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
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _76 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _78 = _76 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_73, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _94 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _96 = _78 == 80;
    bool _98 = _69 >= 0.5;
    bool _100 = isnan(_69);
    bool _102 = _98 || _100;
    bool _104 = isnan(0.5);
    bool _106 = _102 || _104;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _110 = _92 + _108;
    float _112 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _114 = _94 + _112;
    float _116 = as_type<float>(gl_BaseInstance);
    if (_82)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _118 = _116;
    float _120 = _110 * _110;
    bool _122 = _78 == 96;
    float _124 = 0.0;
    float _126 = _118;
    float _128 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _130 = _124;
    float _132 = fma(_114, _114, _120);
    float _134 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _136 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _134;
    float _138 = _130;
    float _140 = _136;
    if (_84)
    {
        _126 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _142 = _126;
    bool _144 = _78 == 112;
    float _146 = fma(_136, _136, _132);
    float _148 = _142;
    if (_84)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _150 = _138;
    float _152 = _150;
    if (_86)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _154 = _148;
    bool _156 = _78 == 128;
    float _158 = rsqrt(_146);
    float _160 = _154;
    if (_86)
    {
        _152 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _162 = _152;
    float _164 = _162;
    if (_88)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _166 = _160;
    bool _168 = _78 == 144;
    float _170 = _166;
    if (_88)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _172 = _164;
    float _174 = _172;
    if (_90)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _176 = _170;
    bool _178 = _78 == 160;
    float _180 = _176;
    if (_90)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _182 = _174;
    float _184 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _180;
    float _188 = _158 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _190 = _78 == 176;
    float _192 = _186;
    if (_96)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _194 = _184;
    bool _196 = _78 == 192;
    float _198 = log2(_188);
    float _200 = _194;
    if (_122)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _202 = _192;
    float _204 = _202;
    if (_122)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _206 = _200;
    float _208 = _206;
    if (_144)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _210 = _204;
    bool _212 = _78 == 208;
    float _214 = _210;
    if (_144)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _216 = _208;
    float _218 = _216;
    if (_156)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _220 = _214;
    bool _222 = _78 == 224;
    float _224 = _220;
    if (_156)
    {
        _218 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _218;
    float _228 = _198 + 1.2999999523162841796875;
    float _230 = _226;
    if (_168)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _232 = _224;
    bool _234 = _78 == 240;
    float _236 = _232;
    if (_168)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _238 = _230;
    float _240 = trunc(_228);
    int _242 = int(_240);
    float _244 = _238;
    if (_178)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _246 = _236;
    bool _248 = _78 == 256;
    float _250 = _246;
    if (_178)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _252 = _244;
    float _254 = _252;
    if (_190)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _256 = _250;
    bool _258 = _78 == 272;
    float _260 = _256;
    if (_190)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _262 = _254;
    float _264 = _262;
    if (_196)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _266 = _260;
    bool _268 = _78 == 288;
    int _270 = min(_242, 15);
    float _272 = _266;
    if (_196)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _274 = _264;
    bool _276 = _78 == 304;
    float _278 = float(_270);
    float _280 = _274;
    if (_212)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _282 = _272;
    int _284 = _270 << 4;
    int _286 = _284 + 4288;
    float _288 = _282;
    float _290 = as_type<float>(_286);
    if (_212)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _292 = _280;
    float _294 = _292;
    if (_222)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _288;
    float _298 = -_278;
    float _300 = _298 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _302 = _78 == 320;
    int _304 = _286 + 8;
    uint _307 = uint(int(uint(_304) >> uint(2)));
    uint _309 = uint(int(uint(int(_307)) >> uint(2)));
    int _311 = int(_307) & 3;
    float _313 = (*spvDescriptorSet0.vp_c14)._m0[int(_309)][_311];
    int _315 = int(_307) + 1;
    uint _317 = uint(int(uint(_315) >> uint(2)));
    int _319 = _315 & 3;
    float _321 = (*spvDescriptorSet0.vp_c14)._m0[int(_317)][_319];
    float _323 = _296;
    if (_222)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _325 = _294;
    float _327 = _300 + 1.0;
    float _329 = _325;
    if (_234)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _331 = _323;
    bool _333 = _78 == 336;
    float _335 = _331;
    if (_234)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _337 = _329;
    float _339 = exp2(_327);
    float _341 = _337;
    if (_248)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _343 = _335;
    bool _345 = _78 == 352;
    float _347 = _343;
    if (_248)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _349 = _341;
    float _351 = _349;
    if (_258)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _353 = _347;
    bool _355 = _78 == 368;
    float _357 = _353;
    if (_258)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _359 = _351;
    float _361 = _359;
    if (_268)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _363 = _357;
    bool _365 = _78 == 384;
    float _367 = 1.0 / _339;
    float _369 = _363;
    float _371 = _339;
    if (_268)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _373 = _361;
    float _375 = _373;
    if (_276)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _377 = _369;
    bool _379 = _78 == 400;
    float _381 = _377;
    if (_276)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _383 = _375;
    bool _385 = _78 == 416;
    float _387 = _383;
    if (_302)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _389 = _381;
    float _391 = _389;
    if (_302)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _393 = _387;
    float _395 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _397 = _391;
    bool _399 = _78 == 432;
    float _401 = _397;
    if (_333)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _403 = _395;
    float _405 = _403;
    if (_345)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _407 = _401;
    bool _409 = _78 == 448;
    float _411 = _407;
    if (_345)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _413 = _405;
    float _415 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _417 = _411;
    bool _419 = _78 == 464;
    float _421 = _417;
    if (_355)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _423 = _415;
    float _425 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _427 = _421;
    bool _429 = _78 == 480;
    float _431 = _427;
    if (_365)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _433 = _425;
    float _435 = _433;
    if (_379)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _437 = _431;
    bool _439 = _78 == 496;
    float _441 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _443 = _435;
    float _445 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _447 = _441;
    bool _449 = _78 == 512;
    float _451 = _447;
    if (_385)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _453 = _445;
    bool _455 = _78 == 528;
    float _457 = _453;
    if (_399)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _459 = _451;
    float _461 = _459;
    if (_399)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _463 = _457;
    float _465 = _463;
    if (_409)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _467 = _461;
    bool _469 = _78 == 544;
    float _471 = _467;
    if (_409)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _473 = _465;
    float _475 = _473;
    if (_419)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _477 = _471;
    bool _479 = _78 == 560;
    float _481 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _483 = _475;
    float _485 = _483;
    if (_429)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _487 = _481;
    bool _489 = _78 == 576;
    float _491 = _487;
    if (_429)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _493 = _485;
    float _495 = _493;
    if (_439)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _497 = _491;
    bool _499 = _78 == 592;
    float _501 = _497;
    if (_439)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _503 = _495;
    float _505 = _503;
    if (_449)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _507 = _501;
    bool _509 = _78 == 608;
    float _511 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _513 = _505;
    float _515 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _517 = _511;
    bool _519 = _78 == 624;
    float _521 = _517;
    if (_455)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _523 = _515;
    bool _525 = _78 == 640;
    float _527 = _523;
    if (_469)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _529 = _521;
    float _531 = _529;
    if (_469)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _533 = _527;
    float _535 = _533;
    if (_479)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _537 = _531;
    bool _539 = _78 == 656;
    float _541 = _537;
    if (_479)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _543 = _535;
    float _545 = _543;
    if (_489)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _547 = _541;
    bool _549 = _78 == 672;
    float _551 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _553 = _545;
    float _555 = _553;
    if (_499)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _557 = _551;
    bool _559 = _78 == 688;
    float _561 = _557;
    if (_499)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _563 = _555;
    float _565 = _563;
    if (_509)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _567 = _561;
    bool _569 = _78 == 704;
    float _571 = _567;
    if (_509)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _573 = _565;
    float _575 = _573;
    if (_519)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _577 = _571;
    bool _579 = _78 == 720;
    float _581 = _577;
    if (_519)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _583 = _575;
    float _585 = _583;
    if (_525)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _587 = _581;
    bool _589 = _78 == 736;
    float _591 = _587;
    if (_525)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _593 = _585;
    bool _595 = _78 == 752;
    float _597 = _593;
    if (_539)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _599 = _591;
    float _601 = _599;
    if (_549)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_559)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_569)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_579)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _615 = _613;
    float _617 = _615;
    if (_589)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _619 = _617;
    float _621 = _619;
    if (_595)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _623 = _621;
    float _625 = _367 * _623;
    if (_539)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _627 = _597;
    float _629 = _627;
    if (_549)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _631 = _629;
    float _633 = _625 * _67;
    float _635 = _631;
    if (_559)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _637 = _635;
    float _639 = _637;
    if (_569)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _641 = _639;
    float _643 = floor(_633);
    float _645 = _641;
    if (_579)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _647 = _645;
    float _649 = _647;
    if (_589)
    {
        _649 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _651 = _649;
    float _653 = _651;
    if (_595)
    {
        _653 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _655 = _653;
    float _657 = -_643;
    float _659 = _633 + _657;
    float _661 = _339 * _655;
    float _663 = _659;
    if (!_106)
    {
        _371 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _665 = _371;
    float _667 = _659 * 2.0;
    float _669 = -_659;
    float _671 = fma(_661, _669, _67);
    float _673 = floor(_667);
    float _675 = _661 * _673;
    float _677 = _675 * 0.5;
    float _679 = _677 + _671;
    float _681 = fma(_73, _679, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _683 = fma(_679, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _685 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _687 = _681 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _691 = _683 + _689;
    float _693 = _687 * _687;
    float _695 = fma(_691, _691, _693);
    float _697 = fma(_136, _136, _695);
    float _699 = sqrt(_697);
    float _701 = -_321;
    float _703 = fma(_699, _313, _701);
    float _705 = precise::clamp(_703, 0.0, 1.0);
    float _707 = -_677;
    float _709 = fma(_707, _705, _679);
    float _711 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _713 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _715 = _697;
    float _717 = _665;
    float _719 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_106)
    {
        float _721 = fma(_711, _665, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _140 = _721;
    }
    float _723 = _140;
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _727 = _723;
    if (!_106)
    {
        float _729 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _727 = _729;
    }
    float _731 = _727;
    if (!_106)
    {
        float _733 = fma(_725, _665, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _128 = _733;
    }
    float _735 = _128;
    float _737 = _735;
    if (!_106)
    {
        float _739 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _735);
        _715 = _739;
    }
    float _741 = _715;
    if (!_106)
    {
        float2 _2538 = float2(_741, _731);
        float _743 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2538, float2(0.0), isnan(_2538)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2538, float2(0.0), isnan(_2538)), level(0.0)).x;
        _737 = _743;
    }
    float _745 = _737;
    if (_106)
    {
        _290 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _747 = _290;
    float _749 = _747;
    if (_106)
    {
        _663 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _751 = _663;
    if (_106)
    {
        float _753 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _747, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _717 = _753;
    }
    float _755 = _717;
    float _757 = _755;
    if (_106)
    {
        float _759 = fma(_713, _747, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _749 = _759;
    }
    float _761 = _749;
    float _763 = _761;
    if (_106)
    {
        float _765 = fma(_755, _751, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_106)
    {
        float _771 = fma(_761, _751, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _763 = _771;
    }
    float _773 = _763;
    float _775 = _773;
    if (_106)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _777;
    }
    float _779 = _769;
    float _781 = _779;
    if (_106)
    {
        float _783 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _773);
        _775 = _783;
    }
    float _785 = _775;
    float _787 = _745;
    float _789 = _785;
    if (_106)
    {
        float2 _2633 = float2(_785, _779);
        float _791 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2633, float2(0.0), isnan(_2633)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2633, float2(0.0), isnan(_2633)), level(0.0)).x;
        _787 = _791;
    }
    float _793 = _787;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _801 = _713 + _799;
    float _803 = _797 * _797;
    float _805 = fma(_801, _801, _803);
    float _807 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _809 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _811 = sqrt(_805);
    float _813 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _815 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _817 = _811 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _819 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_817)
    {
        _781 = _713;
    }
    float _821 = _781;
    float _823 = fma(_793, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _825 = _821;
    if (!_817)
    {
        _819 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _827 = _819;
    float _829 = _823 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _831 = _827;
    if (!_817)
    {
        _789 = _823;
    }
    float _833 = _789;
    float _835 = fma(_713, (*spvDescriptorSet0.vp_c4)._m0[2].x, _829);
    float _837 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _835);
    float _839 = _837 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _841 = _833;
    if (!_817)
    {
        _719 = _839;
    }
    float _843 = _719;
    bool _845 = !_817;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _853 = _811 + _851;
        float _855 = _823 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _857 = _853 * _849;
        float _859 = rsqrt(_805);
        float _861 = _857 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = sin(_867);
        float _871 = _865 + (-1.0);
        float _873 = fma(_869, _855, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _877 = _859 * _873;
        float _879 = fma(_823, _865, _875);
        float _881 = fma(_801, _877, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _883 = _879 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _885 = fma(_797, _877, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _887 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[2].x, _883);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        float _891 = _889 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _841 = _879;
        _825 = _881;
        _831 = _885;
        _847 = _891;
    }
    float _893 = _841;
    float _895 = _825;
    float _897 = _831;
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
        _955 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _957 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _959 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1019 = true;
    }
    else
    {
        float _1021 = fma(_713, 6.2500002968590706586837768554688e-05, 0.5);
        float _1023 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3057 = float3(_1021, _1023, float(0));
        float3 _3061 = select(_3057, float3(0.0), isnan(_3057));
        float4 _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3061.xy, uint(rint(_3061.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3061.xy, uint(rint(_3061.z)), level(0.0)).xyzw;
        float _1028 = _1026.x;
        float _1030 = _1026.y;
        float _1032 = _1026.z;
        float _1034 = _1026.w;
        float3 _3076 = float3(_1021, _1023, float(1));
        float3 _3078 = select(_3076, float3(0.0), isnan(_3076));
        float4 _1036 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3078.xy, uint(rint(_3078.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3078.xy, uint(rint(_3078.z)), level(0.0)).xyzw;
        float _1038 = _1036.x;
        float _1040 = _1036.y;
        float _1042 = _1036.z;
        float _1044 = _1036.w;
        float3 _3093 = float3(_1021, _1023, float(2));
        float3 _3095 = select(_3093, float3(0.0), isnan(_3093));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3095.xy, uint(rint(_3095.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3095.xy, uint(rint(_3095.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3110 = float3(_1021, _1023, float(3));
        float3 _3112 = select(_3110, float3(0.0), isnan(_3110));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3112.xy, uint(rint(_3112.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3112.xy, uint(rint(_3112.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3127 = float3(_1021, _1023, float(4));
        float3 _3129 = select(_3127, float3(0.0), isnan(_3127));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3129.xy, uint(rint(_3129.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3129.xy, uint(rint(_3129.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3144 = float3(_1021, _1023, float(5));
        float3 _3146 = select(_3144, float3(0.0), isnan(_3144));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3146.xy, uint(rint(_3146.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3146.xy, uint(rint(_3146.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3161 = float3(_1021, _1023, float(6));
        float3 _3163 = select(_3161, float3(0.0), isnan(_3161));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3163.xy, uint(rint(_3163.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3163.xy, uint(rint(_3163.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3178 = float3(_1021, _1023, float(7));
        float3 _3180 = select(_3178, float3(0.0), isnan(_3178));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3180.xy, uint(rint(_3180.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3180.xy, uint(rint(_3180.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        _955 = _1060;
        _957 = _1058;
        _959 = _1062;
        _961 = as_type<int>(_1068);
        _963 = as_type<int>(_1064);
        _965 = as_type<int>(_1070);
        _967 = as_type<int>(_1074);
        _969 = as_type<int>(_1072);
        _971 = as_type<int>(_1078);
        _973 = as_type<int>(_1082);
        _975 = as_type<int>(_1080);
        _977 = as_type<int>(_1084);
        _979 = _1090;
        _981 = _1100;
        _983 = _1038;
        _985 = _1034;
        _987 = _1088;
        _989 = _1098;
        _991 = _1040;
        _993 = _1030;
        _995 = _1092;
        _997 = _1102;
        _999 = _1028;
        _1001 = _1032;
        _1003 = _1094;
        _1005 = _1104;
        _1007 = _1044;
        _1009 = _1042;
        _1011 = _1048;
        _1013 = _1052;
        _1015 = _1050;
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
    float _1172 = _823 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1176 = _713 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1178;
    out.m_45.x = _713;
    out.m_45.y = _823;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1182 = _1172 * _1172;
    float _1184 = _1106 * 0.88622701168060302734375;
    float _1186 = _1108 * 0.88622701168060302734375;
    float _1188 = _1110 * 0.88622701168060302734375;
    float _1190 = fma(_1176, _1176, _1182);
    float _1192 = _915 ? as_type<float>(_1112) : 0.0;
    out.gl_Position.x = _947;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    float _1194 = _915 ? _1184 : 0.0;
    float _1196 = fma(_1180, _1180, _1190);
    float _1198 = _915 ? as_type<float>(_1114) : 0.0;
    out.m_47.z = _815;
    out.m_47.w = _813;
    float _1200 = _915 ? _1186 : 0.0;
    float _1202 = _915 ? as_type<float>(_1116) : 0.0;
    float _1204 = rsqrt(_1196);
    float _1206 = _915 ? _1188 : 0.0;
    out.m_49.x = _809;
    out.m_49.y = _807;
    float _1208 = _915 ? as_type<float>(_1118) : 0.0;
    float _1210 = _915 ? as_type<float>(_1120) : 0.0;
    float _1212 = -_839;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1216 = _1212 + _1214;
    float _1218 = _915 ? as_type<float>(_1122) : 0.0;
    out.m_51.w = _839;
    float _1220 = _915 ? as_type<float>(_1124) : 0.0;
    float _1222 = _915 ? as_type<float>(_1126) : 0.0;
    float _1224 = _915 ? as_type<float>(_1128) : 0.0;
    float _1226 = _1204 * 1.02332699298858642578125;
    float _1228 = _1180 * _1204;
    float _1230 = _1172 * _1226;
    float _1232 = _1228 * (-1.02332699298858642578125);
    float _1234 = _1176 * _1226;
    float _1236 = _1230 * _1130;
    float _1238 = _1230 * _1132;
    float _1240 = _1230 * _1134;
    float _1242 = _1230 * _1136;
    float _1244 = fma(_1138, 0.88622701168060302734375, _1236);
    float _1246 = fma(_1140, 0.88622701168060302734375, _1238);
    float _1248 = _1230 * _1142;
    float _1250 = fma(_1144, 0.88622701168060302734375, _1240);
    float _1252 = fma(_1232, _1146, _1244);
    float _1254 = fma(_1232, _1148, _1246);
    float _1256 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1258 = fma(_1152, 0.88622701168060302734375, _1248);
    float _1260 = fma(_1234, _1154, _1252);
    float _1262 = fma(_1234, _1156, _1254);
    float _1264 = fma(_1192, _1230, _1194);
    float _1266 = fma(_1232, _1158, _1250);
    float _1268 = fma(_1198, _1230, _1200);
    float _1270 = precise::max(0.0, _1260);
    float _1272 = fma(_1232, _1160, _1256);
    float _1274 = precise::max(0.0, _1262);
    float _1276 = fma(_1202, _1230, _1206);
    float _1278 = fma(_1232, _1162, _1258);
    float _1280 = _1270 * 0.31830990314483642578125;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = fma(_1208, _1232, _1264);
    float _1286 = _1274 * 0.31830990314483642578125;
    float _1288 = precise::clamp(_1286, 0.0, 1.0);
    float _1290 = fma(_1234, _1164, _1266);
    float _1292 = fma(_1210, _1232, _1268);
    float _1294 = fma(_1234, _1166, _1272);
    float _1296 = fma(_1218, _1232, _1276);
    float _1298 = fma(_1234, _1168, _1278);
    float _1300 = _1282 * 0.88622701168060302734375;
    float _1302 = -_1288;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1220, _1234, _1284);
    float _1308 = fma(_1222, _1234, _1292);
    float _1310 = precise::max(0.0, _1290);
    float _1312 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = precise::max(0.0, _1294);
    float _1316 = fma(_1224, _1234, _1296);
    float _1318 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1288);
    float _1320 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1322 = precise::max(0.0, _1298);
    float _1324 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1326 = precise::max(0.0, _1306);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1330 = precise::max(0.0, _1308);
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1334 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1320);
    float _1336 = precise::max(0.0, _1316);
    float _1338 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1324);
    float _1340 = fma(_1326, _1332, _1328);
    float _1342 = fma(_1330, _1332, _1334);
    float _1344 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1346 = fma(_1336, _1332, _1338);
    out.m_53.w = _1344;
    out.m_51.x = _1342;
    out.m_51.y = _1340;
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
    float _73 = _71 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _76 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _78 = _76 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_73, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _94 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _96 = _78 == 80;
    bool _98 = _69 >= 0.5;
    bool _100 = isnan(_69);
    bool _102 = _98 || _100;
    bool _104 = isnan(0.5);
    bool _106 = _102 || _104;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _110 = _92 + _108;
    float _112 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _114 = _94 + _112;
    float _116 = as_type<float>(gl_BaseInstance);
    if (_82)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _118 = _116;
    float _120 = _110 * _110;
    bool _122 = _78 == 96;
    float _124 = 0.0;
    float _126 = _118;
    float _128 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _130 = _124;
    float _132 = fma(_114, _114, _120);
    float _134 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _136 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _134;
    float _138 = _130;
    float _140 = _136;
    if (_84)
    {
        _126 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _142 = _126;
    bool _144 = _78 == 112;
    float _146 = fma(_136, _136, _132);
    float _148 = _142;
    if (_84)
    {
        _138 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _150 = _138;
    float _152 = _150;
    if (_86)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _154 = _148;
    bool _156 = _78 == 128;
    float _158 = rsqrt(_146);
    float _160 = _154;
    if (_86)
    {
        _152 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _162 = _152;
    float _164 = _162;
    if (_88)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _166 = _160;
    bool _168 = _78 == 144;
    float _170 = _166;
    if (_88)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _172 = _164;
    float _174 = _172;
    if (_90)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _176 = _170;
    bool _178 = _78 == 160;
    float _180 = _176;
    if (_90)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _182 = _174;
    float _184 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _180;
    float _188 = _158 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _190 = _78 == 176;
    float _192 = _186;
    if (_96)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _194 = _184;
    bool _196 = _78 == 192;
    float _198 = log2(_188);
    float _200 = _194;
    if (_122)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _202 = _192;
    float _204 = _202;
    if (_122)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _206 = _200;
    float _208 = _206;
    if (_144)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _210 = _204;
    bool _212 = _78 == 208;
    float _214 = _210;
    if (_144)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _216 = _208;
    float _218 = _216;
    if (_156)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _220 = _214;
    bool _222 = _78 == 224;
    float _224 = _220;
    if (_156)
    {
        _218 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _218;
    float _228 = _198 + 1.2999999523162841796875;
    float _230 = _226;
    if (_168)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _232 = _224;
    bool _234 = _78 == 240;
    float _236 = _232;
    if (_168)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _238 = _230;
    float _240 = trunc(_228);
    int _242 = int(_240);
    float _244 = _238;
    if (_178)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _246 = _236;
    bool _248 = _78 == 256;
    float _250 = _246;
    if (_178)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _252 = _244;
    float _254 = _252;
    if (_190)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _256 = _250;
    bool _258 = _78 == 272;
    float _260 = _256;
    if (_190)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _262 = _254;
    float _264 = _262;
    if (_196)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _266 = _260;
    bool _268 = _78 == 288;
    int _270 = min(_242, 15);
    float _272 = _266;
    if (_196)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _274 = _264;
    bool _276 = _78 == 304;
    float _278 = float(_270);
    float _280 = _274;
    if (_212)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _282 = _272;
    int _284 = _270 << 4;
    int _286 = _284 + 4288;
    float _288 = _282;
    float _290 = as_type<float>(_286);
    if (_212)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _292 = _280;
    float _294 = _292;
    if (_222)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _288;
    float _298 = -_278;
    float _300 = _298 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _302 = _78 == 320;
    int _304 = _286 + 8;
    uint _307 = uint(int(uint(_304) >> uint(2)));
    uint _309 = uint(int(uint(int(_307)) >> uint(2)));
    int _311 = int(_307) & 3;
    float _313 = (*spvDescriptorSet0.vp_c14)._m0[int(_309)][_311];
    int _315 = int(_307) + 1;
    uint _317 = uint(int(uint(_315) >> uint(2)));
    int _319 = _315 & 3;
    float _321 = (*spvDescriptorSet0.vp_c14)._m0[int(_317)][_319];
    float _323 = _296;
    if (_222)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _325 = _294;
    float _327 = _300 + 1.0;
    float _329 = _325;
    if (_234)
    {
        _323 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _331 = _323;
    bool _333 = _78 == 336;
    float _335 = _331;
    if (_234)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _337 = _329;
    float _339 = exp2(_327);
    float _341 = _337;
    if (_248)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _343 = _335;
    bool _345 = _78 == 352;
    float _347 = _343;
    if (_248)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _349 = _341;
    float _351 = _349;
    if (_258)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _353 = _347;
    bool _355 = _78 == 368;
    float _357 = _353;
    if (_258)
    {
        _351 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _359 = _351;
    float _361 = _359;
    if (_268)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _363 = _357;
    bool _365 = _78 == 384;
    float _367 = 1.0 / _339;
    float _369 = _363;
    float _371 = _339;
    if (_268)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _373 = _361;
    float _375 = _373;
    if (_276)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _377 = _369;
    bool _379 = _78 == 400;
    float _381 = _377;
    if (_276)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _383 = _375;
    bool _385 = _78 == 416;
    float _387 = _383;
    if (_302)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _389 = _381;
    float _391 = _389;
    if (_302)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _393 = _387;
    float _395 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _397 = _391;
    bool _399 = _78 == 432;
    float _401 = _397;
    if (_333)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _403 = _395;
    float _405 = _403;
    if (_345)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _407 = _401;
    bool _409 = _78 == 448;
    float _411 = _407;
    if (_345)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _413 = _405;
    float _415 = _413;
    if (_355)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _417 = _411;
    bool _419 = _78 == 464;
    float _421 = _417;
    if (_355)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _423 = _415;
    float _425 = _423;
    if (_365)
    {
        _421 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _427 = _421;
    bool _429 = _78 == 480;
    float _431 = _427;
    if (_365)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _433 = _425;
    float _435 = _433;
    if (_379)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _437 = _431;
    bool _439 = _78 == 496;
    float _441 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _443 = _435;
    float _445 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _447 = _441;
    bool _449 = _78 == 512;
    float _451 = _447;
    if (_385)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _453 = _445;
    bool _455 = _78 == 528;
    float _457 = _453;
    if (_399)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _459 = _451;
    float _461 = _459;
    if (_399)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _463 = _457;
    float _465 = _463;
    if (_409)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _467 = _461;
    bool _469 = _78 == 544;
    float _471 = _467;
    if (_409)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _473 = _465;
    float _475 = _473;
    if (_419)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _477 = _471;
    bool _479 = _78 == 560;
    float _481 = _477;
    if (_419)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _483 = _475;
    float _485 = _483;
    if (_429)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _487 = _481;
    bool _489 = _78 == 576;
    float _491 = _487;
    if (_429)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _493 = _485;
    float _495 = _493;
    if (_439)
    {
        _491 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _497 = _491;
    bool _499 = _78 == 592;
    float _501 = _497;
    if (_439)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _503 = _495;
    float _505 = _503;
    if (_449)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _507 = _501;
    bool _509 = _78 == 608;
    float _511 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _513 = _505;
    float _515 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _517 = _511;
    bool _519 = _78 == 624;
    float _521 = _517;
    if (_455)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _523 = _515;
    bool _525 = _78 == 640;
    float _527 = _523;
    if (_469)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _529 = _521;
    float _531 = _529;
    if (_469)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _533 = _527;
    float _535 = _533;
    if (_479)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _537 = _531;
    bool _539 = _78 == 656;
    float _541 = _537;
    if (_479)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _543 = _535;
    float _545 = _543;
    if (_489)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _547 = _541;
    bool _549 = _78 == 672;
    float _551 = _547;
    if (_489)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _553 = _545;
    float _555 = _553;
    if (_499)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _557 = _551;
    bool _559 = _78 == 688;
    float _561 = _557;
    if (_499)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _563 = _555;
    float _565 = _563;
    if (_509)
    {
        _561 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _567 = _561;
    bool _569 = _78 == 704;
    float _571 = _567;
    if (_509)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _573 = _565;
    float _575 = _573;
    if (_519)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _577 = _571;
    bool _579 = _78 == 720;
    float _581 = _577;
    if (_519)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _583 = _575;
    float _585 = _583;
    if (_525)
    {
        _581 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _587 = _581;
    bool _589 = _78 == 736;
    float _591 = _587;
    if (_525)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _593 = _585;
    bool _595 = _78 == 752;
    float _597 = _593;
    if (_539)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _599 = _591;
    float _601 = _599;
    if (_549)
    {
        _601 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _603 = _601;
    float _605 = _603;
    if (_559)
    {
        _605 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _607 = _605;
    float _609 = _607;
    if (_569)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _611 = _609;
    float _613 = _611;
    if (_579)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _615 = _613;
    float _617 = _615;
    if (_589)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _619 = _617;
    float _621 = _619;
    if (_595)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _623 = _621;
    float _625 = _367 * _623;
    if (_539)
    {
        _597 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _627 = _597;
    float _629 = _627;
    if (_549)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _631 = _629;
    float _633 = _625 * _67;
    float _635 = _631;
    if (_559)
    {
        _635 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _637 = _635;
    float _639 = _637;
    if (_569)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _641 = _639;
    float _643 = floor(_633);
    float _645 = _641;
    if (_579)
    {
        _645 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _647 = _645;
    float _649 = _647;
    if (_589)
    {
        _649 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _651 = _649;
    float _653 = _651;
    if (_595)
    {
        _653 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _655 = _653;
    float _657 = -_643;
    float _659 = _633 + _657;
    float _661 = _339 * _655;
    float _663 = _659;
    if (!_106)
    {
        _371 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _665 = _371;
    float _667 = _659 * 2.0;
    float _669 = -_659;
    float _671 = fma(_661, _669, _67);
    float _673 = floor(_667);
    float _675 = _661 * _673;
    float _677 = _675 * 0.5;
    float _679 = _677 + _671;
    float _681 = fma(_73, _679, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _683 = fma(_679, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _685 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _687 = _681 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _691 = _683 + _689;
    float _693 = _687 * _687;
    float _695 = fma(_691, _691, _693);
    float _697 = fma(_136, _136, _695);
    float _699 = sqrt(_697);
    float _701 = -_321;
    float _703 = fma(_699, _313, _701);
    float _705 = precise::clamp(_703, 0.0, 1.0);
    float _707 = -_677;
    float _709 = fma(_707, _705, _679);
    float _711 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _713 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _715 = _697;
    float _717 = _665;
    float _719 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_106)
    {
        float _721 = fma(_711, _665, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _140 = _721;
    }
    float _723 = _140;
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _727 = _723;
    if (!_106)
    {
        float _729 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _727 = _729;
    }
    float _731 = _727;
    if (!_106)
    {
        float _733 = fma(_725, _665, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _128 = _733;
    }
    float _735 = _128;
    float _737 = _735;
    if (!_106)
    {
        float _739 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _735);
        _715 = _739;
    }
    float _741 = _715;
    if (!_106)
    {
        float2 _2538 = float2(_741, _731);
        float _743 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2538, float2(0.0), isnan(_2538)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2538, float2(0.0), isnan(_2538)), level(0.0)).x;
        _737 = _743;
    }
    float _745 = _737;
    if (_106)
    {
        _290 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _747 = _290;
    float _749 = _747;
    if (_106)
    {
        _663 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _751 = _663;
    if (_106)
    {
        float _753 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _747, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _717 = _753;
    }
    float _755 = _717;
    float _757 = _755;
    if (_106)
    {
        float _759 = fma(_713, _747, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _749 = _759;
    }
    float _761 = _749;
    float _763 = _761;
    if (_106)
    {
        float _765 = fma(_755, _751, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _757 = _765;
    }
    float _767 = _757;
    float _769 = _767;
    if (_106)
    {
        float _771 = fma(_761, _751, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _763 = _771;
    }
    float _773 = _763;
    float _775 = _773;
    if (_106)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _767);
        _769 = _777;
    }
    float _779 = _769;
    float _781 = _779;
    if (_106)
    {
        float _783 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _773);
        _775 = _783;
    }
    float _785 = _775;
    float _787 = _745;
    float _789 = _785;
    if (_106)
    {
        float2 _2633 = float2(_785, _779);
        float _791 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2633, float2(0.0), isnan(_2633)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2633, float2(0.0), isnan(_2633)), level(0.0)).x;
        _787 = _791;
    }
    float _793 = _787;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _801 = _713 + _799;
    float _803 = _797 * _797;
    float _805 = fma(_801, _801, _803);
    float _807 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _809 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _811 = sqrt(_805);
    float _813 = fma(_711, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _815 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _817 = _811 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _819 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_817)
    {
        _781 = _713;
    }
    float _821 = _781;
    float _823 = fma(_793, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _825 = _821;
    if (!_817)
    {
        _819 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _827 = _819;
    float _829 = _823 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _831 = _827;
    if (!_817)
    {
        _789 = _823;
    }
    float _833 = _789;
    float _835 = fma(_713, (*spvDescriptorSet0.vp_c4)._m0[2].x, _829);
    float _837 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _835);
    float _839 = _837 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _841 = _833;
    if (!_817)
    {
        _719 = _839;
    }
    float _843 = _719;
    bool _845 = !_817;
    float _847 = _843;
    if (!_845)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _853 = _811 + _851;
        float _855 = _823 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _857 = _853 * _849;
        float _859 = rsqrt(_805);
        float _861 = _857 * 0.15915493667125701904296875;
        float _863 = _861 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _861 * 6.283185482025146484375;
        float _869 = sin(_867);
        float _871 = _865 + (-1.0);
        float _873 = fma(_869, _855, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _877 = _859 * _873;
        float _879 = fma(_823, _865, _875);
        float _881 = fma(_801, _877, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _883 = _879 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _885 = fma(_797, _877, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _887 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[2].x, _883);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        float _891 = _889 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _841 = _879;
        _825 = _881;
        _831 = _885;
        _847 = _891;
    }
    float _893 = _841;
    float _895 = _825;
    float _897 = _831;
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
        _955 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _957 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _959 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _979 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _981 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _983 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _985 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _987 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _989 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1019 = true;
    }
    else
    {
        float _1021 = fma(_713, 6.2500002968590706586837768554688e-05, 0.5);
        float _1023 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3057 = float3(_1021, _1023, float(0));
        float3 _3061 = select(_3057, float3(0.0), isnan(_3057));
        float4 _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3061.xy, uint(rint(_3061.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3061.xy, uint(rint(_3061.z)), level(0.0)).xyzw;
        float _1028 = _1026.x;
        float _1030 = _1026.y;
        float _1032 = _1026.z;
        float _1034 = _1026.w;
        float3 _3076 = float3(_1021, _1023, float(1));
        float3 _3078 = select(_3076, float3(0.0), isnan(_3076));
        float4 _1036 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3078.xy, uint(rint(_3078.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3078.xy, uint(rint(_3078.z)), level(0.0)).xyzw;
        float _1038 = _1036.x;
        float _1040 = _1036.y;
        float _1042 = _1036.z;
        float _1044 = _1036.w;
        float3 _3093 = float3(_1021, _1023, float(2));
        float3 _3095 = select(_3093, float3(0.0), isnan(_3093));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3095.xy, uint(rint(_3095.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3095.xy, uint(rint(_3095.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3110 = float3(_1021, _1023, float(3));
        float3 _3112 = select(_3110, float3(0.0), isnan(_3110));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3112.xy, uint(rint(_3112.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3112.xy, uint(rint(_3112.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3127 = float3(_1021, _1023, float(4));
        float3 _3129 = select(_3127, float3(0.0), isnan(_3127));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3129.xy, uint(rint(_3129.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3129.xy, uint(rint(_3129.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3144 = float3(_1021, _1023, float(5));
        float3 _3146 = select(_3144, float3(0.0), isnan(_3144));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3146.xy, uint(rint(_3146.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3146.xy, uint(rint(_3146.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3161 = float3(_1021, _1023, float(6));
        float3 _3163 = select(_3161, float3(0.0), isnan(_3161));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3163.xy, uint(rint(_3163.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3163.xy, uint(rint(_3163.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3178 = float3(_1021, _1023, float(7));
        float3 _3180 = select(_3178, float3(0.0), isnan(_3178));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3180.xy, uint(rint(_3180.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3180.xy, uint(rint(_3180.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        _955 = _1060;
        _957 = _1058;
        _959 = _1062;
        _961 = as_type<int>(_1068);
        _963 = as_type<int>(_1064);
        _965 = as_type<int>(_1070);
        _967 = as_type<int>(_1074);
        _969 = as_type<int>(_1072);
        _971 = as_type<int>(_1078);
        _973 = as_type<int>(_1082);
        _975 = as_type<int>(_1080);
        _977 = as_type<int>(_1084);
        _979 = _1090;
        _981 = _1100;
        _983 = _1038;
        _985 = _1034;
        _987 = _1088;
        _989 = _1098;
        _991 = _1040;
        _993 = _1030;
        _995 = _1092;
        _997 = _1102;
        _999 = _1028;
        _1001 = _1032;
        _1003 = _1094;
        _1005 = _1104;
        _1007 = _1044;
        _1009 = _1042;
        _1011 = _1048;
        _1013 = _1052;
        _1015 = _1050;
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
    float _1172 = _823 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1176 = _713 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1178;
    out.m_45.x = _713;
    out.m_45.y = _823;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1182 = _1172 * _1172;
    float _1184 = _1106 * 0.88622701168060302734375;
    float _1186 = _1108 * 0.88622701168060302734375;
    float _1188 = _1110 * 0.88622701168060302734375;
    float _1190 = fma(_1176, _1176, _1182);
    float _1192 = _915 ? as_type<float>(_1112) : 0.0;
    out.gl_Position.x = _947;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    float _1194 = _915 ? _1184 : 0.0;
    float _1196 = fma(_1180, _1180, _1190);
    float _1198 = _915 ? as_type<float>(_1114) : 0.0;
    out.m_47.z = _815;
    out.m_47.w = _813;
    float _1200 = _915 ? _1186 : 0.0;
    float _1202 = _915 ? as_type<float>(_1116) : 0.0;
    float _1204 = rsqrt(_1196);
    float _1206 = _915 ? _1188 : 0.0;
    out.m_49.x = _809;
    out.m_49.y = _807;
    float _1208 = _915 ? as_type<float>(_1118) : 0.0;
    float _1210 = _915 ? as_type<float>(_1120) : 0.0;
    float _1212 = -_839;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1216 = _1212 + _1214;
    float _1218 = _915 ? as_type<float>(_1122) : 0.0;
    out.m_51.w = _839;
    float _1220 = _915 ? as_type<float>(_1124) : 0.0;
    float _1222 = _915 ? as_type<float>(_1126) : 0.0;
    float _1224 = _915 ? as_type<float>(_1128) : 0.0;
    float _1226 = _1204 * 1.02332699298858642578125;
    float _1228 = _1180 * _1204;
    float _1230 = _1172 * _1226;
    float _1232 = _1228 * (-1.02332699298858642578125);
    float _1234 = _1176 * _1226;
    float _1236 = _1230 * _1130;
    float _1238 = _1230 * _1132;
    float _1240 = _1230 * _1134;
    float _1242 = _1230 * _1136;
    float _1244 = fma(_1138, 0.88622701168060302734375, _1236);
    float _1246 = fma(_1140, 0.88622701168060302734375, _1238);
    float _1248 = _1230 * _1142;
    float _1250 = fma(_1144, 0.88622701168060302734375, _1240);
    float _1252 = fma(_1232, _1146, _1244);
    float _1254 = fma(_1232, _1148, _1246);
    float _1256 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1258 = fma(_1152, 0.88622701168060302734375, _1248);
    float _1260 = fma(_1234, _1154, _1252);
    float _1262 = fma(_1234, _1156, _1254);
    float _1264 = fma(_1192, _1230, _1194);
    float _1266 = fma(_1232, _1158, _1250);
    float _1268 = fma(_1198, _1230, _1200);
    float _1270 = precise::max(0.0, _1260);
    float _1272 = fma(_1232, _1160, _1256);
    float _1274 = precise::max(0.0, _1262);
    float _1276 = fma(_1202, _1230, _1206);
    float _1278 = fma(_1232, _1162, _1258);
    float _1280 = _1270 * 0.31830990314483642578125;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = fma(_1208, _1232, _1264);
    float _1286 = _1274 * 0.31830990314483642578125;
    float _1288 = precise::clamp(_1286, 0.0, 1.0);
    float _1290 = fma(_1234, _1164, _1266);
    float _1292 = fma(_1210, _1232, _1268);
    float _1294 = fma(_1234, _1166, _1272);
    float _1296 = fma(_1218, _1232, _1276);
    float _1298 = fma(_1234, _1168, _1278);
    float _1300 = _1282 * 0.88622701168060302734375;
    float _1302 = -_1288;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1220, _1234, _1284);
    float _1308 = fma(_1222, _1234, _1292);
    float _1310 = precise::max(0.0, _1290);
    float _1312 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1314 = precise::max(0.0, _1294);
    float _1316 = fma(_1224, _1234, _1296);
    float _1318 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1288);
    float _1320 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1322 = precise::max(0.0, _1298);
    float _1324 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1326 = precise::max(0.0, _1306);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1312);
    float _1330 = precise::max(0.0, _1308);
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1334 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1320);
    float _1336 = precise::max(0.0, _1316);
    float _1338 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1324);
    float _1340 = fma(_1326, _1332, _1328);
    float _1342 = fma(_1330, _1332, _1334);
    float _1344 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1346 = fma(_1336, _1332, _1338);
    out.m_53.w = _1344;
    out.m_51.x = _1342;
    out.m_51.y = _1340;
    out.m_51.z = _1346;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

