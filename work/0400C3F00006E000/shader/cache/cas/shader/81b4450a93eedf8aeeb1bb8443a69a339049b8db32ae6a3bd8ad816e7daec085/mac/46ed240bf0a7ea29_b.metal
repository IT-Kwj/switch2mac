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
    texture2d<float> fp_t_tcb_1A [[id(7)]];
    sampler fp_t_tcb_1ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_1C [[id(13)]];
    sampler fp_t_tcb_1CSmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d<float> fp_t_tcb_E [[id(17)]];
    sampler fp_t_tcb_ESmplr [[id(18)]];
    texture2d<float> fp_t_tcb_16 [[id(19)]];
    sampler fp_t_tcb_16Smplr [[id(20)]];
    texture2d<float> fp_t_tcb_18 [[id(21)]];
    sampler fp_t_tcb_18Smplr [[id(22)]];
    texture2d_array<float> fp_t_tcb_10 [[id(23)]];
    sampler fp_t_tcb_10Smplr [[id(24)]];
    sampler fp_t_tcb_8Smplr_w [[id(25)]];
    sampler fp_t_tcb_ASmplr_w [[id(26)]];
    sampler fp_t_tcb_1ASmplr_w [[id(27)]];
    sampler fp_t_tcb_1CSmplr_w [[id(28)]];
    sampler fp_t_tcb_ESmplr_w [[id(29)]];
    sampler fp_t_tcb_16Smplr_w [[id(30)]];
    sampler fp_t_tcb_18Smplr_w [[id(31)]];
    sampler fp_t_tcb_10Smplr_w [[id(32)]];
    constant dm_border_t* dm_border [[id(33)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
    float4 m_70 [[color(1)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _77 = gl_FragCoord.w;
    float _79 = in.m_59.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_59.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _77;
    float _93 = _91 * _83;
    float _95 = _91 * _89;
    float _97 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1370 = float2(_93, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1370, float2(0.0), isnan(_1370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1370, float2(0.0), isnan(_1370))).x;
    float _101 = _95 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1385 = float2(_97, _95);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1385, float2(0.0), isnan(_1385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1385, float2(0.0), isnan(_1385))).x;
    float2 _1393 = float2(_93, _101);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1393, float2(0.0), isnan(_1393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1393, float2(0.0), isnan(_1393))).x;
    float _107 = in.m_61.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_63.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_61.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_65.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_65.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_63.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _91 * _111;
    float _145 = _91 * _117;
    float _147 = _91 * _123;
    float _149 = _91 * _129;
    float _151 = _91 * _135;
    float _153 = _91 * _141;
    float _155 = -_99;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = 1.0 / _157;
    float _161 = -_103;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _165 = -_105;
    float _167 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _169 = 1.0 / _163;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _173 = _159 * _171;
    float _175 = 1.0 / _167;
    float _177 = _173 * _143;
    float _179 = _173 * _147;
    float _181 = _177 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _183 = _177 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _185 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _187 = _169 * _185;
    float _189 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[32].x, _181);
    float _191 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[30].x, _183);
    float _193 = -_179;
    float _195 = fma(_187, _151, _193);
    float _197 = -_177;
    float _199 = fma(_187, _149, _197);
    float _201 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[32].z, _189);
    float _203 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[30].z, _191);
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _207 = _175 * _205;
    float _209 = -_173;
    float _211 = _209 + _187;
    float _213 = _201 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _215 = _203 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _217 = -_179;
    float _219 = fma(_207, _145, _217);
    float _221 = -_177;
    float _223 = fma(_207, _153, _221);
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _227 = _213 + _225;
    float _229 = -_173;
    float _231 = _229 + _207;
    float _233 = _211 * _219;
    float _235 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _237 = _215 + _235;
    float _239 = _227 * _227;
    float _241 = _199 * _231;
    float _243 = -_233;
    float _245 = fma(_195, _231, _243);
    float _247 = _195 * _223;
    float _249 = fma(_237, _237, _239);
    float _251 = -_241;
    float _253 = fma(_211, _223, _251);
    float _255 = _245 * _245;
    float _257 = -_247;
    float _259 = fma(_199, _219, _257);
    float _261 = sqrt(_249);
    float _263 = fma(_253, _253, _255);
    float _265 = _177 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _267 = fma(_259, _259, _263);
    float _269 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[31].x, _265);
    float _271 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].z, _269);
    float _273 = rsqrt(_267);
    float _275 = _271 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _279 = _261 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _281 = _259 * _273;
    float _283 = _253 * _273;
    float _285 = _245 * _273;
    float _287 = _259;
    float _289 = _213;
    float _291 = _275;
    if (!_279)
    {
        _287 = _215;
    }
    float _293 = _287;
    bool _295 = !_279;
    float _297 = _293;
    if (!_295)
    {
        float _299 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _301 = _261 + _299;
        float _303 = _275 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = rsqrt(_249);
        float _307 = -_275;
        float _309 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _311 = _307 + _309;
        float _313 = abs(_303);
        float _315 = abs(_301);
        float _317 = precise::max(_313, _315);
        float _319 = _311 * _311;
        bool _321 = _317 >= 16.0;
        float _323 = _237 * _305;
        float _325 = _227 * _305;
        float _327 = -_237;
        float _329 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[41].z, _327);
        float _331 = -_227;
        float _333 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[41].z, _331);
        float _335 = _301;
        float _337 = _303;
        int _340 = as_type<int>(_333);
        if (_321)
        {
            float _342 = _301 * 0.0625;
            _335 = _342;
        }
        float _344 = _335;
        if (_321)
        {
            float _346 = _303 * 0.0625;
            _337 = _346;
        }
        float _348 = _337;
        float _350 = fma(_329, _329, _319);
        float _352 = abs(_344);
        bool _354 = _352 != 0.0;
        bool _356 = isnan(_352);
        bool _358 = _354 || _356;
        bool _360 = isnan(0.0);
        bool _362 = _358 || _360;
        float _364 = fma(_333, _333, _350);
        float _366 = abs(_348);
        bool _368 = _366 == 0.0;
        float _370 = abs(_348);
        bool _372 = _370 == 0.0;
        bool _374 = !_362;
        bool _376 = _372 && _374;
        float _378 = sqrt(_364);
        bool _380 = false;
        if (_376)
        {
            bool _382 = as_type<int>(_348) >= 0;
            _380 = _382;
        }
        bool _384 = _380;
        int _386 = _384 ? (-1) : 0;
        if (_376)
        {
            int _388 = _384 ? 0 : 1078530011;
            _340 = _388;
        }
        int _390 = _340;
        int _392 = _390;
        if (_376)
        {
            int _394 = int(0x80000000) & as_type<int>(_344);
            int _396 = _390 | _394;
            _392 = _396;
        }
        int _398 = _392;
        bool _400 = !_362;
        bool _402 = _400 && _368;
        int _404 = _398;
        float _406 = as_type<float>(_398);
        if (!_402)
        {
            float _408 = abs(_344);
            bool _410 = _408 != as_type<float>(0x7f800000u /* inf */);
            bool _412 = isnan(_408);
            bool _414 = _410 || _412;
            bool _416 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _418 = _414 || _416;
            float _420 = abs(_348);
            bool _422 = _420 == as_type<float>(0x7f800000u /* inf */);
            float _424 = abs(_348);
            bool _426 = _424 == as_type<float>(0x7f800000u /* inf */);
            bool _428 = !_418;
            bool _430 = _426 && _428;
            if (_430)
            {
                bool _432 = as_type<int>(_348) >= 0;
                _386 = _432 ? (-1) : 0;
            }
            int _434 = _386;
            if (_430)
            {
                _404 = 1075235812;
            }
            int _436 = _404;
            int _438 = _436;
            if (_430)
            {
                int _440 = ~_434;
                int _442 = (_440 != 0) ? _436 : 1061752795;
                _438 = _442;
            }
            int _444 = _438;
            float _446 = as_type<float>(_444);
            if (_430)
            {
                int _448 = int(0x80000000) & as_type<int>(_344);
                int _450 = _444 | _448;
                _446 = as_type<float>(_450);
            }
            float _452 = _446;
            bool _454 = !_418;
            bool _456 = _454 && _422;
            _406 = _452;
            if (!_456)
            {
                float _458 = abs(_344);
                float _460 = abs(_348);
                float _462 = precise::max(_458, _460);
                float _464 = abs(_344);
                float _466 = abs(_348);
                float _468 = precise::min(_464, _466);
                float _470 = 1.0 / _462;
                float _472 = abs(_344);
                float _474 = abs(_348);
                bool _476 = _472 > _474;
                bool _478 = as_type<int>(_348) >= 0;
                float _480 = abs(_344);
                float _482 = abs(_348);
                float _484 = _480 + _482;
                int _486 = as_type<int>(_344) & int(0x80000000);
                bool _488 = _484 > as_type<float>(0x7f800000u /* inf */);
                bool _490 = isnan(_484);
                bool _492 = _488 || _490;
                bool _494 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _496 = _492 || _494;
                float _498 = _468 * _470;
                float _500 = _498 * _498;
                float _502 = _500 + 11.33538818359375;
                float _504 = fma(_500, _502, 28.84246826171875);
                float _506 = fma(_500, _504, 19.6966705322265625);
                float _508 = fma(_500, -0.82336294651031494140625, -5.674867153167724609375);
                float _510 = fma(_500, _508, -6.565555095672607421875);
                float _512 = 1.0 / _506;
                float _514 = _500 * _510;
                float _516 = _498 * _514;
                float _518 = fma(_516, _512, _498);
                float _520 = _518;
                _406 = _484;
                if (_476)
                {
                    float _522 = -_518;
                    float _524 = _522 + 1.57079637050628662109375;
                    _520 = _524;
                }
                float _526 = _520;
                int _528 = as_type<int>(_526);
                if (!_478)
                {
                    float _530 = -_526;
                    float _532 = _530 + 3.1415927410125732421875;
                    _528 = as_type<int>(_532);
                }
                int _534 = _528;
                if (!_496)
                {
                    int _536 = _486 | _534;
                    _406 = as_type<float>(_536);
                }
            }
        }
        float _538 = _406;
        float _540 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _542 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _544 = _378 + _542;
        float _546 = fma(_323, _540, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _548 = fma(_325, _540, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _297 = _546;
        _289 = _548;
        _291 = _544;
    }
    float _550 = _297;
    float _552 = _289;
    float _554 = _291;
    float2 _2074 = float2(_93, _95);
    float2 _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2074, float2(0.0), isnan(_2074))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2074, float2(0.0), isnan(_2074))).xy;
    float _560 = _558.x;
    float _562 = _558.y;
    float _564 = fma(_550, 6.2500002968590706586837768554688e-05, 0.5);
    float _566 = fma(_552, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2092 = float2(_564, _566);
    float _568 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2092, float2(0.0), isnan(_2092))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2092, float2(0.0), isnan(_2092))).x;
    float _570 = _285 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _572 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[35].x, _570);
    float _574 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[35].z, _572);
    float _576 = -_574;
    float _578 = fma(_576, _574, 1.0);
    float _580 = -_574;
    float _582 = fma(_580, (*spvDescriptorSet0.fp_c3)._m0[35].z, _281);
    float _584 = -_574;
    float _586 = fma(_584, (*spvDescriptorSet0.fp_c3)._m0[35].y, _285);
    float _588 = -_574;
    float _590 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[35].x, _283);
    float _592 = _578 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _594 = fma(_582, _592, _173);
    float _596 = fma(_586, _592, _177);
    float _598 = fma(_590, _592, _179);
    float _600 = -_594;
    bool _602 = _600 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _604 = float(_602);
    float _606 = -_594;
    bool _608 = _606 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _610 = float(_608);
    float _612 = _604 + _610;
    float _614 = precise::min(_612, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _616 = trunc(_614);
    int _618 = int(_616);
    int _620 = _618 << 6;
    int _622 = _620 + 48;
    uint _625 = uint(int(uint(_622) >> uint(2)));
    uint _627 = uint(int(uint(int(_625)) >> uint(2)));
    int _629 = int(_625) & 3;
    float _631 = (*spvDescriptorSet0.fp_c3)._m0[int(_627)][_629];
    int _633 = int(_625) + 1;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    int _637 = _633 & 3;
    float _639 = (*spvDescriptorSet0.fp_c3)._m0[int(_635)][_637];
    uint _641 = uint(int(uint(_620) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.fp_c3)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.fp_c3)._m0[int(_651)][_653];
    int _657 = _620 + 32;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = _620 + 16;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.fp_c3)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = _620 + 8;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.fp_c3)._m0[int(_697)][_699];
    int _703 = int(_695) + 1;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    int _707 = _703 & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = _620 + 40;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    int _729 = _620 + 56;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    uint _733 = uint(int(uint(int(_731)) >> uint(2)));
    int _735 = int(_731) & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    int _739 = int(_731) + 1;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    int _743 = _739 & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    float _747 = _596 * _639;
    float _749 = fma(_598, _631, _747);
    int _751 = _620 + 24;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.fp_c3)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.fp_c3)._m0[int(_763)][_765];
    float _769 = _596 * _655;
    float _771 = fma(_598, _647, _769);
    float _773 = _596 * _673;
    float _775 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _95);
    float _777 = fma(_598, _665, _773);
    float _779 = rint(_614);
    float _781 = precise::max(_779, 0.0);
    uint _783 = uint(_781);
    uint _785 = clamp(_783, 0u, 65535u);
    float _787 = _596 * _691;
    float _789 = fma(_598, _683, _787);
    float _791 = fma(_594, _701, _771);
    float _793 = fma(_594, _719, _777);
    float _795 = _791 + _709;
    float _797 = _793 + _727;
    float _799 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _93);
    float _801 = fma(_594, _737, _749);
    float _803 = _801 + _745;
    float _805 = fma(_594, _759, _789);
    float2 _2503 = float2(_799, _775);
    float4 _808 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2503, float2(0.0), isnan(_2503)), int2(0), component::x).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float _818 = 1.0 / _803;
    float _820 = _805 + _767;
    float _822 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _824 = _795 * _818;
    float _826 = _820 * _818;
    float _828 = _797 * _818;
    float _830 = precise::clamp(_828, 0.0, 1.0);
    float _832 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _834 = fma(_560, 2.0, -1.0);
    float _836 = fma(_562, 2.0, -1.0);
    float _838 = _834 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _840 = _836 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _842 = fma(_838, 2.0, _93);
    float _844 = fma(_840, 2.0, _95);
    float2 _2568 = float2(_799, _775);
    float4 _846 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2568, float2(0.0), isnan(_2568)), int2(0), component::w).xyzw;
    float _848 = _846.x;
    float _850 = _846.y;
    float _852 = _846.z;
    float _854 = _846.w;
    float2 _2584 = float2(_822, _832);
    float _856 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2584, float2(0.0), isnan(_2584))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2584, float2(0.0), isnan(_2584))).x;
    float3 _2596 = float3(_824, _826, float(int(_785)));
    float3 _2600 = select(_2596, float3(0.0), isnan(_2596));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2600.xy, uint(rint(_2600.z)), _830);
    float2 _2606 = float2(_842, _844);
    float _860 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2606, float2(0.0), isnan(_2606))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2606, float2(0.0), isnan(_2606))).x;
    float2 _2614 = float2(_842, _844);
    float2 _862 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2614, float2(0.0), isnan(_2614))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2614, float2(0.0), isnan(_2614))).yz;
    float _864 = _862.x;
    float _866 = _862.y;
    float2 _2626 = float2(_564, _566);
    float _868 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2626, float2(0.0), isnan(_2626)), level(_568)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2626, float2(0.0), isnan(_2626)), level(_568)).x;
    float _870 = precise::min(_173, -1.0000000116860974230803549289703e-07);
    float _872 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _874 = abs(_173);
    float _876 = log2(_874);
    float _878 = 1.0 / _870;
    float _880 = _95 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _882 = floor(_872);
    float _884 = floor(_880);
    float _886 = _878 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _888 = -_882;
    float _890 = _872 + _888;
    float _892 = -_884;
    float _894 = _880 + _892;
    float _896 = -_810;
    float _898 = fma(_896, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _900 = -_812;
    float _902 = fma(_900, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _904 = -_814;
    float _906 = fma(_904, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _908 = -_816;
    float _910 = fma(_908, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _912 = 1.0 / _902;
    float _914 = 1.0 / _898;
    float _916 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _918 = _894 + _916;
    float _920 = _554 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _922 = -_918;
    float _924 = _922 + 1.0;
    float _926 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].x, _920);
    float _928 = 1.0 / _906;
    float _930 = 1.0 / _910;
    float _932 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _934 = -_173;
    float _936 = fma(_914, _932, _934);
    float _938 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _940 = -_173;
    float _942 = fma(_912, _938, _940);
    float _944 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _946 = _890 + _944;
    float _948 = abs(_936);
    float _950 = _948 * _886;
    float _952 = abs(_942);
    float _954 = _952 * _886;
    float _956 = _946 * _924;
    float _958 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _960 = -_173;
    float _962 = fma(_928, _958, _960);
    float _964 = -_946;
    float _966 = _964 + 1.0;
    float _968 = exp2(_950);
    float _970 = abs(_962);
    float _972 = _970 * _886;
    float _974 = _918 * _966;
    float _976 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _978 = -_173;
    float _980 = fma(_930, _976, _978);
    float _982 = exp2(_954);
    float _984 = abs(_980);
    float _986 = _984 * _886;
    float _988 = _554 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _990 = _876 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _992 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].x, _988);
    float _994 = exp2(_972);
    float _996 = abs(_974);
    float _998 = _996 * _968;
    float _1000 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[101].z, _992);
    float _1002 = _1000 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1004 = _946 * _918;
    float _1006 = exp2(_986);
    float _1008 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[102].z, _926);
    float _1010 = abs(_1004);
    float _1012 = _1010 * _982;
    float _1014 = _966 * _924;
    float _1016 = _998 + _1012;
    float _1018 = exp2(_990);
    float _1020 = abs(_956);
    float _1022 = _1020 * _994;
    float _1024 = _1008 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1026 = trunc(_1002);
    int _1028 = int(_1026);
    float _1030 = abs(_1014);
    float _1032 = _1030 * _1006;
    float _1034 = _1022 + _1016;
    float _1036 = _1032 + _1034;
    float _1038 = -_1032;
    bool _1040 = _1034 != _1038;
    bool _1042 = isnan(_1034);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan(_1038);
    bool _1048 = _1044 || _1046;
    float _1050 = trunc(_1024);
    int _1052 = int(_1050);
    float _1054 = fma(_1018, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = fma(_1056, -2.0, 3.0);
    float _1060 = _1056 * _1056;
    float _1062 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _1064 = 1.0 / _1036;
    int _1066 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1068 = _1028 + _1066;
    int _1070 = _1068 + 1;
    float _1072 = _1060 * _1058;
    float _1074 = precise::max(0.0, _1062);
    bool _1076 = _1070 >= 0;
    float _1078 = -_1072;
    float _1080 = _1078 + 1.0;
    int _1082 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1084 = _1052 + _1082;
    int _1086 = _1084 + 1;
    bool _1088 = _1070 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1090 = !_1076;
    bool _1092 = _1088 || _1090;
    float _1094 = fma(_1080, (*spvDescriptorSet0.fp_c3)._m0[44].w, _1072);
    bool _1096 = _1086 < 0;
    bool _1098 = _1096 || _1092;
    float _1100 = _1094 * _1074;
    float _1102 = _1012 * _1064;
    float _1104 = _998 * _1064;
    bool _1106 = _1086 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1108 = _1106 || _1098;
    float _1110 = _1032 * _1064;
    float _1112 = _1022 * _1064;
    float _1114 = _1048 ? _1102 : 0.25;
    bool _1116 = _173 >= (-8000.0);
    bool _1118 = isnan(_173);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(-8000.0);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = _1048 ? _1104 : 0.25;
    float _1130 = _1126 * _1100;
    float _1132 = _1104;
    if (_1108)
    {
        _1132 = 1.0;
    }
    float _1134 = _1132;
    float _1136 = _1130 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1138 = _1114 * _850;
    float _1140 = -_856;
    float _1142 = _1140 + 1.0;
    float _1144 = fma(_1128, _848, _1138);
    float _1146 = _1048 ? _1112 : 0.25;
    float _1148 = _1134;
    if (!_1108)
    {
        int _1150 = _1086 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1152 = _1150 + _1070;
        float _1154 = floor(_1024);
        int _1156 = _1152 << 2;
        int _1158 = _1152 >> 2;
        int _1160 = 12 & _1156;
        int _1162 = _1158 << 4;
        int _1164 = _1162 + _1160;
        float _1166 = floor(_1002);
        uint _1168 = uint(int(uint(_1164) >> uint(2)));
        uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
        int _1172 = int(_1168) & 3;
        float _1174 = (*spvDescriptorSet0.fp_c5)._m0[int(_1170)][_1172];
        float _1176 = -_1154;
        float _1178 = _1024 + _1176;
        float _1180 = -_1166;
        float _1182 = _1002 + _1180;
        float _1184 = rint(_1174);
        float _1186 = precise::max(_1184, 0.0);
        uint _1188 = uint(_1186);
        uint _1190 = clamp(_1188, 0u, 65535u);
        float3 _3102 = float3(_1182, _1178, float(int(_1190)));
        float3 _3104 = select(_3102, float3(0.0), isnan(_3102));
        float _1192 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3104.xy, uint(rint(_3104.z)), level(0.0)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3104.xy, uint(rint(_3104.z)), level(0.0)).x;
        int _1194 = _1152 << 4;
        int _1196 = _1194 + 1648;
        int _1198 = _1164 + 8048;
        uint _1200 = uint(int(uint(_1198) >> uint(2)));
        uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
        int _1204 = int(_1200) & 3;
        float _1206 = (*spvDescriptorSet0.fp_c5)._m0[int(_1202)][_1204];
        uint _1208 = uint(int(uint(_1196) >> uint(2)));
        uint _1210 = uint(int(uint(int(_1208)) >> uint(2)));
        int _1212 = int(_1208) & 3;
        float _1214 = (*spvDescriptorSet0.fp_c5)._m0[int(_1210)][_1212];
        int _1216 = int(_1208) + 1;
        uint _1218 = uint(int(uint(_1216) >> uint(2)));
        int _1220 = _1216 & 3;
        float _1222 = (*spvDescriptorSet0.fp_c5)._m0[int(_1218)][_1220];
        int _1224 = _1196 + 8;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        uint _1228 = uint(int(uint(int(_1226)) >> uint(2)));
        int _1230 = int(_1226) & 3;
        float _1232 = (*spvDescriptorSet0.fp_c5)._m0[int(_1228)][_1230];
        int _1234 = int(_1226) + 1;
        uint _1236 = uint(int(uint(_1234) >> uint(2)));
        int _1238 = _1234 & 3;
        float _1240 = (*spvDescriptorSet0.fp_c5)._m0[int(_1236)][_1238];
        float _1242 = 1.0 / _1206;
        float _1244 = _554 * _1222;
        float _1246 = fma(_550, _1214, _1244);
        float _1248 = _1206 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1250 = fma(_552, _1232, _1246);
        float _1252 = _1250 + _1240;
        float _1254 = precise::clamp(_1252, 0.0, 1.0);
        float _1256 = -_1254;
        float _1258 = _1256 + _1192;
        float _1260 = fma(_1242, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1258);
        float _1262 = _1248 * _1260;
        float _1264 = exp2(_1262);
        float _1266 = 0.0 + _1264;
        float _1268 = precise::clamp(_1266, 0.0, 1.0);
        _1148 = _1268;
    }
    float _1270 = _1148;
    float _1272 = precise::min(_1270, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1274 = -_173;
    float _1276 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1278 = _1274 + _1276;
    float _1280 = abs(_868);
    float _1282 = _1280 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1284 = fma(_1146, _852, _1144);
    float _1286 = _1048 ? _1110 : 0.25;
    float _1288 = _1278 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1290 = precise::clamp(_1288, 0.0, 1.0);
    float _1292 = -_1272;
    float _1294 = _1292 + 1.0;
    float _1296 = _1142 * _1136;
    float _1298 = precise::clamp(_1296, 0.0, 1.0);
    float _1300 = -_1282;
    float _1302 = fma(_1126, _1300, 1.0);
    float _1304 = -_173;
    float _1306 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1308 = _1304 + _1306;
    float _1310 = fma(_1290, _1294, _1272);
    float _1312 = -_1298;
    float _1314 = fma(_1312, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1316 = fma(_1286, _854, _1284);
    float _1318 = precise::min(_1302, 1.0);
    float _1320 = _1308 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1322 = precise::clamp(_1320, 0.0, 1.0);
    float _1324 = -_858;
    float _1326 = _1324 + 1.0;
    float _1328 = precise::min(_1318, _1314);
    float _1330 = fma(_1322, _1326, _858);
    float _1332 = precise::min(_1316, 1.0);
    out.m_68.x = _1330;
    out.m_68.y = _1310;
    out.m_68.z = _1332;
    out.m_68.w = _1328;
    out.m_70.x = _860;
    out.m_70.y = _864;
    out.m_70.z = _866;
    out.m_70.w = 1.0;
    return out;
}

