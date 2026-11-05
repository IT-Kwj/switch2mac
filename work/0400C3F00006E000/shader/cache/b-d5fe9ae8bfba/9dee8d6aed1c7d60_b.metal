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
    bool _1042 = false;
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
    float2 _1310 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1310, float2(0.0), isnan(_1310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1310, float2(0.0), isnan(_1310))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1325 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1325, float2(0.0), isnan(_1325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1325, float2(0.0), isnan(_1325))).x;
    float2 _1333 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1333, float2(0.0), isnan(_1333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1333, float2(0.0), isnan(_1333))).x;
    float _95 = in.m_49.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_51.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_51.y;
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
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _147 = 1.0 / _145;
    float _149 = -_91;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _153 = -_93;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _157 = 1.0 / _151;
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _161 = _147 * _159;
    float _163 = 1.0 / _155;
    float _165 = _161 * _131;
    float _167 = _161 * _133;
    float _169 = _165 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _173 = _157 * _171;
    float _175 = _165 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _177 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].x, _169);
    float _179 = -_167;
    float _181 = fma(_173, _135, _179);
    float _183 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].x, _175);
    float _185 = -_165;
    float _187 = fma(_173, _137, _185);
    float _189 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _191 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _193 = _163 * _191;
    float _195 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[30].z, _183);
    float _197 = -_161;
    float _199 = _197 + _173;
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _203 = -_167;
    float _205 = fma(_193, _139, _203);
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _209 = -_165;
    float _211 = fma(_193, _141, _209);
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _215 = _201 + _213;
    float _217 = -_161;
    float _219 = _217 + _193;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _223 = _207 + _221;
    float _225 = _199 * _205;
    float _227 = _215 * _215;
    float _229 = _187 * _219;
    float _231 = -_225;
    float _233 = fma(_181, _219, _231);
    float _235 = fma(_223, _223, _227);
    float _237 = _181 * _211;
    float _239 = -_229;
    float _241 = fma(_199, _211, _239);
    float _243 = _233 * _233;
    float _245 = sqrt(_235);
    float _247 = -_237;
    float _249 = fma(_187, _205, _247);
    float _251 = _165 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _253 = fma(_241, _241, _243);
    float _255 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].x, _251);
    float _257 = fma(_249, _249, _253);
    float _259 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[31].z, _255);
    float _261 = rsqrt(_257);
    float _263 = _259 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _267 = _245 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _269 = _241 * _261;
    float _271 = _233 * _261;
    float _273 = _249 * _261;
    float _275 = _261;
    float _277 = _249;
    float _279 = _201;
    if (!_267)
    {
        _275 = _207;
    }
    float _281 = _275;
    float _283 = _281;
    if (!_267)
    {
        _277 = _263;
    }
    float _285 = _277;
    bool _287 = !_267;
    float _289 = _285;
    if (!_287)
    {
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _293 = _245 + _291;
        float _295 = _263 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = rsqrt(_235);
        float _299 = -_263;
        float _301 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _303 = _299 + _301;
        float _305 = abs(_295);
        float _307 = abs(_293);
        float _309 = precise::max(_305, _307);
        float _311 = _303 * _303;
        bool _313 = _309 >= 16.0;
        float _315 = _223 * _297;
        float _317 = _215 * _297;
        float _319 = -_223;
        float _321 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[41].z, _319);
        float _323 = -_215;
        float _325 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _323);
        float _327 = _293;
        float _329 = _295;
        int _332 = as_type<int>(_303);
        float _334 = _325;
        if (_313)
        {
            float _336 = _293 * 0.0625;
            _327 = _336;
        }
        float _338 = _327;
        if (_313)
        {
            float _340 = _295 * 0.0625;
            _329 = _340;
        }
        float _342 = _329;
        float _344 = fma(_321, _321, _311);
        float _346 = abs(_338);
        bool _348 = _346 != 0.0;
        bool _350 = isnan(_346);
        bool _352 = _348 || _350;
        bool _354 = isnan(0.0);
        bool _356 = _352 || _354;
        float _358 = fma(_325, _325, _344);
        float _360 = abs(_342);
        bool _362 = _360 == 0.0;
        float _364 = abs(_342);
        bool _366 = _364 == 0.0;
        bool _368 = !_356;
        bool _370 = _366 && _368;
        float _372 = sqrt(_358);
        bool _374 = false;
        int _376 = as_type<int>(_358);
        if (_370)
        {
            bool _378 = as_type<int>(_342) >= 0;
            _374 = _378;
        }
        bool _380 = _374;
        int _382 = _380 ? (-1) : 0;
        if (_370)
        {
            int _384 = _380 ? 0 : 1078530011;
            _332 = _384;
        }
        int _386 = _332;
        if (_370)
        {
            int _388 = int(0x80000000) & as_type<int>(_338);
            int _390 = _386 | _388;
            _334 = as_type<float>(_390);
        }
        float _392 = _334;
        bool _394 = !_356;
        bool _396 = _394 && _362;
        float _398 = _392;
        float _400 = _392;
        if (!_396)
        {
            float _402 = abs(_338);
            bool _404 = _402 != as_type<float>(0x7f800000u /* inf */);
            bool _406 = isnan(_402);
            bool _408 = _404 || _406;
            bool _410 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _412 = _408 || _410;
            float _414 = abs(_342);
            bool _416 = _414 == as_type<float>(0x7f800000u /* inf */);
            float _418 = abs(_342);
            bool _420 = _418 == as_type<float>(0x7f800000u /* inf */);
            bool _422 = !_412;
            bool _424 = _420 && _422;
            if (_424)
            {
                bool _426 = as_type<int>(_342) >= 0;
                _382 = _426 ? (-1) : 0;
            }
            int _428 = _382;
            if (_424)
            {
                _376 = 1075235812;
            }
            int _430 = _376;
            int _432 = _430;
            if (_424)
            {
                int _434 = ~_428;
                int _436 = (_434 != 0) ? _430 : 1061752795;
                _432 = _436;
            }
            int _438 = _432;
            if (_424)
            {
                int _440 = int(0x80000000) & as_type<int>(_338);
                int _442 = _438 | _440;
                _398 = as_type<float>(_442);
            }
            float _444 = _398;
            bool _446 = !_412;
            bool _448 = _446 && _416;
            _400 = _444;
            if (!_448)
            {
                float _450 = abs(_338);
                float _452 = abs(_342);
                float _454 = precise::max(_450, _452);
                float _456 = abs(_338);
                float _458 = abs(_342);
                float _460 = precise::min(_456, _458);
                float _462 = 1.0 / _454;
                float _464 = abs(_338);
                float _466 = abs(_342);
                bool _468 = _464 > _466;
                bool _470 = as_type<int>(_342) >= 0;
                float _472 = _460 * _462;
                float _474 = abs(_338);
                float _476 = abs(_342);
                float _478 = _474 + _476;
                int _480 = as_type<int>(_338) & int(0x80000000);
                float _482 = _472 * _472;
                bool _484 = _478 > as_type<float>(0x7f800000u /* inf */);
                bool _486 = isnan(_478);
                bool _488 = _484 || _486;
                bool _490 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _492 = _488 || _490;
                float _494 = _482 + 11.33538818359375;
                float _496 = fma(_482, _494, 28.84246826171875);
                float _498 = fma(_482, _496, 19.6966705322265625);
                float _500 = fma(_482, -0.82336294651031494140625, -5.674867153167724609375);
                float _502 = fma(_482, _500, -6.565555095672607421875);
                float _504 = 1.0 / _498;
                float _506 = _482 * _502;
                float _508 = _472 * _506;
                float _510 = fma(_508, _504, _472);
                float _512 = _510;
                _400 = _478;
                if (_468)
                {
                    float _514 = -_510;
                    float _516 = _514 + 1.57079637050628662109375;
                    _512 = _516;
                }
                float _518 = _512;
                int _520 = as_type<int>(_518);
                if (!_470)
                {
                    float _522 = -_518;
                    float _524 = _522 + 3.1415927410125732421875;
                    _520 = as_type<int>(_524);
                }
                int _526 = _520;
                if (!_492)
                {
                    int _528 = _480 | _526;
                    _400 = as_type<float>(_528);
                }
            }
        }
        float _530 = _400;
        float _532 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _534 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _536 = _372 + _534;
        float _538 = fma(_315, _532, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _540 = fma(_317, _532, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _289 = _536;
        _283 = _538;
        _279 = _540;
    }
    float _542 = _289;
    float _544 = _283;
    float _546 = _279;
    float2 _2020 = float2(_81, _83);
    float4 _549 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2020, float2(0.0), isnan(_2020)), int2(0), component::x).xyzw;
    float _551 = _549.x;
    float _553 = _549.y;
    float _555 = _549.z;
    float _557 = _549.w;
    float2 _2036 = float2(_81, _83);
    float4 _559 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2036, float2(0.0), isnan(_2036)), int2(0), component::w).xyzw;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float _567 = _559.w;
    float _569 = _271 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _571 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].x, _569);
    float _573 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].z, _571);
    float _575 = -_573;
    float _577 = fma(_575, _573, 1.0);
    float _579 = -_573;
    float _581 = fma(_579, (*spvDescriptorSet0.fp_c3)._m0[35].z, _273);
    float _583 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _585 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _587 = _577 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _589 = -_573;
    float _591 = fma(_589, (*spvDescriptorSet0.fp_c3)._m0[35].x, _269);
    float _593 = floor(_583);
    float _595 = -_573;
    float _597 = fma(_595, (*spvDescriptorSet0.fp_c3)._m0[35].y, _271);
    float _599 = fma(_581, _587, _161);
    float _601 = fma(_591, _587, _167);
    float _603 = fma(_597, _587, _165);
    float _605 = -_599;
    bool _607 = _605 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _609 = float(_607);
    float _611 = -_599;
    bool _613 = _611 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _615 = float(_613);
    float _617 = _609 + _615;
    float _619 = floor(_585);
    float _621 = -_593;
    float _623 = _583 + _621;
    float _625 = precise::min(_617, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _627 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _629 = _623 + _627;
    float _631 = trunc(_625);
    int _633 = int(_631);
    float _635 = -_629;
    float _637 = _635 + 1.0;
    float _639 = -_619;
    float _641 = _585 + _639;
    float _643 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _645 = _641 + _643;
    int _647 = _633 << 6;
    float _649 = -_645;
    float _651 = _649 + 1.0;
    float _653 = _629 * _645;
    float _655 = _645 * _637;
    uint _658 = uint(int(uint(_647) >> uint(2)));
    uint _660 = uint(int(uint(int(_658)) >> uint(2)));
    int _662 = int(_658) & 3;
    float _664 = (*spvDescriptorSet0.fp_c3)._m0[int(_660)][_662];
    int _666 = int(_658) + 1;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    int _670 = _666 & 3;
    float _672 = (*spvDescriptorSet0.fp_c3)._m0[int(_668)][_670];
    float _674 = _629 * _651;
    float _676 = _637 * _651;
    bool _678 = _633 != 0;
    int _680 = _647 + 16;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    uint _684 = uint(int(uint(int(_682)) >> uint(2)));
    int _686 = int(_682) & 3;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
    int _690 = int(_682) + 1;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    int _694 = _690 & 3;
    float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
    int _698 = _647 + 8;
    uint _700 = uint(int(uint(_698) >> uint(2)));
    uint _702 = uint(int(uint(int(_700)) >> uint(2)));
    int _704 = int(_700) & 3;
    float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
    int _708 = int(_700) + 1;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    int _712 = _708 & 3;
    float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
    int _716 = _647 + 24;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.fp_c3)._m0[int(_720)][_722];
    int _726 = int(_718) + 1;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    int _730 = _726 & 3;
    float _732 = (*spvDescriptorSet0.fp_c3)._m0[int(_728)][_730];
    int _734 = _647 + 32;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    uint _738 = uint(int(uint(int(_736)) >> uint(2)));
    int _740 = int(_736) & 3;
    float _742 = (*spvDescriptorSet0.fp_c3)._m0[int(_738)][_740];
    int _744 = int(_736) + 1;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    int _748 = _744 & 3;
    float _750 = (*spvDescriptorSet0.fp_c3)._m0[int(_746)][_748];
    int _752 = _647 + 48;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    uint _756 = uint(int(uint(int(_754)) >> uint(2)));
    int _758 = int(_754) & 3;
    float _760 = (*spvDescriptorSet0.fp_c3)._m0[int(_756)][_758];
    int _762 = int(_754) + 1;
    uint _764 = uint(int(uint(_762) >> uint(2)));
    int _766 = _762 & 3;
    float _768 = (*spvDescriptorSet0.fp_c3)._m0[int(_764)][_766];
    float _770 = _603 * _672;
    float _772 = fma(_601, _664, _770);
    int _774 = _647 + 40;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    uint _778 = uint(int(uint(int(_776)) >> uint(2)));
    int _780 = int(_776) & 3;
    float _782 = (*spvDescriptorSet0.fp_c3)._m0[int(_778)][_780];
    int _784 = int(_776) + 1;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    int _788 = _784 & 3;
    float _790 = (*spvDescriptorSet0.fp_c3)._m0[int(_786)][_788];
    float _792 = _603 * _696;
    float _794 = fma(_601, _688, _792);
    float _796 = precise::min(_161, -1.0000000116860974230803549289703e-07);
    float _798 = fma(_599, _706, _772);
    float _800 = 1.0 / _796;
    float _802 = _798 + _714;
    float _804 = fma(_599, _724, _794);
    float _806 = _804 + _732;
    float _808 = _603 * _750;
    float _810 = _800 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _812 = fma(_601, _742, _808);
    float _814 = _603 * _768;
    float _816 = fma(_601, _760, _814);
    float _818 = fma(_599, _782, _812);
    float _820 = _818 + _790;
    float _822 = -_551;
    float _824 = fma(_822, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _826 = -_553;
    float _828 = fma(_826, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _830 = -_555;
    float _832 = fma(_830, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _834 = -_557;
    float _836 = fma(_834, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _838 = 1.0 / _828;
    float _840 = 1.0 / _824;
    float _842 = 1.0 / _832;
    float _844 = 1.0 / _836;
    float _846 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _848 = -_161;
    float _850 = fma(_840, _846, _848);
    int _852 = _647 + 56;
    uint _854 = uint(int(uint(_852) >> uint(2)));
    uint _856 = uint(int(uint(int(_854)) >> uint(2)));
    int _858 = int(_854) & 3;
    float _860 = (*spvDescriptorSet0.fp_c3)._m0[int(_856)][_858];
    int _862 = int(_854) + 1;
    uint _864 = uint(int(uint(_862) >> uint(2)));
    int _866 = _862 & 3;
    float _868 = (*spvDescriptorSet0.fp_c3)._m0[int(_864)][_866];
    float _870 = abs(_850);
    float _872 = _870 * _810;
    float _874 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _876 = -_161;
    float _878 = fma(_838, _874, _876);
    float _880 = abs(_878);
    float _882 = _880 * _810;
    float _884 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _886 = -_161;
    float _888 = fma(_842, _884, _886);
    float _890 = exp2(_872);
    float _892 = abs(_888);
    float _894 = _892 * _810;
    float _896 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _898 = -_161;
    float _900 = fma(_844, _896, _898);
    float _902 = exp2(_882);
    float _904 = abs(_900);
    float _906 = _904 * _810;
    float _908 = exp2(_894);
    float _910 = abs(_655);
    float _912 = _910 * _890;
    float _914 = exp2(_906);
    float _916 = abs(_653);
    float _918 = _916 * _902;
    float _920 = _912 + _918;
    float _922 = abs(_674);
    float _924 = _922 * _908;
    float _926 = _924 + _920;
    float _928 = fma(_599, _860, _816);
    float _930 = abs(_676);
    float _932 = _930 * _914;
    float _934 = _928 + _868;
    float _936 = _932 + _926;
    float _938 = -_932;
    bool _940 = _926 != _938;
    bool _942 = isnan(_926);
    bool _944 = _940 || _942;
    bool _946 = isnan(_938);
    bool _948 = _944 || _946;
    float _950 = 1.0 / _934;
    float _952 = 1.0 / _936;
    float _954 = _918 * _952;
    float _956 = _912 * _952;
    float _958 = _924 * _952;
    float _960 = _932 * _952;
    float _962 = _948 ? _954 : 0.25;
    float _964 = _948 ? _956 : 0.25;
    float _966 = _948 ? _960 : 0.25;
    float _968 = _962 * _563;
    float _970 = _948 ? _958 : 0.25;
    float _972 = fma(_964, _561, _968);
    float _974 = _802 * _950;
    float _976 = fma(_970, _565, _972);
    float _978 = _806 * _950;
    float _980 = _820 * _950;
    float _982 = precise::clamp(_980, 0.0, 1.0);
    float _984 = fma(_966, _567, _976);
    float _1040;
    if (!_678)
    {
        float _986 = rint(_625);
        float _988 = precise::max(_986, 0.0);
        uint _990 = uint(_988);
        uint _992 = clamp(_990, 0u, 65535u);
        float _994 = _982 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _996 = fma(_994, 0.5, _978);
        float _998 = fma(_994, 0.5, _974);
        float _1000 = fma(_994, -0.5, _974);
        float _1002 = fma(_994, -0.5, _978);
        float3 _2736 = float3(_974, _996, float(int(_992)));
        float3 _2740 = select(_2736, float3(0.0), isnan(_2736));
        float _1004 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2740.xy, uint(rint(_2740.z)), _982);
        float3 _2749 = float3(_998, _996, float(int(_992)));
        float3 _2751 = select(_2749, float3(0.0), isnan(_2749));
        float _1006 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2751.xy, uint(rint(_2751.z)), _982);
        float3 _2760 = float3(_1000, _996, float(int(_992)));
        float3 _2762 = select(_2760, float3(0.0), isnan(_2760));
        float _1008 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2762.xy, uint(rint(_2762.z)), _982);
        float3 _2771 = float3(_998, _978, float(int(_992)));
        float3 _2773 = select(_2771, float3(0.0), isnan(_2771));
        float _1010 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2773.xy, uint(rint(_2773.z)), _982);
        float3 _2782 = float3(_974, _978, float(int(_992)));
        float3 _2784 = select(_2782, float3(0.0), isnan(_2782));
        float _1012 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2784.xy, uint(rint(_2784.z)), _982);
        float3 _2793 = float3(_1000, _978, float(int(_992)));
        float3 _2795 = select(_2793, float3(0.0), isnan(_2793));
        float _1014 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2795.xy, uint(rint(_2795.z)), _982);
        float3 _2804 = float3(_998, _1002, float(int(_992)));
        float3 _2806 = select(_2804, float3(0.0), isnan(_2804));
        float _1016 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2806.xy, uint(rint(_2806.z)), _982);
        float3 _2815 = float3(_974, _1002, float(int(_992)));
        float3 _2817 = select(_2815, float3(0.0), isnan(_2815));
        float _1018 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2817.xy, uint(rint(_2817.z)), _982);
        float3 _2826 = float3(_1000, _1002, float(int(_992)));
        float3 _2828 = select(_2826, float3(0.0), isnan(_2826));
        float _1020 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2828.xy, uint(rint(_2828.z)), _982);
        float _1022 = _1006 + _1004;
        float _1024 = _1022 + _1008;
        float _1026 = _1024 + _1010;
        float _1028 = _1026 + _1012;
        float _1030 = _1028 + _1014;
        float _1032 = _1030 + _1016;
        float _1034 = _1032 + _1018;
        float _1036 = _1034 + _1020;
        float _1038 = _1036 * 0.111111111938953399658203125;
        _1040 = _1038;
        _1042 = true;
    }
    else
    {
        float _1044 = rint(_625);
        float _1046 = precise::max(_1044, 0.0);
        uint _1048 = uint(_1046);
        uint _1050 = clamp(_1048, 0u, 65535u);
        float3 _2875 = float3(_974, _978, float(int(_1050)));
        float3 _2877 = select(_2875, float3(0.0), isnan(_2875));
        float _1052 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2877.xy, uint(rint(_2877.z)), _982);
        _1040 = _1052;
    }
    _1042 = false;
    float _1054 = _1040;
    float _1056 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1058 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1060 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1056);
    float _1062 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1058);
    float _1064 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1060);
    float _1066 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1062);
    float _1068 = _1064 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1070 = _1066 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1072 = -_161;
    float _1074 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1076 = _1072 + _1074;
    float _1078 = trunc(_1068);
    int _1080 = int(_1078);
    float _1082 = trunc(_1070);
    int _1084 = int(_1082);
    int _1086 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1088 = _1080 + _1086;
    int _1090 = _1088 + 1;
    bool _1092 = _1090 >= 0;
    int _1094 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1096 = _1084 + _1094;
    int _1098 = _1096 + 1;
    float _1100 = -_161;
    float _1102 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1104 = _1100 + _1102;
    bool _1106 = _1090 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1108 = !_1092;
    bool _1110 = _1106 || _1108;
    bool _1112 = _1098 < 0;
    bool _1114 = _1112 || _1110;
    bool _1116 = _1098 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1118 = _1116 || _1114;
    float _1120 = as_type<float>(_1080);
    if (_1118)
    {
        _1120 = 1.0;
    }
    float _1122 = _1120;
    float _1124 = _1122;
    if (!_1118)
    {
        int _1126 = _1098 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1128 = _1126 + _1090;
        float _1130 = floor(_1068);
        int _1132 = _1128 << 2;
        int _1134 = _1128 >> 2;
        int _1136 = 12 & _1132;
        int _1138 = _1134 << 4;
        int _1140 = _1138 + _1136;
        float _1142 = floor(_1070);
        uint _1144 = uint(int(uint(_1140) >> uint(2)));
        uint _1146 = uint(int(uint(int(_1144)) >> uint(2)));
        int _1148 = int(_1144) & 3;
        float _1150 = (*spvDescriptorSet0.fp_c5)._m0[int(_1146)][_1148];
        float _1152 = -_1130;
        float _1154 = _1068 + _1152;
        float _1156 = -_1142;
        float _1158 = _1070 + _1156;
        float _1160 = rint(_1150);
        float _1162 = precise::max(_1160, 0.0);
        uint _1164 = uint(_1162);
        uint _1166 = clamp(_1164, 0u, 65535u);
        float3 _3064 = float3(_1154, _1158, float(int(_1166)));
        float3 _3066 = select(_3064, float3(0.0), isnan(_3064));
        float _1168 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3066.xy, uint(rint(_3066.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3066.xy, uint(rint(_3066.z)), level(0.0)).x;
        int _1170 = _1128 << 4;
        int _1172 = _1170 + 1648;
        int _1174 = _1140 + 8048;
        uint _1176 = uint(int(uint(_1174) >> uint(2)));
        uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
        int _1180 = int(_1176) & 3;
        float _1182 = (*spvDescriptorSet0.fp_c5)._m0[int(_1178)][_1180];
        uint _1184 = uint(int(uint(_1172) >> uint(2)));
        uint _1186 = uint(int(uint(int(_1184)) >> uint(2)));
        int _1188 = int(_1184) & 3;
        float _1190 = (*spvDescriptorSet0.fp_c5)._m0[int(_1186)][_1188];
        int _1192 = int(_1184) + 1;
        uint _1194 = uint(int(uint(_1192) >> uint(2)));
        int _1196 = _1192 & 3;
        float _1198 = (*spvDescriptorSet0.fp_c5)._m0[int(_1194)][_1196];
        int _1200 = _1172 + 8;
        uint _1202 = uint(int(uint(_1200) >> uint(2)));
        uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
        int _1206 = int(_1202) & 3;
        float _1208 = (*spvDescriptorSet0.fp_c5)._m0[int(_1204)][_1206];
        int _1210 = int(_1202) + 1;
        uint _1212 = uint(int(uint(_1210) >> uint(2)));
        int _1214 = _1210 & 3;
        float _1216 = (*spvDescriptorSet0.fp_c5)._m0[int(_1212)][_1214];
        float _1218 = _1182 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1220 = _542 * _1198;
        float _1222 = fma(_544, _1190, _1220);
        float _1224 = 1.0 / _1182;
        float _1226 = fma(_546, _1208, _1222);
        float _1228 = _1226 + _1216;
        float _1230 = precise::clamp(_1228, 0.0, 1.0);
        float _1232 = -_1230;
        float _1234 = _1232 + _1168;
        float _1236 = fma(_1224, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1234);
        float _1238 = _1218 * _1236;
        float _1240 = exp2(_1238);
        float _1242 = 0.0 + _1240;
        float _1244 = precise::clamp(_1242, 0.0, 1.0);
        _1124 = _1244;
    }
    float _1246 = _1124;
    float _1248 = precise::min(_1246, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1250 = _1104 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = -_1054;
    float _1256 = _1254 + 1.0;
    float _1258 = _1076 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1260 = precise::clamp(_1258, 0.0, 1.0);
    float _1262 = precise::min(_984, 1.0);
    float _1264 = -_1248;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_1252, _1256, _1054);
    float _1270 = fma(_1260, _1266, _1248);
    out.m_56.x = _1268;
    out.m_56.y = _1270;
    out.m_56.z = _1262;
    out.m_56.w = 1.0;
    out.m_58.x = 1.0;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

