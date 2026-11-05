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
    float4 m_68 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3211 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_123);
        out.gl_Position.z = _3496;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
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
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3570 = as_type<float>(_163);
        out.gl_Position.z = _3570;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_64.w;
    float _189 = in.m_49.x;
    float _191 = in.m_49.y;
    float _193 = in.m_49.z;
    float _195 = _165 * _165;
    float _197 = _167 * _167;
    float _199 = _169 * _169;
    float _201 = in.m_44.x;
    float _203 = in.m_44.y;
    float _205 = in.m_44.z;
    float _207 = fma(_173, _173, _195);
    float _209 = fma(_175, _175, _197);
    float _211 = fma(_177, _177, _199);
    float _213 = fma(_179, _179, _207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_183, _183, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _219 > 0.0;
    float _225 = sqrt(_217);
    bool _227 = _221 > 0.0;
    int _229 = as_type<int>(_185) & 1;
    bool _231 = _229 != 0;
    int _233 = as_type<int>(_185) & 2;
    bool _235 = _233 != 0;
    float _237 = _213;
    if (_223)
    {
        float _239 = rsqrt(_213);
        _237 = _239;
    }
    float _241 = _237;
    bool _243 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _247 = _243 || _245;
    bool _249 = isnan(1.0);
    bool _251 = _247 || _249;
    float _253 = 0.0;
    float _255 = 0.0;
    if (!_223)
    {
        _253 = 0.0;
        _255 = 0.0;
    }
    float _257 = _253;
    float _259 = _255;
    bool _261 = _225 > 0.0;
    float _263 = _225;
    float _265 = _257;
    float _267 = _259;
    if (!_223)
    {
        _263 = 0.0;
    }
    float _269 = _263;
    float _271 = _185;
    float _273 = _269;
    if (_227)
    {
        float _275 = rsqrt(_215);
        _271 = _275;
    }
    float _277 = _271;
    float _279 = 0.0;
    if (!_227)
    {
        _279 = 0.0;
    }
    float _281 = _279;
    float _283 = 0.0;
    float _285 = _281;
    if (!_227)
    {
        _283 = 0.0;
    }
    float _287 = _283;
    float _289 = 0.0;
    float _291 = _287;
    if (!_227)
    {
        _289 = 0.0;
    }
    float _293 = _289;
    float _295 = _241;
    float _297 = _293;
    if (_223)
    {
        float _299 = _241 * _173;
        _265 = _299;
    }
    float _301 = _265;
    if (_223)
    {
        float _303 = _241 * _165;
        _273 = _303;
    }
    float _305 = _273;
    float _307 = _305;
    if (_223)
    {
        float _309 = _241 * _179;
        _267 = _309;
    }
    float _311 = _267;
    if (!_251)
    {
        float _313 = _171 * _171;
        float _315 = _313 * 0.5;
        _295 = _315;
    }
    float _317 = _295;
    float _319 = 0.0;
    float _321 = _317;
    if (_261)
    {
        float _323 = rsqrt(_217);
        _319 = _323;
    }
    float _325 = _319;
    bool _327 = !_231;
    float _329 = _327 ? (-0.5) : 0.5;
    float _331 = _277;
    if (_227)
    {
        float _333 = _277 * _175;
        _285 = _333;
    }
    float _335 = _285;
    if (_227)
    {
        float _337 = _277 * _167;
        _291 = _337;
    }
    float _339 = _291;
    if (_227)
    {
        float _341 = _277 * _181;
        _297 = _341;
    }
    float _343 = _297;
    if (!_261)
    {
        _331 = 0.0;
    }
    float _345 = _331;
    float _347 = _345;
    if (!_251)
    {
        float _349 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _349;
    }
    float _351 = _321;
    bool _353 = !_235;
    float _355 = _353 ? (-0.5) : 0.5;
    bool _357 = !_251;
    float _359 = _351;
    float _361 = 0.0;
    if (!_357)
    {
        float _363 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _365 = log2(_363);
        float _367 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _369 = _367 + 1.0;
        float _371 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = _171 * _365;
        float _375 = 1.0 / _369;
        float _377 = _371 * 0.693147182464599609375;
        float _379 = exp2(_373);
        float _381 = 1.0 / _377;
        float _383 = _379 + (-1.0);
        float _385 = -_383;
        float _387 = fma(_385, _381, _171);
        float _389 = _387 * _375;
        float _391 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _359 = _391;
        _361 = _377;
    }
    float _393 = _359;
    float _395 = _361;
    float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = _395;
    float _401 = _393;
    if (_261)
    {
        float _403 = _325 * _169;
        _347 = _403;
    }
    float _405 = _347;
    float _407 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_261)
    {
        _399 = 0.0;
    }
    float _409 = _399;
    float _411 = _397 * _305;
    float _413 = _397 * _339;
    float _415 = _397 * _405;
    float _417 = _409;
    if (_261)
    {
        float _419 = _325 * _177;
        _417 = _419;
    }
    float _421 = _417;
    float _423 = fma(_407, _301, _411);
    float _425 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_261)
    {
        _307 = 0.0;
    }
    float _427 = _307;
    float _429 = _427;
    if (_261)
    {
        float _431 = _325 * _183;
        _429 = _431;
    }
    float _433 = _429;
    float _435 = fma(_407, _335, _413);
    float _437 = fma(_407, _421, _415);
    float _439 = fma(_425, _311, _423);
    if (!_251)
    {
        _401 = _171;
    }
    float _441 = _401;
    bool _443 = !_251;
    float _445 = _441;
    if (!_443)
    {
        float _447 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _449 = log2(_447);
        float _451 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _453 = _451 + 1.0;
        float _455 = 1.0 / _453;
        float _457 = _171 * _449;
        float _459 = exp2(_457);
        float _461 = -_459;
        float _463 = _461 + 1.0;
        float _465 = _463 * _455;
        _445 = _465;
    }
    float _467 = _445;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _471 = fma(_425, _343, _435);
    float _473 = fma(_425, _433, _437);
    float _475 = fma(_467, _189, _439);
    float _477 = fma(_467, _191, _471);
    float _479 = fma(_467, _193, _473);
    float _481 = fma(_475, _187, _201);
    float _483 = fma(_477, _187, _203);
    float _485 = fma(_479, _187, _205);
    bool _487 = !_469;
    float _503;
    if (!_487)
    {
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _491 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_107);
        float _509 = 1.0 / _507;
        float _511 = _143 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _517 = int(_515);
    float _519 = _483 * _181;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _513 + _521;
    float _525 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _527 = int(_525);
    float _529 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _531 = int(_529);
    float _533 = float(_517);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = 1.0 / _533;
    float _545 = float(_527);
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _549 = int(_547);
    float _551 = float(uint(_531));
    bool _553 = _531 == 0;
    int _555 = ~_531;
    int _557 = _555 + 1;
    float _559 = 1.0 / _545;
    float _561 = _543 * _143;
    float _563 = 1.0 / _551;
    float _565 = float(uint(_549));
    int _567 = ~_549;
    int _569 = _567 + 1;
    float _571 = trunc(_561);
    int _573 = int(_571);
    float _575 = _559 * _143;
    float _577 = in.m_51.y;
    float _579 = 1.0 / _565;
    int _581 = as_type<int>(_563) + (-2);
    float _583 = trunc(_575);
    int _585 = int(_583);
    float _587 = float(uint(_573));
    float _589 = as_type<float>(_581) * _587;
    int _591 = as_type<int>(_579) + (-2);
    float _593 = 1.0 / _541;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _597 = _595 != 0;
    float _599 = float(uint(_585));
    float _601 = trunc(_589);
    float _603 = precise::max(_601, 0.0);
    uint _606 = uint(_603);
    float _608 = as_type<float>(_591) * _599;
    int _610 = ~_531;
    int _612 = _610 + 1;
    float _614 = trunc(_608);
    float _616 = precise::max(_614, 0.0);
    uint _618 = uint(_616);
    int _620 = _612 * int(_606);
    int _622 = _620 + _573;
    float _624 = float(uint(_622));
    float _626 = as_type<float>(_622);
    float _628 = _624;
    if (_597)
    {
        _626 = 1.0;
    }
    float _630 = _626;
    int _632 = _569 * int(_618);
    int _634 = _632 + _585;
    float _636 = _630;
    if (!_597)
    {
        _636 = 7.345489978790283203125;
    }
    float _638 = _636;
    float _640 = as_type<float>(_581) * _624;
    if (_597)
    {
        _628 = 1.0;
    }
    float _642 = _628;
    float _644 = float(uint(_634));
    float _646 = trunc(_640);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    float _652 = _638 * _129;
    float _654 = _642;
    float _656 = _644;
    if (!_597)
    {
        _654 = 1.2345600128173828125;
    }
    float _658 = _654;
    float _660 = as_type<float>(_591) * _644;
    if (_597)
    {
        _656 = _129;
    }
    float _662 = _656;
    float _664 = _662;
    if (!_597)
    {
        _664 = _577;
    }
    float _666 = _664;
    float _668 = trunc(_660);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    float _674 = _658 * _666;
    int _676 = ~_531;
    int _678 = _676 + 1;
    int _680 = ~_549;
    int _682 = _680 + 1;
    float _684 = floor(_652);
    int _686 = int(_606) + int(_650);
    float _688 = float(_107);
    float _690 = float(_531);
    int _692 = _678 * _686;
    int _694 = _692 + _573;
    float _696 = floor(_674);
    int _698 = int(_618) + int(_672);
    float _700 = float(_573);
    bool _702 = uint(_694) >= uint(_531);
    float _704 = 1.0 / _688;
    float _706 = -_684;
    float _708 = _652 + _706;
    bool _710 = _700 >= _690;
    bool _712 = isnan(_700);
    bool _714 = _710 || _712;
    bool _716 = isnan(_690);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    int _722 = _682 * _698;
    int _724 = _722 + _585;
    bool _726 = !_702;
    int _728 = _726 ? 0 : (-1);
    float _730 = _708 * _690;
    float _732 = float(_549);
    float _734 = float(_585);
    float _736 = -_696;
    float _738 = _674 + _736;
    int _740 = ~_686;
    int _742 = _740 + _728;
    int _744 = _742 + 1;
    float _746 = trunc(_730);
    int _748 = int(_746);
    bool _750 = _734 >= _732;
    bool _752 = isnan(_734);
    bool _754 = _750 || _752;
    bool _756 = isnan(_732);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    bool _762 = uint(_724) >= uint(_549);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _766 = _764 != 0;
    float _768 = _704 * _143;
    float _770 = trunc(_720);
    int _772 = int(_770);
    bool _774 = !_766;
    int _776 = _774 ? 0 : 1;
    float _778 = _690 * _768;
    int _780 = _531 * _744;
    int _782 = _780 + _573;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _794 = _792 != 0;
    int _796 = abs(_776);
    float _798 = trunc(_760);
    int _800 = int(_798);
    float _802 = _732 * _768;
    bool _804 = !_762;
    int _806 = _804 ? 0 : (-1);
    int _808 = _748 * _796;
    int _810 = _808 + _573;
    bool _812 = !_553;
    int _814 = _812 ? _782 : (-1);
    float _816 = _738 * _732;
    int _818 = ~_698;
    int _820 = _818 + _806;
    int _822 = _820 + 1;
    int _824 = ~_772;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = trunc(_778);
    int _832 = int(_830);
    bool _834 = !_790;
    int _836 = _834 ? 0 : 1;
    int _838 = _549 * _822;
    int _840 = _838 + _585;
    bool _842 = _549 == 0;
    int _844 = _814 * _828;
    int _846 = abs(_836);
    int _848 = ~_800;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = trunc(_816);
    int _856 = int(_854);
    bool _858 = !_842;
    int _860 = _858 ? _840 : (-1);
    int _862 = _531 + (-1);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _866 = _864 != 0;
    int _868 = _860 * _852;
    int _870 = _772 * _862;
    int _872 = _870 + _844;
    bool _874 = !_786;
    int _876 = _874 ? 0 : 1;
    float _878 = trunc(_802);
    int _880 = int(_878);
    bool _882 = !_866;
    int _884 = _882 ? 0 : 1;
    int _886 = _872 * _846;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _890 = _888 != 0;
    int _892 = _549 + (-1);
    int _894 = abs(_876);
    int _896 = abs(_884);
    int _898 = _800 * _892;
    int _900 = _898 + _868;
    bool _902 = !_794;
    int _904 = _902 ? 0 : 1;
    int _906 = _832 * _894;
    int _908 = _906 + _886;
    bool _910 = !_890;
    int _912 = _910 ? 0 : 1;
    int _914 = _856 * _896;
    int _916 = _914 + _585;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    int _934 = abs(_904);
    int _936 = abs(_912);
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    bool _942 = !_920;
    int _944 = _942 ? 0 : 1;
    int _946 = abs(_940);
    int _948 = _810 * _934;
    int _950 = _948 + _908;
    bool _952 = !_928;
    int _954 = _952 ? 0 : 1;
    int _956 = abs(_944);
    int _958 = _748 * _936;
    int _960 = _958 + _950;
    bool _962 = !_932;
    int _964 = _962 ? 0 : 1;
    int _966 = abs(_954);
    int _968 = _900 * _946;
    int _970 = abs(_964);
    float _972 = float(uint(_960));
    int _974 = _880 * _956;
    int _976 = _974 + _968;
    float _978 = as_type<float>(_581) * _972;
    bool _980 = _531 == 0;
    int _982 = _916 * _966;
    int _984 = _982 + _976;
    int _986 = ~_531;
    int _988 = _986 + 1;
    int _990 = ~_549;
    int _992 = _990 + 1;
    int _994 = _856 * _970;
    int _996 = _994 + _984;
    float _998 = trunc(_978);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = ~_531;
    int _1006 = _1004 + 1;
    float _1008 = float(uint(_996));
    float _1010 = as_type<float>(_591) * _1008;
    float _1012 = trunc(_1010);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    int _1018 = _988 * int(_1002);
    int _1020 = _1018 + _960;
    int _1022 = ~_549;
    int _1024 = _1022 + 1;
    float _1026 = float(uint(_1020));
    float _1028 = as_type<float>(_581) * _1026;
    float _1030 = trunc(_1028);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    int _1036 = _1024 * int(_1016);
    int _1038 = _1036 + _996;
    float _1040 = float(uint(_1038));
    float _1042 = as_type<float>(_591) * _1040;
    float _1044 = trunc(_1042);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = int(_1002) + int(_1034);
    int _1052 = _1006 * _1050;
    int _1054 = _1052 + _960;
    int _1056 = ~_549;
    int _1058 = _1056 + 1;
    float _1060 = float(uint(_916));
    bool _1062 = uint(_1054) >= uint(_531);
    bool _1064 = !_1062;
    int _1066 = _1064 ? 0 : (-1);
    int _1068 = int(_1016) + int(_1048);
    float _1070 = as_type<float>(_591) * _1060;
    int _1072 = ~_1050;
    int _1074 = _1072 + _1066;
    int _1076 = _1074 + 1;
    int _1078 = _1058 * _1068;
    int _1080 = _1078 + _996;
    float _1082 = trunc(_1070);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = _531 * _1076;
    int _1090 = _1088 + _960;
    bool _1092 = uint(_1080) >= uint(_549);
    bool _1094 = !_980;
    int _1096 = _1094 ? _1090 : (-1);
    bool _1098 = !_1092;
    int _1100 = _1098 ? 0 : (-1);
    float _1102 = _577 * 2.0;
    int _1104 = _1096 & 3;
    bool _1106 = _1104 != 0;
    int _1108 = ~_1068;
    int _1110 = _1108 + _1100;
    int _1112 = _1110 + 1;
    bool _1114 = uint(_1104) > 1u;
    float _1116 = floor(_1102);
    int _1118 = _1096 & 3;
    bool _1120 = _1118 != 0;
    int _1122 = _549 * _1112;
    int _1124 = _1122 + _996;
    float _1126 = float(uint(_810));
    int _1128 = _1120 ? 0 : 1;
    bool _1130 = !_842;
    int _1132 = _1130 ? _1124 : (-1);
    bool _1134 = uint(_1104) >= 2u;
    int _1136 = _1132 & 3;
    bool _1138 = _1136 != 0;
    int _1140 = ~_1128;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    int _1146 = _1144;
    if (!_1114)
    {
        int _1148 = ~_1128;
        int _1150 = _1148 + 1;
        _1146 = _1150;
    }
    int _1152 = _1146;
    float _1154 = as_type<float>(_581) * _1126;
    int _1156 = _1134 ? 0 : 1;
    bool _1158 = uint(_1136) > 1u;
    float _1160 = trunc(_1154);
    float _1162 = precise::max(_1160, 0.0);
    uint _1164 = uint(_1162);
    int _1166 = _1132 & 3;
    bool _1168 = _1166 != 0;
    int _1170 = ~_1156;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    int _1176 = _1168 ? 0 : 1;
    bool _1178 = _1104 != 3;
    int _1180 = ~_1176;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = in.m_51.z;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1190 = _1188 != 0;
    int _1192 = _1184;
    int _1194 = _1174;
    if (!_1158)
    {
        int _1196 = ~_1176;
        int _1198 = _1196 + 1;
        _1192 = _1198;
    }
    int _1200 = _1192;
    int _1202 = ~_531;
    int _1204 = _1202 + 1;
    bool _1206 = uint(_1136) >= 2u;
    bool _1208 = _577 > 0.5;
    int _1210 = _1204 * int(_1164);
    int _1212 = _1210 + _810;
    if (_1178)
    {
        int _1214 = ~_1156;
        int _1216 = _1214 + 1;
        _1194 = _1216;
    }
    int _1218 = _1194;
    int _1220 = _1206 ? 0 : 1;
    float _1222 = float(uint(_1212));
    bool _1224 = _1136 != 3;
    int _1226 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1228 = _1226 != 0;
    float _1230 = _129 * 2.0;
    float _1232 = as_type<float>(_581) * _1222;
    int _1234 = _992 * int(_1086);
    int _1236 = _1234 + _916;
    int _1238 = ~_1220;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = -_355;
    int _1246 = _1208 ? as_type<int>(_1244) : as_type<int>(_355);
    float _1248 = floor(_1230);
    float _1250 = float(uint(_1236));
    bool _1252 = !_1106;
    int _1254 = _1252 ? 0 : 1;
    int _1256 = _1242;
    int _1258 = _1220;
    if (_1224)
    {
        int _1260 = ~_1220;
        int _1262 = _1260 + 1;
        _1256 = _1262;
    }
    int _1264 = _1256;
    float _1266 = as_type<float>(_591) * _1250;
    bool _1268 = _129 > 0.5;
    float _1270 = trunc(_1232);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    float _1276 = as_type<float>(_1274);
    if (_1190)
    {
        _1258 = 0;
    }
    int _1278 = _1258;
    float _1280 = -_329;
    int _1282 = _1268 ? as_type<int>(_1280) : as_type<int>(_329);
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    bool _1288 = !_1228;
    float _1290 = _1288 ? _329 : as_type<float>(_1282);
    float _1292 = trunc(_1266);
    float _1294 = precise::max(_1292, 0.0);
    uint _1296 = uint(_1294);
    bool _1298 = _1248 > 0.0;
    bool _1300 = _1248 >= 0.0;
    bool _1302 = isnan(_1248);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = _1290 + 0.5;
    bool _1312 = !_1286;
    float _1314 = _1312 ? _355 : as_type<float>(_1246);
    bool _1316 = _1186 > 0.5;
    int _1318 = _1278;
    if (!_1190)
    {
        _1318 = 1;
    }
    int _1320 = _1318;
    float _1322 = _1314 + (-0.5);
    int _1324 = _1308 ? 0 : 1;
    float _1326 = -_329;
    int _1328 = _1316 ? as_type<int>(_1326) : as_type<int>(_329);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1332 = _1330 != 0;
    bool _1334 = _1320 != 1;
    float _1336 = _1186 * 2.0;
    int _1338 = ~_549;
    int _1340 = _1338 + 1;
    int _1342 = ~_1324;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    int _1348 = _1346;
    if (!_1298)
    {
        int _1350 = ~_1324;
        int _1352 = _1350 + 1;
        _1348 = _1352;
    }
    int _1354 = _1348;
    bool _1356 = !_1332;
    float _1358 = _1356 ? _329 : as_type<float>(_1328);
    int _1360 = int(_1086) + int(_1296);
    bool _1362 = _1116 > 0.0;
    float _1364 = floor(_1336);
    bool _1366 = _1116 >= 0.0;
    bool _1368 = isnan(_1116);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    int _1376 = int(_1164) + int(_1274);
    int _1378 = _1374 ? 0 : 1;
    int _1380 = _1340 * _1360;
    int _1382 = _1380 + _916;
    float _1384 = 0.0;
    if (!_1334)
    {
        _1384 = _577;
    }
    float _1386 = _1384;
    int _1388 = _557 * _1376;
    int _1390 = _1388 + _810;
    float _1392 = 0.0;
    float _1394 = _1386;
    if (!_1334)
    {
        _1392 = _577;
    }
    float _1396 = _1392;
    float _1398 = 0.0;
    float _1400 = _1396;
    if (!_1334)
    {
        _1398 = _1186;
    }
    float _1402 = _1398;
    float _1404 = _1402;
    if (!_1334)
    {
        _1276 = _1186;
    }
    float _1406 = _1276;
    float _1408 = _1406;
    if (_1334)
    {
        _1394 = _129;
    }
    float _1410 = _1394;
    if (_1334)
    {
        _1400 = _129;
    }
    float _1412 = _1400;
    if (_1334)
    {
        _1404 = _577;
    }
    float _1414 = _1404;
    if (_1334)
    {
        _1408 = _577;
    }
    float _1416 = _1408;
    bool _1418 = uint(_1382) >= uint(_549);
    float _1420 = _483 * _167;
    bool _1422 = uint(_1390) >= uint(_531);
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    int _1426 = ~_1378;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = in.m_51.w;
    int _1434 = _1430;
    if (!_1362)
    {
        int _1436 = ~_1378;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    bool _1442 = !_1418;
    int _1444 = _1442 ? 0 : (-1);
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1456 = _1454 != 0;
    float _1458 = _483 * _175;
    bool _1460 = _1364 > 0.0;
    bool _1462 = !_1422;
    int _1464 = _1462 ? 0 : (-1);
    float _1466 = fma(_481, _173, _1458);
    bool _1468 = _1364 >= 0.0;
    bool _1470 = isnan(_1364);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.0);
    bool _1476 = _1472 || _1474;
    float _1478 = fma(_481, _165, _1420);
    float _1480 = fma(_481, _179, _519);
    int _1482 = _1476 ? 0 : 1;
    float _1484 = fma(_485, _183, _1480);
    bool _1486 = !_1448;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1490;
    int _1494 = ~_1482;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1502 = _1498;
    if (!_1460)
    {
        int _1504 = ~_1482;
        int _1506 = _1504 + 1;
        _1502 = _1506;
    }
    int _1508 = _1502;
    float _1510 = fma(_485, _177, _1466);
    float _1512 = fma(_485, _169, _1478);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1518 = 1.0 / _1492;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1522 = _1520 != 0;
    float _1524 = in.m_55.w;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1528 = _1526 != 0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1530;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1536 = _1534 != 0;
    float _1538 = in.m_57.w;
    float _1540 = 1.0 / _1516;
    float _1542 = in.m_59.w;
    bool _1544 = _1432 > 0.5;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1548 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1554 = _513 + _1552;
    float _1556 = 1.0 / _1532;
    float _1558 = -_1546;
    float _1560 = fma(_1500, 2.0, _1558);
    float _1562 = fma(_1548, -2.0, _1550);
    float _1564 = _129 + _577;
    float _1566 = _129 + _1186;
    float _1568 = _1554 * _1518;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1572 = _513 + _1570;
    float _1574 = _1564 + (-1.0);
    float _1576 = _523 * _1540;
    float _1578 = _1186 + _577;
    float _1580 = _1566 + (-1.0);
    float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1584 = _1578 + (-1.0);
    float _1586 = _1512 + _1524;
    bool _1588 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1590 = isnan(_513);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = _1572 * _1556;
    float _1602 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1604 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1606 = isnan(_513);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1484 + _1542;
    float _1618 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1620;
    bool _1624 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1626 = isnan(_513);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = -_1614;
    float _1638 = _1636 + 1.0;
    float _1640 = _1510 + _1538;
    float _1642 = fma(_1622, _1568, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1644;
    bool _1648 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1650 = isnan(_513);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -_1598;
    float _1662 = _1660 + 1.0;
    float _1664 = _1634 * _1638;
    float _1666 = -_1634;
    float _1668 = _1666 + 1.0;
    float _1670 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1562);
    float _1672 = fma(_1646, _1568, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1674 = _1614 * _1662;
    float _1676 = _1658 * _1668;
    float _1678 = -_143;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1560);
    float _1682 = -_1322;
    float _1684 = -_1670;
    float _1686 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1684);
    float _1688 = _1642 * _1676;
    float _1690 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1680);
    float _1692 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1694 = !_1456;
    int _1696 = _1694 ? 0 : 1;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1700 = !_1452;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = _1672 * _1676;
    int _1706 = abs(_1696);
    float _1708 = -_1698;
    float _1710 = fma(_1692, 2.0, _1708);
    int _1712 = abs(_1702);
    float _1714 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1716 = log2(_1714);
    int _1718 = abs(_1488);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1728 = -_1658;
    float _1730 = _1728 + 1.0;
    float _1732 = float(_1354);
    float _1734 = fma(_1722, _1576, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1736 = float(_1440);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1740 = float(_1712);
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1688);
    float _1744 = float(_1706);
    float _1746 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1738);
    int _1748 = _1096 >> 31;
    float _1750 = _1740 * _1732;
    int _1752 = _1132 >> 31;
    float _1754 = _1716 * _143;
    int _1756 = _1748 & 3;
    float _1758 = fma(_1726, _1576, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1760 = _1752 & 3;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1764 = _1586 + _1762;
    int _1766 = _1096 + _1756;
    float _1768 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1704);
    int _1770 = _1132 + _1760;
    float _1772 = exp2(_1754);
    int _1774 = _1766 >> 2;
    float _1776 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1778 = _1770 >> 2;
    float _1780 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1782 = _1774 << 4;
    int _1784 = _1782 + 368;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1640 + _1786;
    int _1790 = _1778 << 4;
    int _1792 = _1790 + 512;
    float _1794 = fma(_1776, -2.0, _537);
    uint _1796 = uint(int(uint(_1784) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = int(_1796) + 1;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    int _1808 = _1804 & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    float _1812 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1780);
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1816 = _1616 + _1814;
    float _1818 = -_355;
    int _1820 = _1544 ? as_type<int>(_1818) : as_type<int>(_355);
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1824 = -_1772;
    float _1826 = _1824 + 1.0;
    uint _1828 = uint(int(uint(_1792) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1846 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1854 = _1850 || _1852;
    float _1856 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1812);
    bool _1858 = !_1536;
    float _1860 = _1858 ? _355 : as_type<float>(_1820);
    float _1862 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1844);
    float _1864 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1822);
    float _1866 = _1854 ? _1826 : 0.0;
    int _1868 = _1784 + 8;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    float _1886 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1862);
    int _1888 = ~_1360;
    int _1890 = _1888 + _1444;
    int _1892 = _1890 + 1;
    float _1894 = _1744 * _1736;
    int _1896 = ~_1376;
    int _1898 = _1896 + _1464;
    int _1900 = _1898 + 1;
    float _1902 = -_143;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1710);
    int _1906 = abs(_1152);
    int _1908 = _549 * _1892;
    int _1910 = _1908 + _916;
    int _1912 = _1792 + 8;
    uint _1914 = uint(int(uint(_1912) >> uint(2)));
    uint _1916 = uint(int(uint(int(_1914)) >> uint(2)));
    int _1918 = int(_1914) & 3;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[int(_1916)][_1918];
    int _1922 = int(_1914) + 1;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    int _1926 = _1922 & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = abs(_1254);
    int _1932 = _531 * _1900;
    int _1934 = _1932 + _810;
    float _1936 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1864);
    bool _1938 = !_1138;
    int _1940 = _1938 ? 0 : 1;
    float _1942 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1746);
    bool _1944 = _1104 != 3;
    float _1946 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1424);
    int _1948 = abs(_1200);
    float _1950 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1794);
    int _1952 = ~_1906;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    float _1958 = -_1936;
    float _1960 = _1958 + 1.0;
    int _1962 = abs(_1940);
    int _1964 = ~_1948;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = abs(_1218);
    int _1972 = abs(_1264);
    bool _1974 = !_1944;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = _1136 != 3;
    int _1980 = _1956 * as_type<int>(_1810);
    int _1982 = ~_1930;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = ~_1962;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    float _1994 = float(_1718);
    int _1996 = _1986 * as_type<int>(_1802);
    int _1998 = _1996 + _1980;
    int _2000 = ~_1970;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = _1968 * as_type<int>(_1842);
    bool _2008 = !_1522;
    int _2010 = _2008 ? 0 : 1;
    float _2012 = float(_1508);
    int _2014 = _1992 * as_type<int>(_1834);
    int _2016 = _2014 + _2006;
    bool _2018 = !_1978;
    int _2020 = _2018 ? 0 : (-1);
    int _2022 = _2004 * as_type<int>(_1876);
    int _2024 = _2022 + _1998;
    int _2026 = ~_1972;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = _1994 * _2012;
    int _2034 = abs(_2010);
    float _2036 = in.m_66.x;
    float _2038 = in.m_66.y;
    float _2040 = in.m_66.z;
    int _2042 = abs(_2020);
    float _2044 = _2032 * (-2.0);
    int _2046 = abs(_1976);
    int _2048 = _2030 * as_type<int>(_1920);
    int _2050 = _2048 + _2016;
    float _2052 = _1764 * _1764;
    float _2054 = fma(_1582, _2044, _1582);
    bool _2056 = !_1528;
    int _2058 = _2056 ? 0 : 1;
    int _2060 = ~_2042;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    int _2066 = abs(_2058);
    float _2068 = fma(_1788, _1788, _2052);
    bool _2070 = _1856 >= 0.0;
    int _2072 = _2064 * as_type<int>(_1928);
    int _2074 = _2072 + _2050;
    float _2076 = fma(_1816, _1816, _2068);
    bool _2078 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2080 = isnan(1.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2086 = _2082 || _2084;
    float _2088 = _1358 + 0.5;
    int _2090 = ~_2046;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    bool _2096 = _531 == 0;
    float _2098 = fma(_2044, _2036, _2036);
    float _2100 = rsqrt(_2076);
    int _2102 = ~_2034;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2094 * as_type<int>(_1884);
    int _2110 = _2108 + _2024;
    int _2112 = ~_2066;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    float _2118 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1904);
    bool _2120 = _549 == 0;
    int _2122 = _2110 * _2106;
    float _2124 = _2068;
    if (_2070)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2124;
    int _2128 = as_type<int>(_2126);
    if (_2086)
    {
        float _2130 = _1866 * _593;
        _145 = _2130;
    }
    float _2132 = _145;
    bool _2134 = !_2096;
    int _2136 = _2134 ? _1934 : (-1);
    int _2138 = _2074 * _2116;
    bool _2140 = !_2120;
    int _2142 = _2140 ? _1910 : (-1);
    float _2144 = _1860 + (-0.5);
    if (_2070)
    {
        float _2146 = _2126 * 5.0;
        _2128 = as_type<int>(_2146);
    }
    int _2148 = _2128;
    int _2150 = _2136 * _2034;
    int _2152 = _2150 + _2122;
    float _2154 = _129 + (-0.5);
    int _2156 = _2142 * _2066;
    int _2158 = _2156 + _2138;
    float _2160 = -_2144;
    float _2162 = -_1950;
    float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2162);
    float _2166 = -_1886;
    float _2168 = _2166 + 1.0;
    float _2170 = -_1942;
    float _2172 = _2170 + 1.0;
    float _2174 = -_1946;
    float _2176 = _2174 + 1.0;
    if (_2070)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6402 = as_type<float>(_2148);
        out.gl_Position.z = _6402;
    }
    float _2178 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2098);
    float _2180 = -_1960;
    float _2182 = fma(_1290, _2180, _1690);
    float _2184 = fma(_1314, _2168, _1686);
    float _2186 = -_2172;
    float _2188 = fma(_1358, _2186, _2118);
    float _2190 = fma(_1860, _2176, _2164);
    float _2192 = fma(_2054, _2132, _2178);
    float _2194 = _1788 * _2100;
    if (_2070)
    {
        out.m_47.x = 0.0;
    }
    float _2196 = -_2194;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2200 = _1764 * _2100;
    float _2202 = float(_2152);
    out.m_68.x = _2182;
    out.m_68.y = _2184;
    out.m_68.z = _2188;
    out.m_68.w = _2190;
    float _2204 = float(_2158);
    float _2206 = -_2200;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    out.m_70.x = _2202;
    out.m_70.y = _2204;
    float _2210 = _2208 * _2208;
    if (_2070)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2212 = -_2200;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1586);
    float _2216 = _1816 * _2100;
    float _2218 = -_2194;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1640);
    float _2222 = _1750 * (-2.0);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2226 = _2214 + _2224;
    float _2228 = -_2216;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2234 = _2220 + _2232;
    float _2236 = _577 + (-0.5);
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2230 + _2240;
    float _2244 = fma(_2222, _2038, _2038);
    float _2246 = fma(_1602, _2222, _1602);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2238);
    float _2250 = fma(_2198, _2198, _2210);
    float _2252 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2244);
    float _2254 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2248);
    float _2256 = -_2216;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1816);
    float _2260 = _1894 * (-2.0);
    float _2262 = fma(_2246, _2132, _2252);
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2264;
    bool _2268 = _2254 >= 0.0;
    float _2270 = fma(_2258, _2258, _2250);
    float _2272 = in.m_64.x;
    float _2274 = in.m_64.y;
    float _2276 = _2192 * 0.15915493667125701904296875;
    float _2278 = fma(_2260, _2040, _2040);
    float _2280 = _1186 + (-0.5);
    float _2282 = fma(_1758, _1664, _1768);
    float _2284 = fma(_2266, _1600, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2286 = _2262 * 0.15915493667125701904296875;
    float _2288 = fma(_1618, _2260, _1618);
    float _2290 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2278);
    float _2292 = _2276 * 6.283185482025146484375;
    float _2294 = sin(_2292);
    float _2296 = fma(_2284, _1674, _2282);
    float _2298 = _2278;
    float _2300 = _2220;
    if (_2268)
    {
        _2298 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _2298;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2304;
    float _2308 = fma(_2288, _2132, _2290);
    float _2310 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2296);
    int _2312 = as_type<int>(_2302);
    if (_2268)
    {
        out.m_47.x = 0.0;
    }
    float _2314 = _2276 * 6.283185482025146484375;
    float _2316 = cos(_2314);
    if (_2268)
    {
        float _2318 = _2302 * 5.0;
        _2312 = as_type<int>(_2318);
    }
    int _2320 = _2312;
    float _2322 = fma(_2306, _1600, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2324 = fma(_1734, _1664, _1742);
    float _2326 = _2308 * 0.15915493667125701904296875;
    if (_2268)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6685 = as_type<float>(_2320);
        out.gl_Position.z = _6685;
    }
    float _2328 = _2310 * _2274;
    float _2330 = sqrt(_2270);
    float _2332 = _2286 * 6.283185482025146484375;
    float _2334 = sin(_2332);
    float _2336 = _2286 * 6.283185482025146484375;
    float _2338 = cos(_2336);
    if (_2268)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2340 = _2326 * 6.283185482025146484375;
    float _2342 = cos(_2340);
    float _2344 = fma(_2322, _1674, _2324);
    float _2346 = _2100 * _2330;
    float _2348 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _355);
    float _2352 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2344);
    float _2354 = _2294 * _2334;
    float _2356 = _2346 * _2348;
    float _2358 = _2326 * 6.283185482025146484375;
    float _2360 = sin(_2358);
    float _2362 = _2352 * _2272;
    float _2364 = _2316 * _2334;
    float _2366 = _2350 * _2356;
    float _2368 = _2316 * _2338;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _329);
    float _2374 = _2294 * _2338;
    float _2376 = _2316 * _2342;
    float _2378 = _2346 * _2370;
    float _2380 = _2338 * _2342;
    float _2382 = _2294 * _2342;
    float _2384 = _2376 * _2366;
    float _2386 = _2372 * _2378;
    float _2388 = _2334 * _2342;
    float _2390 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2392 = _2390 * 0.5;
    float _2394 = fma(_2360, _2368, _2354);
    float _2396 = -_2374;
    float _2398 = fma(_2360, _2364, _2396);
    float _2400 = -_2366;
    float _2402 = _2360 * _2400;
    float _2404 = -_2364;
    float _2406 = fma(_2360, _2374, _2404);
    float _2408 = fma(_2394, _2386, _2384);
    float _2410 = _2382 * _2366;
    float _2412 = fma(_2380, _2386, _2402);
    float _2414 = fma(_2360, _2354, _2368);
    float _2416 = fma(_2398, _2392, _2408);
    float _2418 = fma(_2406, _2386, _2410);
    float _2420 = fma(_2388, _2392, _2412);
    float _2422 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2424 = fma(_2414, _2392, _2418);
    float _2426 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2428 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2430 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2422);
    bool _2432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2440 = _2436 || _2438;
    float _2442 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2426);
    float _2444 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2428);
    float _2446 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2430);
    float _2448 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2442);
    float _2450 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2452 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2454 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2456 = _1616 + _2452;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2460 = _1640 + _2454;
    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2464 = _2456 + _2462;
    float _2466 = _1586 + _2458;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2470 = _2460 + _2468;
    float _2472 = _2464 * _2464;
    float _2474 = fma(_2470, _2470, _2472);
    float _2476 = sqrt(_2474);
    bool _2478 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2480 = _2420;
    float _2482 = _2424;
    float _2484 = _2460;
    if (!_2478)
    {
        _2480 = _2456;
    }
    float _2486 = _2480;
    float _2488 = _2486;
    if (!_2478)
    {
        _2482 = _2466;
    }
    float _2490 = _2482;
    bool _2492 = !_2478;
    float _2494 = _2490;
    if (!_2492)
    {
        float _2496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2500 = _2476 + _2498;
        float _2502 = rsqrt(_2474);
        float _2504 = _2500 * _2496;
        float _2506 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2508 = _2504 * 0.15915493667125701904296875;
        float _2510 = _2508 * 6.283185482025146484375;
        float _2512 = cos(_2510);
        float _2514 = _2508 * 6.283185482025146484375;
        float _2516 = sin(_2514);
        float _2518 = _2512 + (-1.0);
        float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2522 = fma(_2516, _2506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2524 = fma(_2466, _2512, _2520);
        float _2526 = _2502 * _2522;
        float _2528 = fma(_2470, _2526, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2530 = fma(_2464, _2526, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2484 = _2528;
        _2494 = _2524;
        _2488 = _2530;
    }
    float _2532 = _2484;
    float _2534 = _2494;
    float _2536 = _2488;
    float _2538 = -_2194;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2532);
    float _2542 = -_2200;
    float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2534);
    float _2546 = -_2216;
    float _2548 = fma(_2546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2536);
    float _2550 = _2544;
    float _2552 = _2540;
    float _2554 = _2548;
    if (!_2440)
    {
        float _2556 = _2226 * _2226;
        float _2558 = 1.0 / _2346;
        float _2560 = fma(_2234, _2234, _2556);
        float _2562 = fma(_2242, _2242, _2560);
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2566 = sqrt(_2562);
        float _2568 = precise::min(_2566, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2564;
        float _2572 = -_1640;
        float _2574 = _2572 + _2532;
        float _2576 = _2570 * _2558;
        float _2578 = -_1586;
        float _2580 = _2578 + _2534;
        float _2582 = -_1616;
        float _2584 = _2582 + _2536;
        float _2586 = fma(_2574, _2576, _2220);
        float _2588 = fma(_2580, _2576, _2214);
        float _2590 = fma(_2584, _2576, _2230);
        _2550 = _2588;
        _2552 = _2586;
        _2554 = _2590;
    }
    float _2592 = _2550;
    float _2594 = _2552;
    float _2596 = _2554;
    float _2598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2600 = _2592 + _2598;
    float _2602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2604 = _2594 + _2602;
    float _2606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2608 = _2596 + _2606;
    float _2610 = _2600 * _2600;
    float _2612 = fma(_2604, _2604, _2610);
    float _2614 = fma(_2608, _2608, _2612);
    float _2616 = rsqrt(_2614);
    float _2618 = sqrt(_2614);
    float _2620 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2622 = _2604 * _2620;
    float _2624 = _2608 * _2620;
    float _2626 = _2622 * _2622;
    float _2628 = _2624 * _2624;
    float _2630 = _2626 + _2628;
    float _2632 = sqrt(_2630);
    bool _2634 = _2632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2638 = _2632 + _2636;
    float _2640 = _2616;
    float _2642 = _2638;
    float _2644 = _2600;
    float _2646 = _2620;
    if (_2634)
    {
        float _2648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2640 = _2648;
    }
    float _2650 = _2640;
    float _2652 = _2650;
    if (_2634)
    {
        float _2654 = _2638 * _2650;
        _2642 = _2654;
    }
    float _2656 = _2642;
    if (_2634)
    {
        float _2658 = rsqrt(_2630);
        _2652 = _2658;
    }
    float _2660 = _2652;
    float _2662 = _2660;
    if (_2634)
    {
        float _2664 = _2656 * 0.15915493667125701904296875;
        _2300 = _2664;
    }
    float _2666 = _2300;
    float _2668 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2670 = _2608;
    float _2672 = _2666;
    if (_2634)
    {
        float _2674 = _2666 * 6.283185482025146484375;
        float _2676 = sin(_2674);
        _2670 = _2676;
    }
    float _2678 = _2670;
    float _2680 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2682 = precise::max(0.0, _2668);
    float _2684 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2680);
    float _2686 = _2214;
    float _2688 = _2682;
    if (_2634)
    {
        float _2690 = _2666 * 6.283185482025146484375;
        float _2692 = cos(_2690);
        _2686 = _2692;
    }
    float _2694 = _2686;
    float _2696 = -_2620;
    float _2698 = -_2682;
    float _2700 = fma(_2600, _2696, _2698);
    if (_2634)
    {
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2644 = _2702;
    }
    float _2704 = _2644;
    float _2706 = _2678;
    float _2708 = _2704;
    if (_2634)
    {
        float _2710 = fma(_2678, _2704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2706 = _2710;
    }
    float _2712 = _2706;
    float _2714 = _2712;
    if (!_2634)
    {
        _2708 = _2700;
    }
    float _2716 = _2708;
    float _2718 = _2716;
    if (_2634)
    {
        float _2720 = _2660 * _2712;
        _2646 = _2720;
    }
    float _2722 = _2646;
    if (!_2634)
    {
        _2662 = _2622;
    }
    float _2724 = _2662;
    float _2726 = _2724;
    float _2728 = _2694;
    if (_2634)
    {
        float _2730 = _2694 + (-1.0);
        _2688 = _2730;
    }
    float _2732 = _2688;
    float _2734 = _2732;
    if (_2634)
    {
        float _2736 = _2622 * _2722;
        _2726 = _2736;
    }
    float _2738 = _2726;
    if (!_2634)
    {
        _2714 = _2626;
    }
    float _2740 = _2714;
    float _2742 = _2740;
    if (_2634)
    {
        float _2744 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2672 = _2744;
    }
    float _2746 = _2672;
    if (!_2634)
    {
        _2734 = _2624;
    }
    float _2748 = _2734;
    float _2750 = _2748;
    if (_2634)
    {
        float _2752 = _2624 * _2722;
        _2750 = _2752;
    }
    float _2754 = _2750;
    if (_2634)
    {
        float _2756 = _2738 * _2738;
        _2742 = _2756;
    }
    float _2758 = _2742;
    if (_2634)
    {
        float _2760 = fma(_2700, _2694, _2746);
        _2718 = _2760;
    }
    float _2762 = _2718;
    if (!_2634)
    {
        _2728 = _2628;
    }
    float _2764 = _2728;
    float _2766 = _2764;
    if (_2634)
    {
        float _2768 = _2754 * _2754;
        _2766 = _2768;
    }
    float _2770 = _2766;
    float _2772 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2774 = fma(_2762, _2762, _2758);
    float _2776 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2778 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2772);
    float _2780 = _2774 + _2770;
    float _2782 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2786 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2784);
    float _2788 = precise::clamp(_2786, 0.0, 1.0);
    float _2790 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2778);
    float _2792 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2794 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2782);
    float _2796 = rsqrt(_2780);
    float _2798 = -_2788;
    float _2800 = _2798 + 1.0;
    float _2802 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2792);
    float _2804 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2794);
    float _2806 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2808 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2802);
    float _2810 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2812 = abs(_2800);
    float _2814 = log2(_2812);
    float _2816 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2818 = _2808 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2820 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2822 = -_2816;
    float _2824 = fma(_2822, _2776, 1.0);
    float _2826 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2684);
    float _2828 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2820);
    float _2830 = _2796 * _2738;
    float _2832 = _2796 * _2762;
    float _2834 = _2796 * _2754;
    float _2836 = _2826 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2838 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2840 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2828);
    float _2842 = log2(_2824);
    float _2844 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2846 = -_2838;
    float _2848 = fma(_2832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2846);
    float _2850 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2852 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2840);
    float _2854 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2844);
    float _2856 = -_2834;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2848);
    float _2860 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2862 = exp2(_2850);
    float _2864 = _2832 + 1.0;
    float _2866 = fma(_2858, -0.5, 0.5);
    float _2868 = fma(_2858, 0.5, 0.5);
    float _2870 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2860);
    float _2872 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2854);
    float _2874 = 1.0 / _2852;
    float _2876 = fma(_2868, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2878 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2870);
    float _2880 = _2842 * 0.693147182464599609375;
    float _2882 = fma(_2868, _2876, -0.212114393711090087890625);
    float _2884 = _2880 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2886 = sqrt(_2866);
    float _2888 = -_2832;
    float _2890 = fma(_2862, _2864, _2888);
    float _2892 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2878);
    float _2894 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2872);
    float _2896 = fma(_2868, _2882, 1.570728778839111328125);
    float _2898 = fma(_2890, 0.5, 0.5);
    float _2900 = _2892 * _2874;
    float _2902 = _2894 * _2874;
    float _2904 = fma(_2900, 0.5, 0.5);
    float _2906 = fma(_2902, -0.5, 0.5);
    float _2908 = _2886 * 0.636619746685028076171875;
    float3 _7640 = float3(_2904, _2906, _2884);
    float _2910 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).x;
    float3 _7651 = float3(_2904, _2906, _2884);
    float4 _2913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7651, float3(0.0), isnan(_7651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7651, float3(0.0), isnan(_7651)), level(0.0)).xyzw;
    float _2915 = _2913.x;
    float _2917 = _2913.y;
    float _2919 = _2913.z;
    float _2921 = _2913.w;
    float _2923 = -_2896;
    float _2925 = fma(_2908, _2923, 1.0);
    float2 _7673 = float2(_2925, _2898);
    float3 _2929 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7673, float2(0.0), isnan(_7673)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7673, float2(0.0), isnan(_7673)), level(0.0)).xyz;
    float _2931 = _2929.x;
    float _2933 = _2929.y;
    float _2935 = _2929.z;
    float _2937 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2939 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2941 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2943 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2945 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2947 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2949 = -_2360;
    float _2951 = fma(_2949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2937);
    float _2953 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2955 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2939);
    float _2957 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2941);
    float _2959 = -_2360;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2945);
    float _2963 = _355 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2965 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2947);
    float _2967 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2951);
    float _2969 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2953);
    float _2971 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2955);
    float _2975 = -_2360;
    float _2977 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2943);
    float _2979 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2981 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2957);
    float _2983 = fma(_2963, _2963, 1.0);
    float _2985 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2965);
    float _2987 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2989 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    float _2991 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2979);
    float _2993 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2969);
    float _2995 = rsqrt(_2983);
    float _2997 = _329 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2999 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2991);
    float _3001 = _2963 * _2967;
    float _3003 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3005 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2977);
    float _3007 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    float _3009 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2989);
    float _3011 = exp2(_2987);
    out.m_72.x = _2993;
    out.m_72.y = _2973;
    out.m_72.z = _2981;
    float _3013 = fma(_2997, _2993, _3001);
    float _3015 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3003);
    float _3017 = _2963 * _3005;
    float _3019 = _2892 + _2852;
    out.m_74.x = _2594;
    out.m_74.y = _2592;
    out.m_74.z = _2596;
    float _3021 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3015);
    float _3023 = _2963 * _2995;
    float _3025 = fma(_2997, _2973, _3017);
    float _3027 = _3019 * 0.5;
    float _3029 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3021);
    float _3031 = -_3009;
    float _3033 = _3023 * _3031;
    float _3035 = -_2985;
    float _3037 = _3023 * _3035;
    float _3039 = -_2999;
    float _3041 = _3023 * _3039;
    float _3043 = _3029 + _2852;
    float _3045 = -_3011;
    float _3047 = _3045 + 1.0;
    float _3049 = fma(_2995, _3005, _3037);
    float _3051 = _2963 * _3007;
    float _3053 = fma(_2995, _2967, _3033);
    float _3055 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3057 = fma(_2995, _3007, _3041);
    float _3059 = fma(_2997, _2981, _3051);
    float _3061 = _2852 * 0.5;
    float _3063 = _3009 + _3013;
    float _3065 = -_3055;
    float _3067 = _3065 + 1.0;
    float _3069 = fma(_2894, -0.5, _3061);
    float _3071 = _3043 * 0.5;
    float _3073 = _2985 + _3025;
    float _3075 = _2999 + _3059;
    out.m_76.x = _3053;
    out.m_76.y = _3049;
    out.m_76.z = _3057;
    bool _3077 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3079 = isnan(_2618);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3085 = _3081 || _3083;
    out.m_78.x = _3027;
    out.m_78.y = _3069;
    out.m_78.z = _3071;
    out.m_78.w = _2852;
    out.m_80.x = _3063;
    out.m_80.y = _3073;
    out.m_80.z = _3075;
    out.gl_Position.x = _2892;
    out.gl_Position.y = _2894;
    out.gl_Position.z = _3029;
    out.gl_Position.w = _2852;
    float _3087 = _2852;
    float _3089 = _3029;
    float _3091 = _2894;
    float _3093 = _2892;
    float _3095 = _3067;
    if (!_3085)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3097 = _3087;
    float _3099 = _3097;
    float _3101 = _3097;
    if (!_3085)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3103 = _3089;
    float _3105 = _3103;
    float _3107 = _3103;
    if (!_3085)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3109 = _3091;
    float _3111 = _3109;
    float _3113 = _3109;
    if (!_3085)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3115 = _3093;
    float _3117 = _3055 * _2910;
    float _3119 = _2921 * _3067;
    float _3121 = _3115;
    float _3123 = _3115;
    if (!_3085)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3125 = _3095;
    float _3127 = _2921 * _3117;
    float _3129 = _2935 * _3117;
    float _3131 = fma(_2931, _3127, _2915);
    float _3133 = fma(_2933, _3127, _2917);
    float _3135 = _3127;
    float _3137 = _3125;
    float _3139 = _3125;
    if (!_3085)
    {
        _3135 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3141 = _3135;
    float _3143 = fma(_2921, _3129, _2919);
    out.m_82.x = _3131;
    out.m_82.y = _3133;
    out.m_82.z = _3143;
    out.m_82.w = _3119;
    bool _3145 = !_3085;
    float _3147 = _3141;
    float _3149 = _3141;
    if (!_3145)
    {
        bool _3151 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3153 = isnan(_2618);
        bool _3155 = _3151 || _3153;
        bool _3157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3159 = _3155 || _3157;
        if (!_3159)
        {
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3163 = _2618 + _3161;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3165;
            float _3169 = 1.0 / _3167;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3191 = _3163 * _3169;
            float _3193 = precise::clamp(_3191, 0.0, 1.0);
            float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3199 = fma(_3193, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3201 = fma(_3193, _3197, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3203 = fma(_3193, _3177, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3205 = fma(_3193, _3181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3207 = fma(_3193, _3185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3209 = fma(_3193, _3189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3101 = _3201;
            _3123 = _3207;
            _3139 = _3199;
            _3113 = _3205;
            _3107 = _3203;
            _3149 = _3209;
            _3211 = true;
        }
        else
        {
            bool _3213 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3215 = isnan(_2618);
            bool _3217 = _3213 || _3215;
            bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3221 = _3217 || _3219;
            if (!_3221)
            {
                _3137 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3223 = _3137;
            _3139 = _3223;
            if (!_3221)
            {
                _3099 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3225 = _3099;
            _3101 = _3225;
            if (!_3221)
            {
                _3105 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3227 = _3105;
            _3107 = _3227;
            if (!_3221)
            {
                _3111 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3229 = _3111;
            _3113 = _3229;
            if (!_3221)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3231 = _3121;
            _3123 = _3231;
            if (!_3221)
            {
                _3147 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3233 = _3147;
            bool _3235 = !_3221;
            _3149 = _3233;
            if (!_3235)
            {
                bool _3237 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3239 = isnan(_2618);
                bool _3241 = _3237 || _3239;
                bool _3243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3245 = _3241 || _3243;
                if (!_3245)
                {
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3249 = _2618 + _3247;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3251;
                    float _3255 = 1.0 / _3253;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3277 = _3249 * _3255;
                    float _3279 = precise::clamp(_3277, 0.0, 1.0);
                    float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3283 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3285 = fma(_3279, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3287 = fma(_3279, _3283, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3289 = fma(_3279, _3263, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3291 = fma(_3279, _3267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3293 = fma(_3279, _3271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3295 = fma(_3279, _3275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3101 = _3287;
                    _3123 = _3293;
                    _3139 = _3285;
                    _3113 = _3291;
                    _3107 = _3289;
                    _3149 = _3295;
                    _3211 = true;
                }
                else
                {
                    _3101 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3139 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3113 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3107 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3149 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3211 = false;
    float _3297 = _3101;
    float _3299 = _3123;
    float _3301 = _3139;
    float _3303 = _3113;
    float _3305 = _3107;
    float _3307 = _3149;
    float _3309 = fma(_3073, -0.5, 0.5);
    float _3311 = precise::clamp(_3309, 0.0, 1.0);
    float _3313 = -_3297;
    float _3315 = _3313 + _3299;
    float _3317 = -_3301;
    float _3319 = _3317 + _3303;
    float _3321 = -_3305;
    float _3323 = _3321 + _3307;
    bool _3325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3327 = fma(_3311, _3315, _3297);
    float _3329 = fma(_3311, _3319, _3301);
    float _3331 = fma(_3311, _3323, _3305);
    float _3333 = _3327 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3335 = fma(_3329, 0.298911988735198974609375, _3333);
    float _3337 = fma(_3331, 0.114477999508380889892578125, _3335);
    out.m_84.x = 0.0;
    float _3339 = -_3337;
    float _3341 = _3329 + _3339;
    float _3343 = -_3337;
    float _3345 = _3327 + _3343;
    float _3347 = -_3337;
    float _3349 = _3331 + _3347;
    float _3351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3353 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3355 = fma(_3345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3357 = fma(_3349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    out.m_86.w = _3351;
    out.m_88.x = _3353;
    out.m_88.y = _3355;
    out.m_88.z = _3357;
    if (!_3325)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3359 = -_2592;
    float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3363 = -_2594;
    float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3367 = -_2596;
    float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3371 = _3361 * _3361;
    float _3373 = fma(_3365, _3365, _3371);
    float _3375 = fma(_3369, _3369, _3373);
    float _3377 = sqrt(_3375);
    float _3379 = rsqrt(_3375);
    float _3381 = -_3377;
    float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3385 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3387 = precise::clamp(_3385, 0.0, 1.0);
    float _3389 = _3365 * _3379;
    float _3391 = _3361 * _3379;
    float _3393 = abs(_3387);
    float _3395 = log2(_3393);
    float _3397 = _3369 * _3379;
    float _3399 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3401 = _3073 * _3391;
    float _3403 = -_3391;
    float _3405 = -_3399;
    float _3407 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3405);
    float _3409 = fma(_3063, _3389, _3401);
    float _3411 = -_3397;
    float _3413 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3407);
    float _3415 = fma(_3075, _3397, _3409);
    float _3417 = precise::clamp(_3415, 0.0, 1.0);
    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3421 = _3413 + _3419;
    float _3423 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3425 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3427 = precise::clamp(_3425, 0.0, 1.0);
    float _3429 = exp2(_3423);
    float _3431 = _3429 * _3427;
    float _3433 = _3417 * _3431;
    float _3435 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3437 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3439 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3435;
    out.m_84.y = _3437;
    out.m_84.z = _3439;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3211 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_123);
        out.gl_Position.z = _3496;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
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
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3570 = as_type<float>(_163);
        out.gl_Position.z = _3570;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_64.w;
    float _189 = in.m_49.x;
    float _191 = in.m_49.y;
    float _193 = in.m_49.z;
    float _195 = _165 * _165;
    float _197 = _167 * _167;
    float _199 = _169 * _169;
    float _201 = in.m_44.x;
    float _203 = in.m_44.y;
    float _205 = in.m_44.z;
    float _207 = fma(_173, _173, _195);
    float _209 = fma(_175, _175, _197);
    float _211 = fma(_177, _177, _199);
    float _213 = fma(_179, _179, _207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_183, _183, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _219 > 0.0;
    float _225 = sqrt(_217);
    bool _227 = _221 > 0.0;
    int _229 = as_type<int>(_185) & 1;
    bool _231 = _229 != 0;
    int _233 = as_type<int>(_185) & 2;
    bool _235 = _233 != 0;
    float _237 = _213;
    if (_223)
    {
        float _239 = rsqrt(_213);
        _237 = _239;
    }
    float _241 = _237;
    bool _243 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _247 = _243 || _245;
    bool _249 = isnan(1.0);
    bool _251 = _247 || _249;
    float _253 = 0.0;
    float _255 = 0.0;
    if (!_223)
    {
        _253 = 0.0;
        _255 = 0.0;
    }
    float _257 = _253;
    float _259 = _255;
    bool _261 = _225 > 0.0;
    float _263 = _225;
    float _265 = _257;
    float _267 = _259;
    if (!_223)
    {
        _263 = 0.0;
    }
    float _269 = _263;
    float _271 = _185;
    float _273 = _269;
    if (_227)
    {
        float _275 = rsqrt(_215);
        _271 = _275;
    }
    float _277 = _271;
    float _279 = 0.0;
    if (!_227)
    {
        _279 = 0.0;
    }
    float _281 = _279;
    float _283 = 0.0;
    float _285 = _281;
    if (!_227)
    {
        _283 = 0.0;
    }
    float _287 = _283;
    float _289 = 0.0;
    float _291 = _287;
    if (!_227)
    {
        _289 = 0.0;
    }
    float _293 = _289;
    float _295 = _241;
    float _297 = _293;
    if (_223)
    {
        float _299 = _241 * _173;
        _265 = _299;
    }
    float _301 = _265;
    if (_223)
    {
        float _303 = _241 * _165;
        _273 = _303;
    }
    float _305 = _273;
    float _307 = _305;
    if (_223)
    {
        float _309 = _241 * _179;
        _267 = _309;
    }
    float _311 = _267;
    if (!_251)
    {
        float _313 = _171 * _171;
        float _315 = _313 * 0.5;
        _295 = _315;
    }
    float _317 = _295;
    float _319 = 0.0;
    float _321 = _317;
    if (_261)
    {
        float _323 = rsqrt(_217);
        _319 = _323;
    }
    float _325 = _319;
    bool _327 = !_231;
    float _329 = _327 ? (-0.5) : 0.5;
    float _331 = _277;
    if (_227)
    {
        float _333 = _277 * _175;
        _285 = _333;
    }
    float _335 = _285;
    if (_227)
    {
        float _337 = _277 * _167;
        _291 = _337;
    }
    float _339 = _291;
    if (_227)
    {
        float _341 = _277 * _181;
        _297 = _341;
    }
    float _343 = _297;
    if (!_261)
    {
        _331 = 0.0;
    }
    float _345 = _331;
    float _347 = _345;
    if (!_251)
    {
        float _349 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _349;
    }
    float _351 = _321;
    bool _353 = !_235;
    float _355 = _353 ? (-0.5) : 0.5;
    bool _357 = !_251;
    float _359 = _351;
    float _361 = 0.0;
    if (!_357)
    {
        float _363 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _365 = log2(_363);
        float _367 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _369 = _367 + 1.0;
        float _371 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = _171 * _365;
        float _375 = 1.0 / _369;
        float _377 = _371 * 0.693147182464599609375;
        float _379 = exp2(_373);
        float _381 = 1.0 / _377;
        float _383 = _379 + (-1.0);
        float _385 = -_383;
        float _387 = fma(_385, _381, _171);
        float _389 = _387 * _375;
        float _391 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _359 = _391;
        _361 = _377;
    }
    float _393 = _359;
    float _395 = _361;
    float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = _395;
    float _401 = _393;
    if (_261)
    {
        float _403 = _325 * _169;
        _347 = _403;
    }
    float _405 = _347;
    float _407 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_261)
    {
        _399 = 0.0;
    }
    float _409 = _399;
    float _411 = _397 * _305;
    float _413 = _397 * _339;
    float _415 = _397 * _405;
    float _417 = _409;
    if (_261)
    {
        float _419 = _325 * _177;
        _417 = _419;
    }
    float _421 = _417;
    float _423 = fma(_407, _301, _411);
    float _425 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_261)
    {
        _307 = 0.0;
    }
    float _427 = _307;
    float _429 = _427;
    if (_261)
    {
        float _431 = _325 * _183;
        _429 = _431;
    }
    float _433 = _429;
    float _435 = fma(_407, _335, _413);
    float _437 = fma(_407, _421, _415);
    float _439 = fma(_425, _311, _423);
    if (!_251)
    {
        _401 = _171;
    }
    float _441 = _401;
    bool _443 = !_251;
    float _445 = _441;
    if (!_443)
    {
        float _447 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _449 = log2(_447);
        float _451 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _453 = _451 + 1.0;
        float _455 = 1.0 / _453;
        float _457 = _171 * _449;
        float _459 = exp2(_457);
        float _461 = -_459;
        float _463 = _461 + 1.0;
        float _465 = _463 * _455;
        _445 = _465;
    }
    float _467 = _445;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _471 = fma(_425, _343, _435);
    float _473 = fma(_425, _433, _437);
    float _475 = fma(_467, _189, _439);
    float _477 = fma(_467, _191, _471);
    float _479 = fma(_467, _193, _473);
    float _481 = fma(_475, _187, _201);
    float _483 = fma(_477, _187, _203);
    float _485 = fma(_479, _187, _205);
    bool _487 = !_469;
    float _503;
    if (!_487)
    {
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _491 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_107);
        float _509 = 1.0 / _507;
        float _511 = _143 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _517 = int(_515);
    float _519 = _483 * _181;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _513 + _521;
    float _525 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _527 = int(_525);
    float _529 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _531 = int(_529);
    float _533 = float(_517);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = 1.0 / _533;
    float _545 = float(_527);
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _549 = int(_547);
    float _551 = float(uint(_531));
    bool _553 = _531 == 0;
    int _555 = ~_531;
    int _557 = _555 + 1;
    float _559 = 1.0 / _545;
    float _561 = _543 * _143;
    float _563 = 1.0 / _551;
    float _565 = float(uint(_549));
    int _567 = ~_549;
    int _569 = _567 + 1;
    float _571 = trunc(_561);
    int _573 = int(_571);
    float _575 = _559 * _143;
    float _577 = in.m_51.y;
    float _579 = 1.0 / _565;
    int _581 = as_type<int>(_563) + (-2);
    float _583 = trunc(_575);
    int _585 = int(_583);
    float _587 = float(uint(_573));
    float _589 = as_type<float>(_581) * _587;
    int _591 = as_type<int>(_579) + (-2);
    float _593 = 1.0 / _541;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _597 = _595 != 0;
    float _599 = float(uint(_585));
    float _601 = trunc(_589);
    float _603 = precise::max(_601, 0.0);
    uint _606 = uint(_603);
    float _608 = as_type<float>(_591) * _599;
    int _610 = ~_531;
    int _612 = _610 + 1;
    float _614 = trunc(_608);
    float _616 = precise::max(_614, 0.0);
    uint _618 = uint(_616);
    int _620 = _612 * int(_606);
    int _622 = _620 + _573;
    float _624 = float(uint(_622));
    float _626 = as_type<float>(_622);
    float _628 = _624;
    if (_597)
    {
        _626 = 1.0;
    }
    float _630 = _626;
    int _632 = _569 * int(_618);
    int _634 = _632 + _585;
    float _636 = _630;
    if (!_597)
    {
        _636 = 7.345489978790283203125;
    }
    float _638 = _636;
    float _640 = as_type<float>(_581) * _624;
    if (_597)
    {
        _628 = 1.0;
    }
    float _642 = _628;
    float _644 = float(uint(_634));
    float _646 = trunc(_640);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    float _652 = _638 * _129;
    float _654 = _642;
    float _656 = _644;
    if (!_597)
    {
        _654 = 1.2345600128173828125;
    }
    float _658 = _654;
    float _660 = as_type<float>(_591) * _644;
    if (_597)
    {
        _656 = _129;
    }
    float _662 = _656;
    float _664 = _662;
    if (!_597)
    {
        _664 = _577;
    }
    float _666 = _664;
    float _668 = trunc(_660);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    float _674 = _658 * _666;
    int _676 = ~_531;
    int _678 = _676 + 1;
    int _680 = ~_549;
    int _682 = _680 + 1;
    float _684 = floor(_652);
    int _686 = int(_606) + int(_650);
    float _688 = float(_107);
    float _690 = float(_531);
    int _692 = _678 * _686;
    int _694 = _692 + _573;
    float _696 = floor(_674);
    int _698 = int(_618) + int(_672);
    float _700 = float(_573);
    bool _702 = uint(_694) >= uint(_531);
    float _704 = 1.0 / _688;
    float _706 = -_684;
    float _708 = _652 + _706;
    bool _710 = _700 >= _690;
    bool _712 = isnan(_700);
    bool _714 = _710 || _712;
    bool _716 = isnan(_690);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    int _722 = _682 * _698;
    int _724 = _722 + _585;
    bool _726 = !_702;
    int _728 = _726 ? 0 : (-1);
    float _730 = _708 * _690;
    float _732 = float(_549);
    float _734 = float(_585);
    float _736 = -_696;
    float _738 = _674 + _736;
    int _740 = ~_686;
    int _742 = _740 + _728;
    int _744 = _742 + 1;
    float _746 = trunc(_730);
    int _748 = int(_746);
    bool _750 = _734 >= _732;
    bool _752 = isnan(_734);
    bool _754 = _750 || _752;
    bool _756 = isnan(_732);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    bool _762 = uint(_724) >= uint(_549);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _766 = _764 != 0;
    float _768 = _704 * _143;
    float _770 = trunc(_720);
    int _772 = int(_770);
    bool _774 = !_766;
    int _776 = _774 ? 0 : 1;
    float _778 = _690 * _768;
    int _780 = _531 * _744;
    int _782 = _780 + _573;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _794 = _792 != 0;
    int _796 = abs(_776);
    float _798 = trunc(_760);
    int _800 = int(_798);
    float _802 = _732 * _768;
    bool _804 = !_762;
    int _806 = _804 ? 0 : (-1);
    int _808 = _748 * _796;
    int _810 = _808 + _573;
    bool _812 = !_553;
    int _814 = _812 ? _782 : (-1);
    float _816 = _738 * _732;
    int _818 = ~_698;
    int _820 = _818 + _806;
    int _822 = _820 + 1;
    int _824 = ~_772;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = trunc(_778);
    int _832 = int(_830);
    bool _834 = !_790;
    int _836 = _834 ? 0 : 1;
    int _838 = _549 * _822;
    int _840 = _838 + _585;
    bool _842 = _549 == 0;
    int _844 = _814 * _828;
    int _846 = abs(_836);
    int _848 = ~_800;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = trunc(_816);
    int _856 = int(_854);
    bool _858 = !_842;
    int _860 = _858 ? _840 : (-1);
    int _862 = _531 + (-1);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _866 = _864 != 0;
    int _868 = _860 * _852;
    int _870 = _772 * _862;
    int _872 = _870 + _844;
    bool _874 = !_786;
    int _876 = _874 ? 0 : 1;
    float _878 = trunc(_802);
    int _880 = int(_878);
    bool _882 = !_866;
    int _884 = _882 ? 0 : 1;
    int _886 = _872 * _846;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _890 = _888 != 0;
    int _892 = _549 + (-1);
    int _894 = abs(_876);
    int _896 = abs(_884);
    int _898 = _800 * _892;
    int _900 = _898 + _868;
    bool _902 = !_794;
    int _904 = _902 ? 0 : 1;
    int _906 = _832 * _894;
    int _908 = _906 + _886;
    bool _910 = !_890;
    int _912 = _910 ? 0 : 1;
    int _914 = _856 * _896;
    int _916 = _914 + _585;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    int _934 = abs(_904);
    int _936 = abs(_912);
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    bool _942 = !_920;
    int _944 = _942 ? 0 : 1;
    int _946 = abs(_940);
    int _948 = _810 * _934;
    int _950 = _948 + _908;
    bool _952 = !_928;
    int _954 = _952 ? 0 : 1;
    int _956 = abs(_944);
    int _958 = _748 * _936;
    int _960 = _958 + _950;
    bool _962 = !_932;
    int _964 = _962 ? 0 : 1;
    int _966 = abs(_954);
    int _968 = _900 * _946;
    int _970 = abs(_964);
    float _972 = float(uint(_960));
    int _974 = _880 * _956;
    int _976 = _974 + _968;
    float _978 = as_type<float>(_581) * _972;
    bool _980 = _531 == 0;
    int _982 = _916 * _966;
    int _984 = _982 + _976;
    int _986 = ~_531;
    int _988 = _986 + 1;
    int _990 = ~_549;
    int _992 = _990 + 1;
    int _994 = _856 * _970;
    int _996 = _994 + _984;
    float _998 = trunc(_978);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = ~_531;
    int _1006 = _1004 + 1;
    float _1008 = float(uint(_996));
    float _1010 = as_type<float>(_591) * _1008;
    float _1012 = trunc(_1010);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    int _1018 = _988 * int(_1002);
    int _1020 = _1018 + _960;
    int _1022 = ~_549;
    int _1024 = _1022 + 1;
    float _1026 = float(uint(_1020));
    float _1028 = as_type<float>(_581) * _1026;
    float _1030 = trunc(_1028);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    int _1036 = _1024 * int(_1016);
    int _1038 = _1036 + _996;
    float _1040 = float(uint(_1038));
    float _1042 = as_type<float>(_591) * _1040;
    float _1044 = trunc(_1042);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = int(_1002) + int(_1034);
    int _1052 = _1006 * _1050;
    int _1054 = _1052 + _960;
    int _1056 = ~_549;
    int _1058 = _1056 + 1;
    float _1060 = float(uint(_916));
    bool _1062 = uint(_1054) >= uint(_531);
    bool _1064 = !_1062;
    int _1066 = _1064 ? 0 : (-1);
    int _1068 = int(_1016) + int(_1048);
    float _1070 = as_type<float>(_591) * _1060;
    int _1072 = ~_1050;
    int _1074 = _1072 + _1066;
    int _1076 = _1074 + 1;
    int _1078 = _1058 * _1068;
    int _1080 = _1078 + _996;
    float _1082 = trunc(_1070);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = _531 * _1076;
    int _1090 = _1088 + _960;
    bool _1092 = uint(_1080) >= uint(_549);
    bool _1094 = !_980;
    int _1096 = _1094 ? _1090 : (-1);
    bool _1098 = !_1092;
    int _1100 = _1098 ? 0 : (-1);
    float _1102 = _577 * 2.0;
    int _1104 = _1096 & 3;
    bool _1106 = _1104 != 0;
    int _1108 = ~_1068;
    int _1110 = _1108 + _1100;
    int _1112 = _1110 + 1;
    bool _1114 = uint(_1104) > 1u;
    float _1116 = floor(_1102);
    int _1118 = _1096 & 3;
    bool _1120 = _1118 != 0;
    int _1122 = _549 * _1112;
    int _1124 = _1122 + _996;
    float _1126 = float(uint(_810));
    int _1128 = _1120 ? 0 : 1;
    bool _1130 = !_842;
    int _1132 = _1130 ? _1124 : (-1);
    bool _1134 = uint(_1104) >= 2u;
    int _1136 = _1132 & 3;
    bool _1138 = _1136 != 0;
    int _1140 = ~_1128;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    int _1146 = _1144;
    if (!_1114)
    {
        int _1148 = ~_1128;
        int _1150 = _1148 + 1;
        _1146 = _1150;
    }
    int _1152 = _1146;
    float _1154 = as_type<float>(_581) * _1126;
    int _1156 = _1134 ? 0 : 1;
    bool _1158 = uint(_1136) > 1u;
    float _1160 = trunc(_1154);
    float _1162 = precise::max(_1160, 0.0);
    uint _1164 = uint(_1162);
    int _1166 = _1132 & 3;
    bool _1168 = _1166 != 0;
    int _1170 = ~_1156;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    int _1176 = _1168 ? 0 : 1;
    bool _1178 = _1104 != 3;
    int _1180 = ~_1176;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = in.m_51.z;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1190 = _1188 != 0;
    int _1192 = _1184;
    int _1194 = _1174;
    if (!_1158)
    {
        int _1196 = ~_1176;
        int _1198 = _1196 + 1;
        _1192 = _1198;
    }
    int _1200 = _1192;
    int _1202 = ~_531;
    int _1204 = _1202 + 1;
    bool _1206 = uint(_1136) >= 2u;
    bool _1208 = _577 > 0.5;
    int _1210 = _1204 * int(_1164);
    int _1212 = _1210 + _810;
    if (_1178)
    {
        int _1214 = ~_1156;
        int _1216 = _1214 + 1;
        _1194 = _1216;
    }
    int _1218 = _1194;
    int _1220 = _1206 ? 0 : 1;
    float _1222 = float(uint(_1212));
    bool _1224 = _1136 != 3;
    int _1226 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1228 = _1226 != 0;
    float _1230 = _129 * 2.0;
    float _1232 = as_type<float>(_581) * _1222;
    int _1234 = _992 * int(_1086);
    int _1236 = _1234 + _916;
    int _1238 = ~_1220;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = -_355;
    int _1246 = _1208 ? as_type<int>(_1244) : as_type<int>(_355);
    float _1248 = floor(_1230);
    float _1250 = float(uint(_1236));
    bool _1252 = !_1106;
    int _1254 = _1252 ? 0 : 1;
    int _1256 = _1242;
    int _1258 = _1220;
    if (_1224)
    {
        int _1260 = ~_1220;
        int _1262 = _1260 + 1;
        _1256 = _1262;
    }
    int _1264 = _1256;
    float _1266 = as_type<float>(_591) * _1250;
    bool _1268 = _129 > 0.5;
    float _1270 = trunc(_1232);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    float _1276 = as_type<float>(_1274);
    if (_1190)
    {
        _1258 = 0;
    }
    int _1278 = _1258;
    float _1280 = -_329;
    int _1282 = _1268 ? as_type<int>(_1280) : as_type<int>(_329);
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    bool _1288 = !_1228;
    float _1290 = _1288 ? _329 : as_type<float>(_1282);
    float _1292 = trunc(_1266);
    float _1294 = precise::max(_1292, 0.0);
    uint _1296 = uint(_1294);
    bool _1298 = _1248 > 0.0;
    bool _1300 = _1248 >= 0.0;
    bool _1302 = isnan(_1248);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = _1290 + 0.5;
    bool _1312 = !_1286;
    float _1314 = _1312 ? _355 : as_type<float>(_1246);
    bool _1316 = _1186 > 0.5;
    int _1318 = _1278;
    if (!_1190)
    {
        _1318 = 1;
    }
    int _1320 = _1318;
    float _1322 = _1314 + (-0.5);
    int _1324 = _1308 ? 0 : 1;
    float _1326 = -_329;
    int _1328 = _1316 ? as_type<int>(_1326) : as_type<int>(_329);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1332 = _1330 != 0;
    bool _1334 = _1320 != 1;
    float _1336 = _1186 * 2.0;
    int _1338 = ~_549;
    int _1340 = _1338 + 1;
    int _1342 = ~_1324;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    int _1348 = _1346;
    if (!_1298)
    {
        int _1350 = ~_1324;
        int _1352 = _1350 + 1;
        _1348 = _1352;
    }
    int _1354 = _1348;
    bool _1356 = !_1332;
    float _1358 = _1356 ? _329 : as_type<float>(_1328);
    int _1360 = int(_1086) + int(_1296);
    bool _1362 = _1116 > 0.0;
    float _1364 = floor(_1336);
    bool _1366 = _1116 >= 0.0;
    bool _1368 = isnan(_1116);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    int _1376 = int(_1164) + int(_1274);
    int _1378 = _1374 ? 0 : 1;
    int _1380 = _1340 * _1360;
    int _1382 = _1380 + _916;
    float _1384 = 0.0;
    if (!_1334)
    {
        _1384 = _577;
    }
    float _1386 = _1384;
    int _1388 = _557 * _1376;
    int _1390 = _1388 + _810;
    float _1392 = 0.0;
    float _1394 = _1386;
    if (!_1334)
    {
        _1392 = _577;
    }
    float _1396 = _1392;
    float _1398 = 0.0;
    float _1400 = _1396;
    if (!_1334)
    {
        _1398 = _1186;
    }
    float _1402 = _1398;
    float _1404 = _1402;
    if (!_1334)
    {
        _1276 = _1186;
    }
    float _1406 = _1276;
    float _1408 = _1406;
    if (_1334)
    {
        _1394 = _129;
    }
    float _1410 = _1394;
    if (_1334)
    {
        _1400 = _129;
    }
    float _1412 = _1400;
    if (_1334)
    {
        _1404 = _577;
    }
    float _1414 = _1404;
    if (_1334)
    {
        _1408 = _577;
    }
    float _1416 = _1408;
    bool _1418 = uint(_1382) >= uint(_549);
    float _1420 = _483 * _167;
    bool _1422 = uint(_1390) >= uint(_531);
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    int _1426 = ~_1378;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = in.m_51.w;
    int _1434 = _1430;
    if (!_1362)
    {
        int _1436 = ~_1378;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    bool _1442 = !_1418;
    int _1444 = _1442 ? 0 : (-1);
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1456 = _1454 != 0;
    float _1458 = _483 * _175;
    bool _1460 = _1364 > 0.0;
    bool _1462 = !_1422;
    int _1464 = _1462 ? 0 : (-1);
    float _1466 = fma(_481, _173, _1458);
    bool _1468 = _1364 >= 0.0;
    bool _1470 = isnan(_1364);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.0);
    bool _1476 = _1472 || _1474;
    float _1478 = fma(_481, _165, _1420);
    float _1480 = fma(_481, _179, _519);
    int _1482 = _1476 ? 0 : 1;
    float _1484 = fma(_485, _183, _1480);
    bool _1486 = !_1448;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1490;
    int _1494 = ~_1482;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1502 = _1498;
    if (!_1460)
    {
        int _1504 = ~_1482;
        int _1506 = _1504 + 1;
        _1502 = _1506;
    }
    int _1508 = _1502;
    float _1510 = fma(_485, _177, _1466);
    float _1512 = fma(_485, _169, _1478);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1518 = 1.0 / _1492;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1522 = _1520 != 0;
    float _1524 = in.m_55.w;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1528 = _1526 != 0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1530;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1536 = _1534 != 0;
    float _1538 = in.m_57.w;
    float _1540 = 1.0 / _1516;
    float _1542 = in.m_59.w;
    bool _1544 = _1432 > 0.5;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1548 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1554 = _513 + _1552;
    float _1556 = 1.0 / _1532;
    float _1558 = -_1546;
    float _1560 = fma(_1500, 2.0, _1558);
    float _1562 = fma(_1548, -2.0, _1550);
    float _1564 = _129 + _577;
    float _1566 = _129 + _1186;
    float _1568 = _1554 * _1518;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1572 = _513 + _1570;
    float _1574 = _1564 + (-1.0);
    float _1576 = _523 * _1540;
    float _1578 = _1186 + _577;
    float _1580 = _1566 + (-1.0);
    float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1584 = _1578 + (-1.0);
    float _1586 = _1512 + _1524;
    bool _1588 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1590 = isnan(_513);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = _1572 * _1556;
    float _1602 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1604 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1606 = isnan(_513);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1484 + _1542;
    float _1618 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1620;
    bool _1624 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1626 = isnan(_513);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = -_1614;
    float _1638 = _1636 + 1.0;
    float _1640 = _1510 + _1538;
    float _1642 = fma(_1622, _1568, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1644;
    bool _1648 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1650 = isnan(_513);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -_1598;
    float _1662 = _1660 + 1.0;
    float _1664 = _1634 * _1638;
    float _1666 = -_1634;
    float _1668 = _1666 + 1.0;
    float _1670 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1562);
    float _1672 = fma(_1646, _1568, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1674 = _1614 * _1662;
    float _1676 = _1658 * _1668;
    float _1678 = -_143;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1560);
    float _1682 = -_1322;
    float _1684 = -_1670;
    float _1686 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1684);
    float _1688 = _1642 * _1676;
    float _1690 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1680);
    float _1692 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1694 = !_1456;
    int _1696 = _1694 ? 0 : 1;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1700 = !_1452;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = _1672 * _1676;
    int _1706 = abs(_1696);
    float _1708 = -_1698;
    float _1710 = fma(_1692, 2.0, _1708);
    int _1712 = abs(_1702);
    float _1714 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1716 = log2(_1714);
    int _1718 = abs(_1488);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1728 = -_1658;
    float _1730 = _1728 + 1.0;
    float _1732 = float(_1354);
    float _1734 = fma(_1722, _1576, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1736 = float(_1440);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1740 = float(_1712);
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1688);
    float _1744 = float(_1706);
    float _1746 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1738);
    int _1748 = _1096 >> 31;
    float _1750 = _1740 * _1732;
    int _1752 = _1132 >> 31;
    float _1754 = _1716 * _143;
    int _1756 = _1748 & 3;
    float _1758 = fma(_1726, _1576, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1760 = _1752 & 3;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1764 = _1586 + _1762;
    int _1766 = _1096 + _1756;
    float _1768 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1704);
    int _1770 = _1132 + _1760;
    float _1772 = exp2(_1754);
    int _1774 = _1766 >> 2;
    float _1776 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1778 = _1770 >> 2;
    float _1780 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1782 = _1774 << 4;
    int _1784 = _1782 + 368;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1640 + _1786;
    int _1790 = _1778 << 4;
    int _1792 = _1790 + 512;
    float _1794 = fma(_1776, -2.0, _537);
    uint _1796 = uint(int(uint(_1784) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = int(_1796) + 1;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    int _1808 = _1804 & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    float _1812 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1780);
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1816 = _1616 + _1814;
    float _1818 = -_355;
    int _1820 = _1544 ? as_type<int>(_1818) : as_type<int>(_355);
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1824 = -_1772;
    float _1826 = _1824 + 1.0;
    uint _1828 = uint(int(uint(_1792) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1846 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1854 = _1850 || _1852;
    float _1856 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1812);
    bool _1858 = !_1536;
    float _1860 = _1858 ? _355 : as_type<float>(_1820);
    float _1862 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1844);
    float _1864 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1822);
    float _1866 = _1854 ? _1826 : 0.0;
    int _1868 = _1784 + 8;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    float _1886 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1862);
    int _1888 = ~_1360;
    int _1890 = _1888 + _1444;
    int _1892 = _1890 + 1;
    float _1894 = _1744 * _1736;
    int _1896 = ~_1376;
    int _1898 = _1896 + _1464;
    int _1900 = _1898 + 1;
    float _1902 = -_143;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1710);
    int _1906 = abs(_1152);
    int _1908 = _549 * _1892;
    int _1910 = _1908 + _916;
    int _1912 = _1792 + 8;
    uint _1914 = uint(int(uint(_1912) >> uint(2)));
    uint _1916 = uint(int(uint(int(_1914)) >> uint(2)));
    int _1918 = int(_1914) & 3;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[int(_1916)][_1918];
    int _1922 = int(_1914) + 1;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    int _1926 = _1922 & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = abs(_1254);
    int _1932 = _531 * _1900;
    int _1934 = _1932 + _810;
    float _1936 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1864);
    bool _1938 = !_1138;
    int _1940 = _1938 ? 0 : 1;
    float _1942 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1746);
    bool _1944 = _1104 != 3;
    float _1946 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1424);
    int _1948 = abs(_1200);
    float _1950 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1794);
    int _1952 = ~_1906;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    float _1958 = -_1936;
    float _1960 = _1958 + 1.0;
    int _1962 = abs(_1940);
    int _1964 = ~_1948;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = abs(_1218);
    int _1972 = abs(_1264);
    bool _1974 = !_1944;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = _1136 != 3;
    int _1980 = _1956 * as_type<int>(_1810);
    int _1982 = ~_1930;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = ~_1962;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    float _1994 = float(_1718);
    int _1996 = _1986 * as_type<int>(_1802);
    int _1998 = _1996 + _1980;
    int _2000 = ~_1970;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = _1968 * as_type<int>(_1842);
    bool _2008 = !_1522;
    int _2010 = _2008 ? 0 : 1;
    float _2012 = float(_1508);
    int _2014 = _1992 * as_type<int>(_1834);
    int _2016 = _2014 + _2006;
    bool _2018 = !_1978;
    int _2020 = _2018 ? 0 : (-1);
    int _2022 = _2004 * as_type<int>(_1876);
    int _2024 = _2022 + _1998;
    int _2026 = ~_1972;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = _1994 * _2012;
    int _2034 = abs(_2010);
    float _2036 = in.m_66.x;
    float _2038 = in.m_66.y;
    float _2040 = in.m_66.z;
    int _2042 = abs(_2020);
    float _2044 = _2032 * (-2.0);
    int _2046 = abs(_1976);
    int _2048 = _2030 * as_type<int>(_1920);
    int _2050 = _2048 + _2016;
    float _2052 = _1764 * _1764;
    float _2054 = fma(_1582, _2044, _1582);
    bool _2056 = !_1528;
    int _2058 = _2056 ? 0 : 1;
    int _2060 = ~_2042;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    int _2066 = abs(_2058);
    float _2068 = fma(_1788, _1788, _2052);
    bool _2070 = _1856 >= 0.0;
    int _2072 = _2064 * as_type<int>(_1928);
    int _2074 = _2072 + _2050;
    float _2076 = fma(_1816, _1816, _2068);
    bool _2078 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2080 = isnan(1.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2086 = _2082 || _2084;
    float _2088 = _1358 + 0.5;
    int _2090 = ~_2046;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    bool _2096 = _531 == 0;
    float _2098 = fma(_2044, _2036, _2036);
    float _2100 = rsqrt(_2076);
    int _2102 = ~_2034;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2094 * as_type<int>(_1884);
    int _2110 = _2108 + _2024;
    int _2112 = ~_2066;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    float _2118 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1904);
    bool _2120 = _549 == 0;
    int _2122 = _2110 * _2106;
    float _2124 = _2068;
    if (_2070)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2124;
    int _2128 = as_type<int>(_2126);
    if (_2086)
    {
        float _2130 = _1866 * _593;
        _145 = _2130;
    }
    float _2132 = _145;
    bool _2134 = !_2096;
    int _2136 = _2134 ? _1934 : (-1);
    int _2138 = _2074 * _2116;
    bool _2140 = !_2120;
    int _2142 = _2140 ? _1910 : (-1);
    float _2144 = _1860 + (-0.5);
    if (_2070)
    {
        float _2146 = _2126 * 5.0;
        _2128 = as_type<int>(_2146);
    }
    int _2148 = _2128;
    int _2150 = _2136 * _2034;
    int _2152 = _2150 + _2122;
    float _2154 = _129 + (-0.5);
    int _2156 = _2142 * _2066;
    int _2158 = _2156 + _2138;
    float _2160 = -_2144;
    float _2162 = -_1950;
    float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2162);
    float _2166 = -_1886;
    float _2168 = _2166 + 1.0;
    float _2170 = -_1942;
    float _2172 = _2170 + 1.0;
    float _2174 = -_1946;
    float _2176 = _2174 + 1.0;
    if (_2070)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6402 = as_type<float>(_2148);
        out.gl_Position.z = _6402;
    }
    float _2178 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2098);
    float _2180 = -_1960;
    float _2182 = fma(_1290, _2180, _1690);
    float _2184 = fma(_1314, _2168, _1686);
    float _2186 = -_2172;
    float _2188 = fma(_1358, _2186, _2118);
    float _2190 = fma(_1860, _2176, _2164);
    float _2192 = fma(_2054, _2132, _2178);
    float _2194 = _1788 * _2100;
    if (_2070)
    {
        out.m_47.x = 0.0;
    }
    float _2196 = -_2194;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2200 = _1764 * _2100;
    float _2202 = float(_2152);
    out.m_68.x = _2182;
    out.m_68.y = _2184;
    out.m_68.z = _2188;
    out.m_68.w = _2190;
    float _2204 = float(_2158);
    float _2206 = -_2200;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    out.m_70.x = _2202;
    out.m_70.y = _2204;
    float _2210 = _2208 * _2208;
    if (_2070)
    {
        return out;
    }
    float _2212 = -_2200;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1586);
    float _2216 = _1816 * _2100;
    float _2218 = -_2194;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1640);
    float _2222 = _1750 * (-2.0);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2226 = _2214 + _2224;
    float _2228 = -_2216;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2234 = _2220 + _2232;
    float _2236 = _577 + (-0.5);
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2230 + _2240;
    float _2244 = fma(_2222, _2038, _2038);
    float _2246 = fma(_1602, _2222, _1602);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2238);
    float _2250 = fma(_2198, _2198, _2210);
    float _2252 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2244);
    float _2254 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2248);
    float _2256 = -_2216;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1816);
    float _2260 = _1894 * (-2.0);
    float _2262 = fma(_2246, _2132, _2252);
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2264;
    bool _2268 = _2254 >= 0.0;
    float _2270 = fma(_2258, _2258, _2250);
    float _2272 = in.m_64.x;
    float _2274 = in.m_64.y;
    float _2276 = _2192 * 0.15915493667125701904296875;
    float _2278 = fma(_2260, _2040, _2040);
    float _2280 = _1186 + (-0.5);
    float _2282 = fma(_1758, _1664, _1768);
    float _2284 = fma(_2266, _1600, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2286 = _2262 * 0.15915493667125701904296875;
    float _2288 = fma(_1618, _2260, _1618);
    float _2290 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2278);
    float _2292 = _2276 * 6.283185482025146484375;
    float _2294 = sin(_2292);
    float _2296 = fma(_2284, _1674, _2282);
    float _2298 = _2278;
    float _2300 = _2220;
    if (_2268)
    {
        _2298 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _2298;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2304;
    float _2308 = fma(_2288, _2132, _2290);
    float _2310 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2296);
    int _2312 = as_type<int>(_2302);
    if (_2268)
    {
        out.m_47.x = 0.0;
    }
    float _2314 = _2276 * 6.283185482025146484375;
    float _2316 = cos(_2314);
    if (_2268)
    {
        float _2318 = _2302 * 5.0;
        _2312 = as_type<int>(_2318);
    }
    int _2320 = _2312;
    float _2322 = fma(_2306, _1600, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2324 = fma(_1734, _1664, _1742);
    float _2326 = _2308 * 0.15915493667125701904296875;
    if (_2268)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6685 = as_type<float>(_2320);
        out.gl_Position.z = _6685;
    }
    float _2328 = _2310 * _2274;
    float _2330 = sqrt(_2270);
    float _2332 = _2286 * 6.283185482025146484375;
    float _2334 = sin(_2332);
    float _2336 = _2286 * 6.283185482025146484375;
    float _2338 = cos(_2336);
    if (_2268)
    {
        return out;
    }
    float _2340 = _2326 * 6.283185482025146484375;
    float _2342 = cos(_2340);
    float _2344 = fma(_2322, _1674, _2324);
    float _2346 = _2100 * _2330;
    float _2348 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _355);
    float _2352 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2344);
    float _2354 = _2294 * _2334;
    float _2356 = _2346 * _2348;
    float _2358 = _2326 * 6.283185482025146484375;
    float _2360 = sin(_2358);
    float _2362 = _2352 * _2272;
    float _2364 = _2316 * _2334;
    float _2366 = _2350 * _2356;
    float _2368 = _2316 * _2338;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _329);
    float _2374 = _2294 * _2338;
    float _2376 = _2316 * _2342;
    float _2378 = _2346 * _2370;
    float _2380 = _2338 * _2342;
    float _2382 = _2294 * _2342;
    float _2384 = _2376 * _2366;
    float _2386 = _2372 * _2378;
    float _2388 = _2334 * _2342;
    float _2390 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2392 = _2390 * 0.5;
    float _2394 = fma(_2360, _2368, _2354);
    float _2396 = -_2374;
    float _2398 = fma(_2360, _2364, _2396);
    float _2400 = -_2366;
    float _2402 = _2360 * _2400;
    float _2404 = -_2364;
    float _2406 = fma(_2360, _2374, _2404);
    float _2408 = fma(_2394, _2386, _2384);
    float _2410 = _2382 * _2366;
    float _2412 = fma(_2380, _2386, _2402);
    float _2414 = fma(_2360, _2354, _2368);
    float _2416 = fma(_2398, _2392, _2408);
    float _2418 = fma(_2406, _2386, _2410);
    float _2420 = fma(_2388, _2392, _2412);
    float _2422 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2424 = fma(_2414, _2392, _2418);
    float _2426 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2428 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2430 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2422);
    bool _2432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2440 = _2436 || _2438;
    float _2442 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2426);
    float _2444 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2428);
    float _2446 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2430);
    float _2448 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2442);
    float _2450 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2452 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2454 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2456 = _1616 + _2452;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2460 = _1640 + _2454;
    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2464 = _2456 + _2462;
    float _2466 = _1586 + _2458;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2470 = _2460 + _2468;
    float _2472 = _2464 * _2464;
    float _2474 = fma(_2470, _2470, _2472);
    float _2476 = sqrt(_2474);
    bool _2478 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2480 = _2420;
    float _2482 = _2424;
    float _2484 = _2460;
    if (!_2478)
    {
        _2480 = _2456;
    }
    float _2486 = _2480;
    float _2488 = _2486;
    if (!_2478)
    {
        _2482 = _2466;
    }
    float _2490 = _2482;
    bool _2492 = !_2478;
    float _2494 = _2490;
    if (!_2492)
    {
        float _2496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2500 = _2476 + _2498;
        float _2502 = rsqrt(_2474);
        float _2504 = _2500 * _2496;
        float _2506 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2508 = _2504 * 0.15915493667125701904296875;
        float _2510 = _2508 * 6.283185482025146484375;
        float _2512 = cos(_2510);
        float _2514 = _2508 * 6.283185482025146484375;
        float _2516 = sin(_2514);
        float _2518 = _2512 + (-1.0);
        float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2522 = fma(_2516, _2506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2524 = fma(_2466, _2512, _2520);
        float _2526 = _2502 * _2522;
        float _2528 = fma(_2470, _2526, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2530 = fma(_2464, _2526, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2484 = _2528;
        _2494 = _2524;
        _2488 = _2530;
    }
    float _2532 = _2484;
    float _2534 = _2494;
    float _2536 = _2488;
    float _2538 = -_2194;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2532);
    float _2542 = -_2200;
    float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2534);
    float _2546 = -_2216;
    float _2548 = fma(_2546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2536);
    float _2550 = _2544;
    float _2552 = _2540;
    float _2554 = _2548;
    if (!_2440)
    {
        float _2556 = _2226 * _2226;
        float _2558 = 1.0 / _2346;
        float _2560 = fma(_2234, _2234, _2556);
        float _2562 = fma(_2242, _2242, _2560);
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2566 = sqrt(_2562);
        float _2568 = precise::min(_2566, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2564;
        float _2572 = -_1640;
        float _2574 = _2572 + _2532;
        float _2576 = _2570 * _2558;
        float _2578 = -_1586;
        float _2580 = _2578 + _2534;
        float _2582 = -_1616;
        float _2584 = _2582 + _2536;
        float _2586 = fma(_2574, _2576, _2220);
        float _2588 = fma(_2580, _2576, _2214);
        float _2590 = fma(_2584, _2576, _2230);
        _2550 = _2588;
        _2552 = _2586;
        _2554 = _2590;
    }
    float _2592 = _2550;
    float _2594 = _2552;
    float _2596 = _2554;
    float _2598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2600 = _2592 + _2598;
    float _2602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2604 = _2594 + _2602;
    float _2606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2608 = _2596 + _2606;
    float _2610 = _2600 * _2600;
    float _2612 = fma(_2604, _2604, _2610);
    float _2614 = fma(_2608, _2608, _2612);
    float _2616 = rsqrt(_2614);
    float _2618 = sqrt(_2614);
    float _2620 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2622 = _2604 * _2620;
    float _2624 = _2608 * _2620;
    float _2626 = _2622 * _2622;
    float _2628 = _2624 * _2624;
    float _2630 = _2626 + _2628;
    float _2632 = sqrt(_2630);
    bool _2634 = _2632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2638 = _2632 + _2636;
    float _2640 = _2616;
    float _2642 = _2638;
    float _2644 = _2600;
    float _2646 = _2620;
    if (_2634)
    {
        float _2648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2640 = _2648;
    }
    float _2650 = _2640;
    float _2652 = _2650;
    if (_2634)
    {
        float _2654 = _2638 * _2650;
        _2642 = _2654;
    }
    float _2656 = _2642;
    if (_2634)
    {
        float _2658 = rsqrt(_2630);
        _2652 = _2658;
    }
    float _2660 = _2652;
    float _2662 = _2660;
    if (_2634)
    {
        float _2664 = _2656 * 0.15915493667125701904296875;
        _2300 = _2664;
    }
    float _2666 = _2300;
    float _2668 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2670 = _2608;
    float _2672 = _2666;
    if (_2634)
    {
        float _2674 = _2666 * 6.283185482025146484375;
        float _2676 = sin(_2674);
        _2670 = _2676;
    }
    float _2678 = _2670;
    float _2680 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2682 = precise::max(0.0, _2668);
    float _2684 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2680);
    float _2686 = _2214;
    float _2688 = _2682;
    if (_2634)
    {
        float _2690 = _2666 * 6.283185482025146484375;
        float _2692 = cos(_2690);
        _2686 = _2692;
    }
    float _2694 = _2686;
    float _2696 = -_2620;
    float _2698 = -_2682;
    float _2700 = fma(_2600, _2696, _2698);
    if (_2634)
    {
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2644 = _2702;
    }
    float _2704 = _2644;
    float _2706 = _2678;
    float _2708 = _2704;
    if (_2634)
    {
        float _2710 = fma(_2678, _2704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2706 = _2710;
    }
    float _2712 = _2706;
    float _2714 = _2712;
    if (!_2634)
    {
        _2708 = _2700;
    }
    float _2716 = _2708;
    float _2718 = _2716;
    if (_2634)
    {
        float _2720 = _2660 * _2712;
        _2646 = _2720;
    }
    float _2722 = _2646;
    if (!_2634)
    {
        _2662 = _2622;
    }
    float _2724 = _2662;
    float _2726 = _2724;
    float _2728 = _2694;
    if (_2634)
    {
        float _2730 = _2694 + (-1.0);
        _2688 = _2730;
    }
    float _2732 = _2688;
    float _2734 = _2732;
    if (_2634)
    {
        float _2736 = _2622 * _2722;
        _2726 = _2736;
    }
    float _2738 = _2726;
    if (!_2634)
    {
        _2714 = _2626;
    }
    float _2740 = _2714;
    float _2742 = _2740;
    if (_2634)
    {
        float _2744 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2672 = _2744;
    }
    float _2746 = _2672;
    if (!_2634)
    {
        _2734 = _2624;
    }
    float _2748 = _2734;
    float _2750 = _2748;
    if (_2634)
    {
        float _2752 = _2624 * _2722;
        _2750 = _2752;
    }
    float _2754 = _2750;
    if (_2634)
    {
        float _2756 = _2738 * _2738;
        _2742 = _2756;
    }
    float _2758 = _2742;
    if (_2634)
    {
        float _2760 = fma(_2700, _2694, _2746);
        _2718 = _2760;
    }
    float _2762 = _2718;
    if (!_2634)
    {
        _2728 = _2628;
    }
    float _2764 = _2728;
    float _2766 = _2764;
    if (_2634)
    {
        float _2768 = _2754 * _2754;
        _2766 = _2768;
    }
    float _2770 = _2766;
    float _2772 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2774 = fma(_2762, _2762, _2758);
    float _2776 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2778 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2772);
    float _2780 = _2774 + _2770;
    float _2782 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2786 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2784);
    float _2788 = precise::clamp(_2786, 0.0, 1.0);
    float _2790 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2778);
    float _2792 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2794 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2782);
    float _2796 = rsqrt(_2780);
    float _2798 = -_2788;
    float _2800 = _2798 + 1.0;
    float _2802 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2792);
    float _2804 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2794);
    float _2806 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2808 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2802);
    float _2810 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2812 = abs(_2800);
    float _2814 = log2(_2812);
    float _2816 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2818 = _2808 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2820 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2822 = -_2816;
    float _2824 = fma(_2822, _2776, 1.0);
    float _2826 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2684);
    float _2828 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2820);
    float _2830 = _2796 * _2738;
    float _2832 = _2796 * _2762;
    float _2834 = _2796 * _2754;
    float _2836 = _2826 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2838 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2840 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2828);
    float _2842 = log2(_2824);
    float _2844 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2846 = -_2838;
    float _2848 = fma(_2832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2846);
    float _2850 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2852 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2840);
    float _2854 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2844);
    float _2856 = -_2834;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2848);
    float _2860 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2862 = exp2(_2850);
    float _2864 = _2832 + 1.0;
    float _2866 = fma(_2858, -0.5, 0.5);
    float _2868 = fma(_2858, 0.5, 0.5);
    float _2870 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2860);
    float _2872 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2854);
    float _2874 = 1.0 / _2852;
    float _2876 = fma(_2868, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2878 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2870);
    float _2880 = _2842 * 0.693147182464599609375;
    float _2882 = fma(_2868, _2876, -0.212114393711090087890625);
    float _2884 = _2880 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2886 = sqrt(_2866);
    float _2888 = -_2832;
    float _2890 = fma(_2862, _2864, _2888);
    float _2892 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2878);
    float _2894 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2872);
    float _2896 = fma(_2868, _2882, 1.570728778839111328125);
    float _2898 = fma(_2890, 0.5, 0.5);
    float _2900 = _2892 * _2874;
    float _2902 = _2894 * _2874;
    float _2904 = fma(_2900, 0.5, 0.5);
    float _2906 = fma(_2902, -0.5, 0.5);
    float _2908 = _2886 * 0.636619746685028076171875;
    float3 _7640 = float3(_2904, _2906, _2884);
    float _2910 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).x;
    float3 _7651 = float3(_2904, _2906, _2884);
    float4 _2913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7651, float3(0.0), isnan(_7651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7651, float3(0.0), isnan(_7651)), level(0.0)).xyzw;
    float _2915 = _2913.x;
    float _2917 = _2913.y;
    float _2919 = _2913.z;
    float _2921 = _2913.w;
    float _2923 = -_2896;
    float _2925 = fma(_2908, _2923, 1.0);
    float2 _7673 = float2(_2925, _2898);
    float3 _2929 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7673, float2(0.0), isnan(_7673)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7673, float2(0.0), isnan(_7673)), level(0.0)).xyz;
    float _2931 = _2929.x;
    float _2933 = _2929.y;
    float _2935 = _2929.z;
    float _2937 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2939 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2941 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2943 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2945 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2947 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2949 = -_2360;
    float _2951 = fma(_2949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2937);
    float _2953 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2955 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2939);
    float _2957 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2941);
    float _2959 = -_2360;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2945);
    float _2963 = _355 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2965 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2947);
    float _2967 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2951);
    float _2969 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2953);
    float _2971 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2955);
    float _2975 = -_2360;
    float _2977 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2943);
    float _2979 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2981 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2957);
    float _2983 = fma(_2963, _2963, 1.0);
    float _2985 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2965);
    float _2987 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2989 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    float _2991 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2979);
    float _2993 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2969);
    float _2995 = rsqrt(_2983);
    float _2997 = _329 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2999 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2991);
    float _3001 = _2963 * _2967;
    float _3003 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3005 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2977);
    float _3007 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    float _3009 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2989);
    float _3011 = exp2(_2987);
    out.m_72.x = _2993;
    out.m_72.y = _2973;
    out.m_72.z = _2981;
    float _3013 = fma(_2997, _2993, _3001);
    float _3015 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3003);
    float _3017 = _2963 * _3005;
    float _3019 = _2892 + _2852;
    out.m_74.x = _2594;
    out.m_74.y = _2592;
    out.m_74.z = _2596;
    float _3021 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3015);
    float _3023 = _2963 * _2995;
    float _3025 = fma(_2997, _2973, _3017);
    float _3027 = _3019 * 0.5;
    float _3029 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3021);
    float _3031 = -_3009;
    float _3033 = _3023 * _3031;
    float _3035 = -_2985;
    float _3037 = _3023 * _3035;
    float _3039 = -_2999;
    float _3041 = _3023 * _3039;
    float _3043 = _3029 + _2852;
    float _3045 = -_3011;
    float _3047 = _3045 + 1.0;
    float _3049 = fma(_2995, _3005, _3037);
    float _3051 = _2963 * _3007;
    float _3053 = fma(_2995, _2967, _3033);
    float _3055 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3057 = fma(_2995, _3007, _3041);
    float _3059 = fma(_2997, _2981, _3051);
    float _3061 = _2852 * 0.5;
    float _3063 = _3009 + _3013;
    float _3065 = -_3055;
    float _3067 = _3065 + 1.0;
    float _3069 = fma(_2894, -0.5, _3061);
    float _3071 = _3043 * 0.5;
    float _3073 = _2985 + _3025;
    float _3075 = _2999 + _3059;
    out.m_76.x = _3053;
    out.m_76.y = _3049;
    out.m_76.z = _3057;
    bool _3077 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3079 = isnan(_2618);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3085 = _3081 || _3083;
    out.m_78.x = _3027;
    out.m_78.y = _3069;
    out.m_78.z = _3071;
    out.m_78.w = _2852;
    out.m_80.x = _3063;
    out.m_80.y = _3073;
    out.m_80.z = _3075;
    out.gl_Position.x = _2892;
    out.gl_Position.y = _2894;
    out.gl_Position.z = _3029;
    out.gl_Position.w = _2852;
    float _3087 = _2852;
    float _3089 = _3029;
    float _3091 = _2894;
    float _3093 = _2892;
    float _3095 = _3067;
    if (!_3085)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3097 = _3087;
    float _3099 = _3097;
    float _3101 = _3097;
    if (!_3085)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3103 = _3089;
    float _3105 = _3103;
    float _3107 = _3103;
    if (!_3085)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3109 = _3091;
    float _3111 = _3109;
    float _3113 = _3109;
    if (!_3085)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3115 = _3093;
    float _3117 = _3055 * _2910;
    float _3119 = _2921 * _3067;
    float _3121 = _3115;
    float _3123 = _3115;
    if (!_3085)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3125 = _3095;
    float _3127 = _2921 * _3117;
    float _3129 = _2935 * _3117;
    float _3131 = fma(_2931, _3127, _2915);
    float _3133 = fma(_2933, _3127, _2917);
    float _3135 = _3127;
    float _3137 = _3125;
    float _3139 = _3125;
    if (!_3085)
    {
        _3135 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3141 = _3135;
    float _3143 = fma(_2921, _3129, _2919);
    out.m_82.x = _3131;
    out.m_82.y = _3133;
    out.m_82.z = _3143;
    out.m_82.w = _3119;
    bool _3145 = !_3085;
    float _3147 = _3141;
    float _3149 = _3141;
    if (!_3145)
    {
        bool _3151 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3153 = isnan(_2618);
        bool _3155 = _3151 || _3153;
        bool _3157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3159 = _3155 || _3157;
        if (!_3159)
        {
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3163 = _2618 + _3161;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3165;
            float _3169 = 1.0 / _3167;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3191 = _3163 * _3169;
            float _3193 = precise::clamp(_3191, 0.0, 1.0);
            float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3199 = fma(_3193, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3201 = fma(_3193, _3197, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3203 = fma(_3193, _3177, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3205 = fma(_3193, _3181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3207 = fma(_3193, _3185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3209 = fma(_3193, _3189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3101 = _3201;
            _3123 = _3207;
            _3139 = _3199;
            _3113 = _3205;
            _3107 = _3203;
            _3149 = _3209;
            _3211 = true;
        }
        else
        {
            bool _3213 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3215 = isnan(_2618);
            bool _3217 = _3213 || _3215;
            bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3221 = _3217 || _3219;
            if (!_3221)
            {
                _3137 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3223 = _3137;
            _3139 = _3223;
            if (!_3221)
            {
                _3099 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3225 = _3099;
            _3101 = _3225;
            if (!_3221)
            {
                _3105 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3227 = _3105;
            _3107 = _3227;
            if (!_3221)
            {
                _3111 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3229 = _3111;
            _3113 = _3229;
            if (!_3221)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3231 = _3121;
            _3123 = _3231;
            if (!_3221)
            {
                _3147 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3233 = _3147;
            bool _3235 = !_3221;
            _3149 = _3233;
            if (!_3235)
            {
                bool _3237 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3239 = isnan(_2618);
                bool _3241 = _3237 || _3239;
                bool _3243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3245 = _3241 || _3243;
                if (!_3245)
                {
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3249 = _2618 + _3247;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3251;
                    float _3255 = 1.0 / _3253;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3277 = _3249 * _3255;
                    float _3279 = precise::clamp(_3277, 0.0, 1.0);
                    float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3283 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3285 = fma(_3279, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3287 = fma(_3279, _3283, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3289 = fma(_3279, _3263, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3291 = fma(_3279, _3267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3293 = fma(_3279, _3271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3295 = fma(_3279, _3275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3101 = _3287;
                    _3123 = _3293;
                    _3139 = _3285;
                    _3113 = _3291;
                    _3107 = _3289;
                    _3149 = _3295;
                    _3211 = true;
                }
                else
                {
                    _3101 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3139 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3113 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3107 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3149 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3211 = false;
    float _3297 = _3101;
    float _3299 = _3123;
    float _3301 = _3139;
    float _3303 = _3113;
    float _3305 = _3107;
    float _3307 = _3149;
    float _3309 = fma(_3073, -0.5, 0.5);
    float _3311 = precise::clamp(_3309, 0.0, 1.0);
    float _3313 = -_3297;
    float _3315 = _3313 + _3299;
    float _3317 = -_3301;
    float _3319 = _3317 + _3303;
    float _3321 = -_3305;
    float _3323 = _3321 + _3307;
    bool _3325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3327 = fma(_3311, _3315, _3297);
    float _3329 = fma(_3311, _3319, _3301);
    float _3331 = fma(_3311, _3323, _3305);
    float _3333 = _3327 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3335 = fma(_3329, 0.298911988735198974609375, _3333);
    float _3337 = fma(_3331, 0.114477999508380889892578125, _3335);
    out.m_84.x = 0.0;
    float _3339 = -_3337;
    float _3341 = _3329 + _3339;
    float _3343 = -_3337;
    float _3345 = _3327 + _3343;
    float _3347 = -_3337;
    float _3349 = _3331 + _3347;
    float _3351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3353 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3355 = fma(_3345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3357 = fma(_3349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    out.m_86.w = _3351;
    out.m_88.x = _3353;
    out.m_88.y = _3355;
    out.m_88.z = _3357;
    if (!_3325)
    {
        return out;
    }
    float _3359 = -_2592;
    float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3363 = -_2594;
    float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3367 = -_2596;
    float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3371 = _3361 * _3361;
    float _3373 = fma(_3365, _3365, _3371);
    float _3375 = fma(_3369, _3369, _3373);
    float _3377 = sqrt(_3375);
    float _3379 = rsqrt(_3375);
    float _3381 = -_3377;
    float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3385 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3387 = precise::clamp(_3385, 0.0, 1.0);
    float _3389 = _3365 * _3379;
    float _3391 = _3361 * _3379;
    float _3393 = abs(_3387);
    float _3395 = log2(_3393);
    float _3397 = _3369 * _3379;
    float _3399 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3401 = _3073 * _3391;
    float _3403 = -_3391;
    float _3405 = -_3399;
    float _3407 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3405);
    float _3409 = fma(_3063, _3389, _3401);
    float _3411 = -_3397;
    float _3413 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3407);
    float _3415 = fma(_3075, _3397, _3409);
    float _3417 = precise::clamp(_3415, 0.0, 1.0);
    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3421 = _3413 + _3419;
    float _3423 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3425 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3427 = precise::clamp(_3425, 0.0, 1.0);
    float _3429 = exp2(_3423);
    float _3431 = _3429 * _3427;
    float _3433 = _3417 * _3431;
    float _3435 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3437 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3439 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3435;
    out.m_84.y = _3437;
    out.m_84.z = _3439;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3211 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_123);
        out.gl_Position.z = _3496;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
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
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3570 = as_type<float>(_163);
        out.gl_Position.z = _3570;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_64.w;
    float _189 = in.m_49.x;
    float _191 = in.m_49.y;
    float _193 = in.m_49.z;
    float _195 = _165 * _165;
    float _197 = _167 * _167;
    float _199 = _169 * _169;
    float _201 = in.m_44.x;
    float _203 = in.m_44.y;
    float _205 = in.m_44.z;
    float _207 = fma(_173, _173, _195);
    float _209 = fma(_175, _175, _197);
    float _211 = fma(_177, _177, _199);
    float _213 = fma(_179, _179, _207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_183, _183, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _219 > 0.0;
    float _225 = sqrt(_217);
    bool _227 = _221 > 0.0;
    int _229 = as_type<int>(_185) & 1;
    bool _231 = _229 != 0;
    int _233 = as_type<int>(_185) & 2;
    bool _235 = _233 != 0;
    float _237 = _213;
    if (_223)
    {
        float _239 = rsqrt(_213);
        _237 = _239;
    }
    float _241 = _237;
    bool _243 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _247 = _243 || _245;
    bool _249 = isnan(1.0);
    bool _251 = _247 || _249;
    float _253 = 0.0;
    float _255 = 0.0;
    if (!_223)
    {
        _253 = 0.0;
        _255 = 0.0;
    }
    float _257 = _253;
    float _259 = _255;
    bool _261 = _225 > 0.0;
    float _263 = _225;
    float _265 = _257;
    float _267 = _259;
    if (!_223)
    {
        _263 = 0.0;
    }
    float _269 = _263;
    float _271 = _185;
    float _273 = _269;
    if (_227)
    {
        float _275 = rsqrt(_215);
        _271 = _275;
    }
    float _277 = _271;
    float _279 = 0.0;
    if (!_227)
    {
        _279 = 0.0;
    }
    float _281 = _279;
    float _283 = 0.0;
    float _285 = _281;
    if (!_227)
    {
        _283 = 0.0;
    }
    float _287 = _283;
    float _289 = 0.0;
    float _291 = _287;
    if (!_227)
    {
        _289 = 0.0;
    }
    float _293 = _289;
    float _295 = _241;
    float _297 = _293;
    if (_223)
    {
        float _299 = _241 * _173;
        _265 = _299;
    }
    float _301 = _265;
    if (_223)
    {
        float _303 = _241 * _165;
        _273 = _303;
    }
    float _305 = _273;
    float _307 = _305;
    if (_223)
    {
        float _309 = _241 * _179;
        _267 = _309;
    }
    float _311 = _267;
    if (!_251)
    {
        float _313 = _171 * _171;
        float _315 = _313 * 0.5;
        _295 = _315;
    }
    float _317 = _295;
    float _319 = 0.0;
    float _321 = _317;
    if (_261)
    {
        float _323 = rsqrt(_217);
        _319 = _323;
    }
    float _325 = _319;
    bool _327 = !_231;
    float _329 = _327 ? (-0.5) : 0.5;
    float _331 = _277;
    if (_227)
    {
        float _333 = _277 * _175;
        _285 = _333;
    }
    float _335 = _285;
    if (_227)
    {
        float _337 = _277 * _167;
        _291 = _337;
    }
    float _339 = _291;
    if (_227)
    {
        float _341 = _277 * _181;
        _297 = _341;
    }
    float _343 = _297;
    if (!_261)
    {
        _331 = 0.0;
    }
    float _345 = _331;
    float _347 = _345;
    if (!_251)
    {
        float _349 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _349;
    }
    float _351 = _321;
    bool _353 = !_235;
    float _355 = _353 ? (-0.5) : 0.5;
    bool _357 = !_251;
    float _359 = _351;
    float _361 = 0.0;
    if (!_357)
    {
        float _363 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _365 = log2(_363);
        float _367 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _369 = _367 + 1.0;
        float _371 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = _171 * _365;
        float _375 = 1.0 / _369;
        float _377 = _371 * 0.693147182464599609375;
        float _379 = exp2(_373);
        float _381 = 1.0 / _377;
        float _383 = _379 + (-1.0);
        float _385 = -_383;
        float _387 = fma(_385, _381, _171);
        float _389 = _387 * _375;
        float _391 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _359 = _391;
        _361 = _377;
    }
    float _393 = _359;
    float _395 = _361;
    float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = _395;
    float _401 = _393;
    if (_261)
    {
        float _403 = _325 * _169;
        _347 = _403;
    }
    float _405 = _347;
    float _407 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_261)
    {
        _399 = 0.0;
    }
    float _409 = _399;
    float _411 = _397 * _305;
    float _413 = _397 * _339;
    float _415 = _397 * _405;
    float _417 = _409;
    if (_261)
    {
        float _419 = _325 * _177;
        _417 = _419;
    }
    float _421 = _417;
    float _423 = fma(_407, _301, _411);
    float _425 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_261)
    {
        _307 = 0.0;
    }
    float _427 = _307;
    float _429 = _427;
    if (_261)
    {
        float _431 = _325 * _183;
        _429 = _431;
    }
    float _433 = _429;
    float _435 = fma(_407, _335, _413);
    float _437 = fma(_407, _421, _415);
    float _439 = fma(_425, _311, _423);
    if (!_251)
    {
        _401 = _171;
    }
    float _441 = _401;
    bool _443 = !_251;
    float _445 = _441;
    if (!_443)
    {
        float _447 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _449 = log2(_447);
        float _451 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _453 = _451 + 1.0;
        float _455 = 1.0 / _453;
        float _457 = _171 * _449;
        float _459 = exp2(_457);
        float _461 = -_459;
        float _463 = _461 + 1.0;
        float _465 = _463 * _455;
        _445 = _465;
    }
    float _467 = _445;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _471 = fma(_425, _343, _435);
    float _473 = fma(_425, _433, _437);
    float _475 = fma(_467, _189, _439);
    float _477 = fma(_467, _191, _471);
    float _479 = fma(_467, _193, _473);
    float _481 = fma(_475, _187, _201);
    float _483 = fma(_477, _187, _203);
    float _485 = fma(_479, _187, _205);
    bool _487 = !_469;
    float _503;
    if (!_487)
    {
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _491 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_107);
        float _509 = 1.0 / _507;
        float _511 = _143 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _517 = int(_515);
    float _519 = _483 * _181;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _513 + _521;
    float _525 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _527 = int(_525);
    float _529 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _531 = int(_529);
    float _533 = float(_517);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = 1.0 / _533;
    float _545 = float(_527);
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _549 = int(_547);
    float _551 = float(uint(_531));
    bool _553 = _531 == 0;
    int _555 = ~_531;
    int _557 = _555 + 1;
    float _559 = 1.0 / _545;
    float _561 = _543 * _143;
    float _563 = 1.0 / _551;
    float _565 = float(uint(_549));
    int _567 = ~_549;
    int _569 = _567 + 1;
    float _571 = trunc(_561);
    int _573 = int(_571);
    float _575 = _559 * _143;
    float _577 = in.m_51.y;
    float _579 = 1.0 / _565;
    int _581 = as_type<int>(_563) + (-2);
    float _583 = trunc(_575);
    int _585 = int(_583);
    float _587 = float(uint(_573));
    float _589 = as_type<float>(_581) * _587;
    int _591 = as_type<int>(_579) + (-2);
    float _593 = 1.0 / _541;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _597 = _595 != 0;
    float _599 = float(uint(_585));
    float _601 = trunc(_589);
    float _603 = precise::max(_601, 0.0);
    uint _606 = uint(_603);
    float _608 = as_type<float>(_591) * _599;
    int _610 = ~_531;
    int _612 = _610 + 1;
    float _614 = trunc(_608);
    float _616 = precise::max(_614, 0.0);
    uint _618 = uint(_616);
    int _620 = _612 * int(_606);
    int _622 = _620 + _573;
    float _624 = float(uint(_622));
    float _626 = as_type<float>(_622);
    float _628 = _624;
    if (_597)
    {
        _626 = 1.0;
    }
    float _630 = _626;
    int _632 = _569 * int(_618);
    int _634 = _632 + _585;
    float _636 = _630;
    if (!_597)
    {
        _636 = 7.345489978790283203125;
    }
    float _638 = _636;
    float _640 = as_type<float>(_581) * _624;
    if (_597)
    {
        _628 = 1.0;
    }
    float _642 = _628;
    float _644 = float(uint(_634));
    float _646 = trunc(_640);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    float _652 = _638 * _129;
    float _654 = _642;
    float _656 = _644;
    if (!_597)
    {
        _654 = 1.2345600128173828125;
    }
    float _658 = _654;
    float _660 = as_type<float>(_591) * _644;
    if (_597)
    {
        _656 = _129;
    }
    float _662 = _656;
    float _664 = _662;
    if (!_597)
    {
        _664 = _577;
    }
    float _666 = _664;
    float _668 = trunc(_660);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    float _674 = _658 * _666;
    int _676 = ~_531;
    int _678 = _676 + 1;
    int _680 = ~_549;
    int _682 = _680 + 1;
    float _684 = floor(_652);
    int _686 = int(_606) + int(_650);
    float _688 = float(_107);
    float _690 = float(_531);
    int _692 = _678 * _686;
    int _694 = _692 + _573;
    float _696 = floor(_674);
    int _698 = int(_618) + int(_672);
    float _700 = float(_573);
    bool _702 = uint(_694) >= uint(_531);
    float _704 = 1.0 / _688;
    float _706 = -_684;
    float _708 = _652 + _706;
    bool _710 = _700 >= _690;
    bool _712 = isnan(_700);
    bool _714 = _710 || _712;
    bool _716 = isnan(_690);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    int _722 = _682 * _698;
    int _724 = _722 + _585;
    bool _726 = !_702;
    int _728 = _726 ? 0 : (-1);
    float _730 = _708 * _690;
    float _732 = float(_549);
    float _734 = float(_585);
    float _736 = -_696;
    float _738 = _674 + _736;
    int _740 = ~_686;
    int _742 = _740 + _728;
    int _744 = _742 + 1;
    float _746 = trunc(_730);
    int _748 = int(_746);
    bool _750 = _734 >= _732;
    bool _752 = isnan(_734);
    bool _754 = _750 || _752;
    bool _756 = isnan(_732);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    bool _762 = uint(_724) >= uint(_549);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _766 = _764 != 0;
    float _768 = _704 * _143;
    float _770 = trunc(_720);
    int _772 = int(_770);
    bool _774 = !_766;
    int _776 = _774 ? 0 : 1;
    float _778 = _690 * _768;
    int _780 = _531 * _744;
    int _782 = _780 + _573;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _794 = _792 != 0;
    int _796 = abs(_776);
    float _798 = trunc(_760);
    int _800 = int(_798);
    float _802 = _732 * _768;
    bool _804 = !_762;
    int _806 = _804 ? 0 : (-1);
    int _808 = _748 * _796;
    int _810 = _808 + _573;
    bool _812 = !_553;
    int _814 = _812 ? _782 : (-1);
    float _816 = _738 * _732;
    int _818 = ~_698;
    int _820 = _818 + _806;
    int _822 = _820 + 1;
    int _824 = ~_772;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = trunc(_778);
    int _832 = int(_830);
    bool _834 = !_790;
    int _836 = _834 ? 0 : 1;
    int _838 = _549 * _822;
    int _840 = _838 + _585;
    bool _842 = _549 == 0;
    int _844 = _814 * _828;
    int _846 = abs(_836);
    int _848 = ~_800;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = trunc(_816);
    int _856 = int(_854);
    bool _858 = !_842;
    int _860 = _858 ? _840 : (-1);
    int _862 = _531 + (-1);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _866 = _864 != 0;
    int _868 = _860 * _852;
    int _870 = _772 * _862;
    int _872 = _870 + _844;
    bool _874 = !_786;
    int _876 = _874 ? 0 : 1;
    float _878 = trunc(_802);
    int _880 = int(_878);
    bool _882 = !_866;
    int _884 = _882 ? 0 : 1;
    int _886 = _872 * _846;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _890 = _888 != 0;
    int _892 = _549 + (-1);
    int _894 = abs(_876);
    int _896 = abs(_884);
    int _898 = _800 * _892;
    int _900 = _898 + _868;
    bool _902 = !_794;
    int _904 = _902 ? 0 : 1;
    int _906 = _832 * _894;
    int _908 = _906 + _886;
    bool _910 = !_890;
    int _912 = _910 ? 0 : 1;
    int _914 = _856 * _896;
    int _916 = _914 + _585;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    int _934 = abs(_904);
    int _936 = abs(_912);
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    bool _942 = !_920;
    int _944 = _942 ? 0 : 1;
    int _946 = abs(_940);
    int _948 = _810 * _934;
    int _950 = _948 + _908;
    bool _952 = !_928;
    int _954 = _952 ? 0 : 1;
    int _956 = abs(_944);
    int _958 = _748 * _936;
    int _960 = _958 + _950;
    bool _962 = !_932;
    int _964 = _962 ? 0 : 1;
    int _966 = abs(_954);
    int _968 = _900 * _946;
    int _970 = abs(_964);
    float _972 = float(uint(_960));
    int _974 = _880 * _956;
    int _976 = _974 + _968;
    float _978 = as_type<float>(_581) * _972;
    bool _980 = _531 == 0;
    int _982 = _916 * _966;
    int _984 = _982 + _976;
    int _986 = ~_531;
    int _988 = _986 + 1;
    int _990 = ~_549;
    int _992 = _990 + 1;
    int _994 = _856 * _970;
    int _996 = _994 + _984;
    float _998 = trunc(_978);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = ~_531;
    int _1006 = _1004 + 1;
    float _1008 = float(uint(_996));
    float _1010 = as_type<float>(_591) * _1008;
    float _1012 = trunc(_1010);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    int _1018 = _988 * int(_1002);
    int _1020 = _1018 + _960;
    int _1022 = ~_549;
    int _1024 = _1022 + 1;
    float _1026 = float(uint(_1020));
    float _1028 = as_type<float>(_581) * _1026;
    float _1030 = trunc(_1028);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    int _1036 = _1024 * int(_1016);
    int _1038 = _1036 + _996;
    float _1040 = float(uint(_1038));
    float _1042 = as_type<float>(_591) * _1040;
    float _1044 = trunc(_1042);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = int(_1002) + int(_1034);
    int _1052 = _1006 * _1050;
    int _1054 = _1052 + _960;
    int _1056 = ~_549;
    int _1058 = _1056 + 1;
    float _1060 = float(uint(_916));
    bool _1062 = uint(_1054) >= uint(_531);
    bool _1064 = !_1062;
    int _1066 = _1064 ? 0 : (-1);
    int _1068 = int(_1016) + int(_1048);
    float _1070 = as_type<float>(_591) * _1060;
    int _1072 = ~_1050;
    int _1074 = _1072 + _1066;
    int _1076 = _1074 + 1;
    int _1078 = _1058 * _1068;
    int _1080 = _1078 + _996;
    float _1082 = trunc(_1070);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = _531 * _1076;
    int _1090 = _1088 + _960;
    bool _1092 = uint(_1080) >= uint(_549);
    bool _1094 = !_980;
    int _1096 = _1094 ? _1090 : (-1);
    bool _1098 = !_1092;
    int _1100 = _1098 ? 0 : (-1);
    float _1102 = _577 * 2.0;
    int _1104 = _1096 & 3;
    bool _1106 = _1104 != 0;
    int _1108 = ~_1068;
    int _1110 = _1108 + _1100;
    int _1112 = _1110 + 1;
    bool _1114 = uint(_1104) > 1u;
    float _1116 = floor(_1102);
    int _1118 = _1096 & 3;
    bool _1120 = _1118 != 0;
    int _1122 = _549 * _1112;
    int _1124 = _1122 + _996;
    float _1126 = float(uint(_810));
    int _1128 = _1120 ? 0 : 1;
    bool _1130 = !_842;
    int _1132 = _1130 ? _1124 : (-1);
    bool _1134 = uint(_1104) >= 2u;
    int _1136 = _1132 & 3;
    bool _1138 = _1136 != 0;
    int _1140 = ~_1128;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    int _1146 = _1144;
    if (!_1114)
    {
        int _1148 = ~_1128;
        int _1150 = _1148 + 1;
        _1146 = _1150;
    }
    int _1152 = _1146;
    float _1154 = as_type<float>(_581) * _1126;
    int _1156 = _1134 ? 0 : 1;
    bool _1158 = uint(_1136) > 1u;
    float _1160 = trunc(_1154);
    float _1162 = precise::max(_1160, 0.0);
    uint _1164 = uint(_1162);
    int _1166 = _1132 & 3;
    bool _1168 = _1166 != 0;
    int _1170 = ~_1156;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    int _1176 = _1168 ? 0 : 1;
    bool _1178 = _1104 != 3;
    int _1180 = ~_1176;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = in.m_51.z;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1190 = _1188 != 0;
    int _1192 = _1184;
    int _1194 = _1174;
    if (!_1158)
    {
        int _1196 = ~_1176;
        int _1198 = _1196 + 1;
        _1192 = _1198;
    }
    int _1200 = _1192;
    int _1202 = ~_531;
    int _1204 = _1202 + 1;
    bool _1206 = uint(_1136) >= 2u;
    bool _1208 = _577 > 0.5;
    int _1210 = _1204 * int(_1164);
    int _1212 = _1210 + _810;
    if (_1178)
    {
        int _1214 = ~_1156;
        int _1216 = _1214 + 1;
        _1194 = _1216;
    }
    int _1218 = _1194;
    int _1220 = _1206 ? 0 : 1;
    float _1222 = float(uint(_1212));
    bool _1224 = _1136 != 3;
    int _1226 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1228 = _1226 != 0;
    float _1230 = _129 * 2.0;
    float _1232 = as_type<float>(_581) * _1222;
    int _1234 = _992 * int(_1086);
    int _1236 = _1234 + _916;
    int _1238 = ~_1220;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = -_355;
    int _1246 = _1208 ? as_type<int>(_1244) : as_type<int>(_355);
    float _1248 = floor(_1230);
    float _1250 = float(uint(_1236));
    bool _1252 = !_1106;
    int _1254 = _1252 ? 0 : 1;
    int _1256 = _1242;
    int _1258 = _1220;
    if (_1224)
    {
        int _1260 = ~_1220;
        int _1262 = _1260 + 1;
        _1256 = _1262;
    }
    int _1264 = _1256;
    float _1266 = as_type<float>(_591) * _1250;
    bool _1268 = _129 > 0.5;
    float _1270 = trunc(_1232);
    float _1272 = precise::max(_1270, 0.0);
    uint _1274 = uint(_1272);
    float _1276 = as_type<float>(_1274);
    if (_1190)
    {
        _1258 = 0;
    }
    int _1278 = _1258;
    float _1280 = -_329;
    int _1282 = _1268 ? as_type<int>(_1280) : as_type<int>(_329);
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    bool _1288 = !_1228;
    float _1290 = _1288 ? _329 : as_type<float>(_1282);
    float _1292 = trunc(_1266);
    float _1294 = precise::max(_1292, 0.0);
    uint _1296 = uint(_1294);
    bool _1298 = _1248 > 0.0;
    bool _1300 = _1248 >= 0.0;
    bool _1302 = isnan(_1248);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = _1290 + 0.5;
    bool _1312 = !_1286;
    float _1314 = _1312 ? _355 : as_type<float>(_1246);
    bool _1316 = _1186 > 0.5;
    int _1318 = _1278;
    if (!_1190)
    {
        _1318 = 1;
    }
    int _1320 = _1318;
    float _1322 = _1314 + (-0.5);
    int _1324 = _1308 ? 0 : 1;
    float _1326 = -_329;
    int _1328 = _1316 ? as_type<int>(_1326) : as_type<int>(_329);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1332 = _1330 != 0;
    bool _1334 = _1320 != 1;
    float _1336 = _1186 * 2.0;
    int _1338 = ~_549;
    int _1340 = _1338 + 1;
    int _1342 = ~_1324;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    int _1348 = _1346;
    if (!_1298)
    {
        int _1350 = ~_1324;
        int _1352 = _1350 + 1;
        _1348 = _1352;
    }
    int _1354 = _1348;
    bool _1356 = !_1332;
    float _1358 = _1356 ? _329 : as_type<float>(_1328);
    int _1360 = int(_1086) + int(_1296);
    bool _1362 = _1116 > 0.0;
    float _1364 = floor(_1336);
    bool _1366 = _1116 >= 0.0;
    bool _1368 = isnan(_1116);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(0.0);
    bool _1374 = _1370 || _1372;
    int _1376 = int(_1164) + int(_1274);
    int _1378 = _1374 ? 0 : 1;
    int _1380 = _1340 * _1360;
    int _1382 = _1380 + _916;
    float _1384 = 0.0;
    if (!_1334)
    {
        _1384 = _577;
    }
    float _1386 = _1384;
    int _1388 = _557 * _1376;
    int _1390 = _1388 + _810;
    float _1392 = 0.0;
    float _1394 = _1386;
    if (!_1334)
    {
        _1392 = _577;
    }
    float _1396 = _1392;
    float _1398 = 0.0;
    float _1400 = _1396;
    if (!_1334)
    {
        _1398 = _1186;
    }
    float _1402 = _1398;
    float _1404 = _1402;
    if (!_1334)
    {
        _1276 = _1186;
    }
    float _1406 = _1276;
    float _1408 = _1406;
    if (_1334)
    {
        _1394 = _129;
    }
    float _1410 = _1394;
    if (_1334)
    {
        _1400 = _129;
    }
    float _1412 = _1400;
    if (_1334)
    {
        _1404 = _577;
    }
    float _1414 = _1404;
    if (_1334)
    {
        _1408 = _577;
    }
    float _1416 = _1408;
    bool _1418 = uint(_1382) >= uint(_549);
    float _1420 = _483 * _167;
    bool _1422 = uint(_1390) >= uint(_531);
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    int _1426 = ~_1378;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = in.m_51.w;
    int _1434 = _1430;
    if (!_1362)
    {
        int _1436 = ~_1378;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    bool _1442 = !_1418;
    int _1444 = _1442 ? 0 : (-1);
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1456 = _1454 != 0;
    float _1458 = _483 * _175;
    bool _1460 = _1364 > 0.0;
    bool _1462 = !_1422;
    int _1464 = _1462 ? 0 : (-1);
    float _1466 = fma(_481, _173, _1458);
    bool _1468 = _1364 >= 0.0;
    bool _1470 = isnan(_1364);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.0);
    bool _1476 = _1472 || _1474;
    float _1478 = fma(_481, _165, _1420);
    float _1480 = fma(_481, _179, _519);
    int _1482 = _1476 ? 0 : 1;
    float _1484 = fma(_485, _183, _1480);
    bool _1486 = !_1448;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1490;
    int _1494 = ~_1482;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1502 = _1498;
    if (!_1460)
    {
        int _1504 = ~_1482;
        int _1506 = _1504 + 1;
        _1502 = _1506;
    }
    int _1508 = _1502;
    float _1510 = fma(_485, _177, _1466);
    float _1512 = fma(_485, _169, _1478);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1518 = 1.0 / _1492;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1522 = _1520 != 0;
    float _1524 = in.m_55.w;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1528 = _1526 != 0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1530;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1536 = _1534 != 0;
    float _1538 = in.m_57.w;
    float _1540 = 1.0 / _1516;
    float _1542 = in.m_59.w;
    bool _1544 = _1432 > 0.5;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1548 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1554 = _513 + _1552;
    float _1556 = 1.0 / _1532;
    float _1558 = -_1546;
    float _1560 = fma(_1500, 2.0, _1558);
    float _1562 = fma(_1548, -2.0, _1550);
    float _1564 = _129 + _577;
    float _1566 = _129 + _1186;
    float _1568 = _1554 * _1518;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1572 = _513 + _1570;
    float _1574 = _1564 + (-1.0);
    float _1576 = _523 * _1540;
    float _1578 = _1186 + _577;
    float _1580 = _1566 + (-1.0);
    float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1584 = _1578 + (-1.0);
    float _1586 = _1512 + _1524;
    bool _1588 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1590 = isnan(_513);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = _1572 * _1556;
    float _1602 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1604 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1606 = isnan(_513);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1484 + _1542;
    float _1618 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1620;
    bool _1624 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1626 = isnan(_513);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = -_1614;
    float _1638 = _1636 + 1.0;
    float _1640 = _1510 + _1538;
    float _1642 = fma(_1622, _1568, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1644;
    bool _1648 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1650 = isnan(_513);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -_1598;
    float _1662 = _1660 + 1.0;
    float _1664 = _1634 * _1638;
    float _1666 = -_1634;
    float _1668 = _1666 + 1.0;
    float _1670 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1562);
    float _1672 = fma(_1646, _1568, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1674 = _1614 * _1662;
    float _1676 = _1658 * _1668;
    float _1678 = -_143;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1560);
    float _1682 = -_1322;
    float _1684 = -_1670;
    float _1686 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1684);
    float _1688 = _1642 * _1676;
    float _1690 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1680);
    float _1692 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1694 = !_1456;
    int _1696 = _1694 ? 0 : 1;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1700 = !_1452;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = _1672 * _1676;
    int _1706 = abs(_1696);
    float _1708 = -_1698;
    float _1710 = fma(_1692, 2.0, _1708);
    int _1712 = abs(_1702);
    float _1714 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1716 = log2(_1714);
    int _1718 = abs(_1488);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1728 = -_1658;
    float _1730 = _1728 + 1.0;
    float _1732 = float(_1354);
    float _1734 = fma(_1722, _1576, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1736 = float(_1440);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1740 = float(_1712);
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1688);
    float _1744 = float(_1706);
    float _1746 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1738);
    int _1748 = _1096 >> 31;
    float _1750 = _1740 * _1732;
    int _1752 = _1132 >> 31;
    float _1754 = _1716 * _143;
    int _1756 = _1748 & 3;
    float _1758 = fma(_1726, _1576, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1760 = _1752 & 3;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1764 = _1586 + _1762;
    int _1766 = _1096 + _1756;
    float _1768 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1704);
    int _1770 = _1132 + _1760;
    float _1772 = exp2(_1754);
    int _1774 = _1766 >> 2;
    float _1776 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1778 = _1770 >> 2;
    float _1780 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1782 = _1774 << 4;
    int _1784 = _1782 + 368;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1640 + _1786;
    int _1790 = _1778 << 4;
    int _1792 = _1790 + 512;
    float _1794 = fma(_1776, -2.0, _537);
    uint _1796 = uint(int(uint(_1784) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = int(_1796) + 1;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    int _1808 = _1804 & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    float _1812 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1780);
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1816 = _1616 + _1814;
    float _1818 = -_355;
    int _1820 = _1544 ? as_type<int>(_1818) : as_type<int>(_355);
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1824 = -_1772;
    float _1826 = _1824 + 1.0;
    uint _1828 = uint(int(uint(_1792) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1846 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1854 = _1850 || _1852;
    float _1856 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1812);
    bool _1858 = !_1536;
    float _1860 = _1858 ? _355 : as_type<float>(_1820);
    float _1862 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1844);
    float _1864 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1822);
    float _1866 = _1854 ? _1826 : 0.0;
    int _1868 = _1784 + 8;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    float _1886 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1862);
    int _1888 = ~_1360;
    int _1890 = _1888 + _1444;
    int _1892 = _1890 + 1;
    float _1894 = _1744 * _1736;
    int _1896 = ~_1376;
    int _1898 = _1896 + _1464;
    int _1900 = _1898 + 1;
    float _1902 = -_143;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1710);
    int _1906 = abs(_1152);
    int _1908 = _549 * _1892;
    int _1910 = _1908 + _916;
    int _1912 = _1792 + 8;
    uint _1914 = uint(int(uint(_1912) >> uint(2)));
    uint _1916 = uint(int(uint(int(_1914)) >> uint(2)));
    int _1918 = int(_1914) & 3;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[int(_1916)][_1918];
    int _1922 = int(_1914) + 1;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    int _1926 = _1922 & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = abs(_1254);
    int _1932 = _531 * _1900;
    int _1934 = _1932 + _810;
    float _1936 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1864);
    bool _1938 = !_1138;
    int _1940 = _1938 ? 0 : 1;
    float _1942 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1746);
    bool _1944 = _1104 != 3;
    float _1946 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1424);
    int _1948 = abs(_1200);
    float _1950 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1794);
    int _1952 = ~_1906;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    float _1958 = -_1936;
    float _1960 = _1958 + 1.0;
    int _1962 = abs(_1940);
    int _1964 = ~_1948;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = abs(_1218);
    int _1972 = abs(_1264);
    bool _1974 = !_1944;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = _1136 != 3;
    int _1980 = _1956 * as_type<int>(_1810);
    int _1982 = ~_1930;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = ~_1962;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    float _1994 = float(_1718);
    int _1996 = _1986 * as_type<int>(_1802);
    int _1998 = _1996 + _1980;
    int _2000 = ~_1970;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = _1968 * as_type<int>(_1842);
    bool _2008 = !_1522;
    int _2010 = _2008 ? 0 : 1;
    float _2012 = float(_1508);
    int _2014 = _1992 * as_type<int>(_1834);
    int _2016 = _2014 + _2006;
    bool _2018 = !_1978;
    int _2020 = _2018 ? 0 : (-1);
    int _2022 = _2004 * as_type<int>(_1876);
    int _2024 = _2022 + _1998;
    int _2026 = ~_1972;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = _1994 * _2012;
    int _2034 = abs(_2010);
    float _2036 = in.m_66.x;
    float _2038 = in.m_66.y;
    float _2040 = in.m_66.z;
    int _2042 = abs(_2020);
    float _2044 = _2032 * (-2.0);
    int _2046 = abs(_1976);
    int _2048 = _2030 * as_type<int>(_1920);
    int _2050 = _2048 + _2016;
    float _2052 = _1764 * _1764;
    float _2054 = fma(_1582, _2044, _1582);
    bool _2056 = !_1528;
    int _2058 = _2056 ? 0 : 1;
    int _2060 = ~_2042;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    int _2066 = abs(_2058);
    float _2068 = fma(_1788, _1788, _2052);
    bool _2070 = _1856 >= 0.0;
    int _2072 = _2064 * as_type<int>(_1928);
    int _2074 = _2072 + _2050;
    float _2076 = fma(_1816, _1816, _2068);
    bool _2078 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2080 = isnan(1.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2086 = _2082 || _2084;
    float _2088 = _1358 + 0.5;
    int _2090 = ~_2046;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    bool _2096 = _531 == 0;
    float _2098 = fma(_2044, _2036, _2036);
    float _2100 = rsqrt(_2076);
    int _2102 = ~_2034;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2094 * as_type<int>(_1884);
    int _2110 = _2108 + _2024;
    int _2112 = ~_2066;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    float _2118 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1904);
    bool _2120 = _549 == 0;
    int _2122 = _2110 * _2106;
    float _2124 = _2068;
    if (_2070)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2124;
    int _2128 = as_type<int>(_2126);
    if (_2086)
    {
        float _2130 = _1866 * _593;
        _145 = _2130;
    }
    float _2132 = _145;
    bool _2134 = !_2096;
    int _2136 = _2134 ? _1934 : (-1);
    int _2138 = _2074 * _2116;
    bool _2140 = !_2120;
    int _2142 = _2140 ? _1910 : (-1);
    float _2144 = _1860 + (-0.5);
    if (_2070)
    {
        float _2146 = _2126 * 5.0;
        _2128 = as_type<int>(_2146);
    }
    int _2148 = _2128;
    int _2150 = _2136 * _2034;
    int _2152 = _2150 + _2122;
    float _2154 = _129 + (-0.5);
    int _2156 = _2142 * _2066;
    int _2158 = _2156 + _2138;
    float _2160 = -_2144;
    float _2162 = -_1950;
    float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2162);
    float _2166 = -_1886;
    float _2168 = _2166 + 1.0;
    float _2170 = -_1942;
    float _2172 = _2170 + 1.0;
    float _2174 = -_1946;
    float _2176 = _2174 + 1.0;
    if (_2070)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6402 = as_type<float>(_2148);
        out.gl_Position.z = _6402;
    }
    float _2178 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2098);
    float _2180 = -_1960;
    float _2182 = fma(_1290, _2180, _1690);
    float _2184 = fma(_1314, _2168, _1686);
    float _2186 = -_2172;
    float _2188 = fma(_1358, _2186, _2118);
    float _2190 = fma(_1860, _2176, _2164);
    float _2192 = fma(_2054, _2132, _2178);
    float _2194 = _1788 * _2100;
    if (_2070)
    {
        out.m_47.x = 0.0;
    }
    float _2196 = -_2194;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2200 = _1764 * _2100;
    float _2202 = float(_2152);
    out.m_68.x = _2182;
    out.m_68.y = _2184;
    out.m_68.z = _2188;
    out.m_68.w = _2190;
    float _2204 = float(_2158);
    float _2206 = -_2200;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    out.m_70.x = _2202;
    out.m_70.y = _2204;
    float _2210 = _2208 * _2208;
    if (_2070)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2212 = -_2200;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1586);
    float _2216 = _1816 * _2100;
    float _2218 = -_2194;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1640);
    float _2222 = _1750 * (-2.0);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2226 = _2214 + _2224;
    float _2228 = -_2216;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2234 = _2220 + _2232;
    float _2236 = _577 + (-0.5);
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2230 + _2240;
    float _2244 = fma(_2222, _2038, _2038);
    float _2246 = fma(_1602, _2222, _1602);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2238);
    float _2250 = fma(_2198, _2198, _2210);
    float _2252 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2244);
    float _2254 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2248);
    float _2256 = -_2216;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1816);
    float _2260 = _1894 * (-2.0);
    float _2262 = fma(_2246, _2132, _2252);
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2264;
    bool _2268 = _2254 >= 0.0;
    float _2270 = fma(_2258, _2258, _2250);
    float _2272 = in.m_64.x;
    float _2274 = in.m_64.y;
    float _2276 = _2192 * 0.15915493667125701904296875;
    float _2278 = fma(_2260, _2040, _2040);
    float _2280 = _1186 + (-0.5);
    float _2282 = fma(_1758, _1664, _1768);
    float _2284 = fma(_2266, _1600, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2286 = _2262 * 0.15915493667125701904296875;
    float _2288 = fma(_1618, _2260, _1618);
    float _2290 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2278);
    float _2292 = _2276 * 6.283185482025146484375;
    float _2294 = sin(_2292);
    float _2296 = fma(_2284, _1674, _2282);
    float _2298 = _2278;
    float _2300 = _2220;
    if (_2268)
    {
        _2298 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _2298;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2304;
    float _2308 = fma(_2288, _2132, _2290);
    float _2310 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2296);
    int _2312 = as_type<int>(_2302);
    if (_2268)
    {
        out.m_47.x = 0.0;
    }
    float _2314 = _2276 * 6.283185482025146484375;
    float _2316 = cos(_2314);
    if (_2268)
    {
        float _2318 = _2302 * 5.0;
        _2312 = as_type<int>(_2318);
    }
    int _2320 = _2312;
    float _2322 = fma(_2306, _1600, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2324 = fma(_1734, _1664, _1742);
    float _2326 = _2308 * 0.15915493667125701904296875;
    if (_2268)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6685 = as_type<float>(_2320);
        out.gl_Position.z = _6685;
    }
    float _2328 = _2310 * _2274;
    float _2330 = sqrt(_2270);
    float _2332 = _2286 * 6.283185482025146484375;
    float _2334 = sin(_2332);
    float _2336 = _2286 * 6.283185482025146484375;
    float _2338 = cos(_2336);
    if (_2268)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2340 = _2326 * 6.283185482025146484375;
    float _2342 = cos(_2340);
    float _2344 = fma(_2322, _1674, _2324);
    float _2346 = _2100 * _2330;
    float _2348 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _355);
    float _2352 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2344);
    float _2354 = _2294 * _2334;
    float _2356 = _2346 * _2348;
    float _2358 = _2326 * 6.283185482025146484375;
    float _2360 = sin(_2358);
    float _2362 = _2352 * _2272;
    float _2364 = _2316 * _2334;
    float _2366 = _2350 * _2356;
    float _2368 = _2316 * _2338;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _329);
    float _2374 = _2294 * _2338;
    float _2376 = _2316 * _2342;
    float _2378 = _2346 * _2370;
    float _2380 = _2338 * _2342;
    float _2382 = _2294 * _2342;
    float _2384 = _2376 * _2366;
    float _2386 = _2372 * _2378;
    float _2388 = _2334 * _2342;
    float _2390 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2392 = _2390 * 0.5;
    float _2394 = fma(_2360, _2368, _2354);
    float _2396 = -_2374;
    float _2398 = fma(_2360, _2364, _2396);
    float _2400 = -_2366;
    float _2402 = _2360 * _2400;
    float _2404 = -_2364;
    float _2406 = fma(_2360, _2374, _2404);
    float _2408 = fma(_2394, _2386, _2384);
    float _2410 = _2382 * _2366;
    float _2412 = fma(_2380, _2386, _2402);
    float _2414 = fma(_2360, _2354, _2368);
    float _2416 = fma(_2398, _2392, _2408);
    float _2418 = fma(_2406, _2386, _2410);
    float _2420 = fma(_2388, _2392, _2412);
    float _2422 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2424 = fma(_2414, _2392, _2418);
    float _2426 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2428 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2430 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2422);
    bool _2432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2440 = _2436 || _2438;
    float _2442 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2426);
    float _2444 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2428);
    float _2446 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2430);
    float _2448 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2442);
    float _2450 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2452 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2454 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2456 = _1616 + _2452;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2460 = _1640 + _2454;
    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2464 = _2456 + _2462;
    float _2466 = _1586 + _2458;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2470 = _2460 + _2468;
    float _2472 = _2464 * _2464;
    float _2474 = fma(_2470, _2470, _2472);
    float _2476 = sqrt(_2474);
    bool _2478 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2480 = _2420;
    float _2482 = _2424;
    float _2484 = _2460;
    if (!_2478)
    {
        _2480 = _2456;
    }
    float _2486 = _2480;
    float _2488 = _2486;
    if (!_2478)
    {
        _2482 = _2466;
    }
    float _2490 = _2482;
    bool _2492 = !_2478;
    float _2494 = _2490;
    if (!_2492)
    {
        float _2496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2500 = _2476 + _2498;
        float _2502 = rsqrt(_2474);
        float _2504 = _2500 * _2496;
        float _2506 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2508 = _2504 * 0.15915493667125701904296875;
        float _2510 = _2508 * 6.283185482025146484375;
        float _2512 = cos(_2510);
        float _2514 = _2508 * 6.283185482025146484375;
        float _2516 = sin(_2514);
        float _2518 = _2512 + (-1.0);
        float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2522 = fma(_2516, _2506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2524 = fma(_2466, _2512, _2520);
        float _2526 = _2502 * _2522;
        float _2528 = fma(_2470, _2526, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2530 = fma(_2464, _2526, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2484 = _2528;
        _2494 = _2524;
        _2488 = _2530;
    }
    float _2532 = _2484;
    float _2534 = _2494;
    float _2536 = _2488;
    float _2538 = -_2194;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2532);
    float _2542 = -_2200;
    float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2534);
    float _2546 = -_2216;
    float _2548 = fma(_2546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2536);
    float _2550 = _2544;
    float _2552 = _2540;
    float _2554 = _2548;
    if (!_2440)
    {
        float _2556 = _2226 * _2226;
        float _2558 = 1.0 / _2346;
        float _2560 = fma(_2234, _2234, _2556);
        float _2562 = fma(_2242, _2242, _2560);
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2566 = sqrt(_2562);
        float _2568 = precise::min(_2566, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2564;
        float _2572 = -_1640;
        float _2574 = _2572 + _2532;
        float _2576 = _2570 * _2558;
        float _2578 = -_1586;
        float _2580 = _2578 + _2534;
        float _2582 = -_1616;
        float _2584 = _2582 + _2536;
        float _2586 = fma(_2574, _2576, _2220);
        float _2588 = fma(_2580, _2576, _2214);
        float _2590 = fma(_2584, _2576, _2230);
        _2550 = _2588;
        _2552 = _2586;
        _2554 = _2590;
    }
    float _2592 = _2550;
    float _2594 = _2552;
    float _2596 = _2554;
    float _2598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2600 = _2592 + _2598;
    float _2602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2604 = _2594 + _2602;
    float _2606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2608 = _2596 + _2606;
    float _2610 = _2600 * _2600;
    float _2612 = fma(_2604, _2604, _2610);
    float _2614 = fma(_2608, _2608, _2612);
    float _2616 = rsqrt(_2614);
    float _2618 = sqrt(_2614);
    float _2620 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2622 = _2604 * _2620;
    float _2624 = _2608 * _2620;
    float _2626 = _2622 * _2622;
    float _2628 = _2624 * _2624;
    float _2630 = _2626 + _2628;
    float _2632 = sqrt(_2630);
    bool _2634 = _2632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2638 = _2632 + _2636;
    float _2640 = _2616;
    float _2642 = _2638;
    float _2644 = _2600;
    float _2646 = _2620;
    if (_2634)
    {
        float _2648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2640 = _2648;
    }
    float _2650 = _2640;
    float _2652 = _2650;
    if (_2634)
    {
        float _2654 = _2638 * _2650;
        _2642 = _2654;
    }
    float _2656 = _2642;
    if (_2634)
    {
        float _2658 = rsqrt(_2630);
        _2652 = _2658;
    }
    float _2660 = _2652;
    float _2662 = _2660;
    if (_2634)
    {
        float _2664 = _2656 * 0.15915493667125701904296875;
        _2300 = _2664;
    }
    float _2666 = _2300;
    float _2668 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2670 = _2608;
    float _2672 = _2666;
    if (_2634)
    {
        float _2674 = _2666 * 6.283185482025146484375;
        float _2676 = sin(_2674);
        _2670 = _2676;
    }
    float _2678 = _2670;
    float _2680 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2682 = precise::max(0.0, _2668);
    float _2684 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2680);
    float _2686 = _2214;
    float _2688 = _2682;
    if (_2634)
    {
        float _2690 = _2666 * 6.283185482025146484375;
        float _2692 = cos(_2690);
        _2686 = _2692;
    }
    float _2694 = _2686;
    float _2696 = -_2620;
    float _2698 = -_2682;
    float _2700 = fma(_2600, _2696, _2698);
    if (_2634)
    {
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2644 = _2702;
    }
    float _2704 = _2644;
    float _2706 = _2678;
    float _2708 = _2704;
    if (_2634)
    {
        float _2710 = fma(_2678, _2704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2706 = _2710;
    }
    float _2712 = _2706;
    float _2714 = _2712;
    if (!_2634)
    {
        _2708 = _2700;
    }
    float _2716 = _2708;
    float _2718 = _2716;
    if (_2634)
    {
        float _2720 = _2660 * _2712;
        _2646 = _2720;
    }
    float _2722 = _2646;
    if (!_2634)
    {
        _2662 = _2622;
    }
    float _2724 = _2662;
    float _2726 = _2724;
    float _2728 = _2694;
    if (_2634)
    {
        float _2730 = _2694 + (-1.0);
        _2688 = _2730;
    }
    float _2732 = _2688;
    float _2734 = _2732;
    if (_2634)
    {
        float _2736 = _2622 * _2722;
        _2726 = _2736;
    }
    float _2738 = _2726;
    if (!_2634)
    {
        _2714 = _2626;
    }
    float _2740 = _2714;
    float _2742 = _2740;
    if (_2634)
    {
        float _2744 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2672 = _2744;
    }
    float _2746 = _2672;
    if (!_2634)
    {
        _2734 = _2624;
    }
    float _2748 = _2734;
    float _2750 = _2748;
    if (_2634)
    {
        float _2752 = _2624 * _2722;
        _2750 = _2752;
    }
    float _2754 = _2750;
    if (_2634)
    {
        float _2756 = _2738 * _2738;
        _2742 = _2756;
    }
    float _2758 = _2742;
    if (_2634)
    {
        float _2760 = fma(_2700, _2694, _2746);
        _2718 = _2760;
    }
    float _2762 = _2718;
    if (!_2634)
    {
        _2728 = _2628;
    }
    float _2764 = _2728;
    float _2766 = _2764;
    if (_2634)
    {
        float _2768 = _2754 * _2754;
        _2766 = _2768;
    }
    float _2770 = _2766;
    float _2772 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2774 = fma(_2762, _2762, _2758);
    float _2776 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2778 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2772);
    float _2780 = _2774 + _2770;
    float _2782 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2786 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2784);
    float _2788 = precise::clamp(_2786, 0.0, 1.0);
    float _2790 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2778);
    float _2792 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2794 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2782);
    float _2796 = rsqrt(_2780);
    float _2798 = -_2788;
    float _2800 = _2798 + 1.0;
    float _2802 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2792);
    float _2804 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2794);
    float _2806 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2808 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2802);
    float _2810 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2812 = abs(_2800);
    float _2814 = log2(_2812);
    float _2816 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2818 = _2808 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2820 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2822 = -_2816;
    float _2824 = fma(_2822, _2776, 1.0);
    float _2826 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2684);
    float _2828 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2820);
    float _2830 = _2796 * _2738;
    float _2832 = _2796 * _2762;
    float _2834 = _2796 * _2754;
    float _2836 = _2826 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2838 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2840 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2828);
    float _2842 = log2(_2824);
    float _2844 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2846 = -_2838;
    float _2848 = fma(_2832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2846);
    float _2850 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2852 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2840);
    float _2854 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2844);
    float _2856 = -_2834;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2848);
    float _2860 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2862 = exp2(_2850);
    float _2864 = _2832 + 1.0;
    float _2866 = fma(_2858, -0.5, 0.5);
    float _2868 = fma(_2858, 0.5, 0.5);
    float _2870 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2860);
    float _2872 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2854);
    float _2874 = 1.0 / _2852;
    float _2876 = fma(_2868, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2878 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2870);
    float _2880 = _2842 * 0.693147182464599609375;
    float _2882 = fma(_2868, _2876, -0.212114393711090087890625);
    float _2884 = _2880 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2886 = sqrt(_2866);
    float _2888 = -_2832;
    float _2890 = fma(_2862, _2864, _2888);
    float _2892 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2878);
    float _2894 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2872);
    float _2896 = fma(_2868, _2882, 1.570728778839111328125);
    float _2898 = fma(_2890, 0.5, 0.5);
    float _2900 = _2892 * _2874;
    float _2902 = _2894 * _2874;
    float _2904 = fma(_2900, 0.5, 0.5);
    float _2906 = fma(_2902, -0.5, 0.5);
    float _2908 = _2886 * 0.636619746685028076171875;
    float3 _7640 = float3(_2904, _2906, _2884);
    float _2910 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).x;
    float3 _7651 = float3(_2904, _2906, _2884);
    float4 _2913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7651, float3(0.0), isnan(_7651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7651, float3(0.0), isnan(_7651)), level(0.0)).xyzw;
    float _2915 = _2913.x;
    float _2917 = _2913.y;
    float _2919 = _2913.z;
    float _2921 = _2913.w;
    float _2923 = -_2896;
    float _2925 = fma(_2908, _2923, 1.0);
    float2 _7673 = float2(_2925, _2898);
    float3 _2929 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7673, float2(0.0), isnan(_7673)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7673, float2(0.0), isnan(_7673)), level(0.0)).xyz;
    float _2931 = _2929.x;
    float _2933 = _2929.y;
    float _2935 = _2929.z;
    float _2937 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2939 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2941 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2943 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2945 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2947 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2949 = -_2360;
    float _2951 = fma(_2949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2937);
    float _2953 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2955 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2939);
    float _2957 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2941);
    float _2959 = -_2360;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2945);
    float _2963 = _355 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2965 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2947);
    float _2967 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2951);
    float _2969 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2953);
    float _2971 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2955);
    float _2975 = -_2360;
    float _2977 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2943);
    float _2979 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2981 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2957);
    float _2983 = fma(_2963, _2963, 1.0);
    float _2985 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2965);
    float _2987 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2989 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    float _2991 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2979);
    float _2993 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2969);
    float _2995 = rsqrt(_2983);
    float _2997 = _329 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2999 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2991);
    float _3001 = _2963 * _2967;
    float _3003 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3005 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2977);
    float _3007 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2961);
    float _3009 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2989);
    float _3011 = exp2(_2987);
    out.m_72.x = _2993;
    out.m_72.y = _2973;
    out.m_72.z = _2981;
    float _3013 = fma(_2997, _2993, _3001);
    float _3015 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3003);
    float _3017 = _2963 * _3005;
    float _3019 = _2892 + _2852;
    out.m_74.x = _2594;
    out.m_74.y = _2592;
    out.m_74.z = _2596;
    float _3021 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3015);
    float _3023 = _2963 * _2995;
    float _3025 = fma(_2997, _2973, _3017);
    float _3027 = _3019 * 0.5;
    float _3029 = fma(_2836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3021);
    float _3031 = -_3009;
    float _3033 = _3023 * _3031;
    float _3035 = -_2985;
    float _3037 = _3023 * _3035;
    float _3039 = -_2999;
    float _3041 = _3023 * _3039;
    float _3043 = _3029 + _2852;
    float _3045 = -_3011;
    float _3047 = _3045 + 1.0;
    float _3049 = fma(_2995, _3005, _3037);
    float _3051 = _2963 * _3007;
    float _3053 = fma(_2995, _2967, _3033);
    float _3055 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3057 = fma(_2995, _3007, _3041);
    float _3059 = fma(_2997, _2981, _3051);
    float _3061 = _2852 * 0.5;
    float _3063 = _3009 + _3013;
    float _3065 = -_3055;
    float _3067 = _3065 + 1.0;
    float _3069 = fma(_2894, -0.5, _3061);
    float _3071 = _3043 * 0.5;
    float _3073 = _2985 + _3025;
    float _3075 = _2999 + _3059;
    out.m_76.x = _3053;
    out.m_76.y = _3049;
    out.m_76.z = _3057;
    bool _3077 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3079 = isnan(_2618);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3085 = _3081 || _3083;
    out.m_78.x = _3027;
    out.m_78.y = _3069;
    out.m_78.z = _3071;
    out.m_78.w = _2852;
    out.m_80.x = _3063;
    out.m_80.y = _3073;
    out.m_80.z = _3075;
    out.gl_Position.x = _2892;
    out.gl_Position.y = _2894;
    out.gl_Position.z = _3029;
    out.gl_Position.w = _2852;
    float _3087 = _2852;
    float _3089 = _3029;
    float _3091 = _2894;
    float _3093 = _2892;
    float _3095 = _3067;
    if (!_3085)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3097 = _3087;
    float _3099 = _3097;
    float _3101 = _3097;
    if (!_3085)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3103 = _3089;
    float _3105 = _3103;
    float _3107 = _3103;
    if (!_3085)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3109 = _3091;
    float _3111 = _3109;
    float _3113 = _3109;
    if (!_3085)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3115 = _3093;
    float _3117 = _3055 * _2910;
    float _3119 = _2921 * _3067;
    float _3121 = _3115;
    float _3123 = _3115;
    if (!_3085)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3125 = _3095;
    float _3127 = _2921 * _3117;
    float _3129 = _2935 * _3117;
    float _3131 = fma(_2931, _3127, _2915);
    float _3133 = fma(_2933, _3127, _2917);
    float _3135 = _3127;
    float _3137 = _3125;
    float _3139 = _3125;
    if (!_3085)
    {
        _3135 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3141 = _3135;
    float _3143 = fma(_2921, _3129, _2919);
    out.m_82.x = _3131;
    out.m_82.y = _3133;
    out.m_82.z = _3143;
    out.m_82.w = _3119;
    bool _3145 = !_3085;
    float _3147 = _3141;
    float _3149 = _3141;
    if (!_3145)
    {
        bool _3151 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3153 = isnan(_2618);
        bool _3155 = _3151 || _3153;
        bool _3157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3159 = _3155 || _3157;
        if (!_3159)
        {
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3163 = _2618 + _3161;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3165;
            float _3169 = 1.0 / _3167;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3191 = _3163 * _3169;
            float _3193 = precise::clamp(_3191, 0.0, 1.0);
            float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3199 = fma(_3193, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3201 = fma(_3193, _3197, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3203 = fma(_3193, _3177, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3205 = fma(_3193, _3181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3207 = fma(_3193, _3185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3209 = fma(_3193, _3189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3101 = _3201;
            _3123 = _3207;
            _3139 = _3199;
            _3113 = _3205;
            _3107 = _3203;
            _3149 = _3209;
            _3211 = true;
        }
        else
        {
            bool _3213 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3215 = isnan(_2618);
            bool _3217 = _3213 || _3215;
            bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3221 = _3217 || _3219;
            if (!_3221)
            {
                _3137 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3223 = _3137;
            _3139 = _3223;
            if (!_3221)
            {
                _3099 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3225 = _3099;
            _3101 = _3225;
            if (!_3221)
            {
                _3105 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3227 = _3105;
            _3107 = _3227;
            if (!_3221)
            {
                _3111 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3229 = _3111;
            _3113 = _3229;
            if (!_3221)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3231 = _3121;
            _3123 = _3231;
            if (!_3221)
            {
                _3147 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3233 = _3147;
            bool _3235 = !_3221;
            _3149 = _3233;
            if (!_3235)
            {
                bool _3237 = _2618 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3239 = isnan(_2618);
                bool _3241 = _3237 || _3239;
                bool _3243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3245 = _3241 || _3243;
                if (!_3245)
                {
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3249 = _2618 + _3247;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3251;
                    float _3255 = 1.0 / _3253;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3277 = _3249 * _3255;
                    float _3279 = precise::clamp(_3277, 0.0, 1.0);
                    float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3283 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3285 = fma(_3279, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3287 = fma(_3279, _3283, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3289 = fma(_3279, _3263, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3291 = fma(_3279, _3267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3293 = fma(_3279, _3271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3295 = fma(_3279, _3275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3101 = _3287;
                    _3123 = _3293;
                    _3139 = _3285;
                    _3113 = _3291;
                    _3107 = _3289;
                    _3149 = _3295;
                    _3211 = true;
                }
                else
                {
                    _3101 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3139 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3113 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3107 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3149 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3211 = false;
    float _3297 = _3101;
    float _3299 = _3123;
    float _3301 = _3139;
    float _3303 = _3113;
    float _3305 = _3107;
    float _3307 = _3149;
    float _3309 = fma(_3073, -0.5, 0.5);
    float _3311 = precise::clamp(_3309, 0.0, 1.0);
    float _3313 = -_3297;
    float _3315 = _3313 + _3299;
    float _3317 = -_3301;
    float _3319 = _3317 + _3303;
    float _3321 = -_3305;
    float _3323 = _3321 + _3307;
    bool _3325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3327 = fma(_3311, _3315, _3297);
    float _3329 = fma(_3311, _3319, _3301);
    float _3331 = fma(_3311, _3323, _3305);
    float _3333 = _3327 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3335 = fma(_3329, 0.298911988735198974609375, _3333);
    float _3337 = fma(_3331, 0.114477999508380889892578125, _3335);
    out.m_84.x = 0.0;
    float _3339 = -_3337;
    float _3341 = _3329 + _3339;
    float _3343 = -_3337;
    float _3345 = _3327 + _3343;
    float _3347 = -_3337;
    float _3349 = _3331 + _3347;
    float _3351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3353 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3355 = fma(_3345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3357 = fma(_3349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    out.m_86.w = _3351;
    out.m_88.x = _3353;
    out.m_88.y = _3355;
    out.m_88.z = _3357;
    if (!_3325)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3359 = -_2592;
    float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3363 = -_2594;
    float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3367 = -_2596;
    float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3371 = _3361 * _3361;
    float _3373 = fma(_3365, _3365, _3371);
    float _3375 = fma(_3369, _3369, _3373);
    float _3377 = sqrt(_3375);
    float _3379 = rsqrt(_3375);
    float _3381 = -_3377;
    float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3385 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3387 = precise::clamp(_3385, 0.0, 1.0);
    float _3389 = _3365 * _3379;
    float _3391 = _3361 * _3379;
    float _3393 = abs(_3387);
    float _3395 = log2(_3393);
    float _3397 = _3369 * _3379;
    float _3399 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3401 = _3073 * _3391;
    float _3403 = -_3391;
    float _3405 = -_3399;
    float _3407 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3405);
    float _3409 = fma(_3063, _3389, _3401);
    float _3411 = -_3397;
    float _3413 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3407);
    float _3415 = fma(_3075, _3397, _3409);
    float _3417 = precise::clamp(_3415, 0.0, 1.0);
    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3421 = _3413 + _3419;
    float _3423 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3425 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3427 = precise::clamp(_3425, 0.0, 1.0);
    float _3429 = exp2(_3423);
    float _3431 = _3429 * _3427;
    float _3433 = _3417 * _3431;
    float _3435 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3437 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3439 = _3433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3435;
    out.m_84.y = _3437;
    out.m_84.z = _3439;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

