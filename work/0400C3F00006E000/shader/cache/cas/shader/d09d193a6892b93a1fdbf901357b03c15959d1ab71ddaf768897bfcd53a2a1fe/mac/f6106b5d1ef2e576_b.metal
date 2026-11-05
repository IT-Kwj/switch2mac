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
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
};

static inline __attribute__((always_inline))
int _39(thread const int& _1531, thread const int& _1532, constant _10& support_buffer)
{
    int _1535 = 1 + _1532;
    float _1537 = support_buffer._m5[_1535].x;
    bool _1539 = _1537 == 1.0;
    if (_1539)
    {
        return _1531;
    }
    float _1541 = float(_1531);
    float _1543 = _1541 * _1537;
    int _1545 = int(_1543);
    return _1545;
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
    int _66 = _49;
    float _68 = 0.0;
    float _70 = 0.0;
    float _72 = 0.0;
    int _74 = 0;
    int _76 = 0;
    int _78 = 0;
    int _80 = 0;
    if (!_62)
    {
        int _82 = as_type<int>(_45) + 1;
        int _84 = _82 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _86 = as_type<int>(_45) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        uint _88 = min(uint(_84), as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z));
        float _90 = 0.0;
        float _92 = 0.0;
        float _94 = 0.0;
        float _96 = 0.0;
        int _98 = 0;
        int _100 = 0;
        int _102 = 0;
        int _104 = 0;
        int _106 = 0;
        int _108 = 0;
        int _110 = 0;
        int _112 = 0;
        int _114 = 0;
        int _116 = 0;
        bool _118;
        bool _335;
        do
        {
            float _120 = _64;
            float _122 = _90;
            float _124 = _92;
            float _126 = _94;
            float _128 = _96;
            int _130 = _66;
            float _132 = _68;
            float _134 = _70;
            float _136 = _72;
            int _138 = _98;
            int _140 = _100;
            int _142 = _102;
            int _144 = _104;
            int _146 = _106;
            int _148 = _108;
            int _150 = _110;
            int _152 = _112;
            int _154 = _114;
            int _156 = _116;
            bool _158 = uint(_86) >= _88;
            float _160 = _120;
            float _162 = _132;
            float _164 = _134;
            float _166 = _136;
            int _168 = _138;
            int _170 = _140;
            int _172 = _142;
            int _174 = _144;
            int _176 = _146;
            int _178 = _148;
            int _180 = _150;
            int _182 = _152;
            int _184 = _154;
            int _186 = _156;
            float _188 = _122;
            float _190 = _124;
            float _192 = _126;
            float _194 = _128;
            float _196 = _132;
            float _198 = _134;
            float _200 = _136;
            int _202 = _138;
            int _204 = _140;
            int _206 = _142;
            int _208 = _144;
            int _210 = _146;
            int _212 = _148;
            int _214 = _150;
            int _216 = _152;
            int _218 = _154;
            int _220 = _156;
            float _222 = _120;
            if (!_158)
            {
                bool _224 = uint(_86) >= _88;
                float _226 = _122;
                float _228 = _124;
                float _230 = _126;
                float _232 = _128;
                uint _234 = uint(_86);
                if (_224)
                {
                    int _236 = _86;
                    int _238 = 0;
                    int _240 = _39(_236, _238, (*spvDescriptorSet0.support_buffer));
                    int _242 = _130;
                    int _244 = 0;
                    int _246 = _39(_242, _244, (*spvDescriptorSet0.support_buffer));
                    float4 _249 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_240, _246)), 0).xyzw;
                    float _251 = _249.x;
                    float _253 = _249.y;
                    float _255 = _249.z;
                    float _257 = _249.w;
                    _226 = _251;
                    _228 = _253;
                    _230 = _255;
                    _232 = _257;
                }
                float _259 = _226;
                float _261 = _228;
                float _263 = _230;
                float _265 = _232;
                if (_224)
                {
                    int _267 = _86 + 1;
                    _234 = uint(_267);
                }
                uint _269 = _234;
                bool _271 = _88 > _269;
                int _273 = ~int(_269);
                int _275 = _273 + int(_88);
                int _277 = _275 + 1;
                bool _279 = uint(_277) <= 3u;
                bool _281 = !_271;
                bool _283 = _279 || _281;
                int _285 = int(_269);
                float _287 = _259;
                float _289 = _261;
                float _291 = _263;
                float _293 = _265;
                uint _295 = _269;
                if (_224)
                {
                    float _297 = _120 + _259;
                    _160 = _297;
                }
                float _299 = _160;
                float _301 = _299;
                float _303 = _299;
                if (_224)
                {
                    float _305 = _132 + _261;
                    _162 = _305;
                }
                float _307 = _162;
                float _309 = _307;
                float _311 = _307;
                if (_224)
                {
                    float _313 = _134 + _263;
                    _164 = _313;
                }
                float _315 = _164;
                float _317 = _315;
                float _319 = _315;
                if (_224)
                {
                    float _321 = _136 + _265;
                    _166 = _321;
                }
                float _323 = _166;
                bool _325 = !_224;
                float _327 = _323;
                float _329 = _323;
                int _331 = _325 ? (-1) : 0;
                if (!_283)
                {
                    int _333 = int(_88) + (-3);
                    _331 = 0;
                    do
                    {
                        int _337 = _285;
                        float _339 = _309;
                        float _341 = _317;
                        float _343 = _301;
                        float _345 = _327;
                        int _347 = _337;
                        int _349 = 0;
                        int _351 = _39(_347, _349, (*spvDescriptorSet0.support_buffer));
                        int _353 = _130;
                        int _355 = 0;
                        int _357 = _39(_353, _355, (*spvDescriptorSet0.support_buffer));
                        float4 _359 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_351, _357)), 0).xyzw;
                        float _361 = _359.x;
                        float _363 = _359.y;
                        float _365 = _359.z;
                        float _367 = _359.w;
                        int _369 = _337 + 1;
                        int _371 = _337 + 2;
                        int _373 = _369;
                        int _375 = 0;
                        int _377 = _39(_373, _375, (*spvDescriptorSet0.support_buffer));
                        int _379 = _130;
                        int _381 = 0;
                        int _383 = _39(_379, _381, (*spvDescriptorSet0.support_buffer));
                        float4 _385 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_377, _383)), 0).xyzw;
                        float _387 = _385.x;
                        float _389 = _385.y;
                        float _391 = _385.z;
                        float _393 = _385.w;
                        int _395 = _337 + 3;
                        int _397 = _371;
                        int _399 = 0;
                        int _401 = _39(_397, _399, (*spvDescriptorSet0.support_buffer));
                        int _403 = _130;
                        int _405 = 0;
                        int _407 = _39(_403, _405, (*spvDescriptorSet0.support_buffer));
                        float4 _409 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_401, _407)), 0).xyzw;
                        float _411 = _409.x;
                        float _413 = _409.y;
                        float _415 = _409.z;
                        float _417 = _409.w;
                        int _419 = _395;
                        int _421 = 0;
                        int _423 = _39(_419, _421, (*spvDescriptorSet0.support_buffer));
                        int _425 = _130;
                        int _427 = 0;
                        int _429 = _39(_425, _427, (*spvDescriptorSet0.support_buffer));
                        float4 _431 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_423, _429)), 0).xyzw;
                        float _433 = _431.x;
                        float _435 = _431.y;
                        float _437 = _431.z;
                        float _439 = _431.w;
                        int _441 = _337 + 4;
                        bool _443 = uint(_441) >= uint(_333);
                        float _445 = _363 + _339;
                        float _447 = _365 + _341;
                        float _449 = _361 + _343;
                        float _451 = _367 + _345;
                        float _453 = _447 + _391;
                        float _455 = _449 + _387;
                        float _457 = _445 + _389;
                        float _459 = _451 + _393;
                        float _461 = _453 + _415;
                        float _463 = _455 + _411;
                        float _465 = _457 + _413;
                        float _467 = _459 + _417;
                        float _469 = _461 + _437;
                        float _471 = _463 + _433;
                        float _473 = _465 + _435;
                        float _475 = _467 + _439;
                        _335 = !_443;
                        _285 = _441;
                        _309 = _473;
                        _317 = _469;
                        _301 = _471;
                        _327 = _475;
                        _287 = _361;
                        _289 = _363;
                        _291 = _365;
                        _293 = _367;
                        _311 = _473;
                        _319 = _469;
                        _329 = _475;
                        _168 = as_type<int>(_387);
                        _170 = as_type<int>(_389);
                        _172 = as_type<int>(_391);
                        _174 = as_type<int>(_393);
                        _176 = as_type<int>(_411);
                        _178 = as_type<int>(_413);
                        _180 = as_type<int>(_417);
                        _182 = as_type<int>(_433);
                        _184 = as_type<int>(_435);
                        _186 = as_type<int>(_439);
                        _295 = uint(_441);
                        _303 = _471;
                    } while (_335);
                }
                float _477 = _287;
                float _479 = _289;
                float _481 = _291;
                float _483 = _293;
                float _485 = _311;
                float _487 = _319;
                float _489 = _329;
                int _491 = _168;
                int _493 = _170;
                int _495 = _172;
                int _497 = _174;
                int _499 = _176;
                int _501 = _178;
                int _503 = _180;
                int _505 = _182;
                int _507 = _184;
                int _509 = _186;
                uint _511 = _295;
                float _513 = _303;
                int _515 = _331;
                bool _517 = _88 > _511;
                int _519 = ~int(_511);
                int _521 = _519 + int(_88);
                int _523 = _521 + 1;
                bool _525 = uint(_523) <= 1u;
                bool _527 = !_517;
                bool _529 = _525 || _527;
                float _531 = _477;
                float _533 = _479;
                float _535 = _481;
                float _537 = _483;
                float _539 = _485;
                float _541 = _487;
                float _543 = _489;
                int _545 = _491;
                int _547 = _493;
                int _549 = _495;
                int _551 = _497;
                uint _553 = _511;
                int _555 = _515;
                float _557 = _513;
                _210 = _499;
                _212 = _501;
                _214 = _503;
                _216 = _505;
                _218 = _507;
                _220 = _509;
                if (!_529)
                {
                    int _559 = int(_511) + 1;
                    int _561 = int(_511);
                    int _563 = 0;
                    int _565 = _39(_561, _563, (*spvDescriptorSet0.support_buffer));
                    int _567 = _130;
                    int _569 = 0;
                    int _571 = _39(_567, _569, (*spvDescriptorSet0.support_buffer));
                    float4 _573 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_565, _571)), 0).xyzw;
                    float _575 = _573.x;
                    float _577 = _573.y;
                    float _579 = _573.z;
                    float _581 = _573.w;
                    int _583 = _559;
                    int _585 = 0;
                    int _587 = _39(_583, _585, (*spvDescriptorSet0.support_buffer));
                    int _589 = _130;
                    int _591 = 0;
                    int _593 = _39(_589, _591, (*spvDescriptorSet0.support_buffer));
                    float4 _595 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_587, _593)), 0).xyzw;
                    float _597 = _595.x;
                    float _599 = _595.y;
                    float _601 = _595.z;
                    float _603 = _595.w;
                    int _605 = int(_511) + 2;
                    float _607 = _485 + _577;
                    float _609 = _513 + _575;
                    float _611 = _487 + _579;
                    float _613 = _489 + _581;
                    float _615 = _597 + _609;
                    float _617 = _599 + _607;
                    float _619 = _601 + _611;
                    float _621 = _603 + _613;
                    _531 = _597;
                    _533 = _599;
                    _535 = _601;
                    _537 = _603;
                    _539 = _617;
                    _541 = _619;
                    _543 = _621;
                    _545 = as_type<int>(_579);
                    _547 = as_type<int>(_581);
                    _549 = as_type<int>(_575);
                    _551 = as_type<int>(_611);
                    _553 = uint(_605);
                    _555 = 0;
                    _557 = _615;
                }
                float _623 = _531;
                float _625 = _533;
                float _627 = _535;
                float _629 = _537;
                float _631 = _539;
                float _633 = _541;
                float _635 = _543;
                int _637 = _545;
                int _639 = _547;
                int _641 = _549;
                int _643 = _551;
                uint _645 = _553;
                int _647 = _555;
                float _649 = _557;
                bool _651 = _645 < _88;
                int _653 = (_651 ? (-1) : 0) | _647;
                int _655 = ~_653;
                _188 = _623;
                _190 = _625;
                _192 = _627;
                _194 = _629;
                _196 = _631;
                _198 = _633;
                _200 = _635;
                _202 = _637;
                _204 = _639;
                _206 = _641;
                _208 = _643;
                _222 = _649;
                if (!(_655 != 0))
                {
                    int _657 = int(_645);
                    int _659 = 0;
                    int _661 = _39(_657, _659, (*spvDescriptorSet0.support_buffer));
                    int _663 = _130;
                    int _665 = 0;
                    int _667 = _39(_663, _665, (*spvDescriptorSet0.support_buffer));
                    float4 _669 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_661, _667)), 0).xyzw;
                    float _671 = _669.x;
                    float _673 = _669.y;
                    float _675 = _669.z;
                    float _677 = _669.w;
                    float _679 = _649 + _671;
                    float _681 = _631 + _673;
                    float _683 = _633 + _675;
                    float _685 = _635 + _677;
                    _188 = _675;
                    _190 = _677;
                    _192 = _671;
                    _194 = _673;
                    _196 = _681;
                    _198 = _683;
                    _200 = _685;
                    _222 = _679;
                }
            }
            float _687 = _188;
            float _689 = _190;
            float _691 = _192;
            float _693 = _194;
            float _695 = _196;
            float _697 = _198;
            float _699 = _200;
            int _701 = _202;
            int _703 = _204;
            int _705 = _206;
            int _707 = _208;
            int _709 = _210;
            int _711 = _212;
            int _713 = _214;
            int _715 = _216;
            int _717 = _218;
            int _719 = _220;
            float _721 = _222;
            int _723 = _130 + 1;
            bool _725 = uint(_723) >= _58;
            _118 = !_725;
            _64 = _721;
            _90 = _687;
            _92 = _689;
            _94 = _691;
            _96 = _693;
            _66 = _723;
            _68 = _695;
            _70 = _697;
            _72 = _699;
            _98 = _701;
            _100 = _703;
            _102 = _705;
            _104 = _707;
            _106 = _709;
            _108 = _711;
            _110 = _713;
            _112 = _715;
            _114 = _717;
            _116 = _719;
            _74 = as_type<int>(_721);
            _76 = as_type<int>(_695);
            _78 = as_type<int>(_697);
            _80 = as_type<int>(_699);
        } while (_118);
    }
    int _727 = _74;
    int _729 = _76;
    int _731 = _78;
    int _733 = _80;
    int _735 = _53 << 4;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_737)] = uint(_727);
    int _739 = _735 + 4;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_741)] = uint(_729);
    int _743 = _735 + 8;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_745)] = uint(_731);
    int _747 = _735 + 12;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_749)] = uint(_733);
}

