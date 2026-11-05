#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _21* cp_s0 [[id(2)]];
    texture2d_array<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
};

static inline __attribute__((always_inline))
int _39(thread const int& _1584, thread const int& _1585, constant _10& support_buffer)
{
    int _1588 = 1 + _1585;
    float _1590 = support_buffer._m5[_1588].x;
    bool _1592 = _1590 == 1.0;
    if (_1592)
    {
        return _1584;
    }
    float _1594 = float(_1584);
    float _1596 = _1594 * _1590;
    int _1598 = int(_1596);
    return _1598;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_LocalInvocationID.y);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    int _47 = as_type<int>(_43) + 1;
    int _49 = as_type<int>(_43) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _51 = as_type<int>(_43) << 3;
    int _53 = _51 + as_type<int>(_45);
    int _55 = _47 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    uint _58 = min(uint(_55), as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].w));
    bool _62 = uint(_49) >= _58;
    float _64 = 0.0;
    float _66 = 0.0;
    float _68 = 0.0;
    int _70 = 0;
    int _72 = _49;
    int _74 = 0;
    int _76 = 0;
    int _78 = 0;
    int _80 = 0;
    if (!_62)
    {
        int _82 = as_type<int>(_45) + 1;
        int _84 = as_type<int>(_45) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _86 = _82 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        uint _88 = min(uint(_86), as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z));
        int _90 = 0;
        int _92 = 0;
        float _94 = as_type<float>(_86);
        float _96 = 0.0;
        int _98 = 0;
        int _100 = 0;
        int _102 = 0;
        int _104 = 0;
        int _106 = 0;
        int _108 = 0;
        int _110 = 0;
        int _112 = 0;
        bool _114;
        bool _339;
        do
        {
            float _116 = _64;
            float _118 = _66;
            float _120 = _68;
            int _122 = _70;
            int _124 = _90;
            int _126 = _92;
            float _128 = _94;
            float _130 = _96;
            int _132 = _72;
            int _134 = _98;
            int _136 = _100;
            int _138 = _102;
            int _140 = _104;
            int _142 = _106;
            int _144 = _108;
            int _146 = _110;
            int _148 = _112;
            bool _150 = uint(_84) >= _88;
            int _152 = _150 ? (-1) : 0;
            float _154 = _116;
            float _156 = _118;
            float _158 = _120;
            float _160 = as_type<float>(_122);
            int _162 = _134;
            int _164 = _136;
            int _166 = _138;
            int _168 = _140;
            int _170 = _142;
            int _172 = _144;
            int _174 = _146;
            int _176 = _148;
            int _178 = _124;
            int _180 = _126;
            float _182 = _128;
            float _184 = _130;
            int _186 = _134;
            int _188 = _136;
            int _190 = _138;
            int _192 = _140;
            int _194 = _142;
            int _196 = _144;
            int _198 = _146;
            int _200 = _148;
            float _202 = _116;
            float _204 = _118;
            float _206 = _120;
            float _208 = as_type<float>(_122);
            if (!_150)
            {
                bool _210 = uint(_84) >= _88;
                float _212 = (*spvDescriptorSet0.cp_c3)._m0[1].y;
                uint _214 = uint(_84);
                if (_210)
                {
                    bool _216 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].y) > 65535u;
                    _152 = _216 ? (-1) : 0;
                }
                int _218 = _152;
                if (_210)
                {
                    int _220 = ~_218;
                    float _222 = (_220 != 0) ? (*spvDescriptorSet0.cp_c3)._m0[1].y : 9.1834094859526886742986618240905e-41;
                    _212 = _222;
                }
                float _224 = _212;
                int _226 = _124;
                int _228 = _126;
                float _230 = _128;
                float _232 = _130;
                if (_210)
                {
                    int _234 = _84;
                    int _236 = 0;
                    int _238 = _39(_234, _236, (*spvDescriptorSet0.support_buffer));
                    int _240 = _132;
                    int _242 = 0;
                    int _244 = _39(_240, _242, (*spvDescriptorSet0.support_buffer));
                    int3 _926 = int3(_238, _244, as_type<int>(_224));
                    float4 _247 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_926.xy), uint(_926.z), 0).xyzw;
                    float _249 = _247.x;
                    float _251 = _247.y;
                    float _253 = _247.z;
                    float _255 = _247.w;
                    _226 = as_type<int>(_249);
                    _228 = as_type<int>(_251);
                    _230 = _253;
                    _232 = _255;
                }
                int _257 = _226;
                int _259 = _228;
                float _261 = _230;
                float _263 = _232;
                if (_210)
                {
                    int _265 = _84 + 1;
                    _214 = uint(_265);
                }
                uint _267 = _214;
                bool _269 = _88 > _267;
                int _271 = ~int(_267);
                int _273 = _271 + int(_88);
                int _275 = _273 + 1;
                bool _277 = uint(_275) <= 3u;
                bool _279 = !_269;
                bool _281 = _277 || _279;
                int _283 = int(_267);
                float _285 = as_type<float>(_257);
                float _287 = as_type<float>(_259);
                float _289 = _261;
                float _291 = _263;
                int _293 = int(_267);
                if (_210)
                {
                    float _295 = _116 + as_type<float>(_257);
                    _154 = _295;
                }
                float _297 = _154;
                float _299 = _297;
                float _301 = _297;
                if (_210)
                {
                    float _303 = _118 + as_type<float>(_259);
                    _156 = _303;
                }
                float _305 = _156;
                float _307 = _305;
                float _309 = _305;
                if (_210)
                {
                    float _311 = _120 + _261;
                    _158 = _311;
                }
                float _313 = _158;
                float _315 = _313;
                float _317 = _313;
                if (_210)
                {
                    float _319 = as_type<float>(_122) + _263;
                    _160 = _319;
                }
                float _321 = _160;
                bool _323 = !_210;
                float _325 = _321;
                float _327 = _321;
                int _329 = _323 ? (-1) : 0;
                if (!_281)
                {
                    int _331 = int(_88) + (-3);
                    bool _333 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].y) > 65535u;
                    bool _335 = !_333;
                    float _337 = _335 ? (*spvDescriptorSet0.cp_c3)._m0[1].y : 9.1834094859526886742986618240905e-41;
                    _329 = 0;
                    do
                    {
                        int _341 = _283;
                        float _343 = _299;
                        float _345 = _307;
                        float _347 = _315;
                        float _349 = _325;
                        int _351 = _341 + 1;
                        int _353 = _341;
                        int _355 = 0;
                        int _357 = _39(_353, _355, (*spvDescriptorSet0.support_buffer));
                        int _359 = _132;
                        int _361 = 0;
                        int _363 = _39(_359, _361, (*spvDescriptorSet0.support_buffer));
                        int3 _1070 = int3(_357, _363, as_type<int>(_337));
                        float4 _365 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1070.xy), uint(_1070.z), 0).xyzw;
                        float _367 = _365.x;
                        float _369 = _365.y;
                        float _371 = _365.z;
                        float _373 = _365.w;
                        int _375 = _341 + 2;
                        int _377 = _341 + 3;
                        int _379 = _351;
                        int _381 = 0;
                        int _383 = _39(_379, _381, (*spvDescriptorSet0.support_buffer));
                        int _385 = _132;
                        int _387 = 0;
                        int _389 = _39(_385, _387, (*spvDescriptorSet0.support_buffer));
                        int3 _1095 = int3(_383, _389, as_type<int>(_337));
                        float4 _391 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1095.xy), uint(_1095.z), 0).xyzw;
                        float _393 = _391.x;
                        float _395 = _391.y;
                        float _397 = _391.z;
                        float _399 = _391.w;
                        int _401 = _375;
                        int _403 = 0;
                        int _405 = _39(_401, _403, (*spvDescriptorSet0.support_buffer));
                        int _407 = _132;
                        int _409 = 0;
                        int _411 = _39(_407, _409, (*spvDescriptorSet0.support_buffer));
                        int3 _1116 = int3(_405, _411, as_type<int>(_337));
                        float4 _413 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1116.xy), uint(_1116.z), 0).xyzw;
                        float _415 = _413.x;
                        float _417 = _413.y;
                        float _419 = _413.z;
                        float _421 = _413.w;
                        int _423 = _377;
                        int _425 = 0;
                        int _427 = _39(_423, _425, (*spvDescriptorSet0.support_buffer));
                        int _429 = _132;
                        int _431 = 0;
                        int _433 = _39(_429, _431, (*spvDescriptorSet0.support_buffer));
                        int3 _1137 = int3(_427, _433, as_type<int>(_337));
                        float4 _435 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1137.xy), uint(_1137.z), 0).xyzw;
                        float _437 = _435.x;
                        float _439 = _435.y;
                        float _441 = _435.z;
                        float _443 = _435.w;
                        int _445 = _341 + 4;
                        bool _447 = uint(_445) >= uint(_331);
                        float _449 = _367 + _343;
                        float _451 = _369 + _345;
                        float _453 = _371 + _347;
                        float _455 = _373 + _349;
                        float _457 = _449 + _393;
                        float _459 = _451 + _395;
                        float _461 = _453 + _397;
                        float _463 = _455 + _399;
                        float _465 = _457 + _415;
                        float _467 = _459 + _417;
                        float _469 = _461 + _419;
                        float _471 = _463 + _421;
                        float _473 = _465 + _437;
                        float _475 = _467 + _439;
                        float _477 = _469 + _441;
                        float _479 = _471 + _443;
                        _339 = !_447;
                        _283 = _445;
                        _299 = _473;
                        _307 = _475;
                        _315 = _477;
                        _325 = _479;
                        _285 = _419;
                        _287 = _421;
                        _289 = _441;
                        _291 = _443;
                        _162 = as_type<int>(_367);
                        _164 = as_type<int>(_369);
                        _166 = as_type<int>(_371);
                        _168 = as_type<int>(_373);
                        _170 = as_type<int>(_393);
                        _172 = as_type<int>(_395);
                        _174 = as_type<int>(_415);
                        _176 = as_type<int>(_417);
                        _293 = _445;
                        _301 = _473;
                        _309 = _475;
                        _317 = _477;
                        _327 = _479;
                    } while (_339);
                }
                int _481 = as_type<int>(_285);
                int _483 = as_type<int>(_287);
                float _485 = _289;
                float _487 = _291;
                int _489 = _162;
                int _491 = _164;
                int _493 = _166;
                int _495 = _168;
                int _497 = _170;
                int _499 = _172;
                int _501 = _174;
                int _503 = _176;
                int _505 = _293;
                float _507 = _301;
                float _509 = _309;
                float _511 = _317;
                float _513 = _327;
                int _515 = _329;
                int _517 = -_505;
                int _519 = int(_88) + _517;
                bool _521 = _88 > uint(_505);
                bool _523 = uint(_519) <= 1u;
                bool _525 = !_521;
                bool _527 = _523 || _525;
                int _529 = _481;
                int _531 = _483;
                float _533 = _485;
                float _535 = _487;
                int _537 = _493;
                int _539 = _495;
                uint _541 = uint(_505);
                int _543 = _515;
                float _545 = _507;
                float _547 = _509;
                float _549 = _511;
                float _551 = _513;
                _186 = _489;
                _188 = _491;
                _194 = _497;
                _196 = _499;
                _198 = _501;
                _200 = _503;
                if (!_527)
                {
                    int _553 = _505 + 1;
                    bool _555 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].y) > 65535u;
                    bool _557 = !_555;
                    float _559 = _557 ? (*spvDescriptorSet0.cp_c3)._m0[1].y : 9.1834094859526886742986618240905e-41;
                    int _561 = _505;
                    int _563 = 0;
                    int _565 = _39(_561, _563, (*spvDescriptorSet0.support_buffer));
                    int _567 = _132;
                    int _569 = 0;
                    int _571 = _39(_567, _569, (*spvDescriptorSet0.support_buffer));
                    int3 _1323 = int3(_565, _571, as_type<int>(_559));
                    float4 _573 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1323.xy), uint(_1323.z), 0).xyzw;
                    float _575 = _573.x;
                    float _577 = _573.y;
                    float _579 = _573.z;
                    float _581 = _573.w;
                    int _583 = _553;
                    int _585 = 0;
                    int _587 = _39(_583, _585, (*spvDescriptorSet0.support_buffer));
                    int _589 = _132;
                    int _591 = 0;
                    int _593 = _39(_589, _591, (*spvDescriptorSet0.support_buffer));
                    int3 _1344 = int3(_587, _593, as_type<int>(_559));
                    float4 _595 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1344.xy), uint(_1344.z), 0).xyzw;
                    float _597 = _595.x;
                    float _599 = _595.y;
                    float _601 = _595.z;
                    float _603 = _595.w;
                    int _605 = _505 + 2;
                    float _607 = _507 + _575;
                    float _609 = _509 + _577;
                    float _611 = _511 + _579;
                    float _613 = _513 + _581;
                    float _615 = _597 + _607;
                    float _617 = _599 + _609;
                    float _619 = _601 + _611;
                    float _621 = _603 + _613;
                    _529 = as_type<int>(_575);
                    _531 = as_type<int>(_577);
                    _533 = _597;
                    _535 = _599;
                    _537 = as_type<int>(_579);
                    _539 = as_type<int>(_581);
                    _541 = uint(_605);
                    _543 = 0;
                    _545 = _615;
                    _547 = _617;
                    _549 = _619;
                    _551 = _621;
                }
                int _623 = _529;
                int _625 = _531;
                float _627 = _533;
                float _629 = _535;
                int _631 = _537;
                int _633 = _539;
                uint _635 = _541;
                int _637 = _543;
                float _639 = _545;
                float _641 = _547;
                float _643 = _549;
                float _645 = _551;
                bool _647 = _635 < _88;
                int _649 = (_647 ? (-1) : 0) | _637;
                int _651 = ~_649;
                _178 = _623;
                _180 = _625;
                _182 = _627;
                _184 = _629;
                _190 = _631;
                _192 = _633;
                _202 = _639;
                _204 = _641;
                _206 = _643;
                _208 = _645;
                if (!(_651 != 0))
                {
                    bool _653 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].y) > 65535u;
                    bool _655 = !_653;
                    float _657 = _655 ? (*spvDescriptorSet0.cp_c3)._m0[1].y : 9.1834094859526886742986618240905e-41;
                    int _659 = int(_635);
                    int _661 = 0;
                    int _663 = _39(_659, _661, (*spvDescriptorSet0.support_buffer));
                    int _665 = _132;
                    int _667 = 0;
                    int _669 = _39(_665, _667, (*spvDescriptorSet0.support_buffer));
                    int3 _1454 = int3(_663, _669, as_type<int>(_657));
                    float4 _671 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1454.xy), uint(_1454.z), 0).xyzw;
                    float _673 = _671.x;
                    float _675 = _671.y;
                    float _677 = _671.z;
                    float _679 = _671.w;
                    float _681 = _639 + _673;
                    float _683 = _641 + _675;
                    float _685 = _643 + _677;
                    float _687 = _645 + _679;
                    _202 = _681;
                    _204 = _683;
                    _206 = _685;
                    _208 = _687;
                }
            }
            int _689 = _178;
            int _691 = _180;
            float _693 = _182;
            float _695 = _184;
            int _697 = _186;
            int _699 = _188;
            int _701 = _190;
            int _703 = _192;
            int _705 = _194;
            int _707 = _196;
            int _709 = _198;
            int _711 = _200;
            float _713 = _202;
            float _715 = _204;
            float _717 = _206;
            int _719 = as_type<int>(_208);
            int _721 = _132 + 1;
            bool _723 = uint(_721) >= _58;
            _114 = !_723;
            _64 = _713;
            _66 = _715;
            _68 = _717;
            _70 = _719;
            _90 = _689;
            _92 = _691;
            _94 = _693;
            _96 = _695;
            _72 = _721;
            _98 = _697;
            _100 = _699;
            _102 = _701;
            _104 = _703;
            _106 = _705;
            _108 = _707;
            _110 = _709;
            _112 = _711;
            _74 = as_type<int>(_713);
            _76 = as_type<int>(_715);
            _78 = as_type<int>(_717);
            _80 = _719;
        } while (_114);
    }
    int _725 = _74;
    int _727 = _76;
    int _729 = _78;
    int _731 = _80;
    int _733 = _53 << 4;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_735)] = uint(_725);
    int _737 = _733 + 4;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_739)] = uint(_727);
    int _741 = _733 + 8;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_743)] = uint(_729);
    int _745 = _733 + 12;
    uint _747 = uint(int(uint(_745) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_747)] = uint(_731);
}

