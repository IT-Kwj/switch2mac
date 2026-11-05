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
    sampler vp_t_tcb_8Smplr_w [[id(6)]];
    sampler vp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _873 = false;
    bool _697 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _2646 = float3((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float4 _58 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2646, float3(0.0), isnan(_2646)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2646, float3(0.0), isnan(_2646)), level(0.0)).xyzw;
    float _61 = _58.x;
    float _63 = _58.y;
    float _65 = _58.z;
    float _67 = _58.w;
    float _69 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _72 = as_type<int>(_69) * 32;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_75)] = as_type<uint>(_61);
    int _77 = _72 + 4;
    uint _79 = uint(int(uint(_77) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_79)] = as_type<uint>(_63);
    int _81 = _72 + 8;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_83)] = as_type<uint>(_65);
    int _85 = _72 + 12;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_87)] = as_type<uint>(_67);
    int _89 = -2;
    int _91 = 0;
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
    bool _145;
    bool _283;
    int _661;
    int _663;
    int _665;
    bool _673;
    int _675;
    int _729;
    int _731;
    int _737;
    int _743;
    int _749;
    int _755;
    int _761;
    int _767;
    int _773;
    int _779;
    int _785;
    int _791;
    int _797;
    int _803;
    int _809;
    int _815;
    bool _819;
    int _821;
    int _825;
    int _831;
    int _837;
    int _843;
    int _849;
    int _853;
    int _857;
    int _861;
    int _865;
    int _869;
    int _871;
    int _1231;
    int _1295;
    int _1297;
    int _1299;
    int _1301;
    int _1303;
    int _1305;
    int _1307;
    int _1309;
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
    int _1359;
    int _1361;
    int _1363;
    int _1365;
    int _1367;
    int _1369;
    do
    {
        int _147 = _89;
        int _149 = _91;
        int _151 = _93;
        int _153 = _95;
        int _155 = _97;
        int _157 = _99;
        int _159 = _101;
        int _161 = _103;
        int _163 = _105;
        int _165 = _107;
        int _167 = _109;
        int _169 = _111;
        int _171 = _113;
        int _173 = _115;
        int _175 = _117;
        int _177 = _119;
        int _179 = _121;
        int _181 = _123;
        int _183 = _125;
        int _185 = _127;
        int _187 = _129;
        int _189 = _131;
        int _191 = _133;
        int _193 = _135;
        int _195 = _137;
        int _197 = _139;
        int _199 = _141;
        float _201 = float(_147);
        float _203 = _201 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _205 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _207 = fma(_203, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2765 = float2(_205, _207);
        float4 _209 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2765, float2(0.0), isnan(_2765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2765, float2(0.0), isnan(_2765)), level(0.0)).xyzw;
        float _211 = _209.x;
        float _213 = _209.y;
        float _215 = _209.z;
        float _217 = _209.w;
        int _219 = -2;
        float _221 = _217;
        float _223 = _213;
        float _225 = _215;
        float _227 = _211;
        int _229 = _149;
        int _231 = _151;
        int _233 = _153;
        int _235 = _155;
        int _237 = _157;
        int _239 = _159;
        int _241 = _161;
        int _243 = _163;
        int _245 = _165;
        int _247 = _167;
        int _249 = _169;
        int _251 = _171;
        int _253 = _173;
        int _255 = _175;
        int _257 = _177;
        int _259 = _179;
        int _261 = _181;
        int _263 = _183;
        int _265 = _185;
        int _267 = _187;
        int _269 = _189;
        int _271 = _191;
        int _273 = _193;
        int _275 = _195;
        int _277 = _197;
        int _279 = _199;
        int _281 = -2;
        do
        {
            int _285 = _219;
            float _287 = _221;
            float _289 = _223;
            float _291 = _225;
            float _293 = _227;
            int _295 = _229;
            int _297 = _231;
            int _299 = _233;
            int _301 = _235;
            int _303 = _237;
            int _305 = _239;
            int _307 = _241;
            int _309 = _243;
            int _311 = _245;
            int _313 = _247;
            int _315 = _249;
            int _317 = _251;
            int _319 = _253;
            int _321 = _255;
            int _323 = _257;
            int _325 = _259;
            int _327 = _261;
            int _329 = _263;
            int _331 = _265;
            int _333 = _267;
            int _335 = _269;
            int _337 = _271;
            int _339 = _273;
            int _341 = _275;
            int _343 = _277;
            int _345 = _279;
            int _347 = _281;
            int _349 = _285 + 1;
            float _351 = float(_147);
            float _353 = float(_349);
            float _355 = _351 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _357 = _353 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _359 = 0.0 + _287;
            float _361 = precise::clamp(_359, 0.0, 1.0);
            float _363 = fma(_355, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _365 = 0.0 + _289;
            float _367 = precise::clamp(_365, 0.0, 1.0);
            float _369 = fma(_357, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _371 = 0.0 + _291;
            float _373 = precise::clamp(_371, 0.0, 1.0);
            float _375 = 0.0 + _293;
            float _377 = precise::clamp(_375, 0.0, 1.0);
            float2 _2885 = float2(_369, _363);
            float4 _379 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2885, float2(0.0), isnan(_2885)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2885, float2(0.0), isnan(_2885)), level(0.0)).xyzw;
            float _381 = _379.x;
            float _383 = _379.y;
            float _385 = _379.z;
            float _387 = _379.w;
            float _389 = _361 * 65535.0;
            float _391 = _373 * 65535.0;
            float _393 = _367 * 65535.0;
            float _395 = _377 * 65535.0;
            float _397 = rint(_389);
            int _399 = int(_397);
            float _401 = rint(_391);
            int _403 = int(_401);
            float _405 = rint(_393);
            int _407 = int(_405);
            uint _409 = extract_bits(uint(_399), 0u, 8u);
            int _411 = int(_409) & 255;
            uint _413 = extract_bits(uint(_399), 8u, 8u);
            int _415 = int(_413) & 255;
            int _417 = _415 << 8;
            int _419 = _411 | _417;
            float _421 = rint(_395);
            int _423 = int(_421);
            uint _425 = extract_bits(uint(_419), 0u, 8u);
            int _427 = int(_425) & 255;
            uint _429 = extract_bits(uint(_419), 8u, 8u);
            int _431 = int(_429) & 255;
            int _433 = _431 << 8;
            int _435 = _427 | _433;
            uint _437 = extract_bits(uint(_403), 0u, 8u);
            int _439 = int(_437) & 255;
            int _441 = _439 << 16;
            int _443 = _435 | _441;
            uint _445 = extract_bits(uint(_403), 8u, 8u);
            int _447 = int(_445) & 255;
            int _449 = _447 << 24;
            int _451 = _443 | _449;
            bool _453 = _451 != 0;
            uint _455 = extract_bits(uint(_407), 0u, 8u);
            int _457 = int(_455) & 255;
            uint _459 = extract_bits(uint(_407), 8u, 8u);
            int _461 = int(_459) & 255;
            int _463 = _461 << 8;
            int _465 = _457 | _463;
            uint _467 = extract_bits(uint(_465), 0u, 8u);
            int _469 = int(_467) & 255;
            uint _471 = extract_bits(uint(_465), 8u, 8u);
            int _473 = int(_471) & 255;
            int _475 = _473 << 8;
            int _477 = _469 | _475;
            uint _479 = extract_bits(uint(_423), 0u, 8u);
            int _481 = int(_479) & 255;
            int _483 = _481 << 16;
            int _485 = _477 | _483;
            uint _487 = extract_bits(uint(_423), 8u, 8u);
            int _489 = int(_487) & 255;
            int _491 = _489 << 24;
            int _493 = _485 | _491;
            bool _495 = _493 != 0;
            bool _497 = _495 || _453;
            bool _499 = !_497;
            _219 = _349;
            _221 = _387;
            _223 = _383;
            _225 = _385;
            _227 = _381;
            int _501 = _305;
            int _503 = _297;
            int _505 = _299;
            int _507 = _301;
            int _509 = _303;
            int _511 = _307;
            int _513 = _309;
            int _515 = _319;
            int _517 = _311;
            int _519 = _313;
            int _521 = _315;
            int _523 = _317;
            int _525 = _321;
            int _527 = _323;
            int _529 = _333;
            int _531 = _325;
            int _533 = _327;
            int _535 = _329;
            int _537 = _331;
            int _539 = _335;
            int _541 = _337;
            int _543 = _339;
            int _545 = _341;
            int _547 = _343;
            int _549 = _345;
            int _551 = _451;
            int _553 = _297;
            int _555 = _299;
            int _557 = _301;
            int _559 = _303;
            int _561 = _341;
            int _563 = _343;
            int _565 = _345;
            int _567 = _305;
            int _569 = _307;
            int _571 = _309;
            int _573 = _311;
            int _575 = _313;
            int _577 = _315;
            int _579 = _317;
            int _581 = _319;
            int _583 = _321;
            int _585 = _323;
            int _587 = _325;
            int _589 = _327;
            int _591 = _329;
            int _593 = _331;
            int _595 = _339;
            int _597 = _337;
            int _599 = _335;
            int _601 = _295;
            int _603 = _297;
            int _605 = _299;
            int _607 = _301;
            int _609 = _303;
            int _611 = _305;
            int _613 = _307;
            int _615 = _309;
            int _617 = _311;
            int _619 = _313;
            int _621 = _315;
            int _623 = _317;
            int _625 = _319;
            int _627 = _321;
            int _629 = _323;
            int _631 = _325;
            int _633 = _327;
            int _635 = _329;
            int _637 = _331;
            int _639 = _333;
            int _641 = _335;
            int _643 = _337;
            int _645 = _339;
            int _647 = _341;
            int _649 = _343;
            int _651 = _345;
            int _653 = _493;
            int _655 = _423;
            int _657 = _451;
            int _659 = _419;
            _661 = _493;
            _663 = _451;
            _665 = as_type<int>(_385);
            if (!_499)
            {
                bool _667 = _295 > 0;
                bool _669 = !_667;
                if (!_669)
                {
                    int _671 = 0;
                    do
                    {
                        _675 = _671;
                        int _677 = _675 * 8;
                        uint _679 = uint(int(uint(_677) >> uint(2)));
                        float _681 = as_type<float>(_31[int(_679)]);
                        int _683 = _677 + 4;
                        uint _685 = uint(int(uint(_683) >> uint(2)));
                        float _687 = as_type<float>(_31[int(_685)]);
                        bool _689 = as_type<int>(_681) != _451;
                        bool _691 = as_type<int>(_687) != _493;
                        bool _693 = _691 || _689;
                        bool _695 = !_693;
                        _697 = _695;
                        if (_697)
                        {
                            break;
                        }
                        int _699 = _675 + 1;
                        bool _701 = _699 >= _295;
                        _673 = !_701;
                        _671 = _699;
                    } while (_673);
                }
                if (!_697)
                {
                    int _703 = _295 * 4;
                    int _705 = _295 * 8;
                    int _707 = _295 + 1;
                    bool _709 = _703 == 16;
                    bool _711 = _703 == 0;
                    uint _713 = uint(int(uint(_705) >> uint(2)));
                    _31[int(_713)] = uint(_451);
                    int _715 = _705 + 4;
                    uint _717 = uint(int(uint(_715) >> uint(2)));
                    _31[int(_717)] = uint(_493);
                    bool _719 = _703 == 4;
                    bool _721 = _703 == 8;
                    bool _723 = _703 == 12;
                    bool _725 = _703 == 20;
                    bool _727 = _703 == 24;
                    _601 = _707;
                    _655 = _705;
                    _659 = _703;
                    _729 = _705;
                    _731 = _703;
                    if (_709)
                    {
                        _501 = 1;
                    }
                    int _733 = _501;
                    bool _735 = _703 == 44;
                    _611 = _733;
                    _737 = _733;
                    if (_711)
                    {
                        _503 = 1;
                    }
                    int _739 = _503;
                    bool _741 = _703 == 28;
                    _603 = _739;
                    _743 = _739;
                    if (_719)
                    {
                        _505 = 1;
                    }
                    int _745 = _505;
                    bool _747 = _703 == 32;
                    _605 = _745;
                    _749 = _745;
                    if (_721)
                    {
                        _507 = 1;
                    }
                    int _751 = _507;
                    bool _753 = _703 == 36;
                    _607 = _751;
                    _755 = _751;
                    if (_723)
                    {
                        _509 = 1;
                    }
                    int _757 = _509;
                    bool _759 = _703 == 40;
                    _609 = _757;
                    _761 = _757;
                    if (_725)
                    {
                        _511 = 1;
                    }
                    int _763 = _511;
                    bool _765 = _703 == 48;
                    _613 = _763;
                    _767 = _763;
                    if (_727)
                    {
                        _513 = 1;
                    }
                    int _769 = _513;
                    bool _771 = _703 == 52;
                    _615 = _769;
                    _773 = _769;
                    if (_735)
                    {
                        _515 = 1;
                    }
                    int _775 = _515;
                    bool _777 = _703 == 72;
                    _625 = _775;
                    _779 = _775;
                    if (_741)
                    {
                        _517 = 1;
                    }
                    int _781 = _517;
                    bool _783 = _703 == 56;
                    _617 = _781;
                    _785 = _781;
                    if (_747)
                    {
                        _519 = 1;
                    }
                    int _787 = _519;
                    bool _789 = _703 == 60;
                    _619 = _787;
                    _791 = _787;
                    if (_753)
                    {
                        _521 = 1;
                    }
                    int _793 = _521;
                    bool _795 = _703 == 64;
                    _621 = _793;
                    _797 = _793;
                    if (_759)
                    {
                        _523 = 1;
                    }
                    int _799 = _523;
                    bool _801 = _703 == 68;
                    _623 = _799;
                    _803 = _799;
                    if (_765)
                    {
                        _525 = 1;
                    }
                    int _805 = _525;
                    bool _807 = _703 == 76;
                    _627 = _805;
                    _809 = _805;
                    if (_771)
                    {
                        _527 = 1;
                    }
                    int _811 = _527;
                    bool _813 = _703 == 80;
                    _629 = _811;
                    _815 = _811;
                    if (_777)
                    {
                        _529 = 1;
                    }
                    int _817 = _529;
                    _819 = _707 != 25;
                    _639 = _817;
                    _821 = _817;
                    if (_783)
                    {
                        _531 = 1;
                    }
                    int _823 = _531;
                    _631 = _823;
                    _825 = _823;
                    if (_789)
                    {
                        _533 = 1;
                    }
                    int _827 = _533;
                    bool _829 = _703 == 84;
                    _633 = _827;
                    _831 = _827;
                    if (_795)
                    {
                        _535 = 1;
                    }
                    int _833 = _535;
                    bool _835 = _703 == 88;
                    _635 = _833;
                    _837 = _833;
                    if (_801)
                    {
                        _537 = 1;
                    }
                    int _839 = _537;
                    bool _841 = _703 == 92;
                    _637 = _839;
                    _843 = _839;
                    if (_807)
                    {
                        _539 = 1;
                    }
                    int _845 = _539;
                    bool _847 = _703 == 96;
                    _641 = _845;
                    _849 = _845;
                    if (_813)
                    {
                        _541 = 1;
                    }
                    int _851 = _541;
                    _643 = _851;
                    _853 = _851;
                    if (_829)
                    {
                        _543 = 1;
                    }
                    int _855 = _543;
                    _645 = _855;
                    _857 = _855;
                    if (_835)
                    {
                        _545 = 1;
                    }
                    int _859 = _545;
                    _647 = _859;
                    _861 = _859;
                    if (_841)
                    {
                        _547 = 1;
                    }
                    int _863 = _547;
                    _649 = _863;
                    _865 = _863;
                    if (_847)
                    {
                        _549 = 1;
                    }
                    int _867 = _549;
                    _651 = _867;
                    _869 = _867;
                }
                if ((!_819) || _697)
                {
                    if (!_697)
                    {
                        _871 = 25;
                        _873 = true;
                        if (_873)
                        {
                            break;
                        }
                    }
                    _697 = false;
                    int _875 = _675 * 4;
                    bool _877 = _875 == 0;
                    bool _879 = _875 == 4;
                    bool _881 = _875 == 8;
                    bool _883 = _875 == 12;
                    bool _885 = _875 == 88;
                    bool _887 = _875 == 92;
                    bool _889 = _875 == 96;
                    if (_877)
                    {
                        _551 = _297;
                    }
                    int _891 = _551;
                    bool _893 = _875 == 16;
                    int _895 = _891;
                    if (_879)
                    {
                        _895 = _299;
                    }
                    int _897 = _895;
                    bool _899 = _875 == 20;
                    int _901 = _897;
                    if (_881)
                    {
                        _901 = _301;
                    }
                    int _903 = _901;
                    bool _905 = _875 == 24;
                    int _907 = _903;
                    if (_883)
                    {
                        _907 = _303;
                    }
                    int _909 = _907;
                    bool _911 = _875 == 84;
                    int _913 = int(_905);
                    int _915 = _899 ? 2 : 0;
                    int _917 = _913 | _915;
                    int _919 = _893 ? 4 : 0;
                    int _921 = _917 | _919;
                    int _923 = _911 ? 8 : 0;
                    int _925 = _921 | _923;
                    int _927 = _885 ? 16 : 0;
                    int _929 = _925 | _927;
                    int _931 = _887 ? 32 : 0;
                    int _933 = _929 | _931;
                    int _935 = _889 ? 64 : 0;
                    int _937 = _933 | _935;
                    int _939 = _937 & 8;
                    int _941 = _909;
                    _653 = _939;
                    if (_893)
                    {
                        _941 = _305;
                    }
                    int _943 = _941;
                    bool _945 = _875 == 80;
                    int _947 = _943;
                    if (_899)
                    {
                        _947 = _307;
                    }
                    int _949 = _947;
                    bool _951 = _875 == 76;
                    int _953 = _949;
                    if (_905)
                    {
                        _953 = _309;
                    }
                    int _955 = _953;
                    bool _957 = _875 == 28;
                    int _959 = int(_957);
                    int _961 = _951 ? 2 : 0;
                    int _963 = _959 | _961;
                    int _965 = _945 ? 4 : 0;
                    int _967 = _963 | _965;
                    int _969 = _911 ? 8 : 0;
                    int _971 = _967 | _969;
                    int _973 = _885 ? 16 : 0;
                    int _975 = _971 | _973;
                    int _977 = _887 ? 32 : 0;
                    int _979 = _975 | _977;
                    int _981 = _889 ? 64 : 0;
                    int _983 = _979 | _981;
                    int _985 = _983 & 2;
                    int _987 = int(_957);
                    int _989 = _951 ? 2 : 0;
                    int _991 = _987 | _989;
                    int _993 = _945 ? 4 : 0;
                    int _995 = _991 | _993;
                    int _997 = _911 ? 8 : 0;
                    int _999 = _995 | _997;
                    int _1001 = _885 ? 16 : 0;
                    int _1003 = _999 | _1001;
                    int _1005 = _887 ? 32 : 0;
                    int _1007 = _1003 | _1005;
                    int _1009 = _889 ? 64 : 0;
                    int _1011 = _1007 | _1009;
                    int _1013 = _1011 & 4;
                    int _1015 = _955;
                    _655 = _985;
                    _659 = _1013;
                    if (_957)
                    {
                        _1015 = _311;
                    }
                    int _1017 = _1015;
                    bool _1019 = _875 == 32;
                    int _1021 = _1017;
                    if (_1019)
                    {
                        _1021 = _313;
                    }
                    int _1023 = _1021;
                    bool _1025 = _875 == 36;
                    int _1027 = _1023;
                    if (_1025)
                    {
                        _1027 = _315;
                    }
                    int _1029 = _1027;
                    bool _1031 = _875 == 40;
                    int _1033 = _1029;
                    if (_1031)
                    {
                        _1033 = _317;
                    }
                    int _1035 = _1033;
                    bool _1037 = _875 == 44;
                    int _1039 = _1035;
                    if (_1037)
                    {
                        _1039 = _319;
                    }
                    int _1041 = _1039;
                    bool _1043 = _875 == 48;
                    int _1045 = _1041;
                    if (_1043)
                    {
                        _1045 = _321;
                    }
                    int _1047 = _1045;
                    bool _1049 = _875 == 52;
                    int _1051 = _1047;
                    if (_1049)
                    {
                        _1051 = _323;
                    }
                    int _1053 = _1051;
                    bool _1055 = _875 == 56;
                    int _1057 = _1053;
                    if (_1055)
                    {
                        _1057 = _325;
                    }
                    int _1059 = _1057;
                    bool _1061 = _875 == 60;
                    int _1063 = _1059;
                    if (_1061)
                    {
                        _1063 = _327;
                    }
                    int _1065 = _1063;
                    bool _1067 = _875 == 64;
                    int _1069 = _1065;
                    if (_1067)
                    {
                        _1069 = _329;
                    }
                    int _1071 = _1069;
                    bool _1073 = _875 == 68;
                    int _1075 = _1071;
                    if (_1073)
                    {
                        _1075 = _331;
                    }
                    int _1077 = _1075;
                    bool _1079 = _875 == 72;
                    int _1081 = int(_1079);
                    int _1083 = _951 ? 2 : 0;
                    int _1085 = _1081 | _1083;
                    int _1087 = _945 ? 4 : 0;
                    int _1089 = _1085 | _1087;
                    int _1091 = _911 ? 8 : 0;
                    int _1093 = _1089 | _1091;
                    int _1095 = _885 ? 16 : 0;
                    int _1097 = _1093 | _1095;
                    int _1099 = _887 ? 32 : 0;
                    int _1101 = _1097 | _1099;
                    int _1103 = _889 ? 64 : 0;
                    int _1105 = _1101 | _1103;
                    int _1107 = _1105 & 1;
                    int _1109 = _1077;
                    if (_1079)
                    {
                        _1109 = _333;
                    }
                    int _1111 = _1109;
                    bool _1113 = _875 == 4;
                    int _1115 = _1111;
                    if (_951)
                    {
                        _1115 = _335;
                    }
                    int _1117 = _1115;
                    bool _1119 = _875 == 0;
                    int _1121 = _1117;
                    if (_945)
                    {
                        _1121 = _337;
                    }
                    int _1123 = _1121;
                    bool _1125 = _875 == 12;
                    int _1127 = _1123;
                    if (_911)
                    {
                        _1127 = _339;
                    }
                    int _1129 = _1127;
                    bool _1131 = _875 == 8;
                    int _1133 = _1129;
                    if (_885)
                    {
                        _1133 = _341;
                    }
                    int _1135 = _1133;
                    int _1137 = _1135;
                    if (_887)
                    {
                        _1137 = _343;
                    }
                    int _1139 = _1137;
                    int _1141 = _1139;
                    if (_889)
                    {
                        _1141 = _345;
                    }
                    int _1143 = _1141;
                    int _1145 = _1143 + 1;
                    _657 = _1145;
                    if (_1119)
                    {
                        _553 = _1145;
                    }
                    int _1147 = _553;
                    bool _1149 = _875 == 16;
                    _603 = _1147;
                    if (_1113)
                    {
                        _555 = _1145;
                    }
                    int _1151 = _555;
                    bool _1153 = _875 == 20;
                    _605 = _1151;
                    if (_1131)
                    {
                        _557 = _1145;
                    }
                    int _1155 = _557;
                    bool _1157 = _875 == 24;
                    _607 = _1155;
                    if (_1125)
                    {
                        _559 = _1145;
                    }
                    int _1159 = _559;
                    bool _1161 = _875 == 28;
                    _609 = _1159;
                    if (_885)
                    {
                        _561 = _1145;
                    }
                    int _1163 = _561;
                    _647 = _1163;
                    if (_887)
                    {
                        _563 = _1145;
                    }
                    int _1165 = _563;
                    _649 = _1165;
                    if (_889)
                    {
                        _565 = _1145;
                    }
                    int _1167 = _565;
                    _651 = _1167;
                    if (_1149)
                    {
                        _567 = _1145;
                    }
                    int _1169 = _567;
                    bool _1171 = _875 == 32;
                    _611 = _1169;
                    if (_1153)
                    {
                        _569 = _1145;
                    }
                    int _1173 = _569;
                    bool _1175 = _875 == 36;
                    _613 = _1173;
                    if (_1157)
                    {
                        _571 = _1145;
                    }
                    int _1177 = _571;
                    bool _1179 = _875 == 40;
                    _615 = _1177;
                    if (_1161)
                    {
                        _573 = _1145;
                    }
                    int _1181 = _573;
                    bool _1183 = _875 == 44;
                    _617 = _1181;
                    if (_1171)
                    {
                        _575 = _1145;
                    }
                    int _1185 = _575;
                    bool _1187 = _875 == 48;
                    _619 = _1185;
                    if (_1175)
                    {
                        _577 = _1145;
                    }
                    int _1189 = _577;
                    bool _1191 = _875 == 52;
                    _621 = _1189;
                    if (_1179)
                    {
                        _579 = _1145;
                    }
                    int _1193 = _579;
                    bool _1195 = _875 == 56;
                    _623 = _1193;
                    if (_1183)
                    {
                        _581 = _1145;
                    }
                    int _1197 = _581;
                    bool _1199 = _875 == 60;
                    _625 = _1197;
                    if (_1187)
                    {
                        _583 = _1145;
                    }
                    int _1201 = _583;
                    bool _1203 = _875 == 64;
                    _627 = _1201;
                    if (_1191)
                    {
                        _585 = _1145;
                    }
                    int _1205 = _585;
                    bool _1207 = _875 == 68;
                    _629 = _1205;
                    if (_1195)
                    {
                        _587 = _1145;
                    }
                    int _1209 = _587;
                    bool _1211 = _939 != 0;
                    _631 = _1209;
                    if (_1199)
                    {
                        _589 = _1145;
                    }
                    int _1213 = _589;
                    bool _1215 = _1013 != 0;
                    _633 = _1213;
                    if (_1203)
                    {
                        _591 = _1145;
                    }
                    int _1217 = _591;
                    _635 = _1217;
                    if (_1207)
                    {
                        _593 = _1145;
                    }
                    int _1219 = _593;
                    bool _1221 = _985 != 0;
                    _637 = _1219;
                    if (_1211)
                    {
                        _595 = _1145;
                    }
                    int _1223 = _595;
                    bool _1225 = _1107 != 0;
                    _645 = _1223;
                    if (_1215)
                    {
                        _597 = _1145;
                    }
                    int _1227 = _597;
                    _643 = _1227;
                    if (_1221)
                    {
                        _599 = _1145;
                    }
                    int _1229 = _599;
                    _641 = _1229;
                    if (_1225)
                    {
                        _639 = _1145;
                    }
                }
            }
            _1231 = _601;
            int _1233 = _603;
            int _1235 = _605;
            int _1237 = _607;
            int _1239 = _609;
            int _1241 = _611;
            int _1243 = _613;
            int _1245 = _615;
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
            int _1291 = _347 + 1;
            bool _1293 = _1291 >= 3;
            _283 = !_1293;
            _229 = _1231;
            _231 = _1233;
            _233 = _1235;
            _235 = _1237;
            _237 = _1239;
            _239 = _1241;
            _241 = _1243;
            _243 = _1245;
            _245 = _1247;
            _247 = _1249;
            _249 = _1251;
            _251 = _1253;
            _253 = _1255;
            _255 = _1257;
            _257 = _1259;
            _259 = _1261;
            _261 = _1263;
            _263 = _1265;
            _265 = _1267;
            _267 = _1269;
            _269 = _1271;
            _271 = _1273;
            _273 = _1275;
            _275 = _1277;
            _277 = _1279;
            _279 = _1281;
            _281 = _1291;
            _743 = _1233;
            _749 = _1235;
            _755 = _1237;
            _761 = _1239;
            _737 = _1241;
            _767 = _1243;
            _773 = _1245;
            _785 = _1247;
            _791 = _1249;
            _797 = _1251;
            _803 = _1253;
            _779 = _1255;
            _809 = _1257;
            _815 = _1259;
            _825 = _1261;
            _831 = _1263;
            _837 = _1265;
            _843 = _1267;
            _821 = _1269;
            _849 = _1271;
            _853 = _1273;
            _857 = _1275;
            _861 = _1277;
            _865 = _1279;
            _869 = _1281;
            _661 = _1283;
            _729 = _1285;
            _663 = _1287;
            _731 = _1289;
        } while (_283);
        if (!_873)
        {
            _871 = _1231;
        }
        _873 = false;
        _1295 = _743;
        _1297 = _749;
        _1299 = _755;
        _1301 = _761;
        _1303 = _737;
        _1305 = _767;
        _1307 = _773;
        _1309 = _785;
        _1311 = _791;
        _1313 = _797;
        _1315 = _803;
        _1317 = _779;
        _1319 = _809;
        _1321 = _815;
        _1323 = _825;
        _1325 = _831;
        _1327 = _837;
        _1329 = _843;
        _1331 = _821;
        _1333 = _849;
        _1335 = _853;
        _1337 = _857;
        _1339 = _861;
        _1341 = _865;
        _1343 = _869;
        _1345 = _871;
        int _1347 = _661;
        int _1349 = _729;
        int _1351 = _663;
        int _1353 = _731;
        int _1355 = _147 + 1;
        bool _1357 = _1355 >= 3;
        _145 = !_1357;
        _89 = _1355;
        _91 = _1345;
        _93 = _1295;
        _95 = _1297;
        _97 = _1299;
        _99 = _1301;
        _101 = _1303;
        _103 = _1305;
        _105 = _1307;
        _107 = _1309;
        _109 = _1311;
        _111 = _1313;
        _113 = _1315;
        _115 = _1317;
        _117 = _1319;
        _119 = _1321;
        _121 = _1323;
        _123 = _1325;
        _125 = _1327;
        _127 = _1329;
        _129 = _1331;
        _131 = _1333;
        _133 = _1335;
        _135 = _1337;
        _137 = _1339;
        _139 = _1341;
        _141 = _1343;
        _1359 = _1347;
        _1361 = _1349;
        _1363 = _1351;
        _1365 = _1353;
        _1367 = _1347;
        _1369 = _1295;
    } while (_145);
    bool _1371 = _1345 > 0;
    if (!_1371)
    {
        _665 = 0;
    }
    int _1373 = _665;
    bool _1375 = !_1371;
    int _1377 = _1373;
    if (!_1375)
    {
        bool _1379 = _1345 > 3;
        bool _1381 = !_1379;
        int _1383 = 0;
        int _1385 = 0;
        int _1387 = 0;
        int _1389 = 0;
        int _1391 = 0;
        int _1393 = -1;
        int _1395 = 0;
        if (!_1381)
        {
            int _1397 = _1345 + (-3);
            _1393 = 0;
            bool _1399;
            do
            {
                int _1401 = _1383;
                int _1403 = _1385;
                int _1405 = _1359;
                int _1407 = _1361;
                int _1409 = _1363;
                int _1411 = _1387;
                int _1413 = _1365;
                int _1415 = _1401 * 4;
                int _1417 = _1401 + 1;
                int _1419 = _1401 + 2;
                bool _1421 = _1415 == 0;
                int _1423 = _1417 * 4;
                bool _1425 = _1415 == 4;
                int _1427 = _1419 * 4;
                bool _1429 = _1415 == 8;
                bool _1431 = _1415 == 12;
                bool _1433 = _1415 == 16;
                bool _1435 = _1423 == 8;
                int _1437 = _1401 + 3;
                int _1439 = _1405;
                int _1441 = _1407;
                int _1443 = _1409;
                int _1445 = _1413;
                int _1447 = _1403;
                int _1449 = _1411;
                if (_1421)
                {
                    _1439 = _1295;
                }
                int _1451 = _1439;
                bool _1453 = _1415 == 24;
                int _1455 = _1451;
                if (_1425)
                {
                    _1455 = _1297;
                }
                int _1457 = _1455;
                bool _1459 = _1415 == 20;
                int _1461 = _1457;
                if (_1429)
                {
                    _1461 = _1299;
                }
                int _1463 = _1461;
                bool _1465 = _1415 == 32;
                int _1467 = _1463;
                if (_1431)
                {
                    _1467 = _1301;
                }
                int _1469 = _1467;
                bool _1471 = _1415 == 28;
                int _1473 = _1469;
                if (_1433)
                {
                    _1473 = _1303;
                }
                int _1475 = _1473;
                bool _1477 = _1415 == 40;
                int _1479 = _1437 * 4;
                int _1481 = _1475;
                if (_1459)
                {
                    _1481 = _1305;
                }
                int _1483 = _1481;
                bool _1485 = _1415 == 36;
                int _1487 = _1483;
                if (_1453)
                {
                    _1487 = _1307;
                }
                int _1489 = _1487;
                bool _1491 = _1423 == 0;
                int _1493 = _1489;
                if (_1471)
                {
                    _1493 = _1309;
                }
                int _1495 = _1493;
                bool _1497 = _1423 == 4;
                int _1499 = _1495;
                if (_1465)
                {
                    _1499 = _1311;
                }
                int _1501 = _1499;
                bool _1503 = _1423 == 12;
                int _1505 = _1501;
                if (_1485)
                {
                    _1505 = _1313;
                }
                int _1507 = _1505;
                bool _1509 = _1415 == 44;
                int _1511 = _1507;
                if (_1477)
                {
                    _1511 = _1315;
                }
                int _1513 = _1511;
                bool _1515 = _1423 == 16;
                int _1517 = _1513;
                if (_1491)
                {
                    _1441 = _1295;
                }
                int _1519 = _1441;
                bool _1521 = _1415 == 48;
                int _1523 = _1519;
                if (_1497)
                {
                    _1523 = _1297;
                }
                int _1525 = _1523;
                int _1527 = _1525;
                if (_1435)
                {
                    _1527 = _1299;
                }
                int _1529 = _1527;
                bool _1531 = _1423 == 20;
                int _1533 = _1529;
                if (_1503)
                {
                    _1533 = _1301;
                }
                int _1535 = _1533;
                bool _1537 = _1423 == 24;
                bool _1539 = _1423 == 28;
                int _1541 = _1535;
                if (_1509)
                {
                    _1517 = _1317;
                }
                int _1543 = _1517;
                bool _1545 = _1415 == 52;
                int _1547 = _1543;
                if (_1515)
                {
                    _1541 = _1303;
                }
                int _1549 = _1541;
                bool _1551 = _1423 == 32;
                int _1553 = _1549;
                if (_1521)
                {
                    _1547 = _1319;
                }
                int _1555 = _1547;
                bool _1557 = _1415 == 56;
                int _1559 = _1555;
                if (_1531)
                {
                    _1553 = _1305;
                }
                int _1561 = _1553;
                bool _1563 = _1423 == 36;
                int _1565 = _1561;
                if (_1537)
                {
                    _1565 = _1307;
                }
                int _1567 = _1565;
                bool _1569 = _1423 == 40;
                int _1571 = _1567;
                if (_1539)
                {
                    _1571 = _1309;
                }
                int _1573 = _1571;
                bool _1575 = _1423 == 44;
                int _1577 = _1573;
                if (_1545)
                {
                    _1559 = _1321;
                }
                int _1579 = _1559;
                bool _1581 = _1415 == 60;
                int _1583 = _1579;
                if (_1551)
                {
                    _1577 = _1311;
                }
                int _1585 = _1577;
                bool _1587 = _1423 == 48;
                int _1589 = _1585;
                if (_1557)
                {
                    _1583 = _1323;
                }
                int _1591 = _1583;
                bool _1593 = _1415 == 64;
                int _1595 = _1591;
                if (_1563)
                {
                    _1589 = _1313;
                }
                int _1597 = _1589;
                bool _1599 = _1423 == 52;
                int _1601 = _1597;
                if (_1569)
                {
                    _1601 = _1315;
                }
                int _1603 = _1601;
                bool _1605 = _1423 == 56;
                int _1607 = _1603;
                if (_1575)
                {
                    _1607 = _1317;
                }
                int _1609 = _1607;
                bool _1611 = _1423 == 60;
                int _1613 = _1609;
                if (_1581)
                {
                    _1595 = _1325;
                }
                int _1615 = _1595;
                bool _1617 = _1427 == 0;
                int _1619 = _1615;
                if (_1587)
                {
                    _1613 = _1319;
                }
                int _1621 = _1613;
                bool _1623 = _1415 == 68;
                int _1625 = _1621;
                if (_1593)
                {
                    _1619 = _1327;
                }
                int _1627 = _1619;
                bool _1629 = _1427 == 4;
                int _1631 = _1627;
                if (_1599)
                {
                    _1625 = _1321;
                }
                int _1633 = _1625;
                bool _1635 = _1427 == 8;
                int _1637 = _1633;
                if (_1605)
                {
                    _1637 = _1323;
                }
                int _1639 = _1637;
                bool _1641 = _1427 == 12;
                int _1643 = _1639;
                if (_1611)
                {
                    _1643 = _1325;
                }
                int _1645 = _1643;
                bool _1647 = _1427 == 16;
                int _1649 = _1645;
                if (_1617)
                {
                    _1443 = _1295;
                }
                int _1651 = _1443;
                bool _1653 = _1423 == 64;
                int _1655 = _1651;
                if (_1623)
                {
                    _1631 = _1329;
                }
                int _1657 = _1631;
                bool _1659 = _1427 == 20;
                int _1661 = _1657;
                if (_1629)
                {
                    _1655 = _1297;
                }
                int _1663 = _1655;
                bool _1665 = _1415 == 72;
                int _1667 = _1663;
                if (_1635)
                {
                    _1667 = _1299;
                }
                int _1669 = _1667;
                bool _1671 = _1427 == 24;
                int _1673 = _1669;
                if (_1641)
                {
                    _1673 = _1301;
                }
                int _1675 = _1673;
                bool _1677 = _1427 == 28;
                int _1679 = _1675;
                if (_1647)
                {
                    _1679 = _1303;
                }
                int _1681 = _1679;
                int _1683 = _1681;
                if (_1653)
                {
                    _1649 = _1327;
                }
                int _1685 = _1649;
                bool _1687 = _1423 == 68;
                int _1689 = _1685;
                if (_1659)
                {
                    _1683 = _1305;
                }
                int _1691 = _1683;
                bool _1693 = _1427 == 32;
                int _1695 = _1691;
                if (_1665)
                {
                    _1661 = _1331;
                }
                int _1697 = _1661;
                bool _1699 = _1427 == 36;
                bool _1701 = _1415 == 76;
                int _1703 = _1697;
                if (_1671)
                {
                    _1695 = _1307;
                }
                int _1705 = _1695;
                bool _1707 = _1427 == 40;
                int _1709 = _1705;
                if (_1677)
                {
                    _1709 = _1309;
                }
                int _1711 = _1709;
                bool _1713 = _1427 == 44;
                int _1715 = _1711;
                if (_1687)
                {
                    _1689 = _1329;
                }
                int _1717 = _1689;
                bool _1719 = _1423 == 72;
                int _1721 = _1717;
                if (_1693)
                {
                    _1715 = _1311;
                }
                int _1723 = _1715;
                bool _1725 = _1427 == 48;
                int _1727 = _1723;
                if (_1699)
                {
                    _1727 = _1313;
                }
                int _1729 = _1727;
                bool _1731 = _1427 == 52;
                int _1733 = _1729;
                if (_1701)
                {
                    _1703 = _1333;
                }
                int _1735 = _1703;
                bool _1737 = _1415 == 80;
                int _1739 = _1735;
                if (_1707)
                {
                    _1733 = _1315;
                }
                int _1741 = _1733;
                bool _1743 = _1427 == 56;
                int _1745 = _1741;
                if (_1713)
                {
                    _1745 = _1317;
                }
                int _1747 = _1745;
                bool _1749 = _1427 == 60;
                int _1751 = _1747;
                if (_1719)
                {
                    _1721 = _1331;
                }
                int _1753 = _1721;
                bool _1755 = _1427 == 64;
                int _1757 = _1753;
                if (_1725)
                {
                    _1751 = _1319;
                }
                int _1759 = _1751;
                bool _1761 = _1423 == 76;
                int _1763 = _1759;
                if (_1731)
                {
                    _1763 = _1321;
                }
                int _1765 = _1763;
                bool _1767 = _1415 == 84;
                int _1769 = _1765;
                if (_1737)
                {
                    _1739 = _1335;
                }
                int _1771 = _1739;
                bool _1773 = _1427 == 68;
                int _1775 = _1771;
                if (_1743)
                {
                    _1769 = _1323;
                }
                int _1777 = _1769;
                bool _1779 = _1427 == 72;
                int _1781 = _1777;
                if (_1749)
                {
                    _1781 = _1325;
                }
                int _1783 = _1781;
                bool _1785 = _1427 == 76;
                int _1787 = _1783;
                if (_1755)
                {
                    _1787 = _1327;
                }
                int _1789 = _1787;
                bool _1791 = _1479 == 0;
                int _1793 = _1789;
                if (_1761)
                {
                    _1757 = _1333;
                }
                int _1795 = _1757;
                bool _1797 = _1423 == 80;
                int _1799 = _1795;
                if (_1767)
                {
                    _1775 = _1337;
                }
                int _1801 = _1775;
                bool _1803 = _1479 == 4;
                int _1805 = _1801;
                if (_1773)
                {
                    _1793 = _1329;
                }
                int _1807 = _1793;
                bool _1809 = _1427 == 80;
                int _1811 = _1807;
                if (_1779)
                {
                    _1811 = _1331;
                }
                int _1813 = _1811;
                bool _1815 = _1479 == 8;
                int _1817 = _1813;
                if (_1785)
                {
                    _1817 = _1333;
                }
                int _1819 = _1817;
                bool _1821 = _1415 == 88;
                int _1823 = _1819;
                if (_1791)
                {
                    _1445 = _1295;
                }
                int _1825 = _1445;
                bool _1827 = _1479 == 12;
                int _1829 = _1825;
                if (_1797)
                {
                    _1799 = _1335;
                }
                int _1831 = _1799;
                bool _1833 = _1423 == 84;
                int _1835 = _1831;
                if (_1803)
                {
                    _1829 = _1297;
                }
                int _1837 = _1829;
                int _1839 = _1837;
                if (_1809)
                {
                    _1823 = _1335;
                }
                int _1841 = _1823;
                bool _1843 = _1427 == 84;
                int _1845 = _1841;
                if (_1815)
                {
                    _1839 = _1299;
                }
                int _1847 = _1839;
                bool _1849 = _1479 == 16;
                int _1851 = _1847;
                if (_1821)
                {
                    _1805 = _1339;
                }
                int _1853 = _1805;
                bool _1855 = _1415 == 92;
                bool _1857 = _1479 == 20;
                int _1859 = _1853;
                if (_1827)
                {
                    _1851 = _1301;
                }
                int _1861 = _1851;
                bool _1863 = _1423 == 88;
                int _1865 = _1861;
                if (_1833)
                {
                    _1835 = _1337;
                }
                int _1867 = _1835;
                bool _1869 = _1479 == 24;
                int _1871 = _1867;
                if (_1843)
                {
                    _1845 = _1337;
                }
                int _1873 = _1845;
                bool _1875 = _1427 == 88;
                int _1877 = _1873;
                if (_1849)
                {
                    _1865 = _1303;
                }
                int _1879 = _1865;
                bool _1881 = _1479 == 28;
                int _1883 = _1879;
                if (_1855)
                {
                    _1859 = _1341;
                }
                int _1885 = _1859;
                bool _1887 = _1479 == 32;
                int _1889 = _1885;
                if (_1857)
                {
                    _1883 = _1305;
                }
                int _1891 = _1883;
                bool _1893 = _1415 == 96;
                int _1895 = _1891;
                if (_1863)
                {
                    _1871 = _1339;
                }
                int _1897 = _1871;
                bool _1899 = _1479 == 40;
                int _1901 = _1897;
                if (_1869)
                {
                    _1895 = _1307;
                }
                int _1903 = _1895;
                bool _1905 = _1479 == 36;
                int _1907 = _1903;
                if (_1875)
                {
                    _1877 = _1339;
                }
                int _1909 = _1877;
                bool _1911 = _1423 == 92;
                int _1913 = _1909;
                if (_1881)
                {
                    _1907 = _1309;
                }
                int _1915 = _1907;
                bool _1917 = _1479 == 44;
                int _1919 = _1915;
                if (_1887)
                {
                    _1919 = _1311;
                }
                int _1921 = _1919;
                bool _1923 = _1479 == 48;
                int _1925 = _1921;
                if (_1893)
                {
                    _1889 = _1343;
                }
                int _1927 = _1889;
                bool _1929 = _1423 == 96;
                int _1931 = _1927;
                if (_1905)
                {
                    _1925 = _1313;
                }
                int _1933 = _1925;
                bool _1935 = _1479 == 52;
                int _1937 = _1933;
                if (_1899)
                {
                    _1937 = _1315;
                }
                int _1939 = _1937;
                bool _1941 = _1403 >= _1927;
                int _1943 = _1939;
                if (_1911)
                {
                    _1901 = _1341;
                }
                int _1945 = _1901;
                bool _1947 = _1479 == 56;
                int _1949 = _1945;
                if (_1917)
                {
                    _1943 = _1317;
                }
                int _1951 = _1943;
                bool _1953 = _1479 == 60;
                int _1955 = _1951;
                if (_1923)
                {
                    _1955 = _1319;
                }
                int _1957 = _1955;
                bool _1959 = _1479 == 64;
                int _1961 = _1957;
                if (_1929)
                {
                    _1949 = _1343;
                }
                int _1963 = _1949;
                bool _1965 = _1427 == 92;
                _1361 = _1963;
                if (_1935)
                {
                    _1961 = _1321;
                }
                int _1967 = _1961;
                bool _1969 = _1479 == 68;
                int _1971 = _1967;
                if (!_1941)
                {
                    _1447 = _1927;
                }
                int _1973 = _1447;
                int _1975 = _1973;
                if (_1947)
                {
                    _1971 = _1323;
                }
                int _1977 = _1971;
                bool _1979 = _1479 == 72;
                int _1981 = _1977;
                if (_1953)
                {
                    _1981 = _1325;
                }
                int _1983 = _1981;
                bool _1985 = _1973 >= _1963;
                int _1987 = _1983;
                if (_1959)
                {
                    _1987 = _1327;
                }
                int _1989 = _1987;
                int _1991 = _1989;
                if (_1965)
                {
                    _1913 = _1341;
                }
                int _1993 = _1913;
                bool _1995 = _1427 == 96;
                bool _1997 = _1479 == 76;
                int _1999 = _1993;
                if (_1969)
                {
                    _1991 = _1329;
                }
                int _2001 = _1991;
                bool _2003 = _1479 == 80;
                int _2005 = _2001;
                if (_1979)
                {
                    _2005 = _1331;
                }
                int _2007 = _2005;
                bool _2009 = _1479 == 84;
                int _2011 = _2007;
                if (_1985)
                {
                    _1931 = _1973;
                }
                int _2013 = _1931;
                int _2015 = _2013;
                if (!_1985)
                {
                    _2015 = _1963;
                }
                int _2017 = _2015;
                int _2019 = _2017;
                if (_1995)
                {
                    _1999 = _1343;
                }
                int _2021 = _1999;
                bool _2023 = _1479 == 88;
                _1363 = _2021;
                if (_1997)
                {
                    _2011 = _1333;
                }
                int _2025 = _2011;
                bool _2027 = _1479 == 92;
                int _2029 = _2025;
                if (_2003)
                {
                    _2029 = _1335;
                }
                int _2031 = _2029;
                bool _2033 = _2017 >= _2021;
                int _2035 = _2031;
                if (_1941)
                {
                    _1975 = _1411;
                }
                int _2037 = _1975;
                int _2039 = _2037;
                if (_2009)
                {
                    _2035 = _1337;
                }
                int _2041 = _2035;
                bool _2043 = _1479 == 96;
                int _2045 = _2041;
                if (!_1941)
                {
                    _2039 = _1401;
                }
                int _2047 = _2039;
                int _2049 = _1401 + 4;
                _1383 = _2049;
                int _2051 = _2047;
                _1389 = _2049;
                if (!_1985)
                {
                    _2051 = _1417;
                }
                int _2053 = _2051;
                int _2055 = _2053;
                if (_2023)
                {
                    _2045 = _1339;
                }
                int _2057 = _2045;
                bool _2059 = _2049 >= _1397;
                int _2061 = _2057;
                if (_2027)
                {
                    _2061 = _1341;
                }
                int _2063 = _2061;
                int _2065 = _2063;
                if (!_2033)
                {
                    _2019 = _2021;
                }
                int _2067 = _2019;
                _1359 = _2067;
                _1367 = _2067;
                if (!_2033)
                {
                    _2055 = _1419;
                }
                int _2069 = _2055;
                int _2071 = _2069;
                if (_2043)
                {
                    _2065 = _1343;
                }
                int _2073 = _2065;
                bool _2075 = _2067 >= _2073;
                _1365 = _2073;
                if (_2075)
                {
                    _1449 = _2069;
                }
                int _2077 = _1449;
                int _2079 = _2077;
                if (_2075)
                {
                    _2071 = _2067;
                }
                int _2081 = _2071;
                int _2083 = _2081;
                if (!_2075)
                {
                    _2079 = _1437;
                }
                int _2085 = _2079;
                _1387 = _2085;
                _1395 = _2085;
                if (!_2075)
                {
                    _2083 = _2073;
                }
                int _2087 = _2083;
                _1399 = !_2059;
                _1385 = _2087;
                _1391 = _2087;
            } while (_1399);
        }
        int _2089 = _1389;
        int _2091 = _1391;
        int _2093 = _1367;
        int _2095 = _1393;
        int _2097 = _1395;
        int _2099 = -_2089;
        int _2101 = _1345 + _2099;
        bool _2103 = _2101 > 1;
        bool _2105 = !_2103;
        int _2107 = _2093;
        int _2109 = _2101;
        int _2111 = _2091;
        int _2113 = _2097;
        int _2115 = _2089;
        int _2117 = _2095;
        int _2119 = _2091;
        int _2121 = _2097;
        if (!_2105)
        {
            int _2123 = _2089 * 4;
            int _2125 = _2089 + 1;
            bool _2127 = _2123 == 0;
            int _2129 = _2125 * 4;
            bool _2131 = _2123 == 4;
            bool _2133 = _2123 == 8;
            bool _2135 = _2123 == 12;
            bool _2137 = _2123 == 24;
            bool _2139 = _2129 == 0;
            bool _2141 = _2123 == 40;
            if (_2127)
            {
                _2107 = _1295;
            }
            int _2143 = _2107;
            bool _2145 = _2123 == 16;
            int _2147 = _2143;
            if (_2131)
            {
                _2147 = _1297;
            }
            int _2149 = _2147;
            bool _2151 = _2123 == 20;
            int _2153 = _2149;
            if (_2133)
            {
                _2153 = _1299;
            }
            int _2155 = _2153;
            bool _2157 = _2123 == 36;
            int _2159 = _2155;
            if (_2135)
            {
                _2159 = _1301;
            }
            int _2161 = _2159;
            bool _2163 = _2123 == 28;
            int _2165 = _2161;
            if (_2139)
            {
                _2109 = _1295;
            }
            int _2167 = _2109;
            bool _2169 = _2129 == 16;
            int _2171 = _2167;
            if (_2145)
            {
                _2165 = _1303;
            }
            int _2173 = _2165;
            bool _2175 = _2123 == 32;
            int _2177 = _2173;
            if (_2151)
            {
                _2177 = _1305;
            }
            int _2179 = _2177;
            bool _2181 = _2123 == 48;
            int _2183 = _2179;
            if (_2137)
            {
                _2183 = _1307;
            }
            int _2185 = _2183;
            bool _2187 = _2129 == 4;
            int _2189 = _2185;
            if (_2163)
            {
                _2189 = _1309;
            }
            int _2191 = _2189;
            bool _2193 = _2123 == 44;
            int _2195 = _2191;
            if (_2175)
            {
                _2195 = _1311;
            }
            int _2197 = _2195;
            bool _2199 = _2129 == 8;
            int _2201 = _2197;
            if (_2157)
            {
                _2201 = _1313;
            }
            int _2203 = _2201;
            bool _2205 = _2129 == 12;
            int _2207 = _2203;
            if (_2187)
            {
                _2171 = _1297;
            }
            int _2209 = _2171;
            bool _2211 = _2123 == 52;
            int _2213 = _2209;
            if (_2141)
            {
                _2207 = _1315;
            }
            int _2215 = _2207;
            bool _2217 = _2129 == 20;
            int _2219 = _2215;
            if (_2193)
            {
                _2219 = _1317;
            }
            int _2221 = _2219;
            bool _2223 = _2129 == 24;
            int _2225 = _2221;
            if (_2181)
            {
                _2225 = _1319;
            }
            int _2227 = _2225;
            bool _2229 = _2123 == 60;
            int _2231 = _2227;
            if (_2199)
            {
                _2213 = _1299;
            }
            int _2233 = _2213;
            bool _2235 = _2123 == 56;
            int _2237 = _2233;
            if (_2205)
            {
                _2237 = _1301;
            }
            int _2239 = _2237;
            bool _2241 = _2129 == 28;
            int _2243 = _2239;
            if (_2169)
            {
                _2243 = _1303;
            }
            int _2245 = _2243;
            bool _2247 = _2129 == 32;
            int _2249 = _2245;
            if (_2217)
            {
                _2249 = _1305;
            }
            int _2251 = _2249;
            bool _2253 = _2129 == 36;
            int _2255 = _2251;
            if (_2211)
            {
                _2231 = _1321;
            }
            int _2257 = _2231;
            bool _2259 = _2123 == 64;
            int _2261 = _2257;
            if (_2223)
            {
                _2255 = _1307;
            }
            int _2263 = _2255;
            bool _2265 = _2123 == 68;
            int _2267 = _2263;
            if (_2235)
            {
                _2261 = _1323;
            }
            int _2269 = _2261;
            bool _2271 = _2129 == 40;
            int _2273 = _2269;
            if (_2241)
            {
                _2267 = _1309;
            }
            int _2275 = _2267;
            bool _2277 = _2123 == 72;
            int _2279 = _2275;
            if (_2229)
            {
                _2273 = _1325;
            }
            int _2281 = _2273;
            bool _2283 = _2129 == 44;
            int _2285 = _2281;
            if (_2247)
            {
                _2279 = _1311;
            }
            int _2287 = _2279;
            bool _2289 = _2129 == 48;
            int _2291 = _2287;
            if (_2253)
            {
                _2291 = _1313;
            }
            int _2293 = _2291;
            bool _2295 = _2123 == 76;
            int _2297 = _2293;
            if (_2259)
            {
                _2285 = _1327;
            }
            int _2299 = _2285;
            bool _2301 = _2129 == 52;
            int _2303 = _2299;
            if (_2265)
            {
                _2303 = _1329;
            }
            int _2305 = _2303;
            bool _2307 = _2123 == 80;
            int _2309 = _2305;
            if (_2271)
            {
                _2297 = _1315;
            }
            int _2311 = _2297;
            bool _2313 = _2129 == 56;
            int _2315 = _2311;
            if (_2277)
            {
                _2309 = _1331;
            }
            int _2317 = _2309;
            int _2319 = _2317;
            if (_2283)
            {
                _2315 = _1317;
            }
            int _2321 = _2315;
            bool _2323 = _2123 == 84;
            int _2325 = _2321;
            if (_2289)
            {
                _2325 = _1319;
            }
            int _2327 = _2325;
            bool _2329 = _2129 == 60;
            int _2331 = _2327;
            if (_2295)
            {
                _2319 = _1333;
            }
            int _2333 = _2319;
            bool _2335 = _2123 == 88;
            int _2337 = _2333;
            if (_2301)
            {
                _2331 = _1321;
            }
            int _2339 = _2331;
            bool _2341 = _2129 == 64;
            int _2343 = _2339;
            if (_2307)
            {
                _2337 = _1335;
            }
            int _2345 = _2337;
            bool _2347 = _2123 == 92;
            int _2349 = _2345;
            if (_2313)
            {
                _2343 = _1323;
            }
            int _2351 = _2343;
            bool _2353 = _2129 == 68;
            bool _2355 = _2129 == 72;
            int _2357 = _2351;
            if (_2323)
            {
                _2349 = _1337;
            }
            int _2359 = _2349;
            bool _2361 = _2123 == 96;
            int _2363 = _2359;
            if (_2329)
            {
                _2357 = _1325;
            }
            int _2365 = _2357;
            bool _2367 = _2129 == 76;
            int _2369 = _2365;
            if (_2335)
            {
                _2363 = _1339;
            }
            int _2371 = _2363;
            int _2373 = _2371;
            if (_2341)
            {
                _2369 = _1327;
            }
            int _2375 = _2369;
            bool _2377 = _2129 == 80;
            int _2379 = _2375;
            if (_2347)
            {
                _2373 = _1341;
            }
            int _2381 = _2373;
            bool _2383 = _2129 == 96;
            int _2385 = _2381;
            if (_2353)
            {
                _2379 = _1329;
            }
            int _2387 = _2379;
            bool _2389 = _2129 == 84;
            int _2391 = _2387;
            if (_2355)
            {
                _2391 = _1331;
            }
            int _2393 = _2391;
            bool _2395 = _2129 == 88;
            int _2397 = _2393;
            if (_2361)
            {
                _2385 = _1343;
            }
            int _2399 = _2385;
            bool _2401 = _2129 == 92;
            if (_2367)
            {
                _2397 = _1333;
            }
            int _2403 = _2397;
            bool _2405 = _2091 >= _2399;
            int _2407 = _2403;
            if (_2377)
            {
                _2407 = _1335;
            }
            int _2409 = _2407;
            int _2411 = _2409;
            if (_2389)
            {
                _2411 = _1337;
            }
            int _2413 = _2411;
            int _2415 = _2413;
            if (_2395)
            {
                _2415 = _1339;
            }
            int _2417 = _2415;
            int _2419 = _2417;
            _2117 = 0;
            if (_2401)
            {
                _2419 = _1341;
            }
            int _2421 = _2419;
            int _2423 = _2421;
            if (_2383)
            {
                _2423 = _1343;
            }
            int _2425 = _2423;
            if (!_2405)
            {
                _2111 = _2399;
            }
            int _2427 = _2111;
            _2119 = _2427;
            if (!_2405)
            {
                _2113 = _2089;
            }
            int _2429 = _2113;
            int _2431 = _2125 + 1;
            bool _2433 = _2427 >= _2425;
            int _2435 = _2429;
            _2115 = _2431;
            if (!_2433)
            {
                _2435 = _2125;
            }
            int _2437 = _2435;
            _2121 = _2437;
            if (!_2433)
            {
                _2119 = _2425;
            }
        }
        int _2439 = _2115;
        int _2441 = _2117;
        int _2443 = _2119;
        int _2445 = _2121;
        bool _2447 = _2439 < _1345;
        int _2449 = (_2447 ? (-1) : 0) | _2441;
        int _2451 = ~_2449;
        int _2453 = _2445;
        if (!(_2451 != 0))
        {
            int _2455 = _2439 * 4;
            bool _2457 = _2455 == 4;
            bool _2459 = _2455 == 8;
            bool _2461 = _2455 == 12;
            bool _2463 = _2455 == 16;
            if (_2457)
            {
                _1369 = _1297;
            }
            int _2465 = _1369;
            bool _2467 = _2455 == 20;
            int _2469 = _2465;
            if (_2459)
            {
                _2469 = _1299;
            }
            int _2471 = _2469;
            bool _2473 = _2455 == 24;
            int _2475 = _2471;
            if (_2461)
            {
                _2475 = _1301;
            }
            int _2477 = _2475;
            bool _2479 = _2455 == 28;
            int _2481 = _2477;
            if (_2463)
            {
                _2481 = _1303;
            }
            int _2483 = _2481;
            bool _2485 = _2455 == 32;
            int _2487 = _2483;
            if (_2467)
            {
                _2487 = _1305;
            }
            int _2489 = _2487;
            bool _2491 = _2455 == 36;
            int _2493 = _2489;
            if (_2473)
            {
                _2493 = _1307;
            }
            int _2495 = _2493;
            bool _2497 = _2455 == 40;
            int _2499 = _2495;
            if (_2479)
            {
                _2499 = _1309;
            }
            int _2501 = _2499;
            bool _2503 = _2455 == 44;
            int _2505 = _2501;
            if (_2485)
            {
                _2505 = _1311;
            }
            int _2507 = _2505;
            bool _2509 = _2455 == 48;
            int _2511 = _2507;
            if (_2491)
            {
                _2511 = _1313;
            }
            int _2513 = _2511;
            bool _2515 = _2455 == 52;
            int _2517 = _2513;
            if (_2497)
            {
                _2517 = _1315;
            }
            int _2519 = _2517;
            bool _2521 = _2455 == 56;
            int _2523 = _2519;
            if (_2503)
            {
                _2523 = _1317;
            }
            int _2525 = _2523;
            bool _2527 = _2455 == 60;
            int _2529 = _2525;
            if (_2509)
            {
                _2529 = _1319;
            }
            int _2531 = _2529;
            bool _2533 = _2455 == 64;
            int _2535 = _2531;
            if (_2515)
            {
                _2535 = _1321;
            }
            int _2537 = _2535;
            bool _2539 = _2455 == 68;
            int _2541 = _2537;
            if (_2521)
            {
                _2541 = _1323;
            }
            int _2543 = _2541;
            bool _2545 = _2455 == 72;
            int _2547 = _2543;
            if (_2527)
            {
                _2547 = _1325;
            }
            int _2549 = _2547;
            bool _2551 = _2455 == 76;
            int _2553 = _2549;
            if (_2533)
            {
                _2553 = _1327;
            }
            int _2555 = _2553;
            bool _2557 = _2455 == 80;
            int _2559 = _2555;
            if (_2539)
            {
                _2559 = _1329;
            }
            int _2561 = _2559;
            bool _2563 = _2455 == 84;
            int _2565 = _2561;
            if (_2545)
            {
                _2565 = _1331;
            }
            int _2567 = _2565;
            bool _2569 = _2455 == 88;
            int _2571 = _2567;
            if (_2551)
            {
                _2571 = _1333;
            }
            int _2573 = _2571;
            bool _2575 = _2455 == 92;
            int _2577 = _2573;
            if (_2557)
            {
                _2577 = _1335;
            }
            int _2579 = _2577;
            bool _2581 = _2455 == 96;
            int _2583 = _2579;
            if (_2563)
            {
                _2583 = _1337;
            }
            int _2585 = _2583;
            int _2587 = _2585;
            if (_2569)
            {
                _2587 = _1339;
            }
            int _2589 = _2587;
            int _2591 = _2589;
            if (_2575)
            {
                _2591 = _1341;
            }
            int _2593 = _2591;
            int _2595 = _2593;
            if (_2581)
            {
                _2595 = _1343;
            }
            int _2597 = _2595;
            bool _2599 = _2443 >= _2597;
            if (!_2599)
            {
                _2453 = _2439;
            }
        }
        int _2601 = _2453;
        _1377 = _2601;
    }
    int _2603 = _1377;
    int _2605 = _2603 * 8;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    float _2609 = as_type<float>(_31[int(_2607)]);
    int _2611 = _2605 + 4;
    uint _2613 = uint(int(uint(_2611) >> uint(2)));
    float _2615 = as_type<float>(_31[int(_2613)]);
    int _2617 = _72 + 16;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2619)] = as_type<uint>(_2609);
    int _2621 = _2617 + 4;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2623)] = as_type<uint>(_2615);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _873 = false;
    bool _697 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _2646 = float3((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float4 _58 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2646, float3(0.0), isnan(_2646)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2646, float3(0.0), isnan(_2646)), level(0.0)).xyzw;
    float _61 = _58.x;
    float _63 = _58.y;
    float _65 = _58.z;
    float _67 = _58.w;
    float _69 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _72 = as_type<int>(_69) * 32;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_75)] = as_type<uint>(_61);
    int _77 = _72 + 4;
    uint _79 = uint(int(uint(_77) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_79)] = as_type<uint>(_63);
    int _81 = _72 + 8;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_83)] = as_type<uint>(_65);
    int _85 = _72 + 12;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_87)] = as_type<uint>(_67);
    int _89 = -2;
    int _91 = 0;
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
    bool _145;
    bool _283;
    int _661;
    int _663;
    int _665;
    bool _673;
    int _675;
    int _729;
    int _731;
    int _737;
    int _743;
    int _749;
    int _755;
    int _761;
    int _767;
    int _773;
    int _779;
    int _785;
    int _791;
    int _797;
    int _803;
    int _809;
    int _815;
    bool _819;
    int _821;
    int _825;
    int _831;
    int _837;
    int _843;
    int _849;
    int _853;
    int _857;
    int _861;
    int _865;
    int _869;
    int _871;
    int _1231;
    int _1295;
    int _1297;
    int _1299;
    int _1301;
    int _1303;
    int _1305;
    int _1307;
    int _1309;
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
    int _1359;
    int _1361;
    int _1363;
    int _1365;
    int _1367;
    int _1369;
    do
    {
        int _147 = _89;
        int _149 = _91;
        int _151 = _93;
        int _153 = _95;
        int _155 = _97;
        int _157 = _99;
        int _159 = _101;
        int _161 = _103;
        int _163 = _105;
        int _165 = _107;
        int _167 = _109;
        int _169 = _111;
        int _171 = _113;
        int _173 = _115;
        int _175 = _117;
        int _177 = _119;
        int _179 = _121;
        int _181 = _123;
        int _183 = _125;
        int _185 = _127;
        int _187 = _129;
        int _189 = _131;
        int _191 = _133;
        int _193 = _135;
        int _195 = _137;
        int _197 = _139;
        int _199 = _141;
        float _201 = float(_147);
        float _203 = _201 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _205 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _207 = fma(_203, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2765 = float2(_205, _207);
        float4 _209 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2765, float2(0.0), isnan(_2765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2765, float2(0.0), isnan(_2765)), level(0.0)).xyzw;
        float _211 = _209.x;
        float _213 = _209.y;
        float _215 = _209.z;
        float _217 = _209.w;
        int _219 = -2;
        float _221 = _217;
        float _223 = _213;
        float _225 = _215;
        float _227 = _211;
        int _229 = _149;
        int _231 = _151;
        int _233 = _153;
        int _235 = _155;
        int _237 = _157;
        int _239 = _159;
        int _241 = _161;
        int _243 = _163;
        int _245 = _165;
        int _247 = _167;
        int _249 = _169;
        int _251 = _171;
        int _253 = _173;
        int _255 = _175;
        int _257 = _177;
        int _259 = _179;
        int _261 = _181;
        int _263 = _183;
        int _265 = _185;
        int _267 = _187;
        int _269 = _189;
        int _271 = _191;
        int _273 = _193;
        int _275 = _195;
        int _277 = _197;
        int _279 = _199;
        int _281 = -2;
        do
        {
            int _285 = _219;
            float _287 = _221;
            float _289 = _223;
            float _291 = _225;
            float _293 = _227;
            int _295 = _229;
            int _297 = _231;
            int _299 = _233;
            int _301 = _235;
            int _303 = _237;
            int _305 = _239;
            int _307 = _241;
            int _309 = _243;
            int _311 = _245;
            int _313 = _247;
            int _315 = _249;
            int _317 = _251;
            int _319 = _253;
            int _321 = _255;
            int _323 = _257;
            int _325 = _259;
            int _327 = _261;
            int _329 = _263;
            int _331 = _265;
            int _333 = _267;
            int _335 = _269;
            int _337 = _271;
            int _339 = _273;
            int _341 = _275;
            int _343 = _277;
            int _345 = _279;
            int _347 = _281;
            int _349 = _285 + 1;
            float _351 = float(_147);
            float _353 = float(_349);
            float _355 = _351 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _357 = _353 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _359 = 0.0 + _287;
            float _361 = precise::clamp(_359, 0.0, 1.0);
            float _363 = fma(_355, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _365 = 0.0 + _289;
            float _367 = precise::clamp(_365, 0.0, 1.0);
            float _369 = fma(_357, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _371 = 0.0 + _291;
            float _373 = precise::clamp(_371, 0.0, 1.0);
            float _375 = 0.0 + _293;
            float _377 = precise::clamp(_375, 0.0, 1.0);
            float2 _2885 = float2(_369, _363);
            float4 _379 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2885, float2(0.0), isnan(_2885)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2885, float2(0.0), isnan(_2885)), level(0.0)).xyzw;
            float _381 = _379.x;
            float _383 = _379.y;
            float _385 = _379.z;
            float _387 = _379.w;
            float _389 = _361 * 65535.0;
            float _391 = _373 * 65535.0;
            float _393 = _367 * 65535.0;
            float _395 = _377 * 65535.0;
            float _397 = rint(_389);
            int _399 = int(_397);
            float _401 = rint(_391);
            int _403 = int(_401);
            float _405 = rint(_393);
            int _407 = int(_405);
            uint _409 = extract_bits(uint(_399), 0u, 8u);
            int _411 = int(_409) & 255;
            uint _413 = extract_bits(uint(_399), 8u, 8u);
            int _415 = int(_413) & 255;
            int _417 = _415 << 8;
            int _419 = _411 | _417;
            float _421 = rint(_395);
            int _423 = int(_421);
            uint _425 = extract_bits(uint(_419), 0u, 8u);
            int _427 = int(_425) & 255;
            uint _429 = extract_bits(uint(_419), 8u, 8u);
            int _431 = int(_429) & 255;
            int _433 = _431 << 8;
            int _435 = _427 | _433;
            uint _437 = extract_bits(uint(_403), 0u, 8u);
            int _439 = int(_437) & 255;
            int _441 = _439 << 16;
            int _443 = _435 | _441;
            uint _445 = extract_bits(uint(_403), 8u, 8u);
            int _447 = int(_445) & 255;
            int _449 = _447 << 24;
            int _451 = _443 | _449;
            bool _453 = _451 != 0;
            uint _455 = extract_bits(uint(_407), 0u, 8u);
            int _457 = int(_455) & 255;
            uint _459 = extract_bits(uint(_407), 8u, 8u);
            int _461 = int(_459) & 255;
            int _463 = _461 << 8;
            int _465 = _457 | _463;
            uint _467 = extract_bits(uint(_465), 0u, 8u);
            int _469 = int(_467) & 255;
            uint _471 = extract_bits(uint(_465), 8u, 8u);
            int _473 = int(_471) & 255;
            int _475 = _473 << 8;
            int _477 = _469 | _475;
            uint _479 = extract_bits(uint(_423), 0u, 8u);
            int _481 = int(_479) & 255;
            int _483 = _481 << 16;
            int _485 = _477 | _483;
            uint _487 = extract_bits(uint(_423), 8u, 8u);
            int _489 = int(_487) & 255;
            int _491 = _489 << 24;
            int _493 = _485 | _491;
            bool _495 = _493 != 0;
            bool _497 = _495 || _453;
            bool _499 = !_497;
            _219 = _349;
            _221 = _387;
            _223 = _383;
            _225 = _385;
            _227 = _381;
            int _501 = _305;
            int _503 = _297;
            int _505 = _299;
            int _507 = _301;
            int _509 = _303;
            int _511 = _307;
            int _513 = _309;
            int _515 = _319;
            int _517 = _311;
            int _519 = _313;
            int _521 = _315;
            int _523 = _317;
            int _525 = _321;
            int _527 = _323;
            int _529 = _333;
            int _531 = _325;
            int _533 = _327;
            int _535 = _329;
            int _537 = _331;
            int _539 = _335;
            int _541 = _337;
            int _543 = _339;
            int _545 = _341;
            int _547 = _343;
            int _549 = _345;
            int _551 = _451;
            int _553 = _297;
            int _555 = _299;
            int _557 = _301;
            int _559 = _303;
            int _561 = _341;
            int _563 = _343;
            int _565 = _345;
            int _567 = _305;
            int _569 = _307;
            int _571 = _309;
            int _573 = _311;
            int _575 = _313;
            int _577 = _315;
            int _579 = _317;
            int _581 = _319;
            int _583 = _321;
            int _585 = _323;
            int _587 = _325;
            int _589 = _327;
            int _591 = _329;
            int _593 = _331;
            int _595 = _339;
            int _597 = _337;
            int _599 = _335;
            int _601 = _295;
            int _603 = _297;
            int _605 = _299;
            int _607 = _301;
            int _609 = _303;
            int _611 = _305;
            int _613 = _307;
            int _615 = _309;
            int _617 = _311;
            int _619 = _313;
            int _621 = _315;
            int _623 = _317;
            int _625 = _319;
            int _627 = _321;
            int _629 = _323;
            int _631 = _325;
            int _633 = _327;
            int _635 = _329;
            int _637 = _331;
            int _639 = _333;
            int _641 = _335;
            int _643 = _337;
            int _645 = _339;
            int _647 = _341;
            int _649 = _343;
            int _651 = _345;
            int _653 = _493;
            int _655 = _423;
            int _657 = _451;
            int _659 = _419;
            _661 = _493;
            _663 = _451;
            _665 = as_type<int>(_385);
            if (!_499)
            {
                bool _667 = _295 > 0;
                bool _669 = !_667;
                if (!_669)
                {
                    int _671 = 0;
                    do
                    {
                        _675 = _671;
                        int _677 = _675 * 8;
                        uint _679 = uint(int(uint(_677) >> uint(2)));
                        float _681 = as_type<float>(_31[int(_679)]);
                        int _683 = _677 + 4;
                        uint _685 = uint(int(uint(_683) >> uint(2)));
                        float _687 = as_type<float>(_31[int(_685)]);
                        bool _689 = as_type<int>(_681) != _451;
                        bool _691 = as_type<int>(_687) != _493;
                        bool _693 = _691 || _689;
                        bool _695 = !_693;
                        _697 = _695;
                        if (_697)
                        {
                            break;
                        }
                        int _699 = _675 + 1;
                        bool _701 = _699 >= _295;
                        _673 = !_701;
                        _671 = _699;
                    } while (_673);
                }
                if (!_697)
                {
                    int _703 = _295 * 4;
                    int _705 = _295 * 8;
                    int _707 = _295 + 1;
                    bool _709 = _703 == 16;
                    bool _711 = _703 == 0;
                    uint _713 = uint(int(uint(_705) >> uint(2)));
                    _31[int(_713)] = uint(_451);
                    int _715 = _705 + 4;
                    uint _717 = uint(int(uint(_715) >> uint(2)));
                    _31[int(_717)] = uint(_493);
                    bool _719 = _703 == 4;
                    bool _721 = _703 == 8;
                    bool _723 = _703 == 12;
                    bool _725 = _703 == 20;
                    bool _727 = _703 == 24;
                    _601 = _707;
                    _655 = _705;
                    _659 = _703;
                    _729 = _705;
                    _731 = _703;
                    if (_709)
                    {
                        _501 = 1;
                    }
                    int _733 = _501;
                    bool _735 = _703 == 44;
                    _611 = _733;
                    _737 = _733;
                    if (_711)
                    {
                        _503 = 1;
                    }
                    int _739 = _503;
                    bool _741 = _703 == 28;
                    _603 = _739;
                    _743 = _739;
                    if (_719)
                    {
                        _505 = 1;
                    }
                    int _745 = _505;
                    bool _747 = _703 == 32;
                    _605 = _745;
                    _749 = _745;
                    if (_721)
                    {
                        _507 = 1;
                    }
                    int _751 = _507;
                    bool _753 = _703 == 36;
                    _607 = _751;
                    _755 = _751;
                    if (_723)
                    {
                        _509 = 1;
                    }
                    int _757 = _509;
                    bool _759 = _703 == 40;
                    _609 = _757;
                    _761 = _757;
                    if (_725)
                    {
                        _511 = 1;
                    }
                    int _763 = _511;
                    bool _765 = _703 == 48;
                    _613 = _763;
                    _767 = _763;
                    if (_727)
                    {
                        _513 = 1;
                    }
                    int _769 = _513;
                    bool _771 = _703 == 52;
                    _615 = _769;
                    _773 = _769;
                    if (_735)
                    {
                        _515 = 1;
                    }
                    int _775 = _515;
                    bool _777 = _703 == 72;
                    _625 = _775;
                    _779 = _775;
                    if (_741)
                    {
                        _517 = 1;
                    }
                    int _781 = _517;
                    bool _783 = _703 == 56;
                    _617 = _781;
                    _785 = _781;
                    if (_747)
                    {
                        _519 = 1;
                    }
                    int _787 = _519;
                    bool _789 = _703 == 60;
                    _619 = _787;
                    _791 = _787;
                    if (_753)
                    {
                        _521 = 1;
                    }
                    int _793 = _521;
                    bool _795 = _703 == 64;
                    _621 = _793;
                    _797 = _793;
                    if (_759)
                    {
                        _523 = 1;
                    }
                    int _799 = _523;
                    bool _801 = _703 == 68;
                    _623 = _799;
                    _803 = _799;
                    if (_765)
                    {
                        _525 = 1;
                    }
                    int _805 = _525;
                    bool _807 = _703 == 76;
                    _627 = _805;
                    _809 = _805;
                    if (_771)
                    {
                        _527 = 1;
                    }
                    int _811 = _527;
                    bool _813 = _703 == 80;
                    _629 = _811;
                    _815 = _811;
                    if (_777)
                    {
                        _529 = 1;
                    }
                    int _817 = _529;
                    _819 = _707 != 25;
                    _639 = _817;
                    _821 = _817;
                    if (_783)
                    {
                        _531 = 1;
                    }
                    int _823 = _531;
                    _631 = _823;
                    _825 = _823;
                    if (_789)
                    {
                        _533 = 1;
                    }
                    int _827 = _533;
                    bool _829 = _703 == 84;
                    _633 = _827;
                    _831 = _827;
                    if (_795)
                    {
                        _535 = 1;
                    }
                    int _833 = _535;
                    bool _835 = _703 == 88;
                    _635 = _833;
                    _837 = _833;
                    if (_801)
                    {
                        _537 = 1;
                    }
                    int _839 = _537;
                    bool _841 = _703 == 92;
                    _637 = _839;
                    _843 = _839;
                    if (_807)
                    {
                        _539 = 1;
                    }
                    int _845 = _539;
                    bool _847 = _703 == 96;
                    _641 = _845;
                    _849 = _845;
                    if (_813)
                    {
                        _541 = 1;
                    }
                    int _851 = _541;
                    _643 = _851;
                    _853 = _851;
                    if (_829)
                    {
                        _543 = 1;
                    }
                    int _855 = _543;
                    _645 = _855;
                    _857 = _855;
                    if (_835)
                    {
                        _545 = 1;
                    }
                    int _859 = _545;
                    _647 = _859;
                    _861 = _859;
                    if (_841)
                    {
                        _547 = 1;
                    }
                    int _863 = _547;
                    _649 = _863;
                    _865 = _863;
                    if (_847)
                    {
                        _549 = 1;
                    }
                    int _867 = _549;
                    _651 = _867;
                    _869 = _867;
                }
                if ((!_819) || _697)
                {
                    if (!_697)
                    {
                        _871 = 25;
                        _873 = true;
                        if (_873)
                        {
                            break;
                        }
                    }
                    _697 = false;
                    int _875 = _675 * 4;
                    bool _877 = _875 == 0;
                    bool _879 = _875 == 4;
                    bool _881 = _875 == 8;
                    bool _883 = _875 == 12;
                    bool _885 = _875 == 88;
                    bool _887 = _875 == 92;
                    bool _889 = _875 == 96;
                    if (_877)
                    {
                        _551 = _297;
                    }
                    int _891 = _551;
                    bool _893 = _875 == 16;
                    int _895 = _891;
                    if (_879)
                    {
                        _895 = _299;
                    }
                    int _897 = _895;
                    bool _899 = _875 == 20;
                    int _901 = _897;
                    if (_881)
                    {
                        _901 = _301;
                    }
                    int _903 = _901;
                    bool _905 = _875 == 24;
                    int _907 = _903;
                    if (_883)
                    {
                        _907 = _303;
                    }
                    int _909 = _907;
                    bool _911 = _875 == 84;
                    int _913 = int(_905);
                    int _915 = _899 ? 2 : 0;
                    int _917 = _913 | _915;
                    int _919 = _893 ? 4 : 0;
                    int _921 = _917 | _919;
                    int _923 = _911 ? 8 : 0;
                    int _925 = _921 | _923;
                    int _927 = _885 ? 16 : 0;
                    int _929 = _925 | _927;
                    int _931 = _887 ? 32 : 0;
                    int _933 = _929 | _931;
                    int _935 = _889 ? 64 : 0;
                    int _937 = _933 | _935;
                    int _939 = _937 & 8;
                    int _941 = _909;
                    _653 = _939;
                    if (_893)
                    {
                        _941 = _305;
                    }
                    int _943 = _941;
                    bool _945 = _875 == 80;
                    int _947 = _943;
                    if (_899)
                    {
                        _947 = _307;
                    }
                    int _949 = _947;
                    bool _951 = _875 == 76;
                    int _953 = _949;
                    if (_905)
                    {
                        _953 = _309;
                    }
                    int _955 = _953;
                    bool _957 = _875 == 28;
                    int _959 = int(_957);
                    int _961 = _951 ? 2 : 0;
                    int _963 = _959 | _961;
                    int _965 = _945 ? 4 : 0;
                    int _967 = _963 | _965;
                    int _969 = _911 ? 8 : 0;
                    int _971 = _967 | _969;
                    int _973 = _885 ? 16 : 0;
                    int _975 = _971 | _973;
                    int _977 = _887 ? 32 : 0;
                    int _979 = _975 | _977;
                    int _981 = _889 ? 64 : 0;
                    int _983 = _979 | _981;
                    int _985 = _983 & 2;
                    int _987 = int(_957);
                    int _989 = _951 ? 2 : 0;
                    int _991 = _987 | _989;
                    int _993 = _945 ? 4 : 0;
                    int _995 = _991 | _993;
                    int _997 = _911 ? 8 : 0;
                    int _999 = _995 | _997;
                    int _1001 = _885 ? 16 : 0;
                    int _1003 = _999 | _1001;
                    int _1005 = _887 ? 32 : 0;
                    int _1007 = _1003 | _1005;
                    int _1009 = _889 ? 64 : 0;
                    int _1011 = _1007 | _1009;
                    int _1013 = _1011 & 4;
                    int _1015 = _955;
                    _655 = _985;
                    _659 = _1013;
                    if (_957)
                    {
                        _1015 = _311;
                    }
                    int _1017 = _1015;
                    bool _1019 = _875 == 32;
                    int _1021 = _1017;
                    if (_1019)
                    {
                        _1021 = _313;
                    }
                    int _1023 = _1021;
                    bool _1025 = _875 == 36;
                    int _1027 = _1023;
                    if (_1025)
                    {
                        _1027 = _315;
                    }
                    int _1029 = _1027;
                    bool _1031 = _875 == 40;
                    int _1033 = _1029;
                    if (_1031)
                    {
                        _1033 = _317;
                    }
                    int _1035 = _1033;
                    bool _1037 = _875 == 44;
                    int _1039 = _1035;
                    if (_1037)
                    {
                        _1039 = _319;
                    }
                    int _1041 = _1039;
                    bool _1043 = _875 == 48;
                    int _1045 = _1041;
                    if (_1043)
                    {
                        _1045 = _321;
                    }
                    int _1047 = _1045;
                    bool _1049 = _875 == 52;
                    int _1051 = _1047;
                    if (_1049)
                    {
                        _1051 = _323;
                    }
                    int _1053 = _1051;
                    bool _1055 = _875 == 56;
                    int _1057 = _1053;
                    if (_1055)
                    {
                        _1057 = _325;
                    }
                    int _1059 = _1057;
                    bool _1061 = _875 == 60;
                    int _1063 = _1059;
                    if (_1061)
                    {
                        _1063 = _327;
                    }
                    int _1065 = _1063;
                    bool _1067 = _875 == 64;
                    int _1069 = _1065;
                    if (_1067)
                    {
                        _1069 = _329;
                    }
                    int _1071 = _1069;
                    bool _1073 = _875 == 68;
                    int _1075 = _1071;
                    if (_1073)
                    {
                        _1075 = _331;
                    }
                    int _1077 = _1075;
                    bool _1079 = _875 == 72;
                    int _1081 = int(_1079);
                    int _1083 = _951 ? 2 : 0;
                    int _1085 = _1081 | _1083;
                    int _1087 = _945 ? 4 : 0;
                    int _1089 = _1085 | _1087;
                    int _1091 = _911 ? 8 : 0;
                    int _1093 = _1089 | _1091;
                    int _1095 = _885 ? 16 : 0;
                    int _1097 = _1093 | _1095;
                    int _1099 = _887 ? 32 : 0;
                    int _1101 = _1097 | _1099;
                    int _1103 = _889 ? 64 : 0;
                    int _1105 = _1101 | _1103;
                    int _1107 = _1105 & 1;
                    int _1109 = _1077;
                    if (_1079)
                    {
                        _1109 = _333;
                    }
                    int _1111 = _1109;
                    bool _1113 = _875 == 4;
                    int _1115 = _1111;
                    if (_951)
                    {
                        _1115 = _335;
                    }
                    int _1117 = _1115;
                    bool _1119 = _875 == 0;
                    int _1121 = _1117;
                    if (_945)
                    {
                        _1121 = _337;
                    }
                    int _1123 = _1121;
                    bool _1125 = _875 == 12;
                    int _1127 = _1123;
                    if (_911)
                    {
                        _1127 = _339;
                    }
                    int _1129 = _1127;
                    bool _1131 = _875 == 8;
                    int _1133 = _1129;
                    if (_885)
                    {
                        _1133 = _341;
                    }
                    int _1135 = _1133;
                    int _1137 = _1135;
                    if (_887)
                    {
                        _1137 = _343;
                    }
                    int _1139 = _1137;
                    int _1141 = _1139;
                    if (_889)
                    {
                        _1141 = _345;
                    }
                    int _1143 = _1141;
                    int _1145 = _1143 + 1;
                    _657 = _1145;
                    if (_1119)
                    {
                        _553 = _1145;
                    }
                    int _1147 = _553;
                    bool _1149 = _875 == 16;
                    _603 = _1147;
                    if (_1113)
                    {
                        _555 = _1145;
                    }
                    int _1151 = _555;
                    bool _1153 = _875 == 20;
                    _605 = _1151;
                    if (_1131)
                    {
                        _557 = _1145;
                    }
                    int _1155 = _557;
                    bool _1157 = _875 == 24;
                    _607 = _1155;
                    if (_1125)
                    {
                        _559 = _1145;
                    }
                    int _1159 = _559;
                    bool _1161 = _875 == 28;
                    _609 = _1159;
                    if (_885)
                    {
                        _561 = _1145;
                    }
                    int _1163 = _561;
                    _647 = _1163;
                    if (_887)
                    {
                        _563 = _1145;
                    }
                    int _1165 = _563;
                    _649 = _1165;
                    if (_889)
                    {
                        _565 = _1145;
                    }
                    int _1167 = _565;
                    _651 = _1167;
                    if (_1149)
                    {
                        _567 = _1145;
                    }
                    int _1169 = _567;
                    bool _1171 = _875 == 32;
                    _611 = _1169;
                    if (_1153)
                    {
                        _569 = _1145;
                    }
                    int _1173 = _569;
                    bool _1175 = _875 == 36;
                    _613 = _1173;
                    if (_1157)
                    {
                        _571 = _1145;
                    }
                    int _1177 = _571;
                    bool _1179 = _875 == 40;
                    _615 = _1177;
                    if (_1161)
                    {
                        _573 = _1145;
                    }
                    int _1181 = _573;
                    bool _1183 = _875 == 44;
                    _617 = _1181;
                    if (_1171)
                    {
                        _575 = _1145;
                    }
                    int _1185 = _575;
                    bool _1187 = _875 == 48;
                    _619 = _1185;
                    if (_1175)
                    {
                        _577 = _1145;
                    }
                    int _1189 = _577;
                    bool _1191 = _875 == 52;
                    _621 = _1189;
                    if (_1179)
                    {
                        _579 = _1145;
                    }
                    int _1193 = _579;
                    bool _1195 = _875 == 56;
                    _623 = _1193;
                    if (_1183)
                    {
                        _581 = _1145;
                    }
                    int _1197 = _581;
                    bool _1199 = _875 == 60;
                    _625 = _1197;
                    if (_1187)
                    {
                        _583 = _1145;
                    }
                    int _1201 = _583;
                    bool _1203 = _875 == 64;
                    _627 = _1201;
                    if (_1191)
                    {
                        _585 = _1145;
                    }
                    int _1205 = _585;
                    bool _1207 = _875 == 68;
                    _629 = _1205;
                    if (_1195)
                    {
                        _587 = _1145;
                    }
                    int _1209 = _587;
                    bool _1211 = _939 != 0;
                    _631 = _1209;
                    if (_1199)
                    {
                        _589 = _1145;
                    }
                    int _1213 = _589;
                    bool _1215 = _1013 != 0;
                    _633 = _1213;
                    if (_1203)
                    {
                        _591 = _1145;
                    }
                    int _1217 = _591;
                    _635 = _1217;
                    if (_1207)
                    {
                        _593 = _1145;
                    }
                    int _1219 = _593;
                    bool _1221 = _985 != 0;
                    _637 = _1219;
                    if (_1211)
                    {
                        _595 = _1145;
                    }
                    int _1223 = _595;
                    bool _1225 = _1107 != 0;
                    _645 = _1223;
                    if (_1215)
                    {
                        _597 = _1145;
                    }
                    int _1227 = _597;
                    _643 = _1227;
                    if (_1221)
                    {
                        _599 = _1145;
                    }
                    int _1229 = _599;
                    _641 = _1229;
                    if (_1225)
                    {
                        _639 = _1145;
                    }
                }
            }
            _1231 = _601;
            int _1233 = _603;
            int _1235 = _605;
            int _1237 = _607;
            int _1239 = _609;
            int _1241 = _611;
            int _1243 = _613;
            int _1245 = _615;
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
            int _1291 = _347 + 1;
            bool _1293 = _1291 >= 3;
            _283 = !_1293;
            _229 = _1231;
            _231 = _1233;
            _233 = _1235;
            _235 = _1237;
            _237 = _1239;
            _239 = _1241;
            _241 = _1243;
            _243 = _1245;
            _245 = _1247;
            _247 = _1249;
            _249 = _1251;
            _251 = _1253;
            _253 = _1255;
            _255 = _1257;
            _257 = _1259;
            _259 = _1261;
            _261 = _1263;
            _263 = _1265;
            _265 = _1267;
            _267 = _1269;
            _269 = _1271;
            _271 = _1273;
            _273 = _1275;
            _275 = _1277;
            _277 = _1279;
            _279 = _1281;
            _281 = _1291;
            _743 = _1233;
            _749 = _1235;
            _755 = _1237;
            _761 = _1239;
            _737 = _1241;
            _767 = _1243;
            _773 = _1245;
            _785 = _1247;
            _791 = _1249;
            _797 = _1251;
            _803 = _1253;
            _779 = _1255;
            _809 = _1257;
            _815 = _1259;
            _825 = _1261;
            _831 = _1263;
            _837 = _1265;
            _843 = _1267;
            _821 = _1269;
            _849 = _1271;
            _853 = _1273;
            _857 = _1275;
            _861 = _1277;
            _865 = _1279;
            _869 = _1281;
            _661 = _1283;
            _729 = _1285;
            _663 = _1287;
            _731 = _1289;
        } while (_283);
        if (!_873)
        {
            _871 = _1231;
        }
        _873 = false;
        _1295 = _743;
        _1297 = _749;
        _1299 = _755;
        _1301 = _761;
        _1303 = _737;
        _1305 = _767;
        _1307 = _773;
        _1309 = _785;
        _1311 = _791;
        _1313 = _797;
        _1315 = _803;
        _1317 = _779;
        _1319 = _809;
        _1321 = _815;
        _1323 = _825;
        _1325 = _831;
        _1327 = _837;
        _1329 = _843;
        _1331 = _821;
        _1333 = _849;
        _1335 = _853;
        _1337 = _857;
        _1339 = _861;
        _1341 = _865;
        _1343 = _869;
        _1345 = _871;
        int _1347 = _661;
        int _1349 = _729;
        int _1351 = _663;
        int _1353 = _731;
        int _1355 = _147 + 1;
        bool _1357 = _1355 >= 3;
        _145 = !_1357;
        _89 = _1355;
        _91 = _1345;
        _93 = _1295;
        _95 = _1297;
        _97 = _1299;
        _99 = _1301;
        _101 = _1303;
        _103 = _1305;
        _105 = _1307;
        _107 = _1309;
        _109 = _1311;
        _111 = _1313;
        _113 = _1315;
        _115 = _1317;
        _117 = _1319;
        _119 = _1321;
        _121 = _1323;
        _123 = _1325;
        _125 = _1327;
        _127 = _1329;
        _129 = _1331;
        _131 = _1333;
        _133 = _1335;
        _135 = _1337;
        _137 = _1339;
        _139 = _1341;
        _141 = _1343;
        _1359 = _1347;
        _1361 = _1349;
        _1363 = _1351;
        _1365 = _1353;
        _1367 = _1347;
        _1369 = _1295;
    } while (_145);
    bool _1371 = _1345 > 0;
    if (!_1371)
    {
        _665 = 0;
    }
    int _1373 = _665;
    bool _1375 = !_1371;
    int _1377 = _1373;
    if (!_1375)
    {
        bool _1379 = _1345 > 3;
        bool _1381 = !_1379;
        int _1383 = 0;
        int _1385 = 0;
        int _1387 = 0;
        int _1389 = 0;
        int _1391 = 0;
        int _1393 = -1;
        int _1395 = 0;
        if (!_1381)
        {
            int _1397 = _1345 + (-3);
            _1393 = 0;
            bool _1399;
            do
            {
                int _1401 = _1383;
                int _1403 = _1385;
                int _1405 = _1359;
                int _1407 = _1361;
                int _1409 = _1363;
                int _1411 = _1387;
                int _1413 = _1365;
                int _1415 = _1401 * 4;
                int _1417 = _1401 + 1;
                int _1419 = _1401 + 2;
                bool _1421 = _1415 == 0;
                int _1423 = _1417 * 4;
                bool _1425 = _1415 == 4;
                int _1427 = _1419 * 4;
                bool _1429 = _1415 == 8;
                bool _1431 = _1415 == 12;
                bool _1433 = _1415 == 16;
                bool _1435 = _1423 == 8;
                int _1437 = _1401 + 3;
                int _1439 = _1405;
                int _1441 = _1407;
                int _1443 = _1409;
                int _1445 = _1413;
                int _1447 = _1403;
                int _1449 = _1411;
                if (_1421)
                {
                    _1439 = _1295;
                }
                int _1451 = _1439;
                bool _1453 = _1415 == 24;
                int _1455 = _1451;
                if (_1425)
                {
                    _1455 = _1297;
                }
                int _1457 = _1455;
                bool _1459 = _1415 == 20;
                int _1461 = _1457;
                if (_1429)
                {
                    _1461 = _1299;
                }
                int _1463 = _1461;
                bool _1465 = _1415 == 32;
                int _1467 = _1463;
                if (_1431)
                {
                    _1467 = _1301;
                }
                int _1469 = _1467;
                bool _1471 = _1415 == 28;
                int _1473 = _1469;
                if (_1433)
                {
                    _1473 = _1303;
                }
                int _1475 = _1473;
                bool _1477 = _1415 == 40;
                int _1479 = _1437 * 4;
                int _1481 = _1475;
                if (_1459)
                {
                    _1481 = _1305;
                }
                int _1483 = _1481;
                bool _1485 = _1415 == 36;
                int _1487 = _1483;
                if (_1453)
                {
                    _1487 = _1307;
                }
                int _1489 = _1487;
                bool _1491 = _1423 == 0;
                int _1493 = _1489;
                if (_1471)
                {
                    _1493 = _1309;
                }
                int _1495 = _1493;
                bool _1497 = _1423 == 4;
                int _1499 = _1495;
                if (_1465)
                {
                    _1499 = _1311;
                }
                int _1501 = _1499;
                bool _1503 = _1423 == 12;
                int _1505 = _1501;
                if (_1485)
                {
                    _1505 = _1313;
                }
                int _1507 = _1505;
                bool _1509 = _1415 == 44;
                int _1511 = _1507;
                if (_1477)
                {
                    _1511 = _1315;
                }
                int _1513 = _1511;
                bool _1515 = _1423 == 16;
                int _1517 = _1513;
                if (_1491)
                {
                    _1441 = _1295;
                }
                int _1519 = _1441;
                bool _1521 = _1415 == 48;
                int _1523 = _1519;
                if (_1497)
                {
                    _1523 = _1297;
                }
                int _1525 = _1523;
                int _1527 = _1525;
                if (_1435)
                {
                    _1527 = _1299;
                }
                int _1529 = _1527;
                bool _1531 = _1423 == 20;
                int _1533 = _1529;
                if (_1503)
                {
                    _1533 = _1301;
                }
                int _1535 = _1533;
                bool _1537 = _1423 == 24;
                bool _1539 = _1423 == 28;
                int _1541 = _1535;
                if (_1509)
                {
                    _1517 = _1317;
                }
                int _1543 = _1517;
                bool _1545 = _1415 == 52;
                int _1547 = _1543;
                if (_1515)
                {
                    _1541 = _1303;
                }
                int _1549 = _1541;
                bool _1551 = _1423 == 32;
                int _1553 = _1549;
                if (_1521)
                {
                    _1547 = _1319;
                }
                int _1555 = _1547;
                bool _1557 = _1415 == 56;
                int _1559 = _1555;
                if (_1531)
                {
                    _1553 = _1305;
                }
                int _1561 = _1553;
                bool _1563 = _1423 == 36;
                int _1565 = _1561;
                if (_1537)
                {
                    _1565 = _1307;
                }
                int _1567 = _1565;
                bool _1569 = _1423 == 40;
                int _1571 = _1567;
                if (_1539)
                {
                    _1571 = _1309;
                }
                int _1573 = _1571;
                bool _1575 = _1423 == 44;
                int _1577 = _1573;
                if (_1545)
                {
                    _1559 = _1321;
                }
                int _1579 = _1559;
                bool _1581 = _1415 == 60;
                int _1583 = _1579;
                if (_1551)
                {
                    _1577 = _1311;
                }
                int _1585 = _1577;
                bool _1587 = _1423 == 48;
                int _1589 = _1585;
                if (_1557)
                {
                    _1583 = _1323;
                }
                int _1591 = _1583;
                bool _1593 = _1415 == 64;
                int _1595 = _1591;
                if (_1563)
                {
                    _1589 = _1313;
                }
                int _1597 = _1589;
                bool _1599 = _1423 == 52;
                int _1601 = _1597;
                if (_1569)
                {
                    _1601 = _1315;
                }
                int _1603 = _1601;
                bool _1605 = _1423 == 56;
                int _1607 = _1603;
                if (_1575)
                {
                    _1607 = _1317;
                }
                int _1609 = _1607;
                bool _1611 = _1423 == 60;
                int _1613 = _1609;
                if (_1581)
                {
                    _1595 = _1325;
                }
                int _1615 = _1595;
                bool _1617 = _1427 == 0;
                int _1619 = _1615;
                if (_1587)
                {
                    _1613 = _1319;
                }
                int _1621 = _1613;
                bool _1623 = _1415 == 68;
                int _1625 = _1621;
                if (_1593)
                {
                    _1619 = _1327;
                }
                int _1627 = _1619;
                bool _1629 = _1427 == 4;
                int _1631 = _1627;
                if (_1599)
                {
                    _1625 = _1321;
                }
                int _1633 = _1625;
                bool _1635 = _1427 == 8;
                int _1637 = _1633;
                if (_1605)
                {
                    _1637 = _1323;
                }
                int _1639 = _1637;
                bool _1641 = _1427 == 12;
                int _1643 = _1639;
                if (_1611)
                {
                    _1643 = _1325;
                }
                int _1645 = _1643;
                bool _1647 = _1427 == 16;
                int _1649 = _1645;
                if (_1617)
                {
                    _1443 = _1295;
                }
                int _1651 = _1443;
                bool _1653 = _1423 == 64;
                int _1655 = _1651;
                if (_1623)
                {
                    _1631 = _1329;
                }
                int _1657 = _1631;
                bool _1659 = _1427 == 20;
                int _1661 = _1657;
                if (_1629)
                {
                    _1655 = _1297;
                }
                int _1663 = _1655;
                bool _1665 = _1415 == 72;
                int _1667 = _1663;
                if (_1635)
                {
                    _1667 = _1299;
                }
                int _1669 = _1667;
                bool _1671 = _1427 == 24;
                int _1673 = _1669;
                if (_1641)
                {
                    _1673 = _1301;
                }
                int _1675 = _1673;
                bool _1677 = _1427 == 28;
                int _1679 = _1675;
                if (_1647)
                {
                    _1679 = _1303;
                }
                int _1681 = _1679;
                int _1683 = _1681;
                if (_1653)
                {
                    _1649 = _1327;
                }
                int _1685 = _1649;
                bool _1687 = _1423 == 68;
                int _1689 = _1685;
                if (_1659)
                {
                    _1683 = _1305;
                }
                int _1691 = _1683;
                bool _1693 = _1427 == 32;
                int _1695 = _1691;
                if (_1665)
                {
                    _1661 = _1331;
                }
                int _1697 = _1661;
                bool _1699 = _1427 == 36;
                bool _1701 = _1415 == 76;
                int _1703 = _1697;
                if (_1671)
                {
                    _1695 = _1307;
                }
                int _1705 = _1695;
                bool _1707 = _1427 == 40;
                int _1709 = _1705;
                if (_1677)
                {
                    _1709 = _1309;
                }
                int _1711 = _1709;
                bool _1713 = _1427 == 44;
                int _1715 = _1711;
                if (_1687)
                {
                    _1689 = _1329;
                }
                int _1717 = _1689;
                bool _1719 = _1423 == 72;
                int _1721 = _1717;
                if (_1693)
                {
                    _1715 = _1311;
                }
                int _1723 = _1715;
                bool _1725 = _1427 == 48;
                int _1727 = _1723;
                if (_1699)
                {
                    _1727 = _1313;
                }
                int _1729 = _1727;
                bool _1731 = _1427 == 52;
                int _1733 = _1729;
                if (_1701)
                {
                    _1703 = _1333;
                }
                int _1735 = _1703;
                bool _1737 = _1415 == 80;
                int _1739 = _1735;
                if (_1707)
                {
                    _1733 = _1315;
                }
                int _1741 = _1733;
                bool _1743 = _1427 == 56;
                int _1745 = _1741;
                if (_1713)
                {
                    _1745 = _1317;
                }
                int _1747 = _1745;
                bool _1749 = _1427 == 60;
                int _1751 = _1747;
                if (_1719)
                {
                    _1721 = _1331;
                }
                int _1753 = _1721;
                bool _1755 = _1427 == 64;
                int _1757 = _1753;
                if (_1725)
                {
                    _1751 = _1319;
                }
                int _1759 = _1751;
                bool _1761 = _1423 == 76;
                int _1763 = _1759;
                if (_1731)
                {
                    _1763 = _1321;
                }
                int _1765 = _1763;
                bool _1767 = _1415 == 84;
                int _1769 = _1765;
                if (_1737)
                {
                    _1739 = _1335;
                }
                int _1771 = _1739;
                bool _1773 = _1427 == 68;
                int _1775 = _1771;
                if (_1743)
                {
                    _1769 = _1323;
                }
                int _1777 = _1769;
                bool _1779 = _1427 == 72;
                int _1781 = _1777;
                if (_1749)
                {
                    _1781 = _1325;
                }
                int _1783 = _1781;
                bool _1785 = _1427 == 76;
                int _1787 = _1783;
                if (_1755)
                {
                    _1787 = _1327;
                }
                int _1789 = _1787;
                bool _1791 = _1479 == 0;
                int _1793 = _1789;
                if (_1761)
                {
                    _1757 = _1333;
                }
                int _1795 = _1757;
                bool _1797 = _1423 == 80;
                int _1799 = _1795;
                if (_1767)
                {
                    _1775 = _1337;
                }
                int _1801 = _1775;
                bool _1803 = _1479 == 4;
                int _1805 = _1801;
                if (_1773)
                {
                    _1793 = _1329;
                }
                int _1807 = _1793;
                bool _1809 = _1427 == 80;
                int _1811 = _1807;
                if (_1779)
                {
                    _1811 = _1331;
                }
                int _1813 = _1811;
                bool _1815 = _1479 == 8;
                int _1817 = _1813;
                if (_1785)
                {
                    _1817 = _1333;
                }
                int _1819 = _1817;
                bool _1821 = _1415 == 88;
                int _1823 = _1819;
                if (_1791)
                {
                    _1445 = _1295;
                }
                int _1825 = _1445;
                bool _1827 = _1479 == 12;
                int _1829 = _1825;
                if (_1797)
                {
                    _1799 = _1335;
                }
                int _1831 = _1799;
                bool _1833 = _1423 == 84;
                int _1835 = _1831;
                if (_1803)
                {
                    _1829 = _1297;
                }
                int _1837 = _1829;
                int _1839 = _1837;
                if (_1809)
                {
                    _1823 = _1335;
                }
                int _1841 = _1823;
                bool _1843 = _1427 == 84;
                int _1845 = _1841;
                if (_1815)
                {
                    _1839 = _1299;
                }
                int _1847 = _1839;
                bool _1849 = _1479 == 16;
                int _1851 = _1847;
                if (_1821)
                {
                    _1805 = _1339;
                }
                int _1853 = _1805;
                bool _1855 = _1415 == 92;
                bool _1857 = _1479 == 20;
                int _1859 = _1853;
                if (_1827)
                {
                    _1851 = _1301;
                }
                int _1861 = _1851;
                bool _1863 = _1423 == 88;
                int _1865 = _1861;
                if (_1833)
                {
                    _1835 = _1337;
                }
                int _1867 = _1835;
                bool _1869 = _1479 == 24;
                int _1871 = _1867;
                if (_1843)
                {
                    _1845 = _1337;
                }
                int _1873 = _1845;
                bool _1875 = _1427 == 88;
                int _1877 = _1873;
                if (_1849)
                {
                    _1865 = _1303;
                }
                int _1879 = _1865;
                bool _1881 = _1479 == 28;
                int _1883 = _1879;
                if (_1855)
                {
                    _1859 = _1341;
                }
                int _1885 = _1859;
                bool _1887 = _1479 == 32;
                int _1889 = _1885;
                if (_1857)
                {
                    _1883 = _1305;
                }
                int _1891 = _1883;
                bool _1893 = _1415 == 96;
                int _1895 = _1891;
                if (_1863)
                {
                    _1871 = _1339;
                }
                int _1897 = _1871;
                bool _1899 = _1479 == 40;
                int _1901 = _1897;
                if (_1869)
                {
                    _1895 = _1307;
                }
                int _1903 = _1895;
                bool _1905 = _1479 == 36;
                int _1907 = _1903;
                if (_1875)
                {
                    _1877 = _1339;
                }
                int _1909 = _1877;
                bool _1911 = _1423 == 92;
                int _1913 = _1909;
                if (_1881)
                {
                    _1907 = _1309;
                }
                int _1915 = _1907;
                bool _1917 = _1479 == 44;
                int _1919 = _1915;
                if (_1887)
                {
                    _1919 = _1311;
                }
                int _1921 = _1919;
                bool _1923 = _1479 == 48;
                int _1925 = _1921;
                if (_1893)
                {
                    _1889 = _1343;
                }
                int _1927 = _1889;
                bool _1929 = _1423 == 96;
                int _1931 = _1927;
                if (_1905)
                {
                    _1925 = _1313;
                }
                int _1933 = _1925;
                bool _1935 = _1479 == 52;
                int _1937 = _1933;
                if (_1899)
                {
                    _1937 = _1315;
                }
                int _1939 = _1937;
                bool _1941 = _1403 >= _1927;
                int _1943 = _1939;
                if (_1911)
                {
                    _1901 = _1341;
                }
                int _1945 = _1901;
                bool _1947 = _1479 == 56;
                int _1949 = _1945;
                if (_1917)
                {
                    _1943 = _1317;
                }
                int _1951 = _1943;
                bool _1953 = _1479 == 60;
                int _1955 = _1951;
                if (_1923)
                {
                    _1955 = _1319;
                }
                int _1957 = _1955;
                bool _1959 = _1479 == 64;
                int _1961 = _1957;
                if (_1929)
                {
                    _1949 = _1343;
                }
                int _1963 = _1949;
                bool _1965 = _1427 == 92;
                _1361 = _1963;
                if (_1935)
                {
                    _1961 = _1321;
                }
                int _1967 = _1961;
                bool _1969 = _1479 == 68;
                int _1971 = _1967;
                if (!_1941)
                {
                    _1447 = _1927;
                }
                int _1973 = _1447;
                int _1975 = _1973;
                if (_1947)
                {
                    _1971 = _1323;
                }
                int _1977 = _1971;
                bool _1979 = _1479 == 72;
                int _1981 = _1977;
                if (_1953)
                {
                    _1981 = _1325;
                }
                int _1983 = _1981;
                bool _1985 = _1973 >= _1963;
                int _1987 = _1983;
                if (_1959)
                {
                    _1987 = _1327;
                }
                int _1989 = _1987;
                int _1991 = _1989;
                if (_1965)
                {
                    _1913 = _1341;
                }
                int _1993 = _1913;
                bool _1995 = _1427 == 96;
                bool _1997 = _1479 == 76;
                int _1999 = _1993;
                if (_1969)
                {
                    _1991 = _1329;
                }
                int _2001 = _1991;
                bool _2003 = _1479 == 80;
                int _2005 = _2001;
                if (_1979)
                {
                    _2005 = _1331;
                }
                int _2007 = _2005;
                bool _2009 = _1479 == 84;
                int _2011 = _2007;
                if (_1985)
                {
                    _1931 = _1973;
                }
                int _2013 = _1931;
                int _2015 = _2013;
                if (!_1985)
                {
                    _2015 = _1963;
                }
                int _2017 = _2015;
                int _2019 = _2017;
                if (_1995)
                {
                    _1999 = _1343;
                }
                int _2021 = _1999;
                bool _2023 = _1479 == 88;
                _1363 = _2021;
                if (_1997)
                {
                    _2011 = _1333;
                }
                int _2025 = _2011;
                bool _2027 = _1479 == 92;
                int _2029 = _2025;
                if (_2003)
                {
                    _2029 = _1335;
                }
                int _2031 = _2029;
                bool _2033 = _2017 >= _2021;
                int _2035 = _2031;
                if (_1941)
                {
                    _1975 = _1411;
                }
                int _2037 = _1975;
                int _2039 = _2037;
                if (_2009)
                {
                    _2035 = _1337;
                }
                int _2041 = _2035;
                bool _2043 = _1479 == 96;
                int _2045 = _2041;
                if (!_1941)
                {
                    _2039 = _1401;
                }
                int _2047 = _2039;
                int _2049 = _1401 + 4;
                _1383 = _2049;
                int _2051 = _2047;
                _1389 = _2049;
                if (!_1985)
                {
                    _2051 = _1417;
                }
                int _2053 = _2051;
                int _2055 = _2053;
                if (_2023)
                {
                    _2045 = _1339;
                }
                int _2057 = _2045;
                bool _2059 = _2049 >= _1397;
                int _2061 = _2057;
                if (_2027)
                {
                    _2061 = _1341;
                }
                int _2063 = _2061;
                int _2065 = _2063;
                if (!_2033)
                {
                    _2019 = _2021;
                }
                int _2067 = _2019;
                _1359 = _2067;
                _1367 = _2067;
                if (!_2033)
                {
                    _2055 = _1419;
                }
                int _2069 = _2055;
                int _2071 = _2069;
                if (_2043)
                {
                    _2065 = _1343;
                }
                int _2073 = _2065;
                bool _2075 = _2067 >= _2073;
                _1365 = _2073;
                if (_2075)
                {
                    _1449 = _2069;
                }
                int _2077 = _1449;
                int _2079 = _2077;
                if (_2075)
                {
                    _2071 = _2067;
                }
                int _2081 = _2071;
                int _2083 = _2081;
                if (!_2075)
                {
                    _2079 = _1437;
                }
                int _2085 = _2079;
                _1387 = _2085;
                _1395 = _2085;
                if (!_2075)
                {
                    _2083 = _2073;
                }
                int _2087 = _2083;
                _1399 = !_2059;
                _1385 = _2087;
                _1391 = _2087;
            } while (_1399);
        }
        int _2089 = _1389;
        int _2091 = _1391;
        int _2093 = _1367;
        int _2095 = _1393;
        int _2097 = _1395;
        int _2099 = -_2089;
        int _2101 = _1345 + _2099;
        bool _2103 = _2101 > 1;
        bool _2105 = !_2103;
        int _2107 = _2093;
        int _2109 = _2101;
        int _2111 = _2091;
        int _2113 = _2097;
        int _2115 = _2089;
        int _2117 = _2095;
        int _2119 = _2091;
        int _2121 = _2097;
        if (!_2105)
        {
            int _2123 = _2089 * 4;
            int _2125 = _2089 + 1;
            bool _2127 = _2123 == 0;
            int _2129 = _2125 * 4;
            bool _2131 = _2123 == 4;
            bool _2133 = _2123 == 8;
            bool _2135 = _2123 == 12;
            bool _2137 = _2123 == 24;
            bool _2139 = _2129 == 0;
            bool _2141 = _2123 == 40;
            if (_2127)
            {
                _2107 = _1295;
            }
            int _2143 = _2107;
            bool _2145 = _2123 == 16;
            int _2147 = _2143;
            if (_2131)
            {
                _2147 = _1297;
            }
            int _2149 = _2147;
            bool _2151 = _2123 == 20;
            int _2153 = _2149;
            if (_2133)
            {
                _2153 = _1299;
            }
            int _2155 = _2153;
            bool _2157 = _2123 == 36;
            int _2159 = _2155;
            if (_2135)
            {
                _2159 = _1301;
            }
            int _2161 = _2159;
            bool _2163 = _2123 == 28;
            int _2165 = _2161;
            if (_2139)
            {
                _2109 = _1295;
            }
            int _2167 = _2109;
            bool _2169 = _2129 == 16;
            int _2171 = _2167;
            if (_2145)
            {
                _2165 = _1303;
            }
            int _2173 = _2165;
            bool _2175 = _2123 == 32;
            int _2177 = _2173;
            if (_2151)
            {
                _2177 = _1305;
            }
            int _2179 = _2177;
            bool _2181 = _2123 == 48;
            int _2183 = _2179;
            if (_2137)
            {
                _2183 = _1307;
            }
            int _2185 = _2183;
            bool _2187 = _2129 == 4;
            int _2189 = _2185;
            if (_2163)
            {
                _2189 = _1309;
            }
            int _2191 = _2189;
            bool _2193 = _2123 == 44;
            int _2195 = _2191;
            if (_2175)
            {
                _2195 = _1311;
            }
            int _2197 = _2195;
            bool _2199 = _2129 == 8;
            int _2201 = _2197;
            if (_2157)
            {
                _2201 = _1313;
            }
            int _2203 = _2201;
            bool _2205 = _2129 == 12;
            int _2207 = _2203;
            if (_2187)
            {
                _2171 = _1297;
            }
            int _2209 = _2171;
            bool _2211 = _2123 == 52;
            int _2213 = _2209;
            if (_2141)
            {
                _2207 = _1315;
            }
            int _2215 = _2207;
            bool _2217 = _2129 == 20;
            int _2219 = _2215;
            if (_2193)
            {
                _2219 = _1317;
            }
            int _2221 = _2219;
            bool _2223 = _2129 == 24;
            int _2225 = _2221;
            if (_2181)
            {
                _2225 = _1319;
            }
            int _2227 = _2225;
            bool _2229 = _2123 == 60;
            int _2231 = _2227;
            if (_2199)
            {
                _2213 = _1299;
            }
            int _2233 = _2213;
            bool _2235 = _2123 == 56;
            int _2237 = _2233;
            if (_2205)
            {
                _2237 = _1301;
            }
            int _2239 = _2237;
            bool _2241 = _2129 == 28;
            int _2243 = _2239;
            if (_2169)
            {
                _2243 = _1303;
            }
            int _2245 = _2243;
            bool _2247 = _2129 == 32;
            int _2249 = _2245;
            if (_2217)
            {
                _2249 = _1305;
            }
            int _2251 = _2249;
            bool _2253 = _2129 == 36;
            int _2255 = _2251;
            if (_2211)
            {
                _2231 = _1321;
            }
            int _2257 = _2231;
            bool _2259 = _2123 == 64;
            int _2261 = _2257;
            if (_2223)
            {
                _2255 = _1307;
            }
            int _2263 = _2255;
            bool _2265 = _2123 == 68;
            int _2267 = _2263;
            if (_2235)
            {
                _2261 = _1323;
            }
            int _2269 = _2261;
            bool _2271 = _2129 == 40;
            int _2273 = _2269;
            if (_2241)
            {
                _2267 = _1309;
            }
            int _2275 = _2267;
            bool _2277 = _2123 == 72;
            int _2279 = _2275;
            if (_2229)
            {
                _2273 = _1325;
            }
            int _2281 = _2273;
            bool _2283 = _2129 == 44;
            int _2285 = _2281;
            if (_2247)
            {
                _2279 = _1311;
            }
            int _2287 = _2279;
            bool _2289 = _2129 == 48;
            int _2291 = _2287;
            if (_2253)
            {
                _2291 = _1313;
            }
            int _2293 = _2291;
            bool _2295 = _2123 == 76;
            int _2297 = _2293;
            if (_2259)
            {
                _2285 = _1327;
            }
            int _2299 = _2285;
            bool _2301 = _2129 == 52;
            int _2303 = _2299;
            if (_2265)
            {
                _2303 = _1329;
            }
            int _2305 = _2303;
            bool _2307 = _2123 == 80;
            int _2309 = _2305;
            if (_2271)
            {
                _2297 = _1315;
            }
            int _2311 = _2297;
            bool _2313 = _2129 == 56;
            int _2315 = _2311;
            if (_2277)
            {
                _2309 = _1331;
            }
            int _2317 = _2309;
            int _2319 = _2317;
            if (_2283)
            {
                _2315 = _1317;
            }
            int _2321 = _2315;
            bool _2323 = _2123 == 84;
            int _2325 = _2321;
            if (_2289)
            {
                _2325 = _1319;
            }
            int _2327 = _2325;
            bool _2329 = _2129 == 60;
            int _2331 = _2327;
            if (_2295)
            {
                _2319 = _1333;
            }
            int _2333 = _2319;
            bool _2335 = _2123 == 88;
            int _2337 = _2333;
            if (_2301)
            {
                _2331 = _1321;
            }
            int _2339 = _2331;
            bool _2341 = _2129 == 64;
            int _2343 = _2339;
            if (_2307)
            {
                _2337 = _1335;
            }
            int _2345 = _2337;
            bool _2347 = _2123 == 92;
            int _2349 = _2345;
            if (_2313)
            {
                _2343 = _1323;
            }
            int _2351 = _2343;
            bool _2353 = _2129 == 68;
            bool _2355 = _2129 == 72;
            int _2357 = _2351;
            if (_2323)
            {
                _2349 = _1337;
            }
            int _2359 = _2349;
            bool _2361 = _2123 == 96;
            int _2363 = _2359;
            if (_2329)
            {
                _2357 = _1325;
            }
            int _2365 = _2357;
            bool _2367 = _2129 == 76;
            int _2369 = _2365;
            if (_2335)
            {
                _2363 = _1339;
            }
            int _2371 = _2363;
            int _2373 = _2371;
            if (_2341)
            {
                _2369 = _1327;
            }
            int _2375 = _2369;
            bool _2377 = _2129 == 80;
            int _2379 = _2375;
            if (_2347)
            {
                _2373 = _1341;
            }
            int _2381 = _2373;
            bool _2383 = _2129 == 96;
            int _2385 = _2381;
            if (_2353)
            {
                _2379 = _1329;
            }
            int _2387 = _2379;
            bool _2389 = _2129 == 84;
            int _2391 = _2387;
            if (_2355)
            {
                _2391 = _1331;
            }
            int _2393 = _2391;
            bool _2395 = _2129 == 88;
            int _2397 = _2393;
            if (_2361)
            {
                _2385 = _1343;
            }
            int _2399 = _2385;
            bool _2401 = _2129 == 92;
            if (_2367)
            {
                _2397 = _1333;
            }
            int _2403 = _2397;
            bool _2405 = _2091 >= _2399;
            int _2407 = _2403;
            if (_2377)
            {
                _2407 = _1335;
            }
            int _2409 = _2407;
            int _2411 = _2409;
            if (_2389)
            {
                _2411 = _1337;
            }
            int _2413 = _2411;
            int _2415 = _2413;
            if (_2395)
            {
                _2415 = _1339;
            }
            int _2417 = _2415;
            int _2419 = _2417;
            _2117 = 0;
            if (_2401)
            {
                _2419 = _1341;
            }
            int _2421 = _2419;
            int _2423 = _2421;
            if (_2383)
            {
                _2423 = _1343;
            }
            int _2425 = _2423;
            if (!_2405)
            {
                _2111 = _2399;
            }
            int _2427 = _2111;
            _2119 = _2427;
            if (!_2405)
            {
                _2113 = _2089;
            }
            int _2429 = _2113;
            int _2431 = _2125 + 1;
            bool _2433 = _2427 >= _2425;
            int _2435 = _2429;
            _2115 = _2431;
            if (!_2433)
            {
                _2435 = _2125;
            }
            int _2437 = _2435;
            _2121 = _2437;
            if (!_2433)
            {
                _2119 = _2425;
            }
        }
        int _2439 = _2115;
        int _2441 = _2117;
        int _2443 = _2119;
        int _2445 = _2121;
        bool _2447 = _2439 < _1345;
        int _2449 = (_2447 ? (-1) : 0) | _2441;
        int _2451 = ~_2449;
        int _2453 = _2445;
        if (!(_2451 != 0))
        {
            int _2455 = _2439 * 4;
            bool _2457 = _2455 == 4;
            bool _2459 = _2455 == 8;
            bool _2461 = _2455 == 12;
            bool _2463 = _2455 == 16;
            if (_2457)
            {
                _1369 = _1297;
            }
            int _2465 = _1369;
            bool _2467 = _2455 == 20;
            int _2469 = _2465;
            if (_2459)
            {
                _2469 = _1299;
            }
            int _2471 = _2469;
            bool _2473 = _2455 == 24;
            int _2475 = _2471;
            if (_2461)
            {
                _2475 = _1301;
            }
            int _2477 = _2475;
            bool _2479 = _2455 == 28;
            int _2481 = _2477;
            if (_2463)
            {
                _2481 = _1303;
            }
            int _2483 = _2481;
            bool _2485 = _2455 == 32;
            int _2487 = _2483;
            if (_2467)
            {
                _2487 = _1305;
            }
            int _2489 = _2487;
            bool _2491 = _2455 == 36;
            int _2493 = _2489;
            if (_2473)
            {
                _2493 = _1307;
            }
            int _2495 = _2493;
            bool _2497 = _2455 == 40;
            int _2499 = _2495;
            if (_2479)
            {
                _2499 = _1309;
            }
            int _2501 = _2499;
            bool _2503 = _2455 == 44;
            int _2505 = _2501;
            if (_2485)
            {
                _2505 = _1311;
            }
            int _2507 = _2505;
            bool _2509 = _2455 == 48;
            int _2511 = _2507;
            if (_2491)
            {
                _2511 = _1313;
            }
            int _2513 = _2511;
            bool _2515 = _2455 == 52;
            int _2517 = _2513;
            if (_2497)
            {
                _2517 = _1315;
            }
            int _2519 = _2517;
            bool _2521 = _2455 == 56;
            int _2523 = _2519;
            if (_2503)
            {
                _2523 = _1317;
            }
            int _2525 = _2523;
            bool _2527 = _2455 == 60;
            int _2529 = _2525;
            if (_2509)
            {
                _2529 = _1319;
            }
            int _2531 = _2529;
            bool _2533 = _2455 == 64;
            int _2535 = _2531;
            if (_2515)
            {
                _2535 = _1321;
            }
            int _2537 = _2535;
            bool _2539 = _2455 == 68;
            int _2541 = _2537;
            if (_2521)
            {
                _2541 = _1323;
            }
            int _2543 = _2541;
            bool _2545 = _2455 == 72;
            int _2547 = _2543;
            if (_2527)
            {
                _2547 = _1325;
            }
            int _2549 = _2547;
            bool _2551 = _2455 == 76;
            int _2553 = _2549;
            if (_2533)
            {
                _2553 = _1327;
            }
            int _2555 = _2553;
            bool _2557 = _2455 == 80;
            int _2559 = _2555;
            if (_2539)
            {
                _2559 = _1329;
            }
            int _2561 = _2559;
            bool _2563 = _2455 == 84;
            int _2565 = _2561;
            if (_2545)
            {
                _2565 = _1331;
            }
            int _2567 = _2565;
            bool _2569 = _2455 == 88;
            int _2571 = _2567;
            if (_2551)
            {
                _2571 = _1333;
            }
            int _2573 = _2571;
            bool _2575 = _2455 == 92;
            int _2577 = _2573;
            if (_2557)
            {
                _2577 = _1335;
            }
            int _2579 = _2577;
            bool _2581 = _2455 == 96;
            int _2583 = _2579;
            if (_2563)
            {
                _2583 = _1337;
            }
            int _2585 = _2583;
            int _2587 = _2585;
            if (_2569)
            {
                _2587 = _1339;
            }
            int _2589 = _2587;
            int _2591 = _2589;
            if (_2575)
            {
                _2591 = _1341;
            }
            int _2593 = _2591;
            int _2595 = _2593;
            if (_2581)
            {
                _2595 = _1343;
            }
            int _2597 = _2595;
            bool _2599 = _2443 >= _2597;
            if (!_2599)
            {
                _2453 = _2439;
            }
        }
        int _2601 = _2453;
        _1377 = _2601;
    }
    int _2603 = _1377;
    int _2605 = _2603 * 8;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    float _2609 = as_type<float>(_31[int(_2607)]);
    int _2611 = _2605 + 4;
    uint _2613 = uint(int(uint(_2611) >> uint(2)));
    float _2615 = as_type<float>(_31[int(_2613)]);
    int _2617 = _72 + 16;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2619)] = as_type<uint>(_2609);
    int _2621 = _2617 + 4;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2623)] = as_type<uint>(_2615);
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
    bool _873 = false;
    bool _697 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _2646 = float3((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float4 _58 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2646, float3(0.0), isnan(_2646)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2646, float3(0.0), isnan(_2646)), level(0.0)).xyzw;
    float _61 = _58.x;
    float _63 = _58.y;
    float _65 = _58.z;
    float _67 = _58.w;
    float _69 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _72 = as_type<int>(_69) * 32;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_75)] = as_type<uint>(_61);
    int _77 = _72 + 4;
    uint _79 = uint(int(uint(_77) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_79)] = as_type<uint>(_63);
    int _81 = _72 + 8;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_83)] = as_type<uint>(_65);
    int _85 = _72 + 12;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_87)] = as_type<uint>(_67);
    int _89 = -2;
    int _91 = 0;
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
    bool _145;
    bool _283;
    int _661;
    int _663;
    int _665;
    bool _673;
    int _675;
    int _729;
    int _731;
    int _737;
    int _743;
    int _749;
    int _755;
    int _761;
    int _767;
    int _773;
    int _779;
    int _785;
    int _791;
    int _797;
    int _803;
    int _809;
    int _815;
    bool _819;
    int _821;
    int _825;
    int _831;
    int _837;
    int _843;
    int _849;
    int _853;
    int _857;
    int _861;
    int _865;
    int _869;
    int _871;
    int _1231;
    int _1295;
    int _1297;
    int _1299;
    int _1301;
    int _1303;
    int _1305;
    int _1307;
    int _1309;
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
    int _1359;
    int _1361;
    int _1363;
    int _1365;
    int _1367;
    int _1369;
    do
    {
        int _147 = _89;
        int _149 = _91;
        int _151 = _93;
        int _153 = _95;
        int _155 = _97;
        int _157 = _99;
        int _159 = _101;
        int _161 = _103;
        int _163 = _105;
        int _165 = _107;
        int _167 = _109;
        int _169 = _111;
        int _171 = _113;
        int _173 = _115;
        int _175 = _117;
        int _177 = _119;
        int _179 = _121;
        int _181 = _123;
        int _183 = _125;
        int _185 = _127;
        int _187 = _129;
        int _189 = _131;
        int _191 = _133;
        int _193 = _135;
        int _195 = _137;
        int _197 = _139;
        int _199 = _141;
        float _201 = float(_147);
        float _203 = _201 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _205 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _207 = fma(_203, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2765 = float2(_205, _207);
        float4 _209 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2765, float2(0.0), isnan(_2765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2765, float2(0.0), isnan(_2765)), level(0.0)).xyzw;
        float _211 = _209.x;
        float _213 = _209.y;
        float _215 = _209.z;
        float _217 = _209.w;
        int _219 = -2;
        float _221 = _217;
        float _223 = _213;
        float _225 = _215;
        float _227 = _211;
        int _229 = _149;
        int _231 = _151;
        int _233 = _153;
        int _235 = _155;
        int _237 = _157;
        int _239 = _159;
        int _241 = _161;
        int _243 = _163;
        int _245 = _165;
        int _247 = _167;
        int _249 = _169;
        int _251 = _171;
        int _253 = _173;
        int _255 = _175;
        int _257 = _177;
        int _259 = _179;
        int _261 = _181;
        int _263 = _183;
        int _265 = _185;
        int _267 = _187;
        int _269 = _189;
        int _271 = _191;
        int _273 = _193;
        int _275 = _195;
        int _277 = _197;
        int _279 = _199;
        int _281 = -2;
        do
        {
            int _285 = _219;
            float _287 = _221;
            float _289 = _223;
            float _291 = _225;
            float _293 = _227;
            int _295 = _229;
            int _297 = _231;
            int _299 = _233;
            int _301 = _235;
            int _303 = _237;
            int _305 = _239;
            int _307 = _241;
            int _309 = _243;
            int _311 = _245;
            int _313 = _247;
            int _315 = _249;
            int _317 = _251;
            int _319 = _253;
            int _321 = _255;
            int _323 = _257;
            int _325 = _259;
            int _327 = _261;
            int _329 = _263;
            int _331 = _265;
            int _333 = _267;
            int _335 = _269;
            int _337 = _271;
            int _339 = _273;
            int _341 = _275;
            int _343 = _277;
            int _345 = _279;
            int _347 = _281;
            int _349 = _285 + 1;
            float _351 = float(_147);
            float _353 = float(_349);
            float _355 = _351 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _357 = _353 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _359 = 0.0 + _287;
            float _361 = precise::clamp(_359, 0.0, 1.0);
            float _363 = fma(_355, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _365 = 0.0 + _289;
            float _367 = precise::clamp(_365, 0.0, 1.0);
            float _369 = fma(_357, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _371 = 0.0 + _291;
            float _373 = precise::clamp(_371, 0.0, 1.0);
            float _375 = 0.0 + _293;
            float _377 = precise::clamp(_375, 0.0, 1.0);
            float2 _2885 = float2(_369, _363);
            float4 _379 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2885, float2(0.0), isnan(_2885)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2885, float2(0.0), isnan(_2885)), level(0.0)).xyzw;
            float _381 = _379.x;
            float _383 = _379.y;
            float _385 = _379.z;
            float _387 = _379.w;
            float _389 = _361 * 65535.0;
            float _391 = _373 * 65535.0;
            float _393 = _367 * 65535.0;
            float _395 = _377 * 65535.0;
            float _397 = rint(_389);
            int _399 = int(_397);
            float _401 = rint(_391);
            int _403 = int(_401);
            float _405 = rint(_393);
            int _407 = int(_405);
            uint _409 = extract_bits(uint(_399), 0u, 8u);
            int _411 = int(_409) & 255;
            uint _413 = extract_bits(uint(_399), 8u, 8u);
            int _415 = int(_413) & 255;
            int _417 = _415 << 8;
            int _419 = _411 | _417;
            float _421 = rint(_395);
            int _423 = int(_421);
            uint _425 = extract_bits(uint(_419), 0u, 8u);
            int _427 = int(_425) & 255;
            uint _429 = extract_bits(uint(_419), 8u, 8u);
            int _431 = int(_429) & 255;
            int _433 = _431 << 8;
            int _435 = _427 | _433;
            uint _437 = extract_bits(uint(_403), 0u, 8u);
            int _439 = int(_437) & 255;
            int _441 = _439 << 16;
            int _443 = _435 | _441;
            uint _445 = extract_bits(uint(_403), 8u, 8u);
            int _447 = int(_445) & 255;
            int _449 = _447 << 24;
            int _451 = _443 | _449;
            bool _453 = _451 != 0;
            uint _455 = extract_bits(uint(_407), 0u, 8u);
            int _457 = int(_455) & 255;
            uint _459 = extract_bits(uint(_407), 8u, 8u);
            int _461 = int(_459) & 255;
            int _463 = _461 << 8;
            int _465 = _457 | _463;
            uint _467 = extract_bits(uint(_465), 0u, 8u);
            int _469 = int(_467) & 255;
            uint _471 = extract_bits(uint(_465), 8u, 8u);
            int _473 = int(_471) & 255;
            int _475 = _473 << 8;
            int _477 = _469 | _475;
            uint _479 = extract_bits(uint(_423), 0u, 8u);
            int _481 = int(_479) & 255;
            int _483 = _481 << 16;
            int _485 = _477 | _483;
            uint _487 = extract_bits(uint(_423), 8u, 8u);
            int _489 = int(_487) & 255;
            int _491 = _489 << 24;
            int _493 = _485 | _491;
            bool _495 = _493 != 0;
            bool _497 = _495 || _453;
            bool _499 = !_497;
            _219 = _349;
            _221 = _387;
            _223 = _383;
            _225 = _385;
            _227 = _381;
            int _501 = _305;
            int _503 = _297;
            int _505 = _299;
            int _507 = _301;
            int _509 = _303;
            int _511 = _307;
            int _513 = _309;
            int _515 = _319;
            int _517 = _311;
            int _519 = _313;
            int _521 = _315;
            int _523 = _317;
            int _525 = _321;
            int _527 = _323;
            int _529 = _333;
            int _531 = _325;
            int _533 = _327;
            int _535 = _329;
            int _537 = _331;
            int _539 = _335;
            int _541 = _337;
            int _543 = _339;
            int _545 = _341;
            int _547 = _343;
            int _549 = _345;
            int _551 = _451;
            int _553 = _297;
            int _555 = _299;
            int _557 = _301;
            int _559 = _303;
            int _561 = _341;
            int _563 = _343;
            int _565 = _345;
            int _567 = _305;
            int _569 = _307;
            int _571 = _309;
            int _573 = _311;
            int _575 = _313;
            int _577 = _315;
            int _579 = _317;
            int _581 = _319;
            int _583 = _321;
            int _585 = _323;
            int _587 = _325;
            int _589 = _327;
            int _591 = _329;
            int _593 = _331;
            int _595 = _339;
            int _597 = _337;
            int _599 = _335;
            int _601 = _295;
            int _603 = _297;
            int _605 = _299;
            int _607 = _301;
            int _609 = _303;
            int _611 = _305;
            int _613 = _307;
            int _615 = _309;
            int _617 = _311;
            int _619 = _313;
            int _621 = _315;
            int _623 = _317;
            int _625 = _319;
            int _627 = _321;
            int _629 = _323;
            int _631 = _325;
            int _633 = _327;
            int _635 = _329;
            int _637 = _331;
            int _639 = _333;
            int _641 = _335;
            int _643 = _337;
            int _645 = _339;
            int _647 = _341;
            int _649 = _343;
            int _651 = _345;
            int _653 = _493;
            int _655 = _423;
            int _657 = _451;
            int _659 = _419;
            _661 = _493;
            _663 = _451;
            _665 = as_type<int>(_385);
            if (!_499)
            {
                bool _667 = _295 > 0;
                bool _669 = !_667;
                if (!_669)
                {
                    int _671 = 0;
                    do
                    {
                        _675 = _671;
                        int _677 = _675 * 8;
                        uint _679 = uint(int(uint(_677) >> uint(2)));
                        float _681 = as_type<float>(_31[int(_679)]);
                        int _683 = _677 + 4;
                        uint _685 = uint(int(uint(_683) >> uint(2)));
                        float _687 = as_type<float>(_31[int(_685)]);
                        bool _689 = as_type<int>(_681) != _451;
                        bool _691 = as_type<int>(_687) != _493;
                        bool _693 = _691 || _689;
                        bool _695 = !_693;
                        _697 = _695;
                        if (_697)
                        {
                            break;
                        }
                        int _699 = _675 + 1;
                        bool _701 = _699 >= _295;
                        _673 = !_701;
                        _671 = _699;
                    } while (_673);
                }
                if (!_697)
                {
                    int _703 = _295 * 4;
                    int _705 = _295 * 8;
                    int _707 = _295 + 1;
                    bool _709 = _703 == 16;
                    bool _711 = _703 == 0;
                    uint _713 = uint(int(uint(_705) >> uint(2)));
                    _31[int(_713)] = uint(_451);
                    int _715 = _705 + 4;
                    uint _717 = uint(int(uint(_715) >> uint(2)));
                    _31[int(_717)] = uint(_493);
                    bool _719 = _703 == 4;
                    bool _721 = _703 == 8;
                    bool _723 = _703 == 12;
                    bool _725 = _703 == 20;
                    bool _727 = _703 == 24;
                    _601 = _707;
                    _655 = _705;
                    _659 = _703;
                    _729 = _705;
                    _731 = _703;
                    if (_709)
                    {
                        _501 = 1;
                    }
                    int _733 = _501;
                    bool _735 = _703 == 44;
                    _611 = _733;
                    _737 = _733;
                    if (_711)
                    {
                        _503 = 1;
                    }
                    int _739 = _503;
                    bool _741 = _703 == 28;
                    _603 = _739;
                    _743 = _739;
                    if (_719)
                    {
                        _505 = 1;
                    }
                    int _745 = _505;
                    bool _747 = _703 == 32;
                    _605 = _745;
                    _749 = _745;
                    if (_721)
                    {
                        _507 = 1;
                    }
                    int _751 = _507;
                    bool _753 = _703 == 36;
                    _607 = _751;
                    _755 = _751;
                    if (_723)
                    {
                        _509 = 1;
                    }
                    int _757 = _509;
                    bool _759 = _703 == 40;
                    _609 = _757;
                    _761 = _757;
                    if (_725)
                    {
                        _511 = 1;
                    }
                    int _763 = _511;
                    bool _765 = _703 == 48;
                    _613 = _763;
                    _767 = _763;
                    if (_727)
                    {
                        _513 = 1;
                    }
                    int _769 = _513;
                    bool _771 = _703 == 52;
                    _615 = _769;
                    _773 = _769;
                    if (_735)
                    {
                        _515 = 1;
                    }
                    int _775 = _515;
                    bool _777 = _703 == 72;
                    _625 = _775;
                    _779 = _775;
                    if (_741)
                    {
                        _517 = 1;
                    }
                    int _781 = _517;
                    bool _783 = _703 == 56;
                    _617 = _781;
                    _785 = _781;
                    if (_747)
                    {
                        _519 = 1;
                    }
                    int _787 = _519;
                    bool _789 = _703 == 60;
                    _619 = _787;
                    _791 = _787;
                    if (_753)
                    {
                        _521 = 1;
                    }
                    int _793 = _521;
                    bool _795 = _703 == 64;
                    _621 = _793;
                    _797 = _793;
                    if (_759)
                    {
                        _523 = 1;
                    }
                    int _799 = _523;
                    bool _801 = _703 == 68;
                    _623 = _799;
                    _803 = _799;
                    if (_765)
                    {
                        _525 = 1;
                    }
                    int _805 = _525;
                    bool _807 = _703 == 76;
                    _627 = _805;
                    _809 = _805;
                    if (_771)
                    {
                        _527 = 1;
                    }
                    int _811 = _527;
                    bool _813 = _703 == 80;
                    _629 = _811;
                    _815 = _811;
                    if (_777)
                    {
                        _529 = 1;
                    }
                    int _817 = _529;
                    _819 = _707 != 25;
                    _639 = _817;
                    _821 = _817;
                    if (_783)
                    {
                        _531 = 1;
                    }
                    int _823 = _531;
                    _631 = _823;
                    _825 = _823;
                    if (_789)
                    {
                        _533 = 1;
                    }
                    int _827 = _533;
                    bool _829 = _703 == 84;
                    _633 = _827;
                    _831 = _827;
                    if (_795)
                    {
                        _535 = 1;
                    }
                    int _833 = _535;
                    bool _835 = _703 == 88;
                    _635 = _833;
                    _837 = _833;
                    if (_801)
                    {
                        _537 = 1;
                    }
                    int _839 = _537;
                    bool _841 = _703 == 92;
                    _637 = _839;
                    _843 = _839;
                    if (_807)
                    {
                        _539 = 1;
                    }
                    int _845 = _539;
                    bool _847 = _703 == 96;
                    _641 = _845;
                    _849 = _845;
                    if (_813)
                    {
                        _541 = 1;
                    }
                    int _851 = _541;
                    _643 = _851;
                    _853 = _851;
                    if (_829)
                    {
                        _543 = 1;
                    }
                    int _855 = _543;
                    _645 = _855;
                    _857 = _855;
                    if (_835)
                    {
                        _545 = 1;
                    }
                    int _859 = _545;
                    _647 = _859;
                    _861 = _859;
                    if (_841)
                    {
                        _547 = 1;
                    }
                    int _863 = _547;
                    _649 = _863;
                    _865 = _863;
                    if (_847)
                    {
                        _549 = 1;
                    }
                    int _867 = _549;
                    _651 = _867;
                    _869 = _867;
                }
                if ((!_819) || _697)
                {
                    if (!_697)
                    {
                        _871 = 25;
                        _873 = true;
                        if (_873)
                        {
                            break;
                        }
                    }
                    _697 = false;
                    int _875 = _675 * 4;
                    bool _877 = _875 == 0;
                    bool _879 = _875 == 4;
                    bool _881 = _875 == 8;
                    bool _883 = _875 == 12;
                    bool _885 = _875 == 88;
                    bool _887 = _875 == 92;
                    bool _889 = _875 == 96;
                    if (_877)
                    {
                        _551 = _297;
                    }
                    int _891 = _551;
                    bool _893 = _875 == 16;
                    int _895 = _891;
                    if (_879)
                    {
                        _895 = _299;
                    }
                    int _897 = _895;
                    bool _899 = _875 == 20;
                    int _901 = _897;
                    if (_881)
                    {
                        _901 = _301;
                    }
                    int _903 = _901;
                    bool _905 = _875 == 24;
                    int _907 = _903;
                    if (_883)
                    {
                        _907 = _303;
                    }
                    int _909 = _907;
                    bool _911 = _875 == 84;
                    int _913 = int(_905);
                    int _915 = _899 ? 2 : 0;
                    int _917 = _913 | _915;
                    int _919 = _893 ? 4 : 0;
                    int _921 = _917 | _919;
                    int _923 = _911 ? 8 : 0;
                    int _925 = _921 | _923;
                    int _927 = _885 ? 16 : 0;
                    int _929 = _925 | _927;
                    int _931 = _887 ? 32 : 0;
                    int _933 = _929 | _931;
                    int _935 = _889 ? 64 : 0;
                    int _937 = _933 | _935;
                    int _939 = _937 & 8;
                    int _941 = _909;
                    _653 = _939;
                    if (_893)
                    {
                        _941 = _305;
                    }
                    int _943 = _941;
                    bool _945 = _875 == 80;
                    int _947 = _943;
                    if (_899)
                    {
                        _947 = _307;
                    }
                    int _949 = _947;
                    bool _951 = _875 == 76;
                    int _953 = _949;
                    if (_905)
                    {
                        _953 = _309;
                    }
                    int _955 = _953;
                    bool _957 = _875 == 28;
                    int _959 = int(_957);
                    int _961 = _951 ? 2 : 0;
                    int _963 = _959 | _961;
                    int _965 = _945 ? 4 : 0;
                    int _967 = _963 | _965;
                    int _969 = _911 ? 8 : 0;
                    int _971 = _967 | _969;
                    int _973 = _885 ? 16 : 0;
                    int _975 = _971 | _973;
                    int _977 = _887 ? 32 : 0;
                    int _979 = _975 | _977;
                    int _981 = _889 ? 64 : 0;
                    int _983 = _979 | _981;
                    int _985 = _983 & 2;
                    int _987 = int(_957);
                    int _989 = _951 ? 2 : 0;
                    int _991 = _987 | _989;
                    int _993 = _945 ? 4 : 0;
                    int _995 = _991 | _993;
                    int _997 = _911 ? 8 : 0;
                    int _999 = _995 | _997;
                    int _1001 = _885 ? 16 : 0;
                    int _1003 = _999 | _1001;
                    int _1005 = _887 ? 32 : 0;
                    int _1007 = _1003 | _1005;
                    int _1009 = _889 ? 64 : 0;
                    int _1011 = _1007 | _1009;
                    int _1013 = _1011 & 4;
                    int _1015 = _955;
                    _655 = _985;
                    _659 = _1013;
                    if (_957)
                    {
                        _1015 = _311;
                    }
                    int _1017 = _1015;
                    bool _1019 = _875 == 32;
                    int _1021 = _1017;
                    if (_1019)
                    {
                        _1021 = _313;
                    }
                    int _1023 = _1021;
                    bool _1025 = _875 == 36;
                    int _1027 = _1023;
                    if (_1025)
                    {
                        _1027 = _315;
                    }
                    int _1029 = _1027;
                    bool _1031 = _875 == 40;
                    int _1033 = _1029;
                    if (_1031)
                    {
                        _1033 = _317;
                    }
                    int _1035 = _1033;
                    bool _1037 = _875 == 44;
                    int _1039 = _1035;
                    if (_1037)
                    {
                        _1039 = _319;
                    }
                    int _1041 = _1039;
                    bool _1043 = _875 == 48;
                    int _1045 = _1041;
                    if (_1043)
                    {
                        _1045 = _321;
                    }
                    int _1047 = _1045;
                    bool _1049 = _875 == 52;
                    int _1051 = _1047;
                    if (_1049)
                    {
                        _1051 = _323;
                    }
                    int _1053 = _1051;
                    bool _1055 = _875 == 56;
                    int _1057 = _1053;
                    if (_1055)
                    {
                        _1057 = _325;
                    }
                    int _1059 = _1057;
                    bool _1061 = _875 == 60;
                    int _1063 = _1059;
                    if (_1061)
                    {
                        _1063 = _327;
                    }
                    int _1065 = _1063;
                    bool _1067 = _875 == 64;
                    int _1069 = _1065;
                    if (_1067)
                    {
                        _1069 = _329;
                    }
                    int _1071 = _1069;
                    bool _1073 = _875 == 68;
                    int _1075 = _1071;
                    if (_1073)
                    {
                        _1075 = _331;
                    }
                    int _1077 = _1075;
                    bool _1079 = _875 == 72;
                    int _1081 = int(_1079);
                    int _1083 = _951 ? 2 : 0;
                    int _1085 = _1081 | _1083;
                    int _1087 = _945 ? 4 : 0;
                    int _1089 = _1085 | _1087;
                    int _1091 = _911 ? 8 : 0;
                    int _1093 = _1089 | _1091;
                    int _1095 = _885 ? 16 : 0;
                    int _1097 = _1093 | _1095;
                    int _1099 = _887 ? 32 : 0;
                    int _1101 = _1097 | _1099;
                    int _1103 = _889 ? 64 : 0;
                    int _1105 = _1101 | _1103;
                    int _1107 = _1105 & 1;
                    int _1109 = _1077;
                    if (_1079)
                    {
                        _1109 = _333;
                    }
                    int _1111 = _1109;
                    bool _1113 = _875 == 4;
                    int _1115 = _1111;
                    if (_951)
                    {
                        _1115 = _335;
                    }
                    int _1117 = _1115;
                    bool _1119 = _875 == 0;
                    int _1121 = _1117;
                    if (_945)
                    {
                        _1121 = _337;
                    }
                    int _1123 = _1121;
                    bool _1125 = _875 == 12;
                    int _1127 = _1123;
                    if (_911)
                    {
                        _1127 = _339;
                    }
                    int _1129 = _1127;
                    bool _1131 = _875 == 8;
                    int _1133 = _1129;
                    if (_885)
                    {
                        _1133 = _341;
                    }
                    int _1135 = _1133;
                    int _1137 = _1135;
                    if (_887)
                    {
                        _1137 = _343;
                    }
                    int _1139 = _1137;
                    int _1141 = _1139;
                    if (_889)
                    {
                        _1141 = _345;
                    }
                    int _1143 = _1141;
                    int _1145 = _1143 + 1;
                    _657 = _1145;
                    if (_1119)
                    {
                        _553 = _1145;
                    }
                    int _1147 = _553;
                    bool _1149 = _875 == 16;
                    _603 = _1147;
                    if (_1113)
                    {
                        _555 = _1145;
                    }
                    int _1151 = _555;
                    bool _1153 = _875 == 20;
                    _605 = _1151;
                    if (_1131)
                    {
                        _557 = _1145;
                    }
                    int _1155 = _557;
                    bool _1157 = _875 == 24;
                    _607 = _1155;
                    if (_1125)
                    {
                        _559 = _1145;
                    }
                    int _1159 = _559;
                    bool _1161 = _875 == 28;
                    _609 = _1159;
                    if (_885)
                    {
                        _561 = _1145;
                    }
                    int _1163 = _561;
                    _647 = _1163;
                    if (_887)
                    {
                        _563 = _1145;
                    }
                    int _1165 = _563;
                    _649 = _1165;
                    if (_889)
                    {
                        _565 = _1145;
                    }
                    int _1167 = _565;
                    _651 = _1167;
                    if (_1149)
                    {
                        _567 = _1145;
                    }
                    int _1169 = _567;
                    bool _1171 = _875 == 32;
                    _611 = _1169;
                    if (_1153)
                    {
                        _569 = _1145;
                    }
                    int _1173 = _569;
                    bool _1175 = _875 == 36;
                    _613 = _1173;
                    if (_1157)
                    {
                        _571 = _1145;
                    }
                    int _1177 = _571;
                    bool _1179 = _875 == 40;
                    _615 = _1177;
                    if (_1161)
                    {
                        _573 = _1145;
                    }
                    int _1181 = _573;
                    bool _1183 = _875 == 44;
                    _617 = _1181;
                    if (_1171)
                    {
                        _575 = _1145;
                    }
                    int _1185 = _575;
                    bool _1187 = _875 == 48;
                    _619 = _1185;
                    if (_1175)
                    {
                        _577 = _1145;
                    }
                    int _1189 = _577;
                    bool _1191 = _875 == 52;
                    _621 = _1189;
                    if (_1179)
                    {
                        _579 = _1145;
                    }
                    int _1193 = _579;
                    bool _1195 = _875 == 56;
                    _623 = _1193;
                    if (_1183)
                    {
                        _581 = _1145;
                    }
                    int _1197 = _581;
                    bool _1199 = _875 == 60;
                    _625 = _1197;
                    if (_1187)
                    {
                        _583 = _1145;
                    }
                    int _1201 = _583;
                    bool _1203 = _875 == 64;
                    _627 = _1201;
                    if (_1191)
                    {
                        _585 = _1145;
                    }
                    int _1205 = _585;
                    bool _1207 = _875 == 68;
                    _629 = _1205;
                    if (_1195)
                    {
                        _587 = _1145;
                    }
                    int _1209 = _587;
                    bool _1211 = _939 != 0;
                    _631 = _1209;
                    if (_1199)
                    {
                        _589 = _1145;
                    }
                    int _1213 = _589;
                    bool _1215 = _1013 != 0;
                    _633 = _1213;
                    if (_1203)
                    {
                        _591 = _1145;
                    }
                    int _1217 = _591;
                    _635 = _1217;
                    if (_1207)
                    {
                        _593 = _1145;
                    }
                    int _1219 = _593;
                    bool _1221 = _985 != 0;
                    _637 = _1219;
                    if (_1211)
                    {
                        _595 = _1145;
                    }
                    int _1223 = _595;
                    bool _1225 = _1107 != 0;
                    _645 = _1223;
                    if (_1215)
                    {
                        _597 = _1145;
                    }
                    int _1227 = _597;
                    _643 = _1227;
                    if (_1221)
                    {
                        _599 = _1145;
                    }
                    int _1229 = _599;
                    _641 = _1229;
                    if (_1225)
                    {
                        _639 = _1145;
                    }
                }
            }
            _1231 = _601;
            int _1233 = _603;
            int _1235 = _605;
            int _1237 = _607;
            int _1239 = _609;
            int _1241 = _611;
            int _1243 = _613;
            int _1245 = _615;
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
            int _1291 = _347 + 1;
            bool _1293 = _1291 >= 3;
            _283 = !_1293;
            _229 = _1231;
            _231 = _1233;
            _233 = _1235;
            _235 = _1237;
            _237 = _1239;
            _239 = _1241;
            _241 = _1243;
            _243 = _1245;
            _245 = _1247;
            _247 = _1249;
            _249 = _1251;
            _251 = _1253;
            _253 = _1255;
            _255 = _1257;
            _257 = _1259;
            _259 = _1261;
            _261 = _1263;
            _263 = _1265;
            _265 = _1267;
            _267 = _1269;
            _269 = _1271;
            _271 = _1273;
            _273 = _1275;
            _275 = _1277;
            _277 = _1279;
            _279 = _1281;
            _281 = _1291;
            _743 = _1233;
            _749 = _1235;
            _755 = _1237;
            _761 = _1239;
            _737 = _1241;
            _767 = _1243;
            _773 = _1245;
            _785 = _1247;
            _791 = _1249;
            _797 = _1251;
            _803 = _1253;
            _779 = _1255;
            _809 = _1257;
            _815 = _1259;
            _825 = _1261;
            _831 = _1263;
            _837 = _1265;
            _843 = _1267;
            _821 = _1269;
            _849 = _1271;
            _853 = _1273;
            _857 = _1275;
            _861 = _1277;
            _865 = _1279;
            _869 = _1281;
            _661 = _1283;
            _729 = _1285;
            _663 = _1287;
            _731 = _1289;
        } while (_283);
        if (!_873)
        {
            _871 = _1231;
        }
        _873 = false;
        _1295 = _743;
        _1297 = _749;
        _1299 = _755;
        _1301 = _761;
        _1303 = _737;
        _1305 = _767;
        _1307 = _773;
        _1309 = _785;
        _1311 = _791;
        _1313 = _797;
        _1315 = _803;
        _1317 = _779;
        _1319 = _809;
        _1321 = _815;
        _1323 = _825;
        _1325 = _831;
        _1327 = _837;
        _1329 = _843;
        _1331 = _821;
        _1333 = _849;
        _1335 = _853;
        _1337 = _857;
        _1339 = _861;
        _1341 = _865;
        _1343 = _869;
        _1345 = _871;
        int _1347 = _661;
        int _1349 = _729;
        int _1351 = _663;
        int _1353 = _731;
        int _1355 = _147 + 1;
        bool _1357 = _1355 >= 3;
        _145 = !_1357;
        _89 = _1355;
        _91 = _1345;
        _93 = _1295;
        _95 = _1297;
        _97 = _1299;
        _99 = _1301;
        _101 = _1303;
        _103 = _1305;
        _105 = _1307;
        _107 = _1309;
        _109 = _1311;
        _111 = _1313;
        _113 = _1315;
        _115 = _1317;
        _117 = _1319;
        _119 = _1321;
        _121 = _1323;
        _123 = _1325;
        _125 = _1327;
        _127 = _1329;
        _129 = _1331;
        _131 = _1333;
        _133 = _1335;
        _135 = _1337;
        _137 = _1339;
        _139 = _1341;
        _141 = _1343;
        _1359 = _1347;
        _1361 = _1349;
        _1363 = _1351;
        _1365 = _1353;
        _1367 = _1347;
        _1369 = _1295;
    } while (_145);
    bool _1371 = _1345 > 0;
    if (!_1371)
    {
        _665 = 0;
    }
    int _1373 = _665;
    bool _1375 = !_1371;
    int _1377 = _1373;
    if (!_1375)
    {
        bool _1379 = _1345 > 3;
        bool _1381 = !_1379;
        int _1383 = 0;
        int _1385 = 0;
        int _1387 = 0;
        int _1389 = 0;
        int _1391 = 0;
        int _1393 = -1;
        int _1395 = 0;
        if (!_1381)
        {
            int _1397 = _1345 + (-3);
            _1393 = 0;
            bool _1399;
            do
            {
                int _1401 = _1383;
                int _1403 = _1385;
                int _1405 = _1359;
                int _1407 = _1361;
                int _1409 = _1363;
                int _1411 = _1387;
                int _1413 = _1365;
                int _1415 = _1401 * 4;
                int _1417 = _1401 + 1;
                int _1419 = _1401 + 2;
                bool _1421 = _1415 == 0;
                int _1423 = _1417 * 4;
                bool _1425 = _1415 == 4;
                int _1427 = _1419 * 4;
                bool _1429 = _1415 == 8;
                bool _1431 = _1415 == 12;
                bool _1433 = _1415 == 16;
                bool _1435 = _1423 == 8;
                int _1437 = _1401 + 3;
                int _1439 = _1405;
                int _1441 = _1407;
                int _1443 = _1409;
                int _1445 = _1413;
                int _1447 = _1403;
                int _1449 = _1411;
                if (_1421)
                {
                    _1439 = _1295;
                }
                int _1451 = _1439;
                bool _1453 = _1415 == 24;
                int _1455 = _1451;
                if (_1425)
                {
                    _1455 = _1297;
                }
                int _1457 = _1455;
                bool _1459 = _1415 == 20;
                int _1461 = _1457;
                if (_1429)
                {
                    _1461 = _1299;
                }
                int _1463 = _1461;
                bool _1465 = _1415 == 32;
                int _1467 = _1463;
                if (_1431)
                {
                    _1467 = _1301;
                }
                int _1469 = _1467;
                bool _1471 = _1415 == 28;
                int _1473 = _1469;
                if (_1433)
                {
                    _1473 = _1303;
                }
                int _1475 = _1473;
                bool _1477 = _1415 == 40;
                int _1479 = _1437 * 4;
                int _1481 = _1475;
                if (_1459)
                {
                    _1481 = _1305;
                }
                int _1483 = _1481;
                bool _1485 = _1415 == 36;
                int _1487 = _1483;
                if (_1453)
                {
                    _1487 = _1307;
                }
                int _1489 = _1487;
                bool _1491 = _1423 == 0;
                int _1493 = _1489;
                if (_1471)
                {
                    _1493 = _1309;
                }
                int _1495 = _1493;
                bool _1497 = _1423 == 4;
                int _1499 = _1495;
                if (_1465)
                {
                    _1499 = _1311;
                }
                int _1501 = _1499;
                bool _1503 = _1423 == 12;
                int _1505 = _1501;
                if (_1485)
                {
                    _1505 = _1313;
                }
                int _1507 = _1505;
                bool _1509 = _1415 == 44;
                int _1511 = _1507;
                if (_1477)
                {
                    _1511 = _1315;
                }
                int _1513 = _1511;
                bool _1515 = _1423 == 16;
                int _1517 = _1513;
                if (_1491)
                {
                    _1441 = _1295;
                }
                int _1519 = _1441;
                bool _1521 = _1415 == 48;
                int _1523 = _1519;
                if (_1497)
                {
                    _1523 = _1297;
                }
                int _1525 = _1523;
                int _1527 = _1525;
                if (_1435)
                {
                    _1527 = _1299;
                }
                int _1529 = _1527;
                bool _1531 = _1423 == 20;
                int _1533 = _1529;
                if (_1503)
                {
                    _1533 = _1301;
                }
                int _1535 = _1533;
                bool _1537 = _1423 == 24;
                bool _1539 = _1423 == 28;
                int _1541 = _1535;
                if (_1509)
                {
                    _1517 = _1317;
                }
                int _1543 = _1517;
                bool _1545 = _1415 == 52;
                int _1547 = _1543;
                if (_1515)
                {
                    _1541 = _1303;
                }
                int _1549 = _1541;
                bool _1551 = _1423 == 32;
                int _1553 = _1549;
                if (_1521)
                {
                    _1547 = _1319;
                }
                int _1555 = _1547;
                bool _1557 = _1415 == 56;
                int _1559 = _1555;
                if (_1531)
                {
                    _1553 = _1305;
                }
                int _1561 = _1553;
                bool _1563 = _1423 == 36;
                int _1565 = _1561;
                if (_1537)
                {
                    _1565 = _1307;
                }
                int _1567 = _1565;
                bool _1569 = _1423 == 40;
                int _1571 = _1567;
                if (_1539)
                {
                    _1571 = _1309;
                }
                int _1573 = _1571;
                bool _1575 = _1423 == 44;
                int _1577 = _1573;
                if (_1545)
                {
                    _1559 = _1321;
                }
                int _1579 = _1559;
                bool _1581 = _1415 == 60;
                int _1583 = _1579;
                if (_1551)
                {
                    _1577 = _1311;
                }
                int _1585 = _1577;
                bool _1587 = _1423 == 48;
                int _1589 = _1585;
                if (_1557)
                {
                    _1583 = _1323;
                }
                int _1591 = _1583;
                bool _1593 = _1415 == 64;
                int _1595 = _1591;
                if (_1563)
                {
                    _1589 = _1313;
                }
                int _1597 = _1589;
                bool _1599 = _1423 == 52;
                int _1601 = _1597;
                if (_1569)
                {
                    _1601 = _1315;
                }
                int _1603 = _1601;
                bool _1605 = _1423 == 56;
                int _1607 = _1603;
                if (_1575)
                {
                    _1607 = _1317;
                }
                int _1609 = _1607;
                bool _1611 = _1423 == 60;
                int _1613 = _1609;
                if (_1581)
                {
                    _1595 = _1325;
                }
                int _1615 = _1595;
                bool _1617 = _1427 == 0;
                int _1619 = _1615;
                if (_1587)
                {
                    _1613 = _1319;
                }
                int _1621 = _1613;
                bool _1623 = _1415 == 68;
                int _1625 = _1621;
                if (_1593)
                {
                    _1619 = _1327;
                }
                int _1627 = _1619;
                bool _1629 = _1427 == 4;
                int _1631 = _1627;
                if (_1599)
                {
                    _1625 = _1321;
                }
                int _1633 = _1625;
                bool _1635 = _1427 == 8;
                int _1637 = _1633;
                if (_1605)
                {
                    _1637 = _1323;
                }
                int _1639 = _1637;
                bool _1641 = _1427 == 12;
                int _1643 = _1639;
                if (_1611)
                {
                    _1643 = _1325;
                }
                int _1645 = _1643;
                bool _1647 = _1427 == 16;
                int _1649 = _1645;
                if (_1617)
                {
                    _1443 = _1295;
                }
                int _1651 = _1443;
                bool _1653 = _1423 == 64;
                int _1655 = _1651;
                if (_1623)
                {
                    _1631 = _1329;
                }
                int _1657 = _1631;
                bool _1659 = _1427 == 20;
                int _1661 = _1657;
                if (_1629)
                {
                    _1655 = _1297;
                }
                int _1663 = _1655;
                bool _1665 = _1415 == 72;
                int _1667 = _1663;
                if (_1635)
                {
                    _1667 = _1299;
                }
                int _1669 = _1667;
                bool _1671 = _1427 == 24;
                int _1673 = _1669;
                if (_1641)
                {
                    _1673 = _1301;
                }
                int _1675 = _1673;
                bool _1677 = _1427 == 28;
                int _1679 = _1675;
                if (_1647)
                {
                    _1679 = _1303;
                }
                int _1681 = _1679;
                int _1683 = _1681;
                if (_1653)
                {
                    _1649 = _1327;
                }
                int _1685 = _1649;
                bool _1687 = _1423 == 68;
                int _1689 = _1685;
                if (_1659)
                {
                    _1683 = _1305;
                }
                int _1691 = _1683;
                bool _1693 = _1427 == 32;
                int _1695 = _1691;
                if (_1665)
                {
                    _1661 = _1331;
                }
                int _1697 = _1661;
                bool _1699 = _1427 == 36;
                bool _1701 = _1415 == 76;
                int _1703 = _1697;
                if (_1671)
                {
                    _1695 = _1307;
                }
                int _1705 = _1695;
                bool _1707 = _1427 == 40;
                int _1709 = _1705;
                if (_1677)
                {
                    _1709 = _1309;
                }
                int _1711 = _1709;
                bool _1713 = _1427 == 44;
                int _1715 = _1711;
                if (_1687)
                {
                    _1689 = _1329;
                }
                int _1717 = _1689;
                bool _1719 = _1423 == 72;
                int _1721 = _1717;
                if (_1693)
                {
                    _1715 = _1311;
                }
                int _1723 = _1715;
                bool _1725 = _1427 == 48;
                int _1727 = _1723;
                if (_1699)
                {
                    _1727 = _1313;
                }
                int _1729 = _1727;
                bool _1731 = _1427 == 52;
                int _1733 = _1729;
                if (_1701)
                {
                    _1703 = _1333;
                }
                int _1735 = _1703;
                bool _1737 = _1415 == 80;
                int _1739 = _1735;
                if (_1707)
                {
                    _1733 = _1315;
                }
                int _1741 = _1733;
                bool _1743 = _1427 == 56;
                int _1745 = _1741;
                if (_1713)
                {
                    _1745 = _1317;
                }
                int _1747 = _1745;
                bool _1749 = _1427 == 60;
                int _1751 = _1747;
                if (_1719)
                {
                    _1721 = _1331;
                }
                int _1753 = _1721;
                bool _1755 = _1427 == 64;
                int _1757 = _1753;
                if (_1725)
                {
                    _1751 = _1319;
                }
                int _1759 = _1751;
                bool _1761 = _1423 == 76;
                int _1763 = _1759;
                if (_1731)
                {
                    _1763 = _1321;
                }
                int _1765 = _1763;
                bool _1767 = _1415 == 84;
                int _1769 = _1765;
                if (_1737)
                {
                    _1739 = _1335;
                }
                int _1771 = _1739;
                bool _1773 = _1427 == 68;
                int _1775 = _1771;
                if (_1743)
                {
                    _1769 = _1323;
                }
                int _1777 = _1769;
                bool _1779 = _1427 == 72;
                int _1781 = _1777;
                if (_1749)
                {
                    _1781 = _1325;
                }
                int _1783 = _1781;
                bool _1785 = _1427 == 76;
                int _1787 = _1783;
                if (_1755)
                {
                    _1787 = _1327;
                }
                int _1789 = _1787;
                bool _1791 = _1479 == 0;
                int _1793 = _1789;
                if (_1761)
                {
                    _1757 = _1333;
                }
                int _1795 = _1757;
                bool _1797 = _1423 == 80;
                int _1799 = _1795;
                if (_1767)
                {
                    _1775 = _1337;
                }
                int _1801 = _1775;
                bool _1803 = _1479 == 4;
                int _1805 = _1801;
                if (_1773)
                {
                    _1793 = _1329;
                }
                int _1807 = _1793;
                bool _1809 = _1427 == 80;
                int _1811 = _1807;
                if (_1779)
                {
                    _1811 = _1331;
                }
                int _1813 = _1811;
                bool _1815 = _1479 == 8;
                int _1817 = _1813;
                if (_1785)
                {
                    _1817 = _1333;
                }
                int _1819 = _1817;
                bool _1821 = _1415 == 88;
                int _1823 = _1819;
                if (_1791)
                {
                    _1445 = _1295;
                }
                int _1825 = _1445;
                bool _1827 = _1479 == 12;
                int _1829 = _1825;
                if (_1797)
                {
                    _1799 = _1335;
                }
                int _1831 = _1799;
                bool _1833 = _1423 == 84;
                int _1835 = _1831;
                if (_1803)
                {
                    _1829 = _1297;
                }
                int _1837 = _1829;
                int _1839 = _1837;
                if (_1809)
                {
                    _1823 = _1335;
                }
                int _1841 = _1823;
                bool _1843 = _1427 == 84;
                int _1845 = _1841;
                if (_1815)
                {
                    _1839 = _1299;
                }
                int _1847 = _1839;
                bool _1849 = _1479 == 16;
                int _1851 = _1847;
                if (_1821)
                {
                    _1805 = _1339;
                }
                int _1853 = _1805;
                bool _1855 = _1415 == 92;
                bool _1857 = _1479 == 20;
                int _1859 = _1853;
                if (_1827)
                {
                    _1851 = _1301;
                }
                int _1861 = _1851;
                bool _1863 = _1423 == 88;
                int _1865 = _1861;
                if (_1833)
                {
                    _1835 = _1337;
                }
                int _1867 = _1835;
                bool _1869 = _1479 == 24;
                int _1871 = _1867;
                if (_1843)
                {
                    _1845 = _1337;
                }
                int _1873 = _1845;
                bool _1875 = _1427 == 88;
                int _1877 = _1873;
                if (_1849)
                {
                    _1865 = _1303;
                }
                int _1879 = _1865;
                bool _1881 = _1479 == 28;
                int _1883 = _1879;
                if (_1855)
                {
                    _1859 = _1341;
                }
                int _1885 = _1859;
                bool _1887 = _1479 == 32;
                int _1889 = _1885;
                if (_1857)
                {
                    _1883 = _1305;
                }
                int _1891 = _1883;
                bool _1893 = _1415 == 96;
                int _1895 = _1891;
                if (_1863)
                {
                    _1871 = _1339;
                }
                int _1897 = _1871;
                bool _1899 = _1479 == 40;
                int _1901 = _1897;
                if (_1869)
                {
                    _1895 = _1307;
                }
                int _1903 = _1895;
                bool _1905 = _1479 == 36;
                int _1907 = _1903;
                if (_1875)
                {
                    _1877 = _1339;
                }
                int _1909 = _1877;
                bool _1911 = _1423 == 92;
                int _1913 = _1909;
                if (_1881)
                {
                    _1907 = _1309;
                }
                int _1915 = _1907;
                bool _1917 = _1479 == 44;
                int _1919 = _1915;
                if (_1887)
                {
                    _1919 = _1311;
                }
                int _1921 = _1919;
                bool _1923 = _1479 == 48;
                int _1925 = _1921;
                if (_1893)
                {
                    _1889 = _1343;
                }
                int _1927 = _1889;
                bool _1929 = _1423 == 96;
                int _1931 = _1927;
                if (_1905)
                {
                    _1925 = _1313;
                }
                int _1933 = _1925;
                bool _1935 = _1479 == 52;
                int _1937 = _1933;
                if (_1899)
                {
                    _1937 = _1315;
                }
                int _1939 = _1937;
                bool _1941 = _1403 >= _1927;
                int _1943 = _1939;
                if (_1911)
                {
                    _1901 = _1341;
                }
                int _1945 = _1901;
                bool _1947 = _1479 == 56;
                int _1949 = _1945;
                if (_1917)
                {
                    _1943 = _1317;
                }
                int _1951 = _1943;
                bool _1953 = _1479 == 60;
                int _1955 = _1951;
                if (_1923)
                {
                    _1955 = _1319;
                }
                int _1957 = _1955;
                bool _1959 = _1479 == 64;
                int _1961 = _1957;
                if (_1929)
                {
                    _1949 = _1343;
                }
                int _1963 = _1949;
                bool _1965 = _1427 == 92;
                _1361 = _1963;
                if (_1935)
                {
                    _1961 = _1321;
                }
                int _1967 = _1961;
                bool _1969 = _1479 == 68;
                int _1971 = _1967;
                if (!_1941)
                {
                    _1447 = _1927;
                }
                int _1973 = _1447;
                int _1975 = _1973;
                if (_1947)
                {
                    _1971 = _1323;
                }
                int _1977 = _1971;
                bool _1979 = _1479 == 72;
                int _1981 = _1977;
                if (_1953)
                {
                    _1981 = _1325;
                }
                int _1983 = _1981;
                bool _1985 = _1973 >= _1963;
                int _1987 = _1983;
                if (_1959)
                {
                    _1987 = _1327;
                }
                int _1989 = _1987;
                int _1991 = _1989;
                if (_1965)
                {
                    _1913 = _1341;
                }
                int _1993 = _1913;
                bool _1995 = _1427 == 96;
                bool _1997 = _1479 == 76;
                int _1999 = _1993;
                if (_1969)
                {
                    _1991 = _1329;
                }
                int _2001 = _1991;
                bool _2003 = _1479 == 80;
                int _2005 = _2001;
                if (_1979)
                {
                    _2005 = _1331;
                }
                int _2007 = _2005;
                bool _2009 = _1479 == 84;
                int _2011 = _2007;
                if (_1985)
                {
                    _1931 = _1973;
                }
                int _2013 = _1931;
                int _2015 = _2013;
                if (!_1985)
                {
                    _2015 = _1963;
                }
                int _2017 = _2015;
                int _2019 = _2017;
                if (_1995)
                {
                    _1999 = _1343;
                }
                int _2021 = _1999;
                bool _2023 = _1479 == 88;
                _1363 = _2021;
                if (_1997)
                {
                    _2011 = _1333;
                }
                int _2025 = _2011;
                bool _2027 = _1479 == 92;
                int _2029 = _2025;
                if (_2003)
                {
                    _2029 = _1335;
                }
                int _2031 = _2029;
                bool _2033 = _2017 >= _2021;
                int _2035 = _2031;
                if (_1941)
                {
                    _1975 = _1411;
                }
                int _2037 = _1975;
                int _2039 = _2037;
                if (_2009)
                {
                    _2035 = _1337;
                }
                int _2041 = _2035;
                bool _2043 = _1479 == 96;
                int _2045 = _2041;
                if (!_1941)
                {
                    _2039 = _1401;
                }
                int _2047 = _2039;
                int _2049 = _1401 + 4;
                _1383 = _2049;
                int _2051 = _2047;
                _1389 = _2049;
                if (!_1985)
                {
                    _2051 = _1417;
                }
                int _2053 = _2051;
                int _2055 = _2053;
                if (_2023)
                {
                    _2045 = _1339;
                }
                int _2057 = _2045;
                bool _2059 = _2049 >= _1397;
                int _2061 = _2057;
                if (_2027)
                {
                    _2061 = _1341;
                }
                int _2063 = _2061;
                int _2065 = _2063;
                if (!_2033)
                {
                    _2019 = _2021;
                }
                int _2067 = _2019;
                _1359 = _2067;
                _1367 = _2067;
                if (!_2033)
                {
                    _2055 = _1419;
                }
                int _2069 = _2055;
                int _2071 = _2069;
                if (_2043)
                {
                    _2065 = _1343;
                }
                int _2073 = _2065;
                bool _2075 = _2067 >= _2073;
                _1365 = _2073;
                if (_2075)
                {
                    _1449 = _2069;
                }
                int _2077 = _1449;
                int _2079 = _2077;
                if (_2075)
                {
                    _2071 = _2067;
                }
                int _2081 = _2071;
                int _2083 = _2081;
                if (!_2075)
                {
                    _2079 = _1437;
                }
                int _2085 = _2079;
                _1387 = _2085;
                _1395 = _2085;
                if (!_2075)
                {
                    _2083 = _2073;
                }
                int _2087 = _2083;
                _1399 = !_2059;
                _1385 = _2087;
                _1391 = _2087;
            } while (_1399);
        }
        int _2089 = _1389;
        int _2091 = _1391;
        int _2093 = _1367;
        int _2095 = _1393;
        int _2097 = _1395;
        int _2099 = -_2089;
        int _2101 = _1345 + _2099;
        bool _2103 = _2101 > 1;
        bool _2105 = !_2103;
        int _2107 = _2093;
        int _2109 = _2101;
        int _2111 = _2091;
        int _2113 = _2097;
        int _2115 = _2089;
        int _2117 = _2095;
        int _2119 = _2091;
        int _2121 = _2097;
        if (!_2105)
        {
            int _2123 = _2089 * 4;
            int _2125 = _2089 + 1;
            bool _2127 = _2123 == 0;
            int _2129 = _2125 * 4;
            bool _2131 = _2123 == 4;
            bool _2133 = _2123 == 8;
            bool _2135 = _2123 == 12;
            bool _2137 = _2123 == 24;
            bool _2139 = _2129 == 0;
            bool _2141 = _2123 == 40;
            if (_2127)
            {
                _2107 = _1295;
            }
            int _2143 = _2107;
            bool _2145 = _2123 == 16;
            int _2147 = _2143;
            if (_2131)
            {
                _2147 = _1297;
            }
            int _2149 = _2147;
            bool _2151 = _2123 == 20;
            int _2153 = _2149;
            if (_2133)
            {
                _2153 = _1299;
            }
            int _2155 = _2153;
            bool _2157 = _2123 == 36;
            int _2159 = _2155;
            if (_2135)
            {
                _2159 = _1301;
            }
            int _2161 = _2159;
            bool _2163 = _2123 == 28;
            int _2165 = _2161;
            if (_2139)
            {
                _2109 = _1295;
            }
            int _2167 = _2109;
            bool _2169 = _2129 == 16;
            int _2171 = _2167;
            if (_2145)
            {
                _2165 = _1303;
            }
            int _2173 = _2165;
            bool _2175 = _2123 == 32;
            int _2177 = _2173;
            if (_2151)
            {
                _2177 = _1305;
            }
            int _2179 = _2177;
            bool _2181 = _2123 == 48;
            int _2183 = _2179;
            if (_2137)
            {
                _2183 = _1307;
            }
            int _2185 = _2183;
            bool _2187 = _2129 == 4;
            int _2189 = _2185;
            if (_2163)
            {
                _2189 = _1309;
            }
            int _2191 = _2189;
            bool _2193 = _2123 == 44;
            int _2195 = _2191;
            if (_2175)
            {
                _2195 = _1311;
            }
            int _2197 = _2195;
            bool _2199 = _2129 == 8;
            int _2201 = _2197;
            if (_2157)
            {
                _2201 = _1313;
            }
            int _2203 = _2201;
            bool _2205 = _2129 == 12;
            int _2207 = _2203;
            if (_2187)
            {
                _2171 = _1297;
            }
            int _2209 = _2171;
            bool _2211 = _2123 == 52;
            int _2213 = _2209;
            if (_2141)
            {
                _2207 = _1315;
            }
            int _2215 = _2207;
            bool _2217 = _2129 == 20;
            int _2219 = _2215;
            if (_2193)
            {
                _2219 = _1317;
            }
            int _2221 = _2219;
            bool _2223 = _2129 == 24;
            int _2225 = _2221;
            if (_2181)
            {
                _2225 = _1319;
            }
            int _2227 = _2225;
            bool _2229 = _2123 == 60;
            int _2231 = _2227;
            if (_2199)
            {
                _2213 = _1299;
            }
            int _2233 = _2213;
            bool _2235 = _2123 == 56;
            int _2237 = _2233;
            if (_2205)
            {
                _2237 = _1301;
            }
            int _2239 = _2237;
            bool _2241 = _2129 == 28;
            int _2243 = _2239;
            if (_2169)
            {
                _2243 = _1303;
            }
            int _2245 = _2243;
            bool _2247 = _2129 == 32;
            int _2249 = _2245;
            if (_2217)
            {
                _2249 = _1305;
            }
            int _2251 = _2249;
            bool _2253 = _2129 == 36;
            int _2255 = _2251;
            if (_2211)
            {
                _2231 = _1321;
            }
            int _2257 = _2231;
            bool _2259 = _2123 == 64;
            int _2261 = _2257;
            if (_2223)
            {
                _2255 = _1307;
            }
            int _2263 = _2255;
            bool _2265 = _2123 == 68;
            int _2267 = _2263;
            if (_2235)
            {
                _2261 = _1323;
            }
            int _2269 = _2261;
            bool _2271 = _2129 == 40;
            int _2273 = _2269;
            if (_2241)
            {
                _2267 = _1309;
            }
            int _2275 = _2267;
            bool _2277 = _2123 == 72;
            int _2279 = _2275;
            if (_2229)
            {
                _2273 = _1325;
            }
            int _2281 = _2273;
            bool _2283 = _2129 == 44;
            int _2285 = _2281;
            if (_2247)
            {
                _2279 = _1311;
            }
            int _2287 = _2279;
            bool _2289 = _2129 == 48;
            int _2291 = _2287;
            if (_2253)
            {
                _2291 = _1313;
            }
            int _2293 = _2291;
            bool _2295 = _2123 == 76;
            int _2297 = _2293;
            if (_2259)
            {
                _2285 = _1327;
            }
            int _2299 = _2285;
            bool _2301 = _2129 == 52;
            int _2303 = _2299;
            if (_2265)
            {
                _2303 = _1329;
            }
            int _2305 = _2303;
            bool _2307 = _2123 == 80;
            int _2309 = _2305;
            if (_2271)
            {
                _2297 = _1315;
            }
            int _2311 = _2297;
            bool _2313 = _2129 == 56;
            int _2315 = _2311;
            if (_2277)
            {
                _2309 = _1331;
            }
            int _2317 = _2309;
            int _2319 = _2317;
            if (_2283)
            {
                _2315 = _1317;
            }
            int _2321 = _2315;
            bool _2323 = _2123 == 84;
            int _2325 = _2321;
            if (_2289)
            {
                _2325 = _1319;
            }
            int _2327 = _2325;
            bool _2329 = _2129 == 60;
            int _2331 = _2327;
            if (_2295)
            {
                _2319 = _1333;
            }
            int _2333 = _2319;
            bool _2335 = _2123 == 88;
            int _2337 = _2333;
            if (_2301)
            {
                _2331 = _1321;
            }
            int _2339 = _2331;
            bool _2341 = _2129 == 64;
            int _2343 = _2339;
            if (_2307)
            {
                _2337 = _1335;
            }
            int _2345 = _2337;
            bool _2347 = _2123 == 92;
            int _2349 = _2345;
            if (_2313)
            {
                _2343 = _1323;
            }
            int _2351 = _2343;
            bool _2353 = _2129 == 68;
            bool _2355 = _2129 == 72;
            int _2357 = _2351;
            if (_2323)
            {
                _2349 = _1337;
            }
            int _2359 = _2349;
            bool _2361 = _2123 == 96;
            int _2363 = _2359;
            if (_2329)
            {
                _2357 = _1325;
            }
            int _2365 = _2357;
            bool _2367 = _2129 == 76;
            int _2369 = _2365;
            if (_2335)
            {
                _2363 = _1339;
            }
            int _2371 = _2363;
            int _2373 = _2371;
            if (_2341)
            {
                _2369 = _1327;
            }
            int _2375 = _2369;
            bool _2377 = _2129 == 80;
            int _2379 = _2375;
            if (_2347)
            {
                _2373 = _1341;
            }
            int _2381 = _2373;
            bool _2383 = _2129 == 96;
            int _2385 = _2381;
            if (_2353)
            {
                _2379 = _1329;
            }
            int _2387 = _2379;
            bool _2389 = _2129 == 84;
            int _2391 = _2387;
            if (_2355)
            {
                _2391 = _1331;
            }
            int _2393 = _2391;
            bool _2395 = _2129 == 88;
            int _2397 = _2393;
            if (_2361)
            {
                _2385 = _1343;
            }
            int _2399 = _2385;
            bool _2401 = _2129 == 92;
            if (_2367)
            {
                _2397 = _1333;
            }
            int _2403 = _2397;
            bool _2405 = _2091 >= _2399;
            int _2407 = _2403;
            if (_2377)
            {
                _2407 = _1335;
            }
            int _2409 = _2407;
            int _2411 = _2409;
            if (_2389)
            {
                _2411 = _1337;
            }
            int _2413 = _2411;
            int _2415 = _2413;
            if (_2395)
            {
                _2415 = _1339;
            }
            int _2417 = _2415;
            int _2419 = _2417;
            _2117 = 0;
            if (_2401)
            {
                _2419 = _1341;
            }
            int _2421 = _2419;
            int _2423 = _2421;
            if (_2383)
            {
                _2423 = _1343;
            }
            int _2425 = _2423;
            if (!_2405)
            {
                _2111 = _2399;
            }
            int _2427 = _2111;
            _2119 = _2427;
            if (!_2405)
            {
                _2113 = _2089;
            }
            int _2429 = _2113;
            int _2431 = _2125 + 1;
            bool _2433 = _2427 >= _2425;
            int _2435 = _2429;
            _2115 = _2431;
            if (!_2433)
            {
                _2435 = _2125;
            }
            int _2437 = _2435;
            _2121 = _2437;
            if (!_2433)
            {
                _2119 = _2425;
            }
        }
        int _2439 = _2115;
        int _2441 = _2117;
        int _2443 = _2119;
        int _2445 = _2121;
        bool _2447 = _2439 < _1345;
        int _2449 = (_2447 ? (-1) : 0) | _2441;
        int _2451 = ~_2449;
        int _2453 = _2445;
        if (!(_2451 != 0))
        {
            int _2455 = _2439 * 4;
            bool _2457 = _2455 == 4;
            bool _2459 = _2455 == 8;
            bool _2461 = _2455 == 12;
            bool _2463 = _2455 == 16;
            if (_2457)
            {
                _1369 = _1297;
            }
            int _2465 = _1369;
            bool _2467 = _2455 == 20;
            int _2469 = _2465;
            if (_2459)
            {
                _2469 = _1299;
            }
            int _2471 = _2469;
            bool _2473 = _2455 == 24;
            int _2475 = _2471;
            if (_2461)
            {
                _2475 = _1301;
            }
            int _2477 = _2475;
            bool _2479 = _2455 == 28;
            int _2481 = _2477;
            if (_2463)
            {
                _2481 = _1303;
            }
            int _2483 = _2481;
            bool _2485 = _2455 == 32;
            int _2487 = _2483;
            if (_2467)
            {
                _2487 = _1305;
            }
            int _2489 = _2487;
            bool _2491 = _2455 == 36;
            int _2493 = _2489;
            if (_2473)
            {
                _2493 = _1307;
            }
            int _2495 = _2493;
            bool _2497 = _2455 == 40;
            int _2499 = _2495;
            if (_2479)
            {
                _2499 = _1309;
            }
            int _2501 = _2499;
            bool _2503 = _2455 == 44;
            int _2505 = _2501;
            if (_2485)
            {
                _2505 = _1311;
            }
            int _2507 = _2505;
            bool _2509 = _2455 == 48;
            int _2511 = _2507;
            if (_2491)
            {
                _2511 = _1313;
            }
            int _2513 = _2511;
            bool _2515 = _2455 == 52;
            int _2517 = _2513;
            if (_2497)
            {
                _2517 = _1315;
            }
            int _2519 = _2517;
            bool _2521 = _2455 == 56;
            int _2523 = _2519;
            if (_2503)
            {
                _2523 = _1317;
            }
            int _2525 = _2523;
            bool _2527 = _2455 == 60;
            int _2529 = _2525;
            if (_2509)
            {
                _2529 = _1319;
            }
            int _2531 = _2529;
            bool _2533 = _2455 == 64;
            int _2535 = _2531;
            if (_2515)
            {
                _2535 = _1321;
            }
            int _2537 = _2535;
            bool _2539 = _2455 == 68;
            int _2541 = _2537;
            if (_2521)
            {
                _2541 = _1323;
            }
            int _2543 = _2541;
            bool _2545 = _2455 == 72;
            int _2547 = _2543;
            if (_2527)
            {
                _2547 = _1325;
            }
            int _2549 = _2547;
            bool _2551 = _2455 == 76;
            int _2553 = _2549;
            if (_2533)
            {
                _2553 = _1327;
            }
            int _2555 = _2553;
            bool _2557 = _2455 == 80;
            int _2559 = _2555;
            if (_2539)
            {
                _2559 = _1329;
            }
            int _2561 = _2559;
            bool _2563 = _2455 == 84;
            int _2565 = _2561;
            if (_2545)
            {
                _2565 = _1331;
            }
            int _2567 = _2565;
            bool _2569 = _2455 == 88;
            int _2571 = _2567;
            if (_2551)
            {
                _2571 = _1333;
            }
            int _2573 = _2571;
            bool _2575 = _2455 == 92;
            int _2577 = _2573;
            if (_2557)
            {
                _2577 = _1335;
            }
            int _2579 = _2577;
            bool _2581 = _2455 == 96;
            int _2583 = _2579;
            if (_2563)
            {
                _2583 = _1337;
            }
            int _2585 = _2583;
            int _2587 = _2585;
            if (_2569)
            {
                _2587 = _1339;
            }
            int _2589 = _2587;
            int _2591 = _2589;
            if (_2575)
            {
                _2591 = _1341;
            }
            int _2593 = _2591;
            int _2595 = _2593;
            if (_2581)
            {
                _2595 = _1343;
            }
            int _2597 = _2595;
            bool _2599 = _2443 >= _2597;
            if (!_2599)
            {
                _2453 = _2439;
            }
        }
        int _2601 = _2453;
        _1377 = _2601;
    }
    int _2603 = _1377;
    int _2605 = _2603 * 8;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    float _2609 = as_type<float>(_31[int(_2607)]);
    int _2611 = _2605 + 4;
    uint _2613 = uint(int(uint(_2611) >> uint(2)));
    float _2615 = as_type<float>(_31[int(_2613)]);
    int _2617 = _72 + 16;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2619)] = as_type<uint>(_2609);
    int _2621 = _2617 + 4;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2623)] = as_type<uint>(_2615);
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


vertex void main0_discard(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _873 = false;
    bool _697 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _2646 = float3((*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float4 _58 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2646, float3(0.0), isnan(_2646)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2646, float3(0.0), isnan(_2646)), level(0.0)).xyzw;
    float _61 = _58.x;
    float _63 = _58.y;
    float _65 = _58.z;
    float _67 = _58.w;
    float _69 = as_type<float>(int(gl_VertexIndex));
    spvUnsafeArray<uint, 76> _31;
    _31[0] = 0u;
    _31[1] = 0u;
    int _72 = as_type<int>(_69) * 32;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_75)] = as_type<uint>(_61);
    int _77 = _72 + 4;
    uint _79 = uint(int(uint(_77) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_79)] = as_type<uint>(_63);
    int _81 = _72 + 8;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_83)] = as_type<uint>(_65);
    int _85 = _72 + 12;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_87)] = as_type<uint>(_67);
    int _89 = -2;
    int _91 = 0;
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
    bool _145;
    bool _283;
    int _661;
    int _663;
    int _665;
    bool _673;
    int _675;
    int _729;
    int _731;
    int _737;
    int _743;
    int _749;
    int _755;
    int _761;
    int _767;
    int _773;
    int _779;
    int _785;
    int _791;
    int _797;
    int _803;
    int _809;
    int _815;
    bool _819;
    int _821;
    int _825;
    int _831;
    int _837;
    int _843;
    int _849;
    int _853;
    int _857;
    int _861;
    int _865;
    int _869;
    int _871;
    int _1231;
    int _1295;
    int _1297;
    int _1299;
    int _1301;
    int _1303;
    int _1305;
    int _1307;
    int _1309;
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
    int _1359;
    int _1361;
    int _1363;
    int _1365;
    int _1367;
    int _1369;
    do
    {
        int _147 = _89;
        int _149 = _91;
        int _151 = _93;
        int _153 = _95;
        int _155 = _97;
        int _157 = _99;
        int _159 = _101;
        int _161 = _103;
        int _163 = _105;
        int _165 = _107;
        int _167 = _109;
        int _169 = _111;
        int _171 = _113;
        int _173 = _115;
        int _175 = _117;
        int _177 = _119;
        int _179 = _121;
        int _181 = _123;
        int _183 = _125;
        int _185 = _127;
        int _187 = _129;
        int _189 = _131;
        int _191 = _133;
        int _193 = _135;
        int _195 = _137;
        int _197 = _139;
        int _199 = _141;
        float _201 = float(_147);
        float _203 = _201 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
        float _205 = fma((*spvDescriptorSet0.vp_c3)._m0[1].x, -4.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
        float _207 = fma(_203, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
        float2 _2765 = float2(_205, _207);
        float4 _209 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2765, float2(0.0), isnan(_2765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2765, float2(0.0), isnan(_2765)), level(0.0)).xyzw;
        float _211 = _209.x;
        float _213 = _209.y;
        float _215 = _209.z;
        float _217 = _209.w;
        int _219 = -2;
        float _221 = _217;
        float _223 = _213;
        float _225 = _215;
        float _227 = _211;
        int _229 = _149;
        int _231 = _151;
        int _233 = _153;
        int _235 = _155;
        int _237 = _157;
        int _239 = _159;
        int _241 = _161;
        int _243 = _163;
        int _245 = _165;
        int _247 = _167;
        int _249 = _169;
        int _251 = _171;
        int _253 = _173;
        int _255 = _175;
        int _257 = _177;
        int _259 = _179;
        int _261 = _181;
        int _263 = _183;
        int _265 = _185;
        int _267 = _187;
        int _269 = _189;
        int _271 = _191;
        int _273 = _193;
        int _275 = _195;
        int _277 = _197;
        int _279 = _199;
        int _281 = -2;
        do
        {
            int _285 = _219;
            float _287 = _221;
            float _289 = _223;
            float _291 = _225;
            float _293 = _227;
            int _295 = _229;
            int _297 = _231;
            int _299 = _233;
            int _301 = _235;
            int _303 = _237;
            int _305 = _239;
            int _307 = _241;
            int _309 = _243;
            int _311 = _245;
            int _313 = _247;
            int _315 = _249;
            int _317 = _251;
            int _319 = _253;
            int _321 = _255;
            int _323 = _257;
            int _325 = _259;
            int _327 = _261;
            int _329 = _263;
            int _331 = _265;
            int _333 = _267;
            int _335 = _269;
            int _337 = _271;
            int _339 = _273;
            int _341 = _275;
            int _343 = _277;
            int _345 = _279;
            int _347 = _281;
            int _349 = _285 + 1;
            float _351 = float(_147);
            float _353 = float(_349);
            float _355 = _351 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
            float _357 = _353 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
            float _359 = 0.0 + _287;
            float _361 = precise::clamp(_359, 0.0, 1.0);
            float _363 = fma(_355, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
            float _365 = 0.0 + _289;
            float _367 = precise::clamp(_365, 0.0, 1.0);
            float _369 = fma(_357, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
            float _371 = 0.0 + _291;
            float _373 = precise::clamp(_371, 0.0, 1.0);
            float _375 = 0.0 + _293;
            float _377 = precise::clamp(_375, 0.0, 1.0);
            float2 _2885 = float2(_369, _363);
            float4 _379 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2885, float2(0.0), isnan(_2885)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2885, float2(0.0), isnan(_2885)), level(0.0)).xyzw;
            float _381 = _379.x;
            float _383 = _379.y;
            float _385 = _379.z;
            float _387 = _379.w;
            float _389 = _361 * 65535.0;
            float _391 = _373 * 65535.0;
            float _393 = _367 * 65535.0;
            float _395 = _377 * 65535.0;
            float _397 = rint(_389);
            int _399 = int(_397);
            float _401 = rint(_391);
            int _403 = int(_401);
            float _405 = rint(_393);
            int _407 = int(_405);
            uint _409 = extract_bits(uint(_399), 0u, 8u);
            int _411 = int(_409) & 255;
            uint _413 = extract_bits(uint(_399), 8u, 8u);
            int _415 = int(_413) & 255;
            int _417 = _415 << 8;
            int _419 = _411 | _417;
            float _421 = rint(_395);
            int _423 = int(_421);
            uint _425 = extract_bits(uint(_419), 0u, 8u);
            int _427 = int(_425) & 255;
            uint _429 = extract_bits(uint(_419), 8u, 8u);
            int _431 = int(_429) & 255;
            int _433 = _431 << 8;
            int _435 = _427 | _433;
            uint _437 = extract_bits(uint(_403), 0u, 8u);
            int _439 = int(_437) & 255;
            int _441 = _439 << 16;
            int _443 = _435 | _441;
            uint _445 = extract_bits(uint(_403), 8u, 8u);
            int _447 = int(_445) & 255;
            int _449 = _447 << 24;
            int _451 = _443 | _449;
            bool _453 = _451 != 0;
            uint _455 = extract_bits(uint(_407), 0u, 8u);
            int _457 = int(_455) & 255;
            uint _459 = extract_bits(uint(_407), 8u, 8u);
            int _461 = int(_459) & 255;
            int _463 = _461 << 8;
            int _465 = _457 | _463;
            uint _467 = extract_bits(uint(_465), 0u, 8u);
            int _469 = int(_467) & 255;
            uint _471 = extract_bits(uint(_465), 8u, 8u);
            int _473 = int(_471) & 255;
            int _475 = _473 << 8;
            int _477 = _469 | _475;
            uint _479 = extract_bits(uint(_423), 0u, 8u);
            int _481 = int(_479) & 255;
            int _483 = _481 << 16;
            int _485 = _477 | _483;
            uint _487 = extract_bits(uint(_423), 8u, 8u);
            int _489 = int(_487) & 255;
            int _491 = _489 << 24;
            int _493 = _485 | _491;
            bool _495 = _493 != 0;
            bool _497 = _495 || _453;
            bool _499 = !_497;
            _219 = _349;
            _221 = _387;
            _223 = _383;
            _225 = _385;
            _227 = _381;
            int _501 = _305;
            int _503 = _297;
            int _505 = _299;
            int _507 = _301;
            int _509 = _303;
            int _511 = _307;
            int _513 = _309;
            int _515 = _319;
            int _517 = _311;
            int _519 = _313;
            int _521 = _315;
            int _523 = _317;
            int _525 = _321;
            int _527 = _323;
            int _529 = _333;
            int _531 = _325;
            int _533 = _327;
            int _535 = _329;
            int _537 = _331;
            int _539 = _335;
            int _541 = _337;
            int _543 = _339;
            int _545 = _341;
            int _547 = _343;
            int _549 = _345;
            int _551 = _451;
            int _553 = _297;
            int _555 = _299;
            int _557 = _301;
            int _559 = _303;
            int _561 = _341;
            int _563 = _343;
            int _565 = _345;
            int _567 = _305;
            int _569 = _307;
            int _571 = _309;
            int _573 = _311;
            int _575 = _313;
            int _577 = _315;
            int _579 = _317;
            int _581 = _319;
            int _583 = _321;
            int _585 = _323;
            int _587 = _325;
            int _589 = _327;
            int _591 = _329;
            int _593 = _331;
            int _595 = _339;
            int _597 = _337;
            int _599 = _335;
            int _601 = _295;
            int _603 = _297;
            int _605 = _299;
            int _607 = _301;
            int _609 = _303;
            int _611 = _305;
            int _613 = _307;
            int _615 = _309;
            int _617 = _311;
            int _619 = _313;
            int _621 = _315;
            int _623 = _317;
            int _625 = _319;
            int _627 = _321;
            int _629 = _323;
            int _631 = _325;
            int _633 = _327;
            int _635 = _329;
            int _637 = _331;
            int _639 = _333;
            int _641 = _335;
            int _643 = _337;
            int _645 = _339;
            int _647 = _341;
            int _649 = _343;
            int _651 = _345;
            int _653 = _493;
            int _655 = _423;
            int _657 = _451;
            int _659 = _419;
            _661 = _493;
            _663 = _451;
            _665 = as_type<int>(_385);
            if (!_499)
            {
                bool _667 = _295 > 0;
                bool _669 = !_667;
                if (!_669)
                {
                    int _671 = 0;
                    do
                    {
                        _675 = _671;
                        int _677 = _675 * 8;
                        uint _679 = uint(int(uint(_677) >> uint(2)));
                        float _681 = as_type<float>(_31[int(_679)]);
                        int _683 = _677 + 4;
                        uint _685 = uint(int(uint(_683) >> uint(2)));
                        float _687 = as_type<float>(_31[int(_685)]);
                        bool _689 = as_type<int>(_681) != _451;
                        bool _691 = as_type<int>(_687) != _493;
                        bool _693 = _691 || _689;
                        bool _695 = !_693;
                        _697 = _695;
                        if (_697)
                        {
                            break;
                        }
                        int _699 = _675 + 1;
                        bool _701 = _699 >= _295;
                        _673 = !_701;
                        _671 = _699;
                    } while (_673);
                }
                if (!_697)
                {
                    int _703 = _295 * 4;
                    int _705 = _295 * 8;
                    int _707 = _295 + 1;
                    bool _709 = _703 == 16;
                    bool _711 = _703 == 0;
                    uint _713 = uint(int(uint(_705) >> uint(2)));
                    _31[int(_713)] = uint(_451);
                    int _715 = _705 + 4;
                    uint _717 = uint(int(uint(_715) >> uint(2)));
                    _31[int(_717)] = uint(_493);
                    bool _719 = _703 == 4;
                    bool _721 = _703 == 8;
                    bool _723 = _703 == 12;
                    bool _725 = _703 == 20;
                    bool _727 = _703 == 24;
                    _601 = _707;
                    _655 = _705;
                    _659 = _703;
                    _729 = _705;
                    _731 = _703;
                    if (_709)
                    {
                        _501 = 1;
                    }
                    int _733 = _501;
                    bool _735 = _703 == 44;
                    _611 = _733;
                    _737 = _733;
                    if (_711)
                    {
                        _503 = 1;
                    }
                    int _739 = _503;
                    bool _741 = _703 == 28;
                    _603 = _739;
                    _743 = _739;
                    if (_719)
                    {
                        _505 = 1;
                    }
                    int _745 = _505;
                    bool _747 = _703 == 32;
                    _605 = _745;
                    _749 = _745;
                    if (_721)
                    {
                        _507 = 1;
                    }
                    int _751 = _507;
                    bool _753 = _703 == 36;
                    _607 = _751;
                    _755 = _751;
                    if (_723)
                    {
                        _509 = 1;
                    }
                    int _757 = _509;
                    bool _759 = _703 == 40;
                    _609 = _757;
                    _761 = _757;
                    if (_725)
                    {
                        _511 = 1;
                    }
                    int _763 = _511;
                    bool _765 = _703 == 48;
                    _613 = _763;
                    _767 = _763;
                    if (_727)
                    {
                        _513 = 1;
                    }
                    int _769 = _513;
                    bool _771 = _703 == 52;
                    _615 = _769;
                    _773 = _769;
                    if (_735)
                    {
                        _515 = 1;
                    }
                    int _775 = _515;
                    bool _777 = _703 == 72;
                    _625 = _775;
                    _779 = _775;
                    if (_741)
                    {
                        _517 = 1;
                    }
                    int _781 = _517;
                    bool _783 = _703 == 56;
                    _617 = _781;
                    _785 = _781;
                    if (_747)
                    {
                        _519 = 1;
                    }
                    int _787 = _519;
                    bool _789 = _703 == 60;
                    _619 = _787;
                    _791 = _787;
                    if (_753)
                    {
                        _521 = 1;
                    }
                    int _793 = _521;
                    bool _795 = _703 == 64;
                    _621 = _793;
                    _797 = _793;
                    if (_759)
                    {
                        _523 = 1;
                    }
                    int _799 = _523;
                    bool _801 = _703 == 68;
                    _623 = _799;
                    _803 = _799;
                    if (_765)
                    {
                        _525 = 1;
                    }
                    int _805 = _525;
                    bool _807 = _703 == 76;
                    _627 = _805;
                    _809 = _805;
                    if (_771)
                    {
                        _527 = 1;
                    }
                    int _811 = _527;
                    bool _813 = _703 == 80;
                    _629 = _811;
                    _815 = _811;
                    if (_777)
                    {
                        _529 = 1;
                    }
                    int _817 = _529;
                    _819 = _707 != 25;
                    _639 = _817;
                    _821 = _817;
                    if (_783)
                    {
                        _531 = 1;
                    }
                    int _823 = _531;
                    _631 = _823;
                    _825 = _823;
                    if (_789)
                    {
                        _533 = 1;
                    }
                    int _827 = _533;
                    bool _829 = _703 == 84;
                    _633 = _827;
                    _831 = _827;
                    if (_795)
                    {
                        _535 = 1;
                    }
                    int _833 = _535;
                    bool _835 = _703 == 88;
                    _635 = _833;
                    _837 = _833;
                    if (_801)
                    {
                        _537 = 1;
                    }
                    int _839 = _537;
                    bool _841 = _703 == 92;
                    _637 = _839;
                    _843 = _839;
                    if (_807)
                    {
                        _539 = 1;
                    }
                    int _845 = _539;
                    bool _847 = _703 == 96;
                    _641 = _845;
                    _849 = _845;
                    if (_813)
                    {
                        _541 = 1;
                    }
                    int _851 = _541;
                    _643 = _851;
                    _853 = _851;
                    if (_829)
                    {
                        _543 = 1;
                    }
                    int _855 = _543;
                    _645 = _855;
                    _857 = _855;
                    if (_835)
                    {
                        _545 = 1;
                    }
                    int _859 = _545;
                    _647 = _859;
                    _861 = _859;
                    if (_841)
                    {
                        _547 = 1;
                    }
                    int _863 = _547;
                    _649 = _863;
                    _865 = _863;
                    if (_847)
                    {
                        _549 = 1;
                    }
                    int _867 = _549;
                    _651 = _867;
                    _869 = _867;
                }
                if ((!_819) || _697)
                {
                    if (!_697)
                    {
                        _871 = 25;
                        _873 = true;
                        if (_873)
                        {
                            break;
                        }
                    }
                    _697 = false;
                    int _875 = _675 * 4;
                    bool _877 = _875 == 0;
                    bool _879 = _875 == 4;
                    bool _881 = _875 == 8;
                    bool _883 = _875 == 12;
                    bool _885 = _875 == 88;
                    bool _887 = _875 == 92;
                    bool _889 = _875 == 96;
                    if (_877)
                    {
                        _551 = _297;
                    }
                    int _891 = _551;
                    bool _893 = _875 == 16;
                    int _895 = _891;
                    if (_879)
                    {
                        _895 = _299;
                    }
                    int _897 = _895;
                    bool _899 = _875 == 20;
                    int _901 = _897;
                    if (_881)
                    {
                        _901 = _301;
                    }
                    int _903 = _901;
                    bool _905 = _875 == 24;
                    int _907 = _903;
                    if (_883)
                    {
                        _907 = _303;
                    }
                    int _909 = _907;
                    bool _911 = _875 == 84;
                    int _913 = int(_905);
                    int _915 = _899 ? 2 : 0;
                    int _917 = _913 | _915;
                    int _919 = _893 ? 4 : 0;
                    int _921 = _917 | _919;
                    int _923 = _911 ? 8 : 0;
                    int _925 = _921 | _923;
                    int _927 = _885 ? 16 : 0;
                    int _929 = _925 | _927;
                    int _931 = _887 ? 32 : 0;
                    int _933 = _929 | _931;
                    int _935 = _889 ? 64 : 0;
                    int _937 = _933 | _935;
                    int _939 = _937 & 8;
                    int _941 = _909;
                    _653 = _939;
                    if (_893)
                    {
                        _941 = _305;
                    }
                    int _943 = _941;
                    bool _945 = _875 == 80;
                    int _947 = _943;
                    if (_899)
                    {
                        _947 = _307;
                    }
                    int _949 = _947;
                    bool _951 = _875 == 76;
                    int _953 = _949;
                    if (_905)
                    {
                        _953 = _309;
                    }
                    int _955 = _953;
                    bool _957 = _875 == 28;
                    int _959 = int(_957);
                    int _961 = _951 ? 2 : 0;
                    int _963 = _959 | _961;
                    int _965 = _945 ? 4 : 0;
                    int _967 = _963 | _965;
                    int _969 = _911 ? 8 : 0;
                    int _971 = _967 | _969;
                    int _973 = _885 ? 16 : 0;
                    int _975 = _971 | _973;
                    int _977 = _887 ? 32 : 0;
                    int _979 = _975 | _977;
                    int _981 = _889 ? 64 : 0;
                    int _983 = _979 | _981;
                    int _985 = _983 & 2;
                    int _987 = int(_957);
                    int _989 = _951 ? 2 : 0;
                    int _991 = _987 | _989;
                    int _993 = _945 ? 4 : 0;
                    int _995 = _991 | _993;
                    int _997 = _911 ? 8 : 0;
                    int _999 = _995 | _997;
                    int _1001 = _885 ? 16 : 0;
                    int _1003 = _999 | _1001;
                    int _1005 = _887 ? 32 : 0;
                    int _1007 = _1003 | _1005;
                    int _1009 = _889 ? 64 : 0;
                    int _1011 = _1007 | _1009;
                    int _1013 = _1011 & 4;
                    int _1015 = _955;
                    _655 = _985;
                    _659 = _1013;
                    if (_957)
                    {
                        _1015 = _311;
                    }
                    int _1017 = _1015;
                    bool _1019 = _875 == 32;
                    int _1021 = _1017;
                    if (_1019)
                    {
                        _1021 = _313;
                    }
                    int _1023 = _1021;
                    bool _1025 = _875 == 36;
                    int _1027 = _1023;
                    if (_1025)
                    {
                        _1027 = _315;
                    }
                    int _1029 = _1027;
                    bool _1031 = _875 == 40;
                    int _1033 = _1029;
                    if (_1031)
                    {
                        _1033 = _317;
                    }
                    int _1035 = _1033;
                    bool _1037 = _875 == 44;
                    int _1039 = _1035;
                    if (_1037)
                    {
                        _1039 = _319;
                    }
                    int _1041 = _1039;
                    bool _1043 = _875 == 48;
                    int _1045 = _1041;
                    if (_1043)
                    {
                        _1045 = _321;
                    }
                    int _1047 = _1045;
                    bool _1049 = _875 == 52;
                    int _1051 = _1047;
                    if (_1049)
                    {
                        _1051 = _323;
                    }
                    int _1053 = _1051;
                    bool _1055 = _875 == 56;
                    int _1057 = _1053;
                    if (_1055)
                    {
                        _1057 = _325;
                    }
                    int _1059 = _1057;
                    bool _1061 = _875 == 60;
                    int _1063 = _1059;
                    if (_1061)
                    {
                        _1063 = _327;
                    }
                    int _1065 = _1063;
                    bool _1067 = _875 == 64;
                    int _1069 = _1065;
                    if (_1067)
                    {
                        _1069 = _329;
                    }
                    int _1071 = _1069;
                    bool _1073 = _875 == 68;
                    int _1075 = _1071;
                    if (_1073)
                    {
                        _1075 = _331;
                    }
                    int _1077 = _1075;
                    bool _1079 = _875 == 72;
                    int _1081 = int(_1079);
                    int _1083 = _951 ? 2 : 0;
                    int _1085 = _1081 | _1083;
                    int _1087 = _945 ? 4 : 0;
                    int _1089 = _1085 | _1087;
                    int _1091 = _911 ? 8 : 0;
                    int _1093 = _1089 | _1091;
                    int _1095 = _885 ? 16 : 0;
                    int _1097 = _1093 | _1095;
                    int _1099 = _887 ? 32 : 0;
                    int _1101 = _1097 | _1099;
                    int _1103 = _889 ? 64 : 0;
                    int _1105 = _1101 | _1103;
                    int _1107 = _1105 & 1;
                    int _1109 = _1077;
                    if (_1079)
                    {
                        _1109 = _333;
                    }
                    int _1111 = _1109;
                    bool _1113 = _875 == 4;
                    int _1115 = _1111;
                    if (_951)
                    {
                        _1115 = _335;
                    }
                    int _1117 = _1115;
                    bool _1119 = _875 == 0;
                    int _1121 = _1117;
                    if (_945)
                    {
                        _1121 = _337;
                    }
                    int _1123 = _1121;
                    bool _1125 = _875 == 12;
                    int _1127 = _1123;
                    if (_911)
                    {
                        _1127 = _339;
                    }
                    int _1129 = _1127;
                    bool _1131 = _875 == 8;
                    int _1133 = _1129;
                    if (_885)
                    {
                        _1133 = _341;
                    }
                    int _1135 = _1133;
                    int _1137 = _1135;
                    if (_887)
                    {
                        _1137 = _343;
                    }
                    int _1139 = _1137;
                    int _1141 = _1139;
                    if (_889)
                    {
                        _1141 = _345;
                    }
                    int _1143 = _1141;
                    int _1145 = _1143 + 1;
                    _657 = _1145;
                    if (_1119)
                    {
                        _553 = _1145;
                    }
                    int _1147 = _553;
                    bool _1149 = _875 == 16;
                    _603 = _1147;
                    if (_1113)
                    {
                        _555 = _1145;
                    }
                    int _1151 = _555;
                    bool _1153 = _875 == 20;
                    _605 = _1151;
                    if (_1131)
                    {
                        _557 = _1145;
                    }
                    int _1155 = _557;
                    bool _1157 = _875 == 24;
                    _607 = _1155;
                    if (_1125)
                    {
                        _559 = _1145;
                    }
                    int _1159 = _559;
                    bool _1161 = _875 == 28;
                    _609 = _1159;
                    if (_885)
                    {
                        _561 = _1145;
                    }
                    int _1163 = _561;
                    _647 = _1163;
                    if (_887)
                    {
                        _563 = _1145;
                    }
                    int _1165 = _563;
                    _649 = _1165;
                    if (_889)
                    {
                        _565 = _1145;
                    }
                    int _1167 = _565;
                    _651 = _1167;
                    if (_1149)
                    {
                        _567 = _1145;
                    }
                    int _1169 = _567;
                    bool _1171 = _875 == 32;
                    _611 = _1169;
                    if (_1153)
                    {
                        _569 = _1145;
                    }
                    int _1173 = _569;
                    bool _1175 = _875 == 36;
                    _613 = _1173;
                    if (_1157)
                    {
                        _571 = _1145;
                    }
                    int _1177 = _571;
                    bool _1179 = _875 == 40;
                    _615 = _1177;
                    if (_1161)
                    {
                        _573 = _1145;
                    }
                    int _1181 = _573;
                    bool _1183 = _875 == 44;
                    _617 = _1181;
                    if (_1171)
                    {
                        _575 = _1145;
                    }
                    int _1185 = _575;
                    bool _1187 = _875 == 48;
                    _619 = _1185;
                    if (_1175)
                    {
                        _577 = _1145;
                    }
                    int _1189 = _577;
                    bool _1191 = _875 == 52;
                    _621 = _1189;
                    if (_1179)
                    {
                        _579 = _1145;
                    }
                    int _1193 = _579;
                    bool _1195 = _875 == 56;
                    _623 = _1193;
                    if (_1183)
                    {
                        _581 = _1145;
                    }
                    int _1197 = _581;
                    bool _1199 = _875 == 60;
                    _625 = _1197;
                    if (_1187)
                    {
                        _583 = _1145;
                    }
                    int _1201 = _583;
                    bool _1203 = _875 == 64;
                    _627 = _1201;
                    if (_1191)
                    {
                        _585 = _1145;
                    }
                    int _1205 = _585;
                    bool _1207 = _875 == 68;
                    _629 = _1205;
                    if (_1195)
                    {
                        _587 = _1145;
                    }
                    int _1209 = _587;
                    bool _1211 = _939 != 0;
                    _631 = _1209;
                    if (_1199)
                    {
                        _589 = _1145;
                    }
                    int _1213 = _589;
                    bool _1215 = _1013 != 0;
                    _633 = _1213;
                    if (_1203)
                    {
                        _591 = _1145;
                    }
                    int _1217 = _591;
                    _635 = _1217;
                    if (_1207)
                    {
                        _593 = _1145;
                    }
                    int _1219 = _593;
                    bool _1221 = _985 != 0;
                    _637 = _1219;
                    if (_1211)
                    {
                        _595 = _1145;
                    }
                    int _1223 = _595;
                    bool _1225 = _1107 != 0;
                    _645 = _1223;
                    if (_1215)
                    {
                        _597 = _1145;
                    }
                    int _1227 = _597;
                    _643 = _1227;
                    if (_1221)
                    {
                        _599 = _1145;
                    }
                    int _1229 = _599;
                    _641 = _1229;
                    if (_1225)
                    {
                        _639 = _1145;
                    }
                }
            }
            _1231 = _601;
            int _1233 = _603;
            int _1235 = _605;
            int _1237 = _607;
            int _1239 = _609;
            int _1241 = _611;
            int _1243 = _613;
            int _1245 = _615;
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
            int _1291 = _347 + 1;
            bool _1293 = _1291 >= 3;
            _283 = !_1293;
            _229 = _1231;
            _231 = _1233;
            _233 = _1235;
            _235 = _1237;
            _237 = _1239;
            _239 = _1241;
            _241 = _1243;
            _243 = _1245;
            _245 = _1247;
            _247 = _1249;
            _249 = _1251;
            _251 = _1253;
            _253 = _1255;
            _255 = _1257;
            _257 = _1259;
            _259 = _1261;
            _261 = _1263;
            _263 = _1265;
            _265 = _1267;
            _267 = _1269;
            _269 = _1271;
            _271 = _1273;
            _273 = _1275;
            _275 = _1277;
            _277 = _1279;
            _279 = _1281;
            _281 = _1291;
            _743 = _1233;
            _749 = _1235;
            _755 = _1237;
            _761 = _1239;
            _737 = _1241;
            _767 = _1243;
            _773 = _1245;
            _785 = _1247;
            _791 = _1249;
            _797 = _1251;
            _803 = _1253;
            _779 = _1255;
            _809 = _1257;
            _815 = _1259;
            _825 = _1261;
            _831 = _1263;
            _837 = _1265;
            _843 = _1267;
            _821 = _1269;
            _849 = _1271;
            _853 = _1273;
            _857 = _1275;
            _861 = _1277;
            _865 = _1279;
            _869 = _1281;
            _661 = _1283;
            _729 = _1285;
            _663 = _1287;
            _731 = _1289;
        } while (_283);
        if (!_873)
        {
            _871 = _1231;
        }
        _873 = false;
        _1295 = _743;
        _1297 = _749;
        _1299 = _755;
        _1301 = _761;
        _1303 = _737;
        _1305 = _767;
        _1307 = _773;
        _1309 = _785;
        _1311 = _791;
        _1313 = _797;
        _1315 = _803;
        _1317 = _779;
        _1319 = _809;
        _1321 = _815;
        _1323 = _825;
        _1325 = _831;
        _1327 = _837;
        _1329 = _843;
        _1331 = _821;
        _1333 = _849;
        _1335 = _853;
        _1337 = _857;
        _1339 = _861;
        _1341 = _865;
        _1343 = _869;
        _1345 = _871;
        int _1347 = _661;
        int _1349 = _729;
        int _1351 = _663;
        int _1353 = _731;
        int _1355 = _147 + 1;
        bool _1357 = _1355 >= 3;
        _145 = !_1357;
        _89 = _1355;
        _91 = _1345;
        _93 = _1295;
        _95 = _1297;
        _97 = _1299;
        _99 = _1301;
        _101 = _1303;
        _103 = _1305;
        _105 = _1307;
        _107 = _1309;
        _109 = _1311;
        _111 = _1313;
        _113 = _1315;
        _115 = _1317;
        _117 = _1319;
        _119 = _1321;
        _121 = _1323;
        _123 = _1325;
        _125 = _1327;
        _127 = _1329;
        _129 = _1331;
        _131 = _1333;
        _133 = _1335;
        _135 = _1337;
        _137 = _1339;
        _139 = _1341;
        _141 = _1343;
        _1359 = _1347;
        _1361 = _1349;
        _1363 = _1351;
        _1365 = _1353;
        _1367 = _1347;
        _1369 = _1295;
    } while (_145);
    bool _1371 = _1345 > 0;
    if (!_1371)
    {
        _665 = 0;
    }
    int _1373 = _665;
    bool _1375 = !_1371;
    int _1377 = _1373;
    if (!_1375)
    {
        bool _1379 = _1345 > 3;
        bool _1381 = !_1379;
        int _1383 = 0;
        int _1385 = 0;
        int _1387 = 0;
        int _1389 = 0;
        int _1391 = 0;
        int _1393 = -1;
        int _1395 = 0;
        if (!_1381)
        {
            int _1397 = _1345 + (-3);
            _1393 = 0;
            bool _1399;
            do
            {
                int _1401 = _1383;
                int _1403 = _1385;
                int _1405 = _1359;
                int _1407 = _1361;
                int _1409 = _1363;
                int _1411 = _1387;
                int _1413 = _1365;
                int _1415 = _1401 * 4;
                int _1417 = _1401 + 1;
                int _1419 = _1401 + 2;
                bool _1421 = _1415 == 0;
                int _1423 = _1417 * 4;
                bool _1425 = _1415 == 4;
                int _1427 = _1419 * 4;
                bool _1429 = _1415 == 8;
                bool _1431 = _1415 == 12;
                bool _1433 = _1415 == 16;
                bool _1435 = _1423 == 8;
                int _1437 = _1401 + 3;
                int _1439 = _1405;
                int _1441 = _1407;
                int _1443 = _1409;
                int _1445 = _1413;
                int _1447 = _1403;
                int _1449 = _1411;
                if (_1421)
                {
                    _1439 = _1295;
                }
                int _1451 = _1439;
                bool _1453 = _1415 == 24;
                int _1455 = _1451;
                if (_1425)
                {
                    _1455 = _1297;
                }
                int _1457 = _1455;
                bool _1459 = _1415 == 20;
                int _1461 = _1457;
                if (_1429)
                {
                    _1461 = _1299;
                }
                int _1463 = _1461;
                bool _1465 = _1415 == 32;
                int _1467 = _1463;
                if (_1431)
                {
                    _1467 = _1301;
                }
                int _1469 = _1467;
                bool _1471 = _1415 == 28;
                int _1473 = _1469;
                if (_1433)
                {
                    _1473 = _1303;
                }
                int _1475 = _1473;
                bool _1477 = _1415 == 40;
                int _1479 = _1437 * 4;
                int _1481 = _1475;
                if (_1459)
                {
                    _1481 = _1305;
                }
                int _1483 = _1481;
                bool _1485 = _1415 == 36;
                int _1487 = _1483;
                if (_1453)
                {
                    _1487 = _1307;
                }
                int _1489 = _1487;
                bool _1491 = _1423 == 0;
                int _1493 = _1489;
                if (_1471)
                {
                    _1493 = _1309;
                }
                int _1495 = _1493;
                bool _1497 = _1423 == 4;
                int _1499 = _1495;
                if (_1465)
                {
                    _1499 = _1311;
                }
                int _1501 = _1499;
                bool _1503 = _1423 == 12;
                int _1505 = _1501;
                if (_1485)
                {
                    _1505 = _1313;
                }
                int _1507 = _1505;
                bool _1509 = _1415 == 44;
                int _1511 = _1507;
                if (_1477)
                {
                    _1511 = _1315;
                }
                int _1513 = _1511;
                bool _1515 = _1423 == 16;
                int _1517 = _1513;
                if (_1491)
                {
                    _1441 = _1295;
                }
                int _1519 = _1441;
                bool _1521 = _1415 == 48;
                int _1523 = _1519;
                if (_1497)
                {
                    _1523 = _1297;
                }
                int _1525 = _1523;
                int _1527 = _1525;
                if (_1435)
                {
                    _1527 = _1299;
                }
                int _1529 = _1527;
                bool _1531 = _1423 == 20;
                int _1533 = _1529;
                if (_1503)
                {
                    _1533 = _1301;
                }
                int _1535 = _1533;
                bool _1537 = _1423 == 24;
                bool _1539 = _1423 == 28;
                int _1541 = _1535;
                if (_1509)
                {
                    _1517 = _1317;
                }
                int _1543 = _1517;
                bool _1545 = _1415 == 52;
                int _1547 = _1543;
                if (_1515)
                {
                    _1541 = _1303;
                }
                int _1549 = _1541;
                bool _1551 = _1423 == 32;
                int _1553 = _1549;
                if (_1521)
                {
                    _1547 = _1319;
                }
                int _1555 = _1547;
                bool _1557 = _1415 == 56;
                int _1559 = _1555;
                if (_1531)
                {
                    _1553 = _1305;
                }
                int _1561 = _1553;
                bool _1563 = _1423 == 36;
                int _1565 = _1561;
                if (_1537)
                {
                    _1565 = _1307;
                }
                int _1567 = _1565;
                bool _1569 = _1423 == 40;
                int _1571 = _1567;
                if (_1539)
                {
                    _1571 = _1309;
                }
                int _1573 = _1571;
                bool _1575 = _1423 == 44;
                int _1577 = _1573;
                if (_1545)
                {
                    _1559 = _1321;
                }
                int _1579 = _1559;
                bool _1581 = _1415 == 60;
                int _1583 = _1579;
                if (_1551)
                {
                    _1577 = _1311;
                }
                int _1585 = _1577;
                bool _1587 = _1423 == 48;
                int _1589 = _1585;
                if (_1557)
                {
                    _1583 = _1323;
                }
                int _1591 = _1583;
                bool _1593 = _1415 == 64;
                int _1595 = _1591;
                if (_1563)
                {
                    _1589 = _1313;
                }
                int _1597 = _1589;
                bool _1599 = _1423 == 52;
                int _1601 = _1597;
                if (_1569)
                {
                    _1601 = _1315;
                }
                int _1603 = _1601;
                bool _1605 = _1423 == 56;
                int _1607 = _1603;
                if (_1575)
                {
                    _1607 = _1317;
                }
                int _1609 = _1607;
                bool _1611 = _1423 == 60;
                int _1613 = _1609;
                if (_1581)
                {
                    _1595 = _1325;
                }
                int _1615 = _1595;
                bool _1617 = _1427 == 0;
                int _1619 = _1615;
                if (_1587)
                {
                    _1613 = _1319;
                }
                int _1621 = _1613;
                bool _1623 = _1415 == 68;
                int _1625 = _1621;
                if (_1593)
                {
                    _1619 = _1327;
                }
                int _1627 = _1619;
                bool _1629 = _1427 == 4;
                int _1631 = _1627;
                if (_1599)
                {
                    _1625 = _1321;
                }
                int _1633 = _1625;
                bool _1635 = _1427 == 8;
                int _1637 = _1633;
                if (_1605)
                {
                    _1637 = _1323;
                }
                int _1639 = _1637;
                bool _1641 = _1427 == 12;
                int _1643 = _1639;
                if (_1611)
                {
                    _1643 = _1325;
                }
                int _1645 = _1643;
                bool _1647 = _1427 == 16;
                int _1649 = _1645;
                if (_1617)
                {
                    _1443 = _1295;
                }
                int _1651 = _1443;
                bool _1653 = _1423 == 64;
                int _1655 = _1651;
                if (_1623)
                {
                    _1631 = _1329;
                }
                int _1657 = _1631;
                bool _1659 = _1427 == 20;
                int _1661 = _1657;
                if (_1629)
                {
                    _1655 = _1297;
                }
                int _1663 = _1655;
                bool _1665 = _1415 == 72;
                int _1667 = _1663;
                if (_1635)
                {
                    _1667 = _1299;
                }
                int _1669 = _1667;
                bool _1671 = _1427 == 24;
                int _1673 = _1669;
                if (_1641)
                {
                    _1673 = _1301;
                }
                int _1675 = _1673;
                bool _1677 = _1427 == 28;
                int _1679 = _1675;
                if (_1647)
                {
                    _1679 = _1303;
                }
                int _1681 = _1679;
                int _1683 = _1681;
                if (_1653)
                {
                    _1649 = _1327;
                }
                int _1685 = _1649;
                bool _1687 = _1423 == 68;
                int _1689 = _1685;
                if (_1659)
                {
                    _1683 = _1305;
                }
                int _1691 = _1683;
                bool _1693 = _1427 == 32;
                int _1695 = _1691;
                if (_1665)
                {
                    _1661 = _1331;
                }
                int _1697 = _1661;
                bool _1699 = _1427 == 36;
                bool _1701 = _1415 == 76;
                int _1703 = _1697;
                if (_1671)
                {
                    _1695 = _1307;
                }
                int _1705 = _1695;
                bool _1707 = _1427 == 40;
                int _1709 = _1705;
                if (_1677)
                {
                    _1709 = _1309;
                }
                int _1711 = _1709;
                bool _1713 = _1427 == 44;
                int _1715 = _1711;
                if (_1687)
                {
                    _1689 = _1329;
                }
                int _1717 = _1689;
                bool _1719 = _1423 == 72;
                int _1721 = _1717;
                if (_1693)
                {
                    _1715 = _1311;
                }
                int _1723 = _1715;
                bool _1725 = _1427 == 48;
                int _1727 = _1723;
                if (_1699)
                {
                    _1727 = _1313;
                }
                int _1729 = _1727;
                bool _1731 = _1427 == 52;
                int _1733 = _1729;
                if (_1701)
                {
                    _1703 = _1333;
                }
                int _1735 = _1703;
                bool _1737 = _1415 == 80;
                int _1739 = _1735;
                if (_1707)
                {
                    _1733 = _1315;
                }
                int _1741 = _1733;
                bool _1743 = _1427 == 56;
                int _1745 = _1741;
                if (_1713)
                {
                    _1745 = _1317;
                }
                int _1747 = _1745;
                bool _1749 = _1427 == 60;
                int _1751 = _1747;
                if (_1719)
                {
                    _1721 = _1331;
                }
                int _1753 = _1721;
                bool _1755 = _1427 == 64;
                int _1757 = _1753;
                if (_1725)
                {
                    _1751 = _1319;
                }
                int _1759 = _1751;
                bool _1761 = _1423 == 76;
                int _1763 = _1759;
                if (_1731)
                {
                    _1763 = _1321;
                }
                int _1765 = _1763;
                bool _1767 = _1415 == 84;
                int _1769 = _1765;
                if (_1737)
                {
                    _1739 = _1335;
                }
                int _1771 = _1739;
                bool _1773 = _1427 == 68;
                int _1775 = _1771;
                if (_1743)
                {
                    _1769 = _1323;
                }
                int _1777 = _1769;
                bool _1779 = _1427 == 72;
                int _1781 = _1777;
                if (_1749)
                {
                    _1781 = _1325;
                }
                int _1783 = _1781;
                bool _1785 = _1427 == 76;
                int _1787 = _1783;
                if (_1755)
                {
                    _1787 = _1327;
                }
                int _1789 = _1787;
                bool _1791 = _1479 == 0;
                int _1793 = _1789;
                if (_1761)
                {
                    _1757 = _1333;
                }
                int _1795 = _1757;
                bool _1797 = _1423 == 80;
                int _1799 = _1795;
                if (_1767)
                {
                    _1775 = _1337;
                }
                int _1801 = _1775;
                bool _1803 = _1479 == 4;
                int _1805 = _1801;
                if (_1773)
                {
                    _1793 = _1329;
                }
                int _1807 = _1793;
                bool _1809 = _1427 == 80;
                int _1811 = _1807;
                if (_1779)
                {
                    _1811 = _1331;
                }
                int _1813 = _1811;
                bool _1815 = _1479 == 8;
                int _1817 = _1813;
                if (_1785)
                {
                    _1817 = _1333;
                }
                int _1819 = _1817;
                bool _1821 = _1415 == 88;
                int _1823 = _1819;
                if (_1791)
                {
                    _1445 = _1295;
                }
                int _1825 = _1445;
                bool _1827 = _1479 == 12;
                int _1829 = _1825;
                if (_1797)
                {
                    _1799 = _1335;
                }
                int _1831 = _1799;
                bool _1833 = _1423 == 84;
                int _1835 = _1831;
                if (_1803)
                {
                    _1829 = _1297;
                }
                int _1837 = _1829;
                int _1839 = _1837;
                if (_1809)
                {
                    _1823 = _1335;
                }
                int _1841 = _1823;
                bool _1843 = _1427 == 84;
                int _1845 = _1841;
                if (_1815)
                {
                    _1839 = _1299;
                }
                int _1847 = _1839;
                bool _1849 = _1479 == 16;
                int _1851 = _1847;
                if (_1821)
                {
                    _1805 = _1339;
                }
                int _1853 = _1805;
                bool _1855 = _1415 == 92;
                bool _1857 = _1479 == 20;
                int _1859 = _1853;
                if (_1827)
                {
                    _1851 = _1301;
                }
                int _1861 = _1851;
                bool _1863 = _1423 == 88;
                int _1865 = _1861;
                if (_1833)
                {
                    _1835 = _1337;
                }
                int _1867 = _1835;
                bool _1869 = _1479 == 24;
                int _1871 = _1867;
                if (_1843)
                {
                    _1845 = _1337;
                }
                int _1873 = _1845;
                bool _1875 = _1427 == 88;
                int _1877 = _1873;
                if (_1849)
                {
                    _1865 = _1303;
                }
                int _1879 = _1865;
                bool _1881 = _1479 == 28;
                int _1883 = _1879;
                if (_1855)
                {
                    _1859 = _1341;
                }
                int _1885 = _1859;
                bool _1887 = _1479 == 32;
                int _1889 = _1885;
                if (_1857)
                {
                    _1883 = _1305;
                }
                int _1891 = _1883;
                bool _1893 = _1415 == 96;
                int _1895 = _1891;
                if (_1863)
                {
                    _1871 = _1339;
                }
                int _1897 = _1871;
                bool _1899 = _1479 == 40;
                int _1901 = _1897;
                if (_1869)
                {
                    _1895 = _1307;
                }
                int _1903 = _1895;
                bool _1905 = _1479 == 36;
                int _1907 = _1903;
                if (_1875)
                {
                    _1877 = _1339;
                }
                int _1909 = _1877;
                bool _1911 = _1423 == 92;
                int _1913 = _1909;
                if (_1881)
                {
                    _1907 = _1309;
                }
                int _1915 = _1907;
                bool _1917 = _1479 == 44;
                int _1919 = _1915;
                if (_1887)
                {
                    _1919 = _1311;
                }
                int _1921 = _1919;
                bool _1923 = _1479 == 48;
                int _1925 = _1921;
                if (_1893)
                {
                    _1889 = _1343;
                }
                int _1927 = _1889;
                bool _1929 = _1423 == 96;
                int _1931 = _1927;
                if (_1905)
                {
                    _1925 = _1313;
                }
                int _1933 = _1925;
                bool _1935 = _1479 == 52;
                int _1937 = _1933;
                if (_1899)
                {
                    _1937 = _1315;
                }
                int _1939 = _1937;
                bool _1941 = _1403 >= _1927;
                int _1943 = _1939;
                if (_1911)
                {
                    _1901 = _1341;
                }
                int _1945 = _1901;
                bool _1947 = _1479 == 56;
                int _1949 = _1945;
                if (_1917)
                {
                    _1943 = _1317;
                }
                int _1951 = _1943;
                bool _1953 = _1479 == 60;
                int _1955 = _1951;
                if (_1923)
                {
                    _1955 = _1319;
                }
                int _1957 = _1955;
                bool _1959 = _1479 == 64;
                int _1961 = _1957;
                if (_1929)
                {
                    _1949 = _1343;
                }
                int _1963 = _1949;
                bool _1965 = _1427 == 92;
                _1361 = _1963;
                if (_1935)
                {
                    _1961 = _1321;
                }
                int _1967 = _1961;
                bool _1969 = _1479 == 68;
                int _1971 = _1967;
                if (!_1941)
                {
                    _1447 = _1927;
                }
                int _1973 = _1447;
                int _1975 = _1973;
                if (_1947)
                {
                    _1971 = _1323;
                }
                int _1977 = _1971;
                bool _1979 = _1479 == 72;
                int _1981 = _1977;
                if (_1953)
                {
                    _1981 = _1325;
                }
                int _1983 = _1981;
                bool _1985 = _1973 >= _1963;
                int _1987 = _1983;
                if (_1959)
                {
                    _1987 = _1327;
                }
                int _1989 = _1987;
                int _1991 = _1989;
                if (_1965)
                {
                    _1913 = _1341;
                }
                int _1993 = _1913;
                bool _1995 = _1427 == 96;
                bool _1997 = _1479 == 76;
                int _1999 = _1993;
                if (_1969)
                {
                    _1991 = _1329;
                }
                int _2001 = _1991;
                bool _2003 = _1479 == 80;
                int _2005 = _2001;
                if (_1979)
                {
                    _2005 = _1331;
                }
                int _2007 = _2005;
                bool _2009 = _1479 == 84;
                int _2011 = _2007;
                if (_1985)
                {
                    _1931 = _1973;
                }
                int _2013 = _1931;
                int _2015 = _2013;
                if (!_1985)
                {
                    _2015 = _1963;
                }
                int _2017 = _2015;
                int _2019 = _2017;
                if (_1995)
                {
                    _1999 = _1343;
                }
                int _2021 = _1999;
                bool _2023 = _1479 == 88;
                _1363 = _2021;
                if (_1997)
                {
                    _2011 = _1333;
                }
                int _2025 = _2011;
                bool _2027 = _1479 == 92;
                int _2029 = _2025;
                if (_2003)
                {
                    _2029 = _1335;
                }
                int _2031 = _2029;
                bool _2033 = _2017 >= _2021;
                int _2035 = _2031;
                if (_1941)
                {
                    _1975 = _1411;
                }
                int _2037 = _1975;
                int _2039 = _2037;
                if (_2009)
                {
                    _2035 = _1337;
                }
                int _2041 = _2035;
                bool _2043 = _1479 == 96;
                int _2045 = _2041;
                if (!_1941)
                {
                    _2039 = _1401;
                }
                int _2047 = _2039;
                int _2049 = _1401 + 4;
                _1383 = _2049;
                int _2051 = _2047;
                _1389 = _2049;
                if (!_1985)
                {
                    _2051 = _1417;
                }
                int _2053 = _2051;
                int _2055 = _2053;
                if (_2023)
                {
                    _2045 = _1339;
                }
                int _2057 = _2045;
                bool _2059 = _2049 >= _1397;
                int _2061 = _2057;
                if (_2027)
                {
                    _2061 = _1341;
                }
                int _2063 = _2061;
                int _2065 = _2063;
                if (!_2033)
                {
                    _2019 = _2021;
                }
                int _2067 = _2019;
                _1359 = _2067;
                _1367 = _2067;
                if (!_2033)
                {
                    _2055 = _1419;
                }
                int _2069 = _2055;
                int _2071 = _2069;
                if (_2043)
                {
                    _2065 = _1343;
                }
                int _2073 = _2065;
                bool _2075 = _2067 >= _2073;
                _1365 = _2073;
                if (_2075)
                {
                    _1449 = _2069;
                }
                int _2077 = _1449;
                int _2079 = _2077;
                if (_2075)
                {
                    _2071 = _2067;
                }
                int _2081 = _2071;
                int _2083 = _2081;
                if (!_2075)
                {
                    _2079 = _1437;
                }
                int _2085 = _2079;
                _1387 = _2085;
                _1395 = _2085;
                if (!_2075)
                {
                    _2083 = _2073;
                }
                int _2087 = _2083;
                _1399 = !_2059;
                _1385 = _2087;
                _1391 = _2087;
            } while (_1399);
        }
        int _2089 = _1389;
        int _2091 = _1391;
        int _2093 = _1367;
        int _2095 = _1393;
        int _2097 = _1395;
        int _2099 = -_2089;
        int _2101 = _1345 + _2099;
        bool _2103 = _2101 > 1;
        bool _2105 = !_2103;
        int _2107 = _2093;
        int _2109 = _2101;
        int _2111 = _2091;
        int _2113 = _2097;
        int _2115 = _2089;
        int _2117 = _2095;
        int _2119 = _2091;
        int _2121 = _2097;
        if (!_2105)
        {
            int _2123 = _2089 * 4;
            int _2125 = _2089 + 1;
            bool _2127 = _2123 == 0;
            int _2129 = _2125 * 4;
            bool _2131 = _2123 == 4;
            bool _2133 = _2123 == 8;
            bool _2135 = _2123 == 12;
            bool _2137 = _2123 == 24;
            bool _2139 = _2129 == 0;
            bool _2141 = _2123 == 40;
            if (_2127)
            {
                _2107 = _1295;
            }
            int _2143 = _2107;
            bool _2145 = _2123 == 16;
            int _2147 = _2143;
            if (_2131)
            {
                _2147 = _1297;
            }
            int _2149 = _2147;
            bool _2151 = _2123 == 20;
            int _2153 = _2149;
            if (_2133)
            {
                _2153 = _1299;
            }
            int _2155 = _2153;
            bool _2157 = _2123 == 36;
            int _2159 = _2155;
            if (_2135)
            {
                _2159 = _1301;
            }
            int _2161 = _2159;
            bool _2163 = _2123 == 28;
            int _2165 = _2161;
            if (_2139)
            {
                _2109 = _1295;
            }
            int _2167 = _2109;
            bool _2169 = _2129 == 16;
            int _2171 = _2167;
            if (_2145)
            {
                _2165 = _1303;
            }
            int _2173 = _2165;
            bool _2175 = _2123 == 32;
            int _2177 = _2173;
            if (_2151)
            {
                _2177 = _1305;
            }
            int _2179 = _2177;
            bool _2181 = _2123 == 48;
            int _2183 = _2179;
            if (_2137)
            {
                _2183 = _1307;
            }
            int _2185 = _2183;
            bool _2187 = _2129 == 4;
            int _2189 = _2185;
            if (_2163)
            {
                _2189 = _1309;
            }
            int _2191 = _2189;
            bool _2193 = _2123 == 44;
            int _2195 = _2191;
            if (_2175)
            {
                _2195 = _1311;
            }
            int _2197 = _2195;
            bool _2199 = _2129 == 8;
            int _2201 = _2197;
            if (_2157)
            {
                _2201 = _1313;
            }
            int _2203 = _2201;
            bool _2205 = _2129 == 12;
            int _2207 = _2203;
            if (_2187)
            {
                _2171 = _1297;
            }
            int _2209 = _2171;
            bool _2211 = _2123 == 52;
            int _2213 = _2209;
            if (_2141)
            {
                _2207 = _1315;
            }
            int _2215 = _2207;
            bool _2217 = _2129 == 20;
            int _2219 = _2215;
            if (_2193)
            {
                _2219 = _1317;
            }
            int _2221 = _2219;
            bool _2223 = _2129 == 24;
            int _2225 = _2221;
            if (_2181)
            {
                _2225 = _1319;
            }
            int _2227 = _2225;
            bool _2229 = _2123 == 60;
            int _2231 = _2227;
            if (_2199)
            {
                _2213 = _1299;
            }
            int _2233 = _2213;
            bool _2235 = _2123 == 56;
            int _2237 = _2233;
            if (_2205)
            {
                _2237 = _1301;
            }
            int _2239 = _2237;
            bool _2241 = _2129 == 28;
            int _2243 = _2239;
            if (_2169)
            {
                _2243 = _1303;
            }
            int _2245 = _2243;
            bool _2247 = _2129 == 32;
            int _2249 = _2245;
            if (_2217)
            {
                _2249 = _1305;
            }
            int _2251 = _2249;
            bool _2253 = _2129 == 36;
            int _2255 = _2251;
            if (_2211)
            {
                _2231 = _1321;
            }
            int _2257 = _2231;
            bool _2259 = _2123 == 64;
            int _2261 = _2257;
            if (_2223)
            {
                _2255 = _1307;
            }
            int _2263 = _2255;
            bool _2265 = _2123 == 68;
            int _2267 = _2263;
            if (_2235)
            {
                _2261 = _1323;
            }
            int _2269 = _2261;
            bool _2271 = _2129 == 40;
            int _2273 = _2269;
            if (_2241)
            {
                _2267 = _1309;
            }
            int _2275 = _2267;
            bool _2277 = _2123 == 72;
            int _2279 = _2275;
            if (_2229)
            {
                _2273 = _1325;
            }
            int _2281 = _2273;
            bool _2283 = _2129 == 44;
            int _2285 = _2281;
            if (_2247)
            {
                _2279 = _1311;
            }
            int _2287 = _2279;
            bool _2289 = _2129 == 48;
            int _2291 = _2287;
            if (_2253)
            {
                _2291 = _1313;
            }
            int _2293 = _2291;
            bool _2295 = _2123 == 76;
            int _2297 = _2293;
            if (_2259)
            {
                _2285 = _1327;
            }
            int _2299 = _2285;
            bool _2301 = _2129 == 52;
            int _2303 = _2299;
            if (_2265)
            {
                _2303 = _1329;
            }
            int _2305 = _2303;
            bool _2307 = _2123 == 80;
            int _2309 = _2305;
            if (_2271)
            {
                _2297 = _1315;
            }
            int _2311 = _2297;
            bool _2313 = _2129 == 56;
            int _2315 = _2311;
            if (_2277)
            {
                _2309 = _1331;
            }
            int _2317 = _2309;
            int _2319 = _2317;
            if (_2283)
            {
                _2315 = _1317;
            }
            int _2321 = _2315;
            bool _2323 = _2123 == 84;
            int _2325 = _2321;
            if (_2289)
            {
                _2325 = _1319;
            }
            int _2327 = _2325;
            bool _2329 = _2129 == 60;
            int _2331 = _2327;
            if (_2295)
            {
                _2319 = _1333;
            }
            int _2333 = _2319;
            bool _2335 = _2123 == 88;
            int _2337 = _2333;
            if (_2301)
            {
                _2331 = _1321;
            }
            int _2339 = _2331;
            bool _2341 = _2129 == 64;
            int _2343 = _2339;
            if (_2307)
            {
                _2337 = _1335;
            }
            int _2345 = _2337;
            bool _2347 = _2123 == 92;
            int _2349 = _2345;
            if (_2313)
            {
                _2343 = _1323;
            }
            int _2351 = _2343;
            bool _2353 = _2129 == 68;
            bool _2355 = _2129 == 72;
            int _2357 = _2351;
            if (_2323)
            {
                _2349 = _1337;
            }
            int _2359 = _2349;
            bool _2361 = _2123 == 96;
            int _2363 = _2359;
            if (_2329)
            {
                _2357 = _1325;
            }
            int _2365 = _2357;
            bool _2367 = _2129 == 76;
            int _2369 = _2365;
            if (_2335)
            {
                _2363 = _1339;
            }
            int _2371 = _2363;
            int _2373 = _2371;
            if (_2341)
            {
                _2369 = _1327;
            }
            int _2375 = _2369;
            bool _2377 = _2129 == 80;
            int _2379 = _2375;
            if (_2347)
            {
                _2373 = _1341;
            }
            int _2381 = _2373;
            bool _2383 = _2129 == 96;
            int _2385 = _2381;
            if (_2353)
            {
                _2379 = _1329;
            }
            int _2387 = _2379;
            bool _2389 = _2129 == 84;
            int _2391 = _2387;
            if (_2355)
            {
                _2391 = _1331;
            }
            int _2393 = _2391;
            bool _2395 = _2129 == 88;
            int _2397 = _2393;
            if (_2361)
            {
                _2385 = _1343;
            }
            int _2399 = _2385;
            bool _2401 = _2129 == 92;
            if (_2367)
            {
                _2397 = _1333;
            }
            int _2403 = _2397;
            bool _2405 = _2091 >= _2399;
            int _2407 = _2403;
            if (_2377)
            {
                _2407 = _1335;
            }
            int _2409 = _2407;
            int _2411 = _2409;
            if (_2389)
            {
                _2411 = _1337;
            }
            int _2413 = _2411;
            int _2415 = _2413;
            if (_2395)
            {
                _2415 = _1339;
            }
            int _2417 = _2415;
            int _2419 = _2417;
            _2117 = 0;
            if (_2401)
            {
                _2419 = _1341;
            }
            int _2421 = _2419;
            int _2423 = _2421;
            if (_2383)
            {
                _2423 = _1343;
            }
            int _2425 = _2423;
            if (!_2405)
            {
                _2111 = _2399;
            }
            int _2427 = _2111;
            _2119 = _2427;
            if (!_2405)
            {
                _2113 = _2089;
            }
            int _2429 = _2113;
            int _2431 = _2125 + 1;
            bool _2433 = _2427 >= _2425;
            int _2435 = _2429;
            _2115 = _2431;
            if (!_2433)
            {
                _2435 = _2125;
            }
            int _2437 = _2435;
            _2121 = _2437;
            if (!_2433)
            {
                _2119 = _2425;
            }
        }
        int _2439 = _2115;
        int _2441 = _2117;
        int _2443 = _2119;
        int _2445 = _2121;
        bool _2447 = _2439 < _1345;
        int _2449 = (_2447 ? (-1) : 0) | _2441;
        int _2451 = ~_2449;
        int _2453 = _2445;
        if (!(_2451 != 0))
        {
            int _2455 = _2439 * 4;
            bool _2457 = _2455 == 4;
            bool _2459 = _2455 == 8;
            bool _2461 = _2455 == 12;
            bool _2463 = _2455 == 16;
            if (_2457)
            {
                _1369 = _1297;
            }
            int _2465 = _1369;
            bool _2467 = _2455 == 20;
            int _2469 = _2465;
            if (_2459)
            {
                _2469 = _1299;
            }
            int _2471 = _2469;
            bool _2473 = _2455 == 24;
            int _2475 = _2471;
            if (_2461)
            {
                _2475 = _1301;
            }
            int _2477 = _2475;
            bool _2479 = _2455 == 28;
            int _2481 = _2477;
            if (_2463)
            {
                _2481 = _1303;
            }
            int _2483 = _2481;
            bool _2485 = _2455 == 32;
            int _2487 = _2483;
            if (_2467)
            {
                _2487 = _1305;
            }
            int _2489 = _2487;
            bool _2491 = _2455 == 36;
            int _2493 = _2489;
            if (_2473)
            {
                _2493 = _1307;
            }
            int _2495 = _2493;
            bool _2497 = _2455 == 40;
            int _2499 = _2495;
            if (_2479)
            {
                _2499 = _1309;
            }
            int _2501 = _2499;
            bool _2503 = _2455 == 44;
            int _2505 = _2501;
            if (_2485)
            {
                _2505 = _1311;
            }
            int _2507 = _2505;
            bool _2509 = _2455 == 48;
            int _2511 = _2507;
            if (_2491)
            {
                _2511 = _1313;
            }
            int _2513 = _2511;
            bool _2515 = _2455 == 52;
            int _2517 = _2513;
            if (_2497)
            {
                _2517 = _1315;
            }
            int _2519 = _2517;
            bool _2521 = _2455 == 56;
            int _2523 = _2519;
            if (_2503)
            {
                _2523 = _1317;
            }
            int _2525 = _2523;
            bool _2527 = _2455 == 60;
            int _2529 = _2525;
            if (_2509)
            {
                _2529 = _1319;
            }
            int _2531 = _2529;
            bool _2533 = _2455 == 64;
            int _2535 = _2531;
            if (_2515)
            {
                _2535 = _1321;
            }
            int _2537 = _2535;
            bool _2539 = _2455 == 68;
            int _2541 = _2537;
            if (_2521)
            {
                _2541 = _1323;
            }
            int _2543 = _2541;
            bool _2545 = _2455 == 72;
            int _2547 = _2543;
            if (_2527)
            {
                _2547 = _1325;
            }
            int _2549 = _2547;
            bool _2551 = _2455 == 76;
            int _2553 = _2549;
            if (_2533)
            {
                _2553 = _1327;
            }
            int _2555 = _2553;
            bool _2557 = _2455 == 80;
            int _2559 = _2555;
            if (_2539)
            {
                _2559 = _1329;
            }
            int _2561 = _2559;
            bool _2563 = _2455 == 84;
            int _2565 = _2561;
            if (_2545)
            {
                _2565 = _1331;
            }
            int _2567 = _2565;
            bool _2569 = _2455 == 88;
            int _2571 = _2567;
            if (_2551)
            {
                _2571 = _1333;
            }
            int _2573 = _2571;
            bool _2575 = _2455 == 92;
            int _2577 = _2573;
            if (_2557)
            {
                _2577 = _1335;
            }
            int _2579 = _2577;
            bool _2581 = _2455 == 96;
            int _2583 = _2579;
            if (_2563)
            {
                _2583 = _1337;
            }
            int _2585 = _2583;
            int _2587 = _2585;
            if (_2569)
            {
                _2587 = _1339;
            }
            int _2589 = _2587;
            int _2591 = _2589;
            if (_2575)
            {
                _2591 = _1341;
            }
            int _2593 = _2591;
            int _2595 = _2593;
            if (_2581)
            {
                _2595 = _1343;
            }
            int _2597 = _2595;
            bool _2599 = _2443 >= _2597;
            if (!_2599)
            {
                _2453 = _2439;
            }
        }
        int _2601 = _2453;
        _1377 = _2601;
    }
    int _2603 = _1377;
    int _2605 = _2603 * 8;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    float _2609 = as_type<float>(_31[int(_2607)]);
    int _2611 = _2605 + 4;
    uint _2613 = uint(int(uint(_2611) >> uint(2)));
    float _2615 = as_type<float>(_31[int(_2613)]);
    int _2617 = _72 + 16;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2619)] = as_type<uint>(_2609);
    int _2621 = _2617 + 4;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    (*spvDescriptorSet0.vp_s0)._m0[int(_2623)] = as_type<uint>(_2615);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return;
}

