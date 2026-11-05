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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _439 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_101);
        out.gl_Position.z = _1499;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_137);
        out.gl_Position.z = _1568;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.x;
    float _149 = in.m_54.y;
    float _151 = in.m_54.z;
    float _153 = _143 * _141;
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    int _157 = as_type<int>(_145) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_145) & 2;
    bool _163 = _161 != 0;
    float _165 = floor(_155);
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = _155 * 6.283185482025146484375;
    float _173 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _175 = !_163;
    int _177 = _175 ? (-1090519040) : 1056964608;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = _171 * 0.15915493667125701904296875;
    float _191 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _197 = _189 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    bool _207 = !_159;
    int _209 = _207 ? (-1090519040) : 1056964608;
    float _211 = -_165;
    float _213 = _155 + _211;
    bool _215 = !_169;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    int _221 = abs(_203);
    out.m_56.x = as_type<float>(_209);
    out.m_56.y = as_type<float>(_177);
    int _223 = abs(_217);
    float _225 = -_213;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = float(_221);
    float _233 = fma(_199, 0.5, 0.5);
    bool _235 = !_187;
    int _237 = _235 ? 0 : 1;
    bool _239 = _213 < 0.5;
    float _241 = float(_239);
    float _243 = abs(_227);
    float _245 = _231 * _243;
    int _247 = abs(_237);
    float _249 = -_233;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_223);
    float _255 = -_241;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = float(_247);
    float _261 = fma(_253, _251, _245);
    float _263 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _265 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _267 = abs(_257);
    float _269 = fma(_259, _267, _261);
    bool _271 = !_229;
    float _273 = _219;
    float _275 = _263;
    float _291;
    if (!_271)
    {
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_85);
        float _297 = 1.0 / _295;
        float _299 = _119 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    bool _307 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_301);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _333;
    bool _345 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_301);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _329 * _341;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = _355 * _361;
    float _367 = 1.0 / _337;
    float _369 = -_355;
    float _371 = _369 + 1.0;
    float _373 = _305 * _343;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _301 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = fma(_381, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _389 = fma(_385, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = _377 * _367;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = _387 * _365;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = _389 * _365;
    float _405 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _409 = fma(_401, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _413 = fma(_405, _357, _407);
    float _415 = fma(_409, _357, _411);
    float _417 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    bool _421 = !_363;
    float _437;
    if (!_421)
    {
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _425 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_85);
        float _443 = 1.0 / _441;
        float _445 = _119 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = in.m_58.x;
    float _451 = in.m_58.y;
    float _453 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_177));
    float _455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_209));
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    float _461 = in.m_42.z;
    float _463 = _419 * _451;
    float _465 = _417 * _449;
    float _467 = _269 * _463;
    float _469 = _269 * _465;
    float _471 = _459 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _469 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    float _479 = _473 * _453;
    float _481 = _475 * _455;
    float _483 = _459 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _487 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _489 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _493 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].z, _477);
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[26].x, _487);
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _499 = _459 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[26].z, _495);
    float _503 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _505 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[24].z, _497);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _517 = _505 + _509;
    float _519 = _511 + _515;
    float _521 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _523 = _517 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _519 + _525;
    float _529 = _523 * _523;
    float _531 = fma(_527, _527, _529);
    float _533 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _535 = sqrt(_531);
    float _537 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
    float _539 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].z, _513);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
    float _543 = _539 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _545 = _541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _547 = _543 + _545;
    bool _549 = _535 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = _479;
    float _553 = _485;
    float _555 = _519;
    if (!_549)
    {
        _551 = _517;
    }
    float _557 = _551;
    float _559 = _557;
    if (!_549)
    {
        _553 = _547;
    }
    float _561 = _553;
    bool _563 = !_549;
    float _565 = _561;
    if (!_563)
    {
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _569 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _571 = _535 + _569;
        float _573 = _547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = rsqrt(_531);
        float _577 = _571 * _567;
        float _579 = _577 * 0.15915493667125701904296875;
        float _581 = _579 * 6.283185482025146484375;
        float _583 = cos(_581);
        float _585 = _579 * 6.283185482025146484375;
        float _587 = sin(_585);
        float _589 = _583 + (-1.0);
        float _591 = _589 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = fma(_587, _573, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = fma(_547, _583, _591);
        float _597 = _575 * _593;
        float _599 = fma(_527, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _601 = fma(_523, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _565 = _595;
        _555 = _599;
        _559 = _601;
    }
    float _603 = _565;
    float _605 = _555;
    float _607 = _559;
    float _609 = -_543;
    float _611 = _609 + _603;
    float _613 = -_511;
    float _615 = _613 + _605;
    float _617 = -_505;
    float _619 = _617 + _607;
    float _621 = _543 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _623 = _611 * _611;
    bool _625 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _627 = isnan(0.5);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _633 = _629 || _631;
    float _635 = fma(_615, _615, _623);
    bool _637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _639 = isnan(0.5);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _645 = _641 || _643;
    float _647 = fma(_619, _619, _635);
    float _649 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _621);
    float _651 = _543 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _653 = sqrt(_647);
    float _655 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].z, _649);
    float _657 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _659 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _651);
    float _661 = 1.0 / _657;
    float _663 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].z, _659);
    float _665 = _663 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _667 = _653 > 0.0;
    float _669 = _665 + _657;
    float _671 = _669 * _661;
    float _673 = _671 * 0.5;
    bool _675 = !_667;
    float _677 = _605;
    float _679 = _607;
    float _681 = _603;
    float _683 = _647;
    float _685 = _611;
    if (!_675)
    {
        float _687 = _219 * _219;
        float _689 = fma(_263, _263, _687);
        float _691 = fma(_265, _265, _689);
        float _693 = rsqrt(_647);
        float _695 = sqrt(_691);
        float _697 = _615 * _693;
        float _699 = _611 * _693;
        float _701 = _619 * _693;
        bool _703 = _695 > 0.0;
        bool _705 = !_703;
        if (!_705)
        {
            float _707 = rsqrt(_691);
            float _709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _711 = _219 * _707;
            float _713 = _263 * _707;
            float _715 = _265 * _707;
            float _717 = _699 * _711;
            float _719 = fma(_697, _713, _717);
            float _721 = _709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _723 = fma(_701, _715, _719);
            float _725 = _723 * _721;
            float _727 = fma(_263, _725, _605);
            float _729 = fma(_219, _725, _603);
            float _731 = fma(_265, _725, _607);
            _677 = _727;
            _679 = _731;
            _681 = _729;
            _683 = _713;
        }
    }
    float _733 = _677;
    float _735 = _679;
    float _737 = _681;
    float _739 = _683;
    float _741 = _739;
    float _743 = _735;
    float _745 = _737;
    float _747 = _733;
    if (_645)
    {
        _741 = 1.0;
    }
    float _749 = _741;
    float _751 = _749;
    if (_633)
    {
        _273 = _733;
    }
    float _753 = _273;
    float _755 = _753;
    if (_633)
    {
        _275 = _735;
    }
    float _757 = _275;
    float _759 = _757;
    if (!_633)
    {
        float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _763 = _543 + _761;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _767 = _511 + _765;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _771 = -_505;
        float _773 = _771 + _735;
        float _775 = _763 * _763;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _779 = _505 + _777;
        float _781 = fma(_767, _767, _775);
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _785 = fma(_779, _779, _781);
        float _787 = sqrt(_785);
        float _789 = _769 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _791 = precise::min(_787, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _793 = _791 * _783;
        float _795 = -_511;
        float _797 = _795 + _733;
        float _799 = _789 * _793;
        float _801 = -_543;
        float _803 = _801 + _737;
        float _805 = fma(_797, _799, _511);
        float _807 = fma(_803, _799, _543);
        float _809 = fma(_773, _799, _505);
        _743 = _773;
        _745 = _807;
        _755 = _805;
        _759 = _809;
    }
    float _811 = _743;
    float _813 = _745;
    float _815 = _755;
    float _817 = _759;
    float _819 = _811;
    if (!_645)
    {
        float _821 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _823 = _821 * 0.15915493667125701904296875;
        float _825 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _829 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _827);
        float _831 = _823 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _825 * 0.15915493667125701904296875;
        float _837 = _823 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = 1.0 / _833;
        float _843 = _835 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = _839 * _841;
        float _849 = _835 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = _845 * _847;
        float _855 = 1.0 / _829;
        float _857 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _859 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _857;
        float _861 = 1.0 / _853;
        float _863 = 1.0 / _859;
        float _865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _867 = _855 * _865;
        float _869 = _851 * _861;
        float _871 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _873 = fma(_869, _867, _871);
        float _875 = _873 * _863;
        float _877 = precise::clamp(_875, 0.0, 1.0);
        _819 = _867;
        _747 = _835;
        _751 = _877;
    }
    float _879 = _819;
    float _881 = _747;
    float _883 = _751;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _813 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _815 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _817 + _893;
    float _897 = _887 * _887;
    float _899 = fma(_891, _891, _897);
    float _901 = fma(_895, _895, _899);
    float _903 = rsqrt(_901);
    float _905 = _903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _907 = _891 * _905;
    float _909 = _895 * _905;
    float _911 = _907 * _907;
    float _913 = _909 * _909;
    float _915 = _911 + _913;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = _903;
    float _927 = _915;
    float _929 = _923;
    float _931 = _879;
    float _933 = _887;
    float _935 = _881;
    if (_919)
    {
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _937;
    }
    float _939 = _925;
    if (_919)
    {
        float _941 = rsqrt(_915);
        _927 = _941;
    }
    float _943 = _927;
    float _945 = _943;
    if (_919)
    {
        float _947 = _923 * _939;
        _929 = _947;
    }
    float _949 = _929;
    if (_919)
    {
        float _951 = _949 * 0.15915493667125701904296875;
        _931 = _951;
    }
    float _953 = _931;
    float _955 = _895;
    if (_919)
    {
        float _957 = _953 * 6.283185482025146484375;
        float _959 = sin(_957);
        _955 = _959;
    }
    float _961 = _955;
    float _963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _965 = precise::max(0.0, _963);
    float _967 = _939;
    float _969 = _965;
    if (_919)
    {
        float _971 = _953 * 6.283185482025146484375;
        float _973 = cos(_971);
        _967 = _973;
    }
    float _975 = _967;
    float _977 = -_905;
    float _979 = -_965;
    float _981 = fma(_887, _977, _979);
    if (_919)
    {
        float _983 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _983;
    }
    float _985 = _933;
    float _987 = sqrt(_901);
    float _989 = _985;
    float _991 = _961;
    if (_919)
    {
        float _993 = fma(_961, _985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = _995;
    if (!_919)
    {
        _991 = _907;
    }
    float _999 = _991;
    float _1001 = _999;
    float _1003 = _975;
    if (_919)
    {
        float _1005 = _975 + (-1.0);
        _969 = _1005;
    }
    float _1007 = _969;
    float _1009 = _1007;
    if (_919)
    {
        float _1011 = _943 * _995;
        _685 = _1011;
    }
    float _1013 = _685;
    if (!_919)
    {
        _997 = _981;
    }
    float _1015 = _997;
    float _1017 = _1015;
    if (_919)
    {
        float _1019 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _1019;
    }
    float _1021 = _935;
    if (_919)
    {
        float _1023 = _907 * _1013;
        _1001 = _1023;
    }
    float _1025 = _1001;
    if (!_919)
    {
        _1009 = _909;
    }
    float _1027 = _1009;
    float _1029 = _1027;
    if (_919)
    {
        float _1031 = _909 * _1013;
        _1029 = _1031;
    }
    float _1033 = _1029;
    if (!_919)
    {
        _945 = _911;
    }
    float _1035 = _945;
    float _1037 = _1035;
    if (_919)
    {
        float _1039 = fma(_981, _975, _1021);
        _1017 = _1039;
    }
    float _1041 = _1017;
    if (_919)
    {
        float _1043 = _1025 * _1025;
        _1037 = _1043;
    }
    float _1045 = _1037;
    if (!_919)
    {
        _1003 = _913;
    }
    float _1047 = _1003;
    float _1049 = _1047;
    if (_919)
    {
        float _1051 = _1033 * _1033;
        _1049 = _1051;
    }
    float _1053 = _1049;
    float _1055 = fma(_1041, _1041, _1045);
    float _1057 = _1055 + _1053;
    float _1059 = _813 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1063 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1061);
    float _1065 = precise::clamp(_1063, 0.0, 1.0);
    float _1067 = _813 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1069 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1071 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1059);
    float _1073 = rsqrt(_1057);
    float _1075 = _813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1077 = -_1065;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1083 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1067);
    float _1085 = _813 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1087 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1091 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1083);
    float _1093 = abs(_1079);
    float _1095 = log2(_1093);
    float _1097 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1085);
    float _1101 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1073 * _1025;
    float _1111 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1113 = _1073 * _1041;
    float _1115 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1111);
    float _1121 = _1073 * _1033;
    float _1123 = -_1103;
    float _1125 = fma(_1123, _1069, 1.0);
    float _1127 = -_1117;
    float _1129 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1127);
    float _1131 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1119);
    float _1133 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1135 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1137 = -_1121;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1129);
    float _1141 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1131);
    float _1143 = log2(_1125);
    float _1145 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1147 = fma(_1139, -0.5, 0.5);
    float _1149 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1135);
    float _1151 = fma(_1139, 0.5, 0.5);
    float _1153 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1145);
    float _1155 = _1113 + 1.0;
    float _1157 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1149);
    float _1159 = exp2(_1133);
    float _1161 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1153);
    float _1163 = fma(_1151, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1165 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1157);
    float _1167 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1161);
    float _1169 = fma(_1151, _1163, -0.212114393711090087890625);
    float _1171 = 1.0 / _1141;
    float _1173 = _1143 * 0.693147182464599609375;
    float _1175 = fma(_1151, _1169, 1.570728778839111328125);
    float _1177 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1179 = sqrt(_1147);
    float _1181 = -_1113;
    float _1183 = fma(_1159, _1155, _1181);
    float _1185 = _1167 * _1171;
    float _1187 = _1165 * _1171;
    float _1189 = fma(_1185, 0.5, 0.5);
    float _1191 = fma(_1187, -0.5, 0.5);
    float _1193 = _1179 * 0.636619746685028076171875;
    float _1195 = fma(_1183, 0.5, 0.5);
    float3 _3255 = float3(_1189, _1191, _1177);
    float _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3255, float3(0.0), isnan(_3255)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3255, float3(0.0), isnan(_3255)), level(0.0)).x;
    float _1199 = -_1175;
    float _1201 = fma(_1193, _1199, 1.0);
    float3 _3271 = float3(_1189, _1191, _1177);
    float4 _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3271, float3(0.0), isnan(_3271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3271, float3(0.0), isnan(_3271)), level(0.0)).xyzw;
    float _1206 = _1204.x;
    float _1208 = _1204.y;
    float _1210 = _1204.z;
    float _1212 = _1204.w;
    float2 _3288 = float2(_1201, _1195);
    float3 _1216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3288, float2(0.0), isnan(_3288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3288, float2(0.0), isnan(_3288)), level(0.0)).xyz;
    float _1218 = _1216.x;
    float _1220 = _1216.y;
    float _1222 = _1216.z;
    float _1224 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1226 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1238 = 1.0 / _1230;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1246 = _447 + _1244;
    float _1248 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1226);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1252 = 1.0 / _1234;
    float _1254 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1262 = _447 + _1260;
    float _1264 = _1262 * _1238;
    bool _1266 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1268 = isnan(_447);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    out.m_60.x = _1254;
    out.m_60.y = _1256;
    out.m_60.z = _1258;
    out.m_60.w = _1250;
    bool _1278 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1280 = isnan(_447);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1290;
    float _1294 = exp2(_1224);
    bool _1296 = _883 > 0.0;
    bool _1298 = isnan(_883);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan(0.0);
    bool _1304 = _1300 || _1302;
    float _1306 = _1246 * _1252;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1312;
    float _1316 = fma(_1292, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1318 = fma(_1310, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1320 = fma(_1314, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1322 = -_1276;
    float _1324 = _1322 + 1.0;
    bool _1326 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1328 = isnan(_447);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1346 = _1288 * _1324;
    float _1348 = -_1288;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1340, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1358 = fma(_1344, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1360 = _1336 * _1350;
    float _1362 = -_1336;
    float _1364 = _1362 + 1.0;
    float _1366 = fma(_1356, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1368 = -_1294;
    float _1370 = _1368 + 1.0;
    float _1372 = _1316 * _1360;
    float _1374 = _1318 * _1360;
    float _1376 = _1320 * _1360;
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1372);
    float _1380 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1374);
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1376);
    float _1384 = fma(_1352, _1346, _1378);
    float _1386 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1248);
    float _1388 = fma(_1366, _1346, _1380);
    float _1390 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1384);
    float _1392 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1386);
    float _1394 = fma(_1358, _1346, _1382);
    float _1396 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1388);
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1400 = _1392 + _1141;
    float _1402 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1394);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1406 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1408 = _1400 * 0.5;
    float _1410 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1414 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1424 = -_1410;
    float _1426 = _1424 + 1.0;
    out.gl_Position.x = _1167;
    out.gl_Position.y = _1165;
    out.gl_Position.z = _1392;
    out.gl_Position.w = _1141;
    out.m_62.x = _1416;
    out.m_62.y = _1418;
    out.m_62.z = _1420;
    out.m_62.w = _1404;
    out.m_64.z = _1408;
    out.m_64.w = _1141;
    out.m_45.x = _1422;
    float _1428 = _1410 * _1197;
    float _1430 = _1212 * _1428;
    float _1432 = _1212 * _1426;
    float _1434 = _1222 * _1428;
    float _1436 = fma(_1218, _1430, _1206);
    float _1438 = fma(_1220, _1430, _1208);
    float _1440 = fma(_1212, _1434, _1210);
    out.m_66.x = _1436;
    out.m_66.y = _1438;
    out.m_66.z = _1440;
    out.m_66.w = _1432;
    if (_1304)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1442;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _439 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_101);
        out.gl_Position.z = _1499;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_137);
        out.gl_Position.z = _1568;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.x;
    float _149 = in.m_54.y;
    float _151 = in.m_54.z;
    float _153 = _143 * _141;
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    int _157 = as_type<int>(_145) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_145) & 2;
    bool _163 = _161 != 0;
    float _165 = floor(_155);
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = _155 * 6.283185482025146484375;
    float _173 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _175 = !_163;
    int _177 = _175 ? (-1090519040) : 1056964608;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = _171 * 0.15915493667125701904296875;
    float _191 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _197 = _189 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    bool _207 = !_159;
    int _209 = _207 ? (-1090519040) : 1056964608;
    float _211 = -_165;
    float _213 = _155 + _211;
    bool _215 = !_169;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    int _221 = abs(_203);
    out.m_56.x = as_type<float>(_209);
    out.m_56.y = as_type<float>(_177);
    int _223 = abs(_217);
    float _225 = -_213;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = float(_221);
    float _233 = fma(_199, 0.5, 0.5);
    bool _235 = !_187;
    int _237 = _235 ? 0 : 1;
    bool _239 = _213 < 0.5;
    float _241 = float(_239);
    float _243 = abs(_227);
    float _245 = _231 * _243;
    int _247 = abs(_237);
    float _249 = -_233;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_223);
    float _255 = -_241;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = float(_247);
    float _261 = fma(_253, _251, _245);
    float _263 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _265 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _267 = abs(_257);
    float _269 = fma(_259, _267, _261);
    bool _271 = !_229;
    float _273 = _219;
    float _275 = _263;
    float _291;
    if (!_271)
    {
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_85);
        float _297 = 1.0 / _295;
        float _299 = _119 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    bool _307 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_301);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _333;
    bool _345 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_301);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _329 * _341;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = _355 * _361;
    float _367 = 1.0 / _337;
    float _369 = -_355;
    float _371 = _369 + 1.0;
    float _373 = _305 * _343;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _301 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = fma(_381, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _389 = fma(_385, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = _377 * _367;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = _387 * _365;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = _389 * _365;
    float _405 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _409 = fma(_401, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _413 = fma(_405, _357, _407);
    float _415 = fma(_409, _357, _411);
    float _417 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    bool _421 = !_363;
    float _437;
    if (!_421)
    {
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _425 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_85);
        float _443 = 1.0 / _441;
        float _445 = _119 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = in.m_58.x;
    float _451 = in.m_58.y;
    float _453 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_177));
    float _455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_209));
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    float _461 = in.m_42.z;
    float _463 = _419 * _451;
    float _465 = _417 * _449;
    float _467 = _269 * _463;
    float _469 = _269 * _465;
    float _471 = _459 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _469 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    float _479 = _473 * _453;
    float _481 = _475 * _455;
    float _483 = _459 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _487 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _489 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _493 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].z, _477);
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[26].x, _487);
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _499 = _459 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[26].z, _495);
    float _503 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _505 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[24].z, _497);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _517 = _505 + _509;
    float _519 = _511 + _515;
    float _521 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _523 = _517 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _519 + _525;
    float _529 = _523 * _523;
    float _531 = fma(_527, _527, _529);
    float _533 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _535 = sqrt(_531);
    float _537 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
    float _539 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].z, _513);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
    float _543 = _539 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _545 = _541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _547 = _543 + _545;
    bool _549 = _535 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = _479;
    float _553 = _485;
    float _555 = _519;
    if (!_549)
    {
        _551 = _517;
    }
    float _557 = _551;
    float _559 = _557;
    if (!_549)
    {
        _553 = _547;
    }
    float _561 = _553;
    bool _563 = !_549;
    float _565 = _561;
    if (!_563)
    {
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _569 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _571 = _535 + _569;
        float _573 = _547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = rsqrt(_531);
        float _577 = _571 * _567;
        float _579 = _577 * 0.15915493667125701904296875;
        float _581 = _579 * 6.283185482025146484375;
        float _583 = cos(_581);
        float _585 = _579 * 6.283185482025146484375;
        float _587 = sin(_585);
        float _589 = _583 + (-1.0);
        float _591 = _589 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = fma(_587, _573, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = fma(_547, _583, _591);
        float _597 = _575 * _593;
        float _599 = fma(_527, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _601 = fma(_523, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _565 = _595;
        _555 = _599;
        _559 = _601;
    }
    float _603 = _565;
    float _605 = _555;
    float _607 = _559;
    float _609 = -_543;
    float _611 = _609 + _603;
    float _613 = -_511;
    float _615 = _613 + _605;
    float _617 = -_505;
    float _619 = _617 + _607;
    float _621 = _543 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _623 = _611 * _611;
    bool _625 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _627 = isnan(0.5);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _633 = _629 || _631;
    float _635 = fma(_615, _615, _623);
    bool _637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _639 = isnan(0.5);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _645 = _641 || _643;
    float _647 = fma(_619, _619, _635);
    float _649 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _621);
    float _651 = _543 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _653 = sqrt(_647);
    float _655 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].z, _649);
    float _657 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _659 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _651);
    float _661 = 1.0 / _657;
    float _663 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].z, _659);
    float _665 = _663 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _667 = _653 > 0.0;
    float _669 = _665 + _657;
    float _671 = _669 * _661;
    float _673 = _671 * 0.5;
    bool _675 = !_667;
    float _677 = _605;
    float _679 = _607;
    float _681 = _603;
    float _683 = _647;
    float _685 = _611;
    if (!_675)
    {
        float _687 = _219 * _219;
        float _689 = fma(_263, _263, _687);
        float _691 = fma(_265, _265, _689);
        float _693 = rsqrt(_647);
        float _695 = sqrt(_691);
        float _697 = _615 * _693;
        float _699 = _611 * _693;
        float _701 = _619 * _693;
        bool _703 = _695 > 0.0;
        bool _705 = !_703;
        if (!_705)
        {
            float _707 = rsqrt(_691);
            float _709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _711 = _219 * _707;
            float _713 = _263 * _707;
            float _715 = _265 * _707;
            float _717 = _699 * _711;
            float _719 = fma(_697, _713, _717);
            float _721 = _709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _723 = fma(_701, _715, _719);
            float _725 = _723 * _721;
            float _727 = fma(_263, _725, _605);
            float _729 = fma(_219, _725, _603);
            float _731 = fma(_265, _725, _607);
            _677 = _727;
            _679 = _731;
            _681 = _729;
            _683 = _713;
        }
    }
    float _733 = _677;
    float _735 = _679;
    float _737 = _681;
    float _739 = _683;
    float _741 = _739;
    float _743 = _735;
    float _745 = _737;
    float _747 = _733;
    if (_645)
    {
        _741 = 1.0;
    }
    float _749 = _741;
    float _751 = _749;
    if (_633)
    {
        _273 = _733;
    }
    float _753 = _273;
    float _755 = _753;
    if (_633)
    {
        _275 = _735;
    }
    float _757 = _275;
    float _759 = _757;
    if (!_633)
    {
        float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _763 = _543 + _761;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _767 = _511 + _765;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _771 = -_505;
        float _773 = _771 + _735;
        float _775 = _763 * _763;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _779 = _505 + _777;
        float _781 = fma(_767, _767, _775);
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _785 = fma(_779, _779, _781);
        float _787 = sqrt(_785);
        float _789 = _769 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _791 = precise::min(_787, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _793 = _791 * _783;
        float _795 = -_511;
        float _797 = _795 + _733;
        float _799 = _789 * _793;
        float _801 = -_543;
        float _803 = _801 + _737;
        float _805 = fma(_797, _799, _511);
        float _807 = fma(_803, _799, _543);
        float _809 = fma(_773, _799, _505);
        _743 = _773;
        _745 = _807;
        _755 = _805;
        _759 = _809;
    }
    float _811 = _743;
    float _813 = _745;
    float _815 = _755;
    float _817 = _759;
    float _819 = _811;
    if (!_645)
    {
        float _821 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _823 = _821 * 0.15915493667125701904296875;
        float _825 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _829 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _827);
        float _831 = _823 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _825 * 0.15915493667125701904296875;
        float _837 = _823 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = 1.0 / _833;
        float _843 = _835 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = _839 * _841;
        float _849 = _835 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = _845 * _847;
        float _855 = 1.0 / _829;
        float _857 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _859 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _857;
        float _861 = 1.0 / _853;
        float _863 = 1.0 / _859;
        float _865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _867 = _855 * _865;
        float _869 = _851 * _861;
        float _871 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _873 = fma(_869, _867, _871);
        float _875 = _873 * _863;
        float _877 = precise::clamp(_875, 0.0, 1.0);
        _819 = _867;
        _747 = _835;
        _751 = _877;
    }
    float _879 = _819;
    float _881 = _747;
    float _883 = _751;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _813 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _815 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _817 + _893;
    float _897 = _887 * _887;
    float _899 = fma(_891, _891, _897);
    float _901 = fma(_895, _895, _899);
    float _903 = rsqrt(_901);
    float _905 = _903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _907 = _891 * _905;
    float _909 = _895 * _905;
    float _911 = _907 * _907;
    float _913 = _909 * _909;
    float _915 = _911 + _913;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = _903;
    float _927 = _915;
    float _929 = _923;
    float _931 = _879;
    float _933 = _887;
    float _935 = _881;
    if (_919)
    {
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _937;
    }
    float _939 = _925;
    if (_919)
    {
        float _941 = rsqrt(_915);
        _927 = _941;
    }
    float _943 = _927;
    float _945 = _943;
    if (_919)
    {
        float _947 = _923 * _939;
        _929 = _947;
    }
    float _949 = _929;
    if (_919)
    {
        float _951 = _949 * 0.15915493667125701904296875;
        _931 = _951;
    }
    float _953 = _931;
    float _955 = _895;
    if (_919)
    {
        float _957 = _953 * 6.283185482025146484375;
        float _959 = sin(_957);
        _955 = _959;
    }
    float _961 = _955;
    float _963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _965 = precise::max(0.0, _963);
    float _967 = _939;
    float _969 = _965;
    if (_919)
    {
        float _971 = _953 * 6.283185482025146484375;
        float _973 = cos(_971);
        _967 = _973;
    }
    float _975 = _967;
    float _977 = -_905;
    float _979 = -_965;
    float _981 = fma(_887, _977, _979);
    if (_919)
    {
        float _983 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _983;
    }
    float _985 = _933;
    float _987 = sqrt(_901);
    float _989 = _985;
    float _991 = _961;
    if (_919)
    {
        float _993 = fma(_961, _985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = _995;
    if (!_919)
    {
        _991 = _907;
    }
    float _999 = _991;
    float _1001 = _999;
    float _1003 = _975;
    if (_919)
    {
        float _1005 = _975 + (-1.0);
        _969 = _1005;
    }
    float _1007 = _969;
    float _1009 = _1007;
    if (_919)
    {
        float _1011 = _943 * _995;
        _685 = _1011;
    }
    float _1013 = _685;
    if (!_919)
    {
        _997 = _981;
    }
    float _1015 = _997;
    float _1017 = _1015;
    if (_919)
    {
        float _1019 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _1019;
    }
    float _1021 = _935;
    if (_919)
    {
        float _1023 = _907 * _1013;
        _1001 = _1023;
    }
    float _1025 = _1001;
    if (!_919)
    {
        _1009 = _909;
    }
    float _1027 = _1009;
    float _1029 = _1027;
    if (_919)
    {
        float _1031 = _909 * _1013;
        _1029 = _1031;
    }
    float _1033 = _1029;
    if (!_919)
    {
        _945 = _911;
    }
    float _1035 = _945;
    float _1037 = _1035;
    if (_919)
    {
        float _1039 = fma(_981, _975, _1021);
        _1017 = _1039;
    }
    float _1041 = _1017;
    if (_919)
    {
        float _1043 = _1025 * _1025;
        _1037 = _1043;
    }
    float _1045 = _1037;
    if (!_919)
    {
        _1003 = _913;
    }
    float _1047 = _1003;
    float _1049 = _1047;
    if (_919)
    {
        float _1051 = _1033 * _1033;
        _1049 = _1051;
    }
    float _1053 = _1049;
    float _1055 = fma(_1041, _1041, _1045);
    float _1057 = _1055 + _1053;
    float _1059 = _813 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1063 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1061);
    float _1065 = precise::clamp(_1063, 0.0, 1.0);
    float _1067 = _813 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1069 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1071 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1059);
    float _1073 = rsqrt(_1057);
    float _1075 = _813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1077 = -_1065;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1083 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1067);
    float _1085 = _813 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1087 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1091 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1083);
    float _1093 = abs(_1079);
    float _1095 = log2(_1093);
    float _1097 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1085);
    float _1101 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1073 * _1025;
    float _1111 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1113 = _1073 * _1041;
    float _1115 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1111);
    float _1121 = _1073 * _1033;
    float _1123 = -_1103;
    float _1125 = fma(_1123, _1069, 1.0);
    float _1127 = -_1117;
    float _1129 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1127);
    float _1131 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1119);
    float _1133 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1135 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1137 = -_1121;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1129);
    float _1141 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1131);
    float _1143 = log2(_1125);
    float _1145 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1147 = fma(_1139, -0.5, 0.5);
    float _1149 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1135);
    float _1151 = fma(_1139, 0.5, 0.5);
    float _1153 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1145);
    float _1155 = _1113 + 1.0;
    float _1157 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1149);
    float _1159 = exp2(_1133);
    float _1161 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1153);
    float _1163 = fma(_1151, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1165 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1157);
    float _1167 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1161);
    float _1169 = fma(_1151, _1163, -0.212114393711090087890625);
    float _1171 = 1.0 / _1141;
    float _1173 = _1143 * 0.693147182464599609375;
    float _1175 = fma(_1151, _1169, 1.570728778839111328125);
    float _1177 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1179 = sqrt(_1147);
    float _1181 = -_1113;
    float _1183 = fma(_1159, _1155, _1181);
    float _1185 = _1167 * _1171;
    float _1187 = _1165 * _1171;
    float _1189 = fma(_1185, 0.5, 0.5);
    float _1191 = fma(_1187, -0.5, 0.5);
    float _1193 = _1179 * 0.636619746685028076171875;
    float _1195 = fma(_1183, 0.5, 0.5);
    float3 _3255 = float3(_1189, _1191, _1177);
    float _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3255, float3(0.0), isnan(_3255)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3255, float3(0.0), isnan(_3255)), level(0.0)).x;
    float _1199 = -_1175;
    float _1201 = fma(_1193, _1199, 1.0);
    float3 _3271 = float3(_1189, _1191, _1177);
    float4 _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3271, float3(0.0), isnan(_3271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3271, float3(0.0), isnan(_3271)), level(0.0)).xyzw;
    float _1206 = _1204.x;
    float _1208 = _1204.y;
    float _1210 = _1204.z;
    float _1212 = _1204.w;
    float2 _3288 = float2(_1201, _1195);
    float3 _1216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3288, float2(0.0), isnan(_3288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3288, float2(0.0), isnan(_3288)), level(0.0)).xyz;
    float _1218 = _1216.x;
    float _1220 = _1216.y;
    float _1222 = _1216.z;
    float _1224 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1226 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1238 = 1.0 / _1230;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1246 = _447 + _1244;
    float _1248 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1226);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1252 = 1.0 / _1234;
    float _1254 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1262 = _447 + _1260;
    float _1264 = _1262 * _1238;
    bool _1266 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1268 = isnan(_447);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    out.m_60.x = _1254;
    out.m_60.y = _1256;
    out.m_60.z = _1258;
    out.m_60.w = _1250;
    bool _1278 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1280 = isnan(_447);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1290;
    float _1294 = exp2(_1224);
    bool _1296 = _883 > 0.0;
    bool _1298 = isnan(_883);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan(0.0);
    bool _1304 = _1300 || _1302;
    float _1306 = _1246 * _1252;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1312;
    float _1316 = fma(_1292, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1318 = fma(_1310, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1320 = fma(_1314, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1322 = -_1276;
    float _1324 = _1322 + 1.0;
    bool _1326 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1328 = isnan(_447);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1346 = _1288 * _1324;
    float _1348 = -_1288;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1340, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1358 = fma(_1344, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1360 = _1336 * _1350;
    float _1362 = -_1336;
    float _1364 = _1362 + 1.0;
    float _1366 = fma(_1356, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1368 = -_1294;
    float _1370 = _1368 + 1.0;
    float _1372 = _1316 * _1360;
    float _1374 = _1318 * _1360;
    float _1376 = _1320 * _1360;
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1372);
    float _1380 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1374);
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1376);
    float _1384 = fma(_1352, _1346, _1378);
    float _1386 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1248);
    float _1388 = fma(_1366, _1346, _1380);
    float _1390 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1384);
    float _1392 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1386);
    float _1394 = fma(_1358, _1346, _1382);
    float _1396 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1388);
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1400 = _1392 + _1141;
    float _1402 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1394);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1406 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1408 = _1400 * 0.5;
    float _1410 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1414 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1424 = -_1410;
    float _1426 = _1424 + 1.0;
    out.gl_Position.x = _1167;
    out.gl_Position.y = _1165;
    out.gl_Position.z = _1392;
    out.gl_Position.w = _1141;
    out.m_62.x = _1416;
    out.m_62.y = _1418;
    out.m_62.z = _1420;
    out.m_62.w = _1404;
    out.m_64.z = _1408;
    out.m_64.w = _1141;
    out.m_45.x = _1422;
    float _1428 = _1410 * _1197;
    float _1430 = _1212 * _1428;
    float _1432 = _1212 * _1426;
    float _1434 = _1222 * _1428;
    float _1436 = fma(_1218, _1430, _1206);
    float _1438 = fma(_1220, _1430, _1208);
    float _1440 = fma(_1212, _1434, _1210);
    out.m_66.x = _1436;
    out.m_66.y = _1438;
    out.m_66.z = _1440;
    out.m_66.w = _1432;
    if (_1304)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1442;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _439 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_101);
        out.gl_Position.z = _1499;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_137);
        out.gl_Position.z = _1568;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.x;
    float _149 = in.m_54.y;
    float _151 = in.m_54.z;
    float _153 = _143 * _141;
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    int _157 = as_type<int>(_145) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_145) & 2;
    bool _163 = _161 != 0;
    float _165 = floor(_155);
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = _155 * 6.283185482025146484375;
    float _173 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _175 = !_163;
    int _177 = _175 ? (-1090519040) : 1056964608;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = _171 * 0.15915493667125701904296875;
    float _191 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _197 = _189 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    bool _207 = !_159;
    int _209 = _207 ? (-1090519040) : 1056964608;
    float _211 = -_165;
    float _213 = _155 + _211;
    bool _215 = !_169;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    int _221 = abs(_203);
    out.m_56.x = as_type<float>(_209);
    out.m_56.y = as_type<float>(_177);
    int _223 = abs(_217);
    float _225 = -_213;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = float(_221);
    float _233 = fma(_199, 0.5, 0.5);
    bool _235 = !_187;
    int _237 = _235 ? 0 : 1;
    bool _239 = _213 < 0.5;
    float _241 = float(_239);
    float _243 = abs(_227);
    float _245 = _231 * _243;
    int _247 = abs(_237);
    float _249 = -_233;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_223);
    float _255 = -_241;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = float(_247);
    float _261 = fma(_253, _251, _245);
    float _263 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _265 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _267 = abs(_257);
    float _269 = fma(_259, _267, _261);
    bool _271 = !_229;
    float _273 = _219;
    float _275 = _263;
    float _291;
    if (!_271)
    {
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_85);
        float _297 = 1.0 / _295;
        float _299 = _119 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    bool _307 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_301);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _333;
    bool _345 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_301);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _329 * _341;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = _355 * _361;
    float _367 = 1.0 / _337;
    float _369 = -_355;
    float _371 = _369 + 1.0;
    float _373 = _305 * _343;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _301 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = fma(_381, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _389 = fma(_385, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = _377 * _367;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _397 = _387 * _365;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = _389 * _365;
    float _405 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _409 = fma(_401, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _413 = fma(_405, _357, _407);
    float _415 = fma(_409, _357, _411);
    float _417 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _413);
    float _419 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _415);
    bool _421 = !_363;
    float _437;
    if (!_421)
    {
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _425 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_85);
        float _443 = 1.0 / _441;
        float _445 = _119 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = in.m_58.x;
    float _451 = in.m_58.y;
    float _453 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_177));
    float _455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_209));
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    float _461 = in.m_42.z;
    float _463 = _419 * _451;
    float _465 = _417 * _449;
    float _467 = _269 * _463;
    float _469 = _269 * _465;
    float _471 = _459 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _469 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    float _479 = _473 * _453;
    float _481 = _475 * _455;
    float _483 = _459 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _487 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _489 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _493 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].z, _477);
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[26].x, _487);
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _499 = _459 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[26].z, _495);
    float _503 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _505 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[24].z, _497);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _517 = _505 + _509;
    float _519 = _511 + _515;
    float _521 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _523 = _517 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _519 + _525;
    float _529 = _523 * _523;
    float _531 = fma(_527, _527, _529);
    float _533 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _535 = sqrt(_531);
    float _537 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
    float _539 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].z, _513);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
    float _543 = _539 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _545 = _541 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _547 = _543 + _545;
    bool _549 = _535 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = _479;
    float _553 = _485;
    float _555 = _519;
    if (!_549)
    {
        _551 = _517;
    }
    float _557 = _551;
    float _559 = _557;
    if (!_549)
    {
        _553 = _547;
    }
    float _561 = _553;
    bool _563 = !_549;
    float _565 = _561;
    if (!_563)
    {
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _569 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _571 = _535 + _569;
        float _573 = _547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = rsqrt(_531);
        float _577 = _571 * _567;
        float _579 = _577 * 0.15915493667125701904296875;
        float _581 = _579 * 6.283185482025146484375;
        float _583 = cos(_581);
        float _585 = _579 * 6.283185482025146484375;
        float _587 = sin(_585);
        float _589 = _583 + (-1.0);
        float _591 = _589 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = fma(_587, _573, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = fma(_547, _583, _591);
        float _597 = _575 * _593;
        float _599 = fma(_527, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _601 = fma(_523, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _565 = _595;
        _555 = _599;
        _559 = _601;
    }
    float _603 = _565;
    float _605 = _555;
    float _607 = _559;
    float _609 = -_543;
    float _611 = _609 + _603;
    float _613 = -_511;
    float _615 = _613 + _605;
    float _617 = -_505;
    float _619 = _617 + _607;
    float _621 = _543 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _623 = _611 * _611;
    bool _625 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _627 = isnan(0.5);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _633 = _629 || _631;
    float _635 = fma(_615, _615, _623);
    bool _637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _639 = isnan(0.5);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _645 = _641 || _643;
    float _647 = fma(_619, _619, _635);
    float _649 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _621);
    float _651 = _543 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _653 = sqrt(_647);
    float _655 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].z, _649);
    float _657 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _659 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _651);
    float _661 = 1.0 / _657;
    float _663 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].z, _659);
    float _665 = _663 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _667 = _653 > 0.0;
    float _669 = _665 + _657;
    float _671 = _669 * _661;
    float _673 = _671 * 0.5;
    bool _675 = !_667;
    float _677 = _605;
    float _679 = _607;
    float _681 = _603;
    float _683 = _647;
    float _685 = _611;
    if (!_675)
    {
        float _687 = _219 * _219;
        float _689 = fma(_263, _263, _687);
        float _691 = fma(_265, _265, _689);
        float _693 = rsqrt(_647);
        float _695 = sqrt(_691);
        float _697 = _615 * _693;
        float _699 = _611 * _693;
        float _701 = _619 * _693;
        bool _703 = _695 > 0.0;
        bool _705 = !_703;
        if (!_705)
        {
            float _707 = rsqrt(_691);
            float _709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _711 = _219 * _707;
            float _713 = _263 * _707;
            float _715 = _265 * _707;
            float _717 = _699 * _711;
            float _719 = fma(_697, _713, _717);
            float _721 = _709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _723 = fma(_701, _715, _719);
            float _725 = _723 * _721;
            float _727 = fma(_263, _725, _605);
            float _729 = fma(_219, _725, _603);
            float _731 = fma(_265, _725, _607);
            _677 = _727;
            _679 = _731;
            _681 = _729;
            _683 = _713;
        }
    }
    float _733 = _677;
    float _735 = _679;
    float _737 = _681;
    float _739 = _683;
    float _741 = _739;
    float _743 = _735;
    float _745 = _737;
    float _747 = _733;
    if (_645)
    {
        _741 = 1.0;
    }
    float _749 = _741;
    float _751 = _749;
    if (_633)
    {
        _273 = _733;
    }
    float _753 = _273;
    float _755 = _753;
    if (_633)
    {
        _275 = _735;
    }
    float _757 = _275;
    float _759 = _757;
    if (!_633)
    {
        float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _763 = _543 + _761;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _767 = _511 + _765;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _771 = -_505;
        float _773 = _771 + _735;
        float _775 = _763 * _763;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _779 = _505 + _777;
        float _781 = fma(_767, _767, _775);
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _785 = fma(_779, _779, _781);
        float _787 = sqrt(_785);
        float _789 = _769 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _791 = precise::min(_787, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _793 = _791 * _783;
        float _795 = -_511;
        float _797 = _795 + _733;
        float _799 = _789 * _793;
        float _801 = -_543;
        float _803 = _801 + _737;
        float _805 = fma(_797, _799, _511);
        float _807 = fma(_803, _799, _543);
        float _809 = fma(_773, _799, _505);
        _743 = _773;
        _745 = _807;
        _755 = _805;
        _759 = _809;
    }
    float _811 = _743;
    float _813 = _745;
    float _815 = _755;
    float _817 = _759;
    float _819 = _811;
    if (!_645)
    {
        float _821 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _823 = _821 * 0.15915493667125701904296875;
        float _825 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _829 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _827);
        float _831 = _823 * 6.283185482025146484375;
        float _833 = cos(_831);
        float _835 = _825 * 0.15915493667125701904296875;
        float _837 = _823 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = 1.0 / _833;
        float _843 = _835 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = _839 * _841;
        float _849 = _835 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = _845 * _847;
        float _855 = 1.0 / _829;
        float _857 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _859 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _857;
        float _861 = 1.0 / _853;
        float _863 = 1.0 / _859;
        float _865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _867 = _855 * _865;
        float _869 = _851 * _861;
        float _871 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _873 = fma(_869, _867, _871);
        float _875 = _873 * _863;
        float _877 = precise::clamp(_875, 0.0, 1.0);
        _819 = _867;
        _747 = _835;
        _751 = _877;
    }
    float _879 = _819;
    float _881 = _747;
    float _883 = _751;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _813 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _815 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _817 + _893;
    float _897 = _887 * _887;
    float _899 = fma(_891, _891, _897);
    float _901 = fma(_895, _895, _899);
    float _903 = rsqrt(_901);
    float _905 = _903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _907 = _891 * _905;
    float _909 = _895 * _905;
    float _911 = _907 * _907;
    float _913 = _909 * _909;
    float _915 = _911 + _913;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = _903;
    float _927 = _915;
    float _929 = _923;
    float _931 = _879;
    float _933 = _887;
    float _935 = _881;
    if (_919)
    {
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _937;
    }
    float _939 = _925;
    if (_919)
    {
        float _941 = rsqrt(_915);
        _927 = _941;
    }
    float _943 = _927;
    float _945 = _943;
    if (_919)
    {
        float _947 = _923 * _939;
        _929 = _947;
    }
    float _949 = _929;
    if (_919)
    {
        float _951 = _949 * 0.15915493667125701904296875;
        _931 = _951;
    }
    float _953 = _931;
    float _955 = _895;
    if (_919)
    {
        float _957 = _953 * 6.283185482025146484375;
        float _959 = sin(_957);
        _955 = _959;
    }
    float _961 = _955;
    float _963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _965 = precise::max(0.0, _963);
    float _967 = _939;
    float _969 = _965;
    if (_919)
    {
        float _971 = _953 * 6.283185482025146484375;
        float _973 = cos(_971);
        _967 = _973;
    }
    float _975 = _967;
    float _977 = -_905;
    float _979 = -_965;
    float _981 = fma(_887, _977, _979);
    if (_919)
    {
        float _983 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _983;
    }
    float _985 = _933;
    float _987 = sqrt(_901);
    float _989 = _985;
    float _991 = _961;
    if (_919)
    {
        float _993 = fma(_961, _985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = _995;
    if (!_919)
    {
        _991 = _907;
    }
    float _999 = _991;
    float _1001 = _999;
    float _1003 = _975;
    if (_919)
    {
        float _1005 = _975 + (-1.0);
        _969 = _1005;
    }
    float _1007 = _969;
    float _1009 = _1007;
    if (_919)
    {
        float _1011 = _943 * _995;
        _685 = _1011;
    }
    float _1013 = _685;
    if (!_919)
    {
        _997 = _981;
    }
    float _1015 = _997;
    float _1017 = _1015;
    if (_919)
    {
        float _1019 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _1019;
    }
    float _1021 = _935;
    if (_919)
    {
        float _1023 = _907 * _1013;
        _1001 = _1023;
    }
    float _1025 = _1001;
    if (!_919)
    {
        _1009 = _909;
    }
    float _1027 = _1009;
    float _1029 = _1027;
    if (_919)
    {
        float _1031 = _909 * _1013;
        _1029 = _1031;
    }
    float _1033 = _1029;
    if (!_919)
    {
        _945 = _911;
    }
    float _1035 = _945;
    float _1037 = _1035;
    if (_919)
    {
        float _1039 = fma(_981, _975, _1021);
        _1017 = _1039;
    }
    float _1041 = _1017;
    if (_919)
    {
        float _1043 = _1025 * _1025;
        _1037 = _1043;
    }
    float _1045 = _1037;
    if (!_919)
    {
        _1003 = _913;
    }
    float _1047 = _1003;
    float _1049 = _1047;
    if (_919)
    {
        float _1051 = _1033 * _1033;
        _1049 = _1051;
    }
    float _1053 = _1049;
    float _1055 = fma(_1041, _1041, _1045);
    float _1057 = _1055 + _1053;
    float _1059 = _813 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1063 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1061);
    float _1065 = precise::clamp(_1063, 0.0, 1.0);
    float _1067 = _813 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1069 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1071 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1059);
    float _1073 = rsqrt(_1057);
    float _1075 = _813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1077 = -_1065;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1083 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1067);
    float _1085 = _813 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1087 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1091 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1083);
    float _1093 = abs(_1079);
    float _1095 = log2(_1093);
    float _1097 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1085);
    float _1101 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1073 * _1025;
    float _1111 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1113 = _1073 * _1041;
    float _1115 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1111);
    float _1121 = _1073 * _1033;
    float _1123 = -_1103;
    float _1125 = fma(_1123, _1069, 1.0);
    float _1127 = -_1117;
    float _1129 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1127);
    float _1131 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1119);
    float _1133 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1135 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1137 = -_1121;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1129);
    float _1141 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1131);
    float _1143 = log2(_1125);
    float _1145 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1147 = fma(_1139, -0.5, 0.5);
    float _1149 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1135);
    float _1151 = fma(_1139, 0.5, 0.5);
    float _1153 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1145);
    float _1155 = _1113 + 1.0;
    float _1157 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1149);
    float _1159 = exp2(_1133);
    float _1161 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1153);
    float _1163 = fma(_1151, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1165 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1157);
    float _1167 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1161);
    float _1169 = fma(_1151, _1163, -0.212114393711090087890625);
    float _1171 = 1.0 / _1141;
    float _1173 = _1143 * 0.693147182464599609375;
    float _1175 = fma(_1151, _1169, 1.570728778839111328125);
    float _1177 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1179 = sqrt(_1147);
    float _1181 = -_1113;
    float _1183 = fma(_1159, _1155, _1181);
    float _1185 = _1167 * _1171;
    float _1187 = _1165 * _1171;
    float _1189 = fma(_1185, 0.5, 0.5);
    float _1191 = fma(_1187, -0.5, 0.5);
    float _1193 = _1179 * 0.636619746685028076171875;
    float _1195 = fma(_1183, 0.5, 0.5);
    float3 _3255 = float3(_1189, _1191, _1177);
    float _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3255, float3(0.0), isnan(_3255)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3255, float3(0.0), isnan(_3255)), level(0.0)).x;
    float _1199 = -_1175;
    float _1201 = fma(_1193, _1199, 1.0);
    float3 _3271 = float3(_1189, _1191, _1177);
    float4 _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3271, float3(0.0), isnan(_3271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3271, float3(0.0), isnan(_3271)), level(0.0)).xyzw;
    float _1206 = _1204.x;
    float _1208 = _1204.y;
    float _1210 = _1204.z;
    float _1212 = _1204.w;
    float2 _3288 = float2(_1201, _1195);
    float3 _1216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3288, float2(0.0), isnan(_3288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3288, float2(0.0), isnan(_3288)), level(0.0)).xyz;
    float _1218 = _1216.x;
    float _1220 = _1216.y;
    float _1222 = _1216.z;
    float _1224 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1226 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1238 = 1.0 / _1230;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1246 = _447 + _1244;
    float _1248 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1226);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1252 = 1.0 / _1234;
    float _1254 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1262 = _447 + _1260;
    float _1264 = _1262 * _1238;
    bool _1266 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1268 = isnan(_447);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    out.m_60.x = _1254;
    out.m_60.y = _1256;
    out.m_60.z = _1258;
    out.m_60.w = _1250;
    bool _1278 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1280 = isnan(_447);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1290;
    float _1294 = exp2(_1224);
    bool _1296 = _883 > 0.0;
    bool _1298 = isnan(_883);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan(0.0);
    bool _1304 = _1300 || _1302;
    float _1306 = _1246 * _1252;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1312;
    float _1316 = fma(_1292, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1318 = fma(_1310, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1320 = fma(_1314, _1264, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1322 = -_1276;
    float _1324 = _1322 + 1.0;
    bool _1326 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1328 = isnan(_447);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1346 = _1288 * _1324;
    float _1348 = -_1288;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1340, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1358 = fma(_1344, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1360 = _1336 * _1350;
    float _1362 = -_1336;
    float _1364 = _1362 + 1.0;
    float _1366 = fma(_1356, _1306, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1368 = -_1294;
    float _1370 = _1368 + 1.0;
    float _1372 = _1316 * _1360;
    float _1374 = _1318 * _1360;
    float _1376 = _1320 * _1360;
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1372);
    float _1380 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1374);
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1376);
    float _1384 = fma(_1352, _1346, _1378);
    float _1386 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1248);
    float _1388 = fma(_1366, _1346, _1380);
    float _1390 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1384);
    float _1392 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1386);
    float _1394 = fma(_1358, _1346, _1382);
    float _1396 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1388);
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1400 = _1392 + _1141;
    float _1402 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1394);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1406 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1408 = _1400 * 0.5;
    float _1410 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1414 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1424 = -_1410;
    float _1426 = _1424 + 1.0;
    out.gl_Position.x = _1167;
    out.gl_Position.y = _1165;
    out.gl_Position.z = _1392;
    out.gl_Position.w = _1141;
    out.m_62.x = _1416;
    out.m_62.y = _1418;
    out.m_62.z = _1420;
    out.m_62.w = _1404;
    out.m_64.z = _1408;
    out.m_64.w = _1141;
    out.m_45.x = _1422;
    float _1428 = _1410 * _1197;
    float _1430 = _1212 * _1428;
    float _1432 = _1212 * _1426;
    float _1434 = _1222 * _1428;
    float _1436 = fma(_1218, _1430, _1206);
    float _1438 = fma(_1220, _1430, _1208);
    float _1440 = fma(_1212, _1434, _1210);
    out.m_66.x = _1436;
    out.m_66.y = _1438;
    out.m_66.z = _1440;
    out.m_66.w = _1432;
    if (_1304)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1442;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

