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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _371 = false;
    bool _271 = false;
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
        float _1491 = as_type<float>(_101);
        out.gl_Position.z = _1491;
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
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1559 = as_type<float>(_137);
        out.gl_Position.z = _1559;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = floor(_153);
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    bool _181 = !_169;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _187 = _175 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    int _193 = abs(_183);
    float _195 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    bool _197 = !_159;
    int _199 = _197 ? 0 : 1;
    float _201 = -_155;
    float _203 = _153 + _201;
    bool _205 = !_173;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    int _211 = abs(_199);
    float _213 = float(_193);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_189, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    float _247 = fma(_237, _235, _227);
    float _249 = abs(_241);
    float _251 = fma(_243, _249, _247);
    bool _253 = !_219;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _119 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -_295;
    float _303 = _301 + 1.0;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _307 = 1.0 / _299;
    float _309 = _283 * _307;
    bool _311 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _313 = isnan(_279);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = _321 * _303;
    float _333 = fma(_325, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_329, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = -_321;
    float _339 = _337 + 1.0;
    float _341 = _333 * _331;
    float _343 = _335 * _331;
    float _345 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _347 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].x, _345);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].y, _347);
    bool _353 = !_305;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _119 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = as_type<float>(int(gl_VertexIndex));
    float _383 = in.m_56.x;
    float _385 = in.m_56.y;
    float _387 = in.m_42.x;
    float _389 = in.m_42.y;
    float _391 = in.m_42.z;
    int _393 = as_type<int>(_381) & 1;
    bool _395 = _393 != 0;
    int _397 = as_type<int>(_381) & 2;
    bool _399 = _397 != 0;
    float _401 = _351 * _385;
    bool _403 = !_399;
    float _405 = _403 ? (-0.5) : 0.5;
    float _407 = _349 * _383;
    bool _409 = !_395;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = _251 * _401;
    float _415 = _251 * _407;
    float _417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _405);
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _411);
    float _423 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _425 = _419 * _417;
    float _427 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = _423 * _421;
    float _431 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = _425 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _435 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _437 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    float _439 = _425 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _441 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _433);
    float _443 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[24].x, _439);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].z, _441);
    float _451 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
    float _453 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].z, _447);
    float _457 = _449 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _459 = _451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _461 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _463 = _455 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _465 = _453 + _457;
    float _467 = _425 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _469 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
    float _471 = _459 + _463;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _475 = _465 + _473;
    float _477 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[25].x, _467);
    float _479 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _483 = _471 + _481;
    float _485 = _475 * _475;
    float _487 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].z, _477);
    float _489 = fma(_483, _483, _485);
    float _491 = _479 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _493 = _487 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _495 = sqrt(_489);
    float _497 = _491 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _499 = _491 + _493;
    float _501 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[11].x, _497);
    float _503 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _501);
    bool _505 = _495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _507 = _497;
    float _509 = _493;
    float _511 = _501;
    float _513 = _467;
    if (!_505)
    {
        _507 = _471;
    }
    float _515 = _507;
    float _517 = _515;
    if (!_505)
    {
        _509 = _465;
    }
    float _519 = _509;
    float _521 = _519;
    if (!_505)
    {
        _511 = _499;
    }
    float _523 = _511;
    bool _525 = !_505;
    float _527 = _523;
    if (!_525)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _533 = _495 + _531;
        float _535 = rsqrt(_489);
        float _537 = _533 * _529;
        float _539 = _499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = _537 * 0.15915493667125701904296875;
        float _543 = _541 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = _541 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 + (-1.0);
        float _553 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _535 * _553;
        float _559 = fma(_499, _545, _555);
        float _561 = fma(_483, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_475, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _527 = _559;
        _517 = _561;
        _521 = _563;
        _513 = _557;
    }
    float _565 = _527;
    float _567 = _517;
    float _569 = _521;
    float _571 = _513;
    float _573 = -_491;
    float _575 = _573 + _565;
    float _577 = -_459;
    float _579 = _577 + _567;
    float _581 = -_453;
    float _583 = _581 + _569;
    float _585 = _503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _587 = _575 * _575;
    float _589 = _491 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _591 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _593 = isnan(0.5);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _599 = _595 || _597;
    float _601 = 1.0 / _585;
    float _603 = fma(_579, _579, _587);
    float _605 = fma(_583, _583, _603);
    float _607 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _609 = sqrt(_605);
    float _611 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _607);
    float _613 = _571;
    float _615 = _565;
    float _617 = _567;
    float _619 = _569;
    float _621 = _583;
    if (_599)
    {
        _613 = 1.0;
    }
    float _623 = _613;
    float _625 = _611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _627 = _625 + _585;
    float _629 = _627 * _601;
    float _631 = _629 * 0.5;
    bool _633 = _609 > 0.0;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _637 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[30].w, _635);
    float _639 = 1.0 / _637;
    bool _641 = !_633;
    float _643 = _637;
    float _645 = _601;
    float _647 = _623;
    if (!_641)
    {
        float _649 = _209 * _209;
        float _651 = fma(_195, _195, _649);
        float _653 = fma(_245, _245, _651);
        float _655 = rsqrt(_605);
        float _657 = sqrt(_653);
        float _659 = _579 * _655;
        float _661 = _575 * _655;
        float _663 = _583 * _655;
        bool _665 = _657 > 0.0;
        bool _667 = !_665;
        _643 = _661;
        _621 = _663;
        if (!_667)
        {
            float _669 = rsqrt(_653);
            float _671 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _673 = _209 * _669;
            float _675 = _195 * _669;
            float _677 = _661 * _673;
            float _679 = _245 * _669;
            float _681 = fma(_659, _675, _677);
            float _683 = _671 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _685 = fma(_663, _679, _681);
            float _687 = _685 * _683;
            float _689 = fma(_195, _687, _567);
            float _691 = fma(_209, _687, _565);
            float _693 = fma(_245, _687, _569);
            _643 = _681;
            _615 = _691;
            _617 = _689;
            _619 = _693;
        }
    }
    float _695 = _643;
    float _697 = _615;
    float _699 = _617;
    float _701 = _619;
    float _703 = _621;
    float _705 = _695;
    float _707 = _703;
    if (_599)
    {
        _645 = 1.0;
    }
    float _709 = _645;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _713 = _639 * _711;
    float _715 = _709;
    if (!_599)
    {
        float _717 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _719 = _717 * 0.15915493667125701904296875;
        float _721 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _723 = _719 * 6.283185482025146484375;
        float _725 = cos(_723);
        float _727 = _721 * 0.15915493667125701904296875;
        float _729 = _719 * 6.283185482025146484375;
        float _731 = sin(_729);
        float _733 = 1.0 / _725;
        float _735 = _727 * 6.283185482025146484375;
        float _737 = cos(_735);
        float _739 = _731 * _733;
        float _741 = _727 * 6.283185482025146484375;
        float _743 = sin(_741);
        float _745 = _737 * _739;
        float _747 = 1.0 / _745;
        float _749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _749;
        float _753 = 1.0 / _751;
        float _755 = _743 * _747;
        float _757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _759 = fma(_713, _755, _757);
        float _761 = _759 * _753;
        float _763 = precise::clamp(_761, 0.0, 1.0);
        _705 = _759;
        _647 = _763;
    }
    float _765 = _705;
    float _767 = _647;
    float _769 = _765;
    if (!_599)
    {
        float _771 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _777 = _773 * 6.283185482025146484375;
        float _779 = cos(_777);
        float _781 = _775 * 0.15915493667125701904296875;
        float _783 = _773 * 6.283185482025146484375;
        float _785 = sin(_783);
        float _787 = 1.0 / _779;
        float _789 = _781 * 6.283185482025146484375;
        float _791 = cos(_789);
        float _793 = _785 * _787;
        float _795 = _781 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = _791 * _793;
        float _801 = 1.0 / _799;
        float _803 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _805 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _803;
        float _807 = 1.0 / _805;
        float _809 = _797 * _801;
        float _811 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _813 = fma(_713, _809, _811);
        float _815 = _813 * _807;
        float _817 = precise::clamp(_815, 0.0, 1.0);
        float _819 = -_817;
        float _821 = _819 + 1.0;
        _769 = _787;
        _715 = _821;
    }
    float _823 = _769;
    float _825 = _715;
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _829 = _697 + _827;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _833 = _699 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _837 = _701 + _835;
    float _839 = _829 * _829;
    float _841 = fma(_833, _833, _839);
    float _843 = fma(_837, _837, _841);
    float _845 = rsqrt(_843);
    float _847 = _845 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _849 = _833 * _847;
    float _851 = _837 * _847;
    float _853 = _849 * _849;
    float _855 = _851 * _851;
    float _857 = _853 + _855;
    float _859 = sqrt(_857);
    bool _861 = _859 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _865 = _859 + _863;
    float _867 = _837;
    float _869 = _857;
    float _871 = _865;
    float _873 = _823;
    if (_861)
    {
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _867 = _875;
    }
    float _877 = _867;
    if (_861)
    {
        float _879 = rsqrt(_857);
        _869 = _879;
    }
    float _881 = _869;
    if (_861)
    {
        float _883 = _865 * _877;
        _871 = _883;
    }
    float _885 = _871;
    if (_861)
    {
        float _887 = _885 * 0.15915493667125701904296875;
        _873 = _887;
    }
    float _889 = _873;
    float _891 = _839;
    float _893 = _889;
    if (_861)
    {
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        _891 = _897;
    }
    float _899 = _891;
    float _901 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _903 = precise::max(0.0, _901);
    float _905 = _845;
    float _907 = _903;
    float _909 = _901;
    if (_861)
    {
        float _911 = _889 * 6.283185482025146484375;
        float _913 = cos(_911);
        _905 = _913;
    }
    float _915 = _905;
    float _917 = -_847;
    float _919 = -_903;
    float _921 = fma(_829, _917, _919);
    float _923 = _921;
    if (!_861)
    {
        _907 = _849;
    }
    float _925 = _907;
    float _927 = _925;
    if (_861)
    {
        float _929 = _921 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _909 = _929;
    }
    float _931 = _909;
    float _933 = _899;
    float _935 = _931;
    if (_861)
    {
        float _937 = fma(_899, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _933 = _937;
    }
    float _939 = _933;
    float _941 = _939;
    float _943 = _915;
    if (_861)
    {
        float _945 = _915 + (-1.0);
        _935 = _945;
    }
    float _947 = _935;
    float _949 = _947;
    if (_861)
    {
        float _951 = _881 * _939;
        _707 = _951;
    }
    float _953 = _707;
    if (!_861)
    {
        _941 = _853;
    }
    float _955 = _941;
    float _957 = sqrt(_843);
    float _959 = _955;
    if (_861)
    {
        float _961 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _961;
    }
    float _963 = _893;
    if (_861)
    {
        float _965 = _849 * _953;
        _927 = _965;
    }
    float _967 = _927;
    if (!_861)
    {
        _949 = _851;
    }
    float _969 = _949;
    float _971 = _969;
    if (_861)
    {
        float _973 = _851 * _953;
        _971 = _973;
    }
    float _975 = _971;
    if (_861)
    {
        float _977 = fma(_921, _915, _963);
        _923 = _977;
    }
    float _979 = _923;
    if (_861)
    {
        float _981 = _967 * _967;
        _959 = _981;
    }
    float _983 = _959;
    if (!_861)
    {
        _943 = _855;
    }
    float _985 = _943;
    float _987 = _985;
    if (_861)
    {
        float _989 = _975 * _975;
        _987 = _989;
    }
    float _991 = _987;
    float _993 = fma(_979, _979, _983);
    float _995 = _993 + _991;
    float _997 = _697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1001 = fma(_957, (*spvDescriptorSet0.vp_c15)._m0[23].w, _999);
    float _1003 = precise::clamp(_1001, 0.0, 1.0);
    float _1005 = _697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1009 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _997);
    float _1011 = rsqrt(_995);
    float _1013 = -_1003;
    float _1015 = _1013 + 1.0;
    float _1017 = _697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1019 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1009);
    float _1021 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1005);
    float _1023 = _697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1025 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1027 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1017);
    float _1029 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1021);
    float _1031 = abs(_1015);
    float _1033 = log2(_1031);
    float _1035 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1023);
    float _1037 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1027);
    float _1039 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1041 = _1025 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1043 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1035);
    float _1045 = _1011 * _967;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = _1011 * _979;
    float _1053 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1055 = _1011 * _975;
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1059 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1061 = -_1053;
    float _1063 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1061);
    float _1065 = -_1041;
    float _1067 = fma(_1065, _1007, 1.0);
    float _1069 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1057);
    float _1071 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1073 = -_1055;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1063);
    float _1077 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1079 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1069);
    float _1081 = log2(_1067);
    float _1083 = fma(_1075, -0.5, 0.5);
    float _1085 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1087 = fma(_1075, 0.5, 0.5);
    float _1089 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1077);
    float _1091 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1085);
    float _1093 = _1051 + 1.0;
    float _1095 = 1.0 / _1079;
    float _1097 = fma(_1087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1099 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1089);
    float _1101 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1091);
    float _1103 = fma(_1087, _1097, -0.212114393711090087890625);
    float _1105 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1099);
    float _1107 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1101);
    float _1109 = exp2(_1071);
    float _1111 = fma(_1087, _1103, 1.570728778839111328125);
    float _1113 = _1081 * 0.693147182464599609375;
    float _1115 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1117 = sqrt(_1083);
    float _1119 = _1105 * _1095;
    float _1121 = _1107 * _1095;
    float _1123 = fma(_1119, 0.5, 0.5);
    float _1125 = fma(_1121, -0.5, 0.5);
    float _1127 = -_1051;
    float _1129 = fma(_1109, _1093, _1127);
    float3 _3118 = float3(_1123, _1125, _1115);
    float _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3118, float3(0.0), isnan(_3118)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3118, float3(0.0), isnan(_3118)), level(0.0)).x;
    float _1133 = _1117 * 0.636619746685028076171875;
    float _1135 = fma(_1129, 0.5, 0.5);
    float _1137 = -_1111;
    float _1139 = fma(_1133, _1137, 1.0);
    float3 _3139 = float3(_1123, _1125, _1115);
    float4 _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3139, float3(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3139, float3(0.0), isnan(_3139)), level(0.0)).xyzw;
    float _1144 = _1142.x;
    float _1146 = _1142.y;
    float _1148 = _1142.z;
    float _1150 = _1142.w;
    float2 _3156 = float2(_1139, _1135);
    float3 _1154 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3156, float2(0.0), isnan(_3156)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3156, float2(0.0), isnan(_3156)), level(0.0)).xyz;
    float _1156 = _1154.x;
    float _1158 = _1154.y;
    float _1160 = _1154.z;
    float _1162 = in.m_49.y;
    float _1164 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1166 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = 1.0 / _1170;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1190 = _1188 != 0;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = 1.0 / _1174;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1198 = _379 + _1196;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1166);
    out.m_58.x = _1184;
    out.m_58.y = _1186;
    out.m_58.z = _1192;
    bool _1206 = _1162 > 0.5;
    float _1208 = _1198 * _1178;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1212 = _379 + _1210;
    float _1214 = exp2(_1164);
    bool _1216 = _139 > 0.5;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1222;
    float _1226 = _1212 * _1194;
    bool _1228 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1230 = isnan(_379);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = fma(_1220, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1242 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1244 = isnan(_379);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1262 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1264 = isnan(_379);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1274;
    float _1278 = -_1252;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1286 = -_405;
    int _1288 = _1206 ? as_type<int>(_1286) : as_type<int>(_405);
    float _1290 = fma(_1224, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1292 = _1238 * _1280;
    float _1294 = -_1238;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(_1276, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1300 = !_1202;
    float _1302 = _1300 ? _405 : as_type<float>(_1288);
    float _1304 = fma(_1256, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1306 = _1272 * _1296;
    float _1308 = -_1272;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1260, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1314 = fma(_1284, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1316 = _1240 * _1306;
    float _1318 = _1290 * _1306;
    float _1320 = _1298 * _1306;
    float _1322 = -_411;
    int _1324 = _1216 ? as_type<int>(_1322) : as_type<int>(_411);
    float _1326 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1316);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1318);
    float _1330 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1320);
    float _1332 = -_1214;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1304, _1292, _1326);
    float _1338 = fma(_1312, _1292, _1328);
    float _1340 = fma(_1314, _1292, _1330);
    float _1342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1344 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1336);
    float _1346 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1338);
    float _1348 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1340);
    float _1350 = _767 * _825;
    bool _1352 = !_1190;
    float _1354 = _1352 ? _411 : as_type<float>(_1324);
    float _1356 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    float _1358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1360 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1364 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1366 = _767 > 0.0;
    bool _1368 = isnan(_767);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    float _1376 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1378 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1380 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1382 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1356);
    float _1384 = _1354 + 0.5;
    float _1386 = -_1302;
    float _1388 = _1386 + 0.5;
    float _1390 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1392 = _825 <= 0.0;
    bool _1394 = !_1374;
    bool _1396 = _1392 || _1394;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1380 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1404 = _1382 + _1079;
    float _1406 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1408 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_60.x = _1390;
    out.m_60.y = _1398;
    out.m_60.z = _1400;
    out.m_60.w = _1362;
    float _1410 = _1404 * 0.5;
    float _1412 = _1406 * _1342;
    float _1414 = _1408 * _1358;
    out.m_45.x = _1402;
    out.m_62.x = _1412;
    out.m_62.y = _1414;
    out.gl_Position.x = _1105;
    out.gl_Position.y = _1107;
    out.gl_Position.z = _1382;
    out.gl_Position.w = _1079;
    out.m_64.z = _1410;
    out.m_64.w = _1079;
    float _1416 = _1360 * _1131;
    float _1418 = -_1360;
    float _1420 = _1418 + 1.0;
    float _1422 = _1150 * _1416;
    float _1424 = _1150 * _1420;
    float _1426 = _1160 * _1416;
    float _1428 = fma(_1156, _1422, _1144);
    float _1430 = fma(_1158, _1422, _1146);
    float _1432 = fma(_1150, _1426, _1148);
    out.m_66.x = _1428;
    out.m_66.y = _1430;
    out.m_66.z = _1432;
    out.m_66.w = _1424;
    if (!_1396)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1434;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _371 = false;
    bool _271 = false;
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
        float _1491 = as_type<float>(_101);
        out.gl_Position.z = _1491;
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
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1559 = as_type<float>(_137);
        out.gl_Position.z = _1559;
    }
    if (_131)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = floor(_153);
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    bool _181 = !_169;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _187 = _175 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    int _193 = abs(_183);
    float _195 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    bool _197 = !_159;
    int _199 = _197 ? 0 : 1;
    float _201 = -_155;
    float _203 = _153 + _201;
    bool _205 = !_173;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    int _211 = abs(_199);
    float _213 = float(_193);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_189, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    float _247 = fma(_237, _235, _227);
    float _249 = abs(_241);
    float _251 = fma(_243, _249, _247);
    bool _253 = !_219;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _119 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -_295;
    float _303 = _301 + 1.0;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _307 = 1.0 / _299;
    float _309 = _283 * _307;
    bool _311 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _313 = isnan(_279);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = _321 * _303;
    float _333 = fma(_325, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_329, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = -_321;
    float _339 = _337 + 1.0;
    float _341 = _333 * _331;
    float _343 = _335 * _331;
    float _345 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _347 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].x, _345);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].y, _347);
    bool _353 = !_305;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _119 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = as_type<float>(int(gl_VertexIndex));
    float _383 = in.m_56.x;
    float _385 = in.m_56.y;
    float _387 = in.m_42.x;
    float _389 = in.m_42.y;
    float _391 = in.m_42.z;
    int _393 = as_type<int>(_381) & 1;
    bool _395 = _393 != 0;
    int _397 = as_type<int>(_381) & 2;
    bool _399 = _397 != 0;
    float _401 = _351 * _385;
    bool _403 = !_399;
    float _405 = _403 ? (-0.5) : 0.5;
    float _407 = _349 * _383;
    bool _409 = !_395;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = _251 * _401;
    float _415 = _251 * _407;
    float _417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _405);
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _411);
    float _423 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _425 = _419 * _417;
    float _427 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = _423 * _421;
    float _431 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = _425 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _435 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _437 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    float _439 = _425 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _441 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _433);
    float _443 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[24].x, _439);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].z, _441);
    float _451 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
    float _453 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].z, _447);
    float _457 = _449 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _459 = _451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _461 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _463 = _455 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _465 = _453 + _457;
    float _467 = _425 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _469 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
    float _471 = _459 + _463;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _475 = _465 + _473;
    float _477 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[25].x, _467);
    float _479 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _483 = _471 + _481;
    float _485 = _475 * _475;
    float _487 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].z, _477);
    float _489 = fma(_483, _483, _485);
    float _491 = _479 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _493 = _487 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _495 = sqrt(_489);
    float _497 = _491 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _499 = _491 + _493;
    float _501 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[11].x, _497);
    float _503 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _501);
    bool _505 = _495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _507 = _497;
    float _509 = _493;
    float _511 = _501;
    float _513 = _467;
    if (!_505)
    {
        _507 = _471;
    }
    float _515 = _507;
    float _517 = _515;
    if (!_505)
    {
        _509 = _465;
    }
    float _519 = _509;
    float _521 = _519;
    if (!_505)
    {
        _511 = _499;
    }
    float _523 = _511;
    bool _525 = !_505;
    float _527 = _523;
    if (!_525)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _533 = _495 + _531;
        float _535 = rsqrt(_489);
        float _537 = _533 * _529;
        float _539 = _499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = _537 * 0.15915493667125701904296875;
        float _543 = _541 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = _541 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 + (-1.0);
        float _553 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _535 * _553;
        float _559 = fma(_499, _545, _555);
        float _561 = fma(_483, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_475, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _527 = _559;
        _517 = _561;
        _521 = _563;
        _513 = _557;
    }
    float _565 = _527;
    float _567 = _517;
    float _569 = _521;
    float _571 = _513;
    float _573 = -_491;
    float _575 = _573 + _565;
    float _577 = -_459;
    float _579 = _577 + _567;
    float _581 = -_453;
    float _583 = _581 + _569;
    float _585 = _503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _587 = _575 * _575;
    float _589 = _491 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _591 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _593 = isnan(0.5);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _599 = _595 || _597;
    float _601 = 1.0 / _585;
    float _603 = fma(_579, _579, _587);
    float _605 = fma(_583, _583, _603);
    float _607 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _609 = sqrt(_605);
    float _611 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _607);
    float _613 = _571;
    float _615 = _565;
    float _617 = _567;
    float _619 = _569;
    float _621 = _583;
    if (_599)
    {
        _613 = 1.0;
    }
    float _623 = _613;
    float _625 = _611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _627 = _625 + _585;
    float _629 = _627 * _601;
    float _631 = _629 * 0.5;
    bool _633 = _609 > 0.0;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _637 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[30].w, _635);
    float _639 = 1.0 / _637;
    bool _641 = !_633;
    float _643 = _637;
    float _645 = _601;
    float _647 = _623;
    if (!_641)
    {
        float _649 = _209 * _209;
        float _651 = fma(_195, _195, _649);
        float _653 = fma(_245, _245, _651);
        float _655 = rsqrt(_605);
        float _657 = sqrt(_653);
        float _659 = _579 * _655;
        float _661 = _575 * _655;
        float _663 = _583 * _655;
        bool _665 = _657 > 0.0;
        bool _667 = !_665;
        _643 = _661;
        _621 = _663;
        if (!_667)
        {
            float _669 = rsqrt(_653);
            float _671 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _673 = _209 * _669;
            float _675 = _195 * _669;
            float _677 = _661 * _673;
            float _679 = _245 * _669;
            float _681 = fma(_659, _675, _677);
            float _683 = _671 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _685 = fma(_663, _679, _681);
            float _687 = _685 * _683;
            float _689 = fma(_195, _687, _567);
            float _691 = fma(_209, _687, _565);
            float _693 = fma(_245, _687, _569);
            _643 = _681;
            _615 = _691;
            _617 = _689;
            _619 = _693;
        }
    }
    float _695 = _643;
    float _697 = _615;
    float _699 = _617;
    float _701 = _619;
    float _703 = _621;
    float _705 = _695;
    float _707 = _703;
    if (_599)
    {
        _645 = 1.0;
    }
    float _709 = _645;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _713 = _639 * _711;
    float _715 = _709;
    if (!_599)
    {
        float _717 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _719 = _717 * 0.15915493667125701904296875;
        float _721 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _723 = _719 * 6.283185482025146484375;
        float _725 = cos(_723);
        float _727 = _721 * 0.15915493667125701904296875;
        float _729 = _719 * 6.283185482025146484375;
        float _731 = sin(_729);
        float _733 = 1.0 / _725;
        float _735 = _727 * 6.283185482025146484375;
        float _737 = cos(_735);
        float _739 = _731 * _733;
        float _741 = _727 * 6.283185482025146484375;
        float _743 = sin(_741);
        float _745 = _737 * _739;
        float _747 = 1.0 / _745;
        float _749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _749;
        float _753 = 1.0 / _751;
        float _755 = _743 * _747;
        float _757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _759 = fma(_713, _755, _757);
        float _761 = _759 * _753;
        float _763 = precise::clamp(_761, 0.0, 1.0);
        _705 = _759;
        _647 = _763;
    }
    float _765 = _705;
    float _767 = _647;
    float _769 = _765;
    if (!_599)
    {
        float _771 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _777 = _773 * 6.283185482025146484375;
        float _779 = cos(_777);
        float _781 = _775 * 0.15915493667125701904296875;
        float _783 = _773 * 6.283185482025146484375;
        float _785 = sin(_783);
        float _787 = 1.0 / _779;
        float _789 = _781 * 6.283185482025146484375;
        float _791 = cos(_789);
        float _793 = _785 * _787;
        float _795 = _781 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = _791 * _793;
        float _801 = 1.0 / _799;
        float _803 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _805 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _803;
        float _807 = 1.0 / _805;
        float _809 = _797 * _801;
        float _811 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _813 = fma(_713, _809, _811);
        float _815 = _813 * _807;
        float _817 = precise::clamp(_815, 0.0, 1.0);
        float _819 = -_817;
        float _821 = _819 + 1.0;
        _769 = _787;
        _715 = _821;
    }
    float _823 = _769;
    float _825 = _715;
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _829 = _697 + _827;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _833 = _699 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _837 = _701 + _835;
    float _839 = _829 * _829;
    float _841 = fma(_833, _833, _839);
    float _843 = fma(_837, _837, _841);
    float _845 = rsqrt(_843);
    float _847 = _845 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _849 = _833 * _847;
    float _851 = _837 * _847;
    float _853 = _849 * _849;
    float _855 = _851 * _851;
    float _857 = _853 + _855;
    float _859 = sqrt(_857);
    bool _861 = _859 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _865 = _859 + _863;
    float _867 = _837;
    float _869 = _857;
    float _871 = _865;
    float _873 = _823;
    if (_861)
    {
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _867 = _875;
    }
    float _877 = _867;
    if (_861)
    {
        float _879 = rsqrt(_857);
        _869 = _879;
    }
    float _881 = _869;
    if (_861)
    {
        float _883 = _865 * _877;
        _871 = _883;
    }
    float _885 = _871;
    if (_861)
    {
        float _887 = _885 * 0.15915493667125701904296875;
        _873 = _887;
    }
    float _889 = _873;
    float _891 = _839;
    float _893 = _889;
    if (_861)
    {
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        _891 = _897;
    }
    float _899 = _891;
    float _901 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _903 = precise::max(0.0, _901);
    float _905 = _845;
    float _907 = _903;
    float _909 = _901;
    if (_861)
    {
        float _911 = _889 * 6.283185482025146484375;
        float _913 = cos(_911);
        _905 = _913;
    }
    float _915 = _905;
    float _917 = -_847;
    float _919 = -_903;
    float _921 = fma(_829, _917, _919);
    float _923 = _921;
    if (!_861)
    {
        _907 = _849;
    }
    float _925 = _907;
    float _927 = _925;
    if (_861)
    {
        float _929 = _921 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _909 = _929;
    }
    float _931 = _909;
    float _933 = _899;
    float _935 = _931;
    if (_861)
    {
        float _937 = fma(_899, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _933 = _937;
    }
    float _939 = _933;
    float _941 = _939;
    float _943 = _915;
    if (_861)
    {
        float _945 = _915 + (-1.0);
        _935 = _945;
    }
    float _947 = _935;
    float _949 = _947;
    if (_861)
    {
        float _951 = _881 * _939;
        _707 = _951;
    }
    float _953 = _707;
    if (!_861)
    {
        _941 = _853;
    }
    float _955 = _941;
    float _957 = sqrt(_843);
    float _959 = _955;
    if (_861)
    {
        float _961 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _961;
    }
    float _963 = _893;
    if (_861)
    {
        float _965 = _849 * _953;
        _927 = _965;
    }
    float _967 = _927;
    if (!_861)
    {
        _949 = _851;
    }
    float _969 = _949;
    float _971 = _969;
    if (_861)
    {
        float _973 = _851 * _953;
        _971 = _973;
    }
    float _975 = _971;
    if (_861)
    {
        float _977 = fma(_921, _915, _963);
        _923 = _977;
    }
    float _979 = _923;
    if (_861)
    {
        float _981 = _967 * _967;
        _959 = _981;
    }
    float _983 = _959;
    if (!_861)
    {
        _943 = _855;
    }
    float _985 = _943;
    float _987 = _985;
    if (_861)
    {
        float _989 = _975 * _975;
        _987 = _989;
    }
    float _991 = _987;
    float _993 = fma(_979, _979, _983);
    float _995 = _993 + _991;
    float _997 = _697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1001 = fma(_957, (*spvDescriptorSet0.vp_c15)._m0[23].w, _999);
    float _1003 = precise::clamp(_1001, 0.0, 1.0);
    float _1005 = _697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1009 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _997);
    float _1011 = rsqrt(_995);
    float _1013 = -_1003;
    float _1015 = _1013 + 1.0;
    float _1017 = _697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1019 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1009);
    float _1021 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1005);
    float _1023 = _697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1025 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1027 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1017);
    float _1029 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1021);
    float _1031 = abs(_1015);
    float _1033 = log2(_1031);
    float _1035 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1023);
    float _1037 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1027);
    float _1039 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1041 = _1025 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1043 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1035);
    float _1045 = _1011 * _967;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = _1011 * _979;
    float _1053 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1055 = _1011 * _975;
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1059 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1061 = -_1053;
    float _1063 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1061);
    float _1065 = -_1041;
    float _1067 = fma(_1065, _1007, 1.0);
    float _1069 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1057);
    float _1071 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1073 = -_1055;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1063);
    float _1077 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1079 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1069);
    float _1081 = log2(_1067);
    float _1083 = fma(_1075, -0.5, 0.5);
    float _1085 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1087 = fma(_1075, 0.5, 0.5);
    float _1089 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1077);
    float _1091 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1085);
    float _1093 = _1051 + 1.0;
    float _1095 = 1.0 / _1079;
    float _1097 = fma(_1087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1099 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1089);
    float _1101 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1091);
    float _1103 = fma(_1087, _1097, -0.212114393711090087890625);
    float _1105 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1099);
    float _1107 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1101);
    float _1109 = exp2(_1071);
    float _1111 = fma(_1087, _1103, 1.570728778839111328125);
    float _1113 = _1081 * 0.693147182464599609375;
    float _1115 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1117 = sqrt(_1083);
    float _1119 = _1105 * _1095;
    float _1121 = _1107 * _1095;
    float _1123 = fma(_1119, 0.5, 0.5);
    float _1125 = fma(_1121, -0.5, 0.5);
    float _1127 = -_1051;
    float _1129 = fma(_1109, _1093, _1127);
    float3 _3118 = float3(_1123, _1125, _1115);
    float _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3118, float3(0.0), isnan(_3118)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3118, float3(0.0), isnan(_3118)), level(0.0)).x;
    float _1133 = _1117 * 0.636619746685028076171875;
    float _1135 = fma(_1129, 0.5, 0.5);
    float _1137 = -_1111;
    float _1139 = fma(_1133, _1137, 1.0);
    float3 _3139 = float3(_1123, _1125, _1115);
    float4 _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3139, float3(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3139, float3(0.0), isnan(_3139)), level(0.0)).xyzw;
    float _1144 = _1142.x;
    float _1146 = _1142.y;
    float _1148 = _1142.z;
    float _1150 = _1142.w;
    float2 _3156 = float2(_1139, _1135);
    float3 _1154 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3156, float2(0.0), isnan(_3156)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3156, float2(0.0), isnan(_3156)), level(0.0)).xyz;
    float _1156 = _1154.x;
    float _1158 = _1154.y;
    float _1160 = _1154.z;
    float _1162 = in.m_49.y;
    float _1164 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1166 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = 1.0 / _1170;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1190 = _1188 != 0;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = 1.0 / _1174;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1198 = _379 + _1196;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1166);
    out.m_58.x = _1184;
    out.m_58.y = _1186;
    out.m_58.z = _1192;
    bool _1206 = _1162 > 0.5;
    float _1208 = _1198 * _1178;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1212 = _379 + _1210;
    float _1214 = exp2(_1164);
    bool _1216 = _139 > 0.5;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1222;
    float _1226 = _1212 * _1194;
    bool _1228 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1230 = isnan(_379);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = fma(_1220, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1242 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1244 = isnan(_379);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1262 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1264 = isnan(_379);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1274;
    float _1278 = -_1252;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1286 = -_405;
    int _1288 = _1206 ? as_type<int>(_1286) : as_type<int>(_405);
    float _1290 = fma(_1224, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1292 = _1238 * _1280;
    float _1294 = -_1238;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(_1276, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1300 = !_1202;
    float _1302 = _1300 ? _405 : as_type<float>(_1288);
    float _1304 = fma(_1256, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1306 = _1272 * _1296;
    float _1308 = -_1272;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1260, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1314 = fma(_1284, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1316 = _1240 * _1306;
    float _1318 = _1290 * _1306;
    float _1320 = _1298 * _1306;
    float _1322 = -_411;
    int _1324 = _1216 ? as_type<int>(_1322) : as_type<int>(_411);
    float _1326 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1316);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1318);
    float _1330 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1320);
    float _1332 = -_1214;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1304, _1292, _1326);
    float _1338 = fma(_1312, _1292, _1328);
    float _1340 = fma(_1314, _1292, _1330);
    float _1342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1344 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1336);
    float _1346 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1338);
    float _1348 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1340);
    float _1350 = _767 * _825;
    bool _1352 = !_1190;
    float _1354 = _1352 ? _411 : as_type<float>(_1324);
    float _1356 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    float _1358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1360 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1364 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1366 = _767 > 0.0;
    bool _1368 = isnan(_767);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    float _1376 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1378 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1380 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1382 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1356);
    float _1384 = _1354 + 0.5;
    float _1386 = -_1302;
    float _1388 = _1386 + 0.5;
    float _1390 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1392 = _825 <= 0.0;
    bool _1394 = !_1374;
    bool _1396 = _1392 || _1394;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1380 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1404 = _1382 + _1079;
    float _1406 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1408 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_60.x = _1390;
    out.m_60.y = _1398;
    out.m_60.z = _1400;
    out.m_60.w = _1362;
    float _1410 = _1404 * 0.5;
    float _1412 = _1406 * _1342;
    float _1414 = _1408 * _1358;
    out.m_45.x = _1402;
    out.m_62.x = _1412;
    out.m_62.y = _1414;
    out.gl_Position.x = _1105;
    out.gl_Position.y = _1107;
    out.gl_Position.z = _1382;
    out.gl_Position.w = _1079;
    out.m_64.z = _1410;
    out.m_64.w = _1079;
    float _1416 = _1360 * _1131;
    float _1418 = -_1360;
    float _1420 = _1418 + 1.0;
    float _1422 = _1150 * _1416;
    float _1424 = _1150 * _1420;
    float _1426 = _1160 * _1416;
    float _1428 = fma(_1156, _1422, _1144);
    float _1430 = fma(_1158, _1422, _1146);
    float _1432 = fma(_1150, _1426, _1148);
    out.m_66.x = _1428;
    out.m_66.y = _1430;
    out.m_66.z = _1432;
    out.m_66.w = _1424;
    if (!_1396)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1434;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _371 = false;
    bool _271 = false;
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
        float _1491 = as_type<float>(_101);
        out.gl_Position.z = _1491;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1559 = as_type<float>(_137);
        out.gl_Position.z = _1559;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = floor(_153);
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    bool _181 = !_169;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _187 = _175 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    int _193 = abs(_183);
    float _195 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    bool _197 = !_159;
    int _199 = _197 ? 0 : 1;
    float _201 = -_155;
    float _203 = _153 + _201;
    bool _205 = !_173;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    int _211 = abs(_199);
    float _213 = float(_193);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_189, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    float _247 = fma(_237, _235, _227);
    float _249 = abs(_241);
    float _251 = fma(_243, _249, _247);
    bool _253 = !_219;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _119 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -_295;
    float _303 = _301 + 1.0;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _307 = 1.0 / _299;
    float _309 = _283 * _307;
    bool _311 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _313 = isnan(_279);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = _321 * _303;
    float _333 = fma(_325, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_329, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = -_321;
    float _339 = _337 + 1.0;
    float _341 = _333 * _331;
    float _343 = _335 * _331;
    float _345 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _347 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].x, _345);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].y, _347);
    bool _353 = !_305;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _119 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = as_type<float>(int(gl_VertexIndex));
    float _383 = in.m_56.x;
    float _385 = in.m_56.y;
    float _387 = in.m_42.x;
    float _389 = in.m_42.y;
    float _391 = in.m_42.z;
    int _393 = as_type<int>(_381) & 1;
    bool _395 = _393 != 0;
    int _397 = as_type<int>(_381) & 2;
    bool _399 = _397 != 0;
    float _401 = _351 * _385;
    bool _403 = !_399;
    float _405 = _403 ? (-0.5) : 0.5;
    float _407 = _349 * _383;
    bool _409 = !_395;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = _251 * _401;
    float _415 = _251 * _407;
    float _417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _405);
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _411);
    float _423 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _425 = _419 * _417;
    float _427 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = _423 * _421;
    float _431 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = _425 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _435 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _437 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    float _439 = _425 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _441 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _433);
    float _443 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[24].x, _439);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].z, _441);
    float _451 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
    float _453 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _455 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].z, _447);
    float _457 = _449 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _459 = _451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _461 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _463 = _455 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _465 = _453 + _457;
    float _467 = _425 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _469 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
    float _471 = _459 + _463;
    float _473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _475 = _465 + _473;
    float _477 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[25].x, _467);
    float _479 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _483 = _471 + _481;
    float _485 = _475 * _475;
    float _487 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].z, _477);
    float _489 = fma(_483, _483, _485);
    float _491 = _479 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _493 = _487 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _495 = sqrt(_489);
    float _497 = _491 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _499 = _491 + _493;
    float _501 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[11].x, _497);
    float _503 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _501);
    bool _505 = _495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _507 = _497;
    float _509 = _493;
    float _511 = _501;
    float _513 = _467;
    if (!_505)
    {
        _507 = _471;
    }
    float _515 = _507;
    float _517 = _515;
    if (!_505)
    {
        _509 = _465;
    }
    float _519 = _509;
    float _521 = _519;
    if (!_505)
    {
        _511 = _499;
    }
    float _523 = _511;
    bool _525 = !_505;
    float _527 = _523;
    if (!_525)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _533 = _495 + _531;
        float _535 = rsqrt(_489);
        float _537 = _533 * _529;
        float _539 = _499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = _537 * 0.15915493667125701904296875;
        float _543 = _541 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = _541 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 + (-1.0);
        float _553 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _557 = _535 * _553;
        float _559 = fma(_499, _545, _555);
        float _561 = fma(_483, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_475, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _527 = _559;
        _517 = _561;
        _521 = _563;
        _513 = _557;
    }
    float _565 = _527;
    float _567 = _517;
    float _569 = _521;
    float _571 = _513;
    float _573 = -_491;
    float _575 = _573 + _565;
    float _577 = -_459;
    float _579 = _577 + _567;
    float _581 = -_453;
    float _583 = _581 + _569;
    float _585 = _503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _587 = _575 * _575;
    float _589 = _491 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _591 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _593 = isnan(0.5);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _599 = _595 || _597;
    float _601 = 1.0 / _585;
    float _603 = fma(_579, _579, _587);
    float _605 = fma(_583, _583, _603);
    float _607 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _609 = sqrt(_605);
    float _611 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _607);
    float _613 = _571;
    float _615 = _565;
    float _617 = _567;
    float _619 = _569;
    float _621 = _583;
    if (_599)
    {
        _613 = 1.0;
    }
    float _623 = _613;
    float _625 = _611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _627 = _625 + _585;
    float _629 = _627 * _601;
    float _631 = _629 * 0.5;
    bool _633 = _609 > 0.0;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _637 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[30].w, _635);
    float _639 = 1.0 / _637;
    bool _641 = !_633;
    float _643 = _637;
    float _645 = _601;
    float _647 = _623;
    if (!_641)
    {
        float _649 = _209 * _209;
        float _651 = fma(_195, _195, _649);
        float _653 = fma(_245, _245, _651);
        float _655 = rsqrt(_605);
        float _657 = sqrt(_653);
        float _659 = _579 * _655;
        float _661 = _575 * _655;
        float _663 = _583 * _655;
        bool _665 = _657 > 0.0;
        bool _667 = !_665;
        _643 = _661;
        _621 = _663;
        if (!_667)
        {
            float _669 = rsqrt(_653);
            float _671 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _673 = _209 * _669;
            float _675 = _195 * _669;
            float _677 = _661 * _673;
            float _679 = _245 * _669;
            float _681 = fma(_659, _675, _677);
            float _683 = _671 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _685 = fma(_663, _679, _681);
            float _687 = _685 * _683;
            float _689 = fma(_195, _687, _567);
            float _691 = fma(_209, _687, _565);
            float _693 = fma(_245, _687, _569);
            _643 = _681;
            _615 = _691;
            _617 = _689;
            _619 = _693;
        }
    }
    float _695 = _643;
    float _697 = _615;
    float _699 = _617;
    float _701 = _619;
    float _703 = _621;
    float _705 = _695;
    float _707 = _703;
    if (_599)
    {
        _645 = 1.0;
    }
    float _709 = _645;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _713 = _639 * _711;
    float _715 = _709;
    if (!_599)
    {
        float _717 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _719 = _717 * 0.15915493667125701904296875;
        float _721 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _723 = _719 * 6.283185482025146484375;
        float _725 = cos(_723);
        float _727 = _721 * 0.15915493667125701904296875;
        float _729 = _719 * 6.283185482025146484375;
        float _731 = sin(_729);
        float _733 = 1.0 / _725;
        float _735 = _727 * 6.283185482025146484375;
        float _737 = cos(_735);
        float _739 = _731 * _733;
        float _741 = _727 * 6.283185482025146484375;
        float _743 = sin(_741);
        float _745 = _737 * _739;
        float _747 = 1.0 / _745;
        float _749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _749;
        float _753 = 1.0 / _751;
        float _755 = _743 * _747;
        float _757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _759 = fma(_713, _755, _757);
        float _761 = _759 * _753;
        float _763 = precise::clamp(_761, 0.0, 1.0);
        _705 = _759;
        _647 = _763;
    }
    float _765 = _705;
    float _767 = _647;
    float _769 = _765;
    if (!_599)
    {
        float _771 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _777 = _773 * 6.283185482025146484375;
        float _779 = cos(_777);
        float _781 = _775 * 0.15915493667125701904296875;
        float _783 = _773 * 6.283185482025146484375;
        float _785 = sin(_783);
        float _787 = 1.0 / _779;
        float _789 = _781 * 6.283185482025146484375;
        float _791 = cos(_789);
        float _793 = _785 * _787;
        float _795 = _781 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = _791 * _793;
        float _801 = 1.0 / _799;
        float _803 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _805 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _803;
        float _807 = 1.0 / _805;
        float _809 = _797 * _801;
        float _811 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _813 = fma(_713, _809, _811);
        float _815 = _813 * _807;
        float _817 = precise::clamp(_815, 0.0, 1.0);
        float _819 = -_817;
        float _821 = _819 + 1.0;
        _769 = _787;
        _715 = _821;
    }
    float _823 = _769;
    float _825 = _715;
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _829 = _697 + _827;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _833 = _699 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _837 = _701 + _835;
    float _839 = _829 * _829;
    float _841 = fma(_833, _833, _839);
    float _843 = fma(_837, _837, _841);
    float _845 = rsqrt(_843);
    float _847 = _845 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _849 = _833 * _847;
    float _851 = _837 * _847;
    float _853 = _849 * _849;
    float _855 = _851 * _851;
    float _857 = _853 + _855;
    float _859 = sqrt(_857);
    bool _861 = _859 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _865 = _859 + _863;
    float _867 = _837;
    float _869 = _857;
    float _871 = _865;
    float _873 = _823;
    if (_861)
    {
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _867 = _875;
    }
    float _877 = _867;
    if (_861)
    {
        float _879 = rsqrt(_857);
        _869 = _879;
    }
    float _881 = _869;
    if (_861)
    {
        float _883 = _865 * _877;
        _871 = _883;
    }
    float _885 = _871;
    if (_861)
    {
        float _887 = _885 * 0.15915493667125701904296875;
        _873 = _887;
    }
    float _889 = _873;
    float _891 = _839;
    float _893 = _889;
    if (_861)
    {
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        _891 = _897;
    }
    float _899 = _891;
    float _901 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _903 = precise::max(0.0, _901);
    float _905 = _845;
    float _907 = _903;
    float _909 = _901;
    if (_861)
    {
        float _911 = _889 * 6.283185482025146484375;
        float _913 = cos(_911);
        _905 = _913;
    }
    float _915 = _905;
    float _917 = -_847;
    float _919 = -_903;
    float _921 = fma(_829, _917, _919);
    float _923 = _921;
    if (!_861)
    {
        _907 = _849;
    }
    float _925 = _907;
    float _927 = _925;
    if (_861)
    {
        float _929 = _921 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _909 = _929;
    }
    float _931 = _909;
    float _933 = _899;
    float _935 = _931;
    if (_861)
    {
        float _937 = fma(_899, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _933 = _937;
    }
    float _939 = _933;
    float _941 = _939;
    float _943 = _915;
    if (_861)
    {
        float _945 = _915 + (-1.0);
        _935 = _945;
    }
    float _947 = _935;
    float _949 = _947;
    if (_861)
    {
        float _951 = _881 * _939;
        _707 = _951;
    }
    float _953 = _707;
    if (!_861)
    {
        _941 = _853;
    }
    float _955 = _941;
    float _957 = sqrt(_843);
    float _959 = _955;
    if (_861)
    {
        float _961 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _961;
    }
    float _963 = _893;
    if (_861)
    {
        float _965 = _849 * _953;
        _927 = _965;
    }
    float _967 = _927;
    if (!_861)
    {
        _949 = _851;
    }
    float _969 = _949;
    float _971 = _969;
    if (_861)
    {
        float _973 = _851 * _953;
        _971 = _973;
    }
    float _975 = _971;
    if (_861)
    {
        float _977 = fma(_921, _915, _963);
        _923 = _977;
    }
    float _979 = _923;
    if (_861)
    {
        float _981 = _967 * _967;
        _959 = _981;
    }
    float _983 = _959;
    if (!_861)
    {
        _943 = _855;
    }
    float _985 = _943;
    float _987 = _985;
    if (_861)
    {
        float _989 = _975 * _975;
        _987 = _989;
    }
    float _991 = _987;
    float _993 = fma(_979, _979, _983);
    float _995 = _993 + _991;
    float _997 = _697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1001 = fma(_957, (*spvDescriptorSet0.vp_c15)._m0[23].w, _999);
    float _1003 = precise::clamp(_1001, 0.0, 1.0);
    float _1005 = _697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1009 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _997);
    float _1011 = rsqrt(_995);
    float _1013 = -_1003;
    float _1015 = _1013 + 1.0;
    float _1017 = _697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1019 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1009);
    float _1021 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1005);
    float _1023 = _697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1025 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1027 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1017);
    float _1029 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1021);
    float _1031 = abs(_1015);
    float _1033 = log2(_1031);
    float _1035 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1023);
    float _1037 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1027);
    float _1039 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1041 = _1025 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1043 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1035);
    float _1045 = _1011 * _967;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = _1011 * _979;
    float _1053 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1055 = _1011 * _975;
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1059 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1061 = -_1053;
    float _1063 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1061);
    float _1065 = -_1041;
    float _1067 = fma(_1065, _1007, 1.0);
    float _1069 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1057);
    float _1071 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1073 = -_1055;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1063);
    float _1077 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1079 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1069);
    float _1081 = log2(_1067);
    float _1083 = fma(_1075, -0.5, 0.5);
    float _1085 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1087 = fma(_1075, 0.5, 0.5);
    float _1089 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1077);
    float _1091 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1085);
    float _1093 = _1051 + 1.0;
    float _1095 = 1.0 / _1079;
    float _1097 = fma(_1087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1099 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1089);
    float _1101 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1091);
    float _1103 = fma(_1087, _1097, -0.212114393711090087890625);
    float _1105 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1099);
    float _1107 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1101);
    float _1109 = exp2(_1071);
    float _1111 = fma(_1087, _1103, 1.570728778839111328125);
    float _1113 = _1081 * 0.693147182464599609375;
    float _1115 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1117 = sqrt(_1083);
    float _1119 = _1105 * _1095;
    float _1121 = _1107 * _1095;
    float _1123 = fma(_1119, 0.5, 0.5);
    float _1125 = fma(_1121, -0.5, 0.5);
    float _1127 = -_1051;
    float _1129 = fma(_1109, _1093, _1127);
    float3 _3118 = float3(_1123, _1125, _1115);
    float _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3118, float3(0.0), isnan(_3118)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3118, float3(0.0), isnan(_3118)), level(0.0)).x;
    float _1133 = _1117 * 0.636619746685028076171875;
    float _1135 = fma(_1129, 0.5, 0.5);
    float _1137 = -_1111;
    float _1139 = fma(_1133, _1137, 1.0);
    float3 _3139 = float3(_1123, _1125, _1115);
    float4 _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3139, float3(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3139, float3(0.0), isnan(_3139)), level(0.0)).xyzw;
    float _1144 = _1142.x;
    float _1146 = _1142.y;
    float _1148 = _1142.z;
    float _1150 = _1142.w;
    float2 _3156 = float2(_1139, _1135);
    float3 _1154 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3156, float2(0.0), isnan(_3156)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3156, float2(0.0), isnan(_3156)), level(0.0)).xyz;
    float _1156 = _1154.x;
    float _1158 = _1154.y;
    float _1160 = _1154.z;
    float _1162 = in.m_49.y;
    float _1164 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1166 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = 1.0 / _1170;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1190 = _1188 != 0;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = 1.0 / _1174;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1198 = _379 + _1196;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1166);
    out.m_58.x = _1184;
    out.m_58.y = _1186;
    out.m_58.z = _1192;
    bool _1206 = _1162 > 0.5;
    float _1208 = _1198 * _1178;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1212 = _379 + _1210;
    float _1214 = exp2(_1164);
    bool _1216 = _139 > 0.5;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1222;
    float _1226 = _1212 * _1194;
    bool _1228 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1230 = isnan(_379);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = fma(_1220, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1242 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1244 = isnan(_379);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1262 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1264 = isnan(_379);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1274;
    float _1278 = -_1252;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1286 = -_405;
    int _1288 = _1206 ? as_type<int>(_1286) : as_type<int>(_405);
    float _1290 = fma(_1224, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1292 = _1238 * _1280;
    float _1294 = -_1238;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(_1276, _1208, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1300 = !_1202;
    float _1302 = _1300 ? _405 : as_type<float>(_1288);
    float _1304 = fma(_1256, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1306 = _1272 * _1296;
    float _1308 = -_1272;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_1260, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1314 = fma(_1284, _1226, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1316 = _1240 * _1306;
    float _1318 = _1290 * _1306;
    float _1320 = _1298 * _1306;
    float _1322 = -_411;
    int _1324 = _1216 ? as_type<int>(_1322) : as_type<int>(_411);
    float _1326 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1316);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1318);
    float _1330 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1320);
    float _1332 = -_1214;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1304, _1292, _1326);
    float _1338 = fma(_1312, _1292, _1328);
    float _1340 = fma(_1314, _1292, _1330);
    float _1342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1344 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1336);
    float _1346 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1338);
    float _1348 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1340);
    float _1350 = _767 * _825;
    bool _1352 = !_1190;
    float _1354 = _1352 ? _411 : as_type<float>(_1324);
    float _1356 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    float _1358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1360 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1364 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1366 = _767 > 0.0;
    bool _1368 = isnan(_767);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    float _1376 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1378 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1380 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1382 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1356);
    float _1384 = _1354 + 0.5;
    float _1386 = -_1302;
    float _1388 = _1386 + 0.5;
    float _1390 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1392 = _825 <= 0.0;
    bool _1394 = !_1374;
    bool _1396 = _1392 || _1394;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1380 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1404 = _1382 + _1079;
    float _1406 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1408 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_60.x = _1390;
    out.m_60.y = _1398;
    out.m_60.z = _1400;
    out.m_60.w = _1362;
    float _1410 = _1404 * 0.5;
    float _1412 = _1406 * _1342;
    float _1414 = _1408 * _1358;
    out.m_45.x = _1402;
    out.m_62.x = _1412;
    out.m_62.y = _1414;
    out.gl_Position.x = _1105;
    out.gl_Position.y = _1107;
    out.gl_Position.z = _1382;
    out.gl_Position.w = _1079;
    out.m_64.z = _1410;
    out.m_64.w = _1079;
    float _1416 = _1360 * _1131;
    float _1418 = -_1360;
    float _1420 = _1418 + 1.0;
    float _1422 = _1150 * _1416;
    float _1424 = _1150 * _1420;
    float _1426 = _1160 * _1416;
    float _1428 = fma(_1156, _1422, _1144);
    float _1430 = fma(_1158, _1422, _1146);
    float _1432 = fma(_1150, _1426, _1148);
    out.m_66.x = _1428;
    out.m_66.y = _1430;
    out.m_66.z = _1432;
    out.m_66.w = _1424;
    if (!_1396)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1434;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

