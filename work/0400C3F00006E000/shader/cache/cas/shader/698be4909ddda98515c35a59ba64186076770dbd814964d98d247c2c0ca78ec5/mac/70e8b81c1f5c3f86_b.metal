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
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_14 [[id(13)]];
    sampler fp_t_tcb_14Smplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_14Smplr_w [[id(19)]];
    sampler fp_t_tcb_ESmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
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
    float2 _1316 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1316, float2(0.0), isnan(_1316))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1316, float2(0.0), isnan(_1316))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1331 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1331, float2(0.0), isnan(_1331))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1331, float2(0.0), isnan(_1331))).x;
    float2 _1339 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1339, float2(0.0), isnan(_1339))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1339, float2(0.0), isnan(_1339))).x;
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
    float _153 = _83 * _121;
    float _155 = -_95;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _159 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].x, _157);
    float _161 = _149 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _163 = _149 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = _83 * _133;
    float _167 = -_151;
    float _169 = fma(_159, _139, _167);
    float _171 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[32].x, _161);
    float _173 = -_97;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[41].x, _175);
    float _179 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _181 = -_149;
    float _183 = fma(_159, _153, _181);
    float _185 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].z, _171);
    float _187 = -_147;
    float _189 = _187 + _159;
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
    float _241 = sqrt(_233);
    float _243 = fma(_231, _231, _235);
    float _245 = _149 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _247 = fma(_239, _239, _243);
    float _249 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[31].x, _245);
    float _251 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].z, _249);
    float _253 = rsqrt(_247);
    float _255 = _251 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _259 = _241 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _231 * _253;
    float _263 = _225 * _253;
    float _265 = _239 * _253;
    float _267 = _245;
    float _269 = _253;
    float _271 = _197;
    if (!_259)
    {
        _267 = _203;
    }
    float _273 = _267;
    float _275 = _273;
    if (!_259)
    {
        _269 = _255;
    }
    float _277 = _269;
    bool _279 = !_259;
    float _281 = _277;
    if (!_279)
    {
        float _283 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _285 = _241 + _283;
        float _287 = _255 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _289 = rsqrt(_233);
        float _291 = -_255;
        float _293 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _295 = _291 + _293;
        float _297 = abs(_287);
        float _299 = abs(_285);
        float _301 = precise::max(_297, _299);
        float _303 = _295 * _295;
        bool _305 = _301 >= 16.0;
        float _307 = _217 * _289;
        float _309 = _211 * _289;
        float _311 = -_217;
        float _313 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[41].z, _311);
        float _315 = -_211;
        float _317 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = _285;
        float _321 = _287;
        int _324 = as_type<int>(_301);
        float _326 = _317;
        if (_305)
        {
            float _328 = _285 * 0.0625;
            _319 = _328;
        }
        float _330 = _319;
        if (_305)
        {
            float _332 = _287 * 0.0625;
            _321 = _332;
        }
        float _334 = _321;
        float _336 = fma(_313, _313, _303);
        float _338 = abs(_330);
        bool _340 = _338 != 0.0;
        bool _342 = isnan(_338);
        bool _344 = _340 || _342;
        bool _346 = isnan(0.0);
        bool _348 = _344 || _346;
        float _350 = fma(_317, _317, _336);
        float _352 = abs(_334);
        bool _354 = _352 == 0.0;
        float _356 = abs(_334);
        bool _358 = _356 == 0.0;
        bool _360 = !_348;
        bool _362 = _358 && _360;
        float _364 = sqrt(_350);
        bool _366 = false;
        int _368 = as_type<int>(_350);
        if (_362)
        {
            bool _370 = as_type<int>(_334) >= 0;
            _366 = _370;
        }
        bool _372 = _366;
        int _374 = _372 ? (-1) : 0;
        if (_362)
        {
            int _376 = _372 ? 0 : 1078530011;
            _324 = _376;
        }
        int _378 = _324;
        if (_362)
        {
            int _380 = int(0x80000000) & as_type<int>(_330);
            int _382 = _378 | _380;
            _326 = as_type<float>(_382);
        }
        float _384 = _326;
        bool _386 = !_348;
        bool _388 = _386 && _354;
        float _390 = _384;
        float _392 = _384;
        if (!_388)
        {
            float _394 = abs(_330);
            bool _396 = _394 != as_type<float>(0x7f800000u /* inf */);
            bool _398 = isnan(_394);
            bool _400 = _396 || _398;
            bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _404 = _400 || _402;
            float _406 = abs(_334);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            float _410 = abs(_334);
            bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
            bool _414 = !_404;
            bool _416 = _412 && _414;
            if (_416)
            {
                bool _418 = as_type<int>(_334) >= 0;
                _374 = _418 ? (-1) : 0;
            }
            int _420 = _374;
            if (_416)
            {
                _368 = 1075235812;
            }
            int _422 = _368;
            int _424 = _422;
            if (_416)
            {
                int _426 = ~_420;
                int _428 = (_426 != 0) ? _422 : 1061752795;
                _424 = _428;
            }
            int _430 = _424;
            if (_416)
            {
                int _432 = int(0x80000000) & as_type<int>(_330);
                int _434 = _430 | _432;
                _390 = as_type<float>(_434);
            }
            float _436 = _390;
            bool _438 = !_404;
            bool _440 = _438 && _408;
            _392 = _436;
            if (!_440)
            {
                float _442 = abs(_330);
                float _444 = abs(_334);
                float _446 = precise::max(_442, _444);
                float _448 = abs(_330);
                float _450 = abs(_334);
                float _452 = precise::min(_448, _450);
                float _454 = 1.0 / _446;
                float _456 = abs(_330);
                float _458 = abs(_334);
                bool _460 = _456 > _458;
                bool _462 = as_type<int>(_334) >= 0;
                float _464 = _452 * _454;
                float _466 = abs(_330);
                float _468 = abs(_334);
                float _470 = _466 + _468;
                int _472 = as_type<int>(_330) & int(0x80000000);
                float _474 = _464 * _464;
                bool _476 = _470 > as_type<float>(0x7f800000u /* inf */);
                bool _478 = isnan(_470);
                bool _480 = _476 || _478;
                bool _482 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _484 = _480 || _482;
                float _486 = _474 + 11.33538818359375;
                float _488 = fma(_474, _486, 28.84246826171875);
                float _490 = fma(_474, _488, 19.6966705322265625);
                float _492 = fma(_474, -0.82336294651031494140625, -5.674867153167724609375);
                float _494 = fma(_474, _492, -6.565555095672607421875);
                float _496 = 1.0 / _490;
                float _498 = _474 * _494;
                float _500 = _464 * _498;
                float _502 = fma(_500, _496, _464);
                float _504 = _502;
                _392 = _470;
                if (_460)
                {
                    float _506 = -_502;
                    float _508 = _506 + 1.57079637050628662109375;
                    _504 = _508;
                }
                float _510 = _504;
                int _512 = as_type<int>(_510);
                if (!_462)
                {
                    float _514 = -_510;
                    float _516 = _514 + 3.1415927410125732421875;
                    _512 = as_type<int>(_516);
                }
                int _518 = _512;
                if (!_484)
                {
                    int _520 = _472 | _518;
                    _392 = as_type<float>(_520);
                }
            }
        }
        float _522 = _392;
        float _524 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _526 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _528 = _364 + _526;
        float _530 = fma(_307, _524, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _532 = fma(_309, _524, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _281 = _528;
        _275 = _530;
        _271 = _532;
    }
    float _534 = _281;
    float _536 = _275;
    float _538 = _271;
    float _540 = _263 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _542 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[35].x, _540);
    float _544 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[35].z, _542);
    float _546 = -_544;
    float _548 = fma(_546, _544, 1.0);
    float _550 = -_544;
    float _552 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[35].z, _265);
    float _554 = -_544;
    float _556 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[35].y, _263);
    float _558 = -_544;
    float _560 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[35].x, _261);
    float _562 = _548 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _564 = fma(_552, _562, _147);
    float _566 = fma(_556, _562, _149);
    float _568 = fma(_560, _562, _151);
    float _570 = -_564;
    bool _572 = _570 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _574 = float(_572);
    float _576 = -_564;
    bool _578 = _576 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _580 = float(_578);
    float _582 = _574 + _580;
    float _584 = precise::min(_582, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _586 = trunc(_584);
    int _588 = int(_586);
    float _590 = rint(_584);
    float _592 = precise::max(_590, 0.0);
    uint _595 = uint(_592);
    uint _597 = clamp(_595, 0u, 65535u);
    int _599 = _588 << 6;
    int _601 = _599 + 48;
    uint _603 = uint(int(uint(_601) >> uint(2)));
    uint _605 = uint(int(uint(int(_603)) >> uint(2)));
    int _607 = int(_603) & 3;
    float _609 = (*spvDescriptorSet0.fp_c3)._m0[int(_605)][_607];
    int _611 = int(_603) + 1;
    uint _613 = uint(int(uint(_611) >> uint(2)));
    int _615 = _611 & 3;
    float _617 = (*spvDescriptorSet0.fp_c3)._m0[int(_613)][_615];
    int _619 = _599 + 56;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.fp_c3)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    uint _637 = uint(int(uint(_599) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[int(_639)][_641];
    int _645 = int(_637) + 1;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    int _649 = _645 & 3;
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[int(_647)][_649];
    int _653 = _599 + 16;
    uint _655 = uint(int(uint(_653) >> uint(2)));
    uint _657 = uint(int(uint(int(_655)) >> uint(2)));
    int _659 = int(_655) & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = int(_655) + 1;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    int _667 = _663 & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = _599 + 32;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    uint _675 = uint(int(uint(int(_673)) >> uint(2)));
    int _677 = int(_673) & 3;
    float _679 = (*spvDescriptorSet0.fp_c3)._m0[int(_675)][_677];
    int _681 = int(_673) + 1;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    int _685 = _681 & 3;
    float _687 = (*spvDescriptorSet0.fp_c3)._m0[int(_683)][_685];
    int _689 = _599 + 8;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.fp_c3)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.fp_c3)._m0[int(_701)][_703];
    float _707 = _566 * _617;
    int _709 = _599 + 24;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    uint _713 = uint(int(uint(int(_711)) >> uint(2)));
    int _715 = int(_711) & 3;
    float _717 = (*spvDescriptorSet0.fp_c3)._m0[int(_713)][_715];
    int _719 = int(_711) + 1;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    int _723 = _719 & 3;
    float _725 = (*spvDescriptorSet0.fp_c3)._m0[int(_721)][_723];
    float _727 = fma(_568, _609, _707);
    float2 _2333 = float2(_85, _87);
    float2 _731 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2333, float2(0.0), isnan(_2333))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2333, float2(0.0), isnan(_2333))).xy;
    float _733 = _731.x;
    float _735 = _731.y;
    float _737 = fma(_564, _627, _727);
    int _739 = _599 + 40;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    uint _743 = uint(int(uint(int(_741)) >> uint(2)));
    int _745 = int(_741) & 3;
    float _747 = (*spvDescriptorSet0.fp_c3)._m0[int(_743)][_745];
    int _749 = int(_741) + 1;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    int _753 = _749 & 3;
    float _755 = (*spvDescriptorSet0.fp_c3)._m0[int(_751)][_753];
    float _757 = _737 + _635;
    float _759 = _566 * _651;
    float _761 = 1.0 / _757;
    float _763 = fma(_568, _643, _759);
    float _765 = _566 * _669;
    float _767 = fma(_568, _661, _765);
    float _769 = _566 * _687;
    float _771 = fma(_568, _679, _769);
    float _773 = fma(_564, _697, _763);
    float _775 = _773 + _705;
    float _777 = fma(_564, _717, _767);
    float _779 = _777 + _725;
    float _781 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float _783 = fma(_564, _747, _771);
    float _785 = _775 * _761;
    float _787 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _789 = _779 * _761;
    float _791 = _783 + _755;
    float2 _2442 = float2(_787, _781);
    float4 _794 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2442, float2(0.0), isnan(_2442)), int2(0), component::x).xyzw;
    float _796 = _794.x;
    float _798 = _794.y;
    float _800 = _794.z;
    float _802 = _794.w;
    float _804 = _791 * _761;
    float _806 = precise::clamp(_804, 0.0, 1.0);
    float2 _2463 = float2(_787, _781);
    float4 _808 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2463, float2(0.0), isnan(_2463)), int2(0), component::w).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float3 _2483 = float3(_785, _789, float(int(_597)));
    float3 _2487 = select(_2483, float3(0.0), isnan(_2483));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2487.xy, uint(rint(_2487.z)), _806);
    float _820 = _534 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _822 = _534 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _824 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].x, _820);
    float _826 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].x, _822);
    float _828 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].z, _824);
    float _830 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].z, _826);
    float _832 = _828 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _834 = _830 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _836 = trunc(_832);
    int _838 = int(_836);
    float _840 = trunc(_834);
    int _842 = int(_840);
    int _844 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _846 = _838 + _844;
    int _848 = _846 + 1;
    bool _850 = _848 >= 0;
    int _852 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _854 = _842 + _852;
    int _856 = _854 + 1;
    bool _858 = _848 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _860 = !_850;
    bool _862 = _858 || _860;
    bool _864 = _856 < 0;
    bool _866 = _864 || _862;
    bool _868 = _856 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _870 = _868 || _866;
    int _872 = _842;
    int _874 = _856;
    int _876 = _848;
    float _878 = _568;
    float _880 = _755;
    if (!_870)
    {
        int _882 = _856 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _884 = _882 + _848;
        _872 = _884;
    }
    int _886 = _872;
    float _888 = _830;
    if (!_870)
    {
        float _890 = floor(_832);
        _888 = _890;
    }
    float _892 = _888;
    if (!_870)
    {
        int _894 = _886 << 2;
        _874 = _894;
    }
    int _896 = _874;
    int _898 = _896;
    if (!_870)
    {
        int _900 = _886 >> 2;
        _876 = _900;
    }
    int _902 = _876;
    int _904 = _902;
    if (!_870)
    {
        int _906 = 12 & _896;
        _898 = _906;
    }
    int _908 = _898;
    if (!_870)
    {
        int _910 = _902 << 4;
        int _912 = _910 + _908;
        _904 = _912;
    }
    int _914 = _904;
    float _916 = as_type<float>(_908);
    if (!_870)
    {
        float _918 = floor(_834);
        _916 = _918;
    }
    float _920 = _916;
    float _922 = _562;
    if (!_870)
    {
        uint _924 = uint(int(uint(_914) >> uint(2)));
        uint _926 = uint(int(uint(int(_924)) >> uint(2)));
        int _928 = int(_924) & 3;
        float _930 = (*spvDescriptorSet0.fp_c5)._m0[int(_926)][_928];
        _922 = _930;
    }
    float _932 = _922;
    if (!_870)
    {
        float _934 = -_892;
        float _936 = _832 + _934;
        _878 = _936;
    }
    float _938 = _878;
    if (!_870)
    {
        float _940 = -_920;
        float _942 = _834 + _940;
        _880 = _942;
    }
    float _944 = _880;
    float _946 = _932;
    if (!_870)
    {
        float _948 = rint(_932);
        float _950 = precise::max(_948, 0.0);
        uint _952 = uint(_950);
        uint _954 = clamp(_952, 0u, 65535u);
        _946 = as_type<float>(_954);
    }
    float _956 = _946;
    float _958 = fma(_733, 2.0, -1.0);
    float _960 = fma(_735, 2.0, -1.0);
    float _962 = _958 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _964 = _960 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _966 = fma(_962, 2.0, _85);
    float _968 = fma(_964, 2.0, _87);
    float2 _2740 = float2(_966, _968);
    float2 _970 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2740, float2(0.0), isnan(_2740))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2740, float2(0.0), isnan(_2740))).yz;
    float _972 = _970.x;
    float _974 = _970.y;
    float _976 = _832;
    if (!_870)
    {
        float3 _2759 = float3(_938, _944, float(as_type<int>(_956)));
        float3 _2761 = select(_2759, float3(0.0), isnan(_2759));
        float _978 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2761.xy, uint(rint(_2761.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2761.xy, uint(rint(_2761.z)), level(0.0)).x;
        _976 = _978;
    }
    float _980 = _976;
    float _982 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _984 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _986 = floor(_982);
    float _988 = precise::min(_147, -1.0000000116860974230803549289703e-07);
    float _990 = floor(_984);
    float _992 = 1.0 / _988;
    float _994 = -_986;
    float _996 = _982 + _994;
    float _998 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1000 = _996 + _998;
    float _1002 = -_990;
    float _1004 = _984 + _1002;
    float _1006 = -_1000;
    float _1008 = _1006 + 1.0;
    float _1010 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _1012 = _1004 + _1010;
    float _1014 = -_796;
    float _1016 = fma(_1014, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1018 = -_800;
    float _1020 = fma(_1018, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1022 = -_798;
    float _1024 = fma(_1022, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1026 = -_802;
    float _1028 = fma(_1026, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _1030 = _1000 * _1012;
    float _1032 = _1012 * _1008;
    float _1034 = 1.0 / _1016;
    float _1036 = -_1012;
    float _1038 = _1036 + 1.0;
    float _1040 = _1000 * _1038;
    float _1042 = _1008 * _1038;
    float _1044 = _992 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _1046 = 1.0 / _1024;
    float _1048 = 1.0 / _1020;
    float _1050 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1052 = -_147;
    float _1054 = fma(_1034, _1050, _1052);
    float _1056 = abs(_1054);
    float _1058 = _1056 * _1044;
    float _1060 = 1.0 / _1028;
    float _1062 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1064 = -_147;
    float _1066 = fma(_1046, _1062, _1064);
    float _1068 = abs(_1066);
    float _1070 = _1068 * _1044;
    float _1072 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1074 = -_147;
    float _1076 = fma(_1048, _1072, _1074);
    float _1078 = exp2(_1058);
    float _1080 = abs(_1076);
    float _1082 = _1080 * _1044;
    float _1084 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _1086 = -_147;
    float _1088 = fma(_1060, _1084, _1086);
    float _1090 = exp2(_1070);
    float _1092 = abs(_1088);
    float _1094 = _1092 * _1044;
    float _1096 = exp2(_1082);
    float _1098 = abs(_1032);
    float _1100 = _1098 * _1078;
    float _1102 = exp2(_1094);
    float _1104 = abs(_1030);
    float _1106 = _1104 * _1090;
    float _1108 = _1100 + _1106;
    float _1110 = abs(_1040);
    float _1112 = _1110 * _1096;
    float _1114 = _1112 + _1108;
    float _1116 = abs(_1042);
    float _1118 = _1116 * _1102;
    float _1120 = _1118 + _1114;
    float _1122 = -_1118;
    bool _1124 = _1114 != _1122;
    bool _1126 = isnan(_1114);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan(_1122);
    bool _1132 = _1128 || _1130;
    float _1134 = 1.0 / _1120;
    float _1136 = _1106 * _1134;
    float _1138 = _1100 * _1134;
    float _1140 = _1112 * _1134;
    float _1142 = _1118 * _1134;
    float _1144 = _1132 ? _1136 : 0.25;
    float _1146 = _1132 ? _1138 : 0.25;
    float _1148 = _1132 ? _1140 : 0.25;
    float _1150 = _1144 * _812;
    float _1152 = fma(_1146, _810, _1150);
    float _1154 = fma(_1148, _814, _1152);
    float _1156 = -_147;
    float _1158 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1160 = _1156 + _1158;
    float _1162 = _1152;
    if (_870)
    {
        _1162 = 1.0;
    }
    float _1164 = _1162;
    float _1166 = _1164;
    if (!_870)
    {
        int _1168 = _886 << 4;
        int _1170 = _1168 + 1648;
        int _1172 = _914 + 8048;
        uint _1174 = uint(int(uint(_1172) >> uint(2)));
        uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
        int _1178 = int(_1174) & 3;
        float _1180 = (*spvDescriptorSet0.fp_c5)._m0[int(_1176)][_1178];
        uint _1182 = uint(int(uint(_1170) >> uint(2)));
        uint _1184 = uint(int(uint(int(_1182)) >> uint(2)));
        int _1186 = int(_1182) & 3;
        float _1188 = (*spvDescriptorSet0.fp_c5)._m0[int(_1184)][_1186];
        int _1190 = int(_1182) + 1;
        uint _1192 = uint(int(uint(_1190) >> uint(2)));
        int _1194 = _1190 & 3;
        float _1196 = (*spvDescriptorSet0.fp_c5)._m0[int(_1192)][_1194];
        int _1198 = _1170 + 8;
        uint _1200 = uint(int(uint(_1198) >> uint(2)));
        uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
        int _1204 = int(_1200) & 3;
        float _1206 = (*spvDescriptorSet0.fp_c5)._m0[int(_1202)][_1204];
        int _1208 = int(_1200) + 1;
        uint _1210 = uint(int(uint(_1208) >> uint(2)));
        int _1212 = _1208 & 3;
        float _1214 = (*spvDescriptorSet0.fp_c5)._m0[int(_1210)][_1212];
        float _1216 = _534 * _1196;
        float _1218 = 1.0 / _1180;
        float _1220 = fma(_536, _1188, _1216);
        float _1222 = _1180 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1224 = fma(_538, _1206, _1220);
        float _1226 = _1224 + _1214;
        float _1228 = precise::clamp(_1226, 0.0, 1.0);
        float _1230 = -_1228;
        float _1232 = _1230 + _980;
        float _1234 = fma(_1218, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1232);
        float _1236 = _1222 * _1234;
        float _1238 = exp2(_1236);
        float _1240 = 0.0 + _1238;
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        _1166 = _1242;
    }
    float _1244 = _1166;
    float _1246 = -_147;
    float _1248 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1250 = _1246 + _1248;
    float _1252 = precise::min(_1244, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1254 = _1160 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = _1132 ? _1142 : 0.25;
    float _1260 = _1250 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = -_818;
    float _1266 = _1264 + 1.0;
    float _1268 = -_1252;
    float _1270 = _1268 + 1.0;
    float _1272 = fma(_1258, _816, _1154);
    float _1274 = fma(_1256, _1266, _818);
    float _1276 = fma(_1262, _1270, _1252);
    float _1278 = precise::min(_1272, 1.0);
    out.m_60.x = _1274;
    out.m_60.y = _1276;
    out.m_60.z = _1278;
    out.m_60.w = 1.0;
    out.m_62.x = 1.0;
    out.m_62.y = _972;
    out.m_62.z = _974;
    out.m_62.w = 1.0;
    return out;
}

