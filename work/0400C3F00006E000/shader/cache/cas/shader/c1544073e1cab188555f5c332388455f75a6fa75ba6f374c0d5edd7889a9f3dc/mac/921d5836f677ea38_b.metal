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
    bool _1249 = false;
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
    int _79 = -887581056;
    if (!_75)
    {
        int _81 = 0;
        int _83 = 0;
        int _85 = 0;
        int _87 = 0;
        int _89 = 0;
        int _91 = 0;
        int _93 = 0;
        int _95 = 0;
        int _97 = 0;
        float _99 = 0.0;
        float _101 = 0.0;
        int _103 = 0;
        int _105 = 0;
        int _107 = 0;
        int _109 = 0;
        int _111 = 0;
        bool _245;
        do
        {
            int _113 = _81;
            int _115 = _83;
            int _117 = _85;
            int _119 = _87;
            int _121 = _89;
            int _123 = _91;
            int _125 = _93;
            int _127 = _95;
            int _129 = _97;
            float _131 = _99;
            float _133 = _101;
            float _135 = _77;
            int _137 = _103;
            int _139 = _105;
            int _141 = _107;
            int _143 = _109;
            int _145 = _111;
            bool _147 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
            int _149 = _113 + 1;
            bool _151 = _149 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
            bool _153 = !_147;
            _81 = _149;
            float _155 = _131;
            float _157 = _133;
            float _159 = _135;
            int _161 = _115;
            int _163 = _117;
            int _165 = _119;
            int _167 = _121;
            int _169 = _123;
            int _171 = _125;
            int _173 = _127;
            int _175 = _129;
            float _177 = _131;
            float _179 = _133;
            float _181 = _135;
            int _183 = _137;
            int _185 = _139;
            int _187 = _141;
            int _189 = _143;
            int _191 = _145;
            int _193 = _115;
            int _195 = _117;
            int _197 = _119;
            int _199 = _121;
            int _201 = _123;
            int _203 = _125;
            int _205 = _127;
            int _207 = _129;
            float _209 = _131;
            float _211 = _133;
            float _213 = _135;
            int _215 = _137;
            int _217 = _139;
            float _219 = as_type<float>(_141);
            int _221 = _143;
            int _223 = _145;
            if (!_153)
            {
                float _225 = float(_113);
                int _227 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _229 = _227 + 1;
                bool _231 = _229 > 3;
                bool _233 = !_231;
                int _235 = 0;
                int _237 = 0;
                int _239 = -1;
                if (!_233)
                {
                    float _241 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    int _243 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x) + (-3);
                    _185 = as_type<int>(_241);
                    _239 = 0;
                    do
                    {
                        int _247 = _235;
                        float _249 = _155;
                        float _251 = _157;
                        float _253 = _159;
                        int _255 = _247 + 1;
                        float _257 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                        float _259 = float(_247);
                        int _261 = _247 + 2;
                        int _263 = _247 + 3;
                        float _265 = fma(_259, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _267 = float(_255);
                        float _269 = float(_261);
                        float _271 = float(_263);
                        float _273 = fma(_267, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _275 = fma(_269, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _1486 = float2(_265, _241);
                        float3 _279 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1486, float2(0.0), isnan(_1486)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1486, float2(0.0), isnan(_1486)), level(0.0)).xyz;
                        float _281 = _279.x;
                        float _283 = _279.y;
                        float _285 = _279.z;
                        float _287 = fma(_271, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _1507 = float2(_273, _257);
                        float3 _289 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1507, float2(0.0), isnan(_1507)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1507, float2(0.0), isnan(_1507)), level(0.0)).xyz;
                        float _291 = _289.x;
                        float _293 = _289.y;
                        float _295 = _289.z;
                        float2 _1521 = float2(_275, _257);
                        float3 _297 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1521, float2(0.0), isnan(_1521)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1521, float2(0.0), isnan(_1521)), level(0.0)).xyz;
                        float _299 = _297.x;
                        float _301 = _297.y;
                        float _303 = _297.z;
                        float2 _1535 = float2(_287, _257);
                        float3 _305 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1535, float2(0.0), isnan(_1535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1535, float2(0.0), isnan(_1535)), level(0.0)).xyz;
                        float _307 = _305.x;
                        float _309 = _305.y;
                        float _311 = _305.z;
                        int _313 = _247 + 4;
                        float _315 = -_283;
                        float _317 = fma(_281, 2.0, _315);
                        float _319 = -_285;
                        float _321 = _319 + _317;
                        float _323 = -_285;
                        float _325 = _323 + _283;
                        float _327 = 1.0 / _321;
                        float _329 = _325 * 1.7320499420166015625;
                        float _331 = -_293;
                        float _333 = fma(_291, 2.0, _331);
                        float _335 = -_295;
                        float _337 = _335 + _333;
                        float _339 = 1.0 / _337;
                        float _341 = _329 * _327;
                        float _343 = abs(_341);
                        bool _345 = _343 > 1.0;
                        float _347 = -_301;
                        float _349 = fma(_299, 2.0, _347);
                        float _351 = -_309;
                        float _353 = fma(_307, 2.0, _351);
                        float _355 = -_311;
                        float _357 = _355 + _309;
                        float _359 = abs(_341);
                        bool _361 = _359 > as_type<float>(0x7f800000u /* inf */);
                        bool _363 = isnan(_359);
                        bool _365 = _361 || _363;
                        bool _367 = isnan(as_type<float>(0x7f800000u /* inf */));
                        bool _369 = _365 || _367;
                        float _371 = -_303;
                        float _373 = _371 + _349;
                        float _375 = -_295;
                        float _377 = _375 + _293;
                        float _379 = -_311;
                        float _381 = _379 + _353;
                        float _383 = -_303;
                        float _385 = _383 + _301;
                        float _387 = 1.0 / _373;
                        float _389 = _377 * 1.7320499420166015625;
                        float _391 = _357 * 1.7320499420166015625;
                        float _393 = _385 * 1.7320499420166015625;
                        _235 = _313;
                        float _395 = _249;
                        float _397 = _251;
                        float _399 = _373;
                        _167 = as_type<int>(_311);
                        _237 = _313;
                        if (!_345)
                        {
                            float _401 = abs(_341);
                            float _403 = (-0.0) + _401;
                            _395 = _403;
                        }
                        float _405 = _395;
                        float _407 = _389 * _339;
                        float _409 = fma(_301, -0.5, _299);
                        float _411 = fma(_309, -0.5, _307);
                        float _413 = 1.0 / _381;
                        float _415 = abs(_407);
                        bool _417 = _415 > 1.0;
                        float _419 = fma(_303, -0.5, _409);
                        float _421 = fma(_311, -0.5, _411);
                        float _423 = _405;
                        _183 = as_type<int>(_419);
                        if (_345)
                        {
                            float _425 = abs(_341);
                            float _427 = 1.0 / _425;
                            _423 = _427;
                        }
                        float _429 = _423;
                        float _431 = _393 * _387;
                        float _433 = fma(_283, -0.5, _281);
                        float _435 = abs(_431);
                        bool _437 = _435 > 1.0;
                        if (!_417)
                        {
                            float _439 = abs(_407);
                            float _441 = (-0.0) + _439;
                            _397 = _441;
                        }
                        float _443 = _397;
                        float _445 = _391 * _413;
                        float _447 = fma(_285, -0.5, _433);
                        float _449 = fma(_293, -0.5, _291);
                        float _451 = _443;
                        if (_417)
                        {
                            float _453 = abs(_407);
                            float _455 = 1.0 / _453;
                            _451 = _455;
                        }
                        float _457 = _451;
                        float _459 = abs(_445);
                        bool _461 = _459 > 1.0;
                        float _463 = fma(_295, -0.5, _449);
                        float _465 = _429 * _429;
                        int _467 = as_type<int>(_407) & int(0x80000000);
                        _165 = _467;
                        if (!_437)
                        {
                            float _469 = abs(_431);
                            float _471 = (-0.0) + _469;
                            _399 = _471;
                        }
                        float _473 = _399;
                        float _475 = _465 + 11.33538818359375;
                        float _477 = fma(_465, _475, 28.84246826171875);
                        float _479 = _473;
                        if (_437)
                        {
                            float _481 = abs(_431);
                            float _483 = 1.0 / _481;
                            _479 = _483;
                        }
                        float _485 = _479;
                        float _487 = fma(_465, _477, 19.6966705322265625);
                        float _489 = _457 * _457;
                        float _491 = fma(_465, -0.82336294651031494140625, -5.674867153167724609375);
                        float _493 = 1.0 / _487;
                        float _495 = _489 + 11.33538818359375;
                        float _497 = fma(_465, _491, -6.565555095672607421875);
                        float _499 = _491;
                        if (!_461)
                        {
                            float _501 = abs(_445);
                            float _503 = (-0.0) + _501;
                            _499 = _503;
                        }
                        float _505 = _499;
                        float _507 = fma(_489, _495, 28.84246826171875);
                        float _509 = _485 * _485;
                        float _511 = _465 * _497;
                        float _513 = fma(_489, _507, 19.6966705322265625);
                        float _515 = _505;
                        _163 = as_type<int>(_509);
                        if (_461)
                        {
                            float _517 = abs(_445);
                            float _519 = 1.0 / _517;
                            _515 = _519;
                        }
                        float _521 = _515;
                        float _523 = _511 * _429;
                        float _525 = fma(_489, -0.82336294651031494140625, -5.674867153167724609375);
                        float _527 = _509 + 11.33538818359375;
                        float _529 = fma(_523, _493, _429);
                        float _531 = fma(_489, _525, -6.565555095672607421875);
                        float _533 = 1.0 / _513;
                        float _535 = fma(_509, _527, 28.84246826171875);
                        int _537 = as_type<int>(_529);
                        if (_345)
                        {
                            float _539 = -_529;
                            float _541 = _539 + 1.57079637050628662109375;
                            _537 = as_type<int>(_541);
                        }
                        int _543 = _537;
                        float _545 = _489 * _531;
                        bool _547 = _447 >= 0.0;
                        bool _549 = isnan(_447);
                        bool _551 = _547 || _549;
                        bool _553 = isnan(0.0);
                        bool _555 = _551 || _553;
                        float _557 = fma(_509, _535, 19.6966705322265625);
                        int _559 = as_type<int>(_341) & int(0x80000000);
                        float _561 = _545 * _457;
                        float _563 = _521 * _521;
                        float _565 = fma(_509, -0.82336294651031494140625, -5.674867153167724609375);
                        _155 = as_type<float>(_559);
                        float _567 = as_type<float>(_543);
                        _177 = as_type<float>(_559);
                        if (!_369)
                        {
                            int _569 = _559 | _543;
                            _567 = as_type<float>(_569);
                        }
                        float _571 = _567;
                        float _573 = 1.0 / _557;
                        float _575 = _563 + 11.33538818359375;
                        float _577 = abs(_407);
                        bool _579 = _577 > as_type<float>(0x7f800000u /* inf */);
                        bool _581 = isnan(_577);
                        bool _583 = _579 || _581;
                        bool _585 = isnan(as_type<float>(0x7f800000u /* inf */));
                        bool _587 = _583 || _585;
                        float _589 = fma(_509, _565, -6.565555095672607421875);
                        float _591 = fma(_563, -0.82336294651031494140625, -5.674867153167724609375);
                        float _593 = fma(_563, _575, 28.84246826171875);
                        float _595 = fma(_561, _533, _457);
                        float _597 = _509 * _589;
                        float _599 = fma(_563, _591, -6.565555095672607421875);
                        float _601 = fma(_563, _593, 19.6966705322265625);
                        int _603 = as_type<int>(_595);
                        float _605 = _571;
                        _171 = as_type<int>(_599);
                        _175 = as_type<int>(_533);
                        if (_417)
                        {
                            float _607 = -_595;
                            float _609 = _607 + 1.57079637050628662109375;
                            _603 = as_type<int>(_609);
                        }
                        int _611 = _603;
                        float _613 = _597 * _485;
                        float _615 = _563 * _599;
                        bool _617 = _463 >= 0.0;
                        bool _619 = isnan(_463);
                        bool _621 = _617 || _619;
                        bool _623 = isnan(0.0);
                        bool _625 = _621 || _623;
                        float _627 = as_type<float>(_611);
                        _169 = as_type<int>(_613);
                        if (!_555)
                        {
                            float _629 = _571 + 3.1415927410125732421875;
                            _605 = _629;
                        }
                        float _631 = _605;
                        float _633 = 1.0 / _601;
                        if (!_587)
                        {
                            int _635 = _467 | _611;
                            _627 = as_type<float>(_635);
                        }
                        float _637 = _627;
                        float _639 = fma(_613, _573, _485);
                        float _641 = abs(_431);
                        bool _643 = _641 > as_type<float>(0x7f800000u /* inf */);
                        bool _645 = isnan(_641);
                        bool _647 = _643 || _645;
                        bool _649 = isnan(as_type<float>(0x7f800000u /* inf */));
                        bool _651 = _647 || _649;
                        float _653 = _615 * _521;
                        float _655 = abs(_445);
                        bool _657 = _655 > as_type<float>(0x7f800000u /* inf */);
                        bool _659 = isnan(_655);
                        bool _661 = _657 || _659;
                        bool _663 = isnan(as_type<float>(0x7f800000u /* inf */));
                        bool _665 = _661 || _663;
                        int _667 = as_type<int>(_639);
                        float _669 = _637;
                        _189 = as_type<int>(_653);
                        if (_437)
                        {
                            float _671 = -_639;
                            float _673 = _671 + 1.57079637050628662109375;
                            _667 = as_type<int>(_673);
                        }
                        int _675 = _667;
                        int _677 = as_type<int>(_431) & int(0x80000000);
                        bool _679 = _419 >= 0.0;
                        bool _681 = isnan(_419);
                        bool _683 = _679 || _681;
                        bool _685 = isnan(0.0);
                        bool _687 = _683 || _685;
                        int _689 = as_type<int>(_445) & int(0x80000000);
                        float _691 = as_type<float>(_675);
                        if (!_625)
                        {
                            float _693 = _637 + 3.1415927410125732421875;
                            _669 = _693;
                        }
                        float _695 = _669;
                        float _697 = precise::max(_253, _631);
                        float _699 = fma(_653, _633, _521);
                        int _701 = as_type<int>(_699);
                        _161 = as_type<int>(_633);
                        _173 = as_type<int>(_697);
                        if (!_651)
                        {
                            int _703 = _677 | _675;
                            _691 = as_type<float>(_703);
                        }
                        float _705 = _691;
                        bool _707 = _421 >= 0.0;
                        bool _709 = isnan(_421);
                        bool _711 = _707 || _709;
                        bool _713 = isnan(0.0);
                        bool _715 = _711 || _713;
                        int _717 = as_type<int>(_705);
                        if (_461)
                        {
                            float _719 = -_699;
                            float _721 = _719 + 1.57079637050628662109375;
                            _701 = as_type<int>(_721);
                        }
                        int _723 = _701;
                        bool _725 = _313 >= _243;
                        float _727 = as_type<float>(_723);
                        if (!_687)
                        {
                            float _729 = _705 + 3.1415927410125732421875;
                            _717 = as_type<int>(_729);
                        }
                        int _731 = _717;
                        float _733 = precise::max(_697, _695);
                        _191 = _731;
                        if (!_665)
                        {
                            int _735 = _689 | _723;
                            _727 = as_type<float>(_735);
                        }
                        float _737 = _727;
                        float _739 = precise::max(_733, as_type<float>(_731));
                        _157 = _739;
                        int _741 = as_type<int>(_737);
                        _179 = _739;
                        if (!_715)
                        {
                            float _743 = _737 + 3.1415927410125732421875;
                            _741 = as_type<int>(_743);
                        }
                        int _745 = _741;
                        float _747 = precise::max(_739, as_type<float>(_745));
                        _245 = !_725;
                        _159 = _747;
                        _181 = _747;
                        _187 = _745;
                    } while (_245);
                }
                int _749 = _161;
                int _751 = _163;
                int _753 = _165;
                int _755 = _167;
                int _757 = _169;
                int _759 = _171;
                int _761 = _173;
                int _763 = _175;
                float _765 = _177;
                float _767 = _179;
                float _769 = _181;
                int _771 = _237;
                int _773 = _183;
                int _775 = _185;
                int _777 = _187;
                int _779 = _239;
                int _781 = _189;
                int _783 = _191;
                int _785 = ~_771;
                int _787 = _785 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _789 = _787 + 1;
                bool _791 = _789 > 1;
                bool _793 = !_791;
                int _795 = _751;
                int _797 = _753;
                int _799 = _755;
                int _801 = _759;
                float _803 = _769;
                int _805 = _773;
                int _807 = _775;
                int _809 = _777;
                int _811 = _771;
                int _813 = _779;
                int _815 = _781;
                int _817 = _783;
                _193 = _749;
                _201 = _757;
                _205 = _761;
                _207 = _763;
                _209 = _765;
                _211 = _767;
                if (!_793)
                {
                    int _819 = _771 + 1;
                    float _821 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _823 = float(_771);
                    float _825 = float(_819);
                    float _827 = fma(_823, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float _829 = fma(_825, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _2261 = float2(_827, _821);
                    float3 _831 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2261, float2(0.0), isnan(_2261)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2261, float2(0.0), isnan(_2261)), level(0.0)).xyz;
                    float _833 = _831.x;
                    float _835 = _831.y;
                    float _837 = _831.z;
                    float2 _2275 = float2(_829, _821);
                    float3 _839 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2275, float2(0.0), isnan(_2275)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2275, float2(0.0), isnan(_2275)), level(0.0)).xyz;
                    float _841 = _839.x;
                    float _843 = _839.y;
                    float _845 = _839.z;
                    float _847 = -_835;
                    float _849 = fma(_833, 2.0, _847);
                    float _851 = -_837;
                    float _853 = _851 + _849;
                    float _855 = -_843;
                    float _857 = fma(_841, 2.0, _855);
                    float _859 = -_845;
                    float _861 = _859 + _843;
                    float _863 = fma(_843, -0.5, _841);
                    float _865 = -_845;
                    float _867 = _865 + _857;
                    float _869 = 1.0 / _853;
                    float _871 = -_837;
                    float _873 = _871 + _835;
                    float _875 = _861 * 1.7320499420166015625;
                    float _877 = fma(_835, -0.5, _833);
                    float _879 = fma(_845, -0.5, _863);
                    float _881 = _873 * 1.7320499420166015625;
                    float _883 = fma(_837, -0.5, _877);
                    float _885 = 1.0 / _867;
                    bool _887 = _883 >= 0.0;
                    bool _889 = isnan(_883);
                    bool _891 = _887 || _889;
                    bool _893 = isnan(0.0);
                    bool _895 = _891 || _893;
                    float _897 = _881 * _869;
                    float _899 = abs(_897);
                    bool _901 = _899 > 1.0;
                    float _903 = abs(_897);
                    bool _905 = _903 > as_type<float>(0x7f800000u /* inf */);
                    bool _907 = isnan(_903);
                    bool _909 = _905 || _907;
                    bool _911 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _913 = _909 || _911;
                    float _915 = _875 * _885;
                    float _917 = abs(_915);
                    bool _919 = _917 > 1.0;
                    float _921 = abs(_915);
                    bool _923 = _921 > as_type<float>(0x7f800000u /* inf */);
                    bool _925 = isnan(_921);
                    bool _927 = _923 || _925;
                    bool _929 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _931 = _927 || _929;
                    int _933 = as_type<int>(_915) & int(0x80000000);
                    float _935 = _821;
                    float _937 = _869;
                    _797 = 1062389738;
                    _805 = as_type<int>(_883);
                    _807 = as_type<int>(_837);
                    _809 = as_type<int>(_845);
                    _815 = as_type<int>(_915);
                    _817 = _819;
                    if (!_901)
                    {
                        float _939 = abs(_897);
                        float _941 = (-0.0) + _939;
                        _935 = _941;
                    }
                    float _943 = _935;
                    float _945 = _943;
                    if (_901)
                    {
                        float _947 = abs(_897);
                        float _949 = 1.0 / _947;
                        _945 = _949;
                    }
                    float _951 = _945;
                    if (!_919)
                    {
                        float _953 = abs(_915);
                        float _955 = (-0.0) + _953;
                        _937 = _955;
                    }
                    float _957 = _937;
                    float _959 = _957;
                    if (_919)
                    {
                        float _961 = abs(_915);
                        float _963 = 1.0 / _961;
                        _959 = _963;
                    }
                    float _965 = _959;
                    int _967 = as_type<int>(_897) & int(0x80000000);
                    float _969 = _951 * _951;
                    float _971 = _969 + 11.33538818359375;
                    float _973 = _965 * _965;
                    float _975 = fma(_969, _971, 28.84246826171875);
                    float _977 = _973 + 11.33538818359375;
                    float _979 = fma(_969, _975, 19.6966705322265625);
                    float _981 = fma(_969, -0.82336294651031494140625, -5.674867153167724609375);
                    float _983 = fma(_973, _977, 28.84246826171875);
                    float _985 = fma(_969, _981, -6.565555095672607421875);
                    float _987 = 1.0 / _979;
                    float _989 = fma(_973, _983, 19.6966705322265625);
                    float _991 = fma(_973, -0.82336294651031494140625, -5.674867153167724609375);
                    float _993 = _969 * _985;
                    float _995 = fma(_973, _991, -6.565555095672607421875);
                    float _997 = _993 * _951;
                    float _999 = 1.0 / _989;
                    float _1001 = _973 * _995;
                    float _1003 = _1001 * _965;
                    float _1005 = fma(_997, _987, _951);
                    int _1007 = as_type<int>(_1005);
                    _795 = _967;
                    _799 = as_type<int>(_987);
                    _801 = as_type<int>(_995);
                    if (_901)
                    {
                        float _1009 = -_1005;
                        float _1011 = _1009 + 1.57079637050628662109375;
                        _1007 = as_type<int>(_1011);
                    }
                    int _1013 = _1007;
                    bool _1015 = _879 >= 0.0;
                    bool _1017 = isnan(_879);
                    bool _1019 = _1015 || _1017;
                    bool _1021 = isnan(0.0);
                    bool _1023 = _1019 || _1021;
                    float _1025 = fma(_1003, _999, _965);
                    float _1027 = as_type<float>(_1013);
                    int _1029 = as_type<int>(_1025);
                    if (!_913)
                    {
                        int _1031 = _967 | _1013;
                        _1027 = as_type<float>(_1031);
                    }
                    float _1033 = _1027;
                    float _1035 = _1033;
                    _813 = 0;
                    if (_919)
                    {
                        float _1037 = -_1025;
                        float _1039 = _1037 + 1.57079637050628662109375;
                        _1029 = as_type<int>(_1039);
                    }
                    int _1041 = _1029;
                    int _1043 = _819 + 1;
                    float _1045 = as_type<float>(_1041);
                    _811 = _1043;
                    if (!_895)
                    {
                        float _1047 = _1033 + 3.1415927410125732421875;
                        _1035 = _1047;
                    }
                    float _1049 = _1035;
                    if (!_931)
                    {
                        int _1051 = _933 | _1041;
                        _1045 = as_type<float>(_1051);
                    }
                    float _1053 = _1045;
                    float _1055 = precise::max(_769, _1049);
                    float _1057 = _1053;
                    if (!_1023)
                    {
                        float _1059 = _1053 + 3.1415927410125732421875;
                        _1057 = _1059;
                    }
                    float _1061 = _1057;
                    float _1063 = precise::max(_1055, _1061);
                    _803 = _1063;
                }
                int _1065 = _795;
                int _1067 = _797;
                int _1069 = _799;
                int _1071 = _801;
                float _1073 = _803;
                int _1075 = _805;
                int _1077 = _807;
                int _1079 = _809;
                int _1081 = _811;
                int _1083 = _813;
                int _1085 = _815;
                int _1087 = _817;
                bool _1089 = _1081 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _1091 = (_1089 ? (-1) : 0) | _1083;
                int _1093 = ~_1091;
                int _1095 = _1079;
                _195 = _1065;
                _197 = _1067;
                _199 = _1069;
                _203 = _1071;
                _213 = _1073;
                _215 = _1075;
                _217 = _1077;
                _219 = as_type<float>(_1079);
                _221 = _1085;
                _223 = _1087;
                if (!(_1093 != 0))
                {
                    float _1097 = float(_1081);
                    float _1099 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _1101 = fma(_1097, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _2648 = float2(_1101, _1099);
                    float3 _1103 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2648, float2(0.0), isnan(_2648)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2648, float2(0.0), isnan(_2648)), level(0.0)).xyz;
                    float _1105 = _1103.x;
                    float _1107 = _1103.y;
                    float _1109 = _1103.z;
                    float _1111 = -_1107;
                    float _1113 = fma(_1105, 2.0, _1111);
                    float _1115 = fma(_1107, -0.5, _1105);
                    float _1117 = -_1109;
                    float _1119 = _1113 + _1117;
                    float _1121 = -_1109;
                    float _1123 = _1121 + _1107;
                    float _1125 = fma(_1109, -0.5, _1115);
                    float _1127 = _1123 * 1.7320499420166015625;
                    float _1129 = 1.0 / _1119;
                    bool _1131 = _1125 >= 0.0;
                    bool _1133 = isnan(_1125);
                    bool _1135 = _1131 || _1133;
                    bool _1137 = isnan(0.0);
                    bool _1139 = _1135 || _1137;
                    float _1141 = _1127 * _1129;
                    float _1143 = abs(_1141);
                    bool _1145 = _1143 > 1.0;
                    float _1147 = abs(_1141);
                    bool _1149 = _1147 > as_type<float>(0x7f800000u /* inf */);
                    bool _1151 = isnan(_1147);
                    bool _1153 = _1149 || _1151;
                    bool _1155 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _1157 = _1153 || _1155;
                    int _1159 = as_type<int>(_1141) & int(0x80000000);
                    _217 = as_type<int>(_1141);
                    _221 = as_type<int>(_1109);
                    if (!_1145)
                    {
                        float _1161 = abs(_1141);
                        float _1163 = (-0.0) + _1161;
                        _1095 = as_type<int>(_1163);
                    }
                    int _1165 = _1095;
                    int _1167 = _1165;
                    if (_1145)
                    {
                        float _1169 = abs(_1141);
                        float _1171 = 1.0 / _1169;
                        _1167 = as_type<int>(_1171);
                    }
                    int _1173 = _1167;
                    float _1175 = as_type<float>(_1173) * as_type<float>(_1173);
                    float _1177 = _1175 + 11.33538818359375;
                    float _1179 = fma(_1175, -0.82336294651031494140625, -5.674867153167724609375);
                    float _1181 = fma(_1175, _1177, 28.84246826171875);
                    float _1183 = fma(_1175, _1179, -6.565555095672607421875);
                    float _1185 = fma(_1175, _1181, 19.6966705322265625);
                    float _1187 = _1175 * _1183;
                    float _1189 = 1.0 / _1185;
                    float _1191 = _1187 * as_type<float>(_1173);
                    float _1193 = fma(_1191, _1189, as_type<float>(_1173));
                    int _1195 = as_type<int>(_1193);
                    _195 = as_type<int>(_1185);
                    _215 = as_type<int>(_1191);
                    _219 = as_type<float>(_1173);
                    _223 = as_type<int>(_1189);
                    if (_1145)
                    {
                        float _1197 = -_1193;
                        float _1199 = _1197 + 1.57079637050628662109375;
                        _1195 = as_type<int>(_1199);
                    }
                    int _1201 = _1195;
                    float _1203 = as_type<float>(_1201);
                    if (!_1157)
                    {
                        int _1205 = _1159 | _1201;
                        _1203 = as_type<float>(_1205);
                    }
                    float _1207 = _1203;
                    float _1209 = _1207;
                    if (!_1139)
                    {
                        float _1211 = _1207 + 3.1415927410125732421875;
                        _1209 = _1211;
                    }
                    float _1213 = _1209;
                    float _1215 = precise::max(_1073, _1213);
                    _213 = _1215;
                }
            }
            int _1217 = _193;
            int _1219 = _195;
            int _1221 = _197;
            int _1223 = _199;
            int _1225 = _201;
            int _1227 = _203;
            int _1229 = _205;
            int _1231 = _207;
            float _1233 = _209;
            float _1235 = _211;
            float _1237 = _213;
            int _1239 = _215;
            int _1241 = _217;
            int _1243 = as_type<int>(_219);
            int _1245 = _221;
            int _1247 = _223;
            _83 = _1217;
            _85 = _1219;
            _87 = _1221;
            _89 = _1223;
            _91 = _1225;
            _93 = _1227;
            _95 = _1229;
            _97 = _1231;
            _99 = _1233;
            _101 = _1235;
            _77 = _1237;
            _103 = _1239;
            _105 = _1241;
            _107 = _1243;
            _109 = _1245;
            _111 = _1247;
            _79 = as_type<int>(_1237);
            if (_151)
            {
                _1249 = true;
                if (_1249)
                {
                    break;
                }
            }
        } while (true);
    }
    _1249 = false;
    int _1251 = _79;
    int _1253 = _61 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1255 = _1253 + _53;
    int _1257 = _1255 << 2;
    uint _1260 = uint(int(uint(_1257) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1260)] = uint(_1251);
}

