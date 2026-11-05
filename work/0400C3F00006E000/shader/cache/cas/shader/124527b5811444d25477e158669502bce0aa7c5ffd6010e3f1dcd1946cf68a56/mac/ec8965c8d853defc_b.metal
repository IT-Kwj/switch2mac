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
    float _48 = as_type<float>(gl_LocalInvocationID.x);
    int _51 = as_type<int>(_46) * 32;
    int _53 = _51 + as_type<int>(_48);
    int _55 = _53 * 16;
    int _57 = _55 + 4;
    int _59 = _55 + 8;
    int _61 = _55 + 12;
    uint _64 = uint(int(uint(_55) >> uint(2)));
    float _66 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_64)]);
    uint _68 = uint(int(uint(_57) >> uint(2)));
    float _70 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_68)]);
    uint _72 = uint(int(uint(_59) >> uint(2)));
    float _74 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_72)]);
    uint _76 = uint(int(uint(_61) >> uint(2)));
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_76)]);
    float _80 = float(as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[40].x));
    float _82 = float(uint(_53));
    float _84 = 1.0 / _80;
    int _86 = as_type<int>(_84) + (-2);
    float _88 = as_type<float>(_86) * _82;
    float _90 = trunc(_88);
    float _92 = precise::max(_90, 0.0);
    uint _94 = uint(_92);
    int _96 = -int(_94);
    int _98 = _96 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _100 = _98 + _53;
    float _102 = float(uint(_100));
    float _104 = as_type<float>(_86) * _102;
    float _106 = trunc(_104);
    float _108 = precise::max(_106, 0.0);
    uint _110 = uint(_108);
    int _112 = int(_94) + int(_110);
    int _114 = -_112;
    int _116 = _114 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _118 = _116 + _53;
    bool _122 = uint(_118) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    bool _124 = !_122;
    int _126 = _124 ? 0 : (-1);
    bool _128 = 0 == as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _130 = -_126;
    int _132 = _112 + _130;
    bool _134 = !_128;
    int _136 = _134 ? _132 : (-1);
    bool _138 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].y);
    int _140 = -_136;
    int _142 = _140 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _144 = _142 + _53;
    uint _146 = min(as_type<uint>(_66), as_type<uint>(_70));
    float _148 = float(uint(_144));
    float _150 = fma(_148, (*spvDescriptorSet0.cp_c3)._m0[40].z, (*spvDescriptorSet0.cp_c3)._m0[38].z);
    uint _152 = min(as_type<uint>(_74), as_type<uint>(_78));
    float _154 = float(uint(_136));
    uint _156 = min(_146, _152);
    float _158 = float(_156);
    float _160 = fma(_154, (*spvDescriptorSet0.cp_c3)._m0[40].w, (*spvDescriptorSet0.cp_c3)._m0[38].w);
    float _162 = _158 * 5.9604651880817982601001858711243e-08;
    bool _164 = !_138;
    float _166 = _160;
    float _168 = 0.0;
    int _170 = 0;
    float _172 = 0.0;
    int _174 = as_type<int>(_162);
    if (!_164)
    {
        int _176 = 0;
        int _178 = 0;
        int _180 = 0;
        int _182 = 0;
        int _184 = 0;
        int _186 = 0;
        int _188 = 0;
        int _190 = 0;
        int _192 = 0;
        int _194 = 0;
        int _196 = 0;
        int _198 = 0;
        int _200 = 0;
        int _202 = 0;
        int _204 = 0;
        int _206 = 0;
        bool _208;
        bool _338;
        do
        {
            int _210 = _176;
            int _212 = _178;
            int _214 = _180;
            int _216 = _182;
            int _218 = _184;
            float _220 = _166;
            int _222 = _186;
            int _224 = _188;
            int _226 = _190;
            int _228 = _192;
            int _230 = _194;
            int _232 = _196;
            int _234 = _198;
            int _236 = _200;
            int _238 = _202;
            int _240 = _204;
            float _242 = _168;
            int _244 = _206;
            bool _246 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
            int _248 = _210 + 1;
            bool _250 = _248 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].y);
            bool _252 = !_246;
            _176 = _248;
            float _254 = _242;
            int _256 = _212;
            int _258 = _214;
            int _260 = _218;
            int _262 = _222;
            int _264 = _224;
            int _266 = _226;
            int _268 = _228;
            int _270 = _230;
            int _272 = _232;
            int _274 = _234;
            int _276 = _236;
            int _278 = _238;
            int _280 = _240;
            float _282 = _242;
            int _284 = _244;
            int _286 = _212;
            int _288 = _214;
            int _290 = _216;
            int _292 = _218;
            int _294 = _222;
            int _296 = _224;
            int _298 = _226;
            int _300 = _228;
            int _302 = _230;
            int _304 = _232;
            int _306 = _234;
            int _308 = _236;
            int _310 = _238;
            int _312 = _240;
            float _314 = _242;
            int _316 = _244;
            _170 = _250 ? (-1) : 0;
            if (!_252)
            {
                int _318 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _320 = _318 + 1;
                bool _322 = _320 > 3;
                bool _324 = !_322;
                float _326 = _150;
                int _328 = 0;
                int _330 = 0;
                float _332 = _150;
                int _334 = -1;
                if (!_324)
                {
                    int _336 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x) + (-3);
                    _334 = 0;
                    do
                    {
                        float _340 = _326;
                        int _342 = _328;
                        float _344 = _254;
                        float _346 = _340 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float2 _1082 = float2(_340, _220);
                        float4 _349 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1082, float2(0.0), isnan(_1082)), int2(0), component::x).xyzw;
                        float _351 = _349.x;
                        float _353 = _349.y;
                        float _355 = _349.z;
                        float _357 = _349.w;
                        float _359 = _346 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float2 _1104 = float2(_346, _220);
                        float4 _361 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1104, float2(0.0), isnan(_1104)), int2(0), component::x).xyzw;
                        float _363 = _361.x;
                        float _365 = _361.y;
                        float _367 = _361.z;
                        float _369 = _361.w;
                        float _371 = _359 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float2 _1124 = float2(_359, _220);
                        float4 _373 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1124, float2(0.0), isnan(_1124)), int2(0), component::x).xyzw;
                        float _375 = _373.x;
                        float _377 = _373.y;
                        float _379 = _373.z;
                        float _381 = _373.w;
                        float2 _1140 = float2(_371, _220);
                        float4 _383 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1140, float2(0.0), isnan(_1140)), int2(0), component::x).xyzw;
                        float _385 = _383.x;
                        float _387 = _383.y;
                        float _389 = _383.z;
                        float _391 = _383.w;
                        int _393 = _342 + 4;
                        bool _395 = _393 >= _336;
                        float _397 = _371 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float _399 = precise::max(_353, _351);
                        float _401 = precise::max(_357, _355);
                        float _403 = precise::max(_365, _363);
                        float _405 = precise::max(_399, _401);
                        float _407 = precise::max(_369, _367);
                        float _409 = precise::max(_405, _344);
                        float _411 = precise::max(_403, _407);
                        float _413 = precise::max(_377, _375);
                        float _415 = precise::max(_381, _379);
                        float _417 = precise::max(_409, _411);
                        float _419 = precise::max(_413, _415);
                        float _421 = precise::max(_387, _385);
                        float _423 = precise::max(_391, _389);
                        float _425 = precise::max(_417, _419);
                        float _427 = precise::max(_421, _423);
                        float _429 = precise::max(_425, _427);
                        _338 = !_395;
                        _326 = _397;
                        _328 = _393;
                        _254 = _429;
                        _256 = as_type<int>(_425);
                        _258 = as_type<int>(_353);
                        _260 = as_type<int>(_401);
                        _262 = as_type<int>(_403);
                        _264 = as_type<int>(_365);
                        _266 = as_type<int>(_411);
                        _268 = as_type<int>(_413);
                        _270 = as_type<int>(_377);
                        _272 = as_type<int>(_419);
                        _274 = as_type<int>(_421);
                        _276 = as_type<int>(_387);
                        _278 = as_type<int>(_389);
                        _280 = as_type<int>(_427);
                        _282 = _429;
                        _330 = _393;
                        _332 = _397;
                        _284 = as_type<int>(_379);
                    } while (_338);
                }
                int _431 = _256;
                int _433 = _258;
                int _435 = _260;
                int _437 = _262;
                int _439 = _264;
                int _441 = _266;
                int _443 = _268;
                int _445 = _270;
                int _447 = _272;
                int _449 = _274;
                int _451 = _276;
                int _453 = _278;
                int _455 = _280;
                float _457 = _282;
                int _459 = _330;
                float _461 = _332;
                int _463 = _284;
                int _465 = _334;
                int _467 = ~_459;
                int _469 = _467 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _471 = _469 + 1;
                bool _473 = _471 > 1;
                bool _475 = !_473;
                int _477 = _431;
                int _479 = _433;
                int _481 = _471;
                int _483 = _435;
                int _485 = _437;
                int _487 = _439;
                int _489 = _447;
                float _491 = _457;
                int _493 = _463;
                int _495 = _459;
                int _497 = _465;
                float _499 = _461;
                _298 = _441;
                _300 = _443;
                _302 = _445;
                _306 = _449;
                _308 = _451;
                _310 = _453;
                _312 = _455;
                if (!_475)
                {
                    float _501 = _461 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                    float2 _1310 = float2(_461, _220);
                    float4 _503 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1310, float2(0.0), isnan(_1310)), int2(0), component::x).xyzw;
                    float _505 = _503.x;
                    float _507 = _503.y;
                    float _509 = _503.z;
                    float _511 = _503.w;
                    float2 _1326 = float2(_501, _220);
                    float4 _513 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1326, float2(0.0), isnan(_1326)), int2(0), component::x).xyzw;
                    float _515 = _513.x;
                    float _517 = _513.y;
                    float _519 = _513.z;
                    float _521 = _513.w;
                    int _523 = _459 + 2;
                    float _525 = _501 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                    float _527 = precise::max(_507, _505);
                    float _529 = precise::max(_511, _509);
                    float _531 = precise::max(_517, _515);
                    float _533 = precise::max(_527, _529);
                    float _535 = precise::max(_521, _519);
                    float _537 = precise::max(_457, _533);
                    float _539 = precise::max(_531, _535);
                    float _541 = precise::max(_537, _539);
                    _477 = as_type<int>(_533);
                    _479 = as_type<int>(_507);
                    _481 = as_type<int>(_509);
                    _483 = as_type<int>(_529);
                    _485 = as_type<int>(_519);
                    _487 = as_type<int>(_535);
                    _489 = as_type<int>(_517);
                    _491 = _541;
                    _493 = as_type<int>(_539);
                    _495 = _523;
                    _497 = 0;
                    _499 = _525;
                }
                int _543 = _477;
                int _545 = _479;
                int _547 = _481;
                int _549 = _483;
                int _551 = _485;
                int _553 = _487;
                int _555 = _489;
                float _557 = _491;
                int _559 = _493;
                int _561 = _495;
                int _563 = _497;
                float _565 = _499;
                bool _567 = _561 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _569 = (_567 ? (-1) : 0) | _563;
                int _571 = ~_569;
                _286 = _543;
                _288 = _545;
                _290 = _547;
                _292 = _549;
                _294 = _551;
                _296 = _553;
                _304 = _555;
                _314 = _557;
                _316 = _559;
                if (!(_571 != 0))
                {
                    float2 _1428 = float2(_565, _220);
                    float4 _573 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1428, float2(0.0), isnan(_1428)), int2(0), component::x).xyzw;
                    float _575 = _573.x;
                    float _577 = _573.y;
                    float _579 = _573.z;
                    float _581 = _573.w;
                    float _583 = precise::max(_575, _577);
                    float _585 = precise::max(_579, _581);
                    float _587 = precise::max(_583, _585);
                    float _589 = precise::max(_557, _587);
                    _286 = as_type<int>(_579);
                    _288 = as_type<int>(_585);
                    _290 = as_type<int>(_587);
                    _292 = as_type<int>(_577);
                    _314 = _589;
                }
            }
            int _591 = _286;
            int _593 = _288;
            int _595 = _290;
            int _597 = _292;
            int _599 = _294;
            int _601 = _296;
            int _603 = _298;
            int _605 = _300;
            int _607 = _302;
            int _609 = _304;
            int _611 = _306;
            int _613 = _308;
            int _615 = _310;
            int _617 = _312;
            float _619 = _314;
            int _621 = _316;
            float _623 = _220 + (*spvDescriptorSet0.cp_c3)._m0[41].w;
            _208 = !_250;
            _178 = _591;
            _180 = _593;
            _182 = _595;
            _184 = _597;
            _166 = _623;
            _186 = _599;
            _188 = _601;
            _190 = _603;
            _192 = _605;
            _194 = _607;
            _196 = _609;
            _198 = _611;
            _200 = _613;
            _202 = _615;
            _204 = _617;
            _168 = _619;
            _206 = _621;
            _172 = _619;
        } while (_208);
    }
    int _625 = _170;
    float _627 = _172;
    int _629 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x) + 1;
    int _631 = _136 * _629;
    int _633 = _631 + _144;
    int _635 = _633 * 4;
    int _637 = _633 + _629;
    int _639 = _635 + 19456;
    int _641 = _637 * 4;
    int _643 = _635 + 19460;
    uint _645 = uint(int(uint(_639) >> uint(2)));
    float _647 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_645)]);
    int _649 = _641 + 19456;
    uint _651 = uint(int(uint(_643) >> uint(2)));
    float _653 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_651)]);
    int _655 = _641 + 19460;
    uint _657 = uint(int(uint(_649) >> uint(2)));
    float _659 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_657)]);
    uint _661 = uint(int(uint(_655) >> uint(2)));
    float _663 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_661)]);
    int _665 = _53 << 3;
    int _667 = _665 + 448;
    bool _669 = _647 >= 0.0;
    bool _671 = isnan(_647);
    bool _673 = _669 || _671;
    bool _675 = isnan(0.0);
    bool _677 = _673 || _675;
    bool _679 = _653 < 0.0;
    bool _681 = !_677;
    bool _683 = _679 && _681;
    bool _685 = _659 < 0.0;
    bool _687 = _685 && _683;
    bool _689 = _663 < 0.0;
    bool _691 = _689 && _687;
    int _693 = _625;
    int _695 = as_type<int>(_653);
    bool _697 = false;
    int _699 = as_type<int>(_627);
    if (_691)
    {
        bool _701 = _647 != (-1.0);
        bool _703 = isnan(_647);
        bool _705 = _701 || _703;
        bool _707 = isnan(-1.0);
        bool _709 = _705 || _707;
        _693 = _709 ? (-1) : 0;
    }
    int _711 = _693;
    int _713 = _711;
    if (_691)
    {
        bool _715 = _653 == (-1.0);
        int _717 = ~_711;
        int _719 = (_715 ? (-1) : 0) & _717;
        _713 = _719;
    }
    int _721 = _713;
    int _723 = _721;
    if (!_691)
    {
        _695 = as_type<int>(_162);
    }
    int _725 = _695;
    int _727 = _725;
    if (_691)
    {
        bool _729 = _659 == (-1.0);
        int _731 = (_729 ? (-1) : 0) & _721;
        _723 = _731;
    }
    int _733 = _723;
    bool _735 = _733 != 0;
    if (_691)
    {
        bool _737 = _663 == (-1.0);
        int _739 = (_737 ? (-1) : 0) & _733;
        _735 = _739 != 0;
    }
    bool _741 = _735;
    if (_691)
    {
        _697 = _741;
    }
    bool _743 = _697;
    if (_691)
    {
        float _745 = -_627;
        int _747 = _741 ? as_type<int>(_745) : as_type<int>(_627);
        _699 = _747;
    }
    int _749 = _699;
    if (_743)
    {
        float _751 = _158 * (-5.9604651880817982601001858711243e-08);
        _174 = as_type<int>(_751);
    }
    int _753 = _174;
    if (_691)
    {
        _727 = _753;
    }
    int _755 = _727;
    uint _757 = uint(int(uint(_667) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_757)] = uint(_755);
    int _759 = _667 + 4;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_761)] = uint(_749);
}

