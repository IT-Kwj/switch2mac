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
    bool _1030 = false;
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
    float2 _1298 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1298, float2(0.0), isnan(_1298))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1298, float2(0.0), isnan(_1298))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1313 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1313, float2(0.0), isnan(_1313))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1313, float2(0.0), isnan(_1313))).x;
    float2 _1321 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1321, float2(0.0), isnan(_1321))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1321, float2(0.0), isnan(_1321))).x;
    float _95 = in.m_49.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_51.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_51.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_53.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_53.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _79 * _99;
    float _133 = _79 * _105;
    float _135 = _79 * _111;
    float _137 = _79 * _117;
    float _139 = _79 * _123;
    float _141 = _79 * _129;
    float _143 = -_87;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].x, _145);
    float _149 = _147 * _131;
    float _151 = _147 * _133;
    float _153 = -_91;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = _149 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _161 = _149 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _163 = -_151;
    float _165 = fma(_157, _137, _163);
    float _167 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].x, _159);
    float _169 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].x, _161);
    float _171 = -_93;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[41].x, _173);
    float _177 = -_149;
    float _179 = fma(_157, _135, _177);
    float _181 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].z, _167);
    float _183 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[30].z, _169);
    float _185 = -_147;
    float _187 = _185 + _157;
    float _189 = -_151;
    float _191 = fma(_175, _139, _189);
    float _193 = _181 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _195 = _183 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _197 = -_149;
    float _199 = fma(_175, _141, _197);
    float _201 = -_147;
    float _203 = _201 + _175;
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _207 = _193 + _205;
    float _209 = _187 * _191;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _213 = _195 + _211;
    float _215 = _179 * _203;
    float _217 = _207 * _207;
    float _219 = -_209;
    float _221 = fma(_165, _203, _219);
    float _223 = _165 * _199;
    float _225 = -_215;
    float _227 = fma(_187, _199, _225);
    float _229 = fma(_213, _213, _217);
    float _231 = _221 * _221;
    float _233 = -_223;
    float _235 = fma(_179, _191, _233);
    float _237 = sqrt(_229);
    float _239 = fma(_227, _227, _231);
    float _241 = _149 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _243 = fma(_235, _235, _239);
    float _245 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].x, _241);
    float _247 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].z, _245);
    float _249 = rsqrt(_243);
    float _251 = _247 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _255 = _237 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _257 = _235 * _249;
    float _259 = _227 * _249;
    float _261 = _221 * _249;
    float _263 = _239;
    float _265 = _235;
    int _268 = as_type<int>(_237);
    float _270 = _193;
    if (!_255)
    {
        _263 = _195;
    }
    float _272 = _263;
    float _274 = _272;
    if (!_255)
    {
        _265 = _251;
    }
    float _276 = _265;
    bool _278 = !_255;
    float _280 = _276;
    if (!_278)
    {
        float _282 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _284 = _237 + _282;
        float _286 = _251 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _288 = rsqrt(_229);
        float _290 = -_251;
        float _292 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _294 = _290 + _292;
        float _296 = abs(_286);
        float _298 = abs(_284);
        float _300 = precise::max(_296, _298);
        float _302 = _294 * _294;
        bool _304 = _300 >= 16.0;
        float _306 = _213 * _288;
        float _308 = _207 * _288;
        float _310 = -_213;
        float _312 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[41].z, _310);
        float _314 = -_207;
        float _316 = fma(_308, (*spvDescriptorSet0.fp_c3)._m0[41].z, _314);
        float _318 = _284;
        float _320 = _286;
        float _322 = _316;
        if (_304)
        {
            float _324 = _284 * 0.0625;
            _318 = _324;
        }
        float _326 = _318;
        if (_304)
        {
            float _328 = _286 * 0.0625;
            _320 = _328;
        }
        float _330 = _320;
        float _332 = fma(_312, _312, _302);
        float _334 = abs(_326);
        bool _336 = _334 != 0.0;
        bool _338 = isnan(_334);
        bool _340 = _336 || _338;
        bool _342 = isnan(0.0);
        bool _344 = _340 || _342;
        float _346 = fma(_316, _316, _332);
        float _348 = abs(_330);
        bool _350 = _348 == 0.0;
        float _352 = abs(_330);
        bool _354 = _352 == 0.0;
        bool _356 = !_344;
        bool _358 = _354 && _356;
        float _360 = sqrt(_346);
        bool _362 = false;
        int _364 = as_type<int>(_346);
        if (_358)
        {
            bool _366 = as_type<int>(_330) >= 0;
            _362 = _366;
        }
        bool _368 = _362;
        int _370 = _368 ? (-1) : 0;
        if (_358)
        {
            int _372 = _368 ? 0 : 1078530011;
            _268 = _372;
        }
        int _374 = _268;
        if (_358)
        {
            int _376 = int(0x80000000) & as_type<int>(_326);
            int _378 = _374 | _376;
            _322 = as_type<float>(_378);
        }
        float _380 = _322;
        bool _382 = !_344;
        bool _384 = _382 && _350;
        float _386 = _380;
        float _388 = _380;
        if (!_384)
        {
            float _390 = abs(_326);
            bool _392 = _390 != as_type<float>(0x7f800000u /* inf */);
            bool _394 = isnan(_390);
            bool _396 = _392 || _394;
            bool _398 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _400 = _396 || _398;
            float _402 = abs(_330);
            bool _404 = _402 == as_type<float>(0x7f800000u /* inf */);
            float _406 = abs(_330);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            bool _410 = !_400;
            bool _412 = _408 && _410;
            if (_412)
            {
                bool _414 = as_type<int>(_330) >= 0;
                _370 = _414 ? (-1) : 0;
            }
            int _416 = _370;
            if (_412)
            {
                _364 = 1075235812;
            }
            int _418 = _364;
            int _420 = _418;
            if (_412)
            {
                int _422 = ~_416;
                int _424 = (_422 != 0) ? _418 : 1061752795;
                _420 = _424;
            }
            int _426 = _420;
            if (_412)
            {
                int _428 = int(0x80000000) & as_type<int>(_326);
                int _430 = _426 | _428;
                _386 = as_type<float>(_430);
            }
            float _432 = _386;
            bool _434 = !_400;
            bool _436 = _434 && _404;
            _388 = _432;
            if (!_436)
            {
                float _438 = abs(_326);
                float _440 = abs(_330);
                float _442 = precise::max(_438, _440);
                float _444 = abs(_326);
                float _446 = abs(_330);
                float _448 = precise::min(_444, _446);
                float _450 = 1.0 / _442;
                float _452 = abs(_326);
                float _454 = abs(_330);
                bool _456 = _452 > _454;
                bool _458 = as_type<int>(_330) >= 0;
                float _460 = _448 * _450;
                float _462 = abs(_326);
                float _464 = abs(_330);
                float _466 = _462 + _464;
                int _468 = as_type<int>(_326) & int(0x80000000);
                float _470 = _460 * _460;
                bool _472 = _466 > as_type<float>(0x7f800000u /* inf */);
                bool _474 = isnan(_466);
                bool _476 = _472 || _474;
                bool _478 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _480 = _476 || _478;
                float _482 = _470 + 11.33538818359375;
                float _484 = fma(_470, _482, 28.84246826171875);
                float _486 = fma(_470, _484, 19.6966705322265625);
                float _488 = fma(_470, -0.82336294651031494140625, -5.674867153167724609375);
                float _490 = fma(_470, _488, -6.565555095672607421875);
                float _492 = 1.0 / _486;
                float _494 = _470 * _490;
                float _496 = _460 * _494;
                float _498 = fma(_496, _492, _460);
                float _500 = _498;
                _388 = _466;
                if (_456)
                {
                    float _502 = -_498;
                    float _504 = _502 + 1.57079637050628662109375;
                    _500 = _504;
                }
                float _506 = _500;
                int _508 = as_type<int>(_506);
                if (!_458)
                {
                    float _510 = -_506;
                    float _512 = _510 + 3.1415927410125732421875;
                    _508 = as_type<int>(_512);
                }
                int _514 = _508;
                if (!_480)
                {
                    int _516 = _468 | _514;
                    _388 = as_type<float>(_516);
                }
            }
        }
        float _518 = _388;
        float _520 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _522 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _524 = _360 + _522;
        float _526 = fma(_306, _520, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _528 = fma(_308, _520, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _280 = _524;
        _274 = _526;
        _270 = _528;
    }
    float _530 = _280;
    float _532 = _274;
    float _534 = _270;
    float2 _1996 = float2(_81, _83);
    float4 _537 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1996, float2(0.0), isnan(_1996)), int2(0), component::x).xyzw;
    float _539 = _537.x;
    float _541 = _537.y;
    float _543 = _537.z;
    float _545 = _537.w;
    float2 _2012 = float2(_81, _83);
    float4 _547 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2012, float2(0.0), isnan(_2012)), int2(0), component::w).xyzw;
    float _549 = _547.x;
    float _551 = _547.y;
    float _553 = _547.z;
    float _555 = _547.w;
    float _557 = _261 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _559 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _561 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[35].x, _557);
    float _563 = floor(_559);
    float _565 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[35].z, _561);
    float _567 = -_565;
    float _569 = fma(_567, _565, 1.0);
    float _571 = -_565;
    float _573 = fma(_571, (*spvDescriptorSet0.fp_c3)._m0[35].z, _257);
    float _575 = -_565;
    float _577 = fma(_575, (*spvDescriptorSet0.fp_c3)._m0[35].x, _259);
    float _579 = -_565;
    float _581 = fma(_579, (*spvDescriptorSet0.fp_c3)._m0[35].y, _261);
    float _583 = _569 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _585 = fma(_573, _583, _147);
    float _587 = fma(_577, _583, _151);
    float _589 = fma(_581, _583, _149);
    float _591 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _593 = -_563;
    float _595 = _559 + _593;
    float _597 = -_585;
    bool _599 = _597 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _601 = float(_599);
    float _603 = -_585;
    bool _605 = _603 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _607 = float(_605);
    float _609 = floor(_591);
    float _611 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _613 = _595 + _611;
    float _615 = _601 + _607;
    float _617 = -_613;
    float _619 = _617 + 1.0;
    float _621 = precise::min(_615, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _623 = trunc(_621);
    int _625 = int(_623);
    float _627 = -_609;
    float _629 = _591 + _627;
    float _631 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _633 = _629 + _631;
    float _635 = -_633;
    float _637 = _635 + 1.0;
    float _639 = _633 * _613;
    float _641 = _633 * _619;
    float _643 = _613 * _637;
    int _645 = _625 << 6;
    float _647 = _637 * _619;
    bool _649 = _625 != 0;
    int _651 = _645 + 16;
    uint _654 = uint(int(uint(_651) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.fp_c3)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.fp_c3)._m0[int(_664)][_666];
    int _670 = _645 + 24;
    uint _672 = uint(int(uint(_670) >> uint(2)));
    uint _674 = uint(int(uint(int(_672)) >> uint(2)));
    int _676 = int(_672) & 3;
    float _678 = (*spvDescriptorSet0.fp_c3)._m0[int(_674)][_676];
    int _680 = int(_672) + 1;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    int _684 = _680 & 3;
    float _686 = (*spvDescriptorSet0.fp_c3)._m0[int(_682)][_684];
    uint _688 = uint(int(uint(_645) >> uint(2)));
    uint _690 = uint(int(uint(int(_688)) >> uint(2)));
    int _692 = int(_688) & 3;
    float _694 = (*spvDescriptorSet0.fp_c3)._m0[int(_690)][_692];
    int _696 = int(_688) + 1;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    int _700 = _696 & 3;
    float _702 = (*spvDescriptorSet0.fp_c3)._m0[int(_698)][_700];
    int _704 = _645 + 32;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.fp_c3)._m0[int(_716)][_718];
    int _722 = _645 + 48;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[int(_734)][_736];
    int _740 = _645 + 8;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    float _758 = _589 * _668;
    float _760 = fma(_587, _660, _758);
    float _762 = precise::min(_147, -1.0000000116860974230803549289703e-07);
    float _764 = fma(_585, _678, _760);
    float _766 = _764 + _686;
    float _768 = 1.0 / _762;
    float _770 = _589 * _702;
    float _772 = fma(_587, _694, _770);
    int _774 = _645 + 40;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    uint _778 = uint(int(uint(int(_776)) >> uint(2)));
    int _780 = int(_776) & 3;
    float _782 = (*spvDescriptorSet0.fp_c3)._m0[int(_778)][_780];
    int _784 = int(_776) + 1;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    int _788 = _784 & 3;
    float _790 = (*spvDescriptorSet0.fp_c3)._m0[int(_786)][_788];
    float _792 = _589 * _720;
    float _794 = fma(_587, _712, _792);
    float _796 = _589 * _738;
    float _798 = fma(_587, _730, _796);
    float _800 = fma(_585, _748, _772);
    float _802 = _800 + _756;
    float _804 = _768 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _806 = fma(_585, _782, _794);
    float _808 = _806 + _790;
    float _810 = -_539;
    float _812 = fma(_810, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _814 = -_543;
    float _816 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _818 = -_541;
    float _820 = fma(_818, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _822 = -_545;
    float _824 = fma(_822, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _826 = 1.0 / _812;
    float _828 = 1.0 / _820;
    float _830 = 1.0 / _816;
    float _832 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _834 = -_147;
    float _836 = fma(_826, _832, _834);
    float _838 = abs(_836);
    float _840 = _838 * _804;
    float _842 = 1.0 / _824;
    float _844 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _846 = -_147;
    float _848 = fma(_828, _844, _846);
    float _850 = abs(_848);
    float _852 = _850 * _804;
    int _854 = _645 + 56;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    uint _858 = uint(int(uint(int(_856)) >> uint(2)));
    int _860 = int(_856) & 3;
    float _862 = (*spvDescriptorSet0.fp_c3)._m0[int(_858)][_860];
    int _864 = int(_856) + 1;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    int _868 = _864 & 3;
    float _870 = (*spvDescriptorSet0.fp_c3)._m0[int(_866)][_868];
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _874 = -_147;
    float _876 = fma(_830, _872, _874);
    float _878 = exp2(_840);
    float _880 = abs(_876);
    float _882 = _880 * _804;
    float _884 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _886 = -_147;
    float _888 = fma(_842, _884, _886);
    float _890 = exp2(_852);
    float _892 = abs(_888);
    float _894 = _892 * _804;
    float _896 = exp2(_882);
    float _898 = abs(_643);
    float _900 = _898 * _878;
    float _902 = exp2(_894);
    float _904 = abs(_639);
    float _906 = _904 * _890;
    float _908 = _900 + _906;
    float _910 = abs(_641);
    float _912 = _910 * _896;
    float _914 = _912 + _908;
    float _916 = abs(_647);
    float _918 = _916 * _902;
    float _920 = _918 + _914;
    float _922 = -_918;
    bool _924 = _914 != _922;
    bool _926 = isnan(_914);
    bool _928 = _924 || _926;
    bool _930 = isnan(_922);
    bool _932 = _928 || _930;
    float _934 = fma(_585, _862, _798);
    float _936 = 1.0 / _920;
    float _938 = _934 + _870;
    float _940 = 1.0 / _938;
    float _942 = _906 * _936;
    float _944 = _900 * _936;
    float _946 = _912 * _936;
    float _948 = _918 * _936;
    float _950 = _932 ? _942 : 0.25;
    float _952 = _932 ? _944 : 0.25;
    float _954 = _932 ? _946 : 0.25;
    float _956 = _950 * _551;
    float _958 = _932 ? _948 : 0.25;
    float _960 = _802 * _940;
    float _962 = fma(_952, _549, _956);
    float _964 = _808 * _940;
    float _966 = precise::clamp(_964, 0.0, 1.0);
    float _968 = fma(_954, _553, _962);
    float _970 = _766 * _940;
    float _972 = fma(_958, _555, _968);
    float _1028;
    if (!_649)
    {
        float _974 = rint(_621);
        float _976 = precise::max(_974, 0.0);
        uint _978 = uint(_976);
        uint _980 = clamp(_978, 0u, 65535u);
        float _982 = _966 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _984 = fma(_982, 0.5, _970);
        float _986 = fma(_982, 0.5, _960);
        float _988 = fma(_982, -0.5, _960);
        float _990 = fma(_982, -0.5, _970);
        float3 _2712 = float3(_960, _984, float(int(_980)));
        float3 _2716 = select(_2712, float3(0.0), isnan(_2712));
        float _992 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2716.xy, uint(rint(_2716.z)), _966);
        float3 _2725 = float3(_986, _984, float(int(_980)));
        float3 _2727 = select(_2725, float3(0.0), isnan(_2725));
        float _994 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2727.xy, uint(rint(_2727.z)), _966);
        float3 _2736 = float3(_988, _984, float(int(_980)));
        float3 _2738 = select(_2736, float3(0.0), isnan(_2736));
        float _996 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2738.xy, uint(rint(_2738.z)), _966);
        float3 _2747 = float3(_986, _970, float(int(_980)));
        float3 _2749 = select(_2747, float3(0.0), isnan(_2747));
        float _998 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2749.xy, uint(rint(_2749.z)), _966);
        float3 _2758 = float3(_960, _970, float(int(_980)));
        float3 _2760 = select(_2758, float3(0.0), isnan(_2758));
        float _1000 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2760.xy, uint(rint(_2760.z)), _966);
        float3 _2769 = float3(_988, _970, float(int(_980)));
        float3 _2771 = select(_2769, float3(0.0), isnan(_2769));
        float _1002 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2771.xy, uint(rint(_2771.z)), _966);
        float3 _2780 = float3(_986, _990, float(int(_980)));
        float3 _2782 = select(_2780, float3(0.0), isnan(_2780));
        float _1004 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2782.xy, uint(rint(_2782.z)), _966);
        float3 _2791 = float3(_960, _990, float(int(_980)));
        float3 _2793 = select(_2791, float3(0.0), isnan(_2791));
        float _1006 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2793.xy, uint(rint(_2793.z)), _966);
        float3 _2802 = float3(_988, _990, float(int(_980)));
        float3 _2804 = select(_2802, float3(0.0), isnan(_2802));
        float _1008 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), _966);
        float _1010 = _994 + _992;
        float _1012 = _1010 + _996;
        float _1014 = _1012 + _998;
        float _1016 = _1014 + _1000;
        float _1018 = _1016 + _1002;
        float _1020 = _1018 + _1004;
        float _1022 = _1020 + _1006;
        float _1024 = _1022 + _1008;
        float _1026 = _1024 * 0.111111111938953399658203125;
        _1028 = _1026;
        _1030 = true;
    }
    else
    {
        float _1032 = rint(_621);
        float _1034 = precise::max(_1032, 0.0);
        uint _1036 = uint(_1034);
        uint _1038 = clamp(_1036, 0u, 65535u);
        float3 _2851 = float3(_960, _970, float(int(_1038)));
        float3 _2853 = select(_2851, float3(0.0), isnan(_2851));
        float _1040 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2853.xy, uint(rint(_2853.z)), _966);
        _1028 = _1040;
    }
    _1030 = false;
    float _1042 = _1028;
    float _1044 = _530 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1046 = _530 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1048 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1044);
    float _1050 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1046);
    float _1052 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1048);
    float _1054 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1050);
    float _1056 = _1052 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1058 = _1054 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1060 = -_147;
    float _1062 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1064 = _1060 + _1062;
    float _1066 = trunc(_1056);
    int _1068 = int(_1066);
    float _1070 = trunc(_1058);
    int _1072 = int(_1070);
    int _1074 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1076 = _1068 + _1074;
    int _1078 = _1076 + 1;
    bool _1080 = _1078 >= 0;
    int _1082 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1084 = _1072 + _1082;
    int _1086 = _1084 + 1;
    float _1088 = -_147;
    float _1090 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1092 = _1088 + _1090;
    bool _1094 = _1078 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1096 = !_1080;
    bool _1098 = _1094 || _1096;
    bool _1100 = _1086 < 0;
    bool _1102 = _1100 || _1098;
    bool _1104 = _1086 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1106 = _1104 || _1102;
    float _1108 = as_type<float>(_1068);
    if (_1106)
    {
        _1108 = 1.0;
    }
    float _1110 = _1108;
    float _1112 = _1110;
    if (!_1106)
    {
        int _1114 = _1086 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1116 = _1114 + _1078;
        float _1118 = floor(_1056);
        int _1120 = _1116 << 2;
        int _1122 = _1116 >> 2;
        int _1124 = 12 & _1120;
        int _1126 = _1122 << 4;
        int _1128 = _1126 + _1124;
        float _1130 = floor(_1058);
        uint _1132 = uint(int(uint(_1128) >> uint(2)));
        uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
        int _1136 = int(_1132) & 3;
        float _1138 = (*spvDescriptorSet0.fp_c5)._m0[int(_1134)][_1136];
        float _1140 = -_1118;
        float _1142 = _1056 + _1140;
        float _1144 = -_1130;
        float _1146 = _1058 + _1144;
        float _1148 = rint(_1138);
        float _1150 = precise::max(_1148, 0.0);
        uint _1152 = uint(_1150);
        uint _1154 = clamp(_1152, 0u, 65535u);
        float3 _3040 = float3(_1142, _1146, float(int(_1154)));
        float3 _3042 = select(_3040, float3(0.0), isnan(_3040));
        float _1156 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3042.xy, uint(rint(_3042.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3042.xy, uint(rint(_3042.z)), level(0.0)).x;
        int _1158 = _1116 << 4;
        int _1160 = _1158 + 1648;
        int _1162 = _1128 + 8048;
        uint _1164 = uint(int(uint(_1162) >> uint(2)));
        uint _1166 = uint(int(uint(int(_1164)) >> uint(2)));
        int _1168 = int(_1164) & 3;
        float _1170 = (*spvDescriptorSet0.fp_c5)._m0[int(_1166)][_1168];
        uint _1172 = uint(int(uint(_1160) >> uint(2)));
        uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
        int _1176 = int(_1172) & 3;
        float _1178 = (*spvDescriptorSet0.fp_c5)._m0[int(_1174)][_1176];
        int _1180 = int(_1172) + 1;
        uint _1182 = uint(int(uint(_1180) >> uint(2)));
        int _1184 = _1180 & 3;
        float _1186 = (*spvDescriptorSet0.fp_c5)._m0[int(_1182)][_1184];
        int _1188 = _1160 + 8;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
        int _1194 = int(_1190) & 3;
        float _1196 = (*spvDescriptorSet0.fp_c5)._m0[int(_1192)][_1194];
        int _1198 = int(_1190) + 1;
        uint _1200 = uint(int(uint(_1198) >> uint(2)));
        int _1202 = _1198 & 3;
        float _1204 = (*spvDescriptorSet0.fp_c5)._m0[int(_1200)][_1202];
        float _1206 = _1170 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1208 = _530 * _1186;
        float _1210 = fma(_532, _1178, _1208);
        float _1212 = 1.0 / _1170;
        float _1214 = fma(_534, _1196, _1210);
        float _1216 = _1214 + _1204;
        float _1218 = precise::clamp(_1216, 0.0, 1.0);
        float _1220 = -_1218;
        float _1222 = _1220 + _1156;
        float _1224 = fma(_1212, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1222);
        float _1226 = _1206 * _1224;
        float _1228 = exp2(_1226);
        float _1230 = 0.0 + _1228;
        float _1232 = precise::clamp(_1230, 0.0, 1.0);
        _1112 = _1232;
    }
    float _1234 = _1112;
    float _1236 = precise::min(_1234, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1238 = _1092 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1240 = precise::clamp(_1238, 0.0, 1.0);
    float _1242 = -_1042;
    float _1244 = _1242 + 1.0;
    float _1246 = _1064 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = precise::min(_972, 1.0);
    float _1252 = -_1236;
    float _1254 = _1252 + 1.0;
    float _1256 = fma(_1240, _1244, _1042);
    float _1258 = fma(_1248, _1254, _1236);
    out.m_56.x = _1256;
    out.m_56.y = _1258;
    out.m_56.z = _1250;
    out.m_56.w = 1.0;
    out.m_58.x = 1.0;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

