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
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _78 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _76;
    int _80 = _74 << 4;
    bool _84 = _80 == 0;
    bool _86 = _80 == 16;
    bool _88 = _80 == 32;
    bool _90 = _80 == 48;
    bool _92 = _80 == 64;
    float _94 = fma(_71, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _96 = _80 == 80;
    bool _98 = _65 >= 0.5;
    bool _100 = isnan(_65);
    bool _102 = _98 || _100;
    bool _104 = isnan(0.5);
    bool _106 = _102 || _104;
    float _108 = as_type<float>(gl_BaseInstance);
    float _110 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_84)
    {
        _108 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _112 = _108;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _116 = _94 + _114;
    float _118 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _120 = _80 == 96;
    float _122 = _116 * _116;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = 0.0;
    float _130 = _112;
    if (_84)
    {
        _128 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _132 = _128;
    float _134 = fma(_78, _78, _122);
    float _136 = _132;
    if (_86)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _138 = _130;
    bool _140 = _80 == 112;
    float _142 = fma(_126, _126, _134);
    float _144 = _138;
    if (_86)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_88)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    float _152 = rsqrt(_142);
    bool _154 = _80 == 128;
    float _156 = _150;
    if (_88)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = _158;
    if (_90)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _156;
    bool _164 = _80 == 144;
    float _166 = _162;
    if (_90)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_92)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _80 == 160;
    float _176 = _172;
    if (_92)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _152 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _182 = _178;
    if (_96)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _176;
    bool _186 = _80 == 176;
    float _188 = _184;
    if (_96)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _182;
    float _192 = log2(_180);
    bool _194 = _80 == 192;
    float _196 = _190;
    if (_120)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _188;
    float _200 = _198;
    if (_120)
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
    bool _208 = _80 == 208;
    float _210 = _206;
    if (_140)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _80 == 224;
    float _220 = _192 + 1.2999999523162841796875;
    float _222 = _216;
    if (_154)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _214;
    float _226 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _222;
    bool _230 = _80 == 240;
    float _232 = trunc(_220);
    int _234 = int(_232);
    float _236 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _238 = _226;
    float _240 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _242 = _236;
    bool _244 = _80 == 256;
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
    bool _254 = _80 == 272;
    float _256 = _252;
    if (_186)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_194)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    int _264 = min(_234, 15);
    bool _266 = _80 == 288;
    float _268 = _262;
    if (_194)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _260;
    float _272 = float(_264);
    bool _274 = _80 == 304;
    int _276 = _264 << 4;
    int _278 = _276 + 4288;
    float _280 = _270;
    float _282 = as_type<float>(_278);
    if (_208)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _284 = _268;
    float _286 = _284;
    if (_208)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _280;
    float _290 = -_272;
    float _292 = _290 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _294 = _288;
    if (_218)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _286;
    int _298 = _278 + 8;
    uint _301 = uint(int(uint(_298) >> uint(2)));
    uint _303 = uint(int(uint(int(_301)) >> uint(2)));
    int _305 = int(_301) & 3;
    float _307 = (*spvDescriptorSet0.vp_c14)._m0[int(_303)][_305];
    int _309 = int(_301) + 1;
    uint _311 = uint(int(uint(_309) >> uint(2)));
    int _313 = _309 & 3;
    float _315 = (*spvDescriptorSet0.vp_c14)._m0[int(_311)][_313];
    bool _317 = _80 == 320;
    float _319 = _292 + 1.0;
    float _321 = _296;
    if (_218)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _323 = _294;
    float _325 = _323;
    if (_230)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _327 = _321;
    bool _329 = _80 == 336;
    float _331 = exp2(_319);
    float _333 = _327;
    if (_230)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _335 = _325;
    float _337 = _335;
    if (_244)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _339 = _333;
    bool _341 = _80 == 352;
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
    bool _351 = _80 == 368;
    float _353 = _349;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _355 = _347;
    float _357 = _355;
    if (_266)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _359 = _353;
    float _361 = 1.0 / _331;
    bool _363 = _80 == 384;
    float _365 = _359;
    if (_266)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _367 = _357;
    float _369 = _367;
    if (_274)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _371 = _365;
    bool _373 = _80 == 400;
    float _375 = _371;
    if (_274)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _377 = _369;
    bool _379 = _80 == 416;
    float _381 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _383 = _375;
    float _385 = _383;
    if (_317)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _387 = _381;
    float _389 = _387;
    if (_329)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _391 = _385;
    bool _393 = _80 == 432;
    float _395 = _391;
    if (_329)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_341)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _401 = _395;
    bool _403 = _80 == 448;
    float _405 = _401;
    if (_341)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_351)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _411 = _405;
    bool _413 = _80 == 464;
    float _415 = _411;
    if (_351)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _417 = _409;
    float _419 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _421 = _415;
    bool _423 = _80 == 480;
    float _425 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _427 = _419;
    float _429 = _427;
    if (_373)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _431 = _425;
    bool _433 = _80 == 496;
    float _435 = _431;
    if (_373)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _437 = _429;
    float _439 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _441 = _435;
    bool _443 = _80 == 512;
    float _445 = _441;
    if (_379)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _447 = _439;
    bool _449 = _80 == 528;
    float _451 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _453 = _445;
    float _455 = _453;
    if (_393)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _457 = _451;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _461 = _455;
    bool _463 = _80 == 544;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _471 = _465;
    bool _473 = _80 == 560;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_423)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _481 = _475;
    bool _483 = _80 == 576;
    float _485 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _487 = _479;
    float _489 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _491 = _485;
    bool _493 = _80 == 592;
    float _495 = _491;
    if (_433)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _497 = _489;
    float _499 = _497;
    if (_443)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _501 = _495;
    bool _503 = _80 == 608;
    float _505 = _501;
    if (_443)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _507 = _499;
    float _509 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _511 = _505;
    bool _513 = _80 == 624;
    float _515 = _511;
    if (_449)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _517 = _509;
    bool _519 = _80 == 640;
    float _521 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _523 = _515;
    float _525 = _523;
    if (_463)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _527 = _521;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _531 = _525;
    bool _533 = _80 == 656;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _541 = _535;
    bool _543 = _80 == 672;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_493)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _551 = _545;
    bool _553 = _80 == 688;
    float _555 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _557 = _549;
    float _559 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _561 = _555;
    bool _563 = _80 == 704;
    float _565 = _561;
    if (_503)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _567 = _559;
    float _569 = _567;
    if (_513)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _571 = _565;
    bool _573 = _80 == 720;
    float _575 = _571;
    if (_513)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _577 = _569;
    float _579 = _577;
    if (_519)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _581 = _575;
    bool _583 = _80 == 736;
    float _585 = _581;
    if (_519)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _587 = _579;
    bool _589 = _80 == 752;
    float _591 = _587;
    if (_533)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _593 = _585;
    float _595 = _593;
    if (_543)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_553)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_563)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_573)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _609 = _607;
    float _611 = _609;
    if (_583)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _613 = _611;
    float _615 = _613;
    if (_589)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _617 = _615;
    float _619 = _361 * _617;
    if (_533)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _621 = _591;
    float _623 = _621;
    if (_543)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _625 = _623;
    float _627 = _619 * _67;
    float _629 = _625;
    if (_553)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _631 = _629;
    float _633 = _631;
    if (_563)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _635 = _633;
    float _637 = floor(_627);
    float _639 = _635;
    if (_573)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _641 = _639;
    float _643 = _641;
    if (_583)
    {
        _643 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _645 = _643;
    float _647 = _645;
    if (_589)
    {
        _647 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _649 = _647;
    float _651 = _331 * _649;
    float _653 = -_637;
    float _655 = _627 + _653;
    float _657 = _655 * 2.0;
    float _659 = -_655;
    float _661 = fma(_651, _659, _67);
    float _663 = floor(_657);
    float _665 = _651 * _663;
    float _667 = _665 * 0.5;
    float _669 = _667 + _661;
    float _671 = fma(_71, _669, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _673 = fma(_669, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _671 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _681 = _673 + _679;
    float _683 = _677 * _677;
    float _685 = fma(_78, _78, _683);
    float _687 = _683;
    float _689 = _669;
    if (!_106)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _691 = _687;
    float _693 = fma(_681, _681, _685);
    float _695 = sqrt(_693);
    float _697 = -_315;
    float _699 = fma(_695, _307, _697);
    float _701 = precise::clamp(_699, 0.0, 1.0);
    float _703 = -_667;
    float _705 = fma(_703, _701, _669);
    float _707 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _709 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _705;
    float _713 = _693;
    float _715 = _691;
    if (!_106)
    {
        float _717 = fma(_707, _691, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _717;
    }
    float _719 = _711;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _723 = _719;
    if (!_106)
    {
        float _725 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _723 = _725;
    }
    float _727 = _723;
    if (!_106)
    {
        float _729 = fma(_721, _691, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _713 = _729;
    }
    float _731 = _713;
    float _733 = _731;
    if (!_106)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
        _733 = _735;
    }
    float _737 = _733;
    if (!_106)
    {
        float2 _2522 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2522, float2(0.0), isnan(_2522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2522, float2(0.0), isnan(_2522)), level(0.0)).x;
        _110 = _739;
    }
    float _741 = _110;
    if (_106)
    {
        _282 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _282;
    float _745 = _743;
    if (_106)
    {
        _689 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _689;
    float _749 = _747;
    if (_106)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _751;
    }
    float _753 = _715;
    float _755 = _753;
    if (_106)
    {
        float _757 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_106)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_106)
    {
        float _769 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_106)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_106)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _741;
    if (_106)
    {
        float2 _2616 = float2(_777, _781);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2616, float2(0.0), isnan(_2616)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2616, float2(0.0), isnan(_2616)), level(0.0)).x;
        _783 = _785;
    }
    float _787 = _783;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = _709 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    float _803 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _805 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _807 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _811 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_807)
    {
        _809 = _709;
    }
    float _813 = _809;
    float _815 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _817 = _813;
    if (!_807)
    {
        _811 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _819 = _811;
    float _821 = _815 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _823 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _821);
    float _825 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _823);
    float _827 = _825 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _829 = _825;
    float _831 = _819;
    if (!_807)
    {
        _829 = _815;
    }
    float _833 = _829;
    float _835 = _833;
    if (!_807)
    {
        _749 = _827;
    }
    float _837 = _749;
    bool _839 = !_807;
    float _841 = _837;
    if (!_839)
    {
        float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _847 = _801 + _845;
        float _849 = _815 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = rsqrt(_799);
        float _853 = _847 * _843;
        float _855 = _853 * 0.15915493667125701904296875;
        float _857 = _855 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 + (-1.0);
        float _867 = _865 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _869 = fma(_863, _849, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _871 = _851 * _869;
        float _873 = fma(_815, _859, _867);
        float _875 = fma(_795, _871, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _877 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _879 = fma(_791, _871, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _881 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _877);
        float _883 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[2].z, _881);
        float _885 = _883 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _835 = _873;
        _831 = _875;
        _817 = _879;
        _841 = _885;
    }
    float _887 = _835;
    float _889 = _831;
    float _891 = _817;
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
        float _1017 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _3031 = float3(_1017, _1015, float(0));
        float3 _3035 = select(_3031, float3(0.0), isnan(_3031));
        float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3035.xy, uint(rint(_3035.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3035.xy, uint(rint(_3035.z)), level(0.0)).xyzw;
        float _1022 = _1020.x;
        float _1024 = _1020.y;
        float _1026 = _1020.z;
        float _1028 = _1020.w;
        float3 _3050 = float3(_1017, _1015, float(1));
        float3 _3052 = select(_3050, float3(0.0), isnan(_3050));
        float4 _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3052.xy, uint(rint(_3052.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3052.xy, uint(rint(_3052.z)), level(0.0)).xyzw;
        float _1032 = _1030.x;
        float _1034 = _1030.y;
        float _1036 = _1030.z;
        float _1038 = _1030.w;
        float3 _3067 = float3(_1017, _1015, float(2));
        float3 _3069 = select(_3067, float3(0.0), isnan(_3067));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3069.xy, uint(rint(_3069.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3069.xy, uint(rint(_3069.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3084 = float3(_1017, _1015, float(3));
        float3 _3086 = select(_3084, float3(0.0), isnan(_3084));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3086.xy, uint(rint(_3086.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3086.xy, uint(rint(_3086.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3101 = float3(_1017, _1015, float(4));
        float3 _3103 = select(_3101, float3(0.0), isnan(_3101));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3103.xy, uint(rint(_3103.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3103.xy, uint(rint(_3103.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3118 = float3(_1017, _1015, float(5));
        float3 _3120 = select(_3118, float3(0.0), isnan(_3118));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3120.xy, uint(rint(_3120.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3120.xy, uint(rint(_3120.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3135 = float3(_1017, _1015, float(6));
        float3 _3137 = select(_3135, float3(0.0), isnan(_3135));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3137.xy, uint(rint(_3137.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3137.xy, uint(rint(_3137.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3152 = float3(_1017, _1015, float(7));
        float3 _3154 = select(_3152, float3(0.0), isnan(_3152));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3154.xy, uint(rint(_3154.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3154.xy, uint(rint(_3154.z)), level(0.0)).xyzw;
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
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1174 = _709 + _1172;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _815;
    out.m_45.z = _709;
    float _1188 = _909 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1174, _1174, _1184);
    float _1192 = _909 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _803;
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
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _78 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _76;
    int _80 = _74 << 4;
    bool _84 = _80 == 0;
    bool _86 = _80 == 16;
    bool _88 = _80 == 32;
    bool _90 = _80 == 48;
    bool _92 = _80 == 64;
    float _94 = fma(_71, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _96 = _80 == 80;
    bool _98 = _65 >= 0.5;
    bool _100 = isnan(_65);
    bool _102 = _98 || _100;
    bool _104 = isnan(0.5);
    bool _106 = _102 || _104;
    float _108 = as_type<float>(gl_BaseInstance);
    float _110 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_84)
    {
        _108 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _112 = _108;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _116 = _94 + _114;
    float _118 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _120 = _80 == 96;
    float _122 = _116 * _116;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = 0.0;
    float _130 = _112;
    if (_84)
    {
        _128 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _132 = _128;
    float _134 = fma(_78, _78, _122);
    float _136 = _132;
    if (_86)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _138 = _130;
    bool _140 = _80 == 112;
    float _142 = fma(_126, _126, _134);
    float _144 = _138;
    if (_86)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_88)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    float _152 = rsqrt(_142);
    bool _154 = _80 == 128;
    float _156 = _150;
    if (_88)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = _158;
    if (_90)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _156;
    bool _164 = _80 == 144;
    float _166 = _162;
    if (_90)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_92)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _80 == 160;
    float _176 = _172;
    if (_92)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _152 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _182 = _178;
    if (_96)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _176;
    bool _186 = _80 == 176;
    float _188 = _184;
    if (_96)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _182;
    float _192 = log2(_180);
    bool _194 = _80 == 192;
    float _196 = _190;
    if (_120)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _188;
    float _200 = _198;
    if (_120)
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
    bool _208 = _80 == 208;
    float _210 = _206;
    if (_140)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _80 == 224;
    float _220 = _192 + 1.2999999523162841796875;
    float _222 = _216;
    if (_154)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _214;
    float _226 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _222;
    bool _230 = _80 == 240;
    float _232 = trunc(_220);
    int _234 = int(_232);
    float _236 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _238 = _226;
    float _240 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _242 = _236;
    bool _244 = _80 == 256;
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
    bool _254 = _80 == 272;
    float _256 = _252;
    if (_186)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_194)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    int _264 = min(_234, 15);
    bool _266 = _80 == 288;
    float _268 = _262;
    if (_194)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _260;
    float _272 = float(_264);
    bool _274 = _80 == 304;
    int _276 = _264 << 4;
    int _278 = _276 + 4288;
    float _280 = _270;
    float _282 = as_type<float>(_278);
    if (_208)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _284 = _268;
    float _286 = _284;
    if (_208)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _280;
    float _290 = -_272;
    float _292 = _290 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _294 = _288;
    if (_218)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _286;
    int _298 = _278 + 8;
    uint _301 = uint(int(uint(_298) >> uint(2)));
    uint _303 = uint(int(uint(int(_301)) >> uint(2)));
    int _305 = int(_301) & 3;
    float _307 = (*spvDescriptorSet0.vp_c14)._m0[int(_303)][_305];
    int _309 = int(_301) + 1;
    uint _311 = uint(int(uint(_309) >> uint(2)));
    int _313 = _309 & 3;
    float _315 = (*spvDescriptorSet0.vp_c14)._m0[int(_311)][_313];
    bool _317 = _80 == 320;
    float _319 = _292 + 1.0;
    float _321 = _296;
    if (_218)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _323 = _294;
    float _325 = _323;
    if (_230)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _327 = _321;
    bool _329 = _80 == 336;
    float _331 = exp2(_319);
    float _333 = _327;
    if (_230)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _335 = _325;
    float _337 = _335;
    if (_244)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _339 = _333;
    bool _341 = _80 == 352;
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
    bool _351 = _80 == 368;
    float _353 = _349;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _355 = _347;
    float _357 = _355;
    if (_266)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _359 = _353;
    float _361 = 1.0 / _331;
    bool _363 = _80 == 384;
    float _365 = _359;
    if (_266)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _367 = _357;
    float _369 = _367;
    if (_274)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _371 = _365;
    bool _373 = _80 == 400;
    float _375 = _371;
    if (_274)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _377 = _369;
    bool _379 = _80 == 416;
    float _381 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _383 = _375;
    float _385 = _383;
    if (_317)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _387 = _381;
    float _389 = _387;
    if (_329)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _391 = _385;
    bool _393 = _80 == 432;
    float _395 = _391;
    if (_329)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_341)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _401 = _395;
    bool _403 = _80 == 448;
    float _405 = _401;
    if (_341)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_351)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _411 = _405;
    bool _413 = _80 == 464;
    float _415 = _411;
    if (_351)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _417 = _409;
    float _419 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _421 = _415;
    bool _423 = _80 == 480;
    float _425 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _427 = _419;
    float _429 = _427;
    if (_373)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _431 = _425;
    bool _433 = _80 == 496;
    float _435 = _431;
    if (_373)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _437 = _429;
    float _439 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _441 = _435;
    bool _443 = _80 == 512;
    float _445 = _441;
    if (_379)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _447 = _439;
    bool _449 = _80 == 528;
    float _451 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _453 = _445;
    float _455 = _453;
    if (_393)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _457 = _451;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _461 = _455;
    bool _463 = _80 == 544;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _471 = _465;
    bool _473 = _80 == 560;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_423)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _481 = _475;
    bool _483 = _80 == 576;
    float _485 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _487 = _479;
    float _489 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _491 = _485;
    bool _493 = _80 == 592;
    float _495 = _491;
    if (_433)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _497 = _489;
    float _499 = _497;
    if (_443)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _501 = _495;
    bool _503 = _80 == 608;
    float _505 = _501;
    if (_443)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _507 = _499;
    float _509 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _511 = _505;
    bool _513 = _80 == 624;
    float _515 = _511;
    if (_449)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _517 = _509;
    bool _519 = _80 == 640;
    float _521 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _523 = _515;
    float _525 = _523;
    if (_463)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _527 = _521;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _531 = _525;
    bool _533 = _80 == 656;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _541 = _535;
    bool _543 = _80 == 672;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_493)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _551 = _545;
    bool _553 = _80 == 688;
    float _555 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _557 = _549;
    float _559 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _561 = _555;
    bool _563 = _80 == 704;
    float _565 = _561;
    if (_503)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _567 = _559;
    float _569 = _567;
    if (_513)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _571 = _565;
    bool _573 = _80 == 720;
    float _575 = _571;
    if (_513)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _577 = _569;
    float _579 = _577;
    if (_519)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _581 = _575;
    bool _583 = _80 == 736;
    float _585 = _581;
    if (_519)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _587 = _579;
    bool _589 = _80 == 752;
    float _591 = _587;
    if (_533)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _593 = _585;
    float _595 = _593;
    if (_543)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_553)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_563)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_573)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _609 = _607;
    float _611 = _609;
    if (_583)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _613 = _611;
    float _615 = _613;
    if (_589)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _617 = _615;
    float _619 = _361 * _617;
    if (_533)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _621 = _591;
    float _623 = _621;
    if (_543)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _625 = _623;
    float _627 = _619 * _67;
    float _629 = _625;
    if (_553)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _631 = _629;
    float _633 = _631;
    if (_563)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _635 = _633;
    float _637 = floor(_627);
    float _639 = _635;
    if (_573)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _641 = _639;
    float _643 = _641;
    if (_583)
    {
        _643 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _645 = _643;
    float _647 = _645;
    if (_589)
    {
        _647 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _649 = _647;
    float _651 = _331 * _649;
    float _653 = -_637;
    float _655 = _627 + _653;
    float _657 = _655 * 2.0;
    float _659 = -_655;
    float _661 = fma(_651, _659, _67);
    float _663 = floor(_657);
    float _665 = _651 * _663;
    float _667 = _665 * 0.5;
    float _669 = _667 + _661;
    float _671 = fma(_71, _669, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _673 = fma(_669, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _671 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _681 = _673 + _679;
    float _683 = _677 * _677;
    float _685 = fma(_78, _78, _683);
    float _687 = _683;
    float _689 = _669;
    if (!_106)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _691 = _687;
    float _693 = fma(_681, _681, _685);
    float _695 = sqrt(_693);
    float _697 = -_315;
    float _699 = fma(_695, _307, _697);
    float _701 = precise::clamp(_699, 0.0, 1.0);
    float _703 = -_667;
    float _705 = fma(_703, _701, _669);
    float _707 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _709 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _705;
    float _713 = _693;
    float _715 = _691;
    if (!_106)
    {
        float _717 = fma(_707, _691, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _717;
    }
    float _719 = _711;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _723 = _719;
    if (!_106)
    {
        float _725 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _723 = _725;
    }
    float _727 = _723;
    if (!_106)
    {
        float _729 = fma(_721, _691, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _713 = _729;
    }
    float _731 = _713;
    float _733 = _731;
    if (!_106)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
        _733 = _735;
    }
    float _737 = _733;
    if (!_106)
    {
        float2 _2522 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2522, float2(0.0), isnan(_2522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2522, float2(0.0), isnan(_2522)), level(0.0)).x;
        _110 = _739;
    }
    float _741 = _110;
    if (_106)
    {
        _282 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _282;
    float _745 = _743;
    if (_106)
    {
        _689 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _689;
    float _749 = _747;
    if (_106)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _751;
    }
    float _753 = _715;
    float _755 = _753;
    if (_106)
    {
        float _757 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_106)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_106)
    {
        float _769 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_106)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_106)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _741;
    if (_106)
    {
        float2 _2616 = float2(_777, _781);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2616, float2(0.0), isnan(_2616)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2616, float2(0.0), isnan(_2616)), level(0.0)).x;
        _783 = _785;
    }
    float _787 = _783;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = _709 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    float _803 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _805 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _807 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _811 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_807)
    {
        _809 = _709;
    }
    float _813 = _809;
    float _815 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _817 = _813;
    if (!_807)
    {
        _811 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _819 = _811;
    float _821 = _815 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _823 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _821);
    float _825 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _823);
    float _827 = _825 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _829 = _825;
    float _831 = _819;
    if (!_807)
    {
        _829 = _815;
    }
    float _833 = _829;
    float _835 = _833;
    if (!_807)
    {
        _749 = _827;
    }
    float _837 = _749;
    bool _839 = !_807;
    float _841 = _837;
    if (!_839)
    {
        float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _847 = _801 + _845;
        float _849 = _815 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = rsqrt(_799);
        float _853 = _847 * _843;
        float _855 = _853 * 0.15915493667125701904296875;
        float _857 = _855 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 + (-1.0);
        float _867 = _865 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _869 = fma(_863, _849, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _871 = _851 * _869;
        float _873 = fma(_815, _859, _867);
        float _875 = fma(_795, _871, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _877 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _879 = fma(_791, _871, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _881 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _877);
        float _883 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[2].z, _881);
        float _885 = _883 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _835 = _873;
        _831 = _875;
        _817 = _879;
        _841 = _885;
    }
    float _887 = _835;
    float _889 = _831;
    float _891 = _817;
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
        float _1017 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _3031 = float3(_1017, _1015, float(0));
        float3 _3035 = select(_3031, float3(0.0), isnan(_3031));
        float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3035.xy, uint(rint(_3035.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3035.xy, uint(rint(_3035.z)), level(0.0)).xyzw;
        float _1022 = _1020.x;
        float _1024 = _1020.y;
        float _1026 = _1020.z;
        float _1028 = _1020.w;
        float3 _3050 = float3(_1017, _1015, float(1));
        float3 _3052 = select(_3050, float3(0.0), isnan(_3050));
        float4 _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3052.xy, uint(rint(_3052.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3052.xy, uint(rint(_3052.z)), level(0.0)).xyzw;
        float _1032 = _1030.x;
        float _1034 = _1030.y;
        float _1036 = _1030.z;
        float _1038 = _1030.w;
        float3 _3067 = float3(_1017, _1015, float(2));
        float3 _3069 = select(_3067, float3(0.0), isnan(_3067));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3069.xy, uint(rint(_3069.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3069.xy, uint(rint(_3069.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3084 = float3(_1017, _1015, float(3));
        float3 _3086 = select(_3084, float3(0.0), isnan(_3084));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3086.xy, uint(rint(_3086.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3086.xy, uint(rint(_3086.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3101 = float3(_1017, _1015, float(4));
        float3 _3103 = select(_3101, float3(0.0), isnan(_3101));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3103.xy, uint(rint(_3103.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3103.xy, uint(rint(_3103.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3118 = float3(_1017, _1015, float(5));
        float3 _3120 = select(_3118, float3(0.0), isnan(_3118));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3120.xy, uint(rint(_3120.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3120.xy, uint(rint(_3120.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3135 = float3(_1017, _1015, float(6));
        float3 _3137 = select(_3135, float3(0.0), isnan(_3135));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3137.xy, uint(rint(_3137.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3137.xy, uint(rint(_3137.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3152 = float3(_1017, _1015, float(7));
        float3 _3154 = select(_3152, float3(0.0), isnan(_3152));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3154.xy, uint(rint(_3154.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3154.xy, uint(rint(_3154.z)), level(0.0)).xyzw;
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
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1174 = _709 + _1172;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _815;
    out.m_45.z = _709;
    float _1188 = _909 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1174, _1174, _1184);
    float _1192 = _909 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _803;
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
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _78 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _76;
    int _80 = _74 << 4;
    bool _84 = _80 == 0;
    bool _86 = _80 == 16;
    bool _88 = _80 == 32;
    bool _90 = _80 == 48;
    bool _92 = _80 == 64;
    float _94 = fma(_71, _67, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _96 = _80 == 80;
    bool _98 = _65 >= 0.5;
    bool _100 = isnan(_65);
    bool _102 = _98 || _100;
    bool _104 = isnan(0.5);
    bool _106 = _102 || _104;
    float _108 = as_type<float>(gl_BaseInstance);
    float _110 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_84)
    {
        _108 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _112 = _108;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _116 = _94 + _114;
    float _118 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _120 = _80 == 96;
    float _122 = _116 * _116;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = 0.0;
    float _130 = _112;
    if (_84)
    {
        _128 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _132 = _128;
    float _134 = fma(_78, _78, _122);
    float _136 = _132;
    if (_86)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _138 = _130;
    bool _140 = _80 == 112;
    float _142 = fma(_126, _126, _134);
    float _144 = _138;
    if (_86)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _136;
    float _148 = _146;
    if (_88)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    float _152 = rsqrt(_142);
    bool _154 = _80 == 128;
    float _156 = _150;
    if (_88)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = _158;
    if (_90)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _156;
    bool _164 = _80 == 144;
    float _166 = _162;
    if (_90)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_92)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _80 == 160;
    float _176 = _172;
    if (_92)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _152 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _182 = _178;
    if (_96)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _176;
    bool _186 = _80 == 176;
    float _188 = _184;
    if (_96)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _182;
    float _192 = log2(_180);
    bool _194 = _80 == 192;
    float _196 = _190;
    if (_120)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _188;
    float _200 = _198;
    if (_120)
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
    bool _208 = _80 == 208;
    float _210 = _206;
    if (_140)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _80 == 224;
    float _220 = _192 + 1.2999999523162841796875;
    float _222 = _216;
    if (_154)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _214;
    float _226 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _222;
    bool _230 = _80 == 240;
    float _232 = trunc(_220);
    int _234 = int(_232);
    float _236 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _238 = _226;
    float _240 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _242 = _236;
    bool _244 = _80 == 256;
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
    bool _254 = _80 == 272;
    float _256 = _252;
    if (_186)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_194)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    int _264 = min(_234, 15);
    bool _266 = _80 == 288;
    float _268 = _262;
    if (_194)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _260;
    float _272 = float(_264);
    bool _274 = _80 == 304;
    int _276 = _264 << 4;
    int _278 = _276 + 4288;
    float _280 = _270;
    float _282 = as_type<float>(_278);
    if (_208)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _284 = _268;
    float _286 = _284;
    if (_208)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _280;
    float _290 = -_272;
    float _292 = _290 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _294 = _288;
    if (_218)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _286;
    int _298 = _278 + 8;
    uint _301 = uint(int(uint(_298) >> uint(2)));
    uint _303 = uint(int(uint(int(_301)) >> uint(2)));
    int _305 = int(_301) & 3;
    float _307 = (*spvDescriptorSet0.vp_c14)._m0[int(_303)][_305];
    int _309 = int(_301) + 1;
    uint _311 = uint(int(uint(_309) >> uint(2)));
    int _313 = _309 & 3;
    float _315 = (*spvDescriptorSet0.vp_c14)._m0[int(_311)][_313];
    bool _317 = _80 == 320;
    float _319 = _292 + 1.0;
    float _321 = _296;
    if (_218)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _323 = _294;
    float _325 = _323;
    if (_230)
    {
        _321 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _327 = _321;
    bool _329 = _80 == 336;
    float _331 = exp2(_319);
    float _333 = _327;
    if (_230)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _335 = _325;
    float _337 = _335;
    if (_244)
    {
        _333 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _339 = _333;
    bool _341 = _80 == 352;
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
    bool _351 = _80 == 368;
    float _353 = _349;
    if (_254)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _355 = _347;
    float _357 = _355;
    if (_266)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _359 = _353;
    float _361 = 1.0 / _331;
    bool _363 = _80 == 384;
    float _365 = _359;
    if (_266)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _367 = _357;
    float _369 = _367;
    if (_274)
    {
        _365 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _371 = _365;
    bool _373 = _80 == 400;
    float _375 = _371;
    if (_274)
    {
        _369 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _377 = _369;
    bool _379 = _80 == 416;
    float _381 = _377;
    if (_317)
    {
        _375 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _383 = _375;
    float _385 = _383;
    if (_317)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _387 = _381;
    float _389 = _387;
    if (_329)
    {
        _385 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _391 = _385;
    bool _393 = _80 == 432;
    float _395 = _391;
    if (_329)
    {
        _389 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _397 = _389;
    float _399 = _397;
    if (_341)
    {
        _395 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _401 = _395;
    bool _403 = _80 == 448;
    float _405 = _401;
    if (_341)
    {
        _399 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _407 = _399;
    float _409 = _407;
    if (_351)
    {
        _405 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _411 = _405;
    bool _413 = _80 == 464;
    float _415 = _411;
    if (_351)
    {
        _409 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _417 = _409;
    float _419 = _417;
    if (_363)
    {
        _415 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _421 = _415;
    bool _423 = _80 == 480;
    float _425 = _421;
    if (_363)
    {
        _419 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _427 = _419;
    float _429 = _427;
    if (_373)
    {
        _425 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _431 = _425;
    bool _433 = _80 == 496;
    float _435 = _431;
    if (_373)
    {
        _429 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _437 = _429;
    float _439 = _437;
    if (_379)
    {
        _435 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _441 = _435;
    bool _443 = _80 == 512;
    float _445 = _441;
    if (_379)
    {
        _439 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _447 = _439;
    bool _449 = _80 == 528;
    float _451 = _447;
    if (_393)
    {
        _445 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _453 = _445;
    float _455 = _453;
    if (_393)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _457 = _451;
    float _459 = _457;
    if (_403)
    {
        _455 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _461 = _455;
    bool _463 = _80 == 544;
    float _465 = _461;
    if (_403)
    {
        _459 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _467 = _459;
    float _469 = _467;
    if (_413)
    {
        _465 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _471 = _465;
    bool _473 = _80 == 560;
    float _475 = _471;
    if (_413)
    {
        _469 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _477 = _469;
    float _479 = _477;
    if (_423)
    {
        _475 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _481 = _475;
    bool _483 = _80 == 576;
    float _485 = _481;
    if (_423)
    {
        _479 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _487 = _479;
    float _489 = _487;
    if (_433)
    {
        _485 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _491 = _485;
    bool _493 = _80 == 592;
    float _495 = _491;
    if (_433)
    {
        _489 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _497 = _489;
    float _499 = _497;
    if (_443)
    {
        _495 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _501 = _495;
    bool _503 = _80 == 608;
    float _505 = _501;
    if (_443)
    {
        _499 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _507 = _499;
    float _509 = _507;
    if (_449)
    {
        _505 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _511 = _505;
    bool _513 = _80 == 624;
    float _515 = _511;
    if (_449)
    {
        _509 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _517 = _509;
    bool _519 = _80 == 640;
    float _521 = _517;
    if (_463)
    {
        _515 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _523 = _515;
    float _525 = _523;
    if (_463)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _527 = _521;
    float _529 = _527;
    if (_473)
    {
        _525 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _531 = _525;
    bool _533 = _80 == 656;
    float _535 = _531;
    if (_473)
    {
        _529 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _537 = _529;
    float _539 = _537;
    if (_483)
    {
        _535 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _541 = _535;
    bool _543 = _80 == 672;
    float _545 = _541;
    if (_483)
    {
        _539 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _547 = _539;
    float _549 = _547;
    if (_493)
    {
        _545 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _551 = _545;
    bool _553 = _80 == 688;
    float _555 = _551;
    if (_493)
    {
        _549 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _557 = _549;
    float _559 = _557;
    if (_503)
    {
        _555 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _561 = _555;
    bool _563 = _80 == 704;
    float _565 = _561;
    if (_503)
    {
        _559 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _567 = _559;
    float _569 = _567;
    if (_513)
    {
        _565 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _571 = _565;
    bool _573 = _80 == 720;
    float _575 = _571;
    if (_513)
    {
        _569 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _577 = _569;
    float _579 = _577;
    if (_519)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _581 = _575;
    bool _583 = _80 == 736;
    float _585 = _581;
    if (_519)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _587 = _579;
    bool _589 = _80 == 752;
    float _591 = _587;
    if (_533)
    {
        _585 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _593 = _585;
    float _595 = _593;
    if (_543)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _597 = _595;
    float _599 = _597;
    if (_553)
    {
        _599 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _601 = _599;
    float _603 = _601;
    if (_563)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _605 = _603;
    float _607 = _605;
    if (_573)
    {
        _607 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _609 = _607;
    float _611 = _609;
    if (_583)
    {
        _611 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _613 = _611;
    float _615 = _613;
    if (_589)
    {
        _615 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _617 = _615;
    float _619 = _361 * _617;
    if (_533)
    {
        _591 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _621 = _591;
    float _623 = _621;
    if (_543)
    {
        _623 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _625 = _623;
    float _627 = _619 * _67;
    float _629 = _625;
    if (_553)
    {
        _629 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _631 = _629;
    float _633 = _631;
    if (_563)
    {
        _633 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _635 = _633;
    float _637 = floor(_627);
    float _639 = _635;
    if (_573)
    {
        _639 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _641 = _639;
    float _643 = _641;
    if (_583)
    {
        _643 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _645 = _643;
    float _647 = _645;
    if (_589)
    {
        _647 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _649 = _647;
    float _651 = _331 * _649;
    float _653 = -_637;
    float _655 = _627 + _653;
    float _657 = _655 * 2.0;
    float _659 = -_655;
    float _661 = fma(_651, _659, _67);
    float _663 = floor(_657);
    float _665 = _651 * _663;
    float _667 = _665 * 0.5;
    float _669 = _667 + _661;
    float _671 = fma(_71, _669, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _673 = fma(_669, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _675 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _677 = _671 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _681 = _673 + _679;
    float _683 = _677 * _677;
    float _685 = fma(_78, _78, _683);
    float _687 = _683;
    float _689 = _669;
    if (!_106)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _691 = _687;
    float _693 = fma(_681, _681, _685);
    float _695 = sqrt(_693);
    float _697 = -_315;
    float _699 = fma(_695, _307, _697);
    float _701 = precise::clamp(_699, 0.0, 1.0);
    float _703 = -_667;
    float _705 = fma(_703, _701, _669);
    float _707 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _709 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _705;
    float _713 = _693;
    float _715 = _691;
    if (!_106)
    {
        float _717 = fma(_707, _691, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _711 = _717;
    }
    float _719 = _711;
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _723 = _719;
    if (!_106)
    {
        float _725 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _719);
        _723 = _725;
    }
    float _727 = _723;
    if (!_106)
    {
        float _729 = fma(_721, _691, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _713 = _729;
    }
    float _731 = _713;
    float _733 = _731;
    if (!_106)
    {
        float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
        _733 = _735;
    }
    float _737 = _733;
    if (!_106)
    {
        float2 _2522 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2522, float2(0.0), isnan(_2522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2522, float2(0.0), isnan(_2522)), level(0.0)).x;
        _110 = _739;
    }
    float _741 = _110;
    if (_106)
    {
        _282 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _743 = _282;
    float _745 = _743;
    if (_106)
    {
        _689 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _689;
    float _749 = _747;
    if (_106)
    {
        float _751 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _751;
    }
    float _753 = _715;
    float _755 = _753;
    if (_106)
    {
        float _757 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _757;
    }
    float _759 = _745;
    float _761 = _759;
    if (_106)
    {
        float _763 = fma(_753, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _755 = _763;
    }
    float _765 = _755;
    float _767 = _765;
    if (_106)
    {
        float _769 = fma(_759, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _761 = _769;
    }
    float _771 = _761;
    float _773 = _771;
    if (_106)
    {
        float _775 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _765);
        _767 = _775;
    }
    float _777 = _767;
    if (_106)
    {
        float _779 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _771);
        _773 = _779;
    }
    float _781 = _773;
    float _783 = _741;
    if (_106)
    {
        float2 _2616 = float2(_777, _781);
        float _785 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2616, float2(0.0), isnan(_2616)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2616, float2(0.0), isnan(_2616)), level(0.0)).x;
        _783 = _785;
    }
    float _787 = _783;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _791 = _709 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    float _803 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _805 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _807 = _801 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _809 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _811 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_807)
    {
        _809 = _709;
    }
    float _813 = _809;
    float _815 = fma(_787, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _817 = _813;
    if (!_807)
    {
        _811 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _819 = _811;
    float _821 = _815 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _823 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _821);
    float _825 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _823);
    float _827 = _825 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _829 = _825;
    float _831 = _819;
    if (!_807)
    {
        _829 = _815;
    }
    float _833 = _829;
    float _835 = _833;
    if (!_807)
    {
        _749 = _827;
    }
    float _837 = _749;
    bool _839 = !_807;
    float _841 = _837;
    if (!_839)
    {
        float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _847 = _801 + _845;
        float _849 = _815 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _851 = rsqrt(_799);
        float _853 = _847 * _843;
        float _855 = _853 * 0.15915493667125701904296875;
        float _857 = _855 * 6.283185482025146484375;
        float _859 = cos(_857);
        float _861 = _855 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _859 + (-1.0);
        float _867 = _865 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _869 = fma(_863, _849, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _871 = _851 * _869;
        float _873 = fma(_815, _859, _867);
        float _875 = fma(_795, _871, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _877 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _879 = fma(_791, _871, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _881 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _877);
        float _883 = fma(_879, (*spvDescriptorSet0.vp_c4)._m0[2].z, _881);
        float _885 = _883 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _835 = _873;
        _831 = _875;
        _817 = _879;
        _841 = _885;
    }
    float _887 = _835;
    float _889 = _831;
    float _891 = _817;
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
        float _1017 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _3031 = float3(_1017, _1015, float(0));
        float3 _3035 = select(_3031, float3(0.0), isnan(_3031));
        float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3035.xy, uint(rint(_3035.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3035.xy, uint(rint(_3035.z)), level(0.0)).xyzw;
        float _1022 = _1020.x;
        float _1024 = _1020.y;
        float _1026 = _1020.z;
        float _1028 = _1020.w;
        float3 _3050 = float3(_1017, _1015, float(1));
        float3 _3052 = select(_3050, float3(0.0), isnan(_3050));
        float4 _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3052.xy, uint(rint(_3052.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3052.xy, uint(rint(_3052.z)), level(0.0)).xyzw;
        float _1032 = _1030.x;
        float _1034 = _1030.y;
        float _1036 = _1030.z;
        float _1038 = _1030.w;
        float3 _3067 = float3(_1017, _1015, float(2));
        float3 _3069 = select(_3067, float3(0.0), isnan(_3067));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3069.xy, uint(rint(_3069.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3069.xy, uint(rint(_3069.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3084 = float3(_1017, _1015, float(3));
        float3 _3086 = select(_3084, float3(0.0), isnan(_3084));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3086.xy, uint(rint(_3086.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3086.xy, uint(rint(_3086.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3101 = float3(_1017, _1015, float(4));
        float3 _3103 = select(_3101, float3(0.0), isnan(_3101));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3103.xy, uint(rint(_3103.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3103.xy, uint(rint(_3103.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3118 = float3(_1017, _1015, float(5));
        float3 _3120 = select(_3118, float3(0.0), isnan(_3118));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3120.xy, uint(rint(_3120.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3120.xy, uint(rint(_3120.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3135 = float3(_1017, _1015, float(6));
        float3 _3137 = select(_3135, float3(0.0), isnan(_3135));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3137.xy, uint(rint(_3137.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3137.xy, uint(rint(_3137.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3152 = float3(_1017, _1015, float(7));
        float3 _3154 = select(_3152, float3(0.0), isnan(_3152));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _3154.xy, uint(rint(_3154.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _3154.xy, uint(rint(_3154.z)), level(0.0)).xyzw;
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
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1174 = _709 + _1172;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _815;
    out.m_45.z = _709;
    float _1188 = _909 ? as_type<float>(_1108) : 0.0;
    float _1190 = fma(_1174, _1174, _1184);
    float _1192 = _909 ? as_type<float>(_1110) : 0.0;
    out.m_47.z = _803;
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

