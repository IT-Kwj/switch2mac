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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _61 = _55 + _59;
    float2 _1390 = float2(_55, _57);
    float3 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1390, float2(0.0), isnan(_1390)), int2(0), component::x).xzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _75 = _57 + _73;
    float2 _1413 = float2(_61, _75);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1413, float2(0.0), isnan(_1413)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = gl_FragCoord.x;
    float _87 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _89 = _85 / _87;
    float _91 = gl_FragCoord.y;
    float _93 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _95 = _91 / _93;
    float _97 = trunc(_89);
    float _99 = precise::max(_97, 0.0);
    uint _102 = uint(_99);
    float _104 = trunc(_95);
    float _106 = precise::max(_104, 0.0);
    uint _108 = uint(_106);
    uint _110 = uint(int(uint(int(_102)) >> uint(5)));
    int _113 = int(_102) ^ 31;
    int _115 = int(_110) & 1;
    bool _119 = _115 != 0;
    int _121 = int(_110) & 1;
    uint _123 = uint(int(uint(int(_108)) >> uint(5)));
    bool _125 = !_119;
    int _127 = _125 ? int(_102) : _113;
    int _129 = int(_123) & 1;
    bool _131 = _129 != 0;
    bool _133 = !_131;
    uint _135 = uint(_133 ? _127 : int(_108));
    int _137 = int(_108) ^ 31;
    uint _139 = uint(int(uint(int(_135)) >> uint(4)));
    int _141 = int(_135) ^ 15;
    uint _143 = _102;
    if (!_131)
    {
        bool _145 = !_119;
        uint _147 = uint(_145 ? int(_108) : _137);
        _143 = _147;
    }
    uint _149 = _143;
    int _151 = int(_139) & 1;
    bool _153 = _151 != 0;
    uint _155 = uint(int(uint(int(_149)) >> uint(4)));
    int _157 = int(_149) ^ 15;
    int _159 = int(_155) & 1;
    bool _161 = _159 != 0;
    int _163 = int(_155) & 1;
    bool _165 = !_161;
    int _167 = _165 ? int(_149) : _157;
    int _169 = _163 << 1;
    int _171 = _169 + _163;
    uint _173 = _149;
    if (!_153)
    {
        bool _175 = !_161;
        uint _177 = uint(_175 ? int(_135) : _141);
        _173 = _177;
    }
    uint _179 = _173;
    bool _181 = !_153;
    uint _183 = uint(_181 ? _167 : int(_135));
    uint _185 = uint(int(uint(int(_179)) >> uint(3)));
    uint _187 = uint(int(uint(int(_183)) >> uint(3)));
    int _189 = int(_179) ^ 7;
    int _191 = int(_185) & 1;
    bool _193 = _191 != 0;
    int _195 = int(_187) & 1;
    bool _197 = _195 != 0;
    bool _199 = !_193;
    int _201 = _199 ? int(_179) : _189;
    int _203 = int(_185) & 1;
    bool _205 = !_197;
    uint _207 = uint(_205 ? _201 : int(_183));
    int _209 = int(_183) ^ 7;
    uint _211 = uint(int(uint(int(_207)) >> uint(2)));
    int _213 = int(_207) ^ 3;
    uint _215 = _179;
    if (!_197)
    {
        bool _217 = !_193;
        uint _219 = uint(_217 ? int(_183) : _209);
        _215 = _219;
    }
    uint _221 = _215;
    int _223 = int(_211) & 1;
    bool _225 = _223 != 0;
    uint _227 = uint(int(uint(int(_221)) >> uint(2)));
    int _229 = _121 << 1;
    int _231 = _229 + _121;
    int _233 = int(_221) ^ 3;
    int _235 = int(_227) & 1;
    bool _237 = _235 != 0;
    int _239 = _231 ^ _129;
    bool _241 = !_237;
    int _243 = _241 ? int(_221) : _233;
    uint _245 = _221;
    if (!_225)
    {
        bool _247 = !_237;
        uint _249 = uint(_247 ? int(_207) : _213);
        _245 = _249;
    }
    uint _251 = _245;
    int _253 = _203 << 1;
    int _255 = _253 + _203;
    int _257 = _171 ^ _151;
    bool _259 = !_225;
    uint _261 = uint(_259 ? _243 : int(_207));
    uint _263 = uint(int(uint(int(_251)) >> uint(1)));
    int _265 = _255 ^ _195;
    int _267 = int(_227) & 1;
    int _269 = _257 << 8;
    int _271 = int(_263) & 1;
    uint _273 = uint(int(uint(int(_261)) >> uint(1)));
    int _275 = _267 << 1;
    int _277 = _275 + _267;
    int _279 = _271 << 1;
    int _281 = _279 + _271;
    int _283 = int(_273) & 1;
    bool _285 = _283 != 0;
    float _287 = fma(_57, 2.0, -1.0);
    int _289 = _239 << 10;
    int _291 = _265 << 6;
    float _293 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _295 = _287 * _293;
    int _297 = _277 ^ _223;
    int _299 = _281 ^ _283;
    float _301 = fma(_55, 2.0, -1.0);
    int _303 = _289 ^ _269;
    int _305 = _291 ^ _303;
    int _307 = _297 << 4;
    int _309 = _299 << 2;
    float _311 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _313 = _287 * _311;
    int _315 = int(_263) & 1;
    bool _317 = _315 != 0;
    int _319 = _305 ^ _307;
    int _321 = _309 ^ _319;
    float _323 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[5].x, _313);
    int _325 = int(_251) ^ 1;
    int _327 = int(_261) ^ 1;
    bool _329 = !_317;
    int _331 = _329 ? int(_251) : _325;
    int _333 = int(_251);
    bool _335 = _317;
    if (!_285)
    {
        bool _337 = !_317;
        int _339 = _337 ? int(_261) : _327;
        _333 = _339;
    }
    int _341 = _333;
    bool _343 = !_285;
    float _345 = _343 ? as_type<float>(_331) : as_type<float>(_261);
    float _347 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _349 = _287 * _347;
    float _351 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _353 = _287 * _351;
    int _355 = _341 & 1;
    float _357 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[2].x, _349);
    float _359 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[4].x, _353);
    int _361 = _355 << 1;
    int _363 = _361 + _355;
    float _365 = fma(_71, 2.0, -1.0);
    float _367 = -_71;
    float _369 = _69 + _367;
    float _371 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[5].z, _323);
    float _373 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[2].z, _357);
    float _375 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[4].z, _359);
    float _377 = -_71;
    float _379 = _377 + _81;
    float _381 = _371 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _383 = -_71;
    float _385 = _383 + _83;
    float _387 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[3].x, _295);
    float _389 = _369 * _379;
    float _391 = _373 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _393 = 1.0 / _381;
    float _395 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[3].z, _387);
    bool _397 = _389 > 0.0;
    float _399 = -_71;
    float _401 = _67 + _399;
    float _403 = _395 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _405 = _401 * _385;
    bool _407 = _405 > 0.0;
    float _409 = _375 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    int _411 = 1 & as_type<int>(_345);
    int _413 = _363 ^ _411;
    float _415 = _391 * _393;
    float _417 = _409 * _393;
    float _419 = _403 * _393;
    float _421 = as_type<float>(_363);
    float _423 = _393;
    float _425 = as_type<float>(_355);
    float _427 = _345;
    float _429 = _81;
    float _431 = _369;
    float _433 = _69;
    if (!_397)
    {
        _335 = false;
    }
    bool _435 = _335;
    bool _437 = !_397;
    bool _439 = _435;
    if (!_437)
    {
        float _441 = abs(_369);
        float _443 = abs(_379);
        float _445 = precise::min(_441, _443);
        bool _447 = _445 != 1.0;
        bool _449 = isnan(_445);
        bool _451 = _447 || _449;
        bool _453 = isnan(1.0);
        bool _455 = _451 || _453;
        float _457 = -_445;
        float _459 = fma(_457, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _461 = 1.0 / _459;
        float _463 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _465 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[8].w, _463);
        float _467 = _417 * (-0.0199999995529651641845703125);
        float _469 = _455 ? _465 : 1.0;
        float _471 = _469 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _473 = _471 > _467;
        _439 = _473;
        _421 = _467;
        _423 = _445;
        _425 = _471;
        _427 = _461;
    }
    bool _475 = _439;
    float _477 = _421;
    float _479 = _423;
    float _481 = _425;
    float _483 = _427;
    float _485 = _479;
    float _487 = _483;
    float _489 = _481;
    float _491 = _477;
    bool _493 = _475;
    if (_475)
    {
        _485 = 1.0;
    }
    float _495 = _485;
    float _497 = _495;
    if (_475)
    {
        _487 = 0.0;
    }
    float _499 = _487;
    float _501 = _499;
    if (_475)
    {
        _489 = 0.0;
    }
    float _503 = _489;
    float _505 = _503;
    if (_475)
    {
        _491 = 1.0;
    }
    float _507 = _491;
    float _509 = _507;
    if (!_475)
    {
        float _511 = abs(_369);
        float _513 = abs(_379);
        bool _515 = _511 >= _513;
        float _517 = _515 ? (-1.0) : 1.0;
        float _519 = _515 ? _81 : _69;
        float _521 = fma(_517, (*spvDescriptorSet0.fp_c3)._m0[0].z, _55);
        float _523 = fma(_519, 2.0, -1.0);
        float _525 = fma(_521, 2.0, -1.0);
        float _527 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[5].x, _313);
        float _529 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[2].x, _349);
        float _531 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[3].x, _295);
        float _533 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[4].x, _353);
        float _535 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[5].z, _527);
        float _537 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[2].z, _529);
        float _539 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[3].z, _531);
        float _541 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[4].z, _533);
        float _543 = _535 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _545 = _537 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _547 = _539 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _549 = _541 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _551 = 1.0 / _543;
        float _553 = -_415;
        float _555 = fma(_545, _551, _553);
        float _557 = -_419;
        float _559 = fma(_547, _551, _557);
        float _561 = -_417;
        float _563 = fma(_549, _551, _561);
        _493 = _515;
        _509 = _517;
        _497 = _555;
        _505 = _563;
        _501 = _559;
        _429 = _523;
        _431 = _525;
    }
    bool _565 = _493;
    float _567 = _509;
    float _569 = _497;
    float _571 = _505;
    float _573 = _501;
    float _575 = _429;
    float _577 = _431;
    bool _579 = _565;
    float _581 = _575;
    float _583 = _577;
    float _585 = _567;
    if (!_407)
    {
        _579 = false;
    }
    bool _587 = _579;
    bool _589 = !_407;
    bool _591 = _587;
    if (!_589)
    {
        float _593 = abs(_401);
        float _595 = abs(_385);
        float _597 = precise::min(_593, _595);
        float _599 = _417 * (-0.0199999995529651641845703125);
        bool _601 = _597 != 1.0;
        bool _603 = isnan(_597);
        bool _605 = _601 || _603;
        bool _607 = isnan(1.0);
        bool _609 = _605 || _607;
        float _611 = -_597;
        float _613 = fma(_611, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _615 = 1.0 / _613;
        float _617 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _619 = fma(_615, (*spvDescriptorSet0.fp_c3)._m0[8].w, _617);
        float _621 = _609 ? _619 : 1.0;
        float _623 = _621 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _625 = _623 > _599;
        _591 = _625;
        _581 = _597;
        _433 = _615;
        _583 = _623;
    }
    bool _627 = _591;
    float _629 = _581;
    float _631 = _433;
    float _633 = _583;
    float _635 = _633;
    float _637 = _631;
    float _639 = _629;
    if (_627)
    {
        _635 = 0.0;
    }
    float _641 = _635;
    float _643 = _641;
    if (_627)
    {
        _637 = 0.0;
    }
    float _645 = _637;
    float _647 = _645;
    if (_627)
    {
        _639 = 1.0;
    }
    float _649 = _639;
    float _651 = _649;
    if (!_627)
    {
        float _653 = abs(_401);
        float _655 = abs(_385);
        bool _657 = _653 >= _655;
        float _659 = _657 ? (-1.0) : 1.0;
        float _661 = _657 ? _83 : _67;
        float _663 = fma(_659, (*spvDescriptorSet0.fp_c3)._m0[0].w, _57);
        float _665 = _659 * _567;
        float _667 = fma(_661, 2.0, -1.0);
        float _669 = fma(_663, 2.0, -1.0);
        float _671 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _673 = _669 * _671;
        float _675 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _677 = _669 * _675;
        float _679 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _681 = _669 * _679;
        float _683 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[5].x, _673);
        float _685 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[3].x, _677);
        float _687 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[4].x, _681);
        float _689 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[5].z, _683);
        float _691 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[3].z, _685);
        float _693 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[4].z, _687);
        float _695 = _689 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _697 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _699 = _669 * _697;
        float _701 = _693 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _703 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[2].x, _699);
        float _705 = 1.0 / _695;
        float _707 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[2].z, _703);
        float _709 = _691 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _711 = _707 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _713 = -_415;
        float _715 = fma(_711, _705, _713);
        float _717 = -_419;
        float _719 = fma(_709, _705, _717);
        float _721 = -_417;
        float _723 = fma(_701, _705, _721);
        _585 = _665;
        _651 = _723;
        _647 = _719;
        _643 = _715;
    }
    float _725 = _585;
    float _727 = _651;
    float _729 = _647;
    float _731 = _643;
    float _733 = _569 * _725;
    float _735 = 1.0 / _417;
    float _737 = _571 * _725;
    float _739 = _573 * _725;
    float _741 = _733 * _727;
    float _743 = _737 * _729;
    int _745 = _321 ^ _413;
    float _747 = -_741;
    float _749 = fma(_737, _731, _747);
    float _751 = _739 * _731;
    float _753 = -_743;
    float _755 = fma(_739, _727, _753);
    float _757 = float(uint(_745));
    float _759 = _749 * _749;
    float _761 = -_751;
    float _763 = fma(_733, _729, _761);
    float _765 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _767 = fma(_755, _755, _759);
    float _769 = -_735;
    float _771 = _765 * _769;
    float _773 = fma(_763, _763, _767);
    float _775 = fma(_757, 0.61803400516510009765625, 0.5);
    float _777 = precise::min(_771, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _779 = rsqrt(_773);
    bool _781 = _777 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _783 = isnan(_777);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
    bool _789 = _785 || _787;
    float _791 = _755 * _779;
    float _793 = _749 * _779;
    float _795 = _763 * _779;
    float _797 = _767;
    float _799 = _773;
    if (!_789)
    {
        _797 = 0.0;
    }
    float _801 = _797;
    bool _803 = !_789;
    float _805 = _801;
    if (!_803)
    {
        float _807 = _793 * _793;
        float _809 = _419 * _419;
        float _811 = floor(_775);
        bool _813 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
        float _815 = fma(_791, _791, _807);
        float _817 = fma(_415, _415, _809);
        bool _819 = _815 >= 0.00999999977648258209228515625;
        bool _821 = isnan(_815);
        bool _823 = _819 || _821;
        bool _825 = isnan(0.00999999977648258209228515625);
        bool _827 = _823 || _825;
        float _829 = fma(_417, _417, _817);
        float _831 = -_793;
        float _833 = _419 * _831;
        float _835 = -_791;
        float _837 = fma(_415, _835, _833);
        float _839 = 1.0 / _829;
        float _841 = -_811;
        float _843 = _775 + _841;
        float _845 = -_795;
        float _847 = fma(_417, _845, _837);
        float _849 = _807;
        if (!_827)
        {
            _799 = 1.0;
        }
        float _851 = _799;
        float _853 = _847 * _847;
        float _855 = _815;
        float _857 = _851;
        if (_827)
        {
            float _859 = rsqrt(_815);
            _855 = _859;
        }
        float _861 = _855;
        if (!_827)
        {
            _849 = 0.0;
        }
        float _863 = _849;
        float _865 = _853 * _839;
        float _867 = _839;
        float _869 = _863;
        if (!_813)
        {
            _867 = 0.0;
        }
        float _871 = _867;
        float _873 = _871;
        if (_827)
        {
            float _875 = -_861;
            float _877 = _791 * _875;
            _857 = _877;
        }
        float _879 = _857;
        if (_827)
        {
            float _881 = _793 * _861;
            _869 = _881;
        }
        float _883 = _869;
        bool _885 = !_813;
        if (!_885)
        {
            float _887 = _843 * 3.1415927410125732421875;
            float _889 = _777 * 1.77777779102325439453125;
            float _891 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
            int _893 = 0;
            float _895 = 0.0;
            bool _897;
            float _1255;
            do
            {
                int _899 = _893;
                float _901 = _895;
                float _903 = float(_899);
                float _905 = _903 + 0.5;
                float _907 = _905 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
                float _909 = _907 * 2.0;
                float _911 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[10].y, _887);
                float _913 = _909 * _909;
                float _915 = _911 * 0.15915493667125701904296875;
                float _917 = _915 * 6.283185482025146484375;
                float _919 = sin(_917);
                float _921 = _915 * 6.283185482025146484375;
                float _923 = cos(_921);
                bool _925 = _919 > 0.0;
                float _927 = -_919;
                float _929 = _925 ? _927 : _919;
                float _931 = -_923;
                float _933 = _925 ? _931 : _923;
                float _935 = _929 * _883;
                float _937 = -_879;
                float _939 = _929 * _937;
                float _941 = -_879;
                float _943 = -_935;
                float _945 = fma(_933, _941, _943);
                float _947 = fma(_933, _883, _939);
                float _949 = _945 * _913;
                float _951 = _947 * _913;
                float _953 = _949 * _879;
                float _955 = -_883;
                float _957 = _949 * _955;
                float _959 = fma(_777, _951, _55);
                float _961 = -_951;
                float _963 = fma(_961, _883, _953);
                float _965 = -_951;
                float _967 = fma(_965, _879, _957);
                float _969 = _963 * _963;
                float _971 = _967 * _967;
                float _973 = fma(_865, _969, _971);
                bool _975 = _973 > _865;
                float _977 = _957;
                float _979 = _967;
                float _981 = _973;
                float _983 = _953;
                if (_975)
                {
                    float _985 = _967 * _879;
                    _977 = _985;
                }
                float _987 = _977;
                if (_975)
                {
                    float _989 = _967 * _883;
                    _979 = _989;
                }
                float _991 = _979;
                if (!_975)
                {
                    float _993 = -_949;
                    float _995 = (-0.0) + _993;
                    _981 = _995;
                }
                float _997 = _981;
                float _999 = _997;
                if (!_975)
                {
                    float _1001 = -_951;
                    float _1003 = (-0.0) + _1001;
                    _983 = _1003;
                }
                float _1005 = _983;
                float _1007 = fma(_949, _889, _57);
                float _1009 = _1005;
                if (_975)
                {
                    float _1011 = -_879;
                    float _1013 = -_991;
                    float _1015 = fma(_963, _1011, _1013);
                    _999 = _1015;
                }
                float _1017 = _999;
                if (_975)
                {
                    float _1019 = -_987;
                    float _1021 = fma(_963, _883, _1019);
                    _1009 = _1021;
                }
                float _1023 = _1009;
                float _1025 = fma(_889, _1017, _57);
                float _1027 = fma(_777, _1023, _55);
                float2 _2826 = float2(_959, _1007);
                float _1029 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2826, float2(0.0), isnan(_2826))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2826, float2(0.0), isnan(_2826))).x;
                float2 _2834 = float2(_1027, _1025);
                float _1031 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2834, float2(0.0), isnan(_2834))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2834, float2(0.0), isnan(_2834))).x;
                float _1033 = fma(_1007, 2.0, -1.0);
                float _1035 = fma(_959, 2.0, -1.0);
                float _1037 = fma(_1025, 2.0, -1.0);
                float _1039 = fma(_1027, 2.0, -1.0);
                float _1041 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _1043 = _1033 * _1041;
                float _1045 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _1047 = _1033 * _1045;
                float _1049 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _1051 = _1033 * _1049;
                float _1053 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _1055 = _1033 * _1053;
                float _1057 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1043);
                float _1059 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1047);
                float _1061 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _1063 = _1037 * _1061;
                float _1065 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _1067 = _1037 * _1065;
                float _1069 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _1071 = _1037 * _1069;
                float _1073 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[3].x, _1051);
                float _1075 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[4].x, _1055);
                float _1077 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1063);
                float _1079 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[3].x, _1067);
                float _1081 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1071);
                int _1083 = _899 + 1;
                bool _1085 = _1083 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                float _1087 = fma(_1029, 2.0, -1.0);
                float _1089 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _1091 = _1037 * _1089;
                float _1093 = fma(_1087, (*spvDescriptorSet0.fp_c3)._m0[5].z, _1057);
                float _1095 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[4].x, _1091);
                float _1097 = fma(_1087, (*spvDescriptorSet0.fp_c3)._m0[3].z, _1073);
                float _1099 = _1093 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _1101 = fma(_1031, 2.0, -1.0);
                float _1103 = fma(_1087, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1059);
                float _1105 = fma(_1087, (*spvDescriptorSet0.fp_c3)._m0[4].z, _1075);
                float _1107 = _1097 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _1109 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[5].z, _1081);
                float _1111 = 1.0 / _1099;
                float _1113 = _1105 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _1115 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[3].z, _1079);
                float _1117 = _1109 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _1119 = _1103 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _1121 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1077);
                float _1123 = _1115 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _1125 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[4].z, _1095);
                float _1127 = 1.0 / _1117;
                float _1129 = _1121 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _1131 = _1125 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _1133 = -_415;
                float _1135 = fma(_1119, _1111, _1133);
                float _1137 = -_419;
                float _1139 = fma(_1107, _1111, _1137);
                float _1141 = -_417;
                float _1143 = fma(_1113, _1111, _1141);
                float _1145 = _1139 * _1139;
                float _1147 = -_1139;
                float _1149 = _793 * _1147;
                float _1151 = -_419;
                float _1153 = fma(_1123, _1127, _1151);
                float _1155 = -_415;
                float _1157 = fma(_1129, _1127, _1155);
                float _1159 = fma(_1135, _1135, _1145);
                float _1161 = -_417;
                float _1163 = fma(_1131, _1127, _1161);
                float _1165 = _1153 * _1153;
                float _1167 = -_791;
                float _1169 = fma(_1167, _1135, _1149);
                float _1171 = fma(_1143, _1143, _1159);
                float _1173 = -_1153;
                float _1175 = _793 * _1173;
                float _1177 = fma(_1157, _1157, _1165);
                float _1179 = -_795;
                float _1181 = fma(_1179, _1143, _1169);
                float _1183 = -_1171;
                float _1185 = fma(_1183, _891, 1.0);
                float _1187 = -_791;
                float _1189 = fma(_1187, _1157, _1175);
                float _1191 = fma(_1163, _1163, _1177);
                float _1193 = _1171 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _1195 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _1197 = _1181 + _1195;
                float _1199 = precise::max(0.0, _1185);
                float _1201 = -_1191;
                float _1203 = fma(_1201, _891, 1.0);
                float _1205 = _1191 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _1207 = -_795;
                float _1209 = fma(_1207, _1163, _1189);
                float _1211 = 1.0 / _1193;
                float _1213 = _1199 * _1199;
                float _1215 = precise::max(0.0, _1203);
                float _1217 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _1219 = _1209 + _1217;
                float _1221 = _1199 * _1213;
                float _1223 = precise::max(_1197, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1225 = _1215 * _1215;
                float _1227 = 1.0 / _1205;
                float _1229 = _1221 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1231 = _1215 * _1225;
                float _1233 = precise::max(_1219, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1235 = _1229 * _1223;
                float _1237 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1239 = _1235 * _1211;
                float _1241 = _1237 * _1233;
                float _1243 = precise::max(_1239, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1245 = _1241 * _1227;
                float _1247 = precise::min(_1243, 1.0);
                float _1249 = precise::max(_1245, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1251 = precise::min(_1249, 1.0);
                float _1253 = _1247 + _1251;
                _1255 = fma(_1253, (*spvDescriptorSet0.fp_c3)._m0[9].y, _901);
                _897 = !_1085;
                _893 = _1083;
                _895 = _1255;
            } while (_897);
            _873 = _1255;
        }
        float _1257 = _873;
        float _1259 = fma(_777, (*spvDescriptorSet0.fp_c3)._m0[0].x, -1.0);
        float _1261 = _1257 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
        float _1263 = fma(_55, 2.0, -1.0);
        float _1265 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].z;
        float _1267 = fma(_57, 2.0, -1.0);
        float _1269 = precise::min(_1259, 1.0);
        float _1271 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].x;
        float _1273 = abs(_1263);
        float _1275 = _1273 + _1265;
        float _1277 = precise::clamp(_1275, 0.0, 1.0);
        float _1279 = _1269 * _1261;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        float _1283 = abs(_1267);
        float _1285 = _1283 + _1271;
        float _1287 = precise::clamp(_1285, 0.0, 1.0);
        float _1289 = _1277 * (*spvDescriptorSet0.fp_c3)._m0[17].w;
        float _1291 = -_1281;
        float _1293 = _1291 + 1.0;
        float _1295 = _1287 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
        float _1297 = -_1289;
        float _1299 = fma(_1297, _1289, 1.0);
        float _1301 = abs(_1293);
        float _1303 = log2(_1301);
        float _1305 = -_1295;
        float _1307 = fma(_1305, _1295, _1299);
        float _1309 = _1303 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
        float _1311 = exp2(_1309);
        float _1313 = -_1311;
        float _1315 = _1313 + 1.0;
        float _1317 = _1315 * _1307;
        float _1319 = precise::clamp(_1317, 0.0, 1.0);
        float _1321 = _1319 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
        _805 = _1321;
    }
    float _1323 = _805;
    float _1325 = -_71;
    float _1327 = fma(_1325, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
    float _1329 = -_1323;
    float _1331 = _1329 + 1.0;
    bool _1333 = _71 != 1.0;
    bool _1335 = isnan(_71);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(1.0);
    bool _1341 = _1337 || _1339;
    float _1343 = 1.0 / _1327;
    float _1345 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _1347 = fma(_1343, (*spvDescriptorSet0.fp_c3)._m0[8].w, _1345);
    int _1349 = _1341 ? as_type<int>(_1347) : 1065353216;
    out.m_32.x = _1331;
    out.m_32.y = as_type<float>(_1349);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _61 = _55 + _59;
    float2 _1390 = float2(_55, _57);
    float3 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1390, float2(0.0), isnan(_1390)), int2(0), component::x).xzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _75 = _57 + _73;
    float2 _1413 = float2(_61, _75);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1413, float2(0.0), isnan(_1413)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = gl_FragCoord.x;
    float _87 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _89 = _85 / _87;
    float _91 = gl_FragCoord.y;
    float _93 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _95 = _91 / _93;
    float _97 = trunc(_89);
    float _99 = precise::max(_97, 0.0);
    uint _102 = uint(_99);
    float _104 = trunc(_95);
    float _106 = precise::max(_104, 0.0);
    uint _108 = uint(_106);
    uint _110 = uint(int(uint(int(_102)) >> uint(5)));
    int _113 = int(_102) ^ 31;
    int _115 = int(_110) & 1;
    bool _119 = _115 != 0;
    int _121 = int(_110) & 1;
    uint _123 = uint(int(uint(int(_108)) >> uint(5)));
    bool _125 = !_119;
    int _127 = _125 ? int(_102) : _113;
    int _129 = int(_123) & 1;
    bool _131 = _129 != 0;
    bool _133 = !_131;
    uint _135 = uint(_133 ? _127 : int(_108));
    int _137 = int(_108) ^ 31;
    uint _139 = uint(int(uint(int(_135)) >> uint(4)));
    int _141 = int(_135) ^ 15;
    uint _143 = _102;
    if (!_131)
    {
        bool _145 = !_119;
        uint _147 = uint(_145 ? int(_108) : _137);
        _143 = _147;
    }
    uint _149 = _143;
    int _151 = int(_139) & 1;
    bool _153 = _151 != 0;
    uint _155 = uint(int(uint(int(_149)) >> uint(4)));
    int _157 = int(_149) ^ 15;
    int _159 = int(_155) & 1;
    bool _161 = _159 != 0;
    int _163 = int(_155) & 1;
    bool _165 = !_161;
    int _167 = _165 ? int(_149) : _157;
    int _169 = _163 << 1;
    int _171 = _169 + _163;
    uint _173 = _149;
    if (!_153)
    {
        bool _175 = !_161;
        uint _177 = uint(_175 ? int(_135) : _141);
        _173 = _177;
    }
    uint _179 = _173;
    bool _181 = !_153;
    uint _183 = uint(_181 ? _167 : int(_135));
    uint _185 = uint(int(uint(int(_179)) >> uint(3)));
    uint _187 = uint(int(uint(int(_183)) >> uint(3)));
    int _189 = int(_179) ^ 7;
    int _191 = int(_185) & 1;
    bool _193 = _191 != 0;
    int _195 = int(_187) & 1;
    bool _197 = _195 != 0;
    bool _199 = !_193;
    int _201 = _199 ? int(_179) : _189;
    int _203 = int(_185) & 1;
    bool _205 = !_197;
    uint _207 = uint(_205 ? _201 : int(_183));
    int _209 = int(_183) ^ 7;
    uint _211 = uint(int(uint(int(_207)) >> uint(2)));
    int _213 = int(_207) ^ 3;
    uint _215 = _179;
    if (!_197)
    {
        bool _217 = !_193;
        uint _219 = uint(_217 ? int(_183) : _209);
        _215 = _219;
    }
    uint _221 = _215;
    int _223 = int(_211) & 1;
    bool _225 = _223 != 0;
    uint _227 = uint(int(uint(int(_221)) >> uint(2)));
    int _229 = _121 << 1;
    int _231 = _229 + _121;
    int _233 = int(_221) ^ 3;
    int _235 = int(_227) & 1;
    bool _237 = _235 != 0;
    int _239 = _231 ^ _129;
    bool _241 = !_237;
    int _243 = _241 ? int(_221) : _233;
    uint _245 = _221;
    if (!_225)
    {
        bool _247 = !_237;
        uint _249 = uint(_247 ? int(_207) : _213);
        _245 = _249;
    }
    uint _251 = _245;
    int _253 = _203 << 1;
    int _255 = _253 + _203;
    int _257 = _171 ^ _151;
    bool _259 = !_225;
    uint _261 = uint(_259 ? _243 : int(_207));
    uint _263 = uint(int(uint(int(_251)) >> uint(1)));
    int _265 = _255 ^ _195;
    int _267 = int(_227) & 1;
    int _269 = _257 << 8;
    int _271 = int(_263) & 1;
    uint _273 = uint(int(uint(int(_261)) >> uint(1)));
    int _275 = _267 << 1;
    int _277 = _275 + _267;
    int _279 = _271 << 1;
    int _281 = _279 + _271;
    int _283 = int(_273) & 1;
    bool _285 = _283 != 0;
    float _287 = fma(_57, 2.0, -1.0);
    int _289 = _239 << 10;
    int _291 = _265 << 6;
    float _293 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _295 = _287 * _293;
    int _297 = _277 ^ _223;
    int _299 = _281 ^ _283;
    float _301 = fma(_55, 2.0, -1.0);
    int _303 = _289 ^ _269;
    int _305 = _291 ^ _303;
    int _307 = _297 << 4;
    int _309 = _299 << 2;
    float _311 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _313 = _287 * _311;
    int _315 = int(_263) & 1;
    bool _317 = _315 != 0;
    int _319 = _305 ^ _307;
    int _321 = _309 ^ _319;
    float _323 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[5].x, _313);
    int _325 = int(_251) ^ 1;
    int _327 = int(_261) ^ 1;
    bool _329 = !_317;
    int _331 = _329 ? int(_251) : _325;
    int _333 = int(_251);
    bool _335 = _317;
    if (!_285)
    {
        bool _337 = !_317;
        int _339 = _337 ? int(_261) : _327;
        _333 = _339;
    }
    int _341 = _333;
    bool _343 = !_285;
    float _345 = _343 ? as_type<float>(_331) : as_type<float>(_261);
    float _347 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _349 = _287 * _347;
    float _351 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _353 = _287 * _351;
    int _355 = _341 & 1;
    float _357 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[2].x, _349);
    float _359 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[4].x, _353);
    int _361 = _355 << 1;
    int _363 = _361 + _355;
    float _365 = fma(_71, 2.0, -1.0);
    float _367 = -_71;
    float _369 = _69 + _367;
    float _371 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[5].z, _323);
    float _373 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[2].z, _357);
    float _375 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[4].z, _359);
    float _377 = -_71;
    float _379 = _377 + _81;
    float _381 = _371 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _383 = -_71;
    float _385 = _383 + _83;
    float _387 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[3].x, _295);
    float _389 = _369 * _379;
    float _391 = _373 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _393 = 1.0 / _381;
    float _395 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[3].z, _387);
    bool _397 = _389 > 0.0;
    float _399 = -_71;
    float _401 = _67 + _399;
    float _403 = _395 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _405 = _401 * _385;
    bool _407 = _405 > 0.0;
    float _409 = _375 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    int _411 = 1 & as_type<int>(_345);
    int _413 = _363 ^ _411;
    float _415 = _391 * _393;
    float _417 = _409 * _393;
    float _419 = _403 * _393;
    float _421 = as_type<float>(_363);
    float _423 = _393;
    float _425 = as_type<float>(_355);
    float _427 = _345;
    float _429 = _81;
    float _431 = _369;
    float _433 = _69;
    if (!_397)
    {
        _335 = false;
    }
    bool _435 = _335;
    bool _437 = !_397;
    bool _439 = _435;
    if (!_437)
    {
        float _441 = abs(_369);
        float _443 = abs(_379);
        float _445 = precise::min(_441, _443);
        bool _447 = _445 != 1.0;
        bool _449 = isnan(_445);
        bool _451 = _447 || _449;
        bool _453 = isnan(1.0);
        bool _455 = _451 || _453;
        float _457 = -_445;
        float _459 = fma(_457, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _461 = 1.0 / _459;
        float _463 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _465 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[8].w, _463);
        float _467 = _417 * (-0.0199999995529651641845703125);
        float _469 = _455 ? _465 : 1.0;
        float _471 = _469 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _473 = _471 > _467;
        _439 = _473;
        _421 = _467;
        _423 = _445;
        _425 = _471;
        _427 = _461;
    }
    bool _475 = _439;
    float _477 = _421;
    float _479 = _423;
    float _481 = _425;
    float _483 = _427;
    float _485 = _479;
    float _487 = _483;
    float _489 = _481;
    float _491 = _477;
    bool _493 = _475;
    if (_475)
    {
        _485 = 1.0;
    }
    float _495 = _485;
    float _497 = _495;
    if (_475)
    {
        _487 = 0.0;
    }
    float _499 = _487;
    float _501 = _499;
    if (_475)
    {
        _489 = 0.0;
    }
    float _503 = _489;
    float _505 = _503;
    if (_475)
    {
        _491 = 1.0;
    }
    float _507 = _491;
    float _509 = _507;
    if (!_475)
    {
        float _511 = abs(_369);
        float _513 = abs(_379);
        bool _515 = _511 >= _513;
        float _517 = _515 ? (-1.0) : 1.0;
        float _519 = _515 ? _81 : _69;
        float _521 = fma(_517, (*spvDescriptorSet0.fp_c3)._m0[0].z, _55);
        float _523 = fma(_519, 2.0, -1.0);
        float _525 = fma(_521, 2.0, -1.0);
        float _527 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[5].x, _313);
        float _529 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[2].x, _349);
        float _531 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[3].x, _295);
        float _533 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[4].x, _353);
        float _535 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[5].z, _527);
        float _537 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[2].z, _529);
        float _539 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[3].z, _531);
        float _541 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[4].z, _533);
        float _543 = _535 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _545 = _537 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _547 = _539 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _549 = _541 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _551 = 1.0 / _543;
        float _553 = -_415;
        float _555 = fma(_545, _551, _553);
        float _557 = -_419;
        float _559 = fma(_547, _551, _557);
        float _561 = -_417;
        float _563 = fma(_549, _551, _561);
        _493 = _515;
        _509 = _517;
        _497 = _555;
        _505 = _563;
        _501 = _559;
        _429 = _523;
        _431 = _525;
    }
    bool _565 = _493;
    float _567 = _509;
    float _569 = _497;
    float _571 = _505;
    float _573 = _501;
    float _575 = _429;
    float _577 = _431;
    bool _579 = _565;
    float _581 = _575;
    float _583 = _577;
    float _585 = _567;
    if (!_407)
    {
        _579 = false;
    }
    bool _587 = _579;
    bool _589 = !_407;
    bool _591 = _587;
    if (!_589)
    {
        float _593 = abs(_401);
        float _595 = abs(_385);
        float _597 = precise::min(_593, _595);
        float _599 = _417 * (-0.0199999995529651641845703125);
        bool _601 = _597 != 1.0;
        bool _603 = isnan(_597);
        bool _605 = _601 || _603;
        bool _607 = isnan(1.0);
        bool _609 = _605 || _607;
        float _611 = -_597;
        float _613 = fma(_611, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _615 = 1.0 / _613;
        float _617 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _619 = fma(_615, (*spvDescriptorSet0.fp_c3)._m0[8].w, _617);
        float _621 = _609 ? _619 : 1.0;
        float _623 = _621 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _625 = _623 > _599;
        _591 = _625;
        _581 = _597;
        _433 = _615;
        _583 = _623;
    }
    bool _627 = _591;
    float _629 = _581;
    float _631 = _433;
    float _633 = _583;
    float _635 = _633;
    float _637 = _631;
    float _639 = _629;
    if (_627)
    {
        _635 = 0.0;
    }
    float _641 = _635;
    float _643 = _641;
    if (_627)
    {
        _637 = 0.0;
    }
    float _645 = _637;
    float _647 = _645;
    if (_627)
    {
        _639 = 1.0;
    }
    float _649 = _639;
    float _651 = _649;
    if (!_627)
    {
        float _653 = abs(_401);
        float _655 = abs(_385);
        bool _657 = _653 >= _655;
        float _659 = _657 ? (-1.0) : 1.0;
        float _661 = _657 ? _83 : _67;
        float _663 = fma(_659, (*spvDescriptorSet0.fp_c3)._m0[0].w, _57);
        float _665 = _659 * _567;
        float _667 = fma(_661, 2.0, -1.0);
        float _669 = fma(_663, 2.0, -1.0);
        float _671 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _673 = _669 * _671;
        float _675 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _677 = _669 * _675;
        float _679 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _681 = _669 * _679;
        float _683 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[5].x, _673);
        float _685 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[3].x, _677);
        float _687 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[4].x, _681);
        float _689 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[5].z, _683);
        float _691 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[3].z, _685);
        float _693 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[4].z, _687);
        float _695 = _689 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _697 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _699 = _669 * _697;
        float _701 = _693 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _703 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[2].x, _699);
        float _705 = 1.0 / _695;
        float _707 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[2].z, _703);
        float _709 = _691 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _711 = _707 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _713 = -_415;
        float _715 = fma(_711, _705, _713);
        float _717 = -_419;
        float _719 = fma(_709, _705, _717);
        float _721 = -_417;
        float _723 = fma(_701, _705, _721);
        _585 = _665;
        _651 = _723;
        _647 = _719;
        _643 = _715;
    }
    float _725 = _585;
    float _727 = _651;
    float _729 = _647;
    float _731 = _643;
    float _733 = _569 * _725;
    float _735 = 1.0 / _417;
    float _737 = _571 * _725;
    float _739 = _573 * _725;
    float _741 = _733 * _727;
    float _743 = _737 * _729;
    int _745 = _321 ^ _413;
    float _747 = -_741;
    float _749 = fma(_737, _731, _747);
    float _751 = _739 * _731;
    float _753 = -_743;
    float _755 = fma(_739, _727, _753);
    float _757 = float(uint(_745));
    float _759 = _749 * _749;
    float _761 = -_751;
    float _763 = fma(_733, _729, _761);
    float _765 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _767 = fma(_755, _755, _759);
    float _769 = -_735;
    float _771 = _765 * _769;
    float _773 = fma(_763, _763, _767);
    float _775 = fma(_757, 0.61803400516510009765625, 0.5);
    float _777 = precise::min(_771, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _779 = rsqrt(_773);
    bool _781 = _777 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _783 = isnan(_777);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
    bool _789 = _785 || _787;
    float _791 = _755 * _779;
    float _793 = _749 * _779;
    float _795 = _763 * _779;
    float _797 = _767;
    float _799 = _773;
    if (!_789)
    {
        _797 = 0.0;
    }
    float _801 = _797;
    bool _803 = !_789;
    float _805 = _801;
    if (!_803)
    {
        float _807 = _793 * _793;
        float _809 = _419 * _419;
        float _811 = floor(_775);
        bool _813 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
        float _815 = fma(_791, _791, _807);
        float _817 = fma(_415, _415, _809);
        bool _819 = _815 >= 0.00999999977648258209228515625;
        bool _821 = isnan(_815);
        bool _823 = _819 || _821;
        bool _825 = isnan(0.00999999977648258209228515625);
        bool _827 = _823 || _825;
        float _829 = fma(_417, _417, _817);
        float _831 = -_793;
        float _833 = _419 * _831;
        float _835 = -_791;
        float _837 = fma(_415, _835, _833);
        float _839 = 1.0 / _829;
        float _841 = -_811;
        float _843 = _775 + _841;
        float _845 = -_795;
        float _847 = fma(_417, _845, _837);
        float _849 = _807;
        if (!_827)
        {
            _799 = 1.0;
        }
        float _851 = _799;
        float _853 = _847 * _847;
        float _855 = _815;
        float _857 = _851;
        if (_827)
        {
            float _859 = rsqrt(_815);
            _855 = _859;
        }
        float _861 = _855;
        if (!_827)
        {
            _849 = 0.0;
        }
        float _863 = _849;
        float _865 = _853 * _839;
        float _867 = _839;
        float _869 = _863;
        if (!_813)
        {
            _867 = 0.0;
        }
        float _871 = _867;
        float _873 = _871;
        if (_827)
        {
            float _875 = -_861;
            float _877 = _791 * _875;
            _857 = _877;
        }
        float _879 = _857;
        if (_827)
        {
            float _881 = _793 * _861;
            _869 = _881;
        }
        float _883 = _869;
        bool _885 = !_813;
        if (!_885)
        {
            float _887 = _843 * 3.1415927410125732421875;
            float _889 = _777 * 1.77777779102325439453125;
            float _891 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
            int _893 = 0;
            float _895 = 0.0;
            bool _897;
            float _1255;
            do
            {
                int _899 = _893;
                float _901 = _895;
                float _903 = float(_899);
                float _905 = _903 + 0.5;
                float _907 = _905 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
                float _909 = _907 * 2.0;
                float _911 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[10].y, _887);
                float _913 = _909 * _909;
                float _915 = _911 * 0.15915493667125701904296875;
                float _917 = _915 * 6.283185482025146484375;
                float _919 = sin(_917);
                float _921 = _915 * 6.283185482025146484375;
                float _923 = cos(_921);
                bool _925 = _919 > 0.0;
                float _927 = -_919;
                float _929 = _925 ? _927 : _919;
                float _931 = -_923;
                float _933 = _925 ? _931 : _923;
                float _935 = _929 * _883;
                float _937 = -_879;
                float _939 = _929 * _937;
                float _941 = -_879;
                float _943 = -_935;
                float _945 = fma(_933, _941, _943);
                float _947 = fma(_933, _883, _939);
                float _949 = _945 * _913;
                float _951 = _947 * _913;
                float _953 = _949 * _879;
                float _955 = -_883;
                float _957 = _949 * _955;
                float _959 = fma(_777, _951, _55);
                float _961 = -_951;
                float _963 = fma(_961, _883, _953);
                float _965 = -_951;
                float _967 = fma(_965, _879, _957);
                float _969 = _963 * _963;
                float _971 = _967 * _967;
                float _973 = fma(_865, _969, _971);
                bool _975 = _973 > _865;
                float _977 = _957;
                float _979 = _967;
                float _981 = _973;
                float _983 = _953;
                if (_975)
                {
                    float _985 = _967 * _879;
                    _977 = _985;
                }
                float _987 = _977;
                if (_975)
                {
                    float _989 = _967 * _883;
                    _979 = _989;
                }
                float _991 = _979;
                if (!_975)
                {
                    float _993 = -_949;
                    float _995 = (-0.0) + _993;
                    _981 = _995;
                }
                float _997 = _981;
                float _999 = _997;
                if (!_975)
                {
                    float _1001 = -_951;
                    float _1003 = (-0.0) + _1001;
                    _983 = _1003;
                }
                float _1005 = _983;
                float _1007 = fma(_949, _889, _57);
                float _1009 = _1005;
                if (_975)
                {
                    float _1011 = -_879;
                    float _1013 = -_991;
                    float _1015 = fma(_963, _1011, _1013);
                    _999 = _1015;
                }
                float _1017 = _999;
                if (_975)
                {
                    float _1019 = -_987;
                    float _1021 = fma(_963, _883, _1019);
                    _1009 = _1021;
                }
                float _1023 = _1009;
                float _1025 = fma(_889, _1017, _57);
                float _1027 = fma(_777, _1023, _55);
                float2 _2826 = float2(_959, _1007);
                float _1029 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2826, float2(0.0), isnan(_2826))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2826, float2(0.0), isnan(_2826))).x;
                float2 _2834 = float2(_1027, _1025);
                float _1031 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2834, float2(0.0), isnan(_2834))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2834, float2(0.0), isnan(_2834))).x;
                float _1033 = fma(_1007, 2.0, -1.0);
                float _1035 = fma(_959, 2.0, -1.0);
                float _1037 = fma(_1025, 2.0, -1.0);
                float _1039 = fma(_1027, 2.0, -1.0);
                float _1041 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _1043 = _1033 * _1041;
                float _1045 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _1047 = _1033 * _1045;
                float _1049 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _1051 = _1033 * _1049;
                float _1053 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _1055 = _1033 * _1053;
                float _1057 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1043);
                float _1059 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1047);
                float _1061 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _1063 = _1037 * _1061;
                float _1065 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _1067 = _1037 * _1065;
                float _1069 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _1071 = _1037 * _1069;
                float _1073 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[3].x, _1051);
                float _1075 = fma(_1035, (*spvDescriptorSet0.fp_c3)._m0[4].x, _1055);
                float _1077 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1063);
                float _1079 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[3].x, _1067);
                float _1081 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1071);
                int _1083 = _899 + 1;
                bool _1085 = _1083 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                float _1087 = fma(_1029, 2.0, -1.0);
                float _1089 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _1091 = _1037 * _1089;
                float _1093 = fma(_1087, (*spvDescriptorSet0.fp_c3)._m0[5].z, _1057);
                float _1095 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[4].x, _1091);
                float _1097 = fma(_1087, (*spvDescriptorSet0.fp_c3)._m0[3].z, _1073);
                float _1099 = _1093 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _1101 = fma(_1031, 2.0, -1.0);
                float _1103 = fma(_1087, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1059);
                float _1105 = fma(_1087, (*spvDescriptorSet0.fp_c3)._m0[4].z, _1075);
                float _1107 = _1097 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _1109 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[5].z, _1081);
                float _1111 = 1.0 / _1099;
                float _1113 = _1105 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _1115 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[3].z, _1079);
                float _1117 = _1109 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _1119 = _1103 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _1121 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1077);
                float _1123 = _1115 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _1125 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[4].z, _1095);
                float _1127 = 1.0 / _1117;
                float _1129 = _1121 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _1131 = _1125 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _1133 = -_415;
                float _1135 = fma(_1119, _1111, _1133);
                float _1137 = -_419;
                float _1139 = fma(_1107, _1111, _1137);
                float _1141 = -_417;
                float _1143 = fma(_1113, _1111, _1141);
                float _1145 = _1139 * _1139;
                float _1147 = -_1139;
                float _1149 = _793 * _1147;
                float _1151 = -_419;
                float _1153 = fma(_1123, _1127, _1151);
                float _1155 = -_415;
                float _1157 = fma(_1129, _1127, _1155);
                float _1159 = fma(_1135, _1135, _1145);
                float _1161 = -_417;
                float _1163 = fma(_1131, _1127, _1161);
                float _1165 = _1153 * _1153;
                float _1167 = -_791;
                float _1169 = fma(_1167, _1135, _1149);
                float _1171 = fma(_1143, _1143, _1159);
                float _1173 = -_1153;
                float _1175 = _793 * _1173;
                float _1177 = fma(_1157, _1157, _1165);
                float _1179 = -_795;
                float _1181 = fma(_1179, _1143, _1169);
                float _1183 = -_1171;
                float _1185 = fma(_1183, _891, 1.0);
                float _1187 = -_791;
                float _1189 = fma(_1187, _1157, _1175);
                float _1191 = fma(_1163, _1163, _1177);
                float _1193 = _1171 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _1195 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _1197 = _1181 + _1195;
                float _1199 = precise::max(0.0, _1185);
                float _1201 = -_1191;
                float _1203 = fma(_1201, _891, 1.0);
                float _1205 = _1191 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _1207 = -_795;
                float _1209 = fma(_1207, _1163, _1189);
                float _1211 = 1.0 / _1193;
                float _1213 = _1199 * _1199;
                float _1215 = precise::max(0.0, _1203);
                float _1217 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _1219 = _1209 + _1217;
                float _1221 = _1199 * _1213;
                float _1223 = precise::max(_1197, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1225 = _1215 * _1215;
                float _1227 = 1.0 / _1205;
                float _1229 = _1221 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1231 = _1215 * _1225;
                float _1233 = precise::max(_1219, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1235 = _1229 * _1223;
                float _1237 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1239 = _1235 * _1211;
                float _1241 = _1237 * _1233;
                float _1243 = precise::max(_1239, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1245 = _1241 * _1227;
                float _1247 = precise::min(_1243, 1.0);
                float _1249 = precise::max(_1245, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1251 = precise::min(_1249, 1.0);
                float _1253 = _1247 + _1251;
                _1255 = fma(_1253, (*spvDescriptorSet0.fp_c3)._m0[9].y, _901);
                _897 = !_1085;
                _893 = _1083;
                _895 = _1255;
            } while (_897);
            _873 = _1255;
        }
        float _1257 = _873;
        float _1259 = fma(_777, (*spvDescriptorSet0.fp_c3)._m0[0].x, -1.0);
        float _1261 = _1257 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
        float _1263 = fma(_55, 2.0, -1.0);
        float _1265 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].z;
        float _1267 = fma(_57, 2.0, -1.0);
        float _1269 = precise::min(_1259, 1.0);
        float _1271 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].x;
        float _1273 = abs(_1263);
        float _1275 = _1273 + _1265;
        float _1277 = precise::clamp(_1275, 0.0, 1.0);
        float _1279 = _1269 * _1261;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        float _1283 = abs(_1267);
        float _1285 = _1283 + _1271;
        float _1287 = precise::clamp(_1285, 0.0, 1.0);
        float _1289 = _1277 * (*spvDescriptorSet0.fp_c3)._m0[17].w;
        float _1291 = -_1281;
        float _1293 = _1291 + 1.0;
        float _1295 = _1287 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
        float _1297 = -_1289;
        float _1299 = fma(_1297, _1289, 1.0);
        float _1301 = abs(_1293);
        float _1303 = log2(_1301);
        float _1305 = -_1295;
        float _1307 = fma(_1305, _1295, _1299);
        float _1309 = _1303 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
        float _1311 = exp2(_1309);
        float _1313 = -_1311;
        float _1315 = _1313 + 1.0;
        float _1317 = _1315 * _1307;
        float _1319 = precise::clamp(_1317, 0.0, 1.0);
        float _1321 = _1319 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
        _805 = _1321;
    }
    float _1323 = _805;
    float _1325 = -_71;
    float _1327 = fma(_1325, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
    float _1329 = -_1323;
    float _1331 = _1329 + 1.0;
    bool _1333 = _71 != 1.0;
    bool _1335 = isnan(_71);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(1.0);
    bool _1341 = _1337 || _1339;
    float _1343 = 1.0 / _1327;
    float _1345 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _1347 = fma(_1343, (*spvDescriptorSet0.fp_c3)._m0[8].w, _1345);
    int _1349 = _1341 ? as_type<int>(_1347) : 1065353216;
    out.m_32.x = _1331;
    out.m_32.y = as_type<float>(_1349);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

