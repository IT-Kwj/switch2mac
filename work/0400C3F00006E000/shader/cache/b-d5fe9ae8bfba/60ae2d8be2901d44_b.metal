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
    bool _1056 = false;
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
    float2 _1326 = float2(_81, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1326, float2(0.0), isnan(_1326))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1326, float2(0.0), isnan(_1326))).x;
    float _89 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1341 = float2(_85, _83);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1341, float2(0.0), isnan(_1341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1341, float2(0.0), isnan(_1341))).x;
    float2 _1349 = float2(_81, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1349, float2(0.0), isnan(_1349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1349, float2(0.0), isnan(_1349))).x;
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
    float _171 = _165 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = _157 * _173;
    float _177 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].x, _169);
    float _179 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].x, _171);
    float _181 = -_167;
    float _183 = fma(_175, _135, _181);
    float _185 = -_165;
    float _187 = fma(_175, _137, _185);
    float _189 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _191 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _193 = _163 * _191;
    float _195 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[30].z, _179);
    float _197 = -_161;
    float _199 = _197 + _175;
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
    float _221 = _199 * _205;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _225 = _207 + _223;
    float _227 = _215 * _215;
    float _229 = _187 * _219;
    float _231 = -_221;
    float _233 = fma(_183, _219, _231);
    float _235 = _183 * _211;
    float _237 = fma(_225, _225, _227);
    float _239 = -_229;
    float _241 = fma(_199, _211, _239);
    float _243 = _233 * _233;
    float _245 = -_235;
    float _247 = fma(_187, _205, _245);
    float _249 = sqrt(_237);
    float _251 = fma(_241, _241, _243);
    float _253 = _165 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _255 = fma(_247, _247, _251);
    float _257 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].x, _253);
    float _259 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[31].z, _257);
    float _261 = rsqrt(_255);
    float _263 = _259 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _267 = _249 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _269 = _241 * _261;
    float _271 = _233 * _261;
    float _273 = _247 * _261;
    float _275 = _241;
    float _277 = _263;
    float _279 = _201;
    if (!_267)
    {
        _275 = _207;
    }
    float _281 = _275;
    bool _283 = !_267;
    float _285 = _281;
    if (!_283)
    {
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _289 = _249 + _287;
        float _291 = _263 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = rsqrt(_237);
        float _295 = -_263;
        float _297 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = _295 + _297;
        float _301 = abs(_291);
        float _303 = abs(_289);
        float _305 = precise::max(_301, _303);
        float _307 = _299 * _299;
        bool _309 = _305 >= 16.0;
        float _311 = _225 * _293;
        float _313 = _215 * _293;
        float _315 = -_225;
        float _317 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = -_215;
        float _321 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[41].z, _319);
        float _323 = _289;
        float _325 = _291;
        int _328 = as_type<int>(_321);
        if (_309)
        {
            float _330 = _289 * 0.0625;
            _323 = _330;
        }
        float _332 = _323;
        if (_309)
        {
            float _334 = _291 * 0.0625;
            _325 = _334;
        }
        float _336 = _325;
        float _338 = fma(_317, _317, _307);
        float _340 = abs(_332);
        bool _342 = _340 != 0.0;
        bool _344 = isnan(_340);
        bool _346 = _342 || _344;
        bool _348 = isnan(0.0);
        bool _350 = _346 || _348;
        float _352 = fma(_321, _321, _338);
        float _354 = abs(_336);
        bool _356 = _354 == 0.0;
        float _358 = abs(_336);
        bool _360 = _358 == 0.0;
        bool _362 = !_350;
        bool _364 = _360 && _362;
        float _366 = sqrt(_352);
        bool _368 = false;
        if (_364)
        {
            bool _370 = as_type<int>(_336) >= 0;
            _368 = _370;
        }
        bool _372 = _368;
        int _374 = _372 ? (-1) : 0;
        if (_364)
        {
            int _376 = _372 ? 0 : 1078530011;
            _328 = _376;
        }
        int _378 = _328;
        int _380 = _378;
        if (_364)
        {
            int _382 = int(0x80000000) & as_type<int>(_332);
            int _384 = _378 | _382;
            _380 = _384;
        }
        int _386 = _380;
        bool _388 = !_350;
        bool _390 = _388 && _356;
        int _392 = _386;
        float _394 = as_type<float>(_386);
        if (!_390)
        {
            float _396 = abs(_332);
            bool _398 = _396 != as_type<float>(0x7f800000u /* inf */);
            bool _400 = isnan(_396);
            bool _402 = _398 || _400;
            bool _404 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _406 = _402 || _404;
            float _408 = abs(_336);
            bool _410 = _408 == as_type<float>(0x7f800000u /* inf */);
            float _412 = abs(_336);
            bool _414 = _412 == as_type<float>(0x7f800000u /* inf */);
            bool _416 = !_406;
            bool _418 = _414 && _416;
            if (_418)
            {
                bool _420 = as_type<int>(_336) >= 0;
                _374 = _420 ? (-1) : 0;
            }
            int _422 = _374;
            if (_418)
            {
                _392 = 1075235812;
            }
            int _424 = _392;
            int _426 = _424;
            if (_418)
            {
                int _428 = ~_422;
                int _430 = (_428 != 0) ? _424 : 1061752795;
                _426 = _430;
            }
            int _432 = _426;
            float _434 = as_type<float>(_432);
            if (_418)
            {
                int _436 = int(0x80000000) & as_type<int>(_332);
                int _438 = _432 | _436;
                _434 = as_type<float>(_438);
            }
            float _440 = _434;
            bool _442 = !_406;
            bool _444 = _442 && _410;
            _394 = _440;
            if (!_444)
            {
                float _446 = abs(_332);
                float _448 = abs(_336);
                float _450 = precise::max(_446, _448);
                float _452 = abs(_332);
                float _454 = abs(_336);
                float _456 = precise::min(_452, _454);
                float _458 = 1.0 / _450;
                float _460 = abs(_332);
                float _462 = abs(_336);
                bool _464 = _460 > _462;
                bool _466 = as_type<int>(_336) >= 0;
                float _468 = _456 * _458;
                float _470 = abs(_332);
                float _472 = abs(_336);
                float _474 = _470 + _472;
                int _476 = as_type<int>(_332) & int(0x80000000);
                float _478 = _468 * _468;
                bool _480 = _474 > as_type<float>(0x7f800000u /* inf */);
                bool _482 = isnan(_474);
                bool _484 = _480 || _482;
                bool _486 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _488 = _484 || _486;
                float _490 = _478 + 11.33538818359375;
                float _492 = fma(_478, _490, 28.84246826171875);
                float _494 = fma(_478, _492, 19.6966705322265625);
                float _496 = fma(_478, -0.82336294651031494140625, -5.674867153167724609375);
                float _498 = fma(_478, _496, -6.565555095672607421875);
                float _500 = 1.0 / _494;
                float _502 = _478 * _498;
                float _504 = _468 * _502;
                float _506 = fma(_504, _500, _468);
                float _508 = _506;
                _394 = _474;
                if (_464)
                {
                    float _510 = -_506;
                    float _512 = _510 + 1.57079637050628662109375;
                    _508 = _512;
                }
                float _514 = _508;
                int _516 = as_type<int>(_514);
                if (!_466)
                {
                    float _518 = -_514;
                    float _520 = _518 + 3.1415927410125732421875;
                    _516 = as_type<int>(_520);
                }
                int _522 = _516;
                if (!_488)
                {
                    int _524 = _476 | _522;
                    _394 = as_type<float>(_524);
                }
            }
        }
        float _526 = _394;
        float _528 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _532 = _366 + _530;
        float _534 = fma(_311, _528, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _536 = fma(_313, _528, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _277 = _532;
        _285 = _534;
        _279 = _536;
    }
    float _538 = _277;
    float _540 = _285;
    float _542 = _279;
    float2 _2029 = float2(_81, _83);
    float4 _545 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2029, float2(0.0), isnan(_2029)), int2(0), component::x).xyzw;
    float _547 = _545.x;
    float _549 = _545.y;
    float _551 = _545.z;
    float _553 = _545.w;
    float2 _2045 = float2(_81, _83);
    float4 _555 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2045, float2(0.0), isnan(_2045)), int2(0), component::x).xyzw;
    float _557 = _555.x;
    float _559 = _555.y;
    float _561 = _555.z;
    float _563 = _555.w;
    float2 _2061 = float2(_81, _83);
    float4 _565 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2061, float2(0.0), isnan(_2061)), int2(0), component::w).xyzw;
    float _567 = _565.x;
    float _569 = _565.y;
    float _571 = _565.z;
    float _573 = _565.w;
    float _575 = _271 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _577 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _579 = _83 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _581 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].x, _575);
    float _583 = floor(_577);
    float _585 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].z, _581);
    float _587 = -_585;
    float _589 = fma(_587, _585, 1.0);
    float _591 = -_585;
    float _593 = fma(_591, (*spvDescriptorSet0.fp_c3)._m0[35].z, _273);
    float _595 = -_585;
    float _597 = fma(_595, (*spvDescriptorSet0.fp_c3)._m0[35].x, _269);
    float _599 = -_585;
    float _601 = fma(_599, (*spvDescriptorSet0.fp_c3)._m0[35].y, _271);
    float _603 = _589 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _605 = floor(_579);
    float _607 = fma(_593, _603, _161);
    float _609 = fma(_597, _603, _167);
    float _611 = fma(_601, _603, _165);
    float _613 = -_583;
    float _615 = _577 + _613;
    float _617 = -_607;
    bool _619 = _617 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _621 = float(_619);
    float _623 = -_607;
    bool _625 = _623 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _627 = float(_625);
    float _629 = _621 + _627;
    float _631 = -_605;
    float _633 = _579 + _631;
    float _635 = precise::min(_629, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _637 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _639 = _633 + _637;
    float _641 = trunc(_635);
    int _643 = int(_641);
    int _645 = _643 << 6;
    bool _647 = _643 != 0;
    uint _650 = uint(int(uint(_645) >> uint(2)));
    uint _652 = uint(int(uint(int(_650)) >> uint(2)));
    int _654 = int(_650) & 3;
    float _656 = (*spvDescriptorSet0.fp_c3)._m0[int(_652)][_654];
    int _658 = int(_650) + 1;
    uint _660 = uint(int(uint(_658) >> uint(2)));
    int _662 = _658 & 3;
    float _664 = (*spvDescriptorSet0.fp_c3)._m0[int(_660)][_662];
    int _666 = _645 + 16;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
    int _672 = int(_668) & 3;
    float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
    int _676 = int(_668) + 1;
    uint _678 = uint(int(uint(_676) >> uint(2)));
    int _680 = _676 & 3;
    float _682 = (*spvDescriptorSet0.fp_c3)._m0[int(_678)][_680];
    int _684 = _645 + 32;
    uint _686 = uint(int(uint(_684) >> uint(2)));
    uint _688 = uint(int(uint(int(_686)) >> uint(2)));
    int _690 = int(_686) & 3;
    float _692 = (*spvDescriptorSet0.fp_c3)._m0[int(_688)][_690];
    int _694 = int(_686) + 1;
    uint _696 = uint(int(uint(_694) >> uint(2)));
    int _698 = _694 & 3;
    float _700 = (*spvDescriptorSet0.fp_c3)._m0[int(_696)][_698];
    int _702 = _645 + 48;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    uint _706 = uint(int(uint(int(_704)) >> uint(2)));
    int _708 = int(_704) & 3;
    float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
    int _712 = int(_704) + 1;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    int _716 = _712 & 3;
    float _718 = (*spvDescriptorSet0.fp_c3)._m0[int(_714)][_716];
    float _720 = _611 * _664;
    float _722 = fma(_609, _656, _720);
    float _724 = _611 * _682;
    float _726 = fma(_609, _674, _724);
    int _728 = _645 + 24;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
    int _738 = int(_730) + 1;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    int _742 = _738 & 3;
    float _744 = (*spvDescriptorSet0.fp_c3)._m0[int(_740)][_742];
    float _746 = _611 * _700;
    float _748 = fma(_609, _692, _746);
    int _750 = _645 + 8;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.fp_c3)._m0[int(_762)][_764];
    float _768 = _611 * _718;
    float _770 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _772 = _615 + _770;
    float _774 = -_639;
    float _776 = _774 + 1.0;
    float _778 = fma(_609, _710, _768);
    float _780 = -_772;
    float _782 = _780 + 1.0;
    float _784 = _772 * _639;
    float _786 = _772 * _776;
    float _788 = _639 * _782;
    float _790 = _782 * _776;
    int _792 = _645 + 40;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    uint _796 = uint(int(uint(int(_794)) >> uint(2)));
    int _798 = int(_794) & 3;
    float _800 = (*spvDescriptorSet0.fp_c3)._m0[int(_796)][_798];
    int _802 = int(_794) + 1;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    int _806 = _802 & 3;
    float _808 = (*spvDescriptorSet0.fp_c3)._m0[int(_804)][_806];
    float _810 = fma(_607, _736, _726);
    float _812 = _810 + _744;
    float _814 = fma(_607, _758, _722);
    float _816 = precise::min(_161, -1.0000000116860974230803549289703e-07);
    float _818 = _814 + _766;
    float _820 = 1.0 / _816;
    float _822 = fma(_607, _800, _748);
    float _824 = _822 + _808;
    float _826 = -_547;
    float _828 = fma(_826, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _830 = -_549;
    float _832 = fma(_830, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _834 = -_551;
    float _836 = fma(_834, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _838 = -_553;
    float _840 = fma(_838, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _842 = _820 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _844 = 1.0 / _832;
    float _846 = 1.0 / _828;
    float _848 = 1.0 / _836;
    float _850 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _852 = -_161;
    float _854 = fma(_844, _850, _852);
    float _856 = abs(_854);
    float _858 = _856 * _842;
    float _860 = 1.0 / _840;
    float _862 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _864 = -_161;
    float _866 = fma(_846, _862, _864);
    float _868 = abs(_866);
    float _870 = _868 * _842;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _874 = -_161;
    float _876 = fma(_848, _872, _874);
    float _878 = exp2(_858);
    int _880 = _645 + 56;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    uint _884 = uint(int(uint(int(_882)) >> uint(2)));
    int _886 = int(_882) & 3;
    float _888 = (*spvDescriptorSet0.fp_c3)._m0[int(_884)][_886];
    int _890 = int(_882) + 1;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    int _894 = _890 & 3;
    float _896 = (*spvDescriptorSet0.fp_c3)._m0[int(_892)][_894];
    float _898 = abs(_876);
    float _900 = _898 * _842;
    float _902 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _904 = -_161;
    float _906 = fma(_860, _902, _904);
    float _908 = exp2(_870);
    float _910 = abs(_906);
    float _912 = _910 * _842;
    float _914 = exp2(_900);
    float _916 = abs(_784);
    float _918 = _916 * _878;
    float _920 = exp2(_912);
    float _922 = abs(_788);
    float _924 = _922 * _908;
    float _926 = _924 + _918;
    float _928 = abs(_786);
    float _930 = _928 * _914;
    float _932 = abs(_790);
    float _934 = _932 * _920;
    float _936 = _930 + _926;
    float _938 = _934 + _936;
    float _940 = -_934;
    bool _942 = _936 != _940;
    bool _944 = isnan(_936);
    bool _946 = _942 || _944;
    bool _948 = isnan(_940);
    bool _950 = _946 || _948;
    float _952 = fma(_607, _888, _778);
    float _954 = 1.0 / _938;
    float _956 = _952 + _896;
    float _958 = 1.0 / _956;
    float _960 = _918 * _954;
    float _962 = _924 * _954;
    float _964 = _930 * _954;
    float _966 = _934 * _954;
    float _968 = _950 ? _960 : 0.25;
    float _970 = _950 ? _962 : 0.25;
    float _972 = _818 * _958;
    float _974 = _950 ? _964 : 0.25;
    float _976 = _968 * _559;
    float _978 = _968 * _569;
    float _980 = _824 * _958;
    float _982 = precise::clamp(_980, 0.0, 1.0);
    float _984 = fma(_970, _557, _976);
    float _986 = fma(_970, _567, _978);
    float _988 = fma(_974, _561, _984);
    float _990 = _950 ? _966 : 0.25;
    float _992 = fma(_974, _571, _986);
    float _994 = _812 * _958;
    float _996 = fma(_990, _563, _988);
    float _998 = fma(_990, _573, _992);
    float _1054;
    if (!_647)
    {
        float _1000 = rint(_635);
        float _1002 = precise::max(_1000, 0.0);
        uint _1004 = uint(_1002);
        uint _1006 = clamp(_1004, 0u, 65535u);
        float _1008 = _982 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1010 = fma(_1008, 0.5, _994);
        float _1012 = fma(_1008, 0.5, _972);
        float _1014 = fma(_1008, -0.5, _972);
        float _1016 = fma(_1008, -0.5, _994);
        float3 _2776 = float3(_972, _1010, float(int(_1006)));
        float3 _2780 = select(_2776, float3(0.0), isnan(_2776));
        float _1018 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2780.xy, uint(rint(_2780.z)), _982);
        float3 _2789 = float3(_1012, _1010, float(int(_1006)));
        float3 _2791 = select(_2789, float3(0.0), isnan(_2789));
        float _1020 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2791.xy, uint(rint(_2791.z)), _982);
        float3 _2800 = float3(_1014, _1010, float(int(_1006)));
        float3 _2802 = select(_2800, float3(0.0), isnan(_2800));
        float _1022 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2802.xy, uint(rint(_2802.z)), _982);
        float3 _2811 = float3(_1012, _994, float(int(_1006)));
        float3 _2813 = select(_2811, float3(0.0), isnan(_2811));
        float _1024 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2813.xy, uint(rint(_2813.z)), _982);
        float3 _2822 = float3(_972, _994, float(int(_1006)));
        float3 _2824 = select(_2822, float3(0.0), isnan(_2822));
        float _1026 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2824.xy, uint(rint(_2824.z)), _982);
        float3 _2833 = float3(_1014, _994, float(int(_1006)));
        float3 _2835 = select(_2833, float3(0.0), isnan(_2833));
        float _1028 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2835.xy, uint(rint(_2835.z)), _982);
        float3 _2844 = float3(_1012, _1016, float(int(_1006)));
        float3 _2846 = select(_2844, float3(0.0), isnan(_2844));
        float _1030 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2846.xy, uint(rint(_2846.z)), _982);
        float3 _2855 = float3(_972, _1016, float(int(_1006)));
        float3 _2857 = select(_2855, float3(0.0), isnan(_2855));
        float _1032 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2857.xy, uint(rint(_2857.z)), _982);
        float3 _2866 = float3(_1014, _1016, float(int(_1006)));
        float3 _2868 = select(_2866, float3(0.0), isnan(_2866));
        float _1034 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2868.xy, uint(rint(_2868.z)), _982);
        float _1036 = _1020 + _1018;
        float _1038 = _1036 + _1022;
        float _1040 = _1038 + _1024;
        float _1042 = _1040 + _1026;
        float _1044 = _1042 + _1028;
        float _1046 = _1044 + _1030;
        float _1048 = _1046 + _1032;
        float _1050 = _1048 + _1034;
        float _1052 = _1050 * 0.111111111938953399658203125;
        _1054 = _1052;
        _1056 = true;
    }
    else
    {
        float _1058 = rint(_635);
        float _1060 = precise::max(_1058, 0.0);
        uint _1062 = uint(_1060);
        uint _1064 = clamp(_1062, 0u, 65535u);
        float3 _2915 = float3(_972, _994, float(int(_1064)));
        float3 _2917 = select(_2915, float3(0.0), isnan(_2915));
        float _1066 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2917.xy, uint(rint(_2917.z)), _982);
        _1054 = _1066;
    }
    _1056 = false;
    float _1068 = _1054;
    float _1070 = _538 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1072 = _538 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1074 = -_161;
    float _1076 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1078 = _1074 + _1076;
    float _1080 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1070);
    float _1082 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1072);
    float _1084 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1080);
    float _1086 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1082);
    float _1088 = _1084 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1090 = _1086 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1092 = trunc(_1088);
    int _1094 = int(_1092);
    float _1096 = trunc(_1090);
    int _1098 = int(_1096);
    int _1100 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1102 = _1094 + _1100;
    int _1104 = _1102 + 1;
    bool _1106 = _1104 >= 0;
    int _1108 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1110 = _1098 + _1108;
    int _1112 = _1110 + 1;
    float _1114 = -_161;
    float _1116 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1118 = _1114 + _1116;
    bool _1120 = _1104 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1122 = !_1106;
    bool _1124 = _1120 || _1122;
    bool _1126 = _1112 < 0;
    bool _1128 = _1126 || _1124;
    bool _1130 = _1112 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1132 = _1130 || _1128;
    float _1134 = as_type<float>(_1094);
    if (_1132)
    {
        _1134 = 1.0;
    }
    float _1136 = _1134;
    float _1138 = _1136;
    if (!_1132)
    {
        int _1140 = _1112 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1142 = _1140 + _1104;
        float _1144 = floor(_1090);
        int _1146 = _1142 << 2;
        int _1148 = _1142 >> 2;
        int _1150 = 12 & _1146;
        int _1152 = _1148 << 4;
        int _1154 = _1152 + _1150;
        float _1156 = floor(_1088);
        uint _1158 = uint(int(uint(_1154) >> uint(2)));
        uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
        int _1162 = int(_1158) & 3;
        float _1164 = (*spvDescriptorSet0.fp_c5)._m0[int(_1160)][_1162];
        float _1166 = -_1144;
        float _1168 = _1090 + _1166;
        float _1170 = -_1156;
        float _1172 = _1088 + _1170;
        float _1174 = rint(_1164);
        float _1176 = precise::max(_1174, 0.0);
        uint _1178 = uint(_1176);
        uint _1180 = clamp(_1178, 0u, 65535u);
        float3 _3104 = float3(_1172, _1168, float(int(_1180)));
        float3 _3106 = select(_3104, float3(0.0), isnan(_3104));
        float _1182 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3106.xy, uint(rint(_3106.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3106.xy, uint(rint(_3106.z)), level(0.0)).x;
        int _1184 = _1142 << 4;
        int _1186 = _1184 + 1648;
        int _1188 = _1154 + 8048;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
        int _1194 = int(_1190) & 3;
        float _1196 = (*spvDescriptorSet0.fp_c5)._m0[int(_1192)][_1194];
        uint _1198 = uint(int(uint(_1186) >> uint(2)));
        uint _1200 = uint(int(uint(int(_1198)) >> uint(2)));
        int _1202 = int(_1198) & 3;
        float _1204 = (*spvDescriptorSet0.fp_c5)._m0[int(_1200)][_1202];
        int _1206 = int(_1198) + 1;
        uint _1208 = uint(int(uint(_1206) >> uint(2)));
        int _1210 = _1206 & 3;
        float _1212 = (*spvDescriptorSet0.fp_c5)._m0[int(_1208)][_1210];
        int _1214 = _1186 + 8;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
        int _1220 = int(_1216) & 3;
        float _1222 = (*spvDescriptorSet0.fp_c5)._m0[int(_1218)][_1220];
        int _1224 = int(_1216) + 1;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        int _1228 = _1224 & 3;
        float _1230 = (*spvDescriptorSet0.fp_c5)._m0[int(_1226)][_1228];
        float _1232 = _1196 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1234 = _538 * _1212;
        float _1236 = fma(_540, _1204, _1234);
        float _1238 = 1.0 / _1196;
        float _1240 = fma(_542, _1222, _1236);
        float _1242 = _1240 + _1230;
        float _1244 = precise::clamp(_1242, 0.0, 1.0);
        float _1246 = -_1244;
        float _1248 = _1246 + _1182;
        float _1250 = fma(_1238, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1248);
        float _1252 = _1232 * _1250;
        float _1254 = exp2(_1252);
        float _1256 = 0.0 + _1254;
        float _1258 = precise::clamp(_1256, 0.0, 1.0);
        _1138 = _1258;
    }
    float _1260 = _1138;
    float _1262 = precise::min(_1260, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1264 = _1118 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1266 = precise::clamp(_1264, 0.0, 1.0);
    float _1268 = _1078 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1270 = precise::clamp(_1268, 0.0, 1.0);
    float _1272 = -_1068;
    float _1274 = _1272 + 1.0;
    float _1276 = precise::min(_998, 1.0);
    float _1278 = -_1262;
    float _1280 = _1278 + 1.0;
    float _1282 = precise::min(_996, 1.0);
    float _1284 = fma(_1266, _1274, _1068);
    float _1286 = fma(_1270, _1280, _1262);
    out.m_56.x = _1284;
    out.m_56.y = _1286;
    out.m_56.z = _1276;
    out.m_56.w = 1.0;
    out.m_58.x = _1282;
    out.m_58.y = 0.5;
    out.m_58.z = 0.5;
    out.m_58.w = 1.0;
    return out;
}

