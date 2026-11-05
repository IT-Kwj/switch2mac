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
        float2 _2428 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2428, float2(0.0), isnan(_2428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2428, float2(0.0), isnan(_2428)), level(0.0)).x;
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
    if (_106)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _749;
    }
    float _751 = _715;
    float _753 = _751;
    if (_106)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_106)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_106)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_106)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_106)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_106)
    {
        float2 _2521 = float2(_775, _779);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2521, float2(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2521, float2(0.0), isnan(_2521)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _789 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _793 = _791 != 0;
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _797 = _795 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _799 = _795 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _801 = _795 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _803 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _797);
    float _805 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _799);
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _801);
    float _809 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].z, _803);
    float _811 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].z, _805);
    float _813 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
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
        float _923 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2785 = float3(_923, _921, float(0));
        float3 _2789 = select(_2785, float3(0.0), isnan(_2785));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2789.xy, uint(rint(_2789.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2789.xy, uint(rint(_2789.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2804 = float3(_923, _921, float(1));
        float3 _2806 = select(_2804, float3(0.0), isnan(_2804));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2806.xy, uint(rint(_2806.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2806.xy, uint(rint(_2806.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2821 = float3(_923, _921, float(2));
        float3 _2823 = select(_2821, float3(0.0), isnan(_2821));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2823.xy, uint(rint(_2823.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2823.xy, uint(rint(_2823.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2838 = float3(_923, _921, float(3));
        float3 _2840 = select(_2838, float3(0.0), isnan(_2838));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2840.xy, uint(rint(_2840.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2840.xy, uint(rint(_2840.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2855 = float3(_923, _921, float(4));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2857.xy, uint(rint(_2857.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2857.xy, uint(rint(_2857.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        float3 _2872 = float3(_923, _921, float(5));
        float3 _2874 = select(_2872, float3(0.0), isnan(_2872));
        float4 _976 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2874.xy, uint(rint(_2874.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2874.xy, uint(rint(_2874.z)), level(0.0)).xyzw;
        float _978 = _976.x;
        float _980 = _976.y;
        float _982 = _976.z;
        float _984 = _976.w;
        float3 _2889 = float3(_923, _921, float(6));
        float3 _2891 = select(_2889, float3(0.0), isnan(_2889));
        float4 _986 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2891.xy, uint(rint(_2891.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2891.xy, uint(rint(_2891.z)), level(0.0)).xyzw;
        float _988 = _986.x;
        float _990 = _986.y;
        float _992 = _986.z;
        float _994 = _986.w;
        float3 _2906 = float3(_923, _921, float(7));
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
    float _1076 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1080 = _709 + _1078;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _795;
    out.m_45.z = _709;
    float _1094 = _793 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1080, _1080, _1090);
    float _1098 = _793 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _787;
    out.m_47.w = _789;
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
        float2 _2428 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2428, float2(0.0), isnan(_2428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2428, float2(0.0), isnan(_2428)), level(0.0)).x;
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
    if (_106)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _749;
    }
    float _751 = _715;
    float _753 = _751;
    if (_106)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_106)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_106)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_106)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_106)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_106)
    {
        float2 _2521 = float2(_775, _779);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2521, float2(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2521, float2(0.0), isnan(_2521)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _789 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _793 = _791 != 0;
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _797 = _795 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _799 = _795 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _801 = _795 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _803 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _797);
    float _805 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _799);
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _801);
    float _809 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].z, _803);
    float _811 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].z, _805);
    float _813 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
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
        float _923 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2785 = float3(_923, _921, float(0));
        float3 _2789 = select(_2785, float3(0.0), isnan(_2785));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2789.xy, uint(rint(_2789.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2789.xy, uint(rint(_2789.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2804 = float3(_923, _921, float(1));
        float3 _2806 = select(_2804, float3(0.0), isnan(_2804));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2806.xy, uint(rint(_2806.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2806.xy, uint(rint(_2806.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2821 = float3(_923, _921, float(2));
        float3 _2823 = select(_2821, float3(0.0), isnan(_2821));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2823.xy, uint(rint(_2823.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2823.xy, uint(rint(_2823.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2838 = float3(_923, _921, float(3));
        float3 _2840 = select(_2838, float3(0.0), isnan(_2838));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2840.xy, uint(rint(_2840.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2840.xy, uint(rint(_2840.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2855 = float3(_923, _921, float(4));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2857.xy, uint(rint(_2857.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2857.xy, uint(rint(_2857.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        float3 _2872 = float3(_923, _921, float(5));
        float3 _2874 = select(_2872, float3(0.0), isnan(_2872));
        float4 _976 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2874.xy, uint(rint(_2874.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2874.xy, uint(rint(_2874.z)), level(0.0)).xyzw;
        float _978 = _976.x;
        float _980 = _976.y;
        float _982 = _976.z;
        float _984 = _976.w;
        float3 _2889 = float3(_923, _921, float(6));
        float3 _2891 = select(_2889, float3(0.0), isnan(_2889));
        float4 _986 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2891.xy, uint(rint(_2891.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2891.xy, uint(rint(_2891.z)), level(0.0)).xyzw;
        float _988 = _986.x;
        float _990 = _986.y;
        float _992 = _986.z;
        float _994 = _986.w;
        float3 _2906 = float3(_923, _921, float(7));
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
    float _1076 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1080 = _709 + _1078;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _795;
    out.m_45.z = _709;
    float _1094 = _793 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1080, _1080, _1090);
    float _1098 = _793 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _787;
    out.m_47.w = _789;
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
        float2 _2428 = float2(_727, _737);
        float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2428, float2(0.0), isnan(_2428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2428, float2(0.0), isnan(_2428)), level(0.0)).x;
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
    if (_106)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _743, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _715 = _749;
    }
    float _751 = _715;
    float _753 = _751;
    if (_106)
    {
        float _755 = fma(_709, _743, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _745 = _755;
    }
    float _757 = _745;
    float _759 = _757;
    if (_106)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_106)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_106)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_106)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _741;
    if (_106)
    {
        float2 _2521 = float2(_775, _779);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2521, float2(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2521, float2(0.0), isnan(_2521)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_707, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _789 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _793 = _791 != 0;
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _797 = _795 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _799 = _795 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _801 = _795 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _803 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[1].x, _797);
    float _805 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[0].x, _799);
    float _807 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _801);
    float _809 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[1].z, _803);
    float _811 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[0].z, _805);
    float _813 = fma(_709, (*spvDescriptorSet0.vp_c4)._m0[2].z, _807);
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
        float _923 = fma(6.2500002968590706586837768554688e-05, (*spvDescriptorSet0.vp_c15)._m0[0].z, 0.5);
        float3 _2785 = float3(_923, _921, float(0));
        float3 _2789 = select(_2785, float3(0.0), isnan(_2785));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2789.xy, uint(rint(_2789.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2789.xy, uint(rint(_2789.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2804 = float3(_923, _921, float(1));
        float3 _2806 = select(_2804, float3(0.0), isnan(_2804));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2806.xy, uint(rint(_2806.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2806.xy, uint(rint(_2806.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2821 = float3(_923, _921, float(2));
        float3 _2823 = select(_2821, float3(0.0), isnan(_2821));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2823.xy, uint(rint(_2823.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2823.xy, uint(rint(_2823.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2838 = float3(_923, _921, float(3));
        float3 _2840 = select(_2838, float3(0.0), isnan(_2838));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2840.xy, uint(rint(_2840.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2840.xy, uint(rint(_2840.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2855 = float3(_923, _921, float(4));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2857.xy, uint(rint(_2857.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2857.xy, uint(rint(_2857.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        float3 _2872 = float3(_923, _921, float(5));
        float3 _2874 = select(_2872, float3(0.0), isnan(_2872));
        float4 _976 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2874.xy, uint(rint(_2874.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2874.xy, uint(rint(_2874.z)), level(0.0)).xyzw;
        float _978 = _976.x;
        float _980 = _976.y;
        float _982 = _976.z;
        float _984 = _976.w;
        float3 _2889 = float3(_923, _921, float(6));
        float3 _2891 = select(_2889, float3(0.0), isnan(_2889));
        float4 _986 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2891.xy, uint(rint(_2891.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2891.xy, uint(rint(_2891.z)), level(0.0)).xyzw;
        float _988 = _986.x;
        float _990 = _986.y;
        float _992 = _986.z;
        float _994 = _986.w;
        float3 _2906 = float3(_923, _921, float(7));
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
    float _1076 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1080 = _709 + _1078;
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
    out.m_45.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_45.y = _795;
    out.m_45.z = _709;
    float _1094 = _793 ? as_type<float>(_1014) : 0.0;
    float _1096 = fma(_1080, _1080, _1090);
    float _1098 = _793 ? as_type<float>(_1016) : 0.0;
    out.m_47.z = _787;
    out.m_47.w = _789;
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

