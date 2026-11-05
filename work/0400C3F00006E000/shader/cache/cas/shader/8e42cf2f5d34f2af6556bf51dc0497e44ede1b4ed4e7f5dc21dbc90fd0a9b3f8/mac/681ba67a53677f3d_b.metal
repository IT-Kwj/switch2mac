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
    float4 m_60 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _577 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2177 = as_type<float>(_105);
        out.gl_Position.z = _2177;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_141);
        out.gl_Position.z = _2245;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _151 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _153 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _155 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _151);
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _153);
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _155);
    float _163 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _157);
    float _165 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _159);
    float _167 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _161);
    bool _169 = !_149;
    float _171 = _163;
    float _189;
    if (!_169)
    {
        float _173 = in.m_51.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_89);
        float _195 = 1.0 / _193;
        float _197 = _123 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _217 = 1.0 / _203;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _227 = 1.0 / _207;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = _199 + _229;
    bool _233 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _235 = isnan(_199);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = 1.0 / _211;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _199 + _247;
    float _251 = _231 * _217;
    bool _253 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _255 = isnan(_199);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    bool _265 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _267 = isnan(_199);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _215;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _281;
    float _285 = _249 * _227;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _199 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _199 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _297 = _199 + _295;
    float _299 = 1.0 / _225;
    float _301 = _289 * _245;
    float _303 = -_263;
    float _305 = _303 + 1.0;
    float _307 = _275 * _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = 1.0 / _221;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _317 = _199 + _315;
    float _319 = _293 * _279;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _323 = _199 + _321;
    float _325 = fma(_311, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = 1.0 / _283;
    bool _329 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _331 = isnan(_199);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _317 * _299;
    bool _343 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_199);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = _297 * _313;
    float _357 = -_275;
    float _359 = _357 + 1.0;
    bool _361 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _363 = isnan(_199);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = _339 * _359;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = fma(_375, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _323 * _327;
    float _387 = -_353;
    float _389 = _387 + 1.0;
    float _391 = _371 * _381;
    float _393 = -_371;
    float _395 = _393 + 1.0;
    bool _397 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_199);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = _243 * _389;
    float _411 = -_243;
    float _413 = _411 + 1.0;
    float _415 = _353 * _395;
    bool _417 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_199);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = -_427;
    float _439 = _437 + 1.0;
    float _441 = _427 * _413;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = fma(_431, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _449 = _407 * _439;
    float _451 = -_407;
    float _453 = _451 + 1.0;
    float _455 = fma(_445, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    float _461 = _325 * _449;
    float _463 = _383 * _449;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_459, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _473 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _475 = fma(_435, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _481 = fma(_447, _441, _471);
    float _483 = fma(_455, _441, _473);
    float _485 = fma(_467, _319, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _487 = fma(_479, _319, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _493;
    float _497 = fma(_469, _409, _481);
    float _499 = fma(_475, _409, _483);
    float _501 = fma(_491, _355, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _503 = fma(_495, _355, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _513 = fma(_485, _415, _497);
    float _515 = fma(_487, _415, _499);
    float _517 = fma(_507, _341, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _519 = fma(_511, _341, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _525;
    float _529 = fma(_501, _391, _513);
    float _531 = fma(_503, _391, _515);
    float _533 = fma(_523, _385, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _535 = fma(_527, _385, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _537 = fma(_517, _377, _529);
    float _539 = fma(_519, _377, _531);
    float _541 = fma(_533, _307, _537);
    float _543 = fma(_535, _307, _539);
    float _545 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[150].x, _541);
    float _547 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[150].y, _543);
    bool _549 = !_277;
    float _573;
    float _575;
    if (!_549)
    {
        float _551 = in.m_51.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _555 = float(_89);
        float _557 = 1.0 / _555;
        float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _561 = _123 * _557;
        float _563 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _565 = _563 * _553;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = _561;
        _577 = true;
    }
    else
    {
        float _579 = float(_89);
        float _581 = 1.0 / _579;
        float _583 = _123 * _581;
        _573 = _583;
        _575 = _583;
    }
    _577 = false;
    float _585 = _573;
    float _587 = _575;
    float _589 = as_type<float>(int(gl_VertexIndex));
    float _591 = in.m_56.x;
    float _593 = in.m_56.y;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _597 = _595 != 0;
    float _599 = in.m_42.x;
    float _601 = in.m_42.y;
    float _603 = in.m_42.z;
    float _605 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _607 = in.m_51.z;
    float _609 = in.m_51.w;
    float _611 = in.m_51.x;
    int _613 = as_type<int>(_589) & 1;
    bool _615 = _613 != 0;
    int _617 = as_type<int>(_589) & 2;
    bool _619 = _617 != 0;
    float _621 = _545 * _591;
    bool _623 = !_615;
    float _625 = _623 ? (-0.5) : 0.5;
    float _627 = _547 * _593;
    bool _629 = !_619;
    float _631 = _629 ? (-0.5) : 0.5;
    float _633 = _621 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _625);
    float _637 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _631);
    float _641 = _627;
    float _643 = _631;
    if (!_597)
    {
        float _645 = in.m_51.y;
        _641 = _645;
    }
    float _647 = _641;
    float _649 = _633 * _635;
    float _651 = _601 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _653 = _637 * _639;
    float _655 = _601 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _657 = _609 > 0.5;
    float _659 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].x, _651);
    float _661 = _653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].x, _655);
    float _665 = _653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _667 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[4].z, _659);
    float _669 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    float _671 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[6].z, _663);
    float _673 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[24].x, _665);
    float _675 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _677 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _679 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _681 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[24].z, _673);
    bool _683 = _607 > 0.5;
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _687 = _601 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _689 = _681 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _691 = -_631;
    int _693 = _657 ? as_type<int>(_691) : as_type<int>(_631);
    float _695 = _679 + _685;
    float _697 = _665;
    float _699 = _603;
    float _701 = _675;
    if (!_597)
    {
        _697 = _647;
    }
    float _703 = _697;
    float _705 = _675 + _689;
    float _707 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[5].x, _687);
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _695 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _705 + _713;
    float _717 = _703;
    float _719 = _647;
    if (_597)
    {
        float _721 = in.m_51.x;
        float _723 = in.m_51.y;
        _717 = _721;
        _719 = _723;
    }
    float _725 = _717;
    float _727 = _719;
    float _729 = _711 * _711;
    float _731 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[5].z, _707);
    float _733 = -_631;
    int _735 = _683 ? as_type<int>(_733) : as_type<int>(_631);
    float _737 = fma(_715, _715, _729);
    float _739 = _653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _741 = _731 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = sqrt(_737);
    float _745 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[25].x, _739);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _757 = _755 != 0;
    float _759 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[25].z, _745);
    bool _761 = !_749;
    float _763 = _761 ? _631 : as_type<float>(_693);
    bool _765 = !_757;
    float _767 = _765 ? _631 : as_type<float>(_735);
    float _769 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _771 = _611 > 0.5;
    float _773 = _741 + _769;
    bool _775 = _727 > 0.5;
    bool _777 = _743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _779 = -_625;
    float _781 = _775 ? _779 : _625;
    float _783 = -_631;
    int _785 = _775 ? as_type<int>(_783) : as_type<int>(_631);
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _793 = _791 != 0;
    float _795 = -_625;
    int _797 = _771 ? as_type<int>(_795) : as_type<int>(_625);
    bool _799 = !_753;
    float _801 = _799 ? _625 : _781;
    bool _803 = !_793;
    float _805 = _803 ? _631 : as_type<float>(_785);
    bool _807 = !_789;
    float _809 = _807 ? _625 : as_type<float>(_797);
    float _811 = _781;
    if (!_777)
    {
        _699 = _705;
    }
    float _813 = _699;
    float _815 = _813;
    if (!_777)
    {
        _643 = _695;
    }
    float _817 = _643;
    float _819 = _817;
    if (!_777)
    {
        _811 = _773;
    }
    float _821 = _811;
    bool _823 = !_777;
    float _825 = _821;
    if (!_823)
    {
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _831 = _743 + _829;
        float _833 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = rsqrt(_737);
        float _837 = _831 * _827;
        float _839 = _837 * 0.15915493667125701904296875;
        float _841 = _839 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = _839 * 6.283185482025146484375;
        float _847 = sin(_845);
        float _849 = _843 + (-1.0);
        float _851 = _849 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = fma(_847, _833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _855 = fma(_773, _843, _851);
        float _857 = _835 * _853;
        float _859 = fma(_715, _857, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _861 = fma(_711, _857, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _825 = _855;
        _815 = _859;
        _819 = _861;
    }
    float _863 = _825;
    float _865 = _815;
    float _867 = _819;
    float _869 = -_741;
    float _871 = _869 + _863;
    float _873 = -_675;
    float _875 = _873 + _865;
    float _877 = -_679;
    float _879 = _877 + _867;
    float _881 = _741 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _871 * _871;
    bool _885 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _887 = isnan(0.5);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _893 = _889 || _891;
    float _895 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _897 = fma(_875, _875, _883);
    bool _899 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _901 = isnan(0.5);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _907 = _903 || _905;
    float _909 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _911 = fma(_879, _879, _897);
    float _913 = _741 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _915 = _909 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = sqrt(_911);
    float _919 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[10].x, _913);
    float _921 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _919);
    float _923 = 1.0 / _915;
    float _925 = _921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = _925 + _915;
    bool _929 = _917 > 0.0;
    float _931 = _927 * _923;
    float _933 = _931 * 0.5;
    float _935 = _909;
    float _937 = _867;
    float _939 = _865;
    float _941 = _915;
    float _943 = _863;
    float _945 = _871;
    if (!_929)
    {
        _935 = _863;
    }
    float _947 = _935;
    bool _949 = !_929;
    float _951 = _947;
    if (!_949)
    {
        float _953 = _165 * _165;
        float _955 = rsqrt(_911);
        float _957 = fma(_163, _163, _953);
        float _959 = fma(_167, _167, _957);
        float _961 = sqrt(_959);
        float _963 = _875 * _955;
        float _965 = _879 * _955;
        bool _967 = _961 > 0.0;
        float _969 = _871 * _955;
        float _971 = _955;
        _941 = _959;
        if (!_967)
        {
            _971 = _863;
        }
        float _973 = _971;
        bool _975 = !_967;
        _951 = _973;
        if (!_975)
        {
            float _977 = rsqrt(_959);
            float _979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _981 = _165 * _977;
            float _983 = _163 * _977;
            float _985 = _969 * _981;
            float _987 = _167 * _977;
            float _989 = fma(_963, _983, _985);
            float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _993 = fma(_965, _987, _989);
            float _995 = _993 * _991;
            float _997 = fma(_163, _995, _865);
            float _999 = fma(_165, _995, _863);
            float _1001 = fma(_167, _995, _867);
            _951 = _999;
            _937 = _1001;
            _939 = _997;
            _941 = _977;
        }
    }
    float _1003 = _951;
    float _1005 = _937;
    float _1007 = _939;
    float _1009 = _941;
    float _1011 = _1009;
    float _1013 = _1007;
    float _1015 = _1005;
    if (_907)
    {
        _1011 = 1.0;
    }
    float _1017 = _1011;
    float _1019 = _1017;
    if (_893)
    {
        _171 = _1003;
    }
    float _1021 = _171;
    float _1023 = _1021;
    if (_893)
    {
        _943 = _1005;
    }
    float _1025 = _943;
    float _1027 = _1025;
    if (!_893)
    {
        float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1031 = _741 + _1029;
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1035 = _675 + _1033;
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1039 = _1031 * _1031;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _679 + _1041;
        float _1045 = fma(_1035, _1035, _1039);
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1049 = fma(_1043, _1043, _1045);
        float _1051 = sqrt(_1049);
        float _1053 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1055 = -_679;
        float _1057 = _1055 + _1005;
        float _1059 = precise::min(_1051, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1047;
        float _1063 = -_675;
        float _1065 = _1063 + _1007;
        float _1067 = _1053 * _1061;
        float _1069 = -_741;
        float _1071 = _1069 + _1003;
        float _1073 = fma(_1065, _1067, _675);
        float _1075 = fma(_1071, _1067, _741);
        float _1077 = fma(_1057, _1067, _679);
        _1023 = _1075;
        _1013 = _1073;
        _1027 = _1077;
    }
    float _1079 = _1023;
    float _1081 = _1013;
    float _1083 = _1027;
    if (!_907)
    {
        float _1085 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1093 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
        float _1095 = _1087 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1089 * 0.15915493667125701904296875;
        float _1101 = _1087 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1093;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1117;
        float _1127 = 1.0 / _1123;
        float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1131 = _1119 * _1129;
        float _1133 = _1115 * _1125;
        float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1137 = fma(_1133, _1131, _1135);
        float _1139 = _1137 * _1127;
        float _1141 = precise::clamp(_1139, 0.0, 1.0);
        float _1143 = -_1141;
        float _1145 = _1143 + 1.0;
        _701 = _1099;
        _1015 = _1087;
        _1019 = _1145;
    }
    float _1147 = _701;
    float _1149 = _1015;
    float _1151 = _1019;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1155 = _1079 + _1153;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1159 = _1081 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1163 = _1083 + _1161;
    float _1165 = _1155 * _1155;
    float _1167 = fma(_1159, _1159, _1165);
    float _1169 = fma(_1163, _1163, _1167);
    float _1171 = rsqrt(_1169);
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1175 = _1159 * _1173;
    float _1177 = _1163 * _1173;
    float _1179 = _1175 * _1175;
    float _1181 = _1177 * _1177;
    float _1183 = _1179 + _1181;
    float _1185 = sqrt(_1183);
    bool _1187 = _1185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1191 = _1185 + _1189;
    float _1193 = _1163;
    float _1195 = _1183;
    float _1197 = _1191;
    float _1199 = _1149;
    float _1201 = _1173;
    if (_1187)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1203;
    }
    float _1205 = _1193;
    if (_1187)
    {
        float _1207 = rsqrt(_1183);
        _1195 = _1207;
    }
    float _1209 = _1195;
    float _1211 = _1209;
    if (_1187)
    {
        float _1213 = _1191 * _1205;
        _1197 = _1213;
    }
    float _1215 = _1197;
    if (_1187)
    {
        float _1217 = _1215 * 0.15915493667125701904296875;
        _1199 = _1217;
    }
    float _1219 = _1199;
    float _1221 = _1147;
    if (_1187)
    {
        float _1223 = _1219 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        _1221 = _1225;
    }
    float _1227 = _1221;
    float _1229 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1231 = precise::max(0.0, _1229);
    float _1233 = _1171;
    float _1235 = _1231;
    float _1237 = _1229;
    if (_1187)
    {
        float _1239 = _1219 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        _1233 = _1241;
    }
    float _1243 = _1233;
    float _1245 = -_1173;
    float _1247 = -_1231;
    float _1249 = fma(_1155, _1245, _1247);
    float _1251 = _1249;
    if (_1187)
    {
        float _1253 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1235 = _1253;
    }
    float _1255 = _1235;
    float _1257 = _1227;
    float _1259 = _1255;
    if (_1187)
    {
        float _1261 = fma(_1227, _1255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1257 = _1261;
    }
    float _1263 = _1257;
    if (!_1187)
    {
        _1259 = _1175;
    }
    float _1265 = _1259;
    float _1267 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1269 = _1265;
    float _1271 = _1243;
    if (_1187)
    {
        float _1273 = _1243 + (-1.0);
        _1237 = _1273;
    }
    float _1275 = _1237;
    float _1277 = _1275;
    if (_1187)
    {
        float _1279 = _1209 * _1263;
        _945 = _1279;
    }
    float _1281 = _945;
    if (!_1187)
    {
        _1211 = _1179;
    }
    float _1283 = _1211;
    float _1285 = sqrt(_1169);
    float _1287 = _1283;
    if (_1187)
    {
        float _1289 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1201 = _1289;
    }
    float _1291 = _1201;
    if (_1187)
    {
        float _1293 = _1175 * _1281;
        _1269 = _1293;
    }
    float _1295 = _1269;
    if (!_1187)
    {
        _1277 = _1177;
    }
    float _1297 = _1277;
    float _1299 = _1297;
    if (_1187)
    {
        float _1301 = _1177 * _1281;
        _1299 = _1301;
    }
    float _1303 = _1299;
    if (_1187)
    {
        float _1305 = fma(_1249, _1243, _1291);
        _1251 = _1305;
    }
    float _1307 = _1251;
    if (_1187)
    {
        float _1309 = _1295 * _1295;
        _1287 = _1309;
    }
    float _1311 = _1287;
    if (!_1187)
    {
        _1271 = _1181;
    }
    float _1313 = _1271;
    float _1315 = _1313;
    if (_1187)
    {
        float _1317 = _1303 * _1303;
        _1315 = _1317;
    }
    float _1319 = _1315;
    float _1321 = fma(_1307, _1307, _1311);
    float _1323 = _1321 + _1319;
    float _1325 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1329 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1327);
    float _1331 = precise::clamp(_1329, 0.0, 1.0);
    float _1333 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1325);
    float _1337 = rsqrt(_1323);
    float _1339 = -_1331;
    float _1341 = _1339 + 1.0;
    float _1343 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1345 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1335);
    float _1347 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1349 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1353 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1355 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1347);
    float _1357 = abs(_1341);
    float _1359 = log2(_1357);
    float _1361 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1363 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1367 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1369 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1361);
    float _1371 = _1337 * _1295;
    float _1373 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1377 = _1337 * _1307;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1337 * _1303;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1375);
    float _1385 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1387 = -_1379;
    float _1389 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = -_1367;
    float _1393 = fma(_1391, _1267, 1.0);
    float _1395 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1383);
    float _1397 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1399 = -_1381;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1403 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1405 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1407 = exp2(_1397);
    float _1409 = fma(_1401, -0.5, 0.5);
    float _1411 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1413 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1403);
    float _1415 = _1377 + 1.0;
    float _1417 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1413);
    float _1419 = log2(_1393);
    float _1421 = fma(_1401, 0.5, 0.5);
    float _1423 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1411);
    float _1425 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1417);
    float _1427 = fma(_1421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1429 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1423);
    float _1431 = 1.0 / _1405;
    float _1433 = fma(_1421, _1427, -0.212114393711090087890625);
    float _1435 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1429);
    float _1437 = -_1377;
    float _1439 = fma(_1407, _1415, _1437);
    float _1441 = fma(_1421, _1433, 1.570728778839111328125);
    float _1443 = fma(_1439, 0.5, 0.5);
    float _1445 = sqrt(_1409);
    float _1447 = _1419 * 0.693147182464599609375;
    float _1449 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1451 = _1425 * _1431;
    float _1453 = _1435 * _1431;
    float _1455 = fma(_1451, 0.5, 0.5);
    float _1457 = fma(_1453, -0.5, 0.5);
    float _1459 = _1445 * 0.636619746685028076171875;
    float _1461 = -_1441;
    float _1463 = fma(_1459, _1461, 1.0);
    float3 _4368 = float3(_1455, _1457, _1449);
    float _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4368, float3(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4368, float3(0.0), isnan(_4368)), level(0.0)).x;
    float3 _4379 = float3(_1455, _1457, _1449);
    float4 _1468 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4379, float3(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4379, float3(0.0), isnan(_4379)), level(0.0)).xyzw;
    float _1470 = _1468.x;
    float _1472 = _1468.y;
    float _1474 = _1468.z;
    float _1476 = _1468.w;
    float2 _4396 = float2(_1463, _1443);
    float3 _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).xyz;
    float _1482 = _1480.x;
    float _1484 = _1480.y;
    float _1486 = _1480.z;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1490 = _585 + _1488;
    float _1492 = _809 + 0.5;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1510 = 1.0 / _1500;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1514 = _1512 != 0;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1520 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1522 = -_805;
    float _1524 = _1522 + 0.5;
    float _1526 = 1.0 / _1496;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1534 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = 1.0 / _1504;
    float _1538 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1544 = _585 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1550 = _1544 * _1510;
    float _1552 = 1.0 / _1508;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    out.m_58.x = _1534;
    out.m_58.y = _1538;
    out.m_58.z = _1540;
    float _1562 = _1490 * _1526;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1564;
    float _1568 = 1.0 / _1518;
    float _1570 = -_767;
    float _1572 = _1570 + 0.5;
    float _1574 = -_625;
    int _1576 = _683 ? as_type<int>(_1574) : as_type<int>(_625);
    float _1578 = _801 + 0.5;
    bool _1580 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1582 = isnan(_587);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1598 = 1.0 / _1548;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1604;
    float _1608 = _1596 * _1536;
    float _1610 = _1602 * _1552;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1612;
    float _1616 = 1.0 / _1560;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1622 = _1566 * _1568;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _1628 = !_1514;
    float _1630 = _1628 ? _625 : as_type<float>(_1576);
    float _1632 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1634 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1636 = isnan(_587);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = 1.0 / _1556;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1652;
    float _1656 = _1620 * _1598;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1660 = _587 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1666 = fma(_1654, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1668 = -_1644;
    float _1670 = _1668 + 1.0;
    float _1672 = 1.0 / _1650;
    float _1674 = fma(_1608, _1660, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1676 = _1606 * _1616;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1680 = _587 + _1678;
    bool _1682 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1684 = isnan(_585);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    bool _1694 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1696 = isnan(_587);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = fma(_1656, _1680, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1708 = _1626 * _1646;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1720 = _587 + _1718;
    float _1722 = fma(_1716, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1724 = fma(_1614, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1728 = _1726 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1734 = _1712 * _1672;
    bool _1736 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1738 = isnan(_587);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = fma(_1728, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1750 = fma(_1732, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1752 = fma(_1664, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1756 = _587 + _1754;
    bool _1758 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1760 = isnan(_587);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1772 = _587 + _1770;
    float _1774 = fma(_1622, _1720, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1778 = _587 + _1776;
    float _1780 = fma(_1676, _1756, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1782 = -_1768;
    float _1784 = _1782 + 1.0;
    bool _1786 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1788 = isnan(_587);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1794 = _1790 || _1792;
    float _1796 = float(_1794);
    float _1798 = fma(_1610, _1772, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1800 = -_1746;
    float _1802 = _1800 + 1.0;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1806 = _587 + _1804;
    float _1808 = fma(_1708, _1778, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1810 = _1746 * _1784;
    bool _1812 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1814 = isnan(_587);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = _1796 * _1802;
    float _1826 = fma(_1734, _1806, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1828 = -_1796;
    float _1830 = _1828 + 1.0;
    bool _1832 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1834 = isnan(_585);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = -_1822;
    float _1846 = _1844 + 1.0;
    bool _1848 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1850 = isnan(_587);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = _1822 * _1830;
    bool _1862 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1864 = isnan(_585);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = -_1842;
    float _1876 = _1874 + 1.0;
    float _1878 = _1644 * _1846;
    float _1880 = -_1704;
    float _1882 = _1880 + 1.0;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1886 = _1872 * _1876;
    float _1888 = -_1872;
    float _1890 = _1888 + 1.0;
    float _1892 = _1590 * _1670;
    float _1894 = -_1590;
    float _1896 = _1894 + 1.0;
    float _1898 = _1692 * _1890;
    float _1900 = -_1692;
    float _1902 = _1900 + 1.0;
    bool _1904 = _1151 > 0.0;
    bool _1906 = isnan(_1151);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1916 = _1722 * _1898;
    float _1918 = _1666 * _1898;
    float _1920 = _1724 * _1898;
    float _1922 = _1724;
    float _1924 = _1898;
    if (!_597)
    {
        _1922 = _607;
    }
    float _1926 = _1922;
    float _1928 = _1704 * _1896;
    float _1930 = _1926;
    if (!_597)
    {
        _1924 = _607;
    }
    float _1932 = _1924;
    float _1934 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1914);
    float _1936 = _1932;
    if (_597)
    {
        _1930 = _727;
    }
    float _1938 = _1930;
    float _1940 = _1858 * _1882;
    if (_597)
    {
        _1936 = _727;
    }
    float _1942 = _1936;
    float _1944 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1946 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1916);
    float _1948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1950 = _1774 * _1940;
    float _1952 = -_1858;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1918);
    float _1958 = -_1884;
    float _1960 = fma(_1944, 2.0, _1958);
    float _1962 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1950);
    float _1964 = fma(_1750, _1886, _1956);
    float _1966 = fma(_1748, _1886, _1946);
    float _1968 = fma(_1674, _1928, _1962);
    float _1970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1974 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1920);
    float _1976 = fma(_1798, _1892, _1968);
    float _1978 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1980 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = fma(_1808, _1878, _1976);
    float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1988 = fma(_1752, _1886, _1974);
    float _1990 = fma(_1978, -2.0, _1972);
    float _1992 = _1630 + 0.5;
    float _1994 = -_123;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1960);
    float _1998 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1934);
    float _2000 = fma(_1780, _1860, _1984);
    float _2002 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2006 = fma(_1980, _1992, _1996);
    float _2008 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2010 = fma(_1706, _1824, _2000);
    float _2012 = -_1998;
    float _2014 = _2012 + 1.0;
    float _2016 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2002);
    float _2018 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1990);
    float _2020 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2022 = _1520 * _1986;
    float _2024 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2026 = _763 + (-0.5);
    float _2028 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1966);
    float _2030 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1964);
    float _2032 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1988);
    float _2034 = -_2014;
    float _2036 = fma(_1630, _2034, _2006);
    float _2038 = exp2(_2024);
    float _2040 = fma(_1826, _1810, _2010);
    float _2042 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2008);
    float _2044 = -_2020;
    float _2046 = -_2018;
    float _2048 = fma(_2044, _2026, _2046);
    float _2050 = -_2016;
    float _2052 = _2050 + 1.0;
    float _2054 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2056 = _2028 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2060 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2062 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2064 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2042);
    float _2066 = fma(_763, _2052, _2048);
    float _2068 = _2054 * _2004;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2072 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2074 = -_2038;
    float _2076 = _2074 + 1.0;
    float _2078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2080 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2086 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    out.m_60.x = _2022;
    out.m_60.y = _2068;
    out.m_60.z = _2036;
    out.m_60.w = _2066;
    float _2088 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2040);
    float _2090 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2092 = _2086 + _1405;
    out.m_62.x = _2072;
    out.m_62.y = _2080;
    out.m_62.z = _2082;
    out.m_62.w = _2070;
    float _2094 = _1592 * _2058;
    float _2096 = _2092 * 0.5;
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1435;
    out.gl_Position.z = _2086;
    out.gl_Position.w = _1405;
    float _2098 = _1632 * _2078;
    out.m_64.x = _2088;
    out.m_66.x = _2098;
    out.m_66.y = _2094;
    float _2100 = -_2084;
    float _2102 = _2100 + 1.0;
    float _2104 = _2090 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _2096;
    out.m_68.w = _1405;
    out.m_45.x = _2104;
    float _2106 = _2084 * _1465;
    float _2108 = _1476 * _2102;
    float _2110 = _1476 * _2106;
    float _2112 = _1486 * _2106;
    float _2114 = fma(_1482, _2110, _1470);
    float _2116 = fma(_1484, _2110, _1472);
    float _2118 = fma(_1476, _2112, _1474);
    out.m_70.x = _2114;
    out.m_70.y = _2116;
    out.m_70.z = _2118;
    out.m_70.w = _2108;
    if (_1912)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2120 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2120;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _577 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2177 = as_type<float>(_105);
        out.gl_Position.z = _2177;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_141);
        out.gl_Position.z = _2245;
    }
    if (_135)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _151 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _153 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _155 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _151);
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _153);
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _155);
    float _163 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _157);
    float _165 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _159);
    float _167 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _161);
    bool _169 = !_149;
    float _171 = _163;
    float _189;
    if (!_169)
    {
        float _173 = in.m_51.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_89);
        float _195 = 1.0 / _193;
        float _197 = _123 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _217 = 1.0 / _203;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _227 = 1.0 / _207;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = _199 + _229;
    bool _233 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _235 = isnan(_199);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = 1.0 / _211;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _199 + _247;
    float _251 = _231 * _217;
    bool _253 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _255 = isnan(_199);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    bool _265 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _267 = isnan(_199);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _215;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _281;
    float _285 = _249 * _227;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _199 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _199 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _297 = _199 + _295;
    float _299 = 1.0 / _225;
    float _301 = _289 * _245;
    float _303 = -_263;
    float _305 = _303 + 1.0;
    float _307 = _275 * _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = 1.0 / _221;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _317 = _199 + _315;
    float _319 = _293 * _279;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _323 = _199 + _321;
    float _325 = fma(_311, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = 1.0 / _283;
    bool _329 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _331 = isnan(_199);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _317 * _299;
    bool _343 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_199);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = _297 * _313;
    float _357 = -_275;
    float _359 = _357 + 1.0;
    bool _361 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _363 = isnan(_199);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = _339 * _359;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = fma(_375, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _323 * _327;
    float _387 = -_353;
    float _389 = _387 + 1.0;
    float _391 = _371 * _381;
    float _393 = -_371;
    float _395 = _393 + 1.0;
    bool _397 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_199);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = _243 * _389;
    float _411 = -_243;
    float _413 = _411 + 1.0;
    float _415 = _353 * _395;
    bool _417 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_199);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = -_427;
    float _439 = _437 + 1.0;
    float _441 = _427 * _413;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = fma(_431, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _449 = _407 * _439;
    float _451 = -_407;
    float _453 = _451 + 1.0;
    float _455 = fma(_445, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    float _461 = _325 * _449;
    float _463 = _383 * _449;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_459, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _473 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _475 = fma(_435, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _481 = fma(_447, _441, _471);
    float _483 = fma(_455, _441, _473);
    float _485 = fma(_467, _319, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _487 = fma(_479, _319, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _493;
    float _497 = fma(_469, _409, _481);
    float _499 = fma(_475, _409, _483);
    float _501 = fma(_491, _355, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _503 = fma(_495, _355, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _513 = fma(_485, _415, _497);
    float _515 = fma(_487, _415, _499);
    float _517 = fma(_507, _341, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _519 = fma(_511, _341, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _525;
    float _529 = fma(_501, _391, _513);
    float _531 = fma(_503, _391, _515);
    float _533 = fma(_523, _385, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _535 = fma(_527, _385, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _537 = fma(_517, _377, _529);
    float _539 = fma(_519, _377, _531);
    float _541 = fma(_533, _307, _537);
    float _543 = fma(_535, _307, _539);
    float _545 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[150].x, _541);
    float _547 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[150].y, _543);
    bool _549 = !_277;
    float _573;
    float _575;
    if (!_549)
    {
        float _551 = in.m_51.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _555 = float(_89);
        float _557 = 1.0 / _555;
        float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _561 = _123 * _557;
        float _563 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _565 = _563 * _553;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = _561;
        _577 = true;
    }
    else
    {
        float _579 = float(_89);
        float _581 = 1.0 / _579;
        float _583 = _123 * _581;
        _573 = _583;
        _575 = _583;
    }
    _577 = false;
    float _585 = _573;
    float _587 = _575;
    float _589 = as_type<float>(int(gl_VertexIndex));
    float _591 = in.m_56.x;
    float _593 = in.m_56.y;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _597 = _595 != 0;
    float _599 = in.m_42.x;
    float _601 = in.m_42.y;
    float _603 = in.m_42.z;
    float _605 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _607 = in.m_51.z;
    float _609 = in.m_51.w;
    float _611 = in.m_51.x;
    int _613 = as_type<int>(_589) & 1;
    bool _615 = _613 != 0;
    int _617 = as_type<int>(_589) & 2;
    bool _619 = _617 != 0;
    float _621 = _545 * _591;
    bool _623 = !_615;
    float _625 = _623 ? (-0.5) : 0.5;
    float _627 = _547 * _593;
    bool _629 = !_619;
    float _631 = _629 ? (-0.5) : 0.5;
    float _633 = _621 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _625);
    float _637 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _631);
    float _641 = _627;
    float _643 = _631;
    if (!_597)
    {
        float _645 = in.m_51.y;
        _641 = _645;
    }
    float _647 = _641;
    float _649 = _633 * _635;
    float _651 = _601 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _653 = _637 * _639;
    float _655 = _601 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _657 = _609 > 0.5;
    float _659 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].x, _651);
    float _661 = _653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].x, _655);
    float _665 = _653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _667 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[4].z, _659);
    float _669 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    float _671 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[6].z, _663);
    float _673 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[24].x, _665);
    float _675 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _677 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _679 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _681 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[24].z, _673);
    bool _683 = _607 > 0.5;
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _687 = _601 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _689 = _681 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _691 = -_631;
    int _693 = _657 ? as_type<int>(_691) : as_type<int>(_631);
    float _695 = _679 + _685;
    float _697 = _665;
    float _699 = _603;
    float _701 = _675;
    if (!_597)
    {
        _697 = _647;
    }
    float _703 = _697;
    float _705 = _675 + _689;
    float _707 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[5].x, _687);
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _695 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _705 + _713;
    float _717 = _703;
    float _719 = _647;
    if (_597)
    {
        float _721 = in.m_51.x;
        float _723 = in.m_51.y;
        _717 = _721;
        _719 = _723;
    }
    float _725 = _717;
    float _727 = _719;
    float _729 = _711 * _711;
    float _731 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[5].z, _707);
    float _733 = -_631;
    int _735 = _683 ? as_type<int>(_733) : as_type<int>(_631);
    float _737 = fma(_715, _715, _729);
    float _739 = _653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _741 = _731 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = sqrt(_737);
    float _745 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[25].x, _739);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _757 = _755 != 0;
    float _759 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[25].z, _745);
    bool _761 = !_749;
    float _763 = _761 ? _631 : as_type<float>(_693);
    bool _765 = !_757;
    float _767 = _765 ? _631 : as_type<float>(_735);
    float _769 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _771 = _611 > 0.5;
    float _773 = _741 + _769;
    bool _775 = _727 > 0.5;
    bool _777 = _743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _779 = -_625;
    float _781 = _775 ? _779 : _625;
    float _783 = -_631;
    int _785 = _775 ? as_type<int>(_783) : as_type<int>(_631);
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _793 = _791 != 0;
    float _795 = -_625;
    int _797 = _771 ? as_type<int>(_795) : as_type<int>(_625);
    bool _799 = !_753;
    float _801 = _799 ? _625 : _781;
    bool _803 = !_793;
    float _805 = _803 ? _631 : as_type<float>(_785);
    bool _807 = !_789;
    float _809 = _807 ? _625 : as_type<float>(_797);
    float _811 = _781;
    if (!_777)
    {
        _699 = _705;
    }
    float _813 = _699;
    float _815 = _813;
    if (!_777)
    {
        _643 = _695;
    }
    float _817 = _643;
    float _819 = _817;
    if (!_777)
    {
        _811 = _773;
    }
    float _821 = _811;
    bool _823 = !_777;
    float _825 = _821;
    if (!_823)
    {
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _831 = _743 + _829;
        float _833 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = rsqrt(_737);
        float _837 = _831 * _827;
        float _839 = _837 * 0.15915493667125701904296875;
        float _841 = _839 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = _839 * 6.283185482025146484375;
        float _847 = sin(_845);
        float _849 = _843 + (-1.0);
        float _851 = _849 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = fma(_847, _833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _855 = fma(_773, _843, _851);
        float _857 = _835 * _853;
        float _859 = fma(_715, _857, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _861 = fma(_711, _857, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _825 = _855;
        _815 = _859;
        _819 = _861;
    }
    float _863 = _825;
    float _865 = _815;
    float _867 = _819;
    float _869 = -_741;
    float _871 = _869 + _863;
    float _873 = -_675;
    float _875 = _873 + _865;
    float _877 = -_679;
    float _879 = _877 + _867;
    float _881 = _741 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _871 * _871;
    bool _885 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _887 = isnan(0.5);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _893 = _889 || _891;
    float _895 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _897 = fma(_875, _875, _883);
    bool _899 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _901 = isnan(0.5);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _907 = _903 || _905;
    float _909 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _911 = fma(_879, _879, _897);
    float _913 = _741 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _915 = _909 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = sqrt(_911);
    float _919 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[10].x, _913);
    float _921 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _919);
    float _923 = 1.0 / _915;
    float _925 = _921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = _925 + _915;
    bool _929 = _917 > 0.0;
    float _931 = _927 * _923;
    float _933 = _931 * 0.5;
    float _935 = _909;
    float _937 = _867;
    float _939 = _865;
    float _941 = _915;
    float _943 = _863;
    float _945 = _871;
    if (!_929)
    {
        _935 = _863;
    }
    float _947 = _935;
    bool _949 = !_929;
    float _951 = _947;
    if (!_949)
    {
        float _953 = _165 * _165;
        float _955 = rsqrt(_911);
        float _957 = fma(_163, _163, _953);
        float _959 = fma(_167, _167, _957);
        float _961 = sqrt(_959);
        float _963 = _875 * _955;
        float _965 = _879 * _955;
        bool _967 = _961 > 0.0;
        float _969 = _871 * _955;
        float _971 = _955;
        _941 = _959;
        if (!_967)
        {
            _971 = _863;
        }
        float _973 = _971;
        bool _975 = !_967;
        _951 = _973;
        if (!_975)
        {
            float _977 = rsqrt(_959);
            float _979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _981 = _165 * _977;
            float _983 = _163 * _977;
            float _985 = _969 * _981;
            float _987 = _167 * _977;
            float _989 = fma(_963, _983, _985);
            float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _993 = fma(_965, _987, _989);
            float _995 = _993 * _991;
            float _997 = fma(_163, _995, _865);
            float _999 = fma(_165, _995, _863);
            float _1001 = fma(_167, _995, _867);
            _951 = _999;
            _937 = _1001;
            _939 = _997;
            _941 = _977;
        }
    }
    float _1003 = _951;
    float _1005 = _937;
    float _1007 = _939;
    float _1009 = _941;
    float _1011 = _1009;
    float _1013 = _1007;
    float _1015 = _1005;
    if (_907)
    {
        _1011 = 1.0;
    }
    float _1017 = _1011;
    float _1019 = _1017;
    if (_893)
    {
        _171 = _1003;
    }
    float _1021 = _171;
    float _1023 = _1021;
    if (_893)
    {
        _943 = _1005;
    }
    float _1025 = _943;
    float _1027 = _1025;
    if (!_893)
    {
        float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1031 = _741 + _1029;
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1035 = _675 + _1033;
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1039 = _1031 * _1031;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _679 + _1041;
        float _1045 = fma(_1035, _1035, _1039);
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1049 = fma(_1043, _1043, _1045);
        float _1051 = sqrt(_1049);
        float _1053 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1055 = -_679;
        float _1057 = _1055 + _1005;
        float _1059 = precise::min(_1051, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1047;
        float _1063 = -_675;
        float _1065 = _1063 + _1007;
        float _1067 = _1053 * _1061;
        float _1069 = -_741;
        float _1071 = _1069 + _1003;
        float _1073 = fma(_1065, _1067, _675);
        float _1075 = fma(_1071, _1067, _741);
        float _1077 = fma(_1057, _1067, _679);
        _1023 = _1075;
        _1013 = _1073;
        _1027 = _1077;
    }
    float _1079 = _1023;
    float _1081 = _1013;
    float _1083 = _1027;
    if (!_907)
    {
        float _1085 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1093 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
        float _1095 = _1087 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1089 * 0.15915493667125701904296875;
        float _1101 = _1087 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1093;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1117;
        float _1127 = 1.0 / _1123;
        float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1131 = _1119 * _1129;
        float _1133 = _1115 * _1125;
        float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1137 = fma(_1133, _1131, _1135);
        float _1139 = _1137 * _1127;
        float _1141 = precise::clamp(_1139, 0.0, 1.0);
        float _1143 = -_1141;
        float _1145 = _1143 + 1.0;
        _701 = _1099;
        _1015 = _1087;
        _1019 = _1145;
    }
    float _1147 = _701;
    float _1149 = _1015;
    float _1151 = _1019;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1155 = _1079 + _1153;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1159 = _1081 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1163 = _1083 + _1161;
    float _1165 = _1155 * _1155;
    float _1167 = fma(_1159, _1159, _1165);
    float _1169 = fma(_1163, _1163, _1167);
    float _1171 = rsqrt(_1169);
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1175 = _1159 * _1173;
    float _1177 = _1163 * _1173;
    float _1179 = _1175 * _1175;
    float _1181 = _1177 * _1177;
    float _1183 = _1179 + _1181;
    float _1185 = sqrt(_1183);
    bool _1187 = _1185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1191 = _1185 + _1189;
    float _1193 = _1163;
    float _1195 = _1183;
    float _1197 = _1191;
    float _1199 = _1149;
    float _1201 = _1173;
    if (_1187)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1203;
    }
    float _1205 = _1193;
    if (_1187)
    {
        float _1207 = rsqrt(_1183);
        _1195 = _1207;
    }
    float _1209 = _1195;
    float _1211 = _1209;
    if (_1187)
    {
        float _1213 = _1191 * _1205;
        _1197 = _1213;
    }
    float _1215 = _1197;
    if (_1187)
    {
        float _1217 = _1215 * 0.15915493667125701904296875;
        _1199 = _1217;
    }
    float _1219 = _1199;
    float _1221 = _1147;
    if (_1187)
    {
        float _1223 = _1219 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        _1221 = _1225;
    }
    float _1227 = _1221;
    float _1229 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1231 = precise::max(0.0, _1229);
    float _1233 = _1171;
    float _1235 = _1231;
    float _1237 = _1229;
    if (_1187)
    {
        float _1239 = _1219 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        _1233 = _1241;
    }
    float _1243 = _1233;
    float _1245 = -_1173;
    float _1247 = -_1231;
    float _1249 = fma(_1155, _1245, _1247);
    float _1251 = _1249;
    if (_1187)
    {
        float _1253 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1235 = _1253;
    }
    float _1255 = _1235;
    float _1257 = _1227;
    float _1259 = _1255;
    if (_1187)
    {
        float _1261 = fma(_1227, _1255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1257 = _1261;
    }
    float _1263 = _1257;
    if (!_1187)
    {
        _1259 = _1175;
    }
    float _1265 = _1259;
    float _1267 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1269 = _1265;
    float _1271 = _1243;
    if (_1187)
    {
        float _1273 = _1243 + (-1.0);
        _1237 = _1273;
    }
    float _1275 = _1237;
    float _1277 = _1275;
    if (_1187)
    {
        float _1279 = _1209 * _1263;
        _945 = _1279;
    }
    float _1281 = _945;
    if (!_1187)
    {
        _1211 = _1179;
    }
    float _1283 = _1211;
    float _1285 = sqrt(_1169);
    float _1287 = _1283;
    if (_1187)
    {
        float _1289 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1201 = _1289;
    }
    float _1291 = _1201;
    if (_1187)
    {
        float _1293 = _1175 * _1281;
        _1269 = _1293;
    }
    float _1295 = _1269;
    if (!_1187)
    {
        _1277 = _1177;
    }
    float _1297 = _1277;
    float _1299 = _1297;
    if (_1187)
    {
        float _1301 = _1177 * _1281;
        _1299 = _1301;
    }
    float _1303 = _1299;
    if (_1187)
    {
        float _1305 = fma(_1249, _1243, _1291);
        _1251 = _1305;
    }
    float _1307 = _1251;
    if (_1187)
    {
        float _1309 = _1295 * _1295;
        _1287 = _1309;
    }
    float _1311 = _1287;
    if (!_1187)
    {
        _1271 = _1181;
    }
    float _1313 = _1271;
    float _1315 = _1313;
    if (_1187)
    {
        float _1317 = _1303 * _1303;
        _1315 = _1317;
    }
    float _1319 = _1315;
    float _1321 = fma(_1307, _1307, _1311);
    float _1323 = _1321 + _1319;
    float _1325 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1329 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1327);
    float _1331 = precise::clamp(_1329, 0.0, 1.0);
    float _1333 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1325);
    float _1337 = rsqrt(_1323);
    float _1339 = -_1331;
    float _1341 = _1339 + 1.0;
    float _1343 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1345 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1335);
    float _1347 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1349 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1353 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1355 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1347);
    float _1357 = abs(_1341);
    float _1359 = log2(_1357);
    float _1361 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1363 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1367 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1369 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1361);
    float _1371 = _1337 * _1295;
    float _1373 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1377 = _1337 * _1307;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1337 * _1303;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1375);
    float _1385 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1387 = -_1379;
    float _1389 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = -_1367;
    float _1393 = fma(_1391, _1267, 1.0);
    float _1395 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1383);
    float _1397 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1399 = -_1381;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1403 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1405 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1407 = exp2(_1397);
    float _1409 = fma(_1401, -0.5, 0.5);
    float _1411 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1413 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1403);
    float _1415 = _1377 + 1.0;
    float _1417 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1413);
    float _1419 = log2(_1393);
    float _1421 = fma(_1401, 0.5, 0.5);
    float _1423 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1411);
    float _1425 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1417);
    float _1427 = fma(_1421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1429 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1423);
    float _1431 = 1.0 / _1405;
    float _1433 = fma(_1421, _1427, -0.212114393711090087890625);
    float _1435 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1429);
    float _1437 = -_1377;
    float _1439 = fma(_1407, _1415, _1437);
    float _1441 = fma(_1421, _1433, 1.570728778839111328125);
    float _1443 = fma(_1439, 0.5, 0.5);
    float _1445 = sqrt(_1409);
    float _1447 = _1419 * 0.693147182464599609375;
    float _1449 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1451 = _1425 * _1431;
    float _1453 = _1435 * _1431;
    float _1455 = fma(_1451, 0.5, 0.5);
    float _1457 = fma(_1453, -0.5, 0.5);
    float _1459 = _1445 * 0.636619746685028076171875;
    float _1461 = -_1441;
    float _1463 = fma(_1459, _1461, 1.0);
    float3 _4368 = float3(_1455, _1457, _1449);
    float _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4368, float3(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4368, float3(0.0), isnan(_4368)), level(0.0)).x;
    float3 _4379 = float3(_1455, _1457, _1449);
    float4 _1468 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4379, float3(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4379, float3(0.0), isnan(_4379)), level(0.0)).xyzw;
    float _1470 = _1468.x;
    float _1472 = _1468.y;
    float _1474 = _1468.z;
    float _1476 = _1468.w;
    float2 _4396 = float2(_1463, _1443);
    float3 _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).xyz;
    float _1482 = _1480.x;
    float _1484 = _1480.y;
    float _1486 = _1480.z;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1490 = _585 + _1488;
    float _1492 = _809 + 0.5;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1510 = 1.0 / _1500;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1514 = _1512 != 0;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1520 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1522 = -_805;
    float _1524 = _1522 + 0.5;
    float _1526 = 1.0 / _1496;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1534 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = 1.0 / _1504;
    float _1538 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1544 = _585 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1550 = _1544 * _1510;
    float _1552 = 1.0 / _1508;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    out.m_58.x = _1534;
    out.m_58.y = _1538;
    out.m_58.z = _1540;
    float _1562 = _1490 * _1526;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1564;
    float _1568 = 1.0 / _1518;
    float _1570 = -_767;
    float _1572 = _1570 + 0.5;
    float _1574 = -_625;
    int _1576 = _683 ? as_type<int>(_1574) : as_type<int>(_625);
    float _1578 = _801 + 0.5;
    bool _1580 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1582 = isnan(_587);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1598 = 1.0 / _1548;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1604;
    float _1608 = _1596 * _1536;
    float _1610 = _1602 * _1552;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1612;
    float _1616 = 1.0 / _1560;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1622 = _1566 * _1568;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _1628 = !_1514;
    float _1630 = _1628 ? _625 : as_type<float>(_1576);
    float _1632 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1634 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1636 = isnan(_587);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = 1.0 / _1556;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1652;
    float _1656 = _1620 * _1598;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1660 = _587 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1666 = fma(_1654, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1668 = -_1644;
    float _1670 = _1668 + 1.0;
    float _1672 = 1.0 / _1650;
    float _1674 = fma(_1608, _1660, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1676 = _1606 * _1616;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1680 = _587 + _1678;
    bool _1682 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1684 = isnan(_585);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    bool _1694 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1696 = isnan(_587);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = fma(_1656, _1680, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1708 = _1626 * _1646;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1720 = _587 + _1718;
    float _1722 = fma(_1716, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1724 = fma(_1614, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1728 = _1726 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1734 = _1712 * _1672;
    bool _1736 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1738 = isnan(_587);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = fma(_1728, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1750 = fma(_1732, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1752 = fma(_1664, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1756 = _587 + _1754;
    bool _1758 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1760 = isnan(_587);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1772 = _587 + _1770;
    float _1774 = fma(_1622, _1720, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1778 = _587 + _1776;
    float _1780 = fma(_1676, _1756, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1782 = -_1768;
    float _1784 = _1782 + 1.0;
    bool _1786 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1788 = isnan(_587);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1794 = _1790 || _1792;
    float _1796 = float(_1794);
    float _1798 = fma(_1610, _1772, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1800 = -_1746;
    float _1802 = _1800 + 1.0;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1806 = _587 + _1804;
    float _1808 = fma(_1708, _1778, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1810 = _1746 * _1784;
    bool _1812 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1814 = isnan(_587);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = _1796 * _1802;
    float _1826 = fma(_1734, _1806, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1828 = -_1796;
    float _1830 = _1828 + 1.0;
    bool _1832 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1834 = isnan(_585);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = -_1822;
    float _1846 = _1844 + 1.0;
    bool _1848 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1850 = isnan(_587);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = _1822 * _1830;
    bool _1862 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1864 = isnan(_585);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = -_1842;
    float _1876 = _1874 + 1.0;
    float _1878 = _1644 * _1846;
    float _1880 = -_1704;
    float _1882 = _1880 + 1.0;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1886 = _1872 * _1876;
    float _1888 = -_1872;
    float _1890 = _1888 + 1.0;
    float _1892 = _1590 * _1670;
    float _1894 = -_1590;
    float _1896 = _1894 + 1.0;
    float _1898 = _1692 * _1890;
    float _1900 = -_1692;
    float _1902 = _1900 + 1.0;
    bool _1904 = _1151 > 0.0;
    bool _1906 = isnan(_1151);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1916 = _1722 * _1898;
    float _1918 = _1666 * _1898;
    float _1920 = _1724 * _1898;
    float _1922 = _1724;
    float _1924 = _1898;
    if (!_597)
    {
        _1922 = _607;
    }
    float _1926 = _1922;
    float _1928 = _1704 * _1896;
    float _1930 = _1926;
    if (!_597)
    {
        _1924 = _607;
    }
    float _1932 = _1924;
    float _1934 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1914);
    float _1936 = _1932;
    if (_597)
    {
        _1930 = _727;
    }
    float _1938 = _1930;
    float _1940 = _1858 * _1882;
    if (_597)
    {
        _1936 = _727;
    }
    float _1942 = _1936;
    float _1944 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1946 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1916);
    float _1948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1950 = _1774 * _1940;
    float _1952 = -_1858;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1918);
    float _1958 = -_1884;
    float _1960 = fma(_1944, 2.0, _1958);
    float _1962 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1950);
    float _1964 = fma(_1750, _1886, _1956);
    float _1966 = fma(_1748, _1886, _1946);
    float _1968 = fma(_1674, _1928, _1962);
    float _1970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1974 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1920);
    float _1976 = fma(_1798, _1892, _1968);
    float _1978 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1980 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = fma(_1808, _1878, _1976);
    float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1988 = fma(_1752, _1886, _1974);
    float _1990 = fma(_1978, -2.0, _1972);
    float _1992 = _1630 + 0.5;
    float _1994 = -_123;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1960);
    float _1998 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1934);
    float _2000 = fma(_1780, _1860, _1984);
    float _2002 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2006 = fma(_1980, _1992, _1996);
    float _2008 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2010 = fma(_1706, _1824, _2000);
    float _2012 = -_1998;
    float _2014 = _2012 + 1.0;
    float _2016 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2002);
    float _2018 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1990);
    float _2020 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2022 = _1520 * _1986;
    float _2024 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2026 = _763 + (-0.5);
    float _2028 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1966);
    float _2030 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1964);
    float _2032 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1988);
    float _2034 = -_2014;
    float _2036 = fma(_1630, _2034, _2006);
    float _2038 = exp2(_2024);
    float _2040 = fma(_1826, _1810, _2010);
    float _2042 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2008);
    float _2044 = -_2020;
    float _2046 = -_2018;
    float _2048 = fma(_2044, _2026, _2046);
    float _2050 = -_2016;
    float _2052 = _2050 + 1.0;
    float _2054 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2056 = _2028 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2060 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2062 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2064 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2042);
    float _2066 = fma(_763, _2052, _2048);
    float _2068 = _2054 * _2004;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2072 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2074 = -_2038;
    float _2076 = _2074 + 1.0;
    float _2078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2080 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2086 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    out.m_60.x = _2022;
    out.m_60.y = _2068;
    out.m_60.z = _2036;
    out.m_60.w = _2066;
    float _2088 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2040);
    float _2090 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2092 = _2086 + _1405;
    out.m_62.x = _2072;
    out.m_62.y = _2080;
    out.m_62.z = _2082;
    out.m_62.w = _2070;
    float _2094 = _1592 * _2058;
    float _2096 = _2092 * 0.5;
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1435;
    out.gl_Position.z = _2086;
    out.gl_Position.w = _1405;
    float _2098 = _1632 * _2078;
    out.m_64.x = _2088;
    out.m_66.x = _2098;
    out.m_66.y = _2094;
    float _2100 = -_2084;
    float _2102 = _2100 + 1.0;
    float _2104 = _2090 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _2096;
    out.m_68.w = _1405;
    out.m_45.x = _2104;
    float _2106 = _2084 * _1465;
    float _2108 = _1476 * _2102;
    float _2110 = _1476 * _2106;
    float _2112 = _1486 * _2106;
    float _2114 = fma(_1482, _2110, _1470);
    float _2116 = fma(_1484, _2110, _1472);
    float _2118 = fma(_1476, _2112, _1474);
    out.m_70.x = _2114;
    out.m_70.y = _2116;
    out.m_70.z = _2118;
    out.m_70.w = _2108;
    if (_1912)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2120 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2120;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _577 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2177 = as_type<float>(_105);
        out.gl_Position.z = _2177;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_141);
        out.gl_Position.z = _2245;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _151 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _153 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _155 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _151);
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _153);
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _155);
    float _163 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _157);
    float _165 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _159);
    float _167 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _161);
    bool _169 = !_149;
    float _171 = _163;
    float _189;
    if (!_169)
    {
        float _173 = in.m_51.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_89);
        float _195 = 1.0 / _193;
        float _197 = _123 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _217 = 1.0 / _203;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _227 = 1.0 / _207;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = _199 + _229;
    bool _233 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _235 = isnan(_199);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = 1.0 / _211;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _199 + _247;
    float _251 = _231 * _217;
    bool _253 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _255 = isnan(_199);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    bool _265 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _267 = isnan(_199);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _215;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _281;
    float _285 = _249 * _227;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _199 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _199 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _297 = _199 + _295;
    float _299 = 1.0 / _225;
    float _301 = _289 * _245;
    float _303 = -_263;
    float _305 = _303 + 1.0;
    float _307 = _275 * _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = 1.0 / _221;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _317 = _199 + _315;
    float _319 = _293 * _279;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _323 = _199 + _321;
    float _325 = fma(_311, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = 1.0 / _283;
    bool _329 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _331 = isnan(_199);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _317 * _299;
    bool _343 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_199);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = _297 * _313;
    float _357 = -_275;
    float _359 = _357 + 1.0;
    bool _361 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _363 = isnan(_199);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    float _377 = _339 * _359;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = fma(_375, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _323 * _327;
    float _387 = -_353;
    float _389 = _387 + 1.0;
    float _391 = _371 * _381;
    float _393 = -_371;
    float _395 = _393 + 1.0;
    bool _397 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_199);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = _243 * _389;
    float _411 = -_243;
    float _413 = _411 + 1.0;
    float _415 = _353 * _395;
    bool _417 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_199);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = -_427;
    float _439 = _437 + 1.0;
    float _441 = _427 * _413;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = fma(_431, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _449 = _407 * _439;
    float _451 = -_407;
    float _453 = _451 + 1.0;
    float _455 = fma(_445, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    float _461 = _325 * _449;
    float _463 = _383 * _449;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_459, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _473 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _475 = fma(_435, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _481 = fma(_447, _441, _471);
    float _483 = fma(_455, _441, _473);
    float _485 = fma(_467, _319, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _487 = fma(_479, _319, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _493;
    float _497 = fma(_469, _409, _481);
    float _499 = fma(_475, _409, _483);
    float _501 = fma(_491, _355, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _503 = fma(_495, _355, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _513 = fma(_485, _415, _497);
    float _515 = fma(_487, _415, _499);
    float _517 = fma(_507, _341, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _519 = fma(_511, _341, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _525;
    float _529 = fma(_501, _391, _513);
    float _531 = fma(_503, _391, _515);
    float _533 = fma(_523, _385, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _535 = fma(_527, _385, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _537 = fma(_517, _377, _529);
    float _539 = fma(_519, _377, _531);
    float _541 = fma(_533, _307, _537);
    float _543 = fma(_535, _307, _539);
    float _545 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[150].x, _541);
    float _547 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[150].y, _543);
    bool _549 = !_277;
    float _573;
    float _575;
    if (!_549)
    {
        float _551 = in.m_51.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _555 = float(_89);
        float _557 = 1.0 / _555;
        float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _561 = _123 * _557;
        float _563 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _565 = _563 * _553;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = _561;
        _577 = true;
    }
    else
    {
        float _579 = float(_89);
        float _581 = 1.0 / _579;
        float _583 = _123 * _581;
        _573 = _583;
        _575 = _583;
    }
    _577 = false;
    float _585 = _573;
    float _587 = _575;
    float _589 = as_type<float>(int(gl_VertexIndex));
    float _591 = in.m_56.x;
    float _593 = in.m_56.y;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _597 = _595 != 0;
    float _599 = in.m_42.x;
    float _601 = in.m_42.y;
    float _603 = in.m_42.z;
    float _605 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _607 = in.m_51.z;
    float _609 = in.m_51.w;
    float _611 = in.m_51.x;
    int _613 = as_type<int>(_589) & 1;
    bool _615 = _613 != 0;
    int _617 = as_type<int>(_589) & 2;
    bool _619 = _617 != 0;
    float _621 = _545 * _591;
    bool _623 = !_615;
    float _625 = _623 ? (-0.5) : 0.5;
    float _627 = _547 * _593;
    bool _629 = !_619;
    float _631 = _629 ? (-0.5) : 0.5;
    float _633 = _621 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _625);
    float _637 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _631);
    float _641 = _627;
    float _643 = _631;
    if (!_597)
    {
        float _645 = in.m_51.y;
        _641 = _645;
    }
    float _647 = _641;
    float _649 = _633 * _635;
    float _651 = _601 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _653 = _637 * _639;
    float _655 = _601 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _657 = _609 > 0.5;
    float _659 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].x, _651);
    float _661 = _653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].x, _655);
    float _665 = _653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _667 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[4].z, _659);
    float _669 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    float _671 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[6].z, _663);
    float _673 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[24].x, _665);
    float _675 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _677 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _679 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _681 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[24].z, _673);
    bool _683 = _607 > 0.5;
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _687 = _601 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _689 = _681 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _691 = -_631;
    int _693 = _657 ? as_type<int>(_691) : as_type<int>(_631);
    float _695 = _679 + _685;
    float _697 = _665;
    float _699 = _603;
    float _701 = _675;
    if (!_597)
    {
        _697 = _647;
    }
    float _703 = _697;
    float _705 = _675 + _689;
    float _707 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[5].x, _687);
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _695 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _705 + _713;
    float _717 = _703;
    float _719 = _647;
    if (_597)
    {
        float _721 = in.m_51.x;
        float _723 = in.m_51.y;
        _717 = _721;
        _719 = _723;
    }
    float _725 = _717;
    float _727 = _719;
    float _729 = _711 * _711;
    float _731 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[5].z, _707);
    float _733 = -_631;
    int _735 = _683 ? as_type<int>(_733) : as_type<int>(_631);
    float _737 = fma(_715, _715, _729);
    float _739 = _653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _741 = _731 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = sqrt(_737);
    float _745 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[25].x, _739);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _757 = _755 != 0;
    float _759 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[25].z, _745);
    bool _761 = !_749;
    float _763 = _761 ? _631 : as_type<float>(_693);
    bool _765 = !_757;
    float _767 = _765 ? _631 : as_type<float>(_735);
    float _769 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _771 = _611 > 0.5;
    float _773 = _741 + _769;
    bool _775 = _727 > 0.5;
    bool _777 = _743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _779 = -_625;
    float _781 = _775 ? _779 : _625;
    float _783 = -_631;
    int _785 = _775 ? as_type<int>(_783) : as_type<int>(_631);
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _793 = _791 != 0;
    float _795 = -_625;
    int _797 = _771 ? as_type<int>(_795) : as_type<int>(_625);
    bool _799 = !_753;
    float _801 = _799 ? _625 : _781;
    bool _803 = !_793;
    float _805 = _803 ? _631 : as_type<float>(_785);
    bool _807 = !_789;
    float _809 = _807 ? _625 : as_type<float>(_797);
    float _811 = _781;
    if (!_777)
    {
        _699 = _705;
    }
    float _813 = _699;
    float _815 = _813;
    if (!_777)
    {
        _643 = _695;
    }
    float _817 = _643;
    float _819 = _817;
    if (!_777)
    {
        _811 = _773;
    }
    float _821 = _811;
    bool _823 = !_777;
    float _825 = _821;
    if (!_823)
    {
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _831 = _743 + _829;
        float _833 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = rsqrt(_737);
        float _837 = _831 * _827;
        float _839 = _837 * 0.15915493667125701904296875;
        float _841 = _839 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = _839 * 6.283185482025146484375;
        float _847 = sin(_845);
        float _849 = _843 + (-1.0);
        float _851 = _849 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = fma(_847, _833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _855 = fma(_773, _843, _851);
        float _857 = _835 * _853;
        float _859 = fma(_715, _857, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _861 = fma(_711, _857, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _825 = _855;
        _815 = _859;
        _819 = _861;
    }
    float _863 = _825;
    float _865 = _815;
    float _867 = _819;
    float _869 = -_741;
    float _871 = _869 + _863;
    float _873 = -_675;
    float _875 = _873 + _865;
    float _877 = -_679;
    float _879 = _877 + _867;
    float _881 = _741 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _871 * _871;
    bool _885 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _887 = isnan(0.5);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _893 = _889 || _891;
    float _895 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _897 = fma(_875, _875, _883);
    bool _899 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _901 = isnan(0.5);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _907 = _903 || _905;
    float _909 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _911 = fma(_879, _879, _897);
    float _913 = _741 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _915 = _909 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _917 = sqrt(_911);
    float _919 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[10].x, _913);
    float _921 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _919);
    float _923 = 1.0 / _915;
    float _925 = _921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = _925 + _915;
    bool _929 = _917 > 0.0;
    float _931 = _927 * _923;
    float _933 = _931 * 0.5;
    float _935 = _909;
    float _937 = _867;
    float _939 = _865;
    float _941 = _915;
    float _943 = _863;
    float _945 = _871;
    if (!_929)
    {
        _935 = _863;
    }
    float _947 = _935;
    bool _949 = !_929;
    float _951 = _947;
    if (!_949)
    {
        float _953 = _165 * _165;
        float _955 = rsqrt(_911);
        float _957 = fma(_163, _163, _953);
        float _959 = fma(_167, _167, _957);
        float _961 = sqrt(_959);
        float _963 = _875 * _955;
        float _965 = _879 * _955;
        bool _967 = _961 > 0.0;
        float _969 = _871 * _955;
        float _971 = _955;
        _941 = _959;
        if (!_967)
        {
            _971 = _863;
        }
        float _973 = _971;
        bool _975 = !_967;
        _951 = _973;
        if (!_975)
        {
            float _977 = rsqrt(_959);
            float _979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _981 = _165 * _977;
            float _983 = _163 * _977;
            float _985 = _969 * _981;
            float _987 = _167 * _977;
            float _989 = fma(_963, _983, _985);
            float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _993 = fma(_965, _987, _989);
            float _995 = _993 * _991;
            float _997 = fma(_163, _995, _865);
            float _999 = fma(_165, _995, _863);
            float _1001 = fma(_167, _995, _867);
            _951 = _999;
            _937 = _1001;
            _939 = _997;
            _941 = _977;
        }
    }
    float _1003 = _951;
    float _1005 = _937;
    float _1007 = _939;
    float _1009 = _941;
    float _1011 = _1009;
    float _1013 = _1007;
    float _1015 = _1005;
    if (_907)
    {
        _1011 = 1.0;
    }
    float _1017 = _1011;
    float _1019 = _1017;
    if (_893)
    {
        _171 = _1003;
    }
    float _1021 = _171;
    float _1023 = _1021;
    if (_893)
    {
        _943 = _1005;
    }
    float _1025 = _943;
    float _1027 = _1025;
    if (!_893)
    {
        float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1031 = _741 + _1029;
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1035 = _675 + _1033;
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1039 = _1031 * _1031;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _679 + _1041;
        float _1045 = fma(_1035, _1035, _1039);
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1049 = fma(_1043, _1043, _1045);
        float _1051 = sqrt(_1049);
        float _1053 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1055 = -_679;
        float _1057 = _1055 + _1005;
        float _1059 = precise::min(_1051, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1047;
        float _1063 = -_675;
        float _1065 = _1063 + _1007;
        float _1067 = _1053 * _1061;
        float _1069 = -_741;
        float _1071 = _1069 + _1003;
        float _1073 = fma(_1065, _1067, _675);
        float _1075 = fma(_1071, _1067, _741);
        float _1077 = fma(_1057, _1067, _679);
        _1023 = _1075;
        _1013 = _1073;
        _1027 = _1077;
    }
    float _1079 = _1023;
    float _1081 = _1013;
    float _1083 = _1027;
    if (!_907)
    {
        float _1085 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1093 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
        float _1095 = _1087 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1089 * 0.15915493667125701904296875;
        float _1101 = _1087 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1093;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1117;
        float _1127 = 1.0 / _1123;
        float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1131 = _1119 * _1129;
        float _1133 = _1115 * _1125;
        float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1137 = fma(_1133, _1131, _1135);
        float _1139 = _1137 * _1127;
        float _1141 = precise::clamp(_1139, 0.0, 1.0);
        float _1143 = -_1141;
        float _1145 = _1143 + 1.0;
        _701 = _1099;
        _1015 = _1087;
        _1019 = _1145;
    }
    float _1147 = _701;
    float _1149 = _1015;
    float _1151 = _1019;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1155 = _1079 + _1153;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1159 = _1081 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1163 = _1083 + _1161;
    float _1165 = _1155 * _1155;
    float _1167 = fma(_1159, _1159, _1165);
    float _1169 = fma(_1163, _1163, _1167);
    float _1171 = rsqrt(_1169);
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1175 = _1159 * _1173;
    float _1177 = _1163 * _1173;
    float _1179 = _1175 * _1175;
    float _1181 = _1177 * _1177;
    float _1183 = _1179 + _1181;
    float _1185 = sqrt(_1183);
    bool _1187 = _1185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1191 = _1185 + _1189;
    float _1193 = _1163;
    float _1195 = _1183;
    float _1197 = _1191;
    float _1199 = _1149;
    float _1201 = _1173;
    if (_1187)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1203;
    }
    float _1205 = _1193;
    if (_1187)
    {
        float _1207 = rsqrt(_1183);
        _1195 = _1207;
    }
    float _1209 = _1195;
    float _1211 = _1209;
    if (_1187)
    {
        float _1213 = _1191 * _1205;
        _1197 = _1213;
    }
    float _1215 = _1197;
    if (_1187)
    {
        float _1217 = _1215 * 0.15915493667125701904296875;
        _1199 = _1217;
    }
    float _1219 = _1199;
    float _1221 = _1147;
    if (_1187)
    {
        float _1223 = _1219 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        _1221 = _1225;
    }
    float _1227 = _1221;
    float _1229 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1231 = precise::max(0.0, _1229);
    float _1233 = _1171;
    float _1235 = _1231;
    float _1237 = _1229;
    if (_1187)
    {
        float _1239 = _1219 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        _1233 = _1241;
    }
    float _1243 = _1233;
    float _1245 = -_1173;
    float _1247 = -_1231;
    float _1249 = fma(_1155, _1245, _1247);
    float _1251 = _1249;
    if (_1187)
    {
        float _1253 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1235 = _1253;
    }
    float _1255 = _1235;
    float _1257 = _1227;
    float _1259 = _1255;
    if (_1187)
    {
        float _1261 = fma(_1227, _1255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1257 = _1261;
    }
    float _1263 = _1257;
    if (!_1187)
    {
        _1259 = _1175;
    }
    float _1265 = _1259;
    float _1267 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1269 = _1265;
    float _1271 = _1243;
    if (_1187)
    {
        float _1273 = _1243 + (-1.0);
        _1237 = _1273;
    }
    float _1275 = _1237;
    float _1277 = _1275;
    if (_1187)
    {
        float _1279 = _1209 * _1263;
        _945 = _1279;
    }
    float _1281 = _945;
    if (!_1187)
    {
        _1211 = _1179;
    }
    float _1283 = _1211;
    float _1285 = sqrt(_1169);
    float _1287 = _1283;
    if (_1187)
    {
        float _1289 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1201 = _1289;
    }
    float _1291 = _1201;
    if (_1187)
    {
        float _1293 = _1175 * _1281;
        _1269 = _1293;
    }
    float _1295 = _1269;
    if (!_1187)
    {
        _1277 = _1177;
    }
    float _1297 = _1277;
    float _1299 = _1297;
    if (_1187)
    {
        float _1301 = _1177 * _1281;
        _1299 = _1301;
    }
    float _1303 = _1299;
    if (_1187)
    {
        float _1305 = fma(_1249, _1243, _1291);
        _1251 = _1305;
    }
    float _1307 = _1251;
    if (_1187)
    {
        float _1309 = _1295 * _1295;
        _1287 = _1309;
    }
    float _1311 = _1287;
    if (!_1187)
    {
        _1271 = _1181;
    }
    float _1313 = _1271;
    float _1315 = _1313;
    if (_1187)
    {
        float _1317 = _1303 * _1303;
        _1315 = _1317;
    }
    float _1319 = _1315;
    float _1321 = fma(_1307, _1307, _1311);
    float _1323 = _1321 + _1319;
    float _1325 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1329 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1327);
    float _1331 = precise::clamp(_1329, 0.0, 1.0);
    float _1333 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1325);
    float _1337 = rsqrt(_1323);
    float _1339 = -_1331;
    float _1341 = _1339 + 1.0;
    float _1343 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1345 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1335);
    float _1347 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1349 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1353 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1355 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1347);
    float _1357 = abs(_1341);
    float _1359 = log2(_1357);
    float _1361 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1363 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1367 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1369 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1361);
    float _1371 = _1337 * _1295;
    float _1373 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1377 = _1337 * _1307;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1337 * _1303;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1375);
    float _1385 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1387 = -_1379;
    float _1389 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = -_1367;
    float _1393 = fma(_1391, _1267, 1.0);
    float _1395 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1383);
    float _1397 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1399 = -_1381;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1403 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1405 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1407 = exp2(_1397);
    float _1409 = fma(_1401, -0.5, 0.5);
    float _1411 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1413 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1403);
    float _1415 = _1377 + 1.0;
    float _1417 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1413);
    float _1419 = log2(_1393);
    float _1421 = fma(_1401, 0.5, 0.5);
    float _1423 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1411);
    float _1425 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1417);
    float _1427 = fma(_1421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1429 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1423);
    float _1431 = 1.0 / _1405;
    float _1433 = fma(_1421, _1427, -0.212114393711090087890625);
    float _1435 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1429);
    float _1437 = -_1377;
    float _1439 = fma(_1407, _1415, _1437);
    float _1441 = fma(_1421, _1433, 1.570728778839111328125);
    float _1443 = fma(_1439, 0.5, 0.5);
    float _1445 = sqrt(_1409);
    float _1447 = _1419 * 0.693147182464599609375;
    float _1449 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1451 = _1425 * _1431;
    float _1453 = _1435 * _1431;
    float _1455 = fma(_1451, 0.5, 0.5);
    float _1457 = fma(_1453, -0.5, 0.5);
    float _1459 = _1445 * 0.636619746685028076171875;
    float _1461 = -_1441;
    float _1463 = fma(_1459, _1461, 1.0);
    float3 _4368 = float3(_1455, _1457, _1449);
    float _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4368, float3(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4368, float3(0.0), isnan(_4368)), level(0.0)).x;
    float3 _4379 = float3(_1455, _1457, _1449);
    float4 _1468 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4379, float3(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4379, float3(0.0), isnan(_4379)), level(0.0)).xyzw;
    float _1470 = _1468.x;
    float _1472 = _1468.y;
    float _1474 = _1468.z;
    float _1476 = _1468.w;
    float2 _4396 = float2(_1463, _1443);
    float3 _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).xyz;
    float _1482 = _1480.x;
    float _1484 = _1480.y;
    float _1486 = _1480.z;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1490 = _585 + _1488;
    float _1492 = _809 + 0.5;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1510 = 1.0 / _1500;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1514 = _1512 != 0;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1520 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1522 = -_805;
    float _1524 = _1522 + 0.5;
    float _1526 = 1.0 / _1496;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1534 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = 1.0 / _1504;
    float _1538 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1544 = _585 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1550 = _1544 * _1510;
    float _1552 = 1.0 / _1508;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    out.m_58.x = _1534;
    out.m_58.y = _1538;
    out.m_58.z = _1540;
    float _1562 = _1490 * _1526;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1564;
    float _1568 = 1.0 / _1518;
    float _1570 = -_767;
    float _1572 = _1570 + 0.5;
    float _1574 = -_625;
    int _1576 = _683 ? as_type<int>(_1574) : as_type<int>(_625);
    float _1578 = _801 + 0.5;
    bool _1580 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1582 = isnan(_587);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1598 = 1.0 / _1548;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1604;
    float _1608 = _1596 * _1536;
    float _1610 = _1602 * _1552;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1612;
    float _1616 = 1.0 / _1560;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1622 = _1566 * _1568;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _1628 = !_1514;
    float _1630 = _1628 ? _625 : as_type<float>(_1576);
    float _1632 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1634 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1636 = isnan(_587);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = 1.0 / _1556;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1652;
    float _1656 = _1620 * _1598;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1660 = _587 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1666 = fma(_1654, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1668 = -_1644;
    float _1670 = _1668 + 1.0;
    float _1672 = 1.0 / _1650;
    float _1674 = fma(_1608, _1660, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1676 = _1606 * _1616;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1680 = _587 + _1678;
    bool _1682 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1684 = isnan(_585);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    bool _1694 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1696 = isnan(_587);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = fma(_1656, _1680, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1708 = _1626 * _1646;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1720 = _587 + _1718;
    float _1722 = fma(_1716, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1724 = fma(_1614, _1562, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1728 = _1726 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1734 = _1712 * _1672;
    bool _1736 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1738 = isnan(_587);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = fma(_1728, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1750 = fma(_1732, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1752 = fma(_1664, _1550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1756 = _587 + _1754;
    bool _1758 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1760 = isnan(_587);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1772 = _587 + _1770;
    float _1774 = fma(_1622, _1720, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1778 = _587 + _1776;
    float _1780 = fma(_1676, _1756, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1782 = -_1768;
    float _1784 = _1782 + 1.0;
    bool _1786 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1788 = isnan(_587);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1794 = _1790 || _1792;
    float _1796 = float(_1794);
    float _1798 = fma(_1610, _1772, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1800 = -_1746;
    float _1802 = _1800 + 1.0;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1806 = _587 + _1804;
    float _1808 = fma(_1708, _1778, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1810 = _1746 * _1784;
    bool _1812 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1814 = isnan(_587);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = _1796 * _1802;
    float _1826 = fma(_1734, _1806, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1828 = -_1796;
    float _1830 = _1828 + 1.0;
    bool _1832 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1834 = isnan(_585);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = -_1822;
    float _1846 = _1844 + 1.0;
    bool _1848 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1850 = isnan(_587);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = _1822 * _1830;
    bool _1862 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1864 = isnan(_585);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = -_1842;
    float _1876 = _1874 + 1.0;
    float _1878 = _1644 * _1846;
    float _1880 = -_1704;
    float _1882 = _1880 + 1.0;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1886 = _1872 * _1876;
    float _1888 = -_1872;
    float _1890 = _1888 + 1.0;
    float _1892 = _1590 * _1670;
    float _1894 = -_1590;
    float _1896 = _1894 + 1.0;
    float _1898 = _1692 * _1890;
    float _1900 = -_1692;
    float _1902 = _1900 + 1.0;
    bool _1904 = _1151 > 0.0;
    bool _1906 = isnan(_1151);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1916 = _1722 * _1898;
    float _1918 = _1666 * _1898;
    float _1920 = _1724 * _1898;
    float _1922 = _1724;
    float _1924 = _1898;
    if (!_597)
    {
        _1922 = _607;
    }
    float _1926 = _1922;
    float _1928 = _1704 * _1896;
    float _1930 = _1926;
    if (!_597)
    {
        _1924 = _607;
    }
    float _1932 = _1924;
    float _1934 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1914);
    float _1936 = _1932;
    if (_597)
    {
        _1930 = _727;
    }
    float _1938 = _1930;
    float _1940 = _1858 * _1882;
    if (_597)
    {
        _1936 = _727;
    }
    float _1942 = _1936;
    float _1944 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1946 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1916);
    float _1948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1950 = _1774 * _1940;
    float _1952 = -_1858;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1918);
    float _1958 = -_1884;
    float _1960 = fma(_1944, 2.0, _1958);
    float _1962 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1950);
    float _1964 = fma(_1750, _1886, _1956);
    float _1966 = fma(_1748, _1886, _1946);
    float _1968 = fma(_1674, _1928, _1962);
    float _1970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1974 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1920);
    float _1976 = fma(_1798, _1892, _1968);
    float _1978 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1980 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = fma(_1808, _1878, _1976);
    float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1988 = fma(_1752, _1886, _1974);
    float _1990 = fma(_1978, -2.0, _1972);
    float _1992 = _1630 + 0.5;
    float _1994 = -_123;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1960);
    float _1998 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1934);
    float _2000 = fma(_1780, _1860, _1984);
    float _2002 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2006 = fma(_1980, _1992, _1996);
    float _2008 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2010 = fma(_1706, _1824, _2000);
    float _2012 = -_1998;
    float _2014 = _2012 + 1.0;
    float _2016 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2002);
    float _2018 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1990);
    float _2020 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2022 = _1520 * _1986;
    float _2024 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2026 = _763 + (-0.5);
    float _2028 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1966);
    float _2030 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1964);
    float _2032 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1988);
    float _2034 = -_2014;
    float _2036 = fma(_1630, _2034, _2006);
    float _2038 = exp2(_2024);
    float _2040 = fma(_1826, _1810, _2010);
    float _2042 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2008);
    float _2044 = -_2020;
    float _2046 = -_2018;
    float _2048 = fma(_2044, _2026, _2046);
    float _2050 = -_2016;
    float _2052 = _2050 + 1.0;
    float _2054 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2056 = _2028 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2060 = _2030 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2062 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2064 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2042);
    float _2066 = fma(_763, _2052, _2048);
    float _2068 = _2054 * _2004;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2072 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2074 = -_2038;
    float _2076 = _2074 + 1.0;
    float _2078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2080 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2086 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    out.m_60.x = _2022;
    out.m_60.y = _2068;
    out.m_60.z = _2036;
    out.m_60.w = _2066;
    float _2088 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2040);
    float _2090 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2092 = _2086 + _1405;
    out.m_62.x = _2072;
    out.m_62.y = _2080;
    out.m_62.z = _2082;
    out.m_62.w = _2070;
    float _2094 = _1592 * _2058;
    float _2096 = _2092 * 0.5;
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1435;
    out.gl_Position.z = _2086;
    out.gl_Position.w = _1405;
    float _2098 = _1632 * _2078;
    out.m_64.x = _2088;
    out.m_66.x = _2098;
    out.m_66.y = _2094;
    float _2100 = -_2084;
    float _2102 = _2100 + 1.0;
    float _2104 = _2090 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _2096;
    out.m_68.w = _1405;
    out.m_45.x = _2104;
    float _2106 = _2084 * _1465;
    float _2108 = _1476 * _2102;
    float _2110 = _1476 * _2106;
    float _2112 = _1486 * _2106;
    float _2114 = fma(_1482, _2110, _1470);
    float _2116 = fma(_1484, _2110, _1472);
    float _2118 = fma(_1476, _2112, _1474);
    out.m_70.x = _2114;
    out.m_70.y = _2116;
    out.m_70.z = _2118;
    out.m_70.w = _2108;
    if (_1912)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2120 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2120;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

