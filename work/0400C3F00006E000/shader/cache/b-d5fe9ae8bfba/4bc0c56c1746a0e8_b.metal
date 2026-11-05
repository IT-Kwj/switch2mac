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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_ESmplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
    float4 m_60 [[color(1)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _923 = false;
    float _67 = gl_FragCoord.w;
    float _69 = in.m_49.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_49.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float _87 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1187 = float2(_83, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1187, float2(0.0), isnan(_1187))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1187, float2(0.0), isnan(_1187))).x;
    float _91 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1202 = float2(_87, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1202, float2(0.0), isnan(_1202))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1202, float2(0.0), isnan(_1202))).x;
    float2 _1210 = float2(_83, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1210, float2(0.0), isnan(_1210))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1210, float2(0.0), isnan(_1210))).x;
    float _97 = in.m_51.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_51.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_53.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_53.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_55.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_55.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _81 * _101;
    float _135 = _81 * _107;
    float _137 = _81 * _113;
    float _139 = _81 * _119;
    float _141 = _81 * _125;
    float _143 = _81 * _131;
    float _145 = -_89;
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _149 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[41].x, _147);
    float _151 = -_93;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].x, _153);
    float _157 = _149 * _133;
    float _159 = _149 * _135;
    float _161 = _157 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _163 = _157 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = -_159;
    float _167 = fma(_155, _137, _165);
    float _169 = -_157;
    float _171 = fma(_155, _139, _169);
    float _173 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[32].x, _161);
    float _175 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _177 = -_95;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[41].x, _179);
    float _183 = -_149;
    float _185 = _183 + _155;
    float _187 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[32].z, _173);
    float _189 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[30].z, _175);
    float _191 = -_159;
    float _193 = fma(_181, _141, _191);
    float _195 = -_157;
    float _197 = fma(_181, _143, _195);
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _203 = -_149;
    float _205 = _203 + _181;
    float _207 = _185 * _193;
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _211 = _199 + _209;
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _215 = _201 + _213;
    float _217 = _171 * _205;
    float _219 = -_207;
    float _221 = fma(_167, _205, _219);
    float _223 = _211 * _211;
    float _225 = _167 * _197;
    float _227 = -_217;
    float _229 = fma(_185, _197, _227);
    float _231 = _221 * _221;
    float _233 = fma(_215, _215, _223);
    float _235 = -_225;
    float _237 = fma(_171, _193, _235);
    float _239 = _157 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _241 = fma(_229, _229, _231);
    float _243 = sqrt(_233);
    float _245 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[31].x, _239);
    float _247 = fma(_237, _237, _241);
    float _249 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[31].z, _245);
    float _251 = rsqrt(_247);
    float _253 = _249 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _257 = _243 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _259 = _229 * _251;
    float _261 = _221 * _251;
    float _263 = _237 * _251;
    float _265 = _193;
    float _267 = _167;
    float _269 = _251;
    int _272 = as_type<int>(_199);
    float _274 = _149;
    if (!_257)
    {
        _265 = _201;
    }
    float _276 = _265;
    float _278 = _276;
    if (!_257)
    {
        _267 = _199;
    }
    float _280 = _267;
    float _282 = _280;
    if (!_257)
    {
        _269 = _253;
    }
    float _284 = _269;
    bool _286 = !_257;
    float _288 = _284;
    if (!_286)
    {
        float _290 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _292 = _243 + _290;
        float _294 = _253 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _296 = rsqrt(_233);
        float _298 = -_253;
        float _300 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _302 = _298 + _300;
        float _304 = abs(_294);
        float _306 = abs(_292);
        float _308 = precise::max(_304, _306);
        float _310 = _302 * _302;
        bool _312 = _308 >= 16.0;
        float _314 = _215 * _296;
        float _316 = _211 * _296;
        float _318 = -_215;
        float _320 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[41].z, _318);
        float _322 = _292;
        float _324 = _294;
        if (_312)
        {
            float _326 = _292 * 0.0625;
            _322 = _326;
        }
        float _328 = _322;
        if (_312)
        {
            float _330 = _294 * 0.0625;
            _324 = _330;
        }
        float _332 = _324;
        float _334 = -_211;
        float _336 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[41].z, _334);
        float _338 = fma(_320, _320, _310);
        float _340 = abs(_328);
        bool _342 = _340 != 0.0;
        bool _344 = isnan(_340);
        bool _346 = _342 || _344;
        bool _348 = isnan(0.0);
        bool _350 = _346 || _348;
        float _352 = fma(_336, _336, _338);
        float _354 = abs(_332);
        bool _356 = _354 == 0.0;
        float _358 = abs(_332);
        bool _360 = _358 == 0.0;
        bool _362 = !_350;
        bool _364 = _360 && _362;
        float _366 = sqrt(_352);
        bool _368 = false;
        float _370 = _336;
        int _372 = as_type<int>(_352);
        if (_364)
        {
            bool _374 = as_type<int>(_332) >= 0;
            _368 = _374;
        }
        bool _376 = _368;
        int _378 = _376 ? (-1) : 0;
        if (_364)
        {
            int _380 = _376 ? 0 : 1078530011;
            _272 = _380;
        }
        int _382 = _272;
        if (_364)
        {
            int _384 = int(0x80000000) & as_type<int>(_328);
            int _386 = _382 | _384;
            _370 = as_type<float>(_386);
        }
        float _388 = _370;
        bool _390 = !_350;
        bool _392 = _390 && _356;
        float _394 = _388;
        float _396 = _388;
        if (!_392)
        {
            float _398 = abs(_328);
            bool _400 = _398 != as_type<float>(0x7f800000u /* inf */);
            bool _402 = isnan(_398);
            bool _404 = _400 || _402;
            bool _406 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _408 = _404 || _406;
            float _410 = abs(_332);
            bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
            float _414 = abs(_332);
            bool _416 = _414 == as_type<float>(0x7f800000u /* inf */);
            bool _418 = !_408;
            bool _420 = _416 && _418;
            if (_420)
            {
                bool _422 = as_type<int>(_332) >= 0;
                _378 = _422 ? (-1) : 0;
            }
            int _424 = _378;
            if (_420)
            {
                _372 = 1075235812;
            }
            int _426 = _372;
            int _428 = _426;
            if (_420)
            {
                int _430 = ~_424;
                int _432 = (_430 != 0) ? _426 : 1061752795;
                _428 = _432;
            }
            int _434 = _428;
            if (_420)
            {
                int _436 = int(0x80000000) & as_type<int>(_328);
                int _438 = _434 | _436;
                _394 = as_type<float>(_438);
            }
            float _440 = _394;
            bool _442 = !_408;
            bool _444 = _442 && _412;
            _396 = _440;
            if (!_444)
            {
                float _446 = abs(_328);
                float _448 = abs(_332);
                float _450 = precise::max(_446, _448);
                float _452 = abs(_328);
                float _454 = abs(_332);
                float _456 = precise::min(_452, _454);
                float _458 = 1.0 / _450;
                float _460 = abs(_328);
                float _462 = abs(_332);
                bool _464 = _460 > _462;
                bool _466 = as_type<int>(_332) >= 0;
                float _468 = abs(_328);
                float _470 = abs(_332);
                float _472 = _468 + _470;
                int _474 = as_type<int>(_328) & int(0x80000000);
                bool _476 = _472 > as_type<float>(0x7f800000u /* inf */);
                bool _478 = isnan(_472);
                bool _480 = _476 || _478;
                bool _482 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _484 = _480 || _482;
                float _486 = _456 * _458;
                float _488 = _486 * _486;
                float _490 = _488 + 11.33538818359375;
                float _492 = fma(_488, _490, 28.84246826171875);
                float _494 = fma(_488, _492, 19.6966705322265625);
                float _496 = fma(_488, -0.82336294651031494140625, -5.674867153167724609375);
                float _498 = fma(_488, _496, -6.565555095672607421875);
                float _500 = 1.0 / _494;
                float _502 = _488 * _498;
                float _504 = _486 * _502;
                float _506 = fma(_504, _500, _486);
                float _508 = _506;
                _396 = _472;
                if (_464)
                {
                    float _510 = -_506;
                    float _512 = _510 + 1.57079637050628662109375;
                    _508 = _512;
                }
                float _514 = _508;
                int _516 = as_type<int>(_514);
                if (!_466)
                {
                    float _518 = -_514;
                    float _520 = _518 + 3.1415927410125732421875;
                    _516 = as_type<int>(_520);
                }
                int _522 = _516;
                if (!_484)
                {
                    int _524 = _474 | _522;
                    _396 = as_type<float>(_524);
                }
            }
        }
        float _526 = _396;
        float _528 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _532 = _366 + _530;
        float _534 = fma(_314, _528, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _536 = fma(_316, _528, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _278 = _534;
        _282 = _536;
        _288 = _532;
    }
    float _538 = _278;
    float _540 = _282;
    float _542 = _288;
    float _544 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float _546 = fma(_540, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1899 = float2(_544, _546);
    float _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1899, float2(0.0), isnan(_1899))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1899, float2(0.0), isnan(_1899))).x;
    float _550 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _552 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float2 _1920 = float2(_544, _546);
    float _554 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1920, float2(0.0), isnan(_1920)), level(_548)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1920, float2(0.0), isnan(_1920)), level(_548)).x;
    float2 _1929 = float2(_550, _552);
    float _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1929, float2(0.0), isnan(_1929))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1929, float2(0.0), isnan(_1929))).x;
    float _558 = _261 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _560 = abs(_149);
    float _562 = log2(_560);
    float _564 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[35].x, _558);
    float _566 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[35].z, _564);
    float _568 = -_566;
    float _570 = fma(_568, _566, 1.0);
    float _572 = -_566;
    float _574 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[35].z, _263);
    float _576 = -_566;
    float _578 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[35].y, _261);
    float _580 = -_566;
    float _582 = fma(_580, (*spvDescriptorSet0.fp_c3)._m0[35].x, _259);
    float _584 = _570 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _586 = _562 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _588 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _590 = fma(_574, _584, _149);
    float _592 = fma(_578, _584, _157);
    float _594 = fma(_582, _584, _159);
    float _596 = exp2(_586);
    float _598 = precise::max(0.0, _588);
    float _600 = -_590;
    bool _602 = _600 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _604 = float(_602);
    float _606 = -_590;
    bool _608 = _606 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _610 = float(_608);
    float _612 = _604 + _610;
    float _614 = precise::min(_612, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _616 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float _620 = trunc(_614);
    int _622 = int(_620);
    float _624 = fma(_618, -2.0, 3.0);
    float _626 = _618 * _618;
    float _628 = _626 * _624;
    float _630 = -_628;
    float _632 = _630 + 1.0;
    float _634 = fma(_632, (*spvDescriptorSet0.fp_c3)._m0[44].w, _628);
    int _636 = _622 << 6;
    float _638 = _634 * _598;
    bool _640 = _622 != 0;
    int _642 = _636 + 48;
    uint _645 = uint(int(uint(_642) >> uint(2)));
    uint _647 = uint(int(uint(int(_645)) >> uint(2)));
    int _649 = int(_645) & 3;
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[int(_647)][_649];
    int _653 = int(_645) + 1;
    uint _655 = uint(int(uint(_653) >> uint(2)));
    int _657 = _653 & 3;
    float _659 = (*spvDescriptorSet0.fp_c3)._m0[int(_655)][_657];
    uint _661 = uint(int(uint(_636) >> uint(2)));
    uint _663 = uint(int(uint(int(_661)) >> uint(2)));
    int _665 = int(_661) & 3;
    float _667 = (*spvDescriptorSet0.fp_c3)._m0[int(_663)][_665];
    int _669 = int(_661) + 1;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    int _673 = _669 & 3;
    float _675 = (*spvDescriptorSet0.fp_c3)._m0[int(_671)][_673];
    int _677 = _636 + 16;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    uint _681 = uint(int(uint(int(_679)) >> uint(2)));
    int _683 = int(_679) & 3;
    float _685 = (*spvDescriptorSet0.fp_c3)._m0[int(_681)][_683];
    int _687 = int(_679) + 1;
    uint _689 = uint(int(uint(_687) >> uint(2)));
    int _691 = _687 & 3;
    float _693 = (*spvDescriptorSet0.fp_c3)._m0[int(_689)][_691];
    int _695 = _636 + 32;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    uint _699 = uint(int(uint(int(_697)) >> uint(2)));
    int _701 = int(_697) & 3;
    float _703 = (*spvDescriptorSet0.fp_c3)._m0[int(_699)][_701];
    int _705 = int(_697) + 1;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    int _709 = _705 & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    int _713 = _636 + 56;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    uint _717 = uint(int(uint(int(_715)) >> uint(2)));
    int _719 = int(_715) & 3;
    float _721 = (*spvDescriptorSet0.fp_c3)._m0[int(_717)][_719];
    int _723 = int(_715) + 1;
    uint _725 = uint(int(uint(_723) >> uint(2)));
    int _727 = _723 & 3;
    float _729 = (*spvDescriptorSet0.fp_c3)._m0[int(_725)][_727];
    int _731 = _636 + 8;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    uint _735 = uint(int(uint(int(_733)) >> uint(2)));
    int _737 = int(_733) & 3;
    float _739 = (*spvDescriptorSet0.fp_c3)._m0[int(_735)][_737];
    int _741 = int(_733) + 1;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    int _745 = _741 & 3;
    float _747 = (*spvDescriptorSet0.fp_c3)._m0[int(_743)][_745];
    int _749 = _636 + 24;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    uint _753 = uint(int(uint(int(_751)) >> uint(2)));
    int _755 = int(_751) & 3;
    float _757 = (*spvDescriptorSet0.fp_c3)._m0[int(_753)][_755];
    int _759 = int(_751) + 1;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    int _763 = _759 & 3;
    float _765 = (*spvDescriptorSet0.fp_c3)._m0[int(_761)][_763];
    float _767 = _592 * _659;
    float _769 = fma(_594, _651, _767);
    int _771 = _636 + 40;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    uint _775 = uint(int(uint(int(_773)) >> uint(2)));
    int _777 = int(_773) & 3;
    float _779 = (*spvDescriptorSet0.fp_c3)._m0[int(_775)][_777];
    int _781 = int(_773) + 1;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    int _785 = _781 & 3;
    float _787 = (*spvDescriptorSet0.fp_c3)._m0[int(_783)][_785];
    float _789 = _592 * _675;
    float _791 = fma(_594, _667, _789);
    float _793 = _592 * _693;
    float _795 = fma(_594, _685, _793);
    float _797 = _592 * _711;
    float _799 = fma(_594, _703, _797);
    bool _801 = _149 >= (-8000.0);
    bool _803 = isnan(_149);
    bool _805 = _801 || _803;
    bool _807 = isnan(-8000.0);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = fma(_590, _721, _769);
    float _815 = _811 * _638;
    float _817 = _813 + _729;
    float _819 = _815 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _821 = fma(_590, _739, _791);
    float _823 = 1.0 / _817;
    float _825 = fma(_590, _757, _795);
    float _827 = _821 + _747;
    float _829 = _825 + _765;
    float _831 = fma(_590, _779, _799);
    float _833 = _827 * _823;
    float _835 = _829 * _823;
    float _837 = _831 + _787;
    float _839 = abs(_554);
    float _841 = _839 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _843 = -_556;
    float _845 = _843 + 1.0;
    float _847 = -_841;
    float _849 = fma(_811, _847, 1.0);
    float _851 = _845 * _819;
    float _853 = precise::clamp(_851, 0.0, 1.0);
    float _855 = -_853;
    float _857 = fma(_855, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _859 = precise::min(_849, 1.0);
    float _861 = _837 * _823;
    float _863 = precise::clamp(_861, 0.0, 1.0);
    float _865 = precise::min(_859, _857);
    float _921;
    if (!_640)
    {
        float _867 = rint(_614);
        float _869 = precise::max(_867, 0.0);
        uint _871 = uint(_869);
        uint _873 = clamp(_871, 0u, 65535u);
        float _875 = _863 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _877 = fma(_875, 0.5, _835);
        float _879 = fma(_875, 0.5, _833);
        float _881 = fma(_875, -0.5, _833);
        float _883 = fma(_875, -0.5, _835);
        float3 _2475 = float3(_833, _877, float(int(_873)));
        float3 _2479 = select(_2475, float3(0.0), isnan(_2475));
        float _885 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2479.xy, uint(rint(_2479.z)), _863);
        float3 _2488 = float3(_879, _877, float(int(_873)));
        float3 _2490 = select(_2488, float3(0.0), isnan(_2488));
        float _887 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2490.xy, uint(rint(_2490.z)), _863);
        float3 _2499 = float3(_881, _877, float(int(_873)));
        float3 _2501 = select(_2499, float3(0.0), isnan(_2499));
        float _889 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2501.xy, uint(rint(_2501.z)), _863);
        float3 _2510 = float3(_879, _835, float(int(_873)));
        float3 _2512 = select(_2510, float3(0.0), isnan(_2510));
        float _891 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2512.xy, uint(rint(_2512.z)), _863);
        float3 _2521 = float3(_833, _835, float(int(_873)));
        float3 _2523 = select(_2521, float3(0.0), isnan(_2521));
        float _893 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2523.xy, uint(rint(_2523.z)), _863);
        float3 _2532 = float3(_881, _835, float(int(_873)));
        float3 _2534 = select(_2532, float3(0.0), isnan(_2532));
        float _895 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2534.xy, uint(rint(_2534.z)), _863);
        float3 _2543 = float3(_879, _883, float(int(_873)));
        float3 _2545 = select(_2543, float3(0.0), isnan(_2543));
        float _897 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2545.xy, uint(rint(_2545.z)), _863);
        float3 _2554 = float3(_833, _883, float(int(_873)));
        float3 _2556 = select(_2554, float3(0.0), isnan(_2554));
        float _899 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2556.xy, uint(rint(_2556.z)), _863);
        float3 _2565 = float3(_881, _883, float(int(_873)));
        float3 _2567 = select(_2565, float3(0.0), isnan(_2565));
        float _901 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2567.xy, uint(rint(_2567.z)), _863);
        float _903 = _887 + _885;
        float _905 = _903 + _889;
        float _907 = _905 + _891;
        float _909 = _907 + _893;
        float _911 = _909 + _895;
        float _913 = _911 + _897;
        float _915 = _913 + _899;
        float _917 = _915 + _901;
        float _919 = _917 * 0.111111111938953399658203125;
        _921 = _919;
        _923 = true;
    }
    else
    {
        float _925 = rint(_614);
        float _927 = precise::max(_925, 0.0);
        uint _929 = uint(_927);
        uint _931 = clamp(_929, 0u, 65535u);
        float3 _2614 = float3(_833, _835, float(int(_931)));
        float3 _2616 = select(_2614, float3(0.0), isnan(_2614));
        float _933 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2616.xy, uint(rint(_2616.z)), _863);
        _921 = _933;
    }
    _923 = false;
    float _935 = _921;
    float _937 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _939 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _941 = -_149;
    float _943 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _945 = _941 + _943;
    float _947 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _937);
    float _949 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _939);
    float _951 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _947);
    float _953 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _949);
    float _955 = _951 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _957 = _953 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _959 = trunc(_955);
    int _961 = int(_959);
    float _963 = trunc(_957);
    int _965 = int(_963);
    int _967 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _969 = _961 + _967;
    int _971 = _969 + 1;
    bool _973 = _971 >= 0;
    int _975 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _977 = _965 + _975;
    int _979 = _977 + 1;
    float _981 = -_149;
    float _983 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _985 = _981 + _983;
    bool _987 = _971 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _989 = !_973;
    bool _991 = _987 || _989;
    bool _993 = _979 < 0;
    bool _995 = _993 || _991;
    bool _997 = _979 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _999 = _997 || _995;
    if (_999)
    {
        _274 = 1.0;
    }
    float _1001 = _274;
    float _1003 = _1001;
    if (!_999)
    {
        int _1005 = _979 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1007 = _1005 + _971;
        float _1009 = floor(_957);
        int _1011 = _1007 << 2;
        int _1013 = _1007 >> 2;
        int _1015 = 12 & _1011;
        int _1017 = _1013 << 4;
        int _1019 = _1017 + _1015;
        float _1021 = floor(_955);
        uint _1023 = uint(int(uint(_1019) >> uint(2)));
        uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
        int _1027 = int(_1023) & 3;
        float _1029 = (*spvDescriptorSet0.fp_c5)._m0[int(_1025)][_1027];
        float _1031 = -_1009;
        float _1033 = _957 + _1031;
        float _1035 = -_1021;
        float _1037 = _955 + _1035;
        float _1039 = rint(_1029);
        float _1041 = precise::max(_1039, 0.0);
        uint _1043 = uint(_1041);
        uint _1045 = clamp(_1043, 0u, 65535u);
        float3 _2801 = float3(_1037, _1033, float(int(_1045)));
        float3 _2803 = select(_2801, float3(0.0), isnan(_2801));
        float _1047 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2803.xy, uint(rint(_2803.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2803.xy, uint(rint(_2803.z)), level(0.0)).x;
        int _1049 = _1007 << 4;
        int _1051 = _1049 + 1648;
        int _1053 = _1019 + 8048;
        uint _1055 = uint(int(uint(_1053) >> uint(2)));
        uint _1057 = uint(int(uint(int(_1055)) >> uint(2)));
        int _1059 = int(_1055) & 3;
        float _1061 = (*spvDescriptorSet0.fp_c5)._m0[int(_1057)][_1059];
        uint _1063 = uint(int(uint(_1051) >> uint(2)));
        uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
        int _1067 = int(_1063) & 3;
        float _1069 = (*spvDescriptorSet0.fp_c5)._m0[int(_1065)][_1067];
        int _1071 = int(_1063) + 1;
        uint _1073 = uint(int(uint(_1071) >> uint(2)));
        int _1075 = _1071 & 3;
        float _1077 = (*spvDescriptorSet0.fp_c5)._m0[int(_1073)][_1075];
        int _1079 = _1051 + 8;
        uint _1081 = uint(int(uint(_1079) >> uint(2)));
        uint _1083 = uint(int(uint(int(_1081)) >> uint(2)));
        int _1085 = int(_1081) & 3;
        float _1087 = (*spvDescriptorSet0.fp_c5)._m0[int(_1083)][_1085];
        int _1089 = int(_1081) + 1;
        uint _1091 = uint(int(uint(_1089) >> uint(2)));
        int _1093 = _1089 & 3;
        float _1095 = (*spvDescriptorSet0.fp_c5)._m0[int(_1091)][_1093];
        float _1097 = _1061 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1099 = _542 * _1077;
        float _1101 = fma(_538, _1069, _1099);
        float _1103 = 1.0 / _1061;
        float _1105 = fma(_540, _1087, _1101);
        float _1107 = _1105 + _1095;
        float _1109 = precise::clamp(_1107, 0.0, 1.0);
        float _1111 = -_1109;
        float _1113 = _1111 + _1047;
        float _1115 = fma(_1103, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1113);
        float _1117 = _1097 * _1115;
        float _1119 = exp2(_1117);
        float _1121 = 0.0 + _1119;
        float _1123 = precise::clamp(_1121, 0.0, 1.0);
        _1003 = _1123;
    }
    float _1125 = _1003;
    float _1127 = precise::min(_1125, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1129 = _985 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1131 = precise::clamp(_1129, 0.0, 1.0);
    float _1133 = -_935;
    float _1135 = _1133 + 1.0;
    float _1137 = _945 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1139 = precise::clamp(_1137, 0.0, 1.0);
    float _1141 = -_1127;
    float _1143 = _1141 + 1.0;
    float _1145 = fma(_1131, _1135, _935);
    float _1147 = fma(_1139, _1143, _1127);
    out.m_58.x = _1145;
    out.m_58.y = _1147;
    out.m_58.z = 1.0;
    out.m_58.w = _865;
    out.m_60.x = 1.0;
    out.m_60.y = 0.5;
    out.m_60.z = 0.5;
    out.m_60.w = 1.0;
    return out;
}

