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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2220 = false;
    bool _761 = false;
    bool _617 = false;
    bool _443 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_103);
        out.gl_Position.z = _2698;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_141);
        out.gl_Position.z = _2767;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_51.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = _147 * _145;
    float _151 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = _151 * 6.283185482025146484375;
    float _155 = floor(_151);
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    float _165 = _153 * 0.15915493667125701904296875;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    bool _171 = !_159;
    int _173 = _171 ? 0 : 1;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = abs(_173);
    bool _181 = !_169;
    int _183 = _181 ? 0 : 1;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = -_155;
    float _189 = _151 + _187;
    int _191 = abs(_183);
    float _193 = float(_179);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_163;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_177, 0.5, 0.5);
    float _205 = abs(_197);
    float _207 = _193 * _205;
    int _209 = abs(_201);
    bool _211 = _189 < 0.5;
    float _213 = float(_211);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_191);
    float _221 = float(_209);
    float _223 = -_213;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = fma(_219, _217, _207);
    float _229 = abs(_225);
    float _231 = fma(_221, _229, _227);
    bool _233 = !_185;
    float _249;
    if (!_233)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_87);
        float _255 = 1.0 / _253;
        float _257 = _121 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _259 + _265;
    bool _269 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_259);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _259 + _293;
    float _297 = 1.0 / _283;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _301 = 1.0 / _291;
    float _303 = 1.0 / _287;
    float _305 = _263 * _297;
    bool _307 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_259);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = _267 * _301;
    bool _327 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _295 * _303;
    bool _349 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_259);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = _337 * _341;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _359 * _369;
    float _383 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_345, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_377, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = _379 * _381;
    float _395 = _383 * _381;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_385, _365, _405);
    float _415 = fma(_387, _365, _407);
    float _417 = fma(_409, _323, _413);
    float _419 = fma(_411, _323, _415);
    float _421 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    bool _425 = !_299;
    float _441;
    if (!_425)
    {
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _429 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_87);
        float _447 = 1.0 / _445;
        float _449 = _121 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = in.m_53.x;
    float _455 = in.m_53.y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _451 + _457;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _481 = 1.0 / _475;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _485 = 1.0 / _479;
    float _487 = _423 * _455;
    bool _489 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _491 = isnan(_451);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = _459 * _481;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _505 = _451 + _503;
    bool _507 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _509 = isnan(_451);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_471;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _523;
    float _527 = _421 * _453;
    float _529 = _517 * _521;
    float _531 = -_517;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = fma(_525, _501, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _545 = _499 * _533;
    float _547 = fma(_537, _501, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _549 = fma(_541, _501, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = _505 * _485;
    float _553 = _543 * _545;
    float _555 = _547 * _545;
    float _557 = _549 * _545;
    float _559 = -_499;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].x, _555);
    float _577 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _579 = fma(_565, _551, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _581 = fma(_569, _551, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _583 = fma(_573, _551, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _585 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].z, _553);
    float _587 = fma(_579, _529, _575);
    float _589 = fma(_581, _529, _577);
    float _591 = fma(_583, _529, _585);
    float _593 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].x, _587);
    float _595 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].z, _591);
    bool _599 = !_483;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_87);
        float _621 = 1.0 / _619;
        float _623 = _121 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = _661 * _683;
    float _689 = -_661;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _649;
    float _695 = _665 * _679;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_695, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = _699 * _693;
    float _705 = _701 * _687;
    float _707 = -_677;
    float _709 = _707 + 1.0;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _625 + _711;
    float _715 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _719 = _645 * _709;
    float _721 = fma(_703, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _723 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_721, _719, _717);
    float _727 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _729 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[117].x, _725);
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _729;
    out.m_55.y = _735;
    out.m_55.z = _731;
    out.m_55.w = _737;
    bool _739 = !_685;
    float _757;
    float _759;
    if (!_739)
    {
        float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _743 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _745 = float(_87);
        float _747 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _749 = _747 * _741;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _745;
        _759 = _755;
        _761 = true;
    }
    else
    {
        float _763 = float(_87);
        float _765 = 1.0 / _763;
        float _767 = _121 * _765;
        _757 = _763;
        _759 = _767;
    }
    _761 = false;
    float _769 = _757;
    float _771 = _759;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _775 = int(_773);
    float _777 = in.m_51.y;
    float _779 = _231 * _527;
    float _781 = _231 * _487;
    float _783 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _785 = in.m_51.z;
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _791 = int(_789);
    float _793 = as_type<float>(int(gl_VertexIndex));
    float _795 = float(_775);
    float _797 = 1.0 / _769;
    float _799 = float(uint(_791));
    float _801 = 1.0 / _795;
    int _803 = ~_791;
    int _805 = _803 + 1;
    float _807 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _809 = ~_791;
    int _811 = _809 + 1;
    float _813 = _785 * 2.0;
    bool _815 = _791 == 0;
    int _817 = ~_791;
    int _819 = _817 + 1;
    float _821 = 1.0 / _799;
    int _823 = ~_791;
    int _825 = _823 + 1;
    float _827 = _801 * _121;
    float _829 = floor(_813);
    int _831 = as_type<int>(_821) + (-2);
    float _833 = trunc(_827);
    int _835 = int(_833);
    float _837 = float(uint(_835));
    float _839 = as_type<float>(_831) * _837;
    float _841 = trunc(_839);
    float _843 = precise::max(_841, 0.0);
    uint _846 = uint(_843);
    int _848 = _805 * int(_846);
    int _850 = _848 + _835;
    float _852 = float(uint(_850));
    float _854 = as_type<float>(_831) * _852;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _858 = _856 != 0;
    float _860 = trunc(_854);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    bool _866 = !_858;
    float _868 = _866 ? 7.345489978790283203125 : 1.0;
    float _870 = _868 * _143;
    float _872 = floor(_870);
    int _874 = int(_846) + int(_864);
    float _876 = float(_791);
    float _878 = float(_835);
    int _880 = _811 * _874;
    int _882 = _880 + _835;
    bool _884 = _878 >= _876;
    bool _886 = isnan(_878);
    bool _888 = _884 || _886;
    bool _890 = isnan(_876);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    bool _896 = uint(_882) >= uint(_791);
    float _898 = trunc(_894);
    int _900 = int(_898);
    float _902 = -_872;
    float _904 = _870 + _902;
    bool _906 = !_896;
    int _908 = _906 ? 0 : (-1);
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _920 = _918 != 0;
    int _922 = ~_874;
    int _924 = _922 + _908;
    int _926 = _924 + 1;
    int _928 = _791 * _926;
    int _930 = _928 + _835;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _934 = _932 != 0;
    bool _936 = !_815;
    int _938 = _936 ? _930 : (-1);
    float _940 = _904 * _876;
    int _942 = ~_900;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    float _948 = _876 * _121;
    bool _950 = !_934;
    int _952 = _950 ? 0 : 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _956 = _954 != 0;
    int _958 = _938 * _946;
    float _960 = _948 * _797;
    int _962 = _791 + (-1);
    float _964 = trunc(_940);
    int _966 = int(_964);
    bool _968 = !_912;
    int _970 = _968 ? 0 : 1;
    int _972 = abs(_952);
    int _974 = _900 * _962;
    int _976 = _974 + _958;
    bool _978 = !_916;
    int _980 = _978 ? 0 : 1;
    int _982 = abs(_970);
    float _984 = trunc(_960);
    int _986 = int(_984);
    int _988 = abs(_980);
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    bool _994 = !_956;
    int _996 = _994 ? 0 : 1;
    int _998 = _976 * _988;
    int _1000 = abs(_992);
    int _1002 = _966 * _972;
    int _1004 = _1002 + _835;
    int _1006 = abs(_996);
    int _1008 = ~_791;
    int _1010 = _1008 + 1;
    int _1012 = _986 * _982;
    int _1014 = _1012 + _998;
    int _1016 = ~_791;
    int _1018 = _1016 + 1;
    int _1020 = _1004 * _1000;
    int _1022 = _1020 + _1014;
    int _1024 = _966 * _1006;
    int _1026 = _1024 + _1022;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1032 = float(uint(_1026));
    float _1034 = -_1028;
    float _1036 = fma(_783, 2.0, _1034);
    float _1038 = _143 + _777;
    float _1040 = fma(_807, -2.0, _1030);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = _771 + _1042;
    float _1046 = as_type<float>(_831) * _1032;
    float _1048 = _1038 + (-1.0);
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1052 = trunc(_1046);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    float _1058 = _143 + _785;
    float _1060 = _1058 + (-1.0);
    int _1062 = _1018 * int(_1056);
    int _1064 = _1062 + _1026;
    float _1066 = float(uint(_1064));
    float _1068 = as_type<float>(_831) * _1066;
    float _1070 = trunc(_1068);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = _777 * 2.0;
    float _1078 = floor(_1076);
    int _1080 = int(_1056) + int(_1074);
    float _1082 = _143 * 2.0;
    int _1084 = _1010 * _1080;
    int _1086 = _1084 + _1026;
    float _1088 = floor(_1082);
    bool _1090 = uint(_1086) >= uint(_791);
    bool _1092 = !_1090;
    int _1094 = _1092 ? 0 : (-1);
    float _1096 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1098 = log2(_1096);
    int _1100 = ~_1080;
    int _1102 = _1100 + _1094;
    int _1104 = _1102 + 1;
    int _1106 = _791 * _1104;
    int _1108 = _1106 + _1026;
    bool _1110 = _1088 > 0.0;
    bool _1112 = _1088 >= 0.0;
    bool _1114 = isnan(_1088);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    bool _1122 = !_815;
    int _1124 = _1122 ? _1108 : (-1);
    int _1126 = _1120 ? 0 : 1;
    float _1128 = _1098 * _121;
    int _1130 = _1124 & 3;
    bool _1132 = _1130 != 0;
    int _1134 = _1124 & 3;
    bool _1136 = _1134 != 0;
    float _1138 = exp2(_1128);
    bool _1140 = uint(_1130) > 1u;
    int _1142 = _1136 ? 0 : 1;
    bool _1144 = _1130 != 3;
    bool _1146 = uint(_1130) >= 2u;
    bool _1148 = _1078 > 0.0;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1150;
    int _1154 = _1146 ? 0 : 1;
    bool _1156 = _1078 >= 0.0;
    bool _1158 = isnan(_1078);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(0.0);
    bool _1164 = _1160 || _1162;
    float _1166 = 1.0 / _1152;
    int _1168 = ~_1142;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    float _1174 = -_1138;
    float _1176 = _1174 + 1.0;
    int _1178 = ~_1126;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1172;
    int _1186 = _1182;
    if (!_1140)
    {
        int _1188 = ~_1142;
        int _1190 = _1188 + 1;
        _1184 = _1190;
    }
    int _1192 = _1184;
    if (!_1110)
    {
        int _1194 = ~_1126;
        int _1196 = _1194 + 1;
        _1186 = _1196;
    }
    int _1198 = _1186;
    int _1200 = _1164 ? 0 : 1;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1204 = _1202 != 0;
    int _1206 = ~_1154;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (_1144)
    {
        int _1214 = ~_1154;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = _1044 * _1166;
    int _1222 = ~_1200;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1230 = _1228 != 0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1238 = _1236 != 0;
    int _1240 = _1226;
    if (!_1148)
    {
        int _1242 = ~_1200;
        int _1244 = _1242 + 1;
        _1240 = _1244;
    }
    int _1246 = _1240;
    float _1248 = in.m_44.x;
    float _1250 = in.m_44.y;
    float _1252 = in.m_44.z;
    bool _1254 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1262 = _1258 || _1260;
    bool _1264 = !_1204;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = _1262 ? _1176 : 0.0;
    int _1270 = as_type<int>(_793) & 1;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>(_793) & 2;
    bool _1276 = _1274 != 0;
    bool _1278 = !_1234;
    int _1280 = _1278 ? 0 : 1;
    bool _1282 = !_1238;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = float(_1246);
    int _1288 = abs(_1284);
    float _1290 = -_121;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1036);
    int _1294 = abs(_1192);
    float _1296 = float(_1288);
    int _1298 = abs(_1218);
    float _1300 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1302 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1304 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1306 = _1296 * _1286;
    float _1308 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1300);
    float _1310 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1302);
    float _1312 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1304);
    float _1314 = float(uint(_1004));
    float _1316 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1308);
    float _1318 = _1306 * (-2.0);
    bool _1320 = !_1230;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = as_type<float>(_831) * _1314;
    float _1326 = _777 + _785;
    bool _1328 = _829 >= 0.0;
    bool _1330 = isnan(_829);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1340 = abs(_1280);
    float _1342 = _1326 + (-1.0);
    float _1344 = trunc(_1324);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    int _1350 = _1336 ? 0 : 1;
    float _1352 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1310);
    bool _1354 = _829 > 0.0;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1358 = fma(_1338, _1318, _1338);
    float _1360 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1312);
    float _1362 = float(_1198);
    float _1364 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = float(_1340);
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1370 = ~_1350;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1378 = _819 * int(_1348);
    int _1380 = _1378 + _1004;
    float _1382 = _1366 * _1362;
    int _1384 = _1124 >> 31;
    float _1386 = _1382 * (-2.0);
    float _1388 = float(uint(_1380));
    int _1390 = _1374;
    if (!_1354)
    {
        int _1392 = ~_1350;
        int _1394 = _1392 + 1;
        _1390 = _1394;
    }
    int _1396 = _1390;
    float _1398 = fma(_1356, _1386, _1356);
    int _1400 = _1384 & 3;
    float _1402 = as_type<float>(_831) * _1388;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1406 = _1124 + _1400;
    float _1408 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1404);
    bool _1410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(1.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1422 = 1.0 + _1420;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1426 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1408);
    int _1428 = _1406 >> 2;
    float _1430 = 1.0 / _1422;
    float _1432 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1424);
    float _1434 = in.m_60.x;
    float _1436 = in.m_60.y;
    float _1438 = in.m_60.z;
    int _1440 = _1428 << 4;
    int _1442 = _1440 + 368;
    float _1444 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1040);
    float _1446 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1432);
    int _1448 = abs(_1322);
    uint _1450 = uint(int(uint(_1442) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    float _1466 = trunc(_1402);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = float(_1396);
    bool _1474 = !_1132;
    int _1476 = _1474 ? 0 : 1;
    bool _1478 = _1130 != 3;
    float _1480 = float(_1448);
    if (_1418)
    {
        float _1482 = _1268 * _1430;
        _125 = _1482;
    }
    float _1484 = _125;
    bool _1486 = !_1478;
    int _1488 = _1486 ? 0 : (-1);
    int _1490 = _1442 + 8;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    uint _1494 = uint(int(uint(int(_1492)) >> uint(2)));
    int _1496 = int(_1492) & 3;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[int(_1494)][_1496];
    int _1500 = int(_1492) + 1;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    int _1504 = _1500 & 3;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[int(_1502)][_1504];
    bool _1508 = _777 > 0.5;
    float _1510 = _777 + (-0.5);
    float _1512 = _1480 * _1472;
    int _1514 = abs(_1476);
    float _1516 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1518 = int(_1516);
    int _1520 = int(_1348) + int(_1470);
    float _1522 = fma(_1386, _1436, _1436);
    float _1524 = _1512 * (-2.0);
    int _1526 = abs(_1488);
    int _1528 = _825 * _1520;
    int _1530 = _1528 + _1004;
    float _1532 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1522);
    float _1534 = fma(_1524, _1434, _1434);
    float _1536 = fma(_1050, _1524, _1050);
    float _1538 = fma(_1318, _1438, _1438);
    float _1540 = fma(_1398, _1484, _1532);
    float _1542 = _143 + (-0.5);
    bool _1544 = uint(_1530) >= uint(_791);
    int _1546 = ~_1298;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    float _1552 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1534);
    int _1554 = ~_1294;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1540 * 0.15915493667125701904296875;
    float _1562 = fma(_1536, _1484, _1552);
    bool _1564 = !_1544;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = _1560 * 6.283185482025146484375;
    float _1570 = sin(_1568);
    float _1572 = float(uint(_1518));
    float _1574 = _1562 * 0.15915493667125701904296875;
    int _1576 = ~_1520;
    int _1578 = _1576 + _1566;
    int _1580 = _1578 + 1;
    int _1582 = abs(_1266);
    int _1584 = abs(_1518);
    float _1586 = 1.0 / _1572;
    int _1588 = _791 * _1580;
    int _1590 = _1588 + _1004;
    bool _1592 = _143 > 0.5;
    int _1594 = _1558 * as_type<int>(_1464);
    int _1596 = ~_1514;
    int _1598 = _1596 + 1;
    int _1600 = _1598 + 1;
    float _1602 = _785 + (-0.5);
    float _1604 = float(uint(_1584));
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    int _1610 = _1600 * as_type<int>(_1456);
    int _1612 = _1610 + _1594;
    float _1614 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1538);
    int _1616 = ~_1526;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _779 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1624 = _1550 * as_type<int>(_1498);
    int _1626 = _1624 + _1612;
    float _1628 = fma(_1358, _1484, _1614);
    float _1630 = _1574 * 6.283185482025146484375;
    float _1632 = sin(_1630);
    int _1634 = _1620 * as_type<int>(_1506);
    int _1636 = _1634 + _1626;
    float _1638 = _1628 * 0.15915493667125701904296875;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1640;
    int _1644 = ~_1582;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1650;
    float _1654 = _1574 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1658;
    bool _1662 = !_1276;
    float _1664 = _1662 ? (-0.5) : 0.5;
    int _1666 = _1636 * _1648;
    bool _1668 = !_815;
    int _1670 = _1668 ? _1590 : (-1);
    float _1672 = fma(_1652, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1674 = fma(_1660, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1676 = !_1272;
    float _1678 = _1676 ? (-0.5) : 0.5;
    float _1680 = _1638 * 6.283185482025146484375;
    float _1682 = sin(_1680);
    int _1684 = _1670 * _1582;
    int _1686 = _1684 + _1666;
    float _1688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1664);
    float _1690 = _1632 * _1608;
    int _1692 = as_type<int>(_1586) + (-2);
    float _1694 = fma(_1642, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1696 = _787 * _1688;
    float _1698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1678);
    float _1700 = _1638 * 6.283185482025146484375;
    float _1702 = cos(_1700);
    float _1704 = _1656 * _1570;
    float _1706 = _1632 * _1570;
    float _1708 = _1622 * _1698;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1712 = _1710 != 0;
    bool _1714 = _1518 == 0;
    float _1716 = 1.0 / _1604;
    float _1718 = float(uint(_1686));
    float _1720 = -_1704;
    float _1722 = fma(_1682, _1690, _1720);
    float _1724 = -_1690;
    float _1726 = fma(_1682, _1704, _1724);
    float _1728 = as_type<float>(_1692) * _1718;
    int _1730 = abs(_1686);
    float _1732 = _1570 * _1702;
    float _1734 = _1608 * _1702;
    float _1736 = _1702 * _1696;
    float _1738 = _1656 * _1608;
    float _1740 = trunc(_1728);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    float _1746 = _1656 * _1736;
    float _1748 = float(uint(_1730));
    float _1750 = fma(_1682, _1738, _1706);
    int _1752 = as_type<int>(_1716) + (-2);
    float _1754 = -_1696;
    float _1756 = _1682 * _1754;
    float _1758 = fma(_1682, _1706, _1738);
    float _1760 = fma(_1750, _1708, _1746);
    int _1762 = ~_1518;
    int _1764 = _1762 + 1;
    float _1766 = as_type<float>(_1752) * _1748;
    float _1768 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1770 = fma(_1734, _1708, _1756);
    float _1772 = _1632 * _1736;
    int _1774 = ~_1584;
    int _1776 = _1774 + 1;
    float _1778 = fma(_1726, _1768, _1760);
    float _1780 = trunc(_1766);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1764 * int(_1744);
    int _1788 = _1786 + _1686;
    float _1790 = fma(_1722, _1708, _1772);
    float _1792 = fma(_1732, _1768, _1770);
    float _1794 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1796 = ~_1584;
    int _1798 = _1796 + 1;
    float _1800 = fma(_1758, _1768, _1790);
    float _1802 = float(uint(_1788));
    float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1794);
    float _1806 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1808 = as_type<float>(_1692) * _1802;
    float _1810 = -_1678;
    int _1812 = _1592 ? as_type<int>(_1810) : as_type<int>(_1678);
    float _1814 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1816 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1806);
    int _1818 = _1798 * int(_1784);
    int _1820 = _1818 + _1730;
    bool _1822 = !_1712;
    float _1824 = _1822 ? _1678 : as_type<float>(_1812);
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1828 = trunc(_1808);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    float _1834 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1816);
    float _1836 = float(uint(_1820));
    float _1838 = _1364 + _1826;
    float _1840 = -_1664;
    int _1842 = _1508 ? as_type<int>(_1840) : as_type<int>(_1664);
    float _1844 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    float _1850 = as_type<float>(_1752) * _1836;
    bool _1852 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1854 = isnan(_771);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1368 + _1844;
    bool _1866 = !_1848;
    float _1868 = _1866 ? _1664 : as_type<float>(_1842);
    float _1870 = trunc(_1850);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1878 = _1838 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1882 = _1864 + _1880;
    float _1884 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1886 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1888 = isnan(_771);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_1862;
    float _1900 = _1898 + 1.0;
    int _1902 = int(_1744) + int(_1832);
    float _1904 = _1878 * _1878;
    float _1906 = _1882 * _1882;
    int _1908 = ~_1518;
    int _1910 = _1908 + 1;
    float _1912 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1884);
    float _1914 = _1896 * _1900;
    float _1916 = _1904 + _1906;
    float _1918 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1912);
    float _1920 = _1674 * _1914;
    int _1922 = int(_1784) + int(_1874);
    float _1924 = sqrt(_1916);
    int _1926 = _1910 * _1902;
    int _1928 = _1926 + _1686;
    float _1930 = _1672 * _1914;
    float _1932 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1934 = _1694 * _1914;
    bool _1936 = uint(_1928) >= uint(_1518);
    int _1938 = _1776 * _1922;
    int _1940 = _1938 + _1730;
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1944 = _1376 + _1932;
    bool _1946 = !_1936;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = uint(_1940) >= uint(_1584);
    int _1952 = ~_1902;
    int _1954 = _1952 + _1948;
    int _1956 = _1954 + 1;
    bool _1958 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1960 = _1686 ^ _1518;
    int _1962 = _1518 * _1956;
    int _1964 = _1962 + _1686;
    bool _1966 = !_1950;
    float _1968 = _1966 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _1970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1972 = uint(int(uint(_1960) >> uint(31)));
    bool _1974 = !_1714;
    float _1976 = _1974 ? as_type<float>(_1964) : as_type<float>(0xffffffffu /* nan */);
    int _1978 = ~as_type<int>(_1968);
    int _1980 = _1922 + _1978;
    int _1982 = _1980 + 1;
    int _1984 = ~int(_1972);
    int _1986 = _1984 + 1;
    bool _1988 = _1518 == 0;
    float _1990 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1992 = float(as_type<int>(_1976));
    float _1994 = _1968;
    float _1996 = as_type<float>(_1686);
    float _1998 = as_type<float>(_1972);
    float _2000 = _1942;
    float _2002 = _1976;
    float _2004 = _1868;
    if (!_1958)
    {
        _1994 = _1906;
    }
    float _2006 = _1994;
    float _2008 = _2006;
    if (!_1958)
    {
        _1996 = _1904;
    }
    float _2010 = _1996;
    float _2012 = _2010;
    if (!_1958)
    {
        _1998 = _1838;
    }
    float _2014 = _1998;
    float _2016 = _2014;
    if (!_1958)
    {
        _2000 = _1864;
    }
    float _2018 = _2000;
    int _2020 = _1982 ^ _1986;
    float _2022 = _2018;
    if (!_1958)
    {
        _2002 = _1944;
    }
    float _2024 = _2002;
    bool _2026 = !_1958;
    float _2028 = _2024;
    if (!_2026)
    {
        float _2030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2034 = _1924 + _2032;
        float _2036 = _1944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2038 = rsqrt(_1916);
        float _2040 = _2034 * _2030;
        float _2042 = _2040 * 0.15915493667125701904296875;
        float _2044 = _2042 * 6.283185482025146484375;
        float _2046 = sin(_2044);
        float _2048 = _2042 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = fma(_2046, _2036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2054 = _2038 * _2052;
        float _2056 = _2050 + (-1.0);
        float _2058 = fma(_1878, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2060 = fma(_1882, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2062 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2066 = _2058 + _2064;
        float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2070 = _2060 + _2068;
        float _2072 = fma(_1944, _2050, _2062);
        float _2074 = _2066 * _2066;
        float _2076 = _2070 * _2070;
        _2028 = _2072;
        _2012 = _2074;
        _2008 = _2076;
        _2016 = _2058;
        _2022 = _2060;
    }
    float _2078 = _2028;
    float _2080 = _2012;
    float _2082 = _2008;
    float _2084 = _2016;
    float _2086 = _2022;
    int _2088 = ~_1986;
    int _2090 = _2088 + _2020;
    int _2092 = _2090 + 1;
    float _2094 = fma(_1990, _1992, _1292);
    float _2096 = -_1896;
    float _2098 = _2096 + 1.0;
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2102 = _2078 + _2100;
    bool _2104 = !_1988;
    int _2106 = _2104 ? _2092 : (-1);
    float _2108 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2110 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1930);
    float _2112 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1934);
    float _2114 = float(_2106);
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1920);
    float _2118 = fma(_2102, _2102, _2080);
    float _2120 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2110);
    float _2122 = _1824 + 0.5;
    float _2124 = -_1444;
    float _2126 = fma(_2108, _2114, _2124);
    float _2128 = _2118 + _2082;
    float _2130 = _1868 + (-0.5);
    float _2132 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2116);
    float _2134 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2112);
    float _2136 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2138 = fma(_1990, _2122, _2094);
    float _2140 = sqrt(_2128);
    float _2142 = -_1426;
    float _2144 = _2142 + 1.0;
    float _2146 = -_2108;
    float _2148 = fma(_2146, _2130, _2126);
    float _2150 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2152 = _2134 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2154 = -_1446;
    float _2156 = _2154 + 1.0;
    float _2158 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2160 = -_2144;
    float _2162 = fma(_1824, _2160, _2138);
    float _2164 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2168 = fma(_1868, _2156, _2148);
    out.m_62.x = _2158;
    out.m_62.y = _2164;
    out.m_62.z = _2166;
    bool _2170 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2172 = isnan(_2140);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2178 = _2174 || _2176;
    out.m_64.x = _2162;
    out.m_64.y = _2168;
    float _2180 = _2140;
    float _2182 = _2166;
    float _2184 = _2138;
    if (!_2178)
    {
        _2004 = 1.0;
    }
    float _2186 = _2004;
    bool _2188 = !_2178;
    float _2190 = _2186;
    if (!_2188)
    {
        bool _2192 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2194 = isnan(_2140);
        bool _2196 = _2192 || _2194;
        bool _2198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2200 = _2196 || _2198;
        if (!_2200)
        {
            float _2202 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2204 = _2140 + _2202;
            float _2206 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2208 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2206;
            float _2210 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2212 = _2210 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2214 = 1.0 / _2208;
            float _2216 = _2204 * _2214;
            float _2218 = fma(_2216, _2212, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2190 = _2218;
            _2220 = true;
        }
        else
        {
            bool _2222 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2224 = isnan(_2140);
            bool _2226 = _2222 || _2224;
            bool _2228 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2230 = _2226 || _2228;
            if (!_2230)
            {
                float _2232 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2234 = _2140 + _2232;
                float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2238 = _2236 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2240 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2242 = _2240 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2244 = 1.0 / _2238;
                float _2246 = _2234 * _2244;
                float _2248 = fma(_2246, _2242, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2190 = _2248;
                _2220 = true;
            }
            else
            {
                _2190 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2220 = false;
    float _2250 = _2190;
    float _2252 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2254 = _2078 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2258 = _2084 + _2256;
    float _2260 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2262 = _2086 + _2260;
    float _2264 = fma(_2254, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2266 = fma(_2258, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2268 = fma(_2262, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2264 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2276 = _2266 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2280 = _2268 + _2278;
    float _2282 = _2272 * _2272;
    float _2284 = fma(_2276, _2276, _2282);
    float _2286 = fma(_2280, _2280, _2284);
    float _2288 = rsqrt(_2286);
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2292 = _2276 * _2290;
    float _2294 = _2280 * _2290;
    float _2296 = _2292 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 + _2298;
    float _2302 = sqrt(_2300);
    bool _2304 = _2302 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = _2302 + _2306;
    float _2310 = _2280;
    float _2312 = _2300;
    float _2314 = _2308;
    float _2316 = _2272;
    float _2318 = _2292;
    if (_2304)
    {
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2320;
    }
    float _2322 = _2310;
    if (_2304)
    {
        float _2324 = rsqrt(_2300);
        _2312 = _2324;
    }
    float _2326 = _2312;
    if (_2304)
    {
        float _2328 = _2308 * _2322;
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (_2304)
    {
        float _2332 = _2330 * 0.15915493667125701904296875;
        _2180 = _2332;
    }
    float _2334 = _2180;
    float _2336 = _2288;
    if (_2304)
    {
        float _2338 = _2334 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2336 = _2340;
    }
    float _2342 = _2336;
    float _2344 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2346 = precise::max(0.0, _2344);
    float _2348 = _2322;
    float _2350 = _2346;
    if (_2304)
    {
        float _2352 = _2334 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = -_2290;
    float _2360 = -_2346;
    float _2362 = fma(_2272, _2358, _2360);
    if (!_2304)
    {
        _2316 = _2294;
    }
    float _2364 = _2316;
    float _2366 = _2364;
    if (_2304)
    {
        float _2368 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2368;
    }
    float _2370 = _2350;
    float _2372 = _2342;
    float _2374 = _2370;
    if (_2304)
    {
        float _2376 = fma(_2342, _2370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2376;
    }
    float _2378 = _2182;
    float _2380 = _2378;
    if (!_2304)
    {
        _2372 = _2362;
    }
    float _2382 = _2372;
    float _2384 = _2382;
    float _2386 = _2356;
    if (_2304)
    {
        float _2388 = _2356 + (-1.0);
        _2374 = _2388;
    }
    float _2390 = _2374;
    float _2392 = _2390;
    if (_2304)
    {
        float _2394 = _2326 * _2378;
        _2184 = _2394;
    }
    float _2396 = _2184;
    float _2398 = sqrt(_2286);
    if (_2304)
    {
        float _2400 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2380 = _2400;
    }
    float _2402 = _2380;
    if (_2304)
    {
        float _2404 = _2292 * _2396;
        _2318 = _2404;
    }
    float _2406 = _2318;
    if (!_2304)
    {
        _2392 = _2296;
    }
    float _2408 = _2392;
    float _2410 = _2408;
    if (_2304)
    {
        float _2412 = _2294 * _2396;
        _2366 = _2412;
    }
    float _2414 = _2366;
    if (_2304)
    {
        float _2416 = fma(_2362, _2356, _2402);
        _2384 = _2416;
    }
    float _2418 = _2384;
    if (_2304)
    {
        float _2420 = _2406 * _2406;
        _2410 = _2420;
    }
    float _2422 = _2410;
    if (!_2304)
    {
        _2386 = _2298;
    }
    float _2424 = _2386;
    float _2426 = _2424;
    if (_2304)
    {
        float _2428 = _2414 * _2414;
        _2426 = _2428;
    }
    float _2430 = _2426;
    float _2432 = fma(_2418, _2418, _2422);
    float _2434 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2436 = _2432 + _2430;
    float _2438 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2442 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2440);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2448 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2434);
    float _2450 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2438);
    float _2452 = rsqrt(_2436);
    float _2454 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2456 = -_2444;
    float _2458 = _2456 + 1.0;
    float _2460 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2450);
    float _2462 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2454);
    float _2466 = _2460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2468 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2470 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2464);
    float _2472 = abs(_2458);
    float _2474 = log2(_2472);
    float _2476 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2478 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2468);
    float _2480 = _2470 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2482 = -_2476;
    float _2484 = fma(_2482, _2446, 1.0);
    float _2486 = _2452 * _2406;
    float _2488 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2448);
    float _2490 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2492 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2494 = _2452 * _2418;
    float _2496 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = _2452 * _2414;
    float _2500 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2492);
    float _2502 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2504 = -_2496;
    float _2506 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2504);
    float _2508 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2500);
    float _2512 = log2(_2484);
    float _2514 = -_2498;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2506);
    float _2518 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2520 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2510);
    float _2522 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2524 = fma(_2516, -0.5, 0.5);
    float _2526 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2518);
    float _2528 = fma(_2516, 0.5, 0.5);
    float _2530 = exp2(_2508);
    float _2532 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2522);
    float _2534 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2526);
    float _2536 = _2494 + 1.0;
    float _2538 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2532);
    float _2542 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2534);
    float _2544 = 1.0 / _2520;
    float _2546 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2540);
    float _2548 = fma(_2528, _2538, -0.212114393711090087890625);
    float _2550 = _2512 * 0.693147182464599609375;
    float _2552 = fma(_2528, _2548, 1.570728778839111328125);
    float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2556 = sqrt(_2524);
    float _2558 = -_2494;
    float _2560 = fma(_2530, _2536, _2558);
    float _2562 = fma(_2560, 0.5, 0.5);
    float _2564 = _2542 * _2544;
    float _2566 = _2546 * _2544;
    float _2568 = fma(_2564, 0.5, 0.5);
    float _2570 = fma(_2566, -0.5, 0.5);
    float _2572 = _2556 * 0.636619746685028076171875;
    float3 _6465 = float3(_2568, _2570, _2554);
    float _2574 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6465, float3(0.0), isnan(_6465)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6465, float3(0.0), isnan(_6465)), level(0.0)).x;
    float _2576 = -_2552;
    float _2578 = fma(_2572, _2576, 1.0);
    float3 _6481 = float3(_2568, _2570, _2554);
    float4 _2581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).xyzw;
    float _2583 = _2581.x;
    float _2585 = _2581.y;
    float _2587 = _2581.z;
    float _2589 = _2581.w;
    float2 _6498 = float2(_2578, _2562);
    float3 _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6498, float2(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6498, float2(0.0), isnan(_6498)), level(0.0)).xyz;
    float _2595 = _2593.x;
    float _2597 = _2593.y;
    float _2599 = _2593.z;
    float _2601 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2603 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2605 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2603);
    float _2607 = exp2(_2601);
    float _2609 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2605);
    float _2611 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2609);
    float _2613 = _2611 + _2520;
    out.gl_Position.x = _2542;
    out.gl_Position.y = _2546;
    out.gl_Position.z = _2611;
    out.gl_Position.w = _2520;
    float _2615 = _2613 * 0.5;
    float _2617 = -_2607;
    float _2619 = _2617 + 1.0;
    float _2621 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2623 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2615;
    out.m_66.w = _2520;
    out.m_47.x = _2621;
    float _2625 = _2623 * _2574;
    float _2627 = -_2623;
    float _2629 = _2627 + 1.0;
    float _2631 = _2589 * _2625;
    float _2633 = _2589 * _2629;
    float _2635 = _2599 * _2625;
    float _2637 = fma(_2595, _2631, _2583);
    float _2639 = fma(_2597, _2631, _2585);
    float _2641 = fma(_2589, _2635, _2587);
    out.m_68.x = _2637;
    out.m_68.y = _2639;
    out.m_68.z = _2641;
    out.m_68.w = _2633;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2220 = false;
    bool _761 = false;
    bool _617 = false;
    bool _443 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_103);
        out.gl_Position.z = _2698;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_141);
        out.gl_Position.z = _2767;
    }
    if (_135)
    {
        return out;
    }
    float _143 = in.m_51.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = _147 * _145;
    float _151 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = _151 * 6.283185482025146484375;
    float _155 = floor(_151);
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    float _165 = _153 * 0.15915493667125701904296875;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    bool _171 = !_159;
    int _173 = _171 ? 0 : 1;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = abs(_173);
    bool _181 = !_169;
    int _183 = _181 ? 0 : 1;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = -_155;
    float _189 = _151 + _187;
    int _191 = abs(_183);
    float _193 = float(_179);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_163;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_177, 0.5, 0.5);
    float _205 = abs(_197);
    float _207 = _193 * _205;
    int _209 = abs(_201);
    bool _211 = _189 < 0.5;
    float _213 = float(_211);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_191);
    float _221 = float(_209);
    float _223 = -_213;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = fma(_219, _217, _207);
    float _229 = abs(_225);
    float _231 = fma(_221, _229, _227);
    bool _233 = !_185;
    float _249;
    if (!_233)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_87);
        float _255 = 1.0 / _253;
        float _257 = _121 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _259 + _265;
    bool _269 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_259);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _259 + _293;
    float _297 = 1.0 / _283;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _301 = 1.0 / _291;
    float _303 = 1.0 / _287;
    float _305 = _263 * _297;
    bool _307 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_259);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = _267 * _301;
    bool _327 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _295 * _303;
    bool _349 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_259);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = _337 * _341;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _359 * _369;
    float _383 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_345, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_377, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = _379 * _381;
    float _395 = _383 * _381;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_385, _365, _405);
    float _415 = fma(_387, _365, _407);
    float _417 = fma(_409, _323, _413);
    float _419 = fma(_411, _323, _415);
    float _421 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    bool _425 = !_299;
    float _441;
    if (!_425)
    {
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _429 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_87);
        float _447 = 1.0 / _445;
        float _449 = _121 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = in.m_53.x;
    float _455 = in.m_53.y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _451 + _457;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _481 = 1.0 / _475;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _485 = 1.0 / _479;
    float _487 = _423 * _455;
    bool _489 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _491 = isnan(_451);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = _459 * _481;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _505 = _451 + _503;
    bool _507 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _509 = isnan(_451);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_471;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _523;
    float _527 = _421 * _453;
    float _529 = _517 * _521;
    float _531 = -_517;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = fma(_525, _501, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _545 = _499 * _533;
    float _547 = fma(_537, _501, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _549 = fma(_541, _501, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = _505 * _485;
    float _553 = _543 * _545;
    float _555 = _547 * _545;
    float _557 = _549 * _545;
    float _559 = -_499;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].x, _555);
    float _577 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _579 = fma(_565, _551, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _581 = fma(_569, _551, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _583 = fma(_573, _551, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _585 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].z, _553);
    float _587 = fma(_579, _529, _575);
    float _589 = fma(_581, _529, _577);
    float _591 = fma(_583, _529, _585);
    float _593 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].x, _587);
    float _595 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].z, _591);
    bool _599 = !_483;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_87);
        float _621 = 1.0 / _619;
        float _623 = _121 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = _661 * _683;
    float _689 = -_661;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _649;
    float _695 = _665 * _679;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_695, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = _699 * _693;
    float _705 = _701 * _687;
    float _707 = -_677;
    float _709 = _707 + 1.0;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _625 + _711;
    float _715 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _719 = _645 * _709;
    float _721 = fma(_703, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _723 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_721, _719, _717);
    float _727 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _729 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[117].x, _725);
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _729;
    out.m_55.y = _735;
    out.m_55.z = _731;
    out.m_55.w = _737;
    bool _739 = !_685;
    float _757;
    float _759;
    if (!_739)
    {
        float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _743 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _745 = float(_87);
        float _747 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _749 = _747 * _741;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _745;
        _759 = _755;
        _761 = true;
    }
    else
    {
        float _763 = float(_87);
        float _765 = 1.0 / _763;
        float _767 = _121 * _765;
        _757 = _763;
        _759 = _767;
    }
    _761 = false;
    float _769 = _757;
    float _771 = _759;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _775 = int(_773);
    float _777 = in.m_51.y;
    float _779 = _231 * _527;
    float _781 = _231 * _487;
    float _783 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _785 = in.m_51.z;
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _791 = int(_789);
    float _793 = as_type<float>(int(gl_VertexIndex));
    float _795 = float(_775);
    float _797 = 1.0 / _769;
    float _799 = float(uint(_791));
    float _801 = 1.0 / _795;
    int _803 = ~_791;
    int _805 = _803 + 1;
    float _807 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _809 = ~_791;
    int _811 = _809 + 1;
    float _813 = _785 * 2.0;
    bool _815 = _791 == 0;
    int _817 = ~_791;
    int _819 = _817 + 1;
    float _821 = 1.0 / _799;
    int _823 = ~_791;
    int _825 = _823 + 1;
    float _827 = _801 * _121;
    float _829 = floor(_813);
    int _831 = as_type<int>(_821) + (-2);
    float _833 = trunc(_827);
    int _835 = int(_833);
    float _837 = float(uint(_835));
    float _839 = as_type<float>(_831) * _837;
    float _841 = trunc(_839);
    float _843 = precise::max(_841, 0.0);
    uint _846 = uint(_843);
    int _848 = _805 * int(_846);
    int _850 = _848 + _835;
    float _852 = float(uint(_850));
    float _854 = as_type<float>(_831) * _852;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _858 = _856 != 0;
    float _860 = trunc(_854);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    bool _866 = !_858;
    float _868 = _866 ? 7.345489978790283203125 : 1.0;
    float _870 = _868 * _143;
    float _872 = floor(_870);
    int _874 = int(_846) + int(_864);
    float _876 = float(_791);
    float _878 = float(_835);
    int _880 = _811 * _874;
    int _882 = _880 + _835;
    bool _884 = _878 >= _876;
    bool _886 = isnan(_878);
    bool _888 = _884 || _886;
    bool _890 = isnan(_876);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    bool _896 = uint(_882) >= uint(_791);
    float _898 = trunc(_894);
    int _900 = int(_898);
    float _902 = -_872;
    float _904 = _870 + _902;
    bool _906 = !_896;
    int _908 = _906 ? 0 : (-1);
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _920 = _918 != 0;
    int _922 = ~_874;
    int _924 = _922 + _908;
    int _926 = _924 + 1;
    int _928 = _791 * _926;
    int _930 = _928 + _835;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _934 = _932 != 0;
    bool _936 = !_815;
    int _938 = _936 ? _930 : (-1);
    float _940 = _904 * _876;
    int _942 = ~_900;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    float _948 = _876 * _121;
    bool _950 = !_934;
    int _952 = _950 ? 0 : 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _956 = _954 != 0;
    int _958 = _938 * _946;
    float _960 = _948 * _797;
    int _962 = _791 + (-1);
    float _964 = trunc(_940);
    int _966 = int(_964);
    bool _968 = !_912;
    int _970 = _968 ? 0 : 1;
    int _972 = abs(_952);
    int _974 = _900 * _962;
    int _976 = _974 + _958;
    bool _978 = !_916;
    int _980 = _978 ? 0 : 1;
    int _982 = abs(_970);
    float _984 = trunc(_960);
    int _986 = int(_984);
    int _988 = abs(_980);
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    bool _994 = !_956;
    int _996 = _994 ? 0 : 1;
    int _998 = _976 * _988;
    int _1000 = abs(_992);
    int _1002 = _966 * _972;
    int _1004 = _1002 + _835;
    int _1006 = abs(_996);
    int _1008 = ~_791;
    int _1010 = _1008 + 1;
    int _1012 = _986 * _982;
    int _1014 = _1012 + _998;
    int _1016 = ~_791;
    int _1018 = _1016 + 1;
    int _1020 = _1004 * _1000;
    int _1022 = _1020 + _1014;
    int _1024 = _966 * _1006;
    int _1026 = _1024 + _1022;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1032 = float(uint(_1026));
    float _1034 = -_1028;
    float _1036 = fma(_783, 2.0, _1034);
    float _1038 = _143 + _777;
    float _1040 = fma(_807, -2.0, _1030);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = _771 + _1042;
    float _1046 = as_type<float>(_831) * _1032;
    float _1048 = _1038 + (-1.0);
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1052 = trunc(_1046);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    float _1058 = _143 + _785;
    float _1060 = _1058 + (-1.0);
    int _1062 = _1018 * int(_1056);
    int _1064 = _1062 + _1026;
    float _1066 = float(uint(_1064));
    float _1068 = as_type<float>(_831) * _1066;
    float _1070 = trunc(_1068);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = _777 * 2.0;
    float _1078 = floor(_1076);
    int _1080 = int(_1056) + int(_1074);
    float _1082 = _143 * 2.0;
    int _1084 = _1010 * _1080;
    int _1086 = _1084 + _1026;
    float _1088 = floor(_1082);
    bool _1090 = uint(_1086) >= uint(_791);
    bool _1092 = !_1090;
    int _1094 = _1092 ? 0 : (-1);
    float _1096 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1098 = log2(_1096);
    int _1100 = ~_1080;
    int _1102 = _1100 + _1094;
    int _1104 = _1102 + 1;
    int _1106 = _791 * _1104;
    int _1108 = _1106 + _1026;
    bool _1110 = _1088 > 0.0;
    bool _1112 = _1088 >= 0.0;
    bool _1114 = isnan(_1088);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    bool _1122 = !_815;
    int _1124 = _1122 ? _1108 : (-1);
    int _1126 = _1120 ? 0 : 1;
    float _1128 = _1098 * _121;
    int _1130 = _1124 & 3;
    bool _1132 = _1130 != 0;
    int _1134 = _1124 & 3;
    bool _1136 = _1134 != 0;
    float _1138 = exp2(_1128);
    bool _1140 = uint(_1130) > 1u;
    int _1142 = _1136 ? 0 : 1;
    bool _1144 = _1130 != 3;
    bool _1146 = uint(_1130) >= 2u;
    bool _1148 = _1078 > 0.0;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1150;
    int _1154 = _1146 ? 0 : 1;
    bool _1156 = _1078 >= 0.0;
    bool _1158 = isnan(_1078);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(0.0);
    bool _1164 = _1160 || _1162;
    float _1166 = 1.0 / _1152;
    int _1168 = ~_1142;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    float _1174 = -_1138;
    float _1176 = _1174 + 1.0;
    int _1178 = ~_1126;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1172;
    int _1186 = _1182;
    if (!_1140)
    {
        int _1188 = ~_1142;
        int _1190 = _1188 + 1;
        _1184 = _1190;
    }
    int _1192 = _1184;
    if (!_1110)
    {
        int _1194 = ~_1126;
        int _1196 = _1194 + 1;
        _1186 = _1196;
    }
    int _1198 = _1186;
    int _1200 = _1164 ? 0 : 1;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1204 = _1202 != 0;
    int _1206 = ~_1154;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (_1144)
    {
        int _1214 = ~_1154;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = _1044 * _1166;
    int _1222 = ~_1200;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1230 = _1228 != 0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1238 = _1236 != 0;
    int _1240 = _1226;
    if (!_1148)
    {
        int _1242 = ~_1200;
        int _1244 = _1242 + 1;
        _1240 = _1244;
    }
    int _1246 = _1240;
    float _1248 = in.m_44.x;
    float _1250 = in.m_44.y;
    float _1252 = in.m_44.z;
    bool _1254 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1262 = _1258 || _1260;
    bool _1264 = !_1204;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = _1262 ? _1176 : 0.0;
    int _1270 = as_type<int>(_793) & 1;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>(_793) & 2;
    bool _1276 = _1274 != 0;
    bool _1278 = !_1234;
    int _1280 = _1278 ? 0 : 1;
    bool _1282 = !_1238;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = float(_1246);
    int _1288 = abs(_1284);
    float _1290 = -_121;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1036);
    int _1294 = abs(_1192);
    float _1296 = float(_1288);
    int _1298 = abs(_1218);
    float _1300 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1302 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1304 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1306 = _1296 * _1286;
    float _1308 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1300);
    float _1310 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1302);
    float _1312 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1304);
    float _1314 = float(uint(_1004));
    float _1316 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1308);
    float _1318 = _1306 * (-2.0);
    bool _1320 = !_1230;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = as_type<float>(_831) * _1314;
    float _1326 = _777 + _785;
    bool _1328 = _829 >= 0.0;
    bool _1330 = isnan(_829);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1340 = abs(_1280);
    float _1342 = _1326 + (-1.0);
    float _1344 = trunc(_1324);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    int _1350 = _1336 ? 0 : 1;
    float _1352 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1310);
    bool _1354 = _829 > 0.0;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1358 = fma(_1338, _1318, _1338);
    float _1360 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1312);
    float _1362 = float(_1198);
    float _1364 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = float(_1340);
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1370 = ~_1350;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1378 = _819 * int(_1348);
    int _1380 = _1378 + _1004;
    float _1382 = _1366 * _1362;
    int _1384 = _1124 >> 31;
    float _1386 = _1382 * (-2.0);
    float _1388 = float(uint(_1380));
    int _1390 = _1374;
    if (!_1354)
    {
        int _1392 = ~_1350;
        int _1394 = _1392 + 1;
        _1390 = _1394;
    }
    int _1396 = _1390;
    float _1398 = fma(_1356, _1386, _1356);
    int _1400 = _1384 & 3;
    float _1402 = as_type<float>(_831) * _1388;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1406 = _1124 + _1400;
    float _1408 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1404);
    bool _1410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(1.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1422 = 1.0 + _1420;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1426 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1408);
    int _1428 = _1406 >> 2;
    float _1430 = 1.0 / _1422;
    float _1432 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1424);
    float _1434 = in.m_60.x;
    float _1436 = in.m_60.y;
    float _1438 = in.m_60.z;
    int _1440 = _1428 << 4;
    int _1442 = _1440 + 368;
    float _1444 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1040);
    float _1446 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1432);
    int _1448 = abs(_1322);
    uint _1450 = uint(int(uint(_1442) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    float _1466 = trunc(_1402);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = float(_1396);
    bool _1474 = !_1132;
    int _1476 = _1474 ? 0 : 1;
    bool _1478 = _1130 != 3;
    float _1480 = float(_1448);
    if (_1418)
    {
        float _1482 = _1268 * _1430;
        _125 = _1482;
    }
    float _1484 = _125;
    bool _1486 = !_1478;
    int _1488 = _1486 ? 0 : (-1);
    int _1490 = _1442 + 8;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    uint _1494 = uint(int(uint(int(_1492)) >> uint(2)));
    int _1496 = int(_1492) & 3;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[int(_1494)][_1496];
    int _1500 = int(_1492) + 1;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    int _1504 = _1500 & 3;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[int(_1502)][_1504];
    bool _1508 = _777 > 0.5;
    float _1510 = _777 + (-0.5);
    float _1512 = _1480 * _1472;
    int _1514 = abs(_1476);
    float _1516 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1518 = int(_1516);
    int _1520 = int(_1348) + int(_1470);
    float _1522 = fma(_1386, _1436, _1436);
    float _1524 = _1512 * (-2.0);
    int _1526 = abs(_1488);
    int _1528 = _825 * _1520;
    int _1530 = _1528 + _1004;
    float _1532 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1522);
    float _1534 = fma(_1524, _1434, _1434);
    float _1536 = fma(_1050, _1524, _1050);
    float _1538 = fma(_1318, _1438, _1438);
    float _1540 = fma(_1398, _1484, _1532);
    float _1542 = _143 + (-0.5);
    bool _1544 = uint(_1530) >= uint(_791);
    int _1546 = ~_1298;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    float _1552 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1534);
    int _1554 = ~_1294;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1540 * 0.15915493667125701904296875;
    float _1562 = fma(_1536, _1484, _1552);
    bool _1564 = !_1544;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = _1560 * 6.283185482025146484375;
    float _1570 = sin(_1568);
    float _1572 = float(uint(_1518));
    float _1574 = _1562 * 0.15915493667125701904296875;
    int _1576 = ~_1520;
    int _1578 = _1576 + _1566;
    int _1580 = _1578 + 1;
    int _1582 = abs(_1266);
    int _1584 = abs(_1518);
    float _1586 = 1.0 / _1572;
    int _1588 = _791 * _1580;
    int _1590 = _1588 + _1004;
    bool _1592 = _143 > 0.5;
    int _1594 = _1558 * as_type<int>(_1464);
    int _1596 = ~_1514;
    int _1598 = _1596 + 1;
    int _1600 = _1598 + 1;
    float _1602 = _785 + (-0.5);
    float _1604 = float(uint(_1584));
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    int _1610 = _1600 * as_type<int>(_1456);
    int _1612 = _1610 + _1594;
    float _1614 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1538);
    int _1616 = ~_1526;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _779 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1624 = _1550 * as_type<int>(_1498);
    int _1626 = _1624 + _1612;
    float _1628 = fma(_1358, _1484, _1614);
    float _1630 = _1574 * 6.283185482025146484375;
    float _1632 = sin(_1630);
    int _1634 = _1620 * as_type<int>(_1506);
    int _1636 = _1634 + _1626;
    float _1638 = _1628 * 0.15915493667125701904296875;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1640;
    int _1644 = ~_1582;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1650;
    float _1654 = _1574 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1658;
    bool _1662 = !_1276;
    float _1664 = _1662 ? (-0.5) : 0.5;
    int _1666 = _1636 * _1648;
    bool _1668 = !_815;
    int _1670 = _1668 ? _1590 : (-1);
    float _1672 = fma(_1652, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1674 = fma(_1660, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1676 = !_1272;
    float _1678 = _1676 ? (-0.5) : 0.5;
    float _1680 = _1638 * 6.283185482025146484375;
    float _1682 = sin(_1680);
    int _1684 = _1670 * _1582;
    int _1686 = _1684 + _1666;
    float _1688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1664);
    float _1690 = _1632 * _1608;
    int _1692 = as_type<int>(_1586) + (-2);
    float _1694 = fma(_1642, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1696 = _787 * _1688;
    float _1698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1678);
    float _1700 = _1638 * 6.283185482025146484375;
    float _1702 = cos(_1700);
    float _1704 = _1656 * _1570;
    float _1706 = _1632 * _1570;
    float _1708 = _1622 * _1698;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1712 = _1710 != 0;
    bool _1714 = _1518 == 0;
    float _1716 = 1.0 / _1604;
    float _1718 = float(uint(_1686));
    float _1720 = -_1704;
    float _1722 = fma(_1682, _1690, _1720);
    float _1724 = -_1690;
    float _1726 = fma(_1682, _1704, _1724);
    float _1728 = as_type<float>(_1692) * _1718;
    int _1730 = abs(_1686);
    float _1732 = _1570 * _1702;
    float _1734 = _1608 * _1702;
    float _1736 = _1702 * _1696;
    float _1738 = _1656 * _1608;
    float _1740 = trunc(_1728);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    float _1746 = _1656 * _1736;
    float _1748 = float(uint(_1730));
    float _1750 = fma(_1682, _1738, _1706);
    int _1752 = as_type<int>(_1716) + (-2);
    float _1754 = -_1696;
    float _1756 = _1682 * _1754;
    float _1758 = fma(_1682, _1706, _1738);
    float _1760 = fma(_1750, _1708, _1746);
    int _1762 = ~_1518;
    int _1764 = _1762 + 1;
    float _1766 = as_type<float>(_1752) * _1748;
    float _1768 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1770 = fma(_1734, _1708, _1756);
    float _1772 = _1632 * _1736;
    int _1774 = ~_1584;
    int _1776 = _1774 + 1;
    float _1778 = fma(_1726, _1768, _1760);
    float _1780 = trunc(_1766);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1764 * int(_1744);
    int _1788 = _1786 + _1686;
    float _1790 = fma(_1722, _1708, _1772);
    float _1792 = fma(_1732, _1768, _1770);
    float _1794 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1796 = ~_1584;
    int _1798 = _1796 + 1;
    float _1800 = fma(_1758, _1768, _1790);
    float _1802 = float(uint(_1788));
    float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1794);
    float _1806 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1808 = as_type<float>(_1692) * _1802;
    float _1810 = -_1678;
    int _1812 = _1592 ? as_type<int>(_1810) : as_type<int>(_1678);
    float _1814 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1816 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1806);
    int _1818 = _1798 * int(_1784);
    int _1820 = _1818 + _1730;
    bool _1822 = !_1712;
    float _1824 = _1822 ? _1678 : as_type<float>(_1812);
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1828 = trunc(_1808);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    float _1834 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1816);
    float _1836 = float(uint(_1820));
    float _1838 = _1364 + _1826;
    float _1840 = -_1664;
    int _1842 = _1508 ? as_type<int>(_1840) : as_type<int>(_1664);
    float _1844 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    float _1850 = as_type<float>(_1752) * _1836;
    bool _1852 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1854 = isnan(_771);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1368 + _1844;
    bool _1866 = !_1848;
    float _1868 = _1866 ? _1664 : as_type<float>(_1842);
    float _1870 = trunc(_1850);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1878 = _1838 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1882 = _1864 + _1880;
    float _1884 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1886 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1888 = isnan(_771);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_1862;
    float _1900 = _1898 + 1.0;
    int _1902 = int(_1744) + int(_1832);
    float _1904 = _1878 * _1878;
    float _1906 = _1882 * _1882;
    int _1908 = ~_1518;
    int _1910 = _1908 + 1;
    float _1912 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1884);
    float _1914 = _1896 * _1900;
    float _1916 = _1904 + _1906;
    float _1918 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1912);
    float _1920 = _1674 * _1914;
    int _1922 = int(_1784) + int(_1874);
    float _1924 = sqrt(_1916);
    int _1926 = _1910 * _1902;
    int _1928 = _1926 + _1686;
    float _1930 = _1672 * _1914;
    float _1932 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1934 = _1694 * _1914;
    bool _1936 = uint(_1928) >= uint(_1518);
    int _1938 = _1776 * _1922;
    int _1940 = _1938 + _1730;
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1944 = _1376 + _1932;
    bool _1946 = !_1936;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = uint(_1940) >= uint(_1584);
    int _1952 = ~_1902;
    int _1954 = _1952 + _1948;
    int _1956 = _1954 + 1;
    bool _1958 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1960 = _1686 ^ _1518;
    int _1962 = _1518 * _1956;
    int _1964 = _1962 + _1686;
    bool _1966 = !_1950;
    float _1968 = _1966 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _1970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1972 = uint(int(uint(_1960) >> uint(31)));
    bool _1974 = !_1714;
    float _1976 = _1974 ? as_type<float>(_1964) : as_type<float>(0xffffffffu /* nan */);
    int _1978 = ~as_type<int>(_1968);
    int _1980 = _1922 + _1978;
    int _1982 = _1980 + 1;
    int _1984 = ~int(_1972);
    int _1986 = _1984 + 1;
    bool _1988 = _1518 == 0;
    float _1990 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1992 = float(as_type<int>(_1976));
    float _1994 = _1968;
    float _1996 = as_type<float>(_1686);
    float _1998 = as_type<float>(_1972);
    float _2000 = _1942;
    float _2002 = _1976;
    float _2004 = _1868;
    if (!_1958)
    {
        _1994 = _1906;
    }
    float _2006 = _1994;
    float _2008 = _2006;
    if (!_1958)
    {
        _1996 = _1904;
    }
    float _2010 = _1996;
    float _2012 = _2010;
    if (!_1958)
    {
        _1998 = _1838;
    }
    float _2014 = _1998;
    float _2016 = _2014;
    if (!_1958)
    {
        _2000 = _1864;
    }
    float _2018 = _2000;
    int _2020 = _1982 ^ _1986;
    float _2022 = _2018;
    if (!_1958)
    {
        _2002 = _1944;
    }
    float _2024 = _2002;
    bool _2026 = !_1958;
    float _2028 = _2024;
    if (!_2026)
    {
        float _2030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2034 = _1924 + _2032;
        float _2036 = _1944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2038 = rsqrt(_1916);
        float _2040 = _2034 * _2030;
        float _2042 = _2040 * 0.15915493667125701904296875;
        float _2044 = _2042 * 6.283185482025146484375;
        float _2046 = sin(_2044);
        float _2048 = _2042 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = fma(_2046, _2036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2054 = _2038 * _2052;
        float _2056 = _2050 + (-1.0);
        float _2058 = fma(_1878, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2060 = fma(_1882, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2062 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2066 = _2058 + _2064;
        float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2070 = _2060 + _2068;
        float _2072 = fma(_1944, _2050, _2062);
        float _2074 = _2066 * _2066;
        float _2076 = _2070 * _2070;
        _2028 = _2072;
        _2012 = _2074;
        _2008 = _2076;
        _2016 = _2058;
        _2022 = _2060;
    }
    float _2078 = _2028;
    float _2080 = _2012;
    float _2082 = _2008;
    float _2084 = _2016;
    float _2086 = _2022;
    int _2088 = ~_1986;
    int _2090 = _2088 + _2020;
    int _2092 = _2090 + 1;
    float _2094 = fma(_1990, _1992, _1292);
    float _2096 = -_1896;
    float _2098 = _2096 + 1.0;
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2102 = _2078 + _2100;
    bool _2104 = !_1988;
    int _2106 = _2104 ? _2092 : (-1);
    float _2108 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2110 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1930);
    float _2112 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1934);
    float _2114 = float(_2106);
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1920);
    float _2118 = fma(_2102, _2102, _2080);
    float _2120 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2110);
    float _2122 = _1824 + 0.5;
    float _2124 = -_1444;
    float _2126 = fma(_2108, _2114, _2124);
    float _2128 = _2118 + _2082;
    float _2130 = _1868 + (-0.5);
    float _2132 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2116);
    float _2134 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2112);
    float _2136 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2138 = fma(_1990, _2122, _2094);
    float _2140 = sqrt(_2128);
    float _2142 = -_1426;
    float _2144 = _2142 + 1.0;
    float _2146 = -_2108;
    float _2148 = fma(_2146, _2130, _2126);
    float _2150 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2152 = _2134 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2154 = -_1446;
    float _2156 = _2154 + 1.0;
    float _2158 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2160 = -_2144;
    float _2162 = fma(_1824, _2160, _2138);
    float _2164 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2168 = fma(_1868, _2156, _2148);
    out.m_62.x = _2158;
    out.m_62.y = _2164;
    out.m_62.z = _2166;
    bool _2170 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2172 = isnan(_2140);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2178 = _2174 || _2176;
    out.m_64.x = _2162;
    out.m_64.y = _2168;
    float _2180 = _2140;
    float _2182 = _2166;
    float _2184 = _2138;
    if (!_2178)
    {
        _2004 = 1.0;
    }
    float _2186 = _2004;
    bool _2188 = !_2178;
    float _2190 = _2186;
    if (!_2188)
    {
        bool _2192 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2194 = isnan(_2140);
        bool _2196 = _2192 || _2194;
        bool _2198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2200 = _2196 || _2198;
        if (!_2200)
        {
            float _2202 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2204 = _2140 + _2202;
            float _2206 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2208 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2206;
            float _2210 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2212 = _2210 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2214 = 1.0 / _2208;
            float _2216 = _2204 * _2214;
            float _2218 = fma(_2216, _2212, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2190 = _2218;
            _2220 = true;
        }
        else
        {
            bool _2222 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2224 = isnan(_2140);
            bool _2226 = _2222 || _2224;
            bool _2228 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2230 = _2226 || _2228;
            if (!_2230)
            {
                float _2232 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2234 = _2140 + _2232;
                float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2238 = _2236 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2240 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2242 = _2240 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2244 = 1.0 / _2238;
                float _2246 = _2234 * _2244;
                float _2248 = fma(_2246, _2242, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2190 = _2248;
                _2220 = true;
            }
            else
            {
                _2190 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2220 = false;
    float _2250 = _2190;
    float _2252 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2254 = _2078 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2258 = _2084 + _2256;
    float _2260 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2262 = _2086 + _2260;
    float _2264 = fma(_2254, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2266 = fma(_2258, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2268 = fma(_2262, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2264 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2276 = _2266 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2280 = _2268 + _2278;
    float _2282 = _2272 * _2272;
    float _2284 = fma(_2276, _2276, _2282);
    float _2286 = fma(_2280, _2280, _2284);
    float _2288 = rsqrt(_2286);
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2292 = _2276 * _2290;
    float _2294 = _2280 * _2290;
    float _2296 = _2292 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 + _2298;
    float _2302 = sqrt(_2300);
    bool _2304 = _2302 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = _2302 + _2306;
    float _2310 = _2280;
    float _2312 = _2300;
    float _2314 = _2308;
    float _2316 = _2272;
    float _2318 = _2292;
    if (_2304)
    {
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2320;
    }
    float _2322 = _2310;
    if (_2304)
    {
        float _2324 = rsqrt(_2300);
        _2312 = _2324;
    }
    float _2326 = _2312;
    if (_2304)
    {
        float _2328 = _2308 * _2322;
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (_2304)
    {
        float _2332 = _2330 * 0.15915493667125701904296875;
        _2180 = _2332;
    }
    float _2334 = _2180;
    float _2336 = _2288;
    if (_2304)
    {
        float _2338 = _2334 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2336 = _2340;
    }
    float _2342 = _2336;
    float _2344 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2346 = precise::max(0.0, _2344);
    float _2348 = _2322;
    float _2350 = _2346;
    if (_2304)
    {
        float _2352 = _2334 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = -_2290;
    float _2360 = -_2346;
    float _2362 = fma(_2272, _2358, _2360);
    if (!_2304)
    {
        _2316 = _2294;
    }
    float _2364 = _2316;
    float _2366 = _2364;
    if (_2304)
    {
        float _2368 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2368;
    }
    float _2370 = _2350;
    float _2372 = _2342;
    float _2374 = _2370;
    if (_2304)
    {
        float _2376 = fma(_2342, _2370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2376;
    }
    float _2378 = _2182;
    float _2380 = _2378;
    if (!_2304)
    {
        _2372 = _2362;
    }
    float _2382 = _2372;
    float _2384 = _2382;
    float _2386 = _2356;
    if (_2304)
    {
        float _2388 = _2356 + (-1.0);
        _2374 = _2388;
    }
    float _2390 = _2374;
    float _2392 = _2390;
    if (_2304)
    {
        float _2394 = _2326 * _2378;
        _2184 = _2394;
    }
    float _2396 = _2184;
    float _2398 = sqrt(_2286);
    if (_2304)
    {
        float _2400 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2380 = _2400;
    }
    float _2402 = _2380;
    if (_2304)
    {
        float _2404 = _2292 * _2396;
        _2318 = _2404;
    }
    float _2406 = _2318;
    if (!_2304)
    {
        _2392 = _2296;
    }
    float _2408 = _2392;
    float _2410 = _2408;
    if (_2304)
    {
        float _2412 = _2294 * _2396;
        _2366 = _2412;
    }
    float _2414 = _2366;
    if (_2304)
    {
        float _2416 = fma(_2362, _2356, _2402);
        _2384 = _2416;
    }
    float _2418 = _2384;
    if (_2304)
    {
        float _2420 = _2406 * _2406;
        _2410 = _2420;
    }
    float _2422 = _2410;
    if (!_2304)
    {
        _2386 = _2298;
    }
    float _2424 = _2386;
    float _2426 = _2424;
    if (_2304)
    {
        float _2428 = _2414 * _2414;
        _2426 = _2428;
    }
    float _2430 = _2426;
    float _2432 = fma(_2418, _2418, _2422);
    float _2434 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2436 = _2432 + _2430;
    float _2438 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2442 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2440);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2448 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2434);
    float _2450 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2438);
    float _2452 = rsqrt(_2436);
    float _2454 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2456 = -_2444;
    float _2458 = _2456 + 1.0;
    float _2460 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2450);
    float _2462 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2454);
    float _2466 = _2460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2468 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2470 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2464);
    float _2472 = abs(_2458);
    float _2474 = log2(_2472);
    float _2476 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2478 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2468);
    float _2480 = _2470 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2482 = -_2476;
    float _2484 = fma(_2482, _2446, 1.0);
    float _2486 = _2452 * _2406;
    float _2488 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2448);
    float _2490 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2492 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2494 = _2452 * _2418;
    float _2496 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = _2452 * _2414;
    float _2500 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2492);
    float _2502 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2504 = -_2496;
    float _2506 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2504);
    float _2508 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2500);
    float _2512 = log2(_2484);
    float _2514 = -_2498;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2506);
    float _2518 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2520 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2510);
    float _2522 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2524 = fma(_2516, -0.5, 0.5);
    float _2526 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2518);
    float _2528 = fma(_2516, 0.5, 0.5);
    float _2530 = exp2(_2508);
    float _2532 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2522);
    float _2534 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2526);
    float _2536 = _2494 + 1.0;
    float _2538 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2532);
    float _2542 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2534);
    float _2544 = 1.0 / _2520;
    float _2546 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2540);
    float _2548 = fma(_2528, _2538, -0.212114393711090087890625);
    float _2550 = _2512 * 0.693147182464599609375;
    float _2552 = fma(_2528, _2548, 1.570728778839111328125);
    float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2556 = sqrt(_2524);
    float _2558 = -_2494;
    float _2560 = fma(_2530, _2536, _2558);
    float _2562 = fma(_2560, 0.5, 0.5);
    float _2564 = _2542 * _2544;
    float _2566 = _2546 * _2544;
    float _2568 = fma(_2564, 0.5, 0.5);
    float _2570 = fma(_2566, -0.5, 0.5);
    float _2572 = _2556 * 0.636619746685028076171875;
    float3 _6465 = float3(_2568, _2570, _2554);
    float _2574 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6465, float3(0.0), isnan(_6465)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6465, float3(0.0), isnan(_6465)), level(0.0)).x;
    float _2576 = -_2552;
    float _2578 = fma(_2572, _2576, 1.0);
    float3 _6481 = float3(_2568, _2570, _2554);
    float4 _2581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).xyzw;
    float _2583 = _2581.x;
    float _2585 = _2581.y;
    float _2587 = _2581.z;
    float _2589 = _2581.w;
    float2 _6498 = float2(_2578, _2562);
    float3 _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6498, float2(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6498, float2(0.0), isnan(_6498)), level(0.0)).xyz;
    float _2595 = _2593.x;
    float _2597 = _2593.y;
    float _2599 = _2593.z;
    float _2601 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2603 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2605 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2603);
    float _2607 = exp2(_2601);
    float _2609 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2605);
    float _2611 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2609);
    float _2613 = _2611 + _2520;
    out.gl_Position.x = _2542;
    out.gl_Position.y = _2546;
    out.gl_Position.z = _2611;
    out.gl_Position.w = _2520;
    float _2615 = _2613 * 0.5;
    float _2617 = -_2607;
    float _2619 = _2617 + 1.0;
    float _2621 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2623 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2615;
    out.m_66.w = _2520;
    out.m_47.x = _2621;
    float _2625 = _2623 * _2574;
    float _2627 = -_2623;
    float _2629 = _2627 + 1.0;
    float _2631 = _2589 * _2625;
    float _2633 = _2589 * _2629;
    float _2635 = _2599 * _2625;
    float _2637 = fma(_2595, _2631, _2583);
    float _2639 = fma(_2597, _2631, _2585);
    float _2641 = fma(_2589, _2635, _2587);
    out.m_68.x = _2637;
    out.m_68.y = _2639;
    out.m_68.z = _2641;
    out.m_68.w = _2633;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2220 = false;
    bool _761 = false;
    bool _617 = false;
    bool _443 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_103);
        out.gl_Position.z = _2698;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_141);
        out.gl_Position.z = _2767;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_51.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = _147 * _145;
    float _151 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = _151 * 6.283185482025146484375;
    float _155 = floor(_151);
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    float _165 = _153 * 0.15915493667125701904296875;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    bool _171 = !_159;
    int _173 = _171 ? 0 : 1;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = abs(_173);
    bool _181 = !_169;
    int _183 = _181 ? 0 : 1;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = -_155;
    float _189 = _151 + _187;
    int _191 = abs(_183);
    float _193 = float(_179);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_163;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_177, 0.5, 0.5);
    float _205 = abs(_197);
    float _207 = _193 * _205;
    int _209 = abs(_201);
    bool _211 = _189 < 0.5;
    float _213 = float(_211);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_191);
    float _221 = float(_209);
    float _223 = -_213;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = fma(_219, _217, _207);
    float _229 = abs(_225);
    float _231 = fma(_221, _229, _227);
    bool _233 = !_185;
    float _249;
    if (!_233)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_87);
        float _255 = 1.0 / _253;
        float _257 = _121 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _259 + _265;
    bool _269 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_259);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _259 + _293;
    float _297 = 1.0 / _283;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _301 = 1.0 / _291;
    float _303 = 1.0 / _287;
    float _305 = _263 * _297;
    bool _307 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_259);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = _267 * _301;
    bool _327 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _295 * _303;
    bool _349 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_259);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = _337 * _341;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _359 * _369;
    float _383 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_345, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_377, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = _379 * _381;
    float _395 = _383 * _381;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_385, _365, _405);
    float _415 = fma(_387, _365, _407);
    float _417 = fma(_409, _323, _413);
    float _419 = fma(_411, _323, _415);
    float _421 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    bool _425 = !_299;
    float _441;
    if (!_425)
    {
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _429 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_87);
        float _447 = 1.0 / _445;
        float _449 = _121 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = in.m_53.x;
    float _455 = in.m_53.y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _451 + _457;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _481 = 1.0 / _475;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _485 = 1.0 / _479;
    float _487 = _423 * _455;
    bool _489 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _491 = isnan(_451);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = _459 * _481;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _505 = _451 + _503;
    bool _507 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _509 = isnan(_451);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_471;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _523;
    float _527 = _421 * _453;
    float _529 = _517 * _521;
    float _531 = -_517;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = fma(_525, _501, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _545 = _499 * _533;
    float _547 = fma(_537, _501, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _549 = fma(_541, _501, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = _505 * _485;
    float _553 = _543 * _545;
    float _555 = _547 * _545;
    float _557 = _549 * _545;
    float _559 = -_499;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].x, _555);
    float _577 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _579 = fma(_565, _551, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _581 = fma(_569, _551, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _583 = fma(_573, _551, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _585 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[107].z, _553);
    float _587 = fma(_579, _529, _575);
    float _589 = fma(_581, _529, _577);
    float _591 = fma(_583, _529, _585);
    float _593 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].x, _587);
    float _595 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[109].z, _591);
    bool _599 = !_483;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_87);
        float _621 = 1.0 / _619;
        float _623 = _121 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = _661 * _683;
    float _689 = -_661;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _649;
    float _695 = _665 * _679;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_695, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = _699 * _693;
    float _705 = _701 * _687;
    float _707 = -_677;
    float _709 = _707 + 1.0;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _625 + _711;
    float _715 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _719 = _645 * _709;
    float _721 = fma(_703, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _723 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_721, _719, _717);
    float _727 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _729 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[117].x, _725);
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _729;
    out.m_55.y = _735;
    out.m_55.z = _731;
    out.m_55.w = _737;
    bool _739 = !_685;
    float _757;
    float _759;
    if (!_739)
    {
        float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _743 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _745 = float(_87);
        float _747 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _749 = _747 * _741;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _745;
        _759 = _755;
        _761 = true;
    }
    else
    {
        float _763 = float(_87);
        float _765 = 1.0 / _763;
        float _767 = _121 * _765;
        _757 = _763;
        _759 = _767;
    }
    _761 = false;
    float _769 = _757;
    float _771 = _759;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _775 = int(_773);
    float _777 = in.m_51.y;
    float _779 = _231 * _527;
    float _781 = _231 * _487;
    float _783 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _785 = in.m_51.z;
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _791 = int(_789);
    float _793 = as_type<float>(int(gl_VertexIndex));
    float _795 = float(_775);
    float _797 = 1.0 / _769;
    float _799 = float(uint(_791));
    float _801 = 1.0 / _795;
    int _803 = ~_791;
    int _805 = _803 + 1;
    float _807 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _809 = ~_791;
    int _811 = _809 + 1;
    float _813 = _785 * 2.0;
    bool _815 = _791 == 0;
    int _817 = ~_791;
    int _819 = _817 + 1;
    float _821 = 1.0 / _799;
    int _823 = ~_791;
    int _825 = _823 + 1;
    float _827 = _801 * _121;
    float _829 = floor(_813);
    int _831 = as_type<int>(_821) + (-2);
    float _833 = trunc(_827);
    int _835 = int(_833);
    float _837 = float(uint(_835));
    float _839 = as_type<float>(_831) * _837;
    float _841 = trunc(_839);
    float _843 = precise::max(_841, 0.0);
    uint _846 = uint(_843);
    int _848 = _805 * int(_846);
    int _850 = _848 + _835;
    float _852 = float(uint(_850));
    float _854 = as_type<float>(_831) * _852;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _858 = _856 != 0;
    float _860 = trunc(_854);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    bool _866 = !_858;
    float _868 = _866 ? 7.345489978790283203125 : 1.0;
    float _870 = _868 * _143;
    float _872 = floor(_870);
    int _874 = int(_846) + int(_864);
    float _876 = float(_791);
    float _878 = float(_835);
    int _880 = _811 * _874;
    int _882 = _880 + _835;
    bool _884 = _878 >= _876;
    bool _886 = isnan(_878);
    bool _888 = _884 || _886;
    bool _890 = isnan(_876);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    bool _896 = uint(_882) >= uint(_791);
    float _898 = trunc(_894);
    int _900 = int(_898);
    float _902 = -_872;
    float _904 = _870 + _902;
    bool _906 = !_896;
    int _908 = _906 ? 0 : (-1);
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _920 = _918 != 0;
    int _922 = ~_874;
    int _924 = _922 + _908;
    int _926 = _924 + 1;
    int _928 = _791 * _926;
    int _930 = _928 + _835;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _934 = _932 != 0;
    bool _936 = !_815;
    int _938 = _936 ? _930 : (-1);
    float _940 = _904 * _876;
    int _942 = ~_900;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    float _948 = _876 * _121;
    bool _950 = !_934;
    int _952 = _950 ? 0 : 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _956 = _954 != 0;
    int _958 = _938 * _946;
    float _960 = _948 * _797;
    int _962 = _791 + (-1);
    float _964 = trunc(_940);
    int _966 = int(_964);
    bool _968 = !_912;
    int _970 = _968 ? 0 : 1;
    int _972 = abs(_952);
    int _974 = _900 * _962;
    int _976 = _974 + _958;
    bool _978 = !_916;
    int _980 = _978 ? 0 : 1;
    int _982 = abs(_970);
    float _984 = trunc(_960);
    int _986 = int(_984);
    int _988 = abs(_980);
    bool _990 = !_920;
    int _992 = _990 ? 0 : 1;
    bool _994 = !_956;
    int _996 = _994 ? 0 : 1;
    int _998 = _976 * _988;
    int _1000 = abs(_992);
    int _1002 = _966 * _972;
    int _1004 = _1002 + _835;
    int _1006 = abs(_996);
    int _1008 = ~_791;
    int _1010 = _1008 + 1;
    int _1012 = _986 * _982;
    int _1014 = _1012 + _998;
    int _1016 = ~_791;
    int _1018 = _1016 + 1;
    int _1020 = _1004 * _1000;
    int _1022 = _1020 + _1014;
    int _1024 = _966 * _1006;
    int _1026 = _1024 + _1022;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1032 = float(uint(_1026));
    float _1034 = -_1028;
    float _1036 = fma(_783, 2.0, _1034);
    float _1038 = _143 + _777;
    float _1040 = fma(_807, -2.0, _1030);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = _771 + _1042;
    float _1046 = as_type<float>(_831) * _1032;
    float _1048 = _1038 + (-1.0);
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1052 = trunc(_1046);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    float _1058 = _143 + _785;
    float _1060 = _1058 + (-1.0);
    int _1062 = _1018 * int(_1056);
    int _1064 = _1062 + _1026;
    float _1066 = float(uint(_1064));
    float _1068 = as_type<float>(_831) * _1066;
    float _1070 = trunc(_1068);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = _777 * 2.0;
    float _1078 = floor(_1076);
    int _1080 = int(_1056) + int(_1074);
    float _1082 = _143 * 2.0;
    int _1084 = _1010 * _1080;
    int _1086 = _1084 + _1026;
    float _1088 = floor(_1082);
    bool _1090 = uint(_1086) >= uint(_791);
    bool _1092 = !_1090;
    int _1094 = _1092 ? 0 : (-1);
    float _1096 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1098 = log2(_1096);
    int _1100 = ~_1080;
    int _1102 = _1100 + _1094;
    int _1104 = _1102 + 1;
    int _1106 = _791 * _1104;
    int _1108 = _1106 + _1026;
    bool _1110 = _1088 > 0.0;
    bool _1112 = _1088 >= 0.0;
    bool _1114 = isnan(_1088);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    bool _1122 = !_815;
    int _1124 = _1122 ? _1108 : (-1);
    int _1126 = _1120 ? 0 : 1;
    float _1128 = _1098 * _121;
    int _1130 = _1124 & 3;
    bool _1132 = _1130 != 0;
    int _1134 = _1124 & 3;
    bool _1136 = _1134 != 0;
    float _1138 = exp2(_1128);
    bool _1140 = uint(_1130) > 1u;
    int _1142 = _1136 ? 0 : 1;
    bool _1144 = _1130 != 3;
    bool _1146 = uint(_1130) >= 2u;
    bool _1148 = _1078 > 0.0;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1150;
    int _1154 = _1146 ? 0 : 1;
    bool _1156 = _1078 >= 0.0;
    bool _1158 = isnan(_1078);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(0.0);
    bool _1164 = _1160 || _1162;
    float _1166 = 1.0 / _1152;
    int _1168 = ~_1142;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    float _1174 = -_1138;
    float _1176 = _1174 + 1.0;
    int _1178 = ~_1126;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1172;
    int _1186 = _1182;
    if (!_1140)
    {
        int _1188 = ~_1142;
        int _1190 = _1188 + 1;
        _1184 = _1190;
    }
    int _1192 = _1184;
    if (!_1110)
    {
        int _1194 = ~_1126;
        int _1196 = _1194 + 1;
        _1186 = _1196;
    }
    int _1198 = _1186;
    int _1200 = _1164 ? 0 : 1;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1204 = _1202 != 0;
    int _1206 = ~_1154;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (_1144)
    {
        int _1214 = ~_1154;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = _1044 * _1166;
    int _1222 = ~_1200;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1230 = _1228 != 0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1238 = _1236 != 0;
    int _1240 = _1226;
    if (!_1148)
    {
        int _1242 = ~_1200;
        int _1244 = _1242 + 1;
        _1240 = _1244;
    }
    int _1246 = _1240;
    float _1248 = in.m_44.x;
    float _1250 = in.m_44.y;
    float _1252 = in.m_44.z;
    bool _1254 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1262 = _1258 || _1260;
    bool _1264 = !_1204;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = _1262 ? _1176 : 0.0;
    int _1270 = as_type<int>(_793) & 1;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>(_793) & 2;
    bool _1276 = _1274 != 0;
    bool _1278 = !_1234;
    int _1280 = _1278 ? 0 : 1;
    bool _1282 = !_1238;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = float(_1246);
    int _1288 = abs(_1284);
    float _1290 = -_121;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1036);
    int _1294 = abs(_1192);
    float _1296 = float(_1288);
    int _1298 = abs(_1218);
    float _1300 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1302 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1304 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1306 = _1296 * _1286;
    float _1308 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1300);
    float _1310 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1302);
    float _1312 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1304);
    float _1314 = float(uint(_1004));
    float _1316 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1308);
    float _1318 = _1306 * (-2.0);
    bool _1320 = !_1230;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = as_type<float>(_831) * _1314;
    float _1326 = _777 + _785;
    bool _1328 = _829 >= 0.0;
    bool _1330 = isnan(_829);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1340 = abs(_1280);
    float _1342 = _1326 + (-1.0);
    float _1344 = trunc(_1324);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    int _1350 = _1336 ? 0 : 1;
    float _1352 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1310);
    bool _1354 = _829 > 0.0;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1358 = fma(_1338, _1318, _1338);
    float _1360 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1312);
    float _1362 = float(_1198);
    float _1364 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = float(_1340);
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1370 = ~_1350;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1378 = _819 * int(_1348);
    int _1380 = _1378 + _1004;
    float _1382 = _1366 * _1362;
    int _1384 = _1124 >> 31;
    float _1386 = _1382 * (-2.0);
    float _1388 = float(uint(_1380));
    int _1390 = _1374;
    if (!_1354)
    {
        int _1392 = ~_1350;
        int _1394 = _1392 + 1;
        _1390 = _1394;
    }
    int _1396 = _1390;
    float _1398 = fma(_1356, _1386, _1356);
    int _1400 = _1384 & 3;
    float _1402 = as_type<float>(_831) * _1388;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1406 = _1124 + _1400;
    float _1408 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1404);
    bool _1410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(1.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1422 = 1.0 + _1420;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1426 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1408);
    int _1428 = _1406 >> 2;
    float _1430 = 1.0 / _1422;
    float _1432 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1424);
    float _1434 = in.m_60.x;
    float _1436 = in.m_60.y;
    float _1438 = in.m_60.z;
    int _1440 = _1428 << 4;
    int _1442 = _1440 + 368;
    float _1444 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1040);
    float _1446 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1432);
    int _1448 = abs(_1322);
    uint _1450 = uint(int(uint(_1442) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    float _1466 = trunc(_1402);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = float(_1396);
    bool _1474 = !_1132;
    int _1476 = _1474 ? 0 : 1;
    bool _1478 = _1130 != 3;
    float _1480 = float(_1448);
    if (_1418)
    {
        float _1482 = _1268 * _1430;
        _125 = _1482;
    }
    float _1484 = _125;
    bool _1486 = !_1478;
    int _1488 = _1486 ? 0 : (-1);
    int _1490 = _1442 + 8;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    uint _1494 = uint(int(uint(int(_1492)) >> uint(2)));
    int _1496 = int(_1492) & 3;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[int(_1494)][_1496];
    int _1500 = int(_1492) + 1;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    int _1504 = _1500 & 3;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[int(_1502)][_1504];
    bool _1508 = _777 > 0.5;
    float _1510 = _777 + (-0.5);
    float _1512 = _1480 * _1472;
    int _1514 = abs(_1476);
    float _1516 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1518 = int(_1516);
    int _1520 = int(_1348) + int(_1470);
    float _1522 = fma(_1386, _1436, _1436);
    float _1524 = _1512 * (-2.0);
    int _1526 = abs(_1488);
    int _1528 = _825 * _1520;
    int _1530 = _1528 + _1004;
    float _1532 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1522);
    float _1534 = fma(_1524, _1434, _1434);
    float _1536 = fma(_1050, _1524, _1050);
    float _1538 = fma(_1318, _1438, _1438);
    float _1540 = fma(_1398, _1484, _1532);
    float _1542 = _143 + (-0.5);
    bool _1544 = uint(_1530) >= uint(_791);
    int _1546 = ~_1298;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    float _1552 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1534);
    int _1554 = ~_1294;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1540 * 0.15915493667125701904296875;
    float _1562 = fma(_1536, _1484, _1552);
    bool _1564 = !_1544;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = _1560 * 6.283185482025146484375;
    float _1570 = sin(_1568);
    float _1572 = float(uint(_1518));
    float _1574 = _1562 * 0.15915493667125701904296875;
    int _1576 = ~_1520;
    int _1578 = _1576 + _1566;
    int _1580 = _1578 + 1;
    int _1582 = abs(_1266);
    int _1584 = abs(_1518);
    float _1586 = 1.0 / _1572;
    int _1588 = _791 * _1580;
    int _1590 = _1588 + _1004;
    bool _1592 = _143 > 0.5;
    int _1594 = _1558 * as_type<int>(_1464);
    int _1596 = ~_1514;
    int _1598 = _1596 + 1;
    int _1600 = _1598 + 1;
    float _1602 = _785 + (-0.5);
    float _1604 = float(uint(_1584));
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    int _1610 = _1600 * as_type<int>(_1456);
    int _1612 = _1610 + _1594;
    float _1614 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1538);
    int _1616 = ~_1526;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _779 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1624 = _1550 * as_type<int>(_1498);
    int _1626 = _1624 + _1612;
    float _1628 = fma(_1358, _1484, _1614);
    float _1630 = _1574 * 6.283185482025146484375;
    float _1632 = sin(_1630);
    int _1634 = _1620 * as_type<int>(_1506);
    int _1636 = _1634 + _1626;
    float _1638 = _1628 * 0.15915493667125701904296875;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1640;
    int _1644 = ~_1582;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1650;
    float _1654 = _1574 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1658;
    bool _1662 = !_1276;
    float _1664 = _1662 ? (-0.5) : 0.5;
    int _1666 = _1636 * _1648;
    bool _1668 = !_815;
    int _1670 = _1668 ? _1590 : (-1);
    float _1672 = fma(_1652, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1674 = fma(_1660, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1676 = !_1272;
    float _1678 = _1676 ? (-0.5) : 0.5;
    float _1680 = _1638 * 6.283185482025146484375;
    float _1682 = sin(_1680);
    int _1684 = _1670 * _1582;
    int _1686 = _1684 + _1666;
    float _1688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1664);
    float _1690 = _1632 * _1608;
    int _1692 = as_type<int>(_1586) + (-2);
    float _1694 = fma(_1642, _1220, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1696 = _787 * _1688;
    float _1698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1678);
    float _1700 = _1638 * 6.283185482025146484375;
    float _1702 = cos(_1700);
    float _1704 = _1656 * _1570;
    float _1706 = _1632 * _1570;
    float _1708 = _1622 * _1698;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1712 = _1710 != 0;
    bool _1714 = _1518 == 0;
    float _1716 = 1.0 / _1604;
    float _1718 = float(uint(_1686));
    float _1720 = -_1704;
    float _1722 = fma(_1682, _1690, _1720);
    float _1724 = -_1690;
    float _1726 = fma(_1682, _1704, _1724);
    float _1728 = as_type<float>(_1692) * _1718;
    int _1730 = abs(_1686);
    float _1732 = _1570 * _1702;
    float _1734 = _1608 * _1702;
    float _1736 = _1702 * _1696;
    float _1738 = _1656 * _1608;
    float _1740 = trunc(_1728);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    float _1746 = _1656 * _1736;
    float _1748 = float(uint(_1730));
    float _1750 = fma(_1682, _1738, _1706);
    int _1752 = as_type<int>(_1716) + (-2);
    float _1754 = -_1696;
    float _1756 = _1682 * _1754;
    float _1758 = fma(_1682, _1706, _1738);
    float _1760 = fma(_1750, _1708, _1746);
    int _1762 = ~_1518;
    int _1764 = _1762 + 1;
    float _1766 = as_type<float>(_1752) * _1748;
    float _1768 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1770 = fma(_1734, _1708, _1756);
    float _1772 = _1632 * _1736;
    int _1774 = ~_1584;
    int _1776 = _1774 + 1;
    float _1778 = fma(_1726, _1768, _1760);
    float _1780 = trunc(_1766);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1764 * int(_1744);
    int _1788 = _1786 + _1686;
    float _1790 = fma(_1722, _1708, _1772);
    float _1792 = fma(_1732, _1768, _1770);
    float _1794 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1796 = ~_1584;
    int _1798 = _1796 + 1;
    float _1800 = fma(_1758, _1768, _1790);
    float _1802 = float(uint(_1788));
    float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1794);
    float _1806 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1808 = as_type<float>(_1692) * _1802;
    float _1810 = -_1678;
    int _1812 = _1592 ? as_type<int>(_1810) : as_type<int>(_1678);
    float _1814 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1816 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1806);
    int _1818 = _1798 * int(_1784);
    int _1820 = _1818 + _1730;
    bool _1822 = !_1712;
    float _1824 = _1822 ? _1678 : as_type<float>(_1812);
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1828 = trunc(_1808);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    float _1834 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1816);
    float _1836 = float(uint(_1820));
    float _1838 = _1364 + _1826;
    float _1840 = -_1664;
    int _1842 = _1508 ? as_type<int>(_1840) : as_type<int>(_1664);
    float _1844 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    float _1850 = as_type<float>(_1752) * _1836;
    bool _1852 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1854 = isnan(_771);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1368 + _1844;
    bool _1866 = !_1848;
    float _1868 = _1866 ? _1664 : as_type<float>(_1842);
    float _1870 = trunc(_1850);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1878 = _1838 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1882 = _1864 + _1880;
    float _1884 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1886 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1888 = isnan(_771);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_1862;
    float _1900 = _1898 + 1.0;
    int _1902 = int(_1744) + int(_1832);
    float _1904 = _1878 * _1878;
    float _1906 = _1882 * _1882;
    int _1908 = ~_1518;
    int _1910 = _1908 + 1;
    float _1912 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1884);
    float _1914 = _1896 * _1900;
    float _1916 = _1904 + _1906;
    float _1918 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1912);
    float _1920 = _1674 * _1914;
    int _1922 = int(_1784) + int(_1874);
    float _1924 = sqrt(_1916);
    int _1926 = _1910 * _1902;
    int _1928 = _1926 + _1686;
    float _1930 = _1672 * _1914;
    float _1932 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1934 = _1694 * _1914;
    bool _1936 = uint(_1928) >= uint(_1518);
    int _1938 = _1776 * _1922;
    int _1940 = _1938 + _1730;
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1944 = _1376 + _1932;
    bool _1946 = !_1936;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = uint(_1940) >= uint(_1584);
    int _1952 = ~_1902;
    int _1954 = _1952 + _1948;
    int _1956 = _1954 + 1;
    bool _1958 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1960 = _1686 ^ _1518;
    int _1962 = _1518 * _1956;
    int _1964 = _1962 + _1686;
    bool _1966 = !_1950;
    float _1968 = _1966 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _1970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1972 = uint(int(uint(_1960) >> uint(31)));
    bool _1974 = !_1714;
    float _1976 = _1974 ? as_type<float>(_1964) : as_type<float>(0xffffffffu /* nan */);
    int _1978 = ~as_type<int>(_1968);
    int _1980 = _1922 + _1978;
    int _1982 = _1980 + 1;
    int _1984 = ~int(_1972);
    int _1986 = _1984 + 1;
    bool _1988 = _1518 == 0;
    float _1990 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1992 = float(as_type<int>(_1976));
    float _1994 = _1968;
    float _1996 = as_type<float>(_1686);
    float _1998 = as_type<float>(_1972);
    float _2000 = _1942;
    float _2002 = _1976;
    float _2004 = _1868;
    if (!_1958)
    {
        _1994 = _1906;
    }
    float _2006 = _1994;
    float _2008 = _2006;
    if (!_1958)
    {
        _1996 = _1904;
    }
    float _2010 = _1996;
    float _2012 = _2010;
    if (!_1958)
    {
        _1998 = _1838;
    }
    float _2014 = _1998;
    float _2016 = _2014;
    if (!_1958)
    {
        _2000 = _1864;
    }
    float _2018 = _2000;
    int _2020 = _1982 ^ _1986;
    float _2022 = _2018;
    if (!_1958)
    {
        _2002 = _1944;
    }
    float _2024 = _2002;
    bool _2026 = !_1958;
    float _2028 = _2024;
    if (!_2026)
    {
        float _2030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2034 = _1924 + _2032;
        float _2036 = _1944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2038 = rsqrt(_1916);
        float _2040 = _2034 * _2030;
        float _2042 = _2040 * 0.15915493667125701904296875;
        float _2044 = _2042 * 6.283185482025146484375;
        float _2046 = sin(_2044);
        float _2048 = _2042 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = fma(_2046, _2036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2054 = _2038 * _2052;
        float _2056 = _2050 + (-1.0);
        float _2058 = fma(_1878, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2060 = fma(_1882, _2054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2062 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2066 = _2058 + _2064;
        float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2070 = _2060 + _2068;
        float _2072 = fma(_1944, _2050, _2062);
        float _2074 = _2066 * _2066;
        float _2076 = _2070 * _2070;
        _2028 = _2072;
        _2012 = _2074;
        _2008 = _2076;
        _2016 = _2058;
        _2022 = _2060;
    }
    float _2078 = _2028;
    float _2080 = _2012;
    float _2082 = _2008;
    float _2084 = _2016;
    float _2086 = _2022;
    int _2088 = ~_1986;
    int _2090 = _2088 + _2020;
    int _2092 = _2090 + 1;
    float _2094 = fma(_1990, _1992, _1292);
    float _2096 = -_1896;
    float _2098 = _2096 + 1.0;
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2102 = _2078 + _2100;
    bool _2104 = !_1988;
    int _2106 = _2104 ? _2092 : (-1);
    float _2108 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2110 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1930);
    float _2112 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1934);
    float _2114 = float(_2106);
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1920);
    float _2118 = fma(_2102, _2102, _2080);
    float _2120 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2110);
    float _2122 = _1824 + 0.5;
    float _2124 = -_1444;
    float _2126 = fma(_2108, _2114, _2124);
    float _2128 = _2118 + _2082;
    float _2130 = _1868 + (-0.5);
    float _2132 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2116);
    float _2134 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2112);
    float _2136 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2138 = fma(_1990, _2122, _2094);
    float _2140 = sqrt(_2128);
    float _2142 = -_1426;
    float _2144 = _2142 + 1.0;
    float _2146 = -_2108;
    float _2148 = fma(_2146, _2130, _2126);
    float _2150 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2152 = _2134 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2154 = -_1446;
    float _2156 = _2154 + 1.0;
    float _2158 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2160 = -_2144;
    float _2162 = fma(_1824, _2160, _2138);
    float _2164 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2168 = fma(_1868, _2156, _2148);
    out.m_62.x = _2158;
    out.m_62.y = _2164;
    out.m_62.z = _2166;
    bool _2170 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2172 = isnan(_2140);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2178 = _2174 || _2176;
    out.m_64.x = _2162;
    out.m_64.y = _2168;
    float _2180 = _2140;
    float _2182 = _2166;
    float _2184 = _2138;
    if (!_2178)
    {
        _2004 = 1.0;
    }
    float _2186 = _2004;
    bool _2188 = !_2178;
    float _2190 = _2186;
    if (!_2188)
    {
        bool _2192 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2194 = isnan(_2140);
        bool _2196 = _2192 || _2194;
        bool _2198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2200 = _2196 || _2198;
        if (!_2200)
        {
            float _2202 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2204 = _2140 + _2202;
            float _2206 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2208 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2206;
            float _2210 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2212 = _2210 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2214 = 1.0 / _2208;
            float _2216 = _2204 * _2214;
            float _2218 = fma(_2216, _2212, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2190 = _2218;
            _2220 = true;
        }
        else
        {
            bool _2222 = _2140 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2224 = isnan(_2140);
            bool _2226 = _2222 || _2224;
            bool _2228 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2230 = _2226 || _2228;
            if (!_2230)
            {
                float _2232 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2234 = _2140 + _2232;
                float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2238 = _2236 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2240 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2242 = _2240 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2244 = 1.0 / _2238;
                float _2246 = _2234 * _2244;
                float _2248 = fma(_2246, _2242, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2190 = _2248;
                _2220 = true;
            }
            else
            {
                _2190 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2220 = false;
    float _2250 = _2190;
    float _2252 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2254 = _2078 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2258 = _2084 + _2256;
    float _2260 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2262 = _2086 + _2260;
    float _2264 = fma(_2254, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2266 = fma(_2258, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2268 = fma(_2262, _2250, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2264 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2276 = _2266 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2280 = _2268 + _2278;
    float _2282 = _2272 * _2272;
    float _2284 = fma(_2276, _2276, _2282);
    float _2286 = fma(_2280, _2280, _2284);
    float _2288 = rsqrt(_2286);
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2292 = _2276 * _2290;
    float _2294 = _2280 * _2290;
    float _2296 = _2292 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 + _2298;
    float _2302 = sqrt(_2300);
    bool _2304 = _2302 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = _2302 + _2306;
    float _2310 = _2280;
    float _2312 = _2300;
    float _2314 = _2308;
    float _2316 = _2272;
    float _2318 = _2292;
    if (_2304)
    {
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2320;
    }
    float _2322 = _2310;
    if (_2304)
    {
        float _2324 = rsqrt(_2300);
        _2312 = _2324;
    }
    float _2326 = _2312;
    if (_2304)
    {
        float _2328 = _2308 * _2322;
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (_2304)
    {
        float _2332 = _2330 * 0.15915493667125701904296875;
        _2180 = _2332;
    }
    float _2334 = _2180;
    float _2336 = _2288;
    if (_2304)
    {
        float _2338 = _2334 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2336 = _2340;
    }
    float _2342 = _2336;
    float _2344 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2346 = precise::max(0.0, _2344);
    float _2348 = _2322;
    float _2350 = _2346;
    if (_2304)
    {
        float _2352 = _2334 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = -_2290;
    float _2360 = -_2346;
    float _2362 = fma(_2272, _2358, _2360);
    if (!_2304)
    {
        _2316 = _2294;
    }
    float _2364 = _2316;
    float _2366 = _2364;
    if (_2304)
    {
        float _2368 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2368;
    }
    float _2370 = _2350;
    float _2372 = _2342;
    float _2374 = _2370;
    if (_2304)
    {
        float _2376 = fma(_2342, _2370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2376;
    }
    float _2378 = _2182;
    float _2380 = _2378;
    if (!_2304)
    {
        _2372 = _2362;
    }
    float _2382 = _2372;
    float _2384 = _2382;
    float _2386 = _2356;
    if (_2304)
    {
        float _2388 = _2356 + (-1.0);
        _2374 = _2388;
    }
    float _2390 = _2374;
    float _2392 = _2390;
    if (_2304)
    {
        float _2394 = _2326 * _2378;
        _2184 = _2394;
    }
    float _2396 = _2184;
    float _2398 = sqrt(_2286);
    if (_2304)
    {
        float _2400 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2380 = _2400;
    }
    float _2402 = _2380;
    if (_2304)
    {
        float _2404 = _2292 * _2396;
        _2318 = _2404;
    }
    float _2406 = _2318;
    if (!_2304)
    {
        _2392 = _2296;
    }
    float _2408 = _2392;
    float _2410 = _2408;
    if (_2304)
    {
        float _2412 = _2294 * _2396;
        _2366 = _2412;
    }
    float _2414 = _2366;
    if (_2304)
    {
        float _2416 = fma(_2362, _2356, _2402);
        _2384 = _2416;
    }
    float _2418 = _2384;
    if (_2304)
    {
        float _2420 = _2406 * _2406;
        _2410 = _2420;
    }
    float _2422 = _2410;
    if (!_2304)
    {
        _2386 = _2298;
    }
    float _2424 = _2386;
    float _2426 = _2424;
    if (_2304)
    {
        float _2428 = _2414 * _2414;
        _2426 = _2428;
    }
    float _2430 = _2426;
    float _2432 = fma(_2418, _2418, _2422);
    float _2434 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2436 = _2432 + _2430;
    float _2438 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2442 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2440);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2448 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2434);
    float _2450 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2438);
    float _2452 = rsqrt(_2436);
    float _2454 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2456 = -_2444;
    float _2458 = _2456 + 1.0;
    float _2460 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2450);
    float _2462 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2454);
    float _2466 = _2460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2468 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2470 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2464);
    float _2472 = abs(_2458);
    float _2474 = log2(_2472);
    float _2476 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2478 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2468);
    float _2480 = _2470 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2482 = -_2476;
    float _2484 = fma(_2482, _2446, 1.0);
    float _2486 = _2452 * _2406;
    float _2488 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2448);
    float _2490 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2492 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2494 = _2452 * _2418;
    float _2496 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = _2452 * _2414;
    float _2500 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2492);
    float _2502 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2504 = -_2496;
    float _2506 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2504);
    float _2508 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2500);
    float _2512 = log2(_2484);
    float _2514 = -_2498;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2506);
    float _2518 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2520 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2510);
    float _2522 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2524 = fma(_2516, -0.5, 0.5);
    float _2526 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2518);
    float _2528 = fma(_2516, 0.5, 0.5);
    float _2530 = exp2(_2508);
    float _2532 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2522);
    float _2534 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2526);
    float _2536 = _2494 + 1.0;
    float _2538 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2532);
    float _2542 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2534);
    float _2544 = 1.0 / _2520;
    float _2546 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2540);
    float _2548 = fma(_2528, _2538, -0.212114393711090087890625);
    float _2550 = _2512 * 0.693147182464599609375;
    float _2552 = fma(_2528, _2548, 1.570728778839111328125);
    float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2556 = sqrt(_2524);
    float _2558 = -_2494;
    float _2560 = fma(_2530, _2536, _2558);
    float _2562 = fma(_2560, 0.5, 0.5);
    float _2564 = _2542 * _2544;
    float _2566 = _2546 * _2544;
    float _2568 = fma(_2564, 0.5, 0.5);
    float _2570 = fma(_2566, -0.5, 0.5);
    float _2572 = _2556 * 0.636619746685028076171875;
    float3 _6465 = float3(_2568, _2570, _2554);
    float _2574 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6465, float3(0.0), isnan(_6465)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6465, float3(0.0), isnan(_6465)), level(0.0)).x;
    float _2576 = -_2552;
    float _2578 = fma(_2572, _2576, 1.0);
    float3 _6481 = float3(_2568, _2570, _2554);
    float4 _2581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).xyzw;
    float _2583 = _2581.x;
    float _2585 = _2581.y;
    float _2587 = _2581.z;
    float _2589 = _2581.w;
    float2 _6498 = float2(_2578, _2562);
    float3 _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6498, float2(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6498, float2(0.0), isnan(_6498)), level(0.0)).xyz;
    float _2595 = _2593.x;
    float _2597 = _2593.y;
    float _2599 = _2593.z;
    float _2601 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2603 = _2480 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2605 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2603);
    float _2607 = exp2(_2601);
    float _2609 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2605);
    float _2611 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2609);
    float _2613 = _2611 + _2520;
    out.gl_Position.x = _2542;
    out.gl_Position.y = _2546;
    out.gl_Position.z = _2611;
    out.gl_Position.w = _2520;
    float _2615 = _2613 * 0.5;
    float _2617 = -_2607;
    float _2619 = _2617 + 1.0;
    float _2621 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2623 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2615;
    out.m_66.w = _2520;
    out.m_47.x = _2621;
    float _2625 = _2623 * _2574;
    float _2627 = -_2623;
    float _2629 = _2627 + 1.0;
    float _2631 = _2589 * _2625;
    float _2633 = _2589 * _2629;
    float _2635 = _2599 * _2625;
    float _2637 = fma(_2595, _2631, _2583);
    float _2639 = fma(_2597, _2631, _2585);
    float _2641 = fma(_2589, _2635, _2587);
    out.m_68.x = _2637;
    out.m_68.y = _2639;
    out.m_68.z = _2641;
    out.m_68.w = _2633;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

