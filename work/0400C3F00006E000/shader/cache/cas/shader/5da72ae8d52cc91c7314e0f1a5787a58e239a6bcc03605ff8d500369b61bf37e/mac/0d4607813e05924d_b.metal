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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    constant _16* fp_c5 [[id(3)]];
    constant _16* fp_c6 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_16 [[id(7)]];
    sampler fp_t_tcb_16Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_18 [[id(11)]];
    sampler fp_t_tcb_18Smplr [[id(12)]];
    texture3d<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    texture3d<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_12 [[id(19)]];
    sampler fp_t_tcb_12Smplr [[id(20)]];
    texture2d<float> fp_t_tcb_C [[id(21)]];
    sampler fp_t_tcb_CSmplr [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    sampler fp_t_tcb_ASmplr_w [[id(25)]];
    sampler fp_t_tcb_18Smplr_w [[id(26)]];
    sampler fp_t_tcb_10Smplr_w [[id(27)]];
    sampler fp_t_tcb_ESmplr_w [[id(28)]];
    sampler fp_t_tcb_14Smplr_w [[id(29)]];
    sampler fp_t_tcb_12Smplr_w [[id(30)]];
    sampler fp_t_tcb_CSmplr_w [[id(31)]];
    constant dm_border_t* dm_border [[id(32)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_59.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_59.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_59.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _71;
    float _93 = _91 * _77;
    float _95 = _91 * _83;
    float _97 = _91 * _89;
    float _99 = _93 * _93;
    float _101 = fma(_95, _95, _99);
    float _103 = (*spvDescriptorSet0.fp_c4)._m0[5].w + (-220.0);
    float _105 = fma(_97, _97, _101);
    float _107 = precise::max(0.0, _103);
    float _109 = rsqrt(_105);
    float _111 = _95 * _109;
    float _113 = _97 * _109;
    float _115 = _93 * _109;
    float _117 = _111 * (*spvDescriptorSet0.fp_c4)._m0[7].w;
    float _119 = _113 * (*spvDescriptorSet0.fp_c4)._m0[7].w;
    float _121 = -_115;
    float _123 = -_107;
    float _125 = fma(_121, (*spvDescriptorSet0.fp_c4)._m0[7].w, _123);
    float _127 = _117 * _117;
    float _129 = _119 * _119;
    float _131 = _127 + _129;
    float _133 = sqrt(_131);
    bool _137 = _133 > (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _139 = _107;
    float _141 = _109;
    float _143 = _125;
    float _145 = _127;
    float _147 = _117;
    float _149 = _111;
    float _151 = _115;
    int _154 = as_type<int>(_111);
    int _156 = as_type<int>(_113);
    int _158 = as_type<int>(_115);
    if (!_137)
    {
        _139 = _129;
    }
    float _160 = _139;
    float _162 = _160;
    if (!_137)
    {
        _141 = _119;
    }
    float _164 = _141;
    bool _166 = !_137;
    float _168 = _164;
    if (!_166)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _172 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _174 = _133 + _172;
        float _176 = rsqrt(_131);
        float _178 = _174 * _170;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _125 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _184 = _180 * 6.283185482025146484375;
        float _186 = sin(_184);
        float _188 = _180 * 6.283185482025146484375;
        float _190 = cos(_188);
        float _192 = fma(_186, _182, (*spvDescriptorSet0.fp_c3)._m0[5].x);
        float _194 = _176 * _192;
        float _196 = _190 + (-1.0);
        float _198 = _117 * _194;
        float _200 = _196 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _202 = _119 * _194;
        float _204 = fma(_125, _190, _200);
        float _206 = _198 * _198;
        float _208 = _202 * _202;
        _143 = _204;
        _145 = _206;
        _162 = _208;
        _147 = _198;
        _168 = _202;
    }
    float _210 = _143;
    float _212 = _145;
    float _214 = _162;
    float _216 = _147;
    float _218 = _168;
    float _220 = fma(_210, _210, _212);
    float _222 = _220 + _214;
    float _224 = rsqrt(_222);
    float _226 = _224 * _210;
    float _228 = _224 * _216;
    float _230 = _224 * _218;
    float _232 = _226 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _234 = -_232;
    float _236 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].x, _234);
    float _238 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[1].z, _236);
    float _240 = fma(_238, -0.5, 0.5);
    float _242 = fma(_238, 0.5, 0.5);
    float _244 = fma(_242, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _246 = sqrt(_240);
    float _248 = fma(_242, _244, -0.212114393711090087890625);
    float _250 = fma(_242, _248, 1.570728778839111328125);
    float _252 = fma(_226, -0.5, 0.5);
    float _254 = _246 * 0.636619746685028076171875;
    float _256 = -_250;
    float _258 = fma(_254, _256, 1.0);
    float2 _1901 = float2(_258, _252);
    float4 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1901, float2(0.0), isnan(_1901))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1901, float2(0.0), isnan(_1901))).xyzw;
    float _263 = _261.x;
    float _265 = _261.y;
    float _267 = _261.z;
    float _269 = _261.w;
    bool _271 = _226 > 0.0;
    float _273 = abs(_115);
    bool _275 = _273 > 9.9999997473787516355514526367188e-05;
    bool _277 = _275 && _271;
    float _279 = _269 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _285 = _263 + _283;
    float _287 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _289 = _265 + _287;
    float _291 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _293 = _267 + _291;
    float _295 = fma(_281, _285, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _297 = fma(_281, _289, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _299 = fma(_281, _293, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    bool _301 = !_277;
    int _303 = as_type<int>(_295);
    int _305 = as_type<int>(_297);
    int _307 = as_type<int>(_299);
    if (!_301)
    {
        float _309 = 1.0 / _115;
        float _311 = -(*spvDescriptorSet0.fp_c5)._m0[0].y;
        float _313 = _311 + 220.0;
        float _315 = _313 * _309;
        float _317 = fma(_113, _315, (*spvDescriptorSet0.fp_c5)._m0[0].z);
        float _319 = fma(_111, _315, (*spvDescriptorSet0.fp_c5)._m0[0].x);
        float _321 = -(*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _323 = _317 + _321;
        float _325 = -(*spvDescriptorSet0.fp_c5)._m0[0].x;
        float _327 = _319 + _325;
        float _329 = _323 * _323;
        float _331 = fma(_327, _327, _329);
        float _333 = sqrt(_331);
        bool _335 = _333 > (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _337 = _333;
        float _339 = _317;
        float _341 = _319;
        if (!_335)
        {
            _337 = 220.0;
        }
        float _343 = _337;
        bool _345 = !_335;
        float _347 = _343;
        if (!_345)
        {
            float _349 = rsqrt(_331);
            float _351 = (*spvDescriptorSet0.fp_c5)._m0[0].y + (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _353 = _351 * _351;
            float _355 = _115 * _351;
            float _357 = _349 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _359 = fma(_327, _357, (*spvDescriptorSet0.fp_c5)._m0[0].x);
            float _361 = fma(_323, _357, (*spvDescriptorSet0.fp_c5)._m0[0].z);
            float _363 = -_359;
            float _365 = _363 + (*spvDescriptorSet0.fp_c5)._m0[0].x;
            float _367 = -_361;
            float _369 = _367 + (*spvDescriptorSet0.fp_c5)._m0[0].z;
            float _371 = fma(_365, _365, _353);
            float _373 = fma(_111, _365, _355);
            float _375 = 220.0 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _377 = fma(_369, _369, _371);
            float _379 = fma(_113, _369, _373);
            float _381 = -_375;
            float _383 = fma(_381, _375, _377);
            float _385 = _379 * 2.0;
            float _387 = _383 * 4.0;
            float _389 = -_387;
            float _391 = fma(_385, _385, _389);
            float _393 = precise::max(0.0, _391);
            float _395 = sqrt(_393);
            float _397 = -_385;
            float _399 = -_395;
            float _401 = _397 + _399;
            float _403 = _401 * 0.5;
            float _405 = fma(_111, _403, (*spvDescriptorSet0.fp_c5)._m0[0].x);
            float _407 = fma(_115, _403, (*spvDescriptorSet0.fp_c5)._m0[0].y);
            float _409 = fma(_113, _403, (*spvDescriptorSet0.fp_c5)._m0[0].z);
            _339 = _409;
            _341 = _405;
            _347 = _407;
        }
        float _411 = _339;
        float _413 = _341;
        float _415 = _347;
        float _417 = -(*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _419 = _411 + _417;
        float _421 = -(*spvDescriptorSet0.fp_c5)._m0[0].x;
        float _423 = _413 + _421;
        float _425 = _419 * _419;
        float _427 = fma(_423, _423, _425);
        float _429 = sqrt(_427);
        bool _431 = _429 > (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _433 = _413;
        if (!_431)
        {
            _149 = _411;
        }
        float _435 = _149;
        float _437 = _435;
        if (!_431)
        {
            _151 = _415;
        }
        float _439 = _151;
        bool _441 = !_431;
        float _443 = _439;
        if (!_441)
        {
            float _445 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _447 = _429 + _445;
            float _449 = _415 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _451 = rsqrt(_427);
            float _453 = -_415;
            float _455 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _457 = _453 + _455;
            float _459 = abs(_447);
            float _461 = abs(_449);
            float _463 = precise::max(_459, _461);
            float _465 = _457 * _457;
            bool _467 = _463 >= 16.0;
            float _469 = _423 * _451;
            float _471 = _419 * _451;
            float _473 = -_423;
            float _475 = fma(_469, (*spvDescriptorSet0.fp_c3)._m0[5].x, _473);
            float _477 = -_419;
            float _479 = fma(_471, (*spvDescriptorSet0.fp_c3)._m0[5].x, _477);
            float _481 = _447;
            float _483 = _449;
            float _485 = _475;
            if (_467)
            {
                float _487 = _447 * 0.0625;
                _481 = _487;
            }
            float _489 = _481;
            if (_467)
            {
                float _491 = _449 * 0.0625;
                _483 = _491;
            }
            float _493 = _483;
            float _495 = fma(_475, _475, _465);
            float _497 = abs(_489);
            bool _499 = _497 != 0.0;
            bool _501 = isnan(_497);
            bool _503 = _499 || _501;
            bool _505 = isnan(0.0);
            bool _507 = _503 || _505;
            float _509 = fma(_479, _479, _495);
            float _511 = abs(_493);
            bool _513 = _511 == 0.0;
            float _515 = abs(_493);
            bool _517 = _515 == 0.0;
            bool _519 = !_507;
            bool _521 = _517 && _519;
            float _523 = sqrt(_509);
            bool _525 = false;
            int _527 = as_type<int>(_495);
            if (_521)
            {
                bool _529 = as_type<int>(_493) >= 0;
                _525 = _529;
            }
            bool _531 = _525;
            int _533 = _531 ? (-1) : 0;
            if (_521)
            {
                int _535 = _531 ? 0 : 1078530011;
                _527 = _535;
            }
            int _537 = _527;
            int _539 = _537;
            if (_521)
            {
                int _541 = int(0x80000000) & as_type<int>(_489);
                int _543 = _537 | _541;
                _485 = as_type<float>(_543);
            }
            float _545 = _485;
            bool _547 = !_507;
            bool _549 = _547 && _513;
            float _551 = _545;
            float _553 = _545;
            if (!_549)
            {
                float _555 = abs(_489);
                bool _557 = _555 != as_type<float>(0x7f800000u /* inf */);
                bool _559 = isnan(_555);
                bool _561 = _557 || _559;
                bool _563 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _565 = _561 || _563;
                float _567 = abs(_493);
                bool _569 = _567 == as_type<float>(0x7f800000u /* inf */);
                float _571 = abs(_493);
                bool _573 = _571 == as_type<float>(0x7f800000u /* inf */);
                bool _575 = !_565;
                bool _577 = _573 && _575;
                if (_577)
                {
                    bool _579 = as_type<int>(_493) >= 0;
                    _533 = _579 ? (-1) : 0;
                }
                int _581 = _533;
                if (_577)
                {
                    _539 = 1075235812;
                }
                int _583 = _539;
                int _585 = _583;
                if (_577)
                {
                    int _587 = ~_581;
                    int _589 = (_587 != 0) ? _583 : 1061752795;
                    _585 = _589;
                }
                int _591 = _585;
                if (_577)
                {
                    int _593 = int(0x80000000) & as_type<int>(_489);
                    int _595 = _591 | _593;
                    _551 = as_type<float>(_595);
                }
                float _597 = _551;
                bool _599 = !_565;
                bool _601 = _599 && _569;
                _553 = _597;
                if (!_601)
                {
                    float _603 = abs(_489);
                    float _605 = abs(_493);
                    float _607 = precise::max(_603, _605);
                    float _609 = abs(_489);
                    float _611 = abs(_493);
                    float _613 = precise::min(_609, _611);
                    float _615 = 1.0 / _607;
                    float _617 = abs(_489);
                    float _619 = abs(_493);
                    bool _621 = _617 > _619;
                    bool _623 = as_type<int>(_493) >= 0;
                    float _625 = abs(_489);
                    float _627 = abs(_493);
                    float _629 = _625 + _627;
                    int _631 = as_type<int>(_489) & int(0x80000000);
                    bool _633 = _629 > as_type<float>(0x7f800000u /* inf */);
                    bool _635 = isnan(_629);
                    bool _637 = _633 || _635;
                    bool _639 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _641 = _637 || _639;
                    float _643 = _613 * _615;
                    float _645 = _643 * _643;
                    float _647 = _645 + 11.33538818359375;
                    float _649 = fma(_645, _647, 28.84246826171875);
                    float _651 = fma(_645, _649, 19.6966705322265625);
                    float _653 = fma(_645, -0.82336294651031494140625, -5.674867153167724609375);
                    float _655 = fma(_645, _653, -6.565555095672607421875);
                    float _657 = 1.0 / _651;
                    float _659 = _645 * _655;
                    float _661 = _643 * _659;
                    float _663 = fma(_661, _657, _643);
                    float _665 = _663;
                    _553 = _629;
                    if (_621)
                    {
                        float _667 = -_663;
                        float _669 = _667 + 1.57079637050628662109375;
                        _665 = _669;
                    }
                    float _671 = _665;
                    int _673 = as_type<int>(_671);
                    if (!_623)
                    {
                        float _675 = -_671;
                        float _677 = _675 + 3.1415927410125732421875;
                        _673 = as_type<int>(_677);
                    }
                    int _679 = _673;
                    if (!_641)
                    {
                        int _681 = _631 | _679;
                        _553 = as_type<float>(_681);
                    }
                }
            }
            float _683 = _553;
            float _685 = fma(_683, (*spvDescriptorSet0.fp_c3)._m0[5].y, (*spvDescriptorSet0.fp_c3)._m0[5].x);
            float _687 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _689 = _523 + _687;
            float _691 = fma(_469, _685, (*spvDescriptorSet0.fp_c5)._m0[0].x);
            float _693 = fma(_471, _685, (*spvDescriptorSet0.fp_c5)._m0[0].z);
            _443 = _689;
            _433 = _691;
            _437 = _693;
        }
        float _695 = _443;
        float _697 = _433;
        float _699 = _437;
        float _701 = -(*spvDescriptorSet0.fp_c5)._m0[0].y;
        float _703 = _695 + _701;
        float _705 = -(*spvDescriptorSet0.fp_c5)._m0[0].x;
        float _707 = _697 + _705;
        float _709 = -(*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _711 = _699 + _709;
        int _713 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[16].z) << 4;
        float _715 = _703 * _703;
        int _717 = _713 + 76;
        uint _720 = uint(int(uint(_717) >> uint(2)));
        uint _722 = uint(int(uint(int(_720)) >> uint(2)));
        int _724 = int(_720) & 3;
        float _726 = (*spvDescriptorSet0.fp_c7)._m0[int(_722)][_724];
        float _728 = fma(_707, _707, _715);
        float _730 = -(*spvDescriptorSet0.fp_c7)._m0[18].z;
        float _732 = _697 + _730;
        float _734 = fma(_711, _711, _728);
        float _736 = -(*spvDescriptorSet0.fp_c7)._m0[18].w;
        float _738 = _699 + _736;
        uint _740 = uint(int(uint(_713) >> uint(2)));
        uint _742 = uint(int(uint(int(_740)) >> uint(2)));
        int _744 = int(_740) & 3;
        float _746 = (*spvDescriptorSet0.fp_c7)._m0[int(_742)][_744];
        float _748 = sqrt(_734);
        float _750 = abs(_732);
        float _752 = abs(_738);
        float _754 = precise::max(_750, _752);
        float _756 = _726 + 8.0;
        float _758 = _756 + _754;
        float _760 = spvFAdd(_748, 9.9999997473787516355514526367188e-06);
        float _762 = _758 * _746;
        float _764 = _762 * 4.0;
        float _766 = 1.0 / _760;
        float _768 = precise::max(_764, 1.0);
        float _770 = log2(_768);
        float _772 = _703 * _766;
        float _774 = _707 * _766;
        float _776 = _711 * _766;
        float _778 = _772 + (*spvDescriptorSet0.fp_c5)._m0[3].y;
        float _780 = _774 + (*spvDescriptorSet0.fp_c5)._m0[3].x;
        float _782 = _776 + (*spvDescriptorSet0.fp_c5)._m0[3].z;
        bool _784 = _770 >= 5.0;
        bool _786 = isnan(_770);
        bool _788 = _784 || _786;
        bool _790 = isnan(5.0);
        bool _792 = _788 || _790;
        float _794 = _778 * _778;
        float _796 = fma(_780, _780, _794);
        float _798 = fma(_782, _782, _796);
        float _800 = _794;
        float _802 = _796;
        if (_792)
        {
            _800 = 0.0;
            _802 = 0.0;
        }
        float _804 = _800;
        float _806 = _802;
        float _808 = _804;
        float _810 = _806;
        if (!_792)
        {
            float _812 = trunc(_770);
            int _814 = int(_812);
            float _816 = -(*spvDescriptorSet0.fp_c7)._m0[16].y;
            float _818 = _699 + _816;
            float _820 = -(*spvDescriptorSet0.fp_c7)._m0[16].x;
            float _822 = _697 + _820;
            float _824 = floor(_770);
            int _826 = min(_814, 4);
            int _828 = _826 + as_type<int>((*spvDescriptorSet0.fp_c7)._m0[16].z);
            int _830 = _828 << 4;
            float _832 = _824 + 1.0;
            float _834 = rint(_824);
            float _836 = precise::max(_834, 0.0);
            uint _838 = uint(_836);
            uint _840 = clamp(_838, 0u, 65535u);
            uint _842 = uint(int(uint(_830) >> uint(2)));
            uint _844 = uint(int(uint(int(_842)) >> uint(2)));
            int _846 = int(_842) & 3;
            float _848 = (*spvDescriptorSet0.fp_c7)._m0[int(_844)][_846];
            float _850 = rint(_832);
            float _852 = precise::max(_850, 0.0);
            uint _854 = uint(_852);
            uint _856 = clamp(_854, 0u, 65535u);
            int _858 = _830 + 16;
            uint _860 = uint(int(uint(_858) >> uint(2)));
            uint _862 = uint(int(uint(int(_860)) >> uint(2)));
            int _864 = int(_860) & 3;
            float _866 = (*spvDescriptorSet0.fp_c7)._m0[int(_862)][_864];
            float _868 = fma(_818, _848, 0.5);
            float _870 = fma(_822, _848, 0.5);
            float _872 = fma(_818, _866, 0.5);
            float _874 = fma(_822, _866, 0.5);
            float3 _2834 = float3(_870, _868, float(int(_840)));
            float3 _2838 = select(_2834, float3(0.0), isnan(_2834));
            float2 _878 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, _2838.xy, uint(rint(_2838.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, _2838.xy, uint(rint(_2838.z))).xy;
            float _880 = _878.x;
            float _882 = _878.y;
            float3 _2851 = float3(_874, _872, float(int(_856)));
            float3 _2853 = select(_2851, float3(0.0), isnan(_2851));
            float2 _884 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, _2853.xy, uint(rint(_2853.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, _2853.xy, uint(rint(_2853.z))).xy;
            float _886 = _884.x;
            float _888 = _884.y;
            bool _890 = _770 >= 4.0;
            bool _892 = isnan(_770);
            bool _894 = _890 || _892;
            bool _896 = isnan(4.0);
            bool _898 = _894 || _896;
            _808 = _880;
            _810 = _882;
            if (!_898)
            {
                float _900 = -_824;
                float _902 = _770 + _900;
                float _904 = -_880;
                float _906 = _904 + _886;
                float _908 = fma(_902, 5.42372894287109375, -4.338983058929443359375);
                float _910 = precise::clamp(_908, 0.0, 1.0);
                float _912 = -_882;
                float _914 = _912 + _888;
                float _916 = fma(_910, _906, _880);
                float _918 = fma(_910, _914, _882);
                _808 = _916;
                _810 = _918;
            }
        }
        float _920 = _808;
        float _922 = _810;
        float _924 = fma(_920, _920, 1.0);
        float _926 = rsqrt(_798);
        float _928 = -(*spvDescriptorSet0.fp_c5)._m0[0].y;
        float _930 = _415 + _928;
        float _932 = fma(_922, _922, _924);
        float _934 = _930 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
        float _936 = rsqrt(_932);
        float _938 = fma(_423, (*spvDescriptorSet0.fp_c4)._m0[4].z, _934);
        float _940 = _748 + (-250.0);
        float _942 = (*spvDescriptorSet0.fp_c5)._m0[12].z + (-1.0);
        float _944 = fma(_419, (*spvDescriptorSet0.fp_c4)._m0[6].z, _938);
        float _946 = precise::max(0.0, _940);
        float _948 = _778 * _926;
        float _950 = _780 * _926;
        float _952 = _782 * _926;
        float _954 = _944 * (*spvDescriptorSet0.fp_c5)._m0[12].y;
        float _956 = _948 * (*spvDescriptorSet0.fp_c5)._m0[3].y;
        float _958 = _946 * 0.001000000047497451305389404296875;
        float _960 = precise::clamp(_958, 0.0, 1.0);
        float _962 = -_954;
        float _964 = fma(_962, _942, 1.0);
        float _966 = _936 * _920;
        float _968 = fma(_950, (*spvDescriptorSet0.fp_c5)._m0[3].x, _956);
        float _970 = _936 * _922;
        float _972 = _774 * _966;
        float _974 = _950 * _966;
        float _976 = fma(_960, 0.20000000298023223876953125, 0.00999999977648258209228515625);
        float _978 = fma(_952, (*spvDescriptorSet0.fp_c5)._m0[3].z, _968);
        float _980 = precise::clamp(_978, 0.0, 1.0);
        float _982 = -_772;
        float _984 = -_972;
        float _986 = fma(_982, _936, _984);
        float _988 = -_948;
        float _990 = -_974;
        float _992 = fma(_988, _936, _990);
        float _994 = fma(_772, _936, _972);
        float _996 = fma(_960, -0.20000000298023223876953125, 0.9900000095367431640625);
        float _998 = -_776;
        float _1000 = fma(_998, _970, _986);
        float _1002 = precise::clamp(_1000, 0.0, 1.0);
        float _1004 = -_952;
        float _1006 = fma(_1004, _970, _992);
        float _1008 = precise::clamp(_1006, 0.0, 1.0);
        float _1010 = fma(_776, _970, _994);
        float _1012 = _1002 * (-9.27999973297119140625);
        float _1014 = _1010 * _1010;
        float _1016 = fma(_976, 0.02199999988079071044921875, -0.039999999105930328369140625);
        float _1018 = fma(_976, 0.5, 0.5);
        float _1020 = exp2(_1012);
        float _1022 = fma(_1014, 0.565323054790496826171875, 0.434676945209503173828125);
        float _1024 = fma(_976, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
        float _1026 = fma(_976, -0.572000026702880859375, 1.03999996185302734375);
        float _1028 = fma(_976, _976, 0.00999999977648258209228515625);
        float _1030 = precise::clamp(_1028, 0.0, 1.0);
        float _1032 = _966 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
        float _1034 = _996 * _996;
        float _1036 = _1018 * _1018;
        float _1038 = _1036 * 0.5;
        float _1040 = _1030 * _1030;
        float _1042 = -_936;
        float _1044 = -_1032;
        float _1046 = fma(_1042, (*spvDescriptorSet0.fp_c5)._m0[3].y, _1044);
        float _1048 = sqrt(_1022);
        float _1050 = -_1038;
        float _1052 = _1050 + 1.0;
        float _1054 = -_980;
        float _1056 = _1054 + 1.0;
        float _1058 = -_970;
        float _1060 = fma(_1058, (*spvDescriptorSet0.fp_c5)._m0[3].z, _1046);
        float _1062 = precise::clamp(_1060, 0.0, 1.0);
        float _1064 = _1040 + (-1.0);
        float _1066 = _1008 * _1008;
        float _1068 = precise::min(_1034, _1020);
        float _1070 = fma(_1002, _1052, _1038);
        float _1072 = fma(_1062, _1052, _1038);
        float _1074 = _1056 * _1056;
        float _1076 = fma(_996, _1068, _1024);
        float _1078 = fma(_1066, _1064, 1.0);
        float _1080 = _1070 * _1072;
        float _1082 = _1074 * _1074;
        float _1084 = _774 * 0.75187969207763671875;
        float _1086 = (*spvDescriptorSet0.fp_c5)._m0[8].x * 0.88622701168060302734375;
        float _1088 = _936 * 1.02332699298858642578125;
        float _1090 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c5)._m0[9].x;
        float _1092 = _1056 * _1082;
        float _1094 = fma(_1010, 0.75187969207763671875, _1048);
        float _1096 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c5)._m0[9].y;
        float _1098 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c5)._m0[9].z;
        float _1100 = _970 * 1.02332699298858642578125;
        float _1102 = fma(_1088, (*spvDescriptorSet0.fp_c5)._m0[8].y, _1086);
        float _1104 = fma(_1088, (*spvDescriptorSet0.fp_c5)._m0[9].w, _1090);
        float _1106 = _966 * 1.02332699298858642578125;
        float _1108 = -_1084;
        float _1110 = fma(_966, _1094, _1108);
        float _1112 = fma(_1100, (*spvDescriptorSet0.fp_c5)._m0[8].z, _1102);
        float _1114 = fma(_1100, (*spvDescriptorSet0.fp_c5)._m0[10].z, _1104);
        float _1116 = fma(_1088, (*spvDescriptorSet0.fp_c5)._m0[10].x, _1096);
        float _1118 = fma(_1088, (*spvDescriptorSet0.fp_c5)._m0[10].y, _1098);
        float _1120 = fma(_1106, (*spvDescriptorSet0.fp_c5)._m0[8].w, _1112);
        float _1122 = fma(_1106, (*spvDescriptorSet0.fp_c5)._m0[11].y, _1114);
        float _1124 = fma(_1100, (*spvDescriptorSet0.fp_c5)._m0[10].w, _1116);
        float _1126 = fma(_1100, (*spvDescriptorSet0.fp_c5)._m0[11].x, _1118);
        float _1128 = _1120 * 0.31830990314483642578125;
        float _1130 = precise::clamp(_1128, 0.0, 1.0);
        float _1132 = _776 * 0.75187969207763671875;
        float _1134 = precise::max(0.0, _1122);
        float _1136 = fma(_1106, (*spvDescriptorSet0.fp_c5)._m0[11].z, _1124);
        float _1138 = _772 * 0.75187969207763671875;
        float _1140 = _1130 * 0.88622701168060302734375;
        float _1142 = fma(_1106, (*spvDescriptorSet0.fp_c5)._m0[11].w, _1126);
        float _1144 = -_1132;
        float _1146 = fma(_970, _1094, _1144);
        float _1148 = _1134 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
        float _1150 = -_1138;
        float _1152 = fma(_936, _1094, _1150);
        float _1154 = -_1130;
        float _1156 = _1154 + 1.0;
        float _1158 = _1140 * (*spvDescriptorSet0.fp_c5)._m0[7].x;
        float _1160 = fma(_936, 0.5, 0.5);
        float _1162 = fma(_1148, _1156, _1158);
        float _1164 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
        float _1166 = _1164 + (*spvDescriptorSet0.fp_c5)._m0[5].x;
        float _1168 = precise::max(0.0, _1136);
        float _1170 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
        float _1172 = _1170 + (*spvDescriptorSet0.fp_c5)._m0[5].y;
        float _1174 = _1078 * _1078;
        float _1176 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
        float _1178 = _1176 + (*spvDescriptorSet0.fp_c5)._m0[5].z;
        float _1180 = fma(_1160, _1166, (*spvDescriptorSet0.fp_c5)._m0[6].x);
        float _1182 = fma(_1160, _1172, (*spvDescriptorSet0.fp_c5)._m0[6].y);
        float _1184 = _1140 * (*spvDescriptorSet0.fp_c5)._m0[7].y;
        float _1186 = fma(_1160, _1178, (*spvDescriptorSet0.fp_c5)._m0[6].z);
        float _1188 = in.m_61.x;
        float _1190 = gl_FragCoord.w;
        float _1192 = _1188 * _1190;
        float _1194 = in.m_61.y;
        float _1196 = gl_FragCoord.w;
        float _1198 = _1194 * _1196;
        float _1200 = _1168 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
        float _1202 = precise::max(0.0, _1142);
        float _1204 = log2(_964);
        float _1206 = _1140 * (*spvDescriptorSet0.fp_c5)._m0[7].z;
        float _1208 = fma(_1200, _1156, _1184);
        float _1210 = _1040 * 0.31830990314483642578125;
        float _1212 = _1202 * (*spvDescriptorSet0.fp_c5)._m0[2].z;
        float _1214 = fma(_1076, 1.03999996185302734375, _1016);
        float _1216 = precise::clamp(_1214, 0.0, 1.0);
        float _1218 = fma(_1182, (*spvDescriptorSet0.fp_c5)._m0[0].w, _1208);
        bool _1220 = _1022 >= 0.0;
        bool _1222 = isnan(_1022);
        bool _1224 = _1220 || _1222;
        bool _1226 = isnan(0.0);
        bool _1228 = _1224 || _1226;
        float _1230 = 1.0 / _1174;
        float _1232 = fma(_1212, _1156, _1206);
        float _1234 = fma(_1180, (*spvDescriptorSet0.fp_c5)._m0[0].w, _1162);
        float _1236 = fma(_697, 6.2500002968590706586837768554688e-05, 0.5);
        float _1238 = fma(_699, 6.2500002968590706586837768554688e-05, 0.5);
        float _1240 = fma(_1076, -1.03999996185302734375, _1026);
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        float _1244 = _1204 * 0.693147182464599609375;
        float _1246 = _1244 * (*spvDescriptorSet0.fp_c5)._m0[12].w;
        float _1248 = _1210 * _1230;
        float _1250 = _91 * _1192;
        float _1252 = _91 * _1198;
        float2 _3442 = float2(_1250, _1252);
        float2 _1254 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3442, float2(0.0), isnan(_3442))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3442, float2(0.0), isnan(_3442))).xy;
        float _1256 = _1254.x;
        float _1258 = _1254.y;
        float2 _3454 = float2(_1236, _1238);
        float4 _1260 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_3454, float2(0.0), isnan(_3454))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_3454, float2(0.0), isnan(_3454))).xyzw;
        float _1262 = _1260.x;
        float _1264 = _1260.y;
        float _1266 = _1260.z;
        float _1268 = _1260.w;
        float3 _3471 = float3(_1250, _1252, _1246);
        float _1270 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3471, float3(0.0), isnan(_3471))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3471, float3(0.0), isnan(_3471))).x;
        float3 _3480 = float3(_1250, _1252, _1246);
        float4 _1272 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3480, float3(0.0), isnan(_3480))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3480, float3(0.0), isnan(_3480))).xyzw;
        float _1274 = _1272.x;
        float _1276 = _1272.y;
        float _1278 = _1272.z;
        float _1280 = _1272.w;
        float _1282 = fma(_1186, (*spvDescriptorSet0.fp_c5)._m0[0].w, _1232);
        float _1284 = _1228 ? _1152 : (-0.0);
        float _1286 = _1062 * _1248;
        float _1288 = _1228 ? _1110 : (-0.0);
        float _1290 = -(*spvDescriptorSet0.fp_c5)._m0[13].y;
        float _1292 = fma(_748, (*spvDescriptorSet0.fp_c5)._m0[13].x, _1290);
        float _1294 = precise::clamp(_1292, 0.0, 1.0);
        float _1296 = _1228 ? _1146 : (-0.0);
        float _1298 = _1284 * (*spvDescriptorSet0.fp_c5)._m0[3].y;
        float _1300 = -_1294;
        float _1302 = _1300 + 1.0;
        float _1304 = fma(_1242, 0.02005931176245212554931640625, _1216);
        float _1306 = fma(_1288, (*spvDescriptorSet0.fp_c5)._m0[3].x, _1298);
        float _1308 = abs(_1302);
        float _1310 = log2(_1308);
        float _1312 = fma(_1296, (*spvDescriptorSet0.fp_c5)._m0[3].z, _1306);
        float _1314 = fma(_1312, -1.39999997615814208984375, 1.4900000095367431640625);
        float _1316 = _226 + 1.0;
        float _1318 = _1310 * (*spvDescriptorSet0.fp_c5)._m0[14].x;
        float _1320 = exp2(_1318);
        float _1322 = -_226;
        float _1324 = fma(_1320, _1316, _1322);
        float _1326 = fma(_1324, 0.5, 0.5);
        float _1328 = fma(_1256, 2.0, -1.0);
        float _1330 = fma(_1258, 2.0, -1.0);
        float _1332 = fma(_1328, (*spvDescriptorSet0.fp_c6)._m0[0].z, _1250);
        float _1334 = fma(_1328, (*spvDescriptorSet0.fp_c6)._m0[0].x, _1250);
        float _1336 = fma(_1330, (*spvDescriptorSet0.fp_c6)._m0[0].y, _1252);
        float _1338 = fma(_1330, (*spvDescriptorSet0.fp_c6)._m0[0].w, _1252);
        float2 _3596 = float2(_1334, _1336);
        float3 _1342 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_3596, float2(0.0), isnan(_3596))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_3596, float2(0.0), isnan(_3596))).xyz;
        float _1344 = _1342.x;
        float _1346 = _1342.y;
        float _1348 = _1342.z;
        float2 _3610 = float2(_1332, _1338);
        float4 _1350 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_3610, float2(0.0), isnan(_3610))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_3610, float2(0.0), isnan(_3610))).xyzw;
        float _1352 = _1350.x;
        float _1354 = _1350.y;
        float _1356 = _1350.z;
        float _1358 = _1350.w;
        float2 _3626 = float2(_258, _1326);
        float3 _1360 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3626, float2(0.0), isnan(_3626))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3626, float2(0.0), isnan(_3626))).xyz;
        float _1362 = _1360.x;
        float _1364 = _1360.y;
        float _1366 = _1360.z;
        float _1368 = 1.0 / _1080;
        float _1370 = _1234 * _1262;
        float _1372 = _1262 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
        float _1374 = _1282 * _1266;
        float _1376 = fma(1.02332699298858642578125, (*spvDescriptorSet0.fp_c5)._m0[8].y, _1086);
        float _1378 = fma(1.02332699298858642578125, (*spvDescriptorSet0.fp_c5)._m0[9].w, _1090);
        float _1380 = fma(1.02332699298858642578125, (*spvDescriptorSet0.fp_c5)._m0[10].x, _1096);
        float _1382 = fma(1.02332699298858642578125, (*spvDescriptorSet0.fp_c5)._m0[10].y, _1098);
        float _1384 = _1376 * 0.31830990314483642578125;
        float _1386 = precise::clamp(_1384, 0.0, 1.0);
        float _1388 = abs(_1314);
        float _1390 = log2(_1388);
        float _1392 = precise::max(0.0, _1378);
        float _1394 = _1266 * (*spvDescriptorSet0.fp_c5)._m0[4].z;
        float _1396 = _1386 * 0.88622701168060302734375;
        float _1398 = -_1386;
        float _1400 = _1398 + 1.0;
        float _1402 = precise::max(0.0, _1380);
        float _1404 = _1392 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
        float _1406 = _1396 * (*spvDescriptorSet0.fp_c5)._m0[7].x;
        float _1408 = _1396 * (*spvDescriptorSet0.fp_c5)._m0[7].z;
        float _1410 = _1286 * _1368;
        float _1412 = _1402 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
        float _1414 = fma(_1404, _1400, _1406);
        float _1416 = precise::max(0.0, _1382);
        float _1418 = _1396 * (*spvDescriptorSet0.fp_c5)._m0[7].y;
        float _1420 = _1374 * 0.079577468335628509521484375;
        float _1422 = _1390 * 1.5;
        float _1424 = _1416 * (*spvDescriptorSet0.fp_c5)._m0[2].z;
        float _1426 = fma(_1412, _1400, _1418);
        float _1428 = _1310 * (*spvDescriptorSet0.fp_c5)._m0[14].y;
        float _1430 = fma(_1424, _1400, _1408);
        float _1432 = -_1422;
        float _1434 = exp2(_1432);
        float _1436 = fma((*spvDescriptorSet0.fp_c5)._m0[0].w, (*spvDescriptorSet0.fp_c5)._m0[5].x, _1414);
        float _1438 = fma((*spvDescriptorSet0.fp_c5)._m0[0].w, (*spvDescriptorSet0.fp_c5)._m0[5].y, _1426);
        float _1440 = fma((*spvDescriptorSet0.fp_c5)._m0[0].w, (*spvDescriptorSet0.fp_c5)._m0[5].z, _1430);
        float _1442 = fma(_1092, 0.979940712451934814453125, 0.02005931176245212554931640625);
        float _1444 = _1304 * 0.31830990314483642578125;
        float _1446 = spvFAdd(_1268, 0.01600000075995922088623046875);
        float _1448 = _1442 * _1410;
        float _1450 = _1448 * 0.25;
        float _1452 = _1436 * _1444;
        float _1454 = _1440 * _1444;
        float _1456 = exp2(_1428);
        float _1458 = _1438 * _1444;
        float _1460 = fma(_1450, (*spvDescriptorSet0.fp_c5)._m0[4].x, _1452);
        float _1462 = fma(_1450, (*spvDescriptorSet0.fp_c5)._m0[4].z, _1454);
        float _1464 = spvFAdd(_1268, 0.3300000131130218505859375);
        float _1466 = fma(_1450, (*spvDescriptorSet0.fp_c5)._m0[4].y, _1458);
        float _1468 = spvFAdd(_1268, 0.04500000178813934326171875);
        float _1470 = _1434 * 0.0405845083296298980712890625;
        float _1472 = _1370 * 0.079577468335628509521484375;
        float _1474 = _1218 * _1264;
        float _1476 = 1.0 / _1464;
        float _1478 = _1264 * (*spvDescriptorSet0.fp_c5)._m0[4].y;
        float _1480 = fma(_1470, _1372, _1472);
        float _1482 = _1474 * 0.079577468335628509521484375;
        float _1484 = fma(_1470, _1394, _1420);
        float _1486 = _1268 * _1480;
        float _1488 = fma(_1470, _1478, _1482);
        float _1490 = 1.0 / _1446;
        float _1492 = -_1456;
        float _1494 = _1492 + 1.0;
        float _1496 = _1268 * _1488;
        float _1498 = _1268 * _1484;
        float _1500 = _1494 * (*spvDescriptorSet0.fp_c5)._m0[14].z;
        float _1502 = 1.0 / _1468;
        float _1504 = fma(_1486, _1476, _1460);
        float _1506 = -_1500;
        float _1508 = _1506 + 1.0;
        float _1510 = fma(_1498, _1490, _1462);
        float _1512 = fma(_1496, _1502, _1466);
        float _1514 = _1358 * _1280;
        float _1516 = _1346 + _1276;
        float _1518 = _1344 + _1274;
        float _1520 = _1348 + _1278;
        float _1522 = _1514 * _1270;
        float _1524 = fma(_1358, _1516, _1354);
        float _1526 = fma(_1358, _1518, _1352);
        float _1528 = fma(_1358, _1520, _1356);
        float _1530 = _1522 * _1500;
        float _1532 = _1514 * _1508;
        float _1534 = fma(_1362, _1530, _1526);
        float _1536 = fma(_1364, _1530, _1524);
        float _1538 = fma(_1366, _1530, _1528);
        float _1540 = fma(_1504, _1532, _1534);
        float _1542 = fma(_1512, _1532, _1536);
        float _1544 = fma(_1510, _1532, _1538);
        _303 = as_type<int>(_1540);
        _305 = as_type<int>(_1542);
        _307 = as_type<int>(_1544);
        _154 = as_type<int>(_1524);
        _156 = as_type<int>(_1510);
        _158 = as_type<int>(_1532);
    }
    int _1546 = _303;
    int _1548 = _305;
    int _1550 = _307;
    int _1552 = _154;
    int _1554 = _156;
    int _1556 = _158;
    bool _1558 = _226 > 0.0;
    bool _1560 = isnan(_226);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan(0.0);
    bool _1566 = _1562 || _1564;
    int _1568 = _1552;
    int _1570 = _1554;
    int _1572 = _1556;
    if (_1566)
    {
        _1568 = _1546;
    }
    int _1574 = _1568;
    if (_1566)
    {
        _1570 = _1548;
    }
    int _1576 = _1570;
    if (_1566)
    {
        _1572 = _1550;
    }
    int _1578 = _1572;
    if (_1566)
    {
        out.m_64.x = as_type<float>(_1574);
        out.m_64.y = as_type<float>(_1576);
        out.m_64.z = as_type<float>(_1578);
        out.m_64.w = 1.0;
        return out;
    }
    float _1580 = in.m_61.x;
    float _1582 = gl_FragCoord.w;
    float _1584 = _1580 * _1582;
    float _1586 = in.m_61.y;
    float _1588 = gl_FragCoord.w;
    float _1590 = _1586 * _1588;
    float _1592 = _91 * _1584;
    float _1594 = _91 * _1590;
    float2 _4013 = float2(_1592, _1594);
    float2 _1596 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_4013, float2(0.0), isnan(_4013))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_4013, float2(0.0), isnan(_4013))).xy;
    float _1598 = _1596.x;
    float _1600 = _1596.y;
    float _1602 = fma(_1598, 2.0, -1.0);
    float _1604 = fma(_1600, 2.0, -1.0);
    float _1606 = fma(_1602, (*spvDescriptorSet0.fp_c6)._m0[0].x, _1592);
    float _1608 = fma(_1604, (*spvDescriptorSet0.fp_c6)._m0[0].y, _1594);
    float2 _4039 = float2(_1606, _1608);
    float4 _1610 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4039, float2(0.0), isnan(_4039))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4039, float2(0.0), isnan(_4039))).xyzw;
    float _1612 = _1610.x;
    float _1614 = _1610.y;
    float _1616 = _1610.z;
    float _1618 = _1610.w;
    float _1620 = fma(_1618, as_type<float>(_1546), _1612);
    float _1622 = fma(_1618, as_type<float>(_1548), _1614);
    float _1624 = fma(_1618, as_type<float>(_1550), _1616);
    out.m_64.x = _1620;
    out.m_64.y = _1622;
    out.m_64.z = _1624;
    out.m_64.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_64 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_59.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_59.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_59.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _71;
    float _93 = _91 * _77;
    float _95 = _91 * _83;
    float _97 = _91 * _89;
    float _99 = _93 * _93;
    float _101 = fma(_95, _95, _99);
    float _103 = (*spvDescriptorSet0.fp_c4)._m0[5].w + (-220.0);
    float _105 = fma(_97, _97, _101);
    float _107 = precise::max(0.0, _103);
    float _109 = rsqrt(_105);
    float _111 = _95 * _109;
    float _113 = _97 * _109;
    float _115 = _93 * _109;
    float _117 = _111 * (*spvDescriptorSet0.fp_c4)._m0[7].w;
    float _119 = _113 * (*spvDescriptorSet0.fp_c4)._m0[7].w;
    float _121 = -_115;
    float _123 = -_107;
    float _125 = fma(_121, (*spvDescriptorSet0.fp_c4)._m0[7].w, _123);
    float _127 = _117 * _117;
    float _129 = _119 * _119;
    float _131 = _127 + _129;
    float _133 = sqrt(_131);
    bool _137 = _133 > (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _139 = _107;
    float _141 = _109;
    float _143 = _125;
    float _145 = _127;
    float _147 = _117;
    float _149 = _111;
    float _151 = _115;
    int _154 = as_type<int>(_111);
    int _156 = as_type<int>(_113);
    int _158 = as_type<int>(_115);
    if (!_137)
    {
        _139 = _129;
    }
    float _160 = _139;
    float _162 = _160;
    if (!_137)
    {
        _141 = _119;
    }
    float _164 = _141;
    bool _166 = !_137;
    float _168 = _164;
    if (!_166)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _172 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _174 = _133 + _172;
        float _176 = rsqrt(_131);
        float _178 = _174 * _170;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _125 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _184 = _180 * 6.283185482025146484375;
        float _186 = sin(_184);
        float _188 = _180 * 6.283185482025146484375;
        float _190 = cos(_188);
        float _192 = fma(_186, _182, (*spvDescriptorSet0.fp_c3)._m0[5].x);
        float _194 = _176 * _192;
        float _196 = _190 + (-1.0);
        float _198 = _117 * _194;
        float _200 = _196 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _202 = _119 * _194;
        float _204 = fma(_125, _190, _200);
        float _206 = _198 * _198;
        float _208 = _202 * _202;
        _143 = _204;
        _145 = _206;
        _162 = _208;
        _147 = _198;
        _168 = _202;
    }
    float _210 = _143;
    float _212 = _145;
    float _214 = _162;
    float _216 = _147;
    float _218 = _168;
    float _220 = fma(_210, _210, _212);
    float _222 = _220 + _214;
    float _224 = rsqrt(_222);
    float _226 = _224 * _210;
    float _228 = _224 * _216;
    float _230 = _224 * _218;
    float _232 = _226 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _234 = -_232;
    float _236 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].x, _234);
    float _238 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[1].z, _236);
    float _240 = fma(_238, -0.5, 0.5);
    float _242 = fma(_238, 0.5, 0.5);
    float _244 = fma(_242, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _246 = sqrt(_240);
    float _248 = fma(_242, _244, -0.212114393711090087890625);
    float _250 = fma(_242, _248, 1.570728778839111328125);
    float _252 = fma(_226, -0.5, 0.5);
    float _254 = _246 * 0.636619746685028076171875;
    float _256 = -_250;
    float _258 = fma(_254, _256, 1.0);
    float2 _1901 = float2(_258, _252);
    float4 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1901, float2(0.0), isnan(_1901))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1901, float2(0.0), isnan(_1901))).xyzw;
    float _263 = _261.x;
    float _265 = _261.y;
    float _267 = _261.z;
    float _269 = _261.w;
    bool _271 = _226 > 0.0;
    float _273 = abs(_115);
    bool _275 = _273 > 9.9999997473787516355514526367188e-05;
    bool _277 = _275 && _271;
    float _279 = _269 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _285 = _263 + _283;
    float _287 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _289 = _265 + _287;
    float _291 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _293 = _267 + _291;
    float _295 = fma(_281, _285, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _297 = fma(_281, _289, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _299 = fma(_281, _293, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    bool _301 = !_277;
    int _303 = as_type<int>(_295);
    int _305 = as_type<int>(_297);
    int _307 = as_type<int>(_299);
    if (!_301)
    {
        float _309 = 1.0 / _115;
        float _311 = -(*spvDescriptorSet0.fp_c5)._m0[0].y;
        float _313 = _311 + 220.0;
        float _315 = _313 * _309;
        float _317 = fma(_113, _315, (*spvDescriptorSet0.fp_c5)._m0[0].z);
        float _319 = fma(_111, _315, (*spvDescriptorSet0.fp_c5)._m0[0].x);
        float _321 = -(*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _323 = _317 + _321;
        float _325 = -(*spvDescriptorSet0.fp_c5)._m0[0].x;
        float _327 = _319 + _325;
        float _329 = _323 * _323;
        float _331 = fma(_327, _327, _329);
        float _333 = sqrt(_331);
        bool _335 = _333 > (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _337 = _333;
        float _339 = _317;
        float _341 = _319;
        if (!_335)
        {
            _337 = 220.0;
        }
        float _343 = _337;
        bool _345 = !_335;
        float _347 = _343;
        if (!_345)
        {
            float _349 = rsqrt(_331);
            float _351 = (*spvDescriptorSet0.fp_c5)._m0[0].y + (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _353 = _351 * _351;
            float _355 = _115 * _351;
            float _357 = _349 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _359 = fma(_327, _357, (*spvDescriptorSet0.fp_c5)._m0[0].x);
            float _361 = fma(_323, _357, (*spvDescriptorSet0.fp_c5)._m0[0].z);
            float _363 = -_359;
            float _365 = _363 + (*spvDescriptorSet0.fp_c5)._m0[0].x;
            float _367 = -_361;
            float _369 = _367 + (*spvDescriptorSet0.fp_c5)._m0[0].z;
            float _371 = fma(_365, _365, _353);
            float _373 = fma(_111, _365, _355);
            float _375 = 220.0 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _377 = fma(_369, _369, _371);
            float _379 = fma(_113, _369, _373);
            float _381 = -_375;
            float _383 = fma(_381, _375, _377);
            float _385 = _379 * 2.0;
            float _387 = _383 * 4.0;
            float _389 = -_387;
            float _391 = fma(_385, _385, _389);
            float _393 = precise::max(0.0, _391);
            float _395 = sqrt(_393);
            float _397 = -_385;
            float _399 = -_395;
            float _401 = _397 + _399;
            float _403 = _401 * 0.5;
            float _405 = fma(_111, _403, (*spvDescriptorSet0.fp_c5)._m0[0].x);
            float _407 = fma(_115, _403, (*spvDescriptorSet0.fp_c5)._m0[0].y);
            float _409 = fma(_113, _403, (*spvDescriptorSet0.fp_c5)._m0[0].z);
            _339 = _409;
            _341 = _405;
            _347 = _407;
        }
        float _411 = _339;
        float _413 = _341;
        float _415 = _347;
        float _417 = -(*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _419 = _411 + _417;
        float _421 = -(*spvDescriptorSet0.fp_c5)._m0[0].x;
        float _423 = _413 + _421;
        float _425 = _419 * _419;
        float _427 = fma(_423, _423, _425);
        float _429 = sqrt(_427);
        bool _431 = _429 > (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _433 = _413;
        if (!_431)
        {
            _149 = _411;
        }
        float _435 = _149;
        float _437 = _435;
        if (!_431)
        {
            _151 = _415;
        }
        float _439 = _151;
        bool _441 = !_431;
        float _443 = _439;
        if (!_441)
        {
            float _445 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _447 = _429 + _445;
            float _449 = _415 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _451 = rsqrt(_427);
            float _453 = -_415;
            float _455 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _457 = _453 + _455;
            float _459 = abs(_447);
            float _461 = abs(_449);
            float _463 = precise::max(_459, _461);
            float _465 = _457 * _457;
            bool _467 = _463 >= 16.0;
            float _469 = _423 * _451;
            float _471 = _419 * _451;
            float _473 = -_423;
            float _475 = fma(_469, (*spvDescriptorSet0.fp_c3)._m0[5].x, _473);
            float _477 = -_419;
            float _479 = fma(_471, (*spvDescriptorSet0.fp_c3)._m0[5].x, _477);
            float _481 = _447;
            float _483 = _449;
            float _485 = _475;
            if (_467)
            {
                float _487 = _447 * 0.0625;
                _481 = _487;
            }
            float _489 = _481;
            if (_467)
            {
                float _491 = _449 * 0.0625;
                _483 = _491;
            }
            float _493 = _483;
            float _495 = fma(_475, _475, _465);
            float _497 = abs(_489);
            bool _499 = _497 != 0.0;
            bool _501 = isnan(_497);
            bool _503 = _499 || _501;
            bool _505 = isnan(0.0);
            bool _507 = _503 || _505;
            float _509 = fma(_479, _479, _495);
            float _511 = abs(_493);
            bool _513 = _511 == 0.0;
            float _515 = abs(_493);
            bool _517 = _515 == 0.0;
            bool _519 = !_507;
            bool _521 = _517 && _519;
            float _523 = sqrt(_509);
            bool _525 = false;
            int _527 = as_type<int>(_495);
            if (_521)
            {
                bool _529 = as_type<int>(_493) >= 0;
                _525 = _529;
            }
            bool _531 = _525;
            int _533 = _531 ? (-1) : 0;
            if (_521)
            {
                int _535 = _531 ? 0 : 1078530011;
                _527 = _535;
            }
            int _537 = _527;
            int _539 = _537;
            if (_521)
            {
                int _541 = int(0x80000000) & as_type<int>(_489);
                int _543 = _537 | _541;
                _485 = as_type<float>(_543);
            }
            float _545 = _485;
            bool _547 = !_507;
            bool _549 = _547 && _513;
            float _551 = _545;
            float _553 = _545;
            if (!_549)
            {
                float _555 = abs(_489);
                bool _557 = _555 != as_type<float>(0x7f800000u /* inf */);
                bool _559 = isnan(_555);
                bool _561 = _557 || _559;
                bool _563 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _565 = _561 || _563;
                float _567 = abs(_493);
                bool _569 = _567 == as_type<float>(0x7f800000u /* inf */);
                float _571 = abs(_493);
                bool _573 = _571 == as_type<float>(0x7f800000u /* inf */);
                bool _575 = !_565;
                bool _577 = _573 && _575;
                if (_577)
                {
                    bool _579 = as_type<int>(_493) >= 0;
                    _533 = _579 ? (-1) : 0;
                }
                int _581 = _533;
                if (_577)
                {
                    _539 = 1075235812;
                }
                int _583 = _539;
                int _585 = _583;
                if (_577)
                {
                    int _587 = ~_581;
                    int _589 = (_587 != 0) ? _583 : 1061752795;
                    _585 = _589;
                }
                int _591 = _585;
                if (_577)
                {
                    int _593 = int(0x80000000) & as_type<int>(_489);
                    int _595 = _591 | _593;
                    _551 = as_type<float>(_595);
                }
                float _597 = _551;
                bool _599 = !_565;
                bool _601 = _599 && _569;
                _553 = _597;
                if (!_601)
                {
                    float _603 = abs(_489);
                    float _605 = abs(_493);
                    float _607 = precise::max(_603, _605);
                    float _609 = abs(_489);
                    float _611 = abs(_493);
                    float _613 = precise::min(_609, _611);
                    float _615 = 1.0 / _607;
                    float _617 = abs(_489);
                    float _619 = abs(_493);
                    bool _621 = _617 > _619;
                    bool _623 = as_type<int>(_493) >= 0;
                    float _625 = abs(_489);
                    float _627 = abs(_493);
                    float _629 = _625 + _627;
                    int _631 = as_type<int>(_489) & int(0x80000000);
                    bool _633 = _629 > as_type<float>(0x7f800000u /* inf */);
                    bool _635 = isnan(_629);
                    bool _637 = _633 || _635;
                    bool _639 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _641 = _637 || _639;
                    float _643 = _613 * _615;
                    float _645 = _643 * _643;
                    float _647 = _645 + 11.33538818359375;
                    float _649 = fma(_645, _647, 28.84246826171875);
                    float _651 = fma(_645, _649, 19.6966705322265625);
                    float _653 = fma(_645, -0.82336294651031494140625, -5.674867153167724609375);
                    float _655 = fma(_645, _653, -6.565555095672607421875);
                    float _657 = 1.0 / _651;
                    float _659 = _645 * _655;
                    float _661 = _643 * _659;
                    float _663 = fma(_661, _657, _643);
                    float _665 = _663;
                    _553 = _629;
                    if (_621)
                    {
                        float _667 = -_663;
                        float _669 = _667 + 1.57079637050628662109375;
                        _665 = _669;
                    }
                    float _671 = _665;
                    int _673 = as_type<int>(_671);
                    if (!_623)
                    {
                        float _675 = -_671;
                        float _677 = _675 + 3.1415927410125732421875;
                        _673 = as_type<int>(_677);
                    }
                    int _679 = _673;
                    if (!_641)
                    {
                        int _681 = _631 | _679;
                        _553 = as_type<float>(_681);
                    }
                }
            }
            float _683 = _553;
            float _685 = fma(_683, (*spvDescriptorSet0.fp_c3)._m0[5].y, (*spvDescriptorSet0.fp_c3)._m0[5].x);
            float _687 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _689 = _523 + _687;
            float _691 = fma(_469, _685, (*spvDescriptorSet0.fp_c5)._m0[0].x);
            float _693 = fma(_471, _685, (*spvDescriptorSet0.fp_c5)._m0[0].z);
            _443 = _689;
            _433 = _691;
            _437 = _693;
        }
        float _695 = _443;
        float _697 = _433;
        float _699 = _437;
        float _701 = -(*spvDescriptorSet0.fp_c5)._m0[0].y;
        float _703 = _695 + _701;
        float _705 = -(*spvDescriptorSet0.fp_c5)._m0[0].x;
        float _707 = _697 + _705;
        float _709 = -(*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _711 = _699 + _709;
        int _713 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[16].z) << 4;
        float _715 = _703 * _703;
        int _717 = _713 + 76;
        uint _720 = uint(int(uint(_717) >> uint(2)));
        uint _722 = uint(int(uint(int(_720)) >> uint(2)));
        int _724 = int(_720) & 3;
        float _726 = (*spvDescriptorSet0.fp_c7)._m0[int(_722)][_724];
        float _728 = fma(_707, _707, _715);
        float _730 = -(*spvDescriptorSet0.fp_c7)._m0[18].z;
        float _732 = _697 + _730;
        float _734 = fma(_711, _711, _728);
        float _736 = -(*spvDescriptorSet0.fp_c7)._m0[18].w;
        float _738 = _699 + _736;
        uint _740 = uint(int(uint(_713) >> uint(2)));
        uint _742 = uint(int(uint(int(_740)) >> uint(2)));
        int _744 = int(_740) & 3;
        float _746 = (*spvDescriptorSet0.fp_c7)._m0[int(_742)][_744];
        float _748 = sqrt(_734);
        float _750 = abs(_732);
        float _752 = abs(_738);
        float _754 = precise::max(_750, _752);
        float _756 = _726 + 8.0;
        float _758 = _756 + _754;
        float _760 = spvFAdd(_748, 9.9999997473787516355514526367188e-06);
        float _762 = _758 * _746;
        float _764 = _762 * 4.0;
        float _766 = 1.0 / _760;
        float _768 = precise::max(_764, 1.0);
        float _770 = log2(_768);
        float _772 = _703 * _766;
        float _774 = _707 * _766;
        float _776 = _711 * _766;
        float _778 = _772 + (*spvDescriptorSet0.fp_c5)._m0[3].y;
        float _780 = _774 + (*spvDescriptorSet0.fp_c5)._m0[3].x;
        float _782 = _776 + (*spvDescriptorSet0.fp_c5)._m0[3].z;
        bool _784 = _770 >= 5.0;
        bool _786 = isnan(_770);
        bool _788 = _784 || _786;
        bool _790 = isnan(5.0);
        bool _792 = _788 || _790;
        float _794 = _778 * _778;
        float _796 = fma(_780, _780, _794);
        float _798 = fma(_782, _782, _796);
        float _800 = _794;
        float _802 = _796;
        if (_792)
        {
            _800 = 0.0;
            _802 = 0.0;
        }
        float _804 = _800;
        float _806 = _802;
        float _808 = _804;
        float _810 = _806;
        if (!_792)
        {
            float _812 = trunc(_770);
            int _814 = int(_812);
            float _816 = -(*spvDescriptorSet0.fp_c7)._m0[16].y;
            float _818 = _699 + _816;
            float _820 = -(*spvDescriptorSet0.fp_c7)._m0[16].x;
            float _822 = _697 + _820;
            float _824 = floor(_770);
            int _826 = min(_814, 4);
            int _828 = _826 + as_type<int>((*spvDescriptorSet0.fp_c7)._m0[16].z);
            int _830 = _828 << 4;
            float _832 = _824 + 1.0;
            float _834 = rint(_824);
            float _836 = precise::max(_834, 0.0);
            uint _838 = uint(_836);
            uint _840 = clamp(_838, 0u, 65535u);
            uint _842 = uint(int(uint(_830) >> uint(2)));
            uint _844 = uint(int(uint(int(_842)) >> uint(2)));
            int _846 = int(_842) & 3;
            float _848 = (*spvDescriptorSet0.fp_c7)._m0[int(_844)][_846];
            float _850 = rint(_832);
            float _852 = precise::max(_850, 0.0);
            uint _854 = uint(_852);
            uint _856 = clamp(_854, 0u, 65535u);
            int _858 = _830 + 16;
            uint _860 = uint(int(uint(_858) >> uint(2)));
            uint _862 = uint(int(uint(int(_860)) >> uint(2)));
            int _864 = int(_860) & 3;
            float _866 = (*spvDescriptorSet0.fp_c7)._m0[int(_862)][_864];
            float _868 = fma(_818, _848, 0.5);
            float _870 = fma(_822, _848, 0.5);
            float _872 = fma(_818, _866, 0.5);
            float _874 = fma(_822, _866, 0.5);
            float3 _2834 = float3(_870, _868, float(int(_840)));
            float3 _2838 = select(_2834, float3(0.0), isnan(_2834));
            float2 _878 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, _2838.xy, uint(rint(_2838.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, _2838.xy, uint(rint(_2838.z))).xy;
            float _880 = _878.x;
            float _882 = _878.y;
            float3 _2851 = float3(_874, _872, float(int(_856)));
            float3 _2853 = select(_2851, float3(0.0), isnan(_2851));
            float2 _884 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, _2853.xy, uint(rint(_2853.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, _2853.xy, uint(rint(_2853.z))).xy;
            float _886 = _884.x;
            float _888 = _884.y;
            bool _890 = _770 >= 4.0;
            bool _892 = isnan(_770);
            bool _894 = _890 || _892;
            bool _896 = isnan(4.0);
            bool _898 = _894 || _896;
            _808 = _880;
            _810 = _882;
            if (!_898)
            {
                float _900 = -_824;
                float _902 = _770 + _900;
                float _904 = -_880;
                float _906 = _904 + _886;
                float _908 = fma(_902, 5.42372894287109375, -4.338983058929443359375);
                float _910 = precise::clamp(_908, 0.0, 1.0);
                float _912 = -_882;
                float _914 = _912 + _888;
                float _916 = fma(_910, _906, _880);
                float _918 = fma(_910, _914, _882);
                _808 = _916;
                _810 = _918;
            }
        }
        float _920 = _808;
        float _922 = _810;
        float _924 = fma(_920, _920, 1.0);
        float _926 = rsqrt(_798);
        float _928 = -(*spvDescriptorSet0.fp_c5)._m0[0].y;
        float _930 = _415 + _928;
        float _932 = fma(_922, _922, _924);
        float _934 = _930 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
        float _936 = rsqrt(_932);
        float _938 = fma(_423, (*spvDescriptorSet0.fp_c4)._m0[4].z, _934);
        float _940 = _748 + (-250.0);
        float _942 = (*spvDescriptorSet0.fp_c5)._m0[12].z + (-1.0);
        float _944 = fma(_419, (*spvDescriptorSet0.fp_c4)._m0[6].z, _938);
        float _946 = precise::max(0.0, _940);
        float _948 = _778 * _926;
        float _950 = _780 * _926;
        float _952 = _782 * _926;
        float _954 = _944 * (*spvDescriptorSet0.fp_c5)._m0[12].y;
        float _956 = _948 * (*spvDescriptorSet0.fp_c5)._m0[3].y;
        float _958 = _946 * 0.001000000047497451305389404296875;
        float _960 = precise::clamp(_958, 0.0, 1.0);
        float _962 = -_954;
        float _964 = fma(_962, _942, 1.0);
        float _966 = _936 * _920;
        float _968 = fma(_950, (*spvDescriptorSet0.fp_c5)._m0[3].x, _956);
        float _970 = _936 * _922;
        float _972 = _774 * _966;
        float _974 = _950 * _966;
        float _976 = fma(_960, 0.20000000298023223876953125, 0.00999999977648258209228515625);
        float _978 = fma(_952, (*spvDescriptorSet0.fp_c5)._m0[3].z, _968);
        float _980 = precise::clamp(_978, 0.0, 1.0);
        float _982 = -_772;
        float _984 = -_972;
        float _986 = fma(_982, _936, _984);
        float _988 = -_948;
        float _990 = -_974;
        float _992 = fma(_988, _936, _990);
        float _994 = fma(_772, _936, _972);
        float _996 = fma(_960, -0.20000000298023223876953125, 0.9900000095367431640625);
        float _998 = -_776;
        float _1000 = fma(_998, _970, _986);
        float _1002 = precise::clamp(_1000, 0.0, 1.0);
        float _1004 = -_952;
        float _1006 = fma(_1004, _970, _992);
        float _1008 = precise::clamp(_1006, 0.0, 1.0);
        float _1010 = fma(_776, _970, _994);
        float _1012 = _1002 * (-9.27999973297119140625);
        float _1014 = _1010 * _1010;
        float _1016 = fma(_976, 0.02199999988079071044921875, -0.039999999105930328369140625);
        float _1018 = fma(_976, 0.5, 0.5);
        float _1020 = exp2(_1012);
        float _1022 = fma(_1014, 0.565323054790496826171875, 0.434676945209503173828125);
        float _1024 = fma(_976, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
        float _1026 = fma(_976, -0.572000026702880859375, 1.03999996185302734375);
        float _1028 = fma(_976, _976, 0.00999999977648258209228515625);
        float _1030 = precise::clamp(_1028, 0.0, 1.0);
        float _1032 = _966 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
        float _1034 = _996 * _996;
        float _1036 = _1018 * _1018;
        float _1038 = _1036 * 0.5;
        float _1040 = _1030 * _1030;
        float _1042 = -_936;
        float _1044 = -_1032;
        float _1046 = fma(_1042, (*spvDescriptorSet0.fp_c5)._m0[3].y, _1044);
        float _1048 = sqrt(_1022);
        float _1050 = -_1038;
        float _1052 = _1050 + 1.0;
        float _1054 = -_980;
        float _1056 = _1054 + 1.0;
        float _1058 = -_970;
        float _1060 = fma(_1058, (*spvDescriptorSet0.fp_c5)._m0[3].z, _1046);
        float _1062 = precise::clamp(_1060, 0.0, 1.0);
        float _1064 = _1040 + (-1.0);
        float _1066 = _1008 * _1008;
        float _1068 = precise::min(_1034, _1020);
        float _1070 = fma(_1002, _1052, _1038);
        float _1072 = fma(_1062, _1052, _1038);
        float _1074 = _1056 * _1056;
        float _1076 = fma(_996, _1068, _1024);
        float _1078 = fma(_1066, _1064, 1.0);
        float _1080 = _1070 * _1072;
        float _1082 = _1074 * _1074;
        float _1084 = _774 * 0.75187969207763671875;
        float _1086 = (*spvDescriptorSet0.fp_c5)._m0[8].x * 0.88622701168060302734375;
        float _1088 = _936 * 1.02332699298858642578125;
        float _1090 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c5)._m0[9].x;
        float _1092 = _1056 * _1082;
        float _1094 = fma(_1010, 0.75187969207763671875, _1048);
        float _1096 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c5)._m0[9].y;
        float _1098 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c5)._m0[9].z;
        float _1100 = _970 * 1.02332699298858642578125;
        float _1102 = fma(_1088, (*spvDescriptorSet0.fp_c5)._m0[8].y, _1086);
        float _1104 = fma(_1088, (*spvDescriptorSet0.fp_c5)._m0[9].w, _1090);
        float _1106 = _966 * 1.02332699298858642578125;
        float _1108 = -_1084;
        float _1110 = fma(_966, _1094, _1108);
        float _1112 = fma(_1100, (*spvDescriptorSet0.fp_c5)._m0[8].z, _1102);
        float _1114 = fma(_1100, (*spvDescriptorSet0.fp_c5)._m0[10].z, _1104);
        float _1116 = fma(_1088, (*spvDescriptorSet0.fp_c5)._m0[10].x, _1096);
        float _1118 = fma(_1088, (*spvDescriptorSet0.fp_c5)._m0[10].y, _1098);
        float _1120 = fma(_1106, (*spvDescriptorSet0.fp_c5)._m0[8].w, _1112);
        float _1122 = fma(_1106, (*spvDescriptorSet0.fp_c5)._m0[11].y, _1114);
        float _1124 = fma(_1100, (*spvDescriptorSet0.fp_c5)._m0[10].w, _1116);
        float _1126 = fma(_1100, (*spvDescriptorSet0.fp_c5)._m0[11].x, _1118);
        float _1128 = _1120 * 0.31830990314483642578125;
        float _1130 = precise::clamp(_1128, 0.0, 1.0);
        float _1132 = _776 * 0.75187969207763671875;
        float _1134 = precise::max(0.0, _1122);
        float _1136 = fma(_1106, (*spvDescriptorSet0.fp_c5)._m0[11].z, _1124);
        float _1138 = _772 * 0.75187969207763671875;
        float _1140 = _1130 * 0.88622701168060302734375;
        float _1142 = fma(_1106, (*spvDescriptorSet0.fp_c5)._m0[11].w, _1126);
        float _1144 = -_1132;
        float _1146 = fma(_970, _1094, _1144);
        float _1148 = _1134 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
        float _1150 = -_1138;
        float _1152 = fma(_936, _1094, _1150);
        float _1154 = -_1130;
        float _1156 = _1154 + 1.0;
        float _1158 = _1140 * (*spvDescriptorSet0.fp_c5)._m0[7].x;
        float _1160 = fma(_936, 0.5, 0.5);
        float _1162 = fma(_1148, _1156, _1158);
        float _1164 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
        float _1166 = _1164 + (*spvDescriptorSet0.fp_c5)._m0[5].x;
        float _1168 = precise::max(0.0, _1136);
        float _1170 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
        float _1172 = _1170 + (*spvDescriptorSet0.fp_c5)._m0[5].y;
        float _1174 = _1078 * _1078;
        float _1176 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
        float _1178 = _1176 + (*spvDescriptorSet0.fp_c5)._m0[5].z;
        float _1180 = fma(_1160, _1166, (*spvDescriptorSet0.fp_c5)._m0[6].x);
        float _1182 = fma(_1160, _1172, (*spvDescriptorSet0.fp_c5)._m0[6].y);
        float _1184 = _1140 * (*spvDescriptorSet0.fp_c5)._m0[7].y;
        float _1186 = fma(_1160, _1178, (*spvDescriptorSet0.fp_c5)._m0[6].z);
        float _1188 = in.m_61.x;
        float _1190 = gl_FragCoord.w;
        float _1192 = _1188 * _1190;
        float _1194 = in.m_61.y;
        float _1196 = gl_FragCoord.w;
        float _1198 = _1194 * _1196;
        float _1200 = _1168 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
        float _1202 = precise::max(0.0, _1142);
        float _1204 = log2(_964);
        float _1206 = _1140 * (*spvDescriptorSet0.fp_c5)._m0[7].z;
        float _1208 = fma(_1200, _1156, _1184);
        float _1210 = _1040 * 0.31830990314483642578125;
        float _1212 = _1202 * (*spvDescriptorSet0.fp_c5)._m0[2].z;
        float _1214 = fma(_1076, 1.03999996185302734375, _1016);
        float _1216 = precise::clamp(_1214, 0.0, 1.0);
        float _1218 = fma(_1182, (*spvDescriptorSet0.fp_c5)._m0[0].w, _1208);
        bool _1220 = _1022 >= 0.0;
        bool _1222 = isnan(_1022);
        bool _1224 = _1220 || _1222;
        bool _1226 = isnan(0.0);
        bool _1228 = _1224 || _1226;
        float _1230 = 1.0 / _1174;
        float _1232 = fma(_1212, _1156, _1206);
        float _1234 = fma(_1180, (*spvDescriptorSet0.fp_c5)._m0[0].w, _1162);
        float _1236 = fma(_697, 6.2500002968590706586837768554688e-05, 0.5);
        float _1238 = fma(_699, 6.2500002968590706586837768554688e-05, 0.5);
        float _1240 = fma(_1076, -1.03999996185302734375, _1026);
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        float _1244 = _1204 * 0.693147182464599609375;
        float _1246 = _1244 * (*spvDescriptorSet0.fp_c5)._m0[12].w;
        float _1248 = _1210 * _1230;
        float _1250 = _91 * _1192;
        float _1252 = _91 * _1198;
        float2 _3442 = float2(_1250, _1252);
        float2 _1254 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3442, float2(0.0), isnan(_3442))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3442, float2(0.0), isnan(_3442))).xy;
        float _1256 = _1254.x;
        float _1258 = _1254.y;
        float2 _3454 = float2(_1236, _1238);
        float4 _1260 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_3454, float2(0.0), isnan(_3454))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_3454, float2(0.0), isnan(_3454))).xyzw;
        float _1262 = _1260.x;
        float _1264 = _1260.y;
        float _1266 = _1260.z;
        float _1268 = _1260.w;
        float3 _3471 = float3(_1250, _1252, _1246);
        float _1270 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3471, float3(0.0), isnan(_3471))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3471, float3(0.0), isnan(_3471))).x;
        float3 _3480 = float3(_1250, _1252, _1246);
        float4 _1272 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3480, float3(0.0), isnan(_3480))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3480, float3(0.0), isnan(_3480))).xyzw;
        float _1274 = _1272.x;
        float _1276 = _1272.y;
        float _1278 = _1272.z;
        float _1280 = _1272.w;
        float _1282 = fma(_1186, (*spvDescriptorSet0.fp_c5)._m0[0].w, _1232);
        float _1284 = _1228 ? _1152 : (-0.0);
        float _1286 = _1062 * _1248;
        float _1288 = _1228 ? _1110 : (-0.0);
        float _1290 = -(*spvDescriptorSet0.fp_c5)._m0[13].y;
        float _1292 = fma(_748, (*spvDescriptorSet0.fp_c5)._m0[13].x, _1290);
        float _1294 = precise::clamp(_1292, 0.0, 1.0);
        float _1296 = _1228 ? _1146 : (-0.0);
        float _1298 = _1284 * (*spvDescriptorSet0.fp_c5)._m0[3].y;
        float _1300 = -_1294;
        float _1302 = _1300 + 1.0;
        float _1304 = fma(_1242, 0.02005931176245212554931640625, _1216);
        float _1306 = fma(_1288, (*spvDescriptorSet0.fp_c5)._m0[3].x, _1298);
        float _1308 = abs(_1302);
        float _1310 = log2(_1308);
        float _1312 = fma(_1296, (*spvDescriptorSet0.fp_c5)._m0[3].z, _1306);
        float _1314 = fma(_1312, -1.39999997615814208984375, 1.4900000095367431640625);
        float _1316 = _226 + 1.0;
        float _1318 = _1310 * (*spvDescriptorSet0.fp_c5)._m0[14].x;
        float _1320 = exp2(_1318);
        float _1322 = -_226;
        float _1324 = fma(_1320, _1316, _1322);
        float _1326 = fma(_1324, 0.5, 0.5);
        float _1328 = fma(_1256, 2.0, -1.0);
        float _1330 = fma(_1258, 2.0, -1.0);
        float _1332 = fma(_1328, (*spvDescriptorSet0.fp_c6)._m0[0].z, _1250);
        float _1334 = fma(_1328, (*spvDescriptorSet0.fp_c6)._m0[0].x, _1250);
        float _1336 = fma(_1330, (*spvDescriptorSet0.fp_c6)._m0[0].y, _1252);
        float _1338 = fma(_1330, (*spvDescriptorSet0.fp_c6)._m0[0].w, _1252);
        float2 _3596 = float2(_1334, _1336);
        float3 _1342 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_3596, float2(0.0), isnan(_3596))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_3596, float2(0.0), isnan(_3596))).xyz;
        float _1344 = _1342.x;
        float _1346 = _1342.y;
        float _1348 = _1342.z;
        float2 _3610 = float2(_1332, _1338);
        float4 _1350 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_3610, float2(0.0), isnan(_3610))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_3610, float2(0.0), isnan(_3610))).xyzw;
        float _1352 = _1350.x;
        float _1354 = _1350.y;
        float _1356 = _1350.z;
        float _1358 = _1350.w;
        float2 _3626 = float2(_258, _1326);
        float3 _1360 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3626, float2(0.0), isnan(_3626))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3626, float2(0.0), isnan(_3626))).xyz;
        float _1362 = _1360.x;
        float _1364 = _1360.y;
        float _1366 = _1360.z;
        float _1368 = 1.0 / _1080;
        float _1370 = _1234 * _1262;
        float _1372 = _1262 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
        float _1374 = _1282 * _1266;
        float _1376 = fma(1.02332699298858642578125, (*spvDescriptorSet0.fp_c5)._m0[8].y, _1086);
        float _1378 = fma(1.02332699298858642578125, (*spvDescriptorSet0.fp_c5)._m0[9].w, _1090);
        float _1380 = fma(1.02332699298858642578125, (*spvDescriptorSet0.fp_c5)._m0[10].x, _1096);
        float _1382 = fma(1.02332699298858642578125, (*spvDescriptorSet0.fp_c5)._m0[10].y, _1098);
        float _1384 = _1376 * 0.31830990314483642578125;
        float _1386 = precise::clamp(_1384, 0.0, 1.0);
        float _1388 = abs(_1314);
        float _1390 = log2(_1388);
        float _1392 = precise::max(0.0, _1378);
        float _1394 = _1266 * (*spvDescriptorSet0.fp_c5)._m0[4].z;
        float _1396 = _1386 * 0.88622701168060302734375;
        float _1398 = -_1386;
        float _1400 = _1398 + 1.0;
        float _1402 = precise::max(0.0, _1380);
        float _1404 = _1392 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
        float _1406 = _1396 * (*spvDescriptorSet0.fp_c5)._m0[7].x;
        float _1408 = _1396 * (*spvDescriptorSet0.fp_c5)._m0[7].z;
        float _1410 = _1286 * _1368;
        float _1412 = _1402 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
        float _1414 = fma(_1404, _1400, _1406);
        float _1416 = precise::max(0.0, _1382);
        float _1418 = _1396 * (*spvDescriptorSet0.fp_c5)._m0[7].y;
        float _1420 = _1374 * 0.079577468335628509521484375;
        float _1422 = _1390 * 1.5;
        float _1424 = _1416 * (*spvDescriptorSet0.fp_c5)._m0[2].z;
        float _1426 = fma(_1412, _1400, _1418);
        float _1428 = _1310 * (*spvDescriptorSet0.fp_c5)._m0[14].y;
        float _1430 = fma(_1424, _1400, _1408);
        float _1432 = -_1422;
        float _1434 = exp2(_1432);
        float _1436 = fma((*spvDescriptorSet0.fp_c5)._m0[0].w, (*spvDescriptorSet0.fp_c5)._m0[5].x, _1414);
        float _1438 = fma((*spvDescriptorSet0.fp_c5)._m0[0].w, (*spvDescriptorSet0.fp_c5)._m0[5].y, _1426);
        float _1440 = fma((*spvDescriptorSet0.fp_c5)._m0[0].w, (*spvDescriptorSet0.fp_c5)._m0[5].z, _1430);
        float _1442 = fma(_1092, 0.979940712451934814453125, 0.02005931176245212554931640625);
        float _1444 = _1304 * 0.31830990314483642578125;
        float _1446 = spvFAdd(_1268, 0.01600000075995922088623046875);
        float _1448 = _1442 * _1410;
        float _1450 = _1448 * 0.25;
        float _1452 = _1436 * _1444;
        float _1454 = _1440 * _1444;
        float _1456 = exp2(_1428);
        float _1458 = _1438 * _1444;
        float _1460 = fma(_1450, (*spvDescriptorSet0.fp_c5)._m0[4].x, _1452);
        float _1462 = fma(_1450, (*spvDescriptorSet0.fp_c5)._m0[4].z, _1454);
        float _1464 = spvFAdd(_1268, 0.3300000131130218505859375);
        float _1466 = fma(_1450, (*spvDescriptorSet0.fp_c5)._m0[4].y, _1458);
        float _1468 = spvFAdd(_1268, 0.04500000178813934326171875);
        float _1470 = _1434 * 0.0405845083296298980712890625;
        float _1472 = _1370 * 0.079577468335628509521484375;
        float _1474 = _1218 * _1264;
        float _1476 = 1.0 / _1464;
        float _1478 = _1264 * (*spvDescriptorSet0.fp_c5)._m0[4].y;
        float _1480 = fma(_1470, _1372, _1472);
        float _1482 = _1474 * 0.079577468335628509521484375;
        float _1484 = fma(_1470, _1394, _1420);
        float _1486 = _1268 * _1480;
        float _1488 = fma(_1470, _1478, _1482);
        float _1490 = 1.0 / _1446;
        float _1492 = -_1456;
        float _1494 = _1492 + 1.0;
        float _1496 = _1268 * _1488;
        float _1498 = _1268 * _1484;
        float _1500 = _1494 * (*spvDescriptorSet0.fp_c5)._m0[14].z;
        float _1502 = 1.0 / _1468;
        float _1504 = fma(_1486, _1476, _1460);
        float _1506 = -_1500;
        float _1508 = _1506 + 1.0;
        float _1510 = fma(_1498, _1490, _1462);
        float _1512 = fma(_1496, _1502, _1466);
        float _1514 = _1358 * _1280;
        float _1516 = _1346 + _1276;
        float _1518 = _1344 + _1274;
        float _1520 = _1348 + _1278;
        float _1522 = _1514 * _1270;
        float _1524 = fma(_1358, _1516, _1354);
        float _1526 = fma(_1358, _1518, _1352);
        float _1528 = fma(_1358, _1520, _1356);
        float _1530 = _1522 * _1500;
        float _1532 = _1514 * _1508;
        float _1534 = fma(_1362, _1530, _1526);
        float _1536 = fma(_1364, _1530, _1524);
        float _1538 = fma(_1366, _1530, _1528);
        float _1540 = fma(_1504, _1532, _1534);
        float _1542 = fma(_1512, _1532, _1536);
        float _1544 = fma(_1510, _1532, _1538);
        _303 = as_type<int>(_1540);
        _305 = as_type<int>(_1542);
        _307 = as_type<int>(_1544);
        _154 = as_type<int>(_1524);
        _156 = as_type<int>(_1510);
        _158 = as_type<int>(_1532);
    }
    int _1546 = _303;
    int _1548 = _305;
    int _1550 = _307;
    int _1552 = _154;
    int _1554 = _156;
    int _1556 = _158;
    bool _1558 = _226 > 0.0;
    bool _1560 = isnan(_226);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan(0.0);
    bool _1566 = _1562 || _1564;
    int _1568 = _1552;
    int _1570 = _1554;
    int _1572 = _1556;
    if (_1566)
    {
        _1568 = _1546;
    }
    int _1574 = _1568;
    if (_1566)
    {
        _1570 = _1548;
    }
    int _1576 = _1570;
    if (_1566)
    {
        _1572 = _1550;
    }
    int _1578 = _1572;
    if (_1566)
    {
        out.m_64.x = as_type<float>(_1574);
        out.m_64.y = as_type<float>(_1576);
        out.m_64.z = as_type<float>(_1578);
        out.m_64.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_64)};
    }
    float _1580 = in.m_61.x;
    float _1582 = gl_FragCoord.w;
    float _1584 = _1580 * _1582;
    float _1586 = in.m_61.y;
    float _1588 = gl_FragCoord.w;
    float _1590 = _1586 * _1588;
    float _1592 = _91 * _1584;
    float _1594 = _91 * _1590;
    float2 _4013 = float2(_1592, _1594);
    float2 _1596 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_4013, float2(0.0), isnan(_4013))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_4013, float2(0.0), isnan(_4013))).xy;
    float _1598 = _1596.x;
    float _1600 = _1596.y;
    float _1602 = fma(_1598, 2.0, -1.0);
    float _1604 = fma(_1600, 2.0, -1.0);
    float _1606 = fma(_1602, (*spvDescriptorSet0.fp_c6)._m0[0].x, _1592);
    float _1608 = fma(_1604, (*spvDescriptorSet0.fp_c6)._m0[0].y, _1594);
    float2 _4039 = float2(_1606, _1608);
    float4 _1610 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4039, float2(0.0), isnan(_4039))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4039, float2(0.0), isnan(_4039))).xyzw;
    float _1612 = _1610.x;
    float _1614 = _1610.y;
    float _1616 = _1610.z;
    float _1618 = _1610.w;
    float _1620 = fma(_1618, as_type<float>(_1546), _1612);
    float _1622 = fma(_1618, as_type<float>(_1548), _1614);
    float _1624 = fma(_1618, as_type<float>(_1550), _1616);
    out.m_64.x = _1620;
    out.m_64.y = _1622;
    out.m_64.z = _1624;
    out.m_64.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_64)};
}

