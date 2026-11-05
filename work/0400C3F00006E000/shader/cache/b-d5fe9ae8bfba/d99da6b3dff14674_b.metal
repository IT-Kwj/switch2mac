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
    texture2d<float> fp_t_tcb_16 [[id(5)]];
    sampler fp_t_tcb_16Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_18 [[id(9)]];
    sampler fp_t_tcb_18Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_14 [[id(15)]];
    sampler fp_t_tcb_14Smplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_E [[id(17)]];
    sampler fp_t_tcb_ESmplr [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_16Smplr_w [[id(20)]];
    sampler fp_t_tcb_18Smplr_w [[id(21)]];
    sampler fp_t_tcb_14Smplr_w [[id(22)]];
    sampler fp_t_tcb_ESmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
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
    float2 _1345 = float2(_87, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1345, float2(0.0), isnan(_1345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1345, float2(0.0), isnan(_1345))).x;
    float _95 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1360 = float2(_91, _89);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1360, float2(0.0), isnan(_1360))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1360, float2(0.0), isnan(_1360))).x;
    float2 _1368 = float2(_87, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1368, float2(0.0), isnan(_1368))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1368, float2(0.0), isnan(_1368))).x;
    float _101 = in.m_55.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_55.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_57.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_57.y;
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
    float _159 = -_97;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].x, _161);
    float _165 = _155 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _167 = _155 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _169 = -_157;
    float _171 = fma(_163, _141, _169);
    float _173 = -_155;
    float _175 = fma(_163, _143, _173);
    float _177 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].x, _165);
    float _179 = -_99;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[41].x, _181);
    float _185 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].x, _167);
    float _187 = -_153;
    float _189 = _187 + _163;
    float _191 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _193 = -_157;
    float _195 = fma(_183, _145, _193);
    float _197 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[30].z, _185);
    float _199 = -_155;
    float _201 = fma(_183, _147, _199);
    float _203 = _191 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _205 = -_153;
    float _207 = _205 + _183;
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _211 = _189 * _195;
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _215 = _203 + _213;
    float _217 = _175 * _207;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _221 = _209 + _219;
    float _223 = -_211;
    float _225 = fma(_171, _207, _223);
    float _227 = _215 * _215;
    float _229 = _171 * _201;
    float _231 = -_217;
    float _233 = fma(_189, _201, _231);
    float _235 = _225 * _225;
    float _237 = fma(_221, _221, _227);
    float _239 = -_229;
    float _241 = fma(_175, _195, _239);
    float _243 = fma(_233, _233, _235);
    float _245 = sqrt(_237);
    float _247 = fma(_241, _241, _243);
    float _249 = _155 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _251 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].x, _249);
    float _253 = rsqrt(_247);
    float _255 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[31].z, _251);
    bool _259 = _245 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = _255 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _263 = _233 * _253;
    float _265 = _225 * _253;
    float _267 = _241 * _253;
    float _269 = _255;
    float _271 = _233;
    float _273 = _203;
    if (!_259)
    {
        _269 = _209;
    }
    float _275 = _269;
    float _277 = _275;
    if (!_259)
    {
        _271 = _261;
    }
    float _279 = _271;
    bool _281 = !_259;
    float _283 = _279;
    if (!_281)
    {
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _287 = _245 + _285;
        float _289 = _261 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = rsqrt(_237);
        float _293 = abs(_289);
        float _295 = abs(_287);
        float _297 = precise::max(_293, _295);
        bool _299 = _297 >= 16.0;
        float _301 = -_261;
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = _301 + _303;
        float _307 = _305 * _305;
        float _309 = _221 * _291;
        float _311 = _215 * _291;
        float _313 = -_221;
        float _315 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = _287;
        float _319 = _289;
        if (_299)
        {
            float _321 = _287 * 0.0625;
            _317 = _321;
        }
        float _323 = _317;
        if (_299)
        {
            float _325 = _289 * 0.0625;
            _319 = _325;
        }
        float _327 = _319;
        float _329 = -_215;
        float _331 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _329);
        float _333 = fma(_315, _315, _307);
        float _335 = abs(_323);
        bool _337 = _335 != 0.0;
        bool _339 = isnan(_335);
        bool _341 = _337 || _339;
        bool _343 = isnan(0.0);
        bool _345 = _341 || _343;
        float _347 = fma(_331, _331, _333);
        float _349 = abs(_327);
        bool _351 = _349 == 0.0;
        float _353 = abs(_327);
        bool _355 = _353 == 0.0;
        bool _357 = !_345;
        bool _359 = _355 && _357;
        float _361 = sqrt(_347);
        bool _363 = false;
        int _366 = as_type<int>(_331);
        if (_359)
        {
            bool _368 = as_type<int>(_327) >= 0;
            _363 = _368;
        }
        bool _370 = _363;
        int _372 = _370 ? (-1) : 0;
        if (_359)
        {
            int _374 = _370 ? 0 : 1078530011;
            _366 = _374;
        }
        int _376 = _366;
        int _378 = _376;
        if (_359)
        {
            int _380 = int(0x80000000) & as_type<int>(_323);
            int _382 = _376 | _380;
            _378 = _382;
        }
        int _384 = _378;
        bool _386 = !_345;
        bool _388 = _386 && _351;
        int _390 = _384;
        float _392 = as_type<float>(_384);
        if (!_388)
        {
            float _394 = abs(_323);
            bool _396 = _394 != as_type<float>(0x7f800000u /* inf */);
            bool _398 = isnan(_394);
            bool _400 = _396 || _398;
            bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _404 = _400 || _402;
            float _406 = abs(_327);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            float _410 = abs(_327);
            bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
            bool _414 = !_404;
            bool _416 = _412 && _414;
            if (_416)
            {
                bool _418 = as_type<int>(_327) >= 0;
                _372 = _418 ? (-1) : 0;
            }
            int _420 = _372;
            if (_416)
            {
                _390 = 1075235812;
            }
            int _422 = _390;
            int _424 = _422;
            if (_416)
            {
                int _426 = ~_420;
                int _428 = (_426 != 0) ? _422 : 1061752795;
                _424 = _428;
            }
            int _430 = _424;
            float _432 = as_type<float>(_430);
            if (_416)
            {
                int _434 = int(0x80000000) & as_type<int>(_323);
                int _436 = _430 | _434;
                _432 = as_type<float>(_436);
            }
            float _438 = _432;
            bool _440 = !_404;
            bool _442 = _440 && _408;
            _392 = _438;
            if (!_442)
            {
                float _444 = abs(_323);
                float _446 = abs(_327);
                float _448 = precise::max(_444, _446);
                float _450 = abs(_323);
                float _452 = abs(_327);
                float _454 = precise::min(_450, _452);
                float _456 = 1.0 / _448;
                float _458 = abs(_323);
                float _460 = abs(_327);
                bool _462 = _458 > _460;
                bool _464 = as_type<int>(_327) >= 0;
                float _466 = _454 * _456;
                float _468 = abs(_323);
                float _470 = abs(_327);
                float _472 = _468 + _470;
                int _474 = as_type<int>(_323) & int(0x80000000);
                float _476 = _466 * _466;
                bool _478 = _472 > as_type<float>(0x7f800000u /* inf */);
                bool _480 = isnan(_472);
                bool _482 = _478 || _480;
                bool _484 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _486 = _482 || _484;
                float _488 = _476 + 11.33538818359375;
                float _490 = fma(_476, _488, 28.84246826171875);
                float _492 = fma(_476, _490, 19.6966705322265625);
                float _494 = fma(_476, -0.82336294651031494140625, -5.674867153167724609375);
                float _496 = fma(_476, _494, -6.565555095672607421875);
                float _498 = 1.0 / _492;
                float _500 = _476 * _496;
                float _502 = _466 * _500;
                float _504 = fma(_502, _498, _466);
                float _506 = _504;
                _392 = _472;
                if (_462)
                {
                    float _508 = -_504;
                    float _510 = _508 + 1.57079637050628662109375;
                    _506 = _510;
                }
                float _512 = _506;
                int _514 = as_type<int>(_512);
                if (!_464)
                {
                    float _516 = -_512;
                    float _518 = _516 + 3.1415927410125732421875;
                    _514 = as_type<int>(_518);
                }
                int _520 = _514;
                if (!_486)
                {
                    int _522 = _474 | _520;
                    _392 = as_type<float>(_522);
                }
            }
        }
        float _524 = _392;
        float _526 = fma(_524, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _528 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _530 = _361 + _528;
        float _532 = fma(_309, _526, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _534 = fma(_311, _526, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _277 = _532;
        _273 = _534;
        _283 = _530;
    }
    float _536 = _277;
    float _538 = _273;
    float _540 = _283;
    float _542 = fma(_536, 6.2500002968590706586837768554688e-05, 0.5);
    float _544 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2050 = float2(_542, _544);
    float _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2050, float2(0.0), isnan(_2050))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2050, float2(0.0), isnan(_2050))).x;
    float _548 = _265 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _550 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].x, _548);
    float _552 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[35].z, _550);
    float _554 = -_552;
    float _556 = fma(_554, _552, 1.0);
    float _558 = -_552;
    float _560 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[35].z, _267);
    float _562 = -_552;
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].y, _265);
    float _566 = -_552;
    float _568 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[35].x, _263);
    float _570 = _556 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _572 = fma(_560, _570, _153);
    float _574 = fma(_564, _570, _155);
    float _576 = fma(_568, _570, _157);
    float _578 = -_572;
    bool _580 = _578 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _582 = float(_580);
    float _584 = -_572;
    bool _586 = _584 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _588 = float(_586);
    float _590 = _582 + _588;
    float _592 = precise::min(_590, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _594 = trunc(_592);
    int _596 = int(_594);
    int _598 = _596 << 6;
    int _600 = _598 + 48;
    uint _603 = uint(int(uint(_600) >> uint(2)));
    uint _605 = uint(int(uint(int(_603)) >> uint(2)));
    int _607 = int(_603) & 3;
    float _609 = (*spvDescriptorSet0.fp_c3)._m0[int(_605)][_607];
    int _611 = int(_603) + 1;
    uint _613 = uint(int(uint(_611) >> uint(2)));
    int _615 = _611 & 3;
    float _617 = (*spvDescriptorSet0.fp_c3)._m0[int(_613)][_615];
    int _619 = _598 + 56;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.fp_c3)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    uint _637 = uint(int(uint(_598) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[int(_639)][_641];
    int _645 = int(_637) + 1;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    int _649 = _645 & 3;
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[int(_647)][_649];
    int _653 = _598 + 16;
    uint _655 = uint(int(uint(_653) >> uint(2)));
    uint _657 = uint(int(uint(int(_655)) >> uint(2)));
    int _659 = int(_655) & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = int(_655) + 1;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    int _667 = _663 & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = _598 + 32;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    uint _675 = uint(int(uint(int(_673)) >> uint(2)));
    int _677 = int(_673) & 3;
    float _679 = (*spvDescriptorSet0.fp_c3)._m0[int(_675)][_677];
    int _681 = int(_673) + 1;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    int _685 = _681 & 3;
    float _687 = (*spvDescriptorSet0.fp_c3)._m0[int(_683)][_685];
    int _689 = _598 + 8;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.fp_c3)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.fp_c3)._m0[int(_701)][_703];
    int _707 = _598 + 24;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    float _725 = _574 * _617;
    float _727 = fma(_576, _609, _725);
    int _729 = _598 + 40;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    uint _733 = uint(int(uint(int(_731)) >> uint(2)));
    int _735 = int(_731) & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    int _739 = int(_731) + 1;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    int _743 = _739 & 3;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[int(_741)][_743];
    float _747 = fma(_572, _627, _727);
    float _749 = _747 + _635;
    float _751 = _574 * _651;
    float _753 = 1.0 / _749;
    float _755 = fma(_576, _643, _751);
    float _757 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _759 = _574 * _669;
    float _761 = fma(_576, _661, _759);
    float _763 = _574 * _687;
    float _765 = fma(_576, _679, _763);
    float _767 = fma(_572, _697, _755);
    float _769 = _767 + _705;
    float _771 = fma(_572, _715, _761);
    float _773 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _775 = _771 + _723;
    float _777 = _769 * _753;
    float _779 = rint(_592);
    float _781 = precise::max(_779, 0.0);
    uint _783 = uint(_781);
    uint _785 = clamp(_783, 0u, 65535u);
    float _787 = fma(_572, _737, _765);
    float2 _2471 = float2(_87, _89);
    float4 _790 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2471, float2(0.0), isnan(_2471)), int2(0), component::x).xyzw;
    float _792 = _790.x;
    float _794 = _790.y;
    float _796 = _790.z;
    float _798 = _790.w;
    float2 _2487 = float2(_773, _757);
    float _800 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2487, float2(0.0), isnan(_2487))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2487, float2(0.0), isnan(_2487))).x;
    float _802 = _787 + _745;
    float _804 = _775 * _753;
    float _806 = _802 * _753;
    float _808 = precise::clamp(_806, 0.0, 1.0);
    float3 _2510 = float3(_777, _804, float(int(_785)));
    float3 _2514 = select(_2510, float3(0.0), isnan(_2510));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2514.xy, uint(rint(_2514.z)), _808);
    float2 _2520 = float2(_87, _89);
    float4 _812 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2520, float2(0.0), isnan(_2520)), int2(0), component::x).xyzw;
    float _814 = _812.x;
    float _816 = _812.y;
    float _818 = _812.z;
    float _820 = _812.w;
    float2 _2536 = float2(_87, _89);
    float4 _822 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2536, float2(0.0), isnan(_2536)), int2(0), component::w).xyzw;
    float _824 = _822.x;
    float _826 = _822.y;
    float _828 = _822.z;
    float _830 = _822.w;
    float2 _2552 = float2(_542, _544);
    float _832 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2552, float2(0.0), isnan(_2552)), level(_546)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2552, float2(0.0), isnan(_2552)), level(_546)).x;
    float _834 = abs(_153);
    float _836 = log2(_834);
    float _838 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _840 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _842 = floor(_838);
    float _844 = _836 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _846 = floor(_840);
    float _848 = -_842;
    float _850 = _838 + _848;
    float _852 = exp2(_844);
    float _854 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _856 = _850 + _854;
    float _858 = -_846;
    float _860 = _840 + _858;
    float _862 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _864 = _860 + _862;
    float _866 = fma(_852, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _868 = precise::clamp(_866, 0.0, 1.0);
    float _870 = -_864;
    float _872 = _870 + 1.0;
    float _874 = fma(_868, -2.0, 3.0);
    float _876 = _868 * _868;
    float _878 = -_856;
    float _880 = _878 + 1.0;
    float _882 = _856 * _872;
    float _884 = _876 * _874;
    float _886 = _856 * _864;
    float _888 = _864 * _880;
    float _890 = precise::min(_153, -1.0000000116860974230803549289703e-07);
    float _892 = _880 * _872;
    float _894 = -_884;
    float _896 = _894 + 1.0;
    float _898 = 1.0 / _890;
    float _900 = fma(_896, (*spvDescriptorSet0.fp_c3)._m0[44].w, _884);
    float _902 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _904 = precise::max(0.0, _902);
    float _906 = _900 * _904;
    float _908 = _540 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _910 = _898 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _912 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].x, _908);
    float _914 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].z, _912);
    float _916 = _914 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _918 = -_792;
    float _920 = fma(_918, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _922 = -_794;
    float _924 = fma(_922, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _926 = -_796;
    float _928 = fma(_926, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _930 = -_798;
    float _932 = fma(_930, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _934 = 1.0 / _920;
    float _936 = _540 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _938 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].x, _936);
    float _940 = 1.0 / _924;
    float _942 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].z, _938);
    float _944 = _942 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _946 = 1.0 / _928;
    float _948 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _950 = -_153;
    float _952 = fma(_934, _948, _950);
    float _954 = abs(_952);
    float _956 = _954 * _910;
    float _958 = 1.0 / _932;
    float _960 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _962 = -_153;
    float _964 = fma(_940, _960, _962);
    float _966 = abs(_964);
    float _968 = _966 * _910;
    float _970 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _972 = -_153;
    float _974 = fma(_946, _970, _972);
    float _976 = trunc(_916);
    int _978 = int(_976);
    float _980 = abs(_974);
    float _982 = _980 * _910;
    float _984 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _986 = -_153;
    float _988 = fma(_958, _984, _986);
    float _990 = exp2(_956);
    float _992 = abs(_988);
    float _994 = _992 * _910;
    float _996 = exp2(_968);
    int _998 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1000 = _978 + _998;
    int _1002 = _1000 + 1;
    bool _1004 = _1002 >= 0;
    float _1006 = trunc(_944);
    int _1008 = int(_1006);
    float _1010 = abs(_888);
    float _1012 = _1010 * _990;
    bool _1014 = _1002 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1016 = !_1004;
    bool _1018 = _1014 || _1016;
    float _1020 = exp2(_982);
    float _1022 = abs(_886);
    float _1024 = _1022 * _996;
    float _1026 = exp2(_994);
    int _1028 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1030 = _1008 + _1028;
    int _1032 = _1030 + 1;
    float _1034 = _1012 + _1024;
    bool _1036 = _1032 < 0;
    bool _1038 = _1036 || _1018;
    float _1040 = abs(_882);
    float _1042 = _1040 * _1020;
    bool _1044 = _1032 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1046 = _1044 || _1038;
    float _1048 = _1042 + _1034;
    float _1050 = abs(_892);
    float _1052 = _1050 * _1026;
    float _1054 = _1052 + _1048;
    float _1056 = _892;
    if (_1046)
    {
        _1056 = 1.0;
    }
    float _1058 = _1056;
    float _1060 = 1.0 / _1054;
    float _1062 = _1058;
    if (!_1046)
    {
        int _1064 = _1032 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1066 = _1064 + _1002;
        float _1068 = floor(_944);
        int _1070 = _1066 << 2;
        int _1072 = _1066 >> 2;
        int _1074 = 12 & _1070;
        int _1076 = _1072 << 4;
        int _1078 = _1076 + _1074;
        float _1080 = floor(_916);
        uint _1082 = uint(int(uint(_1078) >> uint(2)));
        uint _1084 = uint(int(uint(int(_1082)) >> uint(2)));
        int _1086 = int(_1082) & 3;
        float _1088 = (*spvDescriptorSet0.fp_c5)._m0[int(_1084)][_1086];
        float _1090 = -_1068;
        float _1092 = _944 + _1090;
        float _1094 = -_1080;
        float _1096 = _916 + _1094;
        float _1098 = rint(_1088);
        float _1100 = precise::max(_1098, 0.0);
        uint _1102 = uint(_1100);
        uint _1104 = clamp(_1102, 0u, 65535u);
        float3 _2959 = float3(_1096, _1092, float(int(_1104)));
        float3 _2961 = select(_2959, float3(0.0), isnan(_2959));
        float _1106 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2961.xy, uint(rint(_2961.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2961.xy, uint(rint(_2961.z)), level(0.0)).x;
        int _1108 = _1066 << 4;
        int _1110 = _1108 + 1648;
        int _1112 = _1078 + 8048;
        uint _1114 = uint(int(uint(_1112) >> uint(2)));
        uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
        int _1118 = int(_1114) & 3;
        float _1120 = (*spvDescriptorSet0.fp_c5)._m0[int(_1116)][_1118];
        uint _1122 = uint(int(uint(_1110) >> uint(2)));
        uint _1124 = uint(int(uint(int(_1122)) >> uint(2)));
        int _1126 = int(_1122) & 3;
        float _1128 = (*spvDescriptorSet0.fp_c5)._m0[int(_1124)][_1126];
        int _1130 = int(_1122) + 1;
        uint _1132 = uint(int(uint(_1130) >> uint(2)));
        int _1134 = _1130 & 3;
        float _1136 = (*spvDescriptorSet0.fp_c5)._m0[int(_1132)][_1134];
        int _1138 = _1110 + 8;
        uint _1140 = uint(int(uint(_1138) >> uint(2)));
        uint _1142 = uint(int(uint(int(_1140)) >> uint(2)));
        int _1144 = int(_1140) & 3;
        float _1146 = (*spvDescriptorSet0.fp_c5)._m0[int(_1142)][_1144];
        int _1148 = int(_1140) + 1;
        uint _1150 = uint(int(uint(_1148) >> uint(2)));
        int _1152 = _1148 & 3;
        float _1154 = (*spvDescriptorSet0.fp_c5)._m0[int(_1150)][_1152];
        float _1156 = _540 * _1136;
        float _1158 = 1.0 / _1120;
        float _1160 = fma(_536, _1128, _1156);
        float _1162 = _1120 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1164 = fma(_538, _1146, _1160);
        float _1166 = _1164 + _1154;
        float _1168 = precise::clamp(_1166, 0.0, 1.0);
        float _1170 = -_1168;
        float _1172 = _1170 + _1106;
        float _1174 = fma(_1158, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1172);
        float _1176 = _1162 * _1174;
        float _1178 = exp2(_1176);
        float _1180 = 0.0 + _1178;
        float _1182 = precise::clamp(_1180, 0.0, 1.0);
        _1062 = _1182;
    }
    float _1184 = _1062;
    float _1186 = _1024 * _1060;
    float _1188 = -_1052;
    bool _1190 = _1048 != _1188;
    bool _1192 = isnan(_1048);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(_1188);
    bool _1198 = _1194 || _1196;
    float _1200 = -_153;
    float _1202 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1204 = _1200 + _1202;
    float _1206 = precise::min(_1184, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1208 = _1012 * _1060;
    bool _1210 = _153 >= (-8000.0);
    bool _1212 = isnan(_153);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(-8000.0);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = _1204 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1224 = precise::clamp(_1222, 0.0, 1.0);
    float _1226 = _1198 ? _1186 : 0.25;
    float _1228 = _1042 * _1060;
    float _1230 = -_1206;
    float _1232 = _1230 + 1.0;
    float _1234 = _1198 ? _1208 : 0.25;
    float _1236 = _1220 * _906;
    float _1238 = _1226 * _816;
    float _1240 = _1226 * _826;
    float _1242 = _1052 * _1060;
    float _1244 = fma(_1224, _1232, _1206);
    float _1246 = _1198 ? _1228 : 0.25;
    float _1248 = fma(_1234, _814, _1238);
    float _1250 = _1236 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1252 = abs(_832);
    float _1254 = _1252 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1256 = -_800;
    float _1258 = _1256 + 1.0;
    float _1260 = fma(_1234, _824, _1240);
    float _1262 = -_153;
    float _1264 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1266 = _1262 + _1264;
    float _1268 = _1198 ? _1242 : 0.25;
    float _1270 = fma(_1246, _818, _1248);
    float _1272 = -_1254;
    float _1274 = fma(_1220, _1272, 1.0);
    float _1276 = _1258 * _1250;
    float _1278 = precise::clamp(_1276, 0.0, 1.0);
    float _1280 = fma(_1246, _828, _1260);
    float _1282 = fma(_1268, _820, _1270);
    float _1284 = _1266 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = -_1278;
    float _1290 = fma(_1288, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1292 = precise::min(_1274, 1.0);
    float _1294 = -_810;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(_1268, _830, _1280);
    float _1300 = precise::min(_1282, 1.0);
    float _1302 = precise::min(_1292, _1290);
    float _1304 = fma(_1286, _1296, _810);
    float _1306 = precise::min(_1298, 1.0);
    out.m_62.x = _1304;
    out.m_62.y = _1244;
    out.m_62.z = _1306;
    out.m_62.w = _1302;
    out.m_64.x = _1300;
    out.m_64.y = 0.5;
    out.m_64.z = 0.5;
    out.m_64.w = 1.0;
    return out;
}

