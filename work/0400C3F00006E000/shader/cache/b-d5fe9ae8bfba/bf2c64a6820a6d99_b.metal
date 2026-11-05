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
    float4 m_66 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _313 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3538 = as_type<float>(_113);
        out.gl_Position.z = _3538;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _107 = _135;
    }
    float _137 = _107;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3608 = as_type<float>(_151);
        out.gl_Position.z = _3608;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = in.m_52.w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = in.m_42.x;
    float _177 = in.m_42.y;
    float _179 = in.m_42.z;
    int _181 = as_type<int>(_153) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_153) & 2;
    bool _187 = _185 != 0;
    float _189 = _153;
    float _191 = _155;
    if (!_167)
    {
        float _193 = _155 * _155;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_183;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = _197;
    if (!_167)
    {
        float _205 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_187;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_167;
    float _215 = _207;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _155 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _155);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_167;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _155 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _191 = _269;
    }
    float _271 = _191;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = fma(_271, _169, _275);
    float _283 = fma(_271, _171, _277);
    float _285 = fma(_271, _173, _279);
    float _287 = fma(_281, _157, _175);
    float _289 = fma(_283, _157, _177);
    float _291 = fma(_285, _157, _179);
    bool _293 = !_273;
    float _311;
    if (!_293)
    {
        float _295 = in.m_54.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_97);
        float _317 = 1.0 / _315;
        float _319 = _131 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_54.x;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = in.m_54.y;
    float _331 = in.m_54.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _339 = log2(_337);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _343 = float(_327);
    float _345 = 1.0 / _335;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _349 = _323 * 2.0;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _353 = _329 > 0.5;
    float _355 = _329 * 2.0;
    float _357 = floor(_349);
    bool _359 = _331 > 0.5;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _375 = _373 != 0;
    float _377 = floor(_355);
    float _379 = -_201;
    int _381 = _353 ? as_type<int>(_379) : as_type<int>(_201);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -_211;
    int _389 = _359 ? as_type<int>(_387) : as_type<int>(_211);
    bool _391 = !_371;
    float _393 = _391 ? _201 : as_type<float>(_381);
    float _395 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _397 = !_375;
    float _399 = _397 ? _211 : as_type<float>(_389);
    float _401 = 1.0 / _363;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _409 = _407 != 0;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _413 = _411 != 0;
    float _415 = fma(_395, -2.0, _341);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _321 + _421;
    bool _425 = _357 > 0.0;
    bool _427 = _357 >= 0.0;
    bool _429 = isnan(_357);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = 1.0 / _385;
    float _439 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _441 = _435 ? 0 : 1;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _445 = _377 >= 0.0;
    bool _447 = isnan(_377);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = _423 * _401;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _459 = _321 + _457;
    float _461 = _323 + _329;
    float _463 = -_443;
    float _465 = fma(_439, 2.0, _463);
    int _467 = as_type<int>(_439);
    if (_419)
    {
        _467 = 0;
    }
    int _469 = _467;
    float _471 = _459 * _345;
    int _473 = ~_441;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = _461 + (-1.0);
    int _481 = _469;
    int _483 = _477;
    if (!_419)
    {
        _481 = 1;
    }
    int _485 = _481;
    float _487 = _331 * 2.0;
    if (!_425)
    {
        int _489 = ~_441;
        int _491 = _489 + 1;
        _483 = _491;
    }
    int _493 = _483;
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _497 = _377 > 0.0;
    float _499 = _323 + _331;
    float _501 = _453 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _503 = floor(_487);
    bool _505 = _485 != 1;
    float _507 = _499 + (-1.0);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _321 + _509;
    int _513 = as_type<int>(_499);
    float _515 = _501;
    float _517 = _503;
    if (_419)
    {
        _513 = 0;
    }
    int _519 = _513;
    int _521 = _519;
    if (!_419)
    {
        _521 = 2;
    }
    int _523 = _521;
    float _525 = _511 * _437;
    bool _527 = !_409;
    int _529 = _527 ? 0 : 1;
    float _531 = _331 + _329;
    bool _533 = !_405;
    int _535 = _533 ? 0 : 1;
    float _537 = 1.0 / _343;
    int _539 = ~as_type<int>(_501);
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    float _545 = _531 + (-1.0);
    bool _547 = !_413;
    int _549 = _547 ? 0 : 1;
    float _551 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _553 = _543;
    if (!_497)
    {
        int _555 = ~as_type<int>(_501);
        int _557 = _555 + 1;
        _553 = _557;
    }
    int _559 = _553;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _561;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _575 = _573 != 0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _581 = _523 != 2;
    float _583 = fma(_563, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = 0.0;
    if (!_505)
    {
        _585 = _329;
    }
    float _587 = _585;
    float _589 = fma(_579, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _593 = int(_591);
    float _595 = 0.0;
    float _597 = _587;
    if (!_505)
    {
        _595 = _587;
    }
    float _599 = _595;
    float _601 = _339 * _131;
    float _603 = _599;
    if (!_505)
    {
        _515 = _331;
    }
    float _605 = _515;
    float _607 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = 0.0;
    float _611 = _605;
    if (!_505)
    {
        _609 = _331;
    }
    float _613 = _609;
    float _615 = _537 * _131;
    float _617 = _613;
    if (_505)
    {
        _603 = _323;
    }
    float _619 = _603;
    float _621 = exp2(_601);
    if (_505)
    {
        _597 = _323;
    }
    float _623 = _597;
    if (_505)
    {
        _611 = _329;
    }
    float _625 = _611;
    if (_505)
    {
        _617 = _329;
    }
    float _627 = _617;
    bool _629 = _503 >= 0.0;
    bool _631 = isnan(_503);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    int _639 = _637 ? 0 : 1;
    bool _641 = _503 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _643;
    if (_581)
    {
        _517 = _323;
    }
    float _647 = _517;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = _647;
    if (!_581)
    {
        _653 = _331;
    }
    float _655 = _653;
    float _657 = fma(_645, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _659 = fma(_651, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _661 = _655 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _663 = !_571;
    int _665 = _663 ? 0 : 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _669 = !_567;
    int _671 = _669 ? 0 : 1;
    float _673 = -_347;
    float _675 = fma(_661, 2.0, _673);
    float _677 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    float _679 = float(_97);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _683 = _619 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _687 = abs(_665);
    float _689 = 1.0 / _679;
    float _691 = -_681;
    float _693 = fma(_683, 2.0, _691);
    float _695 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].w, _685);
    int _697 = abs(_671);
    float _699 = -_131;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[86].x, _675);
    int _703 = ~_639;
    int _705 = _703 + 1;
    int _707 = _705 + 1;
    float _709 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _677);
    float _711 = _683;
    int _713 = _707;
    if (_581)
    {
        _711 = _329;
    }
    float _715 = _711;
    float _717 = -_131;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[81].x, _693);
    float _721 = _715;
    if (!_641)
    {
        int _723 = ~_639;
        int _725 = _723 + 1;
        _713 = _725;
    }
    int _727 = _713;
    if (!_581)
    {
        _721 = _323;
    }
    float _729 = _721;
    float _731 = _625 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _733 = _729 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _735 = float(_493);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _739 = float(_727);
    float _741 = fma(_733, -2.0, _351);
    float _743 = float(_697);
    float _745 = fma(_731, -2.0, _737);
    float _747 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _741);
    float _749 = float(_593);
    float _751 = _743 * _739;
    float _753 = float(_687);
    float _755 = in.m_56.x;
    float _757 = in.m_56.y;
    float _759 = in.m_56.z;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _763 = 1.0 + _761;
    float _765 = 1.0 / _749;
    float _767 = _753 * _735;
    float _769 = _751 * (-2.0);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(1.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _785 = 1.0 / _763;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _791 = _689 * _131;
    float _793 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _771);
    float _795 = -_621;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _783);
    float _811 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[88].z, _787);
    float _813 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].w, _789);
    float _815 = _807 ? _797 : 0.0;
    float _817 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _819 = -_131;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[76].x, _465);
    float _823 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _811);
    float _825 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _415);
    bool _827 = !_575;
    int _829 = _827 ? 0 : 1;
    float _831 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _695);
    float _833 = _765 * _131;
    float _835 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _793);
    float _837 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _813);
    float _839 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _745);
    if (_781)
    {
        float _841 = _815 * _785;
        _133 = _841;
    }
    float _843 = _133;
    int _845 = abs(_829);
    float _847 = fma(_495, _769, _495);
    float _849 = fma(_769, _755, _755);
    bool _851 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _853 = isnan(_321);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _323 + (-0.5);
    bool _865 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _867 = isnan(_321);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = float(_559);
    float _879 = -_861;
    float _881 = _879 + 1.0;
    float _883 = float(_845);
    float _885 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _849);
    bool _887 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_321);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -_875;
    float _901 = _899 + 1.0;
    float _903 = _875 * _881;
    float _905 = _883 * _877;
    bool _907 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _909 = isnan(_321);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _897 * _901;
    float _921 = _767 * (-2.0);
    float _923 = -_897;
    float _925 = _923 + 1.0;
    float _927 = _329 + (-0.5);
    float _929 = fma(_921, _757, _757);
    float _931 = _917 * _925;
    float _933 = _905 * (-2.0);
    float _935 = fma(_607, _921, _607);
    float _937 = _583 * _931;
    float _939 = _657 * _931;
    float _941 = fma(_551, _933, _551);
    float _943 = fma(_933, _759, _759);
    float _945 = in.m_52.x;
    float _947 = in.m_52.y;
    float _949 = _331 + (-0.5);
    float _951 = -_917;
    float _953 = _951 + 1.0;
    float _955 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _957;
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].z, _943);
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[143].x, _937);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _965;
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[143].y, _939);
    float _971 = fma(_847, _843, _885);
    float _973 = fma(_935, _843, _955);
    float _975 = fma(_941, _843, _961);
    float _977 = fma(_959, _471, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _979 = fma(_589, _919, _963);
    float _981 = fma(_967, _471, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _983 = fma(_659, _919, _969);
    float _985 = _971 * 0.15915493667125701904296875;
    float _987 = _973 * 0.15915493667125701904296875;
    float _989 = _975 * 0.15915493667125701904296875;
    float _991 = fma(_977, _903, _979);
    float _993 = fma(_981, _903, _983);
    float _995 = _985 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1001 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[146].x, _991);
    float _1003 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[146].y, _993);
    float _1005 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = in.m_54.w;
    float _1009 = _1001 * _945;
    float _1011 = _1003 * _947;
    float _1013 = _987 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1023 = _1019 * _1017;
    float _1025 = _1021 * _999;
    float _1027 = _987 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = _985 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _997 * _1015;
    bool _1037 = _1007 > 0.5;
    float _1039 = _989 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = _997 * _1029;
    float _1045 = _989 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1033 * _1015;
    float _1051 = _1033 * _1029;
    float _1053 = _997 * _1041;
    float _1055 = _1033 * _1041;
    float _1057 = _1029 * _1041;
    float _1059 = _1015 * _1041;
    float _1061 = _1053 * _1025;
    float _1063 = _1055 * _1025;
    float _1065 = fma(_1047, _1043, _1049);
    float _1067 = -_1035;
    float _1069 = fma(_1047, _1051, _1067);
    float _1071 = fma(_1047, _1049, _1043);
    float _1073 = -_1051;
    float _1075 = fma(_1047, _1035, _1073);
    float _1077 = -_1025;
    float _1079 = _1047 * _1077;
    float _1081 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1083 = fma(_1065, _1023, _1061);
    float _1085 = fma(_1069, _1023, _1063);
    float _1087 = fma(_1057, _1023, _1079);
    float _1089 = fma(_1075, _1081, _1083);
    float _1091 = fma(_1071, _1081, _1085);
    float _1093 = fma(_1059, _1081, _1087);
    float _1095 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1097 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1099 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1101 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1097);
    float _1107 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1095);
    float _1109 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1103);
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1105);
    float _1115 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1107);
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1111);
    float _1121 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1123 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1099);
    float _1125 = _1115 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1129 = _1117 + _1121;
    float _1131 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1123);
    float _1133 = _1125 + _1127;
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1137 = _1129 + _1135;
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1143 = _1133 + _1141;
    float _1145 = _1137 * _1137;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = fma(_1143, _1143, _1145);
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1147);
    float _1155 = -_211;
    int _1157 = _1037 ? as_type<int>(_1155) : as_type<int>(_211);
    float _1159 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1161 = sqrt(_1151);
    float _1163 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1153);
    bool _1165 = !_367;
    float _1167 = _1165 ? _211 : as_type<float>(_1157);
    float _1169 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1159);
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1185 = _1183 != 0;
    float _1187 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1189 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1191 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1193 = 1.0 / _1187;
    float _1195 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1189);
    bool _1197 = !_1177;
    int _1199 = _1197 ? 0 : 1;
    float _1201 = _1191 + _1187;
    bool _1203 = !_1173;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1195);
    bool _1209 = !_1181;
    int _1211 = _1209 ? 0 : 1;
    bool _1213 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1217 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1225 = _1221 || _1223;
    bool _1227 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1229 = isnan(0.5);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1235 = _1231 || _1233;
    float _1237 = _1139 + _1215;
    bool _1239 = !_1185;
    int _1241 = _1239 ? 0 : 1;
    float _1243 = _1201 * _1193;
    float _1245 = _1243 * 0.5;
    float _1247 = _1207;
    float _1249 = _1215;
    float _1251 = _1129;
    float _1253 = _1187;
    float _1255 = _1193;
    float _1257 = _1151;
    float _1259 = _1137;
    float _1261 = _987;
    if (!_1213)
    {
        _1247 = _1133;
    }
    float _1263 = _1247;
    float _1265 = _1263;
    if (!_1213)
    {
        _1249 = _1237;
    }
    float _1267 = _1249;
    bool _1269 = !_1213;
    float _1271 = _1267;
    if (!_1269)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1277 = _1161 + _1275;
        float _1279 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1281 = rsqrt(_1151);
        float _1283 = _1277 * _1273;
        float _1285 = _1283 * 0.15915493667125701904296875;
        float _1287 = _1285 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1285 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = _1289 + (-1.0);
        float _1297 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1293, _1279, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1301 = fma(_1237, _1289, _1297);
        float _1303 = _1281 * _1299;
        float _1305 = fma(_1143, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1307 = fma(_1137, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1251 = _1307;
        _1253 = _1285;
        _1265 = _1305;
        _1271 = _1301;
        _1255 = _1297;
        _1257 = _1281;
    }
    float _1309 = _1251;
    float _1311 = _1253;
    float _1313 = _1265;
    float _1315 = _1271;
    float _1317 = _1255;
    float _1319 = _1257;
    float _1321 = _1317;
    float _1323 = _1315;
    float _1325 = _1313;
    float _1327 = _1319;
    float _1329 = _1311;
    if (_1235)
    {
        _1259 = 1.0;
    }
    float _1331 = _1259;
    float _1333 = _1331;
    if (_1225)
    {
        _1321 = _1309;
    }
    float _1335 = _1321;
    float _1337 = _1335;
    if (!_1225)
    {
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1341 = _1139 + _1339;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1345 = _1125 + _1343;
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = -_1125;
        float _1351 = _1349 + _1313;
        float _1353 = _1341 * _1341;
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1357 = _1117 + _1355;
        float _1359 = -_1139;
        float _1361 = _1359 + _1315;
        float _1363 = -_1117;
        float _1365 = _1363 + _1309;
        float _1367 = fma(_1345, _1345, _1353);
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1371 = fma(_1357, _1357, _1367);
        float _1373 = sqrt(_1371);
        float _1375 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1377 = precise::min(_1373, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1379 = _1377 * _1369;
        float _1381 = _1375 * _1379;
        float _1383 = fma(_1351, _1381, _1125);
        float _1385 = fma(_1361, _1381, _1139);
        float _1387 = fma(_1365, _1381, _1117);
        _1323 = _1385;
        _1325 = _1383;
        _1337 = _1387;
        _1327 = _1379;
        _1329 = _1347;
    }
    float _1389 = _1323;
    float _1391 = _1325;
    float _1393 = _1337;
    float _1395 = _1327;
    float _1397 = _1329;
    float _1399 = _1395;
    float _1401 = _1397;
    if (!_1235)
    {
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1411 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1409);
        float _1413 = _1405 * 6.283185482025146484375;
        float _1415 = cos(_1413);
        float _1417 = _1407 * 0.15915493667125701904296875;
        float _1419 = _1405 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = 1.0 / _1415;
        float _1425 = _1417 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1421 * _1423;
        float _1431 = _1417 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1435;
        float _1439 = _1427 * _1429;
        float _1441 = 1.0 / _1411;
        float _1443 = 1.0 / _1439;
        float _1445 = 1.0 / _1437;
        float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1449 = _1441 * _1447;
        float _1451 = _1433 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = fma(_1451, _1449, _1453);
        float _1457 = _1455 * _1445;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + 1.0;
        _1399 = _1429;
        _1333 = _1463;
    }
    float _1465 = _1399;
    float _1467 = _1333;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1389 + _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1475 = _1391 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1393 + _1477;
    float _1481 = _1471 * _1471;
    float _1483 = fma(_1475, _1475, _1481);
    float _1485 = fma(_1479, _1479, _1483);
    float _1487 = rsqrt(_1485);
    float _1489 = sqrt(_1485);
    float _1491 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1493 = _1475 * _1491;
    float _1495 = _1479 * _1491;
    float _1497 = _1493 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 + _1499;
    float _1503 = sqrt(_1501);
    bool _1505 = _1503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = _1503 + _1507;
    float _1511 = _1487;
    float _1513 = _1501;
    float _1515 = _1509;
    float _1517 = _1465;
    float _1519 = _1471;
    if (_1505)
    {
        float _1521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1521;
    }
    float _1523 = _1511;
    if (_1505)
    {
        float _1525 = rsqrt(_1501);
        _1513 = _1525;
    }
    float _1527 = _1513;
    if (_1505)
    {
        float _1529 = _1509 * _1523;
        _1515 = _1529;
    }
    float _1531 = _1515;
    if (_1505)
    {
        float _1533 = _1531 * 0.15915493667125701904296875;
        _1517 = _1533;
    }
    float _1535 = _1517;
    float _1537 = _1479;
    float _1539 = _1535;
    if (_1505)
    {
        float _1541 = _1535 * 6.283185482025146484375;
        float _1543 = sin(_1541);
        _1537 = _1543;
    }
    float _1545 = _1537;
    float _1547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1549 = precise::max(0.0, _1547);
    float _1551 = _1523;
    float _1553 = _1549;
    if (_1505)
    {
        float _1555 = _1535 * 6.283185482025146484375;
        float _1557 = cos(_1555);
        _1551 = _1557;
    }
    float _1559 = _1551;
    float _1561 = -_1491;
    float _1563 = -_1549;
    float _1565 = fma(_1471, _1561, _1563);
    if (_1505)
    {
        float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1567;
    }
    float _1569 = _1519;
    float _1571 = _1569;
    if (!_1505)
    {
        _1539 = _1497;
    }
    float _1573 = _1539;
    float _1575 = _1545;
    float _1577 = _1573;
    if (_1505)
    {
        float _1579 = fma(_1545, _1569, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1575 = _1579;
    }
    float _1581 = _1575;
    float _1583 = _1581;
    if (!_1505)
    {
        _1571 = _1565;
    }
    float _1585 = _1571;
    float _1587 = _1585;
    float _1589 = _1559;
    if (_1505)
    {
        float _1591 = _1559 + (-1.0);
        _1553 = _1591;
    }
    float _1593 = _1553;
    float _1595 = _1593;
    if (_1505)
    {
        float _1597 = _1527 * _1581;
        _1261 = _1597;
    }
    float _1599 = _1261;
    if (!_1505)
    {
        _1583 = _1493;
    }
    float _1601 = _1583;
    float _1603 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1601;
    if (_1505)
    {
        float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1607;
    }
    float _1609 = _1401;
    if (_1505)
    {
        float _1611 = _1493 * _1599;
        _1605 = _1611;
    }
    float _1613 = _1605;
    if (!_1505)
    {
        _1595 = _1495;
    }
    float _1615 = _1595;
    float _1617 = _1615;
    if (_1505)
    {
        float _1619 = _1495 * _1599;
        _1617 = _1619;
    }
    float _1621 = _1617;
    if (_1505)
    {
        float _1623 = fma(_1565, _1559, _1609);
        _1587 = _1623;
    }
    float _1625 = _1587;
    if (_1505)
    {
        float _1627 = _1613 * _1613;
        _1577 = _1627;
    }
    float _1629 = _1577;
    if (!_1505)
    {
        _1589 = _1499;
    }
    float _1631 = _1589;
    float _1633 = _1631;
    if (_1505)
    {
        float _1635 = _1621 * _1621;
        _1633 = _1635;
    }
    float _1637 = _1633;
    float _1639 = fma(_1625, _1625, _1629);
    float _1641 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1643 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = _1639 + _1637;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1649 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1647);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1655 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1657 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1659 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1661 = rsqrt(_1645);
    float _1663 = -_1651;
    float _1665 = _1663 + 1.0;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1657);
    float _1671 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1659);
    float _1673 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1677 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1669);
    float _1679 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1681 = abs(_1665);
    float _1683 = log2(_1681);
    float _1685 = -_1675;
    float _1687 = fma(_1685, _1653, 1.0);
    float _1689 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1691 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1693 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1695 = _1661 * _1613;
    float _1697 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1691);
    float _1699 = _1661 * _1625;
    float _1701 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1693);
    float _1703 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1705 = _1661 * _1621;
    float _1707 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1697);
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1711 = -_1703;
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1711);
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1717 = log2(_1687);
    float _1719 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1707);
    float _1721 = -_1705;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1713);
    float _1725 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1727 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1729 = fma(_1723, -0.5, 0.5);
    float _1731 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1725);
    float _1733 = exp2(_1715);
    float _1735 = fma(_1723, 0.5, 0.5);
    float _1737 = _1699 + 1.0;
    float _1739 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1731);
    float _1741 = fma(_1735, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1743 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1739);
    float _1745 = 1.0 / _1719;
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1727);
    float _1749 = fma(_1735, _1741, -0.212114393711090087890625);
    float _1751 = _1717 * 0.693147182464599609375;
    float _1753 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1747);
    float _1755 = fma(_1735, _1749, 1.570728778839111328125);
    float _1757 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1759 = sqrt(_1729);
    float _1761 = -_1699;
    float _1763 = fma(_1733, _1737, _1761);
    float _1765 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1753);
    float _1767 = _1743 * _1745;
    float _1769 = _1765 * _1745;
    float _1771 = fma(_1767, 0.5, 0.5);
    float _1773 = fma(_1769, -0.5, 0.5);
    float _1775 = fma(_1763, 0.5, 0.5);
    float _1777 = _1759 * 0.636619746685028076171875;
    float _1779 = -_1755;
    float _1781 = fma(_1777, _1779, 1.0);
    float3 _6160 = float3(_1771, _1773, _1757);
    float _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6160, float3(0.0), isnan(_6160)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6160, float3(0.0), isnan(_6160)), level(0.0)).x;
    float3 _6171 = float3(_1771, _1773, _1757);
    float4 _1786 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _1788 = _1786.x;
    float _1790 = _1786.y;
    float _1792 = _1786.z;
    float _1794 = _1786.w;
    float2 _6188 = float2(_1781, _1775);
    float3 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1808 = int(_1806);
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1812 = _1810 != 0;
    float _1814 = -_823;
    float _1816 = _1814 + 1.0;
    int _1818 = abs(_1199);
    float _1820 = -_837;
    float _1822 = _1820 + 1.0;
    bool _1824 = _329 > 0.5;
    out.m_58.x = _1391;
    out.m_58.y = _1389;
    out.m_58.z = _1393;
    bool _1826 = _331 > 0.5;
    float _1828 = trunc(_615);
    int _1830 = int(_1828);
    float _1832 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1834 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1836 = -_201;
    int _1838 = _1826 ? as_type<int>(_1836) : as_type<int>(_201);
    float _1840 = -_835;
    float _1842 = _1840 + 1.0;
    float _1844 = -_817;
    float _1846 = _1844 + 1.0;
    float _1848 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1834);
    float _1850 = float(uint(_1808));
    float _1852 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1854 = int(_1852);
    int _1856 = ~_1808;
    int _1858 = _1856 + 1;
    float _1860 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1848);
    bool _1862 = _1808 == 0;
    float _1864 = float(uint(_1830));
    float _1866 = 1.0 / _1850;
    float _1868 = float(_1830);
    float _1870 = float(uint(_1854));
    float _1872 = trunc(_833);
    int _1874 = int(_1872);
    int _1876 = ~_1854;
    int _1878 = _1876 + 1;
    int _1880 = as_type<int>(_1866) + (-2);
    float _1882 = 1.0 / _1870;
    float _1884 = as_type<float>(_1880) * _1864;
    int _1886 = ~_1808;
    int _1888 = _1886 + 1;
    float _1890 = float(uint(_1874));
    float _1892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1894 = as_type<int>(_1882) + (-2);
    float _1896 = trunc(_1884);
    float _1898 = precise::max(_1896, 0.0);
    uint _1901 = uint(_1898);
    float _1903 = as_type<float>(_1894) * _1890;
    int _1905 = ~_1854;
    int _1907 = _1905 + 1;
    float _1909 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1911 = exp2(_1832);
    int _1913 = _1888 * int(_1901);
    int _1915 = _1913 + _1830;
    float _1917 = trunc(_1903);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    float _1923 = as_type<float>(_1888);
    float _1925 = as_type<float>(_1915);
    if (_1812)
    {
        _1923 = 1.0;
    }
    float _1927 = _1923;
    float _1929 = _1927;
    if (!_1812)
    {
        _1929 = 7.345489978790283203125;
    }
    float _1931 = _1929;
    float _1933 = float(uint(_1915));
    float _1935 = _1933;
    if (_1812)
    {
        _1925 = _323;
    }
    float _1937 = _1925;
    float _1939 = _1931 * _323;
    float _1941 = _1937;
    if (!_1812)
    {
        _1941 = _329;
    }
    float _1943 = _1941;
    float _1945 = as_type<float>(_1880) * _1933;
    if (_1812)
    {
        _1935 = 1.0;
    }
    float _1947 = _1935;
    float _1949 = floor(_1939);
    float _1951 = _1947;
    if (!_1812)
    {
        _1951 = 1.2345600128173828125;
    }
    float _1953 = _1951;
    float _1955 = -_1911;
    float _1957 = _1955 + 1.0;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1961 = _1959 != 0;
    int _1963 = _1907 * int(_1921);
    int _1965 = _1963 + _1874;
    float _1967 = _1953 * _1943;
    float _1969 = trunc(_1945);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    float _1975 = float(uint(_1965));
    float _1977 = as_type<float>(_1894) * _1975;
    float _1979 = floor(_1967);
    float _1981 = -_1949;
    float _1983 = _1939 + _1981;
    int _1985 = int(_1901) + int(_1973);
    float _1987 = trunc(_1977);
    float _1989 = precise::max(_1987, 0.0);
    uint _1991 = uint(_1989);
    float _1993 = float(_1808);
    int _1995 = _1858 * _1985;
    int _1997 = _1995 + _1830;
    bool _1999 = _1868 >= _1993;
    bool _2001 = isnan(_1868);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan(_1993);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = -_1979;
    float _2013 = _1967 + _2011;
    float _2015 = float(_1874);
    float _2017 = trunc(_2009);
    int _2019 = int(_2017);
    bool _2021 = uint(_1997) >= uint(_1808);
    float _2023 = _1983 * _1993;
    float _2025 = _1993 * _791;
    bool _2027 = !_2021;
    int _2029 = _2027 ? 0 : (-1);
    int _2031 = int(_1921) + int(_1991);
    float _2033 = trunc(_2023);
    int _2035 = int(_2033);
    int _2037 = ~_1985;
    int _2039 = _2037 + _2029;
    int _2041 = _2039 + 1;
    float _2043 = float(_1854);
    int _2045 = _1878 * _2031;
    int _2047 = _2045 + _1874;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2051 = _2049 != 0;
    int _2053 = _1808 * _2041;
    int _2055 = _2053 + _1830;
    bool _2057 = _2015 >= _2043;
    bool _2059 = isnan(_2015);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(_2043);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = _2043 * _791;
    int _2071 = ~_2019;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    bool _2077 = !_1862;
    int _2079 = _2077 ? _2055 : (-1);
    int _2081 = _1808 + (-1);
    float _2083 = trunc(_2067);
    int _2085 = int(_2083);
    bool _2087 = !_2051;
    int _2089 = _2087 ? 0 : 1;
    int _2091 = _2079 * _2075;
    bool _2093 = uint(_2047) >= uint(_1854);
    int _2095 = abs(_529);
    int _2097 = _2019 * _2081;
    int _2099 = _2097 + _2091;
    bool _2101 = !_2093;
    int _2103 = _2101 ? 0 : (-1);
    float _2105 = trunc(_2025);
    int _2107 = int(_2105);
    bool _2109 = _1854 == 0;
    float _2111 = _2013 * _2043;
    int _2113 = ~_2031;
    int _2115 = _2113 + _2103;
    int _2117 = _2115 + 1;
    int _2119 = _2099 * _2095;
    int _2121 = abs(_2089);
    int _2123 = abs(_549);
    int _2125 = _1854 * _2117;
    int _2127 = _2125 + _1874;
    int _2129 = abs(_535);
    int _2131 = _2035 * _2121;
    int _2133 = _2131 + _1830;
    int _2135 = ~_2085;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = trunc(_2111);
    int _2143 = int(_2141);
    bool _2145 = !_2109;
    int _2147 = _2145 ? _2127 : (-1);
    bool _2149 = !_1961;
    int _2151 = _2149 ? 0 : 1;
    int _2153 = _2107 * _2129;
    int _2155 = _2153 + _2119;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2159 = _2157 != 0;
    int _2161 = _2147 * _2139;
    int _2163 = abs(_2151);
    int _2165 = _2133 * _2123;
    int _2167 = _2165 + _2155;
    float _2169 = trunc(_2069);
    int _2171 = int(_2169);
    bool _2173 = !_2159;
    int _2175 = _2173 ? 0 : 1;
    int _2177 = _2035 * _2163;
    int _2179 = _2177 + _2167;
    int _2181 = _1854 + (-1);
    int _2183 = abs(_1205);
    int _2185 = abs(_2175);
    int _2187 = _2085 * _2181;
    int _2189 = _2187 + _2161;
    float _2191 = float(uint(_2179));
    float _2193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2195 = as_type<float>(_1880) * _2191;
    int _2197 = _2189 * _1818;
    int _2199 = abs(_1211);
    int _2201 = _2143 * _2185;
    int _2203 = _2201 + _1874;
    int _2205 = abs(_1241);
    int _2207 = _2171 * _2183;
    int _2209 = _2207 + _2197;
    float _2211 = trunc(_2195);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    int _2217 = ~_1808;
    int _2219 = _2217 + 1;
    int _2221 = _2203 * _2199;
    int _2223 = _2221 + _2209;
    float _2225 = float(uint(_2133));
    int _2227 = ~_1808;
    int _2229 = _2227 + 1;
    int _2231 = _2143 * _2205;
    int _2233 = _2231 + _2223;
    float _2235 = as_type<float>(_1880) * _2225;
    int _2237 = ~_1854;
    int _2239 = _2237 + 1;
    float _2241 = float(uint(_2233));
    float _2243 = trunc(_2235);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    int _2249 = _2219 * int(_2215);
    int _2251 = _2249 + _2179;
    float _2253 = as_type<float>(_1894) * _2241;
    float _2255 = float(uint(_2203));
    float _2257 = float(uint(_2251));
    float _2259 = trunc(_2253);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    float _2265 = as_type<float>(_1894) * _2255;
    float _2267 = as_type<float>(_1880) * _2257;
    int _2269 = _2229 * int(_2247);
    int _2271 = _2269 + _2133;
    float _2273 = trunc(_2267);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    float _2279 = float(uint(_2271));
    int _2281 = _2239 * int(_2263);
    int _2283 = _2281 + _2233;
    float _2285 = trunc(_2265);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    float _2291 = as_type<float>(_1880) * _2279;
    int _2293 = ~_1808;
    int _2295 = _2293 + 1;
    float _2297 = float(uint(_2283));
    float _2299 = trunc(_2291);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = int(_2215) + int(_2277);
    float _2307 = as_type<float>(_1894) * _2297;
    int _2309 = _2239 * int(_2289);
    int _2311 = _2309 + _2203;
    float _2313 = trunc(_2307);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    int _2319 = _2295 * _2305;
    int _2321 = _2319 + _2179;
    int _2323 = ~_1808;
    int _2325 = _2323 + 1;
    float _2327 = float(uint(_2311));
    bool _2329 = uint(_2321) >= uint(_1808);
    float _2331 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2333 = as_type<float>(_1894) * _2327;
    int _2335 = int(_2247) + int(_2303);
    bool _2337 = !_2329;
    int _2339 = _2337 ? 0 : (-1);
    float _2341 = _2331 * _323;
    float _2343 = trunc(_2333);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    int _2349 = ~_2305;
    int _2351 = _2349 + _2339;
    int _2353 = _2351 + 1;
    int _2355 = int(_2263) + int(_2317);
    int _2357 = _2325 * _2335;
    int _2359 = _2357 + _2133;
    int _2361 = ~_1854;
    int _2363 = _2361 + 1;
    int _2365 = _1808 * _2353;
    int _2367 = _2365 + _2179;
    float _2369 = -_211;
    float _2371 = _2369 + 0.5;
    float _2373 = trunc(_2341);
    int _2375 = int(_2373);
    bool _2377 = uint(_2359) >= uint(_1808);
    int _2379 = _2363 * _2355;
    int _2381 = _2379 + _2233;
    bool _2383 = !_1862;
    int _2385 = _2383 ? _2367 : (-1);
    float _2387 = _201 + 0.5;
    bool _2389 = !_2377;
    int _2391 = _2389 ? 0 : (-1);
    int _2393 = _2385 & 3;
    bool _2395 = _2393 != 0;
    int _2397 = _2385 & 3;
    bool _2399 = _2397 != 0;
    out.m_60.x = _2387;
    out.m_60.y = _2371;
    bool _2401 = uint(_2381) >= uint(_1854);
    int _2403 = ~_2335;
    int _2405 = _2403 + _2391;
    int _2407 = _2405 + 1;
    int _2409 = _2395 ? 0 : 1;
    int _2411 = _2375 << 4;
    int _2413 = _2411 + 1712;
    int _2415 = _1808 * _2407;
    int _2417 = _2415 + _2133;
    bool _2419 = uint(_2397) > 1u;
    int _2421 = int(_2289) + int(_2347);
    uint _2423 = uint(int(uint(_2413) >> uint(2)));
    uint _2425 = uint(int(uint(int(_2423)) >> uint(2)));
    int _2427 = int(_2423) & 3;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[int(_2425)][_2427];
    int _2431 = int(_2423) + 1;
    uint _2433 = uint(int(uint(_2431) >> uint(2)));
    int _2435 = _2431 & 3;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[int(_2433)][_2435];
    bool _2439 = !_2401;
    int _2441 = _2439 ? 0 : (-1);
    bool _2443 = uint(_2397) >= 2u;
    int _2445 = ~_2355;
    int _2447 = _2445 + _2441;
    int _2449 = _2447 + 1;
    int _2451 = _2385 >> 31;
    int _2453 = _2413 + 8;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = _2443 ? 0 : 1;
    int _2465 = _1854 * _2449;
    int _2467 = _2465 + _2233;
    bool _2469 = _2397 != 3;
    int _2471 = _2451 & 3;
    int _2473 = ~_2409;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (!_2419)
    {
        int _2481 = ~_2409;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    bool _2487 = _2397 != 3;
    int _2489 = _2385 + _2471;
    int _2491 = ~_1854;
    int _2493 = _2491 + 1;
    int _2495 = _2489 >> 2;
    int _2497 = ~_2463;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    int _2503 = _2501;
    if (_2469)
    {
        int _2505 = ~_2463;
        int _2507 = _2505 + 1;
        _2503 = _2507;
    }
    int _2509 = _2503;
    int _2511 = _2495 << 4;
    int _2513 = _2511 + 368;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2517 = _2515 != 0;
    bool _2519 = !_2109;
    int _2521 = _2519 ? _2467 : (-1);
    uint _2523 = uint(int(uint(_2513) >> uint(2)));
    uint _2525 = uint(int(uint(int(_2523)) >> uint(2)));
    int _2527 = int(_2523) & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    int _2531 = int(_2523) + 1;
    uint _2533 = uint(int(uint(_2531) >> uint(2)));
    int _2535 = _2531 & 3;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[int(_2533)][_2535];
    bool _2539 = !_2517;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = _2521 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = !_1862;
    int _2549 = _2547 ? _2417 : (-1);
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2553 = _2551 != 0;
    bool _2555 = !_2399;
    int _2557 = _2555 ? 0 : 1;
    float _2559 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2561 = uint(_2543) > 1u;
    float _2563 = _2437 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2565 = !_2553;
    int _2567 = _2565 ? 0 : 1;
    float _2569 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2571 = _2521 & 3;
    bool _2573 = _2571 != 0;
    float _2575 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2577 = !_2487;
    int _2579 = _2577 ? 0 : (-1);
    bool _2581 = _2543 != 3;
    int _2583 = _2573 ? 0 : 1;
    bool _2585 = uint(_2543) >= 2u;
    int _2587 = ~_2583;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = _2591;
    if (!_2561)
    {
        int _2595 = ~_2583;
        int _2597 = _2595 + 1;
        _2593 = _2597;
    }
    int _2599 = _2593;
    int _2601 = _2585 ? 0 : 1;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2605 = _2603 != 0;
    float _2607 = _2461 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2609 = !_2545;
    int _2611 = _2609 ? 0 : 1;
    int _2613 = _2513 + 8;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = _2521 >> 31;
    float _2633 = _2607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2635 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2637 = _2635 != 0;
    bool _2639 = _2543 != 3;
    int _2641 = _2493 * _2421;
    int _2643 = _2641 + _2203;
    int _2645 = ~_2601;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2649;
    if (_2581)
    {
        int _2653 = ~_2601;
        int _2655 = _2653 + 1;
        _2651 = _2655;
    }
    int _2657 = _2651;
    float _2659 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2661 = _2631 & 3;
    bool _2663 = !_2639;
    int _2665 = _2663 ? 0 : (-1);
    float _2667 = _2659 * _323;
    bool _2669 = uint(_2643) >= uint(_1854);
    int _2671 = _2521 + _2661;
    float _2673 = trunc(_2667);
    int _2675 = int(_2673);
    bool _2677 = _323 > 0.5;
    float _2679 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2681 = _393 + 0.5;
    int _2683 = _2671 >> 2;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2687 = abs(_2485);
    float _2689 = fma(_2679, _2681, _701);
    int _2691 = _2683 << 4;
    int _2693 = _2691 + 512;
    float _2695 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2697 = !_2669;
    int _2699 = _2697 ? 0 : (-1);
    out.m_62.x = _2569;
    out.m_62.y = _2575;
    out.m_62.z = _2633;
    out.m_62.w = _2685;
    int _2701 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2703 = _2701 != 0;
    float _2705 = _399 + (-0.5);
    int _2707 = ~_2687;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = -_1816;
    float _2715 = fma(_393, _2713, _2689);
    int _2717 = abs(_2557);
    float _2719 = -_1909;
    float _2721 = -_747;
    float _2723 = fma(_2719, _2705, _2721);
    int _2725 = ~_2421;
    int _2727 = _2725 + _2699;
    int _2729 = _2727 + 1;
    int _2731 = ~_2717;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = abs(_2579);
    int _2739 = _1854 * _2729;
    int _2741 = _2739 + _2203;
    int _2743 = abs(_2541);
    uint _2745 = uint(int(uint(_2693) >> uint(2)));
    uint _2747 = uint(int(uint(int(_2745)) >> uint(2)));
    int _2749 = int(_2745) & 3;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[int(_2747)][_2749];
    int _2753 = int(_2745) + 1;
    uint _2755 = uint(int(uint(_2753) >> uint(2)));
    int _2757 = _2753 & 3;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[int(_2755)][_2757];
    float _2761 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2763 = _2711 * as_type<int>(_2537);
    float _2765 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2767 = -_1047;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2695);
    float _2771 = -_1047;
    float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2761);
    float _2775 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2777 = _2735 * as_type<int>(_2529);
    int _2779 = _2777 + _2763;
    float _2781 = -_1047;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2765);
    int _2785 = abs(_2509);
    float _2787 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2775);
    float _2789 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2791 = int(_2789);
    int _2793 = _2693 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    float _2811 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2813 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2815 = ~_2785;
    int _2817 = _2815 + 1;
    int _2819 = _2817 + 1;
    float _2821 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2811);
    float _2823 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2813);
    int _2825 = _2819 * as_type<int>(_2621);
    int _2827 = _2825 + _2779;
    float _2829 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2773);
    int _2831 = ~_2743;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    float _2837 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2839 = ~_2737;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2783);
    float _2847 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2769);
    float _2849 = float(uint(_2791));
    float _2851 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2853 = _2843 * as_type<int>(_2629);
    int _2855 = _2853 + _2827;
    int _2857 = abs(_2599);
    float _2859 = 1.0 / _2849;
    float _2861 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2863 = _2855 * _2835;
    int _2865 = ~_2857;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    float _2871 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2851);
    float _2873 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    int _2875 = _2549 * _2743;
    int _2877 = _2875 + _2863;
    int _2879 = abs(_2611);
    float _2881 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2837);
    int _2883 = abs(_2665);
    float _2885 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2887 = int(_2885);
    float _2889 = float(uint(_2877));
    int _2891 = ~_2879;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    int _2897 = abs(_2791);
    int _2899 = _2869 * as_type<int>(_2759);
    int _2901 = as_type<int>(_2859) + (-2);
    int _2903 = abs(_2657);
    int _2905 = _2895 * as_type<int>(_2751);
    int _2907 = _2905 + _2899;
    int _2909 = abs(_2567);
    float _2911 = as_type<float>(_2901) * _2889;
    float _2913 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2881);
    int _2915 = ~_2903;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    float _2921 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2873);
    int _2923 = ~_2883;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = trunc(_2911);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = float(uint(_2887));
    int _2937 = _2919 * as_type<int>(_2801);
    int _2939 = _2937 + _2907;
    int _2941 = ~_2909;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    int _2947 = abs(_2887);
    int _2949 = _2927 * as_type<int>(_2809);
    int _2951 = _2949 + _2939;
    int _2953 = ~_2791;
    int _2955 = _2953 + 1;
    float _2957 = 1.0 / _2935;
    float _2959 = float(uint(_2897));
    int _2961 = _2951 * _2945;
    float _2963 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2871);
    bool _2965 = !_2109;
    int _2967 = _2965 ? _2741 : (-1);
    float _2969 = 1.0 / _2959;
    float _2971 = float(uint(_2947));
    int _2973 = _2955 * int(_2933);
    int _2975 = _2973 + _2877;
    int _2977 = _2675 << 4;
    int _2979 = _2977 + 1968;
    int _2981 = _2967 * _2909;
    int _2983 = _2981 + _2961;
    int _2985 = abs(_2877);
    float _2987 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    float _2989 = float(uint(_2975));
    float _2991 = 1.0 / _2971;
    int _2993 = abs(_2983);
    float _2995 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    int _2997 = as_type<int>(_2957) + (-2);
    float _2999 = as_type<float>(_2901) * _2989;
    float _3001 = float(uint(_2983));
    float _3003 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2821);
    uint _3005 = uint(int(uint(_2979) >> uint(2)));
    uint _3007 = uint(int(uint(int(_3005)) >> uint(2)));
    int _3009 = int(_3005) & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = int(_3005) + 1;
    uint _3015 = uint(int(uint(_3013) >> uint(2)));
    int _3017 = _3013 & 3;
    float _3019 = (*spvDescriptorSet0.vp_c9)._m0[int(_3015)][_3017];
    int _3021 = as_type<int>(_2969) + (-2);
    float _3023 = as_type<float>(_2997) * _3001;
    float _3025 = float(uint(_2985));
    float _3027 = trunc(_2999);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    float _3033 = float(uint(_2993));
    out.m_64.x = _2987;
    out.m_64.y = _3003;
    out.m_64.z = _2995;
    bool _3035 = !_2605;
    float _3037 = _3035 ? _201 : as_type<float>(_1838);
    int _3039 = _2979 + 8;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    uint _3043 = uint(int(uint(int(_3041)) >> uint(2)));
    int _3045 = int(_3041) & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    int _3049 = as_type<int>(_2991) + (-2);
    float _3051 = as_type<float>(_3021) * _3025;
    int _3053 = ~_2887;
    int _3055 = _3053 + 1;
    float _3057 = trunc(_3023);
    float _3059 = precise::max(_3057, 0.0);
    uint _3061 = uint(_3059);
    int _3063 = ~_2897;
    int _3065 = _3063 + 1;
    float _3067 = as_type<float>(_3049) * _3033;
    float _3069 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3071 = ~_2947;
    int _3073 = _3071 + 1;
    float _3075 = -_211;
    int _3077 = _1824 ? as_type<int>(_3075) : as_type<int>(_211);
    float _3079 = fma(_3069, _3069, 1.0);
    float _3081 = trunc(_3051);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    float _3087 = -_201;
    int _3089 = _2677 ? as_type<int>(_3087) : as_type<int>(_201);
    float _3091 = _3069 * _2845;
    bool _3093 = !_2637;
    float _3095 = _3093 ? _211 : as_type<float>(_3077);
    float _3097 = _3069 * _2829;
    float _3099 = _3069 * _2847;
    bool _3101 = !_2703;
    float _3103 = _3101 ? _201 : as_type<float>(_3089);
    float _3105 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3107 = trunc(_3067);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    int _3113 = _3055 * int(_3061);
    int _3115 = _3113 + _2983;
    int _3117 = int(_2933) + int(_3031);
    float _3119 = fma(_3105, _2987, _3097);
    float _3121 = fma(_3105, _3003, _3091);
    int _3123 = ~_2897;
    int _3125 = _3123 + 1;
    float _3127 = fma(_3105, _2995, _3099);
    float _3129 = float(uint(_3115));
    float _3131 = rsqrt(_3079);
    int _3133 = _3065 * int(_3085);
    int _3135 = _3133 + _2985;
    float _3137 = _2913 + _3121;
    float _3139 = as_type<float>(_2997) * _3129;
    float _3141 = _2921 + _3127;
    float _3143 = float(uint(_3135));
    int _3145 = _3073 * int(_3111);
    int _3147 = _3145 + _2993;
    float _3149 = as_type<float>(_3021) * _3143;
    float _3151 = fma(_399, _1822, _2723);
    float _3153 = float(uint(_3147));
    float _3155 = _3011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3157 = _3069 * _3131;
    float _3159 = trunc(_3149);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    float _3165 = as_type<float>(_3049) * _3153;
    float _3167 = _3019 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3169 = -_2963;
    float _3171 = _3157 * _3169;
    float _3173 = -_2921;
    float _3175 = _3157 * _3173;
    float _3177 = _2963 + _3119;
    float _3179 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3181 = fma(_3131, _2829, _3171);
    float _3183 = trunc(_3165);
    float _3185 = precise::max(_3183, 0.0);
    uint _3187 = uint(_3185);
    float _3189 = _3047 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3191 = -_2913;
    float _3193 = _3157 * _3191;
    float _3195 = fma(_3131, _2847, _3175);
    float _3197 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3199 = _3167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3201 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3203 = ~_2791;
    int _3205 = _3203 + 1;
    float _3207 = trunc(_3139);
    float _3209 = precise::max(_3207, 0.0);
    uint _3211 = uint(_3209);
    int _3213 = int(_3085) + int(_3163);
    float _3215 = fma(_3131, _2845, _3193);
    out.m_66.x = _3197;
    out.m_66.y = _3199;
    out.m_66.z = _3201;
    out.m_66.w = _3179;
    int _3217 = ~_2887;
    int _3219 = _3217 + 1;
    int _3221 = _3125 * _3213;
    int _3223 = _3221 + _2985;
    int _3225 = _2877 ^ _2791;
    int _3227 = _3205 * _3117;
    int _3229 = _3227 + _2877;
    int _3231 = int(_3111) + int(_3187);
    out.m_68.x = _2715;
    out.m_68.y = _3151;
    bool _3233 = uint(_3229) >= uint(_2791);
    out.m_70.x = _3177;
    out.m_70.y = _3137;
    out.m_70.z = _3141;
    bool _3235 = uint(_3223) >= uint(_2897);
    int _3237 = int(_3061) + int(_3211);
    float _3239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3241 = ~_2947;
    int _3243 = _3241 + 1;
    out.m_72.x = _3181;
    out.m_72.y = _3215;
    out.m_72.z = _3195;
    bool _3245 = !_3233;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3219 * _3237;
    int _3251 = _3249 + _2983;
    int _3253 = ~_3117;
    int _3255 = _3253 + _3247;
    int _3257 = _3255 + 1;
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3261 = uint(_3251) >= uint(_2887);
    int _3263 = _3243 * _3231;
    int _3265 = _3263 + _2993;
    bool _3267 = !_3235;
    int _3269 = _3267 ? 0 : (-1);
    int _3271 = _2791 * _3257;
    int _3273 = _3271 + _2877;
    bool _3275 = _2791 == 0;
    bool _3277 = uint(_3265) >= uint(_2947);
    float _3279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3281 = ~_3269;
    int _3283 = _3213 + _3281;
    int _3285 = _3283 + 1;
    bool _3287 = !_3277;
    int _3289 = _3287 ? 0 : (-1);
    uint _3291 = uint(int(uint(_3225) >> uint(31)));
    float _3293 = _3239 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3295 = ~_3289;
    int _3297 = _3231 + _3295;
    int _3299 = _3297 + 1;
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3303 = _2983 ^ _2887;
    float _3305 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3307 = ~int(_3291);
    int _3309 = _3307 + 1;
    float _3311 = _1167 + (-0.5);
    uint _3313 = uint(int(uint(_3303) >> uint(31)));
    bool _3315 = !_3261;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = _3279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3321 = !_3275;
    int _3323 = _3321 ? _3273 : (-1);
    int _3325 = ~int(_3313);
    int _3327 = _3325 + 1;
    int _3329 = _3285 ^ _3309;
    int _3331 = ~_3237;
    int _3333 = _3331 + _3317;
    int _3335 = _3333 + 1;
    float _3337 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3339 = float(_3323);
    bool _3341 = _2791 == 0;
    int _3343 = _2887 * _3335;
    int _3345 = _3343 + _2983;
    int _3347 = _3299 ^ _3327;
    float _3349 = fma(_3293, _3339, _821);
    int _3351 = ~_3309;
    int _3353 = _3351 + _3329;
    int _3355 = _3353 + 1;
    bool _3357 = _2887 == 0;
    bool _3359 = _2887 == 0;
    int _3361 = ~_3327;
    int _3363 = _3361 + _3347;
    int _3365 = _3363 + 1;
    bool _3367 = !_3341;
    int _3369 = _3367 ? _3355 : (-1);
    bool _3371 = !_3357;
    int _3373 = _3371 ? _3345 : (-1);
    bool _3375 = !_3359;
    int _3377 = _3375 ? _3365 : (-1);
    float _3379 = float(_3369);
    float _3381 = float(_3373);
    float _3383 = _3103 + 0.5;
    float _3385 = float(_3377);
    float _3387 = -_825;
    float _3389 = fma(_3319, _3379, _3387);
    float _3391 = _3095 + (-0.5);
    float _3393 = fma(_3293, _3383, _3349);
    float _3395 = fma(_3337, _3381, _719);
    float _3397 = -_839;
    float _3399 = fma(_3305, _3385, _3397);
    float _3401 = _3037 + 0.5;
    float _3403 = -_3319;
    float _3405 = fma(_3403, _3391, _3389);
    float _3407 = _1743 + _1719;
    float _3409 = -_3305;
    float _3411 = fma(_3409, _3311, _3399);
    float _3413 = fma(_3337, _3401, _3395);
    float _3415 = -_709;
    float _3417 = _3415 + 1.0;
    float _3419 = _1719 * 0.5;
    float _3421 = _3407 * 0.5;
    float _3423 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3425 = -_3417;
    float _3427 = fma(_3037, _3425, _3413);
    float _3429 = -_831;
    float _3431 = _3429 + 1.0;
    float _3433 = fma(_1765, -0.5, _3419);
    float _3435 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1860);
    float _3437 = _3423 * _1783;
    bool _3439 = _1467 > 0.0;
    bool _3441 = isnan(_1467);
    bool _3443 = _3439 || _3441;
    bool _3445 = isnan(0.0);
    bool _3447 = _3443 || _3445;
    float _3449 = -_1842;
    float _3451 = fma(_3103, _3449, _3393);
    float _3453 = fma(_1167, _3431, _3411);
    float _3455 = _3435 + _1719;
    float _3457 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3459 = _1794 * _3437;
    float _3461 = _1804 * _3437;
    float _3463 = -_3423;
    float _3465 = _3463 + 1.0;
    float _3467 = fma(_3095, _1846, _3405);
    out.gl_Position.x = _1743;
    out.gl_Position.y = _1765;
    out.gl_Position.z = _3435;
    out.gl_Position.w = _1719;
    float _3469 = _3455 * 0.5;
    float _3471 = _3457 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3473 = fma(_1800, _3459, _1788);
    float _3475 = fma(_1802, _3459, _1790);
    float _3477 = _1794 * _3465;
    float _3479 = fma(_1794, _3461, _1792);
    out.m_74.x = _3421;
    out.m_74.y = _3433;
    out.m_74.z = _3469;
    out.m_74.w = _1719;
    out.m_76.x = _3451;
    out.m_76.y = _3467;
    out.m_76.z = _3427;
    out.m_76.w = _3453;
    out.m_45.x = _3471;
    out.m_78.x = _3473;
    out.m_78.y = _3475;
    out.m_78.z = _3479;
    out.m_78.w = _3477;
    if (_3447)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3481;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _313 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3538 = as_type<float>(_113);
        out.gl_Position.z = _3538;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _107 = _135;
    }
    float _137 = _107;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3608 = as_type<float>(_151);
        out.gl_Position.z = _3608;
    }
    if (_143)
    {
        return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = in.m_52.w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = in.m_42.x;
    float _177 = in.m_42.y;
    float _179 = in.m_42.z;
    int _181 = as_type<int>(_153) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_153) & 2;
    bool _187 = _185 != 0;
    float _189 = _153;
    float _191 = _155;
    if (!_167)
    {
        float _193 = _155 * _155;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_183;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = _197;
    if (!_167)
    {
        float _205 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_187;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_167;
    float _215 = _207;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _155 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _155);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_167;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _155 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _191 = _269;
    }
    float _271 = _191;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = fma(_271, _169, _275);
    float _283 = fma(_271, _171, _277);
    float _285 = fma(_271, _173, _279);
    float _287 = fma(_281, _157, _175);
    float _289 = fma(_283, _157, _177);
    float _291 = fma(_285, _157, _179);
    bool _293 = !_273;
    float _311;
    if (!_293)
    {
        float _295 = in.m_54.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_97);
        float _317 = 1.0 / _315;
        float _319 = _131 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_54.x;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = in.m_54.y;
    float _331 = in.m_54.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _339 = log2(_337);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _343 = float(_327);
    float _345 = 1.0 / _335;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _349 = _323 * 2.0;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _353 = _329 > 0.5;
    float _355 = _329 * 2.0;
    float _357 = floor(_349);
    bool _359 = _331 > 0.5;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _375 = _373 != 0;
    float _377 = floor(_355);
    float _379 = -_201;
    int _381 = _353 ? as_type<int>(_379) : as_type<int>(_201);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -_211;
    int _389 = _359 ? as_type<int>(_387) : as_type<int>(_211);
    bool _391 = !_371;
    float _393 = _391 ? _201 : as_type<float>(_381);
    float _395 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _397 = !_375;
    float _399 = _397 ? _211 : as_type<float>(_389);
    float _401 = 1.0 / _363;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _409 = _407 != 0;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _413 = _411 != 0;
    float _415 = fma(_395, -2.0, _341);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _321 + _421;
    bool _425 = _357 > 0.0;
    bool _427 = _357 >= 0.0;
    bool _429 = isnan(_357);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = 1.0 / _385;
    float _439 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _441 = _435 ? 0 : 1;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _445 = _377 >= 0.0;
    bool _447 = isnan(_377);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = _423 * _401;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _459 = _321 + _457;
    float _461 = _323 + _329;
    float _463 = -_443;
    float _465 = fma(_439, 2.0, _463);
    int _467 = as_type<int>(_439);
    if (_419)
    {
        _467 = 0;
    }
    int _469 = _467;
    float _471 = _459 * _345;
    int _473 = ~_441;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = _461 + (-1.0);
    int _481 = _469;
    int _483 = _477;
    if (!_419)
    {
        _481 = 1;
    }
    int _485 = _481;
    float _487 = _331 * 2.0;
    if (!_425)
    {
        int _489 = ~_441;
        int _491 = _489 + 1;
        _483 = _491;
    }
    int _493 = _483;
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _497 = _377 > 0.0;
    float _499 = _323 + _331;
    float _501 = _453 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _503 = floor(_487);
    bool _505 = _485 != 1;
    float _507 = _499 + (-1.0);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _321 + _509;
    int _513 = as_type<int>(_499);
    float _515 = _501;
    float _517 = _503;
    if (_419)
    {
        _513 = 0;
    }
    int _519 = _513;
    int _521 = _519;
    if (!_419)
    {
        _521 = 2;
    }
    int _523 = _521;
    float _525 = _511 * _437;
    bool _527 = !_409;
    int _529 = _527 ? 0 : 1;
    float _531 = _331 + _329;
    bool _533 = !_405;
    int _535 = _533 ? 0 : 1;
    float _537 = 1.0 / _343;
    int _539 = ~as_type<int>(_501);
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    float _545 = _531 + (-1.0);
    bool _547 = !_413;
    int _549 = _547 ? 0 : 1;
    float _551 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _553 = _543;
    if (!_497)
    {
        int _555 = ~as_type<int>(_501);
        int _557 = _555 + 1;
        _553 = _557;
    }
    int _559 = _553;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _561;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _575 = _573 != 0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _581 = _523 != 2;
    float _583 = fma(_563, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = 0.0;
    if (!_505)
    {
        _585 = _329;
    }
    float _587 = _585;
    float _589 = fma(_579, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _593 = int(_591);
    float _595 = 0.0;
    float _597 = _587;
    if (!_505)
    {
        _595 = _587;
    }
    float _599 = _595;
    float _601 = _339 * _131;
    float _603 = _599;
    if (!_505)
    {
        _515 = _331;
    }
    float _605 = _515;
    float _607 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = 0.0;
    float _611 = _605;
    if (!_505)
    {
        _609 = _331;
    }
    float _613 = _609;
    float _615 = _537 * _131;
    float _617 = _613;
    if (_505)
    {
        _603 = _323;
    }
    float _619 = _603;
    float _621 = exp2(_601);
    if (_505)
    {
        _597 = _323;
    }
    float _623 = _597;
    if (_505)
    {
        _611 = _329;
    }
    float _625 = _611;
    if (_505)
    {
        _617 = _329;
    }
    float _627 = _617;
    bool _629 = _503 >= 0.0;
    bool _631 = isnan(_503);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    int _639 = _637 ? 0 : 1;
    bool _641 = _503 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _643;
    if (_581)
    {
        _517 = _323;
    }
    float _647 = _517;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = _647;
    if (!_581)
    {
        _653 = _331;
    }
    float _655 = _653;
    float _657 = fma(_645, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _659 = fma(_651, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _661 = _655 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _663 = !_571;
    int _665 = _663 ? 0 : 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _669 = !_567;
    int _671 = _669 ? 0 : 1;
    float _673 = -_347;
    float _675 = fma(_661, 2.0, _673);
    float _677 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    float _679 = float(_97);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _683 = _619 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _687 = abs(_665);
    float _689 = 1.0 / _679;
    float _691 = -_681;
    float _693 = fma(_683, 2.0, _691);
    float _695 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].w, _685);
    int _697 = abs(_671);
    float _699 = -_131;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[86].x, _675);
    int _703 = ~_639;
    int _705 = _703 + 1;
    int _707 = _705 + 1;
    float _709 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _677);
    float _711 = _683;
    int _713 = _707;
    if (_581)
    {
        _711 = _329;
    }
    float _715 = _711;
    float _717 = -_131;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[81].x, _693);
    float _721 = _715;
    if (!_641)
    {
        int _723 = ~_639;
        int _725 = _723 + 1;
        _713 = _725;
    }
    int _727 = _713;
    if (!_581)
    {
        _721 = _323;
    }
    float _729 = _721;
    float _731 = _625 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _733 = _729 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _735 = float(_493);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _739 = float(_727);
    float _741 = fma(_733, -2.0, _351);
    float _743 = float(_697);
    float _745 = fma(_731, -2.0, _737);
    float _747 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _741);
    float _749 = float(_593);
    float _751 = _743 * _739;
    float _753 = float(_687);
    float _755 = in.m_56.x;
    float _757 = in.m_56.y;
    float _759 = in.m_56.z;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _763 = 1.0 + _761;
    float _765 = 1.0 / _749;
    float _767 = _753 * _735;
    float _769 = _751 * (-2.0);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(1.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _785 = 1.0 / _763;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _791 = _689 * _131;
    float _793 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _771);
    float _795 = -_621;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _783);
    float _811 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[88].z, _787);
    float _813 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].w, _789);
    float _815 = _807 ? _797 : 0.0;
    float _817 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _819 = -_131;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[76].x, _465);
    float _823 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _811);
    float _825 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _415);
    bool _827 = !_575;
    int _829 = _827 ? 0 : 1;
    float _831 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _695);
    float _833 = _765 * _131;
    float _835 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _793);
    float _837 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _813);
    float _839 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _745);
    if (_781)
    {
        float _841 = _815 * _785;
        _133 = _841;
    }
    float _843 = _133;
    int _845 = abs(_829);
    float _847 = fma(_495, _769, _495);
    float _849 = fma(_769, _755, _755);
    bool _851 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _853 = isnan(_321);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _323 + (-0.5);
    bool _865 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _867 = isnan(_321);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = float(_559);
    float _879 = -_861;
    float _881 = _879 + 1.0;
    float _883 = float(_845);
    float _885 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _849);
    bool _887 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_321);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -_875;
    float _901 = _899 + 1.0;
    float _903 = _875 * _881;
    float _905 = _883 * _877;
    bool _907 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _909 = isnan(_321);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _897 * _901;
    float _921 = _767 * (-2.0);
    float _923 = -_897;
    float _925 = _923 + 1.0;
    float _927 = _329 + (-0.5);
    float _929 = fma(_921, _757, _757);
    float _931 = _917 * _925;
    float _933 = _905 * (-2.0);
    float _935 = fma(_607, _921, _607);
    float _937 = _583 * _931;
    float _939 = _657 * _931;
    float _941 = fma(_551, _933, _551);
    float _943 = fma(_933, _759, _759);
    float _945 = in.m_52.x;
    float _947 = in.m_52.y;
    float _949 = _331 + (-0.5);
    float _951 = -_917;
    float _953 = _951 + 1.0;
    float _955 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _957;
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].z, _943);
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[143].x, _937);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _965;
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[143].y, _939);
    float _971 = fma(_847, _843, _885);
    float _973 = fma(_935, _843, _955);
    float _975 = fma(_941, _843, _961);
    float _977 = fma(_959, _471, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _979 = fma(_589, _919, _963);
    float _981 = fma(_967, _471, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _983 = fma(_659, _919, _969);
    float _985 = _971 * 0.15915493667125701904296875;
    float _987 = _973 * 0.15915493667125701904296875;
    float _989 = _975 * 0.15915493667125701904296875;
    float _991 = fma(_977, _903, _979);
    float _993 = fma(_981, _903, _983);
    float _995 = _985 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1001 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[146].x, _991);
    float _1003 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[146].y, _993);
    float _1005 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = in.m_54.w;
    float _1009 = _1001 * _945;
    float _1011 = _1003 * _947;
    float _1013 = _987 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1023 = _1019 * _1017;
    float _1025 = _1021 * _999;
    float _1027 = _987 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = _985 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _997 * _1015;
    bool _1037 = _1007 > 0.5;
    float _1039 = _989 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = _997 * _1029;
    float _1045 = _989 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1033 * _1015;
    float _1051 = _1033 * _1029;
    float _1053 = _997 * _1041;
    float _1055 = _1033 * _1041;
    float _1057 = _1029 * _1041;
    float _1059 = _1015 * _1041;
    float _1061 = _1053 * _1025;
    float _1063 = _1055 * _1025;
    float _1065 = fma(_1047, _1043, _1049);
    float _1067 = -_1035;
    float _1069 = fma(_1047, _1051, _1067);
    float _1071 = fma(_1047, _1049, _1043);
    float _1073 = -_1051;
    float _1075 = fma(_1047, _1035, _1073);
    float _1077 = -_1025;
    float _1079 = _1047 * _1077;
    float _1081 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1083 = fma(_1065, _1023, _1061);
    float _1085 = fma(_1069, _1023, _1063);
    float _1087 = fma(_1057, _1023, _1079);
    float _1089 = fma(_1075, _1081, _1083);
    float _1091 = fma(_1071, _1081, _1085);
    float _1093 = fma(_1059, _1081, _1087);
    float _1095 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1097 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1099 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1101 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1097);
    float _1107 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1095);
    float _1109 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1103);
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1105);
    float _1115 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1107);
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1111);
    float _1121 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1123 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1099);
    float _1125 = _1115 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1129 = _1117 + _1121;
    float _1131 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1123);
    float _1133 = _1125 + _1127;
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1137 = _1129 + _1135;
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1143 = _1133 + _1141;
    float _1145 = _1137 * _1137;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = fma(_1143, _1143, _1145);
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1147);
    float _1155 = -_211;
    int _1157 = _1037 ? as_type<int>(_1155) : as_type<int>(_211);
    float _1159 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1161 = sqrt(_1151);
    float _1163 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1153);
    bool _1165 = !_367;
    float _1167 = _1165 ? _211 : as_type<float>(_1157);
    float _1169 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1159);
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1185 = _1183 != 0;
    float _1187 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1189 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1191 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1193 = 1.0 / _1187;
    float _1195 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1189);
    bool _1197 = !_1177;
    int _1199 = _1197 ? 0 : 1;
    float _1201 = _1191 + _1187;
    bool _1203 = !_1173;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1195);
    bool _1209 = !_1181;
    int _1211 = _1209 ? 0 : 1;
    bool _1213 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1217 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1225 = _1221 || _1223;
    bool _1227 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1229 = isnan(0.5);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1235 = _1231 || _1233;
    float _1237 = _1139 + _1215;
    bool _1239 = !_1185;
    int _1241 = _1239 ? 0 : 1;
    float _1243 = _1201 * _1193;
    float _1245 = _1243 * 0.5;
    float _1247 = _1207;
    float _1249 = _1215;
    float _1251 = _1129;
    float _1253 = _1187;
    float _1255 = _1193;
    float _1257 = _1151;
    float _1259 = _1137;
    float _1261 = _987;
    if (!_1213)
    {
        _1247 = _1133;
    }
    float _1263 = _1247;
    float _1265 = _1263;
    if (!_1213)
    {
        _1249 = _1237;
    }
    float _1267 = _1249;
    bool _1269 = !_1213;
    float _1271 = _1267;
    if (!_1269)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1277 = _1161 + _1275;
        float _1279 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1281 = rsqrt(_1151);
        float _1283 = _1277 * _1273;
        float _1285 = _1283 * 0.15915493667125701904296875;
        float _1287 = _1285 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1285 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = _1289 + (-1.0);
        float _1297 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1293, _1279, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1301 = fma(_1237, _1289, _1297);
        float _1303 = _1281 * _1299;
        float _1305 = fma(_1143, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1307 = fma(_1137, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1251 = _1307;
        _1253 = _1285;
        _1265 = _1305;
        _1271 = _1301;
        _1255 = _1297;
        _1257 = _1281;
    }
    float _1309 = _1251;
    float _1311 = _1253;
    float _1313 = _1265;
    float _1315 = _1271;
    float _1317 = _1255;
    float _1319 = _1257;
    float _1321 = _1317;
    float _1323 = _1315;
    float _1325 = _1313;
    float _1327 = _1319;
    float _1329 = _1311;
    if (_1235)
    {
        _1259 = 1.0;
    }
    float _1331 = _1259;
    float _1333 = _1331;
    if (_1225)
    {
        _1321 = _1309;
    }
    float _1335 = _1321;
    float _1337 = _1335;
    if (!_1225)
    {
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1341 = _1139 + _1339;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1345 = _1125 + _1343;
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = -_1125;
        float _1351 = _1349 + _1313;
        float _1353 = _1341 * _1341;
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1357 = _1117 + _1355;
        float _1359 = -_1139;
        float _1361 = _1359 + _1315;
        float _1363 = -_1117;
        float _1365 = _1363 + _1309;
        float _1367 = fma(_1345, _1345, _1353);
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1371 = fma(_1357, _1357, _1367);
        float _1373 = sqrt(_1371);
        float _1375 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1377 = precise::min(_1373, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1379 = _1377 * _1369;
        float _1381 = _1375 * _1379;
        float _1383 = fma(_1351, _1381, _1125);
        float _1385 = fma(_1361, _1381, _1139);
        float _1387 = fma(_1365, _1381, _1117);
        _1323 = _1385;
        _1325 = _1383;
        _1337 = _1387;
        _1327 = _1379;
        _1329 = _1347;
    }
    float _1389 = _1323;
    float _1391 = _1325;
    float _1393 = _1337;
    float _1395 = _1327;
    float _1397 = _1329;
    float _1399 = _1395;
    float _1401 = _1397;
    if (!_1235)
    {
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1411 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1409);
        float _1413 = _1405 * 6.283185482025146484375;
        float _1415 = cos(_1413);
        float _1417 = _1407 * 0.15915493667125701904296875;
        float _1419 = _1405 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = 1.0 / _1415;
        float _1425 = _1417 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1421 * _1423;
        float _1431 = _1417 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1435;
        float _1439 = _1427 * _1429;
        float _1441 = 1.0 / _1411;
        float _1443 = 1.0 / _1439;
        float _1445 = 1.0 / _1437;
        float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1449 = _1441 * _1447;
        float _1451 = _1433 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = fma(_1451, _1449, _1453);
        float _1457 = _1455 * _1445;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + 1.0;
        _1399 = _1429;
        _1333 = _1463;
    }
    float _1465 = _1399;
    float _1467 = _1333;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1389 + _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1475 = _1391 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1393 + _1477;
    float _1481 = _1471 * _1471;
    float _1483 = fma(_1475, _1475, _1481);
    float _1485 = fma(_1479, _1479, _1483);
    float _1487 = rsqrt(_1485);
    float _1489 = sqrt(_1485);
    float _1491 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1493 = _1475 * _1491;
    float _1495 = _1479 * _1491;
    float _1497 = _1493 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 + _1499;
    float _1503 = sqrt(_1501);
    bool _1505 = _1503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = _1503 + _1507;
    float _1511 = _1487;
    float _1513 = _1501;
    float _1515 = _1509;
    float _1517 = _1465;
    float _1519 = _1471;
    if (_1505)
    {
        float _1521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1521;
    }
    float _1523 = _1511;
    if (_1505)
    {
        float _1525 = rsqrt(_1501);
        _1513 = _1525;
    }
    float _1527 = _1513;
    if (_1505)
    {
        float _1529 = _1509 * _1523;
        _1515 = _1529;
    }
    float _1531 = _1515;
    if (_1505)
    {
        float _1533 = _1531 * 0.15915493667125701904296875;
        _1517 = _1533;
    }
    float _1535 = _1517;
    float _1537 = _1479;
    float _1539 = _1535;
    if (_1505)
    {
        float _1541 = _1535 * 6.283185482025146484375;
        float _1543 = sin(_1541);
        _1537 = _1543;
    }
    float _1545 = _1537;
    float _1547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1549 = precise::max(0.0, _1547);
    float _1551 = _1523;
    float _1553 = _1549;
    if (_1505)
    {
        float _1555 = _1535 * 6.283185482025146484375;
        float _1557 = cos(_1555);
        _1551 = _1557;
    }
    float _1559 = _1551;
    float _1561 = -_1491;
    float _1563 = -_1549;
    float _1565 = fma(_1471, _1561, _1563);
    if (_1505)
    {
        float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1567;
    }
    float _1569 = _1519;
    float _1571 = _1569;
    if (!_1505)
    {
        _1539 = _1497;
    }
    float _1573 = _1539;
    float _1575 = _1545;
    float _1577 = _1573;
    if (_1505)
    {
        float _1579 = fma(_1545, _1569, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1575 = _1579;
    }
    float _1581 = _1575;
    float _1583 = _1581;
    if (!_1505)
    {
        _1571 = _1565;
    }
    float _1585 = _1571;
    float _1587 = _1585;
    float _1589 = _1559;
    if (_1505)
    {
        float _1591 = _1559 + (-1.0);
        _1553 = _1591;
    }
    float _1593 = _1553;
    float _1595 = _1593;
    if (_1505)
    {
        float _1597 = _1527 * _1581;
        _1261 = _1597;
    }
    float _1599 = _1261;
    if (!_1505)
    {
        _1583 = _1493;
    }
    float _1601 = _1583;
    float _1603 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1601;
    if (_1505)
    {
        float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1607;
    }
    float _1609 = _1401;
    if (_1505)
    {
        float _1611 = _1493 * _1599;
        _1605 = _1611;
    }
    float _1613 = _1605;
    if (!_1505)
    {
        _1595 = _1495;
    }
    float _1615 = _1595;
    float _1617 = _1615;
    if (_1505)
    {
        float _1619 = _1495 * _1599;
        _1617 = _1619;
    }
    float _1621 = _1617;
    if (_1505)
    {
        float _1623 = fma(_1565, _1559, _1609);
        _1587 = _1623;
    }
    float _1625 = _1587;
    if (_1505)
    {
        float _1627 = _1613 * _1613;
        _1577 = _1627;
    }
    float _1629 = _1577;
    if (!_1505)
    {
        _1589 = _1499;
    }
    float _1631 = _1589;
    float _1633 = _1631;
    if (_1505)
    {
        float _1635 = _1621 * _1621;
        _1633 = _1635;
    }
    float _1637 = _1633;
    float _1639 = fma(_1625, _1625, _1629);
    float _1641 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1643 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = _1639 + _1637;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1649 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1647);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1655 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1657 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1659 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1661 = rsqrt(_1645);
    float _1663 = -_1651;
    float _1665 = _1663 + 1.0;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1657);
    float _1671 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1659);
    float _1673 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1677 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1669);
    float _1679 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1681 = abs(_1665);
    float _1683 = log2(_1681);
    float _1685 = -_1675;
    float _1687 = fma(_1685, _1653, 1.0);
    float _1689 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1691 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1693 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1695 = _1661 * _1613;
    float _1697 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1691);
    float _1699 = _1661 * _1625;
    float _1701 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1693);
    float _1703 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1705 = _1661 * _1621;
    float _1707 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1697);
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1711 = -_1703;
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1711);
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1717 = log2(_1687);
    float _1719 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1707);
    float _1721 = -_1705;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1713);
    float _1725 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1727 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1729 = fma(_1723, -0.5, 0.5);
    float _1731 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1725);
    float _1733 = exp2(_1715);
    float _1735 = fma(_1723, 0.5, 0.5);
    float _1737 = _1699 + 1.0;
    float _1739 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1731);
    float _1741 = fma(_1735, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1743 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1739);
    float _1745 = 1.0 / _1719;
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1727);
    float _1749 = fma(_1735, _1741, -0.212114393711090087890625);
    float _1751 = _1717 * 0.693147182464599609375;
    float _1753 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1747);
    float _1755 = fma(_1735, _1749, 1.570728778839111328125);
    float _1757 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1759 = sqrt(_1729);
    float _1761 = -_1699;
    float _1763 = fma(_1733, _1737, _1761);
    float _1765 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1753);
    float _1767 = _1743 * _1745;
    float _1769 = _1765 * _1745;
    float _1771 = fma(_1767, 0.5, 0.5);
    float _1773 = fma(_1769, -0.5, 0.5);
    float _1775 = fma(_1763, 0.5, 0.5);
    float _1777 = _1759 * 0.636619746685028076171875;
    float _1779 = -_1755;
    float _1781 = fma(_1777, _1779, 1.0);
    float3 _6160 = float3(_1771, _1773, _1757);
    float _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6160, float3(0.0), isnan(_6160)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6160, float3(0.0), isnan(_6160)), level(0.0)).x;
    float3 _6171 = float3(_1771, _1773, _1757);
    float4 _1786 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _1788 = _1786.x;
    float _1790 = _1786.y;
    float _1792 = _1786.z;
    float _1794 = _1786.w;
    float2 _6188 = float2(_1781, _1775);
    float3 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1808 = int(_1806);
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1812 = _1810 != 0;
    float _1814 = -_823;
    float _1816 = _1814 + 1.0;
    int _1818 = abs(_1199);
    float _1820 = -_837;
    float _1822 = _1820 + 1.0;
    bool _1824 = _329 > 0.5;
    out.m_58.x = _1391;
    out.m_58.y = _1389;
    out.m_58.z = _1393;
    bool _1826 = _331 > 0.5;
    float _1828 = trunc(_615);
    int _1830 = int(_1828);
    float _1832 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1834 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1836 = -_201;
    int _1838 = _1826 ? as_type<int>(_1836) : as_type<int>(_201);
    float _1840 = -_835;
    float _1842 = _1840 + 1.0;
    float _1844 = -_817;
    float _1846 = _1844 + 1.0;
    float _1848 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1834);
    float _1850 = float(uint(_1808));
    float _1852 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1854 = int(_1852);
    int _1856 = ~_1808;
    int _1858 = _1856 + 1;
    float _1860 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1848);
    bool _1862 = _1808 == 0;
    float _1864 = float(uint(_1830));
    float _1866 = 1.0 / _1850;
    float _1868 = float(_1830);
    float _1870 = float(uint(_1854));
    float _1872 = trunc(_833);
    int _1874 = int(_1872);
    int _1876 = ~_1854;
    int _1878 = _1876 + 1;
    int _1880 = as_type<int>(_1866) + (-2);
    float _1882 = 1.0 / _1870;
    float _1884 = as_type<float>(_1880) * _1864;
    int _1886 = ~_1808;
    int _1888 = _1886 + 1;
    float _1890 = float(uint(_1874));
    float _1892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1894 = as_type<int>(_1882) + (-2);
    float _1896 = trunc(_1884);
    float _1898 = precise::max(_1896, 0.0);
    uint _1901 = uint(_1898);
    float _1903 = as_type<float>(_1894) * _1890;
    int _1905 = ~_1854;
    int _1907 = _1905 + 1;
    float _1909 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1911 = exp2(_1832);
    int _1913 = _1888 * int(_1901);
    int _1915 = _1913 + _1830;
    float _1917 = trunc(_1903);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    float _1923 = as_type<float>(_1888);
    float _1925 = as_type<float>(_1915);
    if (_1812)
    {
        _1923 = 1.0;
    }
    float _1927 = _1923;
    float _1929 = _1927;
    if (!_1812)
    {
        _1929 = 7.345489978790283203125;
    }
    float _1931 = _1929;
    float _1933 = float(uint(_1915));
    float _1935 = _1933;
    if (_1812)
    {
        _1925 = _323;
    }
    float _1937 = _1925;
    float _1939 = _1931 * _323;
    float _1941 = _1937;
    if (!_1812)
    {
        _1941 = _329;
    }
    float _1943 = _1941;
    float _1945 = as_type<float>(_1880) * _1933;
    if (_1812)
    {
        _1935 = 1.0;
    }
    float _1947 = _1935;
    float _1949 = floor(_1939);
    float _1951 = _1947;
    if (!_1812)
    {
        _1951 = 1.2345600128173828125;
    }
    float _1953 = _1951;
    float _1955 = -_1911;
    float _1957 = _1955 + 1.0;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1961 = _1959 != 0;
    int _1963 = _1907 * int(_1921);
    int _1965 = _1963 + _1874;
    float _1967 = _1953 * _1943;
    float _1969 = trunc(_1945);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    float _1975 = float(uint(_1965));
    float _1977 = as_type<float>(_1894) * _1975;
    float _1979 = floor(_1967);
    float _1981 = -_1949;
    float _1983 = _1939 + _1981;
    int _1985 = int(_1901) + int(_1973);
    float _1987 = trunc(_1977);
    float _1989 = precise::max(_1987, 0.0);
    uint _1991 = uint(_1989);
    float _1993 = float(_1808);
    int _1995 = _1858 * _1985;
    int _1997 = _1995 + _1830;
    bool _1999 = _1868 >= _1993;
    bool _2001 = isnan(_1868);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan(_1993);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = -_1979;
    float _2013 = _1967 + _2011;
    float _2015 = float(_1874);
    float _2017 = trunc(_2009);
    int _2019 = int(_2017);
    bool _2021 = uint(_1997) >= uint(_1808);
    float _2023 = _1983 * _1993;
    float _2025 = _1993 * _791;
    bool _2027 = !_2021;
    int _2029 = _2027 ? 0 : (-1);
    int _2031 = int(_1921) + int(_1991);
    float _2033 = trunc(_2023);
    int _2035 = int(_2033);
    int _2037 = ~_1985;
    int _2039 = _2037 + _2029;
    int _2041 = _2039 + 1;
    float _2043 = float(_1854);
    int _2045 = _1878 * _2031;
    int _2047 = _2045 + _1874;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2051 = _2049 != 0;
    int _2053 = _1808 * _2041;
    int _2055 = _2053 + _1830;
    bool _2057 = _2015 >= _2043;
    bool _2059 = isnan(_2015);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(_2043);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = _2043 * _791;
    int _2071 = ~_2019;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    bool _2077 = !_1862;
    int _2079 = _2077 ? _2055 : (-1);
    int _2081 = _1808 + (-1);
    float _2083 = trunc(_2067);
    int _2085 = int(_2083);
    bool _2087 = !_2051;
    int _2089 = _2087 ? 0 : 1;
    int _2091 = _2079 * _2075;
    bool _2093 = uint(_2047) >= uint(_1854);
    int _2095 = abs(_529);
    int _2097 = _2019 * _2081;
    int _2099 = _2097 + _2091;
    bool _2101 = !_2093;
    int _2103 = _2101 ? 0 : (-1);
    float _2105 = trunc(_2025);
    int _2107 = int(_2105);
    bool _2109 = _1854 == 0;
    float _2111 = _2013 * _2043;
    int _2113 = ~_2031;
    int _2115 = _2113 + _2103;
    int _2117 = _2115 + 1;
    int _2119 = _2099 * _2095;
    int _2121 = abs(_2089);
    int _2123 = abs(_549);
    int _2125 = _1854 * _2117;
    int _2127 = _2125 + _1874;
    int _2129 = abs(_535);
    int _2131 = _2035 * _2121;
    int _2133 = _2131 + _1830;
    int _2135 = ~_2085;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = trunc(_2111);
    int _2143 = int(_2141);
    bool _2145 = !_2109;
    int _2147 = _2145 ? _2127 : (-1);
    bool _2149 = !_1961;
    int _2151 = _2149 ? 0 : 1;
    int _2153 = _2107 * _2129;
    int _2155 = _2153 + _2119;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2159 = _2157 != 0;
    int _2161 = _2147 * _2139;
    int _2163 = abs(_2151);
    int _2165 = _2133 * _2123;
    int _2167 = _2165 + _2155;
    float _2169 = trunc(_2069);
    int _2171 = int(_2169);
    bool _2173 = !_2159;
    int _2175 = _2173 ? 0 : 1;
    int _2177 = _2035 * _2163;
    int _2179 = _2177 + _2167;
    int _2181 = _1854 + (-1);
    int _2183 = abs(_1205);
    int _2185 = abs(_2175);
    int _2187 = _2085 * _2181;
    int _2189 = _2187 + _2161;
    float _2191 = float(uint(_2179));
    float _2193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2195 = as_type<float>(_1880) * _2191;
    int _2197 = _2189 * _1818;
    int _2199 = abs(_1211);
    int _2201 = _2143 * _2185;
    int _2203 = _2201 + _1874;
    int _2205 = abs(_1241);
    int _2207 = _2171 * _2183;
    int _2209 = _2207 + _2197;
    float _2211 = trunc(_2195);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    int _2217 = ~_1808;
    int _2219 = _2217 + 1;
    int _2221 = _2203 * _2199;
    int _2223 = _2221 + _2209;
    float _2225 = float(uint(_2133));
    int _2227 = ~_1808;
    int _2229 = _2227 + 1;
    int _2231 = _2143 * _2205;
    int _2233 = _2231 + _2223;
    float _2235 = as_type<float>(_1880) * _2225;
    int _2237 = ~_1854;
    int _2239 = _2237 + 1;
    float _2241 = float(uint(_2233));
    float _2243 = trunc(_2235);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    int _2249 = _2219 * int(_2215);
    int _2251 = _2249 + _2179;
    float _2253 = as_type<float>(_1894) * _2241;
    float _2255 = float(uint(_2203));
    float _2257 = float(uint(_2251));
    float _2259 = trunc(_2253);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    float _2265 = as_type<float>(_1894) * _2255;
    float _2267 = as_type<float>(_1880) * _2257;
    int _2269 = _2229 * int(_2247);
    int _2271 = _2269 + _2133;
    float _2273 = trunc(_2267);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    float _2279 = float(uint(_2271));
    int _2281 = _2239 * int(_2263);
    int _2283 = _2281 + _2233;
    float _2285 = trunc(_2265);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    float _2291 = as_type<float>(_1880) * _2279;
    int _2293 = ~_1808;
    int _2295 = _2293 + 1;
    float _2297 = float(uint(_2283));
    float _2299 = trunc(_2291);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = int(_2215) + int(_2277);
    float _2307 = as_type<float>(_1894) * _2297;
    int _2309 = _2239 * int(_2289);
    int _2311 = _2309 + _2203;
    float _2313 = trunc(_2307);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    int _2319 = _2295 * _2305;
    int _2321 = _2319 + _2179;
    int _2323 = ~_1808;
    int _2325 = _2323 + 1;
    float _2327 = float(uint(_2311));
    bool _2329 = uint(_2321) >= uint(_1808);
    float _2331 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2333 = as_type<float>(_1894) * _2327;
    int _2335 = int(_2247) + int(_2303);
    bool _2337 = !_2329;
    int _2339 = _2337 ? 0 : (-1);
    float _2341 = _2331 * _323;
    float _2343 = trunc(_2333);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    int _2349 = ~_2305;
    int _2351 = _2349 + _2339;
    int _2353 = _2351 + 1;
    int _2355 = int(_2263) + int(_2317);
    int _2357 = _2325 * _2335;
    int _2359 = _2357 + _2133;
    int _2361 = ~_1854;
    int _2363 = _2361 + 1;
    int _2365 = _1808 * _2353;
    int _2367 = _2365 + _2179;
    float _2369 = -_211;
    float _2371 = _2369 + 0.5;
    float _2373 = trunc(_2341);
    int _2375 = int(_2373);
    bool _2377 = uint(_2359) >= uint(_1808);
    int _2379 = _2363 * _2355;
    int _2381 = _2379 + _2233;
    bool _2383 = !_1862;
    int _2385 = _2383 ? _2367 : (-1);
    float _2387 = _201 + 0.5;
    bool _2389 = !_2377;
    int _2391 = _2389 ? 0 : (-1);
    int _2393 = _2385 & 3;
    bool _2395 = _2393 != 0;
    int _2397 = _2385 & 3;
    bool _2399 = _2397 != 0;
    out.m_60.x = _2387;
    out.m_60.y = _2371;
    bool _2401 = uint(_2381) >= uint(_1854);
    int _2403 = ~_2335;
    int _2405 = _2403 + _2391;
    int _2407 = _2405 + 1;
    int _2409 = _2395 ? 0 : 1;
    int _2411 = _2375 << 4;
    int _2413 = _2411 + 1712;
    int _2415 = _1808 * _2407;
    int _2417 = _2415 + _2133;
    bool _2419 = uint(_2397) > 1u;
    int _2421 = int(_2289) + int(_2347);
    uint _2423 = uint(int(uint(_2413) >> uint(2)));
    uint _2425 = uint(int(uint(int(_2423)) >> uint(2)));
    int _2427 = int(_2423) & 3;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[int(_2425)][_2427];
    int _2431 = int(_2423) + 1;
    uint _2433 = uint(int(uint(_2431) >> uint(2)));
    int _2435 = _2431 & 3;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[int(_2433)][_2435];
    bool _2439 = !_2401;
    int _2441 = _2439 ? 0 : (-1);
    bool _2443 = uint(_2397) >= 2u;
    int _2445 = ~_2355;
    int _2447 = _2445 + _2441;
    int _2449 = _2447 + 1;
    int _2451 = _2385 >> 31;
    int _2453 = _2413 + 8;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = _2443 ? 0 : 1;
    int _2465 = _1854 * _2449;
    int _2467 = _2465 + _2233;
    bool _2469 = _2397 != 3;
    int _2471 = _2451 & 3;
    int _2473 = ~_2409;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (!_2419)
    {
        int _2481 = ~_2409;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    bool _2487 = _2397 != 3;
    int _2489 = _2385 + _2471;
    int _2491 = ~_1854;
    int _2493 = _2491 + 1;
    int _2495 = _2489 >> 2;
    int _2497 = ~_2463;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    int _2503 = _2501;
    if (_2469)
    {
        int _2505 = ~_2463;
        int _2507 = _2505 + 1;
        _2503 = _2507;
    }
    int _2509 = _2503;
    int _2511 = _2495 << 4;
    int _2513 = _2511 + 368;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2517 = _2515 != 0;
    bool _2519 = !_2109;
    int _2521 = _2519 ? _2467 : (-1);
    uint _2523 = uint(int(uint(_2513) >> uint(2)));
    uint _2525 = uint(int(uint(int(_2523)) >> uint(2)));
    int _2527 = int(_2523) & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    int _2531 = int(_2523) + 1;
    uint _2533 = uint(int(uint(_2531) >> uint(2)));
    int _2535 = _2531 & 3;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[int(_2533)][_2535];
    bool _2539 = !_2517;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = _2521 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = !_1862;
    int _2549 = _2547 ? _2417 : (-1);
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2553 = _2551 != 0;
    bool _2555 = !_2399;
    int _2557 = _2555 ? 0 : 1;
    float _2559 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2561 = uint(_2543) > 1u;
    float _2563 = _2437 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2565 = !_2553;
    int _2567 = _2565 ? 0 : 1;
    float _2569 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2571 = _2521 & 3;
    bool _2573 = _2571 != 0;
    float _2575 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2577 = !_2487;
    int _2579 = _2577 ? 0 : (-1);
    bool _2581 = _2543 != 3;
    int _2583 = _2573 ? 0 : 1;
    bool _2585 = uint(_2543) >= 2u;
    int _2587 = ~_2583;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = _2591;
    if (!_2561)
    {
        int _2595 = ~_2583;
        int _2597 = _2595 + 1;
        _2593 = _2597;
    }
    int _2599 = _2593;
    int _2601 = _2585 ? 0 : 1;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2605 = _2603 != 0;
    float _2607 = _2461 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2609 = !_2545;
    int _2611 = _2609 ? 0 : 1;
    int _2613 = _2513 + 8;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = _2521 >> 31;
    float _2633 = _2607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2635 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2637 = _2635 != 0;
    bool _2639 = _2543 != 3;
    int _2641 = _2493 * _2421;
    int _2643 = _2641 + _2203;
    int _2645 = ~_2601;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2649;
    if (_2581)
    {
        int _2653 = ~_2601;
        int _2655 = _2653 + 1;
        _2651 = _2655;
    }
    int _2657 = _2651;
    float _2659 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2661 = _2631 & 3;
    bool _2663 = !_2639;
    int _2665 = _2663 ? 0 : (-1);
    float _2667 = _2659 * _323;
    bool _2669 = uint(_2643) >= uint(_1854);
    int _2671 = _2521 + _2661;
    float _2673 = trunc(_2667);
    int _2675 = int(_2673);
    bool _2677 = _323 > 0.5;
    float _2679 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2681 = _393 + 0.5;
    int _2683 = _2671 >> 2;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2687 = abs(_2485);
    float _2689 = fma(_2679, _2681, _701);
    int _2691 = _2683 << 4;
    int _2693 = _2691 + 512;
    float _2695 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2697 = !_2669;
    int _2699 = _2697 ? 0 : (-1);
    out.m_62.x = _2569;
    out.m_62.y = _2575;
    out.m_62.z = _2633;
    out.m_62.w = _2685;
    int _2701 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2703 = _2701 != 0;
    float _2705 = _399 + (-0.5);
    int _2707 = ~_2687;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = -_1816;
    float _2715 = fma(_393, _2713, _2689);
    int _2717 = abs(_2557);
    float _2719 = -_1909;
    float _2721 = -_747;
    float _2723 = fma(_2719, _2705, _2721);
    int _2725 = ~_2421;
    int _2727 = _2725 + _2699;
    int _2729 = _2727 + 1;
    int _2731 = ~_2717;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = abs(_2579);
    int _2739 = _1854 * _2729;
    int _2741 = _2739 + _2203;
    int _2743 = abs(_2541);
    uint _2745 = uint(int(uint(_2693) >> uint(2)));
    uint _2747 = uint(int(uint(int(_2745)) >> uint(2)));
    int _2749 = int(_2745) & 3;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[int(_2747)][_2749];
    int _2753 = int(_2745) + 1;
    uint _2755 = uint(int(uint(_2753) >> uint(2)));
    int _2757 = _2753 & 3;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[int(_2755)][_2757];
    float _2761 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2763 = _2711 * as_type<int>(_2537);
    float _2765 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2767 = -_1047;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2695);
    float _2771 = -_1047;
    float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2761);
    float _2775 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2777 = _2735 * as_type<int>(_2529);
    int _2779 = _2777 + _2763;
    float _2781 = -_1047;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2765);
    int _2785 = abs(_2509);
    float _2787 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2775);
    float _2789 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2791 = int(_2789);
    int _2793 = _2693 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    float _2811 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2813 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2815 = ~_2785;
    int _2817 = _2815 + 1;
    int _2819 = _2817 + 1;
    float _2821 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2811);
    float _2823 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2813);
    int _2825 = _2819 * as_type<int>(_2621);
    int _2827 = _2825 + _2779;
    float _2829 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2773);
    int _2831 = ~_2743;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    float _2837 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2839 = ~_2737;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2783);
    float _2847 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2769);
    float _2849 = float(uint(_2791));
    float _2851 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2853 = _2843 * as_type<int>(_2629);
    int _2855 = _2853 + _2827;
    int _2857 = abs(_2599);
    float _2859 = 1.0 / _2849;
    float _2861 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2863 = _2855 * _2835;
    int _2865 = ~_2857;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    float _2871 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2851);
    float _2873 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    int _2875 = _2549 * _2743;
    int _2877 = _2875 + _2863;
    int _2879 = abs(_2611);
    float _2881 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2837);
    int _2883 = abs(_2665);
    float _2885 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2887 = int(_2885);
    float _2889 = float(uint(_2877));
    int _2891 = ~_2879;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    int _2897 = abs(_2791);
    int _2899 = _2869 * as_type<int>(_2759);
    int _2901 = as_type<int>(_2859) + (-2);
    int _2903 = abs(_2657);
    int _2905 = _2895 * as_type<int>(_2751);
    int _2907 = _2905 + _2899;
    int _2909 = abs(_2567);
    float _2911 = as_type<float>(_2901) * _2889;
    float _2913 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2881);
    int _2915 = ~_2903;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    float _2921 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2873);
    int _2923 = ~_2883;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = trunc(_2911);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = float(uint(_2887));
    int _2937 = _2919 * as_type<int>(_2801);
    int _2939 = _2937 + _2907;
    int _2941 = ~_2909;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    int _2947 = abs(_2887);
    int _2949 = _2927 * as_type<int>(_2809);
    int _2951 = _2949 + _2939;
    int _2953 = ~_2791;
    int _2955 = _2953 + 1;
    float _2957 = 1.0 / _2935;
    float _2959 = float(uint(_2897));
    int _2961 = _2951 * _2945;
    float _2963 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2871);
    bool _2965 = !_2109;
    int _2967 = _2965 ? _2741 : (-1);
    float _2969 = 1.0 / _2959;
    float _2971 = float(uint(_2947));
    int _2973 = _2955 * int(_2933);
    int _2975 = _2973 + _2877;
    int _2977 = _2675 << 4;
    int _2979 = _2977 + 1968;
    int _2981 = _2967 * _2909;
    int _2983 = _2981 + _2961;
    int _2985 = abs(_2877);
    float _2987 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    float _2989 = float(uint(_2975));
    float _2991 = 1.0 / _2971;
    int _2993 = abs(_2983);
    float _2995 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    int _2997 = as_type<int>(_2957) + (-2);
    float _2999 = as_type<float>(_2901) * _2989;
    float _3001 = float(uint(_2983));
    float _3003 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2821);
    uint _3005 = uint(int(uint(_2979) >> uint(2)));
    uint _3007 = uint(int(uint(int(_3005)) >> uint(2)));
    int _3009 = int(_3005) & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = int(_3005) + 1;
    uint _3015 = uint(int(uint(_3013) >> uint(2)));
    int _3017 = _3013 & 3;
    float _3019 = (*spvDescriptorSet0.vp_c9)._m0[int(_3015)][_3017];
    int _3021 = as_type<int>(_2969) + (-2);
    float _3023 = as_type<float>(_2997) * _3001;
    float _3025 = float(uint(_2985));
    float _3027 = trunc(_2999);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    float _3033 = float(uint(_2993));
    out.m_64.x = _2987;
    out.m_64.y = _3003;
    out.m_64.z = _2995;
    bool _3035 = !_2605;
    float _3037 = _3035 ? _201 : as_type<float>(_1838);
    int _3039 = _2979 + 8;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    uint _3043 = uint(int(uint(int(_3041)) >> uint(2)));
    int _3045 = int(_3041) & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    int _3049 = as_type<int>(_2991) + (-2);
    float _3051 = as_type<float>(_3021) * _3025;
    int _3053 = ~_2887;
    int _3055 = _3053 + 1;
    float _3057 = trunc(_3023);
    float _3059 = precise::max(_3057, 0.0);
    uint _3061 = uint(_3059);
    int _3063 = ~_2897;
    int _3065 = _3063 + 1;
    float _3067 = as_type<float>(_3049) * _3033;
    float _3069 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3071 = ~_2947;
    int _3073 = _3071 + 1;
    float _3075 = -_211;
    int _3077 = _1824 ? as_type<int>(_3075) : as_type<int>(_211);
    float _3079 = fma(_3069, _3069, 1.0);
    float _3081 = trunc(_3051);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    float _3087 = -_201;
    int _3089 = _2677 ? as_type<int>(_3087) : as_type<int>(_201);
    float _3091 = _3069 * _2845;
    bool _3093 = !_2637;
    float _3095 = _3093 ? _211 : as_type<float>(_3077);
    float _3097 = _3069 * _2829;
    float _3099 = _3069 * _2847;
    bool _3101 = !_2703;
    float _3103 = _3101 ? _201 : as_type<float>(_3089);
    float _3105 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3107 = trunc(_3067);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    int _3113 = _3055 * int(_3061);
    int _3115 = _3113 + _2983;
    int _3117 = int(_2933) + int(_3031);
    float _3119 = fma(_3105, _2987, _3097);
    float _3121 = fma(_3105, _3003, _3091);
    int _3123 = ~_2897;
    int _3125 = _3123 + 1;
    float _3127 = fma(_3105, _2995, _3099);
    float _3129 = float(uint(_3115));
    float _3131 = rsqrt(_3079);
    int _3133 = _3065 * int(_3085);
    int _3135 = _3133 + _2985;
    float _3137 = _2913 + _3121;
    float _3139 = as_type<float>(_2997) * _3129;
    float _3141 = _2921 + _3127;
    float _3143 = float(uint(_3135));
    int _3145 = _3073 * int(_3111);
    int _3147 = _3145 + _2993;
    float _3149 = as_type<float>(_3021) * _3143;
    float _3151 = fma(_399, _1822, _2723);
    float _3153 = float(uint(_3147));
    float _3155 = _3011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3157 = _3069 * _3131;
    float _3159 = trunc(_3149);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    float _3165 = as_type<float>(_3049) * _3153;
    float _3167 = _3019 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3169 = -_2963;
    float _3171 = _3157 * _3169;
    float _3173 = -_2921;
    float _3175 = _3157 * _3173;
    float _3177 = _2963 + _3119;
    float _3179 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3181 = fma(_3131, _2829, _3171);
    float _3183 = trunc(_3165);
    float _3185 = precise::max(_3183, 0.0);
    uint _3187 = uint(_3185);
    float _3189 = _3047 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3191 = -_2913;
    float _3193 = _3157 * _3191;
    float _3195 = fma(_3131, _2847, _3175);
    float _3197 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3199 = _3167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3201 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3203 = ~_2791;
    int _3205 = _3203 + 1;
    float _3207 = trunc(_3139);
    float _3209 = precise::max(_3207, 0.0);
    uint _3211 = uint(_3209);
    int _3213 = int(_3085) + int(_3163);
    float _3215 = fma(_3131, _2845, _3193);
    out.m_66.x = _3197;
    out.m_66.y = _3199;
    out.m_66.z = _3201;
    out.m_66.w = _3179;
    int _3217 = ~_2887;
    int _3219 = _3217 + 1;
    int _3221 = _3125 * _3213;
    int _3223 = _3221 + _2985;
    int _3225 = _2877 ^ _2791;
    int _3227 = _3205 * _3117;
    int _3229 = _3227 + _2877;
    int _3231 = int(_3111) + int(_3187);
    out.m_68.x = _2715;
    out.m_68.y = _3151;
    bool _3233 = uint(_3229) >= uint(_2791);
    out.m_70.x = _3177;
    out.m_70.y = _3137;
    out.m_70.z = _3141;
    bool _3235 = uint(_3223) >= uint(_2897);
    int _3237 = int(_3061) + int(_3211);
    float _3239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3241 = ~_2947;
    int _3243 = _3241 + 1;
    out.m_72.x = _3181;
    out.m_72.y = _3215;
    out.m_72.z = _3195;
    bool _3245 = !_3233;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3219 * _3237;
    int _3251 = _3249 + _2983;
    int _3253 = ~_3117;
    int _3255 = _3253 + _3247;
    int _3257 = _3255 + 1;
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3261 = uint(_3251) >= uint(_2887);
    int _3263 = _3243 * _3231;
    int _3265 = _3263 + _2993;
    bool _3267 = !_3235;
    int _3269 = _3267 ? 0 : (-1);
    int _3271 = _2791 * _3257;
    int _3273 = _3271 + _2877;
    bool _3275 = _2791 == 0;
    bool _3277 = uint(_3265) >= uint(_2947);
    float _3279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3281 = ~_3269;
    int _3283 = _3213 + _3281;
    int _3285 = _3283 + 1;
    bool _3287 = !_3277;
    int _3289 = _3287 ? 0 : (-1);
    uint _3291 = uint(int(uint(_3225) >> uint(31)));
    float _3293 = _3239 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3295 = ~_3289;
    int _3297 = _3231 + _3295;
    int _3299 = _3297 + 1;
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3303 = _2983 ^ _2887;
    float _3305 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3307 = ~int(_3291);
    int _3309 = _3307 + 1;
    float _3311 = _1167 + (-0.5);
    uint _3313 = uint(int(uint(_3303) >> uint(31)));
    bool _3315 = !_3261;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = _3279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3321 = !_3275;
    int _3323 = _3321 ? _3273 : (-1);
    int _3325 = ~int(_3313);
    int _3327 = _3325 + 1;
    int _3329 = _3285 ^ _3309;
    int _3331 = ~_3237;
    int _3333 = _3331 + _3317;
    int _3335 = _3333 + 1;
    float _3337 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3339 = float(_3323);
    bool _3341 = _2791 == 0;
    int _3343 = _2887 * _3335;
    int _3345 = _3343 + _2983;
    int _3347 = _3299 ^ _3327;
    float _3349 = fma(_3293, _3339, _821);
    int _3351 = ~_3309;
    int _3353 = _3351 + _3329;
    int _3355 = _3353 + 1;
    bool _3357 = _2887 == 0;
    bool _3359 = _2887 == 0;
    int _3361 = ~_3327;
    int _3363 = _3361 + _3347;
    int _3365 = _3363 + 1;
    bool _3367 = !_3341;
    int _3369 = _3367 ? _3355 : (-1);
    bool _3371 = !_3357;
    int _3373 = _3371 ? _3345 : (-1);
    bool _3375 = !_3359;
    int _3377 = _3375 ? _3365 : (-1);
    float _3379 = float(_3369);
    float _3381 = float(_3373);
    float _3383 = _3103 + 0.5;
    float _3385 = float(_3377);
    float _3387 = -_825;
    float _3389 = fma(_3319, _3379, _3387);
    float _3391 = _3095 + (-0.5);
    float _3393 = fma(_3293, _3383, _3349);
    float _3395 = fma(_3337, _3381, _719);
    float _3397 = -_839;
    float _3399 = fma(_3305, _3385, _3397);
    float _3401 = _3037 + 0.5;
    float _3403 = -_3319;
    float _3405 = fma(_3403, _3391, _3389);
    float _3407 = _1743 + _1719;
    float _3409 = -_3305;
    float _3411 = fma(_3409, _3311, _3399);
    float _3413 = fma(_3337, _3401, _3395);
    float _3415 = -_709;
    float _3417 = _3415 + 1.0;
    float _3419 = _1719 * 0.5;
    float _3421 = _3407 * 0.5;
    float _3423 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3425 = -_3417;
    float _3427 = fma(_3037, _3425, _3413);
    float _3429 = -_831;
    float _3431 = _3429 + 1.0;
    float _3433 = fma(_1765, -0.5, _3419);
    float _3435 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1860);
    float _3437 = _3423 * _1783;
    bool _3439 = _1467 > 0.0;
    bool _3441 = isnan(_1467);
    bool _3443 = _3439 || _3441;
    bool _3445 = isnan(0.0);
    bool _3447 = _3443 || _3445;
    float _3449 = -_1842;
    float _3451 = fma(_3103, _3449, _3393);
    float _3453 = fma(_1167, _3431, _3411);
    float _3455 = _3435 + _1719;
    float _3457 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3459 = _1794 * _3437;
    float _3461 = _1804 * _3437;
    float _3463 = -_3423;
    float _3465 = _3463 + 1.0;
    float _3467 = fma(_3095, _1846, _3405);
    out.gl_Position.x = _1743;
    out.gl_Position.y = _1765;
    out.gl_Position.z = _3435;
    out.gl_Position.w = _1719;
    float _3469 = _3455 * 0.5;
    float _3471 = _3457 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3473 = fma(_1800, _3459, _1788);
    float _3475 = fma(_1802, _3459, _1790);
    float _3477 = _1794 * _3465;
    float _3479 = fma(_1794, _3461, _1792);
    out.m_74.x = _3421;
    out.m_74.y = _3433;
    out.m_74.z = _3469;
    out.m_74.w = _1719;
    out.m_76.x = _3451;
    out.m_76.y = _3467;
    out.m_76.z = _3427;
    out.m_76.w = _3453;
    out.m_45.x = _3471;
    out.m_78.x = _3473;
    out.m_78.y = _3475;
    out.m_78.z = _3479;
    out.m_78.w = _3477;
    if (_3447)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3481;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _313 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3538 = as_type<float>(_113);
        out.gl_Position.z = _3538;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _107 = _135;
    }
    float _137 = _107;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3608 = as_type<float>(_151);
        out.gl_Position.z = _3608;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = in.m_52.w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = in.m_42.x;
    float _177 = in.m_42.y;
    float _179 = in.m_42.z;
    int _181 = as_type<int>(_153) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_153) & 2;
    bool _187 = _185 != 0;
    float _189 = _153;
    float _191 = _155;
    if (!_167)
    {
        float _193 = _155 * _155;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_183;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = _197;
    if (!_167)
    {
        float _205 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_187;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_167;
    float _215 = _207;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _155 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _155);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_167;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _155 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _191 = _269;
    }
    float _271 = _191;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = fma(_271, _169, _275);
    float _283 = fma(_271, _171, _277);
    float _285 = fma(_271, _173, _279);
    float _287 = fma(_281, _157, _175);
    float _289 = fma(_283, _157, _177);
    float _291 = fma(_285, _157, _179);
    bool _293 = !_273;
    float _311;
    if (!_293)
    {
        float _295 = in.m_54.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_97);
        float _317 = 1.0 / _315;
        float _319 = _131 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = in.m_54.x;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = in.m_54.y;
    float _331 = in.m_54.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _339 = log2(_337);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _343 = float(_327);
    float _345 = 1.0 / _335;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _349 = _323 * 2.0;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _353 = _329 > 0.5;
    float _355 = _329 * 2.0;
    float _357 = floor(_349);
    bool _359 = _331 > 0.5;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _375 = _373 != 0;
    float _377 = floor(_355);
    float _379 = -_201;
    int _381 = _353 ? as_type<int>(_379) : as_type<int>(_201);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -_211;
    int _389 = _359 ? as_type<int>(_387) : as_type<int>(_211);
    bool _391 = !_371;
    float _393 = _391 ? _201 : as_type<float>(_381);
    float _395 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _397 = !_375;
    float _399 = _397 ? _211 : as_type<float>(_389);
    float _401 = 1.0 / _363;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _409 = _407 != 0;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _413 = _411 != 0;
    float _415 = fma(_395, -2.0, _341);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _321 + _421;
    bool _425 = _357 > 0.0;
    bool _427 = _357 >= 0.0;
    bool _429 = isnan(_357);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = 1.0 / _385;
    float _439 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _441 = _435 ? 0 : 1;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _445 = _377 >= 0.0;
    bool _447 = isnan(_377);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = _423 * _401;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _459 = _321 + _457;
    float _461 = _323 + _329;
    float _463 = -_443;
    float _465 = fma(_439, 2.0, _463);
    int _467 = as_type<int>(_439);
    if (_419)
    {
        _467 = 0;
    }
    int _469 = _467;
    float _471 = _459 * _345;
    int _473 = ~_441;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = _461 + (-1.0);
    int _481 = _469;
    int _483 = _477;
    if (!_419)
    {
        _481 = 1;
    }
    int _485 = _481;
    float _487 = _331 * 2.0;
    if (!_425)
    {
        int _489 = ~_441;
        int _491 = _489 + 1;
        _483 = _491;
    }
    int _493 = _483;
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _497 = _377 > 0.0;
    float _499 = _323 + _331;
    float _501 = _453 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _503 = floor(_487);
    bool _505 = _485 != 1;
    float _507 = _499 + (-1.0);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _321 + _509;
    int _513 = as_type<int>(_499);
    float _515 = _501;
    float _517 = _503;
    if (_419)
    {
        _513 = 0;
    }
    int _519 = _513;
    int _521 = _519;
    if (!_419)
    {
        _521 = 2;
    }
    int _523 = _521;
    float _525 = _511 * _437;
    bool _527 = !_409;
    int _529 = _527 ? 0 : 1;
    float _531 = _331 + _329;
    bool _533 = !_405;
    int _535 = _533 ? 0 : 1;
    float _537 = 1.0 / _343;
    int _539 = ~as_type<int>(_501);
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    float _545 = _531 + (-1.0);
    bool _547 = !_413;
    int _549 = _547 ? 0 : 1;
    float _551 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _553 = _543;
    if (!_497)
    {
        int _555 = ~as_type<int>(_501);
        int _557 = _555 + 1;
        _553 = _557;
    }
    int _559 = _553;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _561;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _575 = _573 != 0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _581 = _523 != 2;
    float _583 = fma(_563, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = 0.0;
    if (!_505)
    {
        _585 = _329;
    }
    float _587 = _585;
    float _589 = fma(_579, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _593 = int(_591);
    float _595 = 0.0;
    float _597 = _587;
    if (!_505)
    {
        _595 = _587;
    }
    float _599 = _595;
    float _601 = _339 * _131;
    float _603 = _599;
    if (!_505)
    {
        _515 = _331;
    }
    float _605 = _515;
    float _607 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = 0.0;
    float _611 = _605;
    if (!_505)
    {
        _609 = _331;
    }
    float _613 = _609;
    float _615 = _537 * _131;
    float _617 = _613;
    if (_505)
    {
        _603 = _323;
    }
    float _619 = _603;
    float _621 = exp2(_601);
    if (_505)
    {
        _597 = _323;
    }
    float _623 = _597;
    if (_505)
    {
        _611 = _329;
    }
    float _625 = _611;
    if (_505)
    {
        _617 = _329;
    }
    float _627 = _617;
    bool _629 = _503 >= 0.0;
    bool _631 = isnan(_503);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    int _639 = _637 ? 0 : 1;
    bool _641 = _503 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _643;
    if (_581)
    {
        _517 = _323;
    }
    float _647 = _517;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = _647;
    if (!_581)
    {
        _653 = _331;
    }
    float _655 = _653;
    float _657 = fma(_645, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _659 = fma(_651, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _661 = _655 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _663 = !_571;
    int _665 = _663 ? 0 : 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _669 = !_567;
    int _671 = _669 ? 0 : 1;
    float _673 = -_347;
    float _675 = fma(_661, 2.0, _673);
    float _677 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    float _679 = float(_97);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _683 = _619 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _687 = abs(_665);
    float _689 = 1.0 / _679;
    float _691 = -_681;
    float _693 = fma(_683, 2.0, _691);
    float _695 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].w, _685);
    int _697 = abs(_671);
    float _699 = -_131;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[86].x, _675);
    int _703 = ~_639;
    int _705 = _703 + 1;
    int _707 = _705 + 1;
    float _709 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _677);
    float _711 = _683;
    int _713 = _707;
    if (_581)
    {
        _711 = _329;
    }
    float _715 = _711;
    float _717 = -_131;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[81].x, _693);
    float _721 = _715;
    if (!_641)
    {
        int _723 = ~_639;
        int _725 = _723 + 1;
        _713 = _725;
    }
    int _727 = _713;
    if (!_581)
    {
        _721 = _323;
    }
    float _729 = _721;
    float _731 = _625 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _733 = _729 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _735 = float(_493);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _739 = float(_727);
    float _741 = fma(_733, -2.0, _351);
    float _743 = float(_697);
    float _745 = fma(_731, -2.0, _737);
    float _747 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _741);
    float _749 = float(_593);
    float _751 = _743 * _739;
    float _753 = float(_687);
    float _755 = in.m_56.x;
    float _757 = in.m_56.y;
    float _759 = in.m_56.z;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _763 = 1.0 + _761;
    float _765 = 1.0 / _749;
    float _767 = _753 * _735;
    float _769 = _751 * (-2.0);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(1.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _785 = 1.0 / _763;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _791 = _689 * _131;
    float _793 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _771);
    float _795 = -_621;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _783);
    float _811 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[88].z, _787);
    float _813 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].w, _789);
    float _815 = _807 ? _797 : 0.0;
    float _817 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _819 = -_131;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[76].x, _465);
    float _823 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _811);
    float _825 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _415);
    bool _827 = !_575;
    int _829 = _827 ? 0 : 1;
    float _831 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _695);
    float _833 = _765 * _131;
    float _835 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _793);
    float _837 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _813);
    float _839 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _745);
    if (_781)
    {
        float _841 = _815 * _785;
        _133 = _841;
    }
    float _843 = _133;
    int _845 = abs(_829);
    float _847 = fma(_495, _769, _495);
    float _849 = fma(_769, _755, _755);
    bool _851 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _853 = isnan(_321);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _323 + (-0.5);
    bool _865 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _867 = isnan(_321);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = float(_559);
    float _879 = -_861;
    float _881 = _879 + 1.0;
    float _883 = float(_845);
    float _885 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _849);
    bool _887 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_321);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -_875;
    float _901 = _899 + 1.0;
    float _903 = _875 * _881;
    float _905 = _883 * _877;
    bool _907 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _909 = isnan(_321);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _897 * _901;
    float _921 = _767 * (-2.0);
    float _923 = -_897;
    float _925 = _923 + 1.0;
    float _927 = _329 + (-0.5);
    float _929 = fma(_921, _757, _757);
    float _931 = _917 * _925;
    float _933 = _905 * (-2.0);
    float _935 = fma(_607, _921, _607);
    float _937 = _583 * _931;
    float _939 = _657 * _931;
    float _941 = fma(_551, _933, _551);
    float _943 = fma(_933, _759, _759);
    float _945 = in.m_52.x;
    float _947 = in.m_52.y;
    float _949 = _331 + (-0.5);
    float _951 = -_917;
    float _953 = _951 + 1.0;
    float _955 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _957;
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].z, _943);
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[143].x, _937);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _965;
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[143].y, _939);
    float _971 = fma(_847, _843, _885);
    float _973 = fma(_935, _843, _955);
    float _975 = fma(_941, _843, _961);
    float _977 = fma(_959, _471, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _979 = fma(_589, _919, _963);
    float _981 = fma(_967, _471, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _983 = fma(_659, _919, _969);
    float _985 = _971 * 0.15915493667125701904296875;
    float _987 = _973 * 0.15915493667125701904296875;
    float _989 = _975 * 0.15915493667125701904296875;
    float _991 = fma(_977, _903, _979);
    float _993 = fma(_981, _903, _983);
    float _995 = _985 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1001 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[146].x, _991);
    float _1003 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[146].y, _993);
    float _1005 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = in.m_54.w;
    float _1009 = _1001 * _945;
    float _1011 = _1003 * _947;
    float _1013 = _987 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1023 = _1019 * _1017;
    float _1025 = _1021 * _999;
    float _1027 = _987 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = _985 * 6.283185482025146484375;
    float _1033 = sin(_1031);
    float _1035 = _997 * _1015;
    bool _1037 = _1007 > 0.5;
    float _1039 = _989 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = _997 * _1029;
    float _1045 = _989 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1033 * _1015;
    float _1051 = _1033 * _1029;
    float _1053 = _997 * _1041;
    float _1055 = _1033 * _1041;
    float _1057 = _1029 * _1041;
    float _1059 = _1015 * _1041;
    float _1061 = _1053 * _1025;
    float _1063 = _1055 * _1025;
    float _1065 = fma(_1047, _1043, _1049);
    float _1067 = -_1035;
    float _1069 = fma(_1047, _1051, _1067);
    float _1071 = fma(_1047, _1049, _1043);
    float _1073 = -_1051;
    float _1075 = fma(_1047, _1035, _1073);
    float _1077 = -_1025;
    float _1079 = _1047 * _1077;
    float _1081 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1083 = fma(_1065, _1023, _1061);
    float _1085 = fma(_1069, _1023, _1063);
    float _1087 = fma(_1057, _1023, _1079);
    float _1089 = fma(_1075, _1081, _1083);
    float _1091 = fma(_1071, _1081, _1085);
    float _1093 = fma(_1059, _1081, _1087);
    float _1095 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1097 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1099 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1101 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1103 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1097);
    float _1107 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1095);
    float _1109 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1103);
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1105);
    float _1115 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1107);
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1111);
    float _1121 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1123 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1099);
    float _1125 = _1115 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1129 = _1117 + _1121;
    float _1131 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1123);
    float _1133 = _1125 + _1127;
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1137 = _1129 + _1135;
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1143 = _1133 + _1141;
    float _1145 = _1137 * _1137;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = fma(_1143, _1143, _1145);
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1147);
    float _1155 = -_211;
    int _1157 = _1037 ? as_type<int>(_1155) : as_type<int>(_211);
    float _1159 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1161 = sqrt(_1151);
    float _1163 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1153);
    bool _1165 = !_367;
    float _1167 = _1165 ? _211 : as_type<float>(_1157);
    float _1169 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1159);
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1181 = _1179 != 0;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1185 = _1183 != 0;
    float _1187 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1189 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1191 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1193 = 1.0 / _1187;
    float _1195 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1189);
    bool _1197 = !_1177;
    int _1199 = _1197 ? 0 : 1;
    float _1201 = _1191 + _1187;
    bool _1203 = !_1173;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1195);
    bool _1209 = !_1181;
    int _1211 = _1209 ? 0 : 1;
    bool _1213 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1217 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1225 = _1221 || _1223;
    bool _1227 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1229 = isnan(0.5);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1235 = _1231 || _1233;
    float _1237 = _1139 + _1215;
    bool _1239 = !_1185;
    int _1241 = _1239 ? 0 : 1;
    float _1243 = _1201 * _1193;
    float _1245 = _1243 * 0.5;
    float _1247 = _1207;
    float _1249 = _1215;
    float _1251 = _1129;
    float _1253 = _1187;
    float _1255 = _1193;
    float _1257 = _1151;
    float _1259 = _1137;
    float _1261 = _987;
    if (!_1213)
    {
        _1247 = _1133;
    }
    float _1263 = _1247;
    float _1265 = _1263;
    if (!_1213)
    {
        _1249 = _1237;
    }
    float _1267 = _1249;
    bool _1269 = !_1213;
    float _1271 = _1267;
    if (!_1269)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1277 = _1161 + _1275;
        float _1279 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1281 = rsqrt(_1151);
        float _1283 = _1277 * _1273;
        float _1285 = _1283 * 0.15915493667125701904296875;
        float _1287 = _1285 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1285 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = _1289 + (-1.0);
        float _1297 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1293, _1279, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1301 = fma(_1237, _1289, _1297);
        float _1303 = _1281 * _1299;
        float _1305 = fma(_1143, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1307 = fma(_1137, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1251 = _1307;
        _1253 = _1285;
        _1265 = _1305;
        _1271 = _1301;
        _1255 = _1297;
        _1257 = _1281;
    }
    float _1309 = _1251;
    float _1311 = _1253;
    float _1313 = _1265;
    float _1315 = _1271;
    float _1317 = _1255;
    float _1319 = _1257;
    float _1321 = _1317;
    float _1323 = _1315;
    float _1325 = _1313;
    float _1327 = _1319;
    float _1329 = _1311;
    if (_1235)
    {
        _1259 = 1.0;
    }
    float _1331 = _1259;
    float _1333 = _1331;
    if (_1225)
    {
        _1321 = _1309;
    }
    float _1335 = _1321;
    float _1337 = _1335;
    if (!_1225)
    {
        float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1341 = _1139 + _1339;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1345 = _1125 + _1343;
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = -_1125;
        float _1351 = _1349 + _1313;
        float _1353 = _1341 * _1341;
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1357 = _1117 + _1355;
        float _1359 = -_1139;
        float _1361 = _1359 + _1315;
        float _1363 = -_1117;
        float _1365 = _1363 + _1309;
        float _1367 = fma(_1345, _1345, _1353);
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1371 = fma(_1357, _1357, _1367);
        float _1373 = sqrt(_1371);
        float _1375 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1377 = precise::min(_1373, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1379 = _1377 * _1369;
        float _1381 = _1375 * _1379;
        float _1383 = fma(_1351, _1381, _1125);
        float _1385 = fma(_1361, _1381, _1139);
        float _1387 = fma(_1365, _1381, _1117);
        _1323 = _1385;
        _1325 = _1383;
        _1337 = _1387;
        _1327 = _1379;
        _1329 = _1347;
    }
    float _1389 = _1323;
    float _1391 = _1325;
    float _1393 = _1337;
    float _1395 = _1327;
    float _1397 = _1329;
    float _1399 = _1395;
    float _1401 = _1397;
    if (!_1235)
    {
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1411 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1409);
        float _1413 = _1405 * 6.283185482025146484375;
        float _1415 = cos(_1413);
        float _1417 = _1407 * 0.15915493667125701904296875;
        float _1419 = _1405 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = 1.0 / _1415;
        float _1425 = _1417 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1421 * _1423;
        float _1431 = _1417 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1435;
        float _1439 = _1427 * _1429;
        float _1441 = 1.0 / _1411;
        float _1443 = 1.0 / _1439;
        float _1445 = 1.0 / _1437;
        float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1449 = _1441 * _1447;
        float _1451 = _1433 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = fma(_1451, _1449, _1453);
        float _1457 = _1455 * _1445;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + 1.0;
        _1399 = _1429;
        _1333 = _1463;
    }
    float _1465 = _1399;
    float _1467 = _1333;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1389 + _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1475 = _1391 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1393 + _1477;
    float _1481 = _1471 * _1471;
    float _1483 = fma(_1475, _1475, _1481);
    float _1485 = fma(_1479, _1479, _1483);
    float _1487 = rsqrt(_1485);
    float _1489 = sqrt(_1485);
    float _1491 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1493 = _1475 * _1491;
    float _1495 = _1479 * _1491;
    float _1497 = _1493 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 + _1499;
    float _1503 = sqrt(_1501);
    bool _1505 = _1503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = _1503 + _1507;
    float _1511 = _1487;
    float _1513 = _1501;
    float _1515 = _1509;
    float _1517 = _1465;
    float _1519 = _1471;
    if (_1505)
    {
        float _1521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1521;
    }
    float _1523 = _1511;
    if (_1505)
    {
        float _1525 = rsqrt(_1501);
        _1513 = _1525;
    }
    float _1527 = _1513;
    if (_1505)
    {
        float _1529 = _1509 * _1523;
        _1515 = _1529;
    }
    float _1531 = _1515;
    if (_1505)
    {
        float _1533 = _1531 * 0.15915493667125701904296875;
        _1517 = _1533;
    }
    float _1535 = _1517;
    float _1537 = _1479;
    float _1539 = _1535;
    if (_1505)
    {
        float _1541 = _1535 * 6.283185482025146484375;
        float _1543 = sin(_1541);
        _1537 = _1543;
    }
    float _1545 = _1537;
    float _1547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1549 = precise::max(0.0, _1547);
    float _1551 = _1523;
    float _1553 = _1549;
    if (_1505)
    {
        float _1555 = _1535 * 6.283185482025146484375;
        float _1557 = cos(_1555);
        _1551 = _1557;
    }
    float _1559 = _1551;
    float _1561 = -_1491;
    float _1563 = -_1549;
    float _1565 = fma(_1471, _1561, _1563);
    if (_1505)
    {
        float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1567;
    }
    float _1569 = _1519;
    float _1571 = _1569;
    if (!_1505)
    {
        _1539 = _1497;
    }
    float _1573 = _1539;
    float _1575 = _1545;
    float _1577 = _1573;
    if (_1505)
    {
        float _1579 = fma(_1545, _1569, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1575 = _1579;
    }
    float _1581 = _1575;
    float _1583 = _1581;
    if (!_1505)
    {
        _1571 = _1565;
    }
    float _1585 = _1571;
    float _1587 = _1585;
    float _1589 = _1559;
    if (_1505)
    {
        float _1591 = _1559 + (-1.0);
        _1553 = _1591;
    }
    float _1593 = _1553;
    float _1595 = _1593;
    if (_1505)
    {
        float _1597 = _1527 * _1581;
        _1261 = _1597;
    }
    float _1599 = _1261;
    if (!_1505)
    {
        _1583 = _1493;
    }
    float _1601 = _1583;
    float _1603 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1601;
    if (_1505)
    {
        float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1607;
    }
    float _1609 = _1401;
    if (_1505)
    {
        float _1611 = _1493 * _1599;
        _1605 = _1611;
    }
    float _1613 = _1605;
    if (!_1505)
    {
        _1595 = _1495;
    }
    float _1615 = _1595;
    float _1617 = _1615;
    if (_1505)
    {
        float _1619 = _1495 * _1599;
        _1617 = _1619;
    }
    float _1621 = _1617;
    if (_1505)
    {
        float _1623 = fma(_1565, _1559, _1609);
        _1587 = _1623;
    }
    float _1625 = _1587;
    if (_1505)
    {
        float _1627 = _1613 * _1613;
        _1577 = _1627;
    }
    float _1629 = _1577;
    if (!_1505)
    {
        _1589 = _1499;
    }
    float _1631 = _1589;
    float _1633 = _1631;
    if (_1505)
    {
        float _1635 = _1621 * _1621;
        _1633 = _1635;
    }
    float _1637 = _1633;
    float _1639 = fma(_1625, _1625, _1629);
    float _1641 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1643 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = _1639 + _1637;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1649 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1647);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1655 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1657 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1659 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1661 = rsqrt(_1645);
    float _1663 = -_1651;
    float _1665 = _1663 + 1.0;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1657);
    float _1671 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1659);
    float _1673 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1677 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1669);
    float _1679 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1681 = abs(_1665);
    float _1683 = log2(_1681);
    float _1685 = -_1675;
    float _1687 = fma(_1685, _1653, 1.0);
    float _1689 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1691 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1693 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1695 = _1661 * _1613;
    float _1697 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1691);
    float _1699 = _1661 * _1625;
    float _1701 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1693);
    float _1703 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1705 = _1661 * _1621;
    float _1707 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1697);
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1711 = -_1703;
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1711);
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1717 = log2(_1687);
    float _1719 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1707);
    float _1721 = -_1705;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1713);
    float _1725 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1727 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1729 = fma(_1723, -0.5, 0.5);
    float _1731 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1725);
    float _1733 = exp2(_1715);
    float _1735 = fma(_1723, 0.5, 0.5);
    float _1737 = _1699 + 1.0;
    float _1739 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1731);
    float _1741 = fma(_1735, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1743 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1739);
    float _1745 = 1.0 / _1719;
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1727);
    float _1749 = fma(_1735, _1741, -0.212114393711090087890625);
    float _1751 = _1717 * 0.693147182464599609375;
    float _1753 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1747);
    float _1755 = fma(_1735, _1749, 1.570728778839111328125);
    float _1757 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1759 = sqrt(_1729);
    float _1761 = -_1699;
    float _1763 = fma(_1733, _1737, _1761);
    float _1765 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1753);
    float _1767 = _1743 * _1745;
    float _1769 = _1765 * _1745;
    float _1771 = fma(_1767, 0.5, 0.5);
    float _1773 = fma(_1769, -0.5, 0.5);
    float _1775 = fma(_1763, 0.5, 0.5);
    float _1777 = _1759 * 0.636619746685028076171875;
    float _1779 = -_1755;
    float _1781 = fma(_1777, _1779, 1.0);
    float3 _6160 = float3(_1771, _1773, _1757);
    float _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6160, float3(0.0), isnan(_6160)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6160, float3(0.0), isnan(_6160)), level(0.0)).x;
    float3 _6171 = float3(_1771, _1773, _1757);
    float4 _1786 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _1788 = _1786.x;
    float _1790 = _1786.y;
    float _1792 = _1786.z;
    float _1794 = _1786.w;
    float2 _6188 = float2(_1781, _1775);
    float3 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1808 = int(_1806);
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1812 = _1810 != 0;
    float _1814 = -_823;
    float _1816 = _1814 + 1.0;
    int _1818 = abs(_1199);
    float _1820 = -_837;
    float _1822 = _1820 + 1.0;
    bool _1824 = _329 > 0.5;
    out.m_58.x = _1391;
    out.m_58.y = _1389;
    out.m_58.z = _1393;
    bool _1826 = _331 > 0.5;
    float _1828 = trunc(_615);
    int _1830 = int(_1828);
    float _1832 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1834 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1836 = -_201;
    int _1838 = _1826 ? as_type<int>(_1836) : as_type<int>(_201);
    float _1840 = -_835;
    float _1842 = _1840 + 1.0;
    float _1844 = -_817;
    float _1846 = _1844 + 1.0;
    float _1848 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1834);
    float _1850 = float(uint(_1808));
    float _1852 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1854 = int(_1852);
    int _1856 = ~_1808;
    int _1858 = _1856 + 1;
    float _1860 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1848);
    bool _1862 = _1808 == 0;
    float _1864 = float(uint(_1830));
    float _1866 = 1.0 / _1850;
    float _1868 = float(_1830);
    float _1870 = float(uint(_1854));
    float _1872 = trunc(_833);
    int _1874 = int(_1872);
    int _1876 = ~_1854;
    int _1878 = _1876 + 1;
    int _1880 = as_type<int>(_1866) + (-2);
    float _1882 = 1.0 / _1870;
    float _1884 = as_type<float>(_1880) * _1864;
    int _1886 = ~_1808;
    int _1888 = _1886 + 1;
    float _1890 = float(uint(_1874));
    float _1892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1894 = as_type<int>(_1882) + (-2);
    float _1896 = trunc(_1884);
    float _1898 = precise::max(_1896, 0.0);
    uint _1901 = uint(_1898);
    float _1903 = as_type<float>(_1894) * _1890;
    int _1905 = ~_1854;
    int _1907 = _1905 + 1;
    float _1909 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1911 = exp2(_1832);
    int _1913 = _1888 * int(_1901);
    int _1915 = _1913 + _1830;
    float _1917 = trunc(_1903);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    float _1923 = as_type<float>(_1888);
    float _1925 = as_type<float>(_1915);
    if (_1812)
    {
        _1923 = 1.0;
    }
    float _1927 = _1923;
    float _1929 = _1927;
    if (!_1812)
    {
        _1929 = 7.345489978790283203125;
    }
    float _1931 = _1929;
    float _1933 = float(uint(_1915));
    float _1935 = _1933;
    if (_1812)
    {
        _1925 = _323;
    }
    float _1937 = _1925;
    float _1939 = _1931 * _323;
    float _1941 = _1937;
    if (!_1812)
    {
        _1941 = _329;
    }
    float _1943 = _1941;
    float _1945 = as_type<float>(_1880) * _1933;
    if (_1812)
    {
        _1935 = 1.0;
    }
    float _1947 = _1935;
    float _1949 = floor(_1939);
    float _1951 = _1947;
    if (!_1812)
    {
        _1951 = 1.2345600128173828125;
    }
    float _1953 = _1951;
    float _1955 = -_1911;
    float _1957 = _1955 + 1.0;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1961 = _1959 != 0;
    int _1963 = _1907 * int(_1921);
    int _1965 = _1963 + _1874;
    float _1967 = _1953 * _1943;
    float _1969 = trunc(_1945);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    float _1975 = float(uint(_1965));
    float _1977 = as_type<float>(_1894) * _1975;
    float _1979 = floor(_1967);
    float _1981 = -_1949;
    float _1983 = _1939 + _1981;
    int _1985 = int(_1901) + int(_1973);
    float _1987 = trunc(_1977);
    float _1989 = precise::max(_1987, 0.0);
    uint _1991 = uint(_1989);
    float _1993 = float(_1808);
    int _1995 = _1858 * _1985;
    int _1997 = _1995 + _1830;
    bool _1999 = _1868 >= _1993;
    bool _2001 = isnan(_1868);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan(_1993);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = -_1979;
    float _2013 = _1967 + _2011;
    float _2015 = float(_1874);
    float _2017 = trunc(_2009);
    int _2019 = int(_2017);
    bool _2021 = uint(_1997) >= uint(_1808);
    float _2023 = _1983 * _1993;
    float _2025 = _1993 * _791;
    bool _2027 = !_2021;
    int _2029 = _2027 ? 0 : (-1);
    int _2031 = int(_1921) + int(_1991);
    float _2033 = trunc(_2023);
    int _2035 = int(_2033);
    int _2037 = ~_1985;
    int _2039 = _2037 + _2029;
    int _2041 = _2039 + 1;
    float _2043 = float(_1854);
    int _2045 = _1878 * _2031;
    int _2047 = _2045 + _1874;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2051 = _2049 != 0;
    int _2053 = _1808 * _2041;
    int _2055 = _2053 + _1830;
    bool _2057 = _2015 >= _2043;
    bool _2059 = isnan(_2015);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(_2043);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = _2043 * _791;
    int _2071 = ~_2019;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    bool _2077 = !_1862;
    int _2079 = _2077 ? _2055 : (-1);
    int _2081 = _1808 + (-1);
    float _2083 = trunc(_2067);
    int _2085 = int(_2083);
    bool _2087 = !_2051;
    int _2089 = _2087 ? 0 : 1;
    int _2091 = _2079 * _2075;
    bool _2093 = uint(_2047) >= uint(_1854);
    int _2095 = abs(_529);
    int _2097 = _2019 * _2081;
    int _2099 = _2097 + _2091;
    bool _2101 = !_2093;
    int _2103 = _2101 ? 0 : (-1);
    float _2105 = trunc(_2025);
    int _2107 = int(_2105);
    bool _2109 = _1854 == 0;
    float _2111 = _2013 * _2043;
    int _2113 = ~_2031;
    int _2115 = _2113 + _2103;
    int _2117 = _2115 + 1;
    int _2119 = _2099 * _2095;
    int _2121 = abs(_2089);
    int _2123 = abs(_549);
    int _2125 = _1854 * _2117;
    int _2127 = _2125 + _1874;
    int _2129 = abs(_535);
    int _2131 = _2035 * _2121;
    int _2133 = _2131 + _1830;
    int _2135 = ~_2085;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = trunc(_2111);
    int _2143 = int(_2141);
    bool _2145 = !_2109;
    int _2147 = _2145 ? _2127 : (-1);
    bool _2149 = !_1961;
    int _2151 = _2149 ? 0 : 1;
    int _2153 = _2107 * _2129;
    int _2155 = _2153 + _2119;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2159 = _2157 != 0;
    int _2161 = _2147 * _2139;
    int _2163 = abs(_2151);
    int _2165 = _2133 * _2123;
    int _2167 = _2165 + _2155;
    float _2169 = trunc(_2069);
    int _2171 = int(_2169);
    bool _2173 = !_2159;
    int _2175 = _2173 ? 0 : 1;
    int _2177 = _2035 * _2163;
    int _2179 = _2177 + _2167;
    int _2181 = _1854 + (-1);
    int _2183 = abs(_1205);
    int _2185 = abs(_2175);
    int _2187 = _2085 * _2181;
    int _2189 = _2187 + _2161;
    float _2191 = float(uint(_2179));
    float _2193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2195 = as_type<float>(_1880) * _2191;
    int _2197 = _2189 * _1818;
    int _2199 = abs(_1211);
    int _2201 = _2143 * _2185;
    int _2203 = _2201 + _1874;
    int _2205 = abs(_1241);
    int _2207 = _2171 * _2183;
    int _2209 = _2207 + _2197;
    float _2211 = trunc(_2195);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    int _2217 = ~_1808;
    int _2219 = _2217 + 1;
    int _2221 = _2203 * _2199;
    int _2223 = _2221 + _2209;
    float _2225 = float(uint(_2133));
    int _2227 = ~_1808;
    int _2229 = _2227 + 1;
    int _2231 = _2143 * _2205;
    int _2233 = _2231 + _2223;
    float _2235 = as_type<float>(_1880) * _2225;
    int _2237 = ~_1854;
    int _2239 = _2237 + 1;
    float _2241 = float(uint(_2233));
    float _2243 = trunc(_2235);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    int _2249 = _2219 * int(_2215);
    int _2251 = _2249 + _2179;
    float _2253 = as_type<float>(_1894) * _2241;
    float _2255 = float(uint(_2203));
    float _2257 = float(uint(_2251));
    float _2259 = trunc(_2253);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    float _2265 = as_type<float>(_1894) * _2255;
    float _2267 = as_type<float>(_1880) * _2257;
    int _2269 = _2229 * int(_2247);
    int _2271 = _2269 + _2133;
    float _2273 = trunc(_2267);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    float _2279 = float(uint(_2271));
    int _2281 = _2239 * int(_2263);
    int _2283 = _2281 + _2233;
    float _2285 = trunc(_2265);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    float _2291 = as_type<float>(_1880) * _2279;
    int _2293 = ~_1808;
    int _2295 = _2293 + 1;
    float _2297 = float(uint(_2283));
    float _2299 = trunc(_2291);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = int(_2215) + int(_2277);
    float _2307 = as_type<float>(_1894) * _2297;
    int _2309 = _2239 * int(_2289);
    int _2311 = _2309 + _2203;
    float _2313 = trunc(_2307);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    int _2319 = _2295 * _2305;
    int _2321 = _2319 + _2179;
    int _2323 = ~_1808;
    int _2325 = _2323 + 1;
    float _2327 = float(uint(_2311));
    bool _2329 = uint(_2321) >= uint(_1808);
    float _2331 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2333 = as_type<float>(_1894) * _2327;
    int _2335 = int(_2247) + int(_2303);
    bool _2337 = !_2329;
    int _2339 = _2337 ? 0 : (-1);
    float _2341 = _2331 * _323;
    float _2343 = trunc(_2333);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    int _2349 = ~_2305;
    int _2351 = _2349 + _2339;
    int _2353 = _2351 + 1;
    int _2355 = int(_2263) + int(_2317);
    int _2357 = _2325 * _2335;
    int _2359 = _2357 + _2133;
    int _2361 = ~_1854;
    int _2363 = _2361 + 1;
    int _2365 = _1808 * _2353;
    int _2367 = _2365 + _2179;
    float _2369 = -_211;
    float _2371 = _2369 + 0.5;
    float _2373 = trunc(_2341);
    int _2375 = int(_2373);
    bool _2377 = uint(_2359) >= uint(_1808);
    int _2379 = _2363 * _2355;
    int _2381 = _2379 + _2233;
    bool _2383 = !_1862;
    int _2385 = _2383 ? _2367 : (-1);
    float _2387 = _201 + 0.5;
    bool _2389 = !_2377;
    int _2391 = _2389 ? 0 : (-1);
    int _2393 = _2385 & 3;
    bool _2395 = _2393 != 0;
    int _2397 = _2385 & 3;
    bool _2399 = _2397 != 0;
    out.m_60.x = _2387;
    out.m_60.y = _2371;
    bool _2401 = uint(_2381) >= uint(_1854);
    int _2403 = ~_2335;
    int _2405 = _2403 + _2391;
    int _2407 = _2405 + 1;
    int _2409 = _2395 ? 0 : 1;
    int _2411 = _2375 << 4;
    int _2413 = _2411 + 1712;
    int _2415 = _1808 * _2407;
    int _2417 = _2415 + _2133;
    bool _2419 = uint(_2397) > 1u;
    int _2421 = int(_2289) + int(_2347);
    uint _2423 = uint(int(uint(_2413) >> uint(2)));
    uint _2425 = uint(int(uint(int(_2423)) >> uint(2)));
    int _2427 = int(_2423) & 3;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[int(_2425)][_2427];
    int _2431 = int(_2423) + 1;
    uint _2433 = uint(int(uint(_2431) >> uint(2)));
    int _2435 = _2431 & 3;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[int(_2433)][_2435];
    bool _2439 = !_2401;
    int _2441 = _2439 ? 0 : (-1);
    bool _2443 = uint(_2397) >= 2u;
    int _2445 = ~_2355;
    int _2447 = _2445 + _2441;
    int _2449 = _2447 + 1;
    int _2451 = _2385 >> 31;
    int _2453 = _2413 + 8;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = _2443 ? 0 : 1;
    int _2465 = _1854 * _2449;
    int _2467 = _2465 + _2233;
    bool _2469 = _2397 != 3;
    int _2471 = _2451 & 3;
    int _2473 = ~_2409;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (!_2419)
    {
        int _2481 = ~_2409;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    bool _2487 = _2397 != 3;
    int _2489 = _2385 + _2471;
    int _2491 = ~_1854;
    int _2493 = _2491 + 1;
    int _2495 = _2489 >> 2;
    int _2497 = ~_2463;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    int _2503 = _2501;
    if (_2469)
    {
        int _2505 = ~_2463;
        int _2507 = _2505 + 1;
        _2503 = _2507;
    }
    int _2509 = _2503;
    int _2511 = _2495 << 4;
    int _2513 = _2511 + 368;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2517 = _2515 != 0;
    bool _2519 = !_2109;
    int _2521 = _2519 ? _2467 : (-1);
    uint _2523 = uint(int(uint(_2513) >> uint(2)));
    uint _2525 = uint(int(uint(int(_2523)) >> uint(2)));
    int _2527 = int(_2523) & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    int _2531 = int(_2523) + 1;
    uint _2533 = uint(int(uint(_2531) >> uint(2)));
    int _2535 = _2531 & 3;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[int(_2533)][_2535];
    bool _2539 = !_2517;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = _2521 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = !_1862;
    int _2549 = _2547 ? _2417 : (-1);
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2553 = _2551 != 0;
    bool _2555 = !_2399;
    int _2557 = _2555 ? 0 : 1;
    float _2559 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2561 = uint(_2543) > 1u;
    float _2563 = _2437 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2565 = !_2553;
    int _2567 = _2565 ? 0 : 1;
    float _2569 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2571 = _2521 & 3;
    bool _2573 = _2571 != 0;
    float _2575 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2577 = !_2487;
    int _2579 = _2577 ? 0 : (-1);
    bool _2581 = _2543 != 3;
    int _2583 = _2573 ? 0 : 1;
    bool _2585 = uint(_2543) >= 2u;
    int _2587 = ~_2583;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = _2591;
    if (!_2561)
    {
        int _2595 = ~_2583;
        int _2597 = _2595 + 1;
        _2593 = _2597;
    }
    int _2599 = _2593;
    int _2601 = _2585 ? 0 : 1;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2605 = _2603 != 0;
    float _2607 = _2461 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2609 = !_2545;
    int _2611 = _2609 ? 0 : 1;
    int _2613 = _2513 + 8;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = _2521 >> 31;
    float _2633 = _2607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2635 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2637 = _2635 != 0;
    bool _2639 = _2543 != 3;
    int _2641 = _2493 * _2421;
    int _2643 = _2641 + _2203;
    int _2645 = ~_2601;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2649;
    if (_2581)
    {
        int _2653 = ~_2601;
        int _2655 = _2653 + 1;
        _2651 = _2655;
    }
    int _2657 = _2651;
    float _2659 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2661 = _2631 & 3;
    bool _2663 = !_2639;
    int _2665 = _2663 ? 0 : (-1);
    float _2667 = _2659 * _323;
    bool _2669 = uint(_2643) >= uint(_1854);
    int _2671 = _2521 + _2661;
    float _2673 = trunc(_2667);
    int _2675 = int(_2673);
    bool _2677 = _323 > 0.5;
    float _2679 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2681 = _393 + 0.5;
    int _2683 = _2671 >> 2;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2687 = abs(_2485);
    float _2689 = fma(_2679, _2681, _701);
    int _2691 = _2683 << 4;
    int _2693 = _2691 + 512;
    float _2695 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2697 = !_2669;
    int _2699 = _2697 ? 0 : (-1);
    out.m_62.x = _2569;
    out.m_62.y = _2575;
    out.m_62.z = _2633;
    out.m_62.w = _2685;
    int _2701 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2703 = _2701 != 0;
    float _2705 = _399 + (-0.5);
    int _2707 = ~_2687;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = -_1816;
    float _2715 = fma(_393, _2713, _2689);
    int _2717 = abs(_2557);
    float _2719 = -_1909;
    float _2721 = -_747;
    float _2723 = fma(_2719, _2705, _2721);
    int _2725 = ~_2421;
    int _2727 = _2725 + _2699;
    int _2729 = _2727 + 1;
    int _2731 = ~_2717;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = abs(_2579);
    int _2739 = _1854 * _2729;
    int _2741 = _2739 + _2203;
    int _2743 = abs(_2541);
    uint _2745 = uint(int(uint(_2693) >> uint(2)));
    uint _2747 = uint(int(uint(int(_2745)) >> uint(2)));
    int _2749 = int(_2745) & 3;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[int(_2747)][_2749];
    int _2753 = int(_2745) + 1;
    uint _2755 = uint(int(uint(_2753) >> uint(2)));
    int _2757 = _2753 & 3;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[int(_2755)][_2757];
    float _2761 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2763 = _2711 * as_type<int>(_2537);
    float _2765 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2767 = -_1047;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2695);
    float _2771 = -_1047;
    float _2773 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2761);
    float _2775 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2777 = _2735 * as_type<int>(_2529);
    int _2779 = _2777 + _2763;
    float _2781 = -_1047;
    float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2765);
    int _2785 = abs(_2509);
    float _2787 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2775);
    float _2789 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2791 = int(_2789);
    int _2793 = _2693 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    float _2811 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2813 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2815 = ~_2785;
    int _2817 = _2815 + 1;
    int _2819 = _2817 + 1;
    float _2821 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2811);
    float _2823 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2813);
    int _2825 = _2819 * as_type<int>(_2621);
    int _2827 = _2825 + _2779;
    float _2829 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2773);
    int _2831 = ~_2743;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    float _2837 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2839 = ~_2737;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2783);
    float _2847 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2769);
    float _2849 = float(uint(_2791));
    float _2851 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2853 = _2843 * as_type<int>(_2629);
    int _2855 = _2853 + _2827;
    int _2857 = abs(_2599);
    float _2859 = 1.0 / _2849;
    float _2861 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2863 = _2855 * _2835;
    int _2865 = ~_2857;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    float _2871 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2851);
    float _2873 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    int _2875 = _2549 * _2743;
    int _2877 = _2875 + _2863;
    int _2879 = abs(_2611);
    float _2881 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2837);
    int _2883 = abs(_2665);
    float _2885 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2887 = int(_2885);
    float _2889 = float(uint(_2877));
    int _2891 = ~_2879;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    int _2897 = abs(_2791);
    int _2899 = _2869 * as_type<int>(_2759);
    int _2901 = as_type<int>(_2859) + (-2);
    int _2903 = abs(_2657);
    int _2905 = _2895 * as_type<int>(_2751);
    int _2907 = _2905 + _2899;
    int _2909 = abs(_2567);
    float _2911 = as_type<float>(_2901) * _2889;
    float _2913 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2881);
    int _2915 = ~_2903;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    float _2921 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2873);
    int _2923 = ~_2883;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = trunc(_2911);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = float(uint(_2887));
    int _2937 = _2919 * as_type<int>(_2801);
    int _2939 = _2937 + _2907;
    int _2941 = ~_2909;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    int _2947 = abs(_2887);
    int _2949 = _2927 * as_type<int>(_2809);
    int _2951 = _2949 + _2939;
    int _2953 = ~_2791;
    int _2955 = _2953 + 1;
    float _2957 = 1.0 / _2935;
    float _2959 = float(uint(_2897));
    int _2961 = _2951 * _2945;
    float _2963 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2871);
    bool _2965 = !_2109;
    int _2967 = _2965 ? _2741 : (-1);
    float _2969 = 1.0 / _2959;
    float _2971 = float(uint(_2947));
    int _2973 = _2955 * int(_2933);
    int _2975 = _2973 + _2877;
    int _2977 = _2675 << 4;
    int _2979 = _2977 + 1968;
    int _2981 = _2967 * _2909;
    int _2983 = _2981 + _2961;
    int _2985 = abs(_2877);
    float _2987 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    float _2989 = float(uint(_2975));
    float _2991 = 1.0 / _2971;
    int _2993 = abs(_2983);
    float _2995 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    int _2997 = as_type<int>(_2957) + (-2);
    float _2999 = as_type<float>(_2901) * _2989;
    float _3001 = float(uint(_2983));
    float _3003 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2821);
    uint _3005 = uint(int(uint(_2979) >> uint(2)));
    uint _3007 = uint(int(uint(int(_3005)) >> uint(2)));
    int _3009 = int(_3005) & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = int(_3005) + 1;
    uint _3015 = uint(int(uint(_3013) >> uint(2)));
    int _3017 = _3013 & 3;
    float _3019 = (*spvDescriptorSet0.vp_c9)._m0[int(_3015)][_3017];
    int _3021 = as_type<int>(_2969) + (-2);
    float _3023 = as_type<float>(_2997) * _3001;
    float _3025 = float(uint(_2985));
    float _3027 = trunc(_2999);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    float _3033 = float(uint(_2993));
    out.m_64.x = _2987;
    out.m_64.y = _3003;
    out.m_64.z = _2995;
    bool _3035 = !_2605;
    float _3037 = _3035 ? _201 : as_type<float>(_1838);
    int _3039 = _2979 + 8;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    uint _3043 = uint(int(uint(int(_3041)) >> uint(2)));
    int _3045 = int(_3041) & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    int _3049 = as_type<int>(_2991) + (-2);
    float _3051 = as_type<float>(_3021) * _3025;
    int _3053 = ~_2887;
    int _3055 = _3053 + 1;
    float _3057 = trunc(_3023);
    float _3059 = precise::max(_3057, 0.0);
    uint _3061 = uint(_3059);
    int _3063 = ~_2897;
    int _3065 = _3063 + 1;
    float _3067 = as_type<float>(_3049) * _3033;
    float _3069 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3071 = ~_2947;
    int _3073 = _3071 + 1;
    float _3075 = -_211;
    int _3077 = _1824 ? as_type<int>(_3075) : as_type<int>(_211);
    float _3079 = fma(_3069, _3069, 1.0);
    float _3081 = trunc(_3051);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    float _3087 = -_201;
    int _3089 = _2677 ? as_type<int>(_3087) : as_type<int>(_201);
    float _3091 = _3069 * _2845;
    bool _3093 = !_2637;
    float _3095 = _3093 ? _211 : as_type<float>(_3077);
    float _3097 = _3069 * _2829;
    float _3099 = _3069 * _2847;
    bool _3101 = !_2703;
    float _3103 = _3101 ? _201 : as_type<float>(_3089);
    float _3105 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3107 = trunc(_3067);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    int _3113 = _3055 * int(_3061);
    int _3115 = _3113 + _2983;
    int _3117 = int(_2933) + int(_3031);
    float _3119 = fma(_3105, _2987, _3097);
    float _3121 = fma(_3105, _3003, _3091);
    int _3123 = ~_2897;
    int _3125 = _3123 + 1;
    float _3127 = fma(_3105, _2995, _3099);
    float _3129 = float(uint(_3115));
    float _3131 = rsqrt(_3079);
    int _3133 = _3065 * int(_3085);
    int _3135 = _3133 + _2985;
    float _3137 = _2913 + _3121;
    float _3139 = as_type<float>(_2997) * _3129;
    float _3141 = _2921 + _3127;
    float _3143 = float(uint(_3135));
    int _3145 = _3073 * int(_3111);
    int _3147 = _3145 + _2993;
    float _3149 = as_type<float>(_3021) * _3143;
    float _3151 = fma(_399, _1822, _2723);
    float _3153 = float(uint(_3147));
    float _3155 = _3011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3157 = _3069 * _3131;
    float _3159 = trunc(_3149);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    float _3165 = as_type<float>(_3049) * _3153;
    float _3167 = _3019 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3169 = -_2963;
    float _3171 = _3157 * _3169;
    float _3173 = -_2921;
    float _3175 = _3157 * _3173;
    float _3177 = _2963 + _3119;
    float _3179 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3181 = fma(_3131, _2829, _3171);
    float _3183 = trunc(_3165);
    float _3185 = precise::max(_3183, 0.0);
    uint _3187 = uint(_3185);
    float _3189 = _3047 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3191 = -_2913;
    float _3193 = _3157 * _3191;
    float _3195 = fma(_3131, _2847, _3175);
    float _3197 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3199 = _3167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3201 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3203 = ~_2791;
    int _3205 = _3203 + 1;
    float _3207 = trunc(_3139);
    float _3209 = precise::max(_3207, 0.0);
    uint _3211 = uint(_3209);
    int _3213 = int(_3085) + int(_3163);
    float _3215 = fma(_3131, _2845, _3193);
    out.m_66.x = _3197;
    out.m_66.y = _3199;
    out.m_66.z = _3201;
    out.m_66.w = _3179;
    int _3217 = ~_2887;
    int _3219 = _3217 + 1;
    int _3221 = _3125 * _3213;
    int _3223 = _3221 + _2985;
    int _3225 = _2877 ^ _2791;
    int _3227 = _3205 * _3117;
    int _3229 = _3227 + _2877;
    int _3231 = int(_3111) + int(_3187);
    out.m_68.x = _2715;
    out.m_68.y = _3151;
    bool _3233 = uint(_3229) >= uint(_2791);
    out.m_70.x = _3177;
    out.m_70.y = _3137;
    out.m_70.z = _3141;
    bool _3235 = uint(_3223) >= uint(_2897);
    int _3237 = int(_3061) + int(_3211);
    float _3239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3241 = ~_2947;
    int _3243 = _3241 + 1;
    out.m_72.x = _3181;
    out.m_72.y = _3215;
    out.m_72.z = _3195;
    bool _3245 = !_3233;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3219 * _3237;
    int _3251 = _3249 + _2983;
    int _3253 = ~_3117;
    int _3255 = _3253 + _3247;
    int _3257 = _3255 + 1;
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3261 = uint(_3251) >= uint(_2887);
    int _3263 = _3243 * _3231;
    int _3265 = _3263 + _2993;
    bool _3267 = !_3235;
    int _3269 = _3267 ? 0 : (-1);
    int _3271 = _2791 * _3257;
    int _3273 = _3271 + _2877;
    bool _3275 = _2791 == 0;
    bool _3277 = uint(_3265) >= uint(_2947);
    float _3279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3281 = ~_3269;
    int _3283 = _3213 + _3281;
    int _3285 = _3283 + 1;
    bool _3287 = !_3277;
    int _3289 = _3287 ? 0 : (-1);
    uint _3291 = uint(int(uint(_3225) >> uint(31)));
    float _3293 = _3239 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3295 = ~_3289;
    int _3297 = _3231 + _3295;
    int _3299 = _3297 + 1;
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3303 = _2983 ^ _2887;
    float _3305 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3307 = ~int(_3291);
    int _3309 = _3307 + 1;
    float _3311 = _1167 + (-0.5);
    uint _3313 = uint(int(uint(_3303) >> uint(31)));
    bool _3315 = !_3261;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = _3279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3321 = !_3275;
    int _3323 = _3321 ? _3273 : (-1);
    int _3325 = ~int(_3313);
    int _3327 = _3325 + 1;
    int _3329 = _3285 ^ _3309;
    int _3331 = ~_3237;
    int _3333 = _3331 + _3317;
    int _3335 = _3333 + 1;
    float _3337 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3339 = float(_3323);
    bool _3341 = _2791 == 0;
    int _3343 = _2887 * _3335;
    int _3345 = _3343 + _2983;
    int _3347 = _3299 ^ _3327;
    float _3349 = fma(_3293, _3339, _821);
    int _3351 = ~_3309;
    int _3353 = _3351 + _3329;
    int _3355 = _3353 + 1;
    bool _3357 = _2887 == 0;
    bool _3359 = _2887 == 0;
    int _3361 = ~_3327;
    int _3363 = _3361 + _3347;
    int _3365 = _3363 + 1;
    bool _3367 = !_3341;
    int _3369 = _3367 ? _3355 : (-1);
    bool _3371 = !_3357;
    int _3373 = _3371 ? _3345 : (-1);
    bool _3375 = !_3359;
    int _3377 = _3375 ? _3365 : (-1);
    float _3379 = float(_3369);
    float _3381 = float(_3373);
    float _3383 = _3103 + 0.5;
    float _3385 = float(_3377);
    float _3387 = -_825;
    float _3389 = fma(_3319, _3379, _3387);
    float _3391 = _3095 + (-0.5);
    float _3393 = fma(_3293, _3383, _3349);
    float _3395 = fma(_3337, _3381, _719);
    float _3397 = -_839;
    float _3399 = fma(_3305, _3385, _3397);
    float _3401 = _3037 + 0.5;
    float _3403 = -_3319;
    float _3405 = fma(_3403, _3391, _3389);
    float _3407 = _1743 + _1719;
    float _3409 = -_3305;
    float _3411 = fma(_3409, _3311, _3399);
    float _3413 = fma(_3337, _3401, _3395);
    float _3415 = -_709;
    float _3417 = _3415 + 1.0;
    float _3419 = _1719 * 0.5;
    float _3421 = _3407 * 0.5;
    float _3423 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3425 = -_3417;
    float _3427 = fma(_3037, _3425, _3413);
    float _3429 = -_831;
    float _3431 = _3429 + 1.0;
    float _3433 = fma(_1765, -0.5, _3419);
    float _3435 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1860);
    float _3437 = _3423 * _1783;
    bool _3439 = _1467 > 0.0;
    bool _3441 = isnan(_1467);
    bool _3443 = _3439 || _3441;
    bool _3445 = isnan(0.0);
    bool _3447 = _3443 || _3445;
    float _3449 = -_1842;
    float _3451 = fma(_3103, _3449, _3393);
    float _3453 = fma(_1167, _3431, _3411);
    float _3455 = _3435 + _1719;
    float _3457 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3459 = _1794 * _3437;
    float _3461 = _1804 * _3437;
    float _3463 = -_3423;
    float _3465 = _3463 + 1.0;
    float _3467 = fma(_3095, _1846, _3405);
    out.gl_Position.x = _1743;
    out.gl_Position.y = _1765;
    out.gl_Position.z = _3435;
    out.gl_Position.w = _1719;
    float _3469 = _3455 * 0.5;
    float _3471 = _3457 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3473 = fma(_1800, _3459, _1788);
    float _3475 = fma(_1802, _3459, _1790);
    float _3477 = _1794 * _3465;
    float _3479 = fma(_1794, _3461, _1792);
    out.m_74.x = _3421;
    out.m_74.y = _3433;
    out.m_74.z = _3469;
    out.m_74.w = _1719;
    out.m_76.x = _3451;
    out.m_76.y = _3467;
    out.m_76.z = _3427;
    out.m_76.w = _3453;
    out.m_45.x = _3471;
    out.m_78.x = _3473;
    out.m_78.y = _3475;
    out.m_78.z = _3479;
    out.m_78.w = _3477;
    if (_3447)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3481;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

