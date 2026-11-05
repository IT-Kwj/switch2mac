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
    float2 _1350 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1350, float2(0.0), isnan(_1350))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1350, float2(0.0), isnan(_1350))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1365 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1365, float2(0.0), isnan(_1365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1365, float2(0.0), isnan(_1365))).x;
    float2 _1373 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1373, float2(0.0), isnan(_1373))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1373, float2(0.0), isnan(_1373))).x;
    float _105 = in.m_59.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_59.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_61.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_61.x;
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
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = _157 * _141;
    float _161 = _157 * _143;
    float _163 = _159 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _165 = _159 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _167 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[32].x, _163);
    float _169 = -_101;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _173 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[41].x, _171);
    float _175 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[30].x, _165);
    float _177 = -_103;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[41].x, _179);
    float _183 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].z, _167);
    float _185 = -_161;
    float _187 = fma(_173, _147, _185);
    float _189 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].z, _175);
    float _191 = -_159;
    float _193 = fma(_173, _145, _191);
    float _195 = _183 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _197 = -_157;
    float _199 = _197 + _173;
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _203 = -_161;
    float _205 = fma(_181, _149, _203);
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _209 = _195 + _207;
    float _211 = -_159;
    float _213 = fma(_181, _151, _211);
    float _215 = -_157;
    float _217 = _215 + _181;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _221 = _201 + _219;
    float _223 = _209 * _209;
    float _225 = _199 * _205;
    float _227 = _193 * _217;
    float _229 = fma(_221, _221, _223);
    float _231 = -_225;
    float _233 = fma(_187, _217, _231);
    float _235 = _187 * _213;
    float _237 = -_227;
    float _239 = fma(_199, _213, _237);
    float _241 = sqrt(_229);
    float _243 = _233 * _233;
    float _245 = -_235;
    float _247 = fma(_193, _205, _245);
    float _249 = fma(_239, _239, _243);
    float _251 = fma(_247, _247, _249);
    float _253 = _159 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _255 = rsqrt(_251);
    float _257 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[31].x, _253);
    bool _261 = _241 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _263 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].z, _257);
    float _265 = _263 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _267 = _239 * _255;
    float _269 = _233 * _255;
    float _271 = _247 * _255;
    bool _273 = !_261;
    float _275 = _201;
    float _277 = _195;
    float _279 = _265;
    if (!_273)
    {
        float _281 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _283 = _241 + _281;
        float _285 = _265 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _287 = rsqrt(_229);
        float _289 = -_265;
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = _289 + _291;
        float _295 = abs(_285);
        float _297 = abs(_283);
        float _299 = precise::max(_295, _297);
        float _301 = _293 * _293;
        bool _303 = _299 >= 16.0;
        float _305 = _221 * _287;
        float _307 = _209 * _287;
        float _309 = -_221;
        float _311 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _309);
        float _313 = -_209;
        float _315 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = _283;
        float _319 = _285;
        int _322 = as_type<int>(_315);
        if (_303)
        {
            float _324 = _283 * 0.0625;
            _317 = _324;
        }
        float _326 = _317;
        if (_303)
        {
            float _328 = _285 * 0.0625;
            _319 = _328;
        }
        float _330 = _319;
        float _332 = fma(_311, _311, _301);
        float _334 = abs(_326);
        bool _336 = _334 != 0.0;
        bool _338 = isnan(_334);
        bool _340 = _336 || _338;
        bool _342 = isnan(0.0);
        bool _344 = _340 || _342;
        float _346 = fma(_315, _315, _332);
        float _348 = abs(_330);
        bool _350 = _348 == 0.0;
        float _352 = abs(_330);
        bool _354 = _352 == 0.0;
        bool _356 = !_344;
        bool _358 = _354 && _356;
        float _360 = sqrt(_346);
        bool _362 = false;
        if (_358)
        {
            bool _364 = as_type<int>(_330) >= 0;
            _362 = _364;
        }
        bool _366 = _362;
        int _368 = _366 ? (-1) : 0;
        if (_358)
        {
            int _370 = _366 ? 0 : 1078530011;
            _322 = _370;
        }
        int _372 = _322;
        int _374 = _372;
        if (_358)
        {
            int _376 = int(0x80000000) & as_type<int>(_326);
            int _378 = _372 | _376;
            _374 = _378;
        }
        int _380 = _374;
        bool _382 = !_344;
        bool _384 = _382 && _350;
        int _386 = _380;
        float _388 = as_type<float>(_380);
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
                _368 = _414 ? (-1) : 0;
            }
            int _416 = _368;
            if (_412)
            {
                _386 = 1075235812;
            }
            int _418 = _386;
            int _420 = _418;
            if (_412)
            {
                int _422 = ~_416;
                int _424 = (_422 != 0) ? _418 : 1061752795;
                _420 = _424;
            }
            int _426 = _420;
            float _428 = as_type<float>(_426);
            if (_412)
            {
                int _430 = int(0x80000000) & as_type<int>(_326);
                int _432 = _426 | _430;
                _428 = as_type<float>(_432);
            }
            float _434 = _428;
            bool _436 = !_400;
            bool _438 = _436 && _404;
            _388 = _434;
            if (!_438)
            {
                float _440 = abs(_326);
                float _442 = abs(_330);
                float _444 = precise::max(_440, _442);
                float _446 = abs(_326);
                float _448 = abs(_330);
                float _450 = precise::min(_446, _448);
                float _452 = 1.0 / _444;
                float _454 = abs(_326);
                float _456 = abs(_330);
                bool _458 = _454 > _456;
                bool _460 = as_type<int>(_330) >= 0;
                float _462 = _450 * _452;
                float _464 = abs(_326);
                float _466 = abs(_330);
                float _468 = _464 + _466;
                int _470 = as_type<int>(_326) & int(0x80000000);
                float _472 = _462 * _462;
                bool _474 = _468 > as_type<float>(0x7f800000u /* inf */);
                bool _476 = isnan(_468);
                bool _478 = _474 || _476;
                bool _480 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _482 = _478 || _480;
                float _484 = _472 + 11.33538818359375;
                float _486 = fma(_472, _484, 28.84246826171875);
                float _488 = fma(_472, _486, 19.6966705322265625);
                float _490 = fma(_472, -0.82336294651031494140625, -5.674867153167724609375);
                float _492 = fma(_472, _490, -6.565555095672607421875);
                float _494 = 1.0 / _488;
                float _496 = _472 * _492;
                float _498 = _462 * _496;
                float _500 = fma(_498, _494, _462);
                float _502 = _500;
                _388 = _468;
                if (_458)
                {
                    float _504 = -_500;
                    float _506 = _504 + 1.57079637050628662109375;
                    _502 = _506;
                }
                float _508 = _502;
                int _510 = as_type<int>(_508);
                if (!_460)
                {
                    float _512 = -_508;
                    float _514 = _512 + 3.1415927410125732421875;
                    _510 = as_type<int>(_514);
                }
                int _516 = _510;
                if (!_482)
                {
                    int _518 = _470 | _516;
                    _388 = as_type<float>(_518);
                }
            }
        }
        float _520 = _388;
        float _522 = fma(_520, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _524 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _526 = _360 + _524;
        float _528 = fma(_305, _522, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _530 = fma(_307, _522, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _275 = _528;
        _277 = _530;
        _279 = _526;
    }
    float _532 = _275;
    float _534 = _277;
    float _536 = _279;
    float2 _2035 = float2(_91, _93);
    float2 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2035, float2(0.0), isnan(_2035))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2035, float2(0.0), isnan(_2035))).xy;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = fma(_532, 6.2500002968590706586837768554688e-05, 0.5);
    float _548 = fma(_534, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2053 = float2(_546, _548);
    float _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2053, float2(0.0), isnan(_2053))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2053, float2(0.0), isnan(_2053))).x;
    float _552 = _269 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _554 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].x, _552);
    float _556 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].z, _554);
    float _558 = -_556;
    float _560 = fma(_558, _556, 1.0);
    float _562 = -_556;
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].z, _271);
    float _566 = -_556;
    float _568 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[35].x, _267);
    float _570 = -_556;
    float _572 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[35].y, _269);
    float _574 = _560 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _576 = fma(_564, _574, _157);
    float _578 = fma(_572, _574, _159);
    float _580 = fma(_568, _574, _161);
    float _582 = -_576;
    bool _584 = _582 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _586 = float(_584);
    float _588 = -_576;
    bool _590 = _588 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _592 = float(_590);
    float _594 = _586 + _592;
    float _596 = precise::min(_594, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _598 = trunc(_596);
    int _600 = int(_598);
    float _602 = rint(_596);
    float _604 = precise::max(_602, 0.0);
    uint _607 = uint(_604);
    uint _609 = clamp(_607, 0u, 65535u);
    int _611 = _600 << 6;
    int _613 = _611 + 48;
    uint _615 = uint(int(uint(_613) >> uint(2)));
    uint _617 = uint(int(uint(int(_615)) >> uint(2)));
    int _619 = int(_615) & 3;
    float _621 = (*spvDescriptorSet0.fp_c3)._m0[int(_617)][_619];
    int _623 = int(_615) + 1;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    int _627 = _623 & 3;
    float _629 = (*spvDescriptorSet0.fp_c3)._m0[int(_625)][_627];
    int _631 = _611 + 56;
    uint _633 = uint(int(uint(_631) >> uint(2)));
    uint _635 = uint(int(uint(int(_633)) >> uint(2)));
    int _637 = int(_633) & 3;
    float _639 = (*spvDescriptorSet0.fp_c3)._m0[int(_635)][_637];
    int _641 = int(_633) + 1;
    uint _643 = uint(int(uint(_641) >> uint(2)));
    int _645 = _641 & 3;
    float _647 = (*spvDescriptorSet0.fp_c3)._m0[int(_643)][_645];
    int _649 = _611 + 16;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.fp_c3)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    uint _667 = uint(int(uint(_611) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = int(_667) + 1;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    int _679 = _675 & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = _611 + 24;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = _611 + 32;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    uint _705 = uint(int(uint(int(_703)) >> uint(2)));
    int _707 = int(_703) & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = int(_703) + 1;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    int _715 = _711 & 3;
    float _717 = (*spvDescriptorSet0.fp_c3)._m0[int(_713)][_715];
    int _719 = _611 + 8;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.fp_c3)._m0[int(_731)][_733];
    float _737 = _578 * _629;
    float _739 = fma(_580, _621, _737);
    int _741 = _611 + 40;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    uint _745 = uint(int(uint(int(_743)) >> uint(2)));
    int _747 = int(_743) & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    int _751 = int(_743) + 1;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    int _755 = _751 & 3;
    float _757 = (*spvDescriptorSet0.fp_c3)._m0[int(_753)][_755];
    float _759 = fma(_576, _639, _739);
    float _761 = fma(_534, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _763 = _759 + _647;
    float _765 = _578 * _665;
    float _767 = 1.0 / _763;
    float _769 = fma(_580, _657, _765);
    float _771 = _578 * _681;
    float _773 = fma(_580, _673, _771);
    float _775 = fma(_576, _691, _769);
    float _777 = _775 + _699;
    float _779 = _578 * _717;
    float _781 = fma(_580, _709, _779);
    float _783 = fma(_576, _727, _773);
    float _785 = _777 * _767;
    float _787 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _789 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _791 = _783 + _735;
    float _793 = fma(_576, _749, _781);
    float _795 = _791 * _767;
    float2 _2479 = float2(_787, _789);
    float4 _798 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2479, float2(0.0), isnan(_2479)), int2(0), component::x).xyzw;
    float _800 = _798.x;
    float _802 = _798.y;
    float _804 = _798.z;
    float _806 = _798.w;
    float2 _2495 = float2(_787, _789);
    float4 _808 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2495, float2(0.0), isnan(_2495)), int2(0), component::w).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float _818 = _793 + _757;
    float _820 = _818 * _767;
    float _822 = precise::clamp(_820, 0.0, 1.0);
    float _824 = fma(_532, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _826 = fma(_542, 2.0, -1.0);
    float _828 = fma(_544, 2.0, -1.0);
    float _830 = _826 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _832 = _828 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _834 = fma(_830, 2.0, _91);
    float _836 = fma(_832, 2.0, _93);
    float2 _2545 = float2(_824, _761);
    float _838 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2545, float2(0.0), isnan(_2545))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2545, float2(0.0), isnan(_2545))).x;
    float3 _2557 = float3(_795, _785, float(int(_609)));
    float3 _2561 = select(_2557, float3(0.0), isnan(_2557));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2561.xy, uint(rint(_2561.z)), _822);
    float2 _2567 = float2(_834, _836);
    float2 _842 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2567, float2(0.0), isnan(_2567))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2567, float2(0.0), isnan(_2567))).yz;
    float _844 = _842.x;
    float _846 = _842.y;
    float2 _2579 = float2(_546, _548);
    float _848 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2579, float2(0.0), isnan(_2579)), level(_550)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2579, float2(0.0), isnan(_2579)), level(_550)).x;
    float _850 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _852 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _854 = abs(_157);
    float _856 = log2(_854);
    float _858 = precise::min(_157, -1.0000000116860974230803549289703e-07);
    float _860 = floor(_850);
    float _862 = floor(_852);
    float _864 = _856 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _866 = -_860;
    float _868 = _850 + _866;
    float _870 = exp2(_864);
    float _872 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _874 = _868 + _872;
    float _876 = -_862;
    float _878 = _852 + _876;
    float _880 = -_874;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _886 = _878 + _884;
    float _888 = 1.0 / _858;
    float _890 = -_886;
    float _892 = _890 + 1.0;
    float _894 = _886 * _874;
    float _896 = _886 * _882;
    float _898 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _900 = precise::clamp(_898, 0.0, 1.0);
    float _902 = _874 * _892;
    float _904 = _892 * _882;
    float _906 = fma(_900, -2.0, 3.0);
    float _908 = _900 * _900;
    float _910 = _908 * _906;
    float _912 = -_802;
    float _914 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _916 = -_800;
    float _918 = fma(_916, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _920 = -_804;
    float _922 = fma(_920, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _924 = -_806;
    float _926 = fma(_924, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _928 = 1.0 / _914;
    float _930 = _888 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _932 = _536 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _934 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _936 = 1.0 / _918;
    float _938 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _932);
    float _940 = precise::max(0.0, _934);
    float _942 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _938);
    float _944 = 1.0 / _922;
    float _946 = 1.0 / _926;
    float _948 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _950 = -_157;
    float _952 = fma(_928, _948, _950);
    float _954 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _956 = -_157;
    float _958 = fma(_936, _954, _956);
    float _960 = -_910;
    float _962 = _960 + 1.0;
    float _964 = abs(_952);
    float _966 = _964 * _930;
    float _968 = abs(_958);
    float _970 = _968 * _930;
    float _972 = fma(_962, (*spvDescriptorSet0.fp_c3)._m0[44].w, _910);
    float _974 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _976 = -_157;
    float _978 = fma(_944, _974, _976);
    float _980 = exp2(_966);
    float _982 = abs(_978);
    float _984 = _982 * _930;
    float _986 = _972 * _940;
    float _988 = _536 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _990 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _992 = -_157;
    float _994 = fma(_946, _990, _992);
    float _996 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].x, _988);
    float _998 = exp2(_970);
    float _1000 = abs(_994);
    float _1002 = _1000 * _930;
    float _1004 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].z, _996);
    float _1006 = _1004 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1008 = exp2(_984);
    float _1010 = abs(_894);
    float _1012 = _1010 * _980;
    float _1014 = _942 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1016 = exp2(_1002);
    float _1018 = abs(_902);
    float _1020 = _1018 * _998;
    float _1022 = trunc(_1006);
    int _1024 = int(_1022);
    float _1026 = abs(_896);
    float _1028 = _1026 * _1008;
    float _1030 = _1020 + _1012;
    float _1032 = _1028 + _1030;
    float _1034 = abs(_904);
    float _1036 = _1034 * _1016;
    float _1038 = trunc(_1014);
    int _1040 = int(_1038);
    float _1042 = _1036 + _1032;
    float _1044 = -_1036;
    bool _1046 = _1032 != _1044;
    bool _1048 = isnan(_1032);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(_1044);
    bool _1054 = _1050 || _1052;
    int _1056 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1058 = _1024 + _1056;
    int _1060 = _1058 + 1;
    float _1062 = 1.0 / _1042;
    bool _1064 = _157 >= (-8000.0);
    bool _1066 = isnan(_157);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan(-8000.0);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    bool _1076 = _1060 >= 0;
    float _1078 = _1074 * _986;
    bool _1080 = _1060 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1082 = !_1076;
    bool _1084 = _1080 || _1082;
    int _1086 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1088 = _1040 + _1086;
    int _1090 = _1088 + 1;
    bool _1092 = _1090 < 0;
    bool _1094 = _1092 || _1084;
    float _1096 = _1012 * _1062;
    bool _1098 = _1090 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1100 = _1098 || _1094;
    float _1102 = _1020 * _1062;
    float _1104 = _1028 * _1062;
    float _1106 = _1054 ? _1096 : 0.25;
    float _1108 = _1054 ? _1102 : 0.25;
    float _1110 = _1106 * _812;
    float _1112 = _1106;
    if (_1100)
    {
        _1112 = 1.0;
    }
    float _1114 = _1112;
    float _1116 = _1114;
    if (!_1100)
    {
        int _1118 = _1090 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1120 = _1118 + _1060;
        float _1122 = floor(_1014);
        int _1124 = _1120 << 2;
        int _1126 = _1120 >> 2;
        int _1128 = 12 & _1124;
        int _1130 = _1126 << 4;
        int _1132 = _1130 + _1128;
        float _1134 = floor(_1006);
        uint _1136 = uint(int(uint(_1132) >> uint(2)));
        uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
        int _1140 = int(_1136) & 3;
        float _1142 = (*spvDescriptorSet0.fp_c5)._m0[int(_1138)][_1140];
        float _1144 = -_1122;
        float _1146 = _1014 + _1144;
        float _1148 = -_1134;
        float _1150 = _1006 + _1148;
        float _1152 = rint(_1142);
        float _1154 = precise::max(_1152, 0.0);
        uint _1156 = uint(_1154);
        uint _1158 = clamp(_1156, 0u, 65535u);
        float3 _3037 = float3(_1150, _1146, float(int(_1158)));
        float3 _3039 = select(_3037, float3(0.0), isnan(_3037));
        float _1160 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3039.xy, uint(rint(_3039.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3039.xy, uint(rint(_3039.z)), level(0.0)).x;
        int _1162 = _1120 << 4;
        int _1164 = _1162 + 1648;
        int _1166 = _1132 + 8048;
        uint _1168 = uint(int(uint(_1166) >> uint(2)));
        uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
        int _1172 = int(_1168) & 3;
        float _1174 = (*spvDescriptorSet0.fp_c5)._m0[int(_1170)][_1172];
        uint _1176 = uint(int(uint(_1164) >> uint(2)));
        uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
        int _1180 = int(_1176) & 3;
        float _1182 = (*spvDescriptorSet0.fp_c5)._m0[int(_1178)][_1180];
        int _1184 = int(_1176) + 1;
        uint _1186 = uint(int(uint(_1184) >> uint(2)));
        int _1188 = _1184 & 3;
        float _1190 = (*spvDescriptorSet0.fp_c5)._m0[int(_1186)][_1188];
        int _1192 = _1164 + 8;
        uint _1194 = uint(int(uint(_1192) >> uint(2)));
        uint _1196 = uint(int(uint(int(_1194)) >> uint(2)));
        int _1198 = int(_1194) & 3;
        float _1200 = (*spvDescriptorSet0.fp_c5)._m0[int(_1196)][_1198];
        int _1202 = int(_1194) + 1;
        uint _1204 = uint(int(uint(_1202) >> uint(2)));
        int _1206 = _1202 & 3;
        float _1208 = (*spvDescriptorSet0.fp_c5)._m0[int(_1204)][_1206];
        float _1210 = _536 * _1190;
        float _1212 = 1.0 / _1174;
        float _1214 = fma(_532, _1182, _1210);
        float _1216 = fma(_534, _1200, _1214);
        float _1218 = _1216 + _1208;
        float _1220 = precise::clamp(_1218, 0.0, 1.0);
        float _1222 = _1174 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1224 = -_1220;
        float _1226 = _1224 + _1160;
        float _1228 = fma(_1212, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1226);
        float _1230 = _1222 * _1228;
        float _1232 = exp2(_1230);
        float _1234 = 0.0 + _1232;
        float _1236 = precise::clamp(_1234, 0.0, 1.0);
        _1116 = _1236;
    }
    float _1238 = _1116;
    float _1240 = _1036 * _1062;
    float _1242 = _1054 ? _1104 : 0.25;
    float _1244 = fma(_1108, _810, _1110);
    float _1246 = _1078 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1248 = -_838;
    float _1250 = _1248 + 1.0;
    float _1252 = abs(_848);
    float _1254 = _1252 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1256 = _1054 ? _1240 : 0.25;
    float _1258 = fma(_1242, _814, _1244);
    float _1260 = _1250 * _1246;
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = -_1254;
    float _1266 = fma(_1074, _1264, 1.0);
    float _1268 = -_157;
    float _1270 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1272 = _1268 + _1270;
    float _1274 = precise::min(_1238, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1276 = -_157;
    float _1278 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1280 = _1276 + _1278;
    float _1282 = -_1262;
    float _1284 = fma(_1282, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1286 = fma(_1256, _816, _1258);
    float _1288 = precise::min(_1266, 1.0);
    float _1290 = _1272 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1292 = precise::clamp(_1290, 0.0, 1.0);
    float _1294 = _1280 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1296 = precise::clamp(_1294, 0.0, 1.0);
    float _1298 = -_840;
    float _1300 = _1298 + 1.0;
    float _1302 = -_1274;
    float _1304 = _1302 + 1.0;
    float _1306 = precise::min(_1288, _1284);
    float _1308 = precise::min(_1286, 1.0);
    float _1310 = fma(_1296, _1300, _840);
    float _1312 = fma(_1292, _1304, _1274);
    out.m_66.x = _1310;
    out.m_66.y = _1312;
    out.m_66.z = _1308;
    out.m_66.w = _1306;
    out.m_68.x = 1.0;
    out.m_68.y = _844;
    out.m_68.z = _846;
    out.m_68.w = 1.0;
    return out;
}

