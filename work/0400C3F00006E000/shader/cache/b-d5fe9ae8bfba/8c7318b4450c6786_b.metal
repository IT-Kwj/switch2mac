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
    float2 _1295 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1295, float2(0.0), isnan(_1295))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1295, float2(0.0), isnan(_1295))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1310 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1310, float2(0.0), isnan(_1310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1310, float2(0.0), isnan(_1310))).x;
    float2 _1318 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1318, float2(0.0), isnan(_1318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1318, float2(0.0), isnan(_1318))).x;
    float2 _1326 = float2(_81, _83);
    float4 _96 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1326, float2(0.0), isnan(_1326)), int2(0), component::x).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float2 _1342 = float2(_81, _83);
    float4 _106 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1342, float2(0.0), isnan(_1342)), int2(0), component::x).xyzw;
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
    float _166 = _164 * _152;
    float _168 = _164 * _154;
    float _170 = -_91;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _174 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[41].x, _172);
    float _176 = _79 * _138;
    float _178 = _166 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _180 = _166 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _182 = _79 * _150;
    float _184 = -_168;
    float _186 = fma(_174, _156, _184);
    float _188 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[32].x, _178);
    float _190 = -_93;
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _194 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[41].x, _192);
    float _196 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[30].x, _180);
    float _198 = -_166;
    float _200 = fma(_174, _176, _198);
    float _202 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[32].z, _188);
    float _204 = -_164;
    float _206 = _204 + _174;
    float _208 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[30].z, _196);
    float _210 = -_166;
    float _212 = fma(_194, _182, _210);
    float _214 = _202 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _216 = -_168;
    float _218 = fma(_194, _158, _216);
    float _220 = _208 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _222 = -_164;
    float _224 = _222 + _194;
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _228 = _214 + _226;
    float _230 = _206 * _218;
    float _232 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _234 = _220 + _232;
    float _236 = _200 * _224;
    float _238 = _228 * _228;
    float _240 = -_230;
    float _242 = fma(_186, _224, _240);
    float _244 = _186 * _212;
    float _246 = -_236;
    float _248 = fma(_206, _212, _246);
    float _250 = fma(_234, _234, _238);
    float _252 = _242 * _242;
    float _254 = -_244;
    float _256 = fma(_200, _218, _254);
    float _258 = _166 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _260 = sqrt(_250);
    float _262 = fma(_248, _248, _252);
    float _264 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[31].x, _258);
    float _266 = fma(_256, _256, _262);
    float _268 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[31].z, _264);
    float _270 = rsqrt(_266);
    float _272 = _268 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _276 = _260 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _278 = _248 * _270;
    float _280 = _242 * _270;
    float _282 = _256 * _270;
    bool _284 = !_276;
    float _286 = _272;
    float _288 = _220;
    float _290 = _214;
    if (!_284)
    {
        float _292 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _294 = _260 + _292;
        float _296 = _272 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _298 = rsqrt(_250);
        float _300 = -_272;
        float _302 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _304 = _300 + _302;
        float _306 = abs(_296);
        float _308 = abs(_294);
        float _310 = precise::max(_306, _308);
        float _312 = _304 * _304;
        bool _314 = _310 >= 16.0;
        float _316 = _234 * _298;
        float _318 = _228 * _298;
        float _320 = -_234;
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
    float _587 = fma(_573, _575, _166);
    float _589 = fma(_579, _575, _168);
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
    int _702 = _629 + 16;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    uint _706 = uint(int(uint(int(_704)) >> uint(2)));
    int _708 = int(_704) & 3;
    float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
    int _712 = int(_704) + 1;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    int _716 = _712 & 3;
    float _718 = (*spvDescriptorSet0.fp_c3)._m0[int(_714)][_716];
    bool _720 = _609 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _722 = _720 || _700;
    int _724 = _672;
    int _726 = as_type<int>(_575);
    if (!_722)
    {
        int _728 = _609 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _730 = _728 + _672;
        _724 = _730;
    }
    int _732 = _724;
    float _734 = 0.0;
    if (!_722)
    {
        float _736 = floor(_569);
        _734 = _736;
    }
    float _738 = _734;
    int _740 = 0;
    if (!_722)
    {
        int _742 = _732 << 2;
        _740 = _742;
    }
    int _744 = _740;
    int _746 = _744;
    if (!_722)
    {
        int _748 = _732 >> 2;
        _726 = _748;
    }
    int _750 = _726;
    int _752 = _750;
    if (!_722)
    {
        int _754 = 12 & _744;
        _746 = _754;
    }
    int _756 = _746;
    float _758 = _587 * _648;
    if (!_722)
    {
        int _760 = _750 << 4;
        int _762 = _760 + _756;
        _752 = _762;
    }
    int _764 = _752;
    float _766 = fma(_589, _640, _758);
    int _768 = _629 + 32;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.fp_c3)._m0[int(_772)][_774];
    int _778 = int(_770) + 1;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    int _782 = _778 & 3;
    float _784 = (*spvDescriptorSet0.fp_c3)._m0[int(_780)][_782];
    float _786 = fma(_585, _658, _766);
    float _788 = _786 + _666;
    int _790 = _629 + 8;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.fp_c3)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
    float _808 = _587 * _690;
    float _810 = 1.0 / _788;
    float _812 = fma(_589, _682, _808);
    int _814 = _629 + 24;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
    int _820 = int(_816) & 3;
    float _822 = (*spvDescriptorSet0.fp_c3)._m0[int(_818)][_820];
    int _824 = int(_816) + 1;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    int _828 = _824 & 3;
    float _830 = (*spvDescriptorSet0.fp_c3)._m0[int(_826)][_828];
    float _832 = _587 * _718;
    float _834 = fma(_589, _710, _832);
    int _836 = _629 + 40;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    uint _840 = uint(int(uint(int(_838)) >> uint(2)));
    int _842 = int(_838) & 3;
    float _844 = (*spvDescriptorSet0.fp_c3)._m0[int(_840)][_842];
    int _846 = int(_838) + 1;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    int _850 = _846 & 3;
    float _852 = (*spvDescriptorSet0.fp_c3)._m0[int(_848)][_850];
    float _854 = rint(_611);
    float _856 = precise::max(_854, 0.0);
    uint _858 = uint(_856);
    uint _860 = clamp(_858, 0u, 65535u);
    float _862 = as_type<float>(_756);
    if (!_722)
    {
        uint _864 = uint(int(uint(_764) >> uint(2)));
        uint _866 = uint(int(uint(int(_864)) >> uint(2)));
        int _868 = int(_864) & 3;
        float _870 = (*spvDescriptorSet0.fp_c5)._m0[int(_866)][_868];
        _862 = _870;
    }
    float _872 = _862;
    float _874 = _587 * _784;
    float _876 = _784;
    float _878 = _874;
    if (!_722)
    {
        float _880 = floor(_623);
        _876 = _880;
    }
    float _882 = _876;
    float _884 = fma(_589, _776, _874);
    if (!_722)
    {
        float _886 = -_738;
        float _888 = _569 + _886;
        _878 = _888;
    }
    float _890 = _878;
    float _892 = fma(_585, _798, _812);
    float _894 = _892 + _806;
    float _896 = fma(_585, _822, _834);
    float _898 = _894 * _810;
    float _900 = _882;
    if (!_722)
    {
        float _902 = -_882;
        float _904 = _623 + _902;
        _900 = _904;
    }
    float _906 = _900;
    float _908 = _896 + _830;
    float _910 = fma(_585, _844, _884);
    float _912 = _908 * _810;
    float _914 = _910 + _852;
    float _916 = _914 * _810;
    float _918 = precise::clamp(_916, 0.0, 1.0);
    float _920 = _776;
    if (!_722)
    {
        float _922 = rint(_872);
        float _924 = precise::max(_922, 0.0);
        uint _926 = uint(_924);
        uint _928 = clamp(_926, 0u, 65535u);
        _920 = as_type<float>(_928);
    }
    float _930 = _920;
    float2 _2649 = float2(_81, _83);
    float4 _932 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2649, float2(0.0), isnan(_2649)), int2(0), component::w).xyzw;
    float _934 = _932.x;
    float _936 = _932.y;
    float _938 = _932.z;
    float _940 = _932.w;
    float3 _2669 = float3(_898, _912, float(int(_860)));
    float3 _2673 = select(_2669, float3(0.0), isnan(_2669));
    float _942 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2673.xy, uint(rint(_2673.z)), _918);
    float _944 = _930;
    if (!_722)
    {
        float3 _2686 = float3(_906, _890, float(as_type<int>(_930)));
        float3 _2688 = select(_2686, float3(0.0), isnan(_2686));
        float _946 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2688.xy, uint(rint(_2688.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2688.xy, uint(rint(_2688.z)), level(0.0)).x;
        _944 = _946;
    }
    float _948 = _944;
    float _950 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _952 = precise::min(_164, -1.0000000116860974230803549289703e-07);
    float _954 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _956 = -_100;
    float _958 = fma(_956, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _960 = -_98;
    float _962 = fma(_960, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _964 = -_102;
    float _966 = fma(_964, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _968 = 1.0 / _952;
    float _970 = -_104;
    float _972 = fma(_970, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _974 = 1.0 / _962;
    float _976 = 1.0 / _958;
    float _978 = 1.0 / _966;
    float _980 = _968 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _982 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _984 = -_164;
    float _986 = fma(_974, _982, _984);
    float _988 = abs(_986);
    float _990 = _988 * _980;
    float _992 = floor(_950);
    float _994 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _996 = -_164;
    float _998 = fma(_976, _994, _996);
    float _1000 = abs(_998);
    float _1002 = _1000 * _980;
    float _1004 = 1.0 / _972;
    float _1006 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1008 = -_164;
    float _1010 = fma(_978, _1006, _1008);
    float _1012 = abs(_1010);
    float _1014 = _1012 * _980;
    float _1016 = floor(_954);
    float _1018 = -_992;
    float _1020 = _950 + _1018;
    float _1022 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1024 = _1020 + _1022;
    float _1026 = exp2(_990);
    float _1028 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1030 = -_164;
    float _1032 = fma(_1004, _1028, _1030);
    float _1034 = abs(_1032);
    float _1036 = _1034 * _980;
    float _1038 = -_1024;
    float _1040 = _1038 + 1.0;
    float _1042 = exp2(_1002);
    float _1044 = -_1016;
    float _1046 = _954 + _1044;
    float _1048 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1050 = _1046 + _1048;
    float _1052 = exp2(_1014);
    float _1054 = _1050 * _1040;
    float _1056 = -_1050;
    float _1058 = _1056 + 1.0;
    float _1060 = _1024 * _1050;
    float _1062 = abs(_1054);
    float _1064 = _1062 * _1026;
    float _1066 = _1024 * _1058;
    float _1068 = _1040 * _1058;
    float _1070 = exp2(_1036);
    float _1072 = abs(_1060);
    float _1074 = _1072 * _1042;
    float _1076 = _1064 + _1074;
    float _1078 = abs(_1066);
    float _1080 = _1078 * _1052;
    float _1082 = _1080 + _1076;
    float _1084 = abs(_1068);
    float _1086 = _1084 * _1070;
    float _1088 = _1086 + _1082;
    float _1090 = -_1086;
    bool _1092 = _1082 != _1090;
    bool _1094 = isnan(_1082);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(_1090);
    bool _1100 = _1096 || _1098;
    float _1102 = 1.0 / _1088;
    float _1104 = _1074 * _1102;
    float _1106 = _1064 * _1102;
    float _1108 = _1080 * _1102;
    float _1110 = _1100 ? _1104 : 0.25;
    float _1112 = _1086 * _1102;
    float _1114 = _1100 ? _1106 : 0.25;
    float _1116 = _1100 ? _1108 : 0.25;
    float _1118 = _1110 * _110;
    float _1120 = _1100 ? _1112 : 0.25;
    float _1122 = fma(_1114, _108, _1118);
    float _1124 = fma(_1116, _112, _1122);
    float _1126 = fma(_1120, _114, _1124);
    float _1128 = _1110 * _936;
    float _1130 = fma(_1114, _934, _1128);
    float _1132 = _1114;
    if (_722)
    {
        _1132 = 1.0;
    }
    float _1134 = _1132;
    float _1136 = _1134;
    if (!_722)
    {
        int _1138 = _732 << 4;
        int _1140 = _1138 + 1648;
        int _1142 = _764 + 8048;
        uint _1144 = uint(int(uint(_1142) >> uint(2)));
        uint _1146 = uint(int(uint(int(_1144)) >> uint(2)));
        int _1148 = int(_1144) & 3;
        float _1150 = (*spvDescriptorSet0.fp_c5)._m0[int(_1146)][_1148];
        uint _1152 = uint(int(uint(_1140) >> uint(2)));
        uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
        int _1156 = int(_1152) & 3;
        float _1158 = (*spvDescriptorSet0.fp_c5)._m0[int(_1154)][_1156];
        int _1160 = int(_1152) + 1;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        int _1164 = _1160 & 3;
        float _1166 = (*spvDescriptorSet0.fp_c5)._m0[int(_1162)][_1164];
        int _1168 = _1140 + 8;
        uint _1170 = uint(int(uint(_1168) >> uint(2)));
        uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
        int _1174 = int(_1170) & 3;
        float _1176 = (*spvDescriptorSet0.fp_c5)._m0[int(_1172)][_1174];
        int _1178 = int(_1170) + 1;
        uint _1180 = uint(int(uint(_1178) >> uint(2)));
        int _1182 = _1178 & 3;
        float _1184 = (*spvDescriptorSet0.fp_c5)._m0[int(_1180)][_1182];
        float _1186 = 1.0 / _1150;
        float _1188 = _543 * _1166;
        float _1190 = fma(_545, _1158, _1188);
        float _1192 = fma(_547, _1176, _1190);
        float _1194 = _1192 + _1184;
        float _1196 = precise::clamp(_1194, 0.0, 1.0);
        float _1198 = -_1196;
        float _1200 = _1198 + _948;
        float _1202 = _1150 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1204 = fma(_1186, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1200);
        float _1206 = _1202 * _1204;
        float _1208 = exp2(_1206);
        float _1210 = 0.0 + _1208;
        float _1212 = precise::clamp(_1210, 0.0, 1.0);
        _1136 = _1212;
    }
    float _1214 = _1136;
    float _1216 = -_164;
    float _1218 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1220 = _1216 + _1218;
    float _1222 = precise::min(_1214, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1224 = -_164;
    float _1226 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1228 = _1224 + _1226;
    float _1230 = fma(_1116, _938, _1130);
    float _1232 = _1220 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1234 = precise::clamp(_1232, 0.0, 1.0);
    float _1236 = -_942;
    float _1238 = _1236 + 1.0;
    float _1240 = _1228 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1242 = precise::clamp(_1240, 0.0, 1.0);
    float _1244 = -_1222;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1120, _940, _1230);
    float _1250 = fma(_1234, _1238, _942);
    float _1252 = fma(_1242, _1246, _1222);
    float _1254 = precise::min(_1126, 1.0);
    float _1256 = precise::min(_1248, 1.0);
    out.m_56.x = _1250;
    out.m_56.y = _1252;
    out.m_56.z = _1256;
    out.m_56.w = 1.0;
    out.m_58.x = _1254;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

