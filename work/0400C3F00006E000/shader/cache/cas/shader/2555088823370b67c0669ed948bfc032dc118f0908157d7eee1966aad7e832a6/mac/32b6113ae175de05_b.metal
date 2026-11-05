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
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
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
    float2 _1311 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1311, float2(0.0), isnan(_1311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1311, float2(0.0), isnan(_1311))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1326 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1326, float2(0.0), isnan(_1326))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1326, float2(0.0), isnan(_1326))).x;
    float2 _1334 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1334, float2(0.0), isnan(_1334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1334, float2(0.0), isnan(_1334))).x;
    float2 _1342 = float2(_81, _83);
    float4 _96 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1342, float2(0.0), isnan(_1342)), int2(0), component::x).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float2 _1358 = float2(_81, _83);
    float4 _106 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1358, float2(0.0), isnan(_1358)), int2(0), component::x).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_49.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_51.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_51.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_53.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_53.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_49.y;
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
    float _186 = _182 * _156;
    float _188 = _182 * _154;
    float _190 = _186 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _194 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[32].x, _190);
    float _196 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _198 = _178 * _196;
    float _200 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[30].x, _192);
    float _202 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[32].z, _194);
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _206 = _184 * _204;
    float _208 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[30].z, _200);
    float _210 = -_188;
    float _212 = fma(_198, _152, _210);
    float _214 = _202 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _216 = -_182;
    float _218 = _216 + _206;
    float _220 = _208 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _222 = -_186;
    float _224 = fma(_198, _162, _222);
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _228 = _214 + _226;
    float _230 = -_188;
    float _232 = fma(_206, _158, _230);
    float _234 = -_186;
    float _236 = fma(_206, _160, _234);
    float _238 = -_182;
    float _240 = _238 + _198;
    float _242 = _218 * _212;
    float _244 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _246 = _220 + _244;
    float _248 = _228 * _228;
    float _250 = _236 * _240;
    float _252 = -_242;
    float _254 = fma(_232, _240, _252);
    float _256 = _232 * _224;
    float _258 = fma(_246, _246, _248);
    float _260 = -_250;
    float _262 = fma(_218, _224, _260);
    float _264 = _254 * _254;
    float _266 = -_256;
    float _268 = fma(_236, _212, _266);
    float _270 = sqrt(_258);
    float _272 = _186 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _274 = fma(_262, _262, _264);
    float _276 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[31].x, _272);
    float _278 = fma(_268, _268, _274);
    float _280 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[31].z, _276);
    float _282 = rsqrt(_278);
    float _284 = _280 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _288 = _270 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _290 = _262 * _282;
    float _292 = _254 * _282;
    float _294 = _268 * _282;
    float _296 = _282;
    float _298 = _258;
    float _300 = _220;
    float _302 = _214;
    if (!_288)
    {
        _296 = _284;
    }
    float _304 = _296;
    bool _306 = !_288;
    float _308 = _304;
    if (!_306)
    {
        float _310 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _312 = _270 + _310;
        float _314 = _284 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _316 = rsqrt(_258);
        float _318 = -_284;
        float _320 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _322 = _318 + _320;
        float _324 = abs(_314);
        float _326 = abs(_312);
        float _328 = precise::max(_324, _326);
        float _330 = _322 * _322;
        bool _332 = _328 >= 16.0;
        float _334 = _246 * _316;
        float _336 = _228 * _316;
        float _338 = -_246;
        float _340 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[41].z, _338);
        float _342 = _312;
        float _344 = _314;
        int _347 = as_type<int>(_328);
        if (_332)
        {
            float _349 = _312 * 0.0625;
            _342 = _349;
        }
        float _351 = _342;
        if (_332)
        {
            float _353 = _314 * 0.0625;
            _344 = _353;
        }
        float _355 = _344;
        float _357 = -_228;
        float _359 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[41].z, _357);
        float _361 = fma(_340, _340, _330);
        float _363 = abs(_351);
        bool _365 = _363 != 0.0;
        bool _367 = isnan(_363);
        bool _369 = _365 || _367;
        bool _371 = isnan(0.0);
        bool _373 = _369 || _371;
        float _375 = fma(_359, _359, _361);
        float _377 = abs(_355);
        bool _379 = _377 == 0.0;
        float _381 = abs(_355);
        bool _383 = _381 == 0.0;
        bool _385 = !_373;
        bool _387 = _383 && _385;
        float _389 = sqrt(_375);
        bool _391 = false;
        if (_387)
        {
            bool _393 = as_type<int>(_355) >= 0;
            _391 = _393;
        }
        bool _395 = _391;
        int _397 = _395 ? (-1) : 0;
        if (_387)
        {
            int _399 = _395 ? 0 : 1078530011;
            _347 = _399;
        }
        int _401 = _347;
        int _403 = _401;
        if (_387)
        {
            int _405 = int(0x80000000) & as_type<int>(_351);
            int _407 = _401 | _405;
            _298 = as_type<float>(_407);
        }
        float _409 = _298;
        bool _411 = !_373;
        bool _413 = _411 && _379;
        float _415 = _409;
        float _417 = _409;
        if (!_413)
        {
            float _419 = abs(_351);
            bool _421 = _419 != as_type<float>(0x7f800000u /* inf */);
            bool _423 = isnan(_419);
            bool _425 = _421 || _423;
            bool _427 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _429 = _425 || _427;
            float _431 = abs(_355);
            bool _433 = _431 == as_type<float>(0x7f800000u /* inf */);
            float _435 = abs(_355);
            bool _437 = _435 == as_type<float>(0x7f800000u /* inf */);
            bool _439 = !_429;
            bool _441 = _437 && _439;
            if (_441)
            {
                bool _443 = as_type<int>(_355) >= 0;
                _397 = _443 ? (-1) : 0;
            }
            int _445 = _397;
            if (_441)
            {
                _403 = 1075235812;
            }
            int _447 = _403;
            int _449 = _447;
            if (_441)
            {
                int _451 = ~_445;
                int _453 = (_451 != 0) ? _447 : 1061752795;
                _449 = _453;
            }
            int _455 = _449;
            if (_441)
            {
                int _457 = int(0x80000000) & as_type<int>(_351);
                int _459 = _455 | _457;
                _415 = as_type<float>(_459);
            }
            float _461 = _415;
            bool _463 = !_429;
            bool _465 = _463 && _433;
            _417 = _461;
            if (!_465)
            {
                float _467 = abs(_351);
                float _469 = abs(_355);
                float _471 = precise::max(_467, _469);
                float _473 = abs(_351);
                float _475 = abs(_355);
                float _477 = precise::min(_473, _475);
                float _479 = 1.0 / _471;
                float _481 = abs(_351);
                float _483 = abs(_355);
                bool _485 = _481 > _483;
                bool _487 = as_type<int>(_355) >= 0;
                float _489 = _477 * _479;
                float _491 = abs(_351);
                float _493 = abs(_355);
                float _495 = _491 + _493;
                int _497 = as_type<int>(_351) & int(0x80000000);
                float _499 = _489 * _489;
                bool _501 = _495 > as_type<float>(0x7f800000u /* inf */);
                bool _503 = isnan(_495);
                bool _505 = _501 || _503;
                bool _507 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _509 = _505 || _507;
                float _511 = _499 + 11.33538818359375;
                float _513 = fma(_499, _511, 28.84246826171875);
                float _515 = fma(_499, _513, 19.6966705322265625);
                float _517 = fma(_499, -0.82336294651031494140625, -5.674867153167724609375);
                float _519 = fma(_499, _517, -6.565555095672607421875);
                float _521 = 1.0 / _515;
                float _523 = _499 * _519;
                float _525 = _489 * _523;
                float _527 = fma(_525, _521, _489);
                float _529 = _527;
                _417 = _495;
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
                if (!_509)
                {
                    int _545 = _497 | _543;
                    _417 = as_type<float>(_545);
                }
            }
        }
        float _547 = _417;
        float _549 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _551 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _553 = _389 + _551;
        float _555 = fma(_334, _549, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _557 = fma(_336, _549, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _308 = _553;
        _300 = _555;
        _302 = _557;
    }
    float _559 = _308;
    float _561 = _300;
    float _563 = _302;
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
    float _587 = fma(_585, (*spvDescriptorSet0.fp_c3)._m0[35].x, _290);
    float _589 = -_573;
    float _591 = fma(_589, (*spvDescriptorSet0.fp_c3)._m0[35].y, _292);
    float _593 = _579 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _595 = _575 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _597 = fma(_583, _593, _182);
    float _599 = trunc(_595);
    int _601 = int(_599);
    float _603 = fma(_591, _593, _186);
    float _605 = fma(_587, _593, _188);
    float _607 = -_597;
    bool _609 = _607 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _611 = float(_609);
    float _613 = -_597;
    bool _615 = _613 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _617 = float(_615);
    float _619 = _611 + _617;
    float _621 = precise::min(_619, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _623 = _559 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    int _625 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _627 = _601 + _625;
    int _629 = _627 + 1;
    float _631 = trunc(_621);
    int _633 = int(_631);
    float _635 = fma(_561, (*spvDescriptorSet0.fp_c5)._m0[101].x, _623);
    float _637 = fma(_563, (*spvDescriptorSet0.fp_c5)._m0[101].z, _635);
    float _639 = _637 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _641 = trunc(_639);
    int _643 = int(_641);
    int _645 = _633 << 6;
    int _647 = _645 + 48;
    uint _650 = uint(int(uint(_647) >> uint(2)));
    uint _652 = uint(int(uint(int(_650)) >> uint(2)));
    int _654 = int(_650) & 3;
    float _656 = (*spvDescriptorSet0.fp_c3)._m0[int(_652)][_654];
    int _658 = int(_650) + 1;
    uint _660 = uint(int(uint(_658) >> uint(2)));
    int _662 = _658 & 3;
    float _664 = (*spvDescriptorSet0.fp_c3)._m0[int(_660)][_662];
    uint _666 = uint(int(uint(_645) >> uint(2)));
    uint _668 = uint(int(uint(int(_666)) >> uint(2)));
    int _670 = int(_666) & 3;
    float _672 = (*spvDescriptorSet0.fp_c3)._m0[int(_668)][_670];
    int _674 = int(_666) + 1;
    uint _676 = uint(int(uint(_674) >> uint(2)));
    int _678 = _674 & 3;
    float _680 = (*spvDescriptorSet0.fp_c3)._m0[int(_676)][_678];
    int _682 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _684 = _643 + _682;
    int _686 = _684 + 1;
    bool _688 = _686 >= 0;
    int _690 = _645 + 56;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
    int _700 = int(_692) + 1;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    int _704 = _700 & 3;
    float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
    bool _708 = _686 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _710 = !_688;
    bool _712 = _708 || _710;
    bool _714 = _629 < 0;
    bool _716 = _714 || _712;
    int _718 = _645 + 16;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    uint _722 = uint(int(uint(int(_720)) >> uint(2)));
    int _724 = int(_720) & 3;
    float _726 = (*spvDescriptorSet0.fp_c3)._m0[int(_722)][_724];
    int _728 = int(_720) + 1;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    int _732 = _728 & 3;
    float _734 = (*spvDescriptorSet0.fp_c3)._m0[int(_730)][_732];
    bool _736 = _629 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _738 = _736 || _716;
    int _740 = _645 + 32;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    int _758 = _686;
    if (!_738)
    {
        int _760 = _629 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _762 = _760 + _686;
        _758 = _762;
    }
    int _764 = _758;
    float _766 = _603 * _664;
    float _768 = fma(_605, _656, _766);
    float _770 = _603 * _680;
    float _772 = fma(_605, _672, _770);
    int _774 = as_type<int>(_672);
    if (!_738)
    {
        int _776 = _764 << 2;
        _774 = _776;
    }
    int _778 = _774;
    float _780 = fma(_597, _698, _768);
    int _782 = as_type<int>(_698);
    int _784 = as_type<int>(_706);
    if (!_738)
    {
        int _786 = _764 >> 2;
        _782 = _786;
    }
    int _788 = _782;
    float _790 = _780 + _706;
    int _792 = _788;
    if (!_738)
    {
        int _794 = 12 & _778;
        _784 = _794;
    }
    int _796 = _784;
    int _798 = _645 + 8;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
    int _808 = int(_800) + 1;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    int _812 = _808 & 3;
    float _814 = (*spvDescriptorSet0.fp_c3)._m0[int(_810)][_812];
    float _816 = _603 * _734;
    if (!_738)
    {
        int _818 = _788 << 4;
        int _820 = _818 + _796;
        _792 = _820;
    }
    int _822 = _792;
    float _824 = 1.0 / _790;
    float _826 = fma(_605, _726, _816);
    int _828 = _645 + 24;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.fp_c3)._m0[int(_832)][_834];
    int _838 = int(_830) + 1;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    int _842 = _838 & 3;
    float _844 = (*spvDescriptorSet0.fp_c3)._m0[int(_840)][_842];
    float _846 = _603 * _756;
    float _848 = _756;
    if (!_738)
    {
        float _850 = floor(_639);
        _848 = _850;
    }
    float _852 = _848;
    float _854 = fma(_605, _748, _846);
    int _856 = _645 + 40;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.fp_c3)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.fp_c3)._m0[int(_868)][_870];
    float _874 = as_type<float>(_796);
    if (!_738)
    {
        float _876 = floor(_595);
        _874 = _876;
    }
    float _878 = _874;
    float _880 = _766;
    if (!_738)
    {
        uint _882 = uint(int(uint(_822) >> uint(2)));
        uint _884 = uint(int(uint(int(_882)) >> uint(2)));
        int _886 = int(_882) & 3;
        float _888 = (*spvDescriptorSet0.fp_c5)._m0[int(_884)][_886];
        _880 = _888;
    }
    float _890 = _880;
    float _892 = rint(_621);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    uint _898 = clamp(_896, 0u, 65535u);
    float _900 = _878;
    if (!_738)
    {
        float _902 = -_878;
        float _904 = _595 + _902;
        _900 = _904;
    }
    float _906 = _900;
    float _908 = fma(_597, _806, _772);
    float _910 = _908 + _814;
    float _912 = fma(_597, _836, _826);
    float _914 = _912 + _844;
    float _916 = fma(_597, _864, _854);
    float _918 = _916 + _872;
    float _920 = _872;
    if (!_738)
    {
        float _922 = -_852;
        float _924 = _639 + _922;
        _920 = _924;
    }
    float _926 = _920;
    float _928 = _910 * _824;
    float _930 = _914 * _824;
    float _932 = _918 * _824;
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float2 _2671 = float2(_81, _83);
    float4 _936 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2671, float2(0.0), isnan(_2671)), int2(0), component::w).xyzw;
    float _938 = _936.x;
    float _940 = _936.y;
    float _942 = _936.z;
    float _944 = _936.w;
    float _946 = _918;
    if (!_738)
    {
        float _948 = rint(_890);
        float _950 = precise::max(_948, 0.0);
        uint _952 = uint(_950);
        uint _954 = clamp(_952, 0u, 65535u);
        _946 = as_type<float>(_954);
    }
    float _956 = _946;
    float3 _2707 = float3(_928, _930, float(int(_898)));
    float3 _2711 = select(_2707, float3(0.0), isnan(_2707));
    float _958 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2711.xy, uint(rint(_2711.z)), _934);
    float _960 = _956;
    if (!_738)
    {
        float3 _2724 = float3(_926, _906, float(as_type<int>(_956)));
        float3 _2726 = select(_2724, float3(0.0), isnan(_2724));
        float _962 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2726.xy, uint(rint(_2726.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2726.xy, uint(rint(_2726.z)), level(0.0)).x;
        _960 = _962;
    }
    float _964 = _960;
    float _966 = -_100;
    float _968 = fma(_966, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _970 = precise::min(_182, -1.0000000116860974230803549289703e-07);
    float _972 = -_98;
    float _974 = fma(_972, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _976 = -_102;
    float _978 = fma(_976, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _980 = -_104;
    float _982 = fma(_980, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _984 = 1.0 / _968;
    float _986 = 1.0 / _970;
    float _988 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _990 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _992 = 1.0 / _974;
    float _994 = 1.0 / _978;
    float _996 = _986 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _998 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1000 = -_182;
    float _1002 = fma(_984, _998, _1000);
    float _1004 = abs(_1002);
    float _1006 = _1004 * _996;
    float _1008 = 1.0 / _982;
    float _1010 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1012 = -_182;
    float _1014 = fma(_992, _1010, _1012);
    float _1016 = abs(_1014);
    float _1018 = _1016 * _996;
    float _1020 = floor(_988);
    float _1022 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1024 = -_182;
    float _1026 = fma(_994, _1022, _1024);
    float _1028 = abs(_1026);
    float _1030 = _1028 * _996;
    float _1032 = floor(_990);
    float _1034 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1036 = -_182;
    float _1038 = fma(_1008, _1034, _1036);
    float _1040 = abs(_1038);
    float _1042 = _1040 * _996;
    float _1044 = exp2(_1006);
    float _1046 = -_1020;
    float _1048 = _988 + _1046;
    float _1050 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1052 = _1048 + _1050;
    float _1054 = exp2(_1018);
    float _1056 = -_1032;
    float _1058 = _990 + _1056;
    float _1060 = -_1052;
    float _1062 = _1060 + 1.0;
    float _1064 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1066 = _1058 + _1064;
    float _1068 = exp2(_1030);
    float _1070 = _1052 * _1066;
    float _1072 = -_1066;
    float _1074 = _1072 + 1.0;
    float _1076 = _1066 * _1062;
    float _1078 = abs(_1070);
    float _1080 = _1078 * _1044;
    float _1082 = _1052 * _1074;
    float _1084 = _1062 * _1074;
    float _1086 = exp2(_1042);
    float _1088 = abs(_1076);
    float _1090 = _1088 * _1054;
    float _1092 = abs(_1082);
    float _1094 = _1092 * _1068;
    float _1096 = _1090 + _1080;
    float _1098 = _1094 + _1096;
    float _1100 = abs(_1084);
    float _1102 = _1100 * _1086;
    float _1104 = _1102 + _1098;
    float _1106 = -_1102;
    bool _1108 = _1098 != _1106;
    bool _1110 = isnan(_1098);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(_1106);
    bool _1116 = _1112 || _1114;
    float _1118 = 1.0 / _1104;
    float _1120 = _1080 * _1118;
    float _1122 = _1090 * _1118;
    float _1124 = _1094 * _1118;
    float _1126 = _1116 ? _1120 : 0.25;
    float _1128 = _1116 ? _1122 : 0.25;
    float _1130 = _1102 * _1118;
    float _1132 = _1116 ? _1124 : 0.25;
    float _1134 = _1126 * _110;
    float _1136 = _1116 ? _1130 : 0.25;
    float _1138 = fma(_1128, _108, _1134);
    float _1140 = fma(_1132, _112, _1138);
    float _1142 = fma(_1136, _114, _1140);
    float _1144 = _1140;
    if (_738)
    {
        _1144 = 1.0;
    }
    float _1146 = _1144;
    float _1148 = _1126 * _940;
    float _1150 = fma(_1128, _938, _1148);
    float _1152 = _1146;
    if (!_738)
    {
        int _1154 = _764 << 4;
        int _1156 = _1154 + 1648;
        int _1158 = _822 + 8048;
        uint _1160 = uint(int(uint(_1158) >> uint(2)));
        uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
        int _1164 = int(_1160) & 3;
        float _1166 = (*spvDescriptorSet0.fp_c5)._m0[int(_1162)][_1164];
        uint _1168 = uint(int(uint(_1156) >> uint(2)));
        uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
        int _1172 = int(_1168) & 3;
        float _1174 = (*spvDescriptorSet0.fp_c5)._m0[int(_1170)][_1172];
        int _1176 = int(_1168) + 1;
        uint _1178 = uint(int(uint(_1176) >> uint(2)));
        int _1180 = _1176 & 3;
        float _1182 = (*spvDescriptorSet0.fp_c5)._m0[int(_1178)][_1180];
        int _1184 = _1156 + 8;
        uint _1186 = uint(int(uint(_1184) >> uint(2)));
        uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
        int _1190 = int(_1186) & 3;
        float _1192 = (*spvDescriptorSet0.fp_c5)._m0[int(_1188)][_1190];
        int _1194 = int(_1186) + 1;
        uint _1196 = uint(int(uint(_1194) >> uint(2)));
        int _1198 = _1194 & 3;
        float _1200 = (*spvDescriptorSet0.fp_c5)._m0[int(_1196)][_1198];
        float _1202 = 1.0 / _1166;
        float _1204 = _559 * _1182;
        float _1206 = fma(_561, _1174, _1204);
        float _1208 = fma(_563, _1192, _1206);
        float _1210 = _1208 + _1200;
        float _1212 = precise::clamp(_1210, 0.0, 1.0);
        float _1214 = -_1212;
        float _1216 = _1214 + _964;
        float _1218 = _1166 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1220 = fma(_1202, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1216);
        float _1222 = _1218 * _1220;
        float _1224 = exp2(_1222);
        float _1226 = 0.0 + _1224;
        float _1228 = precise::clamp(_1226, 0.0, 1.0);
        _1152 = _1228;
    }
    float _1230 = _1152;
    float _1232 = -_182;
    float _1234 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1236 = _1232 + _1234;
    float _1238 = precise::min(_1230, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1240 = -_182;
    float _1242 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1244 = _1240 + _1242;
    float _1246 = fma(_1132, _942, _1150);
    float _1248 = _1236 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = -_958;
    float _1254 = _1252 + 1.0;
    float _1256 = _1244 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = -_1238;
    float _1262 = _1260 + 1.0;
    float _1264 = fma(_1136, _944, _1246);
    float _1266 = fma(_1250, _1254, _958);
    float _1268 = fma(_1258, _1262, _1238);
    float _1270 = precise::min(_1142, 1.0);
    float _1272 = precise::min(_1264, 1.0);
    out.m_56.x = _1266;
    out.m_56.y = _1268;
    out.m_56.z = _1272;
    out.m_56.w = 1.0;
    out.m_58.x = _1270;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

