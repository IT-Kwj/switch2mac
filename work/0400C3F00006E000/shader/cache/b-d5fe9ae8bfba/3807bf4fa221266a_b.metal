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
    float2 _1376 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1376, float2(0.0), isnan(_1376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1376, float2(0.0), isnan(_1376))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1391 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1391, float2(0.0), isnan(_1391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1391, float2(0.0), isnan(_1391))).x;
    float2 _1399 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1399, float2(0.0), isnan(_1399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1399, float2(0.0), isnan(_1399))).x;
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
    float _159 = -_101;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _163 = -_103;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _167 = 1.0 / _161;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = _157 * _169;
    float _173 = 1.0 / _165;
    float _175 = _171 * _141;
    float _177 = _171 * _143;
    float _179 = _175 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = _167 * _181;
    float _185 = _175 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _187 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[32].x, _179);
    float _189 = -_177;
    float _191 = fma(_183, _145, _189);
    float _193 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[30].x, _185);
    float _195 = -_175;
    float _197 = fma(_183, _147, _195);
    float _199 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[32].z, _187);
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _203 = _173 * _201;
    float _205 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[30].z, _193);
    float _207 = -_171;
    float _209 = _207 + _183;
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _213 = -_175;
    float _215 = fma(_203, _151, _213);
    float _217 = -_177;
    float _219 = fma(_203, _149, _217);
    float _221 = _205 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _225 = _211 + _223;
    float _227 = -_171;
    float _229 = _227 + _203;
    float _231 = _209 * _219;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _235 = _221 + _233;
    float _237 = _225 * _225;
    float _239 = _197 * _229;
    float _241 = -_231;
    float _243 = fma(_191, _229, _241);
    float _245 = _191 * _215;
    float _247 = fma(_235, _235, _237);
    float _249 = -_239;
    float _251 = fma(_209, _215, _249);
    float _253 = _243 * _243;
    float _255 = -_245;
    float _257 = fma(_197, _219, _255);
    float _259 = sqrt(_247);
    float _261 = fma(_251, _251, _253);
    float _263 = fma(_257, _257, _261);
    float _265 = _175 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _267 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[31].x, _265);
    float _269 = rsqrt(_263);
    float _271 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].z, _267);
    bool _275 = _259 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _277 = _271 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _279 = _257 * _269;
    float _281 = _251 * _269;
    float _283 = _243 * _269;
    float _285 = _265;
    float _287 = _257;
    float _289 = _211;
    if (!_275)
    {
        _285 = _221;
    }
    float _291 = _285;
    float _293 = _291;
    if (!_275)
    {
        _287 = _277;
    }
    float _295 = _287;
    bool _297 = !_275;
    float _299 = _295;
    if (!_297)
    {
        float _301 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _303 = _259 + _301;
        float _305 = _277 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _307 = rsqrt(_247);
        float _309 = -_277;
        float _311 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _313 = _309 + _311;
        float _315 = abs(_305);
        float _317 = abs(_303);
        float _319 = precise::max(_315, _317);
        float _321 = _313 * _313;
        bool _323 = _319 >= 16.0;
        float _325 = _235 * _307;
        float _327 = _225 * _307;
        float _329 = -_235;
        float _331 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[41].z, _329);
        float _333 = -_225;
        float _335 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[41].z, _333);
        float _337 = _303;
        float _339 = _305;
        int _342 = as_type<int>(_335);
        if (_323)
        {
            float _344 = _303 * 0.0625;
            _337 = _344;
        }
        float _346 = _337;
        if (_323)
        {
            float _348 = _305 * 0.0625;
            _339 = _348;
        }
        float _350 = _339;
        float _352 = fma(_331, _331, _321);
        float _354 = abs(_346);
        bool _356 = _354 != 0.0;
        bool _358 = isnan(_354);
        bool _360 = _356 || _358;
        bool _362 = isnan(0.0);
        bool _364 = _360 || _362;
        float _366 = fma(_335, _335, _352);
        float _368 = abs(_350);
        bool _370 = _368 == 0.0;
        float _372 = abs(_350);
        bool _374 = _372 == 0.0;
        bool _376 = !_364;
        bool _378 = _374 && _376;
        float _380 = sqrt(_366);
        bool _382 = false;
        if (_378)
        {
            bool _384 = as_type<int>(_350) >= 0;
            _382 = _384;
        }
        bool _386 = _382;
        int _388 = _386 ? (-1) : 0;
        if (_378)
        {
            int _390 = _386 ? 0 : 1078530011;
            _342 = _390;
        }
        int _392 = _342;
        int _394 = _392;
        if (_378)
        {
            int _396 = int(0x80000000) & as_type<int>(_346);
            int _398 = _392 | _396;
            _394 = _398;
        }
        int _400 = _394;
        bool _402 = !_364;
        bool _404 = _402 && _370;
        int _406 = _400;
        float _408 = as_type<float>(_400);
        if (!_404)
        {
            float _410 = abs(_346);
            bool _412 = _410 != as_type<float>(0x7f800000u /* inf */);
            bool _414 = isnan(_410);
            bool _416 = _412 || _414;
            bool _418 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _420 = _416 || _418;
            float _422 = abs(_350);
            bool _424 = _422 == as_type<float>(0x7f800000u /* inf */);
            float _426 = abs(_350);
            bool _428 = _426 == as_type<float>(0x7f800000u /* inf */);
            bool _430 = !_420;
            bool _432 = _428 && _430;
            if (_432)
            {
                bool _434 = as_type<int>(_350) >= 0;
                _388 = _434 ? (-1) : 0;
            }
            int _436 = _388;
            if (_432)
            {
                _406 = 1075235812;
            }
            int _438 = _406;
            int _440 = _438;
            if (_432)
            {
                int _442 = ~_436;
                int _444 = (_442 != 0) ? _438 : 1061752795;
                _440 = _444;
            }
            int _446 = _440;
            float _448 = as_type<float>(_446);
            if (_432)
            {
                int _450 = int(0x80000000) & as_type<int>(_346);
                int _452 = _446 | _450;
                _448 = as_type<float>(_452);
            }
            float _454 = _448;
            bool _456 = !_420;
            bool _458 = _456 && _424;
            _408 = _454;
            if (!_458)
            {
                float _460 = abs(_346);
                float _462 = abs(_350);
                float _464 = precise::max(_460, _462);
                float _466 = abs(_346);
                float _468 = abs(_350);
                float _470 = precise::min(_466, _468);
                float _472 = 1.0 / _464;
                float _474 = abs(_346);
                float _476 = abs(_350);
                bool _478 = _474 > _476;
                bool _480 = as_type<int>(_350) >= 0;
                float _482 = abs(_346);
                float _484 = abs(_350);
                float _486 = _482 + _484;
                int _488 = as_type<int>(_346) & int(0x80000000);
                bool _490 = _486 > as_type<float>(0x7f800000u /* inf */);
                bool _492 = isnan(_486);
                bool _494 = _490 || _492;
                bool _496 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _498 = _494 || _496;
                float _500 = _470 * _472;
                float _502 = _500 * _500;
                float _504 = _502 + 11.33538818359375;
                float _506 = fma(_502, _504, 28.84246826171875);
                float _508 = fma(_502, _506, 19.6966705322265625);
                float _510 = fma(_502, -0.82336294651031494140625, -5.674867153167724609375);
                float _512 = fma(_502, _510, -6.565555095672607421875);
                float _514 = 1.0 / _508;
                float _516 = _502 * _512;
                float _518 = _500 * _516;
                float _520 = fma(_518, _514, _500);
                float _522 = _520;
                _408 = _486;
                if (_478)
                {
                    float _524 = -_520;
                    float _526 = _524 + 1.57079637050628662109375;
                    _522 = _526;
                }
                float _528 = _522;
                int _530 = as_type<int>(_528);
                if (!_480)
                {
                    float _532 = -_528;
                    float _534 = _532 + 3.1415927410125732421875;
                    _530 = as_type<int>(_534);
                }
                int _536 = _530;
                if (!_498)
                {
                    int _538 = _488 | _536;
                    _408 = as_type<float>(_538);
                }
            }
        }
        float _540 = _408;
        float _542 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _544 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _546 = _380 + _544;
        float _548 = fma(_325, _542, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _550 = fma(_327, _542, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _293 = _548;
        _289 = _550;
        _299 = _546;
    }
    float _552 = _293;
    float _554 = _289;
    float _556 = _299;
    float2 _2087 = float2(_91, _93);
    float2 _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2087, float2(0.0), isnan(_2087))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2087, float2(0.0), isnan(_2087))).xy;
    float _562 = _560.x;
    float _564 = _560.y;
    float _566 = fma(_552, 6.2500002968590706586837768554688e-05, 0.5);
    float _568 = fma(_554, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2105 = float2(_566, _568);
    float _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2105, float2(0.0), isnan(_2105))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2105, float2(0.0), isnan(_2105))).x;
    float _572 = _283 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _574 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[35].x, _572);
    float _576 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _574);
    float _578 = -_576;
    float _580 = fma(_578, _576, 1.0);
    float _582 = -_576;
    float _584 = fma(_582, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _586 = -_576;
    float _588 = fma(_586, (*spvDescriptorSet0.fp_c3)._m0[35].y, _283);
    float _590 = -_576;
    float _592 = fma(_590, (*spvDescriptorSet0.fp_c3)._m0[35].x, _281);
    float _594 = _580 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _596 = fma(_584, _594, _171);
    float _598 = fma(_588, _594, _175);
    float _600 = fma(_592, _594, _177);
    float _602 = -_596;
    bool _604 = _602 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _606 = float(_604);
    float _608 = -_596;
    bool _610 = _608 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _612 = float(_610);
    float _614 = _606 + _612;
    float _616 = precise::min(_614, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _618 = trunc(_616);
    int _620 = int(_618);
    int _622 = _620 << 6;
    int _624 = _622 + 48;
    uint _627 = uint(int(uint(_624) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.fp_c3)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.fp_c3)._m0[int(_637)][_639];
    int _643 = _622 + 56;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    uint _647 = uint(int(uint(int(_645)) >> uint(2)));
    int _649 = int(_645) & 3;
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[int(_647)][_649];
    int _653 = int(_645) + 1;
    uint _655 = uint(int(uint(_653) >> uint(2)));
    int _657 = _653 & 3;
    float _659 = (*spvDescriptorSet0.fp_c3)._m0[int(_655)][_657];
    int _661 = _622 + 16;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[int(_673)][_675];
    int _679 = _622 + 32;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    uint _683 = uint(int(uint(int(_681)) >> uint(2)));
    int _685 = int(_681) & 3;
    float _687 = (*spvDescriptorSet0.fp_c3)._m0[int(_683)][_685];
    int _689 = int(_681) + 1;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    int _693 = _689 & 3;
    float _695 = (*spvDescriptorSet0.fp_c3)._m0[int(_691)][_693];
    int _697 = _622 + 24;
    uint _699 = uint(int(uint(_697) >> uint(2)));
    uint _701 = uint(int(uint(int(_699)) >> uint(2)));
    int _703 = int(_699) & 3;
    float _705 = (*spvDescriptorSet0.fp_c3)._m0[int(_701)][_703];
    int _707 = int(_699) + 1;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    int _711 = _707 & 3;
    float _713 = (*spvDescriptorSet0.fp_c3)._m0[int(_709)][_711];
    int _715 = _622 + 40;
    uint _717 = uint(int(uint(_715) >> uint(2)));
    uint _719 = uint(int(uint(int(_717)) >> uint(2)));
    int _721 = int(_717) & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    int _725 = int(_717) + 1;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    int _729 = _725 & 3;
    float _731 = (*spvDescriptorSet0.fp_c3)._m0[int(_727)][_729];
    uint _733 = uint(int(uint(_622) >> uint(2)));
    uint _735 = uint(int(uint(int(_733)) >> uint(2)));
    int _737 = int(_733) & 3;
    float _739 = (*spvDescriptorSet0.fp_c3)._m0[int(_735)][_737];
    int _741 = int(_733) + 1;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    int _745 = _741 & 3;
    float _747 = (*spvDescriptorSet0.fp_c3)._m0[int(_743)][_745];
    float _749 = _598 * _641;
    float _751 = fma(_600, _633, _749);
    int _753 = _622 + 8;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    uint _757 = uint(int(uint(int(_755)) >> uint(2)));
    int _759 = int(_755) & 3;
    float _761 = (*spvDescriptorSet0.fp_c3)._m0[int(_757)][_759];
    int _763 = int(_755) + 1;
    uint _765 = uint(int(uint(_763) >> uint(2)));
    int _767 = _763 & 3;
    float _769 = (*spvDescriptorSet0.fp_c3)._m0[int(_765)][_767];
    float _771 = fma(_596, _651, _751);
    float _773 = _771 + _659;
    float _775 = _598 * _677;
    float _777 = 1.0 / _773;
    float _779 = fma(_600, _669, _775);
    float _781 = _598 * _695;
    float _783 = fma(_600, _687, _781);
    float _785 = fma(_596, _705, _779);
    float _787 = _785 + _713;
    float _789 = fma(_596, _723, _783);
    float _791 = _787 * _777;
    float _793 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _795 = _789 + _731;
    float _797 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _799 = _598 * _747;
    float _801 = _795 * _777;
    float _803 = precise::clamp(_801, 0.0, 1.0);
    float _805 = fma(_600, _739, _799);
    float2 _2512 = float2(_793, _797);
    float4 _808 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2512, float2(0.0), isnan(_2512)), int2(0), component::x).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float _818 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _820 = fma(_596, _761, _805);
    float _822 = rint(_616);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    uint _828 = clamp(_826, 0u, 65535u);
    float _830 = _820 + _769;
    float _832 = _830 * _777;
    float _834 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _836 = fma(_562, 2.0, -1.0);
    float _838 = fma(_564, 2.0, -1.0);
    float _840 = _836 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _842 = _838 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _844 = fma(_840, 2.0, _91);
    float _846 = fma(_842, 2.0, _93);
    float2 _2581 = float2(_793, _797);
    float4 _848 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2581, float2(0.0), isnan(_2581)), int2(0), component::w).xyzw;
    float _850 = _848.x;
    float _852 = _848.y;
    float _854 = _848.z;
    float _856 = _848.w;
    float2 _2597 = float2(_834, _818);
    float _858 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2597, float2(0.0), isnan(_2597))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2597, float2(0.0), isnan(_2597))).x;
    float3 _2608 = float3(_832, _791, float(int(_828)));
    float3 _2612 = select(_2608, float3(0.0), isnan(_2608));
    float _860 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2612.xy, uint(rint(_2612.z)), _803);
    float2 _2618 = float2(_844, _846);
    float3 _864 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2618, float2(0.0), isnan(_2618))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2618, float2(0.0), isnan(_2618))).xyz;
    float _866 = _864.x;
    float _868 = _864.y;
    float _870 = _864.z;
    float2 _2632 = float2(_566, _568);
    float _872 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2632, float2(0.0), isnan(_2632)), level(_570)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2632, float2(0.0), isnan(_2632)), level(_570)).x;
    float _874 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _876 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _878 = abs(_171);
    float _880 = log2(_878);
    float _882 = precise::min(_171, -1.0000000116860974230803549289703e-07);
    float _884 = floor(_874);
    float _886 = floor(_876);
    float _888 = _880 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _890 = -_884;
    float _892 = _874 + _890;
    float _894 = 1.0 / _882;
    float _896 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _898 = _892 + _896;
    float _900 = -_886;
    float _902 = _876 + _900;
    float _904 = -_898;
    float _906 = _904 + 1.0;
    float _908 = exp2(_888);
    float _910 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _912 = _902 + _910;
    float _914 = -_912;
    float _916 = _914 + 1.0;
    float _918 = _898 * _912;
    float _920 = _912 * _906;
    float _922 = _894 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _924 = _906 * _916;
    float _926 = _898 * _916;
    float _928 = fma(_908, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float _932 = fma(_930, -2.0, 3.0);
    float _934 = _930 * _930;
    float _936 = _934 * _932;
    float _938 = -_936;
    float _940 = _938 + 1.0;
    float _942 = -_810;
    float _944 = fma(_942, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _946 = -_812;
    float _948 = fma(_946, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _950 = -_814;
    float _952 = fma(_950, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _954 = -_816;
    float _956 = fma(_954, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _958 = 1.0 / _948;
    float _960 = 1.0 / _944;
    float _962 = 1.0 / _952;
    float _964 = 1.0 / _956;
    float _966 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _968 = -_171;
    float _970 = fma(_960, _966, _968);
    float _972 = abs(_970);
    float _974 = _972 * _922;
    float _976 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _978 = -_171;
    float _980 = fma(_958, _976, _978);
    float _982 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _984 = abs(_980);
    float _986 = _984 * _922;
    float _988 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _990 = -_171;
    float _992 = fma(_962, _988, _990);
    float _994 = exp2(_974);
    float _996 = precise::max(0.0, _982);
    float _998 = fma(_940, (*spvDescriptorSet0.fp_c3)._m0[44].w, _936);
    float _1000 = abs(_992);
    float _1002 = _1000 * _922;
    float _1004 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1006 = -_171;
    float _1008 = fma(_964, _1004, _1006);
    float _1010 = _556 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1012 = _556 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1014 = _998 * _996;
    float _1016 = exp2(_986);
    float _1018 = abs(_1008);
    float _1020 = _1018 * _922;
    float _1022 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1010);
    float _1024 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1012);
    float _1026 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1022);
    float _1028 = exp2(_1002);
    float _1030 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1024);
    float _1032 = _1026 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1034 = abs(_920);
    float _1036 = _1034 * _994;
    float _1038 = _1030 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1040 = exp2(_1020);
    float _1042 = abs(_918);
    float _1044 = _1042 * _1016;
    float _1046 = _1036 + _1044;
    float _1048 = trunc(_1032);
    int _1050 = int(_1048);
    float _1052 = abs(_926);
    float _1054 = _1052 * _1028;
    float _1056 = _1054 + _1046;
    float _1058 = trunc(_1038);
    int _1060 = int(_1058);
    float _1062 = abs(_924);
    float _1064 = _1062 * _1040;
    float _1066 = _1064 + _1056;
    float _1068 = -_1064;
    bool _1070 = _1056 != _1068;
    bool _1072 = isnan(_1056);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(_1068);
    bool _1078 = _1074 || _1076;
    int _1080 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1082 = _1050 + _1080;
    int _1084 = _1082 + 1;
    float _1086 = 1.0 / _1066;
    bool _1088 = _1084 >= 0;
    int _1090 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1092 = _1060 + _1090;
    int _1094 = _1092 + 1;
    bool _1096 = _1084 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1098 = !_1088;
    bool _1100 = _1096 || _1098;
    bool _1102 = _171 >= (-8000.0);
    bool _1104 = isnan(_171);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(-8000.0);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    bool _1114 = _1094 < 0;
    bool _1116 = _1114 || _1100;
    float _1118 = _1112 * _1014;
    bool _1120 = _1094 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1122 = _1120 || _1116;
    float _1124 = _1044 * _1086;
    float _1126 = _1036 * _1086;
    float _1128 = _1054 * _1086;
    float _1130 = _1078 ? _1124 : 0.25;
    float _1132 = _1078 ? _1126 : 0.25;
    float _1134 = _1014;
    if (_1122)
    {
        _1134 = 1.0;
    }
    float _1136 = _1134;
    float _1138 = _1130 * _852;
    float _1140 = _1136;
    if (!_1122)
    {
        int _1142 = _1094 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1144 = _1142 + _1084;
        float _1146 = floor(_1038);
        int _1148 = _1144 << 2;
        int _1150 = _1144 >> 2;
        int _1152 = 12 & _1148;
        int _1154 = _1150 << 4;
        int _1156 = _1154 + _1152;
        float _1158 = floor(_1032);
        uint _1160 = uint(int(uint(_1156) >> uint(2)));
        uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
        int _1164 = int(_1160) & 3;
        float _1166 = (*spvDescriptorSet0.fp_c5)._m0[int(_1162)][_1164];
        float _1168 = -_1146;
        float _1170 = _1038 + _1168;
        float _1172 = -_1158;
        float _1174 = _1032 + _1172;
        float _1176 = rint(_1166);
        float _1178 = precise::max(_1176, 0.0);
        uint _1180 = uint(_1178);
        uint _1182 = clamp(_1180, 0u, 65535u);
        float3 _3090 = float3(_1174, _1170, float(int(_1182)));
        float3 _3092 = select(_3090, float3(0.0), isnan(_3090));
        float _1184 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3092.xy, uint(rint(_3092.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3092.xy, uint(rint(_3092.z)), level(0.0)).x;
        int _1186 = _1144 << 4;
        int _1188 = _1186 + 1648;
        int _1190 = _1156 + 8048;
        uint _1192 = uint(int(uint(_1190) >> uint(2)));
        uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
        int _1196 = int(_1192) & 3;
        float _1198 = (*spvDescriptorSet0.fp_c5)._m0[int(_1194)][_1196];
        uint _1200 = uint(int(uint(_1188) >> uint(2)));
        uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
        int _1204 = int(_1200) & 3;
        float _1206 = (*spvDescriptorSet0.fp_c5)._m0[int(_1202)][_1204];
        int _1208 = int(_1200) + 1;
        uint _1210 = uint(int(uint(_1208) >> uint(2)));
        int _1212 = _1208 & 3;
        float _1214 = (*spvDescriptorSet0.fp_c5)._m0[int(_1210)][_1212];
        int _1216 = _1188 + 8;
        uint _1218 = uint(int(uint(_1216) >> uint(2)));
        uint _1220 = uint(int(uint(int(_1218)) >> uint(2)));
        int _1222 = int(_1218) & 3;
        float _1224 = (*spvDescriptorSet0.fp_c5)._m0[int(_1220)][_1222];
        int _1226 = int(_1218) + 1;
        uint _1228 = uint(int(uint(_1226) >> uint(2)));
        int _1230 = _1226 & 3;
        float _1232 = (*spvDescriptorSet0.fp_c5)._m0[int(_1228)][_1230];
        float _1234 = _556 * _1214;
        float _1236 = 1.0 / _1198;
        float _1238 = fma(_552, _1206, _1234);
        float _1240 = _1198 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1242 = fma(_554, _1224, _1238);
        float _1244 = _1242 + _1232;
        float _1246 = precise::clamp(_1244, 0.0, 1.0);
        float _1248 = -_1246;
        float _1250 = _1248 + _1184;
        float _1252 = fma(_1236, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1250);
        float _1254 = _1240 * _1252;
        float _1256 = exp2(_1254);
        float _1258 = 0.0 + _1256;
        float _1260 = precise::clamp(_1258, 0.0, 1.0);
        _1140 = _1260;
    }
    float _1262 = _1140;
    float _1264 = _1118 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1266 = -_858;
    float _1268 = _1266 + 1.0;
    float _1270 = _1064 * _1086;
    float _1272 = -_171;
    float _1274 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1276 = _1272 + _1274;
    float _1278 = precise::min(_1262, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1280 = _1268 * _1264;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = _1078 ? _1128 : 0.25;
    float _1286 = fma(_1132, _850, _1138);
    float _1288 = abs(_872);
    float _1290 = _1288 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1292 = -_1282;
    float _1294 = fma(_1292, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1296 = _1276 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1298 = precise::clamp(_1296, 0.0, 1.0);
    float _1300 = -_1278;
    float _1302 = _1300 + 1.0;
    float _1304 = _1078 ? _1270 : 0.25;
    float _1306 = fma(_1284, _854, _1286);
    float _1308 = -_1290;
    float _1310 = fma(_1112, _1308, 1.0);
    float _1312 = -_171;
    float _1314 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1316 = _1312 + _1314;
    float _1318 = fma(_1298, _1302, _1278);
    float _1320 = -_860;
    float _1322 = _1320 + 1.0;
    float _1324 = fma(_1304, _856, _1306);
    float _1326 = _1316 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1328 = precise::clamp(_1326, 0.0, 1.0);
    float _1330 = precise::min(_1310, 1.0);
    float _1332 = fma(_1328, _1322, _860);
    float _1334 = precise::min(_1330, _1294);
    float _1336 = precise::min(_866, 1.0);
    float _1338 = precise::min(_1324, 1.0);
    out.m_66.x = _1332;
    out.m_66.y = _1318;
    out.m_66.z = _1338;
    out.m_66.w = _1334;
    out.m_68.x = _1336;
    out.m_68.y = _868;
    out.m_68.z = _870;
    out.m_68.w = 1.0;
    return out;
}

