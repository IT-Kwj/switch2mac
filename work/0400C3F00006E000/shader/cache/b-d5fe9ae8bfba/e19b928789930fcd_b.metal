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
int _46(thread const int& _2549, thread const int& _2550, constant _10& support_buffer)
{
    int _2553 = 1 + _2550;
    float _2555 = support_buffer._m5[_2553].x;
    bool _2557 = _2555 == 1.0;
    if (_2557)
    {
        return _2549;
    }
    float _2559 = float(_2549);
    float _2561 = _2559 * _2555;
    int _2563 = int(_2561);
    return _2563;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _977 = false;
    bool _597 = false;
    bool _292 = false;
    bool _228 = false;
    bool _188 = false;
    float _50 = as_type<float>(gl_WorkGroupID.x);
    float _52 = as_type<float>(gl_LocalInvocationID.x);
    float _54 = as_type<float>(gl_WorkGroupID.y);
    float _56 = as_type<float>(gl_LocalInvocationID.y);
    float _58 = as_type<float>(gl_WorkGroupID.z);
    int _60 = as_type<int>(_50) << 3;
    int _62 = _60 + as_type<int>(_52);
    int _64 = _62 + (-8);
    int _66 = as_type<int>(_54) << 3;
    int _68 = _66 + as_type<int>(_56);
    int _70 = _68 + (-8);
    int _72 = _64 | _70;
    bool _76 = _72 != 0;
    float _78 = 0.0;
    int _80 = _64;
    if (!_76)
    {
        _78 = _58;
    }
    float _82 = _78;
    if (!_76)
    {
        int3 _1116 = int3(_62, _68, as_type<int>(_82));
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(_1116.xy), uint(_1116.z));
    }
    if (!_76)
    {
        return;
    }
    float _84 = float(_70);
    int _86 = as_type<int>(_58) * as_type<int>((*spvDescriptorSet0.cp_c5)._m0[0].w);
    int _88 = _86 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    float _90 = float(_64);
    int _92 = _88 & 31;
    bool _94 = uint(_92) < 32u;
    int _96 = 1 << _92;
    int _98 = _94 ? _96 : 0;
    float _100 = float(_98);
    float _102 = _84 * _84;
    float _104 = 1.0 / _100;
    float _106 = fma(_90, _90, _102);
    float _108 = sqrt(_106);
    float _110 = _104 * 12.56637096405029296875;
    float _112 = _110 * _108;
    float _114 = 1.0 / _112;
    float _116 = _114 * 6.283185482025146484375;
    float _118 = log2(_116);
    float _120 = fma(_118, 0.071428574621677398681640625, 0.321428596973419189453125);
    float2 _1186 = float2(_120, 0.5);
    float _122 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1186, float2(0.0), isnan(_1186)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1186, float2(0.0), isnan(_1186)), level(0.0)).x;
    int _124 = _62;
    int _126 = 2;
    int _128 = _46(_124, _126, (*spvDescriptorSet0.support_buffer));
    int _130 = _68;
    int _132 = 2;
    int _134 = _46(_130, _132, (*spvDescriptorSet0.support_buffer));
    int3 _1202 = int3(_128, _134, as_type<int>(_58));
    float2 _138 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(_1202.xy), uint(_1202.z)).xy);
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _112 * (*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _146 = _112 * 9.81000041961669921875;
    float _148 = abs(_144);
    bool _150 = _148 >= 0.60000002384185791015625;
    bool _152 = !_150;
    float _154 = _58;
    float _156 = _90;
    float _158 = _84;
    float _184;
    float _186;
    if (!_152)
    {
        float _160 = abs(_144);
        float _162 = _160 * 2.8853900432586669921875;
        float _164 = abs(_144);
        bool _166 = _164 >= 9.010913848876953125;
        float _168 = exp2(_162);
        float _170 = _168 + 1.0;
        float _172 = 1.0 / _170;
        float _174 = fma(_172, -2.0, 1.0);
        bool _176 = !_166;
        int _178 = _176 ? as_type<int>(_174) : 1065353216;
        int _180 = int(0x80000000) & as_type<int>(_144);
        int _182 = _178 | _180;
        _184 = as_type<float>(_182);
        _186 = _168;
        _188 = true;
    }
    else
    {
        float _190 = _144 * _144;
        float _192 = fma(_190, 0.0157396830618381500244140625, -0.052303962409496307373046875);
        float _194 = fma(_190, _192, 0.13315297663211822509765625);
        float _196 = fma(_190, _194, -0.3333276808261871337890625);
        float _198 = fma(_190, _196, 0.0);
        float _200 = fma(_144, _198, _144);
        _184 = _200;
        _186 = _196;
    }
    _188 = false;
    float _202 = _184;
    float _204 = _186;
    float _206 = _146 * _202;
    bool _208 = as_type<int>(_58) != 0;
    float _210 = sqrt(_206);
    bool _212 = !_208;
    float _214 = _204;
    if (!_212)
    {
        float _216 = _100 * 0.015625;
        bool _218 = _116 >= _216;
        bool _220 = isnan(_116);
        bool _222 = _218 || _220;
        bool _224 = isnan(_216);
        bool _226 = _222 || _224;
        _228 = _226;
        if (!_228)
        {
            int3 _1334 = int3(_62, _68, as_type<int>(_58));
            spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(_1334.xy), uint(_1334.z));
            return;
        }
    }
    if (!_228)
    {
        int _230 = _70 * _70;
        int _232 = _64 * _64;
        int _234 = _232 + _230;
        bool _236 = _234 > 255;
        if (_236)
        {
            _214 = 0.0;
        }
        float _238 = _214;
        if (_236)
        {
            _154 = _238;
        }
        float _240 = _154;
        if (_236)
        {
            int3 _1369 = int3(_62, _68, as_type<int>(_240));
            spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(_1369.xy), uint(_1369.z));
        }
        if (_236)
        {
            return;
        }
    }
    _228 = false;
    float _242 = rsqrt(_206);
    float _244 = (*spvDescriptorSet0.cp_c3)._m0[1].z * 0.101936794817447662353515625;
    float _246 = sqrt(_244);
    float _248 = _242 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _250 = _210 * _246;
    float _252 = fma(_250, 1.7999999523162841796875, -2.0249998569488525390625);
    float _254 = _248 * _248;
    float _256 = abs(_252);
    bool _258 = _256 >= 0.60000002384185791015625;
    bool _260 = !_258;
    float _286;
    int _288;
    float _290;
    if (!_260)
    {
        float _262 = abs(_252);
        float _264 = _262 * 2.8853900432586669921875;
        float _266 = abs(_252);
        bool _268 = _266 >= 9.010913848876953125;
        float _270 = exp2(_264);
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = fma(_274, -2.0, 1.0);
        bool _278 = !_268;
        int _280 = _278 ? as_type<int>(_276) : 1065353216;
        int _282 = int(0x80000000) & as_type<int>(_252);
        int _284 = _280 | _282;
        _286 = as_type<float>(_284);
        _288 = as_type<int>(_270);
        _290 = 1.0;
        _292 = true;
    }
    else
    {
        float _294 = _252 * _252;
        float _296 = fma(_294, 0.0157396830618381500244140625, -0.052303962409496307373046875);
        float _298 = fma(_294, _296, 0.13315297663211822509765625);
        float _300 = fma(_294, _298, -0.3333276808261871337890625);
        float _302 = fma(_294, _300, 0.0);
        float _304 = fma(_252, _302, _252);
        _286 = _304;
        _288 = as_type<int>(_302);
        _290 = _294;
    }
    _292 = false;
    float _306 = _286;
    int _308 = _288;
    float _310 = _290;
    bool _312 = _70 != 0;
    bool _314 = _64 > 0;
    bool _316 = _314 || _312;
    float _318 = fma(_306, 0.5, 0.5);
    int _320 = _308;
    float _322 = _310;
    if (!_312)
    {
        uint _325 = uint(int(uint(_64) >> uint(31)));
        _80 = int(_325);
    }
    int _327 = _80;
    int _329 = _327;
    if (!_312)
    {
        int _331 = ~_327;
        int _333 = _331 + 1;
        int _335 = _333 + 1;
        _320 = _335;
    }
    int _337 = _320;
    int _339 = _337;
    if (!_316)
    {
        int _341 = ~_327;
        int _343 = _341 + 1;
        _339 = _343;
    }
    int _345 = _339;
    float _347 = as_type<float>(_345);
    if (!_312)
    {
        float _349 = float(_345);
        _347 = _349;
    }
    float _351 = _347;
    if (!_312)
    {
        float _353 = _351 * 1.57079637050628662109375;
        _329 = as_type<int>(_353);
    }
    int _355 = _329;
    bool _357 = !_312;
    int _359 = _355;
    float _361 = as_type<float>(_355);
    if (!_357)
    {
        float _363 = abs(_90);
        float _365 = abs(_84);
        float _367 = precise::max(_363, _365);
        bool _369 = _367 >= 16.0;
        if (_369)
        {
            float _371 = _90 * 0.0625;
            _156 = _371;
        }
        float _373 = _156;
        if (_369)
        {
            float _375 = _84 * 0.0625;
            _158 = _375;
        }
        float _377 = _158;
        float _379 = abs(_373);
        bool _381 = _379 != 0.0;
        bool _383 = isnan(_379);
        bool _385 = _381 || _383;
        bool _387 = isnan(0.0);
        bool _389 = _385 || _387;
        float _391 = abs(_377);
        bool _393 = _391 == 0.0;
        float _395 = abs(_377);
        bool _397 = _395 == 0.0;
        bool _399 = !_389;
        bool _401 = _397 && _399;
        bool _403 = false;
        if (_401)
        {
            bool _405 = as_type<int>(_377) >= 0;
            _403 = _405;
        }
        bool _407 = _403;
        int _409 = _407 ? (-1) : 0;
        if (_401)
        {
            int _411 = _407 ? 0 : 1078530011;
            _359 = _411;
        }
        int _413 = _359;
        int _415 = _413;
        if (_401)
        {
            int _417 = int(0x80000000) & as_type<int>(_373);
            int _419 = _413 | _417;
            _415 = _419;
        }
        int _421 = _415;
        bool _423 = !_389;
        bool _425 = _423 && _393;
        int _427 = _421;
        _361 = as_type<float>(_421);
        if (!_425)
        {
            float _429 = abs(_373);
            bool _431 = _429 != as_type<float>(0x7f800000u /* inf */);
            bool _433 = isnan(_429);
            bool _435 = _431 || _433;
            bool _437 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _439 = _435 || _437;
            float _441 = abs(_377);
            bool _443 = _441 == as_type<float>(0x7f800000u /* inf */);
            float _445 = abs(_377);
            bool _447 = _445 == as_type<float>(0x7f800000u /* inf */);
            bool _449 = !_439;
            bool _451 = _447 && _449;
            if (_451)
            {
                bool _453 = as_type<int>(_377) >= 0;
                _409 = _453 ? (-1) : 0;
            }
            int _455 = _409;
            if (_451)
            {
                _427 = 1075235812;
            }
            int _457 = _427;
            int _459 = _457;
            if (_451)
            {
                int _461 = ~_455;
                int _463 = (_461 != 0) ? _457 : 1061752795;
                _459 = _463;
            }
            int _465 = _459;
            float _467 = as_type<float>(_465);
            if (_451)
            {
                int _469 = int(0x80000000) & as_type<int>(_373);
                int _471 = _465 | _469;
                _467 = as_type<float>(_471);
            }
            float _473 = _467;
            bool _475 = !_439;
            bool _477 = _475 && _443;
            _361 = _473;
            if (!_477)
            {
                float _479 = abs(_373);
                float _481 = abs(_377);
                float _483 = precise::max(_479, _481);
                float _485 = abs(_373);
                float _487 = abs(_377);
                float _489 = precise::min(_485, _487);
                float _491 = 1.0 / _483;
                float _493 = abs(_373);
                float _495 = abs(_377);
                bool _497 = _493 > _495;
                bool _499 = as_type<int>(_377) >= 0;
                float _501 = _489 * _491;
                float _503 = _501 * _501;
                float _505 = _503 + 11.33538818359375;
                float _507 = fma(_503, _505, 28.84246826171875);
                float _509 = fma(_503, _507, 19.6966705322265625);
                float _511 = fma(_503, -0.82336294651031494140625, -5.674867153167724609375);
                float _513 = fma(_503, _511, -6.565555095672607421875);
                float _515 = 1.0 / _509;
                float _517 = _503 * _513;
                float _519 = abs(_373);
                float _521 = abs(_377);
                float _523 = _519 + _521;
                int _525 = as_type<int>(_373) & int(0x80000000);
                float _527 = _501 * _517;
                bool _529 = _523 > as_type<float>(0x7f800000u /* inf */);
                bool _531 = isnan(_523);
                bool _533 = _529 || _531;
                bool _535 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _537 = _533 || _535;
                float _539 = fma(_527, _515, _501);
                float _541 = _539;
                _361 = _523;
                _322 = _513;
                if (_497)
                {
                    float _543 = -_539;
                    float _545 = _543 + 1.57079637050628662109375;
                    _541 = _545;
                }
                float _547 = _541;
                int _549 = as_type<int>(_547);
                if (!_499)
                {
                    float _551 = -_547;
                    float _553 = _551 + 3.1415927410125732421875;
                    _549 = as_type<int>(_553);
                }
                int _555 = _549;
                if (!_537)
                {
                    int _557 = _525 | _555;
                    _361 = as_type<float>(_557);
                }
            }
        }
    }
    float _559 = _361;
    float _561 = _322;
    float _563 = abs(_248);
    bool _565 = _563 >= 0.60000002384185791015625;
    bool _567 = !_565;
    float _569 = _561;
    float _595;
    if (!_567)
    {
        float _571 = abs(_248);
        float _573 = _571 * 2.8853900432586669921875;
        float _575 = abs(_248);
        bool _577 = _575 >= 9.010913848876953125;
        float _579 = exp2(_573);
        float _581 = _579 + 1.0;
        float _583 = 1.0 / _581;
        float _585 = fma(_583, -2.0, 1.0);
        bool _587 = !_577;
        int _589 = _587 ? as_type<int>(_585) : 1065353216;
        int _591 = int(0x80000000) & as_type<int>(_248);
        int _593 = _589 | _591;
        _595 = as_type<float>(_593);
        _597 = true;
    }
    else
    {
        float _599 = fma(_254, 0.0157396830618381500244140625, -0.052303962409496307373046875);
        float _601 = fma(_254, _599, 0.13315297663211822509765625);
        float _603 = fma(_254, _601, -0.3333276808261871337890625);
        float _605 = fma(_254, _603, 0.0);
        float _607 = fma(_248, _605, _248);
        _595 = _607;
    }
    _597 = false;
    float _609 = _595;
    float _611 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[0].x;
    bool _613 = _210 > (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _615 = _254 * _254;
    float _617 = -(*spvDescriptorSet0.cp_c3)._m0[2].x;
    float _619 = _559 + _617;
    float _621 = _206 * _206;
    if (_613)
    {
        _569 = 0.14780835807323455810546875;
    }
    float _623 = _569;
    float _625 = _210 * _611;
    float _627 = _613 ? 0.0900000035762786865234375 : 0.070000000298023223876953125;
    float _629 = abs(_625);
    float _631 = log2(_629);
    float _633 = _627 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _635 = _615 * (-1.8033688068389892578125);
    float _637 = _619 * 0.5;
    float _639 = (*spvDescriptorSet0.cp_c3)._m0[1].w * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _641 = _637 * 0.15915493667125701904296875;
    float _643 = 1.0 / _633;
    float _645 = _639;
    float _647 = _637;
    if (_613)
    {
        float _649 = -_623;
        float _651 = fma(_639, _649, -0.63349997997283935546875);
        _645 = _651;
    }
    float _653 = _645;
    float _655 = _631;
    if (_613)
    {
        float _657 = _653 * _631;
        _647 = _657;
    }
    float _659 = _647;
    float _661 = -(*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _663 = _210 + _661;
    int _665 = as_type<int>(_58) * 1664525;
    if (!_613)
    {
        float _667 = _631 * 4.059999942779541015625;
        _655 = _667;
    }
    float _669 = _655;
    float _671 = _641 * 6.283185482025146484375;
    float _673 = cos(_671);
    int _675 = _665 + 1040536623;
    float _677 = _663 * _643;
    int _679 = _62 * 1664525;
    int _681 = _679 + 1013904223;
    int _683 = _665 + 1013904223;
    int _685 = _68 * 1664525;
    int _687 = _685 + 1013904223;
    float _689 = _659;
    if (_613)
    {
        float _691 = exp2(_659);
        _689 = _691;
    }
    float _693 = _689;
    float _695 = _677 * _677;
    int _697 = _687 * _675;
    int _699 = _697 + _681;
    float _701 = _695 * (-0.721347510814666748046875);
    float _703 = _210 * _621;
    int _705 = _683 * _699;
    int _707 = _705 + _687;
    float _709 = _669;
    if (!_613)
    {
        float _711 = exp2(_669);
        _709 = _711;
    }
    float _713 = _709;
    uint _715 = uint(int(uint(_699) >> uint(16)));
    int _717 = _699 * _707;
    int _719 = _717 + _683;
    uint _721 = uint(int(uint(_707) >> uint(16)));
    int _723 = _699 ^ int(_715);
    int _725 = _707 * _719;
    int _727 = _725 + _675;
    float _729 = exp2(_701);
    int _731 = _707 ^ int(_721);
    float _733 = as_type<float>(_721);
    if (_613)
    {
        float _735 = _693 * 9.770000457763671875;
        _733 = _735;
    }
    float _737 = _733;
    uint _739 = uint(int(uint(_719) >> uint(16)));
    float _741 = _609 * 16.0;
    uint _743 = uint(int(uint(_727) >> uint(16)));
    int _745 = _719 ^ int(_739);
    float _747 = _737;
    float _749 = as_type<float>(_745);
    if (!_613)
    {
        float _751 = _713 * 6.969999790191650390625;
        _747 = _751;
    }
    float _753 = _747;
    int _755 = _727 ^ int(_743);
    float _757 = abs(_673);
    float _759 = log2(_757);
    int _761 = _731 * _755;
    int _763 = _761 + _723;
    float _765 = _729 * 1.722465991973876953125;
    float _767 = (*spvDescriptorSet0.cp_c3)._m0[0].w * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    int _769 = _745 * _763;
    int _771 = _769 + _731;
    float _773 = float(uint(_763));
    float _775 = 1.0 / _703;
    float _777 = fma(_741, _767, _753);
    int _779 = _763 * _771;
    int _781 = _779 + _745;
    float _783 = float(uint(_771));
    float _785 = fma(_773, 2.3283064365386962890625e-10, 9.9999997473787516355514526367188e-06);
    bool _787 = _777 >= 5.0;
    bool _789 = isnan(_777);
    bool _791 = _787 || _789;
    bool _793 = isnan(5.0);
    bool _795 = _791 || _793;
    float _797 = _777 * _759;
    float _799 = _797 * 2.0;
    float _801 = fma(_783, 2.3283064365386962890625e-10, 9.9999997473787516355514526367188e-06);
    float _803 = float(uint(_781));
    float _805 = log2(_785);
    int _807 = _771 * _781;
    int _809 = _807 + _755;
    float _811 = _803 * 1.4629181199765639576071407645941e-09;
    float _813 = float(uint(_809));
    float _815 = log2(_801);
    float _817 = _811 * 0.15915493667125701904296875;
    float _819 = as_type<float>(_755);
    float _821 = _817;
    if (!_795)
    {
        _749 = 0.000563999987207353115081787109375;
    }
    float _823 = _749;
    float _825 = _813 * 1.4629181199765639576071407645941e-09;
    float _827 = _823;
    if (_795)
    {
        _819 = 4.8000000418824129155836999416351e-08;
    }
    float _829 = _819;
    float _831 = _825 * 0.15915493667125701904296875;
    float _833 = _805 * 0.693147182464599609375;
    float _835 = exp2(_799);
    if (!_795)
    {
        float _837 = -_823;
        float _839 = fma(_777, _837, 0.0077599999494850635528564453125);
        _827 = _839;
    }
    float _841 = _827;
    float _843 = (*spvDescriptorSet0.cp_c3)._m0[0].y * 96.23610687255859375;
    float _845 = _777 * _777;
    float _847 = exp2(_635);
    float _849 = _815 * 0.693147182464599609375;
    float _851 = _777 * _845;
    float _853 = _815;
    float _855 = _845;
    if (!_795)
    {
        float _857 = _845 * 0.0439999997615814208984375;
        _853 = _857;
    }
    float _859 = _853;
    float _861 = _859;
    if (_795)
    {
        float _863 = _845 * 0.0009529999806545674800872802734375;
        _855 = _863;
    }
    float _865 = _855;
    float _867 = _843 * _775;
    float _869 = _865;
    if (!_795)
    {
        float _871 = -_859;
        float _873 = fma(_851, _841, _871);
        _861 = _873;
    }
    float _875 = _861;
    float _877 = _817 * 6.283185482025146484375;
    float _879 = cos(_877);
    float _881 = _875;
    if (!_795)
    {
        float _883 = fma(_777, 0.1920000016689300537109375, _875);
        _881 = _883;
    }
    float _885 = _881;
    float _887 = -_849;
    float _889 = sqrt(_887);
    if (_795)
    {
        float _891 = -_829;
        float _893 = fma(_777, _891, 1.0699999620555900037288665771484e-05);
        _821 = _893;
    }
    float _895 = _821;
    float _897 = _847 * _867;
    float _899 = _847;
    if (!_795)
    {
        float _901 = _885 + 0.16300000250339508056640625;
        _899 = _901;
    }
    float _903 = _899;
    float _905 = _903;
    if (_795)
    {
        float _907 = -_865;
        float _909 = fma(_851, _895, _907);
        _869 = _909;
    }
    float _911 = _869;
    float _913 = exp2(_765);
    float _915 = _911;
    if (_795)
    {
        float _917 = fma(_777, 0.05900000035762786865234375, _911);
        _915 = _917;
    }
    float _919 = _915;
    if (_795)
    {
        float _921 = _919 + 0.39300000667572021484375;
        _905 = _921;
    }
    float _923 = _905;
    float _925 = -_833;
    float _927 = sqrt(_925);
    float _929 = _889 * 0.23000000417232513427734375;
    float _931 = fma(_835, _923, -0.15915493667125701904296875);
    float _933 = _831 * 6.283185482025146484375;
    float _935 = cos(_933);
    float _937 = _897 * _913;
    float _939 = _318 * _937;
    float _941 = _927 * 0.23000000417232513427734375;
    float _943 = _941 * _879;
    float _945 = _929 * _935;
    float _947 = fma(_931, (*spvDescriptorSet0.cp_c3)._m0[0].z, 0.15915493667125701904296875);
    bool _949 = !_150;
    float _975;
    if (!_949)
    {
        float _951 = abs(_144);
        float _953 = _951 * 2.8853900432586669921875;
        float _955 = abs(_144);
        bool _957 = _955 >= 9.010913848876953125;
        float _959 = exp2(_953);
        float _961 = _959 + 1.0;
        float _963 = 1.0 / _961;
        float _965 = fma(_963, -2.0, 1.0);
        bool _967 = !_957;
        int _969 = _967 ? as_type<int>(_965) : 1065353216;
        int _971 = int(0x80000000) & as_type<int>(_144);
        int _973 = _969 | _971;
        _975 = as_type<float>(_973);
        _977 = true;
    }
    else
    {
        float _979 = _144 * _144;
        float _981 = fma(_979, 0.0157396830618381500244140625, -0.052303962409496307373046875);
        float _983 = fma(_979, _981, 0.13315297663211822509765625);
        float _985 = fma(_979, _983, -0.3333276808261871337890625);
        float _987 = fma(_979, _985, 0.0);
        float _989 = fma(_144, _987, _144);
        _975 = _989;
    }
    _977 = false;
    float _991 = _975;
    float _993 = _144 * 1.44269502162933349609375;
    float _995 = _144 * (-1.44269502162933349609375);
    float _997 = _146 * _991;
    float _999 = _110 * _110;
    float _1001 = exp2(_995);
    float _1003 = exp2(_993);
    float _1005 = sqrt(_997);
    float _1007 = _1003 + _1001;
    float _1009 = _939 * _947;
    float _1011 = _1009 * 2.0;
    float _1013 = 1.0 / _1007;
    float _1015 = _112 * _1005;
    float _1017 = 1.0 / _1015;
    float _1019 = _1013 * 2.0;
    float _1021 = _1019 * _1019;
    float _1023 = fma(_144, _1021, _991);
    float _1025 = _1023 * 9.81000041961669921875;
    float _1027 = _1025 * _1017;
    float _1029 = abs(_1027);
    float _1031 = _1011 * _1029;
    float _1033 = _1031 * _999;
    float _1035 = sqrt(_1033);
    float _1037 = _1035 * (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _1039 = _943 * _1037;
    float _1041 = _945 * _1037;
    float _1043 = -_140;
    float _1045 = fma(_122, _1039, _1043);
    float _1047 = -_142;
    float _1049 = fma(_122, _1041, _1047);
    float _1051 = fma(_1045, (*spvDescriptorSet0.cp_c4)._m0[0].x, _140);
    float _1053 = fma(_1049, (*spvDescriptorSet0.cp_c4)._m0[0].x, _142);
    int3 _2545 = int3(_62, _68, as_type<int>(_58));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1051, _1053, 0.0, 0.0), uint2(_2545.xy), uint(_2545.z));
}

