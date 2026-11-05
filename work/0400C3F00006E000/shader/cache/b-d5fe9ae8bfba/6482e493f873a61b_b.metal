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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_66 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_64 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3321 = false;
    bool _2690 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_50.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_127);
        out.gl_Position.z = _3606;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_55.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_53.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3676 = as_type<float>(_165);
        out.gl_Position.z = _3676;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _189 = _181;
    float _207;
    if (!_187)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_111);
        float _213 = 1.0 / _211;
        float _215 = _145 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    float _223 = in.m_60.z;
    float _225 = in.m_60.w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _217 + _231;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _237 = _235 != 0;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _251 = 1.0 / _243;
    float _253 = float(_111);
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _257 = _221 * 2.0;
    float _259 = _219 * 2.0;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _263 = 1.0 / _247;
    float _265 = _219 + _221;
    float _267 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _269 = -_239;
    float _271 = fma(_261, 2.0, _269);
    float _273 = _265 + (-1.0);
    int _275 = as_type<int>(_265);
    float _277 = _253;
    if (_237)
    {
        _275 = 0;
    }
    int _279 = _275;
    float _281 = fma(_267, -2.0, _249);
    float _283 = floor(_259);
    int _285 = _279;
    if (!_237)
    {
        _285 = 1;
    }
    int _287 = _285;
    float _289 = _223 + _219;
    float _291 = _233 * _251;
    bool _293 = _287 != 1;
    float _295 = _289 + (-1.0);
    float _297 = _223 + _221;
    float _299 = floor(_257);
    float _301 = _223 * 2.0;
    float _303 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _305 = _229 * _263;
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _309 = _297 + (-1.0);
    float _311 = floor(_301);
    bool _313 = _283 > 0.0;
    float _315 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _317 = _283 >= 0.0;
    bool _319 = isnan(_283);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _329 = _309;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_293)
    {
        _329 = _223;
    }
    float _333 = _329;
    float _335 = -_145;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[76].x, _271);
    int _339 = _325 ? 0 : 1;
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _343 = int(_341);
    bool _345 = _299 > 0.0;
    float _347 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _281);
    bool _349 = _299 >= 0.0;
    bool _351 = isnan(_299);
    bool _353 = _349 || _351;
    bool _355 = isnan(0.0);
    bool _357 = _353 || _355;
    int _359 = ~_339;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    int _365 = _357 ? 0 : 1;
    float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _369 = log2(_367);
    bool _371 = _311 > 0.0;
    bool _373 = _311 >= 0.0;
    bool _375 = isnan(_311);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    int _383 = ~_365;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    int _389 = _363;
    int _391 = _387;
    float _393 = _333;
    if (!_313)
    {
        int _395 = ~_339;
        int _397 = _395 + 1;
        _389 = _397;
    }
    int _399 = _389;
    float _401 = 1.0 / _253;
    int _403 = _381 ? 0 : 1;
    if (!_345)
    {
        int _405 = ~_365;
        int _407 = _405 + 1;
        _391 = _407;
    }
    int _409 = _391;
    int _411 = ~_403;
    int _413 = _411 + 1;
    int _415 = _413 + 1;
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _419 = int(_417);
    int _421 = _415;
    if (!_371)
    {
        int _423 = ~_403;
        int _425 = _423 + 1;
        _421 = _425;
    }
    int _427 = _421;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_293)
    {
        _393 = _221;
    }
    float _431 = _393;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _443 = _441 != 0;
    float _445 = _431;
    if (!_293)
    {
        _331 = _221;
    }
    float _447 = _331;
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[83].w, _429);
    float _451 = _447;
    if (_293)
    {
        _451 = _219;
    }
    float _453 = _451;
    bool _455 = !_439;
    int _457 = _455 ? 0 : 1;
    bool _459 = !_435;
    int _461 = _459 ? 0 : 1;
    float _463 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[83].z, _255);
    bool _465 = !_443;
    int _467 = _465 ? 0 : 1;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _479 = _477 != 0;
    float _481 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    if (!_293)
    {
        _277 = _223;
    }
    float _483 = _277;
    float _485 = float(_343);
    bool _487 = !_471;
    int _489 = _487 ? 0 : 1;
    float _491 = _483;
    if (!_293)
    {
        _445 = _221;
    }
    float _493 = _445;
    float _495 = 1.0 / _485;
    float _497 = _493;
    if (_293)
    {
        _491 = _221;
    }
    float _499 = _491;
    if (_293)
    {
        _497 = _219;
    }
    float _501 = _497;
    int _503 = abs(_489);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _511 = float(_503);
    float _513 = float(_427);
    float _515 = -_505;
    float _517 = fma(_509, 2.0, _515);
    bool _519 = !_475;
    int _521 = _519 ? 0 : 1;
    float _523 = fma(_507, -2.0, _327);
    float _525 = _511 * _513;
    int _527 = abs(_521);
    float _529 = _369 * _145;
    float _531 = in.m_62.x;
    float _533 = in.m_62.y;
    float _535 = in.m_62.z;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _539 = 1.0 + _537;
    float _541 = float(_419);
    float _543 = exp2(_529);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _547 = float(_399);
    float _549 = float(_527);
    float _551 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _545);
    float _553 = 1.0 / _541;
    bool _555 = !_479;
    int _557 = _555 ? 0 : 1;
    float _559 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _551);
    bool _561 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _563 = isnan(1.0);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _569 = _565 || _567;
    float _571 = _525 * (-2.0);
    float _573 = _549 * _547;
    int _575 = abs(_557);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _579 = 1.0 / _539;
    float _581 = -_543;
    float _583 = _581 + 1.0;
    bool _585 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _593 = _589 || _591;
    float _595 = fma(_571, _531, _531);
    float _597 = _401 * _145;
    float _599 = float(_409);
    float _601 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].z, _577);
    float _603 = float(_575);
    float _605 = _495 * _145;
    float _607 = _593 ? _583 : 0.0;
    float _609 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _601);
    float _611 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _449);
    float _613 = _603 * _599;
    float _615 = _553 * _145;
    float _617 = -_145;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[81].x, _517);
    float _621 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _523);
    float _623 = _573 * (-2.0);
    if (_569)
    {
        float _625 = _607 * _579;
        _147 = _625;
    }
    float _627 = _147;
    float _629 = _219 + (-0.5);
    float _631 = _613 * (-2.0);
    float _633 = _221 + (-0.5);
    float _635 = fma(_623, _533, _533);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _641;
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _595);
    float _647 = fma(_631, _535, _535);
    float _649 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _635);
    float _651 = fma(_303, _571, _303);
    float _653 = _223 + (-0.5);
    float _655 = fma(_639, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = fma(_643, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _659 = fma(_315, _623, _315);
    bool _661 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _663 = isnan(_217);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].z, _647);
    float _675 = fma(_307, _631, _307);
    float _677 = fma(_659, _627, _649);
    bool _679 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _681 = isnan(_217);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -_671;
    float _693 = _691 + 1.0;
    bool _695 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _697 = isnan(_217);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = in.m_64.x;
    float _709 = in.m_64.y;
    float _711 = _677 * 0.15915493667125701904296875;
    float _713 = _689 * _693;
    float _715 = -_689;
    float _717 = _715 + 1.0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = fma(_651, _627, _645);
    float _729 = _705 * _717;
    float _731 = -_705;
    float _733 = _731 + 1.0;
    float _735 = fma(_721, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _737 = fma(_725, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _739 = _657 * _729;
    float _741 = _655 * _729;
    float _743 = fma(_675, _627, _673);
    float _745 = _727 * 0.15915493667125701904296875;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _739);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _741);
    float _751 = _743 * 0.15915493667125701904296875;
    float _753 = _745 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = fma(_735, _713, _747);
    float _759 = fma(_737, _713, _749);
    float _761 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[145].y, _757);
    float _763 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[145].x, _759);
    float _765 = _711 * 6.283185482025146484375;
    float _767 = sin(_765);
    float _769 = _761 * _709;
    float _771 = _763 * _707;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _777 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _711 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _777 * _773;
    float _787 = _779 * _775;
    float _789 = in.m_50.x;
    float _791 = in.m_50.y;
    float _793 = in.m_50.z;
    float _795 = _745 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _755 * _767;
    float _801 = _751 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = _755 * _783;
    float _807 = _751 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _797 * _767;
    float _813 = _797 * _783;
    float _815 = _755 * _803;
    float _817 = _783 * _803;
    float _819 = _797 * _803;
    float _821 = _767 * _803;
    float _823 = _815 * _785;
    float _825 = _819 * _785;
    float _827 = fma(_809, _805, _811);
    float _829 = -_799;
    float _831 = fma(_809, _813, _829);
    float _833 = -_813;
    float _835 = fma(_809, _799, _833);
    float _837 = -_785;
    float _839 = _809 * _837;
    float _841 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _843 = fma(_827, _787, _823);
    float _845 = fma(_809, _811, _805);
    float _847 = fma(_817, _787, _839);
    float _849 = fma(_831, _787, _825);
    float _851 = fma(_835, _841, _843);
    float _853 = _791 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = fma(_821, _841, _847);
    float _857 = _791 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _859 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _863 = fma(_845, _841, _849);
    float _865 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[4].x, _857);
    float _867 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _861);
    float _873 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    float _875 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[6].z, _867);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].z, _869);
    float _879 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _881 = _873 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _883 = _875 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _889 = _791 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _891 = _881 + _885;
    float _893 = _883 + _887;
    float _895 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[5].x, _889);
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _899 = _891 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _903 = _893 + _901;
    float _905 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[5].z, _895);
    float _907 = _899 * _899;
    float _909 = _903 * _903;
    float _911 = _905 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _915 = _907 + _909;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = 0.0;
    float _927 = _851;
    float _929 = _905;
    float _931 = _891;
    float _933 = _893;
    if (_919)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _935;
    }
    float _937 = _925;
    float _939 = _937;
    if (_919)
    {
        float _941 = _923 * _937;
        _939 = _941;
    }
    float _943 = _939;
    float _945 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _947 = _943;
    if (_919)
    {
        float _949 = rsqrt(_915);
        _927 = _949;
    }
    float _951 = _927;
    if (_919)
    {
        float _953 = _943 * 0.15915493667125701904296875;
        _947 = _953;
    }
    float _955 = _947;
    float _957 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _945);
    float _959 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    float _961 = _789;
    if (_919)
    {
        float _963 = _955 * 6.283185482025146484375;
        float _965 = sin(_963);
        _961 = _965;
    }
    float _967 = _961;
    float _969 = _959 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _971 = _911 + _969;
    float _973 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _975 = floor(_913);
    float _977 = _971;
    if (_919)
    {
        float _979 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _929 = _979;
    }
    float _981 = _929;
    float _983 = floor(_973);
    float _985 = _981;
    if (_919)
    {
        float _987 = fma(_967, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _987;
    }
    float _989 = _985;
    float _991 = _989;
    if (_919)
    {
        float _993 = _951 * _989;
        _991 = _993;
    }
    float _995 = _991;
    float _997 = -_975;
    float _999 = _913 + _997;
    if (_919)
    {
        float _1001 = fma(_899, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _931 = _1001;
    }
    float _1003 = _931;
    if (_919)
    {
        float _1005 = fma(_903, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _933 = _1005;
    }
    float _1007 = _933;
    float _1009 = fma(_1003, 6.2500002968590706586837768554688e-05, 0.5);
    float _1011 = fma(_1007, 6.2500002968590706586837768554688e-05, 0.5);
    float _1013 = -_983;
    float _1015 = _973 + _1013;
    float2 _5006 = float2(_1009, _1011);
    float3 _1019 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5006, float2(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5006, float2(0.0), isnan(_5006)), level(0.0)).xyz;
    float _1021 = _1019.x;
    float _1023 = _1019.y;
    float _1025 = _1019.z;
    float2 _5022 = float2(_999, _1015);
    float _1027 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5022, float2(0.0), isnan(_5022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5022, float2(0.0), isnan(_5022)), level(0.0)).x;
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1031 = int(_1029);
    float _1033 = 0.0;
    if (_237)
    {
        _1033 = 1.0;
    }
    float _1035 = _1033;
    float _1037 = -_611;
    float _1039 = _1037 + 1.0;
    float _1041 = _1035;
    if (!_237)
    {
        _1041 = 7.345489978790283203125;
    }
    float _1043 = _1041;
    int _1045 = abs(_461);
    float _1047 = trunc(_605);
    int _1049 = int(_1047);
    float _1051 = float(uint(_1031));
    float _1053 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1055 = int(_1053);
    int _1057 = ~_1031;
    int _1059 = _1057 + 1;
    bool _1061 = _1031 == 0;
    float _1063 = float(uint(_1049));
    float _1065 = 1.0 / _1051;
    float _1067 = float(uint(_1055));
    float _1069 = trunc(_615);
    int _1071 = int(_1069);
    float _1073 = _1043 * _219;
    int _1075 = ~_1055;
    int _1077 = _1075 + 1;
    float _1079 = _1043;
    if (_237)
    {
        float _1081 = in.m_60.x;
        _1079 = _1081;
    }
    float _1083 = _1079;
    bool _1085 = _1055 == 0;
    int _1087 = as_type<int>(_1065) + (-2);
    float _1089 = 1.0 / _1067;
    float _1091 = float(_1049);
    float _1093 = _1083;
    if (!_237)
    {
        float _1095 = in.m_60.y;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = as_type<float>(_1087) * _1063;
    float _1101 = floor(_1073);
    float _1103 = trunc(_1099);
    float _1105 = precise::max(_1103, 0.0);
    uint _1108 = uint(_1105);
    int _1110 = _1059 * int(_1108);
    int _1112 = _1110 + _1049;
    float _1114 = float(uint(_1112));
    int _1116 = as_type<int>(_1089) + (-2);
    float _1118 = float(uint(_1071));
    float _1120 = as_type<float>(_1087) * _1114;
    float _1122 = float(_1031);
    float _1124 = as_type<float>(_1116) * _1118;
    bool _1126 = _1091 >= _1122;
    bool _1128 = isnan(_1091);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(_1122);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = trunc(_1120);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = -_1101;
    float _1146 = _1073 + _1144;
    int _1148 = ~_1031;
    int _1150 = _1148 + 1;
    float _1152 = trunc(_1124);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = int(_1108) + int(_1142);
    float _1160 = _1146 * _1122;
    float _1162 = trunc(_1136);
    int _1164 = int(_1162);
    float _1166 = as_type<float>(_1142);
    if (_237)
    {
        _1166 = 1.0;
    }
    float _1168 = _1166;
    int _1170 = _1150 * _1158;
    int _1172 = _1170 + _1049;
    float _1174 = _1168;
    if (!_237)
    {
        _1174 = 1.2345600128173828125;
    }
    float _1176 = _1174;
    int _1178 = _1077 * int(_1156);
    int _1180 = _1178 + _1071;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1184 = _1182 != 0;
    float _1186 = trunc(_1160);
    int _1188 = int(_1186);
    bool _1190 = uint(_1172) >= uint(_1031);
    float _1192 = _1097 * _1176;
    float _1194 = float(uint(_1180));
    float _1196 = _1122 * _597;
    bool _1198 = !_1190;
    int _1200 = _1198 ? 0 : (-1);
    float _1202 = as_type<float>(_1116) * _1194;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1206 = _1204 != 0;
    float _1208 = trunc(_1196);
    int _1210 = int(_1208);
    int _1212 = ~_1158;
    int _1214 = _1212 + _1200;
    int _1216 = _1214 + 1;
    bool _1218 = !_1206;
    int _1220 = _1218 ? 0 : 1;
    int _1222 = abs(_1220);
    float _1224 = trunc(_1202);
    float _1226 = precise::max(_1224, 0.0);
    uint _1228 = uint(_1226);
    int _1230 = _1031 * _1216;
    int _1232 = _1230 + _1049;
    int _1234 = ~_1055;
    int _1236 = _1234 + 1;
    int _1238 = ~_1164;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    bool _1244 = !_1061;
    int _1246 = _1244 ? _1232 : (-1);
    int _1248 = _1188 * _1222;
    int _1250 = _1248 + _1049;
    int _1252 = _1031 + (-1);
    int _1254 = _1246 * _1242;
    float _1256 = floor(_1192);
    int _1258 = int(_1156) + int(_1228);
    int _1260 = _1164 * _1252;
    int _1262 = _1260 + _1254;
    int _1264 = abs(_457);
    float _1266 = float(_1055);
    int _1268 = _1236 * _1258;
    int _1270 = _1268 + _1071;
    float _1272 = float(_1071);
    int _1274 = _1262 * _1264;
    bool _1276 = uint(_1270) >= uint(_1055);
    int _1278 = _1210 * _1045;
    int _1280 = _1278 + _1274;
    bool _1282 = _1272 >= _1266;
    bool _1284 = isnan(_1272);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(_1266);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = -_1256;
    float _1296 = _1192 + _1294;
    int _1298 = abs(_467);
    bool _1300 = !_1276;
    int _1302 = _1300 ? 0 : (-1);
    float _1304 = trunc(_1292);
    int _1306 = int(_1304);
    bool _1308 = !_1184;
    int _1310 = _1308 ? 0 : 1;
    int _1312 = _1250 * _1298;
    int _1314 = _1312 + _1280;
    int _1316 = ~_1258;
    int _1318 = _1316 + _1302;
    int _1320 = _1318 + 1;
    int _1322 = abs(_1310);
    float _1324 = _1296 * _1266;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1328 = _1326 != 0;
    int _1330 = _1055 * _1320;
    int _1332 = _1330 + _1071;
    float _1334 = _1266 * _597;
    int _1336 = _1188 * _1322;
    int _1338 = _1336 + _1314;
    bool _1340 = !_1328;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = trunc(_1324);
    int _1346 = int(_1344);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1085;
    int _1366 = _1364 ? _1332 : (-1);
    int _1368 = ~_1306;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    bool _1374 = !_1354;
    int _1376 = _1374 ? 0 : 1;
    float _1378 = trunc(_1334);
    int _1380 = int(_1378);
    int _1382 = abs(_1342);
    int _1384 = _1366 * _1372;
    float _1386 = float(uint(_1338));
    int _1388 = _1055 + (-1);
    bool _1390 = !_1350;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = as_type<float>(_1087) * _1386;
    int _1396 = abs(_1376);
    int _1398 = _1306 * _1388;
    int _1400 = _1398 + _1384;
    int _1402 = abs(_1392);
    int _1404 = _1346 * _1382;
    int _1406 = _1404 + _1071;
    float _1408 = trunc(_1394);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    int _1414 = _1400 * _1396;
    bool _1416 = !_1358;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = ~_1031;
    int _1422 = _1420 + 1;
    int _1424 = _1380 * _1402;
    int _1426 = _1424 + _1414;
    bool _1428 = !_1362;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = abs(_1418);
    int _1434 = abs(_1430);
    float _1436 = float(uint(_1406));
    int _1438 = _1406 * _1432;
    int _1440 = _1438 + _1426;
    float _1442 = float(uint(_1250));
    int _1444 = _1422 * int(_1412);
    int _1446 = _1444 + _1338;
    int _1448 = ~_1055;
    int _1450 = _1448 + 1;
    int _1452 = _1346 * _1434;
    int _1454 = _1452 + _1440;
    float _1456 = as_type<float>(_1116) * _1436;
    float _1458 = as_type<float>(_1087) * _1442;
    float _1460 = float(uint(_1446));
    float _1462 = float(uint(_1454));
    float _1464 = trunc(_1456);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    int _1470 = ~_1055;
    int _1472 = _1470 + 1;
    float _1474 = as_type<float>(_1087) * _1460;
    float _1476 = as_type<float>(_1116) * _1462;
    float _1478 = trunc(_1474);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    float _1484 = trunc(_1458);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = _1472 * int(_1468);
    int _1492 = _1490 + _1406;
    int _1494 = ~_1031;
    int _1496 = _1494 + 1;
    float _1498 = float(uint(_1492));
    float _1500 = trunc(_1476);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    int _1506 = ~_1031;
    int _1508 = _1506 + 1;
    int _1510 = int(_1412) + int(_1482);
    float _1512 = as_type<float>(_1116) * _1498;
    int _1514 = _1508 * int(_1488);
    int _1516 = _1514 + _1250;
    float _1518 = trunc(_1512);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    float _1524 = float(uint(_1516));
    int _1526 = _1450 * int(_1504);
    int _1528 = _1526 + _1454;
    float _1530 = as_type<float>(_1087) * _1524;
    float _1532 = float(uint(_1528));
    int _1534 = _1496 * _1510;
    int _1536 = _1534 + _1338;
    float _1538 = trunc(_1530);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = as_type<float>(_1116) * _1532;
    bool _1546 = uint(_1536) >= uint(_1031);
    bool _1548 = !_1546;
    int _1550 = _1548 ? 0 : (-1);
    float _1552 = trunc(_1544);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = ~_1510;
    int _1560 = _1558 + _1550;
    int _1562 = _1560 + 1;
    int _1564 = ~_1031;
    int _1566 = _1564 + 1;
    int _1568 = int(_1488) + int(_1542);
    int _1570 = _1031 * _1562;
    int _1572 = _1570 + _1338;
    int _1574 = int(_1468) + int(_1522);
    out.m_66.x = _1021;
    out.m_66.y = _1023;
    out.m_66.z = _1025;
    int _1576 = ~_1055;
    int _1578 = _1576 + 1;
    bool _1580 = !_1061;
    int _1582 = _1580 ? _1572 : (-1);
    int _1584 = int(_1504) + int(_1556);
    int _1586 = _1566 * _1568;
    int _1588 = _1586 + _1250;
    int _1590 = _1582 & 3;
    bool _1592 = _1590 != 0;
    int _1594 = _1582 & 3;
    bool _1596 = _1594 != 0;
    int _1598 = _1578 * _1584;
    int _1600 = _1598 + _1454;
    bool _1602 = uint(_1590) >= 2u;
    int _1604 = _1596 ? 0 : 1;
    int _1606 = _1602 ? 0 : 1;
    bool _1608 = uint(_1600) >= uint(_1055);
    bool _1610 = uint(_1590) > 1u;
    bool _1612 = uint(_1588) >= uint(_1031);
    bool _1614 = !_1608;
    int _1616 = _1614 ? 0 : (-1);
    bool _1618 = !_1612;
    int _1620 = _1618 ? 0 : (-1);
    int _1622 = ~_1584;
    int _1624 = _1622 + _1616;
    int _1626 = _1624 + 1;
    int _1628 = ~_1568;
    int _1630 = _1628 + _1620;
    int _1632 = _1630 + 1;
    int _1634 = _1578 * _1574;
    int _1636 = _1634 + _1406;
    bool _1638 = _225 > 0.5;
    int _1640 = _1055 * _1626;
    int _1642 = _1640 + _1454;
    int _1644 = ~_1604;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    int _1650 = _1031 * _1632;
    int _1652 = _1650 + _1250;
    int _1654 = _1648;
    if (!_1610)
    {
        int _1656 = ~_1604;
        int _1658 = _1656 + 1;
        _1654 = _1658;
    }
    int _1660 = _1654;
    int _1662 = _1582 >> 31;
    bool _1664 = uint(_1636) >= uint(_1055);
    bool _1666 = !_1085;
    int _1668 = _1666 ? _1642 : (-1);
    int _1670 = _1662 & 3;
    bool _1672 = _1590 != 3;
    bool _1674 = !_1664;
    int _1676 = _1674 ? 0 : (-1);
    int _1678 = _1668 >> 31;
    bool _1680 = !_1061;
    int _1682 = _1680 ? _1652 : (-1);
    int _1684 = _1582 + _1670;
    float _1686 = -_185;
    int _1688 = _1638 ? as_type<int>(_1686) : as_type<int>(_185);
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1692 = _1690 != 0;
    int _1694 = ~_1574;
    int _1696 = _1694 + _1676;
    int _1698 = _1696 + 1;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1702 = _1700 != 0;
    int _1704 = _1678 & 3;
    int _1706 = _1684 >> 2;
    bool _1708 = !_1692;
    int _1710 = _1708 ? 0 : 1;
    bool _1712 = !_1702;
    int _1714 = _1712 ? 0 : 1;
    int _1716 = _1668 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1668 + _1704;
    int _1722 = _1668 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = _1706 << 4;
    int _1728 = _1726 + 368;
    int _1730 = ~_1606;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    int _1736 = _1734;
    if (_1672)
    {
        int _1738 = ~_1606;
        int _1740 = _1738 + 1;
        _1736 = _1740;
    }
    int _1742 = _1736;
    int _1744 = _1055 * _1698;
    int _1746 = _1744 + _1406;
    bool _1748 = !_1592;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = _1718 ? 0 : 1;
    int _1754 = _1720 >> 2;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1758 = _1756 != 0;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1762 = _1760 != 0;
    bool _1764 = !_1724;
    int _1766 = _1764 ? 0 : 1;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1770 = _1768 != 0;
    bool _1772 = _1590 != 3;
    bool _1774 = uint(_1722) > 1u;
    uint _1776 = uint(int(uint(_1728) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = _1754 << 4;
    int _1794 = _1792 + 512;
    int _1796 = ~_1752;
    int _1798 = _1796 + 1;
    int _1800 = _1798 + 1;
    bool _1802 = !_1772;
    int _1804 = _1802 ? 0 : (-1);
    bool _1806 = uint(_1722) >= 2u;
    uint _1808 = uint(int(uint(_1794) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    int _1824 = _1806 ? 0 : 1;
    int _1826 = _1800;
    if (!_1774)
    {
        int _1828 = ~_1752;
        int _1830 = _1828 + 1;
        _1826 = _1830;
    }
    int _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1836 = _1722 != 3;
    int _1838 = _1794 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    bool _1856 = _1722 != 3;
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1860 = ~_1824;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = _1728 + 8;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
    int _1872 = int(_1868) & 3;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[int(_1870)][_1872];
    int _1876 = int(_1868) + 1;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    int _1880 = _1876 & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = abs(_1660);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1888 = abs(_1750);
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1892 = _1864;
    if (_1836)
    {
        int _1894 = ~_1824;
        int _1896 = _1894 + 1;
        _1892 = _1896;
    }
    int _1898 = _1892;
    float _1900 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1902 = !_1856;
    int _1904 = _1902 ? 0 : (-1);
    int _1906 = abs(_1832);
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1910 = _219 > 0.5;
    float _1912 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1914 = !_1085;
    int _1916 = _1914 ? _1746 : (-1);
    float _1918 = -_181;
    int _1920 = _1910 ? as_type<int>(_1918) : as_type<int>(_181);
    out.m_68.x = _1912;
    out.m_68.y = _1858;
    out.m_68.z = _1900;
    out.m_68.w = _1890;
    bool _1922 = _221 > 0.5;
    bool _1924 = _223 > 0.5;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1928 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1930 = _1928 != 0;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1936 = int(_1934);
    int _1938 = ~_1884;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1948 = _1942 * as_type<int>(_1790);
    int _1950 = ~_1888;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1958 = abs(_1766);
    float _1960 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1962 = ~_1906;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1954 * as_type<int>(_1782);
    int _1970 = _1968 + _1948;
    int _1972 = ~_1958;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1980 = int(_1978);
    out.m_70.x = _1946;
    out.m_70.y = _1956;
    out.m_70.z = _1960;
    int _1982 = _1966 * as_type<int>(_1822);
    int _1984 = abs(_1904);
    float _1986 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1988 = abs(_1742);
    int _1990 = _1976 * as_type<int>(_1814);
    int _1992 = _1990 + _1982;
    int _1994 = abs(_1898);
    int _1996 = abs(_1804);
    int _1998 = ~_1988;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = ~_1994;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = float(uint(_1936));
    int _2012 = _2002 * as_type<int>(_1874);
    int _2014 = _2012 + _1970;
    int _2016 = ~_1984;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = _2008 * as_type<int>(_1846);
    int _2024 = _2022 + _1992;
    float _2026 = float(uint(_1980));
    float _2028 = 1.0 / _2010;
    int _2030 = ~_1996;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = _2020 * as_type<int>(_1854);
    int _2038 = _2036 + _2024;
    int _2040 = abs(_1714);
    int _2042 = abs(_1936);
    int _2044 = _2034 * as_type<int>(_1882);
    int _2046 = _2044 + _2014;
    int _2048 = ~_2040;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    float _2054 = 1.0 / _2026;
    float _2056 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = abs(_1980);
    int _2060 = _2046 * _2052;
    float _2062 = float(uint(_2042));
    float _2064 = -_809;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    int _2068 = abs(_1710);
    int _2070 = _1682 * _2040;
    int _2072 = _2070 + _2060;
    float _2074 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2076 = float(uint(_2058));
    float _2078 = 1.0 / _2062;
    int _2080 = ~_2068;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    float _2086 = -_809;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2074);
    float _2090 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2066);
    float _2092 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2094 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2096 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2088);
    int _2098 = as_type<int>(_2028) + (-2);
    float _2100 = 1.0 / _2076;
    int _2102 = as_type<int>(_2054) + (-2);
    int _2104 = _2038 * _2084;
    float _2106 = float(uint(_2072));
    float _2108 = -_809;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2094);
    bool _2112 = !_1758;
    float _2114 = _2112 ? _185 : as_type<float>(_1688);
    int _2116 = _1916 * _2068;
    int _2118 = _2116 + _2104;
    float _2120 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2122 = as_type<float>(_2098) * _2106;
    float _2124 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2092);
    int _2126 = abs(_2072);
    float _2128 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2130 = float(uint(_2118));
    float _2132 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    float _2134 = trunc(_2122);
    float _2136 = precise::max(_2134, 0.0);
    uint _2138 = uint(_2136);
    int _2140 = abs(_2118);
    float _2142 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    int _2144 = as_type<int>(_2078) + (-2);
    float _2146 = as_type<float>(_2102) * _2130;
    float _2148 = float(uint(_2126));
    float _2150 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2120);
    int _2152 = as_type<int>(_2100) + (-2);
    float _2154 = _2110;
    float _2156 = _2150;
    float _2158 = _2096;
    if (_919)
    {
        float _2160 = _955 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2154 = _2162;
    }
    float _2164 = _2154;
    int _2166 = ~_1936;
    int _2168 = _2166 + 1;
    float _2170 = as_type<float>(_2144) * _2148;
    float _2172 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2174 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2176 = !_1930;
    float _2178 = _2176 ? _181 : as_type<float>(_1920);
    float _2180 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2124);
    float _2182 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2172);
    float _2184 = trunc(_2146);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = float(uint(_2140));
    int _2192 = _2168 * int(_2138);
    int _2194 = _2192 + _2072;
    float _2196 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2174);
    float _2198 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2182);
    bool _2200 = _1980 == 0;
    float _2202 = as_type<float>(_2152) * _2190;
    float _2204 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1986);
    float _2206 = trunc(_2170);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    float _2212 = float(uint(_2194));
    float _2214 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    int _2216 = ~_1980;
    int _2218 = _2216 + 1;
    float _2220 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2204);
    int _2222 = ~_2058;
    int _2224 = _2222 + 1;
    float _2226 = as_type<float>(_2098) * _2212;
    float _2228 = trunc(_2202);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = ~_2042;
    int _2236 = _2234 + 1;
    float _2238 = as_type<float>(_2218);
    float _2240 = as_type<float>(_2224);
    float _2242 = _2202;
    if (_919)
    {
        float _2244 = _2164 + (-1.0);
        _2238 = _2244;
    }
    float _2246 = _2238;
    int _2248 = _2218 * int(_2188);
    int _2250 = _2248 + _2118;
    float _2252 = _2246;
    if (!_919)
    {
        _2240 = _907;
    }
    float _2254 = _2240;
    float _2256 = _2254;
    if (_919)
    {
        float _2258 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2252 = _2258;
    }
    float _2260 = _2252;
    int _2262 = _2236 * int(_2210);
    int _2264 = _2262 + _2126;
    float _2266 = float(uint(_2250));
    if (_919)
    {
        float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2270 = _1003 + _2268;
        _2242 = _2270;
    }
    float _2272 = _2242;
    float _2274 = trunc(_2226);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    if (_919)
    {
        float _2280 = fma(_971, _2164, _2260);
        _977 = _2280;
    }
    float _2282 = _977;
    float _2284 = -_185;
    int _2286 = _1922 ? as_type<int>(_2284) : as_type<int>(_185);
    float _2288 = as_type<float>(_2102) * _2266;
    if (_919)
    {
        float _2290 = _2272 * _2272;
        _2256 = _2290;
    }
    float _2292 = _2256;
    int _2294 = _2224 * int(_2232);
    int _2296 = _2294 + _2140;
    float _2298 = float(uint(_2264));
    float _2300 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2302 = -_181;
    int _2304 = _1924 ? as_type<int>(_2302) : as_type<int>(_181);
    float _2306 = float(uint(_2296));
    float _2308 = as_type<float>(_2144) * _2298;
    float _2310 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    float _2312 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2314 = _2300 * _2132;
    float _2316 = as_type<float>(_2152) * _2306;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2320 = _2282 + _2318;
    float _2322 = trunc(_2288);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    bool _2328 = !_1762;
    float _2330 = _2328 ? _185 : as_type<float>(_2286);
    float _2332 = _2300 * _2090;
    float _2334 = fma(_2320, _2320, _2292);
    int _2336 = int(_2138) + int(_2278);
    int _2338 = ~_1936;
    int _2340 = _2338 + 1;
    float _2342 = trunc(_2308);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    bool _2348 = !_1770;
    float _2350 = _2348 ? _181 : as_type<float>(_2304);
    float _2352 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2150);
    if (!_919)
    {
        _189 = _909;
    }
    float _2354 = _189;
    float _2356 = fma(_2312, _2310, _2314);
    int _2358 = ~_1980;
    int _2360 = _2358 + 1;
    int _2362 = _2340 * _2336;
    int _2364 = _2362 + _2072;
    float _2366 = _2354;
    if (_919)
    {
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2370 = _1007 + _2368;
        _2156 = _2370;
    }
    float _2372 = _2156;
    float _2374 = trunc(_2316);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = int(_2188) + int(_2326);
    float _2382 = _2300 * _2096;
    int _2384 = ~_2042;
    int _2386 = _2384 + 1;
    if (_919)
    {
        float _2388 = _2372 * _2372;
        _2366 = _2388;
    }
    float _2390 = _2366;
    bool _2392 = uint(_2364) >= uint(_1936);
    int _2394 = _2360 * _2380;
    int _2396 = _2394 + _2118;
    int _2398 = ~_2058;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2312, _2352, _2332);
    int _2404 = int(_2210) + int(_2346);
    float _2406 = fma(_2312, _2180, _2382);
    float _2408 = _2334 + _2390;
    bool _2410 = uint(_2396) >= uint(_1980);
    out.m_72.x = _2352;
    out.m_72.y = _2180;
    out.m_72.z = _2310;
    bool _2412 = !_2392;
    int _2414 = _2412 ? 0 : (-1);
    int _2416 = _2386 * _2404;
    int _2418 = _2416 + _2126;
    int _2420 = int(_2232) + int(_2378);
    float _2422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2424 = ~_2336;
    int _2426 = _2424 + _2414;
    int _2428 = _2426 + 1;
    bool _2430 = uint(_2418) >= uint(_2042);
    int _2432 = _2400 * _2420;
    int _2434 = _2432 + _2140;
    bool _2436 = !_2410;
    int _2438 = _2436 ? 0 : (-1);
    bool _2440 = _1936 == 0;
    float _2442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2444 = uint(_2434) >= uint(_2058);
    int _2446 = _1936 * _2428;
    int _2448 = _2446 + _2072;
    int _2450 = ~_2380;
    int _2452 = _2450 + _2438;
    int _2454 = _2452 + 1;
    int _2456 = _2072 ^ _1936;
    int _2458 = _2118 ^ _1980;
    int _2460 = _1980 * _2454;
    int _2462 = _2460 + _2118;
    bool _2464 = _1936 == 0;
    float _2466 = sqrt(_2408);
    bool _2468 = !_2430;
    int _2470 = _2468 ? 0 : (-1);
    uint _2472 = uint(int(uint(_2456) >> uint(31)));
    bool _2474 = !_2444;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2480 = !_2440;
    int _2482 = _2480 ? _2448 : (-1);
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2486 = uint(int(uint(_2458) >> uint(31)));
    int _2488 = ~_2470;
    int _2490 = _2404 + _2488;
    int _2492 = _2490 + 1;
    int _2494 = ~int(_2472);
    int _2496 = _2494 + 1;
    float _2498 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2500 = ~_2476;
    int _2502 = _2420 + _2500;
    int _2504 = _2502 + 1;
    float _2506 = float(_2482);
    int _2508 = ~int(_2486);
    int _2510 = _2508 + 1;
    float _2512 = fma(_2300, _2300, 1.0);
    int _2514 = _2492 ^ _2496;
    float _2516 = fma(_2498, _2506, _337);
    bool _2518 = _1980 == 0;
    float _2520 = rsqrt(_2512);
    bool _2522 = !_2200;
    int _2524 = _2522 ? _2462 : (-1);
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2528 = ~_2496;
    int _2530 = _2528 + _2514;
    int _2532 = _2530 + 1;
    float _2534 = _2178 + 0.5;
    int _2536 = _2504 ^ _2510;
    float _2538 = float(_2524);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2542 = !_2464;
    int _2544 = _2542 ? _2532 : (-1);
    float _2546 = fma(_2498, _2534, _2516);
    int _2548 = ~_2510;
    int _2550 = _2548 + _2536;
    int _2552 = _2550 + 1;
    float _2554 = fma(_2526, _2538, _619);
    float _2556 = float(_2544);
    bool _2558 = !_2518;
    int _2560 = _2558 ? _2552 : (-1);
    float _2562 = _2300 * _2520;
    bool _2564 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2566 = isnan(_2466);
    bool _2568 = _2564 || _2566;
    bool _2570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2572 = _2568 || _2570;
    float _2574 = -_347;
    float _2576 = fma(_2478, _2556, _2574);
    float _2578 = float(_2560);
    float _2580 = _2350 + 0.5;
    float _2582 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2584 = _2330 + (-0.5);
    float _2586 = fma(_2526, _2580, _2554);
    float _2588 = -_2198;
    float _2590 = _2562 * _2588;
    float _2592 = -_621;
    float _2594 = fma(_2582, _2578, _2592);
    float _2596 = -_2478;
    float _2598 = fma(_2596, _2584, _2576);
    float _2600 = _2114 + (-0.5);
    float _2602 = -_2214;
    float _2604 = _2562 * _2602;
    float _2606 = fma(_2520, _2090, _2590);
    float _2608 = _2198 + _2402;
    float _2610 = -_2582;
    float _2612 = fma(_2610, _2600, _2594);
    float _2614 = fma(_2520, _2096, _2604);
    float _2616 = -_559;
    float _2618 = _2616 + 1.0;
    float _2620 = -_2220;
    float _2622 = _2562 * _2620;
    float _2624 = -_609;
    float _2626 = _2624 + 1.0;
    float _2628 = -_481;
    float _2630 = _2628 + 1.0;
    float _2632 = fma(_2330, _2618, _2598);
    float _2634 = fma(_2520, _2132, _2622);
    float _2636 = -_2626;
    float _2638 = fma(_2178, _2636, _2546);
    float _2640 = -_2630;
    float _2642 = fma(_2350, _2640, _2586);
    float _2644 = fma(_2114, _1039, _2612);
    float _2646 = _2214 + _2406;
    float _2648 = _2220 + _2356;
    out.m_74.x = _2606;
    out.m_74.y = _2614;
    out.m_74.z = _2634;
    float _2650 = _2546;
    float _2652 = _2614;
    float _2654 = _2638;
    if (!_2572)
    {
        _2650 = 1.0;
    }
    float _2656 = _2650;
    out.m_76.x = _2638;
    out.m_76.y = _2632;
    out.m_76.z = _2642;
    out.m_76.w = _2644;
    out.m_78.x = _2608;
    out.m_78.y = _2646;
    out.m_78.z = _2648;
    bool _2658 = !_2572;
    float _2660 = _2656;
    if (!_2658)
    {
        bool _2662 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2664 = isnan(_2466);
        bool _2666 = _2662 || _2664;
        bool _2668 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2670 = _2666 || _2668;
        if (!_2670)
        {
            float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2674 = _2466 + _2672;
            float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2678 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2676;
            float _2680 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2684 = 1.0 / _2678;
            float _2686 = _2674 * _2684;
            float _2688 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2660 = _2688;
            _2690 = true;
        }
        else
        {
            bool _2692 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2694 = isnan(_2466);
            bool _2696 = _2692 || _2694;
            bool _2698 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2700 = _2696 || _2698;
            if (!_2700)
            {
                float _2702 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2704 = _2466 + _2702;
                float _2706 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2708 = _2706 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2712 = _2710 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2714 = 1.0 / _2708;
                float _2716 = _2704 * _2714;
                float _2718 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2660 = _2718;
                _2690 = true;
            }
            else
            {
                _2660 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2690 = false;
    float _2720 = _2660;
    float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2724 = _2282 + _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2728 = _1003 + _2726;
    float _2730 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2734 = _1007 + _2732;
    float _2736 = fma(_2728, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2740 = _2730 + _2738;
    float _2742 = fma(_2734, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2746 = _2736 + _2744;
    float _2748 = _2740 * _2740;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2752 = _2742 + _2750;
    float _2754 = fma(_2746, _2746, _2748);
    float _2756 = fma(_2752, _2752, _2754);
    float _2758 = rsqrt(_2756);
    float _2760 = sqrt(_2756);
    float _2762 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2764 = _2746 * _2762;
    float _2766 = _2752 * _2762;
    float _2768 = _2764 * _2764;
    float _2770 = _2766 * _2766;
    float _2772 = _2768 + _2770;
    float _2774 = sqrt(_2772);
    bool _2776 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2780 = _2774 + _2778;
    float _2782 = _2758;
    float _2784 = _2780;
    float _2786 = _2740;
    float _2788 = _2764;
    if (_2776)
    {
        float _2790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2790;
    }
    float _2792 = _2782;
    if (_2776)
    {
        float _2794 = rsqrt(_2772);
        _2652 = _2794;
    }
    float _2796 = _2652;
    float _2798 = _2796;
    if (_2776)
    {
        float _2800 = _2780 * _2792;
        _2784 = _2800;
    }
    float _2802 = _2784;
    if (_2776)
    {
        float _2804 = _2802 * 0.15915493667125701904296875;
        _2158 = _2804;
    }
    float _2806 = _2158;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2810 = _2792;
    if (_2776)
    {
        float _2812 = _2806 * 6.283185482025146484375;
        float _2814 = sin(_2812);
        _2810 = _2814;
    }
    float _2816 = _2810;
    float _2818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2820 = precise::max(0.0, _2818);
    float _2822 = _2752;
    float _2824 = _2820;
    if (_2776)
    {
        float _2826 = _2806 * 6.283185482025146484375;
        float _2828 = cos(_2826);
        _2822 = _2828;
    }
    float _2830 = _2822;
    float _2832 = -_2762;
    float _2834 = -_2820;
    float _2836 = fma(_2740, _2832, _2834);
    if (!_2776)
    {
        _2786 = _2766;
    }
    float _2838 = _2786;
    float _2840 = _2838;
    if (_2776)
    {
        float _2842 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _2842;
    }
    float _2844 = _2824;
    float _2846 = _2816;
    float _2848 = _2844;
    if (_2776)
    {
        float _2850 = fma(_2816, _2844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2654 = _2850;
    }
    float _2852 = _2654;
    float _2854 = _2852;
    if (!_2776)
    {
        _2846 = _2836;
    }
    float _2856 = _2846;
    float _2858 = _2856;
    float _2860 = _2830;
    if (_2776)
    {
        float _2862 = _2830 + (-1.0);
        _2848 = _2862;
    }
    float _2864 = _2848;
    float _2866 = _2864;
    if (_2776)
    {
        float _2868 = _2796 * _2852;
        _2854 = _2868;
    }
    float _2870 = _2854;
    if (_2776)
    {
        float _2872 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2872;
    }
    float _2874 = _2798;
    if (_2776)
    {
        float _2876 = _2764 * _2870;
        _2788 = _2876;
    }
    float _2878 = _2788;
    if (!_2776)
    {
        _2866 = _2768;
    }
    float _2880 = _2866;
    float _2882 = _2880;
    if (_2776)
    {
        float _2884 = _2766 * _2870;
        _2840 = _2884;
    }
    float _2886 = _2840;
    if (_2776)
    {
        float _2888 = fma(_2836, _2830, _2874);
        _2858 = _2888;
    }
    float _2890 = _2858;
    if (_2776)
    {
        float _2892 = _2878 * _2878;
        _2882 = _2892;
    }
    float _2894 = _2882;
    if (!_2776)
    {
        _2860 = _2770;
    }
    float _2896 = _2860;
    float _2898 = _2896;
    if (_2776)
    {
        float _2900 = _2886 * _2886;
        _2898 = _2900;
    }
    float _2902 = _2898;
    float _2904 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2906 = fma(_2890, _2890, _2894);
    float _2908 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2904);
    float _2910 = _2906 + _2902;
    float _2912 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2916 = fma(_2760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2914);
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2908);
    float _2922 = rsqrt(_2910);
    float _2924 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2926 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2912);
    float _2928 = _2920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2930 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2932 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2924);
    float _2934 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2926);
    float _2936 = -_2918;
    float _2938 = _2936 + 1.0;
    float _2940 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2930);
    float _2942 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2944 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2932);
    float _2946 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2940);
    float _2950 = -_2942;
    float _2952 = fma(_2950, _2808, 1.0);
    float _2954 = abs(_2938);
    float _2956 = log2(_2954);
    float _2958 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2960 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2962 = _2922 * _2878;
    float _2964 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2966 = _2922 * _2890;
    float _2968 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2960);
    float _2970 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2972 = _2922 * _2886;
    float _2974 = log2(_2952);
    float _2976 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2968);
    float _2978 = -_2970;
    float _2980 = fma(_2966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2978);
    float _2982 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2976);
    float _2984 = -_2972;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2980);
    float _2988 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2990 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2992 = 1.0 / _2982;
    float _2994 = fma(_2986, -0.5, 0.5);
    float _2996 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2998 = fma(_2986, 0.5, 0.5);
    float _3000 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2990);
    float _3002 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2996);
    float _3004 = fma(_2998, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3006 = exp2(_2988);
    float _3008 = _2966 + 1.0;
    float _3010 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3002);
    float _3012 = fma(_2998, _3004, -0.212114393711090087890625);
    float _3014 = _2974 * 0.693147182464599609375;
    float _3016 = fma(_2998, _3012, 1.570728778839111328125);
    float _3018 = sqrt(_2994);
    float _3020 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3000);
    float _3022 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3010);
    float _3024 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3026 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3020);
    float _3028 = -_2966;
    float _3030 = fma(_3006, _3008, _3028);
    float _3032 = _3026 * _2992;
    float _3034 = _3022 * _2992;
    float _3036 = fma(_3032, 0.5, 0.5);
    float _3038 = fma(_3034, -0.5, 0.5);
    float _3040 = _3018 * 0.636619746685028076171875;
    float _3042 = -_3016;
    float _3044 = fma(_3040, _3042, 1.0);
    float _3046 = fma(_3030, 0.5, 0.5);
    float3 _8028 = float3(_3036, _3038, _3024);
    float _3048 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8028, float3(0.0), isnan(_8028)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8028, float3(0.0), isnan(_8028)), level(0.0)).x;
    float3 _8039 = float3(_3036, _3038, _3024);
    float4 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8039, float3(0.0), isnan(_8039)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8039, float3(0.0), isnan(_8039)), level(0.0)).xyzw;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = _3051.w;
    float2 _8055 = float2(_3044, _3046);
    float3 _3061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8055, float2(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8055, float2(0.0), isnan(_8055)), level(0.0)).xyz;
    float _3063 = _3061.x;
    float _3065 = _3061.y;
    float _3067 = _3061.z;
    float _3069 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3071 = -_1027;
    float _3073 = _3071 + 1.0;
    out.m_80.x = _2736;
    out.m_80.y = _2730;
    out.m_80.z = _2742;
    bool _3075 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3077 = isnan(_2760);
    bool _3079 = _3075 || _3077;
    bool _3081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3083 = _3079 || _3081;
    float _3085 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3069);
    float _3087 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3089 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3085);
    float _3091 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3087);
    float _3093 = _3089 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3095 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3091);
    float _3097 = 1.0 / _3093;
    float _3099 = _3095 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3101 = _3099 + _3093;
    float _3103 = _3101 * _3097;
    float _3105 = _3103 * 0.5;
    float _3107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3109 = fma(_3105, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3107);
    float _3111 = 1.0 / _3109;
    float _3113 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3115 = _3111 * _3113;
    float _3117 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3119 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3121 = abs(_3115);
    float _3123 = log2(_3121);
    float _3125 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3119);
    float _3127 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3125);
    float _3129 = exp2(_3117);
    bool _3131 = _3115 <= 8000.0;
    bool _3133 = isnan(_3115);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan(8000.0);
    bool _3139 = _3135 || _3137;
    float _3141 = float(_3139);
    float _3143 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3127);
    float _3145 = _3143 + _2982;
    out.gl_Position.x = _3026;
    out.gl_Position.y = _3022;
    out.gl_Position.z = _3143;
    out.gl_Position.w = _2982;
    float _3147 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3149 = exp2(_3147);
    float _3151 = -_3129;
    float _3153 = _3151 + 1.0;
    float _3155 = _3143;
    float _3157 = _3022;
    float _3159 = _3026;
    float _3161 = _2982;
    float _3163 = _3057;
    if (!_3083)
    {
        _3155 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3165 = _3155;
    float _3167 = _3165;
    float _3169 = _3165;
    if (!_3083)
    {
        _3157 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3171 = _3157;
    float _3173 = _3171;
    float _3175 = _3171;
    if (!_3083)
    {
        _3159 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3177 = _3159;
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = _3177;
    float _3185 = _3177;
    if (!_3083)
    {
        _3161 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3187 = _3161;
    float _3189 = fma(_3181, -2.0, 3.0);
    float _3191 = _3181 * _3181;
    float _3193 = in.m_82.x;
    float _3195 = _3191 * _3189;
    float _3197 = -_3195;
    float _3199 = _3197 + 1.0;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3195);
    float _3203 = _3141 * _3201;
    float _3205 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3207 = _3073 * _3205;
    float _3209 = precise::clamp(_3207, 0.0, 1.0);
    float _3211 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3213 = -_3209;
    float _3215 = fma(_3213, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3217 = _3145 * 0.5;
    float _3219 = _3215 * _3193;
    out.m_84.z = _3217;
    out.m_84.w = _2982;
    float _3221 = _3219 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3221;
    float _3223 = _3211 * _3048;
    float _3225 = -_3211;
    float _3227 = _3225 + 1.0;
    float _3229 = _3059 * _3223;
    float _3231 = _3067 * _3223;
    float _3233 = fma(_3063, _3229, _3053);
    float _3235 = fma(_3065, _3229, _3055);
    float _3237 = _3059 * _3227;
    float _3239 = fma(_3059, _3231, _3057);
    float _3241 = _3229;
    float _3243 = _3187;
    float _3245 = _3187;
    if (!_3083)
    {
        _3241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3247 = _3241;
    float _3249 = _3247;
    float _3251 = _3247;
    if (!_3083)
    {
        _3163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3253 = _3163;
    out.m_88.x = _3233;
    out.m_88.y = _3235;
    out.m_88.z = _3239;
    out.m_88.w = _3237;
    bool _3255 = !_3083;
    float _3257 = _3253;
    float _3259 = _3253;
    if (!_3255)
    {
        bool _3261 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3263 = isnan(_2760);
        bool _3265 = _3261 || _3263;
        bool _3267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3269 = _3265 || _3267;
        if (!_3269)
        {
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3273 = _2760 + _3271;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3277 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3275;
            float _3279 = 1.0 / _3277;
            float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3283 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3287 = _3285 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3289 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3291 = _3289 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3293 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3301 = _3273 * _3279;
            float _3303 = precise::clamp(_3301, 0.0, 1.0);
            float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3309 = fma(_3303, _3283, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3311 = fma(_3303, _3307, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3313 = fma(_3303, _3287, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3315 = fma(_3303, _3291, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3317 = fma(_3303, _3295, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3319 = fma(_3303, _3299, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3259 = _3311;
            _3175 = _3317;
            _3251 = _3309;
            _3169 = _3315;
            _3245 = _3313;
            _3185 = _3319;
            _3321 = true;
        }
        else
        {
            bool _3323 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3325 = isnan(_2760);
            bool _3327 = _3323 || _3325;
            bool _3329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3331 = _3327 || _3329;
            if (!_3331)
            {
                _3249 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3333 = _3249;
            _3251 = _3333;
            if (!_3331)
            {
                _3257 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3335 = _3257;
            _3259 = _3335;
            if (!_3331)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3337 = _3243;
            _3245 = _3337;
            if (!_3331)
            {
                _3167 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3339 = _3167;
            _3169 = _3339;
            if (!_3331)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3341 = _3173;
            _3175 = _3341;
            if (!_3331)
            {
                _3183 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3343 = _3183;
            bool _3345 = !_3331;
            _3185 = _3343;
            if (!_3345)
            {
                bool _3347 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3349 = isnan(_2760);
                bool _3351 = _3347 || _3349;
                bool _3353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3355 = _3351 || _3353;
                if (!_3355)
                {
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3359 = _2760 + _3357;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3363 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3361;
                    float _3365 = 1.0 / _3363;
                    float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3387 = _3359 * _3365;
                    float _3389 = precise::clamp(_3387, 0.0, 1.0);
                    float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3395 = fma(_3389, _3369, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3397 = fma(_3389, _3393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3399 = fma(_3389, _3373, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3401 = fma(_3389, _3377, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3403 = fma(_3389, _3381, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3405 = fma(_3389, _3385, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3259 = _3397;
                    _3175 = _3403;
                    _3251 = _3395;
                    _3169 = _3401;
                    _3245 = _3399;
                    _3185 = _3405;
                    _3321 = true;
                }
                else
                {
                    _3259 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3251 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3169 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3185 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3321 = false;
    float _3407 = _3259;
    float _3409 = _3175;
    float _3411 = _3251;
    float _3413 = _3169;
    float _3415 = _3245;
    float _3417 = _3185;
    float _3419 = fma(_2646, -0.5, 0.5);
    float _3421 = precise::clamp(_3419, 0.0, 1.0);
    float _3423 = -_3407;
    float _3425 = _3423 + _3409;
    float _3427 = -_3411;
    float _3429 = _3427 + _3413;
    float _3431 = -_3415;
    float _3433 = _3431 + _3417;
    bool _3435 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3437 = fma(_3421, _3425, _3407);
    float _3439 = fma(_3421, _3429, _3411);
    float _3441 = fma(_3421, _3433, _3415);
    float _3443 = _3437 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _3445 = fma(_3439, 0.298911988735198974609375, _3443);
    float _3447 = fma(_3441, 0.114477999508380889892578125, _3445);
    out.m_90.x = 0.0;
    float _3449 = -_3447;
    float _3451 = _3439 + _3449;
    float _3453 = -_3447;
    float _3455 = _3437 + _3453;
    float _3457 = -_3447;
    float _3459 = _3441 + _3457;
    float _3461 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3463 = fma(_3451, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    float _3465 = fma(_3455, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    float _3467 = fma(_3459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    out.m_86.w = _3461;
    out.m_92.x = _3463;
    out.m_92.y = _3465;
    out.m_92.z = _3467;
    if (!_3435)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3469 = -_2730;
    float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3473 = -_2736;
    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3477 = -_2742;
    float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3481 = _3471 * _3471;
    float _3483 = fma(_3475, _3475, _3481);
    float _3485 = fma(_3479, _3479, _3483);
    float _3487 = sqrt(_3485);
    float _3489 = rsqrt(_3485);
    float _3491 = -_3487;
    float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3495 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3497 = precise::clamp(_3495, 0.0, 1.0);
    float _3499 = _3475 * _3489;
    float _3501 = _3471 * _3489;
    float _3503 = abs(_3497);
    float _3505 = log2(_3503);
    float _3507 = _3479 * _3489;
    float _3509 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3511 = _2646 * _3501;
    float _3513 = -_3501;
    float _3515 = -_3509;
    float _3517 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3515);
    float _3519 = fma(_2608, _3499, _3511);
    float _3521 = -_3507;
    float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3517);
    float _3525 = fma(_2648, _3507, _3519);
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3531 = _3523 + _3529;
    float _3533 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3537 = precise::clamp(_3535, 0.0, 1.0);
    float _3539 = exp2(_3533);
    float _3541 = _3539 * _3537;
    float _3543 = _3527 * _3541;
    float _3545 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3549 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3545;
    out.m_90.y = _3547;
    out.m_90.z = _3549;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3321 = false;
    bool _2690 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_50.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_127);
        out.gl_Position.z = _3606;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_55.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_53.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3676 = as_type<float>(_165);
        out.gl_Position.z = _3676;
    }
    if (_157)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _189 = _181;
    float _207;
    if (!_187)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_111);
        float _213 = 1.0 / _211;
        float _215 = _145 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    float _223 = in.m_60.z;
    float _225 = in.m_60.w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _217 + _231;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _237 = _235 != 0;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _251 = 1.0 / _243;
    float _253 = float(_111);
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _257 = _221 * 2.0;
    float _259 = _219 * 2.0;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _263 = 1.0 / _247;
    float _265 = _219 + _221;
    float _267 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _269 = -_239;
    float _271 = fma(_261, 2.0, _269);
    float _273 = _265 + (-1.0);
    int _275 = as_type<int>(_265);
    float _277 = _253;
    if (_237)
    {
        _275 = 0;
    }
    int _279 = _275;
    float _281 = fma(_267, -2.0, _249);
    float _283 = floor(_259);
    int _285 = _279;
    if (!_237)
    {
        _285 = 1;
    }
    int _287 = _285;
    float _289 = _223 + _219;
    float _291 = _233 * _251;
    bool _293 = _287 != 1;
    float _295 = _289 + (-1.0);
    float _297 = _223 + _221;
    float _299 = floor(_257);
    float _301 = _223 * 2.0;
    float _303 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _305 = _229 * _263;
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _309 = _297 + (-1.0);
    float _311 = floor(_301);
    bool _313 = _283 > 0.0;
    float _315 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _317 = _283 >= 0.0;
    bool _319 = isnan(_283);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _329 = _309;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_293)
    {
        _329 = _223;
    }
    float _333 = _329;
    float _335 = -_145;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[76].x, _271);
    int _339 = _325 ? 0 : 1;
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _343 = int(_341);
    bool _345 = _299 > 0.0;
    float _347 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _281);
    bool _349 = _299 >= 0.0;
    bool _351 = isnan(_299);
    bool _353 = _349 || _351;
    bool _355 = isnan(0.0);
    bool _357 = _353 || _355;
    int _359 = ~_339;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    int _365 = _357 ? 0 : 1;
    float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _369 = log2(_367);
    bool _371 = _311 > 0.0;
    bool _373 = _311 >= 0.0;
    bool _375 = isnan(_311);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    int _383 = ~_365;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    int _389 = _363;
    int _391 = _387;
    float _393 = _333;
    if (!_313)
    {
        int _395 = ~_339;
        int _397 = _395 + 1;
        _389 = _397;
    }
    int _399 = _389;
    float _401 = 1.0 / _253;
    int _403 = _381 ? 0 : 1;
    if (!_345)
    {
        int _405 = ~_365;
        int _407 = _405 + 1;
        _391 = _407;
    }
    int _409 = _391;
    int _411 = ~_403;
    int _413 = _411 + 1;
    int _415 = _413 + 1;
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _419 = int(_417);
    int _421 = _415;
    if (!_371)
    {
        int _423 = ~_403;
        int _425 = _423 + 1;
        _421 = _425;
    }
    int _427 = _421;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_293)
    {
        _393 = _221;
    }
    float _431 = _393;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _443 = _441 != 0;
    float _445 = _431;
    if (!_293)
    {
        _331 = _221;
    }
    float _447 = _331;
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[83].w, _429);
    float _451 = _447;
    if (_293)
    {
        _451 = _219;
    }
    float _453 = _451;
    bool _455 = !_439;
    int _457 = _455 ? 0 : 1;
    bool _459 = !_435;
    int _461 = _459 ? 0 : 1;
    float _463 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[83].z, _255);
    bool _465 = !_443;
    int _467 = _465 ? 0 : 1;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _479 = _477 != 0;
    float _481 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    if (!_293)
    {
        _277 = _223;
    }
    float _483 = _277;
    float _485 = float(_343);
    bool _487 = !_471;
    int _489 = _487 ? 0 : 1;
    float _491 = _483;
    if (!_293)
    {
        _445 = _221;
    }
    float _493 = _445;
    float _495 = 1.0 / _485;
    float _497 = _493;
    if (_293)
    {
        _491 = _221;
    }
    float _499 = _491;
    if (_293)
    {
        _497 = _219;
    }
    float _501 = _497;
    int _503 = abs(_489);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _511 = float(_503);
    float _513 = float(_427);
    float _515 = -_505;
    float _517 = fma(_509, 2.0, _515);
    bool _519 = !_475;
    int _521 = _519 ? 0 : 1;
    float _523 = fma(_507, -2.0, _327);
    float _525 = _511 * _513;
    int _527 = abs(_521);
    float _529 = _369 * _145;
    float _531 = in.m_62.x;
    float _533 = in.m_62.y;
    float _535 = in.m_62.z;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _539 = 1.0 + _537;
    float _541 = float(_419);
    float _543 = exp2(_529);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _547 = float(_399);
    float _549 = float(_527);
    float _551 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _545);
    float _553 = 1.0 / _541;
    bool _555 = !_479;
    int _557 = _555 ? 0 : 1;
    float _559 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _551);
    bool _561 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _563 = isnan(1.0);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _569 = _565 || _567;
    float _571 = _525 * (-2.0);
    float _573 = _549 * _547;
    int _575 = abs(_557);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _579 = 1.0 / _539;
    float _581 = -_543;
    float _583 = _581 + 1.0;
    bool _585 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _593 = _589 || _591;
    float _595 = fma(_571, _531, _531);
    float _597 = _401 * _145;
    float _599 = float(_409);
    float _601 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].z, _577);
    float _603 = float(_575);
    float _605 = _495 * _145;
    float _607 = _593 ? _583 : 0.0;
    float _609 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _601);
    float _611 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _449);
    float _613 = _603 * _599;
    float _615 = _553 * _145;
    float _617 = -_145;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[81].x, _517);
    float _621 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _523);
    float _623 = _573 * (-2.0);
    if (_569)
    {
        float _625 = _607 * _579;
        _147 = _625;
    }
    float _627 = _147;
    float _629 = _219 + (-0.5);
    float _631 = _613 * (-2.0);
    float _633 = _221 + (-0.5);
    float _635 = fma(_623, _533, _533);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _641;
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _595);
    float _647 = fma(_631, _535, _535);
    float _649 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _635);
    float _651 = fma(_303, _571, _303);
    float _653 = _223 + (-0.5);
    float _655 = fma(_639, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = fma(_643, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _659 = fma(_315, _623, _315);
    bool _661 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _663 = isnan(_217);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].z, _647);
    float _675 = fma(_307, _631, _307);
    float _677 = fma(_659, _627, _649);
    bool _679 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _681 = isnan(_217);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -_671;
    float _693 = _691 + 1.0;
    bool _695 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _697 = isnan(_217);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = in.m_64.x;
    float _709 = in.m_64.y;
    float _711 = _677 * 0.15915493667125701904296875;
    float _713 = _689 * _693;
    float _715 = -_689;
    float _717 = _715 + 1.0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = fma(_651, _627, _645);
    float _729 = _705 * _717;
    float _731 = -_705;
    float _733 = _731 + 1.0;
    float _735 = fma(_721, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _737 = fma(_725, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _739 = _657 * _729;
    float _741 = _655 * _729;
    float _743 = fma(_675, _627, _673);
    float _745 = _727 * 0.15915493667125701904296875;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _739);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _741);
    float _751 = _743 * 0.15915493667125701904296875;
    float _753 = _745 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = fma(_735, _713, _747);
    float _759 = fma(_737, _713, _749);
    float _761 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[145].y, _757);
    float _763 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[145].x, _759);
    float _765 = _711 * 6.283185482025146484375;
    float _767 = sin(_765);
    float _769 = _761 * _709;
    float _771 = _763 * _707;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _777 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _711 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _777 * _773;
    float _787 = _779 * _775;
    float _789 = in.m_50.x;
    float _791 = in.m_50.y;
    float _793 = in.m_50.z;
    float _795 = _745 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _755 * _767;
    float _801 = _751 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = _755 * _783;
    float _807 = _751 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _797 * _767;
    float _813 = _797 * _783;
    float _815 = _755 * _803;
    float _817 = _783 * _803;
    float _819 = _797 * _803;
    float _821 = _767 * _803;
    float _823 = _815 * _785;
    float _825 = _819 * _785;
    float _827 = fma(_809, _805, _811);
    float _829 = -_799;
    float _831 = fma(_809, _813, _829);
    float _833 = -_813;
    float _835 = fma(_809, _799, _833);
    float _837 = -_785;
    float _839 = _809 * _837;
    float _841 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _843 = fma(_827, _787, _823);
    float _845 = fma(_809, _811, _805);
    float _847 = fma(_817, _787, _839);
    float _849 = fma(_831, _787, _825);
    float _851 = fma(_835, _841, _843);
    float _853 = _791 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = fma(_821, _841, _847);
    float _857 = _791 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _859 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _863 = fma(_845, _841, _849);
    float _865 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[4].x, _857);
    float _867 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _861);
    float _873 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    float _875 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[6].z, _867);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].z, _869);
    float _879 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _881 = _873 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _883 = _875 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _889 = _791 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _891 = _881 + _885;
    float _893 = _883 + _887;
    float _895 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[5].x, _889);
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _899 = _891 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _903 = _893 + _901;
    float _905 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[5].z, _895);
    float _907 = _899 * _899;
    float _909 = _903 * _903;
    float _911 = _905 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _915 = _907 + _909;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = 0.0;
    float _927 = _851;
    float _929 = _905;
    float _931 = _891;
    float _933 = _893;
    if (_919)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _935;
    }
    float _937 = _925;
    float _939 = _937;
    if (_919)
    {
        float _941 = _923 * _937;
        _939 = _941;
    }
    float _943 = _939;
    float _945 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _947 = _943;
    if (_919)
    {
        float _949 = rsqrt(_915);
        _927 = _949;
    }
    float _951 = _927;
    if (_919)
    {
        float _953 = _943 * 0.15915493667125701904296875;
        _947 = _953;
    }
    float _955 = _947;
    float _957 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _945);
    float _959 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    float _961 = _789;
    if (_919)
    {
        float _963 = _955 * 6.283185482025146484375;
        float _965 = sin(_963);
        _961 = _965;
    }
    float _967 = _961;
    float _969 = _959 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _971 = _911 + _969;
    float _973 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _975 = floor(_913);
    float _977 = _971;
    if (_919)
    {
        float _979 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _929 = _979;
    }
    float _981 = _929;
    float _983 = floor(_973);
    float _985 = _981;
    if (_919)
    {
        float _987 = fma(_967, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _987;
    }
    float _989 = _985;
    float _991 = _989;
    if (_919)
    {
        float _993 = _951 * _989;
        _991 = _993;
    }
    float _995 = _991;
    float _997 = -_975;
    float _999 = _913 + _997;
    if (_919)
    {
        float _1001 = fma(_899, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _931 = _1001;
    }
    float _1003 = _931;
    if (_919)
    {
        float _1005 = fma(_903, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _933 = _1005;
    }
    float _1007 = _933;
    float _1009 = fma(_1003, 6.2500002968590706586837768554688e-05, 0.5);
    float _1011 = fma(_1007, 6.2500002968590706586837768554688e-05, 0.5);
    float _1013 = -_983;
    float _1015 = _973 + _1013;
    float2 _5006 = float2(_1009, _1011);
    float3 _1019 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5006, float2(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5006, float2(0.0), isnan(_5006)), level(0.0)).xyz;
    float _1021 = _1019.x;
    float _1023 = _1019.y;
    float _1025 = _1019.z;
    float2 _5022 = float2(_999, _1015);
    float _1027 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5022, float2(0.0), isnan(_5022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5022, float2(0.0), isnan(_5022)), level(0.0)).x;
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1031 = int(_1029);
    float _1033 = 0.0;
    if (_237)
    {
        _1033 = 1.0;
    }
    float _1035 = _1033;
    float _1037 = -_611;
    float _1039 = _1037 + 1.0;
    float _1041 = _1035;
    if (!_237)
    {
        _1041 = 7.345489978790283203125;
    }
    float _1043 = _1041;
    int _1045 = abs(_461);
    float _1047 = trunc(_605);
    int _1049 = int(_1047);
    float _1051 = float(uint(_1031));
    float _1053 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1055 = int(_1053);
    int _1057 = ~_1031;
    int _1059 = _1057 + 1;
    bool _1061 = _1031 == 0;
    float _1063 = float(uint(_1049));
    float _1065 = 1.0 / _1051;
    float _1067 = float(uint(_1055));
    float _1069 = trunc(_615);
    int _1071 = int(_1069);
    float _1073 = _1043 * _219;
    int _1075 = ~_1055;
    int _1077 = _1075 + 1;
    float _1079 = _1043;
    if (_237)
    {
        float _1081 = in.m_60.x;
        _1079 = _1081;
    }
    float _1083 = _1079;
    bool _1085 = _1055 == 0;
    int _1087 = as_type<int>(_1065) + (-2);
    float _1089 = 1.0 / _1067;
    float _1091 = float(_1049);
    float _1093 = _1083;
    if (!_237)
    {
        float _1095 = in.m_60.y;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = as_type<float>(_1087) * _1063;
    float _1101 = floor(_1073);
    float _1103 = trunc(_1099);
    float _1105 = precise::max(_1103, 0.0);
    uint _1108 = uint(_1105);
    int _1110 = _1059 * int(_1108);
    int _1112 = _1110 + _1049;
    float _1114 = float(uint(_1112));
    int _1116 = as_type<int>(_1089) + (-2);
    float _1118 = float(uint(_1071));
    float _1120 = as_type<float>(_1087) * _1114;
    float _1122 = float(_1031);
    float _1124 = as_type<float>(_1116) * _1118;
    bool _1126 = _1091 >= _1122;
    bool _1128 = isnan(_1091);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(_1122);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = trunc(_1120);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = -_1101;
    float _1146 = _1073 + _1144;
    int _1148 = ~_1031;
    int _1150 = _1148 + 1;
    float _1152 = trunc(_1124);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = int(_1108) + int(_1142);
    float _1160 = _1146 * _1122;
    float _1162 = trunc(_1136);
    int _1164 = int(_1162);
    float _1166 = as_type<float>(_1142);
    if (_237)
    {
        _1166 = 1.0;
    }
    float _1168 = _1166;
    int _1170 = _1150 * _1158;
    int _1172 = _1170 + _1049;
    float _1174 = _1168;
    if (!_237)
    {
        _1174 = 1.2345600128173828125;
    }
    float _1176 = _1174;
    int _1178 = _1077 * int(_1156);
    int _1180 = _1178 + _1071;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1184 = _1182 != 0;
    float _1186 = trunc(_1160);
    int _1188 = int(_1186);
    bool _1190 = uint(_1172) >= uint(_1031);
    float _1192 = _1097 * _1176;
    float _1194 = float(uint(_1180));
    float _1196 = _1122 * _597;
    bool _1198 = !_1190;
    int _1200 = _1198 ? 0 : (-1);
    float _1202 = as_type<float>(_1116) * _1194;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1206 = _1204 != 0;
    float _1208 = trunc(_1196);
    int _1210 = int(_1208);
    int _1212 = ~_1158;
    int _1214 = _1212 + _1200;
    int _1216 = _1214 + 1;
    bool _1218 = !_1206;
    int _1220 = _1218 ? 0 : 1;
    int _1222 = abs(_1220);
    float _1224 = trunc(_1202);
    float _1226 = precise::max(_1224, 0.0);
    uint _1228 = uint(_1226);
    int _1230 = _1031 * _1216;
    int _1232 = _1230 + _1049;
    int _1234 = ~_1055;
    int _1236 = _1234 + 1;
    int _1238 = ~_1164;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    bool _1244 = !_1061;
    int _1246 = _1244 ? _1232 : (-1);
    int _1248 = _1188 * _1222;
    int _1250 = _1248 + _1049;
    int _1252 = _1031 + (-1);
    int _1254 = _1246 * _1242;
    float _1256 = floor(_1192);
    int _1258 = int(_1156) + int(_1228);
    int _1260 = _1164 * _1252;
    int _1262 = _1260 + _1254;
    int _1264 = abs(_457);
    float _1266 = float(_1055);
    int _1268 = _1236 * _1258;
    int _1270 = _1268 + _1071;
    float _1272 = float(_1071);
    int _1274 = _1262 * _1264;
    bool _1276 = uint(_1270) >= uint(_1055);
    int _1278 = _1210 * _1045;
    int _1280 = _1278 + _1274;
    bool _1282 = _1272 >= _1266;
    bool _1284 = isnan(_1272);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(_1266);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = -_1256;
    float _1296 = _1192 + _1294;
    int _1298 = abs(_467);
    bool _1300 = !_1276;
    int _1302 = _1300 ? 0 : (-1);
    float _1304 = trunc(_1292);
    int _1306 = int(_1304);
    bool _1308 = !_1184;
    int _1310 = _1308 ? 0 : 1;
    int _1312 = _1250 * _1298;
    int _1314 = _1312 + _1280;
    int _1316 = ~_1258;
    int _1318 = _1316 + _1302;
    int _1320 = _1318 + 1;
    int _1322 = abs(_1310);
    float _1324 = _1296 * _1266;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1328 = _1326 != 0;
    int _1330 = _1055 * _1320;
    int _1332 = _1330 + _1071;
    float _1334 = _1266 * _597;
    int _1336 = _1188 * _1322;
    int _1338 = _1336 + _1314;
    bool _1340 = !_1328;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = trunc(_1324);
    int _1346 = int(_1344);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1085;
    int _1366 = _1364 ? _1332 : (-1);
    int _1368 = ~_1306;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    bool _1374 = !_1354;
    int _1376 = _1374 ? 0 : 1;
    float _1378 = trunc(_1334);
    int _1380 = int(_1378);
    int _1382 = abs(_1342);
    int _1384 = _1366 * _1372;
    float _1386 = float(uint(_1338));
    int _1388 = _1055 + (-1);
    bool _1390 = !_1350;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = as_type<float>(_1087) * _1386;
    int _1396 = abs(_1376);
    int _1398 = _1306 * _1388;
    int _1400 = _1398 + _1384;
    int _1402 = abs(_1392);
    int _1404 = _1346 * _1382;
    int _1406 = _1404 + _1071;
    float _1408 = trunc(_1394);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    int _1414 = _1400 * _1396;
    bool _1416 = !_1358;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = ~_1031;
    int _1422 = _1420 + 1;
    int _1424 = _1380 * _1402;
    int _1426 = _1424 + _1414;
    bool _1428 = !_1362;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = abs(_1418);
    int _1434 = abs(_1430);
    float _1436 = float(uint(_1406));
    int _1438 = _1406 * _1432;
    int _1440 = _1438 + _1426;
    float _1442 = float(uint(_1250));
    int _1444 = _1422 * int(_1412);
    int _1446 = _1444 + _1338;
    int _1448 = ~_1055;
    int _1450 = _1448 + 1;
    int _1452 = _1346 * _1434;
    int _1454 = _1452 + _1440;
    float _1456 = as_type<float>(_1116) * _1436;
    float _1458 = as_type<float>(_1087) * _1442;
    float _1460 = float(uint(_1446));
    float _1462 = float(uint(_1454));
    float _1464 = trunc(_1456);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    int _1470 = ~_1055;
    int _1472 = _1470 + 1;
    float _1474 = as_type<float>(_1087) * _1460;
    float _1476 = as_type<float>(_1116) * _1462;
    float _1478 = trunc(_1474);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    float _1484 = trunc(_1458);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = _1472 * int(_1468);
    int _1492 = _1490 + _1406;
    int _1494 = ~_1031;
    int _1496 = _1494 + 1;
    float _1498 = float(uint(_1492));
    float _1500 = trunc(_1476);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    int _1506 = ~_1031;
    int _1508 = _1506 + 1;
    int _1510 = int(_1412) + int(_1482);
    float _1512 = as_type<float>(_1116) * _1498;
    int _1514 = _1508 * int(_1488);
    int _1516 = _1514 + _1250;
    float _1518 = trunc(_1512);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    float _1524 = float(uint(_1516));
    int _1526 = _1450 * int(_1504);
    int _1528 = _1526 + _1454;
    float _1530 = as_type<float>(_1087) * _1524;
    float _1532 = float(uint(_1528));
    int _1534 = _1496 * _1510;
    int _1536 = _1534 + _1338;
    float _1538 = trunc(_1530);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = as_type<float>(_1116) * _1532;
    bool _1546 = uint(_1536) >= uint(_1031);
    bool _1548 = !_1546;
    int _1550 = _1548 ? 0 : (-1);
    float _1552 = trunc(_1544);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = ~_1510;
    int _1560 = _1558 + _1550;
    int _1562 = _1560 + 1;
    int _1564 = ~_1031;
    int _1566 = _1564 + 1;
    int _1568 = int(_1488) + int(_1542);
    int _1570 = _1031 * _1562;
    int _1572 = _1570 + _1338;
    int _1574 = int(_1468) + int(_1522);
    out.m_66.x = _1021;
    out.m_66.y = _1023;
    out.m_66.z = _1025;
    int _1576 = ~_1055;
    int _1578 = _1576 + 1;
    bool _1580 = !_1061;
    int _1582 = _1580 ? _1572 : (-1);
    int _1584 = int(_1504) + int(_1556);
    int _1586 = _1566 * _1568;
    int _1588 = _1586 + _1250;
    int _1590 = _1582 & 3;
    bool _1592 = _1590 != 0;
    int _1594 = _1582 & 3;
    bool _1596 = _1594 != 0;
    int _1598 = _1578 * _1584;
    int _1600 = _1598 + _1454;
    bool _1602 = uint(_1590) >= 2u;
    int _1604 = _1596 ? 0 : 1;
    int _1606 = _1602 ? 0 : 1;
    bool _1608 = uint(_1600) >= uint(_1055);
    bool _1610 = uint(_1590) > 1u;
    bool _1612 = uint(_1588) >= uint(_1031);
    bool _1614 = !_1608;
    int _1616 = _1614 ? 0 : (-1);
    bool _1618 = !_1612;
    int _1620 = _1618 ? 0 : (-1);
    int _1622 = ~_1584;
    int _1624 = _1622 + _1616;
    int _1626 = _1624 + 1;
    int _1628 = ~_1568;
    int _1630 = _1628 + _1620;
    int _1632 = _1630 + 1;
    int _1634 = _1578 * _1574;
    int _1636 = _1634 + _1406;
    bool _1638 = _225 > 0.5;
    int _1640 = _1055 * _1626;
    int _1642 = _1640 + _1454;
    int _1644 = ~_1604;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    int _1650 = _1031 * _1632;
    int _1652 = _1650 + _1250;
    int _1654 = _1648;
    if (!_1610)
    {
        int _1656 = ~_1604;
        int _1658 = _1656 + 1;
        _1654 = _1658;
    }
    int _1660 = _1654;
    int _1662 = _1582 >> 31;
    bool _1664 = uint(_1636) >= uint(_1055);
    bool _1666 = !_1085;
    int _1668 = _1666 ? _1642 : (-1);
    int _1670 = _1662 & 3;
    bool _1672 = _1590 != 3;
    bool _1674 = !_1664;
    int _1676 = _1674 ? 0 : (-1);
    int _1678 = _1668 >> 31;
    bool _1680 = !_1061;
    int _1682 = _1680 ? _1652 : (-1);
    int _1684 = _1582 + _1670;
    float _1686 = -_185;
    int _1688 = _1638 ? as_type<int>(_1686) : as_type<int>(_185);
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1692 = _1690 != 0;
    int _1694 = ~_1574;
    int _1696 = _1694 + _1676;
    int _1698 = _1696 + 1;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1702 = _1700 != 0;
    int _1704 = _1678 & 3;
    int _1706 = _1684 >> 2;
    bool _1708 = !_1692;
    int _1710 = _1708 ? 0 : 1;
    bool _1712 = !_1702;
    int _1714 = _1712 ? 0 : 1;
    int _1716 = _1668 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1668 + _1704;
    int _1722 = _1668 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = _1706 << 4;
    int _1728 = _1726 + 368;
    int _1730 = ~_1606;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    int _1736 = _1734;
    if (_1672)
    {
        int _1738 = ~_1606;
        int _1740 = _1738 + 1;
        _1736 = _1740;
    }
    int _1742 = _1736;
    int _1744 = _1055 * _1698;
    int _1746 = _1744 + _1406;
    bool _1748 = !_1592;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = _1718 ? 0 : 1;
    int _1754 = _1720 >> 2;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1758 = _1756 != 0;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1762 = _1760 != 0;
    bool _1764 = !_1724;
    int _1766 = _1764 ? 0 : 1;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1770 = _1768 != 0;
    bool _1772 = _1590 != 3;
    bool _1774 = uint(_1722) > 1u;
    uint _1776 = uint(int(uint(_1728) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = _1754 << 4;
    int _1794 = _1792 + 512;
    int _1796 = ~_1752;
    int _1798 = _1796 + 1;
    int _1800 = _1798 + 1;
    bool _1802 = !_1772;
    int _1804 = _1802 ? 0 : (-1);
    bool _1806 = uint(_1722) >= 2u;
    uint _1808 = uint(int(uint(_1794) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    int _1824 = _1806 ? 0 : 1;
    int _1826 = _1800;
    if (!_1774)
    {
        int _1828 = ~_1752;
        int _1830 = _1828 + 1;
        _1826 = _1830;
    }
    int _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1836 = _1722 != 3;
    int _1838 = _1794 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    bool _1856 = _1722 != 3;
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1860 = ~_1824;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = _1728 + 8;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
    int _1872 = int(_1868) & 3;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[int(_1870)][_1872];
    int _1876 = int(_1868) + 1;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    int _1880 = _1876 & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = abs(_1660);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1888 = abs(_1750);
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1892 = _1864;
    if (_1836)
    {
        int _1894 = ~_1824;
        int _1896 = _1894 + 1;
        _1892 = _1896;
    }
    int _1898 = _1892;
    float _1900 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1902 = !_1856;
    int _1904 = _1902 ? 0 : (-1);
    int _1906 = abs(_1832);
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1910 = _219 > 0.5;
    float _1912 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1914 = !_1085;
    int _1916 = _1914 ? _1746 : (-1);
    float _1918 = -_181;
    int _1920 = _1910 ? as_type<int>(_1918) : as_type<int>(_181);
    out.m_68.x = _1912;
    out.m_68.y = _1858;
    out.m_68.z = _1900;
    out.m_68.w = _1890;
    bool _1922 = _221 > 0.5;
    bool _1924 = _223 > 0.5;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1928 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1930 = _1928 != 0;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1936 = int(_1934);
    int _1938 = ~_1884;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1948 = _1942 * as_type<int>(_1790);
    int _1950 = ~_1888;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1958 = abs(_1766);
    float _1960 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1962 = ~_1906;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1954 * as_type<int>(_1782);
    int _1970 = _1968 + _1948;
    int _1972 = ~_1958;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1980 = int(_1978);
    out.m_70.x = _1946;
    out.m_70.y = _1956;
    out.m_70.z = _1960;
    int _1982 = _1966 * as_type<int>(_1822);
    int _1984 = abs(_1904);
    float _1986 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1988 = abs(_1742);
    int _1990 = _1976 * as_type<int>(_1814);
    int _1992 = _1990 + _1982;
    int _1994 = abs(_1898);
    int _1996 = abs(_1804);
    int _1998 = ~_1988;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = ~_1994;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = float(uint(_1936));
    int _2012 = _2002 * as_type<int>(_1874);
    int _2014 = _2012 + _1970;
    int _2016 = ~_1984;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = _2008 * as_type<int>(_1846);
    int _2024 = _2022 + _1992;
    float _2026 = float(uint(_1980));
    float _2028 = 1.0 / _2010;
    int _2030 = ~_1996;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = _2020 * as_type<int>(_1854);
    int _2038 = _2036 + _2024;
    int _2040 = abs(_1714);
    int _2042 = abs(_1936);
    int _2044 = _2034 * as_type<int>(_1882);
    int _2046 = _2044 + _2014;
    int _2048 = ~_2040;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    float _2054 = 1.0 / _2026;
    float _2056 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = abs(_1980);
    int _2060 = _2046 * _2052;
    float _2062 = float(uint(_2042));
    float _2064 = -_809;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    int _2068 = abs(_1710);
    int _2070 = _1682 * _2040;
    int _2072 = _2070 + _2060;
    float _2074 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2076 = float(uint(_2058));
    float _2078 = 1.0 / _2062;
    int _2080 = ~_2068;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    float _2086 = -_809;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2074);
    float _2090 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2066);
    float _2092 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2094 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2096 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2088);
    int _2098 = as_type<int>(_2028) + (-2);
    float _2100 = 1.0 / _2076;
    int _2102 = as_type<int>(_2054) + (-2);
    int _2104 = _2038 * _2084;
    float _2106 = float(uint(_2072));
    float _2108 = -_809;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2094);
    bool _2112 = !_1758;
    float _2114 = _2112 ? _185 : as_type<float>(_1688);
    int _2116 = _1916 * _2068;
    int _2118 = _2116 + _2104;
    float _2120 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2122 = as_type<float>(_2098) * _2106;
    float _2124 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2092);
    int _2126 = abs(_2072);
    float _2128 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2130 = float(uint(_2118));
    float _2132 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    float _2134 = trunc(_2122);
    float _2136 = precise::max(_2134, 0.0);
    uint _2138 = uint(_2136);
    int _2140 = abs(_2118);
    float _2142 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    int _2144 = as_type<int>(_2078) + (-2);
    float _2146 = as_type<float>(_2102) * _2130;
    float _2148 = float(uint(_2126));
    float _2150 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2120);
    int _2152 = as_type<int>(_2100) + (-2);
    float _2154 = _2110;
    float _2156 = _2150;
    float _2158 = _2096;
    if (_919)
    {
        float _2160 = _955 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2154 = _2162;
    }
    float _2164 = _2154;
    int _2166 = ~_1936;
    int _2168 = _2166 + 1;
    float _2170 = as_type<float>(_2144) * _2148;
    float _2172 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2174 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2176 = !_1930;
    float _2178 = _2176 ? _181 : as_type<float>(_1920);
    float _2180 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2124);
    float _2182 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2172);
    float _2184 = trunc(_2146);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = float(uint(_2140));
    int _2192 = _2168 * int(_2138);
    int _2194 = _2192 + _2072;
    float _2196 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2174);
    float _2198 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2182);
    bool _2200 = _1980 == 0;
    float _2202 = as_type<float>(_2152) * _2190;
    float _2204 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1986);
    float _2206 = trunc(_2170);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    float _2212 = float(uint(_2194));
    float _2214 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    int _2216 = ~_1980;
    int _2218 = _2216 + 1;
    float _2220 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2204);
    int _2222 = ~_2058;
    int _2224 = _2222 + 1;
    float _2226 = as_type<float>(_2098) * _2212;
    float _2228 = trunc(_2202);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = ~_2042;
    int _2236 = _2234 + 1;
    float _2238 = as_type<float>(_2218);
    float _2240 = as_type<float>(_2224);
    float _2242 = _2202;
    if (_919)
    {
        float _2244 = _2164 + (-1.0);
        _2238 = _2244;
    }
    float _2246 = _2238;
    int _2248 = _2218 * int(_2188);
    int _2250 = _2248 + _2118;
    float _2252 = _2246;
    if (!_919)
    {
        _2240 = _907;
    }
    float _2254 = _2240;
    float _2256 = _2254;
    if (_919)
    {
        float _2258 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2252 = _2258;
    }
    float _2260 = _2252;
    int _2262 = _2236 * int(_2210);
    int _2264 = _2262 + _2126;
    float _2266 = float(uint(_2250));
    if (_919)
    {
        float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2270 = _1003 + _2268;
        _2242 = _2270;
    }
    float _2272 = _2242;
    float _2274 = trunc(_2226);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    if (_919)
    {
        float _2280 = fma(_971, _2164, _2260);
        _977 = _2280;
    }
    float _2282 = _977;
    float _2284 = -_185;
    int _2286 = _1922 ? as_type<int>(_2284) : as_type<int>(_185);
    float _2288 = as_type<float>(_2102) * _2266;
    if (_919)
    {
        float _2290 = _2272 * _2272;
        _2256 = _2290;
    }
    float _2292 = _2256;
    int _2294 = _2224 * int(_2232);
    int _2296 = _2294 + _2140;
    float _2298 = float(uint(_2264));
    float _2300 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2302 = -_181;
    int _2304 = _1924 ? as_type<int>(_2302) : as_type<int>(_181);
    float _2306 = float(uint(_2296));
    float _2308 = as_type<float>(_2144) * _2298;
    float _2310 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    float _2312 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2314 = _2300 * _2132;
    float _2316 = as_type<float>(_2152) * _2306;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2320 = _2282 + _2318;
    float _2322 = trunc(_2288);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    bool _2328 = !_1762;
    float _2330 = _2328 ? _185 : as_type<float>(_2286);
    float _2332 = _2300 * _2090;
    float _2334 = fma(_2320, _2320, _2292);
    int _2336 = int(_2138) + int(_2278);
    int _2338 = ~_1936;
    int _2340 = _2338 + 1;
    float _2342 = trunc(_2308);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    bool _2348 = !_1770;
    float _2350 = _2348 ? _181 : as_type<float>(_2304);
    float _2352 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2150);
    if (!_919)
    {
        _189 = _909;
    }
    float _2354 = _189;
    float _2356 = fma(_2312, _2310, _2314);
    int _2358 = ~_1980;
    int _2360 = _2358 + 1;
    int _2362 = _2340 * _2336;
    int _2364 = _2362 + _2072;
    float _2366 = _2354;
    if (_919)
    {
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2370 = _1007 + _2368;
        _2156 = _2370;
    }
    float _2372 = _2156;
    float _2374 = trunc(_2316);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = int(_2188) + int(_2326);
    float _2382 = _2300 * _2096;
    int _2384 = ~_2042;
    int _2386 = _2384 + 1;
    if (_919)
    {
        float _2388 = _2372 * _2372;
        _2366 = _2388;
    }
    float _2390 = _2366;
    bool _2392 = uint(_2364) >= uint(_1936);
    int _2394 = _2360 * _2380;
    int _2396 = _2394 + _2118;
    int _2398 = ~_2058;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2312, _2352, _2332);
    int _2404 = int(_2210) + int(_2346);
    float _2406 = fma(_2312, _2180, _2382);
    float _2408 = _2334 + _2390;
    bool _2410 = uint(_2396) >= uint(_1980);
    out.m_72.x = _2352;
    out.m_72.y = _2180;
    out.m_72.z = _2310;
    bool _2412 = !_2392;
    int _2414 = _2412 ? 0 : (-1);
    int _2416 = _2386 * _2404;
    int _2418 = _2416 + _2126;
    int _2420 = int(_2232) + int(_2378);
    float _2422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2424 = ~_2336;
    int _2426 = _2424 + _2414;
    int _2428 = _2426 + 1;
    bool _2430 = uint(_2418) >= uint(_2042);
    int _2432 = _2400 * _2420;
    int _2434 = _2432 + _2140;
    bool _2436 = !_2410;
    int _2438 = _2436 ? 0 : (-1);
    bool _2440 = _1936 == 0;
    float _2442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2444 = uint(_2434) >= uint(_2058);
    int _2446 = _1936 * _2428;
    int _2448 = _2446 + _2072;
    int _2450 = ~_2380;
    int _2452 = _2450 + _2438;
    int _2454 = _2452 + 1;
    int _2456 = _2072 ^ _1936;
    int _2458 = _2118 ^ _1980;
    int _2460 = _1980 * _2454;
    int _2462 = _2460 + _2118;
    bool _2464 = _1936 == 0;
    float _2466 = sqrt(_2408);
    bool _2468 = !_2430;
    int _2470 = _2468 ? 0 : (-1);
    uint _2472 = uint(int(uint(_2456) >> uint(31)));
    bool _2474 = !_2444;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2480 = !_2440;
    int _2482 = _2480 ? _2448 : (-1);
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2486 = uint(int(uint(_2458) >> uint(31)));
    int _2488 = ~_2470;
    int _2490 = _2404 + _2488;
    int _2492 = _2490 + 1;
    int _2494 = ~int(_2472);
    int _2496 = _2494 + 1;
    float _2498 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2500 = ~_2476;
    int _2502 = _2420 + _2500;
    int _2504 = _2502 + 1;
    float _2506 = float(_2482);
    int _2508 = ~int(_2486);
    int _2510 = _2508 + 1;
    float _2512 = fma(_2300, _2300, 1.0);
    int _2514 = _2492 ^ _2496;
    float _2516 = fma(_2498, _2506, _337);
    bool _2518 = _1980 == 0;
    float _2520 = rsqrt(_2512);
    bool _2522 = !_2200;
    int _2524 = _2522 ? _2462 : (-1);
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2528 = ~_2496;
    int _2530 = _2528 + _2514;
    int _2532 = _2530 + 1;
    float _2534 = _2178 + 0.5;
    int _2536 = _2504 ^ _2510;
    float _2538 = float(_2524);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2542 = !_2464;
    int _2544 = _2542 ? _2532 : (-1);
    float _2546 = fma(_2498, _2534, _2516);
    int _2548 = ~_2510;
    int _2550 = _2548 + _2536;
    int _2552 = _2550 + 1;
    float _2554 = fma(_2526, _2538, _619);
    float _2556 = float(_2544);
    bool _2558 = !_2518;
    int _2560 = _2558 ? _2552 : (-1);
    float _2562 = _2300 * _2520;
    bool _2564 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2566 = isnan(_2466);
    bool _2568 = _2564 || _2566;
    bool _2570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2572 = _2568 || _2570;
    float _2574 = -_347;
    float _2576 = fma(_2478, _2556, _2574);
    float _2578 = float(_2560);
    float _2580 = _2350 + 0.5;
    float _2582 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2584 = _2330 + (-0.5);
    float _2586 = fma(_2526, _2580, _2554);
    float _2588 = -_2198;
    float _2590 = _2562 * _2588;
    float _2592 = -_621;
    float _2594 = fma(_2582, _2578, _2592);
    float _2596 = -_2478;
    float _2598 = fma(_2596, _2584, _2576);
    float _2600 = _2114 + (-0.5);
    float _2602 = -_2214;
    float _2604 = _2562 * _2602;
    float _2606 = fma(_2520, _2090, _2590);
    float _2608 = _2198 + _2402;
    float _2610 = -_2582;
    float _2612 = fma(_2610, _2600, _2594);
    float _2614 = fma(_2520, _2096, _2604);
    float _2616 = -_559;
    float _2618 = _2616 + 1.0;
    float _2620 = -_2220;
    float _2622 = _2562 * _2620;
    float _2624 = -_609;
    float _2626 = _2624 + 1.0;
    float _2628 = -_481;
    float _2630 = _2628 + 1.0;
    float _2632 = fma(_2330, _2618, _2598);
    float _2634 = fma(_2520, _2132, _2622);
    float _2636 = -_2626;
    float _2638 = fma(_2178, _2636, _2546);
    float _2640 = -_2630;
    float _2642 = fma(_2350, _2640, _2586);
    float _2644 = fma(_2114, _1039, _2612);
    float _2646 = _2214 + _2406;
    float _2648 = _2220 + _2356;
    out.m_74.x = _2606;
    out.m_74.y = _2614;
    out.m_74.z = _2634;
    float _2650 = _2546;
    float _2652 = _2614;
    float _2654 = _2638;
    if (!_2572)
    {
        _2650 = 1.0;
    }
    float _2656 = _2650;
    out.m_76.x = _2638;
    out.m_76.y = _2632;
    out.m_76.z = _2642;
    out.m_76.w = _2644;
    out.m_78.x = _2608;
    out.m_78.y = _2646;
    out.m_78.z = _2648;
    bool _2658 = !_2572;
    float _2660 = _2656;
    if (!_2658)
    {
        bool _2662 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2664 = isnan(_2466);
        bool _2666 = _2662 || _2664;
        bool _2668 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2670 = _2666 || _2668;
        if (!_2670)
        {
            float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2674 = _2466 + _2672;
            float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2678 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2676;
            float _2680 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2684 = 1.0 / _2678;
            float _2686 = _2674 * _2684;
            float _2688 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2660 = _2688;
            _2690 = true;
        }
        else
        {
            bool _2692 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2694 = isnan(_2466);
            bool _2696 = _2692 || _2694;
            bool _2698 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2700 = _2696 || _2698;
            if (!_2700)
            {
                float _2702 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2704 = _2466 + _2702;
                float _2706 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2708 = _2706 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2712 = _2710 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2714 = 1.0 / _2708;
                float _2716 = _2704 * _2714;
                float _2718 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2660 = _2718;
                _2690 = true;
            }
            else
            {
                _2660 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2690 = false;
    float _2720 = _2660;
    float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2724 = _2282 + _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2728 = _1003 + _2726;
    float _2730 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2734 = _1007 + _2732;
    float _2736 = fma(_2728, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2740 = _2730 + _2738;
    float _2742 = fma(_2734, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2746 = _2736 + _2744;
    float _2748 = _2740 * _2740;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2752 = _2742 + _2750;
    float _2754 = fma(_2746, _2746, _2748);
    float _2756 = fma(_2752, _2752, _2754);
    float _2758 = rsqrt(_2756);
    float _2760 = sqrt(_2756);
    float _2762 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2764 = _2746 * _2762;
    float _2766 = _2752 * _2762;
    float _2768 = _2764 * _2764;
    float _2770 = _2766 * _2766;
    float _2772 = _2768 + _2770;
    float _2774 = sqrt(_2772);
    bool _2776 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2780 = _2774 + _2778;
    float _2782 = _2758;
    float _2784 = _2780;
    float _2786 = _2740;
    float _2788 = _2764;
    if (_2776)
    {
        float _2790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2790;
    }
    float _2792 = _2782;
    if (_2776)
    {
        float _2794 = rsqrt(_2772);
        _2652 = _2794;
    }
    float _2796 = _2652;
    float _2798 = _2796;
    if (_2776)
    {
        float _2800 = _2780 * _2792;
        _2784 = _2800;
    }
    float _2802 = _2784;
    if (_2776)
    {
        float _2804 = _2802 * 0.15915493667125701904296875;
        _2158 = _2804;
    }
    float _2806 = _2158;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2810 = _2792;
    if (_2776)
    {
        float _2812 = _2806 * 6.283185482025146484375;
        float _2814 = sin(_2812);
        _2810 = _2814;
    }
    float _2816 = _2810;
    float _2818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2820 = precise::max(0.0, _2818);
    float _2822 = _2752;
    float _2824 = _2820;
    if (_2776)
    {
        float _2826 = _2806 * 6.283185482025146484375;
        float _2828 = cos(_2826);
        _2822 = _2828;
    }
    float _2830 = _2822;
    float _2832 = -_2762;
    float _2834 = -_2820;
    float _2836 = fma(_2740, _2832, _2834);
    if (!_2776)
    {
        _2786 = _2766;
    }
    float _2838 = _2786;
    float _2840 = _2838;
    if (_2776)
    {
        float _2842 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _2842;
    }
    float _2844 = _2824;
    float _2846 = _2816;
    float _2848 = _2844;
    if (_2776)
    {
        float _2850 = fma(_2816, _2844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2654 = _2850;
    }
    float _2852 = _2654;
    float _2854 = _2852;
    if (!_2776)
    {
        _2846 = _2836;
    }
    float _2856 = _2846;
    float _2858 = _2856;
    float _2860 = _2830;
    if (_2776)
    {
        float _2862 = _2830 + (-1.0);
        _2848 = _2862;
    }
    float _2864 = _2848;
    float _2866 = _2864;
    if (_2776)
    {
        float _2868 = _2796 * _2852;
        _2854 = _2868;
    }
    float _2870 = _2854;
    if (_2776)
    {
        float _2872 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2872;
    }
    float _2874 = _2798;
    if (_2776)
    {
        float _2876 = _2764 * _2870;
        _2788 = _2876;
    }
    float _2878 = _2788;
    if (!_2776)
    {
        _2866 = _2768;
    }
    float _2880 = _2866;
    float _2882 = _2880;
    if (_2776)
    {
        float _2884 = _2766 * _2870;
        _2840 = _2884;
    }
    float _2886 = _2840;
    if (_2776)
    {
        float _2888 = fma(_2836, _2830, _2874);
        _2858 = _2888;
    }
    float _2890 = _2858;
    if (_2776)
    {
        float _2892 = _2878 * _2878;
        _2882 = _2892;
    }
    float _2894 = _2882;
    if (!_2776)
    {
        _2860 = _2770;
    }
    float _2896 = _2860;
    float _2898 = _2896;
    if (_2776)
    {
        float _2900 = _2886 * _2886;
        _2898 = _2900;
    }
    float _2902 = _2898;
    float _2904 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2906 = fma(_2890, _2890, _2894);
    float _2908 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2904);
    float _2910 = _2906 + _2902;
    float _2912 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2916 = fma(_2760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2914);
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2908);
    float _2922 = rsqrt(_2910);
    float _2924 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2926 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2912);
    float _2928 = _2920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2930 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2932 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2924);
    float _2934 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2926);
    float _2936 = -_2918;
    float _2938 = _2936 + 1.0;
    float _2940 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2930);
    float _2942 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2944 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2932);
    float _2946 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2940);
    float _2950 = -_2942;
    float _2952 = fma(_2950, _2808, 1.0);
    float _2954 = abs(_2938);
    float _2956 = log2(_2954);
    float _2958 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2960 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2962 = _2922 * _2878;
    float _2964 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2966 = _2922 * _2890;
    float _2968 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2960);
    float _2970 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2972 = _2922 * _2886;
    float _2974 = log2(_2952);
    float _2976 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2968);
    float _2978 = -_2970;
    float _2980 = fma(_2966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2978);
    float _2982 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2976);
    float _2984 = -_2972;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2980);
    float _2988 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2990 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2992 = 1.0 / _2982;
    float _2994 = fma(_2986, -0.5, 0.5);
    float _2996 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2998 = fma(_2986, 0.5, 0.5);
    float _3000 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2990);
    float _3002 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2996);
    float _3004 = fma(_2998, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3006 = exp2(_2988);
    float _3008 = _2966 + 1.0;
    float _3010 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3002);
    float _3012 = fma(_2998, _3004, -0.212114393711090087890625);
    float _3014 = _2974 * 0.693147182464599609375;
    float _3016 = fma(_2998, _3012, 1.570728778839111328125);
    float _3018 = sqrt(_2994);
    float _3020 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3000);
    float _3022 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3010);
    float _3024 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3026 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3020);
    float _3028 = -_2966;
    float _3030 = fma(_3006, _3008, _3028);
    float _3032 = _3026 * _2992;
    float _3034 = _3022 * _2992;
    float _3036 = fma(_3032, 0.5, 0.5);
    float _3038 = fma(_3034, -0.5, 0.5);
    float _3040 = _3018 * 0.636619746685028076171875;
    float _3042 = -_3016;
    float _3044 = fma(_3040, _3042, 1.0);
    float _3046 = fma(_3030, 0.5, 0.5);
    float3 _8028 = float3(_3036, _3038, _3024);
    float _3048 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8028, float3(0.0), isnan(_8028)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8028, float3(0.0), isnan(_8028)), level(0.0)).x;
    float3 _8039 = float3(_3036, _3038, _3024);
    float4 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8039, float3(0.0), isnan(_8039)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8039, float3(0.0), isnan(_8039)), level(0.0)).xyzw;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = _3051.w;
    float2 _8055 = float2(_3044, _3046);
    float3 _3061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8055, float2(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8055, float2(0.0), isnan(_8055)), level(0.0)).xyz;
    float _3063 = _3061.x;
    float _3065 = _3061.y;
    float _3067 = _3061.z;
    float _3069 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3071 = -_1027;
    float _3073 = _3071 + 1.0;
    out.m_80.x = _2736;
    out.m_80.y = _2730;
    out.m_80.z = _2742;
    bool _3075 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3077 = isnan(_2760);
    bool _3079 = _3075 || _3077;
    bool _3081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3083 = _3079 || _3081;
    float _3085 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3069);
    float _3087 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3089 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3085);
    float _3091 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3087);
    float _3093 = _3089 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3095 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3091);
    float _3097 = 1.0 / _3093;
    float _3099 = _3095 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3101 = _3099 + _3093;
    float _3103 = _3101 * _3097;
    float _3105 = _3103 * 0.5;
    float _3107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3109 = fma(_3105, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3107);
    float _3111 = 1.0 / _3109;
    float _3113 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3115 = _3111 * _3113;
    float _3117 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3119 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3121 = abs(_3115);
    float _3123 = log2(_3121);
    float _3125 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3119);
    float _3127 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3125);
    float _3129 = exp2(_3117);
    bool _3131 = _3115 <= 8000.0;
    bool _3133 = isnan(_3115);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan(8000.0);
    bool _3139 = _3135 || _3137;
    float _3141 = float(_3139);
    float _3143 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3127);
    float _3145 = _3143 + _2982;
    out.gl_Position.x = _3026;
    out.gl_Position.y = _3022;
    out.gl_Position.z = _3143;
    out.gl_Position.w = _2982;
    float _3147 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3149 = exp2(_3147);
    float _3151 = -_3129;
    float _3153 = _3151 + 1.0;
    float _3155 = _3143;
    float _3157 = _3022;
    float _3159 = _3026;
    float _3161 = _2982;
    float _3163 = _3057;
    if (!_3083)
    {
        _3155 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3165 = _3155;
    float _3167 = _3165;
    float _3169 = _3165;
    if (!_3083)
    {
        _3157 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3171 = _3157;
    float _3173 = _3171;
    float _3175 = _3171;
    if (!_3083)
    {
        _3159 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3177 = _3159;
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = _3177;
    float _3185 = _3177;
    if (!_3083)
    {
        _3161 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3187 = _3161;
    float _3189 = fma(_3181, -2.0, 3.0);
    float _3191 = _3181 * _3181;
    float _3193 = in.m_82.x;
    float _3195 = _3191 * _3189;
    float _3197 = -_3195;
    float _3199 = _3197 + 1.0;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3195);
    float _3203 = _3141 * _3201;
    float _3205 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3207 = _3073 * _3205;
    float _3209 = precise::clamp(_3207, 0.0, 1.0);
    float _3211 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3213 = -_3209;
    float _3215 = fma(_3213, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3217 = _3145 * 0.5;
    float _3219 = _3215 * _3193;
    out.m_84.z = _3217;
    out.m_84.w = _2982;
    float _3221 = _3219 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3221;
    float _3223 = _3211 * _3048;
    float _3225 = -_3211;
    float _3227 = _3225 + 1.0;
    float _3229 = _3059 * _3223;
    float _3231 = _3067 * _3223;
    float _3233 = fma(_3063, _3229, _3053);
    float _3235 = fma(_3065, _3229, _3055);
    float _3237 = _3059 * _3227;
    float _3239 = fma(_3059, _3231, _3057);
    float _3241 = _3229;
    float _3243 = _3187;
    float _3245 = _3187;
    if (!_3083)
    {
        _3241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3247 = _3241;
    float _3249 = _3247;
    float _3251 = _3247;
    if (!_3083)
    {
        _3163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3253 = _3163;
    out.m_88.x = _3233;
    out.m_88.y = _3235;
    out.m_88.z = _3239;
    out.m_88.w = _3237;
    bool _3255 = !_3083;
    float _3257 = _3253;
    float _3259 = _3253;
    if (!_3255)
    {
        bool _3261 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3263 = isnan(_2760);
        bool _3265 = _3261 || _3263;
        bool _3267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3269 = _3265 || _3267;
        if (!_3269)
        {
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3273 = _2760 + _3271;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3277 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3275;
            float _3279 = 1.0 / _3277;
            float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3283 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3287 = _3285 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3289 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3291 = _3289 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3293 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3301 = _3273 * _3279;
            float _3303 = precise::clamp(_3301, 0.0, 1.0);
            float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3309 = fma(_3303, _3283, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3311 = fma(_3303, _3307, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3313 = fma(_3303, _3287, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3315 = fma(_3303, _3291, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3317 = fma(_3303, _3295, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3319 = fma(_3303, _3299, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3259 = _3311;
            _3175 = _3317;
            _3251 = _3309;
            _3169 = _3315;
            _3245 = _3313;
            _3185 = _3319;
            _3321 = true;
        }
        else
        {
            bool _3323 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3325 = isnan(_2760);
            bool _3327 = _3323 || _3325;
            bool _3329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3331 = _3327 || _3329;
            if (!_3331)
            {
                _3249 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3333 = _3249;
            _3251 = _3333;
            if (!_3331)
            {
                _3257 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3335 = _3257;
            _3259 = _3335;
            if (!_3331)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3337 = _3243;
            _3245 = _3337;
            if (!_3331)
            {
                _3167 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3339 = _3167;
            _3169 = _3339;
            if (!_3331)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3341 = _3173;
            _3175 = _3341;
            if (!_3331)
            {
                _3183 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3343 = _3183;
            bool _3345 = !_3331;
            _3185 = _3343;
            if (!_3345)
            {
                bool _3347 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3349 = isnan(_2760);
                bool _3351 = _3347 || _3349;
                bool _3353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3355 = _3351 || _3353;
                if (!_3355)
                {
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3359 = _2760 + _3357;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3363 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3361;
                    float _3365 = 1.0 / _3363;
                    float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3387 = _3359 * _3365;
                    float _3389 = precise::clamp(_3387, 0.0, 1.0);
                    float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3395 = fma(_3389, _3369, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3397 = fma(_3389, _3393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3399 = fma(_3389, _3373, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3401 = fma(_3389, _3377, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3403 = fma(_3389, _3381, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3405 = fma(_3389, _3385, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3259 = _3397;
                    _3175 = _3403;
                    _3251 = _3395;
                    _3169 = _3401;
                    _3245 = _3399;
                    _3185 = _3405;
                    _3321 = true;
                }
                else
                {
                    _3259 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3251 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3169 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3185 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3321 = false;
    float _3407 = _3259;
    float _3409 = _3175;
    float _3411 = _3251;
    float _3413 = _3169;
    float _3415 = _3245;
    float _3417 = _3185;
    float _3419 = fma(_2646, -0.5, 0.5);
    float _3421 = precise::clamp(_3419, 0.0, 1.0);
    float _3423 = -_3407;
    float _3425 = _3423 + _3409;
    float _3427 = -_3411;
    float _3429 = _3427 + _3413;
    float _3431 = -_3415;
    float _3433 = _3431 + _3417;
    bool _3435 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3437 = fma(_3421, _3425, _3407);
    float _3439 = fma(_3421, _3429, _3411);
    float _3441 = fma(_3421, _3433, _3415);
    float _3443 = _3437 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _3445 = fma(_3439, 0.298911988735198974609375, _3443);
    float _3447 = fma(_3441, 0.114477999508380889892578125, _3445);
    out.m_90.x = 0.0;
    float _3449 = -_3447;
    float _3451 = _3439 + _3449;
    float _3453 = -_3447;
    float _3455 = _3437 + _3453;
    float _3457 = -_3447;
    float _3459 = _3441 + _3457;
    float _3461 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3463 = fma(_3451, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    float _3465 = fma(_3455, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    float _3467 = fma(_3459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    out.m_86.w = _3461;
    out.m_92.x = _3463;
    out.m_92.y = _3465;
    out.m_92.z = _3467;
    if (!_3435)
    {
        return out;
    }
    float _3469 = -_2730;
    float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3473 = -_2736;
    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3477 = -_2742;
    float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3481 = _3471 * _3471;
    float _3483 = fma(_3475, _3475, _3481);
    float _3485 = fma(_3479, _3479, _3483);
    float _3487 = sqrt(_3485);
    float _3489 = rsqrt(_3485);
    float _3491 = -_3487;
    float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3495 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3497 = precise::clamp(_3495, 0.0, 1.0);
    float _3499 = _3475 * _3489;
    float _3501 = _3471 * _3489;
    float _3503 = abs(_3497);
    float _3505 = log2(_3503);
    float _3507 = _3479 * _3489;
    float _3509 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3511 = _2646 * _3501;
    float _3513 = -_3501;
    float _3515 = -_3509;
    float _3517 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3515);
    float _3519 = fma(_2608, _3499, _3511);
    float _3521 = -_3507;
    float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3517);
    float _3525 = fma(_2648, _3507, _3519);
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3531 = _3523 + _3529;
    float _3533 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3537 = precise::clamp(_3535, 0.0, 1.0);
    float _3539 = exp2(_3533);
    float _3541 = _3539 * _3537;
    float _3543 = _3527 * _3541;
    float _3545 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3549 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3545;
    out.m_90.y = _3547;
    out.m_90.z = _3549;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3321 = false;
    bool _2690 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_50.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_127);
        out.gl_Position.z = _3606;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_55.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_53.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3676 = as_type<float>(_165);
        out.gl_Position.z = _3676;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _189 = _181;
    float _207;
    if (!_187)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_111);
        float _213 = 1.0 / _211;
        float _215 = _145 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    float _223 = in.m_60.z;
    float _225 = in.m_60.w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _217 + _231;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _237 = _235 != 0;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _251 = 1.0 / _243;
    float _253 = float(_111);
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _257 = _221 * 2.0;
    float _259 = _219 * 2.0;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _263 = 1.0 / _247;
    float _265 = _219 + _221;
    float _267 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _269 = -_239;
    float _271 = fma(_261, 2.0, _269);
    float _273 = _265 + (-1.0);
    int _275 = as_type<int>(_265);
    float _277 = _253;
    if (_237)
    {
        _275 = 0;
    }
    int _279 = _275;
    float _281 = fma(_267, -2.0, _249);
    float _283 = floor(_259);
    int _285 = _279;
    if (!_237)
    {
        _285 = 1;
    }
    int _287 = _285;
    float _289 = _223 + _219;
    float _291 = _233 * _251;
    bool _293 = _287 != 1;
    float _295 = _289 + (-1.0);
    float _297 = _223 + _221;
    float _299 = floor(_257);
    float _301 = _223 * 2.0;
    float _303 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _305 = _229 * _263;
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _309 = _297 + (-1.0);
    float _311 = floor(_301);
    bool _313 = _283 > 0.0;
    float _315 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _317 = _283 >= 0.0;
    bool _319 = isnan(_283);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _329 = _309;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_293)
    {
        _329 = _223;
    }
    float _333 = _329;
    float _335 = -_145;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[76].x, _271);
    int _339 = _325 ? 0 : 1;
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _343 = int(_341);
    bool _345 = _299 > 0.0;
    float _347 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _281);
    bool _349 = _299 >= 0.0;
    bool _351 = isnan(_299);
    bool _353 = _349 || _351;
    bool _355 = isnan(0.0);
    bool _357 = _353 || _355;
    int _359 = ~_339;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    int _365 = _357 ? 0 : 1;
    float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _369 = log2(_367);
    bool _371 = _311 > 0.0;
    bool _373 = _311 >= 0.0;
    bool _375 = isnan(_311);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    int _383 = ~_365;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    int _389 = _363;
    int _391 = _387;
    float _393 = _333;
    if (!_313)
    {
        int _395 = ~_339;
        int _397 = _395 + 1;
        _389 = _397;
    }
    int _399 = _389;
    float _401 = 1.0 / _253;
    int _403 = _381 ? 0 : 1;
    if (!_345)
    {
        int _405 = ~_365;
        int _407 = _405 + 1;
        _391 = _407;
    }
    int _409 = _391;
    int _411 = ~_403;
    int _413 = _411 + 1;
    int _415 = _413 + 1;
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _419 = int(_417);
    int _421 = _415;
    if (!_371)
    {
        int _423 = ~_403;
        int _425 = _423 + 1;
        _421 = _425;
    }
    int _427 = _421;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_293)
    {
        _393 = _221;
    }
    float _431 = _393;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _443 = _441 != 0;
    float _445 = _431;
    if (!_293)
    {
        _331 = _221;
    }
    float _447 = _331;
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[83].w, _429);
    float _451 = _447;
    if (_293)
    {
        _451 = _219;
    }
    float _453 = _451;
    bool _455 = !_439;
    int _457 = _455 ? 0 : 1;
    bool _459 = !_435;
    int _461 = _459 ? 0 : 1;
    float _463 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[83].z, _255);
    bool _465 = !_443;
    int _467 = _465 ? 0 : 1;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _479 = _477 != 0;
    float _481 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    if (!_293)
    {
        _277 = _223;
    }
    float _483 = _277;
    float _485 = float(_343);
    bool _487 = !_471;
    int _489 = _487 ? 0 : 1;
    float _491 = _483;
    if (!_293)
    {
        _445 = _221;
    }
    float _493 = _445;
    float _495 = 1.0 / _485;
    float _497 = _493;
    if (_293)
    {
        _491 = _221;
    }
    float _499 = _491;
    if (_293)
    {
        _497 = _219;
    }
    float _501 = _497;
    int _503 = abs(_489);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _511 = float(_503);
    float _513 = float(_427);
    float _515 = -_505;
    float _517 = fma(_509, 2.0, _515);
    bool _519 = !_475;
    int _521 = _519 ? 0 : 1;
    float _523 = fma(_507, -2.0, _327);
    float _525 = _511 * _513;
    int _527 = abs(_521);
    float _529 = _369 * _145;
    float _531 = in.m_62.x;
    float _533 = in.m_62.y;
    float _535 = in.m_62.z;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _539 = 1.0 + _537;
    float _541 = float(_419);
    float _543 = exp2(_529);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _547 = float(_399);
    float _549 = float(_527);
    float _551 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _545);
    float _553 = 1.0 / _541;
    bool _555 = !_479;
    int _557 = _555 ? 0 : 1;
    float _559 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _551);
    bool _561 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _563 = isnan(1.0);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _569 = _565 || _567;
    float _571 = _525 * (-2.0);
    float _573 = _549 * _547;
    int _575 = abs(_557);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _579 = 1.0 / _539;
    float _581 = -_543;
    float _583 = _581 + 1.0;
    bool _585 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _593 = _589 || _591;
    float _595 = fma(_571, _531, _531);
    float _597 = _401 * _145;
    float _599 = float(_409);
    float _601 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].z, _577);
    float _603 = float(_575);
    float _605 = _495 * _145;
    float _607 = _593 ? _583 : 0.0;
    float _609 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _601);
    float _611 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _449);
    float _613 = _603 * _599;
    float _615 = _553 * _145;
    float _617 = -_145;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[81].x, _517);
    float _621 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _523);
    float _623 = _573 * (-2.0);
    if (_569)
    {
        float _625 = _607 * _579;
        _147 = _625;
    }
    float _627 = _147;
    float _629 = _219 + (-0.5);
    float _631 = _613 * (-2.0);
    float _633 = _221 + (-0.5);
    float _635 = fma(_623, _533, _533);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _641;
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _595);
    float _647 = fma(_631, _535, _535);
    float _649 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _635);
    float _651 = fma(_303, _571, _303);
    float _653 = _223 + (-0.5);
    float _655 = fma(_639, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = fma(_643, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _659 = fma(_315, _623, _315);
    bool _661 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _663 = isnan(_217);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].z, _647);
    float _675 = fma(_307, _631, _307);
    float _677 = fma(_659, _627, _649);
    bool _679 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _681 = isnan(_217);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -_671;
    float _693 = _691 + 1.0;
    bool _695 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _697 = isnan(_217);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = in.m_64.x;
    float _709 = in.m_64.y;
    float _711 = _677 * 0.15915493667125701904296875;
    float _713 = _689 * _693;
    float _715 = -_689;
    float _717 = _715 + 1.0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = fma(_651, _627, _645);
    float _729 = _705 * _717;
    float _731 = -_705;
    float _733 = _731 + 1.0;
    float _735 = fma(_721, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _737 = fma(_725, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _739 = _657 * _729;
    float _741 = _655 * _729;
    float _743 = fma(_675, _627, _673);
    float _745 = _727 * 0.15915493667125701904296875;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _739);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _741);
    float _751 = _743 * 0.15915493667125701904296875;
    float _753 = _745 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = fma(_735, _713, _747);
    float _759 = fma(_737, _713, _749);
    float _761 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[145].y, _757);
    float _763 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[145].x, _759);
    float _765 = _711 * 6.283185482025146484375;
    float _767 = sin(_765);
    float _769 = _761 * _709;
    float _771 = _763 * _707;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _777 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _711 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _777 * _773;
    float _787 = _779 * _775;
    float _789 = in.m_50.x;
    float _791 = in.m_50.y;
    float _793 = in.m_50.z;
    float _795 = _745 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _755 * _767;
    float _801 = _751 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = _755 * _783;
    float _807 = _751 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _797 * _767;
    float _813 = _797 * _783;
    float _815 = _755 * _803;
    float _817 = _783 * _803;
    float _819 = _797 * _803;
    float _821 = _767 * _803;
    float _823 = _815 * _785;
    float _825 = _819 * _785;
    float _827 = fma(_809, _805, _811);
    float _829 = -_799;
    float _831 = fma(_809, _813, _829);
    float _833 = -_813;
    float _835 = fma(_809, _799, _833);
    float _837 = -_785;
    float _839 = _809 * _837;
    float _841 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _843 = fma(_827, _787, _823);
    float _845 = fma(_809, _811, _805);
    float _847 = fma(_817, _787, _839);
    float _849 = fma(_831, _787, _825);
    float _851 = fma(_835, _841, _843);
    float _853 = _791 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = fma(_821, _841, _847);
    float _857 = _791 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _859 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _863 = fma(_845, _841, _849);
    float _865 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[4].x, _857);
    float _867 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _861);
    float _873 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    float _875 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[6].z, _867);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].z, _869);
    float _879 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _881 = _873 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _883 = _875 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _889 = _791 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _891 = _881 + _885;
    float _893 = _883 + _887;
    float _895 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[5].x, _889);
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _899 = _891 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _903 = _893 + _901;
    float _905 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[5].z, _895);
    float _907 = _899 * _899;
    float _909 = _903 * _903;
    float _911 = _905 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _915 = _907 + _909;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = 0.0;
    float _927 = _851;
    float _929 = _905;
    float _931 = _891;
    float _933 = _893;
    if (_919)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _935;
    }
    float _937 = _925;
    float _939 = _937;
    if (_919)
    {
        float _941 = _923 * _937;
        _939 = _941;
    }
    float _943 = _939;
    float _945 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _947 = _943;
    if (_919)
    {
        float _949 = rsqrt(_915);
        _927 = _949;
    }
    float _951 = _927;
    if (_919)
    {
        float _953 = _943 * 0.15915493667125701904296875;
        _947 = _953;
    }
    float _955 = _947;
    float _957 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _945);
    float _959 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    float _961 = _789;
    if (_919)
    {
        float _963 = _955 * 6.283185482025146484375;
        float _965 = sin(_963);
        _961 = _965;
    }
    float _967 = _961;
    float _969 = _959 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _971 = _911 + _969;
    float _973 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _975 = floor(_913);
    float _977 = _971;
    if (_919)
    {
        float _979 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _929 = _979;
    }
    float _981 = _929;
    float _983 = floor(_973);
    float _985 = _981;
    if (_919)
    {
        float _987 = fma(_967, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _987;
    }
    float _989 = _985;
    float _991 = _989;
    if (_919)
    {
        float _993 = _951 * _989;
        _991 = _993;
    }
    float _995 = _991;
    float _997 = -_975;
    float _999 = _913 + _997;
    if (_919)
    {
        float _1001 = fma(_899, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _931 = _1001;
    }
    float _1003 = _931;
    if (_919)
    {
        float _1005 = fma(_903, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _933 = _1005;
    }
    float _1007 = _933;
    float _1009 = fma(_1003, 6.2500002968590706586837768554688e-05, 0.5);
    float _1011 = fma(_1007, 6.2500002968590706586837768554688e-05, 0.5);
    float _1013 = -_983;
    float _1015 = _973 + _1013;
    float2 _5006 = float2(_1009, _1011);
    float3 _1019 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5006, float2(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5006, float2(0.0), isnan(_5006)), level(0.0)).xyz;
    float _1021 = _1019.x;
    float _1023 = _1019.y;
    float _1025 = _1019.z;
    float2 _5022 = float2(_999, _1015);
    float _1027 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5022, float2(0.0), isnan(_5022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5022, float2(0.0), isnan(_5022)), level(0.0)).x;
    float _1029 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1031 = int(_1029);
    float _1033 = 0.0;
    if (_237)
    {
        _1033 = 1.0;
    }
    float _1035 = _1033;
    float _1037 = -_611;
    float _1039 = _1037 + 1.0;
    float _1041 = _1035;
    if (!_237)
    {
        _1041 = 7.345489978790283203125;
    }
    float _1043 = _1041;
    int _1045 = abs(_461);
    float _1047 = trunc(_605);
    int _1049 = int(_1047);
    float _1051 = float(uint(_1031));
    float _1053 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1055 = int(_1053);
    int _1057 = ~_1031;
    int _1059 = _1057 + 1;
    bool _1061 = _1031 == 0;
    float _1063 = float(uint(_1049));
    float _1065 = 1.0 / _1051;
    float _1067 = float(uint(_1055));
    float _1069 = trunc(_615);
    int _1071 = int(_1069);
    float _1073 = _1043 * _219;
    int _1075 = ~_1055;
    int _1077 = _1075 + 1;
    float _1079 = _1043;
    if (_237)
    {
        float _1081 = in.m_60.x;
        _1079 = _1081;
    }
    float _1083 = _1079;
    bool _1085 = _1055 == 0;
    int _1087 = as_type<int>(_1065) + (-2);
    float _1089 = 1.0 / _1067;
    float _1091 = float(_1049);
    float _1093 = _1083;
    if (!_237)
    {
        float _1095 = in.m_60.y;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = as_type<float>(_1087) * _1063;
    float _1101 = floor(_1073);
    float _1103 = trunc(_1099);
    float _1105 = precise::max(_1103, 0.0);
    uint _1108 = uint(_1105);
    int _1110 = _1059 * int(_1108);
    int _1112 = _1110 + _1049;
    float _1114 = float(uint(_1112));
    int _1116 = as_type<int>(_1089) + (-2);
    float _1118 = float(uint(_1071));
    float _1120 = as_type<float>(_1087) * _1114;
    float _1122 = float(_1031);
    float _1124 = as_type<float>(_1116) * _1118;
    bool _1126 = _1091 >= _1122;
    bool _1128 = isnan(_1091);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(_1122);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = trunc(_1120);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = -_1101;
    float _1146 = _1073 + _1144;
    int _1148 = ~_1031;
    int _1150 = _1148 + 1;
    float _1152 = trunc(_1124);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = int(_1108) + int(_1142);
    float _1160 = _1146 * _1122;
    float _1162 = trunc(_1136);
    int _1164 = int(_1162);
    float _1166 = as_type<float>(_1142);
    if (_237)
    {
        _1166 = 1.0;
    }
    float _1168 = _1166;
    int _1170 = _1150 * _1158;
    int _1172 = _1170 + _1049;
    float _1174 = _1168;
    if (!_237)
    {
        _1174 = 1.2345600128173828125;
    }
    float _1176 = _1174;
    int _1178 = _1077 * int(_1156);
    int _1180 = _1178 + _1071;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1184 = _1182 != 0;
    float _1186 = trunc(_1160);
    int _1188 = int(_1186);
    bool _1190 = uint(_1172) >= uint(_1031);
    float _1192 = _1097 * _1176;
    float _1194 = float(uint(_1180));
    float _1196 = _1122 * _597;
    bool _1198 = !_1190;
    int _1200 = _1198 ? 0 : (-1);
    float _1202 = as_type<float>(_1116) * _1194;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1206 = _1204 != 0;
    float _1208 = trunc(_1196);
    int _1210 = int(_1208);
    int _1212 = ~_1158;
    int _1214 = _1212 + _1200;
    int _1216 = _1214 + 1;
    bool _1218 = !_1206;
    int _1220 = _1218 ? 0 : 1;
    int _1222 = abs(_1220);
    float _1224 = trunc(_1202);
    float _1226 = precise::max(_1224, 0.0);
    uint _1228 = uint(_1226);
    int _1230 = _1031 * _1216;
    int _1232 = _1230 + _1049;
    int _1234 = ~_1055;
    int _1236 = _1234 + 1;
    int _1238 = ~_1164;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    bool _1244 = !_1061;
    int _1246 = _1244 ? _1232 : (-1);
    int _1248 = _1188 * _1222;
    int _1250 = _1248 + _1049;
    int _1252 = _1031 + (-1);
    int _1254 = _1246 * _1242;
    float _1256 = floor(_1192);
    int _1258 = int(_1156) + int(_1228);
    int _1260 = _1164 * _1252;
    int _1262 = _1260 + _1254;
    int _1264 = abs(_457);
    float _1266 = float(_1055);
    int _1268 = _1236 * _1258;
    int _1270 = _1268 + _1071;
    float _1272 = float(_1071);
    int _1274 = _1262 * _1264;
    bool _1276 = uint(_1270) >= uint(_1055);
    int _1278 = _1210 * _1045;
    int _1280 = _1278 + _1274;
    bool _1282 = _1272 >= _1266;
    bool _1284 = isnan(_1272);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(_1266);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = -_1256;
    float _1296 = _1192 + _1294;
    int _1298 = abs(_467);
    bool _1300 = !_1276;
    int _1302 = _1300 ? 0 : (-1);
    float _1304 = trunc(_1292);
    int _1306 = int(_1304);
    bool _1308 = !_1184;
    int _1310 = _1308 ? 0 : 1;
    int _1312 = _1250 * _1298;
    int _1314 = _1312 + _1280;
    int _1316 = ~_1258;
    int _1318 = _1316 + _1302;
    int _1320 = _1318 + 1;
    int _1322 = abs(_1310);
    float _1324 = _1296 * _1266;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1328 = _1326 != 0;
    int _1330 = _1055 * _1320;
    int _1332 = _1330 + _1071;
    float _1334 = _1266 * _597;
    int _1336 = _1188 * _1322;
    int _1338 = _1336 + _1314;
    bool _1340 = !_1328;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = trunc(_1324);
    int _1346 = int(_1344);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1085;
    int _1366 = _1364 ? _1332 : (-1);
    int _1368 = ~_1306;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    bool _1374 = !_1354;
    int _1376 = _1374 ? 0 : 1;
    float _1378 = trunc(_1334);
    int _1380 = int(_1378);
    int _1382 = abs(_1342);
    int _1384 = _1366 * _1372;
    float _1386 = float(uint(_1338));
    int _1388 = _1055 + (-1);
    bool _1390 = !_1350;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = as_type<float>(_1087) * _1386;
    int _1396 = abs(_1376);
    int _1398 = _1306 * _1388;
    int _1400 = _1398 + _1384;
    int _1402 = abs(_1392);
    int _1404 = _1346 * _1382;
    int _1406 = _1404 + _1071;
    float _1408 = trunc(_1394);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    int _1414 = _1400 * _1396;
    bool _1416 = !_1358;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = ~_1031;
    int _1422 = _1420 + 1;
    int _1424 = _1380 * _1402;
    int _1426 = _1424 + _1414;
    bool _1428 = !_1362;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = abs(_1418);
    int _1434 = abs(_1430);
    float _1436 = float(uint(_1406));
    int _1438 = _1406 * _1432;
    int _1440 = _1438 + _1426;
    float _1442 = float(uint(_1250));
    int _1444 = _1422 * int(_1412);
    int _1446 = _1444 + _1338;
    int _1448 = ~_1055;
    int _1450 = _1448 + 1;
    int _1452 = _1346 * _1434;
    int _1454 = _1452 + _1440;
    float _1456 = as_type<float>(_1116) * _1436;
    float _1458 = as_type<float>(_1087) * _1442;
    float _1460 = float(uint(_1446));
    float _1462 = float(uint(_1454));
    float _1464 = trunc(_1456);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    int _1470 = ~_1055;
    int _1472 = _1470 + 1;
    float _1474 = as_type<float>(_1087) * _1460;
    float _1476 = as_type<float>(_1116) * _1462;
    float _1478 = trunc(_1474);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    float _1484 = trunc(_1458);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = _1472 * int(_1468);
    int _1492 = _1490 + _1406;
    int _1494 = ~_1031;
    int _1496 = _1494 + 1;
    float _1498 = float(uint(_1492));
    float _1500 = trunc(_1476);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    int _1506 = ~_1031;
    int _1508 = _1506 + 1;
    int _1510 = int(_1412) + int(_1482);
    float _1512 = as_type<float>(_1116) * _1498;
    int _1514 = _1508 * int(_1488);
    int _1516 = _1514 + _1250;
    float _1518 = trunc(_1512);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    float _1524 = float(uint(_1516));
    int _1526 = _1450 * int(_1504);
    int _1528 = _1526 + _1454;
    float _1530 = as_type<float>(_1087) * _1524;
    float _1532 = float(uint(_1528));
    int _1534 = _1496 * _1510;
    int _1536 = _1534 + _1338;
    float _1538 = trunc(_1530);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = as_type<float>(_1116) * _1532;
    bool _1546 = uint(_1536) >= uint(_1031);
    bool _1548 = !_1546;
    int _1550 = _1548 ? 0 : (-1);
    float _1552 = trunc(_1544);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = ~_1510;
    int _1560 = _1558 + _1550;
    int _1562 = _1560 + 1;
    int _1564 = ~_1031;
    int _1566 = _1564 + 1;
    int _1568 = int(_1488) + int(_1542);
    int _1570 = _1031 * _1562;
    int _1572 = _1570 + _1338;
    int _1574 = int(_1468) + int(_1522);
    out.m_66.x = _1021;
    out.m_66.y = _1023;
    out.m_66.z = _1025;
    int _1576 = ~_1055;
    int _1578 = _1576 + 1;
    bool _1580 = !_1061;
    int _1582 = _1580 ? _1572 : (-1);
    int _1584 = int(_1504) + int(_1556);
    int _1586 = _1566 * _1568;
    int _1588 = _1586 + _1250;
    int _1590 = _1582 & 3;
    bool _1592 = _1590 != 0;
    int _1594 = _1582 & 3;
    bool _1596 = _1594 != 0;
    int _1598 = _1578 * _1584;
    int _1600 = _1598 + _1454;
    bool _1602 = uint(_1590) >= 2u;
    int _1604 = _1596 ? 0 : 1;
    int _1606 = _1602 ? 0 : 1;
    bool _1608 = uint(_1600) >= uint(_1055);
    bool _1610 = uint(_1590) > 1u;
    bool _1612 = uint(_1588) >= uint(_1031);
    bool _1614 = !_1608;
    int _1616 = _1614 ? 0 : (-1);
    bool _1618 = !_1612;
    int _1620 = _1618 ? 0 : (-1);
    int _1622 = ~_1584;
    int _1624 = _1622 + _1616;
    int _1626 = _1624 + 1;
    int _1628 = ~_1568;
    int _1630 = _1628 + _1620;
    int _1632 = _1630 + 1;
    int _1634 = _1578 * _1574;
    int _1636 = _1634 + _1406;
    bool _1638 = _225 > 0.5;
    int _1640 = _1055 * _1626;
    int _1642 = _1640 + _1454;
    int _1644 = ~_1604;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    int _1650 = _1031 * _1632;
    int _1652 = _1650 + _1250;
    int _1654 = _1648;
    if (!_1610)
    {
        int _1656 = ~_1604;
        int _1658 = _1656 + 1;
        _1654 = _1658;
    }
    int _1660 = _1654;
    int _1662 = _1582 >> 31;
    bool _1664 = uint(_1636) >= uint(_1055);
    bool _1666 = !_1085;
    int _1668 = _1666 ? _1642 : (-1);
    int _1670 = _1662 & 3;
    bool _1672 = _1590 != 3;
    bool _1674 = !_1664;
    int _1676 = _1674 ? 0 : (-1);
    int _1678 = _1668 >> 31;
    bool _1680 = !_1061;
    int _1682 = _1680 ? _1652 : (-1);
    int _1684 = _1582 + _1670;
    float _1686 = -_185;
    int _1688 = _1638 ? as_type<int>(_1686) : as_type<int>(_185);
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1692 = _1690 != 0;
    int _1694 = ~_1574;
    int _1696 = _1694 + _1676;
    int _1698 = _1696 + 1;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1702 = _1700 != 0;
    int _1704 = _1678 & 3;
    int _1706 = _1684 >> 2;
    bool _1708 = !_1692;
    int _1710 = _1708 ? 0 : 1;
    bool _1712 = !_1702;
    int _1714 = _1712 ? 0 : 1;
    int _1716 = _1668 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1668 + _1704;
    int _1722 = _1668 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = _1706 << 4;
    int _1728 = _1726 + 368;
    int _1730 = ~_1606;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    int _1736 = _1734;
    if (_1672)
    {
        int _1738 = ~_1606;
        int _1740 = _1738 + 1;
        _1736 = _1740;
    }
    int _1742 = _1736;
    int _1744 = _1055 * _1698;
    int _1746 = _1744 + _1406;
    bool _1748 = !_1592;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = _1718 ? 0 : 1;
    int _1754 = _1720 >> 2;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1758 = _1756 != 0;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1762 = _1760 != 0;
    bool _1764 = !_1724;
    int _1766 = _1764 ? 0 : 1;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1770 = _1768 != 0;
    bool _1772 = _1590 != 3;
    bool _1774 = uint(_1722) > 1u;
    uint _1776 = uint(int(uint(_1728) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = _1754 << 4;
    int _1794 = _1792 + 512;
    int _1796 = ~_1752;
    int _1798 = _1796 + 1;
    int _1800 = _1798 + 1;
    bool _1802 = !_1772;
    int _1804 = _1802 ? 0 : (-1);
    bool _1806 = uint(_1722) >= 2u;
    uint _1808 = uint(int(uint(_1794) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    int _1824 = _1806 ? 0 : 1;
    int _1826 = _1800;
    if (!_1774)
    {
        int _1828 = ~_1752;
        int _1830 = _1828 + 1;
        _1826 = _1830;
    }
    int _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1836 = _1722 != 3;
    int _1838 = _1794 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    bool _1856 = _1722 != 3;
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1860 = ~_1824;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = _1728 + 8;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
    int _1872 = int(_1868) & 3;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[int(_1870)][_1872];
    int _1876 = int(_1868) + 1;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    int _1880 = _1876 & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = abs(_1660);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1888 = abs(_1750);
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1892 = _1864;
    if (_1836)
    {
        int _1894 = ~_1824;
        int _1896 = _1894 + 1;
        _1892 = _1896;
    }
    int _1898 = _1892;
    float _1900 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1902 = !_1856;
    int _1904 = _1902 ? 0 : (-1);
    int _1906 = abs(_1832);
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1910 = _219 > 0.5;
    float _1912 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1914 = !_1085;
    int _1916 = _1914 ? _1746 : (-1);
    float _1918 = -_181;
    int _1920 = _1910 ? as_type<int>(_1918) : as_type<int>(_181);
    out.m_68.x = _1912;
    out.m_68.y = _1858;
    out.m_68.z = _1900;
    out.m_68.w = _1890;
    bool _1922 = _221 > 0.5;
    bool _1924 = _223 > 0.5;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1928 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1930 = _1928 != 0;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1936 = int(_1934);
    int _1938 = ~_1884;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1948 = _1942 * as_type<int>(_1790);
    int _1950 = ~_1888;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1958 = abs(_1766);
    float _1960 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1962 = ~_1906;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1954 * as_type<int>(_1782);
    int _1970 = _1968 + _1948;
    int _1972 = ~_1958;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1980 = int(_1978);
    out.m_70.x = _1946;
    out.m_70.y = _1956;
    out.m_70.z = _1960;
    int _1982 = _1966 * as_type<int>(_1822);
    int _1984 = abs(_1904);
    float _1986 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1988 = abs(_1742);
    int _1990 = _1976 * as_type<int>(_1814);
    int _1992 = _1990 + _1982;
    int _1994 = abs(_1898);
    int _1996 = abs(_1804);
    int _1998 = ~_1988;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = ~_1994;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = float(uint(_1936));
    int _2012 = _2002 * as_type<int>(_1874);
    int _2014 = _2012 + _1970;
    int _2016 = ~_1984;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = _2008 * as_type<int>(_1846);
    int _2024 = _2022 + _1992;
    float _2026 = float(uint(_1980));
    float _2028 = 1.0 / _2010;
    int _2030 = ~_1996;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = _2020 * as_type<int>(_1854);
    int _2038 = _2036 + _2024;
    int _2040 = abs(_1714);
    int _2042 = abs(_1936);
    int _2044 = _2034 * as_type<int>(_1882);
    int _2046 = _2044 + _2014;
    int _2048 = ~_2040;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    float _2054 = 1.0 / _2026;
    float _2056 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = abs(_1980);
    int _2060 = _2046 * _2052;
    float _2062 = float(uint(_2042));
    float _2064 = -_809;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    int _2068 = abs(_1710);
    int _2070 = _1682 * _2040;
    int _2072 = _2070 + _2060;
    float _2074 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2076 = float(uint(_2058));
    float _2078 = 1.0 / _2062;
    int _2080 = ~_2068;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    float _2086 = -_809;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2074);
    float _2090 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2066);
    float _2092 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2094 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2096 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2088);
    int _2098 = as_type<int>(_2028) + (-2);
    float _2100 = 1.0 / _2076;
    int _2102 = as_type<int>(_2054) + (-2);
    int _2104 = _2038 * _2084;
    float _2106 = float(uint(_2072));
    float _2108 = -_809;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2094);
    bool _2112 = !_1758;
    float _2114 = _2112 ? _185 : as_type<float>(_1688);
    int _2116 = _1916 * _2068;
    int _2118 = _2116 + _2104;
    float _2120 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2122 = as_type<float>(_2098) * _2106;
    float _2124 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2092);
    int _2126 = abs(_2072);
    float _2128 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2130 = float(uint(_2118));
    float _2132 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    float _2134 = trunc(_2122);
    float _2136 = precise::max(_2134, 0.0);
    uint _2138 = uint(_2136);
    int _2140 = abs(_2118);
    float _2142 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    int _2144 = as_type<int>(_2078) + (-2);
    float _2146 = as_type<float>(_2102) * _2130;
    float _2148 = float(uint(_2126));
    float _2150 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2120);
    int _2152 = as_type<int>(_2100) + (-2);
    float _2154 = _2110;
    float _2156 = _2150;
    float _2158 = _2096;
    if (_919)
    {
        float _2160 = _955 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2154 = _2162;
    }
    float _2164 = _2154;
    int _2166 = ~_1936;
    int _2168 = _2166 + 1;
    float _2170 = as_type<float>(_2144) * _2148;
    float _2172 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2174 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2176 = !_1930;
    float _2178 = _2176 ? _181 : as_type<float>(_1920);
    float _2180 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2124);
    float _2182 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2172);
    float _2184 = trunc(_2146);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = float(uint(_2140));
    int _2192 = _2168 * int(_2138);
    int _2194 = _2192 + _2072;
    float _2196 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2174);
    float _2198 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2182);
    bool _2200 = _1980 == 0;
    float _2202 = as_type<float>(_2152) * _2190;
    float _2204 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1986);
    float _2206 = trunc(_2170);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    float _2212 = float(uint(_2194));
    float _2214 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    int _2216 = ~_1980;
    int _2218 = _2216 + 1;
    float _2220 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2204);
    int _2222 = ~_2058;
    int _2224 = _2222 + 1;
    float _2226 = as_type<float>(_2098) * _2212;
    float _2228 = trunc(_2202);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = ~_2042;
    int _2236 = _2234 + 1;
    float _2238 = as_type<float>(_2218);
    float _2240 = as_type<float>(_2224);
    float _2242 = _2202;
    if (_919)
    {
        float _2244 = _2164 + (-1.0);
        _2238 = _2244;
    }
    float _2246 = _2238;
    int _2248 = _2218 * int(_2188);
    int _2250 = _2248 + _2118;
    float _2252 = _2246;
    if (!_919)
    {
        _2240 = _907;
    }
    float _2254 = _2240;
    float _2256 = _2254;
    if (_919)
    {
        float _2258 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2252 = _2258;
    }
    float _2260 = _2252;
    int _2262 = _2236 * int(_2210);
    int _2264 = _2262 + _2126;
    float _2266 = float(uint(_2250));
    if (_919)
    {
        float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2270 = _1003 + _2268;
        _2242 = _2270;
    }
    float _2272 = _2242;
    float _2274 = trunc(_2226);
    float _2276 = precise::max(_2274, 0.0);
    uint _2278 = uint(_2276);
    if (_919)
    {
        float _2280 = fma(_971, _2164, _2260);
        _977 = _2280;
    }
    float _2282 = _977;
    float _2284 = -_185;
    int _2286 = _1922 ? as_type<int>(_2284) : as_type<int>(_185);
    float _2288 = as_type<float>(_2102) * _2266;
    if (_919)
    {
        float _2290 = _2272 * _2272;
        _2256 = _2290;
    }
    float _2292 = _2256;
    int _2294 = _2224 * int(_2232);
    int _2296 = _2294 + _2140;
    float _2298 = float(uint(_2264));
    float _2300 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2302 = -_181;
    int _2304 = _1924 ? as_type<int>(_2302) : as_type<int>(_181);
    float _2306 = float(uint(_2296));
    float _2308 = as_type<float>(_2144) * _2298;
    float _2310 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    float _2312 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2314 = _2300 * _2132;
    float _2316 = as_type<float>(_2152) * _2306;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2320 = _2282 + _2318;
    float _2322 = trunc(_2288);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    bool _2328 = !_1762;
    float _2330 = _2328 ? _185 : as_type<float>(_2286);
    float _2332 = _2300 * _2090;
    float _2334 = fma(_2320, _2320, _2292);
    int _2336 = int(_2138) + int(_2278);
    int _2338 = ~_1936;
    int _2340 = _2338 + 1;
    float _2342 = trunc(_2308);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    bool _2348 = !_1770;
    float _2350 = _2348 ? _181 : as_type<float>(_2304);
    float _2352 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2150);
    if (!_919)
    {
        _189 = _909;
    }
    float _2354 = _189;
    float _2356 = fma(_2312, _2310, _2314);
    int _2358 = ~_1980;
    int _2360 = _2358 + 1;
    int _2362 = _2340 * _2336;
    int _2364 = _2362 + _2072;
    float _2366 = _2354;
    if (_919)
    {
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2370 = _1007 + _2368;
        _2156 = _2370;
    }
    float _2372 = _2156;
    float _2374 = trunc(_2316);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    int _2380 = int(_2188) + int(_2326);
    float _2382 = _2300 * _2096;
    int _2384 = ~_2042;
    int _2386 = _2384 + 1;
    if (_919)
    {
        float _2388 = _2372 * _2372;
        _2366 = _2388;
    }
    float _2390 = _2366;
    bool _2392 = uint(_2364) >= uint(_1936);
    int _2394 = _2360 * _2380;
    int _2396 = _2394 + _2118;
    int _2398 = ~_2058;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2312, _2352, _2332);
    int _2404 = int(_2210) + int(_2346);
    float _2406 = fma(_2312, _2180, _2382);
    float _2408 = _2334 + _2390;
    bool _2410 = uint(_2396) >= uint(_1980);
    out.m_72.x = _2352;
    out.m_72.y = _2180;
    out.m_72.z = _2310;
    bool _2412 = !_2392;
    int _2414 = _2412 ? 0 : (-1);
    int _2416 = _2386 * _2404;
    int _2418 = _2416 + _2126;
    int _2420 = int(_2232) + int(_2378);
    float _2422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2424 = ~_2336;
    int _2426 = _2424 + _2414;
    int _2428 = _2426 + 1;
    bool _2430 = uint(_2418) >= uint(_2042);
    int _2432 = _2400 * _2420;
    int _2434 = _2432 + _2140;
    bool _2436 = !_2410;
    int _2438 = _2436 ? 0 : (-1);
    bool _2440 = _1936 == 0;
    float _2442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2444 = uint(_2434) >= uint(_2058);
    int _2446 = _1936 * _2428;
    int _2448 = _2446 + _2072;
    int _2450 = ~_2380;
    int _2452 = _2450 + _2438;
    int _2454 = _2452 + 1;
    int _2456 = _2072 ^ _1936;
    int _2458 = _2118 ^ _1980;
    int _2460 = _1980 * _2454;
    int _2462 = _2460 + _2118;
    bool _2464 = _1936 == 0;
    float _2466 = sqrt(_2408);
    bool _2468 = !_2430;
    int _2470 = _2468 ? 0 : (-1);
    uint _2472 = uint(int(uint(_2456) >> uint(31)));
    bool _2474 = !_2444;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2480 = !_2440;
    int _2482 = _2480 ? _2448 : (-1);
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2486 = uint(int(uint(_2458) >> uint(31)));
    int _2488 = ~_2470;
    int _2490 = _2404 + _2488;
    int _2492 = _2490 + 1;
    int _2494 = ~int(_2472);
    int _2496 = _2494 + 1;
    float _2498 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2500 = ~_2476;
    int _2502 = _2420 + _2500;
    int _2504 = _2502 + 1;
    float _2506 = float(_2482);
    int _2508 = ~int(_2486);
    int _2510 = _2508 + 1;
    float _2512 = fma(_2300, _2300, 1.0);
    int _2514 = _2492 ^ _2496;
    float _2516 = fma(_2498, _2506, _337);
    bool _2518 = _1980 == 0;
    float _2520 = rsqrt(_2512);
    bool _2522 = !_2200;
    int _2524 = _2522 ? _2462 : (-1);
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2528 = ~_2496;
    int _2530 = _2528 + _2514;
    int _2532 = _2530 + 1;
    float _2534 = _2178 + 0.5;
    int _2536 = _2504 ^ _2510;
    float _2538 = float(_2524);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2542 = !_2464;
    int _2544 = _2542 ? _2532 : (-1);
    float _2546 = fma(_2498, _2534, _2516);
    int _2548 = ~_2510;
    int _2550 = _2548 + _2536;
    int _2552 = _2550 + 1;
    float _2554 = fma(_2526, _2538, _619);
    float _2556 = float(_2544);
    bool _2558 = !_2518;
    int _2560 = _2558 ? _2552 : (-1);
    float _2562 = _2300 * _2520;
    bool _2564 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2566 = isnan(_2466);
    bool _2568 = _2564 || _2566;
    bool _2570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2572 = _2568 || _2570;
    float _2574 = -_347;
    float _2576 = fma(_2478, _2556, _2574);
    float _2578 = float(_2560);
    float _2580 = _2350 + 0.5;
    float _2582 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2584 = _2330 + (-0.5);
    float _2586 = fma(_2526, _2580, _2554);
    float _2588 = -_2198;
    float _2590 = _2562 * _2588;
    float _2592 = -_621;
    float _2594 = fma(_2582, _2578, _2592);
    float _2596 = -_2478;
    float _2598 = fma(_2596, _2584, _2576);
    float _2600 = _2114 + (-0.5);
    float _2602 = -_2214;
    float _2604 = _2562 * _2602;
    float _2606 = fma(_2520, _2090, _2590);
    float _2608 = _2198 + _2402;
    float _2610 = -_2582;
    float _2612 = fma(_2610, _2600, _2594);
    float _2614 = fma(_2520, _2096, _2604);
    float _2616 = -_559;
    float _2618 = _2616 + 1.0;
    float _2620 = -_2220;
    float _2622 = _2562 * _2620;
    float _2624 = -_609;
    float _2626 = _2624 + 1.0;
    float _2628 = -_481;
    float _2630 = _2628 + 1.0;
    float _2632 = fma(_2330, _2618, _2598);
    float _2634 = fma(_2520, _2132, _2622);
    float _2636 = -_2626;
    float _2638 = fma(_2178, _2636, _2546);
    float _2640 = -_2630;
    float _2642 = fma(_2350, _2640, _2586);
    float _2644 = fma(_2114, _1039, _2612);
    float _2646 = _2214 + _2406;
    float _2648 = _2220 + _2356;
    out.m_74.x = _2606;
    out.m_74.y = _2614;
    out.m_74.z = _2634;
    float _2650 = _2546;
    float _2652 = _2614;
    float _2654 = _2638;
    if (!_2572)
    {
        _2650 = 1.0;
    }
    float _2656 = _2650;
    out.m_76.x = _2638;
    out.m_76.y = _2632;
    out.m_76.z = _2642;
    out.m_76.w = _2644;
    out.m_78.x = _2608;
    out.m_78.y = _2646;
    out.m_78.z = _2648;
    bool _2658 = !_2572;
    float _2660 = _2656;
    if (!_2658)
    {
        bool _2662 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2664 = isnan(_2466);
        bool _2666 = _2662 || _2664;
        bool _2668 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2670 = _2666 || _2668;
        if (!_2670)
        {
            float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2674 = _2466 + _2672;
            float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2678 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2676;
            float _2680 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2684 = 1.0 / _2678;
            float _2686 = _2674 * _2684;
            float _2688 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2660 = _2688;
            _2690 = true;
        }
        else
        {
            bool _2692 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2694 = isnan(_2466);
            bool _2696 = _2692 || _2694;
            bool _2698 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2700 = _2696 || _2698;
            if (!_2700)
            {
                float _2702 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2704 = _2466 + _2702;
                float _2706 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2708 = _2706 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2712 = _2710 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2714 = 1.0 / _2708;
                float _2716 = _2704 * _2714;
                float _2718 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2660 = _2718;
                _2690 = true;
            }
            else
            {
                _2660 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2690 = false;
    float _2720 = _2660;
    float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2724 = _2282 + _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2728 = _1003 + _2726;
    float _2730 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2734 = _1007 + _2732;
    float _2736 = fma(_2728, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2740 = _2730 + _2738;
    float _2742 = fma(_2734, _2720, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2746 = _2736 + _2744;
    float _2748 = _2740 * _2740;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2752 = _2742 + _2750;
    float _2754 = fma(_2746, _2746, _2748);
    float _2756 = fma(_2752, _2752, _2754);
    float _2758 = rsqrt(_2756);
    float _2760 = sqrt(_2756);
    float _2762 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2764 = _2746 * _2762;
    float _2766 = _2752 * _2762;
    float _2768 = _2764 * _2764;
    float _2770 = _2766 * _2766;
    float _2772 = _2768 + _2770;
    float _2774 = sqrt(_2772);
    bool _2776 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2780 = _2774 + _2778;
    float _2782 = _2758;
    float _2784 = _2780;
    float _2786 = _2740;
    float _2788 = _2764;
    if (_2776)
    {
        float _2790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2790;
    }
    float _2792 = _2782;
    if (_2776)
    {
        float _2794 = rsqrt(_2772);
        _2652 = _2794;
    }
    float _2796 = _2652;
    float _2798 = _2796;
    if (_2776)
    {
        float _2800 = _2780 * _2792;
        _2784 = _2800;
    }
    float _2802 = _2784;
    if (_2776)
    {
        float _2804 = _2802 * 0.15915493667125701904296875;
        _2158 = _2804;
    }
    float _2806 = _2158;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2810 = _2792;
    if (_2776)
    {
        float _2812 = _2806 * 6.283185482025146484375;
        float _2814 = sin(_2812);
        _2810 = _2814;
    }
    float _2816 = _2810;
    float _2818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2820 = precise::max(0.0, _2818);
    float _2822 = _2752;
    float _2824 = _2820;
    if (_2776)
    {
        float _2826 = _2806 * 6.283185482025146484375;
        float _2828 = cos(_2826);
        _2822 = _2828;
    }
    float _2830 = _2822;
    float _2832 = -_2762;
    float _2834 = -_2820;
    float _2836 = fma(_2740, _2832, _2834);
    if (!_2776)
    {
        _2786 = _2766;
    }
    float _2838 = _2786;
    float _2840 = _2838;
    if (_2776)
    {
        float _2842 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _2842;
    }
    float _2844 = _2824;
    float _2846 = _2816;
    float _2848 = _2844;
    if (_2776)
    {
        float _2850 = fma(_2816, _2844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2654 = _2850;
    }
    float _2852 = _2654;
    float _2854 = _2852;
    if (!_2776)
    {
        _2846 = _2836;
    }
    float _2856 = _2846;
    float _2858 = _2856;
    float _2860 = _2830;
    if (_2776)
    {
        float _2862 = _2830 + (-1.0);
        _2848 = _2862;
    }
    float _2864 = _2848;
    float _2866 = _2864;
    if (_2776)
    {
        float _2868 = _2796 * _2852;
        _2854 = _2868;
    }
    float _2870 = _2854;
    if (_2776)
    {
        float _2872 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2872;
    }
    float _2874 = _2798;
    if (_2776)
    {
        float _2876 = _2764 * _2870;
        _2788 = _2876;
    }
    float _2878 = _2788;
    if (!_2776)
    {
        _2866 = _2768;
    }
    float _2880 = _2866;
    float _2882 = _2880;
    if (_2776)
    {
        float _2884 = _2766 * _2870;
        _2840 = _2884;
    }
    float _2886 = _2840;
    if (_2776)
    {
        float _2888 = fma(_2836, _2830, _2874);
        _2858 = _2888;
    }
    float _2890 = _2858;
    if (_2776)
    {
        float _2892 = _2878 * _2878;
        _2882 = _2892;
    }
    float _2894 = _2882;
    if (!_2776)
    {
        _2860 = _2770;
    }
    float _2896 = _2860;
    float _2898 = _2896;
    if (_2776)
    {
        float _2900 = _2886 * _2886;
        _2898 = _2900;
    }
    float _2902 = _2898;
    float _2904 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2906 = fma(_2890, _2890, _2894);
    float _2908 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2904);
    float _2910 = _2906 + _2902;
    float _2912 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2916 = fma(_2760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2914);
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2908);
    float _2922 = rsqrt(_2910);
    float _2924 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2926 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2912);
    float _2928 = _2920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2930 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2932 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2924);
    float _2934 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2926);
    float _2936 = -_2918;
    float _2938 = _2936 + 1.0;
    float _2940 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2930);
    float _2942 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2944 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2932);
    float _2946 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2940);
    float _2950 = -_2942;
    float _2952 = fma(_2950, _2808, 1.0);
    float _2954 = abs(_2938);
    float _2956 = log2(_2954);
    float _2958 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2960 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2962 = _2922 * _2878;
    float _2964 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2966 = _2922 * _2890;
    float _2968 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2960);
    float _2970 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2972 = _2922 * _2886;
    float _2974 = log2(_2952);
    float _2976 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2968);
    float _2978 = -_2970;
    float _2980 = fma(_2966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2978);
    float _2982 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2976);
    float _2984 = -_2972;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2980);
    float _2988 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2990 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2992 = 1.0 / _2982;
    float _2994 = fma(_2986, -0.5, 0.5);
    float _2996 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2998 = fma(_2986, 0.5, 0.5);
    float _3000 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2990);
    float _3002 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2996);
    float _3004 = fma(_2998, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3006 = exp2(_2988);
    float _3008 = _2966 + 1.0;
    float _3010 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3002);
    float _3012 = fma(_2998, _3004, -0.212114393711090087890625);
    float _3014 = _2974 * 0.693147182464599609375;
    float _3016 = fma(_2998, _3012, 1.570728778839111328125);
    float _3018 = sqrt(_2994);
    float _3020 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3000);
    float _3022 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3010);
    float _3024 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3026 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3020);
    float _3028 = -_2966;
    float _3030 = fma(_3006, _3008, _3028);
    float _3032 = _3026 * _2992;
    float _3034 = _3022 * _2992;
    float _3036 = fma(_3032, 0.5, 0.5);
    float _3038 = fma(_3034, -0.5, 0.5);
    float _3040 = _3018 * 0.636619746685028076171875;
    float _3042 = -_3016;
    float _3044 = fma(_3040, _3042, 1.0);
    float _3046 = fma(_3030, 0.5, 0.5);
    float3 _8028 = float3(_3036, _3038, _3024);
    float _3048 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8028, float3(0.0), isnan(_8028)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8028, float3(0.0), isnan(_8028)), level(0.0)).x;
    float3 _8039 = float3(_3036, _3038, _3024);
    float4 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8039, float3(0.0), isnan(_8039)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8039, float3(0.0), isnan(_8039)), level(0.0)).xyzw;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = _3051.w;
    float2 _8055 = float2(_3044, _3046);
    float3 _3061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8055, float2(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8055, float2(0.0), isnan(_8055)), level(0.0)).xyz;
    float _3063 = _3061.x;
    float _3065 = _3061.y;
    float _3067 = _3061.z;
    float _3069 = _911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3071 = -_1027;
    float _3073 = _3071 + 1.0;
    out.m_80.x = _2736;
    out.m_80.y = _2730;
    out.m_80.z = _2742;
    bool _3075 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3077 = isnan(_2760);
    bool _3079 = _3075 || _3077;
    bool _3081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3083 = _3079 || _3081;
    float _3085 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3069);
    float _3087 = _911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3089 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3085);
    float _3091 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3087);
    float _3093 = _3089 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3095 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3091);
    float _3097 = 1.0 / _3093;
    float _3099 = _3095 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3101 = _3099 + _3093;
    float _3103 = _3101 * _3097;
    float _3105 = _3103 * 0.5;
    float _3107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3109 = fma(_3105, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3107);
    float _3111 = 1.0 / _3109;
    float _3113 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3115 = _3111 * _3113;
    float _3117 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3119 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3121 = abs(_3115);
    float _3123 = log2(_3121);
    float _3125 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3119);
    float _3127 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3125);
    float _3129 = exp2(_3117);
    bool _3131 = _3115 <= 8000.0;
    bool _3133 = isnan(_3115);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan(8000.0);
    bool _3139 = _3135 || _3137;
    float _3141 = float(_3139);
    float _3143 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3127);
    float _3145 = _3143 + _2982;
    out.gl_Position.x = _3026;
    out.gl_Position.y = _3022;
    out.gl_Position.z = _3143;
    out.gl_Position.w = _2982;
    float _3147 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3149 = exp2(_3147);
    float _3151 = -_3129;
    float _3153 = _3151 + 1.0;
    float _3155 = _3143;
    float _3157 = _3022;
    float _3159 = _3026;
    float _3161 = _2982;
    float _3163 = _3057;
    if (!_3083)
    {
        _3155 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3165 = _3155;
    float _3167 = _3165;
    float _3169 = _3165;
    if (!_3083)
    {
        _3157 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3171 = _3157;
    float _3173 = _3171;
    float _3175 = _3171;
    if (!_3083)
    {
        _3159 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3177 = _3159;
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = _3177;
    float _3185 = _3177;
    if (!_3083)
    {
        _3161 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3187 = _3161;
    float _3189 = fma(_3181, -2.0, 3.0);
    float _3191 = _3181 * _3181;
    float _3193 = in.m_82.x;
    float _3195 = _3191 * _3189;
    float _3197 = -_3195;
    float _3199 = _3197 + 1.0;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3195);
    float _3203 = _3141 * _3201;
    float _3205 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3207 = _3073 * _3205;
    float _3209 = precise::clamp(_3207, 0.0, 1.0);
    float _3211 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3213 = -_3209;
    float _3215 = fma(_3213, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3217 = _3145 * 0.5;
    float _3219 = _3215 * _3193;
    out.m_84.z = _3217;
    out.m_84.w = _2982;
    float _3221 = _3219 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3221;
    float _3223 = _3211 * _3048;
    float _3225 = -_3211;
    float _3227 = _3225 + 1.0;
    float _3229 = _3059 * _3223;
    float _3231 = _3067 * _3223;
    float _3233 = fma(_3063, _3229, _3053);
    float _3235 = fma(_3065, _3229, _3055);
    float _3237 = _3059 * _3227;
    float _3239 = fma(_3059, _3231, _3057);
    float _3241 = _3229;
    float _3243 = _3187;
    float _3245 = _3187;
    if (!_3083)
    {
        _3241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3247 = _3241;
    float _3249 = _3247;
    float _3251 = _3247;
    if (!_3083)
    {
        _3163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3253 = _3163;
    out.m_88.x = _3233;
    out.m_88.y = _3235;
    out.m_88.z = _3239;
    out.m_88.w = _3237;
    bool _3255 = !_3083;
    float _3257 = _3253;
    float _3259 = _3253;
    if (!_3255)
    {
        bool _3261 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3263 = isnan(_2760);
        bool _3265 = _3261 || _3263;
        bool _3267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3269 = _3265 || _3267;
        if (!_3269)
        {
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3273 = _2760 + _3271;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3277 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3275;
            float _3279 = 1.0 / _3277;
            float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3283 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3287 = _3285 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3289 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3291 = _3289 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3293 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3301 = _3273 * _3279;
            float _3303 = precise::clamp(_3301, 0.0, 1.0);
            float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3309 = fma(_3303, _3283, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3311 = fma(_3303, _3307, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3313 = fma(_3303, _3287, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3315 = fma(_3303, _3291, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3317 = fma(_3303, _3295, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3319 = fma(_3303, _3299, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3259 = _3311;
            _3175 = _3317;
            _3251 = _3309;
            _3169 = _3315;
            _3245 = _3313;
            _3185 = _3319;
            _3321 = true;
        }
        else
        {
            bool _3323 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3325 = isnan(_2760);
            bool _3327 = _3323 || _3325;
            bool _3329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3331 = _3327 || _3329;
            if (!_3331)
            {
                _3249 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3333 = _3249;
            _3251 = _3333;
            if (!_3331)
            {
                _3257 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3335 = _3257;
            _3259 = _3335;
            if (!_3331)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3337 = _3243;
            _3245 = _3337;
            if (!_3331)
            {
                _3167 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3339 = _3167;
            _3169 = _3339;
            if (!_3331)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3341 = _3173;
            _3175 = _3341;
            if (!_3331)
            {
                _3183 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3343 = _3183;
            bool _3345 = !_3331;
            _3185 = _3343;
            if (!_3345)
            {
                bool _3347 = _2760 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3349 = isnan(_2760);
                bool _3351 = _3347 || _3349;
                bool _3353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3355 = _3351 || _3353;
                if (!_3355)
                {
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3359 = _2760 + _3357;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3363 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3361;
                    float _3365 = 1.0 / _3363;
                    float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3387 = _3359 * _3365;
                    float _3389 = precise::clamp(_3387, 0.0, 1.0);
                    float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3395 = fma(_3389, _3369, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3397 = fma(_3389, _3393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3399 = fma(_3389, _3373, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3401 = fma(_3389, _3377, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3403 = fma(_3389, _3381, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3405 = fma(_3389, _3385, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3259 = _3397;
                    _3175 = _3403;
                    _3251 = _3395;
                    _3169 = _3401;
                    _3245 = _3399;
                    _3185 = _3405;
                    _3321 = true;
                }
                else
                {
                    _3259 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3251 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3169 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3185 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3321 = false;
    float _3407 = _3259;
    float _3409 = _3175;
    float _3411 = _3251;
    float _3413 = _3169;
    float _3415 = _3245;
    float _3417 = _3185;
    float _3419 = fma(_2646, -0.5, 0.5);
    float _3421 = precise::clamp(_3419, 0.0, 1.0);
    float _3423 = -_3407;
    float _3425 = _3423 + _3409;
    float _3427 = -_3411;
    float _3429 = _3427 + _3413;
    float _3431 = -_3415;
    float _3433 = _3431 + _3417;
    bool _3435 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3437 = fma(_3421, _3425, _3407);
    float _3439 = fma(_3421, _3429, _3411);
    float _3441 = fma(_3421, _3433, _3415);
    float _3443 = _3437 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _3445 = fma(_3439, 0.298911988735198974609375, _3443);
    float _3447 = fma(_3441, 0.114477999508380889892578125, _3445);
    out.m_90.x = 0.0;
    float _3449 = -_3447;
    float _3451 = _3439 + _3449;
    float _3453 = -_3447;
    float _3455 = _3437 + _3453;
    float _3457 = -_3447;
    float _3459 = _3441 + _3457;
    float _3461 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3463 = fma(_3451, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    float _3465 = fma(_3455, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    float _3467 = fma(_3459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3447);
    out.m_86.w = _3461;
    out.m_92.x = _3463;
    out.m_92.y = _3465;
    out.m_92.z = _3467;
    if (!_3435)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3469 = -_2730;
    float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3473 = -_2736;
    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3477 = -_2742;
    float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3481 = _3471 * _3471;
    float _3483 = fma(_3475, _3475, _3481);
    float _3485 = fma(_3479, _3479, _3483);
    float _3487 = sqrt(_3485);
    float _3489 = rsqrt(_3485);
    float _3491 = -_3487;
    float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3495 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3497 = precise::clamp(_3495, 0.0, 1.0);
    float _3499 = _3475 * _3489;
    float _3501 = _3471 * _3489;
    float _3503 = abs(_3497);
    float _3505 = log2(_3503);
    float _3507 = _3479 * _3489;
    float _3509 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3511 = _2646 * _3501;
    float _3513 = -_3501;
    float _3515 = -_3509;
    float _3517 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3515);
    float _3519 = fma(_2608, _3499, _3511);
    float _3521 = -_3507;
    float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3517);
    float _3525 = fma(_2648, _3507, _3519);
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3531 = _3523 + _3529;
    float _3533 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3535 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3537 = precise::clamp(_3535, 0.0, 1.0);
    float _3539 = exp2(_3533);
    float _3541 = _3539 * _3537;
    float _3543 = _3527 * _3541;
    float _3545 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3547 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3549 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3545;
    out.m_90.y = _3547;
    out.m_90.z = _3549;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

