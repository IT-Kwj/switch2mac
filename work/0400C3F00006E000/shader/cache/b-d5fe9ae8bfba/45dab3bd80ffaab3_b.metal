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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_72 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_62 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3917 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4224 = as_type<float>(_123);
        out.gl_Position.z = _4224;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_105);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4294 = as_type<float>(_161);
        out.gl_Position.z = _4294;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_105);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = in.m_54.x;
    float _215 = in.m_54.y;
    float _217 = in.m_54.z;
    float _219 = in.m_54.w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _211 + _225;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = 1.0 / _235;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _251 = 0.0;
    if (_231)
    {
        float _253 = in.m_54.x;
        _251 = _253;
    }
    float _255 = _251;
    float _257 = 0.0;
    if (_231)
    {
        _257 = 1.0;
    }
    float _259 = _257;
    float _261 = 1.0 / _245;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = _211 + _263;
    float _267 = 0.0;
    int _269 = as_type<int>(_265);
    float _271 = _259;
    if (_231)
    {
        _267 = 1.0;
    }
    float _273 = _267;
    float _275 = _213 * 2.0;
    float _277 = _215 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _279 = _213 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _281 = _215 > 0.5;
    float _283 = 1.0 / _239;
    bool _285 = _217 > 0.5;
    float _287 = fma(_277, -2.0, _247);
    float _289 = _265 * _241;
    float _291 = -_249;
    float _293 = fma(_279, 2.0, _291);
    int _295 = as_type<int>(_241);
    float _297 = _273;
    if (_231)
    {
        _269 = 0;
    }
    int _299 = _269;
    float _301 = floor(_275);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _307 = int(_231);
    int _309 = _285 ? 2 : 0;
    int _311 = _307 | _309;
    int _313 = _281 ? 4 : 0;
    int _315 = _311 | _313;
    int _317 = false ? 8 : 0;
    int _319 = _315 | _317;
    int _321 = false ? 16 : 0;
    int _323 = _319 | _321;
    int _325 = false ? 32 : 0;
    int _327 = _323 | _325;
    int _329 = false ? 64 : 0;
    int _331 = _327 | _329;
    int _333 = _331 & 4;
    int _335 = _299;
    if (_231)
    {
        _295 = 0;
    }
    int _337 = _295;
    int _339 = int(_231);
    int _341 = _285 ? 2 : 0;
    int _343 = _339 | _341;
    int _345 = _281 ? 4 : 0;
    int _347 = _343 | _345;
    int _349 = false ? 8 : 0;
    int _351 = _347 | _349;
    int _353 = false ? 16 : 0;
    int _355 = _351 | _353;
    int _357 = false ? 32 : 0;
    int _359 = _355 | _357;
    int _361 = false ? 64 : 0;
    int _363 = _359 | _361;
    int _365 = _363 & 2;
    float _367 = 0.0;
    int _369 = _337;
    if (_231)
    {
        _367 = 1.0;
    }
    float _371 = _367;
    float _373 = 0.0;
    float _375 = _371;
    float _377 = _255;
    if (_231)
    {
        _373 = _255;
    }
    float _379 = _373;
    float _381 = _379;
    if (!_231)
    {
        float _383 = in.m_54.y;
        float _385 = in.m_54.z;
        _335 = 1;
        _369 = 2;
        _375 = 5.839270114898681640625;
        _381 = _385;
        _377 = _383;
        _297 = 1.2345600128173828125;
        _271 = 7.345489978790283203125;
    }
    int _387 = _335;
    int _389 = _369;
    float _391 = _375;
    float _393 = _381;
    float _395 = _377;
    float _397 = _297;
    float _399 = _271;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _411 = _409 != 0;
    float _413 = 1.0 / _305;
    float _415 = -_181;
    int _417 = _285 ? as_type<int>(_415) : as_type<int>(_181);
    float _419 = _223 * _283;
    float _421 = -_177;
    int _423 = _281 ? as_type<int>(_421) : as_type<int>(_177);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _427 = _211 + _425;
    bool _429 = !_411;
    float _431 = _429 ? _181 : as_type<float>(_417);
    float _433 = _215 * 2.0;
    float _435 = _227 * _261;
    bool _437 = !_407;
    float _439 = _437 ? _177 : as_type<float>(_423);
    float _441 = _213 + _217;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _453 = _451 != 0;
    float _455 = floor(_433);
    bool _457 = _301 > 0.0;
    float _459 = _441 + (-1.0);
    bool _461 = _301 >= 0.0;
    bool _463 = isnan(_301);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _427 * _413;
    bool _473 = _387 != 1;
    float _475 = _213 + _215;
    int _477 = _469 ? 0 : 1;
    float _479 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _481 = int(_479);
    float _483 = _475 + (-1.0);
    int _485 = ~_477;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    bool _491 = !_449;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _497 = _489;
    float _499 = _459;
    if (!_457)
    {
        int _501 = ~_477;
        int _503 = _501 + 1;
        _497 = _503;
    }
    int _505 = _497;
    float _507 = _215 + _217;
    bool _509 = _455 > 0.0;
    bool _511 = _455 >= 0.0;
    bool _513 = isnan(_455);
    bool _515 = _511 || _513;
    bool _517 = isnan(0.0);
    bool _519 = _515 || _517;
    float _521 = _217 * 2.0;
    float _523 = _507 + (-1.0);
    int _525 = _519 ? 0 : 1;
    float _527 = floor(_521);
    bool _529 = !_445;
    int _531 = _529 ? 0 : 1;
    float _533 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _535 = !_453;
    int _537 = _535 ? 0 : 1;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _549 = _547 != 0;
    float _551 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _553 = 0.0;
    float _555 = _507;
    if (!_473)
    {
        _553 = _215;
    }
    float _557 = _553;
    int _559 = ~_525;
    int _561 = _559 + 1;
    int _563 = _561 + 1;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    int _569 = _563;
    float _571 = _557;
    if (!_509)
    {
        int _573 = ~_525;
        int _575 = _573 + 1;
        _569 = _575;
    }
    int _577 = _569;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    bool _583 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _585 = isnan(_211);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_567, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    if (!_473)
    {
        _555 = _217;
    }
    float _597 = _555;
    float _599 = fma(_581, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _601 = _597;
    float _603 = _599;
    if (!_473)
    {
        _499 = _557;
    }
    float _605 = _499;
    float _607 = -_593;
    float _609 = _607 + 1.0;
    float _611 = 0.0;
    float _613 = _605;
    if (!_473)
    {
        _611 = _217;
    }
    float _615 = _611;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _621 = !_545;
    int _623 = _621 ? 0 : 1;
    bool _625 = !_541;
    int _627 = _625 ? 0 : 1;
    bool _629 = !_549;
    int _631 = _629 ? 0 : 1;
    float _633 = _615;
    if (_473)
    {
        _613 = _213;
    }
    float _635 = _613;
    if (_473)
    {
        _571 = _213;
    }
    float _637 = _571;
    if (_473)
    {
        _601 = _215;
    }
    float _639 = _601;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_473)
    {
        _633 = _215;
    }
    float _643 = _633;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _655 = _653 != 0;
    bool _657 = _527 > 0.0;
    bool _659 = _527 >= 0.0;
    bool _661 = isnan(_527);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    bool _669 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_211);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    int _681 = _667 ? 0 : 1;
    float _683 = _679 * _609;
    bool _685 = _389 != 2;
    float _687 = -_679;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _691;
    bool _695 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _697 = isnan(_211);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _711 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _713 = isnan(_211);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _723;
    bool _727 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _729 = isnan(_211);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -_705;
    float _741 = _739 + 1.0;
    float _743 = _705 * _689;
    float _745 = -_721;
    float _747 = _745 + 1.0;
    float _749 = fma(_693, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _751 = fma(_725, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _753 = _721 * _741;
    int _755 = ~_681;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _737 * _747;
    int _763 = _759;
    if (!_657)
    {
        int _765 = ~_681;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _777 = log2(_775);
    float _779 = _599 * _761;
    if (_685)
    {
        _603 = _213;
    }
    float _781 = _603;
    float _783 = fma(_773, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _785 = fma(_619, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _787 = _595 * _761;
    float _789 = _781;
    if (!_685)
    {
        _789 = _217;
    }
    float _791 = _789;
    float _793 = -_737;
    float _795 = _793 + 1.0;
    float _797 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _799 = int(_797);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _805 = _791 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _807 = !_647;
    int _809 = _807 ? 0 : 1;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _815 = int(_813);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _819 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[83].z, _811);
    float _821 = float(_105);
    float _823 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].w, _817);
    if (_685)
    {
        _113 = _215;
    }
    float _825 = _113;
    float _827 = _777 * _141;
    int _829 = abs(_809);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _835 = _825;
    if (!_685)
    {
        _835 = _213;
    }
    float _837 = _835;
    float _839 = _639 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _841 = -_831;
    float _843 = fma(_805, 2.0, _841);
    float _845 = fma(_839, -2.0, _833);
    float _847 = float(_829);
    float _849 = _837 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _851 = float(_799);
    float _853 = exp2(_827);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _857 = float(_481);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _861 = float(_769);
    float _863 = -_855;
    float _865 = fma(_641, 2.0, _863);
    float _867 = float(_815);
    float _869 = 1.0 / _851;
    float _871 = fma(_849, -2.0, _859);
    float _873 = -_141;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[86].x, _843);
    float _877 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _819);
    float _879 = 1.0 / _821;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _887 = 1.0 + _885;
    float _889 = -_853;
    float _891 = _889 + 1.0;
    bool _893 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _895 = isnan(1.0);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _901 = _897 || _899;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _905 = 1.0 / _857;
    bool _907 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _915 = _911 || _913;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _921 = !_651;
    int _923 = _921 ? 0 : 1;
    float _925 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _927 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[79].z, _903);
    float _929 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _931 = 1.0 / _867;
    float _933 = _847 * _861;
    float _935 = _879 * _141;
    float _937 = in.m_56.x;
    float _939 = in.m_56.y;
    float _941 = in.m_56.z;
    float _943 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[88].z, _919);
    float _945 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[88].w, _883);
    float _947 = _915 ? _891 : 0.0;
    float _949 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _287);
    float _951 = 1.0 / _887;
    int _953 = abs(_923);
    float _955 = -_141;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    float _959 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _925);
    float _961 = -_141;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[81].x, _865);
    float _965 = _905 * _141;
    float _967 = _869 * _141;
    float _969 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[79].x, _927);
    float _971 = _931 * _141;
    float _973 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _929);
    float _975 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _943);
    float _977 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _945);
    float _979 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    float _981 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _845);
    float _983 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _871);
    float _985 = _933 * (-2.0);
    if (_901)
    {
        float _987 = _947 * _951;
        _143 = _987;
    }
    float _989 = _143;
    float _991 = _215 + (-0.5);
    float _993 = float(_505);
    float _995 = fma(_985, _937, _937);
    bool _997 = !_655;
    int _999 = _997 ? 0 : 1;
    float _1001 = fma(_495, _985, _495);
    float _1003 = float(_953);
    float _1005 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    int _1007 = abs(_999);
    float _1009 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].y, _779);
    float _1011 = _213 + (-0.5);
    float _1013 = _1003 * _993;
    float _1015 = _217 + (-0.5);
    float _1017 = float(_577);
    float _1019 = _1013 * (-2.0);
    float _1021 = float(_1007);
    float _1023 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].x, _995);
    float _1025 = fma(_783, _753, _1005);
    float _1027 = fma(_1019, _939, _939);
    float _1029 = fma(_551, _1019, _551);
    float _1031 = _1021 * _1017;
    float _1033 = fma(_785, _753, _1009);
    float _1035 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1027);
    float _1037 = in.m_58.x;
    float _1039 = in.m_58.y;
    float _1041 = _1031 * (-2.0);
    float _1043 = fma(_1001, _989, _1023);
    float _1045 = fma(_1029, _989, _1035);
    float _1047 = fma(_709, _471, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1049 = fma(_1041, _941, _941);
    float _1051 = fma(_533, _1041, _533);
    float _1053 = in.m_44.x;
    float _1055 = in.m_44.y;
    float _1057 = in.m_44.z;
    float _1059 = fma(_749, _743, _1025);
    float _1061 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1049);
    float _1063 = fma(_803, _471, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1065 = fma(_751, _743, _1033);
    float _1067 = _1043 * 0.15915493667125701904296875;
    float _1069 = fma(_1051, _989, _1061);
    float _1071 = _1045 * 0.15915493667125701904296875;
    float _1073 = fma(_1047, _683, _1059);
    float _1075 = fma(_1063, _683, _1065);
    float _1077 = _1069 * 0.15915493667125701904296875;
    float _1079 = _1067 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1073);
    float _1085 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1075);
    bool _1087 = _219 > 0.5;
    float _1089 = _1083 * _1037;
    float _1091 = _1085 * _1039;
    float _1093 = _1067 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1101 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1103 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1105 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1113 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1101);
    float _1115 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1103);
    float _1117 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1119 = _1111 * _1097;
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1123 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1115);
    float _1125 = _1071 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1113);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1135 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1077 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    float _1141 = _1095 * _1109;
    float _1143 = _1081 * _1109;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1147 = _1077 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = _1081 * _1127;
    float _1153 = _1095 * _1127;
    float _1155 = _1127 * _1139;
    float _1157 = _1095 * _1139;
    float _1159 = _1099 * _1121;
    float _1161 = _1081 * _1139;
    float _1163 = _1109 * _1139;
    float _1165 = _1157 * _1159;
    float _1167 = fma(_1149, _1153, _1143);
    float _1169 = -_1141;
    float _1171 = fma(_1149, _1151, _1169);
    float _1173 = -_1151;
    float _1175 = fma(_1149, _1141, _1173);
    float _1177 = fma(_1149, _1143, _1153);
    float _1179 = -_1159;
    float _1181 = _1149 * _1179;
    float _1183 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1185 = fma(_1167, _1119, _1165);
    float _1187 = _1161 * _1159;
    float _1189 = fma(_1155, _1119, _1181);
    float _1191 = fma(_1175, _1183, _1185);
    float _1193 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1117);
    float _1195 = fma(_1171, _1119, _1187);
    float _1197 = fma(_1163, _1183, _1189);
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1203 = fma(_1177, _1183, _1195);
    float _1205 = _1193 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1207 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1199);
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1201);
    float _1211 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1213 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1145);
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1209);
    float _1219 = _1213 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1221 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1227 = 1.0 / _1219;
    float _1229 = _1205 + _1221;
    float _1231 = _1133 + _1223;
    float _1233 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1225);
    float _1235 = -_181;
    float _1237 = _1087 ? _1235 : _181;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1241 = _1229 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1245 = _1231 + _1243;
    float _1247 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1233);
    float _1249 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1211);
    float _1251 = _1241 * _1241;
    bool _1253 = !_403;
    float _1255 = _1253 ? _181 : _1237;
    float _1257 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1261 = _1259 != 0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1265 = _1263 != 0;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1273 = _1271 != 0;
    float _1275 = fma(_1245, _1245, _1251);
    float _1277 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1279 = _1257 + _1219;
    float _1281 = sqrt(_1275);
    float _1283 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1285 = _1279 * _1227;
    float _1287 = _1285 * 0.5;
    bool _1289 = !_1265;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = _1131 + _1283;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1295);
    bool _1299 = !_1261;
    int _1301 = _1299 ? 0 : 1;
    bool _1303 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1305 = isnan(0.5);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1311 = _1307 || _1309;
    bool _1313 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1315 = isnan(0.5);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1321 = _1317 || _1319;
    float _1323 = 1.0 / _1297;
    bool _1325 = !_1269;
    int _1327 = _1325 ? 0 : 1;
    bool _1329 = !_1273;
    int _1331 = _1329 ? 0 : 1;
    bool _1333 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1337 = _1237;
    float _1339 = _1283;
    float _1341 = _1287;
    float _1343 = _1281;
    float _1345 = _1227;
    float _1347 = _1245;
    float _1349 = _1241;
    float _1351 = _1089;
    float _1353 = _1071;
    if (!_1333)
    {
        _1335 = _1231;
    }
    float _1355 = _1335;
    float _1357 = _1355;
    if (!_1333)
    {
        _1337 = _1229;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (!_1333)
    {
        _1339 = _1293;
    }
    float _1363 = _1339;
    bool _1365 = !_1333;
    float _1367 = _1363;
    if (!_1365)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1373 = _1281 + _1371;
        float _1375 = rsqrt(_1275);
        float _1377 = _1373 * _1369;
        float _1379 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = _1377 * 0.15915493667125701904296875;
        float _1383 = _1381 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = _1381 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1385 + (-1.0);
        float _1393 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1395 = fma(_1389, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1397 = fma(_1293, _1385, _1393);
        float _1399 = _1375 * _1395;
        float _1401 = fma(_1245, _1399, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1403 = fma(_1241, _1399, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1357 = _1401;
        _1367 = _1397;
        _1341 = _1393;
        _1361 = _1403;
        _1343 = _1399;
    }
    float _1405 = _1357;
    float _1407 = _1367;
    float _1409 = _1341;
    float _1411 = _1361;
    float _1413 = _1343;
    float _1415 = _1413;
    float _1417 = _1411;
    float _1419 = _1409;
    if (_1321)
    {
        _1345 = 1.0;
    }
    float _1421 = _1345;
    float _1423 = _1421;
    if (_1311)
    {
        _1347 = _1405;
    }
    float _1425 = _1347;
    float _1427 = _1425;
    if (_1311)
    {
        _1349 = _1407;
    }
    float _1429 = _1349;
    float _1431 = _1429;
    if (!_1311)
    {
        float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1435 = _1131 + _1433;
        float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1439 = _1133 + _1437;
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1443 = -_1131;
        float _1445 = _1443 + _1407;
        float _1447 = _1435 * _1435;
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1451 = _1205 + _1449;
        float _1453 = fma(_1439, _1439, _1447);
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1457 = fma(_1451, _1451, _1453);
        float _1459 = sqrt(_1457);
        float _1461 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1463 = precise::min(_1459, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1465 = _1463 * _1455;
        float _1467 = -_1133;
        float _1469 = _1467 + _1405;
        float _1471 = _1461 * _1465;
        float _1473 = -_1205;
        float _1475 = _1473 + _1411;
        float _1477 = fma(_1469, _1471, _1133);
        float _1479 = fma(_1475, _1471, _1205);
        float _1481 = fma(_1445, _1471, _1131);
        _1415 = _1475;
        _1431 = _1481;
        _1427 = _1477;
        _1417 = _1479;
        _1419 = _1441;
    }
    float _1483 = _1415;
    float _1485 = _1431;
    float _1487 = _1427;
    float _1489 = _1417;
    float _1491 = _1419;
    float _1493 = _1491;
    float _1495 = _1483;
    if (_1321)
    {
        _1351 = 1.0;
    }
    float _1497 = _1351;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1501 = _1323 * _1499;
    float _1503 = _1497;
    if (!_1321)
    {
        float _1505 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = _1509 * 0.15915493667125701904296875;
        float _1517 = _1507 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = 1.0 / _1513;
        float _1523 = _1515 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = _1515 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = _1525 * _1527;
        float _1535 = 1.0 / _1533;
        float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1539 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1537;
        float _1541 = 1.0 / _1539;
        float _1543 = _1531 * _1535;
        float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1547 = fma(_1501, _1543, _1545);
        float _1549 = _1547 * _1541;
        float _1551 = precise::clamp(_1549, 0.0, 1.0);
        _1493 = _1541;
        _1495 = _1521;
        _1423 = _1551;
    }
    float _1553 = _1493;
    float _1555 = _1495;
    float _1557 = _1423;
    float _1559 = _1553;
    float _1561 = _1555;
    if (!_1321)
    {
        float _1563 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1565 = _1563 * 0.15915493667125701904296875;
        float _1567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1569 = _1565 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1567 * 0.15915493667125701904296875;
        float _1575 = _1565 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        float _1579 = 1.0 / _1571;
        float _1581 = _1573 * 6.283185482025146484375;
        float _1583 = cos(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = _1573 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = _1583 * _1585;
        float _1593 = 1.0 / _1591;
        float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1597 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1595;
        float _1599 = 1.0 / _1597;
        float _1601 = _1589 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1605 = fma(_1501, _1601, _1603);
        float _1607 = _1605 * _1599;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        float _1611 = -_1609;
        float _1613 = _1611 + 1.0;
        _1559 = _1577;
        _1561 = _1589;
        _1503 = _1613;
    }
    float _1615 = _1559;
    float _1617 = _1561;
    float _1619 = _1503;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1485 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1487 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1489 + _1629;
    float _1633 = _1623 * _1623;
    bool _1635 = _333 != 0;
    bool _1637 = _365 != 0;
    float _1639 = fma(_1627, _1627, _1633);
    float _1641 = fma(_1631, _1631, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1627 * _1647;
    float _1651 = _1631 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1643;
    float _1669 = _1665;
    float _1671 = _1615;
    float _1673 = _1623;
    float _1675 = _1647;
    if (_1661)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1677;
    }
    float _1679 = _1667;
    float _1681 = _1679;
    if (_1661)
    {
        float _1683 = _1665 * _1679;
        _1669 = _1683;
    }
    float _1685 = _1669;
    if (_1661)
    {
        float _1687 = rsqrt(_1657);
        _1681 = _1687;
    }
    float _1689 = _1681;
    float _1691 = _1689;
    if (_1661)
    {
        float _1693 = _1685 * 0.15915493667125701904296875;
        _1671 = _1693;
    }
    float _1695 = _1671;
    float _1697 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1699 = _1631;
    if (_1661)
    {
        float _1701 = _1695 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = precise::max(0.0, _1697);
    float _1709 = _1617;
    float _1711 = _1707;
    if (_1661)
    {
        float _1713 = _1695 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -_1647;
    float _1721 = -_1707;
    float _1723 = fma(_1623, _1719, _1721);
    if (_1661)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1673 = _1725;
    }
    float _1727 = _1673;
    float _1729 = _1705;
    float _1731 = _1727;
    if (_1661)
    {
        float _1733 = fma(_1705, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1711 = _1733;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    if (!_1661)
    {
        _1729 = _1649;
    }
    float _1739 = _1729;
    float _1741 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1743 = _1739;
    if (_1661)
    {
        float _1745 = _1689 * _1735;
        _1353 = _1745;
    }
    float _1747 = _1353;
    if (!_1661)
    {
        _1737 = _1723;
    }
    float _1749 = _1737;
    float _1751 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1741);
    float _1753 = _1749;
    float _1755 = _1717;
    if (_1661)
    {
        float _1757 = _1717 + (-1.0);
        _1731 = _1757;
    }
    float _1759 = _1731;
    float _1761 = _1759;
    if (_1661)
    {
        float _1763 = _1649 * _1747;
        _1743 = _1763;
    }
    float _1765 = _1743;
    if (!_1661)
    {
        _1691 = _1651;
    }
    float _1767 = _1691;
    float _1769 = _1767;
    if (_1661)
    {
        float _1771 = _1651 * _1747;
        _1769 = _1771;
    }
    float _1773 = _1769;
    if (_1661)
    {
        float _1775 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1775;
    }
    float _1777 = _1675;
    if (!_1661)
    {
        _1761 = _1653;
    }
    float _1779 = _1761;
    float _1781 = _1779;
    if (_1661)
    {
        float _1783 = _1765 * _1765;
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1661)
    {
        float _1789 = fma(_1723, _1717, _1777);
        _1753 = _1789;
    }
    float _1791 = _1753;
    if (!_1661)
    {
        _1755 = _1655;
    }
    float _1793 = _1755;
    float _1795 = _1793;
    if (_1661)
    {
        float _1797 = _1773 * _1773;
        _1795 = _1797;
    }
    float _1799 = _1795;
    float _1801 = fma(_1791, _1791, _1785);
    float _1803 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1805 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1807 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = _1801 + _1799;
    float _1811 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1813 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1751);
    float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1817 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1815);
    float _1819 = precise::clamp(_1817, 0.0, 1.0);
    float _1821 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1823 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1811);
    float _1825 = rsqrt(_1809);
    float _1827 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1819;
    float _1831 = _1829 + 1.0;
    float _1833 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1823);
    float _1835 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1839 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1841 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = abs(_1831);
    float _1845 = log2(_1843);
    float _1847 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1849 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1851 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1837);
    float _1853 = -_1847;
    float _1855 = fma(_1853, _1803, 1.0);
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1861 = _1825 * _1765;
    float _1863 = _1825 * _1791;
    float _1865 = _1825 * _1773;
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1859);
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1871 = log2(_1855);
    float _1873 = -_1869;
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1873);
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1879 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1881 = -_1865;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1875);
    float _1885 = 1.0 / _1867;
    float _1887 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1889 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1879);
    float _1891 = fma(_1883, -0.5, 0.5);
    float _1893 = fma(_1883, 0.5, 0.5);
    float _1895 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1887);
    float _1897 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1889);
    float _1899 = _1863 + 1.0;
    float _1901 = exp2(_1877);
    float _1903 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1895);
    float _1905 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1907 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1903);
    float _1909 = fma(_1893, _1905, -0.212114393711090087890625);
    float _1911 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1897);
    float _1913 = sqrt(_1891);
    float _1915 = fma(_1893, _1909, 1.570728778839111328125);
    float _1917 = _1911 * _1885;
    float _1919 = -_1863;
    float _1921 = fma(_1901, _1899, _1919);
    float _1923 = _1871 * 0.693147182464599609375;
    float _1925 = _1907 * _1885;
    float _1927 = fma(_1921, 0.5, 0.5);
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1931 = fma(_1925, 0.5, 0.5);
    float _1933 = fma(_1917, -0.5, 0.5);
    float _1935 = _1913 * 0.636619746685028076171875;
    float _1937 = -_1915;
    float _1939 = fma(_1935, _1937, 1.0);
    float3 _7006 = float3(_1931, _1933, _1929);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7006, float3(0.0), isnan(_7006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7006, float3(0.0), isnan(_7006)), level(0.0)).x;
    float3 _7017 = float3(_1931, _1933, _1929);
    float4 _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7017, float3(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7017, float3(0.0), isnan(_7017)), level(0.0)).xyzw;
    float _1946 = _1944.x;
    float _1948 = _1944.y;
    float _1950 = _1944.z;
    float _1952 = _1944.w;
    float2 _7034 = float2(_1939, _1927);
    float3 _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _1958 = _1956.x;
    float _1960 = _1956.y;
    float _1962 = _1956.z;
    float _1964 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1966 = int(_1964);
    float _1968 = _391 * _393;
    float _1970 = _395 * _397;
    float _1972 = _399 * _213;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1976 = _1974 != 0;
    float _1978 = -_977;
    float _1980 = _1978 + 1.0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1984 = _1982 != 0;
    out.m_60.y = _1099;
    float _1986 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1988 = int(_1986);
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1992 = _1990 != 0;
    float _1994 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.y = _1131;
    float _1996 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1998 = -_973;
    float _2000 = _1998 + 1.0;
    float _2002 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2004 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = float(uint(_1966));
    float _2008 = trunc(_965);
    int _2010 = int(_2008);
    float _2012 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2002);
    float _2014 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    out.m_64.x = _1487;
    out.m_64.y = _1485;
    out.m_64.z = _1489;
    float _2016 = float(uint(_1988));
    float _2018 = 1.0 / _2006;
    int _2020 = ~_1966;
    int _2022 = _2020 + 1;
    int _2024 = ~_1988;
    int _2026 = _2024 + 1;
    int _2028 = ~_1988;
    int _2030 = _2028 + 1;
    float _2032 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2034 = int(_2032);
    float _2036 = float(uint(_2010));
    float _2038 = 1.0 / _2016;
    int _2040 = as_type<int>(_2018) + (-2);
    float _2042 = as_type<float>(_2040) * _2036;
    float _2044 = trunc(_967);
    int _2046 = int(_2044);
    float _2048 = float(uint(_2034));
    int _2050 = ~_2034;
    int _2052 = _2050 + 1;
    float _2054 = 1.0 / _2048;
    int _2056 = as_type<int>(_2038) + (-2);
    float _2058 = trunc(_2042);
    float _2060 = precise::max(_2058, 0.0);
    uint _2063 = uint(_2060);
    float _2065 = float(uint(_2046));
    float _2067 = as_type<float>(_2056) * _2065;
    float _2069 = trunc(_971);
    int _2071 = int(_2069);
    int _2073 = as_type<int>(_2054) + (-2);
    float _2075 = trunc(_2067);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    int _2081 = _2022 * int(_2063);
    int _2083 = _2081 + _2010;
    float _2085 = float(uint(_2083));
    float _2087 = float(uint(_2071));
    float _2089 = floor(_1972);
    float _2091 = float(_2071);
    float _2093 = as_type<float>(_2040) * _2085;
    float _2095 = as_type<float>(_2073) * _2087;
    int _2097 = _2026 * int(_2079);
    int _2099 = _2097 + _2046;
    float _2101 = trunc(_2093);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    float _2107 = float(uint(_2099));
    float _2109 = trunc(_2095);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = ~_1966;
    int _2117 = _2115 + 1;
    float _2119 = as_type<float>(_2056) * _2107;
    float _2121 = -_2089;
    float _2123 = _1972 + _2121;
    float _2125 = float(_2010);
    float _2127 = floor(_1968);
    int _2129 = int(_2063) + int(_2105);
    float _2131 = floor(_1970);
    int _2133 = _2052 * int(_2113);
    int _2135 = _2133 + _2071;
    float _2137 = float(uint(_2135));
    float _2139 = -_2127;
    float _2141 = _1968 + _2139;
    float _2143 = trunc(_2119);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(_1966);
    float _2151 = as_type<float>(_2073) * _2137;
    float _2153 = float(_2034);
    bool _2155 = _2125 >= _2149;
    bool _2157 = isnan(_2125);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(_2149);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2163);
    float _2167 = _2123 * _2149;
    float _2169 = -_2131;
    float _2171 = _1970 + _2169;
    int _2173 = _2117 * _2129;
    int _2175 = _2173 + _2010;
    float _2177 = float(_1988);
    float _2179 = trunc(_2151);
    float _2181 = precise::max(_2179, 0.0);
    uint _2183 = uint(_2181);
    float _2185 = _2149 * _935;
    bool _2187 = _2091 >= _2153;
    bool _2189 = isnan(_2091);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan(_2153);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = _2141 * _2153;
    bool _2201 = uint(_2175) >= uint(_1966);
    float _2203 = _2171 * _2177;
    float _2205 = float(_2046);
    float _2207 = trunc(_2165);
    int _2209 = int(_2207);
    bool _2211 = !_2201;
    int _2213 = _2211 ? 0 : (-1);
    bool _2215 = _2205 >= _2177;
    bool _2217 = isnan(_2205);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(_2177);
    bool _2223 = _2219 || _2221;
    float _2225 = float(_2223);
    float _2227 = _2177 * _935;
    float _2229 = _2153 * _935;
    int _2231 = int(_2079) + int(_2147);
    int _2233 = ~_2129;
    int _2235 = _2233 + _2213;
    int _2237 = _2235 + 1;
    float _2239 = trunc(_2225);
    int _2241 = int(_2239);
    bool _2243 = _1966 == 0;
    int _2245 = _2030 * _2231;
    int _2247 = _2245 + _2046;
    bool _2249 = !_1992;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = _1966 * _2237;
    int _2255 = _2253 + _2010;
    int _2257 = int(_2113) + int(_2183);
    bool _2259 = uint(_2247) >= uint(_1988);
    float _2261 = trunc(_2167);
    int _2263 = int(_2261);
    int _2265 = ~_2209;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    bool _2271 = !_2243;
    int _2273 = _2271 ? _2255 : (-1);
    int _2275 = abs(_2251);
    int _2277 = abs(_493);
    int _2279 = _2273 * _2269;
    bool _2281 = !_2259;
    int _2283 = _2281 ? 0 : (-1);
    float _2285 = trunc(_2185);
    int _2287 = int(_2285);
    int _2289 = _1966 + (-1);
    int _2291 = ~_2231;
    int _2293 = _2291 + _2283;
    int _2295 = _2293 + 1;
    bool _2297 = _1988 == 0;
    int _2299 = _2263 * _2275;
    int _2301 = _2299 + _2010;
    int _2303 = ~_2241;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = _2209 * _2289;
    int _2311 = _2309 + _2279;
    int _2313 = abs(_531);
    int _2315 = _1988 * _2295;
    int _2317 = _2315 + _2046;
    int _2319 = abs(_537);
    int _2321 = _2311 * _2277;
    int _2323 = _1988 + (-1);
    float _2325 = trunc(_2203);
    int _2327 = int(_2325);
    bool _2329 = !_2297;
    int _2331 = _2329 ? _2317 : (-1);
    int _2333 = _2287 * _2313;
    int _2335 = _2333 + _2321;
    bool _2337 = !_1976;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = ~_2034;
    int _2343 = _2341 + 1;
    int _2345 = _2331 * _2307;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2349 = _2347 != 0;
    float _2351 = trunc(_2227);
    int _2353 = int(_2351);
    int _2355 = _2301 * _2319;
    int _2357 = _2355 + _2335;
    int _2359 = abs(_1301);
    int _2361 = _2241 * _2323;
    int _2363 = _2361 + _2345;
    int _2365 = abs(_1291);
    int _2367 = _2343 * _2257;
    int _2369 = _2367 + _2071;
    int _2371 = abs(_2339);
    bool _2373 = !_2349;
    int _2375 = _2373 ? 0 : 1;
    int _2377 = _2363 * _2365;
    bool _2379 = uint(_2369) >= uint(_2034);
    int _2381 = _2263 * _2371;
    int _2383 = _2381 + _2357;
    int _2385 = abs(_2375);
    float _2387 = trunc(_2197);
    int _2389 = int(_2387);
    bool _2391 = !_2379;
    int _2393 = _2391 ? 0 : (-1);
    float _2395 = _969 * (-0.15915493667125701904296875);
    float _2397 = float(uint(_2383));
    int _2399 = _2327 * _2385;
    int _2401 = _2399 + _2046;
    int _2403 = abs(_1327);
    int _2405 = _2353 * _2359;
    int _2407 = _2405 + _2377;
    int _2409 = ~_2257;
    int _2411 = _2409 + _2393;
    int _2413 = _2411 + 1;
    float _2415 = as_type<float>(_2040) * _2397;
    int _2417 = abs(_1331);
    int _2419 = _2401 * _2403;
    int _2421 = _2419 + _2407;
    int _2423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2425 = _2423 != 0;
    int _2427 = _2034 * _2413;
    int _2429 = _2427 + _2071;
    bool _2431 = _2034 == 0;
    float _2433 = trunc(_2415);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = _2327 * _2417;
    int _2441 = _2439 + _2421;
    bool _2443 = !_2425;
    int _2445 = _2443 ? 0 : 1;
    float _2447 = _439 + 0.5;
    int _2449 = ~_2389;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    bool _2455 = !_2431;
    int _2457 = _2455 ? _2429 : (-1);
    float _2459 = trunc(_2199);
    int _2461 = int(_2459);
    int _2463 = ~_1966;
    int _2465 = _2463 + 1;
    int _2467 = abs(_2445);
    int _2469 = _2457 * _2453;
    int _2471 = abs(_623);
    float _2473 = trunc(_2229);
    int _2475 = int(_2473);
    int _2477 = _2034 + (-1);
    int _2479 = _2465 * int(_2437);
    int _2481 = _2479 + _2383;
    float _2483 = float(uint(_2441));
    int _2485 = _2389 * _2477;
    int _2487 = _2485 + _2469;
    float _2489 = float(uint(_2301));
    int _2491 = _2461 * _2467;
    int _2493 = _2491 + _2071;
    int _2495 = abs(_627);
    float _2497 = as_type<float>(_2056) * _2483;
    int _2499 = _2487 * _2471;
    float _2501 = as_type<float>(_2040) * _2489;
    float _2503 = float(uint(_2481));
    float _2505 = trunc(_2497);
    float _2507 = precise::max(_2505, 0.0);
    uint _2509 = uint(_2507);
    bool _2511 = !_1984;
    int _2513 = _2511 ? 0 : 1;
    int _2515 = _2475 * _2495;
    int _2517 = _2515 + _2499;
    int _2519 = abs(_631);
    float _2521 = as_type<float>(_2040) * _2503;
    float _2523 = float(uint(_2401));
    int _2525 = abs(_2513);
    float _2527 = trunc(_2501);
    float _2529 = precise::max(_2527, 0.0);
    uint _2531 = uint(_2529);
    float _2533 = as_type<float>(_2056) * _2523;
    float _2535 = float(uint(_2493));
    int _2537 = _2493 * _2519;
    int _2539 = _2537 + _2517;
    int _2541 = ~_1988;
    int _2543 = _2541 + 1;
    float _2545 = trunc(_2521);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    int _2551 = ~_2034;
    int _2553 = _2551 + 1;
    int _2555 = _2461 * _2525;
    int _2557 = _2555 + _2539;
    float _2559 = as_type<float>(_2073) * _2535;
    int _2561 = ~_1966;
    int _2563 = _2561 + 1;
    int _2565 = ~_1988;
    int _2567 = _2565 + 1;
    float _2569 = trunc(_2533);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    int _2575 = _2543 * int(_2509);
    int _2577 = _2575 + _2441;
    float _2579 = float(uint(_2557));
    float _2581 = float(uint(_2577));
    int _2583 = _2563 * int(_2531);
    int _2585 = _2583 + _2301;
    float _2587 = trunc(_2559);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    float _2593 = as_type<float>(_2073) * _2579;
    int _2595 = int(_2437) + int(_2549);
    float _2597 = as_type<float>(_2056) * _2581;
    float _2599 = float(uint(_2585));
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    int _2607 = _2567 * int(_2573);
    int _2609 = _2607 + _2401;
    float _2611 = as_type<float>(_2040) * _2599;
    int _2613 = _2563 * _2595;
    int _2615 = _2613 + _2383;
    int _2617 = ~_2034;
    int _2619 = _2617 + 1;
    float _2621 = trunc(_2597);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    float _2627 = float(uint(_2609));
    int _2629 = _2553 * int(_2591);
    int _2631 = _2629 + _2493;
    bool _2633 = uint(_2615) >= uint(_1966);
    float _2635 = as_type<float>(_2056) * _2627;
    float _2637 = trunc(_2611);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    bool _2643 = !_2633;
    int _2645 = _2643 ? 0 : (-1);
    float _2647 = float(uint(_2631));
    int _2649 = _2619 * int(_2605);
    int _2651 = _2649 + _2557;
    int _2653 = ~_2595;
    int _2655 = _2653 + _2645;
    int _2657 = _2655 + 1;
    int _2659 = int(_2509) + int(_2625);
    float _2661 = as_type<float>(_2073) * _2647;
    int _2663 = ~_1988;
    int _2665 = _2663 + 1;
    int _2667 = _1966 * _2657;
    int _2669 = _2667 + _2383;
    float _2671 = float(uint(_2651));
    float _2673 = trunc(_2661);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    int _2679 = _2665 * _2659;
    int _2681 = _2679 + _2441;
    int _2683 = int(_2531) + int(_2641);
    float _2685 = as_type<float>(_2073) * _2671;
    bool _2687 = !_2243;
    int _2689 = _2687 ? _2669 : (-1);
    float _2691 = -_181;
    int _2693 = _1635 ? as_type<int>(_2691) : as_type<int>(_181);
    float _2695 = trunc(_2685);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    bool _2701 = uint(_2681) >= uint(_1988);
    int _2703 = _2689 & 3;
    bool _2705 = _2703 != 0;
    bool _2707 = !_2701;
    int _2709 = _2707 ? 0 : (-1);
    int _2711 = _2689 & 3;
    bool _2713 = _2711 != 0;
    float _2715 = trunc(_2635);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    int _2721 = _2705 ? 0 : 1;
    int _2723 = ~_2659;
    int _2725 = _2723 + _2709;
    int _2727 = _2725 + 1;
    bool _2729 = uint(_2711) > 1u;
    int _2731 = ~_1966;
    int _2733 = _2731 + 1;
    int _2735 = _1988 * _2727;
    int _2737 = _2735 + _2441;
    float _2739 = -_177;
    int _2741 = _1637 ? as_type<int>(_2739) : as_type<int>(_177);
    float _2743 = exp2(_1996);
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2747 = _2745 != 0;
    int _2749 = _2733 * _2683;
    int _2751 = _2749 + _2301;
    int _2753 = int(_2605) + int(_2699);
    bool _2755 = !_2747;
    float _2757 = _2755 ? _181 : as_type<float>(_2693);
    float _2759 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2761 = !_2297;
    int _2763 = _2761 ? _2737 : (-1);
    int _2765 = int(_2591) + int(_2677);
    bool _2767 = uint(_2751) >= uint(_1966);
    int _2769 = ~_2721;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = _2773;
    if (!_2729)
    {
        int _2777 = ~_2721;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    float _2783 = -_2743;
    float _2785 = _2783 + 1.0;
    int _2787 = _2763 & 3;
    bool _2789 = _2787 != 0;
    int _2791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2793 = _2791 != 0;
    bool _2795 = !_2767;
    int _2797 = _2795 ? 0 : (-1);
    bool _2799 = uint(_2787) > 1u;
    int _2801 = int(_2573) + int(_2719);
    bool _2803 = !_2793;
    float _2805 = _2803 ? _177 : as_type<float>(_2741);
    int _2807 = ~_1988;
    int _2809 = _2807 + 1;
    int _2811 = _2763 & 3;
    bool _2813 = _2811 != 0;
    bool _2815 = !_2789;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2809 * _2801;
    int _2821 = _2819 + _2401;
    bool _2823 = _2787 != 3;
    int _2825 = _2813 ? 0 : 1;
    bool _2827 = uint(_2787) >= 2u;
    int _2829 = ~_2034;
    int _2831 = _2829 + 1;
    int _2833 = ~_2034;
    int _2835 = _2833 + 1;
    int _2837 = _2827 ? 0 : 1;
    int _2839 = ~_2825;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2835 * _2765;
    int _2847 = _2845 + _2493;
    bool _2849 = uint(_2821) >= uint(_1988);
    int _2851 = _2831 * _2753;
    int _2853 = _2851 + _2557;
    int _2855 = _2843;
    if (!_2799)
    {
        int _2857 = ~_2825;
        int _2859 = _2857 + 1;
        _2855 = _2859;
    }
    int _2861 = _2855;
    float _2863 = _2395 * 6.283185482025146484375;
    float _2865 = sin(_2863);
    bool _2867 = _213 > 0.5;
    int _2869 = ~_2837;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = _2763 >> 31;
    int _2877 = _2873;
    if (_2823)
    {
        int _2879 = ~_2837;
        int _2881 = _2879 + 1;
        _2877 = _2881;
    }
    int _2883 = _2877;
    bool _2885 = !_2849;
    int _2887 = _2885 ? 0 : (-1);
    bool _2889 = uint(_2847) >= uint(_2034);
    bool _2891 = uint(_2853) >= uint(_2034);
    int _2893 = _2875 & 3;
    bool _2895 = !_2891;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = _2763 + _2893;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2903 = _2787 != 3;
    float _2905 = _2395 * 6.283185482025146484375;
    float _2907 = cos(_2905);
    bool _2909 = !_2889;
    int _2911 = _2909 ? 0 : (-1);
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2917 = _2915 != 0;
    float _2919 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2921 = -_177;
    int _2923 = _2867 ? as_type<int>(_2921) : as_type<int>(_177);
    float _2925 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2927 = _2899 >> 2;
    float _2929 = _2757 * _2865;
    bool _2931 = !_2917;
    float _2933 = _2931 ? _177 : as_type<float>(_2923);
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2937 = _2927 << 4;
    int _2939 = _2937 + 512;
    float _2941 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2943 = !_2903;
    int _2945 = _2943 ? 0 : (-1);
    float _2947 = _2757 * _2907;
    int _2949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2951 = _2949 != 0;
    float _2953 = -_2929;
    float _2955 = fma(_2933, _2907, _2953);
    int _2957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2959 = _2957 != 0;
    float _2961 = _2935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2965 = _2963 != 0;
    float _2967 = _431 + (-0.5);
    uint _2969 = uint(int(uint(_2939) >> uint(2)));
    uint _2971 = uint(int(uint(int(_2969)) >> uint(2)));
    int _2973 = int(_2969) & 3;
    float _2975 = (*spvDescriptorSet0.vp_c9)._m0[int(_2971)][_2973];
    int _2977 = int(_2969) + 1;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    int _2981 = _2977 & 3;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[int(_2979)][_2981];
    float _2985 = fma(_2933, _2865, _2947);
    out.m_66.x = _2925;
    out.m_66.y = _2919;
    out.m_66.z = _2961;
    float _2987 = -_2967;
    float _2989 = -_983;
    float _2991 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[90].y, _2989);
    int _2993 = abs(_2817);
    int _2995 = abs(_2883);
    int _2997 = ~_2753;
    int _2999 = _2997 + _2897;
    int _3001 = _2999 + 1;
    int _3003 = ~_2765;
    int _3005 = _3003 + _2911;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2945);
    float _3011 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[90].x, _875);
    float _3013 = _2955 + 0.5;
    float _3015 = _2985 + (-0.5);
    float _3017 = -_975;
    float _3019 = _3017 + 1.0;
    int _3021 = _2034 * _3007;
    int _3023 = _3021 + _2493;
    float _3025 = fma(_3013, (*spvDescriptorSet0.vp_c9)._m0[80].x, _957);
    float _3027 = fma(_431, _1980, _2991);
    float _3029 = -_3015;
    float _3031 = -_949;
    float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3031);
    float _3035 = -_3019;
    float _3037 = fma(_439, _3035, _3011);
    int _3039 = _2939 + 8;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    uint _3043 = uint(int(uint(int(_3041)) >> uint(2)));
    int _3045 = int(_3041) & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    int _3049 = int(_3041) + 1;
    uint _3051 = uint(int(uint(_3049) >> uint(2)));
    int _3053 = _3049 & 3;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[int(_3051)][_3053];
    float _3057 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3059 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3061 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_68.x = _3037;
    out.m_68.y = _3027;
    float _3063 = -_1149;
    float _3065 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3057);
    float _3067 = -_1149;
    float _3069 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3059);
    float _3071 = -_1149;
    float _3073 = fma(_3071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3075 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3077 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    int _3079 = abs(_2861);
    float _3081 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3069);
    float _3083 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3073);
    float _3085 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3087 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3089 = ~_3009;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3097 = int(_3095);
    int _3099 = ~_2801;
    int _3101 = _3099 + _2887;
    int _3103 = _3101 + 1;
    float _3105 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3087);
    int _3107 = ~_3079;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    float _3113 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3075);
    float _3115 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3085);
    float _3117 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3105);
    float _3119 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    int _3121 = _3111 * as_type<int>(_2983);
    int _3123 = ~_2993;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _2034 * _3001;
    int _3131 = _3129 + _2557;
    float _3133 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    int _3135 = ~_2683;
    int _3137 = _3135 + _2797;
    int _3139 = _3137 + 1;
    float _3141 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3143 = _3127 * as_type<int>(_2975);
    int _3145 = _3143 + _3121;
    float _3147 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3149 = !_2959;
    int _3151 = _3149 ? 0 : 1;
    int _3153 = _1988 * _3103;
    int _3155 = _3153 + _2401;
    int _3157 = ~_2995;
    int _3159 = _3157 + 1;
    int _3161 = _3159 + 1;
    float _3163 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3141);
    bool _3165 = uint(_2711) >= 2u;
    float _3167 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3147);
    int _3169 = abs(_3151);
    int _3171 = _1966 * _3139;
    int _3173 = _3171 + _2301;
    int _3175 = _2689 >> 31;
    float _3177 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3163);
    int _3179 = _3165 ? 0 : 1;
    bool _3181 = _2711 != 3;
    int _3183 = _3161 * as_type<int>(_3047);
    int _3185 = _3183 + _3145;
    bool _3187 = !_2431;
    int _3189 = _3187 ? _3131 : (-1);
    int _3191 = ~_3169;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3093 * as_type<int>(_3055);
    int _3199 = _3197 + _3185;
    int _3201 = _3175 & 3;
    int _3203 = _3189 >> 31;
    int _3205 = _2689 + _3201;
    int _3207 = _3199 * _3195;
    int _3209 = _3203 & 3;
    int _3211 = _3205 >> 2;
    int _3213 = ~_3179;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3189 + _3209;
    int _3221 = _3217;
    if (_3181)
    {
        int _3223 = ~_3179;
        int _3225 = _3223 + 1;
        _3221 = _3225;
    }
    int _3227 = _3221;
    int _3229 = _3211 << 4;
    int _3231 = _3229 + 368;
    float _3233 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _3235 = float(uint(_3097));
    int _3237 = _3219 >> 2;
    uint _3239 = uint(int(uint(_3231) >> uint(2)));
    uint _3241 = uint(int(uint(int(_3239)) >> uint(2)));
    int _3243 = int(_3239) & 3;
    float _3245 = (*spvDescriptorSet0.vp_c9)._m0[int(_3241)][_3243];
    int _3247 = int(_3239) + 1;
    uint _3249 = uint(int(uint(_3247) >> uint(2)));
    int _3251 = _3247 & 3;
    float _3253 = (*spvDescriptorSet0.vp_c9)._m0[int(_3249)][_3251];
    int _3255 = abs(_3097);
    float _3257 = 1.0 / _3235;
    bool _3259 = !_2297;
    int _3261 = _3259 ? _3155 : (-1);
    bool _3263 = !_2713;
    int _3265 = _3263 ? 0 : 1;
    int _3267 = _3237 << 4;
    int _3269 = _3267 + 656;
    int _3271 = _3261 * _3169;
    int _3273 = _3271 + _3207;
    int _3275 = _3189 & 3;
    bool _3277 = _3275 != 0;
    float _3279 = float(uint(_3255));
    uint _3281 = uint(int(uint(_3269) >> uint(2)));
    uint _3283 = uint(int(uint(int(_3281)) >> uint(2)));
    int _3285 = int(_3281) & 3;
    float _3287 = (*spvDescriptorSet0.vp_c9)._m0[int(_3283)][_3285];
    int _3289 = int(_3281) + 1;
    uint _3291 = uint(int(uint(_3289) >> uint(2)));
    int _3293 = _3289 & 3;
    float _3295 = (*spvDescriptorSet0.vp_c9)._m0[int(_3291)][_3293];
    bool _3297 = uint(_3275) > 1u;
    float _3299 = _2759 * _3081;
    int _3301 = _3189 & 3;
    bool _3303 = _3301 != 0;
    float _3305 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3167);
    float _3307 = 1.0 / _3279;
    float _3309 = float(uint(_3273));
    float _3311 = _2759 * _3077;
    int _3313 = _3303 ? 0 : 1;
    out.m_70.x = _3233;
    out.m_70.y = _3177;
    out.m_70.z = _3305;
    bool _3315 = _2711 != 3;
    float _3317 = fma(_2941, _3233, _3311);
    int _3319 = as_type<int>(_3257) + (-2);
    float _3321 = fma(_2941, _3177, _3299);
    int _3323 = ~_3313;
    int _3325 = _3323 + 1;
    int _3327 = _3325 + 1;
    bool _3329 = !_3277;
    int _3331 = _3329 ? 0 : 1;
    float _3333 = as_type<float>(_3319) * _3309;
    int _3335 = _3327;
    if (!_3297)
    {
        int _3337 = ~_3313;
        int _3339 = _3337 + 1;
        _3335 = _3339;
    }
    int _3341 = _3335;
    bool _3343 = _3275 != 3;
    int _3345 = _3231 + 8;
    uint _3347 = uint(int(uint(_3345) >> uint(2)));
    uint _3349 = uint(int(uint(int(_3347)) >> uint(2)));
    int _3351 = int(_3347) & 3;
    float _3353 = (*spvDescriptorSet0.vp_c9)._m0[int(_3349)][_3351];
    int _3355 = int(_3347) + 1;
    uint _3357 = uint(int(uint(_3355) >> uint(2)));
    int _3359 = _3355 & 3;
    float _3361 = (*spvDescriptorSet0.vp_c9)._m0[int(_3357)][_3359];
    int _3363 = abs(_3273);
    float _3365 = trunc(_3333);
    float _3367 = precise::max(_3365, 0.0);
    uint _3369 = uint(_3367);
    bool _3371 = uint(_3275) >= 2u;
    int _3373 = as_type<int>(_3307) + (-2);
    int _3375 = _3371 ? 0 : 1;
    float _3377 = float(uint(_3363));
    int _3379 = abs(_2781);
    bool _3381 = _3275 != 3;
    float _3383 = as_type<float>(_3373) * _3377;
    int _3385 = ~_3375;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    int _3391 = _3389;
    if (_3343)
    {
        int _3393 = ~_3375;
        int _3395 = _3393 + 1;
        _3391 = _3395;
    }
    int _3397 = _3391;
    int _3399 = _3269 + 8;
    uint _3401 = uint(int(uint(_3399) >> uint(2)));
    uint _3403 = uint(int(uint(int(_3401)) >> uint(2)));
    int _3405 = int(_3401) & 3;
    float _3407 = (*spvDescriptorSet0.vp_c9)._m0[int(_3403)][_3405];
    int _3409 = int(_3401) + 1;
    uint _3411 = uint(int(uint(_3409) >> uint(2)));
    int _3413 = _3409 & 3;
    float _3415 = (*spvDescriptorSet0.vp_c9)._m0[int(_3411)][_3413];
    int _3417 = abs(_3341);
    float _3419 = trunc(_3383);
    float _3421 = precise::max(_3419, 0.0);
    uint _3423 = uint(_3421);
    float _3425 = fma(_2759, _2759, 1.0);
    int _3427 = abs(_3265);
    int _3429 = ~_3379;
    int _3431 = _3429 + 1;
    int _3433 = _3431 + 1;
    int _3435 = ~_3417;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    float _3441 = rsqrt(_3425);
    int _3443 = abs(_3227);
    int _3445 = _3433 * as_type<int>(_3253);
    int _3447 = _3439 * as_type<int>(_3295);
    int _3449 = abs(_3331);
    int _3451 = ~_3427;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = ~_3255;
    int _3459 = _3457 + 1;
    int _3461 = ~_3097;
    int _3463 = _3461 + 1;
    int _3465 = _3455 * as_type<int>(_3245);
    int _3467 = _3465 + _3445;
    int _3469 = ~_3449;
    int _3471 = _3469 + 1;
    int _3473 = _3471 + 1;
    float _3475 = _2759 * _3441;
    int _3477 = _3463 * int(_3369);
    int _3479 = _3477 + _3273;
    int _3481 = ~_3443;
    int _3483 = _3481 + 1;
    int _3485 = _3483 + 1;
    int _3487 = _3473 * as_type<int>(_3287);
    int _3489 = _3487 + _3447;
    float _3491 = -_3117;
    float _3493 = _3475 * _3491;
    int _3495 = _3459 * int(_3423);
    int _3497 = _3495 + _3363;
    bool _3499 = !_3381;
    int _3501 = _3499 ? 0 : (-1);
    int _3503 = _3485 * as_type<int>(_3353);
    int _3505 = _3503 + _3467;
    float _3507 = float(uint(_3479));
    float _3509 = fma(_3441, _3077, _3493);
    int _3511 = abs(_3397);
    float _3513 = -_3119;
    float _3515 = _3475 * _3513;
    float _3517 = float(uint(_3497));
    float _3519 = as_type<float>(_3319) * _3507;
    int _3521 = abs(_3501);
    float _3523 = fma(_3441, _3081, _3515);
    float _3525 = -_3133;
    float _3527 = _3475 * _3525;
    float _3529 = as_type<float>(_3373) * _3517;
    float _3531 = trunc(_3519);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    int _3537 = ~_3511;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    float _3543 = _2759 * _3083;
    float _3545 = fma(_3441, _3083, _3527);
    int _3547 = ~_3521;
    int _3549 = _3547 + 1;
    int _3551 = _3549 + 1;
    int _3553 = _3541 * as_type<int>(_3407);
    int _3555 = _3553 + _3489;
    float _3557 = fma(_2941, _3305, _3543);
    float _3559 = trunc(_3529);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    int _3565 = ~_3097;
    int _3567 = _3565 + 1;
    int _3569 = _3551 * as_type<int>(_3415);
    int _3571 = _3569 + _3555;
    bool _3573 = !_2951;
    int _3575 = _3573 ? 0 : 1;
    out.m_72.x = _3509;
    out.m_72.y = _3523;
    out.m_72.z = _3545;
    bool _3577 = !_2965;
    int _3579 = _3577 ? 0 : 1;
    float _3581 = _3117 + _3317;
    int _3583 = abs(_3575);
    float _3585 = _3133 + _3557;
    int _3587 = ~_3255;
    int _3589 = _3587 + 1;
    int _3591 = int(_3369) + int(_3535);
    bool _3593 = !_3315;
    int _3595 = _3593 ? 0 : (-1);
    int _3597 = abs(_3579);
    int _3599 = int(_3423) + int(_3563);
    int _3601 = _3567 * _3591;
    int _3603 = _3601 + _3273;
    int _3605 = abs(_3595);
    int _3607 = _3589 * _3599;
    int _3609 = _3607 + _3363;
    int _3611 = ~_3605;
    int _3613 = _3611 + 1;
    int _3615 = _3613 + 1;
    float _3617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3619 = uint(_3603) >= uint(_3097);
    int _3621 = ~_3597;
    int _3623 = _3621 + 1;
    int _3625 = _3623 + 1;
    int _3627 = _3615 * as_type<int>(_3361);
    int _3629 = _3627 + _3505;
    int _3631 = ~_3583;
    int _3633 = _3631 + 1;
    int _3635 = _3633 + 1;
    bool _3637 = uint(_3609) >= uint(_3255);
    int _3639 = _3571 * _3625;
    bool _3641 = !_3619;
    int _3643 = _3641 ? 0 : (-1);
    float _3645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3647 = _3273 ^ _3097;
    int _3649 = _3629 * _3635;
    int _3651 = ~_3591;
    int _3653 = _3651 + _3643;
    int _3655 = _3653 + 1;
    float _3657 = _3119 + _3321;
    bool _3659 = !_3637;
    int _3661 = _3659 ? 0 : (-1);
    float _3663 = _3617 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    uint _3665 = uint(int(uint(_3647) >> uint(31)));
    int _3667 = _3097 * _3655;
    int _3669 = _3667 + _3273;
    int _3671 = ~_3661;
    int _3673 = _3599 + _3671;
    int _3675 = _3673 + 1;
    float _3677 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2012);
    bool _3679 = _3097 == 0;
    out.m_74.x = _3581;
    out.m_74.y = _3657;
    out.m_74.z = _3585;
    int _3681 = ~int(_3665);
    int _3683 = _3681 + 1;
    bool _3685 = !_3679;
    int _3687 = _3685 ? _3669 : (-1);
    float _3689 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3691 = _3675 ^ _3683;
    bool _3693 = _3097 == 0;
    int _3695 = ~_3683;
    int _3697 = _3695 + _3691;
    int _3699 = _3697 + 1;
    out.gl_Position.x = _1907;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _3677;
    out.gl_Position.w = _1867;
    float _3701 = float(_3687);
    bool _3703 = !_2243;
    int _3705 = _3703 ? _3173 : (-1);
    bool _3707 = !_2431;
    int _3709 = _3707 ? _3023 : (-1);
    float _3711 = fma(_3689, _3701, _963);
    bool _3713 = !_3693;
    int _3715 = _3713 ? _3699 : (-1);
    int _3717 = _3705 * _3583;
    int _3719 = _3717 + _3649;
    bool _3721 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3723 = isnan(_1645);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3729 = _3725 || _3727;
    int _3731 = _3709 * _3597;
    int _3733 = _3731 + _3639;
    float _3735 = float(_3715);
    float _3737 = _3677 + _1867;
    float _3739 = _2805 + 0.5;
    float _3741 = -_877;
    float _3743 = _3741 + 1.0;
    float _3745 = -_981;
    float _3747 = fma(_3663, _3735, _3745);
    float _3749 = _1255 + (-0.5);
    float _3751 = fma(_3689, _3739, _3711);
    float _3753 = _3737 * 0.5;
    float _3755 = -_959;
    float _3757 = _3755 + 1.0;
    float _3759 = -_3663;
    float _3761 = fma(_3759, _3749, _3747);
    float _3763 = -_3743;
    float _3765 = fma(_2805, _3763, _3751);
    float _3767 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3769 = -_979;
    float _3771 = _3769 + 1.0;
    float _3773 = float(_3733);
    float _3775 = -_2000;
    float _3777 = fma(_2955, _3775, _3025);
    float _3779 = _3767 * _1941;
    float _3781 = fma(_1255, _3771, _3761);
    float _3783 = -_3767;
    float _3785 = _3783 + 1.0;
    out.m_76.z = _3773;
    float _3787 = _1952 * _3779;
    float _3789 = _1962 * _3779;
    float _3791 = _1952 * _3785;
    float _3793 = float(_3719);
    float _3795 = fma(_1958, _3787, _1946);
    float _3797 = fma(_1960, _3787, _1948);
    float _3799 = fma(_1952, _3789, _1950);
    float _3801 = fma(_2985, _3757, _3033);
    out.m_76.x = _3793;
    out.m_78.x = _3795;
    out.m_78.y = _3797;
    out.m_78.z = _3799;
    out.m_78.w = _3791;
    float _3803 = _1557 * _1619;
    out.m_80.z = _3753;
    out.m_80.w = _1867;
    float _3805 = _3803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _3777;
    out.m_82.y = _3801;
    out.m_82.z = _3765;
    out.m_82.w = _3781;
    float _3807 = _3803;
    float _3809 = _3753;
    float _3811 = _3781;
    float _3813 = _3765;
    float _3815 = _3801;
    float _3817 = _3777;
    if (!_3729)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3819 = _3807;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3729)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3825 = _3809;
    float _3827 = _3825;
    float _3829 = _3825;
    if (!_3729)
    {
        _3811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3831 = _3811;
    float _3833 = _3831;
    float _3835 = _3831;
    if (!_3729)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3837 = _3813;
    float _3839 = _3837;
    float _3841 = _3837;
    if (!_3729)
    {
        _3815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3843 = _3815;
    float _3845 = _3843;
    float _3847 = _3843;
    if (!_3729)
    {
        _3817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3849 = _3817;
    bool _3851 = !_3729;
    float _3853 = _3849;
    float _3855 = _3849;
    if (!_3851)
    {
        bool _3857 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3859 = isnan(_1645);
        bool _3861 = _3857 || _3859;
        bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3865 = _3861 || _3863;
        if (!_3865)
        {
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = _1645 + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3873 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3871;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3879 = 1.0 / _3873;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3897 = _3869 * _3879;
            float _3899 = precise::clamp(_3897, 0.0, 1.0);
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3905 = fma(_3899, _3877, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3907 = fma(_3899, _3903, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3909 = fma(_3899, _3883, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3911 = fma(_3899, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3913 = fma(_3899, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3915 = fma(_3899, _3895, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3835 = _3909;
            _3855 = _3913;
            _3829 = _3905;
            _3847 = _3911;
            _3841 = _3907;
            _3823 = _3915;
            _3917 = true;
        }
        else
        {
            bool _3919 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3921 = isnan(_1645);
            bool _3923 = _3919 || _3921;
            bool _3925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3927 = _3923 || _3925;
            if (!_3927)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3929 = _3827;
            _3829 = _3929;
            if (!_3927)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3931 = _3833;
            _3835 = _3931;
            if (!_3927)
            {
                _3839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3933 = _3839;
            _3841 = _3933;
            if (!_3927)
            {
                _3845 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3935 = _3845;
            _3847 = _3935;
            if (!_3927)
            {
                _3853 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3937 = _3853;
            _3855 = _3937;
            if (!_3927)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3939 = _3821;
            bool _3941 = !_3927;
            _3823 = _3939;
            if (!_3941)
            {
                bool _3943 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3945 = isnan(_1645);
                bool _3947 = _3943 || _3945;
                bool _3949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3951 = _3947 || _3949;
                if (!_3951)
                {
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = _1645 + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3959 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3957;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3965 = 1.0 / _3959;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3983 = _3955 * _3965;
                    float _3985 = precise::clamp(_3983, 0.0, 1.0);
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3991 = fma(_3985, _3963, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3993 = fma(_3985, _3989, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3995 = fma(_3985, _3969, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3997 = fma(_3985, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3999 = fma(_3985, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4001 = fma(_3985, _3981, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3835 = _3995;
                    _3855 = _3999;
                    _3829 = _3991;
                    _3847 = _3997;
                    _3841 = _3993;
                    _3823 = _4001;
                    _3917 = true;
                }
                else
                {
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3855 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3847 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3917 = false;
    float _4003 = _3835;
    float _4005 = _3855;
    float _4007 = _3829;
    float _4009 = _3847;
    float _4011 = _3841;
    float _4013 = _3823;
    float _4015 = fma(_3657, -0.5, 0.5);
    float _4017 = precise::clamp(_4015, 0.0, 1.0);
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = _3805 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4025 = -_4007;
    float _4027 = _4025 + _4009;
    float _4029 = fma(_4017, _4021, _4003);
    out.m_84.x = 0.0;
    float _4031 = -_4011;
    float _4033 = _4031 + _4013;
    float _4035 = fma(_4017, _4027, _4007);
    float _4037 = _4029 * 0.586610972881317138671875;
    out.m_47.x = _4023;
    bool _4039 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4041 = fma(_4017, _4033, _4011);
    float _4043 = fma(_4035, 0.298911988735198974609375, _4037);
    bool _4045 = _1557 > 0.0;
    bool _4047 = isnan(_1557);
    bool _4049 = _4045 || _4047;
    bool _4051 = isnan(0.0);
    bool _4053 = _4049 || _4051;
    float _4055 = fma(_4041, 0.114477999508380889892578125, _4043);
    bool _4057 = _1619 <= 0.0;
    bool _4059 = !_4053;
    bool _4061 = _4057 || _4059;
    float _4063 = -_4055;
    float _4065 = _4035 + _4063;
    float _4067 = -_4055;
    float _4069 = _4029 + _4067;
    float _4071 = -_4055;
    float _4073 = _4041 + _4071;
    float _4075 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    float _4077 = fma(_4069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    float _4079 = fma(_4073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    bool _4081 = !_4039;
    if (!_4081)
    {
        float _4083 = -_1485;
        float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4087 = -_1487;
        float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4091 = -_1489;
        float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4095 = _4085 * _4085;
        float _4097 = fma(_4089, _4089, _4095);
        float _4099 = fma(_4093, _4093, _4097);
        float _4101 = sqrt(_4099);
        float _4103 = rsqrt(_4099);
        float _4105 = -_4101;
        float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4109 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4111 = precise::clamp(_4109, 0.0, 1.0);
        float _4113 = _4089 * _4103;
        float _4115 = _4085 * _4103;
        float _4117 = abs(_4111);
        float _4119 = log2(_4117);
        float _4121 = _4093 * _4103;
        float _4123 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4125 = _3657 * _4115;
        float _4127 = -_4115;
        float _4129 = -_4123;
        float _4131 = fma(_4127, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4129);
        float _4133 = fma(_3581, _4113, _4125);
        float _4135 = -_4121;
        float _4137 = fma(_4135, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4131);
        float _4139 = fma(_3585, _4121, _4133);
        float _4141 = precise::clamp(_4139, 0.0, 1.0);
        float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4145 = _4137 + _4143;
        float _4147 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4149 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4151 = precise::clamp(_4149, 0.0, 1.0);
        float _4153 = exp2(_4147);
        float _4155 = _4153 * _4151;
        float _4157 = _4141 * _4155;
        float _4159 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4163 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _4159;
        out.m_84.y = _4161;
        out.m_84.z = _4163;
    }
    out.m_86.x = _4075;
    out.m_86.y = _4077;
    out.m_86.z = _4079;
    if (!_4061)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4165;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3917 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4224 = as_type<float>(_123);
        out.gl_Position.z = _4224;
    }
    if (!_109)
    {
        return out;
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_105);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4294 = as_type<float>(_161);
        out.gl_Position.z = _4294;
    }
    if (_153)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_105);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = in.m_54.x;
    float _215 = in.m_54.y;
    float _217 = in.m_54.z;
    float _219 = in.m_54.w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _211 + _225;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = 1.0 / _235;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _251 = 0.0;
    if (_231)
    {
        float _253 = in.m_54.x;
        _251 = _253;
    }
    float _255 = _251;
    float _257 = 0.0;
    if (_231)
    {
        _257 = 1.0;
    }
    float _259 = _257;
    float _261 = 1.0 / _245;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = _211 + _263;
    float _267 = 0.0;
    int _269 = as_type<int>(_265);
    float _271 = _259;
    if (_231)
    {
        _267 = 1.0;
    }
    float _273 = _267;
    float _275 = _213 * 2.0;
    float _277 = _215 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _279 = _213 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _281 = _215 > 0.5;
    float _283 = 1.0 / _239;
    bool _285 = _217 > 0.5;
    float _287 = fma(_277, -2.0, _247);
    float _289 = _265 * _241;
    float _291 = -_249;
    float _293 = fma(_279, 2.0, _291);
    int _295 = as_type<int>(_241);
    float _297 = _273;
    if (_231)
    {
        _269 = 0;
    }
    int _299 = _269;
    float _301 = floor(_275);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _307 = int(_231);
    int _309 = _285 ? 2 : 0;
    int _311 = _307 | _309;
    int _313 = _281 ? 4 : 0;
    int _315 = _311 | _313;
    int _317 = false ? 8 : 0;
    int _319 = _315 | _317;
    int _321 = false ? 16 : 0;
    int _323 = _319 | _321;
    int _325 = false ? 32 : 0;
    int _327 = _323 | _325;
    int _329 = false ? 64 : 0;
    int _331 = _327 | _329;
    int _333 = _331 & 4;
    int _335 = _299;
    if (_231)
    {
        _295 = 0;
    }
    int _337 = _295;
    int _339 = int(_231);
    int _341 = _285 ? 2 : 0;
    int _343 = _339 | _341;
    int _345 = _281 ? 4 : 0;
    int _347 = _343 | _345;
    int _349 = false ? 8 : 0;
    int _351 = _347 | _349;
    int _353 = false ? 16 : 0;
    int _355 = _351 | _353;
    int _357 = false ? 32 : 0;
    int _359 = _355 | _357;
    int _361 = false ? 64 : 0;
    int _363 = _359 | _361;
    int _365 = _363 & 2;
    float _367 = 0.0;
    int _369 = _337;
    if (_231)
    {
        _367 = 1.0;
    }
    float _371 = _367;
    float _373 = 0.0;
    float _375 = _371;
    float _377 = _255;
    if (_231)
    {
        _373 = _255;
    }
    float _379 = _373;
    float _381 = _379;
    if (!_231)
    {
        float _383 = in.m_54.y;
        float _385 = in.m_54.z;
        _335 = 1;
        _369 = 2;
        _375 = 5.839270114898681640625;
        _381 = _385;
        _377 = _383;
        _297 = 1.2345600128173828125;
        _271 = 7.345489978790283203125;
    }
    int _387 = _335;
    int _389 = _369;
    float _391 = _375;
    float _393 = _381;
    float _395 = _377;
    float _397 = _297;
    float _399 = _271;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _411 = _409 != 0;
    float _413 = 1.0 / _305;
    float _415 = -_181;
    int _417 = _285 ? as_type<int>(_415) : as_type<int>(_181);
    float _419 = _223 * _283;
    float _421 = -_177;
    int _423 = _281 ? as_type<int>(_421) : as_type<int>(_177);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _427 = _211 + _425;
    bool _429 = !_411;
    float _431 = _429 ? _181 : as_type<float>(_417);
    float _433 = _215 * 2.0;
    float _435 = _227 * _261;
    bool _437 = !_407;
    float _439 = _437 ? _177 : as_type<float>(_423);
    float _441 = _213 + _217;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _453 = _451 != 0;
    float _455 = floor(_433);
    bool _457 = _301 > 0.0;
    float _459 = _441 + (-1.0);
    bool _461 = _301 >= 0.0;
    bool _463 = isnan(_301);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _427 * _413;
    bool _473 = _387 != 1;
    float _475 = _213 + _215;
    int _477 = _469 ? 0 : 1;
    float _479 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _481 = int(_479);
    float _483 = _475 + (-1.0);
    int _485 = ~_477;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    bool _491 = !_449;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _497 = _489;
    float _499 = _459;
    if (!_457)
    {
        int _501 = ~_477;
        int _503 = _501 + 1;
        _497 = _503;
    }
    int _505 = _497;
    float _507 = _215 + _217;
    bool _509 = _455 > 0.0;
    bool _511 = _455 >= 0.0;
    bool _513 = isnan(_455);
    bool _515 = _511 || _513;
    bool _517 = isnan(0.0);
    bool _519 = _515 || _517;
    float _521 = _217 * 2.0;
    float _523 = _507 + (-1.0);
    int _525 = _519 ? 0 : 1;
    float _527 = floor(_521);
    bool _529 = !_445;
    int _531 = _529 ? 0 : 1;
    float _533 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _535 = !_453;
    int _537 = _535 ? 0 : 1;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _549 = _547 != 0;
    float _551 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _553 = 0.0;
    float _555 = _507;
    if (!_473)
    {
        _553 = _215;
    }
    float _557 = _553;
    int _559 = ~_525;
    int _561 = _559 + 1;
    int _563 = _561 + 1;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    int _569 = _563;
    float _571 = _557;
    if (!_509)
    {
        int _573 = ~_525;
        int _575 = _573 + 1;
        _569 = _575;
    }
    int _577 = _569;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    bool _583 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _585 = isnan(_211);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_567, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    if (!_473)
    {
        _555 = _217;
    }
    float _597 = _555;
    float _599 = fma(_581, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _601 = _597;
    float _603 = _599;
    if (!_473)
    {
        _499 = _557;
    }
    float _605 = _499;
    float _607 = -_593;
    float _609 = _607 + 1.0;
    float _611 = 0.0;
    float _613 = _605;
    if (!_473)
    {
        _611 = _217;
    }
    float _615 = _611;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _621 = !_545;
    int _623 = _621 ? 0 : 1;
    bool _625 = !_541;
    int _627 = _625 ? 0 : 1;
    bool _629 = !_549;
    int _631 = _629 ? 0 : 1;
    float _633 = _615;
    if (_473)
    {
        _613 = _213;
    }
    float _635 = _613;
    if (_473)
    {
        _571 = _213;
    }
    float _637 = _571;
    if (_473)
    {
        _601 = _215;
    }
    float _639 = _601;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_473)
    {
        _633 = _215;
    }
    float _643 = _633;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _655 = _653 != 0;
    bool _657 = _527 > 0.0;
    bool _659 = _527 >= 0.0;
    bool _661 = isnan(_527);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    bool _669 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_211);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    int _681 = _667 ? 0 : 1;
    float _683 = _679 * _609;
    bool _685 = _389 != 2;
    float _687 = -_679;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _691;
    bool _695 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _697 = isnan(_211);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _711 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _713 = isnan(_211);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _723;
    bool _727 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _729 = isnan(_211);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -_705;
    float _741 = _739 + 1.0;
    float _743 = _705 * _689;
    float _745 = -_721;
    float _747 = _745 + 1.0;
    float _749 = fma(_693, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _751 = fma(_725, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _753 = _721 * _741;
    int _755 = ~_681;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _737 * _747;
    int _763 = _759;
    if (!_657)
    {
        int _765 = ~_681;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _777 = log2(_775);
    float _779 = _599 * _761;
    if (_685)
    {
        _603 = _213;
    }
    float _781 = _603;
    float _783 = fma(_773, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _785 = fma(_619, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _787 = _595 * _761;
    float _789 = _781;
    if (!_685)
    {
        _789 = _217;
    }
    float _791 = _789;
    float _793 = -_737;
    float _795 = _793 + 1.0;
    float _797 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _799 = int(_797);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _805 = _791 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _807 = !_647;
    int _809 = _807 ? 0 : 1;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _815 = int(_813);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _819 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[83].z, _811);
    float _821 = float(_105);
    float _823 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].w, _817);
    if (_685)
    {
        _113 = _215;
    }
    float _825 = _113;
    float _827 = _777 * _141;
    int _829 = abs(_809);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _835 = _825;
    if (!_685)
    {
        _835 = _213;
    }
    float _837 = _835;
    float _839 = _639 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _841 = -_831;
    float _843 = fma(_805, 2.0, _841);
    float _845 = fma(_839, -2.0, _833);
    float _847 = float(_829);
    float _849 = _837 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _851 = float(_799);
    float _853 = exp2(_827);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _857 = float(_481);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _861 = float(_769);
    float _863 = -_855;
    float _865 = fma(_641, 2.0, _863);
    float _867 = float(_815);
    float _869 = 1.0 / _851;
    float _871 = fma(_849, -2.0, _859);
    float _873 = -_141;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[86].x, _843);
    float _877 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _819);
    float _879 = 1.0 / _821;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _887 = 1.0 + _885;
    float _889 = -_853;
    float _891 = _889 + 1.0;
    bool _893 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _895 = isnan(1.0);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _901 = _897 || _899;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _905 = 1.0 / _857;
    bool _907 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _915 = _911 || _913;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _921 = !_651;
    int _923 = _921 ? 0 : 1;
    float _925 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _927 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[79].z, _903);
    float _929 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _931 = 1.0 / _867;
    float _933 = _847 * _861;
    float _935 = _879 * _141;
    float _937 = in.m_56.x;
    float _939 = in.m_56.y;
    float _941 = in.m_56.z;
    float _943 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[88].z, _919);
    float _945 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[88].w, _883);
    float _947 = _915 ? _891 : 0.0;
    float _949 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _287);
    float _951 = 1.0 / _887;
    int _953 = abs(_923);
    float _955 = -_141;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    float _959 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _925);
    float _961 = -_141;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[81].x, _865);
    float _965 = _905 * _141;
    float _967 = _869 * _141;
    float _969 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[79].x, _927);
    float _971 = _931 * _141;
    float _973 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _929);
    float _975 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _943);
    float _977 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _945);
    float _979 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    float _981 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _845);
    float _983 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _871);
    float _985 = _933 * (-2.0);
    if (_901)
    {
        float _987 = _947 * _951;
        _143 = _987;
    }
    float _989 = _143;
    float _991 = _215 + (-0.5);
    float _993 = float(_505);
    float _995 = fma(_985, _937, _937);
    bool _997 = !_655;
    int _999 = _997 ? 0 : 1;
    float _1001 = fma(_495, _985, _495);
    float _1003 = float(_953);
    float _1005 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    int _1007 = abs(_999);
    float _1009 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].y, _779);
    float _1011 = _213 + (-0.5);
    float _1013 = _1003 * _993;
    float _1015 = _217 + (-0.5);
    float _1017 = float(_577);
    float _1019 = _1013 * (-2.0);
    float _1021 = float(_1007);
    float _1023 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].x, _995);
    float _1025 = fma(_783, _753, _1005);
    float _1027 = fma(_1019, _939, _939);
    float _1029 = fma(_551, _1019, _551);
    float _1031 = _1021 * _1017;
    float _1033 = fma(_785, _753, _1009);
    float _1035 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1027);
    float _1037 = in.m_58.x;
    float _1039 = in.m_58.y;
    float _1041 = _1031 * (-2.0);
    float _1043 = fma(_1001, _989, _1023);
    float _1045 = fma(_1029, _989, _1035);
    float _1047 = fma(_709, _471, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1049 = fma(_1041, _941, _941);
    float _1051 = fma(_533, _1041, _533);
    float _1053 = in.m_44.x;
    float _1055 = in.m_44.y;
    float _1057 = in.m_44.z;
    float _1059 = fma(_749, _743, _1025);
    float _1061 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1049);
    float _1063 = fma(_803, _471, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1065 = fma(_751, _743, _1033);
    float _1067 = _1043 * 0.15915493667125701904296875;
    float _1069 = fma(_1051, _989, _1061);
    float _1071 = _1045 * 0.15915493667125701904296875;
    float _1073 = fma(_1047, _683, _1059);
    float _1075 = fma(_1063, _683, _1065);
    float _1077 = _1069 * 0.15915493667125701904296875;
    float _1079 = _1067 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1073);
    float _1085 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1075);
    bool _1087 = _219 > 0.5;
    float _1089 = _1083 * _1037;
    float _1091 = _1085 * _1039;
    float _1093 = _1067 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1101 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1103 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1105 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1113 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1101);
    float _1115 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1103);
    float _1117 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1119 = _1111 * _1097;
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1123 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1115);
    float _1125 = _1071 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1113);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1135 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1077 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    float _1141 = _1095 * _1109;
    float _1143 = _1081 * _1109;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1147 = _1077 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = _1081 * _1127;
    float _1153 = _1095 * _1127;
    float _1155 = _1127 * _1139;
    float _1157 = _1095 * _1139;
    float _1159 = _1099 * _1121;
    float _1161 = _1081 * _1139;
    float _1163 = _1109 * _1139;
    float _1165 = _1157 * _1159;
    float _1167 = fma(_1149, _1153, _1143);
    float _1169 = -_1141;
    float _1171 = fma(_1149, _1151, _1169);
    float _1173 = -_1151;
    float _1175 = fma(_1149, _1141, _1173);
    float _1177 = fma(_1149, _1143, _1153);
    float _1179 = -_1159;
    float _1181 = _1149 * _1179;
    float _1183 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1185 = fma(_1167, _1119, _1165);
    float _1187 = _1161 * _1159;
    float _1189 = fma(_1155, _1119, _1181);
    float _1191 = fma(_1175, _1183, _1185);
    float _1193 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1117);
    float _1195 = fma(_1171, _1119, _1187);
    float _1197 = fma(_1163, _1183, _1189);
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1203 = fma(_1177, _1183, _1195);
    float _1205 = _1193 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1207 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1199);
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1201);
    float _1211 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1213 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1145);
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1209);
    float _1219 = _1213 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1221 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1227 = 1.0 / _1219;
    float _1229 = _1205 + _1221;
    float _1231 = _1133 + _1223;
    float _1233 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1225);
    float _1235 = -_181;
    float _1237 = _1087 ? _1235 : _181;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1241 = _1229 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1245 = _1231 + _1243;
    float _1247 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1233);
    float _1249 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1211);
    float _1251 = _1241 * _1241;
    bool _1253 = !_403;
    float _1255 = _1253 ? _181 : _1237;
    float _1257 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1261 = _1259 != 0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1265 = _1263 != 0;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1273 = _1271 != 0;
    float _1275 = fma(_1245, _1245, _1251);
    float _1277 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1279 = _1257 + _1219;
    float _1281 = sqrt(_1275);
    float _1283 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1285 = _1279 * _1227;
    float _1287 = _1285 * 0.5;
    bool _1289 = !_1265;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = _1131 + _1283;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1295);
    bool _1299 = !_1261;
    int _1301 = _1299 ? 0 : 1;
    bool _1303 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1305 = isnan(0.5);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1311 = _1307 || _1309;
    bool _1313 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1315 = isnan(0.5);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1321 = _1317 || _1319;
    float _1323 = 1.0 / _1297;
    bool _1325 = !_1269;
    int _1327 = _1325 ? 0 : 1;
    bool _1329 = !_1273;
    int _1331 = _1329 ? 0 : 1;
    bool _1333 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1337 = _1237;
    float _1339 = _1283;
    float _1341 = _1287;
    float _1343 = _1281;
    float _1345 = _1227;
    float _1347 = _1245;
    float _1349 = _1241;
    float _1351 = _1089;
    float _1353 = _1071;
    if (!_1333)
    {
        _1335 = _1231;
    }
    float _1355 = _1335;
    float _1357 = _1355;
    if (!_1333)
    {
        _1337 = _1229;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (!_1333)
    {
        _1339 = _1293;
    }
    float _1363 = _1339;
    bool _1365 = !_1333;
    float _1367 = _1363;
    if (!_1365)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1373 = _1281 + _1371;
        float _1375 = rsqrt(_1275);
        float _1377 = _1373 * _1369;
        float _1379 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = _1377 * 0.15915493667125701904296875;
        float _1383 = _1381 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = _1381 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1385 + (-1.0);
        float _1393 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1395 = fma(_1389, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1397 = fma(_1293, _1385, _1393);
        float _1399 = _1375 * _1395;
        float _1401 = fma(_1245, _1399, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1403 = fma(_1241, _1399, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1357 = _1401;
        _1367 = _1397;
        _1341 = _1393;
        _1361 = _1403;
        _1343 = _1399;
    }
    float _1405 = _1357;
    float _1407 = _1367;
    float _1409 = _1341;
    float _1411 = _1361;
    float _1413 = _1343;
    float _1415 = _1413;
    float _1417 = _1411;
    float _1419 = _1409;
    if (_1321)
    {
        _1345 = 1.0;
    }
    float _1421 = _1345;
    float _1423 = _1421;
    if (_1311)
    {
        _1347 = _1405;
    }
    float _1425 = _1347;
    float _1427 = _1425;
    if (_1311)
    {
        _1349 = _1407;
    }
    float _1429 = _1349;
    float _1431 = _1429;
    if (!_1311)
    {
        float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1435 = _1131 + _1433;
        float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1439 = _1133 + _1437;
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1443 = -_1131;
        float _1445 = _1443 + _1407;
        float _1447 = _1435 * _1435;
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1451 = _1205 + _1449;
        float _1453 = fma(_1439, _1439, _1447);
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1457 = fma(_1451, _1451, _1453);
        float _1459 = sqrt(_1457);
        float _1461 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1463 = precise::min(_1459, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1465 = _1463 * _1455;
        float _1467 = -_1133;
        float _1469 = _1467 + _1405;
        float _1471 = _1461 * _1465;
        float _1473 = -_1205;
        float _1475 = _1473 + _1411;
        float _1477 = fma(_1469, _1471, _1133);
        float _1479 = fma(_1475, _1471, _1205);
        float _1481 = fma(_1445, _1471, _1131);
        _1415 = _1475;
        _1431 = _1481;
        _1427 = _1477;
        _1417 = _1479;
        _1419 = _1441;
    }
    float _1483 = _1415;
    float _1485 = _1431;
    float _1487 = _1427;
    float _1489 = _1417;
    float _1491 = _1419;
    float _1493 = _1491;
    float _1495 = _1483;
    if (_1321)
    {
        _1351 = 1.0;
    }
    float _1497 = _1351;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1501 = _1323 * _1499;
    float _1503 = _1497;
    if (!_1321)
    {
        float _1505 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = _1509 * 0.15915493667125701904296875;
        float _1517 = _1507 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = 1.0 / _1513;
        float _1523 = _1515 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = _1515 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = _1525 * _1527;
        float _1535 = 1.0 / _1533;
        float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1539 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1537;
        float _1541 = 1.0 / _1539;
        float _1543 = _1531 * _1535;
        float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1547 = fma(_1501, _1543, _1545);
        float _1549 = _1547 * _1541;
        float _1551 = precise::clamp(_1549, 0.0, 1.0);
        _1493 = _1541;
        _1495 = _1521;
        _1423 = _1551;
    }
    float _1553 = _1493;
    float _1555 = _1495;
    float _1557 = _1423;
    float _1559 = _1553;
    float _1561 = _1555;
    if (!_1321)
    {
        float _1563 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1565 = _1563 * 0.15915493667125701904296875;
        float _1567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1569 = _1565 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1567 * 0.15915493667125701904296875;
        float _1575 = _1565 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        float _1579 = 1.0 / _1571;
        float _1581 = _1573 * 6.283185482025146484375;
        float _1583 = cos(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = _1573 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = _1583 * _1585;
        float _1593 = 1.0 / _1591;
        float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1597 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1595;
        float _1599 = 1.0 / _1597;
        float _1601 = _1589 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1605 = fma(_1501, _1601, _1603);
        float _1607 = _1605 * _1599;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        float _1611 = -_1609;
        float _1613 = _1611 + 1.0;
        _1559 = _1577;
        _1561 = _1589;
        _1503 = _1613;
    }
    float _1615 = _1559;
    float _1617 = _1561;
    float _1619 = _1503;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1485 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1487 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1489 + _1629;
    float _1633 = _1623 * _1623;
    bool _1635 = _333 != 0;
    bool _1637 = _365 != 0;
    float _1639 = fma(_1627, _1627, _1633);
    float _1641 = fma(_1631, _1631, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1627 * _1647;
    float _1651 = _1631 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1643;
    float _1669 = _1665;
    float _1671 = _1615;
    float _1673 = _1623;
    float _1675 = _1647;
    if (_1661)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1677;
    }
    float _1679 = _1667;
    float _1681 = _1679;
    if (_1661)
    {
        float _1683 = _1665 * _1679;
        _1669 = _1683;
    }
    float _1685 = _1669;
    if (_1661)
    {
        float _1687 = rsqrt(_1657);
        _1681 = _1687;
    }
    float _1689 = _1681;
    float _1691 = _1689;
    if (_1661)
    {
        float _1693 = _1685 * 0.15915493667125701904296875;
        _1671 = _1693;
    }
    float _1695 = _1671;
    float _1697 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1699 = _1631;
    if (_1661)
    {
        float _1701 = _1695 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = precise::max(0.0, _1697);
    float _1709 = _1617;
    float _1711 = _1707;
    if (_1661)
    {
        float _1713 = _1695 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -_1647;
    float _1721 = -_1707;
    float _1723 = fma(_1623, _1719, _1721);
    if (_1661)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1673 = _1725;
    }
    float _1727 = _1673;
    float _1729 = _1705;
    float _1731 = _1727;
    if (_1661)
    {
        float _1733 = fma(_1705, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1711 = _1733;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    if (!_1661)
    {
        _1729 = _1649;
    }
    float _1739 = _1729;
    float _1741 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1743 = _1739;
    if (_1661)
    {
        float _1745 = _1689 * _1735;
        _1353 = _1745;
    }
    float _1747 = _1353;
    if (!_1661)
    {
        _1737 = _1723;
    }
    float _1749 = _1737;
    float _1751 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1741);
    float _1753 = _1749;
    float _1755 = _1717;
    if (_1661)
    {
        float _1757 = _1717 + (-1.0);
        _1731 = _1757;
    }
    float _1759 = _1731;
    float _1761 = _1759;
    if (_1661)
    {
        float _1763 = _1649 * _1747;
        _1743 = _1763;
    }
    float _1765 = _1743;
    if (!_1661)
    {
        _1691 = _1651;
    }
    float _1767 = _1691;
    float _1769 = _1767;
    if (_1661)
    {
        float _1771 = _1651 * _1747;
        _1769 = _1771;
    }
    float _1773 = _1769;
    if (_1661)
    {
        float _1775 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1775;
    }
    float _1777 = _1675;
    if (!_1661)
    {
        _1761 = _1653;
    }
    float _1779 = _1761;
    float _1781 = _1779;
    if (_1661)
    {
        float _1783 = _1765 * _1765;
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1661)
    {
        float _1789 = fma(_1723, _1717, _1777);
        _1753 = _1789;
    }
    float _1791 = _1753;
    if (!_1661)
    {
        _1755 = _1655;
    }
    float _1793 = _1755;
    float _1795 = _1793;
    if (_1661)
    {
        float _1797 = _1773 * _1773;
        _1795 = _1797;
    }
    float _1799 = _1795;
    float _1801 = fma(_1791, _1791, _1785);
    float _1803 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1805 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1807 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = _1801 + _1799;
    float _1811 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1813 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1751);
    float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1817 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1815);
    float _1819 = precise::clamp(_1817, 0.0, 1.0);
    float _1821 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1823 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1811);
    float _1825 = rsqrt(_1809);
    float _1827 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1819;
    float _1831 = _1829 + 1.0;
    float _1833 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1823);
    float _1835 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1839 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1841 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = abs(_1831);
    float _1845 = log2(_1843);
    float _1847 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1849 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1851 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1837);
    float _1853 = -_1847;
    float _1855 = fma(_1853, _1803, 1.0);
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1861 = _1825 * _1765;
    float _1863 = _1825 * _1791;
    float _1865 = _1825 * _1773;
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1859);
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1871 = log2(_1855);
    float _1873 = -_1869;
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1873);
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1879 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1881 = -_1865;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1875);
    float _1885 = 1.0 / _1867;
    float _1887 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1889 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1879);
    float _1891 = fma(_1883, -0.5, 0.5);
    float _1893 = fma(_1883, 0.5, 0.5);
    float _1895 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1887);
    float _1897 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1889);
    float _1899 = _1863 + 1.0;
    float _1901 = exp2(_1877);
    float _1903 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1895);
    float _1905 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1907 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1903);
    float _1909 = fma(_1893, _1905, -0.212114393711090087890625);
    float _1911 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1897);
    float _1913 = sqrt(_1891);
    float _1915 = fma(_1893, _1909, 1.570728778839111328125);
    float _1917 = _1911 * _1885;
    float _1919 = -_1863;
    float _1921 = fma(_1901, _1899, _1919);
    float _1923 = _1871 * 0.693147182464599609375;
    float _1925 = _1907 * _1885;
    float _1927 = fma(_1921, 0.5, 0.5);
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1931 = fma(_1925, 0.5, 0.5);
    float _1933 = fma(_1917, -0.5, 0.5);
    float _1935 = _1913 * 0.636619746685028076171875;
    float _1937 = -_1915;
    float _1939 = fma(_1935, _1937, 1.0);
    float3 _7006 = float3(_1931, _1933, _1929);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7006, float3(0.0), isnan(_7006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7006, float3(0.0), isnan(_7006)), level(0.0)).x;
    float3 _7017 = float3(_1931, _1933, _1929);
    float4 _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7017, float3(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7017, float3(0.0), isnan(_7017)), level(0.0)).xyzw;
    float _1946 = _1944.x;
    float _1948 = _1944.y;
    float _1950 = _1944.z;
    float _1952 = _1944.w;
    float2 _7034 = float2(_1939, _1927);
    float3 _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _1958 = _1956.x;
    float _1960 = _1956.y;
    float _1962 = _1956.z;
    float _1964 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1966 = int(_1964);
    float _1968 = _391 * _393;
    float _1970 = _395 * _397;
    float _1972 = _399 * _213;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1976 = _1974 != 0;
    float _1978 = -_977;
    float _1980 = _1978 + 1.0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1984 = _1982 != 0;
    out.m_60.y = _1099;
    float _1986 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1988 = int(_1986);
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1992 = _1990 != 0;
    float _1994 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.y = _1131;
    float _1996 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1998 = -_973;
    float _2000 = _1998 + 1.0;
    float _2002 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2004 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = float(uint(_1966));
    float _2008 = trunc(_965);
    int _2010 = int(_2008);
    float _2012 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2002);
    float _2014 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    out.m_64.x = _1487;
    out.m_64.y = _1485;
    out.m_64.z = _1489;
    float _2016 = float(uint(_1988));
    float _2018 = 1.0 / _2006;
    int _2020 = ~_1966;
    int _2022 = _2020 + 1;
    int _2024 = ~_1988;
    int _2026 = _2024 + 1;
    int _2028 = ~_1988;
    int _2030 = _2028 + 1;
    float _2032 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2034 = int(_2032);
    float _2036 = float(uint(_2010));
    float _2038 = 1.0 / _2016;
    int _2040 = as_type<int>(_2018) + (-2);
    float _2042 = as_type<float>(_2040) * _2036;
    float _2044 = trunc(_967);
    int _2046 = int(_2044);
    float _2048 = float(uint(_2034));
    int _2050 = ~_2034;
    int _2052 = _2050 + 1;
    float _2054 = 1.0 / _2048;
    int _2056 = as_type<int>(_2038) + (-2);
    float _2058 = trunc(_2042);
    float _2060 = precise::max(_2058, 0.0);
    uint _2063 = uint(_2060);
    float _2065 = float(uint(_2046));
    float _2067 = as_type<float>(_2056) * _2065;
    float _2069 = trunc(_971);
    int _2071 = int(_2069);
    int _2073 = as_type<int>(_2054) + (-2);
    float _2075 = trunc(_2067);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    int _2081 = _2022 * int(_2063);
    int _2083 = _2081 + _2010;
    float _2085 = float(uint(_2083));
    float _2087 = float(uint(_2071));
    float _2089 = floor(_1972);
    float _2091 = float(_2071);
    float _2093 = as_type<float>(_2040) * _2085;
    float _2095 = as_type<float>(_2073) * _2087;
    int _2097 = _2026 * int(_2079);
    int _2099 = _2097 + _2046;
    float _2101 = trunc(_2093);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    float _2107 = float(uint(_2099));
    float _2109 = trunc(_2095);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = ~_1966;
    int _2117 = _2115 + 1;
    float _2119 = as_type<float>(_2056) * _2107;
    float _2121 = -_2089;
    float _2123 = _1972 + _2121;
    float _2125 = float(_2010);
    float _2127 = floor(_1968);
    int _2129 = int(_2063) + int(_2105);
    float _2131 = floor(_1970);
    int _2133 = _2052 * int(_2113);
    int _2135 = _2133 + _2071;
    float _2137 = float(uint(_2135));
    float _2139 = -_2127;
    float _2141 = _1968 + _2139;
    float _2143 = trunc(_2119);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(_1966);
    float _2151 = as_type<float>(_2073) * _2137;
    float _2153 = float(_2034);
    bool _2155 = _2125 >= _2149;
    bool _2157 = isnan(_2125);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(_2149);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2163);
    float _2167 = _2123 * _2149;
    float _2169 = -_2131;
    float _2171 = _1970 + _2169;
    int _2173 = _2117 * _2129;
    int _2175 = _2173 + _2010;
    float _2177 = float(_1988);
    float _2179 = trunc(_2151);
    float _2181 = precise::max(_2179, 0.0);
    uint _2183 = uint(_2181);
    float _2185 = _2149 * _935;
    bool _2187 = _2091 >= _2153;
    bool _2189 = isnan(_2091);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan(_2153);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = _2141 * _2153;
    bool _2201 = uint(_2175) >= uint(_1966);
    float _2203 = _2171 * _2177;
    float _2205 = float(_2046);
    float _2207 = trunc(_2165);
    int _2209 = int(_2207);
    bool _2211 = !_2201;
    int _2213 = _2211 ? 0 : (-1);
    bool _2215 = _2205 >= _2177;
    bool _2217 = isnan(_2205);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(_2177);
    bool _2223 = _2219 || _2221;
    float _2225 = float(_2223);
    float _2227 = _2177 * _935;
    float _2229 = _2153 * _935;
    int _2231 = int(_2079) + int(_2147);
    int _2233 = ~_2129;
    int _2235 = _2233 + _2213;
    int _2237 = _2235 + 1;
    float _2239 = trunc(_2225);
    int _2241 = int(_2239);
    bool _2243 = _1966 == 0;
    int _2245 = _2030 * _2231;
    int _2247 = _2245 + _2046;
    bool _2249 = !_1992;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = _1966 * _2237;
    int _2255 = _2253 + _2010;
    int _2257 = int(_2113) + int(_2183);
    bool _2259 = uint(_2247) >= uint(_1988);
    float _2261 = trunc(_2167);
    int _2263 = int(_2261);
    int _2265 = ~_2209;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    bool _2271 = !_2243;
    int _2273 = _2271 ? _2255 : (-1);
    int _2275 = abs(_2251);
    int _2277 = abs(_493);
    int _2279 = _2273 * _2269;
    bool _2281 = !_2259;
    int _2283 = _2281 ? 0 : (-1);
    float _2285 = trunc(_2185);
    int _2287 = int(_2285);
    int _2289 = _1966 + (-1);
    int _2291 = ~_2231;
    int _2293 = _2291 + _2283;
    int _2295 = _2293 + 1;
    bool _2297 = _1988 == 0;
    int _2299 = _2263 * _2275;
    int _2301 = _2299 + _2010;
    int _2303 = ~_2241;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = _2209 * _2289;
    int _2311 = _2309 + _2279;
    int _2313 = abs(_531);
    int _2315 = _1988 * _2295;
    int _2317 = _2315 + _2046;
    int _2319 = abs(_537);
    int _2321 = _2311 * _2277;
    int _2323 = _1988 + (-1);
    float _2325 = trunc(_2203);
    int _2327 = int(_2325);
    bool _2329 = !_2297;
    int _2331 = _2329 ? _2317 : (-1);
    int _2333 = _2287 * _2313;
    int _2335 = _2333 + _2321;
    bool _2337 = !_1976;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = ~_2034;
    int _2343 = _2341 + 1;
    int _2345 = _2331 * _2307;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2349 = _2347 != 0;
    float _2351 = trunc(_2227);
    int _2353 = int(_2351);
    int _2355 = _2301 * _2319;
    int _2357 = _2355 + _2335;
    int _2359 = abs(_1301);
    int _2361 = _2241 * _2323;
    int _2363 = _2361 + _2345;
    int _2365 = abs(_1291);
    int _2367 = _2343 * _2257;
    int _2369 = _2367 + _2071;
    int _2371 = abs(_2339);
    bool _2373 = !_2349;
    int _2375 = _2373 ? 0 : 1;
    int _2377 = _2363 * _2365;
    bool _2379 = uint(_2369) >= uint(_2034);
    int _2381 = _2263 * _2371;
    int _2383 = _2381 + _2357;
    int _2385 = abs(_2375);
    float _2387 = trunc(_2197);
    int _2389 = int(_2387);
    bool _2391 = !_2379;
    int _2393 = _2391 ? 0 : (-1);
    float _2395 = _969 * (-0.15915493667125701904296875);
    float _2397 = float(uint(_2383));
    int _2399 = _2327 * _2385;
    int _2401 = _2399 + _2046;
    int _2403 = abs(_1327);
    int _2405 = _2353 * _2359;
    int _2407 = _2405 + _2377;
    int _2409 = ~_2257;
    int _2411 = _2409 + _2393;
    int _2413 = _2411 + 1;
    float _2415 = as_type<float>(_2040) * _2397;
    int _2417 = abs(_1331);
    int _2419 = _2401 * _2403;
    int _2421 = _2419 + _2407;
    int _2423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2425 = _2423 != 0;
    int _2427 = _2034 * _2413;
    int _2429 = _2427 + _2071;
    bool _2431 = _2034 == 0;
    float _2433 = trunc(_2415);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = _2327 * _2417;
    int _2441 = _2439 + _2421;
    bool _2443 = !_2425;
    int _2445 = _2443 ? 0 : 1;
    float _2447 = _439 + 0.5;
    int _2449 = ~_2389;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    bool _2455 = !_2431;
    int _2457 = _2455 ? _2429 : (-1);
    float _2459 = trunc(_2199);
    int _2461 = int(_2459);
    int _2463 = ~_1966;
    int _2465 = _2463 + 1;
    int _2467 = abs(_2445);
    int _2469 = _2457 * _2453;
    int _2471 = abs(_623);
    float _2473 = trunc(_2229);
    int _2475 = int(_2473);
    int _2477 = _2034 + (-1);
    int _2479 = _2465 * int(_2437);
    int _2481 = _2479 + _2383;
    float _2483 = float(uint(_2441));
    int _2485 = _2389 * _2477;
    int _2487 = _2485 + _2469;
    float _2489 = float(uint(_2301));
    int _2491 = _2461 * _2467;
    int _2493 = _2491 + _2071;
    int _2495 = abs(_627);
    float _2497 = as_type<float>(_2056) * _2483;
    int _2499 = _2487 * _2471;
    float _2501 = as_type<float>(_2040) * _2489;
    float _2503 = float(uint(_2481));
    float _2505 = trunc(_2497);
    float _2507 = precise::max(_2505, 0.0);
    uint _2509 = uint(_2507);
    bool _2511 = !_1984;
    int _2513 = _2511 ? 0 : 1;
    int _2515 = _2475 * _2495;
    int _2517 = _2515 + _2499;
    int _2519 = abs(_631);
    float _2521 = as_type<float>(_2040) * _2503;
    float _2523 = float(uint(_2401));
    int _2525 = abs(_2513);
    float _2527 = trunc(_2501);
    float _2529 = precise::max(_2527, 0.0);
    uint _2531 = uint(_2529);
    float _2533 = as_type<float>(_2056) * _2523;
    float _2535 = float(uint(_2493));
    int _2537 = _2493 * _2519;
    int _2539 = _2537 + _2517;
    int _2541 = ~_1988;
    int _2543 = _2541 + 1;
    float _2545 = trunc(_2521);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    int _2551 = ~_2034;
    int _2553 = _2551 + 1;
    int _2555 = _2461 * _2525;
    int _2557 = _2555 + _2539;
    float _2559 = as_type<float>(_2073) * _2535;
    int _2561 = ~_1966;
    int _2563 = _2561 + 1;
    int _2565 = ~_1988;
    int _2567 = _2565 + 1;
    float _2569 = trunc(_2533);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    int _2575 = _2543 * int(_2509);
    int _2577 = _2575 + _2441;
    float _2579 = float(uint(_2557));
    float _2581 = float(uint(_2577));
    int _2583 = _2563 * int(_2531);
    int _2585 = _2583 + _2301;
    float _2587 = trunc(_2559);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    float _2593 = as_type<float>(_2073) * _2579;
    int _2595 = int(_2437) + int(_2549);
    float _2597 = as_type<float>(_2056) * _2581;
    float _2599 = float(uint(_2585));
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    int _2607 = _2567 * int(_2573);
    int _2609 = _2607 + _2401;
    float _2611 = as_type<float>(_2040) * _2599;
    int _2613 = _2563 * _2595;
    int _2615 = _2613 + _2383;
    int _2617 = ~_2034;
    int _2619 = _2617 + 1;
    float _2621 = trunc(_2597);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    float _2627 = float(uint(_2609));
    int _2629 = _2553 * int(_2591);
    int _2631 = _2629 + _2493;
    bool _2633 = uint(_2615) >= uint(_1966);
    float _2635 = as_type<float>(_2056) * _2627;
    float _2637 = trunc(_2611);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    bool _2643 = !_2633;
    int _2645 = _2643 ? 0 : (-1);
    float _2647 = float(uint(_2631));
    int _2649 = _2619 * int(_2605);
    int _2651 = _2649 + _2557;
    int _2653 = ~_2595;
    int _2655 = _2653 + _2645;
    int _2657 = _2655 + 1;
    int _2659 = int(_2509) + int(_2625);
    float _2661 = as_type<float>(_2073) * _2647;
    int _2663 = ~_1988;
    int _2665 = _2663 + 1;
    int _2667 = _1966 * _2657;
    int _2669 = _2667 + _2383;
    float _2671 = float(uint(_2651));
    float _2673 = trunc(_2661);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    int _2679 = _2665 * _2659;
    int _2681 = _2679 + _2441;
    int _2683 = int(_2531) + int(_2641);
    float _2685 = as_type<float>(_2073) * _2671;
    bool _2687 = !_2243;
    int _2689 = _2687 ? _2669 : (-1);
    float _2691 = -_181;
    int _2693 = _1635 ? as_type<int>(_2691) : as_type<int>(_181);
    float _2695 = trunc(_2685);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    bool _2701 = uint(_2681) >= uint(_1988);
    int _2703 = _2689 & 3;
    bool _2705 = _2703 != 0;
    bool _2707 = !_2701;
    int _2709 = _2707 ? 0 : (-1);
    int _2711 = _2689 & 3;
    bool _2713 = _2711 != 0;
    float _2715 = trunc(_2635);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    int _2721 = _2705 ? 0 : 1;
    int _2723 = ~_2659;
    int _2725 = _2723 + _2709;
    int _2727 = _2725 + 1;
    bool _2729 = uint(_2711) > 1u;
    int _2731 = ~_1966;
    int _2733 = _2731 + 1;
    int _2735 = _1988 * _2727;
    int _2737 = _2735 + _2441;
    float _2739 = -_177;
    int _2741 = _1637 ? as_type<int>(_2739) : as_type<int>(_177);
    float _2743 = exp2(_1996);
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2747 = _2745 != 0;
    int _2749 = _2733 * _2683;
    int _2751 = _2749 + _2301;
    int _2753 = int(_2605) + int(_2699);
    bool _2755 = !_2747;
    float _2757 = _2755 ? _181 : as_type<float>(_2693);
    float _2759 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2761 = !_2297;
    int _2763 = _2761 ? _2737 : (-1);
    int _2765 = int(_2591) + int(_2677);
    bool _2767 = uint(_2751) >= uint(_1966);
    int _2769 = ~_2721;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = _2773;
    if (!_2729)
    {
        int _2777 = ~_2721;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    float _2783 = -_2743;
    float _2785 = _2783 + 1.0;
    int _2787 = _2763 & 3;
    bool _2789 = _2787 != 0;
    int _2791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2793 = _2791 != 0;
    bool _2795 = !_2767;
    int _2797 = _2795 ? 0 : (-1);
    bool _2799 = uint(_2787) > 1u;
    int _2801 = int(_2573) + int(_2719);
    bool _2803 = !_2793;
    float _2805 = _2803 ? _177 : as_type<float>(_2741);
    int _2807 = ~_1988;
    int _2809 = _2807 + 1;
    int _2811 = _2763 & 3;
    bool _2813 = _2811 != 0;
    bool _2815 = !_2789;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2809 * _2801;
    int _2821 = _2819 + _2401;
    bool _2823 = _2787 != 3;
    int _2825 = _2813 ? 0 : 1;
    bool _2827 = uint(_2787) >= 2u;
    int _2829 = ~_2034;
    int _2831 = _2829 + 1;
    int _2833 = ~_2034;
    int _2835 = _2833 + 1;
    int _2837 = _2827 ? 0 : 1;
    int _2839 = ~_2825;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2835 * _2765;
    int _2847 = _2845 + _2493;
    bool _2849 = uint(_2821) >= uint(_1988);
    int _2851 = _2831 * _2753;
    int _2853 = _2851 + _2557;
    int _2855 = _2843;
    if (!_2799)
    {
        int _2857 = ~_2825;
        int _2859 = _2857 + 1;
        _2855 = _2859;
    }
    int _2861 = _2855;
    float _2863 = _2395 * 6.283185482025146484375;
    float _2865 = sin(_2863);
    bool _2867 = _213 > 0.5;
    int _2869 = ~_2837;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = _2763 >> 31;
    int _2877 = _2873;
    if (_2823)
    {
        int _2879 = ~_2837;
        int _2881 = _2879 + 1;
        _2877 = _2881;
    }
    int _2883 = _2877;
    bool _2885 = !_2849;
    int _2887 = _2885 ? 0 : (-1);
    bool _2889 = uint(_2847) >= uint(_2034);
    bool _2891 = uint(_2853) >= uint(_2034);
    int _2893 = _2875 & 3;
    bool _2895 = !_2891;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = _2763 + _2893;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2903 = _2787 != 3;
    float _2905 = _2395 * 6.283185482025146484375;
    float _2907 = cos(_2905);
    bool _2909 = !_2889;
    int _2911 = _2909 ? 0 : (-1);
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2917 = _2915 != 0;
    float _2919 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2921 = -_177;
    int _2923 = _2867 ? as_type<int>(_2921) : as_type<int>(_177);
    float _2925 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2927 = _2899 >> 2;
    float _2929 = _2757 * _2865;
    bool _2931 = !_2917;
    float _2933 = _2931 ? _177 : as_type<float>(_2923);
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2937 = _2927 << 4;
    int _2939 = _2937 + 512;
    float _2941 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2943 = !_2903;
    int _2945 = _2943 ? 0 : (-1);
    float _2947 = _2757 * _2907;
    int _2949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2951 = _2949 != 0;
    float _2953 = -_2929;
    float _2955 = fma(_2933, _2907, _2953);
    int _2957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2959 = _2957 != 0;
    float _2961 = _2935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2965 = _2963 != 0;
    float _2967 = _431 + (-0.5);
    uint _2969 = uint(int(uint(_2939) >> uint(2)));
    uint _2971 = uint(int(uint(int(_2969)) >> uint(2)));
    int _2973 = int(_2969) & 3;
    float _2975 = (*spvDescriptorSet0.vp_c9)._m0[int(_2971)][_2973];
    int _2977 = int(_2969) + 1;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    int _2981 = _2977 & 3;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[int(_2979)][_2981];
    float _2985 = fma(_2933, _2865, _2947);
    out.m_66.x = _2925;
    out.m_66.y = _2919;
    out.m_66.z = _2961;
    float _2987 = -_2967;
    float _2989 = -_983;
    float _2991 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[90].y, _2989);
    int _2993 = abs(_2817);
    int _2995 = abs(_2883);
    int _2997 = ~_2753;
    int _2999 = _2997 + _2897;
    int _3001 = _2999 + 1;
    int _3003 = ~_2765;
    int _3005 = _3003 + _2911;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2945);
    float _3011 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[90].x, _875);
    float _3013 = _2955 + 0.5;
    float _3015 = _2985 + (-0.5);
    float _3017 = -_975;
    float _3019 = _3017 + 1.0;
    int _3021 = _2034 * _3007;
    int _3023 = _3021 + _2493;
    float _3025 = fma(_3013, (*spvDescriptorSet0.vp_c9)._m0[80].x, _957);
    float _3027 = fma(_431, _1980, _2991);
    float _3029 = -_3015;
    float _3031 = -_949;
    float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3031);
    float _3035 = -_3019;
    float _3037 = fma(_439, _3035, _3011);
    int _3039 = _2939 + 8;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    uint _3043 = uint(int(uint(int(_3041)) >> uint(2)));
    int _3045 = int(_3041) & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    int _3049 = int(_3041) + 1;
    uint _3051 = uint(int(uint(_3049) >> uint(2)));
    int _3053 = _3049 & 3;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[int(_3051)][_3053];
    float _3057 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3059 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3061 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_68.x = _3037;
    out.m_68.y = _3027;
    float _3063 = -_1149;
    float _3065 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3057);
    float _3067 = -_1149;
    float _3069 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3059);
    float _3071 = -_1149;
    float _3073 = fma(_3071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3075 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3077 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    int _3079 = abs(_2861);
    float _3081 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3069);
    float _3083 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3073);
    float _3085 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3087 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3089 = ~_3009;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3097 = int(_3095);
    int _3099 = ~_2801;
    int _3101 = _3099 + _2887;
    int _3103 = _3101 + 1;
    float _3105 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3087);
    int _3107 = ~_3079;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    float _3113 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3075);
    float _3115 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3085);
    float _3117 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3105);
    float _3119 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    int _3121 = _3111 * as_type<int>(_2983);
    int _3123 = ~_2993;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _2034 * _3001;
    int _3131 = _3129 + _2557;
    float _3133 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    int _3135 = ~_2683;
    int _3137 = _3135 + _2797;
    int _3139 = _3137 + 1;
    float _3141 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3143 = _3127 * as_type<int>(_2975);
    int _3145 = _3143 + _3121;
    float _3147 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3149 = !_2959;
    int _3151 = _3149 ? 0 : 1;
    int _3153 = _1988 * _3103;
    int _3155 = _3153 + _2401;
    int _3157 = ~_2995;
    int _3159 = _3157 + 1;
    int _3161 = _3159 + 1;
    float _3163 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3141);
    bool _3165 = uint(_2711) >= 2u;
    float _3167 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3147);
    int _3169 = abs(_3151);
    int _3171 = _1966 * _3139;
    int _3173 = _3171 + _2301;
    int _3175 = _2689 >> 31;
    float _3177 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3163);
    int _3179 = _3165 ? 0 : 1;
    bool _3181 = _2711 != 3;
    int _3183 = _3161 * as_type<int>(_3047);
    int _3185 = _3183 + _3145;
    bool _3187 = !_2431;
    int _3189 = _3187 ? _3131 : (-1);
    int _3191 = ~_3169;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3093 * as_type<int>(_3055);
    int _3199 = _3197 + _3185;
    int _3201 = _3175 & 3;
    int _3203 = _3189 >> 31;
    int _3205 = _2689 + _3201;
    int _3207 = _3199 * _3195;
    int _3209 = _3203 & 3;
    int _3211 = _3205 >> 2;
    int _3213 = ~_3179;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3189 + _3209;
    int _3221 = _3217;
    if (_3181)
    {
        int _3223 = ~_3179;
        int _3225 = _3223 + 1;
        _3221 = _3225;
    }
    int _3227 = _3221;
    int _3229 = _3211 << 4;
    int _3231 = _3229 + 368;
    float _3233 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _3235 = float(uint(_3097));
    int _3237 = _3219 >> 2;
    uint _3239 = uint(int(uint(_3231) >> uint(2)));
    uint _3241 = uint(int(uint(int(_3239)) >> uint(2)));
    int _3243 = int(_3239) & 3;
    float _3245 = (*spvDescriptorSet0.vp_c9)._m0[int(_3241)][_3243];
    int _3247 = int(_3239) + 1;
    uint _3249 = uint(int(uint(_3247) >> uint(2)));
    int _3251 = _3247 & 3;
    float _3253 = (*spvDescriptorSet0.vp_c9)._m0[int(_3249)][_3251];
    int _3255 = abs(_3097);
    float _3257 = 1.0 / _3235;
    bool _3259 = !_2297;
    int _3261 = _3259 ? _3155 : (-1);
    bool _3263 = !_2713;
    int _3265 = _3263 ? 0 : 1;
    int _3267 = _3237 << 4;
    int _3269 = _3267 + 656;
    int _3271 = _3261 * _3169;
    int _3273 = _3271 + _3207;
    int _3275 = _3189 & 3;
    bool _3277 = _3275 != 0;
    float _3279 = float(uint(_3255));
    uint _3281 = uint(int(uint(_3269) >> uint(2)));
    uint _3283 = uint(int(uint(int(_3281)) >> uint(2)));
    int _3285 = int(_3281) & 3;
    float _3287 = (*spvDescriptorSet0.vp_c9)._m0[int(_3283)][_3285];
    int _3289 = int(_3281) + 1;
    uint _3291 = uint(int(uint(_3289) >> uint(2)));
    int _3293 = _3289 & 3;
    float _3295 = (*spvDescriptorSet0.vp_c9)._m0[int(_3291)][_3293];
    bool _3297 = uint(_3275) > 1u;
    float _3299 = _2759 * _3081;
    int _3301 = _3189 & 3;
    bool _3303 = _3301 != 0;
    float _3305 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3167);
    float _3307 = 1.0 / _3279;
    float _3309 = float(uint(_3273));
    float _3311 = _2759 * _3077;
    int _3313 = _3303 ? 0 : 1;
    out.m_70.x = _3233;
    out.m_70.y = _3177;
    out.m_70.z = _3305;
    bool _3315 = _2711 != 3;
    float _3317 = fma(_2941, _3233, _3311);
    int _3319 = as_type<int>(_3257) + (-2);
    float _3321 = fma(_2941, _3177, _3299);
    int _3323 = ~_3313;
    int _3325 = _3323 + 1;
    int _3327 = _3325 + 1;
    bool _3329 = !_3277;
    int _3331 = _3329 ? 0 : 1;
    float _3333 = as_type<float>(_3319) * _3309;
    int _3335 = _3327;
    if (!_3297)
    {
        int _3337 = ~_3313;
        int _3339 = _3337 + 1;
        _3335 = _3339;
    }
    int _3341 = _3335;
    bool _3343 = _3275 != 3;
    int _3345 = _3231 + 8;
    uint _3347 = uint(int(uint(_3345) >> uint(2)));
    uint _3349 = uint(int(uint(int(_3347)) >> uint(2)));
    int _3351 = int(_3347) & 3;
    float _3353 = (*spvDescriptorSet0.vp_c9)._m0[int(_3349)][_3351];
    int _3355 = int(_3347) + 1;
    uint _3357 = uint(int(uint(_3355) >> uint(2)));
    int _3359 = _3355 & 3;
    float _3361 = (*spvDescriptorSet0.vp_c9)._m0[int(_3357)][_3359];
    int _3363 = abs(_3273);
    float _3365 = trunc(_3333);
    float _3367 = precise::max(_3365, 0.0);
    uint _3369 = uint(_3367);
    bool _3371 = uint(_3275) >= 2u;
    int _3373 = as_type<int>(_3307) + (-2);
    int _3375 = _3371 ? 0 : 1;
    float _3377 = float(uint(_3363));
    int _3379 = abs(_2781);
    bool _3381 = _3275 != 3;
    float _3383 = as_type<float>(_3373) * _3377;
    int _3385 = ~_3375;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    int _3391 = _3389;
    if (_3343)
    {
        int _3393 = ~_3375;
        int _3395 = _3393 + 1;
        _3391 = _3395;
    }
    int _3397 = _3391;
    int _3399 = _3269 + 8;
    uint _3401 = uint(int(uint(_3399) >> uint(2)));
    uint _3403 = uint(int(uint(int(_3401)) >> uint(2)));
    int _3405 = int(_3401) & 3;
    float _3407 = (*spvDescriptorSet0.vp_c9)._m0[int(_3403)][_3405];
    int _3409 = int(_3401) + 1;
    uint _3411 = uint(int(uint(_3409) >> uint(2)));
    int _3413 = _3409 & 3;
    float _3415 = (*spvDescriptorSet0.vp_c9)._m0[int(_3411)][_3413];
    int _3417 = abs(_3341);
    float _3419 = trunc(_3383);
    float _3421 = precise::max(_3419, 0.0);
    uint _3423 = uint(_3421);
    float _3425 = fma(_2759, _2759, 1.0);
    int _3427 = abs(_3265);
    int _3429 = ~_3379;
    int _3431 = _3429 + 1;
    int _3433 = _3431 + 1;
    int _3435 = ~_3417;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    float _3441 = rsqrt(_3425);
    int _3443 = abs(_3227);
    int _3445 = _3433 * as_type<int>(_3253);
    int _3447 = _3439 * as_type<int>(_3295);
    int _3449 = abs(_3331);
    int _3451 = ~_3427;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = ~_3255;
    int _3459 = _3457 + 1;
    int _3461 = ~_3097;
    int _3463 = _3461 + 1;
    int _3465 = _3455 * as_type<int>(_3245);
    int _3467 = _3465 + _3445;
    int _3469 = ~_3449;
    int _3471 = _3469 + 1;
    int _3473 = _3471 + 1;
    float _3475 = _2759 * _3441;
    int _3477 = _3463 * int(_3369);
    int _3479 = _3477 + _3273;
    int _3481 = ~_3443;
    int _3483 = _3481 + 1;
    int _3485 = _3483 + 1;
    int _3487 = _3473 * as_type<int>(_3287);
    int _3489 = _3487 + _3447;
    float _3491 = -_3117;
    float _3493 = _3475 * _3491;
    int _3495 = _3459 * int(_3423);
    int _3497 = _3495 + _3363;
    bool _3499 = !_3381;
    int _3501 = _3499 ? 0 : (-1);
    int _3503 = _3485 * as_type<int>(_3353);
    int _3505 = _3503 + _3467;
    float _3507 = float(uint(_3479));
    float _3509 = fma(_3441, _3077, _3493);
    int _3511 = abs(_3397);
    float _3513 = -_3119;
    float _3515 = _3475 * _3513;
    float _3517 = float(uint(_3497));
    float _3519 = as_type<float>(_3319) * _3507;
    int _3521 = abs(_3501);
    float _3523 = fma(_3441, _3081, _3515);
    float _3525 = -_3133;
    float _3527 = _3475 * _3525;
    float _3529 = as_type<float>(_3373) * _3517;
    float _3531 = trunc(_3519);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    int _3537 = ~_3511;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    float _3543 = _2759 * _3083;
    float _3545 = fma(_3441, _3083, _3527);
    int _3547 = ~_3521;
    int _3549 = _3547 + 1;
    int _3551 = _3549 + 1;
    int _3553 = _3541 * as_type<int>(_3407);
    int _3555 = _3553 + _3489;
    float _3557 = fma(_2941, _3305, _3543);
    float _3559 = trunc(_3529);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    int _3565 = ~_3097;
    int _3567 = _3565 + 1;
    int _3569 = _3551 * as_type<int>(_3415);
    int _3571 = _3569 + _3555;
    bool _3573 = !_2951;
    int _3575 = _3573 ? 0 : 1;
    out.m_72.x = _3509;
    out.m_72.y = _3523;
    out.m_72.z = _3545;
    bool _3577 = !_2965;
    int _3579 = _3577 ? 0 : 1;
    float _3581 = _3117 + _3317;
    int _3583 = abs(_3575);
    float _3585 = _3133 + _3557;
    int _3587 = ~_3255;
    int _3589 = _3587 + 1;
    int _3591 = int(_3369) + int(_3535);
    bool _3593 = !_3315;
    int _3595 = _3593 ? 0 : (-1);
    int _3597 = abs(_3579);
    int _3599 = int(_3423) + int(_3563);
    int _3601 = _3567 * _3591;
    int _3603 = _3601 + _3273;
    int _3605 = abs(_3595);
    int _3607 = _3589 * _3599;
    int _3609 = _3607 + _3363;
    int _3611 = ~_3605;
    int _3613 = _3611 + 1;
    int _3615 = _3613 + 1;
    float _3617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3619 = uint(_3603) >= uint(_3097);
    int _3621 = ~_3597;
    int _3623 = _3621 + 1;
    int _3625 = _3623 + 1;
    int _3627 = _3615 * as_type<int>(_3361);
    int _3629 = _3627 + _3505;
    int _3631 = ~_3583;
    int _3633 = _3631 + 1;
    int _3635 = _3633 + 1;
    bool _3637 = uint(_3609) >= uint(_3255);
    int _3639 = _3571 * _3625;
    bool _3641 = !_3619;
    int _3643 = _3641 ? 0 : (-1);
    float _3645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3647 = _3273 ^ _3097;
    int _3649 = _3629 * _3635;
    int _3651 = ~_3591;
    int _3653 = _3651 + _3643;
    int _3655 = _3653 + 1;
    float _3657 = _3119 + _3321;
    bool _3659 = !_3637;
    int _3661 = _3659 ? 0 : (-1);
    float _3663 = _3617 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    uint _3665 = uint(int(uint(_3647) >> uint(31)));
    int _3667 = _3097 * _3655;
    int _3669 = _3667 + _3273;
    int _3671 = ~_3661;
    int _3673 = _3599 + _3671;
    int _3675 = _3673 + 1;
    float _3677 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2012);
    bool _3679 = _3097 == 0;
    out.m_74.x = _3581;
    out.m_74.y = _3657;
    out.m_74.z = _3585;
    int _3681 = ~int(_3665);
    int _3683 = _3681 + 1;
    bool _3685 = !_3679;
    int _3687 = _3685 ? _3669 : (-1);
    float _3689 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3691 = _3675 ^ _3683;
    bool _3693 = _3097 == 0;
    int _3695 = ~_3683;
    int _3697 = _3695 + _3691;
    int _3699 = _3697 + 1;
    out.gl_Position.x = _1907;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _3677;
    out.gl_Position.w = _1867;
    float _3701 = float(_3687);
    bool _3703 = !_2243;
    int _3705 = _3703 ? _3173 : (-1);
    bool _3707 = !_2431;
    int _3709 = _3707 ? _3023 : (-1);
    float _3711 = fma(_3689, _3701, _963);
    bool _3713 = !_3693;
    int _3715 = _3713 ? _3699 : (-1);
    int _3717 = _3705 * _3583;
    int _3719 = _3717 + _3649;
    bool _3721 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3723 = isnan(_1645);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3729 = _3725 || _3727;
    int _3731 = _3709 * _3597;
    int _3733 = _3731 + _3639;
    float _3735 = float(_3715);
    float _3737 = _3677 + _1867;
    float _3739 = _2805 + 0.5;
    float _3741 = -_877;
    float _3743 = _3741 + 1.0;
    float _3745 = -_981;
    float _3747 = fma(_3663, _3735, _3745);
    float _3749 = _1255 + (-0.5);
    float _3751 = fma(_3689, _3739, _3711);
    float _3753 = _3737 * 0.5;
    float _3755 = -_959;
    float _3757 = _3755 + 1.0;
    float _3759 = -_3663;
    float _3761 = fma(_3759, _3749, _3747);
    float _3763 = -_3743;
    float _3765 = fma(_2805, _3763, _3751);
    float _3767 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3769 = -_979;
    float _3771 = _3769 + 1.0;
    float _3773 = float(_3733);
    float _3775 = -_2000;
    float _3777 = fma(_2955, _3775, _3025);
    float _3779 = _3767 * _1941;
    float _3781 = fma(_1255, _3771, _3761);
    float _3783 = -_3767;
    float _3785 = _3783 + 1.0;
    out.m_76.z = _3773;
    float _3787 = _1952 * _3779;
    float _3789 = _1962 * _3779;
    float _3791 = _1952 * _3785;
    float _3793 = float(_3719);
    float _3795 = fma(_1958, _3787, _1946);
    float _3797 = fma(_1960, _3787, _1948);
    float _3799 = fma(_1952, _3789, _1950);
    float _3801 = fma(_2985, _3757, _3033);
    out.m_76.x = _3793;
    out.m_78.x = _3795;
    out.m_78.y = _3797;
    out.m_78.z = _3799;
    out.m_78.w = _3791;
    float _3803 = _1557 * _1619;
    out.m_80.z = _3753;
    out.m_80.w = _1867;
    float _3805 = _3803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _3777;
    out.m_82.y = _3801;
    out.m_82.z = _3765;
    out.m_82.w = _3781;
    float _3807 = _3803;
    float _3809 = _3753;
    float _3811 = _3781;
    float _3813 = _3765;
    float _3815 = _3801;
    float _3817 = _3777;
    if (!_3729)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3819 = _3807;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3729)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3825 = _3809;
    float _3827 = _3825;
    float _3829 = _3825;
    if (!_3729)
    {
        _3811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3831 = _3811;
    float _3833 = _3831;
    float _3835 = _3831;
    if (!_3729)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3837 = _3813;
    float _3839 = _3837;
    float _3841 = _3837;
    if (!_3729)
    {
        _3815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3843 = _3815;
    float _3845 = _3843;
    float _3847 = _3843;
    if (!_3729)
    {
        _3817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3849 = _3817;
    bool _3851 = !_3729;
    float _3853 = _3849;
    float _3855 = _3849;
    if (!_3851)
    {
        bool _3857 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3859 = isnan(_1645);
        bool _3861 = _3857 || _3859;
        bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3865 = _3861 || _3863;
        if (!_3865)
        {
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = _1645 + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3873 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3871;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3879 = 1.0 / _3873;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3897 = _3869 * _3879;
            float _3899 = precise::clamp(_3897, 0.0, 1.0);
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3905 = fma(_3899, _3877, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3907 = fma(_3899, _3903, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3909 = fma(_3899, _3883, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3911 = fma(_3899, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3913 = fma(_3899, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3915 = fma(_3899, _3895, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3835 = _3909;
            _3855 = _3913;
            _3829 = _3905;
            _3847 = _3911;
            _3841 = _3907;
            _3823 = _3915;
            _3917 = true;
        }
        else
        {
            bool _3919 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3921 = isnan(_1645);
            bool _3923 = _3919 || _3921;
            bool _3925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3927 = _3923 || _3925;
            if (!_3927)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3929 = _3827;
            _3829 = _3929;
            if (!_3927)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3931 = _3833;
            _3835 = _3931;
            if (!_3927)
            {
                _3839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3933 = _3839;
            _3841 = _3933;
            if (!_3927)
            {
                _3845 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3935 = _3845;
            _3847 = _3935;
            if (!_3927)
            {
                _3853 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3937 = _3853;
            _3855 = _3937;
            if (!_3927)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3939 = _3821;
            bool _3941 = !_3927;
            _3823 = _3939;
            if (!_3941)
            {
                bool _3943 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3945 = isnan(_1645);
                bool _3947 = _3943 || _3945;
                bool _3949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3951 = _3947 || _3949;
                if (!_3951)
                {
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = _1645 + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3959 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3957;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3965 = 1.0 / _3959;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3983 = _3955 * _3965;
                    float _3985 = precise::clamp(_3983, 0.0, 1.0);
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3991 = fma(_3985, _3963, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3993 = fma(_3985, _3989, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3995 = fma(_3985, _3969, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3997 = fma(_3985, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3999 = fma(_3985, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4001 = fma(_3985, _3981, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3835 = _3995;
                    _3855 = _3999;
                    _3829 = _3991;
                    _3847 = _3997;
                    _3841 = _3993;
                    _3823 = _4001;
                    _3917 = true;
                }
                else
                {
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3855 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3847 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3917 = false;
    float _4003 = _3835;
    float _4005 = _3855;
    float _4007 = _3829;
    float _4009 = _3847;
    float _4011 = _3841;
    float _4013 = _3823;
    float _4015 = fma(_3657, -0.5, 0.5);
    float _4017 = precise::clamp(_4015, 0.0, 1.0);
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = _3805 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4025 = -_4007;
    float _4027 = _4025 + _4009;
    float _4029 = fma(_4017, _4021, _4003);
    out.m_84.x = 0.0;
    float _4031 = -_4011;
    float _4033 = _4031 + _4013;
    float _4035 = fma(_4017, _4027, _4007);
    float _4037 = _4029 * 0.586610972881317138671875;
    out.m_47.x = _4023;
    bool _4039 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4041 = fma(_4017, _4033, _4011);
    float _4043 = fma(_4035, 0.298911988735198974609375, _4037);
    bool _4045 = _1557 > 0.0;
    bool _4047 = isnan(_1557);
    bool _4049 = _4045 || _4047;
    bool _4051 = isnan(0.0);
    bool _4053 = _4049 || _4051;
    float _4055 = fma(_4041, 0.114477999508380889892578125, _4043);
    bool _4057 = _1619 <= 0.0;
    bool _4059 = !_4053;
    bool _4061 = _4057 || _4059;
    float _4063 = -_4055;
    float _4065 = _4035 + _4063;
    float _4067 = -_4055;
    float _4069 = _4029 + _4067;
    float _4071 = -_4055;
    float _4073 = _4041 + _4071;
    float _4075 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    float _4077 = fma(_4069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    float _4079 = fma(_4073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    bool _4081 = !_4039;
    if (!_4081)
    {
        float _4083 = -_1485;
        float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4087 = -_1487;
        float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4091 = -_1489;
        float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4095 = _4085 * _4085;
        float _4097 = fma(_4089, _4089, _4095);
        float _4099 = fma(_4093, _4093, _4097);
        float _4101 = sqrt(_4099);
        float _4103 = rsqrt(_4099);
        float _4105 = -_4101;
        float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4109 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4111 = precise::clamp(_4109, 0.0, 1.0);
        float _4113 = _4089 * _4103;
        float _4115 = _4085 * _4103;
        float _4117 = abs(_4111);
        float _4119 = log2(_4117);
        float _4121 = _4093 * _4103;
        float _4123 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4125 = _3657 * _4115;
        float _4127 = -_4115;
        float _4129 = -_4123;
        float _4131 = fma(_4127, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4129);
        float _4133 = fma(_3581, _4113, _4125);
        float _4135 = -_4121;
        float _4137 = fma(_4135, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4131);
        float _4139 = fma(_3585, _4121, _4133);
        float _4141 = precise::clamp(_4139, 0.0, 1.0);
        float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4145 = _4137 + _4143;
        float _4147 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4149 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4151 = precise::clamp(_4149, 0.0, 1.0);
        float _4153 = exp2(_4147);
        float _4155 = _4153 * _4151;
        float _4157 = _4141 * _4155;
        float _4159 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4163 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _4159;
        out.m_84.y = _4161;
        out.m_84.z = _4163;
    }
    out.m_86.x = _4075;
    out.m_86.y = _4077;
    out.m_86.z = _4079;
    if (!_4061)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4165;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3917 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4224 = as_type<float>(_123);
        out.gl_Position.z = _4224;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_105);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4294 = as_type<float>(_161);
        out.gl_Position.z = _4294;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_105);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = in.m_54.x;
    float _215 = in.m_54.y;
    float _217 = in.m_54.z;
    float _219 = in.m_54.w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _211 + _225;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = 1.0 / _235;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _251 = 0.0;
    if (_231)
    {
        float _253 = in.m_54.x;
        _251 = _253;
    }
    float _255 = _251;
    float _257 = 0.0;
    if (_231)
    {
        _257 = 1.0;
    }
    float _259 = _257;
    float _261 = 1.0 / _245;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = _211 + _263;
    float _267 = 0.0;
    int _269 = as_type<int>(_265);
    float _271 = _259;
    if (_231)
    {
        _267 = 1.0;
    }
    float _273 = _267;
    float _275 = _213 * 2.0;
    float _277 = _215 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _279 = _213 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _281 = _215 > 0.5;
    float _283 = 1.0 / _239;
    bool _285 = _217 > 0.5;
    float _287 = fma(_277, -2.0, _247);
    float _289 = _265 * _241;
    float _291 = -_249;
    float _293 = fma(_279, 2.0, _291);
    int _295 = as_type<int>(_241);
    float _297 = _273;
    if (_231)
    {
        _269 = 0;
    }
    int _299 = _269;
    float _301 = floor(_275);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _307 = int(_231);
    int _309 = _285 ? 2 : 0;
    int _311 = _307 | _309;
    int _313 = _281 ? 4 : 0;
    int _315 = _311 | _313;
    int _317 = false ? 8 : 0;
    int _319 = _315 | _317;
    int _321 = false ? 16 : 0;
    int _323 = _319 | _321;
    int _325 = false ? 32 : 0;
    int _327 = _323 | _325;
    int _329 = false ? 64 : 0;
    int _331 = _327 | _329;
    int _333 = _331 & 4;
    int _335 = _299;
    if (_231)
    {
        _295 = 0;
    }
    int _337 = _295;
    int _339 = int(_231);
    int _341 = _285 ? 2 : 0;
    int _343 = _339 | _341;
    int _345 = _281 ? 4 : 0;
    int _347 = _343 | _345;
    int _349 = false ? 8 : 0;
    int _351 = _347 | _349;
    int _353 = false ? 16 : 0;
    int _355 = _351 | _353;
    int _357 = false ? 32 : 0;
    int _359 = _355 | _357;
    int _361 = false ? 64 : 0;
    int _363 = _359 | _361;
    int _365 = _363 & 2;
    float _367 = 0.0;
    int _369 = _337;
    if (_231)
    {
        _367 = 1.0;
    }
    float _371 = _367;
    float _373 = 0.0;
    float _375 = _371;
    float _377 = _255;
    if (_231)
    {
        _373 = _255;
    }
    float _379 = _373;
    float _381 = _379;
    if (!_231)
    {
        float _383 = in.m_54.y;
        float _385 = in.m_54.z;
        _335 = 1;
        _369 = 2;
        _375 = 5.839270114898681640625;
        _381 = _385;
        _377 = _383;
        _297 = 1.2345600128173828125;
        _271 = 7.345489978790283203125;
    }
    int _387 = _335;
    int _389 = _369;
    float _391 = _375;
    float _393 = _381;
    float _395 = _377;
    float _397 = _297;
    float _399 = _271;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _411 = _409 != 0;
    float _413 = 1.0 / _305;
    float _415 = -_181;
    int _417 = _285 ? as_type<int>(_415) : as_type<int>(_181);
    float _419 = _223 * _283;
    float _421 = -_177;
    int _423 = _281 ? as_type<int>(_421) : as_type<int>(_177);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _427 = _211 + _425;
    bool _429 = !_411;
    float _431 = _429 ? _181 : as_type<float>(_417);
    float _433 = _215 * 2.0;
    float _435 = _227 * _261;
    bool _437 = !_407;
    float _439 = _437 ? _177 : as_type<float>(_423);
    float _441 = _213 + _217;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _453 = _451 != 0;
    float _455 = floor(_433);
    bool _457 = _301 > 0.0;
    float _459 = _441 + (-1.0);
    bool _461 = _301 >= 0.0;
    bool _463 = isnan(_301);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _427 * _413;
    bool _473 = _387 != 1;
    float _475 = _213 + _215;
    int _477 = _469 ? 0 : 1;
    float _479 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _481 = int(_479);
    float _483 = _475 + (-1.0);
    int _485 = ~_477;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    bool _491 = !_449;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _497 = _489;
    float _499 = _459;
    if (!_457)
    {
        int _501 = ~_477;
        int _503 = _501 + 1;
        _497 = _503;
    }
    int _505 = _497;
    float _507 = _215 + _217;
    bool _509 = _455 > 0.0;
    bool _511 = _455 >= 0.0;
    bool _513 = isnan(_455);
    bool _515 = _511 || _513;
    bool _517 = isnan(0.0);
    bool _519 = _515 || _517;
    float _521 = _217 * 2.0;
    float _523 = _507 + (-1.0);
    int _525 = _519 ? 0 : 1;
    float _527 = floor(_521);
    bool _529 = !_445;
    int _531 = _529 ? 0 : 1;
    float _533 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _535 = !_453;
    int _537 = _535 ? 0 : 1;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _549 = _547 != 0;
    float _551 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _553 = 0.0;
    float _555 = _507;
    if (!_473)
    {
        _553 = _215;
    }
    float _557 = _553;
    int _559 = ~_525;
    int _561 = _559 + 1;
    int _563 = _561 + 1;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    int _569 = _563;
    float _571 = _557;
    if (!_509)
    {
        int _573 = ~_525;
        int _575 = _573 + 1;
        _569 = _575;
    }
    int _577 = _569;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    bool _583 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _585 = isnan(_211);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_567, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    if (!_473)
    {
        _555 = _217;
    }
    float _597 = _555;
    float _599 = fma(_581, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _601 = _597;
    float _603 = _599;
    if (!_473)
    {
        _499 = _557;
    }
    float _605 = _499;
    float _607 = -_593;
    float _609 = _607 + 1.0;
    float _611 = 0.0;
    float _613 = _605;
    if (!_473)
    {
        _611 = _217;
    }
    float _615 = _611;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _621 = !_545;
    int _623 = _621 ? 0 : 1;
    bool _625 = !_541;
    int _627 = _625 ? 0 : 1;
    bool _629 = !_549;
    int _631 = _629 ? 0 : 1;
    float _633 = _615;
    if (_473)
    {
        _613 = _213;
    }
    float _635 = _613;
    if (_473)
    {
        _571 = _213;
    }
    float _637 = _571;
    if (_473)
    {
        _601 = _215;
    }
    float _639 = _601;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_473)
    {
        _633 = _215;
    }
    float _643 = _633;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _655 = _653 != 0;
    bool _657 = _527 > 0.0;
    bool _659 = _527 >= 0.0;
    bool _661 = isnan(_527);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    bool _669 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_211);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    int _681 = _667 ? 0 : 1;
    float _683 = _679 * _609;
    bool _685 = _389 != 2;
    float _687 = -_679;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _691;
    bool _695 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _697 = isnan(_211);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _711 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _713 = isnan(_211);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _723;
    bool _727 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _729 = isnan(_211);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -_705;
    float _741 = _739 + 1.0;
    float _743 = _705 * _689;
    float _745 = -_721;
    float _747 = _745 + 1.0;
    float _749 = fma(_693, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _751 = fma(_725, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _753 = _721 * _741;
    int _755 = ~_681;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _737 * _747;
    int _763 = _759;
    if (!_657)
    {
        int _765 = ~_681;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _777 = log2(_775);
    float _779 = _599 * _761;
    if (_685)
    {
        _603 = _213;
    }
    float _781 = _603;
    float _783 = fma(_773, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _785 = fma(_619, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _787 = _595 * _761;
    float _789 = _781;
    if (!_685)
    {
        _789 = _217;
    }
    float _791 = _789;
    float _793 = -_737;
    float _795 = _793 + 1.0;
    float _797 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _799 = int(_797);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _805 = _791 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _807 = !_647;
    int _809 = _807 ? 0 : 1;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _815 = int(_813);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _819 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[83].z, _811);
    float _821 = float(_105);
    float _823 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].w, _817);
    if (_685)
    {
        _113 = _215;
    }
    float _825 = _113;
    float _827 = _777 * _141;
    int _829 = abs(_809);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _835 = _825;
    if (!_685)
    {
        _835 = _213;
    }
    float _837 = _835;
    float _839 = _639 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _841 = -_831;
    float _843 = fma(_805, 2.0, _841);
    float _845 = fma(_839, -2.0, _833);
    float _847 = float(_829);
    float _849 = _837 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _851 = float(_799);
    float _853 = exp2(_827);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _857 = float(_481);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _861 = float(_769);
    float _863 = -_855;
    float _865 = fma(_641, 2.0, _863);
    float _867 = float(_815);
    float _869 = 1.0 / _851;
    float _871 = fma(_849, -2.0, _859);
    float _873 = -_141;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[86].x, _843);
    float _877 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _819);
    float _879 = 1.0 / _821;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _887 = 1.0 + _885;
    float _889 = -_853;
    float _891 = _889 + 1.0;
    bool _893 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _895 = isnan(1.0);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _901 = _897 || _899;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _905 = 1.0 / _857;
    bool _907 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _915 = _911 || _913;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _921 = !_651;
    int _923 = _921 ? 0 : 1;
    float _925 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _927 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[79].z, _903);
    float _929 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[78].z, _917);
    float _931 = 1.0 / _867;
    float _933 = _847 * _861;
    float _935 = _879 * _141;
    float _937 = in.m_56.x;
    float _939 = in.m_56.y;
    float _941 = in.m_56.z;
    float _943 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[88].z, _919);
    float _945 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[88].w, _883);
    float _947 = _915 ? _891 : 0.0;
    float _949 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _287);
    float _951 = 1.0 / _887;
    int _953 = abs(_923);
    float _955 = -_141;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    float _959 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _925);
    float _961 = -_141;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[81].x, _865);
    float _965 = _905 * _141;
    float _967 = _869 * _141;
    float _969 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[79].x, _927);
    float _971 = _931 * _141;
    float _973 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _929);
    float _975 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _943);
    float _977 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _945);
    float _979 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    float _981 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _845);
    float _983 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _871);
    float _985 = _933 * (-2.0);
    if (_901)
    {
        float _987 = _947 * _951;
        _143 = _987;
    }
    float _989 = _143;
    float _991 = _215 + (-0.5);
    float _993 = float(_505);
    float _995 = fma(_985, _937, _937);
    bool _997 = !_655;
    int _999 = _997 ? 0 : 1;
    float _1001 = fma(_495, _985, _495);
    float _1003 = float(_953);
    float _1005 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    int _1007 = abs(_999);
    float _1009 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[143].y, _779);
    float _1011 = _213 + (-0.5);
    float _1013 = _1003 * _993;
    float _1015 = _217 + (-0.5);
    float _1017 = float(_577);
    float _1019 = _1013 * (-2.0);
    float _1021 = float(_1007);
    float _1023 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].x, _995);
    float _1025 = fma(_783, _753, _1005);
    float _1027 = fma(_1019, _939, _939);
    float _1029 = fma(_551, _1019, _551);
    float _1031 = _1021 * _1017;
    float _1033 = fma(_785, _753, _1009);
    float _1035 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1027);
    float _1037 = in.m_58.x;
    float _1039 = in.m_58.y;
    float _1041 = _1031 * (-2.0);
    float _1043 = fma(_1001, _989, _1023);
    float _1045 = fma(_1029, _989, _1035);
    float _1047 = fma(_709, _471, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1049 = fma(_1041, _941, _941);
    float _1051 = fma(_533, _1041, _533);
    float _1053 = in.m_44.x;
    float _1055 = in.m_44.y;
    float _1057 = in.m_44.z;
    float _1059 = fma(_749, _743, _1025);
    float _1061 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1049);
    float _1063 = fma(_803, _471, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1065 = fma(_751, _743, _1033);
    float _1067 = _1043 * 0.15915493667125701904296875;
    float _1069 = fma(_1051, _989, _1061);
    float _1071 = _1045 * 0.15915493667125701904296875;
    float _1073 = fma(_1047, _683, _1059);
    float _1075 = fma(_1063, _683, _1065);
    float _1077 = _1069 * 0.15915493667125701904296875;
    float _1079 = _1067 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1073);
    float _1085 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1075);
    bool _1087 = _219 > 0.5;
    float _1089 = _1083 * _1037;
    float _1091 = _1085 * _1039;
    float _1093 = _1067 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1101 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1103 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1105 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1113 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1101);
    float _1115 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1103);
    float _1117 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1119 = _1111 * _1097;
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1123 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1115);
    float _1125 = _1071 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1113);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1135 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1077 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    float _1141 = _1095 * _1109;
    float _1143 = _1081 * _1109;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1147 = _1077 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = _1081 * _1127;
    float _1153 = _1095 * _1127;
    float _1155 = _1127 * _1139;
    float _1157 = _1095 * _1139;
    float _1159 = _1099 * _1121;
    float _1161 = _1081 * _1139;
    float _1163 = _1109 * _1139;
    float _1165 = _1157 * _1159;
    float _1167 = fma(_1149, _1153, _1143);
    float _1169 = -_1141;
    float _1171 = fma(_1149, _1151, _1169);
    float _1173 = -_1151;
    float _1175 = fma(_1149, _1141, _1173);
    float _1177 = fma(_1149, _1143, _1153);
    float _1179 = -_1159;
    float _1181 = _1149 * _1179;
    float _1183 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1185 = fma(_1167, _1119, _1165);
    float _1187 = _1161 * _1159;
    float _1189 = fma(_1155, _1119, _1181);
    float _1191 = fma(_1175, _1183, _1185);
    float _1193 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1117);
    float _1195 = fma(_1171, _1119, _1187);
    float _1197 = fma(_1163, _1183, _1189);
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1203 = fma(_1177, _1183, _1195);
    float _1205 = _1193 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1207 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1199);
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1201);
    float _1211 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1213 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1145);
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1209);
    float _1219 = _1213 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1221 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1227 = 1.0 / _1219;
    float _1229 = _1205 + _1221;
    float _1231 = _1133 + _1223;
    float _1233 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1225);
    float _1235 = -_181;
    float _1237 = _1087 ? _1235 : _181;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1241 = _1229 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1245 = _1231 + _1243;
    float _1247 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1233);
    float _1249 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1211);
    float _1251 = _1241 * _1241;
    bool _1253 = !_403;
    float _1255 = _1253 ? _181 : _1237;
    float _1257 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1261 = _1259 != 0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1265 = _1263 != 0;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1273 = _1271 != 0;
    float _1275 = fma(_1245, _1245, _1251);
    float _1277 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1279 = _1257 + _1219;
    float _1281 = sqrt(_1275);
    float _1283 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1285 = _1279 * _1227;
    float _1287 = _1285 * 0.5;
    bool _1289 = !_1265;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = _1131 + _1283;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1295);
    bool _1299 = !_1261;
    int _1301 = _1299 ? 0 : 1;
    bool _1303 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1305 = isnan(0.5);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1311 = _1307 || _1309;
    bool _1313 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1315 = isnan(0.5);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1321 = _1317 || _1319;
    float _1323 = 1.0 / _1297;
    bool _1325 = !_1269;
    int _1327 = _1325 ? 0 : 1;
    bool _1329 = !_1273;
    int _1331 = _1329 ? 0 : 1;
    bool _1333 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1337 = _1237;
    float _1339 = _1283;
    float _1341 = _1287;
    float _1343 = _1281;
    float _1345 = _1227;
    float _1347 = _1245;
    float _1349 = _1241;
    float _1351 = _1089;
    float _1353 = _1071;
    if (!_1333)
    {
        _1335 = _1231;
    }
    float _1355 = _1335;
    float _1357 = _1355;
    if (!_1333)
    {
        _1337 = _1229;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (!_1333)
    {
        _1339 = _1293;
    }
    float _1363 = _1339;
    bool _1365 = !_1333;
    float _1367 = _1363;
    if (!_1365)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1373 = _1281 + _1371;
        float _1375 = rsqrt(_1275);
        float _1377 = _1373 * _1369;
        float _1379 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = _1377 * 0.15915493667125701904296875;
        float _1383 = _1381 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = _1381 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1385 + (-1.0);
        float _1393 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1395 = fma(_1389, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1397 = fma(_1293, _1385, _1393);
        float _1399 = _1375 * _1395;
        float _1401 = fma(_1245, _1399, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1403 = fma(_1241, _1399, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1357 = _1401;
        _1367 = _1397;
        _1341 = _1393;
        _1361 = _1403;
        _1343 = _1399;
    }
    float _1405 = _1357;
    float _1407 = _1367;
    float _1409 = _1341;
    float _1411 = _1361;
    float _1413 = _1343;
    float _1415 = _1413;
    float _1417 = _1411;
    float _1419 = _1409;
    if (_1321)
    {
        _1345 = 1.0;
    }
    float _1421 = _1345;
    float _1423 = _1421;
    if (_1311)
    {
        _1347 = _1405;
    }
    float _1425 = _1347;
    float _1427 = _1425;
    if (_1311)
    {
        _1349 = _1407;
    }
    float _1429 = _1349;
    float _1431 = _1429;
    if (!_1311)
    {
        float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1435 = _1131 + _1433;
        float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1439 = _1133 + _1437;
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1443 = -_1131;
        float _1445 = _1443 + _1407;
        float _1447 = _1435 * _1435;
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1451 = _1205 + _1449;
        float _1453 = fma(_1439, _1439, _1447);
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1457 = fma(_1451, _1451, _1453);
        float _1459 = sqrt(_1457);
        float _1461 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1463 = precise::min(_1459, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1465 = _1463 * _1455;
        float _1467 = -_1133;
        float _1469 = _1467 + _1405;
        float _1471 = _1461 * _1465;
        float _1473 = -_1205;
        float _1475 = _1473 + _1411;
        float _1477 = fma(_1469, _1471, _1133);
        float _1479 = fma(_1475, _1471, _1205);
        float _1481 = fma(_1445, _1471, _1131);
        _1415 = _1475;
        _1431 = _1481;
        _1427 = _1477;
        _1417 = _1479;
        _1419 = _1441;
    }
    float _1483 = _1415;
    float _1485 = _1431;
    float _1487 = _1427;
    float _1489 = _1417;
    float _1491 = _1419;
    float _1493 = _1491;
    float _1495 = _1483;
    if (_1321)
    {
        _1351 = 1.0;
    }
    float _1497 = _1351;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1501 = _1323 * _1499;
    float _1503 = _1497;
    if (!_1321)
    {
        float _1505 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = _1509 * 0.15915493667125701904296875;
        float _1517 = _1507 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = 1.0 / _1513;
        float _1523 = _1515 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = _1515 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = _1525 * _1527;
        float _1535 = 1.0 / _1533;
        float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1539 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1537;
        float _1541 = 1.0 / _1539;
        float _1543 = _1531 * _1535;
        float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1547 = fma(_1501, _1543, _1545);
        float _1549 = _1547 * _1541;
        float _1551 = precise::clamp(_1549, 0.0, 1.0);
        _1493 = _1541;
        _1495 = _1521;
        _1423 = _1551;
    }
    float _1553 = _1493;
    float _1555 = _1495;
    float _1557 = _1423;
    float _1559 = _1553;
    float _1561 = _1555;
    if (!_1321)
    {
        float _1563 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1565 = _1563 * 0.15915493667125701904296875;
        float _1567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1569 = _1565 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1567 * 0.15915493667125701904296875;
        float _1575 = _1565 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        float _1579 = 1.0 / _1571;
        float _1581 = _1573 * 6.283185482025146484375;
        float _1583 = cos(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = _1573 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = _1583 * _1585;
        float _1593 = 1.0 / _1591;
        float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1597 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1595;
        float _1599 = 1.0 / _1597;
        float _1601 = _1589 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1605 = fma(_1501, _1601, _1603);
        float _1607 = _1605 * _1599;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        float _1611 = -_1609;
        float _1613 = _1611 + 1.0;
        _1559 = _1577;
        _1561 = _1589;
        _1503 = _1613;
    }
    float _1615 = _1559;
    float _1617 = _1561;
    float _1619 = _1503;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1485 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1487 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1489 + _1629;
    float _1633 = _1623 * _1623;
    bool _1635 = _333 != 0;
    bool _1637 = _365 != 0;
    float _1639 = fma(_1627, _1627, _1633);
    float _1641 = fma(_1631, _1631, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1627 * _1647;
    float _1651 = _1631 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1643;
    float _1669 = _1665;
    float _1671 = _1615;
    float _1673 = _1623;
    float _1675 = _1647;
    if (_1661)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1677;
    }
    float _1679 = _1667;
    float _1681 = _1679;
    if (_1661)
    {
        float _1683 = _1665 * _1679;
        _1669 = _1683;
    }
    float _1685 = _1669;
    if (_1661)
    {
        float _1687 = rsqrt(_1657);
        _1681 = _1687;
    }
    float _1689 = _1681;
    float _1691 = _1689;
    if (_1661)
    {
        float _1693 = _1685 * 0.15915493667125701904296875;
        _1671 = _1693;
    }
    float _1695 = _1671;
    float _1697 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1699 = _1631;
    if (_1661)
    {
        float _1701 = _1695 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        _1699 = _1703;
    }
    float _1705 = _1699;
    float _1707 = precise::max(0.0, _1697);
    float _1709 = _1617;
    float _1711 = _1707;
    if (_1661)
    {
        float _1713 = _1695 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -_1647;
    float _1721 = -_1707;
    float _1723 = fma(_1623, _1719, _1721);
    if (_1661)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1673 = _1725;
    }
    float _1727 = _1673;
    float _1729 = _1705;
    float _1731 = _1727;
    if (_1661)
    {
        float _1733 = fma(_1705, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1711 = _1733;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    if (!_1661)
    {
        _1729 = _1649;
    }
    float _1739 = _1729;
    float _1741 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1743 = _1739;
    if (_1661)
    {
        float _1745 = _1689 * _1735;
        _1353 = _1745;
    }
    float _1747 = _1353;
    if (!_1661)
    {
        _1737 = _1723;
    }
    float _1749 = _1737;
    float _1751 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1741);
    float _1753 = _1749;
    float _1755 = _1717;
    if (_1661)
    {
        float _1757 = _1717 + (-1.0);
        _1731 = _1757;
    }
    float _1759 = _1731;
    float _1761 = _1759;
    if (_1661)
    {
        float _1763 = _1649 * _1747;
        _1743 = _1763;
    }
    float _1765 = _1743;
    if (!_1661)
    {
        _1691 = _1651;
    }
    float _1767 = _1691;
    float _1769 = _1767;
    if (_1661)
    {
        float _1771 = _1651 * _1747;
        _1769 = _1771;
    }
    float _1773 = _1769;
    if (_1661)
    {
        float _1775 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1775;
    }
    float _1777 = _1675;
    if (!_1661)
    {
        _1761 = _1653;
    }
    float _1779 = _1761;
    float _1781 = _1779;
    if (_1661)
    {
        float _1783 = _1765 * _1765;
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1661)
    {
        float _1789 = fma(_1723, _1717, _1777);
        _1753 = _1789;
    }
    float _1791 = _1753;
    if (!_1661)
    {
        _1755 = _1655;
    }
    float _1793 = _1755;
    float _1795 = _1793;
    if (_1661)
    {
        float _1797 = _1773 * _1773;
        _1795 = _1797;
    }
    float _1799 = _1795;
    float _1801 = fma(_1791, _1791, _1785);
    float _1803 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1805 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1807 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = _1801 + _1799;
    float _1811 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1813 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1751);
    float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1817 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1815);
    float _1819 = precise::clamp(_1817, 0.0, 1.0);
    float _1821 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1823 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1811);
    float _1825 = rsqrt(_1809);
    float _1827 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1819;
    float _1831 = _1829 + 1.0;
    float _1833 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1823);
    float _1835 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1839 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1841 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = abs(_1831);
    float _1845 = log2(_1843);
    float _1847 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1849 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1851 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1837);
    float _1853 = -_1847;
    float _1855 = fma(_1853, _1803, 1.0);
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1861 = _1825 * _1765;
    float _1863 = _1825 * _1791;
    float _1865 = _1825 * _1773;
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1859);
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1871 = log2(_1855);
    float _1873 = -_1869;
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1873);
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1879 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1881 = -_1865;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1875);
    float _1885 = 1.0 / _1867;
    float _1887 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1889 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1879);
    float _1891 = fma(_1883, -0.5, 0.5);
    float _1893 = fma(_1883, 0.5, 0.5);
    float _1895 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1887);
    float _1897 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1889);
    float _1899 = _1863 + 1.0;
    float _1901 = exp2(_1877);
    float _1903 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1895);
    float _1905 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1907 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1903);
    float _1909 = fma(_1893, _1905, -0.212114393711090087890625);
    float _1911 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1897);
    float _1913 = sqrt(_1891);
    float _1915 = fma(_1893, _1909, 1.570728778839111328125);
    float _1917 = _1911 * _1885;
    float _1919 = -_1863;
    float _1921 = fma(_1901, _1899, _1919);
    float _1923 = _1871 * 0.693147182464599609375;
    float _1925 = _1907 * _1885;
    float _1927 = fma(_1921, 0.5, 0.5);
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1931 = fma(_1925, 0.5, 0.5);
    float _1933 = fma(_1917, -0.5, 0.5);
    float _1935 = _1913 * 0.636619746685028076171875;
    float _1937 = -_1915;
    float _1939 = fma(_1935, _1937, 1.0);
    float3 _7006 = float3(_1931, _1933, _1929);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7006, float3(0.0), isnan(_7006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7006, float3(0.0), isnan(_7006)), level(0.0)).x;
    float3 _7017 = float3(_1931, _1933, _1929);
    float4 _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7017, float3(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7017, float3(0.0), isnan(_7017)), level(0.0)).xyzw;
    float _1946 = _1944.x;
    float _1948 = _1944.y;
    float _1950 = _1944.z;
    float _1952 = _1944.w;
    float2 _7034 = float2(_1939, _1927);
    float3 _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _1958 = _1956.x;
    float _1960 = _1956.y;
    float _1962 = _1956.z;
    float _1964 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1966 = int(_1964);
    float _1968 = _391 * _393;
    float _1970 = _395 * _397;
    float _1972 = _399 * _213;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1976 = _1974 != 0;
    float _1978 = -_977;
    float _1980 = _1978 + 1.0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1984 = _1982 != 0;
    out.m_60.y = _1099;
    float _1986 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1988 = int(_1986);
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1992 = _1990 != 0;
    float _1994 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.y = _1131;
    float _1996 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1998 = -_973;
    float _2000 = _1998 + 1.0;
    float _2002 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2004 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = float(uint(_1966));
    float _2008 = trunc(_965);
    int _2010 = int(_2008);
    float _2012 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2002);
    float _2014 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    out.m_64.x = _1487;
    out.m_64.y = _1485;
    out.m_64.z = _1489;
    float _2016 = float(uint(_1988));
    float _2018 = 1.0 / _2006;
    int _2020 = ~_1966;
    int _2022 = _2020 + 1;
    int _2024 = ~_1988;
    int _2026 = _2024 + 1;
    int _2028 = ~_1988;
    int _2030 = _2028 + 1;
    float _2032 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2034 = int(_2032);
    float _2036 = float(uint(_2010));
    float _2038 = 1.0 / _2016;
    int _2040 = as_type<int>(_2018) + (-2);
    float _2042 = as_type<float>(_2040) * _2036;
    float _2044 = trunc(_967);
    int _2046 = int(_2044);
    float _2048 = float(uint(_2034));
    int _2050 = ~_2034;
    int _2052 = _2050 + 1;
    float _2054 = 1.0 / _2048;
    int _2056 = as_type<int>(_2038) + (-2);
    float _2058 = trunc(_2042);
    float _2060 = precise::max(_2058, 0.0);
    uint _2063 = uint(_2060);
    float _2065 = float(uint(_2046));
    float _2067 = as_type<float>(_2056) * _2065;
    float _2069 = trunc(_971);
    int _2071 = int(_2069);
    int _2073 = as_type<int>(_2054) + (-2);
    float _2075 = trunc(_2067);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    int _2081 = _2022 * int(_2063);
    int _2083 = _2081 + _2010;
    float _2085 = float(uint(_2083));
    float _2087 = float(uint(_2071));
    float _2089 = floor(_1972);
    float _2091 = float(_2071);
    float _2093 = as_type<float>(_2040) * _2085;
    float _2095 = as_type<float>(_2073) * _2087;
    int _2097 = _2026 * int(_2079);
    int _2099 = _2097 + _2046;
    float _2101 = trunc(_2093);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    float _2107 = float(uint(_2099));
    float _2109 = trunc(_2095);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = ~_1966;
    int _2117 = _2115 + 1;
    float _2119 = as_type<float>(_2056) * _2107;
    float _2121 = -_2089;
    float _2123 = _1972 + _2121;
    float _2125 = float(_2010);
    float _2127 = floor(_1968);
    int _2129 = int(_2063) + int(_2105);
    float _2131 = floor(_1970);
    int _2133 = _2052 * int(_2113);
    int _2135 = _2133 + _2071;
    float _2137 = float(uint(_2135));
    float _2139 = -_2127;
    float _2141 = _1968 + _2139;
    float _2143 = trunc(_2119);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(_1966);
    float _2151 = as_type<float>(_2073) * _2137;
    float _2153 = float(_2034);
    bool _2155 = _2125 >= _2149;
    bool _2157 = isnan(_2125);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(_2149);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2163);
    float _2167 = _2123 * _2149;
    float _2169 = -_2131;
    float _2171 = _1970 + _2169;
    int _2173 = _2117 * _2129;
    int _2175 = _2173 + _2010;
    float _2177 = float(_1988);
    float _2179 = trunc(_2151);
    float _2181 = precise::max(_2179, 0.0);
    uint _2183 = uint(_2181);
    float _2185 = _2149 * _935;
    bool _2187 = _2091 >= _2153;
    bool _2189 = isnan(_2091);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan(_2153);
    bool _2195 = _2191 || _2193;
    float _2197 = float(_2195);
    float _2199 = _2141 * _2153;
    bool _2201 = uint(_2175) >= uint(_1966);
    float _2203 = _2171 * _2177;
    float _2205 = float(_2046);
    float _2207 = trunc(_2165);
    int _2209 = int(_2207);
    bool _2211 = !_2201;
    int _2213 = _2211 ? 0 : (-1);
    bool _2215 = _2205 >= _2177;
    bool _2217 = isnan(_2205);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(_2177);
    bool _2223 = _2219 || _2221;
    float _2225 = float(_2223);
    float _2227 = _2177 * _935;
    float _2229 = _2153 * _935;
    int _2231 = int(_2079) + int(_2147);
    int _2233 = ~_2129;
    int _2235 = _2233 + _2213;
    int _2237 = _2235 + 1;
    float _2239 = trunc(_2225);
    int _2241 = int(_2239);
    bool _2243 = _1966 == 0;
    int _2245 = _2030 * _2231;
    int _2247 = _2245 + _2046;
    bool _2249 = !_1992;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = _1966 * _2237;
    int _2255 = _2253 + _2010;
    int _2257 = int(_2113) + int(_2183);
    bool _2259 = uint(_2247) >= uint(_1988);
    float _2261 = trunc(_2167);
    int _2263 = int(_2261);
    int _2265 = ~_2209;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    bool _2271 = !_2243;
    int _2273 = _2271 ? _2255 : (-1);
    int _2275 = abs(_2251);
    int _2277 = abs(_493);
    int _2279 = _2273 * _2269;
    bool _2281 = !_2259;
    int _2283 = _2281 ? 0 : (-1);
    float _2285 = trunc(_2185);
    int _2287 = int(_2285);
    int _2289 = _1966 + (-1);
    int _2291 = ~_2231;
    int _2293 = _2291 + _2283;
    int _2295 = _2293 + 1;
    bool _2297 = _1988 == 0;
    int _2299 = _2263 * _2275;
    int _2301 = _2299 + _2010;
    int _2303 = ~_2241;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = _2209 * _2289;
    int _2311 = _2309 + _2279;
    int _2313 = abs(_531);
    int _2315 = _1988 * _2295;
    int _2317 = _2315 + _2046;
    int _2319 = abs(_537);
    int _2321 = _2311 * _2277;
    int _2323 = _1988 + (-1);
    float _2325 = trunc(_2203);
    int _2327 = int(_2325);
    bool _2329 = !_2297;
    int _2331 = _2329 ? _2317 : (-1);
    int _2333 = _2287 * _2313;
    int _2335 = _2333 + _2321;
    bool _2337 = !_1976;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = ~_2034;
    int _2343 = _2341 + 1;
    int _2345 = _2331 * _2307;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2349 = _2347 != 0;
    float _2351 = trunc(_2227);
    int _2353 = int(_2351);
    int _2355 = _2301 * _2319;
    int _2357 = _2355 + _2335;
    int _2359 = abs(_1301);
    int _2361 = _2241 * _2323;
    int _2363 = _2361 + _2345;
    int _2365 = abs(_1291);
    int _2367 = _2343 * _2257;
    int _2369 = _2367 + _2071;
    int _2371 = abs(_2339);
    bool _2373 = !_2349;
    int _2375 = _2373 ? 0 : 1;
    int _2377 = _2363 * _2365;
    bool _2379 = uint(_2369) >= uint(_2034);
    int _2381 = _2263 * _2371;
    int _2383 = _2381 + _2357;
    int _2385 = abs(_2375);
    float _2387 = trunc(_2197);
    int _2389 = int(_2387);
    bool _2391 = !_2379;
    int _2393 = _2391 ? 0 : (-1);
    float _2395 = _969 * (-0.15915493667125701904296875);
    float _2397 = float(uint(_2383));
    int _2399 = _2327 * _2385;
    int _2401 = _2399 + _2046;
    int _2403 = abs(_1327);
    int _2405 = _2353 * _2359;
    int _2407 = _2405 + _2377;
    int _2409 = ~_2257;
    int _2411 = _2409 + _2393;
    int _2413 = _2411 + 1;
    float _2415 = as_type<float>(_2040) * _2397;
    int _2417 = abs(_1331);
    int _2419 = _2401 * _2403;
    int _2421 = _2419 + _2407;
    int _2423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2425 = _2423 != 0;
    int _2427 = _2034 * _2413;
    int _2429 = _2427 + _2071;
    bool _2431 = _2034 == 0;
    float _2433 = trunc(_2415);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = _2327 * _2417;
    int _2441 = _2439 + _2421;
    bool _2443 = !_2425;
    int _2445 = _2443 ? 0 : 1;
    float _2447 = _439 + 0.5;
    int _2449 = ~_2389;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    bool _2455 = !_2431;
    int _2457 = _2455 ? _2429 : (-1);
    float _2459 = trunc(_2199);
    int _2461 = int(_2459);
    int _2463 = ~_1966;
    int _2465 = _2463 + 1;
    int _2467 = abs(_2445);
    int _2469 = _2457 * _2453;
    int _2471 = abs(_623);
    float _2473 = trunc(_2229);
    int _2475 = int(_2473);
    int _2477 = _2034 + (-1);
    int _2479 = _2465 * int(_2437);
    int _2481 = _2479 + _2383;
    float _2483 = float(uint(_2441));
    int _2485 = _2389 * _2477;
    int _2487 = _2485 + _2469;
    float _2489 = float(uint(_2301));
    int _2491 = _2461 * _2467;
    int _2493 = _2491 + _2071;
    int _2495 = abs(_627);
    float _2497 = as_type<float>(_2056) * _2483;
    int _2499 = _2487 * _2471;
    float _2501 = as_type<float>(_2040) * _2489;
    float _2503 = float(uint(_2481));
    float _2505 = trunc(_2497);
    float _2507 = precise::max(_2505, 0.0);
    uint _2509 = uint(_2507);
    bool _2511 = !_1984;
    int _2513 = _2511 ? 0 : 1;
    int _2515 = _2475 * _2495;
    int _2517 = _2515 + _2499;
    int _2519 = abs(_631);
    float _2521 = as_type<float>(_2040) * _2503;
    float _2523 = float(uint(_2401));
    int _2525 = abs(_2513);
    float _2527 = trunc(_2501);
    float _2529 = precise::max(_2527, 0.0);
    uint _2531 = uint(_2529);
    float _2533 = as_type<float>(_2056) * _2523;
    float _2535 = float(uint(_2493));
    int _2537 = _2493 * _2519;
    int _2539 = _2537 + _2517;
    int _2541 = ~_1988;
    int _2543 = _2541 + 1;
    float _2545 = trunc(_2521);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    int _2551 = ~_2034;
    int _2553 = _2551 + 1;
    int _2555 = _2461 * _2525;
    int _2557 = _2555 + _2539;
    float _2559 = as_type<float>(_2073) * _2535;
    int _2561 = ~_1966;
    int _2563 = _2561 + 1;
    int _2565 = ~_1988;
    int _2567 = _2565 + 1;
    float _2569 = trunc(_2533);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    int _2575 = _2543 * int(_2509);
    int _2577 = _2575 + _2441;
    float _2579 = float(uint(_2557));
    float _2581 = float(uint(_2577));
    int _2583 = _2563 * int(_2531);
    int _2585 = _2583 + _2301;
    float _2587 = trunc(_2559);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    float _2593 = as_type<float>(_2073) * _2579;
    int _2595 = int(_2437) + int(_2549);
    float _2597 = as_type<float>(_2056) * _2581;
    float _2599 = float(uint(_2585));
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    int _2607 = _2567 * int(_2573);
    int _2609 = _2607 + _2401;
    float _2611 = as_type<float>(_2040) * _2599;
    int _2613 = _2563 * _2595;
    int _2615 = _2613 + _2383;
    int _2617 = ~_2034;
    int _2619 = _2617 + 1;
    float _2621 = trunc(_2597);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    float _2627 = float(uint(_2609));
    int _2629 = _2553 * int(_2591);
    int _2631 = _2629 + _2493;
    bool _2633 = uint(_2615) >= uint(_1966);
    float _2635 = as_type<float>(_2056) * _2627;
    float _2637 = trunc(_2611);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    bool _2643 = !_2633;
    int _2645 = _2643 ? 0 : (-1);
    float _2647 = float(uint(_2631));
    int _2649 = _2619 * int(_2605);
    int _2651 = _2649 + _2557;
    int _2653 = ~_2595;
    int _2655 = _2653 + _2645;
    int _2657 = _2655 + 1;
    int _2659 = int(_2509) + int(_2625);
    float _2661 = as_type<float>(_2073) * _2647;
    int _2663 = ~_1988;
    int _2665 = _2663 + 1;
    int _2667 = _1966 * _2657;
    int _2669 = _2667 + _2383;
    float _2671 = float(uint(_2651));
    float _2673 = trunc(_2661);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    int _2679 = _2665 * _2659;
    int _2681 = _2679 + _2441;
    int _2683 = int(_2531) + int(_2641);
    float _2685 = as_type<float>(_2073) * _2671;
    bool _2687 = !_2243;
    int _2689 = _2687 ? _2669 : (-1);
    float _2691 = -_181;
    int _2693 = _1635 ? as_type<int>(_2691) : as_type<int>(_181);
    float _2695 = trunc(_2685);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    bool _2701 = uint(_2681) >= uint(_1988);
    int _2703 = _2689 & 3;
    bool _2705 = _2703 != 0;
    bool _2707 = !_2701;
    int _2709 = _2707 ? 0 : (-1);
    int _2711 = _2689 & 3;
    bool _2713 = _2711 != 0;
    float _2715 = trunc(_2635);
    float _2717 = precise::max(_2715, 0.0);
    uint _2719 = uint(_2717);
    int _2721 = _2705 ? 0 : 1;
    int _2723 = ~_2659;
    int _2725 = _2723 + _2709;
    int _2727 = _2725 + 1;
    bool _2729 = uint(_2711) > 1u;
    int _2731 = ~_1966;
    int _2733 = _2731 + 1;
    int _2735 = _1988 * _2727;
    int _2737 = _2735 + _2441;
    float _2739 = -_177;
    int _2741 = _1637 ? as_type<int>(_2739) : as_type<int>(_177);
    float _2743 = exp2(_1996);
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2747 = _2745 != 0;
    int _2749 = _2733 * _2683;
    int _2751 = _2749 + _2301;
    int _2753 = int(_2605) + int(_2699);
    bool _2755 = !_2747;
    float _2757 = _2755 ? _181 : as_type<float>(_2693);
    float _2759 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2761 = !_2297;
    int _2763 = _2761 ? _2737 : (-1);
    int _2765 = int(_2591) + int(_2677);
    bool _2767 = uint(_2751) >= uint(_1966);
    int _2769 = ~_2721;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = _2773;
    if (!_2729)
    {
        int _2777 = ~_2721;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    float _2783 = -_2743;
    float _2785 = _2783 + 1.0;
    int _2787 = _2763 & 3;
    bool _2789 = _2787 != 0;
    int _2791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2793 = _2791 != 0;
    bool _2795 = !_2767;
    int _2797 = _2795 ? 0 : (-1);
    bool _2799 = uint(_2787) > 1u;
    int _2801 = int(_2573) + int(_2719);
    bool _2803 = !_2793;
    float _2805 = _2803 ? _177 : as_type<float>(_2741);
    int _2807 = ~_1988;
    int _2809 = _2807 + 1;
    int _2811 = _2763 & 3;
    bool _2813 = _2811 != 0;
    bool _2815 = !_2789;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2809 * _2801;
    int _2821 = _2819 + _2401;
    bool _2823 = _2787 != 3;
    int _2825 = _2813 ? 0 : 1;
    bool _2827 = uint(_2787) >= 2u;
    int _2829 = ~_2034;
    int _2831 = _2829 + 1;
    int _2833 = ~_2034;
    int _2835 = _2833 + 1;
    int _2837 = _2827 ? 0 : 1;
    int _2839 = ~_2825;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2835 * _2765;
    int _2847 = _2845 + _2493;
    bool _2849 = uint(_2821) >= uint(_1988);
    int _2851 = _2831 * _2753;
    int _2853 = _2851 + _2557;
    int _2855 = _2843;
    if (!_2799)
    {
        int _2857 = ~_2825;
        int _2859 = _2857 + 1;
        _2855 = _2859;
    }
    int _2861 = _2855;
    float _2863 = _2395 * 6.283185482025146484375;
    float _2865 = sin(_2863);
    bool _2867 = _213 > 0.5;
    int _2869 = ~_2837;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = _2763 >> 31;
    int _2877 = _2873;
    if (_2823)
    {
        int _2879 = ~_2837;
        int _2881 = _2879 + 1;
        _2877 = _2881;
    }
    int _2883 = _2877;
    bool _2885 = !_2849;
    int _2887 = _2885 ? 0 : (-1);
    bool _2889 = uint(_2847) >= uint(_2034);
    bool _2891 = uint(_2853) >= uint(_2034);
    int _2893 = _2875 & 3;
    bool _2895 = !_2891;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = _2763 + _2893;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2903 = _2787 != 3;
    float _2905 = _2395 * 6.283185482025146484375;
    float _2907 = cos(_2905);
    bool _2909 = !_2889;
    int _2911 = _2909 ? 0 : (-1);
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2917 = _2915 != 0;
    float _2919 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2921 = -_177;
    int _2923 = _2867 ? as_type<int>(_2921) : as_type<int>(_177);
    float _2925 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2927 = _2899 >> 2;
    float _2929 = _2757 * _2865;
    bool _2931 = !_2917;
    float _2933 = _2931 ? _177 : as_type<float>(_2923);
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2937 = _2927 << 4;
    int _2939 = _2937 + 512;
    float _2941 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2943 = !_2903;
    int _2945 = _2943 ? 0 : (-1);
    float _2947 = _2757 * _2907;
    int _2949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2951 = _2949 != 0;
    float _2953 = -_2929;
    float _2955 = fma(_2933, _2907, _2953);
    int _2957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2959 = _2957 != 0;
    float _2961 = _2935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2965 = _2963 != 0;
    float _2967 = _431 + (-0.5);
    uint _2969 = uint(int(uint(_2939) >> uint(2)));
    uint _2971 = uint(int(uint(int(_2969)) >> uint(2)));
    int _2973 = int(_2969) & 3;
    float _2975 = (*spvDescriptorSet0.vp_c9)._m0[int(_2971)][_2973];
    int _2977 = int(_2969) + 1;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    int _2981 = _2977 & 3;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[int(_2979)][_2981];
    float _2985 = fma(_2933, _2865, _2947);
    out.m_66.x = _2925;
    out.m_66.y = _2919;
    out.m_66.z = _2961;
    float _2987 = -_2967;
    float _2989 = -_983;
    float _2991 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[90].y, _2989);
    int _2993 = abs(_2817);
    int _2995 = abs(_2883);
    int _2997 = ~_2753;
    int _2999 = _2997 + _2897;
    int _3001 = _2999 + 1;
    int _3003 = ~_2765;
    int _3005 = _3003 + _2911;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2945);
    float _3011 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[90].x, _875);
    float _3013 = _2955 + 0.5;
    float _3015 = _2985 + (-0.5);
    float _3017 = -_975;
    float _3019 = _3017 + 1.0;
    int _3021 = _2034 * _3007;
    int _3023 = _3021 + _2493;
    float _3025 = fma(_3013, (*spvDescriptorSet0.vp_c9)._m0[80].x, _957);
    float _3027 = fma(_431, _1980, _2991);
    float _3029 = -_3015;
    float _3031 = -_949;
    float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3031);
    float _3035 = -_3019;
    float _3037 = fma(_439, _3035, _3011);
    int _3039 = _2939 + 8;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    uint _3043 = uint(int(uint(int(_3041)) >> uint(2)));
    int _3045 = int(_3041) & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    int _3049 = int(_3041) + 1;
    uint _3051 = uint(int(uint(_3049) >> uint(2)));
    int _3053 = _3049 & 3;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[int(_3051)][_3053];
    float _3057 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3059 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3061 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_68.x = _3037;
    out.m_68.y = _3027;
    float _3063 = -_1149;
    float _3065 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3057);
    float _3067 = -_1149;
    float _3069 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3059);
    float _3071 = -_1149;
    float _3073 = fma(_3071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3075 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3077 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    int _3079 = abs(_2861);
    float _3081 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3069);
    float _3083 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3073);
    float _3085 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3087 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3089 = ~_3009;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3097 = int(_3095);
    int _3099 = ~_2801;
    int _3101 = _3099 + _2887;
    int _3103 = _3101 + 1;
    float _3105 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3087);
    int _3107 = ~_3079;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    float _3113 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3075);
    float _3115 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3085);
    float _3117 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3105);
    float _3119 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    int _3121 = _3111 * as_type<int>(_2983);
    int _3123 = ~_2993;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _2034 * _3001;
    int _3131 = _3129 + _2557;
    float _3133 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    int _3135 = ~_2683;
    int _3137 = _3135 + _2797;
    int _3139 = _3137 + 1;
    float _3141 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3143 = _3127 * as_type<int>(_2975);
    int _3145 = _3143 + _3121;
    float _3147 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3149 = !_2959;
    int _3151 = _3149 ? 0 : 1;
    int _3153 = _1988 * _3103;
    int _3155 = _3153 + _2401;
    int _3157 = ~_2995;
    int _3159 = _3157 + 1;
    int _3161 = _3159 + 1;
    float _3163 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3141);
    bool _3165 = uint(_2711) >= 2u;
    float _3167 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3147);
    int _3169 = abs(_3151);
    int _3171 = _1966 * _3139;
    int _3173 = _3171 + _2301;
    int _3175 = _2689 >> 31;
    float _3177 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3163);
    int _3179 = _3165 ? 0 : 1;
    bool _3181 = _2711 != 3;
    int _3183 = _3161 * as_type<int>(_3047);
    int _3185 = _3183 + _3145;
    bool _3187 = !_2431;
    int _3189 = _3187 ? _3131 : (-1);
    int _3191 = ~_3169;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3093 * as_type<int>(_3055);
    int _3199 = _3197 + _3185;
    int _3201 = _3175 & 3;
    int _3203 = _3189 >> 31;
    int _3205 = _2689 + _3201;
    int _3207 = _3199 * _3195;
    int _3209 = _3203 & 3;
    int _3211 = _3205 >> 2;
    int _3213 = ~_3179;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3189 + _3209;
    int _3221 = _3217;
    if (_3181)
    {
        int _3223 = ~_3179;
        int _3225 = _3223 + 1;
        _3221 = _3225;
    }
    int _3227 = _3221;
    int _3229 = _3211 << 4;
    int _3231 = _3229 + 368;
    float _3233 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _3235 = float(uint(_3097));
    int _3237 = _3219 >> 2;
    uint _3239 = uint(int(uint(_3231) >> uint(2)));
    uint _3241 = uint(int(uint(int(_3239)) >> uint(2)));
    int _3243 = int(_3239) & 3;
    float _3245 = (*spvDescriptorSet0.vp_c9)._m0[int(_3241)][_3243];
    int _3247 = int(_3239) + 1;
    uint _3249 = uint(int(uint(_3247) >> uint(2)));
    int _3251 = _3247 & 3;
    float _3253 = (*spvDescriptorSet0.vp_c9)._m0[int(_3249)][_3251];
    int _3255 = abs(_3097);
    float _3257 = 1.0 / _3235;
    bool _3259 = !_2297;
    int _3261 = _3259 ? _3155 : (-1);
    bool _3263 = !_2713;
    int _3265 = _3263 ? 0 : 1;
    int _3267 = _3237 << 4;
    int _3269 = _3267 + 656;
    int _3271 = _3261 * _3169;
    int _3273 = _3271 + _3207;
    int _3275 = _3189 & 3;
    bool _3277 = _3275 != 0;
    float _3279 = float(uint(_3255));
    uint _3281 = uint(int(uint(_3269) >> uint(2)));
    uint _3283 = uint(int(uint(int(_3281)) >> uint(2)));
    int _3285 = int(_3281) & 3;
    float _3287 = (*spvDescriptorSet0.vp_c9)._m0[int(_3283)][_3285];
    int _3289 = int(_3281) + 1;
    uint _3291 = uint(int(uint(_3289) >> uint(2)));
    int _3293 = _3289 & 3;
    float _3295 = (*spvDescriptorSet0.vp_c9)._m0[int(_3291)][_3293];
    bool _3297 = uint(_3275) > 1u;
    float _3299 = _2759 * _3081;
    int _3301 = _3189 & 3;
    bool _3303 = _3301 != 0;
    float _3305 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3167);
    float _3307 = 1.0 / _3279;
    float _3309 = float(uint(_3273));
    float _3311 = _2759 * _3077;
    int _3313 = _3303 ? 0 : 1;
    out.m_70.x = _3233;
    out.m_70.y = _3177;
    out.m_70.z = _3305;
    bool _3315 = _2711 != 3;
    float _3317 = fma(_2941, _3233, _3311);
    int _3319 = as_type<int>(_3257) + (-2);
    float _3321 = fma(_2941, _3177, _3299);
    int _3323 = ~_3313;
    int _3325 = _3323 + 1;
    int _3327 = _3325 + 1;
    bool _3329 = !_3277;
    int _3331 = _3329 ? 0 : 1;
    float _3333 = as_type<float>(_3319) * _3309;
    int _3335 = _3327;
    if (!_3297)
    {
        int _3337 = ~_3313;
        int _3339 = _3337 + 1;
        _3335 = _3339;
    }
    int _3341 = _3335;
    bool _3343 = _3275 != 3;
    int _3345 = _3231 + 8;
    uint _3347 = uint(int(uint(_3345) >> uint(2)));
    uint _3349 = uint(int(uint(int(_3347)) >> uint(2)));
    int _3351 = int(_3347) & 3;
    float _3353 = (*spvDescriptorSet0.vp_c9)._m0[int(_3349)][_3351];
    int _3355 = int(_3347) + 1;
    uint _3357 = uint(int(uint(_3355) >> uint(2)));
    int _3359 = _3355 & 3;
    float _3361 = (*spvDescriptorSet0.vp_c9)._m0[int(_3357)][_3359];
    int _3363 = abs(_3273);
    float _3365 = trunc(_3333);
    float _3367 = precise::max(_3365, 0.0);
    uint _3369 = uint(_3367);
    bool _3371 = uint(_3275) >= 2u;
    int _3373 = as_type<int>(_3307) + (-2);
    int _3375 = _3371 ? 0 : 1;
    float _3377 = float(uint(_3363));
    int _3379 = abs(_2781);
    bool _3381 = _3275 != 3;
    float _3383 = as_type<float>(_3373) * _3377;
    int _3385 = ~_3375;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    int _3391 = _3389;
    if (_3343)
    {
        int _3393 = ~_3375;
        int _3395 = _3393 + 1;
        _3391 = _3395;
    }
    int _3397 = _3391;
    int _3399 = _3269 + 8;
    uint _3401 = uint(int(uint(_3399) >> uint(2)));
    uint _3403 = uint(int(uint(int(_3401)) >> uint(2)));
    int _3405 = int(_3401) & 3;
    float _3407 = (*spvDescriptorSet0.vp_c9)._m0[int(_3403)][_3405];
    int _3409 = int(_3401) + 1;
    uint _3411 = uint(int(uint(_3409) >> uint(2)));
    int _3413 = _3409 & 3;
    float _3415 = (*spvDescriptorSet0.vp_c9)._m0[int(_3411)][_3413];
    int _3417 = abs(_3341);
    float _3419 = trunc(_3383);
    float _3421 = precise::max(_3419, 0.0);
    uint _3423 = uint(_3421);
    float _3425 = fma(_2759, _2759, 1.0);
    int _3427 = abs(_3265);
    int _3429 = ~_3379;
    int _3431 = _3429 + 1;
    int _3433 = _3431 + 1;
    int _3435 = ~_3417;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    float _3441 = rsqrt(_3425);
    int _3443 = abs(_3227);
    int _3445 = _3433 * as_type<int>(_3253);
    int _3447 = _3439 * as_type<int>(_3295);
    int _3449 = abs(_3331);
    int _3451 = ~_3427;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = ~_3255;
    int _3459 = _3457 + 1;
    int _3461 = ~_3097;
    int _3463 = _3461 + 1;
    int _3465 = _3455 * as_type<int>(_3245);
    int _3467 = _3465 + _3445;
    int _3469 = ~_3449;
    int _3471 = _3469 + 1;
    int _3473 = _3471 + 1;
    float _3475 = _2759 * _3441;
    int _3477 = _3463 * int(_3369);
    int _3479 = _3477 + _3273;
    int _3481 = ~_3443;
    int _3483 = _3481 + 1;
    int _3485 = _3483 + 1;
    int _3487 = _3473 * as_type<int>(_3287);
    int _3489 = _3487 + _3447;
    float _3491 = -_3117;
    float _3493 = _3475 * _3491;
    int _3495 = _3459 * int(_3423);
    int _3497 = _3495 + _3363;
    bool _3499 = !_3381;
    int _3501 = _3499 ? 0 : (-1);
    int _3503 = _3485 * as_type<int>(_3353);
    int _3505 = _3503 + _3467;
    float _3507 = float(uint(_3479));
    float _3509 = fma(_3441, _3077, _3493);
    int _3511 = abs(_3397);
    float _3513 = -_3119;
    float _3515 = _3475 * _3513;
    float _3517 = float(uint(_3497));
    float _3519 = as_type<float>(_3319) * _3507;
    int _3521 = abs(_3501);
    float _3523 = fma(_3441, _3081, _3515);
    float _3525 = -_3133;
    float _3527 = _3475 * _3525;
    float _3529 = as_type<float>(_3373) * _3517;
    float _3531 = trunc(_3519);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    int _3537 = ~_3511;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    float _3543 = _2759 * _3083;
    float _3545 = fma(_3441, _3083, _3527);
    int _3547 = ~_3521;
    int _3549 = _3547 + 1;
    int _3551 = _3549 + 1;
    int _3553 = _3541 * as_type<int>(_3407);
    int _3555 = _3553 + _3489;
    float _3557 = fma(_2941, _3305, _3543);
    float _3559 = trunc(_3529);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    int _3565 = ~_3097;
    int _3567 = _3565 + 1;
    int _3569 = _3551 * as_type<int>(_3415);
    int _3571 = _3569 + _3555;
    bool _3573 = !_2951;
    int _3575 = _3573 ? 0 : 1;
    out.m_72.x = _3509;
    out.m_72.y = _3523;
    out.m_72.z = _3545;
    bool _3577 = !_2965;
    int _3579 = _3577 ? 0 : 1;
    float _3581 = _3117 + _3317;
    int _3583 = abs(_3575);
    float _3585 = _3133 + _3557;
    int _3587 = ~_3255;
    int _3589 = _3587 + 1;
    int _3591 = int(_3369) + int(_3535);
    bool _3593 = !_3315;
    int _3595 = _3593 ? 0 : (-1);
    int _3597 = abs(_3579);
    int _3599 = int(_3423) + int(_3563);
    int _3601 = _3567 * _3591;
    int _3603 = _3601 + _3273;
    int _3605 = abs(_3595);
    int _3607 = _3589 * _3599;
    int _3609 = _3607 + _3363;
    int _3611 = ~_3605;
    int _3613 = _3611 + 1;
    int _3615 = _3613 + 1;
    float _3617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3619 = uint(_3603) >= uint(_3097);
    int _3621 = ~_3597;
    int _3623 = _3621 + 1;
    int _3625 = _3623 + 1;
    int _3627 = _3615 * as_type<int>(_3361);
    int _3629 = _3627 + _3505;
    int _3631 = ~_3583;
    int _3633 = _3631 + 1;
    int _3635 = _3633 + 1;
    bool _3637 = uint(_3609) >= uint(_3255);
    int _3639 = _3571 * _3625;
    bool _3641 = !_3619;
    int _3643 = _3641 ? 0 : (-1);
    float _3645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3647 = _3273 ^ _3097;
    int _3649 = _3629 * _3635;
    int _3651 = ~_3591;
    int _3653 = _3651 + _3643;
    int _3655 = _3653 + 1;
    float _3657 = _3119 + _3321;
    bool _3659 = !_3637;
    int _3661 = _3659 ? 0 : (-1);
    float _3663 = _3617 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    uint _3665 = uint(int(uint(_3647) >> uint(31)));
    int _3667 = _3097 * _3655;
    int _3669 = _3667 + _3273;
    int _3671 = ~_3661;
    int _3673 = _3599 + _3671;
    int _3675 = _3673 + 1;
    float _3677 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2012);
    bool _3679 = _3097 == 0;
    out.m_74.x = _3581;
    out.m_74.y = _3657;
    out.m_74.z = _3585;
    int _3681 = ~int(_3665);
    int _3683 = _3681 + 1;
    bool _3685 = !_3679;
    int _3687 = _3685 ? _3669 : (-1);
    float _3689 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3691 = _3675 ^ _3683;
    bool _3693 = _3097 == 0;
    int _3695 = ~_3683;
    int _3697 = _3695 + _3691;
    int _3699 = _3697 + 1;
    out.gl_Position.x = _1907;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _3677;
    out.gl_Position.w = _1867;
    float _3701 = float(_3687);
    bool _3703 = !_2243;
    int _3705 = _3703 ? _3173 : (-1);
    bool _3707 = !_2431;
    int _3709 = _3707 ? _3023 : (-1);
    float _3711 = fma(_3689, _3701, _963);
    bool _3713 = !_3693;
    int _3715 = _3713 ? _3699 : (-1);
    int _3717 = _3705 * _3583;
    int _3719 = _3717 + _3649;
    bool _3721 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3723 = isnan(_1645);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3729 = _3725 || _3727;
    int _3731 = _3709 * _3597;
    int _3733 = _3731 + _3639;
    float _3735 = float(_3715);
    float _3737 = _3677 + _1867;
    float _3739 = _2805 + 0.5;
    float _3741 = -_877;
    float _3743 = _3741 + 1.0;
    float _3745 = -_981;
    float _3747 = fma(_3663, _3735, _3745);
    float _3749 = _1255 + (-0.5);
    float _3751 = fma(_3689, _3739, _3711);
    float _3753 = _3737 * 0.5;
    float _3755 = -_959;
    float _3757 = _3755 + 1.0;
    float _3759 = -_3663;
    float _3761 = fma(_3759, _3749, _3747);
    float _3763 = -_3743;
    float _3765 = fma(_2805, _3763, _3751);
    float _3767 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3769 = -_979;
    float _3771 = _3769 + 1.0;
    float _3773 = float(_3733);
    float _3775 = -_2000;
    float _3777 = fma(_2955, _3775, _3025);
    float _3779 = _3767 * _1941;
    float _3781 = fma(_1255, _3771, _3761);
    float _3783 = -_3767;
    float _3785 = _3783 + 1.0;
    out.m_76.z = _3773;
    float _3787 = _1952 * _3779;
    float _3789 = _1962 * _3779;
    float _3791 = _1952 * _3785;
    float _3793 = float(_3719);
    float _3795 = fma(_1958, _3787, _1946);
    float _3797 = fma(_1960, _3787, _1948);
    float _3799 = fma(_1952, _3789, _1950);
    float _3801 = fma(_2985, _3757, _3033);
    out.m_76.x = _3793;
    out.m_78.x = _3795;
    out.m_78.y = _3797;
    out.m_78.z = _3799;
    out.m_78.w = _3791;
    float _3803 = _1557 * _1619;
    out.m_80.z = _3753;
    out.m_80.w = _1867;
    float _3805 = _3803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _3777;
    out.m_82.y = _3801;
    out.m_82.z = _3765;
    out.m_82.w = _3781;
    float _3807 = _3803;
    float _3809 = _3753;
    float _3811 = _3781;
    float _3813 = _3765;
    float _3815 = _3801;
    float _3817 = _3777;
    if (!_3729)
    {
        _3807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3819 = _3807;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3729)
    {
        _3809 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3825 = _3809;
    float _3827 = _3825;
    float _3829 = _3825;
    if (!_3729)
    {
        _3811 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3831 = _3811;
    float _3833 = _3831;
    float _3835 = _3831;
    if (!_3729)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3837 = _3813;
    float _3839 = _3837;
    float _3841 = _3837;
    if (!_3729)
    {
        _3815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3843 = _3815;
    float _3845 = _3843;
    float _3847 = _3843;
    if (!_3729)
    {
        _3817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3849 = _3817;
    bool _3851 = !_3729;
    float _3853 = _3849;
    float _3855 = _3849;
    if (!_3851)
    {
        bool _3857 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3859 = isnan(_1645);
        bool _3861 = _3857 || _3859;
        bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3865 = _3861 || _3863;
        if (!_3865)
        {
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = _1645 + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3873 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3871;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3879 = 1.0 / _3873;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3897 = _3869 * _3879;
            float _3899 = precise::clamp(_3897, 0.0, 1.0);
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3905 = fma(_3899, _3877, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3907 = fma(_3899, _3903, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3909 = fma(_3899, _3883, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3911 = fma(_3899, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3913 = fma(_3899, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3915 = fma(_3899, _3895, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3835 = _3909;
            _3855 = _3913;
            _3829 = _3905;
            _3847 = _3911;
            _3841 = _3907;
            _3823 = _3915;
            _3917 = true;
        }
        else
        {
            bool _3919 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3921 = isnan(_1645);
            bool _3923 = _3919 || _3921;
            bool _3925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3927 = _3923 || _3925;
            if (!_3927)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3929 = _3827;
            _3829 = _3929;
            if (!_3927)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3931 = _3833;
            _3835 = _3931;
            if (!_3927)
            {
                _3839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3933 = _3839;
            _3841 = _3933;
            if (!_3927)
            {
                _3845 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3935 = _3845;
            _3847 = _3935;
            if (!_3927)
            {
                _3853 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3937 = _3853;
            _3855 = _3937;
            if (!_3927)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3939 = _3821;
            bool _3941 = !_3927;
            _3823 = _3939;
            if (!_3941)
            {
                bool _3943 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3945 = isnan(_1645);
                bool _3947 = _3943 || _3945;
                bool _3949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3951 = _3947 || _3949;
                if (!_3951)
                {
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = _1645 + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3959 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3957;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3965 = 1.0 / _3959;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3983 = _3955 * _3965;
                    float _3985 = precise::clamp(_3983, 0.0, 1.0);
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3991 = fma(_3985, _3963, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3993 = fma(_3985, _3989, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3995 = fma(_3985, _3969, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3997 = fma(_3985, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3999 = fma(_3985, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4001 = fma(_3985, _3981, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3835 = _3995;
                    _3855 = _3999;
                    _3829 = _3991;
                    _3847 = _3997;
                    _3841 = _3993;
                    _3823 = _4001;
                    _3917 = true;
                }
                else
                {
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3855 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3847 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3917 = false;
    float _4003 = _3835;
    float _4005 = _3855;
    float _4007 = _3829;
    float _4009 = _3847;
    float _4011 = _3841;
    float _4013 = _3823;
    float _4015 = fma(_3657, -0.5, 0.5);
    float _4017 = precise::clamp(_4015, 0.0, 1.0);
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = _3805 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4025 = -_4007;
    float _4027 = _4025 + _4009;
    float _4029 = fma(_4017, _4021, _4003);
    out.m_84.x = 0.0;
    float _4031 = -_4011;
    float _4033 = _4031 + _4013;
    float _4035 = fma(_4017, _4027, _4007);
    float _4037 = _4029 * 0.586610972881317138671875;
    out.m_47.x = _4023;
    bool _4039 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4041 = fma(_4017, _4033, _4011);
    float _4043 = fma(_4035, 0.298911988735198974609375, _4037);
    bool _4045 = _1557 > 0.0;
    bool _4047 = isnan(_1557);
    bool _4049 = _4045 || _4047;
    bool _4051 = isnan(0.0);
    bool _4053 = _4049 || _4051;
    float _4055 = fma(_4041, 0.114477999508380889892578125, _4043);
    bool _4057 = _1619 <= 0.0;
    bool _4059 = !_4053;
    bool _4061 = _4057 || _4059;
    float _4063 = -_4055;
    float _4065 = _4035 + _4063;
    float _4067 = -_4055;
    float _4069 = _4029 + _4067;
    float _4071 = -_4055;
    float _4073 = _4041 + _4071;
    float _4075 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    float _4077 = fma(_4069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    float _4079 = fma(_4073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4055);
    bool _4081 = !_4039;
    if (!_4081)
    {
        float _4083 = -_1485;
        float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4087 = -_1487;
        float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4091 = -_1489;
        float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4095 = _4085 * _4085;
        float _4097 = fma(_4089, _4089, _4095);
        float _4099 = fma(_4093, _4093, _4097);
        float _4101 = sqrt(_4099);
        float _4103 = rsqrt(_4099);
        float _4105 = -_4101;
        float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4109 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4111 = precise::clamp(_4109, 0.0, 1.0);
        float _4113 = _4089 * _4103;
        float _4115 = _4085 * _4103;
        float _4117 = abs(_4111);
        float _4119 = log2(_4117);
        float _4121 = _4093 * _4103;
        float _4123 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4125 = _3657 * _4115;
        float _4127 = -_4115;
        float _4129 = -_4123;
        float _4131 = fma(_4127, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4129);
        float _4133 = fma(_3581, _4113, _4125);
        float _4135 = -_4121;
        float _4137 = fma(_4135, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4131);
        float _4139 = fma(_3585, _4121, _4133);
        float _4141 = precise::clamp(_4139, 0.0, 1.0);
        float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4145 = _4137 + _4143;
        float _4147 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4149 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4151 = precise::clamp(_4149, 0.0, 1.0);
        float _4153 = exp2(_4147);
        float _4155 = _4153 * _4151;
        float _4157 = _4141 * _4155;
        float _4159 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4163 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _4159;
        out.m_84.y = _4161;
        out.m_84.z = _4163;
    }
    out.m_86.x = _4075;
    out.m_86.y = _4077;
    out.m_86.z = _4079;
    if (!_4061)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4165;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

