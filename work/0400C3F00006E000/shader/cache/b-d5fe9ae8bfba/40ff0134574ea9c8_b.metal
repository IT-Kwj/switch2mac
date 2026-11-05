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
    bool _845 = false;
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
    float2 _1109 = float2(_79, _81);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1109, float2(0.0), isnan(_1109))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1109, float2(0.0), isnan(_1109))).x;
    float _87 = _81 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1124 = float2(_83, _81);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1124, float2(0.0), isnan(_1124))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1124, float2(0.0), isnan(_1124))).x;
    float2 _1132 = float2(_79, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1132, float2(0.0), isnan(_1132))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1132, float2(0.0), isnan(_1132))).x;
    float _93 = in.m_47.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_47.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_49.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_49.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_51.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_51.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _77 * _115;
    float _131 = -_85;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _135 = _77 * _97;
    float _137 = 1.0 / _133;
    float _139 = -_89;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _143 = -_91;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _147 = _77 * _103;
    float _149 = _77 * _109;
    float _151 = 1.0 / _145;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _155 = _137 * _153;
    float _157 = 1.0 / _141;
    float _159 = _77 * _121;
    float _161 = _77 * _127;
    float _163 = _155 * _135;
    float _165 = _155 * _147;
    float _167 = _163 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _169 = _163 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _171 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[32].x, _167);
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _175 = _151 * _173;
    float _177 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[30].x, _169);
    float _179 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[32].z, _171);
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = _157 * _181;
    float _185 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[30].z, _177);
    float _187 = -_165;
    float _189 = fma(_175, _159, _187);
    float _191 = _179 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _193 = -_165;
    float _195 = fma(_183, _149, _193);
    float _197 = _185 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _199 = -_163;
    float _201 = fma(_183, _129, _199);
    float _203 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _205 = _191 + _203;
    float _207 = -_155;
    float _209 = _207 + _183;
    float _211 = -_163;
    float _213 = fma(_175, _161, _211);
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _217 = _197 + _215;
    float _219 = _205 * _205;
    float _221 = -_155;
    float _223 = _221 + _175;
    float _225 = _209 * _189;
    float _227 = fma(_217, _217, _219);
    float _229 = _201 * _223;
    float _231 = -_225;
    float _233 = fma(_195, _223, _231);
    float _235 = _195 * _213;
    float _237 = sqrt(_227);
    float _239 = -_229;
    float _241 = fma(_209, _213, _239);
    float _243 = _233 * _233;
    float _245 = -_235;
    float _247 = fma(_201, _189, _245);
    float _249 = _163 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _251 = fma(_241, _241, _243);
    float _253 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[31].x, _249);
    float _255 = fma(_247, _247, _251);
    float _257 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].z, _253);
    float _259 = rsqrt(_255);
    bool _263 = _237 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _265 = _257 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _267 = _255;
    float _269 = _191;
    float _271 = _155;
    if (!_263)
    {
        _267 = _265;
    }
    float _273 = _267;
    float _275 = _241 * _259;
    float _277 = _233 * _259;
    float _279 = _247 * _259;
    float _281 = _259;
    float _283 = _273;
    if (!_263)
    {
        _281 = _197;
    }
    float _285 = _281;
    bool _287 = !_263;
    float _289 = _285;
    if (!_287)
    {
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _293 = _237 + _291;
        float _295 = _265 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = rsqrt(_227);
        float _299 = -_265;
        float _301 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _303 = _299 + _301;
        float _305 = abs(_295);
        float _307 = abs(_293);
        float _309 = precise::max(_305, _307);
        float _311 = _303 * _303;
        bool _313 = _309 >= 16.0;
        float _315 = _217 * _297;
        float _317 = _205 * _297;
        float _319 = -_217;
        float _321 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[41].z, _319);
        float _323 = -_205;
        float _325 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _323);
        float _327 = _293;
        float _329 = _295;
        int _332 = as_type<int>(_303);
        float _334 = _325;
        if (_313)
        {
            float _336 = _293 * 0.0625;
            _327 = _336;
        }
        float _338 = _327;
        if (_313)
        {
            float _340 = _295 * 0.0625;
            _329 = _340;
        }
        float _342 = _329;
        float _344 = fma(_321, _321, _311);
        float _346 = abs(_338);
        bool _348 = _346 != 0.0;
        bool _350 = isnan(_346);
        bool _352 = _348 || _350;
        bool _354 = isnan(0.0);
        bool _356 = _352 || _354;
        float _358 = fma(_325, _325, _344);
        float _360 = abs(_342);
        bool _362 = _360 == 0.0;
        float _364 = abs(_342);
        bool _366 = _364 == 0.0;
        bool _368 = !_356;
        bool _370 = _366 && _368;
        float _372 = sqrt(_358);
        bool _374 = false;
        int _376 = as_type<int>(_358);
        if (_370)
        {
            bool _378 = as_type<int>(_342) >= 0;
            _374 = _378;
        }
        bool _380 = _374;
        int _382 = _380 ? (-1) : 0;
        if (_370)
        {
            int _384 = _380 ? 0 : 1078530011;
            _332 = _384;
        }
        int _386 = _332;
        if (_370)
        {
            int _388 = int(0x80000000) & as_type<int>(_338);
            int _390 = _386 | _388;
            _334 = as_type<float>(_390);
        }
        float _392 = _334;
        bool _394 = !_356;
        bool _396 = _394 && _362;
        float _398 = _392;
        float _400 = _392;
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
                _382 = _426 ? (-1) : 0;
            }
            int _428 = _382;
            if (_424)
            {
                _376 = 1075235812;
            }
            int _430 = _376;
            int _432 = _430;
            if (_424)
            {
                int _434 = ~_428;
                int _436 = (_434 != 0) ? _430 : 1061752795;
                _432 = _436;
            }
            int _438 = _432;
            if (_424)
            {
                int _440 = int(0x80000000) & as_type<int>(_338);
                int _442 = _438 | _440;
                _398 = as_type<float>(_442);
            }
            float _444 = _398;
            bool _446 = !_412;
            bool _448 = _446 && _416;
            _400 = _444;
            if (!_448)
            {
                float _450 = abs(_338);
                float _452 = abs(_342);
                float _454 = precise::max(_450, _452);
                float _456 = abs(_338);
                float _458 = abs(_342);
                float _460 = precise::min(_456, _458);
                float _462 = 1.0 / _454;
                float _464 = abs(_338);
                float _466 = abs(_342);
                bool _468 = _464 > _466;
                bool _470 = as_type<int>(_342) >= 0;
                float _472 = _460 * _462;
                float _474 = abs(_338);
                float _476 = abs(_342);
                float _478 = _474 + _476;
                int _480 = as_type<int>(_338) & int(0x80000000);
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
                _400 = _478;
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
                    _400 = as_type<float>(_528);
                }
            }
        }
        float _530 = _400;
        float _532 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _534 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _536 = _372 + _534;
        float _538 = fma(_315, _532, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _540 = fma(_317, _532, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _283 = _536;
        _289 = _538;
        _269 = _540;
    }
    float _542 = _283;
    float _544 = _289;
    float _546 = _269;
    float2 _1820 = float2(_79, _81);
    float _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1820, float2(0.0), isnan(_1820))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1820, float2(0.0), isnan(_1820))).x;
    float _550 = _277 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _552 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].x, _550);
    float _554 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].z, _552);
    float _556 = -_554;
    float _558 = fma(_556, _554, 1.0);
    float _560 = -_554;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[35].z, _279);
    float _564 = -_554;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].y, _277);
    float _568 = _558 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _570 = fma(_562, _568, _155);
    float _572 = -_554;
    float _574 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[35].x, _275);
    float _576 = fma(_566, _568, _163);
    float _578 = -_570;
    bool _580 = _578 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _582 = float(_580);
    float _584 = fma(_574, _568, _165);
    float _586 = -_570;
    bool _588 = _586 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _590 = float(_588);
    float _592 = _582 + _590;
    float _594 = precise::min(_592, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _596 = trunc(_594);
    int _598 = int(_596);
    int _600 = _598 << 6;
    bool _602 = _598 != 0;
    int _604 = _600 + 48;
    uint _607 = uint(int(uint(_604) >> uint(2)));
    uint _609 = uint(int(uint(int(_607)) >> uint(2)));
    int _611 = int(_607) & 3;
    float _613 = (*spvDescriptorSet0.fp_c3)._m0[int(_609)][_611];
    int _615 = int(_607) + 1;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    int _619 = _615 & 3;
    float _621 = (*spvDescriptorSet0.fp_c3)._m0[int(_617)][_619];
    int _623 = _600 + 56;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    uint _627 = uint(int(uint(int(_625)) >> uint(2)));
    int _629 = int(_625) & 3;
    float _631 = (*spvDescriptorSet0.fp_c3)._m0[int(_627)][_629];
    int _633 = int(_625) + 1;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    int _637 = _633 & 3;
    float _639 = (*spvDescriptorSet0.fp_c3)._m0[int(_635)][_637];
    uint _641 = uint(int(uint(_600) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.fp_c3)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.fp_c3)._m0[int(_651)][_653];
    int _657 = _600 + 16;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = _600 + 32;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.fp_c3)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = _600 + 8;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.fp_c3)._m0[int(_697)][_699];
    int _703 = int(_695) + 1;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    int _707 = _703 & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = _600 + 24;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    float _729 = _576 * _621;
    float _731 = fma(_584, _613, _729);
    int _733 = _600 + 40;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    float _751 = fma(_570, _631, _731);
    float _753 = _751 + _639;
    float _755 = _576 * _655;
    float _757 = 1.0 / _753;
    float _759 = fma(_584, _647, _755);
    float _761 = _576 * _673;
    float _763 = fma(_584, _665, _761);
    float _765 = _576 * _691;
    float _767 = fma(_584, _683, _765);
    float _769 = fma(_570, _701, _759);
    float _771 = _769 + _709;
    float _773 = fma(_570, _719, _763);
    float _775 = _771 * _757;
    float _777 = _773 + _727;
    float _779 = fma(_570, _741, _767);
    float _781 = _777 * _757;
    float _783 = _779 + _749;
    float _785 = _783 * _757;
    float _787 = precise::clamp(_785, 0.0, 1.0);
    float _843;
    if (!_602)
    {
        float _789 = rint(_594);
        float _791 = precise::max(_789, 0.0);
        uint _793 = uint(_791);
        uint _795 = clamp(_793, 0u, 65535u);
        float _797 = _787 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _799 = fma(_797, 0.5, _781);
        float _801 = fma(_797, 0.5, _775);
        float _803 = fma(_797, -0.5, _775);
        float _805 = fma(_797, -0.5, _781);
        float3 _2267 = float3(_775, _799, float(int(_795)));
        float3 _2271 = select(_2267, float3(0.0), isnan(_2267));
        float _807 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2271.xy, uint(rint(_2271.z)), _787);
        float3 _2280 = float3(_801, _799, float(int(_795)));
        float3 _2282 = select(_2280, float3(0.0), isnan(_2280));
        float _809 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2282.xy, uint(rint(_2282.z)), _787);
        float3 _2291 = float3(_803, _799, float(int(_795)));
        float3 _2293 = select(_2291, float3(0.0), isnan(_2291));
        float _811 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2293.xy, uint(rint(_2293.z)), _787);
        float3 _2302 = float3(_801, _781, float(int(_795)));
        float3 _2304 = select(_2302, float3(0.0), isnan(_2302));
        float _813 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2304.xy, uint(rint(_2304.z)), _787);
        float3 _2313 = float3(_775, _781, float(int(_795)));
        float3 _2315 = select(_2313, float3(0.0), isnan(_2313));
        float _815 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2315.xy, uint(rint(_2315.z)), _787);
        float3 _2324 = float3(_803, _781, float(int(_795)));
        float3 _2326 = select(_2324, float3(0.0), isnan(_2324));
        float _817 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2326.xy, uint(rint(_2326.z)), _787);
        float3 _2335 = float3(_801, _805, float(int(_795)));
        float3 _2337 = select(_2335, float3(0.0), isnan(_2335));
        float _819 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2337.xy, uint(rint(_2337.z)), _787);
        float3 _2346 = float3(_775, _805, float(int(_795)));
        float3 _2348 = select(_2346, float3(0.0), isnan(_2346));
        float _821 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2348.xy, uint(rint(_2348.z)), _787);
        float3 _2357 = float3(_803, _805, float(int(_795)));
        float3 _2359 = select(_2357, float3(0.0), isnan(_2357));
        float _823 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2359.xy, uint(rint(_2359.z)), _787);
        float _825 = _809 + _807;
        float _827 = _825 + _811;
        float _829 = _827 + _813;
        float _831 = _829 + _815;
        float _833 = _831 + _817;
        float _835 = _833 + _819;
        float _837 = _835 + _821;
        float _839 = _837 + _823;
        float _841 = _839 * 0.111111111938953399658203125;
        _843 = _841;
        _845 = true;
    }
    else
    {
        float _847 = rint(_594);
        float _849 = precise::max(_847, 0.0);
        uint _851 = uint(_849);
        uint _853 = clamp(_851, 0u, 65535u);
        float3 _2406 = float3(_775, _781, float(int(_853)));
        float3 _2408 = select(_2406, float3(0.0), isnan(_2406));
        float _855 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2408.xy, uint(rint(_2408.z)), _787);
        _843 = _855;
    }
    _845 = false;
    float _857 = _843;
    float _859 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _861 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _863 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].x, _859);
    float _865 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].x, _861);
    float _867 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].z, _863);
    float _869 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].z, _865);
    float _871 = _867 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _873 = _869 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _875 = trunc(_871);
    int _877 = int(_875);
    float _879 = trunc(_873);
    int _881 = int(_879);
    int _883 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _885 = _877 + _883;
    int _887 = _885 + 1;
    float _889 = -_155;
    float _891 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _893 = _889 + _891;
    bool _895 = _887 >= 0;
    int _897 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _899 = _881 + _897;
    int _901 = _899 + 1;
    float _903 = -_155;
    float _905 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _907 = _903 + _905;
    bool _909 = _887 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _911 = !_895;
    bool _913 = _909 || _911;
    bool _915 = _901 < 0;
    bool _917 = _915 || _913;
    bool _919 = _901 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _921 = _919 || _917;
    if (_921)
    {
        _271 = 1.0;
    }
    float _923 = _271;
    float _925 = _923;
    if (!_921)
    {
        int _927 = _901 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _929 = _927 + _887;
        float _931 = floor(_873);
        int _933 = _929 << 2;
        int _935 = _929 >> 2;
        int _937 = 12 & _933;
        int _939 = _935 << 4;
        int _941 = _939 + _937;
        float _943 = floor(_871);
        uint _945 = uint(int(uint(_941) >> uint(2)));
        uint _947 = uint(int(uint(int(_945)) >> uint(2)));
        int _949 = int(_945) & 3;
        float _951 = (*spvDescriptorSet0.fp_c5)._m0[int(_947)][_949];
        float _953 = -_931;
        float _955 = _873 + _953;
        float _957 = -_943;
        float _959 = _871 + _957;
        float _961 = rint(_951);
        float _963 = precise::max(_961, 0.0);
        uint _965 = uint(_963);
        uint _967 = clamp(_965, 0u, 65535u);
        float3 _2593 = float3(_959, _955, float(int(_967)));
        float3 _2595 = select(_2593, float3(0.0), isnan(_2593));
        float _969 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2595.xy, uint(rint(_2595.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2595.xy, uint(rint(_2595.z)), level(0.0)).x;
        int _971 = _929 << 4;
        int _973 = _971 + 1648;
        int _975 = _941 + 8048;
        uint _977 = uint(int(uint(_975) >> uint(2)));
        uint _979 = uint(int(uint(int(_977)) >> uint(2)));
        int _981 = int(_977) & 3;
        float _983 = (*spvDescriptorSet0.fp_c5)._m0[int(_979)][_981];
        uint _985 = uint(int(uint(_973) >> uint(2)));
        uint _987 = uint(int(uint(int(_985)) >> uint(2)));
        int _989 = int(_985) & 3;
        float _991 = (*spvDescriptorSet0.fp_c5)._m0[int(_987)][_989];
        int _993 = int(_985) + 1;
        uint _995 = uint(int(uint(_993) >> uint(2)));
        int _997 = _993 & 3;
        float _999 = (*spvDescriptorSet0.fp_c5)._m0[int(_995)][_997];
        int _1001 = _973 + 8;
        uint _1003 = uint(int(uint(_1001) >> uint(2)));
        uint _1005 = uint(int(uint(int(_1003)) >> uint(2)));
        int _1007 = int(_1003) & 3;
        float _1009 = (*spvDescriptorSet0.fp_c5)._m0[int(_1005)][_1007];
        int _1011 = int(_1003) + 1;
        uint _1013 = uint(int(uint(_1011) >> uint(2)));
        int _1015 = _1011 & 3;
        float _1017 = (*spvDescriptorSet0.fp_c5)._m0[int(_1013)][_1015];
        float _1019 = _983 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1021 = _542 * _999;
        float _1023 = fma(_544, _991, _1021);
        float _1025 = 1.0 / _983;
        float _1027 = fma(_546, _1009, _1023);
        float _1029 = _1027 + _1017;
        float _1031 = precise::clamp(_1029, 0.0, 1.0);
        float _1033 = -_1031;
        float _1035 = _1033 + _969;
        float _1037 = fma(_1025, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1035);
        float _1039 = _1019 * _1037;
        float _1041 = exp2(_1039);
        float _1043 = 0.0 + _1041;
        float _1045 = precise::clamp(_1043, 0.0, 1.0);
        _925 = _1045;
    }
    float _1047 = _925;
    float _1049 = precise::min(_1047, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1051 = _893 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1053 = precise::clamp(_1051, 0.0, 1.0);
    float _1055 = -_857;
    float _1057 = _1055 + 1.0;
    float _1059 = _907 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1061 = precise::clamp(_1059, 0.0, 1.0);
    float _1063 = -_1049;
    float _1065 = _1063 + 1.0;
    float _1067 = fma(_1053, _1057, _857);
    float _1069 = fma(_1061, _1065, _1049);
    out.m_54.x = _1067;
    out.m_54.y = _1069;
    out.m_54.z = 1.0;
    out.m_54.w = 1.0;
    out.m_56.x = _548;
    out.m_56.y = 0.5;
    out.m_56.z = 0.5;
    out.m_56.w = 1.0;
    return out;
}

