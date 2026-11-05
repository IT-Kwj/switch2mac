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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    float _95 = as_type<float>(_87);
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _93;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1769 = as_type<float>(_103);
        out.gl_Position.z = _1769;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_141);
        out.gl_Position.z = _1839;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.z;
    float _145 = in.m_49.w;
    float _147 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _155 = _153 != 0;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _163 = _143 * 2.0;
    float _165 = _149 * 2.0;
    float _167 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _169 = floor(_163);
    int _171 = as_type<int>(_157) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_157) & 2;
    bool _177 = _175 != 0;
    float _179 = -_159;
    float _181 = fma(_167, 2.0, _179);
    bool _183 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _195 = floor(_165);
    float _197 = fma(_193, -2.0, _161);
    float _199 = _149 + _151;
    bool _201 = !_173;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_177;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _199 + (-1.0);
    bool _211 = _169 > 0.0;
    float _213 = 0.0;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _217 = _147;
    if (!_191)
    {
        float _219 = _147 * _147;
        float _221 = _219 * 0.5;
        _213 = _221;
    }
    float _223 = _213;
    bool _225 = _169 >= 0.0;
    bool _227 = isnan(_169);
    bool _229 = _225 || _227;
    bool _231 = isnan(0.0);
    bool _233 = _229 || _231;
    float _235 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _237 = _169;
    float _239 = _223;
    if (!_155)
    {
        float _241 = in.m_49.z;
        _237 = _241;
    }
    float _243 = _237;
    if (!_191)
    {
        float _245 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _245;
    }
    float _247 = _239;
    int _249 = _233 ? 0 : 1;
    bool _251 = _195 > 0.0;
    int _253 = ~_249;
    int _255 = _253 + 1;
    int _257 = _255 + 1;
    bool _259 = _195 >= 0.0;
    bool _261 = isnan(_195);
    bool _263 = _259 || _261;
    bool _265 = isnan(0.0);
    bool _267 = _263 || _265;
    int _269 = _257;
    float _271 = _195;
    float _273 = _247;
    if (!_211)
    {
        int _275 = ~_249;
        int _277 = _275 + 1;
        _269 = _277;
    }
    int _279 = _269;
    bool _281 = !_191;
    float _283 = 0.0;
    float _285 = 0.0;
    float _287 = _243;
    if (!_281)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _147 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _147);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _307;
        _283 = _315;
        _215 = _305;
        _285 = _301;
        _273 = _317;
    }
    float _319 = _271;
    float _321 = _283;
    float _323 = _215;
    float _325 = _285;
    float _327 = _273;
    bool _329 = !_191;
    float _331 = _319;
    float _333 = _325;
    float _335 = _321;
    float _337 = _323;
    if (!_329)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = 1.0 / _345;
        float _349 = _147 * _341;
        float _351 = exp2(_349);
        float _353 = -_351;
        float _355 = _353 + 1.0;
        float _357 = _355 * _347;
        _331 = _351;
        _333 = _347;
        _217 = _357;
    }
    float _359 = _331;
    float _361 = _333;
    float _363 = _217;
    float _365 = _359;
    float _367 = _361;
    if (!_155)
    {
        _365 = _151;
    }
    float _369 = _365;
    float _371 = _151 * 2.0;
    float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _375 = log2(_373);
    float _377 = _369;
    if (!_155)
    {
        _367 = _369;
    }
    float _379 = _367;
    float _381 = -_121;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[76].x, _181);
    float _385 = _379;
    if (_155)
    {
        _377 = _151;
    }
    float _387 = _377;
    bool _389 = _151 > 0.5;
    bool _391 = _143 > 0.5;
    float _393 = floor(_371);
    float _395 = _387;
    if (!_155)
    {
        _335 = _243;
    }
    float _397 = _335;
    float _399 = _397;
    if (_155)
    {
        _337 = _149;
    }
    float _401 = _337;
    float _403 = _401;
    if (_155)
    {
        _399 = _387;
    }
    float _405 = _399;
    if (_155)
    {
        _287 = _387;
    }
    float _407 = _287;
    float _409 = _375 * _121;
    if (!_155)
    {
        _403 = _143;
    }
    float _411 = _403;
    float _413 = _405 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_155)
    {
        _385 = _149;
    }
    float _415 = _385;
    int _417 = _267 ? 0 : 1;
    float _419 = _411 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_155)
    {
        _395 = _149;
    }
    float _421 = _395;
    float _423 = exp2(_409);
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _435 = _433 != 0;
    float _437 = -_203;
    int _439 = _389 ? as_type<int>(_437) : as_type<int>(_203);
    float _441 = -_207;
    int _443 = _391 ? as_type<int>(_441) : as_type<int>(_207);
    bool _445 = !_431;
    float _447 = _445 ? _203 : as_type<float>(_439);
    bool _449 = !_435;
    float _451 = _449 ? _207 : as_type<float>(_443);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _463 = _461 != 0;
    int _465 = ~_417;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = -_423;
    float _473 = _471 + 1.0;
    int _475 = _469;
    if (!_251)
    {
        int _477 = ~_417;
        int _479 = _477 + 1;
        _475 = _479;
    }
    int _481 = _475;
    bool _483 = !_455;
    int _485 = _483 ? 0 : 1;
    int _487 = abs(_485);
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _491 = _393 > 0.0;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _495 = _393 >= 0.0;
    bool _497 = isnan(_393);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[83].z, _489);
    float _507 = _421 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _509 = _415 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _513 = float(_279);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _517 = float(_487);
    float _519 = -_511;
    float _521 = fma(_419, 2.0, _519);
    float _523 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[83].w, _515);
    float _525 = _517 * _513;
    float _527 = fma(_507, -2.0, _493);
    float _529 = in.m_54.x;
    float _531 = in.m_54.y;
    float _533 = in.m_54.z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _539 = _525 * (-2.0);
    float _541 = -_535;
    float _543 = fma(_509, 2.0, _541);
    float _545 = fma(_413, -2.0, _537);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _551 = 1.0 + _549;
    bool _553 = !_459;
    int _555 = _553 ? 0 : 1;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _559 = 1.0 / _551;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _565 = isnan(1.0);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _571 = _567 || _569;
    float _573 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _547);
    int _575 = abs(_555);
    float _577 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _557);
    float _579 = -_121;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _543);
    int _583 = _503 ? 0 : 1;
    float _585 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[88].z, _561);
    float _587 = fma(_539, _529, _529);
    bool _589 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _601 = _149 + (-0.5);
    float _603 = float(_481);
    float _605 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _577);
    float _607 = float(_575);
    float _609 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _585);
    float _611 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[88].w, _599);
    float _613 = _597 ? _473 : 0.0;
    float _615 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].x, _587);
    float _617 = _607 * _603;
    bool _619 = !_463;
    int _621 = _619 ? 0 : 1;
    float _623 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _197);
    float _625 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _573);
    float _627 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _611);
    float _629 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _505);
    float _631 = -_121;
    float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[86].x, _521);
    float _635 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _523);
    float _637 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _545);
    float _639 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _527);
    if (_571)
    {
        float _641 = _613 * _559;
        _123 = _641;
    }
    float _643 = _123;
    float _645 = fma(_235, _539, _235);
    int _647 = abs(_621);
    float _649 = in.m_56.x;
    float _651 = in.m_56.y;
    float _653 = _151 + _143;
    int _655 = ~_583;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    float _661 = fma(_645, _643, _615);
    int _663 = _659;
    if (!_491)
    {
        int _665 = ~_583;
        int _667 = _665 + 1;
        _663 = _667;
    }
    int _669 = _663;
    float _671 = _149 + _143;
    float _673 = _653 + (-1.0);
    float _675 = float(_669);
    float _677 = _671 + (-1.0);
    float _679 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _681 = float(_647);
    float _683 = _617 * (-2.0);
    float _685 = _661 * 0.15915493667125701904296875;
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _689 = _151 + (-0.5);
    float _691 = _681 * _675;
    float _693 = fma(_683, _531, _531);
    float _695 = fma(_679, _683, _679);
    float _697 = in.m_56.w;
    float _699 = _143 + (-0.5);
    float _701 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _703 = _691 * (-2.0);
    float _705 = in.m_47.x;
    float _707 = in.m_47.y;
    float _709 = in.m_47.z;
    float _711 = _649 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = fma(_695, _643, _701);
    float _715 = fma(_687, _703, _687);
    float _717 = in.m_42.x;
    float _719 = in.m_42.y;
    float _721 = in.m_42.z;
    float _723 = fma(_703, _533, _533);
    float _725 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _729 = _713 * 0.15915493667125701904296875;
    float _731 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _723);
    float _733 = _685 * 6.283185482025146484375;
    float _735 = sin(_733);
    float _737 = _725 * _727;
    float _739 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _741 = fma(_715, _643, _731);
    float _743 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _745 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _747 = _651 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = _685 * 6.283185482025146484375;
    float _753 = cos(_751);
    bool _755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _757 = isnan(0.5);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _763 = _759 || _761;
    float _765 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _767 = _145 > 0.5;
    float _769 = fma(_363, _705, _739);
    float _771 = fma(_363, _707, _743);
    float _773 = fma(_363, _709, _745);
    float _775 = _729 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = fma(_769, _697, _717);
    float _781 = fma(_771, _697, _719);
    float _783 = fma(_773, _697, _721);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _789 = _781 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _791 = _729 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _765 * _785;
    float _797 = _781 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[4].x, _787);
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[5].x, _789);
    float _803 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[6].x, _797);
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    float _807 = _749 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _735 * _777;
    float _813 = _753 * _777;
    float _815 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[5].z, _801);
    float _817 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[6].z, _803);
    float _819 = _749 * 6.283185482025146484375;
    float _821 = sin(_819);
    float _823 = _753 * _793;
    float _825 = _809 * _795;
    float _827 = _777 * _809;
    float _829 = _735 * _793;
    float _831 = _793 * _809;
    float _833 = _753 * _825;
    float _835 = _735 * _825;
    float _837 = _815 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _839 = fma(_821, _823, _811);
    float _841 = -_813;
    float _843 = fma(_821, _829, _841);
    float _845 = -_829;
    float _847 = fma(_821, _813, _845);
    float _849 = -_795;
    float _851 = _821 * _849;
    float _853 = fma(_839, _737, _833);
    float _855 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _857 = fma(_821, _811, _823);
    float _859 = fma(_831, _737, _851);
    float _861 = fma(_843, _737, _835);
    float _863 = fma(_847, _855, _853);
    float _865 = _805 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _867 = fma(_827, _855, _859);
    float _869 = fma(_857, _855, _861);
    float _871 = _863 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _873 = _863 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _875 = _837 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _877 = _817 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[10].x, _871);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[8].x, _873);
    float _883 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _875);
    float _885 = _837 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _887 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[10].z, _879);
    float _889 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[8].z, _881);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _883);
    float _893 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _885);
    float _895 = _877 + _887;
    float _897 = _865 + _889;
    float _899 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _893);
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _895 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _897 + _907;
    float _911 = 1.0 / _899;
    float _913 = _901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _915 = _905 * _905;
    float _917 = _863 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _919 = _913 + _899;
    float _921 = fma(_909, _909, _915);
    float _923 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[9].x, _917);
    float _925 = sqrt(_921);
    float _927 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[9].z, _923);
    float _929 = _919 * _911;
    float _931 = _929 * 0.5;
    float _933 = _837 + _927;
    float _935 = _911;
    float _937 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _939 = _899;
    float _941 = _895;
    float _943 = _897;
    float _945 = _729;
    if (_763)
    {
        _935 = 1.0;
    }
    float _947 = _935;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _951 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _949);
    float _953 = -_207;
    float _955 = _767 ? _953 : _207;
    bool _957 = !_427;
    float _959 = _957 ? _207 : _955;
    float _961 = 1.0 / _951;
    bool _963 = _925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = _955;
    float _967 = _947;
    if (!_963)
    {
        _965 = _897;
    }
    float _969 = _965;
    float _971 = _969;
    if (!_963)
    {
        _937 = _895;
    }
    float _973 = _937;
    float _975 = _973;
    if (!_963)
    {
        _939 = _933;
    }
    float _977 = _939;
    bool _979 = !_963;
    float _981 = _977;
    float _983 = _961;
    if (!_979)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _989 = _925 + _987;
        float _991 = rsqrt(_921);
        float _993 = _989 * _985;
        float _995 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = _997 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        float _1007 = _1001 + (-1.0);
        float _1009 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1013 = fma(_933, _1001, _1009);
        float _1015 = _991 * _1011;
        float _1017 = fma(_909, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = fma(_905, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _981 = _1013;
        _971 = _1017;
        _975 = _1019;
    }
    float _1021 = _981;
    float _1023 = _971;
    float _1025 = _975;
    if (_763)
    {
        _941 = 1.0;
    }
    float _1027 = _941;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1031 = _961 * _1029;
    float _1033 = _1027;
    if (!_763)
    {
        float _1035 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1037 = _1035 * 0.15915493667125701904296875;
        float _1039 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1041 = _1037 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 0.15915493667125701904296875;
        float _1047 = _1037 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = 1.0 / _1043;
        float _1053 = _1045 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        float _1057 = _1049 * _1051;
        float _1059 = _1045 * 6.283185482025146484375;
        float _1061 = sin(_1059);
        float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1065 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1063;
        float _1067 = _1055 * _1057;
        float _1069 = 1.0 / _1065;
        float _1071 = 1.0 / _1067;
        float _1073 = _1061 * _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1077 = fma(_1031, _1073, _1075);
        float _1079 = _1077 * _1069;
        float _1081 = precise::clamp(_1079, 0.0, 1.0);
        _983 = _1045;
        _967 = _1081;
    }
    float _1083 = _983;
    float _1085 = _967;
    float _1087 = _1083;
    if (!_763)
    {
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1095 = _1091 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1093 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = fma(_1031, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        float _1137 = -_1135;
        float _1139 = _1137 + 1.0;
        _1087 = _1103;
        _1033 = _1139;
    }
    float _1141 = _1087;
    float _1143 = _1033;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1147 = _1021 + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1151 = _1023 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1155 = _1025 + _1153;
    float _1157 = _1147 * _1147;
    float _1159 = fma(_1151, _1151, _1157);
    float _1161 = fma(_1155, _1155, _1159);
    float _1163 = rsqrt(_1161);
    float _1165 = sqrt(_1161);
    float _1167 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1169 = _1151 * _1167;
    float _1171 = _1155 * _1167;
    float _1173 = _1169 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 + _1175;
    float _1179 = sqrt(_1177);
    bool _1181 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = _1179 + _1183;
    float _1187 = _1163;
    float _1189 = _1177;
    float _1191 = _1185;
    float _1193 = _1147;
    float _1195 = _1167;
    if (_1181)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1197;
    }
    float _1199 = _1187;
    if (_1181)
    {
        float _1201 = rsqrt(_1177);
        _1189 = _1201;
    }
    float _1203 = _1189;
    float _1205 = _1203;
    if (_1181)
    {
        float _1207 = _1185 * _1199;
        _1191 = _1207;
    }
    float _1209 = _1191;
    if (_1181)
    {
        float _1211 = _1209 * 0.15915493667125701904296875;
        _943 = _1211;
    }
    float _1213 = _943;
    float _1215 = _1155;
    if (_1181)
    {
        float _1217 = _1213 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1225 = precise::max(0.0, _1223);
    float _1227 = _1141;
    float _1229 = _1225;
    float _1231 = _1223;
    if (_1181)
    {
        float _1233 = _1213 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        _1227 = _1235;
    }
    float _1237 = _1227;
    float _1239 = -_1167;
    float _1241 = -_1225;
    float _1243 = fma(_1147, _1239, _1241);
    if (!_1181)
    {
        _1193 = _1171;
    }
    float _1245 = _1193;
    float _1247 = _1245;
    if (_1181)
    {
        float _1249 = _1243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1249;
    }
    float _1251 = _1229;
    float _1253 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1255 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1257 = _1221;
    float _1259 = _1251;
    if (_1181)
    {
        float _1261 = fma(_1221, _1251, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1257 = _1261;
    }
    float _1263 = _1257;
    float _1265 = _1263;
    if (!_1181)
    {
        _1259 = _1169;
    }
    float _1267 = _1259;
    float _1269 = _1267;
    if (_1181)
    {
        float _1271 = _1237 + (-1.0);
        _1231 = _1271;
    }
    float _1273 = _1231;
    float _1275 = _1273;
    if (_1181)
    {
        float _1277 = _1203 * _1263;
        _945 = _1277;
    }
    float _1279 = _945;
    if (!_1181)
    {
        _1265 = _1243;
    }
    float _1281 = _1265;
    float _1283 = _1281;
    if (_1181)
    {
        float _1285 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1285;
    }
    float _1287 = _1195;
    if (_1181)
    {
        float _1289 = _1169 * _1279;
        _1269 = _1289;
    }
    float _1291 = _1269;
    if (!_1181)
    {
        _1205 = _1173;
    }
    float _1293 = _1205;
    float _1295 = _1293;
    if (_1181)
    {
        float _1297 = _1171 * _1279;
        _1247 = _1297;
    }
    float _1299 = _1247;
    if (_1181)
    {
        float _1301 = fma(_1243, _1237, _1287);
        _1283 = _1301;
    }
    float _1303 = _1283;
    if (_1181)
    {
        float _1305 = _1291 * _1291;
        _1295 = _1305;
    }
    float _1307 = _1295;
    if (!_1181)
    {
        _1275 = _1175;
    }
    float _1309 = _1275;
    float _1311 = _1309;
    if (_1181)
    {
        float _1313 = _1299 * _1299;
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = fma(_1303, _1303, _1307);
    float _1319 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1321 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1255);
    float _1323 = _1317 + _1315;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1327 = fma(_1165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1325);
    float _1329 = precise::clamp(_1327, 0.0, 1.0);
    float _1331 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1319);
    float _1333 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1337 = -_1329;
    float _1339 = _1337 + 1.0;
    float _1341 = rsqrt(_1323);
    float _1343 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1345 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1331);
    float _1347 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1335);
    float _1349 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1321);
    float _1351 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1343);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1347);
    float _1357 = abs(_1339);
    float _1359 = log2(_1357);
    float _1361 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1363 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1367 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1373 = -_1365;
    float _1375 = fma(_1373, _1253, 1.0);
    float _1377 = _1341 * _1291;
    float _1379 = _1341 * _1303;
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1369);
    float _1383 = _1341 * _1299;
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1387 = log2(_1375);
    float _1389 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1381);
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1393 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1395 = -_1385;
    float _1397 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1395);
    float _1399 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1391);
    float _1401 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1371);
    float _1403 = exp2(_1393);
    float _1405 = -_1383;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1397);
    float _1409 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1411 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1399);
    float _1413 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1401);
    float _1415 = fma(_1407, -0.5, 0.5);
    float _1417 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1411);
    float _1419 = 1.0 / _1409;
    float _1421 = fma(_1407, 0.5, 0.5);
    float _1423 = _1379 + 1.0;
    float _1425 = _1387 * 0.693147182464599609375;
    float _1427 = fma(_1421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1431 = sqrt(_1415);
    float _1433 = -_1379;
    float _1435 = fma(_1403, _1423, _1433);
    float _1437 = fma(_1421, _1427, -0.212114393711090087890625);
    float _1439 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1413);
    float _1441 = fma(_1421, _1437, 1.570728778839111328125);
    float _1443 = _1417 * _1419;
    float _1445 = _1439 * _1419;
    float _1447 = fma(_1443, 0.5, 0.5);
    float _1449 = fma(_1445, -0.5, 0.5);
    float _1451 = fma(_1435, 0.5, 0.5);
    float _1453 = _1431 * 0.636619746685028076171875;
    float3 _3891 = float3(_1447, _1449, _1429);
    float _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3891, float3(0.0), isnan(_3891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3891, float3(0.0), isnan(_3891)), level(0.0)).x;
    float _1457 = -_1441;
    float _1459 = fma(_1453, _1457, 1.0);
    float3 _3907 = float3(_1447, _1449, _1429);
    float4 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3907, float3(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3907, float3(0.0), isnan(_3907)), level(0.0)).xyzw;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = _1462.w;
    float2 _3924 = float2(_1459, _1451);
    float3 _1474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3924, float2(0.0), isnan(_3924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3924, float2(0.0), isnan(_3924)), level(0.0)).xyz;
    float _1476 = _1474.x;
    float _1478 = _1474.y;
    float _1480 = _1474.z;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1484 = _149 > 0.5;
    float _1486 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1490 = _1488 != 0;
    float _1492 = _959 + (-0.5);
    float _1494 = -_207;
    int _1496 = _389 ? as_type<int>(_1494) : as_type<int>(_207);
    float _1498 = -_609;
    float _1500 = _1498 + 1.0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1504 = _1502 != 0;
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1508 = -_203;
    int _1510 = _1484 ? as_type<int>(_1508) : as_type<int>(_203);
    float _1512 = -_627;
    float _1514 = _1512 + 1.0;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1518 = _1516 != 0;
    float _1520 = -_629;
    float _1522 = _1520 + 1.0;
    bool _1524 = !_1490;
    float _1526 = _1524 ? _207 : as_type<float>(_1496);
    float _1528 = -_625;
    float _1530 = _1528 + 1.0;
    bool _1532 = !_1504;
    float _1534 = _1532 ? _203 : as_type<float>(_1510);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1538 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1540 = _1526 + (-0.5);
    float _1542 = _1534 + 0.5;
    float _1544 = -_1538;
    float _1546 = -_623;
    float _1548 = fma(_1544, _1540, _1546);
    float _1550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1552 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1556 = fma(_1552, _1542, _383);
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1560 = exp2(_1486);
    float _1562 = -_203;
    int _1564 = _391 ? as_type<int>(_1562) : as_type<int>(_203);
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1574 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1578 = !_1518;
    float _1580 = _1578 ? _203 : as_type<float>(_1564);
    float _1582 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1586 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1590 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1596 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1600 = _1580 + 0.5;
    out.m_58.x = _1590;
    out.m_58.y = _1592;
    out.m_58.z = _1582;
    out.m_58.w = _1588;
    float _1602 = -_1560;
    float _1604 = _1602 + 1.0;
    float _1606 = -_1598;
    float _1608 = -_637;
    float _1610 = fma(_1606, _1492, _1608);
    float _1612 = fma(_1574, _1600, _581);
    float _1614 = -_635;
    float _1616 = _1614 + 1.0;
    float _1618 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1620 = _1085 > 0.0;
    bool _1622 = isnan(_1085);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan(0.0);
    bool _1628 = _1624 || _1626;
    float _1630 = fma(_959, _1616, _1610);
    float _1632 = -_605;
    float _1634 = _1632 + 1.0;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1638 = _1143 <= 0.0;
    bool _1640 = !_1628;
    bool _1642 = _1638 || _1640;
    float _1644 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1646 = -_1522;
    float _1648 = fma(_1580, _1646, _1612);
    float _1650 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1652 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1654 = _447 + 0.5;
    float _1656 = _451 + (-0.5);
    float _1658 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1650);
    out.m_60.x = _1584;
    out.m_60.y = _1586;
    out.m_60.z = _1596;
    out.m_60.w = _1636;
    float _1660 = fma(_1652, _1654, _633);
    float _1662 = -_1644;
    float _1664 = -_639;
    float _1666 = fma(_1662, _1656, _1664);
    float _1668 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1658);
    float _1670 = _1085 * _1143;
    float _1672 = -_1500;
    float _1674 = fma(_447, _1672, _1660);
    float _1676 = fma(_451, _1514, _1666);
    float _1678 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1668);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1682 = fma(_1526, _1530, _1548);
    float _1684 = -_1634;
    float _1686 = fma(_1534, _1684, _1556);
    float _1688 = _1678 + _1409;
    out.m_62.x = _1674;
    out.m_62.y = _1676;
    float _1690 = -_1618;
    float _1692 = _1690 + 1.0;
    float _1694 = _1680 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1696 = _1688 * 0.5;
    out.m_64.x = _1686;
    out.m_64.y = _1682;
    out.m_64.z = _1648;
    out.m_64.w = _1630;
    out.m_45.x = _1694;
    out.gl_Position.x = _1417;
    out.gl_Position.y = _1439;
    out.gl_Position.z = _1678;
    out.gl_Position.w = _1409;
    out.m_66.z = _1696;
    out.m_66.w = _1409;
    float _1698 = _1618 * _1455;
    float _1700 = _1470 * _1698;
    float _1702 = _1480 * _1698;
    float _1704 = fma(_1476, _1700, _1464);
    float _1706 = fma(_1478, _1700, _1466);
    float _1708 = _1470 * _1692;
    float _1710 = fma(_1470, _1702, _1468);
    out.m_68.x = _1704;
    out.m_68.y = _1706;
    out.m_68.z = _1710;
    out.m_68.w = _1708;
    if (!_1642)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1712;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    float _95 = as_type<float>(_87);
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _93;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1769 = as_type<float>(_103);
        out.gl_Position.z = _1769;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_141);
        out.gl_Position.z = _1839;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.z;
    float _145 = in.m_49.w;
    float _147 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _155 = _153 != 0;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _163 = _143 * 2.0;
    float _165 = _149 * 2.0;
    float _167 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _169 = floor(_163);
    int _171 = as_type<int>(_157) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_157) & 2;
    bool _177 = _175 != 0;
    float _179 = -_159;
    float _181 = fma(_167, 2.0, _179);
    bool _183 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _195 = floor(_165);
    float _197 = fma(_193, -2.0, _161);
    float _199 = _149 + _151;
    bool _201 = !_173;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_177;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _199 + (-1.0);
    bool _211 = _169 > 0.0;
    float _213 = 0.0;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _217 = _147;
    if (!_191)
    {
        float _219 = _147 * _147;
        float _221 = _219 * 0.5;
        _213 = _221;
    }
    float _223 = _213;
    bool _225 = _169 >= 0.0;
    bool _227 = isnan(_169);
    bool _229 = _225 || _227;
    bool _231 = isnan(0.0);
    bool _233 = _229 || _231;
    float _235 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _237 = _169;
    float _239 = _223;
    if (!_155)
    {
        float _241 = in.m_49.z;
        _237 = _241;
    }
    float _243 = _237;
    if (!_191)
    {
        float _245 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _245;
    }
    float _247 = _239;
    int _249 = _233 ? 0 : 1;
    bool _251 = _195 > 0.0;
    int _253 = ~_249;
    int _255 = _253 + 1;
    int _257 = _255 + 1;
    bool _259 = _195 >= 0.0;
    bool _261 = isnan(_195);
    bool _263 = _259 || _261;
    bool _265 = isnan(0.0);
    bool _267 = _263 || _265;
    int _269 = _257;
    float _271 = _195;
    float _273 = _247;
    if (!_211)
    {
        int _275 = ~_249;
        int _277 = _275 + 1;
        _269 = _277;
    }
    int _279 = _269;
    bool _281 = !_191;
    float _283 = 0.0;
    float _285 = 0.0;
    float _287 = _243;
    if (!_281)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _147 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _147);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _307;
        _283 = _315;
        _215 = _305;
        _285 = _301;
        _273 = _317;
    }
    float _319 = _271;
    float _321 = _283;
    float _323 = _215;
    float _325 = _285;
    float _327 = _273;
    bool _329 = !_191;
    float _331 = _319;
    float _333 = _325;
    float _335 = _321;
    float _337 = _323;
    if (!_329)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = 1.0 / _345;
        float _349 = _147 * _341;
        float _351 = exp2(_349);
        float _353 = -_351;
        float _355 = _353 + 1.0;
        float _357 = _355 * _347;
        _331 = _351;
        _333 = _347;
        _217 = _357;
    }
    float _359 = _331;
    float _361 = _333;
    float _363 = _217;
    float _365 = _359;
    float _367 = _361;
    if (!_155)
    {
        _365 = _151;
    }
    float _369 = _365;
    float _371 = _151 * 2.0;
    float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _375 = log2(_373);
    float _377 = _369;
    if (!_155)
    {
        _367 = _369;
    }
    float _379 = _367;
    float _381 = -_121;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[76].x, _181);
    float _385 = _379;
    if (_155)
    {
        _377 = _151;
    }
    float _387 = _377;
    bool _389 = _151 > 0.5;
    bool _391 = _143 > 0.5;
    float _393 = floor(_371);
    float _395 = _387;
    if (!_155)
    {
        _335 = _243;
    }
    float _397 = _335;
    float _399 = _397;
    if (_155)
    {
        _337 = _149;
    }
    float _401 = _337;
    float _403 = _401;
    if (_155)
    {
        _399 = _387;
    }
    float _405 = _399;
    if (_155)
    {
        _287 = _387;
    }
    float _407 = _287;
    float _409 = _375 * _121;
    if (!_155)
    {
        _403 = _143;
    }
    float _411 = _403;
    float _413 = _405 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_155)
    {
        _385 = _149;
    }
    float _415 = _385;
    int _417 = _267 ? 0 : 1;
    float _419 = _411 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_155)
    {
        _395 = _149;
    }
    float _421 = _395;
    float _423 = exp2(_409);
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _435 = _433 != 0;
    float _437 = -_203;
    int _439 = _389 ? as_type<int>(_437) : as_type<int>(_203);
    float _441 = -_207;
    int _443 = _391 ? as_type<int>(_441) : as_type<int>(_207);
    bool _445 = !_431;
    float _447 = _445 ? _203 : as_type<float>(_439);
    bool _449 = !_435;
    float _451 = _449 ? _207 : as_type<float>(_443);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _463 = _461 != 0;
    int _465 = ~_417;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = -_423;
    float _473 = _471 + 1.0;
    int _475 = _469;
    if (!_251)
    {
        int _477 = ~_417;
        int _479 = _477 + 1;
        _475 = _479;
    }
    int _481 = _475;
    bool _483 = !_455;
    int _485 = _483 ? 0 : 1;
    int _487 = abs(_485);
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _491 = _393 > 0.0;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _495 = _393 >= 0.0;
    bool _497 = isnan(_393);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[83].z, _489);
    float _507 = _421 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _509 = _415 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _513 = float(_279);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _517 = float(_487);
    float _519 = -_511;
    float _521 = fma(_419, 2.0, _519);
    float _523 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[83].w, _515);
    float _525 = _517 * _513;
    float _527 = fma(_507, -2.0, _493);
    float _529 = in.m_54.x;
    float _531 = in.m_54.y;
    float _533 = in.m_54.z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _539 = _525 * (-2.0);
    float _541 = -_535;
    float _543 = fma(_509, 2.0, _541);
    float _545 = fma(_413, -2.0, _537);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _551 = 1.0 + _549;
    bool _553 = !_459;
    int _555 = _553 ? 0 : 1;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _559 = 1.0 / _551;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _565 = isnan(1.0);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _571 = _567 || _569;
    float _573 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _547);
    int _575 = abs(_555);
    float _577 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _557);
    float _579 = -_121;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _543);
    int _583 = _503 ? 0 : 1;
    float _585 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[88].z, _561);
    float _587 = fma(_539, _529, _529);
    bool _589 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _601 = _149 + (-0.5);
    float _603 = float(_481);
    float _605 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _577);
    float _607 = float(_575);
    float _609 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _585);
    float _611 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[88].w, _599);
    float _613 = _597 ? _473 : 0.0;
    float _615 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].x, _587);
    float _617 = _607 * _603;
    bool _619 = !_463;
    int _621 = _619 ? 0 : 1;
    float _623 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _197);
    float _625 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _573);
    float _627 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _611);
    float _629 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _505);
    float _631 = -_121;
    float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[86].x, _521);
    float _635 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _523);
    float _637 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _545);
    float _639 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _527);
    if (_571)
    {
        float _641 = _613 * _559;
        _123 = _641;
    }
    float _643 = _123;
    float _645 = fma(_235, _539, _235);
    int _647 = abs(_621);
    float _649 = in.m_56.x;
    float _651 = in.m_56.y;
    float _653 = _151 + _143;
    int _655 = ~_583;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    float _661 = fma(_645, _643, _615);
    int _663 = _659;
    if (!_491)
    {
        int _665 = ~_583;
        int _667 = _665 + 1;
        _663 = _667;
    }
    int _669 = _663;
    float _671 = _149 + _143;
    float _673 = _653 + (-1.0);
    float _675 = float(_669);
    float _677 = _671 + (-1.0);
    float _679 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _681 = float(_647);
    float _683 = _617 * (-2.0);
    float _685 = _661 * 0.15915493667125701904296875;
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _689 = _151 + (-0.5);
    float _691 = _681 * _675;
    float _693 = fma(_683, _531, _531);
    float _695 = fma(_679, _683, _679);
    float _697 = in.m_56.w;
    float _699 = _143 + (-0.5);
    float _701 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _703 = _691 * (-2.0);
    float _705 = in.m_47.x;
    float _707 = in.m_47.y;
    float _709 = in.m_47.z;
    float _711 = _649 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = fma(_695, _643, _701);
    float _715 = fma(_687, _703, _687);
    float _717 = in.m_42.x;
    float _719 = in.m_42.y;
    float _721 = in.m_42.z;
    float _723 = fma(_703, _533, _533);
    float _725 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _729 = _713 * 0.15915493667125701904296875;
    float _731 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _723);
    float _733 = _685 * 6.283185482025146484375;
    float _735 = sin(_733);
    float _737 = _725 * _727;
    float _739 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _741 = fma(_715, _643, _731);
    float _743 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _745 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _747 = _651 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = _685 * 6.283185482025146484375;
    float _753 = cos(_751);
    bool _755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _757 = isnan(0.5);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _763 = _759 || _761;
    float _765 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _767 = _145 > 0.5;
    float _769 = fma(_363, _705, _739);
    float _771 = fma(_363, _707, _743);
    float _773 = fma(_363, _709, _745);
    float _775 = _729 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = fma(_769, _697, _717);
    float _781 = fma(_771, _697, _719);
    float _783 = fma(_773, _697, _721);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _789 = _781 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _791 = _729 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _765 * _785;
    float _797 = _781 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[4].x, _787);
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[5].x, _789);
    float _803 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[6].x, _797);
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    float _807 = _749 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _735 * _777;
    float _813 = _753 * _777;
    float _815 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[5].z, _801);
    float _817 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[6].z, _803);
    float _819 = _749 * 6.283185482025146484375;
    float _821 = sin(_819);
    float _823 = _753 * _793;
    float _825 = _809 * _795;
    float _827 = _777 * _809;
    float _829 = _735 * _793;
    float _831 = _793 * _809;
    float _833 = _753 * _825;
    float _835 = _735 * _825;
    float _837 = _815 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _839 = fma(_821, _823, _811);
    float _841 = -_813;
    float _843 = fma(_821, _829, _841);
    float _845 = -_829;
    float _847 = fma(_821, _813, _845);
    float _849 = -_795;
    float _851 = _821 * _849;
    float _853 = fma(_839, _737, _833);
    float _855 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _857 = fma(_821, _811, _823);
    float _859 = fma(_831, _737, _851);
    float _861 = fma(_843, _737, _835);
    float _863 = fma(_847, _855, _853);
    float _865 = _805 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _867 = fma(_827, _855, _859);
    float _869 = fma(_857, _855, _861);
    float _871 = _863 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _873 = _863 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _875 = _837 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _877 = _817 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[10].x, _871);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[8].x, _873);
    float _883 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _875);
    float _885 = _837 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _887 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[10].z, _879);
    float _889 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[8].z, _881);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _883);
    float _893 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _885);
    float _895 = _877 + _887;
    float _897 = _865 + _889;
    float _899 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _893);
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _895 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _897 + _907;
    float _911 = 1.0 / _899;
    float _913 = _901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _915 = _905 * _905;
    float _917 = _863 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _919 = _913 + _899;
    float _921 = fma(_909, _909, _915);
    float _923 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[9].x, _917);
    float _925 = sqrt(_921);
    float _927 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[9].z, _923);
    float _929 = _919 * _911;
    float _931 = _929 * 0.5;
    float _933 = _837 + _927;
    float _935 = _911;
    float _937 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _939 = _899;
    float _941 = _895;
    float _943 = _897;
    float _945 = _729;
    if (_763)
    {
        _935 = 1.0;
    }
    float _947 = _935;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _951 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _949);
    float _953 = -_207;
    float _955 = _767 ? _953 : _207;
    bool _957 = !_427;
    float _959 = _957 ? _207 : _955;
    float _961 = 1.0 / _951;
    bool _963 = _925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = _955;
    float _967 = _947;
    if (!_963)
    {
        _965 = _897;
    }
    float _969 = _965;
    float _971 = _969;
    if (!_963)
    {
        _937 = _895;
    }
    float _973 = _937;
    float _975 = _973;
    if (!_963)
    {
        _939 = _933;
    }
    float _977 = _939;
    bool _979 = !_963;
    float _981 = _977;
    float _983 = _961;
    if (!_979)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _989 = _925 + _987;
        float _991 = rsqrt(_921);
        float _993 = _989 * _985;
        float _995 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = _997 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        float _1007 = _1001 + (-1.0);
        float _1009 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1013 = fma(_933, _1001, _1009);
        float _1015 = _991 * _1011;
        float _1017 = fma(_909, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = fma(_905, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _981 = _1013;
        _971 = _1017;
        _975 = _1019;
    }
    float _1021 = _981;
    float _1023 = _971;
    float _1025 = _975;
    if (_763)
    {
        _941 = 1.0;
    }
    float _1027 = _941;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1031 = _961 * _1029;
    float _1033 = _1027;
    if (!_763)
    {
        float _1035 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1037 = _1035 * 0.15915493667125701904296875;
        float _1039 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1041 = _1037 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 0.15915493667125701904296875;
        float _1047 = _1037 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = 1.0 / _1043;
        float _1053 = _1045 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        float _1057 = _1049 * _1051;
        float _1059 = _1045 * 6.283185482025146484375;
        float _1061 = sin(_1059);
        float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1065 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1063;
        float _1067 = _1055 * _1057;
        float _1069 = 1.0 / _1065;
        float _1071 = 1.0 / _1067;
        float _1073 = _1061 * _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1077 = fma(_1031, _1073, _1075);
        float _1079 = _1077 * _1069;
        float _1081 = precise::clamp(_1079, 0.0, 1.0);
        _983 = _1045;
        _967 = _1081;
    }
    float _1083 = _983;
    float _1085 = _967;
    float _1087 = _1083;
    if (!_763)
    {
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1095 = _1091 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1093 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = fma(_1031, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        float _1137 = -_1135;
        float _1139 = _1137 + 1.0;
        _1087 = _1103;
        _1033 = _1139;
    }
    float _1141 = _1087;
    float _1143 = _1033;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1147 = _1021 + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1151 = _1023 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1155 = _1025 + _1153;
    float _1157 = _1147 * _1147;
    float _1159 = fma(_1151, _1151, _1157);
    float _1161 = fma(_1155, _1155, _1159);
    float _1163 = rsqrt(_1161);
    float _1165 = sqrt(_1161);
    float _1167 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1169 = _1151 * _1167;
    float _1171 = _1155 * _1167;
    float _1173 = _1169 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 + _1175;
    float _1179 = sqrt(_1177);
    bool _1181 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = _1179 + _1183;
    float _1187 = _1163;
    float _1189 = _1177;
    float _1191 = _1185;
    float _1193 = _1147;
    float _1195 = _1167;
    if (_1181)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1197;
    }
    float _1199 = _1187;
    if (_1181)
    {
        float _1201 = rsqrt(_1177);
        _1189 = _1201;
    }
    float _1203 = _1189;
    float _1205 = _1203;
    if (_1181)
    {
        float _1207 = _1185 * _1199;
        _1191 = _1207;
    }
    float _1209 = _1191;
    if (_1181)
    {
        float _1211 = _1209 * 0.15915493667125701904296875;
        _943 = _1211;
    }
    float _1213 = _943;
    float _1215 = _1155;
    if (_1181)
    {
        float _1217 = _1213 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1225 = precise::max(0.0, _1223);
    float _1227 = _1141;
    float _1229 = _1225;
    float _1231 = _1223;
    if (_1181)
    {
        float _1233 = _1213 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        _1227 = _1235;
    }
    float _1237 = _1227;
    float _1239 = -_1167;
    float _1241 = -_1225;
    float _1243 = fma(_1147, _1239, _1241);
    if (!_1181)
    {
        _1193 = _1171;
    }
    float _1245 = _1193;
    float _1247 = _1245;
    if (_1181)
    {
        float _1249 = _1243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1249;
    }
    float _1251 = _1229;
    float _1253 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1255 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1257 = _1221;
    float _1259 = _1251;
    if (_1181)
    {
        float _1261 = fma(_1221, _1251, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1257 = _1261;
    }
    float _1263 = _1257;
    float _1265 = _1263;
    if (!_1181)
    {
        _1259 = _1169;
    }
    float _1267 = _1259;
    float _1269 = _1267;
    if (_1181)
    {
        float _1271 = _1237 + (-1.0);
        _1231 = _1271;
    }
    float _1273 = _1231;
    float _1275 = _1273;
    if (_1181)
    {
        float _1277 = _1203 * _1263;
        _945 = _1277;
    }
    float _1279 = _945;
    if (!_1181)
    {
        _1265 = _1243;
    }
    float _1281 = _1265;
    float _1283 = _1281;
    if (_1181)
    {
        float _1285 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1285;
    }
    float _1287 = _1195;
    if (_1181)
    {
        float _1289 = _1169 * _1279;
        _1269 = _1289;
    }
    float _1291 = _1269;
    if (!_1181)
    {
        _1205 = _1173;
    }
    float _1293 = _1205;
    float _1295 = _1293;
    if (_1181)
    {
        float _1297 = _1171 * _1279;
        _1247 = _1297;
    }
    float _1299 = _1247;
    if (_1181)
    {
        float _1301 = fma(_1243, _1237, _1287);
        _1283 = _1301;
    }
    float _1303 = _1283;
    if (_1181)
    {
        float _1305 = _1291 * _1291;
        _1295 = _1305;
    }
    float _1307 = _1295;
    if (!_1181)
    {
        _1275 = _1175;
    }
    float _1309 = _1275;
    float _1311 = _1309;
    if (_1181)
    {
        float _1313 = _1299 * _1299;
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = fma(_1303, _1303, _1307);
    float _1319 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1321 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1255);
    float _1323 = _1317 + _1315;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1327 = fma(_1165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1325);
    float _1329 = precise::clamp(_1327, 0.0, 1.0);
    float _1331 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1319);
    float _1333 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1337 = -_1329;
    float _1339 = _1337 + 1.0;
    float _1341 = rsqrt(_1323);
    float _1343 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1345 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1331);
    float _1347 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1335);
    float _1349 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1321);
    float _1351 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1343);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1347);
    float _1357 = abs(_1339);
    float _1359 = log2(_1357);
    float _1361 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1363 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1367 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1373 = -_1365;
    float _1375 = fma(_1373, _1253, 1.0);
    float _1377 = _1341 * _1291;
    float _1379 = _1341 * _1303;
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1369);
    float _1383 = _1341 * _1299;
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1387 = log2(_1375);
    float _1389 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1381);
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1393 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1395 = -_1385;
    float _1397 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1395);
    float _1399 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1391);
    float _1401 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1371);
    float _1403 = exp2(_1393);
    float _1405 = -_1383;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1397);
    float _1409 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1411 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1399);
    float _1413 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1401);
    float _1415 = fma(_1407, -0.5, 0.5);
    float _1417 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1411);
    float _1419 = 1.0 / _1409;
    float _1421 = fma(_1407, 0.5, 0.5);
    float _1423 = _1379 + 1.0;
    float _1425 = _1387 * 0.693147182464599609375;
    float _1427 = fma(_1421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1431 = sqrt(_1415);
    float _1433 = -_1379;
    float _1435 = fma(_1403, _1423, _1433);
    float _1437 = fma(_1421, _1427, -0.212114393711090087890625);
    float _1439 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1413);
    float _1441 = fma(_1421, _1437, 1.570728778839111328125);
    float _1443 = _1417 * _1419;
    float _1445 = _1439 * _1419;
    float _1447 = fma(_1443, 0.5, 0.5);
    float _1449 = fma(_1445, -0.5, 0.5);
    float _1451 = fma(_1435, 0.5, 0.5);
    float _1453 = _1431 * 0.636619746685028076171875;
    float3 _3891 = float3(_1447, _1449, _1429);
    float _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3891, float3(0.0), isnan(_3891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3891, float3(0.0), isnan(_3891)), level(0.0)).x;
    float _1457 = -_1441;
    float _1459 = fma(_1453, _1457, 1.0);
    float3 _3907 = float3(_1447, _1449, _1429);
    float4 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3907, float3(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3907, float3(0.0), isnan(_3907)), level(0.0)).xyzw;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = _1462.w;
    float2 _3924 = float2(_1459, _1451);
    float3 _1474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3924, float2(0.0), isnan(_3924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3924, float2(0.0), isnan(_3924)), level(0.0)).xyz;
    float _1476 = _1474.x;
    float _1478 = _1474.y;
    float _1480 = _1474.z;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1484 = _149 > 0.5;
    float _1486 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1490 = _1488 != 0;
    float _1492 = _959 + (-0.5);
    float _1494 = -_207;
    int _1496 = _389 ? as_type<int>(_1494) : as_type<int>(_207);
    float _1498 = -_609;
    float _1500 = _1498 + 1.0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1504 = _1502 != 0;
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1508 = -_203;
    int _1510 = _1484 ? as_type<int>(_1508) : as_type<int>(_203);
    float _1512 = -_627;
    float _1514 = _1512 + 1.0;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1518 = _1516 != 0;
    float _1520 = -_629;
    float _1522 = _1520 + 1.0;
    bool _1524 = !_1490;
    float _1526 = _1524 ? _207 : as_type<float>(_1496);
    float _1528 = -_625;
    float _1530 = _1528 + 1.0;
    bool _1532 = !_1504;
    float _1534 = _1532 ? _203 : as_type<float>(_1510);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1538 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1540 = _1526 + (-0.5);
    float _1542 = _1534 + 0.5;
    float _1544 = -_1538;
    float _1546 = -_623;
    float _1548 = fma(_1544, _1540, _1546);
    float _1550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1552 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1556 = fma(_1552, _1542, _383);
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1560 = exp2(_1486);
    float _1562 = -_203;
    int _1564 = _391 ? as_type<int>(_1562) : as_type<int>(_203);
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1574 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1578 = !_1518;
    float _1580 = _1578 ? _203 : as_type<float>(_1564);
    float _1582 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1586 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1590 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1596 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1600 = _1580 + 0.5;
    out.m_58.x = _1590;
    out.m_58.y = _1592;
    out.m_58.z = _1582;
    out.m_58.w = _1588;
    float _1602 = -_1560;
    float _1604 = _1602 + 1.0;
    float _1606 = -_1598;
    float _1608 = -_637;
    float _1610 = fma(_1606, _1492, _1608);
    float _1612 = fma(_1574, _1600, _581);
    float _1614 = -_635;
    float _1616 = _1614 + 1.0;
    float _1618 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1620 = _1085 > 0.0;
    bool _1622 = isnan(_1085);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan(0.0);
    bool _1628 = _1624 || _1626;
    float _1630 = fma(_959, _1616, _1610);
    float _1632 = -_605;
    float _1634 = _1632 + 1.0;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1638 = _1143 <= 0.0;
    bool _1640 = !_1628;
    bool _1642 = _1638 || _1640;
    float _1644 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1646 = -_1522;
    float _1648 = fma(_1580, _1646, _1612);
    float _1650 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1652 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1654 = _447 + 0.5;
    float _1656 = _451 + (-0.5);
    float _1658 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1650);
    out.m_60.x = _1584;
    out.m_60.y = _1586;
    out.m_60.z = _1596;
    out.m_60.w = _1636;
    float _1660 = fma(_1652, _1654, _633);
    float _1662 = -_1644;
    float _1664 = -_639;
    float _1666 = fma(_1662, _1656, _1664);
    float _1668 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1658);
    float _1670 = _1085 * _1143;
    float _1672 = -_1500;
    float _1674 = fma(_447, _1672, _1660);
    float _1676 = fma(_451, _1514, _1666);
    float _1678 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1668);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1682 = fma(_1526, _1530, _1548);
    float _1684 = -_1634;
    float _1686 = fma(_1534, _1684, _1556);
    float _1688 = _1678 + _1409;
    out.m_62.x = _1674;
    out.m_62.y = _1676;
    float _1690 = -_1618;
    float _1692 = _1690 + 1.0;
    float _1694 = _1680 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1696 = _1688 * 0.5;
    out.m_64.x = _1686;
    out.m_64.y = _1682;
    out.m_64.z = _1648;
    out.m_64.w = _1630;
    out.m_45.x = _1694;
    out.gl_Position.x = _1417;
    out.gl_Position.y = _1439;
    out.gl_Position.z = _1678;
    out.gl_Position.w = _1409;
    out.m_66.z = _1696;
    out.m_66.w = _1409;
    float _1698 = _1618 * _1455;
    float _1700 = _1470 * _1698;
    float _1702 = _1480 * _1698;
    float _1704 = fma(_1476, _1700, _1464);
    float _1706 = fma(_1478, _1700, _1466);
    float _1708 = _1470 * _1692;
    float _1710 = fma(_1470, _1702, _1468);
    out.m_68.x = _1704;
    out.m_68.y = _1706;
    out.m_68.z = _1710;
    out.m_68.w = _1708;
    if (!_1642)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1712;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    float _95 = as_type<float>(_87);
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _93;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1769 = as_type<float>(_103);
        out.gl_Position.z = _1769;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_141);
        out.gl_Position.z = _1839;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.z;
    float _145 = in.m_49.w;
    float _147 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _155 = _153 != 0;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _163 = _143 * 2.0;
    float _165 = _149 * 2.0;
    float _167 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _169 = floor(_163);
    int _171 = as_type<int>(_157) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_157) & 2;
    bool _177 = _175 != 0;
    float _179 = -_159;
    float _181 = fma(_167, 2.0, _179);
    bool _183 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _195 = floor(_165);
    float _197 = fma(_193, -2.0, _161);
    float _199 = _149 + _151;
    bool _201 = !_173;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_177;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _199 + (-1.0);
    bool _211 = _169 > 0.0;
    float _213 = 0.0;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _217 = _147;
    if (!_191)
    {
        float _219 = _147 * _147;
        float _221 = _219 * 0.5;
        _213 = _221;
    }
    float _223 = _213;
    bool _225 = _169 >= 0.0;
    bool _227 = isnan(_169);
    bool _229 = _225 || _227;
    bool _231 = isnan(0.0);
    bool _233 = _229 || _231;
    float _235 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _237 = _169;
    float _239 = _223;
    if (!_155)
    {
        float _241 = in.m_49.z;
        _237 = _241;
    }
    float _243 = _237;
    if (!_191)
    {
        float _245 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _245;
    }
    float _247 = _239;
    int _249 = _233 ? 0 : 1;
    bool _251 = _195 > 0.0;
    int _253 = ~_249;
    int _255 = _253 + 1;
    int _257 = _255 + 1;
    bool _259 = _195 >= 0.0;
    bool _261 = isnan(_195);
    bool _263 = _259 || _261;
    bool _265 = isnan(0.0);
    bool _267 = _263 || _265;
    int _269 = _257;
    float _271 = _195;
    float _273 = _247;
    if (!_211)
    {
        int _275 = ~_249;
        int _277 = _275 + 1;
        _269 = _277;
    }
    int _279 = _269;
    bool _281 = !_191;
    float _283 = 0.0;
    float _285 = 0.0;
    float _287 = _243;
    if (!_281)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _147 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _147);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _307;
        _283 = _315;
        _215 = _305;
        _285 = _301;
        _273 = _317;
    }
    float _319 = _271;
    float _321 = _283;
    float _323 = _215;
    float _325 = _285;
    float _327 = _273;
    bool _329 = !_191;
    float _331 = _319;
    float _333 = _325;
    float _335 = _321;
    float _337 = _323;
    if (!_329)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = 1.0 / _345;
        float _349 = _147 * _341;
        float _351 = exp2(_349);
        float _353 = -_351;
        float _355 = _353 + 1.0;
        float _357 = _355 * _347;
        _331 = _351;
        _333 = _347;
        _217 = _357;
    }
    float _359 = _331;
    float _361 = _333;
    float _363 = _217;
    float _365 = _359;
    float _367 = _361;
    if (!_155)
    {
        _365 = _151;
    }
    float _369 = _365;
    float _371 = _151 * 2.0;
    float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _375 = log2(_373);
    float _377 = _369;
    if (!_155)
    {
        _367 = _369;
    }
    float _379 = _367;
    float _381 = -_121;
    float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[76].x, _181);
    float _385 = _379;
    if (_155)
    {
        _377 = _151;
    }
    float _387 = _377;
    bool _389 = _151 > 0.5;
    bool _391 = _143 > 0.5;
    float _393 = floor(_371);
    float _395 = _387;
    if (!_155)
    {
        _335 = _243;
    }
    float _397 = _335;
    float _399 = _397;
    if (_155)
    {
        _337 = _149;
    }
    float _401 = _337;
    float _403 = _401;
    if (_155)
    {
        _399 = _387;
    }
    float _405 = _399;
    if (_155)
    {
        _287 = _387;
    }
    float _407 = _287;
    float _409 = _375 * _121;
    if (!_155)
    {
        _403 = _143;
    }
    float _411 = _403;
    float _413 = _405 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_155)
    {
        _385 = _149;
    }
    float _415 = _385;
    int _417 = _267 ? 0 : 1;
    float _419 = _411 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_155)
    {
        _395 = _149;
    }
    float _421 = _395;
    float _423 = exp2(_409);
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _435 = _433 != 0;
    float _437 = -_203;
    int _439 = _389 ? as_type<int>(_437) : as_type<int>(_203);
    float _441 = -_207;
    int _443 = _391 ? as_type<int>(_441) : as_type<int>(_207);
    bool _445 = !_431;
    float _447 = _445 ? _203 : as_type<float>(_439);
    bool _449 = !_435;
    float _451 = _449 ? _207 : as_type<float>(_443);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _463 = _461 != 0;
    int _465 = ~_417;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = -_423;
    float _473 = _471 + 1.0;
    int _475 = _469;
    if (!_251)
    {
        int _477 = ~_417;
        int _479 = _477 + 1;
        _475 = _479;
    }
    int _481 = _475;
    bool _483 = !_455;
    int _485 = _483 ? 0 : 1;
    int _487 = abs(_485);
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _491 = _393 > 0.0;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _495 = _393 >= 0.0;
    bool _497 = isnan(_393);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[83].z, _489);
    float _507 = _421 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _509 = _415 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _513 = float(_279);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _517 = float(_487);
    float _519 = -_511;
    float _521 = fma(_419, 2.0, _519);
    float _523 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[83].w, _515);
    float _525 = _517 * _513;
    float _527 = fma(_507, -2.0, _493);
    float _529 = in.m_54.x;
    float _531 = in.m_54.y;
    float _533 = in.m_54.z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _539 = _525 * (-2.0);
    float _541 = -_535;
    float _543 = fma(_509, 2.0, _541);
    float _545 = fma(_413, -2.0, _537);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _551 = 1.0 + _549;
    bool _553 = !_459;
    int _555 = _553 ? 0 : 1;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _559 = 1.0 / _551;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _565 = isnan(1.0);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _571 = _567 || _569;
    float _573 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _547);
    int _575 = abs(_555);
    float _577 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _557);
    float _579 = -_121;
    float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _543);
    int _583 = _503 ? 0 : 1;
    float _585 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[88].z, _561);
    float _587 = fma(_539, _529, _529);
    bool _589 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _601 = _149 + (-0.5);
    float _603 = float(_481);
    float _605 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _577);
    float _607 = float(_575);
    float _609 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _585);
    float _611 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[88].w, _599);
    float _613 = _597 ? _473 : 0.0;
    float _615 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].x, _587);
    float _617 = _607 * _603;
    bool _619 = !_463;
    int _621 = _619 ? 0 : 1;
    float _623 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _197);
    float _625 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _573);
    float _627 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _611);
    float _629 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _505);
    float _631 = -_121;
    float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[86].x, _521);
    float _635 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _523);
    float _637 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _545);
    float _639 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _527);
    if (_571)
    {
        float _641 = _613 * _559;
        _123 = _641;
    }
    float _643 = _123;
    float _645 = fma(_235, _539, _235);
    int _647 = abs(_621);
    float _649 = in.m_56.x;
    float _651 = in.m_56.y;
    float _653 = _151 + _143;
    int _655 = ~_583;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    float _661 = fma(_645, _643, _615);
    int _663 = _659;
    if (!_491)
    {
        int _665 = ~_583;
        int _667 = _665 + 1;
        _663 = _667;
    }
    int _669 = _663;
    float _671 = _149 + _143;
    float _673 = _653 + (-1.0);
    float _675 = float(_669);
    float _677 = _671 + (-1.0);
    float _679 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _681 = float(_647);
    float _683 = _617 * (-2.0);
    float _685 = _661 * 0.15915493667125701904296875;
    float _687 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _689 = _151 + (-0.5);
    float _691 = _681 * _675;
    float _693 = fma(_683, _531, _531);
    float _695 = fma(_679, _683, _679);
    float _697 = in.m_56.w;
    float _699 = _143 + (-0.5);
    float _701 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _703 = _691 * (-2.0);
    float _705 = in.m_47.x;
    float _707 = in.m_47.y;
    float _709 = in.m_47.z;
    float _711 = _649 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = fma(_695, _643, _701);
    float _715 = fma(_687, _703, _687);
    float _717 = in.m_42.x;
    float _719 = in.m_42.y;
    float _721 = in.m_42.z;
    float _723 = fma(_703, _533, _533);
    float _725 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _729 = _713 * 0.15915493667125701904296875;
    float _731 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _723);
    float _733 = _685 * 6.283185482025146484375;
    float _735 = sin(_733);
    float _737 = _725 * _727;
    float _739 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _741 = fma(_715, _643, _731);
    float _743 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _745 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _747 = _651 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = _685 * 6.283185482025146484375;
    float _753 = cos(_751);
    bool _755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _757 = isnan(0.5);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _763 = _759 || _761;
    float _765 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _767 = _145 > 0.5;
    float _769 = fma(_363, _705, _739);
    float _771 = fma(_363, _707, _743);
    float _773 = fma(_363, _709, _745);
    float _775 = _729 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = fma(_769, _697, _717);
    float _781 = fma(_771, _697, _719);
    float _783 = fma(_773, _697, _721);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _789 = _781 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _791 = _729 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _765 * _785;
    float _797 = _781 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[4].x, _787);
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[5].x, _789);
    float _803 = fma(_779, (*spvDescriptorSet0.vp_c10)._m0[6].x, _797);
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    float _807 = _749 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _735 * _777;
    float _813 = _753 * _777;
    float _815 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[5].z, _801);
    float _817 = fma(_783, (*spvDescriptorSet0.vp_c10)._m0[6].z, _803);
    float _819 = _749 * 6.283185482025146484375;
    float _821 = sin(_819);
    float _823 = _753 * _793;
    float _825 = _809 * _795;
    float _827 = _777 * _809;
    float _829 = _735 * _793;
    float _831 = _793 * _809;
    float _833 = _753 * _825;
    float _835 = _735 * _825;
    float _837 = _815 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _839 = fma(_821, _823, _811);
    float _841 = -_813;
    float _843 = fma(_821, _829, _841);
    float _845 = -_829;
    float _847 = fma(_821, _813, _845);
    float _849 = -_795;
    float _851 = _821 * _849;
    float _853 = fma(_839, _737, _833);
    float _855 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _857 = fma(_821, _811, _823);
    float _859 = fma(_831, _737, _851);
    float _861 = fma(_843, _737, _835);
    float _863 = fma(_847, _855, _853);
    float _865 = _805 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _867 = fma(_827, _855, _859);
    float _869 = fma(_857, _855, _861);
    float _871 = _863 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _873 = _863 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _875 = _837 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _877 = _817 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[10].x, _871);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[8].x, _873);
    float _883 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _875);
    float _885 = _837 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _887 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[10].z, _879);
    float _889 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[8].z, _881);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _883);
    float _893 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _885);
    float _895 = _877 + _887;
    float _897 = _865 + _889;
    float _899 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _893);
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _895 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _897 + _907;
    float _911 = 1.0 / _899;
    float _913 = _901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _915 = _905 * _905;
    float _917 = _863 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _919 = _913 + _899;
    float _921 = fma(_909, _909, _915);
    float _923 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[9].x, _917);
    float _925 = sqrt(_921);
    float _927 = fma(_869, (*spvDescriptorSet0.vp_c10)._m0[9].z, _923);
    float _929 = _919 * _911;
    float _931 = _929 * 0.5;
    float _933 = _837 + _927;
    float _935 = _911;
    float _937 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _939 = _899;
    float _941 = _895;
    float _943 = _897;
    float _945 = _729;
    if (_763)
    {
        _935 = 1.0;
    }
    float _947 = _935;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _951 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _949);
    float _953 = -_207;
    float _955 = _767 ? _953 : _207;
    bool _957 = !_427;
    float _959 = _957 ? _207 : _955;
    float _961 = 1.0 / _951;
    bool _963 = _925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = _955;
    float _967 = _947;
    if (!_963)
    {
        _965 = _897;
    }
    float _969 = _965;
    float _971 = _969;
    if (!_963)
    {
        _937 = _895;
    }
    float _973 = _937;
    float _975 = _973;
    if (!_963)
    {
        _939 = _933;
    }
    float _977 = _939;
    bool _979 = !_963;
    float _981 = _977;
    float _983 = _961;
    if (!_979)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _989 = _925 + _987;
        float _991 = rsqrt(_921);
        float _993 = _989 * _985;
        float _995 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = _997 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        float _1007 = _1001 + (-1.0);
        float _1009 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1013 = fma(_933, _1001, _1009);
        float _1015 = _991 * _1011;
        float _1017 = fma(_909, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = fma(_905, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _981 = _1013;
        _971 = _1017;
        _975 = _1019;
    }
    float _1021 = _981;
    float _1023 = _971;
    float _1025 = _975;
    if (_763)
    {
        _941 = 1.0;
    }
    float _1027 = _941;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1031 = _961 * _1029;
    float _1033 = _1027;
    if (!_763)
    {
        float _1035 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1037 = _1035 * 0.15915493667125701904296875;
        float _1039 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1041 = _1037 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 0.15915493667125701904296875;
        float _1047 = _1037 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = 1.0 / _1043;
        float _1053 = _1045 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        float _1057 = _1049 * _1051;
        float _1059 = _1045 * 6.283185482025146484375;
        float _1061 = sin(_1059);
        float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1065 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1063;
        float _1067 = _1055 * _1057;
        float _1069 = 1.0 / _1065;
        float _1071 = 1.0 / _1067;
        float _1073 = _1061 * _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1077 = fma(_1031, _1073, _1075);
        float _1079 = _1077 * _1069;
        float _1081 = precise::clamp(_1079, 0.0, 1.0);
        _983 = _1045;
        _967 = _1081;
    }
    float _1083 = _983;
    float _1085 = _967;
    float _1087 = _1083;
    if (!_763)
    {
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1095 = _1091 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1093 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = fma(_1031, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        float _1137 = -_1135;
        float _1139 = _1137 + 1.0;
        _1087 = _1103;
        _1033 = _1139;
    }
    float _1141 = _1087;
    float _1143 = _1033;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1147 = _1021 + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1151 = _1023 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1155 = _1025 + _1153;
    float _1157 = _1147 * _1147;
    float _1159 = fma(_1151, _1151, _1157);
    float _1161 = fma(_1155, _1155, _1159);
    float _1163 = rsqrt(_1161);
    float _1165 = sqrt(_1161);
    float _1167 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1169 = _1151 * _1167;
    float _1171 = _1155 * _1167;
    float _1173 = _1169 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 + _1175;
    float _1179 = sqrt(_1177);
    bool _1181 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = _1179 + _1183;
    float _1187 = _1163;
    float _1189 = _1177;
    float _1191 = _1185;
    float _1193 = _1147;
    float _1195 = _1167;
    if (_1181)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1197;
    }
    float _1199 = _1187;
    if (_1181)
    {
        float _1201 = rsqrt(_1177);
        _1189 = _1201;
    }
    float _1203 = _1189;
    float _1205 = _1203;
    if (_1181)
    {
        float _1207 = _1185 * _1199;
        _1191 = _1207;
    }
    float _1209 = _1191;
    if (_1181)
    {
        float _1211 = _1209 * 0.15915493667125701904296875;
        _943 = _1211;
    }
    float _1213 = _943;
    float _1215 = _1155;
    if (_1181)
    {
        float _1217 = _1213 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1225 = precise::max(0.0, _1223);
    float _1227 = _1141;
    float _1229 = _1225;
    float _1231 = _1223;
    if (_1181)
    {
        float _1233 = _1213 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        _1227 = _1235;
    }
    float _1237 = _1227;
    float _1239 = -_1167;
    float _1241 = -_1225;
    float _1243 = fma(_1147, _1239, _1241);
    if (!_1181)
    {
        _1193 = _1171;
    }
    float _1245 = _1193;
    float _1247 = _1245;
    if (_1181)
    {
        float _1249 = _1243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1249;
    }
    float _1251 = _1229;
    float _1253 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1255 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1257 = _1221;
    float _1259 = _1251;
    if (_1181)
    {
        float _1261 = fma(_1221, _1251, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1257 = _1261;
    }
    float _1263 = _1257;
    float _1265 = _1263;
    if (!_1181)
    {
        _1259 = _1169;
    }
    float _1267 = _1259;
    float _1269 = _1267;
    if (_1181)
    {
        float _1271 = _1237 + (-1.0);
        _1231 = _1271;
    }
    float _1273 = _1231;
    float _1275 = _1273;
    if (_1181)
    {
        float _1277 = _1203 * _1263;
        _945 = _1277;
    }
    float _1279 = _945;
    if (!_1181)
    {
        _1265 = _1243;
    }
    float _1281 = _1265;
    float _1283 = _1281;
    if (_1181)
    {
        float _1285 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1285;
    }
    float _1287 = _1195;
    if (_1181)
    {
        float _1289 = _1169 * _1279;
        _1269 = _1289;
    }
    float _1291 = _1269;
    if (!_1181)
    {
        _1205 = _1173;
    }
    float _1293 = _1205;
    float _1295 = _1293;
    if (_1181)
    {
        float _1297 = _1171 * _1279;
        _1247 = _1297;
    }
    float _1299 = _1247;
    if (_1181)
    {
        float _1301 = fma(_1243, _1237, _1287);
        _1283 = _1301;
    }
    float _1303 = _1283;
    if (_1181)
    {
        float _1305 = _1291 * _1291;
        _1295 = _1305;
    }
    float _1307 = _1295;
    if (!_1181)
    {
        _1275 = _1175;
    }
    float _1309 = _1275;
    float _1311 = _1309;
    if (_1181)
    {
        float _1313 = _1299 * _1299;
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = fma(_1303, _1303, _1307);
    float _1319 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1321 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1255);
    float _1323 = _1317 + _1315;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1327 = fma(_1165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1325);
    float _1329 = precise::clamp(_1327, 0.0, 1.0);
    float _1331 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1319);
    float _1333 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1337 = -_1329;
    float _1339 = _1337 + 1.0;
    float _1341 = rsqrt(_1323);
    float _1343 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1345 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1331);
    float _1347 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1335);
    float _1349 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1321);
    float _1351 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1343);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1347);
    float _1357 = abs(_1339);
    float _1359 = log2(_1357);
    float _1361 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1363 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1367 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1373 = -_1365;
    float _1375 = fma(_1373, _1253, 1.0);
    float _1377 = _1341 * _1291;
    float _1379 = _1341 * _1303;
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1369);
    float _1383 = _1341 * _1299;
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1387 = log2(_1375);
    float _1389 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1381);
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1393 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1395 = -_1385;
    float _1397 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1395);
    float _1399 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1391);
    float _1401 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1371);
    float _1403 = exp2(_1393);
    float _1405 = -_1383;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1397);
    float _1409 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1411 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1399);
    float _1413 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1401);
    float _1415 = fma(_1407, -0.5, 0.5);
    float _1417 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1411);
    float _1419 = 1.0 / _1409;
    float _1421 = fma(_1407, 0.5, 0.5);
    float _1423 = _1379 + 1.0;
    float _1425 = _1387 * 0.693147182464599609375;
    float _1427 = fma(_1421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1431 = sqrt(_1415);
    float _1433 = -_1379;
    float _1435 = fma(_1403, _1423, _1433);
    float _1437 = fma(_1421, _1427, -0.212114393711090087890625);
    float _1439 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1413);
    float _1441 = fma(_1421, _1437, 1.570728778839111328125);
    float _1443 = _1417 * _1419;
    float _1445 = _1439 * _1419;
    float _1447 = fma(_1443, 0.5, 0.5);
    float _1449 = fma(_1445, -0.5, 0.5);
    float _1451 = fma(_1435, 0.5, 0.5);
    float _1453 = _1431 * 0.636619746685028076171875;
    float3 _3891 = float3(_1447, _1449, _1429);
    float _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3891, float3(0.0), isnan(_3891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3891, float3(0.0), isnan(_3891)), level(0.0)).x;
    float _1457 = -_1441;
    float _1459 = fma(_1453, _1457, 1.0);
    float3 _3907 = float3(_1447, _1449, _1429);
    float4 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3907, float3(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3907, float3(0.0), isnan(_3907)), level(0.0)).xyzw;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = _1462.w;
    float2 _3924 = float2(_1459, _1451);
    float3 _1474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3924, float2(0.0), isnan(_3924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3924, float2(0.0), isnan(_3924)), level(0.0)).xyz;
    float _1476 = _1474.x;
    float _1478 = _1474.y;
    float _1480 = _1474.z;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1484 = _149 > 0.5;
    float _1486 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1490 = _1488 != 0;
    float _1492 = _959 + (-0.5);
    float _1494 = -_207;
    int _1496 = _389 ? as_type<int>(_1494) : as_type<int>(_207);
    float _1498 = -_609;
    float _1500 = _1498 + 1.0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1504 = _1502 != 0;
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1508 = -_203;
    int _1510 = _1484 ? as_type<int>(_1508) : as_type<int>(_203);
    float _1512 = -_627;
    float _1514 = _1512 + 1.0;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1518 = _1516 != 0;
    float _1520 = -_629;
    float _1522 = _1520 + 1.0;
    bool _1524 = !_1490;
    float _1526 = _1524 ? _207 : as_type<float>(_1496);
    float _1528 = -_625;
    float _1530 = _1528 + 1.0;
    bool _1532 = !_1504;
    float _1534 = _1532 ? _203 : as_type<float>(_1510);
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1538 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1540 = _1526 + (-0.5);
    float _1542 = _1534 + 0.5;
    float _1544 = -_1538;
    float _1546 = -_623;
    float _1548 = fma(_1544, _1540, _1546);
    float _1550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1552 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1556 = fma(_1552, _1542, _383);
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1560 = exp2(_1486);
    float _1562 = -_203;
    int _1564 = _391 ? as_type<int>(_1562) : as_type<int>(_203);
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1574 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1578 = !_1518;
    float _1580 = _1578 ? _203 : as_type<float>(_1564);
    float _1582 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1586 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1590 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1596 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1600 = _1580 + 0.5;
    out.m_58.x = _1590;
    out.m_58.y = _1592;
    out.m_58.z = _1582;
    out.m_58.w = _1588;
    float _1602 = -_1560;
    float _1604 = _1602 + 1.0;
    float _1606 = -_1598;
    float _1608 = -_637;
    float _1610 = fma(_1606, _1492, _1608);
    float _1612 = fma(_1574, _1600, _581);
    float _1614 = -_635;
    float _1616 = _1614 + 1.0;
    float _1618 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1620 = _1085 > 0.0;
    bool _1622 = isnan(_1085);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan(0.0);
    bool _1628 = _1624 || _1626;
    float _1630 = fma(_959, _1616, _1610);
    float _1632 = -_605;
    float _1634 = _1632 + 1.0;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1638 = _1143 <= 0.0;
    bool _1640 = !_1628;
    bool _1642 = _1638 || _1640;
    float _1644 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1646 = -_1522;
    float _1648 = fma(_1580, _1646, _1612);
    float _1650 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1652 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1654 = _447 + 0.5;
    float _1656 = _451 + (-0.5);
    float _1658 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1650);
    out.m_60.x = _1584;
    out.m_60.y = _1586;
    out.m_60.z = _1596;
    out.m_60.w = _1636;
    float _1660 = fma(_1652, _1654, _633);
    float _1662 = -_1644;
    float _1664 = -_639;
    float _1666 = fma(_1662, _1656, _1664);
    float _1668 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1658);
    float _1670 = _1085 * _1143;
    float _1672 = -_1500;
    float _1674 = fma(_447, _1672, _1660);
    float _1676 = fma(_451, _1514, _1666);
    float _1678 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1668);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1682 = fma(_1526, _1530, _1548);
    float _1684 = -_1634;
    float _1686 = fma(_1534, _1684, _1556);
    float _1688 = _1678 + _1409;
    out.m_62.x = _1674;
    out.m_62.y = _1676;
    float _1690 = -_1618;
    float _1692 = _1690 + 1.0;
    float _1694 = _1680 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1696 = _1688 * 0.5;
    out.m_64.x = _1686;
    out.m_64.y = _1682;
    out.m_64.z = _1648;
    out.m_64.w = _1630;
    out.m_45.x = _1694;
    out.gl_Position.x = _1417;
    out.gl_Position.y = _1439;
    out.gl_Position.z = _1678;
    out.gl_Position.w = _1409;
    out.m_66.z = _1696;
    out.m_66.w = _1409;
    float _1698 = _1618 * _1455;
    float _1700 = _1470 * _1698;
    float _1702 = _1480 * _1698;
    float _1704 = fma(_1476, _1700, _1464);
    float _1706 = fma(_1478, _1700, _1466);
    float _1708 = _1470 * _1692;
    float _1710 = fma(_1470, _1702, _1468);
    out.m_68.x = _1704;
    out.m_68.y = _1706;
    out.m_68.z = _1710;
    out.m_68.w = _1708;
    if (!_1642)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1712;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

