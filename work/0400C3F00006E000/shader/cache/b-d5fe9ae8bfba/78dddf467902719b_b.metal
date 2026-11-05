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
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
    float4 m_54 [[color(1)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_43.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_43.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float _81 = _77 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1070 = float2(_77, _79);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1070, float2(0.0), isnan(_1070))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1070, float2(0.0), isnan(_1070))).x;
    float _85 = _79 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1085 = float2(_81, _79);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1085, float2(0.0), isnan(_1085))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1085, float2(0.0), isnan(_1085))).x;
    float2 _1093 = float2(_77, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1093, float2(0.0), isnan(_1093))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1093, float2(0.0), isnan(_1093))).x;
    float _91 = in.m_45.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_45.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_47.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_47.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_49.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_49.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _75 * _95;
    float _129 = _75 * _101;
    float _131 = _75 * _107;
    float _133 = _75 * _113;
    float _135 = _75 * _119;
    float _137 = _75 * _125;
    float _139 = -_83;
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _143 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[41].x, _141);
    float _145 = _143 * _127;
    float _147 = _143 * _129;
    float _149 = -_87;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _153 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].x, _151);
    float _155 = -_89;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _159 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].x, _157);
    float _161 = _145 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _163 = _145 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = -_147;
    float _167 = fma(_153, _133, _165);
    float _169 = -_147;
    float _171 = fma(_159, _135, _169);
    float _173 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[32].x, _161);
    float _175 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _177 = -_143;
    float _179 = _177 + _153;
    float _181 = -_145;
    float _183 = fma(_159, _137, _181);
    float _185 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[32].z, _173);
    float _187 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[30].z, _175);
    float _189 = -_145;
    float _191 = fma(_153, _131, _189);
    float _193 = -_143;
    float _195 = _193 + _159;
    float _197 = _185 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _201 = _179 * _171;
    float _203 = _191 * _195;
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _207 = _197 + _205;
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _211 = _199 + _209;
    float _213 = -_201;
    float _215 = fma(_167, _195, _213);
    float _217 = _167 * _183;
    float _219 = _207 * _207;
    float _221 = -_203;
    float _223 = fma(_179, _183, _221);
    float _225 = _215 * _215;
    float _227 = -_217;
    float _229 = fma(_191, _171, _227);
    float _231 = fma(_211, _211, _219);
    float _233 = _145 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _235 = fma(_223, _223, _225);
    float _237 = sqrt(_231);
    float _239 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[31].x, _233);
    float _241 = fma(_229, _229, _235);
    float _243 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[31].z, _239);
    float _245 = rsqrt(_241);
    float _247 = _243 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _251 = _237 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _253 = _223 * _245;
    float _255 = _215 * _245;
    float _257 = _229 * _245;
    bool _259 = !_251;
    float _261 = _247;
    float _263 = _199;
    float _265 = _197;
    if (!_259)
    {
        float _267 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _269 = _237 + _267;
        float _271 = _247 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _273 = rsqrt(_231);
        float _275 = -_247;
        float _277 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _279 = _275 + _277;
        float _281 = abs(_271);
        float _283 = abs(_269);
        float _285 = precise::max(_281, _283);
        float _287 = _279 * _279;
        bool _289 = _285 >= 16.0;
        float _291 = _211 * _273;
        float _293 = _207 * _273;
        float _295 = -_211;
        float _297 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[41].z, _295);
        float _299 = -_207;
        float _301 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[41].z, _299);
        float _303 = _269;
        float _305 = _271;
        int _308 = as_type<int>(_301);
        if (_289)
        {
            float _310 = _269 * 0.0625;
            _303 = _310;
        }
        float _312 = _303;
        if (_289)
        {
            float _314 = _271 * 0.0625;
            _305 = _314;
        }
        float _316 = _305;
        float _318 = fma(_297, _297, _287);
        float _320 = abs(_312);
        bool _322 = _320 != 0.0;
        bool _324 = isnan(_320);
        bool _326 = _322 || _324;
        bool _328 = isnan(0.0);
        bool _330 = _326 || _328;
        float _332 = fma(_301, _301, _318);
        float _334 = abs(_316);
        bool _336 = _334 == 0.0;
        float _338 = abs(_316);
        bool _340 = _338 == 0.0;
        bool _342 = !_330;
        bool _344 = _340 && _342;
        float _346 = sqrt(_332);
        bool _348 = false;
        if (_344)
        {
            bool _350 = as_type<int>(_316) >= 0;
            _348 = _350;
        }
        bool _352 = _348;
        int _354 = _352 ? (-1) : 0;
        if (_344)
        {
            int _356 = _352 ? 0 : 1078530011;
            _308 = _356;
        }
        int _358 = _308;
        int _360 = _358;
        if (_344)
        {
            int _362 = int(0x80000000) & as_type<int>(_312);
            int _364 = _358 | _362;
            _360 = _364;
        }
        int _366 = _360;
        bool _368 = !_330;
        bool _370 = _368 && _336;
        int _372 = _366;
        float _374 = as_type<float>(_366);
        if (!_370)
        {
            float _376 = abs(_312);
            bool _378 = _376 != as_type<float>(0x7f800000u /* inf */);
            bool _380 = isnan(_376);
            bool _382 = _378 || _380;
            bool _384 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _386 = _382 || _384;
            float _388 = abs(_316);
            bool _390 = _388 == as_type<float>(0x7f800000u /* inf */);
            float _392 = abs(_316);
            bool _394 = _392 == as_type<float>(0x7f800000u /* inf */);
            bool _396 = !_386;
            bool _398 = _394 && _396;
            if (_398)
            {
                bool _400 = as_type<int>(_316) >= 0;
                _354 = _400 ? (-1) : 0;
            }
            int _402 = _354;
            if (_398)
            {
                _372 = 1075235812;
            }
            int _404 = _372;
            int _406 = _404;
            if (_398)
            {
                int _408 = ~_402;
                int _410 = (_408 != 0) ? _404 : 1061752795;
                _406 = _410;
            }
            int _412 = _406;
            float _414 = as_type<float>(_412);
            if (_398)
            {
                int _416 = int(0x80000000) & as_type<int>(_312);
                int _418 = _412 | _416;
                _414 = as_type<float>(_418);
            }
            float _420 = _414;
            bool _422 = !_386;
            bool _424 = _422 && _390;
            _374 = _420;
            if (!_424)
            {
                float _426 = abs(_312);
                float _428 = abs(_316);
                float _430 = precise::max(_426, _428);
                float _432 = abs(_312);
                float _434 = abs(_316);
                float _436 = precise::min(_432, _434);
                float _438 = 1.0 / _430;
                float _440 = abs(_312);
                float _442 = abs(_316);
                bool _444 = _440 > _442;
                bool _446 = as_type<int>(_316) >= 0;
                float _448 = _436 * _438;
                float _450 = abs(_312);
                float _452 = abs(_316);
                float _454 = _450 + _452;
                int _456 = as_type<int>(_312) & int(0x80000000);
                float _458 = _448 * _448;
                bool _460 = _454 > as_type<float>(0x7f800000u /* inf */);
                bool _462 = isnan(_454);
                bool _464 = _460 || _462;
                bool _466 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _468 = _464 || _466;
                float _470 = _458 + 11.33538818359375;
                float _472 = fma(_458, _470, 28.84246826171875);
                float _474 = fma(_458, _472, 19.6966705322265625);
                float _476 = fma(_458, -0.82336294651031494140625, -5.674867153167724609375);
                float _478 = fma(_458, _476, -6.565555095672607421875);
                float _480 = 1.0 / _474;
                float _482 = _458 * _478;
                float _484 = _448 * _482;
                float _486 = fma(_484, _480, _448);
                float _488 = _486;
                _374 = _454;
                if (_444)
                {
                    float _490 = -_486;
                    float _492 = _490 + 1.57079637050628662109375;
                    _488 = _492;
                }
                float _494 = _488;
                int _496 = as_type<int>(_494);
                if (!_446)
                {
                    float _498 = -_494;
                    float _500 = _498 + 3.1415927410125732421875;
                    _496 = as_type<int>(_500);
                }
                int _502 = _496;
                if (!_468)
                {
                    int _504 = _456 | _502;
                    _374 = as_type<float>(_504);
                }
            }
        }
        float _506 = _374;
        float _508 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _510 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _512 = _346 + _510;
        float _514 = fma(_291, _508, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _516 = fma(_293, _508, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _261 = _512;
        _263 = _514;
        _265 = _516;
    }
    float _518 = _261;
    float _520 = _263;
    float _522 = _265;
    float _524 = _255 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _526 = _518 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _528 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[35].x, _524);
    float _530 = fma(_520, (*spvDescriptorSet0.fp_c5)._m0[101].x, _526);
    float _532 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[35].z, _528);
    float _534 = fma(_522, (*spvDescriptorSet0.fp_c5)._m0[101].z, _530);
    float _536 = -_532;
    float _538 = fma(_536, _532, 1.0);
    float _540 = -_532;
    float _542 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[35].z, _257);
    float _544 = _518 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _546 = _534 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _548 = _538 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _550 = -_532;
    float _552 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[35].y, _255);
    float _554 = fma(_520, (*spvDescriptorSet0.fp_c5)._m0[102].x, _544);
    float _556 = -_532;
    float _558 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[35].x, _253);
    float _560 = fma(_542, _548, _143);
    float _562 = fma(_552, _548, _145);
    float _564 = fma(_522, (*spvDescriptorSet0.fp_c5)._m0[102].z, _554);
    float _566 = fma(_558, _548, _147);
    float _568 = -_560;
    bool _570 = _568 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _572 = float(_570);
    float _574 = _564 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _576 = -_560;
    bool _578 = _576 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _580 = float(_578);
    float _582 = trunc(_574);
    int _584 = int(_582);
    float _586 = _572 + _580;
    float _588 = precise::min(_586, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _590 = trunc(_546);
    int _592 = int(_590);
    float _594 = trunc(_588);
    int _596 = int(_594);
    int _598 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _600 = _584 + _598;
    int _602 = _600 + 1;
    int _604 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _606 = _592 + _604;
    int _608 = _606 + 1;
    bool _610 = _608 >= 0;
    bool _612 = _608 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _614 = !_610;
    bool _616 = _612 || _614;
    int _618 = _596 << 6;
    bool _620 = _602 < 0;
    bool _622 = _620 || _616;
    int _624 = _618 + 48;
    uint _627 = uint(int(uint(_624) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.fp_c3)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.fp_c3)._m0[int(_637)][_639];
    bool _643 = _602 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _645 = _643 || _622;
    int _647 = _618 + 56;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.fp_c3)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = _608;
    float _667 = _546;
    if (!_645)
    {
        int _669 = _602 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _671 = _669 + _608;
        _665 = _671;
    }
    int _673 = _665;
    uint _675 = uint(int(uint(_618) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = int(_675) + 1;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    int _687 = _683 & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    float _691 = _147;
    if (!_645)
    {
        float _693 = floor(_546);
        _691 = _693;
    }
    float _695 = _691;
    int _697 = 0;
    if (!_645)
    {
        int _699 = _673 << 2;
        _697 = _699;
    }
    int _701 = _697;
    int _703 = 0;
    int _705 = _701;
    if (!_645)
    {
        int _707 = _673 >> 2;
        _703 = _707;
    }
    int _709 = _703;
    int _711 = _709;
    if (!_645)
    {
        int _713 = 12 & _701;
        _705 = _713;
    }
    int _715 = _705;
    int _717 = _618 + 16;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    uint _721 = uint(int(uint(int(_719)) >> uint(2)));
    int _723 = int(_719) & 3;
    float _725 = (*spvDescriptorSet0.fp_c3)._m0[int(_721)][_723];
    int _727 = int(_719) + 1;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    int _731 = _727 & 3;
    float _733 = (*spvDescriptorSet0.fp_c3)._m0[int(_729)][_731];
    float _735 = _558;
    if (!_645)
    {
        float _737 = floor(_574);
        _735 = _737;
    }
    float _739 = _735;
    if (!_645)
    {
        int _741 = _709 << 4;
        int _743 = _741 + _715;
        _711 = _743;
    }
    int _745 = _711;
    int _747 = _618 + 32;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.fp_c3)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.fp_c3)._m0[int(_759)][_761];
    if (!_645)
    {
        float _765 = -_695;
        float _767 = _546 + _765;
        _667 = _767;
    }
    float _769 = _667;
    float _771 = as_type<float>(_715);
    if (!_645)
    {
        uint _773 = uint(int(uint(_745) >> uint(2)));
        uint _775 = uint(int(uint(int(_773)) >> uint(2)));
        int _777 = int(_773) & 3;
        float _779 = (*spvDescriptorSet0.fp_c5)._m0[int(_775)][_777];
        _771 = _779;
    }
    float _781 = _771;
    float _783 = _739;
    if (!_645)
    {
        float _785 = -_739;
        float _787 = _574 + _785;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = _562 * _641;
    int _793 = _618 + 8;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    uint _797 = uint(int(uint(int(_795)) >> uint(2)));
    int _799 = int(_795) & 3;
    float _801 = (*spvDescriptorSet0.fp_c3)._m0[int(_797)][_799];
    int _803 = int(_795) + 1;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    int _807 = _803 & 3;
    float _809 = (*spvDescriptorSet0.fp_c3)._m0[int(_805)][_807];
    float _811 = fma(_566, _633, _791);
    float _813 = fma(_560, _655, _811);
    int _815 = _618 + 24;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.fp_c3)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.fp_c3)._m0[int(_827)][_829];
    float _833 = _813 + _663;
    float _835 = _562 * _689;
    int _837 = _618 + 40;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.fp_c3)._m0[int(_841)][_843];
    int _847 = int(_839) + 1;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    int _851 = _847 & 3;
    float _853 = (*spvDescriptorSet0.fp_c3)._m0[int(_849)][_851];
    float _855 = 1.0 / _833;
    float _857 = fma(_566, _681, _835);
    float _859 = _562 * _733;
    float _861 = rint(_588);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    uint _867 = clamp(_865, 0u, 65535u);
    float _869 = fma(_566, _725, _859);
    float _871 = _562 * _763;
    float _873 = fma(_566, _755, _871);
    float _875 = _781;
    if (!_645)
    {
        float _877 = rint(_781);
        float _879 = precise::max(_877, 0.0);
        uint _881 = uint(_879);
        uint _883 = clamp(_881, 0u, 65535u);
        _875 = as_type<float>(_883);
    }
    float _885 = _875;
    float _887 = fma(_560, _801, _857);
    float _889 = _887 + _809;
    float _891 = fma(_560, _823, _869);
    float _893 = _889 * _855;
    float _895 = _891 + _831;
    float _897 = fma(_560, _845, _873);
    float _899 = _897 + _853;
    float _901 = _895 * _855;
    float _903 = _899 * _855;
    float _905 = precise::clamp(_903, 0.0, 1.0);
    float3 _2395 = float3(_893, _901, float(int(_867)));
    float3 _2399 = select(_2395, float3(0.0), isnan(_2395));
    float _907 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2399.xy, uint(rint(_2399.z)), _905);
    float _909 = _769;
    float _911 = _855;
    if (!_645)
    {
        float3 _2413 = float3(_769, _789, float(as_type<int>(_885)));
        float3 _2415 = select(_2413, float3(0.0), isnan(_2413));
        float _913 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2415.xy, uint(rint(_2415.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2415.xy, uint(rint(_2415.z)), level(0.0)).x;
        _909 = _913;
    }
    float _915 = _909;
    float _917 = -_143;
    float _919 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _921 = _917 + _919;
    if (_645)
    {
        _911 = 1.0;
    }
    float _923 = _911;
    float _925 = _923;
    if (!_645)
    {
        int _927 = _673 << 4;
        int _929 = _927 + 1648;
        int _931 = _745 + 8048;
        uint _933 = uint(int(uint(_931) >> uint(2)));
        uint _935 = uint(int(uint(int(_933)) >> uint(2)));
        int _937 = int(_933) & 3;
        float _939 = (*spvDescriptorSet0.fp_c5)._m0[int(_935)][_937];
        uint _941 = uint(int(uint(_929) >> uint(2)));
        uint _943 = uint(int(uint(int(_941)) >> uint(2)));
        int _945 = int(_941) & 3;
        float _947 = (*spvDescriptorSet0.fp_c5)._m0[int(_943)][_945];
        int _949 = int(_941) + 1;
        uint _951 = uint(int(uint(_949) >> uint(2)));
        int _953 = _949 & 3;
        float _955 = (*spvDescriptorSet0.fp_c5)._m0[int(_951)][_953];
        int _957 = _929 + 8;
        uint _959 = uint(int(uint(_957) >> uint(2)));
        uint _961 = uint(int(uint(int(_959)) >> uint(2)));
        int _963 = int(_959) & 3;
        float _965 = (*spvDescriptorSet0.fp_c5)._m0[int(_961)][_963];
        int _967 = int(_959) + 1;
        uint _969 = uint(int(uint(_967) >> uint(2)));
        int _971 = _967 & 3;
        float _973 = (*spvDescriptorSet0.fp_c5)._m0[int(_969)][_971];
        float _975 = _939 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _977 = _518 * _955;
        float _979 = 1.0 / _939;
        float _981 = fma(_520, _947, _977);
        float _983 = fma(_522, _965, _981);
        float _985 = _983 + _973;
        float _987 = precise::clamp(_985, 0.0, 1.0);
        float _989 = -_987;
        float _991 = _989 + _915;
        float _993 = fma(_979, (*spvDescriptorSet0.fp_c3)._m0[39].y, _991);
        float _995 = _975 * _993;
        float _997 = exp2(_995);
        float _999 = 0.0 + _997;
        float _1001 = precise::clamp(_999, 0.0, 1.0);
        _925 = _1001;
    }
    float _1003 = _925;
    float _1005 = precise::min(_1003, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1007 = -_143;
    float _1009 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1011 = _1007 + _1009;
    float _1013 = _921 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1015 = precise::clamp(_1013, 0.0, 1.0);
    float _1017 = -_907;
    float _1019 = _1017 + 1.0;
    float _1021 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1023 = precise::clamp(_1021, 0.0, 1.0);
    float _1025 = -_1005;
    float _1027 = _1025 + 1.0;
    float _1029 = fma(_1015, _1019, _907);
    float _1031 = fma(_1023, _1027, _1005);
    out.m_52.x = _1029;
    out.m_52.y = _1031;
    out.m_52.z = 1.0;
    out.m_52.w = 1.0;
    out.m_54.x = 1.0;
    out.m_54.y = 0.5;
    out.m_54.z = 0.5;
    out.m_54.w = 1.0;
    return out;
}

