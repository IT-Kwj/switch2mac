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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_18 [[id(7)]];
    sampler fp_t_tcb_18Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_1A [[id(13)]];
    sampler fp_t_tcb_1ASmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_16 [[id(19)]];
    sampler fp_t_tcb_16Smplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_E [[id(21)]];
    sampler fp_t_tcb_ESmplr [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_ASmplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    sampler fp_t_tcb_1ASmplr_w [[id(26)]];
    sampler fp_t_tcb_14Smplr_w [[id(27)]];
    sampler fp_t_tcb_16Smplr_w [[id(28)]];
    sampler fp_t_tcb_ESmplr_w [[id(29)]];
    constant dm_border_t* dm_border [[id(30)]];
};

struct main0_out
{
    float4 m_66 [[color(0)]];
    float4 m_68 [[color(1)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = gl_FragCoord.w;
    float _77 = in.m_57.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_57.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float _95 = _91 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1362 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1362, float2(0.0), isnan(_1362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1362, float2(0.0), isnan(_1362))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1377 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1377, float2(0.0), isnan(_1377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1377, float2(0.0), isnan(_1377))).x;
    float2 _1385 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1385, float2(0.0), isnan(_1385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1385, float2(0.0), isnan(_1385))).x;
    float _105 = in.m_59.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_59.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_61.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_61.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_63.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_63.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _89 * _109;
    float _143 = _89 * _115;
    float _145 = _89 * _121;
    float _147 = _89 * _127;
    float _149 = _89 * _133;
    float _151 = _89 * _139;
    float _153 = -_97;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _157 = 1.0 / _155;
    float _159 = -_103;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _163 = -_101;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _167 = 1.0 / _165;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = _157 * _169;
    float _173 = 1.0 / _161;
    float _175 = _171 * _141;
    float _177 = _171 * _143;
    float _179 = _175 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _181 = _175 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _185 = _167 * _183;
    float _187 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[32].x, _179);
    float _189 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[30].x, _181);
    float _191 = -_177;
    float _193 = fma(_185, _145, _191);
    float _195 = -_175;
    float _197 = fma(_185, _147, _195);
    float _199 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[32].z, _187);
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _203 = _173 * _201;
    float _205 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[30].z, _189);
    float _207 = -_171;
    float _209 = _207 + _185;
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _213 = -_177;
    float _215 = fma(_203, _149, _213);
    float _217 = _205 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _219 = -_171;
    float _221 = _219 + _203;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _225 = _211 + _223;
    float _227 = _209 * _215;
    float _229 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _231 = _217 + _229;
    float _233 = -_175;
    float _235 = fma(_203, _151, _233);
    float _237 = _225 * _225;
    float _239 = _197 * _221;
    float _241 = -_227;
    float _243 = fma(_193, _221, _241);
    float _245 = _193 * _235;
    float _247 = fma(_231, _231, _237);
    float _249 = -_239;
    float _251 = fma(_209, _235, _249);
    float _253 = _243 * _243;
    float _255 = -_245;
    float _257 = fma(_197, _215, _255);
    float _259 = sqrt(_247);
    float _261 = _175 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = fma(_251, _251, _253);
    float _265 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    float _267 = fma(_257, _257, _263);
    float _269 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].z, _265);
    float _271 = rsqrt(_267);
    float _273 = _269 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _277 = _259 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _279 = _251 * _271;
    float _281 = _243 * _271;
    float _283 = _257 * _271;
    bool _285 = !_277;
    float _287 = _217;
    float _289 = _211;
    float _291 = _273;
    if (!_285)
    {
        float _293 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _295 = _259 + _293;
        float _297 = _273 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = rsqrt(_247);
        float _301 = -_273;
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = _301 + _303;
        float _307 = abs(_297);
        float _309 = abs(_295);
        float _311 = precise::max(_307, _309);
        float _313 = _305 * _305;
        bool _315 = _311 >= 16.0;
        float _317 = _231 * _299;
        float _319 = _225 * _299;
        float _321 = -_231;
        float _323 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _321);
        float _325 = -_225;
        float _327 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[41].z, _325);
        float _329 = _295;
        float _331 = _297;
        int _334 = as_type<int>(_327);
        if (_315)
        {
            float _336 = _295 * 0.0625;
            _329 = _336;
        }
        float _338 = _329;
        if (_315)
        {
            float _340 = _297 * 0.0625;
            _331 = _340;
        }
        float _342 = _331;
        float _344 = fma(_323, _323, _313);
        float _346 = abs(_338);
        bool _348 = _346 != 0.0;
        bool _350 = isnan(_346);
        bool _352 = _348 || _350;
        bool _354 = isnan(0.0);
        bool _356 = _352 || _354;
        float _358 = fma(_327, _327, _344);
        float _360 = abs(_342);
        bool _362 = _360 == 0.0;
        float _364 = abs(_342);
        bool _366 = _364 == 0.0;
        bool _368 = !_356;
        bool _370 = _366 && _368;
        float _372 = sqrt(_358);
        bool _374 = false;
        if (_370)
        {
            bool _376 = as_type<int>(_342) >= 0;
            _374 = _376;
        }
        bool _378 = _374;
        int _380 = _378 ? (-1) : 0;
        if (_370)
        {
            int _382 = _378 ? 0 : 1078530011;
            _334 = _382;
        }
        int _384 = _334;
        int _386 = _384;
        if (_370)
        {
            int _388 = int(0x80000000) & as_type<int>(_338);
            int _390 = _384 | _388;
            _386 = _390;
        }
        int _392 = _386;
        bool _394 = !_356;
        bool _396 = _394 && _362;
        int _398 = _392;
        float _400 = as_type<float>(_392);
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
                _380 = _426 ? (-1) : 0;
            }
            int _428 = _380;
            if (_424)
            {
                _398 = 1075235812;
            }
            int _430 = _398;
            int _432 = _430;
            if (_424)
            {
                int _434 = ~_428;
                int _436 = (_434 != 0) ? _430 : 1061752795;
                _432 = _436;
            }
            int _438 = _432;
            float _440 = as_type<float>(_438);
            if (_424)
            {
                int _442 = int(0x80000000) & as_type<int>(_338);
                int _444 = _438 | _442;
                _440 = as_type<float>(_444);
            }
            float _446 = _440;
            bool _448 = !_412;
            bool _450 = _448 && _416;
            _400 = _446;
            if (!_450)
            {
                float _452 = abs(_338);
                float _454 = abs(_342);
                float _456 = precise::max(_452, _454);
                float _458 = abs(_338);
                float _460 = abs(_342);
                float _462 = precise::min(_458, _460);
                float _464 = 1.0 / _456;
                float _466 = abs(_338);
                float _468 = abs(_342);
                bool _470 = _466 > _468;
                bool _472 = as_type<int>(_342) >= 0;
                float _474 = _462 * _464;
                float _476 = abs(_338);
                float _478 = abs(_342);
                float _480 = _476 + _478;
                int _482 = as_type<int>(_338) & int(0x80000000);
                float _484 = _474 * _474;
                bool _486 = _480 > as_type<float>(0x7f800000u /* inf */);
                bool _488 = isnan(_480);
                bool _490 = _486 || _488;
                bool _492 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _494 = _490 || _492;
                float _496 = _484 + 11.33538818359375;
                float _498 = fma(_484, _496, 28.84246826171875);
                float _500 = fma(_484, _498, 19.6966705322265625);
                float _502 = fma(_484, -0.82336294651031494140625, -5.674867153167724609375);
                float _504 = fma(_484, _502, -6.565555095672607421875);
                float _506 = 1.0 / _500;
                float _508 = _484 * _504;
                float _510 = _474 * _508;
                float _512 = fma(_510, _506, _474);
                float _514 = _512;
                _400 = _480;
                if (_470)
                {
                    float _516 = -_512;
                    float _518 = _516 + 1.57079637050628662109375;
                    _514 = _518;
                }
                float _520 = _514;
                int _522 = as_type<int>(_520);
                if (!_472)
                {
                    float _524 = -_520;
                    float _526 = _524 + 3.1415927410125732421875;
                    _522 = as_type<int>(_526);
                }
                int _528 = _522;
                if (!_494)
                {
                    int _530 = _482 | _528;
                    _400 = as_type<float>(_530);
                }
            }
        }
        float _532 = _400;
        float _534 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _536 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _538 = _372 + _536;
        float _540 = fma(_317, _534, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _542 = fma(_319, _534, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _287 = _540;
        _289 = _542;
        _291 = _538;
    }
    float _544 = _287;
    float _546 = _289;
    float _548 = _291;
    float2 _2059 = float2(_91, _93);
    float2 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2059, float2(0.0), isnan(_2059))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2059, float2(0.0), isnan(_2059))).xy;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = fma(_544, 6.2500002968590706586837768554688e-05, 0.5);
    float _560 = fma(_546, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2077 = float2(_558, _560);
    float _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2077, float2(0.0), isnan(_2077))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2077, float2(0.0), isnan(_2077))).x;
    float _564 = _281 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _566 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].x, _564);
    float _568 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[35].z, _566);
    float _570 = -_568;
    float _572 = fma(_570, _568, 1.0);
    float _574 = -_568;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].z, _283);
    float _578 = -_568;
    float _580 = fma(_578, (*spvDescriptorSet0.fp_c3)._m0[35].y, _281);
    float _582 = -_568;
    float _584 = fma(_582, (*spvDescriptorSet0.fp_c3)._m0[35].x, _279);
    float _586 = _572 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _588 = fma(_576, _586, _171);
    float _590 = fma(_580, _586, _175);
    float _592 = fma(_584, _586, _177);
    float _594 = -_588;
    bool _596 = _594 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _598 = float(_596);
    float _600 = -_588;
    bool _602 = _600 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _604 = float(_602);
    float _606 = _598 + _604;
    float _608 = precise::min(_606, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _610 = trunc(_608);
    int _612 = int(_610);
    int _614 = _612 << 6;
    int _616 = _614 + 48;
    uint _619 = uint(int(uint(_616) >> uint(2)));
    uint _621 = uint(int(uint(int(_619)) >> uint(2)));
    int _623 = int(_619) & 3;
    float _625 = (*spvDescriptorSet0.fp_c3)._m0[int(_621)][_623];
    int _627 = int(_619) + 1;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    int _631 = _627 & 3;
    float _633 = (*spvDescriptorSet0.fp_c3)._m0[int(_629)][_631];
    int _635 = _614 + 56;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[int(_639)][_641];
    int _645 = int(_637) + 1;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    int _649 = _645 & 3;
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[int(_647)][_649];
    int _653 = _614 + 32;
    uint _655 = uint(int(uint(_653) >> uint(2)));
    uint _657 = uint(int(uint(int(_655)) >> uint(2)));
    int _659 = int(_655) & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = int(_655) + 1;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    int _667 = _663 & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    uint _671 = uint(int(uint(_614) >> uint(2)));
    uint _673 = uint(int(uint(int(_671)) >> uint(2)));
    int _675 = int(_671) & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    int _679 = int(_671) + 1;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    int _683 = _679 & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    int _687 = _614 + 40;
    uint _689 = uint(int(uint(_687) >> uint(2)));
    uint _691 = uint(int(uint(int(_689)) >> uint(2)));
    int _693 = int(_689) & 3;
    float _695 = (*spvDescriptorSet0.fp_c3)._m0[int(_691)][_693];
    int _697 = int(_689) + 1;
    uint _699 = uint(int(uint(_697) >> uint(2)));
    int _701 = _697 & 3;
    float _703 = (*spvDescriptorSet0.fp_c3)._m0[int(_699)][_701];
    int _705 = _614 + 8;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    uint _709 = uint(int(uint(int(_707)) >> uint(2)));
    int _711 = int(_707) & 3;
    float _713 = (*spvDescriptorSet0.fp_c3)._m0[int(_709)][_711];
    int _715 = int(_707) + 1;
    uint _717 = uint(int(uint(_715) >> uint(2)));
    int _719 = _715 & 3;
    float _721 = (*spvDescriptorSet0.fp_c3)._m0[int(_717)][_719];
    float _723 = _590 * _633;
    int _725 = _614 + 16;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    uint _729 = uint(int(uint(int(_727)) >> uint(2)));
    int _731 = int(_727) & 3;
    float _733 = (*spvDescriptorSet0.fp_c3)._m0[int(_729)][_731];
    int _735 = int(_727) + 1;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    int _739 = _735 & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    float _743 = fma(_592, _625, _723);
    float _745 = fma(_588, _643, _743);
    int _747 = _614 + 24;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.fp_c3)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.fp_c3)._m0[int(_759)][_761];
    float _765 = _745 + _651;
    float _767 = _590 * _669;
    float _769 = 1.0 / _765;
    float _771 = fma(_592, _661, _767);
    float _773 = _590 * _685;
    float _775 = fma(_592, _677, _773);
    float _777 = fma(_588, _695, _771);
    float _779 = _777 + _703;
    float _781 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _783 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _785 = fma(_588, _713, _775);
    float _787 = _785 + _721;
    float2 _2469 = float2(_781, _783);
    float4 _790 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2469, float2(0.0), isnan(_2469)), int2(0), component::x).xyzw;
    float _792 = _790.x;
    float _794 = _790.y;
    float _796 = _790.z;
    float _798 = _790.w;
    float _800 = _590 * _741;
    float _802 = fma(_592, _733, _800);
    float _804 = rint(_608);
    float _806 = precise::max(_804, 0.0);
    uint _808 = uint(_806);
    uint _810 = clamp(_808, 0u, 65535u);
    float _812 = fma(_546, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _814 = fma(_588, _755, _802);
    float _816 = _787 * _769;
    float _818 = _814 + _763;
    float _820 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _822 = _818 * _769;
    float _824 = _779 * _769;
    float _826 = precise::clamp(_824, 0.0, 1.0);
    float2 _2533 = float2(_781, _783);
    float4 _828 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2533, float2(0.0), isnan(_2533)), int2(0), component::w).xyzw;
    float _830 = _828.x;
    float _832 = _828.y;
    float _834 = _828.z;
    float _836 = _828.w;
    float _838 = fma(_554, 2.0, -1.0);
    float _840 = fma(_556, 2.0, -1.0);
    float _842 = _838 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _844 = _840 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _846 = fma(_842, 2.0, _91);
    float _848 = fma(_844, 2.0, _93);
    float2 _2569 = float2(_820, _812);
    float _850 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2569, float2(0.0), isnan(_2569))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2569, float2(0.0), isnan(_2569))).x;
    float3 _2581 = float3(_816, _822, float(int(_810)));
    float3 _2585 = select(_2581, float3(0.0), isnan(_2581));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2585.xy, uint(rint(_2585.z)), _826);
    float2 _2591 = float2(_846, _848);
    float2 _854 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2591, float2(0.0), isnan(_2591))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2591, float2(0.0), isnan(_2591))).yz;
    float _856 = _854.x;
    float _858 = _854.y;
    float2 _2603 = float2(_558, _560);
    float _860 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2603, float2(0.0), isnan(_2603)), level(_562)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2603, float2(0.0), isnan(_2603)), level(_562)).x;
    float _862 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _864 = abs(_171);
    float _866 = log2(_864);
    float _868 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _870 = precise::min(_171, -1.0000000116860974230803549289703e-07);
    float _872 = floor(_862);
    float _874 = floor(_868);
    float _876 = _866 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _878 = -_872;
    float _880 = _862 + _878;
    float _882 = exp2(_876);
    float _884 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _886 = _880 + _884;
    float _888 = -_874;
    float _890 = _868 + _888;
    float _892 = 1.0 / _870;
    float _894 = -_886;
    float _896 = _894 + 1.0;
    float _898 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _900 = _890 + _898;
    float _902 = -_900;
    float _904 = _902 + 1.0;
    float _906 = _886 * _900;
    float _908 = _900 * _896;
    float _910 = fma(_882, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _912 = precise::clamp(_910, 0.0, 1.0);
    float _914 = _886 * _904;
    float _916 = _896 * _904;
    float _918 = _548 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _920 = fma(_912, -2.0, 3.0);
    float _922 = _912 * _912;
    float _924 = _892 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _926 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].x, _918);
    float _928 = _922 * _920;
    float _930 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].z, _926);
    float _932 = -_792;
    float _934 = fma(_932, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _936 = -_794;
    float _938 = fma(_936, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _940 = -_796;
    float _942 = fma(_940, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _944 = -_798;
    float _946 = fma(_944, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _948 = 1.0 / _934;
    float _950 = 1.0 / _938;
    float _952 = -_928;
    float _954 = _952 + 1.0;
    float _956 = fma(_954, (*spvDescriptorSet0.fp_c3)._m0[44].w, _928);
    float _958 = 1.0 / _942;
    float _960 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _962 = -_171;
    float _964 = fma(_948, _960, _962);
    float _966 = abs(_964);
    float _968 = _966 * _924;
    float _970 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _972 = 1.0 / _946;
    float _974 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _976 = -_171;
    float _978 = fma(_950, _974, _976);
    float _980 = precise::max(0.0, _970);
    float _982 = abs(_978);
    float _984 = _982 * _924;
    float _986 = _548 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _988 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _990 = -_171;
    float _992 = fma(_958, _988, _990);
    float _994 = exp2(_968);
    float _996 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].x, _986);
    float _998 = abs(_992);
    float _1000 = _998 * _924;
    float _1002 = _956 * _980;
    float _1004 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1006 = -_171;
    float _1008 = fma(_972, _1004, _1006);
    float _1010 = exp2(_984);
    float _1012 = abs(_1008);
    float _1014 = _1012 * _924;
    float _1016 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].z, _996);
    float _1018 = exp2(_1000);
    float _1020 = _1016 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1022 = abs(_908);
    float _1024 = _1022 * _994;
    float _1026 = exp2(_1014);
    float _1028 = abs(_906);
    float _1030 = _1028 * _1010;
    float _1032 = _930 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1034 = _1024 + _1030;
    float _1036 = trunc(_1020);
    int _1038 = int(_1036);
    float _1040 = abs(_914);
    float _1042 = _1040 * _1018;
    bool _1044 = _171 >= (-8000.0);
    bool _1046 = isnan(_171);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan(-8000.0);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = _1042 + _1034;
    float _1058 = abs(_916);
    float _1060 = _1058 * _1026;
    float _1062 = trunc(_1032);
    int _1064 = int(_1062);
    float _1066 = _1060 + _1056;
    float _1068 = -_1060;
    bool _1070 = _1056 != _1068;
    bool _1072 = isnan(_1056);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(_1068);
    bool _1078 = _1074 || _1076;
    int _1080 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1082 = _1038 + _1080;
    int _1084 = _1082 + 1;
    float _1086 = _1054 * _1002;
    float _1088 = 1.0 / _1066;
    bool _1090 = _1084 >= 0;
    bool _1092 = _1084 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1094 = !_1090;
    bool _1096 = _1092 || _1094;
    int _1098 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1100 = _1064 + _1098;
    int _1102 = _1100 + 1;
    bool _1104 = _1102 < 0;
    bool _1106 = _1104 || _1096;
    bool _1108 = _1102 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1110 = _1108 || _1106;
    float _1112 = _1030 * _1088;
    float _1114 = _1024 * _1088;
    float _1116 = _1042 * _1088;
    float _1118 = _1078 ? _1112 : 0.25;
    float _1120 = _1078 ? _1114 : 0.25;
    float _1122 = _1118 * _832;
    float _1124 = _1118;
    if (_1110)
    {
        _1124 = 1.0;
    }
    float _1126 = _1124;
    float _1128 = _1126;
    if (!_1110)
    {
        int _1130 = _1102 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1132 = _1130 + _1084;
        float _1134 = floor(_1032);
        int _1136 = _1132 << 2;
        int _1138 = _1132 >> 2;
        int _1140 = 12 & _1136;
        int _1142 = _1138 << 4;
        int _1144 = _1142 + _1140;
        float _1146 = floor(_1020);
        uint _1148 = uint(int(uint(_1144) >> uint(2)));
        uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
        int _1152 = int(_1148) & 3;
        float _1154 = (*spvDescriptorSet0.fp_c5)._m0[int(_1150)][_1152];
        float _1156 = -_1134;
        float _1158 = _1032 + _1156;
        float _1160 = -_1146;
        float _1162 = _1020 + _1160;
        float _1164 = rint(_1154);
        float _1166 = precise::max(_1164, 0.0);
        uint _1168 = uint(_1166);
        uint _1170 = clamp(_1168, 0u, 65535u);
        float3 _3061 = float3(_1162, _1158, float(int(_1170)));
        float3 _3063 = select(_3061, float3(0.0), isnan(_3061));
        float _1172 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3063.xy, uint(rint(_3063.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3063.xy, uint(rint(_3063.z)), level(0.0)).x;
        int _1174 = _1132 << 4;
        int _1176 = _1174 + 1648;
        int _1178 = _1144 + 8048;
        uint _1180 = uint(int(uint(_1178) >> uint(2)));
        uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
        int _1184 = int(_1180) & 3;
        float _1186 = (*spvDescriptorSet0.fp_c5)._m0[int(_1182)][_1184];
        uint _1188 = uint(int(uint(_1176) >> uint(2)));
        uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
        int _1192 = int(_1188) & 3;
        float _1194 = (*spvDescriptorSet0.fp_c5)._m0[int(_1190)][_1192];
        int _1196 = int(_1188) + 1;
        uint _1198 = uint(int(uint(_1196) >> uint(2)));
        int _1200 = _1196 & 3;
        float _1202 = (*spvDescriptorSet0.fp_c5)._m0[int(_1198)][_1200];
        int _1204 = _1176 + 8;
        uint _1206 = uint(int(uint(_1204) >> uint(2)));
        uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
        int _1210 = int(_1206) & 3;
        float _1212 = (*spvDescriptorSet0.fp_c5)._m0[int(_1208)][_1210];
        int _1214 = int(_1206) + 1;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        int _1218 = _1214 & 3;
        float _1220 = (*spvDescriptorSet0.fp_c5)._m0[int(_1216)][_1218];
        float _1222 = _548 * _1202;
        float _1224 = 1.0 / _1186;
        float _1226 = fma(_544, _1194, _1222);
        float _1228 = fma(_546, _1212, _1226);
        float _1230 = _1228 + _1220;
        float _1232 = precise::clamp(_1230, 0.0, 1.0);
        float _1234 = _1186 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1236 = -_1232;
        float _1238 = _1236 + _1172;
        float _1240 = fma(_1224, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1238);
        float _1242 = _1234 * _1240;
        float _1244 = exp2(_1242);
        float _1246 = 0.0 + _1244;
        float _1248 = precise::clamp(_1246, 0.0, 1.0);
        _1128 = _1248;
    }
    float _1250 = _1128;
    float _1252 = _1060 * _1088;
    float _1254 = _1078 ? _1116 : 0.25;
    float _1256 = fma(_1120, _830, _1122);
    float _1258 = _1086 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1260 = -_850;
    float _1262 = _1260 + 1.0;
    float _1264 = abs(_860);
    float _1266 = _1264 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1268 = _1078 ? _1252 : 0.25;
    float _1270 = fma(_1254, _834, _1256);
    float _1272 = _1262 * _1258;
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = -_1266;
    float _1278 = fma(_1054, _1276, 1.0);
    float _1280 = -_171;
    float _1282 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1284 = _1280 + _1282;
    float _1286 = precise::min(_1250, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1288 = -_171;
    float _1290 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1292 = _1288 + _1290;
    float _1294 = -_1274;
    float _1296 = fma(_1294, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1298 = fma(_1268, _836, _1270);
    float _1300 = precise::min(_1278, 1.0);
    float _1302 = _1284 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = _1292 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1308 = precise::clamp(_1306, 0.0, 1.0);
    float _1310 = -_852;
    float _1312 = _1310 + 1.0;
    float _1314 = -_1286;
    float _1316 = _1314 + 1.0;
    float _1318 = precise::min(_1300, _1296);
    float _1320 = precise::min(_1298, 1.0);
    float _1322 = fma(_1308, _1312, _852);
    float _1324 = fma(_1304, _1316, _1286);
    out.m_66.x = _1322;
    out.m_66.y = _1324;
    out.m_66.z = _1320;
    out.m_66.w = _1318;
    out.m_68.x = 1.0;
    out.m_68.y = _856;
    out.m_68.z = _858;
    out.m_68.w = 1.0;
    return out;
}

