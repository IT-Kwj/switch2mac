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
        float _3588 = as_type<float>(_113);
        out.gl_Position.z = _3588;
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
        float _3658 = as_type<float>(_151);
        out.gl_Position.z = _3658;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_52.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = in.m_42.x;
    float _175 = in.m_42.y;
    float _177 = in.m_42.z;
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    float _187 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _189 = 0.0;
    float _191 = _187;
    if (!_165)
    {
        float _193 = _187 * _187;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_181;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_185;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _197;
    if (!_165)
    {
        float _209 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    bool _213 = !_165;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _187 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _187);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_165;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _187 * _253;
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
    float _281 = fma(_271, _167, _275);
    float _283 = fma(_271, _169, _277);
    float _285 = fma(_271, _171, _279);
    float _287 = fma(_281, _155, _173);
    float _289 = fma(_283, _155, _175);
    float _291 = fma(_285, _155, _177);
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
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = 1.0 / _335;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _345 = 1.0 / _339;
    float _347 = _323 * 2.0;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _351 = _329 > 0.5;
    float _353 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _355 = floor(_347);
    float _357 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _359 = _331 > 0.5;
    float _361 = -_201;
    int _363 = _351 ? as_type<int>(_361) : as_type<int>(_201);
    float _365 = -_343;
    float _367 = fma(_357, 2.0, _365);
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _375 = _373 != 0;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _379 = _377 != 0;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _321 + _381;
    float _385 = -_205;
    int _387 = _359 ? as_type<int>(_385) : as_type<int>(_205);
    float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _391 = log2(_389);
    float _393 = _383 * _341;
    bool _395 = !_375;
    float _397 = _395 ? _201 : as_type<float>(_363);
    float _399 = _329 * 2.0;
    bool _401 = !_379;
    float _403 = _401 ? _205 : as_type<float>(_387);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _407 = _321 + _405;
    float _409 = floor(_399);
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _421 = _419 != 0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _321 + _423;
    bool _427 = _355 > 0.0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _431 = _429 != 0;
    bool _433 = _355 >= 0.0;
    bool _435 = isnan(_355);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _453 = _441 ? 0 : 1;
    float _455 = 1.0 / _445;
    bool _457 = !_417;
    int _459 = _457 ? 0 : 1;
    int _461 = ~_453;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    int _467 = _465;
    int _469 = _453;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (!_427)
    {
        int _473 = ~_453;
        int _475 = _473 + 1;
        _467 = _475;
    }
    int _477 = _467;
    if (_431)
    {
        _469 = 0;
    }
    int _479 = _469;
    float _481 = 1.0 / _449;
    bool _483 = _409 >= 0.0;
    bool _485 = isnan(_409);
    bool _487 = _483 || _485;
    bool _489 = isnan(0.0);
    bool _491 = _487 || _489;
    float _493 = fma(_353, -2.0, _451);
    int _495 = _479;
    if (!_431)
    {
        _495 = 1;
    }
    int _497 = _495;
    bool _499 = _409 > 0.0;
    float _501 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    int _503 = _491 ? 0 : 1;
    float _505 = _425 * _455;
    bool _507 = _497 != 1;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _321 + _509;
    int _513 = ~_503;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _331 + _329;
    bool _521 = !_413;
    int _523 = _521 ? 0 : 1;
    float _525 = _511 * _345;
    float _527 = _323 + _329;
    float _529 = _407 * _481;
    float _531 = _323 + _331;
    int _533 = _517;
    int _535 = as_type<int>(_527);
    float _537 = _531;
    if (!_499)
    {
        int _539 = ~_503;
        int _541 = _539 + 1;
        _533 = _541;
    }
    int _543 = _533;
    float _545 = _331 * 2.0;
    float _547 = _527 + (-1.0);
    if (_431)
    {
        _535 = 0;
    }
    int _549 = _535;
    float _551 = _531 + (-1.0);
    float _553 = 0.0;
    int _555 = _549;
    if (!_507)
    {
        _553 = _329;
    }
    float _557 = _553;
    float _559 = _519 + (-1.0);
    float _561 = _557;
    if (!_431)
    {
        _555 = 2;
    }
    int _563 = _555;
    float _565 = floor(_545);
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _569 = !_421;
    int _571 = _569 ? 0 : 1;
    float _573 = 0.0;
    if (!_507)
    {
        _573 = _557;
    }
    float _575 = _573;
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _579 = _575;
    if (!_507)
    {
        _537 = _331;
    }
    float _581 = _537;
    float _583 = 0.0;
    float _585 = _581;
    if (!_507)
    {
        _583 = _331;
    }
    float _587 = _583;
    float _589 = _587;
    if (_507)
    {
        _579 = _323;
    }
    float _591 = _579;
    if (_507)
    {
        _561 = _323;
    }
    float _593 = _561;
    if (_507)
    {
        _585 = _329;
    }
    float _595 = _585;
    float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_507)
    {
        _589 = _329;
    }
    float _599 = _589;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _611 = _609 != 0;
    float _613 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _615 = _563 != 2;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _625 = _565 >= 0.0;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = fma(_619, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _645 = fma(_623, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _647 = _633 ? 0 : 1;
    float _649 = fma(_639, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _651 = fma(_643, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    if (_615)
    {
        _471 = _323;
    }
    float _653 = _471;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    float _659 = _653;
    if (!_615)
    {
        _659 = _331;
    }
    float _661 = _659;
    float _663 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _669 = _565 > 0.0;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _673 = fma(_657, _505, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    bool _679 = !_607;
    int _681 = _679 ? 0 : 1;
    float _683 = -_349;
    float _685 = fma(_671, 2.0, _683);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _689 = fma(_677, _505, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _693 = int(_691);
    float _695 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[83].z, _687);
    float _697 = float(_97);
    float _699 = -_131;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[86].x, _685);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _705 = !_603;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _695);
    int _711 = ~_647;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _703);
    int _719 = _715;
    float _721 = _703;
    if (!_669)
    {
        int _723 = ~_647;
        int _725 = _723 + 1;
        _719 = _725;
    }
    int _727 = _719;
    float _729 = 1.0 / _697;
    if (_615)
    {
        _721 = _329;
    }
    float _731 = _721;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _737 = abs(_681);
    float _739 = fma(_667, _529, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _741 = fma(_735, _529, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _743 = abs(_707);
    float _745 = _731;
    if (!_615)
    {
        _745 = _323;
    }
    float _747 = _745;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _751 = float(_327);
    float _753 = float(_477);
    float _755 = _747 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _757 = 1.0 / _751;
    float _759 = float(_727);
    float _761 = _391 * _131;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _765 = float(_737);
    float _767 = fma(_755, -2.0, _749);
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _771 = float(_743);
    float _773 = exp2(_761);
    float _775 = _765 * _753;
    float _777 = fma(_613, -2.0, _763);
    float _779 = float(_693);
    float _781 = _771 * _759;
    float _783 = -_769;
    float _785 = fma(_597, 2.0, _783);
    float _787 = in.m_56.x;
    float _789 = in.m_56.y;
    float _791 = in.m_56.z;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _795 = 1.0 + _793;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _799 = 1.0 / _779;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = _757 * _131;
    bool _817 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _819 = isnan(0.0);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _825 = _821 || _823;
    float _827 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].w, _803);
    float _829 = 1.0 / _795;
    float _831 = -_131;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[76].x, _367);
    float _835 = -_773;
    float _837 = _835 + 1.0;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _841 = _729 * _131;
    float _843 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _797);
    float _845 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _801);
    float _847 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[88].z, _839);
    float _849 = _825 ? _837 : 0.0;
    float _851 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _717);
    float _853 = _781 * (-2.0);
    float _855 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _777);
    bool _857 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _859 = isnan(_321);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _799 * _131;
    bool _871 = !_611;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _843);
    float _877 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _845);
    float _879 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _847);
    float _881 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _827);
    float _883 = -_131;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[81].x, _785);
    float _887 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _767);
    float _889 = _869;
    if (_813)
    {
        float _891 = _849 * _829;
        _133 = _891;
    }
    float _893 = _133;
    float _895 = fma(_853, _787, _787);
    bool _897 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _899 = isnan(_321);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = fma(_663, _853, _663);
    int _911 = abs(_873);
    float _913 = -_867;
    float _915 = _913 + 1.0;
    bool _917 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _919 = isnan(_321);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = _323 + (-0.5);
    float _931 = -_907;
    float _933 = _931 + 1.0;
    float _935 = _907 * _915;
    bool _937 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _939 = isnan(_321);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[196].x, _895);
    float _951 = -_927;
    float _953 = _951 + 1.0;
    float _955 = float(_543);
    float _957 = _927 * _933;
    bool _959 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _961 = isnan(_321);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _947 * _953;
    float _973 = _775 * (-2.0);
    float _975 = -_947;
    float _977 = _975 + 1.0;
    float _979 = float(_911);
    float _981 = fma(_909, _893, _949);
    float _983 = _329 + (-0.5);
    float _985 = fma(_973, _789, _789);
    float _987 = _969 * _977;
    float _989 = _979 * _955;
    float _991 = _981 * 0.15915493667125701904296875;
    float _993 = fma(_577, _973, _577);
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].y, _985);
    float _997 = _649 * _987;
    float _999 = -_969;
    float _1001 = _999 + 1.0;
    float _1003 = _635 * _987;
    float _1005 = _989 * (-2.0);
    float _1007 = fma(_993, _893, _995);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[143].x, _997);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1003);
    float _1013 = in.m_52.x;
    float _1015 = in.m_52.y;
    float _1017 = fma(_1005, _791, _791);
    float _1019 = _331 + (-0.5);
    float _1021 = fma(_567, _1005, _567);
    float _1023 = fma(_645, _971, _1011);
    float _1025 = fma(_651, _971, _1009);
    float _1027 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1017);
    float _1029 = _1007 * 0.15915493667125701904296875;
    float _1031 = fma(_689, _957, _1023);
    float _1033 = fma(_673, _957, _1025);
    float _1035 = fma(_1021, _893, _1027);
    float _1037 = _991 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = fma(_741, _935, _1031);
    float _1043 = fma(_739, _935, _1033);
    float _1045 = _1035 * 0.15915493667125701904296875;
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1049 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1041);
    float _1051 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1043);
    float _1053 = in.m_54.w;
    float _1055 = _1029 * 6.283185482025146484375;
    float _1057 = sin(_1055);
    float _1059 = _1049 * _1015;
    float _1061 = _1051 * _1013;
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1065 = _1029 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1073 = _1069 * _1047;
    float _1075 = _1071 * _1063;
    float _1077 = _991 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1039 * _1057;
    bool _1083 = _1053 > 0.5;
    float _1085 = _1045 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1039 * _1067;
    float _1091 = _1045 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = _1079 * _1057;
    float _1097 = _1079 * _1067;
    float _1099 = _1039 * _1087;
    float _1101 = _1079 * _1087;
    float _1103 = _1067 * _1087;
    float _1105 = _1057 * _1087;
    float _1107 = _1099 * _1073;
    float _1109 = _1101 * _1073;
    float _1111 = fma(_1093, _1089, _1095);
    float _1113 = -_1081;
    float _1115 = fma(_1093, _1097, _1113);
    float _1117 = fma(_1093, _1095, _1089);
    float _1119 = -_1097;
    float _1121 = fma(_1093, _1081, _1119);
    float _1123 = -_1073;
    float _1125 = _1093 * _1123;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = fma(_1111, _1075, _1107);
    float _1131 = fma(_1115, _1075, _1109);
    float _1133 = fma(_1103, _1075, _1125);
    float _1135 = fma(_1121, _1127, _1129);
    float _1137 = fma(_1117, _1127, _1131);
    float _1139 = fma(_1105, _1127, _1133);
    float _1141 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1141);
    float _1151 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    float _1153 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1145);
    float _1155 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1157 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1149);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1151);
    float _1161 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1153);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1155);
    float _1165 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1169 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1171 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1175 = _1165 + _1167;
    float _1177 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1169);
    float _1179 = _1171 + _1173;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1175 + _1181;
    float _1185 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1177);
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1179 + _1187;
    float _1191 = _1183 * _1183;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1195 = fma(_1189, _1189, _1191);
    float _1197 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1199 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1201 = sqrt(_1195);
    float _1203 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1197);
    float _1205 = -_205;
    int _1207 = _1083 ? as_type<int>(_1205) : as_type<int>(_205);
    float _1209 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1199);
    float _1211 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1203);
    bool _1213 = !_371;
    float _1215 = _1213 ? _205 : as_type<float>(_1207);
    float _1217 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1209);
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1225 = _1223 != 0;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    float _1235 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1239 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1241 = 1.0 / _1235;
    float _1243 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1237);
    bool _1245 = !_1225;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = _1239 + _1235;
    bool _1251 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1243);
    bool _1255 = !_1221;
    int _1257 = _1255 ? 0 : 1;
    bool _1259 = !_1229;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1267 = isnan(0.5);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1273 = _1269 || _1271;
    bool _1275 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1277 = isnan(0.5);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1283 = _1279 || _1281;
    float _1285 = _1193 + _1263;
    bool _1287 = !_1233;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = _1249 * _1241;
    float _1293 = _1291 * 0.5;
    float _1295 = _1253;
    float _1297 = _1263;
    float _1299 = _1175;
    float _1301 = _1235;
    float _1303 = _1241;
    float _1305 = _1195;
    float _1307 = _1183;
    float _1309 = _1005;
    if (!_1251)
    {
        _1295 = _1179;
    }
    float _1311 = _1295;
    float _1313 = _1311;
    if (!_1251)
    {
        _1297 = _1285;
    }
    float _1315 = _1297;
    bool _1317 = !_1251;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1201 + _1323;
        float _1327 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1195);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1337 + (-1.0);
        float _1345 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = fma(_1341, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1349 = fma(_1285, _1337, _1345);
        float _1351 = _1329 * _1347;
        float _1353 = fma(_1189, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1355 = fma(_1183, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1355;
        _1301 = _1333;
        _1313 = _1353;
        _1319 = _1349;
        _1303 = _1345;
        _1305 = _1329;
    }
    float _1357 = _1299;
    float _1359 = _1301;
    float _1361 = _1313;
    float _1363 = _1319;
    float _1365 = _1303;
    float _1367 = _1305;
    float _1369 = _1365;
    float _1371 = _1363;
    float _1373 = _1361;
    float _1375 = _1367;
    float _1377 = _1359;
    if (_1283)
    {
        _1307 = 1.0;
    }
    float _1379 = _1307;
    float _1381 = _1379;
    if (_1273)
    {
        _1369 = _1357;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (!_1273)
    {
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1389 = _1193 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1393 = _1171 + _1391;
        float _1395 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1397 = -_1171;
        float _1399 = _1397 + _1361;
        float _1401 = _1389 * _1389;
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1405 = _1165 + _1403;
        float _1407 = -_1193;
        float _1409 = _1407 + _1363;
        float _1411 = -_1165;
        float _1413 = _1411 + _1357;
        float _1415 = fma(_1393, _1393, _1401);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = fma(_1405, _1405, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1425 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1427 = _1425 * _1417;
        float _1429 = _1423 * _1427;
        float _1431 = fma(_1399, _1429, _1171);
        float _1433 = fma(_1409, _1429, _1193);
        float _1435 = fma(_1413, _1429, _1165);
        _1371 = _1433;
        _1373 = _1431;
        _1385 = _1435;
        _1375 = _1427;
        _1377 = _1395;
    }
    float _1437 = _1371;
    float _1439 = _1373;
    float _1441 = _1385;
    float _1443 = _1375;
    float _1445 = _1377;
    float _1447 = _1443;
    float _1449 = _1445;
    if (!_1283)
    {
        float _1451 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1459 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1457);
        float _1461 = _1453 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1455 * 0.15915493667125701904296875;
        float _1467 = _1453 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = 1.0 / _1463;
        float _1473 = _1465 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = _1465 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1483;
        float _1487 = _1475 * _1477;
        float _1489 = 1.0 / _1459;
        float _1491 = 1.0 / _1487;
        float _1493 = 1.0 / _1485;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1497 = _1489 * _1495;
        float _1499 = _1481 * _1491;
        float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1503 = fma(_1499, _1497, _1501);
        float _1505 = _1503 * _1493;
        float _1507 = precise::clamp(_1505, 0.0, 1.0);
        float _1509 = -_1507;
        float _1511 = _1509 + 1.0;
        _1447 = _1477;
        _1381 = _1511;
    }
    float _1513 = _1447;
    float _1515 = _1381;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1519 = _1437 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1523 = _1439 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1441 + _1525;
    float _1529 = _1519 * _1519;
    float _1531 = fma(_1523, _1523, _1529);
    float _1533 = fma(_1527, _1527, _1531);
    float _1535 = rsqrt(_1533);
    float _1537 = sqrt(_1533);
    float _1539 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1541 = _1523 * _1539;
    float _1543 = _1527 * _1539;
    float _1545 = _1541 * _1541;
    float _1547 = _1543 * _1543;
    float _1549 = _1545 + _1547;
    float _1551 = sqrt(_1549);
    bool _1553 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = _1551 + _1555;
    float _1559 = _1535;
    float _1561 = _1549;
    float _1563 = _1557;
    float _1565 = _1513;
    float _1567 = _1519;
    if (_1553)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1559 = _1569;
    }
    float _1571 = _1559;
    if (_1553)
    {
        float _1573 = rsqrt(_1549);
        _1561 = _1573;
    }
    float _1575 = _1561;
    if (_1553)
    {
        float _1577 = _1557 * _1571;
        _1563 = _1577;
    }
    float _1579 = _1563;
    if (_1553)
    {
        float _1581 = _1579 * 0.15915493667125701904296875;
        _1565 = _1581;
    }
    float _1583 = _1565;
    float _1585 = _1527;
    float _1587 = _1583;
    if (_1553)
    {
        float _1589 = _1583 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        _1585 = _1591;
    }
    float _1593 = _1585;
    float _1595 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1597 = precise::max(0.0, _1595);
    float _1599 = _1571;
    float _1601 = _1597;
    if (_1553)
    {
        float _1603 = _1583 * 6.283185482025146484375;
        float _1605 = cos(_1603);
        _1599 = _1605;
    }
    float _1607 = _1599;
    float _1609 = -_1539;
    float _1611 = -_1597;
    float _1613 = fma(_1519, _1609, _1611);
    if (_1553)
    {
        float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1567 = _1615;
    }
    float _1617 = _1567;
    float _1619 = _1617;
    if (!_1553)
    {
        _1587 = _1545;
    }
    float _1621 = _1587;
    float _1623 = _1593;
    float _1625 = _1621;
    if (_1553)
    {
        float _1627 = fma(_1593, _1617, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1629;
    if (!_1553)
    {
        _1619 = _1613;
    }
    float _1633 = _1619;
    float _1635 = _1633;
    float _1637 = _1607;
    if (_1553)
    {
        float _1639 = _1607 + (-1.0);
        _1601 = _1639;
    }
    float _1641 = _1601;
    float _1643 = _1641;
    if (_1553)
    {
        float _1645 = _1575 * _1629;
        _1309 = _1645;
    }
    float _1647 = _1309;
    if (!_1553)
    {
        _1631 = _1541;
    }
    float _1649 = _1631;
    float _1651 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1653 = _1649;
    if (_1553)
    {
        float _1655 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1655;
    }
    float _1657 = _1449;
    if (_1553)
    {
        float _1659 = _1541 * _1647;
        _1653 = _1659;
    }
    float _1661 = _1653;
    if (!_1553)
    {
        _1643 = _1543;
    }
    float _1663 = _1643;
    float _1665 = _1663;
    if (_1553)
    {
        float _1667 = _1543 * _1647;
        _1665 = _1667;
    }
    float _1669 = _1665;
    if (_1553)
    {
        float _1671 = fma(_1613, _1607, _1657);
        _1635 = _1671;
    }
    float _1673 = _1635;
    if (_1553)
    {
        float _1675 = _1661 * _1661;
        _1625 = _1675;
    }
    float _1677 = _1625;
    if (!_1553)
    {
        _1637 = _1547;
    }
    float _1679 = _1637;
    float _1681 = _1679;
    if (_1553)
    {
        float _1683 = _1669 * _1669;
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = fma(_1673, _1673, _1677);
    float _1689 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    float _1691 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1693 = _1687 + _1685;
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1697 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1695);
    float _1699 = precise::clamp(_1697, 0.0, 1.0);
    float _1701 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1703 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1689);
    float _1705 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1707 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1691);
    float _1709 = rsqrt(_1693);
    float _1711 = -_1699;
    float _1713 = _1711 + 1.0;
    float _1715 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1717 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1705);
    float _1719 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1707);
    float _1721 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1725 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1717);
    float _1727 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1729 = abs(_1713);
    float _1731 = log2(_1729);
    float _1733 = -_1723;
    float _1735 = fma(_1733, _1701, 1.0);
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1741 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1721);
    float _1743 = _1709 * _1661;
    float _1745 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1739);
    float _1747 = _1709 * _1673;
    float _1749 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1741);
    float _1751 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1753 = _1709 * _1669;
    float _1755 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1745);
    float _1757 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1759 = -_1751;
    float _1761 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1759);
    float _1763 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1765 = log2(_1735);
    float _1767 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1755);
    float _1769 = -_1753;
    float _1771 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1761);
    float _1773 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1775 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1777 = fma(_1771, -0.5, 0.5);
    float _1779 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1773);
    float _1781 = exp2(_1763);
    float _1783 = fma(_1771, 0.5, 0.5);
    float _1785 = _1747 + 1.0;
    float _1787 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1779);
    float _1789 = fma(_1783, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1791 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1787);
    float _1793 = 1.0 / _1767;
    float _1795 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1775);
    float _1797 = fma(_1783, _1789, -0.212114393711090087890625);
    float _1799 = _1765 * 0.693147182464599609375;
    float _1801 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1795);
    float _1803 = fma(_1783, _1797, 1.570728778839111328125);
    float _1805 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1807 = sqrt(_1777);
    float _1809 = -_1747;
    float _1811 = fma(_1781, _1785, _1809);
    float _1813 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    float _1815 = _1791 * _1793;
    float _1817 = _1813 * _1793;
    float _1819 = fma(_1815, 0.5, 0.5);
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1811, 0.5, 0.5);
    float _1825 = _1807 * 0.636619746685028076171875;
    float _1827 = -_1803;
    float _1829 = fma(_1825, _1827, 1.0);
    float3 _6282 = float3(_1819, _1821, _1805);
    float _1831 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6282, float3(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6282, float3(0.0), isnan(_6282)), level(0.0)).x;
    float3 _6293 = float3(_1819, _1821, _1805);
    float4 _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).xyzw;
    float _1836 = _1834.x;
    float _1838 = _1834.y;
    float _1840 = _1834.z;
    float _1842 = _1834.w;
    float2 _6310 = float2(_1829, _1823);
    float3 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).xyz;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1856 = int(_1854);
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1860 = _1858 != 0;
    float _1862 = -_879;
    float _1864 = _1862 + 1.0;
    int _1866 = abs(_1247);
    float _1868 = -_881;
    float _1870 = _1868 + 1.0;
    int _1872 = abs(_1257);
    out.m_58.x = _1439;
    out.m_58.y = _1437;
    out.m_58.z = _1441;
    bool _1874 = _329 > 0.5;
    float _1876 = trunc(_815);
    int _1878 = int(_1876);
    bool _1880 = _331 > 0.5;
    float _1882 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1884 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1886 = -_875;
    float _1888 = _1886 + 1.0;
    float _1890 = -_201;
    int _1892 = _1880 ? as_type<int>(_1890) : as_type<int>(_201);
    float _1894 = -_877;
    float _1896 = _1894 + 1.0;
    float _1898 = float(uint(_1856));
    float _1900 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1902 = int(_1900);
    float _1904 = trunc(_869);
    int _1906 = int(_1904);
    float _1908 = float(uint(_1878));
    float _1910 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1884);
    float _1912 = _1805;
    if (_1860)
    {
        _1912 = 1.0;
    }
    float _1914 = _1912;
    float _1916 = _1914;
    if (!_1860)
    {
        _1916 = 7.345489978790283203125;
    }
    float _1918 = _1916;
    float _1920 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1910);
    int _1922 = ~_1856;
    int _1924 = _1922 + 1;
    float _1926 = 1.0 / _1898;
    float _1928 = float(uint(_1902));
    float _1930 = _1918 * _323;
    if (_1860)
    {
        _889 = _323;
    }
    float _1932 = _889;
    float _1934 = _1932;
    if (!_1860)
    {
        _1934 = _329;
    }
    float _1936 = _1934;
    bool _1938 = _1856 == 0;
    float _1940 = 1.0 / _1928;
    float _1942 = float(uint(_1906));
    int _1944 = as_type<int>(_1926) + (-2);
    float _1946 = floor(_1930);
    float _1948 = as_type<float>(_1944) * _1908;
    int _1950 = ~_1856;
    int _1952 = _1950 + 1;
    int _1954 = as_type<int>(_1940) + (-2);
    float _1956 = exp2(_1882);
    float _1958 = trunc(_1948);
    float _1960 = precise::max(_1958, 0.0);
    uint _1963 = uint(_1960);
    float _1965 = -_1946;
    float _1967 = _1930 + _1965;
    float _1969 = -_1956;
    float _1971 = _1969 + 1.0;
    int _1973 = _1952 * int(_1963);
    int _1975 = _1973 + _1878;
    float _1977 = as_type<float>(_1954) * _1942;
    int _1979 = ~_1902;
    int _1981 = _1979 + 1;
    float _1983 = float(uint(_1975));
    float _1985 = trunc(_1977);
    float _1987 = precise::max(_1985, 0.0);
    uint _1989 = uint(_1987);
    float _1991 = as_type<float>(_1975);
    if (_1860)
    {
        _1991 = 1.0;
    }
    float _1993 = _1991;
    float _1995 = as_type<float>(_1944) * _1983;
    float _1997 = _1993;
    if (!_1860)
    {
        _1997 = 1.2345600128173828125;
    }
    float _1999 = _1997;
    int _2001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2003 = _2001 != 0;
    float _2005 = trunc(_1995);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    float _2011 = _1999 * _1936;
    float _2013 = float(_1856);
    int _2015 = _1981 * int(_1989);
    int _2017 = _2015 + _1906;
    float _2019 = floor(_2011);
    float _2021 = float(uint(_2017));
    int _2023 = int(_1963) + int(_2009);
    float _2025 = as_type<float>(_1954) * _2021;
    float _2027 = float(_1878);
    int _2029 = _1924 * _2023;
    int _2031 = _2029 + _1878;
    float _2033 = trunc(_2025);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = _2027 >= _2013;
    bool _2041 = isnan(_2027);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan(_2013);
    bool _2047 = _2043 || _2045;
    float _2049 = float(_2047);
    float _2051 = -_2019;
    float _2053 = _2011 + _2051;
    int _2055 = _1856 + (-1);
    bool _2057 = uint(_2031) >= uint(_1856);
    float _2059 = trunc(_2049);
    int _2061 = int(_2059);
    bool _2063 = !_2057;
    int _2065 = _2063 ? 0 : (-1);
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2069 = _2067 != 0;
    int _2071 = ~_2023;
    int _2073 = _2071 + _2065;
    int _2075 = _2073 + 1;
    float _2077 = float(_1902);
    int _2079 = int(_1989) + int(_2037);
    int _2081 = _1856 * _2075;
    int _2083 = _2081 + _1878;
    int _2085 = ~_1902;
    int _2087 = _2085 + 1;
    float _2089 = _1967 * _2013;
    float _2091 = float(_1906);
    float _2093 = _2013 * _841;
    bool _2095 = !_1938;
    int _2097 = _2095 ? _2083 : (-1);
    int _2099 = _2087 * _2079;
    int _2101 = _2099 + _1906;
    int _2103 = ~_2061;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    float _2109 = trunc(_2089);
    int _2111 = int(_2109);
    bool _2113 = _2091 >= _2077;
    bool _2115 = isnan(_2091);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(_2077);
    bool _2121 = _2117 || _2119;
    float _2123 = float(_2121);
    float _2125 = _2077 * _841;
    bool _2127 = !_2069;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = _2097 * _2107;
    bool _2133 = uint(_2101) >= uint(_1902);
    int _2135 = abs(_459);
    int _2137 = _2061 * _2055;
    int _2139 = _2137 + _2131;
    bool _2141 = !_2133;
    int _2143 = _2141 ? 0 : (-1);
    float _2145 = trunc(_2093);
    int _2147 = int(_2145);
    bool _2149 = _1902 == 0;
    int _2151 = _2139 * _2135;
    int _2153 = ~_2079;
    int _2155 = _2153 + _2143;
    int _2157 = _2155 + 1;
    float _2159 = _2053 * _2077;
    int _2161 = abs(_2129);
    int _2163 = abs(_571);
    float _2165 = trunc(_2123);
    int _2167 = int(_2165);
    int _2169 = _1902 * _2157;
    int _2171 = _2169 + _1906;
    int _2173 = abs(_523);
    int _2175 = _2111 * _2161;
    int _2177 = _2175 + _1878;
    bool _2179 = !_2003;
    int _2181 = _2179 ? 0 : 1;
    bool _2183 = !_2149;
    int _2185 = _2183 ? _2171 : (-1);
    int _2187 = _2147 * _2173;
    int _2189 = _2187 + _2151;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2193 = _2191 != 0;
    float _2195 = trunc(_2159);
    int _2197 = int(_2195);
    int _2199 = abs(_2181);
    int _2201 = _2177 * _2163;
    int _2203 = _2201 + _2189;
    bool _2205 = !_2193;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = ~_2167;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    int _2215 = _2111 * _2199;
    int _2217 = _2215 + _2203;
    int _2219 = abs(_2207);
    float _2221 = trunc(_2125);
    int _2223 = int(_2221);
    int _2225 = _2185 * _2213;
    int _2227 = _1902 + (-1);
    int _2229 = ~_1856;
    int _2231 = _2229 + 1;
    int _2233 = _2167 * _2227;
    int _2235 = _2233 + _2225;
    float _2237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2239 = float(uint(_2217));
    int _2241 = _2235 * _1866;
    int _2243 = abs(_1261);
    int _2245 = _2197 * _2219;
    int _2247 = _2245 + _1906;
    int _2249 = abs(_1289);
    float _2251 = as_type<float>(_1944) * _2239;
    int _2253 = _2223 * _1872;
    int _2255 = _2253 + _2241;
    int _2257 = ~_1856;
    int _2259 = _2257 + 1;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2263 = ~_1856;
    int _2265 = _2263 + 1;
    int _2267 = _2247 * _2243;
    int _2269 = _2267 + _2255;
    float _2271 = float(uint(_2177));
    int _2273 = ~_1902;
    int _2275 = _2273 + 1;
    int _2277 = _2197 * _2249;
    int _2279 = _2277 + _2269;
    float _2281 = trunc(_2251);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = as_type<float>(_1944) * _2271;
    float _2289 = float(uint(_2279));
    float _2291 = trunc(_2287);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    float _2297 = as_type<float>(_1954) * _2289;
    float _2299 = float(uint(_2247));
    float _2301 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2303 = as_type<float>(_1954) * _2299;
    int _2305 = _2259 * int(_2285);
    int _2307 = _2305 + _2217;
    float _2309 = trunc(_2297);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    float _2315 = float(uint(_2307));
    int _2317 = _2265 * int(_2295);
    int _2319 = _2317 + _2177;
    float _2321 = trunc(_2303);
    float _2323 = precise::max(_2321, 0.0);
    uint _2325 = uint(_2323);
    float _2327 = as_type<float>(_1944) * _2315;
    float _2329 = float(uint(_2319));
    float _2331 = trunc(_2327);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = _2275 * int(_2313);
    int _2339 = _2337 + _2279;
    float _2341 = as_type<float>(_1944) * _2329;
    int _2343 = ~_1902;
    int _2345 = _2343 + 1;
    float _2347 = float(uint(_2339));
    float _2349 = trunc(_2341);
    float _2351 = precise::max(_2349, 0.0);
    uint _2353 = uint(_2351);
    int _2355 = int(_2285) + int(_2335);
    float _2357 = as_type<float>(_1954) * _2347;
    int _2359 = _2345 * int(_2325);
    int _2361 = _2359 + _2247;
    float _2363 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2365 = _2231 * _2355;
    int _2367 = _2365 + _2217;
    float _2369 = trunc(_2357);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = float(uint(_2361));
    float _2377 = _2363 * _323;
    int _2379 = int(_2295) + int(_2353);
    bool _2381 = uint(_2367) >= uint(_1856);
    float _2383 = as_type<float>(_1954) * _2375;
    int _2385 = ~_1856;
    int _2387 = _2385 + 1;
    bool _2389 = !_2381;
    int _2391 = _2389 ? 0 : (-1);
    float _2393 = trunc(_2383);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    int _2399 = ~_2355;
    int _2401 = _2399 + _2391;
    int _2403 = _2401 + 1;
    int _2405 = ~_1902;
    int _2407 = _2405 + 1;
    int _2409 = _2387 * _2379;
    int _2411 = _2409 + _2177;
    int _2413 = int(_2313) + int(_2373);
    int _2415 = _1856 * _2403;
    int _2417 = _2415 + _2217;
    float _2419 = trunc(_2377);
    int _2421 = int(_2419);
    bool _2423 = uint(_2411) >= uint(_1856);
    float _2425 = -_205;
    float _2427 = _2425 + 0.5;
    bool _2429 = !_1938;
    int _2431 = _2429 ? _2417 : (-1);
    int _2433 = _2407 * _2413;
    int _2435 = _2433 + _2279;
    bool _2437 = !_2423;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = _201 + 0.5;
    int _2443 = _2431 & 3;
    bool _2445 = _2443 != 0;
    int _2447 = ~_2379;
    int _2449 = _2447 + _2439;
    int _2451 = _2449 + 1;
    bool _2453 = uint(_2435) >= uint(_1902);
    out.m_60.x = _2441;
    out.m_60.y = _2427;
    int _2455 = int(_2325) + int(_2397);
    int _2457 = _2431 & 3;
    bool _2459 = _2457 != 0;
    int _2461 = _2421 << 4;
    int _2463 = _2461 + 1712;
    int _2465 = _1856 * _2451;
    int _2467 = _2465 + _2177;
    bool _2469 = !_2453;
    int _2471 = _2469 ? 0 : (-1);
    int _2473 = _2463 + 8;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
    int _2479 = int(_2475) & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    bool _2483 = uint(_2457) >= 2u;
    int _2485 = ~_2413;
    int _2487 = _2485 + _2471;
    int _2489 = _2487 + 1;
    int _2491 = _2431 >> 31;
    int _2493 = _2483 ? 0 : 1;
    uint _2495 = uint(int(uint(_2463) >> uint(2)));
    uint _2497 = uint(int(uint(int(_2495)) >> uint(2)));
    int _2499 = int(_2495) & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = int(_2495) + 1;
    uint _2505 = uint(int(uint(_2503) >> uint(2)));
    int _2507 = _2503 & 3;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[int(_2505)][_2507];
    bool _2511 = _2457 != 3;
    int _2513 = _1902 * _2489;
    int _2515 = _2513 + _2279;
    int _2517 = _2491 & 3;
    int _2519 = _2445 ? 0 : 1;
    int _2521 = _2431 + _2517;
    bool _2523 = uint(_2457) > 1u;
    int _2525 = _2521 >> 2;
    int _2527 = ~_2493;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2511)
    {
        int _2535 = ~_2493;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = _2525 << 4;
    int _2543 = _2541 + 368;
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2547 = _2545 != 0;
    bool _2549 = !_2149;
    int _2551 = _2549 ? _2515 : (-1);
    uint _2553 = uint(int(uint(_2543) >> uint(2)));
    uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
    int _2557 = int(_2553) & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = int(_2553) + 1;
    uint _2563 = uint(int(uint(_2561) >> uint(2)));
    int _2565 = _2561 & 3;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[int(_2563)][_2565];
    bool _2569 = !_2547;
    int _2571 = _2569 ? 0 : 1;
    int _2573 = _2551 & 3;
    bool _2575 = _2573 != 0;
    bool _2577 = !_1938;
    int _2579 = _2577 ? _2467 : (-1);
    int _2581 = ~_2519;
    int _2583 = _2581 + 1;
    int _2585 = _2583 + 1;
    int _2587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2589 = _2587 != 0;
    bool _2591 = !_2459;
    int _2593 = _2591 ? 0 : 1;
    int _2595 = _2585;
    if (!_2523)
    {
        int _2597 = ~_2519;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    bool _2603 = uint(_2573) > 1u;
    bool _2605 = _2457 != 3;
    bool _2607 = !_2589;
    int _2609 = _2607 ? 0 : 1;
    int _2611 = _2551 & 3;
    bool _2613 = _2611 != 0;
    bool _2615 = !_2605;
    int _2617 = _2615 ? 0 : (-1);
    bool _2619 = _2573 != 3;
    float _2621 = _2501 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2623 = _2613 ? 0 : 1;
    float _2625 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2627 = uint(_2573) >= 2u;
    float _2629 = _2621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2631 = ~_2623;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    float _2637 = _2625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2639 = _2635;
    if (!_2603)
    {
        int _2641 = ~_2623;
        int _2643 = _2641 + 1;
        _2639 = _2643;
    }
    int _2645 = _2639;
    int _2647 = ~_1902;
    int _2649 = _2647 + 1;
    int _2651 = _2627 ? 0 : 1;
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2655 = _2653 != 0;
    float _2657 = _2481 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2659 = !_2575;
    int _2661 = _2659 ? 0 : 1;
    int _2663 = _2543 + 8;
    uint _2665 = uint(int(uint(_2663) >> uint(2)));
    uint _2667 = uint(int(uint(int(_2665)) >> uint(2)));
    int _2669 = int(_2665) & 3;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[int(_2667)][_2669];
    int _2673 = int(_2665) + 1;
    uint _2675 = uint(int(uint(_2673) >> uint(2)));
    int _2677 = _2673 & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = _2551 >> 31;
    float _2683 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2685 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2687 = _2685 != 0;
    bool _2689 = _2573 != 3;
    int _2691 = _2649 * _2455;
    int _2693 = _2691 + _2247;
    int _2695 = ~_2651;
    int _2697 = _2695 + 1;
    int _2699 = _2697 + 1;
    int _2701 = _2699;
    if (_2619)
    {
        int _2703 = ~_2651;
        int _2705 = _2703 + 1;
        _2701 = _2705;
    }
    int _2707 = _2701;
    float _2709 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2711 = _2681 & 3;
    bool _2713 = !_2689;
    int _2715 = _2713 ? 0 : (-1);
    float _2717 = _2709 * _323;
    bool _2719 = uint(_2693) >= uint(_1902);
    int _2721 = _2551 + _2711;
    float _2723 = trunc(_2717);
    int _2725 = int(_2723);
    bool _2727 = _323 > 0.5;
    float _2729 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2731 = _397 + 0.5;
    int _2733 = _2721 >> 2;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2737 = abs(_2601);
    float _2739 = fma(_2729, _2731, _701);
    int _2741 = _2733 << 4;
    int _2743 = _2741 + 512;
    float _2745 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2747 = !_2719;
    int _2749 = _2747 ? 0 : (-1);
    out.m_62.x = _2629;
    out.m_62.y = _2637;
    out.m_62.z = _2683;
    out.m_62.w = _2735;
    int _2751 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2753 = _2751 != 0;
    float _2755 = _403 + (-0.5);
    int _2757 = ~_2737;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    float _2763 = -_1864;
    float _2765 = fma(_397, _2763, _2739);
    int _2767 = abs(_2593);
    float _2769 = -_2301;
    float _2771 = -_887;
    float _2773 = fma(_2769, _2755, _2771);
    int _2775 = ~_2455;
    int _2777 = _2775 + _2749;
    int _2779 = _2777 + 1;
    int _2781 = ~_2767;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    int _2787 = abs(_2617);
    int _2789 = _1902 * _2779;
    int _2791 = _2789 + _2247;
    int _2793 = abs(_2571);
    uint _2795 = uint(int(uint(_2743) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    float _2811 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2813 = _2761 * as_type<int>(_2567);
    float _2815 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2817 = -_1093;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2745);
    float _2821 = -_1093;
    float _2823 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2811);
    float _2825 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2827 = _2785 * as_type<int>(_2559);
    int _2829 = _2827 + _2813;
    float _2831 = -_1093;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2815);
    int _2835 = abs(_2539);
    float _2837 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2825);
    float _2839 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2841 = int(_2839);
    int _2843 = _2743 + 8;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    float _2861 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2863 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2865 = ~_2835;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    float _2871 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2861);
    float _2873 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2863);
    int _2875 = _2869 * as_type<int>(_2671);
    int _2877 = _2875 + _2829;
    float _2879 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2823);
    int _2881 = ~_2793;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    float _2887 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2889 = ~_2787;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    float _2895 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2833);
    float _2897 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2819);
    float _2899 = float(uint(_2841));
    float _2901 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2903 = _2893 * as_type<int>(_2679);
    int _2905 = _2903 + _2877;
    int _2907 = abs(_2645);
    float _2909 = 1.0 / _2899;
    float _2911 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2913 = _2905 * _2885;
    int _2915 = ~_2907;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    float _2921 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2901);
    float _2923 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2911);
    int _2925 = _2579 * _2793;
    int _2927 = _2925 + _2913;
    int _2929 = abs(_2661);
    float _2931 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2887);
    int _2933 = abs(_2715);
    float _2935 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2937 = int(_2935);
    float _2939 = float(uint(_2927));
    int _2941 = ~_2929;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    int _2947 = abs(_2841);
    int _2949 = _2919 * as_type<int>(_2809);
    int _2951 = as_type<int>(_2909) + (-2);
    int _2953 = abs(_2707);
    int _2955 = _2945 * as_type<int>(_2801);
    int _2957 = _2955 + _2949;
    int _2959 = abs(_2609);
    float _2961 = as_type<float>(_2951) * _2939;
    float _2963 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2931);
    int _2965 = ~_2953;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    float _2971 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2923);
    int _2973 = ~_2933;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    float _2979 = trunc(_2961);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = float(uint(_2937));
    int _2987 = _2969 * as_type<int>(_2851);
    int _2989 = _2987 + _2957;
    int _2991 = ~_2959;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = abs(_2937);
    int _2999 = _2977 * as_type<int>(_2859);
    int _3001 = _2999 + _2989;
    int _3003 = ~_2841;
    int _3005 = _3003 + 1;
    float _3007 = 1.0 / _2985;
    float _3009 = float(uint(_2947));
    int _3011 = _3001 * _2995;
    float _3013 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2921);
    bool _3015 = !_2149;
    int _3017 = _3015 ? _2791 : (-1);
    float _3019 = 1.0 / _3009;
    float _3021 = float(uint(_2997));
    int _3023 = _3005 * int(_2983);
    int _3025 = _3023 + _2927;
    int _3027 = _2725 << 4;
    int _3029 = _3027 + 1968;
    int _3031 = _3017 * _2959;
    int _3033 = _3031 + _3011;
    int _3035 = abs(_2927);
    float _3037 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2837);
    float _3039 = float(uint(_3025));
    float _3041 = 1.0 / _3021;
    int _3043 = abs(_3033);
    float _3045 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2873);
    int _3047 = as_type<int>(_3007) + (-2);
    float _3049 = as_type<float>(_2951) * _3039;
    float _3051 = float(uint(_3033));
    float _3053 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2871);
    uint _3055 = uint(int(uint(_3029) >> uint(2)));
    uint _3057 = uint(int(uint(int(_3055)) >> uint(2)));
    int _3059 = int(_3055) & 3;
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[int(_3057)][_3059];
    int _3063 = int(_3055) + 1;
    uint _3065 = uint(int(uint(_3063) >> uint(2)));
    int _3067 = _3063 & 3;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[int(_3065)][_3067];
    int _3071 = as_type<int>(_3019) + (-2);
    float _3073 = as_type<float>(_3047) * _3051;
    float _3075 = float(uint(_3035));
    float _3077 = trunc(_3049);
    float _3079 = precise::max(_3077, 0.0);
    uint _3081 = uint(_3079);
    float _3083 = float(uint(_3043));
    out.m_64.x = _3037;
    out.m_64.y = _3053;
    out.m_64.z = _3045;
    bool _3085 = !_2655;
    float _3087 = _3085 ? _201 : as_type<float>(_1892);
    int _3089 = _3029 + 8;
    uint _3091 = uint(int(uint(_3089) >> uint(2)));
    uint _3093 = uint(int(uint(int(_3091)) >> uint(2)));
    int _3095 = int(_3091) & 3;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[int(_3093)][_3095];
    int _3099 = as_type<int>(_3041) + (-2);
    float _3101 = as_type<float>(_3071) * _3075;
    int _3103 = ~_2937;
    int _3105 = _3103 + 1;
    float _3107 = trunc(_3073);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    int _3113 = ~_2947;
    int _3115 = _3113 + 1;
    float _3117 = as_type<float>(_3099) * _3083;
    float _3119 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3121 = ~_2997;
    int _3123 = _3121 + 1;
    float _3125 = -_205;
    int _3127 = _1874 ? as_type<int>(_3125) : as_type<int>(_205);
    float _3129 = fma(_3119, _3119, 1.0);
    float _3131 = trunc(_3101);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    float _3137 = -_201;
    int _3139 = _2727 ? as_type<int>(_3137) : as_type<int>(_201);
    float _3141 = _3119 * _2895;
    bool _3143 = !_2687;
    float _3145 = _3143 ? _205 : as_type<float>(_3127);
    float _3147 = _3119 * _2879;
    float _3149 = _3119 * _2897;
    bool _3151 = !_2753;
    float _3153 = _3151 ? _201 : as_type<float>(_3139);
    float _3155 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3157 = trunc(_3117);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = _3105 * int(_3111);
    int _3165 = _3163 + _3033;
    int _3167 = int(_2983) + int(_3081);
    float _3169 = fma(_3155, _3037, _3147);
    float _3171 = fma(_3155, _3053, _3141);
    int _3173 = ~_2947;
    int _3175 = _3173 + 1;
    float _3177 = fma(_3155, _3045, _3149);
    float _3179 = float(uint(_3165));
    float _3181 = rsqrt(_3129);
    int _3183 = _3115 * int(_3135);
    int _3185 = _3183 + _3035;
    float _3187 = _2963 + _3171;
    float _3189 = as_type<float>(_3047) * _3179;
    float _3191 = _2971 + _3177;
    float _3193 = float(uint(_3185));
    int _3195 = _3123 * int(_3161);
    int _3197 = _3195 + _3043;
    float _3199 = as_type<float>(_3071) * _3193;
    float _3201 = fma(_403, _1870, _2773);
    float _3203 = float(uint(_3197));
    float _3205 = _3061 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3207 = _3119 * _3181;
    float _3209 = trunc(_3199);
    float _3211 = precise::max(_3209, 0.0);
    uint _3213 = uint(_3211);
    float _3215 = as_type<float>(_3099) * _3203;
    float _3217 = _3069 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3219 = -_3013;
    float _3221 = _3207 * _3219;
    float _3223 = -_2971;
    float _3225 = _3207 * _3223;
    float _3227 = _3013 + _3169;
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3231 = fma(_3181, _2879, _3221);
    float _3233 = trunc(_3215);
    float _3235 = precise::max(_3233, 0.0);
    uint _3237 = uint(_3235);
    float _3239 = _3097 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3241 = -_2963;
    float _3243 = _3207 * _3241;
    float _3245 = fma(_3181, _2897, _3225);
    float _3247 = _3205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3249 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3251 = _3239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3253 = ~_2841;
    int _3255 = _3253 + 1;
    float _3257 = trunc(_3189);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    int _3263 = int(_3135) + int(_3213);
    float _3265 = fma(_3181, _2895, _3243);
    out.m_66.x = _3247;
    out.m_66.y = _3249;
    out.m_66.z = _3251;
    out.m_66.w = _3229;
    int _3267 = ~_2937;
    int _3269 = _3267 + 1;
    int _3271 = _3175 * _3263;
    int _3273 = _3271 + _3035;
    int _3275 = _2927 ^ _2841;
    int _3277 = _3255 * _3167;
    int _3279 = _3277 + _2927;
    int _3281 = int(_3161) + int(_3237);
    out.m_68.x = _2765;
    out.m_68.y = _3201;
    bool _3283 = uint(_3279) >= uint(_2841);
    out.m_70.x = _3227;
    out.m_70.y = _3187;
    out.m_70.z = _3191;
    bool _3285 = uint(_3273) >= uint(_2947);
    int _3287 = int(_3111) + int(_3261);
    float _3289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3291 = ~_2997;
    int _3293 = _3291 + 1;
    out.m_72.x = _3231;
    out.m_72.y = _3265;
    out.m_72.z = _3245;
    bool _3295 = !_3283;
    int _3297 = _3295 ? 0 : (-1);
    int _3299 = _3269 * _3287;
    int _3301 = _3299 + _3033;
    int _3303 = ~_3167;
    int _3305 = _3303 + _3297;
    int _3307 = _3305 + 1;
    float _3309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3311 = uint(_3301) >= uint(_2937);
    int _3313 = _3293 * _3281;
    int _3315 = _3313 + _3043;
    bool _3317 = !_3285;
    int _3319 = _3317 ? 0 : (-1);
    int _3321 = _2841 * _3307;
    int _3323 = _3321 + _2927;
    bool _3325 = _2841 == 0;
    bool _3327 = uint(_3315) >= uint(_2997);
    float _3329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3331 = ~_3319;
    int _3333 = _3263 + _3331;
    int _3335 = _3333 + 1;
    bool _3337 = !_3327;
    int _3339 = _3337 ? 0 : (-1);
    uint _3341 = uint(int(uint(_3275) >> uint(31)));
    float _3343 = _3289 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3345 = ~_3339;
    int _3347 = _3281 + _3345;
    int _3349 = _3347 + 1;
    float _3351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3353 = _3033 ^ _2937;
    float _3355 = _3309 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3357 = ~int(_3341);
    int _3359 = _3357 + 1;
    float _3361 = _1215 + (-0.5);
    uint _3363 = uint(int(uint(_3353) >> uint(31)));
    bool _3365 = !_3311;
    int _3367 = _3365 ? 0 : (-1);
    float _3369 = _3329 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3371 = !_3325;
    int _3373 = _3371 ? _3323 : (-1);
    int _3375 = ~int(_3363);
    int _3377 = _3375 + 1;
    int _3379 = _3335 ^ _3359;
    int _3381 = ~_3287;
    int _3383 = _3381 + _3367;
    int _3385 = _3383 + 1;
    float _3387 = _3351 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3389 = float(_3373);
    bool _3391 = _2841 == 0;
    int _3393 = _2937 * _3385;
    int _3395 = _3393 + _3033;
    int _3397 = _3349 ^ _3377;
    float _3399 = fma(_3343, _3389, _833);
    int _3401 = ~_3359;
    int _3403 = _3401 + _3379;
    int _3405 = _3403 + 1;
    bool _3407 = _2937 == 0;
    bool _3409 = _2937 == 0;
    int _3411 = ~_3377;
    int _3413 = _3411 + _3397;
    int _3415 = _3413 + 1;
    bool _3417 = !_3391;
    int _3419 = _3417 ? _3405 : (-1);
    bool _3421 = !_3407;
    int _3423 = _3421 ? _3395 : (-1);
    bool _3425 = !_3409;
    int _3427 = _3425 ? _3415 : (-1);
    float _3429 = float(_3419);
    float _3431 = float(_3423);
    float _3433 = _3153 + 0.5;
    float _3435 = float(_3427);
    float _3437 = -_501;
    float _3439 = fma(_3369, _3429, _3437);
    float _3441 = _3145 + (-0.5);
    float _3443 = fma(_3343, _3433, _3399);
    float _3445 = fma(_3387, _3431, _885);
    float _3447 = -_855;
    float _3449 = fma(_3355, _3435, _3447);
    float _3451 = _3087 + 0.5;
    float _3453 = -_3369;
    float _3455 = fma(_3453, _3441, _3439);
    float _3457 = _1791 + _1767;
    float _3459 = -_3355;
    float _3461 = fma(_3459, _3361, _3449);
    float _3463 = fma(_3387, _3451, _3445);
    float _3465 = -_709;
    float _3467 = _3465 + 1.0;
    float _3469 = _1767 * 0.5;
    float _3471 = _3457 * 0.5;
    float _3473 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3475 = -_3467;
    float _3477 = fma(_3087, _3475, _3463);
    float _3479 = -_851;
    float _3481 = _3479 + 1.0;
    float _3483 = fma(_1813, -0.5, _3469);
    float _3485 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _3487 = _3473 * _1831;
    bool _3489 = _1515 > 0.0;
    bool _3491 = isnan(_1515);
    bool _3493 = _3489 || _3491;
    bool _3495 = isnan(0.0);
    bool _3497 = _3493 || _3495;
    float _3499 = -_1888;
    float _3501 = fma(_3153, _3499, _3443);
    float _3503 = fma(_1215, _3481, _3461);
    float _3505 = _3485 + _1767;
    float _3507 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3509 = _1842 * _3487;
    float _3511 = _1852 * _3487;
    float _3513 = -_3473;
    float _3515 = _3513 + 1.0;
    float _3517 = fma(_3145, _1896, _3455);
    out.gl_Position.x = _1791;
    out.gl_Position.y = _1813;
    out.gl_Position.z = _3485;
    out.gl_Position.w = _1767;
    float _3519 = _3505 * 0.5;
    float _3521 = _3507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3523 = fma(_1848, _3509, _1836);
    float _3525 = fma(_1850, _3509, _1838);
    float _3527 = _1842 * _3515;
    float _3529 = fma(_1842, _3511, _1840);
    out.m_74.x = _3471;
    out.m_74.y = _3483;
    out.m_74.z = _3519;
    out.m_74.w = _1767;
    out.m_76.x = _3501;
    out.m_76.y = _3517;
    out.m_76.z = _3477;
    out.m_76.w = _3503;
    out.m_45.x = _3521;
    out.m_78.x = _3523;
    out.m_78.y = _3525;
    out.m_78.z = _3529;
    out.m_78.w = _3527;
    if (_3497)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3531;
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
        float _3588 = as_type<float>(_113);
        out.gl_Position.z = _3588;
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
        float _3658 = as_type<float>(_151);
        out.gl_Position.z = _3658;
    }
    if (_143)
    {
        return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_52.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = in.m_42.x;
    float _175 = in.m_42.y;
    float _177 = in.m_42.z;
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    float _187 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _189 = 0.0;
    float _191 = _187;
    if (!_165)
    {
        float _193 = _187 * _187;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_181;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_185;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _197;
    if (!_165)
    {
        float _209 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    bool _213 = !_165;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _187 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _187);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_165;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _187 * _253;
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
    float _281 = fma(_271, _167, _275);
    float _283 = fma(_271, _169, _277);
    float _285 = fma(_271, _171, _279);
    float _287 = fma(_281, _155, _173);
    float _289 = fma(_283, _155, _175);
    float _291 = fma(_285, _155, _177);
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
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = 1.0 / _335;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _345 = 1.0 / _339;
    float _347 = _323 * 2.0;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _351 = _329 > 0.5;
    float _353 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _355 = floor(_347);
    float _357 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _359 = _331 > 0.5;
    float _361 = -_201;
    int _363 = _351 ? as_type<int>(_361) : as_type<int>(_201);
    float _365 = -_343;
    float _367 = fma(_357, 2.0, _365);
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _375 = _373 != 0;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _379 = _377 != 0;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _321 + _381;
    float _385 = -_205;
    int _387 = _359 ? as_type<int>(_385) : as_type<int>(_205);
    float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _391 = log2(_389);
    float _393 = _383 * _341;
    bool _395 = !_375;
    float _397 = _395 ? _201 : as_type<float>(_363);
    float _399 = _329 * 2.0;
    bool _401 = !_379;
    float _403 = _401 ? _205 : as_type<float>(_387);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _407 = _321 + _405;
    float _409 = floor(_399);
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _421 = _419 != 0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _321 + _423;
    bool _427 = _355 > 0.0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _431 = _429 != 0;
    bool _433 = _355 >= 0.0;
    bool _435 = isnan(_355);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _453 = _441 ? 0 : 1;
    float _455 = 1.0 / _445;
    bool _457 = !_417;
    int _459 = _457 ? 0 : 1;
    int _461 = ~_453;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    int _467 = _465;
    int _469 = _453;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (!_427)
    {
        int _473 = ~_453;
        int _475 = _473 + 1;
        _467 = _475;
    }
    int _477 = _467;
    if (_431)
    {
        _469 = 0;
    }
    int _479 = _469;
    float _481 = 1.0 / _449;
    bool _483 = _409 >= 0.0;
    bool _485 = isnan(_409);
    bool _487 = _483 || _485;
    bool _489 = isnan(0.0);
    bool _491 = _487 || _489;
    float _493 = fma(_353, -2.0, _451);
    int _495 = _479;
    if (!_431)
    {
        _495 = 1;
    }
    int _497 = _495;
    bool _499 = _409 > 0.0;
    float _501 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    int _503 = _491 ? 0 : 1;
    float _505 = _425 * _455;
    bool _507 = _497 != 1;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _321 + _509;
    int _513 = ~_503;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _331 + _329;
    bool _521 = !_413;
    int _523 = _521 ? 0 : 1;
    float _525 = _511 * _345;
    float _527 = _323 + _329;
    float _529 = _407 * _481;
    float _531 = _323 + _331;
    int _533 = _517;
    int _535 = as_type<int>(_527);
    float _537 = _531;
    if (!_499)
    {
        int _539 = ~_503;
        int _541 = _539 + 1;
        _533 = _541;
    }
    int _543 = _533;
    float _545 = _331 * 2.0;
    float _547 = _527 + (-1.0);
    if (_431)
    {
        _535 = 0;
    }
    int _549 = _535;
    float _551 = _531 + (-1.0);
    float _553 = 0.0;
    int _555 = _549;
    if (!_507)
    {
        _553 = _329;
    }
    float _557 = _553;
    float _559 = _519 + (-1.0);
    float _561 = _557;
    if (!_431)
    {
        _555 = 2;
    }
    int _563 = _555;
    float _565 = floor(_545);
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _569 = !_421;
    int _571 = _569 ? 0 : 1;
    float _573 = 0.0;
    if (!_507)
    {
        _573 = _557;
    }
    float _575 = _573;
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _579 = _575;
    if (!_507)
    {
        _537 = _331;
    }
    float _581 = _537;
    float _583 = 0.0;
    float _585 = _581;
    if (!_507)
    {
        _583 = _331;
    }
    float _587 = _583;
    float _589 = _587;
    if (_507)
    {
        _579 = _323;
    }
    float _591 = _579;
    if (_507)
    {
        _561 = _323;
    }
    float _593 = _561;
    if (_507)
    {
        _585 = _329;
    }
    float _595 = _585;
    float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_507)
    {
        _589 = _329;
    }
    float _599 = _589;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _611 = _609 != 0;
    float _613 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _615 = _563 != 2;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _625 = _565 >= 0.0;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = fma(_619, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _645 = fma(_623, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _647 = _633 ? 0 : 1;
    float _649 = fma(_639, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _651 = fma(_643, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    if (_615)
    {
        _471 = _323;
    }
    float _653 = _471;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    float _659 = _653;
    if (!_615)
    {
        _659 = _331;
    }
    float _661 = _659;
    float _663 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _669 = _565 > 0.0;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _673 = fma(_657, _505, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    bool _679 = !_607;
    int _681 = _679 ? 0 : 1;
    float _683 = -_349;
    float _685 = fma(_671, 2.0, _683);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _689 = fma(_677, _505, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _693 = int(_691);
    float _695 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[83].z, _687);
    float _697 = float(_97);
    float _699 = -_131;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[86].x, _685);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _705 = !_603;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _695);
    int _711 = ~_647;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _703);
    int _719 = _715;
    float _721 = _703;
    if (!_669)
    {
        int _723 = ~_647;
        int _725 = _723 + 1;
        _719 = _725;
    }
    int _727 = _719;
    float _729 = 1.0 / _697;
    if (_615)
    {
        _721 = _329;
    }
    float _731 = _721;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _737 = abs(_681);
    float _739 = fma(_667, _529, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _741 = fma(_735, _529, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _743 = abs(_707);
    float _745 = _731;
    if (!_615)
    {
        _745 = _323;
    }
    float _747 = _745;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _751 = float(_327);
    float _753 = float(_477);
    float _755 = _747 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _757 = 1.0 / _751;
    float _759 = float(_727);
    float _761 = _391 * _131;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _765 = float(_737);
    float _767 = fma(_755, -2.0, _749);
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _771 = float(_743);
    float _773 = exp2(_761);
    float _775 = _765 * _753;
    float _777 = fma(_613, -2.0, _763);
    float _779 = float(_693);
    float _781 = _771 * _759;
    float _783 = -_769;
    float _785 = fma(_597, 2.0, _783);
    float _787 = in.m_56.x;
    float _789 = in.m_56.y;
    float _791 = in.m_56.z;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _795 = 1.0 + _793;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _799 = 1.0 / _779;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = _757 * _131;
    bool _817 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _819 = isnan(0.0);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _825 = _821 || _823;
    float _827 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].w, _803);
    float _829 = 1.0 / _795;
    float _831 = -_131;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[76].x, _367);
    float _835 = -_773;
    float _837 = _835 + 1.0;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _841 = _729 * _131;
    float _843 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _797);
    float _845 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _801);
    float _847 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[88].z, _839);
    float _849 = _825 ? _837 : 0.0;
    float _851 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _717);
    float _853 = _781 * (-2.0);
    float _855 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _777);
    bool _857 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _859 = isnan(_321);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _799 * _131;
    bool _871 = !_611;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _843);
    float _877 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _845);
    float _879 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _847);
    float _881 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _827);
    float _883 = -_131;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[81].x, _785);
    float _887 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _767);
    float _889 = _869;
    if (_813)
    {
        float _891 = _849 * _829;
        _133 = _891;
    }
    float _893 = _133;
    float _895 = fma(_853, _787, _787);
    bool _897 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _899 = isnan(_321);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = fma(_663, _853, _663);
    int _911 = abs(_873);
    float _913 = -_867;
    float _915 = _913 + 1.0;
    bool _917 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _919 = isnan(_321);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = _323 + (-0.5);
    float _931 = -_907;
    float _933 = _931 + 1.0;
    float _935 = _907 * _915;
    bool _937 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _939 = isnan(_321);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[196].x, _895);
    float _951 = -_927;
    float _953 = _951 + 1.0;
    float _955 = float(_543);
    float _957 = _927 * _933;
    bool _959 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _961 = isnan(_321);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _947 * _953;
    float _973 = _775 * (-2.0);
    float _975 = -_947;
    float _977 = _975 + 1.0;
    float _979 = float(_911);
    float _981 = fma(_909, _893, _949);
    float _983 = _329 + (-0.5);
    float _985 = fma(_973, _789, _789);
    float _987 = _969 * _977;
    float _989 = _979 * _955;
    float _991 = _981 * 0.15915493667125701904296875;
    float _993 = fma(_577, _973, _577);
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].y, _985);
    float _997 = _649 * _987;
    float _999 = -_969;
    float _1001 = _999 + 1.0;
    float _1003 = _635 * _987;
    float _1005 = _989 * (-2.0);
    float _1007 = fma(_993, _893, _995);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[143].x, _997);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1003);
    float _1013 = in.m_52.x;
    float _1015 = in.m_52.y;
    float _1017 = fma(_1005, _791, _791);
    float _1019 = _331 + (-0.5);
    float _1021 = fma(_567, _1005, _567);
    float _1023 = fma(_645, _971, _1011);
    float _1025 = fma(_651, _971, _1009);
    float _1027 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1017);
    float _1029 = _1007 * 0.15915493667125701904296875;
    float _1031 = fma(_689, _957, _1023);
    float _1033 = fma(_673, _957, _1025);
    float _1035 = fma(_1021, _893, _1027);
    float _1037 = _991 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = fma(_741, _935, _1031);
    float _1043 = fma(_739, _935, _1033);
    float _1045 = _1035 * 0.15915493667125701904296875;
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1049 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1041);
    float _1051 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1043);
    float _1053 = in.m_54.w;
    float _1055 = _1029 * 6.283185482025146484375;
    float _1057 = sin(_1055);
    float _1059 = _1049 * _1015;
    float _1061 = _1051 * _1013;
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1065 = _1029 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1073 = _1069 * _1047;
    float _1075 = _1071 * _1063;
    float _1077 = _991 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1039 * _1057;
    bool _1083 = _1053 > 0.5;
    float _1085 = _1045 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1039 * _1067;
    float _1091 = _1045 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = _1079 * _1057;
    float _1097 = _1079 * _1067;
    float _1099 = _1039 * _1087;
    float _1101 = _1079 * _1087;
    float _1103 = _1067 * _1087;
    float _1105 = _1057 * _1087;
    float _1107 = _1099 * _1073;
    float _1109 = _1101 * _1073;
    float _1111 = fma(_1093, _1089, _1095);
    float _1113 = -_1081;
    float _1115 = fma(_1093, _1097, _1113);
    float _1117 = fma(_1093, _1095, _1089);
    float _1119 = -_1097;
    float _1121 = fma(_1093, _1081, _1119);
    float _1123 = -_1073;
    float _1125 = _1093 * _1123;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = fma(_1111, _1075, _1107);
    float _1131 = fma(_1115, _1075, _1109);
    float _1133 = fma(_1103, _1075, _1125);
    float _1135 = fma(_1121, _1127, _1129);
    float _1137 = fma(_1117, _1127, _1131);
    float _1139 = fma(_1105, _1127, _1133);
    float _1141 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1141);
    float _1151 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    float _1153 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1145);
    float _1155 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1157 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1149);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1151);
    float _1161 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1153);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1155);
    float _1165 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1169 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1171 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1175 = _1165 + _1167;
    float _1177 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1169);
    float _1179 = _1171 + _1173;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1175 + _1181;
    float _1185 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1177);
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1179 + _1187;
    float _1191 = _1183 * _1183;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1195 = fma(_1189, _1189, _1191);
    float _1197 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1199 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1201 = sqrt(_1195);
    float _1203 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1197);
    float _1205 = -_205;
    int _1207 = _1083 ? as_type<int>(_1205) : as_type<int>(_205);
    float _1209 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1199);
    float _1211 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1203);
    bool _1213 = !_371;
    float _1215 = _1213 ? _205 : as_type<float>(_1207);
    float _1217 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1209);
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1225 = _1223 != 0;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    float _1235 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1239 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1241 = 1.0 / _1235;
    float _1243 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1237);
    bool _1245 = !_1225;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = _1239 + _1235;
    bool _1251 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1243);
    bool _1255 = !_1221;
    int _1257 = _1255 ? 0 : 1;
    bool _1259 = !_1229;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1267 = isnan(0.5);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1273 = _1269 || _1271;
    bool _1275 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1277 = isnan(0.5);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1283 = _1279 || _1281;
    float _1285 = _1193 + _1263;
    bool _1287 = !_1233;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = _1249 * _1241;
    float _1293 = _1291 * 0.5;
    float _1295 = _1253;
    float _1297 = _1263;
    float _1299 = _1175;
    float _1301 = _1235;
    float _1303 = _1241;
    float _1305 = _1195;
    float _1307 = _1183;
    float _1309 = _1005;
    if (!_1251)
    {
        _1295 = _1179;
    }
    float _1311 = _1295;
    float _1313 = _1311;
    if (!_1251)
    {
        _1297 = _1285;
    }
    float _1315 = _1297;
    bool _1317 = !_1251;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1201 + _1323;
        float _1327 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1195);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1337 + (-1.0);
        float _1345 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = fma(_1341, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1349 = fma(_1285, _1337, _1345);
        float _1351 = _1329 * _1347;
        float _1353 = fma(_1189, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1355 = fma(_1183, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1355;
        _1301 = _1333;
        _1313 = _1353;
        _1319 = _1349;
        _1303 = _1345;
        _1305 = _1329;
    }
    float _1357 = _1299;
    float _1359 = _1301;
    float _1361 = _1313;
    float _1363 = _1319;
    float _1365 = _1303;
    float _1367 = _1305;
    float _1369 = _1365;
    float _1371 = _1363;
    float _1373 = _1361;
    float _1375 = _1367;
    float _1377 = _1359;
    if (_1283)
    {
        _1307 = 1.0;
    }
    float _1379 = _1307;
    float _1381 = _1379;
    if (_1273)
    {
        _1369 = _1357;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (!_1273)
    {
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1389 = _1193 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1393 = _1171 + _1391;
        float _1395 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1397 = -_1171;
        float _1399 = _1397 + _1361;
        float _1401 = _1389 * _1389;
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1405 = _1165 + _1403;
        float _1407 = -_1193;
        float _1409 = _1407 + _1363;
        float _1411 = -_1165;
        float _1413 = _1411 + _1357;
        float _1415 = fma(_1393, _1393, _1401);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = fma(_1405, _1405, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1425 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1427 = _1425 * _1417;
        float _1429 = _1423 * _1427;
        float _1431 = fma(_1399, _1429, _1171);
        float _1433 = fma(_1409, _1429, _1193);
        float _1435 = fma(_1413, _1429, _1165);
        _1371 = _1433;
        _1373 = _1431;
        _1385 = _1435;
        _1375 = _1427;
        _1377 = _1395;
    }
    float _1437 = _1371;
    float _1439 = _1373;
    float _1441 = _1385;
    float _1443 = _1375;
    float _1445 = _1377;
    float _1447 = _1443;
    float _1449 = _1445;
    if (!_1283)
    {
        float _1451 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1459 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1457);
        float _1461 = _1453 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1455 * 0.15915493667125701904296875;
        float _1467 = _1453 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = 1.0 / _1463;
        float _1473 = _1465 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = _1465 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1483;
        float _1487 = _1475 * _1477;
        float _1489 = 1.0 / _1459;
        float _1491 = 1.0 / _1487;
        float _1493 = 1.0 / _1485;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1497 = _1489 * _1495;
        float _1499 = _1481 * _1491;
        float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1503 = fma(_1499, _1497, _1501);
        float _1505 = _1503 * _1493;
        float _1507 = precise::clamp(_1505, 0.0, 1.0);
        float _1509 = -_1507;
        float _1511 = _1509 + 1.0;
        _1447 = _1477;
        _1381 = _1511;
    }
    float _1513 = _1447;
    float _1515 = _1381;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1519 = _1437 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1523 = _1439 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1441 + _1525;
    float _1529 = _1519 * _1519;
    float _1531 = fma(_1523, _1523, _1529);
    float _1533 = fma(_1527, _1527, _1531);
    float _1535 = rsqrt(_1533);
    float _1537 = sqrt(_1533);
    float _1539 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1541 = _1523 * _1539;
    float _1543 = _1527 * _1539;
    float _1545 = _1541 * _1541;
    float _1547 = _1543 * _1543;
    float _1549 = _1545 + _1547;
    float _1551 = sqrt(_1549);
    bool _1553 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = _1551 + _1555;
    float _1559 = _1535;
    float _1561 = _1549;
    float _1563 = _1557;
    float _1565 = _1513;
    float _1567 = _1519;
    if (_1553)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1559 = _1569;
    }
    float _1571 = _1559;
    if (_1553)
    {
        float _1573 = rsqrt(_1549);
        _1561 = _1573;
    }
    float _1575 = _1561;
    if (_1553)
    {
        float _1577 = _1557 * _1571;
        _1563 = _1577;
    }
    float _1579 = _1563;
    if (_1553)
    {
        float _1581 = _1579 * 0.15915493667125701904296875;
        _1565 = _1581;
    }
    float _1583 = _1565;
    float _1585 = _1527;
    float _1587 = _1583;
    if (_1553)
    {
        float _1589 = _1583 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        _1585 = _1591;
    }
    float _1593 = _1585;
    float _1595 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1597 = precise::max(0.0, _1595);
    float _1599 = _1571;
    float _1601 = _1597;
    if (_1553)
    {
        float _1603 = _1583 * 6.283185482025146484375;
        float _1605 = cos(_1603);
        _1599 = _1605;
    }
    float _1607 = _1599;
    float _1609 = -_1539;
    float _1611 = -_1597;
    float _1613 = fma(_1519, _1609, _1611);
    if (_1553)
    {
        float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1567 = _1615;
    }
    float _1617 = _1567;
    float _1619 = _1617;
    if (!_1553)
    {
        _1587 = _1545;
    }
    float _1621 = _1587;
    float _1623 = _1593;
    float _1625 = _1621;
    if (_1553)
    {
        float _1627 = fma(_1593, _1617, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1629;
    if (!_1553)
    {
        _1619 = _1613;
    }
    float _1633 = _1619;
    float _1635 = _1633;
    float _1637 = _1607;
    if (_1553)
    {
        float _1639 = _1607 + (-1.0);
        _1601 = _1639;
    }
    float _1641 = _1601;
    float _1643 = _1641;
    if (_1553)
    {
        float _1645 = _1575 * _1629;
        _1309 = _1645;
    }
    float _1647 = _1309;
    if (!_1553)
    {
        _1631 = _1541;
    }
    float _1649 = _1631;
    float _1651 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1653 = _1649;
    if (_1553)
    {
        float _1655 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1655;
    }
    float _1657 = _1449;
    if (_1553)
    {
        float _1659 = _1541 * _1647;
        _1653 = _1659;
    }
    float _1661 = _1653;
    if (!_1553)
    {
        _1643 = _1543;
    }
    float _1663 = _1643;
    float _1665 = _1663;
    if (_1553)
    {
        float _1667 = _1543 * _1647;
        _1665 = _1667;
    }
    float _1669 = _1665;
    if (_1553)
    {
        float _1671 = fma(_1613, _1607, _1657);
        _1635 = _1671;
    }
    float _1673 = _1635;
    if (_1553)
    {
        float _1675 = _1661 * _1661;
        _1625 = _1675;
    }
    float _1677 = _1625;
    if (!_1553)
    {
        _1637 = _1547;
    }
    float _1679 = _1637;
    float _1681 = _1679;
    if (_1553)
    {
        float _1683 = _1669 * _1669;
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = fma(_1673, _1673, _1677);
    float _1689 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    float _1691 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1693 = _1687 + _1685;
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1697 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1695);
    float _1699 = precise::clamp(_1697, 0.0, 1.0);
    float _1701 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1703 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1689);
    float _1705 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1707 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1691);
    float _1709 = rsqrt(_1693);
    float _1711 = -_1699;
    float _1713 = _1711 + 1.0;
    float _1715 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1717 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1705);
    float _1719 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1707);
    float _1721 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1725 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1717);
    float _1727 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1729 = abs(_1713);
    float _1731 = log2(_1729);
    float _1733 = -_1723;
    float _1735 = fma(_1733, _1701, 1.0);
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1741 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1721);
    float _1743 = _1709 * _1661;
    float _1745 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1739);
    float _1747 = _1709 * _1673;
    float _1749 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1741);
    float _1751 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1753 = _1709 * _1669;
    float _1755 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1745);
    float _1757 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1759 = -_1751;
    float _1761 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1759);
    float _1763 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1765 = log2(_1735);
    float _1767 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1755);
    float _1769 = -_1753;
    float _1771 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1761);
    float _1773 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1775 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1777 = fma(_1771, -0.5, 0.5);
    float _1779 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1773);
    float _1781 = exp2(_1763);
    float _1783 = fma(_1771, 0.5, 0.5);
    float _1785 = _1747 + 1.0;
    float _1787 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1779);
    float _1789 = fma(_1783, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1791 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1787);
    float _1793 = 1.0 / _1767;
    float _1795 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1775);
    float _1797 = fma(_1783, _1789, -0.212114393711090087890625);
    float _1799 = _1765 * 0.693147182464599609375;
    float _1801 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1795);
    float _1803 = fma(_1783, _1797, 1.570728778839111328125);
    float _1805 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1807 = sqrt(_1777);
    float _1809 = -_1747;
    float _1811 = fma(_1781, _1785, _1809);
    float _1813 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    float _1815 = _1791 * _1793;
    float _1817 = _1813 * _1793;
    float _1819 = fma(_1815, 0.5, 0.5);
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1811, 0.5, 0.5);
    float _1825 = _1807 * 0.636619746685028076171875;
    float _1827 = -_1803;
    float _1829 = fma(_1825, _1827, 1.0);
    float3 _6282 = float3(_1819, _1821, _1805);
    float _1831 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6282, float3(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6282, float3(0.0), isnan(_6282)), level(0.0)).x;
    float3 _6293 = float3(_1819, _1821, _1805);
    float4 _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).xyzw;
    float _1836 = _1834.x;
    float _1838 = _1834.y;
    float _1840 = _1834.z;
    float _1842 = _1834.w;
    float2 _6310 = float2(_1829, _1823);
    float3 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).xyz;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1856 = int(_1854);
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1860 = _1858 != 0;
    float _1862 = -_879;
    float _1864 = _1862 + 1.0;
    int _1866 = abs(_1247);
    float _1868 = -_881;
    float _1870 = _1868 + 1.0;
    int _1872 = abs(_1257);
    out.m_58.x = _1439;
    out.m_58.y = _1437;
    out.m_58.z = _1441;
    bool _1874 = _329 > 0.5;
    float _1876 = trunc(_815);
    int _1878 = int(_1876);
    bool _1880 = _331 > 0.5;
    float _1882 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1884 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1886 = -_875;
    float _1888 = _1886 + 1.0;
    float _1890 = -_201;
    int _1892 = _1880 ? as_type<int>(_1890) : as_type<int>(_201);
    float _1894 = -_877;
    float _1896 = _1894 + 1.0;
    float _1898 = float(uint(_1856));
    float _1900 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1902 = int(_1900);
    float _1904 = trunc(_869);
    int _1906 = int(_1904);
    float _1908 = float(uint(_1878));
    float _1910 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1884);
    float _1912 = _1805;
    if (_1860)
    {
        _1912 = 1.0;
    }
    float _1914 = _1912;
    float _1916 = _1914;
    if (!_1860)
    {
        _1916 = 7.345489978790283203125;
    }
    float _1918 = _1916;
    float _1920 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1910);
    int _1922 = ~_1856;
    int _1924 = _1922 + 1;
    float _1926 = 1.0 / _1898;
    float _1928 = float(uint(_1902));
    float _1930 = _1918 * _323;
    if (_1860)
    {
        _889 = _323;
    }
    float _1932 = _889;
    float _1934 = _1932;
    if (!_1860)
    {
        _1934 = _329;
    }
    float _1936 = _1934;
    bool _1938 = _1856 == 0;
    float _1940 = 1.0 / _1928;
    float _1942 = float(uint(_1906));
    int _1944 = as_type<int>(_1926) + (-2);
    float _1946 = floor(_1930);
    float _1948 = as_type<float>(_1944) * _1908;
    int _1950 = ~_1856;
    int _1952 = _1950 + 1;
    int _1954 = as_type<int>(_1940) + (-2);
    float _1956 = exp2(_1882);
    float _1958 = trunc(_1948);
    float _1960 = precise::max(_1958, 0.0);
    uint _1963 = uint(_1960);
    float _1965 = -_1946;
    float _1967 = _1930 + _1965;
    float _1969 = -_1956;
    float _1971 = _1969 + 1.0;
    int _1973 = _1952 * int(_1963);
    int _1975 = _1973 + _1878;
    float _1977 = as_type<float>(_1954) * _1942;
    int _1979 = ~_1902;
    int _1981 = _1979 + 1;
    float _1983 = float(uint(_1975));
    float _1985 = trunc(_1977);
    float _1987 = precise::max(_1985, 0.0);
    uint _1989 = uint(_1987);
    float _1991 = as_type<float>(_1975);
    if (_1860)
    {
        _1991 = 1.0;
    }
    float _1993 = _1991;
    float _1995 = as_type<float>(_1944) * _1983;
    float _1997 = _1993;
    if (!_1860)
    {
        _1997 = 1.2345600128173828125;
    }
    float _1999 = _1997;
    int _2001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2003 = _2001 != 0;
    float _2005 = trunc(_1995);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    float _2011 = _1999 * _1936;
    float _2013 = float(_1856);
    int _2015 = _1981 * int(_1989);
    int _2017 = _2015 + _1906;
    float _2019 = floor(_2011);
    float _2021 = float(uint(_2017));
    int _2023 = int(_1963) + int(_2009);
    float _2025 = as_type<float>(_1954) * _2021;
    float _2027 = float(_1878);
    int _2029 = _1924 * _2023;
    int _2031 = _2029 + _1878;
    float _2033 = trunc(_2025);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = _2027 >= _2013;
    bool _2041 = isnan(_2027);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan(_2013);
    bool _2047 = _2043 || _2045;
    float _2049 = float(_2047);
    float _2051 = -_2019;
    float _2053 = _2011 + _2051;
    int _2055 = _1856 + (-1);
    bool _2057 = uint(_2031) >= uint(_1856);
    float _2059 = trunc(_2049);
    int _2061 = int(_2059);
    bool _2063 = !_2057;
    int _2065 = _2063 ? 0 : (-1);
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2069 = _2067 != 0;
    int _2071 = ~_2023;
    int _2073 = _2071 + _2065;
    int _2075 = _2073 + 1;
    float _2077 = float(_1902);
    int _2079 = int(_1989) + int(_2037);
    int _2081 = _1856 * _2075;
    int _2083 = _2081 + _1878;
    int _2085 = ~_1902;
    int _2087 = _2085 + 1;
    float _2089 = _1967 * _2013;
    float _2091 = float(_1906);
    float _2093 = _2013 * _841;
    bool _2095 = !_1938;
    int _2097 = _2095 ? _2083 : (-1);
    int _2099 = _2087 * _2079;
    int _2101 = _2099 + _1906;
    int _2103 = ~_2061;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    float _2109 = trunc(_2089);
    int _2111 = int(_2109);
    bool _2113 = _2091 >= _2077;
    bool _2115 = isnan(_2091);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(_2077);
    bool _2121 = _2117 || _2119;
    float _2123 = float(_2121);
    float _2125 = _2077 * _841;
    bool _2127 = !_2069;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = _2097 * _2107;
    bool _2133 = uint(_2101) >= uint(_1902);
    int _2135 = abs(_459);
    int _2137 = _2061 * _2055;
    int _2139 = _2137 + _2131;
    bool _2141 = !_2133;
    int _2143 = _2141 ? 0 : (-1);
    float _2145 = trunc(_2093);
    int _2147 = int(_2145);
    bool _2149 = _1902 == 0;
    int _2151 = _2139 * _2135;
    int _2153 = ~_2079;
    int _2155 = _2153 + _2143;
    int _2157 = _2155 + 1;
    float _2159 = _2053 * _2077;
    int _2161 = abs(_2129);
    int _2163 = abs(_571);
    float _2165 = trunc(_2123);
    int _2167 = int(_2165);
    int _2169 = _1902 * _2157;
    int _2171 = _2169 + _1906;
    int _2173 = abs(_523);
    int _2175 = _2111 * _2161;
    int _2177 = _2175 + _1878;
    bool _2179 = !_2003;
    int _2181 = _2179 ? 0 : 1;
    bool _2183 = !_2149;
    int _2185 = _2183 ? _2171 : (-1);
    int _2187 = _2147 * _2173;
    int _2189 = _2187 + _2151;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2193 = _2191 != 0;
    float _2195 = trunc(_2159);
    int _2197 = int(_2195);
    int _2199 = abs(_2181);
    int _2201 = _2177 * _2163;
    int _2203 = _2201 + _2189;
    bool _2205 = !_2193;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = ~_2167;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    int _2215 = _2111 * _2199;
    int _2217 = _2215 + _2203;
    int _2219 = abs(_2207);
    float _2221 = trunc(_2125);
    int _2223 = int(_2221);
    int _2225 = _2185 * _2213;
    int _2227 = _1902 + (-1);
    int _2229 = ~_1856;
    int _2231 = _2229 + 1;
    int _2233 = _2167 * _2227;
    int _2235 = _2233 + _2225;
    float _2237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2239 = float(uint(_2217));
    int _2241 = _2235 * _1866;
    int _2243 = abs(_1261);
    int _2245 = _2197 * _2219;
    int _2247 = _2245 + _1906;
    int _2249 = abs(_1289);
    float _2251 = as_type<float>(_1944) * _2239;
    int _2253 = _2223 * _1872;
    int _2255 = _2253 + _2241;
    int _2257 = ~_1856;
    int _2259 = _2257 + 1;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2263 = ~_1856;
    int _2265 = _2263 + 1;
    int _2267 = _2247 * _2243;
    int _2269 = _2267 + _2255;
    float _2271 = float(uint(_2177));
    int _2273 = ~_1902;
    int _2275 = _2273 + 1;
    int _2277 = _2197 * _2249;
    int _2279 = _2277 + _2269;
    float _2281 = trunc(_2251);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = as_type<float>(_1944) * _2271;
    float _2289 = float(uint(_2279));
    float _2291 = trunc(_2287);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    float _2297 = as_type<float>(_1954) * _2289;
    float _2299 = float(uint(_2247));
    float _2301 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2303 = as_type<float>(_1954) * _2299;
    int _2305 = _2259 * int(_2285);
    int _2307 = _2305 + _2217;
    float _2309 = trunc(_2297);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    float _2315 = float(uint(_2307));
    int _2317 = _2265 * int(_2295);
    int _2319 = _2317 + _2177;
    float _2321 = trunc(_2303);
    float _2323 = precise::max(_2321, 0.0);
    uint _2325 = uint(_2323);
    float _2327 = as_type<float>(_1944) * _2315;
    float _2329 = float(uint(_2319));
    float _2331 = trunc(_2327);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = _2275 * int(_2313);
    int _2339 = _2337 + _2279;
    float _2341 = as_type<float>(_1944) * _2329;
    int _2343 = ~_1902;
    int _2345 = _2343 + 1;
    float _2347 = float(uint(_2339));
    float _2349 = trunc(_2341);
    float _2351 = precise::max(_2349, 0.0);
    uint _2353 = uint(_2351);
    int _2355 = int(_2285) + int(_2335);
    float _2357 = as_type<float>(_1954) * _2347;
    int _2359 = _2345 * int(_2325);
    int _2361 = _2359 + _2247;
    float _2363 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2365 = _2231 * _2355;
    int _2367 = _2365 + _2217;
    float _2369 = trunc(_2357);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = float(uint(_2361));
    float _2377 = _2363 * _323;
    int _2379 = int(_2295) + int(_2353);
    bool _2381 = uint(_2367) >= uint(_1856);
    float _2383 = as_type<float>(_1954) * _2375;
    int _2385 = ~_1856;
    int _2387 = _2385 + 1;
    bool _2389 = !_2381;
    int _2391 = _2389 ? 0 : (-1);
    float _2393 = trunc(_2383);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    int _2399 = ~_2355;
    int _2401 = _2399 + _2391;
    int _2403 = _2401 + 1;
    int _2405 = ~_1902;
    int _2407 = _2405 + 1;
    int _2409 = _2387 * _2379;
    int _2411 = _2409 + _2177;
    int _2413 = int(_2313) + int(_2373);
    int _2415 = _1856 * _2403;
    int _2417 = _2415 + _2217;
    float _2419 = trunc(_2377);
    int _2421 = int(_2419);
    bool _2423 = uint(_2411) >= uint(_1856);
    float _2425 = -_205;
    float _2427 = _2425 + 0.5;
    bool _2429 = !_1938;
    int _2431 = _2429 ? _2417 : (-1);
    int _2433 = _2407 * _2413;
    int _2435 = _2433 + _2279;
    bool _2437 = !_2423;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = _201 + 0.5;
    int _2443 = _2431 & 3;
    bool _2445 = _2443 != 0;
    int _2447 = ~_2379;
    int _2449 = _2447 + _2439;
    int _2451 = _2449 + 1;
    bool _2453 = uint(_2435) >= uint(_1902);
    out.m_60.x = _2441;
    out.m_60.y = _2427;
    int _2455 = int(_2325) + int(_2397);
    int _2457 = _2431 & 3;
    bool _2459 = _2457 != 0;
    int _2461 = _2421 << 4;
    int _2463 = _2461 + 1712;
    int _2465 = _1856 * _2451;
    int _2467 = _2465 + _2177;
    bool _2469 = !_2453;
    int _2471 = _2469 ? 0 : (-1);
    int _2473 = _2463 + 8;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
    int _2479 = int(_2475) & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    bool _2483 = uint(_2457) >= 2u;
    int _2485 = ~_2413;
    int _2487 = _2485 + _2471;
    int _2489 = _2487 + 1;
    int _2491 = _2431 >> 31;
    int _2493 = _2483 ? 0 : 1;
    uint _2495 = uint(int(uint(_2463) >> uint(2)));
    uint _2497 = uint(int(uint(int(_2495)) >> uint(2)));
    int _2499 = int(_2495) & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = int(_2495) + 1;
    uint _2505 = uint(int(uint(_2503) >> uint(2)));
    int _2507 = _2503 & 3;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[int(_2505)][_2507];
    bool _2511 = _2457 != 3;
    int _2513 = _1902 * _2489;
    int _2515 = _2513 + _2279;
    int _2517 = _2491 & 3;
    int _2519 = _2445 ? 0 : 1;
    int _2521 = _2431 + _2517;
    bool _2523 = uint(_2457) > 1u;
    int _2525 = _2521 >> 2;
    int _2527 = ~_2493;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2511)
    {
        int _2535 = ~_2493;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = _2525 << 4;
    int _2543 = _2541 + 368;
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2547 = _2545 != 0;
    bool _2549 = !_2149;
    int _2551 = _2549 ? _2515 : (-1);
    uint _2553 = uint(int(uint(_2543) >> uint(2)));
    uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
    int _2557 = int(_2553) & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = int(_2553) + 1;
    uint _2563 = uint(int(uint(_2561) >> uint(2)));
    int _2565 = _2561 & 3;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[int(_2563)][_2565];
    bool _2569 = !_2547;
    int _2571 = _2569 ? 0 : 1;
    int _2573 = _2551 & 3;
    bool _2575 = _2573 != 0;
    bool _2577 = !_1938;
    int _2579 = _2577 ? _2467 : (-1);
    int _2581 = ~_2519;
    int _2583 = _2581 + 1;
    int _2585 = _2583 + 1;
    int _2587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2589 = _2587 != 0;
    bool _2591 = !_2459;
    int _2593 = _2591 ? 0 : 1;
    int _2595 = _2585;
    if (!_2523)
    {
        int _2597 = ~_2519;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    bool _2603 = uint(_2573) > 1u;
    bool _2605 = _2457 != 3;
    bool _2607 = !_2589;
    int _2609 = _2607 ? 0 : 1;
    int _2611 = _2551 & 3;
    bool _2613 = _2611 != 0;
    bool _2615 = !_2605;
    int _2617 = _2615 ? 0 : (-1);
    bool _2619 = _2573 != 3;
    float _2621 = _2501 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2623 = _2613 ? 0 : 1;
    float _2625 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2627 = uint(_2573) >= 2u;
    float _2629 = _2621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2631 = ~_2623;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    float _2637 = _2625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2639 = _2635;
    if (!_2603)
    {
        int _2641 = ~_2623;
        int _2643 = _2641 + 1;
        _2639 = _2643;
    }
    int _2645 = _2639;
    int _2647 = ~_1902;
    int _2649 = _2647 + 1;
    int _2651 = _2627 ? 0 : 1;
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2655 = _2653 != 0;
    float _2657 = _2481 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2659 = !_2575;
    int _2661 = _2659 ? 0 : 1;
    int _2663 = _2543 + 8;
    uint _2665 = uint(int(uint(_2663) >> uint(2)));
    uint _2667 = uint(int(uint(int(_2665)) >> uint(2)));
    int _2669 = int(_2665) & 3;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[int(_2667)][_2669];
    int _2673 = int(_2665) + 1;
    uint _2675 = uint(int(uint(_2673) >> uint(2)));
    int _2677 = _2673 & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = _2551 >> 31;
    float _2683 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2685 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2687 = _2685 != 0;
    bool _2689 = _2573 != 3;
    int _2691 = _2649 * _2455;
    int _2693 = _2691 + _2247;
    int _2695 = ~_2651;
    int _2697 = _2695 + 1;
    int _2699 = _2697 + 1;
    int _2701 = _2699;
    if (_2619)
    {
        int _2703 = ~_2651;
        int _2705 = _2703 + 1;
        _2701 = _2705;
    }
    int _2707 = _2701;
    float _2709 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2711 = _2681 & 3;
    bool _2713 = !_2689;
    int _2715 = _2713 ? 0 : (-1);
    float _2717 = _2709 * _323;
    bool _2719 = uint(_2693) >= uint(_1902);
    int _2721 = _2551 + _2711;
    float _2723 = trunc(_2717);
    int _2725 = int(_2723);
    bool _2727 = _323 > 0.5;
    float _2729 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2731 = _397 + 0.5;
    int _2733 = _2721 >> 2;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2737 = abs(_2601);
    float _2739 = fma(_2729, _2731, _701);
    int _2741 = _2733 << 4;
    int _2743 = _2741 + 512;
    float _2745 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2747 = !_2719;
    int _2749 = _2747 ? 0 : (-1);
    out.m_62.x = _2629;
    out.m_62.y = _2637;
    out.m_62.z = _2683;
    out.m_62.w = _2735;
    int _2751 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2753 = _2751 != 0;
    float _2755 = _403 + (-0.5);
    int _2757 = ~_2737;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    float _2763 = -_1864;
    float _2765 = fma(_397, _2763, _2739);
    int _2767 = abs(_2593);
    float _2769 = -_2301;
    float _2771 = -_887;
    float _2773 = fma(_2769, _2755, _2771);
    int _2775 = ~_2455;
    int _2777 = _2775 + _2749;
    int _2779 = _2777 + 1;
    int _2781 = ~_2767;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    int _2787 = abs(_2617);
    int _2789 = _1902 * _2779;
    int _2791 = _2789 + _2247;
    int _2793 = abs(_2571);
    uint _2795 = uint(int(uint(_2743) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    float _2811 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2813 = _2761 * as_type<int>(_2567);
    float _2815 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2817 = -_1093;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2745);
    float _2821 = -_1093;
    float _2823 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2811);
    float _2825 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2827 = _2785 * as_type<int>(_2559);
    int _2829 = _2827 + _2813;
    float _2831 = -_1093;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2815);
    int _2835 = abs(_2539);
    float _2837 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2825);
    float _2839 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2841 = int(_2839);
    int _2843 = _2743 + 8;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    float _2861 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2863 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2865 = ~_2835;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    float _2871 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2861);
    float _2873 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2863);
    int _2875 = _2869 * as_type<int>(_2671);
    int _2877 = _2875 + _2829;
    float _2879 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2823);
    int _2881 = ~_2793;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    float _2887 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2889 = ~_2787;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    float _2895 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2833);
    float _2897 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2819);
    float _2899 = float(uint(_2841));
    float _2901 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2903 = _2893 * as_type<int>(_2679);
    int _2905 = _2903 + _2877;
    int _2907 = abs(_2645);
    float _2909 = 1.0 / _2899;
    float _2911 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2913 = _2905 * _2885;
    int _2915 = ~_2907;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    float _2921 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2901);
    float _2923 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2911);
    int _2925 = _2579 * _2793;
    int _2927 = _2925 + _2913;
    int _2929 = abs(_2661);
    float _2931 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2887);
    int _2933 = abs(_2715);
    float _2935 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2937 = int(_2935);
    float _2939 = float(uint(_2927));
    int _2941 = ~_2929;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    int _2947 = abs(_2841);
    int _2949 = _2919 * as_type<int>(_2809);
    int _2951 = as_type<int>(_2909) + (-2);
    int _2953 = abs(_2707);
    int _2955 = _2945 * as_type<int>(_2801);
    int _2957 = _2955 + _2949;
    int _2959 = abs(_2609);
    float _2961 = as_type<float>(_2951) * _2939;
    float _2963 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2931);
    int _2965 = ~_2953;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    float _2971 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2923);
    int _2973 = ~_2933;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    float _2979 = trunc(_2961);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = float(uint(_2937));
    int _2987 = _2969 * as_type<int>(_2851);
    int _2989 = _2987 + _2957;
    int _2991 = ~_2959;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = abs(_2937);
    int _2999 = _2977 * as_type<int>(_2859);
    int _3001 = _2999 + _2989;
    int _3003 = ~_2841;
    int _3005 = _3003 + 1;
    float _3007 = 1.0 / _2985;
    float _3009 = float(uint(_2947));
    int _3011 = _3001 * _2995;
    float _3013 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2921);
    bool _3015 = !_2149;
    int _3017 = _3015 ? _2791 : (-1);
    float _3019 = 1.0 / _3009;
    float _3021 = float(uint(_2997));
    int _3023 = _3005 * int(_2983);
    int _3025 = _3023 + _2927;
    int _3027 = _2725 << 4;
    int _3029 = _3027 + 1968;
    int _3031 = _3017 * _2959;
    int _3033 = _3031 + _3011;
    int _3035 = abs(_2927);
    float _3037 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2837);
    float _3039 = float(uint(_3025));
    float _3041 = 1.0 / _3021;
    int _3043 = abs(_3033);
    float _3045 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2873);
    int _3047 = as_type<int>(_3007) + (-2);
    float _3049 = as_type<float>(_2951) * _3039;
    float _3051 = float(uint(_3033));
    float _3053 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2871);
    uint _3055 = uint(int(uint(_3029) >> uint(2)));
    uint _3057 = uint(int(uint(int(_3055)) >> uint(2)));
    int _3059 = int(_3055) & 3;
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[int(_3057)][_3059];
    int _3063 = int(_3055) + 1;
    uint _3065 = uint(int(uint(_3063) >> uint(2)));
    int _3067 = _3063 & 3;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[int(_3065)][_3067];
    int _3071 = as_type<int>(_3019) + (-2);
    float _3073 = as_type<float>(_3047) * _3051;
    float _3075 = float(uint(_3035));
    float _3077 = trunc(_3049);
    float _3079 = precise::max(_3077, 0.0);
    uint _3081 = uint(_3079);
    float _3083 = float(uint(_3043));
    out.m_64.x = _3037;
    out.m_64.y = _3053;
    out.m_64.z = _3045;
    bool _3085 = !_2655;
    float _3087 = _3085 ? _201 : as_type<float>(_1892);
    int _3089 = _3029 + 8;
    uint _3091 = uint(int(uint(_3089) >> uint(2)));
    uint _3093 = uint(int(uint(int(_3091)) >> uint(2)));
    int _3095 = int(_3091) & 3;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[int(_3093)][_3095];
    int _3099 = as_type<int>(_3041) + (-2);
    float _3101 = as_type<float>(_3071) * _3075;
    int _3103 = ~_2937;
    int _3105 = _3103 + 1;
    float _3107 = trunc(_3073);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    int _3113 = ~_2947;
    int _3115 = _3113 + 1;
    float _3117 = as_type<float>(_3099) * _3083;
    float _3119 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3121 = ~_2997;
    int _3123 = _3121 + 1;
    float _3125 = -_205;
    int _3127 = _1874 ? as_type<int>(_3125) : as_type<int>(_205);
    float _3129 = fma(_3119, _3119, 1.0);
    float _3131 = trunc(_3101);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    float _3137 = -_201;
    int _3139 = _2727 ? as_type<int>(_3137) : as_type<int>(_201);
    float _3141 = _3119 * _2895;
    bool _3143 = !_2687;
    float _3145 = _3143 ? _205 : as_type<float>(_3127);
    float _3147 = _3119 * _2879;
    float _3149 = _3119 * _2897;
    bool _3151 = !_2753;
    float _3153 = _3151 ? _201 : as_type<float>(_3139);
    float _3155 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3157 = trunc(_3117);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = _3105 * int(_3111);
    int _3165 = _3163 + _3033;
    int _3167 = int(_2983) + int(_3081);
    float _3169 = fma(_3155, _3037, _3147);
    float _3171 = fma(_3155, _3053, _3141);
    int _3173 = ~_2947;
    int _3175 = _3173 + 1;
    float _3177 = fma(_3155, _3045, _3149);
    float _3179 = float(uint(_3165));
    float _3181 = rsqrt(_3129);
    int _3183 = _3115 * int(_3135);
    int _3185 = _3183 + _3035;
    float _3187 = _2963 + _3171;
    float _3189 = as_type<float>(_3047) * _3179;
    float _3191 = _2971 + _3177;
    float _3193 = float(uint(_3185));
    int _3195 = _3123 * int(_3161);
    int _3197 = _3195 + _3043;
    float _3199 = as_type<float>(_3071) * _3193;
    float _3201 = fma(_403, _1870, _2773);
    float _3203 = float(uint(_3197));
    float _3205 = _3061 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3207 = _3119 * _3181;
    float _3209 = trunc(_3199);
    float _3211 = precise::max(_3209, 0.0);
    uint _3213 = uint(_3211);
    float _3215 = as_type<float>(_3099) * _3203;
    float _3217 = _3069 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3219 = -_3013;
    float _3221 = _3207 * _3219;
    float _3223 = -_2971;
    float _3225 = _3207 * _3223;
    float _3227 = _3013 + _3169;
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3231 = fma(_3181, _2879, _3221);
    float _3233 = trunc(_3215);
    float _3235 = precise::max(_3233, 0.0);
    uint _3237 = uint(_3235);
    float _3239 = _3097 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3241 = -_2963;
    float _3243 = _3207 * _3241;
    float _3245 = fma(_3181, _2897, _3225);
    float _3247 = _3205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3249 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3251 = _3239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3253 = ~_2841;
    int _3255 = _3253 + 1;
    float _3257 = trunc(_3189);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    int _3263 = int(_3135) + int(_3213);
    float _3265 = fma(_3181, _2895, _3243);
    out.m_66.x = _3247;
    out.m_66.y = _3249;
    out.m_66.z = _3251;
    out.m_66.w = _3229;
    int _3267 = ~_2937;
    int _3269 = _3267 + 1;
    int _3271 = _3175 * _3263;
    int _3273 = _3271 + _3035;
    int _3275 = _2927 ^ _2841;
    int _3277 = _3255 * _3167;
    int _3279 = _3277 + _2927;
    int _3281 = int(_3161) + int(_3237);
    out.m_68.x = _2765;
    out.m_68.y = _3201;
    bool _3283 = uint(_3279) >= uint(_2841);
    out.m_70.x = _3227;
    out.m_70.y = _3187;
    out.m_70.z = _3191;
    bool _3285 = uint(_3273) >= uint(_2947);
    int _3287 = int(_3111) + int(_3261);
    float _3289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3291 = ~_2997;
    int _3293 = _3291 + 1;
    out.m_72.x = _3231;
    out.m_72.y = _3265;
    out.m_72.z = _3245;
    bool _3295 = !_3283;
    int _3297 = _3295 ? 0 : (-1);
    int _3299 = _3269 * _3287;
    int _3301 = _3299 + _3033;
    int _3303 = ~_3167;
    int _3305 = _3303 + _3297;
    int _3307 = _3305 + 1;
    float _3309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3311 = uint(_3301) >= uint(_2937);
    int _3313 = _3293 * _3281;
    int _3315 = _3313 + _3043;
    bool _3317 = !_3285;
    int _3319 = _3317 ? 0 : (-1);
    int _3321 = _2841 * _3307;
    int _3323 = _3321 + _2927;
    bool _3325 = _2841 == 0;
    bool _3327 = uint(_3315) >= uint(_2997);
    float _3329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3331 = ~_3319;
    int _3333 = _3263 + _3331;
    int _3335 = _3333 + 1;
    bool _3337 = !_3327;
    int _3339 = _3337 ? 0 : (-1);
    uint _3341 = uint(int(uint(_3275) >> uint(31)));
    float _3343 = _3289 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3345 = ~_3339;
    int _3347 = _3281 + _3345;
    int _3349 = _3347 + 1;
    float _3351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3353 = _3033 ^ _2937;
    float _3355 = _3309 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3357 = ~int(_3341);
    int _3359 = _3357 + 1;
    float _3361 = _1215 + (-0.5);
    uint _3363 = uint(int(uint(_3353) >> uint(31)));
    bool _3365 = !_3311;
    int _3367 = _3365 ? 0 : (-1);
    float _3369 = _3329 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3371 = !_3325;
    int _3373 = _3371 ? _3323 : (-1);
    int _3375 = ~int(_3363);
    int _3377 = _3375 + 1;
    int _3379 = _3335 ^ _3359;
    int _3381 = ~_3287;
    int _3383 = _3381 + _3367;
    int _3385 = _3383 + 1;
    float _3387 = _3351 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3389 = float(_3373);
    bool _3391 = _2841 == 0;
    int _3393 = _2937 * _3385;
    int _3395 = _3393 + _3033;
    int _3397 = _3349 ^ _3377;
    float _3399 = fma(_3343, _3389, _833);
    int _3401 = ~_3359;
    int _3403 = _3401 + _3379;
    int _3405 = _3403 + 1;
    bool _3407 = _2937 == 0;
    bool _3409 = _2937 == 0;
    int _3411 = ~_3377;
    int _3413 = _3411 + _3397;
    int _3415 = _3413 + 1;
    bool _3417 = !_3391;
    int _3419 = _3417 ? _3405 : (-1);
    bool _3421 = !_3407;
    int _3423 = _3421 ? _3395 : (-1);
    bool _3425 = !_3409;
    int _3427 = _3425 ? _3415 : (-1);
    float _3429 = float(_3419);
    float _3431 = float(_3423);
    float _3433 = _3153 + 0.5;
    float _3435 = float(_3427);
    float _3437 = -_501;
    float _3439 = fma(_3369, _3429, _3437);
    float _3441 = _3145 + (-0.5);
    float _3443 = fma(_3343, _3433, _3399);
    float _3445 = fma(_3387, _3431, _885);
    float _3447 = -_855;
    float _3449 = fma(_3355, _3435, _3447);
    float _3451 = _3087 + 0.5;
    float _3453 = -_3369;
    float _3455 = fma(_3453, _3441, _3439);
    float _3457 = _1791 + _1767;
    float _3459 = -_3355;
    float _3461 = fma(_3459, _3361, _3449);
    float _3463 = fma(_3387, _3451, _3445);
    float _3465 = -_709;
    float _3467 = _3465 + 1.0;
    float _3469 = _1767 * 0.5;
    float _3471 = _3457 * 0.5;
    float _3473 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3475 = -_3467;
    float _3477 = fma(_3087, _3475, _3463);
    float _3479 = -_851;
    float _3481 = _3479 + 1.0;
    float _3483 = fma(_1813, -0.5, _3469);
    float _3485 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _3487 = _3473 * _1831;
    bool _3489 = _1515 > 0.0;
    bool _3491 = isnan(_1515);
    bool _3493 = _3489 || _3491;
    bool _3495 = isnan(0.0);
    bool _3497 = _3493 || _3495;
    float _3499 = -_1888;
    float _3501 = fma(_3153, _3499, _3443);
    float _3503 = fma(_1215, _3481, _3461);
    float _3505 = _3485 + _1767;
    float _3507 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3509 = _1842 * _3487;
    float _3511 = _1852 * _3487;
    float _3513 = -_3473;
    float _3515 = _3513 + 1.0;
    float _3517 = fma(_3145, _1896, _3455);
    out.gl_Position.x = _1791;
    out.gl_Position.y = _1813;
    out.gl_Position.z = _3485;
    out.gl_Position.w = _1767;
    float _3519 = _3505 * 0.5;
    float _3521 = _3507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3523 = fma(_1848, _3509, _1836);
    float _3525 = fma(_1850, _3509, _1838);
    float _3527 = _1842 * _3515;
    float _3529 = fma(_1842, _3511, _1840);
    out.m_74.x = _3471;
    out.m_74.y = _3483;
    out.m_74.z = _3519;
    out.m_74.w = _1767;
    out.m_76.x = _3501;
    out.m_76.y = _3517;
    out.m_76.z = _3477;
    out.m_76.w = _3503;
    out.m_45.x = _3521;
    out.m_78.x = _3523;
    out.m_78.y = _3525;
    out.m_78.z = _3529;
    out.m_78.w = _3527;
    if (_3497)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3531;
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
        float _3588 = as_type<float>(_113);
        out.gl_Position.z = _3588;
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
        float _3658 = as_type<float>(_151);
        out.gl_Position.z = _3658;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_52.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = in.m_42.x;
    float _175 = in.m_42.y;
    float _177 = in.m_42.z;
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    float _187 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _189 = 0.0;
    float _191 = _187;
    if (!_165)
    {
        float _193 = _187 * _187;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_181;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_185;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _197;
    if (!_165)
    {
        float _209 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    bool _213 = !_165;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _187 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _187);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_165;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _187 * _253;
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
    float _281 = fma(_271, _167, _275);
    float _283 = fma(_271, _169, _277);
    float _285 = fma(_271, _171, _279);
    float _287 = fma(_281, _155, _173);
    float _289 = fma(_283, _155, _175);
    float _291 = fma(_285, _155, _177);
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
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = 1.0 / _335;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _345 = 1.0 / _339;
    float _347 = _323 * 2.0;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _351 = _329 > 0.5;
    float _353 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _355 = floor(_347);
    float _357 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _359 = _331 > 0.5;
    float _361 = -_201;
    int _363 = _351 ? as_type<int>(_361) : as_type<int>(_201);
    float _365 = -_343;
    float _367 = fma(_357, 2.0, _365);
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _375 = _373 != 0;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _379 = _377 != 0;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _321 + _381;
    float _385 = -_205;
    int _387 = _359 ? as_type<int>(_385) : as_type<int>(_205);
    float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _391 = log2(_389);
    float _393 = _383 * _341;
    bool _395 = !_375;
    float _397 = _395 ? _201 : as_type<float>(_363);
    float _399 = _329 * 2.0;
    bool _401 = !_379;
    float _403 = _401 ? _205 : as_type<float>(_387);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _407 = _321 + _405;
    float _409 = floor(_399);
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _421 = _419 != 0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _321 + _423;
    bool _427 = _355 > 0.0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _431 = _429 != 0;
    bool _433 = _355 >= 0.0;
    bool _435 = isnan(_355);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _453 = _441 ? 0 : 1;
    float _455 = 1.0 / _445;
    bool _457 = !_417;
    int _459 = _457 ? 0 : 1;
    int _461 = ~_453;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    int _467 = _465;
    int _469 = _453;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (!_427)
    {
        int _473 = ~_453;
        int _475 = _473 + 1;
        _467 = _475;
    }
    int _477 = _467;
    if (_431)
    {
        _469 = 0;
    }
    int _479 = _469;
    float _481 = 1.0 / _449;
    bool _483 = _409 >= 0.0;
    bool _485 = isnan(_409);
    bool _487 = _483 || _485;
    bool _489 = isnan(0.0);
    bool _491 = _487 || _489;
    float _493 = fma(_353, -2.0, _451);
    int _495 = _479;
    if (!_431)
    {
        _495 = 1;
    }
    int _497 = _495;
    bool _499 = _409 > 0.0;
    float _501 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    int _503 = _491 ? 0 : 1;
    float _505 = _425 * _455;
    bool _507 = _497 != 1;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _321 + _509;
    int _513 = ~_503;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _331 + _329;
    bool _521 = !_413;
    int _523 = _521 ? 0 : 1;
    float _525 = _511 * _345;
    float _527 = _323 + _329;
    float _529 = _407 * _481;
    float _531 = _323 + _331;
    int _533 = _517;
    int _535 = as_type<int>(_527);
    float _537 = _531;
    if (!_499)
    {
        int _539 = ~_503;
        int _541 = _539 + 1;
        _533 = _541;
    }
    int _543 = _533;
    float _545 = _331 * 2.0;
    float _547 = _527 + (-1.0);
    if (_431)
    {
        _535 = 0;
    }
    int _549 = _535;
    float _551 = _531 + (-1.0);
    float _553 = 0.0;
    int _555 = _549;
    if (!_507)
    {
        _553 = _329;
    }
    float _557 = _553;
    float _559 = _519 + (-1.0);
    float _561 = _557;
    if (!_431)
    {
        _555 = 2;
    }
    int _563 = _555;
    float _565 = floor(_545);
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _569 = !_421;
    int _571 = _569 ? 0 : 1;
    float _573 = 0.0;
    if (!_507)
    {
        _573 = _557;
    }
    float _575 = _573;
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _579 = _575;
    if (!_507)
    {
        _537 = _331;
    }
    float _581 = _537;
    float _583 = 0.0;
    float _585 = _581;
    if (!_507)
    {
        _583 = _331;
    }
    float _587 = _583;
    float _589 = _587;
    if (_507)
    {
        _579 = _323;
    }
    float _591 = _579;
    if (_507)
    {
        _561 = _323;
    }
    float _593 = _561;
    if (_507)
    {
        _585 = _329;
    }
    float _595 = _585;
    float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_507)
    {
        _589 = _329;
    }
    float _599 = _589;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _611 = _609 != 0;
    float _613 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _615 = _563 != 2;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _625 = _565 >= 0.0;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = fma(_619, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _645 = fma(_623, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _647 = _633 ? 0 : 1;
    float _649 = fma(_639, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _651 = fma(_643, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    if (_615)
    {
        _471 = _323;
    }
    float _653 = _471;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    float _659 = _653;
    if (!_615)
    {
        _659 = _331;
    }
    float _661 = _659;
    float _663 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _669 = _565 > 0.0;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _673 = fma(_657, _505, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    bool _679 = !_607;
    int _681 = _679 ? 0 : 1;
    float _683 = -_349;
    float _685 = fma(_671, 2.0, _683);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _689 = fma(_677, _505, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _693 = int(_691);
    float _695 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[83].z, _687);
    float _697 = float(_97);
    float _699 = -_131;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[86].x, _685);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _705 = !_603;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _695);
    int _711 = ~_647;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _703);
    int _719 = _715;
    float _721 = _703;
    if (!_669)
    {
        int _723 = ~_647;
        int _725 = _723 + 1;
        _719 = _725;
    }
    int _727 = _719;
    float _729 = 1.0 / _697;
    if (_615)
    {
        _721 = _329;
    }
    float _731 = _721;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _737 = abs(_681);
    float _739 = fma(_667, _529, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _741 = fma(_735, _529, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _743 = abs(_707);
    float _745 = _731;
    if (!_615)
    {
        _745 = _323;
    }
    float _747 = _745;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _751 = float(_327);
    float _753 = float(_477);
    float _755 = _747 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _757 = 1.0 / _751;
    float _759 = float(_727);
    float _761 = _391 * _131;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _765 = float(_737);
    float _767 = fma(_755, -2.0, _749);
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _771 = float(_743);
    float _773 = exp2(_761);
    float _775 = _765 * _753;
    float _777 = fma(_613, -2.0, _763);
    float _779 = float(_693);
    float _781 = _771 * _759;
    float _783 = -_769;
    float _785 = fma(_597, 2.0, _783);
    float _787 = in.m_56.x;
    float _789 = in.m_56.y;
    float _791 = in.m_56.z;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _795 = 1.0 + _793;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _799 = 1.0 / _779;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = _757 * _131;
    bool _817 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _819 = isnan(0.0);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _825 = _821 || _823;
    float _827 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].w, _803);
    float _829 = 1.0 / _795;
    float _831 = -_131;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[76].x, _367);
    float _835 = -_773;
    float _837 = _835 + 1.0;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _841 = _729 * _131;
    float _843 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _797);
    float _845 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _801);
    float _847 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[88].z, _839);
    float _849 = _825 ? _837 : 0.0;
    float _851 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _717);
    float _853 = _781 * (-2.0);
    float _855 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _777);
    bool _857 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _859 = isnan(_321);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = _799 * _131;
    bool _871 = !_611;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _843);
    float _877 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _845);
    float _879 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _847);
    float _881 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _827);
    float _883 = -_131;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[81].x, _785);
    float _887 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _767);
    float _889 = _869;
    if (_813)
    {
        float _891 = _849 * _829;
        _133 = _891;
    }
    float _893 = _133;
    float _895 = fma(_853, _787, _787);
    bool _897 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _899 = isnan(_321);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = fma(_663, _853, _663);
    int _911 = abs(_873);
    float _913 = -_867;
    float _915 = _913 + 1.0;
    bool _917 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _919 = isnan(_321);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = _323 + (-0.5);
    float _931 = -_907;
    float _933 = _931 + 1.0;
    float _935 = _907 * _915;
    bool _937 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _939 = isnan(_321);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[196].x, _895);
    float _951 = -_927;
    float _953 = _951 + 1.0;
    float _955 = float(_543);
    float _957 = _927 * _933;
    bool _959 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _961 = isnan(_321);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _947 * _953;
    float _973 = _775 * (-2.0);
    float _975 = -_947;
    float _977 = _975 + 1.0;
    float _979 = float(_911);
    float _981 = fma(_909, _893, _949);
    float _983 = _329 + (-0.5);
    float _985 = fma(_973, _789, _789);
    float _987 = _969 * _977;
    float _989 = _979 * _955;
    float _991 = _981 * 0.15915493667125701904296875;
    float _993 = fma(_577, _973, _577);
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].y, _985);
    float _997 = _649 * _987;
    float _999 = -_969;
    float _1001 = _999 + 1.0;
    float _1003 = _635 * _987;
    float _1005 = _989 * (-2.0);
    float _1007 = fma(_993, _893, _995);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[143].x, _997);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1003);
    float _1013 = in.m_52.x;
    float _1015 = in.m_52.y;
    float _1017 = fma(_1005, _791, _791);
    float _1019 = _331 + (-0.5);
    float _1021 = fma(_567, _1005, _567);
    float _1023 = fma(_645, _971, _1011);
    float _1025 = fma(_651, _971, _1009);
    float _1027 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1017);
    float _1029 = _1007 * 0.15915493667125701904296875;
    float _1031 = fma(_689, _957, _1023);
    float _1033 = fma(_673, _957, _1025);
    float _1035 = fma(_1021, _893, _1027);
    float _1037 = _991 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = fma(_741, _935, _1031);
    float _1043 = fma(_739, _935, _1033);
    float _1045 = _1035 * 0.15915493667125701904296875;
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1049 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1041);
    float _1051 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1043);
    float _1053 = in.m_54.w;
    float _1055 = _1029 * 6.283185482025146484375;
    float _1057 = sin(_1055);
    float _1059 = _1049 * _1015;
    float _1061 = _1051 * _1013;
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1065 = _1029 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1073 = _1069 * _1047;
    float _1075 = _1071 * _1063;
    float _1077 = _991 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1039 * _1057;
    bool _1083 = _1053 > 0.5;
    float _1085 = _1045 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1039 * _1067;
    float _1091 = _1045 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = _1079 * _1057;
    float _1097 = _1079 * _1067;
    float _1099 = _1039 * _1087;
    float _1101 = _1079 * _1087;
    float _1103 = _1067 * _1087;
    float _1105 = _1057 * _1087;
    float _1107 = _1099 * _1073;
    float _1109 = _1101 * _1073;
    float _1111 = fma(_1093, _1089, _1095);
    float _1113 = -_1081;
    float _1115 = fma(_1093, _1097, _1113);
    float _1117 = fma(_1093, _1095, _1089);
    float _1119 = -_1097;
    float _1121 = fma(_1093, _1081, _1119);
    float _1123 = -_1073;
    float _1125 = _1093 * _1123;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = fma(_1111, _1075, _1107);
    float _1131 = fma(_1115, _1075, _1109);
    float _1133 = fma(_1103, _1075, _1125);
    float _1135 = fma(_1121, _1127, _1129);
    float _1137 = fma(_1117, _1127, _1131);
    float _1139 = fma(_1105, _1127, _1133);
    float _1141 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1141);
    float _1151 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    float _1153 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1145);
    float _1155 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1157 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1149);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1151);
    float _1161 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1153);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1155);
    float _1165 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1169 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1171 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1175 = _1165 + _1167;
    float _1177 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1169);
    float _1179 = _1171 + _1173;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1175 + _1181;
    float _1185 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1177);
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1179 + _1187;
    float _1191 = _1183 * _1183;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1195 = fma(_1189, _1189, _1191);
    float _1197 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1199 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1201 = sqrt(_1195);
    float _1203 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1197);
    float _1205 = -_205;
    int _1207 = _1083 ? as_type<int>(_1205) : as_type<int>(_205);
    float _1209 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1199);
    float _1211 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1203);
    bool _1213 = !_371;
    float _1215 = _1213 ? _205 : as_type<float>(_1207);
    float _1217 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1209);
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1225 = _1223 != 0;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    float _1235 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1239 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1241 = 1.0 / _1235;
    float _1243 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1237);
    bool _1245 = !_1225;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = _1239 + _1235;
    bool _1251 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1243);
    bool _1255 = !_1221;
    int _1257 = _1255 ? 0 : 1;
    bool _1259 = !_1229;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1267 = isnan(0.5);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1273 = _1269 || _1271;
    bool _1275 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1277 = isnan(0.5);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1283 = _1279 || _1281;
    float _1285 = _1193 + _1263;
    bool _1287 = !_1233;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = _1249 * _1241;
    float _1293 = _1291 * 0.5;
    float _1295 = _1253;
    float _1297 = _1263;
    float _1299 = _1175;
    float _1301 = _1235;
    float _1303 = _1241;
    float _1305 = _1195;
    float _1307 = _1183;
    float _1309 = _1005;
    if (!_1251)
    {
        _1295 = _1179;
    }
    float _1311 = _1295;
    float _1313 = _1311;
    if (!_1251)
    {
        _1297 = _1285;
    }
    float _1315 = _1297;
    bool _1317 = !_1251;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1201 + _1323;
        float _1327 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1195);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1337 + (-1.0);
        float _1345 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = fma(_1341, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1349 = fma(_1285, _1337, _1345);
        float _1351 = _1329 * _1347;
        float _1353 = fma(_1189, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1355 = fma(_1183, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1355;
        _1301 = _1333;
        _1313 = _1353;
        _1319 = _1349;
        _1303 = _1345;
        _1305 = _1329;
    }
    float _1357 = _1299;
    float _1359 = _1301;
    float _1361 = _1313;
    float _1363 = _1319;
    float _1365 = _1303;
    float _1367 = _1305;
    float _1369 = _1365;
    float _1371 = _1363;
    float _1373 = _1361;
    float _1375 = _1367;
    float _1377 = _1359;
    if (_1283)
    {
        _1307 = 1.0;
    }
    float _1379 = _1307;
    float _1381 = _1379;
    if (_1273)
    {
        _1369 = _1357;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (!_1273)
    {
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1389 = _1193 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1393 = _1171 + _1391;
        float _1395 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1397 = -_1171;
        float _1399 = _1397 + _1361;
        float _1401 = _1389 * _1389;
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1405 = _1165 + _1403;
        float _1407 = -_1193;
        float _1409 = _1407 + _1363;
        float _1411 = -_1165;
        float _1413 = _1411 + _1357;
        float _1415 = fma(_1393, _1393, _1401);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = fma(_1405, _1405, _1415);
        float _1421 = sqrt(_1419);
        float _1423 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1425 = precise::min(_1421, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1427 = _1425 * _1417;
        float _1429 = _1423 * _1427;
        float _1431 = fma(_1399, _1429, _1171);
        float _1433 = fma(_1409, _1429, _1193);
        float _1435 = fma(_1413, _1429, _1165);
        _1371 = _1433;
        _1373 = _1431;
        _1385 = _1435;
        _1375 = _1427;
        _1377 = _1395;
    }
    float _1437 = _1371;
    float _1439 = _1373;
    float _1441 = _1385;
    float _1443 = _1375;
    float _1445 = _1377;
    float _1447 = _1443;
    float _1449 = _1445;
    if (!_1283)
    {
        float _1451 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1459 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1457);
        float _1461 = _1453 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1455 * 0.15915493667125701904296875;
        float _1467 = _1453 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = 1.0 / _1463;
        float _1473 = _1465 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = _1465 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1483;
        float _1487 = _1475 * _1477;
        float _1489 = 1.0 / _1459;
        float _1491 = 1.0 / _1487;
        float _1493 = 1.0 / _1485;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1497 = _1489 * _1495;
        float _1499 = _1481 * _1491;
        float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1503 = fma(_1499, _1497, _1501);
        float _1505 = _1503 * _1493;
        float _1507 = precise::clamp(_1505, 0.0, 1.0);
        float _1509 = -_1507;
        float _1511 = _1509 + 1.0;
        _1447 = _1477;
        _1381 = _1511;
    }
    float _1513 = _1447;
    float _1515 = _1381;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1519 = _1437 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1523 = _1439 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1441 + _1525;
    float _1529 = _1519 * _1519;
    float _1531 = fma(_1523, _1523, _1529);
    float _1533 = fma(_1527, _1527, _1531);
    float _1535 = rsqrt(_1533);
    float _1537 = sqrt(_1533);
    float _1539 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1541 = _1523 * _1539;
    float _1543 = _1527 * _1539;
    float _1545 = _1541 * _1541;
    float _1547 = _1543 * _1543;
    float _1549 = _1545 + _1547;
    float _1551 = sqrt(_1549);
    bool _1553 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = _1551 + _1555;
    float _1559 = _1535;
    float _1561 = _1549;
    float _1563 = _1557;
    float _1565 = _1513;
    float _1567 = _1519;
    if (_1553)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1559 = _1569;
    }
    float _1571 = _1559;
    if (_1553)
    {
        float _1573 = rsqrt(_1549);
        _1561 = _1573;
    }
    float _1575 = _1561;
    if (_1553)
    {
        float _1577 = _1557 * _1571;
        _1563 = _1577;
    }
    float _1579 = _1563;
    if (_1553)
    {
        float _1581 = _1579 * 0.15915493667125701904296875;
        _1565 = _1581;
    }
    float _1583 = _1565;
    float _1585 = _1527;
    float _1587 = _1583;
    if (_1553)
    {
        float _1589 = _1583 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        _1585 = _1591;
    }
    float _1593 = _1585;
    float _1595 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1597 = precise::max(0.0, _1595);
    float _1599 = _1571;
    float _1601 = _1597;
    if (_1553)
    {
        float _1603 = _1583 * 6.283185482025146484375;
        float _1605 = cos(_1603);
        _1599 = _1605;
    }
    float _1607 = _1599;
    float _1609 = -_1539;
    float _1611 = -_1597;
    float _1613 = fma(_1519, _1609, _1611);
    if (_1553)
    {
        float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1567 = _1615;
    }
    float _1617 = _1567;
    float _1619 = _1617;
    if (!_1553)
    {
        _1587 = _1545;
    }
    float _1621 = _1587;
    float _1623 = _1593;
    float _1625 = _1621;
    if (_1553)
    {
        float _1627 = fma(_1593, _1617, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1629;
    if (!_1553)
    {
        _1619 = _1613;
    }
    float _1633 = _1619;
    float _1635 = _1633;
    float _1637 = _1607;
    if (_1553)
    {
        float _1639 = _1607 + (-1.0);
        _1601 = _1639;
    }
    float _1641 = _1601;
    float _1643 = _1641;
    if (_1553)
    {
        float _1645 = _1575 * _1629;
        _1309 = _1645;
    }
    float _1647 = _1309;
    if (!_1553)
    {
        _1631 = _1541;
    }
    float _1649 = _1631;
    float _1651 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1653 = _1649;
    if (_1553)
    {
        float _1655 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1655;
    }
    float _1657 = _1449;
    if (_1553)
    {
        float _1659 = _1541 * _1647;
        _1653 = _1659;
    }
    float _1661 = _1653;
    if (!_1553)
    {
        _1643 = _1543;
    }
    float _1663 = _1643;
    float _1665 = _1663;
    if (_1553)
    {
        float _1667 = _1543 * _1647;
        _1665 = _1667;
    }
    float _1669 = _1665;
    if (_1553)
    {
        float _1671 = fma(_1613, _1607, _1657);
        _1635 = _1671;
    }
    float _1673 = _1635;
    if (_1553)
    {
        float _1675 = _1661 * _1661;
        _1625 = _1675;
    }
    float _1677 = _1625;
    if (!_1553)
    {
        _1637 = _1547;
    }
    float _1679 = _1637;
    float _1681 = _1679;
    if (_1553)
    {
        float _1683 = _1669 * _1669;
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = fma(_1673, _1673, _1677);
    float _1689 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    float _1691 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1693 = _1687 + _1685;
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1697 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1695);
    float _1699 = precise::clamp(_1697, 0.0, 1.0);
    float _1701 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1703 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1689);
    float _1705 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1707 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1691);
    float _1709 = rsqrt(_1693);
    float _1711 = -_1699;
    float _1713 = _1711 + 1.0;
    float _1715 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1717 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1705);
    float _1719 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1707);
    float _1721 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1725 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1717);
    float _1727 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1729 = abs(_1713);
    float _1731 = log2(_1729);
    float _1733 = -_1723;
    float _1735 = fma(_1733, _1701, 1.0);
    float _1737 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1741 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1721);
    float _1743 = _1709 * _1661;
    float _1745 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1739);
    float _1747 = _1709 * _1673;
    float _1749 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1741);
    float _1751 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1753 = _1709 * _1669;
    float _1755 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1745);
    float _1757 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1759 = -_1751;
    float _1761 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1759);
    float _1763 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1765 = log2(_1735);
    float _1767 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1755);
    float _1769 = -_1753;
    float _1771 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1761);
    float _1773 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1775 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1777 = fma(_1771, -0.5, 0.5);
    float _1779 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1773);
    float _1781 = exp2(_1763);
    float _1783 = fma(_1771, 0.5, 0.5);
    float _1785 = _1747 + 1.0;
    float _1787 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1779);
    float _1789 = fma(_1783, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1791 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1787);
    float _1793 = 1.0 / _1767;
    float _1795 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1775);
    float _1797 = fma(_1783, _1789, -0.212114393711090087890625);
    float _1799 = _1765 * 0.693147182464599609375;
    float _1801 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1795);
    float _1803 = fma(_1783, _1797, 1.570728778839111328125);
    float _1805 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1807 = sqrt(_1777);
    float _1809 = -_1747;
    float _1811 = fma(_1781, _1785, _1809);
    float _1813 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    float _1815 = _1791 * _1793;
    float _1817 = _1813 * _1793;
    float _1819 = fma(_1815, 0.5, 0.5);
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1811, 0.5, 0.5);
    float _1825 = _1807 * 0.636619746685028076171875;
    float _1827 = -_1803;
    float _1829 = fma(_1825, _1827, 1.0);
    float3 _6282 = float3(_1819, _1821, _1805);
    float _1831 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6282, float3(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6282, float3(0.0), isnan(_6282)), level(0.0)).x;
    float3 _6293 = float3(_1819, _1821, _1805);
    float4 _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).xyzw;
    float _1836 = _1834.x;
    float _1838 = _1834.y;
    float _1840 = _1834.z;
    float _1842 = _1834.w;
    float2 _6310 = float2(_1829, _1823);
    float3 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).xyz;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1856 = int(_1854);
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1860 = _1858 != 0;
    float _1862 = -_879;
    float _1864 = _1862 + 1.0;
    int _1866 = abs(_1247);
    float _1868 = -_881;
    float _1870 = _1868 + 1.0;
    int _1872 = abs(_1257);
    out.m_58.x = _1439;
    out.m_58.y = _1437;
    out.m_58.z = _1441;
    bool _1874 = _329 > 0.5;
    float _1876 = trunc(_815);
    int _1878 = int(_1876);
    bool _1880 = _331 > 0.5;
    float _1882 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1884 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1886 = -_875;
    float _1888 = _1886 + 1.0;
    float _1890 = -_201;
    int _1892 = _1880 ? as_type<int>(_1890) : as_type<int>(_201);
    float _1894 = -_877;
    float _1896 = _1894 + 1.0;
    float _1898 = float(uint(_1856));
    float _1900 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1902 = int(_1900);
    float _1904 = trunc(_869);
    int _1906 = int(_1904);
    float _1908 = float(uint(_1878));
    float _1910 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1884);
    float _1912 = _1805;
    if (_1860)
    {
        _1912 = 1.0;
    }
    float _1914 = _1912;
    float _1916 = _1914;
    if (!_1860)
    {
        _1916 = 7.345489978790283203125;
    }
    float _1918 = _1916;
    float _1920 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1910);
    int _1922 = ~_1856;
    int _1924 = _1922 + 1;
    float _1926 = 1.0 / _1898;
    float _1928 = float(uint(_1902));
    float _1930 = _1918 * _323;
    if (_1860)
    {
        _889 = _323;
    }
    float _1932 = _889;
    float _1934 = _1932;
    if (!_1860)
    {
        _1934 = _329;
    }
    float _1936 = _1934;
    bool _1938 = _1856 == 0;
    float _1940 = 1.0 / _1928;
    float _1942 = float(uint(_1906));
    int _1944 = as_type<int>(_1926) + (-2);
    float _1946 = floor(_1930);
    float _1948 = as_type<float>(_1944) * _1908;
    int _1950 = ~_1856;
    int _1952 = _1950 + 1;
    int _1954 = as_type<int>(_1940) + (-2);
    float _1956 = exp2(_1882);
    float _1958 = trunc(_1948);
    float _1960 = precise::max(_1958, 0.0);
    uint _1963 = uint(_1960);
    float _1965 = -_1946;
    float _1967 = _1930 + _1965;
    float _1969 = -_1956;
    float _1971 = _1969 + 1.0;
    int _1973 = _1952 * int(_1963);
    int _1975 = _1973 + _1878;
    float _1977 = as_type<float>(_1954) * _1942;
    int _1979 = ~_1902;
    int _1981 = _1979 + 1;
    float _1983 = float(uint(_1975));
    float _1985 = trunc(_1977);
    float _1987 = precise::max(_1985, 0.0);
    uint _1989 = uint(_1987);
    float _1991 = as_type<float>(_1975);
    if (_1860)
    {
        _1991 = 1.0;
    }
    float _1993 = _1991;
    float _1995 = as_type<float>(_1944) * _1983;
    float _1997 = _1993;
    if (!_1860)
    {
        _1997 = 1.2345600128173828125;
    }
    float _1999 = _1997;
    int _2001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2003 = _2001 != 0;
    float _2005 = trunc(_1995);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    float _2011 = _1999 * _1936;
    float _2013 = float(_1856);
    int _2015 = _1981 * int(_1989);
    int _2017 = _2015 + _1906;
    float _2019 = floor(_2011);
    float _2021 = float(uint(_2017));
    int _2023 = int(_1963) + int(_2009);
    float _2025 = as_type<float>(_1954) * _2021;
    float _2027 = float(_1878);
    int _2029 = _1924 * _2023;
    int _2031 = _2029 + _1878;
    float _2033 = trunc(_2025);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = _2027 >= _2013;
    bool _2041 = isnan(_2027);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan(_2013);
    bool _2047 = _2043 || _2045;
    float _2049 = float(_2047);
    float _2051 = -_2019;
    float _2053 = _2011 + _2051;
    int _2055 = _1856 + (-1);
    bool _2057 = uint(_2031) >= uint(_1856);
    float _2059 = trunc(_2049);
    int _2061 = int(_2059);
    bool _2063 = !_2057;
    int _2065 = _2063 ? 0 : (-1);
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2069 = _2067 != 0;
    int _2071 = ~_2023;
    int _2073 = _2071 + _2065;
    int _2075 = _2073 + 1;
    float _2077 = float(_1902);
    int _2079 = int(_1989) + int(_2037);
    int _2081 = _1856 * _2075;
    int _2083 = _2081 + _1878;
    int _2085 = ~_1902;
    int _2087 = _2085 + 1;
    float _2089 = _1967 * _2013;
    float _2091 = float(_1906);
    float _2093 = _2013 * _841;
    bool _2095 = !_1938;
    int _2097 = _2095 ? _2083 : (-1);
    int _2099 = _2087 * _2079;
    int _2101 = _2099 + _1906;
    int _2103 = ~_2061;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    float _2109 = trunc(_2089);
    int _2111 = int(_2109);
    bool _2113 = _2091 >= _2077;
    bool _2115 = isnan(_2091);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(_2077);
    bool _2121 = _2117 || _2119;
    float _2123 = float(_2121);
    float _2125 = _2077 * _841;
    bool _2127 = !_2069;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = _2097 * _2107;
    bool _2133 = uint(_2101) >= uint(_1902);
    int _2135 = abs(_459);
    int _2137 = _2061 * _2055;
    int _2139 = _2137 + _2131;
    bool _2141 = !_2133;
    int _2143 = _2141 ? 0 : (-1);
    float _2145 = trunc(_2093);
    int _2147 = int(_2145);
    bool _2149 = _1902 == 0;
    int _2151 = _2139 * _2135;
    int _2153 = ~_2079;
    int _2155 = _2153 + _2143;
    int _2157 = _2155 + 1;
    float _2159 = _2053 * _2077;
    int _2161 = abs(_2129);
    int _2163 = abs(_571);
    float _2165 = trunc(_2123);
    int _2167 = int(_2165);
    int _2169 = _1902 * _2157;
    int _2171 = _2169 + _1906;
    int _2173 = abs(_523);
    int _2175 = _2111 * _2161;
    int _2177 = _2175 + _1878;
    bool _2179 = !_2003;
    int _2181 = _2179 ? 0 : 1;
    bool _2183 = !_2149;
    int _2185 = _2183 ? _2171 : (-1);
    int _2187 = _2147 * _2173;
    int _2189 = _2187 + _2151;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2193 = _2191 != 0;
    float _2195 = trunc(_2159);
    int _2197 = int(_2195);
    int _2199 = abs(_2181);
    int _2201 = _2177 * _2163;
    int _2203 = _2201 + _2189;
    bool _2205 = !_2193;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = ~_2167;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    int _2215 = _2111 * _2199;
    int _2217 = _2215 + _2203;
    int _2219 = abs(_2207);
    float _2221 = trunc(_2125);
    int _2223 = int(_2221);
    int _2225 = _2185 * _2213;
    int _2227 = _1902 + (-1);
    int _2229 = ~_1856;
    int _2231 = _2229 + 1;
    int _2233 = _2167 * _2227;
    int _2235 = _2233 + _2225;
    float _2237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2239 = float(uint(_2217));
    int _2241 = _2235 * _1866;
    int _2243 = abs(_1261);
    int _2245 = _2197 * _2219;
    int _2247 = _2245 + _1906;
    int _2249 = abs(_1289);
    float _2251 = as_type<float>(_1944) * _2239;
    int _2253 = _2223 * _1872;
    int _2255 = _2253 + _2241;
    int _2257 = ~_1856;
    int _2259 = _2257 + 1;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2263 = ~_1856;
    int _2265 = _2263 + 1;
    int _2267 = _2247 * _2243;
    int _2269 = _2267 + _2255;
    float _2271 = float(uint(_2177));
    int _2273 = ~_1902;
    int _2275 = _2273 + 1;
    int _2277 = _2197 * _2249;
    int _2279 = _2277 + _2269;
    float _2281 = trunc(_2251);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = as_type<float>(_1944) * _2271;
    float _2289 = float(uint(_2279));
    float _2291 = trunc(_2287);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    float _2297 = as_type<float>(_1954) * _2289;
    float _2299 = float(uint(_2247));
    float _2301 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2303 = as_type<float>(_1954) * _2299;
    int _2305 = _2259 * int(_2285);
    int _2307 = _2305 + _2217;
    float _2309 = trunc(_2297);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    float _2315 = float(uint(_2307));
    int _2317 = _2265 * int(_2295);
    int _2319 = _2317 + _2177;
    float _2321 = trunc(_2303);
    float _2323 = precise::max(_2321, 0.0);
    uint _2325 = uint(_2323);
    float _2327 = as_type<float>(_1944) * _2315;
    float _2329 = float(uint(_2319));
    float _2331 = trunc(_2327);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = _2275 * int(_2313);
    int _2339 = _2337 + _2279;
    float _2341 = as_type<float>(_1944) * _2329;
    int _2343 = ~_1902;
    int _2345 = _2343 + 1;
    float _2347 = float(uint(_2339));
    float _2349 = trunc(_2341);
    float _2351 = precise::max(_2349, 0.0);
    uint _2353 = uint(_2351);
    int _2355 = int(_2285) + int(_2335);
    float _2357 = as_type<float>(_1954) * _2347;
    int _2359 = _2345 * int(_2325);
    int _2361 = _2359 + _2247;
    float _2363 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2365 = _2231 * _2355;
    int _2367 = _2365 + _2217;
    float _2369 = trunc(_2357);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = float(uint(_2361));
    float _2377 = _2363 * _323;
    int _2379 = int(_2295) + int(_2353);
    bool _2381 = uint(_2367) >= uint(_1856);
    float _2383 = as_type<float>(_1954) * _2375;
    int _2385 = ~_1856;
    int _2387 = _2385 + 1;
    bool _2389 = !_2381;
    int _2391 = _2389 ? 0 : (-1);
    float _2393 = trunc(_2383);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    int _2399 = ~_2355;
    int _2401 = _2399 + _2391;
    int _2403 = _2401 + 1;
    int _2405 = ~_1902;
    int _2407 = _2405 + 1;
    int _2409 = _2387 * _2379;
    int _2411 = _2409 + _2177;
    int _2413 = int(_2313) + int(_2373);
    int _2415 = _1856 * _2403;
    int _2417 = _2415 + _2217;
    float _2419 = trunc(_2377);
    int _2421 = int(_2419);
    bool _2423 = uint(_2411) >= uint(_1856);
    float _2425 = -_205;
    float _2427 = _2425 + 0.5;
    bool _2429 = !_1938;
    int _2431 = _2429 ? _2417 : (-1);
    int _2433 = _2407 * _2413;
    int _2435 = _2433 + _2279;
    bool _2437 = !_2423;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = _201 + 0.5;
    int _2443 = _2431 & 3;
    bool _2445 = _2443 != 0;
    int _2447 = ~_2379;
    int _2449 = _2447 + _2439;
    int _2451 = _2449 + 1;
    bool _2453 = uint(_2435) >= uint(_1902);
    out.m_60.x = _2441;
    out.m_60.y = _2427;
    int _2455 = int(_2325) + int(_2397);
    int _2457 = _2431 & 3;
    bool _2459 = _2457 != 0;
    int _2461 = _2421 << 4;
    int _2463 = _2461 + 1712;
    int _2465 = _1856 * _2451;
    int _2467 = _2465 + _2177;
    bool _2469 = !_2453;
    int _2471 = _2469 ? 0 : (-1);
    int _2473 = _2463 + 8;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
    int _2479 = int(_2475) & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    bool _2483 = uint(_2457) >= 2u;
    int _2485 = ~_2413;
    int _2487 = _2485 + _2471;
    int _2489 = _2487 + 1;
    int _2491 = _2431 >> 31;
    int _2493 = _2483 ? 0 : 1;
    uint _2495 = uint(int(uint(_2463) >> uint(2)));
    uint _2497 = uint(int(uint(int(_2495)) >> uint(2)));
    int _2499 = int(_2495) & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = int(_2495) + 1;
    uint _2505 = uint(int(uint(_2503) >> uint(2)));
    int _2507 = _2503 & 3;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[int(_2505)][_2507];
    bool _2511 = _2457 != 3;
    int _2513 = _1902 * _2489;
    int _2515 = _2513 + _2279;
    int _2517 = _2491 & 3;
    int _2519 = _2445 ? 0 : 1;
    int _2521 = _2431 + _2517;
    bool _2523 = uint(_2457) > 1u;
    int _2525 = _2521 >> 2;
    int _2527 = ~_2493;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2511)
    {
        int _2535 = ~_2493;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = _2525 << 4;
    int _2543 = _2541 + 368;
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2547 = _2545 != 0;
    bool _2549 = !_2149;
    int _2551 = _2549 ? _2515 : (-1);
    uint _2553 = uint(int(uint(_2543) >> uint(2)));
    uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
    int _2557 = int(_2553) & 3;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[int(_2555)][_2557];
    int _2561 = int(_2553) + 1;
    uint _2563 = uint(int(uint(_2561) >> uint(2)));
    int _2565 = _2561 & 3;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[int(_2563)][_2565];
    bool _2569 = !_2547;
    int _2571 = _2569 ? 0 : 1;
    int _2573 = _2551 & 3;
    bool _2575 = _2573 != 0;
    bool _2577 = !_1938;
    int _2579 = _2577 ? _2467 : (-1);
    int _2581 = ~_2519;
    int _2583 = _2581 + 1;
    int _2585 = _2583 + 1;
    int _2587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2589 = _2587 != 0;
    bool _2591 = !_2459;
    int _2593 = _2591 ? 0 : 1;
    int _2595 = _2585;
    if (!_2523)
    {
        int _2597 = ~_2519;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    bool _2603 = uint(_2573) > 1u;
    bool _2605 = _2457 != 3;
    bool _2607 = !_2589;
    int _2609 = _2607 ? 0 : 1;
    int _2611 = _2551 & 3;
    bool _2613 = _2611 != 0;
    bool _2615 = !_2605;
    int _2617 = _2615 ? 0 : (-1);
    bool _2619 = _2573 != 3;
    float _2621 = _2501 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2623 = _2613 ? 0 : 1;
    float _2625 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2627 = uint(_2573) >= 2u;
    float _2629 = _2621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2631 = ~_2623;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    float _2637 = _2625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2639 = _2635;
    if (!_2603)
    {
        int _2641 = ~_2623;
        int _2643 = _2641 + 1;
        _2639 = _2643;
    }
    int _2645 = _2639;
    int _2647 = ~_1902;
    int _2649 = _2647 + 1;
    int _2651 = _2627 ? 0 : 1;
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2655 = _2653 != 0;
    float _2657 = _2481 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2659 = !_2575;
    int _2661 = _2659 ? 0 : 1;
    int _2663 = _2543 + 8;
    uint _2665 = uint(int(uint(_2663) >> uint(2)));
    uint _2667 = uint(int(uint(int(_2665)) >> uint(2)));
    int _2669 = int(_2665) & 3;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[int(_2667)][_2669];
    int _2673 = int(_2665) + 1;
    uint _2675 = uint(int(uint(_2673) >> uint(2)));
    int _2677 = _2673 & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = _2551 >> 31;
    float _2683 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2685 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2687 = _2685 != 0;
    bool _2689 = _2573 != 3;
    int _2691 = _2649 * _2455;
    int _2693 = _2691 + _2247;
    int _2695 = ~_2651;
    int _2697 = _2695 + 1;
    int _2699 = _2697 + 1;
    int _2701 = _2699;
    if (_2619)
    {
        int _2703 = ~_2651;
        int _2705 = _2703 + 1;
        _2701 = _2705;
    }
    int _2707 = _2701;
    float _2709 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2711 = _2681 & 3;
    bool _2713 = !_2689;
    int _2715 = _2713 ? 0 : (-1);
    float _2717 = _2709 * _323;
    bool _2719 = uint(_2693) >= uint(_1902);
    int _2721 = _2551 + _2711;
    float _2723 = trunc(_2717);
    int _2725 = int(_2723);
    bool _2727 = _323 > 0.5;
    float _2729 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2731 = _397 + 0.5;
    int _2733 = _2721 >> 2;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2737 = abs(_2601);
    float _2739 = fma(_2729, _2731, _701);
    int _2741 = _2733 << 4;
    int _2743 = _2741 + 512;
    float _2745 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2747 = !_2719;
    int _2749 = _2747 ? 0 : (-1);
    out.m_62.x = _2629;
    out.m_62.y = _2637;
    out.m_62.z = _2683;
    out.m_62.w = _2735;
    int _2751 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2753 = _2751 != 0;
    float _2755 = _403 + (-0.5);
    int _2757 = ~_2737;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    float _2763 = -_1864;
    float _2765 = fma(_397, _2763, _2739);
    int _2767 = abs(_2593);
    float _2769 = -_2301;
    float _2771 = -_887;
    float _2773 = fma(_2769, _2755, _2771);
    int _2775 = ~_2455;
    int _2777 = _2775 + _2749;
    int _2779 = _2777 + 1;
    int _2781 = ~_2767;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    int _2787 = abs(_2617);
    int _2789 = _1902 * _2779;
    int _2791 = _2789 + _2247;
    int _2793 = abs(_2571);
    uint _2795 = uint(int(uint(_2743) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    float _2811 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2813 = _2761 * as_type<int>(_2567);
    float _2815 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2817 = -_1093;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2745);
    float _2821 = -_1093;
    float _2823 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2811);
    float _2825 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2827 = _2785 * as_type<int>(_2559);
    int _2829 = _2827 + _2813;
    float _2831 = -_1093;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2815);
    int _2835 = abs(_2539);
    float _2837 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2825);
    float _2839 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2841 = int(_2839);
    int _2843 = _2743 + 8;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    float _2861 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2863 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2865 = ~_2835;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    float _2871 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2861);
    float _2873 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2863);
    int _2875 = _2869 * as_type<int>(_2671);
    int _2877 = _2875 + _2829;
    float _2879 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2823);
    int _2881 = ~_2793;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    float _2887 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2889 = ~_2787;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    float _2895 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2833);
    float _2897 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2819);
    float _2899 = float(uint(_2841));
    float _2901 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2903 = _2893 * as_type<int>(_2679);
    int _2905 = _2903 + _2877;
    int _2907 = abs(_2645);
    float _2909 = 1.0 / _2899;
    float _2911 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2913 = _2905 * _2885;
    int _2915 = ~_2907;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    float _2921 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2901);
    float _2923 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2911);
    int _2925 = _2579 * _2793;
    int _2927 = _2925 + _2913;
    int _2929 = abs(_2661);
    float _2931 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2887);
    int _2933 = abs(_2715);
    float _2935 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2937 = int(_2935);
    float _2939 = float(uint(_2927));
    int _2941 = ~_2929;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    int _2947 = abs(_2841);
    int _2949 = _2919 * as_type<int>(_2809);
    int _2951 = as_type<int>(_2909) + (-2);
    int _2953 = abs(_2707);
    int _2955 = _2945 * as_type<int>(_2801);
    int _2957 = _2955 + _2949;
    int _2959 = abs(_2609);
    float _2961 = as_type<float>(_2951) * _2939;
    float _2963 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2931);
    int _2965 = ~_2953;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    float _2971 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2923);
    int _2973 = ~_2933;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    float _2979 = trunc(_2961);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = float(uint(_2937));
    int _2987 = _2969 * as_type<int>(_2851);
    int _2989 = _2987 + _2957;
    int _2991 = ~_2959;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = abs(_2937);
    int _2999 = _2977 * as_type<int>(_2859);
    int _3001 = _2999 + _2989;
    int _3003 = ~_2841;
    int _3005 = _3003 + 1;
    float _3007 = 1.0 / _2985;
    float _3009 = float(uint(_2947));
    int _3011 = _3001 * _2995;
    float _3013 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2921);
    bool _3015 = !_2149;
    int _3017 = _3015 ? _2791 : (-1);
    float _3019 = 1.0 / _3009;
    float _3021 = float(uint(_2997));
    int _3023 = _3005 * int(_2983);
    int _3025 = _3023 + _2927;
    int _3027 = _2725 << 4;
    int _3029 = _3027 + 1968;
    int _3031 = _3017 * _2959;
    int _3033 = _3031 + _3011;
    int _3035 = abs(_2927);
    float _3037 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2837);
    float _3039 = float(uint(_3025));
    float _3041 = 1.0 / _3021;
    int _3043 = abs(_3033);
    float _3045 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2873);
    int _3047 = as_type<int>(_3007) + (-2);
    float _3049 = as_type<float>(_2951) * _3039;
    float _3051 = float(uint(_3033));
    float _3053 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2871);
    uint _3055 = uint(int(uint(_3029) >> uint(2)));
    uint _3057 = uint(int(uint(int(_3055)) >> uint(2)));
    int _3059 = int(_3055) & 3;
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[int(_3057)][_3059];
    int _3063 = int(_3055) + 1;
    uint _3065 = uint(int(uint(_3063) >> uint(2)));
    int _3067 = _3063 & 3;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[int(_3065)][_3067];
    int _3071 = as_type<int>(_3019) + (-2);
    float _3073 = as_type<float>(_3047) * _3051;
    float _3075 = float(uint(_3035));
    float _3077 = trunc(_3049);
    float _3079 = precise::max(_3077, 0.0);
    uint _3081 = uint(_3079);
    float _3083 = float(uint(_3043));
    out.m_64.x = _3037;
    out.m_64.y = _3053;
    out.m_64.z = _3045;
    bool _3085 = !_2655;
    float _3087 = _3085 ? _201 : as_type<float>(_1892);
    int _3089 = _3029 + 8;
    uint _3091 = uint(int(uint(_3089) >> uint(2)));
    uint _3093 = uint(int(uint(int(_3091)) >> uint(2)));
    int _3095 = int(_3091) & 3;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[int(_3093)][_3095];
    int _3099 = as_type<int>(_3041) + (-2);
    float _3101 = as_type<float>(_3071) * _3075;
    int _3103 = ~_2937;
    int _3105 = _3103 + 1;
    float _3107 = trunc(_3073);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    int _3113 = ~_2947;
    int _3115 = _3113 + 1;
    float _3117 = as_type<float>(_3099) * _3083;
    float _3119 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3121 = ~_2997;
    int _3123 = _3121 + 1;
    float _3125 = -_205;
    int _3127 = _1874 ? as_type<int>(_3125) : as_type<int>(_205);
    float _3129 = fma(_3119, _3119, 1.0);
    float _3131 = trunc(_3101);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    float _3137 = -_201;
    int _3139 = _2727 ? as_type<int>(_3137) : as_type<int>(_201);
    float _3141 = _3119 * _2895;
    bool _3143 = !_2687;
    float _3145 = _3143 ? _205 : as_type<float>(_3127);
    float _3147 = _3119 * _2879;
    float _3149 = _3119 * _2897;
    bool _3151 = !_2753;
    float _3153 = _3151 ? _201 : as_type<float>(_3139);
    float _3155 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3157 = trunc(_3117);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = _3105 * int(_3111);
    int _3165 = _3163 + _3033;
    int _3167 = int(_2983) + int(_3081);
    float _3169 = fma(_3155, _3037, _3147);
    float _3171 = fma(_3155, _3053, _3141);
    int _3173 = ~_2947;
    int _3175 = _3173 + 1;
    float _3177 = fma(_3155, _3045, _3149);
    float _3179 = float(uint(_3165));
    float _3181 = rsqrt(_3129);
    int _3183 = _3115 * int(_3135);
    int _3185 = _3183 + _3035;
    float _3187 = _2963 + _3171;
    float _3189 = as_type<float>(_3047) * _3179;
    float _3191 = _2971 + _3177;
    float _3193 = float(uint(_3185));
    int _3195 = _3123 * int(_3161);
    int _3197 = _3195 + _3043;
    float _3199 = as_type<float>(_3071) * _3193;
    float _3201 = fma(_403, _1870, _2773);
    float _3203 = float(uint(_3197));
    float _3205 = _3061 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3207 = _3119 * _3181;
    float _3209 = trunc(_3199);
    float _3211 = precise::max(_3209, 0.0);
    uint _3213 = uint(_3211);
    float _3215 = as_type<float>(_3099) * _3203;
    float _3217 = _3069 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3219 = -_3013;
    float _3221 = _3207 * _3219;
    float _3223 = -_2971;
    float _3225 = _3207 * _3223;
    float _3227 = _3013 + _3169;
    float _3229 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3231 = fma(_3181, _2879, _3221);
    float _3233 = trunc(_3215);
    float _3235 = precise::max(_3233, 0.0);
    uint _3237 = uint(_3235);
    float _3239 = _3097 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3241 = -_2963;
    float _3243 = _3207 * _3241;
    float _3245 = fma(_3181, _2897, _3225);
    float _3247 = _3205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3249 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3251 = _3239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3253 = ~_2841;
    int _3255 = _3253 + 1;
    float _3257 = trunc(_3189);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    int _3263 = int(_3135) + int(_3213);
    float _3265 = fma(_3181, _2895, _3243);
    out.m_66.x = _3247;
    out.m_66.y = _3249;
    out.m_66.z = _3251;
    out.m_66.w = _3229;
    int _3267 = ~_2937;
    int _3269 = _3267 + 1;
    int _3271 = _3175 * _3263;
    int _3273 = _3271 + _3035;
    int _3275 = _2927 ^ _2841;
    int _3277 = _3255 * _3167;
    int _3279 = _3277 + _2927;
    int _3281 = int(_3161) + int(_3237);
    out.m_68.x = _2765;
    out.m_68.y = _3201;
    bool _3283 = uint(_3279) >= uint(_2841);
    out.m_70.x = _3227;
    out.m_70.y = _3187;
    out.m_70.z = _3191;
    bool _3285 = uint(_3273) >= uint(_2947);
    int _3287 = int(_3111) + int(_3261);
    float _3289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3291 = ~_2997;
    int _3293 = _3291 + 1;
    out.m_72.x = _3231;
    out.m_72.y = _3265;
    out.m_72.z = _3245;
    bool _3295 = !_3283;
    int _3297 = _3295 ? 0 : (-1);
    int _3299 = _3269 * _3287;
    int _3301 = _3299 + _3033;
    int _3303 = ~_3167;
    int _3305 = _3303 + _3297;
    int _3307 = _3305 + 1;
    float _3309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3311 = uint(_3301) >= uint(_2937);
    int _3313 = _3293 * _3281;
    int _3315 = _3313 + _3043;
    bool _3317 = !_3285;
    int _3319 = _3317 ? 0 : (-1);
    int _3321 = _2841 * _3307;
    int _3323 = _3321 + _2927;
    bool _3325 = _2841 == 0;
    bool _3327 = uint(_3315) >= uint(_2997);
    float _3329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3331 = ~_3319;
    int _3333 = _3263 + _3331;
    int _3335 = _3333 + 1;
    bool _3337 = !_3327;
    int _3339 = _3337 ? 0 : (-1);
    uint _3341 = uint(int(uint(_3275) >> uint(31)));
    float _3343 = _3289 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3345 = ~_3339;
    int _3347 = _3281 + _3345;
    int _3349 = _3347 + 1;
    float _3351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3353 = _3033 ^ _2937;
    float _3355 = _3309 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3357 = ~int(_3341);
    int _3359 = _3357 + 1;
    float _3361 = _1215 + (-0.5);
    uint _3363 = uint(int(uint(_3353) >> uint(31)));
    bool _3365 = !_3311;
    int _3367 = _3365 ? 0 : (-1);
    float _3369 = _3329 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3371 = !_3325;
    int _3373 = _3371 ? _3323 : (-1);
    int _3375 = ~int(_3363);
    int _3377 = _3375 + 1;
    int _3379 = _3335 ^ _3359;
    int _3381 = ~_3287;
    int _3383 = _3381 + _3367;
    int _3385 = _3383 + 1;
    float _3387 = _3351 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3389 = float(_3373);
    bool _3391 = _2841 == 0;
    int _3393 = _2937 * _3385;
    int _3395 = _3393 + _3033;
    int _3397 = _3349 ^ _3377;
    float _3399 = fma(_3343, _3389, _833);
    int _3401 = ~_3359;
    int _3403 = _3401 + _3379;
    int _3405 = _3403 + 1;
    bool _3407 = _2937 == 0;
    bool _3409 = _2937 == 0;
    int _3411 = ~_3377;
    int _3413 = _3411 + _3397;
    int _3415 = _3413 + 1;
    bool _3417 = !_3391;
    int _3419 = _3417 ? _3405 : (-1);
    bool _3421 = !_3407;
    int _3423 = _3421 ? _3395 : (-1);
    bool _3425 = !_3409;
    int _3427 = _3425 ? _3415 : (-1);
    float _3429 = float(_3419);
    float _3431 = float(_3423);
    float _3433 = _3153 + 0.5;
    float _3435 = float(_3427);
    float _3437 = -_501;
    float _3439 = fma(_3369, _3429, _3437);
    float _3441 = _3145 + (-0.5);
    float _3443 = fma(_3343, _3433, _3399);
    float _3445 = fma(_3387, _3431, _885);
    float _3447 = -_855;
    float _3449 = fma(_3355, _3435, _3447);
    float _3451 = _3087 + 0.5;
    float _3453 = -_3369;
    float _3455 = fma(_3453, _3441, _3439);
    float _3457 = _1791 + _1767;
    float _3459 = -_3355;
    float _3461 = fma(_3459, _3361, _3449);
    float _3463 = fma(_3387, _3451, _3445);
    float _3465 = -_709;
    float _3467 = _3465 + 1.0;
    float _3469 = _1767 * 0.5;
    float _3471 = _3457 * 0.5;
    float _3473 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3475 = -_3467;
    float _3477 = fma(_3087, _3475, _3463);
    float _3479 = -_851;
    float _3481 = _3479 + 1.0;
    float _3483 = fma(_1813, -0.5, _3469);
    float _3485 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _3487 = _3473 * _1831;
    bool _3489 = _1515 > 0.0;
    bool _3491 = isnan(_1515);
    bool _3493 = _3489 || _3491;
    bool _3495 = isnan(0.0);
    bool _3497 = _3493 || _3495;
    float _3499 = -_1888;
    float _3501 = fma(_3153, _3499, _3443);
    float _3503 = fma(_1215, _3481, _3461);
    float _3505 = _3485 + _1767;
    float _3507 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3509 = _1842 * _3487;
    float _3511 = _1852 * _3487;
    float _3513 = -_3473;
    float _3515 = _3513 + 1.0;
    float _3517 = fma(_3145, _1896, _3455);
    out.gl_Position.x = _1791;
    out.gl_Position.y = _1813;
    out.gl_Position.z = _3485;
    out.gl_Position.w = _1767;
    float _3519 = _3505 * 0.5;
    float _3521 = _3507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3523 = fma(_1848, _3509, _1836);
    float _3525 = fma(_1850, _3509, _1838);
    float _3527 = _1842 * _3515;
    float _3529 = fma(_1842, _3511, _1840);
    out.m_74.x = _3471;
    out.m_74.y = _3483;
    out.m_74.z = _3519;
    out.m_74.w = _1767;
    out.m_76.x = _3501;
    out.m_76.y = _3517;
    out.m_76.z = _3477;
    out.m_76.w = _3503;
    out.m_45.x = _3521;
    out.m_78.x = _3523;
    out.m_78.y = _3525;
    out.m_78.z = _3529;
    out.m_78.w = _3527;
    if (_3497)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3531;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

