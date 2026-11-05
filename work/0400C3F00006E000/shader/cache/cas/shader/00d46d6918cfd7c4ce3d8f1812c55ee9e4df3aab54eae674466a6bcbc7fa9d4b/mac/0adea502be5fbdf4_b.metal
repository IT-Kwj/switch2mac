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
    bool _1245 = false;
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
    float _77 = 0.0;
    float _79 = 0.0;
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
                        float2 _1482 = float2(_265, _241);
                        float3 _279 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1482, float2(0.0), isnan(_1482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1482, float2(0.0), isnan(_1482)), level(0.0)).xyz;
                        float _281 = _279.x;
                        float _283 = _279.y;
                        float _285 = _279.z;
                        float _287 = fma(_271, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _1503 = float2(_273, _257);
                        float3 _289 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1503, float2(0.0), isnan(_1503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1503, float2(0.0), isnan(_1503)), level(0.0)).xyz;
                        float _291 = _289.x;
                        float _293 = _289.y;
                        float _295 = _289.z;
                        float2 _1517 = float2(_275, _257);
                        float3 _297 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1517, float2(0.0), isnan(_1517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1517, float2(0.0), isnan(_1517)), level(0.0)).xyz;
                        float _299 = _297.x;
                        float _301 = _297.y;
                        float _303 = _297.z;
                        float2 _1531 = float2(_287, _257);
                        float3 _305 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1531, float2(0.0), isnan(_1531)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1531, float2(0.0), isnan(_1531)), level(0.0)).xyz;
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
                        float _529 = fma(_489, _525, -6.565555095672607421875);
                        float _531 = fma(_523, _493, _429);
                        float _533 = fma(_509, _527, 28.84246826171875);
                        float _535 = 1.0 / _513;
                        float _537 = _489 * _529;
                        int _539 = as_type<int>(_531);
                        if (_345)
                        {
                            float _541 = -_531;
                            float _543 = _541 + 1.57079637050628662109375;
                            _539 = as_type<int>(_543);
                        }
                        int _545 = _539;
                        bool _547 = _447 >= 0.0;
                        bool _549 = isnan(_447);
                        bool _551 = _547 || _549;
                        bool _553 = isnan(0.0);
                        bool _555 = _551 || _553;
                        float _557 = fma(_509, _533, 19.6966705322265625);
                        int _559 = as_type<int>(_341) & int(0x80000000);
                        float _561 = _537 * _457;
                        float _563 = _521 * _521;
                        float _565 = fma(_509, -0.82336294651031494140625, -5.674867153167724609375);
                        _155 = as_type<float>(_559);
                        float _567 = as_type<float>(_545);
                        _177 = as_type<float>(_559);
                        if (!_369)
                        {
                            int _569 = _559 | _545;
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
                        float _595 = fma(_561, _535, _457);
                        float _597 = _509 * _589;
                        float _599 = fma(_563, _591, -6.565555095672607421875);
                        float _601 = fma(_563, _593, 19.6966705322265625);
                        int _603 = as_type<int>(_595);
                        float _605 = _571;
                        _171 = as_type<int>(_599);
                        _175 = as_type<int>(_535);
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
                        float _679 = _253 + _631;
                        bool _681 = _419 >= 0.0;
                        bool _683 = isnan(_419);
                        bool _685 = _681 || _683;
                        bool _687 = isnan(0.0);
                        bool _689 = _685 || _687;
                        int _691 = as_type<int>(_445) & int(0x80000000);
                        float _693 = as_type<float>(_675);
                        _173 = as_type<int>(_679);
                        if (!_625)
                        {
                            float _695 = _637 + 3.1415927410125732421875;
                            _669 = _695;
                        }
                        float _697 = _669;
                        float _699 = fma(_653, _633, _521);
                        int _701 = as_type<int>(_699);
                        _161 = as_type<int>(_633);
                        if (!_651)
                        {
                            int _703 = _677 | _675;
                            _693 = as_type<float>(_703);
                        }
                        float _705 = _693;
                        float _707 = _679 + _697;
                        bool _709 = _421 >= 0.0;
                        bool _711 = isnan(_421);
                        bool _713 = _709 || _711;
                        bool _715 = isnan(0.0);
                        bool _717 = _713 || _715;
                        float _719 = _705;
                        if (_461)
                        {
                            float _721 = -_699;
                            float _723 = _721 + 1.57079637050628662109375;
                            _701 = as_type<int>(_723);
                        }
                        int _725 = _701;
                        bool _727 = _313 >= _243;
                        float _729 = as_type<float>(_725);
                        if (!_689)
                        {
                            float _731 = _705 + 3.1415927410125732421875;
                            _719 = _731;
                        }
                        float _733 = _719;
                        _191 = as_type<int>(_733);
                        if (!_665)
                        {
                            int _735 = _691 | _725;
                            _729 = as_type<float>(_735);
                        }
                        float _737 = _729;
                        float _739 = _707 + _733;
                        _157 = _739;
                        float _741 = _737;
                        _179 = _739;
                        if (!_717)
                        {
                            float _743 = _737 + 3.1415927410125732421875;
                            _741 = _743;
                        }
                        float _745 = _741;
                        float _747 = _739 + _745;
                        _245 = !_727;
                        _159 = _747;
                        _181 = _747;
                        _187 = as_type<int>(_745);
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
                int _797 = _755;
                int _799 = _759;
                float _801 = _769;
                int _803 = _773;
                int _805 = _775;
                int _807 = _777;
                int _809 = _771;
                int _811 = _779;
                int _813 = _781;
                int _815 = _783;
                _193 = _749;
                _197 = _753;
                _201 = _757;
                _205 = _761;
                _207 = _763;
                _209 = _765;
                _211 = _767;
                if (!_793)
                {
                    int _817 = _771 + 1;
                    float _819 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _821 = float(_771);
                    float _823 = float(_817);
                    float _825 = fma(_821, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float _827 = fma(_823, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _2253 = float2(_825, _819);
                    float3 _829 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2253, float2(0.0), isnan(_2253)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2253, float2(0.0), isnan(_2253)), level(0.0)).xyz;
                    float _831 = _829.x;
                    float _833 = _829.y;
                    float _835 = _829.z;
                    float2 _2267 = float2(_827, _819);
                    float3 _837 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2267, float2(0.0), isnan(_2267)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2267, float2(0.0), isnan(_2267)), level(0.0)).xyz;
                    float _839 = _837.x;
                    float _841 = _837.y;
                    float _843 = _837.z;
                    float _845 = -_833;
                    float _847 = fma(_831, 2.0, _845);
                    float _849 = -_835;
                    float _851 = _849 + _847;
                    float _853 = -_841;
                    float _855 = fma(_839, 2.0, _853);
                    float _857 = -_843;
                    float _859 = _857 + _841;
                    float _861 = fma(_841, -0.5, _839);
                    float _863 = -_843;
                    float _865 = _863 + _855;
                    float _867 = 1.0 / _851;
                    float _869 = -_835;
                    float _871 = _869 + _833;
                    float _873 = _859 * 1.7320499420166015625;
                    float _875 = fma(_833, -0.5, _831);
                    float _877 = fma(_843, -0.5, _861);
                    float _879 = _871 * 1.7320499420166015625;
                    float _881 = fma(_835, -0.5, _875);
                    float _883 = 1.0 / _865;
                    bool _885 = _881 >= 0.0;
                    bool _887 = isnan(_881);
                    bool _889 = _885 || _887;
                    bool _891 = isnan(0.0);
                    bool _893 = _889 || _891;
                    float _895 = _879 * _867;
                    float _897 = abs(_895);
                    bool _899 = _897 > 1.0;
                    float _901 = abs(_895);
                    bool _903 = _901 > as_type<float>(0x7f800000u /* inf */);
                    bool _905 = isnan(_901);
                    bool _907 = _903 || _905;
                    bool _909 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _911 = _907 || _909;
                    float _913 = _873 * _883;
                    float _915 = abs(_913);
                    bool _917 = _915 > 1.0;
                    float _919 = abs(_913);
                    bool _921 = _919 > as_type<float>(0x7f800000u /* inf */);
                    bool _923 = isnan(_919);
                    bool _925 = _921 || _923;
                    bool _927 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _929 = _925 || _927;
                    int _931 = as_type<int>(_913) & int(0x80000000);
                    float _933 = _819;
                    float _935 = _867;
                    _803 = as_type<int>(_881);
                    _805 = as_type<int>(_835);
                    _807 = as_type<int>(_843);
                    _813 = as_type<int>(_913);
                    _815 = _817;
                    if (!_899)
                    {
                        float _937 = abs(_895);
                        float _939 = (-0.0) + _937;
                        _933 = _939;
                    }
                    float _941 = _933;
                    float _943 = _941;
                    if (_899)
                    {
                        float _945 = abs(_895);
                        float _947 = 1.0 / _945;
                        _943 = _947;
                    }
                    float _949 = _943;
                    if (!_917)
                    {
                        float _951 = abs(_913);
                        float _953 = (-0.0) + _951;
                        _935 = _953;
                    }
                    float _955 = _935;
                    float _957 = _955;
                    if (_917)
                    {
                        float _959 = abs(_913);
                        float _961 = 1.0 / _959;
                        _957 = _961;
                    }
                    float _963 = _957;
                    int _965 = as_type<int>(_895) & int(0x80000000);
                    float _967 = _949 * _949;
                    float _969 = _967 + 11.33538818359375;
                    float _971 = _963 * _963;
                    float _973 = fma(_967, _969, 28.84246826171875);
                    float _975 = _971 + 11.33538818359375;
                    float _977 = fma(_967, _973, 19.6966705322265625);
                    float _979 = fma(_967, -0.82336294651031494140625, -5.674867153167724609375);
                    float _981 = fma(_971, -0.82336294651031494140625, -5.674867153167724609375);
                    float _983 = fma(_971, _975, 28.84246826171875);
                    float _985 = fma(_967, _979, -6.565555095672607421875);
                    float _987 = 1.0 / _977;
                    float _989 = fma(_971, _983, 19.6966705322265625);
                    float _991 = fma(_971, _981, -6.565555095672607421875);
                    float _993 = _967 * _985;
                    float _995 = _971 * _991;
                    float _997 = _993 * _949;
                    float _999 = 1.0 / _989;
                    float _1001 = _995 * _963;
                    float _1003 = fma(_997, _987, _949);
                    int _1005 = as_type<int>(_1003);
                    _795 = _965;
                    _797 = as_type<int>(_987);
                    if (_899)
                    {
                        float _1007 = -_1003;
                        float _1009 = _1007 + 1.57079637050628662109375;
                        _1005 = as_type<int>(_1009);
                    }
                    int _1011 = _1005;
                    bool _1013 = _877 >= 0.0;
                    bool _1015 = isnan(_877);
                    bool _1017 = _1013 || _1015;
                    bool _1019 = isnan(0.0);
                    bool _1021 = _1017 || _1019;
                    float _1023 = fma(_1001, _999, _963);
                    float _1025 = as_type<float>(_1011);
                    int _1027 = as_type<int>(_1023);
                    _799 = as_type<int>(_999);
                    if (!_911)
                    {
                        int _1029 = _965 | _1011;
                        _1025 = as_type<float>(_1029);
                    }
                    float _1031 = _1025;
                    float _1033 = _1031;
                    _811 = 0;
                    if (_917)
                    {
                        float _1035 = -_1023;
                        float _1037 = _1035 + 1.57079637050628662109375;
                        _1027 = as_type<int>(_1037);
                    }
                    int _1039 = _1027;
                    int _1041 = _817 + 1;
                    float _1043 = as_type<float>(_1039);
                    _809 = _1041;
                    if (!_893)
                    {
                        float _1045 = _1031 + 3.1415927410125732421875;
                        _1033 = _1045;
                    }
                    float _1047 = _1033;
                    if (!_929)
                    {
                        int _1049 = _931 | _1039;
                        _1043 = as_type<float>(_1049);
                    }
                    float _1051 = _1043;
                    float _1053 = _769 + _1047;
                    float _1055 = _1051;
                    if (!_1021)
                    {
                        float _1057 = _1051 + 3.1415927410125732421875;
                        _1055 = _1057;
                    }
                    float _1059 = _1055;
                    float _1061 = _1053 + _1059;
                    _801 = _1061;
                }
                int _1063 = _795;
                int _1065 = _797;
                int _1067 = _799;
                float _1069 = _801;
                int _1071 = _803;
                int _1073 = _805;
                int _1075 = _807;
                int _1077 = _809;
                int _1079 = _811;
                int _1081 = _813;
                int _1083 = _815;
                bool _1085 = _1077 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _1087 = (_1085 ? (-1) : 0) | _1079;
                int _1089 = ~_1087;
                int _1091 = _1075;
                _195 = _1063;
                _199 = _1065;
                _203 = _1067;
                _213 = _1069;
                _215 = _1071;
                _217 = _1073;
                _219 = as_type<float>(_1075);
                _221 = _1081;
                _223 = _1083;
                if (!(_1089 != 0))
                {
                    float _1093 = float(_1077);
                    float _1095 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _1097 = fma(_1093, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _2637 = float2(_1097, _1095);
                    float3 _1099 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2637, float2(0.0), isnan(_2637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2637, float2(0.0), isnan(_2637)), level(0.0)).xyz;
                    float _1101 = _1099.x;
                    float _1103 = _1099.y;
                    float _1105 = _1099.z;
                    float _1107 = -_1103;
                    float _1109 = fma(_1101, 2.0, _1107);
                    float _1111 = fma(_1103, -0.5, _1101);
                    float _1113 = -_1105;
                    float _1115 = _1109 + _1113;
                    float _1117 = -_1105;
                    float _1119 = _1117 + _1103;
                    float _1121 = fma(_1105, -0.5, _1111);
                    float _1123 = _1119 * 1.7320499420166015625;
                    float _1125 = 1.0 / _1115;
                    bool _1127 = _1121 >= 0.0;
                    bool _1129 = isnan(_1121);
                    bool _1131 = _1127 || _1129;
                    bool _1133 = isnan(0.0);
                    bool _1135 = _1131 || _1133;
                    float _1137 = _1123 * _1125;
                    float _1139 = abs(_1137);
                    bool _1141 = _1139 > 1.0;
                    float _1143 = abs(_1137);
                    bool _1145 = _1143 > as_type<float>(0x7f800000u /* inf */);
                    bool _1147 = isnan(_1143);
                    bool _1149 = _1145 || _1147;
                    bool _1151 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _1153 = _1149 || _1151;
                    int _1155 = as_type<int>(_1137) & int(0x80000000);
                    _217 = as_type<int>(_1137);
                    _221 = as_type<int>(_1105);
                    if (!_1141)
                    {
                        float _1157 = abs(_1137);
                        float _1159 = (-0.0) + _1157;
                        _1091 = as_type<int>(_1159);
                    }
                    int _1161 = _1091;
                    int _1163 = _1161;
                    if (_1141)
                    {
                        float _1165 = abs(_1137);
                        float _1167 = 1.0 / _1165;
                        _1163 = as_type<int>(_1167);
                    }
                    int _1169 = _1163;
                    float _1171 = as_type<float>(_1169) * as_type<float>(_1169);
                    float _1173 = _1171 + 11.33538818359375;
                    float _1175 = fma(_1171, -0.82336294651031494140625, -5.674867153167724609375);
                    float _1177 = fma(_1171, _1173, 28.84246826171875);
                    float _1179 = fma(_1171, _1175, -6.565555095672607421875);
                    float _1181 = fma(_1171, _1177, 19.6966705322265625);
                    float _1183 = _1171 * _1179;
                    float _1185 = 1.0 / _1181;
                    float _1187 = _1183 * as_type<float>(_1169);
                    float _1189 = fma(_1187, _1185, as_type<float>(_1169));
                    int _1191 = as_type<int>(_1189);
                    _195 = as_type<int>(_1181);
                    _215 = as_type<int>(_1187);
                    _219 = as_type<float>(_1169);
                    _223 = as_type<int>(_1185);
                    if (_1141)
                    {
                        float _1193 = -_1189;
                        float _1195 = _1193 + 1.57079637050628662109375;
                        _1191 = as_type<int>(_1195);
                    }
                    int _1197 = _1191;
                    float _1199 = as_type<float>(_1197);
                    if (!_1153)
                    {
                        int _1201 = _1155 | _1197;
                        _1199 = as_type<float>(_1201);
                    }
                    float _1203 = _1199;
                    float _1205 = _1203;
                    if (!_1135)
                    {
                        float _1207 = _1203 + 3.1415927410125732421875;
                        _1205 = _1207;
                    }
                    float _1209 = _1205;
                    float _1211 = _1069 + _1209;
                    _213 = _1211;
                }
            }
            int _1213 = _193;
            int _1215 = _195;
            int _1217 = _197;
            int _1219 = _199;
            int _1221 = _201;
            int _1223 = _203;
            int _1225 = _205;
            int _1227 = _207;
            float _1229 = _209;
            float _1231 = _211;
            float _1233 = _213;
            int _1235 = _215;
            int _1237 = _217;
            int _1239 = as_type<int>(_219);
            int _1241 = _221;
            int _1243 = _223;
            _83 = _1213;
            _85 = _1215;
            _87 = _1217;
            _89 = _1219;
            _91 = _1221;
            _93 = _1223;
            _95 = _1225;
            _97 = _1227;
            _99 = _1229;
            _101 = _1231;
            _77 = _1233;
            _103 = _1235;
            _105 = _1237;
            _107 = _1239;
            _109 = _1241;
            _111 = _1243;
            _79 = _1233;
            if (_151)
            {
                _1245 = true;
                if (_1245)
                {
                    break;
                }
            }
        } while (true);
    }
    _1245 = false;
    float _1247 = _79;
    int _1249 = _61 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1251 = _1249 + _53;
    float _1253 = _1247 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    int _1255 = _1251 << 2;
    uint _1258 = uint(int(uint(_1255) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1258)] = as_type<uint>(_1253);
}

