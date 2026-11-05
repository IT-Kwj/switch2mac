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
    float2 _1275 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1275, float2(0.0), isnan(_1275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1275, float2(0.0), isnan(_1275))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1290 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1290, float2(0.0), isnan(_1290))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1290, float2(0.0), isnan(_1290))).x;
    float2 _1298 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1298, float2(0.0), isnan(_1298))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1298, float2(0.0), isnan(_1298))).x;
    float2 _1306 = float2(_81, _83);
    float4 _96 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1306, float2(0.0), isnan(_1306)), int2(0), component::x).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float2 _1322 = float2(_81, _83);
    float4 _106 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1322, float2(0.0), isnan(_1322)), int2(0), component::w).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_49.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_49.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_51.x;
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
    float _158 = _79 * _144;
    float _160 = -_87;
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _164 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[41].x, _162);
    float _166 = -_91;
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _170 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[41].x, _168);
    float _172 = _164 * _152;
    float _174 = _164 * _154;
    float _176 = _79 * _138;
    float _178 = _79 * _150;
    float _180 = _172 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _182 = _172 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _184 = -_174;
    float _186 = fma(_170, _156, _184);
    float _188 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[32].x, _180);
    float _190 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[30].x, _182);
    float _192 = -_93;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _196 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[41].x, _194);
    float _198 = -_172;
    float _200 = fma(_170, _176, _198);
    float _202 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[32].z, _188);
    float _204 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[30].z, _190);
    float _206 = -_164;
    float _208 = _206 + _170;
    float _210 = -_172;
    float _212 = fma(_196, _178, _210);
    float _214 = _202 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _216 = _204 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _218 = -_174;
    float _220 = fma(_196, _158, _218);
    float _222 = -_164;
    float _224 = _222 + _196;
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _228 = _214 + _226;
    float _230 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _232 = _216 + _230;
    float _234 = _208 * _220;
    float _236 = _200 * _224;
    float _238 = _228 * _228;
    float _240 = -_234;
    float _242 = fma(_186, _224, _240);
    float _244 = _186 * _212;
    float _246 = fma(_232, _232, _238);
    float _248 = -_236;
    float _250 = fma(_208, _212, _248);
    float _252 = _242 * _242;
    float _254 = -_244;
    float _256 = fma(_200, _220, _254);
    float _258 = sqrt(_246);
    float _260 = _172 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _262 = fma(_250, _250, _252);
    float _264 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[31].x, _260);
    float _266 = fma(_256, _256, _262);
    float _268 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[31].z, _264);
    float _270 = rsqrt(_266);
    float _272 = _268 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _276 = _258 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _278 = _250 * _270;
    float _280 = _242 * _270;
    float _282 = _256 * _270;
    bool _284 = !_276;
    float _286 = _272;
    float _288 = _216;
    float _290 = _214;
    if (!_284)
    {
        float _292 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _294 = _258 + _292;
        float _296 = _272 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _298 = rsqrt(_246);
        float _300 = -_272;
        float _302 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _304 = _300 + _302;
        float _306 = abs(_296);
        float _308 = abs(_294);
        float _310 = precise::max(_306, _308);
        float _312 = _304 * _304;
        bool _314 = _310 >= 16.0;
        float _316 = _232 * _298;
        float _318 = _228 * _298;
        float _320 = -_232;
        float _322 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[41].z, _320);
        float _324 = _294;
        float _326 = _296;
        if (_314)
        {
            float _328 = _294 * 0.0625;
            _324 = _328;
        }
        float _330 = _324;
        if (_314)
        {
            float _332 = _296 * 0.0625;
            _326 = _332;
        }
        float _334 = _326;
        float _336 = -_228;
        float _338 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[41].z, _336);
        float _340 = fma(_322, _322, _312);
        float _342 = abs(_330);
        bool _344 = _342 != 0.0;
        bool _346 = isnan(_342);
        bool _348 = _344 || _346;
        bool _350 = isnan(0.0);
        bool _352 = _348 || _350;
        float _354 = fma(_338, _338, _340);
        float _356 = abs(_334);
        bool _358 = _356 == 0.0;
        float _360 = abs(_334);
        bool _362 = _360 == 0.0;
        bool _364 = !_352;
        bool _366 = _362 && _364;
        float _368 = sqrt(_354);
        bool _370 = false;
        int _373 = as_type<int>(_340);
        if (_366)
        {
            bool _375 = as_type<int>(_334) >= 0;
            _370 = _375;
        }
        bool _377 = _370;
        int _379 = _377 ? (-1) : 0;
        if (_366)
        {
            int _381 = _377 ? 0 : 1078530011;
            _373 = _381;
        }
        int _383 = _373;
        int _385 = _383;
        if (_366)
        {
            int _387 = int(0x80000000) & as_type<int>(_330);
            int _389 = _383 | _387;
            _385 = _389;
        }
        int _391 = _385;
        bool _393 = !_352;
        bool _395 = _393 && _358;
        int _397 = _391;
        float _399 = as_type<float>(_391);
        if (!_395)
        {
            float _401 = abs(_330);
            bool _403 = _401 != as_type<float>(0x7f800000u /* inf */);
            bool _405 = isnan(_401);
            bool _407 = _403 || _405;
            bool _409 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _411 = _407 || _409;
            float _413 = abs(_334);
            bool _415 = _413 == as_type<float>(0x7f800000u /* inf */);
            float _417 = abs(_334);
            bool _419 = _417 == as_type<float>(0x7f800000u /* inf */);
            bool _421 = !_411;
            bool _423 = _419 && _421;
            if (_423)
            {
                bool _425 = as_type<int>(_334) >= 0;
                _379 = _425 ? (-1) : 0;
            }
            int _427 = _379;
            if (_423)
            {
                _397 = 1075235812;
            }
            int _429 = _397;
            int _431 = _429;
            if (_423)
            {
                int _433 = ~_427;
                int _435 = (_433 != 0) ? _429 : 1061752795;
                _431 = _435;
            }
            int _437 = _431;
            float _439 = as_type<float>(_437);
            if (_423)
            {
                int _441 = int(0x80000000) & as_type<int>(_330);
                int _443 = _437 | _441;
                _439 = as_type<float>(_443);
            }
            float _445 = _439;
            bool _447 = !_411;
            bool _449 = _447 && _415;
            _399 = _445;
            if (!_449)
            {
                float _451 = abs(_330);
                float _453 = abs(_334);
                float _455 = precise::max(_451, _453);
                float _457 = abs(_330);
                float _459 = abs(_334);
                float _461 = precise::min(_457, _459);
                float _463 = 1.0 / _455;
                float _465 = abs(_330);
                float _467 = abs(_334);
                bool _469 = _465 > _467;
                bool _471 = as_type<int>(_334) >= 0;
                float _473 = _461 * _463;
                float _475 = abs(_330);
                float _477 = abs(_334);
                float _479 = _475 + _477;
                int _481 = as_type<int>(_330) & int(0x80000000);
                float _483 = _473 * _473;
                bool _485 = _479 > as_type<float>(0x7f800000u /* inf */);
                bool _487 = isnan(_479);
                bool _489 = _485 || _487;
                bool _491 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _493 = _489 || _491;
                float _495 = _483 + 11.33538818359375;
                float _497 = fma(_483, _495, 28.84246826171875);
                float _499 = fma(_483, _497, 19.6966705322265625);
                float _501 = fma(_483, -0.82336294651031494140625, -5.674867153167724609375);
                float _503 = fma(_483, _501, -6.565555095672607421875);
                float _505 = 1.0 / _499;
                float _507 = _483 * _503;
                float _509 = _473 * _507;
                float _511 = fma(_509, _505, _473);
                float _513 = _511;
                _399 = _479;
                if (_469)
                {
                    float _515 = -_511;
                    float _517 = _515 + 1.57079637050628662109375;
                    _513 = _517;
                }
                float _519 = _513;
                int _521 = as_type<int>(_519);
                if (!_471)
                {
                    float _523 = -_519;
                    float _525 = _523 + 3.1415927410125732421875;
                    _521 = as_type<int>(_525);
                }
                int _527 = _521;
                if (!_493)
                {
                    int _529 = _481 | _527;
                    _399 = as_type<float>(_529);
                }
            }
        }
        float _531 = _399;
        float _533 = fma(_531, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _535 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _537 = _368 + _535;
        float _539 = fma(_316, _533, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _541 = fma(_318, _533, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _286 = _537;
        _288 = _539;
        _290 = _541;
    }
    float _543 = _286;
    float _545 = _288;
    float _547 = _290;
    float _549 = _280 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _551 = _543 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _553 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[35].x, _549);
    float _555 = fma(_545, (*spvDescriptorSet0.fp_c5)._m0[102].x, _551);
    float _557 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[35].z, _553);
    float _559 = fma(_547, (*spvDescriptorSet0.fp_c5)._m0[102].z, _555);
    float _561 = -_557;
    float _563 = fma(_561, _557, 1.0);
    float _565 = -_557;
    float _567 = fma(_565, (*spvDescriptorSet0.fp_c3)._m0[35].z, _282);
    float _569 = _559 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _571 = -_557;
    float _573 = fma(_571, (*spvDescriptorSet0.fp_c3)._m0[35].y, _280);
    float _575 = _563 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _577 = -_557;
    float _579 = fma(_577, (*spvDescriptorSet0.fp_c3)._m0[35].x, _278);
    float _581 = trunc(_569);
    int _583 = int(_581);
    float _585 = fma(_567, _575, _164);
    float _587 = fma(_573, _575, _172);
    float _589 = fma(_579, _575, _174);
    float _591 = -_585;
    bool _593 = _591 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _595 = float(_593);
    float _597 = -_585;
    bool _599 = _597 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _601 = float(_599);
    float _603 = _595 + _601;
    int _605 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _607 = _583 + _605;
    int _609 = _607 + 1;
    float _611 = precise::min(_603, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _613 = _543 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _615 = trunc(_611);
    int _617 = int(_615);
    float _619 = fma(_545, (*spvDescriptorSet0.fp_c5)._m0[101].x, _613);
    float _621 = fma(_547, (*spvDescriptorSet0.fp_c5)._m0[101].z, _619);
    float _623 = _621 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _625 = trunc(_623);
    int _627 = int(_625);
    int _629 = _617 << 6;
    int _631 = _629 + 48;
    uint _634 = uint(int(uint(_631) >> uint(2)));
    uint _636 = uint(int(uint(int(_634)) >> uint(2)));
    int _638 = int(_634) & 3;
    float _640 = (*spvDescriptorSet0.fp_c3)._m0[int(_636)][_638];
    int _642 = int(_634) + 1;
    uint _644 = uint(int(uint(_642) >> uint(2)));
    int _646 = _642 & 3;
    float _648 = (*spvDescriptorSet0.fp_c3)._m0[int(_644)][_646];
    int _650 = _629 + 56;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    uint _654 = uint(int(uint(int(_652)) >> uint(2)));
    int _656 = int(_652) & 3;
    float _658 = (*spvDescriptorSet0.fp_c3)._m0[int(_654)][_656];
    int _660 = int(_652) + 1;
    uint _662 = uint(int(uint(_660) >> uint(2)));
    int _664 = _660 & 3;
    float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
    int _668 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _670 = _627 + _668;
    int _672 = _670 + 1;
    bool _674 = _672 >= 0;
    uint _676 = uint(int(uint(_629) >> uint(2)));
    uint _678 = uint(int(uint(int(_676)) >> uint(2)));
    int _680 = int(_676) & 3;
    float _682 = (*spvDescriptorSet0.fp_c3)._m0[int(_678)][_680];
    int _684 = int(_676) + 1;
    uint _686 = uint(int(uint(_684) >> uint(2)));
    int _688 = _684 & 3;
    float _690 = (*spvDescriptorSet0.fp_c3)._m0[int(_686)][_688];
    bool _692 = _672 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _694 = !_674;
    bool _696 = _692 || _694;
    bool _698 = _609 < 0;
    bool _700 = _698 || _696;
    bool _702 = _609 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _704 = _702 || _700;
    int _706 = _672;
    int _708 = as_type<int>(_575);
    if (!_704)
    {
        int _710 = _609 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _712 = _710 + _672;
        _706 = _712;
    }
    int _714 = _706;
    if (!_704)
    {
        int _716 = _714 << 2;
        _708 = _716;
    }
    int _718 = _708;
    int _720 = 0;
    int _722 = _718;
    if (!_704)
    {
        int _724 = _714 >> 2;
        _720 = _724;
    }
    int _726 = _720;
    int _728 = _726;
    if (!_704)
    {
        int _730 = 12 & _718;
        _722 = _730;
    }
    int _732 = _722;
    float _734 = _587 * _648;
    if (!_704)
    {
        int _736 = _726 << 4;
        int _738 = _736 + _732;
        _728 = _738;
    }
    int _740 = _728;
    float _742 = fma(_589, _640, _734);
    int _744 = _629 + 16;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    uint _748 = uint(int(uint(int(_746)) >> uint(2)));
    int _750 = int(_746) & 3;
    float _752 = (*spvDescriptorSet0.fp_c3)._m0[int(_748)][_750];
    int _754 = int(_746) + 1;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    int _758 = _754 & 3;
    float _760 = (*spvDescriptorSet0.fp_c3)._m0[int(_756)][_758];
    float _762 = fma(_585, _658, _742);
    float _764 = _762 + _666;
    int _766 = _629 + 24;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    uint _770 = uint(int(uint(int(_768)) >> uint(2)));
    int _772 = int(_768) & 3;
    float _774 = (*spvDescriptorSet0.fp_c3)._m0[int(_770)][_772];
    int _776 = int(_768) + 1;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    int _780 = _776 & 3;
    float _782 = (*spvDescriptorSet0.fp_c3)._m0[int(_778)][_780];
    float _784 = _587 * _690;
    float _786 = 1.0 / _764;
    float _788 = fma(_589, _682, _784);
    int _790 = _629 + 32;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.fp_c3)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
    int _808 = _629 + 8;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    uint _812 = uint(int(uint(int(_810)) >> uint(2)));
    int _814 = int(_810) & 3;
    float _816 = (*spvDescriptorSet0.fp_c3)._m0[int(_812)][_814];
    int _818 = int(_810) + 1;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    int _822 = _818 & 3;
    float _824 = (*spvDescriptorSet0.fp_c3)._m0[int(_820)][_822];
    float _826 = as_type<float>(_732);
    if (!_704)
    {
        uint _828 = uint(int(uint(_740) >> uint(2)));
        uint _830 = uint(int(uint(int(_828)) >> uint(2)));
        int _832 = int(_828) & 3;
        float _834 = (*spvDescriptorSet0.fp_c5)._m0[int(_830)][_832];
        _826 = _834;
    }
    float _836 = _826;
    int _838 = _629 + 40;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.fp_c3)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.fp_c3)._m0[int(_850)][_852];
    float _856 = _587 * _760;
    float _858 = fma(_589, _752, _856);
    float _860 = rint(_611);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    uint _866 = clamp(_864, 0u, 65535u);
    float _868 = fma(_585, _774, _858);
    float _870 = _868 + _782;
    float _872 = _587 * _806;
    float _874 = _806;
    float _876 = _798;
    float _878 = _782;
    if (!_704)
    {
        float _880 = floor(_569);
        _874 = _880;
    }
    float _882 = _874;
    float _884 = fma(_589, _798, _872);
    float _886 = fma(_585, _816, _788);
    float _888 = _870 * _786;
    float _890 = _587;
    if (!_704)
    {
        float _892 = floor(_623);
        _890 = _892;
    }
    float _894 = _890;
    float _896 = _886 + _824;
    float _898 = _896 * _786;
    float _900 = _870;
    if (!_704)
    {
        float _902 = rint(_836);
        float _904 = precise::max(_902, 0.0);
        uint _906 = uint(_904);
        uint _908 = clamp(_906, 0u, 65535u);
        _900 = as_type<float>(_908);
    }
    float _910 = _900;
    if (!_704)
    {
        float _912 = -_882;
        float _914 = _569 + _912;
        _876 = _914;
    }
    float _916 = _876;
    float _918 = fma(_585, _846, _884);
    if (!_704)
    {
        float _920 = -_894;
        float _922 = _623 + _920;
        _878 = _922;
    }
    float _924 = _878;
    float _926 = _918 + _854;
    float _928 = _926 * _786;
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float3 _2634 = float3(_898, _888, float(int(_866)));
    float3 _2638 = select(_2634, float3(0.0), isnan(_2634));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2638.xy, uint(rint(_2638.z)), _930);
    float _934 = _916;
    if (!_704)
    {
        float3 _2651 = float3(_924, _916, float(as_type<int>(_910)));
        float3 _2653 = select(_2651, float3(0.0), isnan(_2651));
        float _936 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2653.xy, uint(rint(_2653.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2653.xy, uint(rint(_2653.z)), level(0.0)).x;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _942 = precise::min(_164, -1.0000000116860974230803549289703e-07);
    float _944 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _946 = -_98;
    float _948 = fma(_946, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _950 = -_100;
    float _952 = fma(_950, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _954 = -_102;
    float _956 = fma(_954, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _958 = 1.0 / _942;
    float _960 = -_104;
    float _962 = fma(_960, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _964 = 1.0 / _948;
    float _966 = 1.0 / _952;
    float _968 = _958 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _970 = 1.0 / _956;
    float _972 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _974 = -_164;
    float _976 = fma(_964, _972, _974);
    float _978 = abs(_976);
    float _980 = _978 * _968;
    float _982 = 1.0 / _962;
    float _984 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _986 = -_164;
    float _988 = fma(_966, _984, _986);
    float _990 = abs(_988);
    float _992 = _990 * _968;
    float _994 = floor(_940);
    float _996 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _998 = -_164;
    float _1000 = fma(_970, _996, _998);
    float _1002 = abs(_1000);
    float _1004 = _1002 * _968;
    float _1006 = floor(_944);
    float _1008 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1010 = -_164;
    float _1012 = fma(_982, _1008, _1010);
    float _1014 = abs(_1012);
    float _1016 = _1014 * _968;
    float _1018 = -_994;
    float _1020 = _940 + _1018;
    float _1022 = exp2(_980);
    float _1024 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1026 = _1020 + _1024;
    float _1028 = -_1006;
    float _1030 = _944 + _1028;
    float _1032 = exp2(_992);
    float _1034 = -_1026;
    float _1036 = _1034 + 1.0;
    float _1038 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1040 = _1030 + _1038;
    float _1042 = _1040 * _1036;
    float _1044 = exp2(_1004);
    float _1046 = -_1040;
    float _1048 = _1046 + 1.0;
    float _1050 = _1026 * _1040;
    float _1052 = abs(_1042);
    float _1054 = _1052 * _1022;
    float _1056 = _1026 * _1048;
    float _1058 = _1036 * _1048;
    float _1060 = exp2(_1016);
    float _1062 = abs(_1050);
    float _1064 = _1062 * _1032;
    float _1066 = _1054 + _1064;
    float _1068 = abs(_1056);
    float _1070 = _1068 * _1044;
    float _1072 = _1070 + _1066;
    float _1074 = abs(_1058);
    float _1076 = _1074 * _1060;
    float _1078 = _1076 + _1072;
    float _1080 = -_1076;
    bool _1082 = _1072 != _1080;
    bool _1084 = isnan(_1072);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(_1080);
    bool _1090 = _1086 || _1088;
    float _1092 = 1.0 / _1078;
    float _1094 = _1064 * _1092;
    float _1096 = _1054 * _1092;
    float _1098 = _1070 * _1092;
    float _1100 = _1076 * _1092;
    float _1102 = _1090 ? _1094 : 0.25;
    float _1104 = _1090 ? _1096 : 0.25;
    float _1106 = _1090 ? _1098 : 0.25;
    float _1108 = _1102 * _110;
    float _1110 = fma(_1104, _108, _1108);
    float _1112 = _1090 ? _1100 : 0.25;
    float _1114 = _1100;
    if (_704)
    {
        _1114 = 1.0;
    }
    float _1116 = _1114;
    float _1118 = fma(_1106, _112, _1110);
    float _1120 = fma(_1112, _114, _1118);
    float _1122 = _1116;
    if (!_704)
    {
        int _1124 = _714 << 4;
        int _1126 = _1124 + 1648;
        int _1128 = _740 + 8048;
        uint _1130 = uint(int(uint(_1128) >> uint(2)));
        uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
        int _1134 = int(_1130) & 3;
        float _1136 = (*spvDescriptorSet0.fp_c5)._m0[int(_1132)][_1134];
        uint _1138 = uint(int(uint(_1126) >> uint(2)));
        uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
        int _1142 = int(_1138) & 3;
        float _1144 = (*spvDescriptorSet0.fp_c5)._m0[int(_1140)][_1142];
        int _1146 = int(_1138) + 1;
        uint _1148 = uint(int(uint(_1146) >> uint(2)));
        int _1150 = _1146 & 3;
        float _1152 = (*spvDescriptorSet0.fp_c5)._m0[int(_1148)][_1150];
        int _1154 = _1126 + 8;
        uint _1156 = uint(int(uint(_1154) >> uint(2)));
        uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
        int _1160 = int(_1156) & 3;
        float _1162 = (*spvDescriptorSet0.fp_c5)._m0[int(_1158)][_1160];
        int _1164 = int(_1156) + 1;
        uint _1166 = uint(int(uint(_1164) >> uint(2)));
        int _1168 = _1164 & 3;
        float _1170 = (*spvDescriptorSet0.fp_c5)._m0[int(_1166)][_1168];
        float _1172 = 1.0 / _1136;
        float _1174 = _543 * _1152;
        float _1176 = fma(_545, _1144, _1174);
        float _1178 = fma(_547, _1162, _1176);
        float _1180 = _1178 + _1170;
        float _1182 = precise::clamp(_1180, 0.0, 1.0);
        float _1184 = -_1182;
        float _1186 = _1184 + _938;
        float _1188 = _1136 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1190 = fma(_1172, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1186);
        float _1192 = _1188 * _1190;
        float _1194 = exp2(_1192);
        float _1196 = 0.0 + _1194;
        float _1198 = precise::clamp(_1196, 0.0, 1.0);
        _1122 = _1198;
    }
    float _1200 = _1122;
    float _1202 = precise::min(_1200, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1204 = -_164;
    float _1206 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1208 = _1204 + _1206;
    float _1210 = -_164;
    float _1212 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1214 = _1210 + _1212;
    float _1216 = -_932;
    float _1218 = _1216 + 1.0;
    float _1220 = _1208 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = _1214 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1226 = precise::clamp(_1224, 0.0, 1.0);
    float _1228 = -_1202;
    float _1230 = _1228 + 1.0;
    float _1232 = precise::min(_1120, 1.0);
    float _1234 = fma(_1222, _1218, _932);
    float _1236 = fma(_1226, _1230, _1202);
    out.m_56.x = _1234;
    out.m_56.y = _1236;
    out.m_56.z = _1232;
    out.m_56.w = 1.0;
    out.m_58.x = 1.0;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

