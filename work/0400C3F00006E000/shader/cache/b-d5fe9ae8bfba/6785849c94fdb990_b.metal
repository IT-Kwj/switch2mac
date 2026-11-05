#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

// Implementation of the signed GLSL findMSB() function
template<typename T>
inline T spvFindSMSB(T x)
{
    T v = select(x, T(-1) - x, x < T(0));
    return select(clz(T(0)) - (clz(v) + T(1)), T(-1), v == T(0));
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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1291 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _63 = _57 + _61;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _67 = _59 + _65;
    float2 _1433 = float2(_57, _59);
    float3 _71 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1433, float2(0.0), isnan(_1433)), int2(0), component::x).xzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _1450 = float2(_63, _67);
    float2 _81 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1450, float2(0.0), isnan(_1450)), int2(0), component::x).xz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = gl_FragCoord.x;
    float _89 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _91 = _87 / _89;
    float _93 = gl_FragCoord.y;
    float _95 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _97 = _93 / _95;
    float _99 = trunc(_91);
    float _101 = precise::max(_99, 0.0);
    uint _104 = uint(_101);
    float _106 = trunc(_97);
    float _108 = precise::max(_106, 0.0);
    uint _110 = uint(_108);
    uint _112 = uint(int(uint(int(_104)) >> uint(5)));
    int _115 = int(_104) ^ 31;
    int _117 = int(_112) & 1;
    bool _121 = _117 != 0;
    int _123 = int(_112) & 1;
    uint _125 = uint(int(uint(int(_110)) >> uint(5)));
    bool _127 = !_121;
    int _129 = _127 ? int(_104) : _115;
    int _131 = int(_125) & 1;
    bool _133 = _131 != 0;
    bool _135 = !_133;
    uint _137 = uint(_135 ? _129 : int(_110));
    int _139 = int(_110) ^ 31;
    uint _141 = uint(int(uint(int(_137)) >> uint(4)));
    int _143 = int(_137) ^ 15;
    uint _145 = _104;
    if (!_133)
    {
        bool _147 = !_121;
        uint _149 = uint(_147 ? int(_110) : _139);
        _145 = _149;
    }
    uint _151 = _145;
    int _153 = int(_141) & 1;
    bool _155 = _153 != 0;
    uint _157 = uint(int(uint(int(_151)) >> uint(4)));
    int _159 = int(_151) ^ 15;
    int _161 = int(_157) & 1;
    bool _163 = _161 != 0;
    int _165 = int(_157) & 1;
    bool _167 = !_163;
    int _169 = _167 ? int(_151) : _159;
    int _171 = _165 << 1;
    int _173 = _171 + _165;
    uint _175 = _151;
    if (!_155)
    {
        bool _177 = !_163;
        uint _179 = uint(_177 ? int(_137) : _143);
        _175 = _179;
    }
    uint _181 = _175;
    bool _183 = !_155;
    uint _185 = uint(_183 ? _169 : int(_137));
    uint _187 = uint(int(uint(int(_181)) >> uint(3)));
    uint _189 = uint(int(uint(int(_185)) >> uint(3)));
    int _191 = int(_181) ^ 7;
    int _193 = int(_187) & 1;
    bool _195 = _193 != 0;
    int _197 = int(_189) & 1;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    int _203 = _201 ? int(_181) : _191;
    int _205 = int(_187) & 1;
    bool _207 = !_199;
    uint _209 = uint(_207 ? _203 : int(_185));
    int _211 = int(_185) ^ 7;
    uint _213 = uint(int(uint(int(_209)) >> uint(2)));
    int _215 = int(_209) ^ 3;
    uint _217 = _181;
    if (!_199)
    {
        bool _219 = !_195;
        uint _221 = uint(_219 ? int(_185) : _211);
        _217 = _221;
    }
    uint _223 = _217;
    int _225 = int(_213) & 1;
    bool _227 = _225 != 0;
    int _229 = _123 << 1;
    int _231 = _229 + _123;
    uint _233 = uint(int(uint(int(_223)) >> uint(2)));
    int _235 = int(_223) ^ 3;
    int _237 = int(_233) & 1;
    bool _239 = _237 != 0;
    int _241 = _231 ^ _131;
    bool _243 = !_239;
    int _245 = _243 ? int(_223) : _235;
    uint _247 = _223;
    if (!_227)
    {
        bool _249 = !_239;
        uint _251 = uint(_249 ? int(_209) : _215);
        _247 = _251;
    }
    uint _253 = _247;
    int _255 = _205 << 1;
    int _257 = _255 + _205;
    bool _259 = !_227;
    uint _261 = uint(_259 ? _245 : int(_209));
    uint _263 = uint(int(uint(int(_253)) >> uint(1)));
    int _265 = _257 ^ _197;
    int _267 = int(_233) & 1;
    int _269 = int(_263) & 1;
    uint _271 = uint(int(uint(int(_261)) >> uint(1)));
    int _273 = _173 ^ _153;
    int _275 = _267 << 1;
    int _277 = _275 + _267;
    int _279 = _269 << 1;
    int _281 = _279 + _269;
    float _283 = fma(_59, 2.0, -1.0);
    int _285 = int(_271) & 1;
    bool _287 = _285 != 0;
    int _289 = _241 << 10;
    float _291 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _293 = _283 * _291;
    int _295 = _273 << 8;
    float _297 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _299 = _283 * _297;
    int _301 = _265 << 6;
    int _303 = _277 ^ _225;
    float _305 = fma(_57, 2.0, -1.0);
    int _307 = _281 ^ _285;
    float _309 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _311 = _283 * _309;
    int _313 = _289 ^ _295;
    int _315 = _301 ^ _313;
    float _317 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _319 = _283 * _317;
    int _321 = _303 << 4;
    int _323 = _307 << 2;
    float _325 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[4].x, _319);
    int _327 = int(_263) & 1;
    bool _329 = _327 != 0;
    int _331 = _315 ^ _321;
    int _333 = _323 ^ _331;
    float _335 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[5].x, _311);
    int _337 = int(_253) ^ 1;
    int _339 = int(_261) ^ 1;
    bool _341 = !_329;
    int _343 = _341 ? int(_253) : _337;
    int _345 = int(_253);
    bool _347 = _329;
    if (!_287)
    {
        bool _349 = !_329;
        int _351 = _349 ? int(_261) : _339;
        _345 = _351;
    }
    int _353 = _345;
    bool _355 = !_287;
    int _357 = _355 ? _343 : int(_261);
    float _359 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[2].x, _293);
    int _361 = _353 & 1;
    int _363 = _361 << 1;
    int _365 = _363 + _361;
    int _367 = 1 & _357;
    int _369 = _365 ^ _367;
    float _371 = fma(_77, 2.0, -1.0);
    float _373 = -_77;
    float _375 = _75 + _373;
    float _377 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[5].z, _335);
    float _379 = -_77;
    float _381 = _379 + _83;
    float _383 = -_77;
    float _385 = _383 + _85;
    float _387 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[2].z, _359);
    float _389 = _377 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _391 = _375 * _381;
    float _393 = -_77;
    float _395 = _73 + _393;
    float _397 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[4].z, _325);
    float _399 = 1.0 / _389;
    bool _401 = _391 > 0.0;
    float _403 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[3].x, _299);
    float _405 = _395 * _385;
    float _407 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[3].z, _403);
    float _409 = _397 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    bool _411 = _405 > 0.0;
    float _413 = _387 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _415 = _407 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _417 = _407;
    float _419 = as_type<float>(_365);
    float _421 = _397;
    float _423 = _83;
    float _425 = _375;
    float _427 = _75;
    float _429 = _395;
    if (!_401)
    {
        _347 = false;
    }
    bool _431 = _347;
    float _433 = _413 * _399;
    float _435 = _415 * _399;
    float _437 = _409 * _399;
    bool _439 = !_401;
    bool _441 = _431;
    float _443 = 0.0;
    if (!_439)
    {
        float _445 = abs(_375);
        float _447 = abs(_381);
        float _449 = precise::min(_445, _447);
        bool _451 = _449 != 1.0;
        bool _453 = isnan(_449);
        bool _455 = _451 || _453;
        bool _457 = isnan(1.0);
        bool _459 = _455 || _457;
        float _461 = -_449;
        float _463 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _465 = 1.0 / _463;
        float _467 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _469 = fma(_465, (*spvDescriptorSet0.fp_c3)._m0[8].w, _467);
        float _471 = _437 * (-0.0199999995529651641845703125);
        float _473 = _459 ? _469 : 1.0;
        float _475 = _473 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _477 = _475 > _471;
        _441 = _477;
        _443 = _471;
        _417 = _449;
        _419 = _475;
        _421 = _465;
    }
    bool _479 = _441;
    float _481 = _443;
    float _483 = _417;
    float _485 = _419;
    float _487 = _421;
    float _489 = _483;
    float _491 = _487;
    float _493 = _485;
    float _495 = _481;
    bool _497 = _479;
    if (_479)
    {
        _489 = 1.0;
    }
    float _499 = _489;
    float _501 = _499;
    if (_479)
    {
        _491 = 0.0;
    }
    float _503 = _491;
    float _505 = _503;
    if (_479)
    {
        _493 = 0.0;
    }
    float _507 = _493;
    float _509 = _507;
    if (_479)
    {
        _495 = 1.0;
    }
    float _511 = _495;
    float _513 = _511;
    if (!_479)
    {
        float _515 = abs(_375);
        float _517 = abs(_381);
        bool _519 = _515 >= _517;
        float _521 = _519 ? (-1.0) : 1.0;
        float _523 = _519 ? _83 : _75;
        float _525 = fma(_521, (*spvDescriptorSet0.fp_c3)._m0[0].z, _57);
        float _527 = fma(_523, 2.0, -1.0);
        float _529 = fma(_525, 2.0, -1.0);
        float _531 = fma(_529, (*spvDescriptorSet0.fp_c3)._m0[5].x, _311);
        float _533 = fma(_529, (*spvDescriptorSet0.fp_c3)._m0[2].x, _293);
        float _535 = fma(_529, (*spvDescriptorSet0.fp_c3)._m0[3].x, _299);
        float _537 = fma(_529, (*spvDescriptorSet0.fp_c3)._m0[4].x, _319);
        float _539 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[5].z, _531);
        float _541 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[2].z, _533);
        float _543 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[3].z, _535);
        float _545 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[4].z, _537);
        float _547 = _539 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _549 = _541 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _551 = _543 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _553 = _545 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _555 = 1.0 / _547;
        float _557 = -_433;
        float _559 = fma(_549, _555, _557);
        float _561 = -_435;
        float _563 = fma(_551, _555, _561);
        float _565 = -_437;
        float _567 = fma(_553, _555, _565);
        _497 = _519;
        _513 = _521;
        _501 = _559;
        _509 = _567;
        _505 = _563;
        _423 = _527;
        _425 = _529;
    }
    bool _569 = _497;
    float _571 = _513;
    float _573 = _501;
    float _575 = _509;
    float _577 = _505;
    float _579 = _423;
    float _581 = _425;
    bool _583 = _569;
    float _585 = _579;
    float _587 = _581;
    float _589 = _571;
    if (!_411)
    {
        _583 = false;
    }
    bool _591 = _583;
    bool _593 = !_411;
    bool _595 = _591;
    if (!_593)
    {
        float _597 = abs(_395);
        float _599 = abs(_385);
        float _601 = precise::min(_597, _599);
        float _603 = _437 * (-0.0199999995529651641845703125);
        bool _605 = _601 != 1.0;
        bool _607 = isnan(_601);
        bool _609 = _605 || _607;
        bool _611 = isnan(1.0);
        bool _613 = _609 || _611;
        float _615 = -_601;
        float _617 = fma(_615, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _619 = 1.0 / _617;
        float _621 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _623 = fma(_619, (*spvDescriptorSet0.fp_c3)._m0[8].w, _621);
        float _625 = _613 ? _623 : 1.0;
        float _627 = _625 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _629 = _627 > _603;
        _595 = _629;
        _585 = _601;
        _427 = _619;
        _587 = _627;
    }
    bool _631 = _595;
    float _633 = _585;
    float _635 = _427;
    float _637 = _587;
    float _639 = _637;
    float _641 = _635;
    float _643 = _633;
    if (_631)
    {
        _639 = 0.0;
    }
    float _645 = _639;
    float _647 = _645;
    if (_631)
    {
        _641 = 0.0;
    }
    float _649 = _641;
    float _651 = _649;
    if (_631)
    {
        _643 = 1.0;
    }
    float _653 = _643;
    float _655 = _653;
    if (!_631)
    {
        float _657 = abs(_395);
        float _659 = abs(_385);
        bool _661 = _657 >= _659;
        float _663 = _661 ? (-1.0) : 1.0;
        float _665 = _661 ? _85 : _73;
        float _667 = fma(_663, (*spvDescriptorSet0.fp_c3)._m0[0].w, _59);
        float _669 = _663 * _571;
        float _671 = fma(_665, 2.0, -1.0);
        float _673 = fma(_667, 2.0, -1.0);
        float _675 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _677 = _673 * _675;
        float _679 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _681 = _673 * _679;
        float _683 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _685 = _673 * _683;
        float _687 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[5].x, _677);
        float _689 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[3].x, _681);
        float _691 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[4].x, _685);
        float _693 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[5].z, _687);
        float _695 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[3].z, _689);
        float _697 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[4].z, _691);
        float _699 = _693 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _701 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _703 = _673 * _701;
        float _705 = _695 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _707 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[2].x, _703);
        float _709 = 1.0 / _699;
        float _711 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[2].z, _707);
        float _713 = _697 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _715 = _711 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _717 = -_433;
        float _719 = fma(_715, _709, _717);
        float _721 = -_435;
        float _723 = fma(_705, _709, _721);
        float _725 = -_437;
        float _727 = fma(_713, _709, _725);
        _589 = _669;
        _655 = _727;
        _651 = _723;
        _647 = _719;
        _429 = _673;
    }
    float _729 = _589;
    float _731 = _655;
    float _733 = _651;
    float _735 = _647;
    float _737 = _429;
    float _739 = _573 * _729;
    float _741 = 1.0 / _437;
    float _743 = _575 * _729;
    float _745 = _577 * _729;
    float _747 = _739 * _731;
    float _749 = _743 * _733;
    int _751 = _333 ^ _369;
    float _753 = -_747;
    float _755 = fma(_743, _735, _753);
    float _757 = _745 * _735;
    float _759 = -_749;
    float _761 = fma(_745, _731, _759);
    float _763 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _765 = _755 * _755;
    float _767 = -_757;
    float _769 = fma(_739, _733, _767);
    float _771 = float(uint(_751));
    float _773 = fma(_761, _761, _765);
    float _775 = -_741;
    float _777 = _763 * _775;
    float _779 = fma(_769, _769, _773);
    float _781 = precise::min(_777, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _783 = fma(_771, 0.61803400516510009765625, 0.5);
    float _785 = rsqrt(_779);
    bool _787 = _781 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _789 = isnan(_781);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
    bool _795 = _791 || _793;
    float _797 = _773;
    float _799 = _737;
    float _801 = _735;
    if (!_795)
    {
        _797 = 0.0;
    }
    float _803 = _797;
    float _805 = _761 * _785;
    float _807 = _755 * _785;
    float _809 = _769 * _785;
    bool _811 = !_795;
    float _813 = _803;
    if (!_811)
    {
        float _815 = _807 * _807;
        float _817 = _435 * _435;
        float _819 = floor(_783);
        bool _821 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
        float _823 = fma(_805, _805, _815);
        float _825 = fma(_433, _433, _817);
        bool _827 = _823 >= 0.00999999977648258209228515625;
        bool _829 = isnan(_823);
        bool _831 = _827 || _829;
        bool _833 = isnan(0.00999999977648258209228515625);
        bool _835 = _831 || _833;
        float _837 = fma(_437, _437, _825);
        float _839 = -_807;
        float _841 = _435 * _839;
        float _843 = 1.0 / _837;
        float _845 = -_805;
        float _847 = fma(_433, _845, _841);
        float _849 = -_819;
        float _851 = _783 + _849;
        float _853 = -_809;
        float _855 = fma(_437, _853, _847);
        float _857 = _823;
        if (_835)
        {
            float _859 = rsqrt(_823);
            _857 = _859;
        }
        float _861 = _857;
        float _863 = _855 * _855;
        if (!_835)
        {
            _799 = 1.0;
        }
        float _865 = _799;
        float _867 = _865;
        if (!_835)
        {
            _801 = 0.0;
        }
        float _869 = _801;
        float _871 = _863 * _843;
        float _873 = _869;
        if (_835)
        {
            float _875 = -_861;
            float _877 = _805 * _875;
            _867 = _877;
        }
        float _879 = _867;
        if (_835)
        {
            float _881 = _807 * _861;
            _873 = _881;
        }
        float _883 = _873;
        bool _885 = !_821;
        float _1289;
        if (!_885)
        {
            float _887 = _851 * 3.1415927410125732421875;
            float _889 = _781 * 1.77777779102325439453125;
            float _891 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
            int _893 = 0;
            float _895 = 0.0;
            bool _897;
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
                float _917 = _781 * _913;
                float _919 = _915 * 6.283185482025146484375;
                float _921 = sin(_919);
                float _923 = _915 * 6.283185482025146484375;
                float _925 = cos(_923);
                bool _927 = _921 > 0.0;
                float _929 = -_921;
                float _931 = _927 ? _929 : _921;
                float _933 = _917 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                float _935 = -_925;
                float _937 = _927 ? _935 : _925;
                float _939 = _931 * _883;
                float _941 = -_879;
                float _943 = _931 * _941;
                float _945 = _933 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float _947 = -_879;
                float _949 = -_939;
                float _951 = fma(_937, _947, _949);
                float _953 = fma(_937, _883, _943);
                float _955 = trunc(_945);
                int _957 = int(_955);
                float _959 = _951 * _913;
                float _961 = _953 * _913;
                float _963 = _959 * _879;
                float _965 = -_883;
                float _967 = _959 * _965;
                float _969 = -_961;
                float _971 = fma(_969, _883, _963);
                float _973 = -_961;
                float _975 = fma(_973, _879, _967);
                float _977 = _971 * _971;
                float _979 = _975 * _975;
                int _981 = int(uint(spvFindSMSB(_957)));
                float _983 = fma(_871, _977, _979);
                bool _985 = _983 > _871;
                int _987 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[18].w);
                int _989 = _981 + _987;
                int _991 = _989 + 1;
                float _993 = fma(_781, _961, _57);
                int _995 = max(0, _991);
                float _997 = _967;
                float _999 = _945;
                float _1001 = _979;
                float _1003 = as_type<float>(_991);
                if (_985)
                {
                    float _1005 = _975 * _879;
                    _997 = _1005;
                }
                float _1007 = _997;
                if (_985)
                {
                    float _1009 = _975 * _883;
                    _999 = _1009;
                }
                float _1011 = _999;
                if (!_985)
                {
                    float _1013 = -_961;
                    float _1015 = (-0.0) + _1013;
                    _1001 = _1015;
                }
                float _1017 = _1001;
                float _1019 = _1017;
                if (!_985)
                {
                    float _1021 = -_959;
                    float _1023 = (-0.0) + _1021;
                    _1003 = _1023;
                }
                float _1025 = _1003;
                float _1027 = _1025;
                if (_985)
                {
                    float _1029 = -_1007;
                    float _1031 = fma(_971, _883, _1029);
                    _1019 = _1031;
                }
                float _1033 = _1019;
                if (_985)
                {
                    float _1035 = -_879;
                    float _1037 = -_1011;
                    float _1039 = fma(_971, _1035, _1037);
                    _1027 = _1039;
                }
                float _1041 = _1027;
                int _1043 = min(_995, 4);
                float _1045 = fma(_959, _889, _59);
                float _1047 = fma(_781, _1033, _57);
                float _1049 = _993 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float _1051 = fma(_889, _1041, _59);
                float _1053 = float(_1043);
                float _1055 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[16].w;
                float _1057 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float _1059 = _1051 * (*spvDescriptorSet0.fp_c3)._m0[16].w;
                float2 _2906 = float2(_1049, _1055);
                float _1061 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2906, float2(0.0), isnan(_2906)), level(_1053)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2906, float2(0.0), isnan(_2906)), level(_1053)).x;
                float2 _2915 = float2(_1057, _1059);
                float _1063 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2915, float2(0.0), isnan(_2915)), level(_1053)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2915, float2(0.0), isnan(_2915)), level(_1053)).x;
                float _1065 = fma(_1045, 2.0, -1.0);
                float _1067 = fma(_993, 2.0, -1.0);
                float _1069 = fma(_1051, 2.0, -1.0);
                float _1071 = fma(_1047, 2.0, -1.0);
                float _1073 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _1075 = _1065 * _1073;
                float _1077 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _1079 = _1065 * _1077;
                float _1081 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _1083 = _1065 * _1081;
                float _1085 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _1087 = _1065 * _1085;
                float _1089 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1075);
                float _1091 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[4].x, _1079);
                float _1093 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _1095 = _1069 * _1093;
                float _1097 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[3].x, _1083);
                float _1099 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1087);
                float _1101 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _1103 = _1069 * _1101;
                float _1105 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1095);
                float _1107 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _1109 = _1069 * _1107;
                float _1111 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _1113 = _1069 * _1111;
                float _1115 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1103);
                int _1117 = _899 + 1;
                float _1119 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[3].x, _1109);
                bool _1121 = _1117 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                float _1123 = fma(_1061, 2.0, -1.0);
                float _1125 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[4].x, _1113);
                float _1127 = fma(_1063, 2.0, -1.0);
                float _1129 = fma(_1123, (*spvDescriptorSet0.fp_c3)._m0[5].z, _1099);
                float _1131 = fma(_1123, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1089);
                float _1133 = fma(_1123, (*spvDescriptorSet0.fp_c3)._m0[3].z, _1097);
                float _1135 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[5].z, _1105);
                float _1137 = _1129 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _1139 = fma(_1123, (*spvDescriptorSet0.fp_c3)._m0[4].z, _1091);
                float _1141 = _1131 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _1143 = _1135 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _1145 = _1133 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _1147 = _1139 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _1149 = 1.0 / _1137;
                float _1151 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[3].z, _1119);
                float _1153 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1115);
                float _1155 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[4].z, _1125);
                float _1157 = _1151 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _1159 = _1153 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _1161 = _1155 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _1163 = 1.0 / _1143;
                float _1165 = -_433;
                float _1167 = fma(_1141, _1149, _1165);
                float _1169 = -_435;
                float _1171 = fma(_1145, _1149, _1169);
                float _1173 = -_437;
                float _1175 = fma(_1147, _1149, _1173);
                float _1177 = _1171 * _1171;
                float _1179 = -_435;
                float _1181 = fma(_1157, _1163, _1179);
                float _1183 = -_433;
                float _1185 = fma(_1159, _1163, _1183);
                float _1187 = fma(_1167, _1167, _1177);
                float _1189 = -_437;
                float _1191 = fma(_1161, _1163, _1189);
                float _1193 = _1181 * _1181;
                float _1195 = -_1171;
                float _1197 = _807 * _1195;
                float _1199 = fma(_1175, _1175, _1187);
                float _1201 = -_1181;
                float _1203 = _807 * _1201;
                float _1205 = fma(_1185, _1185, _1193);
                float _1207 = -_805;
                float _1209 = fma(_1207, _1167, _1197);
                float _1211 = -_1199;
                float _1213 = fma(_1211, _891, 1.0);
                float _1215 = -_805;
                float _1217 = fma(_1215, _1185, _1203);
                float _1219 = fma(_1191, _1191, _1205);
                float _1221 = _1199 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _1223 = -_809;
                float _1225 = fma(_1223, _1175, _1209);
                float _1227 = precise::max(0.0, _1213);
                float _1229 = -_1219;
                float _1231 = fma(_1229, _891, 1.0);
                float _1233 = _1219 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _1235 = -_809;
                float _1237 = fma(_1235, _1191, _1217);
                float _1239 = 1.0 / _1221;
                float _1241 = _1227 * _1227;
                float _1243 = precise::max(0.0, _1231);
                float _1245 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _1247 = _1225 + _1245;
                float _1249 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _1251 = _1237 + _1249;
                float _1253 = _1227 * _1241;
                float _1255 = _1243 * _1243;
                float _1257 = 1.0 / _1233;
                float _1259 = precise::max(_1247, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1261 = _1253 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1263 = _1243 * _1255;
                float _1265 = precise::max(_1251, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1267 = _1261 * _1259;
                float _1269 = _1263 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1271 = _1267 * _1239;
                float _1273 = _1269 * _1265;
                float _1275 = precise::max(_1271, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1277 = _1273 * _1257;
                float _1279 = precise::min(_1275, 1.0);
                float _1281 = precise::max(_1277, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1283 = precise::min(_1281, 1.0);
                float _1285 = _1279 + _1283;
                float _1287 = fma(_1285, (*spvDescriptorSet0.fp_c3)._m0[9].y, _901);
                _897 = !_1121;
                _893 = _1117;
                _895 = _1287;
                _1289 = _1287;
            } while (_897);
            _1291 = true;
        }
        else
        {
            _1289 = 0.0;
        }
        _1291 = false;
        float _1293 = _1289;
        float _1295 = fma(_781, (*spvDescriptorSet0.fp_c3)._m0[0].x, -1.0);
        float _1297 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
        float _1299 = fma(_57, 2.0, -1.0);
        float _1301 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].z;
        float _1303 = fma(_59, 2.0, -1.0);
        float _1305 = precise::min(_1295, 1.0);
        float _1307 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].x;
        float _1309 = abs(_1299);
        float _1311 = _1309 + _1301;
        float _1313 = precise::clamp(_1311, 0.0, 1.0);
        float _1315 = _1305 * _1297;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        float _1319 = abs(_1303);
        float _1321 = _1319 + _1307;
        float _1323 = precise::clamp(_1321, 0.0, 1.0);
        float _1325 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[17].w;
        float _1327 = -_1317;
        float _1329 = _1327 + 1.0;
        float _1331 = _1323 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
        float _1333 = -_1325;
        float _1335 = fma(_1333, _1325, 1.0);
        float _1337 = abs(_1329);
        float _1339 = log2(_1337);
        float _1341 = -_1331;
        float _1343 = fma(_1341, _1331, _1335);
        float _1345 = _1339 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
        float _1347 = exp2(_1345);
        float _1349 = -_1347;
        float _1351 = _1349 + 1.0;
        float _1353 = _1351 * _1343;
        float _1355 = precise::clamp(_1353, 0.0, 1.0);
        float _1357 = _1355 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
        _813 = _1357;
    }
    float _1359 = _813;
    float _1361 = -_77;
    float _1363 = fma(_1361, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
    float _1365 = -_1359;
    float _1367 = _1365 + 1.0;
    bool _1369 = _77 != 1.0;
    bool _1371 = isnan(_77);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan(1.0);
    bool _1377 = _1373 || _1375;
    float _1379 = 1.0 / _1363;
    float _1381 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _1383 = fma(_1379, (*spvDescriptorSet0.fp_c3)._m0[8].w, _1381);
    int _1385 = _1377 ? as_type<int>(_1383) : 1065353216;
    out.m_34.x = _1367;
    out.m_34.y = as_type<float>(_1385);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1291 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _63 = _57 + _61;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _67 = _59 + _65;
    float2 _1433 = float2(_57, _59);
    float3 _71 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1433, float2(0.0), isnan(_1433)), int2(0), component::x).xzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _1450 = float2(_63, _67);
    float2 _81 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1450, float2(0.0), isnan(_1450)), int2(0), component::x).xz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = gl_FragCoord.x;
    float _89 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _91 = _87 / _89;
    float _93 = gl_FragCoord.y;
    float _95 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _97 = _93 / _95;
    float _99 = trunc(_91);
    float _101 = precise::max(_99, 0.0);
    uint _104 = uint(_101);
    float _106 = trunc(_97);
    float _108 = precise::max(_106, 0.0);
    uint _110 = uint(_108);
    uint _112 = uint(int(uint(int(_104)) >> uint(5)));
    int _115 = int(_104) ^ 31;
    int _117 = int(_112) & 1;
    bool _121 = _117 != 0;
    int _123 = int(_112) & 1;
    uint _125 = uint(int(uint(int(_110)) >> uint(5)));
    bool _127 = !_121;
    int _129 = _127 ? int(_104) : _115;
    int _131 = int(_125) & 1;
    bool _133 = _131 != 0;
    bool _135 = !_133;
    uint _137 = uint(_135 ? _129 : int(_110));
    int _139 = int(_110) ^ 31;
    uint _141 = uint(int(uint(int(_137)) >> uint(4)));
    int _143 = int(_137) ^ 15;
    uint _145 = _104;
    if (!_133)
    {
        bool _147 = !_121;
        uint _149 = uint(_147 ? int(_110) : _139);
        _145 = _149;
    }
    uint _151 = _145;
    int _153 = int(_141) & 1;
    bool _155 = _153 != 0;
    uint _157 = uint(int(uint(int(_151)) >> uint(4)));
    int _159 = int(_151) ^ 15;
    int _161 = int(_157) & 1;
    bool _163 = _161 != 0;
    int _165 = int(_157) & 1;
    bool _167 = !_163;
    int _169 = _167 ? int(_151) : _159;
    int _171 = _165 << 1;
    int _173 = _171 + _165;
    uint _175 = _151;
    if (!_155)
    {
        bool _177 = !_163;
        uint _179 = uint(_177 ? int(_137) : _143);
        _175 = _179;
    }
    uint _181 = _175;
    bool _183 = !_155;
    uint _185 = uint(_183 ? _169 : int(_137));
    uint _187 = uint(int(uint(int(_181)) >> uint(3)));
    uint _189 = uint(int(uint(int(_185)) >> uint(3)));
    int _191 = int(_181) ^ 7;
    int _193 = int(_187) & 1;
    bool _195 = _193 != 0;
    int _197 = int(_189) & 1;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    int _203 = _201 ? int(_181) : _191;
    int _205 = int(_187) & 1;
    bool _207 = !_199;
    uint _209 = uint(_207 ? _203 : int(_185));
    int _211 = int(_185) ^ 7;
    uint _213 = uint(int(uint(int(_209)) >> uint(2)));
    int _215 = int(_209) ^ 3;
    uint _217 = _181;
    if (!_199)
    {
        bool _219 = !_195;
        uint _221 = uint(_219 ? int(_185) : _211);
        _217 = _221;
    }
    uint _223 = _217;
    int _225 = int(_213) & 1;
    bool _227 = _225 != 0;
    int _229 = _123 << 1;
    int _231 = _229 + _123;
    uint _233 = uint(int(uint(int(_223)) >> uint(2)));
    int _235 = int(_223) ^ 3;
    int _237 = int(_233) & 1;
    bool _239 = _237 != 0;
    int _241 = _231 ^ _131;
    bool _243 = !_239;
    int _245 = _243 ? int(_223) : _235;
    uint _247 = _223;
    if (!_227)
    {
        bool _249 = !_239;
        uint _251 = uint(_249 ? int(_209) : _215);
        _247 = _251;
    }
    uint _253 = _247;
    int _255 = _205 << 1;
    int _257 = _255 + _205;
    bool _259 = !_227;
    uint _261 = uint(_259 ? _245 : int(_209));
    uint _263 = uint(int(uint(int(_253)) >> uint(1)));
    int _265 = _257 ^ _197;
    int _267 = int(_233) & 1;
    int _269 = int(_263) & 1;
    uint _271 = uint(int(uint(int(_261)) >> uint(1)));
    int _273 = _173 ^ _153;
    int _275 = _267 << 1;
    int _277 = _275 + _267;
    int _279 = _269 << 1;
    int _281 = _279 + _269;
    float _283 = fma(_59, 2.0, -1.0);
    int _285 = int(_271) & 1;
    bool _287 = _285 != 0;
    int _289 = _241 << 10;
    float _291 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _293 = _283 * _291;
    int _295 = _273 << 8;
    float _297 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _299 = _283 * _297;
    int _301 = _265 << 6;
    int _303 = _277 ^ _225;
    float _305 = fma(_57, 2.0, -1.0);
    int _307 = _281 ^ _285;
    float _309 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _311 = _283 * _309;
    int _313 = _289 ^ _295;
    int _315 = _301 ^ _313;
    float _317 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _319 = _283 * _317;
    int _321 = _303 << 4;
    int _323 = _307 << 2;
    float _325 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[4].x, _319);
    int _327 = int(_263) & 1;
    bool _329 = _327 != 0;
    int _331 = _315 ^ _321;
    int _333 = _323 ^ _331;
    float _335 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[5].x, _311);
    int _337 = int(_253) ^ 1;
    int _339 = int(_261) ^ 1;
    bool _341 = !_329;
    int _343 = _341 ? int(_253) : _337;
    int _345 = int(_253);
    bool _347 = _329;
    if (!_287)
    {
        bool _349 = !_329;
        int _351 = _349 ? int(_261) : _339;
        _345 = _351;
    }
    int _353 = _345;
    bool _355 = !_287;
    int _357 = _355 ? _343 : int(_261);
    float _359 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[2].x, _293);
    int _361 = _353 & 1;
    int _363 = _361 << 1;
    int _365 = _363 + _361;
    int _367 = 1 & _357;
    int _369 = _365 ^ _367;
    float _371 = fma(_77, 2.0, -1.0);
    float _373 = -_77;
    float _375 = _75 + _373;
    float _377 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[5].z, _335);
    float _379 = -_77;
    float _381 = _379 + _83;
    float _383 = -_77;
    float _385 = _383 + _85;
    float _387 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[2].z, _359);
    float _389 = _377 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _391 = _375 * _381;
    float _393 = -_77;
    float _395 = _73 + _393;
    float _397 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[4].z, _325);
    float _399 = 1.0 / _389;
    bool _401 = _391 > 0.0;
    float _403 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[3].x, _299);
    float _405 = _395 * _385;
    float _407 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[3].z, _403);
    float _409 = _397 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    bool _411 = _405 > 0.0;
    float _413 = _387 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _415 = _407 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _417 = _407;
    float _419 = as_type<float>(_365);
    float _421 = _397;
    float _423 = _83;
    float _425 = _375;
    float _427 = _75;
    float _429 = _395;
    if (!_401)
    {
        _347 = false;
    }
    bool _431 = _347;
    float _433 = _413 * _399;
    float _435 = _415 * _399;
    float _437 = _409 * _399;
    bool _439 = !_401;
    bool _441 = _431;
    float _443 = 0.0;
    if (!_439)
    {
        float _445 = abs(_375);
        float _447 = abs(_381);
        float _449 = precise::min(_445, _447);
        bool _451 = _449 != 1.0;
        bool _453 = isnan(_449);
        bool _455 = _451 || _453;
        bool _457 = isnan(1.0);
        bool _459 = _455 || _457;
        float _461 = -_449;
        float _463 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _465 = 1.0 / _463;
        float _467 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _469 = fma(_465, (*spvDescriptorSet0.fp_c3)._m0[8].w, _467);
        float _471 = _437 * (-0.0199999995529651641845703125);
        float _473 = _459 ? _469 : 1.0;
        float _475 = _473 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _477 = _475 > _471;
        _441 = _477;
        _443 = _471;
        _417 = _449;
        _419 = _475;
        _421 = _465;
    }
    bool _479 = _441;
    float _481 = _443;
    float _483 = _417;
    float _485 = _419;
    float _487 = _421;
    float _489 = _483;
    float _491 = _487;
    float _493 = _485;
    float _495 = _481;
    bool _497 = _479;
    if (_479)
    {
        _489 = 1.0;
    }
    float _499 = _489;
    float _501 = _499;
    if (_479)
    {
        _491 = 0.0;
    }
    float _503 = _491;
    float _505 = _503;
    if (_479)
    {
        _493 = 0.0;
    }
    float _507 = _493;
    float _509 = _507;
    if (_479)
    {
        _495 = 1.0;
    }
    float _511 = _495;
    float _513 = _511;
    if (!_479)
    {
        float _515 = abs(_375);
        float _517 = abs(_381);
        bool _519 = _515 >= _517;
        float _521 = _519 ? (-1.0) : 1.0;
        float _523 = _519 ? _83 : _75;
        float _525 = fma(_521, (*spvDescriptorSet0.fp_c3)._m0[0].z, _57);
        float _527 = fma(_523, 2.0, -1.0);
        float _529 = fma(_525, 2.0, -1.0);
        float _531 = fma(_529, (*spvDescriptorSet0.fp_c3)._m0[5].x, _311);
        float _533 = fma(_529, (*spvDescriptorSet0.fp_c3)._m0[2].x, _293);
        float _535 = fma(_529, (*spvDescriptorSet0.fp_c3)._m0[3].x, _299);
        float _537 = fma(_529, (*spvDescriptorSet0.fp_c3)._m0[4].x, _319);
        float _539 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[5].z, _531);
        float _541 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[2].z, _533);
        float _543 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[3].z, _535);
        float _545 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[4].z, _537);
        float _547 = _539 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _549 = _541 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _551 = _543 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _553 = _545 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _555 = 1.0 / _547;
        float _557 = -_433;
        float _559 = fma(_549, _555, _557);
        float _561 = -_435;
        float _563 = fma(_551, _555, _561);
        float _565 = -_437;
        float _567 = fma(_553, _555, _565);
        _497 = _519;
        _513 = _521;
        _501 = _559;
        _509 = _567;
        _505 = _563;
        _423 = _527;
        _425 = _529;
    }
    bool _569 = _497;
    float _571 = _513;
    float _573 = _501;
    float _575 = _509;
    float _577 = _505;
    float _579 = _423;
    float _581 = _425;
    bool _583 = _569;
    float _585 = _579;
    float _587 = _581;
    float _589 = _571;
    if (!_411)
    {
        _583 = false;
    }
    bool _591 = _583;
    bool _593 = !_411;
    bool _595 = _591;
    if (!_593)
    {
        float _597 = abs(_395);
        float _599 = abs(_385);
        float _601 = precise::min(_597, _599);
        float _603 = _437 * (-0.0199999995529651641845703125);
        bool _605 = _601 != 1.0;
        bool _607 = isnan(_601);
        bool _609 = _605 || _607;
        bool _611 = isnan(1.0);
        bool _613 = _609 || _611;
        float _615 = -_601;
        float _617 = fma(_615, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _619 = 1.0 / _617;
        float _621 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _623 = fma(_619, (*spvDescriptorSet0.fp_c3)._m0[8].w, _621);
        float _625 = _613 ? _623 : 1.0;
        float _627 = _625 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _629 = _627 > _603;
        _595 = _629;
        _585 = _601;
        _427 = _619;
        _587 = _627;
    }
    bool _631 = _595;
    float _633 = _585;
    float _635 = _427;
    float _637 = _587;
    float _639 = _637;
    float _641 = _635;
    float _643 = _633;
    if (_631)
    {
        _639 = 0.0;
    }
    float _645 = _639;
    float _647 = _645;
    if (_631)
    {
        _641 = 0.0;
    }
    float _649 = _641;
    float _651 = _649;
    if (_631)
    {
        _643 = 1.0;
    }
    float _653 = _643;
    float _655 = _653;
    if (!_631)
    {
        float _657 = abs(_395);
        float _659 = abs(_385);
        bool _661 = _657 >= _659;
        float _663 = _661 ? (-1.0) : 1.0;
        float _665 = _661 ? _85 : _73;
        float _667 = fma(_663, (*spvDescriptorSet0.fp_c3)._m0[0].w, _59);
        float _669 = _663 * _571;
        float _671 = fma(_665, 2.0, -1.0);
        float _673 = fma(_667, 2.0, -1.0);
        float _675 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _677 = _673 * _675;
        float _679 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _681 = _673 * _679;
        float _683 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _685 = _673 * _683;
        float _687 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[5].x, _677);
        float _689 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[3].x, _681);
        float _691 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[4].x, _685);
        float _693 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[5].z, _687);
        float _695 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[3].z, _689);
        float _697 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[4].z, _691);
        float _699 = _693 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _701 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _703 = _673 * _701;
        float _705 = _695 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _707 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[2].x, _703);
        float _709 = 1.0 / _699;
        float _711 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[2].z, _707);
        float _713 = _697 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _715 = _711 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _717 = -_433;
        float _719 = fma(_715, _709, _717);
        float _721 = -_435;
        float _723 = fma(_705, _709, _721);
        float _725 = -_437;
        float _727 = fma(_713, _709, _725);
        _589 = _669;
        _655 = _727;
        _651 = _723;
        _647 = _719;
        _429 = _673;
    }
    float _729 = _589;
    float _731 = _655;
    float _733 = _651;
    float _735 = _647;
    float _737 = _429;
    float _739 = _573 * _729;
    float _741 = 1.0 / _437;
    float _743 = _575 * _729;
    float _745 = _577 * _729;
    float _747 = _739 * _731;
    float _749 = _743 * _733;
    int _751 = _333 ^ _369;
    float _753 = -_747;
    float _755 = fma(_743, _735, _753);
    float _757 = _745 * _735;
    float _759 = -_749;
    float _761 = fma(_745, _731, _759);
    float _763 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _765 = _755 * _755;
    float _767 = -_757;
    float _769 = fma(_739, _733, _767);
    float _771 = float(uint(_751));
    float _773 = fma(_761, _761, _765);
    float _775 = -_741;
    float _777 = _763 * _775;
    float _779 = fma(_769, _769, _773);
    float _781 = precise::min(_777, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _783 = fma(_771, 0.61803400516510009765625, 0.5);
    float _785 = rsqrt(_779);
    bool _787 = _781 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _789 = isnan(_781);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
    bool _795 = _791 || _793;
    float _797 = _773;
    float _799 = _737;
    float _801 = _735;
    if (!_795)
    {
        _797 = 0.0;
    }
    float _803 = _797;
    float _805 = _761 * _785;
    float _807 = _755 * _785;
    float _809 = _769 * _785;
    bool _811 = !_795;
    float _813 = _803;
    if (!_811)
    {
        float _815 = _807 * _807;
        float _817 = _435 * _435;
        float _819 = floor(_783);
        bool _821 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
        float _823 = fma(_805, _805, _815);
        float _825 = fma(_433, _433, _817);
        bool _827 = _823 >= 0.00999999977648258209228515625;
        bool _829 = isnan(_823);
        bool _831 = _827 || _829;
        bool _833 = isnan(0.00999999977648258209228515625);
        bool _835 = _831 || _833;
        float _837 = fma(_437, _437, _825);
        float _839 = -_807;
        float _841 = _435 * _839;
        float _843 = 1.0 / _837;
        float _845 = -_805;
        float _847 = fma(_433, _845, _841);
        float _849 = -_819;
        float _851 = _783 + _849;
        float _853 = -_809;
        float _855 = fma(_437, _853, _847);
        float _857 = _823;
        if (_835)
        {
            float _859 = rsqrt(_823);
            _857 = _859;
        }
        float _861 = _857;
        float _863 = _855 * _855;
        if (!_835)
        {
            _799 = 1.0;
        }
        float _865 = _799;
        float _867 = _865;
        if (!_835)
        {
            _801 = 0.0;
        }
        float _869 = _801;
        float _871 = _863 * _843;
        float _873 = _869;
        if (_835)
        {
            float _875 = -_861;
            float _877 = _805 * _875;
            _867 = _877;
        }
        float _879 = _867;
        if (_835)
        {
            float _881 = _807 * _861;
            _873 = _881;
        }
        float _883 = _873;
        bool _885 = !_821;
        float _1289;
        if (!_885)
        {
            float _887 = _851 * 3.1415927410125732421875;
            float _889 = _781 * 1.77777779102325439453125;
            float _891 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
            int _893 = 0;
            float _895 = 0.0;
            bool _897;
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
                float _917 = _781 * _913;
                float _919 = _915 * 6.283185482025146484375;
                float _921 = sin(_919);
                float _923 = _915 * 6.283185482025146484375;
                float _925 = cos(_923);
                bool _927 = _921 > 0.0;
                float _929 = -_921;
                float _931 = _927 ? _929 : _921;
                float _933 = _917 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                float _935 = -_925;
                float _937 = _927 ? _935 : _925;
                float _939 = _931 * _883;
                float _941 = -_879;
                float _943 = _931 * _941;
                float _945 = _933 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float _947 = -_879;
                float _949 = -_939;
                float _951 = fma(_937, _947, _949);
                float _953 = fma(_937, _883, _943);
                float _955 = trunc(_945);
                int _957 = int(_955);
                float _959 = _951 * _913;
                float _961 = _953 * _913;
                float _963 = _959 * _879;
                float _965 = -_883;
                float _967 = _959 * _965;
                float _969 = -_961;
                float _971 = fma(_969, _883, _963);
                float _973 = -_961;
                float _975 = fma(_973, _879, _967);
                float _977 = _971 * _971;
                float _979 = _975 * _975;
                int _981 = int(uint(spvFindSMSB(_957)));
                float _983 = fma(_871, _977, _979);
                bool _985 = _983 > _871;
                int _987 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[18].w);
                int _989 = _981 + _987;
                int _991 = _989 + 1;
                float _993 = fma(_781, _961, _57);
                int _995 = max(0, _991);
                float _997 = _967;
                float _999 = _945;
                float _1001 = _979;
                float _1003 = as_type<float>(_991);
                if (_985)
                {
                    float _1005 = _975 * _879;
                    _997 = _1005;
                }
                float _1007 = _997;
                if (_985)
                {
                    float _1009 = _975 * _883;
                    _999 = _1009;
                }
                float _1011 = _999;
                if (!_985)
                {
                    float _1013 = -_961;
                    float _1015 = (-0.0) + _1013;
                    _1001 = _1015;
                }
                float _1017 = _1001;
                float _1019 = _1017;
                if (!_985)
                {
                    float _1021 = -_959;
                    float _1023 = (-0.0) + _1021;
                    _1003 = _1023;
                }
                float _1025 = _1003;
                float _1027 = _1025;
                if (_985)
                {
                    float _1029 = -_1007;
                    float _1031 = fma(_971, _883, _1029);
                    _1019 = _1031;
                }
                float _1033 = _1019;
                if (_985)
                {
                    float _1035 = -_879;
                    float _1037 = -_1011;
                    float _1039 = fma(_971, _1035, _1037);
                    _1027 = _1039;
                }
                float _1041 = _1027;
                int _1043 = min(_995, 4);
                float _1045 = fma(_959, _889, _59);
                float _1047 = fma(_781, _1033, _57);
                float _1049 = _993 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float _1051 = fma(_889, _1041, _59);
                float _1053 = float(_1043);
                float _1055 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[16].w;
                float _1057 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float _1059 = _1051 * (*spvDescriptorSet0.fp_c3)._m0[16].w;
                float2 _2906 = float2(_1049, _1055);
                float _1061 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2906, float2(0.0), isnan(_2906)), level(_1053)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2906, float2(0.0), isnan(_2906)), level(_1053)).x;
                float2 _2915 = float2(_1057, _1059);
                float _1063 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2915, float2(0.0), isnan(_2915)), level(_1053)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2915, float2(0.0), isnan(_2915)), level(_1053)).x;
                float _1065 = fma(_1045, 2.0, -1.0);
                float _1067 = fma(_993, 2.0, -1.0);
                float _1069 = fma(_1051, 2.0, -1.0);
                float _1071 = fma(_1047, 2.0, -1.0);
                float _1073 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _1075 = _1065 * _1073;
                float _1077 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _1079 = _1065 * _1077;
                float _1081 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _1083 = _1065 * _1081;
                float _1085 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _1087 = _1065 * _1085;
                float _1089 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1075);
                float _1091 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[4].x, _1079);
                float _1093 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _1095 = _1069 * _1093;
                float _1097 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[3].x, _1083);
                float _1099 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1087);
                float _1101 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _1103 = _1069 * _1101;
                float _1105 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1095);
                float _1107 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _1109 = _1069 * _1107;
                float _1111 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _1113 = _1069 * _1111;
                float _1115 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1103);
                int _1117 = _899 + 1;
                float _1119 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[3].x, _1109);
                bool _1121 = _1117 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                float _1123 = fma(_1061, 2.0, -1.0);
                float _1125 = fma(_1071, (*spvDescriptorSet0.fp_c3)._m0[4].x, _1113);
                float _1127 = fma(_1063, 2.0, -1.0);
                float _1129 = fma(_1123, (*spvDescriptorSet0.fp_c3)._m0[5].z, _1099);
                float _1131 = fma(_1123, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1089);
                float _1133 = fma(_1123, (*spvDescriptorSet0.fp_c3)._m0[3].z, _1097);
                float _1135 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[5].z, _1105);
                float _1137 = _1129 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _1139 = fma(_1123, (*spvDescriptorSet0.fp_c3)._m0[4].z, _1091);
                float _1141 = _1131 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _1143 = _1135 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _1145 = _1133 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _1147 = _1139 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _1149 = 1.0 / _1137;
                float _1151 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[3].z, _1119);
                float _1153 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1115);
                float _1155 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[4].z, _1125);
                float _1157 = _1151 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _1159 = _1153 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _1161 = _1155 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _1163 = 1.0 / _1143;
                float _1165 = -_433;
                float _1167 = fma(_1141, _1149, _1165);
                float _1169 = -_435;
                float _1171 = fma(_1145, _1149, _1169);
                float _1173 = -_437;
                float _1175 = fma(_1147, _1149, _1173);
                float _1177 = _1171 * _1171;
                float _1179 = -_435;
                float _1181 = fma(_1157, _1163, _1179);
                float _1183 = -_433;
                float _1185 = fma(_1159, _1163, _1183);
                float _1187 = fma(_1167, _1167, _1177);
                float _1189 = -_437;
                float _1191 = fma(_1161, _1163, _1189);
                float _1193 = _1181 * _1181;
                float _1195 = -_1171;
                float _1197 = _807 * _1195;
                float _1199 = fma(_1175, _1175, _1187);
                float _1201 = -_1181;
                float _1203 = _807 * _1201;
                float _1205 = fma(_1185, _1185, _1193);
                float _1207 = -_805;
                float _1209 = fma(_1207, _1167, _1197);
                float _1211 = -_1199;
                float _1213 = fma(_1211, _891, 1.0);
                float _1215 = -_805;
                float _1217 = fma(_1215, _1185, _1203);
                float _1219 = fma(_1191, _1191, _1205);
                float _1221 = _1199 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _1223 = -_809;
                float _1225 = fma(_1223, _1175, _1209);
                float _1227 = precise::max(0.0, _1213);
                float _1229 = -_1219;
                float _1231 = fma(_1229, _891, 1.0);
                float _1233 = _1219 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _1235 = -_809;
                float _1237 = fma(_1235, _1191, _1217);
                float _1239 = 1.0 / _1221;
                float _1241 = _1227 * _1227;
                float _1243 = precise::max(0.0, _1231);
                float _1245 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _1247 = _1225 + _1245;
                float _1249 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _1251 = _1237 + _1249;
                float _1253 = _1227 * _1241;
                float _1255 = _1243 * _1243;
                float _1257 = 1.0 / _1233;
                float _1259 = precise::max(_1247, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1261 = _1253 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1263 = _1243 * _1255;
                float _1265 = precise::max(_1251, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1267 = _1261 * _1259;
                float _1269 = _1263 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1271 = _1267 * _1239;
                float _1273 = _1269 * _1265;
                float _1275 = precise::max(_1271, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1277 = _1273 * _1257;
                float _1279 = precise::min(_1275, 1.0);
                float _1281 = precise::max(_1277, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1283 = precise::min(_1281, 1.0);
                float _1285 = _1279 + _1283;
                float _1287 = fma(_1285, (*spvDescriptorSet0.fp_c3)._m0[9].y, _901);
                _897 = !_1121;
                _893 = _1117;
                _895 = _1287;
                _1289 = _1287;
            } while (_897);
            _1291 = true;
        }
        else
        {
            _1289 = 0.0;
        }
        _1291 = false;
        float _1293 = _1289;
        float _1295 = fma(_781, (*spvDescriptorSet0.fp_c3)._m0[0].x, -1.0);
        float _1297 = _1293 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
        float _1299 = fma(_57, 2.0, -1.0);
        float _1301 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].z;
        float _1303 = fma(_59, 2.0, -1.0);
        float _1305 = precise::min(_1295, 1.0);
        float _1307 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].x;
        float _1309 = abs(_1299);
        float _1311 = _1309 + _1301;
        float _1313 = precise::clamp(_1311, 0.0, 1.0);
        float _1315 = _1305 * _1297;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        float _1319 = abs(_1303);
        float _1321 = _1319 + _1307;
        float _1323 = precise::clamp(_1321, 0.0, 1.0);
        float _1325 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[17].w;
        float _1327 = -_1317;
        float _1329 = _1327 + 1.0;
        float _1331 = _1323 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
        float _1333 = -_1325;
        float _1335 = fma(_1333, _1325, 1.0);
        float _1337 = abs(_1329);
        float _1339 = log2(_1337);
        float _1341 = -_1331;
        float _1343 = fma(_1341, _1331, _1335);
        float _1345 = _1339 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
        float _1347 = exp2(_1345);
        float _1349 = -_1347;
        float _1351 = _1349 + 1.0;
        float _1353 = _1351 * _1343;
        float _1355 = precise::clamp(_1353, 0.0, 1.0);
        float _1357 = _1355 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
        _813 = _1357;
    }
    float _1359 = _813;
    float _1361 = -_77;
    float _1363 = fma(_1361, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
    float _1365 = -_1359;
    float _1367 = _1365 + 1.0;
    bool _1369 = _77 != 1.0;
    bool _1371 = isnan(_77);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan(1.0);
    bool _1377 = _1373 || _1375;
    float _1379 = 1.0 / _1363;
    float _1381 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _1383 = fma(_1379, (*spvDescriptorSet0.fp_c3)._m0[8].w, _1381);
    int _1385 = _1377 ? as_type<int>(_1383) : 1065353216;
    out.m_34.x = _1367;
    out.m_34.y = as_type<float>(_1385);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

