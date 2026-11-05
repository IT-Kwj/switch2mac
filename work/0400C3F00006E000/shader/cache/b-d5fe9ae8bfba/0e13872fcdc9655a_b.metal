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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
    float4 m_58 [[color(1)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_47.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_47.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float _85 = _81 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1291 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1291, float2(0.0), isnan(_1291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1291, float2(0.0), isnan(_1291))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1306 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1306, float2(0.0), isnan(_1306))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1306, float2(0.0), isnan(_1306))).x;
    float2 _1314 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1314, float2(0.0), isnan(_1314))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1314, float2(0.0), isnan(_1314))).x;
    float2 _1322 = float2(_81, _83);
    float4 _96 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1322, float2(0.0), isnan(_1322)), int2(0), component::x).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float2 _1338 = float2(_81, _83);
    float4 _106 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1338, float2(0.0), isnan(_1338)), int2(0), component::w).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_49.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_51.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_49.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_51.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_53.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_53.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _79 * _120;
    float _154 = _79 * _126;
    float _156 = _79 * _132;
    float _158 = _79 * _138;
    float _160 = _79 * _144;
    float _162 = _79 * _150;
    float _164 = -_87;
    float _166 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _168 = -_91;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _172 = -_93;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _176 = 1.0 / _166;
    float _178 = 1.0 / _174;
    float _180 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _182 = _176 * _180;
    float _184 = 1.0 / _170;
    float _186 = _182 * _152;
    float _188 = _182 * _156;
    float _190 = _186 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _194 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[32].x, _190);
    float _196 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[30].x, _192);
    float _198 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _200 = _178 * _198;
    float _202 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[32].z, _194);
    float _204 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[30].z, _196);
    float _206 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _208 = _184 * _206;
    float _210 = -_186;
    float _212 = fma(_200, _162, _210);
    float _214 = _202 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _216 = _204 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _218 = -_182;
    float _220 = _218 + _208;
    float _222 = -_188;
    float _224 = fma(_200, _160, _222);
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _228 = _214 + _226;
    float _230 = -_186;
    float _232 = fma(_208, _158, _230);
    float _234 = -_182;
    float _236 = _234 + _200;
    float _238 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _240 = _216 + _238;
    float _242 = _228 * _228;
    float _244 = -_188;
    float _246 = fma(_208, _154, _244);
    float _248 = _220 * _224;
    float _250 = _232 * _236;
    float _252 = fma(_240, _240, _242);
    float _254 = -_248;
    float _256 = fma(_246, _236, _254);
    float _258 = -_250;
    float _260 = fma(_220, _212, _258);
    float _262 = _246 * _212;
    float _264 = sqrt(_252);
    float _266 = _256 * _256;
    float _268 = -_262;
    float _270 = fma(_232, _224, _268);
    float _272 = fma(_260, _260, _266);
    float _274 = _186 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _276 = fma(_270, _270, _272);
    float _278 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[31].x, _274);
    float _280 = rsqrt(_276);
    float _282 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[31].z, _278);
    bool _286 = _264 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _288 = _282 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _290 = _260 * _280;
    float _292 = _256 * _280;
    float _294 = _270 * _280;
    float _296 = _280;
    float _298 = _216;
    float _300 = _214;
    if (!_286)
    {
        _296 = _288;
    }
    float _302 = _296;
    bool _304 = !_286;
    float _306 = _302;
    if (!_304)
    {
        float _308 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _310 = _264 + _308;
        float _312 = _288 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _314 = rsqrt(_252);
        float _316 = -_288;
        float _318 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _320 = _316 + _318;
        float _322 = abs(_312);
        float _324 = abs(_310);
        float _326 = precise::max(_322, _324);
        float _328 = _320 * _320;
        bool _330 = _326 >= 16.0;
        float _332 = _240 * _314;
        float _334 = _228 * _314;
        float _336 = -_240;
        float _338 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[41].z, _336);
        float _340 = _310;
        float _342 = _312;
        if (_330)
        {
            float _344 = _310 * 0.0625;
            _340 = _344;
        }
        float _346 = _340;
        if (_330)
        {
            float _348 = _312 * 0.0625;
            _342 = _348;
        }
        float _350 = _342;
        float _352 = -_228;
        float _354 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[41].z, _352);
        float _356 = fma(_338, _338, _328);
        float _358 = abs(_346);
        bool _360 = _358 != 0.0;
        bool _362 = isnan(_358);
        bool _364 = _360 || _362;
        bool _366 = isnan(0.0);
        bool _368 = _364 || _366;
        float _370 = fma(_354, _354, _356);
        float _372 = abs(_350);
        bool _374 = _372 == 0.0;
        float _376 = abs(_350);
        bool _378 = _376 == 0.0;
        bool _380 = !_368;
        bool _382 = _378 && _380;
        float _384 = sqrt(_370);
        bool _386 = false;
        int _389 = as_type<int>(_356);
        if (_382)
        {
            bool _391 = as_type<int>(_350) >= 0;
            _386 = _391;
        }
        bool _393 = _386;
        int _395 = _393 ? (-1) : 0;
        if (_382)
        {
            int _397 = _393 ? 0 : 1078530011;
            _389 = _397;
        }
        int _399 = _389;
        int _401 = _399;
        if (_382)
        {
            int _403 = int(0x80000000) & as_type<int>(_346);
            int _405 = _399 | _403;
            _401 = _405;
        }
        int _407 = _401;
        bool _409 = !_368;
        bool _411 = _409 && _374;
        int _413 = _407;
        float _415 = as_type<float>(_407);
        if (!_411)
        {
            float _417 = abs(_346);
            bool _419 = _417 != as_type<float>(0x7f800000u /* inf */);
            bool _421 = isnan(_417);
            bool _423 = _419 || _421;
            bool _425 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _427 = _423 || _425;
            float _429 = abs(_350);
            bool _431 = _429 == as_type<float>(0x7f800000u /* inf */);
            float _433 = abs(_350);
            bool _435 = _433 == as_type<float>(0x7f800000u /* inf */);
            bool _437 = !_427;
            bool _439 = _435 && _437;
            if (_439)
            {
                bool _441 = as_type<int>(_350) >= 0;
                _395 = _441 ? (-1) : 0;
            }
            int _443 = _395;
            if (_439)
            {
                _413 = 1075235812;
            }
            int _445 = _413;
            int _447 = _445;
            if (_439)
            {
                int _449 = ~_443;
                int _451 = (_449 != 0) ? _445 : 1061752795;
                _447 = _451;
            }
            int _453 = _447;
            float _455 = as_type<float>(_453);
            if (_439)
            {
                int _457 = int(0x80000000) & as_type<int>(_346);
                int _459 = _453 | _457;
                _455 = as_type<float>(_459);
            }
            float _461 = _455;
            bool _463 = !_427;
            bool _465 = _463 && _431;
            _415 = _461;
            if (!_465)
            {
                float _467 = abs(_346);
                float _469 = abs(_350);
                float _471 = precise::max(_467, _469);
                float _473 = abs(_346);
                float _475 = abs(_350);
                float _477 = precise::min(_473, _475);
                float _479 = 1.0 / _471;
                float _481 = abs(_346);
                float _483 = abs(_350);
                bool _485 = _481 > _483;
                bool _487 = as_type<int>(_350) >= 0;
                float _489 = abs(_346);
                float _491 = abs(_350);
                float _493 = _489 + _491;
                int _495 = as_type<int>(_346) & int(0x80000000);
                bool _497 = _493 > as_type<float>(0x7f800000u /* inf */);
                bool _499 = isnan(_493);
                bool _501 = _497 || _499;
                bool _503 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _505 = _501 || _503;
                float _507 = _477 * _479;
                float _509 = _507 * _507;
                float _511 = _509 + 11.33538818359375;
                float _513 = fma(_509, _511, 28.84246826171875);
                float _515 = fma(_509, _513, 19.6966705322265625);
                float _517 = fma(_509, -0.82336294651031494140625, -5.674867153167724609375);
                float _519 = fma(_509, _517, -6.565555095672607421875);
                float _521 = 1.0 / _515;
                float _523 = _509 * _519;
                float _525 = _507 * _523;
                float _527 = fma(_525, _521, _507);
                float _529 = _527;
                _415 = _493;
                if (_485)
                {
                    float _531 = -_527;
                    float _533 = _531 + 1.57079637050628662109375;
                    _529 = _533;
                }
                float _535 = _529;
                int _537 = as_type<int>(_535);
                if (!_487)
                {
                    float _539 = -_535;
                    float _541 = _539 + 3.1415927410125732421875;
                    _537 = as_type<int>(_541);
                }
                int _543 = _537;
                if (!_505)
                {
                    int _545 = _495 | _543;
                    _415 = as_type<float>(_545);
                }
            }
        }
        float _547 = _415;
        float _549 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _551 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _553 = _384 + _551;
        float _555 = fma(_332, _549, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _557 = fma(_334, _549, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _306 = _553;
        _298 = _555;
        _300 = _557;
    }
    float _559 = _306;
    float _561 = _298;
    float _563 = _300;
    float _565 = _292 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _567 = _559 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _569 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[35].x, _565);
    float _571 = fma(_561, (*spvDescriptorSet0.fp_c5)._m0[102].x, _567);
    float _573 = fma(_294, (*spvDescriptorSet0.fp_c3)._m0[35].z, _569);
    float _575 = fma(_563, (*spvDescriptorSet0.fp_c5)._m0[102].z, _571);
    float _577 = -_573;
    float _579 = fma(_577, _573, 1.0);
    float _581 = -_573;
    float _583 = fma(_581, (*spvDescriptorSet0.fp_c3)._m0[35].z, _294);
    float _585 = -_573;
    float _587 = fma(_585, (*spvDescriptorSet0.fp_c3)._m0[35].y, _292);
    float _589 = _575 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _591 = _579 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _593 = trunc(_589);
    int _595 = int(_593);
    float _597 = fma(_583, _591, _182);
    float _599 = fma(_587, _591, _186);
    float _601 = -_597;
    bool _603 = _601 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _605 = float(_603);
    float _607 = -_597;
    bool _609 = _607 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _611 = float(_609);
    float _613 = _605 + _611;
    int _615 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _617 = _595 + _615;
    int _619 = _617 + 1;
    float _621 = precise::min(_613, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _623 = _559 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _625 = trunc(_621);
    int _627 = int(_625);
    float _629 = fma(_561, (*spvDescriptorSet0.fp_c5)._m0[101].x, _623);
    float _631 = fma(_563, (*spvDescriptorSet0.fp_c5)._m0[101].z, _629);
    float _633 = -_573;
    float _635 = fma(_633, (*spvDescriptorSet0.fp_c3)._m0[35].x, _290);
    float _637 = _631 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _639 = fma(_635, _591, _188);
    float _641 = trunc(_637);
    int _643 = int(_641);
    int _645 = _627 << 6;
    int _647 = _645 + 48;
    uint _650 = uint(int(uint(_647) >> uint(2)));
    uint _652 = uint(int(uint(int(_650)) >> uint(2)));
    int _654 = int(_650) & 3;
    float _656 = (*spvDescriptorSet0.fp_c3)._m0[int(_652)][_654];
    int _658 = int(_650) + 1;
    uint _660 = uint(int(uint(_658) >> uint(2)));
    int _662 = _658 & 3;
    float _664 = (*spvDescriptorSet0.fp_c3)._m0[int(_660)][_662];
    int _666 = _645 + 56;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
    int _672 = int(_668) & 3;
    float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
    int _676 = int(_668) + 1;
    uint _678 = uint(int(uint(_676) >> uint(2)));
    int _680 = _676 & 3;
    float _682 = (*spvDescriptorSet0.fp_c3)._m0[int(_678)][_680];
    int _684 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _686 = _643 + _684;
    int _688 = _686 + 1;
    bool _690 = _688 >= 0;
    int _692 = _645 + 16;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.fp_c3)._m0[int(_696)][_698];
    int _702 = int(_694) + 1;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    int _706 = _702 & 3;
    float _708 = (*spvDescriptorSet0.fp_c3)._m0[int(_704)][_706];
    bool _710 = _688 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _712 = !_690;
    bool _714 = _710 || _712;
    bool _716 = _619 < 0;
    bool _718 = _716 || _714;
    int _720 = _645 + 32;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.fp_c3)._m0[int(_724)][_726];
    int _730 = int(_722) + 1;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    int _734 = _730 & 3;
    float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
    bool _738 = _619 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _740 = _738 || _718;
    uint _742 = uint(int(uint(_645) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    int _758 = _688;
    int _760 = _619;
    if (!_740)
    {
        int _762 = _619 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _764 = _762 + _688;
        _758 = _764;
    }
    int _766 = _758;
    float _768 = 0.0;
    if (!_740)
    {
        float _770 = floor(_637);
        _768 = _770;
    }
    float _772 = _768;
    if (!_740)
    {
        int _774 = _766 << 2;
        _760 = _774;
    }
    int _776 = _760;
    int _778 = _776;
    if (!_740)
    {
        int _780 = 12 & _776;
        _778 = _780;
    }
    int _782 = _778;
    float _784 = _599 * _664;
    float _786 = fma(_639, _656, _784);
    float _788 = _772;
    if (!_740)
    {
        float _790 = -_772;
        float _792 = _637 + _790;
        _788 = _792;
    }
    float _794 = _788;
    float _796 = fma(_597, _674, _786);
    float _798 = _796 + _682;
    int _800 = _645 + 24;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    uint _804 = uint(int(uint(int(_802)) >> uint(2)));
    int _806 = int(_802) & 3;
    float _808 = (*spvDescriptorSet0.fp_c3)._m0[int(_804)][_806];
    int _810 = int(_802) + 1;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    int _814 = _810 & 3;
    float _816 = (*spvDescriptorSet0.fp_c3)._m0[int(_812)][_814];
    float _818 = _599 * _708;
    float _820 = 1.0 / _798;
    float _822 = fma(_639, _700, _818);
    float _824 = _599 * _736;
    int _826 = as_type<int>(_736);
    if (!_740)
    {
        int _828 = _766 >> 2;
        _826 = _828;
    }
    int _830 = _826;
    float _832 = rint(_621);
    float _834 = precise::max(_832, 0.0);
    uint _836 = uint(_834);
    uint _838 = clamp(_836, 0u, 65535u);
    float _840 = fma(_639, _728, _824);
    int _842 = _830;
    if (!_740)
    {
        int _844 = _830 << 4;
        int _846 = _844 + _782;
        _842 = _846;
    }
    int _848 = _842;
    float _850 = _599 * _756;
    float _852 = 0.0;
    if (!_740)
    {
        uint _854 = uint(int(uint(_848) >> uint(2)));
        uint _856 = uint(int(uint(int(_854)) >> uint(2)));
        int _858 = int(_854) & 3;
        float _860 = (*spvDescriptorSet0.fp_c5)._m0[int(_856)][_858];
        _852 = _860;
    }
    float _862 = _852;
    float _864 = _728;
    if (!_740)
    {
        float _866 = floor(_589);
        _864 = _866;
    }
    float _868 = _864;
    float _870 = fma(_639, _748, _850);
    int _872 = _645 + 8;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    uint _876 = uint(int(uint(int(_874)) >> uint(2)));
    int _878 = int(_874) & 3;
    float _880 = (*spvDescriptorSet0.fp_c3)._m0[int(_876)][_878];
    int _882 = int(_874) + 1;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    int _886 = _882 & 3;
    float _888 = (*spvDescriptorSet0.fp_c3)._m0[int(_884)][_886];
    int _890 = _645 + 40;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    uint _894 = uint(int(uint(int(_892)) >> uint(2)));
    int _896 = int(_892) & 3;
    float _898 = (*spvDescriptorSet0.fp_c3)._m0[int(_894)][_896];
    int _900 = int(_892) + 1;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    int _904 = _900 & 3;
    float _906 = (*spvDescriptorSet0.fp_c3)._m0[int(_902)][_904];
    float _908 = _868;
    if (!_740)
    {
        float _910 = -_868;
        float _912 = _589 + _910;
        _908 = _912;
    }
    float _914 = _908;
    float _916 = fma(_597, _808, _822);
    float _918 = _916 + _816;
    float _920 = as_type<float>(_782);
    if (!_740)
    {
        float _922 = rint(_862);
        float _924 = precise::max(_922, 0.0);
        uint _926 = uint(_924);
        uint _928 = clamp(_926, 0u, 65535u);
        _920 = as_type<float>(_928);
    }
    float _930 = _920;
    float _932 = fma(_597, _880, _870);
    float _934 = _918 * _820;
    float _936 = _932 + _888;
    float _938 = fma(_597, _898, _840);
    float _940 = _936 * _820;
    float _942 = _938 + _906;
    float _944 = _942 * _820;
    float _946 = precise::clamp(_944, 0.0, 1.0);
    float3 _2668 = float3(_940, _934, float(int(_838)));
    float3 _2672 = select(_2668, float3(0.0), isnan(_2668));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2672.xy, uint(rint(_2672.z)), _946);
    float _950 = _914;
    if (!_740)
    {
        float3 _2685 = float3(_794, _914, float(as_type<int>(_930)));
        float3 _2687 = select(_2685, float3(0.0), isnan(_2685));
        float _952 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2687.xy, uint(rint(_2687.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2687.xy, uint(rint(_2687.z)), level(0.0)).x;
        _950 = _952;
    }
    float _954 = _950;
    float _956 = precise::min(_182, -1.0000000116860974230803549289703e-07);
    float _958 = -_98;
    float _960 = fma(_958, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _962 = -_100;
    float _964 = fma(_962, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _966 = -_102;
    float _968 = fma(_966, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _970 = -_104;
    float _972 = fma(_970, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _974 = 1.0 / _960;
    float _976 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _978 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _980 = 1.0 / _964;
    float _982 = 1.0 / _956;
    float _984 = 1.0 / _968;
    float _986 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _988 = -_182;
    float _990 = fma(_974, _986, _988);
    float _992 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _994 = -_182;
    float _996 = fma(_980, _992, _994);
    float _998 = 1.0 / _972;
    float _1000 = _982 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _1002 = abs(_990);
    float _1004 = _1002 * _1000;
    float _1006 = abs(_996);
    float _1008 = _1006 * _1000;
    float _1010 = floor(_976);
    float _1012 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1014 = -_182;
    float _1016 = fma(_984, _1012, _1014);
    float _1018 = abs(_1016);
    float _1020 = _1018 * _1000;
    float _1022 = floor(_978);
    float _1024 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1026 = -_182;
    float _1028 = fma(_998, _1024, _1026);
    float _1030 = abs(_1028);
    float _1032 = _1030 * _1000;
    float _1034 = exp2(_1004);
    float _1036 = -_1010;
    float _1038 = _976 + _1036;
    float _1040 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1042 = _1038 + _1040;
    float _1044 = exp2(_1008);
    float _1046 = -_1022;
    float _1048 = _978 + _1046;
    float _1050 = -_1042;
    float _1052 = _1050 + 1.0;
    float _1054 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1056 = _1048 + _1054;
    float _1058 = exp2(_1020);
    float _1060 = _1042 * _1056;
    float _1062 = -_1056;
    float _1064 = _1062 + 1.0;
    float _1066 = _1056 * _1052;
    float _1068 = _1042 * _1064;
    float _1070 = abs(_1066);
    float _1072 = _1070 * _1034;
    float _1074 = exp2(_1032);
    float _1076 = abs(_1060);
    float _1078 = _1076 * _1044;
    float _1080 = _1052 * _1064;
    float _1082 = _1072 + _1078;
    float _1084 = abs(_1068);
    float _1086 = _1084 * _1058;
    float _1088 = _1086 + _1082;
    float _1090 = abs(_1080);
    float _1092 = _1090 * _1074;
    float _1094 = _1092 + _1088;
    float _1096 = -_1092;
    bool _1098 = _1088 != _1096;
    bool _1100 = isnan(_1088);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(_1096);
    bool _1106 = _1102 || _1104;
    float _1108 = 1.0 / _1094;
    float _1110 = _1078 * _1108;
    float _1112 = _1072 * _1108;
    float _1114 = _1086 * _1108;
    float _1116 = _1092 * _1108;
    float _1118 = _1106 ? _1110 : 0.25;
    float _1120 = _1106 ? _1112 : 0.25;
    float _1122 = _1106 ? _1114 : 0.25;
    float _1124 = _1118 * _110;
    float _1126 = _1106 ? _1116 : 0.25;
    float _1128 = fma(_1120, _108, _1124);
    float _1130 = _1120;
    if (_740)
    {
        _1130 = 1.0;
    }
    float _1132 = _1130;
    float _1134 = fma(_1122, _112, _1128);
    float _1136 = fma(_1126, _114, _1134);
    float _1138 = _1132;
    if (!_740)
    {
        int _1140 = _766 << 4;
        int _1142 = _1140 + 1648;
        int _1144 = _848 + 8048;
        uint _1146 = uint(int(uint(_1144) >> uint(2)));
        uint _1148 = uint(int(uint(int(_1146)) >> uint(2)));
        int _1150 = int(_1146) & 3;
        float _1152 = (*spvDescriptorSet0.fp_c5)._m0[int(_1148)][_1150];
        uint _1154 = uint(int(uint(_1142) >> uint(2)));
        uint _1156 = uint(int(uint(int(_1154)) >> uint(2)));
        int _1158 = int(_1154) & 3;
        float _1160 = (*spvDescriptorSet0.fp_c5)._m0[int(_1156)][_1158];
        int _1162 = int(_1154) + 1;
        uint _1164 = uint(int(uint(_1162) >> uint(2)));
        int _1166 = _1162 & 3;
        float _1168 = (*spvDescriptorSet0.fp_c5)._m0[int(_1164)][_1166];
        int _1170 = _1142 + 8;
        uint _1172 = uint(int(uint(_1170) >> uint(2)));
        uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
        int _1176 = int(_1172) & 3;
        float _1178 = (*spvDescriptorSet0.fp_c5)._m0[int(_1174)][_1176];
        int _1180 = int(_1172) + 1;
        uint _1182 = uint(int(uint(_1180) >> uint(2)));
        int _1184 = _1180 & 3;
        float _1186 = (*spvDescriptorSet0.fp_c5)._m0[int(_1182)][_1184];
        float _1188 = 1.0 / _1152;
        float _1190 = _559 * _1168;
        float _1192 = fma(_561, _1160, _1190);
        float _1194 = fma(_563, _1178, _1192);
        float _1196 = _1194 + _1186;
        float _1198 = precise::clamp(_1196, 0.0, 1.0);
        float _1200 = -_1198;
        float _1202 = _1200 + _954;
        float _1204 = _1152 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1206 = fma(_1188, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1202);
        float _1208 = _1204 * _1206;
        float _1210 = exp2(_1208);
        float _1212 = 0.0 + _1210;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        _1138 = _1214;
    }
    float _1216 = _1138;
    float _1218 = precise::min(_1216, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1220 = -_182;
    float _1222 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1224 = _1220 + _1222;
    float _1226 = -_182;
    float _1228 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1230 = _1226 + _1228;
    float _1232 = -_948;
    float _1234 = _1232 + 1.0;
    float _1236 = _1224 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1238 = precise::clamp(_1236, 0.0, 1.0);
    float _1240 = _1230 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1242 = precise::clamp(_1240, 0.0, 1.0);
    float _1244 = -_1218;
    float _1246 = _1244 + 1.0;
    float _1248 = precise::min(_1136, 1.0);
    float _1250 = fma(_1238, _1234, _948);
    float _1252 = fma(_1242, _1246, _1218);
    out.m_56.x = _1250;
    out.m_56.y = _1252;
    out.m_56.z = _1248;
    out.m_56.w = 1.0;
    out.m_58.x = 1.0;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

