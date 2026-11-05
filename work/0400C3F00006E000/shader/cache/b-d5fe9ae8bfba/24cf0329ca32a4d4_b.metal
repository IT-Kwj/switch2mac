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
    float4 m_58 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _375 = false;
    bool _275 = false;
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
        float _1507 = as_type<float>(_101);
        out.gl_Position.z = _1507;
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
        float _1575 = as_type<float>(_137);
        out.gl_Position.z = _1575;
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
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    float _201 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_169;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_195);
    float _213 = -_205;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = float(_199);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_209);
    float _223 = fma(_189, 0.5, 0.5);
    float _225 = abs(_215);
    float _227 = _217 * _225;
    bool _229 = _205 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _247 = fma(_237, _235, _227);
    float _249 = abs(_241);
    float _251 = fma(_243, _249, _247);
    bool _253 = !_219;
    float _255 = _201;
    float _257 = _197;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _119 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -_299;
    float _307 = _305 + 1.0;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _303;
    float _329 = _319 * _307;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _287 * _327;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_323, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _341 * _329;
    float _347 = _343 * _329;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _351 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _353 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].x, _349);
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].y, _351);
    bool _357 = !_325;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _361 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_85);
        float _379 = 1.0 / _377;
        float _381 = _119 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = as_type<float>(int(gl_VertexIndex));
    float _387 = in.m_56.x;
    float _389 = in.m_56.y;
    float _391 = in.m_42.x;
    float _393 = in.m_42.y;
    float _395 = in.m_42.z;
    int _397 = as_type<int>(_385) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>(_385) & 2;
    bool _403 = _401 != 0;
    float _405 = _355 * _389;
    bool _407 = !_403;
    float _409 = _407 ? (-0.5) : 0.5;
    float _411 = _353 * _387;
    bool _413 = !_399;
    float _415 = _413 ? (-0.5) : 0.5;
    float _417 = _251 * _405;
    float _419 = _251 * _411;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _409);
    float _423 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _415);
    float _427 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _429 = _423 * _421;
    float _431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = _427 * _425;
    float _435 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _439 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _441 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    float _443 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _437);
    float _447 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _449 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _441);
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _443);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _445);
    float _455 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    float _457 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _459 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _461 = _453 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _463 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = _459 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _469 = _457 + _461;
    float _471 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _473 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _475 = _463 + _467;
    float _477 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _479 = _469 + _477;
    float _481 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _471);
    float _483 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _473);
    float _485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _487 = _475 + _485;
    float _489 = _479 * _479;
    float _491 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _481);
    float _493 = _483 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _495 = fma(_487, _487, _489);
    float _497 = _491 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _499 = sqrt(_495);
    float _501 = _493 + _497;
    bool _503 = _499 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _505 = _489;
    float _507 = _439;
    float _509 = _473;
    float _511 = _463;
    if (!_503)
    {
        _505 = _475;
    }
    float _513 = _505;
    float _515 = _513;
    if (!_503)
    {
        _507 = _469;
    }
    float _517 = _507;
    float _519 = _517;
    if (!_503)
    {
        _509 = _501;
    }
    float _521 = _509;
    bool _523 = !_503;
    float _525 = _521;
    if (!_523)
    {
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _531 = _499 + _529;
        float _533 = _501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = rsqrt(_495);
        float _537 = _531 * _527;
        float _539 = _537 * 0.15915493667125701904296875;
        float _541 = _539 * 6.283185482025146484375;
        float _543 = cos(_541);
        float _545 = _539 * 6.283185482025146484375;
        float _547 = sin(_545);
        float _549 = _543 + (-1.0);
        float _551 = _549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = fma(_547, _533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = fma(_501, _543, _551);
        float _557 = _535 * _553;
        float _559 = fma(_487, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _561 = fma(_479, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _525 = _555;
        _515 = _559;
        _519 = _561;
    }
    float _563 = _525;
    float _565 = _515;
    float _567 = _519;
    float _569 = -_493;
    float _571 = _569 + _563;
    float _573 = -_463;
    float _575 = _573 + _565;
    float _577 = -_457;
    float _579 = _577 + _567;
    float _581 = _493 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _583 = _571 * _571;
    bool _585 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _587 = isnan(0.5);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _593 = _589 || _591;
    float _595 = fma(_575, _575, _583);
    bool _597 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _599 = isnan(0.5);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _605 = _601 || _603;
    float _607 = fma(_579, _579, _595);
    float _609 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].x, _581);
    float _611 = _493 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _613 = sqrt(_607);
    float _615 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[11].z, _609);
    float _617 = _615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _619 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].x, _611);
    float _621 = 1.0 / _617;
    float _623 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[10].z, _619);
    float _625 = _623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _627 = _613 > 0.0;
    float _629 = _625 + _617;
    float _631 = _629 * _621;
    float _633 = _631 * 0.5;
    bool _635 = !_627;
    float _637 = _565;
    float _639 = _567;
    float _641 = _563;
    float _643 = _613;
    if (!_635)
    {
        float _645 = _201 * _201;
        float _647 = fma(_197, _197, _645);
        float _649 = fma(_245, _245, _647);
        float _651 = rsqrt(_607);
        float _653 = sqrt(_649);
        float _655 = _575 * _651;
        float _657 = _571 * _651;
        float _659 = _579 * _651;
        bool _661 = _653 > 0.0;
        bool _663 = !_661;
        _643 = _649;
        if (!_663)
        {
            float _665 = rsqrt(_649);
            float _667 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _669 = _201 * _665;
            float _671 = _197 * _665;
            float _673 = _657 * _669;
            float _675 = _245 * _665;
            float _677 = fma(_655, _671, _673);
            float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _681 = fma(_659, _675, _677);
            float _683 = _681 * _679;
            float _685 = fma(_197, _683, _565);
            float _687 = fma(_201, _683, _563);
            float _689 = fma(_245, _683, _567);
            _637 = _685;
            _639 = _689;
            _641 = _687;
            _643 = _665;
        }
    }
    float _691 = _637;
    float _693 = _639;
    float _695 = _641;
    float _697 = _643;
    float _699 = _697;
    float _701 = _695;
    float _703 = _693;
    float _705 = _691;
    if (_605)
    {
        _699 = 1.0;
    }
    float _707 = _699;
    float _709 = _707;
    if (_593)
    {
        _255 = _691;
    }
    float _711 = _255;
    float _713 = _711;
    if (_593)
    {
        _257 = _693;
    }
    float _715 = _257;
    float _717 = _715;
    if (!_593)
    {
        float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _721 = _493 + _719;
        float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _725 = _463 + _723;
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _729 = -_493;
        float _731 = _729 + _695;
        float _733 = _721 * _721;
        float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _737 = _457 + _735;
        float _739 = -_457;
        float _741 = _739 + _693;
        float _743 = fma(_725, _725, _733);
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _747 = fma(_737, _737, _743);
        float _749 = sqrt(_747);
        float _751 = _727 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _753 = precise::min(_749, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _755 = _753 * _745;
        float _757 = -_463;
        float _759 = _757 + _691;
        float _761 = _751 * _755;
        float _763 = fma(_759, _761, _463);
        float _765 = fma(_731, _761, _493);
        float _767 = fma(_741, _761, _457);
        _701 = _765;
        _713 = _763;
        _717 = _767;
        _703 = _741;
    }
    float _769 = _701;
    float _771 = _713;
    float _773 = _717;
    float _775 = _703;
    float _777 = _775;
    if (!_605)
    {
        float _779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _787 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _785);
        float _789 = _781 * 6.283185482025146484375;
        float _791 = cos(_789);
        float _793 = _783 * 0.15915493667125701904296875;
        float _795 = _781 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = 1.0 / _791;
        float _801 = _793 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = _797 * _799;
        float _807 = _793 * 6.283185482025146484375;
        float _809 = sin(_807);
        float _811 = _803 * _805;
        float _813 = 1.0 / _787;
        float _815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _817 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _815;
        float _819 = 1.0 / _811;
        float _821 = 1.0 / _817;
        float _823 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _825 = _813 * _823;
        float _827 = _809 * _819;
        float _829 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _831 = fma(_827, _825, _829);
        float _833 = _831 * _821;
        float _835 = precise::clamp(_833, 0.0, 1.0);
        _777 = _793;
        _511 = _817;
        _705 = _819;
        _709 = _835;
    }
    float _837 = _777;
    float _839 = _511;
    float _841 = _705;
    float _843 = _709;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _769 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _771 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _773 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = rsqrt(_861);
    float _865 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _867 = _851 * _865;
    float _869 = _855 * _865;
    float _871 = _867 * _867;
    float _873 = _869 * _869;
    float _875 = _871 + _873;
    float _877 = sqrt(_875);
    bool _879 = _877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = _877 + _881;
    float _885 = _863;
    float _887 = _841;
    float _889 = _883;
    float _891 = _837;
    float _893 = _847;
    if (_879)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _885 = _895;
    }
    float _897 = _885;
    if (_879)
    {
        float _899 = rsqrt(_875);
        _887 = _899;
    }
    float _901 = _887;
    float _903 = _901;
    if (_879)
    {
        float _905 = _883 * _897;
        _889 = _905;
    }
    float _907 = _889;
    if (_879)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _891 = _909;
    }
    float _911 = _891;
    float _913 = _855;
    if (_879)
    {
        float _915 = _911 * 6.283185482025146484375;
        float _917 = sin(_915);
        _913 = _917;
    }
    float _919 = _913;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _839;
    float _927 = _923;
    float _929 = _921;
    if (_879)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_865;
    float _939 = -_923;
    float _941 = fma(_847, _937, _939);
    if (_879)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = sqrt(_861);
    float _949 = _919;
    float _951 = _945;
    if (_879)
    {
        float _953 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _953;
    }
    float _955 = _893;
    float _957 = _955;
    if (!_879)
    {
        _949 = _867;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_879)
    {
        _951 = _871;
    }
    float _963 = _951;
    float _965 = _963;
    float _967 = _935;
    if (_879)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = 0.0;
    float _975 = _971;
    if (_879)
    {
        float _977 = _901 * _955;
        _973 = _977;
    }
    float _979 = _973;
    if (!_879)
    {
        _957 = _941;
    }
    float _981 = _957;
    float _983 = _981;
    if (_879)
    {
        float _985 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _985;
    }
    float _987 = _903;
    if (_879)
    {
        float _989 = _867 * _979;
        _961 = _989;
    }
    float _991 = _961;
    if (!_879)
    {
        _975 = _869;
    }
    float _993 = _975;
    float _995 = _993;
    if (_879)
    {
        float _997 = _869 * _979;
        _995 = _997;
    }
    float _999 = _995;
    if (_879)
    {
        float _1001 = fma(_941, _935, _987);
        _983 = _1001;
    }
    float _1003 = _983;
    if (_879)
    {
        float _1005 = _991 * _991;
        _965 = _1005;
    }
    float _1007 = _965;
    if (!_879)
    {
        _967 = _873;
    }
    float _1009 = _967;
    float _1011 = _1009;
    if (_879)
    {
        float _1013 = _999 * _999;
        _1011 = _1013;
    }
    float _1015 = _1011;
    float _1017 = fma(_1003, _1003, _1007);
    float _1019 = _769 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = _1017 + _1015;
    float _1023 = _769 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _769 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1033 = rsqrt(_1021);
    float _1035 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1023);
    float _1037 = -_1029;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1031);
    float _1043 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1045 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1035);
    float _1047 = _769 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1049 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1051 = abs(_1039);
    float _1053 = log2(_1051);
    float _1055 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1047);
    float _1059 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1061 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1043);
    float _1063 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1065 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1057);
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1069 = _1033 * _991;
    float _1071 = _1033 * _999;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1075 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1079 = -_1067;
    float _1081 = fma(_1079, _1063, 1.0);
    float _1083 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1075);
    float _1087 = _1033 * _1003;
    float _1089 = log2(_1081);
    float _1091 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1093 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1085);
    float _1095 = -_1077;
    float _1097 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1095);
    float _1099 = _1087 + 1.0;
    float _1101 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1093);
    float _1103 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1105 = exp2(_1091);
    float _1107 = -_1071;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1097);
    float _1111 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1113 = fma(_1109, -0.5, 0.5);
    float _1115 = fma(_1109, 0.5, 0.5);
    float _1117 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1111);
    float _1119 = 1.0 / _1101;
    float _1121 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1103);
    float _1123 = fma(_1115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1125 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1127 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1121);
    float _1129 = fma(_1115, _1123, -0.212114393711090087890625);
    float _1131 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1125);
    float _1133 = sqrt(_1113);
    float _1135 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1127);
    float _1137 = _1089 * 0.693147182464599609375;
    float _1139 = -_1087;
    float _1141 = fma(_1105, _1099, _1139);
    float _1143 = fma(_1115, _1129, 1.570728778839111328125);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1147 = fma(_1141, 0.5, 0.5);
    float _1149 = _1131 * _1119;
    float _1151 = _1135 * _1119;
    float _1153 = fma(_1149, 0.5, 0.5);
    float _1155 = fma(_1151, -0.5, 0.5);
    float _1157 = _1133 * 0.636619746685028076171875;
    float3 _3187 = float3(_1153, _1155, _1145);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3187, float3(0.0), isnan(_3187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3187, float3(0.0), isnan(_3187)), level(0.0)).x;
    float _1161 = -_1143;
    float _1163 = fma(_1157, _1161, 1.0);
    float3 _3203 = float3(_1153, _1155, _1145);
    float4 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3203, float3(0.0), isnan(_3203)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3203, float3(0.0), isnan(_3203)), level(0.0)).xyzw;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    float _1174 = _1166.w;
    float2 _3220 = float2(_1163, _1147);
    float3 _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3220, float2(0.0), isnan(_3220)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3220, float2(0.0), isnan(_3220)), level(0.0)).xyz;
    float _1180 = _1178.x;
    float _1182 = _1178.y;
    float _1184 = _1178.z;
    float _1186 = in.m_49.y;
    float _1188 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1200 = 1.0 / _1192;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1204 = _139 > 0.5;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1208 = _383 + _1206;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1218 = _1216 != 0;
    float _1220 = 1.0 / _1196;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1224 = _383 + _1222;
    float _1226 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = _1186 > 0.5;
    float _1234 = _1208 * _1200;
    bool _1236 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1238 = isnan(_383);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1248;
    out.m_58.x = _1226;
    out.m_58.y = _1228;
    out.m_58.z = _1230;
    float _1252 = exp2(_1188);
    float _1254 = fma(_1250, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1256 = _1224 * _1220;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1262;
    float _1266 = -_1246;
    float _1268 = _1266 + 1.0;
    float _1270 = fma(_1260, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1272 = fma(_1264, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1274 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1276 = isnan(_383);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1290 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1292 = isnan(_383);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1306 = -_415;
    int _1308 = _1204 ? as_type<int>(_1306) : as_type<int>(_415);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1314 = -_409;
    int _1316 = _1232 ? as_type<int>(_1314) : as_type<int>(_409);
    float _1318 = _1300 * _1268;
    float _1320 = -_1300;
    float _1322 = _1320 + 1.0;
    bool _1324 = !_1212;
    float _1326 = _1324 ? _415 : as_type<float>(_1308);
    float _1328 = fma(_1288, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1330 = !_1218;
    float _1332 = _1330 ? _409 : as_type<float>(_1316);
    float _1334 = _1284 * _1322;
    float _1336 = -_1284;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1304, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1342 = fma(_1312, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1344 = _1270 * _1334;
    float _1346 = _1272 * _1334;
    float _1348 = _1254 * _1334;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1352 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1344);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1346);
    float _1356 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1348);
    float _1358 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1360 = fma(_1328, _1318, _1352);
    float _1362 = fma(_1340, _1318, _1354);
    float _1364 = fma(_1342, _1318, _1356);
    float _1366 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1358);
    float _1368 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1360);
    float _1370 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1362);
    float _1372 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1364);
    float _1374 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1376 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1366);
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1380 = _1326 + 0.5;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1384 = -_1252;
    float _1386 = _1384 + 1.0;
    float _1388 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1390 = -_1332;
    float _1392 = _1390 + 0.5;
    bool _1394 = _843 > 0.0;
    bool _1396 = isnan(_843);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    float _1404 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1406 = _1388 + _1101;
    float _1408 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1410 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1412 = -_1404;
    float _1414 = _1412 + 1.0;
    float _1416 = _1406 * 0.5;
    float _1418 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1420 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1422 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.gl_Position.x = _1131;
    out.gl_Position.y = _1135;
    out.gl_Position.z = _1388;
    out.gl_Position.w = _1101;
    float _1424 = _1410 * _1350;
    float _1426 = _1418 * _1378;
    float _1428 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1434 = _1408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1424;
    out.m_60.y = _1426;
    out.m_62.x = _1428;
    out.m_62.y = _1430;
    out.m_62.z = _1432;
    out.m_62.w = _1382;
    out.m_64.z = _1416;
    out.m_64.w = _1101;
    out.m_45.x = _1434;
    float _1436 = _1404 * _1159;
    float _1438 = _1174 * _1436;
    float _1440 = _1184 * _1436;
    float _1442 = fma(_1180, _1438, _1168);
    float _1444 = fma(_1182, _1438, _1170);
    float _1446 = _1174 * _1414;
    float _1448 = fma(_1174, _1440, _1172);
    out.m_66.x = _1442;
    out.m_66.y = _1444;
    out.m_66.z = _1448;
    out.m_66.w = _1446;
    if (_1402)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1450;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _375 = false;
    bool _275 = false;
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
        float _1507 = as_type<float>(_101);
        out.gl_Position.z = _1507;
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
        float _1575 = as_type<float>(_137);
        out.gl_Position.z = _1575;
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
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    float _201 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_169;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_195);
    float _213 = -_205;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = float(_199);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_209);
    float _223 = fma(_189, 0.5, 0.5);
    float _225 = abs(_215);
    float _227 = _217 * _225;
    bool _229 = _205 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _247 = fma(_237, _235, _227);
    float _249 = abs(_241);
    float _251 = fma(_243, _249, _247);
    bool _253 = !_219;
    float _255 = _201;
    float _257 = _197;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _119 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -_299;
    float _307 = _305 + 1.0;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _303;
    float _329 = _319 * _307;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _287 * _327;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_323, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _341 * _329;
    float _347 = _343 * _329;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _351 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _353 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].x, _349);
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].y, _351);
    bool _357 = !_325;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _361 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_85);
        float _379 = 1.0 / _377;
        float _381 = _119 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = as_type<float>(int(gl_VertexIndex));
    float _387 = in.m_56.x;
    float _389 = in.m_56.y;
    float _391 = in.m_42.x;
    float _393 = in.m_42.y;
    float _395 = in.m_42.z;
    int _397 = as_type<int>(_385) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>(_385) & 2;
    bool _403 = _401 != 0;
    float _405 = _355 * _389;
    bool _407 = !_403;
    float _409 = _407 ? (-0.5) : 0.5;
    float _411 = _353 * _387;
    bool _413 = !_399;
    float _415 = _413 ? (-0.5) : 0.5;
    float _417 = _251 * _405;
    float _419 = _251 * _411;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _409);
    float _423 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _415);
    float _427 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _429 = _423 * _421;
    float _431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = _427 * _425;
    float _435 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _439 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _441 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    float _443 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _437);
    float _447 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _449 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _441);
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _443);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _445);
    float _455 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    float _457 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _459 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _461 = _453 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _463 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = _459 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _469 = _457 + _461;
    float _471 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _473 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _475 = _463 + _467;
    float _477 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _479 = _469 + _477;
    float _481 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _471);
    float _483 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _473);
    float _485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _487 = _475 + _485;
    float _489 = _479 * _479;
    float _491 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _481);
    float _493 = _483 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _495 = fma(_487, _487, _489);
    float _497 = _491 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _499 = sqrt(_495);
    float _501 = _493 + _497;
    bool _503 = _499 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _505 = _489;
    float _507 = _439;
    float _509 = _473;
    float _511 = _463;
    if (!_503)
    {
        _505 = _475;
    }
    float _513 = _505;
    float _515 = _513;
    if (!_503)
    {
        _507 = _469;
    }
    float _517 = _507;
    float _519 = _517;
    if (!_503)
    {
        _509 = _501;
    }
    float _521 = _509;
    bool _523 = !_503;
    float _525 = _521;
    if (!_523)
    {
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _531 = _499 + _529;
        float _533 = _501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = rsqrt(_495);
        float _537 = _531 * _527;
        float _539 = _537 * 0.15915493667125701904296875;
        float _541 = _539 * 6.283185482025146484375;
        float _543 = cos(_541);
        float _545 = _539 * 6.283185482025146484375;
        float _547 = sin(_545);
        float _549 = _543 + (-1.0);
        float _551 = _549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = fma(_547, _533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = fma(_501, _543, _551);
        float _557 = _535 * _553;
        float _559 = fma(_487, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _561 = fma(_479, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _525 = _555;
        _515 = _559;
        _519 = _561;
    }
    float _563 = _525;
    float _565 = _515;
    float _567 = _519;
    float _569 = -_493;
    float _571 = _569 + _563;
    float _573 = -_463;
    float _575 = _573 + _565;
    float _577 = -_457;
    float _579 = _577 + _567;
    float _581 = _493 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _583 = _571 * _571;
    bool _585 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _587 = isnan(0.5);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _593 = _589 || _591;
    float _595 = fma(_575, _575, _583);
    bool _597 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _599 = isnan(0.5);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _605 = _601 || _603;
    float _607 = fma(_579, _579, _595);
    float _609 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].x, _581);
    float _611 = _493 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _613 = sqrt(_607);
    float _615 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[11].z, _609);
    float _617 = _615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _619 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].x, _611);
    float _621 = 1.0 / _617;
    float _623 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[10].z, _619);
    float _625 = _623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _627 = _613 > 0.0;
    float _629 = _625 + _617;
    float _631 = _629 * _621;
    float _633 = _631 * 0.5;
    bool _635 = !_627;
    float _637 = _565;
    float _639 = _567;
    float _641 = _563;
    float _643 = _613;
    if (!_635)
    {
        float _645 = _201 * _201;
        float _647 = fma(_197, _197, _645);
        float _649 = fma(_245, _245, _647);
        float _651 = rsqrt(_607);
        float _653 = sqrt(_649);
        float _655 = _575 * _651;
        float _657 = _571 * _651;
        float _659 = _579 * _651;
        bool _661 = _653 > 0.0;
        bool _663 = !_661;
        _643 = _649;
        if (!_663)
        {
            float _665 = rsqrt(_649);
            float _667 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _669 = _201 * _665;
            float _671 = _197 * _665;
            float _673 = _657 * _669;
            float _675 = _245 * _665;
            float _677 = fma(_655, _671, _673);
            float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _681 = fma(_659, _675, _677);
            float _683 = _681 * _679;
            float _685 = fma(_197, _683, _565);
            float _687 = fma(_201, _683, _563);
            float _689 = fma(_245, _683, _567);
            _637 = _685;
            _639 = _689;
            _641 = _687;
            _643 = _665;
        }
    }
    float _691 = _637;
    float _693 = _639;
    float _695 = _641;
    float _697 = _643;
    float _699 = _697;
    float _701 = _695;
    float _703 = _693;
    float _705 = _691;
    if (_605)
    {
        _699 = 1.0;
    }
    float _707 = _699;
    float _709 = _707;
    if (_593)
    {
        _255 = _691;
    }
    float _711 = _255;
    float _713 = _711;
    if (_593)
    {
        _257 = _693;
    }
    float _715 = _257;
    float _717 = _715;
    if (!_593)
    {
        float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _721 = _493 + _719;
        float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _725 = _463 + _723;
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _729 = -_493;
        float _731 = _729 + _695;
        float _733 = _721 * _721;
        float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _737 = _457 + _735;
        float _739 = -_457;
        float _741 = _739 + _693;
        float _743 = fma(_725, _725, _733);
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _747 = fma(_737, _737, _743);
        float _749 = sqrt(_747);
        float _751 = _727 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _753 = precise::min(_749, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _755 = _753 * _745;
        float _757 = -_463;
        float _759 = _757 + _691;
        float _761 = _751 * _755;
        float _763 = fma(_759, _761, _463);
        float _765 = fma(_731, _761, _493);
        float _767 = fma(_741, _761, _457);
        _701 = _765;
        _713 = _763;
        _717 = _767;
        _703 = _741;
    }
    float _769 = _701;
    float _771 = _713;
    float _773 = _717;
    float _775 = _703;
    float _777 = _775;
    if (!_605)
    {
        float _779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _787 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _785);
        float _789 = _781 * 6.283185482025146484375;
        float _791 = cos(_789);
        float _793 = _783 * 0.15915493667125701904296875;
        float _795 = _781 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = 1.0 / _791;
        float _801 = _793 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = _797 * _799;
        float _807 = _793 * 6.283185482025146484375;
        float _809 = sin(_807);
        float _811 = _803 * _805;
        float _813 = 1.0 / _787;
        float _815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _817 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _815;
        float _819 = 1.0 / _811;
        float _821 = 1.0 / _817;
        float _823 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _825 = _813 * _823;
        float _827 = _809 * _819;
        float _829 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _831 = fma(_827, _825, _829);
        float _833 = _831 * _821;
        float _835 = precise::clamp(_833, 0.0, 1.0);
        _777 = _793;
        _511 = _817;
        _705 = _819;
        _709 = _835;
    }
    float _837 = _777;
    float _839 = _511;
    float _841 = _705;
    float _843 = _709;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _769 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _771 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _773 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = rsqrt(_861);
    float _865 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _867 = _851 * _865;
    float _869 = _855 * _865;
    float _871 = _867 * _867;
    float _873 = _869 * _869;
    float _875 = _871 + _873;
    float _877 = sqrt(_875);
    bool _879 = _877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = _877 + _881;
    float _885 = _863;
    float _887 = _841;
    float _889 = _883;
    float _891 = _837;
    float _893 = _847;
    if (_879)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _885 = _895;
    }
    float _897 = _885;
    if (_879)
    {
        float _899 = rsqrt(_875);
        _887 = _899;
    }
    float _901 = _887;
    float _903 = _901;
    if (_879)
    {
        float _905 = _883 * _897;
        _889 = _905;
    }
    float _907 = _889;
    if (_879)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _891 = _909;
    }
    float _911 = _891;
    float _913 = _855;
    if (_879)
    {
        float _915 = _911 * 6.283185482025146484375;
        float _917 = sin(_915);
        _913 = _917;
    }
    float _919 = _913;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _839;
    float _927 = _923;
    float _929 = _921;
    if (_879)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_865;
    float _939 = -_923;
    float _941 = fma(_847, _937, _939);
    if (_879)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = sqrt(_861);
    float _949 = _919;
    float _951 = _945;
    if (_879)
    {
        float _953 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _953;
    }
    float _955 = _893;
    float _957 = _955;
    if (!_879)
    {
        _949 = _867;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_879)
    {
        _951 = _871;
    }
    float _963 = _951;
    float _965 = _963;
    float _967 = _935;
    if (_879)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = 0.0;
    float _975 = _971;
    if (_879)
    {
        float _977 = _901 * _955;
        _973 = _977;
    }
    float _979 = _973;
    if (!_879)
    {
        _957 = _941;
    }
    float _981 = _957;
    float _983 = _981;
    if (_879)
    {
        float _985 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _985;
    }
    float _987 = _903;
    if (_879)
    {
        float _989 = _867 * _979;
        _961 = _989;
    }
    float _991 = _961;
    if (!_879)
    {
        _975 = _869;
    }
    float _993 = _975;
    float _995 = _993;
    if (_879)
    {
        float _997 = _869 * _979;
        _995 = _997;
    }
    float _999 = _995;
    if (_879)
    {
        float _1001 = fma(_941, _935, _987);
        _983 = _1001;
    }
    float _1003 = _983;
    if (_879)
    {
        float _1005 = _991 * _991;
        _965 = _1005;
    }
    float _1007 = _965;
    if (!_879)
    {
        _967 = _873;
    }
    float _1009 = _967;
    float _1011 = _1009;
    if (_879)
    {
        float _1013 = _999 * _999;
        _1011 = _1013;
    }
    float _1015 = _1011;
    float _1017 = fma(_1003, _1003, _1007);
    float _1019 = _769 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = _1017 + _1015;
    float _1023 = _769 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _769 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1033 = rsqrt(_1021);
    float _1035 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1023);
    float _1037 = -_1029;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1031);
    float _1043 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1045 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1035);
    float _1047 = _769 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1049 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1051 = abs(_1039);
    float _1053 = log2(_1051);
    float _1055 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1047);
    float _1059 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1061 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1043);
    float _1063 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1065 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1057);
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1069 = _1033 * _991;
    float _1071 = _1033 * _999;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1075 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1079 = -_1067;
    float _1081 = fma(_1079, _1063, 1.0);
    float _1083 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1075);
    float _1087 = _1033 * _1003;
    float _1089 = log2(_1081);
    float _1091 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1093 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1085);
    float _1095 = -_1077;
    float _1097 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1095);
    float _1099 = _1087 + 1.0;
    float _1101 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1093);
    float _1103 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1105 = exp2(_1091);
    float _1107 = -_1071;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1097);
    float _1111 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1113 = fma(_1109, -0.5, 0.5);
    float _1115 = fma(_1109, 0.5, 0.5);
    float _1117 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1111);
    float _1119 = 1.0 / _1101;
    float _1121 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1103);
    float _1123 = fma(_1115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1125 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1127 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1121);
    float _1129 = fma(_1115, _1123, -0.212114393711090087890625);
    float _1131 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1125);
    float _1133 = sqrt(_1113);
    float _1135 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1127);
    float _1137 = _1089 * 0.693147182464599609375;
    float _1139 = -_1087;
    float _1141 = fma(_1105, _1099, _1139);
    float _1143 = fma(_1115, _1129, 1.570728778839111328125);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1147 = fma(_1141, 0.5, 0.5);
    float _1149 = _1131 * _1119;
    float _1151 = _1135 * _1119;
    float _1153 = fma(_1149, 0.5, 0.5);
    float _1155 = fma(_1151, -0.5, 0.5);
    float _1157 = _1133 * 0.636619746685028076171875;
    float3 _3187 = float3(_1153, _1155, _1145);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3187, float3(0.0), isnan(_3187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3187, float3(0.0), isnan(_3187)), level(0.0)).x;
    float _1161 = -_1143;
    float _1163 = fma(_1157, _1161, 1.0);
    float3 _3203 = float3(_1153, _1155, _1145);
    float4 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3203, float3(0.0), isnan(_3203)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3203, float3(0.0), isnan(_3203)), level(0.0)).xyzw;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    float _1174 = _1166.w;
    float2 _3220 = float2(_1163, _1147);
    float3 _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3220, float2(0.0), isnan(_3220)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3220, float2(0.0), isnan(_3220)), level(0.0)).xyz;
    float _1180 = _1178.x;
    float _1182 = _1178.y;
    float _1184 = _1178.z;
    float _1186 = in.m_49.y;
    float _1188 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1200 = 1.0 / _1192;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1204 = _139 > 0.5;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1208 = _383 + _1206;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1218 = _1216 != 0;
    float _1220 = 1.0 / _1196;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1224 = _383 + _1222;
    float _1226 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = _1186 > 0.5;
    float _1234 = _1208 * _1200;
    bool _1236 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1238 = isnan(_383);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1248;
    out.m_58.x = _1226;
    out.m_58.y = _1228;
    out.m_58.z = _1230;
    float _1252 = exp2(_1188);
    float _1254 = fma(_1250, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1256 = _1224 * _1220;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1262;
    float _1266 = -_1246;
    float _1268 = _1266 + 1.0;
    float _1270 = fma(_1260, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1272 = fma(_1264, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1274 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1276 = isnan(_383);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1290 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1292 = isnan(_383);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1306 = -_415;
    int _1308 = _1204 ? as_type<int>(_1306) : as_type<int>(_415);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1314 = -_409;
    int _1316 = _1232 ? as_type<int>(_1314) : as_type<int>(_409);
    float _1318 = _1300 * _1268;
    float _1320 = -_1300;
    float _1322 = _1320 + 1.0;
    bool _1324 = !_1212;
    float _1326 = _1324 ? _415 : as_type<float>(_1308);
    float _1328 = fma(_1288, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1330 = !_1218;
    float _1332 = _1330 ? _409 : as_type<float>(_1316);
    float _1334 = _1284 * _1322;
    float _1336 = -_1284;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1304, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1342 = fma(_1312, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1344 = _1270 * _1334;
    float _1346 = _1272 * _1334;
    float _1348 = _1254 * _1334;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1352 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1344);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1346);
    float _1356 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1348);
    float _1358 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1360 = fma(_1328, _1318, _1352);
    float _1362 = fma(_1340, _1318, _1354);
    float _1364 = fma(_1342, _1318, _1356);
    float _1366 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1358);
    float _1368 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1360);
    float _1370 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1362);
    float _1372 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1364);
    float _1374 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1376 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1366);
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1380 = _1326 + 0.5;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1384 = -_1252;
    float _1386 = _1384 + 1.0;
    float _1388 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1390 = -_1332;
    float _1392 = _1390 + 0.5;
    bool _1394 = _843 > 0.0;
    bool _1396 = isnan(_843);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    float _1404 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1406 = _1388 + _1101;
    float _1408 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1410 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1412 = -_1404;
    float _1414 = _1412 + 1.0;
    float _1416 = _1406 * 0.5;
    float _1418 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1420 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1422 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.gl_Position.x = _1131;
    out.gl_Position.y = _1135;
    out.gl_Position.z = _1388;
    out.gl_Position.w = _1101;
    float _1424 = _1410 * _1350;
    float _1426 = _1418 * _1378;
    float _1428 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1434 = _1408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1424;
    out.m_60.y = _1426;
    out.m_62.x = _1428;
    out.m_62.y = _1430;
    out.m_62.z = _1432;
    out.m_62.w = _1382;
    out.m_64.z = _1416;
    out.m_64.w = _1101;
    out.m_45.x = _1434;
    float _1436 = _1404 * _1159;
    float _1438 = _1174 * _1436;
    float _1440 = _1184 * _1436;
    float _1442 = fma(_1180, _1438, _1168);
    float _1444 = fma(_1182, _1438, _1170);
    float _1446 = _1174 * _1414;
    float _1448 = fma(_1174, _1440, _1172);
    out.m_66.x = _1442;
    out.m_66.y = _1444;
    out.m_66.z = _1448;
    out.m_66.w = _1446;
    if (_1402)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1450;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _375 = false;
    bool _275 = false;
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
        float _1507 = as_type<float>(_101);
        out.gl_Position.z = _1507;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1575 = as_type<float>(_137);
        out.gl_Position.z = _1575;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    float _201 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_169;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_195);
    float _213 = -_205;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = float(_199);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_209);
    float _223 = fma(_189, 0.5, 0.5);
    float _225 = abs(_215);
    float _227 = _217 * _225;
    bool _229 = _205 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _247 = fma(_237, _235, _227);
    float _249 = abs(_241);
    float _251 = fma(_243, _249, _247);
    bool _253 = !_219;
    float _255 = _201;
    float _257 = _197;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _119 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -_299;
    float _307 = _305 + 1.0;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _303;
    float _329 = _319 * _307;
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _287 * _327;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = fma(_323, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = fma(_339, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _341 * _329;
    float _347 = _343 * _329;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _351 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _353 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].x, _349);
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[144].y, _351);
    bool _357 = !_325;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _361 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_85);
        float _379 = 1.0 / _377;
        float _381 = _119 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = as_type<float>(int(gl_VertexIndex));
    float _387 = in.m_56.x;
    float _389 = in.m_56.y;
    float _391 = in.m_42.x;
    float _393 = in.m_42.y;
    float _395 = in.m_42.z;
    int _397 = as_type<int>(_385) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>(_385) & 2;
    bool _403 = _401 != 0;
    float _405 = _355 * _389;
    bool _407 = !_403;
    float _409 = _407 ? (-0.5) : 0.5;
    float _411 = _353 * _387;
    bool _413 = !_399;
    float _415 = _413 ? (-0.5) : 0.5;
    float _417 = _251 * _405;
    float _419 = _251 * _411;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _409);
    float _423 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _415);
    float _427 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _429 = _423 * _421;
    float _431 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = _427 * _425;
    float _435 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _439 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _441 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    float _443 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _437);
    float _447 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _449 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _441);
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _443);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _445);
    float _455 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    float _457 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _459 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _461 = _453 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _463 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = _459 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _469 = _457 + _461;
    float _471 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _473 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _475 = _463 + _467;
    float _477 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _479 = _469 + _477;
    float _481 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _471);
    float _483 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _473);
    float _485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _487 = _475 + _485;
    float _489 = _479 * _479;
    float _491 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _481);
    float _493 = _483 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _495 = fma(_487, _487, _489);
    float _497 = _491 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _499 = sqrt(_495);
    float _501 = _493 + _497;
    bool _503 = _499 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _505 = _489;
    float _507 = _439;
    float _509 = _473;
    float _511 = _463;
    if (!_503)
    {
        _505 = _475;
    }
    float _513 = _505;
    float _515 = _513;
    if (!_503)
    {
        _507 = _469;
    }
    float _517 = _507;
    float _519 = _517;
    if (!_503)
    {
        _509 = _501;
    }
    float _521 = _509;
    bool _523 = !_503;
    float _525 = _521;
    if (!_523)
    {
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _531 = _499 + _529;
        float _533 = _501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = rsqrt(_495);
        float _537 = _531 * _527;
        float _539 = _537 * 0.15915493667125701904296875;
        float _541 = _539 * 6.283185482025146484375;
        float _543 = cos(_541);
        float _545 = _539 * 6.283185482025146484375;
        float _547 = sin(_545);
        float _549 = _543 + (-1.0);
        float _551 = _549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = fma(_547, _533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = fma(_501, _543, _551);
        float _557 = _535 * _553;
        float _559 = fma(_487, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _561 = fma(_479, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _525 = _555;
        _515 = _559;
        _519 = _561;
    }
    float _563 = _525;
    float _565 = _515;
    float _567 = _519;
    float _569 = -_493;
    float _571 = _569 + _563;
    float _573 = -_463;
    float _575 = _573 + _565;
    float _577 = -_457;
    float _579 = _577 + _567;
    float _581 = _493 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _583 = _571 * _571;
    bool _585 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _587 = isnan(0.5);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _593 = _589 || _591;
    float _595 = fma(_575, _575, _583);
    bool _597 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _599 = isnan(0.5);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _605 = _601 || _603;
    float _607 = fma(_579, _579, _595);
    float _609 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].x, _581);
    float _611 = _493 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _613 = sqrt(_607);
    float _615 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[11].z, _609);
    float _617 = _615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _619 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].x, _611);
    float _621 = 1.0 / _617;
    float _623 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[10].z, _619);
    float _625 = _623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _627 = _613 > 0.0;
    float _629 = _625 + _617;
    float _631 = _629 * _621;
    float _633 = _631 * 0.5;
    bool _635 = !_627;
    float _637 = _565;
    float _639 = _567;
    float _641 = _563;
    float _643 = _613;
    if (!_635)
    {
        float _645 = _201 * _201;
        float _647 = fma(_197, _197, _645);
        float _649 = fma(_245, _245, _647);
        float _651 = rsqrt(_607);
        float _653 = sqrt(_649);
        float _655 = _575 * _651;
        float _657 = _571 * _651;
        float _659 = _579 * _651;
        bool _661 = _653 > 0.0;
        bool _663 = !_661;
        _643 = _649;
        if (!_663)
        {
            float _665 = rsqrt(_649);
            float _667 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _669 = _201 * _665;
            float _671 = _197 * _665;
            float _673 = _657 * _669;
            float _675 = _245 * _665;
            float _677 = fma(_655, _671, _673);
            float _679 = _667 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _681 = fma(_659, _675, _677);
            float _683 = _681 * _679;
            float _685 = fma(_197, _683, _565);
            float _687 = fma(_201, _683, _563);
            float _689 = fma(_245, _683, _567);
            _637 = _685;
            _639 = _689;
            _641 = _687;
            _643 = _665;
        }
    }
    float _691 = _637;
    float _693 = _639;
    float _695 = _641;
    float _697 = _643;
    float _699 = _697;
    float _701 = _695;
    float _703 = _693;
    float _705 = _691;
    if (_605)
    {
        _699 = 1.0;
    }
    float _707 = _699;
    float _709 = _707;
    if (_593)
    {
        _255 = _691;
    }
    float _711 = _255;
    float _713 = _711;
    if (_593)
    {
        _257 = _693;
    }
    float _715 = _257;
    float _717 = _715;
    if (!_593)
    {
        float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _721 = _493 + _719;
        float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _725 = _463 + _723;
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _729 = -_493;
        float _731 = _729 + _695;
        float _733 = _721 * _721;
        float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _737 = _457 + _735;
        float _739 = -_457;
        float _741 = _739 + _693;
        float _743 = fma(_725, _725, _733);
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _747 = fma(_737, _737, _743);
        float _749 = sqrt(_747);
        float _751 = _727 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _753 = precise::min(_749, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _755 = _753 * _745;
        float _757 = -_463;
        float _759 = _757 + _691;
        float _761 = _751 * _755;
        float _763 = fma(_759, _761, _463);
        float _765 = fma(_731, _761, _493);
        float _767 = fma(_741, _761, _457);
        _701 = _765;
        _713 = _763;
        _717 = _767;
        _703 = _741;
    }
    float _769 = _701;
    float _771 = _713;
    float _773 = _717;
    float _775 = _703;
    float _777 = _775;
    if (!_605)
    {
        float _779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _787 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _785);
        float _789 = _781 * 6.283185482025146484375;
        float _791 = cos(_789);
        float _793 = _783 * 0.15915493667125701904296875;
        float _795 = _781 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = 1.0 / _791;
        float _801 = _793 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = _797 * _799;
        float _807 = _793 * 6.283185482025146484375;
        float _809 = sin(_807);
        float _811 = _803 * _805;
        float _813 = 1.0 / _787;
        float _815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _817 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _815;
        float _819 = 1.0 / _811;
        float _821 = 1.0 / _817;
        float _823 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _825 = _813 * _823;
        float _827 = _809 * _819;
        float _829 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _831 = fma(_827, _825, _829);
        float _833 = _831 * _821;
        float _835 = precise::clamp(_833, 0.0, 1.0);
        _777 = _793;
        _511 = _817;
        _705 = _819;
        _709 = _835;
    }
    float _837 = _777;
    float _839 = _511;
    float _841 = _705;
    float _843 = _709;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _769 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _771 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _773 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = rsqrt(_861);
    float _865 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _867 = _851 * _865;
    float _869 = _855 * _865;
    float _871 = _867 * _867;
    float _873 = _869 * _869;
    float _875 = _871 + _873;
    float _877 = sqrt(_875);
    bool _879 = _877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = _877 + _881;
    float _885 = _863;
    float _887 = _841;
    float _889 = _883;
    float _891 = _837;
    float _893 = _847;
    if (_879)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _885 = _895;
    }
    float _897 = _885;
    if (_879)
    {
        float _899 = rsqrt(_875);
        _887 = _899;
    }
    float _901 = _887;
    float _903 = _901;
    if (_879)
    {
        float _905 = _883 * _897;
        _889 = _905;
    }
    float _907 = _889;
    if (_879)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _891 = _909;
    }
    float _911 = _891;
    float _913 = _855;
    if (_879)
    {
        float _915 = _911 * 6.283185482025146484375;
        float _917 = sin(_915);
        _913 = _917;
    }
    float _919 = _913;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _839;
    float _927 = _923;
    float _929 = _921;
    if (_879)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_865;
    float _939 = -_923;
    float _941 = fma(_847, _937, _939);
    if (_879)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = sqrt(_861);
    float _949 = _919;
    float _951 = _945;
    if (_879)
    {
        float _953 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _953;
    }
    float _955 = _893;
    float _957 = _955;
    if (!_879)
    {
        _949 = _867;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_879)
    {
        _951 = _871;
    }
    float _963 = _951;
    float _965 = _963;
    float _967 = _935;
    if (_879)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = 0.0;
    float _975 = _971;
    if (_879)
    {
        float _977 = _901 * _955;
        _973 = _977;
    }
    float _979 = _973;
    if (!_879)
    {
        _957 = _941;
    }
    float _981 = _957;
    float _983 = _981;
    if (_879)
    {
        float _985 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _985;
    }
    float _987 = _903;
    if (_879)
    {
        float _989 = _867 * _979;
        _961 = _989;
    }
    float _991 = _961;
    if (!_879)
    {
        _975 = _869;
    }
    float _993 = _975;
    float _995 = _993;
    if (_879)
    {
        float _997 = _869 * _979;
        _995 = _997;
    }
    float _999 = _995;
    if (_879)
    {
        float _1001 = fma(_941, _935, _987);
        _983 = _1001;
    }
    float _1003 = _983;
    if (_879)
    {
        float _1005 = _991 * _991;
        _965 = _1005;
    }
    float _1007 = _965;
    if (!_879)
    {
        _967 = _873;
    }
    float _1009 = _967;
    float _1011 = _1009;
    if (_879)
    {
        float _1013 = _999 * _999;
        _1011 = _1013;
    }
    float _1015 = _1011;
    float _1017 = fma(_1003, _1003, _1007);
    float _1019 = _769 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1021 = _1017 + _1015;
    float _1023 = _769 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _769 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1033 = rsqrt(_1021);
    float _1035 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1023);
    float _1037 = -_1029;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1031);
    float _1043 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1019);
    float _1045 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1035);
    float _1047 = _769 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1049 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1051 = abs(_1039);
    float _1053 = log2(_1051);
    float _1055 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1047);
    float _1059 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1061 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1043);
    float _1063 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1065 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1057);
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1069 = _1033 * _991;
    float _1071 = _1033 * _999;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1075 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1079 = -_1067;
    float _1081 = fma(_1079, _1063, 1.0);
    float _1083 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1075);
    float _1087 = _1033 * _1003;
    float _1089 = log2(_1081);
    float _1091 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1093 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1085);
    float _1095 = -_1077;
    float _1097 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1095);
    float _1099 = _1087 + 1.0;
    float _1101 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1093);
    float _1103 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1105 = exp2(_1091);
    float _1107 = -_1071;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1097);
    float _1111 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1113 = fma(_1109, -0.5, 0.5);
    float _1115 = fma(_1109, 0.5, 0.5);
    float _1117 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1111);
    float _1119 = 1.0 / _1101;
    float _1121 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1103);
    float _1123 = fma(_1115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1125 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1127 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1121);
    float _1129 = fma(_1115, _1123, -0.212114393711090087890625);
    float _1131 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1125);
    float _1133 = sqrt(_1113);
    float _1135 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1127);
    float _1137 = _1089 * 0.693147182464599609375;
    float _1139 = -_1087;
    float _1141 = fma(_1105, _1099, _1139);
    float _1143 = fma(_1115, _1129, 1.570728778839111328125);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1147 = fma(_1141, 0.5, 0.5);
    float _1149 = _1131 * _1119;
    float _1151 = _1135 * _1119;
    float _1153 = fma(_1149, 0.5, 0.5);
    float _1155 = fma(_1151, -0.5, 0.5);
    float _1157 = _1133 * 0.636619746685028076171875;
    float3 _3187 = float3(_1153, _1155, _1145);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3187, float3(0.0), isnan(_3187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3187, float3(0.0), isnan(_3187)), level(0.0)).x;
    float _1161 = -_1143;
    float _1163 = fma(_1157, _1161, 1.0);
    float3 _3203 = float3(_1153, _1155, _1145);
    float4 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3203, float3(0.0), isnan(_3203)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3203, float3(0.0), isnan(_3203)), level(0.0)).xyzw;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    float _1174 = _1166.w;
    float2 _3220 = float2(_1163, _1147);
    float3 _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3220, float2(0.0), isnan(_3220)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3220, float2(0.0), isnan(_3220)), level(0.0)).xyz;
    float _1180 = _1178.x;
    float _1182 = _1178.y;
    float _1184 = _1178.z;
    float _1186 = in.m_49.y;
    float _1188 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1200 = 1.0 / _1192;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1204 = _139 > 0.5;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1208 = _383 + _1206;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1218 = _1216 != 0;
    float _1220 = 1.0 / _1196;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1224 = _383 + _1222;
    float _1226 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = _1186 > 0.5;
    float _1234 = _1208 * _1200;
    bool _1236 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1238 = isnan(_383);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1248;
    out.m_58.x = _1226;
    out.m_58.y = _1228;
    out.m_58.z = _1230;
    float _1252 = exp2(_1188);
    float _1254 = fma(_1250, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1256 = _1224 * _1220;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1262;
    float _1266 = -_1246;
    float _1268 = _1266 + 1.0;
    float _1270 = fma(_1260, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1272 = fma(_1264, _1234, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1274 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1276 = isnan(_383);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1290 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1292 = isnan(_383);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1306 = -_415;
    int _1308 = _1204 ? as_type<int>(_1306) : as_type<int>(_415);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1314 = -_409;
    int _1316 = _1232 ? as_type<int>(_1314) : as_type<int>(_409);
    float _1318 = _1300 * _1268;
    float _1320 = -_1300;
    float _1322 = _1320 + 1.0;
    bool _1324 = !_1212;
    float _1326 = _1324 ? _415 : as_type<float>(_1308);
    float _1328 = fma(_1288, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1330 = !_1218;
    float _1332 = _1330 ? _409 : as_type<float>(_1316);
    float _1334 = _1284 * _1322;
    float _1336 = -_1284;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1304, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1342 = fma(_1312, _1256, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1344 = _1270 * _1334;
    float _1346 = _1272 * _1334;
    float _1348 = _1254 * _1334;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1352 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1344);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1346);
    float _1356 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1348);
    float _1358 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1360 = fma(_1328, _1318, _1352);
    float _1362 = fma(_1340, _1318, _1354);
    float _1364 = fma(_1342, _1318, _1356);
    float _1366 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1358);
    float _1368 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1360);
    float _1370 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1362);
    float _1372 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1364);
    float _1374 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1376 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1366);
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1380 = _1326 + 0.5;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1384 = -_1252;
    float _1386 = _1384 + 1.0;
    float _1388 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1390 = -_1332;
    float _1392 = _1390 + 0.5;
    bool _1394 = _843 > 0.0;
    bool _1396 = isnan(_843);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    float _1404 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1406 = _1388 + _1101;
    float _1408 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1410 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1412 = -_1404;
    float _1414 = _1412 + 1.0;
    float _1416 = _1406 * 0.5;
    float _1418 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1420 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1422 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.gl_Position.x = _1131;
    out.gl_Position.y = _1135;
    out.gl_Position.z = _1388;
    out.gl_Position.w = _1101;
    float _1424 = _1410 * _1350;
    float _1426 = _1418 * _1378;
    float _1428 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1434 = _1408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1424;
    out.m_60.y = _1426;
    out.m_62.x = _1428;
    out.m_62.y = _1430;
    out.m_62.z = _1432;
    out.m_62.w = _1382;
    out.m_64.z = _1416;
    out.m_64.w = _1101;
    out.m_45.x = _1434;
    float _1436 = _1404 * _1159;
    float _1438 = _1174 * _1436;
    float _1440 = _1184 * _1436;
    float _1442 = fma(_1180, _1438, _1168);
    float _1444 = fma(_1182, _1438, _1170);
    float _1446 = _1174 * _1414;
    float _1448 = fma(_1174, _1440, _1172);
    out.m_66.x = _1442;
    out.m_66.y = _1444;
    out.m_66.z = _1448;
    out.m_66.w = _1446;
    if (_1402)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1450;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

