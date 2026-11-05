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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
    float4 m_56 [[color(1)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _833 = false;
    float _63 = gl_FragCoord.w;
    float _65 = in.m_45.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_45.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float _83 = _79 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1097 = float2(_79, _81);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1097, float2(0.0), isnan(_1097))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1097, float2(0.0), isnan(_1097))).x;
    float _87 = _81 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1112 = float2(_83, _81);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1112, float2(0.0), isnan(_1112))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1112, float2(0.0), isnan(_1112))).x;
    float2 _1120 = float2(_79, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1120, float2(0.0), isnan(_1120))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1120, float2(0.0), isnan(_1120))).x;
    float _93 = in.m_47.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_47.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_49.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_49.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_51.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_51.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _77 * _97;
    float _131 = _77 * _103;
    float _133 = _77 * _109;
    float _135 = _77 * _115;
    float _137 = _77 * _121;
    float _139 = _77 * _127;
    float _141 = -_85;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[41].x, _143);
    float _147 = _145 * _129;
    float _149 = _145 * _131;
    float _151 = _147 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _153 = -_89;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].x, _155);
    float _159 = _147 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _161 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[32].x, _151);
    float _163 = -_91;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _167 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[41].x, _165);
    float _169 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[30].x, _159);
    float _171 = -_149;
    float _173 = fma(_157, _135, _171);
    float _175 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[32].z, _161);
    float _177 = -_147;
    float _179 = fma(_157, _133, _177);
    float _181 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[30].z, _169);
    float _183 = -_149;
    float _185 = fma(_167, _137, _183);
    float _187 = _175 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _189 = -_145;
    float _191 = _189 + _157;
    float _193 = _181 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _195 = -_147;
    float _197 = fma(_167, _139, _195);
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _201 = _187 + _199;
    float _203 = -_145;
    float _205 = _203 + _167;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _209 = _193 + _207;
    float _211 = _191 * _185;
    float _213 = _201 * _201;
    float _215 = _179 * _205;
    float _217 = -_211;
    float _219 = fma(_173, _205, _217);
    float _221 = fma(_209, _209, _213);
    float _223 = -_215;
    float _225 = fma(_191, _197, _223);
    float _227 = _173 * _197;
    float _229 = _219 * _219;
    float _231 = sqrt(_221);
    float _233 = -_227;
    float _235 = fma(_179, _185, _233);
    float _237 = fma(_225, _225, _229);
    float _239 = _147 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _241 = fma(_235, _235, _237);
    float _243 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[31].x, _239);
    float _245 = rsqrt(_241);
    float _247 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[31].z, _243);
    bool _251 = _231 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _253 = _247 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _255 = _225 * _245;
    float _257 = _219 * _245;
    float _259 = _235 * _245;
    float _261 = _245;
    float _263 = _241;
    float _265 = _187;
    float _267 = _145;
    if (!_251)
    {
        _261 = _193;
    }
    float _269 = _261;
    float _271 = _269;
    if (!_251)
    {
        _263 = _253;
    }
    float _273 = _263;
    bool _275 = !_251;
    float _277 = _273;
    if (!_275)
    {
        float _279 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _281 = _231 + _279;
        float _283 = _253 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _285 = rsqrt(_221);
        float _287 = -_253;
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = _287 + _289;
        float _293 = abs(_283);
        float _295 = abs(_281);
        float _297 = precise::max(_293, _295);
        float _299 = _291 * _291;
        bool _301 = _297 >= 16.0;
        float _303 = _209 * _285;
        float _305 = _201 * _285;
        float _307 = -_209;
        float _309 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[41].z, _307);
        float _311 = -_201;
        float _313 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[41].z, _311);
        float _315 = _281;
        float _317 = _283;
        int _320 = as_type<int>(_291);
        float _322 = _313;
        if (_301)
        {
            float _324 = _281 * 0.0625;
            _315 = _324;
        }
        float _326 = _315;
        if (_301)
        {
            float _328 = _283 * 0.0625;
            _317 = _328;
        }
        float _330 = _317;
        float _332 = fma(_309, _309, _299);
        float _334 = abs(_326);
        bool _336 = _334 != 0.0;
        bool _338 = isnan(_334);
        bool _340 = _336 || _338;
        bool _342 = isnan(0.0);
        bool _344 = _340 || _342;
        float _346 = fma(_313, _313, _332);
        float _348 = abs(_330);
        bool _350 = _348 == 0.0;
        float _352 = abs(_330);
        bool _354 = _352 == 0.0;
        bool _356 = !_344;
        bool _358 = _354 && _356;
        float _360 = sqrt(_346);
        bool _362 = false;
        int _364 = as_type<int>(_346);
        if (_358)
        {
            bool _366 = as_type<int>(_330) >= 0;
            _362 = _366;
        }
        bool _368 = _362;
        int _370 = _368 ? (-1) : 0;
        if (_358)
        {
            int _372 = _368 ? 0 : 1078530011;
            _320 = _372;
        }
        int _374 = _320;
        if (_358)
        {
            int _376 = int(0x80000000) & as_type<int>(_326);
            int _378 = _374 | _376;
            _322 = as_type<float>(_378);
        }
        float _380 = _322;
        bool _382 = !_344;
        bool _384 = _382 && _350;
        float _386 = _380;
        float _388 = _380;
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
                int _428 = int(0x80000000) & as_type<int>(_326);
                int _430 = _426 | _428;
                _386 = as_type<float>(_430);
            }
            float _432 = _386;
            bool _434 = !_400;
            bool _436 = _434 && _404;
            _388 = _432;
            if (!_436)
            {
                float _438 = abs(_326);
                float _440 = abs(_330);
                float _442 = precise::max(_438, _440);
                float _444 = abs(_326);
                float _446 = abs(_330);
                float _448 = precise::min(_444, _446);
                float _450 = 1.0 / _442;
                float _452 = abs(_326);
                float _454 = abs(_330);
                bool _456 = _452 > _454;
                bool _458 = as_type<int>(_330) >= 0;
                float _460 = _448 * _450;
                float _462 = abs(_326);
                float _464 = abs(_330);
                float _466 = _462 + _464;
                int _468 = as_type<int>(_326) & int(0x80000000);
                float _470 = _460 * _460;
                bool _472 = _466 > as_type<float>(0x7f800000u /* inf */);
                bool _474 = isnan(_466);
                bool _476 = _472 || _474;
                bool _478 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _480 = _476 || _478;
                float _482 = _470 + 11.33538818359375;
                float _484 = fma(_470, _482, 28.84246826171875);
                float _486 = fma(_470, _484, 19.6966705322265625);
                float _488 = fma(_470, -0.82336294651031494140625, -5.674867153167724609375);
                float _490 = fma(_470, _488, -6.565555095672607421875);
                float _492 = 1.0 / _486;
                float _494 = _470 * _490;
                float _496 = _460 * _494;
                float _498 = fma(_496, _492, _460);
                float _500 = _498;
                _388 = _466;
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
                if (!_480)
                {
                    int _516 = _468 | _514;
                    _388 = as_type<float>(_516);
                }
            }
        }
        float _518 = _388;
        float _520 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _522 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _524 = _360 + _522;
        float _526 = fma(_303, _520, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _528 = fma(_305, _520, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _277 = _524;
        _271 = _526;
        _265 = _528;
    }
    float _530 = _277;
    float _532 = _271;
    float _534 = _265;
    float2 _1796 = float2(_79, _81);
    float _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1796, float2(0.0), isnan(_1796))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1796, float2(0.0), isnan(_1796))).x;
    float _538 = _257 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _540 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[35].x, _538);
    float _542 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[35].z, _540);
    float _544 = -_542;
    float _546 = fma(_544, _542, 1.0);
    float _548 = -_542;
    float _550 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[35].z, _259);
    float _552 = -_542;
    float _554 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[35].y, _257);
    float _556 = _546 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _558 = fma(_550, _556, _145);
    float _560 = -_542;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[35].x, _255);
    float _564 = fma(_554, _556, _147);
    float _566 = -_558;
    bool _568 = _566 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _570 = float(_568);
    float _572 = fma(_562, _556, _149);
    float _574 = -_558;
    bool _576 = _574 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _578 = float(_576);
    float _580 = _570 + _578;
    float _582 = precise::min(_580, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _584 = trunc(_582);
    int _586 = int(_584);
    int _588 = _586 << 6;
    bool _590 = _586 != 0;
    int _592 = _588 + 48;
    uint _595 = uint(int(uint(_592) >> uint(2)));
    uint _597 = uint(int(uint(int(_595)) >> uint(2)));
    int _599 = int(_595) & 3;
    float _601 = (*spvDescriptorSet0.fp_c3)._m0[int(_597)][_599];
    int _603 = int(_595) + 1;
    uint _605 = uint(int(uint(_603) >> uint(2)));
    int _607 = _603 & 3;
    float _609 = (*spvDescriptorSet0.fp_c3)._m0[int(_605)][_607];
    int _611 = _588 + 56;
    uint _613 = uint(int(uint(_611) >> uint(2)));
    uint _615 = uint(int(uint(int(_613)) >> uint(2)));
    int _617 = int(_613) & 3;
    float _619 = (*spvDescriptorSet0.fp_c3)._m0[int(_615)][_617];
    int _621 = int(_613) + 1;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    int _625 = _621 & 3;
    float _627 = (*spvDescriptorSet0.fp_c3)._m0[int(_623)][_625];
    uint _629 = uint(int(uint(_588) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    int _637 = int(_629) + 1;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    int _641 = _637 & 3;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[int(_639)][_641];
    int _645 = _588 + 16;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = _588 + 32;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    uint _667 = uint(int(uint(int(_665)) >> uint(2)));
    int _669 = int(_665) & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = int(_665) + 1;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    int _677 = _673 & 3;
    float _679 = (*spvDescriptorSet0.fp_c3)._m0[int(_675)][_677];
    int _681 = _588 + 8;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    uint _685 = uint(int(uint(int(_683)) >> uint(2)));
    int _687 = int(_683) & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    int _691 = int(_683) + 1;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    int _695 = _691 & 3;
    float _697 = (*spvDescriptorSet0.fp_c3)._m0[int(_693)][_695];
    int _699 = _588 + 24;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    uint _703 = uint(int(uint(int(_701)) >> uint(2)));
    int _705 = int(_701) & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    int _709 = int(_701) + 1;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    int _713 = _709 & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    float _717 = _564 * _609;
    float _719 = fma(_572, _601, _717);
    int _721 = _588 + 40;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.fp_c3)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.fp_c3)._m0[int(_733)][_735];
    float _739 = fma(_558, _619, _719);
    float _741 = _739 + _627;
    float _743 = _564 * _643;
    float _745 = 1.0 / _741;
    float _747 = fma(_572, _635, _743);
    float _749 = _564 * _661;
    float _751 = fma(_572, _653, _749);
    float _753 = _564 * _679;
    float _755 = fma(_572, _671, _753);
    float _757 = fma(_558, _689, _747);
    float _759 = _757 + _697;
    float _761 = fma(_558, _707, _751);
    float _763 = _759 * _745;
    float _765 = _761 + _715;
    float _767 = fma(_558, _729, _755);
    float _769 = _765 * _745;
    float _771 = _767 + _737;
    float _773 = _771 * _745;
    float _775 = precise::clamp(_773, 0.0, 1.0);
    float _831;
    if (!_590)
    {
        float _777 = rint(_582);
        float _779 = precise::max(_777, 0.0);
        uint _781 = uint(_779);
        uint _783 = clamp(_781, 0u, 65535u);
        float _785 = _775 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _787 = fma(_785, 0.5, _769);
        float _789 = fma(_785, 0.5, _763);
        float _791 = fma(_785, -0.5, _763);
        float _793 = fma(_785, -0.5, _769);
        float3 _2243 = float3(_763, _787, float(int(_783)));
        float3 _2247 = select(_2243, float3(0.0), isnan(_2243));
        float _795 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2247.xy, uint(rint(_2247.z)), _775);
        float3 _2256 = float3(_789, _787, float(int(_783)));
        float3 _2258 = select(_2256, float3(0.0), isnan(_2256));
        float _797 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2258.xy, uint(rint(_2258.z)), _775);
        float3 _2267 = float3(_791, _787, float(int(_783)));
        float3 _2269 = select(_2267, float3(0.0), isnan(_2267));
        float _799 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2269.xy, uint(rint(_2269.z)), _775);
        float3 _2278 = float3(_789, _769, float(int(_783)));
        float3 _2280 = select(_2278, float3(0.0), isnan(_2278));
        float _801 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2280.xy, uint(rint(_2280.z)), _775);
        float3 _2289 = float3(_763, _769, float(int(_783)));
        float3 _2291 = select(_2289, float3(0.0), isnan(_2289));
        float _803 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2291.xy, uint(rint(_2291.z)), _775);
        float3 _2300 = float3(_791, _769, float(int(_783)));
        float3 _2302 = select(_2300, float3(0.0), isnan(_2300));
        float _805 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2302.xy, uint(rint(_2302.z)), _775);
        float3 _2311 = float3(_789, _793, float(int(_783)));
        float3 _2313 = select(_2311, float3(0.0), isnan(_2311));
        float _807 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2313.xy, uint(rint(_2313.z)), _775);
        float3 _2322 = float3(_763, _793, float(int(_783)));
        float3 _2324 = select(_2322, float3(0.0), isnan(_2322));
        float _809 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2324.xy, uint(rint(_2324.z)), _775);
        float3 _2333 = float3(_791, _793, float(int(_783)));
        float3 _2335 = select(_2333, float3(0.0), isnan(_2333));
        float _811 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2335.xy, uint(rint(_2335.z)), _775);
        float _813 = _797 + _795;
        float _815 = _813 + _799;
        float _817 = _815 + _801;
        float _819 = _817 + _803;
        float _821 = _819 + _805;
        float _823 = _821 + _807;
        float _825 = _823 + _809;
        float _827 = _825 + _811;
        float _829 = _827 * 0.111111111938953399658203125;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = rint(_582);
        float _837 = precise::max(_835, 0.0);
        uint _839 = uint(_837);
        uint _841 = clamp(_839, 0u, 65535u);
        float3 _2382 = float3(_763, _769, float(int(_841)));
        float3 _2384 = select(_2382, float3(0.0), isnan(_2382));
        float _843 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2384.xy, uint(rint(_2384.z)), _775);
        _831 = _843;
    }
    _833 = false;
    float _845 = _831;
    float _847 = _530 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _849 = _530 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _851 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[101].x, _847);
    float _853 = fma(_532, (*spvDescriptorSet0.fp_c5)._m0[102].x, _849);
    float _855 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[101].z, _851);
    float _857 = fma(_534, (*spvDescriptorSet0.fp_c5)._m0[102].z, _853);
    float _859 = _855 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _861 = _857 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _863 = trunc(_859);
    int _865 = int(_863);
    float _867 = trunc(_861);
    int _869 = int(_867);
    int _871 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _873 = _865 + _871;
    int _875 = _873 + 1;
    float _877 = -_145;
    float _879 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _881 = _877 + _879;
    bool _883 = _875 >= 0;
    int _885 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _887 = _869 + _885;
    int _889 = _887 + 1;
    float _891 = -_145;
    float _893 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _895 = _891 + _893;
    bool _897 = _875 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _899 = !_883;
    bool _901 = _897 || _899;
    bool _903 = _889 < 0;
    bool _905 = _903 || _901;
    bool _907 = _889 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _909 = _907 || _905;
    if (_909)
    {
        _267 = 1.0;
    }
    float _911 = _267;
    float _913 = _911;
    if (!_909)
    {
        int _915 = _889 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _917 = _915 + _875;
        float _919 = floor(_861);
        int _921 = _917 << 2;
        int _923 = _917 >> 2;
        int _925 = 12 & _921;
        int _927 = _923 << 4;
        int _929 = _927 + _925;
        float _931 = floor(_859);
        uint _933 = uint(int(uint(_929) >> uint(2)));
        uint _935 = uint(int(uint(int(_933)) >> uint(2)));
        int _937 = int(_933) & 3;
        float _939 = (*spvDescriptorSet0.fp_c5)._m0[int(_935)][_937];
        float _941 = -_919;
        float _943 = _861 + _941;
        float _945 = -_931;
        float _947 = _859 + _945;
        float _949 = rint(_939);
        float _951 = precise::max(_949, 0.0);
        uint _953 = uint(_951);
        uint _955 = clamp(_953, 0u, 65535u);
        float3 _2569 = float3(_947, _943, float(int(_955)));
        float3 _2571 = select(_2569, float3(0.0), isnan(_2569));
        float _957 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2571.xy, uint(rint(_2571.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2571.xy, uint(rint(_2571.z)), level(0.0)).x;
        int _959 = _917 << 4;
        int _961 = _959 + 1648;
        int _963 = _929 + 8048;
        uint _965 = uint(int(uint(_963) >> uint(2)));
        uint _967 = uint(int(uint(int(_965)) >> uint(2)));
        int _969 = int(_965) & 3;
        float _971 = (*spvDescriptorSet0.fp_c5)._m0[int(_967)][_969];
        uint _973 = uint(int(uint(_961) >> uint(2)));
        uint _975 = uint(int(uint(int(_973)) >> uint(2)));
        int _977 = int(_973) & 3;
        float _979 = (*spvDescriptorSet0.fp_c5)._m0[int(_975)][_977];
        int _981 = int(_973) + 1;
        uint _983 = uint(int(uint(_981) >> uint(2)));
        int _985 = _981 & 3;
        float _987 = (*spvDescriptorSet0.fp_c5)._m0[int(_983)][_985];
        int _989 = _961 + 8;
        uint _991 = uint(int(uint(_989) >> uint(2)));
        uint _993 = uint(int(uint(int(_991)) >> uint(2)));
        int _995 = int(_991) & 3;
        float _997 = (*spvDescriptorSet0.fp_c5)._m0[int(_993)][_995];
        int _999 = int(_991) + 1;
        uint _1001 = uint(int(uint(_999) >> uint(2)));
        int _1003 = _999 & 3;
        float _1005 = (*spvDescriptorSet0.fp_c5)._m0[int(_1001)][_1003];
        float _1007 = _971 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1009 = _530 * _987;
        float _1011 = fma(_532, _979, _1009);
        float _1013 = 1.0 / _971;
        float _1015 = fma(_534, _997, _1011);
        float _1017 = _1015 + _1005;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        float _1021 = -_1019;
        float _1023 = _1021 + _957;
        float _1025 = fma(_1013, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1023);
        float _1027 = _1007 * _1025;
        float _1029 = exp2(_1027);
        float _1031 = 0.0 + _1029;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        _913 = _1033;
    }
    float _1035 = _913;
    float _1037 = precise::min(_1035, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1039 = _881 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1041 = precise::clamp(_1039, 0.0, 1.0);
    float _1043 = -_845;
    float _1045 = _1043 + 1.0;
    float _1047 = _895 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1049 = precise::clamp(_1047, 0.0, 1.0);
    float _1051 = -_1037;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_1041, _1045, _845);
    float _1057 = fma(_1049, _1053, _1037);
    out.m_54.x = _1055;
    out.m_54.y = _1057;
    out.m_54.z = 1.0;
    out.m_54.w = 1.0;
    out.m_56.x = _536;
    out.m_56.y = 0.5;
    out.m_56.z = 0.5;
    out.m_56.w = 1.0;
    return out;
}

