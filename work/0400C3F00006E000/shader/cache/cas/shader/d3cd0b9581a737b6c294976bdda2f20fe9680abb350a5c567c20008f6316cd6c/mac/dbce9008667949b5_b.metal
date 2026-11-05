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
    float2 _1279 = float2(_83, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1279, float2(0.0), isnan(_1279))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1279, float2(0.0), isnan(_1279))).x;
    float _91 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1294 = float2(_87, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1294, float2(0.0), isnan(_1294))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1294, float2(0.0), isnan(_1294))).x;
    float2 _1302 = float2(_83, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1302, float2(0.0), isnan(_1302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1302, float2(0.0), isnan(_1302))).x;
    float2 _1310 = float2(_83, _85);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1310, float2(0.0), isnan(_1310))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1310, float2(0.0), isnan(_1310))).x;
    float2 _1318 = float2(_83, _85);
    float4 _100 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1318, float2(0.0), isnan(_1318)), int2(0), component::x).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_51.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_51.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_53.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_55.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_53.x;
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
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _162 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[41].x, _160);
    float _164 = _162 * _146;
    float _166 = _162 * _148;
    float _168 = _164 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _170 = _164 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _172 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[32].x, _168);
    float _174 = -_95;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _178 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[41].x, _176);
    float _180 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[30].x, _170);
    float _182 = -_93;
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _186 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[41].x, _184);
    float _188 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[32].z, _172);
    float _190 = -_166;
    float _192 = fma(_178, _152, _190);
    float _194 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[30].z, _180);
    float _196 = -_162;
    float _198 = _196 + _186;
    float _200 = _188 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _202 = -_164;
    float _204 = fma(_178, _156, _202);
    float _206 = _194 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _208 = -_166;
    float _210 = fma(_186, _154, _208);
    float _212 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _214 = _200 + _212;
    float _216 = -_164;
    float _218 = fma(_186, _150, _216);
    float _220 = -_162;
    float _222 = _220 + _178;
    float _224 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _226 = _206 + _224;
    float _228 = _214 * _214;
    float _230 = _198 * _192;
    float _232 = _218 * _222;
    float _234 = fma(_226, _226, _228);
    float _236 = -_230;
    float _238 = fma(_210, _222, _236);
    float _240 = _210 * _204;
    float _242 = -_232;
    float _244 = fma(_198, _204, _242);
    float _246 = _164 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _248 = sqrt(_234);
    float _250 = _238 * _238;
    float _252 = -_240;
    float _254 = fma(_218, _192, _252);
    float _256 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[31].x, _246);
    float _258 = fma(_244, _244, _250);
    float _260 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[31].z, _256);
    float _262 = fma(_254, _254, _258);
    float _264 = _260 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _266 = rsqrt(_262);
    bool _270 = _248 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _272 = _244 * _266;
    float _274 = _238 * _266;
    float _276 = _254 * _266;
    bool _278 = !_270;
    float _280 = _264;
    float _282 = _206;
    float _284 = _200;
    if (!_278)
    {
        float _286 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _288 = _248 + _286;
        float _290 = _264 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _292 = rsqrt(_234);
        float _294 = -_264;
        float _296 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _298 = _294 + _296;
        float _300 = abs(_290);
        float _302 = abs(_288);
        float _304 = precise::max(_300, _302);
        float _306 = _298 * _298;
        bool _308 = _304 >= 16.0;
        float _310 = _226 * _292;
        float _312 = _214 * _292;
        float _314 = -_226;
        float _316 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[41].z, _314);
        float _318 = _288;
        float _320 = _290;
        if (_308)
        {
            float _322 = _288 * 0.0625;
            _318 = _322;
        }
        float _324 = _318;
        if (_308)
        {
            float _326 = _290 * 0.0625;
            _320 = _326;
        }
        float _328 = _320;
        float _330 = -_214;
        float _332 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[41].z, _330);
        float _334 = fma(_316, _316, _306);
        float _336 = abs(_324);
        bool _338 = _336 != 0.0;
        bool _340 = isnan(_336);
        bool _342 = _338 || _340;
        bool _344 = isnan(0.0);
        bool _346 = _342 || _344;
        float _348 = fma(_332, _332, _334);
        float _350 = abs(_328);
        bool _352 = _350 == 0.0;
        float _354 = abs(_328);
        bool _356 = _354 == 0.0;
        bool _358 = !_346;
        bool _360 = _356 && _358;
        float _362 = sqrt(_348);
        bool _364 = false;
        int _367 = as_type<int>(_334);
        if (_360)
        {
            bool _369 = as_type<int>(_328) >= 0;
            _364 = _369;
        }
        bool _371 = _364;
        int _373 = _371 ? (-1) : 0;
        if (_360)
        {
            int _375 = _371 ? 0 : 1078530011;
            _367 = _375;
        }
        int _377 = _367;
        int _379 = _377;
        if (_360)
        {
            int _381 = int(0x80000000) & as_type<int>(_324);
            int _383 = _377 | _381;
            _379 = _383;
        }
        int _385 = _379;
        bool _387 = !_346;
        bool _389 = _387 && _352;
        int _391 = _385;
        float _393 = as_type<float>(_385);
        if (!_389)
        {
            float _395 = abs(_324);
            bool _397 = _395 != as_type<float>(0x7f800000u /* inf */);
            bool _399 = isnan(_395);
            bool _401 = _397 || _399;
            bool _403 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _405 = _401 || _403;
            float _407 = abs(_328);
            bool _409 = _407 == as_type<float>(0x7f800000u /* inf */);
            float _411 = abs(_328);
            bool _413 = _411 == as_type<float>(0x7f800000u /* inf */);
            bool _415 = !_405;
            bool _417 = _413 && _415;
            if (_417)
            {
                bool _419 = as_type<int>(_328) >= 0;
                _373 = _419 ? (-1) : 0;
            }
            int _421 = _373;
            if (_417)
            {
                _391 = 1075235812;
            }
            int _423 = _391;
            int _425 = _423;
            if (_417)
            {
                int _427 = ~_421;
                int _429 = (_427 != 0) ? _423 : 1061752795;
                _425 = _429;
            }
            int _431 = _425;
            float _433 = as_type<float>(_431);
            if (_417)
            {
                int _435 = int(0x80000000) & as_type<int>(_324);
                int _437 = _431 | _435;
                _433 = as_type<float>(_437);
            }
            float _439 = _433;
            bool _441 = !_405;
            bool _443 = _441 && _409;
            _393 = _439;
            if (!_443)
            {
                float _445 = abs(_324);
                float _447 = abs(_328);
                float _449 = precise::max(_445, _447);
                float _451 = abs(_324);
                float _453 = abs(_328);
                float _455 = precise::min(_451, _453);
                float _457 = 1.0 / _449;
                float _459 = abs(_324);
                float _461 = abs(_328);
                bool _463 = _459 > _461;
                bool _465 = as_type<int>(_328) >= 0;
                float _467 = _455 * _457;
                float _469 = abs(_324);
                float _471 = abs(_328);
                float _473 = _469 + _471;
                int _475 = as_type<int>(_324) & int(0x80000000);
                float _477 = _467 * _467;
                bool _479 = _473 > as_type<float>(0x7f800000u /* inf */);
                bool _481 = isnan(_473);
                bool _483 = _479 || _481;
                bool _485 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _487 = _483 || _485;
                float _489 = _477 + 11.33538818359375;
                float _491 = fma(_477, _489, 28.84246826171875);
                float _493 = fma(_477, _491, 19.6966705322265625);
                float _495 = fma(_477, -0.82336294651031494140625, -5.674867153167724609375);
                float _497 = fma(_477, _495, -6.565555095672607421875);
                float _499 = 1.0 / _493;
                float _501 = _477 * _497;
                float _503 = _467 * _501;
                float _505 = fma(_503, _499, _467);
                float _507 = _505;
                _393 = _473;
                if (_463)
                {
                    float _509 = -_505;
                    float _511 = _509 + 1.57079637050628662109375;
                    _507 = _511;
                }
                float _513 = _507;
                int _515 = as_type<int>(_513);
                if (!_465)
                {
                    float _517 = -_513;
                    float _519 = _517 + 3.1415927410125732421875;
                    _515 = as_type<int>(_519);
                }
                int _521 = _515;
                if (!_487)
                {
                    int _523 = _475 | _521;
                    _393 = as_type<float>(_523);
                }
            }
        }
        float _525 = _393;
        float _527 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _529 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _531 = _362 + _529;
        float _533 = fma(_310, _527, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _535 = fma(_312, _527, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _280 = _531;
        _282 = _533;
        _284 = _535;
    }
    float _537 = _280;
    float _539 = _282;
    float _541 = _284;
    float _543 = _274 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _545 = _537 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _547 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[35].x, _543);
    float _549 = fma(_539, (*spvDescriptorSet0.fp_c5)._m0[102].x, _545);
    float _551 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[35].z, _547);
    float _553 = fma(_541, (*spvDescriptorSet0.fp_c5)._m0[102].z, _549);
    float _555 = -_551;
    float _557 = fma(_555, _551, 1.0);
    float _559 = -_551;
    float _561 = fma(_559, (*spvDescriptorSet0.fp_c3)._m0[35].z, _276);
    float _563 = _553 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _565 = -_551;
    float _567 = fma(_565, (*spvDescriptorSet0.fp_c3)._m0[35].y, _274);
    float _569 = _557 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _571 = -_551;
    float _573 = fma(_571, (*spvDescriptorSet0.fp_c3)._m0[35].x, _272);
    float _575 = fma(_561, _569, _162);
    float _577 = fma(_567, _569, _164);
    float _579 = fma(_573, _569, _166);
    float _581 = -_575;
    bool _583 = _581 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _585 = float(_583);
    float _587 = -_575;
    bool _589 = _587 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _591 = float(_589);
    float _593 = _585 + _591;
    float _595 = trunc(_563);
    int _597 = int(_595);
    float _599 = precise::min(_593, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _601 = _537 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _603 = fma(_539, (*spvDescriptorSet0.fp_c5)._m0[101].x, _601);
    float _605 = trunc(_599);
    int _607 = int(_605);
    float _609 = fma(_541, (*spvDescriptorSet0.fp_c5)._m0[101].z, _603);
    float _611 = _609 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    int _613 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _615 = _597 + _613;
    int _617 = _615 + 1;
    float _619 = trunc(_611);
    int _621 = int(_619);
    int _623 = _607 << 6;
    int _625 = _623 + 48;
    uint _628 = uint(int(uint(_625) >> uint(2)));
    uint _630 = uint(int(uint(int(_628)) >> uint(2)));
    int _632 = int(_628) & 3;
    float _634 = (*spvDescriptorSet0.fp_c3)._m0[int(_630)][_632];
    int _636 = int(_628) + 1;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    int _640 = _636 & 3;
    float _642 = (*spvDescriptorSet0.fp_c3)._m0[int(_638)][_640];
    int _644 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _646 = _621 + _644;
    int _648 = _646 + 1;
    int _650 = _623 + 32;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    uint _654 = uint(int(uint(int(_652)) >> uint(2)));
    int _656 = int(_652) & 3;
    float _658 = (*spvDescriptorSet0.fp_c3)._m0[int(_654)][_656];
    int _660 = int(_652) + 1;
    uint _662 = uint(int(uint(_660) >> uint(2)));
    int _664 = _660 & 3;
    float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
    bool _668 = _648 >= 0;
    bool _670 = _648 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _672 = !_668;
    bool _674 = _670 || _672;
    int _676 = _623 + 56;
    uint _678 = uint(int(uint(_676) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.fp_c3)._m0[int(_680)][_682];
    int _686 = int(_678) + 1;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    int _690 = _686 & 3;
    float _692 = (*spvDescriptorSet0.fp_c3)._m0[int(_688)][_690];
    bool _694 = _617 < 0;
    bool _696 = _694 || _674;
    bool _698 = _617 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _700 = _698 || _696;
    uint _702 = uint(int(uint(_623) >> uint(2)));
    uint _704 = uint(int(uint(int(_702)) >> uint(2)));
    int _706 = int(_702) & 3;
    float _708 = (*spvDescriptorSet0.fp_c3)._m0[int(_704)][_706];
    int _710 = int(_702) + 1;
    uint _712 = uint(int(uint(_710) >> uint(2)));
    int _714 = _710 & 3;
    float _716 = (*spvDescriptorSet0.fp_c3)._m0[int(_712)][_714];
    int _718 = _623 + 16;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    uint _722 = uint(int(uint(int(_720)) >> uint(2)));
    int _724 = int(_720) & 3;
    float _726 = (*spvDescriptorSet0.fp_c3)._m0[int(_722)][_724];
    int _728 = int(_720) + 1;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    int _732 = _728 & 3;
    float _734 = (*spvDescriptorSet0.fp_c3)._m0[int(_730)][_732];
    int _736 = _648;
    float _738 = _577;
    if (!_700)
    {
        int _740 = _617 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _742 = _740 + _648;
        _736 = _742;
    }
    int _744 = _736;
    float _746 = 0.0;
    if (!_700)
    {
        float _748 = floor(_611);
        _746 = _748;
    }
    float _750 = _746;
    int _752 = _623 + 40;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    uint _756 = uint(int(uint(int(_754)) >> uint(2)));
    int _758 = int(_754) & 3;
    float _760 = (*spvDescriptorSet0.fp_c3)._m0[int(_756)][_758];
    int _762 = int(_754) + 1;
    uint _764 = uint(int(uint(_762) >> uint(2)));
    int _766 = _762 & 3;
    float _768 = (*spvDescriptorSet0.fp_c3)._m0[int(_764)][_766];
    int _770 = 0;
    if (!_700)
    {
        int _772 = _744 << 2;
        _770 = _772;
    }
    int _774 = _770;
    int _776 = 0;
    int _778 = _774;
    if (!_700)
    {
        int _780 = _744 >> 2;
        _776 = _780;
    }
    int _782 = _776;
    int _784 = _782;
    if (!_700)
    {
        int _786 = 12 & _774;
        _778 = _786;
    }
    int _788 = _778;
    float _790 = _577 * _642;
    if (!_700)
    {
        int _792 = _782 << 4;
        int _794 = _792 + _788;
        _784 = _794;
    }
    int _796 = _784;
    int _798 = _623 + 24;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
    int _808 = int(_800) + 1;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    int _812 = _808 & 3;
    float _814 = (*spvDescriptorSet0.fp_c3)._m0[int(_810)][_812];
    float _816 = fma(_579, _634, _790);
    float _818 = _577 * _666;
    int _820 = _623 + 8;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.fp_c3)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.fp_c3)._m0[int(_832)][_834];
    float _838 = fma(_579, _658, _818);
    float _840 = fma(_575, _684, _816);
    float _842 = as_type<float>(_788);
    if (!_700)
    {
        uint _844 = uint(int(uint(_796) >> uint(2)));
        uint _846 = uint(int(uint(int(_844)) >> uint(2)));
        int _848 = int(_844) & 3;
        float _850 = (*spvDescriptorSet0.fp_c5)._m0[int(_846)][_848];
        _842 = _850;
    }
    float _852 = _842;
    float _854 = _840 + _692;
    float _856 = _692;
    if (!_700)
    {
        float _858 = floor(_563);
        _856 = _858;
    }
    float _860 = _856;
    float _862 = _577 * _716;
    float _864 = fma(_579, _708, _862);
    float _866 = 1.0 / _854;
    float _868 = _577 * _734;
    float _870 = fma(_579, _726, _868);
    float _872 = _870;
    if (!_700)
    {
        float _874 = -_860;
        float _876 = _563 + _874;
        _738 = _876;
    }
    float _878 = _738;
    float _880 = fma(_575, _760, _838);
    float2 _2558 = float2(_83, _85);
    float4 _882 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2558, float2(0.0), isnan(_2558)), int2(0), component::w).xyzw;
    float _884 = _882.x;
    float _886 = _882.y;
    float _888 = _882.z;
    float _890 = _882.w;
    float _892 = fma(_575, _806, _870);
    if (!_700)
    {
        float _894 = -_750;
        float _896 = _611 + _894;
        _872 = _896;
    }
    float _898 = _872;
    float _900 = _892 + _814;
    float _902 = fma(_575, _828, _864);
    float _904 = rint(_599);
    float _906 = precise::max(_904, 0.0);
    uint _908 = uint(_906);
    uint _910 = clamp(_908, 0u, 65535u);
    float _912 = _902 + _836;
    float _914 = _880 + _768;
    float _916 = _900 * _866;
    float _918 = _912 * _866;
    float _920 = _914 * _866;
    float _922 = precise::clamp(_920, 0.0, 1.0);
    float _924 = _726;
    if (!_700)
    {
        float _926 = rint(_852);
        float _928 = precise::max(_926, 0.0);
        uint _930 = uint(_928);
        uint _932 = clamp(_930, 0u, 65535u);
        _924 = as_type<float>(_932);
    }
    float _934 = _924;
    float3 _2643 = float3(_918, _916, float(int(_910)));
    float3 _2647 = select(_2643, float3(0.0), isnan(_2643));
    float _936 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2647.xy, uint(rint(_2647.z)), _922);
    float _938 = _934;
    if (!_700)
    {
        float3 _2660 = float3(_898, _878, float(as_type<int>(_934)));
        float3 _2662 = select(_2660, float3(0.0), isnan(_2660));
        float _940 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2662.xy, uint(rint(_2662.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2662.xy, uint(rint(_2662.z)), level(0.0)).x;
        _938 = _940;
    }
    float _942 = _938;
    float _944 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _946 = precise::min(_162, -1.0000000116860974230803549289703e-07);
    float _948 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _950 = -_102;
    float _952 = fma(_950, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _954 = -_104;
    float _956 = fma(_954, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _958 = -_106;
    float _960 = fma(_958, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _962 = 1.0 / _946;
    float _964 = -_108;
    float _966 = fma(_964, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _968 = 1.0 / _952;
    float _970 = 1.0 / _956;
    float _972 = _962 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _974 = 1.0 / _960;
    float _976 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _978 = -_162;
    float _980 = fma(_968, _976, _978);
    float _982 = floor(_948);
    float _984 = abs(_980);
    float _986 = _984 * _972;
    float _988 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _990 = -_162;
    float _992 = fma(_970, _988, _990);
    float _994 = abs(_992);
    float _996 = _994 * _972;
    float _998 = 1.0 / _966;
    float _1000 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1002 = -_162;
    float _1004 = fma(_974, _1000, _1002);
    float _1006 = abs(_1004);
    float _1008 = _1006 * _972;
    float _1010 = floor(_944);
    float _1012 = -_982;
    float _1014 = _948 + _1012;
    float _1016 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1018 = _1014 + _1016;
    float _1020 = exp2(_986);
    float _1022 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1024 = -_162;
    float _1026 = fma(_998, _1022, _1024);
    float _1028 = -_1018;
    float _1030 = _1028 + 1.0;
    float _1032 = abs(_1026);
    float _1034 = _1032 * _972;
    float _1036 = exp2(_996);
    float _1038 = -_1010;
    float _1040 = _944 + _1038;
    float _1042 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1044 = _1040 + _1042;
    float _1046 = exp2(_1008);
    float _1048 = _1044 * _1030;
    float _1050 = -_1044;
    float _1052 = _1050 + 1.0;
    float _1054 = _1018 * _1044;
    float _1056 = abs(_1048);
    float _1058 = _1056 * _1020;
    float _1060 = _1018 * _1052;
    float _1062 = _1030 * _1052;
    float _1064 = exp2(_1034);
    float _1066 = abs(_1054);
    float _1068 = _1066 * _1036;
    float _1070 = _1058 + _1068;
    float _1072 = abs(_1060);
    float _1074 = _1072 * _1046;
    float _1076 = _1074 + _1070;
    float _1078 = abs(_1062);
    float _1080 = _1078 * _1064;
    float _1082 = _1080 + _1076;
    float _1084 = -_1080;
    bool _1086 = _1076 != _1084;
    bool _1088 = isnan(_1076);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(_1084);
    bool _1094 = _1090 || _1092;
    float _1096 = -_162;
    float _1098 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1100 = _1096 + _1098;
    float _1102 = 1.0 / _1082;
    float _1104 = _1068 * _1102;
    float _1106 = _1058 * _1102;
    float _1108 = _1074 * _1102;
    float _1110 = _1080 * _1102;
    float _1112 = _1094 ? _1104 : 0.25;
    float _1114 = _1094 ? _1106 : 0.25;
    float _1116 = _1094 ? _1108 : 0.25;
    float _1118 = _1112 * _886;
    float _1120 = fma(_1114, _884, _1118);
    float _1122 = _1114;
    if (_700)
    {
        _1122 = 1.0;
    }
    float _1124 = _1122;
    float _1126 = fma(_1116, _888, _1120);
    float _1128 = _1124;
    if (!_700)
    {
        int _1130 = _744 << 4;
        int _1132 = _1130 + 1648;
        int _1134 = _796 + 8048;
        uint _1136 = uint(int(uint(_1134) >> uint(2)));
        uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
        int _1140 = int(_1136) & 3;
        float _1142 = (*spvDescriptorSet0.fp_c5)._m0[int(_1138)][_1140];
        uint _1144 = uint(int(uint(_1132) >> uint(2)));
        uint _1146 = uint(int(uint(int(_1144)) >> uint(2)));
        int _1148 = int(_1144) & 3;
        float _1150 = (*spvDescriptorSet0.fp_c5)._m0[int(_1146)][_1148];
        int _1152 = int(_1144) + 1;
        uint _1154 = uint(int(uint(_1152) >> uint(2)));
        int _1156 = _1152 & 3;
        float _1158 = (*spvDescriptorSet0.fp_c5)._m0[int(_1154)][_1156];
        int _1160 = _1132 + 8;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
        int _1166 = int(_1162) & 3;
        float _1168 = (*spvDescriptorSet0.fp_c5)._m0[int(_1164)][_1166];
        int _1170 = int(_1162) + 1;
        uint _1172 = uint(int(uint(_1170) >> uint(2)));
        int _1174 = _1170 & 3;
        float _1176 = (*spvDescriptorSet0.fp_c5)._m0[int(_1172)][_1174];
        float _1178 = _537 * _1158;
        float _1180 = 1.0 / _1142;
        float _1182 = fma(_539, _1150, _1178);
        float _1184 = fma(_541, _1168, _1182);
        float _1186 = _1184 + _1176;
        float _1188 = precise::clamp(_1186, 0.0, 1.0);
        float _1190 = -_1188;
        float _1192 = _1190 + _942;
        float _1194 = _1142 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1196 = fma(_1180, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1192);
        float _1198 = _1194 * _1196;
        float _1200 = exp2(_1198);
        float _1202 = 0.0 + _1200;
        float _1204 = precise::clamp(_1202, 0.0, 1.0);
        _1128 = _1204;
    }
    float _1206 = _1128;
    float _1208 = precise::min(_1206, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1210 = -_162;
    float _1212 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1214 = _1210 + _1212;
    float _1216 = _1094 ? _1110 : 0.25;
    float _1218 = _1100 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1220 = precise::clamp(_1218, 0.0, 1.0);
    float _1222 = -_936;
    float _1224 = _1222 + 1.0;
    float _1226 = _1214 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1228 = precise::clamp(_1226, 0.0, 1.0);
    float _1230 = -_1208;
    float _1232 = _1230 + 1.0;
    float _1234 = fma(_1216, _890, _1126);
    float _1236 = fma(_1220, _1224, _936);
    float _1238 = fma(_1228, _1232, _1208);
    float _1240 = precise::min(_1234, 1.0);
    out.m_58.x = _1236;
    out.m_58.y = _1238;
    out.m_58.z = _1240;
    out.m_58.w = 1.0;
    out.m_60.x = _97;
    out.m_60.y = 0.5;
    out.m_60.z = 0.5;
    out.m_60.w = 1.0;
    return out;
}

