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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _1253 = false;
    float _42 = as_type<float>(gl_WorkGroupID.x);
    float _44 = as_type<float>(gl_LocalInvocationID.x);
    float _46 = as_type<float>(gl_WorkGroupID.y);
    float _48 = as_type<float>(gl_LocalInvocationID.y);
    int _51 = as_type<int>(_42) << 4;
    int _53 = _51 + as_type<int>(_44);
    bool _57 = _53 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _59 = as_type<int>(_46) << 4;
    int _61 = _59 + as_type<int>(_48);
    if (_57)
    {
        return;
    }
    bool _63 = _61 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    if (_63)
    {
        return;
    }
    bool _65 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    float _67 = float(uint(_53));
    float _69 = float(uint(_61));
    float _71 = fma(_67, (*spvDescriptorSet0.cp_c3)._m0[1].x, (*spvDescriptorSet0.cp_c3)._m0[1].z);
    float _73 = fma(_69, (*spvDescriptorSet0.cp_c3)._m0[1].y, (*spvDescriptorSet0.cp_c3)._m0[1].w);
    bool _75 = !_65;
    float _77 = -10000000.0;
    float _79 = 10000000.0;
    float _81 = 10000000.0;
    float _83 = -10000000.0;
    if (!_75)
    {
        int _85 = 0;
        int _87 = 0;
        int _89 = 0;
        int _91 = 0;
        int _93 = 0;
        int _95 = 0;
        float _97 = 0.0;
        float _99 = 0.0;
        int _101 = 0;
        int _103 = 0;
        int _105 = 0;
        int _107 = 0;
        int _109 = 0;
        bool _233;
        do
        {
            int _111 = _85;
            int _113 = _87;
            int _115 = _89;
            int _117 = _91;
            int _119 = _93;
            int _121 = _95;
            float _123 = _97;
            float _125 = _99;
            float _127 = _77;
            float _129 = _79;
            int _131 = _101;
            int _133 = _103;
            int _135 = _105;
            int _137 = _107;
            int _139 = _109;
            bool _141 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
            int _143 = _111 + 1;
            bool _145 = _143 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
            bool _147 = !_141;
            _85 = _143;
            float _149 = _123;
            float _151 = _125;
            float _153 = _127;
            float _155 = _129;
            int _157 = _113;
            int _159 = _115;
            int _161 = _117;
            int _163 = _119;
            int _165 = _121;
            float _167 = _123;
            float _169 = _125;
            float _171 = _127;
            float _173 = _129;
            int _175 = _131;
            int _177 = _133;
            int _179 = _135;
            int _181 = _137;
            int _183 = _139;
            int _185 = _113;
            int _187 = _115;
            int _189 = _117;
            float _191 = as_type<float>(_119);
            int _193 = _121;
            float _195 = _123;
            float _197 = _125;
            float _199 = _127;
            float _201 = _129;
            int _203 = _131;
            int _205 = _133;
            int _207 = _135;
            int _209 = _137;
            int _211 = _139;
            if (!_147)
            {
                float _213 = float(_111);
                int _215 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _217 = _215 + 1;
                bool _219 = _217 > 3;
                bool _221 = !_219;
                int _223 = 0;
                int _225 = 0;
                int _227 = -1;
                if (!_221)
                {
                    float _229 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    int _231 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x) + (-3);
                    _227 = 0;
                    do
                    {
                        int _235 = _223;
                        float _237 = _149;
                        int _239 = as_type<int>(_151);
                        float _241 = _153;
                        float _243 = _155;
                        int _245 = _235 + 3;
                        float _247 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                        float _249 = float(_235);
                        int _251 = _235 + 2;
                        float _253 = float(_245);
                        float _255 = fma(_249, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        int _257 = _235 + 1;
                        float _259 = float(_251);
                        float _261 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _263 = float(_257);
                        float _265 = fma(_259, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _1491 = float2(_255, _229);
                        float3 _269 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1491, float2(0.0), isnan(_1491)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1491, float2(0.0), isnan(_1491)), level(0.0)).xyz;
                        float _271 = _269.x;
                        float _273 = _269.y;
                        float _275 = _269.z;
                        float _277 = fma(_263, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _1512 = float2(_277, _247);
                        float3 _279 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1512, float2(0.0), isnan(_1512)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1512, float2(0.0), isnan(_1512)), level(0.0)).xyz;
                        float _281 = _279.x;
                        float _283 = _279.y;
                        float _285 = _279.z;
                        float2 _1526 = float2(_265, _247);
                        float3 _287 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1526, float2(0.0), isnan(_1526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1526, float2(0.0), isnan(_1526)), level(0.0)).xyz;
                        float _289 = _287.x;
                        float _291 = _287.y;
                        float _293 = _287.z;
                        float2 _1540 = float2(_261, _247);
                        float3 _295 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1540, float2(0.0), isnan(_1540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1540, float2(0.0), isnan(_1540)), level(0.0)).xyz;
                        float _297 = _295.x;
                        float _299 = _295.y;
                        float _301 = _295.z;
                        int _303 = _235 + 4;
                        float _305 = -_273;
                        float _307 = fma(_271, 2.0, _305);
                        float _309 = -_275;
                        float _311 = _309 + _273;
                        float _313 = fma(_273, -0.5, _271);
                        float _315 = -_275;
                        float _317 = _315 + _307;
                        float _319 = _311 * 1.7320499420166015625;
                        float _321 = fma(_275, -0.5, _313);
                        float _323 = 1.0 / _317;
                        float _325 = -_283;
                        float _327 = fma(_281, 2.0, _325);
                        float _329 = -_285;
                        float _331 = _329 + _327;
                        float _333 = 1.0 / _331;
                        float _335 = _319 * _323;
                        float _337 = -_285;
                        float _339 = _337 + _283;
                        float _341 = abs(_335);
                        bool _343 = _341 > 1.0;
                        float _345 = -_291;
                        float _347 = fma(_289, 2.0, _345);
                        float _349 = _339 * 1.7320499420166015625;
                        float _351 = -_301;
                        float _353 = _351 + _299;
                        float _355 = abs(_335);
                        bool _357 = _355 > as_type<float>(0x7f800000u /* inf */);
                        bool _359 = isnan(_355);
                        bool _361 = _357 || _359;
                        bool _363 = isnan(as_type<float>(0x7f800000u /* inf */));
                        bool _365 = _361 || _363;
                        float _367 = -_293;
                        float _369 = _367 + _347;
                        float _371 = _349 * _333;
                        float _373 = -_299;
                        float _375 = fma(_297, 2.0, _373);
                        float _377 = -_293;
                        float _379 = _377 + _291;
                        float _381 = _353 * 1.7320499420166015625;
                        float _383 = fma(_291, -0.5, _289);
                        float _385 = 1.0 / _369;
                        float _387 = abs(_371);
                        bool _389 = _387 > 1.0;
                        _223 = _303;
                        float _391 = _237;
                        int _393 = _239;
                        _161 = as_type<int>(_293);
                        _163 = as_type<int>(_297);
                        _165 = as_type<int>(_301);
                        _225 = _303;
                        if (!_343)
                        {
                            float _395 = abs(_335);
                            float _397 = (-0.0) + _395;
                            _391 = _397;
                        }
                        float _399 = _391;
                        float _401 = -_301;
                        float _403 = _401 + _375;
                        float _405 = _379 * 1.7320499420166015625;
                        float _407 = fma(_293, -0.5, _383);
                        float _409 = fma(_299, -0.5, _297);
                        float _411 = _399;
                        if (_343)
                        {
                            float _413 = abs(_335);
                            float _415 = 1.0 / _413;
                            _411 = _415;
                        }
                        float _417 = _411;
                        float _419 = fma(_301, -0.5, _409);
                        _181 = as_type<int>(_419);
                        if (!_389)
                        {
                            float _421 = abs(_371);
                            float _423 = (-0.0) + _421;
                            _393 = as_type<int>(_423);
                        }
                        int _425 = _393;
                        float _427 = 1.0 / _403;
                        float _429 = _405 * _385;
                        float _431 = abs(_429);
                        bool _433 = _431 > 1.0;
                        float _435 = _417 * _417;
                        int _437 = _425;
                        float _439 = _435;
                        if (_389)
                        {
                            float _441 = abs(_371);
                            float _443 = 1.0 / _441;
                            _437 = as_type<int>(_443);
                        }
                        int _445 = _437;
                        float _447 = _435 + 11.33538818359375;
                        float _449 = fma(_435, _447, 28.84246826171875);
                        float _451 = fma(_435, _449, 19.6966705322265625);
                        float _453 = _381 * _427;
                        float _455 = fma(_435, -0.82336294651031494140625, -5.674867153167724609375);
                        float _457 = as_type<float>(_445) * as_type<float>(_445);
                        float _459 = 1.0 / _451;
                        float _461 = abs(_453);
                        bool _463 = _461 > 1.0;
                        float _465 = fma(_435, _455, -6.565555095672607421875);
                        float _467 = _457 + 11.33538818359375;
                        float _469 = fma(_457, -0.82336294651031494140625, -5.674867153167724609375);
                        float _471 = _435 * _465;
                        _151 = as_type<float>(_445);
                        _169 = as_type<float>(_445);
                        if (!_433)
                        {
                            float _473 = abs(_429);
                            float _475 = (-0.0) + _473;
                            _439 = _475;
                        }
                        float _477 = _439;
                        float _479 = fma(_457, _467, 28.84246826171875);
                        float _481 = _471 * _417;
                        float _483 = fma(_457, _479, 19.6966705322265625);
                        float _485 = _477;
                        float _487 = _481;
                        if (_433)
                        {
                            float _489 = abs(_429);
                            float _491 = 1.0 / _489;
                            _485 = _491;
                        }
                        float _493 = _485;
                        float _495 = fma(_481, _459, _417);
                        int _497 = as_type<int>(_495);
                        if (!_463)
                        {
                            float _499 = abs(_453);
                            float _501 = (-0.0) + _499;
                            _487 = _501;
                        }
                        float _503 = _487;
                        float _505 = fma(_457, _469, -6.565555095672607421875);
                        int _507 = as_type<int>(_335) & int(0x80000000);
                        if (_343)
                        {
                            float _509 = -_495;
                            float _511 = _509 + 1.57079637050628662109375;
                            _497 = as_type<int>(_511);
                        }
                        int _513 = _497;
                        float _515 = 1.0 / _483;
                        bool _517 = _321 >= 0.0;
                        bool _519 = isnan(_321);
                        bool _521 = _517 || _519;
                        bool _523 = isnan(0.0);
                        bool _525 = _521 || _523;
                        float _527 = fma(_283, -0.5, _281);
                        float _529 = _457 * _505;
                        float _531 = as_type<float>(_513);
                        if (!_365)
                        {
                            int _533 = _507 | _513;
                            _531 = as_type<float>(_533);
                        }
                        float _535 = _531;
                        float _537 = fma(_285, -0.5, _527);
                        float _539 = _529 * as_type<float>(_445);
                        float _541 = _503;
                        float _543 = _535;
                        _159 = as_type<int>(_537);
                        if (_463)
                        {
                            float _545 = abs(_453);
                            float _547 = 1.0 / _545;
                            _541 = _547;
                        }
                        float _549 = _541;
                        float _551 = _493 * _493;
                        float _553 = abs(_371);
                        bool _555 = _553 > as_type<float>(0x7f800000u /* inf */);
                        bool _557 = isnan(_553);
                        bool _559 = _555 || _557;
                        bool _561 = isnan(as_type<float>(0x7f800000u /* inf */));
                        bool _563 = _559 || _561;
                        int _565 = as_type<int>(_371) & int(0x80000000);
                        float _567 = _551 + 11.33538818359375;
                        float _569 = fma(_551, -0.82336294651031494140625, -5.674867153167724609375);
                        _175 = as_type<int>(_551);
                        if (!_525)
                        {
                            float _571 = _535 + 3.1415927410125732421875;
                            _543 = _571;
                        }
                        float _573 = _543;
                        float _575 = fma(_539, _515, as_type<float>(_445));
                        float _577 = fma(_551, _567, 28.84246826171875);
                        float _579 = fma(_551, _569, -6.565555095672607421875);
                        float _581 = abs(_453);
                        bool _583 = _581 > as_type<float>(0x7f800000u /* inf */);
                        bool _585 = isnan(_581);
                        bool _587 = _583 || _585;
                        bool _589 = isnan(as_type<float>(0x7f800000u /* inf */));
                        bool _591 = _587 || _589;
                        int _593 = as_type<int>(_575);
                        if (_389)
                        {
                            float _595 = -_575;
                            float _597 = _595 + 1.57079637050628662109375;
                            _593 = as_type<int>(_597);
                        }
                        int _599 = _593;
                        float _601 = fma(_551, _577, 19.6966705322265625);
                        float _603 = _551 * _579;
                        bool _605 = _537 >= 0.0;
                        bool _607 = isnan(_537);
                        bool _609 = _605 || _607;
                        bool _611 = isnan(0.0);
                        bool _613 = _609 || _611;
                        float _615 = _549 * _549;
                        float _617 = as_type<float>(_599);
                        if (!_563)
                        {
                            int _619 = _565 | _599;
                            _617 = as_type<float>(_619);
                        }
                        float _621 = _617;
                        float _623 = _603 * _493;
                        float _625 = 1.0 / _601;
                        float _627 = _615 + 11.33538818359375;
                        float _629 = fma(_615, -0.82336294651031494140625, -5.674867153167724609375);
                        float _631 = abs(_429);
                        bool _633 = _631 > as_type<float>(0x7f800000u /* inf */);
                        bool _635 = isnan(_631);
                        bool _637 = _633 || _635;
                        bool _639 = isnan(as_type<float>(0x7f800000u /* inf */));
                        bool _641 = _637 || _639;
                        float _643 = fma(_615, _627, 28.84246826171875);
                        float _645 = fma(_615, _629, -6.565555095672607421875);
                        int _647 = as_type<int>(_429) & int(0x80000000);
                        float _649 = fma(_615, _643, 19.6966705322265625);
                        float _651 = _615 * _645;
                        int _653 = as_type<int>(_453) & int(0x80000000);
                        float _655 = _621;
                        _157 = as_type<int>(_623);
                        _177 = as_type<int>(_645);
                        _179 = _653;
                        if (!_613)
                        {
                            float _657 = _621 + 3.1415927410125732421875;
                            _655 = _657;
                        }
                        float _659 = _655;
                        float _661 = precise::max(_241, _573);
                        float _663 = _651 * _549;
                        float _665 = 1.0 / _649;
                        float _667 = fma(_623, _625, _493);
                        float _669 = precise::min(_243, _573);
                        float _671 = precise::max(_661, _659);
                        int _673 = as_type<int>(_667);
                        _183 = as_type<int>(_659);
                        if (_433)
                        {
                            float _675 = -_667;
                            float _677 = _675 + 1.57079637050628662109375;
                            _673 = as_type<int>(_677);
                        }
                        int _679 = _673;
                        bool _681 = _407 >= 0.0;
                        bool _683 = isnan(_407);
                        bool _685 = _681 || _683;
                        bool _687 = isnan(0.0);
                        bool _689 = _685 || _687;
                        float _691 = precise::min(_669, _659);
                        _149 = _691;
                        float _693 = as_type<float>(_679);
                        _167 = _691;
                        if (!_641)
                        {
                            int _695 = _647 | _679;
                            _693 = as_type<float>(_695);
                        }
                        float _697 = _693;
                        bool _699 = _419 >= 0.0;
                        bool _701 = isnan(_419);
                        bool _703 = _699 || _701;
                        bool _705 = isnan(0.0);
                        bool _707 = _703 || _705;
                        float _709 = fma(_663, _665, _549);
                        float _711 = _697;
                        int _713 = as_type<int>(_709);
                        if (!_689)
                        {
                            float _715 = _697 + 3.1415927410125732421875;
                            _711 = _715;
                        }
                        float _717 = _711;
                        if (_463)
                        {
                            float _719 = -_709;
                            float _721 = _719 + 1.57079637050628662109375;
                            _713 = as_type<int>(_721);
                        }
                        int _723 = _713;
                        bool _725 = _303 >= _231;
                        float _727 = precise::max(_671, _717);
                        float _729 = as_type<float>(_723);
                        if (!_591)
                        {
                            int _731 = _653 | _723;
                            _729 = as_type<float>(_731);
                        }
                        float _733 = _729;
                        float _735 = precise::min(_691, _717);
                        float _737 = _733;
                        if (!_707)
                        {
                            float _739 = _733 + 3.1415927410125732421875;
                            _737 = _739;
                        }
                        float _741 = _737;
                        float _743 = precise::max(_727, _741);
                        float _745 = precise::min(_735, _741);
                        _233 = !_725;
                        _153 = _743;
                        _155 = _745;
                        _171 = _743;
                        _173 = _745;
                    } while (_233);
                }
                int _747 = _157;
                int _749 = _159;
                int _751 = _161;
                int _753 = _163;
                int _755 = _165;
                float _757 = _167;
                float _759 = _169;
                float _761 = _171;
                float _763 = _173;
                int _765 = _225;
                int _767 = _175;
                int _769 = _177;
                int _771 = _179;
                int _773 = _227;
                int _775 = _181;
                int _777 = _183;
                int _779 = ~_765;
                int _781 = _779 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _783 = _781 + 1;
                bool _785 = _783 > 1;
                bool _787 = !_785;
                int _789 = _751;
                int _791 = _753;
                int _793 = _755;
                float _795 = _759;
                float _797 = _761;
                float _799 = _763;
                int _801 = _767;
                int _803 = _769;
                int _805 = _771;
                int _807 = _765;
                int _809 = _773;
                int _811 = _775;
                int _813 = _777;
                _185 = _747;
                _187 = _749;
                _195 = _757;
                if (!_787)
                {
                    int _815 = _765 + 1;
                    float _817 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _819 = float(_765);
                    float _821 = float(_815);
                    float _823 = fma(_819, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float _825 = fma(_821, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _2274 = float2(_823, _817);
                    float3 _827 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2274, float2(0.0), isnan(_2274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2274, float2(0.0), isnan(_2274)), level(0.0)).xyz;
                    float _829 = _827.x;
                    float _831 = _827.y;
                    float _833 = _827.z;
                    float2 _2288 = float2(_825, _817);
                    float3 _835 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2288, float2(0.0), isnan(_2288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2288, float2(0.0), isnan(_2288)), level(0.0)).xyz;
                    float _837 = _835.x;
                    float _839 = _835.y;
                    float _841 = _835.z;
                    float _843 = -_831;
                    float _845 = fma(_829, 2.0, _843);
                    float _847 = -_833;
                    float _849 = _847 + _845;
                    float _851 = -_839;
                    float _853 = fma(_837, 2.0, _851);
                    float _855 = -_841;
                    float _857 = _855 + _839;
                    float _859 = fma(_839, -0.5, _837);
                    float _861 = 1.0 / _849;
                    float _863 = -_841;
                    float _865 = _863 + _853;
                    float _867 = -_833;
                    float _869 = _867 + _831;
                    float _871 = _857 * 1.7320499420166015625;
                    float _873 = fma(_831, -0.5, _829);
                    float _875 = fma(_841, -0.5, _859);
                    float _877 = _869 * 1.7320499420166015625;
                    float _879 = 1.0 / _865;
                    float _881 = fma(_833, -0.5, _873);
                    bool _883 = _881 >= 0.0;
                    bool _885 = isnan(_881);
                    bool _887 = _883 || _885;
                    bool _889 = isnan(0.0);
                    bool _891 = _887 || _889;
                    float _893 = _877 * _861;
                    float _895 = abs(_893);
                    bool _897 = _895 > 1.0;
                    float _899 = abs(_893);
                    bool _901 = _899 > as_type<float>(0x7f800000u /* inf */);
                    bool _903 = isnan(_899);
                    bool _905 = _901 || _903;
                    bool _907 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _909 = _905 || _907;
                    float _911 = _871 * _879;
                    int _913 = as_type<int>(_893) & int(0x80000000);
                    float _915 = abs(_911);
                    bool _917 = _915 > 1.0;
                    float _919 = abs(_911);
                    bool _921 = _919 > as_type<float>(0x7f800000u /* inf */);
                    bool _923 = isnan(_919);
                    bool _925 = _921 || _923;
                    bool _927 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _929 = _925 || _927;
                    float _931 = _817;
                    float _933 = _849;
                    _791 = as_type<int>(_841);
                    _795 = 0.82336294651031494140625;
                    _801 = as_type<int>(_881);
                    _803 = as_type<int>(_833);
                    _811 = as_type<int>(_911);
                    _813 = _815;
                    if (!_897)
                    {
                        float _935 = abs(_893);
                        float _937 = (-0.0) + _935;
                        _931 = _937;
                    }
                    float _939 = _931;
                    float _941 = _939;
                    if (_897)
                    {
                        float _943 = abs(_893);
                        float _945 = 1.0 / _943;
                        _941 = _945;
                    }
                    float _947 = _941;
                    if (!_917)
                    {
                        float _949 = abs(_911);
                        float _951 = (-0.0) + _949;
                        _933 = _951;
                    }
                    float _953 = _933;
                    float _955 = _953;
                    if (_917)
                    {
                        float _957 = abs(_911);
                        float _959 = 1.0 / _957;
                        _955 = _959;
                    }
                    float _961 = _955;
                    float _963 = _947 * _947;
                    float _965 = _963 + 11.33538818359375;
                    float _967 = _961 * _961;
                    float _969 = fma(_963, _965, 28.84246826171875);
                    float _971 = _967 + 11.33538818359375;
                    float _973 = fma(_963, _969, 19.6966705322265625);
                    float _975 = fma(_963, -0.82336294651031494140625, -5.674867153167724609375);
                    float _977 = fma(_967, _971, 28.84246826171875);
                    float _979 = fma(_963, _975, -6.565555095672607421875);
                    float _981 = 1.0 / _973;
                    float _983 = fma(_967, _977, 19.6966705322265625);
                    float _985 = fma(_967, -0.82336294651031494140625, -5.674867153167724609375);
                    float _987 = _963 * _979;
                    float _989 = fma(_967, _985, -6.565555095672607421875);
                    float _991 = _987 * _947;
                    float _993 = 1.0 / _983;
                    float _995 = _967 * _989;
                    int _997 = _815 + 1;
                    float _999 = _995 * _961;
                    float _1001 = fma(_991, _981, _947);
                    int _1003 = as_type<int>(_1001);
                    _789 = as_type<int>(_999);
                    _793 = as_type<int>(_981);
                    _805 = as_type<int>(_991);
                    _807 = _997;
                    if (_897)
                    {
                        float _1005 = -_1001;
                        float _1007 = _1005 + 1.57079637050628662109375;
                        _1003 = as_type<int>(_1007);
                    }
                    int _1009 = _1003;
                    bool _1011 = _875 >= 0.0;
                    bool _1013 = isnan(_875);
                    bool _1015 = _1011 || _1013;
                    bool _1017 = isnan(0.0);
                    bool _1019 = _1015 || _1017;
                    float _1021 = fma(_999, _993, _961);
                    float _1023 = as_type<float>(_1009);
                    int _1025 = as_type<int>(_1021);
                    if (!_909)
                    {
                        int _1027 = _913 | _1009;
                        _1023 = as_type<float>(_1027);
                    }
                    float _1029 = _1023;
                    int _1031 = as_type<int>(_911) & int(0x80000000);
                    float _1033 = _1029;
                    if (_917)
                    {
                        float _1035 = -_1021;
                        float _1037 = _1035 + 1.57079637050628662109375;
                        _1025 = as_type<int>(_1037);
                    }
                    int _1039 = _1025;
                    float _1041 = as_type<float>(_1039);
                    _809 = 0;
                    if (!_891)
                    {
                        float _1043 = _1029 + 3.1415927410125732421875;
                        _1033 = _1043;
                    }
                    float _1045 = _1033;
                    if (!_929)
                    {
                        int _1047 = _1031 | _1039;
                        _1041 = as_type<float>(_1047);
                    }
                    float _1049 = _1041;
                    float _1051 = precise::max(_761, _1045);
                    float _1053 = precise::min(_763, _1045);
                    float _1055 = _1049;
                    if (!_1019)
                    {
                        float _1057 = _1049 + 3.1415927410125732421875;
                        _1055 = _1057;
                    }
                    float _1059 = _1055;
                    float _1061 = precise::max(_1051, _1059);
                    float _1063 = precise::min(_1053, _1059);
                    _797 = _1061;
                    _799 = _1063;
                }
                int _1065 = _789;
                int _1067 = _791;
                int _1069 = _793;
                float _1071 = _795;
                float _1073 = _797;
                float _1075 = _799;
                int _1077 = _801;
                int _1079 = _803;
                int _1081 = _805;
                int _1083 = _807;
                int _1085 = _809;
                int _1087 = _811;
                int _1089 = _813;
                bool _1091 = _1083 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _1093 = (_1091 ? (-1) : 0) | _1085;
                int _1095 = ~_1093;
                int _1097 = _1067;
                _189 = _1065;
                _191 = as_type<float>(_1067);
                _193 = _1069;
                _197 = _1071;
                _199 = _1073;
                _201 = _1075;
                _203 = _1077;
                _205 = _1079;
                _207 = _1081;
                _209 = _1087;
                _211 = _1089;
                if (!(_1095 != 0))
                {
                    float _1099 = float(_1083);
                    float _1101 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _1103 = fma(_1099, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _2671 = float2(_1103, _1101);
                    float3 _1105 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2671, float2(0.0), isnan(_2671)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2671, float2(0.0), isnan(_2671)), level(0.0)).xyz;
                    float _1107 = _1105.x;
                    float _1109 = _1105.y;
                    float _1111 = _1105.z;
                    float _1113 = -_1109;
                    float _1115 = fma(_1107, 2.0, _1113);
                    float _1117 = fma(_1109, -0.5, _1107);
                    float _1119 = -_1111;
                    float _1121 = _1115 + _1119;
                    float _1123 = -_1111;
                    float _1125 = _1123 + _1109;
                    float _1127 = fma(_1111, -0.5, _1117);
                    float _1129 = _1125 * 1.7320499420166015625;
                    float _1131 = 1.0 / _1121;
                    bool _1133 = _1127 >= 0.0;
                    bool _1135 = isnan(_1127);
                    bool _1137 = _1133 || _1135;
                    bool _1139 = isnan(0.0);
                    bool _1141 = _1137 || _1139;
                    float _1143 = _1129 * _1131;
                    float _1145 = abs(_1143);
                    bool _1147 = _1145 > 1.0;
                    float _1149 = abs(_1143);
                    bool _1151 = _1149 > as_type<float>(0x7f800000u /* inf */);
                    bool _1153 = isnan(_1149);
                    bool _1155 = _1151 || _1153;
                    bool _1157 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _1159 = _1155 || _1157;
                    int _1161 = as_type<int>(_1143) & int(0x80000000);
                    _209 = as_type<int>(_1111);
                    if (!_1147)
                    {
                        float _1163 = abs(_1143);
                        float _1165 = (-0.0) + _1163;
                        _1097 = as_type<int>(_1165);
                    }
                    int _1167 = _1097;
                    int _1169 = _1167;
                    if (_1147)
                    {
                        float _1171 = abs(_1143);
                        float _1173 = 1.0 / _1171;
                        _1169 = as_type<int>(_1173);
                    }
                    int _1175 = _1169;
                    float _1177 = as_type<float>(_1175) * as_type<float>(_1175);
                    float _1179 = _1177 + 11.33538818359375;
                    float _1181 = fma(_1177, -0.82336294651031494140625, -5.674867153167724609375);
                    float _1183 = fma(_1177, _1179, 28.84246826171875);
                    float _1185 = fma(_1177, _1181, -6.565555095672607421875);
                    float _1187 = fma(_1177, _1183, 19.6966705322265625);
                    float _1189 = _1177 * _1185;
                    float _1191 = 1.0 / _1187;
                    float _1193 = _1189 * as_type<float>(_1175);
                    float _1195 = fma(_1193, _1191, as_type<float>(_1175));
                    int _1197 = as_type<int>(_1195);
                    _191 = as_type<float>(_1175);
                    _211 = as_type<int>(_1191);
                    if (_1147)
                    {
                        float _1199 = -_1195;
                        float _1201 = _1199 + 1.57079637050628662109375;
                        _1197 = as_type<int>(_1201);
                    }
                    int _1203 = _1197;
                    float _1205 = as_type<float>(_1203);
                    if (!_1159)
                    {
                        int _1207 = _1161 | _1203;
                        _1205 = as_type<float>(_1207);
                    }
                    float _1209 = _1205;
                    int _1211 = as_type<int>(_1209);
                    float _1213 = _1209;
                    if (!_1141)
                    {
                        float _1215 = _1209 + 3.1415927410125732421875;
                        _1211 = as_type<int>(_1215);
                        _1213 = _1215;
                    }
                    int _1217 = _1211;
                    float _1219 = _1213;
                    float _1221 = precise::max(_1073, _1219);
                    float _1223 = precise::min(_1075, _1219);
                    _199 = _1221;
                    _201 = _1223;
                    _203 = _1217;
                }
            }
            int _1225 = _185;
            int _1227 = _187;
            int _1229 = _189;
            int _1231 = as_type<int>(_191);
            int _1233 = _193;
            float _1235 = _195;
            float _1237 = _197;
            float _1239 = _199;
            float _1241 = _201;
            int _1243 = _203;
            int _1245 = _205;
            int _1247 = _207;
            int _1249 = _209;
            int _1251 = _211;
            _87 = _1225;
            _89 = _1227;
            _91 = _1229;
            _93 = _1231;
            _95 = _1233;
            _97 = _1235;
            _99 = _1237;
            _77 = _1239;
            _79 = _1241;
            _101 = _1243;
            _103 = _1245;
            _105 = _1247;
            _107 = _1249;
            _109 = _1251;
            _81 = _1241;
            _83 = _1239;
            if (_145)
            {
                _1253 = true;
                if (_1253)
                {
                    break;
                }
            }
        } while (true);
    }
    _1253 = false;
    float _1255 = _81;
    float _1257 = _83;
    int _1259 = _61 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1261 = _1259 + _53;
    float _1263 = -_1255;
    float _1265 = _1263 + _1257;
    int _1267 = _1261 << 2;
    uint _1270 = uint(int(uint(_1267) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1270)] = as_type<uint>(_1265);
}

