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
    float4 m_60 [[user(locn0)]];
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
    float4 m_53 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _835 = false;
    bool _279 = false;
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
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1620 = as_type<float>(_103);
        out.gl_Position.z = _1620;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
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
        float _123 = float(_87);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _97;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    int _135 = 0;
    if (_131)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1688 = as_type<float>(_139);
        out.gl_Position.z = _1688;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _163 * 0.15915493667125701904296875;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_175;
    int _197 = _195 ? 0 : 1;
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_187);
    float _205 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    bool _207 = !_161;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_197);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _217 = abs(_209);
    float _219 = float(_203);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _223 = fma(_193, 0.5, 0.5);
    float _225 = abs(_215);
    float _227 = _219 * _225;
    bool _229 = _201 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_217);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_211);
    float _245 = fma(_237, _235, _227);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _245);
    bool _255 = !_221;
    float _257 = _247;
    float _259 = _249;
    float _261 = _205;
    float _277;
    if (!_255)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_87);
        float _283 = 1.0 / _281;
        float _285 = _119 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _287 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _287 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = as_type<float>(int(gl_VertexIndex));
    float _319 = 1.0 / _303;
    float _321 = 1.0 / _311;
    float _323 = 1.0 / _307;
    float _325 = _291 * _319;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _287 + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_333, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = 1.0 / _315;
    float _339 = _295 * _321;
    bool _341 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _343 = isnan(_287);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    bool _353 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _355 = isnan(_287);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    int _365 = as_type<int>(_317) & 1;
    bool _367 = _365 != 0;
    int _369 = as_type<int>(_317) & 2;
    bool _371 = _369 != 0;
    float _373 = _299 * _323;
    bool _375 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_287);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = -_351;
    float _389 = _387 + 1.0;
    bool _391 = _141 > 0.5;
    float _393 = -_385;
    float _395 = _393 + 1.0;
    float _397 = _385 * _389;
    float _399 = _329 * _337;
    float _401 = _363 * _395;
    bool _403 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_287);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    bool _415 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _417 = isnan(_287);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = -_413;
    float _437 = _435 + 1.0;
    float _439 = fma(_429, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = -_363;
    float _443 = _441 + 1.0;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _413 * _443;
    float _451 = _425 * _437;
    float _453 = fma(_433, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = fma(_447, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -_425;
    float _459 = _457 + 1.0;
    float _461 = _439 * _451;
    float _463 = in.m_58.x;
    float _465 = in.m_58.y;
    float _467 = _335 * _451;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _475;
    float _479 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _481 = fma(_471, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_453, _449, _473);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = fma(_477, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_455, _449, _479);
    float _497 = fma(_481, _401, _483);
    float _499 = fma(_487, _399, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _501 = fma(_493, _399, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = fma(_489, _401, _495);
    float _505 = fma(_499, _397, _497);
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = fma(_501, _397, _503);
    float _515 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[147].x, _505);
    float _517 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[147].y, _513);
    float _519 = _515 * _463;
    bool _521 = !_367;
    float _523 = _521 ? (-0.5) : 0.5;
    float _525 = _517 * _465;
    bool _527 = !_371;
    float _529 = _527 ? (-0.5) : 0.5;
    float _531 = _253 * _519;
    float _533 = _253 * _525;
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _523);
    float _537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _529);
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _543 = _539 * _535;
    float _545 = _541 * _537;
    float _547 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _549 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = _545 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _555 = _545 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _557 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _559 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _561 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[24].x, _553);
    float _563 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _555);
    float _565 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
    float _567 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[24].z, _561);
    float _571 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[26].z, _563);
    float _573 = _565 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _577 = _569 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _579 = _571 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _581 = in.m_51.y;
    float _583 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _585 = _573 + _577;
    float _587 = _575 + _579;
    float _589 = _545 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _591 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
    float _593 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _595 = _585 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _599 = _587 + _597;
    float _601 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[25].x, _589);
    float _603 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
    float _605 = _595 * _595;
    float _607 = _599 * _599;
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[25].z, _601);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _613 = _605 + _607;
    float _615 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _617 = _609 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _619 = -_523;
    float _621 = _391 ? _619 : _523;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _625 = _623 != 0;
    float _627 = sqrt(_613);
    bool _629 = _581 > 0.5;
    float _631 = _615 + _617;
    bool _633 = !_625;
    float _635 = _633 ? _523 : _621;
    bool _637 = _627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _639 = _609;
    float _641 = _591;
    float _643 = _621;
    float _645 = _587;
    float _647 = _585;
    if (!_637)
    {
        _639 = _587;
    }
    float _649 = _639;
    float _651 = _649;
    if (!_637)
    {
        _641 = _607;
    }
    float _653 = _641;
    float _655 = _653;
    if (!_637)
    {
        _643 = _605;
    }
    float _657 = _643;
    float _659 = _657;
    if (!_637)
    {
        _645 = _631;
    }
    float _661 = _645;
    bool _663 = !_637;
    float _665 = _661;
    if (!_663)
    {
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _671 = _627 + _669;
        float _673 = _631 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = rsqrt(_613);
        float _677 = _671 * _667;
        float _679 = _677 * 0.15915493667125701904296875;
        float _681 = _679 * 6.283185482025146484375;
        float _683 = sin(_681);
        float _685 = _679 * 6.283185482025146484375;
        float _687 = cos(_685);
        float _689 = fma(_683, _673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _691 = _675 * _689;
        float _693 = _687 + (-1.0);
        float _695 = fma(_595, _691, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _697 = fma(_599, _691, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _699 = _693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _703 = _695 + _701;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _707 = _697 + _705;
        float _709 = fma(_631, _687, _699);
        float _711 = _703 * _703;
        float _713 = _707 * _707;
        _665 = _709;
        _659 = _711;
        _655 = _713;
        _647 = _695;
        _651 = _697;
    }
    float _715 = _665;
    float _717 = _659;
    float _719 = _655;
    float _721 = _647;
    float _723 = _651;
    float _725 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _727 = _715 + _725;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _731 = _729 != 0;
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _735 = -_529;
    int _737 = _629 ? as_type<int>(_735) : as_type<int>(_529);
    float _739 = fma(_727, _727, _717);
    float _741 = _635 + 0.5;
    bool _743 = !_731;
    float _745 = _743 ? _529 : as_type<float>(_737);
    float _747 = _739 + _719;
    float _749 = _741 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _753 = -_745;
    float _755 = _753 + 0.5;
    float _757 = _749 * _611;
    float _759 = sqrt(_747);
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _771 = _755 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _771 * _733;
    out.m_60.x = _775;
    out.m_60.y = _777;
    out.m_60.z = _779;
    out.m_60.w = _773;
    bool _789 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _791 = isnan(_759);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _797 = _793 || _795;
    out.m_62.x = _781;
    out.m_62.y = _783;
    out.m_62.z = _785;
    out.m_64.x = _757;
    out.m_64.y = _787;
    float _799 = _771;
    if (!_797)
    {
        _799 = 1.0;
    }
    float _801 = _799;
    bool _803 = !_797;
    float _805 = _801;
    if (!_803)
    {
        bool _807 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _809 = isnan(_759);
        bool _811 = _807 || _809;
        bool _813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _815 = _811 || _813;
        if (!_815)
        {
            float _817 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _819 = _759 + _817;
            float _821 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _823 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _821;
            float _825 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _827 = _825 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _829 = 1.0 / _823;
            float _831 = _819 * _829;
            float _833 = fma(_831, _827, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _805 = _833;
            _835 = true;
        }
        else
        {
            bool _837 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _839 = isnan(_759);
            bool _841 = _837 || _839;
            bool _843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _845 = _841 || _843;
            if (!_845)
            {
                float _847 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _849 = _759 + _847;
                float _851 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _853 = _851 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _855 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _857 = _855 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _859 = 1.0 / _853;
                float _861 = _849 * _859;
                float _863 = fma(_861, _857, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _805 = _863;
                _835 = true;
            }
            else
            {
                _805 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _835 = false;
    float _865 = _805;
    float _867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _869 = _715 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _873 = _721 + _871;
    float _875 = fma(_869, _865, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _877 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _879 = _723 + _877;
    float _881 = fma(_873, _865, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    float _893 = -_615;
    float _895 = _893 + _875;
    float _897 = fma(_879, _865, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _899 = -_573;
    float _901 = _899 + _881;
    float _903 = _615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _905 = _895 * _895;
    float _907 = -_575;
    float _909 = _907 + _897;
    float _911 = fma(_901, _901, _905);
    float _913 = fma(_909, _909, _911);
    float _915 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _903);
    float _917 = _615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _919 = sqrt(_913);
    float _921 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    float _923 = _921 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _925 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _917);
    float _927 = 1.0 / _923;
    float _929 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].z, _925);
    float _931 = _929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _933 = _919 > 0.0;
    float _935 = _931 + _923;
    bool _937 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _939 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    float _947 = _935 * _927;
    float _949 = _947 * 0.5;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _953 = _935;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _957 = _923;
    float _959 = _913;
    if (!_933)
    {
        _951 = _881;
    }
    float _961 = _951;
    float _963 = _961;
    if (!_933)
    {
        _953 = _875;
    }
    float _965 = _953;
    float _967 = _965;
    if (!_933)
    {
        _955 = _897;
    }
    float _969 = _955;
    bool _971 = !_933;
    float _973 = _969;
    if (!_971)
    {
        float _975 = _247 * _247;
        float _977 = fma(_205, _205, _975);
        float _979 = fma(_249, _249, _977);
        float _981 = rsqrt(_913);
        float _983 = sqrt(_979);
        float _985 = _901 * _981;
        float _987 = _895 * _981;
        float _989 = _909 * _981;
        bool _991 = _983 > 0.0;
        float _993 = _975;
        float _995 = _981;
        float _997 = _983;
        if (!_991)
        {
            _993 = _881;
        }
        float _999 = _993;
        _963 = _999;
        if (!_991)
        {
            _995 = _875;
        }
        float _1001 = _995;
        _967 = _1001;
        if (!_991)
        {
            _997 = _897;
        }
        float _1003 = _997;
        bool _1005 = !_991;
        _973 = _1003;
        if (!_1005)
        {
            float _1007 = rsqrt(_979);
            float _1009 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1011 = _247 * _1007;
            float _1013 = _205 * _1007;
            float _1015 = _987 * _1011;
            float _1017 = _249 * _1007;
            float _1019 = fma(_985, _1013, _1015);
            float _1021 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1023 = fma(_989, _1017, _1019);
            float _1025 = _1023 * _1021;
            float _1027 = fma(_205, _1025, _881);
            float _1029 = fma(_247, _1025, _875);
            float _1031 = fma(_249, _1025, _897);
            _963 = _1027;
            _973 = _1031;
            _967 = _1029;
            _957 = _1021;
        }
    }
    float _1033 = _963;
    float _1035 = _973;
    float _1037 = _967;
    float _1039 = _957;
    float _1041 = _1037;
    float _1043 = _1039;
    if (_891)
    {
        _257 = 1.0;
    }
    float _1045 = _257;
    float _1047 = _1045;
    if (_945)
    {
        _259 = _1033;
    }
    float _1049 = _259;
    float _1051 = _1049;
    if (_945)
    {
        _261 = _1035;
    }
    float _1053 = _261;
    float _1055 = _1053;
    if (!_945)
    {
        float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1059 = _615 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1063 = _573 + _1061;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = -_575;
        float _1069 = _1067 + _1035;
        float _1071 = _1059 * _1059;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1075 = _575 + _1073;
        float _1077 = fma(_1063, _1063, _1071);
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1081 = fma(_1075, _1075, _1077);
        float _1083 = sqrt(_1081);
        float _1085 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1087 = precise::min(_1083, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1089 = _1087 * _1079;
        float _1091 = -_573;
        float _1093 = _1091 + _1033;
        float _1095 = -_615;
        float _1097 = _1095 + _1037;
        float _1099 = _1085 * _1089;
        float _1101 = fma(_1093, _1099, _573);
        float _1103 = fma(_1097, _1099, _615);
        float _1105 = fma(_1069, _1099, _575);
        _1041 = _1103;
        _1051 = _1101;
        _1055 = _1105;
        _1043 = _1089;
    }
    float _1107 = _1041;
    float _1109 = _1051;
    float _1111 = _1055;
    float _1113 = _1043;
    float _1115 = _1113;
    if (!_891)
    {
        float _1117 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1119 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1119 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1135 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1133);
        float _1137 = 1.0 / _1123;
        float _1139 = _1127 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        float _1143 = _1131 * _1137;
        float _1145 = 1.0 / _1135;
        float _1147 = _1141 * _1143;
        float _1149 = _1127 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1155 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1153;
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1159 = _1145 * _1157;
        float _1161 = 1.0 / _1147;
        float _1163 = 1.0 / _1155;
        float _1165 = _1151 * _1161;
        float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1169 = fma(_1165, _1159, _1167);
        float _1171 = _1169 * _1163;
        float _1173 = precise::clamp(_1171, 0.0, 1.0);
        _1047 = _1173;
    }
    float _1175 = _1047;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1179 = _1107 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1183 = _1109 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1187 = _1111 + _1185;
    float _1189 = _1179 * _1179;
    float _1191 = fma(_1183, _1183, _1189);
    float _1193 = fma(_1187, _1187, _1191);
    float _1195 = rsqrt(_1193);
    float _1197 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1199 = _1183 * _1197;
    float _1201 = _1187 * _1197;
    float _1203 = _1199 * _1199;
    float _1205 = _1201 * _1201;
    float _1207 = _1203 + _1205;
    float _1209 = sqrt(_1207);
    bool _1211 = _1209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = _1209 + _1213;
    float _1217 = _1187;
    float _1219 = _1207;
    float _1221 = _1215;
    float _1223 = _1179;
    float _1225 = _1199;
    if (_1211)
    {
        float _1227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1217 = _1227;
    }
    float _1229 = _1217;
    if (_1211)
    {
        float _1231 = rsqrt(_1207);
        _1219 = _1231;
    }
    float _1233 = _1219;
    if (_1211)
    {
        float _1235 = _1215 * _1229;
        _1221 = _1235;
    }
    float _1237 = _1221;
    if (_1211)
    {
        float _1239 = _1237 * 0.15915493667125701904296875;
        _1115 = _1239;
    }
    float _1241 = _1115;
    float _1243 = _1191;
    if (_1211)
    {
        float _1245 = _1241 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = _1195;
    float _1257 = _1253;
    float _1259 = _1251;
    if (_1211)
    {
        float _1261 = _1241 * 6.283185482025146484375;
        float _1263 = cos(_1261);
        _1255 = _1263;
    }
    float _1265 = _1255;
    float _1267 = -_1197;
    float _1269 = -_1253;
    float _1271 = fma(_1179, _1267, _1269);
    if (_1211)
    {
        float _1273 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1257 = _1273;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    float _1279 = _1249;
    if (_1211)
    {
        float _1281 = fma(_1249, _1275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1277 = _1281;
    }
    float _1283 = _1277;
    float _1285 = _1283;
    if (!_1211)
    {
        _1279 = _1271;
    }
    float _1287 = _1279;
    float _1289 = _1287;
    if (_1211)
    {
        float _1291 = _1265 + (-1.0);
        _1259 = _1291;
    }
    float _1293 = _1259;
    float _1295 = _1293;
    if (_1211)
    {
        float _1297 = _1233 * _1283;
        _959 = _1297;
    }
    float _1299 = _959;
    if (!_1211)
    {
        _1285 = _1203;
    }
    float _1301 = _1285;
    float _1303 = sqrt(_1193);
    float _1305 = _1301;
    if (_1211)
    {
        float _1307 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1223 = _1307;
    }
    float _1309 = _1223;
    float _1311 = _1309;
    if (_1211)
    {
        float _1313 = _1199 * _1299;
        _1225 = _1313;
    }
    float _1315 = _1225;
    if (!_1211)
    {
        _1295 = _1201;
    }
    float _1317 = _1295;
    float _1319 = _1317;
    if (_1211)
    {
        float _1321 = _1201 * _1299;
        _1319 = _1321;
    }
    float _1323 = _1319;
    if (_1211)
    {
        float _1325 = fma(_1271, _1265, _1309);
        _1289 = _1325;
    }
    float _1327 = _1289;
    if (_1211)
    {
        float _1329 = _1315 * _1315;
        _1305 = _1329;
    }
    float _1331 = _1305;
    if (!_1211)
    {
        _1311 = _1205;
    }
    float _1333 = _1311;
    float _1335 = _1333;
    if (_1211)
    {
        float _1337 = _1323 * _1323;
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = fma(_1327, _1327, _1331);
    float _1343 = _1341 + _1339;
    float _1345 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1349 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1347);
    float _1351 = precise::clamp(_1349, 0.0, 1.0);
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1355 = rsqrt(_1343);
    float _1357 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1345);
    float _1359 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1361 = -_1351;
    float _1363 = _1361 + 1.0;
    float _1365 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1367 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1357);
    float _1369 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1359);
    float _1371 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1373 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1365);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1377 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1371);
    float _1381 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1373);
    float _1383 = abs(_1363);
    float _1385 = log2(_1383);
    float _1387 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1379);
    float _1391 = _1355 * _1315;
    float _1393 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = _1355 * _1327;
    float _1399 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1401 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    float _1405 = _1355 * _1323;
    float _1407 = -_1399;
    float _1409 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1407);
    float _1411 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1413 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1403);
    float _1415 = -_1401;
    float _1417 = fma(_1415, _1353, 1.0);
    float _1419 = -_1405;
    float _1421 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1409);
    float _1423 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1425 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1413);
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1429 = fma(_1421, -0.5, 0.5);
    float _1431 = log2(_1417);
    float _1433 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1435 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1427);
    float _1437 = fma(_1421, 0.5, 0.5);
    float _1439 = _1397 + 1.0;
    float _1441 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1433);
    float _1443 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1435);
    float _1445 = fma(_1437, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1447 = 1.0 / _1425;
    float _1449 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1441);
    float _1451 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1443);
    float _1453 = fma(_1437, _1445, -0.212114393711090087890625);
    float _1455 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1449);
    float _1457 = fma(_1437, _1453, 1.570728778839111328125);
    float _1459 = exp2(_1423);
    float _1461 = _1431 * 0.693147182464599609375;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1465 = sqrt(_1429);
    float _1467 = _1451 * _1447;
    float _1469 = _1455 * _1447;
    float _1471 = fma(_1467, 0.5, 0.5);
    float _1473 = fma(_1469, -0.5, 0.5);
    float _1475 = -_1397;
    float _1477 = fma(_1459, _1439, _1475);
    float3 _3876 = float3(_1471, _1473, _1463);
    float _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).x;
    float3 _3887 = float3(_1471, _1473, _1463);
    float4 _1482 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).xyzw;
    float _1484 = _1482.x;
    float _1486 = _1482.y;
    float _1488 = _1482.z;
    float _1490 = _1482.w;
    float _1492 = fma(_1477, 0.5, 0.5);
    float _1494 = _1465 * 0.636619746685028076171875;
    float _1496 = -_1457;
    float _1498 = fma(_1494, _1496, 1.0);
    float2 _3914 = float2(_1498, _1492);
    float3 _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3914, float2(0.0), isnan(_3914)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3914, float2(0.0), isnan(_3914)), level(0.0)).xyz;
    float _1504 = _1502.x;
    float _1506 = _1502.y;
    float _1508 = _1502.z;
    float _1510 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1512 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1514 = _1175 > 0.0;
    bool _1516 = isnan(_1175);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan(0.0);
    bool _1522 = _1518 || _1520;
    float _1524 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1526 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1528 = exp2(_1510);
    float _1530 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1532 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1530);
    float _1534 = _1532 + _1425;
    out.gl_Position.x = _1451;
    out.gl_Position.y = _1455;
    out.gl_Position.z = _1532;
    out.gl_Position.w = _1425;
    float _1536 = _1534 * 0.5;
    float _1538 = -_1528;
    float _1540 = _1538 + 1.0;
    float _1542 = _1524 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _1536;
    out.m_66.w = _1425;
    out.m_47.x = _1542;
    float _1546 = _1544 * _1479;
    float _1548 = -_1544;
    float _1550 = _1548 + 1.0;
    float _1552 = _1490 * _1546;
    float _1554 = _1508 * _1546;
    float _1556 = fma(_1504, _1552, _1484);
    float _1558 = fma(_1506, _1552, _1486);
    float _1560 = _1490 * _1550;
    float _1562 = fma(_1490, _1554, _1488);
    out.m_68.x = _1556;
    out.m_68.y = _1558;
    out.m_68.z = _1562;
    out.m_68.w = _1560;
    if (_1522)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1564 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1564;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _835 = false;
    bool _279 = false;
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
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1620 = as_type<float>(_103);
        out.gl_Position.z = _1620;
    }
    if (!_91)
    {
        return out;
    }
    float _105 = in.m_49.w;
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
        float _123 = float(_87);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _97;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    int _135 = 0;
    if (_131)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1688 = as_type<float>(_139);
        out.gl_Position.z = _1688;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _163 * 0.15915493667125701904296875;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_175;
    int _197 = _195 ? 0 : 1;
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_187);
    float _205 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    bool _207 = !_161;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_197);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _217 = abs(_209);
    float _219 = float(_203);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _223 = fma(_193, 0.5, 0.5);
    float _225 = abs(_215);
    float _227 = _219 * _225;
    bool _229 = _201 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_217);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_211);
    float _245 = fma(_237, _235, _227);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _245);
    bool _255 = !_221;
    float _257 = _247;
    float _259 = _249;
    float _261 = _205;
    float _277;
    if (!_255)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_87);
        float _283 = 1.0 / _281;
        float _285 = _119 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _287 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _287 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = as_type<float>(int(gl_VertexIndex));
    float _319 = 1.0 / _303;
    float _321 = 1.0 / _311;
    float _323 = 1.0 / _307;
    float _325 = _291 * _319;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _287 + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_333, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = 1.0 / _315;
    float _339 = _295 * _321;
    bool _341 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _343 = isnan(_287);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    bool _353 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _355 = isnan(_287);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    int _365 = as_type<int>(_317) & 1;
    bool _367 = _365 != 0;
    int _369 = as_type<int>(_317) & 2;
    bool _371 = _369 != 0;
    float _373 = _299 * _323;
    bool _375 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_287);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = -_351;
    float _389 = _387 + 1.0;
    bool _391 = _141 > 0.5;
    float _393 = -_385;
    float _395 = _393 + 1.0;
    float _397 = _385 * _389;
    float _399 = _329 * _337;
    float _401 = _363 * _395;
    bool _403 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_287);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    bool _415 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _417 = isnan(_287);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = -_413;
    float _437 = _435 + 1.0;
    float _439 = fma(_429, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = -_363;
    float _443 = _441 + 1.0;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _413 * _443;
    float _451 = _425 * _437;
    float _453 = fma(_433, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = fma(_447, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -_425;
    float _459 = _457 + 1.0;
    float _461 = _439 * _451;
    float _463 = in.m_58.x;
    float _465 = in.m_58.y;
    float _467 = _335 * _451;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _475;
    float _479 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _481 = fma(_471, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_453, _449, _473);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = fma(_477, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_455, _449, _479);
    float _497 = fma(_481, _401, _483);
    float _499 = fma(_487, _399, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _501 = fma(_493, _399, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = fma(_489, _401, _495);
    float _505 = fma(_499, _397, _497);
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = fma(_501, _397, _503);
    float _515 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[147].x, _505);
    float _517 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[147].y, _513);
    float _519 = _515 * _463;
    bool _521 = !_367;
    float _523 = _521 ? (-0.5) : 0.5;
    float _525 = _517 * _465;
    bool _527 = !_371;
    float _529 = _527 ? (-0.5) : 0.5;
    float _531 = _253 * _519;
    float _533 = _253 * _525;
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _523);
    float _537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _529);
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _543 = _539 * _535;
    float _545 = _541 * _537;
    float _547 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _549 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = _545 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _555 = _545 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _557 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _559 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _561 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[24].x, _553);
    float _563 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _555);
    float _565 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
    float _567 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[24].z, _561);
    float _571 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[26].z, _563);
    float _573 = _565 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _577 = _569 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _579 = _571 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _581 = in.m_51.y;
    float _583 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _585 = _573 + _577;
    float _587 = _575 + _579;
    float _589 = _545 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _591 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
    float _593 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _595 = _585 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _599 = _587 + _597;
    float _601 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[25].x, _589);
    float _603 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
    float _605 = _595 * _595;
    float _607 = _599 * _599;
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[25].z, _601);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _613 = _605 + _607;
    float _615 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _617 = _609 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _619 = -_523;
    float _621 = _391 ? _619 : _523;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _625 = _623 != 0;
    float _627 = sqrt(_613);
    bool _629 = _581 > 0.5;
    float _631 = _615 + _617;
    bool _633 = !_625;
    float _635 = _633 ? _523 : _621;
    bool _637 = _627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _639 = _609;
    float _641 = _591;
    float _643 = _621;
    float _645 = _587;
    float _647 = _585;
    if (!_637)
    {
        _639 = _587;
    }
    float _649 = _639;
    float _651 = _649;
    if (!_637)
    {
        _641 = _607;
    }
    float _653 = _641;
    float _655 = _653;
    if (!_637)
    {
        _643 = _605;
    }
    float _657 = _643;
    float _659 = _657;
    if (!_637)
    {
        _645 = _631;
    }
    float _661 = _645;
    bool _663 = !_637;
    float _665 = _661;
    if (!_663)
    {
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _671 = _627 + _669;
        float _673 = _631 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = rsqrt(_613);
        float _677 = _671 * _667;
        float _679 = _677 * 0.15915493667125701904296875;
        float _681 = _679 * 6.283185482025146484375;
        float _683 = sin(_681);
        float _685 = _679 * 6.283185482025146484375;
        float _687 = cos(_685);
        float _689 = fma(_683, _673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _691 = _675 * _689;
        float _693 = _687 + (-1.0);
        float _695 = fma(_595, _691, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _697 = fma(_599, _691, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _699 = _693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _703 = _695 + _701;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _707 = _697 + _705;
        float _709 = fma(_631, _687, _699);
        float _711 = _703 * _703;
        float _713 = _707 * _707;
        _665 = _709;
        _659 = _711;
        _655 = _713;
        _647 = _695;
        _651 = _697;
    }
    float _715 = _665;
    float _717 = _659;
    float _719 = _655;
    float _721 = _647;
    float _723 = _651;
    float _725 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _727 = _715 + _725;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _731 = _729 != 0;
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _735 = -_529;
    int _737 = _629 ? as_type<int>(_735) : as_type<int>(_529);
    float _739 = fma(_727, _727, _717);
    float _741 = _635 + 0.5;
    bool _743 = !_731;
    float _745 = _743 ? _529 : as_type<float>(_737);
    float _747 = _739 + _719;
    float _749 = _741 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _753 = -_745;
    float _755 = _753 + 0.5;
    float _757 = _749 * _611;
    float _759 = sqrt(_747);
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _771 = _755 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _771 * _733;
    out.m_60.x = _775;
    out.m_60.y = _777;
    out.m_60.z = _779;
    out.m_60.w = _773;
    bool _789 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _791 = isnan(_759);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _797 = _793 || _795;
    out.m_62.x = _781;
    out.m_62.y = _783;
    out.m_62.z = _785;
    out.m_64.x = _757;
    out.m_64.y = _787;
    float _799 = _771;
    if (!_797)
    {
        _799 = 1.0;
    }
    float _801 = _799;
    bool _803 = !_797;
    float _805 = _801;
    if (!_803)
    {
        bool _807 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _809 = isnan(_759);
        bool _811 = _807 || _809;
        bool _813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _815 = _811 || _813;
        if (!_815)
        {
            float _817 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _819 = _759 + _817;
            float _821 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _823 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _821;
            float _825 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _827 = _825 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _829 = 1.0 / _823;
            float _831 = _819 * _829;
            float _833 = fma(_831, _827, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _805 = _833;
            _835 = true;
        }
        else
        {
            bool _837 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _839 = isnan(_759);
            bool _841 = _837 || _839;
            bool _843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _845 = _841 || _843;
            if (!_845)
            {
                float _847 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _849 = _759 + _847;
                float _851 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _853 = _851 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _855 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _857 = _855 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _859 = 1.0 / _853;
                float _861 = _849 * _859;
                float _863 = fma(_861, _857, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _805 = _863;
                _835 = true;
            }
            else
            {
                _805 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _835 = false;
    float _865 = _805;
    float _867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _869 = _715 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _873 = _721 + _871;
    float _875 = fma(_869, _865, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _877 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _879 = _723 + _877;
    float _881 = fma(_873, _865, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    float _893 = -_615;
    float _895 = _893 + _875;
    float _897 = fma(_879, _865, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _899 = -_573;
    float _901 = _899 + _881;
    float _903 = _615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _905 = _895 * _895;
    float _907 = -_575;
    float _909 = _907 + _897;
    float _911 = fma(_901, _901, _905);
    float _913 = fma(_909, _909, _911);
    float _915 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _903);
    float _917 = _615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _919 = sqrt(_913);
    float _921 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    float _923 = _921 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _925 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _917);
    float _927 = 1.0 / _923;
    float _929 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].z, _925);
    float _931 = _929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _933 = _919 > 0.0;
    float _935 = _931 + _923;
    bool _937 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _939 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    float _947 = _935 * _927;
    float _949 = _947 * 0.5;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _953 = _935;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _957 = _923;
    float _959 = _913;
    if (!_933)
    {
        _951 = _881;
    }
    float _961 = _951;
    float _963 = _961;
    if (!_933)
    {
        _953 = _875;
    }
    float _965 = _953;
    float _967 = _965;
    if (!_933)
    {
        _955 = _897;
    }
    float _969 = _955;
    bool _971 = !_933;
    float _973 = _969;
    if (!_971)
    {
        float _975 = _247 * _247;
        float _977 = fma(_205, _205, _975);
        float _979 = fma(_249, _249, _977);
        float _981 = rsqrt(_913);
        float _983 = sqrt(_979);
        float _985 = _901 * _981;
        float _987 = _895 * _981;
        float _989 = _909 * _981;
        bool _991 = _983 > 0.0;
        float _993 = _975;
        float _995 = _981;
        float _997 = _983;
        if (!_991)
        {
            _993 = _881;
        }
        float _999 = _993;
        _963 = _999;
        if (!_991)
        {
            _995 = _875;
        }
        float _1001 = _995;
        _967 = _1001;
        if (!_991)
        {
            _997 = _897;
        }
        float _1003 = _997;
        bool _1005 = !_991;
        _973 = _1003;
        if (!_1005)
        {
            float _1007 = rsqrt(_979);
            float _1009 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1011 = _247 * _1007;
            float _1013 = _205 * _1007;
            float _1015 = _987 * _1011;
            float _1017 = _249 * _1007;
            float _1019 = fma(_985, _1013, _1015);
            float _1021 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1023 = fma(_989, _1017, _1019);
            float _1025 = _1023 * _1021;
            float _1027 = fma(_205, _1025, _881);
            float _1029 = fma(_247, _1025, _875);
            float _1031 = fma(_249, _1025, _897);
            _963 = _1027;
            _973 = _1031;
            _967 = _1029;
            _957 = _1021;
        }
    }
    float _1033 = _963;
    float _1035 = _973;
    float _1037 = _967;
    float _1039 = _957;
    float _1041 = _1037;
    float _1043 = _1039;
    if (_891)
    {
        _257 = 1.0;
    }
    float _1045 = _257;
    float _1047 = _1045;
    if (_945)
    {
        _259 = _1033;
    }
    float _1049 = _259;
    float _1051 = _1049;
    if (_945)
    {
        _261 = _1035;
    }
    float _1053 = _261;
    float _1055 = _1053;
    if (!_945)
    {
        float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1059 = _615 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1063 = _573 + _1061;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = -_575;
        float _1069 = _1067 + _1035;
        float _1071 = _1059 * _1059;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1075 = _575 + _1073;
        float _1077 = fma(_1063, _1063, _1071);
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1081 = fma(_1075, _1075, _1077);
        float _1083 = sqrt(_1081);
        float _1085 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1087 = precise::min(_1083, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1089 = _1087 * _1079;
        float _1091 = -_573;
        float _1093 = _1091 + _1033;
        float _1095 = -_615;
        float _1097 = _1095 + _1037;
        float _1099 = _1085 * _1089;
        float _1101 = fma(_1093, _1099, _573);
        float _1103 = fma(_1097, _1099, _615);
        float _1105 = fma(_1069, _1099, _575);
        _1041 = _1103;
        _1051 = _1101;
        _1055 = _1105;
        _1043 = _1089;
    }
    float _1107 = _1041;
    float _1109 = _1051;
    float _1111 = _1055;
    float _1113 = _1043;
    float _1115 = _1113;
    if (!_891)
    {
        float _1117 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1119 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1119 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1135 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1133);
        float _1137 = 1.0 / _1123;
        float _1139 = _1127 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        float _1143 = _1131 * _1137;
        float _1145 = 1.0 / _1135;
        float _1147 = _1141 * _1143;
        float _1149 = _1127 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1155 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1153;
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1159 = _1145 * _1157;
        float _1161 = 1.0 / _1147;
        float _1163 = 1.0 / _1155;
        float _1165 = _1151 * _1161;
        float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1169 = fma(_1165, _1159, _1167);
        float _1171 = _1169 * _1163;
        float _1173 = precise::clamp(_1171, 0.0, 1.0);
        _1047 = _1173;
    }
    float _1175 = _1047;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1179 = _1107 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1183 = _1109 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1187 = _1111 + _1185;
    float _1189 = _1179 * _1179;
    float _1191 = fma(_1183, _1183, _1189);
    float _1193 = fma(_1187, _1187, _1191);
    float _1195 = rsqrt(_1193);
    float _1197 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1199 = _1183 * _1197;
    float _1201 = _1187 * _1197;
    float _1203 = _1199 * _1199;
    float _1205 = _1201 * _1201;
    float _1207 = _1203 + _1205;
    float _1209 = sqrt(_1207);
    bool _1211 = _1209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = _1209 + _1213;
    float _1217 = _1187;
    float _1219 = _1207;
    float _1221 = _1215;
    float _1223 = _1179;
    float _1225 = _1199;
    if (_1211)
    {
        float _1227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1217 = _1227;
    }
    float _1229 = _1217;
    if (_1211)
    {
        float _1231 = rsqrt(_1207);
        _1219 = _1231;
    }
    float _1233 = _1219;
    if (_1211)
    {
        float _1235 = _1215 * _1229;
        _1221 = _1235;
    }
    float _1237 = _1221;
    if (_1211)
    {
        float _1239 = _1237 * 0.15915493667125701904296875;
        _1115 = _1239;
    }
    float _1241 = _1115;
    float _1243 = _1191;
    if (_1211)
    {
        float _1245 = _1241 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = _1195;
    float _1257 = _1253;
    float _1259 = _1251;
    if (_1211)
    {
        float _1261 = _1241 * 6.283185482025146484375;
        float _1263 = cos(_1261);
        _1255 = _1263;
    }
    float _1265 = _1255;
    float _1267 = -_1197;
    float _1269 = -_1253;
    float _1271 = fma(_1179, _1267, _1269);
    if (_1211)
    {
        float _1273 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1257 = _1273;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    float _1279 = _1249;
    if (_1211)
    {
        float _1281 = fma(_1249, _1275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1277 = _1281;
    }
    float _1283 = _1277;
    float _1285 = _1283;
    if (!_1211)
    {
        _1279 = _1271;
    }
    float _1287 = _1279;
    float _1289 = _1287;
    if (_1211)
    {
        float _1291 = _1265 + (-1.0);
        _1259 = _1291;
    }
    float _1293 = _1259;
    float _1295 = _1293;
    if (_1211)
    {
        float _1297 = _1233 * _1283;
        _959 = _1297;
    }
    float _1299 = _959;
    if (!_1211)
    {
        _1285 = _1203;
    }
    float _1301 = _1285;
    float _1303 = sqrt(_1193);
    float _1305 = _1301;
    if (_1211)
    {
        float _1307 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1223 = _1307;
    }
    float _1309 = _1223;
    float _1311 = _1309;
    if (_1211)
    {
        float _1313 = _1199 * _1299;
        _1225 = _1313;
    }
    float _1315 = _1225;
    if (!_1211)
    {
        _1295 = _1201;
    }
    float _1317 = _1295;
    float _1319 = _1317;
    if (_1211)
    {
        float _1321 = _1201 * _1299;
        _1319 = _1321;
    }
    float _1323 = _1319;
    if (_1211)
    {
        float _1325 = fma(_1271, _1265, _1309);
        _1289 = _1325;
    }
    float _1327 = _1289;
    if (_1211)
    {
        float _1329 = _1315 * _1315;
        _1305 = _1329;
    }
    float _1331 = _1305;
    if (!_1211)
    {
        _1311 = _1205;
    }
    float _1333 = _1311;
    float _1335 = _1333;
    if (_1211)
    {
        float _1337 = _1323 * _1323;
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = fma(_1327, _1327, _1331);
    float _1343 = _1341 + _1339;
    float _1345 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1349 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1347);
    float _1351 = precise::clamp(_1349, 0.0, 1.0);
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1355 = rsqrt(_1343);
    float _1357 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1345);
    float _1359 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1361 = -_1351;
    float _1363 = _1361 + 1.0;
    float _1365 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1367 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1357);
    float _1369 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1359);
    float _1371 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1373 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1365);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1377 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1371);
    float _1381 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1373);
    float _1383 = abs(_1363);
    float _1385 = log2(_1383);
    float _1387 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1379);
    float _1391 = _1355 * _1315;
    float _1393 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = _1355 * _1327;
    float _1399 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1401 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    float _1405 = _1355 * _1323;
    float _1407 = -_1399;
    float _1409 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1407);
    float _1411 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1413 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1403);
    float _1415 = -_1401;
    float _1417 = fma(_1415, _1353, 1.0);
    float _1419 = -_1405;
    float _1421 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1409);
    float _1423 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1425 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1413);
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1429 = fma(_1421, -0.5, 0.5);
    float _1431 = log2(_1417);
    float _1433 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1435 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1427);
    float _1437 = fma(_1421, 0.5, 0.5);
    float _1439 = _1397 + 1.0;
    float _1441 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1433);
    float _1443 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1435);
    float _1445 = fma(_1437, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1447 = 1.0 / _1425;
    float _1449 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1441);
    float _1451 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1443);
    float _1453 = fma(_1437, _1445, -0.212114393711090087890625);
    float _1455 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1449);
    float _1457 = fma(_1437, _1453, 1.570728778839111328125);
    float _1459 = exp2(_1423);
    float _1461 = _1431 * 0.693147182464599609375;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1465 = sqrt(_1429);
    float _1467 = _1451 * _1447;
    float _1469 = _1455 * _1447;
    float _1471 = fma(_1467, 0.5, 0.5);
    float _1473 = fma(_1469, -0.5, 0.5);
    float _1475 = -_1397;
    float _1477 = fma(_1459, _1439, _1475);
    float3 _3876 = float3(_1471, _1473, _1463);
    float _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).x;
    float3 _3887 = float3(_1471, _1473, _1463);
    float4 _1482 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).xyzw;
    float _1484 = _1482.x;
    float _1486 = _1482.y;
    float _1488 = _1482.z;
    float _1490 = _1482.w;
    float _1492 = fma(_1477, 0.5, 0.5);
    float _1494 = _1465 * 0.636619746685028076171875;
    float _1496 = -_1457;
    float _1498 = fma(_1494, _1496, 1.0);
    float2 _3914 = float2(_1498, _1492);
    float3 _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3914, float2(0.0), isnan(_3914)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3914, float2(0.0), isnan(_3914)), level(0.0)).xyz;
    float _1504 = _1502.x;
    float _1506 = _1502.y;
    float _1508 = _1502.z;
    float _1510 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1512 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1514 = _1175 > 0.0;
    bool _1516 = isnan(_1175);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan(0.0);
    bool _1522 = _1518 || _1520;
    float _1524 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1526 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1528 = exp2(_1510);
    float _1530 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1532 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1530);
    float _1534 = _1532 + _1425;
    out.gl_Position.x = _1451;
    out.gl_Position.y = _1455;
    out.gl_Position.z = _1532;
    out.gl_Position.w = _1425;
    float _1536 = _1534 * 0.5;
    float _1538 = -_1528;
    float _1540 = _1538 + 1.0;
    float _1542 = _1524 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _1536;
    out.m_66.w = _1425;
    out.m_47.x = _1542;
    float _1546 = _1544 * _1479;
    float _1548 = -_1544;
    float _1550 = _1548 + 1.0;
    float _1552 = _1490 * _1546;
    float _1554 = _1508 * _1546;
    float _1556 = fma(_1504, _1552, _1484);
    float _1558 = fma(_1506, _1552, _1486);
    float _1560 = _1490 * _1550;
    float _1562 = fma(_1490, _1554, _1488);
    out.m_68.x = _1556;
    out.m_68.y = _1558;
    out.m_68.z = _1562;
    out.m_68.w = _1560;
    if (_1522)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1564 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1564;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _835 = false;
    bool _279 = false;
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
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1620 = as_type<float>(_103);
        out.gl_Position.z = _1620;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
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
        float _123 = float(_87);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _97;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    int _135 = 0;
    if (_131)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1688 = as_type<float>(_139);
        out.gl_Position.z = _1688;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _163 * 0.15915493667125701904296875;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_175;
    int _197 = _195 ? 0 : 1;
    float _199 = -_157;
    float _201 = _155 + _199;
    int _203 = abs(_187);
    float _205 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    bool _207 = !_161;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_197);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _217 = abs(_209);
    float _219 = float(_203);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _223 = fma(_193, 0.5, 0.5);
    float _225 = abs(_215);
    float _227 = _219 * _225;
    bool _229 = _201 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_217);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_211);
    float _245 = fma(_237, _235, _227);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _245);
    bool _255 = !_221;
    float _257 = _247;
    float _259 = _249;
    float _261 = _205;
    float _277;
    if (!_255)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_87);
        float _283 = 1.0 / _281;
        float _285 = _119 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _287 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _287 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = as_type<float>(int(gl_VertexIndex));
    float _319 = 1.0 / _303;
    float _321 = 1.0 / _311;
    float _323 = 1.0 / _307;
    float _325 = _291 * _319;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _287 + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_333, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = 1.0 / _315;
    float _339 = _295 * _321;
    bool _341 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _343 = isnan(_287);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    bool _353 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _355 = isnan(_287);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    int _365 = as_type<int>(_317) & 1;
    bool _367 = _365 != 0;
    int _369 = as_type<int>(_317) & 2;
    bool _371 = _369 != 0;
    float _373 = _299 * _323;
    bool _375 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_287);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = -_351;
    float _389 = _387 + 1.0;
    bool _391 = _141 > 0.5;
    float _393 = -_385;
    float _395 = _393 + 1.0;
    float _397 = _385 * _389;
    float _399 = _329 * _337;
    float _401 = _363 * _395;
    bool _403 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_287);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    bool _415 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _417 = isnan(_287);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = -_413;
    float _437 = _435 + 1.0;
    float _439 = fma(_429, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = -_363;
    float _443 = _441 + 1.0;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _413 * _443;
    float _451 = _425 * _437;
    float _453 = fma(_433, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = fma(_447, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -_425;
    float _459 = _457 + 1.0;
    float _461 = _439 * _451;
    float _463 = in.m_58.x;
    float _465 = in.m_58.y;
    float _467 = _335 * _451;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _475;
    float _479 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _481 = fma(_471, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_453, _449, _473);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = fma(_477, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_455, _449, _479);
    float _497 = fma(_481, _401, _483);
    float _499 = fma(_487, _399, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _501 = fma(_493, _399, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = fma(_489, _401, _495);
    float _505 = fma(_499, _397, _497);
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = fma(_501, _397, _503);
    float _515 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[147].x, _505);
    float _517 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[147].y, _513);
    float _519 = _515 * _463;
    bool _521 = !_367;
    float _523 = _521 ? (-0.5) : 0.5;
    float _525 = _517 * _465;
    bool _527 = !_371;
    float _529 = _527 ? (-0.5) : 0.5;
    float _531 = _253 * _519;
    float _533 = _253 * _525;
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _523);
    float _537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _529);
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _543 = _539 * _535;
    float _545 = _541 * _537;
    float _547 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _549 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = _545 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _555 = _545 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _557 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _559 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _561 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[24].x, _553);
    float _563 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _555);
    float _565 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
    float _567 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
    float _569 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[24].z, _561);
    float _571 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[26].z, _563);
    float _573 = _565 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _577 = _569 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _579 = _571 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _581 = in.m_51.y;
    float _583 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _585 = _573 + _577;
    float _587 = _575 + _579;
    float _589 = _545 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _591 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
    float _593 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _595 = _585 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _599 = _587 + _597;
    float _601 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[25].x, _589);
    float _603 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
    float _605 = _595 * _595;
    float _607 = _599 * _599;
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[25].z, _601);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _613 = _605 + _607;
    float _615 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _617 = _609 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _619 = -_523;
    float _621 = _391 ? _619 : _523;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _625 = _623 != 0;
    float _627 = sqrt(_613);
    bool _629 = _581 > 0.5;
    float _631 = _615 + _617;
    bool _633 = !_625;
    float _635 = _633 ? _523 : _621;
    bool _637 = _627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _639 = _609;
    float _641 = _591;
    float _643 = _621;
    float _645 = _587;
    float _647 = _585;
    if (!_637)
    {
        _639 = _587;
    }
    float _649 = _639;
    float _651 = _649;
    if (!_637)
    {
        _641 = _607;
    }
    float _653 = _641;
    float _655 = _653;
    if (!_637)
    {
        _643 = _605;
    }
    float _657 = _643;
    float _659 = _657;
    if (!_637)
    {
        _645 = _631;
    }
    float _661 = _645;
    bool _663 = !_637;
    float _665 = _661;
    if (!_663)
    {
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _671 = _627 + _669;
        float _673 = _631 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = rsqrt(_613);
        float _677 = _671 * _667;
        float _679 = _677 * 0.15915493667125701904296875;
        float _681 = _679 * 6.283185482025146484375;
        float _683 = sin(_681);
        float _685 = _679 * 6.283185482025146484375;
        float _687 = cos(_685);
        float _689 = fma(_683, _673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _691 = _675 * _689;
        float _693 = _687 + (-1.0);
        float _695 = fma(_595, _691, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _697 = fma(_599, _691, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _699 = _693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _703 = _695 + _701;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _707 = _697 + _705;
        float _709 = fma(_631, _687, _699);
        float _711 = _703 * _703;
        float _713 = _707 * _707;
        _665 = _709;
        _659 = _711;
        _655 = _713;
        _647 = _695;
        _651 = _697;
    }
    float _715 = _665;
    float _717 = _659;
    float _719 = _655;
    float _721 = _647;
    float _723 = _651;
    float _725 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _727 = _715 + _725;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _731 = _729 != 0;
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _735 = -_529;
    int _737 = _629 ? as_type<int>(_735) : as_type<int>(_529);
    float _739 = fma(_727, _727, _717);
    float _741 = _635 + 0.5;
    bool _743 = !_731;
    float _745 = _743 ? _529 : as_type<float>(_737);
    float _747 = _739 + _719;
    float _749 = _741 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _753 = -_745;
    float _755 = _753 + 0.5;
    float _757 = _749 * _611;
    float _759 = sqrt(_747);
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _771 = _755 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _771 * _733;
    out.m_60.x = _775;
    out.m_60.y = _777;
    out.m_60.z = _779;
    out.m_60.w = _773;
    bool _789 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _791 = isnan(_759);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _797 = _793 || _795;
    out.m_62.x = _781;
    out.m_62.y = _783;
    out.m_62.z = _785;
    out.m_64.x = _757;
    out.m_64.y = _787;
    float _799 = _771;
    if (!_797)
    {
        _799 = 1.0;
    }
    float _801 = _799;
    bool _803 = !_797;
    float _805 = _801;
    if (!_803)
    {
        bool _807 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _809 = isnan(_759);
        bool _811 = _807 || _809;
        bool _813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _815 = _811 || _813;
        if (!_815)
        {
            float _817 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _819 = _759 + _817;
            float _821 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _823 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _821;
            float _825 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _827 = _825 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _829 = 1.0 / _823;
            float _831 = _819 * _829;
            float _833 = fma(_831, _827, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _805 = _833;
            _835 = true;
        }
        else
        {
            bool _837 = _759 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _839 = isnan(_759);
            bool _841 = _837 || _839;
            bool _843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _845 = _841 || _843;
            if (!_845)
            {
                float _847 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _849 = _759 + _847;
                float _851 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _853 = _851 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _855 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _857 = _855 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _859 = 1.0 / _853;
                float _861 = _849 * _859;
                float _863 = fma(_861, _857, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _805 = _863;
                _835 = true;
            }
            else
            {
                _805 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _835 = false;
    float _865 = _805;
    float _867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _869 = _715 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _873 = _721 + _871;
    float _875 = fma(_869, _865, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _877 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _879 = _723 + _877;
    float _881 = fma(_873, _865, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    float _893 = -_615;
    float _895 = _893 + _875;
    float _897 = fma(_879, _865, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _899 = -_573;
    float _901 = _899 + _881;
    float _903 = _615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _905 = _895 * _895;
    float _907 = -_575;
    float _909 = _907 + _897;
    float _911 = fma(_901, _901, _905);
    float _913 = fma(_909, _909, _911);
    float _915 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _903);
    float _917 = _615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _919 = sqrt(_913);
    float _921 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    float _923 = _921 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _925 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _917);
    float _927 = 1.0 / _923;
    float _929 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[10].z, _925);
    float _931 = _929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _933 = _919 > 0.0;
    float _935 = _931 + _923;
    bool _937 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _939 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    float _947 = _935 * _927;
    float _949 = _947 * 0.5;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _953 = _935;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _957 = _923;
    float _959 = _913;
    if (!_933)
    {
        _951 = _881;
    }
    float _961 = _951;
    float _963 = _961;
    if (!_933)
    {
        _953 = _875;
    }
    float _965 = _953;
    float _967 = _965;
    if (!_933)
    {
        _955 = _897;
    }
    float _969 = _955;
    bool _971 = !_933;
    float _973 = _969;
    if (!_971)
    {
        float _975 = _247 * _247;
        float _977 = fma(_205, _205, _975);
        float _979 = fma(_249, _249, _977);
        float _981 = rsqrt(_913);
        float _983 = sqrt(_979);
        float _985 = _901 * _981;
        float _987 = _895 * _981;
        float _989 = _909 * _981;
        bool _991 = _983 > 0.0;
        float _993 = _975;
        float _995 = _981;
        float _997 = _983;
        if (!_991)
        {
            _993 = _881;
        }
        float _999 = _993;
        _963 = _999;
        if (!_991)
        {
            _995 = _875;
        }
        float _1001 = _995;
        _967 = _1001;
        if (!_991)
        {
            _997 = _897;
        }
        float _1003 = _997;
        bool _1005 = !_991;
        _973 = _1003;
        if (!_1005)
        {
            float _1007 = rsqrt(_979);
            float _1009 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1011 = _247 * _1007;
            float _1013 = _205 * _1007;
            float _1015 = _987 * _1011;
            float _1017 = _249 * _1007;
            float _1019 = fma(_985, _1013, _1015);
            float _1021 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1023 = fma(_989, _1017, _1019);
            float _1025 = _1023 * _1021;
            float _1027 = fma(_205, _1025, _881);
            float _1029 = fma(_247, _1025, _875);
            float _1031 = fma(_249, _1025, _897);
            _963 = _1027;
            _973 = _1031;
            _967 = _1029;
            _957 = _1021;
        }
    }
    float _1033 = _963;
    float _1035 = _973;
    float _1037 = _967;
    float _1039 = _957;
    float _1041 = _1037;
    float _1043 = _1039;
    if (_891)
    {
        _257 = 1.0;
    }
    float _1045 = _257;
    float _1047 = _1045;
    if (_945)
    {
        _259 = _1033;
    }
    float _1049 = _259;
    float _1051 = _1049;
    if (_945)
    {
        _261 = _1035;
    }
    float _1053 = _261;
    float _1055 = _1053;
    if (!_945)
    {
        float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1059 = _615 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1063 = _573 + _1061;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = -_575;
        float _1069 = _1067 + _1035;
        float _1071 = _1059 * _1059;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1075 = _575 + _1073;
        float _1077 = fma(_1063, _1063, _1071);
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1081 = fma(_1075, _1075, _1077);
        float _1083 = sqrt(_1081);
        float _1085 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1087 = precise::min(_1083, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1089 = _1087 * _1079;
        float _1091 = -_573;
        float _1093 = _1091 + _1033;
        float _1095 = -_615;
        float _1097 = _1095 + _1037;
        float _1099 = _1085 * _1089;
        float _1101 = fma(_1093, _1099, _573);
        float _1103 = fma(_1097, _1099, _615);
        float _1105 = fma(_1069, _1099, _575);
        _1041 = _1103;
        _1051 = _1101;
        _1055 = _1105;
        _1043 = _1089;
    }
    float _1107 = _1041;
    float _1109 = _1051;
    float _1111 = _1055;
    float _1113 = _1043;
    float _1115 = _1113;
    if (!_891)
    {
        float _1117 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1119 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1119 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1135 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1133);
        float _1137 = 1.0 / _1123;
        float _1139 = _1127 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        float _1143 = _1131 * _1137;
        float _1145 = 1.0 / _1135;
        float _1147 = _1141 * _1143;
        float _1149 = _1127 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1155 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1153;
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1159 = _1145 * _1157;
        float _1161 = 1.0 / _1147;
        float _1163 = 1.0 / _1155;
        float _1165 = _1151 * _1161;
        float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1169 = fma(_1165, _1159, _1167);
        float _1171 = _1169 * _1163;
        float _1173 = precise::clamp(_1171, 0.0, 1.0);
        _1047 = _1173;
    }
    float _1175 = _1047;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1179 = _1107 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1183 = _1109 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1187 = _1111 + _1185;
    float _1189 = _1179 * _1179;
    float _1191 = fma(_1183, _1183, _1189);
    float _1193 = fma(_1187, _1187, _1191);
    float _1195 = rsqrt(_1193);
    float _1197 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1199 = _1183 * _1197;
    float _1201 = _1187 * _1197;
    float _1203 = _1199 * _1199;
    float _1205 = _1201 * _1201;
    float _1207 = _1203 + _1205;
    float _1209 = sqrt(_1207);
    bool _1211 = _1209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = _1209 + _1213;
    float _1217 = _1187;
    float _1219 = _1207;
    float _1221 = _1215;
    float _1223 = _1179;
    float _1225 = _1199;
    if (_1211)
    {
        float _1227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1217 = _1227;
    }
    float _1229 = _1217;
    if (_1211)
    {
        float _1231 = rsqrt(_1207);
        _1219 = _1231;
    }
    float _1233 = _1219;
    if (_1211)
    {
        float _1235 = _1215 * _1229;
        _1221 = _1235;
    }
    float _1237 = _1221;
    if (_1211)
    {
        float _1239 = _1237 * 0.15915493667125701904296875;
        _1115 = _1239;
    }
    float _1241 = _1115;
    float _1243 = _1191;
    if (_1211)
    {
        float _1245 = _1241 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = _1195;
    float _1257 = _1253;
    float _1259 = _1251;
    if (_1211)
    {
        float _1261 = _1241 * 6.283185482025146484375;
        float _1263 = cos(_1261);
        _1255 = _1263;
    }
    float _1265 = _1255;
    float _1267 = -_1197;
    float _1269 = -_1253;
    float _1271 = fma(_1179, _1267, _1269);
    if (_1211)
    {
        float _1273 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1257 = _1273;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    float _1279 = _1249;
    if (_1211)
    {
        float _1281 = fma(_1249, _1275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1277 = _1281;
    }
    float _1283 = _1277;
    float _1285 = _1283;
    if (!_1211)
    {
        _1279 = _1271;
    }
    float _1287 = _1279;
    float _1289 = _1287;
    if (_1211)
    {
        float _1291 = _1265 + (-1.0);
        _1259 = _1291;
    }
    float _1293 = _1259;
    float _1295 = _1293;
    if (_1211)
    {
        float _1297 = _1233 * _1283;
        _959 = _1297;
    }
    float _1299 = _959;
    if (!_1211)
    {
        _1285 = _1203;
    }
    float _1301 = _1285;
    float _1303 = sqrt(_1193);
    float _1305 = _1301;
    if (_1211)
    {
        float _1307 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1223 = _1307;
    }
    float _1309 = _1223;
    float _1311 = _1309;
    if (_1211)
    {
        float _1313 = _1199 * _1299;
        _1225 = _1313;
    }
    float _1315 = _1225;
    if (!_1211)
    {
        _1295 = _1201;
    }
    float _1317 = _1295;
    float _1319 = _1317;
    if (_1211)
    {
        float _1321 = _1201 * _1299;
        _1319 = _1321;
    }
    float _1323 = _1319;
    if (_1211)
    {
        float _1325 = fma(_1271, _1265, _1309);
        _1289 = _1325;
    }
    float _1327 = _1289;
    if (_1211)
    {
        float _1329 = _1315 * _1315;
        _1305 = _1329;
    }
    float _1331 = _1305;
    if (!_1211)
    {
        _1311 = _1205;
    }
    float _1333 = _1311;
    float _1335 = _1333;
    if (_1211)
    {
        float _1337 = _1323 * _1323;
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = fma(_1327, _1327, _1331);
    float _1343 = _1341 + _1339;
    float _1345 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1349 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1347);
    float _1351 = precise::clamp(_1349, 0.0, 1.0);
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1355 = rsqrt(_1343);
    float _1357 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1345);
    float _1359 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1361 = -_1351;
    float _1363 = _1361 + 1.0;
    float _1365 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1367 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1357);
    float _1369 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1359);
    float _1371 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1373 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1365);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1377 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1371);
    float _1381 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1373);
    float _1383 = abs(_1363);
    float _1385 = log2(_1383);
    float _1387 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1379);
    float _1391 = _1355 * _1315;
    float _1393 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = _1355 * _1327;
    float _1399 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1401 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    float _1405 = _1355 * _1323;
    float _1407 = -_1399;
    float _1409 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1407);
    float _1411 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1413 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1403);
    float _1415 = -_1401;
    float _1417 = fma(_1415, _1353, 1.0);
    float _1419 = -_1405;
    float _1421 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1409);
    float _1423 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1425 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1413);
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1429 = fma(_1421, -0.5, 0.5);
    float _1431 = log2(_1417);
    float _1433 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1435 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1427);
    float _1437 = fma(_1421, 0.5, 0.5);
    float _1439 = _1397 + 1.0;
    float _1441 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1433);
    float _1443 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1435);
    float _1445 = fma(_1437, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1447 = 1.0 / _1425;
    float _1449 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1441);
    float _1451 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1443);
    float _1453 = fma(_1437, _1445, -0.212114393711090087890625);
    float _1455 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1449);
    float _1457 = fma(_1437, _1453, 1.570728778839111328125);
    float _1459 = exp2(_1423);
    float _1461 = _1431 * 0.693147182464599609375;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1465 = sqrt(_1429);
    float _1467 = _1451 * _1447;
    float _1469 = _1455 * _1447;
    float _1471 = fma(_1467, 0.5, 0.5);
    float _1473 = fma(_1469, -0.5, 0.5);
    float _1475 = -_1397;
    float _1477 = fma(_1459, _1439, _1475);
    float3 _3876 = float3(_1471, _1473, _1463);
    float _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).x;
    float3 _3887 = float3(_1471, _1473, _1463);
    float4 _1482 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).xyzw;
    float _1484 = _1482.x;
    float _1486 = _1482.y;
    float _1488 = _1482.z;
    float _1490 = _1482.w;
    float _1492 = fma(_1477, 0.5, 0.5);
    float _1494 = _1465 * 0.636619746685028076171875;
    float _1496 = -_1457;
    float _1498 = fma(_1494, _1496, 1.0);
    float2 _3914 = float2(_1498, _1492);
    float3 _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3914, float2(0.0), isnan(_3914)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3914, float2(0.0), isnan(_3914)), level(0.0)).xyz;
    float _1504 = _1502.x;
    float _1506 = _1502.y;
    float _1508 = _1502.z;
    float _1510 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1512 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1514 = _1175 > 0.0;
    bool _1516 = isnan(_1175);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan(0.0);
    bool _1522 = _1518 || _1520;
    float _1524 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1526 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1528 = exp2(_1510);
    float _1530 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1532 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1530);
    float _1534 = _1532 + _1425;
    out.gl_Position.x = _1451;
    out.gl_Position.y = _1455;
    out.gl_Position.z = _1532;
    out.gl_Position.w = _1425;
    float _1536 = _1534 * 0.5;
    float _1538 = -_1528;
    float _1540 = _1538 + 1.0;
    float _1542 = _1524 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _1536;
    out.m_66.w = _1425;
    out.m_47.x = _1542;
    float _1546 = _1544 * _1479;
    float _1548 = -_1544;
    float _1550 = _1548 + 1.0;
    float _1552 = _1490 * _1546;
    float _1554 = _1508 * _1546;
    float _1556 = fma(_1504, _1552, _1484);
    float _1558 = fma(_1506, _1552, _1486);
    float _1560 = _1490 * _1550;
    float _1562 = fma(_1490, _1554, _1488);
    out.m_68.x = _1556;
    out.m_68.y = _1558;
    out.m_68.z = _1562;
    out.m_68.w = _1560;
    if (_1522)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1564 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1564;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

