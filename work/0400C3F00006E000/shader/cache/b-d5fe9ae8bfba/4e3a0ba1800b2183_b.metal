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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c3 [[id(2)]];
    constant _16* cp_c4 [[id(3)]];
    texture2d<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(6)]];
    texture2d_array<float> cp_i_tcb_4A_ [[id(7)]];
    sampler cp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

static inline __attribute__((always_inline))
int _46(thread const int& _2586, thread const int& _2587, constant _10& support_buffer)
{
    int _2590 = 1 + _2587;
    float _2592 = support_buffer._m5[_2590].x;
    bool _2594 = _2592 == 1.0;
    if (_2594)
    {
        return _2586;
    }
    float _2596 = float(_2586);
    float _2598 = _2596 * _2592;
    int _2600 = int(_2598);
    return _2600;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _991 = false;
    bool _611 = false;
    bool _314 = false;
    float _50 = as_type<float>(gl_WorkGroupID.x);
    float _52 = as_type<float>(gl_LocalInvocationID.x);
    float _54 = as_type<float>(gl_WorkGroupID.y);
    float _56 = as_type<float>(gl_LocalInvocationID.y);
    float _58 = as_type<float>(gl_WorkGroupID.z);
    int _60 = as_type<int>(_50) << 3;
    int _62 = _60 + as_type<int>(_52);
    int _64 = _62 + (-64);
    int _66 = as_type<int>(_54) << 3;
    int _68 = _66 + as_type<int>(_56);
    int _70 = _68 + (-64);
    int _72 = _64 | _70;
    bool _76 = _72 != 0;
    int _78 = _64;
    int _80 = _70;
    if (!_76)
    {
        int3 _1124 = int3(_62, _68, as_type<int>(_58));
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(_1124.xy), uint(_1124.z));
    }
    if (!_76)
    {
        return;
    }
    float _82 = float(_70);
    float _84 = float(_64);
    int _86 = as_type<int>(_58) * as_type<int>((*spvDescriptorSet0.cp_c5)._m0[0].w);
    int _88 = _86 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    float _90 = _82 * _82;
    int _92 = _88 & 31;
    bool _94 = uint(_92) < 32u;
    int _96 = 1 << _92;
    int _98 = _94 ? _96 : 0;
    float _100 = fma(_84, _84, _90);
    float _102 = float(_98);
    float _104 = sqrt(_100);
    float _106 = 1.0 / _102;
    float _108 = _106 * 12.56637096405029296875;
    float _110 = _108 * _104;
    float _112 = 1.0 / _110;
    float _114 = _112 * 6.283185482025146484375;
    float _116 = log2(_114);
    float _118 = fma(_116, 0.071428574621677398681640625, 0.321428596973419189453125);
    float2 _1195 = float2(_118, 0.5);
    float _120 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1195, float2(0.0), isnan(_1195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1195, float2(0.0), isnan(_1195)), level(0.0)).x;
    float _122 = _110 * (*spvDescriptorSet0.cp_c3)._m0[1].z;
    int _124 = _70 * _70;
    int _126 = _62;
    int _128 = 2;
    int _130 = _46(_126, _128, (*spvDescriptorSet0.support_buffer));
    int _132 = _68;
    int _134 = 2;
    int _136 = _46(_132, _134, (*spvDescriptorSet0.support_buffer));
    int3 _1218 = int3(_130, _136, as_type<int>(_58));
    float2 _140 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(_1218.xy), uint(_1218.z)).xy);
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = abs(_122);
    bool _148 = _146 >= 0.60000002384185791015625;
    int _150 = _64 * _64;
    int _152 = _150 + _124;
    bool _154 = _152 > 16383;
    float _156 = 0.5;
    float _158 = as_type<float>(_152);
    float _160 = _84;
    float _162 = _82;
    if (_148)
    {
        float _164 = abs(_122);
        float _166 = _164 * 2.8853900432586669921875;
        _156 = _166;
    }
    float _168 = _156;
    float _170 = _168;
    if (_148)
    {
        float _172 = exp2(_168);
        _170 = _172;
    }
    float _174 = _170;
    float _176 = 0.0;
    if (!_148)
    {
        _176 = 0.0157396830618381500244140625;
    }
    float _178 = _176;
    float _180 = _178;
    if (!_148)
    {
        float _182 = _122 * _122;
        _158 = _182;
    }
    float _184 = _158;
    float _186 = 0.0;
    if (_148)
    {
        float _188 = _174 + 1.0;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = _190;
    if (_148)
    {
        float _194 = 1.0 / _190;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = 0.0;
    if (_148)
    {
        _198 = 1.0;
    }
    float _200 = _198;
    int _202 = as_type<int>(_200);
    if (!_148)
    {
        float _204 = fma(_184, _178, -0.052303962409496307373046875);
        _180 = _204;
    }
    float _206 = _180;
    int _208 = 0;
    float _210 = _206;
    if (_148)
    {
        float _212 = abs(_122);
        bool _214 = _212 >= 9.010913848876953125;
        _208 = _214 ? (-1) : 0;
    }
    int _216 = _208;
    if (_154)
    {
        int3 _1329 = int3(_62, _68, as_type<int>(_58));
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(_1329.xy), uint(_1329.z));
    }
    if (!_148)
    {
        float _218 = fma(_184, _206, 0.13315297663211822509765625);
        _210 = _218;
    }
    float _220 = _210;
    float _222 = 0.0;
    int _224 = as_type<int>(_220);
    if (!_148)
    {
        float _226 = fma(_184, _220, -0.3333276808261871337890625);
        _222 = _226;
    }
    float _228 = _222;
    float _230 = _228;
    float _232 = _196;
    if (_148)
    {
        float _234 = fma(_196, -2.0, _200);
        _202 = as_type<int>(_234);
    }
    int _236 = _202;
    if (_148)
    {
        int _238 = ~_216;
        int _240 = (_238 != 0) ? _236 : 1065353216;
        _224 = _240;
    }
    int _242 = _224;
    if (_154)
    {
        return;
    }
    if (!_148)
    {
        float _244 = fma(_184, _228, 0.0);
        _230 = _244;
    }
    float _246 = _230;
    if (_148)
    {
        int _248 = int(0x80000000) & as_type<int>(_122);
        int _250 = _242 | _248;
        _232 = as_type<float>(_250);
    }
    float _252 = _232;
    float _254 = (*spvDescriptorSet0.cp_c3)._m0[1].z * 0.101936794817447662353515625;
    float _256 = _252;
    if (!_148)
    {
        float _258 = fma(_122, _246, _122);
        _256 = _258;
    }
    float _260 = _256;
    float _262 = _110 * 9.81000041961669921875;
    float _264 = sqrt(_254);
    float _266 = _262 * _260;
    float _268 = sqrt(_266);
    float _270 = rsqrt(_266);
    float _272 = _268 * _264;
    float _274 = fma(_272, 1.7999999523162841796875, -2.0249998569488525390625);
    float _276 = _270 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _278 = abs(_274);
    bool _280 = _278 >= 0.60000002384185791015625;
    float _282 = _276 * _276;
    bool _284 = !_280;
    float _286 = _274;
    float _312;
    if (!_284)
    {
        float _288 = abs(_274);
        float _290 = _288 * 2.8853900432586669921875;
        float _292 = abs(_274);
        bool _294 = _292 >= 9.010913848876953125;
        float _296 = exp2(_290);
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _298;
        float _302 = fma(_300, -2.0, 1.0);
        bool _304 = !_294;
        int _306 = _304 ? as_type<int>(_302) : 1065353216;
        int _308 = int(0x80000000) & as_type<int>(_274);
        int _310 = _306 | _308;
        _312 = as_type<float>(_310);
        _314 = true;
    }
    else
    {
        float _316 = _274 * _274;
        float _318 = fma(_316, 0.0157396830618381500244140625, -0.052303962409496307373046875);
        float _320 = fma(_316, _318, 0.13315297663211822509765625);
        float _322 = fma(_316, _320, -0.3333276808261871337890625);
        float _324 = fma(_316, _322, 0.0);
        float _326 = fma(_274, _324, _274);
        _312 = _326;
    }
    _314 = false;
    float _328 = _312;
    bool _330 = _70 != 0;
    bool _332 = _64 > 0;
    bool _334 = _332 || _330;
    if (!_330)
    {
        uint _337 = uint(int(uint(_64) >> uint(31)));
        _78 = int(_337);
    }
    int _339 = _78;
    if (!_330)
    {
        int _341 = ~_339;
        int _343 = _341 + 1;
        int _345 = _343 + 1;
        _80 = _345;
    }
    int _347 = _80;
    int _349 = _347;
    if (!_334)
    {
        int _351 = ~_339;
        int _353 = _351 + 1;
        _349 = _353;
    }
    int _355 = _349;
    float _357 = as_type<float>(_355);
    if (!_330)
    {
        float _359 = float(_355);
        _357 = _359;
    }
    float _361 = _357;
    float _363 = fma(_328, 0.5, 0.5);
    int _365 = as_type<int>(_361);
    if (!_330)
    {
        float _367 = _361 * 1.57079637050628662109375;
        _365 = as_type<int>(_367);
    }
    int _369 = _365;
    bool _371 = !_330;
    int _373 = _369;
    float _375 = as_type<float>(_369);
    if (!_371)
    {
        float _377 = abs(_84);
        float _379 = abs(_82);
        float _381 = precise::max(_377, _379);
        bool _383 = _381 >= 16.0;
        if (_383)
        {
            float _385 = _84 * 0.0625;
            _160 = _385;
        }
        float _387 = _160;
        if (_383)
        {
            float _389 = _82 * 0.0625;
            _162 = _389;
        }
        float _391 = _162;
        float _393 = abs(_387);
        bool _395 = _393 != 0.0;
        bool _397 = isnan(_393);
        bool _399 = _395 || _397;
        bool _401 = isnan(0.0);
        bool _403 = _399 || _401;
        float _405 = abs(_391);
        bool _407 = _405 == 0.0;
        float _409 = abs(_391);
        bool _411 = _409 == 0.0;
        bool _413 = !_403;
        bool _415 = _411 && _413;
        bool _417 = false;
        if (_415)
        {
            bool _419 = as_type<int>(_391) >= 0;
            _417 = _419;
        }
        bool _421 = _417;
        int _423 = _421 ? (-1) : 0;
        if (_415)
        {
            int _425 = _421 ? 0 : 1078530011;
            _373 = _425;
        }
        int _427 = _373;
        int _429 = _427;
        if (_415)
        {
            int _431 = int(0x80000000) & as_type<int>(_387);
            int _433 = _427 | _431;
            _429 = _433;
        }
        int _435 = _429;
        bool _437 = !_403;
        bool _439 = _437 && _407;
        int _441 = _435;
        _375 = as_type<float>(_435);
        if (!_439)
        {
            float _443 = abs(_387);
            bool _445 = _443 != as_type<float>(0x7f800000u /* inf */);
            bool _447 = isnan(_443);
            bool _449 = _445 || _447;
            bool _451 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _453 = _449 || _451;
            float _455 = abs(_391);
            bool _457 = _455 == as_type<float>(0x7f800000u /* inf */);
            float _459 = abs(_391);
            bool _461 = _459 == as_type<float>(0x7f800000u /* inf */);
            bool _463 = !_453;
            bool _465 = _461 && _463;
            if (_465)
            {
                bool _467 = as_type<int>(_391) >= 0;
                _423 = _467 ? (-1) : 0;
            }
            int _469 = _423;
            if (_465)
            {
                _441 = 1075235812;
            }
            int _471 = _441;
            int _473 = _471;
            if (_465)
            {
                int _475 = ~_469;
                int _477 = (_475 != 0) ? _471 : 1061752795;
                _473 = _477;
            }
            int _479 = _473;
            float _481 = as_type<float>(_479);
            if (_465)
            {
                int _483 = int(0x80000000) & as_type<int>(_387);
                int _485 = _479 | _483;
                _481 = as_type<float>(_485);
            }
            float _487 = _481;
            bool _489 = !_453;
            bool _491 = _489 && _457;
            _375 = _487;
            if (!_491)
            {
                float _493 = abs(_387);
                float _495 = abs(_391);
                float _497 = precise::max(_493, _495);
                float _499 = abs(_387);
                float _501 = abs(_391);
                float _503 = precise::min(_499, _501);
                float _505 = 1.0 / _497;
                float _507 = abs(_387);
                float _509 = abs(_391);
                bool _511 = _507 > _509;
                bool _513 = as_type<int>(_391) >= 0;
                float _515 = _503 * _505;
                float _517 = _515 * _515;
                float _519 = _517 + 11.33538818359375;
                float _521 = fma(_517, _519, 28.84246826171875);
                float _523 = fma(_517, _521, 19.6966705322265625);
                float _525 = fma(_517, -0.82336294651031494140625, -5.674867153167724609375);
                float _527 = fma(_517, _525, -6.565555095672607421875);
                float _529 = 1.0 / _523;
                float _531 = _517 * _527;
                float _533 = abs(_387);
                float _535 = abs(_391);
                float _537 = _533 + _535;
                int _539 = as_type<int>(_387) & int(0x80000000);
                float _541 = _515 * _531;
                bool _543 = _537 > as_type<float>(0x7f800000u /* inf */);
                bool _545 = isnan(_537);
                bool _547 = _543 || _545;
                bool _549 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _551 = _547 || _549;
                float _553 = fma(_541, _529, _515);
                float _555 = _553;
                _375 = _537;
                _286 = _527;
                if (_511)
                {
                    float _557 = -_553;
                    float _559 = _557 + 1.57079637050628662109375;
                    _555 = _559;
                }
                float _561 = _555;
                int _563 = as_type<int>(_561);
                if (!_513)
                {
                    float _565 = -_561;
                    float _567 = _565 + 3.1415927410125732421875;
                    _563 = as_type<int>(_567);
                }
                int _569 = _563;
                if (!_551)
                {
                    int _571 = _539 | _569;
                    _375 = as_type<float>(_571);
                }
            }
        }
    }
    float _573 = _375;
    float _575 = _286;
    float _577 = abs(_276);
    bool _579 = _577 >= 0.60000002384185791015625;
    bool _581 = !_579;
    float _583 = _575;
    float _609;
    if (!_581)
    {
        float _585 = abs(_276);
        float _587 = _585 * 2.8853900432586669921875;
        float _589 = abs(_276);
        bool _591 = _589 >= 9.010913848876953125;
        float _593 = exp2(_587);
        float _595 = _593 + 1.0;
        float _597 = 1.0 / _595;
        float _599 = fma(_597, -2.0, 1.0);
        bool _601 = !_591;
        int _603 = _601 ? as_type<int>(_599) : 1065353216;
        int _605 = int(0x80000000) & as_type<int>(_276);
        int _607 = _603 | _605;
        _609 = as_type<float>(_607);
        _611 = true;
    }
    else
    {
        float _613 = fma(_282, 0.0157396830618381500244140625, -0.052303962409496307373046875);
        float _615 = fma(_282, _613, 0.13315297663211822509765625);
        float _617 = fma(_282, _615, -0.3333276808261871337890625);
        float _619 = fma(_282, _617, 0.0);
        float _621 = fma(_276, _619, _276);
        _609 = _621;
    }
    _611 = false;
    float _623 = _609;
    float _625 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[0].x;
    bool _627 = _268 > (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _629 = _282 * _282;
    float _631 = -(*spvDescriptorSet0.cp_c3)._m0[2].x;
    float _633 = _573 + _631;
    float _635 = _266 * _266;
    float _637 = _627 ? 0.0900000035762786865234375 : 0.070000000298023223876953125;
    if (_627)
    {
        _583 = 0.14780835807323455810546875;
    }
    float _639 = _583;
    float _641 = _268 * _625;
    float _643 = _637 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _645 = _629 * (-1.8033688068389892578125);
    float _647 = _633 * 0.5;
    float _649 = (*spvDescriptorSet0.cp_c3)._m0[1].w * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _651 = 1.0 / _643;
    float _653 = _647 * 0.15915493667125701904296875;
    float _655 = _649;
    float _657 = _647;
    if (_627)
    {
        float _659 = -_639;
        float _661 = fma(_649, _659, -0.63349997997283935546875);
        _655 = _661;
    }
    float _663 = _655;
    float _665 = abs(_641);
    float _667 = log2(_665);
    float _669 = -(*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _671 = _268 + _669;
    float _673 = _671 * _651;
    int _675 = _62 * 1664525;
    int _677 = _675 + 1013904223;
    float _679 = _653 * 6.283185482025146484375;
    float _681 = cos(_679);
    int _683 = _68 * 1664525;
    int _685 = _683 + 1013904223;
    float _687 = _673 * _673;
    float _689 = _667;
    if (_627)
    {
        float _691 = _663 * _667;
        _657 = _691;
    }
    float _693 = _657;
    int _695 = as_type<int>(_58) * 1664525;
    if (!_627)
    {
        float _697 = _667 * 4.059999942779541015625;
        _689 = _697;
    }
    float _699 = _689;
    float _701 = exp2(_645);
    int _703 = _695 + 1226963423;
    int _705 = _695 + 1013904223;
    float _707 = _687 * (-0.721347510814666748046875);
    float _709 = _268 * _635;
    int _711 = _685 * _703;
    int _713 = _711 + _677;
    float _715 = _693;
    float _717 = _701;
    if (_627)
    {
        float _719 = exp2(_693);
        _715 = _719;
    }
    float _721 = _715;
    int _723 = _705 * _713;
    int _725 = _723 + _685;
    uint _727 = uint(int(uint(_713) >> uint(16)));
    float _729 = _623 * 16.0;
    int _731 = _713 * _725;
    int _733 = _731 + _705;
    float _735 = _699;
    float _737 = as_type<float>(_727);
    if (!_627)
    {
        float _739 = exp2(_699);
        _735 = _739;
    }
    float _741 = _735;
    uint _743 = uint(int(uint(_725) >> uint(16)));
    int _745 = _725 * _733;
    int _747 = _745 + _703;
    int _749 = _713 ^ int(_727);
    int _751 = _725 ^ int(_743);
    float _753 = exp2(_707);
    uint _755 = uint(int(uint(_747) >> uint(16)));
    float _757 = as_type<float>(_749);
    if (_627)
    {
        float _759 = _721 * 9.770000457763671875;
        _737 = _759;
    }
    float _761 = _737;
    int _763 = _747 ^ int(_755);
    uint _765 = uint(int(uint(_733) >> uint(16)));
    float _767 = _761;
    if (!_627)
    {
        float _769 = _741 * 6.969999790191650390625;
        _767 = _769;
    }
    float _771 = _767;
    float _773 = (*spvDescriptorSet0.cp_c3)._m0[0].w * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    int _775 = _751 * _763;
    int _777 = _775 + _749;
    int _779 = _733 ^ int(_765);
    float _781 = abs(_681);
    float _783 = log2(_781);
    float _785 = fma(_729, _773, _771);
    float _787 = _753 * 1.722465991973876953125;
    float _789 = float(uint(_777));
    int _791 = _779 * _777;
    int _793 = _791 + _751;
    bool _795 = _785 >= 5.0;
    bool _797 = isnan(_785);
    bool _799 = _795 || _797;
    bool _801 = isnan(5.0);
    bool _803 = _799 || _801;
    float _805 = 1.0 / _709;
    float _807 = fma(_789, 2.3283064365386962890625e-10, 9.9999997473787516355514526367188e-06);
    float _809 = float(uint(_793));
    int _811 = _777 * _793;
    int _813 = _811 + _779;
    float _815 = log2(_807);
    float _817 = fma(_809, 2.3283064365386962890625e-10, 9.9999997473787516355514526367188e-06);
    float _819 = float(uint(_813));
    int _821 = _793 * _813;
    int _823 = _821 + _763;
    float _825 = _785 * _783;
    float _827 = _825 * 2.0;
    float _829 = 2.3283064365386962890625e-10;
    if (!_803)
    {
        _829 = 0.000563999987207353115081787109375;
    }
    float _831 = _829;
    float _833 = _819 * 1.4629181199765639576071407645941e-09;
    float _835 = log2(_817);
    float _837 = float(uint(_823));
    float _839 = _831;
    if (!_803)
    {
        float _841 = -_831;
        float _843 = fma(_785, _841, 0.0077599999494850635528564453125);
        _839 = _843;
    }
    float _845 = _839;
    float _847 = _833 * 0.15915493667125701904296875;
    if (_803)
    {
        _757 = 4.8000000418824129155836999416351e-08;
    }
    float _849 = _757;
    float _851 = _837 * 1.4629181199765639576071407645941e-09;
    float _853 = _815 * 0.693147182464599609375;
    float _855 = exp2(_827);
    float _857 = _851 * 0.15915493667125701904296875;
    float _859 = _849;
    if (_803)
    {
        float _861 = -_849;
        float _863 = fma(_785, _861, 1.0699999620555900037288665771484e-05);
        _859 = _863;
    }
    float _865 = _859;
    float _867 = (*spvDescriptorSet0.cp_c3)._m0[0].y * 96.23610687255859375;
    float _869 = _785 * _785;
    float _871 = exp2(_787);
    float _873 = _835 * 0.693147182464599609375;
    float _875 = _785 * _869;
    float _877 = _835;
    float _879 = _869;
    if (!_803)
    {
        float _881 = _869 * 0.0439999997615814208984375;
        _877 = _881;
    }
    float _883 = _877;
    float _885 = _883;
    if (_803)
    {
        float _887 = _869 * 0.0009529999806545674800872802734375;
        _879 = _887;
    }
    float _889 = _879;
    float _891 = _867 * _805;
    float _893 = _889;
    if (!_803)
    {
        float _895 = -_883;
        float _897 = fma(_875, _845, _895);
        _885 = _897;
    }
    float _899 = _885;
    float _901 = -_853;
    float _903 = sqrt(_901);
    float _905 = _899;
    if (_803)
    {
        float _907 = -_889;
        float _909 = fma(_875, _865, _907);
        _893 = _909;
    }
    float _911 = _893;
    float _913 = _701 * _891;
    float _915 = _911;
    if (!_803)
    {
        float _917 = fma(_785, 0.1920000016689300537109375, _899);
        _905 = _917;
    }
    float _919 = _905;
    if (_803)
    {
        float _921 = fma(_785, 0.05900000035762786865234375, _911);
        _915 = _921;
    }
    float _923 = _915;
    if (!_803)
    {
        float _925 = _919 + 0.16300000250339508056640625;
        _717 = _925;
    }
    float _927 = _717;
    float _929 = -_873;
    float _931 = sqrt(_929);
    float _933 = _927;
    if (_803)
    {
        float _935 = _923 + 0.39300000667572021484375;
        _933 = _935;
    }
    float _937 = _933;
    float _939 = _913 * _871;
    float _941 = fma(_855, _937, -0.15915493667125701904296875);
    float _943 = _363 * _939;
    float _945 = _847 * 6.283185482025146484375;
    float _947 = cos(_945);
    float _949 = _903 * 0.23000000417232513427734375;
    float _951 = fma(_941, (*spvDescriptorSet0.cp_c3)._m0[0].z, 0.15915493667125701904296875);
    float _953 = _857 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = _931 * 0.23000000417232513427734375;
    float _959 = _949 * _947;
    float _961 = _957 * _955;
    bool _963 = !_148;
    float _989;
    if (!_963)
    {
        float _965 = abs(_122);
        float _967 = _965 * 2.8853900432586669921875;
        float _969 = abs(_122);
        bool _971 = _969 >= 9.010913848876953125;
        float _973 = exp2(_967);
        float _975 = _973 + 1.0;
        float _977 = 1.0 / _975;
        float _979 = fma(_977, -2.0, 1.0);
        bool _981 = !_971;
        int _983 = _981 ? as_type<int>(_979) : 1065353216;
        int _985 = int(0x80000000) & as_type<int>(_122);
        int _987 = _983 | _985;
        _989 = as_type<float>(_987);
        _991 = true;
    }
    else
    {
        float _993 = _122 * _122;
        float _995 = fma(0.0157396830618381500244140625, _993, -0.052303962409496307373046875);
        float _997 = fma(_993, _995, 0.13315297663211822509765625);
        float _999 = fma(_993, _997, -0.3333276808261871337890625);
        float _1001 = fma(_993, _999, 0.0);
        float _1003 = fma(_122, _1001, _122);
        _989 = _1003;
    }
    _991 = false;
    float _1005 = _989;
    float _1007 = _122 * 1.44269502162933349609375;
    float _1009 = _122 * (-1.44269502162933349609375);
    float _1011 = _262 * _1005;
    float _1013 = _108 * _108;
    float _1015 = exp2(_1009);
    float _1017 = exp2(_1007);
    float _1019 = sqrt(_1011);
    float _1021 = _1017 + _1015;
    float _1023 = _943 * _951;
    float _1025 = _1023 * 2.0;
    float _1027 = 1.0 / _1021;
    float _1029 = _110 * _1019;
    float _1031 = 1.0 / _1029;
    float _1033 = _1027 * 2.0;
    float _1035 = _1033 * _1033;
    float _1037 = fma(_122, _1035, _1005);
    float _1039 = _1037 * 9.81000041961669921875;
    float _1041 = _1039 * _1031;
    float _1043 = abs(_1041);
    float _1045 = _1025 * _1043;
    float _1047 = _1045 * _1013;
    float _1049 = sqrt(_1047);
    float _1051 = _1049 * (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _1053 = _959 * _1051;
    float _1055 = _961 * _1051;
    float _1057 = -_142;
    float _1059 = fma(_120, _1053, _1057);
    float _1061 = -_144;
    float _1063 = fma(_120, _1055, _1061);
    float _1065 = fma(_1059, (*spvDescriptorSet0.cp_c4)._m0[0].x, _142);
    float _1067 = fma(_1063, (*spvDescriptorSet0.cp_c4)._m0[0].x, _144);
    int3 _2582 = int3(_62, _68, as_type<int>(_58));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1065, _1067, 0.0, 0.0), uint2(_2582.xy), uint(_2582.z));
}

