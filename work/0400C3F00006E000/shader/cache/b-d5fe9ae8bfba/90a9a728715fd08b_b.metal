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
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c4 [[id(5)]];
    texture2d_array<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> vp_t_tcb_8 [[id(8)]];
    sampler vp_t_tcb_8Smplr [[id(9)]];
    sampler vp_t_tcb_ASmplr_w [[id(10)]];
    sampler vp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = in.m_42.x;
    float _58 = in.m_42.y;
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _71 = _65 << 4;
    bool _75 = _71 == 0;
    bool _77 = _71 == 16;
    bool _79 = _71 == 32;
    bool _81 = _71 == 48;
    bool _83 = _71 == 64;
    float _85 = fma(_62, _56, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _87 = fma(_69, _56, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _89 = _71 == 80;
    float _91 = as_type<float>(gl_BaseInstance);
    if (_75)
    {
        _91 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _93 = _91;
    float _95 = -_85;
    float _97 = _95 + _87;
    bool _99 = _71 == 96;
    float _101 = fma(_97, _58, _85);
    float _103 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _105 = 0.0;
    float _107 = _93;
    if (_75)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _109 = _105;
    float _111 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _113 = _101 + _111;
    float _115 = _109;
    if (_77)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _117 = _107;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _121 = _103 + _119;
    float _123 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _125 = _113 * _113;
    bool _127 = _71 == 112;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = _123 + _129;
    float _133 = fma(_121, _121, _125);
    float _135 = _117;
    if (_77)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _137 = _115;
    float _139 = _137;
    if (_79)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _141 = _135;
    float _143 = fma(_131, _131, _133);
    bool _145 = _71 == 128;
    float _147 = _141;
    if (_79)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _149 = _139;
    float _151 = rsqrt(_143);
    float _153 = _149;
    if (_81)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _147;
    bool _157 = _71 == 144;
    float _159 = _155;
    if (_81)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _71 == 160;
    float _169 = _165;
    if (_83)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_89)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _175 = _169;
    bool _177 = _71 == 176;
    float _179 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _181 = _175;
    if (_89)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _173;
    bool _185 = _71 == 192;
    float _187 = _183;
    if (_99)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _189 = _181;
    float _191 = log2(_179);
    float _193 = _189;
    if (_99)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _195 = _187;
    float _197 = _195;
    if (_127)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _199 = _193;
    bool _201 = _71 == 208;
    float _203 = _199;
    if (_127)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_145)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _71 == 224;
    float _213 = _209;
    if (_145)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _219 = _213;
    float _221 = _191 + 1.2999999523162841796875;
    bool _223 = _71 == 240;
    float _225 = _219;
    if (_157)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _227 = _217;
    float _229 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _231 = _225;
    float _233 = trunc(_221);
    int _235 = int(_233);
    bool _237 = _71 == 256;
    float _239 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _241 = _229;
    float _243 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _245 = _239;
    bool _247 = _71 == 272;
    float _249 = _245;
    if (_177)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    bool _257 = _71 == 288;
    float _259 = _255;
    if (_185)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _261 = _253;
    int _263 = min(_235, 15);
    bool _265 = _71 == 304;
    float _267 = _261;
    if (_201)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _269 = _259;
    float _271 = float(_263);
    float _273 = _269;
    if (_201)
    {
        _267 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _275 = _267;
    int _277 = _263 << 4;
    int _279 = _277 + 4288;
    float _281 = _275;
    if (_211)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _283 = _273;
    bool _285 = _71 == 320;
    float _287 = -_271;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _291 = _283;
    if (_211)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _293 = _281;
    float _295 = _293;
    if (_223)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _297 = _291;
    float _299 = _289 + 1.0;
    bool _301 = _71 == 336;
    float _303 = _297;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _305 = _295;
    float _307 = _305;
    if (_237)
    {
        _303 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _309 = _303;
    float _311 = exp2(_299);
    bool _313 = _71 == 352;
    float _315 = _309;
    if (_237)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _317 = _307;
    float _319 = _317;
    if (_247)
    {
        _315 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _321 = _315;
    bool _323 = _71 == 368;
    float _325 = _321;
    if (_247)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _327 = _319;
    float _329 = _327;
    if (_257)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _331 = _325;
    bool _333 = _71 == 384;
    float _335 = _331;
    if (_257)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _337 = _329;
    float _339 = 1.0 / _311;
    float _341 = _337;
    if (_265)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _343 = _335;
    bool _345 = _71 == 400;
    float _347 = _343;
    if (_265)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _349 = _341;
    bool _351 = _71 == 416;
    float _353 = _349;
    if (_285)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _355 = _347;
    float _357 = _355;
    if (_285)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _359 = _353;
    float _361 = _359;
    if (_301)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _363 = _357;
    bool _365 = _71 == 432;
    float _367 = _363;
    if (_301)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _369 = _361;
    float _371 = _369;
    if (_313)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _373 = _367;
    bool _375 = _71 == 448;
    float _377 = _373;
    if (_313)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _379 = _371;
    float _381 = _379;
    if (_323)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _383 = _377;
    bool _385 = _71 == 464;
    float _387 = _383;
    if (_323)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_333)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _393 = _387;
    bool _395 = _71 == 480;
    float _397 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_345)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _403 = _397;
    bool _405 = _71 == 496;
    float _407 = _403;
    if (_345)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _413 = _407;
    bool _415 = _71 == 512;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _419 = _411;
    bool _421 = _71 == 528;
    float _423 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _425 = _417;
    float _427 = _425;
    if (_365)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _429 = _423;
    float _431 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _433 = _427;
    bool _435 = _71 == 544;
    float _437 = _433;
    if (_375)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _439 = _431;
    float _441 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _443 = _437;
    bool _445 = _71 == 560;
    float _447 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _449 = _441;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _453 = _447;
    bool _455 = _71 == 576;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _463 = _457;
    bool _465 = _71 == 592;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _473 = _467;
    bool _475 = _71 == 608;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _483 = _477;
    bool _485 = _71 == 624;
    float _487 = _483;
    if (_421)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _489 = _481;
    bool _491 = _71 == 640;
    float _493 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _495 = _487;
    float _497 = _495;
    if (_435)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _499 = _493;
    float _501 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _503 = _497;
    bool _505 = _71 == 656;
    float _507 = _503;
    if (_445)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _509 = _501;
    float _511 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _513 = _507;
    bool _515 = _71 == 672;
    float _517 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _519 = _511;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _523 = _517;
    bool _525 = _71 == 688;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _533 = _527;
    bool _535 = _71 == 704;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _543 = _537;
    bool _545 = _71 == 720;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _553 = _547;
    bool _555 = _71 == 736;
    float _557 = _553;
    if (_491)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _559 = _551;
    bool _561 = _71 == 752;
    float _563 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _565 = _557;
    float _567 = _565;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _569 = _567;
    float _571 = _569;
    if (_525)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _573 = _571;
    float _575 = _573;
    if (_535)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _577 = _575;
    float _579 = _577;
    if (_545)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _581 = _579;
    float _583 = _581;
    if (_555)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_561)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _589 = _587;
    float _591 = _339 * _589;
    if (_505)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _593 = _563;
    float _595 = _593;
    if (_515)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _597 = _595;
    float _599 = _591 * _56;
    float _601 = _591 * _58;
    float _603 = _597;
    if (_525)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _605 = _603;
    float _607 = floor(_599);
    float _609 = _605;
    if (_535)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _611 = _609;
    float _613 = _611;
    if (_545)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _615 = _613;
    float _617 = _615;
    if (_555)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_561)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _623 = _621;
    float _625 = floor(_601);
    float _627 = _311 * _623;
    float _629 = -_607;
    float _631 = _599 + _629;
    float _633 = _631 * 2.0;
    float _635 = -_631;
    float _637 = fma(_627, _635, _56);
    int _639 = _279 + 8;
    uint _642 = uint(int(uint(_639) >> uint(2)));
    uint _644 = uint(int(uint(int(_642)) >> uint(2)));
    int _646 = int(_642) & 3;
    float _648 = (*spvDescriptorSet0.vp_c14)._m0[int(_644)][_646];
    int _650 = int(_642) + 1;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    int _654 = _650 & 3;
    float _656 = (*spvDescriptorSet0.vp_c14)._m0[int(_652)][_654];
    float _658 = -_625;
    float _660 = _601 + _658;
    float _662 = floor(_633);
    float _664 = _660 * 2.0;
    float _666 = -_660;
    float _668 = fma(_627, _666, _58);
    float _670 = floor(_664);
    float _672 = _627 * _662;
    float _674 = _672 * 0.5;
    float _676 = _674 + _637;
    float _678 = fma(_62, _676, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _680 = _627 * _670;
    float _682 = _680 * 0.5;
    float _684 = fma(_69, _676, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _686 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _688 = _682 + _668;
    float _690 = -_678;
    float _692 = _690 + _684;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _696 = _686 + _694;
    float _698 = fma(_688, _692, _678);
    float _700 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _702 = _698 + _700;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _706 = _702 * _702;
    float _708 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _710 = _704 + _708;
    float _712 = fma(_696, _696, _706);
    float _714 = fma(_710, _710, _712);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _718 = sqrt(_714);
    int _720 = _716 + 76;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.vp_c6)._m0[int(_724)][_726];
    uint _730 = uint(int(uint(_716) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c6)._m0[int(_732)][_734];
    float _738 = -_656;
    float _740 = fma(_718, _648, _738);
    float _742 = precise::clamp(_740, 0.0, 1.0);
    float _744 = -_674;
    float _746 = fma(_744, _742, _676);
    float _748 = -_682;
    float _750 = fma(_748, _742, _688);
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _754 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _756 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _758 = _752 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _762 = _754 + _760;
    float _764 = abs(_758);
    float _766 = abs(_762);
    float _768 = precise::max(_764, _766);
    float _770 = _728 + 8.0;
    float _772 = _770 + _768;
    float _774 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _778 = _772 * _736;
    float _780 = _778 * 4.0;
    float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _774);
    float _784 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
    float _786 = precise::max(_780, 1.0);
    float _788 = log2(_786);
    float _790 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _792 = _752 + _790;
    float _794 = trunc(_788);
    int _796 = int(_794);
    float _798 = floor(_788);
    int _800 = min(_796, 4);
    int _802 = _800 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _804 = _802 << 4;
    float _806 = _798 + 1.0;
    float _808 = rint(_798);
    float _810 = precise::max(_808, 0.0);
    uint _812 = uint(_810);
    uint _814 = clamp(_812, 0u, 65535u);
    float _816 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _818 = _754 + _816;
    uint _820 = uint(int(uint(_804) >> uint(2)));
    uint _822 = uint(int(uint(int(_820)) >> uint(2)));
    int _824 = int(_820) & 3;
    float _826 = (*spvDescriptorSet0.vp_c6)._m0[int(_822)][_824];
    float _828 = rint(_806);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    uint _834 = clamp(_832, 0u, 65535u);
    int _836 = _804 + 16;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    uint _840 = uint(int(uint(int(_838)) >> uint(2)));
    int _842 = int(_838) & 3;
    float _844 = (*spvDescriptorSet0.vp_c6)._m0[int(_840)][_842];
    float _846 = fma(_818, _826, 0.5);
    float _848 = fma(_792, _826, 0.5);
    float _850 = fma(_818, _844, 0.5);
    float _852 = fma(_792, _844, 0.5);
    float3 _2533 = float3(_848, _846, float(int(_814)));
    float3 _2537 = select(_2533, float3(0.0), isnan(_2533));
    float3 _856 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2537.xy, uint(rint(_2537.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2537.xy, uint(rint(_2537.z)), level(0.0)).xyz;
    float _858 = _856.x;
    float _860 = _856.y;
    float _862 = _856.z;
    float3 _2552 = float3(_852, _850, float(int(_834)));
    float3 _2554 = select(_2552, float3(0.0), isnan(_2552));
    float3 _864 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2554.xy, uint(rint(_2554.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2554.xy, uint(rint(_2554.z)), level(0.0)).xyz;
    float _866 = _864.x;
    float _868 = _864.y;
    float _870 = _864.z;
    float2 _2566 = float2(_782, _784);
    float2 _874 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2566, float2(0.0), isnan(_2566)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2566, float2(0.0), isnan(_2566)), level(0.0)).xw;
    float _876 = _874.x;
    float _878 = _874.y;
    float _880 = _752 * 0.00012500000593718141317367553710938;
    float _882 = _754 * 0.00012500000593718141317367553710938;
    float _884 = -_798;
    float _886 = _788 + _884;
    float _888 = abs(_880);
    float _890 = abs(_882);
    float _892 = precise::max(_888, _890);
    float _894 = fma(_886, 5.42372894287109375, -4.338983058929443359375);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = fma(_892, 20.0, -19.0);
    float _900 = precise::clamp(_898, 0.0, 1.0);
    float _902 = -_900;
    float _904 = _902 + 1.0;
    float _906 = -_862;
    float _908 = _906 + _870;
    float _910 = -_860;
    float _912 = _910 + _868;
    float _914 = fma(_896, _908, _862);
    float _916 = -_858;
    float _918 = _916 + _866;
    float _920 = fma(_896, _912, _860);
    float _922 = fma(_904, _914, _754);
    float _924 = fma(_896, _918, _858);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _928 = _922 + _926;
    float _930 = fma(_904, _924, _752);
    float _932 = _928 * _928;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _936 = _930 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_936, _936, _932);
    float _942 = fma(_876, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _944 = fma(_936, _936, _938);
    bool _946 = _940 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _948 = isnan(_940);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _954 = _950 || _952;
    float _956 = fma(_904, _920, _942);
    float _958 = sqrt(_944);
    float _960 = _860;
    float _962 = _932;
    float _964 = _938;
    float _966 = _942;
    float _968 = _878;
    if (!_954)
    {
        _960 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _970 = _960;
    float _972 = _970;
    if (!_954)
    {
        float _974 = -_940;
        float _976 = _974 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _962 = _976;
    }
    float _978 = _962;
    float _980 = _978;
    if (_954)
    {
        _964 = _956;
    }
    float _982 = _964;
    float _984 = _982;
    if (!_954)
    {
        float _986 = -_978;
        float _988 = fma(_986, _970, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _980 = _988;
    }
    float _990 = _980;
    float _992 = _990;
    if (!_954)
    {
        float _994 = _940 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _972 = _994;
    }
    float _996 = _972;
    if (!_954)
    {
        float _998 = precise::min(_956, _990);
        _992 = _998;
    }
    float _1000 = _992;
    if (!_954)
    {
        float _1002 = -_1000;
        float _1004 = _956 + _1002;
        _966 = _1004;
    }
    float _1006 = _966;
    if (!_954)
    {
        float _1008 = fma(_996, _1006, _1000);
        _984 = _1008;
    }
    float _1010 = _984;
    bool _1012 = _958 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1014 = _1010 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1016 = fma(_878, 255.99609375, 7.629510946571826934814453125e-06);
    float _1018 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1014);
    float _1020 = floor(_1016);
    float _1022 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1018);
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1026 = 255.99609375;
    float _1028 = _1022;
    float _1030 = _1024;
    if (!_1012)
    {
        _1026 = _930;
    }
    float _1032 = _1026;
    float _1034 = _1032;
    if (!_1012)
    {
        _1028 = _922;
    }
    float _1036 = _1028;
    float _1038 = _1036;
    if (!_1012)
    {
        _968 = _1010;
    }
    float _1040 = _968;
    bool _1042 = !_1012;
    float _1044 = _1040;
    if (!_1042)
    {
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1050 = _958 + _1048;
        float _1052 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1054 = rsqrt(_944);
        float _1056 = _1050 * _1046;
        float _1058 = _1056 * 0.15915493667125701904296875;
        float _1060 = _1058 * 6.283185482025146484375;
        float _1062 = cos(_1060);
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        float _1068 = _1062 + (-1.0);
        float _1070 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1072 = fma(_1066, _1052, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1074 = fma(_1062, _1010, _1070);
        float _1076 = _1054 * _1072;
        float _1078 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1080 = fma(_936, _1076, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1082 = fma(_928, _1076, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1084 = fma(_1080, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1078);
        float _1086 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1084);
        float _1088 = _1086 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1044 = _1074;
        _1034 = _1080;
        _1038 = _1082;
        _1030 = _1088;
    }
    float _1090 = _1044;
    float _1092 = _1034;
    float _1094 = _1038;
    float _1096 = _1030;
    float _1098 = _1090 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1100 = _1090 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1102 = -_1020;
    float _1104 = _1016 + _1102;
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1098);
    float _1108 = fma(_1092, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1100);
    bool _1110 = _1104 > 0.499000012874603271484375;
    float _1112 = fma(_1094, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1106);
    float _1114 = fma(_1094, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1108);
    float _1116 = _1112 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1118 = _1114 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1120 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1122 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1124 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1122);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1124);
    float _1134 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1126);
    float _1136 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1128);
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1130);
    float _1140 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1132);
    float _1142 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1134);
    float _1144 = _1136 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1146 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1150 = _1142 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1152 = !_1110;
    int _1154 = _1152 ? as_type<int>(_1144) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1148;
    float _3063 = as_type<float>(_1154);
    out.gl_Position.z = _3063;
    out.gl_Position.w = _1150;
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
    float _56 = in.m_42.x;
    float _58 = in.m_42.y;
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _71 = _65 << 4;
    bool _75 = _71 == 0;
    bool _77 = _71 == 16;
    bool _79 = _71 == 32;
    bool _81 = _71 == 48;
    bool _83 = _71 == 64;
    float _85 = fma(_62, _56, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _87 = fma(_69, _56, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _89 = _71 == 80;
    float _91 = as_type<float>(gl_BaseInstance);
    if (_75)
    {
        _91 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _93 = _91;
    float _95 = -_85;
    float _97 = _95 + _87;
    bool _99 = _71 == 96;
    float _101 = fma(_97, _58, _85);
    float _103 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _105 = 0.0;
    float _107 = _93;
    if (_75)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _109 = _105;
    float _111 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _113 = _101 + _111;
    float _115 = _109;
    if (_77)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _117 = _107;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _121 = _103 + _119;
    float _123 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _125 = _113 * _113;
    bool _127 = _71 == 112;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = _123 + _129;
    float _133 = fma(_121, _121, _125);
    float _135 = _117;
    if (_77)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _137 = _115;
    float _139 = _137;
    if (_79)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _141 = _135;
    float _143 = fma(_131, _131, _133);
    bool _145 = _71 == 128;
    float _147 = _141;
    if (_79)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _149 = _139;
    float _151 = rsqrt(_143);
    float _153 = _149;
    if (_81)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _147;
    bool _157 = _71 == 144;
    float _159 = _155;
    if (_81)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _71 == 160;
    float _169 = _165;
    if (_83)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_89)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _175 = _169;
    bool _177 = _71 == 176;
    float _179 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _181 = _175;
    if (_89)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _173;
    bool _185 = _71 == 192;
    float _187 = _183;
    if (_99)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _189 = _181;
    float _191 = log2(_179);
    float _193 = _189;
    if (_99)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _195 = _187;
    float _197 = _195;
    if (_127)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _199 = _193;
    bool _201 = _71 == 208;
    float _203 = _199;
    if (_127)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_145)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _71 == 224;
    float _213 = _209;
    if (_145)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _219 = _213;
    float _221 = _191 + 1.2999999523162841796875;
    bool _223 = _71 == 240;
    float _225 = _219;
    if (_157)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _227 = _217;
    float _229 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _231 = _225;
    float _233 = trunc(_221);
    int _235 = int(_233);
    bool _237 = _71 == 256;
    float _239 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _241 = _229;
    float _243 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _245 = _239;
    bool _247 = _71 == 272;
    float _249 = _245;
    if (_177)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    bool _257 = _71 == 288;
    float _259 = _255;
    if (_185)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _261 = _253;
    int _263 = min(_235, 15);
    bool _265 = _71 == 304;
    float _267 = _261;
    if (_201)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _269 = _259;
    float _271 = float(_263);
    float _273 = _269;
    if (_201)
    {
        _267 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _275 = _267;
    int _277 = _263 << 4;
    int _279 = _277 + 4288;
    float _281 = _275;
    if (_211)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _283 = _273;
    bool _285 = _71 == 320;
    float _287 = -_271;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _291 = _283;
    if (_211)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _293 = _281;
    float _295 = _293;
    if (_223)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _297 = _291;
    float _299 = _289 + 1.0;
    bool _301 = _71 == 336;
    float _303 = _297;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _305 = _295;
    float _307 = _305;
    if (_237)
    {
        _303 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _309 = _303;
    float _311 = exp2(_299);
    bool _313 = _71 == 352;
    float _315 = _309;
    if (_237)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _317 = _307;
    float _319 = _317;
    if (_247)
    {
        _315 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _321 = _315;
    bool _323 = _71 == 368;
    float _325 = _321;
    if (_247)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _327 = _319;
    float _329 = _327;
    if (_257)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _331 = _325;
    bool _333 = _71 == 384;
    float _335 = _331;
    if (_257)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _337 = _329;
    float _339 = 1.0 / _311;
    float _341 = _337;
    if (_265)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _343 = _335;
    bool _345 = _71 == 400;
    float _347 = _343;
    if (_265)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _349 = _341;
    bool _351 = _71 == 416;
    float _353 = _349;
    if (_285)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _355 = _347;
    float _357 = _355;
    if (_285)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _359 = _353;
    float _361 = _359;
    if (_301)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _363 = _357;
    bool _365 = _71 == 432;
    float _367 = _363;
    if (_301)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _369 = _361;
    float _371 = _369;
    if (_313)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _373 = _367;
    bool _375 = _71 == 448;
    float _377 = _373;
    if (_313)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _379 = _371;
    float _381 = _379;
    if (_323)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _383 = _377;
    bool _385 = _71 == 464;
    float _387 = _383;
    if (_323)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_333)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _393 = _387;
    bool _395 = _71 == 480;
    float _397 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_345)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _403 = _397;
    bool _405 = _71 == 496;
    float _407 = _403;
    if (_345)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _413 = _407;
    bool _415 = _71 == 512;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _419 = _411;
    bool _421 = _71 == 528;
    float _423 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _425 = _417;
    float _427 = _425;
    if (_365)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _429 = _423;
    float _431 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _433 = _427;
    bool _435 = _71 == 544;
    float _437 = _433;
    if (_375)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _439 = _431;
    float _441 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _443 = _437;
    bool _445 = _71 == 560;
    float _447 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _449 = _441;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _453 = _447;
    bool _455 = _71 == 576;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _463 = _457;
    bool _465 = _71 == 592;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _473 = _467;
    bool _475 = _71 == 608;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _483 = _477;
    bool _485 = _71 == 624;
    float _487 = _483;
    if (_421)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _489 = _481;
    bool _491 = _71 == 640;
    float _493 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _495 = _487;
    float _497 = _495;
    if (_435)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _499 = _493;
    float _501 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _503 = _497;
    bool _505 = _71 == 656;
    float _507 = _503;
    if (_445)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _509 = _501;
    float _511 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _513 = _507;
    bool _515 = _71 == 672;
    float _517 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _519 = _511;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _523 = _517;
    bool _525 = _71 == 688;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _533 = _527;
    bool _535 = _71 == 704;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _543 = _537;
    bool _545 = _71 == 720;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _553 = _547;
    bool _555 = _71 == 736;
    float _557 = _553;
    if (_491)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _559 = _551;
    bool _561 = _71 == 752;
    float _563 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _565 = _557;
    float _567 = _565;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _569 = _567;
    float _571 = _569;
    if (_525)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _573 = _571;
    float _575 = _573;
    if (_535)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _577 = _575;
    float _579 = _577;
    if (_545)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _581 = _579;
    float _583 = _581;
    if (_555)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_561)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _589 = _587;
    float _591 = _339 * _589;
    if (_505)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _593 = _563;
    float _595 = _593;
    if (_515)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _597 = _595;
    float _599 = _591 * _56;
    float _601 = _591 * _58;
    float _603 = _597;
    if (_525)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _605 = _603;
    float _607 = floor(_599);
    float _609 = _605;
    if (_535)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _611 = _609;
    float _613 = _611;
    if (_545)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _615 = _613;
    float _617 = _615;
    if (_555)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_561)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _623 = _621;
    float _625 = floor(_601);
    float _627 = _311 * _623;
    float _629 = -_607;
    float _631 = _599 + _629;
    float _633 = _631 * 2.0;
    float _635 = -_631;
    float _637 = fma(_627, _635, _56);
    int _639 = _279 + 8;
    uint _642 = uint(int(uint(_639) >> uint(2)));
    uint _644 = uint(int(uint(int(_642)) >> uint(2)));
    int _646 = int(_642) & 3;
    float _648 = (*spvDescriptorSet0.vp_c14)._m0[int(_644)][_646];
    int _650 = int(_642) + 1;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    int _654 = _650 & 3;
    float _656 = (*spvDescriptorSet0.vp_c14)._m0[int(_652)][_654];
    float _658 = -_625;
    float _660 = _601 + _658;
    float _662 = floor(_633);
    float _664 = _660 * 2.0;
    float _666 = -_660;
    float _668 = fma(_627, _666, _58);
    float _670 = floor(_664);
    float _672 = _627 * _662;
    float _674 = _672 * 0.5;
    float _676 = _674 + _637;
    float _678 = fma(_62, _676, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _680 = _627 * _670;
    float _682 = _680 * 0.5;
    float _684 = fma(_69, _676, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _686 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _688 = _682 + _668;
    float _690 = -_678;
    float _692 = _690 + _684;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _696 = _686 + _694;
    float _698 = fma(_688, _692, _678);
    float _700 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _702 = _698 + _700;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _706 = _702 * _702;
    float _708 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _710 = _704 + _708;
    float _712 = fma(_696, _696, _706);
    float _714 = fma(_710, _710, _712);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _718 = sqrt(_714);
    int _720 = _716 + 76;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.vp_c6)._m0[int(_724)][_726];
    uint _730 = uint(int(uint(_716) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c6)._m0[int(_732)][_734];
    float _738 = -_656;
    float _740 = fma(_718, _648, _738);
    float _742 = precise::clamp(_740, 0.0, 1.0);
    float _744 = -_674;
    float _746 = fma(_744, _742, _676);
    float _748 = -_682;
    float _750 = fma(_748, _742, _688);
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _754 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _756 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _758 = _752 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _762 = _754 + _760;
    float _764 = abs(_758);
    float _766 = abs(_762);
    float _768 = precise::max(_764, _766);
    float _770 = _728 + 8.0;
    float _772 = _770 + _768;
    float _774 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _778 = _772 * _736;
    float _780 = _778 * 4.0;
    float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _774);
    float _784 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
    float _786 = precise::max(_780, 1.0);
    float _788 = log2(_786);
    float _790 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _792 = _752 + _790;
    float _794 = trunc(_788);
    int _796 = int(_794);
    float _798 = floor(_788);
    int _800 = min(_796, 4);
    int _802 = _800 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _804 = _802 << 4;
    float _806 = _798 + 1.0;
    float _808 = rint(_798);
    float _810 = precise::max(_808, 0.0);
    uint _812 = uint(_810);
    uint _814 = clamp(_812, 0u, 65535u);
    float _816 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _818 = _754 + _816;
    uint _820 = uint(int(uint(_804) >> uint(2)));
    uint _822 = uint(int(uint(int(_820)) >> uint(2)));
    int _824 = int(_820) & 3;
    float _826 = (*spvDescriptorSet0.vp_c6)._m0[int(_822)][_824];
    float _828 = rint(_806);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    uint _834 = clamp(_832, 0u, 65535u);
    int _836 = _804 + 16;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    uint _840 = uint(int(uint(int(_838)) >> uint(2)));
    int _842 = int(_838) & 3;
    float _844 = (*spvDescriptorSet0.vp_c6)._m0[int(_840)][_842];
    float _846 = fma(_818, _826, 0.5);
    float _848 = fma(_792, _826, 0.5);
    float _850 = fma(_818, _844, 0.5);
    float _852 = fma(_792, _844, 0.5);
    float3 _2533 = float3(_848, _846, float(int(_814)));
    float3 _2537 = select(_2533, float3(0.0), isnan(_2533));
    float3 _856 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2537.xy, uint(rint(_2537.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2537.xy, uint(rint(_2537.z)), level(0.0)).xyz;
    float _858 = _856.x;
    float _860 = _856.y;
    float _862 = _856.z;
    float3 _2552 = float3(_852, _850, float(int(_834)));
    float3 _2554 = select(_2552, float3(0.0), isnan(_2552));
    float3 _864 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2554.xy, uint(rint(_2554.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2554.xy, uint(rint(_2554.z)), level(0.0)).xyz;
    float _866 = _864.x;
    float _868 = _864.y;
    float _870 = _864.z;
    float2 _2566 = float2(_782, _784);
    float2 _874 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2566, float2(0.0), isnan(_2566)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2566, float2(0.0), isnan(_2566)), level(0.0)).xw;
    float _876 = _874.x;
    float _878 = _874.y;
    float _880 = _752 * 0.00012500000593718141317367553710938;
    float _882 = _754 * 0.00012500000593718141317367553710938;
    float _884 = -_798;
    float _886 = _788 + _884;
    float _888 = abs(_880);
    float _890 = abs(_882);
    float _892 = precise::max(_888, _890);
    float _894 = fma(_886, 5.42372894287109375, -4.338983058929443359375);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = fma(_892, 20.0, -19.0);
    float _900 = precise::clamp(_898, 0.0, 1.0);
    float _902 = -_900;
    float _904 = _902 + 1.0;
    float _906 = -_862;
    float _908 = _906 + _870;
    float _910 = -_860;
    float _912 = _910 + _868;
    float _914 = fma(_896, _908, _862);
    float _916 = -_858;
    float _918 = _916 + _866;
    float _920 = fma(_896, _912, _860);
    float _922 = fma(_904, _914, _754);
    float _924 = fma(_896, _918, _858);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _928 = _922 + _926;
    float _930 = fma(_904, _924, _752);
    float _932 = _928 * _928;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _936 = _930 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_936, _936, _932);
    float _942 = fma(_876, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _944 = fma(_936, _936, _938);
    bool _946 = _940 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _948 = isnan(_940);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _954 = _950 || _952;
    float _956 = fma(_904, _920, _942);
    float _958 = sqrt(_944);
    float _960 = _860;
    float _962 = _932;
    float _964 = _938;
    float _966 = _942;
    float _968 = _878;
    if (!_954)
    {
        _960 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _970 = _960;
    float _972 = _970;
    if (!_954)
    {
        float _974 = -_940;
        float _976 = _974 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _962 = _976;
    }
    float _978 = _962;
    float _980 = _978;
    if (_954)
    {
        _964 = _956;
    }
    float _982 = _964;
    float _984 = _982;
    if (!_954)
    {
        float _986 = -_978;
        float _988 = fma(_986, _970, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _980 = _988;
    }
    float _990 = _980;
    float _992 = _990;
    if (!_954)
    {
        float _994 = _940 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _972 = _994;
    }
    float _996 = _972;
    if (!_954)
    {
        float _998 = precise::min(_956, _990);
        _992 = _998;
    }
    float _1000 = _992;
    if (!_954)
    {
        float _1002 = -_1000;
        float _1004 = _956 + _1002;
        _966 = _1004;
    }
    float _1006 = _966;
    if (!_954)
    {
        float _1008 = fma(_996, _1006, _1000);
        _984 = _1008;
    }
    float _1010 = _984;
    bool _1012 = _958 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1014 = _1010 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1016 = fma(_878, 255.99609375, 7.629510946571826934814453125e-06);
    float _1018 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1014);
    float _1020 = floor(_1016);
    float _1022 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1018);
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1026 = 255.99609375;
    float _1028 = _1022;
    float _1030 = _1024;
    if (!_1012)
    {
        _1026 = _930;
    }
    float _1032 = _1026;
    float _1034 = _1032;
    if (!_1012)
    {
        _1028 = _922;
    }
    float _1036 = _1028;
    float _1038 = _1036;
    if (!_1012)
    {
        _968 = _1010;
    }
    float _1040 = _968;
    bool _1042 = !_1012;
    float _1044 = _1040;
    if (!_1042)
    {
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1050 = _958 + _1048;
        float _1052 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1054 = rsqrt(_944);
        float _1056 = _1050 * _1046;
        float _1058 = _1056 * 0.15915493667125701904296875;
        float _1060 = _1058 * 6.283185482025146484375;
        float _1062 = cos(_1060);
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        float _1068 = _1062 + (-1.0);
        float _1070 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1072 = fma(_1066, _1052, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1074 = fma(_1062, _1010, _1070);
        float _1076 = _1054 * _1072;
        float _1078 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1080 = fma(_936, _1076, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1082 = fma(_928, _1076, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1084 = fma(_1080, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1078);
        float _1086 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1084);
        float _1088 = _1086 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1044 = _1074;
        _1034 = _1080;
        _1038 = _1082;
        _1030 = _1088;
    }
    float _1090 = _1044;
    float _1092 = _1034;
    float _1094 = _1038;
    float _1096 = _1030;
    float _1098 = _1090 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1100 = _1090 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1102 = -_1020;
    float _1104 = _1016 + _1102;
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1098);
    float _1108 = fma(_1092, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1100);
    bool _1110 = _1104 > 0.499000012874603271484375;
    float _1112 = fma(_1094, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1106);
    float _1114 = fma(_1094, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1108);
    float _1116 = _1112 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1118 = _1114 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1120 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1122 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1124 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1122);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1124);
    float _1134 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1126);
    float _1136 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1128);
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1130);
    float _1140 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1132);
    float _1142 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1134);
    float _1144 = _1136 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1146 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1150 = _1142 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1152 = !_1110;
    int _1154 = _1152 ? as_type<int>(_1144) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1148;
    float _3063 = as_type<float>(_1154);
    out.gl_Position.z = _3063;
    out.gl_Position.w = _1150;
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
    float _56 = in.m_42.x;
    float _58 = in.m_42.y;
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _71 = _65 << 4;
    bool _75 = _71 == 0;
    bool _77 = _71 == 16;
    bool _79 = _71 == 32;
    bool _81 = _71 == 48;
    bool _83 = _71 == 64;
    float _85 = fma(_62, _56, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _87 = fma(_69, _56, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _89 = _71 == 80;
    float _91 = as_type<float>(gl_BaseInstance);
    if (_75)
    {
        _91 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _93 = _91;
    float _95 = -_85;
    float _97 = _95 + _87;
    bool _99 = _71 == 96;
    float _101 = fma(_97, _58, _85);
    float _103 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _105 = 0.0;
    float _107 = _93;
    if (_75)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _109 = _105;
    float _111 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _113 = _101 + _111;
    float _115 = _109;
    if (_77)
    {
        _107 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _117 = _107;
    float _119 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _121 = _103 + _119;
    float _123 = fma(_58, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _125 = _113 * _113;
    bool _127 = _71 == 112;
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = _123 + _129;
    float _133 = fma(_121, _121, _125);
    float _135 = _117;
    if (_77)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _137 = _115;
    float _139 = _137;
    if (_79)
    {
        _135 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _141 = _135;
    float _143 = fma(_131, _131, _133);
    bool _145 = _71 == 128;
    float _147 = _141;
    if (_79)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _149 = _139;
    float _151 = rsqrt(_143);
    float _153 = _149;
    if (_81)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _155 = _147;
    bool _157 = _71 == 144;
    float _159 = _155;
    if (_81)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _161 = _153;
    float _163 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _165 = _159;
    bool _167 = _71 == 160;
    float _169 = _165;
    if (_83)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _171 = _163;
    float _173 = _171;
    if (_89)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _175 = _169;
    bool _177 = _71 == 176;
    float _179 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _181 = _175;
    if (_89)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _183 = _173;
    bool _185 = _71 == 192;
    float _187 = _183;
    if (_99)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _189 = _181;
    float _191 = log2(_179);
    float _193 = _189;
    if (_99)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _195 = _187;
    float _197 = _195;
    if (_127)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _199 = _193;
    bool _201 = _71 == 208;
    float _203 = _199;
    if (_127)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _205 = _197;
    float _207 = _205;
    if (_145)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _209 = _203;
    bool _211 = _71 == 224;
    float _213 = _209;
    if (_145)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _215 = _207;
    float _217 = _215;
    if (_157)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _219 = _213;
    float _221 = _191 + 1.2999999523162841796875;
    bool _223 = _71 == 240;
    float _225 = _219;
    if (_157)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _227 = _217;
    float _229 = _227;
    if (_167)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _231 = _225;
    float _233 = trunc(_221);
    int _235 = int(_233);
    bool _237 = _71 == 256;
    float _239 = _231;
    if (_167)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _241 = _229;
    float _243 = _241;
    if (_177)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _245 = _239;
    bool _247 = _71 == 272;
    float _249 = _245;
    if (_177)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _251 = _243;
    float _253 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _255 = _249;
    bool _257 = _71 == 288;
    float _259 = _255;
    if (_185)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _261 = _253;
    int _263 = min(_235, 15);
    bool _265 = _71 == 304;
    float _267 = _261;
    if (_201)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _269 = _259;
    float _271 = float(_263);
    float _273 = _269;
    if (_201)
    {
        _267 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _275 = _267;
    int _277 = _263 << 4;
    int _279 = _277 + 4288;
    float _281 = _275;
    if (_211)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _283 = _273;
    bool _285 = _71 == 320;
    float _287 = -_271;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _291 = _283;
    if (_211)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _293 = _281;
    float _295 = _293;
    if (_223)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _297 = _291;
    float _299 = _289 + 1.0;
    bool _301 = _71 == 336;
    float _303 = _297;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _305 = _295;
    float _307 = _305;
    if (_237)
    {
        _303 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _309 = _303;
    float _311 = exp2(_299);
    bool _313 = _71 == 352;
    float _315 = _309;
    if (_237)
    {
        _307 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _317 = _307;
    float _319 = _317;
    if (_247)
    {
        _315 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _321 = _315;
    bool _323 = _71 == 368;
    float _325 = _321;
    if (_247)
    {
        _319 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _327 = _319;
    float _329 = _327;
    if (_257)
    {
        _325 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _331 = _325;
    bool _333 = _71 == 384;
    float _335 = _331;
    if (_257)
    {
        _329 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _337 = _329;
    float _339 = 1.0 / _311;
    float _341 = _337;
    if (_265)
    {
        _335 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _343 = _335;
    bool _345 = _71 == 400;
    float _347 = _343;
    if (_265)
    {
        _341 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _349 = _341;
    bool _351 = _71 == 416;
    float _353 = _349;
    if (_285)
    {
        _347 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _355 = _347;
    float _357 = _355;
    if (_285)
    {
        _353 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _359 = _353;
    float _361 = _359;
    if (_301)
    {
        _357 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _363 = _357;
    bool _365 = _71 == 432;
    float _367 = _363;
    if (_301)
    {
        _361 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _369 = _361;
    float _371 = _369;
    if (_313)
    {
        _367 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _373 = _367;
    bool _375 = _71 == 448;
    float _377 = _373;
    if (_313)
    {
        _371 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _379 = _371;
    float _381 = _379;
    if (_323)
    {
        _377 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _383 = _377;
    bool _385 = _71 == 464;
    float _387 = _383;
    if (_323)
    {
        _381 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _389 = _381;
    float _391 = _389;
    if (_333)
    {
        _387 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _393 = _387;
    bool _395 = _71 == 480;
    float _397 = _393;
    if (_333)
    {
        _391 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _399 = _391;
    float _401 = _399;
    if (_345)
    {
        _397 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _403 = _397;
    bool _405 = _71 == 496;
    float _407 = _403;
    if (_345)
    {
        _401 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _409 = _401;
    float _411 = _409;
    if (_351)
    {
        _407 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _413 = _407;
    bool _415 = _71 == 512;
    float _417 = _413;
    if (_351)
    {
        _411 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _419 = _411;
    bool _421 = _71 == 528;
    float _423 = _419;
    if (_365)
    {
        _417 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _425 = _417;
    float _427 = _425;
    if (_365)
    {
        _423 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _429 = _423;
    float _431 = _429;
    if (_375)
    {
        _427 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _433 = _427;
    bool _435 = _71 == 544;
    float _437 = _433;
    if (_375)
    {
        _431 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _439 = _431;
    float _441 = _439;
    if (_385)
    {
        _437 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _443 = _437;
    bool _445 = _71 == 560;
    float _447 = _443;
    if (_385)
    {
        _441 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _449 = _441;
    float _451 = _449;
    if (_395)
    {
        _447 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _453 = _447;
    bool _455 = _71 == 576;
    float _457 = _453;
    if (_395)
    {
        _451 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _459 = _451;
    float _461 = _459;
    if (_405)
    {
        _457 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _463 = _457;
    bool _465 = _71 == 592;
    float _467 = _463;
    if (_405)
    {
        _461 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _469 = _461;
    float _471 = _469;
    if (_415)
    {
        _467 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _473 = _467;
    bool _475 = _71 == 608;
    float _477 = _473;
    if (_415)
    {
        _471 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _479 = _471;
    float _481 = _479;
    if (_421)
    {
        _477 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _483 = _477;
    bool _485 = _71 == 624;
    float _487 = _483;
    if (_421)
    {
        _481 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _489 = _481;
    bool _491 = _71 == 640;
    float _493 = _489;
    if (_435)
    {
        _487 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _495 = _487;
    float _497 = _495;
    if (_435)
    {
        _493 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _499 = _493;
    float _501 = _499;
    if (_445)
    {
        _497 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _503 = _497;
    bool _505 = _71 == 656;
    float _507 = _503;
    if (_445)
    {
        _501 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _509 = _501;
    float _511 = _509;
    if (_455)
    {
        _507 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _513 = _507;
    bool _515 = _71 == 672;
    float _517 = _513;
    if (_455)
    {
        _511 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _519 = _511;
    float _521 = _519;
    if (_465)
    {
        _517 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _523 = _517;
    bool _525 = _71 == 688;
    float _527 = _523;
    if (_465)
    {
        _521 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _529 = _521;
    float _531 = _529;
    if (_475)
    {
        _527 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _533 = _527;
    bool _535 = _71 == 704;
    float _537 = _533;
    if (_475)
    {
        _531 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _539 = _531;
    float _541 = _539;
    if (_485)
    {
        _537 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _543 = _537;
    bool _545 = _71 == 720;
    float _547 = _543;
    if (_485)
    {
        _541 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _549 = _541;
    float _551 = _549;
    if (_491)
    {
        _547 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _553 = _547;
    bool _555 = _71 == 736;
    float _557 = _553;
    if (_491)
    {
        _551 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _559 = _551;
    bool _561 = _71 == 752;
    float _563 = _559;
    if (_505)
    {
        _557 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _565 = _557;
    float _567 = _565;
    if (_515)
    {
        _567 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _569 = _567;
    float _571 = _569;
    if (_525)
    {
        _571 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _573 = _571;
    float _575 = _573;
    if (_535)
    {
        _575 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _577 = _575;
    float _579 = _577;
    if (_545)
    {
        _579 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _581 = _579;
    float _583 = _581;
    if (_555)
    {
        _583 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _585 = _583;
    float _587 = _585;
    if (_561)
    {
        _587 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _589 = _587;
    float _591 = _339 * _589;
    if (_505)
    {
        _563 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _593 = _563;
    float _595 = _593;
    if (_515)
    {
        _595 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _597 = _595;
    float _599 = _591 * _56;
    float _601 = _591 * _58;
    float _603 = _597;
    if (_525)
    {
        _603 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _605 = _603;
    float _607 = floor(_599);
    float _609 = _605;
    if (_535)
    {
        _609 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _611 = _609;
    float _613 = _611;
    if (_545)
    {
        _613 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _615 = _613;
    float _617 = _615;
    if (_555)
    {
        _617 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _619 = _617;
    float _621 = _619;
    if (_561)
    {
        _621 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _623 = _621;
    float _625 = floor(_601);
    float _627 = _311 * _623;
    float _629 = -_607;
    float _631 = _599 + _629;
    float _633 = _631 * 2.0;
    float _635 = -_631;
    float _637 = fma(_627, _635, _56);
    int _639 = _279 + 8;
    uint _642 = uint(int(uint(_639) >> uint(2)));
    uint _644 = uint(int(uint(int(_642)) >> uint(2)));
    int _646 = int(_642) & 3;
    float _648 = (*spvDescriptorSet0.vp_c14)._m0[int(_644)][_646];
    int _650 = int(_642) + 1;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    int _654 = _650 & 3;
    float _656 = (*spvDescriptorSet0.vp_c14)._m0[int(_652)][_654];
    float _658 = -_625;
    float _660 = _601 + _658;
    float _662 = floor(_633);
    float _664 = _660 * 2.0;
    float _666 = -_660;
    float _668 = fma(_627, _666, _58);
    float _670 = floor(_664);
    float _672 = _627 * _662;
    float _674 = _672 * 0.5;
    float _676 = _674 + _637;
    float _678 = fma(_62, _676, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _680 = _627 * _670;
    float _682 = _680 * 0.5;
    float _684 = fma(_69, _676, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _686 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _688 = _682 + _668;
    float _690 = -_678;
    float _692 = _690 + _684;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _696 = _686 + _694;
    float _698 = fma(_688, _692, _678);
    float _700 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _702 = _698 + _700;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _706 = _702 * _702;
    float _708 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _710 = _704 + _708;
    float _712 = fma(_696, _696, _706);
    float _714 = fma(_710, _710, _712);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z) << 4;
    float _718 = sqrt(_714);
    int _720 = _716 + 76;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.vp_c6)._m0[int(_724)][_726];
    uint _730 = uint(int(uint(_716) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c6)._m0[int(_732)][_734];
    float _738 = -_656;
    float _740 = fma(_718, _648, _738);
    float _742 = precise::clamp(_740, 0.0, 1.0);
    float _744 = -_674;
    float _746 = fma(_744, _742, _676);
    float _748 = -_682;
    float _750 = fma(_748, _742, _688);
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _754 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _756 = -(*spvDescriptorSet0.vp_c6)._m0[18].z;
    float _758 = _752 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c6)._m0[18].w;
    float _762 = _754 + _760;
    float _764 = abs(_758);
    float _766 = abs(_762);
    float _768 = precise::max(_764, _766);
    float _770 = _728 + 8.0;
    float _772 = _770 + _768;
    float _774 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _778 = _772 * _736;
    float _780 = _778 * 4.0;
    float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _774);
    float _784 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _776);
    float _786 = precise::max(_780, 1.0);
    float _788 = log2(_786);
    float _790 = -(*spvDescriptorSet0.vp_c6)._m0[16].x;
    float _792 = _752 + _790;
    float _794 = trunc(_788);
    int _796 = int(_794);
    float _798 = floor(_788);
    int _800 = min(_796, 4);
    int _802 = _800 + as_type<int>((*spvDescriptorSet0.vp_c6)._m0[16].z);
    int _804 = _802 << 4;
    float _806 = _798 + 1.0;
    float _808 = rint(_798);
    float _810 = precise::max(_808, 0.0);
    uint _812 = uint(_810);
    uint _814 = clamp(_812, 0u, 65535u);
    float _816 = -(*spvDescriptorSet0.vp_c6)._m0[16].y;
    float _818 = _754 + _816;
    uint _820 = uint(int(uint(_804) >> uint(2)));
    uint _822 = uint(int(uint(int(_820)) >> uint(2)));
    int _824 = int(_820) & 3;
    float _826 = (*spvDescriptorSet0.vp_c6)._m0[int(_822)][_824];
    float _828 = rint(_806);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    uint _834 = clamp(_832, 0u, 65535u);
    int _836 = _804 + 16;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    uint _840 = uint(int(uint(int(_838)) >> uint(2)));
    int _842 = int(_838) & 3;
    float _844 = (*spvDescriptorSet0.vp_c6)._m0[int(_840)][_842];
    float _846 = fma(_818, _826, 0.5);
    float _848 = fma(_792, _826, 0.5);
    float _850 = fma(_818, _844, 0.5);
    float _852 = fma(_792, _844, 0.5);
    float3 _2533 = float3(_848, _846, float(int(_814)));
    float3 _2537 = select(_2533, float3(0.0), isnan(_2533));
    float3 _856 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2537.xy, uint(rint(_2537.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2537.xy, uint(rint(_2537.z)), level(0.0)).xyz;
    float _858 = _856.x;
    float _860 = _856.y;
    float _862 = _856.z;
    float3 _2552 = float3(_852, _850, float(int(_834)));
    float3 _2554 = select(_2552, float3(0.0), isnan(_2552));
    float3 _864 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2554.xy, uint(rint(_2554.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2554.xy, uint(rint(_2554.z)), level(0.0)).xyz;
    float _866 = _864.x;
    float _868 = _864.y;
    float _870 = _864.z;
    float2 _2566 = float2(_782, _784);
    float2 _874 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2566, float2(0.0), isnan(_2566)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2566, float2(0.0), isnan(_2566)), level(0.0)).xw;
    float _876 = _874.x;
    float _878 = _874.y;
    float _880 = _752 * 0.00012500000593718141317367553710938;
    float _882 = _754 * 0.00012500000593718141317367553710938;
    float _884 = -_798;
    float _886 = _788 + _884;
    float _888 = abs(_880);
    float _890 = abs(_882);
    float _892 = precise::max(_888, _890);
    float _894 = fma(_886, 5.42372894287109375, -4.338983058929443359375);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = fma(_892, 20.0, -19.0);
    float _900 = precise::clamp(_898, 0.0, 1.0);
    float _902 = -_900;
    float _904 = _902 + 1.0;
    float _906 = -_862;
    float _908 = _906 + _870;
    float _910 = -_860;
    float _912 = _910 + _868;
    float _914 = fma(_896, _908, _862);
    float _916 = -_858;
    float _918 = _916 + _866;
    float _920 = fma(_896, _912, _860);
    float _922 = fma(_904, _914, _754);
    float _924 = fma(_896, _918, _858);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _928 = _922 + _926;
    float _930 = fma(_904, _924, _752);
    float _932 = _928 * _928;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _936 = _930 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_936, _936, _932);
    float _942 = fma(_876, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _944 = fma(_936, _936, _938);
    bool _946 = _940 >= (*spvDescriptorSet0.vp_c6)._m0[19].z;
    bool _948 = isnan(_940);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c6)._m0[19].z);
    bool _954 = _950 || _952;
    float _956 = fma(_904, _920, _942);
    float _958 = sqrt(_944);
    float _960 = _860;
    float _962 = _932;
    float _964 = _938;
    float _966 = _942;
    float _968 = _878;
    if (!_954)
    {
        _960 = (*spvDescriptorSet0.vp_c6)._m0[19].y;
    }
    float _970 = _960;
    float _972 = _970;
    if (!_954)
    {
        float _974 = -_940;
        float _976 = _974 + (*spvDescriptorSet0.vp_c6)._m0[19].z;
        _962 = _976;
    }
    float _978 = _962;
    float _980 = _978;
    if (_954)
    {
        _964 = _956;
    }
    float _982 = _964;
    float _984 = _982;
    if (!_954)
    {
        float _986 = -_978;
        float _988 = fma(_986, _970, (*spvDescriptorSet0.vp_c9)._m0[26].y);
        _980 = _988;
    }
    float _990 = _980;
    float _992 = _990;
    if (!_954)
    {
        float _994 = _940 * (*spvDescriptorSet0.vp_c6)._m0[19].w;
        _972 = _994;
    }
    float _996 = _972;
    if (!_954)
    {
        float _998 = precise::min(_956, _990);
        _992 = _998;
    }
    float _1000 = _992;
    if (!_954)
    {
        float _1002 = -_1000;
        float _1004 = _956 + _1002;
        _966 = _1004;
    }
    float _1006 = _966;
    if (!_954)
    {
        float _1008 = fma(_996, _1006, _1000);
        _984 = _1008;
    }
    float _1010 = _984;
    bool _1012 = _958 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _1014 = _1010 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _1016 = fma(_878, 255.99609375, 7.629510946571826934814453125e-06);
    float _1018 = fma(_930, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1014);
    float _1020 = floor(_1016);
    float _1022 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1018);
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _1026 = 255.99609375;
    float _1028 = _1022;
    float _1030 = _1024;
    if (!_1012)
    {
        _1026 = _930;
    }
    float _1032 = _1026;
    float _1034 = _1032;
    if (!_1012)
    {
        _1028 = _922;
    }
    float _1036 = _1028;
    float _1038 = _1036;
    if (!_1012)
    {
        _968 = _1010;
    }
    float _1040 = _968;
    bool _1042 = !_1012;
    float _1044 = _1040;
    if (!_1042)
    {
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1050 = _958 + _1048;
        float _1052 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1054 = rsqrt(_944);
        float _1056 = _1050 * _1046;
        float _1058 = _1056 * 0.15915493667125701904296875;
        float _1060 = _1058 * 6.283185482025146484375;
        float _1062 = cos(_1060);
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        float _1068 = _1062 + (-1.0);
        float _1070 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1072 = fma(_1066, _1052, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1074 = fma(_1062, _1010, _1070);
        float _1076 = _1054 * _1072;
        float _1078 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1080 = fma(_936, _1076, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1082 = fma(_928, _1076, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1084 = fma(_1080, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1078);
        float _1086 = fma(_1082, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1084);
        float _1088 = _1086 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _1044 = _1074;
        _1034 = _1080;
        _1038 = _1082;
        _1030 = _1088;
    }
    float _1090 = _1044;
    float _1092 = _1034;
    float _1094 = _1038;
    float _1096 = _1030;
    float _1098 = _1090 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1100 = _1090 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1102 = -_1020;
    float _1104 = _1016 + _1102;
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1098);
    float _1108 = fma(_1092, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1100);
    bool _1110 = _1104 > 0.499000012874603271484375;
    float _1112 = fma(_1094, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1106);
    float _1114 = fma(_1094, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1108);
    float _1116 = _1112 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1118 = _1114 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1120 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1122 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1124 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1122);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1124);
    float _1134 = fma(_1118, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1126);
    float _1136 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1128);
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1130);
    float _1140 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1132);
    float _1142 = fma(_1096, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1134);
    float _1144 = _1136 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1146 = _1140 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1150 = _1142 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1152 = !_1110;
    int _1154 = _1152 ? as_type<int>(_1144) : as_type<int>((*spvDescriptorSet0.vp_c14)._m0[4].y);
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1148;
    float _3063 = as_type<float>(_1154);
    out.gl_Position.z = _3063;
    out.gl_Position.w = _1150;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

