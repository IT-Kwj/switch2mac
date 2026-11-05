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
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_74 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
    float4 m_76 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_52 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _327 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_42.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3222 = as_type<float>(_121);
        out.gl_Position.z = _3222;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_47.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_45.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3291 = as_type<float>(_159);
        out.gl_Position.z = _3291;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = in.m_52.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = in.m_42.x;
    float _185 = in.m_42.y;
    float _187 = in.m_42.z;
    float _189 = 0.0;
    float _191 = _163;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_175)
    {
        float _195 = _163 * _163;
        float _197 = _195 * 0.5;
        _189 = _197;
    }
    float _199 = _189;
    float _201 = _199;
    if (!_175)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    int _207 = as_type<int>(_161) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_161) & 2;
    bool _213 = _211 != 0;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_213;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_175;
    float _225 = _205;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _163 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _163);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_175;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _163 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _191 = _279;
        _193 = _269;
    }
    float _281 = _191;
    float _283 = _193;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_281, _181, _291);
    float _299 = fma(_293, _165, _183);
    float _301 = fma(_295, _165, _185);
    float _303 = fma(_297, _165, _187);
    bool _305 = !_285;
    float _307 = _283;
    float _325;
    if (!_305)
    {
        float _309 = in.m_54.x;
        float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _313 = _309 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _317 = _315 * _311;
        float _319 = floor(_317);
        float _321 = -_319;
        float _323 = _317 + _321;
        _325 = _323;
        _327 = true;
    }
    else
    {
        float _329 = float(_105);
        float _331 = 1.0 / _329;
        float _333 = _139 * _331;
        _325 = _333;
    }
    _327 = false;
    float _335 = _325;
    float _337 = in.m_54.x;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _335 + _339;
    float _343 = in.m_54.y;
    float _345 = in.m_54.z;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = _337 * 2.0;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _357 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _359 = isnan(_335);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _343 * 2.0;
    bool _371 = _343 > 0.5;
    float _373 = floor(_351);
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _377 = _345 > 0.5;
    float _379 = -_217;
    int _381 = _371 ? as_type<int>(_379) : as_type<int>(_217);
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _393 = _391 != 0;
    float _395 = -_221;
    int _397 = _377 ? as_type<int>(_395) : as_type<int>(_221);
    float _399 = floor(_369);
    bool _401 = !_389;
    float _403 = _401 ? _217 : as_type<float>(_381);
    bool _405 = !_393;
    float _407 = _405 ? _221 : as_type<float>(_397);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _413;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _431 = _373 > 0.0;
    float _433 = 1.0 / _415;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _437 = _435 != 0;
    float _439 = fma(_429, -2.0, _347);
    bool _441 = _373 >= 0.0;
    bool _443 = isnan(_373);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    int _451 = _449 ? 0 : 1;
    float _453 = 1.0 / _411;
    bool _455 = _399 >= 0.0;
    bool _457 = isnan(_399);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _465;
    int _469 = ~_451;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = _473;
    int _477 = _451;
    if (!_431)
    {
        int _479 = ~_451;
        int _481 = _479 + 1;
        _475 = _481;
    }
    int _483 = _475;
    if (_437)
    {
        _477 = 0;
    }
    int _485 = _477;
    float _487 = 1.0 / _467;
    int _489 = _485;
    if (!_437)
    {
        _489 = 1;
    }
    int _491 = _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _335 + _493;
    int _497 = _463 ? 0 : 1;
    bool _499 = _491 != 1;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _335 + _501;
    bool _505 = _399 > 0.0;
    float _507 = _495 * _453;
    float _509 = _503 * _433;
    float _511 = _345 * 2.0;
    float _513 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _515 = !_423;
    int _517 = _515 ? 0 : 1;
    float _519 = _337 + _343;
    bool _521 = !_419;
    int _523 = _521 ? 0 : 1;
    float _525 = -_349;
    float _527 = fma(_513, 2.0, _525);
    float _529 = floor(_511);
    int _531 = ~_497;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = _341 * _487;
    bool _539 = !_427;
    int _541 = _539 ? 0 : 1;
    float _543 = _337 + _345;
    int _545 = _535;
    int _547 = as_type<int>(_519);
    if (!_505)
    {
        int _549 = ~_497;
        int _551 = _549 + 1;
        _545 = _551;
    }
    int _553 = _545;
    float _555 = _345 + _343;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    float _569 = _519 + (-1.0);
    float _571 = _555;
    if (!_499)
    {
        _307 = _343;
    }
    float _573 = _307;
    float _575 = _543 + (-1.0);
    float _577 = _573;
    if (_437)
    {
        _547 = 0;
    }
    int _579 = _547;
    float _581 = _555 + (-1.0);
    int _583 = _579;
    if (!_437)
    {
        _583 = 2;
    }
    int _585 = _583;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _589 = 0.0;
    float _591 = as_type<float>(_585);
    if (!_499)
    {
        _589 = _573;
    }
    float _593 = _589;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _597 = int(_595);
    bool _599 = _529 >= 0.0;
    bool _601 = isnan(_529);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    float _609 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _611 = 0.0;
    float _613 = _593;
    if (!_499)
    {
        _611 = _345;
    }
    float _615 = _611;
    float _617 = -_139;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[76].x, _527);
    int _621 = _607 ? 0 : 1;
    bool _623 = _529 > 0.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _625;
    float _629 = _615;
    if (!_499)
    {
        _571 = _345;
    }
    float _631 = _571;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = fma(_627, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = _631;
    if (_499)
    {
        _613 = _337;
    }
    float _641 = _613;
    float _643 = fma(_635, _507, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    if (_499)
    {
        _577 = _337;
    }
    float _645 = _577;
    float _647 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_499)
    {
        _629 = _343;
    }
    float _649 = _629;
    float _651 = _641 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_499)
    {
        _639 = _343;
    }
    float _653 = _639;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _353);
    bool _657 = _585 != 2;
    float _659 = -_375;
    float _661 = fma(_651, 2.0, _659);
    int _663 = ~_621;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].w, _355);
    int _671 = _667;
    if (!_623)
    {
        int _673 = ~_621;
        int _675 = _673 + 1;
        _671 = _675;
    }
    int _677 = _671;
    float _679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _681 = log2(_679);
    float _683 = float(_597);
    bool _685 = !_559;
    int _687 = _685 ? 0 : 1;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_657)
    {
        _591 = _337;
    }
    float _697 = _591;
    float _699 = fma(_691, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _701 = _697;
    if (!_657)
    {
        _701 = _345;
    }
    float _703 = _701;
    float _705 = fma(_695, _507, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _707 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _709 = int(_707);
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _713 = _703;
    if (_657)
    {
        _713 = _343;
    }
    float _715 = _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _719 = _715;
    if (!_657)
    {
        _719 = _337;
    }
    float _721 = _719;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _725 = abs(_687);
    float _727 = 1.0 / _683;
    float _729 = -_717;
    float _731 = fma(_711, 2.0, _729);
    float _733 = float(_105);
    float _735 = _721 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _737 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _739 = float(_483);
    float _741 = fma(_735, -2.0, _723);
    float _743 = _681 * _139;
    float _745 = 1.0 / _733;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _749 = float(_677);
    float _751 = float(_725);
    float _753 = fma(_737, -2.0, _747);
    float _755 = _727 * _139;
    float _757 = exp2(_743);
    float _759 = _751 * _749;
    bool _761 = !_563;
    int _763 = _761 ? 0 : 1;
    float _765 = in.m_56.x;
    float _767 = in.m_56.y;
    float _769 = in.m_56.z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _773 = float(_709);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _779 = abs(_763);
    float _781 = 1.0 / _773;
    bool _783 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _785 = isnan(_335);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[88].w, _777);
    float _797 = float(_779);
    float _799 = -_757;
    float _801 = _799 + 1.0;
    bool _803 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _805 = isnan(0.0);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _811 = _807 || _809;
    float _813 = _745 * _139;
    float _815 = _797 * _739;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _819 = 1.0 + _817;
    float _821 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _775);
    bool _823 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _825 = isnan(1.0);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _831 = _827 || _829;
    float _833 = -_793;
    float _835 = _833 + 1.0;
    float _837 = 1.0 / _819;
    float _839 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _439);
    float _841 = _811 ? _801 : 0.0;
    float _843 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _655);
    float _845 = -_139;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[81].x, _661);
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _851 = _367 * _835;
    bool _853 = !_567;
    int _855 = _853 ? 0 : 1;
    float _857 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].z, _771);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _821);
    float _861 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[88].z, _849);
    float _863 = _759 * (-2.0);
    int _865 = abs(_855);
    float _867 = -_139;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[86].x, _731);
    float _871 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _857);
    float _873 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _669);
    float _875 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _753);
    float _877 = _781 * _139;
    float _879 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _861);
    float _881 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _795);
    float _883 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _741);
    float _885 = fma(_609, _863, _609);
    if (_831)
    {
        float _887 = _841 * _837;
        _143 = _887;
    }
    float _889 = _143;
    float _891 = fma(_863, _765, _765);
    float _893 = _337 + (-0.5);
    bool _895 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _897 = isnan(_335);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -_367;
    float _909 = _907 + 1.0;
    float _911 = float(_553);
    float _913 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    float _915 = float(_865);
    float _917 = _905 * _909;
    bool _919 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _921 = isnan(_335);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _815 * (-2.0);
    float _933 = -_905;
    float _935 = _933 + 1.0;
    float _937 = _915 * _911;
    float _939 = fma(_885, _889, _913);
    float _941 = _343 + (-0.5);
    float _943 = fma(_931, _767, _767);
    float _945 = _929 * _935;
    float _947 = fma(_647, _931, _647);
    float _949 = -_929;
    float _951 = _949 + 1.0;
    float _953 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].y, _943);
    float _955 = _699 * _945;
    float _957 = _637 * _945;
    float _959 = _939 * 0.15915493667125701904296875;
    float _961 = fma(_947, _889, _953);
    float _963 = _937 * (-2.0);
    float _965 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].y, _957);
    float _967 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].x, _955);
    float _969 = in.m_52.x;
    float _971 = in.m_52.y;
    float _973 = _961 * 0.15915493667125701904296875;
    float _975 = fma(_963, _769, _769);
    float _977 = _345 + (-0.5);
    float _979 = fma(_587, _963, _587);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _981;
    float _985 = in.m_58.x;
    float _987 = in.m_58.y;
    float _989 = in.m_58.z;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _991;
    float _995 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[196].z, _975);
    float _997 = _959 * 6.283185482025146484375;
    float _999 = sin(_997);
    float _1001 = in.m_60.x;
    float _1003 = in.m_60.y;
    float _1005 = in.m_60.z;
    float _1007 = fma(_705, _917, _967);
    float _1009 = fma(_643, _917, _965);
    float _1011 = fma(_979, _889, _995);
    float _1013 = in.m_62.x;
    float _1015 = in.m_62.y;
    float _1017 = in.m_62.z;
    float _1019 = _959 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _1011 * 0.15915493667125701904296875;
    float _1025 = _973 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = fma(_983, _537, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1031 = fma(_993, _537, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1033 = fma(_1029, _851, _1007);
    float _1035 = fma(_1031, _851, _1009);
    float _1037 = _301 * _987;
    float _1039 = _973 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1033);
    float _1045 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1035);
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1049 = fma(_299, _985, _1037);
    float _1051 = _1043 * _969;
    float _1053 = _1045 * _971;
    float _1055 = _301 * _1003;
    float _1057 = _1023 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _301 * _1015;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = fma(_299, _1001, _1055);
    float _1071 = _1063 * _1047;
    float _1073 = _999 * _1027;
    float _1075 = _1023 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = _1021 * _1041;
    float _1081 = _1067 * _1065;
    float _1083 = _999 * _1041;
    float _1085 = _1021 * _1027;
    float _1087 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1089 = fma(_299, _1013, _1061);
    float _1091 = fma(_303, _1005, _1069);
    float _1093 = _1021 * _1059;
    float _1095 = _1027 * _1059;
    float _1097 = _999 * _1059;
    float _1099 = _1041 * _1059;
    float _1101 = _1093 * _1071;
    float _1103 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1105 = fma(_303, _989, _1049);
    float _1107 = fma(_1077, _1079, _1073);
    float _1109 = -_1071;
    float _1111 = _1077 * _1109;
    float _1113 = -_1083;
    float _1115 = fma(_1077, _1085, _1113);
    float _1117 = -_1085;
    float _1119 = fma(_1077, _1083, _1117);
    float _1121 = fma(_1107, _1081, _1101);
    float _1123 = _1097 * _1071;
    float _1125 = fma(_1099, _1081, _1111);
    float _1127 = fma(_1077, _1073, _1079);
    float _1129 = fma(_1115, _1087, _1121);
    float _1131 = fma(_1119, _1081, _1123);
    float _1133 = fma(_1095, _1087, _1125);
    float _1135 = in.m_54.w;
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1139 = fma(_1127, _1087, _1131);
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1143 = fma(_303, _1017, _1089);
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1137);
    float _1147 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1153 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1145);
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1157 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1149);
    float _1159 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1163 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1165 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1167 = _1151 + _1161;
    float _1169 = _1103 + _1163;
    float _1171 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1175 = _1167 + _1173;
    float _1177 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1165);
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1181 = _1169 + _1179;
    float _1183 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1171);
    float _1185 = _1175 * _1175;
    bool _1187 = _1135 > 0.5;
    float _1189 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1183);
    float _1193 = fma(_1181, _1181, _1185);
    float _1195 = -_221;
    int _1197 = _1187 ? as_type<int>(_1195) : as_type<int>(_221);
    float _1199 = _1147 + _1189;
    float _1201 = sqrt(_1193);
    bool _1203 = !_385;
    float _1205 = _1203 ? _221 : as_type<float>(_1197);
    float _1207 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1155);
    float _1209 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1213 = _1211 != 0;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1217 = _1215 != 0;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1225 = _1223 != 0;
    float _1227 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1207);
    float _1229 = 1.0 / _1209;
    bool _1231 = !_1217;
    int _1233 = _1231 ? 0 : 1;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1237 = !_1213;
    int _1239 = _1237 ? 0 : 1;
    bool _1241 = !_1221;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = _1235 + _1209;
    bool _1247 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1249 = isnan(0.5);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1255 = _1251 || _1253;
    bool _1257 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    bool _1269 = !_1225;
    int _1271 = _1269 ? 0 : 1;
    float _1273 = _1245 * _1229;
    float _1275 = _1273 * 0.5;
    float _1277 = _1245;
    float _1279 = _1191;
    float _1281 = _1189;
    float _1283 = _1169;
    float _1285 = _983;
    float _1287 = _1181;
    if (!_1257)
    {
        _1277 = _1169;
    }
    float _1289 = _1277;
    float _1291 = _1289;
    if (!_1257)
    {
        _1279 = _1167;
    }
    float _1293 = _1279;
    float _1295 = _1293;
    if (!_1257)
    {
        _1281 = _1199;
    }
    float _1297 = _1281;
    bool _1299 = !_1257;
    float _1301 = _1297;
    if (!_1299)
    {
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1307 = _1201 + _1305;
        float _1309 = rsqrt(_1193);
        float _1311 = _1307 * _1303;
        float _1313 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = _1311 * 0.15915493667125701904296875;
        float _1317 = _1315 * 6.283185482025146484375;
        float _1319 = cos(_1317);
        float _1321 = _1315 * 6.283185482025146484375;
        float _1323 = sin(_1321);
        float _1325 = _1319 + (-1.0);
        float _1327 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = fma(_1323, _1313, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1331 = fma(_1199, _1319, _1327);
        float _1333 = _1309 * _1329;
        float _1335 = fma(_1181, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1337 = fma(_1175, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1291 = _1335;
        _1301 = _1331;
        _1295 = _1337;
        _1283 = _1309;
    }
    float _1339 = _1291;
    float _1341 = _1301;
    float _1343 = _1295;
    float _1345 = _1283;
    float _1347 = _1341;
    float _1349 = _1339;
    float _1351 = _1343;
    float _1353 = _1345;
    if (_1267)
    {
        _1285 = 1.0;
    }
    float _1355 = _1285;
    float _1357 = _1355;
    if (!_1255)
    {
        float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1361 = _1147 + _1359;
        float _1363 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1365 = _1103 + _1363;
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1369 = -_1103;
        float _1371 = _1369 + _1339;
        float _1373 = _1361 * _1361;
        float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1377 = _1151 + _1375;
        float _1379 = -_1147;
        float _1381 = _1379 + _1341;
        float _1383 = -_1151;
        float _1385 = _1383 + _1343;
        float _1387 = fma(_1365, _1365, _1373);
        float _1389 = fma(_1377, _1377, _1387);
        float _1391 = sqrt(_1389);
        float _1393 = precise::min(_1391, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1395 = _1393 * _1367;
        float _1397 = fma(_1371, _1395, _1103);
        float _1399 = fma(_1381, _1395, _1147);
        float _1401 = fma(_1385, _1395, _1151);
        _1347 = _1399;
        _1349 = _1397;
        _1351 = _1401;
        _1353 = _1395;
    }
    float _1403 = _1347;
    float _1405 = _1349;
    float _1407 = _1351;
    float _1409 = _1353;
    float _1411 = _1409;
    if (!_1267)
    {
        float _1413 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1421 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1419);
        float _1423 = _1415 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1417 * 0.15915493667125701904296875;
        float _1429 = _1415 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = 1.0 / _1425;
        float _1435 = _1427 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1431 * _1433;
        float _1441 = _1427 * 6.283185482025146484375;
        float _1443 = sin(_1441);
        float _1445 = _1437 * _1439;
        float _1447 = 1.0 / _1421;
        float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1451 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1449;
        float _1453 = 1.0 / _1445;
        float _1455 = 1.0 / _1451;
        float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1459 = _1447 * _1457;
        float _1461 = _1443 * _1453;
        float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1465 = fma(_1461, _1459, _1463);
        float _1467 = _1465 * _1455;
        float _1469 = precise::clamp(_1467, 0.0, 1.0);
        float _1471 = -_1469;
        float _1473 = _1471 + 1.0;
        _1411 = _1427;
        _1357 = _1473;
    }
    float _1475 = _1411;
    float _1477 = _1357;
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1481 = _1403 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1485 = _1405 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1407 + _1487;
    float _1491 = _1481 * _1481;
    float _1493 = fma(_1485, _1485, _1491);
    float _1495 = fma(_1489, _1489, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1485 * _1501;
    float _1505 = _1489 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1493;
    float _1523 = _1497;
    float _1525 = _1519;
    float _1527 = _1475;
    float _1529 = _1481;
    if (_1515)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (_1515)
    {
        float _1535 = rsqrt(_1511);
        _1523 = _1535;
    }
    float _1537 = _1523;
    float _1539 = _1537;
    if (_1515)
    {
        float _1541 = _1519 * _1533;
        _1525 = _1541;
    }
    float _1543 = _1525;
    if (_1515)
    {
        float _1545 = _1543 * 0.15915493667125701904296875;
        _1527 = _1545;
    }
    float _1547 = _1527;
    float _1549 = _1489;
    float _1551 = _1547;
    if (_1515)
    {
        float _1553 = _1547 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1549 = _1555;
    }
    float _1557 = _1549;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1561 = precise::max(0.0, _1559);
    float _1563 = _1533;
    float _1565 = _1561;
    if (_1515)
    {
        float _1567 = _1547 * 6.283185482025146484375;
        float _1569 = cos(_1567);
        _1563 = _1569;
    }
    float _1571 = _1563;
    float _1573 = -_1501;
    float _1575 = -_1561;
    float _1577 = fma(_1481, _1573, _1575);
    if (_1515)
    {
        float _1579 = _1577 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1579;
    }
    float _1581 = _1529;
    float _1583 = _1581;
    float _1585 = _1557;
    if (_1515)
    {
        float _1587 = fma(_1557, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1589;
    if (!_1515)
    {
        _1585 = _1507;
    }
    float _1593 = _1585;
    float _1595 = _1593;
    float _1597 = _1571;
    if (_1515)
    {
        float _1599 = _1571 + (-1.0);
        _1565 = _1599;
    }
    float _1601 = _1565;
    float _1603 = _1601;
    if (_1515)
    {
        float _1605 = _1537 * _1589;
        _1287 = _1605;
    }
    float _1607 = _1287;
    if (!_1515)
    {
        _1539 = _1503;
    }
    float _1609 = _1539;
    float _1611 = _1609;
    if (_1515)
    {
        float _1613 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1613;
    }
    float _1615 = _1551;
    if (_1515)
    {
        float _1617 = _1503 * _1607;
        _1611 = _1617;
    }
    float _1619 = _1611;
    if (!_1515)
    {
        _1591 = _1577;
    }
    float _1621 = _1591;
    float _1623 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1625 = _1621;
    if (!_1515)
    {
        _1603 = _1505;
    }
    float _1627 = _1603;
    float _1629 = _1627;
    if (_1515)
    {
        float _1631 = fma(_1577, _1571, _1615);
        _1625 = _1631;
    }
    float _1633 = _1625;
    if (_1515)
    {
        float _1635 = _1505 * _1607;
        _1629 = _1635;
    }
    float _1637 = _1629;
    if (_1515)
    {
        float _1639 = _1619 * _1619;
        _1595 = _1639;
    }
    float _1641 = _1595;
    if (!_1515)
    {
        _1597 = _1509;
    }
    float _1643 = _1597;
    float _1645 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1623);
    float _1647 = _1643;
    if (_1515)
    {
        float _1649 = _1637 * _1637;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = fma(_1633, _1633, _1641);
    float _1655 = _1653 + _1651;
    float _1657 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1667 = rsqrt(_1655);
    float _1669 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1645);
    float _1671 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1673 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1657);
    float _1675 = -_1663;
    float _1677 = _1675 + 1.0;
    float _1679 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1681 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1671);
    float _1683 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1673);
    float _1685 = abs(_1677);
    float _1687 = log2(_1685);
    float _1689 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1691 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1681);
    float _1693 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1695 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = -_1689;
    float _1699 = fma(_1697, _1665, 1.0);
    float _1701 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1705 = _1667 * _1619;
    float _1707 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1709 = _1667 * _1637;
    float _1711 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1703);
    float _1713 = _1667 * _1633;
    float _1715 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1717 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1707);
    float _1719 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1723 = -_1715;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1723);
    float _1727 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1729 = log2(_1699);
    float _1731 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = -_1709;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1725);
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1739 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = exp2(_1721);
    float _1747 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1739);
    float _1749 = _1713 + 1.0;
    float _1751 = fma(_1743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1753 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1755 = fma(_1743, _1751, -0.212114393711090087890625);
    float _1757 = 1.0 / _1737;
    float _1759 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1761 = _1729 * 0.693147182464599609375;
    float _1763 = fma(_1743, _1755, 1.570728778839111328125);
    float _1765 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1759);
    float _1767 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1769 = sqrt(_1741);
    float _1771 = -_1713;
    float _1773 = fma(_1745, _1749, _1771);
    float _1775 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1753);
    float _1777 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1779 = fma(_1773, 0.5, 0.5);
    float _1781 = _1775 * _1757;
    float _1783 = _1777 * _1757;
    float _1785 = fma(_1781, 0.5, 0.5);
    float _1787 = fma(_1783, -0.5, 0.5);
    float _1789 = _1769 * 0.636619746685028076171875;
    float _1791 = -_1763;
    float _1793 = fma(_1789, _1791, 1.0);
    float3 _5835 = float3(_1785, _1787, _1767);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5835, float3(0.0), isnan(_5835)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5835, float3(0.0), isnan(_5835)), level(0.0)).x;
    float3 _5846 = float3(_1785, _1787, _1767);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5846, float3(0.0), isnan(_5846)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5846, float3(0.0), isnan(_5846)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5863 = float2(_1793, _1779);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5863, float2(0.0), isnan(_5863)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5863, float2(0.0), isnan(_5863)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = -_881;
    float _1828 = _1826 + 1.0;
    bool _1830 = _343 > 0.5;
    float _1832 = -_873;
    float _1834 = _1832 + 1.0;
    float _1836 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1840 = _1838 != 0;
    float _1842 = trunc(_755);
    int _1844 = int(_1842);
    float _1846 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1848 = _217 + 0.5;
    int _1850 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1852 = _1850 != 0;
    float _1854 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1856 = -_221;
    int _1858 = _1830 ? as_type<int>(_1856) : as_type<int>(_221);
    float _1860 = _1846 * _337;
    float _1862 = 0.0;
    if (_1824)
    {
        _1862 = _337;
    }
    float _1864 = _1862;
    float _1866 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1836);
    float _1868 = float(uint(_1820));
    float _1870 = exp2(_1854);
    int _1872 = ~_1820;
    int _1874 = _1872 + 1;
    float _1876 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1866);
    float _1878 = _1864;
    if (!_1824)
    {
        _1878 = _343;
    }
    float _1880 = _1878;
    out.m_64.x = _1405;
    out.m_64.y = _1403;
    out.m_64.z = _1407;
    float _1882 = float(uint(_1844));
    float _1884 = 1.0 / _1868;
    float _1886 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1888 = ~_1820;
    int _1890 = _1888 + 1;
    bool _1892 = !_1852;
    float _1894 = _1892 ? _221 : as_type<float>(_1858);
    float _1896 = _1886 * _337;
    float _1898 = trunc(_1860);
    int _1900 = int(_1898);
    bool _1902 = _337 > 0.5;
    float _1904 = -_1870;
    float _1906 = _1904 + 1.0;
    int _1908 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1910 = _1908 != 0;
    float _1912 = 0.0;
    float _1914 = as_type<float>(_1890);
    if (_1824)
    {
        _1912 = 1.0;
    }
    float _1916 = _1912;
    float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1920 = _1916;
    if (!_1824)
    {
        _1920 = 7.345489978790283203125;
    }
    float _1922 = _1920;
    float _1924 = trunc(_1896);
    int _1926 = int(_1924);
    int _1928 = as_type<int>(_1884) + (-2);
    float _1930 = -_1918;
    float _1932 = _1930 + 1.0;
    int _1934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1936 = _1934 != 0;
    float _1938 = as_type<float>(_1928) * _1882;
    int _1940 = abs(_517);
    float _1942 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1944 = int(_1942);
    int _1946 = _1900 << 4;
    int _1948 = _1946 + 1712;
    int _1950 = abs(_523);
    int _1952 = abs(_541);
    int _1954 = abs(_1239);
    float _1956 = trunc(_1938);
    float _1958 = precise::max(_1956, 0.0);
    uint _1961 = uint(_1958);
    int _1963 = _1926 << 4;
    int _1965 = _1963 + 1968;
    int _1967 = abs(_1243);
    bool _1969 = _345 > 0.5;
    float _1971 = float(uint(_1944));
    float _1973 = -_221;
    float _1975 = _1973 + 0.5;
    int _1977 = ~_1820;
    int _1979 = _1977 + 1;
    float _1981 = 1.0 / _1971;
    int _1983 = _1874 * int(_1961);
    int _1985 = _1983 + _1844;
    out.m_66.x = _1848;
    out.m_66.y = _1975;
    float _1987 = float(uint(_1985));
    float _1989 = as_type<float>(_1928) * _1987;
    int _1991 = _1965 + 8;
    uint _1993 = uint(int(uint(_1991) >> uint(2)));
    uint _1995 = uint(int(uint(int(_1993)) >> uint(2)));
    int _1997 = int(_1993) & 3;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[int(_1995)][_1997];
    float _2001 = trunc(_1989);
    float _2003 = precise::max(_2001, 0.0);
    uint _2005 = uint(_2003);
    int _2007 = as_type<int>(_1981) + (-2);
    uint _2009 = uint(int(uint(_1948) >> uint(2)));
    uint _2011 = uint(int(uint(int(_2009)) >> uint(2)));
    int _2013 = int(_2009) & 3;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[int(_2011)][_2013];
    int _2017 = int(_2009) + 1;
    uint _2019 = uint(int(uint(_2017) >> uint(2)));
    int _2021 = _2017 & 3;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[int(_2019)][_2021];
    uint _2025 = uint(int(uint(_1965) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[int(_2035)][_2037];
    int _2041 = int(_1961) + int(_2005);
    float _2043 = trunc(_877);
    int _2045 = int(_2043);
    int _2047 = _1948 + 8;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    uint _2051 = uint(int(uint(int(_2049)) >> uint(2)));
    int _2053 = int(_2049) & 3;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[int(_2051)][_2053];
    int _2057 = _1890 * _2041;
    int _2059 = _2057 + _1844;
    if (_1824)
    {
        _1914 = 1.0;
    }
    float _2061 = _1914;
    float _2063 = _2061;
    if (!_1824)
    {
        _2063 = 1.2345600128173828125;
    }
    float _2065 = _2063;
    float _2067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2069 = uint(_2059) >= uint(_1820);
    float _2071 = -_217;
    int _2073 = _1902 ? as_type<int>(_2071) : as_type<int>(_217);
    float _2075 = _1922 * _337;
    bool _2077 = !_2069;
    int _2079 = _2077 ? 0 : (-1);
    float _2081 = _2065 * _1880;
    bool _2083 = !_1910;
    float _2085 = _2083 ? _217 : as_type<float>(_2073);
    float _2087 = floor(_2075);
    float _2089 = float(uint(_2045));
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2093 = _2091 != 0;
    float _2095 = _2085 + 0.5;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2099 = _2097 != 0;
    float _2101 = as_type<float>(_2007) * _2089;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2105 = _2103 != 0;
    float _2107 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[80].x, _619);
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2111 = _2109 != 0;
    float _2113 = _1894 + (-0.5);
    int _2115 = ~_1944;
    int _2117 = _2115 + 1;
    float _2119 = trunc(_2101);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = float(_1820);
    float _2127 = -_2113;
    float _2129 = -_839;
    float _2131 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2129);
    float _2133 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2135 = floor(_2081);
    float _2137 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2139 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2141 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2143 = _2117 * int(_2123);
    int _2145 = _2143 + _2045;
    float _2147 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2153 = float(_1844);
    float _2155 = float(uint(_2145));
    float _2157 = _2031 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2159 = _2153 >= _2125;
    bool _2161 = isnan(_2153);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan(_2125);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2173 = -_2135;
    float _2175 = _2081 + _2173;
    float _2177 = as_type<float>(_2007) * _2155;
    float _2179 = _1999 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2181 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2183 = -_2087;
    float _2185 = _2075 + _2183;
    int _2187 = ~_2041;
    int _2189 = _2187 + _2079;
    int _2191 = _2189 + 1;
    float _2193 = trunc(_2169);
    int _2195 = int(_2193);
    float _2197 = _2171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2199 = _2185 * _2125;
    float _2201 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2203 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2205 = !_2093;
    int _2207 = _2205 ? 0 : 1;
    out.m_68.x = _2139;
    out.m_68.y = _2141;
    out.m_68.z = _2197;
    out.m_68.w = _2149;
    bool _2209 = _1820 == 0;
    float _2211 = trunc(_2177);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    float _2217 = float(_1944);
    out.m_70.x = _2201;
    out.m_70.y = _2181;
    out.m_70.z = _2203;
    out.m_70.w = _2151;
    int _2219 = ~_1944;
    int _2221 = _2219 + 1;
    float _2223 = _2175 * _2217;
    float _2225 = trunc(_2199);
    int _2227 = int(_2225);
    int _2229 = _1820 * _2191;
    int _2231 = _2229 + _1844;
    float _2233 = _2125 * _813;
    int _2235 = abs(_2207);
    float _2237 = _2217 * _813;
    int _2239 = int(_2123) + int(_2215);
    float _2241 = float(_2045);
    float _2243 = trunc(_2233);
    int _2245 = int(_2243);
    int _2247 = ~_2195;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    bool _2253 = !_2209;
    int _2255 = _2253 ? _2231 : (-1);
    bool _2257 = _2241 >= _2217;
    bool _2259 = isnan(_2241);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(_2217);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2265);
    int _2269 = _2227 * _2235;
    int _2271 = _2269 + _1844;
    bool _2273 = !_2111;
    int _2275 = _2273 ? 0 : 1;
    int _2277 = _2221 * _2239;
    int _2279 = _2277 + _2045;
    float _2281 = trunc(_2237);
    int _2283 = int(_2281);
    int _2285 = _2255 * _2251;
    int _2287 = _1820 + (-1);
    bool _2289 = uint(_2279) >= uint(_1944);
    int _2291 = _2195 * _2287;
    int _2293 = _2291 + _2285;
    float _2295 = trunc(_2223);
    int _2297 = int(_2295);
    int _2299 = abs(_2275);
    int _2301 = _2293 * _1940;
    bool _2303 = !_2289;
    int _2305 = _2303 ? 0 : (-1);
    float _2307 = trunc(_2267);
    int _2309 = int(_2307);
    int _2311 = ~_2239;
    int _2313 = _2311 + _2305;
    int _2315 = _2313 + 1;
    int _2317 = _2245 * _1950;
    int _2319 = _2317 + _2301;
    float _2321 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2323 = float(uint(_2271));
    int _2325 = _1944 * _2315;
    int _2327 = _2325 + _2045;
    bool _2329 = _1944 == 0;
    int _2331 = _2297 * _2299;
    int _2333 = _2331 + _2045;
    int _2335 = _2271 * _1952;
    int _2337 = _2335 + _2319;
    float _2339 = as_type<float>(_1928) * _2323;
    bool _2341 = !_1840;
    int _2343 = _2341 ? 0 : 1;
    float _2345 = float(uint(_2333));
    int _2347 = abs(_2343);
    float _2349 = _403 + 0.5;
    int _2351 = ~_2309;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    float _2357 = as_type<float>(_2007) * _2345;
    bool _2359 = !_2329;
    int _2361 = _2359 ? _2327 : (-1);
    float _2363 = trunc(_2339);
    float _2365 = precise::max(_2363, 0.0);
    uint _2367 = uint(_2365);
    float _2369 = fma(_2321, _2349, _869);
    int _2371 = _1944 + (-1);
    int _2373 = _2227 * _2347;
    int _2375 = _2373 + _2337;
    int _2377 = abs(_1233);
    int _2379 = _2361 * _2355;
    int _2381 = ~_1944;
    int _2383 = _2381 + 1;
    float _2385 = trunc(_2357);
    float _2387 = precise::max(_2385, 0.0);
    uint _2389 = uint(_2387);
    int _2391 = _2309 * _2371;
    int _2393 = _2391 + _2379;
    int _2395 = ~_1820;
    int _2397 = _2395 + 1;
    float _2399 = float(uint(_2375));
    int _2401 = _2393 * _2377;
    int _2403 = _2397 * int(_2367);
    int _2405 = _2403 + _2271;
    float _2407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2409 = _2283 * _1954;
    int _2411 = _2409 + _2401;
    float _2413 = as_type<float>(_1928) * _2399;
    float _2415 = -_217;
    int _2417 = _1969 ? as_type<int>(_2415) : as_type<int>(_217);
    float _2419 = float(uint(_2405));
    int _2421 = _2383 * int(_2389);
    int _2423 = _2421 + _2333;
    int _2425 = abs(_1271);
    float _2427 = trunc(_2413);
    float _2429 = precise::max(_2427, 0.0);
    uint _2431 = uint(_2429);
    float _2433 = as_type<float>(_1928) * _2419;
    bool _2435 = !_1936;
    float _2437 = _2435 ? _217 : as_type<float>(_2417);
    float _2439 = float(uint(_2423));
    int _2441 = _2333 * _1967;
    int _2443 = _2441 + _2411;
    float _2445 = _1205 + (-0.5);
    float _2447 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2449 = trunc(_2433);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    int _2455 = _2297 * _2425;
    int _2457 = _2455 + _2443;
    float _2459 = _407 + (-0.5);
    float _2461 = -_2445;
    float _2463 = -_875;
    float _2465 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2463);
    float _2467 = _2437 + 0.5;
    float _2469 = as_type<float>(_2007) * _2439;
    float _2471 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[85].x, _847);
    float _2473 = float(uint(_2457));
    float _2475 = -_879;
    float _2477 = _2475 + 1.0;
    int _2479 = _1979 * int(_2431);
    int _2481 = _2479 + _2375;
    float _2483 = trunc(_2469);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = as_type<float>(_2007) * _2473;
    float _2491 = -_2447;
    float _2493 = -_883;
    float _2495 = fma(_2491, _2459, _2493);
    int _2497 = int(_2367) + int(_2453);
    float _2499 = -_2477;
    float _2501 = fma(_403, _2499, _2369);
    int _2503 = ~_1944;
    int _2505 = _2503 + 1;
    float _2507 = fma(_407, _1828, _2495);
    float _2509 = trunc(_2489);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    float _2515 = float(uint(_2481));
    float _2517 = -_871;
    float _2519 = _2517 + 1.0;
    float _2521 = -_843;
    float _2523 = _2521 + 1.0;
    float _2525 = -_859;
    float _2527 = _2525 + 1.0;
    float _2529 = as_type<float>(_1928) * _2515;
    float _2531 = -_2519;
    float _2533 = fma(_2085, _2531, _2107);
    float _2535 = -_2523;
    float _2537 = fma(_2437, _2535, _2471);
    int _2539 = ~_1820;
    int _2541 = _2539 + 1;
    float _2543 = fma(_1205, _1834, _2465);
    int _2545 = int(_2389) + int(_2487);
    float _2547 = trunc(_2529);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    int _2553 = ~_1944;
    int _2555 = _2553 + 1;
    int _2557 = _2541 * _2497;
    int _2559 = _2557 + _2271;
    float _2561 = fma(_1894, _2527, _2131);
    int _2563 = _2505 * int(_2513);
    int _2565 = _2563 + _2457;
    out.m_72.x = _2501;
    out.m_72.y = _2507;
    float _2567 = _1918 * _1795;
    bool _2569 = uint(_2559) >= uint(_1820);
    int _2571 = _2555 * _2545;
    int _2573 = _2571 + _2333;
    float _2575 = float(uint(_2565));
    float _2577 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_74.x = _2533;
    out.m_74.y = _2561;
    out.m_74.z = _2537;
    out.m_74.w = _2543;
    float _2579 = _1816 * _2567;
    bool _2581 = uint(_2573) >= uint(_1944);
    float _2583 = as_type<float>(_2007) * _2575;
    float _2585 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2587 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2589 = -_1077;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2577);
    int _2593 = int(_2431) + int(_2551);
    float _2595 = -_1077;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2585);
    float _2599 = trunc(_2583);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    float _2605 = -_1077;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2587);
    int _2609 = ~_1820;
    int _2611 = _2609 + 1;
    float _2613 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2615 = ~_1944;
    int _2617 = _2615 + 1;
    bool _2619 = !_2569;
    int _2621 = _2619 ? 0 : (-1);
    int _2623 = _2611 * _2593;
    int _2625 = _2623 + _2375;
    float _2627 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2613);
    bool _2629 = !_2581;
    int _2631 = _2629 ? 0 : (-1);
    int _2633 = ~_2497;
    int _2635 = _2633 + _2621;
    int _2637 = _2635 + 1;
    float _2639 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2641 = uint(_2625) >= uint(_1820);
    float _2643 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2645 = ~_2545;
    int _2647 = _2645 + _2631;
    int _2649 = _2647 + 1;
    float _2651 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2639);
    int _2653 = int(_2513) + int(_2603);
    float _2655 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2591);
    bool _2657 = !_2641;
    int _2659 = _2657 ? 0 : (-1);
    int _2661 = _1820 * _2637;
    int _2663 = _2661 + _2271;
    float _2665 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2651);
    int _2667 = _2617 * _2653;
    int _2669 = _2667 + _2457;
    int _2671 = ~_2593;
    int _2673 = _2671 + _2659;
    int _2675 = _2673 + 1;
    float _2677 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2597);
    float _2679 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2681 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2683 = uint(_2669) >= uint(_1944);
    int _2685 = _1820 * _2675;
    int _2687 = _2685 + _2375;
    float _2689 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2691 = fma(_2679, _2679, 1.0);
    bool _2693 = !_2683;
    int _2695 = _2693 ? 0 : (-1);
    float _2697 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2681);
    bool _2699 = !_2209;
    int _2701 = _2699 ? _2687 : (-1);
    float _2703 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2689);
    int _2705 = ~_2653;
    int _2707 = _2705 + _2695;
    int _2709 = _2707 + 1;
    float _2711 = rsqrt(_2691);
    int _2713 = _2701 >> 31;
    float _2715 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2703);
    float _2717 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2719 = _1944 * _2709;
    int _2721 = _2719 + _2457;
    int _2723 = _2713 & 3;
    float _2725 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2607);
    int _2727 = _2701 & 3;
    bool _2729 = _2727 != 0;
    float _2731 = _2679 * _2677;
    bool _2733 = !_2329;
    int _2735 = _2733 ? _2721 : (-1);
    float _2737 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2697);
    int _2739 = _2701 + _2723;
    float _2741 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2643);
    int _2743 = _2735 >> 31;
    float _2745 = _2679 * _2655;
    int _2747 = _2701 & 3;
    bool _2749 = _2747 != 0;
    float _2751 = _2679 * _2711;
    int _2753 = _2743 & 3;
    float _2755 = _2679 * _2725;
    int _2757 = _2739 >> 2;
    float _2759 = fma(_2717, _2665, _2731);
    int _2761 = _2735 + _2753;
    float _2763 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2765 = _2757 << 4;
    int _2767 = _2765 + 368;
    float _2769 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2627);
    int _2771 = _2761 >> 2;
    float _2773 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2741);
    uint _2775 = uint(int(uint(_2767) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = _2729 ? 0 : 1;
    float _2793 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2763);
    int _2795 = _2771 << 4;
    int _2797 = _2795 + 512;
    float _2799 = -_2737;
    float _2801 = _2751 * _2799;
    bool _2803 = uint(_2747) >= 2u;
    float _2805 = fma(_2717, _2769, _2745);
    bool _2807 = uint(_2747) > 1u;
    uint _2809 = uint(int(uint(_2797) >> uint(2)));
    uint _2811 = uint(int(uint(int(_2809)) >> uint(2)));
    int _2813 = int(_2809) & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = int(_2809) + 1;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    int _2821 = _2817 & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    float _2825 = fma(_2717, _2773, _2755);
    float _2827 = fma(_2711, _2677, _2801);
    int _2829 = _2803 ? 0 : 1;
    float _2831 = _2737 + _2759;
    bool _2833 = _2747 != 3;
    float _2835 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2793);
    int _2837 = ~_2791;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2767 + 8;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    int _2861 = ~_2829;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = _1944 * _2649;
    int _2869 = _2867 + _2333;
    float _2871 = -_2715;
    float _2873 = _2751 * _2871;
    int _2875 = _2841;
    int _2877 = _2865;
    if (!_2807)
    {
        int _2879 = ~_2791;
        int _2881 = _2879 + 1;
        _2875 = _2881;
    }
    int _2883 = _2875;
    out.m_76.x = _2665;
    out.m_76.y = _2769;
    out.m_76.z = _2773;
    bool _2885 = !_2749;
    int _2887 = _2885 ? 0 : 1;
    float _2889 = fma(_2711, _2655, _2873);
    int _2891 = _2735 & 3;
    bool _2893 = _2891 != 0;
    int _2895 = _2797 + 8;
    uint _2897 = uint(int(uint(_2895) >> uint(2)));
    uint _2899 = uint(int(uint(int(_2897)) >> uint(2)));
    int _2901 = int(_2897) & 3;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[int(_2899)][_2901];
    int _2905 = int(_2897) + 1;
    uint _2907 = uint(int(uint(_2905) >> uint(2)));
    int _2909 = _2905 & 3;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[int(_2907)][_2909];
    if (_2833)
    {
        int _2913 = ~_2829;
        int _2915 = _2913 + 1;
        _2877 = _2915;
    }
    int _2917 = _2877;
    bool _2919 = uint(_2891) > 1u;
    int _2921 = _2735 & 3;
    bool _2923 = _2921 != 0;
    float _2925 = _2715 + _2805;
    float _2927 = -_2835;
    float _2929 = _2751 * _2927;
    int _2931 = abs(_2883);
    float _2933 = _2835 + _2825;
    int _2935 = _2923 ? 0 : 1;
    float _2937 = fma(_2711, _2725, _2929);
    bool _2939 = !_2893;
    int _2941 = _2939 ? 0 : 1;
    int _2943 = ~_2935;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    out.m_78.x = _2831;
    out.m_78.y = _2925;
    out.m_78.z = _2933;
    int _2949 = _2947;
    if (!_2919)
    {
        int _2951 = ~_2935;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    bool _2957 = _2891 != 3;
    out.m_80.x = _2827;
    out.m_80.y = _2889;
    out.m_80.z = _2937;
    int _2959 = abs(_2887);
    int _2961 = abs(_2955);
    bool _2963 = uint(_2891) >= 2u;
    int _2965 = ~_2931;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    int _2971 = ~_2961;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = _2963 ? 0 : 1;
    int _2979 = _2969 * as_type<int>(_2789);
    int _2981 = abs(_2941);
    int _2983 = _2975 * as_type<int>(_2823);
    int _2985 = abs(_2917);
    int _2987 = ~_2959;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = ~_2977;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = ~_2985;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    int _3005 = _2991 * as_type<int>(_2781);
    int _3007 = _3005 + _2979;
    int _3009 = _2997;
    if (_2957)
    {
        int _3011 = ~_2977;
        int _3013 = _3011 + 1;
        _3009 = _3013;
    }
    int _3015 = _3009;
    bool _3017 = _2891 != 3;
    int _3019 = _3003 * as_type<int>(_2851);
    int _3021 = _3019 + _3007;
    bool _3023 = _2747 != 3;
    float _3025 = fma(_1806, _2579, _1804);
    int _3027 = abs(_3015);
    bool _3029 = !_3017;
    int _3031 = _3029 ? 0 : (-1);
    bool _3033 = !_2099;
    int _3035 = _3033 ? 0 : 1;
    bool _3037 = !_3023;
    int _3039 = _3037 ? 0 : (-1);
    int _3041 = ~_2981;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    bool _3047 = !_2105;
    int _3049 = _3047 ? 0 : 1;
    int _3051 = abs(_3031);
    int _3053 = _3045 * as_type<int>(_2815);
    int _3055 = _3053 + _2983;
    int _3057 = abs(_3039);
    int _3059 = abs(_3035);
    int _3061 = ~_3027;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = abs(_3049);
    int _3069 = _3065 * as_type<int>(_2903);
    int _3071 = _3069 + _3055;
    int _3073 = ~_3057;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    int _3079 = ~_3051;
    int _3081 = _3079 + 1;
    int _3083 = _3081 + 1;
    int _3085 = ~_3059;
    int _3087 = _3085 + 1;
    int _3089 = _3087 + 1;
    int _3091 = _3077 * as_type<int>(_2859);
    int _3093 = _3091 + _3021;
    int _3095 = _3083 * as_type<int>(_2911);
    int _3097 = _3095 + _3071;
    bool _3099 = !_2209;
    int _3101 = _3099 ? _2663 : (-1);
    int _3103 = _3093 * _3089;
    int _3105 = ~_3067;
    int _3107 = _3105 + 1;
    int _3109 = _3107 + 1;
    float _3111 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1876);
    bool _3113 = !_2329;
    int _3115 = _3113 ? _2869 : (-1);
    int _3117 = _3101 * _3059;
    int _3119 = _3117 + _3103;
    float _3121 = _1737 * 0.5;
    int _3123 = _3097 * _3109;
    bool _3125 = _1477 > 0.0;
    bool _3127 = isnan(_1477);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan(0.0);
    bool _3133 = _3129 || _3131;
    float _3135 = _1775 + _1737;
    float _3137 = fma(_1777, -0.5, _3121);
    int _3139 = _3115 * _3067;
    int _3141 = _3139 + _3123;
    float _3143 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3145 = _3111 + _1737;
    float _3147 = _1806 * _2567;
    float _3149 = _3135 * 0.5;
    out.gl_Position.x = _1775;
    out.gl_Position.y = _1777;
    out.gl_Position.z = _3111;
    out.gl_Position.w = _1737;
    float _3151 = _3145 * 0.5;
    float _3153 = float(_3119);
    float _3155 = _3143 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3157 = float(_3141);
    float _3159 = fma(_1812, _3147, _1800);
    float _3161 = fma(_1814, _3147, _1802);
    float _3163 = _1806 * _1932;
    out.m_82.x = _3149;
    out.m_82.y = _3137;
    out.m_82.z = _3151;
    out.m_82.w = _1737;
    out.m_84.x = _3153;
    out.m_84.y = _3157;
    out.m_45.x = _3155;
    out.m_86.x = _3159;
    out.m_86.y = _3161;
    out.m_86.z = _3025;
    out.m_86.w = _3163;
    if (_3133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3165;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _327 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_42.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3222 = as_type<float>(_121);
        out.gl_Position.z = _3222;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_47.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_45.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3291 = as_type<float>(_159);
        out.gl_Position.z = _3291;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = in.m_52.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = in.m_42.x;
    float _185 = in.m_42.y;
    float _187 = in.m_42.z;
    float _189 = 0.0;
    float _191 = _163;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_175)
    {
        float _195 = _163 * _163;
        float _197 = _195 * 0.5;
        _189 = _197;
    }
    float _199 = _189;
    float _201 = _199;
    if (!_175)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    int _207 = as_type<int>(_161) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_161) & 2;
    bool _213 = _211 != 0;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_213;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_175;
    float _225 = _205;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _163 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _163);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_175;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _163 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _191 = _279;
        _193 = _269;
    }
    float _281 = _191;
    float _283 = _193;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_281, _181, _291);
    float _299 = fma(_293, _165, _183);
    float _301 = fma(_295, _165, _185);
    float _303 = fma(_297, _165, _187);
    bool _305 = !_285;
    float _307 = _283;
    float _325;
    if (!_305)
    {
        float _309 = in.m_54.x;
        float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _313 = _309 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _317 = _315 * _311;
        float _319 = floor(_317);
        float _321 = -_319;
        float _323 = _317 + _321;
        _325 = _323;
        _327 = true;
    }
    else
    {
        float _329 = float(_105);
        float _331 = 1.0 / _329;
        float _333 = _139 * _331;
        _325 = _333;
    }
    _327 = false;
    float _335 = _325;
    float _337 = in.m_54.x;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _335 + _339;
    float _343 = in.m_54.y;
    float _345 = in.m_54.z;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = _337 * 2.0;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _357 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _359 = isnan(_335);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _343 * 2.0;
    bool _371 = _343 > 0.5;
    float _373 = floor(_351);
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _377 = _345 > 0.5;
    float _379 = -_217;
    int _381 = _371 ? as_type<int>(_379) : as_type<int>(_217);
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _393 = _391 != 0;
    float _395 = -_221;
    int _397 = _377 ? as_type<int>(_395) : as_type<int>(_221);
    float _399 = floor(_369);
    bool _401 = !_389;
    float _403 = _401 ? _217 : as_type<float>(_381);
    bool _405 = !_393;
    float _407 = _405 ? _221 : as_type<float>(_397);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _413;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _431 = _373 > 0.0;
    float _433 = 1.0 / _415;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _437 = _435 != 0;
    float _439 = fma(_429, -2.0, _347);
    bool _441 = _373 >= 0.0;
    bool _443 = isnan(_373);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    int _451 = _449 ? 0 : 1;
    float _453 = 1.0 / _411;
    bool _455 = _399 >= 0.0;
    bool _457 = isnan(_399);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _465;
    int _469 = ~_451;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = _473;
    int _477 = _451;
    if (!_431)
    {
        int _479 = ~_451;
        int _481 = _479 + 1;
        _475 = _481;
    }
    int _483 = _475;
    if (_437)
    {
        _477 = 0;
    }
    int _485 = _477;
    float _487 = 1.0 / _467;
    int _489 = _485;
    if (!_437)
    {
        _489 = 1;
    }
    int _491 = _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _335 + _493;
    int _497 = _463 ? 0 : 1;
    bool _499 = _491 != 1;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _335 + _501;
    bool _505 = _399 > 0.0;
    float _507 = _495 * _453;
    float _509 = _503 * _433;
    float _511 = _345 * 2.0;
    float _513 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _515 = !_423;
    int _517 = _515 ? 0 : 1;
    float _519 = _337 + _343;
    bool _521 = !_419;
    int _523 = _521 ? 0 : 1;
    float _525 = -_349;
    float _527 = fma(_513, 2.0, _525);
    float _529 = floor(_511);
    int _531 = ~_497;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = _341 * _487;
    bool _539 = !_427;
    int _541 = _539 ? 0 : 1;
    float _543 = _337 + _345;
    int _545 = _535;
    int _547 = as_type<int>(_519);
    if (!_505)
    {
        int _549 = ~_497;
        int _551 = _549 + 1;
        _545 = _551;
    }
    int _553 = _545;
    float _555 = _345 + _343;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    float _569 = _519 + (-1.0);
    float _571 = _555;
    if (!_499)
    {
        _307 = _343;
    }
    float _573 = _307;
    float _575 = _543 + (-1.0);
    float _577 = _573;
    if (_437)
    {
        _547 = 0;
    }
    int _579 = _547;
    float _581 = _555 + (-1.0);
    int _583 = _579;
    if (!_437)
    {
        _583 = 2;
    }
    int _585 = _583;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _589 = 0.0;
    float _591 = as_type<float>(_585);
    if (!_499)
    {
        _589 = _573;
    }
    float _593 = _589;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _597 = int(_595);
    bool _599 = _529 >= 0.0;
    bool _601 = isnan(_529);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    float _609 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _611 = 0.0;
    float _613 = _593;
    if (!_499)
    {
        _611 = _345;
    }
    float _615 = _611;
    float _617 = -_139;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[76].x, _527);
    int _621 = _607 ? 0 : 1;
    bool _623 = _529 > 0.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _625;
    float _629 = _615;
    if (!_499)
    {
        _571 = _345;
    }
    float _631 = _571;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = fma(_627, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = _631;
    if (_499)
    {
        _613 = _337;
    }
    float _641 = _613;
    float _643 = fma(_635, _507, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    if (_499)
    {
        _577 = _337;
    }
    float _645 = _577;
    float _647 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_499)
    {
        _629 = _343;
    }
    float _649 = _629;
    float _651 = _641 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_499)
    {
        _639 = _343;
    }
    float _653 = _639;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _353);
    bool _657 = _585 != 2;
    float _659 = -_375;
    float _661 = fma(_651, 2.0, _659);
    int _663 = ~_621;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].w, _355);
    int _671 = _667;
    if (!_623)
    {
        int _673 = ~_621;
        int _675 = _673 + 1;
        _671 = _675;
    }
    int _677 = _671;
    float _679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _681 = log2(_679);
    float _683 = float(_597);
    bool _685 = !_559;
    int _687 = _685 ? 0 : 1;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_657)
    {
        _591 = _337;
    }
    float _697 = _591;
    float _699 = fma(_691, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _701 = _697;
    if (!_657)
    {
        _701 = _345;
    }
    float _703 = _701;
    float _705 = fma(_695, _507, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _707 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _709 = int(_707);
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _713 = _703;
    if (_657)
    {
        _713 = _343;
    }
    float _715 = _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _719 = _715;
    if (!_657)
    {
        _719 = _337;
    }
    float _721 = _719;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _725 = abs(_687);
    float _727 = 1.0 / _683;
    float _729 = -_717;
    float _731 = fma(_711, 2.0, _729);
    float _733 = float(_105);
    float _735 = _721 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _737 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _739 = float(_483);
    float _741 = fma(_735, -2.0, _723);
    float _743 = _681 * _139;
    float _745 = 1.0 / _733;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _749 = float(_677);
    float _751 = float(_725);
    float _753 = fma(_737, -2.0, _747);
    float _755 = _727 * _139;
    float _757 = exp2(_743);
    float _759 = _751 * _749;
    bool _761 = !_563;
    int _763 = _761 ? 0 : 1;
    float _765 = in.m_56.x;
    float _767 = in.m_56.y;
    float _769 = in.m_56.z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _773 = float(_709);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _779 = abs(_763);
    float _781 = 1.0 / _773;
    bool _783 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _785 = isnan(_335);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[88].w, _777);
    float _797 = float(_779);
    float _799 = -_757;
    float _801 = _799 + 1.0;
    bool _803 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _805 = isnan(0.0);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _811 = _807 || _809;
    float _813 = _745 * _139;
    float _815 = _797 * _739;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _819 = 1.0 + _817;
    float _821 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _775);
    bool _823 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _825 = isnan(1.0);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _831 = _827 || _829;
    float _833 = -_793;
    float _835 = _833 + 1.0;
    float _837 = 1.0 / _819;
    float _839 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _439);
    float _841 = _811 ? _801 : 0.0;
    float _843 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _655);
    float _845 = -_139;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[81].x, _661);
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _851 = _367 * _835;
    bool _853 = !_567;
    int _855 = _853 ? 0 : 1;
    float _857 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].z, _771);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _821);
    float _861 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[88].z, _849);
    float _863 = _759 * (-2.0);
    int _865 = abs(_855);
    float _867 = -_139;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[86].x, _731);
    float _871 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _857);
    float _873 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _669);
    float _875 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _753);
    float _877 = _781 * _139;
    float _879 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _861);
    float _881 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _795);
    float _883 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _741);
    float _885 = fma(_609, _863, _609);
    if (_831)
    {
        float _887 = _841 * _837;
        _143 = _887;
    }
    float _889 = _143;
    float _891 = fma(_863, _765, _765);
    float _893 = _337 + (-0.5);
    bool _895 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _897 = isnan(_335);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -_367;
    float _909 = _907 + 1.0;
    float _911 = float(_553);
    float _913 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    float _915 = float(_865);
    float _917 = _905 * _909;
    bool _919 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _921 = isnan(_335);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _815 * (-2.0);
    float _933 = -_905;
    float _935 = _933 + 1.0;
    float _937 = _915 * _911;
    float _939 = fma(_885, _889, _913);
    float _941 = _343 + (-0.5);
    float _943 = fma(_931, _767, _767);
    float _945 = _929 * _935;
    float _947 = fma(_647, _931, _647);
    float _949 = -_929;
    float _951 = _949 + 1.0;
    float _953 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].y, _943);
    float _955 = _699 * _945;
    float _957 = _637 * _945;
    float _959 = _939 * 0.15915493667125701904296875;
    float _961 = fma(_947, _889, _953);
    float _963 = _937 * (-2.0);
    float _965 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].y, _957);
    float _967 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].x, _955);
    float _969 = in.m_52.x;
    float _971 = in.m_52.y;
    float _973 = _961 * 0.15915493667125701904296875;
    float _975 = fma(_963, _769, _769);
    float _977 = _345 + (-0.5);
    float _979 = fma(_587, _963, _587);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _981;
    float _985 = in.m_58.x;
    float _987 = in.m_58.y;
    float _989 = in.m_58.z;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _991;
    float _995 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[196].z, _975);
    float _997 = _959 * 6.283185482025146484375;
    float _999 = sin(_997);
    float _1001 = in.m_60.x;
    float _1003 = in.m_60.y;
    float _1005 = in.m_60.z;
    float _1007 = fma(_705, _917, _967);
    float _1009 = fma(_643, _917, _965);
    float _1011 = fma(_979, _889, _995);
    float _1013 = in.m_62.x;
    float _1015 = in.m_62.y;
    float _1017 = in.m_62.z;
    float _1019 = _959 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _1011 * 0.15915493667125701904296875;
    float _1025 = _973 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = fma(_983, _537, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1031 = fma(_993, _537, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1033 = fma(_1029, _851, _1007);
    float _1035 = fma(_1031, _851, _1009);
    float _1037 = _301 * _987;
    float _1039 = _973 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1033);
    float _1045 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1035);
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1049 = fma(_299, _985, _1037);
    float _1051 = _1043 * _969;
    float _1053 = _1045 * _971;
    float _1055 = _301 * _1003;
    float _1057 = _1023 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _301 * _1015;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = fma(_299, _1001, _1055);
    float _1071 = _1063 * _1047;
    float _1073 = _999 * _1027;
    float _1075 = _1023 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = _1021 * _1041;
    float _1081 = _1067 * _1065;
    float _1083 = _999 * _1041;
    float _1085 = _1021 * _1027;
    float _1087 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1089 = fma(_299, _1013, _1061);
    float _1091 = fma(_303, _1005, _1069);
    float _1093 = _1021 * _1059;
    float _1095 = _1027 * _1059;
    float _1097 = _999 * _1059;
    float _1099 = _1041 * _1059;
    float _1101 = _1093 * _1071;
    float _1103 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1105 = fma(_303, _989, _1049);
    float _1107 = fma(_1077, _1079, _1073);
    float _1109 = -_1071;
    float _1111 = _1077 * _1109;
    float _1113 = -_1083;
    float _1115 = fma(_1077, _1085, _1113);
    float _1117 = -_1085;
    float _1119 = fma(_1077, _1083, _1117);
    float _1121 = fma(_1107, _1081, _1101);
    float _1123 = _1097 * _1071;
    float _1125 = fma(_1099, _1081, _1111);
    float _1127 = fma(_1077, _1073, _1079);
    float _1129 = fma(_1115, _1087, _1121);
    float _1131 = fma(_1119, _1081, _1123);
    float _1133 = fma(_1095, _1087, _1125);
    float _1135 = in.m_54.w;
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1139 = fma(_1127, _1087, _1131);
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1143 = fma(_303, _1017, _1089);
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1137);
    float _1147 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1153 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1145);
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1157 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1149);
    float _1159 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1163 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1165 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1167 = _1151 + _1161;
    float _1169 = _1103 + _1163;
    float _1171 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1175 = _1167 + _1173;
    float _1177 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1165);
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1181 = _1169 + _1179;
    float _1183 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1171);
    float _1185 = _1175 * _1175;
    bool _1187 = _1135 > 0.5;
    float _1189 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1183);
    float _1193 = fma(_1181, _1181, _1185);
    float _1195 = -_221;
    int _1197 = _1187 ? as_type<int>(_1195) : as_type<int>(_221);
    float _1199 = _1147 + _1189;
    float _1201 = sqrt(_1193);
    bool _1203 = !_385;
    float _1205 = _1203 ? _221 : as_type<float>(_1197);
    float _1207 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1155);
    float _1209 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1213 = _1211 != 0;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1217 = _1215 != 0;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1225 = _1223 != 0;
    float _1227 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1207);
    float _1229 = 1.0 / _1209;
    bool _1231 = !_1217;
    int _1233 = _1231 ? 0 : 1;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1237 = !_1213;
    int _1239 = _1237 ? 0 : 1;
    bool _1241 = !_1221;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = _1235 + _1209;
    bool _1247 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1249 = isnan(0.5);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1255 = _1251 || _1253;
    bool _1257 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    bool _1269 = !_1225;
    int _1271 = _1269 ? 0 : 1;
    float _1273 = _1245 * _1229;
    float _1275 = _1273 * 0.5;
    float _1277 = _1245;
    float _1279 = _1191;
    float _1281 = _1189;
    float _1283 = _1169;
    float _1285 = _983;
    float _1287 = _1181;
    if (!_1257)
    {
        _1277 = _1169;
    }
    float _1289 = _1277;
    float _1291 = _1289;
    if (!_1257)
    {
        _1279 = _1167;
    }
    float _1293 = _1279;
    float _1295 = _1293;
    if (!_1257)
    {
        _1281 = _1199;
    }
    float _1297 = _1281;
    bool _1299 = !_1257;
    float _1301 = _1297;
    if (!_1299)
    {
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1307 = _1201 + _1305;
        float _1309 = rsqrt(_1193);
        float _1311 = _1307 * _1303;
        float _1313 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = _1311 * 0.15915493667125701904296875;
        float _1317 = _1315 * 6.283185482025146484375;
        float _1319 = cos(_1317);
        float _1321 = _1315 * 6.283185482025146484375;
        float _1323 = sin(_1321);
        float _1325 = _1319 + (-1.0);
        float _1327 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = fma(_1323, _1313, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1331 = fma(_1199, _1319, _1327);
        float _1333 = _1309 * _1329;
        float _1335 = fma(_1181, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1337 = fma(_1175, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1291 = _1335;
        _1301 = _1331;
        _1295 = _1337;
        _1283 = _1309;
    }
    float _1339 = _1291;
    float _1341 = _1301;
    float _1343 = _1295;
    float _1345 = _1283;
    float _1347 = _1341;
    float _1349 = _1339;
    float _1351 = _1343;
    float _1353 = _1345;
    if (_1267)
    {
        _1285 = 1.0;
    }
    float _1355 = _1285;
    float _1357 = _1355;
    if (!_1255)
    {
        float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1361 = _1147 + _1359;
        float _1363 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1365 = _1103 + _1363;
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1369 = -_1103;
        float _1371 = _1369 + _1339;
        float _1373 = _1361 * _1361;
        float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1377 = _1151 + _1375;
        float _1379 = -_1147;
        float _1381 = _1379 + _1341;
        float _1383 = -_1151;
        float _1385 = _1383 + _1343;
        float _1387 = fma(_1365, _1365, _1373);
        float _1389 = fma(_1377, _1377, _1387);
        float _1391 = sqrt(_1389);
        float _1393 = precise::min(_1391, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1395 = _1393 * _1367;
        float _1397 = fma(_1371, _1395, _1103);
        float _1399 = fma(_1381, _1395, _1147);
        float _1401 = fma(_1385, _1395, _1151);
        _1347 = _1399;
        _1349 = _1397;
        _1351 = _1401;
        _1353 = _1395;
    }
    float _1403 = _1347;
    float _1405 = _1349;
    float _1407 = _1351;
    float _1409 = _1353;
    float _1411 = _1409;
    if (!_1267)
    {
        float _1413 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1421 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1419);
        float _1423 = _1415 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1417 * 0.15915493667125701904296875;
        float _1429 = _1415 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = 1.0 / _1425;
        float _1435 = _1427 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1431 * _1433;
        float _1441 = _1427 * 6.283185482025146484375;
        float _1443 = sin(_1441);
        float _1445 = _1437 * _1439;
        float _1447 = 1.0 / _1421;
        float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1451 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1449;
        float _1453 = 1.0 / _1445;
        float _1455 = 1.0 / _1451;
        float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1459 = _1447 * _1457;
        float _1461 = _1443 * _1453;
        float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1465 = fma(_1461, _1459, _1463);
        float _1467 = _1465 * _1455;
        float _1469 = precise::clamp(_1467, 0.0, 1.0);
        float _1471 = -_1469;
        float _1473 = _1471 + 1.0;
        _1411 = _1427;
        _1357 = _1473;
    }
    float _1475 = _1411;
    float _1477 = _1357;
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1481 = _1403 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1485 = _1405 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1407 + _1487;
    float _1491 = _1481 * _1481;
    float _1493 = fma(_1485, _1485, _1491);
    float _1495 = fma(_1489, _1489, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1485 * _1501;
    float _1505 = _1489 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1493;
    float _1523 = _1497;
    float _1525 = _1519;
    float _1527 = _1475;
    float _1529 = _1481;
    if (_1515)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (_1515)
    {
        float _1535 = rsqrt(_1511);
        _1523 = _1535;
    }
    float _1537 = _1523;
    float _1539 = _1537;
    if (_1515)
    {
        float _1541 = _1519 * _1533;
        _1525 = _1541;
    }
    float _1543 = _1525;
    if (_1515)
    {
        float _1545 = _1543 * 0.15915493667125701904296875;
        _1527 = _1545;
    }
    float _1547 = _1527;
    float _1549 = _1489;
    float _1551 = _1547;
    if (_1515)
    {
        float _1553 = _1547 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1549 = _1555;
    }
    float _1557 = _1549;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1561 = precise::max(0.0, _1559);
    float _1563 = _1533;
    float _1565 = _1561;
    if (_1515)
    {
        float _1567 = _1547 * 6.283185482025146484375;
        float _1569 = cos(_1567);
        _1563 = _1569;
    }
    float _1571 = _1563;
    float _1573 = -_1501;
    float _1575 = -_1561;
    float _1577 = fma(_1481, _1573, _1575);
    if (_1515)
    {
        float _1579 = _1577 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1579;
    }
    float _1581 = _1529;
    float _1583 = _1581;
    float _1585 = _1557;
    if (_1515)
    {
        float _1587 = fma(_1557, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1589;
    if (!_1515)
    {
        _1585 = _1507;
    }
    float _1593 = _1585;
    float _1595 = _1593;
    float _1597 = _1571;
    if (_1515)
    {
        float _1599 = _1571 + (-1.0);
        _1565 = _1599;
    }
    float _1601 = _1565;
    float _1603 = _1601;
    if (_1515)
    {
        float _1605 = _1537 * _1589;
        _1287 = _1605;
    }
    float _1607 = _1287;
    if (!_1515)
    {
        _1539 = _1503;
    }
    float _1609 = _1539;
    float _1611 = _1609;
    if (_1515)
    {
        float _1613 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1613;
    }
    float _1615 = _1551;
    if (_1515)
    {
        float _1617 = _1503 * _1607;
        _1611 = _1617;
    }
    float _1619 = _1611;
    if (!_1515)
    {
        _1591 = _1577;
    }
    float _1621 = _1591;
    float _1623 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1625 = _1621;
    if (!_1515)
    {
        _1603 = _1505;
    }
    float _1627 = _1603;
    float _1629 = _1627;
    if (_1515)
    {
        float _1631 = fma(_1577, _1571, _1615);
        _1625 = _1631;
    }
    float _1633 = _1625;
    if (_1515)
    {
        float _1635 = _1505 * _1607;
        _1629 = _1635;
    }
    float _1637 = _1629;
    if (_1515)
    {
        float _1639 = _1619 * _1619;
        _1595 = _1639;
    }
    float _1641 = _1595;
    if (!_1515)
    {
        _1597 = _1509;
    }
    float _1643 = _1597;
    float _1645 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1623);
    float _1647 = _1643;
    if (_1515)
    {
        float _1649 = _1637 * _1637;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = fma(_1633, _1633, _1641);
    float _1655 = _1653 + _1651;
    float _1657 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1667 = rsqrt(_1655);
    float _1669 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1645);
    float _1671 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1673 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1657);
    float _1675 = -_1663;
    float _1677 = _1675 + 1.0;
    float _1679 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1681 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1671);
    float _1683 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1673);
    float _1685 = abs(_1677);
    float _1687 = log2(_1685);
    float _1689 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1691 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1681);
    float _1693 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1695 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = -_1689;
    float _1699 = fma(_1697, _1665, 1.0);
    float _1701 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1705 = _1667 * _1619;
    float _1707 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1709 = _1667 * _1637;
    float _1711 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1703);
    float _1713 = _1667 * _1633;
    float _1715 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1717 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1707);
    float _1719 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1723 = -_1715;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1723);
    float _1727 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1729 = log2(_1699);
    float _1731 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = -_1709;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1725);
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1739 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = exp2(_1721);
    float _1747 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1739);
    float _1749 = _1713 + 1.0;
    float _1751 = fma(_1743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1753 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1755 = fma(_1743, _1751, -0.212114393711090087890625);
    float _1757 = 1.0 / _1737;
    float _1759 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1761 = _1729 * 0.693147182464599609375;
    float _1763 = fma(_1743, _1755, 1.570728778839111328125);
    float _1765 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1759);
    float _1767 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1769 = sqrt(_1741);
    float _1771 = -_1713;
    float _1773 = fma(_1745, _1749, _1771);
    float _1775 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1753);
    float _1777 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1779 = fma(_1773, 0.5, 0.5);
    float _1781 = _1775 * _1757;
    float _1783 = _1777 * _1757;
    float _1785 = fma(_1781, 0.5, 0.5);
    float _1787 = fma(_1783, -0.5, 0.5);
    float _1789 = _1769 * 0.636619746685028076171875;
    float _1791 = -_1763;
    float _1793 = fma(_1789, _1791, 1.0);
    float3 _5835 = float3(_1785, _1787, _1767);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5835, float3(0.0), isnan(_5835)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5835, float3(0.0), isnan(_5835)), level(0.0)).x;
    float3 _5846 = float3(_1785, _1787, _1767);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5846, float3(0.0), isnan(_5846)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5846, float3(0.0), isnan(_5846)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5863 = float2(_1793, _1779);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5863, float2(0.0), isnan(_5863)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5863, float2(0.0), isnan(_5863)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = -_881;
    float _1828 = _1826 + 1.0;
    bool _1830 = _343 > 0.5;
    float _1832 = -_873;
    float _1834 = _1832 + 1.0;
    float _1836 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1840 = _1838 != 0;
    float _1842 = trunc(_755);
    int _1844 = int(_1842);
    float _1846 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1848 = _217 + 0.5;
    int _1850 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1852 = _1850 != 0;
    float _1854 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1856 = -_221;
    int _1858 = _1830 ? as_type<int>(_1856) : as_type<int>(_221);
    float _1860 = _1846 * _337;
    float _1862 = 0.0;
    if (_1824)
    {
        _1862 = _337;
    }
    float _1864 = _1862;
    float _1866 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1836);
    float _1868 = float(uint(_1820));
    float _1870 = exp2(_1854);
    int _1872 = ~_1820;
    int _1874 = _1872 + 1;
    float _1876 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1866);
    float _1878 = _1864;
    if (!_1824)
    {
        _1878 = _343;
    }
    float _1880 = _1878;
    out.m_64.x = _1405;
    out.m_64.y = _1403;
    out.m_64.z = _1407;
    float _1882 = float(uint(_1844));
    float _1884 = 1.0 / _1868;
    float _1886 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1888 = ~_1820;
    int _1890 = _1888 + 1;
    bool _1892 = !_1852;
    float _1894 = _1892 ? _221 : as_type<float>(_1858);
    float _1896 = _1886 * _337;
    float _1898 = trunc(_1860);
    int _1900 = int(_1898);
    bool _1902 = _337 > 0.5;
    float _1904 = -_1870;
    float _1906 = _1904 + 1.0;
    int _1908 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1910 = _1908 != 0;
    float _1912 = 0.0;
    float _1914 = as_type<float>(_1890);
    if (_1824)
    {
        _1912 = 1.0;
    }
    float _1916 = _1912;
    float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1920 = _1916;
    if (!_1824)
    {
        _1920 = 7.345489978790283203125;
    }
    float _1922 = _1920;
    float _1924 = trunc(_1896);
    int _1926 = int(_1924);
    int _1928 = as_type<int>(_1884) + (-2);
    float _1930 = -_1918;
    float _1932 = _1930 + 1.0;
    int _1934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1936 = _1934 != 0;
    float _1938 = as_type<float>(_1928) * _1882;
    int _1940 = abs(_517);
    float _1942 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1944 = int(_1942);
    int _1946 = _1900 << 4;
    int _1948 = _1946 + 1712;
    int _1950 = abs(_523);
    int _1952 = abs(_541);
    int _1954 = abs(_1239);
    float _1956 = trunc(_1938);
    float _1958 = precise::max(_1956, 0.0);
    uint _1961 = uint(_1958);
    int _1963 = _1926 << 4;
    int _1965 = _1963 + 1968;
    int _1967 = abs(_1243);
    bool _1969 = _345 > 0.5;
    float _1971 = float(uint(_1944));
    float _1973 = -_221;
    float _1975 = _1973 + 0.5;
    int _1977 = ~_1820;
    int _1979 = _1977 + 1;
    float _1981 = 1.0 / _1971;
    int _1983 = _1874 * int(_1961);
    int _1985 = _1983 + _1844;
    out.m_66.x = _1848;
    out.m_66.y = _1975;
    float _1987 = float(uint(_1985));
    float _1989 = as_type<float>(_1928) * _1987;
    int _1991 = _1965 + 8;
    uint _1993 = uint(int(uint(_1991) >> uint(2)));
    uint _1995 = uint(int(uint(int(_1993)) >> uint(2)));
    int _1997 = int(_1993) & 3;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[int(_1995)][_1997];
    float _2001 = trunc(_1989);
    float _2003 = precise::max(_2001, 0.0);
    uint _2005 = uint(_2003);
    int _2007 = as_type<int>(_1981) + (-2);
    uint _2009 = uint(int(uint(_1948) >> uint(2)));
    uint _2011 = uint(int(uint(int(_2009)) >> uint(2)));
    int _2013 = int(_2009) & 3;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[int(_2011)][_2013];
    int _2017 = int(_2009) + 1;
    uint _2019 = uint(int(uint(_2017) >> uint(2)));
    int _2021 = _2017 & 3;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[int(_2019)][_2021];
    uint _2025 = uint(int(uint(_1965) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[int(_2035)][_2037];
    int _2041 = int(_1961) + int(_2005);
    float _2043 = trunc(_877);
    int _2045 = int(_2043);
    int _2047 = _1948 + 8;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    uint _2051 = uint(int(uint(int(_2049)) >> uint(2)));
    int _2053 = int(_2049) & 3;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[int(_2051)][_2053];
    int _2057 = _1890 * _2041;
    int _2059 = _2057 + _1844;
    if (_1824)
    {
        _1914 = 1.0;
    }
    float _2061 = _1914;
    float _2063 = _2061;
    if (!_1824)
    {
        _2063 = 1.2345600128173828125;
    }
    float _2065 = _2063;
    float _2067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2069 = uint(_2059) >= uint(_1820);
    float _2071 = -_217;
    int _2073 = _1902 ? as_type<int>(_2071) : as_type<int>(_217);
    float _2075 = _1922 * _337;
    bool _2077 = !_2069;
    int _2079 = _2077 ? 0 : (-1);
    float _2081 = _2065 * _1880;
    bool _2083 = !_1910;
    float _2085 = _2083 ? _217 : as_type<float>(_2073);
    float _2087 = floor(_2075);
    float _2089 = float(uint(_2045));
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2093 = _2091 != 0;
    float _2095 = _2085 + 0.5;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2099 = _2097 != 0;
    float _2101 = as_type<float>(_2007) * _2089;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2105 = _2103 != 0;
    float _2107 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[80].x, _619);
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2111 = _2109 != 0;
    float _2113 = _1894 + (-0.5);
    int _2115 = ~_1944;
    int _2117 = _2115 + 1;
    float _2119 = trunc(_2101);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = float(_1820);
    float _2127 = -_2113;
    float _2129 = -_839;
    float _2131 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2129);
    float _2133 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2135 = floor(_2081);
    float _2137 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2139 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2141 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2143 = _2117 * int(_2123);
    int _2145 = _2143 + _2045;
    float _2147 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2153 = float(_1844);
    float _2155 = float(uint(_2145));
    float _2157 = _2031 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2159 = _2153 >= _2125;
    bool _2161 = isnan(_2153);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan(_2125);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2173 = -_2135;
    float _2175 = _2081 + _2173;
    float _2177 = as_type<float>(_2007) * _2155;
    float _2179 = _1999 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2181 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2183 = -_2087;
    float _2185 = _2075 + _2183;
    int _2187 = ~_2041;
    int _2189 = _2187 + _2079;
    int _2191 = _2189 + 1;
    float _2193 = trunc(_2169);
    int _2195 = int(_2193);
    float _2197 = _2171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2199 = _2185 * _2125;
    float _2201 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2203 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2205 = !_2093;
    int _2207 = _2205 ? 0 : 1;
    out.m_68.x = _2139;
    out.m_68.y = _2141;
    out.m_68.z = _2197;
    out.m_68.w = _2149;
    bool _2209 = _1820 == 0;
    float _2211 = trunc(_2177);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    float _2217 = float(_1944);
    out.m_70.x = _2201;
    out.m_70.y = _2181;
    out.m_70.z = _2203;
    out.m_70.w = _2151;
    int _2219 = ~_1944;
    int _2221 = _2219 + 1;
    float _2223 = _2175 * _2217;
    float _2225 = trunc(_2199);
    int _2227 = int(_2225);
    int _2229 = _1820 * _2191;
    int _2231 = _2229 + _1844;
    float _2233 = _2125 * _813;
    int _2235 = abs(_2207);
    float _2237 = _2217 * _813;
    int _2239 = int(_2123) + int(_2215);
    float _2241 = float(_2045);
    float _2243 = trunc(_2233);
    int _2245 = int(_2243);
    int _2247 = ~_2195;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    bool _2253 = !_2209;
    int _2255 = _2253 ? _2231 : (-1);
    bool _2257 = _2241 >= _2217;
    bool _2259 = isnan(_2241);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(_2217);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2265);
    int _2269 = _2227 * _2235;
    int _2271 = _2269 + _1844;
    bool _2273 = !_2111;
    int _2275 = _2273 ? 0 : 1;
    int _2277 = _2221 * _2239;
    int _2279 = _2277 + _2045;
    float _2281 = trunc(_2237);
    int _2283 = int(_2281);
    int _2285 = _2255 * _2251;
    int _2287 = _1820 + (-1);
    bool _2289 = uint(_2279) >= uint(_1944);
    int _2291 = _2195 * _2287;
    int _2293 = _2291 + _2285;
    float _2295 = trunc(_2223);
    int _2297 = int(_2295);
    int _2299 = abs(_2275);
    int _2301 = _2293 * _1940;
    bool _2303 = !_2289;
    int _2305 = _2303 ? 0 : (-1);
    float _2307 = trunc(_2267);
    int _2309 = int(_2307);
    int _2311 = ~_2239;
    int _2313 = _2311 + _2305;
    int _2315 = _2313 + 1;
    int _2317 = _2245 * _1950;
    int _2319 = _2317 + _2301;
    float _2321 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2323 = float(uint(_2271));
    int _2325 = _1944 * _2315;
    int _2327 = _2325 + _2045;
    bool _2329 = _1944 == 0;
    int _2331 = _2297 * _2299;
    int _2333 = _2331 + _2045;
    int _2335 = _2271 * _1952;
    int _2337 = _2335 + _2319;
    float _2339 = as_type<float>(_1928) * _2323;
    bool _2341 = !_1840;
    int _2343 = _2341 ? 0 : 1;
    float _2345 = float(uint(_2333));
    int _2347 = abs(_2343);
    float _2349 = _403 + 0.5;
    int _2351 = ~_2309;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    float _2357 = as_type<float>(_2007) * _2345;
    bool _2359 = !_2329;
    int _2361 = _2359 ? _2327 : (-1);
    float _2363 = trunc(_2339);
    float _2365 = precise::max(_2363, 0.0);
    uint _2367 = uint(_2365);
    float _2369 = fma(_2321, _2349, _869);
    int _2371 = _1944 + (-1);
    int _2373 = _2227 * _2347;
    int _2375 = _2373 + _2337;
    int _2377 = abs(_1233);
    int _2379 = _2361 * _2355;
    int _2381 = ~_1944;
    int _2383 = _2381 + 1;
    float _2385 = trunc(_2357);
    float _2387 = precise::max(_2385, 0.0);
    uint _2389 = uint(_2387);
    int _2391 = _2309 * _2371;
    int _2393 = _2391 + _2379;
    int _2395 = ~_1820;
    int _2397 = _2395 + 1;
    float _2399 = float(uint(_2375));
    int _2401 = _2393 * _2377;
    int _2403 = _2397 * int(_2367);
    int _2405 = _2403 + _2271;
    float _2407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2409 = _2283 * _1954;
    int _2411 = _2409 + _2401;
    float _2413 = as_type<float>(_1928) * _2399;
    float _2415 = -_217;
    int _2417 = _1969 ? as_type<int>(_2415) : as_type<int>(_217);
    float _2419 = float(uint(_2405));
    int _2421 = _2383 * int(_2389);
    int _2423 = _2421 + _2333;
    int _2425 = abs(_1271);
    float _2427 = trunc(_2413);
    float _2429 = precise::max(_2427, 0.0);
    uint _2431 = uint(_2429);
    float _2433 = as_type<float>(_1928) * _2419;
    bool _2435 = !_1936;
    float _2437 = _2435 ? _217 : as_type<float>(_2417);
    float _2439 = float(uint(_2423));
    int _2441 = _2333 * _1967;
    int _2443 = _2441 + _2411;
    float _2445 = _1205 + (-0.5);
    float _2447 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2449 = trunc(_2433);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    int _2455 = _2297 * _2425;
    int _2457 = _2455 + _2443;
    float _2459 = _407 + (-0.5);
    float _2461 = -_2445;
    float _2463 = -_875;
    float _2465 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2463);
    float _2467 = _2437 + 0.5;
    float _2469 = as_type<float>(_2007) * _2439;
    float _2471 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[85].x, _847);
    float _2473 = float(uint(_2457));
    float _2475 = -_879;
    float _2477 = _2475 + 1.0;
    int _2479 = _1979 * int(_2431);
    int _2481 = _2479 + _2375;
    float _2483 = trunc(_2469);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = as_type<float>(_2007) * _2473;
    float _2491 = -_2447;
    float _2493 = -_883;
    float _2495 = fma(_2491, _2459, _2493);
    int _2497 = int(_2367) + int(_2453);
    float _2499 = -_2477;
    float _2501 = fma(_403, _2499, _2369);
    int _2503 = ~_1944;
    int _2505 = _2503 + 1;
    float _2507 = fma(_407, _1828, _2495);
    float _2509 = trunc(_2489);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    float _2515 = float(uint(_2481));
    float _2517 = -_871;
    float _2519 = _2517 + 1.0;
    float _2521 = -_843;
    float _2523 = _2521 + 1.0;
    float _2525 = -_859;
    float _2527 = _2525 + 1.0;
    float _2529 = as_type<float>(_1928) * _2515;
    float _2531 = -_2519;
    float _2533 = fma(_2085, _2531, _2107);
    float _2535 = -_2523;
    float _2537 = fma(_2437, _2535, _2471);
    int _2539 = ~_1820;
    int _2541 = _2539 + 1;
    float _2543 = fma(_1205, _1834, _2465);
    int _2545 = int(_2389) + int(_2487);
    float _2547 = trunc(_2529);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    int _2553 = ~_1944;
    int _2555 = _2553 + 1;
    int _2557 = _2541 * _2497;
    int _2559 = _2557 + _2271;
    float _2561 = fma(_1894, _2527, _2131);
    int _2563 = _2505 * int(_2513);
    int _2565 = _2563 + _2457;
    out.m_72.x = _2501;
    out.m_72.y = _2507;
    float _2567 = _1918 * _1795;
    bool _2569 = uint(_2559) >= uint(_1820);
    int _2571 = _2555 * _2545;
    int _2573 = _2571 + _2333;
    float _2575 = float(uint(_2565));
    float _2577 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_74.x = _2533;
    out.m_74.y = _2561;
    out.m_74.z = _2537;
    out.m_74.w = _2543;
    float _2579 = _1816 * _2567;
    bool _2581 = uint(_2573) >= uint(_1944);
    float _2583 = as_type<float>(_2007) * _2575;
    float _2585 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2587 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2589 = -_1077;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2577);
    int _2593 = int(_2431) + int(_2551);
    float _2595 = -_1077;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2585);
    float _2599 = trunc(_2583);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    float _2605 = -_1077;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2587);
    int _2609 = ~_1820;
    int _2611 = _2609 + 1;
    float _2613 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2615 = ~_1944;
    int _2617 = _2615 + 1;
    bool _2619 = !_2569;
    int _2621 = _2619 ? 0 : (-1);
    int _2623 = _2611 * _2593;
    int _2625 = _2623 + _2375;
    float _2627 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2613);
    bool _2629 = !_2581;
    int _2631 = _2629 ? 0 : (-1);
    int _2633 = ~_2497;
    int _2635 = _2633 + _2621;
    int _2637 = _2635 + 1;
    float _2639 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2641 = uint(_2625) >= uint(_1820);
    float _2643 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2645 = ~_2545;
    int _2647 = _2645 + _2631;
    int _2649 = _2647 + 1;
    float _2651 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2639);
    int _2653 = int(_2513) + int(_2603);
    float _2655 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2591);
    bool _2657 = !_2641;
    int _2659 = _2657 ? 0 : (-1);
    int _2661 = _1820 * _2637;
    int _2663 = _2661 + _2271;
    float _2665 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2651);
    int _2667 = _2617 * _2653;
    int _2669 = _2667 + _2457;
    int _2671 = ~_2593;
    int _2673 = _2671 + _2659;
    int _2675 = _2673 + 1;
    float _2677 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2597);
    float _2679 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2681 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2683 = uint(_2669) >= uint(_1944);
    int _2685 = _1820 * _2675;
    int _2687 = _2685 + _2375;
    float _2689 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2691 = fma(_2679, _2679, 1.0);
    bool _2693 = !_2683;
    int _2695 = _2693 ? 0 : (-1);
    float _2697 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2681);
    bool _2699 = !_2209;
    int _2701 = _2699 ? _2687 : (-1);
    float _2703 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2689);
    int _2705 = ~_2653;
    int _2707 = _2705 + _2695;
    int _2709 = _2707 + 1;
    float _2711 = rsqrt(_2691);
    int _2713 = _2701 >> 31;
    float _2715 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2703);
    float _2717 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2719 = _1944 * _2709;
    int _2721 = _2719 + _2457;
    int _2723 = _2713 & 3;
    float _2725 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2607);
    int _2727 = _2701 & 3;
    bool _2729 = _2727 != 0;
    float _2731 = _2679 * _2677;
    bool _2733 = !_2329;
    int _2735 = _2733 ? _2721 : (-1);
    float _2737 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2697);
    int _2739 = _2701 + _2723;
    float _2741 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2643);
    int _2743 = _2735 >> 31;
    float _2745 = _2679 * _2655;
    int _2747 = _2701 & 3;
    bool _2749 = _2747 != 0;
    float _2751 = _2679 * _2711;
    int _2753 = _2743 & 3;
    float _2755 = _2679 * _2725;
    int _2757 = _2739 >> 2;
    float _2759 = fma(_2717, _2665, _2731);
    int _2761 = _2735 + _2753;
    float _2763 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2765 = _2757 << 4;
    int _2767 = _2765 + 368;
    float _2769 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2627);
    int _2771 = _2761 >> 2;
    float _2773 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2741);
    uint _2775 = uint(int(uint(_2767) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = _2729 ? 0 : 1;
    float _2793 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2763);
    int _2795 = _2771 << 4;
    int _2797 = _2795 + 512;
    float _2799 = -_2737;
    float _2801 = _2751 * _2799;
    bool _2803 = uint(_2747) >= 2u;
    float _2805 = fma(_2717, _2769, _2745);
    bool _2807 = uint(_2747) > 1u;
    uint _2809 = uint(int(uint(_2797) >> uint(2)));
    uint _2811 = uint(int(uint(int(_2809)) >> uint(2)));
    int _2813 = int(_2809) & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = int(_2809) + 1;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    int _2821 = _2817 & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    float _2825 = fma(_2717, _2773, _2755);
    float _2827 = fma(_2711, _2677, _2801);
    int _2829 = _2803 ? 0 : 1;
    float _2831 = _2737 + _2759;
    bool _2833 = _2747 != 3;
    float _2835 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2793);
    int _2837 = ~_2791;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2767 + 8;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    int _2861 = ~_2829;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = _1944 * _2649;
    int _2869 = _2867 + _2333;
    float _2871 = -_2715;
    float _2873 = _2751 * _2871;
    int _2875 = _2841;
    int _2877 = _2865;
    if (!_2807)
    {
        int _2879 = ~_2791;
        int _2881 = _2879 + 1;
        _2875 = _2881;
    }
    int _2883 = _2875;
    out.m_76.x = _2665;
    out.m_76.y = _2769;
    out.m_76.z = _2773;
    bool _2885 = !_2749;
    int _2887 = _2885 ? 0 : 1;
    float _2889 = fma(_2711, _2655, _2873);
    int _2891 = _2735 & 3;
    bool _2893 = _2891 != 0;
    int _2895 = _2797 + 8;
    uint _2897 = uint(int(uint(_2895) >> uint(2)));
    uint _2899 = uint(int(uint(int(_2897)) >> uint(2)));
    int _2901 = int(_2897) & 3;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[int(_2899)][_2901];
    int _2905 = int(_2897) + 1;
    uint _2907 = uint(int(uint(_2905) >> uint(2)));
    int _2909 = _2905 & 3;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[int(_2907)][_2909];
    if (_2833)
    {
        int _2913 = ~_2829;
        int _2915 = _2913 + 1;
        _2877 = _2915;
    }
    int _2917 = _2877;
    bool _2919 = uint(_2891) > 1u;
    int _2921 = _2735 & 3;
    bool _2923 = _2921 != 0;
    float _2925 = _2715 + _2805;
    float _2927 = -_2835;
    float _2929 = _2751 * _2927;
    int _2931 = abs(_2883);
    float _2933 = _2835 + _2825;
    int _2935 = _2923 ? 0 : 1;
    float _2937 = fma(_2711, _2725, _2929);
    bool _2939 = !_2893;
    int _2941 = _2939 ? 0 : 1;
    int _2943 = ~_2935;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    out.m_78.x = _2831;
    out.m_78.y = _2925;
    out.m_78.z = _2933;
    int _2949 = _2947;
    if (!_2919)
    {
        int _2951 = ~_2935;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    bool _2957 = _2891 != 3;
    out.m_80.x = _2827;
    out.m_80.y = _2889;
    out.m_80.z = _2937;
    int _2959 = abs(_2887);
    int _2961 = abs(_2955);
    bool _2963 = uint(_2891) >= 2u;
    int _2965 = ~_2931;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    int _2971 = ~_2961;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = _2963 ? 0 : 1;
    int _2979 = _2969 * as_type<int>(_2789);
    int _2981 = abs(_2941);
    int _2983 = _2975 * as_type<int>(_2823);
    int _2985 = abs(_2917);
    int _2987 = ~_2959;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = ~_2977;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = ~_2985;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    int _3005 = _2991 * as_type<int>(_2781);
    int _3007 = _3005 + _2979;
    int _3009 = _2997;
    if (_2957)
    {
        int _3011 = ~_2977;
        int _3013 = _3011 + 1;
        _3009 = _3013;
    }
    int _3015 = _3009;
    bool _3017 = _2891 != 3;
    int _3019 = _3003 * as_type<int>(_2851);
    int _3021 = _3019 + _3007;
    bool _3023 = _2747 != 3;
    float _3025 = fma(_1806, _2579, _1804);
    int _3027 = abs(_3015);
    bool _3029 = !_3017;
    int _3031 = _3029 ? 0 : (-1);
    bool _3033 = !_2099;
    int _3035 = _3033 ? 0 : 1;
    bool _3037 = !_3023;
    int _3039 = _3037 ? 0 : (-1);
    int _3041 = ~_2981;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    bool _3047 = !_2105;
    int _3049 = _3047 ? 0 : 1;
    int _3051 = abs(_3031);
    int _3053 = _3045 * as_type<int>(_2815);
    int _3055 = _3053 + _2983;
    int _3057 = abs(_3039);
    int _3059 = abs(_3035);
    int _3061 = ~_3027;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = abs(_3049);
    int _3069 = _3065 * as_type<int>(_2903);
    int _3071 = _3069 + _3055;
    int _3073 = ~_3057;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    int _3079 = ~_3051;
    int _3081 = _3079 + 1;
    int _3083 = _3081 + 1;
    int _3085 = ~_3059;
    int _3087 = _3085 + 1;
    int _3089 = _3087 + 1;
    int _3091 = _3077 * as_type<int>(_2859);
    int _3093 = _3091 + _3021;
    int _3095 = _3083 * as_type<int>(_2911);
    int _3097 = _3095 + _3071;
    bool _3099 = !_2209;
    int _3101 = _3099 ? _2663 : (-1);
    int _3103 = _3093 * _3089;
    int _3105 = ~_3067;
    int _3107 = _3105 + 1;
    int _3109 = _3107 + 1;
    float _3111 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1876);
    bool _3113 = !_2329;
    int _3115 = _3113 ? _2869 : (-1);
    int _3117 = _3101 * _3059;
    int _3119 = _3117 + _3103;
    float _3121 = _1737 * 0.5;
    int _3123 = _3097 * _3109;
    bool _3125 = _1477 > 0.0;
    bool _3127 = isnan(_1477);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan(0.0);
    bool _3133 = _3129 || _3131;
    float _3135 = _1775 + _1737;
    float _3137 = fma(_1777, -0.5, _3121);
    int _3139 = _3115 * _3067;
    int _3141 = _3139 + _3123;
    float _3143 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3145 = _3111 + _1737;
    float _3147 = _1806 * _2567;
    float _3149 = _3135 * 0.5;
    out.gl_Position.x = _1775;
    out.gl_Position.y = _1777;
    out.gl_Position.z = _3111;
    out.gl_Position.w = _1737;
    float _3151 = _3145 * 0.5;
    float _3153 = float(_3119);
    float _3155 = _3143 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3157 = float(_3141);
    float _3159 = fma(_1812, _3147, _1800);
    float _3161 = fma(_1814, _3147, _1802);
    float _3163 = _1806 * _1932;
    out.m_82.x = _3149;
    out.m_82.y = _3137;
    out.m_82.z = _3151;
    out.m_82.w = _1737;
    out.m_84.x = _3153;
    out.m_84.y = _3157;
    out.m_45.x = _3155;
    out.m_86.x = _3159;
    out.m_86.y = _3161;
    out.m_86.z = _3025;
    out.m_86.w = _3163;
    if (_3133)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3165;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _327 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_42.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3222 = as_type<float>(_121);
        out.gl_Position.z = _3222;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_47.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_45.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3291 = as_type<float>(_159);
        out.gl_Position.z = _3291;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = in.m_52.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = in.m_42.x;
    float _185 = in.m_42.y;
    float _187 = in.m_42.z;
    float _189 = 0.0;
    float _191 = _163;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_175)
    {
        float _195 = _163 * _163;
        float _197 = _195 * 0.5;
        _189 = _197;
    }
    float _199 = _189;
    float _201 = _199;
    if (!_175)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    int _207 = as_type<int>(_161) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_161) & 2;
    bool _213 = _211 != 0;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_213;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_175;
    float _225 = _205;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _163 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _163);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_175;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _163 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _191 = _279;
        _193 = _269;
    }
    float _281 = _191;
    float _283 = _193;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_281, _181, _291);
    float _299 = fma(_293, _165, _183);
    float _301 = fma(_295, _165, _185);
    float _303 = fma(_297, _165, _187);
    bool _305 = !_285;
    float _307 = _283;
    float _325;
    if (!_305)
    {
        float _309 = in.m_54.x;
        float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _313 = _309 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _317 = _315 * _311;
        float _319 = floor(_317);
        float _321 = -_319;
        float _323 = _317 + _321;
        _325 = _323;
        _327 = true;
    }
    else
    {
        float _329 = float(_105);
        float _331 = 1.0 / _329;
        float _333 = _139 * _331;
        _325 = _333;
    }
    _327 = false;
    float _335 = _325;
    float _337 = in.m_54.x;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _335 + _339;
    float _343 = in.m_54.y;
    float _345 = in.m_54.z;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = _337 * 2.0;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _357 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _359 = isnan(_335);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _343 * 2.0;
    bool _371 = _343 > 0.5;
    float _373 = floor(_351);
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _377 = _345 > 0.5;
    float _379 = -_217;
    int _381 = _371 ? as_type<int>(_379) : as_type<int>(_217);
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _393 = _391 != 0;
    float _395 = -_221;
    int _397 = _377 ? as_type<int>(_395) : as_type<int>(_221);
    float _399 = floor(_369);
    bool _401 = !_389;
    float _403 = _401 ? _217 : as_type<float>(_381);
    bool _405 = !_393;
    float _407 = _405 ? _221 : as_type<float>(_397);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _413;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _431 = _373 > 0.0;
    float _433 = 1.0 / _415;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _437 = _435 != 0;
    float _439 = fma(_429, -2.0, _347);
    bool _441 = _373 >= 0.0;
    bool _443 = isnan(_373);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    int _451 = _449 ? 0 : 1;
    float _453 = 1.0 / _411;
    bool _455 = _399 >= 0.0;
    bool _457 = isnan(_399);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _465;
    int _469 = ~_451;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = _473;
    int _477 = _451;
    if (!_431)
    {
        int _479 = ~_451;
        int _481 = _479 + 1;
        _475 = _481;
    }
    int _483 = _475;
    if (_437)
    {
        _477 = 0;
    }
    int _485 = _477;
    float _487 = 1.0 / _467;
    int _489 = _485;
    if (!_437)
    {
        _489 = 1;
    }
    int _491 = _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _335 + _493;
    int _497 = _463 ? 0 : 1;
    bool _499 = _491 != 1;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _335 + _501;
    bool _505 = _399 > 0.0;
    float _507 = _495 * _453;
    float _509 = _503 * _433;
    float _511 = _345 * 2.0;
    float _513 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _515 = !_423;
    int _517 = _515 ? 0 : 1;
    float _519 = _337 + _343;
    bool _521 = !_419;
    int _523 = _521 ? 0 : 1;
    float _525 = -_349;
    float _527 = fma(_513, 2.0, _525);
    float _529 = floor(_511);
    int _531 = ~_497;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = _341 * _487;
    bool _539 = !_427;
    int _541 = _539 ? 0 : 1;
    float _543 = _337 + _345;
    int _545 = _535;
    int _547 = as_type<int>(_519);
    if (!_505)
    {
        int _549 = ~_497;
        int _551 = _549 + 1;
        _545 = _551;
    }
    int _553 = _545;
    float _555 = _345 + _343;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    float _569 = _519 + (-1.0);
    float _571 = _555;
    if (!_499)
    {
        _307 = _343;
    }
    float _573 = _307;
    float _575 = _543 + (-1.0);
    float _577 = _573;
    if (_437)
    {
        _547 = 0;
    }
    int _579 = _547;
    float _581 = _555 + (-1.0);
    int _583 = _579;
    if (!_437)
    {
        _583 = 2;
    }
    int _585 = _583;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _589 = 0.0;
    float _591 = as_type<float>(_585);
    if (!_499)
    {
        _589 = _573;
    }
    float _593 = _589;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _597 = int(_595);
    bool _599 = _529 >= 0.0;
    bool _601 = isnan(_529);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    float _609 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _611 = 0.0;
    float _613 = _593;
    if (!_499)
    {
        _611 = _345;
    }
    float _615 = _611;
    float _617 = -_139;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[76].x, _527);
    int _621 = _607 ? 0 : 1;
    bool _623 = _529 > 0.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _625;
    float _629 = _615;
    if (!_499)
    {
        _571 = _345;
    }
    float _631 = _571;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = fma(_627, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = _631;
    if (_499)
    {
        _613 = _337;
    }
    float _641 = _613;
    float _643 = fma(_635, _507, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    if (_499)
    {
        _577 = _337;
    }
    float _645 = _577;
    float _647 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_499)
    {
        _629 = _343;
    }
    float _649 = _629;
    float _651 = _641 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_499)
    {
        _639 = _343;
    }
    float _653 = _639;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _353);
    bool _657 = _585 != 2;
    float _659 = -_375;
    float _661 = fma(_651, 2.0, _659);
    int _663 = ~_621;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].w, _355);
    int _671 = _667;
    if (!_623)
    {
        int _673 = ~_621;
        int _675 = _673 + 1;
        _671 = _675;
    }
    int _677 = _671;
    float _679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _681 = log2(_679);
    float _683 = float(_597);
    bool _685 = !_559;
    int _687 = _685 ? 0 : 1;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_657)
    {
        _591 = _337;
    }
    float _697 = _591;
    float _699 = fma(_691, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _701 = _697;
    if (!_657)
    {
        _701 = _345;
    }
    float _703 = _701;
    float _705 = fma(_695, _507, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _707 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _709 = int(_707);
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _713 = _703;
    if (_657)
    {
        _713 = _343;
    }
    float _715 = _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _719 = _715;
    if (!_657)
    {
        _719 = _337;
    }
    float _721 = _719;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _725 = abs(_687);
    float _727 = 1.0 / _683;
    float _729 = -_717;
    float _731 = fma(_711, 2.0, _729);
    float _733 = float(_105);
    float _735 = _721 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _737 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _739 = float(_483);
    float _741 = fma(_735, -2.0, _723);
    float _743 = _681 * _139;
    float _745 = 1.0 / _733;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _749 = float(_677);
    float _751 = float(_725);
    float _753 = fma(_737, -2.0, _747);
    float _755 = _727 * _139;
    float _757 = exp2(_743);
    float _759 = _751 * _749;
    bool _761 = !_563;
    int _763 = _761 ? 0 : 1;
    float _765 = in.m_56.x;
    float _767 = in.m_56.y;
    float _769 = in.m_56.z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _773 = float(_709);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _779 = abs(_763);
    float _781 = 1.0 / _773;
    bool _783 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _785 = isnan(_335);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[88].w, _777);
    float _797 = float(_779);
    float _799 = -_757;
    float _801 = _799 + 1.0;
    bool _803 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _805 = isnan(0.0);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _811 = _807 || _809;
    float _813 = _745 * _139;
    float _815 = _797 * _739;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _819 = 1.0 + _817;
    float _821 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _775);
    bool _823 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _825 = isnan(1.0);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _831 = _827 || _829;
    float _833 = -_793;
    float _835 = _833 + 1.0;
    float _837 = 1.0 / _819;
    float _839 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _439);
    float _841 = _811 ? _801 : 0.0;
    float _843 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _655);
    float _845 = -_139;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[81].x, _661);
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _851 = _367 * _835;
    bool _853 = !_567;
    int _855 = _853 ? 0 : 1;
    float _857 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].z, _771);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _821);
    float _861 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[88].z, _849);
    float _863 = _759 * (-2.0);
    int _865 = abs(_855);
    float _867 = -_139;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[86].x, _731);
    float _871 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _857);
    float _873 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _669);
    float _875 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _753);
    float _877 = _781 * _139;
    float _879 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _861);
    float _881 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _795);
    float _883 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _741);
    float _885 = fma(_609, _863, _609);
    if (_831)
    {
        float _887 = _841 * _837;
        _143 = _887;
    }
    float _889 = _143;
    float _891 = fma(_863, _765, _765);
    float _893 = _337 + (-0.5);
    bool _895 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _897 = isnan(_335);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -_367;
    float _909 = _907 + 1.0;
    float _911 = float(_553);
    float _913 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    float _915 = float(_865);
    float _917 = _905 * _909;
    bool _919 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _921 = isnan(_335);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _815 * (-2.0);
    float _933 = -_905;
    float _935 = _933 + 1.0;
    float _937 = _915 * _911;
    float _939 = fma(_885, _889, _913);
    float _941 = _343 + (-0.5);
    float _943 = fma(_931, _767, _767);
    float _945 = _929 * _935;
    float _947 = fma(_647, _931, _647);
    float _949 = -_929;
    float _951 = _949 + 1.0;
    float _953 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].y, _943);
    float _955 = _699 * _945;
    float _957 = _637 * _945;
    float _959 = _939 * 0.15915493667125701904296875;
    float _961 = fma(_947, _889, _953);
    float _963 = _937 * (-2.0);
    float _965 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].y, _957);
    float _967 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].x, _955);
    float _969 = in.m_52.x;
    float _971 = in.m_52.y;
    float _973 = _961 * 0.15915493667125701904296875;
    float _975 = fma(_963, _769, _769);
    float _977 = _345 + (-0.5);
    float _979 = fma(_587, _963, _587);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _981;
    float _985 = in.m_58.x;
    float _987 = in.m_58.y;
    float _989 = in.m_58.z;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _991;
    float _995 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[196].z, _975);
    float _997 = _959 * 6.283185482025146484375;
    float _999 = sin(_997);
    float _1001 = in.m_60.x;
    float _1003 = in.m_60.y;
    float _1005 = in.m_60.z;
    float _1007 = fma(_705, _917, _967);
    float _1009 = fma(_643, _917, _965);
    float _1011 = fma(_979, _889, _995);
    float _1013 = in.m_62.x;
    float _1015 = in.m_62.y;
    float _1017 = in.m_62.z;
    float _1019 = _959 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _1011 * 0.15915493667125701904296875;
    float _1025 = _973 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = fma(_983, _537, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1031 = fma(_993, _537, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1033 = fma(_1029, _851, _1007);
    float _1035 = fma(_1031, _851, _1009);
    float _1037 = _301 * _987;
    float _1039 = _973 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1033);
    float _1045 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1035);
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1049 = fma(_299, _985, _1037);
    float _1051 = _1043 * _969;
    float _1053 = _1045 * _971;
    float _1055 = _301 * _1003;
    float _1057 = _1023 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _301 * _1015;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = fma(_299, _1001, _1055);
    float _1071 = _1063 * _1047;
    float _1073 = _999 * _1027;
    float _1075 = _1023 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = _1021 * _1041;
    float _1081 = _1067 * _1065;
    float _1083 = _999 * _1041;
    float _1085 = _1021 * _1027;
    float _1087 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1089 = fma(_299, _1013, _1061);
    float _1091 = fma(_303, _1005, _1069);
    float _1093 = _1021 * _1059;
    float _1095 = _1027 * _1059;
    float _1097 = _999 * _1059;
    float _1099 = _1041 * _1059;
    float _1101 = _1093 * _1071;
    float _1103 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1105 = fma(_303, _989, _1049);
    float _1107 = fma(_1077, _1079, _1073);
    float _1109 = -_1071;
    float _1111 = _1077 * _1109;
    float _1113 = -_1083;
    float _1115 = fma(_1077, _1085, _1113);
    float _1117 = -_1085;
    float _1119 = fma(_1077, _1083, _1117);
    float _1121 = fma(_1107, _1081, _1101);
    float _1123 = _1097 * _1071;
    float _1125 = fma(_1099, _1081, _1111);
    float _1127 = fma(_1077, _1073, _1079);
    float _1129 = fma(_1115, _1087, _1121);
    float _1131 = fma(_1119, _1081, _1123);
    float _1133 = fma(_1095, _1087, _1125);
    float _1135 = in.m_54.w;
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1139 = fma(_1127, _1087, _1131);
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1143 = fma(_303, _1017, _1089);
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1137);
    float _1147 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1149 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1153 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1145);
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1157 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1149);
    float _1159 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1163 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1165 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1167 = _1151 + _1161;
    float _1169 = _1103 + _1163;
    float _1171 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1175 = _1167 + _1173;
    float _1177 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1165);
    float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1181 = _1169 + _1179;
    float _1183 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1171);
    float _1185 = _1175 * _1175;
    bool _1187 = _1135 > 0.5;
    float _1189 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1183);
    float _1193 = fma(_1181, _1181, _1185);
    float _1195 = -_221;
    int _1197 = _1187 ? as_type<int>(_1195) : as_type<int>(_221);
    float _1199 = _1147 + _1189;
    float _1201 = sqrt(_1193);
    bool _1203 = !_385;
    float _1205 = _1203 ? _221 : as_type<float>(_1197);
    float _1207 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1155);
    float _1209 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1213 = _1211 != 0;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1217 = _1215 != 0;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1225 = _1223 != 0;
    float _1227 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1207);
    float _1229 = 1.0 / _1209;
    bool _1231 = !_1217;
    int _1233 = _1231 ? 0 : 1;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1237 = !_1213;
    int _1239 = _1237 ? 0 : 1;
    bool _1241 = !_1221;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = _1235 + _1209;
    bool _1247 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1249 = isnan(0.5);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1255 = _1251 || _1253;
    bool _1257 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    bool _1269 = !_1225;
    int _1271 = _1269 ? 0 : 1;
    float _1273 = _1245 * _1229;
    float _1275 = _1273 * 0.5;
    float _1277 = _1245;
    float _1279 = _1191;
    float _1281 = _1189;
    float _1283 = _1169;
    float _1285 = _983;
    float _1287 = _1181;
    if (!_1257)
    {
        _1277 = _1169;
    }
    float _1289 = _1277;
    float _1291 = _1289;
    if (!_1257)
    {
        _1279 = _1167;
    }
    float _1293 = _1279;
    float _1295 = _1293;
    if (!_1257)
    {
        _1281 = _1199;
    }
    float _1297 = _1281;
    bool _1299 = !_1257;
    float _1301 = _1297;
    if (!_1299)
    {
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1307 = _1201 + _1305;
        float _1309 = rsqrt(_1193);
        float _1311 = _1307 * _1303;
        float _1313 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = _1311 * 0.15915493667125701904296875;
        float _1317 = _1315 * 6.283185482025146484375;
        float _1319 = cos(_1317);
        float _1321 = _1315 * 6.283185482025146484375;
        float _1323 = sin(_1321);
        float _1325 = _1319 + (-1.0);
        float _1327 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = fma(_1323, _1313, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1331 = fma(_1199, _1319, _1327);
        float _1333 = _1309 * _1329;
        float _1335 = fma(_1181, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1337 = fma(_1175, _1333, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1291 = _1335;
        _1301 = _1331;
        _1295 = _1337;
        _1283 = _1309;
    }
    float _1339 = _1291;
    float _1341 = _1301;
    float _1343 = _1295;
    float _1345 = _1283;
    float _1347 = _1341;
    float _1349 = _1339;
    float _1351 = _1343;
    float _1353 = _1345;
    if (_1267)
    {
        _1285 = 1.0;
    }
    float _1355 = _1285;
    float _1357 = _1355;
    if (!_1255)
    {
        float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1361 = _1147 + _1359;
        float _1363 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1365 = _1103 + _1363;
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1369 = -_1103;
        float _1371 = _1369 + _1339;
        float _1373 = _1361 * _1361;
        float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1377 = _1151 + _1375;
        float _1379 = -_1147;
        float _1381 = _1379 + _1341;
        float _1383 = -_1151;
        float _1385 = _1383 + _1343;
        float _1387 = fma(_1365, _1365, _1373);
        float _1389 = fma(_1377, _1377, _1387);
        float _1391 = sqrt(_1389);
        float _1393 = precise::min(_1391, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1395 = _1393 * _1367;
        float _1397 = fma(_1371, _1395, _1103);
        float _1399 = fma(_1381, _1395, _1147);
        float _1401 = fma(_1385, _1395, _1151);
        _1347 = _1399;
        _1349 = _1397;
        _1351 = _1401;
        _1353 = _1395;
    }
    float _1403 = _1347;
    float _1405 = _1349;
    float _1407 = _1351;
    float _1409 = _1353;
    float _1411 = _1409;
    if (!_1267)
    {
        float _1413 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1421 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1419);
        float _1423 = _1415 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1417 * 0.15915493667125701904296875;
        float _1429 = _1415 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = 1.0 / _1425;
        float _1435 = _1427 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1431 * _1433;
        float _1441 = _1427 * 6.283185482025146484375;
        float _1443 = sin(_1441);
        float _1445 = _1437 * _1439;
        float _1447 = 1.0 / _1421;
        float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1451 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1449;
        float _1453 = 1.0 / _1445;
        float _1455 = 1.0 / _1451;
        float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1459 = _1447 * _1457;
        float _1461 = _1443 * _1453;
        float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1465 = fma(_1461, _1459, _1463);
        float _1467 = _1465 * _1455;
        float _1469 = precise::clamp(_1467, 0.0, 1.0);
        float _1471 = -_1469;
        float _1473 = _1471 + 1.0;
        _1411 = _1427;
        _1357 = _1473;
    }
    float _1475 = _1411;
    float _1477 = _1357;
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1481 = _1403 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1485 = _1405 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1407 + _1487;
    float _1491 = _1481 * _1481;
    float _1493 = fma(_1485, _1485, _1491);
    float _1495 = fma(_1489, _1489, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1485 * _1501;
    float _1505 = _1489 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1493;
    float _1523 = _1497;
    float _1525 = _1519;
    float _1527 = _1475;
    float _1529 = _1481;
    if (_1515)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (_1515)
    {
        float _1535 = rsqrt(_1511);
        _1523 = _1535;
    }
    float _1537 = _1523;
    float _1539 = _1537;
    if (_1515)
    {
        float _1541 = _1519 * _1533;
        _1525 = _1541;
    }
    float _1543 = _1525;
    if (_1515)
    {
        float _1545 = _1543 * 0.15915493667125701904296875;
        _1527 = _1545;
    }
    float _1547 = _1527;
    float _1549 = _1489;
    float _1551 = _1547;
    if (_1515)
    {
        float _1553 = _1547 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1549 = _1555;
    }
    float _1557 = _1549;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1561 = precise::max(0.0, _1559);
    float _1563 = _1533;
    float _1565 = _1561;
    if (_1515)
    {
        float _1567 = _1547 * 6.283185482025146484375;
        float _1569 = cos(_1567);
        _1563 = _1569;
    }
    float _1571 = _1563;
    float _1573 = -_1501;
    float _1575 = -_1561;
    float _1577 = fma(_1481, _1573, _1575);
    if (_1515)
    {
        float _1579 = _1577 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1579;
    }
    float _1581 = _1529;
    float _1583 = _1581;
    float _1585 = _1557;
    if (_1515)
    {
        float _1587 = fma(_1557, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1589;
    if (!_1515)
    {
        _1585 = _1507;
    }
    float _1593 = _1585;
    float _1595 = _1593;
    float _1597 = _1571;
    if (_1515)
    {
        float _1599 = _1571 + (-1.0);
        _1565 = _1599;
    }
    float _1601 = _1565;
    float _1603 = _1601;
    if (_1515)
    {
        float _1605 = _1537 * _1589;
        _1287 = _1605;
    }
    float _1607 = _1287;
    if (!_1515)
    {
        _1539 = _1503;
    }
    float _1609 = _1539;
    float _1611 = _1609;
    if (_1515)
    {
        float _1613 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1613;
    }
    float _1615 = _1551;
    if (_1515)
    {
        float _1617 = _1503 * _1607;
        _1611 = _1617;
    }
    float _1619 = _1611;
    if (!_1515)
    {
        _1591 = _1577;
    }
    float _1621 = _1591;
    float _1623 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1625 = _1621;
    if (!_1515)
    {
        _1603 = _1505;
    }
    float _1627 = _1603;
    float _1629 = _1627;
    if (_1515)
    {
        float _1631 = fma(_1577, _1571, _1615);
        _1625 = _1631;
    }
    float _1633 = _1625;
    if (_1515)
    {
        float _1635 = _1505 * _1607;
        _1629 = _1635;
    }
    float _1637 = _1629;
    if (_1515)
    {
        float _1639 = _1619 * _1619;
        _1595 = _1639;
    }
    float _1641 = _1595;
    if (!_1515)
    {
        _1597 = _1509;
    }
    float _1643 = _1597;
    float _1645 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1623);
    float _1647 = _1643;
    if (_1515)
    {
        float _1649 = _1637 * _1637;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = fma(_1633, _1633, _1641);
    float _1655 = _1653 + _1651;
    float _1657 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1667 = rsqrt(_1655);
    float _1669 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1645);
    float _1671 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1673 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1657);
    float _1675 = -_1663;
    float _1677 = _1675 + 1.0;
    float _1679 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1681 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1671);
    float _1683 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1673);
    float _1685 = abs(_1677);
    float _1687 = log2(_1685);
    float _1689 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1691 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1681);
    float _1693 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1695 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = -_1689;
    float _1699 = fma(_1697, _1665, 1.0);
    float _1701 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1705 = _1667 * _1619;
    float _1707 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1709 = _1667 * _1637;
    float _1711 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1703);
    float _1713 = _1667 * _1633;
    float _1715 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1717 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1707);
    float _1719 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1723 = -_1715;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1723);
    float _1727 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1729 = log2(_1699);
    float _1731 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = -_1709;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1725);
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1739 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = exp2(_1721);
    float _1747 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1739);
    float _1749 = _1713 + 1.0;
    float _1751 = fma(_1743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1753 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1755 = fma(_1743, _1751, -0.212114393711090087890625);
    float _1757 = 1.0 / _1737;
    float _1759 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1761 = _1729 * 0.693147182464599609375;
    float _1763 = fma(_1743, _1755, 1.570728778839111328125);
    float _1765 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1759);
    float _1767 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1769 = sqrt(_1741);
    float _1771 = -_1713;
    float _1773 = fma(_1745, _1749, _1771);
    float _1775 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1753);
    float _1777 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1779 = fma(_1773, 0.5, 0.5);
    float _1781 = _1775 * _1757;
    float _1783 = _1777 * _1757;
    float _1785 = fma(_1781, 0.5, 0.5);
    float _1787 = fma(_1783, -0.5, 0.5);
    float _1789 = _1769 * 0.636619746685028076171875;
    float _1791 = -_1763;
    float _1793 = fma(_1789, _1791, 1.0);
    float3 _5835 = float3(_1785, _1787, _1767);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5835, float3(0.0), isnan(_5835)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5835, float3(0.0), isnan(_5835)), level(0.0)).x;
    float3 _5846 = float3(_1785, _1787, _1767);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5846, float3(0.0), isnan(_5846)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5846, float3(0.0), isnan(_5846)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5863 = float2(_1793, _1779);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5863, float2(0.0), isnan(_5863)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5863, float2(0.0), isnan(_5863)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = -_881;
    float _1828 = _1826 + 1.0;
    bool _1830 = _343 > 0.5;
    float _1832 = -_873;
    float _1834 = _1832 + 1.0;
    float _1836 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1840 = _1838 != 0;
    float _1842 = trunc(_755);
    int _1844 = int(_1842);
    float _1846 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1848 = _217 + 0.5;
    int _1850 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1852 = _1850 != 0;
    float _1854 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1856 = -_221;
    int _1858 = _1830 ? as_type<int>(_1856) : as_type<int>(_221);
    float _1860 = _1846 * _337;
    float _1862 = 0.0;
    if (_1824)
    {
        _1862 = _337;
    }
    float _1864 = _1862;
    float _1866 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1836);
    float _1868 = float(uint(_1820));
    float _1870 = exp2(_1854);
    int _1872 = ~_1820;
    int _1874 = _1872 + 1;
    float _1876 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1866);
    float _1878 = _1864;
    if (!_1824)
    {
        _1878 = _343;
    }
    float _1880 = _1878;
    out.m_64.x = _1405;
    out.m_64.y = _1403;
    out.m_64.z = _1407;
    float _1882 = float(uint(_1844));
    float _1884 = 1.0 / _1868;
    float _1886 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1888 = ~_1820;
    int _1890 = _1888 + 1;
    bool _1892 = !_1852;
    float _1894 = _1892 ? _221 : as_type<float>(_1858);
    float _1896 = _1886 * _337;
    float _1898 = trunc(_1860);
    int _1900 = int(_1898);
    bool _1902 = _337 > 0.5;
    float _1904 = -_1870;
    float _1906 = _1904 + 1.0;
    int _1908 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1910 = _1908 != 0;
    float _1912 = 0.0;
    float _1914 = as_type<float>(_1890);
    if (_1824)
    {
        _1912 = 1.0;
    }
    float _1916 = _1912;
    float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1920 = _1916;
    if (!_1824)
    {
        _1920 = 7.345489978790283203125;
    }
    float _1922 = _1920;
    float _1924 = trunc(_1896);
    int _1926 = int(_1924);
    int _1928 = as_type<int>(_1884) + (-2);
    float _1930 = -_1918;
    float _1932 = _1930 + 1.0;
    int _1934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1936 = _1934 != 0;
    float _1938 = as_type<float>(_1928) * _1882;
    int _1940 = abs(_517);
    float _1942 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1944 = int(_1942);
    int _1946 = _1900 << 4;
    int _1948 = _1946 + 1712;
    int _1950 = abs(_523);
    int _1952 = abs(_541);
    int _1954 = abs(_1239);
    float _1956 = trunc(_1938);
    float _1958 = precise::max(_1956, 0.0);
    uint _1961 = uint(_1958);
    int _1963 = _1926 << 4;
    int _1965 = _1963 + 1968;
    int _1967 = abs(_1243);
    bool _1969 = _345 > 0.5;
    float _1971 = float(uint(_1944));
    float _1973 = -_221;
    float _1975 = _1973 + 0.5;
    int _1977 = ~_1820;
    int _1979 = _1977 + 1;
    float _1981 = 1.0 / _1971;
    int _1983 = _1874 * int(_1961);
    int _1985 = _1983 + _1844;
    out.m_66.x = _1848;
    out.m_66.y = _1975;
    float _1987 = float(uint(_1985));
    float _1989 = as_type<float>(_1928) * _1987;
    int _1991 = _1965 + 8;
    uint _1993 = uint(int(uint(_1991) >> uint(2)));
    uint _1995 = uint(int(uint(int(_1993)) >> uint(2)));
    int _1997 = int(_1993) & 3;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[int(_1995)][_1997];
    float _2001 = trunc(_1989);
    float _2003 = precise::max(_2001, 0.0);
    uint _2005 = uint(_2003);
    int _2007 = as_type<int>(_1981) + (-2);
    uint _2009 = uint(int(uint(_1948) >> uint(2)));
    uint _2011 = uint(int(uint(int(_2009)) >> uint(2)));
    int _2013 = int(_2009) & 3;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[int(_2011)][_2013];
    int _2017 = int(_2009) + 1;
    uint _2019 = uint(int(uint(_2017) >> uint(2)));
    int _2021 = _2017 & 3;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[int(_2019)][_2021];
    uint _2025 = uint(int(uint(_1965) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[int(_2035)][_2037];
    int _2041 = int(_1961) + int(_2005);
    float _2043 = trunc(_877);
    int _2045 = int(_2043);
    int _2047 = _1948 + 8;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    uint _2051 = uint(int(uint(int(_2049)) >> uint(2)));
    int _2053 = int(_2049) & 3;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[int(_2051)][_2053];
    int _2057 = _1890 * _2041;
    int _2059 = _2057 + _1844;
    if (_1824)
    {
        _1914 = 1.0;
    }
    float _2061 = _1914;
    float _2063 = _2061;
    if (!_1824)
    {
        _2063 = 1.2345600128173828125;
    }
    float _2065 = _2063;
    float _2067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2069 = uint(_2059) >= uint(_1820);
    float _2071 = -_217;
    int _2073 = _1902 ? as_type<int>(_2071) : as_type<int>(_217);
    float _2075 = _1922 * _337;
    bool _2077 = !_2069;
    int _2079 = _2077 ? 0 : (-1);
    float _2081 = _2065 * _1880;
    bool _2083 = !_1910;
    float _2085 = _2083 ? _217 : as_type<float>(_2073);
    float _2087 = floor(_2075);
    float _2089 = float(uint(_2045));
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2093 = _2091 != 0;
    float _2095 = _2085 + 0.5;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2099 = _2097 != 0;
    float _2101 = as_type<float>(_2007) * _2089;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2105 = _2103 != 0;
    float _2107 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[80].x, _619);
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2111 = _2109 != 0;
    float _2113 = _1894 + (-0.5);
    int _2115 = ~_1944;
    int _2117 = _2115 + 1;
    float _2119 = trunc(_2101);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = float(_1820);
    float _2127 = -_2113;
    float _2129 = -_839;
    float _2131 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2129);
    float _2133 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2135 = floor(_2081);
    float _2137 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2139 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2141 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2143 = _2117 * int(_2123);
    int _2145 = _2143 + _2045;
    float _2147 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2153 = float(_1844);
    float _2155 = float(uint(_2145));
    float _2157 = _2031 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2159 = _2153 >= _2125;
    bool _2161 = isnan(_2153);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan(_2125);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2173 = -_2135;
    float _2175 = _2081 + _2173;
    float _2177 = as_type<float>(_2007) * _2155;
    float _2179 = _1999 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2181 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2183 = -_2087;
    float _2185 = _2075 + _2183;
    int _2187 = ~_2041;
    int _2189 = _2187 + _2079;
    int _2191 = _2189 + 1;
    float _2193 = trunc(_2169);
    int _2195 = int(_2193);
    float _2197 = _2171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2199 = _2185 * _2125;
    float _2201 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2203 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2205 = !_2093;
    int _2207 = _2205 ? 0 : 1;
    out.m_68.x = _2139;
    out.m_68.y = _2141;
    out.m_68.z = _2197;
    out.m_68.w = _2149;
    bool _2209 = _1820 == 0;
    float _2211 = trunc(_2177);
    float _2213 = precise::max(_2211, 0.0);
    uint _2215 = uint(_2213);
    float _2217 = float(_1944);
    out.m_70.x = _2201;
    out.m_70.y = _2181;
    out.m_70.z = _2203;
    out.m_70.w = _2151;
    int _2219 = ~_1944;
    int _2221 = _2219 + 1;
    float _2223 = _2175 * _2217;
    float _2225 = trunc(_2199);
    int _2227 = int(_2225);
    int _2229 = _1820 * _2191;
    int _2231 = _2229 + _1844;
    float _2233 = _2125 * _813;
    int _2235 = abs(_2207);
    float _2237 = _2217 * _813;
    int _2239 = int(_2123) + int(_2215);
    float _2241 = float(_2045);
    float _2243 = trunc(_2233);
    int _2245 = int(_2243);
    int _2247 = ~_2195;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    bool _2253 = !_2209;
    int _2255 = _2253 ? _2231 : (-1);
    bool _2257 = _2241 >= _2217;
    bool _2259 = isnan(_2241);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(_2217);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2265);
    int _2269 = _2227 * _2235;
    int _2271 = _2269 + _1844;
    bool _2273 = !_2111;
    int _2275 = _2273 ? 0 : 1;
    int _2277 = _2221 * _2239;
    int _2279 = _2277 + _2045;
    float _2281 = trunc(_2237);
    int _2283 = int(_2281);
    int _2285 = _2255 * _2251;
    int _2287 = _1820 + (-1);
    bool _2289 = uint(_2279) >= uint(_1944);
    int _2291 = _2195 * _2287;
    int _2293 = _2291 + _2285;
    float _2295 = trunc(_2223);
    int _2297 = int(_2295);
    int _2299 = abs(_2275);
    int _2301 = _2293 * _1940;
    bool _2303 = !_2289;
    int _2305 = _2303 ? 0 : (-1);
    float _2307 = trunc(_2267);
    int _2309 = int(_2307);
    int _2311 = ~_2239;
    int _2313 = _2311 + _2305;
    int _2315 = _2313 + 1;
    int _2317 = _2245 * _1950;
    int _2319 = _2317 + _2301;
    float _2321 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2323 = float(uint(_2271));
    int _2325 = _1944 * _2315;
    int _2327 = _2325 + _2045;
    bool _2329 = _1944 == 0;
    int _2331 = _2297 * _2299;
    int _2333 = _2331 + _2045;
    int _2335 = _2271 * _1952;
    int _2337 = _2335 + _2319;
    float _2339 = as_type<float>(_1928) * _2323;
    bool _2341 = !_1840;
    int _2343 = _2341 ? 0 : 1;
    float _2345 = float(uint(_2333));
    int _2347 = abs(_2343);
    float _2349 = _403 + 0.5;
    int _2351 = ~_2309;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    float _2357 = as_type<float>(_2007) * _2345;
    bool _2359 = !_2329;
    int _2361 = _2359 ? _2327 : (-1);
    float _2363 = trunc(_2339);
    float _2365 = precise::max(_2363, 0.0);
    uint _2367 = uint(_2365);
    float _2369 = fma(_2321, _2349, _869);
    int _2371 = _1944 + (-1);
    int _2373 = _2227 * _2347;
    int _2375 = _2373 + _2337;
    int _2377 = abs(_1233);
    int _2379 = _2361 * _2355;
    int _2381 = ~_1944;
    int _2383 = _2381 + 1;
    float _2385 = trunc(_2357);
    float _2387 = precise::max(_2385, 0.0);
    uint _2389 = uint(_2387);
    int _2391 = _2309 * _2371;
    int _2393 = _2391 + _2379;
    int _2395 = ~_1820;
    int _2397 = _2395 + 1;
    float _2399 = float(uint(_2375));
    int _2401 = _2393 * _2377;
    int _2403 = _2397 * int(_2367);
    int _2405 = _2403 + _2271;
    float _2407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2409 = _2283 * _1954;
    int _2411 = _2409 + _2401;
    float _2413 = as_type<float>(_1928) * _2399;
    float _2415 = -_217;
    int _2417 = _1969 ? as_type<int>(_2415) : as_type<int>(_217);
    float _2419 = float(uint(_2405));
    int _2421 = _2383 * int(_2389);
    int _2423 = _2421 + _2333;
    int _2425 = abs(_1271);
    float _2427 = trunc(_2413);
    float _2429 = precise::max(_2427, 0.0);
    uint _2431 = uint(_2429);
    float _2433 = as_type<float>(_1928) * _2419;
    bool _2435 = !_1936;
    float _2437 = _2435 ? _217 : as_type<float>(_2417);
    float _2439 = float(uint(_2423));
    int _2441 = _2333 * _1967;
    int _2443 = _2441 + _2411;
    float _2445 = _1205 + (-0.5);
    float _2447 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2449 = trunc(_2433);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    int _2455 = _2297 * _2425;
    int _2457 = _2455 + _2443;
    float _2459 = _407 + (-0.5);
    float _2461 = -_2445;
    float _2463 = -_875;
    float _2465 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2463);
    float _2467 = _2437 + 0.5;
    float _2469 = as_type<float>(_2007) * _2439;
    float _2471 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[85].x, _847);
    float _2473 = float(uint(_2457));
    float _2475 = -_879;
    float _2477 = _2475 + 1.0;
    int _2479 = _1979 * int(_2431);
    int _2481 = _2479 + _2375;
    float _2483 = trunc(_2469);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = as_type<float>(_2007) * _2473;
    float _2491 = -_2447;
    float _2493 = -_883;
    float _2495 = fma(_2491, _2459, _2493);
    int _2497 = int(_2367) + int(_2453);
    float _2499 = -_2477;
    float _2501 = fma(_403, _2499, _2369);
    int _2503 = ~_1944;
    int _2505 = _2503 + 1;
    float _2507 = fma(_407, _1828, _2495);
    float _2509 = trunc(_2489);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    float _2515 = float(uint(_2481));
    float _2517 = -_871;
    float _2519 = _2517 + 1.0;
    float _2521 = -_843;
    float _2523 = _2521 + 1.0;
    float _2525 = -_859;
    float _2527 = _2525 + 1.0;
    float _2529 = as_type<float>(_1928) * _2515;
    float _2531 = -_2519;
    float _2533 = fma(_2085, _2531, _2107);
    float _2535 = -_2523;
    float _2537 = fma(_2437, _2535, _2471);
    int _2539 = ~_1820;
    int _2541 = _2539 + 1;
    float _2543 = fma(_1205, _1834, _2465);
    int _2545 = int(_2389) + int(_2487);
    float _2547 = trunc(_2529);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    int _2553 = ~_1944;
    int _2555 = _2553 + 1;
    int _2557 = _2541 * _2497;
    int _2559 = _2557 + _2271;
    float _2561 = fma(_1894, _2527, _2131);
    int _2563 = _2505 * int(_2513);
    int _2565 = _2563 + _2457;
    out.m_72.x = _2501;
    out.m_72.y = _2507;
    float _2567 = _1918 * _1795;
    bool _2569 = uint(_2559) >= uint(_1820);
    int _2571 = _2555 * _2545;
    int _2573 = _2571 + _2333;
    float _2575 = float(uint(_2565));
    float _2577 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_74.x = _2533;
    out.m_74.y = _2561;
    out.m_74.z = _2537;
    out.m_74.w = _2543;
    float _2579 = _1816 * _2567;
    bool _2581 = uint(_2573) >= uint(_1944);
    float _2583 = as_type<float>(_2007) * _2575;
    float _2585 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2587 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2589 = -_1077;
    float _2591 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2577);
    int _2593 = int(_2431) + int(_2551);
    float _2595 = -_1077;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2585);
    float _2599 = trunc(_2583);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    float _2605 = -_1077;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2587);
    int _2609 = ~_1820;
    int _2611 = _2609 + 1;
    float _2613 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2615 = ~_1944;
    int _2617 = _2615 + 1;
    bool _2619 = !_2569;
    int _2621 = _2619 ? 0 : (-1);
    int _2623 = _2611 * _2593;
    int _2625 = _2623 + _2375;
    float _2627 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2613);
    bool _2629 = !_2581;
    int _2631 = _2629 ? 0 : (-1);
    int _2633 = ~_2497;
    int _2635 = _2633 + _2621;
    int _2637 = _2635 + 1;
    float _2639 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2641 = uint(_2625) >= uint(_1820);
    float _2643 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2645 = ~_2545;
    int _2647 = _2645 + _2631;
    int _2649 = _2647 + 1;
    float _2651 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2639);
    int _2653 = int(_2513) + int(_2603);
    float _2655 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2591);
    bool _2657 = !_2641;
    int _2659 = _2657 ? 0 : (-1);
    int _2661 = _1820 * _2637;
    int _2663 = _2661 + _2271;
    float _2665 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2651);
    int _2667 = _2617 * _2653;
    int _2669 = _2667 + _2457;
    int _2671 = ~_2593;
    int _2673 = _2671 + _2659;
    int _2675 = _2673 + 1;
    float _2677 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2597);
    float _2679 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2681 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2683 = uint(_2669) >= uint(_1944);
    int _2685 = _1820 * _2675;
    int _2687 = _2685 + _2375;
    float _2689 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2691 = fma(_2679, _2679, 1.0);
    bool _2693 = !_2683;
    int _2695 = _2693 ? 0 : (-1);
    float _2697 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2681);
    bool _2699 = !_2209;
    int _2701 = _2699 ? _2687 : (-1);
    float _2703 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2689);
    int _2705 = ~_2653;
    int _2707 = _2705 + _2695;
    int _2709 = _2707 + 1;
    float _2711 = rsqrt(_2691);
    int _2713 = _2701 >> 31;
    float _2715 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2703);
    float _2717 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2719 = _1944 * _2709;
    int _2721 = _2719 + _2457;
    int _2723 = _2713 & 3;
    float _2725 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2607);
    int _2727 = _2701 & 3;
    bool _2729 = _2727 != 0;
    float _2731 = _2679 * _2677;
    bool _2733 = !_2329;
    int _2735 = _2733 ? _2721 : (-1);
    float _2737 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2697);
    int _2739 = _2701 + _2723;
    float _2741 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2643);
    int _2743 = _2735 >> 31;
    float _2745 = _2679 * _2655;
    int _2747 = _2701 & 3;
    bool _2749 = _2747 != 0;
    float _2751 = _2679 * _2711;
    int _2753 = _2743 & 3;
    float _2755 = _2679 * _2725;
    int _2757 = _2739 >> 2;
    float _2759 = fma(_2717, _2665, _2731);
    int _2761 = _2735 + _2753;
    float _2763 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2765 = _2757 << 4;
    int _2767 = _2765 + 368;
    float _2769 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2627);
    int _2771 = _2761 >> 2;
    float _2773 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2741);
    uint _2775 = uint(int(uint(_2767) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = _2729 ? 0 : 1;
    float _2793 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2763);
    int _2795 = _2771 << 4;
    int _2797 = _2795 + 512;
    float _2799 = -_2737;
    float _2801 = _2751 * _2799;
    bool _2803 = uint(_2747) >= 2u;
    float _2805 = fma(_2717, _2769, _2745);
    bool _2807 = uint(_2747) > 1u;
    uint _2809 = uint(int(uint(_2797) >> uint(2)));
    uint _2811 = uint(int(uint(int(_2809)) >> uint(2)));
    int _2813 = int(_2809) & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = int(_2809) + 1;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    int _2821 = _2817 & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    float _2825 = fma(_2717, _2773, _2755);
    float _2827 = fma(_2711, _2677, _2801);
    int _2829 = _2803 ? 0 : 1;
    float _2831 = _2737 + _2759;
    bool _2833 = _2747 != 3;
    float _2835 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2793);
    int _2837 = ~_2791;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2767 + 8;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    int _2861 = ~_2829;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = _1944 * _2649;
    int _2869 = _2867 + _2333;
    float _2871 = -_2715;
    float _2873 = _2751 * _2871;
    int _2875 = _2841;
    int _2877 = _2865;
    if (!_2807)
    {
        int _2879 = ~_2791;
        int _2881 = _2879 + 1;
        _2875 = _2881;
    }
    int _2883 = _2875;
    out.m_76.x = _2665;
    out.m_76.y = _2769;
    out.m_76.z = _2773;
    bool _2885 = !_2749;
    int _2887 = _2885 ? 0 : 1;
    float _2889 = fma(_2711, _2655, _2873);
    int _2891 = _2735 & 3;
    bool _2893 = _2891 != 0;
    int _2895 = _2797 + 8;
    uint _2897 = uint(int(uint(_2895) >> uint(2)));
    uint _2899 = uint(int(uint(int(_2897)) >> uint(2)));
    int _2901 = int(_2897) & 3;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[int(_2899)][_2901];
    int _2905 = int(_2897) + 1;
    uint _2907 = uint(int(uint(_2905) >> uint(2)));
    int _2909 = _2905 & 3;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[int(_2907)][_2909];
    if (_2833)
    {
        int _2913 = ~_2829;
        int _2915 = _2913 + 1;
        _2877 = _2915;
    }
    int _2917 = _2877;
    bool _2919 = uint(_2891) > 1u;
    int _2921 = _2735 & 3;
    bool _2923 = _2921 != 0;
    float _2925 = _2715 + _2805;
    float _2927 = -_2835;
    float _2929 = _2751 * _2927;
    int _2931 = abs(_2883);
    float _2933 = _2835 + _2825;
    int _2935 = _2923 ? 0 : 1;
    float _2937 = fma(_2711, _2725, _2929);
    bool _2939 = !_2893;
    int _2941 = _2939 ? 0 : 1;
    int _2943 = ~_2935;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    out.m_78.x = _2831;
    out.m_78.y = _2925;
    out.m_78.z = _2933;
    int _2949 = _2947;
    if (!_2919)
    {
        int _2951 = ~_2935;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    bool _2957 = _2891 != 3;
    out.m_80.x = _2827;
    out.m_80.y = _2889;
    out.m_80.z = _2937;
    int _2959 = abs(_2887);
    int _2961 = abs(_2955);
    bool _2963 = uint(_2891) >= 2u;
    int _2965 = ~_2931;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    int _2971 = ~_2961;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = _2963 ? 0 : 1;
    int _2979 = _2969 * as_type<int>(_2789);
    int _2981 = abs(_2941);
    int _2983 = _2975 * as_type<int>(_2823);
    int _2985 = abs(_2917);
    int _2987 = ~_2959;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = ~_2977;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = ~_2985;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    int _3005 = _2991 * as_type<int>(_2781);
    int _3007 = _3005 + _2979;
    int _3009 = _2997;
    if (_2957)
    {
        int _3011 = ~_2977;
        int _3013 = _3011 + 1;
        _3009 = _3013;
    }
    int _3015 = _3009;
    bool _3017 = _2891 != 3;
    int _3019 = _3003 * as_type<int>(_2851);
    int _3021 = _3019 + _3007;
    bool _3023 = _2747 != 3;
    float _3025 = fma(_1806, _2579, _1804);
    int _3027 = abs(_3015);
    bool _3029 = !_3017;
    int _3031 = _3029 ? 0 : (-1);
    bool _3033 = !_2099;
    int _3035 = _3033 ? 0 : 1;
    bool _3037 = !_3023;
    int _3039 = _3037 ? 0 : (-1);
    int _3041 = ~_2981;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    bool _3047 = !_2105;
    int _3049 = _3047 ? 0 : 1;
    int _3051 = abs(_3031);
    int _3053 = _3045 * as_type<int>(_2815);
    int _3055 = _3053 + _2983;
    int _3057 = abs(_3039);
    int _3059 = abs(_3035);
    int _3061 = ~_3027;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = abs(_3049);
    int _3069 = _3065 * as_type<int>(_2903);
    int _3071 = _3069 + _3055;
    int _3073 = ~_3057;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    int _3079 = ~_3051;
    int _3081 = _3079 + 1;
    int _3083 = _3081 + 1;
    int _3085 = ~_3059;
    int _3087 = _3085 + 1;
    int _3089 = _3087 + 1;
    int _3091 = _3077 * as_type<int>(_2859);
    int _3093 = _3091 + _3021;
    int _3095 = _3083 * as_type<int>(_2911);
    int _3097 = _3095 + _3071;
    bool _3099 = !_2209;
    int _3101 = _3099 ? _2663 : (-1);
    int _3103 = _3093 * _3089;
    int _3105 = ~_3067;
    int _3107 = _3105 + 1;
    int _3109 = _3107 + 1;
    float _3111 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1876);
    bool _3113 = !_2329;
    int _3115 = _3113 ? _2869 : (-1);
    int _3117 = _3101 * _3059;
    int _3119 = _3117 + _3103;
    float _3121 = _1737 * 0.5;
    int _3123 = _3097 * _3109;
    bool _3125 = _1477 > 0.0;
    bool _3127 = isnan(_1477);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan(0.0);
    bool _3133 = _3129 || _3131;
    float _3135 = _1775 + _1737;
    float _3137 = fma(_1777, -0.5, _3121);
    int _3139 = _3115 * _3067;
    int _3141 = _3139 + _3123;
    float _3143 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3145 = _3111 + _1737;
    float _3147 = _1806 * _2567;
    float _3149 = _3135 * 0.5;
    out.gl_Position.x = _1775;
    out.gl_Position.y = _1777;
    out.gl_Position.z = _3111;
    out.gl_Position.w = _1737;
    float _3151 = _3145 * 0.5;
    float _3153 = float(_3119);
    float _3155 = _3143 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3157 = float(_3141);
    float _3159 = fma(_1812, _3147, _1800);
    float _3161 = fma(_1814, _3147, _1802);
    float _3163 = _1806 * _1932;
    out.m_82.x = _3149;
    out.m_82.y = _3137;
    out.m_82.z = _3151;
    out.m_82.w = _1737;
    out.m_84.x = _3153;
    out.m_84.y = _3157;
    out.m_45.x = _3155;
    out.m_86.x = _3159;
    out.m_86.y = _3161;
    out.m_86.z = _3025;
    out.m_86.w = _3163;
    if (_3133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3165;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

