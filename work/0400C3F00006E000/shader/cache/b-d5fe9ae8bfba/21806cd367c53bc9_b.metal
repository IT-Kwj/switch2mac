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
    bool _917 = false;
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
    float2 _1183 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1183, float2(0.0), isnan(_1183))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1183, float2(0.0), isnan(_1183))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1198 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1198, float2(0.0), isnan(_1198))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1198, float2(0.0), isnan(_1198))).x;
    float2 _1206 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1206, float2(0.0), isnan(_1206))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1206, float2(0.0), isnan(_1206))).x;
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
    float _137 = _83 * _109;
    float _139 = _83 * _115;
    float _141 = _83 * _127;
    float _143 = -_91;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].x, _145);
    float _149 = _147 * _135;
    float _151 = _147 * _137;
    float _153 = -_95;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = _83 * _121;
    float _161 = _149 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _163 = _149 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = _83 * _133;
    float _167 = -_151;
    float _169 = fma(_157, _139, _167);
    float _171 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].x, _161);
    float _173 = -_97;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[41].x, _175);
    float _179 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _181 = -_149;
    float _183 = fma(_157, _159, _181);
    float _185 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].z, _171);
    float _187 = -_147;
    float _189 = _187 + _157;
    float _191 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[30].z, _179);
    float _193 = -_151;
    float _195 = fma(_177, _141, _193);
    float _197 = _185 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _199 = -_149;
    float _201 = fma(_177, _165, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _205 = -_147;
    float _207 = _205 + _177;
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _211 = _197 + _209;
    float _213 = _189 * _195;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _203 + _215;
    float _219 = _183 * _207;
    float _221 = _211 * _211;
    float _223 = -_213;
    float _225 = fma(_169, _207, _223);
    float _227 = _169 * _201;
    float _229 = -_219;
    float _231 = fma(_189, _201, _229);
    float _233 = fma(_217, _217, _221);
    float _235 = _225 * _225;
    float _237 = -_227;
    float _239 = fma(_183, _195, _237);
    float _241 = _149 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _243 = sqrt(_233);
    float _245 = fma(_231, _231, _235);
    float _247 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].x, _241);
    float _249 = fma(_239, _239, _245);
    float _251 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].z, _247);
    float _253 = rsqrt(_249);
    float _255 = _251 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _259 = _243 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _231 * _253;
    float _263 = _225 * _253;
    float _265 = _239 * _253;
    float _267 = _251;
    int _270 = as_type<int>(_225);
    float _272 = _197;
    float _274 = _255;
    if (!_259)
    {
        _267 = _203;
    }
    float _276 = _267;
    bool _278 = !_259;
    float _280 = _276;
    if (!_278)
    {
        float _282 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _284 = _243 + _282;
        float _286 = _255 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _288 = rsqrt(_233);
        float _290 = -_255;
        float _292 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _294 = _290 + _292;
        float _296 = abs(_286);
        float _298 = abs(_284);
        float _300 = precise::max(_296, _298);
        float _302 = _294 * _294;
        bool _304 = _300 >= 16.0;
        float _306 = _217 * _288;
        float _308 = _211 * _288;
        float _310 = -_217;
        float _312 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[41].z, _310);
        float _314 = _284;
        float _316 = _286;
        if (_304)
        {
            float _318 = _284 * 0.0625;
            _314 = _318;
        }
        float _320 = _314;
        if (_304)
        {
            float _322 = _286 * 0.0625;
            _316 = _322;
        }
        float _324 = _316;
        float _326 = -_211;
        float _328 = fma(_308, (*spvDescriptorSet0.fp_c3)._m0[41].z, _326);
        float _330 = fma(_312, _312, _302);
        float _332 = abs(_320);
        bool _334 = _332 != 0.0;
        bool _336 = isnan(_332);
        bool _338 = _334 || _336;
        bool _340 = isnan(0.0);
        bool _342 = _338 || _340;
        float _344 = fma(_328, _328, _330);
        float _346 = abs(_324);
        bool _348 = _346 == 0.0;
        float _350 = abs(_324);
        bool _352 = _350 == 0.0;
        bool _354 = !_342;
        bool _356 = _352 && _354;
        float _358 = sqrt(_344);
        bool _360 = false;
        float _362 = _328;
        int _364 = as_type<int>(_344);
        if (_356)
        {
            bool _366 = as_type<int>(_324) >= 0;
            _360 = _366;
        }
        bool _368 = _360;
        int _370 = _368 ? (-1) : 0;
        if (_356)
        {
            int _372 = _368 ? 0 : 1078530011;
            _270 = _372;
        }
        int _374 = _270;
        if (_356)
        {
            int _376 = int(0x80000000) & as_type<int>(_320);
            int _378 = _374 | _376;
            _362 = as_type<float>(_378);
        }
        float _380 = _362;
        bool _382 = !_342;
        bool _384 = _382 && _348;
        float _386 = _380;
        float _388 = _380;
        if (!_384)
        {
            float _390 = abs(_320);
            bool _392 = _390 != as_type<float>(0x7f800000u /* inf */);
            bool _394 = isnan(_390);
            bool _396 = _392 || _394;
            bool _398 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _400 = _396 || _398;
            float _402 = abs(_324);
            bool _404 = _402 == as_type<float>(0x7f800000u /* inf */);
            float _406 = abs(_324);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            bool _410 = !_400;
            bool _412 = _408 && _410;
            if (_412)
            {
                bool _414 = as_type<int>(_324) >= 0;
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
                int _428 = int(0x80000000) & as_type<int>(_320);
                int _430 = _426 | _428;
                _386 = as_type<float>(_430);
            }
            float _432 = _386;
            bool _434 = !_400;
            bool _436 = _434 && _404;
            _388 = _432;
            if (!_436)
            {
                float _438 = abs(_320);
                float _440 = abs(_324);
                float _442 = precise::max(_438, _440);
                float _444 = abs(_320);
                float _446 = abs(_324);
                float _448 = precise::min(_444, _446);
                float _450 = 1.0 / _442;
                float _452 = abs(_320);
                float _454 = abs(_324);
                bool _456 = _452 > _454;
                bool _458 = as_type<int>(_324) >= 0;
                float _460 = abs(_320);
                float _462 = abs(_324);
                float _464 = _460 + _462;
                int _466 = as_type<int>(_320) & int(0x80000000);
                bool _468 = _464 > as_type<float>(0x7f800000u /* inf */);
                bool _470 = isnan(_464);
                bool _472 = _468 || _470;
                bool _474 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _476 = _472 || _474;
                float _478 = _448 * _450;
                float _480 = _478 * _478;
                float _482 = _480 + 11.33538818359375;
                float _484 = fma(_480, _482, 28.84246826171875);
                float _486 = fma(_480, _484, 19.6966705322265625);
                float _488 = fma(_480, -0.82336294651031494140625, -5.674867153167724609375);
                float _490 = fma(_480, _488, -6.565555095672607421875);
                float _492 = 1.0 / _486;
                float _494 = _480 * _490;
                float _496 = _478 * _494;
                float _498 = fma(_496, _492, _478);
                float _500 = _498;
                _388 = _464;
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
                if (!_476)
                {
                    int _516 = _466 | _514;
                    _388 = as_type<float>(_516);
                }
            }
        }
        float _518 = _388;
        float _520 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _522 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _524 = _358 + _522;
        float _526 = fma(_306, _520, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _528 = fma(_308, _520, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _280 = _526;
        _272 = _528;
        _274 = _524;
    }
    float _530 = _280;
    float _532 = _272;
    float _534 = _274;
    float _536 = fma(_530, 6.2500002968590706586837768554688e-05, 0.5);
    float _538 = fma(_532, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1880 = float2(_536, _538);
    float _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1880, float2(0.0), isnan(_1880))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1880, float2(0.0), isnan(_1880))).x;
    float _542 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _544 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _1901 = float2(_536, _538);
    float _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1901, float2(0.0), isnan(_1901)), level(_540)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1901, float2(0.0), isnan(_1901)), level(_540)).x;
    float2 _1910 = float2(_542, _544);
    float _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1910, float2(0.0), isnan(_1910))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1910, float2(0.0), isnan(_1910))).x;
    float2 _1918 = float2(_85, _87);
    float _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1918, float2(0.0), isnan(_1918))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1918, float2(0.0), isnan(_1918))).x;
    float _552 = _263 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _554 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].x, _552);
    float _556 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _554);
    float _558 = -_556;
    float _560 = fma(_558, _556, 1.0);
    float _562 = -_556;
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _566 = _560 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _568 = fma(_564, _566, _147);
    float _570 = -_568;
    bool _572 = _570 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _574 = float(_572);
    float _576 = -_568;
    bool _578 = _576 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _580 = float(_578);
    float _582 = _574 + _580;
    float _584 = precise::min(_582, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _586 = abs(_147);
    float _588 = log2(_586);
    float _590 = trunc(_584);
    int _592 = int(_590);
    float _594 = _588 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _596 = exp2(_594);
    int _598 = _592 << 6;
    bool _600 = _592 != 0;
    int _602 = _598 + 48;
    uint _605 = uint(int(uint(_602) >> uint(2)));
    uint _607 = uint(int(uint(int(_605)) >> uint(2)));
    int _609 = int(_605) & 3;
    float _611 = (*spvDescriptorSet0.fp_c3)._m0[int(_607)][_609];
    int _613 = int(_605) + 1;
    uint _615 = uint(int(uint(_613) >> uint(2)));
    int _617 = _613 & 3;
    float _619 = (*spvDescriptorSet0.fp_c3)._m0[int(_615)][_617];
    int _621 = _598 + 56;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    uint _625 = uint(int(uint(int(_623)) >> uint(2)));
    int _627 = int(_623) & 3;
    float _629 = (*spvDescriptorSet0.fp_c3)._m0[int(_625)][_627];
    int _631 = int(_623) + 1;
    uint _633 = uint(int(uint(_631) >> uint(2)));
    int _635 = _631 & 3;
    float _637 = (*spvDescriptorSet0.fp_c3)._m0[int(_633)][_635];
    float _639 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _641 = precise::clamp(_639, 0.0, 1.0);
    float _643 = -_556;
    float _645 = fma(_643, (*spvDescriptorSet0.fp_c3)._m0[35].x, _261);
    float _647 = -_556;
    float _649 = fma(_647, (*spvDescriptorSet0.fp_c3)._m0[35].y, _263);
    float _651 = fma(_641, -2.0, 3.0);
    float _653 = _641 * _641;
    uint _655 = uint(int(uint(_598) >> uint(2)));
    uint _657 = uint(int(uint(int(_655)) >> uint(2)));
    int _659 = int(_655) & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = int(_655) + 1;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    int _667 = _663 & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    float _671 = fma(_649, _566, _149);
    float _673 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _675 = _653 * _651;
    float _677 = fma(_645, _566, _151);
    float _679 = -_675;
    float _681 = _679 + 1.0;
    int _683 = _598 + 16;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    float _701 = precise::max(0.0, _673);
    float _703 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[44].w, _675);
    float _705 = _703 * _701;
    int _707 = _598 + 32;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    int _725 = _598 + 8;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    uint _729 = uint(int(uint(int(_727)) >> uint(2)));
    int _731 = int(_727) & 3;
    float _733 = (*spvDescriptorSet0.fp_c3)._m0[int(_729)][_731];
    int _735 = int(_727) + 1;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    int _739 = _735 & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    int _743 = _598 + 24;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.fp_c3)._m0[int(_747)][_749];
    int _753 = int(_745) + 1;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    int _757 = _753 & 3;
    float _759 = (*spvDescriptorSet0.fp_c3)._m0[int(_755)][_757];
    float _761 = _671 * _619;
    float _763 = fma(_677, _611, _761);
    int _765 = _598 + 40;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.fp_c3)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.fp_c3)._m0[int(_777)][_779];
    float _783 = fma(_568, _629, _763);
    bool _785 = _147 >= (-8000.0);
    bool _787 = isnan(_147);
    bool _789 = _785 || _787;
    bool _791 = isnan(-8000.0);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = _783 + _637;
    float _799 = _795 * _705;
    float _801 = _671 * _669;
    float _803 = 1.0 / _797;
    float _805 = _799 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _807 = fma(_677, _661, _801);
    float _809 = _671 * _699;
    float _811 = fma(_677, _691, _809);
    float _813 = _671 * _723;
    float _815 = fma(_677, _715, _813);
    float _817 = fma(_568, _733, _807);
    float _819 = _817 + _741;
    float _821 = fma(_568, _751, _811);
    float _823 = _821 + _759;
    float _825 = _819 * _803;
    float _827 = fma(_568, _773, _815);
    float _829 = _827 + _781;
    float _831 = _829 * _803;
    float _833 = precise::clamp(_831, 0.0, 1.0);
    float _835 = abs(_546);
    float _837 = _835 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _839 = -_548;
    float _841 = _839 + 1.0;
    float _843 = -_837;
    float _845 = fma(_795, _843, 1.0);
    float _847 = _841 * _805;
    float _849 = precise::clamp(_847, 0.0, 1.0);
    float _851 = _823 * _803;
    float _853 = -_849;
    float _855 = fma(_853, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _857 = precise::min(_845, 1.0);
    float _859 = precise::min(_857, _855);
    float _915;
    if (!_600)
    {
        float _861 = rint(_584);
        float _863 = precise::max(_861, 0.0);
        uint _865 = uint(_863);
        uint _867 = clamp(_865, 0u, 65535u);
        float _869 = _833 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _871 = fma(_869, 0.5, _851);
        float _873 = fma(_869, 0.5, _825);
        float _875 = fma(_869, -0.5, _825);
        float _877 = fma(_869, -0.5, _851);
        float3 _2464 = float3(_825, _871, float(int(_867)));
        float3 _2468 = select(_2464, float3(0.0), isnan(_2464));
        float _879 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2468.xy, uint(rint(_2468.z)), _833);
        float3 _2477 = float3(_873, _871, float(int(_867)));
        float3 _2479 = select(_2477, float3(0.0), isnan(_2477));
        float _881 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2479.xy, uint(rint(_2479.z)), _833);
        float3 _2488 = float3(_875, _871, float(int(_867)));
        float3 _2490 = select(_2488, float3(0.0), isnan(_2488));
        float _883 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2490.xy, uint(rint(_2490.z)), _833);
        float3 _2499 = float3(_873, _851, float(int(_867)));
        float3 _2501 = select(_2499, float3(0.0), isnan(_2499));
        float _885 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2501.xy, uint(rint(_2501.z)), _833);
        float3 _2510 = float3(_825, _851, float(int(_867)));
        float3 _2512 = select(_2510, float3(0.0), isnan(_2510));
        float _887 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2512.xy, uint(rint(_2512.z)), _833);
        float3 _2521 = float3(_875, _851, float(int(_867)));
        float3 _2523 = select(_2521, float3(0.0), isnan(_2521));
        float _889 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2523.xy, uint(rint(_2523.z)), _833);
        float3 _2532 = float3(_873, _877, float(int(_867)));
        float3 _2534 = select(_2532, float3(0.0), isnan(_2532));
        float _891 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2534.xy, uint(rint(_2534.z)), _833);
        float3 _2543 = float3(_825, _877, float(int(_867)));
        float3 _2545 = select(_2543, float3(0.0), isnan(_2543));
        float _893 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2545.xy, uint(rint(_2545.z)), _833);
        float3 _2554 = float3(_875, _877, float(int(_867)));
        float3 _2556 = select(_2554, float3(0.0), isnan(_2554));
        float _895 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2556.xy, uint(rint(_2556.z)), _833);
        float _897 = _881 + _879;
        float _899 = _897 + _883;
        float _901 = _899 + _885;
        float _903 = _901 + _887;
        float _905 = _903 + _889;
        float _907 = _905 + _891;
        float _909 = _907 + _893;
        float _911 = _909 + _895;
        float _913 = _911 * 0.111111111938953399658203125;
        _915 = _913;
        _917 = true;
    }
    else
    {
        float _919 = rint(_584);
        float _921 = precise::max(_919, 0.0);
        uint _923 = uint(_921);
        uint _925 = clamp(_923, 0u, 65535u);
        float3 _2603 = float3(_825, _851, float(int(_925)));
        float3 _2605 = select(_2603, float3(0.0), isnan(_2603));
        float _927 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2605.xy, uint(rint(_2605.z)), _833);
        _915 = _927;
    }
    _917 = false;
    float _929 = _915;
    float _931 = _534 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _933 = _534 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _935 = -_147;
    float _937 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _939 = _935 + _937;
    float _941 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[101].x, _931);
    float _943 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[102].x, _933);
    float _945 = -_147;
    float _947 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _949 = _945 + _947;
    float _951 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].z, _941);
    float _953 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].z, _943);
    float _955 = _951 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _957 = _953 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _959 = trunc(_955);
    int _961 = int(_959);
    float _963 = trunc(_957);
    int _965 = int(_963);
    int _967 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _969 = _961 + _967;
    int _971 = _969 + 1;
    bool _973 = _971 >= 0;
    int _975 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _977 = _965 + _975;
    int _979 = _977 + 1;
    bool _981 = _971 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _983 = !_973;
    bool _985 = _981 || _983;
    bool _987 = _979 < 0;
    bool _989 = _987 || _985;
    bool _991 = _979 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _993 = _991 || _989;
    float _995 = as_type<float>(_961);
    if (_993)
    {
        _995 = 1.0;
    }
    float _997 = _995;
    float _999 = _997;
    if (!_993)
    {
        int _1001 = _979 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1003 = _1001 + _971;
        float _1005 = floor(_955);
        int _1007 = _1003 << 2;
        int _1009 = _1003 >> 2;
        int _1011 = 12 & _1007;
        int _1013 = _1009 << 4;
        int _1015 = _1013 + _1011;
        float _1017 = floor(_957);
        uint _1019 = uint(int(uint(_1015) >> uint(2)));
        uint _1021 = uint(int(uint(int(_1019)) >> uint(2)));
        int _1023 = int(_1019) & 3;
        float _1025 = (*spvDescriptorSet0.fp_c5)._m0[int(_1021)][_1023];
        float _1027 = -_1005;
        float _1029 = _955 + _1027;
        float _1031 = -_1017;
        float _1033 = _957 + _1031;
        float _1035 = rint(_1025);
        float _1037 = precise::max(_1035, 0.0);
        uint _1039 = uint(_1037);
        uint _1041 = clamp(_1039, 0u, 65535u);
        float3 _2792 = float3(_1029, _1033, float(int(_1041)));
        float3 _2794 = select(_2792, float3(0.0), isnan(_2792));
        float _1043 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2794.xy, uint(rint(_2794.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2794.xy, uint(rint(_2794.z)), level(0.0)).x;
        int _1045 = _1003 << 4;
        int _1047 = _1045 + 1648;
        int _1049 = _1015 + 8048;
        uint _1051 = uint(int(uint(_1049) >> uint(2)));
        uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
        int _1055 = int(_1051) & 3;
        float _1057 = (*spvDescriptorSet0.fp_c5)._m0[int(_1053)][_1055];
        uint _1059 = uint(int(uint(_1047) >> uint(2)));
        uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
        int _1063 = int(_1059) & 3;
        float _1065 = (*spvDescriptorSet0.fp_c5)._m0[int(_1061)][_1063];
        int _1067 = int(_1059) + 1;
        uint _1069 = uint(int(uint(_1067) >> uint(2)));
        int _1071 = _1067 & 3;
        float _1073 = (*spvDescriptorSet0.fp_c5)._m0[int(_1069)][_1071];
        int _1075 = _1047 + 8;
        uint _1077 = uint(int(uint(_1075) >> uint(2)));
        uint _1079 = uint(int(uint(int(_1077)) >> uint(2)));
        int _1081 = int(_1077) & 3;
        float _1083 = (*spvDescriptorSet0.fp_c5)._m0[int(_1079)][_1081];
        int _1085 = int(_1077) + 1;
        uint _1087 = uint(int(uint(_1085) >> uint(2)));
        int _1089 = _1085 & 3;
        float _1091 = (*spvDescriptorSet0.fp_c5)._m0[int(_1087)][_1089];
        float _1093 = _1057 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1095 = _534 * _1073;
        float _1097 = fma(_530, _1065, _1095);
        float _1099 = 1.0 / _1057;
        float _1101 = fma(_532, _1083, _1097);
        float _1103 = _1101 + _1091;
        float _1105 = precise::clamp(_1103, 0.0, 1.0);
        float _1107 = -_1105;
        float _1109 = _1107 + _1043;
        float _1111 = fma(_1099, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1109);
        float _1113 = _1093 * _1111;
        float _1115 = exp2(_1113);
        float _1117 = 0.0 + _1115;
        float _1119 = precise::clamp(_1117, 0.0, 1.0);
        _999 = _1119;
    }
    float _1121 = _999;
    float _1123 = precise::min(_1121, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1125 = _939 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1127 = precise::clamp(_1125, 0.0, 1.0);
    float _1129 = -_929;
    float _1131 = _1129 + 1.0;
    float _1133 = _949 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1135 = precise::clamp(_1133, 0.0, 1.0);
    float _1137 = -_1123;
    float _1139 = _1137 + 1.0;
    float _1141 = fma(_1127, _1131, _929);
    float _1143 = fma(_1135, _1139, _1123);
    out.m_60.x = _1141;
    out.m_60.y = _1143;
    out.m_60.z = 1.0;
    out.m_60.w = _859;
    out.m_62.x = _550;
    out.m_62.y = 0.5;
    out.m_62.z = 0.5;
    out.m_62.w = 1.0;
    return out;
}

