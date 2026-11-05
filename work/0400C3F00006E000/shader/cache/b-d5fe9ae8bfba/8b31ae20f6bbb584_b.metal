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
    float4 m_64 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_58 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
    float4 m_70 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _315 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_42.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_45.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3206 = as_type<float>(_115);
        out.gl_Position.z = _3206;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_47.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3276 = as_type<float>(_153);
        out.gl_Position.z = _3276;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_52.w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = in.m_42.x;
    float _179 = in.m_42.y;
    float _181 = in.m_42.z;
    float _183 = 0.0;
    float _185 = _157;
    if (!_169)
    {
        float _187 = _157 * _157;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_169)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_169;
    float _217 = _197;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_169;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _185 = _271;
    }
    float _273 = _185;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _173, _277);
    float _285 = fma(_273, _171, _279);
    float _287 = fma(_273, _175, _281);
    float _289 = fma(_283, _159, _179);
    float _291 = fma(_285, _159, _177);
    float _293 = fma(_287, _159, _181);
    bool _295 = !_275;
    float _313;
    if (!_295)
    {
        float _297 = in.m_54.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        float _317 = float(_99);
        float _319 = 1.0 / _317;
        float _321 = _133 * _319;
        _313 = _321;
    }
    _315 = false;
    float _323 = _313;
    float _325 = in.m_54.x;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    float _331 = in.m_54.y;
    float _333 = in.m_54.z;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _337 = int(_335);
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _343 = float(_99);
    float _345 = _325 * 2.0;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _349 = 1.0 / _343;
    bool _351 = _331 > 0.5;
    float _353 = _331 * 2.0;
    float _355 = float(_329);
    bool _357 = _333 > 0.5;
    float _359 = -_209;
    int _361 = _351 ? as_type<int>(_359) : as_type<int>(_209);
    float _363 = floor(_345);
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _375 = _373 != 0;
    float _377 = -_213;
    int _379 = _357 ? as_type<int>(_377) : as_type<int>(_213);
    bool _381 = !_371;
    float _383 = _381 ? _209 : as_type<float>(_361);
    float _385 = floor(_353);
    bool _387 = !_375;
    float _389 = _387 ? _213 : as_type<float>(_379);
    float _391 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _407 = _405 != 0;
    float _409 = -_339;
    float _411 = fma(_391, 2.0, _409);
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _415 = _413 != 0;
    float _417 = 1.0 / _395;
    bool _419 = _363 > 0.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _421;
    bool _425 = _363 >= 0.0;
    bool _427 = isnan(_363);
    bool _429 = _425 || _427;
    bool _431 = isnan(0.0);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _439 = _331 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _441 = !_403;
    int _443 = _441 ? 0 : 1;
    float _445 = _349 * _133;
    int _447 = _433 ? 0 : 1;
    float _449 = 1.0 / _437;
    float _451 = fma(_439, -2.0, _341);
    int _453 = ~_447;
    int _455 = _453 + 1;
    int _457 = _455 + 1;
    int _459 = _457;
    int _461 = as_type<int>(_391);
    if (!_419)
    {
        int _463 = ~_447;
        int _465 = _463 + 1;
        _459 = _465;
    }
    int _467 = _459;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _323 + _469;
    bool _473 = _385 > 0.0;
    float _475 = 1.0 / _423;
    float _477 = _385;
    if (_415)
    {
        _461 = 0;
    }
    int _479 = _461;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = _323 + _481;
    bool _485 = _385 >= 0.0;
    bool _487 = isnan(_385);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _471 * _417;
    int _497 = _479;
    if (!_415)
    {
        _497 = 1;
    }
    int _499 = _497;
    float _501 = _325 + _331;
    int _503 = _493 ? 0 : 1;
    float _505 = 1.0 / _355;
    bool _507 = _499 != 1;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _323 + _509;
    int _513 = ~_503;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _501 + (-1.0);
    int _521 = _517;
    float _523 = _519;
    if (!_473)
    {
        int _525 = ~_503;
        int _527 = _525 + 1;
        _521 = _527;
    }
    int _529 = _521;
    float _531 = _511 * _449;
    float _533 = _325 + _333;
    float _535 = _333 * 2.0;
    bool _537 = !_399;
    int _539 = _537 ? 0 : 1;
    float _541 = _483 * _475;
    float _543 = _533 + (-1.0);
    int _545 = as_type<int>(_533);
    if (_415)
    {
        _545 = 0;
    }
    int _547 = _545;
    float _549 = _333 + _331;
    int _551 = _547;
    if (!_415)
    {
        _551 = 2;
    }
    int _553 = _551;
    float _555 = floor(_535);
    bool _557 = !_407;
    int _559 = _557 ? 0 : 1;
    float _561 = _549 + (-1.0);
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _573 = _571 != 0;
    float _575 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _577 = _553 != 2;
    float _579 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _581 = as_type<float>(_553);
    if (!_507)
    {
        _477 = _331;
    }
    float _583 = _477;
    float _585 = _505 * _133;
    float _587 = 0.0;
    float _589 = _583;
    if (!_507)
    {
        _587 = _583;
    }
    float _591 = _587;
    float _593 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _595 = 0.0;
    float _597 = _591;
    if (!_507)
    {
        _595 = _333;
    }
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _601;
    float _605 = _599;
    if (!_507)
    {
        _523 = _333;
    }
    float _607 = _523;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _609;
    float _613 = _607;
    if (_507)
    {
        _597 = _325;
    }
    float _615 = _597;
    float _617 = fma(_603, _495, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    if (_507)
    {
        _589 = _325;
    }
    float _619 = _589;
    float _621 = fma(_611, _495, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_507)
    {
        _605 = _331;
    }
    float _623 = _605;
    float _625 = _615 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_507)
    {
        _613 = _331;
    }
    float _627 = _613;
    if (_577)
    {
        _581 = _325;
    }
    float _629 = _581;
    bool _631 = _555 >= 0.0;
    bool _633 = isnan(_555);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = _629;
    if (!_577)
    {
        _641 = _333;
    }
    float _643 = _641;
    int _645 = _639 ? 0 : 1;
    bool _647 = _555 > 0.0;
    float _649 = _643 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _659 = -_347;
    float _661 = fma(_649, 2.0, _659);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _665 = !_565;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_653, _531, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _671 = fma(_657, _531, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _673 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[83].z, _663);
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _681 = abs(_667);
    float _683 = -_133;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[86].x, _661);
    int _687 = ~_645;
    int _689 = _687 + 1;
    int _691 = _689 + 1;
    int _693 = _691;
    float _695 = _679;
    if (!_647)
    {
        int _697 = ~_645;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    float _703 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].w, _679);
    float _705 = float(_467);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _711 = _623 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _713 = float(_701);
    float _715 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _703);
    float _717 = float(_681);
    float _719 = fma(_711, -2.0, _707);
    if (_577)
    {
        _695 = _331;
    }
    float _721 = _695;
    float _723 = _677 * _133;
    float _725 = _721;
    if (!_577)
    {
        _725 = _325;
    }
    float _727 = _725;
    float _729 = _717 * _713;
    float _731 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _719);
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _735 = !_569;
    int _737 = _735 ? 0 : 1;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _741 = float(_337);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _745 = fma(_733, -2.0, _709);
    float _747 = exp2(_723);
    float _749 = -_739;
    float _751 = fma(_625, 2.0, _749);
    float _753 = in.m_56.x;
    float _755 = in.m_56.y;
    float _757 = in.m_56.z;
    int _759 = abs(_737);
    float _761 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _743);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _765 = 1.0 + _763;
    float _767 = float(_759);
    float _769 = 1.0 / _741;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(1.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = _767 * _705;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _787 = -_747;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _765;
    bool _793 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _801 = _797 || _799;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _805 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    float _807 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[88].w, _785);
    float _809 = _801 ? _789 : 0.0;
    float _811 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[88].z, _803);
    float _813 = -_133;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[76].x, _411);
    float _817 = _769 * _133;
    float _819 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _761);
    float _821 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _823 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _825 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _811);
    float _827 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _807);
    float _829 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _673);
    float _831 = -_133;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[81].x, _751);
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _745);
    float _837 = _729 * (-2.0);
    if (_781)
    {
        float _839 = _809 * _791;
        _135 = _839;
    }
    float _841 = _135;
    bool _843 = !_573;
    int _845 = _843 ? 0 : 1;
    bool _847 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _849 = isnan(_323);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_575, _837, _575);
    float _861 = fma(_837, _753, _753);
    int _863 = abs(_845);
    float _865 = _325 + (-0.5);
    bool _867 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _869 = isnan(_323);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -_857;
    float _881 = _879 + 1.0;
    float _883 = float(_529);
    float _885 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[196].x, _861);
    bool _887 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_323);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _877 * _881;
    float _901 = float(_863);
    float _903 = -_877;
    float _905 = _903 + 1.0;
    float _907 = _783 * (-2.0);
    float _909 = fma(_859, _841, _885);
    bool _911 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _913 = isnan(_323);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _919 = _915 || _917;
    float _921 = float(_919);
    float _923 = _897 * _905;
    float _925 = _331 + (-0.5);
    float _927 = fma(_907, _755, _755);
    float _929 = _901 * _883;
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = _909 * 0.15915493667125701904296875;
    float _937 = fma(_579, _907, _579);
    float _939 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[196].y, _927);
    float _941 = _921 * _933;
    float _943 = _929 * (-2.0);
    float _945 = fma(_937, _841, _939);
    float _947 = _621 * _941;
    float _949 = _617 * _941;
    float _951 = fma(_593, _943, _593);
    float _953 = fma(_943, _757, _757);
    float _955 = in.m_52.x;
    float _957 = in.m_52.y;
    float _959 = _333 + (-0.5);
    float _961 = -_921;
    float _963 = _961 + 1.0;
    float _965 = _945 * 0.15915493667125701904296875;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _967;
    float _971 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].z, _953);
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[143].x, _949);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _975;
    float _979 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[143].y, _947);
    float _981 = fma(_969, _541, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _983 = fma(_951, _841, _971);
    float _985 = fma(_977, _541, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _987 = fma(_671, _923, _979);
    float _989 = fma(_669, _923, _973);
    float _991 = _983 * 0.15915493667125701904296875;
    float _993 = _935 * 6.283185482025146484375;
    float _995 = sin(_993);
    float _997 = fma(_985, _899, _987);
    float _999 = fma(_981, _899, _989);
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1003 = in.m_54.w;
    float _1005 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[146].y, _997);
    float _1007 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[146].x, _999);
    float _1009 = _935 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = _1005 * _957;
    float _1015 = _1007 * _955;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1019 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1021 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1023 = _965 * 6.283185482025146484375;
    float _1025 = sin(_1023);
    float _1027 = _1019 * _1001;
    float _1029 = _1021 * _1017;
    float _1031 = _965 * 6.283185482025146484375;
    float _1033 = cos(_1031);
    bool _1035 = _1003 > 0.5;
    float _1037 = _991 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1011 * _1025;
    float _1043 = _995 * _1025;
    float _1045 = -_213;
    int _1047 = _1035 ? as_type<int>(_1045) : as_type<int>(_213);
    bool _1049 = !_367;
    float _1051 = _1049 ? _213 : as_type<float>(_1047);
    float _1053 = _991 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _995 * _1033;
    float _1059 = _1011 * _1033;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1075 = _1073 != 0;
    float _1077 = _1011 * _1039;
    float _1079 = _995 * _1039;
    float _1081 = _1033 * _1039;
    float _1083 = _1025 * _1039;
    bool _1085 = !_1067;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1063;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = -_1041;
    float _1095 = fma(_1055, _1057, _1093);
    float _1097 = -_1057;
    float _1099 = fma(_1055, _1041, _1097);
    float _1101 = fma(_1055, _1059, _1043);
    float _1103 = _1077 * _1027;
    float _1105 = fma(_1055, _1043, _1059);
    float _1107 = -_1027;
    float _1109 = _1055 * _1107;
    float _1111 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = fma(_1101, _1029, _1103);
    float _1115 = _1079 * _1027;
    float _1117 = fma(_1081, _1029, _1109);
    bool _1119 = !_1071;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = fma(_1099, _1111, _1113);
    float _1125 = fma(_1095, _1029, _1115);
    float _1127 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1129 = fma(_1083, _1111, _1117);
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1133 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1135 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1137 = fma(_1105, _1111, _1125);
    float _1139 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1141 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1131);
    float _1143 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1133);
    float _1145 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1135);
    float _1147 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1151 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1147);
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1159 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1161 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1165 = _1153 + _1157;
    float _1167 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1159);
    bool _1169 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1171 = isnan(0.5);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1177 = _1173 || _1175;
    float _1179 = _1161 + _1163;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1165 + _1181;
    float _1185 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1167);
    bool _1187 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1189 = isnan(0.5);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1195 = _1191 || _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1199 = _1179 + _1197;
    float _1201 = _1183 * _1183;
    float _1203 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1205 = !_1075;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = fma(_1199, _1199, _1201);
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1213 = sqrt(_1209);
    float _1215 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1211);
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1219 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1215);
    float _1221 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1217);
    float _1223 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1225 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    float _1229 = 1.0 / _1223;
    float _1231 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1233 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1235 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1231);
    float _1239 = _1233 + _1223;
    float _1241 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1243 = _1203 + _1241;
    float _1245 = _1239 * _1229;
    float _1247 = _1245 * 0.5;
    float _1249 = _1223;
    float _1251 = _1229;
    float _1253 = _1239;
    float _1255 = _1213;
    float _1257 = _1129;
    float _1259 = _857;
    float _1261 = _1209;
    if (!_1235)
    {
        _1249 = _1179;
    }
    float _1263 = _1249;
    float _1265 = _1263;
    if (!_1235)
    {
        _1251 = _1165;
    }
    float _1267 = _1251;
    float _1269 = _1267;
    if (!_1235)
    {
        _1253 = _1243;
    }
    float _1271 = _1253;
    bool _1273 = !_1235;
    float _1275 = _1271;
    if (!_1273)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1281 = _1213 + _1279;
        float _1283 = rsqrt(_1209);
        float _1285 = _1281 * _1277;
        float _1287 = _1243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = _1285 * 0.15915493667125701904296875;
        float _1291 = _1289 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = _1293 + (-1.0);
        float _1301 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = fma(_1297, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1305 = fma(_1243, _1293, _1301);
        float _1307 = _1283 * _1303;
        float _1309 = fma(_1199, _1307, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1311 = fma(_1183, _1307, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1265 = _1309;
        _1275 = _1305;
        _1269 = _1311;
        _1255 = _1307;
        _1257 = _1283;
    }
    float _1313 = _1265;
    float _1315 = _1275;
    float _1317 = _1269;
    float _1319 = _1255;
    float _1321 = _1257;
    float _1323 = _1319;
    float _1325 = _1315;
    float _1327 = _1313;
    float _1329 = _1317;
    float _1331 = _1321;
    if (_1195)
    {
        _1259 = 1.0;
    }
    float _1333 = _1259;
    float _1335 = _1333;
    if (!_1177)
    {
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1339 = _1203 + _1337;
        float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1343 = _1161 + _1341;
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1347 = -_1161;
        float _1349 = _1347 + _1313;
        float _1351 = _1339 * _1339;
        float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1355 = _1153 + _1353;
        float _1357 = -_1203;
        float _1359 = _1357 + _1315;
        float _1361 = fma(_1343, _1343, _1351);
        float _1363 = fma(_1355, _1355, _1361);
        float _1365 = sqrt(_1363);
        float _1367 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1369 = _1367 * _1345;
        float _1371 = -_1153;
        float _1373 = _1371 + _1317;
        float _1375 = fma(_1349, _1369, _1161);
        float _1377 = fma(_1359, _1369, _1203);
        float _1379 = fma(_1373, _1369, _1153);
        _1323 = _1365;
        _1325 = _1377;
        _1327 = _1375;
        _1329 = _1379;
        _1331 = _1369;
    }
    float _1381 = _1323;
    float _1383 = _1325;
    float _1385 = _1327;
    float _1387 = _1329;
    float _1389 = _1331;
    float _1391 = _1389;
    float _1393 = _1381;
    if (!_1195)
    {
        float _1395 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1403 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
        float _1405 = _1397 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        float _1409 = _1399 * 0.15915493667125701904296875;
        float _1411 = _1397 * 6.283185482025146484375;
        float _1413 = sin(_1411);
        float _1415 = 1.0 / _1407;
        float _1417 = _1409 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = _1413 * _1415;
        float _1423 = _1409 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = 1.0 / _1403;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1433 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1431;
        float _1435 = 1.0 / _1427;
        float _1437 = 1.0 / _1433;
        float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1441 = _1429 * _1439;
        float _1443 = _1425 * _1435;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = fma(_1443, _1441, _1445);
        float _1449 = _1447 * _1437;
        float _1451 = precise::clamp(_1449, 0.0, 1.0);
        float _1453 = -_1451;
        float _1455 = _1453 + 1.0;
        _1391 = _1409;
        _1393 = _1441;
        _1335 = _1455;
    }
    float _1457 = _1391;
    float _1459 = _1393;
    float _1461 = _1335;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1465 = _1383 + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1469 = _1385 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1473 = _1387 + _1471;
    float _1475 = _1465 * _1465;
    float _1477 = fma(_1469, _1469, _1475);
    float _1479 = fma(_1473, _1473, _1477);
    float _1481 = rsqrt(_1479);
    float _1483 = sqrt(_1479);
    float _1485 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1487 = _1469 * _1485;
    float _1489 = _1473 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 * _1489;
    float _1495 = _1491 + _1493;
    float _1497 = sqrt(_1495);
    bool _1499 = _1497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1497 + _1501;
    float _1505 = _1481;
    float _1507 = _1503;
    float _1509 = _1457;
    float _1511 = _1465;
    if (_1499)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1505 = _1513;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (_1499)
    {
        float _1519 = _1503 * _1515;
        _1507 = _1519;
    }
    float _1521 = _1507;
    if (_1499)
    {
        float _1523 = rsqrt(_1495);
        _1517 = _1523;
    }
    float _1525 = _1517;
    float _1527 = _1525;
    if (_1499)
    {
        float _1529 = _1521 * 0.15915493667125701904296875;
        _1509 = _1529;
    }
    float _1531 = _1509;
    float _1533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1535 = _1473;
    float _1537 = _1531;
    if (_1499)
    {
        float _1539 = _1531 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = precise::max(0.0, _1533);
    float _1547 = _1459;
    float _1549 = _1545;
    if (_1499)
    {
        float _1551 = _1531 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        _1547 = _1553;
    }
    float _1555 = _1547;
    float _1557 = -_1485;
    float _1559 = -_1545;
    float _1561 = fma(_1465, _1557, _1559);
    if (_1499)
    {
        float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1563;
    }
    float _1565 = _1511;
    float _1567 = _1543;
    float _1569 = _1565;
    if (_1499)
    {
        float _1571 = fma(_1543, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1567 = _1571;
    }
    float _1573 = _1567;
    float _1575 = _1573;
    if (!_1499)
    {
        _1569 = _1561;
    }
    float _1577 = _1569;
    float _1579 = _1577;
    if (_1499)
    {
        float _1581 = _1525 * _1573;
        _1261 = _1581;
    }
    float _1583 = _1261;
    if (!_1499)
    {
        _1527 = _1487;
    }
    float _1585 = _1527;
    float _1587 = _1585;
    float _1589 = _1555;
    if (_1499)
    {
        float _1591 = _1555 + (-1.0);
        _1549 = _1591;
    }
    float _1593 = _1549;
    float _1595 = _1593;
    if (_1499)
    {
        float _1597 = _1487 * _1583;
        _1587 = _1597;
    }
    float _1599 = _1587;
    if (!_1499)
    {
        _1575 = _1491;
    }
    float _1601 = _1575;
    float _1603 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1601;
    if (_1499)
    {
        float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1537 = _1607;
    }
    float _1609 = _1537;
    if (!_1499)
    {
        _1595 = _1489;
    }
    float _1611 = _1595;
    float _1613 = _1611;
    if (_1499)
    {
        float _1615 = _1489 * _1583;
        _1613 = _1615;
    }
    float _1617 = _1613;
    if (_1499)
    {
        float _1619 = _1599 * _1599;
        _1605 = _1619;
    }
    float _1621 = _1605;
    if (_1499)
    {
        float _1623 = fma(_1561, _1555, _1609);
        _1579 = _1623;
    }
    float _1625 = _1579;
    if (!_1499)
    {
        _1589 = _1493;
    }
    float _1627 = _1589;
    float _1629 = _1627;
    if (_1499)
    {
        float _1631 = _1617 * _1617;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = fma(_1625, _1625, _1621);
    float _1637 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1639 = _1635 + _1633;
    float _1641 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1643 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1647 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1645);
    float _1649 = precise::clamp(_1647, 0.0, 1.0);
    float _1651 = rsqrt(_1639);
    float _1653 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1655 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1657 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1659 = -_1649;
    float _1661 = _1659 + 1.0;
    float _1663 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1665 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1655);
    float _1667 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1657);
    float _1669 = abs(_1661);
    float _1671 = log2(_1669);
    float _1673 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1665);
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1681 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1683 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1687 = _1651 * _1599;
    float _1689 = _1651 * _1625;
    float _1691 = _1651 * _1617;
    float _1693 = -_1679;
    float _1695 = fma(_1693, _1637, 1.0);
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1699 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1681);
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1685);
    float _1703 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1705 = -_1697;
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1705);
    float _1709 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1711 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1701);
    float _1713 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1715 = -_1691;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1707);
    float _1719 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1721 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1711);
    float _1723 = log2(_1695);
    float _1725 = fma(_1717, -0.5, 0.5);
    float _1727 = fma(_1717, 0.5, 0.5);
    float _1729 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1719);
    float _1731 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1703);
    float _1733 = _1689 + 1.0;
    float _1735 = fma(_1727, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1737 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1729);
    float _1739 = exp2(_1713);
    float _1741 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1731);
    float _1743 = fma(_1727, _1735, -0.212114393711090087890625);
    float _1745 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1737);
    float _1747 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1749 = fma(_1727, _1743, 1.570728778839111328125);
    float _1751 = 1.0 / _1721;
    float _1753 = _1723 * 0.693147182464599609375;
    float _1755 = sqrt(_1725);
    float _1757 = -_1689;
    float _1759 = fma(_1739, _1733, _1757);
    float _1761 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1763 = fma(_1759, 0.5, 0.5);
    float _1765 = _1745 * _1751;
    float _1767 = _1747 * _1751;
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = fma(_1767, -0.5, 0.5);
    float _1773 = _1755 * 0.636619746685028076171875;
    float _1775 = -_1749;
    float _1777 = fma(_1773, _1775, 1.0);
    float3 _5817 = float3(_1769, _1771, _1761);
    float _1779 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5817, float3(0.0), isnan(_5817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5817, float3(0.0), isnan(_5817)), level(0.0)).x;
    float3 _5828 = float3(_1769, _1771, _1761);
    float4 _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5828, float3(0.0), isnan(_5828)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5828, float3(0.0), isnan(_5828)), level(0.0)).xyzw;
    float _1784 = _1782.x;
    float _1786 = _1782.y;
    float _1788 = _1782.z;
    float _1790 = _1782.w;
    float2 _5845 = float2(_1777, _1763);
    float3 _1794 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5845, float2(0.0), isnan(_5845)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5845, float2(0.0), isnan(_5845)), level(0.0)).xyz;
    float _1796 = _1794.x;
    float _1798 = _1794.y;
    float _1800 = _1794.z;
    float _1802 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1804 = int(_1802);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1808 = _1806 != 0;
    float _1810 = -_825;
    float _1812 = _1810 + 1.0;
    bool _1814 = _331 > 0.5;
    float _1816 = -_827;
    float _1818 = _1816 + 1.0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1822 = _1820 != 0;
    float _1824 = -_829;
    float _1826 = _1824 + 1.0;
    float _1828 = trunc(_585);
    int _1830 = int(_1828);
    float _1832 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1834 = -_213;
    float _1836 = _1834 + 0.5;
    float _1838 = _209 + 0.5;
    int _1840 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1842 = _1840 != 0;
    float _1844 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1846 = _1832 * _325;
    float _1848 = 0.0;
    if (_1808)
    {
        _1848 = _325;
    }
    float _1850 = _1848;
    float _1852 = trunc(_817);
    int _1854 = int(_1852);
    float _1856 = float(uint(_1804));
    out.m_58.x = _1838;
    out.m_58.y = _1836;
    int _1858 = ~_1804;
    int _1860 = _1858 + 1;
    float _1862 = _1850;
    if (!_1808)
    {
        _1862 = _331;
    }
    float _1864 = _1862;
    out.m_60.x = _1385;
    out.m_60.y = _1383;
    out.m_60.z = _1387;
    float _1866 = 1.0 / _1856;
    float _1868 = float(uint(_1830));
    int _1870 = ~_1804;
    int _1872 = _1870 + 1;
    float _1874 = 0.0;
    if (_1808)
    {
        _1874 = 1.0;
    }
    float _1876 = _1874;
    float _1878 = _1876;
    if (!_1808)
    {
        _1878 = 7.345489978790283203125;
    }
    float _1880 = _1878;
    float _1882 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1884 = int(_1882);
    float _1886 = float(uint(_1854));
    float _1888 = float(_1830);
    int _1890 = abs(_1087);
    float _1892 = trunc(_1846);
    int _1894 = int(_1892);
    int _1896 = as_type<int>(_1866) + (-2);
    float _1898 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1900 = abs(_1091);
    float _1902 = as_type<float>(_1896) * _1868;
    bool _1904 = _333 > 0.5;
    float _1906 = _1898 * _325;
    float _1908 = float(uint(_1884));
    float _1910 = _389 + (-0.5);
    float _1912 = exp2(_1844);
    int _1914 = _1894 << 4;
    int _1916 = _1914 + 1712;
    float _1918 = trunc(_1902);
    float _1920 = precise::max(_1918, 0.0);
    uint _1923 = uint(_1920);
    int _1925 = _1916 + 8;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    uint _1929 = uint(int(uint(int(_1927)) >> uint(2)));
    int _1931 = int(_1927) & 3;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[int(_1929)][_1931];
    float _1935 = trunc(_1906);
    int _1937 = int(_1935);
    float _1939 = -_1912;
    float _1941 = _1939 + 1.0;
    float _1943 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1945 = _1860 * int(_1923);
    int _1947 = _1945 + _1830;
    float _1949 = 1.0 / _1908;
    float _1951 = -_1943;
    float _1953 = _1951 + 1.0;
    float _1955 = float(uint(_1947));
    int _1957 = _1937 << 4;
    int _1959 = _1957 + 1968;
    float _1961 = as_type<float>(_1896) * _1955;
    int _1963 = _1959 + 8;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    uint _1967 = uint(int(uint(int(_1965)) >> uint(2)));
    int _1969 = int(_1965) & 3;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[int(_1967)][_1969];
    float _1973 = trunc(_1961);
    float _1975 = precise::max(_1973, 0.0);
    uint _1977 = uint(_1975);
    int _1979 = as_type<int>(_1949) + (-2);
    uint _1981 = uint(int(uint(_1916) >> uint(2)));
    uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
    int _1985 = int(_1981) & 3;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[int(_1983)][_1985];
    int _1989 = int(_1981) + 1;
    uint _1991 = uint(int(uint(_1989) >> uint(2)));
    int _1993 = _1989 & 3;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[int(_1991)][_1993];
    float _1997 = as_type<float>(_1979) * _1886;
    float _1999 = trunc(_1997);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    int _2005 = int(_1923) + int(_1977);
    uint _2007 = uint(int(uint(_1959) >> uint(2)));
    uint _2009 = uint(int(uint(int(_2007)) >> uint(2)));
    int _2011 = int(_2007) & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    int _2015 = int(_2007) + 1;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    int _2019 = _2015 & 3;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[int(_2017)][_2019];
    int _2023 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2025 = _2023 != 0;
    int _2027 = _1872 * _2005;
    int _2029 = _2027 + _1830;
    float _2031 = -_213;
    float _2033 = _1814 ? _2031 : _213;
    int _2035 = ~_1884;
    int _2037 = _2035 + 1;
    bool _2039 = !_2025;
    float _2041 = _2039 ? _213 : _2033;
    bool _2043 = _325 > 0.5;
    float _2045 = _1880 * _325;
    bool _2047 = uint(_2029) >= uint(_1804);
    float _2049 = -_209;
    int _2051 = _2043 ? as_type<int>(_2049) : as_type<int>(_209);
    float _2053 = floor(_2045);
    float _2055 = _2033;
    if (_1808)
    {
        _2055 = 1.0;
    }
    float _2057 = _2055;
    bool _2059 = !_1842;
    float _2061 = _2059 ? _209 : as_type<float>(_2051);
    float _2063 = _2057;
    if (!_1808)
    {
        _2063 = 1.2345600128173828125;
    }
    float _2065 = _2063;
    float _2067 = _2041 + (-0.5);
    bool _2069 = !_2047;
    int _2071 = _2069 ? 0 : (-1);
    float _2073 = _2065 * _1864;
    int _2075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2077 = _2075 != 0;
    float _2079 = -_2067;
    float _2081 = -_821;
    float _2083 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2087 = _2085 != 0;
    int _2089 = _2037 * int(_2003);
    int _2091 = _2089 + _1854;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2095 = _2093 != 0;
    float _2097 = floor(_2073);
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2101 = _2099 != 0;
    float _2103 = _1987 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2107 = _2105 != 0;
    float _2109 = _2061 + 0.5;
    float _2111 = float(uint(_2091));
    float _2113 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2115 = float(_1804);
    float _2117 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[80].x, _815);
    float _2119 = as_type<float>(_1979) * _2111;
    bool _2121 = _1888 >= _2115;
    bool _2123 = isnan(_1888);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(_2115);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    float _2133 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2137 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2143 = _1971 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = -_2053;
    float _2149 = _2045 + _2147;
    float _2151 = _2013 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2153 = _1933 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2155 = trunc(_2131);
    int _2157 = int(_2155);
    float _2159 = _2149 * _2115;
    float _2161 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2165 = ~_2005;
    int _2167 = _2165 + _2071;
    int _2169 = _2167 + 1;
    float _2171 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2173 = -_2097;
    float _2175 = _2073 + _2173;
    bool _2177 = !_2087;
    int _2179 = _2177 ? 0 : 1;
    float _2181 = trunc(_2119);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    bool _2187 = _1804 == 0;
    out.m_62.x = _2133;
    out.m_62.y = _2135;
    out.m_62.z = _2171;
    out.m_62.w = _2139;
    int _2189 = abs(_2179);
    float _2191 = float(_1884);
    out.m_64.x = _2161;
    out.m_64.y = _2145;
    out.m_64.z = _2163;
    out.m_64.w = _2141;
    int _2193 = ~_1884;
    int _2195 = _2193 + 1;
    float _2197 = trunc(_2159);
    int _2199 = int(_2197);
    float _2201 = _2175 * _2191;
    int _2203 = _1804 * _2169;
    int _2205 = _2203 + _1830;
    float _2207 = _2115 * _445;
    int _2209 = ~_2157;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    float _2215 = _2191 * _445;
    float _2217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2219 = !_2187;
    int _2221 = _2219 ? _2205 : (-1);
    int _2223 = int(_2003) + int(_2185);
    int _2225 = _2199 * _2189;
    int _2227 = _2225 + _1830;
    float _2229 = float(_1854);
    int _2231 = _2221 * _2213;
    int _2233 = _1804 + (-1);
    float _2235 = trunc(_2207);
    int _2237 = int(_2235);
    bool _2239 = _2229 >= _2191;
    bool _2241 = isnan(_2229);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(_2191);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    int _2251 = _2195 * _2223;
    int _2253 = _2251 + _1854;
    bool _2255 = !_2107;
    int _2257 = _2255 ? 0 : 1;
    int _2259 = _2157 * _2233;
    int _2261 = _2259 + _2231;
    int _2263 = abs(_443);
    bool _2265 = uint(_2253) >= uint(_1884);
    float _2267 = trunc(_2201);
    int _2269 = int(_2267);
    int _2271 = abs(_539);
    int _2273 = _2261 * _2263;
    int _2275 = abs(_2257);
    bool _2277 = !_2265;
    int _2279 = _2277 ? 0 : (-1);
    int _2281 = abs(_559);
    float _2283 = trunc(_2249);
    int _2285 = int(_2283);
    int _2287 = _2237 * _2271;
    int _2289 = _2287 + _2273;
    int _2291 = ~_2223;
    int _2293 = _2291 + _2279;
    int _2295 = _2293 + 1;
    float _2297 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2299 = float(uint(_2227));
    int _2301 = _2269 * _2275;
    int _2303 = _2301 + _1854;
    bool _2305 = _1884 == 0;
    int _2307 = _1884 * _2295;
    int _2309 = _2307 + _1854;
    float _2311 = _383 + 0.5;
    int _2313 = _2227 * _2281;
    int _2315 = _2313 + _2289;
    bool _2317 = !_1822;
    int _2319 = _2317 ? 0 : 1;
    float _2321 = as_type<float>(_1896) * _2299;
    float _2323 = float(uint(_2303));
    float _2325 = fma(_2297, _2311, _685);
    int _2327 = abs(_2319);
    float _2329 = trunc(_2215);
    int _2331 = int(_2329);
    int _2333 = ~_2285;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    float _2339 = as_type<float>(_1979) * _2323;
    bool _2341 = !_2305;
    int _2343 = _2341 ? _2309 : (-1);
    float _2345 = -_1812;
    float _2347 = fma(_383, _2345, _2325);
    int _2349 = _1884 + (-1);
    float _2351 = trunc(_2321);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = _2343 * _2337;
    int _2359 = _2199 * _2327;
    int _2361 = _2359 + _2315;
    int _2363 = ~_1804;
    int _2365 = _2363 + 1;
    int _2367 = _2285 * _2349;
    int _2369 = _2367 + _2357;
    int _2371 = ~_1884;
    int _2373 = _2371 + 1;
    float _2375 = trunc(_2339);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    float _2381 = float(uint(_2361));
    int _2383 = _2365 * int(_2355);
    int _2385 = _2383 + _2227;
    float _2387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2389 = _2369 * _1890;
    float _2391 = as_type<float>(_1896) * _2381;
    float _2393 = float(uint(_2385));
    int _2395 = _2373 * int(_2379);
    int _2397 = _2395 + _2303;
    int _2399 = abs(_1121);
    int _2401 = _2331 * _1900;
    int _2403 = _2401 + _2389;
    int _2405 = abs(_1207);
    float _2407 = trunc(_2391);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = float(uint(_2397));
    int _2415 = _2303 * _2399;
    int _2417 = _2415 + _2403;
    float _2419 = -_209;
    int _2421 = _1904 ? as_type<int>(_2419) : as_type<int>(_209);
    float _2423 = as_type<float>(_1896) * _2393;
    int _2425 = ~_1804;
    int _2427 = _2425 + 1;
    float _2429 = as_type<float>(_1979) * _2413;
    bool _2431 = !_2077;
    float _2433 = _2431 ? _209 : as_type<float>(_2421);
    int _2435 = _2269 * _2405;
    int _2437 = _2435 + _2417;
    float _2439 = trunc(_2423);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = _1051 + (-0.5);
    float _2447 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2449 = _2433 + 0.5;
    float _2451 = float(uint(_2437));
    float _2453 = -_2445;
    float _2455 = -_731;
    float _2457 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2455);
    float _2459 = -_2447;
    float _2461 = -_835;
    float _2463 = fma(_2459, _1910, _2461);
    float _2465 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[85].x, _833);
    int _2467 = _2427 * int(_2411);
    int _2469 = _2467 + _2361;
    float _2471 = as_type<float>(_1979) * _2451;
    float _2473 = -_819;
    float _2475 = _2473 + 1.0;
    int _2477 = ~_1884;
    int _2479 = _2477 + 1;
    float _2481 = trunc(_2429);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    float _2487 = float(uint(_2469));
    float _2489 = fma(_389, _1818, _2463);
    int _2491 = ~_1804;
    int _2493 = _2491 + 1;
    float _2495 = -_1826;
    float _2497 = fma(_2433, _2495, _2465);
    int _2499 = int(_2355) + int(_2443);
    float _2501 = -_715;
    float _2503 = _2501 + 1.0;
    float _2505 = as_type<float>(_1896) * _2487;
    float _2507 = trunc(_2471);
    float _2509 = precise::max(_2507, 0.0);
    uint _2511 = uint(_2509);
    float _2513 = fma(_1051, _2503, _2457);
    int _2515 = ~_1884;
    int _2517 = _2515 + 1;
    float _2519 = -_823;
    float _2521 = _2519 + 1.0;
    float _2523 = -_2475;
    float _2525 = fma(_2061, _2523, _2117);
    out.m_66.x = _2347;
    out.m_66.y = _2489;
    float _2527 = _1943 * _1779;
    float _2529 = trunc(_2505);
    float _2531 = precise::max(_2529, 0.0);
    uint _2533 = uint(_2531);
    int _2535 = int(_2379) + int(_2485);
    float _2537 = fma(_2041, _2521, _2083);
    float _2539 = _1800 * _2527;
    out.m_68.x = _2525;
    out.m_68.y = _2537;
    out.m_68.z = _2497;
    out.m_68.w = _2513;
    int _2541 = _2479 * int(_2511);
    int _2543 = _2541 + _2437;
    float _2545 = float(uint(_2543));
    int _2547 = _2493 * _2499;
    int _2549 = _2547 + _2227;
    float _2551 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2553 = int(_2411) + int(_2533);
    float _2555 = as_type<float>(_1979) * _2545;
    bool _2557 = uint(_2549) >= uint(_1804);
    int _2559 = _2517 * _2535;
    int _2561 = _2559 + _2303;
    float _2563 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2565 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2567 = !_2557;
    int _2569 = _2567 ? 0 : (-1);
    float _2571 = trunc(_2555);
    float _2573 = precise::max(_2571, 0.0);
    uint _2575 = uint(_2573);
    bool _2577 = uint(_2561) >= uint(_1884);
    float _2579 = -_1055;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2565);
    int _2583 = ~_1804;
    int _2585 = _2583 + 1;
    float _2587 = -_1055;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2563);
    bool _2591 = !_2577;
    int _2593 = _2591 ? 0 : (-1);
    float _2595 = -_1055;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2551);
    int _2599 = ~_2499;
    int _2601 = _2599 + _2569;
    int _2603 = _2601 + 1;
    int _2605 = _2585 * _2553;
    int _2607 = _2605 + _2361;
    int _2609 = ~_2535;
    int _2611 = _2609 + _2593;
    int _2613 = _2611 + 1;
    float _2615 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2617 = ~_1884;
    int _2619 = _2617 + 1;
    float _2621 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2623 = uint(_2607) >= uint(_1804);
    float _2625 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2615);
    float _2627 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2629 = int(_2511) + int(_2575);
    float _2631 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2621);
    bool _2633 = !_2623;
    int _2635 = _2633 ? 0 : (-1);
    float _2637 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2639 = fma(_2627, _2627, 1.0);
    int _2641 = _2619 * _2629;
    int _2643 = _2641 + _2437;
    int _2645 = ~_2553;
    int _2647 = _2645 + _2635;
    int _2649 = _2647 + 1;
    float _2651 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2653 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2637);
    int _2655 = _1804 * _2603;
    int _2657 = _2655 + _2227;
    bool _2659 = uint(_2643) >= uint(_1884);
    int _2661 = _1804 * _2649;
    int _2663 = _2661 + _2361;
    float _2665 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2667 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2669 = !_2659;
    int _2671 = _2669 ? 0 : (-1);
    float _2673 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2651);
    bool _2675 = !_2187;
    int _2677 = _2675 ? _2663 : (-1);
    float _2679 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2665);
    int _2681 = ~_2629;
    int _2683 = _2681 + _2671;
    int _2685 = _2683 + 1;
    float _2687 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2667);
    int _2689 = _2677 >> 31;
    float _2691 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2693 = _2677 & 3;
    bool _2695 = _2693 != 0;
    int _2697 = _1884 * _2685;
    int _2699 = _2697 + _2437;
    int _2701 = _2689 & 3;
    float _2703 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2679);
    float _2705 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2653);
    float _2707 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    bool _2709 = !_2305;
    int _2711 = _2709 ? _2699 : (-1);
    float _2713 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2673);
    int _2715 = _2677 + _2701;
    float _2717 = rsqrt(_2639);
    int _2719 = _2711 >> 31;
    float _2721 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2631);
    int _2723 = _2677 & 3;
    bool _2725 = _2723 != 0;
    float _2727 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2625);
    int _2729 = _2719 & 3;
    float _2731 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2597);
    bool _2733 = uint(_2723) >= 2u;
    float _2735 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2589);
    int _2737 = _2711 + _2729;
    float _2739 = _2627 * _2731;
    int _2741 = _2715 >> 2;
    float _2743 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2687);
    int _2745 = _2733 ? 0 : 1;
    float _2747 = _2627 * _2735;
    bool _2749 = _2723 != 3;
    float _2751 = fma(_2691, _2727, _2739);
    int _2753 = _2737 >> 2;
    float _2755 = _2627 * _2717;
    int _2757 = _2741 << 4;
    int _2759 = _2757 + 368;
    float _2761 = _2627 * _2707;
    int _2763 = _2753 << 4;
    int _2765 = _2763 + 512;
    float _2767 = fma(_2691, _2721, _2747);
    uint _2769 = uint(int(uint(_2759) >> uint(2)));
    uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
    int _2773 = int(_2769) & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    int _2777 = int(_2769) + 1;
    uint _2779 = uint(int(uint(_2777) >> uint(2)));
    int _2781 = _2777 & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = ~_2745;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = fma(_2691, _2705, _2761);
    int _2793 = _2695 ? 0 : 1;
    float _2795 = -_2713;
    float _2797 = _2755 * _2795;
    int _2799 = _2789;
    if (_2749)
    {
        int _2801 = ~_2745;
        int _2803 = _2801 + 1;
        _2799 = _2803;
    }
    int _2805 = _2799;
    int _2807 = _1884 * _2613;
    int _2809 = _2807 + _2303;
    bool _2811 = uint(_2723) > 1u;
    uint _2813 = uint(int(uint(_2765) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    float _2829 = fma(_2717, _2735, _2797);
    float _2831 = _2713 + _2767;
    bool _2833 = !_2725;
    int _2835 = _2833 ? 0 : 1;
    float _2837 = -_2703;
    float _2839 = _2755 * _2837;
    int _2841 = _2711 & 3;
    bool _2843 = _2841 != 0;
    float _2845 = _2703 + _2751;
    int _2847 = ~_2793;
    int _2849 = _2847 + 1;
    int _2851 = _2849 + 1;
    int _2853 = _2759 + 8;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    uint _2857 = uint(int(uint(int(_2855)) >> uint(2)));
    int _2859 = int(_2855) & 3;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[int(_2857)][_2859];
    int _2863 = int(_2855) + 1;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    int _2867 = _2863 & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    bool _2871 = uint(_2841) > 1u;
    float _2873 = fma(_2717, _2731, _2839);
    out.m_70.x = _2721;
    out.m_70.y = _2727;
    out.m_70.z = _2705;
    int _2875 = _2851;
    if (!_2811)
    {
        int _2877 = ~_2793;
        int _2879 = _2877 + 1;
        _2875 = _2879;
    }
    int _2881 = _2875;
    int _2883 = _2711 & 3;
    bool _2885 = _2883 != 0;
    float _2887 = -_2743;
    float _2889 = _2755 * _2887;
    int _2891 = _2765 + 8;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    uint _2895 = uint(int(uint(int(_2893)) >> uint(2)));
    int _2897 = int(_2893) & 3;
    float _2899 = (*spvDescriptorSet0.vp_c9)._m0[int(_2895)][_2897];
    int _2901 = int(_2893) + 1;
    uint _2903 = uint(int(uint(_2901) >> uint(2)));
    int _2905 = _2901 & 3;
    float _2907 = (*spvDescriptorSet0.vp_c9)._m0[int(_2903)][_2905];
    bool _2909 = !_2187;
    int _2911 = _2909 ? _2657 : (-1);
    float _2913 = _2743 + _2791;
    float _2915 = fma(_2717, _2707, _2889);
    int _2917 = _2885 ? 0 : 1;
    bool _2919 = !_2843;
    int _2921 = _2919 ? 0 : 1;
    out.m_72.x = _2831;
    out.m_72.y = _2845;
    out.m_72.z = _2913;
    bool _2923 = _2723 != 3;
    float _2925 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2927 = ~_2917;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    out.m_74.x = _2829;
    out.m_74.y = _2873;
    out.m_74.z = _2915;
    int _2933 = _2931;
    if (!_2871)
    {
        int _2935 = ~_2917;
        int _2937 = _2935 + 1;
        _2933 = _2937;
    }
    int _2939 = _2933;
    float _2941 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2925);
    int _2943 = abs(_2881);
    bool _2945 = _2841 != 3;
    float _2947 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2941);
    int _2949 = abs(_2939);
    int _2951 = abs(_2835);
    float _2953 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2947);
    int _2955 = ~_2943;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    bool _2961 = uint(_2841) >= 2u;
    int _2963 = abs(_2805);
    int _2965 = _2959 * as_type<int>(_2783);
    int _2967 = ~_2949;
    int _2969 = _2967 + 1;
    int _2971 = _2969 + 1;
    out.gl_Position.x = _1745;
    out.gl_Position.y = _1747;
    out.gl_Position.z = _2953;
    out.gl_Position.w = _1721;
    int _2973 = ~_2951;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    int _2979 = _2961 ? 0 : 1;
    int _2981 = _2971 * as_type<int>(_2827);
    int _2983 = ~_2963;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    int _2989 = _2977 * as_type<int>(_2775);
    int _2991 = _2989 + _2965;
    bool _2993 = _2841 != 3;
    int _2995 = ~_2979;
    int _2997 = _2995 + 1;
    int _2999 = _2997 + 1;
    int _3001 = _2999;
    if (_2945)
    {
        int _3003 = ~_2979;
        int _3005 = _3003 + 1;
        _3001 = _3005;
    }
    int _3007 = _3001;
    int _3009 = _2987 * as_type<int>(_2861);
    int _3011 = _3009 + _2991;
    int _3013 = abs(_2921);
    float _3015 = fma(_1790, _2539, _1788);
    bool _3017 = !_2993;
    int _3019 = _3017 ? 0 : (-1);
    bool _3021 = !_2095;
    int _3023 = _3021 ? 0 : 1;
    bool _3025 = !_2923;
    int _3027 = _3025 ? 0 : (-1);
    int _3029 = abs(_3007);
    int _3031 = ~_3013;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    bool _3037 = !_2101;
    int _3039 = _3037 ? 0 : 1;
    int _3041 = abs(_3019);
    int _3043 = _3035 * as_type<int>(_2819);
    int _3045 = _3043 + _2981;
    int _3047 = abs(_3027);
    int _3049 = abs(_3023);
    int _3051 = ~_3029;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    int _3057 = abs(_3039);
    int _3059 = _3055 * as_type<int>(_2899);
    int _3061 = _3059 + _3045;
    int _3063 = ~_3047;
    int _3065 = _3063 + 1;
    int _3067 = _3065 + 1;
    int _3069 = ~_3049;
    int _3071 = _3069 + 1;
    int _3073 = _3071 + 1;
    int _3075 = ~_3041;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    int _3081 = _3067 * as_type<int>(_2869);
    int _3083 = _3081 + _3011;
    int _3085 = ~_3057;
    int _3087 = _3085 + 1;
    int _3089 = _3087 + 1;
    bool _3091 = !_2305;
    int _3093 = _3091 ? _2809 : (-1);
    int _3095 = _3083 * _3073;
    bool _3097 = _1461 > 0.0;
    bool _3099 = isnan(_1461);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    int _3107 = _3079 * as_type<int>(_2907);
    int _3109 = _3107 + _3061;
    float _3111 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3113 = _2911 * _3049;
    int _3115 = _3113 + _3095;
    float _3117 = _1721 * 0.5;
    int _3119 = _3109 * _3089;
    float _3121 = _1745 + _1721;
    float _3123 = fma(_1747, -0.5, _3117);
    int _3125 = _3093 * _3057;
    int _3127 = _3125 + _3119;
    float _3129 = _2953 + _1721;
    float _3131 = _1790 * _2527;
    float _3133 = _3121 * 0.5;
    float _3135 = _3129 * 0.5;
    float _3137 = float(_3115);
    float _3139 = _3111 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3141 = float(_3127);
    float _3143 = fma(_1796, _3131, _1784);
    float _3145 = fma(_1798, _3131, _1786);
    float _3147 = _1790 * _1953;
    out.m_76.x = _3133;
    out.m_76.y = _3123;
    out.m_76.z = _3135;
    out.m_76.w = _1721;
    out.m_78.x = _3137;
    out.m_78.y = _3141;
    out.m_45.x = _3139;
    out.m_80.x = _3143;
    out.m_80.y = _3145;
    out.m_80.z = _3015;
    out.m_80.w = _3147;
    if (_3105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3149;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _315 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_42.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_45.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3206 = as_type<float>(_115);
        out.gl_Position.z = _3206;
    }
    if (!_103)
    {
        return out;
    }
    float _119 = in.m_47.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3276 = as_type<float>(_153);
        out.gl_Position.z = _3276;
    }
    if (_145)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_52.w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = in.m_42.x;
    float _179 = in.m_42.y;
    float _181 = in.m_42.z;
    float _183 = 0.0;
    float _185 = _157;
    if (!_169)
    {
        float _187 = _157 * _157;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_169)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_169;
    float _217 = _197;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_169;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _185 = _271;
    }
    float _273 = _185;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _173, _277);
    float _285 = fma(_273, _171, _279);
    float _287 = fma(_273, _175, _281);
    float _289 = fma(_283, _159, _179);
    float _291 = fma(_285, _159, _177);
    float _293 = fma(_287, _159, _181);
    bool _295 = !_275;
    float _313;
    if (!_295)
    {
        float _297 = in.m_54.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        float _317 = float(_99);
        float _319 = 1.0 / _317;
        float _321 = _133 * _319;
        _313 = _321;
    }
    _315 = false;
    float _323 = _313;
    float _325 = in.m_54.x;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    float _331 = in.m_54.y;
    float _333 = in.m_54.z;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _337 = int(_335);
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _343 = float(_99);
    float _345 = _325 * 2.0;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _349 = 1.0 / _343;
    bool _351 = _331 > 0.5;
    float _353 = _331 * 2.0;
    float _355 = float(_329);
    bool _357 = _333 > 0.5;
    float _359 = -_209;
    int _361 = _351 ? as_type<int>(_359) : as_type<int>(_209);
    float _363 = floor(_345);
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _375 = _373 != 0;
    float _377 = -_213;
    int _379 = _357 ? as_type<int>(_377) : as_type<int>(_213);
    bool _381 = !_371;
    float _383 = _381 ? _209 : as_type<float>(_361);
    float _385 = floor(_353);
    bool _387 = !_375;
    float _389 = _387 ? _213 : as_type<float>(_379);
    float _391 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _407 = _405 != 0;
    float _409 = -_339;
    float _411 = fma(_391, 2.0, _409);
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _415 = _413 != 0;
    float _417 = 1.0 / _395;
    bool _419 = _363 > 0.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _421;
    bool _425 = _363 >= 0.0;
    bool _427 = isnan(_363);
    bool _429 = _425 || _427;
    bool _431 = isnan(0.0);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _439 = _331 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _441 = !_403;
    int _443 = _441 ? 0 : 1;
    float _445 = _349 * _133;
    int _447 = _433 ? 0 : 1;
    float _449 = 1.0 / _437;
    float _451 = fma(_439, -2.0, _341);
    int _453 = ~_447;
    int _455 = _453 + 1;
    int _457 = _455 + 1;
    int _459 = _457;
    int _461 = as_type<int>(_391);
    if (!_419)
    {
        int _463 = ~_447;
        int _465 = _463 + 1;
        _459 = _465;
    }
    int _467 = _459;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _323 + _469;
    bool _473 = _385 > 0.0;
    float _475 = 1.0 / _423;
    float _477 = _385;
    if (_415)
    {
        _461 = 0;
    }
    int _479 = _461;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = _323 + _481;
    bool _485 = _385 >= 0.0;
    bool _487 = isnan(_385);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _471 * _417;
    int _497 = _479;
    if (!_415)
    {
        _497 = 1;
    }
    int _499 = _497;
    float _501 = _325 + _331;
    int _503 = _493 ? 0 : 1;
    float _505 = 1.0 / _355;
    bool _507 = _499 != 1;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _323 + _509;
    int _513 = ~_503;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _501 + (-1.0);
    int _521 = _517;
    float _523 = _519;
    if (!_473)
    {
        int _525 = ~_503;
        int _527 = _525 + 1;
        _521 = _527;
    }
    int _529 = _521;
    float _531 = _511 * _449;
    float _533 = _325 + _333;
    float _535 = _333 * 2.0;
    bool _537 = !_399;
    int _539 = _537 ? 0 : 1;
    float _541 = _483 * _475;
    float _543 = _533 + (-1.0);
    int _545 = as_type<int>(_533);
    if (_415)
    {
        _545 = 0;
    }
    int _547 = _545;
    float _549 = _333 + _331;
    int _551 = _547;
    if (!_415)
    {
        _551 = 2;
    }
    int _553 = _551;
    float _555 = floor(_535);
    bool _557 = !_407;
    int _559 = _557 ? 0 : 1;
    float _561 = _549 + (-1.0);
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _573 = _571 != 0;
    float _575 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _577 = _553 != 2;
    float _579 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _581 = as_type<float>(_553);
    if (!_507)
    {
        _477 = _331;
    }
    float _583 = _477;
    float _585 = _505 * _133;
    float _587 = 0.0;
    float _589 = _583;
    if (!_507)
    {
        _587 = _583;
    }
    float _591 = _587;
    float _593 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _595 = 0.0;
    float _597 = _591;
    if (!_507)
    {
        _595 = _333;
    }
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _601;
    float _605 = _599;
    if (!_507)
    {
        _523 = _333;
    }
    float _607 = _523;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _609;
    float _613 = _607;
    if (_507)
    {
        _597 = _325;
    }
    float _615 = _597;
    float _617 = fma(_603, _495, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    if (_507)
    {
        _589 = _325;
    }
    float _619 = _589;
    float _621 = fma(_611, _495, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_507)
    {
        _605 = _331;
    }
    float _623 = _605;
    float _625 = _615 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_507)
    {
        _613 = _331;
    }
    float _627 = _613;
    if (_577)
    {
        _581 = _325;
    }
    float _629 = _581;
    bool _631 = _555 >= 0.0;
    bool _633 = isnan(_555);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = _629;
    if (!_577)
    {
        _641 = _333;
    }
    float _643 = _641;
    int _645 = _639 ? 0 : 1;
    bool _647 = _555 > 0.0;
    float _649 = _643 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _659 = -_347;
    float _661 = fma(_649, 2.0, _659);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _665 = !_565;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_653, _531, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _671 = fma(_657, _531, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _673 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[83].z, _663);
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _681 = abs(_667);
    float _683 = -_133;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[86].x, _661);
    int _687 = ~_645;
    int _689 = _687 + 1;
    int _691 = _689 + 1;
    int _693 = _691;
    float _695 = _679;
    if (!_647)
    {
        int _697 = ~_645;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    float _703 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].w, _679);
    float _705 = float(_467);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _711 = _623 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _713 = float(_701);
    float _715 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _703);
    float _717 = float(_681);
    float _719 = fma(_711, -2.0, _707);
    if (_577)
    {
        _695 = _331;
    }
    float _721 = _695;
    float _723 = _677 * _133;
    float _725 = _721;
    if (!_577)
    {
        _725 = _325;
    }
    float _727 = _725;
    float _729 = _717 * _713;
    float _731 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _719);
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _735 = !_569;
    int _737 = _735 ? 0 : 1;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _741 = float(_337);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _745 = fma(_733, -2.0, _709);
    float _747 = exp2(_723);
    float _749 = -_739;
    float _751 = fma(_625, 2.0, _749);
    float _753 = in.m_56.x;
    float _755 = in.m_56.y;
    float _757 = in.m_56.z;
    int _759 = abs(_737);
    float _761 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _743);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _765 = 1.0 + _763;
    float _767 = float(_759);
    float _769 = 1.0 / _741;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(1.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = _767 * _705;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _787 = -_747;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _765;
    bool _793 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _801 = _797 || _799;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _805 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    float _807 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[88].w, _785);
    float _809 = _801 ? _789 : 0.0;
    float _811 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[88].z, _803);
    float _813 = -_133;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[76].x, _411);
    float _817 = _769 * _133;
    float _819 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _761);
    float _821 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _823 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _825 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _811);
    float _827 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _807);
    float _829 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _673);
    float _831 = -_133;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[81].x, _751);
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _745);
    float _837 = _729 * (-2.0);
    if (_781)
    {
        float _839 = _809 * _791;
        _135 = _839;
    }
    float _841 = _135;
    bool _843 = !_573;
    int _845 = _843 ? 0 : 1;
    bool _847 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _849 = isnan(_323);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_575, _837, _575);
    float _861 = fma(_837, _753, _753);
    int _863 = abs(_845);
    float _865 = _325 + (-0.5);
    bool _867 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _869 = isnan(_323);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -_857;
    float _881 = _879 + 1.0;
    float _883 = float(_529);
    float _885 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[196].x, _861);
    bool _887 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_323);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _877 * _881;
    float _901 = float(_863);
    float _903 = -_877;
    float _905 = _903 + 1.0;
    float _907 = _783 * (-2.0);
    float _909 = fma(_859, _841, _885);
    bool _911 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _913 = isnan(_323);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _919 = _915 || _917;
    float _921 = float(_919);
    float _923 = _897 * _905;
    float _925 = _331 + (-0.5);
    float _927 = fma(_907, _755, _755);
    float _929 = _901 * _883;
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = _909 * 0.15915493667125701904296875;
    float _937 = fma(_579, _907, _579);
    float _939 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[196].y, _927);
    float _941 = _921 * _933;
    float _943 = _929 * (-2.0);
    float _945 = fma(_937, _841, _939);
    float _947 = _621 * _941;
    float _949 = _617 * _941;
    float _951 = fma(_593, _943, _593);
    float _953 = fma(_943, _757, _757);
    float _955 = in.m_52.x;
    float _957 = in.m_52.y;
    float _959 = _333 + (-0.5);
    float _961 = -_921;
    float _963 = _961 + 1.0;
    float _965 = _945 * 0.15915493667125701904296875;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _967;
    float _971 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].z, _953);
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[143].x, _949);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _975;
    float _979 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[143].y, _947);
    float _981 = fma(_969, _541, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _983 = fma(_951, _841, _971);
    float _985 = fma(_977, _541, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _987 = fma(_671, _923, _979);
    float _989 = fma(_669, _923, _973);
    float _991 = _983 * 0.15915493667125701904296875;
    float _993 = _935 * 6.283185482025146484375;
    float _995 = sin(_993);
    float _997 = fma(_985, _899, _987);
    float _999 = fma(_981, _899, _989);
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1003 = in.m_54.w;
    float _1005 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[146].y, _997);
    float _1007 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[146].x, _999);
    float _1009 = _935 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = _1005 * _957;
    float _1015 = _1007 * _955;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1019 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1021 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1023 = _965 * 6.283185482025146484375;
    float _1025 = sin(_1023);
    float _1027 = _1019 * _1001;
    float _1029 = _1021 * _1017;
    float _1031 = _965 * 6.283185482025146484375;
    float _1033 = cos(_1031);
    bool _1035 = _1003 > 0.5;
    float _1037 = _991 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1011 * _1025;
    float _1043 = _995 * _1025;
    float _1045 = -_213;
    int _1047 = _1035 ? as_type<int>(_1045) : as_type<int>(_213);
    bool _1049 = !_367;
    float _1051 = _1049 ? _213 : as_type<float>(_1047);
    float _1053 = _991 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _995 * _1033;
    float _1059 = _1011 * _1033;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1075 = _1073 != 0;
    float _1077 = _1011 * _1039;
    float _1079 = _995 * _1039;
    float _1081 = _1033 * _1039;
    float _1083 = _1025 * _1039;
    bool _1085 = !_1067;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1063;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = -_1041;
    float _1095 = fma(_1055, _1057, _1093);
    float _1097 = -_1057;
    float _1099 = fma(_1055, _1041, _1097);
    float _1101 = fma(_1055, _1059, _1043);
    float _1103 = _1077 * _1027;
    float _1105 = fma(_1055, _1043, _1059);
    float _1107 = -_1027;
    float _1109 = _1055 * _1107;
    float _1111 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = fma(_1101, _1029, _1103);
    float _1115 = _1079 * _1027;
    float _1117 = fma(_1081, _1029, _1109);
    bool _1119 = !_1071;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = fma(_1099, _1111, _1113);
    float _1125 = fma(_1095, _1029, _1115);
    float _1127 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1129 = fma(_1083, _1111, _1117);
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1133 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1135 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1137 = fma(_1105, _1111, _1125);
    float _1139 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1141 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1131);
    float _1143 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1133);
    float _1145 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1135);
    float _1147 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1151 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1147);
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1159 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1161 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1165 = _1153 + _1157;
    float _1167 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1159);
    bool _1169 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1171 = isnan(0.5);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1177 = _1173 || _1175;
    float _1179 = _1161 + _1163;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1165 + _1181;
    float _1185 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1167);
    bool _1187 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1189 = isnan(0.5);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1195 = _1191 || _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1199 = _1179 + _1197;
    float _1201 = _1183 * _1183;
    float _1203 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1205 = !_1075;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = fma(_1199, _1199, _1201);
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1213 = sqrt(_1209);
    float _1215 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1211);
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1219 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1215);
    float _1221 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1217);
    float _1223 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1225 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    float _1229 = 1.0 / _1223;
    float _1231 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1233 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1235 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1231);
    float _1239 = _1233 + _1223;
    float _1241 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1243 = _1203 + _1241;
    float _1245 = _1239 * _1229;
    float _1247 = _1245 * 0.5;
    float _1249 = _1223;
    float _1251 = _1229;
    float _1253 = _1239;
    float _1255 = _1213;
    float _1257 = _1129;
    float _1259 = _857;
    float _1261 = _1209;
    if (!_1235)
    {
        _1249 = _1179;
    }
    float _1263 = _1249;
    float _1265 = _1263;
    if (!_1235)
    {
        _1251 = _1165;
    }
    float _1267 = _1251;
    float _1269 = _1267;
    if (!_1235)
    {
        _1253 = _1243;
    }
    float _1271 = _1253;
    bool _1273 = !_1235;
    float _1275 = _1271;
    if (!_1273)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1281 = _1213 + _1279;
        float _1283 = rsqrt(_1209);
        float _1285 = _1281 * _1277;
        float _1287 = _1243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = _1285 * 0.15915493667125701904296875;
        float _1291 = _1289 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = _1293 + (-1.0);
        float _1301 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = fma(_1297, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1305 = fma(_1243, _1293, _1301);
        float _1307 = _1283 * _1303;
        float _1309 = fma(_1199, _1307, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1311 = fma(_1183, _1307, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1265 = _1309;
        _1275 = _1305;
        _1269 = _1311;
        _1255 = _1307;
        _1257 = _1283;
    }
    float _1313 = _1265;
    float _1315 = _1275;
    float _1317 = _1269;
    float _1319 = _1255;
    float _1321 = _1257;
    float _1323 = _1319;
    float _1325 = _1315;
    float _1327 = _1313;
    float _1329 = _1317;
    float _1331 = _1321;
    if (_1195)
    {
        _1259 = 1.0;
    }
    float _1333 = _1259;
    float _1335 = _1333;
    if (!_1177)
    {
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1339 = _1203 + _1337;
        float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1343 = _1161 + _1341;
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1347 = -_1161;
        float _1349 = _1347 + _1313;
        float _1351 = _1339 * _1339;
        float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1355 = _1153 + _1353;
        float _1357 = -_1203;
        float _1359 = _1357 + _1315;
        float _1361 = fma(_1343, _1343, _1351);
        float _1363 = fma(_1355, _1355, _1361);
        float _1365 = sqrt(_1363);
        float _1367 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1369 = _1367 * _1345;
        float _1371 = -_1153;
        float _1373 = _1371 + _1317;
        float _1375 = fma(_1349, _1369, _1161);
        float _1377 = fma(_1359, _1369, _1203);
        float _1379 = fma(_1373, _1369, _1153);
        _1323 = _1365;
        _1325 = _1377;
        _1327 = _1375;
        _1329 = _1379;
        _1331 = _1369;
    }
    float _1381 = _1323;
    float _1383 = _1325;
    float _1385 = _1327;
    float _1387 = _1329;
    float _1389 = _1331;
    float _1391 = _1389;
    float _1393 = _1381;
    if (!_1195)
    {
        float _1395 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1403 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
        float _1405 = _1397 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        float _1409 = _1399 * 0.15915493667125701904296875;
        float _1411 = _1397 * 6.283185482025146484375;
        float _1413 = sin(_1411);
        float _1415 = 1.0 / _1407;
        float _1417 = _1409 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = _1413 * _1415;
        float _1423 = _1409 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = 1.0 / _1403;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1433 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1431;
        float _1435 = 1.0 / _1427;
        float _1437 = 1.0 / _1433;
        float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1441 = _1429 * _1439;
        float _1443 = _1425 * _1435;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = fma(_1443, _1441, _1445);
        float _1449 = _1447 * _1437;
        float _1451 = precise::clamp(_1449, 0.0, 1.0);
        float _1453 = -_1451;
        float _1455 = _1453 + 1.0;
        _1391 = _1409;
        _1393 = _1441;
        _1335 = _1455;
    }
    float _1457 = _1391;
    float _1459 = _1393;
    float _1461 = _1335;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1465 = _1383 + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1469 = _1385 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1473 = _1387 + _1471;
    float _1475 = _1465 * _1465;
    float _1477 = fma(_1469, _1469, _1475);
    float _1479 = fma(_1473, _1473, _1477);
    float _1481 = rsqrt(_1479);
    float _1483 = sqrt(_1479);
    float _1485 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1487 = _1469 * _1485;
    float _1489 = _1473 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 * _1489;
    float _1495 = _1491 + _1493;
    float _1497 = sqrt(_1495);
    bool _1499 = _1497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1497 + _1501;
    float _1505 = _1481;
    float _1507 = _1503;
    float _1509 = _1457;
    float _1511 = _1465;
    if (_1499)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1505 = _1513;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (_1499)
    {
        float _1519 = _1503 * _1515;
        _1507 = _1519;
    }
    float _1521 = _1507;
    if (_1499)
    {
        float _1523 = rsqrt(_1495);
        _1517 = _1523;
    }
    float _1525 = _1517;
    float _1527 = _1525;
    if (_1499)
    {
        float _1529 = _1521 * 0.15915493667125701904296875;
        _1509 = _1529;
    }
    float _1531 = _1509;
    float _1533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1535 = _1473;
    float _1537 = _1531;
    if (_1499)
    {
        float _1539 = _1531 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = precise::max(0.0, _1533);
    float _1547 = _1459;
    float _1549 = _1545;
    if (_1499)
    {
        float _1551 = _1531 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        _1547 = _1553;
    }
    float _1555 = _1547;
    float _1557 = -_1485;
    float _1559 = -_1545;
    float _1561 = fma(_1465, _1557, _1559);
    if (_1499)
    {
        float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1563;
    }
    float _1565 = _1511;
    float _1567 = _1543;
    float _1569 = _1565;
    if (_1499)
    {
        float _1571 = fma(_1543, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1567 = _1571;
    }
    float _1573 = _1567;
    float _1575 = _1573;
    if (!_1499)
    {
        _1569 = _1561;
    }
    float _1577 = _1569;
    float _1579 = _1577;
    if (_1499)
    {
        float _1581 = _1525 * _1573;
        _1261 = _1581;
    }
    float _1583 = _1261;
    if (!_1499)
    {
        _1527 = _1487;
    }
    float _1585 = _1527;
    float _1587 = _1585;
    float _1589 = _1555;
    if (_1499)
    {
        float _1591 = _1555 + (-1.0);
        _1549 = _1591;
    }
    float _1593 = _1549;
    float _1595 = _1593;
    if (_1499)
    {
        float _1597 = _1487 * _1583;
        _1587 = _1597;
    }
    float _1599 = _1587;
    if (!_1499)
    {
        _1575 = _1491;
    }
    float _1601 = _1575;
    float _1603 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1601;
    if (_1499)
    {
        float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1537 = _1607;
    }
    float _1609 = _1537;
    if (!_1499)
    {
        _1595 = _1489;
    }
    float _1611 = _1595;
    float _1613 = _1611;
    if (_1499)
    {
        float _1615 = _1489 * _1583;
        _1613 = _1615;
    }
    float _1617 = _1613;
    if (_1499)
    {
        float _1619 = _1599 * _1599;
        _1605 = _1619;
    }
    float _1621 = _1605;
    if (_1499)
    {
        float _1623 = fma(_1561, _1555, _1609);
        _1579 = _1623;
    }
    float _1625 = _1579;
    if (!_1499)
    {
        _1589 = _1493;
    }
    float _1627 = _1589;
    float _1629 = _1627;
    if (_1499)
    {
        float _1631 = _1617 * _1617;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = fma(_1625, _1625, _1621);
    float _1637 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1639 = _1635 + _1633;
    float _1641 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1643 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1647 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1645);
    float _1649 = precise::clamp(_1647, 0.0, 1.0);
    float _1651 = rsqrt(_1639);
    float _1653 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1655 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1657 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1659 = -_1649;
    float _1661 = _1659 + 1.0;
    float _1663 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1665 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1655);
    float _1667 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1657);
    float _1669 = abs(_1661);
    float _1671 = log2(_1669);
    float _1673 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1665);
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1681 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1683 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1687 = _1651 * _1599;
    float _1689 = _1651 * _1625;
    float _1691 = _1651 * _1617;
    float _1693 = -_1679;
    float _1695 = fma(_1693, _1637, 1.0);
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1699 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1681);
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1685);
    float _1703 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1705 = -_1697;
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1705);
    float _1709 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1711 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1701);
    float _1713 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1715 = -_1691;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1707);
    float _1719 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1721 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1711);
    float _1723 = log2(_1695);
    float _1725 = fma(_1717, -0.5, 0.5);
    float _1727 = fma(_1717, 0.5, 0.5);
    float _1729 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1719);
    float _1731 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1703);
    float _1733 = _1689 + 1.0;
    float _1735 = fma(_1727, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1737 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1729);
    float _1739 = exp2(_1713);
    float _1741 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1731);
    float _1743 = fma(_1727, _1735, -0.212114393711090087890625);
    float _1745 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1737);
    float _1747 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1749 = fma(_1727, _1743, 1.570728778839111328125);
    float _1751 = 1.0 / _1721;
    float _1753 = _1723 * 0.693147182464599609375;
    float _1755 = sqrt(_1725);
    float _1757 = -_1689;
    float _1759 = fma(_1739, _1733, _1757);
    float _1761 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1763 = fma(_1759, 0.5, 0.5);
    float _1765 = _1745 * _1751;
    float _1767 = _1747 * _1751;
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = fma(_1767, -0.5, 0.5);
    float _1773 = _1755 * 0.636619746685028076171875;
    float _1775 = -_1749;
    float _1777 = fma(_1773, _1775, 1.0);
    float3 _5817 = float3(_1769, _1771, _1761);
    float _1779 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5817, float3(0.0), isnan(_5817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5817, float3(0.0), isnan(_5817)), level(0.0)).x;
    float3 _5828 = float3(_1769, _1771, _1761);
    float4 _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5828, float3(0.0), isnan(_5828)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5828, float3(0.0), isnan(_5828)), level(0.0)).xyzw;
    float _1784 = _1782.x;
    float _1786 = _1782.y;
    float _1788 = _1782.z;
    float _1790 = _1782.w;
    float2 _5845 = float2(_1777, _1763);
    float3 _1794 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5845, float2(0.0), isnan(_5845)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5845, float2(0.0), isnan(_5845)), level(0.0)).xyz;
    float _1796 = _1794.x;
    float _1798 = _1794.y;
    float _1800 = _1794.z;
    float _1802 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1804 = int(_1802);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1808 = _1806 != 0;
    float _1810 = -_825;
    float _1812 = _1810 + 1.0;
    bool _1814 = _331 > 0.5;
    float _1816 = -_827;
    float _1818 = _1816 + 1.0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1822 = _1820 != 0;
    float _1824 = -_829;
    float _1826 = _1824 + 1.0;
    float _1828 = trunc(_585);
    int _1830 = int(_1828);
    float _1832 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1834 = -_213;
    float _1836 = _1834 + 0.5;
    float _1838 = _209 + 0.5;
    int _1840 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1842 = _1840 != 0;
    float _1844 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1846 = _1832 * _325;
    float _1848 = 0.0;
    if (_1808)
    {
        _1848 = _325;
    }
    float _1850 = _1848;
    float _1852 = trunc(_817);
    int _1854 = int(_1852);
    float _1856 = float(uint(_1804));
    out.m_58.x = _1838;
    out.m_58.y = _1836;
    int _1858 = ~_1804;
    int _1860 = _1858 + 1;
    float _1862 = _1850;
    if (!_1808)
    {
        _1862 = _331;
    }
    float _1864 = _1862;
    out.m_60.x = _1385;
    out.m_60.y = _1383;
    out.m_60.z = _1387;
    float _1866 = 1.0 / _1856;
    float _1868 = float(uint(_1830));
    int _1870 = ~_1804;
    int _1872 = _1870 + 1;
    float _1874 = 0.0;
    if (_1808)
    {
        _1874 = 1.0;
    }
    float _1876 = _1874;
    float _1878 = _1876;
    if (!_1808)
    {
        _1878 = 7.345489978790283203125;
    }
    float _1880 = _1878;
    float _1882 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1884 = int(_1882);
    float _1886 = float(uint(_1854));
    float _1888 = float(_1830);
    int _1890 = abs(_1087);
    float _1892 = trunc(_1846);
    int _1894 = int(_1892);
    int _1896 = as_type<int>(_1866) + (-2);
    float _1898 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1900 = abs(_1091);
    float _1902 = as_type<float>(_1896) * _1868;
    bool _1904 = _333 > 0.5;
    float _1906 = _1898 * _325;
    float _1908 = float(uint(_1884));
    float _1910 = _389 + (-0.5);
    float _1912 = exp2(_1844);
    int _1914 = _1894 << 4;
    int _1916 = _1914 + 1712;
    float _1918 = trunc(_1902);
    float _1920 = precise::max(_1918, 0.0);
    uint _1923 = uint(_1920);
    int _1925 = _1916 + 8;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    uint _1929 = uint(int(uint(int(_1927)) >> uint(2)));
    int _1931 = int(_1927) & 3;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[int(_1929)][_1931];
    float _1935 = trunc(_1906);
    int _1937 = int(_1935);
    float _1939 = -_1912;
    float _1941 = _1939 + 1.0;
    float _1943 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1945 = _1860 * int(_1923);
    int _1947 = _1945 + _1830;
    float _1949 = 1.0 / _1908;
    float _1951 = -_1943;
    float _1953 = _1951 + 1.0;
    float _1955 = float(uint(_1947));
    int _1957 = _1937 << 4;
    int _1959 = _1957 + 1968;
    float _1961 = as_type<float>(_1896) * _1955;
    int _1963 = _1959 + 8;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    uint _1967 = uint(int(uint(int(_1965)) >> uint(2)));
    int _1969 = int(_1965) & 3;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[int(_1967)][_1969];
    float _1973 = trunc(_1961);
    float _1975 = precise::max(_1973, 0.0);
    uint _1977 = uint(_1975);
    int _1979 = as_type<int>(_1949) + (-2);
    uint _1981 = uint(int(uint(_1916) >> uint(2)));
    uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
    int _1985 = int(_1981) & 3;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[int(_1983)][_1985];
    int _1989 = int(_1981) + 1;
    uint _1991 = uint(int(uint(_1989) >> uint(2)));
    int _1993 = _1989 & 3;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[int(_1991)][_1993];
    float _1997 = as_type<float>(_1979) * _1886;
    float _1999 = trunc(_1997);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    int _2005 = int(_1923) + int(_1977);
    uint _2007 = uint(int(uint(_1959) >> uint(2)));
    uint _2009 = uint(int(uint(int(_2007)) >> uint(2)));
    int _2011 = int(_2007) & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    int _2015 = int(_2007) + 1;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    int _2019 = _2015 & 3;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[int(_2017)][_2019];
    int _2023 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2025 = _2023 != 0;
    int _2027 = _1872 * _2005;
    int _2029 = _2027 + _1830;
    float _2031 = -_213;
    float _2033 = _1814 ? _2031 : _213;
    int _2035 = ~_1884;
    int _2037 = _2035 + 1;
    bool _2039 = !_2025;
    float _2041 = _2039 ? _213 : _2033;
    bool _2043 = _325 > 0.5;
    float _2045 = _1880 * _325;
    bool _2047 = uint(_2029) >= uint(_1804);
    float _2049 = -_209;
    int _2051 = _2043 ? as_type<int>(_2049) : as_type<int>(_209);
    float _2053 = floor(_2045);
    float _2055 = _2033;
    if (_1808)
    {
        _2055 = 1.0;
    }
    float _2057 = _2055;
    bool _2059 = !_1842;
    float _2061 = _2059 ? _209 : as_type<float>(_2051);
    float _2063 = _2057;
    if (!_1808)
    {
        _2063 = 1.2345600128173828125;
    }
    float _2065 = _2063;
    float _2067 = _2041 + (-0.5);
    bool _2069 = !_2047;
    int _2071 = _2069 ? 0 : (-1);
    float _2073 = _2065 * _1864;
    int _2075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2077 = _2075 != 0;
    float _2079 = -_2067;
    float _2081 = -_821;
    float _2083 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2087 = _2085 != 0;
    int _2089 = _2037 * int(_2003);
    int _2091 = _2089 + _1854;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2095 = _2093 != 0;
    float _2097 = floor(_2073);
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2101 = _2099 != 0;
    float _2103 = _1987 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2107 = _2105 != 0;
    float _2109 = _2061 + 0.5;
    float _2111 = float(uint(_2091));
    float _2113 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2115 = float(_1804);
    float _2117 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[80].x, _815);
    float _2119 = as_type<float>(_1979) * _2111;
    bool _2121 = _1888 >= _2115;
    bool _2123 = isnan(_1888);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(_2115);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    float _2133 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2137 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2143 = _1971 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = -_2053;
    float _2149 = _2045 + _2147;
    float _2151 = _2013 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2153 = _1933 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2155 = trunc(_2131);
    int _2157 = int(_2155);
    float _2159 = _2149 * _2115;
    float _2161 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2165 = ~_2005;
    int _2167 = _2165 + _2071;
    int _2169 = _2167 + 1;
    float _2171 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2173 = -_2097;
    float _2175 = _2073 + _2173;
    bool _2177 = !_2087;
    int _2179 = _2177 ? 0 : 1;
    float _2181 = trunc(_2119);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    bool _2187 = _1804 == 0;
    out.m_62.x = _2133;
    out.m_62.y = _2135;
    out.m_62.z = _2171;
    out.m_62.w = _2139;
    int _2189 = abs(_2179);
    float _2191 = float(_1884);
    out.m_64.x = _2161;
    out.m_64.y = _2145;
    out.m_64.z = _2163;
    out.m_64.w = _2141;
    int _2193 = ~_1884;
    int _2195 = _2193 + 1;
    float _2197 = trunc(_2159);
    int _2199 = int(_2197);
    float _2201 = _2175 * _2191;
    int _2203 = _1804 * _2169;
    int _2205 = _2203 + _1830;
    float _2207 = _2115 * _445;
    int _2209 = ~_2157;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    float _2215 = _2191 * _445;
    float _2217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2219 = !_2187;
    int _2221 = _2219 ? _2205 : (-1);
    int _2223 = int(_2003) + int(_2185);
    int _2225 = _2199 * _2189;
    int _2227 = _2225 + _1830;
    float _2229 = float(_1854);
    int _2231 = _2221 * _2213;
    int _2233 = _1804 + (-1);
    float _2235 = trunc(_2207);
    int _2237 = int(_2235);
    bool _2239 = _2229 >= _2191;
    bool _2241 = isnan(_2229);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(_2191);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    int _2251 = _2195 * _2223;
    int _2253 = _2251 + _1854;
    bool _2255 = !_2107;
    int _2257 = _2255 ? 0 : 1;
    int _2259 = _2157 * _2233;
    int _2261 = _2259 + _2231;
    int _2263 = abs(_443);
    bool _2265 = uint(_2253) >= uint(_1884);
    float _2267 = trunc(_2201);
    int _2269 = int(_2267);
    int _2271 = abs(_539);
    int _2273 = _2261 * _2263;
    int _2275 = abs(_2257);
    bool _2277 = !_2265;
    int _2279 = _2277 ? 0 : (-1);
    int _2281 = abs(_559);
    float _2283 = trunc(_2249);
    int _2285 = int(_2283);
    int _2287 = _2237 * _2271;
    int _2289 = _2287 + _2273;
    int _2291 = ~_2223;
    int _2293 = _2291 + _2279;
    int _2295 = _2293 + 1;
    float _2297 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2299 = float(uint(_2227));
    int _2301 = _2269 * _2275;
    int _2303 = _2301 + _1854;
    bool _2305 = _1884 == 0;
    int _2307 = _1884 * _2295;
    int _2309 = _2307 + _1854;
    float _2311 = _383 + 0.5;
    int _2313 = _2227 * _2281;
    int _2315 = _2313 + _2289;
    bool _2317 = !_1822;
    int _2319 = _2317 ? 0 : 1;
    float _2321 = as_type<float>(_1896) * _2299;
    float _2323 = float(uint(_2303));
    float _2325 = fma(_2297, _2311, _685);
    int _2327 = abs(_2319);
    float _2329 = trunc(_2215);
    int _2331 = int(_2329);
    int _2333 = ~_2285;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    float _2339 = as_type<float>(_1979) * _2323;
    bool _2341 = !_2305;
    int _2343 = _2341 ? _2309 : (-1);
    float _2345 = -_1812;
    float _2347 = fma(_383, _2345, _2325);
    int _2349 = _1884 + (-1);
    float _2351 = trunc(_2321);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = _2343 * _2337;
    int _2359 = _2199 * _2327;
    int _2361 = _2359 + _2315;
    int _2363 = ~_1804;
    int _2365 = _2363 + 1;
    int _2367 = _2285 * _2349;
    int _2369 = _2367 + _2357;
    int _2371 = ~_1884;
    int _2373 = _2371 + 1;
    float _2375 = trunc(_2339);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    float _2381 = float(uint(_2361));
    int _2383 = _2365 * int(_2355);
    int _2385 = _2383 + _2227;
    float _2387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2389 = _2369 * _1890;
    float _2391 = as_type<float>(_1896) * _2381;
    float _2393 = float(uint(_2385));
    int _2395 = _2373 * int(_2379);
    int _2397 = _2395 + _2303;
    int _2399 = abs(_1121);
    int _2401 = _2331 * _1900;
    int _2403 = _2401 + _2389;
    int _2405 = abs(_1207);
    float _2407 = trunc(_2391);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = float(uint(_2397));
    int _2415 = _2303 * _2399;
    int _2417 = _2415 + _2403;
    float _2419 = -_209;
    int _2421 = _1904 ? as_type<int>(_2419) : as_type<int>(_209);
    float _2423 = as_type<float>(_1896) * _2393;
    int _2425 = ~_1804;
    int _2427 = _2425 + 1;
    float _2429 = as_type<float>(_1979) * _2413;
    bool _2431 = !_2077;
    float _2433 = _2431 ? _209 : as_type<float>(_2421);
    int _2435 = _2269 * _2405;
    int _2437 = _2435 + _2417;
    float _2439 = trunc(_2423);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = _1051 + (-0.5);
    float _2447 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2449 = _2433 + 0.5;
    float _2451 = float(uint(_2437));
    float _2453 = -_2445;
    float _2455 = -_731;
    float _2457 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2455);
    float _2459 = -_2447;
    float _2461 = -_835;
    float _2463 = fma(_2459, _1910, _2461);
    float _2465 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[85].x, _833);
    int _2467 = _2427 * int(_2411);
    int _2469 = _2467 + _2361;
    float _2471 = as_type<float>(_1979) * _2451;
    float _2473 = -_819;
    float _2475 = _2473 + 1.0;
    int _2477 = ~_1884;
    int _2479 = _2477 + 1;
    float _2481 = trunc(_2429);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    float _2487 = float(uint(_2469));
    float _2489 = fma(_389, _1818, _2463);
    int _2491 = ~_1804;
    int _2493 = _2491 + 1;
    float _2495 = -_1826;
    float _2497 = fma(_2433, _2495, _2465);
    int _2499 = int(_2355) + int(_2443);
    float _2501 = -_715;
    float _2503 = _2501 + 1.0;
    float _2505 = as_type<float>(_1896) * _2487;
    float _2507 = trunc(_2471);
    float _2509 = precise::max(_2507, 0.0);
    uint _2511 = uint(_2509);
    float _2513 = fma(_1051, _2503, _2457);
    int _2515 = ~_1884;
    int _2517 = _2515 + 1;
    float _2519 = -_823;
    float _2521 = _2519 + 1.0;
    float _2523 = -_2475;
    float _2525 = fma(_2061, _2523, _2117);
    out.m_66.x = _2347;
    out.m_66.y = _2489;
    float _2527 = _1943 * _1779;
    float _2529 = trunc(_2505);
    float _2531 = precise::max(_2529, 0.0);
    uint _2533 = uint(_2531);
    int _2535 = int(_2379) + int(_2485);
    float _2537 = fma(_2041, _2521, _2083);
    float _2539 = _1800 * _2527;
    out.m_68.x = _2525;
    out.m_68.y = _2537;
    out.m_68.z = _2497;
    out.m_68.w = _2513;
    int _2541 = _2479 * int(_2511);
    int _2543 = _2541 + _2437;
    float _2545 = float(uint(_2543));
    int _2547 = _2493 * _2499;
    int _2549 = _2547 + _2227;
    float _2551 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2553 = int(_2411) + int(_2533);
    float _2555 = as_type<float>(_1979) * _2545;
    bool _2557 = uint(_2549) >= uint(_1804);
    int _2559 = _2517 * _2535;
    int _2561 = _2559 + _2303;
    float _2563 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2565 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2567 = !_2557;
    int _2569 = _2567 ? 0 : (-1);
    float _2571 = trunc(_2555);
    float _2573 = precise::max(_2571, 0.0);
    uint _2575 = uint(_2573);
    bool _2577 = uint(_2561) >= uint(_1884);
    float _2579 = -_1055;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2565);
    int _2583 = ~_1804;
    int _2585 = _2583 + 1;
    float _2587 = -_1055;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2563);
    bool _2591 = !_2577;
    int _2593 = _2591 ? 0 : (-1);
    float _2595 = -_1055;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2551);
    int _2599 = ~_2499;
    int _2601 = _2599 + _2569;
    int _2603 = _2601 + 1;
    int _2605 = _2585 * _2553;
    int _2607 = _2605 + _2361;
    int _2609 = ~_2535;
    int _2611 = _2609 + _2593;
    int _2613 = _2611 + 1;
    float _2615 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2617 = ~_1884;
    int _2619 = _2617 + 1;
    float _2621 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2623 = uint(_2607) >= uint(_1804);
    float _2625 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2615);
    float _2627 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2629 = int(_2511) + int(_2575);
    float _2631 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2621);
    bool _2633 = !_2623;
    int _2635 = _2633 ? 0 : (-1);
    float _2637 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2639 = fma(_2627, _2627, 1.0);
    int _2641 = _2619 * _2629;
    int _2643 = _2641 + _2437;
    int _2645 = ~_2553;
    int _2647 = _2645 + _2635;
    int _2649 = _2647 + 1;
    float _2651 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2653 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2637);
    int _2655 = _1804 * _2603;
    int _2657 = _2655 + _2227;
    bool _2659 = uint(_2643) >= uint(_1884);
    int _2661 = _1804 * _2649;
    int _2663 = _2661 + _2361;
    float _2665 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2667 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2669 = !_2659;
    int _2671 = _2669 ? 0 : (-1);
    float _2673 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2651);
    bool _2675 = !_2187;
    int _2677 = _2675 ? _2663 : (-1);
    float _2679 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2665);
    int _2681 = ~_2629;
    int _2683 = _2681 + _2671;
    int _2685 = _2683 + 1;
    float _2687 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2667);
    int _2689 = _2677 >> 31;
    float _2691 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2693 = _2677 & 3;
    bool _2695 = _2693 != 0;
    int _2697 = _1884 * _2685;
    int _2699 = _2697 + _2437;
    int _2701 = _2689 & 3;
    float _2703 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2679);
    float _2705 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2653);
    float _2707 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    bool _2709 = !_2305;
    int _2711 = _2709 ? _2699 : (-1);
    float _2713 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2673);
    int _2715 = _2677 + _2701;
    float _2717 = rsqrt(_2639);
    int _2719 = _2711 >> 31;
    float _2721 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2631);
    int _2723 = _2677 & 3;
    bool _2725 = _2723 != 0;
    float _2727 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2625);
    int _2729 = _2719 & 3;
    float _2731 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2597);
    bool _2733 = uint(_2723) >= 2u;
    float _2735 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2589);
    int _2737 = _2711 + _2729;
    float _2739 = _2627 * _2731;
    int _2741 = _2715 >> 2;
    float _2743 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2687);
    int _2745 = _2733 ? 0 : 1;
    float _2747 = _2627 * _2735;
    bool _2749 = _2723 != 3;
    float _2751 = fma(_2691, _2727, _2739);
    int _2753 = _2737 >> 2;
    float _2755 = _2627 * _2717;
    int _2757 = _2741 << 4;
    int _2759 = _2757 + 368;
    float _2761 = _2627 * _2707;
    int _2763 = _2753 << 4;
    int _2765 = _2763 + 512;
    float _2767 = fma(_2691, _2721, _2747);
    uint _2769 = uint(int(uint(_2759) >> uint(2)));
    uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
    int _2773 = int(_2769) & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    int _2777 = int(_2769) + 1;
    uint _2779 = uint(int(uint(_2777) >> uint(2)));
    int _2781 = _2777 & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = ~_2745;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = fma(_2691, _2705, _2761);
    int _2793 = _2695 ? 0 : 1;
    float _2795 = -_2713;
    float _2797 = _2755 * _2795;
    int _2799 = _2789;
    if (_2749)
    {
        int _2801 = ~_2745;
        int _2803 = _2801 + 1;
        _2799 = _2803;
    }
    int _2805 = _2799;
    int _2807 = _1884 * _2613;
    int _2809 = _2807 + _2303;
    bool _2811 = uint(_2723) > 1u;
    uint _2813 = uint(int(uint(_2765) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    float _2829 = fma(_2717, _2735, _2797);
    float _2831 = _2713 + _2767;
    bool _2833 = !_2725;
    int _2835 = _2833 ? 0 : 1;
    float _2837 = -_2703;
    float _2839 = _2755 * _2837;
    int _2841 = _2711 & 3;
    bool _2843 = _2841 != 0;
    float _2845 = _2703 + _2751;
    int _2847 = ~_2793;
    int _2849 = _2847 + 1;
    int _2851 = _2849 + 1;
    int _2853 = _2759 + 8;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    uint _2857 = uint(int(uint(int(_2855)) >> uint(2)));
    int _2859 = int(_2855) & 3;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[int(_2857)][_2859];
    int _2863 = int(_2855) + 1;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    int _2867 = _2863 & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    bool _2871 = uint(_2841) > 1u;
    float _2873 = fma(_2717, _2731, _2839);
    out.m_70.x = _2721;
    out.m_70.y = _2727;
    out.m_70.z = _2705;
    int _2875 = _2851;
    if (!_2811)
    {
        int _2877 = ~_2793;
        int _2879 = _2877 + 1;
        _2875 = _2879;
    }
    int _2881 = _2875;
    int _2883 = _2711 & 3;
    bool _2885 = _2883 != 0;
    float _2887 = -_2743;
    float _2889 = _2755 * _2887;
    int _2891 = _2765 + 8;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    uint _2895 = uint(int(uint(int(_2893)) >> uint(2)));
    int _2897 = int(_2893) & 3;
    float _2899 = (*spvDescriptorSet0.vp_c9)._m0[int(_2895)][_2897];
    int _2901 = int(_2893) + 1;
    uint _2903 = uint(int(uint(_2901) >> uint(2)));
    int _2905 = _2901 & 3;
    float _2907 = (*spvDescriptorSet0.vp_c9)._m0[int(_2903)][_2905];
    bool _2909 = !_2187;
    int _2911 = _2909 ? _2657 : (-1);
    float _2913 = _2743 + _2791;
    float _2915 = fma(_2717, _2707, _2889);
    int _2917 = _2885 ? 0 : 1;
    bool _2919 = !_2843;
    int _2921 = _2919 ? 0 : 1;
    out.m_72.x = _2831;
    out.m_72.y = _2845;
    out.m_72.z = _2913;
    bool _2923 = _2723 != 3;
    float _2925 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2927 = ~_2917;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    out.m_74.x = _2829;
    out.m_74.y = _2873;
    out.m_74.z = _2915;
    int _2933 = _2931;
    if (!_2871)
    {
        int _2935 = ~_2917;
        int _2937 = _2935 + 1;
        _2933 = _2937;
    }
    int _2939 = _2933;
    float _2941 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2925);
    int _2943 = abs(_2881);
    bool _2945 = _2841 != 3;
    float _2947 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2941);
    int _2949 = abs(_2939);
    int _2951 = abs(_2835);
    float _2953 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2947);
    int _2955 = ~_2943;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    bool _2961 = uint(_2841) >= 2u;
    int _2963 = abs(_2805);
    int _2965 = _2959 * as_type<int>(_2783);
    int _2967 = ~_2949;
    int _2969 = _2967 + 1;
    int _2971 = _2969 + 1;
    out.gl_Position.x = _1745;
    out.gl_Position.y = _1747;
    out.gl_Position.z = _2953;
    out.gl_Position.w = _1721;
    int _2973 = ~_2951;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    int _2979 = _2961 ? 0 : 1;
    int _2981 = _2971 * as_type<int>(_2827);
    int _2983 = ~_2963;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    int _2989 = _2977 * as_type<int>(_2775);
    int _2991 = _2989 + _2965;
    bool _2993 = _2841 != 3;
    int _2995 = ~_2979;
    int _2997 = _2995 + 1;
    int _2999 = _2997 + 1;
    int _3001 = _2999;
    if (_2945)
    {
        int _3003 = ~_2979;
        int _3005 = _3003 + 1;
        _3001 = _3005;
    }
    int _3007 = _3001;
    int _3009 = _2987 * as_type<int>(_2861);
    int _3011 = _3009 + _2991;
    int _3013 = abs(_2921);
    float _3015 = fma(_1790, _2539, _1788);
    bool _3017 = !_2993;
    int _3019 = _3017 ? 0 : (-1);
    bool _3021 = !_2095;
    int _3023 = _3021 ? 0 : 1;
    bool _3025 = !_2923;
    int _3027 = _3025 ? 0 : (-1);
    int _3029 = abs(_3007);
    int _3031 = ~_3013;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    bool _3037 = !_2101;
    int _3039 = _3037 ? 0 : 1;
    int _3041 = abs(_3019);
    int _3043 = _3035 * as_type<int>(_2819);
    int _3045 = _3043 + _2981;
    int _3047 = abs(_3027);
    int _3049 = abs(_3023);
    int _3051 = ~_3029;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    int _3057 = abs(_3039);
    int _3059 = _3055 * as_type<int>(_2899);
    int _3061 = _3059 + _3045;
    int _3063 = ~_3047;
    int _3065 = _3063 + 1;
    int _3067 = _3065 + 1;
    int _3069 = ~_3049;
    int _3071 = _3069 + 1;
    int _3073 = _3071 + 1;
    int _3075 = ~_3041;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    int _3081 = _3067 * as_type<int>(_2869);
    int _3083 = _3081 + _3011;
    int _3085 = ~_3057;
    int _3087 = _3085 + 1;
    int _3089 = _3087 + 1;
    bool _3091 = !_2305;
    int _3093 = _3091 ? _2809 : (-1);
    int _3095 = _3083 * _3073;
    bool _3097 = _1461 > 0.0;
    bool _3099 = isnan(_1461);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    int _3107 = _3079 * as_type<int>(_2907);
    int _3109 = _3107 + _3061;
    float _3111 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3113 = _2911 * _3049;
    int _3115 = _3113 + _3095;
    float _3117 = _1721 * 0.5;
    int _3119 = _3109 * _3089;
    float _3121 = _1745 + _1721;
    float _3123 = fma(_1747, -0.5, _3117);
    int _3125 = _3093 * _3057;
    int _3127 = _3125 + _3119;
    float _3129 = _2953 + _1721;
    float _3131 = _1790 * _2527;
    float _3133 = _3121 * 0.5;
    float _3135 = _3129 * 0.5;
    float _3137 = float(_3115);
    float _3139 = _3111 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3141 = float(_3127);
    float _3143 = fma(_1796, _3131, _1784);
    float _3145 = fma(_1798, _3131, _1786);
    float _3147 = _1790 * _1953;
    out.m_76.x = _3133;
    out.m_76.y = _3123;
    out.m_76.z = _3135;
    out.m_76.w = _1721;
    out.m_78.x = _3137;
    out.m_78.y = _3141;
    out.m_45.x = _3139;
    out.m_80.x = _3143;
    out.m_80.y = _3145;
    out.m_80.z = _3015;
    out.m_80.w = _3147;
    if (_3105)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3149;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _315 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_42.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_45.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3206 = as_type<float>(_115);
        out.gl_Position.z = _3206;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_47.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3276 = as_type<float>(_153);
        out.gl_Position.z = _3276;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_52.w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = in.m_42.x;
    float _179 = in.m_42.y;
    float _181 = in.m_42.z;
    float _183 = 0.0;
    float _185 = _157;
    if (!_169)
    {
        float _187 = _157 * _157;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_169)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_169;
    float _217 = _197;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_169;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _185 = _271;
    }
    float _273 = _185;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _173, _277);
    float _285 = fma(_273, _171, _279);
    float _287 = fma(_273, _175, _281);
    float _289 = fma(_283, _159, _179);
    float _291 = fma(_285, _159, _177);
    float _293 = fma(_287, _159, _181);
    bool _295 = !_275;
    float _313;
    if (!_295)
    {
        float _297 = in.m_54.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        float _317 = float(_99);
        float _319 = 1.0 / _317;
        float _321 = _133 * _319;
        _313 = _321;
    }
    _315 = false;
    float _323 = _313;
    float _325 = in.m_54.x;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    float _331 = in.m_54.y;
    float _333 = in.m_54.z;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _337 = int(_335);
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _343 = float(_99);
    float _345 = _325 * 2.0;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _349 = 1.0 / _343;
    bool _351 = _331 > 0.5;
    float _353 = _331 * 2.0;
    float _355 = float(_329);
    bool _357 = _333 > 0.5;
    float _359 = -_209;
    int _361 = _351 ? as_type<int>(_359) : as_type<int>(_209);
    float _363 = floor(_345);
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _371 = _369 != 0;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _375 = _373 != 0;
    float _377 = -_213;
    int _379 = _357 ? as_type<int>(_377) : as_type<int>(_213);
    bool _381 = !_371;
    float _383 = _381 ? _209 : as_type<float>(_361);
    float _385 = floor(_353);
    bool _387 = !_375;
    float _389 = _387 ? _213 : as_type<float>(_379);
    float _391 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _407 = _405 != 0;
    float _409 = -_339;
    float _411 = fma(_391, 2.0, _409);
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _415 = _413 != 0;
    float _417 = 1.0 / _395;
    bool _419 = _363 > 0.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _421;
    bool _425 = _363 >= 0.0;
    bool _427 = isnan(_363);
    bool _429 = _425 || _427;
    bool _431 = isnan(0.0);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _439 = _331 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _441 = !_403;
    int _443 = _441 ? 0 : 1;
    float _445 = _349 * _133;
    int _447 = _433 ? 0 : 1;
    float _449 = 1.0 / _437;
    float _451 = fma(_439, -2.0, _341);
    int _453 = ~_447;
    int _455 = _453 + 1;
    int _457 = _455 + 1;
    int _459 = _457;
    int _461 = as_type<int>(_391);
    if (!_419)
    {
        int _463 = ~_447;
        int _465 = _463 + 1;
        _459 = _465;
    }
    int _467 = _459;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _323 + _469;
    bool _473 = _385 > 0.0;
    float _475 = 1.0 / _423;
    float _477 = _385;
    if (_415)
    {
        _461 = 0;
    }
    int _479 = _461;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = _323 + _481;
    bool _485 = _385 >= 0.0;
    bool _487 = isnan(_385);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _471 * _417;
    int _497 = _479;
    if (!_415)
    {
        _497 = 1;
    }
    int _499 = _497;
    float _501 = _325 + _331;
    int _503 = _493 ? 0 : 1;
    float _505 = 1.0 / _355;
    bool _507 = _499 != 1;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _511 = _323 + _509;
    int _513 = ~_503;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _501 + (-1.0);
    int _521 = _517;
    float _523 = _519;
    if (!_473)
    {
        int _525 = ~_503;
        int _527 = _525 + 1;
        _521 = _527;
    }
    int _529 = _521;
    float _531 = _511 * _449;
    float _533 = _325 + _333;
    float _535 = _333 * 2.0;
    bool _537 = !_399;
    int _539 = _537 ? 0 : 1;
    float _541 = _483 * _475;
    float _543 = _533 + (-1.0);
    int _545 = as_type<int>(_533);
    if (_415)
    {
        _545 = 0;
    }
    int _547 = _545;
    float _549 = _333 + _331;
    int _551 = _547;
    if (!_415)
    {
        _551 = 2;
    }
    int _553 = _551;
    float _555 = floor(_535);
    bool _557 = !_407;
    int _559 = _557 ? 0 : 1;
    float _561 = _549 + (-1.0);
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _573 = _571 != 0;
    float _575 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _577 = _553 != 2;
    float _579 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _581 = as_type<float>(_553);
    if (!_507)
    {
        _477 = _331;
    }
    float _583 = _477;
    float _585 = _505 * _133;
    float _587 = 0.0;
    float _589 = _583;
    if (!_507)
    {
        _587 = _583;
    }
    float _591 = _587;
    float _593 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _595 = 0.0;
    float _597 = _591;
    if (!_507)
    {
        _595 = _333;
    }
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _601;
    float _605 = _599;
    if (!_507)
    {
        _523 = _333;
    }
    float _607 = _523;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _609;
    float _613 = _607;
    if (_507)
    {
        _597 = _325;
    }
    float _615 = _597;
    float _617 = fma(_603, _495, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    if (_507)
    {
        _589 = _325;
    }
    float _619 = _589;
    float _621 = fma(_611, _495, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_507)
    {
        _605 = _331;
    }
    float _623 = _605;
    float _625 = _615 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_507)
    {
        _613 = _331;
    }
    float _627 = _613;
    if (_577)
    {
        _581 = _325;
    }
    float _629 = _581;
    bool _631 = _555 >= 0.0;
    bool _633 = isnan(_555);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = _629;
    if (!_577)
    {
        _641 = _333;
    }
    float _643 = _641;
    int _645 = _639 ? 0 : 1;
    bool _647 = _555 > 0.0;
    float _649 = _643 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _659 = -_347;
    float _661 = fma(_649, 2.0, _659);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _665 = !_565;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_653, _531, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _671 = fma(_657, _531, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _673 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[83].z, _663);
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _681 = abs(_667);
    float _683 = -_133;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[86].x, _661);
    int _687 = ~_645;
    int _689 = _687 + 1;
    int _691 = _689 + 1;
    int _693 = _691;
    float _695 = _679;
    if (!_647)
    {
        int _697 = ~_645;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    float _703 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].w, _679);
    float _705 = float(_467);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _711 = _623 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _713 = float(_701);
    float _715 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _703);
    float _717 = float(_681);
    float _719 = fma(_711, -2.0, _707);
    if (_577)
    {
        _695 = _331;
    }
    float _721 = _695;
    float _723 = _677 * _133;
    float _725 = _721;
    if (!_577)
    {
        _725 = _325;
    }
    float _727 = _725;
    float _729 = _717 * _713;
    float _731 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _719);
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _735 = !_569;
    int _737 = _735 ? 0 : 1;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _741 = float(_337);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _745 = fma(_733, -2.0, _709);
    float _747 = exp2(_723);
    float _749 = -_739;
    float _751 = fma(_625, 2.0, _749);
    float _753 = in.m_56.x;
    float _755 = in.m_56.y;
    float _757 = in.m_56.z;
    int _759 = abs(_737);
    float _761 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _743);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _765 = 1.0 + _763;
    float _767 = float(_759);
    float _769 = 1.0 / _741;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _775 = isnan(1.0);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _781 = _777 || _779;
    float _783 = _767 * _705;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _787 = -_747;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _765;
    bool _793 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _801 = _797 || _799;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _805 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    float _807 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[88].w, _785);
    float _809 = _801 ? _789 : 0.0;
    float _811 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[88].z, _803);
    float _813 = -_133;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[76].x, _411);
    float _817 = _769 * _133;
    float _819 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _761);
    float _821 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _823 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _825 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _811);
    float _827 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _807);
    float _829 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _673);
    float _831 = -_133;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[81].x, _751);
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _745);
    float _837 = _729 * (-2.0);
    if (_781)
    {
        float _839 = _809 * _791;
        _135 = _839;
    }
    float _841 = _135;
    bool _843 = !_573;
    int _845 = _843 ? 0 : 1;
    bool _847 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _849 = isnan(_323);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_575, _837, _575);
    float _861 = fma(_837, _753, _753);
    int _863 = abs(_845);
    float _865 = _325 + (-0.5);
    bool _867 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _869 = isnan(_323);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -_857;
    float _881 = _879 + 1.0;
    float _883 = float(_529);
    float _885 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[196].x, _861);
    bool _887 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_323);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _877 * _881;
    float _901 = float(_863);
    float _903 = -_877;
    float _905 = _903 + 1.0;
    float _907 = _783 * (-2.0);
    float _909 = fma(_859, _841, _885);
    bool _911 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _913 = isnan(_323);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _919 = _915 || _917;
    float _921 = float(_919);
    float _923 = _897 * _905;
    float _925 = _331 + (-0.5);
    float _927 = fma(_907, _755, _755);
    float _929 = _901 * _883;
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = _909 * 0.15915493667125701904296875;
    float _937 = fma(_579, _907, _579);
    float _939 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[196].y, _927);
    float _941 = _921 * _933;
    float _943 = _929 * (-2.0);
    float _945 = fma(_937, _841, _939);
    float _947 = _621 * _941;
    float _949 = _617 * _941;
    float _951 = fma(_593, _943, _593);
    float _953 = fma(_943, _757, _757);
    float _955 = in.m_52.x;
    float _957 = in.m_52.y;
    float _959 = _333 + (-0.5);
    float _961 = -_921;
    float _963 = _961 + 1.0;
    float _965 = _945 * 0.15915493667125701904296875;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _967;
    float _971 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].z, _953);
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[143].x, _949);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _975;
    float _979 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[143].y, _947);
    float _981 = fma(_969, _541, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _983 = fma(_951, _841, _971);
    float _985 = fma(_977, _541, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _987 = fma(_671, _923, _979);
    float _989 = fma(_669, _923, _973);
    float _991 = _983 * 0.15915493667125701904296875;
    float _993 = _935 * 6.283185482025146484375;
    float _995 = sin(_993);
    float _997 = fma(_985, _899, _987);
    float _999 = fma(_981, _899, _989);
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1003 = in.m_54.w;
    float _1005 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[146].y, _997);
    float _1007 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[146].x, _999);
    float _1009 = _935 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = _1005 * _957;
    float _1015 = _1007 * _955;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1019 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1021 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1023 = _965 * 6.283185482025146484375;
    float _1025 = sin(_1023);
    float _1027 = _1019 * _1001;
    float _1029 = _1021 * _1017;
    float _1031 = _965 * 6.283185482025146484375;
    float _1033 = cos(_1031);
    bool _1035 = _1003 > 0.5;
    float _1037 = _991 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1011 * _1025;
    float _1043 = _995 * _1025;
    float _1045 = -_213;
    int _1047 = _1035 ? as_type<int>(_1045) : as_type<int>(_213);
    bool _1049 = !_367;
    float _1051 = _1049 ? _213 : as_type<float>(_1047);
    float _1053 = _991 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _995 * _1033;
    float _1059 = _1011 * _1033;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1075 = _1073 != 0;
    float _1077 = _1011 * _1039;
    float _1079 = _995 * _1039;
    float _1081 = _1033 * _1039;
    float _1083 = _1025 * _1039;
    bool _1085 = !_1067;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1063;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = -_1041;
    float _1095 = fma(_1055, _1057, _1093);
    float _1097 = -_1057;
    float _1099 = fma(_1055, _1041, _1097);
    float _1101 = fma(_1055, _1059, _1043);
    float _1103 = _1077 * _1027;
    float _1105 = fma(_1055, _1043, _1059);
    float _1107 = -_1027;
    float _1109 = _1055 * _1107;
    float _1111 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = fma(_1101, _1029, _1103);
    float _1115 = _1079 * _1027;
    float _1117 = fma(_1081, _1029, _1109);
    bool _1119 = !_1071;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = fma(_1099, _1111, _1113);
    float _1125 = fma(_1095, _1029, _1115);
    float _1127 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1129 = fma(_1083, _1111, _1117);
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1133 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1135 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1137 = fma(_1105, _1111, _1125);
    float _1139 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1141 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1131);
    float _1143 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1133);
    float _1145 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1135);
    float _1147 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1139);
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1151 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1147);
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1159 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1161 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1165 = _1153 + _1157;
    float _1167 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1159);
    bool _1169 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1171 = isnan(0.5);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1177 = _1173 || _1175;
    float _1179 = _1161 + _1163;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1165 + _1181;
    float _1185 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1167);
    bool _1187 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1189 = isnan(0.5);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1195 = _1191 || _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1199 = _1179 + _1197;
    float _1201 = _1183 * _1183;
    float _1203 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1205 = !_1075;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = fma(_1199, _1199, _1201);
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1213 = sqrt(_1209);
    float _1215 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1211);
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1219 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1215);
    float _1221 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1217);
    float _1223 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1225 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1221);
    float _1229 = 1.0 / _1223;
    float _1231 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1233 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1235 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1231);
    float _1239 = _1233 + _1223;
    float _1241 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1243 = _1203 + _1241;
    float _1245 = _1239 * _1229;
    float _1247 = _1245 * 0.5;
    float _1249 = _1223;
    float _1251 = _1229;
    float _1253 = _1239;
    float _1255 = _1213;
    float _1257 = _1129;
    float _1259 = _857;
    float _1261 = _1209;
    if (!_1235)
    {
        _1249 = _1179;
    }
    float _1263 = _1249;
    float _1265 = _1263;
    if (!_1235)
    {
        _1251 = _1165;
    }
    float _1267 = _1251;
    float _1269 = _1267;
    if (!_1235)
    {
        _1253 = _1243;
    }
    float _1271 = _1253;
    bool _1273 = !_1235;
    float _1275 = _1271;
    if (!_1273)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1281 = _1213 + _1279;
        float _1283 = rsqrt(_1209);
        float _1285 = _1281 * _1277;
        float _1287 = _1243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = _1285 * 0.15915493667125701904296875;
        float _1291 = _1289 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = _1293 + (-1.0);
        float _1301 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = fma(_1297, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1305 = fma(_1243, _1293, _1301);
        float _1307 = _1283 * _1303;
        float _1309 = fma(_1199, _1307, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1311 = fma(_1183, _1307, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1265 = _1309;
        _1275 = _1305;
        _1269 = _1311;
        _1255 = _1307;
        _1257 = _1283;
    }
    float _1313 = _1265;
    float _1315 = _1275;
    float _1317 = _1269;
    float _1319 = _1255;
    float _1321 = _1257;
    float _1323 = _1319;
    float _1325 = _1315;
    float _1327 = _1313;
    float _1329 = _1317;
    float _1331 = _1321;
    if (_1195)
    {
        _1259 = 1.0;
    }
    float _1333 = _1259;
    float _1335 = _1333;
    if (!_1177)
    {
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1339 = _1203 + _1337;
        float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1343 = _1161 + _1341;
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1347 = -_1161;
        float _1349 = _1347 + _1313;
        float _1351 = _1339 * _1339;
        float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1355 = _1153 + _1353;
        float _1357 = -_1203;
        float _1359 = _1357 + _1315;
        float _1361 = fma(_1343, _1343, _1351);
        float _1363 = fma(_1355, _1355, _1361);
        float _1365 = sqrt(_1363);
        float _1367 = precise::min(_1365, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1369 = _1367 * _1345;
        float _1371 = -_1153;
        float _1373 = _1371 + _1317;
        float _1375 = fma(_1349, _1369, _1161);
        float _1377 = fma(_1359, _1369, _1203);
        float _1379 = fma(_1373, _1369, _1153);
        _1323 = _1365;
        _1325 = _1377;
        _1327 = _1375;
        _1329 = _1379;
        _1331 = _1369;
    }
    float _1381 = _1323;
    float _1383 = _1325;
    float _1385 = _1327;
    float _1387 = _1329;
    float _1389 = _1331;
    float _1391 = _1389;
    float _1393 = _1381;
    if (!_1195)
    {
        float _1395 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1403 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
        float _1405 = _1397 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        float _1409 = _1399 * 0.15915493667125701904296875;
        float _1411 = _1397 * 6.283185482025146484375;
        float _1413 = sin(_1411);
        float _1415 = 1.0 / _1407;
        float _1417 = _1409 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = _1413 * _1415;
        float _1423 = _1409 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = 1.0 / _1403;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1433 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1431;
        float _1435 = 1.0 / _1427;
        float _1437 = 1.0 / _1433;
        float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1441 = _1429 * _1439;
        float _1443 = _1425 * _1435;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = fma(_1443, _1441, _1445);
        float _1449 = _1447 * _1437;
        float _1451 = precise::clamp(_1449, 0.0, 1.0);
        float _1453 = -_1451;
        float _1455 = _1453 + 1.0;
        _1391 = _1409;
        _1393 = _1441;
        _1335 = _1455;
    }
    float _1457 = _1391;
    float _1459 = _1393;
    float _1461 = _1335;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1465 = _1383 + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1469 = _1385 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1473 = _1387 + _1471;
    float _1475 = _1465 * _1465;
    float _1477 = fma(_1469, _1469, _1475);
    float _1479 = fma(_1473, _1473, _1477);
    float _1481 = rsqrt(_1479);
    float _1483 = sqrt(_1479);
    float _1485 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1487 = _1469 * _1485;
    float _1489 = _1473 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 * _1489;
    float _1495 = _1491 + _1493;
    float _1497 = sqrt(_1495);
    bool _1499 = _1497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1497 + _1501;
    float _1505 = _1481;
    float _1507 = _1503;
    float _1509 = _1457;
    float _1511 = _1465;
    if (_1499)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1505 = _1513;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (_1499)
    {
        float _1519 = _1503 * _1515;
        _1507 = _1519;
    }
    float _1521 = _1507;
    if (_1499)
    {
        float _1523 = rsqrt(_1495);
        _1517 = _1523;
    }
    float _1525 = _1517;
    float _1527 = _1525;
    if (_1499)
    {
        float _1529 = _1521 * 0.15915493667125701904296875;
        _1509 = _1529;
    }
    float _1531 = _1509;
    float _1533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1535 = _1473;
    float _1537 = _1531;
    if (_1499)
    {
        float _1539 = _1531 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = precise::max(0.0, _1533);
    float _1547 = _1459;
    float _1549 = _1545;
    if (_1499)
    {
        float _1551 = _1531 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        _1547 = _1553;
    }
    float _1555 = _1547;
    float _1557 = -_1485;
    float _1559 = -_1545;
    float _1561 = fma(_1465, _1557, _1559);
    if (_1499)
    {
        float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1563;
    }
    float _1565 = _1511;
    float _1567 = _1543;
    float _1569 = _1565;
    if (_1499)
    {
        float _1571 = fma(_1543, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1567 = _1571;
    }
    float _1573 = _1567;
    float _1575 = _1573;
    if (!_1499)
    {
        _1569 = _1561;
    }
    float _1577 = _1569;
    float _1579 = _1577;
    if (_1499)
    {
        float _1581 = _1525 * _1573;
        _1261 = _1581;
    }
    float _1583 = _1261;
    if (!_1499)
    {
        _1527 = _1487;
    }
    float _1585 = _1527;
    float _1587 = _1585;
    float _1589 = _1555;
    if (_1499)
    {
        float _1591 = _1555 + (-1.0);
        _1549 = _1591;
    }
    float _1593 = _1549;
    float _1595 = _1593;
    if (_1499)
    {
        float _1597 = _1487 * _1583;
        _1587 = _1597;
    }
    float _1599 = _1587;
    if (!_1499)
    {
        _1575 = _1491;
    }
    float _1601 = _1575;
    float _1603 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1601;
    if (_1499)
    {
        float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1537 = _1607;
    }
    float _1609 = _1537;
    if (!_1499)
    {
        _1595 = _1489;
    }
    float _1611 = _1595;
    float _1613 = _1611;
    if (_1499)
    {
        float _1615 = _1489 * _1583;
        _1613 = _1615;
    }
    float _1617 = _1613;
    if (_1499)
    {
        float _1619 = _1599 * _1599;
        _1605 = _1619;
    }
    float _1621 = _1605;
    if (_1499)
    {
        float _1623 = fma(_1561, _1555, _1609);
        _1579 = _1623;
    }
    float _1625 = _1579;
    if (!_1499)
    {
        _1589 = _1493;
    }
    float _1627 = _1589;
    float _1629 = _1627;
    if (_1499)
    {
        float _1631 = _1617 * _1617;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = fma(_1625, _1625, _1621);
    float _1637 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1639 = _1635 + _1633;
    float _1641 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1643 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1647 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1645);
    float _1649 = precise::clamp(_1647, 0.0, 1.0);
    float _1651 = rsqrt(_1639);
    float _1653 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1655 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1657 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1659 = -_1649;
    float _1661 = _1659 + 1.0;
    float _1663 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1665 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1655);
    float _1667 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1657);
    float _1669 = abs(_1661);
    float _1671 = log2(_1669);
    float _1673 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1665);
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1681 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1683 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1687 = _1651 * _1599;
    float _1689 = _1651 * _1625;
    float _1691 = _1651 * _1617;
    float _1693 = -_1679;
    float _1695 = fma(_1693, _1637, 1.0);
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1699 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1681);
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1685);
    float _1703 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1705 = -_1697;
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1705);
    float _1709 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1711 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1701);
    float _1713 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1715 = -_1691;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1707);
    float _1719 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1721 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1711);
    float _1723 = log2(_1695);
    float _1725 = fma(_1717, -0.5, 0.5);
    float _1727 = fma(_1717, 0.5, 0.5);
    float _1729 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1719);
    float _1731 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1703);
    float _1733 = _1689 + 1.0;
    float _1735 = fma(_1727, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1737 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1729);
    float _1739 = exp2(_1713);
    float _1741 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1731);
    float _1743 = fma(_1727, _1735, -0.212114393711090087890625);
    float _1745 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1737);
    float _1747 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1741);
    float _1749 = fma(_1727, _1743, 1.570728778839111328125);
    float _1751 = 1.0 / _1721;
    float _1753 = _1723 * 0.693147182464599609375;
    float _1755 = sqrt(_1725);
    float _1757 = -_1689;
    float _1759 = fma(_1739, _1733, _1757);
    float _1761 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1763 = fma(_1759, 0.5, 0.5);
    float _1765 = _1745 * _1751;
    float _1767 = _1747 * _1751;
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = fma(_1767, -0.5, 0.5);
    float _1773 = _1755 * 0.636619746685028076171875;
    float _1775 = -_1749;
    float _1777 = fma(_1773, _1775, 1.0);
    float3 _5817 = float3(_1769, _1771, _1761);
    float _1779 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5817, float3(0.0), isnan(_5817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5817, float3(0.0), isnan(_5817)), level(0.0)).x;
    float3 _5828 = float3(_1769, _1771, _1761);
    float4 _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5828, float3(0.0), isnan(_5828)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5828, float3(0.0), isnan(_5828)), level(0.0)).xyzw;
    float _1784 = _1782.x;
    float _1786 = _1782.y;
    float _1788 = _1782.z;
    float _1790 = _1782.w;
    float2 _5845 = float2(_1777, _1763);
    float3 _1794 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5845, float2(0.0), isnan(_5845)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5845, float2(0.0), isnan(_5845)), level(0.0)).xyz;
    float _1796 = _1794.x;
    float _1798 = _1794.y;
    float _1800 = _1794.z;
    float _1802 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1804 = int(_1802);
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1808 = _1806 != 0;
    float _1810 = -_825;
    float _1812 = _1810 + 1.0;
    bool _1814 = _331 > 0.5;
    float _1816 = -_827;
    float _1818 = _1816 + 1.0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1822 = _1820 != 0;
    float _1824 = -_829;
    float _1826 = _1824 + 1.0;
    float _1828 = trunc(_585);
    int _1830 = int(_1828);
    float _1832 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1834 = -_213;
    float _1836 = _1834 + 0.5;
    float _1838 = _209 + 0.5;
    int _1840 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1842 = _1840 != 0;
    float _1844 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1846 = _1832 * _325;
    float _1848 = 0.0;
    if (_1808)
    {
        _1848 = _325;
    }
    float _1850 = _1848;
    float _1852 = trunc(_817);
    int _1854 = int(_1852);
    float _1856 = float(uint(_1804));
    out.m_58.x = _1838;
    out.m_58.y = _1836;
    int _1858 = ~_1804;
    int _1860 = _1858 + 1;
    float _1862 = _1850;
    if (!_1808)
    {
        _1862 = _331;
    }
    float _1864 = _1862;
    out.m_60.x = _1385;
    out.m_60.y = _1383;
    out.m_60.z = _1387;
    float _1866 = 1.0 / _1856;
    float _1868 = float(uint(_1830));
    int _1870 = ~_1804;
    int _1872 = _1870 + 1;
    float _1874 = 0.0;
    if (_1808)
    {
        _1874 = 1.0;
    }
    float _1876 = _1874;
    float _1878 = _1876;
    if (!_1808)
    {
        _1878 = 7.345489978790283203125;
    }
    float _1880 = _1878;
    float _1882 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1884 = int(_1882);
    float _1886 = float(uint(_1854));
    float _1888 = float(_1830);
    int _1890 = abs(_1087);
    float _1892 = trunc(_1846);
    int _1894 = int(_1892);
    int _1896 = as_type<int>(_1866) + (-2);
    float _1898 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1900 = abs(_1091);
    float _1902 = as_type<float>(_1896) * _1868;
    bool _1904 = _333 > 0.5;
    float _1906 = _1898 * _325;
    float _1908 = float(uint(_1884));
    float _1910 = _389 + (-0.5);
    float _1912 = exp2(_1844);
    int _1914 = _1894 << 4;
    int _1916 = _1914 + 1712;
    float _1918 = trunc(_1902);
    float _1920 = precise::max(_1918, 0.0);
    uint _1923 = uint(_1920);
    int _1925 = _1916 + 8;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    uint _1929 = uint(int(uint(int(_1927)) >> uint(2)));
    int _1931 = int(_1927) & 3;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[int(_1929)][_1931];
    float _1935 = trunc(_1906);
    int _1937 = int(_1935);
    float _1939 = -_1912;
    float _1941 = _1939 + 1.0;
    float _1943 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1945 = _1860 * int(_1923);
    int _1947 = _1945 + _1830;
    float _1949 = 1.0 / _1908;
    float _1951 = -_1943;
    float _1953 = _1951 + 1.0;
    float _1955 = float(uint(_1947));
    int _1957 = _1937 << 4;
    int _1959 = _1957 + 1968;
    float _1961 = as_type<float>(_1896) * _1955;
    int _1963 = _1959 + 8;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    uint _1967 = uint(int(uint(int(_1965)) >> uint(2)));
    int _1969 = int(_1965) & 3;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[int(_1967)][_1969];
    float _1973 = trunc(_1961);
    float _1975 = precise::max(_1973, 0.0);
    uint _1977 = uint(_1975);
    int _1979 = as_type<int>(_1949) + (-2);
    uint _1981 = uint(int(uint(_1916) >> uint(2)));
    uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
    int _1985 = int(_1981) & 3;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[int(_1983)][_1985];
    int _1989 = int(_1981) + 1;
    uint _1991 = uint(int(uint(_1989) >> uint(2)));
    int _1993 = _1989 & 3;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[int(_1991)][_1993];
    float _1997 = as_type<float>(_1979) * _1886;
    float _1999 = trunc(_1997);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    int _2005 = int(_1923) + int(_1977);
    uint _2007 = uint(int(uint(_1959) >> uint(2)));
    uint _2009 = uint(int(uint(int(_2007)) >> uint(2)));
    int _2011 = int(_2007) & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    int _2015 = int(_2007) + 1;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    int _2019 = _2015 & 3;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[int(_2017)][_2019];
    int _2023 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2025 = _2023 != 0;
    int _2027 = _1872 * _2005;
    int _2029 = _2027 + _1830;
    float _2031 = -_213;
    float _2033 = _1814 ? _2031 : _213;
    int _2035 = ~_1884;
    int _2037 = _2035 + 1;
    bool _2039 = !_2025;
    float _2041 = _2039 ? _213 : _2033;
    bool _2043 = _325 > 0.5;
    float _2045 = _1880 * _325;
    bool _2047 = uint(_2029) >= uint(_1804);
    float _2049 = -_209;
    int _2051 = _2043 ? as_type<int>(_2049) : as_type<int>(_209);
    float _2053 = floor(_2045);
    float _2055 = _2033;
    if (_1808)
    {
        _2055 = 1.0;
    }
    float _2057 = _2055;
    bool _2059 = !_1842;
    float _2061 = _2059 ? _209 : as_type<float>(_2051);
    float _2063 = _2057;
    if (!_1808)
    {
        _2063 = 1.2345600128173828125;
    }
    float _2065 = _2063;
    float _2067 = _2041 + (-0.5);
    bool _2069 = !_2047;
    int _2071 = _2069 ? 0 : (-1);
    float _2073 = _2065 * _1864;
    int _2075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2077 = _2075 != 0;
    float _2079 = -_2067;
    float _2081 = -_821;
    float _2083 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2087 = _2085 != 0;
    int _2089 = _2037 * int(_2003);
    int _2091 = _2089 + _1854;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2095 = _2093 != 0;
    float _2097 = floor(_2073);
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2101 = _2099 != 0;
    float _2103 = _1987 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2107 = _2105 != 0;
    float _2109 = _2061 + 0.5;
    float _2111 = float(uint(_2091));
    float _2113 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2115 = float(_1804);
    float _2117 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[80].x, _815);
    float _2119 = as_type<float>(_1979) * _2111;
    bool _2121 = _1888 >= _2115;
    bool _2123 = isnan(_1888);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(_2115);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    float _2133 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2137 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2143 = _1971 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = -_2053;
    float _2149 = _2045 + _2147;
    float _2151 = _2013 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2153 = _1933 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2155 = trunc(_2131);
    int _2157 = int(_2155);
    float _2159 = _2149 * _2115;
    float _2161 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2165 = ~_2005;
    int _2167 = _2165 + _2071;
    int _2169 = _2167 + 1;
    float _2171 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2173 = -_2097;
    float _2175 = _2073 + _2173;
    bool _2177 = !_2087;
    int _2179 = _2177 ? 0 : 1;
    float _2181 = trunc(_2119);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    bool _2187 = _1804 == 0;
    out.m_62.x = _2133;
    out.m_62.y = _2135;
    out.m_62.z = _2171;
    out.m_62.w = _2139;
    int _2189 = abs(_2179);
    float _2191 = float(_1884);
    out.m_64.x = _2161;
    out.m_64.y = _2145;
    out.m_64.z = _2163;
    out.m_64.w = _2141;
    int _2193 = ~_1884;
    int _2195 = _2193 + 1;
    float _2197 = trunc(_2159);
    int _2199 = int(_2197);
    float _2201 = _2175 * _2191;
    int _2203 = _1804 * _2169;
    int _2205 = _2203 + _1830;
    float _2207 = _2115 * _445;
    int _2209 = ~_2157;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    float _2215 = _2191 * _445;
    float _2217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2219 = !_2187;
    int _2221 = _2219 ? _2205 : (-1);
    int _2223 = int(_2003) + int(_2185);
    int _2225 = _2199 * _2189;
    int _2227 = _2225 + _1830;
    float _2229 = float(_1854);
    int _2231 = _2221 * _2213;
    int _2233 = _1804 + (-1);
    float _2235 = trunc(_2207);
    int _2237 = int(_2235);
    bool _2239 = _2229 >= _2191;
    bool _2241 = isnan(_2229);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(_2191);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    int _2251 = _2195 * _2223;
    int _2253 = _2251 + _1854;
    bool _2255 = !_2107;
    int _2257 = _2255 ? 0 : 1;
    int _2259 = _2157 * _2233;
    int _2261 = _2259 + _2231;
    int _2263 = abs(_443);
    bool _2265 = uint(_2253) >= uint(_1884);
    float _2267 = trunc(_2201);
    int _2269 = int(_2267);
    int _2271 = abs(_539);
    int _2273 = _2261 * _2263;
    int _2275 = abs(_2257);
    bool _2277 = !_2265;
    int _2279 = _2277 ? 0 : (-1);
    int _2281 = abs(_559);
    float _2283 = trunc(_2249);
    int _2285 = int(_2283);
    int _2287 = _2237 * _2271;
    int _2289 = _2287 + _2273;
    int _2291 = ~_2223;
    int _2293 = _2291 + _2279;
    int _2295 = _2293 + 1;
    float _2297 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2299 = float(uint(_2227));
    int _2301 = _2269 * _2275;
    int _2303 = _2301 + _1854;
    bool _2305 = _1884 == 0;
    int _2307 = _1884 * _2295;
    int _2309 = _2307 + _1854;
    float _2311 = _383 + 0.5;
    int _2313 = _2227 * _2281;
    int _2315 = _2313 + _2289;
    bool _2317 = !_1822;
    int _2319 = _2317 ? 0 : 1;
    float _2321 = as_type<float>(_1896) * _2299;
    float _2323 = float(uint(_2303));
    float _2325 = fma(_2297, _2311, _685);
    int _2327 = abs(_2319);
    float _2329 = trunc(_2215);
    int _2331 = int(_2329);
    int _2333 = ~_2285;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    float _2339 = as_type<float>(_1979) * _2323;
    bool _2341 = !_2305;
    int _2343 = _2341 ? _2309 : (-1);
    float _2345 = -_1812;
    float _2347 = fma(_383, _2345, _2325);
    int _2349 = _1884 + (-1);
    float _2351 = trunc(_2321);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = _2343 * _2337;
    int _2359 = _2199 * _2327;
    int _2361 = _2359 + _2315;
    int _2363 = ~_1804;
    int _2365 = _2363 + 1;
    int _2367 = _2285 * _2349;
    int _2369 = _2367 + _2357;
    int _2371 = ~_1884;
    int _2373 = _2371 + 1;
    float _2375 = trunc(_2339);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    float _2381 = float(uint(_2361));
    int _2383 = _2365 * int(_2355);
    int _2385 = _2383 + _2227;
    float _2387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2389 = _2369 * _1890;
    float _2391 = as_type<float>(_1896) * _2381;
    float _2393 = float(uint(_2385));
    int _2395 = _2373 * int(_2379);
    int _2397 = _2395 + _2303;
    int _2399 = abs(_1121);
    int _2401 = _2331 * _1900;
    int _2403 = _2401 + _2389;
    int _2405 = abs(_1207);
    float _2407 = trunc(_2391);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = float(uint(_2397));
    int _2415 = _2303 * _2399;
    int _2417 = _2415 + _2403;
    float _2419 = -_209;
    int _2421 = _1904 ? as_type<int>(_2419) : as_type<int>(_209);
    float _2423 = as_type<float>(_1896) * _2393;
    int _2425 = ~_1804;
    int _2427 = _2425 + 1;
    float _2429 = as_type<float>(_1979) * _2413;
    bool _2431 = !_2077;
    float _2433 = _2431 ? _209 : as_type<float>(_2421);
    int _2435 = _2269 * _2405;
    int _2437 = _2435 + _2417;
    float _2439 = trunc(_2423);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = _1051 + (-0.5);
    float _2447 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2449 = _2433 + 0.5;
    float _2451 = float(uint(_2437));
    float _2453 = -_2445;
    float _2455 = -_731;
    float _2457 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2455);
    float _2459 = -_2447;
    float _2461 = -_835;
    float _2463 = fma(_2459, _1910, _2461);
    float _2465 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[85].x, _833);
    int _2467 = _2427 * int(_2411);
    int _2469 = _2467 + _2361;
    float _2471 = as_type<float>(_1979) * _2451;
    float _2473 = -_819;
    float _2475 = _2473 + 1.0;
    int _2477 = ~_1884;
    int _2479 = _2477 + 1;
    float _2481 = trunc(_2429);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    float _2487 = float(uint(_2469));
    float _2489 = fma(_389, _1818, _2463);
    int _2491 = ~_1804;
    int _2493 = _2491 + 1;
    float _2495 = -_1826;
    float _2497 = fma(_2433, _2495, _2465);
    int _2499 = int(_2355) + int(_2443);
    float _2501 = -_715;
    float _2503 = _2501 + 1.0;
    float _2505 = as_type<float>(_1896) * _2487;
    float _2507 = trunc(_2471);
    float _2509 = precise::max(_2507, 0.0);
    uint _2511 = uint(_2509);
    float _2513 = fma(_1051, _2503, _2457);
    int _2515 = ~_1884;
    int _2517 = _2515 + 1;
    float _2519 = -_823;
    float _2521 = _2519 + 1.0;
    float _2523 = -_2475;
    float _2525 = fma(_2061, _2523, _2117);
    out.m_66.x = _2347;
    out.m_66.y = _2489;
    float _2527 = _1943 * _1779;
    float _2529 = trunc(_2505);
    float _2531 = precise::max(_2529, 0.0);
    uint _2533 = uint(_2531);
    int _2535 = int(_2379) + int(_2485);
    float _2537 = fma(_2041, _2521, _2083);
    float _2539 = _1800 * _2527;
    out.m_68.x = _2525;
    out.m_68.y = _2537;
    out.m_68.z = _2497;
    out.m_68.w = _2513;
    int _2541 = _2479 * int(_2511);
    int _2543 = _2541 + _2437;
    float _2545 = float(uint(_2543));
    int _2547 = _2493 * _2499;
    int _2549 = _2547 + _2227;
    float _2551 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2553 = int(_2411) + int(_2533);
    float _2555 = as_type<float>(_1979) * _2545;
    bool _2557 = uint(_2549) >= uint(_1804);
    int _2559 = _2517 * _2535;
    int _2561 = _2559 + _2303;
    float _2563 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2565 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2567 = !_2557;
    int _2569 = _2567 ? 0 : (-1);
    float _2571 = trunc(_2555);
    float _2573 = precise::max(_2571, 0.0);
    uint _2575 = uint(_2573);
    bool _2577 = uint(_2561) >= uint(_1884);
    float _2579 = -_1055;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2565);
    int _2583 = ~_1804;
    int _2585 = _2583 + 1;
    float _2587 = -_1055;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2563);
    bool _2591 = !_2577;
    int _2593 = _2591 ? 0 : (-1);
    float _2595 = -_1055;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2551);
    int _2599 = ~_2499;
    int _2601 = _2599 + _2569;
    int _2603 = _2601 + 1;
    int _2605 = _2585 * _2553;
    int _2607 = _2605 + _2361;
    int _2609 = ~_2535;
    int _2611 = _2609 + _2593;
    int _2613 = _2611 + 1;
    float _2615 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2617 = ~_1884;
    int _2619 = _2617 + 1;
    float _2621 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2623 = uint(_2607) >= uint(_1804);
    float _2625 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2615);
    float _2627 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2629 = int(_2511) + int(_2575);
    float _2631 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2621);
    bool _2633 = !_2623;
    int _2635 = _2633 ? 0 : (-1);
    float _2637 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2639 = fma(_2627, _2627, 1.0);
    int _2641 = _2619 * _2629;
    int _2643 = _2641 + _2437;
    int _2645 = ~_2553;
    int _2647 = _2645 + _2635;
    int _2649 = _2647 + 1;
    float _2651 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2653 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2637);
    int _2655 = _1804 * _2603;
    int _2657 = _2655 + _2227;
    bool _2659 = uint(_2643) >= uint(_1884);
    int _2661 = _1804 * _2649;
    int _2663 = _2661 + _2361;
    float _2665 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2667 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2669 = !_2659;
    int _2671 = _2669 ? 0 : (-1);
    float _2673 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2651);
    bool _2675 = !_2187;
    int _2677 = _2675 ? _2663 : (-1);
    float _2679 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2665);
    int _2681 = ~_2629;
    int _2683 = _2681 + _2671;
    int _2685 = _2683 + 1;
    float _2687 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2667);
    int _2689 = _2677 >> 31;
    float _2691 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2693 = _2677 & 3;
    bool _2695 = _2693 != 0;
    int _2697 = _1884 * _2685;
    int _2699 = _2697 + _2437;
    int _2701 = _2689 & 3;
    float _2703 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2679);
    float _2705 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2653);
    float _2707 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    bool _2709 = !_2305;
    int _2711 = _2709 ? _2699 : (-1);
    float _2713 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2673);
    int _2715 = _2677 + _2701;
    float _2717 = rsqrt(_2639);
    int _2719 = _2711 >> 31;
    float _2721 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2631);
    int _2723 = _2677 & 3;
    bool _2725 = _2723 != 0;
    float _2727 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2625);
    int _2729 = _2719 & 3;
    float _2731 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2597);
    bool _2733 = uint(_2723) >= 2u;
    float _2735 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2589);
    int _2737 = _2711 + _2729;
    float _2739 = _2627 * _2731;
    int _2741 = _2715 >> 2;
    float _2743 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2687);
    int _2745 = _2733 ? 0 : 1;
    float _2747 = _2627 * _2735;
    bool _2749 = _2723 != 3;
    float _2751 = fma(_2691, _2727, _2739);
    int _2753 = _2737 >> 2;
    float _2755 = _2627 * _2717;
    int _2757 = _2741 << 4;
    int _2759 = _2757 + 368;
    float _2761 = _2627 * _2707;
    int _2763 = _2753 << 4;
    int _2765 = _2763 + 512;
    float _2767 = fma(_2691, _2721, _2747);
    uint _2769 = uint(int(uint(_2759) >> uint(2)));
    uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
    int _2773 = int(_2769) & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    int _2777 = int(_2769) + 1;
    uint _2779 = uint(int(uint(_2777) >> uint(2)));
    int _2781 = _2777 & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = ~_2745;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = fma(_2691, _2705, _2761);
    int _2793 = _2695 ? 0 : 1;
    float _2795 = -_2713;
    float _2797 = _2755 * _2795;
    int _2799 = _2789;
    if (_2749)
    {
        int _2801 = ~_2745;
        int _2803 = _2801 + 1;
        _2799 = _2803;
    }
    int _2805 = _2799;
    int _2807 = _1884 * _2613;
    int _2809 = _2807 + _2303;
    bool _2811 = uint(_2723) > 1u;
    uint _2813 = uint(int(uint(_2765) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    float _2829 = fma(_2717, _2735, _2797);
    float _2831 = _2713 + _2767;
    bool _2833 = !_2725;
    int _2835 = _2833 ? 0 : 1;
    float _2837 = -_2703;
    float _2839 = _2755 * _2837;
    int _2841 = _2711 & 3;
    bool _2843 = _2841 != 0;
    float _2845 = _2703 + _2751;
    int _2847 = ~_2793;
    int _2849 = _2847 + 1;
    int _2851 = _2849 + 1;
    int _2853 = _2759 + 8;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    uint _2857 = uint(int(uint(int(_2855)) >> uint(2)));
    int _2859 = int(_2855) & 3;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[int(_2857)][_2859];
    int _2863 = int(_2855) + 1;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    int _2867 = _2863 & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    bool _2871 = uint(_2841) > 1u;
    float _2873 = fma(_2717, _2731, _2839);
    out.m_70.x = _2721;
    out.m_70.y = _2727;
    out.m_70.z = _2705;
    int _2875 = _2851;
    if (!_2811)
    {
        int _2877 = ~_2793;
        int _2879 = _2877 + 1;
        _2875 = _2879;
    }
    int _2881 = _2875;
    int _2883 = _2711 & 3;
    bool _2885 = _2883 != 0;
    float _2887 = -_2743;
    float _2889 = _2755 * _2887;
    int _2891 = _2765 + 8;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    uint _2895 = uint(int(uint(int(_2893)) >> uint(2)));
    int _2897 = int(_2893) & 3;
    float _2899 = (*spvDescriptorSet0.vp_c9)._m0[int(_2895)][_2897];
    int _2901 = int(_2893) + 1;
    uint _2903 = uint(int(uint(_2901) >> uint(2)));
    int _2905 = _2901 & 3;
    float _2907 = (*spvDescriptorSet0.vp_c9)._m0[int(_2903)][_2905];
    bool _2909 = !_2187;
    int _2911 = _2909 ? _2657 : (-1);
    float _2913 = _2743 + _2791;
    float _2915 = fma(_2717, _2707, _2889);
    int _2917 = _2885 ? 0 : 1;
    bool _2919 = !_2843;
    int _2921 = _2919 ? 0 : 1;
    out.m_72.x = _2831;
    out.m_72.y = _2845;
    out.m_72.z = _2913;
    bool _2923 = _2723 != 3;
    float _2925 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2927 = ~_2917;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    out.m_74.x = _2829;
    out.m_74.y = _2873;
    out.m_74.z = _2915;
    int _2933 = _2931;
    if (!_2871)
    {
        int _2935 = ~_2917;
        int _2937 = _2935 + 1;
        _2933 = _2937;
    }
    int _2939 = _2933;
    float _2941 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2925);
    int _2943 = abs(_2881);
    bool _2945 = _2841 != 3;
    float _2947 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2941);
    int _2949 = abs(_2939);
    int _2951 = abs(_2835);
    float _2953 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2947);
    int _2955 = ~_2943;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    bool _2961 = uint(_2841) >= 2u;
    int _2963 = abs(_2805);
    int _2965 = _2959 * as_type<int>(_2783);
    int _2967 = ~_2949;
    int _2969 = _2967 + 1;
    int _2971 = _2969 + 1;
    out.gl_Position.x = _1745;
    out.gl_Position.y = _1747;
    out.gl_Position.z = _2953;
    out.gl_Position.w = _1721;
    int _2973 = ~_2951;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    int _2979 = _2961 ? 0 : 1;
    int _2981 = _2971 * as_type<int>(_2827);
    int _2983 = ~_2963;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    int _2989 = _2977 * as_type<int>(_2775);
    int _2991 = _2989 + _2965;
    bool _2993 = _2841 != 3;
    int _2995 = ~_2979;
    int _2997 = _2995 + 1;
    int _2999 = _2997 + 1;
    int _3001 = _2999;
    if (_2945)
    {
        int _3003 = ~_2979;
        int _3005 = _3003 + 1;
        _3001 = _3005;
    }
    int _3007 = _3001;
    int _3009 = _2987 * as_type<int>(_2861);
    int _3011 = _3009 + _2991;
    int _3013 = abs(_2921);
    float _3015 = fma(_1790, _2539, _1788);
    bool _3017 = !_2993;
    int _3019 = _3017 ? 0 : (-1);
    bool _3021 = !_2095;
    int _3023 = _3021 ? 0 : 1;
    bool _3025 = !_2923;
    int _3027 = _3025 ? 0 : (-1);
    int _3029 = abs(_3007);
    int _3031 = ~_3013;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    bool _3037 = !_2101;
    int _3039 = _3037 ? 0 : 1;
    int _3041 = abs(_3019);
    int _3043 = _3035 * as_type<int>(_2819);
    int _3045 = _3043 + _2981;
    int _3047 = abs(_3027);
    int _3049 = abs(_3023);
    int _3051 = ~_3029;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    int _3057 = abs(_3039);
    int _3059 = _3055 * as_type<int>(_2899);
    int _3061 = _3059 + _3045;
    int _3063 = ~_3047;
    int _3065 = _3063 + 1;
    int _3067 = _3065 + 1;
    int _3069 = ~_3049;
    int _3071 = _3069 + 1;
    int _3073 = _3071 + 1;
    int _3075 = ~_3041;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    int _3081 = _3067 * as_type<int>(_2869);
    int _3083 = _3081 + _3011;
    int _3085 = ~_3057;
    int _3087 = _3085 + 1;
    int _3089 = _3087 + 1;
    bool _3091 = !_2305;
    int _3093 = _3091 ? _2809 : (-1);
    int _3095 = _3083 * _3073;
    bool _3097 = _1461 > 0.0;
    bool _3099 = isnan(_1461);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    int _3107 = _3079 * as_type<int>(_2907);
    int _3109 = _3107 + _3061;
    float _3111 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3113 = _2911 * _3049;
    int _3115 = _3113 + _3095;
    float _3117 = _1721 * 0.5;
    int _3119 = _3109 * _3089;
    float _3121 = _1745 + _1721;
    float _3123 = fma(_1747, -0.5, _3117);
    int _3125 = _3093 * _3057;
    int _3127 = _3125 + _3119;
    float _3129 = _2953 + _1721;
    float _3131 = _1790 * _2527;
    float _3133 = _3121 * 0.5;
    float _3135 = _3129 * 0.5;
    float _3137 = float(_3115);
    float _3139 = _3111 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3141 = float(_3127);
    float _3143 = fma(_1796, _3131, _1784);
    float _3145 = fma(_1798, _3131, _1786);
    float _3147 = _1790 * _1953;
    out.m_76.x = _3133;
    out.m_76.y = _3123;
    out.m_76.z = _3135;
    out.m_76.w = _1721;
    out.m_78.x = _3137;
    out.m_78.y = _3141;
    out.m_45.x = _3139;
    out.m_80.x = _3143;
    out.m_80.y = _3145;
    out.m_80.z = _3015;
    out.m_80.w = _3147;
    if (_3105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3149;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

