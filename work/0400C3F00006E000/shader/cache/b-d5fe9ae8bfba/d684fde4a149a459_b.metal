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
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_16 [[id(9)]];
    sampler fp_t_tcb_16Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texture2d<float> fp_t_tcb_12 [[id(15)]];
    sampler fp_t_tcb_12Smplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_10 [[id(17)]];
    sampler fp_t_tcb_10Smplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_ASmplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_16Smplr_w [[id(22)]];
    sampler fp_t_tcb_ESmplr_w [[id(23)]];
    sampler fp_t_tcb_12Smplr_w [[id(24)]];
    sampler fp_t_tcb_10Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
    float4 m_64 [[color(1)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_53.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_53.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _71;
    float _87 = _85 * _77;
    float _89 = _85 * _83;
    float _91 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1137 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1137, float2(0.0), isnan(_1137))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1137, float2(0.0), isnan(_1137))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1152 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1152, float2(0.0), isnan(_1152))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1152, float2(0.0), isnan(_1152))).x;
    float2 _1160 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1160, float2(0.0), isnan(_1160))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1160, float2(0.0), isnan(_1160))).x;
    float _101 = in.m_55.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_57.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_57.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_59.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_59.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _85 * _105;
    float _139 = _85 * _111;
    float _141 = _85 * _117;
    float _143 = _85 * _123;
    float _145 = _85 * _129;
    float _147 = _85 * _135;
    float _149 = -_93;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].x, _151);
    float _155 = _153 * _137;
    float _157 = _153 * _139;
    float _159 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _161 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _163 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _159);
    float _165 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _161);
    float _167 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _163);
    float _169 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _165);
    float _171 = -_97;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[41].x, _173);
    float _177 = -_99;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[41].x, _179);
    float _183 = _167 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _185 = _169 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _187 = -_153;
    float _189 = _187 + _175;
    float _191 = -_157;
    float _193 = fma(_181, _145, _191);
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _197 = _183 + _195;
    float _199 = -_155;
    float _201 = fma(_181, _147, _199);
    float _203 = -_157;
    float _205 = fma(_175, _143, _203);
    float _207 = -_155;
    float _209 = fma(_175, _141, _207);
    float _211 = -_153;
    float _213 = _211 + _181;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _185 + _215;
    float _219 = _197 * _197;
    float _221 = _189 * _193;
    float _223 = _209 * _213;
    float _225 = fma(_217, _217, _219);
    float _227 = -_221;
    float _229 = fma(_205, _213, _227);
    float _231 = _205 * _201;
    float _233 = -_223;
    float _235 = fma(_189, _201, _233);
    float _237 = sqrt(_225);
    float _239 = _229 * _229;
    float _241 = -_231;
    float _243 = fma(_209, _193, _241);
    float _245 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _247 = fma(_235, _235, _239);
    float _249 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _245);
    float _251 = fma(_243, _243, _247);
    float _253 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _249);
    float _255 = rsqrt(_251);
    bool _259 = _237 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _253 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _263 = _235 * _255;
    float _265 = _229 * _255;
    float _267 = _243 * _255;
    bool _269 = !_259;
    float _271 = _185;
    float _273 = _183;
    float _275 = _261;
    if (!_269)
    {
        float _277 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _279 = _237 + _277;
        float _281 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _283 = rsqrt(_225);
        float _285 = -_261;
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _289 = _285 + _287;
        float _291 = abs(_281);
        float _293 = abs(_279);
        float _295 = precise::max(_291, _293);
        float _297 = _289 * _289;
        bool _299 = _295 >= 16.0;
        float _301 = _217 * _283;
        float _303 = _197 * _283;
        float _305 = -_217;
        float _307 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[41].z, _305);
        float _309 = -_197;
        float _311 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[41].z, _309);
        float _313 = _279;
        float _315 = _281;
        int _318 = as_type<int>(_311);
        if (_299)
        {
            float _320 = _279 * 0.0625;
            _313 = _320;
        }
        float _322 = _313;
        if (_299)
        {
            float _324 = _281 * 0.0625;
            _315 = _324;
        }
        float _326 = _315;
        float _328 = fma(_307, _307, _297);
        float _330 = abs(_322);
        bool _332 = _330 != 0.0;
        bool _334 = isnan(_330);
        bool _336 = _332 || _334;
        bool _338 = isnan(0.0);
        bool _340 = _336 || _338;
        float _342 = fma(_311, _311, _328);
        float _344 = abs(_326);
        bool _346 = _344 == 0.0;
        float _348 = abs(_326);
        bool _350 = _348 == 0.0;
        bool _352 = !_340;
        bool _354 = _350 && _352;
        float _356 = sqrt(_342);
        bool _358 = false;
        if (_354)
        {
            bool _360 = as_type<int>(_326) >= 0;
            _358 = _360;
        }
        bool _362 = _358;
        int _364 = _362 ? (-1) : 0;
        if (_354)
        {
            int _366 = _362 ? 0 : 1078530011;
            _318 = _366;
        }
        int _368 = _318;
        int _370 = _368;
        if (_354)
        {
            int _372 = int(0x80000000) & as_type<int>(_322);
            int _374 = _368 | _372;
            _370 = _374;
        }
        int _376 = _370;
        bool _378 = !_340;
        bool _380 = _378 && _346;
        int _382 = _376;
        float _384 = as_type<float>(_376);
        if (!_380)
        {
            float _386 = abs(_322);
            bool _388 = _386 != as_type<float>(0x7f800000u /* inf */);
            bool _390 = isnan(_386);
            bool _392 = _388 || _390;
            bool _394 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _396 = _392 || _394;
            float _398 = abs(_326);
            bool _400 = _398 == as_type<float>(0x7f800000u /* inf */);
            float _402 = abs(_326);
            bool _404 = _402 == as_type<float>(0x7f800000u /* inf */);
            bool _406 = !_396;
            bool _408 = _404 && _406;
            if (_408)
            {
                bool _410 = as_type<int>(_326) >= 0;
                _364 = _410 ? (-1) : 0;
            }
            int _412 = _364;
            if (_408)
            {
                _382 = 1075235812;
            }
            int _414 = _382;
            int _416 = _414;
            if (_408)
            {
                int _418 = ~_412;
                int _420 = (_418 != 0) ? _414 : 1061752795;
                _416 = _420;
            }
            int _422 = _416;
            float _424 = as_type<float>(_422);
            if (_408)
            {
                int _426 = int(0x80000000) & as_type<int>(_322);
                int _428 = _422 | _426;
                _424 = as_type<float>(_428);
            }
            float _430 = _424;
            bool _432 = !_396;
            bool _434 = _432 && _400;
            _384 = _430;
            if (!_434)
            {
                float _436 = abs(_322);
                float _438 = abs(_326);
                float _440 = precise::max(_436, _438);
                float _442 = abs(_322);
                float _444 = abs(_326);
                float _446 = precise::min(_442, _444);
                float _448 = 1.0 / _440;
                float _450 = abs(_322);
                float _452 = abs(_326);
                bool _454 = _450 > _452;
                bool _456 = as_type<int>(_326) >= 0;
                float _458 = _446 * _448;
                float _460 = abs(_322);
                float _462 = abs(_326);
                float _464 = _460 + _462;
                int _466 = as_type<int>(_322) & int(0x80000000);
                float _468 = _458 * _458;
                bool _470 = _464 > as_type<float>(0x7f800000u /* inf */);
                bool _472 = isnan(_464);
                bool _474 = _470 || _472;
                bool _476 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _478 = _474 || _476;
                float _480 = _468 + 11.33538818359375;
                float _482 = fma(_468, _480, 28.84246826171875);
                float _484 = fma(_468, _482, 19.6966705322265625);
                float _486 = fma(_468, -0.82336294651031494140625, -5.674867153167724609375);
                float _488 = fma(_468, _486, -6.565555095672607421875);
                float _490 = 1.0 / _484;
                float _492 = _468 * _488;
                float _494 = _458 * _492;
                float _496 = fma(_494, _490, _458);
                float _498 = _496;
                _384 = _464;
                if (_454)
                {
                    float _500 = -_496;
                    float _502 = _500 + 1.57079637050628662109375;
                    _498 = _502;
                }
                float _504 = _498;
                int _506 = as_type<int>(_504);
                if (!_456)
                {
                    float _508 = -_504;
                    float _510 = _508 + 3.1415927410125732421875;
                    _506 = as_type<int>(_510);
                }
                int _512 = _506;
                if (!_478)
                {
                    int _514 = _466 | _512;
                    _384 = as_type<float>(_514);
                }
            }
        }
        float _516 = _384;
        float _518 = fma(_516, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _520 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _522 = _356 + _520;
        float _524 = fma(_301, _518, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _526 = fma(_303, _518, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _271 = _524;
        _273 = _526;
        _275 = _522;
    }
    float _528 = _271;
    float _530 = _273;
    float _532 = _275;
    float _534 = _265 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _536 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].x, _534);
    float _538 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].z, _536);
    float _540 = -_538;
    float _542 = fma(_540, _538, 1.0);
    float _544 = -_538;
    float _546 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[35].z, _267);
    float _548 = -_538;
    float _550 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[35].y, _265);
    float _552 = -_538;
    float _554 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[35].x, _263);
    float _556 = _542 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _558 = fma(_546, _556, _153);
    float _560 = fma(_550, _556, _155);
    float _562 = fma(_554, _556, _157);
    float _564 = -_558;
    bool _566 = _564 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _568 = float(_566);
    float _570 = -_558;
    bool _572 = _570 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _574 = float(_572);
    float _576 = _568 + _574;
    float _578 = precise::min(_576, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _580 = trunc(_578);
    int _582 = int(_580);
    float _584 = rint(_578);
    float _586 = precise::max(_584, 0.0);
    uint _589 = uint(_586);
    uint _591 = clamp(_589, 0u, 65535u);
    int _593 = _582 << 6;
    int _595 = _593 + 48;
    uint _597 = uint(int(uint(_595) >> uint(2)));
    uint _599 = uint(int(uint(int(_597)) >> uint(2)));
    int _601 = int(_597) & 3;
    float _603 = (*spvDescriptorSet0.fp_c3)._m0[int(_599)][_601];
    int _605 = int(_597) + 1;
    uint _607 = uint(int(uint(_605) >> uint(2)));
    int _609 = _605 & 3;
    float _611 = (*spvDescriptorSet0.fp_c3)._m0[int(_607)][_609];
    int _613 = _593 + 56;
    uint _615 = uint(int(uint(_613) >> uint(2)));
    uint _617 = uint(int(uint(int(_615)) >> uint(2)));
    int _619 = int(_615) & 3;
    float _621 = (*spvDescriptorSet0.fp_c3)._m0[int(_617)][_619];
    int _623 = int(_615) + 1;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    int _627 = _623 & 3;
    float _629 = (*spvDescriptorSet0.fp_c3)._m0[int(_625)][_627];
    uint _631 = uint(int(uint(_593) >> uint(2)));
    uint _633 = uint(int(uint(int(_631)) >> uint(2)));
    int _635 = int(_631) & 3;
    float _637 = (*spvDescriptorSet0.fp_c3)._m0[int(_633)][_635];
    int _639 = int(_631) + 1;
    uint _641 = uint(int(uint(_639) >> uint(2)));
    int _643 = _639 & 3;
    float _645 = (*spvDescriptorSet0.fp_c3)._m0[int(_641)][_643];
    int _647 = _593 + 16;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.fp_c3)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = _593 + 32;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = int(_667) + 1;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    int _679 = _675 & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = _593 + 8;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = _593 + 24;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    uint _705 = uint(int(uint(int(_703)) >> uint(2)));
    int _707 = int(_703) & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = int(_703) + 1;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    int _715 = _711 & 3;
    float _717 = (*spvDescriptorSet0.fp_c3)._m0[int(_713)][_715];
    float _719 = _560 * _611;
    float _721 = fma(_562, _603, _719);
    int _723 = _593 + 40;
    uint _725 = uint(int(uint(_723) >> uint(2)));
    uint _727 = uint(int(uint(int(_725)) >> uint(2)));
    int _729 = int(_725) & 3;
    float _731 = (*spvDescriptorSet0.fp_c3)._m0[int(_727)][_729];
    int _733 = int(_725) + 1;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    int _737 = _733 & 3;
    float _739 = (*spvDescriptorSet0.fp_c3)._m0[int(_735)][_737];
    float _741 = fma(_558, _621, _721);
    float _743 = _741 + _629;
    float _745 = fma(_528, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _747 = _560 * _645;
    float _749 = 1.0 / _743;
    float _751 = fma(_562, _637, _747);
    float _753 = _560 * _663;
    float _755 = fma(_528, 6.2500002968590706586837768554688e-05, 0.5);
    float _757 = fma(_562, _655, _753);
    float _759 = _560 * _681;
    float _761 = fma(_562, _673, _759);
    float _763 = fma(_558, _691, _751);
    float _765 = _763 + _699;
    float _767 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _769 = fma(_558, _709, _757);
    float _771 = _765 * _749;
    float _773 = _769 + _717;
    float _775 = fma(_558, _731, _761);
    float _777 = _773 * _749;
    float _779 = _775 + _739;
    float _781 = _779 * _749;
    float _783 = precise::clamp(_781, 0.0, 1.0);
    float _785 = fma(_530, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2252 = float2(_87, _89);
    float2 _789 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2252, float2(0.0), isnan(_2252))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2252, float2(0.0), isnan(_2252))).xy;
    float _791 = _789.x;
    float _793 = _789.y;
    float2 _2264 = float2(_755, _785);
    float _795 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2264, float2(0.0), isnan(_2264))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2264, float2(0.0), isnan(_2264))).x;
    float2 _2272 = float2(_745, _767);
    float _797 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2272, float2(0.0), isnan(_2272))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2272, float2(0.0), isnan(_2272))).x;
    float3 _2284 = float3(_771, _777, float(int(_591)));
    float3 _2288 = select(_2284, float3(0.0), isnan(_2284));
    float _799 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2288.xy, uint(rint(_2288.z)), _783);
    float _801 = fma(_791, 2.0, -1.0);
    float _803 = fma(_793, 2.0, -1.0);
    float _805 = _801 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _807 = _803 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _809 = fma(_805, 2.0, _87);
    float _811 = fma(_807, 2.0, _89);
    float2 _2314 = float2(_809, _811);
    float _813 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2314, float2(0.0), isnan(_2314))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2314, float2(0.0), isnan(_2314))).x;
    float2 _2322 = float2(_755, _785);
    float _815 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2322, float2(0.0), isnan(_2322)), level(_795)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2322, float2(0.0), isnan(_2322)), level(_795)).x;
    float _817 = abs(_153);
    float _819 = log2(_817);
    float _821 = _532 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _823 = _532 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _825 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[101].x, _821);
    float _827 = fma(_528, (*spvDescriptorSet0.fp_c5)._m0[102].x, _823);
    float _829 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[101].z, _825);
    float _831 = _829 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _833 = _819 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _835 = fma(_530, (*spvDescriptorSet0.fp_c5)._m0[102].z, _827);
    float _837 = trunc(_831);
    int _839 = int(_837);
    float _841 = _835 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _843 = exp2(_833);
    float _845 = trunc(_841);
    int _847 = int(_845);
    int _849 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _851 = _839 + _849;
    int _853 = _851 + 1;
    bool _855 = _853 >= 0;
    float _857 = fma(_843, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _859 = precise::clamp(_857, 0.0, 1.0);
    bool _861 = _853 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _863 = !_855;
    bool _865 = _861 || _863;
    float _867 = fma(_859, -2.0, 3.0);
    float _869 = _859 * _859;
    int _871 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _873 = _847 + _871;
    int _875 = _873 + 1;
    float _877 = _869 * _867;
    float _879 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    bool _881 = _875 < 0;
    bool _883 = _881 || _865;
    float _885 = -_877;
    float _887 = _885 + 1.0;
    bool _889 = _875 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _891 = _889 || _883;
    float _893 = fma(_887, (*spvDescriptorSet0.fp_c3)._m0[44].w, _877);
    float _895 = precise::max(0.0, _879);
    bool _897 = _153 >= (-8000.0);
    bool _899 = isnan(_153);
    bool _901 = _897 || _899;
    bool _903 = isnan(-8000.0);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _893 * _895;
    float _911 = _907 * _909;
    float _913 = -_797;
    float _915 = _913 + 1.0;
    float _917 = _797;
    if (_891)
    {
        _917 = 1.0;
    }
    float _919 = _917;
    float _921 = _911 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _923 = _919;
    if (!_891)
    {
        int _925 = _875 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _927 = _925 + _853;
        float _929 = floor(_841);
        int _931 = _927 << 2;
        int _933 = _927 >> 2;
        int _935 = 12 & _931;
        int _937 = _933 << 4;
        int _939 = _937 + _935;
        float _941 = floor(_831);
        uint _943 = uint(int(uint(_939) >> uint(2)));
        uint _945 = uint(int(uint(int(_943)) >> uint(2)));
        int _947 = int(_943) & 3;
        float _949 = (*spvDescriptorSet0.fp_c5)._m0[int(_945)][_947];
        float _951 = -_929;
        float _953 = _841 + _951;
        float _955 = -_941;
        float _957 = _831 + _955;
        float _959 = rint(_949);
        float _961 = precise::max(_959, 0.0);
        uint _963 = uint(_961);
        uint _965 = clamp(_963, 0u, 65535u);
        float3 _2564 = float3(_957, _953, float(int(_965)));
        float3 _2566 = select(_2564, float3(0.0), isnan(_2564));
        float _967 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2566.xy, uint(rint(_2566.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2566.xy, uint(rint(_2566.z)), level(0.0)).x;
        int _969 = _927 << 4;
        int _971 = _969 + 1648;
        int _973 = _939 + 8048;
        uint _975 = uint(int(uint(_973) >> uint(2)));
        uint _977 = uint(int(uint(int(_975)) >> uint(2)));
        int _979 = int(_975) & 3;
        float _981 = (*spvDescriptorSet0.fp_c5)._m0[int(_977)][_979];
        uint _983 = uint(int(uint(_971) >> uint(2)));
        uint _985 = uint(int(uint(int(_983)) >> uint(2)));
        int _987 = int(_983) & 3;
        float _989 = (*spvDescriptorSet0.fp_c5)._m0[int(_985)][_987];
        int _991 = int(_983) + 1;
        uint _993 = uint(int(uint(_991) >> uint(2)));
        int _995 = _991 & 3;
        float _997 = (*spvDescriptorSet0.fp_c5)._m0[int(_993)][_995];
        int _999 = _971 + 8;
        uint _1001 = uint(int(uint(_999) >> uint(2)));
        uint _1003 = uint(int(uint(int(_1001)) >> uint(2)));
        int _1005 = int(_1001) & 3;
        float _1007 = (*spvDescriptorSet0.fp_c5)._m0[int(_1003)][_1005];
        int _1009 = int(_1001) + 1;
        uint _1011 = uint(int(uint(_1009) >> uint(2)));
        int _1013 = _1009 & 3;
        float _1015 = (*spvDescriptorSet0.fp_c5)._m0[int(_1011)][_1013];
        float _1017 = 1.0 / _981;
        float _1019 = _981 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1021 = _532 * _997;
        float _1023 = fma(_528, _989, _1021);
        float _1025 = fma(_530, _1007, _1023);
        float _1027 = _1025 + _1015;
        float _1029 = precise::clamp(_1027, 0.0, 1.0);
        float _1031 = -_1029;
        float _1033 = _1031 + _967;
        float _1035 = fma(_1017, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1033);
        float _1037 = _1019 * _1035;
        float _1039 = exp2(_1037);
        float _1041 = 0.0 + _1039;
        float _1043 = precise::clamp(_1041, 0.0, 1.0);
        _923 = _1043;
    }
    float _1045 = _923;
    float _1047 = abs(_815);
    float _1049 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1051 = _915 * _921;
    float _1053 = precise::clamp(_1051, 0.0, 1.0);
    float _1055 = -_153;
    float _1057 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1059 = _1055 + _1057;
    float _1061 = precise::min(_1045, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1063 = -_1049;
    float _1065 = fma(_907, _1063, 1.0);
    float _1067 = -_153;
    float _1069 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1071 = _1067 + _1069;
    float _1073 = -_1053;
    float _1075 = fma(_1073, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1077 = _1059 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1079 = precise::clamp(_1077, 0.0, 1.0);
    float _1081 = -_1061;
    float _1083 = _1081 + 1.0;
    float _1085 = _1071 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1087 = precise::clamp(_1085, 0.0, 1.0);
    float _1089 = precise::min(_1065, 1.0);
    float _1091 = -_799;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_1087, _1083, _1061);
    float _1097 = precise::min(_1089, _1075);
    float _1099 = fma(_1079, _1093, _799);
    out.m_62.x = _1099;
    out.m_62.y = _1095;
    out.m_62.z = 1.0;
    out.m_62.w = _1097;
    out.m_64.x = _813;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

