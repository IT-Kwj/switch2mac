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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texturecube<float> fp_t_tcb_1E [[id(13)]];
    sampler fp_t_tcb_1ESmplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_10Smplr_w [[id(18)]];
    sampler fp_t_tcb_1ESmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_73 [[user(locn9), flat]];
    float4 m_52 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_50 [[user(locn12)]];
    float4 m_71 [[user(locn13), flat]];
    float4 m_63 [[user(locn14)]];
    float4 m_65 [[user(locn15)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _86 = gl_FragCoord.w;
    float _88 = in.m_46.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _86;
    float _102 = _100 * _92;
    float _104 = _100 * _98;
    float2 _862 = float2(_102, _104);
    float4 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_862, float2(0.0), isnan(_862))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_862, float2(0.0), isnan(_862))).xyzw;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    float _115 = _107.w;
    float _117 = in.m_48.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_50.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _100 * _121;
    float _131 = _100 * _127;
    float _133 = in.m_52.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_46.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_46.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _100 * _143;
    float _153 = _115 * _129;
    float _155 = 0.0 + _153;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _131;
    bool _163 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _165 = isnan(_159);
    bool _167 = _163 || _165;
    bool _169 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _171 = _167 || _169;
    float _173 = in.m_52.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    if (!_171)
    {
        discard_fragment();
    }
    float _179 = _100 * _149;
    float _181 = _100 * _177;
    float _183 = _100 * _137;
    float2 _974 = float2(_181, _183);
    float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_974, float2(0.0), isnan(_974))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_974, float2(0.0), isnan(_974))).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    float2 _988 = float2(_151, _179);
    float2 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_988, float2(0.0), isnan(_988))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_988, float2(0.0), isnan(_988))).xy;
    float _199 = _197.x;
    float _201 = _197.y;
    float _203 = in.m_48.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_48.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_54.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_54.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_48.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_54.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _100 * _207;
    float _241 = _100 * _213;
    float _243 = _100 * _225;
    float _245 = _100 * _237;
    float _247 = _109 * _189;
    float _249 = _111 * _191;
    float _251 = _100 * _219;
    float _253 = _100 * _231;
    float _255 = _113 * _193;
    float _257 = -_243;
    float _259 = _241 + _257;
    float _261 = -_251;
    float _263 = _239 + _261;
    float _265 = -_245;
    float _267 = _253 + _265;
    float _269 = fma(_249, _259, _243);
    float _271 = fma(_247, _263, _251);
    float _273 = fma(_255, _267, _245);
    if (!_171)
    {
        out.m_57.x = _271;
        out.m_57.y = _269;
        out.m_57.z = _273;
        out.m_57.w = _153;
        return out;
    }
    float _275 = in.m_59.w;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _100 * _279;
    bool _283 = _281 != 1.0;
    bool _285 = isnan(_281);
    bool _287 = _283 || _285;
    bool _289 = isnan(1.0);
    bool _291 = _287 || _289;
    bool _293 = !_291;
    if (!_293)
    {
        float _295 = gl_FragCoord.x;
        float _297 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _299 = _295 / _297;
        float _301 = gl_FragCoord.y;
        float _303 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _305 = _301 / _303;
        float _307 = _281 * 256.0;
        float _309 = trunc(_307);
        int _312 = int(_309);
        float _314 = trunc(_299);
        int _316 = int(_314);
        float _318 = trunc(_305);
        int _320 = int(_318);
        int _322 = _316 + 2;
        int _324 = _322 >> 1;
        uint _327 = uint(int(uint(_320) >> uint(1)));
        int _329 = _324 ^ int(_327);
        int _331 = _329 << 16;
        int _333 = _331 ^ _324;
        int _335 = 983055 & _333;
        uint _337 = uint(int(uint(_312) >> uint(7)));
        int _339 = int(_337) + _312;
        int _341 = _335 << 6;
        int _343 = _341 + _335;
        int _345 = _343 & 13369548;
        uint _347 = uint(int(uint(_345) >> uint(3)));
        int _349 = _345 | int(_347);
        int _351 = _349 & 5570560;
        int _353 = _349 & 85;
        uint _355 = uint(int(uint(_351) >> uint(15)));
        int _357 = int(_355) + _353;
        bool _359 = uint(_339) > uint(_357);
        if (!_359)
        {
            discard_fragment();
        }
        if (!_359)
        {
            out.m_57.x = _271;
            out.m_57.y = _269;
            out.m_57.z = _273;
            out.m_57.w = _159;
            return out;
        }
    }
    float _361 = in.m_61.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_61.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_63.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_63.x;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_61.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_63.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_65.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_65.x;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_65.z;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = _201 * _201;
    float _417 = fma(_199, _199, _415);
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = _100 * _365;
    float _423 = -_419;
    float _425 = _423 + 1.0;
    float _427 = _100 * _371;
    float _429 = _100 * _377;
    float _431 = _100 * _383;
    float _433 = _100 * _389;
    float _435 = _100 * _395;
    float _437 = _429 * _429;
    float _439 = _100 * _401;
    float _441 = _433 * _433;
    float _443 = _100 * _407;
    float _445 = fma(_431, _431, _437);
    float _447 = _439 * _439;
    float _449 = fma(_421, _421, _441);
    float _451 = _100 * _413;
    float _453 = fma(_435, _435, _445);
    float _455 = fma(_443, _443, _447);
    float _457 = fma(_427, _427, _449);
    float _459 = sqrt(_425);
    float _461 = fma(_451, _451, _455);
    float _463 = rsqrt(_453);
    float _465 = rsqrt(_457);
    float _467 = rsqrt(_461);
    float _469 = _201 * _463;
    float _471 = in.m_67.y;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_67.w;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = _429 * _469;
    float _485 = in.m_59.x;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = _199 * _465;
    float _493 = _431 * _469;
    float _495 = fma(_433, _491, _483);
    float _497 = _435 * _469;
    float _499 = fma(_421, _491, _493);
    float _501 = _459 * _467;
    float _503 = fma(_427, _491, _497);
    float _505 = fma(_439, _501, _495);
    float _507 = fma(_443, _501, _499);
    float _509 = fma(_451, _501, _503);
    float _511 = _505 * _505;
    float _513 = in.m_67.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = fma(_507, _507, _511);
    float _521 = fma(_509, _509, _519);
    float _523 = _100 * _475;
    float _525 = _100 * _481;
    float _527 = rsqrt(_521);
    float _529 = 1.0 / _525;
    float _531 = _507 * _527;
    float _533 = _505 * _527;
    float _535 = _509 * _527;
    float _537 = _100 * _517;
    float _539 = _100 * _489;
    float _541 = abs(_531);
    float _543 = abs(_533);
    float _545 = precise::max(_541, _543);
    float _547 = _537 * _529;
    float _549 = _523 * _529;
    float _551 = abs(_535);
    float _553 = precise::max(_551, _545);
    float _555 = precise::min(_539, 1.0);
    float _557 = 1.0 / _553;
    float _559 = _531 * _557;
    float _561 = _533 * _557;
    float2 _1523 = float2(_547, _549);
    float _563 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1523, float2(0.0), isnan(_1523))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1523, float2(0.0), isnan(_1523))).x;
    float _565 = -_557;
    float _567 = _535 * _565;
    float3 _1537 = float3(_559, _561, _567);
    float3 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1537, float3(0.0), isnan(_1537)), level(_555)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1537, float3(0.0), isnan(_1537)), level(_555)).xyz;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = in.m_69.y;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_69.x;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_71.y;
    float _591 = in.m_71.x;
    float _593 = in.m_69.z;
    float _595 = gl_FragCoord.w;
    float _597 = _593 * _595;
    float _599 = in.m_67.z;
    float _601 = gl_FragCoord.w;
    float _603 = _599 * _601;
    float _605 = in.m_71.z;
    float _607 = in.m_73.x;
    float _609 = in.m_75.z;
    float _611 = gl_FragCoord.w;
    float _613 = _609 * _611;
    float _615 = in.m_75.x;
    float _617 = gl_FragCoord.w;
    float _619 = _615 * _617;
    float _621 = in.m_75.y;
    float _623 = gl_FragCoord.w;
    float _625 = _621 * _623;
    float _627 = in.m_77.x;
    float _629 = gl_FragCoord.w;
    float _631 = _627 * _629;
    float _633 = in.m_77.w;
    float _635 = gl_FragCoord.w;
    float _637 = _633 * _635;
    float _639 = in.m_79.w;
    float _641 = gl_FragCoord.w;
    float _643 = _639 * _641;
    float _645 = in.m_79.y;
    float _647 = gl_FragCoord.w;
    float _649 = _645 * _647;
    float _651 = _100 * _581;
    float _653 = _100 * _587;
    float _655 = -_589;
    float _657 = _651 + _655;
    float _659 = -_591;
    float _661 = _653 + _659;
    float _663 = _100 * _597;
    float _665 = _100 * _603;
    float _667 = _657 * _657;
    float _669 = -_605;
    float _671 = _663 + _669;
    float _673 = _665 * _529;
    float _675 = fma(_661, _661, _667);
    float _677 = _607 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _679 = in.m_79.x;
    float _681 = gl_FragCoord.w;
    float _683 = _679 * _681;
    float _685 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _687 = fma(_673, (*spvDescriptorSet0.fp_c8)._m0[30].w, _685);
    float _689 = fma(_671, _671, _675);
    float _691 = in.m_79.z;
    float _693 = gl_FragCoord.w;
    float _695 = _691 * _693;
    float _697 = 1.0 / _687;
    float _699 = -_689;
    float _701 = fma(_677, _677, _699);
    float _703 = precise::max(0.0, _701);
    float _705 = in.m_77.z;
    float _707 = gl_FragCoord.w;
    float _709 = _705 * _707;
    float _711 = sqrt(_703);
    float _713 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _715 = _697 * _713;
    float _717 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _719 = fma(_563, (*spvDescriptorSet0.fp_c8)._m0[30].w, _717);
    float _721 = _100 * _625;
    float _723 = 1.0 / _719;
    float _725 = in.m_77.y;
    float _727 = gl_FragCoord.w;
    float _729 = _725 * _727;
    float _731 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _733 = -_715;
    float _735 = fma(_723, _731, _733);
    float _737 = _711 + _735;
    float _739 = _100 * _643;
    float _741 = _100 * _619;
    float _743 = -_739;
    float _745 = _743 + _737;
    float _747 = _745 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _749 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _751 = _100 * _637;
    float _753 = _747 * (-1.44269502162933349609375);
    float _755 = _100 * _683;
    float _757 = _100 * _695;
    float _759 = exp2(_753);
    float _761 = fma(_571, 0.20999999344348907470703125, _755);
    float _763 = _100 * _649;
    float _765 = _100 * _613;
    float _767 = fma(_575, 0.20999999344348907470703125, _757);
    float _769 = _100 * _631;
    float _771 = fma(_573, 0.20999999344348907470703125, _763);
    float _773 = _715;
    if (_749)
    {
        float _775 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _777 = _715 + _775;
        _773 = _777;
    }
    float _779 = _773;
    float _781 = _100 * _729;
    float _783 = _100 * _709;
    float _785 = _767 + _765;
    float _787 = _761 + _741;
    float _789 = _771 + _721;
    float _791 = _779;
    if (_749)
    {
        float _793 = _779 * 8.0;
        float _795 = precise::clamp(_793, 0.0, 1.0);
        _791 = _795;
    }
    float _797 = _791;
    float _799 = _273 * _785;
    float _801 = _271 * _787;
    float _803 = -_759;
    float _805 = _803 + 1.0;
    float _807 = precise::clamp(_805, 0.0, 1.0);
    float _809 = _269 * _789;
    float _811 = fma(_799, _751, _783);
    float _813 = fma(_801, _751, _769);
    float _815 = _159 * _807;
    float _817 = precise::clamp(_815, 0.0, 1.0);
    float _819 = fma(_809, _751, _781);
    float _821 = _817;
    if (_749)
    {
        float _823 = _817 * _797;
        _821 = _823;
    }
    float _825 = _821;
    float _827 = 0.0 + _825;
    float _829 = precise::clamp(_827, 0.0, 1.0);
    out.m_57.x = _813;
    out.m_57.y = _819;
    out.m_57.z = _811;
    out.m_57.w = _829;
    return out;
}

