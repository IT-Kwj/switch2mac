#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    device _23* vp_s0 [[id(1)]];
    texture3d<float> vp_t_tcb_8 [[id(2)]];
    sampler vp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> vp_t_tcb_A [[id(4)]];
    sampler vp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    sampler vp_t_tcb_8Smplr_w [[id(8)]];
    sampler vp_t_tcb_ASmplr_w [[id(9)]];
    sampler vp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _887 = false;
    bool _711 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _2668 = float3((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float4 _60 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2668, float3(0.0), isnan(_2668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2668, float3(0.0), isnan(_2668)), level(0.0)).xyzw;
    float _63 = _60.x;
    float _65 = _60.y;
    float _67 = _60.z;
    float _69 = _60.w;
    float _71 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _74 = as_type<int>(_71) * 32;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_77)] = as_type<uint>(_63);
    int _79 = _74 + 4;
    uint _81 = uint(int(uint(_79) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_81)] = as_type<uint>(_65);
    int _83 = _74 + 8;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_85)] = as_type<uint>(_67);
    int _87 = _74 + 12;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_89)] = as_type<uint>(_69);
    int _91 = -2;
    int _93 = 0;
    int _95 = 0;
    int _97 = 0;
    int _99 = 0;
    int _101 = 0;
    int _103 = 0;
    int _105 = 0;
    int _107 = 0;
    int _109 = 0;
    int _111 = 0;
    int _113 = 0;
    int _115 = 0;
    int _117 = 0;
    int _119 = 0;
    int _121 = 0;
    int _123 = 0;
    int _125 = 0;
    int _127 = 0;
    int _129 = 0;
    int _131 = 0;
    int _133 = 0;
    int _135 = 0;
    int _137 = 0;
    int _139 = 0;
    int _141 = 0;
    int _143 = 0;
    float _145 = 1000000.0;
    bool _149;
    bool _291;
    float _673;
    int _675;
    int _677;
    int _679;
    bool _687;
    int _689;
    int _743;
    int _745;
    int _751;
    int _757;
    int _763;
    int _769;
    int _775;
    int _781;
    int _787;
    int _793;
    int _799;
    int _805;
    int _811;
    int _817;
    int _823;
    int _829;
    bool _833;
    int _835;
    int _841;
    int _847;
    int _853;
    int _857;
    int _863;
    int _867;
    int _871;
    int _875;
    int _879;
    int _883;
    int _885;
    int _1245;
    int _1311;
    int _1313;
    int _1315;
    int _1317;
    int _1319;
    int _1321;
    int _1323;
    int _1325;
    int _1327;
    int _1329;
    int _1331;
    int _1333;
    int _1335;
    int _1337;
    int _1339;
    int _1341;
    int _1343;
    int _1345;
    int _1347;
    int _1349;
    int _1351;
    int _1353;
    int _1355;
    int _1357;
    int _1359;
    float _1361;
    int _1363;
    int _1377;
    int _1379;
    int _1381;
    int _1383;
    int _1385;
    int _1387;
    do
    {
        int _151 = _91;
        int _153 = _93;
        int _155 = _95;
        int _157 = _97;
        int _159 = _99;
        int _161 = _101;
        int _163 = _103;
        int _165 = _105;
        int _167 = _107;
        int _169 = _109;
        int _171 = _111;
        int _173 = _113;
        int _175 = _115;
        int _177 = _117;
        int _179 = _119;
        int _181 = _121;
        int _183 = _123;
        int _185 = _125;
        int _187 = _127;
        int _189 = _129;
        int _191 = _131;
        int _193 = _133;
        int _195 = _135;
        int _197 = _137;
        int _199 = _139;
        int _201 = _141;
        int _203 = _143;
        float _205 = _145;
        float _207 = float(_151);
        float _209 = _207 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _211 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _213 = fma(_209, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2789 = float2(_211, _213);
        float4 _215 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2789, float2(0.0), isnan(_2789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2789, float2(0.0), isnan(_2789)), level(0.0)).xyzw;
        float _217 = _215.x;
        float _219 = _215.y;
        float _221 = _215.z;
        float _223 = _215.w;
        int _225 = -2;
        float _227 = _219;
        float _229 = _223;
        float _231 = _221;
        float _233 = _217;
        int _235 = -2;
        int _237 = _153;
        int _239 = _155;
        int _241 = _157;
        int _243 = _159;
        int _245 = _161;
        int _247 = _163;
        int _249 = _165;
        int _251 = _167;
        int _253 = _169;
        int _255 = _171;
        int _257 = _173;
        int _259 = _175;
        int _261 = _177;
        int _263 = _179;
        int _265 = _181;
        int _267 = _183;
        int _269 = _185;
        int _271 = _187;
        int _273 = _189;
        int _275 = _191;
        int _277 = _193;
        int _279 = _195;
        int _281 = _197;
        int _283 = _199;
        int _285 = _201;
        int _287 = _203;
        float _289 = _205;
        do
        {
            int _293 = _225;
            float _295 = _227;
            float _297 = _229;
            float _299 = _231;
            float _301 = _233;
            int _303 = _235;
            int _305 = _237;
            int _307 = _239;
            int _309 = _241;
            int _311 = _243;
            int _313 = _245;
            int _315 = _247;
            int _317 = _249;
            int _319 = _251;
            int _321 = _253;
            int _323 = _255;
            int _325 = _257;
            int _327 = _259;
            int _329 = _261;
            int _331 = _263;
            int _333 = _265;
            int _335 = _267;
            int _337 = _269;
            int _339 = _271;
            int _341 = _273;
            int _343 = _275;
            int _345 = _277;
            int _347 = _279;
            int _349 = _281;
            int _351 = _283;
            int _353 = _285;
            int _355 = _287;
            float _357 = _289;
            int _359 = _293 + 1;
            float _361 = float(_151);
            float _363 = 0.0 + _295;
            float _365 = precise::clamp(_363, 0.0, 1.0);
            float _367 = _361 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _369 = float(_359);
            float _371 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _373 = fma(_367, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _375 = 0.0 + _297;
            float _377 = precise::clamp(_375, 0.0, 1.0);
            float _379 = fma(_369, _371, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _381 = 0.0 + _299;
            float _383 = precise::clamp(_381, 0.0, 1.0);
            float _385 = 0.0 + _301;
            float _387 = precise::clamp(_385, 0.0, 1.0);
            float2 _2911 = float2(_379, _373);
            float4 _389 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2911, float2(0.0), isnan(_2911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2911, float2(0.0), isnan(_2911)), level(0.0)).xyzw;
            float _391 = _389.x;
            float _393 = _389.y;
            float _395 = _389.z;
            float _397 = _389.w;
            float _399 = _377 * 65535.0;
            float _401 = _383 * 65535.0;
            float _403 = _365 * 65535.0;
            float _405 = _387 * 65535.0;
            float _407 = rint(_399);
            int _409 = int(_407);
            float _411 = rint(_401);
            int _413 = int(_411);
            float _415 = rint(_403);
            int _417 = int(_415);
            uint _419 = extract_bits(uint(_409), 0u, 8u);
            int _421 = int(_419) & 255;
            uint _423 = extract_bits(uint(_409), 8u, 8u);
            int _425 = int(_423) & 255;
            int _427 = _425 << 8;
            int _429 = _421 | _427;
            float _431 = rint(_405);
            int _433 = int(_431);
            uint _435 = extract_bits(uint(_429), 0u, 8u);
            int _437 = int(_435) & 255;
            uint _439 = extract_bits(uint(_429), 8u, 8u);
            int _441 = int(_439) & 255;
            int _443 = _441 << 8;
            int _445 = _437 | _443;
            uint _447 = extract_bits(uint(_413), 0u, 8u);
            int _449 = int(_447) & 255;
            int _451 = _449 << 16;
            int _453 = _445 | _451;
            uint _455 = extract_bits(uint(_413), 8u, 8u);
            int _457 = int(_455) & 255;
            int _459 = _457 << 24;
            int _461 = _453 | _459;
            float _463 = float(_303);
            bool _465 = _461 != 0;
            uint _467 = extract_bits(uint(_417), 0u, 8u);
            int _469 = int(_467) & 255;
            uint _471 = extract_bits(uint(_417), 8u, 8u);
            int _473 = int(_471) & 255;
            int _475 = _473 << 8;
            int _477 = _469 | _475;
            float _479 = fma(_463, _371, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _481 = extract_bits(uint(_477), 0u, 8u);
            int _483 = int(_481) & 255;
            uint _485 = extract_bits(uint(_477), 8u, 8u);
            int _487 = int(_485) & 255;
            int _489 = _487 << 8;
            int _491 = _483 | _489;
            uint _493 = extract_bits(uint(_433), 0u, 8u);
            int _495 = int(_493) & 255;
            int _497 = _495 << 16;
            int _499 = _491 | _497;
            uint _501 = extract_bits(uint(_433), 8u, 8u);
            int _503 = int(_501) & 255;
            int _505 = _503 << 24;
            int _507 = _499 | _505;
            bool _509 = _507 != 0;
            bool _511 = _509 || _465;
            bool _513 = !_511;
            _225 = _359;
            _227 = _393;
            _229 = _397;
            _231 = _395;
            _233 = _391;
            int _515 = _315;
            int _517 = _307;
            int _519 = _309;
            int _521 = _311;
            int _523 = _313;
            int _525 = _317;
            int _527 = _319;
            int _529 = _329;
            int _531 = _321;
            int _533 = _323;
            int _535 = _325;
            int _537 = _327;
            int _539 = _331;
            int _541 = _333;
            int _543 = _343;
            int _545 = _335;
            int _547 = _337;
            int _549 = _339;
            int _551 = _341;
            int _553 = _345;
            int _555 = _347;
            int _557 = _349;
            int _559 = _351;
            int _561 = _353;
            int _563 = _355;
            int _565 = _461;
            int _567 = _307;
            int _569 = _309;
            int _571 = _311;
            int _573 = _313;
            int _575 = _351;
            int _577 = _353;
            int _579 = _355;
            int _581 = _315;
            int _583 = _317;
            int _585 = _319;
            int _587 = _321;
            int _589 = _323;
            int _591 = _325;
            int _593 = _327;
            int _595 = _329;
            int _597 = _331;
            int _599 = _333;
            int _601 = _335;
            int _603 = _337;
            int _605 = _339;
            int _607 = _341;
            int _609 = _349;
            int _611 = _347;
            int _613 = _345;
            int _615 = _305;
            int _617 = _307;
            int _619 = _309;
            int _621 = _311;
            int _623 = _313;
            int _625 = _315;
            int _627 = _317;
            int _629 = _319;
            int _631 = _321;
            int _633 = _323;
            int _635 = _325;
            int _637 = _327;
            int _639 = _329;
            int _641 = _331;
            int _643 = _333;
            int _645 = _335;
            int _647 = _337;
            int _649 = _339;
            int _651 = _341;
            int _653 = _343;
            int _655 = _345;
            int _657 = _347;
            int _659 = _349;
            int _661 = _351;
            int _663 = _353;
            int _665 = _355;
            int _667 = _433;
            int _669 = _461;
            int _671 = as_type<int>(_463);
            _673 = _357;
            _675 = _507;
            _677 = _461;
            _679 = as_type<int>(_395);
            if (!_513)
            {
                bool _681 = _305 > 0;
                bool _683 = !_681;
                if (!_683)
                {
                    int _685 = 0;
                    do
                    {
                        _689 = _685;
                        int _691 = _689 * 8;
                        uint _693 = uint(int(uint(_691) >> uint(2)));
                        float _695 = as_type<float>(_31[int(_693)]);
                        int _697 = _691 + 4;
                        uint _699 = uint(int(uint(_697) >> uint(2)));
                        float _701 = as_type<float>(_31[int(_699)]);
                        bool _703 = as_type<int>(_695) != _461;
                        bool _705 = as_type<int>(_701) != _507;
                        bool _707 = _705 || _703;
                        bool _709 = !_707;
                        _711 = _709;
                        if (_711)
                        {
                            break;
                        }
                        int _713 = _689 + 1;
                        bool _715 = _713 >= _305;
                        _687 = !_715;
                        _685 = _713;
                    } while (_687);
                }
                if (!_711)
                {
                    int _717 = _305 * 4;
                    int _719 = _305 * 8;
                    int _721 = _305 + 1;
                    bool _723 = _717 == 16;
                    bool _725 = _717 == 0;
                    uint _727 = uint(int(uint(_719) >> uint(2)));
                    _31[int(_727)] = uint(_461);
                    int _729 = _719 + 4;
                    uint _731 = uint(int(uint(_729) >> uint(2)));
                    _31[int(_731)] = uint(_507);
                    bool _733 = _717 == 4;
                    bool _735 = _717 == 8;
                    bool _737 = _717 == 12;
                    bool _739 = _717 == 20;
                    bool _741 = _717 == 24;
                    _615 = _721;
                    _667 = _719;
                    _671 = _717;
                    _743 = _719;
                    _745 = _717;
                    if (_723)
                    {
                        _515 = 1;
                    }
                    int _747 = _515;
                    bool _749 = _717 == 44;
                    _625 = _747;
                    _751 = _747;
                    if (_725)
                    {
                        _517 = 1;
                    }
                    int _753 = _517;
                    bool _755 = _717 == 28;
                    _617 = _753;
                    _757 = _753;
                    if (_733)
                    {
                        _519 = 1;
                    }
                    int _759 = _519;
                    bool _761 = _717 == 32;
                    _619 = _759;
                    _763 = _759;
                    if (_735)
                    {
                        _521 = 1;
                    }
                    int _765 = _521;
                    bool _767 = _717 == 36;
                    _621 = _765;
                    _769 = _765;
                    if (_737)
                    {
                        _523 = 1;
                    }
                    int _771 = _523;
                    bool _773 = _717 == 40;
                    _623 = _771;
                    _775 = _771;
                    if (_739)
                    {
                        _525 = 1;
                    }
                    int _777 = _525;
                    bool _779 = _717 == 48;
                    _627 = _777;
                    _781 = _777;
                    if (_741)
                    {
                        _527 = 1;
                    }
                    int _783 = _527;
                    bool _785 = _717 == 52;
                    _629 = _783;
                    _787 = _783;
                    if (_749)
                    {
                        _529 = 1;
                    }
                    int _789 = _529;
                    bool _791 = _717 == 72;
                    _639 = _789;
                    _793 = _789;
                    if (_755)
                    {
                        _531 = 1;
                    }
                    int _795 = _531;
                    bool _797 = _717 == 56;
                    _631 = _795;
                    _799 = _795;
                    if (_761)
                    {
                        _533 = 1;
                    }
                    int _801 = _533;
                    bool _803 = _717 == 60;
                    _633 = _801;
                    _805 = _801;
                    if (_767)
                    {
                        _535 = 1;
                    }
                    int _807 = _535;
                    bool _809 = _717 == 64;
                    _635 = _807;
                    _811 = _807;
                    if (_773)
                    {
                        _537 = 1;
                    }
                    int _813 = _537;
                    bool _815 = _717 == 68;
                    _637 = _813;
                    _817 = _813;
                    if (_779)
                    {
                        _539 = 1;
                    }
                    int _819 = _539;
                    bool _821 = _717 == 76;
                    _641 = _819;
                    _823 = _819;
                    if (_785)
                    {
                        _541 = 1;
                    }
                    int _825 = _541;
                    bool _827 = _717 == 80;
                    _643 = _825;
                    _829 = _825;
                    if (_791)
                    {
                        _543 = 1;
                    }
                    int _831 = _543;
                    _833 = _721 != 25;
                    _653 = _831;
                    _835 = _831;
                    if (_797)
                    {
                        _545 = 1;
                    }
                    int _837 = _545;
                    bool _839 = _717 == 84;
                    _645 = _837;
                    _841 = _837;
                    if (_803)
                    {
                        _547 = 1;
                    }
                    int _843 = _547;
                    bool _845 = _717 == 88;
                    _647 = _843;
                    _847 = _843;
                    if (_809)
                    {
                        _549 = 1;
                    }
                    int _849 = _549;
                    bool _851 = _717 == 92;
                    _649 = _849;
                    _853 = _849;
                    if (_815)
                    {
                        _551 = 1;
                    }
                    int _855 = _551;
                    _651 = _855;
                    _857 = _855;
                    if (_821)
                    {
                        _553 = 1;
                    }
                    int _859 = _553;
                    bool _861 = _717 == 96;
                    _655 = _859;
                    _863 = _859;
                    if (_827)
                    {
                        _555 = 1;
                    }
                    int _865 = _555;
                    _657 = _865;
                    _867 = _865;
                    if (_839)
                    {
                        _557 = 1;
                    }
                    int _869 = _557;
                    _659 = _869;
                    _871 = _869;
                    if (_845)
                    {
                        _559 = 1;
                    }
                    int _873 = _559;
                    _661 = _873;
                    _875 = _873;
                    if (_851)
                    {
                        _561 = 1;
                    }
                    int _877 = _561;
                    _663 = _877;
                    _879 = _877;
                    if (_861)
                    {
                        _563 = 1;
                    }
                    int _881 = _563;
                    _665 = _881;
                    _883 = _881;
                }
                if ((!_833) || _711)
                {
                    if (!_711)
                    {
                        _885 = 25;
                        _887 = true;
                        if (_887)
                        {
                            break;
                        }
                    }
                    _711 = false;
                    int _889 = _689 * 4;
                    bool _891 = _889 == 0;
                    bool _893 = _889 == 4;
                    bool _895 = _889 == 8;
                    bool _897 = _889 == 12;
                    bool _899 = _889 == 88;
                    bool _901 = _889 == 92;
                    bool _903 = _889 == 96;
                    if (_891)
                    {
                        _565 = _307;
                    }
                    int _905 = _565;
                    bool _907 = _889 == 16;
                    int _909 = _905;
                    if (_893)
                    {
                        _909 = _309;
                    }
                    int _911 = _909;
                    bool _913 = _889 == 20;
                    int _915 = _911;
                    if (_895)
                    {
                        _915 = _311;
                    }
                    int _917 = _915;
                    bool _919 = _889 == 24;
                    int _921 = _917;
                    if (_897)
                    {
                        _921 = _313;
                    }
                    int _923 = _921;
                    bool _925 = _889 == 84;
                    int _927 = int(_919);
                    int _929 = _913 ? 2 : 0;
                    int _931 = _927 | _929;
                    int _933 = _907 ? 4 : 0;
                    int _935 = _931 | _933;
                    int _937 = _925 ? 8 : 0;
                    int _939 = _935 | _937;
                    int _941 = _899 ? 16 : 0;
                    int _943 = _939 | _941;
                    int _945 = _901 ? 32 : 0;
                    int _947 = _943 | _945;
                    int _949 = _903 ? 64 : 0;
                    int _951 = _947 | _949;
                    int _953 = _951 & 8;
                    int _955 = _923;
                    if (_907)
                    {
                        _955 = _315;
                    }
                    int _957 = _955;
                    bool _959 = _889 == 80;
                    int _961 = _957;
                    if (_913)
                    {
                        _961 = _317;
                    }
                    int _963 = _961;
                    bool _965 = _889 == 76;
                    int _967 = _963;
                    if (_919)
                    {
                        _967 = _319;
                    }
                    int _969 = _967;
                    bool _971 = _889 == 28;
                    int _973 = int(_971);
                    int _975 = _965 ? 2 : 0;
                    int _977 = _973 | _975;
                    int _979 = _959 ? 4 : 0;
                    int _981 = _977 | _979;
                    int _983 = _925 ? 8 : 0;
                    int _985 = _981 | _983;
                    int _987 = _899 ? 16 : 0;
                    int _989 = _985 | _987;
                    int _991 = _901 ? 32 : 0;
                    int _993 = _989 | _991;
                    int _995 = _903 ? 64 : 0;
                    int _997 = _993 | _995;
                    int _999 = _997 & 2;
                    int _1001 = int(_971);
                    int _1003 = _965 ? 2 : 0;
                    int _1005 = _1001 | _1003;
                    int _1007 = _959 ? 4 : 0;
                    int _1009 = _1005 | _1007;
                    int _1011 = _925 ? 8 : 0;
                    int _1013 = _1009 | _1011;
                    int _1015 = _899 ? 16 : 0;
                    int _1017 = _1013 | _1015;
                    int _1019 = _901 ? 32 : 0;
                    int _1021 = _1017 | _1019;
                    int _1023 = _903 ? 64 : 0;
                    int _1025 = _1021 | _1023;
                    int _1027 = _1025 & 4;
                    int _1029 = _969;
                    _667 = _999;
                    _671 = _1027;
                    if (_971)
                    {
                        _1029 = _321;
                    }
                    int _1031 = _1029;
                    bool _1033 = _889 == 32;
                    int _1035 = _1031;
                    if (_1033)
                    {
                        _1035 = _323;
                    }
                    int _1037 = _1035;
                    bool _1039 = _889 == 36;
                    int _1041 = _1037;
                    if (_1039)
                    {
                        _1041 = _325;
                    }
                    int _1043 = _1041;
                    bool _1045 = _889 == 40;
                    int _1047 = _1043;
                    if (_1045)
                    {
                        _1047 = _327;
                    }
                    int _1049 = _1047;
                    bool _1051 = _889 == 44;
                    int _1053 = _1049;
                    if (_1051)
                    {
                        _1053 = _329;
                    }
                    int _1055 = _1053;
                    bool _1057 = _889 == 48;
                    int _1059 = _1055;
                    if (_1057)
                    {
                        _1059 = _331;
                    }
                    int _1061 = _1059;
                    bool _1063 = _889 == 52;
                    int _1065 = _1061;
                    if (_1063)
                    {
                        _1065 = _333;
                    }
                    int _1067 = _1065;
                    bool _1069 = _889 == 56;
                    int _1071 = _1067;
                    if (_1069)
                    {
                        _1071 = _335;
                    }
                    int _1073 = _1071;
                    bool _1075 = _889 == 60;
                    int _1077 = _1073;
                    if (_1075)
                    {
                        _1077 = _337;
                    }
                    int _1079 = _1077;
                    bool _1081 = _889 == 64;
                    int _1083 = _1079;
                    if (_1081)
                    {
                        _1083 = _339;
                    }
                    int _1085 = _1083;
                    bool _1087 = _889 == 68;
                    int _1089 = _1085;
                    if (_1087)
                    {
                        _1089 = _341;
                    }
                    int _1091 = _1089;
                    bool _1093 = _889 == 72;
                    int _1095 = int(_1093);
                    int _1097 = _965 ? 2 : 0;
                    int _1099 = _1095 | _1097;
                    int _1101 = _959 ? 4 : 0;
                    int _1103 = _1099 | _1101;
                    int _1105 = _925 ? 8 : 0;
                    int _1107 = _1103 | _1105;
                    int _1109 = _899 ? 16 : 0;
                    int _1111 = _1107 | _1109;
                    int _1113 = _901 ? 32 : 0;
                    int _1115 = _1111 | _1113;
                    int _1117 = _903 ? 64 : 0;
                    int _1119 = _1115 | _1117;
                    int _1121 = _1119 & 1;
                    int _1123 = _1091;
                    if (_1093)
                    {
                        _1123 = _343;
                    }
                    int _1125 = _1123;
                    bool _1127 = _889 == 4;
                    int _1129 = _1125;
                    if (_965)
                    {
                        _1129 = _345;
                    }
                    int _1131 = _1129;
                    int _1133 = _1131;
                    if (_959)
                    {
                        _1133 = _347;
                    }
                    int _1135 = _1133;
                    int _1137 = _1135;
                    if (_925)
                    {
                        _1137 = _349;
                    }
                    int _1139 = _1137;
                    bool _1141 = _889 == 0;
                    int _1143 = _1139;
                    if (_899)
                    {
                        _1143 = _351;
                    }
                    int _1145 = _1143;
                    bool _1147 = _889 == 8;
                    int _1149 = _1145;
                    if (_901)
                    {
                        _1149 = _353;
                    }
                    int _1151 = _1149;
                    bool _1153 = _889 == 12;
                    int _1155 = _1151;
                    if (_903)
                    {
                        _1155 = _355;
                    }
                    int _1157 = _1155;
                    int _1159 = _1157 + 1;
                    _669 = _1159;
                    if (_1141)
                    {
                        _567 = _1159;
                    }
                    int _1161 = _567;
                    bool _1163 = _889 == 16;
                    _617 = _1161;
                    if (_1127)
                    {
                        _569 = _1159;
                    }
                    int _1165 = _569;
                    bool _1167 = _889 == 20;
                    _619 = _1165;
                    if (_1147)
                    {
                        _571 = _1159;
                    }
                    int _1169 = _571;
                    bool _1171 = _889 == 24;
                    _621 = _1169;
                    if (_1153)
                    {
                        _573 = _1159;
                    }
                    int _1173 = _573;
                    bool _1175 = _889 == 28;
                    _623 = _1173;
                    if (_899)
                    {
                        _575 = _1159;
                    }
                    int _1177 = _575;
                    _661 = _1177;
                    if (_901)
                    {
                        _577 = _1159;
                    }
                    int _1179 = _577;
                    _663 = _1179;
                    if (_903)
                    {
                        _579 = _1159;
                    }
                    int _1181 = _579;
                    _665 = _1181;
                    if (_1163)
                    {
                        _581 = _1159;
                    }
                    int _1183 = _581;
                    bool _1185 = _889 == 32;
                    _625 = _1183;
                    if (_1167)
                    {
                        _583 = _1159;
                    }
                    int _1187 = _583;
                    bool _1189 = _889 == 36;
                    _627 = _1187;
                    if (_1171)
                    {
                        _585 = _1159;
                    }
                    int _1191 = _585;
                    bool _1193 = _889 == 40;
                    _629 = _1191;
                    if (_1175)
                    {
                        _587 = _1159;
                    }
                    int _1195 = _587;
                    bool _1197 = _889 == 44;
                    _631 = _1195;
                    if (_1185)
                    {
                        _589 = _1159;
                    }
                    int _1199 = _589;
                    bool _1201 = _889 == 48;
                    _633 = _1199;
                    if (_1189)
                    {
                        _591 = _1159;
                    }
                    int _1203 = _591;
                    bool _1205 = _889 == 52;
                    _635 = _1203;
                    if (_1193)
                    {
                        _593 = _1159;
                    }
                    int _1207 = _593;
                    bool _1209 = _889 == 56;
                    _637 = _1207;
                    if (_1197)
                    {
                        _595 = _1159;
                    }
                    int _1211 = _595;
                    bool _1213 = _889 == 60;
                    _639 = _1211;
                    if (_1201)
                    {
                        _597 = _1159;
                    }
                    int _1215 = _597;
                    bool _1217 = _889 == 64;
                    _641 = _1215;
                    if (_1205)
                    {
                        _599 = _1159;
                    }
                    int _1219 = _599;
                    bool _1221 = _889 == 68;
                    _643 = _1219;
                    if (_1209)
                    {
                        _601 = _1159;
                    }
                    int _1223 = _601;
                    bool _1225 = _953 != 0;
                    _645 = _1223;
                    if (_1213)
                    {
                        _603 = _1159;
                    }
                    int _1227 = _603;
                    bool _1229 = _1027 != 0;
                    _647 = _1227;
                    if (_1217)
                    {
                        _605 = _1159;
                    }
                    int _1231 = _605;
                    bool _1233 = _999 != 0;
                    _649 = _1231;
                    if (_1221)
                    {
                        _607 = _1159;
                    }
                    int _1235 = _607;
                    bool _1237 = _1121 != 0;
                    _651 = _1235;
                    if (_1225)
                    {
                        _609 = _1159;
                    }
                    int _1239 = _609;
                    _659 = _1239;
                    if (_1229)
                    {
                        _611 = _1159;
                    }
                    int _1241 = _611;
                    _657 = _1241;
                    if (_1233)
                    {
                        _613 = _1159;
                    }
                    int _1243 = _613;
                    _655 = _1243;
                    if (_1237)
                    {
                        _653 = _1159;
                    }
                }
            }
            _1245 = _615;
            int _1247 = _617;
            int _1249 = _619;
            int _1251 = _621;
            int _1253 = _623;
            int _1255 = _625;
            int _1257 = _627;
            int _1259 = _629;
            int _1261 = _631;
            int _1263 = _633;
            int _1265 = _635;
            int _1267 = _637;
            int _1269 = _639;
            int _1271 = _641;
            int _1273 = _643;
            int _1275 = _645;
            int _1277 = _647;
            int _1279 = _649;
            int _1281 = _651;
            int _1283 = _653;
            int _1285 = _655;
            int _1287 = _657;
            int _1289 = _659;
            int _1291 = _661;
            int _1293 = _663;
            int _1295 = _665;
            int _1297 = _667;
            int _1299 = _669;
            int _1301 = _671;
            float2 _4068 = float2(_479, _373);
            float _1303 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4068, float2(0.0), isnan(_4068)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4068, float2(0.0), isnan(_4068)), level(0.0)).x;
            int _1305 = _303 + 1;
            bool _1307 = _1305 >= 3;
            float _1309 = precise::min(_1303, _357);
            _291 = !_1307;
            _235 = _1305;
            _237 = _1245;
            _239 = _1247;
            _241 = _1249;
            _243 = _1251;
            _245 = _1253;
            _247 = _1255;
            _249 = _1257;
            _251 = _1259;
            _253 = _1261;
            _255 = _1263;
            _257 = _1265;
            _259 = _1267;
            _261 = _1269;
            _263 = _1271;
            _265 = _1273;
            _267 = _1275;
            _269 = _1277;
            _271 = _1279;
            _273 = _1281;
            _275 = _1283;
            _277 = _1285;
            _279 = _1287;
            _281 = _1289;
            _283 = _1291;
            _285 = _1293;
            _287 = _1295;
            _289 = _1309;
            _757 = _1247;
            _763 = _1249;
            _769 = _1251;
            _775 = _1253;
            _751 = _1255;
            _781 = _1257;
            _787 = _1259;
            _799 = _1261;
            _805 = _1263;
            _811 = _1265;
            _817 = _1267;
            _793 = _1269;
            _823 = _1271;
            _829 = _1273;
            _841 = _1275;
            _847 = _1277;
            _853 = _1279;
            _857 = _1281;
            _835 = _1283;
            _863 = _1285;
            _867 = _1287;
            _871 = _1289;
            _875 = _1291;
            _879 = _1293;
            _883 = _1295;
            _673 = _1309;
            _675 = as_type<int>(_1303);
            _743 = _1297;
            _677 = _1299;
            _745 = _1301;
        } while (_291);
        if (!_887)
        {
            _885 = _1245;
        }
        _887 = false;
        _1311 = _757;
        _1313 = _763;
        _1315 = _769;
        _1317 = _775;
        _1319 = _751;
        _1321 = _781;
        _1323 = _787;
        _1325 = _799;
        _1327 = _805;
        _1329 = _811;
        _1331 = _817;
        _1333 = _793;
        _1335 = _823;
        _1337 = _829;
        _1339 = _841;
        _1341 = _847;
        _1343 = _853;
        _1345 = _857;
        _1347 = _835;
        _1349 = _863;
        _1351 = _867;
        _1353 = _871;
        _1355 = _875;
        _1357 = _879;
        _1359 = _883;
        _1361 = _673;
        _1363 = _885;
        int _1365 = _675;
        int _1367 = _743;
        int _1369 = _677;
        int _1371 = _745;
        int _1373 = _151 + 1;
        bool _1375 = _1373 >= 3;
        _149 = !_1375;
        _91 = _1373;
        _93 = _1363;
        _95 = _1311;
        _97 = _1313;
        _99 = _1315;
        _101 = _1317;
        _103 = _1319;
        _105 = _1321;
        _107 = _1323;
        _109 = _1325;
        _111 = _1327;
        _113 = _1329;
        _115 = _1331;
        _117 = _1333;
        _119 = _1335;
        _121 = _1337;
        _123 = _1339;
        _125 = _1341;
        _127 = _1343;
        _129 = _1345;
        _131 = _1347;
        _133 = _1349;
        _135 = _1351;
        _137 = _1353;
        _139 = _1355;
        _141 = _1357;
        _143 = _1359;
        _145 = _1361;
        _1377 = _1365;
        _1379 = _1367;
        _1381 = _1369;
        _1383 = _1371;
        _1385 = _1365;
        _1387 = _1311;
    } while (_149);
    bool _1389 = _1363 > 0;
    if (!_1389)
    {
        _679 = 0;
    }
    int _1391 = _679;
    bool _1393 = !_1389;
    int _1395 = _1391;
    if (!_1393)
    {
        bool _1397 = _1363 > 3;
        bool _1399 = !_1397;
        int _1401 = 0;
        int _1403 = 0;
        int _1405 = 0;
        int _1407 = 0;
        int _1409 = 0;
        int _1411 = -1;
        int _1413 = 0;
        if (!_1399)
        {
            int _1415 = _1363 + (-3);
            _1411 = 0;
            bool _1417;
            do
            {
                int _1419 = _1401;
                int _1421 = _1403;
                int _1423 = _1377;
                int _1425 = _1379;
                int _1427 = _1381;
                int _1429 = _1405;
                int _1431 = _1383;
                int _1433 = _1419 * 4;
                int _1435 = _1419 + 1;
                int _1437 = _1419 + 2;
                bool _1439 = _1433 == 0;
                int _1441 = _1435 * 4;
                bool _1443 = _1433 == 4;
                int _1445 = _1437 * 4;
                bool _1447 = _1433 == 8;
                bool _1449 = _1433 == 12;
                bool _1451 = _1433 == 16;
                bool _1453 = _1441 == 8;
                int _1455 = _1419 + 3;
                int _1457 = _1423;
                int _1459 = _1425;
                int _1461 = _1427;
                int _1463 = _1431;
                int _1465 = _1421;
                int _1467 = _1429;
                if (_1439)
                {
                    _1457 = _1311;
                }
                int _1469 = _1457;
                bool _1471 = _1433 == 24;
                int _1473 = _1469;
                if (_1443)
                {
                    _1473 = _1313;
                }
                int _1475 = _1473;
                bool _1477 = _1433 == 20;
                int _1479 = _1475;
                if (_1447)
                {
                    _1479 = _1315;
                }
                int _1481 = _1479;
                bool _1483 = _1433 == 32;
                int _1485 = _1481;
                if (_1449)
                {
                    _1485 = _1317;
                }
                int _1487 = _1485;
                bool _1489 = _1433 == 28;
                int _1491 = _1487;
                if (_1451)
                {
                    _1491 = _1319;
                }
                int _1493 = _1491;
                bool _1495 = _1433 == 40;
                int _1497 = _1455 * 4;
                int _1499 = _1493;
                if (_1477)
                {
                    _1499 = _1321;
                }
                int _1501 = _1499;
                bool _1503 = _1433 == 36;
                int _1505 = _1501;
                if (_1471)
                {
                    _1505 = _1323;
                }
                int _1507 = _1505;
                bool _1509 = _1441 == 0;
                int _1511 = _1507;
                if (_1489)
                {
                    _1511 = _1325;
                }
                int _1513 = _1511;
                bool _1515 = _1441 == 4;
                int _1517 = _1513;
                if (_1483)
                {
                    _1517 = _1327;
                }
                int _1519 = _1517;
                bool _1521 = _1441 == 12;
                int _1523 = _1519;
                if (_1503)
                {
                    _1523 = _1329;
                }
                int _1525 = _1523;
                bool _1527 = _1433 == 44;
                int _1529 = _1525;
                if (_1495)
                {
                    _1529 = _1331;
                }
                int _1531 = _1529;
                bool _1533 = _1441 == 16;
                int _1535 = _1531;
                if (_1509)
                {
                    _1459 = _1311;
                }
                int _1537 = _1459;
                bool _1539 = _1433 == 48;
                int _1541 = _1537;
                if (_1515)
                {
                    _1541 = _1313;
                }
                int _1543 = _1541;
                bool _1545 = _1441 == 20;
                int _1547 = _1543;
                if (_1453)
                {
                    _1547 = _1315;
                }
                int _1549 = _1547;
                bool _1551 = _1441 == 24;
                int _1553 = _1549;
                if (_1521)
                {
                    _1553 = _1317;
                }
                int _1555 = _1553;
                bool _1557 = _1441 == 28;
                int _1559 = _1555;
                if (_1527)
                {
                    _1535 = _1333;
                }
                int _1561 = _1535;
                bool _1563 = _1433 == 52;
                int _1565 = _1561;
                if (_1533)
                {
                    _1559 = _1319;
                }
                int _1567 = _1559;
                bool _1569 = _1441 == 32;
                int _1571 = _1567;
                if (_1539)
                {
                    _1565 = _1335;
                }
                int _1573 = _1565;
                bool _1575 = _1433 == 56;
                int _1577 = _1573;
                if (_1545)
                {
                    _1571 = _1321;
                }
                int _1579 = _1571;
                bool _1581 = _1441 == 36;
                int _1583 = _1579;
                if (_1551)
                {
                    _1583 = _1323;
                }
                int _1585 = _1583;
                bool _1587 = _1441 == 40;
                int _1589 = _1585;
                if (_1557)
                {
                    _1589 = _1325;
                }
                int _1591 = _1589;
                bool _1593 = _1441 == 44;
                int _1595 = _1591;
                if (_1563)
                {
                    _1577 = _1337;
                }
                int _1597 = _1577;
                bool _1599 = _1433 == 60;
                int _1601 = _1597;
                if (_1569)
                {
                    _1595 = _1327;
                }
                int _1603 = _1595;
                bool _1605 = _1441 == 48;
                int _1607 = _1603;
                if (_1575)
                {
                    _1601 = _1339;
                }
                int _1609 = _1601;
                bool _1611 = _1433 == 64;
                int _1613 = _1609;
                if (_1581)
                {
                    _1607 = _1329;
                }
                int _1615 = _1607;
                int _1617 = _1615;
                if (_1587)
                {
                    _1617 = _1331;
                }
                int _1619 = _1617;
                bool _1621 = _1441 == 52;
                int _1623 = _1619;
                if (_1593)
                {
                    _1623 = _1333;
                }
                int _1625 = _1623;
                bool _1627 = _1441 == 56;
                bool _1629 = _1441 == 60;
                int _1631 = _1625;
                if (_1599)
                {
                    _1613 = _1341;
                }
                int _1633 = _1613;
                bool _1635 = _1445 == 0;
                int _1637 = _1633;
                if (_1605)
                {
                    _1631 = _1335;
                }
                int _1639 = _1631;
                bool _1641 = _1433 == 68;
                int _1643 = _1639;
                if (_1611)
                {
                    _1637 = _1343;
                }
                int _1645 = _1637;
                bool _1647 = _1445 == 4;
                int _1649 = _1645;
                if (_1621)
                {
                    _1643 = _1337;
                }
                int _1651 = _1643;
                bool _1653 = _1445 == 8;
                int _1655 = _1651;
                if (_1627)
                {
                    _1655 = _1339;
                }
                int _1657 = _1655;
                bool _1659 = _1445 == 12;
                int _1661 = _1657;
                if (_1629)
                {
                    _1661 = _1341;
                }
                int _1663 = _1661;
                bool _1665 = _1445 == 16;
                int _1667 = _1663;
                if (_1635)
                {
                    _1461 = _1311;
                }
                int _1669 = _1461;
                bool _1671 = _1441 == 64;
                int _1673 = _1669;
                if (_1641)
                {
                    _1649 = _1345;
                }
                int _1675 = _1649;
                bool _1677 = _1445 == 20;
                int _1679 = _1675;
                if (_1647)
                {
                    _1673 = _1313;
                }
                int _1681 = _1673;
                bool _1683 = _1433 == 72;
                int _1685 = _1681;
                if (_1653)
                {
                    _1685 = _1315;
                }
                int _1687 = _1685;
                bool _1689 = _1445 == 24;
                int _1691 = _1687;
                if (_1659)
                {
                    _1691 = _1317;
                }
                int _1693 = _1691;
                bool _1695 = _1445 == 28;
                int _1697 = _1693;
                if (_1665)
                {
                    _1697 = _1319;
                }
                int _1699 = _1697;
                bool _1701 = _1445 == 32;
                int _1703 = _1699;
                if (_1671)
                {
                    _1667 = _1343;
                }
                int _1705 = _1667;
                bool _1707 = _1441 == 68;
                int _1709 = _1705;
                if (_1677)
                {
                    _1703 = _1321;
                }
                int _1711 = _1703;
                bool _1713 = _1445 == 36;
                int _1715 = _1711;
                if (_1683)
                {
                    _1679 = _1347;
                }
                int _1717 = _1679;
                bool _1719 = _1433 == 76;
                int _1721 = _1717;
                if (_1689)
                {
                    _1715 = _1323;
                }
                int _1723 = _1715;
                bool _1725 = _1445 == 40;
                int _1727 = _1723;
                if (_1695)
                {
                    _1727 = _1325;
                }
                int _1729 = _1727;
                bool _1731 = _1445 == 44;
                int _1733 = _1729;
                if (_1701)
                {
                    _1733 = _1327;
                }
                int _1735 = _1733;
                bool _1737 = _1445 == 48;
                int _1739 = _1735;
                if (_1707)
                {
                    _1709 = _1345;
                }
                int _1741 = _1709;
                bool _1743 = _1441 == 72;
                int _1745 = _1741;
                if (_1713)
                {
                    _1739 = _1329;
                }
                int _1747 = _1739;
                bool _1749 = _1445 == 52;
                int _1751 = _1747;
                if (_1719)
                {
                    _1721 = _1349;
                }
                int _1753 = _1721;
                bool _1755 = _1433 == 80;
                int _1757 = _1753;
                if (_1725)
                {
                    _1751 = _1331;
                }
                int _1759 = _1751;
                bool _1761 = _1445 == 56;
                int _1763 = _1759;
                if (_1731)
                {
                    _1763 = _1333;
                }
                int _1765 = _1763;
                bool _1767 = _1445 == 60;
                int _1769 = _1765;
                if (_1737)
                {
                    _1769 = _1335;
                }
                int _1771 = _1769;
                bool _1773 = _1441 == 76;
                int _1775 = _1771;
                if (_1743)
                {
                    _1745 = _1347;
                }
                int _1777 = _1745;
                bool _1779 = _1445 == 64;
                int _1781 = _1777;
                if (_1749)
                {
                    _1775 = _1337;
                }
                int _1783 = _1775;
                bool _1785 = _1433 == 84;
                int _1787 = _1783;
                if (_1755)
                {
                    _1757 = _1351;
                }
                int _1789 = _1757;
                bool _1791 = _1445 == 68;
                int _1793 = _1789;
                if (_1761)
                {
                    _1787 = _1339;
                }
                int _1795 = _1787;
                bool _1797 = _1445 == 72;
                int _1799 = _1795;
                if (_1767)
                {
                    _1799 = _1341;
                }
                int _1801 = _1799;
                bool _1803 = _1445 == 76;
                int _1805 = _1801;
                if (_1773)
                {
                    _1781 = _1349;
                }
                int _1807 = _1781;
                bool _1809 = _1441 == 80;
                int _1811 = _1807;
                if (_1779)
                {
                    _1805 = _1343;
                }
                int _1813 = _1805;
                bool _1815 = _1497 == 0;
                int _1817 = _1813;
                if (_1785)
                {
                    _1793 = _1353;
                }
                int _1819 = _1793;
                bool _1821 = _1497 == 4;
                int _1823 = _1819;
                if (_1791)
                {
                    _1817 = _1345;
                }
                int _1825 = _1817;
                bool _1827 = _1445 == 80;
                int _1829 = _1825;
                if (_1797)
                {
                    _1829 = _1347;
                }
                int _1831 = _1829;
                bool _1833 = _1497 == 8;
                int _1835 = _1831;
                if (_1803)
                {
                    _1835 = _1349;
                }
                int _1837 = _1835;
                bool _1839 = _1433 == 88;
                int _1841 = _1837;
                if (_1809)
                {
                    _1811 = _1351;
                }
                int _1843 = _1811;
                bool _1845 = _1441 == 84;
                int _1847 = _1843;
                if (_1815)
                {
                    _1463 = _1311;
                }
                int _1849 = _1463;
                bool _1851 = _1497 == 12;
                int _1853 = _1849;
                if (_1821)
                {
                    _1853 = _1313;
                }
                int _1855 = _1853;
                bool _1857 = _1445 == 84;
                int _1859 = _1855;
                if (_1827)
                {
                    _1841 = _1351;
                }
                int _1861 = _1841;
                bool _1863 = _1497 == 16;
                int _1865 = _1861;
                if (_1833)
                {
                    _1859 = _1315;
                }
                int _1867 = _1859;
                bool _1869 = _1433 == 92;
                int _1871 = _1867;
                if (_1839)
                {
                    _1823 = _1355;
                }
                int _1873 = _1823;
                bool _1875 = _1497 == 20;
                int _1877 = _1873;
                if (_1845)
                {
                    _1847 = _1353;
                }
                int _1879 = _1847;
                bool _1881 = _1497 == 24;
                int _1883 = _1879;
                if (_1851)
                {
                    _1871 = _1317;
                }
                int _1885 = _1871;
                bool _1887 = _1441 == 88;
                int _1889 = _1885;
                if (_1857)
                {
                    _1865 = _1353;
                }
                int _1891 = _1865;
                bool _1893 = _1445 == 88;
                int _1895 = _1891;
                if (_1863)
                {
                    _1889 = _1319;
                }
                int _1897 = _1889;
                bool _1899 = _1497 == 28;
                int _1901 = _1897;
                if (_1869)
                {
                    _1877 = _1357;
                }
                int _1903 = _1877;
                bool _1905 = _1497 == 32;
                int _1907 = _1903;
                if (_1875)
                {
                    _1901 = _1321;
                }
                int _1909 = _1901;
                bool _1911 = _1433 == 96;
                int _1913 = _1909;
                if (_1881)
                {
                    _1913 = _1323;
                }
                int _1915 = _1913;
                bool _1917 = _1497 == 36;
                int _1919 = _1915;
                if (_1887)
                {
                    _1883 = _1355;
                }
                int _1921 = _1883;
                bool _1923 = _1497 == 40;
                int _1925 = _1921;
                if (_1893)
                {
                    _1895 = _1355;
                }
                int _1927 = _1895;
                bool _1929 = _1441 == 92;
                int _1931 = _1927;
                if (_1899)
                {
                    _1919 = _1325;
                }
                int _1933 = _1919;
                bool _1935 = _1497 == 44;
                int _1937 = _1933;
                if (_1905)
                {
                    _1937 = _1327;
                }
                int _1939 = _1937;
                bool _1941 = _1497 == 48;
                int _1943 = _1939;
                if (_1911)
                {
                    _1907 = _1359;
                }
                int _1945 = _1907;
                bool _1947 = _1441 == 96;
                int _1949 = _1945;
                if (_1917)
                {
                    _1943 = _1329;
                }
                int _1951 = _1943;
                bool _1953 = _1497 == 52;
                int _1955 = _1951;
                if (_1923)
                {
                    _1955 = _1331;
                }
                int _1957 = _1955;
                bool _1959 = _1421 >= _1945;
                int _1961 = _1957;
                if (_1929)
                {
                    _1925 = _1357;
                }
                int _1963 = _1925;
                bool _1965 = _1497 == 56;
                int _1967 = _1963;
                if (_1935)
                {
                    _1961 = _1333;
                }
                int _1969 = _1961;
                bool _1971 = _1497 == 60;
                int _1973 = _1969;
                if (_1941)
                {
                    _1973 = _1335;
                }
                int _1975 = _1973;
                bool _1977 = _1497 == 64;
                int _1979 = _1975;
                if (_1947)
                {
                    _1967 = _1359;
                }
                int _1981 = _1967;
                bool _1983 = _1445 == 92;
                _1379 = _1981;
                if (_1953)
                {
                    _1979 = _1337;
                }
                int _1985 = _1979;
                bool _1987 = _1497 == 68;
                int _1989 = _1985;
                if (!_1959)
                {
                    _1465 = _1945;
                }
                int _1991 = _1465;
                int _1993 = _1991;
                if (_1965)
                {
                    _1989 = _1339;
                }
                int _1995 = _1989;
                bool _1997 = _1497 == 72;
                int _1999 = _1995;
                if (_1971)
                {
                    _1999 = _1341;
                }
                int _2001 = _1999;
                bool _2003 = _1991 >= _1981;
                int _2005 = _2001;
                if (_1977)
                {
                    _2005 = _1343;
                }
                int _2007 = _2005;
                bool _2009 = _1445 == 96;
                int _2011 = _2007;
                if (_1983)
                {
                    _1931 = _1357;
                }
                int _2013 = _1931;
                bool _2015 = _1497 == 76;
                int _2017 = _2013;
                if (_1987)
                {
                    _2011 = _1345;
                }
                int _2019 = _2011;
                bool _2021 = _1497 == 80;
                int _2023 = _2019;
                if (_1997)
                {
                    _2023 = _1347;
                }
                int _2025 = _2023;
                bool _2027 = _1497 == 84;
                int _2029 = _2025;
                if (_2003)
                {
                    _1949 = _1991;
                }
                int _2031 = _1949;
                int _2033 = _2031;
                if (_2009)
                {
                    _2017 = _1359;
                }
                int _2035 = _2017;
                bool _2037 = _1497 == 88;
                _1381 = _2035;
                if (!_2003)
                {
                    _2033 = _1981;
                }
                int _2039 = _2033;
                int _2041 = _2039;
                if (_2015)
                {
                    _2029 = _1349;
                }
                int _2043 = _2029;
                bool _2045 = _1497 == 92;
                int _2047 = _2043;
                if (_2021)
                {
                    _2047 = _1351;
                }
                int _2049 = _2047;
                bool _2051 = _2039 >= _2035;
                int _2053 = _2049;
                if (_1959)
                {
                    _1993 = _1429;
                }
                int _2055 = _1993;
                int _2057 = _2055;
                if (_2027)
                {
                    _2053 = _1353;
                }
                int _2059 = _2053;
                bool _2061 = _1497 == 96;
                int _2063 = _2059;
                if (!_1959)
                {
                    _2057 = _1419;
                }
                int _2065 = _2057;
                int _2067 = _1419 + 4;
                _1401 = _2067;
                int _2069 = _2065;
                _1407 = _2067;
                if (_2037)
                {
                    _2063 = _1355;
                }
                int _2071 = _2063;
                int _2073 = _2071;
                if (!_2003)
                {
                    _2069 = _1435;
                }
                int _2075 = _2069;
                bool _2077 = _2067 >= _1415;
                int _2079 = _2075;
                if (_2045)
                {
                    _2073 = _1357;
                }
                int _2081 = _2073;
                int _2083 = _2081;
                if (!_2051)
                {
                    _2041 = _2035;
                }
                int _2085 = _2041;
                _1377 = _2085;
                _1385 = _2085;
                if (!_2051)
                {
                    _2079 = _1437;
                }
                int _2087 = _2079;
                int _2089 = _2087;
                if (_2061)
                {
                    _2083 = _1359;
                }
                int _2091 = _2083;
                bool _2093 = _2085 >= _2091;
                _1383 = _2091;
                if (_2093)
                {
                    _1467 = _2087;
                }
                int _2095 = _1467;
                int _2097 = _2095;
                if (_2093)
                {
                    _2089 = _2085;
                }
                int _2099 = _2089;
                int _2101 = _2099;
                if (!_2093)
                {
                    _2101 = _2091;
                }
                int _2103 = _2101;
                _1403 = _2103;
                _1409 = _2103;
                if (!_2093)
                {
                    _2097 = _1455;
                }
                int _2105 = _2097;
                _1417 = !_2077;
                _1405 = _2105;
                _1413 = _2105;
            } while (_1417);
        }
        int _2107 = _1407;
        int _2109 = _1409;
        int _2111 = _1385;
        int _2113 = _1411;
        int _2115 = _1413;
        int _2117 = -_2107;
        int _2119 = _1363 + _2117;
        bool _2121 = _2119 > 1;
        bool _2123 = !_2121;
        int _2125 = _2111;
        int _2127 = _2119;
        int _2129 = _2109;
        int _2131 = _2115;
        int _2133 = _2107;
        int _2135 = _2113;
        int _2137 = _2109;
        int _2139 = _2115;
        if (!_2123)
        {
            int _2141 = _2107 * 4;
            int _2143 = _2107 + 1;
            bool _2145 = _2141 == 0;
            int _2147 = _2143 * 4;
            bool _2149 = _2141 == 4;
            bool _2151 = _2141 == 8;
            bool _2153 = _2141 == 12;
            bool _2155 = _2141 == 24;
            bool _2157 = _2147 == 0;
            bool _2159 = _2141 == 40;
            if (_2145)
            {
                _2125 = _1311;
            }
            int _2161 = _2125;
            bool _2163 = _2141 == 16;
            int _2165 = _2161;
            if (_2149)
            {
                _2165 = _1313;
            }
            int _2167 = _2165;
            bool _2169 = _2141 == 20;
            int _2171 = _2167;
            if (_2151)
            {
                _2171 = _1315;
            }
            int _2173 = _2171;
            bool _2175 = _2141 == 36;
            int _2177 = _2173;
            if (_2153)
            {
                _2177 = _1317;
            }
            int _2179 = _2177;
            bool _2181 = _2141 == 28;
            int _2183 = _2179;
            if (_2157)
            {
                _2127 = _1311;
            }
            int _2185 = _2127;
            bool _2187 = _2147 == 16;
            int _2189 = _2185;
            if (_2163)
            {
                _2183 = _1319;
            }
            int _2191 = _2183;
            bool _2193 = _2141 == 32;
            int _2195 = _2191;
            if (_2169)
            {
                _2195 = _1321;
            }
            int _2197 = _2195;
            bool _2199 = _2141 == 48;
            int _2201 = _2197;
            if (_2155)
            {
                _2201 = _1323;
            }
            int _2203 = _2201;
            bool _2205 = _2147 == 4;
            int _2207 = _2203;
            if (_2181)
            {
                _2207 = _1325;
            }
            int _2209 = _2207;
            bool _2211 = _2141 == 44;
            int _2213 = _2209;
            if (_2193)
            {
                _2213 = _1327;
            }
            int _2215 = _2213;
            bool _2217 = _2147 == 8;
            int _2219 = _2215;
            if (_2175)
            {
                _2219 = _1329;
            }
            int _2221 = _2219;
            bool _2223 = _2147 == 12;
            int _2225 = _2221;
            if (_2205)
            {
                _2189 = _1313;
            }
            int _2227 = _2189;
            bool _2229 = _2141 == 52;
            int _2231 = _2227;
            if (_2159)
            {
                _2225 = _1331;
            }
            int _2233 = _2225;
            bool _2235 = _2147 == 20;
            int _2237 = _2233;
            if (_2211)
            {
                _2237 = _1333;
            }
            int _2239 = _2237;
            bool _2241 = _2147 == 24;
            int _2243 = _2239;
            if (_2199)
            {
                _2243 = _1335;
            }
            int _2245 = _2243;
            bool _2247 = _2141 == 60;
            int _2249 = _2245;
            if (_2217)
            {
                _2231 = _1315;
            }
            int _2251 = _2231;
            bool _2253 = _2141 == 56;
            int _2255 = _2251;
            if (_2223)
            {
                _2255 = _1317;
            }
            int _2257 = _2255;
            bool _2259 = _2147 == 28;
            int _2261 = _2257;
            if (_2187)
            {
                _2261 = _1319;
            }
            int _2263 = _2261;
            bool _2265 = _2147 == 32;
            int _2267 = _2263;
            if (_2235)
            {
                _2267 = _1321;
            }
            int _2269 = _2267;
            bool _2271 = _2147 == 36;
            int _2273 = _2269;
            if (_2229)
            {
                _2249 = _1337;
            }
            int _2275 = _2249;
            bool _2277 = _2141 == 64;
            int _2279 = _2275;
            if (_2241)
            {
                _2273 = _1323;
            }
            int _2281 = _2273;
            bool _2283 = _2141 == 68;
            int _2285 = _2281;
            if (_2253)
            {
                _2279 = _1339;
            }
            int _2287 = _2279;
            bool _2289 = _2147 == 40;
            int _2291 = _2287;
            if (_2259)
            {
                _2285 = _1325;
            }
            int _2293 = _2285;
            bool _2295 = _2141 == 72;
            int _2297 = _2293;
            if (_2247)
            {
                _2291 = _1341;
            }
            int _2299 = _2291;
            bool _2301 = _2147 == 44;
            int _2303 = _2299;
            if (_2265)
            {
                _2297 = _1327;
            }
            int _2305 = _2297;
            int _2307 = _2305;
            if (_2271)
            {
                _2307 = _1329;
            }
            int _2309 = _2307;
            int _2311 = _2309;
            if (_2277)
            {
                _2303 = _1343;
            }
            int _2313 = _2303;
            bool _2315 = _2141 == 76;
            int _2317 = _2313;
            if (_2283)
            {
                _2317 = _1345;
            }
            int _2319 = _2317;
            bool _2321 = _2141 == 80;
            bool _2323 = _2147 == 48;
            int _2325 = _2319;
            if (_2289)
            {
                _2311 = _1331;
            }
            int _2327 = _2311;
            bool _2329 = _2147 == 52;
            int _2331 = _2327;
            if (_2295)
            {
                _2325 = _1347;
            }
            int _2333 = _2325;
            bool _2335 = _2141 == 84;
            int _2337 = _2333;
            if (_2301)
            {
                _2331 = _1333;
            }
            int _2339 = _2331;
            bool _2341 = _2147 == 56;
            bool _2343 = _2147 == 60;
            int _2345 = _2339;
            if (_2315)
            {
                _2337 = _1349;
            }
            int _2347 = _2337;
            bool _2349 = _2141 == 88;
            int _2351 = _2347;
            if (_2321)
            {
                _2351 = _1351;
            }
            int _2353 = _2351;
            bool _2355 = _2141 == 92;
            int _2357 = _2353;
            if (_2323)
            {
                _2345 = _1335;
            }
            int _2359 = _2345;
            bool _2361 = _2147 == 64;
            int _2363 = _2359;
            if (_2329)
            {
                _2363 = _1337;
            }
            int _2365 = _2363;
            bool _2367 = _2147 == 68;
            int _2369 = _2365;
            if (_2335)
            {
                _2357 = _1353;
            }
            int _2371 = _2357;
            bool _2373 = _2141 == 96;
            int _2375 = _2371;
            if (_2341)
            {
                _2369 = _1339;
            }
            int _2377 = _2369;
            bool _2379 = _2147 == 72;
            int _2381 = _2377;
            if (_2343)
            {
                _2381 = _1341;
            }
            int _2383 = _2381;
            bool _2385 = _2147 == 76;
            int _2387 = _2383;
            if (_2349)
            {
                _2375 = _1355;
            }
            int _2389 = _2375;
            int _2391 = _2389;
            if (_2355)
            {
                _2391 = _1357;
            }
            int _2393 = _2391;
            bool _2395 = _2147 == 96;
            int _2397 = _2393;
            if (_2361)
            {
                _2387 = _1343;
            }
            int _2399 = _2387;
            bool _2401 = _2147 == 80;
            int _2403 = _2399;
            if (_2367)
            {
                _2403 = _1345;
            }
            int _2405 = _2403;
            bool _2407 = _2147 == 84;
            int _2409 = _2405;
            if (_2373)
            {
                _2397 = _1359;
            }
            int _2411 = _2397;
            bool _2413 = _2147 == 92;
            if (_2379)
            {
                _2409 = _1347;
            }
            int _2415 = _2409;
            bool _2417 = _2147 == 88;
            int _2419 = _2415;
            if (_2385)
            {
                _2419 = _1349;
            }
            int _2421 = _2419;
            bool _2423 = _2109 >= _2411;
            int _2425 = _2421;
            if (_2401)
            {
                _2425 = _1351;
            }
            int _2427 = _2425;
            int _2429 = _2427;
            if (_2407)
            {
                _2429 = _1353;
            }
            int _2431 = _2429;
            int _2433 = _2431;
            if (_2417)
            {
                _2433 = _1355;
            }
            int _2435 = _2433;
            int _2437 = _2435;
            _2135 = 0;
            if (_2413)
            {
                _2437 = _1357;
            }
            int _2439 = _2437;
            int _2441 = _2439;
            if (_2395)
            {
                _2441 = _1359;
            }
            int _2443 = _2441;
            if (!_2423)
            {
                _2129 = _2411;
            }
            int _2445 = _2129;
            _2137 = _2445;
            if (!_2423)
            {
                _2131 = _2107;
            }
            int _2447 = _2131;
            int _2449 = _2143 + 1;
            bool _2451 = _2445 >= _2443;
            int _2453 = _2447;
            _2133 = _2449;
            if (!_2451)
            {
                _2453 = _2143;
            }
            int _2455 = _2453;
            _2139 = _2455;
            if (!_2451)
            {
                _2137 = _2443;
            }
        }
        int _2457 = _2133;
        int _2459 = _2135;
        int _2461 = _2137;
        int _2463 = _2139;
        bool _2465 = _2457 < _1363;
        int _2467 = (_2465 ? (-1) : 0) | _2459;
        int _2469 = ~_2467;
        int _2471 = _2463;
        if (!(_2469 != 0))
        {
            int _2473 = _2457 << 2;
            bool _2475 = _2473 == 4;
            bool _2477 = _2473 == 8;
            bool _2479 = _2473 == 12;
            bool _2481 = _2473 == 16;
            if (_2475)
            {
                _1387 = _1313;
            }
            int _2483 = _1387;
            bool _2485 = _2473 == 20;
            int _2487 = _2483;
            if (_2477)
            {
                _2487 = _1315;
            }
            int _2489 = _2487;
            bool _2491 = _2473 == 24;
            int _2493 = _2489;
            if (_2479)
            {
                _2493 = _1317;
            }
            int _2495 = _2493;
            bool _2497 = _2473 == 28;
            int _2499 = _2495;
            if (_2481)
            {
                _2499 = _1319;
            }
            int _2501 = _2499;
            bool _2503 = _2473 == 32;
            int _2505 = _2501;
            if (_2485)
            {
                _2505 = _1321;
            }
            int _2507 = _2505;
            bool _2509 = _2473 == 36;
            int _2511 = _2507;
            if (_2491)
            {
                _2511 = _1323;
            }
            int _2513 = _2511;
            bool _2515 = _2473 == 40;
            int _2517 = _2513;
            if (_2497)
            {
                _2517 = _1325;
            }
            int _2519 = _2517;
            bool _2521 = _2473 == 44;
            int _2523 = _2519;
            if (_2503)
            {
                _2523 = _1327;
            }
            int _2525 = _2523;
            bool _2527 = _2473 == 48;
            int _2529 = _2525;
            if (_2509)
            {
                _2529 = _1329;
            }
            int _2531 = _2529;
            bool _2533 = _2473 == 52;
            int _2535 = _2531;
            if (_2515)
            {
                _2535 = _1331;
            }
            int _2537 = _2535;
            bool _2539 = _2473 == 56;
            int _2541 = _2537;
            if (_2521)
            {
                _2541 = _1333;
            }
            int _2543 = _2541;
            bool _2545 = _2473 == 60;
            int _2547 = _2543;
            if (_2527)
            {
                _2547 = _1335;
            }
            int _2549 = _2547;
            bool _2551 = _2473 == 64;
            int _2553 = _2549;
            if (_2533)
            {
                _2553 = _1337;
            }
            int _2555 = _2553;
            bool _2557 = _2473 == 68;
            int _2559 = _2555;
            if (_2539)
            {
                _2559 = _1339;
            }
            int _2561 = _2559;
            bool _2563 = _2473 == 72;
            int _2565 = _2561;
            if (_2545)
            {
                _2565 = _1341;
            }
            int _2567 = _2565;
            bool _2569 = _2473 == 76;
            int _2571 = _2567;
            if (_2551)
            {
                _2571 = _1343;
            }
            int _2573 = _2571;
            bool _2575 = _2473 == 80;
            int _2577 = _2573;
            if (_2557)
            {
                _2577 = _1345;
            }
            int _2579 = _2577;
            bool _2581 = _2473 == 84;
            int _2583 = _2579;
            if (_2563)
            {
                _2583 = _1347;
            }
            int _2585 = _2583;
            bool _2587 = _2473 == 88;
            int _2589 = _2585;
            if (_2569)
            {
                _2589 = _1349;
            }
            int _2591 = _2589;
            bool _2593 = _2473 == 92;
            int _2595 = _2591;
            if (_2575)
            {
                _2595 = _1351;
            }
            int _2597 = _2595;
            bool _2599 = _2473 == 96;
            int _2601 = _2597;
            if (_2581)
            {
                _2601 = _1353;
            }
            int _2603 = _2601;
            int _2605 = _2603;
            if (_2587)
            {
                _2605 = _1355;
            }
            int _2607 = _2605;
            int _2609 = _2607;
            if (_2593)
            {
                _2609 = _1357;
            }
            int _2611 = _2609;
            int _2613 = _2611;
            if (_2599)
            {
                _2613 = _1359;
            }
            int _2615 = _2613;
            bool _2617 = _2461 >= _2615;
            if (!_2617)
            {
                _2471 = _2457;
            }
        }
        int _2619 = _2471;
        _1395 = _2619;
    }
    int _2621 = _1395;
    int _2623 = _2621 * 8;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    float _2627 = as_type<float>(_31[int(_2625)]);
    int _2629 = _2623 + 4;
    uint _2631 = uint(int(uint(_2629) >> uint(2)));
    float _2633 = as_type<float>(_31[int(_2631)]);
    int _2635 = _74 + 16;
    int _2637 = _74 + 24;
    uint _2639 = uint(int(uint(_2635) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2639)] = as_type<uint>(_2627);
    int _2641 = _2635 + 4;
    uint _2643 = uint(int(uint(_2641) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2643)] = as_type<uint>(_2633);
    uint _2645 = uint(int(uint(_2637) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2645)] = as_type<uint>(_1361);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _887 = false;
    bool _711 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _2668 = float3((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float4 _60 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2668, float3(0.0), isnan(_2668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2668, float3(0.0), isnan(_2668)), level(0.0)).xyzw;
    float _63 = _60.x;
    float _65 = _60.y;
    float _67 = _60.z;
    float _69 = _60.w;
    float _71 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _74 = as_type<int>(_71) * 32;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_77)] = as_type<uint>(_63);
    int _79 = _74 + 4;
    uint _81 = uint(int(uint(_79) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_81)] = as_type<uint>(_65);
    int _83 = _74 + 8;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_85)] = as_type<uint>(_67);
    int _87 = _74 + 12;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_89)] = as_type<uint>(_69);
    int _91 = -2;
    int _93 = 0;
    int _95 = 0;
    int _97 = 0;
    int _99 = 0;
    int _101 = 0;
    int _103 = 0;
    int _105 = 0;
    int _107 = 0;
    int _109 = 0;
    int _111 = 0;
    int _113 = 0;
    int _115 = 0;
    int _117 = 0;
    int _119 = 0;
    int _121 = 0;
    int _123 = 0;
    int _125 = 0;
    int _127 = 0;
    int _129 = 0;
    int _131 = 0;
    int _133 = 0;
    int _135 = 0;
    int _137 = 0;
    int _139 = 0;
    int _141 = 0;
    int _143 = 0;
    float _145 = 1000000.0;
    bool _149;
    bool _291;
    float _673;
    int _675;
    int _677;
    int _679;
    bool _687;
    int _689;
    int _743;
    int _745;
    int _751;
    int _757;
    int _763;
    int _769;
    int _775;
    int _781;
    int _787;
    int _793;
    int _799;
    int _805;
    int _811;
    int _817;
    int _823;
    int _829;
    bool _833;
    int _835;
    int _841;
    int _847;
    int _853;
    int _857;
    int _863;
    int _867;
    int _871;
    int _875;
    int _879;
    int _883;
    int _885;
    int _1245;
    int _1311;
    int _1313;
    int _1315;
    int _1317;
    int _1319;
    int _1321;
    int _1323;
    int _1325;
    int _1327;
    int _1329;
    int _1331;
    int _1333;
    int _1335;
    int _1337;
    int _1339;
    int _1341;
    int _1343;
    int _1345;
    int _1347;
    int _1349;
    int _1351;
    int _1353;
    int _1355;
    int _1357;
    int _1359;
    float _1361;
    int _1363;
    int _1377;
    int _1379;
    int _1381;
    int _1383;
    int _1385;
    int _1387;
    do
    {
        int _151 = _91;
        int _153 = _93;
        int _155 = _95;
        int _157 = _97;
        int _159 = _99;
        int _161 = _101;
        int _163 = _103;
        int _165 = _105;
        int _167 = _107;
        int _169 = _109;
        int _171 = _111;
        int _173 = _113;
        int _175 = _115;
        int _177 = _117;
        int _179 = _119;
        int _181 = _121;
        int _183 = _123;
        int _185 = _125;
        int _187 = _127;
        int _189 = _129;
        int _191 = _131;
        int _193 = _133;
        int _195 = _135;
        int _197 = _137;
        int _199 = _139;
        int _201 = _141;
        int _203 = _143;
        float _205 = _145;
        float _207 = float(_151);
        float _209 = _207 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _211 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _213 = fma(_209, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2789 = float2(_211, _213);
        float4 _215 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2789, float2(0.0), isnan(_2789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2789, float2(0.0), isnan(_2789)), level(0.0)).xyzw;
        float _217 = _215.x;
        float _219 = _215.y;
        float _221 = _215.z;
        float _223 = _215.w;
        int _225 = -2;
        float _227 = _219;
        float _229 = _223;
        float _231 = _221;
        float _233 = _217;
        int _235 = -2;
        int _237 = _153;
        int _239 = _155;
        int _241 = _157;
        int _243 = _159;
        int _245 = _161;
        int _247 = _163;
        int _249 = _165;
        int _251 = _167;
        int _253 = _169;
        int _255 = _171;
        int _257 = _173;
        int _259 = _175;
        int _261 = _177;
        int _263 = _179;
        int _265 = _181;
        int _267 = _183;
        int _269 = _185;
        int _271 = _187;
        int _273 = _189;
        int _275 = _191;
        int _277 = _193;
        int _279 = _195;
        int _281 = _197;
        int _283 = _199;
        int _285 = _201;
        int _287 = _203;
        float _289 = _205;
        do
        {
            int _293 = _225;
            float _295 = _227;
            float _297 = _229;
            float _299 = _231;
            float _301 = _233;
            int _303 = _235;
            int _305 = _237;
            int _307 = _239;
            int _309 = _241;
            int _311 = _243;
            int _313 = _245;
            int _315 = _247;
            int _317 = _249;
            int _319 = _251;
            int _321 = _253;
            int _323 = _255;
            int _325 = _257;
            int _327 = _259;
            int _329 = _261;
            int _331 = _263;
            int _333 = _265;
            int _335 = _267;
            int _337 = _269;
            int _339 = _271;
            int _341 = _273;
            int _343 = _275;
            int _345 = _277;
            int _347 = _279;
            int _349 = _281;
            int _351 = _283;
            int _353 = _285;
            int _355 = _287;
            float _357 = _289;
            int _359 = _293 + 1;
            float _361 = float(_151);
            float _363 = 0.0 + _295;
            float _365 = precise::clamp(_363, 0.0, 1.0);
            float _367 = _361 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _369 = float(_359);
            float _371 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _373 = fma(_367, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _375 = 0.0 + _297;
            float _377 = precise::clamp(_375, 0.0, 1.0);
            float _379 = fma(_369, _371, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _381 = 0.0 + _299;
            float _383 = precise::clamp(_381, 0.0, 1.0);
            float _385 = 0.0 + _301;
            float _387 = precise::clamp(_385, 0.0, 1.0);
            float2 _2911 = float2(_379, _373);
            float4 _389 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2911, float2(0.0), isnan(_2911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2911, float2(0.0), isnan(_2911)), level(0.0)).xyzw;
            float _391 = _389.x;
            float _393 = _389.y;
            float _395 = _389.z;
            float _397 = _389.w;
            float _399 = _377 * 65535.0;
            float _401 = _383 * 65535.0;
            float _403 = _365 * 65535.0;
            float _405 = _387 * 65535.0;
            float _407 = rint(_399);
            int _409 = int(_407);
            float _411 = rint(_401);
            int _413 = int(_411);
            float _415 = rint(_403);
            int _417 = int(_415);
            uint _419 = extract_bits(uint(_409), 0u, 8u);
            int _421 = int(_419) & 255;
            uint _423 = extract_bits(uint(_409), 8u, 8u);
            int _425 = int(_423) & 255;
            int _427 = _425 << 8;
            int _429 = _421 | _427;
            float _431 = rint(_405);
            int _433 = int(_431);
            uint _435 = extract_bits(uint(_429), 0u, 8u);
            int _437 = int(_435) & 255;
            uint _439 = extract_bits(uint(_429), 8u, 8u);
            int _441 = int(_439) & 255;
            int _443 = _441 << 8;
            int _445 = _437 | _443;
            uint _447 = extract_bits(uint(_413), 0u, 8u);
            int _449 = int(_447) & 255;
            int _451 = _449 << 16;
            int _453 = _445 | _451;
            uint _455 = extract_bits(uint(_413), 8u, 8u);
            int _457 = int(_455) & 255;
            int _459 = _457 << 24;
            int _461 = _453 | _459;
            float _463 = float(_303);
            bool _465 = _461 != 0;
            uint _467 = extract_bits(uint(_417), 0u, 8u);
            int _469 = int(_467) & 255;
            uint _471 = extract_bits(uint(_417), 8u, 8u);
            int _473 = int(_471) & 255;
            int _475 = _473 << 8;
            int _477 = _469 | _475;
            float _479 = fma(_463, _371, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _481 = extract_bits(uint(_477), 0u, 8u);
            int _483 = int(_481) & 255;
            uint _485 = extract_bits(uint(_477), 8u, 8u);
            int _487 = int(_485) & 255;
            int _489 = _487 << 8;
            int _491 = _483 | _489;
            uint _493 = extract_bits(uint(_433), 0u, 8u);
            int _495 = int(_493) & 255;
            int _497 = _495 << 16;
            int _499 = _491 | _497;
            uint _501 = extract_bits(uint(_433), 8u, 8u);
            int _503 = int(_501) & 255;
            int _505 = _503 << 24;
            int _507 = _499 | _505;
            bool _509 = _507 != 0;
            bool _511 = _509 || _465;
            bool _513 = !_511;
            _225 = _359;
            _227 = _393;
            _229 = _397;
            _231 = _395;
            _233 = _391;
            int _515 = _315;
            int _517 = _307;
            int _519 = _309;
            int _521 = _311;
            int _523 = _313;
            int _525 = _317;
            int _527 = _319;
            int _529 = _329;
            int _531 = _321;
            int _533 = _323;
            int _535 = _325;
            int _537 = _327;
            int _539 = _331;
            int _541 = _333;
            int _543 = _343;
            int _545 = _335;
            int _547 = _337;
            int _549 = _339;
            int _551 = _341;
            int _553 = _345;
            int _555 = _347;
            int _557 = _349;
            int _559 = _351;
            int _561 = _353;
            int _563 = _355;
            int _565 = _461;
            int _567 = _307;
            int _569 = _309;
            int _571 = _311;
            int _573 = _313;
            int _575 = _351;
            int _577 = _353;
            int _579 = _355;
            int _581 = _315;
            int _583 = _317;
            int _585 = _319;
            int _587 = _321;
            int _589 = _323;
            int _591 = _325;
            int _593 = _327;
            int _595 = _329;
            int _597 = _331;
            int _599 = _333;
            int _601 = _335;
            int _603 = _337;
            int _605 = _339;
            int _607 = _341;
            int _609 = _349;
            int _611 = _347;
            int _613 = _345;
            int _615 = _305;
            int _617 = _307;
            int _619 = _309;
            int _621 = _311;
            int _623 = _313;
            int _625 = _315;
            int _627 = _317;
            int _629 = _319;
            int _631 = _321;
            int _633 = _323;
            int _635 = _325;
            int _637 = _327;
            int _639 = _329;
            int _641 = _331;
            int _643 = _333;
            int _645 = _335;
            int _647 = _337;
            int _649 = _339;
            int _651 = _341;
            int _653 = _343;
            int _655 = _345;
            int _657 = _347;
            int _659 = _349;
            int _661 = _351;
            int _663 = _353;
            int _665 = _355;
            int _667 = _433;
            int _669 = _461;
            int _671 = as_type<int>(_463);
            _673 = _357;
            _675 = _507;
            _677 = _461;
            _679 = as_type<int>(_395);
            if (!_513)
            {
                bool _681 = _305 > 0;
                bool _683 = !_681;
                if (!_683)
                {
                    int _685 = 0;
                    do
                    {
                        _689 = _685;
                        int _691 = _689 * 8;
                        uint _693 = uint(int(uint(_691) >> uint(2)));
                        float _695 = as_type<float>(_31[int(_693)]);
                        int _697 = _691 + 4;
                        uint _699 = uint(int(uint(_697) >> uint(2)));
                        float _701 = as_type<float>(_31[int(_699)]);
                        bool _703 = as_type<int>(_695) != _461;
                        bool _705 = as_type<int>(_701) != _507;
                        bool _707 = _705 || _703;
                        bool _709 = !_707;
                        _711 = _709;
                        if (_711)
                        {
                            break;
                        }
                        int _713 = _689 + 1;
                        bool _715 = _713 >= _305;
                        _687 = !_715;
                        _685 = _713;
                    } while (_687);
                }
                if (!_711)
                {
                    int _717 = _305 * 4;
                    int _719 = _305 * 8;
                    int _721 = _305 + 1;
                    bool _723 = _717 == 16;
                    bool _725 = _717 == 0;
                    uint _727 = uint(int(uint(_719) >> uint(2)));
                    _31[int(_727)] = uint(_461);
                    int _729 = _719 + 4;
                    uint _731 = uint(int(uint(_729) >> uint(2)));
                    _31[int(_731)] = uint(_507);
                    bool _733 = _717 == 4;
                    bool _735 = _717 == 8;
                    bool _737 = _717 == 12;
                    bool _739 = _717 == 20;
                    bool _741 = _717 == 24;
                    _615 = _721;
                    _667 = _719;
                    _671 = _717;
                    _743 = _719;
                    _745 = _717;
                    if (_723)
                    {
                        _515 = 1;
                    }
                    int _747 = _515;
                    bool _749 = _717 == 44;
                    _625 = _747;
                    _751 = _747;
                    if (_725)
                    {
                        _517 = 1;
                    }
                    int _753 = _517;
                    bool _755 = _717 == 28;
                    _617 = _753;
                    _757 = _753;
                    if (_733)
                    {
                        _519 = 1;
                    }
                    int _759 = _519;
                    bool _761 = _717 == 32;
                    _619 = _759;
                    _763 = _759;
                    if (_735)
                    {
                        _521 = 1;
                    }
                    int _765 = _521;
                    bool _767 = _717 == 36;
                    _621 = _765;
                    _769 = _765;
                    if (_737)
                    {
                        _523 = 1;
                    }
                    int _771 = _523;
                    bool _773 = _717 == 40;
                    _623 = _771;
                    _775 = _771;
                    if (_739)
                    {
                        _525 = 1;
                    }
                    int _777 = _525;
                    bool _779 = _717 == 48;
                    _627 = _777;
                    _781 = _777;
                    if (_741)
                    {
                        _527 = 1;
                    }
                    int _783 = _527;
                    bool _785 = _717 == 52;
                    _629 = _783;
                    _787 = _783;
                    if (_749)
                    {
                        _529 = 1;
                    }
                    int _789 = _529;
                    bool _791 = _717 == 72;
                    _639 = _789;
                    _793 = _789;
                    if (_755)
                    {
                        _531 = 1;
                    }
                    int _795 = _531;
                    bool _797 = _717 == 56;
                    _631 = _795;
                    _799 = _795;
                    if (_761)
                    {
                        _533 = 1;
                    }
                    int _801 = _533;
                    bool _803 = _717 == 60;
                    _633 = _801;
                    _805 = _801;
                    if (_767)
                    {
                        _535 = 1;
                    }
                    int _807 = _535;
                    bool _809 = _717 == 64;
                    _635 = _807;
                    _811 = _807;
                    if (_773)
                    {
                        _537 = 1;
                    }
                    int _813 = _537;
                    bool _815 = _717 == 68;
                    _637 = _813;
                    _817 = _813;
                    if (_779)
                    {
                        _539 = 1;
                    }
                    int _819 = _539;
                    bool _821 = _717 == 76;
                    _641 = _819;
                    _823 = _819;
                    if (_785)
                    {
                        _541 = 1;
                    }
                    int _825 = _541;
                    bool _827 = _717 == 80;
                    _643 = _825;
                    _829 = _825;
                    if (_791)
                    {
                        _543 = 1;
                    }
                    int _831 = _543;
                    _833 = _721 != 25;
                    _653 = _831;
                    _835 = _831;
                    if (_797)
                    {
                        _545 = 1;
                    }
                    int _837 = _545;
                    bool _839 = _717 == 84;
                    _645 = _837;
                    _841 = _837;
                    if (_803)
                    {
                        _547 = 1;
                    }
                    int _843 = _547;
                    bool _845 = _717 == 88;
                    _647 = _843;
                    _847 = _843;
                    if (_809)
                    {
                        _549 = 1;
                    }
                    int _849 = _549;
                    bool _851 = _717 == 92;
                    _649 = _849;
                    _853 = _849;
                    if (_815)
                    {
                        _551 = 1;
                    }
                    int _855 = _551;
                    _651 = _855;
                    _857 = _855;
                    if (_821)
                    {
                        _553 = 1;
                    }
                    int _859 = _553;
                    bool _861 = _717 == 96;
                    _655 = _859;
                    _863 = _859;
                    if (_827)
                    {
                        _555 = 1;
                    }
                    int _865 = _555;
                    _657 = _865;
                    _867 = _865;
                    if (_839)
                    {
                        _557 = 1;
                    }
                    int _869 = _557;
                    _659 = _869;
                    _871 = _869;
                    if (_845)
                    {
                        _559 = 1;
                    }
                    int _873 = _559;
                    _661 = _873;
                    _875 = _873;
                    if (_851)
                    {
                        _561 = 1;
                    }
                    int _877 = _561;
                    _663 = _877;
                    _879 = _877;
                    if (_861)
                    {
                        _563 = 1;
                    }
                    int _881 = _563;
                    _665 = _881;
                    _883 = _881;
                }
                if ((!_833) || _711)
                {
                    if (!_711)
                    {
                        _885 = 25;
                        _887 = true;
                        if (_887)
                        {
                            break;
                        }
                    }
                    _711 = false;
                    int _889 = _689 * 4;
                    bool _891 = _889 == 0;
                    bool _893 = _889 == 4;
                    bool _895 = _889 == 8;
                    bool _897 = _889 == 12;
                    bool _899 = _889 == 88;
                    bool _901 = _889 == 92;
                    bool _903 = _889 == 96;
                    if (_891)
                    {
                        _565 = _307;
                    }
                    int _905 = _565;
                    bool _907 = _889 == 16;
                    int _909 = _905;
                    if (_893)
                    {
                        _909 = _309;
                    }
                    int _911 = _909;
                    bool _913 = _889 == 20;
                    int _915 = _911;
                    if (_895)
                    {
                        _915 = _311;
                    }
                    int _917 = _915;
                    bool _919 = _889 == 24;
                    int _921 = _917;
                    if (_897)
                    {
                        _921 = _313;
                    }
                    int _923 = _921;
                    bool _925 = _889 == 84;
                    int _927 = int(_919);
                    int _929 = _913 ? 2 : 0;
                    int _931 = _927 | _929;
                    int _933 = _907 ? 4 : 0;
                    int _935 = _931 | _933;
                    int _937 = _925 ? 8 : 0;
                    int _939 = _935 | _937;
                    int _941 = _899 ? 16 : 0;
                    int _943 = _939 | _941;
                    int _945 = _901 ? 32 : 0;
                    int _947 = _943 | _945;
                    int _949 = _903 ? 64 : 0;
                    int _951 = _947 | _949;
                    int _953 = _951 & 8;
                    int _955 = _923;
                    if (_907)
                    {
                        _955 = _315;
                    }
                    int _957 = _955;
                    bool _959 = _889 == 80;
                    int _961 = _957;
                    if (_913)
                    {
                        _961 = _317;
                    }
                    int _963 = _961;
                    bool _965 = _889 == 76;
                    int _967 = _963;
                    if (_919)
                    {
                        _967 = _319;
                    }
                    int _969 = _967;
                    bool _971 = _889 == 28;
                    int _973 = int(_971);
                    int _975 = _965 ? 2 : 0;
                    int _977 = _973 | _975;
                    int _979 = _959 ? 4 : 0;
                    int _981 = _977 | _979;
                    int _983 = _925 ? 8 : 0;
                    int _985 = _981 | _983;
                    int _987 = _899 ? 16 : 0;
                    int _989 = _985 | _987;
                    int _991 = _901 ? 32 : 0;
                    int _993 = _989 | _991;
                    int _995 = _903 ? 64 : 0;
                    int _997 = _993 | _995;
                    int _999 = _997 & 2;
                    int _1001 = int(_971);
                    int _1003 = _965 ? 2 : 0;
                    int _1005 = _1001 | _1003;
                    int _1007 = _959 ? 4 : 0;
                    int _1009 = _1005 | _1007;
                    int _1011 = _925 ? 8 : 0;
                    int _1013 = _1009 | _1011;
                    int _1015 = _899 ? 16 : 0;
                    int _1017 = _1013 | _1015;
                    int _1019 = _901 ? 32 : 0;
                    int _1021 = _1017 | _1019;
                    int _1023 = _903 ? 64 : 0;
                    int _1025 = _1021 | _1023;
                    int _1027 = _1025 & 4;
                    int _1029 = _969;
                    _667 = _999;
                    _671 = _1027;
                    if (_971)
                    {
                        _1029 = _321;
                    }
                    int _1031 = _1029;
                    bool _1033 = _889 == 32;
                    int _1035 = _1031;
                    if (_1033)
                    {
                        _1035 = _323;
                    }
                    int _1037 = _1035;
                    bool _1039 = _889 == 36;
                    int _1041 = _1037;
                    if (_1039)
                    {
                        _1041 = _325;
                    }
                    int _1043 = _1041;
                    bool _1045 = _889 == 40;
                    int _1047 = _1043;
                    if (_1045)
                    {
                        _1047 = _327;
                    }
                    int _1049 = _1047;
                    bool _1051 = _889 == 44;
                    int _1053 = _1049;
                    if (_1051)
                    {
                        _1053 = _329;
                    }
                    int _1055 = _1053;
                    bool _1057 = _889 == 48;
                    int _1059 = _1055;
                    if (_1057)
                    {
                        _1059 = _331;
                    }
                    int _1061 = _1059;
                    bool _1063 = _889 == 52;
                    int _1065 = _1061;
                    if (_1063)
                    {
                        _1065 = _333;
                    }
                    int _1067 = _1065;
                    bool _1069 = _889 == 56;
                    int _1071 = _1067;
                    if (_1069)
                    {
                        _1071 = _335;
                    }
                    int _1073 = _1071;
                    bool _1075 = _889 == 60;
                    int _1077 = _1073;
                    if (_1075)
                    {
                        _1077 = _337;
                    }
                    int _1079 = _1077;
                    bool _1081 = _889 == 64;
                    int _1083 = _1079;
                    if (_1081)
                    {
                        _1083 = _339;
                    }
                    int _1085 = _1083;
                    bool _1087 = _889 == 68;
                    int _1089 = _1085;
                    if (_1087)
                    {
                        _1089 = _341;
                    }
                    int _1091 = _1089;
                    bool _1093 = _889 == 72;
                    int _1095 = int(_1093);
                    int _1097 = _965 ? 2 : 0;
                    int _1099 = _1095 | _1097;
                    int _1101 = _959 ? 4 : 0;
                    int _1103 = _1099 | _1101;
                    int _1105 = _925 ? 8 : 0;
                    int _1107 = _1103 | _1105;
                    int _1109 = _899 ? 16 : 0;
                    int _1111 = _1107 | _1109;
                    int _1113 = _901 ? 32 : 0;
                    int _1115 = _1111 | _1113;
                    int _1117 = _903 ? 64 : 0;
                    int _1119 = _1115 | _1117;
                    int _1121 = _1119 & 1;
                    int _1123 = _1091;
                    if (_1093)
                    {
                        _1123 = _343;
                    }
                    int _1125 = _1123;
                    bool _1127 = _889 == 4;
                    int _1129 = _1125;
                    if (_965)
                    {
                        _1129 = _345;
                    }
                    int _1131 = _1129;
                    int _1133 = _1131;
                    if (_959)
                    {
                        _1133 = _347;
                    }
                    int _1135 = _1133;
                    int _1137 = _1135;
                    if (_925)
                    {
                        _1137 = _349;
                    }
                    int _1139 = _1137;
                    bool _1141 = _889 == 0;
                    int _1143 = _1139;
                    if (_899)
                    {
                        _1143 = _351;
                    }
                    int _1145 = _1143;
                    bool _1147 = _889 == 8;
                    int _1149 = _1145;
                    if (_901)
                    {
                        _1149 = _353;
                    }
                    int _1151 = _1149;
                    bool _1153 = _889 == 12;
                    int _1155 = _1151;
                    if (_903)
                    {
                        _1155 = _355;
                    }
                    int _1157 = _1155;
                    int _1159 = _1157 + 1;
                    _669 = _1159;
                    if (_1141)
                    {
                        _567 = _1159;
                    }
                    int _1161 = _567;
                    bool _1163 = _889 == 16;
                    _617 = _1161;
                    if (_1127)
                    {
                        _569 = _1159;
                    }
                    int _1165 = _569;
                    bool _1167 = _889 == 20;
                    _619 = _1165;
                    if (_1147)
                    {
                        _571 = _1159;
                    }
                    int _1169 = _571;
                    bool _1171 = _889 == 24;
                    _621 = _1169;
                    if (_1153)
                    {
                        _573 = _1159;
                    }
                    int _1173 = _573;
                    bool _1175 = _889 == 28;
                    _623 = _1173;
                    if (_899)
                    {
                        _575 = _1159;
                    }
                    int _1177 = _575;
                    _661 = _1177;
                    if (_901)
                    {
                        _577 = _1159;
                    }
                    int _1179 = _577;
                    _663 = _1179;
                    if (_903)
                    {
                        _579 = _1159;
                    }
                    int _1181 = _579;
                    _665 = _1181;
                    if (_1163)
                    {
                        _581 = _1159;
                    }
                    int _1183 = _581;
                    bool _1185 = _889 == 32;
                    _625 = _1183;
                    if (_1167)
                    {
                        _583 = _1159;
                    }
                    int _1187 = _583;
                    bool _1189 = _889 == 36;
                    _627 = _1187;
                    if (_1171)
                    {
                        _585 = _1159;
                    }
                    int _1191 = _585;
                    bool _1193 = _889 == 40;
                    _629 = _1191;
                    if (_1175)
                    {
                        _587 = _1159;
                    }
                    int _1195 = _587;
                    bool _1197 = _889 == 44;
                    _631 = _1195;
                    if (_1185)
                    {
                        _589 = _1159;
                    }
                    int _1199 = _589;
                    bool _1201 = _889 == 48;
                    _633 = _1199;
                    if (_1189)
                    {
                        _591 = _1159;
                    }
                    int _1203 = _591;
                    bool _1205 = _889 == 52;
                    _635 = _1203;
                    if (_1193)
                    {
                        _593 = _1159;
                    }
                    int _1207 = _593;
                    bool _1209 = _889 == 56;
                    _637 = _1207;
                    if (_1197)
                    {
                        _595 = _1159;
                    }
                    int _1211 = _595;
                    bool _1213 = _889 == 60;
                    _639 = _1211;
                    if (_1201)
                    {
                        _597 = _1159;
                    }
                    int _1215 = _597;
                    bool _1217 = _889 == 64;
                    _641 = _1215;
                    if (_1205)
                    {
                        _599 = _1159;
                    }
                    int _1219 = _599;
                    bool _1221 = _889 == 68;
                    _643 = _1219;
                    if (_1209)
                    {
                        _601 = _1159;
                    }
                    int _1223 = _601;
                    bool _1225 = _953 != 0;
                    _645 = _1223;
                    if (_1213)
                    {
                        _603 = _1159;
                    }
                    int _1227 = _603;
                    bool _1229 = _1027 != 0;
                    _647 = _1227;
                    if (_1217)
                    {
                        _605 = _1159;
                    }
                    int _1231 = _605;
                    bool _1233 = _999 != 0;
                    _649 = _1231;
                    if (_1221)
                    {
                        _607 = _1159;
                    }
                    int _1235 = _607;
                    bool _1237 = _1121 != 0;
                    _651 = _1235;
                    if (_1225)
                    {
                        _609 = _1159;
                    }
                    int _1239 = _609;
                    _659 = _1239;
                    if (_1229)
                    {
                        _611 = _1159;
                    }
                    int _1241 = _611;
                    _657 = _1241;
                    if (_1233)
                    {
                        _613 = _1159;
                    }
                    int _1243 = _613;
                    _655 = _1243;
                    if (_1237)
                    {
                        _653 = _1159;
                    }
                }
            }
            _1245 = _615;
            int _1247 = _617;
            int _1249 = _619;
            int _1251 = _621;
            int _1253 = _623;
            int _1255 = _625;
            int _1257 = _627;
            int _1259 = _629;
            int _1261 = _631;
            int _1263 = _633;
            int _1265 = _635;
            int _1267 = _637;
            int _1269 = _639;
            int _1271 = _641;
            int _1273 = _643;
            int _1275 = _645;
            int _1277 = _647;
            int _1279 = _649;
            int _1281 = _651;
            int _1283 = _653;
            int _1285 = _655;
            int _1287 = _657;
            int _1289 = _659;
            int _1291 = _661;
            int _1293 = _663;
            int _1295 = _665;
            int _1297 = _667;
            int _1299 = _669;
            int _1301 = _671;
            float2 _4068 = float2(_479, _373);
            float _1303 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4068, float2(0.0), isnan(_4068)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4068, float2(0.0), isnan(_4068)), level(0.0)).x;
            int _1305 = _303 + 1;
            bool _1307 = _1305 >= 3;
            float _1309 = precise::min(_1303, _357);
            _291 = !_1307;
            _235 = _1305;
            _237 = _1245;
            _239 = _1247;
            _241 = _1249;
            _243 = _1251;
            _245 = _1253;
            _247 = _1255;
            _249 = _1257;
            _251 = _1259;
            _253 = _1261;
            _255 = _1263;
            _257 = _1265;
            _259 = _1267;
            _261 = _1269;
            _263 = _1271;
            _265 = _1273;
            _267 = _1275;
            _269 = _1277;
            _271 = _1279;
            _273 = _1281;
            _275 = _1283;
            _277 = _1285;
            _279 = _1287;
            _281 = _1289;
            _283 = _1291;
            _285 = _1293;
            _287 = _1295;
            _289 = _1309;
            _757 = _1247;
            _763 = _1249;
            _769 = _1251;
            _775 = _1253;
            _751 = _1255;
            _781 = _1257;
            _787 = _1259;
            _799 = _1261;
            _805 = _1263;
            _811 = _1265;
            _817 = _1267;
            _793 = _1269;
            _823 = _1271;
            _829 = _1273;
            _841 = _1275;
            _847 = _1277;
            _853 = _1279;
            _857 = _1281;
            _835 = _1283;
            _863 = _1285;
            _867 = _1287;
            _871 = _1289;
            _875 = _1291;
            _879 = _1293;
            _883 = _1295;
            _673 = _1309;
            _675 = as_type<int>(_1303);
            _743 = _1297;
            _677 = _1299;
            _745 = _1301;
        } while (_291);
        if (!_887)
        {
            _885 = _1245;
        }
        _887 = false;
        _1311 = _757;
        _1313 = _763;
        _1315 = _769;
        _1317 = _775;
        _1319 = _751;
        _1321 = _781;
        _1323 = _787;
        _1325 = _799;
        _1327 = _805;
        _1329 = _811;
        _1331 = _817;
        _1333 = _793;
        _1335 = _823;
        _1337 = _829;
        _1339 = _841;
        _1341 = _847;
        _1343 = _853;
        _1345 = _857;
        _1347 = _835;
        _1349 = _863;
        _1351 = _867;
        _1353 = _871;
        _1355 = _875;
        _1357 = _879;
        _1359 = _883;
        _1361 = _673;
        _1363 = _885;
        int _1365 = _675;
        int _1367 = _743;
        int _1369 = _677;
        int _1371 = _745;
        int _1373 = _151 + 1;
        bool _1375 = _1373 >= 3;
        _149 = !_1375;
        _91 = _1373;
        _93 = _1363;
        _95 = _1311;
        _97 = _1313;
        _99 = _1315;
        _101 = _1317;
        _103 = _1319;
        _105 = _1321;
        _107 = _1323;
        _109 = _1325;
        _111 = _1327;
        _113 = _1329;
        _115 = _1331;
        _117 = _1333;
        _119 = _1335;
        _121 = _1337;
        _123 = _1339;
        _125 = _1341;
        _127 = _1343;
        _129 = _1345;
        _131 = _1347;
        _133 = _1349;
        _135 = _1351;
        _137 = _1353;
        _139 = _1355;
        _141 = _1357;
        _143 = _1359;
        _145 = _1361;
        _1377 = _1365;
        _1379 = _1367;
        _1381 = _1369;
        _1383 = _1371;
        _1385 = _1365;
        _1387 = _1311;
    } while (_149);
    bool _1389 = _1363 > 0;
    if (!_1389)
    {
        _679 = 0;
    }
    int _1391 = _679;
    bool _1393 = !_1389;
    int _1395 = _1391;
    if (!_1393)
    {
        bool _1397 = _1363 > 3;
        bool _1399 = !_1397;
        int _1401 = 0;
        int _1403 = 0;
        int _1405 = 0;
        int _1407 = 0;
        int _1409 = 0;
        int _1411 = -1;
        int _1413 = 0;
        if (!_1399)
        {
            int _1415 = _1363 + (-3);
            _1411 = 0;
            bool _1417;
            do
            {
                int _1419 = _1401;
                int _1421 = _1403;
                int _1423 = _1377;
                int _1425 = _1379;
                int _1427 = _1381;
                int _1429 = _1405;
                int _1431 = _1383;
                int _1433 = _1419 * 4;
                int _1435 = _1419 + 1;
                int _1437 = _1419 + 2;
                bool _1439 = _1433 == 0;
                int _1441 = _1435 * 4;
                bool _1443 = _1433 == 4;
                int _1445 = _1437 * 4;
                bool _1447 = _1433 == 8;
                bool _1449 = _1433 == 12;
                bool _1451 = _1433 == 16;
                bool _1453 = _1441 == 8;
                int _1455 = _1419 + 3;
                int _1457 = _1423;
                int _1459 = _1425;
                int _1461 = _1427;
                int _1463 = _1431;
                int _1465 = _1421;
                int _1467 = _1429;
                if (_1439)
                {
                    _1457 = _1311;
                }
                int _1469 = _1457;
                bool _1471 = _1433 == 24;
                int _1473 = _1469;
                if (_1443)
                {
                    _1473 = _1313;
                }
                int _1475 = _1473;
                bool _1477 = _1433 == 20;
                int _1479 = _1475;
                if (_1447)
                {
                    _1479 = _1315;
                }
                int _1481 = _1479;
                bool _1483 = _1433 == 32;
                int _1485 = _1481;
                if (_1449)
                {
                    _1485 = _1317;
                }
                int _1487 = _1485;
                bool _1489 = _1433 == 28;
                int _1491 = _1487;
                if (_1451)
                {
                    _1491 = _1319;
                }
                int _1493 = _1491;
                bool _1495 = _1433 == 40;
                int _1497 = _1455 * 4;
                int _1499 = _1493;
                if (_1477)
                {
                    _1499 = _1321;
                }
                int _1501 = _1499;
                bool _1503 = _1433 == 36;
                int _1505 = _1501;
                if (_1471)
                {
                    _1505 = _1323;
                }
                int _1507 = _1505;
                bool _1509 = _1441 == 0;
                int _1511 = _1507;
                if (_1489)
                {
                    _1511 = _1325;
                }
                int _1513 = _1511;
                bool _1515 = _1441 == 4;
                int _1517 = _1513;
                if (_1483)
                {
                    _1517 = _1327;
                }
                int _1519 = _1517;
                bool _1521 = _1441 == 12;
                int _1523 = _1519;
                if (_1503)
                {
                    _1523 = _1329;
                }
                int _1525 = _1523;
                bool _1527 = _1433 == 44;
                int _1529 = _1525;
                if (_1495)
                {
                    _1529 = _1331;
                }
                int _1531 = _1529;
                bool _1533 = _1441 == 16;
                int _1535 = _1531;
                if (_1509)
                {
                    _1459 = _1311;
                }
                int _1537 = _1459;
                bool _1539 = _1433 == 48;
                int _1541 = _1537;
                if (_1515)
                {
                    _1541 = _1313;
                }
                int _1543 = _1541;
                bool _1545 = _1441 == 20;
                int _1547 = _1543;
                if (_1453)
                {
                    _1547 = _1315;
                }
                int _1549 = _1547;
                bool _1551 = _1441 == 24;
                int _1553 = _1549;
                if (_1521)
                {
                    _1553 = _1317;
                }
                int _1555 = _1553;
                bool _1557 = _1441 == 28;
                int _1559 = _1555;
                if (_1527)
                {
                    _1535 = _1333;
                }
                int _1561 = _1535;
                bool _1563 = _1433 == 52;
                int _1565 = _1561;
                if (_1533)
                {
                    _1559 = _1319;
                }
                int _1567 = _1559;
                bool _1569 = _1441 == 32;
                int _1571 = _1567;
                if (_1539)
                {
                    _1565 = _1335;
                }
                int _1573 = _1565;
                bool _1575 = _1433 == 56;
                int _1577 = _1573;
                if (_1545)
                {
                    _1571 = _1321;
                }
                int _1579 = _1571;
                bool _1581 = _1441 == 36;
                int _1583 = _1579;
                if (_1551)
                {
                    _1583 = _1323;
                }
                int _1585 = _1583;
                bool _1587 = _1441 == 40;
                int _1589 = _1585;
                if (_1557)
                {
                    _1589 = _1325;
                }
                int _1591 = _1589;
                bool _1593 = _1441 == 44;
                int _1595 = _1591;
                if (_1563)
                {
                    _1577 = _1337;
                }
                int _1597 = _1577;
                bool _1599 = _1433 == 60;
                int _1601 = _1597;
                if (_1569)
                {
                    _1595 = _1327;
                }
                int _1603 = _1595;
                bool _1605 = _1441 == 48;
                int _1607 = _1603;
                if (_1575)
                {
                    _1601 = _1339;
                }
                int _1609 = _1601;
                bool _1611 = _1433 == 64;
                int _1613 = _1609;
                if (_1581)
                {
                    _1607 = _1329;
                }
                int _1615 = _1607;
                int _1617 = _1615;
                if (_1587)
                {
                    _1617 = _1331;
                }
                int _1619 = _1617;
                bool _1621 = _1441 == 52;
                int _1623 = _1619;
                if (_1593)
                {
                    _1623 = _1333;
                }
                int _1625 = _1623;
                bool _1627 = _1441 == 56;
                bool _1629 = _1441 == 60;
                int _1631 = _1625;
                if (_1599)
                {
                    _1613 = _1341;
                }
                int _1633 = _1613;
                bool _1635 = _1445 == 0;
                int _1637 = _1633;
                if (_1605)
                {
                    _1631 = _1335;
                }
                int _1639 = _1631;
                bool _1641 = _1433 == 68;
                int _1643 = _1639;
                if (_1611)
                {
                    _1637 = _1343;
                }
                int _1645 = _1637;
                bool _1647 = _1445 == 4;
                int _1649 = _1645;
                if (_1621)
                {
                    _1643 = _1337;
                }
                int _1651 = _1643;
                bool _1653 = _1445 == 8;
                int _1655 = _1651;
                if (_1627)
                {
                    _1655 = _1339;
                }
                int _1657 = _1655;
                bool _1659 = _1445 == 12;
                int _1661 = _1657;
                if (_1629)
                {
                    _1661 = _1341;
                }
                int _1663 = _1661;
                bool _1665 = _1445 == 16;
                int _1667 = _1663;
                if (_1635)
                {
                    _1461 = _1311;
                }
                int _1669 = _1461;
                bool _1671 = _1441 == 64;
                int _1673 = _1669;
                if (_1641)
                {
                    _1649 = _1345;
                }
                int _1675 = _1649;
                bool _1677 = _1445 == 20;
                int _1679 = _1675;
                if (_1647)
                {
                    _1673 = _1313;
                }
                int _1681 = _1673;
                bool _1683 = _1433 == 72;
                int _1685 = _1681;
                if (_1653)
                {
                    _1685 = _1315;
                }
                int _1687 = _1685;
                bool _1689 = _1445 == 24;
                int _1691 = _1687;
                if (_1659)
                {
                    _1691 = _1317;
                }
                int _1693 = _1691;
                bool _1695 = _1445 == 28;
                int _1697 = _1693;
                if (_1665)
                {
                    _1697 = _1319;
                }
                int _1699 = _1697;
                bool _1701 = _1445 == 32;
                int _1703 = _1699;
                if (_1671)
                {
                    _1667 = _1343;
                }
                int _1705 = _1667;
                bool _1707 = _1441 == 68;
                int _1709 = _1705;
                if (_1677)
                {
                    _1703 = _1321;
                }
                int _1711 = _1703;
                bool _1713 = _1445 == 36;
                int _1715 = _1711;
                if (_1683)
                {
                    _1679 = _1347;
                }
                int _1717 = _1679;
                bool _1719 = _1433 == 76;
                int _1721 = _1717;
                if (_1689)
                {
                    _1715 = _1323;
                }
                int _1723 = _1715;
                bool _1725 = _1445 == 40;
                int _1727 = _1723;
                if (_1695)
                {
                    _1727 = _1325;
                }
                int _1729 = _1727;
                bool _1731 = _1445 == 44;
                int _1733 = _1729;
                if (_1701)
                {
                    _1733 = _1327;
                }
                int _1735 = _1733;
                bool _1737 = _1445 == 48;
                int _1739 = _1735;
                if (_1707)
                {
                    _1709 = _1345;
                }
                int _1741 = _1709;
                bool _1743 = _1441 == 72;
                int _1745 = _1741;
                if (_1713)
                {
                    _1739 = _1329;
                }
                int _1747 = _1739;
                bool _1749 = _1445 == 52;
                int _1751 = _1747;
                if (_1719)
                {
                    _1721 = _1349;
                }
                int _1753 = _1721;
                bool _1755 = _1433 == 80;
                int _1757 = _1753;
                if (_1725)
                {
                    _1751 = _1331;
                }
                int _1759 = _1751;
                bool _1761 = _1445 == 56;
                int _1763 = _1759;
                if (_1731)
                {
                    _1763 = _1333;
                }
                int _1765 = _1763;
                bool _1767 = _1445 == 60;
                int _1769 = _1765;
                if (_1737)
                {
                    _1769 = _1335;
                }
                int _1771 = _1769;
                bool _1773 = _1441 == 76;
                int _1775 = _1771;
                if (_1743)
                {
                    _1745 = _1347;
                }
                int _1777 = _1745;
                bool _1779 = _1445 == 64;
                int _1781 = _1777;
                if (_1749)
                {
                    _1775 = _1337;
                }
                int _1783 = _1775;
                bool _1785 = _1433 == 84;
                int _1787 = _1783;
                if (_1755)
                {
                    _1757 = _1351;
                }
                int _1789 = _1757;
                bool _1791 = _1445 == 68;
                int _1793 = _1789;
                if (_1761)
                {
                    _1787 = _1339;
                }
                int _1795 = _1787;
                bool _1797 = _1445 == 72;
                int _1799 = _1795;
                if (_1767)
                {
                    _1799 = _1341;
                }
                int _1801 = _1799;
                bool _1803 = _1445 == 76;
                int _1805 = _1801;
                if (_1773)
                {
                    _1781 = _1349;
                }
                int _1807 = _1781;
                bool _1809 = _1441 == 80;
                int _1811 = _1807;
                if (_1779)
                {
                    _1805 = _1343;
                }
                int _1813 = _1805;
                bool _1815 = _1497 == 0;
                int _1817 = _1813;
                if (_1785)
                {
                    _1793 = _1353;
                }
                int _1819 = _1793;
                bool _1821 = _1497 == 4;
                int _1823 = _1819;
                if (_1791)
                {
                    _1817 = _1345;
                }
                int _1825 = _1817;
                bool _1827 = _1445 == 80;
                int _1829 = _1825;
                if (_1797)
                {
                    _1829 = _1347;
                }
                int _1831 = _1829;
                bool _1833 = _1497 == 8;
                int _1835 = _1831;
                if (_1803)
                {
                    _1835 = _1349;
                }
                int _1837 = _1835;
                bool _1839 = _1433 == 88;
                int _1841 = _1837;
                if (_1809)
                {
                    _1811 = _1351;
                }
                int _1843 = _1811;
                bool _1845 = _1441 == 84;
                int _1847 = _1843;
                if (_1815)
                {
                    _1463 = _1311;
                }
                int _1849 = _1463;
                bool _1851 = _1497 == 12;
                int _1853 = _1849;
                if (_1821)
                {
                    _1853 = _1313;
                }
                int _1855 = _1853;
                bool _1857 = _1445 == 84;
                int _1859 = _1855;
                if (_1827)
                {
                    _1841 = _1351;
                }
                int _1861 = _1841;
                bool _1863 = _1497 == 16;
                int _1865 = _1861;
                if (_1833)
                {
                    _1859 = _1315;
                }
                int _1867 = _1859;
                bool _1869 = _1433 == 92;
                int _1871 = _1867;
                if (_1839)
                {
                    _1823 = _1355;
                }
                int _1873 = _1823;
                bool _1875 = _1497 == 20;
                int _1877 = _1873;
                if (_1845)
                {
                    _1847 = _1353;
                }
                int _1879 = _1847;
                bool _1881 = _1497 == 24;
                int _1883 = _1879;
                if (_1851)
                {
                    _1871 = _1317;
                }
                int _1885 = _1871;
                bool _1887 = _1441 == 88;
                int _1889 = _1885;
                if (_1857)
                {
                    _1865 = _1353;
                }
                int _1891 = _1865;
                bool _1893 = _1445 == 88;
                int _1895 = _1891;
                if (_1863)
                {
                    _1889 = _1319;
                }
                int _1897 = _1889;
                bool _1899 = _1497 == 28;
                int _1901 = _1897;
                if (_1869)
                {
                    _1877 = _1357;
                }
                int _1903 = _1877;
                bool _1905 = _1497 == 32;
                int _1907 = _1903;
                if (_1875)
                {
                    _1901 = _1321;
                }
                int _1909 = _1901;
                bool _1911 = _1433 == 96;
                int _1913 = _1909;
                if (_1881)
                {
                    _1913 = _1323;
                }
                int _1915 = _1913;
                bool _1917 = _1497 == 36;
                int _1919 = _1915;
                if (_1887)
                {
                    _1883 = _1355;
                }
                int _1921 = _1883;
                bool _1923 = _1497 == 40;
                int _1925 = _1921;
                if (_1893)
                {
                    _1895 = _1355;
                }
                int _1927 = _1895;
                bool _1929 = _1441 == 92;
                int _1931 = _1927;
                if (_1899)
                {
                    _1919 = _1325;
                }
                int _1933 = _1919;
                bool _1935 = _1497 == 44;
                int _1937 = _1933;
                if (_1905)
                {
                    _1937 = _1327;
                }
                int _1939 = _1937;
                bool _1941 = _1497 == 48;
                int _1943 = _1939;
                if (_1911)
                {
                    _1907 = _1359;
                }
                int _1945 = _1907;
                bool _1947 = _1441 == 96;
                int _1949 = _1945;
                if (_1917)
                {
                    _1943 = _1329;
                }
                int _1951 = _1943;
                bool _1953 = _1497 == 52;
                int _1955 = _1951;
                if (_1923)
                {
                    _1955 = _1331;
                }
                int _1957 = _1955;
                bool _1959 = _1421 >= _1945;
                int _1961 = _1957;
                if (_1929)
                {
                    _1925 = _1357;
                }
                int _1963 = _1925;
                bool _1965 = _1497 == 56;
                int _1967 = _1963;
                if (_1935)
                {
                    _1961 = _1333;
                }
                int _1969 = _1961;
                bool _1971 = _1497 == 60;
                int _1973 = _1969;
                if (_1941)
                {
                    _1973 = _1335;
                }
                int _1975 = _1973;
                bool _1977 = _1497 == 64;
                int _1979 = _1975;
                if (_1947)
                {
                    _1967 = _1359;
                }
                int _1981 = _1967;
                bool _1983 = _1445 == 92;
                _1379 = _1981;
                if (_1953)
                {
                    _1979 = _1337;
                }
                int _1985 = _1979;
                bool _1987 = _1497 == 68;
                int _1989 = _1985;
                if (!_1959)
                {
                    _1465 = _1945;
                }
                int _1991 = _1465;
                int _1993 = _1991;
                if (_1965)
                {
                    _1989 = _1339;
                }
                int _1995 = _1989;
                bool _1997 = _1497 == 72;
                int _1999 = _1995;
                if (_1971)
                {
                    _1999 = _1341;
                }
                int _2001 = _1999;
                bool _2003 = _1991 >= _1981;
                int _2005 = _2001;
                if (_1977)
                {
                    _2005 = _1343;
                }
                int _2007 = _2005;
                bool _2009 = _1445 == 96;
                int _2011 = _2007;
                if (_1983)
                {
                    _1931 = _1357;
                }
                int _2013 = _1931;
                bool _2015 = _1497 == 76;
                int _2017 = _2013;
                if (_1987)
                {
                    _2011 = _1345;
                }
                int _2019 = _2011;
                bool _2021 = _1497 == 80;
                int _2023 = _2019;
                if (_1997)
                {
                    _2023 = _1347;
                }
                int _2025 = _2023;
                bool _2027 = _1497 == 84;
                int _2029 = _2025;
                if (_2003)
                {
                    _1949 = _1991;
                }
                int _2031 = _1949;
                int _2033 = _2031;
                if (_2009)
                {
                    _2017 = _1359;
                }
                int _2035 = _2017;
                bool _2037 = _1497 == 88;
                _1381 = _2035;
                if (!_2003)
                {
                    _2033 = _1981;
                }
                int _2039 = _2033;
                int _2041 = _2039;
                if (_2015)
                {
                    _2029 = _1349;
                }
                int _2043 = _2029;
                bool _2045 = _1497 == 92;
                int _2047 = _2043;
                if (_2021)
                {
                    _2047 = _1351;
                }
                int _2049 = _2047;
                bool _2051 = _2039 >= _2035;
                int _2053 = _2049;
                if (_1959)
                {
                    _1993 = _1429;
                }
                int _2055 = _1993;
                int _2057 = _2055;
                if (_2027)
                {
                    _2053 = _1353;
                }
                int _2059 = _2053;
                bool _2061 = _1497 == 96;
                int _2063 = _2059;
                if (!_1959)
                {
                    _2057 = _1419;
                }
                int _2065 = _2057;
                int _2067 = _1419 + 4;
                _1401 = _2067;
                int _2069 = _2065;
                _1407 = _2067;
                if (_2037)
                {
                    _2063 = _1355;
                }
                int _2071 = _2063;
                int _2073 = _2071;
                if (!_2003)
                {
                    _2069 = _1435;
                }
                int _2075 = _2069;
                bool _2077 = _2067 >= _1415;
                int _2079 = _2075;
                if (_2045)
                {
                    _2073 = _1357;
                }
                int _2081 = _2073;
                int _2083 = _2081;
                if (!_2051)
                {
                    _2041 = _2035;
                }
                int _2085 = _2041;
                _1377 = _2085;
                _1385 = _2085;
                if (!_2051)
                {
                    _2079 = _1437;
                }
                int _2087 = _2079;
                int _2089 = _2087;
                if (_2061)
                {
                    _2083 = _1359;
                }
                int _2091 = _2083;
                bool _2093 = _2085 >= _2091;
                _1383 = _2091;
                if (_2093)
                {
                    _1467 = _2087;
                }
                int _2095 = _1467;
                int _2097 = _2095;
                if (_2093)
                {
                    _2089 = _2085;
                }
                int _2099 = _2089;
                int _2101 = _2099;
                if (!_2093)
                {
                    _2101 = _2091;
                }
                int _2103 = _2101;
                _1403 = _2103;
                _1409 = _2103;
                if (!_2093)
                {
                    _2097 = _1455;
                }
                int _2105 = _2097;
                _1417 = !_2077;
                _1405 = _2105;
                _1413 = _2105;
            } while (_1417);
        }
        int _2107 = _1407;
        int _2109 = _1409;
        int _2111 = _1385;
        int _2113 = _1411;
        int _2115 = _1413;
        int _2117 = -_2107;
        int _2119 = _1363 + _2117;
        bool _2121 = _2119 > 1;
        bool _2123 = !_2121;
        int _2125 = _2111;
        int _2127 = _2119;
        int _2129 = _2109;
        int _2131 = _2115;
        int _2133 = _2107;
        int _2135 = _2113;
        int _2137 = _2109;
        int _2139 = _2115;
        if (!_2123)
        {
            int _2141 = _2107 * 4;
            int _2143 = _2107 + 1;
            bool _2145 = _2141 == 0;
            int _2147 = _2143 * 4;
            bool _2149 = _2141 == 4;
            bool _2151 = _2141 == 8;
            bool _2153 = _2141 == 12;
            bool _2155 = _2141 == 24;
            bool _2157 = _2147 == 0;
            bool _2159 = _2141 == 40;
            if (_2145)
            {
                _2125 = _1311;
            }
            int _2161 = _2125;
            bool _2163 = _2141 == 16;
            int _2165 = _2161;
            if (_2149)
            {
                _2165 = _1313;
            }
            int _2167 = _2165;
            bool _2169 = _2141 == 20;
            int _2171 = _2167;
            if (_2151)
            {
                _2171 = _1315;
            }
            int _2173 = _2171;
            bool _2175 = _2141 == 36;
            int _2177 = _2173;
            if (_2153)
            {
                _2177 = _1317;
            }
            int _2179 = _2177;
            bool _2181 = _2141 == 28;
            int _2183 = _2179;
            if (_2157)
            {
                _2127 = _1311;
            }
            int _2185 = _2127;
            bool _2187 = _2147 == 16;
            int _2189 = _2185;
            if (_2163)
            {
                _2183 = _1319;
            }
            int _2191 = _2183;
            bool _2193 = _2141 == 32;
            int _2195 = _2191;
            if (_2169)
            {
                _2195 = _1321;
            }
            int _2197 = _2195;
            bool _2199 = _2141 == 48;
            int _2201 = _2197;
            if (_2155)
            {
                _2201 = _1323;
            }
            int _2203 = _2201;
            bool _2205 = _2147 == 4;
            int _2207 = _2203;
            if (_2181)
            {
                _2207 = _1325;
            }
            int _2209 = _2207;
            bool _2211 = _2141 == 44;
            int _2213 = _2209;
            if (_2193)
            {
                _2213 = _1327;
            }
            int _2215 = _2213;
            bool _2217 = _2147 == 8;
            int _2219 = _2215;
            if (_2175)
            {
                _2219 = _1329;
            }
            int _2221 = _2219;
            bool _2223 = _2147 == 12;
            int _2225 = _2221;
            if (_2205)
            {
                _2189 = _1313;
            }
            int _2227 = _2189;
            bool _2229 = _2141 == 52;
            int _2231 = _2227;
            if (_2159)
            {
                _2225 = _1331;
            }
            int _2233 = _2225;
            bool _2235 = _2147 == 20;
            int _2237 = _2233;
            if (_2211)
            {
                _2237 = _1333;
            }
            int _2239 = _2237;
            bool _2241 = _2147 == 24;
            int _2243 = _2239;
            if (_2199)
            {
                _2243 = _1335;
            }
            int _2245 = _2243;
            bool _2247 = _2141 == 60;
            int _2249 = _2245;
            if (_2217)
            {
                _2231 = _1315;
            }
            int _2251 = _2231;
            bool _2253 = _2141 == 56;
            int _2255 = _2251;
            if (_2223)
            {
                _2255 = _1317;
            }
            int _2257 = _2255;
            bool _2259 = _2147 == 28;
            int _2261 = _2257;
            if (_2187)
            {
                _2261 = _1319;
            }
            int _2263 = _2261;
            bool _2265 = _2147 == 32;
            int _2267 = _2263;
            if (_2235)
            {
                _2267 = _1321;
            }
            int _2269 = _2267;
            bool _2271 = _2147 == 36;
            int _2273 = _2269;
            if (_2229)
            {
                _2249 = _1337;
            }
            int _2275 = _2249;
            bool _2277 = _2141 == 64;
            int _2279 = _2275;
            if (_2241)
            {
                _2273 = _1323;
            }
            int _2281 = _2273;
            bool _2283 = _2141 == 68;
            int _2285 = _2281;
            if (_2253)
            {
                _2279 = _1339;
            }
            int _2287 = _2279;
            bool _2289 = _2147 == 40;
            int _2291 = _2287;
            if (_2259)
            {
                _2285 = _1325;
            }
            int _2293 = _2285;
            bool _2295 = _2141 == 72;
            int _2297 = _2293;
            if (_2247)
            {
                _2291 = _1341;
            }
            int _2299 = _2291;
            bool _2301 = _2147 == 44;
            int _2303 = _2299;
            if (_2265)
            {
                _2297 = _1327;
            }
            int _2305 = _2297;
            int _2307 = _2305;
            if (_2271)
            {
                _2307 = _1329;
            }
            int _2309 = _2307;
            int _2311 = _2309;
            if (_2277)
            {
                _2303 = _1343;
            }
            int _2313 = _2303;
            bool _2315 = _2141 == 76;
            int _2317 = _2313;
            if (_2283)
            {
                _2317 = _1345;
            }
            int _2319 = _2317;
            bool _2321 = _2141 == 80;
            bool _2323 = _2147 == 48;
            int _2325 = _2319;
            if (_2289)
            {
                _2311 = _1331;
            }
            int _2327 = _2311;
            bool _2329 = _2147 == 52;
            int _2331 = _2327;
            if (_2295)
            {
                _2325 = _1347;
            }
            int _2333 = _2325;
            bool _2335 = _2141 == 84;
            int _2337 = _2333;
            if (_2301)
            {
                _2331 = _1333;
            }
            int _2339 = _2331;
            bool _2341 = _2147 == 56;
            bool _2343 = _2147 == 60;
            int _2345 = _2339;
            if (_2315)
            {
                _2337 = _1349;
            }
            int _2347 = _2337;
            bool _2349 = _2141 == 88;
            int _2351 = _2347;
            if (_2321)
            {
                _2351 = _1351;
            }
            int _2353 = _2351;
            bool _2355 = _2141 == 92;
            int _2357 = _2353;
            if (_2323)
            {
                _2345 = _1335;
            }
            int _2359 = _2345;
            bool _2361 = _2147 == 64;
            int _2363 = _2359;
            if (_2329)
            {
                _2363 = _1337;
            }
            int _2365 = _2363;
            bool _2367 = _2147 == 68;
            int _2369 = _2365;
            if (_2335)
            {
                _2357 = _1353;
            }
            int _2371 = _2357;
            bool _2373 = _2141 == 96;
            int _2375 = _2371;
            if (_2341)
            {
                _2369 = _1339;
            }
            int _2377 = _2369;
            bool _2379 = _2147 == 72;
            int _2381 = _2377;
            if (_2343)
            {
                _2381 = _1341;
            }
            int _2383 = _2381;
            bool _2385 = _2147 == 76;
            int _2387 = _2383;
            if (_2349)
            {
                _2375 = _1355;
            }
            int _2389 = _2375;
            int _2391 = _2389;
            if (_2355)
            {
                _2391 = _1357;
            }
            int _2393 = _2391;
            bool _2395 = _2147 == 96;
            int _2397 = _2393;
            if (_2361)
            {
                _2387 = _1343;
            }
            int _2399 = _2387;
            bool _2401 = _2147 == 80;
            int _2403 = _2399;
            if (_2367)
            {
                _2403 = _1345;
            }
            int _2405 = _2403;
            bool _2407 = _2147 == 84;
            int _2409 = _2405;
            if (_2373)
            {
                _2397 = _1359;
            }
            int _2411 = _2397;
            bool _2413 = _2147 == 92;
            if (_2379)
            {
                _2409 = _1347;
            }
            int _2415 = _2409;
            bool _2417 = _2147 == 88;
            int _2419 = _2415;
            if (_2385)
            {
                _2419 = _1349;
            }
            int _2421 = _2419;
            bool _2423 = _2109 >= _2411;
            int _2425 = _2421;
            if (_2401)
            {
                _2425 = _1351;
            }
            int _2427 = _2425;
            int _2429 = _2427;
            if (_2407)
            {
                _2429 = _1353;
            }
            int _2431 = _2429;
            int _2433 = _2431;
            if (_2417)
            {
                _2433 = _1355;
            }
            int _2435 = _2433;
            int _2437 = _2435;
            _2135 = 0;
            if (_2413)
            {
                _2437 = _1357;
            }
            int _2439 = _2437;
            int _2441 = _2439;
            if (_2395)
            {
                _2441 = _1359;
            }
            int _2443 = _2441;
            if (!_2423)
            {
                _2129 = _2411;
            }
            int _2445 = _2129;
            _2137 = _2445;
            if (!_2423)
            {
                _2131 = _2107;
            }
            int _2447 = _2131;
            int _2449 = _2143 + 1;
            bool _2451 = _2445 >= _2443;
            int _2453 = _2447;
            _2133 = _2449;
            if (!_2451)
            {
                _2453 = _2143;
            }
            int _2455 = _2453;
            _2139 = _2455;
            if (!_2451)
            {
                _2137 = _2443;
            }
        }
        int _2457 = _2133;
        int _2459 = _2135;
        int _2461 = _2137;
        int _2463 = _2139;
        bool _2465 = _2457 < _1363;
        int _2467 = (_2465 ? (-1) : 0) | _2459;
        int _2469 = ~_2467;
        int _2471 = _2463;
        if (!(_2469 != 0))
        {
            int _2473 = _2457 << 2;
            bool _2475 = _2473 == 4;
            bool _2477 = _2473 == 8;
            bool _2479 = _2473 == 12;
            bool _2481 = _2473 == 16;
            if (_2475)
            {
                _1387 = _1313;
            }
            int _2483 = _1387;
            bool _2485 = _2473 == 20;
            int _2487 = _2483;
            if (_2477)
            {
                _2487 = _1315;
            }
            int _2489 = _2487;
            bool _2491 = _2473 == 24;
            int _2493 = _2489;
            if (_2479)
            {
                _2493 = _1317;
            }
            int _2495 = _2493;
            bool _2497 = _2473 == 28;
            int _2499 = _2495;
            if (_2481)
            {
                _2499 = _1319;
            }
            int _2501 = _2499;
            bool _2503 = _2473 == 32;
            int _2505 = _2501;
            if (_2485)
            {
                _2505 = _1321;
            }
            int _2507 = _2505;
            bool _2509 = _2473 == 36;
            int _2511 = _2507;
            if (_2491)
            {
                _2511 = _1323;
            }
            int _2513 = _2511;
            bool _2515 = _2473 == 40;
            int _2517 = _2513;
            if (_2497)
            {
                _2517 = _1325;
            }
            int _2519 = _2517;
            bool _2521 = _2473 == 44;
            int _2523 = _2519;
            if (_2503)
            {
                _2523 = _1327;
            }
            int _2525 = _2523;
            bool _2527 = _2473 == 48;
            int _2529 = _2525;
            if (_2509)
            {
                _2529 = _1329;
            }
            int _2531 = _2529;
            bool _2533 = _2473 == 52;
            int _2535 = _2531;
            if (_2515)
            {
                _2535 = _1331;
            }
            int _2537 = _2535;
            bool _2539 = _2473 == 56;
            int _2541 = _2537;
            if (_2521)
            {
                _2541 = _1333;
            }
            int _2543 = _2541;
            bool _2545 = _2473 == 60;
            int _2547 = _2543;
            if (_2527)
            {
                _2547 = _1335;
            }
            int _2549 = _2547;
            bool _2551 = _2473 == 64;
            int _2553 = _2549;
            if (_2533)
            {
                _2553 = _1337;
            }
            int _2555 = _2553;
            bool _2557 = _2473 == 68;
            int _2559 = _2555;
            if (_2539)
            {
                _2559 = _1339;
            }
            int _2561 = _2559;
            bool _2563 = _2473 == 72;
            int _2565 = _2561;
            if (_2545)
            {
                _2565 = _1341;
            }
            int _2567 = _2565;
            bool _2569 = _2473 == 76;
            int _2571 = _2567;
            if (_2551)
            {
                _2571 = _1343;
            }
            int _2573 = _2571;
            bool _2575 = _2473 == 80;
            int _2577 = _2573;
            if (_2557)
            {
                _2577 = _1345;
            }
            int _2579 = _2577;
            bool _2581 = _2473 == 84;
            int _2583 = _2579;
            if (_2563)
            {
                _2583 = _1347;
            }
            int _2585 = _2583;
            bool _2587 = _2473 == 88;
            int _2589 = _2585;
            if (_2569)
            {
                _2589 = _1349;
            }
            int _2591 = _2589;
            bool _2593 = _2473 == 92;
            int _2595 = _2591;
            if (_2575)
            {
                _2595 = _1351;
            }
            int _2597 = _2595;
            bool _2599 = _2473 == 96;
            int _2601 = _2597;
            if (_2581)
            {
                _2601 = _1353;
            }
            int _2603 = _2601;
            int _2605 = _2603;
            if (_2587)
            {
                _2605 = _1355;
            }
            int _2607 = _2605;
            int _2609 = _2607;
            if (_2593)
            {
                _2609 = _1357;
            }
            int _2611 = _2609;
            int _2613 = _2611;
            if (_2599)
            {
                _2613 = _1359;
            }
            int _2615 = _2613;
            bool _2617 = _2461 >= _2615;
            if (!_2617)
            {
                _2471 = _2457;
            }
        }
        int _2619 = _2471;
        _1395 = _2619;
    }
    int _2621 = _1395;
    int _2623 = _2621 * 8;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    float _2627 = as_type<float>(_31[int(_2625)]);
    int _2629 = _2623 + 4;
    uint _2631 = uint(int(uint(_2629) >> uint(2)));
    float _2633 = as_type<float>(_31[int(_2631)]);
    int _2635 = _74 + 16;
    int _2637 = _74 + 24;
    uint _2639 = uint(int(uint(_2635) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2639)] = as_type<uint>(_2627);
    int _2641 = _2635 + 4;
    uint _2643 = uint(int(uint(_2641) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2643)] = as_type<uint>(_2633);
    uint _2645 = uint(int(uint(_2637) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2645)] = as_type<uint>(_1361);
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _887 = false;
    bool _711 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _2668 = float3((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float4 _60 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2668, float3(0.0), isnan(_2668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2668, float3(0.0), isnan(_2668)), level(0.0)).xyzw;
    float _63 = _60.x;
    float _65 = _60.y;
    float _67 = _60.z;
    float _69 = _60.w;
    float _71 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _74 = as_type<int>(_71) * 32;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_77)] = as_type<uint>(_63);
    int _79 = _74 + 4;
    uint _81 = uint(int(uint(_79) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_81)] = as_type<uint>(_65);
    int _83 = _74 + 8;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_85)] = as_type<uint>(_67);
    int _87 = _74 + 12;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_89)] = as_type<uint>(_69);
    int _91 = -2;
    int _93 = 0;
    int _95 = 0;
    int _97 = 0;
    int _99 = 0;
    int _101 = 0;
    int _103 = 0;
    int _105 = 0;
    int _107 = 0;
    int _109 = 0;
    int _111 = 0;
    int _113 = 0;
    int _115 = 0;
    int _117 = 0;
    int _119 = 0;
    int _121 = 0;
    int _123 = 0;
    int _125 = 0;
    int _127 = 0;
    int _129 = 0;
    int _131 = 0;
    int _133 = 0;
    int _135 = 0;
    int _137 = 0;
    int _139 = 0;
    int _141 = 0;
    int _143 = 0;
    float _145 = 1000000.0;
    bool _149;
    bool _291;
    float _673;
    int _675;
    int _677;
    int _679;
    bool _687;
    int _689;
    int _743;
    int _745;
    int _751;
    int _757;
    int _763;
    int _769;
    int _775;
    int _781;
    int _787;
    int _793;
    int _799;
    int _805;
    int _811;
    int _817;
    int _823;
    int _829;
    bool _833;
    int _835;
    int _841;
    int _847;
    int _853;
    int _857;
    int _863;
    int _867;
    int _871;
    int _875;
    int _879;
    int _883;
    int _885;
    int _1245;
    int _1311;
    int _1313;
    int _1315;
    int _1317;
    int _1319;
    int _1321;
    int _1323;
    int _1325;
    int _1327;
    int _1329;
    int _1331;
    int _1333;
    int _1335;
    int _1337;
    int _1339;
    int _1341;
    int _1343;
    int _1345;
    int _1347;
    int _1349;
    int _1351;
    int _1353;
    int _1355;
    int _1357;
    int _1359;
    float _1361;
    int _1363;
    int _1377;
    int _1379;
    int _1381;
    int _1383;
    int _1385;
    int _1387;
    do
    {
        int _151 = _91;
        int _153 = _93;
        int _155 = _95;
        int _157 = _97;
        int _159 = _99;
        int _161 = _101;
        int _163 = _103;
        int _165 = _105;
        int _167 = _107;
        int _169 = _109;
        int _171 = _111;
        int _173 = _113;
        int _175 = _115;
        int _177 = _117;
        int _179 = _119;
        int _181 = _121;
        int _183 = _123;
        int _185 = _125;
        int _187 = _127;
        int _189 = _129;
        int _191 = _131;
        int _193 = _133;
        int _195 = _135;
        int _197 = _137;
        int _199 = _139;
        int _201 = _141;
        int _203 = _143;
        float _205 = _145;
        float _207 = float(_151);
        float _209 = _207 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _211 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _213 = fma(_209, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2789 = float2(_211, _213);
        float4 _215 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2789, float2(0.0), isnan(_2789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2789, float2(0.0), isnan(_2789)), level(0.0)).xyzw;
        float _217 = _215.x;
        float _219 = _215.y;
        float _221 = _215.z;
        float _223 = _215.w;
        int _225 = -2;
        float _227 = _219;
        float _229 = _223;
        float _231 = _221;
        float _233 = _217;
        int _235 = -2;
        int _237 = _153;
        int _239 = _155;
        int _241 = _157;
        int _243 = _159;
        int _245 = _161;
        int _247 = _163;
        int _249 = _165;
        int _251 = _167;
        int _253 = _169;
        int _255 = _171;
        int _257 = _173;
        int _259 = _175;
        int _261 = _177;
        int _263 = _179;
        int _265 = _181;
        int _267 = _183;
        int _269 = _185;
        int _271 = _187;
        int _273 = _189;
        int _275 = _191;
        int _277 = _193;
        int _279 = _195;
        int _281 = _197;
        int _283 = _199;
        int _285 = _201;
        int _287 = _203;
        float _289 = _205;
        do
        {
            int _293 = _225;
            float _295 = _227;
            float _297 = _229;
            float _299 = _231;
            float _301 = _233;
            int _303 = _235;
            int _305 = _237;
            int _307 = _239;
            int _309 = _241;
            int _311 = _243;
            int _313 = _245;
            int _315 = _247;
            int _317 = _249;
            int _319 = _251;
            int _321 = _253;
            int _323 = _255;
            int _325 = _257;
            int _327 = _259;
            int _329 = _261;
            int _331 = _263;
            int _333 = _265;
            int _335 = _267;
            int _337 = _269;
            int _339 = _271;
            int _341 = _273;
            int _343 = _275;
            int _345 = _277;
            int _347 = _279;
            int _349 = _281;
            int _351 = _283;
            int _353 = _285;
            int _355 = _287;
            float _357 = _289;
            int _359 = _293 + 1;
            float _361 = float(_151);
            float _363 = 0.0 + _295;
            float _365 = precise::clamp(_363, 0.0, 1.0);
            float _367 = _361 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _369 = float(_359);
            float _371 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _373 = fma(_367, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _375 = 0.0 + _297;
            float _377 = precise::clamp(_375, 0.0, 1.0);
            float _379 = fma(_369, _371, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _381 = 0.0 + _299;
            float _383 = precise::clamp(_381, 0.0, 1.0);
            float _385 = 0.0 + _301;
            float _387 = precise::clamp(_385, 0.0, 1.0);
            float2 _2911 = float2(_379, _373);
            float4 _389 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2911, float2(0.0), isnan(_2911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2911, float2(0.0), isnan(_2911)), level(0.0)).xyzw;
            float _391 = _389.x;
            float _393 = _389.y;
            float _395 = _389.z;
            float _397 = _389.w;
            float _399 = _377 * 65535.0;
            float _401 = _383 * 65535.0;
            float _403 = _365 * 65535.0;
            float _405 = _387 * 65535.0;
            float _407 = rint(_399);
            int _409 = int(_407);
            float _411 = rint(_401);
            int _413 = int(_411);
            float _415 = rint(_403);
            int _417 = int(_415);
            uint _419 = extract_bits(uint(_409), 0u, 8u);
            int _421 = int(_419) & 255;
            uint _423 = extract_bits(uint(_409), 8u, 8u);
            int _425 = int(_423) & 255;
            int _427 = _425 << 8;
            int _429 = _421 | _427;
            float _431 = rint(_405);
            int _433 = int(_431);
            uint _435 = extract_bits(uint(_429), 0u, 8u);
            int _437 = int(_435) & 255;
            uint _439 = extract_bits(uint(_429), 8u, 8u);
            int _441 = int(_439) & 255;
            int _443 = _441 << 8;
            int _445 = _437 | _443;
            uint _447 = extract_bits(uint(_413), 0u, 8u);
            int _449 = int(_447) & 255;
            int _451 = _449 << 16;
            int _453 = _445 | _451;
            uint _455 = extract_bits(uint(_413), 8u, 8u);
            int _457 = int(_455) & 255;
            int _459 = _457 << 24;
            int _461 = _453 | _459;
            float _463 = float(_303);
            bool _465 = _461 != 0;
            uint _467 = extract_bits(uint(_417), 0u, 8u);
            int _469 = int(_467) & 255;
            uint _471 = extract_bits(uint(_417), 8u, 8u);
            int _473 = int(_471) & 255;
            int _475 = _473 << 8;
            int _477 = _469 | _475;
            float _479 = fma(_463, _371, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _481 = extract_bits(uint(_477), 0u, 8u);
            int _483 = int(_481) & 255;
            uint _485 = extract_bits(uint(_477), 8u, 8u);
            int _487 = int(_485) & 255;
            int _489 = _487 << 8;
            int _491 = _483 | _489;
            uint _493 = extract_bits(uint(_433), 0u, 8u);
            int _495 = int(_493) & 255;
            int _497 = _495 << 16;
            int _499 = _491 | _497;
            uint _501 = extract_bits(uint(_433), 8u, 8u);
            int _503 = int(_501) & 255;
            int _505 = _503 << 24;
            int _507 = _499 | _505;
            bool _509 = _507 != 0;
            bool _511 = _509 || _465;
            bool _513 = !_511;
            _225 = _359;
            _227 = _393;
            _229 = _397;
            _231 = _395;
            _233 = _391;
            int _515 = _315;
            int _517 = _307;
            int _519 = _309;
            int _521 = _311;
            int _523 = _313;
            int _525 = _317;
            int _527 = _319;
            int _529 = _329;
            int _531 = _321;
            int _533 = _323;
            int _535 = _325;
            int _537 = _327;
            int _539 = _331;
            int _541 = _333;
            int _543 = _343;
            int _545 = _335;
            int _547 = _337;
            int _549 = _339;
            int _551 = _341;
            int _553 = _345;
            int _555 = _347;
            int _557 = _349;
            int _559 = _351;
            int _561 = _353;
            int _563 = _355;
            int _565 = _461;
            int _567 = _307;
            int _569 = _309;
            int _571 = _311;
            int _573 = _313;
            int _575 = _351;
            int _577 = _353;
            int _579 = _355;
            int _581 = _315;
            int _583 = _317;
            int _585 = _319;
            int _587 = _321;
            int _589 = _323;
            int _591 = _325;
            int _593 = _327;
            int _595 = _329;
            int _597 = _331;
            int _599 = _333;
            int _601 = _335;
            int _603 = _337;
            int _605 = _339;
            int _607 = _341;
            int _609 = _349;
            int _611 = _347;
            int _613 = _345;
            int _615 = _305;
            int _617 = _307;
            int _619 = _309;
            int _621 = _311;
            int _623 = _313;
            int _625 = _315;
            int _627 = _317;
            int _629 = _319;
            int _631 = _321;
            int _633 = _323;
            int _635 = _325;
            int _637 = _327;
            int _639 = _329;
            int _641 = _331;
            int _643 = _333;
            int _645 = _335;
            int _647 = _337;
            int _649 = _339;
            int _651 = _341;
            int _653 = _343;
            int _655 = _345;
            int _657 = _347;
            int _659 = _349;
            int _661 = _351;
            int _663 = _353;
            int _665 = _355;
            int _667 = _433;
            int _669 = _461;
            int _671 = as_type<int>(_463);
            _673 = _357;
            _675 = _507;
            _677 = _461;
            _679 = as_type<int>(_395);
            if (!_513)
            {
                bool _681 = _305 > 0;
                bool _683 = !_681;
                if (!_683)
                {
                    int _685 = 0;
                    do
                    {
                        _689 = _685;
                        int _691 = _689 * 8;
                        uint _693 = uint(int(uint(_691) >> uint(2)));
                        float _695 = as_type<float>(_31[int(_693)]);
                        int _697 = _691 + 4;
                        uint _699 = uint(int(uint(_697) >> uint(2)));
                        float _701 = as_type<float>(_31[int(_699)]);
                        bool _703 = as_type<int>(_695) != _461;
                        bool _705 = as_type<int>(_701) != _507;
                        bool _707 = _705 || _703;
                        bool _709 = !_707;
                        _711 = _709;
                        if (_711)
                        {
                            break;
                        }
                        int _713 = _689 + 1;
                        bool _715 = _713 >= _305;
                        _687 = !_715;
                        _685 = _713;
                    } while (_687);
                }
                if (!_711)
                {
                    int _717 = _305 * 4;
                    int _719 = _305 * 8;
                    int _721 = _305 + 1;
                    bool _723 = _717 == 16;
                    bool _725 = _717 == 0;
                    uint _727 = uint(int(uint(_719) >> uint(2)));
                    _31[int(_727)] = uint(_461);
                    int _729 = _719 + 4;
                    uint _731 = uint(int(uint(_729) >> uint(2)));
                    _31[int(_731)] = uint(_507);
                    bool _733 = _717 == 4;
                    bool _735 = _717 == 8;
                    bool _737 = _717 == 12;
                    bool _739 = _717 == 20;
                    bool _741 = _717 == 24;
                    _615 = _721;
                    _667 = _719;
                    _671 = _717;
                    _743 = _719;
                    _745 = _717;
                    if (_723)
                    {
                        _515 = 1;
                    }
                    int _747 = _515;
                    bool _749 = _717 == 44;
                    _625 = _747;
                    _751 = _747;
                    if (_725)
                    {
                        _517 = 1;
                    }
                    int _753 = _517;
                    bool _755 = _717 == 28;
                    _617 = _753;
                    _757 = _753;
                    if (_733)
                    {
                        _519 = 1;
                    }
                    int _759 = _519;
                    bool _761 = _717 == 32;
                    _619 = _759;
                    _763 = _759;
                    if (_735)
                    {
                        _521 = 1;
                    }
                    int _765 = _521;
                    bool _767 = _717 == 36;
                    _621 = _765;
                    _769 = _765;
                    if (_737)
                    {
                        _523 = 1;
                    }
                    int _771 = _523;
                    bool _773 = _717 == 40;
                    _623 = _771;
                    _775 = _771;
                    if (_739)
                    {
                        _525 = 1;
                    }
                    int _777 = _525;
                    bool _779 = _717 == 48;
                    _627 = _777;
                    _781 = _777;
                    if (_741)
                    {
                        _527 = 1;
                    }
                    int _783 = _527;
                    bool _785 = _717 == 52;
                    _629 = _783;
                    _787 = _783;
                    if (_749)
                    {
                        _529 = 1;
                    }
                    int _789 = _529;
                    bool _791 = _717 == 72;
                    _639 = _789;
                    _793 = _789;
                    if (_755)
                    {
                        _531 = 1;
                    }
                    int _795 = _531;
                    bool _797 = _717 == 56;
                    _631 = _795;
                    _799 = _795;
                    if (_761)
                    {
                        _533 = 1;
                    }
                    int _801 = _533;
                    bool _803 = _717 == 60;
                    _633 = _801;
                    _805 = _801;
                    if (_767)
                    {
                        _535 = 1;
                    }
                    int _807 = _535;
                    bool _809 = _717 == 64;
                    _635 = _807;
                    _811 = _807;
                    if (_773)
                    {
                        _537 = 1;
                    }
                    int _813 = _537;
                    bool _815 = _717 == 68;
                    _637 = _813;
                    _817 = _813;
                    if (_779)
                    {
                        _539 = 1;
                    }
                    int _819 = _539;
                    bool _821 = _717 == 76;
                    _641 = _819;
                    _823 = _819;
                    if (_785)
                    {
                        _541 = 1;
                    }
                    int _825 = _541;
                    bool _827 = _717 == 80;
                    _643 = _825;
                    _829 = _825;
                    if (_791)
                    {
                        _543 = 1;
                    }
                    int _831 = _543;
                    _833 = _721 != 25;
                    _653 = _831;
                    _835 = _831;
                    if (_797)
                    {
                        _545 = 1;
                    }
                    int _837 = _545;
                    bool _839 = _717 == 84;
                    _645 = _837;
                    _841 = _837;
                    if (_803)
                    {
                        _547 = 1;
                    }
                    int _843 = _547;
                    bool _845 = _717 == 88;
                    _647 = _843;
                    _847 = _843;
                    if (_809)
                    {
                        _549 = 1;
                    }
                    int _849 = _549;
                    bool _851 = _717 == 92;
                    _649 = _849;
                    _853 = _849;
                    if (_815)
                    {
                        _551 = 1;
                    }
                    int _855 = _551;
                    _651 = _855;
                    _857 = _855;
                    if (_821)
                    {
                        _553 = 1;
                    }
                    int _859 = _553;
                    bool _861 = _717 == 96;
                    _655 = _859;
                    _863 = _859;
                    if (_827)
                    {
                        _555 = 1;
                    }
                    int _865 = _555;
                    _657 = _865;
                    _867 = _865;
                    if (_839)
                    {
                        _557 = 1;
                    }
                    int _869 = _557;
                    _659 = _869;
                    _871 = _869;
                    if (_845)
                    {
                        _559 = 1;
                    }
                    int _873 = _559;
                    _661 = _873;
                    _875 = _873;
                    if (_851)
                    {
                        _561 = 1;
                    }
                    int _877 = _561;
                    _663 = _877;
                    _879 = _877;
                    if (_861)
                    {
                        _563 = 1;
                    }
                    int _881 = _563;
                    _665 = _881;
                    _883 = _881;
                }
                if ((!_833) || _711)
                {
                    if (!_711)
                    {
                        _885 = 25;
                        _887 = true;
                        if (_887)
                        {
                            break;
                        }
                    }
                    _711 = false;
                    int _889 = _689 * 4;
                    bool _891 = _889 == 0;
                    bool _893 = _889 == 4;
                    bool _895 = _889 == 8;
                    bool _897 = _889 == 12;
                    bool _899 = _889 == 88;
                    bool _901 = _889 == 92;
                    bool _903 = _889 == 96;
                    if (_891)
                    {
                        _565 = _307;
                    }
                    int _905 = _565;
                    bool _907 = _889 == 16;
                    int _909 = _905;
                    if (_893)
                    {
                        _909 = _309;
                    }
                    int _911 = _909;
                    bool _913 = _889 == 20;
                    int _915 = _911;
                    if (_895)
                    {
                        _915 = _311;
                    }
                    int _917 = _915;
                    bool _919 = _889 == 24;
                    int _921 = _917;
                    if (_897)
                    {
                        _921 = _313;
                    }
                    int _923 = _921;
                    bool _925 = _889 == 84;
                    int _927 = int(_919);
                    int _929 = _913 ? 2 : 0;
                    int _931 = _927 | _929;
                    int _933 = _907 ? 4 : 0;
                    int _935 = _931 | _933;
                    int _937 = _925 ? 8 : 0;
                    int _939 = _935 | _937;
                    int _941 = _899 ? 16 : 0;
                    int _943 = _939 | _941;
                    int _945 = _901 ? 32 : 0;
                    int _947 = _943 | _945;
                    int _949 = _903 ? 64 : 0;
                    int _951 = _947 | _949;
                    int _953 = _951 & 8;
                    int _955 = _923;
                    if (_907)
                    {
                        _955 = _315;
                    }
                    int _957 = _955;
                    bool _959 = _889 == 80;
                    int _961 = _957;
                    if (_913)
                    {
                        _961 = _317;
                    }
                    int _963 = _961;
                    bool _965 = _889 == 76;
                    int _967 = _963;
                    if (_919)
                    {
                        _967 = _319;
                    }
                    int _969 = _967;
                    bool _971 = _889 == 28;
                    int _973 = int(_971);
                    int _975 = _965 ? 2 : 0;
                    int _977 = _973 | _975;
                    int _979 = _959 ? 4 : 0;
                    int _981 = _977 | _979;
                    int _983 = _925 ? 8 : 0;
                    int _985 = _981 | _983;
                    int _987 = _899 ? 16 : 0;
                    int _989 = _985 | _987;
                    int _991 = _901 ? 32 : 0;
                    int _993 = _989 | _991;
                    int _995 = _903 ? 64 : 0;
                    int _997 = _993 | _995;
                    int _999 = _997 & 2;
                    int _1001 = int(_971);
                    int _1003 = _965 ? 2 : 0;
                    int _1005 = _1001 | _1003;
                    int _1007 = _959 ? 4 : 0;
                    int _1009 = _1005 | _1007;
                    int _1011 = _925 ? 8 : 0;
                    int _1013 = _1009 | _1011;
                    int _1015 = _899 ? 16 : 0;
                    int _1017 = _1013 | _1015;
                    int _1019 = _901 ? 32 : 0;
                    int _1021 = _1017 | _1019;
                    int _1023 = _903 ? 64 : 0;
                    int _1025 = _1021 | _1023;
                    int _1027 = _1025 & 4;
                    int _1029 = _969;
                    _667 = _999;
                    _671 = _1027;
                    if (_971)
                    {
                        _1029 = _321;
                    }
                    int _1031 = _1029;
                    bool _1033 = _889 == 32;
                    int _1035 = _1031;
                    if (_1033)
                    {
                        _1035 = _323;
                    }
                    int _1037 = _1035;
                    bool _1039 = _889 == 36;
                    int _1041 = _1037;
                    if (_1039)
                    {
                        _1041 = _325;
                    }
                    int _1043 = _1041;
                    bool _1045 = _889 == 40;
                    int _1047 = _1043;
                    if (_1045)
                    {
                        _1047 = _327;
                    }
                    int _1049 = _1047;
                    bool _1051 = _889 == 44;
                    int _1053 = _1049;
                    if (_1051)
                    {
                        _1053 = _329;
                    }
                    int _1055 = _1053;
                    bool _1057 = _889 == 48;
                    int _1059 = _1055;
                    if (_1057)
                    {
                        _1059 = _331;
                    }
                    int _1061 = _1059;
                    bool _1063 = _889 == 52;
                    int _1065 = _1061;
                    if (_1063)
                    {
                        _1065 = _333;
                    }
                    int _1067 = _1065;
                    bool _1069 = _889 == 56;
                    int _1071 = _1067;
                    if (_1069)
                    {
                        _1071 = _335;
                    }
                    int _1073 = _1071;
                    bool _1075 = _889 == 60;
                    int _1077 = _1073;
                    if (_1075)
                    {
                        _1077 = _337;
                    }
                    int _1079 = _1077;
                    bool _1081 = _889 == 64;
                    int _1083 = _1079;
                    if (_1081)
                    {
                        _1083 = _339;
                    }
                    int _1085 = _1083;
                    bool _1087 = _889 == 68;
                    int _1089 = _1085;
                    if (_1087)
                    {
                        _1089 = _341;
                    }
                    int _1091 = _1089;
                    bool _1093 = _889 == 72;
                    int _1095 = int(_1093);
                    int _1097 = _965 ? 2 : 0;
                    int _1099 = _1095 | _1097;
                    int _1101 = _959 ? 4 : 0;
                    int _1103 = _1099 | _1101;
                    int _1105 = _925 ? 8 : 0;
                    int _1107 = _1103 | _1105;
                    int _1109 = _899 ? 16 : 0;
                    int _1111 = _1107 | _1109;
                    int _1113 = _901 ? 32 : 0;
                    int _1115 = _1111 | _1113;
                    int _1117 = _903 ? 64 : 0;
                    int _1119 = _1115 | _1117;
                    int _1121 = _1119 & 1;
                    int _1123 = _1091;
                    if (_1093)
                    {
                        _1123 = _343;
                    }
                    int _1125 = _1123;
                    bool _1127 = _889 == 4;
                    int _1129 = _1125;
                    if (_965)
                    {
                        _1129 = _345;
                    }
                    int _1131 = _1129;
                    int _1133 = _1131;
                    if (_959)
                    {
                        _1133 = _347;
                    }
                    int _1135 = _1133;
                    int _1137 = _1135;
                    if (_925)
                    {
                        _1137 = _349;
                    }
                    int _1139 = _1137;
                    bool _1141 = _889 == 0;
                    int _1143 = _1139;
                    if (_899)
                    {
                        _1143 = _351;
                    }
                    int _1145 = _1143;
                    bool _1147 = _889 == 8;
                    int _1149 = _1145;
                    if (_901)
                    {
                        _1149 = _353;
                    }
                    int _1151 = _1149;
                    bool _1153 = _889 == 12;
                    int _1155 = _1151;
                    if (_903)
                    {
                        _1155 = _355;
                    }
                    int _1157 = _1155;
                    int _1159 = _1157 + 1;
                    _669 = _1159;
                    if (_1141)
                    {
                        _567 = _1159;
                    }
                    int _1161 = _567;
                    bool _1163 = _889 == 16;
                    _617 = _1161;
                    if (_1127)
                    {
                        _569 = _1159;
                    }
                    int _1165 = _569;
                    bool _1167 = _889 == 20;
                    _619 = _1165;
                    if (_1147)
                    {
                        _571 = _1159;
                    }
                    int _1169 = _571;
                    bool _1171 = _889 == 24;
                    _621 = _1169;
                    if (_1153)
                    {
                        _573 = _1159;
                    }
                    int _1173 = _573;
                    bool _1175 = _889 == 28;
                    _623 = _1173;
                    if (_899)
                    {
                        _575 = _1159;
                    }
                    int _1177 = _575;
                    _661 = _1177;
                    if (_901)
                    {
                        _577 = _1159;
                    }
                    int _1179 = _577;
                    _663 = _1179;
                    if (_903)
                    {
                        _579 = _1159;
                    }
                    int _1181 = _579;
                    _665 = _1181;
                    if (_1163)
                    {
                        _581 = _1159;
                    }
                    int _1183 = _581;
                    bool _1185 = _889 == 32;
                    _625 = _1183;
                    if (_1167)
                    {
                        _583 = _1159;
                    }
                    int _1187 = _583;
                    bool _1189 = _889 == 36;
                    _627 = _1187;
                    if (_1171)
                    {
                        _585 = _1159;
                    }
                    int _1191 = _585;
                    bool _1193 = _889 == 40;
                    _629 = _1191;
                    if (_1175)
                    {
                        _587 = _1159;
                    }
                    int _1195 = _587;
                    bool _1197 = _889 == 44;
                    _631 = _1195;
                    if (_1185)
                    {
                        _589 = _1159;
                    }
                    int _1199 = _589;
                    bool _1201 = _889 == 48;
                    _633 = _1199;
                    if (_1189)
                    {
                        _591 = _1159;
                    }
                    int _1203 = _591;
                    bool _1205 = _889 == 52;
                    _635 = _1203;
                    if (_1193)
                    {
                        _593 = _1159;
                    }
                    int _1207 = _593;
                    bool _1209 = _889 == 56;
                    _637 = _1207;
                    if (_1197)
                    {
                        _595 = _1159;
                    }
                    int _1211 = _595;
                    bool _1213 = _889 == 60;
                    _639 = _1211;
                    if (_1201)
                    {
                        _597 = _1159;
                    }
                    int _1215 = _597;
                    bool _1217 = _889 == 64;
                    _641 = _1215;
                    if (_1205)
                    {
                        _599 = _1159;
                    }
                    int _1219 = _599;
                    bool _1221 = _889 == 68;
                    _643 = _1219;
                    if (_1209)
                    {
                        _601 = _1159;
                    }
                    int _1223 = _601;
                    bool _1225 = _953 != 0;
                    _645 = _1223;
                    if (_1213)
                    {
                        _603 = _1159;
                    }
                    int _1227 = _603;
                    bool _1229 = _1027 != 0;
                    _647 = _1227;
                    if (_1217)
                    {
                        _605 = _1159;
                    }
                    int _1231 = _605;
                    bool _1233 = _999 != 0;
                    _649 = _1231;
                    if (_1221)
                    {
                        _607 = _1159;
                    }
                    int _1235 = _607;
                    bool _1237 = _1121 != 0;
                    _651 = _1235;
                    if (_1225)
                    {
                        _609 = _1159;
                    }
                    int _1239 = _609;
                    _659 = _1239;
                    if (_1229)
                    {
                        _611 = _1159;
                    }
                    int _1241 = _611;
                    _657 = _1241;
                    if (_1233)
                    {
                        _613 = _1159;
                    }
                    int _1243 = _613;
                    _655 = _1243;
                    if (_1237)
                    {
                        _653 = _1159;
                    }
                }
            }
            _1245 = _615;
            int _1247 = _617;
            int _1249 = _619;
            int _1251 = _621;
            int _1253 = _623;
            int _1255 = _625;
            int _1257 = _627;
            int _1259 = _629;
            int _1261 = _631;
            int _1263 = _633;
            int _1265 = _635;
            int _1267 = _637;
            int _1269 = _639;
            int _1271 = _641;
            int _1273 = _643;
            int _1275 = _645;
            int _1277 = _647;
            int _1279 = _649;
            int _1281 = _651;
            int _1283 = _653;
            int _1285 = _655;
            int _1287 = _657;
            int _1289 = _659;
            int _1291 = _661;
            int _1293 = _663;
            int _1295 = _665;
            int _1297 = _667;
            int _1299 = _669;
            int _1301 = _671;
            float2 _4068 = float2(_479, _373);
            float _1303 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4068, float2(0.0), isnan(_4068)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4068, float2(0.0), isnan(_4068)), level(0.0)).x;
            int _1305 = _303 + 1;
            bool _1307 = _1305 >= 3;
            float _1309 = precise::min(_1303, _357);
            _291 = !_1307;
            _235 = _1305;
            _237 = _1245;
            _239 = _1247;
            _241 = _1249;
            _243 = _1251;
            _245 = _1253;
            _247 = _1255;
            _249 = _1257;
            _251 = _1259;
            _253 = _1261;
            _255 = _1263;
            _257 = _1265;
            _259 = _1267;
            _261 = _1269;
            _263 = _1271;
            _265 = _1273;
            _267 = _1275;
            _269 = _1277;
            _271 = _1279;
            _273 = _1281;
            _275 = _1283;
            _277 = _1285;
            _279 = _1287;
            _281 = _1289;
            _283 = _1291;
            _285 = _1293;
            _287 = _1295;
            _289 = _1309;
            _757 = _1247;
            _763 = _1249;
            _769 = _1251;
            _775 = _1253;
            _751 = _1255;
            _781 = _1257;
            _787 = _1259;
            _799 = _1261;
            _805 = _1263;
            _811 = _1265;
            _817 = _1267;
            _793 = _1269;
            _823 = _1271;
            _829 = _1273;
            _841 = _1275;
            _847 = _1277;
            _853 = _1279;
            _857 = _1281;
            _835 = _1283;
            _863 = _1285;
            _867 = _1287;
            _871 = _1289;
            _875 = _1291;
            _879 = _1293;
            _883 = _1295;
            _673 = _1309;
            _675 = as_type<int>(_1303);
            _743 = _1297;
            _677 = _1299;
            _745 = _1301;
        } while (_291);
        if (!_887)
        {
            _885 = _1245;
        }
        _887 = false;
        _1311 = _757;
        _1313 = _763;
        _1315 = _769;
        _1317 = _775;
        _1319 = _751;
        _1321 = _781;
        _1323 = _787;
        _1325 = _799;
        _1327 = _805;
        _1329 = _811;
        _1331 = _817;
        _1333 = _793;
        _1335 = _823;
        _1337 = _829;
        _1339 = _841;
        _1341 = _847;
        _1343 = _853;
        _1345 = _857;
        _1347 = _835;
        _1349 = _863;
        _1351 = _867;
        _1353 = _871;
        _1355 = _875;
        _1357 = _879;
        _1359 = _883;
        _1361 = _673;
        _1363 = _885;
        int _1365 = _675;
        int _1367 = _743;
        int _1369 = _677;
        int _1371 = _745;
        int _1373 = _151 + 1;
        bool _1375 = _1373 >= 3;
        _149 = !_1375;
        _91 = _1373;
        _93 = _1363;
        _95 = _1311;
        _97 = _1313;
        _99 = _1315;
        _101 = _1317;
        _103 = _1319;
        _105 = _1321;
        _107 = _1323;
        _109 = _1325;
        _111 = _1327;
        _113 = _1329;
        _115 = _1331;
        _117 = _1333;
        _119 = _1335;
        _121 = _1337;
        _123 = _1339;
        _125 = _1341;
        _127 = _1343;
        _129 = _1345;
        _131 = _1347;
        _133 = _1349;
        _135 = _1351;
        _137 = _1353;
        _139 = _1355;
        _141 = _1357;
        _143 = _1359;
        _145 = _1361;
        _1377 = _1365;
        _1379 = _1367;
        _1381 = _1369;
        _1383 = _1371;
        _1385 = _1365;
        _1387 = _1311;
    } while (_149);
    bool _1389 = _1363 > 0;
    if (!_1389)
    {
        _679 = 0;
    }
    int _1391 = _679;
    bool _1393 = !_1389;
    int _1395 = _1391;
    if (!_1393)
    {
        bool _1397 = _1363 > 3;
        bool _1399 = !_1397;
        int _1401 = 0;
        int _1403 = 0;
        int _1405 = 0;
        int _1407 = 0;
        int _1409 = 0;
        int _1411 = -1;
        int _1413 = 0;
        if (!_1399)
        {
            int _1415 = _1363 + (-3);
            _1411 = 0;
            bool _1417;
            do
            {
                int _1419 = _1401;
                int _1421 = _1403;
                int _1423 = _1377;
                int _1425 = _1379;
                int _1427 = _1381;
                int _1429 = _1405;
                int _1431 = _1383;
                int _1433 = _1419 * 4;
                int _1435 = _1419 + 1;
                int _1437 = _1419 + 2;
                bool _1439 = _1433 == 0;
                int _1441 = _1435 * 4;
                bool _1443 = _1433 == 4;
                int _1445 = _1437 * 4;
                bool _1447 = _1433 == 8;
                bool _1449 = _1433 == 12;
                bool _1451 = _1433 == 16;
                bool _1453 = _1441 == 8;
                int _1455 = _1419 + 3;
                int _1457 = _1423;
                int _1459 = _1425;
                int _1461 = _1427;
                int _1463 = _1431;
                int _1465 = _1421;
                int _1467 = _1429;
                if (_1439)
                {
                    _1457 = _1311;
                }
                int _1469 = _1457;
                bool _1471 = _1433 == 24;
                int _1473 = _1469;
                if (_1443)
                {
                    _1473 = _1313;
                }
                int _1475 = _1473;
                bool _1477 = _1433 == 20;
                int _1479 = _1475;
                if (_1447)
                {
                    _1479 = _1315;
                }
                int _1481 = _1479;
                bool _1483 = _1433 == 32;
                int _1485 = _1481;
                if (_1449)
                {
                    _1485 = _1317;
                }
                int _1487 = _1485;
                bool _1489 = _1433 == 28;
                int _1491 = _1487;
                if (_1451)
                {
                    _1491 = _1319;
                }
                int _1493 = _1491;
                bool _1495 = _1433 == 40;
                int _1497 = _1455 * 4;
                int _1499 = _1493;
                if (_1477)
                {
                    _1499 = _1321;
                }
                int _1501 = _1499;
                bool _1503 = _1433 == 36;
                int _1505 = _1501;
                if (_1471)
                {
                    _1505 = _1323;
                }
                int _1507 = _1505;
                bool _1509 = _1441 == 0;
                int _1511 = _1507;
                if (_1489)
                {
                    _1511 = _1325;
                }
                int _1513 = _1511;
                bool _1515 = _1441 == 4;
                int _1517 = _1513;
                if (_1483)
                {
                    _1517 = _1327;
                }
                int _1519 = _1517;
                bool _1521 = _1441 == 12;
                int _1523 = _1519;
                if (_1503)
                {
                    _1523 = _1329;
                }
                int _1525 = _1523;
                bool _1527 = _1433 == 44;
                int _1529 = _1525;
                if (_1495)
                {
                    _1529 = _1331;
                }
                int _1531 = _1529;
                bool _1533 = _1441 == 16;
                int _1535 = _1531;
                if (_1509)
                {
                    _1459 = _1311;
                }
                int _1537 = _1459;
                bool _1539 = _1433 == 48;
                int _1541 = _1537;
                if (_1515)
                {
                    _1541 = _1313;
                }
                int _1543 = _1541;
                bool _1545 = _1441 == 20;
                int _1547 = _1543;
                if (_1453)
                {
                    _1547 = _1315;
                }
                int _1549 = _1547;
                bool _1551 = _1441 == 24;
                int _1553 = _1549;
                if (_1521)
                {
                    _1553 = _1317;
                }
                int _1555 = _1553;
                bool _1557 = _1441 == 28;
                int _1559 = _1555;
                if (_1527)
                {
                    _1535 = _1333;
                }
                int _1561 = _1535;
                bool _1563 = _1433 == 52;
                int _1565 = _1561;
                if (_1533)
                {
                    _1559 = _1319;
                }
                int _1567 = _1559;
                bool _1569 = _1441 == 32;
                int _1571 = _1567;
                if (_1539)
                {
                    _1565 = _1335;
                }
                int _1573 = _1565;
                bool _1575 = _1433 == 56;
                int _1577 = _1573;
                if (_1545)
                {
                    _1571 = _1321;
                }
                int _1579 = _1571;
                bool _1581 = _1441 == 36;
                int _1583 = _1579;
                if (_1551)
                {
                    _1583 = _1323;
                }
                int _1585 = _1583;
                bool _1587 = _1441 == 40;
                int _1589 = _1585;
                if (_1557)
                {
                    _1589 = _1325;
                }
                int _1591 = _1589;
                bool _1593 = _1441 == 44;
                int _1595 = _1591;
                if (_1563)
                {
                    _1577 = _1337;
                }
                int _1597 = _1577;
                bool _1599 = _1433 == 60;
                int _1601 = _1597;
                if (_1569)
                {
                    _1595 = _1327;
                }
                int _1603 = _1595;
                bool _1605 = _1441 == 48;
                int _1607 = _1603;
                if (_1575)
                {
                    _1601 = _1339;
                }
                int _1609 = _1601;
                bool _1611 = _1433 == 64;
                int _1613 = _1609;
                if (_1581)
                {
                    _1607 = _1329;
                }
                int _1615 = _1607;
                int _1617 = _1615;
                if (_1587)
                {
                    _1617 = _1331;
                }
                int _1619 = _1617;
                bool _1621 = _1441 == 52;
                int _1623 = _1619;
                if (_1593)
                {
                    _1623 = _1333;
                }
                int _1625 = _1623;
                bool _1627 = _1441 == 56;
                bool _1629 = _1441 == 60;
                int _1631 = _1625;
                if (_1599)
                {
                    _1613 = _1341;
                }
                int _1633 = _1613;
                bool _1635 = _1445 == 0;
                int _1637 = _1633;
                if (_1605)
                {
                    _1631 = _1335;
                }
                int _1639 = _1631;
                bool _1641 = _1433 == 68;
                int _1643 = _1639;
                if (_1611)
                {
                    _1637 = _1343;
                }
                int _1645 = _1637;
                bool _1647 = _1445 == 4;
                int _1649 = _1645;
                if (_1621)
                {
                    _1643 = _1337;
                }
                int _1651 = _1643;
                bool _1653 = _1445 == 8;
                int _1655 = _1651;
                if (_1627)
                {
                    _1655 = _1339;
                }
                int _1657 = _1655;
                bool _1659 = _1445 == 12;
                int _1661 = _1657;
                if (_1629)
                {
                    _1661 = _1341;
                }
                int _1663 = _1661;
                bool _1665 = _1445 == 16;
                int _1667 = _1663;
                if (_1635)
                {
                    _1461 = _1311;
                }
                int _1669 = _1461;
                bool _1671 = _1441 == 64;
                int _1673 = _1669;
                if (_1641)
                {
                    _1649 = _1345;
                }
                int _1675 = _1649;
                bool _1677 = _1445 == 20;
                int _1679 = _1675;
                if (_1647)
                {
                    _1673 = _1313;
                }
                int _1681 = _1673;
                bool _1683 = _1433 == 72;
                int _1685 = _1681;
                if (_1653)
                {
                    _1685 = _1315;
                }
                int _1687 = _1685;
                bool _1689 = _1445 == 24;
                int _1691 = _1687;
                if (_1659)
                {
                    _1691 = _1317;
                }
                int _1693 = _1691;
                bool _1695 = _1445 == 28;
                int _1697 = _1693;
                if (_1665)
                {
                    _1697 = _1319;
                }
                int _1699 = _1697;
                bool _1701 = _1445 == 32;
                int _1703 = _1699;
                if (_1671)
                {
                    _1667 = _1343;
                }
                int _1705 = _1667;
                bool _1707 = _1441 == 68;
                int _1709 = _1705;
                if (_1677)
                {
                    _1703 = _1321;
                }
                int _1711 = _1703;
                bool _1713 = _1445 == 36;
                int _1715 = _1711;
                if (_1683)
                {
                    _1679 = _1347;
                }
                int _1717 = _1679;
                bool _1719 = _1433 == 76;
                int _1721 = _1717;
                if (_1689)
                {
                    _1715 = _1323;
                }
                int _1723 = _1715;
                bool _1725 = _1445 == 40;
                int _1727 = _1723;
                if (_1695)
                {
                    _1727 = _1325;
                }
                int _1729 = _1727;
                bool _1731 = _1445 == 44;
                int _1733 = _1729;
                if (_1701)
                {
                    _1733 = _1327;
                }
                int _1735 = _1733;
                bool _1737 = _1445 == 48;
                int _1739 = _1735;
                if (_1707)
                {
                    _1709 = _1345;
                }
                int _1741 = _1709;
                bool _1743 = _1441 == 72;
                int _1745 = _1741;
                if (_1713)
                {
                    _1739 = _1329;
                }
                int _1747 = _1739;
                bool _1749 = _1445 == 52;
                int _1751 = _1747;
                if (_1719)
                {
                    _1721 = _1349;
                }
                int _1753 = _1721;
                bool _1755 = _1433 == 80;
                int _1757 = _1753;
                if (_1725)
                {
                    _1751 = _1331;
                }
                int _1759 = _1751;
                bool _1761 = _1445 == 56;
                int _1763 = _1759;
                if (_1731)
                {
                    _1763 = _1333;
                }
                int _1765 = _1763;
                bool _1767 = _1445 == 60;
                int _1769 = _1765;
                if (_1737)
                {
                    _1769 = _1335;
                }
                int _1771 = _1769;
                bool _1773 = _1441 == 76;
                int _1775 = _1771;
                if (_1743)
                {
                    _1745 = _1347;
                }
                int _1777 = _1745;
                bool _1779 = _1445 == 64;
                int _1781 = _1777;
                if (_1749)
                {
                    _1775 = _1337;
                }
                int _1783 = _1775;
                bool _1785 = _1433 == 84;
                int _1787 = _1783;
                if (_1755)
                {
                    _1757 = _1351;
                }
                int _1789 = _1757;
                bool _1791 = _1445 == 68;
                int _1793 = _1789;
                if (_1761)
                {
                    _1787 = _1339;
                }
                int _1795 = _1787;
                bool _1797 = _1445 == 72;
                int _1799 = _1795;
                if (_1767)
                {
                    _1799 = _1341;
                }
                int _1801 = _1799;
                bool _1803 = _1445 == 76;
                int _1805 = _1801;
                if (_1773)
                {
                    _1781 = _1349;
                }
                int _1807 = _1781;
                bool _1809 = _1441 == 80;
                int _1811 = _1807;
                if (_1779)
                {
                    _1805 = _1343;
                }
                int _1813 = _1805;
                bool _1815 = _1497 == 0;
                int _1817 = _1813;
                if (_1785)
                {
                    _1793 = _1353;
                }
                int _1819 = _1793;
                bool _1821 = _1497 == 4;
                int _1823 = _1819;
                if (_1791)
                {
                    _1817 = _1345;
                }
                int _1825 = _1817;
                bool _1827 = _1445 == 80;
                int _1829 = _1825;
                if (_1797)
                {
                    _1829 = _1347;
                }
                int _1831 = _1829;
                bool _1833 = _1497 == 8;
                int _1835 = _1831;
                if (_1803)
                {
                    _1835 = _1349;
                }
                int _1837 = _1835;
                bool _1839 = _1433 == 88;
                int _1841 = _1837;
                if (_1809)
                {
                    _1811 = _1351;
                }
                int _1843 = _1811;
                bool _1845 = _1441 == 84;
                int _1847 = _1843;
                if (_1815)
                {
                    _1463 = _1311;
                }
                int _1849 = _1463;
                bool _1851 = _1497 == 12;
                int _1853 = _1849;
                if (_1821)
                {
                    _1853 = _1313;
                }
                int _1855 = _1853;
                bool _1857 = _1445 == 84;
                int _1859 = _1855;
                if (_1827)
                {
                    _1841 = _1351;
                }
                int _1861 = _1841;
                bool _1863 = _1497 == 16;
                int _1865 = _1861;
                if (_1833)
                {
                    _1859 = _1315;
                }
                int _1867 = _1859;
                bool _1869 = _1433 == 92;
                int _1871 = _1867;
                if (_1839)
                {
                    _1823 = _1355;
                }
                int _1873 = _1823;
                bool _1875 = _1497 == 20;
                int _1877 = _1873;
                if (_1845)
                {
                    _1847 = _1353;
                }
                int _1879 = _1847;
                bool _1881 = _1497 == 24;
                int _1883 = _1879;
                if (_1851)
                {
                    _1871 = _1317;
                }
                int _1885 = _1871;
                bool _1887 = _1441 == 88;
                int _1889 = _1885;
                if (_1857)
                {
                    _1865 = _1353;
                }
                int _1891 = _1865;
                bool _1893 = _1445 == 88;
                int _1895 = _1891;
                if (_1863)
                {
                    _1889 = _1319;
                }
                int _1897 = _1889;
                bool _1899 = _1497 == 28;
                int _1901 = _1897;
                if (_1869)
                {
                    _1877 = _1357;
                }
                int _1903 = _1877;
                bool _1905 = _1497 == 32;
                int _1907 = _1903;
                if (_1875)
                {
                    _1901 = _1321;
                }
                int _1909 = _1901;
                bool _1911 = _1433 == 96;
                int _1913 = _1909;
                if (_1881)
                {
                    _1913 = _1323;
                }
                int _1915 = _1913;
                bool _1917 = _1497 == 36;
                int _1919 = _1915;
                if (_1887)
                {
                    _1883 = _1355;
                }
                int _1921 = _1883;
                bool _1923 = _1497 == 40;
                int _1925 = _1921;
                if (_1893)
                {
                    _1895 = _1355;
                }
                int _1927 = _1895;
                bool _1929 = _1441 == 92;
                int _1931 = _1927;
                if (_1899)
                {
                    _1919 = _1325;
                }
                int _1933 = _1919;
                bool _1935 = _1497 == 44;
                int _1937 = _1933;
                if (_1905)
                {
                    _1937 = _1327;
                }
                int _1939 = _1937;
                bool _1941 = _1497 == 48;
                int _1943 = _1939;
                if (_1911)
                {
                    _1907 = _1359;
                }
                int _1945 = _1907;
                bool _1947 = _1441 == 96;
                int _1949 = _1945;
                if (_1917)
                {
                    _1943 = _1329;
                }
                int _1951 = _1943;
                bool _1953 = _1497 == 52;
                int _1955 = _1951;
                if (_1923)
                {
                    _1955 = _1331;
                }
                int _1957 = _1955;
                bool _1959 = _1421 >= _1945;
                int _1961 = _1957;
                if (_1929)
                {
                    _1925 = _1357;
                }
                int _1963 = _1925;
                bool _1965 = _1497 == 56;
                int _1967 = _1963;
                if (_1935)
                {
                    _1961 = _1333;
                }
                int _1969 = _1961;
                bool _1971 = _1497 == 60;
                int _1973 = _1969;
                if (_1941)
                {
                    _1973 = _1335;
                }
                int _1975 = _1973;
                bool _1977 = _1497 == 64;
                int _1979 = _1975;
                if (_1947)
                {
                    _1967 = _1359;
                }
                int _1981 = _1967;
                bool _1983 = _1445 == 92;
                _1379 = _1981;
                if (_1953)
                {
                    _1979 = _1337;
                }
                int _1985 = _1979;
                bool _1987 = _1497 == 68;
                int _1989 = _1985;
                if (!_1959)
                {
                    _1465 = _1945;
                }
                int _1991 = _1465;
                int _1993 = _1991;
                if (_1965)
                {
                    _1989 = _1339;
                }
                int _1995 = _1989;
                bool _1997 = _1497 == 72;
                int _1999 = _1995;
                if (_1971)
                {
                    _1999 = _1341;
                }
                int _2001 = _1999;
                bool _2003 = _1991 >= _1981;
                int _2005 = _2001;
                if (_1977)
                {
                    _2005 = _1343;
                }
                int _2007 = _2005;
                bool _2009 = _1445 == 96;
                int _2011 = _2007;
                if (_1983)
                {
                    _1931 = _1357;
                }
                int _2013 = _1931;
                bool _2015 = _1497 == 76;
                int _2017 = _2013;
                if (_1987)
                {
                    _2011 = _1345;
                }
                int _2019 = _2011;
                bool _2021 = _1497 == 80;
                int _2023 = _2019;
                if (_1997)
                {
                    _2023 = _1347;
                }
                int _2025 = _2023;
                bool _2027 = _1497 == 84;
                int _2029 = _2025;
                if (_2003)
                {
                    _1949 = _1991;
                }
                int _2031 = _1949;
                int _2033 = _2031;
                if (_2009)
                {
                    _2017 = _1359;
                }
                int _2035 = _2017;
                bool _2037 = _1497 == 88;
                _1381 = _2035;
                if (!_2003)
                {
                    _2033 = _1981;
                }
                int _2039 = _2033;
                int _2041 = _2039;
                if (_2015)
                {
                    _2029 = _1349;
                }
                int _2043 = _2029;
                bool _2045 = _1497 == 92;
                int _2047 = _2043;
                if (_2021)
                {
                    _2047 = _1351;
                }
                int _2049 = _2047;
                bool _2051 = _2039 >= _2035;
                int _2053 = _2049;
                if (_1959)
                {
                    _1993 = _1429;
                }
                int _2055 = _1993;
                int _2057 = _2055;
                if (_2027)
                {
                    _2053 = _1353;
                }
                int _2059 = _2053;
                bool _2061 = _1497 == 96;
                int _2063 = _2059;
                if (!_1959)
                {
                    _2057 = _1419;
                }
                int _2065 = _2057;
                int _2067 = _1419 + 4;
                _1401 = _2067;
                int _2069 = _2065;
                _1407 = _2067;
                if (_2037)
                {
                    _2063 = _1355;
                }
                int _2071 = _2063;
                int _2073 = _2071;
                if (!_2003)
                {
                    _2069 = _1435;
                }
                int _2075 = _2069;
                bool _2077 = _2067 >= _1415;
                int _2079 = _2075;
                if (_2045)
                {
                    _2073 = _1357;
                }
                int _2081 = _2073;
                int _2083 = _2081;
                if (!_2051)
                {
                    _2041 = _2035;
                }
                int _2085 = _2041;
                _1377 = _2085;
                _1385 = _2085;
                if (!_2051)
                {
                    _2079 = _1437;
                }
                int _2087 = _2079;
                int _2089 = _2087;
                if (_2061)
                {
                    _2083 = _1359;
                }
                int _2091 = _2083;
                bool _2093 = _2085 >= _2091;
                _1383 = _2091;
                if (_2093)
                {
                    _1467 = _2087;
                }
                int _2095 = _1467;
                int _2097 = _2095;
                if (_2093)
                {
                    _2089 = _2085;
                }
                int _2099 = _2089;
                int _2101 = _2099;
                if (!_2093)
                {
                    _2101 = _2091;
                }
                int _2103 = _2101;
                _1403 = _2103;
                _1409 = _2103;
                if (!_2093)
                {
                    _2097 = _1455;
                }
                int _2105 = _2097;
                _1417 = !_2077;
                _1405 = _2105;
                _1413 = _2105;
            } while (_1417);
        }
        int _2107 = _1407;
        int _2109 = _1409;
        int _2111 = _1385;
        int _2113 = _1411;
        int _2115 = _1413;
        int _2117 = -_2107;
        int _2119 = _1363 + _2117;
        bool _2121 = _2119 > 1;
        bool _2123 = !_2121;
        int _2125 = _2111;
        int _2127 = _2119;
        int _2129 = _2109;
        int _2131 = _2115;
        int _2133 = _2107;
        int _2135 = _2113;
        int _2137 = _2109;
        int _2139 = _2115;
        if (!_2123)
        {
            int _2141 = _2107 * 4;
            int _2143 = _2107 + 1;
            bool _2145 = _2141 == 0;
            int _2147 = _2143 * 4;
            bool _2149 = _2141 == 4;
            bool _2151 = _2141 == 8;
            bool _2153 = _2141 == 12;
            bool _2155 = _2141 == 24;
            bool _2157 = _2147 == 0;
            bool _2159 = _2141 == 40;
            if (_2145)
            {
                _2125 = _1311;
            }
            int _2161 = _2125;
            bool _2163 = _2141 == 16;
            int _2165 = _2161;
            if (_2149)
            {
                _2165 = _1313;
            }
            int _2167 = _2165;
            bool _2169 = _2141 == 20;
            int _2171 = _2167;
            if (_2151)
            {
                _2171 = _1315;
            }
            int _2173 = _2171;
            bool _2175 = _2141 == 36;
            int _2177 = _2173;
            if (_2153)
            {
                _2177 = _1317;
            }
            int _2179 = _2177;
            bool _2181 = _2141 == 28;
            int _2183 = _2179;
            if (_2157)
            {
                _2127 = _1311;
            }
            int _2185 = _2127;
            bool _2187 = _2147 == 16;
            int _2189 = _2185;
            if (_2163)
            {
                _2183 = _1319;
            }
            int _2191 = _2183;
            bool _2193 = _2141 == 32;
            int _2195 = _2191;
            if (_2169)
            {
                _2195 = _1321;
            }
            int _2197 = _2195;
            bool _2199 = _2141 == 48;
            int _2201 = _2197;
            if (_2155)
            {
                _2201 = _1323;
            }
            int _2203 = _2201;
            bool _2205 = _2147 == 4;
            int _2207 = _2203;
            if (_2181)
            {
                _2207 = _1325;
            }
            int _2209 = _2207;
            bool _2211 = _2141 == 44;
            int _2213 = _2209;
            if (_2193)
            {
                _2213 = _1327;
            }
            int _2215 = _2213;
            bool _2217 = _2147 == 8;
            int _2219 = _2215;
            if (_2175)
            {
                _2219 = _1329;
            }
            int _2221 = _2219;
            bool _2223 = _2147 == 12;
            int _2225 = _2221;
            if (_2205)
            {
                _2189 = _1313;
            }
            int _2227 = _2189;
            bool _2229 = _2141 == 52;
            int _2231 = _2227;
            if (_2159)
            {
                _2225 = _1331;
            }
            int _2233 = _2225;
            bool _2235 = _2147 == 20;
            int _2237 = _2233;
            if (_2211)
            {
                _2237 = _1333;
            }
            int _2239 = _2237;
            bool _2241 = _2147 == 24;
            int _2243 = _2239;
            if (_2199)
            {
                _2243 = _1335;
            }
            int _2245 = _2243;
            bool _2247 = _2141 == 60;
            int _2249 = _2245;
            if (_2217)
            {
                _2231 = _1315;
            }
            int _2251 = _2231;
            bool _2253 = _2141 == 56;
            int _2255 = _2251;
            if (_2223)
            {
                _2255 = _1317;
            }
            int _2257 = _2255;
            bool _2259 = _2147 == 28;
            int _2261 = _2257;
            if (_2187)
            {
                _2261 = _1319;
            }
            int _2263 = _2261;
            bool _2265 = _2147 == 32;
            int _2267 = _2263;
            if (_2235)
            {
                _2267 = _1321;
            }
            int _2269 = _2267;
            bool _2271 = _2147 == 36;
            int _2273 = _2269;
            if (_2229)
            {
                _2249 = _1337;
            }
            int _2275 = _2249;
            bool _2277 = _2141 == 64;
            int _2279 = _2275;
            if (_2241)
            {
                _2273 = _1323;
            }
            int _2281 = _2273;
            bool _2283 = _2141 == 68;
            int _2285 = _2281;
            if (_2253)
            {
                _2279 = _1339;
            }
            int _2287 = _2279;
            bool _2289 = _2147 == 40;
            int _2291 = _2287;
            if (_2259)
            {
                _2285 = _1325;
            }
            int _2293 = _2285;
            bool _2295 = _2141 == 72;
            int _2297 = _2293;
            if (_2247)
            {
                _2291 = _1341;
            }
            int _2299 = _2291;
            bool _2301 = _2147 == 44;
            int _2303 = _2299;
            if (_2265)
            {
                _2297 = _1327;
            }
            int _2305 = _2297;
            int _2307 = _2305;
            if (_2271)
            {
                _2307 = _1329;
            }
            int _2309 = _2307;
            int _2311 = _2309;
            if (_2277)
            {
                _2303 = _1343;
            }
            int _2313 = _2303;
            bool _2315 = _2141 == 76;
            int _2317 = _2313;
            if (_2283)
            {
                _2317 = _1345;
            }
            int _2319 = _2317;
            bool _2321 = _2141 == 80;
            bool _2323 = _2147 == 48;
            int _2325 = _2319;
            if (_2289)
            {
                _2311 = _1331;
            }
            int _2327 = _2311;
            bool _2329 = _2147 == 52;
            int _2331 = _2327;
            if (_2295)
            {
                _2325 = _1347;
            }
            int _2333 = _2325;
            bool _2335 = _2141 == 84;
            int _2337 = _2333;
            if (_2301)
            {
                _2331 = _1333;
            }
            int _2339 = _2331;
            bool _2341 = _2147 == 56;
            bool _2343 = _2147 == 60;
            int _2345 = _2339;
            if (_2315)
            {
                _2337 = _1349;
            }
            int _2347 = _2337;
            bool _2349 = _2141 == 88;
            int _2351 = _2347;
            if (_2321)
            {
                _2351 = _1351;
            }
            int _2353 = _2351;
            bool _2355 = _2141 == 92;
            int _2357 = _2353;
            if (_2323)
            {
                _2345 = _1335;
            }
            int _2359 = _2345;
            bool _2361 = _2147 == 64;
            int _2363 = _2359;
            if (_2329)
            {
                _2363 = _1337;
            }
            int _2365 = _2363;
            bool _2367 = _2147 == 68;
            int _2369 = _2365;
            if (_2335)
            {
                _2357 = _1353;
            }
            int _2371 = _2357;
            bool _2373 = _2141 == 96;
            int _2375 = _2371;
            if (_2341)
            {
                _2369 = _1339;
            }
            int _2377 = _2369;
            bool _2379 = _2147 == 72;
            int _2381 = _2377;
            if (_2343)
            {
                _2381 = _1341;
            }
            int _2383 = _2381;
            bool _2385 = _2147 == 76;
            int _2387 = _2383;
            if (_2349)
            {
                _2375 = _1355;
            }
            int _2389 = _2375;
            int _2391 = _2389;
            if (_2355)
            {
                _2391 = _1357;
            }
            int _2393 = _2391;
            bool _2395 = _2147 == 96;
            int _2397 = _2393;
            if (_2361)
            {
                _2387 = _1343;
            }
            int _2399 = _2387;
            bool _2401 = _2147 == 80;
            int _2403 = _2399;
            if (_2367)
            {
                _2403 = _1345;
            }
            int _2405 = _2403;
            bool _2407 = _2147 == 84;
            int _2409 = _2405;
            if (_2373)
            {
                _2397 = _1359;
            }
            int _2411 = _2397;
            bool _2413 = _2147 == 92;
            if (_2379)
            {
                _2409 = _1347;
            }
            int _2415 = _2409;
            bool _2417 = _2147 == 88;
            int _2419 = _2415;
            if (_2385)
            {
                _2419 = _1349;
            }
            int _2421 = _2419;
            bool _2423 = _2109 >= _2411;
            int _2425 = _2421;
            if (_2401)
            {
                _2425 = _1351;
            }
            int _2427 = _2425;
            int _2429 = _2427;
            if (_2407)
            {
                _2429 = _1353;
            }
            int _2431 = _2429;
            int _2433 = _2431;
            if (_2417)
            {
                _2433 = _1355;
            }
            int _2435 = _2433;
            int _2437 = _2435;
            _2135 = 0;
            if (_2413)
            {
                _2437 = _1357;
            }
            int _2439 = _2437;
            int _2441 = _2439;
            if (_2395)
            {
                _2441 = _1359;
            }
            int _2443 = _2441;
            if (!_2423)
            {
                _2129 = _2411;
            }
            int _2445 = _2129;
            _2137 = _2445;
            if (!_2423)
            {
                _2131 = _2107;
            }
            int _2447 = _2131;
            int _2449 = _2143 + 1;
            bool _2451 = _2445 >= _2443;
            int _2453 = _2447;
            _2133 = _2449;
            if (!_2451)
            {
                _2453 = _2143;
            }
            int _2455 = _2453;
            _2139 = _2455;
            if (!_2451)
            {
                _2137 = _2443;
            }
        }
        int _2457 = _2133;
        int _2459 = _2135;
        int _2461 = _2137;
        int _2463 = _2139;
        bool _2465 = _2457 < _1363;
        int _2467 = (_2465 ? (-1) : 0) | _2459;
        int _2469 = ~_2467;
        int _2471 = _2463;
        if (!(_2469 != 0))
        {
            int _2473 = _2457 << 2;
            bool _2475 = _2473 == 4;
            bool _2477 = _2473 == 8;
            bool _2479 = _2473 == 12;
            bool _2481 = _2473 == 16;
            if (_2475)
            {
                _1387 = _1313;
            }
            int _2483 = _1387;
            bool _2485 = _2473 == 20;
            int _2487 = _2483;
            if (_2477)
            {
                _2487 = _1315;
            }
            int _2489 = _2487;
            bool _2491 = _2473 == 24;
            int _2493 = _2489;
            if (_2479)
            {
                _2493 = _1317;
            }
            int _2495 = _2493;
            bool _2497 = _2473 == 28;
            int _2499 = _2495;
            if (_2481)
            {
                _2499 = _1319;
            }
            int _2501 = _2499;
            bool _2503 = _2473 == 32;
            int _2505 = _2501;
            if (_2485)
            {
                _2505 = _1321;
            }
            int _2507 = _2505;
            bool _2509 = _2473 == 36;
            int _2511 = _2507;
            if (_2491)
            {
                _2511 = _1323;
            }
            int _2513 = _2511;
            bool _2515 = _2473 == 40;
            int _2517 = _2513;
            if (_2497)
            {
                _2517 = _1325;
            }
            int _2519 = _2517;
            bool _2521 = _2473 == 44;
            int _2523 = _2519;
            if (_2503)
            {
                _2523 = _1327;
            }
            int _2525 = _2523;
            bool _2527 = _2473 == 48;
            int _2529 = _2525;
            if (_2509)
            {
                _2529 = _1329;
            }
            int _2531 = _2529;
            bool _2533 = _2473 == 52;
            int _2535 = _2531;
            if (_2515)
            {
                _2535 = _1331;
            }
            int _2537 = _2535;
            bool _2539 = _2473 == 56;
            int _2541 = _2537;
            if (_2521)
            {
                _2541 = _1333;
            }
            int _2543 = _2541;
            bool _2545 = _2473 == 60;
            int _2547 = _2543;
            if (_2527)
            {
                _2547 = _1335;
            }
            int _2549 = _2547;
            bool _2551 = _2473 == 64;
            int _2553 = _2549;
            if (_2533)
            {
                _2553 = _1337;
            }
            int _2555 = _2553;
            bool _2557 = _2473 == 68;
            int _2559 = _2555;
            if (_2539)
            {
                _2559 = _1339;
            }
            int _2561 = _2559;
            bool _2563 = _2473 == 72;
            int _2565 = _2561;
            if (_2545)
            {
                _2565 = _1341;
            }
            int _2567 = _2565;
            bool _2569 = _2473 == 76;
            int _2571 = _2567;
            if (_2551)
            {
                _2571 = _1343;
            }
            int _2573 = _2571;
            bool _2575 = _2473 == 80;
            int _2577 = _2573;
            if (_2557)
            {
                _2577 = _1345;
            }
            int _2579 = _2577;
            bool _2581 = _2473 == 84;
            int _2583 = _2579;
            if (_2563)
            {
                _2583 = _1347;
            }
            int _2585 = _2583;
            bool _2587 = _2473 == 88;
            int _2589 = _2585;
            if (_2569)
            {
                _2589 = _1349;
            }
            int _2591 = _2589;
            bool _2593 = _2473 == 92;
            int _2595 = _2591;
            if (_2575)
            {
                _2595 = _1351;
            }
            int _2597 = _2595;
            bool _2599 = _2473 == 96;
            int _2601 = _2597;
            if (_2581)
            {
                _2601 = _1353;
            }
            int _2603 = _2601;
            int _2605 = _2603;
            if (_2587)
            {
                _2605 = _1355;
            }
            int _2607 = _2605;
            int _2609 = _2607;
            if (_2593)
            {
                _2609 = _1357;
            }
            int _2611 = _2609;
            int _2613 = _2611;
            if (_2599)
            {
                _2613 = _1359;
            }
            int _2615 = _2613;
            bool _2617 = _2461 >= _2615;
            if (!_2617)
            {
                _2471 = _2457;
            }
        }
        int _2619 = _2471;
        _1395 = _2619;
    }
    int _2621 = _1395;
    int _2623 = _2621 * 8;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    float _2627 = as_type<float>(_31[int(_2625)]);
    int _2629 = _2623 + 4;
    uint _2631 = uint(int(uint(_2629) >> uint(2)));
    float _2633 = as_type<float>(_31[int(_2631)]);
    int _2635 = _74 + 16;
    int _2637 = _74 + 24;
    uint _2639 = uint(int(uint(_2635) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2639)] = as_type<uint>(_2627);
    int _2641 = _2635 + 4;
    uint _2643 = uint(int(uint(_2641) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2643)] = as_type<uint>(_2633);
    uint _2645 = uint(int(uint(_2637) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2645)] = as_type<uint>(_1361);
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


vertex void main0_discard(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _887 = false;
    bool _711 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _2668 = float3((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float4 _60 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2668, float3(0.0), isnan(_2668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2668, float3(0.0), isnan(_2668)), level(0.0)).xyzw;
    float _63 = _60.x;
    float _65 = _60.y;
    float _67 = _60.z;
    float _69 = _60.w;
    float _71 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _74 = as_type<int>(_71) * 32;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_77)] = as_type<uint>(_63);
    int _79 = _74 + 4;
    uint _81 = uint(int(uint(_79) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_81)] = as_type<uint>(_65);
    int _83 = _74 + 8;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_85)] = as_type<uint>(_67);
    int _87 = _74 + 12;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_89)] = as_type<uint>(_69);
    int _91 = -2;
    int _93 = 0;
    int _95 = 0;
    int _97 = 0;
    int _99 = 0;
    int _101 = 0;
    int _103 = 0;
    int _105 = 0;
    int _107 = 0;
    int _109 = 0;
    int _111 = 0;
    int _113 = 0;
    int _115 = 0;
    int _117 = 0;
    int _119 = 0;
    int _121 = 0;
    int _123 = 0;
    int _125 = 0;
    int _127 = 0;
    int _129 = 0;
    int _131 = 0;
    int _133 = 0;
    int _135 = 0;
    int _137 = 0;
    int _139 = 0;
    int _141 = 0;
    int _143 = 0;
    float _145 = 1000000.0;
    bool _149;
    bool _291;
    float _673;
    int _675;
    int _677;
    int _679;
    bool _687;
    int _689;
    int _743;
    int _745;
    int _751;
    int _757;
    int _763;
    int _769;
    int _775;
    int _781;
    int _787;
    int _793;
    int _799;
    int _805;
    int _811;
    int _817;
    int _823;
    int _829;
    bool _833;
    int _835;
    int _841;
    int _847;
    int _853;
    int _857;
    int _863;
    int _867;
    int _871;
    int _875;
    int _879;
    int _883;
    int _885;
    int _1245;
    int _1311;
    int _1313;
    int _1315;
    int _1317;
    int _1319;
    int _1321;
    int _1323;
    int _1325;
    int _1327;
    int _1329;
    int _1331;
    int _1333;
    int _1335;
    int _1337;
    int _1339;
    int _1341;
    int _1343;
    int _1345;
    int _1347;
    int _1349;
    int _1351;
    int _1353;
    int _1355;
    int _1357;
    int _1359;
    float _1361;
    int _1363;
    int _1377;
    int _1379;
    int _1381;
    int _1383;
    int _1385;
    int _1387;
    do
    {
        int _151 = _91;
        int _153 = _93;
        int _155 = _95;
        int _157 = _97;
        int _159 = _99;
        int _161 = _101;
        int _163 = _103;
        int _165 = _105;
        int _167 = _107;
        int _169 = _109;
        int _171 = _111;
        int _173 = _113;
        int _175 = _115;
        int _177 = _117;
        int _179 = _119;
        int _181 = _121;
        int _183 = _123;
        int _185 = _125;
        int _187 = _127;
        int _189 = _129;
        int _191 = _131;
        int _193 = _133;
        int _195 = _135;
        int _197 = _137;
        int _199 = _139;
        int _201 = _141;
        int _203 = _143;
        float _205 = _145;
        float _207 = float(_151);
        float _209 = _207 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _211 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _213 = fma(_209, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2789 = float2(_211, _213);
        float4 _215 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2789, float2(0.0), isnan(_2789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2789, float2(0.0), isnan(_2789)), level(0.0)).xyzw;
        float _217 = _215.x;
        float _219 = _215.y;
        float _221 = _215.z;
        float _223 = _215.w;
        int _225 = -2;
        float _227 = _219;
        float _229 = _223;
        float _231 = _221;
        float _233 = _217;
        int _235 = -2;
        int _237 = _153;
        int _239 = _155;
        int _241 = _157;
        int _243 = _159;
        int _245 = _161;
        int _247 = _163;
        int _249 = _165;
        int _251 = _167;
        int _253 = _169;
        int _255 = _171;
        int _257 = _173;
        int _259 = _175;
        int _261 = _177;
        int _263 = _179;
        int _265 = _181;
        int _267 = _183;
        int _269 = _185;
        int _271 = _187;
        int _273 = _189;
        int _275 = _191;
        int _277 = _193;
        int _279 = _195;
        int _281 = _197;
        int _283 = _199;
        int _285 = _201;
        int _287 = _203;
        float _289 = _205;
        do
        {
            int _293 = _225;
            float _295 = _227;
            float _297 = _229;
            float _299 = _231;
            float _301 = _233;
            int _303 = _235;
            int _305 = _237;
            int _307 = _239;
            int _309 = _241;
            int _311 = _243;
            int _313 = _245;
            int _315 = _247;
            int _317 = _249;
            int _319 = _251;
            int _321 = _253;
            int _323 = _255;
            int _325 = _257;
            int _327 = _259;
            int _329 = _261;
            int _331 = _263;
            int _333 = _265;
            int _335 = _267;
            int _337 = _269;
            int _339 = _271;
            int _341 = _273;
            int _343 = _275;
            int _345 = _277;
            int _347 = _279;
            int _349 = _281;
            int _351 = _283;
            int _353 = _285;
            int _355 = _287;
            float _357 = _289;
            int _359 = _293 + 1;
            float _361 = float(_151);
            float _363 = 0.0 + _295;
            float _365 = precise::clamp(_363, 0.0, 1.0);
            float _367 = _361 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _369 = float(_359);
            float _371 = 2.0 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _373 = fma(_367, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _375 = 0.0 + _297;
            float _377 = precise::clamp(_375, 0.0, 1.0);
            float _379 = fma(_369, _371, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _381 = 0.0 + _299;
            float _383 = precise::clamp(_381, 0.0, 1.0);
            float _385 = 0.0 + _301;
            float _387 = precise::clamp(_385, 0.0, 1.0);
            float2 _2911 = float2(_379, _373);
            float4 _389 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2911, float2(0.0), isnan(_2911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2911, float2(0.0), isnan(_2911)), level(0.0)).xyzw;
            float _391 = _389.x;
            float _393 = _389.y;
            float _395 = _389.z;
            float _397 = _389.w;
            float _399 = _377 * 65535.0;
            float _401 = _383 * 65535.0;
            float _403 = _365 * 65535.0;
            float _405 = _387 * 65535.0;
            float _407 = rint(_399);
            int _409 = int(_407);
            float _411 = rint(_401);
            int _413 = int(_411);
            float _415 = rint(_403);
            int _417 = int(_415);
            uint _419 = extract_bits(uint(_409), 0u, 8u);
            int _421 = int(_419) & 255;
            uint _423 = extract_bits(uint(_409), 8u, 8u);
            int _425 = int(_423) & 255;
            int _427 = _425 << 8;
            int _429 = _421 | _427;
            float _431 = rint(_405);
            int _433 = int(_431);
            uint _435 = extract_bits(uint(_429), 0u, 8u);
            int _437 = int(_435) & 255;
            uint _439 = extract_bits(uint(_429), 8u, 8u);
            int _441 = int(_439) & 255;
            int _443 = _441 << 8;
            int _445 = _437 | _443;
            uint _447 = extract_bits(uint(_413), 0u, 8u);
            int _449 = int(_447) & 255;
            int _451 = _449 << 16;
            int _453 = _445 | _451;
            uint _455 = extract_bits(uint(_413), 8u, 8u);
            int _457 = int(_455) & 255;
            int _459 = _457 << 24;
            int _461 = _453 | _459;
            float _463 = float(_303);
            bool _465 = _461 != 0;
            uint _467 = extract_bits(uint(_417), 0u, 8u);
            int _469 = int(_467) & 255;
            uint _471 = extract_bits(uint(_417), 8u, 8u);
            int _473 = int(_471) & 255;
            int _475 = _473 << 8;
            int _477 = _469 | _475;
            float _479 = fma(_463, _371, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            uint _481 = extract_bits(uint(_477), 0u, 8u);
            int _483 = int(_481) & 255;
            uint _485 = extract_bits(uint(_477), 8u, 8u);
            int _487 = int(_485) & 255;
            int _489 = _487 << 8;
            int _491 = _483 | _489;
            uint _493 = extract_bits(uint(_433), 0u, 8u);
            int _495 = int(_493) & 255;
            int _497 = _495 << 16;
            int _499 = _491 | _497;
            uint _501 = extract_bits(uint(_433), 8u, 8u);
            int _503 = int(_501) & 255;
            int _505 = _503 << 24;
            int _507 = _499 | _505;
            bool _509 = _507 != 0;
            bool _511 = _509 || _465;
            bool _513 = !_511;
            _225 = _359;
            _227 = _393;
            _229 = _397;
            _231 = _395;
            _233 = _391;
            int _515 = _315;
            int _517 = _307;
            int _519 = _309;
            int _521 = _311;
            int _523 = _313;
            int _525 = _317;
            int _527 = _319;
            int _529 = _329;
            int _531 = _321;
            int _533 = _323;
            int _535 = _325;
            int _537 = _327;
            int _539 = _331;
            int _541 = _333;
            int _543 = _343;
            int _545 = _335;
            int _547 = _337;
            int _549 = _339;
            int _551 = _341;
            int _553 = _345;
            int _555 = _347;
            int _557 = _349;
            int _559 = _351;
            int _561 = _353;
            int _563 = _355;
            int _565 = _461;
            int _567 = _307;
            int _569 = _309;
            int _571 = _311;
            int _573 = _313;
            int _575 = _351;
            int _577 = _353;
            int _579 = _355;
            int _581 = _315;
            int _583 = _317;
            int _585 = _319;
            int _587 = _321;
            int _589 = _323;
            int _591 = _325;
            int _593 = _327;
            int _595 = _329;
            int _597 = _331;
            int _599 = _333;
            int _601 = _335;
            int _603 = _337;
            int _605 = _339;
            int _607 = _341;
            int _609 = _349;
            int _611 = _347;
            int _613 = _345;
            int _615 = _305;
            int _617 = _307;
            int _619 = _309;
            int _621 = _311;
            int _623 = _313;
            int _625 = _315;
            int _627 = _317;
            int _629 = _319;
            int _631 = _321;
            int _633 = _323;
            int _635 = _325;
            int _637 = _327;
            int _639 = _329;
            int _641 = _331;
            int _643 = _333;
            int _645 = _335;
            int _647 = _337;
            int _649 = _339;
            int _651 = _341;
            int _653 = _343;
            int _655 = _345;
            int _657 = _347;
            int _659 = _349;
            int _661 = _351;
            int _663 = _353;
            int _665 = _355;
            int _667 = _433;
            int _669 = _461;
            int _671 = as_type<int>(_463);
            _673 = _357;
            _675 = _507;
            _677 = _461;
            _679 = as_type<int>(_395);
            if (!_513)
            {
                bool _681 = _305 > 0;
                bool _683 = !_681;
                if (!_683)
                {
                    int _685 = 0;
                    do
                    {
                        _689 = _685;
                        int _691 = _689 * 8;
                        uint _693 = uint(int(uint(_691) >> uint(2)));
                        float _695 = as_type<float>(_31[int(_693)]);
                        int _697 = _691 + 4;
                        uint _699 = uint(int(uint(_697) >> uint(2)));
                        float _701 = as_type<float>(_31[int(_699)]);
                        bool _703 = as_type<int>(_695) != _461;
                        bool _705 = as_type<int>(_701) != _507;
                        bool _707 = _705 || _703;
                        bool _709 = !_707;
                        _711 = _709;
                        if (_711)
                        {
                            break;
                        }
                        int _713 = _689 + 1;
                        bool _715 = _713 >= _305;
                        _687 = !_715;
                        _685 = _713;
                    } while (_687);
                }
                if (!_711)
                {
                    int _717 = _305 * 4;
                    int _719 = _305 * 8;
                    int _721 = _305 + 1;
                    bool _723 = _717 == 16;
                    bool _725 = _717 == 0;
                    uint _727 = uint(int(uint(_719) >> uint(2)));
                    _31[int(_727)] = uint(_461);
                    int _729 = _719 + 4;
                    uint _731 = uint(int(uint(_729) >> uint(2)));
                    _31[int(_731)] = uint(_507);
                    bool _733 = _717 == 4;
                    bool _735 = _717 == 8;
                    bool _737 = _717 == 12;
                    bool _739 = _717 == 20;
                    bool _741 = _717 == 24;
                    _615 = _721;
                    _667 = _719;
                    _671 = _717;
                    _743 = _719;
                    _745 = _717;
                    if (_723)
                    {
                        _515 = 1;
                    }
                    int _747 = _515;
                    bool _749 = _717 == 44;
                    _625 = _747;
                    _751 = _747;
                    if (_725)
                    {
                        _517 = 1;
                    }
                    int _753 = _517;
                    bool _755 = _717 == 28;
                    _617 = _753;
                    _757 = _753;
                    if (_733)
                    {
                        _519 = 1;
                    }
                    int _759 = _519;
                    bool _761 = _717 == 32;
                    _619 = _759;
                    _763 = _759;
                    if (_735)
                    {
                        _521 = 1;
                    }
                    int _765 = _521;
                    bool _767 = _717 == 36;
                    _621 = _765;
                    _769 = _765;
                    if (_737)
                    {
                        _523 = 1;
                    }
                    int _771 = _523;
                    bool _773 = _717 == 40;
                    _623 = _771;
                    _775 = _771;
                    if (_739)
                    {
                        _525 = 1;
                    }
                    int _777 = _525;
                    bool _779 = _717 == 48;
                    _627 = _777;
                    _781 = _777;
                    if (_741)
                    {
                        _527 = 1;
                    }
                    int _783 = _527;
                    bool _785 = _717 == 52;
                    _629 = _783;
                    _787 = _783;
                    if (_749)
                    {
                        _529 = 1;
                    }
                    int _789 = _529;
                    bool _791 = _717 == 72;
                    _639 = _789;
                    _793 = _789;
                    if (_755)
                    {
                        _531 = 1;
                    }
                    int _795 = _531;
                    bool _797 = _717 == 56;
                    _631 = _795;
                    _799 = _795;
                    if (_761)
                    {
                        _533 = 1;
                    }
                    int _801 = _533;
                    bool _803 = _717 == 60;
                    _633 = _801;
                    _805 = _801;
                    if (_767)
                    {
                        _535 = 1;
                    }
                    int _807 = _535;
                    bool _809 = _717 == 64;
                    _635 = _807;
                    _811 = _807;
                    if (_773)
                    {
                        _537 = 1;
                    }
                    int _813 = _537;
                    bool _815 = _717 == 68;
                    _637 = _813;
                    _817 = _813;
                    if (_779)
                    {
                        _539 = 1;
                    }
                    int _819 = _539;
                    bool _821 = _717 == 76;
                    _641 = _819;
                    _823 = _819;
                    if (_785)
                    {
                        _541 = 1;
                    }
                    int _825 = _541;
                    bool _827 = _717 == 80;
                    _643 = _825;
                    _829 = _825;
                    if (_791)
                    {
                        _543 = 1;
                    }
                    int _831 = _543;
                    _833 = _721 != 25;
                    _653 = _831;
                    _835 = _831;
                    if (_797)
                    {
                        _545 = 1;
                    }
                    int _837 = _545;
                    bool _839 = _717 == 84;
                    _645 = _837;
                    _841 = _837;
                    if (_803)
                    {
                        _547 = 1;
                    }
                    int _843 = _547;
                    bool _845 = _717 == 88;
                    _647 = _843;
                    _847 = _843;
                    if (_809)
                    {
                        _549 = 1;
                    }
                    int _849 = _549;
                    bool _851 = _717 == 92;
                    _649 = _849;
                    _853 = _849;
                    if (_815)
                    {
                        _551 = 1;
                    }
                    int _855 = _551;
                    _651 = _855;
                    _857 = _855;
                    if (_821)
                    {
                        _553 = 1;
                    }
                    int _859 = _553;
                    bool _861 = _717 == 96;
                    _655 = _859;
                    _863 = _859;
                    if (_827)
                    {
                        _555 = 1;
                    }
                    int _865 = _555;
                    _657 = _865;
                    _867 = _865;
                    if (_839)
                    {
                        _557 = 1;
                    }
                    int _869 = _557;
                    _659 = _869;
                    _871 = _869;
                    if (_845)
                    {
                        _559 = 1;
                    }
                    int _873 = _559;
                    _661 = _873;
                    _875 = _873;
                    if (_851)
                    {
                        _561 = 1;
                    }
                    int _877 = _561;
                    _663 = _877;
                    _879 = _877;
                    if (_861)
                    {
                        _563 = 1;
                    }
                    int _881 = _563;
                    _665 = _881;
                    _883 = _881;
                }
                if ((!_833) || _711)
                {
                    if (!_711)
                    {
                        _885 = 25;
                        _887 = true;
                        if (_887)
                        {
                            break;
                        }
                    }
                    _711 = false;
                    int _889 = _689 * 4;
                    bool _891 = _889 == 0;
                    bool _893 = _889 == 4;
                    bool _895 = _889 == 8;
                    bool _897 = _889 == 12;
                    bool _899 = _889 == 88;
                    bool _901 = _889 == 92;
                    bool _903 = _889 == 96;
                    if (_891)
                    {
                        _565 = _307;
                    }
                    int _905 = _565;
                    bool _907 = _889 == 16;
                    int _909 = _905;
                    if (_893)
                    {
                        _909 = _309;
                    }
                    int _911 = _909;
                    bool _913 = _889 == 20;
                    int _915 = _911;
                    if (_895)
                    {
                        _915 = _311;
                    }
                    int _917 = _915;
                    bool _919 = _889 == 24;
                    int _921 = _917;
                    if (_897)
                    {
                        _921 = _313;
                    }
                    int _923 = _921;
                    bool _925 = _889 == 84;
                    int _927 = int(_919);
                    int _929 = _913 ? 2 : 0;
                    int _931 = _927 | _929;
                    int _933 = _907 ? 4 : 0;
                    int _935 = _931 | _933;
                    int _937 = _925 ? 8 : 0;
                    int _939 = _935 | _937;
                    int _941 = _899 ? 16 : 0;
                    int _943 = _939 | _941;
                    int _945 = _901 ? 32 : 0;
                    int _947 = _943 | _945;
                    int _949 = _903 ? 64 : 0;
                    int _951 = _947 | _949;
                    int _953 = _951 & 8;
                    int _955 = _923;
                    if (_907)
                    {
                        _955 = _315;
                    }
                    int _957 = _955;
                    bool _959 = _889 == 80;
                    int _961 = _957;
                    if (_913)
                    {
                        _961 = _317;
                    }
                    int _963 = _961;
                    bool _965 = _889 == 76;
                    int _967 = _963;
                    if (_919)
                    {
                        _967 = _319;
                    }
                    int _969 = _967;
                    bool _971 = _889 == 28;
                    int _973 = int(_971);
                    int _975 = _965 ? 2 : 0;
                    int _977 = _973 | _975;
                    int _979 = _959 ? 4 : 0;
                    int _981 = _977 | _979;
                    int _983 = _925 ? 8 : 0;
                    int _985 = _981 | _983;
                    int _987 = _899 ? 16 : 0;
                    int _989 = _985 | _987;
                    int _991 = _901 ? 32 : 0;
                    int _993 = _989 | _991;
                    int _995 = _903 ? 64 : 0;
                    int _997 = _993 | _995;
                    int _999 = _997 & 2;
                    int _1001 = int(_971);
                    int _1003 = _965 ? 2 : 0;
                    int _1005 = _1001 | _1003;
                    int _1007 = _959 ? 4 : 0;
                    int _1009 = _1005 | _1007;
                    int _1011 = _925 ? 8 : 0;
                    int _1013 = _1009 | _1011;
                    int _1015 = _899 ? 16 : 0;
                    int _1017 = _1013 | _1015;
                    int _1019 = _901 ? 32 : 0;
                    int _1021 = _1017 | _1019;
                    int _1023 = _903 ? 64 : 0;
                    int _1025 = _1021 | _1023;
                    int _1027 = _1025 & 4;
                    int _1029 = _969;
                    _667 = _999;
                    _671 = _1027;
                    if (_971)
                    {
                        _1029 = _321;
                    }
                    int _1031 = _1029;
                    bool _1033 = _889 == 32;
                    int _1035 = _1031;
                    if (_1033)
                    {
                        _1035 = _323;
                    }
                    int _1037 = _1035;
                    bool _1039 = _889 == 36;
                    int _1041 = _1037;
                    if (_1039)
                    {
                        _1041 = _325;
                    }
                    int _1043 = _1041;
                    bool _1045 = _889 == 40;
                    int _1047 = _1043;
                    if (_1045)
                    {
                        _1047 = _327;
                    }
                    int _1049 = _1047;
                    bool _1051 = _889 == 44;
                    int _1053 = _1049;
                    if (_1051)
                    {
                        _1053 = _329;
                    }
                    int _1055 = _1053;
                    bool _1057 = _889 == 48;
                    int _1059 = _1055;
                    if (_1057)
                    {
                        _1059 = _331;
                    }
                    int _1061 = _1059;
                    bool _1063 = _889 == 52;
                    int _1065 = _1061;
                    if (_1063)
                    {
                        _1065 = _333;
                    }
                    int _1067 = _1065;
                    bool _1069 = _889 == 56;
                    int _1071 = _1067;
                    if (_1069)
                    {
                        _1071 = _335;
                    }
                    int _1073 = _1071;
                    bool _1075 = _889 == 60;
                    int _1077 = _1073;
                    if (_1075)
                    {
                        _1077 = _337;
                    }
                    int _1079 = _1077;
                    bool _1081 = _889 == 64;
                    int _1083 = _1079;
                    if (_1081)
                    {
                        _1083 = _339;
                    }
                    int _1085 = _1083;
                    bool _1087 = _889 == 68;
                    int _1089 = _1085;
                    if (_1087)
                    {
                        _1089 = _341;
                    }
                    int _1091 = _1089;
                    bool _1093 = _889 == 72;
                    int _1095 = int(_1093);
                    int _1097 = _965 ? 2 : 0;
                    int _1099 = _1095 | _1097;
                    int _1101 = _959 ? 4 : 0;
                    int _1103 = _1099 | _1101;
                    int _1105 = _925 ? 8 : 0;
                    int _1107 = _1103 | _1105;
                    int _1109 = _899 ? 16 : 0;
                    int _1111 = _1107 | _1109;
                    int _1113 = _901 ? 32 : 0;
                    int _1115 = _1111 | _1113;
                    int _1117 = _903 ? 64 : 0;
                    int _1119 = _1115 | _1117;
                    int _1121 = _1119 & 1;
                    int _1123 = _1091;
                    if (_1093)
                    {
                        _1123 = _343;
                    }
                    int _1125 = _1123;
                    bool _1127 = _889 == 4;
                    int _1129 = _1125;
                    if (_965)
                    {
                        _1129 = _345;
                    }
                    int _1131 = _1129;
                    int _1133 = _1131;
                    if (_959)
                    {
                        _1133 = _347;
                    }
                    int _1135 = _1133;
                    int _1137 = _1135;
                    if (_925)
                    {
                        _1137 = _349;
                    }
                    int _1139 = _1137;
                    bool _1141 = _889 == 0;
                    int _1143 = _1139;
                    if (_899)
                    {
                        _1143 = _351;
                    }
                    int _1145 = _1143;
                    bool _1147 = _889 == 8;
                    int _1149 = _1145;
                    if (_901)
                    {
                        _1149 = _353;
                    }
                    int _1151 = _1149;
                    bool _1153 = _889 == 12;
                    int _1155 = _1151;
                    if (_903)
                    {
                        _1155 = _355;
                    }
                    int _1157 = _1155;
                    int _1159 = _1157 + 1;
                    _669 = _1159;
                    if (_1141)
                    {
                        _567 = _1159;
                    }
                    int _1161 = _567;
                    bool _1163 = _889 == 16;
                    _617 = _1161;
                    if (_1127)
                    {
                        _569 = _1159;
                    }
                    int _1165 = _569;
                    bool _1167 = _889 == 20;
                    _619 = _1165;
                    if (_1147)
                    {
                        _571 = _1159;
                    }
                    int _1169 = _571;
                    bool _1171 = _889 == 24;
                    _621 = _1169;
                    if (_1153)
                    {
                        _573 = _1159;
                    }
                    int _1173 = _573;
                    bool _1175 = _889 == 28;
                    _623 = _1173;
                    if (_899)
                    {
                        _575 = _1159;
                    }
                    int _1177 = _575;
                    _661 = _1177;
                    if (_901)
                    {
                        _577 = _1159;
                    }
                    int _1179 = _577;
                    _663 = _1179;
                    if (_903)
                    {
                        _579 = _1159;
                    }
                    int _1181 = _579;
                    _665 = _1181;
                    if (_1163)
                    {
                        _581 = _1159;
                    }
                    int _1183 = _581;
                    bool _1185 = _889 == 32;
                    _625 = _1183;
                    if (_1167)
                    {
                        _583 = _1159;
                    }
                    int _1187 = _583;
                    bool _1189 = _889 == 36;
                    _627 = _1187;
                    if (_1171)
                    {
                        _585 = _1159;
                    }
                    int _1191 = _585;
                    bool _1193 = _889 == 40;
                    _629 = _1191;
                    if (_1175)
                    {
                        _587 = _1159;
                    }
                    int _1195 = _587;
                    bool _1197 = _889 == 44;
                    _631 = _1195;
                    if (_1185)
                    {
                        _589 = _1159;
                    }
                    int _1199 = _589;
                    bool _1201 = _889 == 48;
                    _633 = _1199;
                    if (_1189)
                    {
                        _591 = _1159;
                    }
                    int _1203 = _591;
                    bool _1205 = _889 == 52;
                    _635 = _1203;
                    if (_1193)
                    {
                        _593 = _1159;
                    }
                    int _1207 = _593;
                    bool _1209 = _889 == 56;
                    _637 = _1207;
                    if (_1197)
                    {
                        _595 = _1159;
                    }
                    int _1211 = _595;
                    bool _1213 = _889 == 60;
                    _639 = _1211;
                    if (_1201)
                    {
                        _597 = _1159;
                    }
                    int _1215 = _597;
                    bool _1217 = _889 == 64;
                    _641 = _1215;
                    if (_1205)
                    {
                        _599 = _1159;
                    }
                    int _1219 = _599;
                    bool _1221 = _889 == 68;
                    _643 = _1219;
                    if (_1209)
                    {
                        _601 = _1159;
                    }
                    int _1223 = _601;
                    bool _1225 = _953 != 0;
                    _645 = _1223;
                    if (_1213)
                    {
                        _603 = _1159;
                    }
                    int _1227 = _603;
                    bool _1229 = _1027 != 0;
                    _647 = _1227;
                    if (_1217)
                    {
                        _605 = _1159;
                    }
                    int _1231 = _605;
                    bool _1233 = _999 != 0;
                    _649 = _1231;
                    if (_1221)
                    {
                        _607 = _1159;
                    }
                    int _1235 = _607;
                    bool _1237 = _1121 != 0;
                    _651 = _1235;
                    if (_1225)
                    {
                        _609 = _1159;
                    }
                    int _1239 = _609;
                    _659 = _1239;
                    if (_1229)
                    {
                        _611 = _1159;
                    }
                    int _1241 = _611;
                    _657 = _1241;
                    if (_1233)
                    {
                        _613 = _1159;
                    }
                    int _1243 = _613;
                    _655 = _1243;
                    if (_1237)
                    {
                        _653 = _1159;
                    }
                }
            }
            _1245 = _615;
            int _1247 = _617;
            int _1249 = _619;
            int _1251 = _621;
            int _1253 = _623;
            int _1255 = _625;
            int _1257 = _627;
            int _1259 = _629;
            int _1261 = _631;
            int _1263 = _633;
            int _1265 = _635;
            int _1267 = _637;
            int _1269 = _639;
            int _1271 = _641;
            int _1273 = _643;
            int _1275 = _645;
            int _1277 = _647;
            int _1279 = _649;
            int _1281 = _651;
            int _1283 = _653;
            int _1285 = _655;
            int _1287 = _657;
            int _1289 = _659;
            int _1291 = _661;
            int _1293 = _663;
            int _1295 = _665;
            int _1297 = _667;
            int _1299 = _669;
            int _1301 = _671;
            float2 _4068 = float2(_479, _373);
            float _1303 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4068, float2(0.0), isnan(_4068)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4068, float2(0.0), isnan(_4068)), level(0.0)).x;
            int _1305 = _303 + 1;
            bool _1307 = _1305 >= 3;
            float _1309 = precise::min(_1303, _357);
            _291 = !_1307;
            _235 = _1305;
            _237 = _1245;
            _239 = _1247;
            _241 = _1249;
            _243 = _1251;
            _245 = _1253;
            _247 = _1255;
            _249 = _1257;
            _251 = _1259;
            _253 = _1261;
            _255 = _1263;
            _257 = _1265;
            _259 = _1267;
            _261 = _1269;
            _263 = _1271;
            _265 = _1273;
            _267 = _1275;
            _269 = _1277;
            _271 = _1279;
            _273 = _1281;
            _275 = _1283;
            _277 = _1285;
            _279 = _1287;
            _281 = _1289;
            _283 = _1291;
            _285 = _1293;
            _287 = _1295;
            _289 = _1309;
            _757 = _1247;
            _763 = _1249;
            _769 = _1251;
            _775 = _1253;
            _751 = _1255;
            _781 = _1257;
            _787 = _1259;
            _799 = _1261;
            _805 = _1263;
            _811 = _1265;
            _817 = _1267;
            _793 = _1269;
            _823 = _1271;
            _829 = _1273;
            _841 = _1275;
            _847 = _1277;
            _853 = _1279;
            _857 = _1281;
            _835 = _1283;
            _863 = _1285;
            _867 = _1287;
            _871 = _1289;
            _875 = _1291;
            _879 = _1293;
            _883 = _1295;
            _673 = _1309;
            _675 = as_type<int>(_1303);
            _743 = _1297;
            _677 = _1299;
            _745 = _1301;
        } while (_291);
        if (!_887)
        {
            _885 = _1245;
        }
        _887 = false;
        _1311 = _757;
        _1313 = _763;
        _1315 = _769;
        _1317 = _775;
        _1319 = _751;
        _1321 = _781;
        _1323 = _787;
        _1325 = _799;
        _1327 = _805;
        _1329 = _811;
        _1331 = _817;
        _1333 = _793;
        _1335 = _823;
        _1337 = _829;
        _1339 = _841;
        _1341 = _847;
        _1343 = _853;
        _1345 = _857;
        _1347 = _835;
        _1349 = _863;
        _1351 = _867;
        _1353 = _871;
        _1355 = _875;
        _1357 = _879;
        _1359 = _883;
        _1361 = _673;
        _1363 = _885;
        int _1365 = _675;
        int _1367 = _743;
        int _1369 = _677;
        int _1371 = _745;
        int _1373 = _151 + 1;
        bool _1375 = _1373 >= 3;
        _149 = !_1375;
        _91 = _1373;
        _93 = _1363;
        _95 = _1311;
        _97 = _1313;
        _99 = _1315;
        _101 = _1317;
        _103 = _1319;
        _105 = _1321;
        _107 = _1323;
        _109 = _1325;
        _111 = _1327;
        _113 = _1329;
        _115 = _1331;
        _117 = _1333;
        _119 = _1335;
        _121 = _1337;
        _123 = _1339;
        _125 = _1341;
        _127 = _1343;
        _129 = _1345;
        _131 = _1347;
        _133 = _1349;
        _135 = _1351;
        _137 = _1353;
        _139 = _1355;
        _141 = _1357;
        _143 = _1359;
        _145 = _1361;
        _1377 = _1365;
        _1379 = _1367;
        _1381 = _1369;
        _1383 = _1371;
        _1385 = _1365;
        _1387 = _1311;
    } while (_149);
    bool _1389 = _1363 > 0;
    if (!_1389)
    {
        _679 = 0;
    }
    int _1391 = _679;
    bool _1393 = !_1389;
    int _1395 = _1391;
    if (!_1393)
    {
        bool _1397 = _1363 > 3;
        bool _1399 = !_1397;
        int _1401 = 0;
        int _1403 = 0;
        int _1405 = 0;
        int _1407 = 0;
        int _1409 = 0;
        int _1411 = -1;
        int _1413 = 0;
        if (!_1399)
        {
            int _1415 = _1363 + (-3);
            _1411 = 0;
            bool _1417;
            do
            {
                int _1419 = _1401;
                int _1421 = _1403;
                int _1423 = _1377;
                int _1425 = _1379;
                int _1427 = _1381;
                int _1429 = _1405;
                int _1431 = _1383;
                int _1433 = _1419 * 4;
                int _1435 = _1419 + 1;
                int _1437 = _1419 + 2;
                bool _1439 = _1433 == 0;
                int _1441 = _1435 * 4;
                bool _1443 = _1433 == 4;
                int _1445 = _1437 * 4;
                bool _1447 = _1433 == 8;
                bool _1449 = _1433 == 12;
                bool _1451 = _1433 == 16;
                bool _1453 = _1441 == 8;
                int _1455 = _1419 + 3;
                int _1457 = _1423;
                int _1459 = _1425;
                int _1461 = _1427;
                int _1463 = _1431;
                int _1465 = _1421;
                int _1467 = _1429;
                if (_1439)
                {
                    _1457 = _1311;
                }
                int _1469 = _1457;
                bool _1471 = _1433 == 24;
                int _1473 = _1469;
                if (_1443)
                {
                    _1473 = _1313;
                }
                int _1475 = _1473;
                bool _1477 = _1433 == 20;
                int _1479 = _1475;
                if (_1447)
                {
                    _1479 = _1315;
                }
                int _1481 = _1479;
                bool _1483 = _1433 == 32;
                int _1485 = _1481;
                if (_1449)
                {
                    _1485 = _1317;
                }
                int _1487 = _1485;
                bool _1489 = _1433 == 28;
                int _1491 = _1487;
                if (_1451)
                {
                    _1491 = _1319;
                }
                int _1493 = _1491;
                bool _1495 = _1433 == 40;
                int _1497 = _1455 * 4;
                int _1499 = _1493;
                if (_1477)
                {
                    _1499 = _1321;
                }
                int _1501 = _1499;
                bool _1503 = _1433 == 36;
                int _1505 = _1501;
                if (_1471)
                {
                    _1505 = _1323;
                }
                int _1507 = _1505;
                bool _1509 = _1441 == 0;
                int _1511 = _1507;
                if (_1489)
                {
                    _1511 = _1325;
                }
                int _1513 = _1511;
                bool _1515 = _1441 == 4;
                int _1517 = _1513;
                if (_1483)
                {
                    _1517 = _1327;
                }
                int _1519 = _1517;
                bool _1521 = _1441 == 12;
                int _1523 = _1519;
                if (_1503)
                {
                    _1523 = _1329;
                }
                int _1525 = _1523;
                bool _1527 = _1433 == 44;
                int _1529 = _1525;
                if (_1495)
                {
                    _1529 = _1331;
                }
                int _1531 = _1529;
                bool _1533 = _1441 == 16;
                int _1535 = _1531;
                if (_1509)
                {
                    _1459 = _1311;
                }
                int _1537 = _1459;
                bool _1539 = _1433 == 48;
                int _1541 = _1537;
                if (_1515)
                {
                    _1541 = _1313;
                }
                int _1543 = _1541;
                bool _1545 = _1441 == 20;
                int _1547 = _1543;
                if (_1453)
                {
                    _1547 = _1315;
                }
                int _1549 = _1547;
                bool _1551 = _1441 == 24;
                int _1553 = _1549;
                if (_1521)
                {
                    _1553 = _1317;
                }
                int _1555 = _1553;
                bool _1557 = _1441 == 28;
                int _1559 = _1555;
                if (_1527)
                {
                    _1535 = _1333;
                }
                int _1561 = _1535;
                bool _1563 = _1433 == 52;
                int _1565 = _1561;
                if (_1533)
                {
                    _1559 = _1319;
                }
                int _1567 = _1559;
                bool _1569 = _1441 == 32;
                int _1571 = _1567;
                if (_1539)
                {
                    _1565 = _1335;
                }
                int _1573 = _1565;
                bool _1575 = _1433 == 56;
                int _1577 = _1573;
                if (_1545)
                {
                    _1571 = _1321;
                }
                int _1579 = _1571;
                bool _1581 = _1441 == 36;
                int _1583 = _1579;
                if (_1551)
                {
                    _1583 = _1323;
                }
                int _1585 = _1583;
                bool _1587 = _1441 == 40;
                int _1589 = _1585;
                if (_1557)
                {
                    _1589 = _1325;
                }
                int _1591 = _1589;
                bool _1593 = _1441 == 44;
                int _1595 = _1591;
                if (_1563)
                {
                    _1577 = _1337;
                }
                int _1597 = _1577;
                bool _1599 = _1433 == 60;
                int _1601 = _1597;
                if (_1569)
                {
                    _1595 = _1327;
                }
                int _1603 = _1595;
                bool _1605 = _1441 == 48;
                int _1607 = _1603;
                if (_1575)
                {
                    _1601 = _1339;
                }
                int _1609 = _1601;
                bool _1611 = _1433 == 64;
                int _1613 = _1609;
                if (_1581)
                {
                    _1607 = _1329;
                }
                int _1615 = _1607;
                int _1617 = _1615;
                if (_1587)
                {
                    _1617 = _1331;
                }
                int _1619 = _1617;
                bool _1621 = _1441 == 52;
                int _1623 = _1619;
                if (_1593)
                {
                    _1623 = _1333;
                }
                int _1625 = _1623;
                bool _1627 = _1441 == 56;
                bool _1629 = _1441 == 60;
                int _1631 = _1625;
                if (_1599)
                {
                    _1613 = _1341;
                }
                int _1633 = _1613;
                bool _1635 = _1445 == 0;
                int _1637 = _1633;
                if (_1605)
                {
                    _1631 = _1335;
                }
                int _1639 = _1631;
                bool _1641 = _1433 == 68;
                int _1643 = _1639;
                if (_1611)
                {
                    _1637 = _1343;
                }
                int _1645 = _1637;
                bool _1647 = _1445 == 4;
                int _1649 = _1645;
                if (_1621)
                {
                    _1643 = _1337;
                }
                int _1651 = _1643;
                bool _1653 = _1445 == 8;
                int _1655 = _1651;
                if (_1627)
                {
                    _1655 = _1339;
                }
                int _1657 = _1655;
                bool _1659 = _1445 == 12;
                int _1661 = _1657;
                if (_1629)
                {
                    _1661 = _1341;
                }
                int _1663 = _1661;
                bool _1665 = _1445 == 16;
                int _1667 = _1663;
                if (_1635)
                {
                    _1461 = _1311;
                }
                int _1669 = _1461;
                bool _1671 = _1441 == 64;
                int _1673 = _1669;
                if (_1641)
                {
                    _1649 = _1345;
                }
                int _1675 = _1649;
                bool _1677 = _1445 == 20;
                int _1679 = _1675;
                if (_1647)
                {
                    _1673 = _1313;
                }
                int _1681 = _1673;
                bool _1683 = _1433 == 72;
                int _1685 = _1681;
                if (_1653)
                {
                    _1685 = _1315;
                }
                int _1687 = _1685;
                bool _1689 = _1445 == 24;
                int _1691 = _1687;
                if (_1659)
                {
                    _1691 = _1317;
                }
                int _1693 = _1691;
                bool _1695 = _1445 == 28;
                int _1697 = _1693;
                if (_1665)
                {
                    _1697 = _1319;
                }
                int _1699 = _1697;
                bool _1701 = _1445 == 32;
                int _1703 = _1699;
                if (_1671)
                {
                    _1667 = _1343;
                }
                int _1705 = _1667;
                bool _1707 = _1441 == 68;
                int _1709 = _1705;
                if (_1677)
                {
                    _1703 = _1321;
                }
                int _1711 = _1703;
                bool _1713 = _1445 == 36;
                int _1715 = _1711;
                if (_1683)
                {
                    _1679 = _1347;
                }
                int _1717 = _1679;
                bool _1719 = _1433 == 76;
                int _1721 = _1717;
                if (_1689)
                {
                    _1715 = _1323;
                }
                int _1723 = _1715;
                bool _1725 = _1445 == 40;
                int _1727 = _1723;
                if (_1695)
                {
                    _1727 = _1325;
                }
                int _1729 = _1727;
                bool _1731 = _1445 == 44;
                int _1733 = _1729;
                if (_1701)
                {
                    _1733 = _1327;
                }
                int _1735 = _1733;
                bool _1737 = _1445 == 48;
                int _1739 = _1735;
                if (_1707)
                {
                    _1709 = _1345;
                }
                int _1741 = _1709;
                bool _1743 = _1441 == 72;
                int _1745 = _1741;
                if (_1713)
                {
                    _1739 = _1329;
                }
                int _1747 = _1739;
                bool _1749 = _1445 == 52;
                int _1751 = _1747;
                if (_1719)
                {
                    _1721 = _1349;
                }
                int _1753 = _1721;
                bool _1755 = _1433 == 80;
                int _1757 = _1753;
                if (_1725)
                {
                    _1751 = _1331;
                }
                int _1759 = _1751;
                bool _1761 = _1445 == 56;
                int _1763 = _1759;
                if (_1731)
                {
                    _1763 = _1333;
                }
                int _1765 = _1763;
                bool _1767 = _1445 == 60;
                int _1769 = _1765;
                if (_1737)
                {
                    _1769 = _1335;
                }
                int _1771 = _1769;
                bool _1773 = _1441 == 76;
                int _1775 = _1771;
                if (_1743)
                {
                    _1745 = _1347;
                }
                int _1777 = _1745;
                bool _1779 = _1445 == 64;
                int _1781 = _1777;
                if (_1749)
                {
                    _1775 = _1337;
                }
                int _1783 = _1775;
                bool _1785 = _1433 == 84;
                int _1787 = _1783;
                if (_1755)
                {
                    _1757 = _1351;
                }
                int _1789 = _1757;
                bool _1791 = _1445 == 68;
                int _1793 = _1789;
                if (_1761)
                {
                    _1787 = _1339;
                }
                int _1795 = _1787;
                bool _1797 = _1445 == 72;
                int _1799 = _1795;
                if (_1767)
                {
                    _1799 = _1341;
                }
                int _1801 = _1799;
                bool _1803 = _1445 == 76;
                int _1805 = _1801;
                if (_1773)
                {
                    _1781 = _1349;
                }
                int _1807 = _1781;
                bool _1809 = _1441 == 80;
                int _1811 = _1807;
                if (_1779)
                {
                    _1805 = _1343;
                }
                int _1813 = _1805;
                bool _1815 = _1497 == 0;
                int _1817 = _1813;
                if (_1785)
                {
                    _1793 = _1353;
                }
                int _1819 = _1793;
                bool _1821 = _1497 == 4;
                int _1823 = _1819;
                if (_1791)
                {
                    _1817 = _1345;
                }
                int _1825 = _1817;
                bool _1827 = _1445 == 80;
                int _1829 = _1825;
                if (_1797)
                {
                    _1829 = _1347;
                }
                int _1831 = _1829;
                bool _1833 = _1497 == 8;
                int _1835 = _1831;
                if (_1803)
                {
                    _1835 = _1349;
                }
                int _1837 = _1835;
                bool _1839 = _1433 == 88;
                int _1841 = _1837;
                if (_1809)
                {
                    _1811 = _1351;
                }
                int _1843 = _1811;
                bool _1845 = _1441 == 84;
                int _1847 = _1843;
                if (_1815)
                {
                    _1463 = _1311;
                }
                int _1849 = _1463;
                bool _1851 = _1497 == 12;
                int _1853 = _1849;
                if (_1821)
                {
                    _1853 = _1313;
                }
                int _1855 = _1853;
                bool _1857 = _1445 == 84;
                int _1859 = _1855;
                if (_1827)
                {
                    _1841 = _1351;
                }
                int _1861 = _1841;
                bool _1863 = _1497 == 16;
                int _1865 = _1861;
                if (_1833)
                {
                    _1859 = _1315;
                }
                int _1867 = _1859;
                bool _1869 = _1433 == 92;
                int _1871 = _1867;
                if (_1839)
                {
                    _1823 = _1355;
                }
                int _1873 = _1823;
                bool _1875 = _1497 == 20;
                int _1877 = _1873;
                if (_1845)
                {
                    _1847 = _1353;
                }
                int _1879 = _1847;
                bool _1881 = _1497 == 24;
                int _1883 = _1879;
                if (_1851)
                {
                    _1871 = _1317;
                }
                int _1885 = _1871;
                bool _1887 = _1441 == 88;
                int _1889 = _1885;
                if (_1857)
                {
                    _1865 = _1353;
                }
                int _1891 = _1865;
                bool _1893 = _1445 == 88;
                int _1895 = _1891;
                if (_1863)
                {
                    _1889 = _1319;
                }
                int _1897 = _1889;
                bool _1899 = _1497 == 28;
                int _1901 = _1897;
                if (_1869)
                {
                    _1877 = _1357;
                }
                int _1903 = _1877;
                bool _1905 = _1497 == 32;
                int _1907 = _1903;
                if (_1875)
                {
                    _1901 = _1321;
                }
                int _1909 = _1901;
                bool _1911 = _1433 == 96;
                int _1913 = _1909;
                if (_1881)
                {
                    _1913 = _1323;
                }
                int _1915 = _1913;
                bool _1917 = _1497 == 36;
                int _1919 = _1915;
                if (_1887)
                {
                    _1883 = _1355;
                }
                int _1921 = _1883;
                bool _1923 = _1497 == 40;
                int _1925 = _1921;
                if (_1893)
                {
                    _1895 = _1355;
                }
                int _1927 = _1895;
                bool _1929 = _1441 == 92;
                int _1931 = _1927;
                if (_1899)
                {
                    _1919 = _1325;
                }
                int _1933 = _1919;
                bool _1935 = _1497 == 44;
                int _1937 = _1933;
                if (_1905)
                {
                    _1937 = _1327;
                }
                int _1939 = _1937;
                bool _1941 = _1497 == 48;
                int _1943 = _1939;
                if (_1911)
                {
                    _1907 = _1359;
                }
                int _1945 = _1907;
                bool _1947 = _1441 == 96;
                int _1949 = _1945;
                if (_1917)
                {
                    _1943 = _1329;
                }
                int _1951 = _1943;
                bool _1953 = _1497 == 52;
                int _1955 = _1951;
                if (_1923)
                {
                    _1955 = _1331;
                }
                int _1957 = _1955;
                bool _1959 = _1421 >= _1945;
                int _1961 = _1957;
                if (_1929)
                {
                    _1925 = _1357;
                }
                int _1963 = _1925;
                bool _1965 = _1497 == 56;
                int _1967 = _1963;
                if (_1935)
                {
                    _1961 = _1333;
                }
                int _1969 = _1961;
                bool _1971 = _1497 == 60;
                int _1973 = _1969;
                if (_1941)
                {
                    _1973 = _1335;
                }
                int _1975 = _1973;
                bool _1977 = _1497 == 64;
                int _1979 = _1975;
                if (_1947)
                {
                    _1967 = _1359;
                }
                int _1981 = _1967;
                bool _1983 = _1445 == 92;
                _1379 = _1981;
                if (_1953)
                {
                    _1979 = _1337;
                }
                int _1985 = _1979;
                bool _1987 = _1497 == 68;
                int _1989 = _1985;
                if (!_1959)
                {
                    _1465 = _1945;
                }
                int _1991 = _1465;
                int _1993 = _1991;
                if (_1965)
                {
                    _1989 = _1339;
                }
                int _1995 = _1989;
                bool _1997 = _1497 == 72;
                int _1999 = _1995;
                if (_1971)
                {
                    _1999 = _1341;
                }
                int _2001 = _1999;
                bool _2003 = _1991 >= _1981;
                int _2005 = _2001;
                if (_1977)
                {
                    _2005 = _1343;
                }
                int _2007 = _2005;
                bool _2009 = _1445 == 96;
                int _2011 = _2007;
                if (_1983)
                {
                    _1931 = _1357;
                }
                int _2013 = _1931;
                bool _2015 = _1497 == 76;
                int _2017 = _2013;
                if (_1987)
                {
                    _2011 = _1345;
                }
                int _2019 = _2011;
                bool _2021 = _1497 == 80;
                int _2023 = _2019;
                if (_1997)
                {
                    _2023 = _1347;
                }
                int _2025 = _2023;
                bool _2027 = _1497 == 84;
                int _2029 = _2025;
                if (_2003)
                {
                    _1949 = _1991;
                }
                int _2031 = _1949;
                int _2033 = _2031;
                if (_2009)
                {
                    _2017 = _1359;
                }
                int _2035 = _2017;
                bool _2037 = _1497 == 88;
                _1381 = _2035;
                if (!_2003)
                {
                    _2033 = _1981;
                }
                int _2039 = _2033;
                int _2041 = _2039;
                if (_2015)
                {
                    _2029 = _1349;
                }
                int _2043 = _2029;
                bool _2045 = _1497 == 92;
                int _2047 = _2043;
                if (_2021)
                {
                    _2047 = _1351;
                }
                int _2049 = _2047;
                bool _2051 = _2039 >= _2035;
                int _2053 = _2049;
                if (_1959)
                {
                    _1993 = _1429;
                }
                int _2055 = _1993;
                int _2057 = _2055;
                if (_2027)
                {
                    _2053 = _1353;
                }
                int _2059 = _2053;
                bool _2061 = _1497 == 96;
                int _2063 = _2059;
                if (!_1959)
                {
                    _2057 = _1419;
                }
                int _2065 = _2057;
                int _2067 = _1419 + 4;
                _1401 = _2067;
                int _2069 = _2065;
                _1407 = _2067;
                if (_2037)
                {
                    _2063 = _1355;
                }
                int _2071 = _2063;
                int _2073 = _2071;
                if (!_2003)
                {
                    _2069 = _1435;
                }
                int _2075 = _2069;
                bool _2077 = _2067 >= _1415;
                int _2079 = _2075;
                if (_2045)
                {
                    _2073 = _1357;
                }
                int _2081 = _2073;
                int _2083 = _2081;
                if (!_2051)
                {
                    _2041 = _2035;
                }
                int _2085 = _2041;
                _1377 = _2085;
                _1385 = _2085;
                if (!_2051)
                {
                    _2079 = _1437;
                }
                int _2087 = _2079;
                int _2089 = _2087;
                if (_2061)
                {
                    _2083 = _1359;
                }
                int _2091 = _2083;
                bool _2093 = _2085 >= _2091;
                _1383 = _2091;
                if (_2093)
                {
                    _1467 = _2087;
                }
                int _2095 = _1467;
                int _2097 = _2095;
                if (_2093)
                {
                    _2089 = _2085;
                }
                int _2099 = _2089;
                int _2101 = _2099;
                if (!_2093)
                {
                    _2101 = _2091;
                }
                int _2103 = _2101;
                _1403 = _2103;
                _1409 = _2103;
                if (!_2093)
                {
                    _2097 = _1455;
                }
                int _2105 = _2097;
                _1417 = !_2077;
                _1405 = _2105;
                _1413 = _2105;
            } while (_1417);
        }
        int _2107 = _1407;
        int _2109 = _1409;
        int _2111 = _1385;
        int _2113 = _1411;
        int _2115 = _1413;
        int _2117 = -_2107;
        int _2119 = _1363 + _2117;
        bool _2121 = _2119 > 1;
        bool _2123 = !_2121;
        int _2125 = _2111;
        int _2127 = _2119;
        int _2129 = _2109;
        int _2131 = _2115;
        int _2133 = _2107;
        int _2135 = _2113;
        int _2137 = _2109;
        int _2139 = _2115;
        if (!_2123)
        {
            int _2141 = _2107 * 4;
            int _2143 = _2107 + 1;
            bool _2145 = _2141 == 0;
            int _2147 = _2143 * 4;
            bool _2149 = _2141 == 4;
            bool _2151 = _2141 == 8;
            bool _2153 = _2141 == 12;
            bool _2155 = _2141 == 24;
            bool _2157 = _2147 == 0;
            bool _2159 = _2141 == 40;
            if (_2145)
            {
                _2125 = _1311;
            }
            int _2161 = _2125;
            bool _2163 = _2141 == 16;
            int _2165 = _2161;
            if (_2149)
            {
                _2165 = _1313;
            }
            int _2167 = _2165;
            bool _2169 = _2141 == 20;
            int _2171 = _2167;
            if (_2151)
            {
                _2171 = _1315;
            }
            int _2173 = _2171;
            bool _2175 = _2141 == 36;
            int _2177 = _2173;
            if (_2153)
            {
                _2177 = _1317;
            }
            int _2179 = _2177;
            bool _2181 = _2141 == 28;
            int _2183 = _2179;
            if (_2157)
            {
                _2127 = _1311;
            }
            int _2185 = _2127;
            bool _2187 = _2147 == 16;
            int _2189 = _2185;
            if (_2163)
            {
                _2183 = _1319;
            }
            int _2191 = _2183;
            bool _2193 = _2141 == 32;
            int _2195 = _2191;
            if (_2169)
            {
                _2195 = _1321;
            }
            int _2197 = _2195;
            bool _2199 = _2141 == 48;
            int _2201 = _2197;
            if (_2155)
            {
                _2201 = _1323;
            }
            int _2203 = _2201;
            bool _2205 = _2147 == 4;
            int _2207 = _2203;
            if (_2181)
            {
                _2207 = _1325;
            }
            int _2209 = _2207;
            bool _2211 = _2141 == 44;
            int _2213 = _2209;
            if (_2193)
            {
                _2213 = _1327;
            }
            int _2215 = _2213;
            bool _2217 = _2147 == 8;
            int _2219 = _2215;
            if (_2175)
            {
                _2219 = _1329;
            }
            int _2221 = _2219;
            bool _2223 = _2147 == 12;
            int _2225 = _2221;
            if (_2205)
            {
                _2189 = _1313;
            }
            int _2227 = _2189;
            bool _2229 = _2141 == 52;
            int _2231 = _2227;
            if (_2159)
            {
                _2225 = _1331;
            }
            int _2233 = _2225;
            bool _2235 = _2147 == 20;
            int _2237 = _2233;
            if (_2211)
            {
                _2237 = _1333;
            }
            int _2239 = _2237;
            bool _2241 = _2147 == 24;
            int _2243 = _2239;
            if (_2199)
            {
                _2243 = _1335;
            }
            int _2245 = _2243;
            bool _2247 = _2141 == 60;
            int _2249 = _2245;
            if (_2217)
            {
                _2231 = _1315;
            }
            int _2251 = _2231;
            bool _2253 = _2141 == 56;
            int _2255 = _2251;
            if (_2223)
            {
                _2255 = _1317;
            }
            int _2257 = _2255;
            bool _2259 = _2147 == 28;
            int _2261 = _2257;
            if (_2187)
            {
                _2261 = _1319;
            }
            int _2263 = _2261;
            bool _2265 = _2147 == 32;
            int _2267 = _2263;
            if (_2235)
            {
                _2267 = _1321;
            }
            int _2269 = _2267;
            bool _2271 = _2147 == 36;
            int _2273 = _2269;
            if (_2229)
            {
                _2249 = _1337;
            }
            int _2275 = _2249;
            bool _2277 = _2141 == 64;
            int _2279 = _2275;
            if (_2241)
            {
                _2273 = _1323;
            }
            int _2281 = _2273;
            bool _2283 = _2141 == 68;
            int _2285 = _2281;
            if (_2253)
            {
                _2279 = _1339;
            }
            int _2287 = _2279;
            bool _2289 = _2147 == 40;
            int _2291 = _2287;
            if (_2259)
            {
                _2285 = _1325;
            }
            int _2293 = _2285;
            bool _2295 = _2141 == 72;
            int _2297 = _2293;
            if (_2247)
            {
                _2291 = _1341;
            }
            int _2299 = _2291;
            bool _2301 = _2147 == 44;
            int _2303 = _2299;
            if (_2265)
            {
                _2297 = _1327;
            }
            int _2305 = _2297;
            int _2307 = _2305;
            if (_2271)
            {
                _2307 = _1329;
            }
            int _2309 = _2307;
            int _2311 = _2309;
            if (_2277)
            {
                _2303 = _1343;
            }
            int _2313 = _2303;
            bool _2315 = _2141 == 76;
            int _2317 = _2313;
            if (_2283)
            {
                _2317 = _1345;
            }
            int _2319 = _2317;
            bool _2321 = _2141 == 80;
            bool _2323 = _2147 == 48;
            int _2325 = _2319;
            if (_2289)
            {
                _2311 = _1331;
            }
            int _2327 = _2311;
            bool _2329 = _2147 == 52;
            int _2331 = _2327;
            if (_2295)
            {
                _2325 = _1347;
            }
            int _2333 = _2325;
            bool _2335 = _2141 == 84;
            int _2337 = _2333;
            if (_2301)
            {
                _2331 = _1333;
            }
            int _2339 = _2331;
            bool _2341 = _2147 == 56;
            bool _2343 = _2147 == 60;
            int _2345 = _2339;
            if (_2315)
            {
                _2337 = _1349;
            }
            int _2347 = _2337;
            bool _2349 = _2141 == 88;
            int _2351 = _2347;
            if (_2321)
            {
                _2351 = _1351;
            }
            int _2353 = _2351;
            bool _2355 = _2141 == 92;
            int _2357 = _2353;
            if (_2323)
            {
                _2345 = _1335;
            }
            int _2359 = _2345;
            bool _2361 = _2147 == 64;
            int _2363 = _2359;
            if (_2329)
            {
                _2363 = _1337;
            }
            int _2365 = _2363;
            bool _2367 = _2147 == 68;
            int _2369 = _2365;
            if (_2335)
            {
                _2357 = _1353;
            }
            int _2371 = _2357;
            bool _2373 = _2141 == 96;
            int _2375 = _2371;
            if (_2341)
            {
                _2369 = _1339;
            }
            int _2377 = _2369;
            bool _2379 = _2147 == 72;
            int _2381 = _2377;
            if (_2343)
            {
                _2381 = _1341;
            }
            int _2383 = _2381;
            bool _2385 = _2147 == 76;
            int _2387 = _2383;
            if (_2349)
            {
                _2375 = _1355;
            }
            int _2389 = _2375;
            int _2391 = _2389;
            if (_2355)
            {
                _2391 = _1357;
            }
            int _2393 = _2391;
            bool _2395 = _2147 == 96;
            int _2397 = _2393;
            if (_2361)
            {
                _2387 = _1343;
            }
            int _2399 = _2387;
            bool _2401 = _2147 == 80;
            int _2403 = _2399;
            if (_2367)
            {
                _2403 = _1345;
            }
            int _2405 = _2403;
            bool _2407 = _2147 == 84;
            int _2409 = _2405;
            if (_2373)
            {
                _2397 = _1359;
            }
            int _2411 = _2397;
            bool _2413 = _2147 == 92;
            if (_2379)
            {
                _2409 = _1347;
            }
            int _2415 = _2409;
            bool _2417 = _2147 == 88;
            int _2419 = _2415;
            if (_2385)
            {
                _2419 = _1349;
            }
            int _2421 = _2419;
            bool _2423 = _2109 >= _2411;
            int _2425 = _2421;
            if (_2401)
            {
                _2425 = _1351;
            }
            int _2427 = _2425;
            int _2429 = _2427;
            if (_2407)
            {
                _2429 = _1353;
            }
            int _2431 = _2429;
            int _2433 = _2431;
            if (_2417)
            {
                _2433 = _1355;
            }
            int _2435 = _2433;
            int _2437 = _2435;
            _2135 = 0;
            if (_2413)
            {
                _2437 = _1357;
            }
            int _2439 = _2437;
            int _2441 = _2439;
            if (_2395)
            {
                _2441 = _1359;
            }
            int _2443 = _2441;
            if (!_2423)
            {
                _2129 = _2411;
            }
            int _2445 = _2129;
            _2137 = _2445;
            if (!_2423)
            {
                _2131 = _2107;
            }
            int _2447 = _2131;
            int _2449 = _2143 + 1;
            bool _2451 = _2445 >= _2443;
            int _2453 = _2447;
            _2133 = _2449;
            if (!_2451)
            {
                _2453 = _2143;
            }
            int _2455 = _2453;
            _2139 = _2455;
            if (!_2451)
            {
                _2137 = _2443;
            }
        }
        int _2457 = _2133;
        int _2459 = _2135;
        int _2461 = _2137;
        int _2463 = _2139;
        bool _2465 = _2457 < _1363;
        int _2467 = (_2465 ? (-1) : 0) | _2459;
        int _2469 = ~_2467;
        int _2471 = _2463;
        if (!(_2469 != 0))
        {
            int _2473 = _2457 << 2;
            bool _2475 = _2473 == 4;
            bool _2477 = _2473 == 8;
            bool _2479 = _2473 == 12;
            bool _2481 = _2473 == 16;
            if (_2475)
            {
                _1387 = _1313;
            }
            int _2483 = _1387;
            bool _2485 = _2473 == 20;
            int _2487 = _2483;
            if (_2477)
            {
                _2487 = _1315;
            }
            int _2489 = _2487;
            bool _2491 = _2473 == 24;
            int _2493 = _2489;
            if (_2479)
            {
                _2493 = _1317;
            }
            int _2495 = _2493;
            bool _2497 = _2473 == 28;
            int _2499 = _2495;
            if (_2481)
            {
                _2499 = _1319;
            }
            int _2501 = _2499;
            bool _2503 = _2473 == 32;
            int _2505 = _2501;
            if (_2485)
            {
                _2505 = _1321;
            }
            int _2507 = _2505;
            bool _2509 = _2473 == 36;
            int _2511 = _2507;
            if (_2491)
            {
                _2511 = _1323;
            }
            int _2513 = _2511;
            bool _2515 = _2473 == 40;
            int _2517 = _2513;
            if (_2497)
            {
                _2517 = _1325;
            }
            int _2519 = _2517;
            bool _2521 = _2473 == 44;
            int _2523 = _2519;
            if (_2503)
            {
                _2523 = _1327;
            }
            int _2525 = _2523;
            bool _2527 = _2473 == 48;
            int _2529 = _2525;
            if (_2509)
            {
                _2529 = _1329;
            }
            int _2531 = _2529;
            bool _2533 = _2473 == 52;
            int _2535 = _2531;
            if (_2515)
            {
                _2535 = _1331;
            }
            int _2537 = _2535;
            bool _2539 = _2473 == 56;
            int _2541 = _2537;
            if (_2521)
            {
                _2541 = _1333;
            }
            int _2543 = _2541;
            bool _2545 = _2473 == 60;
            int _2547 = _2543;
            if (_2527)
            {
                _2547 = _1335;
            }
            int _2549 = _2547;
            bool _2551 = _2473 == 64;
            int _2553 = _2549;
            if (_2533)
            {
                _2553 = _1337;
            }
            int _2555 = _2553;
            bool _2557 = _2473 == 68;
            int _2559 = _2555;
            if (_2539)
            {
                _2559 = _1339;
            }
            int _2561 = _2559;
            bool _2563 = _2473 == 72;
            int _2565 = _2561;
            if (_2545)
            {
                _2565 = _1341;
            }
            int _2567 = _2565;
            bool _2569 = _2473 == 76;
            int _2571 = _2567;
            if (_2551)
            {
                _2571 = _1343;
            }
            int _2573 = _2571;
            bool _2575 = _2473 == 80;
            int _2577 = _2573;
            if (_2557)
            {
                _2577 = _1345;
            }
            int _2579 = _2577;
            bool _2581 = _2473 == 84;
            int _2583 = _2579;
            if (_2563)
            {
                _2583 = _1347;
            }
            int _2585 = _2583;
            bool _2587 = _2473 == 88;
            int _2589 = _2585;
            if (_2569)
            {
                _2589 = _1349;
            }
            int _2591 = _2589;
            bool _2593 = _2473 == 92;
            int _2595 = _2591;
            if (_2575)
            {
                _2595 = _1351;
            }
            int _2597 = _2595;
            bool _2599 = _2473 == 96;
            int _2601 = _2597;
            if (_2581)
            {
                _2601 = _1353;
            }
            int _2603 = _2601;
            int _2605 = _2603;
            if (_2587)
            {
                _2605 = _1355;
            }
            int _2607 = _2605;
            int _2609 = _2607;
            if (_2593)
            {
                _2609 = _1357;
            }
            int _2611 = _2609;
            int _2613 = _2611;
            if (_2599)
            {
                _2613 = _1359;
            }
            int _2615 = _2613;
            bool _2617 = _2461 >= _2615;
            if (!_2617)
            {
                _2471 = _2457;
            }
        }
        int _2619 = _2471;
        _1395 = _2619;
    }
    int _2621 = _1395;
    int _2623 = _2621 * 8;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    float _2627 = as_type<float>(_31[int(_2625)]);
    int _2629 = _2623 + 4;
    uint _2631 = uint(int(uint(_2629) >> uint(2)));
    float _2633 = as_type<float>(_31[int(_2631)]);
    int _2635 = _74 + 16;
    int _2637 = _74 + 24;
    uint _2639 = uint(int(uint(_2635) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2639)] = as_type<uint>(_2627);
    int _2641 = _2635 + 4;
    uint _2643 = uint(int(uint(_2641) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2643)] = as_type<uint>(_2633);
    uint _2645 = uint(int(uint(_2637) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2645)] = as_type<uint>(_1361);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return;
}

