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
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_A [[id(13)]];
    sampler fp_t_tcb_ASmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    sampler fp_t_tcb_10Smplr_w [[id(19)]];
    sampler fp_t_tcb_14Smplr_w [[id(20)]];
    sampler fp_t_tcb_CSmplr_w [[id(21)]];
    sampler fp_t_tcb_ESmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
    float4 m_62 [[color(1)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _929 = false;
    float _69 = gl_FragCoord.w;
    float _71 = in.m_51.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_51.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _69;
    float _85 = _83 * _75;
    float _87 = _83 * _81;
    float _89 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1195 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1195, float2(0.0), isnan(_1195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1195, float2(0.0), isnan(_1195))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1210 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1210, float2(0.0), isnan(_1210))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1210, float2(0.0), isnan(_1210))).x;
    float2 _1218 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1218, float2(0.0), isnan(_1218))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1218, float2(0.0), isnan(_1218))).x;
    float _99 = in.m_53.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_53.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_55.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_55.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_57.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_57.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _83 * _103;
    float _137 = _83 * _127;
    float _139 = -_91;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _143 = 1.0 / _141;
    float _145 = -_95;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _149 = -_97;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _153 = _83 * _109;
    float _155 = _83 * _115;
    float _157 = 1.0 / _147;
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _161 = _143 * _159;
    float _163 = 1.0 / _151;
    float _165 = _161 * _135;
    float _167 = _161 * _153;
    float _169 = _83 * _121;
    float _171 = _83 * _133;
    float _173 = _165 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = _157 * _175;
    float _179 = _165 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _181 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].x, _173);
    float _183 = -_167;
    float _185 = fma(_177, _155, _183);
    float _187 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].x, _179);
    float _189 = -_165;
    float _191 = fma(_177, _169, _189);
    float _193 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[32].z, _181);
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _197 = _163 * _195;
    float _199 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[30].z, _187);
    float _201 = -_161;
    float _203 = _201 + _177;
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _207 = -_167;
    float _209 = fma(_197, _137, _207);
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _213 = -_165;
    float _215 = fma(_197, _171, _213);
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _219 = _205 + _217;
    float _221 = -_161;
    float _223 = _221 + _197;
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _227 = _211 + _225;
    float _229 = _203 * _209;
    float _231 = _219 * _219;
    float _233 = _191 * _223;
    float _235 = -_229;
    float _237 = fma(_185, _223, _235);
    float _239 = fma(_227, _227, _231);
    float _241 = _185 * _215;
    float _243 = -_233;
    float _245 = fma(_203, _215, _243);
    float _247 = _237 * _237;
    float _249 = sqrt(_239);
    float _251 = -_241;
    float _253 = fma(_191, _209, _251);
    float _255 = _165 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _257 = fma(_245, _245, _247);
    float _259 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].x, _255);
    float _261 = fma(_253, _253, _257);
    float _263 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[31].z, _259);
    float _265 = rsqrt(_261);
    float _267 = _263 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _271 = _249 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _273 = _245 * _265;
    float _275 = _237 * _265;
    float _277 = _253 * _265;
    float _279 = _263;
    int _282 = as_type<int>(_237);
    float _284 = _205;
    float _286 = _267;
    if (!_271)
    {
        _279 = _211;
    }
    float _288 = _279;
    bool _290 = !_271;
    float _292 = _288;
    if (!_290)
    {
        float _294 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _296 = _249 + _294;
        float _298 = _267 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _300 = rsqrt(_239);
        float _302 = -_267;
        float _304 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _306 = _302 + _304;
        float _308 = abs(_298);
        float _310 = abs(_296);
        float _312 = precise::max(_308, _310);
        float _314 = _306 * _306;
        bool _316 = _312 >= 16.0;
        float _318 = _227 * _300;
        float _320 = _219 * _300;
        float _322 = -_227;
        float _324 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[41].z, _322);
        float _326 = _296;
        float _328 = _298;
        if (_316)
        {
            float _330 = _296 * 0.0625;
            _326 = _330;
        }
        float _332 = _326;
        if (_316)
        {
            float _334 = _298 * 0.0625;
            _328 = _334;
        }
        float _336 = _328;
        float _338 = -_219;
        float _340 = fma(_320, (*spvDescriptorSet0.fp_c3)._m0[41].z, _338);
        float _342 = fma(_324, _324, _314);
        float _344 = abs(_332);
        bool _346 = _344 != 0.0;
        bool _348 = isnan(_344);
        bool _350 = _346 || _348;
        bool _352 = isnan(0.0);
        bool _354 = _350 || _352;
        float _356 = fma(_340, _340, _342);
        float _358 = abs(_336);
        bool _360 = _358 == 0.0;
        float _362 = abs(_336);
        bool _364 = _362 == 0.0;
        bool _366 = !_354;
        bool _368 = _364 && _366;
        float _370 = sqrt(_356);
        bool _372 = false;
        float _374 = _340;
        int _376 = as_type<int>(_356);
        if (_368)
        {
            bool _378 = as_type<int>(_336) >= 0;
            _372 = _378;
        }
        bool _380 = _372;
        int _382 = _380 ? (-1) : 0;
        if (_368)
        {
            int _384 = _380 ? 0 : 1078530011;
            _282 = _384;
        }
        int _386 = _282;
        if (_368)
        {
            int _388 = int(0x80000000) & as_type<int>(_332);
            int _390 = _386 | _388;
            _374 = as_type<float>(_390);
        }
        float _392 = _374;
        bool _394 = !_354;
        bool _396 = _394 && _360;
        float _398 = _392;
        float _400 = _392;
        if (!_396)
        {
            float _402 = abs(_332);
            bool _404 = _402 != as_type<float>(0x7f800000u /* inf */);
            bool _406 = isnan(_402);
            bool _408 = _404 || _406;
            bool _410 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _412 = _408 || _410;
            float _414 = abs(_336);
            bool _416 = _414 == as_type<float>(0x7f800000u /* inf */);
            float _418 = abs(_336);
            bool _420 = _418 == as_type<float>(0x7f800000u /* inf */);
            bool _422 = !_412;
            bool _424 = _420 && _422;
            if (_424)
            {
                bool _426 = as_type<int>(_336) >= 0;
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
                int _440 = int(0x80000000) & as_type<int>(_332);
                int _442 = _438 | _440;
                _398 = as_type<float>(_442);
            }
            float _444 = _398;
            bool _446 = !_412;
            bool _448 = _446 && _416;
            _400 = _444;
            if (!_448)
            {
                float _450 = abs(_332);
                float _452 = abs(_336);
                float _454 = precise::max(_450, _452);
                float _456 = abs(_332);
                float _458 = abs(_336);
                float _460 = precise::min(_456, _458);
                float _462 = 1.0 / _454;
                float _464 = abs(_332);
                float _466 = abs(_336);
                bool _468 = _464 > _466;
                bool _470 = as_type<int>(_336) >= 0;
                float _472 = abs(_332);
                float _474 = abs(_336);
                float _476 = _472 + _474;
                int _478 = as_type<int>(_332) & int(0x80000000);
                bool _480 = _476 > as_type<float>(0x7f800000u /* inf */);
                bool _482 = isnan(_476);
                bool _484 = _480 || _482;
                bool _486 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _488 = _484 || _486;
                float _490 = _460 * _462;
                float _492 = _490 * _490;
                float _494 = _492 + 11.33538818359375;
                float _496 = fma(_492, _494, 28.84246826171875);
                float _498 = fma(_492, _496, 19.6966705322265625);
                float _500 = fma(_492, -0.82336294651031494140625, -5.674867153167724609375);
                float _502 = fma(_492, _500, -6.565555095672607421875);
                float _504 = 1.0 / _498;
                float _506 = _492 * _502;
                float _508 = _490 * _506;
                float _510 = fma(_508, _504, _490);
                float _512 = _510;
                _400 = _476;
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
                if (!_488)
                {
                    int _528 = _478 | _526;
                    _400 = as_type<float>(_528);
                }
            }
        }
        float _530 = _400;
        float _532 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _534 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _536 = _370 + _534;
        float _538 = fma(_318, _532, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _540 = fma(_320, _532, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _292 = _538;
        _284 = _540;
        _286 = _536;
    }
    float _542 = _292;
    float _544 = _284;
    float _546 = _286;
    float _548 = fma(_542, 6.2500002968590706586837768554688e-05, 0.5);
    float _550 = fma(_544, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1904 = float2(_548, _550);
    float _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1904, float2(0.0), isnan(_1904))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1904, float2(0.0), isnan(_1904))).x;
    float _554 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _556 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _1925 = float2(_548, _550);
    float _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1925, float2(0.0), isnan(_1925)), level(_552)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1925, float2(0.0), isnan(_1925)), level(_552)).x;
    float2 _1934 = float2(_554, _556);
    float _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1934, float2(0.0), isnan(_1934))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1934, float2(0.0), isnan(_1934))).x;
    float2 _1942 = float2(_85, _87);
    float _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1942, float2(0.0), isnan(_1942))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1942, float2(0.0), isnan(_1942))).x;
    float _564 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _566 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _564);
    float _568 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _566);
    float _570 = -_568;
    float _572 = fma(_570, _568, 1.0);
    float _574 = -_568;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _578 = _572 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _580 = fma(_576, _578, _161);
    float _582 = -_580;
    bool _584 = _582 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _586 = float(_584);
    float _588 = -_580;
    bool _590 = _588 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _592 = float(_590);
    float _594 = _586 + _592;
    float _596 = precise::min(_594, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _598 = abs(_161);
    float _600 = log2(_598);
    float _602 = trunc(_596);
    int _604 = int(_602);
    float _606 = _600 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _608 = exp2(_606);
    int _610 = _604 << 6;
    bool _612 = _604 != 0;
    int _614 = _610 + 48;
    uint _617 = uint(int(uint(_614) >> uint(2)));
    uint _619 = uint(int(uint(int(_617)) >> uint(2)));
    int _621 = int(_617) & 3;
    float _623 = (*spvDescriptorSet0.fp_c3)._m0[int(_619)][_621];
    int _625 = int(_617) + 1;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    int _629 = _625 & 3;
    float _631 = (*spvDescriptorSet0.fp_c3)._m0[int(_627)][_629];
    int _633 = _610 + 56;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.fp_c3)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.fp_c3)._m0[int(_645)][_647];
    float _651 = fma(_608, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _653 = precise::clamp(_651, 0.0, 1.0);
    float _655 = -_568;
    float _657 = fma(_655, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _659 = -_568;
    float _661 = fma(_659, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _663 = fma(_653, -2.0, 3.0);
    float _665 = _653 * _653;
    uint _667 = uint(int(uint(_610) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = int(_667) + 1;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    int _679 = _675 & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    float _683 = fma(_661, _578, _165);
    float _685 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _687 = _665 * _663;
    float _689 = fma(_657, _578, _167);
    float _691 = -_687;
    float _693 = _691 + 1.0;
    int _695 = _610 + 16;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    uint _699 = uint(int(uint(int(_697)) >> uint(2)));
    int _701 = int(_697) & 3;
    float _703 = (*spvDescriptorSet0.fp_c3)._m0[int(_699)][_701];
    int _705 = int(_697) + 1;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    int _709 = _705 & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    float _713 = precise::max(0.0, _685);
    float _715 = fma(_693, (*spvDescriptorSet0.fp_c3)._m0[44].w, _687);
    float _717 = _715 * _713;
    int _719 = _610 + 32;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.fp_c3)._m0[int(_731)][_733];
    int _737 = _610 + 8;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    uint _741 = uint(int(uint(int(_739)) >> uint(2)));
    int _743 = int(_739) & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    int _747 = int(_739) + 1;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    int _751 = _747 & 3;
    float _753 = (*spvDescriptorSet0.fp_c3)._m0[int(_749)][_751];
    int _755 = _610 + 24;
    uint _757 = uint(int(uint(_755) >> uint(2)));
    uint _759 = uint(int(uint(int(_757)) >> uint(2)));
    int _761 = int(_757) & 3;
    float _763 = (*spvDescriptorSet0.fp_c3)._m0[int(_759)][_761];
    int _765 = int(_757) + 1;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    int _769 = _765 & 3;
    float _771 = (*spvDescriptorSet0.fp_c3)._m0[int(_767)][_769];
    float _773 = _683 * _631;
    float _775 = fma(_689, _623, _773);
    int _777 = _610 + 40;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    uint _781 = uint(int(uint(int(_779)) >> uint(2)));
    int _783 = int(_779) & 3;
    float _785 = (*spvDescriptorSet0.fp_c3)._m0[int(_781)][_783];
    int _787 = int(_779) + 1;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    int _791 = _787 & 3;
    float _793 = (*spvDescriptorSet0.fp_c3)._m0[int(_789)][_791];
    float _795 = fma(_580, _641, _775);
    bool _797 = _161 >= (-8000.0);
    bool _799 = isnan(_161);
    bool _801 = _797 || _799;
    bool _803 = isnan(-8000.0);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = _795 + _649;
    float _811 = _807 * _717;
    float _813 = _683 * _681;
    float _815 = 1.0 / _809;
    float _817 = _811 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _819 = fma(_689, _673, _813);
    float _821 = _683 * _711;
    float _823 = fma(_689, _703, _821);
    float _825 = _683 * _735;
    float _827 = fma(_689, _727, _825);
    float _829 = fma(_580, _745, _819);
    float _831 = _829 + _753;
    float _833 = fma(_580, _763, _823);
    float _835 = _833 + _771;
    float _837 = _831 * _815;
    float _839 = fma(_580, _785, _827);
    float _841 = _839 + _793;
    float _843 = _841 * _815;
    float _845 = precise::clamp(_843, 0.0, 1.0);
    float _847 = abs(_558);
    float _849 = _847 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _851 = -_560;
    float _853 = _851 + 1.0;
    float _855 = -_849;
    float _857 = fma(_807, _855, 1.0);
    float _859 = _853 * _817;
    float _861 = precise::clamp(_859, 0.0, 1.0);
    float _863 = _835 * _815;
    float _865 = -_861;
    float _867 = fma(_865, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _869 = precise::min(_857, 1.0);
    float _871 = precise::min(_869, _867);
    float _927;
    if (!_612)
    {
        float _873 = rint(_596);
        float _875 = precise::max(_873, 0.0);
        uint _877 = uint(_875);
        uint _879 = clamp(_877, 0u, 65535u);
        float _881 = _845 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _883 = fma(_881, 0.5, _863);
        float _885 = fma(_881, 0.5, _837);
        float _887 = fma(_881, -0.5, _837);
        float _889 = fma(_881, -0.5, _863);
        float3 _2488 = float3(_837, _883, float(int(_879)));
        float3 _2492 = select(_2488, float3(0.0), isnan(_2488));
        float _891 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2492.xy, uint(rint(_2492.z)), _845);
        float3 _2501 = float3(_885, _883, float(int(_879)));
        float3 _2503 = select(_2501, float3(0.0), isnan(_2501));
        float _893 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2503.xy, uint(rint(_2503.z)), _845);
        float3 _2512 = float3(_887, _883, float(int(_879)));
        float3 _2514 = select(_2512, float3(0.0), isnan(_2512));
        float _895 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2514.xy, uint(rint(_2514.z)), _845);
        float3 _2523 = float3(_885, _863, float(int(_879)));
        float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
        float _897 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2525.xy, uint(rint(_2525.z)), _845);
        float3 _2534 = float3(_837, _863, float(int(_879)));
        float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
        float _899 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2536.xy, uint(rint(_2536.z)), _845);
        float3 _2545 = float3(_887, _863, float(int(_879)));
        float3 _2547 = select(_2545, float3(0.0), isnan(_2545));
        float _901 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2547.xy, uint(rint(_2547.z)), _845);
        float3 _2556 = float3(_885, _889, float(int(_879)));
        float3 _2558 = select(_2556, float3(0.0), isnan(_2556));
        float _903 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2558.xy, uint(rint(_2558.z)), _845);
        float3 _2567 = float3(_837, _889, float(int(_879)));
        float3 _2569 = select(_2567, float3(0.0), isnan(_2567));
        float _905 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2569.xy, uint(rint(_2569.z)), _845);
        float3 _2578 = float3(_887, _889, float(int(_879)));
        float3 _2580 = select(_2578, float3(0.0), isnan(_2578));
        float _907 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2580.xy, uint(rint(_2580.z)), _845);
        float _909 = _893 + _891;
        float _911 = _909 + _895;
        float _913 = _911 + _897;
        float _915 = _913 + _899;
        float _917 = _915 + _901;
        float _919 = _917 + _903;
        float _921 = _919 + _905;
        float _923 = _921 + _907;
        float _925 = _923 * 0.111111111938953399658203125;
        _927 = _925;
        _929 = true;
    }
    else
    {
        float _931 = rint(_596);
        float _933 = precise::max(_931, 0.0);
        uint _935 = uint(_933);
        uint _937 = clamp(_935, 0u, 65535u);
        float3 _2627 = float3(_837, _863, float(int(_937)));
        float3 _2629 = select(_2627, float3(0.0), isnan(_2627));
        float _939 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2629.xy, uint(rint(_2629.z)), _845);
        _927 = _939;
    }
    _929 = false;
    float _941 = _927;
    float _943 = _546 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _945 = _546 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _947 = -_161;
    float _949 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _951 = _947 + _949;
    float _953 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[101].x, _943);
    float _955 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[102].x, _945);
    float _957 = -_161;
    float _959 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _961 = _957 + _959;
    float _963 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].z, _953);
    float _965 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].z, _955);
    float _967 = _963 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _969 = _965 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _971 = trunc(_967);
    int _973 = int(_971);
    float _975 = trunc(_969);
    int _977 = int(_975);
    int _979 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _981 = _973 + _979;
    int _983 = _981 + 1;
    bool _985 = _983 >= 0;
    int _987 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _989 = _977 + _987;
    int _991 = _989 + 1;
    bool _993 = _983 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _995 = !_985;
    bool _997 = _993 || _995;
    bool _999 = _991 < 0;
    bool _1001 = _999 || _997;
    bool _1003 = _991 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1005 = _1003 || _1001;
    float _1007 = as_type<float>(_973);
    if (_1005)
    {
        _1007 = 1.0;
    }
    float _1009 = _1007;
    float _1011 = _1009;
    if (!_1005)
    {
        int _1013 = _991 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1015 = _1013 + _983;
        float _1017 = floor(_967);
        int _1019 = _1015 << 2;
        int _1021 = _1015 >> 2;
        int _1023 = 12 & _1019;
        int _1025 = _1021 << 4;
        int _1027 = _1025 + _1023;
        float _1029 = floor(_969);
        uint _1031 = uint(int(uint(_1027) >> uint(2)));
        uint _1033 = uint(int(uint(int(_1031)) >> uint(2)));
        int _1035 = int(_1031) & 3;
        float _1037 = (*spvDescriptorSet0.fp_c5)._m0[int(_1033)][_1035];
        float _1039 = -_1017;
        float _1041 = _967 + _1039;
        float _1043 = -_1029;
        float _1045 = _969 + _1043;
        float _1047 = rint(_1037);
        float _1049 = precise::max(_1047, 0.0);
        uint _1051 = uint(_1049);
        uint _1053 = clamp(_1051, 0u, 65535u);
        float3 _2816 = float3(_1041, _1045, float(int(_1053)));
        float3 _2818 = select(_2816, float3(0.0), isnan(_2816));
        float _1055 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2818.xy, uint(rint(_2818.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2818.xy, uint(rint(_2818.z)), level(0.0)).x;
        int _1057 = _1015 << 4;
        int _1059 = _1057 + 1648;
        int _1061 = _1027 + 8048;
        uint _1063 = uint(int(uint(_1061) >> uint(2)));
        uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
        int _1067 = int(_1063) & 3;
        float _1069 = (*spvDescriptorSet0.fp_c5)._m0[int(_1065)][_1067];
        uint _1071 = uint(int(uint(_1059) >> uint(2)));
        uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
        int _1075 = int(_1071) & 3;
        float _1077 = (*spvDescriptorSet0.fp_c5)._m0[int(_1073)][_1075];
        int _1079 = int(_1071) + 1;
        uint _1081 = uint(int(uint(_1079) >> uint(2)));
        int _1083 = _1079 & 3;
        float _1085 = (*spvDescriptorSet0.fp_c5)._m0[int(_1081)][_1083];
        int _1087 = _1059 + 8;
        uint _1089 = uint(int(uint(_1087) >> uint(2)));
        uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
        int _1093 = int(_1089) & 3;
        float _1095 = (*spvDescriptorSet0.fp_c5)._m0[int(_1091)][_1093];
        int _1097 = int(_1089) + 1;
        uint _1099 = uint(int(uint(_1097) >> uint(2)));
        int _1101 = _1097 & 3;
        float _1103 = (*spvDescriptorSet0.fp_c5)._m0[int(_1099)][_1101];
        float _1105 = _1069 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1107 = _546 * _1085;
        float _1109 = fma(_542, _1077, _1107);
        float _1111 = 1.0 / _1069;
        float _1113 = fma(_544, _1095, _1109);
        float _1115 = _1113 + _1103;
        float _1117 = precise::clamp(_1115, 0.0, 1.0);
        float _1119 = -_1117;
        float _1121 = _1119 + _1055;
        float _1123 = fma(_1111, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1121);
        float _1125 = _1105 * _1123;
        float _1127 = exp2(_1125);
        float _1129 = 0.0 + _1127;
        float _1131 = precise::clamp(_1129, 0.0, 1.0);
        _1011 = _1131;
    }
    float _1133 = _1011;
    float _1135 = precise::min(_1133, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1137 = _951 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1139 = precise::clamp(_1137, 0.0, 1.0);
    float _1141 = -_941;
    float _1143 = _1141 + 1.0;
    float _1145 = _961 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1147 = precise::clamp(_1145, 0.0, 1.0);
    float _1149 = -_1135;
    float _1151 = _1149 + 1.0;
    float _1153 = fma(_1139, _1143, _941);
    float _1155 = fma(_1147, _1151, _1135);
    out.m_60.x = _1153;
    out.m_60.y = _1155;
    out.m_60.z = 1.0;
    out.m_60.w = _871;
    out.m_62.x = _562;
    out.m_62.y = 0.5;
    out.m_62.z = 0.5;
    out.m_62.w = 1.0;
    return out;
}

