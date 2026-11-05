#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _46 = as_type<float>(gl_WorkGroupID.x);
    float _48 = float(as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[40].x));
    float _50 = as_type<float>(gl_LocalInvocationID.x);
    float _52 = 1.0 / _48;
    int _55 = as_type<int>(_46) * 32;
    int _57 = _55 + as_type<int>(_50);
    int _59 = as_type<int>(_52) + (-2);
    float _61 = float(uint(_57));
    float _63 = as_type<float>(_59) * _61;
    float _65 = trunc(_63);
    float _67 = precise::max(_65, 0.0);
    uint _70 = uint(_67);
    int _72 = -int(_70);
    int _74 = _72 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _76 = _74 + _57;
    float _78 = float(uint(_76));
    float _80 = as_type<float>(_59) * _78;
    float _82 = trunc(_80);
    float _84 = precise::max(_82, 0.0);
    uint _86 = uint(_84);
    int _88 = int(_70) + int(_86);
    int _90 = -_88;
    int _92 = _90 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _94 = _92 + _57;
    bool _98 = uint(_94) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    bool _100 = !_98;
    int _102 = _100 ? 0 : (-1);
    bool _104 = 0 == as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _106 = -_102;
    int _108 = _88 + _106;
    bool _110 = !_104;
    uint _112 = uint(_110 ? _108 : (-1));
    bool _114 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].y);
    float _116 = float(_112);
    int _118 = -int(_112);
    int _120 = _118 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _122 = _120 + _57;
    float _124 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[40].w, (*spvDescriptorSet0.cp_c3)._m0[38].w);
    float _126 = float(uint(_122));
    float _128 = fma(_126, (*spvDescriptorSet0.cp_c3)._m0[40].z, (*spvDescriptorSet0.cp_c3)._m0[38].z);
    bool _130 = !_114;
    int _132 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].z);
    float _134 = _124;
    float _136 = 1.0;
    float _138 = 0.0;
    float _140 = 1.0;
    float _142 = 0.0;
    int _144 = 0;
    if (!_130)
    {
        int _146 = 0;
        int _148 = 0;
        int _150 = 0;
        int _152 = 0;
        int _154 = 0;
        int _156 = 0;
        int _158 = 0;
        int _160 = 0;
        int _162 = 0;
        int _164 = 0;
        int _166 = 0;
        int _168 = 0;
        int _170 = 0;
        int _172 = 0;
        int _174 = 0;
        bool _176;
        bool _314;
        do
        {
            int _178 = _146;
            int _180 = _148;
            int _182 = _150;
            int _184 = _132;
            int _186 = _152;
            float _188 = _134;
            int _190 = _154;
            int _192 = _156;
            int _194 = _158;
            int _196 = _160;
            int _198 = _162;
            int _200 = _164;
            int _202 = _166;
            int _204 = _168;
            int _206 = _170;
            int _208 = _172;
            int _210 = _174;
            float _212 = _136;
            float _214 = _138;
            bool _216 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
            int _218 = _178 + 1;
            bool _220 = _218 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].y);
            bool _222 = !_216;
            _146 = _218;
            float _224 = _212;
            float _226 = _214;
            int _228 = _180;
            int _230 = _182;
            int _232 = _186;
            int _234 = _190;
            int _236 = _192;
            int _238 = _194;
            int _240 = _196;
            int _242 = _198;
            int _244 = _200;
            int _246 = _202;
            int _248 = _204;
            int _250 = _206;
            int _252 = _208;
            int _254 = _210;
            float _256 = _212;
            float _258 = _214;
            int _260 = _180;
            int _262 = _182;
            int _264 = _184;
            int _266 = _186;
            int _268 = _190;
            int _270 = _192;
            int _272 = _194;
            int _274 = _196;
            int _276 = _198;
            int _278 = _200;
            int _280 = _202;
            int _282 = _204;
            int _284 = _206;
            int _286 = _208;
            int _288 = _210;
            float _290 = _212;
            float _292 = _214;
            _144 = _220 ? (-1) : 0;
            if (!_222)
            {
                int _294 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _296 = _294 + 1;
                bool _298 = _296 > 3;
                bool _300 = !_298;
                float _302 = _128;
                int _304 = 0;
                int _306 = 0;
                float _308 = _128;
                int _310 = -1;
                if (!_300)
                {
                    int _312 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x) + (-3);
                    _310 = 0;
                    do
                    {
                        float _316 = _302;
                        int _318 = _304;
                        float _320 = _224;
                        float _322 = _226;
                        float2 _1106 = float2(_316, _188);
                        float4 _325 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1106, float2(0.0), isnan(_1106)), int2(0), component::x).xyzw;
                        float _327 = _325.x;
                        float _329 = _325.y;
                        float _331 = _325.z;
                        float _333 = _325.w;
                        float _335 = _316 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float _337 = _335 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float2 _1132 = float2(_335, _188);
                        float4 _339 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1132, float2(0.0), isnan(_1132)), int2(0), component::x).xyzw;
                        float _341 = _339.x;
                        float _343 = _339.y;
                        float _345 = _339.z;
                        float _347 = _339.w;
                        float _349 = _337 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float2 _1152 = float2(_337, _188);
                        float4 _351 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1152, float2(0.0), isnan(_1152)), int2(0), component::x).xyzw;
                        float _353 = _351.x;
                        float _355 = _351.y;
                        float _357 = _351.z;
                        float _359 = _351.w;
                        float2 _1168 = float2(_349, _188);
                        float4 _361 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1168, float2(0.0), isnan(_1168)), int2(0), component::x).xyzw;
                        float _363 = _361.x;
                        float _365 = _361.y;
                        float _367 = _361.z;
                        float _369 = _361.w;
                        int _371 = _318 + 4;
                        bool _373 = _371 >= _312;
                        float _375 = precise::min(_329, _327);
                        float _377 = precise::max(_329, _327);
                        float _379 = precise::min(_333, _331);
                        float _381 = precise::max(_333, _331);
                        float _383 = precise::min(_375, _379);
                        float _385 = precise::max(_377, _381);
                        float _387 = precise::min(_343, _341);
                        float _389 = precise::min(_347, _345);
                        float _391 = precise::max(_343, _341);
                        float _393 = precise::max(_347, _345);
                        float _395 = precise::min(_383, _320);
                        float _397 = precise::max(_385, _322);
                        float _399 = precise::min(_355, _353);
                        float _401 = precise::min(_359, _357);
                        float _403 = precise::min(_387, _389);
                        float _405 = precise::max(_391, _393);
                        float _407 = precise::max(_355, _353);
                        float _409 = precise::max(_359, _357);
                        float _411 = precise::min(_399, _401);
                        float _413 = precise::min(_395, _403);
                        float _415 = precise::min(_365, _363);
                        float _417 = precise::min(_369, _367);
                        float _419 = precise::max(_397, _405);
                        float _421 = precise::max(_407, _409);
                        float _423 = precise::max(_365, _363);
                        float _425 = precise::max(_369, _367);
                        float _427 = precise::min(_413, _411);
                        float _429 = precise::min(_415, _417);
                        float _431 = _349 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float _433 = precise::max(_419, _421);
                        float _435 = precise::max(_423, _425);
                        float _437 = precise::min(_427, _429);
                        float _439 = precise::max(_433, _435);
                        _314 = !_373;
                        _302 = _431;
                        _304 = _371;
                        _224 = _437;
                        _226 = _439;
                        _228 = as_type<int>(_433);
                        _230 = as_type<int>(_395);
                        _232 = as_type<int>(_381);
                        _234 = as_type<int>(_391);
                        _236 = as_type<int>(_343);
                        _238 = as_type<int>(_345);
                        _240 = as_type<int>(_405);
                        _242 = as_type<int>(_407);
                        _244 = as_type<int>(_355);
                        _246 = as_type<int>(_357);
                        _248 = as_type<int>(_423);
                        _250 = as_type<int>(_365);
                        _252 = as_type<int>(_367);
                        _254 = as_type<int>(_435);
                        _256 = _437;
                        _258 = _439;
                        _306 = _371;
                        _308 = _431;
                    } while (_314);
                }
                int _441 = _228;
                int _443 = _230;
                int _445 = _232;
                int _447 = _234;
                int _449 = _236;
                int _451 = _238;
                int _453 = _240;
                int _455 = _242;
                int _457 = _244;
                int _459 = _246;
                int _461 = _248;
                int _463 = _250;
                int _465 = _252;
                int _467 = _254;
                float _469 = _256;
                float _471 = _258;
                int _473 = _306;
                float _475 = _308;
                int _477 = _310;
                int _479 = ~_473;
                int _481 = _479 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _483 = _481 + 1;
                bool _485 = _483 > 1;
                bool _487 = !_485;
                int _489 = _441;
                int _491 = _443;
                int _493 = _483;
                int _495 = _445;
                int _497 = _447;
                int _499 = _449;
                int _501 = _451;
                int _503 = _453;
                float _505 = _469;
                float _507 = _471;
                int _509 = _473;
                int _511 = _477;
                float _513 = _475;
                _276 = _455;
                _278 = _457;
                _280 = _459;
                _282 = _461;
                _284 = _463;
                _286 = _465;
                _288 = _467;
                if (!_487)
                {
                    float2 _1387 = float2(_475, _188);
                    float4 _515 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1387, float2(0.0), isnan(_1387)), int2(0), component::x).xyzw;
                    float _517 = _515.x;
                    float _519 = _515.y;
                    float _521 = _515.z;
                    float _523 = _515.w;
                    float _525 = _475 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                    float2 _1407 = float2(_525, _188);
                    float4 _527 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1407, float2(0.0), isnan(_1407)), int2(0), component::x).xyzw;
                    float _529 = _527.x;
                    float _531 = _527.y;
                    float _533 = _527.z;
                    float _535 = _527.w;
                    int _537 = _473 + 2;
                    float _539 = _525 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                    float _541 = precise::min(_519, _517);
                    float _543 = precise::max(_519, _517);
                    float _545 = precise::min(_523, _521);
                    float _547 = precise::max(_523, _521);
                    float _549 = precise::min(_531, _529);
                    float _551 = precise::max(_543, _547);
                    float _553 = precise::min(_535, _533);
                    float _555 = precise::min(_541, _545);
                    float _557 = precise::max(_531, _529);
                    float _559 = precise::max(_535, _533);
                    float _561 = precise::min(_469, _555);
                    float _563 = precise::max(_471, _551);
                    float _565 = precise::min(_549, _553);
                    float _567 = precise::max(_557, _559);
                    float _569 = precise::min(_561, _565);
                    float _571 = precise::max(_563, _567);
                    _489 = as_type<int>(_551);
                    _491 = as_type<int>(_555);
                    _493 = as_type<int>(_549);
                    _495 = as_type<int>(_565);
                    _497 = as_type<int>(_567);
                    _499 = as_type<int>(_531);
                    _501 = as_type<int>(_533);
                    _503 = as_type<int>(_559);
                    _505 = _569;
                    _507 = _571;
                    _509 = _537;
                    _511 = 0;
                    _513 = _539;
                }
                int _573 = _489;
                int _575 = _491;
                int _577 = _493;
                int _579 = _495;
                int _581 = _497;
                int _583 = _499;
                int _585 = _501;
                int _587 = _503;
                float _589 = _505;
                float _591 = _507;
                int _593 = _509;
                int _595 = _511;
                float _597 = _513;
                bool _599 = _593 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _601 = (_599 ? (-1) : 0) | _595;
                int _603 = ~_601;
                _260 = _573;
                _262 = _575;
                _264 = _577;
                _266 = _579;
                _268 = _581;
                _270 = _583;
                _272 = _585;
                _274 = _587;
                _290 = _589;
                _292 = _591;
                if (!(_603 != 0))
                {
                    float2 _1536 = float2(_597, _188);
                    float4 _605 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1536, float2(0.0), isnan(_1536)), int2(0), component::x).xyzw;
                    float _607 = _605.x;
                    float _609 = _605.y;
                    float _611 = _605.z;
                    float _613 = _605.w;
                    float _615 = precise::min(_607, _609);
                    float _617 = precise::max(_607, _609);
                    float _619 = precise::min(_611, _613);
                    float _621 = precise::max(_611, _613);
                    float _623 = precise::min(_615, _619);
                    float _625 = precise::max(_617, _621);
                    float _627 = precise::min(_589, _623);
                    float _629 = precise::max(_591, _625);
                    _260 = as_type<int>(_611);
                    _262 = as_type<int>(_621);
                    _264 = as_type<int>(_625);
                    _266 = as_type<int>(_623);
                    _290 = _627;
                    _292 = _629;
                }
            }
            int _631 = _260;
            int _633 = _262;
            int _635 = _264;
            int _637 = _266;
            int _639 = _268;
            int _641 = _270;
            int _643 = _272;
            int _645 = _274;
            int _647 = _276;
            int _649 = _278;
            int _651 = _280;
            int _653 = _282;
            int _655 = _284;
            int _657 = _286;
            int _659 = _288;
            float _661 = _290;
            float _663 = _292;
            float _665 = _188 + (*spvDescriptorSet0.cp_c3)._m0[41].w;
            _176 = !_220;
            _148 = _631;
            _150 = _633;
            _132 = _635;
            _152 = _637;
            _134 = _665;
            _154 = _639;
            _156 = _641;
            _158 = _643;
            _160 = _645;
            _162 = _647;
            _164 = _649;
            _166 = _651;
            _168 = _653;
            _170 = _655;
            _172 = _657;
            _174 = _659;
            _136 = _661;
            _138 = _663;
            _140 = _661;
            _142 = _663;
        } while (_176);
    }
    float _667 = _140;
    float _669 = _142;
    int _671 = _144;
    int _673 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x) + 1;
    int _675 = int(_112) * _673;
    int _677 = _675 + _122;
    int _679 = _677 * 4;
    int _681 = _677 + _673;
    int _683 = _679 + 19456;
    int _685 = _681 * 4;
    int _687 = _679 + 19460;
    uint _689 = uint(int(uint(_683) >> uint(2)));
    float _691 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_689)]);
    int _693 = _685 + 19456;
    uint _695 = uint(int(uint(_687) >> uint(2)));
    float _697 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_695)]);
    int _699 = _685 + 19460;
    uint _701 = uint(int(uint(_693) >> uint(2)));
    float _703 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_701)]);
    uint _705 = uint(int(uint(_699) >> uint(2)));
    float _707 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_705)]);
    bool _709 = _667 >= 1.0;
    bool _711 = isnan(_667);
    bool _713 = _709 || _711;
    bool _715 = isnan(1.0);
    bool _717 = _713 || _715;
    bool _719 = _669 >= 1.0;
    bool _721 = isnan(_669);
    bool _723 = _719 || _721;
    bool _725 = isnan(1.0);
    bool _727 = _723 || _725;
    float _729 = -_667;
    float _731 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[0].w, 1.0);
    float _733 = -_669;
    float _735 = fma(_733, (*spvDescriptorSet0.cp_c3)._m0[0].w, 1.0);
    int _737 = _57 << 3;
    int _739 = _737 + 448;
    float _741 = 1.0 / _731;
    float _743 = 1.0 / _735;
    float _745 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _747 = fma(_741, (*spvDescriptorSet0.cp_c3)._m0[1].w, _745);
    bool _749 = !_717;
    int _751 = _749 ? as_type<int>(_747) : 1065353216;
    bool _753 = _691 >= 0.0;
    bool _755 = isnan(_691);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    bool _763 = _697 < 0.0;
    bool _765 = !_761;
    bool _767 = _763 && _765;
    bool _769 = _703 < 0.0;
    bool _771 = _769 && _767;
    bool _773 = _707 < 0.0;
    bool _775 = _773 && _771;
    int _777 = _671;
    int _779 = _751;
    if (_775)
    {
        bool _781 = _691 != (-1.0);
        bool _783 = isnan(_691);
        bool _785 = _781 || _783;
        bool _787 = isnan(-1.0);
        bool _789 = _785 || _787;
        _777 = _789 ? (-1) : 0;
    }
    int _791 = _777;
    float _793 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _795 = fma(_743, (*spvDescriptorSet0.cp_c3)._m0[1].w, _793);
    int _797 = _791;
    if (_775)
    {
        bool _799 = _697 == (-1.0);
        int _801 = ~_791;
        int _803 = (_799 ? (-1) : 0) & _801;
        _797 = _803;
    }
    int _805 = _797;
    bool _807 = !_727;
    int _809 = _807 ? as_type<int>(_795) : 1065353216;
    int _811 = _805;
    int _813 = _809;
    if (_775)
    {
        bool _815 = _703 == (-1.0);
        int _817 = (_815 ? (-1) : 0) & _805;
        _811 = _817;
    }
    int _819 = _811;
    bool _821 = _819 != 0;
    if (_775)
    {
        bool _823 = _707 == (-1.0);
        int _825 = (_823 ? (-1) : 0) & _819;
        _821 = _825 != 0;
    }
    bool _827 = _821;
    if (_775)
    {
        float _829 = -as_type<float>(_751);
        int _831 = _827 ? as_type<int>(_829) : _751;
        _779 = _831;
    }
    int _833 = _779;
    if (_775)
    {
        float _835 = -as_type<float>(_809);
        int _837 = _827 ? as_type<int>(_835) : _809;
        _813 = _837;
    }
    int _839 = _813;
    uint _841 = uint(int(uint(_739) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_841)] = uint(_833);
    int _843 = _739 + 4;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_845)] = uint(_839);
}

