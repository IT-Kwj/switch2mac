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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
    float4 m_60 [[color(1)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_49.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_49.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float _87 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1291 = float2(_83, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1291, float2(0.0), isnan(_1291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1291, float2(0.0), isnan(_1291))).x;
    float _91 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1306 = float2(_87, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1306, float2(0.0), isnan(_1306))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1306, float2(0.0), isnan(_1306))).x;
    float2 _1314 = float2(_83, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1314, float2(0.0), isnan(_1314))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1314, float2(0.0), isnan(_1314))).x;
    float2 _1322 = float2(_83, _85);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1322, float2(0.0), isnan(_1322))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1322, float2(0.0), isnan(_1322))).x;
    float2 _1330 = float2(_83, _85);
    float4 _100 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1330, float2(0.0), isnan(_1330)), int2(0), component::x).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_51.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_51.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_53.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_53.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_55.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_55.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = _81 * _114;
    float _148 = _81 * _120;
    float _150 = _81 * _126;
    float _152 = _81 * _132;
    float _154 = _81 * _138;
    float _156 = _81 * _144;
    float _158 = -_89;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _162 = -_93;
    float _164 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _166 = 1.0 / _160;
    float _168 = -_95;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _172 = 1.0 / _170;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _176 = _166 * _174;
    float _178 = 1.0 / _164;
    float _180 = _176 * _148;
    float _182 = _176 * _146;
    float _184 = _180 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _186 = _180 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _190 = _172 * _188;
    float _192 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[32].x, _184);
    float _194 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[30].x, _186);
    float _196 = -_180;
    float _198 = fma(_190, _156, _196);
    float _200 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[32].z, _192);
    float _202 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[30].z, _194);
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _206 = _178 * _204;
    float _208 = -_182;
    float _210 = fma(_190, _154, _208);
    float _212 = _200 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _214 = _202 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _216 = -_176;
    float _218 = _216 + _206;
    float _220 = -_182;
    float _222 = fma(_206, _150, _220);
    float _224 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _226 = _212 + _224;
    float _228 = -_180;
    float _230 = fma(_206, _152, _228);
    float _232 = -_176;
    float _234 = _232 + _190;
    float _236 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _238 = _214 + _236;
    float _240 = _226 * _226;
    float _242 = _218 * _210;
    float _244 = _230 * _234;
    float _246 = fma(_238, _238, _240);
    float _248 = -_242;
    float _250 = fma(_222, _234, _248);
    float _252 = -_244;
    float _254 = fma(_218, _198, _252);
    float _256 = _222 * _198;
    float _258 = sqrt(_246);
    float _260 = _250 * _250;
    float _262 = _180 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _264 = -_256;
    float _266 = fma(_230, _210, _264);
    float _268 = fma(_254, _254, _260);
    float _270 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[31].x, _262);
    float _272 = fma(_266, _266, _268);
    float _274 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[31].z, _270);
    float _276 = _274 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _278 = rsqrt(_272);
    bool _282 = _258 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _284 = _254 * _278;
    float _286 = _250 * _278;
    float _288 = _266 * _278;
    bool _290 = !_282;
    float _292 = _276;
    float _294 = _214;
    float _296 = _212;
    if (!_290)
    {
        float _298 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _300 = _258 + _298;
        float _302 = _276 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _304 = rsqrt(_246);
        float _306 = -_276;
        float _308 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _310 = _306 + _308;
        float _312 = abs(_302);
        float _314 = abs(_300);
        float _316 = precise::max(_312, _314);
        float _318 = _310 * _310;
        bool _320 = _316 >= 16.0;
        float _322 = _238 * _304;
        float _324 = _226 * _304;
        float _326 = -_238;
        float _328 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[41].z, _326);
        float _330 = _300;
        float _332 = _302;
        int _335 = as_type<int>(_304);
        if (_320)
        {
            float _337 = _300 * 0.0625;
            _330 = _337;
        }
        float _339 = _330;
        if (_320)
        {
            float _341 = _302 * 0.0625;
            _332 = _341;
        }
        float _343 = _332;
        float _345 = -_226;
        float _347 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[41].z, _345);
        float _349 = fma(_328, _328, _318);
        float _351 = abs(_339);
        bool _353 = _351 != 0.0;
        bool _355 = isnan(_351);
        bool _357 = _353 || _355;
        bool _359 = isnan(0.0);
        bool _361 = _357 || _359;
        float _363 = fma(_347, _347, _349);
        float _365 = abs(_343);
        bool _367 = _365 == 0.0;
        float _369 = abs(_343);
        bool _371 = _369 == 0.0;
        bool _373 = !_361;
        bool _375 = _371 && _373;
        float _377 = sqrt(_363);
        bool _379 = false;
        float _381 = _349;
        if (_375)
        {
            bool _383 = as_type<int>(_343) >= 0;
            _379 = _383;
        }
        bool _385 = _379;
        int _387 = _385 ? (-1) : 0;
        if (_375)
        {
            int _389 = _385 ? 0 : 1078530011;
            _335 = _389;
        }
        int _391 = _335;
        int _393 = _391;
        if (_375)
        {
            int _395 = int(0x80000000) & as_type<int>(_339);
            int _397 = _391 | _395;
            _381 = as_type<float>(_397);
        }
        float _399 = _381;
        bool _401 = !_361;
        bool _403 = _401 && _367;
        float _405 = _399;
        float _407 = _399;
        if (!_403)
        {
            float _409 = abs(_339);
            bool _411 = _409 != as_type<float>(0x7f800000u /* inf */);
            bool _413 = isnan(_409);
            bool _415 = _411 || _413;
            bool _417 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _419 = _415 || _417;
            float _421 = abs(_343);
            bool _423 = _421 == as_type<float>(0x7f800000u /* inf */);
            float _425 = abs(_343);
            bool _427 = _425 == as_type<float>(0x7f800000u /* inf */);
            bool _429 = !_419;
            bool _431 = _427 && _429;
            if (_431)
            {
                bool _433 = as_type<int>(_343) >= 0;
                _387 = _433 ? (-1) : 0;
            }
            int _435 = _387;
            if (_431)
            {
                _393 = 1075235812;
            }
            int _437 = _393;
            int _439 = _437;
            if (_431)
            {
                int _441 = ~_435;
                int _443 = (_441 != 0) ? _437 : 1061752795;
                _439 = _443;
            }
            int _445 = _439;
            if (_431)
            {
                int _447 = int(0x80000000) & as_type<int>(_339);
                int _449 = _445 | _447;
                _405 = as_type<float>(_449);
            }
            float _451 = _405;
            bool _453 = !_419;
            bool _455 = _453 && _423;
            _407 = _451;
            if (!_455)
            {
                float _457 = abs(_339);
                float _459 = abs(_343);
                float _461 = precise::max(_457, _459);
                float _463 = abs(_339);
                float _465 = abs(_343);
                float _467 = precise::min(_463, _465);
                float _469 = 1.0 / _461;
                float _471 = abs(_339);
                float _473 = abs(_343);
                bool _475 = _471 > _473;
                bool _477 = as_type<int>(_343) >= 0;
                float _479 = _467 * _469;
                float _481 = abs(_339);
                float _483 = abs(_343);
                float _485 = _481 + _483;
                int _487 = as_type<int>(_339) & int(0x80000000);
                float _489 = _479 * _479;
                bool _491 = _485 > as_type<float>(0x7f800000u /* inf */);
                bool _493 = isnan(_485);
                bool _495 = _491 || _493;
                bool _497 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _499 = _495 || _497;
                float _501 = _489 + 11.33538818359375;
                float _503 = fma(_489, _501, 28.84246826171875);
                float _505 = fma(_489, _503, 19.6966705322265625);
                float _507 = fma(_489, -0.82336294651031494140625, -5.674867153167724609375);
                float _509 = fma(_489, _507, -6.565555095672607421875);
                float _511 = 1.0 / _505;
                float _513 = _489 * _509;
                float _515 = _479 * _513;
                float _517 = fma(_515, _511, _479);
                float _519 = _517;
                _407 = _485;
                if (_475)
                {
                    float _521 = -_517;
                    float _523 = _521 + 1.57079637050628662109375;
                    _519 = _523;
                }
                float _525 = _519;
                int _527 = as_type<int>(_525);
                if (!_477)
                {
                    float _529 = -_525;
                    float _531 = _529 + 3.1415927410125732421875;
                    _527 = as_type<int>(_531);
                }
                int _533 = _527;
                if (!_499)
                {
                    int _535 = _487 | _533;
                    _407 = as_type<float>(_535);
                }
            }
        }
        float _537 = _407;
        float _539 = fma(_537, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _541 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _543 = _377 + _541;
        float _545 = fma(_322, _539, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _547 = fma(_324, _539, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _292 = _543;
        _294 = _545;
        _296 = _547;
    }
    float _549 = _292;
    float _551 = _294;
    float _553 = _296;
    float _555 = _286 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _557 = _549 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _559 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[35].x, _555);
    float _561 = fma(_551, (*spvDescriptorSet0.fp_c5)._m0[102].x, _557);
    float _563 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[35].z, _559);
    float _565 = fma(_553, (*spvDescriptorSet0.fp_c5)._m0[102].z, _561);
    float _567 = -_563;
    float _569 = fma(_567, _563, 1.0);
    float _571 = -_563;
    float _573 = fma(_571, (*spvDescriptorSet0.fp_c3)._m0[35].z, _288);
    float _575 = _565 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _577 = -_563;
    float _579 = fma(_577, (*spvDescriptorSet0.fp_c3)._m0[35].x, _284);
    float _581 = _569 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _583 = -_563;
    float _585 = fma(_583, (*spvDescriptorSet0.fp_c3)._m0[35].y, _286);
    float _587 = trunc(_575);
    int _589 = int(_587);
    float _591 = fma(_573, _581, _176);
    float _593 = fma(_579, _581, _182);
    float _595 = fma(_585, _581, _180);
    float _597 = -_591;
    bool _599 = _597 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _601 = float(_599);
    float _603 = -_591;
    bool _605 = _603 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _607 = float(_605);
    float _609 = _601 + _607;
    int _611 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _613 = _589 + _611;
    int _615 = _613 + 1;
    float _617 = precise::min(_609, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _619 = _549 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _621 = trunc(_617);
    int _623 = int(_621);
    float _625 = fma(_551, (*spvDescriptorSet0.fp_c5)._m0[101].x, _619);
    float _627 = fma(_553, (*spvDescriptorSet0.fp_c5)._m0[101].z, _625);
    float _629 = _627 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _631 = trunc(_629);
    int _633 = int(_631);
    int _635 = _623 << 6;
    int _637 = _635 + 48;
    uint _640 = uint(int(uint(_637) >> uint(2)));
    uint _642 = uint(int(uint(int(_640)) >> uint(2)));
    int _644 = int(_640) & 3;
    float _646 = (*spvDescriptorSet0.fp_c3)._m0[int(_642)][_644];
    int _648 = int(_640) + 1;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    int _652 = _648 & 3;
    float _654 = (*spvDescriptorSet0.fp_c3)._m0[int(_650)][_652];
    int _656 = _635 + 56;
    uint _658 = uint(int(uint(_656) >> uint(2)));
    uint _660 = uint(int(uint(int(_658)) >> uint(2)));
    int _662 = int(_658) & 3;
    float _664 = (*spvDescriptorSet0.fp_c3)._m0[int(_660)][_662];
    int _666 = int(_658) + 1;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    int _670 = _666 & 3;
    float _672 = (*spvDescriptorSet0.fp_c3)._m0[int(_668)][_670];
    int _674 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _676 = _633 + _674;
    int _678 = _676 + 1;
    bool _680 = _678 >= 0;
    uint _682 = uint(int(uint(_635) >> uint(2)));
    uint _684 = uint(int(uint(int(_682)) >> uint(2)));
    int _686 = int(_682) & 3;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
    int _690 = int(_682) + 1;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    int _694 = _690 & 3;
    float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
    bool _698 = _678 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _700 = !_680;
    bool _702 = _698 || _700;
    bool _704 = _615 < 0;
    bool _706 = _704 || _702;
    int _708 = _635 + 32;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.fp_c3)._m0[int(_712)][_714];
    int _718 = int(_710) + 1;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    int _722 = _718 & 3;
    float _724 = (*spvDescriptorSet0.fp_c3)._m0[int(_720)][_722];
    bool _726 = _615 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _728 = _726 || _706;
    int _730 = _635 + 16;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[int(_734)][_736];
    int _740 = int(_732) + 1;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    int _744 = _740 & 3;
    float _746 = (*spvDescriptorSet0.fp_c3)._m0[int(_742)][_744];
    int _748 = _678;
    float _750 = _595;
    float _752 = as_type<float>(_635);
    if (!_728)
    {
        int _754 = _615 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _756 = _754 + _678;
        _748 = _756;
    }
    int _758 = _748;
    int _760 = _635 + 40;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    uint _764 = uint(int(uint(int(_762)) >> uint(2)));
    int _766 = int(_762) & 3;
    float _768 = (*spvDescriptorSet0.fp_c3)._m0[int(_764)][_766];
    int _770 = int(_762) + 1;
    uint _772 = uint(int(uint(_770) >> uint(2)));
    int _774 = _770 & 3;
    float _776 = (*spvDescriptorSet0.fp_c3)._m0[int(_772)][_774];
    int _778 = 0;
    if (!_728)
    {
        int _780 = _758 << 2;
        _778 = _780;
    }
    int _782 = _778;
    int _784 = 0;
    int _786 = _782;
    if (!_728)
    {
        int _788 = _758 >> 2;
        _784 = _788;
    }
    int _790 = _784;
    int _792 = _790;
    if (!_728)
    {
        int _794 = 12 & _782;
        _786 = _794;
    }
    int _796 = _786;
    float _798 = _595 * _654;
    if (!_728)
    {
        int _800 = _790 << 4;
        int _802 = _800 + _796;
        _792 = _802;
    }
    int _804 = _792;
    float _806 = fma(_593, _646, _798);
    int _808 = _635 + 24;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    uint _812 = uint(int(uint(int(_810)) >> uint(2)));
    int _814 = int(_810) & 3;
    float _816 = (*spvDescriptorSet0.fp_c3)._m0[int(_812)][_814];
    int _818 = int(_810) + 1;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    int _822 = _818 & 3;
    float _824 = (*spvDescriptorSet0.fp_c3)._m0[int(_820)][_822];
    float _826 = fma(_591, _664, _806);
    float _828 = _826 + _672;
    int _830 = _635 + 8;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    uint _834 = uint(int(uint(int(_832)) >> uint(2)));
    int _836 = int(_832) & 3;
    float _838 = (*spvDescriptorSet0.fp_c3)._m0[int(_834)][_836];
    int _840 = int(_832) + 1;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    int _844 = _840 & 3;
    float _846 = (*spvDescriptorSet0.fp_c3)._m0[int(_842)][_844];
    float _848 = _672;
    if (!_728)
    {
        float _850 = floor(_575);
        _848 = _850;
    }
    float _852 = _848;
    float _854 = _595 * _696;
    float _856 = fma(_593, _688, _854);
    float _858 = as_type<float>(_796);
    if (!_728)
    {
        uint _860 = uint(int(uint(_804) >> uint(2)));
        uint _862 = uint(int(uint(int(_860)) >> uint(2)));
        int _864 = int(_860) & 3;
        float _866 = (*spvDescriptorSet0.fp_c5)._m0[int(_862)][_864];
        _858 = _866;
    }
    float _868 = _858;
    float _870 = _696;
    if (!_728)
    {
        float _872 = floor(_629);
        _870 = _872;
    }
    float _874 = _870;
    float _876 = _595 * _724;
    float _878 = fma(_593, _716, _876);
    float _880 = 1.0 / _828;
    float _882 = _595 * _746;
    if (!_728)
    {
        float _884 = -_852;
        float _886 = _575 + _884;
        _750 = _886;
    }
    float _888 = _750;
    float _890 = fma(_593, _738, _882);
    if (!_728)
    {
        float _892 = -_874;
        float _894 = _629 + _892;
        _752 = _894;
    }
    float _896 = _752;
    float _898 = fma(_591, _768, _878);
    float2 _2594 = float2(_83, _85);
    float4 _900 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2594, float2(0.0), isnan(_2594)), int2(0), component::w).xyzw;
    float _902 = _900.x;
    float _904 = _900.y;
    float _906 = _900.z;
    float _908 = _900.w;
    float _910 = fma(_591, _816, _890);
    float _912 = _898 + _776;
    float _914 = _910 + _824;
    float _916 = _912 * _880;
    float _918 = precise::clamp(_916, 0.0, 1.0);
    float _920 = fma(_591, _838, _856);
    float _922 = _914 * _880;
    float _924 = rint(_617);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    uint _930 = clamp(_928, 0u, 65535u);
    float _932 = _920 + _846;
    float _934 = _932 * _880;
    float _936 = _868;
    if (!_728)
    {
        float _938 = rint(_868);
        float _940 = precise::max(_938, 0.0);
        uint _942 = uint(_940);
        uint _944 = clamp(_942, 0u, 65535u);
        _936 = as_type<float>(_944);
    }
    float _946 = _936;
    float3 _2668 = float3(_934, _922, float(int(_930)));
    float3 _2672 = select(_2668, float3(0.0), isnan(_2668));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2672.xy, uint(rint(_2672.z)), _918);
    float _950 = _896;
    if (!_728)
    {
        float3 _2685 = float3(_896, _888, float(as_type<int>(_946)));
        float3 _2687 = select(_2685, float3(0.0), isnan(_2685));
        float _952 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2687.xy, uint(rint(_2687.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2687.xy, uint(rint(_2687.z)), level(0.0)).x;
        _950 = _952;
    }
    float _954 = _950;
    float _956 = precise::min(_176, -1.0000000116860974230803549289703e-07);
    float _958 = -_102;
    float _960 = fma(_958, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _962 = -_104;
    float _964 = fma(_962, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _966 = -_106;
    float _968 = fma(_966, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _970 = -_108;
    float _972 = fma(_970, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _974 = 1.0 / _964;
    float _976 = 1.0 / _956;
    float _978 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _980 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _982 = 1.0 / _960;
    float _984 = 1.0 / _968;
    float _986 = _976 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _988 = 1.0 / _972;
    float _990 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _992 = -_176;
    float _994 = fma(_974, _990, _992);
    float _996 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _998 = -_176;
    float _1000 = fma(_982, _996, _998);
    float _1002 = abs(_994);
    float _1004 = _1002 * _986;
    float _1006 = abs(_1000);
    float _1008 = _1006 * _986;
    float _1010 = floor(_978);
    float _1012 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1014 = -_176;
    float _1016 = fma(_984, _1012, _1014);
    float _1018 = abs(_1016);
    float _1020 = _1018 * _986;
    float _1022 = floor(_980);
    float _1024 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1026 = -_176;
    float _1028 = fma(_988, _1024, _1026);
    float _1030 = abs(_1028);
    float _1032 = _1030 * _986;
    float _1034 = exp2(_1008);
    float _1036 = -_1010;
    float _1038 = _978 + _1036;
    float _1040 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1042 = _1038 + _1040;
    float _1044 = exp2(_1004);
    float _1046 = -_1022;
    float _1048 = _980 + _1046;
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
    float _1124 = _1118 * _904;
    float _1126 = fma(_1120, _902, _1124);
    float _1128 = _1120;
    if (_728)
    {
        _1128 = 1.0;
    }
    float _1130 = _1128;
    float _1132 = fma(_1122, _906, _1126);
    float _1134 = -_176;
    float _1136 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1138 = _1134 + _1136;
    float _1140 = _1130;
    if (!_728)
    {
        int _1142 = _758 << 4;
        int _1144 = _1142 + 1648;
        int _1146 = _804 + 8048;
        uint _1148 = uint(int(uint(_1146) >> uint(2)));
        uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
        int _1152 = int(_1148) & 3;
        float _1154 = (*spvDescriptorSet0.fp_c5)._m0[int(_1150)][_1152];
        uint _1156 = uint(int(uint(_1144) >> uint(2)));
        uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
        int _1160 = int(_1156) & 3;
        float _1162 = (*spvDescriptorSet0.fp_c5)._m0[int(_1158)][_1160];
        int _1164 = int(_1156) + 1;
        uint _1166 = uint(int(uint(_1164) >> uint(2)));
        int _1168 = _1164 & 3;
        float _1170 = (*spvDescriptorSet0.fp_c5)._m0[int(_1166)][_1168];
        int _1172 = _1144 + 8;
        uint _1174 = uint(int(uint(_1172) >> uint(2)));
        uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
        int _1178 = int(_1174) & 3;
        float _1180 = (*spvDescriptorSet0.fp_c5)._m0[int(_1176)][_1178];
        int _1182 = int(_1174) + 1;
        uint _1184 = uint(int(uint(_1182) >> uint(2)));
        int _1186 = _1182 & 3;
        float _1188 = (*spvDescriptorSet0.fp_c5)._m0[int(_1184)][_1186];
        float _1190 = _1154 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1192 = _549 * _1170;
        float _1194 = 1.0 / _1154;
        float _1196 = fma(_551, _1162, _1192);
        float _1198 = fma(_553, _1180, _1196);
        float _1200 = _1198 + _1188;
        float _1202 = precise::clamp(_1200, 0.0, 1.0);
        float _1204 = -_1202;
        float _1206 = _1204 + _954;
        float _1208 = fma(_1194, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1206);
        float _1210 = _1190 * _1208;
        float _1212 = exp2(_1210);
        float _1214 = 0.0 + _1212;
        float _1216 = precise::clamp(_1214, 0.0, 1.0);
        _1140 = _1216;
    }
    float _1218 = _1140;
    float _1220 = precise::min(_1218, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1222 = -_176;
    float _1224 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1226 = _1222 + _1224;
    float _1228 = _1106 ? _1116 : 0.25;
    float _1230 = _1138 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1232 = precise::clamp(_1230, 0.0, 1.0);
    float _1234 = -_948;
    float _1236 = _1234 + 1.0;
    float _1238 = _1226 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1240 = precise::clamp(_1238, 0.0, 1.0);
    float _1242 = -_1220;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1228, _908, _1132);
    float _1248 = fma(_1232, _1236, _948);
    float _1250 = fma(_1240, _1244, _1220);
    float _1252 = precise::min(_1246, 1.0);
    out.m_58.x = _1248;
    out.m_58.y = _1250;
    out.m_58.z = _1252;
    out.m_58.w = 1.0;
    out.m_60.x = _97;
    out.m_60.y = 0.5;
    out.m_60.z = 0.5;
    out.m_60.w = 1.0;
    return out;
}

