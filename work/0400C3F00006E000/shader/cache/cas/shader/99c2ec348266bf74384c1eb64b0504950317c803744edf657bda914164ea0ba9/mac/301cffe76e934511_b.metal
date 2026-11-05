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
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _23* cp_s0 [[id(2)]];
    texture2d<float> cp_t_tcb_A [[id(3)]];
    sampler cp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> cp_t_tcb_8 [[id(5)]];
    sampler cp_t_tcb_8Smplr [[id(6)]];
    sampler cp_t_tcb_ASmplr_w [[id(7)]];
    sampler cp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

static inline __attribute__((always_inline))
void _45(thread const int& _2648, thread const int& _2649, thread const int& _2650, thread const int& _2651, thread int& _2652, thread int& _2653, thread int& _2654, thread int& _2655, thread int& _2656, thread int& _2657)
{
    float _2660 = as_type<float>(_2650) + 0.0;
    bool _2662 = _2660 != 0.0;
    bool _2664 = isnan(_2660);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    int _2672 = _2648;
    int _2674 = _2649;
    int _2676 = _2650;
    int _2678 = _2670 ? (-1) : 0;
    if (!_2670)
    {
        float _2680 = as_type<float>(_2650) * 1.0;
        _2672 = as_type<int>(_2680);
    }
    int _2682 = _2672;
    bool _2684 = !_2670;
    int _2686 = _2682;
    int _2688 = _2682;
    if (!_2684)
    {
        float _2690 = as_type<float>(_2650) + 0.0;
        bool _2692 = _2690 >= 0.0;
        bool _2694 = isnan(_2690);
        bool _2696 = _2692 || _2694;
        bool _2698 = isnan(0.0);
        bool _2700 = _2696 || _2698;
        _2678 = _2700 ? (-1) : 0;
        if (!_2700)
        {
            _2686 = 2147483647;
        }
        int _2702 = _2686;
        bool _2704 = !_2700;
        int _2706 = _2702;
        _2688 = _2702;
        if (!_2704)
        {
            float _2708 = as_type<float>(_2650) + 0.0;
            bool _2710 = _2708 > as_type<float>(0x7f800000u /* inf */);
            bool _2712 = isnan(_2708);
            bool _2714 = _2710 || _2712;
            bool _2716 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2718 = _2714 || _2716;
            _2678 = _2718 ? (-1) : 0;
            if (_2718)
            {
                float _2720 = as_type<float>(_2650) + 1.0;
                _2706 = as_type<int>(_2720);
            }
            int _2722 = _2706;
            int _2724 = _2722;
            _2688 = _2722;
            if (!_2718)
            {
                float _2726 = 0.0 + as_type<float>(_2650);
                bool _2728 = _2726 != as_type<float>(0x7f800000u /* inf */);
                bool _2730 = isnan(_2726);
                bool _2732 = _2728 || _2730;
                bool _2734 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2736 = _2732 || _2734;
                _2678 = _2736 ? (-1) : 0;
                if (!_2736)
                {
                    _2724 = _2650;
                }
                int _2738 = _2724;
                bool _2740 = !_2736;
                _2688 = _2738;
                if (!_2740)
                {
                    float _2742 = as_type<float>(_2650) * 18446744073709551616.0;
                    float _2744 = rsqrt(_2742);
                    float _2746 = _2742 * _2744;
                    float _2748 = _2744 * 0.5;
                    float _2750 = -_2746;
                    float _2752 = 0.0 + _2750;
                    float _2754 = fma(_2748, _2752, 0.5);
                    float _2756 = fma(_2746, _2754, _2746);
                    float _2758 = -_2756;
                    float _2760 = 0.0 + _2758;
                    float _2762 = fma(_2756, _2760, _2742);
                    float _2764 = fma(_2748, _2762, _2756);
                    float _2766 = _2764 * 2.3283064365386962890625e-10;
                    _2688 = as_type<int>(_2766);
                    _2674 = as_type<int>(_2756);
                    _2676 = as_type<int>(_2752);
                }
            }
        }
    }
    int _2768 = _2688;
    int _2770 = _2674;
    int _2772 = _2676;
    int _2774 = _2678;
    _2652 = _2651;
    _2653 = 0;
    _2654 = _2768;
    _2655 = _2770;
    _2656 = _2772;
    _2657 = _2774;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _355 = false;
    float _49 = as_type<float>(gl_WorkGroupID.x);
    int _51 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y) << 5;
    float _53 = as_type<float>(gl_LocalInvocationID.x);
    float _55 = float(uint(_51));
    float _57 = 1.0 / _55;
    int _59 = as_type<int>(_49) << 5;
    int _61 = _59 + as_type<int>(_53);
    float _63 = float(uint(_61));
    float _65 = 0.0;
    bool _69 = false;
    float _71 = 0.0;
    float _73 = 0.0;
    float _75 = 0.0;
    float _77 = 0.0;
    float _79 = 0.0;
    float _81 = 0.0;
    float _83 = 0.0;
    float _85 = 0.0;
    float _87 = 0.0;
    float _89 = 0.0;
    float _91 = 0.0;
    float _93 = 0.0;
    float _95 = 0.0;
    float _97 = 0.0;
    float _99 = 0.0;
    float _101 = 0.0;
    float _103 = 0.0;
    float _105 = 0.0;
    float _107 = 0.0;
    float _109 = 0.0;
    float _111 = 0.0;
    float _113 = 0.0;
    float _115 = 0.0;
    float _117 = 0.0;
    float _119 = 0.0;
    float _121 = 0.0;
    float _123 = 0.0;
    float _125 = 0.0;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = 0.0;
    float _133 = 0.0;
    float _135 = 0.0;
    float _137 = 0.0;
    float _139 = 0.0;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = 0.0;
    float _147 = 0.0;
    float _149 = 0.0;
    float _151 = 0.0;
    float _153 = 0.0;
    float _155 = 0.0;
    float _157 = 0.0;
    float _159 = 0.0;
    float _161 = 0.0;
    float _163 = 0.0;
    float _165 = 0.0;
    float _167 = 0.0;
    float _169 = 0.0;
    float _171 = 0.0;
    float _173 = 0.0;
    float _175 = 0.0;
    float _177 = 0.0;
    bool _179;
    int _341;
    int _343;
    int _345;
    int _347;
    int _349;
    int _351;
    float _353;
    float _639;
    float _641;
    float _643;
    float _645;
    float _647;
    float _649;
    float _659;
    float _661;
    float _663;
    float _665;
    float _667;
    float _669;
    float _671;
    float _673;
    float _675;
    float _677;
    float _679;
    float _681;
    float _683;
    float _685;
    float _687;
    float _689;
    float _691;
    float _693;
    float _695;
    float _697;
    float _699;
    float _701;
    float _703;
    float _705;
    float _707;
    float _709;
    float _711;
    float _713;
    float _715;
    float _717;
    float _719;
    float _721;
    float _723;
    float _725;
    float _727;
    float _729;
    float _731;
    float _733;
    float _735;
    float _737;
    float _739;
    float _741;
    float _743;
    float _745;
    float _747;
    float _749;
    float _751;
    float _753;
    do
    {
        float _181 = _65;
        bool _183 = _69;
        float _185 = _71;
        float _187 = _73;
        float _189 = _75;
        float _191 = _77;
        float _193 = _79;
        float _195 = _81;
        float _197 = _83;
        float _199 = _85;
        float _201 = _87;
        float _203 = _89;
        float _205 = _91;
        float _207 = _93;
        float _209 = _95;
        float _211 = _97;
        float _213 = _99;
        float _215 = _101;
        float _217 = _103;
        float _219 = _105;
        float _221 = _107;
        float _223 = _109;
        float _225 = _111;
        float _227 = _113;
        float _229 = _115;
        float _231 = _117;
        float _233 = _119;
        float _235 = _121;
        float _237 = _123;
        float _239 = _125;
        float _241 = _127;
        float _243 = _129;
        float _245 = _131;
        float _247 = _133;
        float _249 = _135;
        float _251 = _137;
        float _253 = _139;
        float _255 = _141;
        float _257 = _143;
        float _259 = _145;
        float _261 = _147;
        float _263 = _149;
        float _265 = _151;
        float _267 = _153;
        float _269 = _155;
        float _271 = _157;
        float _273 = _159;
        float _275 = _161;
        float _277 = _163;
        float _279 = _165;
        float _281 = _167;
        float _283 = _169;
        float _285 = _171;
        float _287 = _173;
        float _289 = _175;
        float _291 = _177;
        float _293 = _63 + _181;
        float _295 = _293 * _57;
        float _297 = precise::clamp(_295, 0.0, 1.0);
        float _299 = fma(_297, 2.0, -1.0);
        float _301 = _297 * 100.53096771240234375;
        float _303 = abs(_299);
        float _305 = -_303;
        float _307 = _305 + 1.0;
        float _309 = abs(_299);
        float _311 = fma(_309, -0.0187292993068695068359375, 0.074261002242565155029296875);
        bool _313 = _299 < 0.0;
        float _315 = float(_313);
        int _317 = as_type<int>(_307) + (-218103808);
        float _319 = abs(_299);
        float _321 = fma(_319, _311, -0.212114393711090087890625);
        bool _323 = uint(_317) >= 1920991232u;
        float _325 = abs(_299);
        float _327 = fma(_325, _321, 1.570728778839111328125);
        bool _329 = !_323;
        bool _331 = _183;
        if (!_329)
        {
            int _333 = as_type<int>(_321);
            int _335 = _317;
            int _337 = as_type<int>(_307);
            int _339 = 864;
            _45(_333, _335, _337, _339, _341, _343, _345, _347, _349, _351);
            _353 = as_type<float>(_345);
            _355 = true;
        }
        else
        {
            float _357 = rsqrt(_307);
            float _359 = _307 * _357;
            float _361 = _357 * 0.5;
            float _363 = -_359;
            float _365 = 0.0 + _363;
            float _367 = fma(_361, _365, 0.5);
            float _369 = fma(_359, _367, _359);
            float _371 = -_369;
            float _373 = 0.0 + _371;
            float _375 = fma(_369, _373, _307);
            float _377 = fma(_361, _375, _369);
            _353 = _377;
        }
        _355 = false;
        float _379 = _353;
        float _381 = _327 * _379;
        float _383 = _315 * 2.0;
        float _385 = _301 * 0.15915493667125701904296875;
        float _387 = -_383;
        float _389 = fma(_381, _387, _381);
        float _391 = _385 * 6.283185482025146484375;
        float _393 = cos(_391);
        float _395 = fma(_315, 3.1415927410125732421875, _389);
        float _397 = _395 * 0.15915493667125701904296875;
        float _399 = _385 * 6.283185482025146484375;
        float _401 = sin(_399);
        float _403 = _397 * 6.283185482025146484375;
        float _405 = cos(_403);
        float _407 = _397 * 6.283185482025146484375;
        float _409 = sin(_407);
        bool _411 = _405 > 0.0;
        float _413 = _405 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
        float _415 = _409 * _393;
        float _417 = _409 * _401;
        float _419 = fma(_415, (*spvDescriptorSet0.cp_c3)._m0[0].x, _413);
        int _421 = as_type<int>(_327);
        float _423 = _413;
        float _425 = _397;
        if (_411)
        {
            float _427 = 1.0 / _405;
            _421 = as_type<int>(_427);
        }
        int _429 = _421;
        if (_411)
        {
            bool _431 = _405 >= 0.100000001490116119384765625;
            bool _433 = isnan(_405);
            bool _435 = _431 || _433;
            bool _437 = isnan(0.100000001490116119384765625);
            bool _439 = _435 || _437;
            _331 = _439;
        }
        bool _441 = _331;
        float _443 = fma(_417, (*spvDescriptorSet0.cp_c3)._m0[0].z, _419);
        float _445 = abs(_405);
        float _447 = fma(_445, 0.5, 0.5);
        int _449 = _429;
        if (_411)
        {
            float _451 = as_type<float>(_429) * 100.0;
            _449 = as_type<int>(_451);
        }
        int _453 = _449;
        float _455 = as_type<float>(_453);
        if (_411)
        {
            float _457 = _441 ? as_type<float>(_453) : 1000.0;
            _455 = _457;
        }
        float _459 = _455;
        float _461 = _459;
        if (_411)
        {
            float _463 = fma(_415, _459, (*spvDescriptorSet0.cp_c3)._m0[4].x);
            _423 = _463;
        }
        float _465 = _423;
        if (_411)
        {
            float _467 = fma(_417, _459, (*spvDescriptorSet0.cp_c3)._m0[4].z);
            _461 = _467;
        }
        float _469 = _461;
        float _471 = _469;
        if (_411)
        {
            float _473 = fma(_465, 6.2500002968590706586837768554688e-05, 0.5);
            _425 = _473;
        }
        float _475 = _425;
        float _477 = fma(_443, 0.5, 0.5);
        if (_411)
        {
            float _479 = fma(_469, 6.2500002968590706586837768554688e-05, 0.5);
            _471 = _479;
        }
        float _481 = _471;
        float _483 = _475;
        if (_411)
        {
            float2 _1444 = float2(_475, _481);
            float _485 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1444, float2(0.0), isnan(_1444)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1444, float2(0.0), isnan(_1444)), level(0.0)).x;
            _483 = _485;
        }
        float _487 = _483;
        float2 _1457 = float2(_477, _447);
        float3 _491 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1457, float2(0.0), isnan(_1457)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1457, float2(0.0), isnan(_1457)), level(0.0)).xyz;
        float _493 = _491.x;
        float _495 = _491.y;
        float _497 = _491.z;
        float _499 = abs(_405);
        float _501 = _499 * (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _503 = _181 + 0.0625;
        float _505 = fma((*spvDescriptorSet0.cp_c3)._m0[3].z, (*spvDescriptorSet0.cp_c3)._m0[3].z, 1.0);
        float _507 = (*spvDescriptorSet0.cp_c3)._m0[3].z * 2.0;
        float _509 = abs(_501);
        bool _511 = _509 > 0.00999999977648258209228515625;
        float _513 = -_507;
        float _515 = fma(_443, _513, _505);
        float _517 = _511 ? _501 : 0.00999999977648258209228515625;
        float _519 = abs(_515);
        float _521 = log2(_519);
        float _523 = _517 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _525 = (*spvDescriptorSet0.cp_c3)._m0[3].x * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _527 = -_523;
        float _529 = exp2(_527);
        float _531 = -_525;
        float _533 = exp2(_531);
        float _535 = _521 * 1.5;
        float _537 = 1.0 / _523;
        float _539 = -_529;
        float _541 = _539 + 1.0;
        float _543 = exp2(_535);
        float _545 = _533 * _541;
        float _547 = (*spvDescriptorSet0.cp_c3)._m0[2].w * (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _549 = _545 * _537;
        float _551 = _549 * _547;
        float _553 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _555 = fma(_553, (*spvDescriptorSet0.cp_c3)._m0[3].z, 1.0);
        float _557 = _543 * 12.56637096405029296875;
        float _559 = -_551;
        float _561 = exp2(_559);
        float _563 = 1.0 / _557;
        float _565 = -_561;
        float _567 = _565 + 1.0;
        float _569 = _555 * _563;
        float _571 = _417 * _417;
        _65 = _503;
        _69 = _511;
        float _573 = _555;
        if (!_411)
        {
            _573 = 0.0;
        }
        float _575 = _573;
        float _577 = fma(_571, 3.0, -1.0);
        float _579 = _567 * _569;
        float _581 = _579 * (*spvDescriptorSet0.cp_c3)._m0[1].x;
        float _583 = _579 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _585 = _575;
        if (_411)
        {
            float _587 = abs(_487);
            float _589 = (-0.0) + _587;
            _585 = _589;
        }
        float _591 = _585;
        float _593 = -_493;
        float _595 = _593 + (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _597 = -_495;
        float _599 = _597 + (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _601 = -_497;
        float _603 = _601 + (*spvDescriptorSet0.cp_c3)._m0[5].z;
        bool _605 = _503 >= 1.0;
        bool _607 = isnan(_503);
        bool _609 = _605 || _607;
        bool _611 = isnan(1.0);
        bool _613 = _609 || _611;
        float _615 = fma(_595, _591, _493);
        float _617 = fma(_599, _591, _495);
        float _619 = fma(_603, _591, _497);
        float _621 = _579 * (*spvDescriptorSet0.cp_c3)._m0[1].z;
        float _623 = fma(_493, _561, _581);
        float _625 = fma(_617, _561, _583);
        float _627 = fma(_615, _561, _581);
        float _629 = fma(_619, _561, _621);
        float _631 = fma(_495, _561, _583);
        float _633 = fma(_497, _561, _621);
        float _635 = _405 * _405;
        float _637 = _415 * _405;
        _639 = fma(_405, _627, _185);
        _641 = fma(_405, _623, _187);
        _643 = fma(_405, _625, _189);
        _645 = fma(_405, _629, _191);
        _647 = fma(_405, _631, _193);
        _649 = fma(_405, _633, _195);
        float _651 = -_635;
        float _653 = fma(_415, _415, _651);
        float _655 = _417 * _405;
        float _657 = _415 * _417;
        _659 = _627 + _197;
        _661 = fma(_417, _627, _199);
        _663 = fma(_415, _627, _201);
        _665 = fma(_627, _637, _203);
        _667 = fma(_627, _655, _205);
        _669 = fma(_627, _577, _207);
        _671 = fma(_627, _653, _209);
        _673 = fma(_627, _657, _211);
        _675 = _625 + _213;
        _677 = fma(_417, _625, _215);
        _679 = fma(_415, _625, _217);
        _681 = fma(_625, _637, _219);
        _683 = fma(_625, _655, _221);
        _685 = fma(_625, _577, _223);
        _687 = fma(_625, _657, _225);
        _689 = fma(_625, _653, _227);
        _691 = _629 + _229;
        _693 = fma(_417, _629, _231);
        _695 = fma(_415, _629, _233);
        _697 = fma(_629, _637, _235);
        _699 = fma(_629, _655, _237);
        _701 = fma(_629, _577, _239);
        _703 = fma(_629, _657, _241);
        _705 = fma(_629, _653, _243);
        _707 = fma(_417, _623, _245);
        _709 = fma(_417, _631, _247);
        _711 = fma(_417, _633, _249);
        _713 = fma(_415, _623, _251);
        _715 = fma(_415, _631, _253);
        _717 = fma(_415, _633, _255);
        _719 = fma(_637, _623, _257);
        _721 = fma(_637, _631, _259);
        _723 = fma(_637, _633, _261);
        _725 = fma(_655, _623, _263);
        _727 = fma(_655, _631, _265);
        _729 = fma(_655, _633, _267);
        _731 = fma(_657, _623, _269);
        _733 = fma(_657, _631, _271);
        _735 = fma(_657, _633, _273);
        _737 = fma(_577, _623, _275);
        _739 = fma(_577, _631, _277);
        _741 = fma(_577, _633, _279);
        _743 = _623 + _281;
        _745 = fma(_653, _623, _283);
        _747 = _631 + _285;
        _749 = fma(_653, _631, _287);
        _751 = fma(_653, _633, _289);
        _753 = _633 + _291;
        _179 = !_613;
        _71 = _639;
        _73 = _641;
        _75 = _643;
        _77 = _645;
        _79 = _647;
        _81 = _649;
        _83 = _659;
        _85 = _661;
        _87 = _663;
        _89 = _665;
        _91 = _667;
        _93 = _669;
        _95 = _671;
        _97 = _673;
        _99 = _675;
        _101 = _677;
        _103 = _679;
        _105 = _681;
        _107 = _683;
        _109 = _685;
        _111 = _687;
        _113 = _689;
        _115 = _691;
        _117 = _693;
        _119 = _695;
        _121 = _697;
        _123 = _699;
        _125 = _701;
        _127 = _703;
        _129 = _705;
        _131 = _707;
        _133 = _709;
        _135 = _711;
        _137 = _713;
        _139 = _715;
        _141 = _717;
        _143 = _719;
        _145 = _721;
        _147 = _723;
        _149 = _725;
        _151 = _727;
        _153 = _729;
        _155 = _731;
        _157 = _733;
        _159 = _735;
        _161 = _737;
        _163 = _739;
        _165 = _741;
        _167 = _743;
        _169 = _745;
        _171 = _747;
        _173 = _749;
        _175 = _751;
        _177 = _753;
    } while (_179);
    int _755 = _61 * 224;
    float _757 = _659 * 0.22155688703060150146484375;
    float _759 = _675 * 0.22155688703060150146484375;
    float _761 = _691 * 0.22155688703060150146484375;
    float _763 = _639 * 0.3837479054927825927734375;
    float _765 = _663 * 0.3837479054927825927734375;
    float _767 = _643 * 0.3837479054927825927734375;
    float _769 = _645 * 0.3837479054927825927734375;
    float _771 = _661 * 0.3837479054927825927734375;
    float _773 = _677 * 0.3837479054927825927734375;
    int _775 = _755 + 16;
    float _777 = _693 * 0.3837479054927825927734375;
    uint _780 = uint(int(uint(_755) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_780)] = as_type<uint>(_757);
    int _782 = _755 + 4;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_784)] = as_type<uint>(_759);
    int _786 = _755 + 8;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_788)] = as_type<uint>(_761);
    int _790 = _755 + 12;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_792)] = as_type<uint>(_763);
    float _794 = _679 * 0.3837479054927825927734375;
    float _796 = _695 * 0.3837479054927825927734375;
    int _798 = _755 + 32;
    uint _800 = uint(int(uint(_775) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_800)] = as_type<uint>(_767);
    int _802 = _775 + 4;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_804)] = as_type<uint>(_769);
    int _806 = _775 + 8;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_808)] = as_type<uint>(_771);
    int _810 = _775 + 12;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_812)] = as_type<uint>(_773);
    float _814 = _665 * 0.858085215091705322265625;
    float _816 = _681 * 0.858085215091705322265625;
    float _818 = _697 * 0.858085215091705322265625;
    float _820 = _667 * 0.858085215091705322265625;
    float _822 = _683 * 0.858085215091705322265625;
    float _824 = _699 * 0.858085215091705322265625;
    float _826 = _669 * 0.2477082908153533935546875;
    float _828 = _685 * 0.2477082908153533935546875;
    float _830 = _673 * 0.858085215091705322265625;
    float _832 = _687 * 0.858085215091705322265625;
    float _834 = _703 * 0.858085215091705322265625;
    float _836 = _701 * 0.2477082908153533935546875;
    uint _838 = uint(int(uint(_798) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_838)] = as_type<uint>(_777);
    int _840 = _798 + 4;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_842)] = as_type<uint>(_765);
    int _844 = _798 + 8;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_846)] = as_type<uint>(_794);
    int _848 = _798 + 12;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_850)] = as_type<uint>(_796);
    float _852 = _743 * 0.22155688703060150146484375;
    float _854 = _747 * 0.22155688703060150146484375;
    int _856 = _755 + 48;
    float _858 = _753 * 0.22155688703060150146484375;
    int _860 = _755 + 64;
    float _862 = _641 * 0.3837479054927825927734375;
    int _864 = _755 + 80;
    uint _866 = uint(int(uint(_856) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_866)] = as_type<uint>(_814);
    int _868 = _856 + 4;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_870)] = as_type<uint>(_816);
    int _872 = _856 + 8;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_874)] = as_type<uint>(_818);
    int _876 = _856 + 12;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_878)] = as_type<uint>(_820);
    float _880 = _647 * 0.3837479054927825927734375;
    float _882 = _745 * 0.4290426075458526611328125;
    float _884 = _749 * 0.4290426075458526611328125;
    uint _886 = uint(int(uint(_860) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_886)] = as_type<uint>(_822);
    int _888 = _860 + 4;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_890)] = as_type<uint>(_824);
    int _892 = _860 + 8;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_894)] = as_type<uint>(_826);
    int _896 = _860 + 12;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_898)] = as_type<uint>(_828);
    float _900 = _671 * 0.4290426075458526611328125;
    float _902 = _689 * 0.4290426075458526611328125;
    float _904 = _705 * 0.4290426075458526611328125;
    uint _906 = uint(int(uint(_864) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_906)] = as_type<uint>(_836);
    int _908 = _864 + 4;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_910)] = as_type<uint>(_830);
    int _912 = _864 + 8;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_914)] = as_type<uint>(_832);
    int _916 = _864 + 12;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_918)] = as_type<uint>(_834);
    float _920 = _649 * 0.3837479054927825927734375;
    float _922 = _711 * 0.3837479054927825927734375;
    float _924 = _713 * 0.3837479054927825927734375;
    float _926 = _715 * 0.3837479054927825927734375;
    int _928 = _755 + 96;
    float _930 = _707 * 0.3837479054927825927734375;
    int _932 = _755 + 112;
    float _934 = _717 * 0.3837479054927825927734375;
    int _936 = _755 + 128;
    uint _938 = uint(int(uint(_928) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_938)] = as_type<uint>(_900);
    int _940 = _928 + 4;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_942)] = as_type<uint>(_902);
    int _944 = _928 + 8;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_946)] = as_type<uint>(_904);
    int _948 = _928 + 12;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_950)] = 0u;
    float _952 = _709 * 0.3837479054927825927734375;
    uint _954 = uint(int(uint(_932) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_954)] = as_type<uint>(_852);
    int _956 = _932 + 4;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_958)] = as_type<uint>(_854);
    int _960 = _932 + 8;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_962)] = as_type<uint>(_858);
    int _964 = _932 + 12;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_966)] = as_type<uint>(_862);
    float _968 = _719 * 0.858085215091705322265625;
    float _970 = _721 * 0.858085215091705322265625;
    float _972 = _723 * 0.858085215091705322265625;
    uint _974 = uint(int(uint(_936) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_974)] = as_type<uint>(_880);
    int _976 = _936 + 4;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_978)] = as_type<uint>(_920);
    int _980 = _936 + 8;
    uint _982 = uint(int(uint(_980) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_982)] = as_type<uint>(_930);
    int _984 = _936 + 12;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_986)] = as_type<uint>(_952);
    float _988 = _725 * 0.858085215091705322265625;
    float _990 = _751 * 0.4290426075458526611328125;
    float _992 = _727 * 0.858085215091705322265625;
    float _994 = _729 * 0.858085215091705322265625;
    float _996 = _737 * 0.2477082908153533935546875;
    float _998 = _739 * 0.2477082908153533935546875;
    float _1000 = _731 * 0.858085215091705322265625;
    float _1002 = _733 * 0.858085215091705322265625;
    float _1004 = _735 * 0.858085215091705322265625;
    float _1006 = _741 * 0.2477082908153533935546875;
    int _1008 = _755 + 144;
    int _1010 = _755 + 160;
    int _1012 = _755 + 176;
    uint _1014 = uint(int(uint(_1008) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1014)] = as_type<uint>(_922);
    int _1016 = _1008 + 4;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1018)] = as_type<uint>(_924);
    int _1020 = _1008 + 8;
    uint _1022 = uint(int(uint(_1020) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1022)] = as_type<uint>(_926);
    int _1024 = _1008 + 12;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1026)] = as_type<uint>(_934);
    int _1028 = _755 + 192;
    uint _1030 = uint(int(uint(_1010) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1030)] = as_type<uint>(_968);
    int _1032 = _1010 + 4;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1034)] = as_type<uint>(_970);
    int _1036 = _1010 + 8;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1038)] = as_type<uint>(_972);
    int _1040 = _1010 + 12;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1042)] = as_type<uint>(_988);
    int _1044 = _755 + 208;
    uint _1046 = uint(int(uint(_1012) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1046)] = as_type<uint>(_992);
    int _1048 = _1012 + 4;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1050)] = as_type<uint>(_994);
    int _1052 = _1012 + 8;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1054)] = as_type<uint>(_996);
    int _1056 = _1012 + 12;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1058)] = as_type<uint>(_998);
    uint _1060 = uint(int(uint(_1028) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1060)] = as_type<uint>(_1006);
    int _1062 = _1028 + 4;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1064)] = as_type<uint>(_1000);
    int _1066 = _1028 + 8;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1068)] = as_type<uint>(_1002);
    int _1070 = _1028 + 12;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1072)] = as_type<uint>(_1004);
    uint _1074 = uint(int(uint(_1044) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1074)] = as_type<uint>(_882);
    int _1076 = _1044 + 4;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1078)] = as_type<uint>(_884);
    int _1080 = _1044 + 8;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1082)] = as_type<uint>(_990);
    int _1084 = _1044 + 12;
    uint _1086 = uint(int(uint(_1084) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1086)] = 0u;
}

