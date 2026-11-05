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
    float4 m_78 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_53 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3483 = false;
    bool _511 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3768 = as_type<float>(_125);
        out.gl_Position.z = _3768;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3841 = as_type<float>(_163);
        out.gl_Position.z = _3841;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _167;
    if (!_179)
    {
        float _203 = _167 * _167;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = in.m_62.x;
    float _211 = in.m_62.y;
    float _213 = in.m_62.z;
    float _215 = _207;
    float _217 = _193;
    if (!_179)
    {
        float _219 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _219;
    }
    float _221 = _215;
    float _223 = in.m_64.x;
    float _225 = in.m_64.y;
    float _227 = in.m_64.z;
    int _229 = as_type<int>(_165) & 1;
    bool _231 = _229 != 0;
    int _233 = as_type<int>(_165) & 2;
    bool _235 = _233 != 0;
    int _237 = int(_231);
    int _239 = _235 ? 2 : 0;
    int _241 = _237 | _239;
    int _243 = _179 ? 4 : 0;
    int _245 = _241 | _243;
    int _247 = false ? 8 : 0;
    int _249 = _245 | _247;
    int _251 = false ? 16 : 0;
    int _253 = _249 | _251;
    int _255 = false ? 32 : 0;
    int _257 = _253 | _255;
    int _259 = false ? 64 : 0;
    int _261 = _257 | _259;
    int _263 = _261 & 4;
    bool _265 = !_231;
    float _267 = _265 ? (-0.5) : 0.5;
    bool _269 = !_235;
    float _271 = _269 ? (-0.5) : 0.5;
    bool _273 = !_179;
    float _275 = _221;
    float _277 = 0.0;
    float _279 = as_type<float>(_263);
    if (!_273)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _167 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _167);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _309;
        _277 = _293;
        _279 = _299;
    }
    float _311 = _275;
    float _313 = _277;
    float _315 = _279;
    bool _317 = !_179;
    float _319 = _315;
    float _321 = _313;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _167 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _319 = _329;
        _201 = _341;
    }
    float _343 = _319;
    float _345 = _201;
    float _347 = _343;
    if (!_179)
    {
        float _349 = _145 * _145;
        float _351 = _349 * 0.5;
        _321 = _351;
    }
    float _353 = _321;
    float _355 = _353;
    if (!_179)
    {
        _347 = _145;
    }
    float _357 = _347;
    float _359 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _357;
    if (!_179)
    {
        float _365 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_179;
    float _371 = _367;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _145 * _375;
        float _385 = exp2(_383);
        float _387 = _381 * 0.693147182464599609375;
        float _389 = 1.0 / _387;
        float _391 = 1.0 / _379;
        float _393 = _385 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _389, _145);
        float _399 = _397 * _391;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_179;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _145 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _363 = _425;
    }
    float _427 = _363;
    float _429 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _431 = fma(_345, _181, _359);
    float _433 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _435 = fma(_345, _183, _361);
    float _437 = fma(_345, _185, _429);
    float _439 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = fma(_427, _183, _433);
    float _443 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = fma(_427, _181, _439);
    float _449 = -_441;
    float _451 = _435 + _449;
    float _453 = fma(_427, _185, _443);
    float _455 = fma(_435, _169, _189);
    float _457 = fma(_431, _169, _187);
    float _459 = -_447;
    float _461 = _431 + _459;
    float _463 = _451 * _195;
    float _465 = _451 * _211;
    float _467 = _451 * _225;
    float _469 = -_453;
    float _471 = _437 + _469;
    float _473 = fma(_461, _193, _463);
    float _475 = fma(_461, _209, _465);
    float _477 = fma(_461, _223, _467);
    float _479 = fma(_437, _169, _191);
    float _481 = fma(_471, _197, _473);
    float _483 = fma(_471, _213, _475);
    float _485 = fma(_471, _227, _477);
    bool _487 = !_445;
    float _489 = _483;
    float _491 = _481;
    float _493 = _485;
    float _509;
    if (!_487)
    {
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _497 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_109);
        float _515 = 1.0 / _513;
        float _517 = _145 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _523 = int(_521);
    float _525 = in.m_51.y;
    float _527 = _455 * _195;
    float _529 = in.m_51.z;
    float _531 = fma(_457, _193, _527);
    float _533 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _535 = int(_533);
    float _537 = in.m_51.w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _541 = in.m_60.w;
    bool _543 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _545 = isnan(_519);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = float(_523);
    float _557 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _559 = int(_557);
    float _561 = in.m_64.w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = in.m_62.w;
    float _569 = 1.0 / _555;
    float _571 = float(uint(_535));
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _575 = 1.0 + _573;
    int _577 = ~_535;
    int _579 = _577 + 1;
    float _581 = float(_535);
    bool _583 = _535 == 0;
    float _585 = 1.0 / _571;
    float _587 = float(uint(_559));
    int _589 = ~_559;
    int _591 = _589 + 1;
    int _593 = ~_559;
    int _595 = _593 + 1;
    float _597 = _145 * _569;
    float _599 = 1.0 / _587;
    int _601 = as_type<int>(_585) + (-2);
    float _603 = trunc(_597);
    int _605 = int(_603);
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _609 = _607 != 0;
    float _611 = 1.0 / _575;
    int _613 = ~_535;
    int _615 = _613 + 1;
    float _617 = float(uint(_605));
    float _619 = as_type<float>(_601) * _617;
    float _621 = trunc(_619);
    float _623 = precise::max(_621, 0.0);
    uint _626 = uint(_623);
    float _628 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _630 = int(_628);
    int _632 = _579 * int(_626);
    int _634 = _632 + _605;
    float _636 = as_type<float>(_579);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_609)
    {
        _636 = 1.0;
    }
    float _640 = _636;
    float _642 = _640;
    if (!_609)
    {
        _642 = 7.345489978790283203125;
    }
    float _644 = _642;
    float _646 = float(uint(_634));
    float _648 = _644 * _131;
    float _650 = as_type<float>(_601) * _646;
    float _652 = trunc(_650);
    float _654 = precise::max(_652, 0.0);
    uint _656 = uint(_654);
    float _658 = floor(_648);
    int _660 = int(_626) + int(_656);
    float _662 = float(_605);
    int _664 = _615 * _660;
    int _666 = _664 + _605;
    bool _668 = _662 >= _581;
    bool _670 = isnan(_662);
    bool _672 = _668 || _670;
    bool _674 = isnan(_581);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_658;
    float _682 = _648 + _680;
    int _684 = _535 + (-1);
    bool _686 = uint(_666) >= uint(_535);
    float _688 = _682 * _581;
    float _690 = float(_109);
    float _692 = trunc(_678);
    int _694 = int(_692);
    bool _696 = !_686;
    int _698 = _696 ? 0 : (-1);
    int _700 = ~_660;
    int _702 = _700 + _698;
    int _704 = _702 + 1;
    float _706 = float(_630);
    float _708 = 1.0 / _690;
    int _710 = _535 * _704;
    int _712 = _710 + _605;
    bool _714 = !_583;
    int _716 = _714 ? _712 : (-1);
    float _718 = 1.0 / _706;
    int _720 = ~_694;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    int _726 = _716 * _724;
    float _728 = _145 * _708;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _740 = _738 != 0;
    float _742 = trunc(_688);
    int _744 = int(_742);
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _748 = _746 != 0;
    float _750 = _728 * _581;
    int _752 = _694 * _684;
    int _754 = _752 + _726;
    bool _756 = !_736;
    int _758 = _756 ? 0 : 1;
    float _760 = _145 * _718;
    bool _762 = !_748;
    int _764 = _762 ? 0 : 1;
    float _766 = trunc(_750);
    int _768 = int(_766);
    bool _770 = !_732;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_758);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _778 = _776 != 0;
    bool _780 = !_740;
    int _782 = _780 ? 0 : 1;
    float _784 = trunc(_760);
    int _786 = int(_784);
    int _788 = abs(_764);
    int _790 = _754 * _774;
    int _792 = abs(_772);
    bool _794 = !_778;
    int _796 = _794 ? 0 : 1;
    int _798 = _744 * _788;
    int _800 = _798 + _605;
    int _802 = abs(_782);
    int _804 = abs(_796);
    int _806 = _768 * _792;
    int _808 = _806 + _790;
    int _810 = ~_559;
    int _812 = _810 + 1;
    float _814 = float(uint(_786));
    int _816 = _800 * _802;
    int _818 = _816 + _808;
    int _820 = as_type<int>(_599) + (-2);
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _824 = _822 != 0;
    int _826 = _744 * _804;
    int _828 = _826 + _818;
    int _830 = ~_535;
    int _832 = _830 + 1;
    float _834 = as_type<float>(_820) * _814;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _838 = _836 != 0;
    float _840 = float(uint(_828));
    float _842 = trunc(_834);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = as_type<float>(_601) * _840;
    float _850 = _848;
    if (_824)
    {
        _638 = _131;
    }
    float _852 = _638;
    float _854 = trunc(_848);
    float _856 = precise::max(_854, 0.0);
    uint _858 = uint(_856);
    float _860 = _852;
    if (!_824)
    {
        _860 = _525;
    }
    float _862 = _860;
    int _864 = _812 * int(_846);
    int _866 = _864 + _786;
    if (_824)
    {
        _850 = 1.0;
    }
    float _868 = _850;
    float _870 = _868;
    if (!_824)
    {
        _870 = 1.2345600128173828125;
    }
    float _872 = _870;
    float _874 = float(uint(_866));
    int _876 = _832 * int(_858);
    int _878 = _876 + _828;
    float _880 = _872 * _862;
    float _882 = as_type<float>(_820) * _874;
    int _884 = ~_559;
    int _886 = _884 + 1;
    float _888 = float(uint(_878));
    float _890 = trunc(_882);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    float _896 = as_type<float>(_601) * _888;
    float _898 = trunc(_896);
    float _900 = precise::max(_898, 0.0);
    uint _902 = uint(_900);
    int _904 = int(_846) + int(_894);
    int _906 = ~_535;
    int _908 = _906 + 1;
    float _910 = floor(_880);
    int _912 = _886 * _904;
    int _914 = _912 + _786;
    int _916 = int(_858) + int(_902);
    float _918 = float(_559);
    float _920 = float(_786);
    int _922 = _908 * _916;
    int _924 = _922 + _828;
    bool _926 = uint(_914) >= uint(_559);
    bool _928 = _920 >= _918;
    bool _930 = isnan(_920);
    bool _932 = _928 || _930;
    bool _934 = isnan(_918);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    bool _940 = uint(_924) >= uint(_535);
    bool _942 = !_926;
    int _944 = _942 ? 0 : (-1);
    float _946 = -_910;
    float _948 = _880 + _946;
    float _950 = trunc(_938);
    int _952 = int(_950);
    bool _954 = !_838;
    int _956 = _954 ? 0 : 1;
    bool _958 = !_940;
    int _960 = _958 ? 0 : (-1);
    float _962 = _948 * _918;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _966 = _964 != 0;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _978 = _976 != 0;
    float _980 = _728 * _918;
    int _982 = ~_904;
    int _984 = _982 + _944;
    int _986 = _984 + 1;
    int _988 = abs(_956);
    float _990 = trunc(_962);
    int _992 = int(_990);
    bool _994 = !_970;
    int _996 = _994 ? 0 : 1;
    int _998 = _559 * _986;
    int _1000 = _998 + _786;
    bool _1002 = _559 == 0;
    int _1004 = abs(_996);
    int _1006 = ~_952;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = trunc(_980);
    int _1014 = int(_1012);
    bool _1016 = !_1002;
    int _1018 = _1016 ? _1000 : (-1);
    int _1020 = ~_916;
    int _1022 = _1020 + _960;
    int _1024 = _1022 + 1;
    bool _1026 = _535 == 0;
    int _1028 = _1018 * _1010;
    int _1030 = _559 + (-1);
    int _1032 = _535 * _1024;
    int _1034 = _1032 + _828;
    bool _1036 = !_978;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1042 = log2(_1040);
    int _1044 = _952 * _1030;
    int _1046 = _1044 + _1028;
    bool _1048 = !_974;
    int _1050 = _1048 ? 0 : 1;
    int _1052 = _992 * _988;
    int _1054 = _1052 + _786;
    bool _1056 = !_966;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = _1046 * _1004;
    bool _1062 = !_1026;
    int _1064 = _1062 ? _1034 : (-1);
    int _1066 = abs(_1058);
    int _1068 = abs(_1050);
    int _1070 = _1064 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = abs(_1038);
    int _1076 = _1014 * _1066;
    int _1078 = _1076 + _1060;
    bool _1080 = uint(_1070) > 1u;
    int _1082 = _1064 & 3;
    bool _1084 = _1082 != 0;
    int _1086 = _1054 * _1068;
    int _1088 = _1086 + _1078;
    float _1090 = _131 * 2.0;
    int _1092 = _1084 ? 0 : 1;
    bool _1094 = _1070 != 3;
    int _1096 = _992 * _1074;
    int _1098 = _1096 + _1088;
    float _1100 = floor(_1090);
    int _1102 = ~_1092;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = _1106;
    if (!_1080)
    {
        int _1110 = ~_1092;
        int _1112 = _1110 + 1;
        _1108 = _1112;
    }
    int _1114 = _1108;
    bool _1116 = uint(_1070) >= 2u;
    float _1118 = float(uint(_1098));
    int _1120 = _1116 ? 0 : 1;
    float _1122 = as_type<float>(_820) * _1118;
    bool _1124 = _131 > 0.5;
    int _1126 = ~_1120;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = trunc(_1122);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = _1130;
    if (_1094)
    {
        int _1140 = ~_1120;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    int _1146 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1148 = _1146 != 0;
    float _1150 = _525 * 2.0;
    float _1152 = -_267;
    int _1154 = _1124 ? as_type<int>(_1152) : as_type<int>(_267);
    bool _1156 = _1100 > 0.0;
    bool _1158 = !_1148;
    float _1160 = _1158 ? _267 : as_type<float>(_1154);
    float _1162 = floor(_1150);
    bool _1164 = _1100 >= 0.0;
    bool _1166 = isnan(_1100);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    int _1174 = ~_559;
    int _1176 = _1174 + 1;
    int _1178 = _1172 ? 0 : 1;
    bool _1180 = _525 > 0.5;
    int _1182 = ~_1178;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = _1186;
    if (!_1156)
    {
        int _1190 = ~_1178;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    int _1196 = _1176 * int(_1136);
    int _1198 = _1196 + _1098;
    float _1200 = _529 * 2.0;
    float _1202 = -_271;
    int _1204 = _1180 ? as_type<int>(_1202) : as_type<int>(_271);
    bool _1206 = _529 > 0.5;
    float _1208 = floor(_1200);
    float _1210 = float(uint(_1198));
    bool _1212 = _1162 > 0.0;
    float _1214 = -_267;
    int _1216 = _1206 ? as_type<int>(_1214) : as_type<int>(_267);
    float _1218 = as_type<float>(_820) * _1210;
    bool _1220 = _1162 >= 0.0;
    bool _1222 = isnan(_1162);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan(0.0);
    bool _1228 = _1224 || _1226;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1218);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1228 ? 0 : 1;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>(_1162);
    if (_824)
    {
        _1246 = 0;
    }
    int _1248 = _1246;
    int _1250 = _1248;
    if (!_824)
    {
        _1250 = 1;
    }
    int _1252 = _1250;
    int _1254 = ~_1240;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    bool _1260 = !_1232;
    float _1262 = _1260 ? _267 : as_type<float>(_1216);
    int _1264 = _1258;
    if (!_1212)
    {
        int _1266 = ~_1240;
        int _1268 = _1266 + 1;
        _1264 = _1268;
    }
    int _1270 = _1264;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1282 = _1280 != 0;
    bool _1284 = _1208 >= 0.0;
    bool _1286 = isnan(_1208);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    int _1294 = int(_1136) + int(_1238);
    int _1296 = _1292 ? 0 : 1;
    bool _1298 = _1252 != 1;
    float _1300 = _145 * _1042;
    int _1302 = _591 * _1294;
    int _1304 = _1302 + _1098;
    bool _1306 = !_1244;
    float _1308 = _1306 ? _271 : as_type<float>(_1204);
    float _1310 = exp2(_1300);
    bool _1312 = _1208 > 0.0;
    bool _1314 = !_1274;
    int _1316 = _1314 ? 0 : 1;
    bool _1318 = uint(_1304) >= uint(_559);
    float _1320 = 0.0;
    if (!_1298)
    {
        _1320 = _525;
    }
    float _1322 = _1320;
    float _1324 = 0.0;
    float _1326 = _1322;
    if (!_1298)
    {
        _1324 = _525;
    }
    float _1328 = _1324;
    float _1330 = 0.0;
    float _1332 = _1328;
    if (!_1298)
    {
        _1330 = _529;
    }
    float _1334 = _1330;
    float _1336 = 0.0;
    float _1338 = _1334;
    if (!_1298)
    {
        _1336 = _529;
    }
    float _1340 = _1336;
    float _1342 = -_1310;
    float _1344 = _1342 + 1.0;
    float _1346 = _1340;
    if (_1298)
    {
        _1326 = _131;
    }
    float _1348 = _1326;
    if (_1298)
    {
        _1332 = _131;
    }
    float _1350 = _1332;
    if (_1298)
    {
        _1338 = _525;
    }
    float _1352 = _1338;
    if (_1298)
    {
        _1346 = _525;
    }
    float _1354 = _1346;
    bool _1356 = !_1318;
    int _1358 = _1356 ? 0 : (-1);
    bool _1360 = !_1072;
    int _1362 = _1360 ? 0 : 1;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1374 = _1372 != 0;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1376;
    int _1380 = ~_1296;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1384;
    if (!_1312)
    {
        int _1388 = ~_1296;
        int _1390 = _1388 + 1;
        _1386 = _1390;
    }
    int _1392 = _1386;
    float _1394 = 1.0 / _1378;
    bool _1396 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1398 = isnan(0.0);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1404 = _1400 || _1402;
    float _1406 = _455 * _211;
    float _1408 = _1404 ? _1344 : 0.0;
    float _1410 = fma(_457, _209, _1406);
    bool _1412 = _537 > 0.5;
    float _1414 = _455 * _225;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1420 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1422 = fma(_457, _223, _1414);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1426 = _519 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1428;
    float _1432 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1434 = 1.0 / _1418;
    float _1436 = _1426 * _1394;
    float _1438 = _131 + _525;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1442 = fma(_1420, -2.0, _539);
    float _1444 = fma(_479, _197, _531);
    float _1446 = _1438 + (-1.0);
    float _1448 = float(uint(_800));
    float _1450 = 1.0 / _1430;
    float _1452 = -_1440;
    float _1454 = fma(_1432, 2.0, _1452);
    float _1456 = fma(_479, _213, _1410);
    float _1458 = fma(_479, _227, _1422);
    float _1460 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1462 = _131 + _529;
    float _1464 = _529 + _525;
    float _1466 = _1444 + _541;
    float _1468 = as_type<float>(_601) * _1448;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1472 = _519 + _1470;
    float _1474 = _1462 + (-1.0);
    float _1476 = _1464 + (-1.0);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1480 = _519 + _1478;
    float _1482 = trunc(_1468);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    float _1488 = _1472 * _1450;
    float _1490 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1494 = _1458 + _561;
    bool _1496 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1498 = isnan(_519);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = _1480 * _1434;
    bool _1510 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1512 = isnan(_519);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1456 + _567;
    float _1524 = fma(_565, _1436, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1526 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1528 = isnan(_519);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = -_1506;
    float _1540 = _1538 + 1.0;
    float _1542 = -_1520;
    float _1544 = _1542 + 1.0;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1558 = _1520 * _1540;
    int _1560 = ~_535;
    int _1562 = _1560 + 1;
    float _1564 = _553 * _1544;
    float _1566 = -_553;
    float _1568 = _1566 + 1.0;
    float _1570 = -_145;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1454);
    float _1574 = fma(_1552, _1508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1576 = _1562 * int(_1486);
    int _1578 = _1576 + _800;
    float _1580 = _1536 * _1568;
    float _1582 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1442);
    float _1584 = _1308 + (-0.5);
    float _1586 = fma(_1556, _1508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1588 = float(uint(_1578));
    float _1590 = _1524 * _1580;
    float _1592 = -_1584;
    float _1594 = -_1582;
    float _1596 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1594);
    float _1598 = _1160 + 0.5;
    float _1600 = as_type<float>(_601) * _1588;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1572);
    float _1606 = fma(_1548, _1436, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1610 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1602);
    float _1612 = float(uint(_1054));
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1616 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1608);
    float _1618 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1620 = trunc(_1600);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    float _1626 = as_type<float>(_820) * _1612;
    float _1628 = _1606 * _1580;
    float _1630 = -_1614;
    float _1632 = fma(_1618, 2.0, _1630);
    float _1634 = -_1536;
    float _1636 = _1634 + 1.0;
    bool _1638 = !_1282;
    int _1640 = _1638 ? 0 : 1;
    float _1642 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1644 = trunc(_1626);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1652 = !_1278;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1628);
    int _1658 = ~_559;
    int _1660 = _1658 + 1;
    float _1662 = fma(_1642, -2.0, _1650);
    int _1664 = abs(_1640);
    float _1666 = _1408 * _611;
    int _1668 = abs(_1316);
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1672 = _1522 + _1670;
    int _1674 = ~_535;
    int _1676 = _1674 + 1;
    float _1678 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1590);
    int _1680 = abs(_1654);
    float _1682 = -_145;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1632);
    float _1686 = float(_1194);
    float _1688 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1662);
    int _1690 = ~_1294;
    int _1692 = _1690 + _1358;
    int _1694 = _1692 + 1;
    int _1696 = _1660 * int(_1648);
    int _1698 = _1696 + _1054;
    float _1700 = float(_1270);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1466 + _1702;
    float _1706 = float(_1664);
    int _1708 = _559 * _1694;
    int _1710 = _1708 + _1098;
    float _1712 = float(_1668);
    float _1714 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1716 = int(_1486) + int(_1624);
    float _1718 = _1706 * _1700;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1722 = _1494 + _1720;
    float _1724 = float(uint(_1698));
    float _1726 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1610);
    int _1728 = _1064 >> 31;
    int _1730 = _1676 * _1716;
    int _1732 = _1730 + _800;
    bool _1734 = !_1002;
    int _1736 = _1734 ? _1710 : (-1);
    float _1738 = as_type<float>(_820) * _1724;
    float _1740 = -_271;
    int _1742 = _1412 ? as_type<int>(_1740) : as_type<int>(_271);
    float _1744 = _1262 + 0.5;
    int _1746 = _1728 & 3;
    float _1748 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1616);
    bool _1750 = uint(_1732) >= uint(_535);
    float _1752 = trunc(_1738);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = _1736 >> 31;
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1684);
    int _1762 = _1064 + _1746;
    float _1764 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1714);
    int _1766 = _1758 & 3;
    float _1768 = -_1748;
    float _1770 = _1768 + 1.0;
    bool _1772 = !_1374;
    float _1774 = _1772 ? _271 : as_type<float>(_1742);
    float _1776 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1764);
    int _1778 = _1736 + _1766;
    int _1780 = _1762 >> 2;
    bool _1782 = _1070 != 3;
    int _1784 = _1780 << 4;
    int _1786 = _1784 + 368;
    float _1788 = in.m_66.x;
    float _1790 = in.m_66.y;
    float _1792 = in.m_66.z;
    int _1794 = _1778 >> 2;
    float _1796 = float(_1680);
    uint _1798 = uint(int(uint(_1786) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    bool _1814 = !_1782;
    int _1816 = _1814 ? 0 : (-1);
    bool _1818 = !_1750;
    int _1820 = _1818 ? 0 : (-1);
    float _1822 = _1796 * _1686;
    int _1824 = _1736 & 3;
    bool _1826 = _1824 != 0;
    float _1828 = _1774 + (-0.5);
    int _1830 = _1736 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = _1794 << 4;
    int _1836 = _1834 + 512;
    float _1838 = -_1828;
    float _1840 = -_1688;
    float _1842 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1840);
    bool _1844 = !_1832;
    int _1846 = _1844 ? 0 : 1;
    int _1848 = _1786 + 8;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[int(_1860)][_1862];
    bool _1866 = uint(_1830) > 1u;
    float _1868 = _131 + (-0.5);
    float _1870 = float(_1392);
    int _1872 = int(_1648) + int(_1756);
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1876 = ~_1716;
    int _1878 = _1876 + _1820;
    int _1880 = _1878 + 1;
    uint _1882 = uint(int(uint(_1836) >> uint(2)));
    uint _1884 = uint(int(uint(int(_1882)) >> uint(2)));
    int _1886 = int(_1882) & 3;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[int(_1884)][_1886];
    int _1890 = int(_1882) + 1;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    int _1894 = _1890 & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    float _1898 = _1712 * _1870;
    int _1900 = _1826 ? 0 : 1;
    int _1902 = _595 * _1872;
    int _1904 = _1902 + _1054;
    bool _1906 = _1776 >= 0.0;
    float _1908 = _1898 * (-2.0);
    int _1910 = ~_1900;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1874);
    int _1918 = _1914;
    float _1920 = _1898;
    if (!_1866)
    {
        int _1922 = ~_1900;
        int _1924 = _1922 + 1;
        _1918 = _1924;
    }
    int _1926 = _1918;
    float _1928 = fma(_1908, _1788, _1788);
    int _1930 = _1836 + 8;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
    int _1936 = int(_1932) & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = int(_1932) + 1;
    uint _1942 = uint(int(uint(_1940) >> uint(2)));
    int _1944 = _1940 & 3;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[int(_1942)][_1944];
    bool _1948 = uint(_1830) >= 2u;
    float _1950 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1928);
    int _1952 = abs(_1114);
    int _1954 = _535 * _1880;
    int _1956 = _1954 + _800;
    int _1958 = _1948 ? 0 : 1;
    float _1960 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1916);
    bool _1962 = uint(_1904) >= uint(_559);
    float _1964 = fma(_1460, _1908, _1460);
    float _1966 = _1792;
    if (_1906)
    {
        _1920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1968 = _1920;
    int _1970 = as_type<int>(_1968);
    if (_1906)
    {
        out.m_47.x = 0.0;
    }
    bool _1972 = !_1962;
    int _1974 = _1972 ? 0 : (-1);
    bool _1976 = _1830 != 3;
    if (_1906)
    {
        float _1978 = _1968 * 5.0;
        _1970 = as_type<int>(_1978);
    }
    int _1980 = _1970;
    int _1982 = ~_1872;
    int _1984 = _1982 + _1974;
    int _1986 = _1984 + 1;
    int _1988 = abs(_1926);
    if (_1906)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6421 = as_type<float>(_1980);
        out.gl_Position.z = _6421;
    }
    bool _1990 = !_1976;
    int _1992 = _1990 ? 0 : (-1);
    int _1994 = _559 * _1986;
    int _1996 = _1994 + _1054;
    bool _1998 = _1830 != 3;
    int _2000 = abs(_1144);
    bool _2002 = _535 == 0;
    bool _2004 = !_2002;
    int _2006 = _2004 ? _1956 : (-1);
    int _2008 = ~_1952;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = abs(_1362);
    int _2016 = _2012 * as_type<int>(_1812);
    int _2018 = ~_1988;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = ~_2014;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2022 * as_type<int>(_1896);
    int _2032 = ~_1958;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    int _2038 = _2028 * as_type<int>(_1804);
    int _2040 = _2038 + _2016;
    int _2042 = ~_2000;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = abs(_1846);
    int _2050 = _2036;
    if (_1998)
    {
        int _2052 = ~_1958;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    int _2058 = _2046 * as_type<int>(_1856);
    int _2060 = _2058 + _2040;
    int _2062 = ~_2048;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    int _2068 = abs(_2056);
    bool _2070 = !_1366;
    int _2072 = _2070 ? 0 : 1;
    int _2074 = _2066 * as_type<int>(_1888);
    int _2076 = _2074 + _2030;
    int _2078 = abs(_1816);
    int _2080 = abs(_1992);
    int _2082 = ~_2068;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    bool _2088 = !_1370;
    int _2090 = _2088 ? 0 : 1;
    int _2092 = abs(_2072);
    int _2094 = _2086 * as_type<int>(_1938);
    int _2096 = _2094 + _2076;
    int _2098 = ~_2078;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    int _2104 = ~_2080;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = abs(_2090);
    int _2112 = _2102 * as_type<int>(_1864);
    int _2114 = _2112 + _2060;
    float _2116 = _1672 * _1672;
    int _2118 = _2108 * as_type<int>(_1946);
    int _2120 = _2118 + _2096;
    int _2122 = ~_2110;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = fma(_1704, _1704, _2116);
    int _2130 = _2120 * _2126;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2134 = ~_2092;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = fma(_1722, _1722, _2128);
    bool _2142 = !_1002;
    int _2144 = _2142 ? _1996 : (-1);
    float _2146 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2132);
    bool _2148 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2150 = isnan(1.0);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2156 = _2152 || _2154;
    int _2158 = _2114 * _2138;
    float _2160 = rsqrt(_2140);
    float _2162 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2146);
    int _2164 = _2006 * _2092;
    int _2166 = _2164 + _2158;
    int _2168 = _2144 * _2110;
    int _2170 = _2168 + _2130;
    float _2172 = -_2162;
    float _2174 = _2172 + 1.0;
    float _2176 = -_1726;
    float _2178 = _2176 + 1.0;
    float _2180 = -_1960;
    float _2182 = _2180 + 1.0;
    bool _2184 = !_2156;
    float _2186 = _2184 ? _145 : _1666;
    float _2188 = fma(_1308, _2174, _1596);
    float _2190 = -_2178;
    float _2192 = fma(_1262, _2190, _1760);
    float _2194 = -_2182;
    float _2196 = fma(_1160, _2194, _1604);
    float _2198 = fma(_1774, _1770, _1842);
    float _2200 = float(_2166);
    float _2202 = fma(_2186, _1964, _1950);
    float _2204 = float(_2170);
    float _2206 = _1672 * _2160;
    float _2208 = _1704 * _2160;
    out.m_68.x = _2196;
    out.m_68.y = _2188;
    out.m_68.z = _2192;
    out.m_68.w = _2198;
    float _2210 = -_2206;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _2214 = -_2208;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    out.m_70.x = _2200;
    out.m_70.y = _2204;
    float _2218 = _2212 * _2212;
    if (_1906)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2220 = -_2206;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _2224 = _1722 * _2160;
    float _2226 = -_2208;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1466);
    float _2230 = fma(_2216, _2216, _2218);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = _2222 + _2232;
    float _2236 = -_2224;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _2240 = -_2224;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _2228 + _2244;
    float _2248 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2250 = fma(_2238, _2238, _2230);
    float _2252 = _1822 * (-2.0);
    float _2254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2256 = _2242 + _2254;
    float _2258 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2248);
    float _2260 = _525 + (-0.5);
    float _2262 = fma(_2252, _1790, _1790);
    float _2264 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2258);
    float _2266 = fma(_1492, _2252, _1492);
    float _2268 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2262);
    float _2270 = _1718 * (-2.0);
    float _2272 = in.m_58.x;
    float _2274 = in.m_58.y;
    bool _2276 = _2264 >= 0.0;
    float _2278 = fma(_1586, _1564, _1678);
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2282 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2280;
    float _2284 = fma(_2270, _1792, _1792);
    float _2286 = _529 + (-0.5);
    float _2288 = fma(_2186, _2266, _2268);
    float _2290 = fma(_2282, _1488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2292 = fma(_1490, _2270, _1490);
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2284);
    float _2296 = _2202 * 0.15915493667125701904296875;
    float _2298 = _2288 * 0.15915493667125701904296875;
    float _2300 = fma(_2290, _1558, _2278);
    if (_2276)
    {
        _1966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _1966;
    float _2304 = fma(_2186, _2292, _2294);
    float _2306 = _2296 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2310;
    int _2314 = as_type<int>(_2302);
    if (_2276)
    {
        out.m_47.x = 0.0;
    }
    if (_2276)
    {
        float _2316 = _2302 * 5.0;
        _2314 = as_type<int>(_2316);
    }
    int _2318 = _2314;
    float _2320 = fma(_1574, _1564, _1656);
    float _2322 = fma(_2312, _1488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2324 = _2304 * 0.15915493667125701904296875;
    float _2326 = _2296 * 6.283185482025146484375;
    float _2328 = cos(_2326);
    float _2330 = _2298 * 6.283185482025146484375;
    float _2332 = sin(_2330);
    float _2334 = _2298 * 6.283185482025146484375;
    float _2336 = cos(_2334);
    float _2338 = sqrt(_2250);
    float _2340 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2300);
    float _2342 = _2340 * _2274;
    if (_2276)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6956 = as_type<float>(_2318);
        out.gl_Position.z = _6956;
    }
    if (_2276)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2344 = _2342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2346 = _2160 * _2338;
    float _2348 = _2324 * 6.283185482025146484375;
    float _2350 = cos(_2348);
    float _2352 = fma(_2322, _1558, _2320);
    float _2354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _271);
    float _2356 = _2346 * _2344;
    float _2358 = _2328 * _2336;
    float _2360 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2352);
    float _2362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _267);
    float _2364 = _2354 * _2356;
    float _2366 = _2324 * 6.283185482025146484375;
    float _2368 = sin(_2366);
    float _2370 = _2360 * _2272;
    float _2372 = _2308 * _2332;
    float _2374 = _2328 * _2332;
    float _2376 = _271 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2378 = _2370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2380 = _2308 * _2336;
    float _2382 = _2328 * _2350;
    float _2384 = _2346 * _2378;
    float _2386 = _2336 * _2350;
    float _2388 = _2308 * _2350;
    float _2390 = _2332 * _2350;
    float _2392 = _2362 * _2384;
    float _2394 = _2382 * _2364;
    float _2396 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2398 = _2396 * 0.5;
    float _2400 = fma(_2368, _2358, _2372);
    float _2402 = -_2380;
    float _2404 = fma(_2368, _2374, _2402);
    float _2406 = -_2364;
    float _2408 = _2368 * _2406;
    float _2410 = _2388 * _2364;
    float _2412 = fma(_2400, _2392, _2394);
    float _2414 = -_2374;
    float _2416 = fma(_2368, _2380, _2414);
    float _2418 = fma(_2386, _2392, _2408);
    float _2420 = fma(_2368, _2372, _2358);
    float _2422 = fma(_2404, _2398, _2412);
    float _2424 = fma(_2416, _2392, _2410);
    float _2426 = fma(_2390, _2398, _2418);
    float _2428 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2430 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2432 = fma(_2420, _2398, _2424);
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2436 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2438 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2430);
    float _2440 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2442 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2434);
    float _2444 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2428);
    float _2446 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2438);
    float _2448 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2450 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2442);
    float _2452 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2440);
    float _2454 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2456 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2460 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2462 = _1494 + _2454;
    float _2464 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2456);
    float _2466 = _1466 + _2458;
    float _2468 = fma(_2376, _2376, 1.0);
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2472 = _2462 + _2470;
    float _2474 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2478 = _2466 + _2476;
    float _2480 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = _2472 * _2472;
    float _2484 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2486 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2452);
    float _2488 = rsqrt(_2468);
    float _2490 = fma(_2478, _2478, _2482);
    float _2492 = -_2368;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2460);
    float _2496 = -_2368;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2474);
    float _2500 = -_2368;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2504 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2506 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2484);
    float _2508 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2510 = sqrt(_2490);
    float _2512 = _2486 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2514 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2504);
    float _2516 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2508);
    float _2518 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2494);
    float _2520 = _1522 + _2512;
    float _2522 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2514);
    float _2524 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2506);
    float _2526 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    float _2528 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    float _2530 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2502);
    bool _2532 = _2510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2534 = _2420;
    float _2536 = _2512;
    float _2538 = _2426;
    if (!_2532)
    {
        _2534 = _2466;
    }
    float _2540 = _2534;
    float _2542 = _2540;
    if (!_2532)
    {
        _2536 = _2462;
    }
    float _2544 = _2536;
    float _2546 = _2544;
    if (!_2532)
    {
        _2538 = _2520;
    }
    float _2548 = _2538;
    bool _2550 = !_2532;
    float _2552 = _2548;
    if (!_2550)
    {
        float _2554 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2558 = _2510 + _2556;
        float _2560 = rsqrt(_2490);
        float _2562 = _2558 * _2554;
        float _2564 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = _2562 * 0.15915493667125701904296875;
        float _2568 = _2566 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = _2566 * 6.283185482025146484375;
        float _2574 = sin(_2572);
        float _2576 = _2570 + (-1.0);
        float _2578 = fma(_2574, _2564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2582 = _2560 * _2578;
        float _2584 = fma(_2520, _2570, _2580);
        float _2586 = fma(_2478, _2582, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2588 = fma(_2472, _2582, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2552 = _2584;
        _2542 = _2586;
        _2546 = _2588;
    }
    float _2590 = _2552;
    float _2592 = _2542;
    float _2594 = _2546;
    float _2596 = -_1522;
    float _2598 = _2596 + _2590;
    float _2600 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2602 = -_1466;
    float _2604 = _2602 + _2592;
    float _2606 = _267 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2608 = _2598 * _2598;
    float _2610 = -_1494;
    float _2612 = _2610 + _2594;
    float _2614 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2464);
    float _2616 = _2376 * _2488;
    float _2618 = fma(_2604, _2604, _2608);
    float _2620 = _2376 * _2518;
    float _2622 = _2376 * _2528;
    float _2624 = _2376 * _2530;
    float _2626 = fma(_2612, _2612, _2618);
    float _2628 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2448);
    float _2630 = -_2522;
    float _2632 = _2616 * _2630;
    float _2634 = -_2524;
    float _2636 = _2616 * _2634;
    float _2638 = sqrt(_2626);
    float _2640 = -_2526;
    float _2642 = _2616 * _2640;
    float _2644 = fma(_2606, _2614, _2620);
    float _2646 = fma(_2606, _2600, _2622);
    float _2648 = fma(_2606, _2628, _2624);
    float _2650 = fma(_2488, _2518, _2632);
    float _2652 = fma(_2488, _2528, _2636);
    float _2654 = fma(_2488, _2530, _2642);
    float _2656 = _2522 + _2644;
    float _2658 = _2524 + _2646;
    float _2660 = _2526 + _2648;
    out.m_72.x = _2614;
    out.m_72.y = _2600;
    out.m_72.z = _2628;
    out.m_74.x = _2650;
    out.m_74.y = _2652;
    out.m_74.z = _2654;
    bool _2662 = _2638 > 0.0;
    out.m_76.x = _2656;
    out.m_76.y = _2658;
    out.m_76.z = _2660;
    bool _2664 = !_2662;
    float _2666 = _2644;
    float _2668 = _2652;
    float _2670 = _2600;
    float _2672 = _2592;
    float _2674 = _2590;
    float _2676 = _2594;
    float _2678 = _2600;
    if (!_2664)
    {
        bool _2680 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2682 = _2614;
        if (_2680)
        {
            float _2684 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2682 = _2684;
        }
        float _2686 = _2682;
        float _2688 = _2686;
        if (_2680)
        {
            float _2690 = _481 * _2686;
            _2666 = _2690;
        }
        float _2692 = _2666;
        float _2694 = _2692;
        if (_2680)
        {
            float _2696 = _483 * _2686;
            _2668 = _2696;
        }
        float _2698 = _2668;
        float _2700 = _2698;
        if (_2680)
        {
            float _2702 = _485 * _2686;
            _2670 = _2702;
        }
        float _2704 = _2670;
        float _2706 = _2704;
        if (!_2680)
        {
            bool _2708 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2710 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2712 = _2708 || _2710;
            bool _2714 = isnan(1.0);
            bool _2716 = _2712 || _2714;
            float _2718 = _145 + 1.0;
            float _2720 = _2718;
            if (!_2716)
            {
                float _2722 = _2718 * _2718;
                float _2724 = _2722 * 0.5;
                _2688 = _2724;
            }
            float _2726 = _2688;
            float _2728 = _2726;
            if (!_2716)
            {
                float _2730 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2728 = _2730;
            }
            float _2732 = _2728;
            bool _2734 = !_2716;
            float _2736 = _2732;
            if (!_2734)
            {
                float _2738 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2740 = log2(_2738);
                float _2742 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2744 = _2740 * _2718;
                float _2746 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2748 = 1.0 + _2746;
                float _2750 = 1.0 / _2748;
                float _2752 = _2742 * 0.693147182464599609375;
                float _2754 = exp2(_2744);
                float _2756 = 1.0 / _2752;
                float _2758 = _2754 + (-1.0);
                float _2760 = -_2758;
                float _2762 = fma(_2760, _2756, _2718);
                float _2764 = _2762 * _2750;
                float _2766 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2736 = _2766;
            }
            float _2768 = _2736;
            float _2770 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2772 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2774 = !_2716;
            if (!_2774)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = 1.0 / _2782;
                float _2786 = _2778 * _2718;
                float _2788 = exp2(_2786);
                float _2790 = -_2788;
                float _2792 = _2790 + 1.0;
                float _2794 = _2792 * _2784;
                _2720 = _2794;
            }
            float _2796 = _2720;
            float _2798 = fma(_2796, _183, _2772);
            float _2800 = fma(_2796, _181, _2770);
            float _2802 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2804 = -_441;
            float _2806 = _2804 + _2798;
            float _2808 = -_447;
            float _2810 = _2808 + _2800;
            float _2812 = fma(_2796, _185, _2802);
            float _2814 = _2806 * _195;
            float _2816 = _2806 * _211;
            float _2818 = _2806 * _225;
            float _2820 = -_453;
            float _2822 = _2820 + _2812;
            float _2824 = fma(_2810, _193, _2814);
            float _2826 = fma(_2810, _209, _2816);
            float _2828 = fma(_2810, _223, _2818);
            float _2830 = fma(_2822, _197, _2824);
            float _2832 = fma(_2822, _213, _2826);
            float _2834 = fma(_2822, _227, _2828);
            _489 = _2832;
            _491 = _2830;
            _493 = _2834;
            _2694 = _2830;
            _2700 = _2832;
            _2706 = _2834;
        }
        float _2836 = _489;
        float _2838 = _491;
        float _2840 = _493;
        float _2842 = _2694;
        float _2844 = _2700;
        float _2846 = _2706;
        float _2848 = _2836 * _2836;
        float _2850 = fma(_2838, _2838, _2848);
        float _2852 = fma(_2840, _2840, _2850);
        float _2854 = rsqrt(_2626);
        float _2856 = sqrt(_2852);
        float _2858 = _2604 * _2854;
        float _2860 = _2598 * _2854;
        float _2862 = _2612 * _2854;
        bool _2864 = _2856 > 0.0;
        bool _2866 = !_2864;
        _2678 = _2846;
        if (!_2866)
        {
            float _2868 = rsqrt(_2852);
            float _2870 = _2868 * _2836;
            float _2872 = _2868 * _2838;
            float _2874 = _2868 * _2840;
            float _2876 = _2860 * _2870;
            float _2878 = fma(_2858, _2872, _2876);
            float _2880 = fma(_2862, _2874, _2878);
            float _2882 = _2880 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2884 = fma(_2842, _2882, _2592);
            float _2886 = fma(_2844, _2882, _2590);
            float _2888 = fma(_2846, _2882, _2594);
            _2672 = _2884;
            _2674 = _2886;
            _2676 = _2888;
        }
    }
    float _2890 = _2672;
    float _2892 = _2674;
    float _2894 = _2676;
    float _2896 = _2678;
    bool _2898 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2900 = isnan(0.5);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2906 = _2902 || _2904;
    float _2908 = -_2208;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2890);
    float _2912 = -_2206;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2892);
    float _2916 = -_2224;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2894);
    float _2920 = _2914;
    float _2922 = _2910;
    float _2924 = _2918;
    float _2926 = _2896;
    if (!_2906)
    {
        float _2928 = _2234 * _2234;
        float _2930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2932 = -_1494;
        float _2934 = _2932 + _2894;
        float _2936 = -_1466;
        float _2938 = _2936 + _2890;
        float _2940 = fma(_2246, _2246, _2928);
        float _2942 = -_1522;
        float _2944 = _2942 + _2892;
        float _2946 = fma(_2256, _2256, _2940);
        float _2948 = 1.0 / _2346;
        float _2950 = sqrt(_2946);
        float _2952 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2954 = precise::min(_2950, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2930;
        float _2958 = _2956 * _2948;
        float _2960 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2962 = _2934 * _2958;
        float _2964 = _2960 * _2958;
        float _2966 = fma(_2960, _2962, _2242);
        float _2968 = fma(_2938, _2964, _2228);
        float _2970 = fma(_2944, _2964, _2222);
        _2920 = _2970;
        _2922 = _2968;
        _2924 = _2966;
    }
    float _2972 = _2920;
    float _2974 = _2922;
    float _2976 = _2924;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2980 = _2972 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2984 = _2974 + _2982;
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2976 + _2986;
    float _2990 = _2980 * _2980;
    float _2992 = fma(_2984, _2984, _2990);
    float _2994 = fma(_2988, _2988, _2992);
    float _2996 = rsqrt(_2994);
    float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3000 = _2984 * _2998;
    float _3002 = _2988 * _2998;
    float _3004 = _3000 * _3000;
    float _3006 = _3002 * _3002;
    float _3008 = _3004 + _3006;
    float _3010 = sqrt(_3008);
    bool _3012 = _3010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3016 = _3010 + _3014;
    float _3018 = _2996;
    float _3020 = _3016;
    float _3022 = _2980;
    float _3024 = _2998;
    if (_3012)
    {
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3026;
    }
    float _3028 = _3018;
    float _3030 = _3028;
    if (_3012)
    {
        float _3032 = _3016 * _3028;
        _3020 = _3032;
    }
    float _3034 = _3020;
    if (_3012)
    {
        float _3036 = rsqrt(_3008);
        _3030 = _3036;
    }
    float _3038 = _3030;
    float _3040 = _3038;
    if (_3012)
    {
        float _3042 = _3034 * 0.15915493667125701904296875;
        _217 = _3042;
    }
    float _3044 = _217;
    float _3046 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3048 = _2988;
    float _3050 = _3044;
    if (_3012)
    {
        float _3052 = _3044 * 6.283185482025146484375;
        float _3054 = sin(_3052);
        _3048 = _3054;
    }
    float _3056 = _3048;
    float _3058 = precise::max(0.0, _3046);
    float _3060 = _1522;
    if (_3012)
    {
        float _3062 = _3044 * 6.283185482025146484375;
        float _3064 = cos(_3062);
        _3060 = _3064;
    }
    float _3066 = _3060;
    float _3068 = -_2998;
    float _3070 = -_3058;
    float _3072 = fma(_2980, _3068, _3070);
    if (_3012)
    {
        float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3022 = _3074;
    }
    float _3076 = _3022;
    float _3078 = sqrt(_2994);
    float _3080 = _3056;
    float _3082 = _3076;
    if (_3012)
    {
        float _3084 = fma(_3056, _3076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3080 = _3084;
    }
    float _3086 = _3080;
    float _3088 = _3086;
    if (!_3012)
    {
        _3050 = _3004;
    }
    float _3090 = _3050;
    float _3092 = _3090;
    if (_3012)
    {
        float _3094 = _3038 * _3086;
        _2926 = _3094;
    }
    float _3096 = _2926;
    if (!_3012)
    {
        _3040 = _3000;
    }
    float _3098 = _3040;
    float _3100 = _3098;
    float _3102 = _3066;
    if (_3012)
    {
        float _3104 = _3066 + (-1.0);
        _3082 = _3104;
    }
    float _3106 = _3082;
    float _3108 = _3106;
    if (_3012)
    {
        float _3110 = _3000 * _3096;
        _3100 = _3110;
    }
    float _3112 = _3100;
    if (!_3012)
    {
        _3088 = _3072;
    }
    float _3114 = _3088;
    float _3116 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3118 = _3114;
    if (_3012)
    {
        float _3120 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3024 = _3120;
    }
    float _3122 = _3024;
    if (!_3012)
    {
        _3108 = _3002;
    }
    float _3124 = _3108;
    float _3126 = _3124;
    if (_3012)
    {
        float _3128 = _3002 * _3096;
        _3126 = _3128;
    }
    float _3130 = _3126;
    if (_3012)
    {
        float _3132 = _3112 * _3112;
        _3092 = _3132;
    }
    float _3134 = _3092;
    if (_3012)
    {
        float _3136 = fma(_3072, _3066, _3122);
        _3118 = _3136;
    }
    float _3138 = _3118;
    if (!_3012)
    {
        _3102 = _3006;
    }
    float _3140 = _3102;
    float _3142 = _3140;
    if (_3012)
    {
        float _3144 = _3130 * _3130;
        _3142 = _3144;
    }
    float _3146 = _3142;
    float _3148 = fma(_3138, _3138, _3134);
    float _3150 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3152 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3154 = _3148 + _3146;
    float _3156 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3116);
    float _3158 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3162 = fma(_3078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3160);
    float _3164 = precise::clamp(_3162, 0.0, 1.0);
    float _3166 = rsqrt(_3154);
    float _3168 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3156);
    float _3170 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3172 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3158);
    float _3174 = -_3164;
    float _3176 = _3174 + 1.0;
    float _3178 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3180 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3170);
    float _3182 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3172);
    float _3184 = abs(_3176);
    float _3186 = log2(_3184);
    float _3188 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3190 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3180);
    float _3192 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3194 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3152);
    float _3196 = -_3188;
    float _3198 = fma(_3196, _3150, 1.0);
    float _3200 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3202 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3204 = _3166 * _3112;
    float _3206 = _3166 * _3138;
    float _3208 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3194);
    float _3210 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3202);
    float _3212 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3214 = _3166 * _3130;
    float _3216 = _3208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3218 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3210);
    float _3220 = -_3212;
    float _3222 = fma(_3206, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3220);
    float _3224 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3226 = log2(_3198);
    float _3228 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3218);
    float _3230 = -_3214;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3222);
    float _3234 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3236 = fma(_3232, -0.5, 0.5);
    float _3238 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3234);
    float _3240 = exp2(_3224);
    float _3242 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3244 = fma(_3232, 0.5, 0.5);
    float _3246 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3238);
    float _3248 = _3206 + 1.0;
    float _3250 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3242);
    float _3252 = fma(_3244, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3254 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3246);
    float _3256 = 1.0 / _3228;
    float _3258 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3250);
    float _3260 = fma(_3244, _3252, -0.212114393711090087890625);
    float _3262 = _3226 * 0.693147182464599609375;
    float _3264 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3258);
    float _3266 = fma(_3244, _3260, 1.570728778839111328125);
    float _3268 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3270 = sqrt(_3236);
    float _3272 = -_3206;
    float _3274 = fma(_3240, _3248, _3272);
    float _3276 = fma(_3274, 0.5, 0.5);
    float _3278 = _3254 * _3256;
    float _3280 = _3264 * _3256;
    float _3282 = fma(_3278, 0.5, 0.5);
    float _3284 = fma(_3280, -0.5, 0.5);
    float _3286 = _3270 * 0.636619746685028076171875;
    float3 _8509 = float3(_3282, _3284, _3268);
    float _3288 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8509, float3(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8509, float3(0.0), isnan(_8509)), level(0.0)).x;
    float3 _8520 = float3(_3282, _3284, _3268);
    float4 _3291 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8520, float3(0.0), isnan(_8520)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8520, float3(0.0), isnan(_8520)), level(0.0)).xyzw;
    float _3293 = _3291.x;
    float _3295 = _3291.y;
    float _3297 = _3291.z;
    float _3299 = _3291.w;
    float _3301 = -_3266;
    float _3303 = fma(_3286, _3301, 1.0);
    float2 _8542 = float2(_3303, _3276);
    float3 _3307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8542, float2(0.0), isnan(_8542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8542, float2(0.0), isnan(_8542)), level(0.0)).xyz;
    float _3309 = _3307.x;
    float _3311 = _3307.y;
    float _3313 = _3307.z;
    float _3315 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3317 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3319 = _3228 * 0.5;
    out.m_78.x = _2228;
    out.m_78.y = _2222;
    bool _3321 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3323 = isnan(_3078);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3329 = _3325 || _3327;
    float _3331 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3317);
    float _3333 = exp2(_3315);
    out.m_80.x = _2974;
    out.m_80.y = _2972;
    out.m_80.z = _2976;
    float _3335 = _3254 + _3228;
    float _3337 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3331);
    float _3339 = fma(_3264, -0.5, _3319);
    float _3341 = _3335 * 0.5;
    float _3343 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3337);
    float _3345 = _3343 + _3228;
    out.gl_Position.x = _3254;
    out.gl_Position.y = _3264;
    out.gl_Position.z = _3343;
    out.gl_Position.w = _3228;
    float _3347 = _3345 * 0.5;
    float _3349 = -_3333;
    float _3351 = _3349 + 1.0;
    float _3353 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _3341;
    out.m_82.y = _3339;
    out.m_82.z = _3347;
    out.m_82.w = _3228;
    float _3355 = -_3353;
    float _3357 = _3355 + 1.0;
    float _3359 = _3228;
    float _3361 = _3343;
    float _3363 = _3264;
    float _3365 = _3254;
    float _3367 = _3339;
    float _3369 = _3341;
    if (!_3329)
    {
        _3359 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3371 = _3359;
    float _3373 = _3371;
    float _3375 = _3371;
    if (!_3329)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3377 = _3361;
    float _3379 = _3377;
    float _3381 = _3377;
    if (!_3329)
    {
        _3363 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3383 = _3363;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3329)
    {
        _3365 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3389 = _3365;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3329)
    {
        _3367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3395 = _3367;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3329)
    {
        _3369 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3401 = _3369;
    float _3403 = _3353 * _3288;
    float _3405 = _3299 * _3403;
    float _3407 = _3299 * _3357;
    float _3409 = _3313 * _3403;
    float _3411 = fma(_3309, _3405, _3293);
    float _3413 = fma(_3311, _3405, _3295);
    float _3415 = fma(_3299, _3409, _3297);
    out.m_84.x = _3411;
    out.m_84.y = _3413;
    out.m_84.z = _3415;
    out.m_84.w = _3407;
    bool _3417 = !_3329;
    float _3419 = _3401;
    float _3421 = _3401;
    if (!_3417)
    {
        bool _3423 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3425 = isnan(_3078);
        bool _3427 = _3423 || _3425;
        bool _3429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3431 = _3427 || _3429;
        if (!_3431)
        {
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3435 = _3078 + _3433;
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3439 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3437;
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3443 = _3441 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3445 = 1.0 / _3439;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3463 = _3435 * _3445;
            float _3465 = precise::clamp(_3463, 0.0, 1.0);
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3471 = fma(_3465, _3443, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3473 = fma(_3465, _3469, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3475 = fma(_3465, _3449, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3477 = fma(_3465, _3453, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3479 = fma(_3465, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3481 = fma(_3465, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3421 = _3475;
            _3387 = _3479;
            _3399 = _3471;
            _3381 = _3477;
            _3375 = _3473;
            _3393 = _3481;
            _3483 = true;
        }
        else
        {
            bool _3485 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3487 = isnan(_3078);
            bool _3489 = _3485 || _3487;
            bool _3491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3493 = _3489 || _3491;
            if (!_3493)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3495 = _3397;
            _3399 = _3495;
            if (!_3493)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3497 = _3419;
            _3421 = _3497;
            if (!_3493)
            {
                _3373 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3499 = _3373;
            _3375 = _3499;
            if (!_3493)
            {
                _3379 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3501 = _3379;
            _3381 = _3501;
            if (!_3493)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3503 = _3385;
            _3387 = _3503;
            if (!_3493)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3505 = _3391;
            bool _3507 = !_3493;
            _3393 = _3505;
            if (!_3507)
            {
                bool _3509 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3511 = isnan(_3078);
                bool _3513 = _3509 || _3511;
                bool _3515 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3517 = _3513 || _3515;
                if (!_3517)
                {
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3521 = _3078 + _3519;
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3525 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3523;
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3531 = 1.0 / _3525;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3549 = _3521 * _3531;
                    float _3551 = precise::clamp(_3549, 0.0, 1.0);
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3557 = fma(_3551, _3529, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3559 = fma(_3551, _3555, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3561 = fma(_3551, _3535, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3563 = fma(_3551, _3539, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3565 = fma(_3551, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3567 = fma(_3551, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3421 = _3561;
                    _3387 = _3565;
                    _3399 = _3557;
                    _3381 = _3563;
                    _3375 = _3559;
                    _3393 = _3567;
                    _3483 = true;
                }
                else
                {
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3381 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3375 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3483 = false;
    float _3569 = _3421;
    float _3571 = _3387;
    float _3573 = _3399;
    float _3575 = _3381;
    float _3577 = _3375;
    float _3579 = _3393;
    float _3581 = fma(_2658, -0.5, 0.5);
    float _3583 = precise::clamp(_3581, 0.0, 1.0);
    float _3585 = -_3569;
    float _3587 = _3585 + _3571;
    float _3589 = -_3573;
    float _3591 = _3589 + _3575;
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    bool _3597 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3599 = fma(_3583, _3587, _3569);
    float _3601 = fma(_3583, _3591, _3573);
    float _3603 = fma(_3583, _3595, _3577);
    float _3605 = _3599 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3607 = fma(_3601, 0.298911988735198974609375, _3605);
    float _3609 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3611 = fma(_3603, 0.114477999508380889892578125, _3607);
    out.m_86.w = _3609;
    float _3613 = -_3611;
    float _3615 = _3601 + _3613;
    float _3617 = -_3611;
    float _3619 = _3599 + _3617;
    float _3621 = -_3611;
    float _3623 = _3603 + _3621;
    out.m_88.x = 0.0;
    float _3625 = fma(_3615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    float _3627 = fma(_3619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    float _3629 = fma(_3623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    out.m_90.x = _3625;
    out.m_90.y = _3627;
    out.m_90.z = _3629;
    if (!_3597)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3631 = -_2972;
    float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3635 = -_2974;
    float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3639 = -_2976;
    float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3643 = _3633 * _3633;
    float _3645 = fma(_3637, _3637, _3643);
    float _3647 = fma(_3641, _3641, _3645);
    float _3649 = sqrt(_3647);
    float _3651 = rsqrt(_3647);
    float _3653 = -_3649;
    float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3657 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = _3637 * _3651;
    float _3663 = _3633 * _3651;
    float _3665 = abs(_3659);
    float _3667 = log2(_3665);
    float _3669 = _3641 * _3651;
    float _3671 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3673 = _2658 * _3663;
    float _3675 = -_3663;
    float _3677 = -_3671;
    float _3679 = fma(_3675, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3677);
    float _3681 = fma(_2656, _3661, _3673);
    float _3683 = -_3669;
    float _3685 = fma(_3683, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3679);
    float _3687 = fma(_2660, _3669, _3681);
    float _3689 = precise::clamp(_3687, 0.0, 1.0);
    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3693 = _3685 + _3691;
    float _3695 = _3667 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3697 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3699 = precise::clamp(_3697, 0.0, 1.0);
    float _3701 = exp2(_3695);
    float _3703 = _3701 * _3699;
    float _3705 = _3689 * _3703;
    float _3707 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3709 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3711 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3707;
    out.m_88.y = _3709;
    out.m_88.z = _3711;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3483 = false;
    bool _511 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3768 = as_type<float>(_125);
        out.gl_Position.z = _3768;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3841 = as_type<float>(_163);
        out.gl_Position.z = _3841;
    }
    if (_155)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _167;
    if (!_179)
    {
        float _203 = _167 * _167;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = in.m_62.x;
    float _211 = in.m_62.y;
    float _213 = in.m_62.z;
    float _215 = _207;
    float _217 = _193;
    if (!_179)
    {
        float _219 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _219;
    }
    float _221 = _215;
    float _223 = in.m_64.x;
    float _225 = in.m_64.y;
    float _227 = in.m_64.z;
    int _229 = as_type<int>(_165) & 1;
    bool _231 = _229 != 0;
    int _233 = as_type<int>(_165) & 2;
    bool _235 = _233 != 0;
    int _237 = int(_231);
    int _239 = _235 ? 2 : 0;
    int _241 = _237 | _239;
    int _243 = _179 ? 4 : 0;
    int _245 = _241 | _243;
    int _247 = false ? 8 : 0;
    int _249 = _245 | _247;
    int _251 = false ? 16 : 0;
    int _253 = _249 | _251;
    int _255 = false ? 32 : 0;
    int _257 = _253 | _255;
    int _259 = false ? 64 : 0;
    int _261 = _257 | _259;
    int _263 = _261 & 4;
    bool _265 = !_231;
    float _267 = _265 ? (-0.5) : 0.5;
    bool _269 = !_235;
    float _271 = _269 ? (-0.5) : 0.5;
    bool _273 = !_179;
    float _275 = _221;
    float _277 = 0.0;
    float _279 = as_type<float>(_263);
    if (!_273)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _167 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _167);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _309;
        _277 = _293;
        _279 = _299;
    }
    float _311 = _275;
    float _313 = _277;
    float _315 = _279;
    bool _317 = !_179;
    float _319 = _315;
    float _321 = _313;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _167 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _319 = _329;
        _201 = _341;
    }
    float _343 = _319;
    float _345 = _201;
    float _347 = _343;
    if (!_179)
    {
        float _349 = _145 * _145;
        float _351 = _349 * 0.5;
        _321 = _351;
    }
    float _353 = _321;
    float _355 = _353;
    if (!_179)
    {
        _347 = _145;
    }
    float _357 = _347;
    float _359 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _357;
    if (!_179)
    {
        float _365 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_179;
    float _371 = _367;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _145 * _375;
        float _385 = exp2(_383);
        float _387 = _381 * 0.693147182464599609375;
        float _389 = 1.0 / _387;
        float _391 = 1.0 / _379;
        float _393 = _385 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _389, _145);
        float _399 = _397 * _391;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_179;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _145 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _363 = _425;
    }
    float _427 = _363;
    float _429 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _431 = fma(_345, _181, _359);
    float _433 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _435 = fma(_345, _183, _361);
    float _437 = fma(_345, _185, _429);
    float _439 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = fma(_427, _183, _433);
    float _443 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = fma(_427, _181, _439);
    float _449 = -_441;
    float _451 = _435 + _449;
    float _453 = fma(_427, _185, _443);
    float _455 = fma(_435, _169, _189);
    float _457 = fma(_431, _169, _187);
    float _459 = -_447;
    float _461 = _431 + _459;
    float _463 = _451 * _195;
    float _465 = _451 * _211;
    float _467 = _451 * _225;
    float _469 = -_453;
    float _471 = _437 + _469;
    float _473 = fma(_461, _193, _463);
    float _475 = fma(_461, _209, _465);
    float _477 = fma(_461, _223, _467);
    float _479 = fma(_437, _169, _191);
    float _481 = fma(_471, _197, _473);
    float _483 = fma(_471, _213, _475);
    float _485 = fma(_471, _227, _477);
    bool _487 = !_445;
    float _489 = _483;
    float _491 = _481;
    float _493 = _485;
    float _509;
    if (!_487)
    {
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _497 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_109);
        float _515 = 1.0 / _513;
        float _517 = _145 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _523 = int(_521);
    float _525 = in.m_51.y;
    float _527 = _455 * _195;
    float _529 = in.m_51.z;
    float _531 = fma(_457, _193, _527);
    float _533 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _535 = int(_533);
    float _537 = in.m_51.w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _541 = in.m_60.w;
    bool _543 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _545 = isnan(_519);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = float(_523);
    float _557 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _559 = int(_557);
    float _561 = in.m_64.w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = in.m_62.w;
    float _569 = 1.0 / _555;
    float _571 = float(uint(_535));
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _575 = 1.0 + _573;
    int _577 = ~_535;
    int _579 = _577 + 1;
    float _581 = float(_535);
    bool _583 = _535 == 0;
    float _585 = 1.0 / _571;
    float _587 = float(uint(_559));
    int _589 = ~_559;
    int _591 = _589 + 1;
    int _593 = ~_559;
    int _595 = _593 + 1;
    float _597 = _145 * _569;
    float _599 = 1.0 / _587;
    int _601 = as_type<int>(_585) + (-2);
    float _603 = trunc(_597);
    int _605 = int(_603);
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _609 = _607 != 0;
    float _611 = 1.0 / _575;
    int _613 = ~_535;
    int _615 = _613 + 1;
    float _617 = float(uint(_605));
    float _619 = as_type<float>(_601) * _617;
    float _621 = trunc(_619);
    float _623 = precise::max(_621, 0.0);
    uint _626 = uint(_623);
    float _628 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _630 = int(_628);
    int _632 = _579 * int(_626);
    int _634 = _632 + _605;
    float _636 = as_type<float>(_579);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_609)
    {
        _636 = 1.0;
    }
    float _640 = _636;
    float _642 = _640;
    if (!_609)
    {
        _642 = 7.345489978790283203125;
    }
    float _644 = _642;
    float _646 = float(uint(_634));
    float _648 = _644 * _131;
    float _650 = as_type<float>(_601) * _646;
    float _652 = trunc(_650);
    float _654 = precise::max(_652, 0.0);
    uint _656 = uint(_654);
    float _658 = floor(_648);
    int _660 = int(_626) + int(_656);
    float _662 = float(_605);
    int _664 = _615 * _660;
    int _666 = _664 + _605;
    bool _668 = _662 >= _581;
    bool _670 = isnan(_662);
    bool _672 = _668 || _670;
    bool _674 = isnan(_581);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_658;
    float _682 = _648 + _680;
    int _684 = _535 + (-1);
    bool _686 = uint(_666) >= uint(_535);
    float _688 = _682 * _581;
    float _690 = float(_109);
    float _692 = trunc(_678);
    int _694 = int(_692);
    bool _696 = !_686;
    int _698 = _696 ? 0 : (-1);
    int _700 = ~_660;
    int _702 = _700 + _698;
    int _704 = _702 + 1;
    float _706 = float(_630);
    float _708 = 1.0 / _690;
    int _710 = _535 * _704;
    int _712 = _710 + _605;
    bool _714 = !_583;
    int _716 = _714 ? _712 : (-1);
    float _718 = 1.0 / _706;
    int _720 = ~_694;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    int _726 = _716 * _724;
    float _728 = _145 * _708;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _740 = _738 != 0;
    float _742 = trunc(_688);
    int _744 = int(_742);
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _748 = _746 != 0;
    float _750 = _728 * _581;
    int _752 = _694 * _684;
    int _754 = _752 + _726;
    bool _756 = !_736;
    int _758 = _756 ? 0 : 1;
    float _760 = _145 * _718;
    bool _762 = !_748;
    int _764 = _762 ? 0 : 1;
    float _766 = trunc(_750);
    int _768 = int(_766);
    bool _770 = !_732;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_758);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _778 = _776 != 0;
    bool _780 = !_740;
    int _782 = _780 ? 0 : 1;
    float _784 = trunc(_760);
    int _786 = int(_784);
    int _788 = abs(_764);
    int _790 = _754 * _774;
    int _792 = abs(_772);
    bool _794 = !_778;
    int _796 = _794 ? 0 : 1;
    int _798 = _744 * _788;
    int _800 = _798 + _605;
    int _802 = abs(_782);
    int _804 = abs(_796);
    int _806 = _768 * _792;
    int _808 = _806 + _790;
    int _810 = ~_559;
    int _812 = _810 + 1;
    float _814 = float(uint(_786));
    int _816 = _800 * _802;
    int _818 = _816 + _808;
    int _820 = as_type<int>(_599) + (-2);
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _824 = _822 != 0;
    int _826 = _744 * _804;
    int _828 = _826 + _818;
    int _830 = ~_535;
    int _832 = _830 + 1;
    float _834 = as_type<float>(_820) * _814;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _838 = _836 != 0;
    float _840 = float(uint(_828));
    float _842 = trunc(_834);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = as_type<float>(_601) * _840;
    float _850 = _848;
    if (_824)
    {
        _638 = _131;
    }
    float _852 = _638;
    float _854 = trunc(_848);
    float _856 = precise::max(_854, 0.0);
    uint _858 = uint(_856);
    float _860 = _852;
    if (!_824)
    {
        _860 = _525;
    }
    float _862 = _860;
    int _864 = _812 * int(_846);
    int _866 = _864 + _786;
    if (_824)
    {
        _850 = 1.0;
    }
    float _868 = _850;
    float _870 = _868;
    if (!_824)
    {
        _870 = 1.2345600128173828125;
    }
    float _872 = _870;
    float _874 = float(uint(_866));
    int _876 = _832 * int(_858);
    int _878 = _876 + _828;
    float _880 = _872 * _862;
    float _882 = as_type<float>(_820) * _874;
    int _884 = ~_559;
    int _886 = _884 + 1;
    float _888 = float(uint(_878));
    float _890 = trunc(_882);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    float _896 = as_type<float>(_601) * _888;
    float _898 = trunc(_896);
    float _900 = precise::max(_898, 0.0);
    uint _902 = uint(_900);
    int _904 = int(_846) + int(_894);
    int _906 = ~_535;
    int _908 = _906 + 1;
    float _910 = floor(_880);
    int _912 = _886 * _904;
    int _914 = _912 + _786;
    int _916 = int(_858) + int(_902);
    float _918 = float(_559);
    float _920 = float(_786);
    int _922 = _908 * _916;
    int _924 = _922 + _828;
    bool _926 = uint(_914) >= uint(_559);
    bool _928 = _920 >= _918;
    bool _930 = isnan(_920);
    bool _932 = _928 || _930;
    bool _934 = isnan(_918);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    bool _940 = uint(_924) >= uint(_535);
    bool _942 = !_926;
    int _944 = _942 ? 0 : (-1);
    float _946 = -_910;
    float _948 = _880 + _946;
    float _950 = trunc(_938);
    int _952 = int(_950);
    bool _954 = !_838;
    int _956 = _954 ? 0 : 1;
    bool _958 = !_940;
    int _960 = _958 ? 0 : (-1);
    float _962 = _948 * _918;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _966 = _964 != 0;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _978 = _976 != 0;
    float _980 = _728 * _918;
    int _982 = ~_904;
    int _984 = _982 + _944;
    int _986 = _984 + 1;
    int _988 = abs(_956);
    float _990 = trunc(_962);
    int _992 = int(_990);
    bool _994 = !_970;
    int _996 = _994 ? 0 : 1;
    int _998 = _559 * _986;
    int _1000 = _998 + _786;
    bool _1002 = _559 == 0;
    int _1004 = abs(_996);
    int _1006 = ~_952;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = trunc(_980);
    int _1014 = int(_1012);
    bool _1016 = !_1002;
    int _1018 = _1016 ? _1000 : (-1);
    int _1020 = ~_916;
    int _1022 = _1020 + _960;
    int _1024 = _1022 + 1;
    bool _1026 = _535 == 0;
    int _1028 = _1018 * _1010;
    int _1030 = _559 + (-1);
    int _1032 = _535 * _1024;
    int _1034 = _1032 + _828;
    bool _1036 = !_978;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1042 = log2(_1040);
    int _1044 = _952 * _1030;
    int _1046 = _1044 + _1028;
    bool _1048 = !_974;
    int _1050 = _1048 ? 0 : 1;
    int _1052 = _992 * _988;
    int _1054 = _1052 + _786;
    bool _1056 = !_966;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = _1046 * _1004;
    bool _1062 = !_1026;
    int _1064 = _1062 ? _1034 : (-1);
    int _1066 = abs(_1058);
    int _1068 = abs(_1050);
    int _1070 = _1064 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = abs(_1038);
    int _1076 = _1014 * _1066;
    int _1078 = _1076 + _1060;
    bool _1080 = uint(_1070) > 1u;
    int _1082 = _1064 & 3;
    bool _1084 = _1082 != 0;
    int _1086 = _1054 * _1068;
    int _1088 = _1086 + _1078;
    float _1090 = _131 * 2.0;
    int _1092 = _1084 ? 0 : 1;
    bool _1094 = _1070 != 3;
    int _1096 = _992 * _1074;
    int _1098 = _1096 + _1088;
    float _1100 = floor(_1090);
    int _1102 = ~_1092;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = _1106;
    if (!_1080)
    {
        int _1110 = ~_1092;
        int _1112 = _1110 + 1;
        _1108 = _1112;
    }
    int _1114 = _1108;
    bool _1116 = uint(_1070) >= 2u;
    float _1118 = float(uint(_1098));
    int _1120 = _1116 ? 0 : 1;
    float _1122 = as_type<float>(_820) * _1118;
    bool _1124 = _131 > 0.5;
    int _1126 = ~_1120;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = trunc(_1122);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = _1130;
    if (_1094)
    {
        int _1140 = ~_1120;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    int _1146 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1148 = _1146 != 0;
    float _1150 = _525 * 2.0;
    float _1152 = -_267;
    int _1154 = _1124 ? as_type<int>(_1152) : as_type<int>(_267);
    bool _1156 = _1100 > 0.0;
    bool _1158 = !_1148;
    float _1160 = _1158 ? _267 : as_type<float>(_1154);
    float _1162 = floor(_1150);
    bool _1164 = _1100 >= 0.0;
    bool _1166 = isnan(_1100);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    int _1174 = ~_559;
    int _1176 = _1174 + 1;
    int _1178 = _1172 ? 0 : 1;
    bool _1180 = _525 > 0.5;
    int _1182 = ~_1178;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = _1186;
    if (!_1156)
    {
        int _1190 = ~_1178;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    int _1196 = _1176 * int(_1136);
    int _1198 = _1196 + _1098;
    float _1200 = _529 * 2.0;
    float _1202 = -_271;
    int _1204 = _1180 ? as_type<int>(_1202) : as_type<int>(_271);
    bool _1206 = _529 > 0.5;
    float _1208 = floor(_1200);
    float _1210 = float(uint(_1198));
    bool _1212 = _1162 > 0.0;
    float _1214 = -_267;
    int _1216 = _1206 ? as_type<int>(_1214) : as_type<int>(_267);
    float _1218 = as_type<float>(_820) * _1210;
    bool _1220 = _1162 >= 0.0;
    bool _1222 = isnan(_1162);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan(0.0);
    bool _1228 = _1224 || _1226;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1218);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1228 ? 0 : 1;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>(_1162);
    if (_824)
    {
        _1246 = 0;
    }
    int _1248 = _1246;
    int _1250 = _1248;
    if (!_824)
    {
        _1250 = 1;
    }
    int _1252 = _1250;
    int _1254 = ~_1240;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    bool _1260 = !_1232;
    float _1262 = _1260 ? _267 : as_type<float>(_1216);
    int _1264 = _1258;
    if (!_1212)
    {
        int _1266 = ~_1240;
        int _1268 = _1266 + 1;
        _1264 = _1268;
    }
    int _1270 = _1264;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1282 = _1280 != 0;
    bool _1284 = _1208 >= 0.0;
    bool _1286 = isnan(_1208);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    int _1294 = int(_1136) + int(_1238);
    int _1296 = _1292 ? 0 : 1;
    bool _1298 = _1252 != 1;
    float _1300 = _145 * _1042;
    int _1302 = _591 * _1294;
    int _1304 = _1302 + _1098;
    bool _1306 = !_1244;
    float _1308 = _1306 ? _271 : as_type<float>(_1204);
    float _1310 = exp2(_1300);
    bool _1312 = _1208 > 0.0;
    bool _1314 = !_1274;
    int _1316 = _1314 ? 0 : 1;
    bool _1318 = uint(_1304) >= uint(_559);
    float _1320 = 0.0;
    if (!_1298)
    {
        _1320 = _525;
    }
    float _1322 = _1320;
    float _1324 = 0.0;
    float _1326 = _1322;
    if (!_1298)
    {
        _1324 = _525;
    }
    float _1328 = _1324;
    float _1330 = 0.0;
    float _1332 = _1328;
    if (!_1298)
    {
        _1330 = _529;
    }
    float _1334 = _1330;
    float _1336 = 0.0;
    float _1338 = _1334;
    if (!_1298)
    {
        _1336 = _529;
    }
    float _1340 = _1336;
    float _1342 = -_1310;
    float _1344 = _1342 + 1.0;
    float _1346 = _1340;
    if (_1298)
    {
        _1326 = _131;
    }
    float _1348 = _1326;
    if (_1298)
    {
        _1332 = _131;
    }
    float _1350 = _1332;
    if (_1298)
    {
        _1338 = _525;
    }
    float _1352 = _1338;
    if (_1298)
    {
        _1346 = _525;
    }
    float _1354 = _1346;
    bool _1356 = !_1318;
    int _1358 = _1356 ? 0 : (-1);
    bool _1360 = !_1072;
    int _1362 = _1360 ? 0 : 1;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1374 = _1372 != 0;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1376;
    int _1380 = ~_1296;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1384;
    if (!_1312)
    {
        int _1388 = ~_1296;
        int _1390 = _1388 + 1;
        _1386 = _1390;
    }
    int _1392 = _1386;
    float _1394 = 1.0 / _1378;
    bool _1396 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1398 = isnan(0.0);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1404 = _1400 || _1402;
    float _1406 = _455 * _211;
    float _1408 = _1404 ? _1344 : 0.0;
    float _1410 = fma(_457, _209, _1406);
    bool _1412 = _537 > 0.5;
    float _1414 = _455 * _225;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1420 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1422 = fma(_457, _223, _1414);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1426 = _519 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1428;
    float _1432 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1434 = 1.0 / _1418;
    float _1436 = _1426 * _1394;
    float _1438 = _131 + _525;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1442 = fma(_1420, -2.0, _539);
    float _1444 = fma(_479, _197, _531);
    float _1446 = _1438 + (-1.0);
    float _1448 = float(uint(_800));
    float _1450 = 1.0 / _1430;
    float _1452 = -_1440;
    float _1454 = fma(_1432, 2.0, _1452);
    float _1456 = fma(_479, _213, _1410);
    float _1458 = fma(_479, _227, _1422);
    float _1460 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1462 = _131 + _529;
    float _1464 = _529 + _525;
    float _1466 = _1444 + _541;
    float _1468 = as_type<float>(_601) * _1448;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1472 = _519 + _1470;
    float _1474 = _1462 + (-1.0);
    float _1476 = _1464 + (-1.0);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1480 = _519 + _1478;
    float _1482 = trunc(_1468);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    float _1488 = _1472 * _1450;
    float _1490 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1494 = _1458 + _561;
    bool _1496 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1498 = isnan(_519);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = _1480 * _1434;
    bool _1510 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1512 = isnan(_519);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1456 + _567;
    float _1524 = fma(_565, _1436, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1526 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1528 = isnan(_519);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = -_1506;
    float _1540 = _1538 + 1.0;
    float _1542 = -_1520;
    float _1544 = _1542 + 1.0;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1558 = _1520 * _1540;
    int _1560 = ~_535;
    int _1562 = _1560 + 1;
    float _1564 = _553 * _1544;
    float _1566 = -_553;
    float _1568 = _1566 + 1.0;
    float _1570 = -_145;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1454);
    float _1574 = fma(_1552, _1508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1576 = _1562 * int(_1486);
    int _1578 = _1576 + _800;
    float _1580 = _1536 * _1568;
    float _1582 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1442);
    float _1584 = _1308 + (-0.5);
    float _1586 = fma(_1556, _1508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1588 = float(uint(_1578));
    float _1590 = _1524 * _1580;
    float _1592 = -_1584;
    float _1594 = -_1582;
    float _1596 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1594);
    float _1598 = _1160 + 0.5;
    float _1600 = as_type<float>(_601) * _1588;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1572);
    float _1606 = fma(_1548, _1436, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1610 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1602);
    float _1612 = float(uint(_1054));
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1616 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1608);
    float _1618 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1620 = trunc(_1600);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    float _1626 = as_type<float>(_820) * _1612;
    float _1628 = _1606 * _1580;
    float _1630 = -_1614;
    float _1632 = fma(_1618, 2.0, _1630);
    float _1634 = -_1536;
    float _1636 = _1634 + 1.0;
    bool _1638 = !_1282;
    int _1640 = _1638 ? 0 : 1;
    float _1642 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1644 = trunc(_1626);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1652 = !_1278;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1628);
    int _1658 = ~_559;
    int _1660 = _1658 + 1;
    float _1662 = fma(_1642, -2.0, _1650);
    int _1664 = abs(_1640);
    float _1666 = _1408 * _611;
    int _1668 = abs(_1316);
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1672 = _1522 + _1670;
    int _1674 = ~_535;
    int _1676 = _1674 + 1;
    float _1678 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1590);
    int _1680 = abs(_1654);
    float _1682 = -_145;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1632);
    float _1686 = float(_1194);
    float _1688 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1662);
    int _1690 = ~_1294;
    int _1692 = _1690 + _1358;
    int _1694 = _1692 + 1;
    int _1696 = _1660 * int(_1648);
    int _1698 = _1696 + _1054;
    float _1700 = float(_1270);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1466 + _1702;
    float _1706 = float(_1664);
    int _1708 = _559 * _1694;
    int _1710 = _1708 + _1098;
    float _1712 = float(_1668);
    float _1714 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1716 = int(_1486) + int(_1624);
    float _1718 = _1706 * _1700;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1722 = _1494 + _1720;
    float _1724 = float(uint(_1698));
    float _1726 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1610);
    int _1728 = _1064 >> 31;
    int _1730 = _1676 * _1716;
    int _1732 = _1730 + _800;
    bool _1734 = !_1002;
    int _1736 = _1734 ? _1710 : (-1);
    float _1738 = as_type<float>(_820) * _1724;
    float _1740 = -_271;
    int _1742 = _1412 ? as_type<int>(_1740) : as_type<int>(_271);
    float _1744 = _1262 + 0.5;
    int _1746 = _1728 & 3;
    float _1748 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1616);
    bool _1750 = uint(_1732) >= uint(_535);
    float _1752 = trunc(_1738);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = _1736 >> 31;
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1684);
    int _1762 = _1064 + _1746;
    float _1764 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1714);
    int _1766 = _1758 & 3;
    float _1768 = -_1748;
    float _1770 = _1768 + 1.0;
    bool _1772 = !_1374;
    float _1774 = _1772 ? _271 : as_type<float>(_1742);
    float _1776 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1764);
    int _1778 = _1736 + _1766;
    int _1780 = _1762 >> 2;
    bool _1782 = _1070 != 3;
    int _1784 = _1780 << 4;
    int _1786 = _1784 + 368;
    float _1788 = in.m_66.x;
    float _1790 = in.m_66.y;
    float _1792 = in.m_66.z;
    int _1794 = _1778 >> 2;
    float _1796 = float(_1680);
    uint _1798 = uint(int(uint(_1786) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    bool _1814 = !_1782;
    int _1816 = _1814 ? 0 : (-1);
    bool _1818 = !_1750;
    int _1820 = _1818 ? 0 : (-1);
    float _1822 = _1796 * _1686;
    int _1824 = _1736 & 3;
    bool _1826 = _1824 != 0;
    float _1828 = _1774 + (-0.5);
    int _1830 = _1736 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = _1794 << 4;
    int _1836 = _1834 + 512;
    float _1838 = -_1828;
    float _1840 = -_1688;
    float _1842 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1840);
    bool _1844 = !_1832;
    int _1846 = _1844 ? 0 : 1;
    int _1848 = _1786 + 8;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[int(_1860)][_1862];
    bool _1866 = uint(_1830) > 1u;
    float _1868 = _131 + (-0.5);
    float _1870 = float(_1392);
    int _1872 = int(_1648) + int(_1756);
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1876 = ~_1716;
    int _1878 = _1876 + _1820;
    int _1880 = _1878 + 1;
    uint _1882 = uint(int(uint(_1836) >> uint(2)));
    uint _1884 = uint(int(uint(int(_1882)) >> uint(2)));
    int _1886 = int(_1882) & 3;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[int(_1884)][_1886];
    int _1890 = int(_1882) + 1;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    int _1894 = _1890 & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    float _1898 = _1712 * _1870;
    int _1900 = _1826 ? 0 : 1;
    int _1902 = _595 * _1872;
    int _1904 = _1902 + _1054;
    bool _1906 = _1776 >= 0.0;
    float _1908 = _1898 * (-2.0);
    int _1910 = ~_1900;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1874);
    int _1918 = _1914;
    float _1920 = _1898;
    if (!_1866)
    {
        int _1922 = ~_1900;
        int _1924 = _1922 + 1;
        _1918 = _1924;
    }
    int _1926 = _1918;
    float _1928 = fma(_1908, _1788, _1788);
    int _1930 = _1836 + 8;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
    int _1936 = int(_1932) & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = int(_1932) + 1;
    uint _1942 = uint(int(uint(_1940) >> uint(2)));
    int _1944 = _1940 & 3;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[int(_1942)][_1944];
    bool _1948 = uint(_1830) >= 2u;
    float _1950 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1928);
    int _1952 = abs(_1114);
    int _1954 = _535 * _1880;
    int _1956 = _1954 + _800;
    int _1958 = _1948 ? 0 : 1;
    float _1960 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1916);
    bool _1962 = uint(_1904) >= uint(_559);
    float _1964 = fma(_1460, _1908, _1460);
    float _1966 = _1792;
    if (_1906)
    {
        _1920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1968 = _1920;
    int _1970 = as_type<int>(_1968);
    if (_1906)
    {
        out.m_47.x = 0.0;
    }
    bool _1972 = !_1962;
    int _1974 = _1972 ? 0 : (-1);
    bool _1976 = _1830 != 3;
    if (_1906)
    {
        float _1978 = _1968 * 5.0;
        _1970 = as_type<int>(_1978);
    }
    int _1980 = _1970;
    int _1982 = ~_1872;
    int _1984 = _1982 + _1974;
    int _1986 = _1984 + 1;
    int _1988 = abs(_1926);
    if (_1906)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6421 = as_type<float>(_1980);
        out.gl_Position.z = _6421;
    }
    bool _1990 = !_1976;
    int _1992 = _1990 ? 0 : (-1);
    int _1994 = _559 * _1986;
    int _1996 = _1994 + _1054;
    bool _1998 = _1830 != 3;
    int _2000 = abs(_1144);
    bool _2002 = _535 == 0;
    bool _2004 = !_2002;
    int _2006 = _2004 ? _1956 : (-1);
    int _2008 = ~_1952;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = abs(_1362);
    int _2016 = _2012 * as_type<int>(_1812);
    int _2018 = ~_1988;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = ~_2014;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2022 * as_type<int>(_1896);
    int _2032 = ~_1958;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    int _2038 = _2028 * as_type<int>(_1804);
    int _2040 = _2038 + _2016;
    int _2042 = ~_2000;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = abs(_1846);
    int _2050 = _2036;
    if (_1998)
    {
        int _2052 = ~_1958;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    int _2058 = _2046 * as_type<int>(_1856);
    int _2060 = _2058 + _2040;
    int _2062 = ~_2048;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    int _2068 = abs(_2056);
    bool _2070 = !_1366;
    int _2072 = _2070 ? 0 : 1;
    int _2074 = _2066 * as_type<int>(_1888);
    int _2076 = _2074 + _2030;
    int _2078 = abs(_1816);
    int _2080 = abs(_1992);
    int _2082 = ~_2068;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    bool _2088 = !_1370;
    int _2090 = _2088 ? 0 : 1;
    int _2092 = abs(_2072);
    int _2094 = _2086 * as_type<int>(_1938);
    int _2096 = _2094 + _2076;
    int _2098 = ~_2078;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    int _2104 = ~_2080;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = abs(_2090);
    int _2112 = _2102 * as_type<int>(_1864);
    int _2114 = _2112 + _2060;
    float _2116 = _1672 * _1672;
    int _2118 = _2108 * as_type<int>(_1946);
    int _2120 = _2118 + _2096;
    int _2122 = ~_2110;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = fma(_1704, _1704, _2116);
    int _2130 = _2120 * _2126;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2134 = ~_2092;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = fma(_1722, _1722, _2128);
    bool _2142 = !_1002;
    int _2144 = _2142 ? _1996 : (-1);
    float _2146 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2132);
    bool _2148 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2150 = isnan(1.0);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2156 = _2152 || _2154;
    int _2158 = _2114 * _2138;
    float _2160 = rsqrt(_2140);
    float _2162 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2146);
    int _2164 = _2006 * _2092;
    int _2166 = _2164 + _2158;
    int _2168 = _2144 * _2110;
    int _2170 = _2168 + _2130;
    float _2172 = -_2162;
    float _2174 = _2172 + 1.0;
    float _2176 = -_1726;
    float _2178 = _2176 + 1.0;
    float _2180 = -_1960;
    float _2182 = _2180 + 1.0;
    bool _2184 = !_2156;
    float _2186 = _2184 ? _145 : _1666;
    float _2188 = fma(_1308, _2174, _1596);
    float _2190 = -_2178;
    float _2192 = fma(_1262, _2190, _1760);
    float _2194 = -_2182;
    float _2196 = fma(_1160, _2194, _1604);
    float _2198 = fma(_1774, _1770, _1842);
    float _2200 = float(_2166);
    float _2202 = fma(_2186, _1964, _1950);
    float _2204 = float(_2170);
    float _2206 = _1672 * _2160;
    float _2208 = _1704 * _2160;
    out.m_68.x = _2196;
    out.m_68.y = _2188;
    out.m_68.z = _2192;
    out.m_68.w = _2198;
    float _2210 = -_2206;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _2214 = -_2208;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    out.m_70.x = _2200;
    out.m_70.y = _2204;
    float _2218 = _2212 * _2212;
    if (_1906)
    {
        return out;
    }
    float _2220 = -_2206;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _2224 = _1722 * _2160;
    float _2226 = -_2208;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1466);
    float _2230 = fma(_2216, _2216, _2218);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = _2222 + _2232;
    float _2236 = -_2224;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _2240 = -_2224;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _2228 + _2244;
    float _2248 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2250 = fma(_2238, _2238, _2230);
    float _2252 = _1822 * (-2.0);
    float _2254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2256 = _2242 + _2254;
    float _2258 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2248);
    float _2260 = _525 + (-0.5);
    float _2262 = fma(_2252, _1790, _1790);
    float _2264 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2258);
    float _2266 = fma(_1492, _2252, _1492);
    float _2268 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2262);
    float _2270 = _1718 * (-2.0);
    float _2272 = in.m_58.x;
    float _2274 = in.m_58.y;
    bool _2276 = _2264 >= 0.0;
    float _2278 = fma(_1586, _1564, _1678);
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2282 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2280;
    float _2284 = fma(_2270, _1792, _1792);
    float _2286 = _529 + (-0.5);
    float _2288 = fma(_2186, _2266, _2268);
    float _2290 = fma(_2282, _1488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2292 = fma(_1490, _2270, _1490);
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2284);
    float _2296 = _2202 * 0.15915493667125701904296875;
    float _2298 = _2288 * 0.15915493667125701904296875;
    float _2300 = fma(_2290, _1558, _2278);
    if (_2276)
    {
        _1966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _1966;
    float _2304 = fma(_2186, _2292, _2294);
    float _2306 = _2296 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2310;
    int _2314 = as_type<int>(_2302);
    if (_2276)
    {
        out.m_47.x = 0.0;
    }
    if (_2276)
    {
        float _2316 = _2302 * 5.0;
        _2314 = as_type<int>(_2316);
    }
    int _2318 = _2314;
    float _2320 = fma(_1574, _1564, _1656);
    float _2322 = fma(_2312, _1488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2324 = _2304 * 0.15915493667125701904296875;
    float _2326 = _2296 * 6.283185482025146484375;
    float _2328 = cos(_2326);
    float _2330 = _2298 * 6.283185482025146484375;
    float _2332 = sin(_2330);
    float _2334 = _2298 * 6.283185482025146484375;
    float _2336 = cos(_2334);
    float _2338 = sqrt(_2250);
    float _2340 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2300);
    float _2342 = _2340 * _2274;
    if (_2276)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6956 = as_type<float>(_2318);
        out.gl_Position.z = _6956;
    }
    if (_2276)
    {
        return out;
    }
    float _2344 = _2342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2346 = _2160 * _2338;
    float _2348 = _2324 * 6.283185482025146484375;
    float _2350 = cos(_2348);
    float _2352 = fma(_2322, _1558, _2320);
    float _2354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _271);
    float _2356 = _2346 * _2344;
    float _2358 = _2328 * _2336;
    float _2360 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2352);
    float _2362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _267);
    float _2364 = _2354 * _2356;
    float _2366 = _2324 * 6.283185482025146484375;
    float _2368 = sin(_2366);
    float _2370 = _2360 * _2272;
    float _2372 = _2308 * _2332;
    float _2374 = _2328 * _2332;
    float _2376 = _271 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2378 = _2370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2380 = _2308 * _2336;
    float _2382 = _2328 * _2350;
    float _2384 = _2346 * _2378;
    float _2386 = _2336 * _2350;
    float _2388 = _2308 * _2350;
    float _2390 = _2332 * _2350;
    float _2392 = _2362 * _2384;
    float _2394 = _2382 * _2364;
    float _2396 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2398 = _2396 * 0.5;
    float _2400 = fma(_2368, _2358, _2372);
    float _2402 = -_2380;
    float _2404 = fma(_2368, _2374, _2402);
    float _2406 = -_2364;
    float _2408 = _2368 * _2406;
    float _2410 = _2388 * _2364;
    float _2412 = fma(_2400, _2392, _2394);
    float _2414 = -_2374;
    float _2416 = fma(_2368, _2380, _2414);
    float _2418 = fma(_2386, _2392, _2408);
    float _2420 = fma(_2368, _2372, _2358);
    float _2422 = fma(_2404, _2398, _2412);
    float _2424 = fma(_2416, _2392, _2410);
    float _2426 = fma(_2390, _2398, _2418);
    float _2428 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2430 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2432 = fma(_2420, _2398, _2424);
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2436 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2438 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2430);
    float _2440 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2442 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2434);
    float _2444 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2428);
    float _2446 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2438);
    float _2448 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2450 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2442);
    float _2452 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2440);
    float _2454 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2456 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2460 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2462 = _1494 + _2454;
    float _2464 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2456);
    float _2466 = _1466 + _2458;
    float _2468 = fma(_2376, _2376, 1.0);
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2472 = _2462 + _2470;
    float _2474 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2478 = _2466 + _2476;
    float _2480 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = _2472 * _2472;
    float _2484 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2486 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2452);
    float _2488 = rsqrt(_2468);
    float _2490 = fma(_2478, _2478, _2482);
    float _2492 = -_2368;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2460);
    float _2496 = -_2368;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2474);
    float _2500 = -_2368;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2504 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2506 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2484);
    float _2508 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2510 = sqrt(_2490);
    float _2512 = _2486 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2514 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2504);
    float _2516 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2508);
    float _2518 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2494);
    float _2520 = _1522 + _2512;
    float _2522 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2514);
    float _2524 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2506);
    float _2526 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    float _2528 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    float _2530 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2502);
    bool _2532 = _2510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2534 = _2420;
    float _2536 = _2512;
    float _2538 = _2426;
    if (!_2532)
    {
        _2534 = _2466;
    }
    float _2540 = _2534;
    float _2542 = _2540;
    if (!_2532)
    {
        _2536 = _2462;
    }
    float _2544 = _2536;
    float _2546 = _2544;
    if (!_2532)
    {
        _2538 = _2520;
    }
    float _2548 = _2538;
    bool _2550 = !_2532;
    float _2552 = _2548;
    if (!_2550)
    {
        float _2554 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2558 = _2510 + _2556;
        float _2560 = rsqrt(_2490);
        float _2562 = _2558 * _2554;
        float _2564 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = _2562 * 0.15915493667125701904296875;
        float _2568 = _2566 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = _2566 * 6.283185482025146484375;
        float _2574 = sin(_2572);
        float _2576 = _2570 + (-1.0);
        float _2578 = fma(_2574, _2564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2582 = _2560 * _2578;
        float _2584 = fma(_2520, _2570, _2580);
        float _2586 = fma(_2478, _2582, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2588 = fma(_2472, _2582, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2552 = _2584;
        _2542 = _2586;
        _2546 = _2588;
    }
    float _2590 = _2552;
    float _2592 = _2542;
    float _2594 = _2546;
    float _2596 = -_1522;
    float _2598 = _2596 + _2590;
    float _2600 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2602 = -_1466;
    float _2604 = _2602 + _2592;
    float _2606 = _267 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2608 = _2598 * _2598;
    float _2610 = -_1494;
    float _2612 = _2610 + _2594;
    float _2614 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2464);
    float _2616 = _2376 * _2488;
    float _2618 = fma(_2604, _2604, _2608);
    float _2620 = _2376 * _2518;
    float _2622 = _2376 * _2528;
    float _2624 = _2376 * _2530;
    float _2626 = fma(_2612, _2612, _2618);
    float _2628 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2448);
    float _2630 = -_2522;
    float _2632 = _2616 * _2630;
    float _2634 = -_2524;
    float _2636 = _2616 * _2634;
    float _2638 = sqrt(_2626);
    float _2640 = -_2526;
    float _2642 = _2616 * _2640;
    float _2644 = fma(_2606, _2614, _2620);
    float _2646 = fma(_2606, _2600, _2622);
    float _2648 = fma(_2606, _2628, _2624);
    float _2650 = fma(_2488, _2518, _2632);
    float _2652 = fma(_2488, _2528, _2636);
    float _2654 = fma(_2488, _2530, _2642);
    float _2656 = _2522 + _2644;
    float _2658 = _2524 + _2646;
    float _2660 = _2526 + _2648;
    out.m_72.x = _2614;
    out.m_72.y = _2600;
    out.m_72.z = _2628;
    out.m_74.x = _2650;
    out.m_74.y = _2652;
    out.m_74.z = _2654;
    bool _2662 = _2638 > 0.0;
    out.m_76.x = _2656;
    out.m_76.y = _2658;
    out.m_76.z = _2660;
    bool _2664 = !_2662;
    float _2666 = _2644;
    float _2668 = _2652;
    float _2670 = _2600;
    float _2672 = _2592;
    float _2674 = _2590;
    float _2676 = _2594;
    float _2678 = _2600;
    if (!_2664)
    {
        bool _2680 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2682 = _2614;
        if (_2680)
        {
            float _2684 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2682 = _2684;
        }
        float _2686 = _2682;
        float _2688 = _2686;
        if (_2680)
        {
            float _2690 = _481 * _2686;
            _2666 = _2690;
        }
        float _2692 = _2666;
        float _2694 = _2692;
        if (_2680)
        {
            float _2696 = _483 * _2686;
            _2668 = _2696;
        }
        float _2698 = _2668;
        float _2700 = _2698;
        if (_2680)
        {
            float _2702 = _485 * _2686;
            _2670 = _2702;
        }
        float _2704 = _2670;
        float _2706 = _2704;
        if (!_2680)
        {
            bool _2708 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2710 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2712 = _2708 || _2710;
            bool _2714 = isnan(1.0);
            bool _2716 = _2712 || _2714;
            float _2718 = _145 + 1.0;
            float _2720 = _2718;
            if (!_2716)
            {
                float _2722 = _2718 * _2718;
                float _2724 = _2722 * 0.5;
                _2688 = _2724;
            }
            float _2726 = _2688;
            float _2728 = _2726;
            if (!_2716)
            {
                float _2730 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2728 = _2730;
            }
            float _2732 = _2728;
            bool _2734 = !_2716;
            float _2736 = _2732;
            if (!_2734)
            {
                float _2738 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2740 = log2(_2738);
                float _2742 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2744 = _2740 * _2718;
                float _2746 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2748 = 1.0 + _2746;
                float _2750 = 1.0 / _2748;
                float _2752 = _2742 * 0.693147182464599609375;
                float _2754 = exp2(_2744);
                float _2756 = 1.0 / _2752;
                float _2758 = _2754 + (-1.0);
                float _2760 = -_2758;
                float _2762 = fma(_2760, _2756, _2718);
                float _2764 = _2762 * _2750;
                float _2766 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2736 = _2766;
            }
            float _2768 = _2736;
            float _2770 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2772 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2774 = !_2716;
            if (!_2774)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = 1.0 / _2782;
                float _2786 = _2778 * _2718;
                float _2788 = exp2(_2786);
                float _2790 = -_2788;
                float _2792 = _2790 + 1.0;
                float _2794 = _2792 * _2784;
                _2720 = _2794;
            }
            float _2796 = _2720;
            float _2798 = fma(_2796, _183, _2772);
            float _2800 = fma(_2796, _181, _2770);
            float _2802 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2804 = -_441;
            float _2806 = _2804 + _2798;
            float _2808 = -_447;
            float _2810 = _2808 + _2800;
            float _2812 = fma(_2796, _185, _2802);
            float _2814 = _2806 * _195;
            float _2816 = _2806 * _211;
            float _2818 = _2806 * _225;
            float _2820 = -_453;
            float _2822 = _2820 + _2812;
            float _2824 = fma(_2810, _193, _2814);
            float _2826 = fma(_2810, _209, _2816);
            float _2828 = fma(_2810, _223, _2818);
            float _2830 = fma(_2822, _197, _2824);
            float _2832 = fma(_2822, _213, _2826);
            float _2834 = fma(_2822, _227, _2828);
            _489 = _2832;
            _491 = _2830;
            _493 = _2834;
            _2694 = _2830;
            _2700 = _2832;
            _2706 = _2834;
        }
        float _2836 = _489;
        float _2838 = _491;
        float _2840 = _493;
        float _2842 = _2694;
        float _2844 = _2700;
        float _2846 = _2706;
        float _2848 = _2836 * _2836;
        float _2850 = fma(_2838, _2838, _2848);
        float _2852 = fma(_2840, _2840, _2850);
        float _2854 = rsqrt(_2626);
        float _2856 = sqrt(_2852);
        float _2858 = _2604 * _2854;
        float _2860 = _2598 * _2854;
        float _2862 = _2612 * _2854;
        bool _2864 = _2856 > 0.0;
        bool _2866 = !_2864;
        _2678 = _2846;
        if (!_2866)
        {
            float _2868 = rsqrt(_2852);
            float _2870 = _2868 * _2836;
            float _2872 = _2868 * _2838;
            float _2874 = _2868 * _2840;
            float _2876 = _2860 * _2870;
            float _2878 = fma(_2858, _2872, _2876);
            float _2880 = fma(_2862, _2874, _2878);
            float _2882 = _2880 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2884 = fma(_2842, _2882, _2592);
            float _2886 = fma(_2844, _2882, _2590);
            float _2888 = fma(_2846, _2882, _2594);
            _2672 = _2884;
            _2674 = _2886;
            _2676 = _2888;
        }
    }
    float _2890 = _2672;
    float _2892 = _2674;
    float _2894 = _2676;
    float _2896 = _2678;
    bool _2898 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2900 = isnan(0.5);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2906 = _2902 || _2904;
    float _2908 = -_2208;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2890);
    float _2912 = -_2206;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2892);
    float _2916 = -_2224;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2894);
    float _2920 = _2914;
    float _2922 = _2910;
    float _2924 = _2918;
    float _2926 = _2896;
    if (!_2906)
    {
        float _2928 = _2234 * _2234;
        float _2930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2932 = -_1494;
        float _2934 = _2932 + _2894;
        float _2936 = -_1466;
        float _2938 = _2936 + _2890;
        float _2940 = fma(_2246, _2246, _2928);
        float _2942 = -_1522;
        float _2944 = _2942 + _2892;
        float _2946 = fma(_2256, _2256, _2940);
        float _2948 = 1.0 / _2346;
        float _2950 = sqrt(_2946);
        float _2952 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2954 = precise::min(_2950, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2930;
        float _2958 = _2956 * _2948;
        float _2960 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2962 = _2934 * _2958;
        float _2964 = _2960 * _2958;
        float _2966 = fma(_2960, _2962, _2242);
        float _2968 = fma(_2938, _2964, _2228);
        float _2970 = fma(_2944, _2964, _2222);
        _2920 = _2970;
        _2922 = _2968;
        _2924 = _2966;
    }
    float _2972 = _2920;
    float _2974 = _2922;
    float _2976 = _2924;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2980 = _2972 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2984 = _2974 + _2982;
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2976 + _2986;
    float _2990 = _2980 * _2980;
    float _2992 = fma(_2984, _2984, _2990);
    float _2994 = fma(_2988, _2988, _2992);
    float _2996 = rsqrt(_2994);
    float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3000 = _2984 * _2998;
    float _3002 = _2988 * _2998;
    float _3004 = _3000 * _3000;
    float _3006 = _3002 * _3002;
    float _3008 = _3004 + _3006;
    float _3010 = sqrt(_3008);
    bool _3012 = _3010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3016 = _3010 + _3014;
    float _3018 = _2996;
    float _3020 = _3016;
    float _3022 = _2980;
    float _3024 = _2998;
    if (_3012)
    {
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3026;
    }
    float _3028 = _3018;
    float _3030 = _3028;
    if (_3012)
    {
        float _3032 = _3016 * _3028;
        _3020 = _3032;
    }
    float _3034 = _3020;
    if (_3012)
    {
        float _3036 = rsqrt(_3008);
        _3030 = _3036;
    }
    float _3038 = _3030;
    float _3040 = _3038;
    if (_3012)
    {
        float _3042 = _3034 * 0.15915493667125701904296875;
        _217 = _3042;
    }
    float _3044 = _217;
    float _3046 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3048 = _2988;
    float _3050 = _3044;
    if (_3012)
    {
        float _3052 = _3044 * 6.283185482025146484375;
        float _3054 = sin(_3052);
        _3048 = _3054;
    }
    float _3056 = _3048;
    float _3058 = precise::max(0.0, _3046);
    float _3060 = _1522;
    if (_3012)
    {
        float _3062 = _3044 * 6.283185482025146484375;
        float _3064 = cos(_3062);
        _3060 = _3064;
    }
    float _3066 = _3060;
    float _3068 = -_2998;
    float _3070 = -_3058;
    float _3072 = fma(_2980, _3068, _3070);
    if (_3012)
    {
        float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3022 = _3074;
    }
    float _3076 = _3022;
    float _3078 = sqrt(_2994);
    float _3080 = _3056;
    float _3082 = _3076;
    if (_3012)
    {
        float _3084 = fma(_3056, _3076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3080 = _3084;
    }
    float _3086 = _3080;
    float _3088 = _3086;
    if (!_3012)
    {
        _3050 = _3004;
    }
    float _3090 = _3050;
    float _3092 = _3090;
    if (_3012)
    {
        float _3094 = _3038 * _3086;
        _2926 = _3094;
    }
    float _3096 = _2926;
    if (!_3012)
    {
        _3040 = _3000;
    }
    float _3098 = _3040;
    float _3100 = _3098;
    float _3102 = _3066;
    if (_3012)
    {
        float _3104 = _3066 + (-1.0);
        _3082 = _3104;
    }
    float _3106 = _3082;
    float _3108 = _3106;
    if (_3012)
    {
        float _3110 = _3000 * _3096;
        _3100 = _3110;
    }
    float _3112 = _3100;
    if (!_3012)
    {
        _3088 = _3072;
    }
    float _3114 = _3088;
    float _3116 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3118 = _3114;
    if (_3012)
    {
        float _3120 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3024 = _3120;
    }
    float _3122 = _3024;
    if (!_3012)
    {
        _3108 = _3002;
    }
    float _3124 = _3108;
    float _3126 = _3124;
    if (_3012)
    {
        float _3128 = _3002 * _3096;
        _3126 = _3128;
    }
    float _3130 = _3126;
    if (_3012)
    {
        float _3132 = _3112 * _3112;
        _3092 = _3132;
    }
    float _3134 = _3092;
    if (_3012)
    {
        float _3136 = fma(_3072, _3066, _3122);
        _3118 = _3136;
    }
    float _3138 = _3118;
    if (!_3012)
    {
        _3102 = _3006;
    }
    float _3140 = _3102;
    float _3142 = _3140;
    if (_3012)
    {
        float _3144 = _3130 * _3130;
        _3142 = _3144;
    }
    float _3146 = _3142;
    float _3148 = fma(_3138, _3138, _3134);
    float _3150 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3152 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3154 = _3148 + _3146;
    float _3156 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3116);
    float _3158 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3162 = fma(_3078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3160);
    float _3164 = precise::clamp(_3162, 0.0, 1.0);
    float _3166 = rsqrt(_3154);
    float _3168 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3156);
    float _3170 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3172 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3158);
    float _3174 = -_3164;
    float _3176 = _3174 + 1.0;
    float _3178 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3180 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3170);
    float _3182 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3172);
    float _3184 = abs(_3176);
    float _3186 = log2(_3184);
    float _3188 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3190 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3180);
    float _3192 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3194 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3152);
    float _3196 = -_3188;
    float _3198 = fma(_3196, _3150, 1.0);
    float _3200 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3202 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3204 = _3166 * _3112;
    float _3206 = _3166 * _3138;
    float _3208 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3194);
    float _3210 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3202);
    float _3212 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3214 = _3166 * _3130;
    float _3216 = _3208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3218 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3210);
    float _3220 = -_3212;
    float _3222 = fma(_3206, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3220);
    float _3224 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3226 = log2(_3198);
    float _3228 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3218);
    float _3230 = -_3214;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3222);
    float _3234 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3236 = fma(_3232, -0.5, 0.5);
    float _3238 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3234);
    float _3240 = exp2(_3224);
    float _3242 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3244 = fma(_3232, 0.5, 0.5);
    float _3246 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3238);
    float _3248 = _3206 + 1.0;
    float _3250 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3242);
    float _3252 = fma(_3244, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3254 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3246);
    float _3256 = 1.0 / _3228;
    float _3258 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3250);
    float _3260 = fma(_3244, _3252, -0.212114393711090087890625);
    float _3262 = _3226 * 0.693147182464599609375;
    float _3264 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3258);
    float _3266 = fma(_3244, _3260, 1.570728778839111328125);
    float _3268 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3270 = sqrt(_3236);
    float _3272 = -_3206;
    float _3274 = fma(_3240, _3248, _3272);
    float _3276 = fma(_3274, 0.5, 0.5);
    float _3278 = _3254 * _3256;
    float _3280 = _3264 * _3256;
    float _3282 = fma(_3278, 0.5, 0.5);
    float _3284 = fma(_3280, -0.5, 0.5);
    float _3286 = _3270 * 0.636619746685028076171875;
    float3 _8509 = float3(_3282, _3284, _3268);
    float _3288 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8509, float3(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8509, float3(0.0), isnan(_8509)), level(0.0)).x;
    float3 _8520 = float3(_3282, _3284, _3268);
    float4 _3291 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8520, float3(0.0), isnan(_8520)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8520, float3(0.0), isnan(_8520)), level(0.0)).xyzw;
    float _3293 = _3291.x;
    float _3295 = _3291.y;
    float _3297 = _3291.z;
    float _3299 = _3291.w;
    float _3301 = -_3266;
    float _3303 = fma(_3286, _3301, 1.0);
    float2 _8542 = float2(_3303, _3276);
    float3 _3307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8542, float2(0.0), isnan(_8542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8542, float2(0.0), isnan(_8542)), level(0.0)).xyz;
    float _3309 = _3307.x;
    float _3311 = _3307.y;
    float _3313 = _3307.z;
    float _3315 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3317 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3319 = _3228 * 0.5;
    out.m_78.x = _2228;
    out.m_78.y = _2222;
    bool _3321 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3323 = isnan(_3078);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3329 = _3325 || _3327;
    float _3331 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3317);
    float _3333 = exp2(_3315);
    out.m_80.x = _2974;
    out.m_80.y = _2972;
    out.m_80.z = _2976;
    float _3335 = _3254 + _3228;
    float _3337 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3331);
    float _3339 = fma(_3264, -0.5, _3319);
    float _3341 = _3335 * 0.5;
    float _3343 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3337);
    float _3345 = _3343 + _3228;
    out.gl_Position.x = _3254;
    out.gl_Position.y = _3264;
    out.gl_Position.z = _3343;
    out.gl_Position.w = _3228;
    float _3347 = _3345 * 0.5;
    float _3349 = -_3333;
    float _3351 = _3349 + 1.0;
    float _3353 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _3341;
    out.m_82.y = _3339;
    out.m_82.z = _3347;
    out.m_82.w = _3228;
    float _3355 = -_3353;
    float _3357 = _3355 + 1.0;
    float _3359 = _3228;
    float _3361 = _3343;
    float _3363 = _3264;
    float _3365 = _3254;
    float _3367 = _3339;
    float _3369 = _3341;
    if (!_3329)
    {
        _3359 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3371 = _3359;
    float _3373 = _3371;
    float _3375 = _3371;
    if (!_3329)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3377 = _3361;
    float _3379 = _3377;
    float _3381 = _3377;
    if (!_3329)
    {
        _3363 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3383 = _3363;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3329)
    {
        _3365 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3389 = _3365;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3329)
    {
        _3367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3395 = _3367;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3329)
    {
        _3369 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3401 = _3369;
    float _3403 = _3353 * _3288;
    float _3405 = _3299 * _3403;
    float _3407 = _3299 * _3357;
    float _3409 = _3313 * _3403;
    float _3411 = fma(_3309, _3405, _3293);
    float _3413 = fma(_3311, _3405, _3295);
    float _3415 = fma(_3299, _3409, _3297);
    out.m_84.x = _3411;
    out.m_84.y = _3413;
    out.m_84.z = _3415;
    out.m_84.w = _3407;
    bool _3417 = !_3329;
    float _3419 = _3401;
    float _3421 = _3401;
    if (!_3417)
    {
        bool _3423 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3425 = isnan(_3078);
        bool _3427 = _3423 || _3425;
        bool _3429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3431 = _3427 || _3429;
        if (!_3431)
        {
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3435 = _3078 + _3433;
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3439 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3437;
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3443 = _3441 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3445 = 1.0 / _3439;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3463 = _3435 * _3445;
            float _3465 = precise::clamp(_3463, 0.0, 1.0);
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3471 = fma(_3465, _3443, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3473 = fma(_3465, _3469, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3475 = fma(_3465, _3449, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3477 = fma(_3465, _3453, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3479 = fma(_3465, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3481 = fma(_3465, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3421 = _3475;
            _3387 = _3479;
            _3399 = _3471;
            _3381 = _3477;
            _3375 = _3473;
            _3393 = _3481;
            _3483 = true;
        }
        else
        {
            bool _3485 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3487 = isnan(_3078);
            bool _3489 = _3485 || _3487;
            bool _3491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3493 = _3489 || _3491;
            if (!_3493)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3495 = _3397;
            _3399 = _3495;
            if (!_3493)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3497 = _3419;
            _3421 = _3497;
            if (!_3493)
            {
                _3373 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3499 = _3373;
            _3375 = _3499;
            if (!_3493)
            {
                _3379 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3501 = _3379;
            _3381 = _3501;
            if (!_3493)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3503 = _3385;
            _3387 = _3503;
            if (!_3493)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3505 = _3391;
            bool _3507 = !_3493;
            _3393 = _3505;
            if (!_3507)
            {
                bool _3509 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3511 = isnan(_3078);
                bool _3513 = _3509 || _3511;
                bool _3515 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3517 = _3513 || _3515;
                if (!_3517)
                {
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3521 = _3078 + _3519;
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3525 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3523;
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3531 = 1.0 / _3525;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3549 = _3521 * _3531;
                    float _3551 = precise::clamp(_3549, 0.0, 1.0);
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3557 = fma(_3551, _3529, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3559 = fma(_3551, _3555, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3561 = fma(_3551, _3535, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3563 = fma(_3551, _3539, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3565 = fma(_3551, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3567 = fma(_3551, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3421 = _3561;
                    _3387 = _3565;
                    _3399 = _3557;
                    _3381 = _3563;
                    _3375 = _3559;
                    _3393 = _3567;
                    _3483 = true;
                }
                else
                {
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3381 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3375 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3483 = false;
    float _3569 = _3421;
    float _3571 = _3387;
    float _3573 = _3399;
    float _3575 = _3381;
    float _3577 = _3375;
    float _3579 = _3393;
    float _3581 = fma(_2658, -0.5, 0.5);
    float _3583 = precise::clamp(_3581, 0.0, 1.0);
    float _3585 = -_3569;
    float _3587 = _3585 + _3571;
    float _3589 = -_3573;
    float _3591 = _3589 + _3575;
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    bool _3597 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3599 = fma(_3583, _3587, _3569);
    float _3601 = fma(_3583, _3591, _3573);
    float _3603 = fma(_3583, _3595, _3577);
    float _3605 = _3599 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3607 = fma(_3601, 0.298911988735198974609375, _3605);
    float _3609 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3611 = fma(_3603, 0.114477999508380889892578125, _3607);
    out.m_86.w = _3609;
    float _3613 = -_3611;
    float _3615 = _3601 + _3613;
    float _3617 = -_3611;
    float _3619 = _3599 + _3617;
    float _3621 = -_3611;
    float _3623 = _3603 + _3621;
    out.m_88.x = 0.0;
    float _3625 = fma(_3615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    float _3627 = fma(_3619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    float _3629 = fma(_3623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    out.m_90.x = _3625;
    out.m_90.y = _3627;
    out.m_90.z = _3629;
    if (!_3597)
    {
        return out;
    }
    float _3631 = -_2972;
    float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3635 = -_2974;
    float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3639 = -_2976;
    float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3643 = _3633 * _3633;
    float _3645 = fma(_3637, _3637, _3643);
    float _3647 = fma(_3641, _3641, _3645);
    float _3649 = sqrt(_3647);
    float _3651 = rsqrt(_3647);
    float _3653 = -_3649;
    float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3657 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = _3637 * _3651;
    float _3663 = _3633 * _3651;
    float _3665 = abs(_3659);
    float _3667 = log2(_3665);
    float _3669 = _3641 * _3651;
    float _3671 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3673 = _2658 * _3663;
    float _3675 = -_3663;
    float _3677 = -_3671;
    float _3679 = fma(_3675, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3677);
    float _3681 = fma(_2656, _3661, _3673);
    float _3683 = -_3669;
    float _3685 = fma(_3683, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3679);
    float _3687 = fma(_2660, _3669, _3681);
    float _3689 = precise::clamp(_3687, 0.0, 1.0);
    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3693 = _3685 + _3691;
    float _3695 = _3667 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3697 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3699 = precise::clamp(_3697, 0.0, 1.0);
    float _3701 = exp2(_3695);
    float _3703 = _3701 * _3699;
    float _3705 = _3689 * _3703;
    float _3707 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3709 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3711 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3707;
    out.m_88.y = _3709;
    out.m_88.z = _3711;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3483 = false;
    bool _511 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3768 = as_type<float>(_125);
        out.gl_Position.z = _3768;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3841 = as_type<float>(_163);
        out.gl_Position.z = _3841;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _167;
    if (!_179)
    {
        float _203 = _167 * _167;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = in.m_62.x;
    float _211 = in.m_62.y;
    float _213 = in.m_62.z;
    float _215 = _207;
    float _217 = _193;
    if (!_179)
    {
        float _219 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _219;
    }
    float _221 = _215;
    float _223 = in.m_64.x;
    float _225 = in.m_64.y;
    float _227 = in.m_64.z;
    int _229 = as_type<int>(_165) & 1;
    bool _231 = _229 != 0;
    int _233 = as_type<int>(_165) & 2;
    bool _235 = _233 != 0;
    int _237 = int(_231);
    int _239 = _235 ? 2 : 0;
    int _241 = _237 | _239;
    int _243 = _179 ? 4 : 0;
    int _245 = _241 | _243;
    int _247 = false ? 8 : 0;
    int _249 = _245 | _247;
    int _251 = false ? 16 : 0;
    int _253 = _249 | _251;
    int _255 = false ? 32 : 0;
    int _257 = _253 | _255;
    int _259 = false ? 64 : 0;
    int _261 = _257 | _259;
    int _263 = _261 & 4;
    bool _265 = !_231;
    float _267 = _265 ? (-0.5) : 0.5;
    bool _269 = !_235;
    float _271 = _269 ? (-0.5) : 0.5;
    bool _273 = !_179;
    float _275 = _221;
    float _277 = 0.0;
    float _279 = as_type<float>(_263);
    if (!_273)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _167 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _167);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _309;
        _277 = _293;
        _279 = _299;
    }
    float _311 = _275;
    float _313 = _277;
    float _315 = _279;
    bool _317 = !_179;
    float _319 = _315;
    float _321 = _313;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _167 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _319 = _329;
        _201 = _341;
    }
    float _343 = _319;
    float _345 = _201;
    float _347 = _343;
    if (!_179)
    {
        float _349 = _145 * _145;
        float _351 = _349 * 0.5;
        _321 = _351;
    }
    float _353 = _321;
    float _355 = _353;
    if (!_179)
    {
        _347 = _145;
    }
    float _357 = _347;
    float _359 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _357;
    if (!_179)
    {
        float _365 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_179;
    float _371 = _367;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _145 * _375;
        float _385 = exp2(_383);
        float _387 = _381 * 0.693147182464599609375;
        float _389 = 1.0 / _387;
        float _391 = 1.0 / _379;
        float _393 = _385 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _389, _145);
        float _399 = _397 * _391;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_179;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _145 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _363 = _425;
    }
    float _427 = _363;
    float _429 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _431 = fma(_345, _181, _359);
    float _433 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _435 = fma(_345, _183, _361);
    float _437 = fma(_345, _185, _429);
    float _439 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = fma(_427, _183, _433);
    float _443 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _447 = fma(_427, _181, _439);
    float _449 = -_441;
    float _451 = _435 + _449;
    float _453 = fma(_427, _185, _443);
    float _455 = fma(_435, _169, _189);
    float _457 = fma(_431, _169, _187);
    float _459 = -_447;
    float _461 = _431 + _459;
    float _463 = _451 * _195;
    float _465 = _451 * _211;
    float _467 = _451 * _225;
    float _469 = -_453;
    float _471 = _437 + _469;
    float _473 = fma(_461, _193, _463);
    float _475 = fma(_461, _209, _465);
    float _477 = fma(_461, _223, _467);
    float _479 = fma(_437, _169, _191);
    float _481 = fma(_471, _197, _473);
    float _483 = fma(_471, _213, _475);
    float _485 = fma(_471, _227, _477);
    bool _487 = !_445;
    float _489 = _483;
    float _491 = _481;
    float _493 = _485;
    float _509;
    if (!_487)
    {
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _497 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_109);
        float _515 = 1.0 / _513;
        float _517 = _145 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _523 = int(_521);
    float _525 = in.m_51.y;
    float _527 = _455 * _195;
    float _529 = in.m_51.z;
    float _531 = fma(_457, _193, _527);
    float _533 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _535 = int(_533);
    float _537 = in.m_51.w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _541 = in.m_60.w;
    bool _543 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _545 = isnan(_519);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = float(_523);
    float _557 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _559 = int(_557);
    float _561 = in.m_64.w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = in.m_62.w;
    float _569 = 1.0 / _555;
    float _571 = float(uint(_535));
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _575 = 1.0 + _573;
    int _577 = ~_535;
    int _579 = _577 + 1;
    float _581 = float(_535);
    bool _583 = _535 == 0;
    float _585 = 1.0 / _571;
    float _587 = float(uint(_559));
    int _589 = ~_559;
    int _591 = _589 + 1;
    int _593 = ~_559;
    int _595 = _593 + 1;
    float _597 = _145 * _569;
    float _599 = 1.0 / _587;
    int _601 = as_type<int>(_585) + (-2);
    float _603 = trunc(_597);
    int _605 = int(_603);
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _609 = _607 != 0;
    float _611 = 1.0 / _575;
    int _613 = ~_535;
    int _615 = _613 + 1;
    float _617 = float(uint(_605));
    float _619 = as_type<float>(_601) * _617;
    float _621 = trunc(_619);
    float _623 = precise::max(_621, 0.0);
    uint _626 = uint(_623);
    float _628 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _630 = int(_628);
    int _632 = _579 * int(_626);
    int _634 = _632 + _605;
    float _636 = as_type<float>(_579);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_609)
    {
        _636 = 1.0;
    }
    float _640 = _636;
    float _642 = _640;
    if (!_609)
    {
        _642 = 7.345489978790283203125;
    }
    float _644 = _642;
    float _646 = float(uint(_634));
    float _648 = _644 * _131;
    float _650 = as_type<float>(_601) * _646;
    float _652 = trunc(_650);
    float _654 = precise::max(_652, 0.0);
    uint _656 = uint(_654);
    float _658 = floor(_648);
    int _660 = int(_626) + int(_656);
    float _662 = float(_605);
    int _664 = _615 * _660;
    int _666 = _664 + _605;
    bool _668 = _662 >= _581;
    bool _670 = isnan(_662);
    bool _672 = _668 || _670;
    bool _674 = isnan(_581);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_658;
    float _682 = _648 + _680;
    int _684 = _535 + (-1);
    bool _686 = uint(_666) >= uint(_535);
    float _688 = _682 * _581;
    float _690 = float(_109);
    float _692 = trunc(_678);
    int _694 = int(_692);
    bool _696 = !_686;
    int _698 = _696 ? 0 : (-1);
    int _700 = ~_660;
    int _702 = _700 + _698;
    int _704 = _702 + 1;
    float _706 = float(_630);
    float _708 = 1.0 / _690;
    int _710 = _535 * _704;
    int _712 = _710 + _605;
    bool _714 = !_583;
    int _716 = _714 ? _712 : (-1);
    float _718 = 1.0 / _706;
    int _720 = ~_694;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    int _726 = _716 * _724;
    float _728 = _145 * _708;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _740 = _738 != 0;
    float _742 = trunc(_688);
    int _744 = int(_742);
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _748 = _746 != 0;
    float _750 = _728 * _581;
    int _752 = _694 * _684;
    int _754 = _752 + _726;
    bool _756 = !_736;
    int _758 = _756 ? 0 : 1;
    float _760 = _145 * _718;
    bool _762 = !_748;
    int _764 = _762 ? 0 : 1;
    float _766 = trunc(_750);
    int _768 = int(_766);
    bool _770 = !_732;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_758);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _778 = _776 != 0;
    bool _780 = !_740;
    int _782 = _780 ? 0 : 1;
    float _784 = trunc(_760);
    int _786 = int(_784);
    int _788 = abs(_764);
    int _790 = _754 * _774;
    int _792 = abs(_772);
    bool _794 = !_778;
    int _796 = _794 ? 0 : 1;
    int _798 = _744 * _788;
    int _800 = _798 + _605;
    int _802 = abs(_782);
    int _804 = abs(_796);
    int _806 = _768 * _792;
    int _808 = _806 + _790;
    int _810 = ~_559;
    int _812 = _810 + 1;
    float _814 = float(uint(_786));
    int _816 = _800 * _802;
    int _818 = _816 + _808;
    int _820 = as_type<int>(_599) + (-2);
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _824 = _822 != 0;
    int _826 = _744 * _804;
    int _828 = _826 + _818;
    int _830 = ~_535;
    int _832 = _830 + 1;
    float _834 = as_type<float>(_820) * _814;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _838 = _836 != 0;
    float _840 = float(uint(_828));
    float _842 = trunc(_834);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = as_type<float>(_601) * _840;
    float _850 = _848;
    if (_824)
    {
        _638 = _131;
    }
    float _852 = _638;
    float _854 = trunc(_848);
    float _856 = precise::max(_854, 0.0);
    uint _858 = uint(_856);
    float _860 = _852;
    if (!_824)
    {
        _860 = _525;
    }
    float _862 = _860;
    int _864 = _812 * int(_846);
    int _866 = _864 + _786;
    if (_824)
    {
        _850 = 1.0;
    }
    float _868 = _850;
    float _870 = _868;
    if (!_824)
    {
        _870 = 1.2345600128173828125;
    }
    float _872 = _870;
    float _874 = float(uint(_866));
    int _876 = _832 * int(_858);
    int _878 = _876 + _828;
    float _880 = _872 * _862;
    float _882 = as_type<float>(_820) * _874;
    int _884 = ~_559;
    int _886 = _884 + 1;
    float _888 = float(uint(_878));
    float _890 = trunc(_882);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    float _896 = as_type<float>(_601) * _888;
    float _898 = trunc(_896);
    float _900 = precise::max(_898, 0.0);
    uint _902 = uint(_900);
    int _904 = int(_846) + int(_894);
    int _906 = ~_535;
    int _908 = _906 + 1;
    float _910 = floor(_880);
    int _912 = _886 * _904;
    int _914 = _912 + _786;
    int _916 = int(_858) + int(_902);
    float _918 = float(_559);
    float _920 = float(_786);
    int _922 = _908 * _916;
    int _924 = _922 + _828;
    bool _926 = uint(_914) >= uint(_559);
    bool _928 = _920 >= _918;
    bool _930 = isnan(_920);
    bool _932 = _928 || _930;
    bool _934 = isnan(_918);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    bool _940 = uint(_924) >= uint(_535);
    bool _942 = !_926;
    int _944 = _942 ? 0 : (-1);
    float _946 = -_910;
    float _948 = _880 + _946;
    float _950 = trunc(_938);
    int _952 = int(_950);
    bool _954 = !_838;
    int _956 = _954 ? 0 : 1;
    bool _958 = !_940;
    int _960 = _958 ? 0 : (-1);
    float _962 = _948 * _918;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _966 = _964 != 0;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _978 = _976 != 0;
    float _980 = _728 * _918;
    int _982 = ~_904;
    int _984 = _982 + _944;
    int _986 = _984 + 1;
    int _988 = abs(_956);
    float _990 = trunc(_962);
    int _992 = int(_990);
    bool _994 = !_970;
    int _996 = _994 ? 0 : 1;
    int _998 = _559 * _986;
    int _1000 = _998 + _786;
    bool _1002 = _559 == 0;
    int _1004 = abs(_996);
    int _1006 = ~_952;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = trunc(_980);
    int _1014 = int(_1012);
    bool _1016 = !_1002;
    int _1018 = _1016 ? _1000 : (-1);
    int _1020 = ~_916;
    int _1022 = _1020 + _960;
    int _1024 = _1022 + 1;
    bool _1026 = _535 == 0;
    int _1028 = _1018 * _1010;
    int _1030 = _559 + (-1);
    int _1032 = _535 * _1024;
    int _1034 = _1032 + _828;
    bool _1036 = !_978;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1042 = log2(_1040);
    int _1044 = _952 * _1030;
    int _1046 = _1044 + _1028;
    bool _1048 = !_974;
    int _1050 = _1048 ? 0 : 1;
    int _1052 = _992 * _988;
    int _1054 = _1052 + _786;
    bool _1056 = !_966;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = _1046 * _1004;
    bool _1062 = !_1026;
    int _1064 = _1062 ? _1034 : (-1);
    int _1066 = abs(_1058);
    int _1068 = abs(_1050);
    int _1070 = _1064 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = abs(_1038);
    int _1076 = _1014 * _1066;
    int _1078 = _1076 + _1060;
    bool _1080 = uint(_1070) > 1u;
    int _1082 = _1064 & 3;
    bool _1084 = _1082 != 0;
    int _1086 = _1054 * _1068;
    int _1088 = _1086 + _1078;
    float _1090 = _131 * 2.0;
    int _1092 = _1084 ? 0 : 1;
    bool _1094 = _1070 != 3;
    int _1096 = _992 * _1074;
    int _1098 = _1096 + _1088;
    float _1100 = floor(_1090);
    int _1102 = ~_1092;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = _1106;
    if (!_1080)
    {
        int _1110 = ~_1092;
        int _1112 = _1110 + 1;
        _1108 = _1112;
    }
    int _1114 = _1108;
    bool _1116 = uint(_1070) >= 2u;
    float _1118 = float(uint(_1098));
    int _1120 = _1116 ? 0 : 1;
    float _1122 = as_type<float>(_820) * _1118;
    bool _1124 = _131 > 0.5;
    int _1126 = ~_1120;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = trunc(_1122);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = _1130;
    if (_1094)
    {
        int _1140 = ~_1120;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    int _1146 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1148 = _1146 != 0;
    float _1150 = _525 * 2.0;
    float _1152 = -_267;
    int _1154 = _1124 ? as_type<int>(_1152) : as_type<int>(_267);
    bool _1156 = _1100 > 0.0;
    bool _1158 = !_1148;
    float _1160 = _1158 ? _267 : as_type<float>(_1154);
    float _1162 = floor(_1150);
    bool _1164 = _1100 >= 0.0;
    bool _1166 = isnan(_1100);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    int _1174 = ~_559;
    int _1176 = _1174 + 1;
    int _1178 = _1172 ? 0 : 1;
    bool _1180 = _525 > 0.5;
    int _1182 = ~_1178;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = _1186;
    if (!_1156)
    {
        int _1190 = ~_1178;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    int _1196 = _1176 * int(_1136);
    int _1198 = _1196 + _1098;
    float _1200 = _529 * 2.0;
    float _1202 = -_271;
    int _1204 = _1180 ? as_type<int>(_1202) : as_type<int>(_271);
    bool _1206 = _529 > 0.5;
    float _1208 = floor(_1200);
    float _1210 = float(uint(_1198));
    bool _1212 = _1162 > 0.0;
    float _1214 = -_267;
    int _1216 = _1206 ? as_type<int>(_1214) : as_type<int>(_267);
    float _1218 = as_type<float>(_820) * _1210;
    bool _1220 = _1162 >= 0.0;
    bool _1222 = isnan(_1162);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan(0.0);
    bool _1228 = _1224 || _1226;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1218);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1228 ? 0 : 1;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>(_1162);
    if (_824)
    {
        _1246 = 0;
    }
    int _1248 = _1246;
    int _1250 = _1248;
    if (!_824)
    {
        _1250 = 1;
    }
    int _1252 = _1250;
    int _1254 = ~_1240;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    bool _1260 = !_1232;
    float _1262 = _1260 ? _267 : as_type<float>(_1216);
    int _1264 = _1258;
    if (!_1212)
    {
        int _1266 = ~_1240;
        int _1268 = _1266 + 1;
        _1264 = _1268;
    }
    int _1270 = _1264;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1282 = _1280 != 0;
    bool _1284 = _1208 >= 0.0;
    bool _1286 = isnan(_1208);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    int _1294 = int(_1136) + int(_1238);
    int _1296 = _1292 ? 0 : 1;
    bool _1298 = _1252 != 1;
    float _1300 = _145 * _1042;
    int _1302 = _591 * _1294;
    int _1304 = _1302 + _1098;
    bool _1306 = !_1244;
    float _1308 = _1306 ? _271 : as_type<float>(_1204);
    float _1310 = exp2(_1300);
    bool _1312 = _1208 > 0.0;
    bool _1314 = !_1274;
    int _1316 = _1314 ? 0 : 1;
    bool _1318 = uint(_1304) >= uint(_559);
    float _1320 = 0.0;
    if (!_1298)
    {
        _1320 = _525;
    }
    float _1322 = _1320;
    float _1324 = 0.0;
    float _1326 = _1322;
    if (!_1298)
    {
        _1324 = _525;
    }
    float _1328 = _1324;
    float _1330 = 0.0;
    float _1332 = _1328;
    if (!_1298)
    {
        _1330 = _529;
    }
    float _1334 = _1330;
    float _1336 = 0.0;
    float _1338 = _1334;
    if (!_1298)
    {
        _1336 = _529;
    }
    float _1340 = _1336;
    float _1342 = -_1310;
    float _1344 = _1342 + 1.0;
    float _1346 = _1340;
    if (_1298)
    {
        _1326 = _131;
    }
    float _1348 = _1326;
    if (_1298)
    {
        _1332 = _131;
    }
    float _1350 = _1332;
    if (_1298)
    {
        _1338 = _525;
    }
    float _1352 = _1338;
    if (_1298)
    {
        _1346 = _525;
    }
    float _1354 = _1346;
    bool _1356 = !_1318;
    int _1358 = _1356 ? 0 : (-1);
    bool _1360 = !_1072;
    int _1362 = _1360 ? 0 : 1;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1374 = _1372 != 0;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1376;
    int _1380 = ~_1296;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1384;
    if (!_1312)
    {
        int _1388 = ~_1296;
        int _1390 = _1388 + 1;
        _1386 = _1390;
    }
    int _1392 = _1386;
    float _1394 = 1.0 / _1378;
    bool _1396 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1398 = isnan(0.0);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1404 = _1400 || _1402;
    float _1406 = _455 * _211;
    float _1408 = _1404 ? _1344 : 0.0;
    float _1410 = fma(_457, _209, _1406);
    bool _1412 = _537 > 0.5;
    float _1414 = _455 * _225;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1420 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1422 = fma(_457, _223, _1414);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1426 = _519 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1428;
    float _1432 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1434 = 1.0 / _1418;
    float _1436 = _1426 * _1394;
    float _1438 = _131 + _525;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1442 = fma(_1420, -2.0, _539);
    float _1444 = fma(_479, _197, _531);
    float _1446 = _1438 + (-1.0);
    float _1448 = float(uint(_800));
    float _1450 = 1.0 / _1430;
    float _1452 = -_1440;
    float _1454 = fma(_1432, 2.0, _1452);
    float _1456 = fma(_479, _213, _1410);
    float _1458 = fma(_479, _227, _1422);
    float _1460 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1462 = _131 + _529;
    float _1464 = _529 + _525;
    float _1466 = _1444 + _541;
    float _1468 = as_type<float>(_601) * _1448;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1472 = _519 + _1470;
    float _1474 = _1462 + (-1.0);
    float _1476 = _1464 + (-1.0);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1480 = _519 + _1478;
    float _1482 = trunc(_1468);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    float _1488 = _1472 * _1450;
    float _1490 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1494 = _1458 + _561;
    bool _1496 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1498 = isnan(_519);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = _1480 * _1434;
    bool _1510 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1512 = isnan(_519);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1456 + _567;
    float _1524 = fma(_565, _1436, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1526 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1528 = isnan(_519);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = -_1506;
    float _1540 = _1538 + 1.0;
    float _1542 = -_1520;
    float _1544 = _1542 + 1.0;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1558 = _1520 * _1540;
    int _1560 = ~_535;
    int _1562 = _1560 + 1;
    float _1564 = _553 * _1544;
    float _1566 = -_553;
    float _1568 = _1566 + 1.0;
    float _1570 = -_145;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1454);
    float _1574 = fma(_1552, _1508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1576 = _1562 * int(_1486);
    int _1578 = _1576 + _800;
    float _1580 = _1536 * _1568;
    float _1582 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1442);
    float _1584 = _1308 + (-0.5);
    float _1586 = fma(_1556, _1508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1588 = float(uint(_1578));
    float _1590 = _1524 * _1580;
    float _1592 = -_1584;
    float _1594 = -_1582;
    float _1596 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1594);
    float _1598 = _1160 + 0.5;
    float _1600 = as_type<float>(_601) * _1588;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1572);
    float _1606 = fma(_1548, _1436, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1610 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1602);
    float _1612 = float(uint(_1054));
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1616 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1608);
    float _1618 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1620 = trunc(_1600);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    float _1626 = as_type<float>(_820) * _1612;
    float _1628 = _1606 * _1580;
    float _1630 = -_1614;
    float _1632 = fma(_1618, 2.0, _1630);
    float _1634 = -_1536;
    float _1636 = _1634 + 1.0;
    bool _1638 = !_1282;
    int _1640 = _1638 ? 0 : 1;
    float _1642 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1644 = trunc(_1626);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1652 = !_1278;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1628);
    int _1658 = ~_559;
    int _1660 = _1658 + 1;
    float _1662 = fma(_1642, -2.0, _1650);
    int _1664 = abs(_1640);
    float _1666 = _1408 * _611;
    int _1668 = abs(_1316);
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1672 = _1522 + _1670;
    int _1674 = ~_535;
    int _1676 = _1674 + 1;
    float _1678 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1590);
    int _1680 = abs(_1654);
    float _1682 = -_145;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1632);
    float _1686 = float(_1194);
    float _1688 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1662);
    int _1690 = ~_1294;
    int _1692 = _1690 + _1358;
    int _1694 = _1692 + 1;
    int _1696 = _1660 * int(_1648);
    int _1698 = _1696 + _1054;
    float _1700 = float(_1270);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1466 + _1702;
    float _1706 = float(_1664);
    int _1708 = _559 * _1694;
    int _1710 = _1708 + _1098;
    float _1712 = float(_1668);
    float _1714 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1716 = int(_1486) + int(_1624);
    float _1718 = _1706 * _1700;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1722 = _1494 + _1720;
    float _1724 = float(uint(_1698));
    float _1726 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1610);
    int _1728 = _1064 >> 31;
    int _1730 = _1676 * _1716;
    int _1732 = _1730 + _800;
    bool _1734 = !_1002;
    int _1736 = _1734 ? _1710 : (-1);
    float _1738 = as_type<float>(_820) * _1724;
    float _1740 = -_271;
    int _1742 = _1412 ? as_type<int>(_1740) : as_type<int>(_271);
    float _1744 = _1262 + 0.5;
    int _1746 = _1728 & 3;
    float _1748 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1616);
    bool _1750 = uint(_1732) >= uint(_535);
    float _1752 = trunc(_1738);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = _1736 >> 31;
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1684);
    int _1762 = _1064 + _1746;
    float _1764 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1714);
    int _1766 = _1758 & 3;
    float _1768 = -_1748;
    float _1770 = _1768 + 1.0;
    bool _1772 = !_1374;
    float _1774 = _1772 ? _271 : as_type<float>(_1742);
    float _1776 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1764);
    int _1778 = _1736 + _1766;
    int _1780 = _1762 >> 2;
    bool _1782 = _1070 != 3;
    int _1784 = _1780 << 4;
    int _1786 = _1784 + 368;
    float _1788 = in.m_66.x;
    float _1790 = in.m_66.y;
    float _1792 = in.m_66.z;
    int _1794 = _1778 >> 2;
    float _1796 = float(_1680);
    uint _1798 = uint(int(uint(_1786) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    bool _1814 = !_1782;
    int _1816 = _1814 ? 0 : (-1);
    bool _1818 = !_1750;
    int _1820 = _1818 ? 0 : (-1);
    float _1822 = _1796 * _1686;
    int _1824 = _1736 & 3;
    bool _1826 = _1824 != 0;
    float _1828 = _1774 + (-0.5);
    int _1830 = _1736 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = _1794 << 4;
    int _1836 = _1834 + 512;
    float _1838 = -_1828;
    float _1840 = -_1688;
    float _1842 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1840);
    bool _1844 = !_1832;
    int _1846 = _1844 ? 0 : 1;
    int _1848 = _1786 + 8;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    uint _1852 = uint(int(uint(int(_1850)) >> uint(2)));
    int _1854 = int(_1850) & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = int(_1850) + 1;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    int _1862 = _1858 & 3;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[int(_1860)][_1862];
    bool _1866 = uint(_1830) > 1u;
    float _1868 = _131 + (-0.5);
    float _1870 = float(_1392);
    int _1872 = int(_1648) + int(_1756);
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1876 = ~_1716;
    int _1878 = _1876 + _1820;
    int _1880 = _1878 + 1;
    uint _1882 = uint(int(uint(_1836) >> uint(2)));
    uint _1884 = uint(int(uint(int(_1882)) >> uint(2)));
    int _1886 = int(_1882) & 3;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[int(_1884)][_1886];
    int _1890 = int(_1882) + 1;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    int _1894 = _1890 & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    float _1898 = _1712 * _1870;
    int _1900 = _1826 ? 0 : 1;
    int _1902 = _595 * _1872;
    int _1904 = _1902 + _1054;
    bool _1906 = _1776 >= 0.0;
    float _1908 = _1898 * (-2.0);
    int _1910 = ~_1900;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1874);
    int _1918 = _1914;
    float _1920 = _1898;
    if (!_1866)
    {
        int _1922 = ~_1900;
        int _1924 = _1922 + 1;
        _1918 = _1924;
    }
    int _1926 = _1918;
    float _1928 = fma(_1908, _1788, _1788);
    int _1930 = _1836 + 8;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
    int _1936 = int(_1932) & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = int(_1932) + 1;
    uint _1942 = uint(int(uint(_1940) >> uint(2)));
    int _1944 = _1940 & 3;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[int(_1942)][_1944];
    bool _1948 = uint(_1830) >= 2u;
    float _1950 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1928);
    int _1952 = abs(_1114);
    int _1954 = _535 * _1880;
    int _1956 = _1954 + _800;
    int _1958 = _1948 ? 0 : 1;
    float _1960 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1916);
    bool _1962 = uint(_1904) >= uint(_559);
    float _1964 = fma(_1460, _1908, _1460);
    float _1966 = _1792;
    if (_1906)
    {
        _1920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1968 = _1920;
    int _1970 = as_type<int>(_1968);
    if (_1906)
    {
        out.m_47.x = 0.0;
    }
    bool _1972 = !_1962;
    int _1974 = _1972 ? 0 : (-1);
    bool _1976 = _1830 != 3;
    if (_1906)
    {
        float _1978 = _1968 * 5.0;
        _1970 = as_type<int>(_1978);
    }
    int _1980 = _1970;
    int _1982 = ~_1872;
    int _1984 = _1982 + _1974;
    int _1986 = _1984 + 1;
    int _1988 = abs(_1926);
    if (_1906)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6421 = as_type<float>(_1980);
        out.gl_Position.z = _6421;
    }
    bool _1990 = !_1976;
    int _1992 = _1990 ? 0 : (-1);
    int _1994 = _559 * _1986;
    int _1996 = _1994 + _1054;
    bool _1998 = _1830 != 3;
    int _2000 = abs(_1144);
    bool _2002 = _535 == 0;
    bool _2004 = !_2002;
    int _2006 = _2004 ? _1956 : (-1);
    int _2008 = ~_1952;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = abs(_1362);
    int _2016 = _2012 * as_type<int>(_1812);
    int _2018 = ~_1988;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = ~_2014;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2022 * as_type<int>(_1896);
    int _2032 = ~_1958;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    int _2038 = _2028 * as_type<int>(_1804);
    int _2040 = _2038 + _2016;
    int _2042 = ~_2000;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = abs(_1846);
    int _2050 = _2036;
    if (_1998)
    {
        int _2052 = ~_1958;
        int _2054 = _2052 + 1;
        _2050 = _2054;
    }
    int _2056 = _2050;
    int _2058 = _2046 * as_type<int>(_1856);
    int _2060 = _2058 + _2040;
    int _2062 = ~_2048;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    int _2068 = abs(_2056);
    bool _2070 = !_1366;
    int _2072 = _2070 ? 0 : 1;
    int _2074 = _2066 * as_type<int>(_1888);
    int _2076 = _2074 + _2030;
    int _2078 = abs(_1816);
    int _2080 = abs(_1992);
    int _2082 = ~_2068;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    bool _2088 = !_1370;
    int _2090 = _2088 ? 0 : 1;
    int _2092 = abs(_2072);
    int _2094 = _2086 * as_type<int>(_1938);
    int _2096 = _2094 + _2076;
    int _2098 = ~_2078;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    int _2104 = ~_2080;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = abs(_2090);
    int _2112 = _2102 * as_type<int>(_1864);
    int _2114 = _2112 + _2060;
    float _2116 = _1672 * _1672;
    int _2118 = _2108 * as_type<int>(_1946);
    int _2120 = _2118 + _2096;
    int _2122 = ~_2110;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = fma(_1704, _1704, _2116);
    int _2130 = _2120 * _2126;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2134 = ~_2092;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = fma(_1722, _1722, _2128);
    bool _2142 = !_1002;
    int _2144 = _2142 ? _1996 : (-1);
    float _2146 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2132);
    bool _2148 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2150 = isnan(1.0);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2156 = _2152 || _2154;
    int _2158 = _2114 * _2138;
    float _2160 = rsqrt(_2140);
    float _2162 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2146);
    int _2164 = _2006 * _2092;
    int _2166 = _2164 + _2158;
    int _2168 = _2144 * _2110;
    int _2170 = _2168 + _2130;
    float _2172 = -_2162;
    float _2174 = _2172 + 1.0;
    float _2176 = -_1726;
    float _2178 = _2176 + 1.0;
    float _2180 = -_1960;
    float _2182 = _2180 + 1.0;
    bool _2184 = !_2156;
    float _2186 = _2184 ? _145 : _1666;
    float _2188 = fma(_1308, _2174, _1596);
    float _2190 = -_2178;
    float _2192 = fma(_1262, _2190, _1760);
    float _2194 = -_2182;
    float _2196 = fma(_1160, _2194, _1604);
    float _2198 = fma(_1774, _1770, _1842);
    float _2200 = float(_2166);
    float _2202 = fma(_2186, _1964, _1950);
    float _2204 = float(_2170);
    float _2206 = _1672 * _2160;
    float _2208 = _1704 * _2160;
    out.m_68.x = _2196;
    out.m_68.y = _2188;
    out.m_68.z = _2192;
    out.m_68.w = _2198;
    float _2210 = -_2206;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _2214 = -_2208;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    out.m_70.x = _2200;
    out.m_70.y = _2204;
    float _2218 = _2212 * _2212;
    if (_1906)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2220 = -_2206;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _2224 = _1722 * _2160;
    float _2226 = -_2208;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1466);
    float _2230 = fma(_2216, _2216, _2218);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = _2222 + _2232;
    float _2236 = -_2224;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _2240 = -_2224;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _2228 + _2244;
    float _2248 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2250 = fma(_2238, _2238, _2230);
    float _2252 = _1822 * (-2.0);
    float _2254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2256 = _2242 + _2254;
    float _2258 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2248);
    float _2260 = _525 + (-0.5);
    float _2262 = fma(_2252, _1790, _1790);
    float _2264 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2258);
    float _2266 = fma(_1492, _2252, _1492);
    float _2268 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2262);
    float _2270 = _1718 * (-2.0);
    float _2272 = in.m_58.x;
    float _2274 = in.m_58.y;
    bool _2276 = _2264 >= 0.0;
    float _2278 = fma(_1586, _1564, _1678);
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2282 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2280;
    float _2284 = fma(_2270, _1792, _1792);
    float _2286 = _529 + (-0.5);
    float _2288 = fma(_2186, _2266, _2268);
    float _2290 = fma(_2282, _1488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2292 = fma(_1490, _2270, _1490);
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2284);
    float _2296 = _2202 * 0.15915493667125701904296875;
    float _2298 = _2288 * 0.15915493667125701904296875;
    float _2300 = fma(_2290, _1558, _2278);
    if (_2276)
    {
        _1966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _1966;
    float _2304 = fma(_2186, _2292, _2294);
    float _2306 = _2296 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2310;
    int _2314 = as_type<int>(_2302);
    if (_2276)
    {
        out.m_47.x = 0.0;
    }
    if (_2276)
    {
        float _2316 = _2302 * 5.0;
        _2314 = as_type<int>(_2316);
    }
    int _2318 = _2314;
    float _2320 = fma(_1574, _1564, _1656);
    float _2322 = fma(_2312, _1488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2324 = _2304 * 0.15915493667125701904296875;
    float _2326 = _2296 * 6.283185482025146484375;
    float _2328 = cos(_2326);
    float _2330 = _2298 * 6.283185482025146484375;
    float _2332 = sin(_2330);
    float _2334 = _2298 * 6.283185482025146484375;
    float _2336 = cos(_2334);
    float _2338 = sqrt(_2250);
    float _2340 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2300);
    float _2342 = _2340 * _2274;
    if (_2276)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6956 = as_type<float>(_2318);
        out.gl_Position.z = _6956;
    }
    if (_2276)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2344 = _2342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2346 = _2160 * _2338;
    float _2348 = _2324 * 6.283185482025146484375;
    float _2350 = cos(_2348);
    float _2352 = fma(_2322, _1558, _2320);
    float _2354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _271);
    float _2356 = _2346 * _2344;
    float _2358 = _2328 * _2336;
    float _2360 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2352);
    float _2362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _267);
    float _2364 = _2354 * _2356;
    float _2366 = _2324 * 6.283185482025146484375;
    float _2368 = sin(_2366);
    float _2370 = _2360 * _2272;
    float _2372 = _2308 * _2332;
    float _2374 = _2328 * _2332;
    float _2376 = _271 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2378 = _2370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2380 = _2308 * _2336;
    float _2382 = _2328 * _2350;
    float _2384 = _2346 * _2378;
    float _2386 = _2336 * _2350;
    float _2388 = _2308 * _2350;
    float _2390 = _2332 * _2350;
    float _2392 = _2362 * _2384;
    float _2394 = _2382 * _2364;
    float _2396 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2398 = _2396 * 0.5;
    float _2400 = fma(_2368, _2358, _2372);
    float _2402 = -_2380;
    float _2404 = fma(_2368, _2374, _2402);
    float _2406 = -_2364;
    float _2408 = _2368 * _2406;
    float _2410 = _2388 * _2364;
    float _2412 = fma(_2400, _2392, _2394);
    float _2414 = -_2374;
    float _2416 = fma(_2368, _2380, _2414);
    float _2418 = fma(_2386, _2392, _2408);
    float _2420 = fma(_2368, _2372, _2358);
    float _2422 = fma(_2404, _2398, _2412);
    float _2424 = fma(_2416, _2392, _2410);
    float _2426 = fma(_2390, _2398, _2418);
    float _2428 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2430 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2432 = fma(_2420, _2398, _2424);
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2436 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2438 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2430);
    float _2440 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2442 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2434);
    float _2444 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2428);
    float _2446 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2438);
    float _2448 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2450 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2442);
    float _2452 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2440);
    float _2454 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2456 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2460 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2462 = _1494 + _2454;
    float _2464 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2456);
    float _2466 = _1466 + _2458;
    float _2468 = fma(_2376, _2376, 1.0);
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2472 = _2462 + _2470;
    float _2474 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2478 = _2466 + _2476;
    float _2480 = _2382 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = _2472 * _2472;
    float _2484 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2486 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2452);
    float _2488 = rsqrt(_2468);
    float _2490 = fma(_2478, _2478, _2482);
    float _2492 = -_2368;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2460);
    float _2496 = -_2368;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2474);
    float _2500 = -_2368;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2504 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2506 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2484);
    float _2508 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2510 = sqrt(_2490);
    float _2512 = _2486 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2514 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2504);
    float _2516 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2508);
    float _2518 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2494);
    float _2520 = _1522 + _2512;
    float _2522 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2514);
    float _2524 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2506);
    float _2526 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    float _2528 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    float _2530 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2502);
    bool _2532 = _2510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2534 = _2420;
    float _2536 = _2512;
    float _2538 = _2426;
    if (!_2532)
    {
        _2534 = _2466;
    }
    float _2540 = _2534;
    float _2542 = _2540;
    if (!_2532)
    {
        _2536 = _2462;
    }
    float _2544 = _2536;
    float _2546 = _2544;
    if (!_2532)
    {
        _2538 = _2520;
    }
    float _2548 = _2538;
    bool _2550 = !_2532;
    float _2552 = _2548;
    if (!_2550)
    {
        float _2554 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2558 = _2510 + _2556;
        float _2560 = rsqrt(_2490);
        float _2562 = _2558 * _2554;
        float _2564 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = _2562 * 0.15915493667125701904296875;
        float _2568 = _2566 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = _2566 * 6.283185482025146484375;
        float _2574 = sin(_2572);
        float _2576 = _2570 + (-1.0);
        float _2578 = fma(_2574, _2564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2582 = _2560 * _2578;
        float _2584 = fma(_2520, _2570, _2580);
        float _2586 = fma(_2478, _2582, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2588 = fma(_2472, _2582, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2552 = _2584;
        _2542 = _2586;
        _2546 = _2588;
    }
    float _2590 = _2552;
    float _2592 = _2542;
    float _2594 = _2546;
    float _2596 = -_1522;
    float _2598 = _2596 + _2590;
    float _2600 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2602 = -_1466;
    float _2604 = _2602 + _2592;
    float _2606 = _267 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2608 = _2598 * _2598;
    float _2610 = -_1494;
    float _2612 = _2610 + _2594;
    float _2614 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2464);
    float _2616 = _2376 * _2488;
    float _2618 = fma(_2604, _2604, _2608);
    float _2620 = _2376 * _2518;
    float _2622 = _2376 * _2528;
    float _2624 = _2376 * _2530;
    float _2626 = fma(_2612, _2612, _2618);
    float _2628 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2448);
    float _2630 = -_2522;
    float _2632 = _2616 * _2630;
    float _2634 = -_2524;
    float _2636 = _2616 * _2634;
    float _2638 = sqrt(_2626);
    float _2640 = -_2526;
    float _2642 = _2616 * _2640;
    float _2644 = fma(_2606, _2614, _2620);
    float _2646 = fma(_2606, _2600, _2622);
    float _2648 = fma(_2606, _2628, _2624);
    float _2650 = fma(_2488, _2518, _2632);
    float _2652 = fma(_2488, _2528, _2636);
    float _2654 = fma(_2488, _2530, _2642);
    float _2656 = _2522 + _2644;
    float _2658 = _2524 + _2646;
    float _2660 = _2526 + _2648;
    out.m_72.x = _2614;
    out.m_72.y = _2600;
    out.m_72.z = _2628;
    out.m_74.x = _2650;
    out.m_74.y = _2652;
    out.m_74.z = _2654;
    bool _2662 = _2638 > 0.0;
    out.m_76.x = _2656;
    out.m_76.y = _2658;
    out.m_76.z = _2660;
    bool _2664 = !_2662;
    float _2666 = _2644;
    float _2668 = _2652;
    float _2670 = _2600;
    float _2672 = _2592;
    float _2674 = _2590;
    float _2676 = _2594;
    float _2678 = _2600;
    if (!_2664)
    {
        bool _2680 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2682 = _2614;
        if (_2680)
        {
            float _2684 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2682 = _2684;
        }
        float _2686 = _2682;
        float _2688 = _2686;
        if (_2680)
        {
            float _2690 = _481 * _2686;
            _2666 = _2690;
        }
        float _2692 = _2666;
        float _2694 = _2692;
        if (_2680)
        {
            float _2696 = _483 * _2686;
            _2668 = _2696;
        }
        float _2698 = _2668;
        float _2700 = _2698;
        if (_2680)
        {
            float _2702 = _485 * _2686;
            _2670 = _2702;
        }
        float _2704 = _2670;
        float _2706 = _2704;
        if (!_2680)
        {
            bool _2708 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2710 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2712 = _2708 || _2710;
            bool _2714 = isnan(1.0);
            bool _2716 = _2712 || _2714;
            float _2718 = _145 + 1.0;
            float _2720 = _2718;
            if (!_2716)
            {
                float _2722 = _2718 * _2718;
                float _2724 = _2722 * 0.5;
                _2688 = _2724;
            }
            float _2726 = _2688;
            float _2728 = _2726;
            if (!_2716)
            {
                float _2730 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2728 = _2730;
            }
            float _2732 = _2728;
            bool _2734 = !_2716;
            float _2736 = _2732;
            if (!_2734)
            {
                float _2738 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2740 = log2(_2738);
                float _2742 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2744 = _2740 * _2718;
                float _2746 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2748 = 1.0 + _2746;
                float _2750 = 1.0 / _2748;
                float _2752 = _2742 * 0.693147182464599609375;
                float _2754 = exp2(_2744);
                float _2756 = 1.0 / _2752;
                float _2758 = _2754 + (-1.0);
                float _2760 = -_2758;
                float _2762 = fma(_2760, _2756, _2718);
                float _2764 = _2762 * _2750;
                float _2766 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2736 = _2766;
            }
            float _2768 = _2736;
            float _2770 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2772 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2774 = !_2716;
            if (!_2774)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = 1.0 / _2782;
                float _2786 = _2778 * _2718;
                float _2788 = exp2(_2786);
                float _2790 = -_2788;
                float _2792 = _2790 + 1.0;
                float _2794 = _2792 * _2784;
                _2720 = _2794;
            }
            float _2796 = _2720;
            float _2798 = fma(_2796, _183, _2772);
            float _2800 = fma(_2796, _181, _2770);
            float _2802 = _2768 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2804 = -_441;
            float _2806 = _2804 + _2798;
            float _2808 = -_447;
            float _2810 = _2808 + _2800;
            float _2812 = fma(_2796, _185, _2802);
            float _2814 = _2806 * _195;
            float _2816 = _2806 * _211;
            float _2818 = _2806 * _225;
            float _2820 = -_453;
            float _2822 = _2820 + _2812;
            float _2824 = fma(_2810, _193, _2814);
            float _2826 = fma(_2810, _209, _2816);
            float _2828 = fma(_2810, _223, _2818);
            float _2830 = fma(_2822, _197, _2824);
            float _2832 = fma(_2822, _213, _2826);
            float _2834 = fma(_2822, _227, _2828);
            _489 = _2832;
            _491 = _2830;
            _493 = _2834;
            _2694 = _2830;
            _2700 = _2832;
            _2706 = _2834;
        }
        float _2836 = _489;
        float _2838 = _491;
        float _2840 = _493;
        float _2842 = _2694;
        float _2844 = _2700;
        float _2846 = _2706;
        float _2848 = _2836 * _2836;
        float _2850 = fma(_2838, _2838, _2848);
        float _2852 = fma(_2840, _2840, _2850);
        float _2854 = rsqrt(_2626);
        float _2856 = sqrt(_2852);
        float _2858 = _2604 * _2854;
        float _2860 = _2598 * _2854;
        float _2862 = _2612 * _2854;
        bool _2864 = _2856 > 0.0;
        bool _2866 = !_2864;
        _2678 = _2846;
        if (!_2866)
        {
            float _2868 = rsqrt(_2852);
            float _2870 = _2868 * _2836;
            float _2872 = _2868 * _2838;
            float _2874 = _2868 * _2840;
            float _2876 = _2860 * _2870;
            float _2878 = fma(_2858, _2872, _2876);
            float _2880 = fma(_2862, _2874, _2878);
            float _2882 = _2880 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2884 = fma(_2842, _2882, _2592);
            float _2886 = fma(_2844, _2882, _2590);
            float _2888 = fma(_2846, _2882, _2594);
            _2672 = _2884;
            _2674 = _2886;
            _2676 = _2888;
        }
    }
    float _2890 = _2672;
    float _2892 = _2674;
    float _2894 = _2676;
    float _2896 = _2678;
    bool _2898 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2900 = isnan(0.5);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2906 = _2902 || _2904;
    float _2908 = -_2208;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2890);
    float _2912 = -_2206;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2892);
    float _2916 = -_2224;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2894);
    float _2920 = _2914;
    float _2922 = _2910;
    float _2924 = _2918;
    float _2926 = _2896;
    if (!_2906)
    {
        float _2928 = _2234 * _2234;
        float _2930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2932 = -_1494;
        float _2934 = _2932 + _2894;
        float _2936 = -_1466;
        float _2938 = _2936 + _2890;
        float _2940 = fma(_2246, _2246, _2928);
        float _2942 = -_1522;
        float _2944 = _2942 + _2892;
        float _2946 = fma(_2256, _2256, _2940);
        float _2948 = 1.0 / _2346;
        float _2950 = sqrt(_2946);
        float _2952 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2954 = precise::min(_2950, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2930;
        float _2958 = _2956 * _2948;
        float _2960 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2962 = _2934 * _2958;
        float _2964 = _2960 * _2958;
        float _2966 = fma(_2960, _2962, _2242);
        float _2968 = fma(_2938, _2964, _2228);
        float _2970 = fma(_2944, _2964, _2222);
        _2920 = _2970;
        _2922 = _2968;
        _2924 = _2966;
    }
    float _2972 = _2920;
    float _2974 = _2922;
    float _2976 = _2924;
    float _2978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2980 = _2972 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2984 = _2974 + _2982;
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2976 + _2986;
    float _2990 = _2980 * _2980;
    float _2992 = fma(_2984, _2984, _2990);
    float _2994 = fma(_2988, _2988, _2992);
    float _2996 = rsqrt(_2994);
    float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3000 = _2984 * _2998;
    float _3002 = _2988 * _2998;
    float _3004 = _3000 * _3000;
    float _3006 = _3002 * _3002;
    float _3008 = _3004 + _3006;
    float _3010 = sqrt(_3008);
    bool _3012 = _3010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3016 = _3010 + _3014;
    float _3018 = _2996;
    float _3020 = _3016;
    float _3022 = _2980;
    float _3024 = _2998;
    if (_3012)
    {
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3026;
    }
    float _3028 = _3018;
    float _3030 = _3028;
    if (_3012)
    {
        float _3032 = _3016 * _3028;
        _3020 = _3032;
    }
    float _3034 = _3020;
    if (_3012)
    {
        float _3036 = rsqrt(_3008);
        _3030 = _3036;
    }
    float _3038 = _3030;
    float _3040 = _3038;
    if (_3012)
    {
        float _3042 = _3034 * 0.15915493667125701904296875;
        _217 = _3042;
    }
    float _3044 = _217;
    float _3046 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3048 = _2988;
    float _3050 = _3044;
    if (_3012)
    {
        float _3052 = _3044 * 6.283185482025146484375;
        float _3054 = sin(_3052);
        _3048 = _3054;
    }
    float _3056 = _3048;
    float _3058 = precise::max(0.0, _3046);
    float _3060 = _1522;
    if (_3012)
    {
        float _3062 = _3044 * 6.283185482025146484375;
        float _3064 = cos(_3062);
        _3060 = _3064;
    }
    float _3066 = _3060;
    float _3068 = -_2998;
    float _3070 = -_3058;
    float _3072 = fma(_2980, _3068, _3070);
    if (_3012)
    {
        float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3022 = _3074;
    }
    float _3076 = _3022;
    float _3078 = sqrt(_2994);
    float _3080 = _3056;
    float _3082 = _3076;
    if (_3012)
    {
        float _3084 = fma(_3056, _3076, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3080 = _3084;
    }
    float _3086 = _3080;
    float _3088 = _3086;
    if (!_3012)
    {
        _3050 = _3004;
    }
    float _3090 = _3050;
    float _3092 = _3090;
    if (_3012)
    {
        float _3094 = _3038 * _3086;
        _2926 = _3094;
    }
    float _3096 = _2926;
    if (!_3012)
    {
        _3040 = _3000;
    }
    float _3098 = _3040;
    float _3100 = _3098;
    float _3102 = _3066;
    if (_3012)
    {
        float _3104 = _3066 + (-1.0);
        _3082 = _3104;
    }
    float _3106 = _3082;
    float _3108 = _3106;
    if (_3012)
    {
        float _3110 = _3000 * _3096;
        _3100 = _3110;
    }
    float _3112 = _3100;
    if (!_3012)
    {
        _3088 = _3072;
    }
    float _3114 = _3088;
    float _3116 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3118 = _3114;
    if (_3012)
    {
        float _3120 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3024 = _3120;
    }
    float _3122 = _3024;
    if (!_3012)
    {
        _3108 = _3002;
    }
    float _3124 = _3108;
    float _3126 = _3124;
    if (_3012)
    {
        float _3128 = _3002 * _3096;
        _3126 = _3128;
    }
    float _3130 = _3126;
    if (_3012)
    {
        float _3132 = _3112 * _3112;
        _3092 = _3132;
    }
    float _3134 = _3092;
    if (_3012)
    {
        float _3136 = fma(_3072, _3066, _3122);
        _3118 = _3136;
    }
    float _3138 = _3118;
    if (!_3012)
    {
        _3102 = _3006;
    }
    float _3140 = _3102;
    float _3142 = _3140;
    if (_3012)
    {
        float _3144 = _3130 * _3130;
        _3142 = _3144;
    }
    float _3146 = _3142;
    float _3148 = fma(_3138, _3138, _3134);
    float _3150 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3152 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3154 = _3148 + _3146;
    float _3156 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3116);
    float _3158 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3162 = fma(_3078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3160);
    float _3164 = precise::clamp(_3162, 0.0, 1.0);
    float _3166 = rsqrt(_3154);
    float _3168 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3156);
    float _3170 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3172 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3158);
    float _3174 = -_3164;
    float _3176 = _3174 + 1.0;
    float _3178 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3180 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3170);
    float _3182 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3172);
    float _3184 = abs(_3176);
    float _3186 = log2(_3184);
    float _3188 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3190 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3180);
    float _3192 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3194 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3152);
    float _3196 = -_3188;
    float _3198 = fma(_3196, _3150, 1.0);
    float _3200 = _3190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3202 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3204 = _3166 * _3112;
    float _3206 = _3166 * _3138;
    float _3208 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3194);
    float _3210 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3202);
    float _3212 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3214 = _3166 * _3130;
    float _3216 = _3208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3218 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3210);
    float _3220 = -_3212;
    float _3222 = fma(_3206, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3220);
    float _3224 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3226 = log2(_3198);
    float _3228 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3218);
    float _3230 = -_3214;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3222);
    float _3234 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3236 = fma(_3232, -0.5, 0.5);
    float _3238 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3234);
    float _3240 = exp2(_3224);
    float _3242 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3244 = fma(_3232, 0.5, 0.5);
    float _3246 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3238);
    float _3248 = _3206 + 1.0;
    float _3250 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3242);
    float _3252 = fma(_3244, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3254 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3246);
    float _3256 = 1.0 / _3228;
    float _3258 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3250);
    float _3260 = fma(_3244, _3252, -0.212114393711090087890625);
    float _3262 = _3226 * 0.693147182464599609375;
    float _3264 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3258);
    float _3266 = fma(_3244, _3260, 1.570728778839111328125);
    float _3268 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3270 = sqrt(_3236);
    float _3272 = -_3206;
    float _3274 = fma(_3240, _3248, _3272);
    float _3276 = fma(_3274, 0.5, 0.5);
    float _3278 = _3254 * _3256;
    float _3280 = _3264 * _3256;
    float _3282 = fma(_3278, 0.5, 0.5);
    float _3284 = fma(_3280, -0.5, 0.5);
    float _3286 = _3270 * 0.636619746685028076171875;
    float3 _8509 = float3(_3282, _3284, _3268);
    float _3288 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8509, float3(0.0), isnan(_8509)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8509, float3(0.0), isnan(_8509)), level(0.0)).x;
    float3 _8520 = float3(_3282, _3284, _3268);
    float4 _3291 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8520, float3(0.0), isnan(_8520)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8520, float3(0.0), isnan(_8520)), level(0.0)).xyzw;
    float _3293 = _3291.x;
    float _3295 = _3291.y;
    float _3297 = _3291.z;
    float _3299 = _3291.w;
    float _3301 = -_3266;
    float _3303 = fma(_3286, _3301, 1.0);
    float2 _8542 = float2(_3303, _3276);
    float3 _3307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8542, float2(0.0), isnan(_8542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8542, float2(0.0), isnan(_8542)), level(0.0)).xyz;
    float _3309 = _3307.x;
    float _3311 = _3307.y;
    float _3313 = _3307.z;
    float _3315 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3317 = _3192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3319 = _3228 * 0.5;
    out.m_78.x = _2228;
    out.m_78.y = _2222;
    bool _3321 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3323 = isnan(_3078);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3329 = _3325 || _3327;
    float _3331 = fma(_3200, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3317);
    float _3333 = exp2(_3315);
    out.m_80.x = _2974;
    out.m_80.y = _2972;
    out.m_80.z = _2976;
    float _3335 = _3254 + _3228;
    float _3337 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3331);
    float _3339 = fma(_3264, -0.5, _3319);
    float _3341 = _3335 * 0.5;
    float _3343 = fma(_3216, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3337);
    float _3345 = _3343 + _3228;
    out.gl_Position.x = _3254;
    out.gl_Position.y = _3264;
    out.gl_Position.z = _3343;
    out.gl_Position.w = _3228;
    float _3347 = _3345 * 0.5;
    float _3349 = -_3333;
    float _3351 = _3349 + 1.0;
    float _3353 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _3341;
    out.m_82.y = _3339;
    out.m_82.z = _3347;
    out.m_82.w = _3228;
    float _3355 = -_3353;
    float _3357 = _3355 + 1.0;
    float _3359 = _3228;
    float _3361 = _3343;
    float _3363 = _3264;
    float _3365 = _3254;
    float _3367 = _3339;
    float _3369 = _3341;
    if (!_3329)
    {
        _3359 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3371 = _3359;
    float _3373 = _3371;
    float _3375 = _3371;
    if (!_3329)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3377 = _3361;
    float _3379 = _3377;
    float _3381 = _3377;
    if (!_3329)
    {
        _3363 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3383 = _3363;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3329)
    {
        _3365 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3389 = _3365;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3329)
    {
        _3367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3395 = _3367;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3329)
    {
        _3369 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3401 = _3369;
    float _3403 = _3353 * _3288;
    float _3405 = _3299 * _3403;
    float _3407 = _3299 * _3357;
    float _3409 = _3313 * _3403;
    float _3411 = fma(_3309, _3405, _3293);
    float _3413 = fma(_3311, _3405, _3295);
    float _3415 = fma(_3299, _3409, _3297);
    out.m_84.x = _3411;
    out.m_84.y = _3413;
    out.m_84.z = _3415;
    out.m_84.w = _3407;
    bool _3417 = !_3329;
    float _3419 = _3401;
    float _3421 = _3401;
    if (!_3417)
    {
        bool _3423 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3425 = isnan(_3078);
        bool _3427 = _3423 || _3425;
        bool _3429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3431 = _3427 || _3429;
        if (!_3431)
        {
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3435 = _3078 + _3433;
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3439 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3437;
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3443 = _3441 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3445 = 1.0 / _3439;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3463 = _3435 * _3445;
            float _3465 = precise::clamp(_3463, 0.0, 1.0);
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3471 = fma(_3465, _3443, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3473 = fma(_3465, _3469, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3475 = fma(_3465, _3449, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3477 = fma(_3465, _3453, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3479 = fma(_3465, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3481 = fma(_3465, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3421 = _3475;
            _3387 = _3479;
            _3399 = _3471;
            _3381 = _3477;
            _3375 = _3473;
            _3393 = _3481;
            _3483 = true;
        }
        else
        {
            bool _3485 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3487 = isnan(_3078);
            bool _3489 = _3485 || _3487;
            bool _3491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3493 = _3489 || _3491;
            if (!_3493)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3495 = _3397;
            _3399 = _3495;
            if (!_3493)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3497 = _3419;
            _3421 = _3497;
            if (!_3493)
            {
                _3373 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3499 = _3373;
            _3375 = _3499;
            if (!_3493)
            {
                _3379 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3501 = _3379;
            _3381 = _3501;
            if (!_3493)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3503 = _3385;
            _3387 = _3503;
            if (!_3493)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3505 = _3391;
            bool _3507 = !_3493;
            _3393 = _3505;
            if (!_3507)
            {
                bool _3509 = _3078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3511 = isnan(_3078);
                bool _3513 = _3509 || _3511;
                bool _3515 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3517 = _3513 || _3515;
                if (!_3517)
                {
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3521 = _3078 + _3519;
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3525 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3523;
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3531 = 1.0 / _3525;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3549 = _3521 * _3531;
                    float _3551 = precise::clamp(_3549, 0.0, 1.0);
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3557 = fma(_3551, _3529, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3559 = fma(_3551, _3555, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3561 = fma(_3551, _3535, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3563 = fma(_3551, _3539, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3565 = fma(_3551, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3567 = fma(_3551, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3421 = _3561;
                    _3387 = _3565;
                    _3399 = _3557;
                    _3381 = _3563;
                    _3375 = _3559;
                    _3393 = _3567;
                    _3483 = true;
                }
                else
                {
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3381 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3375 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3483 = false;
    float _3569 = _3421;
    float _3571 = _3387;
    float _3573 = _3399;
    float _3575 = _3381;
    float _3577 = _3375;
    float _3579 = _3393;
    float _3581 = fma(_2658, -0.5, 0.5);
    float _3583 = precise::clamp(_3581, 0.0, 1.0);
    float _3585 = -_3569;
    float _3587 = _3585 + _3571;
    float _3589 = -_3573;
    float _3591 = _3589 + _3575;
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    bool _3597 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3599 = fma(_3583, _3587, _3569);
    float _3601 = fma(_3583, _3591, _3573);
    float _3603 = fma(_3583, _3595, _3577);
    float _3605 = _3599 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3607 = fma(_3601, 0.298911988735198974609375, _3605);
    float _3609 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3611 = fma(_3603, 0.114477999508380889892578125, _3607);
    out.m_86.w = _3609;
    float _3613 = -_3611;
    float _3615 = _3601 + _3613;
    float _3617 = -_3611;
    float _3619 = _3599 + _3617;
    float _3621 = -_3611;
    float _3623 = _3603 + _3621;
    out.m_88.x = 0.0;
    float _3625 = fma(_3615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    float _3627 = fma(_3619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    float _3629 = fma(_3623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3611);
    out.m_90.x = _3625;
    out.m_90.y = _3627;
    out.m_90.z = _3629;
    if (!_3597)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3631 = -_2972;
    float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3635 = -_2974;
    float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3639 = -_2976;
    float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3643 = _3633 * _3633;
    float _3645 = fma(_3637, _3637, _3643);
    float _3647 = fma(_3641, _3641, _3645);
    float _3649 = sqrt(_3647);
    float _3651 = rsqrt(_3647);
    float _3653 = -_3649;
    float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3657 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = _3637 * _3651;
    float _3663 = _3633 * _3651;
    float _3665 = abs(_3659);
    float _3667 = log2(_3665);
    float _3669 = _3641 * _3651;
    float _3671 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3673 = _2658 * _3663;
    float _3675 = -_3663;
    float _3677 = -_3671;
    float _3679 = fma(_3675, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3677);
    float _3681 = fma(_2656, _3661, _3673);
    float _3683 = -_3669;
    float _3685 = fma(_3683, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3679);
    float _3687 = fma(_2660, _3669, _3681);
    float _3689 = precise::clamp(_3687, 0.0, 1.0);
    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3693 = _3685 + _3691;
    float _3695 = _3667 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3697 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3699 = precise::clamp(_3697, 0.0, 1.0);
    float _3701 = exp2(_3695);
    float _3703 = _3701 * _3699;
    float _3705 = _3689 * _3703;
    float _3707 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3709 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3711 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3707;
    out.m_88.y = _3709;
    out.m_88.z = _3711;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

