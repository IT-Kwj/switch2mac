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
    texture2d<float> fp_t_tcb_16 [[id(11)]];
    sampler fp_t_tcb_16Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_1A [[id(13)]];
    sampler fp_t_tcb_1ASmplr [[id(14)]];
    texture2d<float> fp_t_tcb_10 [[id(15)]];
    sampler fp_t_tcb_10Smplr [[id(16)]];
    texture2d<float> fp_t_tcb_14 [[id(17)]];
    sampler fp_t_tcb_14Smplr [[id(18)]];
    texture2d_array<float> fp_t_tcb_C [[id(19)]];
    sampler fp_t_tcb_CSmplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_E [[id(21)]];
    sampler fp_t_tcb_ESmplr [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_ASmplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    sampler fp_t_tcb_16Smplr_w [[id(26)]];
    sampler fp_t_tcb_1ASmplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
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
    bool _1178 = false;
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
    float2 _1441 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1441, float2(0.0), isnan(_1441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1441, float2(0.0), isnan(_1441))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1456 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1456, float2(0.0), isnan(_1456))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1456, float2(0.0), isnan(_1456))).x;
    float2 _1464 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1464, float2(0.0), isnan(_1464))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1464, float2(0.0), isnan(_1464))).x;
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
    float _147 = _89 * _133;
    float _149 = -_97;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].x, _151);
    float _155 = _153 * _141;
    float _157 = _153 * _143;
    float _159 = -_101;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].x, _161);
    float _165 = _89 * _127;
    float _167 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _169 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _171 = -_103;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[41].x, _173);
    float _177 = _89 * _139;
    float _179 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _167);
    float _181 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _169);
    float _183 = -_157;
    float _185 = fma(_163, _145, _183);
    float _187 = -_155;
    float _189 = fma(_163, _165, _187);
    float _191 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _179);
    float _193 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _181);
    float _195 = -_153;
    float _197 = _195 + _163;
    float _199 = -_157;
    float _201 = fma(_175, _147, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _207 = -_155;
    float _209 = fma(_175, _177, _207);
    float _211 = -_153;
    float _213 = _211 + _175;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _217 = _203 + _215;
    float _219 = _197 * _201;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _223 = _205 + _221;
    float _225 = _189 * _213;
    float _227 = _217 * _217;
    float _229 = -_219;
    float _231 = fma(_185, _213, _229);
    float _233 = _185 * _209;
    float _235 = -_225;
    float _237 = fma(_197, _209, _235);
    float _239 = fma(_223, _223, _227);
    float _241 = _231 * _231;
    float _243 = -_233;
    float _245 = fma(_189, _201, _243);
    float _247 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _249 = sqrt(_239);
    float _251 = fma(_237, _237, _241);
    float _253 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _247);
    float _255 = fma(_245, _245, _251);
    float _257 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _253);
    float _259 = rsqrt(_255);
    float _261 = _257 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _265 = _249 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _267 = _237 * _259;
    float _269 = _231 * _259;
    float _271 = _245 * _259;
    float _273 = _245;
    float _275 = _259;
    float _277 = _203;
    float _279 = _153;
    if (!_265)
    {
        _273 = _205;
    }
    float _281 = _273;
    float _283 = _281;
    if (!_265)
    {
        _275 = _261;
    }
    float _285 = _275;
    bool _287 = !_265;
    float _289 = _285;
    if (!_287)
    {
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _293 = _249 + _291;
        float _295 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = rsqrt(_239);
        float _299 = abs(_295);
        float _301 = abs(_293);
        float _303 = precise::max(_299, _301);
        bool _305 = _303 >= 16.0;
        float _307 = -_261;
        float _309 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _311 = _307 + _309;
        float _313 = _311 * _311;
        float _315 = _223 * _297;
        float _317 = _217 * _297;
        float _319 = -_223;
        float _321 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[41].z, _319);
        float _323 = _293;
        float _325 = _295;
        if (_305)
        {
            float _327 = _293 * 0.0625;
            _323 = _327;
        }
        float _329 = _323;
        if (_305)
        {
            float _331 = _295 * 0.0625;
            _325 = _331;
        }
        float _333 = _325;
        float _335 = -_217;
        float _337 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _335);
        float _339 = fma(_321, _321, _313);
        float _341 = abs(_329);
        bool _343 = _341 != 0.0;
        bool _345 = isnan(_341);
        bool _347 = _343 || _345;
        bool _349 = isnan(0.0);
        bool _351 = _347 || _349;
        float _353 = fma(_337, _337, _339);
        float _355 = abs(_333);
        bool _357 = _355 == 0.0;
        float _359 = abs(_333);
        bool _361 = _359 == 0.0;
        bool _363 = !_351;
        bool _365 = _361 && _363;
        float _367 = sqrt(_353);
        bool _369 = false;
        int _372 = as_type<int>(_337);
        if (_365)
        {
            bool _374 = as_type<int>(_333) >= 0;
            _369 = _374;
        }
        bool _376 = _369;
        int _378 = _376 ? (-1) : 0;
        if (_365)
        {
            int _380 = _376 ? 0 : 1078530011;
            _372 = _380;
        }
        int _382 = _372;
        int _384 = _382;
        if (_365)
        {
            int _386 = int(0x80000000) & as_type<int>(_329);
            int _388 = _382 | _386;
            _384 = _388;
        }
        int _390 = _384;
        bool _392 = !_351;
        bool _394 = _392 && _357;
        int _396 = _390;
        float _398 = as_type<float>(_390);
        if (!_394)
        {
            float _400 = abs(_329);
            bool _402 = _400 != as_type<float>(0x7f800000u /* inf */);
            bool _404 = isnan(_400);
            bool _406 = _402 || _404;
            bool _408 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _410 = _406 || _408;
            float _412 = abs(_333);
            bool _414 = _412 == as_type<float>(0x7f800000u /* inf */);
            float _416 = abs(_333);
            bool _418 = _416 == as_type<float>(0x7f800000u /* inf */);
            bool _420 = !_410;
            bool _422 = _418 && _420;
            if (_422)
            {
                bool _424 = as_type<int>(_333) >= 0;
                _378 = _424 ? (-1) : 0;
            }
            int _426 = _378;
            if (_422)
            {
                _396 = 1075235812;
            }
            int _428 = _396;
            int _430 = _428;
            if (_422)
            {
                int _432 = ~_426;
                int _434 = (_432 != 0) ? _428 : 1061752795;
                _430 = _434;
            }
            int _436 = _430;
            float _438 = as_type<float>(_436);
            if (_422)
            {
                int _440 = int(0x80000000) & as_type<int>(_329);
                int _442 = _436 | _440;
                _438 = as_type<float>(_442);
            }
            float _444 = _438;
            bool _446 = !_410;
            bool _448 = _446 && _414;
            _398 = _444;
            if (!_448)
            {
                float _450 = abs(_329);
                float _452 = abs(_333);
                float _454 = precise::max(_450, _452);
                float _456 = abs(_329);
                float _458 = abs(_333);
                float _460 = precise::min(_456, _458);
                float _462 = 1.0 / _454;
                float _464 = abs(_329);
                float _466 = abs(_333);
                bool _468 = _464 > _466;
                bool _470 = as_type<int>(_333) >= 0;
                float _472 = _460 * _462;
                float _474 = abs(_329);
                float _476 = abs(_333);
                float _478 = _474 + _476;
                int _480 = as_type<int>(_329) & int(0x80000000);
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
                _398 = _478;
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
                    _398 = as_type<float>(_528);
                }
            }
        }
        float _530 = _398;
        float _532 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _534 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _536 = _367 + _534;
        float _538 = fma(_315, _532, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _540 = fma(_317, _532, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _283 = _538;
        _277 = _540;
        _289 = _536;
    }
    float _542 = _283;
    float _544 = _277;
    float _546 = _289;
    float2 _2140 = float2(_91, _93);
    float2 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2140, float2(0.0), isnan(_2140))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2140, float2(0.0), isnan(_2140))).xy;
    float _552 = _550.x;
    float _554 = _550.y;
    float _556 = fma(_542, 6.2500002968590706586837768554688e-05, 0.5);
    float _558 = fma(_544, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2158 = float2(_556, _558);
    float _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2158, float2(0.0), isnan(_2158))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2158, float2(0.0), isnan(_2158))).x;
    float _562 = _269 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _564 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _566 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _568 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].x, _562);
    float _570 = floor(_564);
    float _572 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].z, _568);
    float _574 = -_572;
    float _576 = fma(_574, _572, 1.0);
    float _578 = -_572;
    float _580 = fma(_578, (*spvDescriptorSet0.fp_c3)._m0[35].z, _271);
    float _582 = floor(_566);
    float _584 = -_572;
    float _586 = fma(_584, (*spvDescriptorSet0.fp_c3)._m0[35].x, _267);
    float _588 = _576 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _590 = -_572;
    float _592 = fma(_590, (*spvDescriptorSet0.fp_c3)._m0[35].y, _269);
    float _594 = fma(_580, _588, _153);
    float _596 = -_570;
    float _598 = _564 + _596;
    float _600 = fma(_592, _588, _155);
    float _602 = fma(_586, _588, _157);
    float _604 = -_594;
    bool _606 = _604 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _608 = float(_606);
    float _610 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _612 = _598 + _610;
    float _614 = -_594;
    bool _616 = _614 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _618 = float(_616);
    float _620 = -_582;
    float _622 = _566 + _620;
    float _624 = -_612;
    float _626 = _624 + 1.0;
    float _628 = _608 + _618;
    float _630 = abs(_153);
    float _632 = log2(_630);
    float _634 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _636 = _622 + _634;
    float _638 = precise::min(_628, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _640 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _642 = -_636;
    float _644 = _642 + 1.0;
    float _646 = _636 * _612;
    float _648 = _636 * _626;
    float _650 = trunc(_638);
    int _652 = int(_650);
    float _654 = _612 * _644;
    float _656 = _644 * _626;
    float _658 = precise::max(0.0, _640);
    float _660 = _632 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _662 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _664 = exp2(_660);
    int _666 = _652 << 6;
    bool _668 = _652 != 0;
    uint _671 = uint(int(uint(_666) >> uint(2)));
    uint _673 = uint(int(uint(int(_671)) >> uint(2)));
    int _675 = int(_671) & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    int _679 = int(_671) + 1;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    int _683 = _679 & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    float _687 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _689 = precise::clamp(_687, 0.0, 1.0);
    float _691 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _693 = _689 * _689;
    float _695 = fma(_689, -2.0, 3.0);
    float _697 = _693 * _695;
    float _699 = -_697;
    float _701 = _699 + 1.0;
    float _703 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[44].w, _697);
    float _705 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _707 = _703 * _658;
    float _709 = _600 * _685;
    float _711 = fma(_602, _677, _709);
    float _713 = fma(_554, 2.0, -1.0);
    float _715 = fma(_552, 2.0, -1.0);
    float _717 = _713 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _719 = _715 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _721 = fma(_717, 2.0, _93);
    float _723 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _725 = fma(_719, 2.0, _91);
    float2 _2434 = float2(_691, _705);
    float4 _728 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2434, float2(0.0), isnan(_2434)), int2(0), component::x).xyzw;
    float _730 = _728.x;
    float _732 = _728.y;
    float _734 = _728.z;
    float _736 = _728.w;
    float2 _2450 = float2(_556, _558);
    float _738 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2450, float2(0.0), isnan(_2450)), level(_560)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2450, float2(0.0), isnan(_2450)), level(_560)).x;
    int _740 = _666 + 16;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    float2 _2490 = float2(_723, _662);
    float _758 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2490, float2(0.0), isnan(_2490))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2490, float2(0.0), isnan(_2490))).x;
    float2 _2498 = float2(_691, _705);
    float4 _760 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2498, float2(0.0), isnan(_2498)), int2(0), component::x).xyzw;
    float _762 = _760.x;
    float _764 = _760.y;
    float _766 = _760.z;
    float _768 = _760.w;
    float2 _2514 = float2(_691, _705);
    float4 _770 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2514, float2(0.0), isnan(_2514)), int2(0), component::w).xyzw;
    float _772 = _770.x;
    float _774 = _770.y;
    float _776 = _770.z;
    float _778 = _770.w;
    float2 _2530 = float2(_725, _721);
    float2 _780 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2530, float2(0.0), isnan(_2530))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2530, float2(0.0), isnan(_2530))).yz;
    float _782 = _780.x;
    float _784 = _780.y;
    float _786 = _600 * _756;
    float _788 = fma(_602, _748, _786);
    float _790 = -_730;
    float _792 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _794 = -_732;
    float _796 = fma(_794, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _798 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _800 = -_734;
    float _802 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _804 = -_736;
    float _806 = fma(_804, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _808 = 1.0 / _792;
    float _810 = abs(_738);
    float _812 = _810 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _814 = -_758;
    float _816 = _814 + 1.0;
    float _818 = 1.0 / _796;
    float _820 = 1.0 / _802;
    float _822 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _824 = -_153;
    float _826 = fma(_808, _822, _824);
    float _828 = 1.0 / _798;
    float _830 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _832 = -_153;
    float _834 = fma(_818, _830, _832);
    float _836 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _838 = -_153;
    float _840 = fma(_820, _836, _838);
    float _842 = 1.0 / _806;
    float _844 = _828 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _846 = abs(_834);
    float _848 = _846 * _844;
    float _850 = abs(_840);
    float _852 = _850 * _844;
    int _854 = _666 + 32;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    uint _858 = uint(int(uint(int(_856)) >> uint(2)));
    int _860 = int(_856) & 3;
    float _862 = (*spvDescriptorSet0.fp_c3)._m0[int(_858)][_860];
    int _864 = int(_856) + 1;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    int _868 = _864 & 3;
    float _870 = (*spvDescriptorSet0.fp_c3)._m0[int(_866)][_868];
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _874 = -_153;
    float _876 = fma(_842, _872, _874);
    float _878 = abs(_826);
    float _880 = _878 * _844;
    float _882 = abs(_876);
    float _884 = _882 * _844;
    float _886 = exp2(_880);
    float _888 = exp2(_848);
    float _890 = abs(_654);
    float _892 = _890 * _886;
    float _894 = exp2(_884);
    float _896 = abs(_646);
    float _898 = _896 * _888;
    float _900 = _892 + _898;
    float _902 = abs(_656);
    float _904 = _902 * _894;
    float _906 = _600 * _870;
    float _908 = fma(_602, _862, _906);
    int _910 = _666 + 48;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.fp_c3)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.fp_c3)._m0[int(_922)][_924];
    float _928 = _600 * _926;
    float _930 = fma(_602, _918, _928);
    int _932 = _666 + 8;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    uint _936 = uint(int(uint(int(_934)) >> uint(2)));
    int _938 = int(_934) & 3;
    float _940 = (*spvDescriptorSet0.fp_c3)._m0[int(_936)][_938];
    int _942 = int(_934) + 1;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    int _946 = _942 & 3;
    float _948 = (*spvDescriptorSet0.fp_c3)._m0[int(_944)][_946];
    float _950 = fma(_594, _940, _711);
    float _952 = _950 + _948;
    int _954 = _666 + 24;
    uint _956 = uint(int(uint(_954) >> uint(2)));
    uint _958 = uint(int(uint(int(_956)) >> uint(2)));
    int _960 = int(_956) & 3;
    float _962 = (*spvDescriptorSet0.fp_c3)._m0[int(_958)][_960];
    int _964 = int(_956) + 1;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    int _968 = _964 & 3;
    float _970 = (*spvDescriptorSet0.fp_c3)._m0[int(_966)][_968];
    float _972 = fma(_594, _962, _788);
    float _974 = exp2(_852);
    float _976 = _972 + _970;
    int _978 = _666 + 40;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    uint _982 = uint(int(uint(int(_980)) >> uint(2)));
    int _984 = int(_980) & 3;
    float _986 = (*spvDescriptorSet0.fp_c3)._m0[int(_982)][_984];
    int _988 = int(_980) + 1;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    int _992 = _988 & 3;
    float _994 = (*spvDescriptorSet0.fp_c3)._m0[int(_990)][_992];
    float _996 = abs(_648);
    float _998 = _996 * _974;
    float _1000 = _998 + _900;
    float _1002 = _904 + _1000;
    float _1004 = -_904;
    bool _1006 = _1000 != _1004;
    bool _1008 = isnan(_1000);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(_1004);
    bool _1014 = _1010 || _1012;
    float _1016 = 1.0 / _1002;
    float _1018 = _898 * _1016;
    float _1020 = _892 * _1016;
    float _1022 = _998 * _1016;
    float _1024 = _904 * _1016;
    float _1026 = _1014 ? _1018 : 0.25;
    float _1028 = fma(_594, _986, _908);
    float _1030 = _1014 ? _1020 : 0.25;
    float _1032 = _1014 ? _1024 : 0.25;
    float _1034 = _1028 + _994;
    int _1036 = _666 + 56;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.fp_c3)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.fp_c3)._m0[int(_1048)][_1050];
    float _1054 = fma(_594, _1044, _930);
    bool _1056 = _153 >= (-8000.0);
    bool _1058 = isnan(_153);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(-8000.0);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = _1026 * _764;
    float _1070 = _1054 + _1052;
    float _1072 = _1026 * _774;
    float _1074 = _1066 * _707;
    float _1076 = _1014 ? _1022 : 0.25;
    float _1078 = 1.0 / _1070;
    float _1080 = fma(_1030, _762, _1068);
    float _1082 = fma(_1030, _772, _1072);
    float _1084 = _1074 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1086 = -_812;
    float _1088 = fma(_1066, _1086, 1.0);
    float _1090 = fma(_1076, _766, _1080);
    float _1092 = fma(_1076, _776, _1082);
    float _1094 = _816 * _1084;
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = fma(_1032, _768, _1090);
    float _1100 = fma(_1032, _778, _1092);
    float _1102 = -_1096;
    float _1104 = fma(_1102, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1106 = precise::min(_1088, 1.0);
    float _1108 = precise::min(_1098, 1.0);
    float _1110 = _952 * _1078;
    float _1112 = _976 * _1078;
    float _1114 = _1034 * _1078;
    float _1116 = precise::clamp(_1114, 0.0, 1.0);
    float _1118 = precise::min(_1106, _1104);
    float _1120 = precise::min(_1100, 1.0);
    float _1176;
    if (!_668)
    {
        float _1122 = rint(_638);
        float _1124 = precise::max(_1122, 0.0);
        uint _1126 = uint(_1124);
        uint _1128 = clamp(_1126, 0u, 65535u);
        float _1130 = _1116 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1132 = fma(_1130, 0.5, _1112);
        float _1134 = fma(_1130, 0.5, _1110);
        float _1136 = fma(_1130, -0.5, _1110);
        float _1138 = fma(_1130, -0.5, _1112);
        float3 _3086 = float3(_1110, _1132, float(int(_1128)));
        float3 _3090 = select(_3086, float3(0.0), isnan(_3086));
        float _1140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3090.xy, uint(rint(_3090.z)), _1116);
        float3 _3099 = float3(_1134, _1132, float(int(_1128)));
        float3 _3101 = select(_3099, float3(0.0), isnan(_3099));
        float _1142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3101.xy, uint(rint(_3101.z)), _1116);
        float3 _3110 = float3(_1136, _1132, float(int(_1128)));
        float3 _3112 = select(_3110, float3(0.0), isnan(_3110));
        float _1144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3112.xy, uint(rint(_3112.z)), _1116);
        float3 _3121 = float3(_1134, _1112, float(int(_1128)));
        float3 _3123 = select(_3121, float3(0.0), isnan(_3121));
        float _1146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3123.xy, uint(rint(_3123.z)), _1116);
        float3 _3132 = float3(_1110, _1112, float(int(_1128)));
        float3 _3134 = select(_3132, float3(0.0), isnan(_3132));
        float _1148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3134.xy, uint(rint(_3134.z)), _1116);
        float3 _3143 = float3(_1136, _1112, float(int(_1128)));
        float3 _3145 = select(_3143, float3(0.0), isnan(_3143));
        float _1150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3145.xy, uint(rint(_3145.z)), _1116);
        float3 _3154 = float3(_1134, _1138, float(int(_1128)));
        float3 _3156 = select(_3154, float3(0.0), isnan(_3154));
        float _1152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3156.xy, uint(rint(_3156.z)), _1116);
        float3 _3165 = float3(_1110, _1138, float(int(_1128)));
        float3 _3167 = select(_3165, float3(0.0), isnan(_3165));
        float _1154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3167.xy, uint(rint(_3167.z)), _1116);
        float3 _3176 = float3(_1136, _1138, float(int(_1128)));
        float3 _3178 = select(_3176, float3(0.0), isnan(_3176));
        float _1156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3178.xy, uint(rint(_3178.z)), _1116);
        float _1158 = _1142 + _1140;
        float _1160 = _1158 + _1144;
        float _1162 = _1160 + _1146;
        float _1164 = _1162 + _1148;
        float _1166 = _1164 + _1150;
        float _1168 = _1166 + _1152;
        float _1170 = _1168 + _1154;
        float _1172 = _1170 + _1156;
        float _1174 = _1172 * 0.111111111938953399658203125;
        _1176 = _1174;
        _1178 = true;
    }
    else
    {
        float _1180 = rint(_638);
        float _1182 = precise::max(_1180, 0.0);
        uint _1184 = uint(_1182);
        uint _1186 = clamp(_1184, 0u, 65535u);
        float3 _3225 = float3(_1110, _1112, float(int(_1186)));
        float3 _3227 = select(_3225, float3(0.0), isnan(_3225));
        float _1188 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3227.xy, uint(rint(_3227.z)), _1116);
        _1176 = _1188;
    }
    _1178 = false;
    float _1190 = _1176;
    float _1192 = _546 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1194 = _546 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1196 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1192);
    float _1198 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1194);
    float _1200 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1196);
    float _1202 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1198);
    float _1204 = _1200 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1206 = _1202 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1208 = trunc(_1204);
    int _1210 = int(_1208);
    float _1212 = trunc(_1206);
    int _1214 = int(_1212);
    int _1216 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1218 = _1210 + _1216;
    int _1220 = _1218 + 1;
    float _1222 = -_153;
    float _1224 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1226 = _1222 + _1224;
    bool _1228 = _1220 >= 0;
    int _1230 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1232 = _1214 + _1230;
    int _1234 = _1232 + 1;
    float _1236 = -_153;
    float _1238 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1240 = _1236 + _1238;
    bool _1242 = _1220 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1244 = !_1228;
    bool _1246 = _1242 || _1244;
    bool _1248 = _1234 < 0;
    bool _1250 = _1248 || _1246;
    bool _1252 = _1234 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1254 = _1252 || _1250;
    if (_1254)
    {
        _279 = 1.0;
    }
    float _1256 = _279;
    float _1258 = _1256;
    if (!_1254)
    {
        int _1260 = _1234 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1262 = _1260 + _1220;
        float _1264 = floor(_1206);
        int _1266 = _1262 << 2;
        int _1268 = _1262 >> 2;
        int _1270 = 12 & _1266;
        int _1272 = _1268 << 4;
        int _1274 = _1272 + _1270;
        float _1276 = floor(_1204);
        uint _1278 = uint(int(uint(_1274) >> uint(2)));
        uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
        int _1282 = int(_1278) & 3;
        float _1284 = (*spvDescriptorSet0.fp_c5)._m0[int(_1280)][_1282];
        float _1286 = -_1264;
        float _1288 = _1206 + _1286;
        float _1290 = -_1276;
        float _1292 = _1204 + _1290;
        float _1294 = rint(_1284);
        float _1296 = precise::max(_1294, 0.0);
        uint _1298 = uint(_1296);
        uint _1300 = clamp(_1298, 0u, 65535u);
        float3 _3412 = float3(_1292, _1288, float(int(_1300)));
        float3 _3414 = select(_3412, float3(0.0), isnan(_3412));
        float _1302 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3414.xy, uint(rint(_3414.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3414.xy, uint(rint(_3414.z)), level(0.0)).x;
        int _1304 = _1262 << 4;
        int _1306 = _1304 + 1648;
        int _1308 = _1274 + 8048;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
        int _1314 = int(_1310) & 3;
        float _1316 = (*spvDescriptorSet0.fp_c5)._m0[int(_1312)][_1314];
        uint _1318 = uint(int(uint(_1306) >> uint(2)));
        uint _1320 = uint(int(uint(int(_1318)) >> uint(2)));
        int _1322 = int(_1318) & 3;
        float _1324 = (*spvDescriptorSet0.fp_c5)._m0[int(_1320)][_1322];
        int _1326 = int(_1318) + 1;
        uint _1328 = uint(int(uint(_1326) >> uint(2)));
        int _1330 = _1326 & 3;
        float _1332 = (*spvDescriptorSet0.fp_c5)._m0[int(_1328)][_1330];
        int _1334 = _1306 + 8;
        uint _1336 = uint(int(uint(_1334) >> uint(2)));
        uint _1338 = uint(int(uint(int(_1336)) >> uint(2)));
        int _1340 = int(_1336) & 3;
        float _1342 = (*spvDescriptorSet0.fp_c5)._m0[int(_1338)][_1340];
        int _1344 = int(_1336) + 1;
        uint _1346 = uint(int(uint(_1344) >> uint(2)));
        int _1348 = _1344 & 3;
        float _1350 = (*spvDescriptorSet0.fp_c5)._m0[int(_1346)][_1348];
        float _1352 = _1316 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1354 = _546 * _1332;
        float _1356 = fma(_542, _1324, _1354);
        float _1358 = 1.0 / _1316;
        float _1360 = fma(_544, _1342, _1356);
        float _1362 = _1360 + _1350;
        float _1364 = precise::clamp(_1362, 0.0, 1.0);
        float _1366 = -_1364;
        float _1368 = _1366 + _1302;
        float _1370 = fma(_1358, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1368);
        float _1372 = _1352 * _1370;
        float _1374 = exp2(_1372);
        float _1376 = 0.0 + _1374;
        float _1378 = precise::clamp(_1376, 0.0, 1.0);
        _1258 = _1378;
    }
    float _1380 = _1258;
    float _1382 = precise::min(_1380, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1384 = -_1190;
    float _1386 = _1384 + 1.0;
    float _1388 = _1240 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1390 = precise::clamp(_1388, 0.0, 1.0);
    float _1392 = _1226 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1394 = precise::clamp(_1392, 0.0, 1.0);
    float _1396 = -_1382;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1390, _1386, _1190);
    float _1402 = fma(_1394, _1398, _1382);
    out.m_66.x = _1400;
    out.m_66.y = _1402;
    out.m_66.z = _1120;
    out.m_66.w = _1118;
    out.m_68.x = _1108;
    out.m_68.y = _782;
    out.m_68.z = _784;
    out.m_68.w = 1.0;
    return out;
}

